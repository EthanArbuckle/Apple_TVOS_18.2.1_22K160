void *docopt::operator<<(void *a1, uint64_t a2)
{
  void *v2;
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  char v22;
  char v23;
  char v24;
  char v25;
  v2 = a1;
  switch(*(_DWORD *)a2)
  {
    case 1:
      sub_183BF7048((int *)a2, 1u);
      if (*(_BYTE *)(a2 + 8)) {
        v4 = "true";
      }
      else {
        v4 = "false";
      }
      if (*(_BYTE *)(a2 + 8)) {
        v5 = 4LL;
      }
      else {
        v5 = 5LL;
      }
      a1 = v2;
      break;
    case 2:
      sub_183BF535C(a2);
      std::ostream::operator<<();
      return v2;
    case 3:
      sub_183BF7048((int *)a2, 3u);
      v22 = 34;
      v6 = sub_183C11E20(v2, (uint64_t)&v22, 1LL);
      v9 = *(void *)(a2 + 8);
      v8 = a2 + 8;
      v7 = v9;
      v10 = *(char *)(v8 + 23);
      if (v10 >= 0) {
        v11 = v8;
      }
      else {
        v11 = v7;
      }
      if (v10 >= 0) {
        v12 = *(unsigned __int8 *)(v8 + 23);
      }
      else {
        v12 = *(void *)(v8 + 8);
      }
      a1 = sub_183C11E20(v6, v11, v12);
      v23 = 34;
      v4 = &v23;
      goto LABEL_30;
    case 4:
      sub_183BF7048((int *)a2, 4u);
      sub_183C11E20(v2, (uint64_t)"[", 1LL);
      v13 = *(void *)(a2 + 8);
      v14 = *(void *)(a2 + 16);
      if (v13 != v14)
      {
        v15 = 1;
        do
        {
          if ((v15 & 1) == 0) {
            sub_183C11E20(v2, (uint64_t)", ", 2LL);
          }
          v24 = 34;
          v16 = sub_183C11E20(v2, (uint64_t)&v24, 1LL);
          v17 = *(char *)(v13 + 23);
          if (v17 >= 0) {
            v18 = v13;
          }
          else {
            v18 = *(void *)v13;
          }
          if (v17 >= 0) {
            v19 = *(unsigned __int8 *)(v13 + 23);
          }
          else {
            v19 = *(void *)(v13 + 8);
          }
          v20 = sub_183C11E20(v16, v18, v19);
          v25 = 34;
          sub_183C11E20(v20, (uint64_t)&v25, 1LL);
          v15 = 0;
          v13 += 24LL;
        }

        while (v13 != v14);
      }

      v4 = "]";
      a1 = v2;
LABEL_30:
      v5 = 1LL;
      break;
    default:
      v4 = "null";
      v5 = 4LL;
      break;
  }

  sub_183C11E20(a1, (uint64_t)v4, v5);
  return v2;
}

uint64_t sub_183BF535C(uint64_t a1)
{
  if (*(_DWORD *)a1 == 3)
  {
    uint64_t result = std::stol((const std::string *)(a1 + 8), &__idx, 10);
    else {
      uint64_t v3 = *(unsigned __int8 *)(a1 + 31);
    }
    if (__idx != v3)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      sub_183BF714C( " contains non-numeric characters.",  (const void **)(a1 + 8),  (void **)&v5.__r_.__value_.__l.__data_);
      std::runtime_error::runtime_error(exception, &v5);
      __cxa_throw(exception, MEMORY[0x1896146E8], MEMORY[0x189614248]);
    }
  }

  else
  {
    sub_183BF7048((int *)a1, 2u);
    return *(void *)(a1 + 8);
  }

  return result;
}

void sub_183BF5430( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if ((v15 & 1) == 0) {
LABEL_6:
    }
      _Unwind_Resume(a1);
  }

  else if (!v15)
  {
    goto LABEL_6;
  }

  __cxa_free_exception(v14);
  goto LABEL_6;
}

void docopt::docopt_parse( uint64_t a1@<X0>, __int128 **a2@<X1>, int a3@<W2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v164 = 0LL;
  int64x2_t v163 = 0uLL;
  int64x2_t v156 = 0uLL;
  __p = 0LL;
  v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
  sub_183BF7C68((void ***)&v184);
  v162 = off_189D37DD0;
  __int128 v160 = 0uLL;
  uint64_t v161 = 0LL;
  sub_183C11CAC(&v184, "usage:");
  sub_183BF8374(a1, (uint64_t *)&v178);
  if (v178 == v179)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "'usage:' (case-insensitive) not found.");
    goto LABEL_186;
  }

  if (0xAAAAAAAAAAAAAAABLL * (((char *)v179 - (char *)v178) >> 3) >= 2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "More than one 'usage:' (case-insensitive).");
LABEL_186:
    exception->__vftable = (std::runtime_error_vtbl *)&unk_189D38C30;
    __cxa_throw( exception,  (struct type_info *)&unk_189D37D60,  (void (*)(void *))std::runtime_error::~runtime_error);
  }

  sub_183BF88A8(a1, (uint64_t *)&v176);
  v9 = v178;
  sub_183C11CAC(&v173, "(");
  int v143 = a4;
  v145 = (char **)a2;
  std::string::size_type v10 = std::string::find(v9, 58, 0LL);
  sub_183C0F5C0(v9, v10 + 1, (uint64_t *)&v184);
  std::string::size_type v11 = v184.__r_.__value_.__r.__words[0];
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v184.__r_.__value_.__l.__size_ - v184.__r_.__value_.__r.__words[0]) >> 3) >= 2)
  {
    for (unint64_t i = 1LL;
          i < 0xAAAAAAAAAAAAAAABLL
            * ((uint64_t)(v184.__r_.__value_.__l.__size_ - v184.__r_.__value_.__r.__words[0]) >> 3);
          ++i)
    {
      v13 = (unsigned __int8 *)(v11 + 24 * i);
      uint64_t v14 = v13[23];
      if ((v14 & 0x80u) == 0LL) {
        uint64_t v15 = v13[23];
      }
      else {
        uint64_t v15 = *((void *)v13 + 1);
      }
      uint64_t v16 = *(unsigned __int8 *)(v11 + 23);
      int v17 = (char)v16;
      if ((v16 & 0x80u) != 0LL) {
        uint64_t v16 = *(void *)(v11 + 8);
      }
      if (v15 != v16) {
        goto LABEL_22;
      }
      if (v17 >= 0) {
        v18 = (unsigned __int8 *)v11;
      }
      else {
        v18 = *(unsigned __int8 **)v11;
      }
      if ((v14 & 0x80) != 0)
      {
      }

      else if (v13[23])
      {
        while (*v13 == *v18)
        {
          ++v13;
          ++v18;
          if (!--v14) {
            goto LABEL_29;
          }
        }

LABEL_22:
        std::string::push_back(&v173, 32);
        std::string::size_type v19 = v184.__r_.__value_.__r.__words[0] + 24 * i;
        int v20 = *(char *)(v19 + 23);
        if (v20 >= 0) {
          v21 = (const std::string::value_type *)(v184.__r_.__value_.__r.__words[0] + 24 * i);
        }
        else {
          v21 = *(const std::string::value_type **)v19;
        }
        if (v20 >= 0) {
          std::string::size_type v22 = *(unsigned __int8 *)(v19 + 23);
        }
        else {
          std::string::size_type v22 = *(void *)(v19 + 8);
        }
        std::string::append(&v173, v21, v22);
        goto LABEL_30;
      }

    *std::string v5 = v2;
    std::string::size_type v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }

  uint64_t v14 = *v6;
  uint64_t v15 = &v5[-*v6];
  uint64_t v16 = (unint64_t)(v15 + 1);
  int v17 = v13 - v14;
  if (2 * v17 > v16) {
    uint64_t v16 = 2 * v17;
  }
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL) {
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    v18 = v16;
  }
  if (v18) {
    v12 = operator new(v18);
  }
  else {
    v12 = 0LL;
  }
  int v20 = &v15[(void)v12];
  v21 = (char *)v12 + v18;
  v15[(void)v12] = v2;
  std::string::size_type v19 = (uint64_t)&v15[(void)v12 + 1];
  if (v5 != (_BYTE *)v14)
  {
    std::string::size_type v29 = &v5[~v14];
    do
    {
      std::string::size_type v30 = *--v5;
      (v29--)[(void)v12] = v30;
    }

    while (v5 != (_BYTE *)v14);
    goto LABEL_45;
  }

    *std::string v5 = v2;
    std::string::size_type v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }

  uint64_t v14 = *v6;
  uint64_t v15 = &v5[-*v6];
  uint64_t v16 = (unint64_t)(v15 + 1);
  int v17 = v13 - v14;
  if (2 * v17 > v16) {
    uint64_t v16 = 2 * v17;
  }
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL) {
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    v18 = v16;
  }
  if (v18) {
    v12 = operator new(v18);
  }
  else {
    v12 = 0LL;
  }
  int v20 = &v15[(void)v12];
  v21 = (char *)v12 + v18;
  v15[(void)v12] = v2;
  std::string::size_type v19 = (uint64_t)&v15[(void)v12 + 1];
  if (v5 != (_BYTE *)v14)
  {
    std::string::size_type v29 = &v5[~v14];
    do
    {
      std::string::size_type v30 = *--v5;
      (v29--)[(void)v12] = v30;
    }

    while (v5 != (_BYTE *)v14);
    goto LABEL_45;
  }

LABEL_29:
      std::string::append(&v173, ") | (");
LABEL_30:
      std::string::size_type v11 = v184.__r_.__value_.__r.__words[0];
    }
  }

  std::string::append(&v173, ")");
  *(void *)&__int128 v171 = &v184;
  sub_183C11DE0((void ***)&v171);
  sub_183C09110((uint64_t)&v173, (uint64_t)&v184);
  sub_183C0936C(&v184, (uint64_t *)&v176, (uint64_t)&v171);
  if (v185 < 0xAAAAAAAAAAAAAAABLL
            * ((uint64_t)(v184.__r_.__value_.__l.__size_ - v184.__r_.__value_.__r.__words[0]) >> 3))
  {
    v131 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_183C097F0(&v184, &v180);
    v132 = std::string::insert(&v180, 0LL, "Unexpected ending: '");
    __int128 v133 = *(_OWORD *)&v132->__r_.__value_.__l.__data_;
    v181.__r_.__value_.__l.__cap_ = v132->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v181.__r_.__value_.__l.__data_ = v133;
    v132->__r_.__value_.__l.__size_ = 0LL;
    v132->__r_.__value_.__l.__cap_ = 0LL;
    v132->__r_.__value_.__r.__words[0] = 0LL;
    v134 = std::string::append(&v181, "'");
    __int128 v135 = *(_OWORD *)&v134->__r_.__value_.__l.__data_;
    *(void *)&v169[16] = v134->__r_.__value_.__l.__cap_;
    *(_OWORD *)v169 = v135;
    v134->__r_.__value_.__l.__size_ = 0LL;
    v134->__r_.__value_.__l.__cap_ = 0LL;
    v134->__r_.__value_.__r.__words[0] = 0LL;
    std::runtime_error::runtime_error(v131, (const std::string *)v169);
    v131->__vftable = (std::runtime_error_vtbl *)&unk_189D38C30;
    __cxa_throw( v131,  (struct type_info *)&unk_189D37D60,  (void (*)(void *))std::runtime_error::~runtime_error);
  }

  uint64_t v23 = v172;
  __int128 v24 = v171;
  uint64_t v172 = 0LL;
  __int128 v171 = 0uLL;
  *(_OWORD *)&v174[8] = v24;
  memset(v169, 0, 24);
  uint64_t v175 = v23;
  *(void *)v174 = off_189D37DD0;
  v181.__r_.__value_.__r.__words[0] = (std::string::size_type)v169;
  sub_183BF7C68((void ***)&v181);
  v181.__r_.__value_.__r.__words[0] = (std::string::size_type)&v171;
  sub_183BF7C68((void ***)&v181);
  *(void *)&__int128 v171 = &v184;
  sub_183C11DE0((void ***)&v171);
  sub_183BF8D98( (void (***)(void **__return_ptr, void, const void *(*)(const void *)))v174,  (uint64_t)&v181);
  sub_183C0F954((uint64_t)&v171, (uint64_t *)v181.__r_.__value_.__l.__data_, (uint64_t *)v181.__r_.__value_.__l.__size_);
  sub_183BF8E54( (void (***)(void **__return_ptr, void, const void *(*)(const void *)))v174,  (uint64_t)&v180);
  std::string::size_type size = v180.__r_.__value_.__l.__size_;
  v26 = (uint64_t *)v180.__r_.__value_.__r.__words[0];
  if (v180.__r_.__value_.__r.__words[0] != v180.__r_.__value_.__l.__size_)
  {
    do
    {
      uint64_t v27 = a1;
      sub_183BF88A8(a1, (uint64_t *)&v173);
      int64x2_t v28 = 0uLL;
      memset(v169, 0, sizeof(v169));
      int v170 = 1065353216;
      std::string::size_type v30 = v173.__r_.__value_.__l.__size_;
      std::string::size_type v29 = v173.__r_.__value_.__r.__words[0];
      if (v173.__r_.__value_.__r.__words[0] == v173.__r_.__value_.__l.__size_) {
        goto LABEL_60;
      }
      do
      {
        v184.__r_.__value_.__r.__words[0] = v29;
        if (!sub_183C0FCA0(&v171, (uint64_t *)&v184))
        {
          v184.__r_.__value_.__r.__words[0] = v29;
          sub_183C0FDB0((uint64_t)v169, (uint64_t *)&v184, &v184);
        }

        v29 += 120LL;
      }

      while (v29 != v30);
      v31 = *(void **)&v169[16];
      v168[0] = 0LL;
      int64x2_t v28 = 0uLL;
      int64x2_t v167 = 0u;
      if (!*(void *)&v169[16])
      {
LABEL_60:
        uint64_t v51 = 0LL;
      }

      else
      {
        do
        {
          sub_183C0D710(v31[2], &v182);
          __int128 v32 = v182;
          __int128 v183 = v182;
          __int128 v182 = 0uLL;
          uint64_t v33 = v167.i64[1];
          if (v167.i64[1] >= v168[0])
          {
            __int128 v148 = v32;
            uint64_t v34 = (v167.i64[1] - v167.i64[0]) >> 4;
            unint64_t v35 = v34 + 1;
            uint64_t v36 = v168[0] - v167.i64[0];
            if ((v168[0] - v167.i64[0]) >> 3 > v35) {
              unint64_t v35 = v36 >> 3;
            }
            else {
              unint64_t v37 = v35;
            }
            v186 = v168;
            v38 = (char *)sub_183BF7BDC((uint64_t)v168, v37);
            v40 = &v38[16 * v34];
            *(_OWORD *)v40 = v148;
            __int128 v183 = 0uLL;
            v41 = (void *)v167.i64[1];
            v42 = (void *)v167.i64[0];
            if (v167.i64[1] == v167.i64[0])
            {
              int64x2_t v45 = vdupq_n_s64(v167.u64[1]);
              v43 = &v38[16 * v34];
            }

            else
            {
              v43 = &v38[16 * v34];
              do
              {
                __int128 v44 = *((_OWORD *)v41 - 1);
                v41 -= 2;
                *((_OWORD *)v43 - 1) = v44;
                v43 -= 16;
                void *v41 = 0LL;
                v41[1] = 0LL;
              }

              while (v41 != v42);
              int64x2_t v45 = v167;
            }

            v46 = v40 + 16;
            v167.i64[0] = (uint64_t)v43;
            v167.i64[1] = (uint64_t)(v40 + 16);
            *(int64x2_t *)&v184.__r_.__value_.__r.__words[1] = v45;
            unint64_t v47 = v168[0];
            v168[0] = &v38[16 * v39];
            unint64_t v185 = v47;
            v184.__r_.__value_.__r.__words[0] = v45.i64[0];
            sub_183C08050((uint64_t)&v184);
            v48 = (std::__shared_weak_count *)*((void *)&v182 + 1);
            v167.i64[1] = (uint64_t)v46;
            if (*((void *)&v182 + 1))
            {
              v49 = (unint64_t *)(*((void *)&v182 + 1) + 8LL);
              do
                unint64_t v50 = __ldaxr(v49);
              while (__stlxr(v50 - 1, v49));
              if (!v50)
              {
                ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
                std::__shared_weak_count::__release_weak(v48);
              }
            }
          }

          else
          {
            *(_OWORD *)v167.i64[1] = v32;
            v167.i64[1] = v33 + 16;
          }

          v31 = (void *)*v31;
        }

        while (v31);
        int64x2_t v28 = v167;
        uint64_t v51 = v168[0];
      }

      uint64_t v52 = *v26++;
      int64x2_t v165 = v28;
      uint64_t v166 = v51;
      v168[0] = 0LL;
      int64x2_t v167 = 0uLL;
      sub_183BF7D78((void **)(v52 + 8));
      *(int64x2_t *)(v52 + 8) = v165;
      *(void *)(v52 + 24) = v166;
      int64x2_t v165 = 0uLL;
      uint64_t v166 = 0LL;
      v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&v165;
      sub_183BF7C68((void ***)&v184);
      v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&v167;
      sub_183BF7C68((void ***)&v184);
      sub_183C0FC24((uint64_t)v169);
      v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&v173;
      sub_183C120C0((void ***)&v184);
      a1 = v27;
    }

    while (v26 != (uint64_t *)size);
    v26 = (uint64_t *)v180.__r_.__value_.__r.__words[0];
  }

  if (v26)
  {
    v180.__r_.__value_.__l.__size_ = (std::string::size_type)v26;
    operator delete(v26);
  }

  int64x2_t v156 = *(int64x2_t *)&v174[8];
  uint64_t v157 = v175;
  *(void *)&v174[16] = 0LL;
  uint64_t v175 = 0LL;
  *(void *)&v174[8] = 0LL;
  __p = off_189D37DD0;
  __int128 v158 = v176;
  uint64_t v159 = v177;
  __int128 v176 = 0uLL;
  uint64_t v177 = 0LL;
  sub_183C0FC24((uint64_t)&v171);
  if (v181.__r_.__value_.__r.__words[0])
  {
    v181.__r_.__value_.__l.__size_ = v181.__r_.__value_.__r.__words[0];
    operator delete(v181.__r_.__value_.__l.__data_);
  }

  *(void *)v174 = off_189D37E70;
  v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&v174[8];
  sub_183BF7C68((void ***)&v184);
  v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&v176;
  sub_183C120C0((void ***)&v184);
  v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&v178;
  sub_183C11DE0((void ***)&v184);
  sub_183BF7D78((void **)&v163);
  int64x2_t v163 = v156;
  uint64_t v164 = v157;
  uint64_t v157 = 0LL;
  int64x2_t v156 = 0uLL;
  sub_183C12144((void **)&v160);
  __int128 v160 = v158;
  uint64_t v161 = v159;
  uint64_t v159 = 0LL;
  __int128 v158 = 0uLL;
  v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&v158;
  sub_183C120C0((void ***)&v184);
  __p = off_189D37E70;
  v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&v156;
  sub_183BF7C68((void ***)&v184);
  __int128 v171 = 0uLL;
  uint64_t v172 = 0LL;
  __int128 v150 = 0uLL;
  uint64_t v149 = 0LL;
  sub_183C11D5C((char *)&v149, *a2, a2[1], 0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3));
  __int128 v152 = v150;
  uint64_t v151 = v149;
  uint64_t v149 = 0LL;
  __int128 v150 = 0uLL;
  unint64_t v153 = 0LL;
  char v154 = 1;
  memset(v169, 0, 24);
  if ((void)v152 != v151)
  {
    do
    {
      v53 = sub_183C0ABC0(&v151);
      v54 = v53;
      int v55 = *((char *)v53 + 23);
      if (v55 < 0)
      {
        if (v53[1] != 2) {
          goto LABEL_74;
        }
        v56 = (_WORD *)*v53;
      }

      else
      {
        v56 = v53;
        if (v55 != 2) {
          goto LABEL_74;
        }
      }

      if (*v56 == 11565)
      {
        while (v153 < 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v152 - v151) >> 3))
        {
          sub_183C0ACC8(&v151, (__n128 *)&v184);
          sub_183C10008((char *)&unk_183C1629A, (uint64_t)&v184, v174);
          uint64_t v61 = *(void *)&v169[8];
          if (*(void *)&v169[8] >= *(void *)&v169[16])
          {
            uint64_t v62 = (uint64_t)(*(void *)&v169[8] - *(void *)v169) >> 4;
            unint64_t v63 = v62 + 1;
            uint64_t v64 = *(void *)&v169[16] - *(void *)v169;
            else {
              unint64_t v65 = v63;
            }
            *(void *)&__int128 v158 = &v169[16];
            v66 = (char *)sub_183BF7BDC((uint64_t)&v169[16], v65);
            v68 = &v66[16 * v62];
            *(_OWORD *)v68 = *(_OWORD *)v174;
            *(void *)v174 = 0LL;
            *(void *)&v174[8] = 0LL;
            v69 = *(void **)&v169[8];
            v70 = *(void **)v169;
            if (*(void *)&v169[8] == *(void *)v169)
            {
              int64x2_t v73 = vdupq_n_s64(*(unint64_t *)&v169[8]);
              v71 = &v66[16 * v62];
            }

            else
            {
              v71 = &v66[16 * v62];
              do
              {
                __int128 v72 = *((_OWORD *)v69 - 1);
                v69 -= 2;
                *((_OWORD *)v71 - 1) = v72;
                v71 -= 16;
                void *v69 = 0LL;
                v69[1] = 0LL;
              }

              while (v69 != v70);
              int64x2_t v73 = *(int64x2_t *)v169;
            }

            v74 = v68 + 16;
            *(void *)v169 = v71;
            *(void *)&v169[8] = v68 + 16;
            int64x2_t v156 = v73;
            uint64_t v75 = *(void *)&v169[16];
            *(void *)&v169[16] = &v66[16 * v67];
            uint64_t v157 = v75;
            __p = (void *)v73.i64[0];
            sub_183C08050((uint64_t)&__p);
            v76 = *(std::__shared_weak_count **)&v174[8];
            *(void *)&v169[8] = v74;
            if (*(void *)&v174[8])
            {
              v77 = (unint64_t *)(*(void *)&v174[8] + 8LL);
              do
                unint64_t v78 = __ldaxr(v77);
              while (__stlxr(v78 - 1, v77));
              if (!v78)
              {
                ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
                std::__shared_weak_count::__release_weak(v76);
              }
            }
          }

          else
          {
            **(_OWORD **)&v169[8] = *(_OWORD *)v174;
            *(void *)v174 = 0LL;
            *(void *)&v174[8] = 0LL;
            *(void *)&v169[8] = v61 + 16;
          }
        }

        continue;
      }

    sub_183BFBCF8();
  }

  if (v6 == 40)
  {
    if (a2 + 1 == a3) {
      goto LABEL_30;
    }
    if (a2 + 2 != a3 && a2[1] == 63 && a2[2] == 58)
    {
      std::string::size_type v11 = (_DWORD *)(a1 + 36);
      ++*(_DWORD *)(a1 + 36);
      v12 = (unsigned __int8 *)sub_183C03AF8(a1, a2 + 3, a3);
      if (v12 == a3) {
        goto LABEL_30;
      }
      uint64_t v3 = v12;
      if (*v12 != 41) {
        goto LABEL_30;
      }
    }

    else
    {
      sub_183BFBC38((void *)a1);
      v13 = *(_DWORD *)(a1 + 28);
      std::string::size_type v11 = (_DWORD *)(a1 + 36);
      ++*(_DWORD *)(a1 + 36);
      uint64_t v14 = (unsigned __int8 *)sub_183C03AF8(a1, v3 + 1, a3);
      if (v14 == a3 || (uint64_t v3 = v14, *v14 != 41)) {
LABEL_30:
      }
        sub_183BFA408();
      sub_183BFBC9C((void *)a1, v13);
    }

    --*v11;
    return ++v3;
  }

  if (v6 == 46)
  {
    v7 = operator new(0x10uLL);
    v8 = *(void *)(a1 + 56);
    v9 = *(void *)(v8 + 8);
    *v7 = &unk_189D38168;
    v7[1] = v9;
    *(void *)(v8 + 8) = v7;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    return ++v3;
  }

  return sub_183BFBD44(a1, a2, a3);
}

  uint64_t v23 = (unint64_t *)&v5->__shared_owners_;
  do
    __int128 v24 = __ldaxr(v23);
  while (__stlxr(v24 - 1, v23));
  if (!v24)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }

  return v22;
}

LABEL_74:
      sub_183C11CAC(&__p, "--");
      BOOL v57 = sub_183C061B4((const void **)v54, &__p);
      BOOL v58 = v57;
      if (v156.i8[15] < 0)
      {
        operator delete(__p);
        if (v58)
        {
LABEL_76:
          sub_183C0AD28((uint64_t)&v151, (uint64_t *)&v160, (char **)&__p);
          v60 = (char *)__p;
          v59 = (char *)v156.i64[0];
          while (v60 != v59)
          {
            sub_183C0CE4C((char **)v169, (uint64_t)v60);
            v60 += 16;
          }

          goto LABEL_108;
        }
      }

      else if (v57)
      {
        goto LABEL_76;
      }

      int v79 = *((char *)v54 + 23);
      if (v79 < 0)
      {
        if (*(_BYTE *)*v54 != 45 || v54[1] == 1)
        {
LABEL_116:
          if (a5)
          {
            while (v153 < 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v152 - v151) >> 3))
            {
              sub_183C0ACC8(&v151, (__n128 *)&v184);
              sub_183C10008((char *)&unk_183C1629A, (uint64_t)&v184, v174);
              uint64_t v83 = *(void *)&v169[8];
              if (*(void *)&v169[8] >= *(void *)&v169[16])
              {
                uint64_t v84 = (uint64_t)(*(void *)&v169[8] - *(void *)v169) >> 4;
                unint64_t v85 = v84 + 1;
                uint64_t v86 = *(void *)&v169[16] - *(void *)v169;
                else {
                  unint64_t v87 = v85;
                }
                *(void *)&__int128 v158 = &v169[16];
                v88 = (char *)sub_183BF7BDC((uint64_t)&v169[16], v87);
                v90 = &v88[16 * v84];
                *(_OWORD *)v90 = *(_OWORD *)v174;
                *(void *)v174 = 0LL;
                *(void *)&v174[8] = 0LL;
                v91 = *(void **)&v169[8];
                v92 = *(void **)v169;
                if (*(void *)&v169[8] == *(void *)v169)
                {
                  int64x2_t v95 = vdupq_n_s64(*(unint64_t *)&v169[8]);
                  v93 = &v88[16 * v84];
                }

                else
                {
                  v93 = &v88[16 * v84];
                  do
                  {
                    __int128 v94 = *((_OWORD *)v91 - 1);
                    v91 -= 2;
                    *((_OWORD *)v93 - 1) = v94;
                    v93 -= 16;
                    void *v91 = 0LL;
                    v91[1] = 0LL;
                  }

                  while (v91 != v92);
                  int64x2_t v95 = *(int64x2_t *)v169;
                }

                v96 = v90 + 16;
                *(void *)v169 = v93;
                *(void *)&v169[8] = v90 + 16;
                int64x2_t v156 = v95;
                uint64_t v97 = *(void *)&v169[16];
                *(void *)&v169[16] = &v88[16 * v89];
                uint64_t v157 = v97;
                __p = (void *)v95.i64[0];
                sub_183C08050((uint64_t)&__p);
                v98 = *(std::__shared_weak_count **)&v174[8];
                *(void *)&v169[8] = v96;
                if (*(void *)&v174[8])
                {
                  v99 = (unint64_t *)(*(void *)&v174[8] + 8LL);
                  do
                    unint64_t v100 = __ldaxr(v99);
                  while (__stlxr(v100 - 1, v99));
                  if (!v100)
                  {
                    ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
                    std::__shared_weak_count::__release_weak(v98);
                  }
                }
              }

              else
              {
                **(_OWORD **)&v169[8] = *(_OWORD *)v174;
                *(void *)v174 = 0LL;
                *(void *)&v174[8] = 0LL;
                *(void *)&v169[8] = v83 + 16;
              }
            }
          }

          else
          {
            sub_183C0ACC8(&v151, (__n128 *)&v184);
            sub_183C10008((char *)&unk_183C1629A, (uint64_t)&v184, v174);
            uint64_t v101 = *(void *)&v169[8];
            if (*(void *)&v169[8] >= *(void *)&v169[16])
            {
              uint64_t v102 = (uint64_t)(*(void *)&v169[8] - *(void *)v169) >> 4;
              unint64_t v103 = v102 + 1;
              uint64_t v104 = *(void *)&v169[16] - *(void *)v169;
              else {
                unint64_t v105 = v103;
              }
              *(void *)&__int128 v158 = &v169[16];
              v106 = (char *)sub_183BF7BDC((uint64_t)&v169[16], v105);
              v108 = &v106[16 * v102];
              *(_OWORD *)v108 = *(_OWORD *)v174;
              *(void *)v174 = 0LL;
              *(void *)&v174[8] = 0LL;
              v109 = *(void **)&v169[8];
              v110 = *(void **)v169;
              if (*(void *)&v169[8] == *(void *)v169)
              {
                int64x2_t v113 = vdupq_n_s64(*(unint64_t *)&v169[8]);
                v111 = &v106[16 * v102];
              }

              else
              {
                v111 = &v106[16 * v102];
                do
                {
                  __int128 v112 = *((_OWORD *)v109 - 1);
                  v109 -= 2;
                  *((_OWORD *)v111 - 1) = v112;
                  v111 -= 16;
                  void *v109 = 0LL;
                  v109[1] = 0LL;
                }

                while (v109 != v110);
                int64x2_t v113 = *(int64x2_t *)v169;
              }

              v114 = v108 + 16;
              *(void *)v169 = v111;
              *(void *)&v169[8] = v108 + 16;
              int64x2_t v156 = v113;
              uint64_t v115 = *(void *)&v169[16];
              *(void *)&v169[16] = &v106[16 * v107];
              uint64_t v157 = v115;
              __p = (void *)v113.i64[0];
              sub_183C08050((uint64_t)&__p);
              v116 = *(std::__shared_weak_count **)&v174[8];
              *(void *)&v169[8] = v114;
              if (*(void *)&v174[8])
              {
                v117 = (unint64_t *)(*(void *)&v174[8] + 8LL);
                do
                  unint64_t v118 = __ldaxr(v117);
                while (__stlxr(v118 - 1, v117));
                if (!v118)
                {
                  ((void (*)(std::__shared_weak_count *))v116->__on_zero_shared)(v116);
                  std::__shared_weak_count::__release_weak(v116);
                }
              }
            }

            else
            {
              **(_OWORD **)&v169[8] = *(_OWORD *)v174;
              *(void *)v174 = 0LL;
              *(void *)&v174[8] = 0LL;
              *(void *)&v169[8] = v101 + 16;
            }
          }

          continue;
        }
      }

      else if (v79 == 1 || *(_BYTE *)v54 != 45)
      {
        goto LABEL_116;
      }

      sub_183C0BCE8((uint64_t)&v151, (uint64_t *)&v160, (char **)&__p);
      v81 = (char *)__p;
      v80 = (char *)v156.i64[0];
      while (v81 != v80)
      {
        sub_183C0CE4C((char **)v169, (uint64_t)v81);
        v81 += 16;
      }

LABEL_108:
      v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
      sub_183BF7C68((void ***)&v184);
    }

    while (v153 < 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v152 - v151) >> 3));
  }

  sub_183BF7D78((void **)&v171);
  __int128 v171 = *(_OWORD *)v169;
  uint64_t v172 = *(void *)&v169[16];
  memset(v169, 0, 24);
  __p = v169;
  sub_183BF7C68((void ***)&__p);
  __p = &v151;
  sub_183C11DE0((void ***)&__p);
  __p = &v149;
  sub_183C11DE0((void ***)&__p);
  if (a3)
  {
    sub_183C11CAC(&__p, "-h");
    sub_183C11CAC(&v184, "--help");
    int v119 = sub_183C101E0((uint64_t **)&v171, (unsigned __int8 *)&__p, (unsigned __int8 *)&v184);
    if (v156.i8[15] < 0) {
      operator delete(__p);
    }
    if (v119)
    {
      v140 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v140, "Docopt --help argument encountered");
      v140->__vftable = (std::runtime_error_vtbl *)&unk_189D38C80;
      v141 = std::runtime_error::~runtime_error;
      v142 = (struct type_info *)&unk_189D37D90;
      goto LABEL_194;
    }
  }

  if (v143)
  {
    sub_183C11CAC(&__p, "--version");
    sub_183C11CAC(&v184, (char *)&unk_183C1629A);
    int v120 = sub_183C101E0((uint64_t **)&v171, (unsigned __int8 *)&__p, (unsigned __int8 *)&v184);
    if (v156.i8[15] < 0) {
      operator delete(__p);
    }
    if (v120)
    {
      v140 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v140, "Docopt --version argument encountered");
      v140->__vftable = (std::runtime_error_vtbl *)&unk_189D38CA8;
      v141 = std::runtime_error::~runtime_error;
      v142 = (struct type_info *)&unk_189D37DA8;
LABEL_194:
      __cxa_throw(v140, v142, (void (*)(void *))v141);
    }
  }

  __p = 0LL;
  int64x2_t v156 = 0uLL;
  uint64_t v121 = sub_183BF6B34((uint64_t)&v162);
  if (!(*(unsigned int (**)(uint64_t, __int128 *, void **))(*(void *)v121 + 16LL))(v121, &v171, &__p))
  {
    v136 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v136, "Arguments did not match expected patterns");
    v136->__vftable = (std::runtime_error_vtbl *)&unk_189D38C58;
    __cxa_throw( v136,  (struct type_info *)&unk_189D37D78,  (void (*)(void *))std::runtime_error::~runtime_error);
  }

  if ((void)v171 != *((void *)&v171 + 1))
  {
    v137 = *v145;
    v138 = v145[1];
    sub_183C11CAC(v169, ", ");
    sub_183BF6D2C(v137, v138, (uint64_t)v169, &v184);
    if ((v169[23] & 0x80000000) != 0) {
      operator delete(*(void **)v169);
    }
    v139 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::operator+<char>();
    std::runtime_error::runtime_error(v139, (const std::string *)v169);
    v139->__vftable = (std::runtime_error_vtbl *)&unk_189D38C58;
    __cxa_throw( v139,  (struct type_info *)&unk_189D37D78,  (void (*)(void *))std::runtime_error::~runtime_error);
  }

  *(void *)(a6 + 16) = 0LL;
  *(void *)(a6 + 8) = 0LL;
  *(void *)a6 = a6 + 8;
  memset(&v184, 0, sizeof(v184));
  ((void (*)(uint64_t, uint64_t))v162[1])((uint64_t)&v162, (uint64_t)&v184);
  std::string::size_type v122 = v184.__r_.__value_.__l.__size_;
  v123 = (void *)v184.__r_.__value_.__r.__words[0];
  if (v184.__r_.__value_.__r.__words[0] != v184.__r_.__value_.__l.__size_)
  {
    do
    {
      v124 = (int *)(*v123 + 32LL);
      *(void *)v174 = (*(uint64_t (**)(void))(*(void *)*v123 + 24LL))(*v123);
      v125 = sub_183C12264((uint64_t **)a6, *(const void ***)v174, (uint64_t)&unk_183C14A40, (__int128 **)v174);
      sub_183BF6BA0((uint64_t)(v125 + 7), v124);
      ++v123;
    }

    while (v123 != (void *)v122);
    v123 = (void *)v184.__r_.__value_.__r.__words[0];
  }

  if (v123)
  {
    v184.__r_.__value_.__l.__size_ = (std::string::size_type)v123;
    operator delete(v123);
  }

  v126 = __p;
  v127 = (void *)v156.i64[0];
  if (__p != (void *)v156.i64[0])
  {
    do
    {
      v128 = (int *)(*v126 + 32LL);
      v184.__r_.__value_.__r.__words[0] = (*(uint64_t (**)(void))(*(void *)*v126 + 24LL))(*v126);
      v129 = sub_183C12264( (uint64_t **)a6,  (const void **)v184.__r_.__value_.__l.__data_,  (uint64_t)&unk_183C14A40,  (__int128 **)&v184);
      sub_183BF6BA0((uint64_t)(v129 + 7), v128);
      v126 += 2;
    }

    while (v126 != v127);
  }

  v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
  sub_183BF7C68((void ***)&v184);
  __p = &v171;
  sub_183BF7C68((void ***)&__p);
  __p = &v160;
  sub_183C120C0((void ***)&__p);
  v162 = off_189D37E70;
  __p = &v163;
  sub_183BF7C68((void ***)&__p);
}

  *a3 = 0LL;
  a3[1] = 0LL;
  a3[2] = 0LL;
  if ((unint64_t)((char *)v20 - (char *)v34) > 8)
  {
    sub_183C0CCA4(v34, v20, (uint64_t *)__p);
    std::operator+<char>();
    unint64_t v100 = std::string::append(&v112, "' is not a unique prefix: ");
    uint64_t v101 = *(_OWORD *)&v100->__r_.__value_.__l.__data_;
    v113.__r_.__value_.__l.__cap_ = v100->__r_.__value_.__l.__cap_;
    *(_OWORD *)&v113.__r_.__value_.__l.__data_ = v101;
    v100->__r_.__value_.__l.__size_ = 0LL;
    v100->__r_.__value_.__l.__cap_ = 0LL;
    v100->__r_.__value_.__r.__words[0] = 0LL;
    uint64_t v102 = *(char **)__p;
    unint64_t v103 = *(char **)&__p[8];
    sub_183C11CAC(v110, ", ");
    sub_183C0CD70(v102, v103, (uint64_t)v110, &v112);
    if ((v112.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v104 = &v112;
    }
    else {
      uint64_t v104 = (std::string *)v112.__r_.__value_.__r.__words[0];
    }
    if ((v112.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      unint64_t v105 = v112.__r_.__value_.__s.__size_;
    }
    else {
      unint64_t v105 = v112.__r_.__value_.__l.__size_;
    }
    std::string::append(&v113, (const std::string::value_type *)v104, v105);
    if (v111 < 0) {
      operator delete(v110[0]);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, &v113);
    exception->__vftable = (std::runtime_error_vtbl *)&off_189D388A8;
    __cxa_throw( exception,  (struct type_info *)&unk_189D37D48,  (void (*)(void *))std::runtime_error::~runtime_error);
  }

  if (v34 != v20)
  {
    sub_183C0D710(*v34, &v113);
    v46 = v113.__r_.__value_.__r.__words[0];
    if (!*(_DWORD *)(v113.__r_.__value_.__r.__words[0] + 112))
    {
      if (v118)
      {
        sub_183BF714C( " must not have an argument",  (const void **)(v113.__r_.__value_.__r.__words[0] + 88),  (void **)__p);
        v49 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v49, (const std::string *)__p);
        v49->__vftable = (std::runtime_error_vtbl *)&off_189D388A8;
        __cxa_throw( v49,  (struct type_info *)&unk_189D37D48,  (void (*)(void *))std::runtime_error::~runtime_error);
      }

      goto LABEL_190;
    }

    if (v118) {
      goto LABEL_190;
    }
    unint64_t v47 = sub_183C0ABC0((void *)a1);
    if (*((char *)v47 + 23) < 0)
    {
      unint64_t v78 = v47[1];
      if (v78 == 2)
      {
        unint64_t v47 = (uint64_t *)*v47;
        goto LABEL_175;
      }

      if (v78) {
        goto LABEL_176;
      }
    }

    else
    {
      if (*((_BYTE *)v47 + 23) != 2)
      {
        if (!*((_BYTE *)v47 + 23)) {
          goto LABEL_115;
        }
LABEL_176:
        sub_183C0ACC8((void *)a1, (__n128 *)v108);
        *(_DWORD *)__p = 3;
        *(_OWORD *)&__p[8] = *(_OWORD *)v108;
        *(void *)&__p[24] = v109;
        v108[0] = 0LL;
        v108[1] = 0LL;
        v109 = 0LL;
        if (v118 == 3)
        {
          if (SHIBYTE(v120) < 0) {
            operator delete((void *)v119);
          }
LABEL_181:
          unint64_t v118 = *(_DWORD *)__p;
          switch(*(_DWORD *)__p)
          {
            case 1:
              LOBYTE(v119) = __p[8];
              break;
            case 2:
              *(void *)&int v119 = *(void *)&__p[8];
              break;
            case 3:
              goto LABEL_184;
            case 4:
              int v119 = *(_OWORD *)&__p[8];
              int v120 = *(void *)&__p[24];
              memset(&__p[8], 0, 24);
              v112.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p[8];
              sub_183C11DE0((void ***)&v112);
              break;
            default:
              break;
          }
        }

        else
        {
          if (v118 == 4)
          {
            v112.__r_.__value_.__r.__words[0] = (std::string::size_type)&v119;
            sub_183C11DE0((void ***)&v112);
            goto LABEL_181;
          }

          unint64_t v118 = 3;
LABEL_184:
          int v119 = *(_OWORD *)&__p[8];
          int v120 = *(void *)&__p[24];
          memset(&__p[8], 0, 24);
        }

        if (SHIBYTE(v109) < 0) {
          operator delete(v108[0]);
        }
        v46 = v113.__r_.__value_.__r.__words[0];
LABEL_190:
        if (*v35)
        {
          if (v118)
          {
            *(_DWORD *)__p = v118;
            switch(v118)
            {
              case 1:
                int v79 = v119;
                goto LABEL_195;
              case 2:
                *(void *)&__p[8] = v119;
                break;
              case 3:
                *(_OWORD *)&__p[8] = v119;
                *(void *)&__p[24] = v120;
                goto LABEL_198;
              case 4:
                *(_OWORD *)&__p[8] = v119;
                *(void *)&__p[24] = v120;
LABEL_198:
                int v120 = 0LL;
                int v119 = 0uLL;
                break;
              default:
                break;
            }
          }

          else
          {
            int v79 = 1;
            *(_DWORD *)__p = 1;
LABEL_195:
            __p[8] = v79;
          }

          sub_183C07EA8(v46, (int *)__p);
          if (*(_DWORD *)__p == 4)
          {
            v112.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p[8];
            sub_183C11DE0((void ***)&v112);
          }

          else if (*(_DWORD *)__p == 3 && (__p[31] & 0x80000000) != 0)
          {
            operator delete(*(void **)&__p[8]);
          }

          v46 = v113.__r_.__value_.__r.__words[0];
        }

        v80 = v113.__r_.__value_.__l.__size_;
        v112.__r_.__value_.__r.__words[0] = v46;
        v112.__r_.__value_.__l.__size_ = v113.__r_.__value_.__l.__size_;
        if (v113.__r_.__value_.__l.__size_)
        {
          v81 = (unint64_t *)(v113.__r_.__value_.__l.__size_ + 8);
          do
            v82 = __ldxr(v81);
          while (__stxr(v82 + 1, v81));
        }

        uint64_t v83 = (unint64_t)a3[2];
        uint64_t v84 = (uint64_t *)a3[1];
        if ((unint64_t)v84 >= v83)
        {
          uint64_t v86 = ((char *)v84 - *a3) >> 4;
          unint64_t v87 = v86 + 1;
          v88 = v83 - (void)*a3;
          if (v88 >> 3 > v87) {
            unint64_t v87 = v88 >> 3;
          }
          else {
            uint64_t v89 = v87;
          }
          *(void *)&v116 = a3 + 2;
          v90 = (char *)sub_183BF7BDC((uint64_t)(a3 + 2), v89);
          v92 = (uint64_t *)&v90[16 * v86];
          void *v92 = v46;
          v92[1] = v80;
          __int128 v94 = *a3;
          v93 = a3[1];
          if (v93 == *a3)
          {
            uint64_t v97 = vdupq_n_s64((unint64_t)v93);
            int64x2_t v95 = &v90[16 * v86];
          }

          else
          {
            int64x2_t v95 = &v90[16 * v86];
            do
            {
              v96 = *((_OWORD *)v93 - 1);
              v93 -= 16;
              *((_OWORD *)v95 - 1) = v96;
              v95 -= 16;
              *(void *)v93 = 0LL;
              *((void *)v93 + 1) = 0LL;
            }

            while (v93 != v94);
            uint64_t v97 = *(int64x2_t *)a3;
          }

          unint64_t v85 = (char *)(v92 + 2);
          *a3 = v95;
          a3[1] = (char *)(v92 + 2);
          *(int64x2_t *)&__p[8] = v97;
          v98 = a3[2];
          a3[2] = &v90[16 * v91];
          *(void *)&__p[24] = v98;
          *(void *)__p = v97.i64[0];
          sub_183C08050((uint64_t)__p);
        }

        else
        {
          *uint64_t v84 = v46;
          v84[1] = v80;
          unint64_t v85 = (char *)(v84 + 2);
        }

        a3[1] = v85;
        uint64_t v75 = (std::__shared_weak_count *)v113.__r_.__value_.__l.__size_;
        if (v113.__r_.__value_.__l.__size_)
        {
          v99 = (unint64_t *)(v113.__r_.__value_.__l.__size_ + 8);
          do
            v77 = __ldaxr(v99);
          while (__stlxr(v77 - 1, v99));
LABEL_226:
          if (!v77)
          {
            ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
            std::__shared_weak_count::__release_weak(v75);
          }
        }

        goto LABEL_228;
      }

void sub_183BF65C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, void *a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, void *__p, uint64_t a50,int a51,__int16 a52,char a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58)
{
  if (a54 < 0)
  {
    operator delete(__p);
    if ((v58 & 1) == 0)
    {
LABEL_6:
      __p = &a26;
      sub_183BF7C68((void ***)&__p);
      __p = &a58;
      sub_183BF7C68((void ***)&__p);
      a58 = (uint64_t)&a33;
      sub_183C120C0((void ***)&a58);
      a37 = (uint64_t)off_189D37E70;
      a58 = a12;
      sub_183BF7C68((void ***)&a58);
      _Unwind_Resume(a1);
    }
  }

  else if (!v58)
  {
    goto LABEL_6;
  }

  __cxa_free_exception(v59);
  goto LABEL_6;
}

void sub_183BF69C0()
{
}

void sub_183BF6ACC()
{
}

void sub_183BF6B20(void *a1)
{
}

uint64_t sub_183BF6B34(uint64_t a1)
{
  int v4 = 1065353216;
  (*(void (**)(uint64_t, _OWORD *))(*(void *)a1 + 72LL))(a1, v3);
  sub_183C103FC(a1);
  sub_183C11A90((uint64_t)v3);
  return a1;
}

void sub_183BF6B8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_183BF6BA0(uint64_t a1, int *a2)
{
  int v5 = *a2;
  switch(*a2)
  {
    case 1:
      LOBYTE(v6) = *((_BYTE *)a2 + 8);
      break;
    case 2:
      *(void *)&__int128 v6 = *((void *)a2 + 1);
      break;
    case 3:
      if (*((char *)a2 + 31) < 0)
      {
        sub_183BFF5D4(&v6, *((void **)a2 + 1), *((void *)a2 + 2));
      }

      else
      {
        __int128 v6 = *(_OWORD *)(a2 + 2);
        uint64_t v7 = *((void *)a2 + 3);
      }

      break;
    case 4:
      __int128 v6 = 0uLL;
      uint64_t v7 = 0LL;
      sub_183C11D5C( (char *)&v6,  *((__int128 **)a2 + 1),  *((__int128 **)a2 + 2),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 2) - *((void *)a2 + 1)) >> 3));
      break;
    default:
      break;
  }

  if (*(_DWORD *)a1 == 4)
  {
    v8 = (void **)(a1 + 8);
    sub_183C11DE0(&v8);
  }

  else if (*(_DWORD *)a1 == 3 && *(char *)(a1 + 31) < 0)
  {
    operator delete(*(void **)(a1 + 8));
  }

  *(_DWORD *)a1 = v5;
  uint64_t v3 = (_BYTE *)(a1 + 8);
  switch(v5)
  {
    case 1:
      *uint64_t v3 = v6;
      break;
    case 2:
      *(void *)uint64_t v3 = v6;
      break;
    case 3:
      *(_OWORD *)uint64_t v3 = v6;
      *(void *)(a1 + 24) = v7;
      break;
    case 4:
      *(_OWORD *)(a1 + 8) = v6;
      *(void *)(a1 + 24) = v7;
      uint64_t v7 = 0LL;
      __int128 v6 = 0uLL;
      v8 = (void **)&v6;
      sub_183C11DE0(&v8);
      break;
    default:
      return a1;
  }

  return a1;
}

char *sub_183BF6D2C@<X0>(char *result@<X0>, char *a2@<X1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  if (result == a2)
  {
    a4->__r_.__value_.__r.__words[0] = 0LL;
    a4->__r_.__value_.__l.__size_ = 0LL;
    a4->__r_.__value_.__l.__cap_ = 0LL;
  }

  else
  {
    uint64_t v7 = result;
    if (result[23] < 0)
    {
      uint64_t result = (char *)sub_183BFF5D4(a4, *(void **)result, *((void *)result + 1));
    }

    else
    {
      __int128 v8 = *(_OWORD *)result;
      a4->__r_.__value_.__l.__cap_ = *((void *)result + 2);
      *(_OWORD *)&a4->__r_.__value_.__l.__data_ = v8;
    }

    for (unint64_t i = v7 + 24; i != a2; i += 24)
    {
      int v10 = *(char *)(a3 + 23);
      if (v10 >= 0) {
        std::string::size_type v11 = (const std::string::value_type *)a3;
      }
      else {
        std::string::size_type v11 = *(const std::string::value_type **)a3;
      }
      if (v10 >= 0) {
        std::string::size_type v12 = *(unsigned __int8 *)(a3 + 23);
      }
      else {
        std::string::size_type v12 = *(void *)(a3 + 8);
      }
      std::string::append(a4, v11, v12);
      int v13 = i[23];
      if (v13 >= 0) {
        uint64_t v14 = i;
      }
      else {
        uint64_t v14 = *(const std::string::value_type **)i;
      }
      if (v13 >= 0) {
        std::string::size_type v15 = i[23];
      }
      else {
        std::string::size_type v15 = *((void *)i + 1);
      }
      uint64_t result = (char *)std::string::append(a4, v14, v15);
    }
  }

  return result;
}

void sub_183BF6DE8(_Unwind_Exception *exception_object)
{
}

uint64_t sub_183BF6E04(uint64_t a1)
{
  *(void *)a1 = off_189D37E70;
  uint64_t v3 = (void **)(a1 + 8);
  sub_183BF7C68(&v3);
  return a1;
}

void docopt::docopt( uint64_t a1@<X0>, __int128 **a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v6 = *(unsigned __int8 *)(a4 + 23);
  if ((v6 & 0x80u) != 0LL) {
    uint64_t v6 = *(void *)(a4 + 8);
  }
  docopt::docopt_parse(a1, a2, a3, v6 != 0, a5, a6);
}

void *sub_183BF6FB8(void *a1)
{
  v2 = std::locale::use_facet(&v4, MEMORY[0x189614558]);
  ((void (*)(const std::locale::facet *, uint64_t))v2->__vftable[2].~facet_0)(v2, 10LL);
  std::locale::~locale(&v4);
  std::ostream::put();
  std::ostream::flush();
  return a1;
}

void sub_183BF7034( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

int *sub_183BF7048(int *result, unsigned int a2)
{
  if (*result != a2)
  {
    uint64_t v3 = result;
    sub_183C11CAC(&v8, "Illegal cast to ");
    if (a2 > 4) {
      std::locale v4 = "unknown";
    }
    else {
      std::locale v4 = off_189D38CC0[a2];
    }
    std::string::append(&v8, v4);
    std::string::append(&v8, "; type is actually ");
    uint64_t v5 = *v3;
    else {
      uint64_t v6 = off_189D38CC0[v5];
    }
    std::string::append(&v8, v6);
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, &v8);
    __cxa_throw(exception, MEMORY[0x1896146E8], MEMORY[0x189614248]);
  }

  return result;
}

void sub_183BF7120( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_183BF714C@<X0>(char *__s@<X1>, const void **a2@<X0>, void **a3@<X8>)
{
  else {
    size_t v6 = (size_t)a2[1];
  }
  size_t v7 = strlen(__s);
  uint64_t result = sub_183BF7204((uint64_t)a3, v6 + v7);
  if (v6)
  {
    else {
      v9 = *a2;
    }
    uint64_t result = (uint64_t)memmove(a3, v9, v6);
  }

  int v10 = (char *)a3 + v6;
  if (v7) {
    uint64_t result = (uint64_t)memmove(v10, __s, v7);
  }
  v10[v7] = 0;
  return result;
}

uint64_t sub_183BF7204(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_183BF7288();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    size_t v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000LL;
    *(void *)a1 = v6;
  }

  else
  {
    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
    *(void *)a1 = 0LL;
    *(_BYTE *)(a1 + 23) = a2;
  }

  return a1;
}

void sub_183BF7288()
{
}

void sub_183BF729C(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_183BF72EC(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_189D37AF0, MEMORY[0x1896141F8]);
}

void sub_183BF72D8(_Unwind_Exception *a1)
{
}

std::logic_error *sub_183BF72EC(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x189614778] + 16LL);
  return result;
}

void sub_183BF7310()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x189614700], MEMORY[0x189614270]);
}

void sub_183BF7338(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, void *a3@<X8>)
{
  int v6 = a2();
  a3[1] = 0LL;
  a3[2] = 0LL;
  *a3 = 0LL;
  if (v6)
  {
    size_t v7 = operator new(8uLL);
    *a3 = v7;
    *v7++ = a1;
    a3[1] = v7;
    a3[2] = v7;
  }

  else
  {
    v9 = *(void **)(a1 + 8);
    std::string v8 = *(void **)(a1 + 16);
    while (v9 != v8)
    {
      (**(void (***)(void **__return_ptr, void, uint64_t (*)(void)))*v9)(&__p, *v9, a2);
      sub_183BF782C((uint64_t)a3, a3[1], (char *)__p, v11, (v11 - (_BYTE *)__p) >> 3);
      if (__p)
      {
        std::string::size_type v11 = (char *)__p;
        operator delete(__p);
      }

      v9 += 2;
    }
  }
}

void sub_183BF73E4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  int v13 = *(void **)v11;
  if (*(void *)v11)
  {
    *(void *)(v11 + 8) = v13;
    operator delete(v13);
  }

  _Unwind_Resume(exception_object);
}

uint64_t sub_183BF7418(uint64_t result, uint64_t a2)
{
  v2 = *(uint64_t **)(result + 8);
  for (unint64_t i = *(uint64_t **)(result + 16);
        v2 != i;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v5 + 8LL))(v5, a2))
  {
    uint64_t v5 = *v2;
    v2 += 2;
  }

  return result;
}

uint64_t sub_183BF7464(uint64_t a1, void **a2, void **a3)
{
  __int128 v12 = 0uLL;
  int v13 = 0LL;
  sub_183BF7AFC((char *)&v12, *a2, a2[1], ((_BYTE *)a2[1] - (_BYTE *)*a2) >> 4);
  __int128 v10 = 0uLL;
  uint64_t v11 = 0LL;
  sub_183BF7CD8((char *)&v10, *a3, a3[1], ((_BYTE *)a3[1] - (_BYTE *)*a3) >> 4);
  size_t v7 = *(void **)(a1 + 8);
  int v6 = *(void **)(a1 + 16);
  while (1)
  {
    if (v7 == v6)
    {
      sub_183BF7D78(a2);
      *(_OWORD *)a2 = v12;
      a2[2] = v13;
      int v13 = 0LL;
      __int128 v12 = 0uLL;
      sub_183BF7D78(a3);
      *(_OWORD *)a3 = v10;
      a3[2] = v11;
      uint64_t v11 = 0LL;
      __int128 v10 = 0uLL;
      uint64_t v8 = 1LL;
      goto LABEL_7;
    }

    v7 += 2;
  }

  uint64_t v8 = 0LL;
LABEL_7:
  uint64_t v14 = (void **)&v10;
  sub_183BF7C68(&v14);
  *(void *)&__int128 v10 = &v12;
  sub_183BF7C68((void ***)&v10);
  return v8;
}

void sub_183BF7574( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  a9 = (void **)&a13;
  sub_183BF7C68(&a9);
  _Unwind_Resume(a1);
}

void sub_183BF75A8()
{
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Logic error: name() shouldnt be called on a BranchPattern");
  __cxa_throw(exception, MEMORY[0x1896146E8], MEMORY[0x189614248]);
}

void sub_183BF75E4(_Unwind_Exception *a1)
{
}

uint64_t sub_183BF75F8()
{
  return 0LL;
}

unint64_t sub_183BF7600(void *a1)
{
  if (!a1) {
    __cxa_bad_typeid();
  }
  unint64_t v1 = *(void *)(*(void *)(*a1 - 8LL) + 8LL);
  if ((v1 & 0x8000000000000000LL) != 0)
  {
    v2 = (unsigned __int8 *)(v1 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v3 = 5381LL;
    do
    {
      unint64_t v1 = v3;
      unsigned int v4 = *v2++;
      uint64_t v3 = (33 * v3) ^ v4;
    }

    while (v4);
  }

  int v6 = (char *)a1[1];
  uint64_t v5 = (char *)a1[2];
  for (unint64_t i = ((v1 << 6) + (v1 >> 2) + ((v5 - v6) >> 4) + 2654435769u) ^ v1;
        v6 != v5;
        i ^= (i << 6) + 2654435769u + (i >> 2) + (*(uint64_t (**)(uint64_t))(*(void *)v8 + 40LL))(v8))
  {
    uint64_t v8 = *(void *)v6;
    v6 += 16;
  }

  return i;
}

void sub_183BF76A8(char *a1)
{
  *(void *)a1 = off_189D37E70;
  v2 = (void **)(a1 + 8);
  sub_183BF7C68(&v2);
  operator delete(a1);
}

void sub_183BF76F0()
{
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Logic error: name() shouldnt be called on a BranchPattern");
  __cxa_throw(exception, MEMORY[0x1896146E8], MEMORY[0x189614248]);
}

void sub_183BF772C(_Unwind_Exception *a1)
{
}

void *sub_183BF7740(void *result, uint64_t a2)
{
  v2 = (const void **)*((void *)result + 1);
  for (unint64_t i = (const void **)*((void *)result + 2); v2 != i; v2 += 2)
  {
    if (*v2)
    {
      uint64_t v5 = __dynamic_cast( *v2,  (const struct __class_type_info *)&unk_189D37E20,  (const struct __class_type_info *)&unk_189D37E30,  0LL);
      if (v5) {
        (*(void (**)(void *, uint64_t))(*(void *)v5 + 72LL))(v5, a2);
      }
    }

    uint64_t result = sub_183BF7E4C(a2, v2, v2);
    if (!v6) {
      uint64_t result = sub_183BF7DD4(v2, (uint64_t *)result + 2);
    }
  }

  return result;
}

void sub_183BF77E4()
{
}

void *sub_183BF77F8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_183BF7310();
  }
  return operator new(8 * a2);
}

char *sub_183BF782C(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  uint64_t v5 = (char *)__dst;
  if (a5 < 1) {
    return v5;
  }
  size_t v7 = __src;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v9 = a1 + 16;
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 3)
  {
    int v13 = *(void **)a1;
    unint64_t v14 = a5 + ((uint64_t)(v12 - *(void *)a1) >> 3);
    if (v14 >> 61) {
      sub_183BF77E4();
    }
    uint64_t v15 = (__dst - (uint64_t)v13) >> 3;
    uint64_t v16 = v10 - (void)v13;
    if (v16 >> 2 > v14) {
      unint64_t v14 = v16 >> 2;
    }
    else {
      unint64_t v17 = v14;
    }
    uint64_t v37 = v9;
    if (v17) {
      v18 = (char *)sub_183BF77F8(v9, v17);
    }
    else {
      v18 = 0LL;
    }
    int64x2_t v28 = &v18[8 * v15];
    __p = v18;
    uint64_t v34 = v28;
    uint64_t v36 = &v18[8 * v17];
    uint64_t v29 = 8 * a5;
    std::string::size_type v30 = &v28[8 * a5];
    do
    {
      uint64_t v31 = *(void *)v7;
      v7 += 8;
      *(void *)int64x2_t v28 = v31;
      v28 += 8;
      v29 -= 8LL;
    }

    while (v29);
    unint64_t v35 = v30;
    uint64_t v5 = sub_183BF7A38((void **)a1, (uint64_t)&__p, v5);
    if (v35 != v34) {
      v35 += (v34 - v35 + 7) & 0xFFFFFFFFFFFFFFF8LL;
    }
    if (__p) {
      operator delete(__p);
    }
    return v5;
  }

  uint64_t v19 = v12 - __dst;
  uint64_t v20 = (uint64_t)(v12 - __dst) >> 3;
  if (v20 >= a5)
  {
    v21 = &__src[8 * a5];
    uint64_t v23 = *(char **)(v9 - 8);
LABEL_17:
    __int128 v24 = &v5[8 * a5];
    v25 = &v23[-8 * a5];
    v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      v26 = v23;
      do
      {
        uint64_t v27 = *(void *)v25;
        v25 += 8;
        *(void *)v26 = v27;
        v26 += 8;
      }

      while ((unint64_t)v25 < v12);
    }

    *(void *)(a1 + 8) = v26;
    if (v23 != v24) {
      memmove(&v23[-8 * ((v23 - v24) >> 3)], v5, v23 - v24);
    }
    if (v21 != v7) {
      memmove(v5, v7, v21 - v7);
    }
    return v5;
  }

  v21 = &__src[8 * v20];
  int64_t v22 = a4 - v21;
  if (a4 != v21) {
    memmove(*(void **)(v9 - 8), &__src[8 * v20], a4 - v21);
  }
  uint64_t v23 = (char *)(v12 + v22);
  *(void *)(a1 + 8) = v12 + v22;
  if (v19 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void sub_183BF7A00( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_183BF7A38(void **a1, uint64_t a2, char *__src)
{
  uint64_t v5 = *(char **)(a2 + 8);
  char v6 = (char *)*a1;
  size_t v7 = v5;
  if (*a1 != __src)
  {
    uint64_t v8 = __src;
    size_t v7 = *(char **)(a2 + 8);
    do
    {
      uint64_t v9 = *((void *)v8 - 1);
      v8 -= 8;
      *((void *)v7 - 1) = v9;
      v7 -= 8;
    }

    while (v8 != v6);
  }

  *(void *)(a2 + 8) = v7;
  uint64_t v10 = a1[1];
  uint64_t v11 = *(void *)(a2 + 16);
  int64_t v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    size_t v7 = *(char **)(a2 + 8);
  }

  *(void *)(a2 + 16) = v11 + v12;
  int v13 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v13;
  unint64_t v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v14;
  uint64_t v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v15;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

char *sub_183BF7AFC(char *result, void *a2, void *a3, unint64_t a4)
{
  if (a4)
  {
    char v6 = result;
    uint64_t result = sub_183BF7B9C(result, a4);
    size_t v7 = (void *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      *size_t v7 = *a2;
      uint64_t v8 = a2[1];
      v7[1] = v8;
      if (v8)
      {
        uint64_t v9 = (unint64_t *)(v8 + 8);
        do
          unint64_t v10 = __ldxr(v9);
        while (__stxr(v10 + 1, v9));
      }

      a2 += 2;
      v7 += 2;
    }

    *((void *)v6 + 1) = v7;
  }

  return result;
}

void sub_183BF7B88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

char *sub_183BF7B9C(void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_183BF77E4();
  }
  uint64_t result = (char *)sub_183BF7BDC((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void *sub_183BF7BDC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_183BF7310();
  }
  return operator new(16 * a2);
}

uint64_t sub_183BF7C10(uint64_t a1)
{
  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      unint64_t v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }

  return a1;
}

void sub_183BF7C68(void ***a1)
{
  unint64_t v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        uint64_t v4 = sub_183BF7C10(v4 - 16);
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

char *sub_183BF7CD8(char *result, void *a2, void *a3, unint64_t a4)
{
  if (a4)
  {
    char v6 = result;
    uint64_t result = sub_183BF7B9C(result, a4);
    size_t v7 = (void *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      *size_t v7 = *a2;
      uint64_t v8 = a2[1];
      v7[1] = v8;
      if (v8)
      {
        uint64_t v9 = (unint64_t *)(v8 + 8);
        do
          unint64_t v10 = __ldxr(v9);
        while (__stxr(v10 + 1, v9));
      }

      a2 += 2;
      v7 += 2;
    }

    *((void *)v6 + 1) = v7;
  }

  return result;
}

void sub_183BF7D64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void sub_183BF7D78(void **a1)
{
  unint64_t v1 = *a1;
  if (*a1)
  {
    uint64_t v3 = (uint64_t)a1[1];
    uint64_t v4 = v1;
    if ((void *)v3 != v1)
    {
      do
        uint64_t v3 = sub_183BF7C10(v3 - 16);
      while ((void *)v3 != v1);
      uint64_t v4 = *a1;
    }

    a1[1] = v1;
    operator delete(v4);
    *a1 = 0LL;
    a1[1] = 0LL;
    a1[2] = 0LL;
  }

void *sub_183BF7DD4(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v3 = a2[1];
  if (v3)
  {
    uint64_t v5 = (unint64_t *)(v3 + 8);
    do
      unint64_t v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }

  size_t v7 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  return a1;
}

uint64_t **sub_183BF7E4C(uint64_t a1, void *a2, void *a3)
{
  unint64_t v7 = (*(uint64_t (**)(void))(*(void *)*a2 + 40LL))(*a2);
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v7 >= v9) {
        unint64_t v3 = v7 % v9;
      }
    }

    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }

    int64_t v12 = *(uint64_t ****)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      for (unint64_t i = *v12; i; unint64_t i = (uint64_t **)*i)
      {
        unint64_t v14 = (unint64_t)i[1];
        if (v14 == v8)
        {
          uint64_t v15 = (*(uint64_t (**)(uint64_t *))(*i[2] + 40))(i[2]);
        }

        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9) {
              v14 %= v9;
            }
          }

          else
          {
            v14 &= v9 - 1;
          }

          if (v14 != v3) {
            break;
          }
        }
      }
    }
  }

  uint64_t v16 = operator new(0x20uLL);
  v29[0] = v16;
  v29[1] = a1 + 16;
  *uint64_t v16 = 0LL;
  v16[1] = v8;
  uint64_t v17 = a3[1];
  v16[2] = *a3;
  v16[3] = v17;
  if (v17)
  {
    v18 = (unint64_t *)(v17 + 8);
    do
      unint64_t v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }

  char v30 = 1;
  float v20 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v21 = *(float *)(a1 + 32);
  if (!v9 || (float)(v21 * (float)v9) < v20)
  {
    BOOL v22 = 1LL;
    if (v9 >= 3) {
      BOOL v22 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v23 = v22 | (2 * v9);
    unint64_t v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24) {
      size_t v25 = v24;
    }
    else {
      size_t v25 = v23;
    }
    sub_183BF80FC(a1, v25);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }

    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }

  v26 = *(void **)(*(void *)a1 + 8 * v3);
  if (v26)
  {
    *(void *)v29[0] = *v26;
    void *v26 = v29[0];
  }

  else
  {
    *(void *)v29[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v29[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v29[0])
    {
      unint64_t v27 = *(void *)(*(void *)v29[0] + 8LL);
      if ((v9 & (v9 - 1)) != 0)
      {
        if (v27 >= v9) {
          v27 %= v9;
        }
      }

      else
      {
        v27 &= v9 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v27) = v29[0];
    }
  }

  unint64_t i = (uint64_t **)v29[0];
  v29[0] = 0LL;
  ++*(void *)(a1 + 24);
  sub_183BF8330((uint64_t)v29, 0LL);
  return i;
}

void sub_183BF80E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_183BF80FC(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2LL;
  }

  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }

  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }

    else
    {
      uint64_t v7 = 1LL << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }

    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4) {
LABEL_16:
    }
      sub_183BF81D8(a1, prime);
  }

void sub_183BF81D8(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_183BF7310();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0LL;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0LL;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }

      else
      {
        v8 &= a2 - 1;
      }

      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      unint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }

          else
          {
            v12 &= a2 - 1;
          }

          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }

            *uint64_t v7 = *v11;
            *unint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            unint64_t v11 = v7;
          }

          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          unint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }

        while (v11);
      }
    }
  }

  else
  {
    uint8x8_t v10 = *(void **)a1;
    *(void *)a1 = 0LL;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0LL;
  }

void sub_183BF8330(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16)) {
      sub_183BF7C10((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }

void sub_183BF8374(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  int8x8_t v4 = std::string::append(&v63, "[^\\n]*(?=\\n?)(?:\\n[ \\t].*?(?=\\n|$))*)");
  __int128 v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  cap = (std::string *)v4->__r_.__value_.__l.__cap_;
  __int128 v64 = v5;
  v4->__r_.__value_.__l.__size_ = 0LL;
  v4->__r_.__value_.__l.__cap_ = 0LL;
  v4->__r_.__value_.__r.__words[0] = 0LL;
  sub_183BF8F38(&v57, (uint64_t)&v64, 1);
  if (SHIBYTE(cap) < 0) {
    operator delete((void *)v64);
  }
  *a2 = 0LL;
  a2[1] = 0LL;
  a2[2] = 0LL;
  uint64_t v6 = *(unsigned __int8 *)(a1 + 23);
  if ((v6 & 0x80u) == 0LL) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = *(void *)a1;
  }
  if ((v6 & 0x80u) != 0LL) {
    uint64_t v6 = *(void *)(a1 + 8);
  }
  sub_183C03818((uint64_t)v51, v7, v7 + v6, (uint64_t)&v57, 0);
  uint64_t v43 = 0LL;
  uint64_t v44 = 0LL;
  char v45 = 0;
  uint64_t v46 = 0LL;
  uint64_t v47 = 0LL;
  char v48 = 0;
  char v49 = 0;
  uint64_t v50 = 0LL;
  *(_OWORD *)__p = 0u;
  memset(v42, 0, sizeof(v42));
  memset(v39, 0, sizeof(v39));
  int v40 = 0;
  while (!sub_183C01494((uint64_t)v51, (uint64_t)v39))
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v53 - (_BYTE *)v52) >> 3);
    uint8x8_t v9 = (uint64_t *)((char *)v52 + 40);
    if (v8 <= 1) {
      uint8x8_t v9 = &v56;
    }
    if (*(_BYTE *)v9)
    {
      BOOL v10 = v8 > 1;
      unint64_t v11 = (char **)&v54;
      if (v10) {
        unint64_t v11 = (char **)((char *)v52 + 24);
      }
      unint64_t v12 = (char **)((char *)v52 + 32);
      if (!v10) {
        unint64_t v12 = (char **)&v55;
      }
      sub_183BFDE9C(&v62, *v11, *v12, *v12 - *v11);
    }

    else
    {
      memset(&v62, 0, sizeof(v62));
    }

    sub_183C11CAC(&v59, " \t\n");
    std::string::size_type size = v62.__r_.__value_.__s.__size_;
    if ((v62.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      unint64_t v14 = &v62;
    }
    else {
      unint64_t v14 = (std::string *)v62.__r_.__value_.__r.__words[0];
    }
    if ((v62.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      std::string::size_type size = v62.__r_.__value_.__l.__size_;
    }
    if ((v61 & 0x80u) == 0) {
      uint64_t v15 = (void **)&v59;
    }
    else {
      uint64_t v15 = v59;
    }
    if ((v61 & 0x80u) == 0) {
      size_t v16 = v61;
    }
    else {
      size_t v16 = v60;
    }
    p_std::string::size_type size = (std::string::__short::$654DBF3D633A6121C0B197AC38B89F76 *)&v14[-1].__r_.__value_.__s.__size_;
    do
    {
      if (!size)
      {
        v26 = &v63;
        goto LABEL_55;
      }

      std::string::size_type v18 = size;
      if (!v16) {
        break;
      }
      unint64_t v19 = memchr(v15, (char)p_size[size].__size_, v16);
      std::string::size_type size = v18 - 1;
    }

    while (v19);
    std::string::erase(&v62, v18, 0xFFFFFFFFFFFFFFFFLL);
    if ((v62.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      float v20 = &v62;
    }
    else {
      float v20 = (std::string *)v62.__r_.__value_.__r.__words[0];
    }
    if ((v62.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      std::string::size_type v21 = v62.__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type v21 = v62.__r_.__value_.__l.__size_;
    }
    if ((v61 & 0x80u) == 0) {
      BOOL v22 = (void **)&v59;
    }
    else {
      BOOL v22 = v59;
    }
    if ((v61 & 0x80u) == 0) {
      size_t v23 = v61;
    }
    else {
      size_t v23 = v60;
    }
    if (v21)
    {
      unint64_t v24 = v20;
      if (v23)
      {
        while (memchr(v22, v24->__r_.__value_.__s.__data_[0], v23))
        {
          unint64_t v24 = (std::string *)((char *)v24 + 1);
          if (!--v21) {
            goto LABEL_51;
          }
        }
      }

      std::string::size_type v25 = (char *)v24 - (char *)v20;
    }

    else
    {
LABEL_51:
      std::string::size_type v25 = -1LL;
    }

    std::string::erase(&v62, 0LL, v25);
    std::string v63 = v62;
    v26 = &v62;
LABEL_55:
    v26->__r_.__value_.__r.__words[0] = 0LL;
    v26->__r_.__value_.__l.__size_ = 0LL;
    v26->__r_.__value_.__l.__cap_ = 0LL;
    int64x2_t v28 = (std::string *)a2[1];
    unint64_t v27 = a2[2];
    if ((unint64_t)v28 >= v27)
    {
      unint64_t v30 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v28 - *a2) >> 3);
      unint64_t v31 = v30 + 1;
      if (v30 + 1 > 0xAAAAAAAAAAAAAAALL) {
        sub_183BF77E4();
      }
      unint64_t v32 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v27 - *a2) >> 3);
      if (2 * v32 > v31) {
        unint64_t v31 = 2 * v32;
      }
      if (v32 >= 0x555555555555555LL) {
        unint64_t v33 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v33 = v31;
      }
      uint64_t v67 = a2 + 2;
      if (v33) {
        uint64_t v34 = (char *)sub_183BFB0F0((uint64_t)(a2 + 2), v33);
      }
      else {
        uint64_t v34 = 0LL;
      }
      unint64_t v35 = (std::string *)&v34[24 * v30];
      *(void *)&__int128 v64 = v34;
      *((void *)&v64 + 1) = v35;
      v66 = &v34[24 * v33];
      *unint64_t v35 = v63;
      cap = v35 + 1;
      sub_183BFF660(a2, &v64);
      uint64_t v29 = (std::string *)a2[1];
      sub_183BFF7E8((uint64_t)&v64);
    }

    else
    {
      *int64x2_t v28 = v63;
      uint64_t v29 = v28 + 1;
      a2[1] = (uint64_t)&v28[1];
    }

    a2[1] = (uint64_t)v29;
    sub_183C012D4((uint64_t)v51);
  }

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  if (v52)
  {
    v53 = v52;
    operator delete(v52);
  }

  uint64_t v36 = v58;
  if (v58)
  {
    p_shared_owners = (unint64_t *)&v58->__shared_owners_;
    do
      unint64_t v38 = __ldaxr(p_shared_owners);
    while (__stlxr(v38 - 1, p_shared_owners));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }

  std::locale::~locale(&v57);
}

void sub_183BF87C4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, void *a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, std::locale a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52)
{
  if (__p) {
    operator delete(__p);
  }
  if (a33) {
    operator delete(a33);
  }
  *(void *)(v53 - 208) = v52;
  sub_183C11DE0((void ***)(v53 - 208));
  sub_183BF7C10((uint64_t)&a52);
  std::locale::~locale(&a47);
  _Unwind_Resume(a1);
}

void sub_183BF88A8(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&qword_18C498208);
  if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_18C498208))
  {
    sub_183C03918((const std::locale *)&unk_18C662F50, "(?:^|\\n)[ \\t]*(-(.|\\n)*?)(?=\\n[ \\t]*-|$)", 0);
    __cxa_atexit((void (*)(void *))sub_183BF8F10, &unk_18C662F50, &dword_183BF4000);
    __cxa_guard_release(&qword_18C498208);
  }

  *a2 = 0LL;
  a2[1] = 0LL;
  a2[2] = 0LL;
  sub_183C11CAC(__s1, "options:");
  sub_183BF8374(a1, &v39);
  if (v42 < 0) {
    operator delete(__s1[0]);
  }
  uint64_t v5 = v39;
  uint64_t v19 = v40;
  if (v39 != v40)
  {
    while (1)
    {
      if (*(char *)(v5 + 23) < 0)
      {
        sub_183BFF5D4(&__dst, *(void **)v5, *(void *)(v5 + 8));
      }

      else
      {
        __int128 v6 = *(_OWORD *)v5;
        __dst.__r_.__value_.__l.__cap_ = *(void *)(v5 + 16);
        *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v6;
      }

      if ((__dst.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        p_dst = &__dst;
      }
      else {
        p_dst = (std::string *)__dst.__r_.__value_.__r.__words[0];
      }
      std::string::size_type v8 = std::string::find(&__dst, 58, 0LL);
      if ((__dst.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint8x8_t v9 = &__dst;
      }
      else {
        uint8x8_t v9 = (std::string *)__dst.__r_.__value_.__r.__words[0];
      }
      std::string::erase(&__dst, (char *)p_dst - (char *)v9, v8 + 1);
      std::string::size_type size = __dst.__r_.__value_.__s.__size_;
      if ((__dst.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        unint64_t v11 = &__dst;
      }
      else {
        unint64_t v11 = (std::string *)__dst.__r_.__value_.__r.__words[0];
      }
      if ((__dst.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        std::string::size_type size = __dst.__r_.__value_.__l.__size_;
      }
      sub_183C03818((uint64_t)v32, (uint64_t)v11, (uint64_t)v11 + size, (uint64_t)&unk_18C662F50, 0);
      uint64_t v24 = 0LL;
      uint64_t v25 = 0LL;
      char v26 = 0;
      uint64_t v27 = 0LL;
      uint64_t v28 = 0LL;
      char v29 = 0;
      char v30 = 0;
      uint64_t v31 = 0LL;
      __int128 __p = 0u;
      memset(v23, 0, sizeof(v23));
      memset(v20, 0, sizeof(v20));
      int v21 = 0;
LABEL_48:
      if ((void)__p)
      {
        *((void *)&__p + 1) = __p;
        operator delete((void *)__p);
      }

      if (v33)
      {
        uint64_t v34 = v33;
        operator delete(v33);
      }

      v5 += 24LL;
      if (v5 == v19) {
        goto LABEL_55;
      }
    }

    while (1)
    {
      unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((v34 - (_BYTE *)v33) >> 3);
      int v13 = (uint64_t *)((char *)v33 + 40);
      if (v12 <= 1) {
        int v13 = &v37;
      }
      if (*(_BYTE *)v13)
      {
        BOOL v14 = v12 > 1;
        if (v12 <= 1) {
          uint64_t v15 = (char **)&v35;
        }
        else {
          uint64_t v15 = (char **)((char *)v33 + 24);
        }
        size_t v16 = (char **)((char *)v33 + 32);
        if (!v14) {
          size_t v16 = (char **)&v36;
        }
        sub_183BFDE9C(v51, *v15, *v16, *v16 - *v15);
      }

      else
      {
        v51[0] = 0LL;
        v51[1] = 0LL;
        uint64_t v52 = 0LL;
      }

      sub_183C11CAC(__s1, "-");
      BOOL v17 = sub_183C061B4(v51, __s1);
      BOOL v18 = v17;
      if (v42 < 0)
      {
        operator delete(__s1[0]);
        if (v18)
        {
LABEL_34:
          sub_183C0634C((uint64_t)v51, (uint64_t)__s1);
          sub_183C06228(a2, (uint64_t)__s1);
          if (v50 < 0) {
            operator delete(v49);
          }
          if (v48 < 0) {
            operator delete(v47);
          }
          __s1[0] = (void **)off_189D38670;
          if (v44 == 4)
          {
            uint64_t v53 = &v45;
            sub_183C11DE0(&v53);
          }

          else if (v44 == 3 && v46 < 0)
          {
            operator delete(v45);
          }

          if (v43 < 0) {
            operator delete(__s1[1]);
          }
        }
      }

      else if (v17)
      {
        goto LABEL_34;
      }

      if (SHIBYTE(v52) < 0) {
        operator delete((void *)v51[0]);
      }
      sub_183C012D4((uint64_t)v32);
    }
  }

LABEL_55:
  __s1[0] = (void **)&v39;
  sub_183C11DE0(__s1);
}

void sub_183BF8C64( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, void *a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,void *__p,uint64_t a52,int a53,__int16 a54,char a55,char a56,char a57)
{
}

void sub_183BF8D98( void (***a1)(void **__return_ptr, void, const void *(*)(const void *result))@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0LL;
  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  unint64_t v3 = v5;
  unsigned __int8 v4 = v6;
  std::string::size_type v8 = (void **)a2;
  if (v5 != v6)
  {
    do
    {
      uint64_t v7 = *v3;
      sub_183C0F86C(&v8, &v7);
      ++v3;
    }

    while (v3 != v4);
    unint64_t v3 = v5;
  }

  if (v3)
  {
    __int128 v6 = v3;
    operator delete(v3);
  }

void sub_183BF8E28( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  int v13 = *(void **)v11;
  if (*(void *)v11)
  {
    *(void *)(v11 + 8) = v13;
    operator delete(v13);
  }

  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_183BF8E54( void (***a1)(void **__return_ptr, void, const void *(*)(const void *result))@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0LL;
  *(void *)(a2 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  unint64_t v3 = v5;
  unsigned __int8 v4 = v6;
  std::string::size_type v8 = (void **)a2;
  if (v5 != v6)
  {
    do
    {
      uint64_t v7 = *v3;
      sub_183C0F86C(&v8, &v7);
      ++v3;
    }

    while (v3 != v4);
    unint64_t v3 = v5;
  }

  if (v3)
  {
    __int128 v6 = v3;
    operator delete(v3);
  }

void sub_183BF8EE4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  int v13 = *(void **)v11;
  if (*(void *)v11)
  {
    *(void *)(v11 + 8) = v13;
    operator delete(v13);
  }

  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_183BF8F10(std::locale *a1)
{
}

const std::locale *sub_183BF8F38(const std::locale *a1, uint64_t a2, int a3)
{
  __int128 v6 = sub_183BF8FD0(a1);
  LODWORD(v6[3].__locale_) = a3;
  *(_OWORD *)((char *)&v6[3].__locale_ + 4) = 0u;
  *(_OWORD *)((char *)&v6[5].__locale_ + 4) = 0u;
  HIDWORD(v6[7].__locale_) = 0;
  uint64_t v7 = *(unsigned __int8 *)(a2 + 23);
  if ((v7 & 0x80u) == 0LL) {
    std::string::size_type v8 = (char *)a2;
  }
  else {
    std::string::size_type v8 = *(char **)a2;
  }
  if ((v7 & 0x80u) != 0LL) {
    uint64_t v7 = *(void *)(a2 + 8);
  }
  return a1;
}

void sub_183BF8FB4(_Unwind_Exception *a1)
{
}

const std::locale *sub_183BF8FD0(const std::locale *a1)
{
  v2 = (const std::locale *)MEMORY[0x186E2335C]();
  a1[1].__locale_ = (std::locale::__imp *)std::locale::use_facet(v2, MEMORY[0x189614558]);
  a1[2].__locale_ = (std::locale::__imp *)std::locale::use_facet(a1, MEMORY[0x1896145F8]);
  return a1;
}

void sub_183BF9018(_Unwind_Exception *a1)
{
}

char *sub_183BF902C(uint64_t a1, char *a2, char *a3)
{
  __int128 v6 = operator new(8uLL);
  *__int128 v6 = &unk_189D37ED0;
  uint64_t v7 = operator new(0x10uLL);
  *uint64_t v7 = &unk_189D37FA0;
  v7[1] = v6;
  sub_183BF91C8((void *)(a1 + 40), (uint64_t)v7);
  *(void *)(a1 + 56) = *(void *)(a1 + 40);
  unsigned int v8 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v8 > 0x3F)
  {
    switch(v8)
    {
      case 0x40u:
        return sub_183BF9464(a1, a2, a3);
      case 0x80u:
        return (char *)sub_183BF9504(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
      case 0x100u:
        return sub_183BF9634(a1, a2, a3);
      default:
        goto LABEL_14;
    }
  }

  else if (v8)
  {
    if (v8 != 16)
    {
      if (v8 != 32) {
LABEL_14:
      }
        sub_183BF9764();
      return sub_183BF9464(a1, a2, a3);
    }

    return sub_183BF9338(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
  }

  else
  {
    return sub_183BF9238(a1, (unsigned __int8 *)a2, a3);
  }

void sub_183BF9160(_Unwind_Exception *a1)
{
}

void sub_183BF917C()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x186E23230](exception, 17LL);
  __cxa_throw(exception, MEMORY[0x1896146C8], MEMORY[0x189614288]);
}

void sub_183BF91B4(_Unwind_Exception *a1)
{
}

void sub_183BF91C8(void *a1, uint64_t a2)
{
  unint64_t v3 = (std::__shared_weak_count *)a1[1];
  __int128 v4 = v7;
  *(void *)&__int128 v7 = *a1;
  *((void *)&v7 + 1) = v3;
  *(_OWORD *)a1 = v4;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      unint64_t v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }

char *sub_183BF9238(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  __int128 v7 = sub_183BF9A14(a1, a2, a3);
  if (v7 == a2)
  {
    unsigned int v8 = operator new(0x10uLL);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(v9 + 8);
    *unsigned int v8 = &unk_189D37FA0;
    v8[1] = v10;
    *(void *)(v9 + 8) = v8;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  }

  while (*v7 == 124)
  {
    uint64_t v11 = *(void *)(a1 + 56);
    unint64_t v12 = v7 + 1;
    __int128 v7 = sub_183BF9A14(a1, v7 + 1, a3);
    if (v12 == v7)
    {
      int v13 = operator new(0x10uLL);
      uint64_t v14 = *(void *)(a1 + 56);
      uint64_t v15 = *(void *)(v14 + 8);
      void *v13 = &unk_189D37FA0;
      v13[1] = v15;
      *(void *)(v14 + 8) = v13;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    }

    sub_183BF9A5C(a1, v6, v11);
  }

  return (char *)v7;
}

char *sub_183BF9338(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unint64_t v3 = a2;
  if (a2 == a3) {
    return (char *)a2;
  }
  __int128 v4 = (char *)a3;
  if (*a2 == 94)
  {
    uint64_t v6 = operator new(0x18uLL);
    BOOL v7 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(v8 + 8);
    *uint64_t v6 = &unk_189D38048;
    v6[1] = v9;
    *((_BYTE *)v6 + 16) = v7;
    *(void *)(v8 + 8) = v6;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    ++v3;
  }

  if (v3 != (unsigned __int8 *)v4)
  {
    do
    {
      uint64_t v10 = v3;
      unint64_t v3 = sub_183C00908(a1, (uint64_t)v3, v4);
    }

    while (v10 != v3);
    if (v10 != v4)
    {
      if (v10 + 1 != v4 || *v10 != 36) {
        sub_183C008BC();
      }
      uint64_t v11 = operator new(0x18uLL);
      BOOL v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = *(void *)(v13 + 8);
      *uint64_t v11 = &unk_189D38090;
      v11[1] = v14;
      *((_BYTE *)v11 + 16) = v12;
      *(void *)(v13 + 8) = v11;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    }
  }

  return v4;
}

char *sub_183BF9464(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = sub_183C00EE4(a1, a2, a3);
  if (v7 == (unsigned __int8 *)a2) {
LABEL_9:
  }
    sub_183C008BC();
  uint64_t v8 = v7;
  while (v8 != (unsigned __int8 *)a3)
  {
    if (*v8 != 124) {
      return (char *)v8;
    }
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = sub_183C00EE4(a1, (char *)v8 + 1, a3);
    if (v8 + 1 == v10) {
      goto LABEL_9;
    }
    uint64_t v8 = v10;
    sub_183BF9A5C(a1, v6, v9);
  }

  return a3;
}

unsigned __int8 *sub_183BF9504(uint64_t a1, unsigned __int8 *__s, unsigned __int8 *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = (unsigned __int8 *)memchr(__s, 10, a3 - __s);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = a3;
  }
  if (v8 == __s)
  {
    uint64_t v9 = operator new(0x10uLL);
    uint64_t v10 = *(void *)(v6 + 8);
    void *v9 = &unk_189D37FA0;
    v9[1] = v10;
    *(void *)(v6 + 8) = v9;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  }

  else
  {
    sub_183BF9338(a1, __s, v8);
  }

  if (v8 != a3) {
    ++v8;
  }
  while (v8 != a3)
  {
    uint64_t v11 = (unsigned __int8 *)memchr(v8, 10, a3 - v8);
    if (v11) {
      BOOL v12 = v11;
    }
    else {
      BOOL v12 = a3;
    }
    uint64_t v13 = *(void *)(a1 + 56);
    if (v12 == v8)
    {
      uint64_t v14 = operator new(0x10uLL);
      uint64_t v15 = *(void *)(v13 + 8);
      void *v14 = &unk_189D37FA0;
      v14[1] = v15;
      *(void *)(v13 + 8) = v14;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    }

    else
    {
      sub_183BF9338(a1, v8, v12);
    }

    sub_183BF9A5C(a1, v6, v13);
    if (v12 == a3) {
      uint64_t v8 = v12;
    }
    else {
      uint64_t v8 = v12 + 1;
    }
  }

  return a3;
}

char *sub_183BF9634(uint64_t a1, char *__s, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = (char *)memchr(__s, 10, a3 - __s);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = a3;
  }
  if (v8 == __s)
  {
    uint64_t v9 = operator new(0x10uLL);
    uint64_t v10 = *(void *)(v6 + 8);
    void *v9 = &unk_189D37FA0;
    v9[1] = v10;
    *(void *)(v6 + 8) = v9;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  }

  else
  {
    sub_183BF9464(a1, __s, v8);
  }

  if (v8 != a3) {
    ++v8;
  }
  while (v8 != a3)
  {
    uint64_t v11 = (char *)memchr(v8, 10, a3 - v8);
    if (v11) {
      BOOL v12 = v11;
    }
    else {
      BOOL v12 = a3;
    }
    uint64_t v13 = *(void *)(a1 + 56);
    if (v12 == v8)
    {
      uint64_t v14 = operator new(0x10uLL);
      uint64_t v15 = *(void *)(v13 + 8);
      void *v14 = &unk_189D37FA0;
      v14[1] = v15;
      *(void *)(v13 + 8) = v14;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    }

    else
    {
      sub_183BF9464(a1, v8, v12);
    }

    sub_183BF9A5C(a1, v6, v13);
    if (v12 == a3) {
      uint64_t v8 = v12;
    }
    else {
      uint64_t v8 = v12 + 1;
    }
  }

  return a3;
}

void sub_183BF9764()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x186E23230](exception, 14LL);
  __cxa_throw(exception, MEMORY[0x1896146C8], MEMORY[0x189614288]);
}

void sub_183BF979C(_Unwind_Exception *a1)
{
}

void sub_183BF97B8(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void *sub_183BF97CC(void *a1, uint64_t a2)
{
  *a1 = a2;
  __int128 v4 = operator new(0x20uLL);
  *__int128 v4 = &unk_189D37F28;
  v4[1] = 0LL;
  v4[2] = 0LL;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_183BF9814(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8LL))(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_183BF9838(std::__shared_weak_count *a1)
{
}

uint64_t sub_183BF984C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
  }
  return result;
}

uint64_t sub_183BF9864(uint64_t a1, uint64_t a2)
{
  else {
    return 0LL;
  }
}

BOOL sub_183BF98A4(uint64_t a1, uint64_t a2)
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

void *sub_183BF98F0(void *a1)
{
  *a1 = &unk_189D38018;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_183BF9934(void *__p)
{
  void *__p = &unk_189D38018;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

uint64_t sub_183BF9978(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void *sub_183BF998C(void *a1)
{
  *a1 = &unk_189D38018;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_183BF99D0(void *__p)
{
  void *__p = &unk_189D38018;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

unsigned __int8 *sub_183BF9A14(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  do
  {
    uint64_t v5 = a2;
    a2 = sub_183BF9B0C(a1, (char *)a2, a3);
  }

  while (v5 != a2);
  return v5;
}

void *sub_183BF9A5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = operator new(0x18uLL);
  uint64_t v7 = *(void *)(a3 + 8);
  v6[1] = *(void *)(a2 + 8);
  v6[2] = v7;
  *uint64_t v6 = &unk_189D38510;
  *(void *)(a2 + 8) = v6;
  *(void *)(a3 + 8) = 0LL;
  uint64_t v8 = operator new(0x10uLL);
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8LL);
  *uint64_t v8 = &unk_189D37FA0;
  v8[1] = v9;
  *(void *)(a3 + 8) = v8;
  *(void *)(*(void *)(a1 + 56) + 8LL) = 0LL;
  uint64_t result = operator new(0x10uLL);
  uint64_t v11 = *(void *)(a3 + 8);
  *uint64_t result = &unk_189D38558;
  result[1] = v11;
  *(void *)(*(void *)(a1 + 56) + 8LL) = result;
  *(void *)(a1 + 56) = *(void *)(a3 + 8);
  return result;
}

unsigned __int8 *sub_183BF9B0C(uint64_t a1, char *a2, char *a3)
{
  uint64_t result = (unsigned __int8 *)sub_183BF9BA0(a1, a2, a3);
  if (result == (unsigned __int8 *)a2)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    int v8 = *(_DWORD *)(a1 + 28);
    uint64_t v9 = sub_183BF9E30(a1, (unsigned __int8 *)a2, a3);
    uint64_t result = (unsigned __int8 *)a2;
  }

  return result;
}

char *sub_183BF9BA0(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v6 = *a2;
  if (v6 <= 91)
  {
    if (v6 != 36)
    {
      if (v6 == 40 && a2 + 1 != a3 && a2[1] == 63 && a2 + 2 != a3)
      {
        int v7 = a2[2];
        if (v7 == 33)
        {
          sub_183BF8FD0(v19);
          __int128 v20 = 0u;
          uint64_t v22 = 0LL;
          __int128 v21 = 0u;
          LODWORD(v20) = *(_DWORD *)(a1 + 24);
          int v8 = (char *)sub_183BF902C(v19, v3 + 3, a3);
          int v18 = DWORD1(v20);
          sub_183BFA384(a1, (uint64_t)v19, 1, *(_DWORD *)(a1 + 28));
          *(_DWORD *)(a1 + 28) += v18;
          if (v8 == a3 || *v8 != 41) {
            sub_183BFA408();
          }
          goto LABEL_27;
        }

        if (v7 == 61)
        {
          sub_183BF8FD0(v19);
          __int128 v20 = 0u;
          uint64_t v22 = 0LL;
          __int128 v21 = 0u;
          LODWORD(v20) = *(_DWORD *)(a1 + 24);
          int v8 = (char *)sub_183BF902C(v19, v3 + 3, a3);
          int v9 = DWORD1(v20);
          sub_183BFA384(a1, (uint64_t)v19, 0, *(_DWORD *)(a1 + 28));
          *(_DWORD *)(a1 + 28) += v9;
          if (v8 == a3 || *v8 != 41) {
            sub_183BFA408();
          }
LABEL_27:
          uint64_t v3 = v8 + 1;
          sub_183BF7C10((uint64_t)&v21);
          std::locale::~locale(v19);
          return v3;
        }
      }

      return v3;
    }

    uint64_t v10 = operator new(0x18uLL);
    BOOL v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(v12 + 8);
    uint64_t v14 = (char *)&unk_189D38080;
LABEL_17:
    *uint64_t v10 = v14 + 16;
    v10[1] = v13;
    *((_BYTE *)v10 + 16) = v11;
    *(void *)(v12 + 8) = v10;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    return ++v3;
  }

  if (v6 != 92)
  {
    if (v6 != 94) {
      return v3;
    }
    uint64_t v10 = operator new(0x18uLL);
    BOOL v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(v12 + 8);
    uint64_t v14 = (char *)&unk_189D38038;
    goto LABEL_17;
  }

  if (a2 + 1 != a3)
  {
    int v16 = a2[1];
    if (v16 == 66)
    {
      char v17 = 1;
    }

    else
    {
      if (v16 != 98) {
        return v3;
      }
      char v17 = 0;
    }

    sub_183BFA310(a1, v17);
    v3 += 2;
  }

  return v3;
}

void sub_183BF9E04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
}

unsigned __int8 *sub_183BF9E30(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 != (unsigned __int8 *)a3)
  {
    int v6 = (char)*a2;
    if (v6 <= 62)
    {
      if (v6 == 40)
      {
        BOOL v11 = a2 + 1;
        if (a2 + 1 != (unsigned __int8 *)a3)
        {
          if (a2 + 2 != (unsigned __int8 *)a3 && *v11 == 63 && a2[2] == 58)
          {
            ++*(_DWORD *)(a1 + 36);
            uint64_t v12 = (char *)sub_183BF9238(a1, a2 + 3, a3);
            if (v12 != a3 && *v12 == 41)
            {
              --*(_DWORD *)(a1 + 36);
              return (unsigned __int8 *)(v12 + 1);
            }
          }

          else
          {
            sub_183BFBC38((void *)a1);
            int v13 = *(_DWORD *)(a1 + 28);
            ++*(_DWORD *)(a1 + 36);
            uint64_t v14 = (char *)sub_183BF9238(a1, v11, a3);
            if (v14 != a3)
            {
              uint64_t v15 = v14;
              if (*v14 == 41)
              {
                sub_183BFBC9C((void *)a1, v13);
                --*(_DWORD *)(a1 + 36);
                return (unsigned __int8 *)(v15 + 1);
              }
            }
          }
        }

        sub_183BFA408();
      }

      if (v6 == 46)
      {
        int v7 = operator new(0x10uLL);
        uint64_t v8 = *(void *)(a1 + 56);
        uint64_t v9 = *(void *)(v8 + 8);
        *int v7 = &unk_189D38168;
        v7[1] = v9;
        *(void *)(v8 + 8) = v7;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
        return ++v3;
      }

LABEL_28:
      sub_183BFBCF8();
    }

    if (v6 > 91)
    {
      if (v6 == 92) {
        return sub_183BFBA88(a1, a2, (unsigned __int8 *)a3);
      }
      if (v6 == 123) {
        goto LABEL_28;
      }
    }

    else
    {
      if (v6 == 91) {
        return (unsigned __int8 *)sub_183BFBB28(a1, (char *)a2, a3);
      }
      if (v6 == 63) {
        goto LABEL_28;
      }
    }

    return sub_183BFBD44(a1, a2, a3);
  }

  return v3;
}

unsigned __int8 *sub_183BFA008( uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, int a5, int a6)
{
  if (a2 == a3) {
    return a2;
  }
  int v6 = a6;
  int v7 = a5;
  uint64_t v10 = a1;
  int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  int v12 = (char)*a2;
  if (v12 > 62)
  {
    if (v12 == 63)
    {
      int v13 = a2 + 1;
      if (v11) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v13 == a3;
      }
      if (!v20 && *v13 == 63)
      {
        int v13 = a2 + 2;
        uint64_t v14 = 0LL;
        uint64_t v18 = 1LL;
        goto LABEL_33;
      }

      uint64_t v14 = 0LL;
      uint64_t v18 = 1LL;
      goto LABEL_45;
    }

    int v13 = a2;
    if (v12 != 123) {
      return v13;
    }
    uint64_t v15 = a2 + 1;
    int v16 = sub_183C00330(a1, a2 + 1, a3, &v28);
    if (v15 != v16)
    {
      if (v16 != a3)
      {
        int v17 = (char)*v16;
        if (v17 != 44)
        {
          if (v17 == 125)
          {
            int v13 = v16 + 1;
            if (!v11 && v13 != a3 && *v13 == 63)
            {
              int v13 = v16 + 2;
              uint64_t v14 = v28;
              a5 = v7;
              a6 = v6;
              a1 = v10;
              uint64_t v18 = v28;
LABEL_33:
              uint64_t v21 = a4;
              char v22 = 0;
LABEL_46:
              sub_183C001FC(a1, v14, v18, v21, a5, a6, v22);
              return v13;
            }

            uint64_t v14 = v28;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            uint64_t v18 = v28;
LABEL_45:
            uint64_t v21 = a4;
            char v22 = 1;
            goto LABEL_46;
          }

          goto LABEL_58;
        }

        size_t v23 = v16 + 1;
        if (v16 + 1 == a3) {
          goto LABEL_58;
        }
        if (*v23 == 125)
        {
          int v13 = v16 + 2;
          if (!v11 && v13 != a3 && *v13 == 63)
          {
            int v13 = v16 + 3;
            uint64_t v14 = v28;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            goto LABEL_26;
          }

          uint64_t v14 = v28;
          a5 = v7;
          a6 = v6;
          a1 = v10;
LABEL_36:
          uint64_t v18 = -1LL;
          goto LABEL_45;
        }

        int v27 = -1;
        uint64_t v25 = sub_183C00330(v10, v23, a3, &v27);
        if (v23 != v25 && v25 != a3 && *v25 == 125)
        {
          uint64_t v18 = v27;
          uint64_t v14 = v28;
          if (v27 >= v28)
          {
            int v13 = v25 + 1;
            char v22 = 1;
            if (!v11 && v13 != a3)
            {
              int v26 = v25[1];
              char v22 = v26 != 63;
              if (v26 == 63) {
                int v13 = v25 + 2;
              }
            }

            a5 = v7;
            a6 = v6;
            a1 = v10;
            uint64_t v21 = a4;
            goto LABEL_46;
          }

          goto LABEL_58;
        }
      }

      sub_183C00418();
    }

LABEL_58:
    sub_183C003CC();
  }

  if (v12 == 42)
  {
    int v13 = a2 + 1;
    if (v11) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = v13 == a3;
    }
    if (!v19 && *v13 == 63)
    {
      int v13 = a2 + 2;
      uint64_t v14 = 0LL;
      goto LABEL_26;
    }

    uint64_t v14 = 0LL;
    goto LABEL_36;
  }

  int v13 = a2;
  if (v12 == 43)
  {
    int v13 = a2 + 1;
    if (!v11 && v13 != a3 && *v13 == 63)
    {
      int v13 = a2 + 2;
      uint64_t v14 = 1LL;
LABEL_26:
      uint64_t v18 = -1LL;
      goto LABEL_33;
    }

    uint64_t v14 = 1LL;
    goto LABEL_36;
  }

  return v13;
}

    sub_183C003CC();
  }

  if (v12 == 42)
  {
    int v13 = a2 + 1;
    if (v11) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = v13 == a3;
    }
    if (!v19 && *v13 == 63)
    {
      int v13 = a2 + 2;
      uint64_t v14 = 0LL;
      goto LABEL_26;
    }

    uint64_t v14 = 0LL;
    goto LABEL_36;
  }

  if (v12 == 43)
  {
    int v13 = a2 + 1;
    if (!v11 && v13 != a3 && *v13 == 63)
    {
      int v13 = a2 + 2;
      uint64_t v14 = 1LL;
LABEL_26:
      uint64_t v18 = -1LL;
      goto LABEL_33;
    }

    uint64_t v14 = 1LL;
    goto LABEL_36;
  }

  return a2;
}

__n128 sub_183BFA310(uint64_t a1, char a2)
{
  __int128 v4 = (char *)operator new(0x30uLL);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8LL);
  *(void *)__int128 v4 = &unk_189D380D8;
  *((void *)v4 + 1) = v5;
  std::locale::locale((std::locale *)v4 + 2, (const std::locale *)a1);
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v4 + 24) = result;
  v4[40] = a2;
  *(void *)(*(void *)(a1 + 56) + 8LL) = v4;
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  return result;
}

uint64_t sub_183BFA384(uint64_t a1, uint64_t a2, char a3, int a4)
{
  uint64_t v8 = operator new(0x58uLL);
  uint64_t result = sub_183BFA7D8((uint64_t)v8, a2, a3, *(void *)(*(void *)(a1 + 56) + 8LL), a4);
  *(void *)(*(void *)(a1 + 56) + 8LL) = v8;
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  return result;
}

void sub_183BFA3F4(_Unwind_Exception *a1)
{
}

void sub_183BFA408()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x186E23230](exception, 6LL);
  __cxa_throw(exception, MEMORY[0x1896146C8], MEMORY[0x189614288]);
}

void sub_183BFA440(_Unwind_Exception *a1)
{
}

void *sub_183BFA454(void *a1)
{
  *a1 = &unk_189D38018;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_183BFA498(void *__p)
{
  void *__p = &unk_189D38018;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

uint64_t sub_183BFA4DC(uint64_t result, uint64_t a2)
{
  if (*(_BYTE *)(a2 + 92))
  {
    if (*(void *)(a2 + 16) != *(void *)(a2 + 8) || (*(_BYTE *)(a2 + 88) & 1) != 0)
    {
LABEL_12:
      uint64_t v4 = 0LL;
      *(_DWORD *)a2 = -993;
      goto LABEL_13;
    }
  }

  else
  {
    if (!*(_BYTE *)(result + 16)) {
      goto LABEL_12;
    }
    int v2 = *(unsigned __int8 *)(*(void *)(a2 + 16) - 1LL);
    if (v2 != 13 && v2 != 10) {
      goto LABEL_12;
    }
  }

  *(_DWORD *)a2 = -994;
  uint64_t v4 = *(void *)(result + 8);
LABEL_13:
  *(void *)(a2 + 80) = v4;
  return result;
}

void *sub_183BFA53C(void *a1)
{
  *a1 = &unk_189D38018;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_183BFA580(void *__p)
{
  void *__p = &unk_189D38018;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

uint64_t sub_183BFA5C4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(_BYTE *)(a2 + 88) & 2) == 0
    || *(_BYTE *)(result + 16) && ((int v3 = *v2, v3 != 13) ? (v4 = v3 == 10) : (v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    uint64_t v5 = *(void *)(result + 8);
  }

  else
  {
    uint64_t v5 = 0LL;
    *(_DWORD *)a2 = -993;
  }

  *(void *)(a2 + 80) = v5;
  return result;
}

std::locale *sub_183BFA614(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_189D380D8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_189D38018;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  return a1;
}

void sub_183BFA66C(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_189D380D8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_189D38018;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  operator delete(a1);
}

uint64_t sub_183BFA6C4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 8);
  int v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3) {
    goto LABEL_17;
  }
  BOOL v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 == v3)
  {
    if ((*(_BYTE *)(a2 + 88) & 8) == 0)
    {
      uint64_t v6 = *(v3 - 1);
      goto LABEL_13;
    }

LABEL_17:
    int v10 = 0;
    goto LABEL_25;
  }

  if (v4 == v2)
  {
    int v5 = *(_DWORD *)(a2 + 88);
    if ((v5 & 0x80) == 0)
    {
      if ((v5 & 4) == 0)
      {
        uint64_t v6 = *v2;
LABEL_13:
        if (v6 == 95
          || (v6 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16LL) + 4 * v6) & 0x500) != 0)
        {
          int v10 = 1;
          goto LABEL_25;
        }

        goto LABEL_17;
      }

      goto LABEL_17;
    }
  }

  uint64_t v7 = *(v4 - 1);
  uint64_t v8 = *v4;
  int v9 = v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16LL) + 4 * v7) & 0x500) != 0;
  int v11 = (_DWORD)v8 == 95
     || (v8 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16LL) + 4 * v8) & 0x500) != 0;
  int v10 = v9 != v11;
LABEL_25:
  if (*(unsigned __int8 *)(result + 40) == v10)
  {
    uint64_t v12 = 0LL;
    int v13 = -993;
  }

  else
  {
    uint64_t v12 = *(void *)(result + 8);
    int v13 = -994;
  }

  *(_DWORD *)a2 = v13;
  *(void *)(a2 + 80) = v12;
  return result;
}

uint64_t sub_183BFA7D8(uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  *(void *)a1 = &unk_189D38120;
  *(void *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 24);
  uint64_t v9 = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 40);
  *(void *)(a1 + 64) = v9;
  if (v9)
  {
    int v10 = (unint64_t *)(v9 + 8);
    do
      unint64_t v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }

  *(void *)(a1 + 72) = *(void *)(a2 + 56);
  *(_DWORD *)(a1 + 80) = a5;
  *(_BYTE *)(a1 + 84) = a3;
  return a1;
}

std::locale *sub_183BFA864(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_189D38120;
  uint64_t v2 = a1 + 2;
  sub_183BF7C10((uint64_t)&a1[7]);
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)&unk_189D38018;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  return a1;
}

void sub_183BFA8CC(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_189D38120;
  uint64_t v2 = a1 + 2;
  sub_183BF7C10((uint64_t)&a1[7]);
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)&unk_189D38018;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  operator delete(a1);
}

void sub_183BFA934(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = 0LL;
  uint64_t v24 = 0LL;
  char v25 = 0;
  __int128 v26 = 0uLL;
  char v27 = 0;
  char v28 = 0;
  uint64_t v29 = 0LL;
  __int128 __p = 0LL;
  BOOL v19 = 0LL;
  unint64_t v4 = (*(_DWORD *)(a1 + 44) + 1);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a2 + 24);
  uint64_t v20 = 0LL;
  *(void *)&__int128 v21 = v5;
  *((void *)&v21 + 1) = v5;
  char v22 = 0;
  sub_183BFAF2C((char **)&__p, v4, &v21);
  uint64_t v23 = v6;
  uint64_t v24 = v6;
  char v25 = 0;
  __int128 v26 = v21;
  char v27 = v22;
  uint64_t v29 = v6;
  char v28 = 1;
  uint64_t v7 = *(void *)(a2 + 16);
  if (*(_BYTE *)(a2 + 92)) {
    BOOL v8 = v7 == *(void *)(a2 + 8);
  }
  else {
    BOOL v8 = 0;
  }
  char v9 = v8;
  if (*(unsigned __int8 *)(a1 + 84) == sub_183BFAB2C( a1 + 16,  v7,  *(void *)(a2 + 24),  (uint64_t *)&__p,  *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u,  v9))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0LL;
    int v10 = (char *)__p;
    goto LABEL_13;
  }

  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(a1 + 8);
  int v10 = (char *)__p;
  unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((v19 - (_BYTE *)__p) >> 3);
  if (v11 < 2)
  {
LABEL_13:
    if (!v10) {
      return;
    }
    goto LABEL_14;
  }

  int v12 = 0;
  int v13 = *(_DWORD *)(a1 + 80);
  uint64_t v14 = *(void *)(a2 + 32);
  unint64_t v15 = 1LL;
  do
  {
    int v16 = &v10[24 * v15];
    uint64_t v17 = v14 + 24LL * (v13 + v12);
    *(_OWORD *)uint64_t v17 = *(_OWORD *)v16;
    *(_BYTE *)(v17 + 16) = v16[16];
    unint64_t v15 = (v12 + 2);
    ++v12;
  }

  while (v11 > v15);
LABEL_14:
  BOOL v19 = v10;
  operator delete(v10);
}

void sub_183BFAA9C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_183BFAABC(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(a1 + 24) = a4;
  BOOL v8 = (_OWORD *)(a1 + 24);
  *(void *)(a1 + 32) = a4;
  *(_BYTE *)(a1 + 40) = 0;
  uint64_t result = sub_183BFAF2C((char **)a1, a2, (__int128 *)(a1 + 24));
  *(void *)(a1 + 48) = a3;
  *(void *)(a1 + 56) = a3;
  *(_BYTE *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 72) = *v8;
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a1 + 40);
  if ((a5 & 1) == 0) {
    *(void *)(a1 + 104) = a3;
  }
  *(_BYTE *)(a1 + 96) = 1;
  return result;
}

uint64_t sub_183BFAB2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  char v42 = 0LL;
  char v43 = 0LL;
  unint64_t v44 = 0LL;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    *(void *)&__int128 v40 = a3;
    *((void *)&v40 + 1) = a3;
    char v41 = 0;
    *(_DWORD *)uint64_t v37 = 0;
    memset(&v37[8], 0, 48);
    *(_OWORD *)__int128 __p = 0u;
    memset(v39, 0, 21);
    char v43 = (_OWORD *)sub_183BFB278((uint64_t *)&v42, (uint64_t)v37);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }

    if (*(void *)&v37[32])
    {
      *(void *)&v37[40] = *(void *)&v37[32];
      operator delete(*(void **)&v37[32]);
    }

    uint64_t v34 = a4;
    unint64_t v11 = v43;
    *((_DWORD *)v43 - 24) = 0;
    *((void *)v11 - 11) = a2;
    *((void *)v11 - 10) = a2;
    *((void *)v11 - 9) = a3;
    sub_183BFB174((uint64_t)(v11 - 4), *(unsigned int *)(a1 + 28), &v40);
    sub_183BFB1B0((uint64_t)v43 - 40, *(unsigned int *)(a1 + 32));
    int v12 = v43;
    *((void *)v43 - 2) = v6;
    *((_DWORD *)v12 - 2) = a5;
    *((_BYTE *)v12 - 4) = a6;
    unsigned int v13 = 1;
    while (2)
    {
      unint64_t v15 = v12 - 1;
      uint64_t v14 = *((void *)v12 - 2);
      int v16 = v12 - 6;
      if (v14) {
        (*(void (**)(uint64_t, _OWORD *))(*(void *)v14 + 16LL))(v14, v12 - 6);
      }
      switch(*(_DWORD *)v16)
      {
        case 0xFFFFFC18:
          uint64_t v17 = *((void *)v12 - 10);
          if ((a5 & 0x20) != 0 && v17 == a2 || (a5 & 0x1000) != 0 && v17 != a3) {
            goto LABEL_16;
          }
          uint64_t v25 = *v34;
          *(void *)uint64_t v25 = a2;
          *(void *)(v25 + 8) = v17;
          *(_BYTE *)(v25 + 16) = 1;
          uint64_t v26 = *((void *)v12 - 8);
          uint64_t v27 = *((void *)v12 - 7) - v26;
          if (v27)
          {
            unint64_t v28 = 0xAAAAAAAAAAAAAAABLL * (v27 >> 3);
            uint64_t v29 = (_BYTE *)(v26 + 16);
            unsigned int v30 = 1;
            do
            {
              uint64_t v31 = v25 + 24LL * v30;
              *(_OWORD *)uint64_t v31 = *((_OWORD *)v29 - 1);
              char v32 = *v29;
              v29 += 24;
              *(_BYTE *)(v31 + 16) = v32;
            }

            while (v28 > v30++);
          }

          uint64_t v6 = 1LL;
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_23;
        case 0xFFFFFC1F:
LABEL_16:
          uint64_t v18 = v43 - 6;
          sub_183BFB5E0((uint64_t)&v44, (void *)v43 - 12);
          char v43 = v18;
          goto LABEL_23;
        case 0xFFFFFC20:
          __int128 v19 = *(v12 - 5);
          *(_OWORD *)uint64_t v37 = *v16;
          *(_OWORD *)&v37[16] = v19;
          memset(&v37[32], 0, 24);
          sub_183BFB918( &v37[32],  *((__int128 **)v12 - 8),  *((__int128 **)v12 - 7),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v12 - 7) - *((void *)v12 - 8)) >> 3));
          __p[0] = 0LL;
          __p[1] = 0LL;
          v39[0] = 0LL;
          sub_183BFB994( (char *)__p,  *((__int128 **)v12 - 5),  *((__int128 **)v12 - 4),  (uint64_t)(*((void *)v12 - 4) - *((void *)v12 - 5)) >> 4);
          uint64_t v20 = *v15;
          *(void *)((char *)&v39[1] + 5) = *(void *)((char *)v12 - 11);
          v39[1] = v20;
          (*(void (**)(void, uint64_t, _OWORD *))(*(void *)*v15 + 24LL))(*v15, 1LL, v12 - 6);
          (*(void (**)(void, void, _BYTE *))(*(void *)v39[1] + 24LL))(v39[1], 0LL, v37);
          __int128 v21 = v43;
          if ((unint64_t)v43 >= v44)
          {
            char v43 = (_OWORD *)sub_183BFB278((uint64_t *)&v42, (uint64_t)v37);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }

          else
          {
            __int128 v22 = *(_OWORD *)&v37[16];
            _OWORD *v43 = *(_OWORD *)v37;
            v21[1] = v22;
            *((void *)v21 + 4) = 0LL;
            *((void *)v21 + 5) = 0LL;
            *((void *)v21 + 6) = 0LL;
            *((void *)v21 + 7) = 0LL;
            v21[2] = *(_OWORD *)&v37[32];
            *((void *)v21 + 6) = *(void *)&v37[48];
            memset(&v37[32], 0, 24);
            *((void *)v21 + 8) = 0LL;
            *((void *)v21 + 9) = 0LL;
            *(_OWORD *)((char *)v21 + 56) = *(_OWORD *)__p;
            *((void *)v21 + 9) = v39[0];
            __p[0] = 0LL;
            __p[1] = 0LL;
            v39[0] = 0LL;
            uint64_t v23 = v39[1];
            *(void *)((char *)v21 + 85) = *(void *)((char *)&v39[1] + 5);
            *((void *)v21 + 10) = v23;
            char v43 = v21 + 6;
          }

          if (*(void *)&v37[32])
          {
            *(void *)&v37[40] = *(void *)&v37[32];
            operator delete(*(void **)&v37[32]);
          }

LABEL_23:
          int v12 = v43;
          ++v13;
          if (v42 != v43) {
            continue;
          }
          uint64_t v6 = 0LL;
          break;
        default:
          sub_183BFB22C();
      }

      break;
    }
  }

  *(void *)uint64_t v37 = &v42;
  sub_183BFBA04((void ***)v37);
  return v6;
}

    *(_DWORD *)a2 = -992;
    return result;
  }

  *(_DWORD *)a2 = -994;
LABEL_25:
  a2[10] = *((void *)result + 2);
  return result;
}

void sub_183BFAED4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  a13 = v18 - 112;
  sub_183BFBA04((void ***)&a13);
  _Unwind_Resume(a1);
}

char *sub_183BFAF2C(char **a1, unint64_t a2, __int128 *a3)
{
  uint64_t v6 = (uint64_t)a1[2];
  uint64_t result = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - (uint64_t)result) >> 3) >= a2)
  {
    unint64_t v15 = a1[1];
    unint64_t v16 = (v15 - result) / 24;
    if (v16 >= a2) {
      uint64_t v17 = a2;
    }
    else {
      uint64_t v17 = (v15 - result) / 24;
    }
    if (v17)
    {
      uint64_t v18 = result;
      do
      {
        *(_OWORD *)uint64_t v18 = *a3;
        v18[16] = *((_BYTE *)a3 + 16);
        v18 += 24;
        --v17;
      }

      while (v17);
    }

    if (a2 <= v16)
    {
      a1[1] = &result[24 * a2];
    }

    else
    {
      __int128 v19 = &v15[24 * (a2 - v16)];
      uint64_t v20 = 24 * a2 - 24 * v16;
      do
      {
        __int128 v21 = *a3;
        *((void *)v15 + 2) = *((void *)a3 + 2);
        *(_OWORD *)unint64_t v15 = v21;
        v15 += 24;
        v20 -= 24LL;
      }

      while (v20);
      a1[1] = v19;
    }
  }

  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v6 = 0LL;
      *a1 = 0LL;
      a1[1] = 0LL;
      a1[2] = 0LL;
    }

    if (a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_183BF77E4();
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3);
    uint64_t v9 = 2 * v8;
    if (2 * v8 <= a2) {
      uint64_t v9 = a2;
    }
    if (v8 >= 0x555555555555555LL) {
      unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v10 = v9;
    }
    uint64_t result = sub_183BFB0A0(a1, v10);
    unint64_t v11 = a1[1];
    int v12 = &v11[24 * a2];
    uint64_t v13 = 24 * a2;
    do
    {
      __int128 v14 = *a3;
      *((void *)v11 + 2) = *((void *)a3 + 2);
      *(_OWORD *)unint64_t v11 = v14;
      v11 += 24;
      v13 -= 24LL;
    }

    while (v13);
    a1[1] = v12;
  }

  return result;
}

char *sub_183BFB0A0(void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_183BF77E4();
  }
  uint64_t result = (char *)sub_183BFB0F0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *sub_183BFB0F0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_183BF7310();
  }
  return operator new(24 * a2);
}

void *sub_183BFB134(void *a1)
{
  uint64_t v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }

  int v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }

  return a1;
}

void sub_183BFB174(uint64_t a1, unint64_t a2, __int128 *a3)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v4 = a2 >= v3;
  unint64_t v5 = a2 - v3;
  if (v5 != 0 && v4)
  {
    sub_183BFB698((void **)a1, v5, a3);
  }

  else if (!v4)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 24 * a2;
  }

void sub_183BFB1B0(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 16 * a2;
    }
  }

  else
  {
    sub_183BFB80C((void **)a1, a2 - v2);
  }

void sub_183BFB1E0()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x186E23230](exception, 12LL);
  __cxa_throw(exception, MEMORY[0x1896146C8], MEMORY[0x189614288]);
}

void sub_183BFB218(_Unwind_Exception *a1)
{
}

void sub_183BFB22C()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x186E23230](exception, 16LL);
  __cxa_throw(exception, MEMORY[0x1896146C8], MEMORY[0x189614288]);
}

void sub_183BFB264(_Unwind_Exception *a1)
{
}

uint64_t sub_183BFB278(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 5);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x2AAAAAAAAAAAAAALL) {
    sub_183BF77E4();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 5);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x155555555555555LL) {
    unint64_t v9 = 0x2AAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  v16[4] = a1 + 2;
  if (v9) {
    unint64_t v10 = (char *)sub_183BFB438(v7, v9);
  }
  else {
    unint64_t v10 = 0LL;
  }
  unint64_t v11 = &v10[96 * v4];
  v16[0] = v10;
  v16[1] = v11;
  v16[3] = &v10[96 * v9];
  __int128 v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)unint64_t v11 = *(_OWORD *)a2;
  *((_OWORD *)v11 + 1) = v12;
  *((void *)v11 + 5) = 0LL;
  *((void *)v11 + 6) = 0LL;
  *((void *)v11 + 4) = 0LL;
  *((_OWORD *)v11 + 2) = *(_OWORD *)(a2 + 32);
  *((void *)v11 + 6) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0LL;
  *(void *)(a2 + 40) = 0LL;
  *(void *)(a2 + 48) = 0LL;
  *((void *)v11 + 7) = 0LL;
  *((void *)v11 + 8) = 0LL;
  *((void *)v11 + 9) = 0LL;
  *(_OWORD *)(v11 + 56) = *(_OWORD *)(a2 + 56);
  *((void *)v11 + 9) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0LL;
  *(void *)(a2 + 64) = 0LL;
  *(void *)(a2 + 72) = 0LL;
  uint64_t v13 = *(void *)(a2 + 80);
  *(void *)(v11 + 85) = *(void *)(a2 + 85);
  *((void *)v11 + 10) = v13;
  v16[2] = v11 + 96;
  sub_183BFB3C4(a1, v16);
  uint64_t v14 = a1[1];
  sub_183BFB624(v16);
  return v14;
}

void sub_183BFB3B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_183BFB3C4(uint64_t *a1, void *a2)
{
  uint64_t result = sub_183BFB47C((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_183BFB438(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAABLL) {
    sub_183BF7310();
  }
  return operator new(96 * a2);
}

uint64_t sub_183BFB47C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
      __int128 v8 = *(_OWORD *)(a3 - 80);
      *(_OWORD *)(v7 - 96) = *(_OWORD *)(a3 - 96);
      *(_OWORD *)(v7 - 80) = v8;
      *(void *)(v7 - 56) = 0LL;
      *(void *)(v7 - 48) = 0LL;
      *(void *)(v7 - 64) = 0LL;
      *(_OWORD *)(v7 - 64) = *(_OWORD *)(a3 - 64);
      *(void *)(v7 - 48) = *(void *)(a3 - 48);
      *(void *)(a3 - 64) = 0LL;
      *(void *)(a3 - 56) = 0LL;
      *(void *)(a3 - 48) = 0LL;
      *(void *)(v7 - 40) = 0LL;
      *(void *)(v7 - 32) = 0LL;
      *(void *)(v7 - 24) = 0LL;
      *(_OWORD *)(v7 - 40) = *(_OWORD *)(a3 - 40);
      *(void *)(v7 - 24) = *(void *)(a3 - 24);
      *(void *)(a3 - 40) = 0LL;
      *(void *)(a3 - 32) = 0LL;
      *(void *)(a3 - 24) = 0LL;
      uint64_t v9 = *(void *)(a3 - 16);
      *(void *)(v7 - 11) = *(void *)(a3 - 11);
      *(void *)(v7 - 16) = v9;
      uint64_t v7 = *((void *)&v15 + 1) - 96LL;
      *((void *)&v15 + 1) -= 96LL;
      a3 -= 96LL;
    }

    while (a3 != a5);
    uint64_t v10 = v15;
  }

  char v13 = 1;
  sub_183BFB55C((uint64_t)v12);
  return v10;
}

uint64_t sub_183BFB55C(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_183BFB590((uint64_t *)a1);
  }
  return a1;
}

void sub_183BFB590(uint64_t *a1)
{
  uint64_t v1 = *(void **)(a1[2] + 8);
  unint64_t v2 = *(void **)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      sub_183BFB5E0(v3, v1);
      v1 += 12;
    }

    while (v1 != v2);
  }

void sub_183BFB5E0(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)a2[7];
  if (v3)
  {
    a2[8] = v3;
    operator delete(v3);
  }

  unint64_t v4 = (void *)a2[4];
  if (v4)
  {
    a2[5] = v4;
    operator delete(v4);
  }

void **sub_183BFB624(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_183BFB654(void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 96;
    sub_183BFB5E0(v4, (void *)(i - 96));
  }

void sub_183BFB698(void **a1, unint64_t a2, __int128 *a3)
{
  __int128 v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  uint64_t v9 = *(void **)(v6 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (_BYTE *)v9) >> 3) >= a2)
  {
    if (a2)
    {
      __int128 v15 = &v9[3 * a2];
      uint64_t v16 = 24 * a2;
      do
      {
        __int128 v17 = *a3;
        v9[2] = *((void *)a3 + 2);
        *(_OWORD *)uint64_t v9 = v17;
        v9 += 3;
        v16 -= 24LL;
      }

      while (v16);
      uint64_t v9 = v15;
    }

    a1[1] = v9;
  }

  else
  {
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v9 - (_BYTE *)*a1) >> 3);
    unint64_t v11 = v10 + a2;
    if (v10 + a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_183BF77E4();
    }
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (_BYTE *)*a1) >> 3);
    if (2 * v12 > v11) {
      unint64_t v11 = 2 * v12;
    }
    if (v12 >= 0x555555555555555LL) {
      unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13) {
      __int128 v14 = (char *)sub_183BFB0F0(v6, v13);
    }
    else {
      __int128 v14 = 0LL;
    }
    uint64_t v18 = &v14[24 * v10];
    __int128 v19 = &v18[24 * a2];
    uint64_t v20 = 24 * a2;
    __int128 v21 = v18;
    do
    {
      __int128 v22 = *a3;
      *((void *)v21 + 2) = *((void *)a3 + 2);
      *(_OWORD *)__int128 v21 = v22;
      v21 += 24;
      v20 -= 24LL;
    }

    while (v20);
    uint64_t v23 = &v14[24 * v13];
    uint64_t v25 = (char *)*a1;
    uint64_t v24 = (char *)a1[1];
    if (v24 != *a1)
    {
      do
      {
        __int128 v26 = *(_OWORD *)(v24 - 24);
        *((void *)v18 - 1) = *((void *)v24 - 1);
        *(_OWORD *)(v18 - 24) = v26;
        v18 -= 24;
        v24 -= 24;
      }

      while (v24 != v25);
      uint64_t v24 = (char *)*a1;
    }

    *a1 = v18;
    a1[1] = v19;
    a1[2] = v23;
    if (v24) {
      operator delete(v24);
    }
  }

void sub_183BFB80C(void **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 4)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 16 * a2);
      v7 += 16 * a2;
    }

    a1[1] = v7;
  }

  else
  {
    uint64_t v8 = v7 - (_BYTE *)*a1;
    unint64_t v9 = a2 + (v8 >> 4);
    if (v9 >> 60) {
      sub_183BF77E4();
    }
    uint64_t v10 = v8 >> 4;
    uint64_t v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 3 > v9) {
      unint64_t v9 = v11 >> 3;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      unint64_t v13 = (char *)sub_183BF7BDC(v4, v12);
    }
    else {
      unint64_t v13 = 0LL;
    }
    __int128 v14 = &v13[16 * v10];
    __int128 v15 = &v13[16 * v12];
    bzero(v14, 16 * a2);
    uint64_t v16 = &v14[16 * a2];
    uint64_t v18 = (char *)*a1;
    __int128 v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v17 - 1);
        v14 -= 16;
        v17 -= 16;
      }

      while (v17 != v18);
      __int128 v17 = (char *)*a1;
    }

    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17) {
      operator delete(v17);
    }
  }

char *sub_183BFB918(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = sub_183BFB0A0(result, a4);
    uint64_t v7 = *((void *)v6 + 1);
    while (a2 != a3)
    {
      __int128 v8 = *a2;
      *(void *)(v7 + 16) = *((void *)a2 + 2);
      *(_OWORD *)uint64_t v7 = v8;
      v7 += 24LL;
      a2 = (__int128 *)((char *)a2 + 24);
    }

    *((void *)v6 + 1) = v7;
  }

  return result;
}

void sub_183BFB978(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_183BFB994(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = sub_183BF7B9C(result, a4);
    uint64_t v7 = (_OWORD *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      __int128 v8 = *a2++;
      *v7++ = v8;
    }

    *((void *)v6 + 1) = v7;
  }

  return result;
}

void sub_183BFB9E8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void sub_183BFBA04(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 12;
        sub_183BFB5E0((uint64_t)(v1 + 2), v4);
      }

      while (v4 != v2);
      uint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

unsigned __int8 *sub_183BFBA88(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3 || *a2 != 92) {
    return a2;
  }
  uint64_t v5 = a2 + 1;
  if (a2 + 1 == a3) {
    sub_183BFBE3C();
  }
  uint64_t result = sub_183BFBE88(a1, a2 + 1, a3);
  if (v5 == result)
  {
    uint64_t result = (unsigned __int8 *)sub_183BFBF3C(a1, (char *)a2 + 1, (char *)a3);
    if (v5 == result)
    {
      uint64_t result = sub_183BFC008(a1, a2 + 1, (char *)a3, 0LL);
      if (v5 == result) {
        return a2;
      }
    }
  }

  return result;
}

char *sub_183BFBB28(uint64_t a1, char *a2, char *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3) {
      goto LABEL_20;
    }
    uint64_t v5 = a2[1] == 94 ? a2 + 2 : a2 + 1;
    uint64_t v6 = (uint64_t *)sub_183BFCC8C(a1, a2[1] == 94);
    if (v5 == a3) {
      goto LABEL_20;
    }
    uint64_t v7 = v6;
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *v5 == 93)
    {
      sub_183BFCD04((uint64_t)v6, 93LL);
      ++v5;
    }

    if (v5 == a3) {
      goto LABEL_20;
    }
    do
    {
      __int128 v8 = v5;
      uint64_t v5 = sub_183BFE128(a1, v5, a3, v7);
    }

    while (v8 != v5);
    if (v8 == a3) {
      goto LABEL_20;
    }
    if (*v8 == 45)
    {
      sub_183BFCD04((uint64_t)v7, 45LL);
      ++v8;
    }

    if (v8 == a3 || *v8 != 93) {
LABEL_20:
    }
      sub_183BFE0DC();
    return v8 + 1;
  }

  return a2;
}

void *sub_183BFBC38(void *result)
{
  if ((result[3] & 2) == 0)
  {
    uint64_t v1 = result;
    uint64_t result = operator new(0x18uLL);
    int v2 = *((_DWORD *)v1 + 7) + 1;
    *((_DWORD *)v1 + 7) = v2;
    uint64_t v3 = v1[7];
    uint64_t v4 = *(void *)(v3 + 8);
    *uint64_t result = &unk_189D383A8;
    result[1] = v4;
    *((_DWORD *)result + 4) = v2;
    *(void *)(v3 + 8) = result;
    v1[7] = *(void *)(v1[7] + 8LL);
  }

  return result;
}

void *sub_183BFBC9C(void *result, int a2)
{
  if ((result[3] & 2) == 0)
  {
    uint64_t v3 = result;
    uint64_t result = operator new(0x18uLL);
    uint64_t v4 = v3[7];
    uint64_t v5 = *(void *)(v4 + 8);
    *uint64_t result = &unk_189D383F0;
    result[1] = v5;
    *((_DWORD *)result + 4) = a2;
    *(void *)(v4 + 8) = result;
    v3[7] = *(void *)(v3[7] + 8LL);
  }

  return result;
}

void sub_183BFBCF8()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x186E23230](exception, 11LL);
  __cxa_throw(exception, MEMORY[0x1896146C8], MEMORY[0x189614288]);
}

void sub_183BFBD30(_Unwind_Exception *a1)
{
}

_BYTE *sub_183BFBD44(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3)
  {
    int v4 = (char)*a2;
    BOOL v5 = (v4 - 36) > 0x3A || ((1LL << (*a2 - 36)) & 0x7800000080004F1LL) == 0;
    if (v5 && (v4 - 123) >= 3)
    {
      sub_183BFC2E4(a1, (char)v4);
      ++v3;
    }
  }

  return v3;
}

void *sub_183BFBDB4(void *a1)
{
  *a1 = &unk_189D38018;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_183BFBDF8(void *__p)
{
  void *__p = &unk_189D38018;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

void sub_183BFBE3C()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x186E23230](exception, 3LL);
  __cxa_throw(exception, MEMORY[0x1896146C8], MEMORY[0x189614288]);
}

void sub_183BFBE74(_Unwind_Exception *a1)
{
}

unsigned __int8 *sub_183BFBE88(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3)
  {
    int v4 = *a2;
    uint64_t v5 = (v4 - 48);
    if (v4 == 48)
    {
      sub_183BFC2E4(a1, v5);
      return ++v3;
    }

    if (++v3 == a3)
    {
      uint64_t v3 = a3;
    }

    else
    {
      while (1)
      {
        int v6 = *v3;
        ++v3;
        LODWORD(v5) = v6 + 10 * v5 - 48;
        if (v3 == a3)
        {
          uint64_t v3 = a3;
          break;
        }
      }

      if (!(_DWORD)v5) {
        goto LABEL_16;
      }
    }

    if (v5 <= *(_DWORD *)(a1 + 28))
    {
      sub_183BFC414(a1, v5);
      return v3;
    }

LABEL_16:
    sub_183BFC3C8();
  }

  return v3;
}

  if (v14 == a3
    || (__int128 v15 = *v14, v15 == 93)
    || (__int128 v17 = v14 + 1, v14 + 1 == a3)
    || v15 != 45
    || *v17 == 93)
  {
    if ((char)v26.__r_.__value_.__s.__size_ < 0)
    {
      if (v26.__r_.__value_.__l.__size_)
      {
        if (v26.__r_.__value_.__l.__size_ != 1)
        {
          uint64_t v16 = (std::string *)v26.__r_.__value_.__r.__words[0];
LABEL_40:
          sub_183BFEF1C( v6,  v16->__r_.__value_.__s.__data_[0],  v16->__r_.__value_.__s.__data_[1]);
          goto LABEL_41;
        }

        uint64_t v16 = (std::string *)v26.__r_.__value_.__r.__words[0];
        goto LABEL_25;
      }
    }

    else if (v26.__r_.__value_.__s.__size_)
    {
      uint64_t v16 = &v26;
      if (v26.__r_.__value_.__s.__size_ != 1) {
        goto LABEL_40;
      }
LABEL_25:
      sub_183BFCD04(v6, v16->__r_.__value_.__s.__data_[0]);
    }

  if (v14 == a3
    || (__int128 v15 = *v14, v15 == 93)
    || (uint64_t v16 = v14 + 1, v14 + 1 == a3)
    || v15 != 45
    || *v16 == 93)
  {
    if ((char)v26.__r_.__value_.__s.__size_ < 0)
    {
      if (v26.__r_.__value_.__l.__size_)
      {
        if (v26.__r_.__value_.__l.__size_ != 1)
        {
          __int128 v17 = (std::string *)v26.__r_.__value_.__r.__words[0];
LABEL_36:
          sub_183BFEF1C( v6,  v17->__r_.__value_.__s.__data_[0],  v17->__r_.__value_.__s.__data_[1]);
          goto LABEL_37;
        }

        __int128 v17 = (std::string *)v26.__r_.__value_.__r.__words[0];
        goto LABEL_28;
      }
    }

    else if (v26.__r_.__value_.__s.__size_)
    {
      __int128 v17 = &v26;
      if (v26.__r_.__value_.__s.__size_ != 1) {
        goto LABEL_36;
      }
LABEL_28:
      sub_183BFCD04(v6, v17->__r_.__value_.__s.__data_[0]);
    }

char *sub_183BFBF3C(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v4 = *a2;
  if (v4 > 99)
  {
    if (v4 == 119)
    {
      char v5 = 0;
      goto LABEL_15;
    }

    if (v4 == 115)
    {
      char v9 = 0;
      goto LABEL_17;
    }

    if (v4 != 100) {
      return v3;
    }
    char v6 = 0;
LABEL_12:
    uint64_t v7 = sub_183BFCC8C(a1, v6);
    int v8 = v7[40] | 0x400;
LABEL_18:
    v7[40] = v8;
    goto LABEL_19;
  }

  switch(v4)
  {
    case 'D':
      char v6 = 1;
      goto LABEL_12;
    case 'S':
      char v9 = 1;
LABEL_17:
      uint64_t v7 = sub_183BFCC8C(a1, v9);
      int v8 = v7[40] | 0x4000;
      goto LABEL_18;
    case 'W':
      char v5 = 1;
LABEL_15:
      uint64_t v10 = sub_183BFCC8C(a1, v5);
      v10[40] |= 0x500u;
      sub_183BFCD04((uint64_t)v10, 95LL);
LABEL_19:
      ++v3;
      break;
  }

  return v3;
}

unsigned __int8 *sub_183BFC008(uint64_t a1, unsigned __int8 *a2, char *a3, std::string *this)
{
  int v4 = a2;
  if (a2 != (unsigned __int8 *)a3)
  {
    int v5 = (char)*a2;
    if (v5 > 109)
    {
      char v6 = 0;
      switch(*a2)
      {
        case 'n':
          if (this)
          {
            uint64_t v7 = this;
            LOBYTE(v8) = 10;
            goto LABEL_52;
          }

          uint64_t v8 = 10LL;
          goto LABEL_61;
        case 'r':
          if (this)
          {
            uint64_t v7 = this;
            LOBYTE(v8) = 13;
            goto LABEL_52;
          }

          uint64_t v8 = 13LL;
          goto LABEL_61;
        case 't':
          if (this)
          {
            uint64_t v7 = this;
            LOBYTE(v8) = 9;
            goto LABEL_52;
          }

          uint64_t v8 = 9LL;
          goto LABEL_61;
        case 'u':
          int v9 = a2[1];
          if ((v9 & 0xF8) != 0x30 && (v9 & 0xFE) != 0x38 && (v9 | 0x20u) - 97 >= 6) {
            goto LABEL_66;
          }
          int v4 = a2 + 2;
          int v10 = *v4;
          char v11 = -48;
          if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38) {
            goto LABEL_24;
          }
          v10 |= 0x20u;
          char v11 = -87;
LABEL_24:
          char v6 = 16 * (v11 + v10);
LABEL_25:
          int v12 = v4[1];
          char v13 = -48;
          if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38) {
            goto LABEL_30;
          }
          v12 |= 0x20u;
          char v13 = -87;
LABEL_30:
          int v14 = v4[2];
          char v15 = -48;
          if ((v14 & 0xF8) == 0x30 || (v14 & 0xFE) == 0x38) {
            goto LABEL_35;
          }
          v14 |= 0x20u;
          char v15 = -87;
LABEL_35:
          if (this) {
            std::string::operator=(this, v15 + v14 + 16 * (v13 + v12 + v6));
          }
          else {
            sub_183BFC2E4(a1, (char)(v15 + v14 + 16 * (v13 + v12 + v6)));
          }
          v4 += 3;
          return v4;
        case 'v':
          if (this)
          {
            uint64_t v7 = this;
            LOBYTE(v8) = 11;
            goto LABEL_52;
          }

          uint64_t v8 = 11LL;
          break;
        case 'x':
          goto LABEL_25;
        default:
          goto LABEL_47;
      }

      goto LABEL_61;
    }

    if (v5 == 48)
    {
      if (this)
      {
        uint64_t v7 = this;
        LOBYTE(v8) = 0;
        goto LABEL_52;
      }

      uint64_t v8 = 0LL;
LABEL_61:
      sub_183BFC2E4(a1, v8);
      return ++v4;
    }

    if (v5 != 99)
    {
      if (v5 == 102)
      {
        if (this)
        {
          uint64_t v7 = this;
          LOBYTE(v8) = 12;
LABEL_52:
          std::string::operator=(v7, v8);
          return ++v4;
        }

        uint64_t v8 = 12LL;
        goto LABEL_61;
      }

LABEL_47:
      if (*a2 != 95
        && ((v5 & 0x80) != 0 || (*(_DWORD *)(*(void *)(*(void *)(a1 + 8) + 16LL) + 4LL * *a2) & 0x500) == 0))
      {
        uint64_t v8 = (char)v5;
        if (this)
        {
          uint64_t v7 = this;
          goto LABEL_52;
        }

        goto LABEL_61;
      }

LABEL_66:
      sub_183BFBE3C();
    }

    unsigned int v16 = a2[1];
    if (this) {
      std::string::operator=(this, v16 & 0x1F);
    }
    else {
      sub_183BFC2E4(a1, v16 & 0x1F);
    }
    v4 += 2;
  }

  return v4;
}

  char v43 = *(_DWORD *)(a1 + 164);
  if (v43 || *(void *)(a1 + 64) != *(void *)(a1 + 72))
  {
    if ((v39 & 0x80) != 0 || (*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16LL) + 4LL * v39) & v43) == 0) {
      unint64_t v44 = (v39 == 95) & (v43 >> 7);
    }
    else {
      LOBYTE(v44) = 1;
    }
    char v45 = *(void **)(a1 + 72);
    char v46 = memchr(*(const void **)(a1 + 64), (char)v39, (size_t)v45 - *(void *)(a1 + 64));
    uint64_t v47 = v46 ? v46 : v45;
    if ((v44 & 1) == 0 && v47 == v45) {
      goto LABEL_77;
    }
  }

  char v49 = *(void *)(a1 + 88);
  char v48 = *(void *)(a1 + 96);
  if (v49 != v48)
  {
    if (*(_BYTE *)(a1 + 170))
    {
      sub_183BFDC6C(a1 + 16, (char *)&v121, (char *)&v122);
      char v49 = *(void *)(a1 + 88);
      char v48 = *(void *)(a1 + 96);
    }

    else
    {
      __p.__r_.__value_.__s.__size_ = 1;
      LOWORD(__p.__r_.__value_.__l.__data_) = v39;
    }

    char v50 = v48 - v49;
    if (v50)
    {
      v117 = v37;
      v114 = v36;
      uint64_t v51 = 0LL;
      uint64_t v52 = v50 / 48;
      __int128 v112 = __p.__r_.__value_.__s.__size_;
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v53 = __p.__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v53 = __p.__r_.__value_.__l.__size_;
      }
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v54 = &__p;
      }
      else {
        uint64_t v54 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if (v52 <= 1) {
        uint64_t v55 = 1LL;
      }
      else {
        uint64_t v55 = v50 / 48;
      }
      uint64_t v56 = 1;
      while (1)
      {
        std::locale v57 = *(char *)(v49 + 23);
        if (v57 >= 0) {
          int v58 = *(unsigned __int8 *)(v49 + 23);
        }
        else {
          int v58 = *(void *)(v49 + 8);
        }
        if (v57 >= 0) {
          v59 = (const void *)v49;
        }
        else {
          v59 = *(const void **)v49;
        }
        if (v58 >= v53) {
          size_t v60 = v53;
        }
        else {
          size_t v60 = v58;
        }
        unsigned __int8 v61 = memcmp(v54, v59, v60);
        std::string v62 = v53 >= v58;
        if (v61) {
          std::string v62 = v61 >= 0;
        }
        if (v62)
        {
          std::string v63 = *(char *)(v49 + 47);
          if (v63 >= 0) {
            __int128 v64 = *(unsigned __int8 *)(v49 + 47);
          }
          else {
            __int128 v64 = *(void *)(v49 + 32);
          }
          if (v63 >= 0) {
            unint64_t v65 = (const void *)(v49 + 24);
          }
          else {
            unint64_t v65 = *(const void **)(v49 + 24);
          }
          if (v53 >= v64) {
            v66 = v64;
          }
          else {
            v66 = v53;
          }
          uint64_t v67 = memcmp(v65, v54, v66);
          v68 = v64 >= v53;
          if (v67) {
            v68 = v67 >= 0;
          }
          if (v68) {
            break;
          }
        }

        uint64_t v56 = ++v51 < v52;
        v49 += 48LL;
        if (v55 == v51)
        {
          uint64_t v36 = v114;
          goto LABEL_123;
        }
      }

      uint64_t v36 = 1;
LABEL_123:
      uint64_t v37 = v117;
      if ((v112 & 0x80) == 0) {
        goto LABEL_125;
      }
    }

    else
    {
      uint64_t v56 = 0;
      if ((__p.__r_.__value_.__s.__size_ & 0x80) == 0) {
        goto LABEL_125;
      }
    }

    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_125:
    if (v56) {
      goto LABEL_221;
    }
  }

  if (*(void *)(a1 + 136) == *(void *)(a1 + 144)) {
    goto LABEL_154;
  }
  sub_183BFDF40(a1 + 16, (char *)&v121, (char *)&v122, (uint64_t)&__p);
  v69 = *(void *)(a1 + 136);
  v70 = __p.__r_.__value_.__s.__size_;
  v71 = *(void *)(a1 + 144) - v69;
  if (v71)
  {
    unint64_t v118 = v37;
    __int128 v72 = 0LL;
    int64x2_t v73 = v71 / 24;
    v74 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v75 = __p.__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v75 = __p.__r_.__value_.__l.__size_;
    }
    if (v73 <= 1) {
      v76 = 1LL;
    }
    else {
      v76 = v71 / 24;
    }
    v77 = 1;
    while (1)
    {
      unint64_t v78 = (unsigned __int8 **)(v69 + 24 * v72);
      int v79 = (unsigned __int8 *)*((unsigned __int8 *)v78 + 23);
      v80 = (char)v79;
      if ((unsigned __int8 *)v75 == v79)
      {
        if (v80 >= 0) {
          v81 = (unsigned __int8 *)(v69 + 24 * v72);
        }
        else {
          v81 = *v78;
        }
        if ((v70 & 0x80) != 0)
        {
          uint64_t v115 = v36;
          uint64_t v84 = v73;
          int64x2_t v113 = v76;
          unint64_t v85 = memcmp((const void *)v74, v81, *((size_t *)&v74 + 1));
          v76 = v113;
          int64x2_t v73 = v84;
          uint64_t v36 = v115;
          if (!v85)
          {
            uint64_t v36 = 1;
            uint64_t v37 = v118;
            goto LABEL_152;
          }
        }

        else
        {
          if (!(_DWORD)v70)
          {
            uint64_t v36 = 1;
            uint64_t v37 = v118;
            if (!v77) {
              goto LABEL_154;
            }
            goto LABEL_221;
          }

          v82 = &__p;
          uint64_t v83 = v70;
          while (v82->__r_.__value_.__s.__data_[0] == *v81)
          {
            v82 = (std::string *)((char *)v82 + 1);
            ++v81;
            if (!--v83)
            {
              uint64_t v36 = 1;
              goto LABEL_149;
            }
          }
        }
      }

      v77 = ++v72 < v73;
      if (v72 == v76)
      {
LABEL_149:
        uint64_t v37 = v118;
        if ((v70 & 0x80) == 0) {
          goto LABEL_153;
        }
        goto LABEL_152;
      }
    }
  }

  v77 = 0;
  if ((__p.__r_.__value_.__s.__size_ & 0x80) != 0) {
LABEL_152:
  }
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_153:
  if (!v77)
  {
LABEL_154:
    uint64_t v86 = *(_DWORD *)(a1 + 160);
    if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16LL) + 4LL * v121) & v86) == 0)
    {
      unint64_t v87 = (v86 >> 7) & 1;
      if (v121 != 95) {
        unint64_t v87 = 0;
      }
      if (v87 != 1) {
        goto LABEL_221;
      }
    }

    goto LABEL_77;
  }

uint64_t sub_183BFC2E4(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a1 + 24);
  if ((v4 & 1) != 0)
  {
    uint64_t v8 = (char *)operator new(0x30uLL);
    uint64_t result = sub_183BFC4E0((uint64_t)v8, a1, a2, *(void *)(*(void *)(a1 + 56) + 8LL));
LABEL_6:
    *(void *)(*(void *)(a1 + 56) + 8LL) = v8;
    goto LABEL_7;
  }

  if ((v4 & 8) != 0)
  {
    uint64_t v8 = (char *)operator new(0x30uLL);
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8LL);
    *(void *)uint64_t v8 = &unk_189D381F8;
    *((void *)v8 + 1) = v9;
    uint64_t result = (uint64_t)std::locale::locale((std::locale *)v8 + 2, (const std::locale *)a1);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)(a1 + 8);
    v8[40] = a2;
    goto LABEL_6;
  }

  uint64_t result = (uint64_t)operator new(0x18uLL);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(v6 + 8);
  *(void *)uint64_t result = &unk_189D38240;
  *(void *)(result + 8) = v7;
  *(_BYTE *)(result + 16) = a2;
  *(void *)(v6 + 8) = result;
LABEL_7:
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  return result;
}

void sub_183BFC3B4(_Unwind_Exception *a1)
{
}

void sub_183BFC3C8()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x186E23230](exception, 4LL);
  __cxa_throw(exception, MEMORY[0x1896146C8], MEMORY[0x189614288]);
}

void sub_183BFC400(_Unwind_Exception *a1)
{
}

void *sub_183BFC414(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)(a1 + 24);
  if ((v4 & 1) != 0)
  {
    uint64_t v8 = (std::locale *)operator new(0x30uLL);
    uint64_t v9 = v8;
    int v10 = *(std::locale::__imp **)(*(void *)(a1 + 56) + 8LL);
    char v11 = (char *)&unk_189D38278;
LABEL_6:
    v8->__locale_ = (std::locale::__imp *)(v11 + 16);
    v8[1].__locale_ = v10;
    uint64_t result = std::locale::locale(v8 + 2, (const std::locale *)a1);
    *(_OWORD *)&v9[3].__locale_ = *(_OWORD *)(a1 + 8);
    LODWORD(v9[5].__locale_) = a2;
    *(void *)(*(void *)(a1 + 56) + 8LL) = v9;
    goto LABEL_7;
  }

  if ((v4 & 8) != 0)
  {
    uint64_t v8 = (std::locale *)operator new(0x30uLL);
    uint64_t v9 = v8;
    int v10 = *(std::locale::__imp **)(*(void *)(a1 + 56) + 8LL);
    char v11 = (char *)&unk_189D382C0;
    goto LABEL_6;
  }

  uint64_t result = operator new(0x18uLL);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(v6 + 8);
  *uint64_t result = &unk_189D38318;
  result[1] = v7;
  *((_DWORD *)result + 4) = a2;
  *(void *)(v6 + 8) = result;
LABEL_7:
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  return result;
}

uint64_t sub_183BFC4E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_189D381B0;
  *(void *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 40) = (*(uint64_t (**)(void, uint64_t))(**(void **)(a2 + 8) + 40LL))( *(void *)(a2 + 8),  a3);
  return a1;
}

void sub_183BFC54C(_Unwind_Exception *a1)
{
  *uint64_t v1 = &unk_189D38018;
  uint64_t v4 = v1[1];
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8LL))(v4);
  }
  _Unwind_Resume(a1);
}

std::locale *sub_183BFC584(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_189D381B0;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_189D38018;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  return a1;
}

void sub_183BFC5DC(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_189D381B0;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_189D38018;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  operator delete(a1);
}

uint64_t sub_183BFC634(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (uint64_t v4 = result,
        uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(result + 24) + 40LL))( *(void *)(result + 24),  *v3),  *(unsigned __int8 *)(v4 + 40) != result))
  {
    uint64_t v5 = 0LL;
    *(_DWORD *)a2 = -993;
  }

  else
  {
    *(_DWORD *)a2 = -995;
    ++*(void *)(a2 + 16);
    uint64_t v5 = *(void *)(v4 + 8);
  }

  *(void *)(a2 + 80) = v5;
  return result;
}

std::locale *sub_183BFC6AC(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_189D381F8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_189D38018;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  return a1;
}

void sub_183BFC704(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_189D381F8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_189D38018;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  operator delete(a1);
}

uint64_t sub_183BFC75C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    uint64_t v3 = 0LL;
    *(_DWORD *)a2 = -993;
  }

  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }

  *(void *)(a2 + 80) = v3;
  return result;
}

void *sub_183BFC7A4(void *a1)
{
  *a1 = &unk_189D38018;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_183BFC7E8(void *__p)
{
  void *__p = &unk_189D38018;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

uint64_t sub_183BFC82C(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    uint64_t v3 = 0LL;
    *(_DWORD *)a2 = -993;
  }

  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }

  *(void *)(a2 + 80) = v3;
  return result;
}

std::locale *sub_183BFC874(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_189D38288;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_189D38018;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  return a1;
}

void sub_183BFC8CC(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_189D38288;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_189D38018;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  operator delete(a1);
}

uint64_t sub_183BFC924(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32) + 24LL * (*(_DWORD *)(result + 40) - 1);
  if (*(_BYTE *)(v3 + 16))
  {
    uint64_t v4 = *(void *)(v3 + 8) - *(void *)v3;
    uint64_t v5 = *(void *)(a2 + 16);
    if (*(void *)(a2 + 24) - v5 >= v4)
    {
      uint64_t v7 = result;
      if (v4 < 1)
      {
LABEL_9:
        *(_DWORD *)a2 = -994;
        *(void *)(a2 + 16) = v5 + v4;
        uint64_t v6 = *(void *)(v7 + 8);
        goto LABEL_10;
      }

      uint64_t v8 = 0LL;
      while (1)
      {
        int v9 = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40LL))( *(void *)(v7 + 24),  *(char *)(*(void *)v3 + v8));
        uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40LL))( *(void *)(v7 + 24),  *(char *)(*(void *)(a2 + 16) + v8));
        if (v9 != (_DWORD)result) {
          break;
        }
        if (v4 == ++v8)
        {
          uint64_t v5 = *(void *)(a2 + 16);
          goto LABEL_9;
        }
      }
    }
  }

  uint64_t v6 = 0LL;
  *(_DWORD *)a2 = -993;
LABEL_10:
  *(void *)(a2 + 80) = v6;
  return result;
}

std::locale *sub_183BFCA08(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_189D382D0;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_189D38018;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  return a1;
}

void sub_183BFCA60(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_189D382D0;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_189D38018;
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8LL))(locale);
  }
  operator delete(a1);
}

uint64_t sub_183BFCAB8(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(result + 40) - 1;
  uint64_t v3 = *(void *)(a2 + 32);
  if (*(_BYTE *)(v3 + 24LL * v2 + 16))
  {
    uint64_t v4 = (unsigned __int8 **)(v3 + 24LL * v2);
    uint64_t v5 = *v4;
    uint64_t v6 = v4[1] - *v4;
    uint64_t v7 = *(void *)(a2 + 16);
    if (*(void *)(a2 + 24) - v7 >= v6)
    {
      if (v6 < 1)
      {
LABEL_8:
        *(_DWORD *)a2 = -994;
        *(void *)(a2 + 16) = v7 + v6;
        uint64_t v8 = *(void *)(result + 8);
        goto LABEL_9;
      }

      int v9 = *(unsigned __int8 **)(a2 + 16);
      uint64_t v10 = v6;
      while (1)
      {
        int v12 = *v5++;
        int v11 = v12;
        int v13 = *v9++;
        if (v11 != v13) {
          break;
        }
        if (!--v10) {
          goto LABEL_8;
        }
      }
    }
  }

  uint64_t v8 = 0LL;
  *(_DWORD *)a2 = -993;
LABEL_9:
  *(void *)(a2 + 80) = v8;
  return result;
}

void *sub_183BFCB48(void *a1)
{
  *a1 = &unk_189D38018;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_183BFCB8C(void *__p)
{
  void *__p = &unk_189D38018;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

unsigned int *sub_183BFCBD0(unsigned int *result, uint64_t a2)
{
  unint64_t v2 = result[4];
  uint64_t v3 = *(void *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a2 + 40) - v3) >> 3) < v2) {
    sub_183BFC3C8();
  }
  unsigned int v5 = v2 - 1;
  if (*(_BYTE *)(v3 + 24LL * v5 + 16)
    && (uint64_t v6 = result,
        uint64_t v7 = v3 + 24LL * v5,
        uint64_t result = *(unsigned int **)v7,
        int64_t v8 = *(void *)(v7 + 8) - *(void *)v7,
        uint64_t v9 = *(void *)(a2 + 16),
        *(void *)(a2 + 24) - v9 >= v8)
    && (uint64_t result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !(_DWORD)result))
  {
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 16) = v9 + v8;
    uint64_t v10 = *((void *)v6 + 1);
  }

  else
  {
    uint64_t v10 = 0LL;
    *(_DWORD *)a2 = -993;
  }

  *(void *)(a2 + 80) = v10;
  return result;
}

void *sub_183BFCC8C(uint64_t a1, char a2)
{
  uint64_t v4 = operator new(0xB0uLL);
  sub_183BFCF30( (uint64_t)v4,  a1,  *(void *)(*(void *)(a1 + 56) + 8LL),  a2,  *(_DWORD *)(a1 + 24) & 1,  (*(_DWORD *)(a1 + 24) & 8) != 0);
  *(void *)(*(void *)(a1 + 56) + 8LL) = v4;
  *(void *)(a1 + 56) = v4;
  return v4;
}

void sub_183BFCCF0(_Unwind_Exception *a1)
{
}

void sub_183BFCD04(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40LL))(*(void *)(a1 + 24), a2);
    unsigned int v5 = *(_BYTE **)(a1 + 48);
    unint64_t v4 = *(void *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      uint64_t v6 = (unint64_t *)(a1 + 40);
      unint64_t v7 = *(void *)(a1 + 40);
      int64_t v8 = &v5[-v7];
      uint64_t v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        unint64_t v10 = v4 - v7;
        if (2 * v10 > v9) {
          uint64_t v9 = 2 * v10;
        }
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v11 = v9;
        }
        if (v11) {
          int v12 = operator new(v11);
        }
        else {
          int v12 = 0LL;
        }
        uint64_t v20 = &v8[(void)v12];
        __int128 v21 = (char *)v12 + v11;
        v8[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v8[(void)v12 + 1];
        if (v5 != (_BYTE *)v7)
        {
          __int128 v22 = &v5[~v7];
          do
          {
            char v23 = *--v5;
            (v22--)[(void)v12] = v23;
          }

          while (v5 != (_BYTE *)v7);
LABEL_45:
          unsigned int v5 = (_BYTE *)*v6;
          goto LABEL_47;
        }

        goto LABEL_46;
      }

LABEL_50:
      sub_183BF77E4();
    }

    goto LABEL_22;
  }

  uint64_t v6 = (unint64_t *)(a1 + 40);
  unsigned int v5 = *(_BYTE **)(a1 + 48);
  unint64_t v13 = *(void *)(a1 + 56);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      unint64_t v24 = *v6;
      uint64_t v25 = &v5[-*v6];
      unint64_t v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        unint64_t v27 = v13 - v24;
        if (2 * v27 > v26) {
          unint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v28 = v26;
        }
        if (v28) {
          int v12 = operator new(v28);
        }
        else {
          int v12 = 0LL;
        }
        uint64_t v20 = &v25[(void)v12];
        __int128 v21 = (char *)v12 + v28;
        v25[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v25[(void)v12 + 1];
        if (v5 != (_BYTE *)v24)
        {
          uint64_t v31 = &v5[~v24];
          do
          {
            char v32 = *--v5;
            (v31--)[(void)v12] = v32;
          }

          while (v5 != (_BYTE *)v24);
          goto LABEL_45;
        }

        goto LABEL_46;
      }

      goto LABEL_50;
    }

      sub_183BF77E4();
    }

    goto LABEL_22;
  }

  uint64_t v6 = (unint64_t *)(a1 + 64);
  unsigned int v5 = *(_BYTE **)(a1 + 72);
  unint64_t v13 = *(void *)(a1 + 80);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      unint64_t v24 = *v6;
      uint64_t v25 = &v5[-*v6];
      unint64_t v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        unint64_t v27 = v13 - v24;
        if (2 * v27 > v26) {
          unint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v28 = v26;
        }
        if (v28) {
          int v12 = operator new(v28);
        }
        else {
          int v12 = 0LL;
        }
        uint64_t v20 = &v25[(void)v12];
        __int128 v21 = (char *)v12 + v28;
        v25[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v25[(void)v12 + 1];
        if (v5 != (_BYTE *)v24)
        {
          uint64_t v31 = &v5[~v24];
          do
          {
            char v32 = *--v5;
            (v31--)[(void)v12] = v32;
          }

          while (v5 != (_BYTE *)v24);
          goto LABEL_45;
        }

        goto LABEL_46;
      }

      goto LABEL_50;
    }

LABEL_46:
  int v12 = v20;
LABEL_47:
  *(void *)(a1 + 40) = v12;
  *(void *)(a1 + 48) = v19;
  *(void *)(a1 + 56) = v21;
  if (v5) {
    operator delete(v5);
  }
LABEL_49:
  *(void *)(a1 + 48) = v19;
}

  int v12 = v20;
LABEL_47:
  *(void *)(a1 + 64) = v12;
  *(void *)(a1 + 72) = v19;
  *(void *)(a1 + 80) = v21;
  if (v5) {
    operator delete(v5);
  }
LABEL_49:
  *(void *)(a1 + 72) = v19;
}

uint64_t sub_183BFCF30(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  *(void *)a1 = &unk_189D38360;
  *(void *)(a1 + 8) = a3;
  size_t v11 = (const std::locale *)(a1 + 16);
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  __int128 v12 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 24) = v12;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_BYTE *)(a1 + 168) = a4;
  *(_BYTE *)(a1 + 169) = a5;
  *(_BYTE *)(a1 + 170) = a6;
  std::locale::locale(&v15, v11);
  std::locale::name(&v16, &v15);
  if ((char)v16.__r_.__value_.__s.__size_ < 0)
  {
    BOOL v13 = v16.__r_.__value_.__l.__size_ != 1 || *v16.__r_.__value_.__l.__data_ != 67;
    operator delete(v16.__r_.__value_.__l.__data_);
  }

  else
  {
    BOOL v13 = v16.__r_.__value_.__s.__size_ != 1 || v16.__r_.__value_.__s.__data_[0] != 67;
  }

  std::locale::~locale(&v15);
  *(_BYTE *)(a1 + 171) = v13;
  return a1;
}

void sub_183BFD040( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  a10 = v10 + 17;
  sub_183C11DE0((void ***)&a10);
  unint64_t v14 = (void *)v10[14];
  if (v14)
  {
    v10[15] = v14;
    operator delete(v14);
  }

  sub_183BFDB64((void ***)&a10);
  std::locale v15 = (void *)v10[8];
  if (v15)
  {
    v10[9] = v15;
    operator delete(v15);
  }

  std::string v16 = *v12;
  if (*v12)
  {
    v10[6] = v16;
    operator delete(v16);
  }

  std::locale::~locale(v11);
  *unint64_t v10 = &unk_189D38018;
  uint64_t v17 = v10[1];
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8LL))(v17);
  }
  _Unwind_Resume(a1);
}

std::locale *sub_183BFD0CC(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_189D38360;
  unint64_t v7 = a1 + 17;
  sub_183C11DE0((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }

  unint64_t v7 = a1 + 11;
  sub_183BFDB64((void ***)&v7);
  uint64_t v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }

  unint64_t v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }

  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_189D38018;
  unsigned int v5 = a1[1].__locale_;
  if (v5) {
    (*(void (**)(std::locale::__imp *))(*(void *)v5 + 8LL))(v5);
  }
  return a1;
}

void sub_183BFD180(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_189D38360;
  uint64_t v6 = a1 + 17;
  sub_183C11DE0((void ***)&v6);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }

  uint64_t v6 = a1 + 11;
  sub_183BFDB64((void ***)&v6);
  uint64_t v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }

  unint64_t v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }

  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_189D38018;
  unsigned int v5 = a1[1].__locale_;
  if (v5) {
    (*(void (**)(std::locale::__imp *))(*(void *)v5 + 8LL))(v5);
  }
  operator delete(a1);
}

void sub_183BFD238(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(signed __int8 **)(a2 + 16);
  unsigned int v5 = *(signed __int8 **)(a2 + 24);
  if (v4 == v5)
  {
    uint64_t v37 = 0LL;
    int v36 = *(unsigned __int8 *)(a1 + 168);
    goto LABEL_221;
  }

  if (!*(_BYTE *)(a1 + 171) || v4 + 1 == v5) {
    goto LABEL_58;
  }
  signed __int8 v6 = *v4;
  unsigned __int8 v121 = *v4;
  signed __int8 v7 = v4[1];
  unsigned __int8 v122 = v7;
  if (*(_BYTE *)(a1 + 169))
  {
    unsigned __int8 v121 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  v6);
    unsigned __int8 v122 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  v7);
  }

  uint64_t v8 = a1 + 16;
  sub_183BFDD08(a1 + 16, (char *)&v121, (char *)&v123, &__p);
  if (((char)__p.__r_.__value_.__s.__size_ & 0x80000000) == 0)
  {
    if (__p.__r_.__value_.__s.__size_) {
      goto LABEL_8;
    }
LABEL_58:
    int v36 = 0;
    uint64_t v37 = 1LL;
    goto LABEL_59;
  }

  std::string::size_type size = __p.__r_.__value_.__l.__size_;
  operator delete(__p.__r_.__value_.__l.__data_);
  if (!size) {
    goto LABEL_58;
  }
LABEL_8:
  uint64_t v9 = *(void *)(a1 + 112);
  uint64_t v10 = *(void *)(a1 + 120) - v9;
  if (v10)
  {
    uint64_t v11 = v10 >> 1;
    __int128 v12 = (_BYTE *)(v9 + 1);
    do
    {
      v12 += 2;
      --v11;
    }

    while (v11);
  }

  if (!*(_BYTE *)(a1 + 170) || *(void *)(a1 + 88) == *(void *)(a1 + 96))
  {
    int v36 = 0;
  }

  else
  {
    sub_183BFDC6C(a1 + 16, (char *)&v121, (char *)&v123);
    uint64_t v14 = *(void *)(a1 + 88);
    unsigned __int8 v15 = __p.__r_.__value_.__s.__size_;
    uint64_t v16 = *(void *)(a1 + 96) - v14;
    if (v16)
    {
      uint64_t v17 = 0LL;
      unint64_t v18 = v16 / 48;
      unsigned __int8 v111 = __p.__r_.__value_.__s.__size_;
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        std::string::size_type v19 = __p.__r_.__value_.__s.__size_;
      }
      else {
        std::string::size_type v19 = __p.__r_.__value_.__l.__size_;
      }
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if (v18 <= 1) {
        uint64_t v21 = 1LL;
      }
      else {
        uint64_t v21 = v16 / 48;
      }
      BOOL v22 = 1;
      while (1)
      {
        int v23 = *(char *)(v14 + 23);
        if (v23 >= 0) {
          size_t v24 = *(unsigned __int8 *)(v14 + 23);
        }
        else {
          size_t v24 = *(void *)(v14 + 8);
        }
        if (v23 >= 0) {
          uint64_t v25 = (const void *)v14;
        }
        else {
          uint64_t v25 = *(const void **)v14;
        }
        if (v24 >= v19) {
          size_t v26 = v19;
        }
        else {
          size_t v26 = v24;
        }
        int v27 = memcmp(p_p, v25, v26);
        BOOL v28 = v19 >= v24;
        if (v27) {
          BOOL v28 = v27 >= 0;
        }
        if (v28)
        {
          int v29 = *(char *)(v14 + 47);
          if (v29 >= 0) {
            size_t v30 = *(unsigned __int8 *)(v14 + 47);
          }
          else {
            size_t v30 = *(void *)(v14 + 32);
          }
          if (v29 >= 0) {
            uint64_t v31 = (const void *)(v14 + 24);
          }
          else {
            uint64_t v31 = *(const void **)(v14 + 24);
          }
          if (v19 >= v30) {
            size_t v32 = v30;
          }
          else {
            size_t v32 = v19;
          }
          int v33 = memcmp(v31, p_p, v32);
          BOOL v34 = v30 >= v19;
          if (v33) {
            BOOL v34 = v33 >= 0;
          }
          if (v34) {
            break;
          }
        }

        BOOL v22 = ++v17 < v18;
        v14 += 48LL;
        if (v21 == v17)
        {
          int v35 = 0;
          int v36 = 0;
          goto LABEL_162;
        }
      }

      int v36 = 1;
      int v35 = 5;
LABEL_162:
      uint64_t v8 = a1 + 16;
      unsigned __int8 v15 = v111;
    }

    else
    {
      BOOL v22 = 0;
      int v35 = 0;
      int v36 = 0;
    }

    if ((v15 & 0x80) != 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v22) {
      goto LABEL_195;
    }
  }

  if (*(void *)(a1 + 136) == *(void *)(a1 + 144)) {
    goto LABEL_200;
  }
  sub_183BFDF40(v8, (char *)&v121, (char *)&v123, (uint64_t)&__p);
  uint64_t v88 = *(void *)(a1 + 136);
  uint64_t v89 = __p.__r_.__value_.__s.__size_;
  uint64_t v90 = *(void *)(a1 + 144) - v88;
  if (v90)
  {
    uint64_t v91 = 0LL;
    unint64_t v92 = v90 / 24;
    __int128 v93 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      std::string::size_type v94 = __p.__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type v94 = __p.__r_.__value_.__l.__size_;
    }
    if (v92 <= 1) {
      uint64_t v95 = 1LL;
    }
    else {
      uint64_t v95 = v90 / 24;
    }
    BOOL v96 = 1;
    while (1)
    {
      uint64_t v97 = (unsigned __int8 **)(v88 + 24 * v91);
      v98 = (unsigned __int8 *)*((unsigned __int8 *)v97 + 23);
      int v99 = (char)v98;
      if ((unsigned __int8 *)v94 == v98)
      {
        if (v99 >= 0) {
          unint64_t v100 = (unsigned __int8 *)(v88 + 24 * v91);
        }
        else {
          unint64_t v100 = *v97;
        }
        if ((v89 & 0x80) == 0)
        {
          if ((_DWORD)v89)
          {
            uint64_t v101 = &__p;
            uint64_t v102 = v89;
            do
            {
              uint64_t v101 = (std::string *)((char *)v101 + 1);
              ++v100;
              --v102;
            }

            while (v102);
            int v36 = 1;
            int v35 = 5;
            goto LABEL_192;
          }

          int v36 = 1;
          if (v96) {
            goto LABEL_220;
          }
LABEL_200:
          if ((char)v121 < 0)
          {
            int v107 = *(_DWORD *)(a1 + 164);
            goto LABEL_213;
          }

          int v104 = *(_DWORD *)(a1 + 160);
          uint64_t v105 = *(void *)(*(void *)(a1 + 24) + 16LL);
          int v106 = *(_DWORD *)(v105 + 4LL * v121);
          if ((v106 & v104) == 0 && (v121 != 95 || (v104 & 0x80) == 0)
            || (char)v122 < 0
            || (*(_DWORD *)(v105 + 4LL * v122) & v104) == 0 && ((v104 & 0x80) == 0 || v122 != 95))
          {
            int v107 = *(_DWORD *)(a1 + 164);
            if ((v106 & v107) != 0 || v121 == 95 && (v107 & 0x80) != 0)
            {
LABEL_217:
              int v108 = v36;
              goto LABEL_219;
            }

LABEL_213:
            if (((char)v122 & 0x80000000) == 0)
            {
              if ((*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 16LL) + 4LL * v122) & v107) != 0) {
                goto LABEL_217;
              }
              int v108 = 1;
              if (v122 == 95 && (v107 & 0x80) != 0) {
                goto LABEL_217;
              }
LABEL_219:
              int v36 = v108;
LABEL_220:
              uint64_t v37 = 2LL;
              goto LABEL_221;
            }
          }

LABEL_218:
          int v108 = 1;
          goto LABEL_219;
        }

        unint64_t v116 = v92;
        uint64_t v119 = v89;
        int v103 = memcmp((const void *)v93, v100, *((size_t *)&v93 + 1));
        unint64_t v92 = v116;
        uint64_t v89 = v119;
        if (!v103) {
          break;
        }
      }

LABEL_188:
      BOOL v96 = ++v91 < v92;
      if (v91 == v95) {
        goto LABEL_191;
      }
    }

    int v35 = 5;
    int v36 = 1;
    goto LABEL_193;
  }

  BOOL v96 = 0;
LABEL_191:
  int v35 = 0;
LABEL_192:
  if ((v89 & 0x80) != 0) {
LABEL_193:
  }
    operator delete(__p.__r_.__value_.__l.__data_);
  if (!v96) {
    goto LABEL_200;
  }
LABEL_195:
  if (v35) {
    goto LABEL_220;
  }
  uint64_t v37 = 2LL;
LABEL_59:
  unsigned __int8 v39 = **(_BYTE **)(a2 + 16);
  unsigned __int8 v121 = v39;
  if (*(_BYTE *)(a1 + 169))
  {
    unsigned __int8 v39 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  (char)v39);
    unsigned __int8 v121 = v39;
  }

  __int128 v40 = *(unsigned __int8 **)(a1 + 40);
  unint64_t v41 = *(void *)(a1 + 48) - (void)v40;
  if (v41)
  {
    if (v41 <= 1) {
      unint64_t v41 = 1LL;
    }
    while (1)
    {
      int v42 = *v40++;
      if (v42 == v39) {
        break;
      }
      if (!--v41) {
        goto LABEL_66;
      }
    }

LABEL_77:
    int v36 = 1;
    goto LABEL_221;
  }

LABEL_221:
  if (v36 == *(unsigned __int8 *)(a1 + 168))
  {
    uint64_t v109 = 0LL;
    int v110 = -993;
  }

  else
  {
    *(void *)(a2 + 16) += v37;
    uint64_t v109 = *(void *)(a1 + 8);
    int v110 = -995;
  }

  *(_DWORD *)a2 = v110;
  *(void *)(a2 + 80) = v109;
}

void sub_183BFDAF0(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_183BFDB40(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_189D37AF8, MEMORY[0x189614200]);
}

void sub_183BFDB2C(_Unwind_Exception *a1)
{
}

std::logic_error *sub_183BFDB40(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x189614780] + 16LL);
  return result;
}

void sub_183BFDB64(void ***a1)
{
  uint64_t v1 = *a1;
  char v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unsigned int v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48LL;
        sub_183BFDBE8((uint64_t)(v1 + 2), v4);
      }

      while ((void *)v4 != v2);
      unsigned int v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void sub_183BFDBE8(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_183BFDC2C(uint64_t a1)
{
  return a1;
}

void sub_183BFDC6C(uint64_t a1, char *a2, char *a3)
{
  unint64_t v4 = v7;
  if ((v7 & 0x80u) == 0) {
    unsigned int v5 = __p;
  }
  else {
    unsigned int v5 = (void **)__p[0];
  }
  if ((v7 & 0x80u) != 0) {
    unint64_t v4 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32LL))( *(void *)(a1 + 16),  v5,  (char *)v5 + v4);
}

void sub_183BFDCEC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_183BFDD08(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, std::string *a4@<X8>)
{
  a4->__r_.__value_.__r.__words[0] = 0LL;
  a4->__r_.__value_.__l.__size_ = 0LL;
  a4->__r_.__value_.__l.__cap_ = 0LL;
  if ((char)__s.__r_.__value_.__s.__size_ < 0)
  {
    if (!__s.__r_.__value_.__l.__size_) {
      goto LABEL_9;
    }
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }

  else
  {
    if (!__s.__r_.__value_.__s.__size_) {
      return;
    }
    p_s = &__s;
  }

  std::__get_collation_name(&v13, (const char *)p_s);
  *(_OWORD *)&a4->__r_.__value_.__l.__data_ = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
  std::string::size_type cap = v13.__r_.__value_.__l.__cap_;
  a4->__r_.__value_.__l.__cap_ = v13.__r_.__value_.__l.__cap_;
  std::string::size_type size = HIBYTE(cap);
  if ((size & 0x80u) != 0LL) {
    std::string::size_type size = a4->__r_.__value_.__l.__size_;
  }
  if (size) {
    goto LABEL_9;
  }
  if ((char)__s.__r_.__value_.__s.__size_ < 0)
  {
    std::string::size_type v9 = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3) {
      goto LABEL_9;
    }
    uint64_t v10 = (std::string *)__s.__r_.__value_.__r.__words[0];
  }

  else
  {
    std::string::size_type v9 = __s.__r_.__value_.__s.__size_;
    if (__s.__r_.__value_.__s.__size_ >= 3u) {
      return;
    }
    uint64_t v10 = &__s;
  }

  (*(void (**)(std::string *__return_ptr, void, std::string *, char *))(**(void **)(a1 + 16) + 32LL))( &v13,  *(void *)(a1 + 16),  v10,  (char *)v10 + v9);
  *a4 = v13;
  if (((char)a4->__r_.__value_.__s.__size_ & 0x80000000) == 0)
  {
    int v11 = a4->__r_.__value_.__s.__size_;
    if (v11 != 12 && v11 != 1)
    {
      a4->__r_.__value_.__s.__data_[0] = 0;
      a4->__r_.__value_.__s.__size_ = 0;
      goto LABEL_9;
    }

    goto LABEL_25;
  }

  std::string::size_type v12 = a4->__r_.__value_.__l.__size_;
  if (v12 == 1 || v12 == 12)
  {
LABEL_25:
    std::string::operator=(a4, &__s);
    goto LABEL_9;
  }

  *a4->__r_.__value_.__l.__data_ = 0;
  a4->__r_.__value_.__l.__size_ = 0LL;
LABEL_9:
}

void sub_183BFDE68( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_183BFDE9C(void *result, char *a2, char *a3, unint64_t a4)
{
  unint64_t v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_183BF7288();
  }
  if (a4 > 0x16)
  {
    uint64_t v8 = (a4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a4 | 7) != 0x17) {
      uint64_t v8 = a4 | 7;
    }
    uint64_t v9 = v8 + 1;
    uint64_t result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000LL;
    *unint64_t v4 = result;
    unint64_t v4 = result;
  }

  else
  {
    *((_BYTE *)result + 23) = a4;
  }

  while (a2 != a3)
  {
    char v10 = *a2++;
    *(_BYTE *)unint64_t v4 = v10;
    unint64_t v4 = (void *)((char *)v4 + 1);
  }

  *(_BYTE *)unint64_t v4 = 0;
  return result;
}

void sub_183BFDF40(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    unsigned __int8 v7 = __p;
  }
  else {
    unsigned __int8 v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32LL))( *(void *)(a1 + 16),  v7,  (char *)v7 + v6);
  uint64_t v8 = *(unsigned __int8 *)(a4 + 23);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0LL) {
    uint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0) {
        char v10 = (_BYTE *)a4;
      }
      else {
        char v10 = *(_BYTE **)a4;
      }
      v10[11] = v10[3];
    }

    else if (v9 < 0)
    {
      **(_BYTE **)a4 = 0;
      *(void *)(a4 + 8) = 0LL;
    }

    else
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
    }
  }

void sub_183BFE018( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_183BFE034(void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_183BF7288();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000LL;
    *__b = v6;
  }

  else
  {
    *((_BYTE *)__b + 23) = __len;
    unint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }

  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void sub_183BFE0DC()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x186E23230](exception, 5LL);
  __cxa_throw(exception, MEMORY[0x1896146C8], MEMORY[0x189614288]);
}

void sub_183BFE114(_Unwind_Exception *a1)
{
}

char *sub_183BFE128(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  unint64_t v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  int v5 = *a2;
  if (v5 == 93) {
    return v4;
  }
  uint64_t v6 = (uint64_t)a4;
  memset(&v26, 0, sizeof(v26));
  if (a2 + 1 == a3 || v5 != 91)
  {
LABEL_9:
    int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
    goto LABEL_10;
  }

  int v9 = a2[1];
  if (v9 != 46)
  {
    if (v9 == 58)
    {
      char v10 = sub_183BFE6C8(a1, a2 + 2, a3, (uint64_t)a4);
      goto LABEL_38;
    }

    if (v9 == 61)
    {
      char v10 = sub_183BFE4EC(a1, a2 + 2, a3, a4);
LABEL_38:
      uint64_t v6 = (uint64_t)v10;
      char v21 = 0;
      goto LABEL_42;
    }

    goto LABEL_9;
  }

  std::string::size_type v19 = sub_183BFE778(a1, a2 + 2, a3, (uint64_t)&v26);
  unint64_t v4 = v19;
  int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  std::string::size_type size = v26.__r_.__value_.__s.__size_;
  if ((v26.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    std::string::size_type size = v26.__r_.__value_.__l.__size_;
  }
  uint64_t v14 = v19;
  if (!size)
  {
LABEL_10:
    if ((v11 | 0x40) == 0x40)
    {
      int v12 = *v4;
      if (v12 == 92)
      {
        std::string v13 = v4 + 1;
        if (v11)
        {
          uint64_t v14 = sub_183BFE980(a1, v13, a3, &v26);
        }

        else
        {
          uint64_t v14 = (char *)sub_183BFE85C(a1, (unsigned __int8 *)v13, a3, &v26, v6);
          int v11 = 0;
        }

        goto LABEL_16;
      }
    }

    else
    {
      LOBYTE(v12) = *v4;
    }

    std::string::operator=(&v26, v12);
    uint64_t v14 = v4 + 1;
  }

LABEL_41:
    char v21 = 1;
    unint64_t v4 = v14;
    goto LABEL_42;
  }

  memset(&v25, 0, sizeof(v25));
  unint64_t v4 = v14 + 2;
  if (v14 + 2 != a3 && *v17 == 91 && *v4 == 46)
  {
    unint64_t v18 = sub_183BFE778(a1, v14 + 3, a3, (uint64_t)&v25);
LABEL_55:
    unint64_t v4 = v18;
    goto LABEL_56;
  }

  if ((v11 | 0x40) == 0x40)
  {
    LODWORD(v17) = *v17;
    if ((_DWORD)v17 == 92)
    {
      if (v11) {
        unint64_t v18 = sub_183BFE980(a1, v14 + 2, a3, &v25);
      }
      else {
        unint64_t v18 = (char *)sub_183BFE85C(a1, (unsigned __int8 *)v14 + 2, a3, &v25, v6);
      }
      goto LABEL_55;
    }
  }

  else
  {
    LOBYTE(v17) = *v17;
  }

  std::string::operator=(&v25, (std::string::value_type)v17);
LABEL_56:
  std::string v24 = v26;
  memset(&v26, 0, sizeof(v26));
  std::string __p = v25;
  memset(&v25, 0, sizeof(v25));
  sub_183BFEB58(v6, (char *)&v24, (char *)&__p);
  char v21 = 1;
LABEL_42:
  if ((v21 & 1) != 0) {
    return v4;
  }
  return (char *)v6;
}

void sub_183BFE474( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, void *__p, uint64_t a24, int a25, __int16 a26, char a27, char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_183BFE4EC(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_33;
  }
  uint64_t v6 = a3 - 2;
  size_t v7 = a2;
  size_t v8 = a2;
  for (uint64_t i = a2; ; v8 = i)
  {
    int v10 = *i++;
    if (v10 == 61 && *i == 93) {
      break;
    }
    if (a2 == v6) {
      goto LABEL_33;
    }
    ++v7;
    --v6;
  }

  if (v8 == a3) {
LABEL_33:
  }
    sub_183BFE0DC();
  sub_183BFF1D0(a1, a2, v7, &v20);
  if (((char)v20.__r_.__value_.__s.__size_ & 0x80000000) == 0)
  {
    std::string::size_type size = v20.__r_.__value_.__s.__size_;
    if (v20.__r_.__value_.__s.__size_)
    {
      int v12 = &v20;
      goto LABEL_14;
    }

LABEL_34:
    sub_183BFF144();
  }

  std::string::size_type size = v20.__r_.__value_.__l.__size_;
  if (!v20.__r_.__value_.__l.__size_) {
    goto LABEL_34;
  }
  int v12 = (std::string *)v20.__r_.__value_.__r.__words[0];
LABEL_14:
  sub_183BFF364(a1, (char *)v12, (char *)v12 + size, (uint64_t)__p);
  unint64_t v13 = v19;
  if ((v19 & 0x80u) != 0) {
    unint64_t v13 = (unint64_t)__p[1];
  }
  if (v13)
  {
    sub_183BFF190(a4, (__int128 *)__p);
  }

  else
  {
    std::string::size_type v14 = v20.__r_.__value_.__s.__size_;
    if ((v20.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      std::string::size_type v14 = v20.__r_.__value_.__l.__size_;
    }
    if (v14 == 2)
    {
      uint64_t v16 = &v20;
      if ((v20.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        uint64_t v16 = (std::string *)v20.__r_.__value_.__r.__words[0];
      }
      sub_183BFEF1C( (uint64_t)a4,  v16->__r_.__value_.__s.__data_[0],  v16->__r_.__value_.__s.__data_[1]);
    }

    else
    {
      if (v14 != 1) {
        sub_183BFF144();
      }
      int v15 = &v20;
      if ((v20.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        int v15 = (std::string *)v20.__r_.__value_.__r.__words[0];
      }
      sub_183BFCD04((uint64_t)a4, v15->__r_.__value_.__s.__data_[0]);
    }
  }

  return v7 + 2;
}

    sub_183BFF144();
  }

  std::string::size_type size = v17.__r_.__value_.__l.__size_;
  if (!v17.__r_.__value_.__l.__size_) {
    goto LABEL_34;
  }
  int v9 = (std::string *)v17.__r_.__value_.__r.__words[0];
LABEL_14:
  sub_183BFF364(a1, (char *)v9, (char *)v9 + size, (uint64_t)__p);
  int v10 = v16;
  if ((v16 & 0x80u) != 0) {
    int v10 = (unint64_t)__p[1];
  }
  if (v10)
  {
    sub_183BFF190(a4, (__int128 *)__p);
  }

  else
  {
    int v11 = v17.__r_.__value_.__s.__size_;
    if ((v17.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      int v11 = v17.__r_.__value_.__l.__size_;
    }
    if (v11 == 2)
    {
      unint64_t v13 = &v17;
      if ((v17.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        unint64_t v13 = (std::string *)v17.__r_.__value_.__r.__words[0];
      }
      sub_183BFEF1C( (uint64_t)a4,  v13->__r_.__value_.__s.__data_[0],  v13->__r_.__value_.__s.__data_[1]);
    }

    else
    {
      if (v11 != 1) {
        sub_183BFF144();
      }
      int v12 = &v17;
      if ((v17.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        int v12 = (std::string *)v17.__r_.__value_.__r.__words[0];
      }
      sub_183BFCD04((uint64_t)a4, v12->__r_.__value_.__s.__data_[0]);
    }
  }

  return (uint64_t)&a2[i + 2];
}

void sub_183BFE690( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *sub_183BFE6C8(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_11;
  }
  int v5 = a3 - 2;
  uint64_t v6 = a2;
  size_t v7 = a2;
  for (uint64_t i = a2; ; v7 = i)
  {
    int v9 = *i++;
    if (v9 == 58 && *i == 93) {
      break;
    }
    if (a2 == v5) {
      goto LABEL_11;
    }
    ++v6;
    --v5;
  }

  if (v7 == a3) {
LABEL_11:
  }
    sub_183BFE0DC();
  int v10 = sub_183BFF8BC(a1, a2, v6, *(_DWORD *)(a1 + 24) & 1);
  if (!v10) {
    sub_183BFF870();
  }
  *(_DWORD *)(a4 + 160) |= v10;
  return v6 + 2;
}

char *sub_183BFE778(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_15;
  }
  int v5 = a3 - 2;
  uint64_t v6 = a2;
  size_t v7 = a2;
  for (uint64_t i = a2; ; v7 = i)
  {
    int v9 = *i++;
    if (v9 == 46 && *i == 93) {
      break;
    }
    if (a2 == v5) {
      goto LABEL_15;
    }
    ++v6;
    --v5;
  }

  if (v7 == a3) {
LABEL_15:
  }
    sub_183BFE0DC();
  sub_183BFF1D0(a1, a2, v6, &v13);
  *(_OWORD *)a4 = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
  std::string::size_type cap = v13.__r_.__value_.__l.__cap_;
  *(void *)(a4 + 16) = v13.__r_.__value_.__l.__cap_;
  std::string::size_type v11 = HIBYTE(cap);
  if ((v11 & 0x80u) != 0LL) {
    std::string::size_type v11 = *(void *)(a4 + 8);
  }
  if (v11 - 1 >= 2) {
    sub_183BFF144();
  }
  return v6 + 2;
}

unsigned __int8 *sub_183BFE85C(uint64_t a1, unsigned __int8 *a2, char *a3, std::string *this, uint64_t a5)
{
  int v6 = (char)*a2;
  if (v6 > 97)
  {
    if (v6 > 114)
    {
      if (v6 != 115)
      {
        if (v6 != 119) {
          return sub_183BFC008(a1, a2, a3, this);
        }
        *(_DWORD *)(a5 + 160) |= 0x500u;
        sub_183BFCD04(a5, 95LL);
        return a2 + 1;
      }

      int v8 = *(_DWORD *)(a5 + 160) | 0x4000;
    }

    else
    {
      if (v6 == 98)
      {
        int v10 = this;
        std::string::value_type v9 = 8;
LABEL_19:
        std::string::operator=(v10, v9);
        return a2 + 1;
      }

      if (v6 != 100) {
        return sub_183BFC008(a1, a2, a3, this);
      }
      int v8 = *(_DWORD *)(a5 + 160) | 0x400;
    }

    *(_DWORD *)(a5 + 160) = v8;
    return a2 + 1;
  }

  if (v6 <= 82)
  {
    if (*a2)
    {
      if (v6 == 68)
      {
        int v7 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_21:
        *(_DWORD *)(a5 + 164) = v7;
        return a2 + 1;
      }

      return sub_183BFC008(a1, a2, a3, this);
    }

    std::string::value_type v9 = 0;
    int v10 = this;
    goto LABEL_19;
  }

  if (v6 == 83)
  {
    int v7 = *(_DWORD *)(a5 + 164) | 0x4000;
    goto LABEL_21;
  }

  if (v6 == 87)
  {
    *(_DWORD *)(a5 + 164) |= 0x500u;
    sub_183BFF974(a5, 95LL);
    return a2 + 1;
  }

  return sub_183BFC008(a1, a2, a3, this);
}

char *sub_183BFE980(uint64_t a1, char *a2, char *a3, std::string *this)
{
  if (a2 == a3) {
LABEL_52:
  }
    sub_183BFBE3C();
  uint64_t v5 = *a2;
  if ((int)v5 > 97)
  {
    switch((int)v5)
    {
      case 'n':
        if (this)
        {
          int v6 = this;
          LOBYTE(v5) = 10;
          goto LABEL_16;
        }

        uint64_t v5 = 10LL;
        goto LABEL_49;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_21;
      case 'r':
        if (this)
        {
          int v6 = this;
          LOBYTE(v5) = 13;
          goto LABEL_16;
        }

        uint64_t v5 = 13LL;
        goto LABEL_49;
      case 't':
        if (this)
        {
          int v6 = this;
          LOBYTE(v5) = 9;
          goto LABEL_16;
        }

        uint64_t v5 = 9LL;
        goto LABEL_49;
      case 'v':
        if (this)
        {
          int v6 = this;
          LOBYTE(v5) = 11;
          goto LABEL_16;
        }

        uint64_t v5 = 11LL;
        goto LABEL_49;
      default:
        if ((_DWORD)v5 == 98)
        {
          if (this)
          {
            int v6 = this;
            LOBYTE(v5) = 8;
            goto LABEL_16;
          }

          uint64_t v5 = 8LL;
        }

        else
        {
          if ((_DWORD)v5 != 102) {
            goto LABEL_21;
          }
          if (this)
          {
            int v6 = this;
            LOBYTE(v5) = 12;
            goto LABEL_16;
          }

          uint64_t v5 = 12LL;
        }

        break;
    }

    goto LABEL_49;
  }

  if ((int)v5 > 91)
  {
    if ((_DWORD)v5 != 92)
    {
      if ((_DWORD)v5 != 97) {
        goto LABEL_21;
      }
      if (this)
      {
        int v6 = this;
        LOBYTE(v5) = 7;
LABEL_16:
        std::string::operator=(v6, v5);
        return a2 + 1;
      }

      uint64_t v5 = 7LL;
LABEL_49:
      sub_183BFC2E4(a1, v5);
      return a2 + 1;
    }

LABEL_14:
    if (this)
    {
      int v6 = this;
      goto LABEL_16;
    }

    goto LABEL_49;
  }

  if ((_DWORD)v5 == 34 || (_DWORD)v5 == 47) {
    goto LABEL_14;
  }
LABEL_21:
  if ((v5 & 0xFFFFFFF8) != 0x30) {
    goto LABEL_52;
  }
  std::string::value_type v7 = v5 - 48;
  int v8 = a2 + 1;
  if (a2 + 1 != a3)
  {
    if ((*v8 & 0xF8) != 0x30) {
      goto LABEL_39;
    }
    std::string::value_type v7 = *v8 + 8 * v7 - 48;
    if (a2 + 2 != a3)
    {
      char v9 = a2[2];
      int v10 = v9 & 0xF8;
      std::string::value_type v11 = v9 + 8 * v7 - 48;
      if (v10 == 48) {
        int v8 = a2 + 3;
      }
      else {
        int v8 = a2 + 2;
      }
      if (v10 == 48) {
        std::string::value_type v7 = v11;
      }
      goto LABEL_39;
    }
  }

  int v8 = a3;
LABEL_39:
  if (this) {
    std::string::operator=(this, v7);
  }
  else {
    sub_183BFC2E4(a1, v7);
  }
  return v8;
}

    sub_183BFAF2C( (char **)a4,  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a4 + 8) - *(void *)a4) >> 3),  (__int128 *)(a4 + 24));
    if (sub_183C019B8(a1, a3, a3, (uint64_t *)a4, v14, 0))
    {
      if (*(void *)(a4 + 8) == *(void *)a4) {
        int v10 = (uint64_t *)(a4 + 24);
      }
      else {
        int v10 = *(uint64_t **)a4;
      }
      goto LABEL_8;
    }
  }

  uint64_t result = 0LL;
  *(void *)(a4 + 8) = *(void *)a4;
  return result;
}

    if (this)
    {
      int v6 = this;
      goto LABEL_16;
    }

    goto LABEL_49;
  }

  if ((_DWORD)v5 == 34 || (_DWORD)v5 == 47) {
    goto LABEL_14;
  }
LABEL_21:
  if ((v5 & 0xFFFFFFF8) != 0x30) {
    goto LABEL_52;
  }
  std::string::value_type v7 = v5 - 48;
  int v8 = a2 + 1;
  if (a2 + 1 != a3)
  {
    if ((*v8 & 0xF8) != 0x30) {
      goto LABEL_39;
    }
    std::string::value_type v7 = *v8 + 8 * v7 - 48;
    if (a2 + 2 != a3)
    {
      char v9 = a2[2];
      int v10 = v9 & 0xF8;
      std::string::value_type v11 = v9 + 8 * v7 - 48;
      if (v10 == 48) {
        int v8 = a2 + 3;
      }
      else {
        int v8 = a2 + 2;
      }
      if (v10 == 48) {
        std::string::value_type v7 = v11;
      }
      goto LABEL_39;
    }
  }

  int v8 = a3;
LABEL_39:
  if (this) {
    std::string::operator=(this, v7);
  }
  else {
    sub_183BFC2E4(a1, v7);
  }
  return v8;
}

void sub_183BFEB58(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a3;
  unint64_t v4 = a2;
  if (*(_BYTE *)(a1 + 170))
  {
    if (*(_BYTE *)(a1 + 169))
    {
      for (unint64_t i = 0LL; ; ++i)
      {
        unint64_t v7 = v4[23] < 0 ? *((void *)v4 + 1) : v4[23];
        if (i >= v7) {
          break;
        }
        int v8 = v4;
        if (v4[23] < 0) {
          int v8 = *(char **)v4;
        }
        char v9 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  v8[i]);
        int v10 = v4;
        if (v4[23] < 0) {
          int v10 = *(char **)v4;
        }
        v10[i] = v9;
      }

      for (unint64_t j = 0LL; ; ++j)
      {
        unint64_t v12 = v3[23] < 0 ? *((void *)v3 + 1) : v3[23];
        if (j >= v12) {
          break;
        }
        std::string v13 = v3;
        if (v3[23] < 0) {
          std::string v13 = *(char **)v3;
        }
        char v14 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  v13[j]);
        int v15 = v3;
        if (v3[23] < 0) {
          int v15 = *(char **)v3;
        }
        v15[j] = v14;
      }
    }

    else
    {
      for (unint64_t k = 0LL; ; ++k)
      {
        unint64_t v18 = a2[23] < 0 ? *((void *)a2 + 1) : a2[23];
        if (k >= v18) {
          break;
        }
        unsigned __int8 v19 = a2;
        if (a2[23] < 0) {
          unsigned __int8 v19 = *(char **)a2;
        }
        std::string v20 = a2;
        if (a2[23] < 0) {
          std::string v20 = *(char **)a2;
        }
        v20[k] = v19[k];
      }

      for (unint64_t m = 0LL; ; ++m)
      {
        unint64_t v22 = a3[23] < 0 ? *((void *)a3 + 1) : a3[23];
        if (m >= v22) {
          break;
        }
        int v23 = a3;
        if (a3[23] < 0) {
          int v23 = *(char **)a3;
        }
        std::string v24 = a3;
        if (a3[23] < 0) {
          std::string v24 = *(char **)a3;
        }
        v24[m] = v23[m];
      }
    }

    if (v4[23] < 0)
    {
      std::string v26 = v4;
      unint64_t v4 = *(char **)v4;
      uint64_t v25 = *((void *)v26 + 1);
    }

    else
    {
      uint64_t v25 = v4[23];
    }

    sub_183BFFD08(a1 + 16, v4, &v4[v25]);
    if (v3[23] < 0)
    {
      uint64_t v28 = v3;
      uint64_t v3 = *(char **)v3;
      uint64_t v27 = *((void *)v28 + 1);
    }

    else
    {
      uint64_t v27 = v3[23];
    }

    sub_183BFFD08(a1 + 16, v3, &v3[v27]);
    *(_OWORD *)__int128 v40 = v38;
    uint64_t v41 = v39;
    *(_OWORD *)std::string __p = *(_OWORD *)v36;
    uint64_t v43 = v37;
    sub_183BFFBA0((uint64_t *)(a1 + 88), (__int128 *)v40);
    if (SHIBYTE(v43) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v41) < 0) {
      operator delete(v40[0]);
    }
  }

  else
  {
    if (a2[23] < 0) {
      uint64_t v16 = *((void *)a2 + 1);
    }
    else {
      uint64_t v16 = a2[23];
    }
    if (*(_BYTE *)(a1 + 169))
    {
      size_t v30 = a2;
      if (a2[23] < 0) {
        size_t v30 = *(char **)a2;
      }
      char v31 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  *v30);
      size_t v32 = v4;
      if (v4[23] < 0) {
        size_t v32 = *(_BYTE **)v4;
      }
      *size_t v32 = v31;
      int v33 = v3;
      if (v3[23] < 0) {
        int v33 = *(char **)v3;
      }
      char v34 = (*(uint64_t (**)(void, void))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  *v33);
      int v35 = v3;
      if (v3[23] < 0) {
        int v35 = *(_BYTE **)v3;
      }
      *int v35 = v34;
    }

    *(_OWORD *)__int128 v40 = *(_OWORD *)v4;
    uint64_t v41 = *((void *)v4 + 2);
    *((void *)v4 + 1) = 0LL;
    *((void *)v4 + 2) = 0LL;
    *(void *)unint64_t v4 = 0LL;
    *(_OWORD *)std::string __p = *(_OWORD *)v3;
    uint64_t v43 = *((void *)v3 + 2);
    *(void *)uint64_t v3 = 0LL;
    *((void *)v3 + 1) = 0LL;
    *((void *)v3 + 2) = 0LL;
    sub_183BFFBA0((uint64_t *)(a1 + 88), (__int128 *)v40);
    if (SHIBYTE(v43) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v41) < 0) {
      operator delete(v40[0]);
    }
  }

void sub_183BFEED0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, char a21)
{
}

void sub_183BFEF1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(_BYTE *)(a1 + 169))
  {
    uint64_t v18 = a1 + 128;
    unint64_t v19 = *(void *)(a1 + 128);
    int v10 = (char **)(a1 + 112);
    __int16 v8 = a2 | (unsigned __int16)((_WORD)a3 << 8);
    char v9 = *(_WORD **)(a1 + 120);
    if (*(_BYTE *)(a1 + 170))
    {
      uint64_t v20 = (char *)v9 - *v10;
      if (v20 > -3)
      {
        uint64_t v21 = v20 >> 1;
        unint64_t v22 = v19 - (void)*v10;
        if (v22 <= (v20 >> 1) + 1) {
          unint64_t v23 = v21 + 1;
        }
        else {
          unint64_t v23 = v22;
        }
        if (v22 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v24 = v23;
        }
        if (v24) {
          uint64_t v25 = (char *)sub_183C00054(v18, v24);
        }
        else {
          uint64_t v25 = 0LL;
        }
        uint64_t v27 = &v25[2 * v21];
        uint64_t v28 = &v25[2 * v24];
        *(_WORD *)uint64_t v27 = v8;
        std::string v26 = v27 + 2;
        __int128 v38 = *(char **)(a1 + 112);
        uint64_t v29 = *(char **)(a1 + 120);
        if (v29 == v38) {
          goto LABEL_46;
        }
        do
        {
          __int16 v39 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v39;
          v27 -= 2;
        }

        while (v29 != v38);
        goto LABEL_45;
      }
    }

    else
    {
      uint64_t v32 = (char *)v9 - *v10;
      if (v32 > -3)
      {
        uint64_t v33 = v32 >> 1;
        unint64_t v34 = v19 - (void)*v10;
        if (v34 <= (v32 >> 1) + 1) {
          unint64_t v35 = v33 + 1;
        }
        else {
          unint64_t v35 = v34;
        }
        if (v34 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v36 = v35;
        }
        if (v36) {
          uint64_t v37 = (char *)sub_183C00054(v18, v36);
        }
        else {
          uint64_t v37 = 0LL;
        }
        uint64_t v27 = &v37[2 * v33];
        uint64_t v28 = &v37[2 * v36];
        *(_WORD *)uint64_t v27 = v8;
        std::string v26 = v27 + 2;
        __int128 v40 = *(char **)(a1 + 112);
        uint64_t v29 = *(char **)(a1 + 120);
        if (v29 == v40) {
          goto LABEL_46;
        }
        do
        {
          __int16 v41 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v41;
          v27 -= 2;
        }

        while (v29 != v40);
        goto LABEL_45;
      }
    }

LABEL_49:
    sub_183BF77E4();
  }

  unsigned __int8 v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40LL))(*(void *)(a1 + 24), a2);
  __int16 v6 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40LL))(*(void *)(a1 + 24), a3);
  unint64_t v7 = *(void *)(a1 + 128);
  __int16 v8 = v5 | (unsigned __int16)(v6 << 8);
  char v9 = *(_WORD **)(a1 + 120);
  if ((unint64_t)v9 < v7)
  {
LABEL_24:
    _WORD *v9 = v8;
    std::string v26 = v9 + 1;
    goto LABEL_48;
  }

  int v10 = (char **)(a1 + 112);
  uint64_t v11 = *(void *)(a1 + 112);
  uint64_t v12 = (uint64_t)v9 - v11;
  uint64_t v13 = v12 >> 1;
  unint64_t v14 = v7 - v11;
  if (v14 <= (v12 >> 1) + 1) {
    unint64_t v15 = v13 + 1;
  }
  else {
    unint64_t v15 = v14;
  }
  if (v14 >= 0x7FFFFFFFFFFFFFFELL) {
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v16 = v15;
  }
  if (v16) {
    uint64_t v17 = (char *)sub_183C00054(a1 + 128, v16);
  }
  else {
    uint64_t v17 = 0LL;
  }
  uint64_t v27 = &v17[2 * v13];
  uint64_t v28 = &v17[2 * v16];
  *(_WORD *)uint64_t v27 = v8;
  std::string v26 = v27 + 2;
  size_t v30 = *(char **)(a1 + 112);
  uint64_t v29 = *(char **)(a1 + 120);
  if (v29 == v30) {
    goto LABEL_46;
  }
  do
  {
    __int16 v31 = *((_WORD *)v29 - 1);
    v29 -= 2;
    *((_WORD *)v27 - 1) = v31;
    v27 -= 2;
  }

  while (v29 != v30);
LABEL_45:
  uint64_t v29 = *v10;
LABEL_46:
  *(void *)(a1 + 112) = v27;
  *(void *)(a1 + 120) = v26;
  *(void *)(a1 + 128) = v28;
  if (v29) {
    operator delete(v29);
  }
LABEL_48:
  *(void *)(a1 + 120) = v26;
}

    LODWORD(v104.__r_.__value_.__l.__data_) = 0;
    uint64_t v27 = a2[1];
    if (v27 >= a2[2])
    {
      uint64_t v28 = sub_183C0D7B0(a2, (uint64_t)v100, (char *)&unk_183C1629A, (int *)&v104);
    }

    else
    {
      sub_183C0D8D4((_DWORD)a2 + 16, a2[1], (uint64_t)v100, (char *)&unk_183C1629A, (int *)&v104);
      uint64_t v28 = v27 + 120;
      a2[1] = v27 + 120;
    }

    a2[1] = v28;
    sub_183C0D430(v28 - 120, &__p);
    if (*(_BYTE *)(a1 + 32))
    {
      LODWORD(v104.__r_.__value_.__l.__data_) = 1;
      v104.__r_.__value_.__s.__data_[8] = 1;
      sub_183C07EA8((uint64_t)__p.__r_.__value_.__l.__data_, (int *)&v104);
      if (LODWORD(v104.__r_.__value_.__l.__data_) == 4)
      {
        v96.__r_.__value_.__r.__words[0] = (std::string::size_type)&v104.__r_.__value_.__l.__size_;
        sub_183C11DE0((void ***)&v96);
      }

      else if (LODWORD(v104.__r_.__value_.__l.__data_) == 3 && SHIBYTE(v105) < 0)
      {
        operator delete((void *)v104.__r_.__value_.__l.__size_);
      }
    }

    uint64_t v29 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *(_OWORD *)&v96.__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    size_t v30 = __p.__r_.__value_.__l.__size_;
    if (__p.__r_.__value_.__l.__size_)
    {
      __int16 v31 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
      do
        uint64_t v32 = __ldxr(v31);
      while (__stxr(v32 + 1, v31));
    }

    uint64_t v33 = a3[1];
    unint64_t v34 = (unint64_t)a3[2];
    if ((unint64_t)v33 >= v34)
    {
      int v87 = v29;
      uint64_t v36 = (v33 - *a3) >> 4;
      uint64_t v37 = v36 + 1;
      __int128 v38 = v34 - (void)*a3;
      if (v38 >> 3 > v37) {
        uint64_t v37 = v38 >> 3;
      }
      else {
        __int16 v39 = v37;
      }
      int v106 = a3 + 2;
      __int128 v40 = (char *)sub_183BF7BDC(v86, v39);
      int v42 = &v40[16 * v36];
      *(_OWORD *)int v42 = v87;
      int v44 = *a3;
      uint64_t v43 = a3[1];
      if (v43 == *a3)
      {
        uint64_t v47 = vdupq_n_s64((unint64_t)v43);
        char v45 = &v40[16 * v36];
      }

      else
      {
        char v45 = &v40[16 * v36];
        do
        {
          char v46 = *((_OWORD *)v43 - 1);
          v43 -= 16;
          *((_OWORD *)v45 - 1) = v46;
          v45 -= 16;
          *(void *)uint64_t v43 = 0LL;
          *((void *)v43 + 1) = 0LL;
        }

        while (v43 != v44);
        uint64_t v47 = *(int64x2_t *)a3;
      }

      unint64_t v35 = v42 + 16;
      *a3 = v45;
      a3[1] = v42 + 16;
      *(int64x2_t *)&v104.__r_.__value_.__r.__words[1] = v47;
      uint64_t v48 = a3[2];
      a3[2] = &v40[16 * v41];
      uint64_t v105 = v48;
      v104.__r_.__value_.__r.__words[0] = v47.i64[0];
      sub_183C08050((uint64_t)&v104);
    }

    else
    {
      *(void *)uint64_t v33 = v29;
      *((void *)v33 + 1) = v30;
      unint64_t v35 = v33 + 16;
    }

    a3[1] = v35;
    uint64_t v49 = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
    if (__p.__r_.__value_.__l.__size_)
    {
      uint64_t v50 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
      do
        uint64_t v51 = __ldaxr(v50);
      while (__stlxr(v51 - 1, v50));
      goto LABEL_158;
    }

void sub_183BFF144()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x186E23230](exception, 1LL);
  __cxa_throw(exception, MEMORY[0x1896146C8], MEMORY[0x189614288]);
}

void sub_183BFF17C(_Unwind_Exception *a1)
{
}

uint64_t sub_183BFF190(uint64_t *a1, __int128 *a2)
{
  uint64_t v3 = a1 + 17;
  unint64_t v4 = a1[18];
  if (v4 >= a1[19])
  {
    uint64_t result = sub_183BFF4B4(v3, a2);
  }

  else
  {
    sub_183BFF458(v3, a2);
    uint64_t result = v4 + 24;
  }

  a1[18] = result;
  return result;
}

void sub_183BFF1D0(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, std::string *a4@<X8>)
{
  a4->__r_.__value_.__r.__words[0] = 0LL;
  a4->__r_.__value_.__l.__size_ = 0LL;
  a4->__r_.__value_.__l.__cap_ = 0LL;
  if ((char)__s.__r_.__value_.__s.__size_ < 0)
  {
    if (!__s.__r_.__value_.__l.__size_) {
      goto LABEL_9;
    }
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }

  else
  {
    if (!__s.__r_.__value_.__s.__size_) {
      return;
    }
    p_s = &__s;
  }

  std::__get_collation_name(&v13, (const char *)p_s);
  *(_OWORD *)&a4->__r_.__value_.__l.__data_ = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
  std::string::size_type cap = v13.__r_.__value_.__l.__cap_;
  a4->__r_.__value_.__l.__cap_ = v13.__r_.__value_.__l.__cap_;
  std::string::size_type size = HIBYTE(cap);
  if ((size & 0x80u) != 0LL) {
    std::string::size_type size = a4->__r_.__value_.__l.__size_;
  }
  if (size) {
    goto LABEL_9;
  }
  if ((char)__s.__r_.__value_.__s.__size_ < 0)
  {
    std::string::size_type v9 = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3) {
      goto LABEL_9;
    }
    int v10 = (std::string *)__s.__r_.__value_.__r.__words[0];
  }

  else
  {
    std::string::size_type v9 = __s.__r_.__value_.__s.__size_;
    if (__s.__r_.__value_.__s.__size_ >= 3u) {
      return;
    }
    int v10 = &__s;
  }

  (*(void (**)(std::string *__return_ptr, void, std::string *, char *))(**(void **)(a1 + 16) + 32LL))( &v13,  *(void *)(a1 + 16),  v10,  (char *)v10 + v9);
  *a4 = v13;
  if (((char)a4->__r_.__value_.__s.__size_ & 0x80000000) == 0)
  {
    int v11 = a4->__r_.__value_.__s.__size_;
    if (v11 != 12 && v11 != 1)
    {
      a4->__r_.__value_.__s.__data_[0] = 0;
      a4->__r_.__value_.__s.__size_ = 0;
      goto LABEL_9;
    }

    goto LABEL_25;
  }

  std::string::size_type v12 = a4->__r_.__value_.__l.__size_;
  if (v12 == 1 || v12 == 12)
  {
LABEL_25:
    std::string::operator=(a4, &__s);
    goto LABEL_9;
  }

  *a4->__r_.__value_.__l.__data_ = 0;
  a4->__r_.__value_.__l.__size_ = 0LL;
LABEL_9:
}

void sub_183BFF330( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_183BFF364(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    unint64_t v7 = __p;
  }
  else {
    unint64_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32LL))( *(void *)(a1 + 16),  v7,  (char *)v7 + v6);
  uint64_t v8 = *(unsigned __int8 *)(a4 + 23);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0LL) {
    uint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0) {
        int v10 = (_BYTE *)a4;
      }
      else {
        int v10 = *(_BYTE **)a4;
      }
      v10[11] = v10[3];
    }

    else if (v9 < 0)
    {
      **(_BYTE **)a4 = 0;
      *(void *)(a4 + 8) = 0LL;
    }

    else
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
    }
  }

void sub_183BFF43C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_183BFF458(void *result, __int128 *a2)
{
  char v2 = result;
  uint64_t v3 = result[1];
  if (*((char *)a2 + 23) < 0)
  {
    uint64_t result = sub_183BFF5D4((_BYTE *)result[1], *(void **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v4 = *a2;
    *(void *)(v3 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v3 = v4;
  }

  v2[1] = v3 + 24;
  return result;
}

void sub_183BFF4AC(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_183BFF4B4(uint64_t *a1, __int128 *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_183BF77E4();
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
  uint64_t v18 = a1 + 2;
  if (v9) {
    int v10 = (char *)sub_183BFB0F0(v7, v9);
  }
  else {
    int v10 = 0LL;
  }
  int v11 = &v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  uint64_t v16 = v11;
  uint64_t v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_183BFF5D4(v11, *(void **)a2, *((void *)a2 + 1));
    int v11 = v16;
  }

  else
  {
    __int128 v12 = *a2;
    *((void *)v11 + 2) = *((void *)a2 + 2);
    *(_OWORD *)int v11 = v12;
  }

  uint64_t v16 = v11 + 24;
  sub_183BFF660(a1, v15);
  uint64_t v13 = a1[1];
  sub_183BFF7E8((uint64_t)v15);
  return v13;
}

void sub_183BFF5C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void *sub_183BFF5D4(_BYTE *__dst, void *__src, unint64_t a3)
{
  unint64_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8LL) {
      sub_183BF7288();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    unint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000LL;
    *unint64_t v5 = v8;
    unint64_t v5 = v8;
  }

  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

uint64_t sub_183BFF660(uint64_t *a1, void *a2)
{
  uint64_t result = sub_183BFF6D4((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

uint64_t sub_183BFF6D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24LL;
      *(void *)(a3 - 16) = 0LL;
      *(void *)(a3 - 8) = 0LL;
      *(void *)(a3 - 24) = 0LL;
      v7 -= 24LL;
      a3 -= 24LL;
    }

    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }

  char v13 = 1;
  sub_183BFF770((uint64_t)v12);
  return a6;
}

uint64_t sub_183BFF770(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_183BFF7A4(a1);
  }
  return a1;
}

void sub_183BFF7A4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8LL);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8LL);
  while (v1 != v2)
  {
    v1 += 24LL;
  }

uint64_t sub_183BFF7E8(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_183BFF81C(uint64_t a1, void **a2)
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

void sub_183BFF870()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x186E23230](exception, 2LL);
  __cxa_throw(exception, MEMORY[0x1896146C8], MEMORY[0x189614288]);
}

void sub_183BFF8A8(_Unwind_Exception *a1)
{
}

uint64_t sub_183BFF8BC(uint64_t a1, char *a2, char *a3, BOOL a4)
{
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    uint64_t v7 = __p;
  }
  else {
    uint64_t v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 8) + 48LL))( *(void *)(a1 + 8),  v7,  (char *)v7 + v6);
  if ((v12 & 0x80u) == 0) {
    uint64_t v8 = __p;
  }
  else {
    uint64_t v8 = (void **)__p[0];
  }
  uint64_t classname = std::__get_classname((const char *)v8, a4);
  return classname;
}

void sub_183BFF958( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_183BFF974(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40LL))(*(void *)(a1 + 24), a2);
    uint64_t v5 = *(_BYTE **)(a1 + 72);
    unint64_t v4 = *(void *)(a1 + 80);
    if ((unint64_t)v5 >= v4)
    {
      unint64_t v6 = (unint64_t *)(a1 + 64);
      unint64_t v7 = *(void *)(a1 + 64);
      uint64_t v8 = &v5[-v7];
      uint64_t v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        unint64_t v10 = v4 - v7;
        if (2 * v10 > v9) {
          uint64_t v9 = 2 * v10;
        }
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v11 = v9;
        }
        if (v11) {
          unsigned __int8 v12 = operator new(v11);
        }
        else {
          unsigned __int8 v12 = 0LL;
        }
        uint64_t v20 = &v8[(void)v12];
        uint64_t v21 = (char *)v12 + v11;
        v8[(void)v12] = v2;
        uint64_t v19 = (uint64_t)&v8[(void)v12 + 1];
        if (v5 != (_BYTE *)v7)
        {
          unint64_t v22 = &v5[~v7];
          do
          {
            char v23 = *--v5;
            (v22--)[(void)v12] = v23;
          }

          while (v5 != (_BYTE *)v7);
LABEL_45:
          uint64_t v5 = (_BYTE *)*v6;
          goto LABEL_47;
        }

        goto LABEL_46;
      }

void **sub_183BFFBA0(uint64_t *a1, __int128 *a2)
{
  unint64_t v6 = a1[2];
  uint64_t result = (void **)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = (unint64_t)*(result - 1);
  if (v7 >= v6)
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - *a1) >> 4);
    unint64_t v12 = v11 + 1;
    if (v11 + 1 > 0x555555555555555LL) {
      sub_183BF77E4();
    }
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *a1) >> 4);
    if (2 * v13 > v12) {
      unint64_t v12 = 2 * v13;
    }
    if (v13 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v14 = 0x555555555555555LL;
    }
    else {
      unint64_t v14 = v12;
    }
    v19[4] = result;
    if (v14) {
      __int128 v15 = (char *)sub_183BFFE64((uint64_t)result, v14);
    }
    else {
      __int128 v15 = 0LL;
    }
    unint64_t v16 = &v15[48 * v11];
    v19[0] = v15;
    v19[1] = v16;
    std::locale v19[3] = &v15[48 * v14];
    __int128 v17 = *a2;
    *((void *)v16 + 2) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v16 = v17;
    *((void *)a2 + 1) = 0LL;
    *((void *)a2 + 2) = 0LL;
    *(void *)a2 = 0LL;
    __int128 v18 = *(__int128 *)((char *)a2 + 24);
    *((void *)v16 + 5) = *((void *)a2 + 5);
    *(_OWORD *)(v16 + 24) = v18;
    *((void *)a2 + 4) = 0LL;
    *((void *)a2 + 5) = 0LL;
    *((void *)a2 + 3) = 0LL;
    v19[2] = v16 + 48;
    sub_183BFFDF0(a1, v19);
    uint64_t v10 = a1[1];
    uint64_t result = sub_183BFFFE0(v19);
  }

  else
  {
    __int128 v8 = *a2;
    *(void *)(v7 + 16) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v7 = v8;
    *((void *)a2 + 1) = 0LL;
    *((void *)a2 + 2) = 0LL;
    *(void *)a2 = 0LL;
    __int128 v9 = *(__int128 *)((char *)a2 + 24);
    *(void *)(v7 + 40) = *((void *)a2 + 5);
    *(_OWORD *)(v7 + 24) = v9;
    *((void *)a2 + 4) = 0LL;
    *((void *)a2 + 5) = 0LL;
    *((void *)a2 + 3) = 0LL;
    uint64_t v10 = v7 + 48;
    a1[1] = v7 + 48;
  }

  a1[1] = v10;
  return result;
}

void sub_183BFFCF4(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_183BFFD08(uint64_t a1, char *a2, char *a3)
{
  unint64_t v4 = v7;
  if ((v7 & 0x80u) == 0) {
    unint64_t v5 = __p;
  }
  else {
    unint64_t v5 = (void **)__p[0];
  }
  if ((v7 & 0x80u) != 0) {
    unint64_t v4 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 16) + 32LL))( *(void *)(a1 + 16),  v5,  (char *)v5 + v4);
}

void sub_183BFFD88( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_183BFFDA4()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x186E23230](exception, 9LL);
  __cxa_throw(exception, MEMORY[0x1896146C8], MEMORY[0x189614288]);
}

void sub_183BFFDDC(_Unwind_Exception *a1)
{
}

uint64_t sub_183BFFDF0(uint64_t *a1, void *a2)
{
  uint64_t result = sub_183BFFEA8((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_183BFFE64(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556LL) {
    sub_183BF7310();
  }
  return operator new(48 * a2);
}

uint64_t sub_183BFFEA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v16 = a6;
  *((void *)&v16 + 1) = a7;
  __int128 v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      __int128 v10 = *(_OWORD *)(a3 - 48);
      *(void *)(v9 - 32) = *(void *)(a3 - 32);
      *(_OWORD *)(v9 - 48) = v10;
      *(void *)(a3 - 40) = 0LL;
      *(void *)(a3 - 32) = 0LL;
      *(void *)(a3 - 48) = 0LL;
      __int128 v11 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v11;
      v9 -= 48LL;
      *(void *)(a3 - 16) = 0LL;
      *(void *)(a3 - 8) = 0LL;
      *(void *)(a3 - 24) = 0LL;
      v7 -= 48LL;
      a3 -= 48LL;
    }

    while (a3 != a5);
    *((void *)&v16 + 1) = v9;
  }

  char v14 = 1;
  sub_183BFFF5C((uint64_t)v13);
  return a6;
}

uint64_t sub_183BFFF5C(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_183BFFF90((uint64_t *)a1);
  }
  return a1;
}

void sub_183BFFF90(uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      sub_183BFDBE8(v3, v1);
      v1 += 48LL;
    }

    while (v1 != v2);
  }

void **sub_183BFFFE0(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_183C00010(void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 48;
    sub_183BFDBE8(v4, i - 48);
  }

void *sub_183C00054(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    sub_183BF7310();
  }
  return operator new(2 * a2);
}

void *sub_183C00084(void *a1)
{
  *a1 = &unk_189D38018;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_183C000C8(void *__p)
{
  void *__p = &unk_189D38018;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

uint64_t sub_183C0010C(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(*(void *)(a2 + 32) + 24LL * (*(_DWORD *)(result + 16) - 1)) = *(void *)(a2 + 16);
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void *sub_183C0013C(void *a1)
{
  *a1 = &unk_189D38018;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_183C00180(void *__p)
{
  void *__p = &unk_189D38018;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

uint64_t sub_183C001C4(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  uint64_t v2 = *(void *)(a2 + 32) + 24LL * (*(_DWORD *)(result + 16) - 1);
  *(void *)(v2 + 8) = *(void *)(a2 + 16);
  *(_BYTE *)(v2 + 16) = 1;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void *sub_183C001FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, char a7)
{
  char v14 = operator new(0x10uLL);
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v16 = *(void *)(v15 + 8);
  void *v14 = &unk_189D37FA0;
  v14[1] = v16;
  *(void *)(v15 + 8) = 0LL;
  __int128 v17 = operator new(0x38uLL);
  LODWORD(v16) = *(_DWORD *)(a1 + 32);
  uint64_t v18 = *(void *)(a4 + 8);
  *__int128 v17 = &unk_189D38438;
  v17[1] = v18;
  v17[2] = v14;
  v17[3] = a2;
  v17[4] = a3;
  *((_DWORD *)v17 + 10) = v16;
  *((_DWORD *)v17 + 11) = a5;
  *((_DWORD *)v17 + 12) = a6;
  *((_BYTE *)v17 + 52) = a7;
  *(void *)(a4 + 8) = 0LL;
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &unk_189D384C8;
  result[1] = v17;
  *(void *)(*(void *)(a1 + 56) + 8LL) = result;
  *(void *)(a1 + 56) = v17[2];
  *(void *)(a4 + 8) = v17;
  *(_DWORD *)(a1 + 32) = v16 + 1;
  return result;
}

void sub_183C002E8(_Unwind_Exception *a1)
{
}

unsigned __int8 *sub_183C00330(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, int *a4)
{
  if (a2 != a3)
  {
    int v4 = *a2;
    if ((v4 & 0xF8) == 0x30 || (v4 & 0xFE) == 0x38)
    {
      int v5 = v4 - 48;
      *a4 = v5;
      if (++a2 == a3)
      {
        return a3;
      }

      else
      {
        while (1)
        {
          int v6 = *a2;
          if ((v6 & 0xF8) != 0x30 && (v6 & 0xFE) != 0x38) {
            break;
          }
          if (v5 >= 214748364) {
            sub_183C003CC();
          }
          int v5 = v6 + 10 * v5 - 48;
          *a4 = v5;
          if (++a2 == a3) {
            return a3;
          }
        }
      }
    }
  }

  return a2;
}

void sub_183C003CC()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x186E23230](exception, 8LL);
  __cxa_throw(exception, MEMORY[0x1896146C8], MEMORY[0x189614288]);
}

void sub_183C00404(_Unwind_Exception *a1)
{
}

void sub_183C00418()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x186E23230](exception, 7LL);
  __cxa_throw(exception, MEMORY[0x1896146C8], MEMORY[0x189614288]);
}

void sub_183C00450(_Unwind_Exception *a1)
{
}

void *sub_183C00464(void *a1)
{
  *a1 = &unk_189D38498;
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  *a1 = &unk_189D38018;
  uint64_t v3 = a1[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  return a1;
}

void sub_183C004CC(void *__p)
{
  void *__p = &unk_189D38498;
  uint64_t v2 = __p[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  void *__p = &unk_189D38018;
  uint64_t v3 = __p[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  operator delete(__p);
}

unsigned int *sub_183C00534(unsigned int *result, void *a2)
{
  uint64_t v2 = result[10];
  uint64_t v3 = a2[7];
  int v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 == -991)
  {
    unint64_t v5 = *v4 + 1;
    *int v4 = v5;
    unint64_t v6 = *((void *)result + 3);
    unint64_t v7 = *((void *)result + 4);
    BOOL v8 = v5 < v7;
    if (v5 < v7 && v5 >= v6)
    {
      uint64_t v10 = *(void *)(v3 + 16 * v2 + 8);
      BOOL v8 = v5 < v7 && v10 != a2[2];
    }

    if (!v8 || v5 < v6)
    {
      *(_DWORD *)a2 = -994;
      if (!v8) {
        goto LABEL_25;
      }
LABEL_22:
      a2[10] = *((void *)result + 1);
      return sub_183C006E8(result, a2);
    }

    goto LABEL_23;
  }

  *int v4 = 0LL;
  if (*((void *)result + 4))
  {
    if (*((void *)result + 3))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_22;
    }

unsigned int *sub_183C005E8(unsigned int *result, int a2, void *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((void *)result + 2);
  }

  else
  {
    a3[10] = *((void *)result + 1);
    return sub_183C006E8(result, a3);
  }

  return result;
}

void *sub_183C00618(void *a1)
{
  *a1 = &unk_189D38498;
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  *a1 = &unk_189D38018;
  uint64_t v3 = a1[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  return a1;
}

void sub_183C00680(void *__p)
{
  void *__p = &unk_189D38498;
  uint64_t v2 = __p[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  void *__p = &unk_189D38018;
  uint64_t v3 = __p[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  operator delete(__p);
}

unsigned int *sub_183C006E8(unsigned int *result, void *a2)
{
  unsigned int v2 = result[11];
  *(void *)(a2[7] + 16LL * result[10] + 8) = a2[2];
  unsigned int v3 = result[12];
  if (v2 != v3)
  {
    uint64_t v4 = v2 - 1;
    uint64_t v5 = a2[3];
    uint64_t v6 = v3 - 1 - v4;
    uint64_t v7 = a2[4] + 24LL * v4 + 8;
    do
    {
      *(void *)(v7 - 8) = v5;
      *(void *)uint64_t v7 = v5;
      *(_BYTE *)(v7 + 8) = 0;
      v7 += 24LL;
      --v6;
    }

    while (v6);
  }

  return result;
}

uint64_t sub_183C00744(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void *sub_183C00758(void *a1)
{
  *a1 = &unk_189D38498;
  uint64_t v2 = a1[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  *a1 = &unk_189D38018;
  uint64_t v3 = a1[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  return a1;
}

void sub_183C007C0(void *__p)
{
  void *__p = &unk_189D38498;
  uint64_t v2 = __p[2];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  void *__p = &unk_189D38018;
  uint64_t v3 = __p[1];
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  operator delete(__p);
}

void sub_183C00828(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t sub_183C00834(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)a3 = -994;
  uint64_t v3 = 8LL;
  if (a2) {
    uint64_t v3 = 16LL;
  }
  *(void *)(a3 + 80) = *(void *)(result + v3);
  return result;
}

uint64_t sub_183C00860(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

uint64_t sub_183C00874(uint64_t a1, uint64_t a2, uint64_t a3)
{
  do
  {
    uint64_t v5 = a2;
    a2 = sub_183C00908(a1, a2, a3);
  }

  while (v5 != a2);
  return v5;
}

void sub_183C008BC()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x186E23230](exception, 15LL);
  __cxa_throw(exception, MEMORY[0x1896146C8], MEMORY[0x189614288]);
}

void sub_183C008F4(_Unwind_Exception *a1)
{
}

unsigned __int8 *sub_183C00908(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  int v7 = *(_DWORD *)(a1 + 28);
  BOOL v8 = (unsigned __int8 *)sub_183C00990(a1, a2, a3);
  else {
    return sub_183C00AA0(a1, v8, (unsigned __int8 *)a3, v6, v7 + 1, *(_DWORD *)(a1 + 28) + 1);
  }
}

char *sub_183C00990(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6 = sub_183C00C40(a1, (char *)a2, a3);
  int v7 = v6;
  if ((char *)a2 == v6 && (char *)a2 != a3 && (char *)(a2 + 1) != a3)
  {
    uint64_t v9 = (uint64_t)v6;
    if (*(_BYTE *)a2 == 92) {
      uint64_t v9 = a2 + 2LL * (*(_BYTE *)(a2 + 1) == 40);
    }
    if (v9 == a2)
    {
      if (*(_BYTE *)a2 == 92)
      {
        int v12 = sub_183C00E88(a1, *(_BYTE *)(a2 + 1));
        uint64_t v13 = 2LL;
        if (!v12) {
          uint64_t v13 = 0LL;
        }
        return (char *)(a2 + v13);
      }
    }

    else
    {
      sub_183BFBC38((void *)a1);
      int v10 = *(_DWORD *)(a1 + 28);
      __int128 v11 = (char *)sub_183C00874(a1, v9, (uint64_t)a3);
      if (v11 == a3 || v11 + 1 == a3 || *v11 != 92 || v11[1] != 41) {
        sub_183BFA408();
      }
      int v7 = v11 + 2;
      sub_183BFBC9C((void *)a1, v10);
    }
  }

  return v7;
}

unsigned __int8 *sub_183C00AA0( uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, int a5, int a6)
{
  uint64_t v6 = a2;
  if (a2 != a3)
  {
    int v11 = *a2;
    if (v11 == 42)
    {
      sub_183C001FC(a1, 0LL, -1LL, a4, a5, a6, 1);
      return ++v6;
    }

    if (a2 + 1 != a3 && v11 == 92 && a2[1] == 123)
    {
      uint64_t v13 = a2 + 2;
      int v25 = 0;
      char v14 = sub_183C00330(a1, a2 + 2, a3, &v25);
      if (v13 == v14) {
        goto LABEL_16;
      }
      if (v14 != a3)
      {
        uint64_t v15 = v14 + 1;
        int v16 = *v14;
        if (v16 == 44)
        {
          int v24 = -1;
          __int128 v17 = sub_183C00330(a1, v15, a3, &v24);
          if (v17 != a3 && v17 + 1 != a3 && *v17 == 92 && v17[1] == 125)
          {
            uint64_t v19 = v24;
            uint64_t v18 = v25;
            if (v24 == -1)
            {
              uint64_t v19 = -1LL;
            }

            else if (v24 < v25)
            {
LABEL_16:
              sub_183C003CC();
            }

            uint64_t v6 = &v17[2 * (v17[1] == 125)];
            int v20 = a5;
            int v21 = a6;
            uint64_t v22 = a1;
LABEL_23:
            sub_183C001FC(v22, v18, v19, a4, v20, v21, 1);
            return v6;
          }
        }

        else if (v15 != a3 && v16 == 92 && *v15 == 125)
        {
          uint64_t v6 = v14 + 2;
          uint64_t v18 = v25;
          int v20 = a5;
          int v21 = a6;
          uint64_t v22 = a1;
          uint64_t v19 = v25;
          goto LABEL_23;
        }
      }

      sub_183C00418();
    }
  }

  return v6;
}

char *sub_183C00C40(uint64_t a1, char *a2, char *a3)
{
  if (a2 == a3)
  {
    uint64_t result = sub_183C00D48(a1, a2, a3);
    if (result != a2) {
      return result;
    }
    return sub_183BFBB28(a1, a2, a3);
  }

  int v6 = *a2;
  if ((a2 + 1 != a3 || v6 != 36)
    && ((v6 - 46) > 0x2E || ((1LL << (v6 - 46)) & 0x600000000001LL) == 0))
  {
    sub_183BFC2E4(a1, (char)v6);
    return a2 + 1;
  }

  uint64_t result = sub_183C00D48(a1, a2, a3);
  if (result != a2) {
    return result;
  }
  if (*a2 != 46) {
    return sub_183BFBB28(a1, a2, a3);
  }
  uint64_t v9 = operator new(0x10uLL);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(v10 + 8);
  void *v9 = &unk_189D385A0;
  v9[1] = v11;
  *(void *)(v10 + 8) = v9;
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  return a2 + 1;
}

_BYTE *sub_183C00D48(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3 && a2 + 1 != a3 && *a2 == 92)
  {
    int v4 = (char)a2[1];
    if ((v4 - 36) <= 0x3A && ((1LL << (a2[1] - 36)) & 0x580000000000441LL) != 0)
    {
      sub_183BFC2E4(a1, (char)v4);
      v3 += 2;
    }
  }

  return v3;
}

void *sub_183C00DC0(void *a1)
{
  *a1 = &unk_189D38018;
  uint64_t v2 = a1[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return a1;
}

void sub_183C00E04(void *__p)
{
  void *__p = &unk_189D38018;
  uint64_t v2 = __p[1];
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  operator delete(__p);
}

uint64_t sub_183C00E48(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(_BYTE **)(a2 + 16);
  if (v2 == *(_BYTE **)(a2 + 24) || !*v2)
  {
    uint64_t v3 = 0LL;
    *(_DWORD *)a2 = -993;
  }

  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }

  *(void *)(a2 + 80) = v3;
  return result;
}

uint64_t sub_183C00E88(uint64_t a1, unsigned __int8 a2)
{
  return 1LL;
}

unsigned __int8 *sub_183C00EE4(uint64_t a1, char *a2, char *a3)
{
  int v6 = sub_183C00F40(a1, a2, a3);
  do
  {
    int v7 = v6;
    int v6 = sub_183C00F40(a1, (char *)v6, a3);
  }

  while (v7 != v6);
  return v7;
}

unsigned __int8 *sub_183C00F40(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  int v7 = *(_DWORD *)(a1 + 28);
  BOOL v8 = sub_183C010D0(a1, a2, a3);
  uint64_t v9 = (unsigned __int8 *)v8;
  if (v8 != a2 || v8 == a3) {
    goto LABEL_12;
  }
  int v10 = *a2;
  switch(v10)
  {
    case '$':
      uint64_t v11 = operator new(0x18uLL);
      BOOL v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      uint64_t v13 = *(void *)(a1 + 56);
      char v14 = (char *)&unk_189D38080;
      goto LABEL_8;
    case '(':
      sub_183BFBC38((void *)a1);
      int v16 = *(_DWORD *)(a1 + 28);
      ++*(_DWORD *)(a1 + 36);
      __int128 v17 = (char *)sub_183BF9464(a1, a2 + 1, a3);
      if (v17 == a3 || (uint64_t v18 = v17, *v17 != 41)) {
        sub_183BFA408();
      }
      sub_183BFBC9C((void *)a1, v16);
      --*(_DWORD *)(a1 + 36);
      uint64_t v9 = (unsigned __int8 *)(v18 + 1);
LABEL_12:
      return (unsigned __int8 *)a2;
    case '^':
      uint64_t v11 = operator new(0x18uLL);
      BOOL v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      uint64_t v13 = *(void *)(a1 + 56);
      char v14 = (char *)&unk_189D38038;
LABEL_8:
      uint64_t v15 = *(void *)(v13 + 8);
      *uint64_t v11 = v14 + 16;
      v11[1] = v15;
      *((_BYTE *)v11 + 16) = v12;
      *(void *)(v13 + 8) = v11;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
      uint64_t v9 = (unsigned __int8 *)(a2 + 1);
      return sub_183BFA008(a1, v9, (unsigned __int8 *)a3, v6, v7 + 1, *(_DWORD *)(a1 + 28) + 1);
  }

  return (unsigned __int8 *)a2;
}

char *sub_183C010D0(uint64_t a1, char *a2, char *a3)
{
  uint64_t result = sub_183C01188(a1, a2, a3);
  if (result == a2)
  {
    uint64_t result = sub_183C01210(a1, a2, a3);
    if (result == a2)
    {
      if (a2 == a3 || *a2 != 46)
      {
        return sub_183BFBB28(a1, a2, a3);
      }

      else
      {
        int v7 = operator new(0x10uLL);
        uint64_t v8 = *(void *)(a1 + 56);
        uint64_t v9 = *(void *)(v8 + 8);
        *int v7 = &unk_189D385A0;
        v7[1] = v9;
        *(void *)(v8 + 8) = v7;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
        return a2 + 1;
      }
    }
  }

  return result;
}

char *sub_183C01188(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3)
  {
    int v4 = *a2;
    uint64_t v5 = (v4 - 36);
    if (v5 == 5)
    {
      if (*(_DWORD *)(a1 + 36)) {
        return v3;
      }
    }

    else
    {
LABEL_8:
    }

    sub_183BFC2E4(a1, *a2);
    ++v3;
  }

  return v3;
}

char *sub_183C01210(uint64_t a1, char *a2, char *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3)
  {
    int v4 = a2 + 1;
    if (v3 + 1 != a3 && *v3 == 92)
    {
      int v5 = *v4;
      signed __int8 v6 = *v4;
      BOOL v7 = (v5 - 36) > 0x3A || ((1LL << (*v4 - 36)) & 0x5800000080004F1LL) == 0;
      if (v7 && (v5 - 123) >= 3)
      {
        if ((*(_DWORD *)(a1 + 24) & 0x1F0) == 0x40)
        {
          return sub_183BFE980(a1, v4, a3, 0LL);
        }

        else
        {
          int v9 = sub_183C00E88(a1, v6);
          uint64_t v10 = 2LL;
          if (!v9) {
            uint64_t v10 = 0LL;
          }
          v3 += v10;
        }
      }

      else
      {
        sub_183BFC2E4(a1, v6);
        v3 += 2;
      }
    }
  }

  return v3;
}

uint64_t sub_183C012D4(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  uint64_t v2 = *(void **)(a1 + 32);
  int v4 = *(_DWORD *)(v3 - 8);
  int v5 = v4 | 0x800;
  *(_DWORD *)(v3 - 8) = v4 | 0x800;
  if (*(void **)(v3 + 8) == v2) {
    signed __int8 v6 = (void *)(v3 + 24);
  }
  else {
    signed __int8 v6 = v2;
  }
  uint64_t v7 = v6[1];
  if (*v6 != v7)
  {
LABEL_5:
    *(_DWORD *)(a1 + 24) = v5 | 0x80;
    uint64_t v9 = *(void *)(a1 + 8);
    uint64_t v8 = *(void *)(a1 + 16);
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    char v19 = 0;
    uint64_t v20 = 0LL;
    uint64_t v21 = 0LL;
    char v22 = 0;
    char v23 = 0;
    uint64_t v24 = 0LL;
    *(_OWORD *)std::string __p = 0u;
    memset(v16, 0, sizeof(v16));
    char v10 = sub_183C01654(v8, v7, v9, (uint64_t)__p, v5 | 0x80u);
    sub_183C0182C(v3, v7, v9, (uint64_t *)__p, (v5 & 0x800) != 0);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }

    if ((v10 & 1) == 0)
    {
      uint64_t v2 = *(void **)v3;
LABEL_14:
      if (v2)
      {
        *(void *)(a1 + 40) = v2;
        operator delete(v2);
        *(void *)uint64_t v3 = 0LL;
        *(void *)(v3 + 8) = 0LL;
        *(void *)(v3 + 16) = 0LL;
      }

      *(_BYTE *)(a1 + 128) = 0;
      *(_OWORD *)uint64_t v3 = 0u;
      *(_OWORD *)(v3 + 16) = 0u;
      *(_OWORD *)(v3 + 25) = 0u;
      *(void *)(a1 + 80) = 0LL;
      *(void *)(a1 + 88) = 0LL;
      *(_BYTE *)(a1 + 96) = 0;
      *(void *)(a1 + 104) = 0LL;
      *(void *)(a1 + 112) = 0LL;
      *(_BYTE *)(a1 + 120) = 0;
      *(void *)(a1 + 136) = 0LL;
      return a1;
    }

    return a1;
  }

  uint64_t v11 = *(void *)(a1 + 8);
  if (v11 == v7) {
    goto LABEL_14;
  }
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  char v19 = 0;
  uint64_t v20 = 0LL;
  uint64_t v21 = 0LL;
  char v22 = 0;
  char v23 = 0;
  uint64_t v24 = 0LL;
  *(_OWORD *)std::string __p = 0u;
  memset(v16, 0, sizeof(v16));
  char v13 = sub_183C01654(v12, v7, v11, (uint64_t)__p, v4 | 0x860u);
  sub_183C0182C(v3, v7, v11, (uint64_t *)__p, 1);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  if ((v13 & 1) == 0)
  {
    ++v7;
    int v5 = *(_DWORD *)(a1 + 24);
    goto LABEL_5;
  }

  return a1;
}

void sub_183C01474( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_183C01494(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = a1 + 32;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v6 + 8);
  uint64_t v9 = a2 + 32;
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(v9 + 8);
  BOOL v10 = v8 == v7 && v5 == v4;
  if (v5 != v4 && v8 != v7) {
    return *(void *)a1 == *(void *)a2
  }
        && *(void *)(a1 + 8) == *(void *)(a2 + 8)
        && *(void *)(a1 + 16) == *(void *)(a2 + 16)
        && *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24)
        && sub_183C01528(v4, v7) == 0;
  return v10;
}

uint64_t sub_183C01528(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 16))
  {
    sub_183BFDE9C(&__p, *(char **)a1, *(char **)(a1 + 8), *(void *)(a1 + 8) - *(void *)a1);
  }

  else
  {
    std::string __p = 0LL;
    size_t v19 = 0LL;
    uint64_t v20 = 0LL;
  }

  if (*(_BYTE *)(a2 + 16))
  {
    sub_183BFDE9C(&v15, *(char **)a2, *(char **)(a2 + 8), *(void *)(a2 + 8) - *(void *)a2);
    unsigned int v3 = HIBYTE(v17);
    uint64_t v5 = v15;
    size_t v4 = v16;
  }

  else
  {
    size_t v4 = 0LL;
    uint64_t v5 = 0LL;
    unsigned int v3 = 0;
    uint64_t v15 = 0LL;
    size_t v16 = 0LL;
    uint64_t v17 = 0LL;
  }

  char v6 = HIBYTE(v20);
  if (v20 >= 0) {
    size_t v7 = HIBYTE(v20);
  }
  else {
    size_t v7 = v19;
  }
  if (v20 >= 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  if ((v3 & 0x80u) == 0) {
    size_t v9 = v3;
  }
  else {
    size_t v9 = v4;
  }
  if ((v3 & 0x80u) == 0) {
    BOOL v10 = (void **)&v15;
  }
  else {
    BOOL v10 = v5;
  }
  if (v9 >= v7) {
    size_t v11 = v7;
  }
  else {
    size_t v11 = v9;
  }
  unsigned int v12 = memcmp(p_p, v10, v11);
  if ((v3 & 0x80) != 0)
  {
    operator delete(v5);
    if ((v20 & 0x8000000000000000LL) == 0) {
      goto LABEL_24;
    }
  }

  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_24;
  }

  operator delete(__p);
LABEL_24:
  unsigned int v13 = v9 < v7;
  if (v7 < v9) {
    unsigned int v13 = -1;
  }
  if (v12) {
    return v12;
  }
  else {
    return v13;
  }
}

void sub_183C01638( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_183C01654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if ((a5 & 0x80) != 0) {
    int v9 = a5 & 0xFFA;
  }
  else {
    int v9 = a5;
  }
  sub_183BFAABC(a4, *(_DWORD *)(a1 + 28) + 1, a2, a3, (unsigned __int16)(v9 & 0x800) >> 11);
  if (sub_183C019B8(a1, a2, a3, (uint64_t *)a4, v9, (v9 & 0x800) == 0))
  {
    if (*(void *)(a4 + 8) == *(void *)a4) {
      BOOL v10 = (uint64_t *)(a4 + 24);
    }
    else {
      BOOL v10 = *(uint64_t **)a4;
    }
LABEL_8:
    uint64_t v11 = *v10;
    *(void *)(a4 + 56) = *v10;
    *(_BYTE *)(a4 + 64) = *(void *)(a4 + 48) != v11;
    uint64_t v12 = v10[1];
    *(void *)(a4 + 72) = v12;
    *(_BYTE *)(a4 + 88) = v12 != *(void *)(a4 + 80);
    return 1LL;
  }

  if (a2 != a3 && (v9 & 0x40) == 0)
  {
    int v14 = v9 | 0x80;
    uint64_t v15 = a2 + 1;
    if (v15 != a3)
    {
      while (1)
      {
        sub_183BFAF2C( (char **)a4,  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a4 + 8) - *(void *)a4) >> 3),  (__int128 *)(a4 + 24));
        int v16 = sub_183C019B8(a1, v15, a3, (uint64_t *)a4, v14, 0);
        uint64_t v18 = *(void *)a4;
        uint64_t v17 = *(void *)(a4 + 8);
        if (v16) {
          break;
        }
        sub_183BFAF2C((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((v17 - v18) >> 3), (__int128 *)(a4 + 24));
        if (++v15 == a3) {
          goto LABEL_14;
        }
      }

      if (v17 == v18) {
        BOOL v10 = (uint64_t *)(a4 + 24);
      }
      else {
        BOOL v10 = *(uint64_t **)a4;
      }
      goto LABEL_8;
    }

void sub_183C0182C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, char a5)
{
  uint64_t v10 = a4[6];
  sub_183C03674(a1, 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3));
  uint64_t v11 = *(void *)a1;
  if (*(void *)(a1 + 8) != *(void *)a1)
  {
    uint64_t v12 = 0LL;
    unint64_t v13 = 0LL;
    uint64_t v15 = *a4;
    uint64_t v14 = a4[1];
    do
    {
      unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((v14 - v15) >> 3);
      uint64_t v17 = (void *)(v15 + v12);
      if (v16 <= v13) {
        uint64_t v18 = a4 + 3;
      }
      else {
        uint64_t v18 = v17;
      }
      *(void *)(v11 + v12) = a2 + *v18 - v10;
      if (0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3) <= v13) {
        size_t v19 = a4 + 3;
      }
      else {
        size_t v19 = (uint64_t *)(*a4 + v12);
      }
      *(void *)(*(void *)a1 + v12 + 8) = a2 + v19[1] - v10;
      uint64_t v15 = *a4;
      uint64_t v14 = a4[1];
      if (0xAAAAAAAAAAAAAAABLL * ((v14 - *a4) >> 3) <= v13) {
        uint64_t v20 = a4 + 3;
      }
      else {
        uint64_t v20 = (uint64_t *)(*a4 + v12);
      }
      char v21 = *((_BYTE *)v20 + 16);
      uint64_t v11 = *(void *)a1;
      uint64_t v22 = *(void *)(a1 + 8);
      *(_BYTE *)(*(void *)a1 + v12 + 16) = v21;
      ++v13;
      v12 += 24LL;
    }

    while (v13 < 0xAAAAAAAAAAAAAAABLL * ((v22 - v11) >> 3));
  }

  *(void *)(a1 + 24) = a3;
  *(void *)(a1 + 32) = a3;
  *(_BYTE *)(a1 + 40) = 0;
  uint64_t v23 = a2 + a4[6] - v10;
  *(void *)(a1 + 48) = v23;
  *(void *)(a1 + 56) = a2 + a4[7] - v10;
  *(_BYTE *)(a1 + 64) = *((_BYTE *)a4 + 64);
  *(void *)(a1 + 72) = a2 + a4[9] - v10;
  *(void *)(a1 + 80) = a2 + a4[10] - v10;
  *(_BYTE *)(a1 + 88) = *((_BYTE *)a4 + 88);
  if ((a5 & 1) == 0) {
    *(void *)(a1 + 104) = v23;
  }
  *(_BYTE *)(a1 + 96) = *((_BYTE *)a4 + 96);
}

uint64_t sub_183C019B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0) {
    return sub_183BFAB2C(a1, a2, a3, a4, a5, a6);
  }
  if (*(_DWORD *)(a1 + 28)) {
    return sub_183C01F10(a1, a2, a3, a4, a5, a6);
  }
  return sub_183C019D8(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_183C019D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v59 = 0u;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    *(_DWORD *)uint64_t v55 = 0;
    memset(&v55[8], 0, 32);
    __int128 v56 = 0uLL;
    *(_OWORD *)std::string __p = 0uLL;
    memset(v58, 0, 21);
    sub_183C02478(&v59, (uint64_t)v55);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }

    if (*(void *)&v55[32])
    {
      *(void *)&__int128 v56 = *(void *)&v55[32];
      operator delete(*(void **)&v55[32]);
    }

    uint64_t v12 = *((void *)&v59 + 1);
    unint64_t v13 = *((void *)&v61 + 1) + v61 - 1;
    unint64_t v14 = v13 / 0x2A;
    uint64_t v15 = *(void *)(*((void *)&v59 + 1) + 8 * (v13 / 0x2A));
    unint64_t v16 = 3 * (v13 % 0x2A);
    uint64_t v17 = v15 + 32 * v16;
    *(_DWORD *)uint64_t v17 = 0;
    *(void *)(v17 + 8) = a2;
    *(void *)(*(void *)(v12 + 8 * v14) + 32 * v16 + 16) = a2;
    *(void *)(*(void *)(v12 + 8 * v14) + 32 * v16 + 24) = a3;
    sub_183BFB1B0(*(void *)(v12 + 8 * v14) + 32 * v16 + 56, *(unsigned int *)(a1 + 32));
    char v53 = 0;
    unsigned int v18 = 0;
    uint64_t v51 = 0LL;
    uint64_t v52 = a2;
    uint64_t v19 = a3 - a2;
    uint64_t v20 = *((void *)&v61 + 1);
    uint64_t v21 = *((void *)&v59 + 1);
    unint64_t v22 = *((void *)&v61 + 1) + v61 - 1;
    unint64_t v23 = v22 / 0x2A;
    unint64_t v24 = 3 * (v22 % 0x2A);
    *(void *)(*(void *)(*((void *)&v59 + 1) + 8 * v23) + 32 * v24 + 80) = v6;
    uint64_t v25 = *(void *)(v21 + 8 * v23) + 32 * v24;
    *(_DWORD *)(v25 + 88) = a5;
    *(_BYTE *)(v25 + 92) = a6;
    while (2)
    {
      unint64_t v27 = v20 + v61 - 1;
      uint64_t v28 = *(void *)(*((void *)&v59 + 1) + 8 * (v27 / 0x2A));
      unint64_t v29 = v27 % 0x2A;
      uint64_t v30 = v28 + 96 * (v27 % 0x2A);
      char v32 = (void *)(v30 + 80);
      uint64_t v31 = *(void *)(v30 + 80);
      if (v31) {
        (*(void (**)(uint64_t, unint64_t))(*(void *)v31 + 16LL))(v31, v28 + 96 * v29);
      }
      switch(*(_DWORD *)v30)
      {
        case 0xFFFFFC18:
          uint64_t v33 = *(void *)(v28 + 96 * v29 + 16);
          BOOL v35 = (a5 & 0x1000) == 0 || v33 == a3;
          BOOL v36 = v33 != v52 || (a5 & 0x20) == 0;
          if (!v36 || !v35) {
            goto LABEL_37;
          }
          uint64_t v37 = v33 - *(void *)(v28 + 96 * v29 + 8);
          uint64_t v38 = v51;
          if (v38 != v19)
          {
            uint64_t v51 = v38;
            sub_183C02578(&v59);
            char v53 = 1;
            goto LABEL_38;
          }

          __int16 v39 = (void **)*((void *)&v59 + 1);
          uint64_t v40 = v60;
          if ((void)v60 == *((void *)&v59 + 1))
          {
            uint64_t v40 = *((void *)&v59 + 1);
          }

          else
          {
            __int16 v41 = (void *)(*((void *)&v59 + 1) + 8 * ((unint64_t)v61 / 0x2A));
            int v42 = (void *)(*v41 + 96 * ((unint64_t)v61 % 0x2A));
            unint64_t v43 = *(void *)(*((void *)&v59 + 1) + 8 * ((*((void *)&v61 + 1) + (void)v61) / 0x2AuLL))
                + 96 * ((*((void *)&v61 + 1) + (void)v61) % 0x2AuLL);
            if (v42 != (void *)v43)
            {
              do
              {
                sub_183BFB5E0((uint64_t)&v61 + 8, v42);
                v42 += 12;
                if ((void *)((char *)v42 - *v41) == (void *)4032)
                {
                  int v44 = (void *)v41[1];
                  ++v41;
                  int v42 = v44;
                }
              }

              while (v42 != (void *)v43);
              __int16 v39 = (void **)*((void *)&v59 + 1);
              uint64_t v40 = v60;
            }
          }

          *((void *)&v61 + 1) = 0LL;
          unint64_t v47 = v40 - (void)v39;
          if (v47 >= 0x11)
          {
            do
            {
              operator delete(*v39);
              __int16 v39 = (void **)(*((void *)&v59 + 1) + 8LL);
              *((void *)&v59 + 1) = v39;
              unint64_t v47 = v60 - (void)v39;
            }

            while ((void)v60 - (void)v39 > 0x10uLL);
          }

          if (v47 >> 3 == 1)
          {
            uint64_t v48 = 21LL;
          }

          else
          {
            if (v47 >> 3 != 2) {
              goto LABEL_53;
            }
            uint64_t v48 = 42LL;
          }

          *(void *)&__int128 v61 = v48;
LABEL_53:
          char v53 = 1;
          uint64_t v51 = v19;
LABEL_38:
          uint64_t v20 = *((void *)&v61 + 1);
          if (*((void *)&v61 + 1)) {
            continue;
          }
          if ((v53 & 1) != 0)
          {
            uint64_t v49 = *a4;
            *(void *)uint64_t v49 = v52;
            *(void *)(v49 + 8) = v52 + v51;
            uint64_t v6 = 1LL;
            *(_BYTE *)(v49 + 16) = 1;
          }

          else
          {
            uint64_t v6 = 0LL;
          }

          break;
        case 0xFFFFFC19:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_38;
        case 0xFFFFFC1D:
          sub_183C025F8((uint64_t)&v59, v28 + 96 * v29);
          goto LABEL_37;
        case 0xFFFFFC1F:
LABEL_37:
          sub_183C02578(&v59);
          goto LABEL_38;
        case 0xFFFFFC20:
          __int128 v45 = *(_OWORD *)(v30 + 16);
          *(_OWORD *)uint64_t v55 = *(_OWORD *)v30;
          *(_OWORD *)&v55[16] = v45;
          __int128 v56 = 0uLL;
          *(void *)&v55[32] = 0LL;
          sub_183BFB918( &v55[32],  *(__int128 **)(v28 + 96 * v29 + 32),  *(__int128 **)(v28 + 96 * v29 + 40),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v28 + 96 * v29 + 40) - *(void *)(v28 + 96 * v29 + 32)) >> 3));
          __p[0] = 0LL;
          __p[1] = 0LL;
          v58[0] = 0LL;
          sub_183BFB994( (char *)__p,  *(__int128 **)(v28 + 96 * v29 + 56),  *(__int128 **)(v28 + 96 * v29 + 64),  (uint64_t)(*(void *)(v28 + 96 * v29 + 64) - *(void *)(v28 + 96 * v29 + 56)) >> 4);
          uint64_t v46 = *v32;
          *(void *)((char *)&v58[1] + 5) = *(void *)(v30 + 85);
          v58[1] = v46;
          (*(void (**)(void, uint64_t, unint64_t))(*(void *)*v32 + 24LL))( *v32,  1LL,  v28 + 96 * v29);
          (*(void (**)(void, void, _BYTE *))(*(void *)v58[1] + 24LL))(v58[1], 0LL, v55);
          sub_183C02478(&v59, (uint64_t)v55);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }

          if (*(void *)&v55[32])
          {
            *(void *)&__int128 v56 = *(void *)&v55[32];
            operator delete(*(void **)&v55[32]);
          }

          goto LABEL_38;
        default:
          sub_183BFB22C();
      }

      break;
    }
  }

  sub_183C031E4(&v59);
  return v6;
}

void sub_183C01EC0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, void *__p, uint64_t a22)
{
}

uint64_t sub_183C01F10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v54 = 0LL;
  uint64_t v55 = 0LL;
  v56[0] = 0LL;
  *(_DWORD *)uint64_t v51 = 0;
  memset(&v51[8], 0, 32);
  __int128 v52 = 0u;
  memset(v53, 0, 37);
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v6) {
    goto LABEL_43;
  }
  *(void *)&__int128 v49 = a3;
  *((void *)&v49 + 1) = a3;
  char v50 = 0;
  *(_DWORD *)uint64_t v46 = 0;
  memset(&v46[8], 0, 48);
  *(_OWORD *)std::string __p = 0uLL;
  memset(v48, 0, 21);
  uint64_t v55 = (_OWORD *)sub_183BFB278((uint64_t *)&v54, (uint64_t)v46);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  if (*(void *)&v46[32])
  {
    *(void *)&v46[40] = *(void *)&v46[32];
    operator delete(*(void **)&v46[32]);
  }

  __int16 v41 = a4;
  uint64_t v11 = v55;
  *((_DWORD *)v55 - 24) = 0;
  *((void *)v11 - 11) = a2;
  *((void *)v11 - 10) = a2;
  *((void *)v11 - 9) = a3;
  sub_183BFB174((uint64_t)(v11 - 4), *(unsigned int *)(a1 + 28), &v49);
  sub_183BFB1B0((uint64_t)v55 - 40, *(unsigned int *)(a1 + 32));
  uint64_t v42 = 0LL;
  char v43 = 0;
  unsigned int v12 = 0;
  uint64_t v13 = a3 - a2;
  unint64_t v14 = v55;
  *((void *)v55 - 2) = v6;
  *((_DWORD *)v14 - 2) = a5;
  *((_BYTE *)v14 - 4) = a6;
  do
  {
    BOOL v15 = (++v12 & 0xFFF) != 0 || (int)(v12 >> 12) < (int)v13;
    if (!v15) {
      sub_183BFB1E0();
    }
    uint64_t v17 = v14 - 1;
    uint64_t v16 = *((void *)v14 - 2);
    unsigned int v18 = v14 - 6;
    if (v16) {
      (*(void (**)(uint64_t, _OWORD *))(*(void *)v16 + 16LL))(v16, v14 - 6);
    }
    switch(*(_DWORD *)v18)
    {
      case 0xFFFFFC18:
        uint64_t v19 = *((void *)v14 - 10);
        if ((a5 & 0x20) != 0 && v19 == a2 || (a5 & 0x1000) != 0 && v19 != a3) {
          goto LABEL_19;
        }
        uint64_t v26 = v19 - *((void *)v14 - 11);
        uint64_t v27 = v42;
        if ((v43 & (v42 >= v26)) == 0)
        {
          __int128 v28 = *(v14 - 5);
          *(_OWORD *)uint64_t v51 = *(_OWORD *)v18;
          *(_OWORD *)&v51[16] = v28;
          if (v51 != v18)
          {
            sub_183C03374( &v51[32],  *((__int128 **)v14 - 8),  *((__int128 **)v14 - 7),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v14 - 7) - *((void *)v14 - 8)) >> 3));
            sub_183C03528( v53,  *((uint64_t **)v14 - 5),  *((uint64_t **)v14 - 4),  (uint64_t)(*((void *)v14 - 4) - *((void *)v14 - 5)) >> 4);
          }

          unint64_t v29 = (void *)*v17;
          *(void **)((char *)&v53[3] + 5) = *(void **)((char *)v14 - 11);
          v53[3] = v29;
          uint64_t v27 = v26;
        }

        uint64_t v30 = v55;
        if (v27 == v13)
        {
          uint64_t v31 = (uint64_t)v54;
          while (v30 != (void *)v31)
          {
            v30 -= 12;
            sub_183BFB5E0((uint64_t)v56, v30);
          }

          uint64_t v55 = (_OWORD *)v31;
          char v43 = 1;
          uint64_t v42 = a3 - a2;
        }

        else
        {
          uint64_t v42 = v27;
          char v32 = v55 - 6;
          sub_183BFB5E0((uint64_t)v56, (void *)v55 - 12);
          uint64_t v55 = v32;
          char v43 = 1;
        }

        break;
      case 0xFFFFFC1D:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        break;
      case 0xFFFFFC1F:
LABEL_19:
        uint64_t v20 = v55 - 6;
        sub_183BFB5E0((uint64_t)v56, (void *)v55 - 12);
        uint64_t v55 = v20;
        break;
      case 0xFFFFFC20:
        __int128 v21 = *(v14 - 5);
        *(_OWORD *)uint64_t v46 = *(_OWORD *)v18;
        *(_OWORD *)&v46[16] = v21;
        memset(&v46[32], 0, 24);
        sub_183BFB918( &v46[32],  *((__int128 **)v14 - 8),  *((__int128 **)v14 - 7),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v14 - 7) - *((void *)v14 - 8)) >> 3));
        __p[0] = 0LL;
        __p[1] = 0LL;
        v48[0] = 0LL;
        sub_183BFB994( (char *)__p,  *((__int128 **)v14 - 5),  *((__int128 **)v14 - 4),  (uint64_t)(*((void *)v14 - 4) - *((void *)v14 - 5)) >> 4);
        uint64_t v22 = (void *)*v17;
        *(void *)((char *)&v48[1] + 5) = *(void *)((char *)v14 - 11);
        v48[1] = v22;
        (*(void (**)(void, uint64_t, _OWORD *))(*(void *)*v17 + 24LL))(*v17, 1LL, v14 - 6);
        (*(void (**)(void, void, _BYTE *))(*(void *)v48[1] + 24LL))(v48[1], 0LL, v46);
        unint64_t v23 = v55;
        if ((unint64_t)v55 >= v56[0])
        {
          uint64_t v55 = (_OWORD *)sub_183BFB278((uint64_t *)&v54, (uint64_t)v46);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
        }

        else
        {
          __int128 v24 = *(_OWORD *)&v46[16];
          *uint64_t v55 = *(_OWORD *)v46;
          v23[1] = v24;
          *((void *)v23 + 4) = 0LL;
          *((void *)v23 + 5) = 0LL;
          *((void *)v23 + 6) = 0LL;
          *((void *)v23 + 7) = 0LL;
          v23[2] = *(_OWORD *)&v46[32];
          *((void *)v23 + 6) = *(void *)&v46[48];
          memset(&v46[32], 0, 24);
          *((void *)v23 + 8) = 0LL;
          *((void *)v23 + 9) = 0LL;
          *(_OWORD *)((char *)v23 + 56) = *(_OWORD *)__p;
          *((void *)v23 + 9) = v48[0];
          __p[0] = 0LL;
          __p[1] = 0LL;
          v48[0] = 0LL;
          uint64_t v25 = v48[1];
          *(void *)((char *)v23 + 85) = *(void *)((char *)&v48[1] + 5);
          *((void *)v23 + 10) = v25;
          uint64_t v55 = v23 + 6;
        }

        if (*(void *)&v46[32])
        {
          *(void *)&v46[40] = *(void *)&v46[32];
          operator delete(*(void **)&v46[32]);
        }

        break;
      default:
        sub_183BFB22C();
    }

    unint64_t v14 = v55;
  }

  while (v54 != v55);
  if ((v43 & 1) != 0)
  {
    uint64_t v33 = *v41;
    *(void *)uint64_t v33 = a2;
    *(void *)(v33 + 8) = a2 + v42;
    *(_BYTE *)(v33 + 16) = 1;
    if ((void)v52 != *(void *)&v51[32])
    {
      unint64_t v34 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v52 - *(void *)&v51[32]) >> 3);
      BOOL v35 = (_BYTE *)(*(void *)&v51[32] + 16LL);
      unsigned int v36 = 1;
      do
      {
        uint64_t v37 = v33 + 24LL * v36;
        *(_OWORD *)uint64_t v37 = *((_OWORD *)v35 - 1);
        char v38 = *v35;
        v35 += 24;
        *(_BYTE *)(v37 + 16) = v38;
        BOOL v15 = v34 > v36++;
      }

      while (v15);
    }

    uint64_t v39 = 1LL;
  }

  else
  {
LABEL_43:
    uint64_t v39 = 0LL;
  }

  if (v53[0])
  {
    v53[1] = v53[0];
    operator delete(v53[0]);
  }

  if (*(void *)&v51[32])
  {
    *(void *)&__int128 v52 = *(void *)&v51[32];
    operator delete(*(void **)&v51[32]);
  }

  *(void *)uint64_t v51 = &v54;
  sub_183BFBA04((void ***)v51);
  return v39;
}

void sub_183C02418( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, void *__p, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35)
{
  a35 = v35 - 120;
  sub_183BFBA04((void ***)&a35);
  _Unwind_Resume(a1);
}

__n128 sub_183C02478(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  uint64_t v6 = 42 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5) {
    uint64_t v6 = 0LL;
  }
  unint64_t v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    sub_183C026E8(a1);
    uint64_t v5 = a1[1];
    unint64_t v7 = a1[5] + a1[4];
  }

  unint64_t v8 = *(void *)(v5 + 8 * (v7 / 0x2A)) + 96 * (v7 % 0x2A);
  __int128 v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)unint64_t v8 = *(_OWORD *)a2;
  *(_OWORD *)(v8 + 16) = v9;
  *(void *)(v8 + 40) = 0LL;
  *(void *)(v8 + 48) = 0LL;
  *(void *)(v8 + 32) = 0LL;
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(v8 + 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0LL;
  *(void *)(a2 + 40) = 0LL;
  *(void *)(a2 + 48) = 0LL;
  *(void *)(v8 + 56) = 0LL;
  *(void *)(v8 + 64) = 0LL;
  *(void *)(v8 + 72) = 0LL;
  __n128 result = *(__n128 *)(a2 + 56);
  *(__n128 *)(v8 + 56) = result;
  *(void *)(v8 + 72) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0LL;
  *(void *)(a2 + 64) = 0LL;
  *(void *)(a2 + 72) = 0LL;
  uint64_t v11 = *(void *)(a2 + 80);
  *(void *)(v8 + 85) = *(void *)(a2 + 85);
  *(void *)(v8 + 80) = v11;
  ++a1[5];
  return result;
}

uint64_t sub_183C02578(void *a1)
{
  uint64_t v2 = a1 + 5;
  unint64_t v3 = a1[5] + a1[4] - 1LL;
  sub_183BFB5E0((uint64_t)(a1 + 5), (void *)(*(void *)(a1[1] + 8 * (v3 / 0x2A)) + 96 * (v3 % 0x2A)));
  --*v2;
  return sub_183C02E58(a1, 1);
}

int64x2_t sub_183C025F8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
    sub_183C02ECC((void **)a1);
    unint64_t v4 = *(void *)(a1 + 32);
  }

  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = (void *)(v5 + 8 * (v4 / 0x2A));
  uint64_t v7 = *v6 + 96 * (v4 % 0x2A);
  if (*(void *)(a1 + 16) == v5) {
    uint64_t v7 = 0LL;
  }
  if (v7 == *v6) {
    uint64_t v7 = *(v6 - 1) + 4032LL;
  }
  __int128 v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v7 - 96) = *(_OWORD *)a2;
  *(_OWORD *)(v7 - 80) = v8;
  *(void *)(v7 - 56) = 0LL;
  *(void *)(v7 - 48) = 0LL;
  *(void *)(v7 - 64) = 0LL;
  *(_OWORD *)(v7 - 64) = *(_OWORD *)(a2 + 32);
  *(void *)(v7 - 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0LL;
  *(void *)(a2 + 40) = 0LL;
  *(void *)(a2 + 48) = 0LL;
  *(void *)(v7 - 40) = 0LL;
  *(void *)(v7 - 32) = 0LL;
  *(void *)(v7 - 24) = 0LL;
  *(_OWORD *)(v7 - 40) = *(_OWORD *)(a2 + 56);
  *(void *)(v7 - 24) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0LL;
  *(void *)(a2 + 64) = 0LL;
  *(void *)(a2 + 72) = 0LL;
  uint64_t v9 = *(void *)(a2 + 80);
  *(void *)(v7 - 11) = *(void *)(a2 + 85);
  *(void *)(v7 - 16) = v9;
  int64x2_t result = vaddq_s64(*(int64x2_t *)(a1 + 32), (int64x2_t)xmmword_183C14A50);
  *(int64x2_t *)(a1 + 32) = result;
  return result;
}

void sub_183C026E8(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x2A;
  unint64_t v4 = v2 - 42;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    __int128 v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)__int128 v8 = v10;
      a1[2] += 8LL;
      return;
    }

    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      unint64_t v34 = (char *)sub_183BF77F8(v5, v33);
      uint64_t v35 = &v34[8 * (v33 >> 2)];
      uint64_t v37 = &v34[8 * v36];
      char v38 = (uint64_t *)a1[1];
      __int128 v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        __int128 v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v40 = 8 * (v39 >> 3);
        __int16 v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)__int16 v41 = v42;
          v41 += 8;
          v40 -= 8LL;
        }

        while (v40);
      }

      goto LABEL_30;
    }

LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    uint64_t v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      uint64_t v9 = (char *)a1[1];
    }

    __int128 v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }

  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&__int128 v54 = operator new(0xFC0uLL);
      sub_183C029FC(a1, &v54);
      return;
    }

    *(void *)&__int128 v54 = operator new(0xFC0uLL);
    sub_183C02B10((uint64_t)a1, &v54);
    int v44 = (void *)a1[1];
    __int128 v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    uint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      unint64_t v34 = (char *)sub_183BF77F8((uint64_t)(a1 + 3), v46);
      uint64_t v35 = &v34[8 * (v46 >> 2)];
      uint64_t v37 = &v34[8 * v47];
      uint64_t v48 = (uint64_t *)a1[1];
      __int128 v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        __int128 v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v50 = 8 * (v49 >> 3);
        uint64_t v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)uint64_t v51 = v52;
          v51 += 8;
          v50 -= 8LL;
        }

        while (v50);
      }

LABEL_30:
      char v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        __int128 v8 = (char *)a1[2];
      }

      goto LABEL_33;
    }

    goto LABEL_5;
  }

  if (v23 == *a1) {
    unint64_t v25 = 1LL;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  __int128 v56 = a1 + 3;
  *(void *)&__int128 v54 = sub_183BF77F8((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&__int128 v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  char v53 = operator new(0xFC0uLL);
  sub_183C02C2C(&v54, &v53);
  uint64_t v27 = (void *)a1[2];
  uint64_t v28 = -7LL - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8LL;
    sub_183C02D40((uint64_t)&v54, v27);
  }

  unint64_t v29 = (char *)*a1;
  __int128 v30 = v54;
  __int128 v31 = v55;
  *(void *)&__int128 v54 = *a1;
  *((void *)&v54 + 1) = v27;
  __int128 v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  __int128 v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&__int128 v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8LL);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_183C029B0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_183C029FC(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    uint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      uint64_t v19 = (char *)sub_183BF77F8(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8LL;
        }

        while (v24);
      }

      uint64_t v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }

    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }

      uint64_t v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }

  *(void *)uint64_t v6 = *a2;
  a1[2] += 8LL;
}

void sub_183C02B10(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    uint64_t v7 = *(_BYTE **)(a1 + 24);
    uint64_t v8 = *(_BYTE **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1LL;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)sub_183BF77F8(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8LL];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8LL;
        }

        while (v19);
      }

      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }

    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }

      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }

  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }

  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8LL;
}

void sub_183C02C2C(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      else {
        unint64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)sub_183BF77F8(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8LL;
        }

        while (v22);
      }

      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }

    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }

      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }

  *(void *)uint64_t v4 = *a2;
  a1[2] += 8LL;
}

void sub_183C02D40(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(_BYTE **)(a1 + 16);
    uint64_t v7 = *(_BYTE **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        unint64_t v11 = 1LL;
      }
      else {
        unint64_t v11 = (v7 - v4) >> 2;
      }
      uint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)sub_183BF77F8(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8LL];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      unint64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        unint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8LL;
        }

        while (v18);
      }

      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }

    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }

      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }

  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }

  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8LL;
}

uint64_t sub_183C02E58(void *a1, int a2)
{
  uint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  if (v2 == v3) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = 42 * ((v2 - v3) >> 3) - 1;
  }
  unint64_t v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x2A) {
    a2 = 1;
  }
  if (v5 < 0x54) {
    int v7 = a2;
  }
  else {
    int v7 = 0;
  }
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8LL;
  }

  return v7 ^ 1u;
}

void sub_183C02ECC(void **a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  unint64_t v4 = (v3 - v2) >> 3;
  if (v3 == v2) {
    uint64_t v5 = 0LL;
  }
  else {
    uint64_t v5 = 42 * v4 - 1;
  }
  uint64_t v6 = (char *)a1[4];
  if (v5 - (unint64_t)&v6[(void)a1[5]] < 0x2A)
  {
    uint64_t v7 = (uint64_t)(a1 + 3);
    uint64_t v8 = a1[3];
    uint64_t v9 = *a1;
    uint64_t v10 = v8 - (_BYTE *)*a1;
    if (v4 >= v10 >> 3)
    {
      if (v8 == v9) {
        unint64_t v11 = 1LL;
      }
      else {
        unint64_t v11 = v10 >> 2;
      }
      unint64_t v46 = a1 + 3;
      std::string __p = sub_183BF77F8(v7, v11);
      char v43 = (char *)__p;
      int v44 = (char *)__p;
      uint64_t v45 = (char *)__p + 8 * v12;
      __int16 v41 = operator new(0xFC0uLL);
      sub_183C02C2C(&__p, &v41);
      uint64_t v13 = (char *)a1[1];
      uint64_t v14 = v44;
      if (v13 == a1[2])
      {
        unint64_t v33 = (char *)a1[1];
      }

      else
      {
        do
        {
          if (v14 == v45)
          {
            int64_t v15 = v43 - (_BYTE *)__p;
            if (v43 <= __p)
            {
              if (v14 == __p) {
                unint64_t v23 = 1LL;
              }
              else {
                unint64_t v23 = (v14 - (_BYTE *)__p) >> 2;
              }
              uint64_t v24 = (char *)sub_183BF77F8((uint64_t)v46, v23);
              uint64_t v26 = v43;
              uint64_t v14 = &v24[8 * (v23 >> 2)];
              uint64_t v27 = v44 - v43;
              if (v44 != v43)
              {
                uint64_t v14 = &v24[8 * (v23 >> 2) + (v27 & 0xFFFFFFFFFFFFFFF8LL)];
                uint64_t v28 = 8 * (v27 >> 3);
                unint64_t v29 = &v24[8 * (v23 >> 2)];
                do
                {
                  uint64_t v30 = *(void *)v26;
                  v26 += 8;
                  *(void *)unint64_t v29 = v30;
                  v29 += 8;
                  v28 -= 8LL;
                }

                while (v28);
              }

              __int128 v31 = __p;
              std::string __p = v24;
              char v43 = &v24[8 * (v23 >> 2)];
              int v44 = v14;
              uint64_t v45 = &v24[8 * v25];
              if (v31)
              {
                operator delete(v31);
                uint64_t v14 = v44;
              }
            }

            else
            {
              uint64_t v16 = v15 >> 3;
              BOOL v17 = v15 >> 3 < -1;
              uint64_t v18 = (v15 >> 3) + 2;
              if (v17) {
                uint64_t v19 = v18;
              }
              else {
                uint64_t v19 = v16 + 1;
              }
              uint64_t v20 = &v43[-8 * (v19 >> 1)];
              int64_t v21 = v14 - v43;
              if (v14 != v43)
              {
                memmove(&v43[-8 * (v19 >> 1)], v43, v14 - v43);
                uint64_t v14 = v43;
              }

              uint64_t v22 = &v14[-8 * (v19 >> 1)];
              uint64_t v14 = &v20[v21];
              char v43 = v22;
              int v44 = &v20[v21];
            }
          }

          uint64_t v32 = *(void *)v13;
          v13 += 8;
          *(void *)uint64_t v14 = v32;
          uint64_t v14 = v44 + 8;
          v44 += 8;
        }

        while (v13 != a1[2]);
        unint64_t v33 = (char *)a1[1];
      }

      uint64_t v36 = *a1;
      uint64_t v37 = v43;
      *a1 = __p;
      a1[1] = v37;
      std::string __p = v36;
      char v43 = v33;
      char v38 = (char *)a1[3];
      uint64_t v39 = v45;
      a1[2] = v14;
      a1[3] = v39;
      int v44 = v13;
      uint64_t v45 = v38;
      if (v14 - v37 == 8) {
        uint64_t v40 = 21LL;
      }
      else {
        uint64_t v40 = (uint64_t)a1[4] + 42;
      }
      a1[4] = (void *)v40;
      if (v13 != v33) {
        int v44 = &v13[(v33 - v13 + 7) & 0xFFFFFFFFFFFFFFF8LL];
      }
      if (v36) {
        operator delete(v36);
      }
    }

    else
    {
      if (v2 == v9)
      {
        std::string __p = operator new(0xFC0uLL);
        sub_183C029FC(a1, &__p);
        unint64_t v34 = a1[2];
        std::string __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }

      else
      {
        std::string __p = operator new(0xFC0uLL);
      }

      sub_183C02B10((uint64_t)a1, &__p);
      if ((_BYTE *)a1[2] - (_BYTE *)a1[1] == 8) {
        uint64_t v35 = 21LL;
      }
      else {
        uint64_t v35 = (uint64_t)a1[4] + 42;
      }
      a1[4] = (void *)v35;
    }
  }

  else
  {
    a1[4] = v6 + 42;
    std::string __p = (void *)*((void *)v3 - 1);
    a1[2] = v3 - 8;
    sub_183C02B10((uint64_t)a1, &__p);
  }

void sub_183C03198( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_183C031E4(void *a1)
{
  uint64_t v2 = a1 + 5;
  uint64_t v3 = (void **)a1[1];
  unint64_t v4 = (void **)a1[2];
  if (v4 == v3)
  {
    unint64_t v4 = (void **)a1[1];
  }

  else
  {
    unint64_t v5 = a1[4];
    uint64_t v6 = &v3[v5 / 0x2A];
    uint64_t v7 = (char *)*v6 + 96 * (v5 % 0x2A);
    unint64_t v8 = (unint64_t)v3[(a1[5] + v5) / 0x2A] + 96 * ((a1[5] + v5) % 0x2A);
    if (v7 != (char *)v8)
    {
      do
      {
        sub_183BFB5E0((uint64_t)v2, v7);
        v7 += 96;
        if (v7 - (_BYTE *)*v6 == 4032)
        {
          uint64_t v9 = (char *)v6[1];
          ++v6;
          uint64_t v7 = v9;
        }
      }

      while (v7 != (char *)v8);
      uint64_t v3 = (void **)a1[1];
      unint64_t v4 = (void **)a1[2];
    }
  }

  void *v2 = 0LL;
  unint64_t v10 = (char *)v4 - (char *)v3;
  if ((unint64_t)((char *)v4 - (char *)v3) >= 0x11)
  {
    do
    {
      operator delete(*v3);
      unint64_t v4 = (void **)a1[2];
      uint64_t v3 = (void **)(a1[1] + 8LL);
      a1[1] = v3;
      unint64_t v10 = (char *)v4 - (char *)v3;
    }

    while ((unint64_t)((char *)v4 - (char *)v3) > 0x10);
  }

  unint64_t v11 = v10 >> 3;
  if (v11 == 1)
  {
    uint64_t v12 = 21LL;
  }

  else
  {
    if (v11 != 2) {
      goto LABEL_16;
    }
    uint64_t v12 = 42LL;
  }

  a1[4] = v12;
LABEL_16:
  while (v3 != v4)
  {
    uint64_t v13 = *v3++;
    operator delete(v13);
  }

  return sub_183C03328((uint64_t)a1);
}

uint64_t sub_183C03328(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8LL);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

char *sub_183C03374(void *a1, __int128 *a2, __int128 *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = a1[2];
  int64x2_t result = (char *)*a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 3) >= a4)
  {
    uint64_t v19 = (char *)a1[1];
    uint64_t v14 = a1 + 1;
    uint64_t v13 = v19;
    unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((v19 - result) >> 3);
    if (v20 >= a4)
    {
      uint64_t v25 = result;
      if (a2 != a3)
      {
        uint64_t v26 = result;
        do
        {
          *(_OWORD *)uint64_t v26 = *v6;
          v26[16] = *((_BYTE *)v6 + 16);
          v25 += 24;
          uint64_t v6 = (__int128 *)((char *)v6 + 24);
          v26 += 24;
        }

        while (v6 != a3);
      }

      int64_t v18 = v25 - result;
      uint64_t v13 = result;
    }

    else
    {
      int64_t v21 = (__int128 *)((char *)a2 + 24 * v20);
      if (v13 != result)
      {
        do
        {
          *(_OWORD *)int64x2_t result = *v6;
          result[16] = *((_BYTE *)v6 + 16);
          uint64_t v6 = (__int128 *)((char *)v6 + 24);
          result += 24;
        }

        while (v6 != v21);
      }

      uint64_t v22 = v13;
      if (v21 != a3)
      {
        unint64_t v23 = v13;
        do
        {
          __int128 v24 = *v21;
          *((void *)v23 + 2) = *((void *)v21 + 2);
          *(_OWORD *)unint64_t v23 = v24;
          v23 += 24;
          int64_t v21 = (__int128 *)((char *)v21 + 24);
          v22 += 24;
        }

        while (v21 != a3);
      }

      int64_t v18 = v22 - v13;
    }
  }

  else
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

    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      sub_183BF77E4();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= a4) {
      uint64_t v11 = a4;
    }
    if (v10 >= 0x555555555555555LL) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v11;
    }
    int64x2_t result = sub_183BFB0A0(a1, v12);
    int64_t v15 = (char *)a1[1];
    uint64_t v14 = a1 + 1;
    uint64_t v13 = v15;
    uint64_t v16 = v15;
    if (v6 != a3)
    {
      uint64_t v16 = v13;
      do
      {
        __int128 v17 = *v6;
        *((void *)v16 + 2) = *((void *)v6 + 2);
        *(_OWORD *)uint64_t v16 = v17;
        v16 += 24;
        uint64_t v6 = (__int128 *)((char *)v6 + 24);
      }

      while (v6 != a3);
    }

    int64_t v18 = v16 - v13;
  }

  void *v14 = &v13[v18];
  return result;
}

char *sub_183C03528(void *a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = a1[2];
  int64x2_t result = (char *)*a1;
  if (a4 <= (v8 - (uint64_t)result) >> 4)
  {
    int64_t v18 = (char *)a1[1];
    uint64_t v13 = a1 + 1;
    unint64_t v12 = v18;
    unint64_t v19 = (v18 - result) >> 4;
    if (v19 >= a4)
    {
      uint64_t v26 = result;
      if (a2 != a3)
      {
        uint64_t v27 = result;
        do
        {
          uint64_t v28 = *v6;
          uint64_t v29 = v6[1];
          v6 += 2;
          *(void *)uint64_t v27 = v28;
          *((void *)v27 + 1) = v29;
          v27 += 16;
          v26 += 16;
        }

        while (v6 != a3);
      }

      __int128 v17 = (char *)(v26 - result);
      unint64_t v12 = result;
    }

    else
    {
      unint64_t v20 = (__int128 *)&a2[2 * v19];
      if (v12 != result)
      {
        do
        {
          uint64_t v21 = *v6;
          uint64_t v22 = v6[1];
          v6 += 2;
          *(void *)int64x2_t result = v21;
          *((void *)result + 1) = v22;
          result += 16;
        }

        while (v6 != (uint64_t *)v20);
      }

      unint64_t v23 = v12;
      if (v20 != (__int128 *)a3)
      {
        __int128 v24 = v12;
        do
        {
          __int128 v25 = *v20++;
          *(_OWORD *)__int128 v24 = v25;
          v24 += 16;
          v23 += 16;
        }

        while (v20 != (__int128 *)a3);
      }

      __int128 v17 = (char *)(v23 - v12);
    }
  }

  else
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

    if (a4 >> 60) {
      sub_183BF77E4();
    }
    uint64_t v10 = v8 >> 3;
    if (v8 >> 3 <= a4) {
      uint64_t v10 = a4;
    }
    else {
      unint64_t v11 = v10;
    }
    int64x2_t result = sub_183BF7B9C(a1, v11);
    uint64_t v14 = (char *)a1[1];
    uint64_t v13 = a1 + 1;
    unint64_t v12 = v14;
    int64_t v15 = v14;
    if (v6 != a3)
    {
      int64_t v15 = v12;
      do
      {
        __int128 v16 = *(_OWORD *)v6;
        v6 += 2;
        *(_OWORD *)int64_t v15 = v16;
        v15 += 16;
      }

      while (v6 != a3);
    }

    __int128 v17 = (char *)(v15 - v12);
  }

  void *v13 = &v17[(void)v12];
  return result;
}

void sub_183C03674(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_183C036B0((void **)a1, v4);
  }

  else if (!v3)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 24 * a2;
  }

void sub_183C036B0(void **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(void **)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - (_BYTE *)v7) >> 3) >= a2)
  {
    if (a2)
    {
      uint64_t v13 = &v7[3 * a2];
      uint64_t v14 = 24 * a2;
      do
      {
        *uint64_t v7 = 0LL;
        v7[1] = 0LL;
        *((_BYTE *)v7 + 16) = 0;
        v7 += 3;
        v14 -= 24LL;
      }

      while (v14);
      uint64_t v7 = v13;
    }

    a1[1] = v7;
  }

  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v7 - (_BYTE *)*a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_183BF77E4();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (_BYTE *)*a1) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555LL) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11) {
      unint64_t v12 = (char *)sub_183BFB0F0(v4, v11);
    }
    else {
      unint64_t v12 = 0LL;
    }
    int64_t v15 = &v12[24 * v8];
    __int128 v16 = &v15[24 * a2];
    uint64_t v17 = 24 * a2;
    int64_t v18 = v15;
    do
    {
      *(void *)int64_t v18 = 0LL;
      *((void *)v18 + 1) = 0LL;
      v18[16] = 0;
      v18 += 24;
      v17 -= 24LL;
    }

    while (v17);
    unint64_t v19 = &v12[24 * v11];
    uint64_t v21 = (char *)*a1;
    unint64_t v20 = (char *)a1[1];
    if (v20 != *a1)
    {
      do
      {
        __int128 v22 = *(_OWORD *)(v20 - 24);
        *((void *)v15 - 1) = *((void *)v20 - 1);
        *(_OWORD *)(v15 - 24) = v22;
        v15 -= 24;
        v20 -= 24;
      }

      while (v20 != v21);
      unint64_t v20 = (char *)*a1;
    }

    *a1 = v15;
    a1[1] = v16;
    a1[2] = v19;
    if (v20) {
      operator delete(v20);
    }
  }

uint64_t sub_183C03818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  __int16 v5 = a5;
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  *(void *)(a1 + 16) = a4;
  *(_DWORD *)(a1 + 24) = a5;
  *(_OWORD *)(a1 + 32) = 0u;
  uint64_t v9 = a1 + 32;
  *(void *)(a1 + 80) = 0LL;
  *(void *)(a1 + 88) = 0LL;
  *(_BYTE *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0LL;
  *(void *)(a1 + 112) = 0LL;
  *(_BYTE *)(a1 + 120) = 0;
  *(_BYTE *)(a1 + 128) = 0;
  *(void *)(a1 + 136) = 0LL;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 57) = 0u;
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  char v15 = 0;
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  char v18 = 0;
  char v19 = 0;
  uint64_t v20 = 0LL;
  *(_OWORD *)std::string __p = 0u;
  memset(v12, 0, sizeof(v12));
  sub_183C01654(a4, a2, a3, (uint64_t)__p, a5);
  sub_183C0182C(v9, a2, a3, (uint64_t *)__p, (v5 & 0x800) != 0);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return a1;
}

void sub_183C038EC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p) {
    operator delete(__p);
  }
  uint64_t v13 = *v11;
  if (*v11)
  {
    *(void *)(v10 + 40) = v13;
    operator delete(v13);
  }

  _Unwind_Resume(exception_object);
}

const std::locale *sub_183C03918(const std::locale *a1, char *a2, int a3)
{
  uint64_t v6 = sub_183BF8FD0(a1);
  LODWORD(v6[3].__locale_) = a3;
  *(_OWORD *)((char *)&v6[3].__locale_ + 4) = 0u;
  *(_OWORD *)((char *)&v6[5].__locale_ + 4) = 0u;
  HIDWORD(v6[7].__locale_) = 0;
  size_t v7 = strlen(a2);
  return a1;
}

void sub_183C0398C(_Unwind_Exception *a1)
{
}

char *sub_183C039A8(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6 = operator new(8uLL);
  *uint64_t v6 = &unk_189D37ED0;
  size_t v7 = operator new(0x10uLL);
  *size_t v7 = &unk_189D37FA0;
  v7[1] = v6;
  sub_183BF91C8((void *)(a1 + 40), (uint64_t)v7);
  *(void *)(a1 + 56) = *(void *)(a1 + 40);
  unsigned int v8 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v8 > 0x3F)
  {
    switch(v8)
    {
      case 0x40u:
        return sub_183C03D4C(a1, a2, a3);
      case 0x80u:
        return (char *)sub_183C03DEC(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
      case 0x100u:
        return sub_183C03F1C(a1, a2, a3);
      default:
        goto LABEL_14;
    }
  }

  else if (v8)
  {
    if (v8 != 16)
    {
      if (v8 != 32) {
LABEL_14:
      }
        sub_183BF9764();
      return sub_183C03D4C(a1, a2, a3);
    }

    return sub_183C03C20(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
  }

  else
  {
    return sub_183C03AF8(a1, (unsigned __int8 *)a2, a3);
  }

void sub_183C03ADC(_Unwind_Exception *a1)
{
}

char *sub_183C03AF8(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  size_t v7 = a2;
  do
  {
    unsigned int v8 = v7;
    size_t v7 = sub_183C0404C(a1, (char *)v7, a3);
  }

  while (v7 != v8);
  if (v8 == a2)
  {
    uint64_t v9 = operator new(0x10uLL);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(v10 + 8);
    void *v9 = &unk_189D37FA0;
    v9[1] = v11;
    *(void *)(v10 + 8) = v9;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  }

  if (v8 != (unsigned __int8 *)a3)
  {
    while (*v8 == 124)
    {
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = v8 + 1;
      uint64_t v14 = v8 + 1;
      do
      {
        unsigned int v8 = v14;
        uint64_t v14 = sub_183C0404C(a1, (char *)v14, a3);
      }

      while (v14 != v8);
      if (v8 == v13)
      {
        char v15 = operator new(0x10uLL);
        uint64_t v16 = *(void *)(a1 + 56);
        uint64_t v17 = *(void *)(v16 + 8);
        *char v15 = &unk_189D37FA0;
        v15[1] = v17;
        *(void *)(v16 + 8) = v15;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
      }

      sub_183BF9A5C(a1, v6, v12);
    }

    return (char *)v8;
  }

  return a3;
}

char *sub_183C03C20(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  BOOL v3 = a2;
  if (a2 == a3) {
    return (char *)a2;
  }
  uint64_t v4 = (char *)a3;
  if (*a2 == 94)
  {
    uint64_t v6 = operator new(0x18uLL);
    BOOL v7 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(v8 + 8);
    *uint64_t v6 = &unk_189D38048;
    v6[1] = v9;
    *((_BYTE *)v6 + 16) = v7;
    *(void *)(v8 + 8) = v6;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    ++v3;
  }

  if (v3 != (unsigned __int8 *)v4)
  {
    do
    {
      uint64_t v10 = v3;
      BOOL v3 = sub_183C05A10(a1, (char *)v3, v4);
    }

    while (v3 != v10);
    if (v10 != (unsigned __int8 *)v4)
    {
      uint64_t v11 = operator new(0x18uLL);
      BOOL v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = *(void *)(v13 + 8);
      *uint64_t v11 = &unk_189D38090;
      v11[1] = v14;
      *((_BYTE *)v11 + 16) = v12;
      *(void *)(v13 + 8) = v11;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    }
  }

  return v4;
}

char *sub_183C03D4C(uint64_t a1, char *a2, char *a3)
{
  BOOL v3 = a3;
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = sub_183C05E4C(a1, a2, a3);
  if (v7 == (unsigned __int8 *)a2) {
LABEL_9:
  }
    sub_183C008BC();
  uint64_t v8 = v7;
  while (v8 != (unsigned __int8 *)v3)
  {
    if (*v8 != 124) {
      return (char *)v8;
    }
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = sub_183C05E4C(a1, (char *)v8 + 1, v3);
    if (v10 == v8 + 1) {
      goto LABEL_9;
    }
    uint64_t v8 = v10;
    sub_183BF9A5C(a1, v6, v9);
  }

  return v3;
}

unsigned __int8 *sub_183C03DEC(uint64_t a1, unsigned __int8 *__s, unsigned __int8 *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = (unsigned __int8 *)memchr(__s, 10, a3 - __s);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = a3;
  }
  if (v8 == __s)
  {
    uint64_t v9 = operator new(0x10uLL);
    uint64_t v10 = *(void *)(v6 + 8);
    void *v9 = &unk_189D37FA0;
    v9[1] = v10;
    *(void *)(v6 + 8) = v9;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  }

  else
  {
    sub_183C03C20(a1, __s, v8);
  }

  if (v8 != a3) {
    ++v8;
  }
  while (v8 != a3)
  {
    uint64_t v11 = (unsigned __int8 *)memchr(v8, 10, a3 - v8);
    if (v11) {
      BOOL v12 = v11;
    }
    else {
      BOOL v12 = a3;
    }
    uint64_t v13 = *(void *)(a1 + 56);
    if (v12 == v8)
    {
      uint64_t v14 = operator new(0x10uLL);
      uint64_t v15 = *(void *)(v13 + 8);
      void *v14 = &unk_189D37FA0;
      v14[1] = v15;
      *(void *)(v13 + 8) = v14;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    }

    else
    {
      sub_183C03C20(a1, v8, v12);
    }

    sub_183BF9A5C(a1, v6, v13);
    if (v12 == a3) {
      uint64_t v8 = v12;
    }
    else {
      uint64_t v8 = v12 + 1;
    }
  }

  return a3;
}

char *sub_183C03F1C(uint64_t a1, char *__s, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  BOOL v7 = (char *)memchr(__s, 10, a3 - __s);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = a3;
  }
  if (v8 == __s)
  {
    uint64_t v9 = operator new(0x10uLL);
    uint64_t v10 = *(void *)(v6 + 8);
    void *v9 = &unk_189D37FA0;
    v9[1] = v10;
    *(void *)(v6 + 8) = v9;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  }

  else
  {
    sub_183C03D4C(a1, __s, v8);
  }

  if (v8 != a3) {
    ++v8;
  }
  while (v8 != a3)
  {
    uint64_t v11 = (char *)memchr(v8, 10, a3 - v8);
    if (v11) {
      BOOL v12 = v11;
    }
    else {
      BOOL v12 = a3;
    }
    uint64_t v13 = *(void *)(a1 + 56);
    if (v12 == v8)
    {
      uint64_t v14 = operator new(0x10uLL);
      uint64_t v15 = *(void *)(v13 + 8);
      void *v14 = &unk_189D37FA0;
      v14[1] = v15;
      *(void *)(v13 + 8) = v14;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    }

    else
    {
      sub_183C03D4C(a1, v8, v12);
    }

    sub_183BF9A5C(a1, v6, v13);
    if (v12 == a3) {
      uint64_t v8 = v12;
    }
    else {
      uint64_t v8 = v12 + 1;
    }
  }

  return a3;
}

unsigned __int8 *sub_183C0404C(uint64_t a1, char *a2, char *a3)
{
  int64x2_t result = (unsigned __int8 *)sub_183C040E0(a1, a2, a3);
  if (result == (unsigned __int8 *)a2)
  {
    uint64_t v7 = *(void *)(a1 + 56);
    int v8 = *(_DWORD *)(a1 + 28);
    uint64_t v9 = sub_183C04368(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
    int64x2_t result = (unsigned __int8 *)a2;
  }

  return result;
}

char *sub_183C040E0(uint64_t a1, char *a2, char *a3)
{
  BOOL v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v6 = *a2;
  if (v6 <= 91)
  {
    if (v6 != 36)
    {
      BOOL v8 = v6 == 40;
      uint64_t v7 = a2 + 1;
      BOOL v8 = !v8 || v7 == a3;
      if (!v8)
      {
        BOOL v8 = *v7 == 63;
        uint64_t v9 = a2 + 2;
        if (v8 && v9 != a3)
        {
          int v11 = *v9;
          if (v11 == 33)
          {
            sub_183BF8FD0(v23);
            __int128 v24 = 0u;
            uint64_t v26 = 0LL;
            __int128 v25 = 0u;
            LODWORD(v24) = *(_DWORD *)(a1 + 24);
            BOOL v12 = (char *)sub_183C039A8(v23, v3 + 3, a3);
            int v22 = DWORD1(v24);
            sub_183BFA384(a1, (uint64_t)v23, 1, *(_DWORD *)(a1 + 28));
            *(_DWORD *)(a1 + 28) += v22;
            if (v12 == a3 || *v12 != 41) {
              sub_183BFA408();
            }
            goto LABEL_31;
          }

          if (v11 == 61)
          {
            sub_183BF8FD0(v23);
            __int128 v24 = 0u;
            uint64_t v26 = 0LL;
            __int128 v25 = 0u;
            LODWORD(v24) = *(_DWORD *)(a1 + 24);
            BOOL v12 = (char *)sub_183C039A8(v23, v3 + 3, a3);
            int v13 = DWORD1(v24);
            sub_183BFA384(a1, (uint64_t)v23, 0, *(_DWORD *)(a1 + 28));
            *(_DWORD *)(a1 + 28) += v13;
            if (v12 == a3 || *v12 != 41) {
              sub_183BFA408();
            }
LABEL_31:
            BOOL v3 = v12 + 1;
            sub_183BF7C10((uint64_t)&v25);
            std::locale::~locale(v23);
            return v3;
          }
        }
      }

      return v3;
    }

    uint64_t v14 = operator new(0x18uLL);
    BOOL v15 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v17 = *(void *)(v16 + 8);
    char v18 = (char *)&unk_189D38080;
LABEL_21:
    void *v14 = v18 + 16;
    v14[1] = v17;
    *((_BYTE *)v14 + 16) = v15;
    *(void *)(v16 + 8) = v14;
    *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
    return ++v3;
  }

  if (v6 != 92)
  {
    if (v6 != 94) {
      return v3;
    }
    uint64_t v14 = operator new(0x18uLL);
    BOOL v15 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    uint64_t v16 = *(void *)(a1 + 56);
    uint64_t v17 = *(void *)(v16 + 8);
    char v18 = (char *)&unk_189D38038;
    goto LABEL_21;
  }

  if (a2 + 1 != a3)
  {
    int v20 = a2[1];
    if (v20 == 66)
    {
      char v21 = 1;
    }

    else
    {
      if (v20 != 98) {
        return v3;
      }
      char v21 = 0;
    }

    sub_183BFA310(a1, v21);
    v3 += 2;
  }

  return v3;
}

void sub_183C0433C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
}

unsigned __int8 *sub_183C04368(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  BOOL v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v6 = (char)*a2;
  if (v6 > 62)
  {
    if (v6 > 91)
    {
      if (v6 == 92) {
        return sub_183C04860(a1, a2, a3);
      }
      if (v6 != 123) {
        return sub_183BFBD44(a1, a2, a3);
      }
    }

    else
    {
      if (v6 == 91) {
        return (unsigned __int8 *)sub_183C04900(a1, (char *)a2, (char *)a3);
      }
      if (v6 != 63) {
        return sub_183BFBD44(a1, a2, a3);
      }
    }

unsigned __int8 *sub_183C04560( uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, int a5, int a6)
{
  if (a2 == a3) {
    return a2;
  }
  int v6 = a6;
  int v7 = a5;
  uint64_t v10 = a1;
  int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  int v12 = (char)*a2;
  if (v12 > 62)
  {
    if (v12 == 63)
    {
      int v13 = a2 + 1;
      if (v11) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v13 == a3;
      }
      if (!v20 && *v13 == 63)
      {
        int v13 = a2 + 2;
        uint64_t v14 = 0LL;
        uint64_t v18 = 1LL;
        goto LABEL_33;
      }

      uint64_t v14 = 0LL;
      uint64_t v18 = 1LL;
      goto LABEL_45;
    }

    if (v12 != 123) {
      return a2;
    }
    BOOL v15 = a2 + 1;
    uint64_t v16 = sub_183C00330(a1, a2 + 1, a3, &v28);
    if (v16 != v15)
    {
      if (v16 != a3)
      {
        int v17 = (char)*v16;
        if (v17 != 44)
        {
          if (v17 == 125)
          {
            int v13 = v16 + 1;
            if (!v11 && v13 != a3 && *v13 == 63)
            {
              int v13 = v16 + 2;
              uint64_t v14 = v28;
              a5 = v7;
              a6 = v6;
              a1 = v10;
              uint64_t v18 = v28;
LABEL_33:
              uint64_t v21 = a4;
              char v22 = 0;
LABEL_46:
              sub_183C001FC(a1, v14, v18, v21, a5, a6, v22);
              return v13;
            }

            uint64_t v14 = v28;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            uint64_t v18 = v28;
LABEL_45:
            uint64_t v21 = a4;
            char v22 = 1;
            goto LABEL_46;
          }

          goto LABEL_58;
        }

        unint64_t v23 = v16 + 1;
        if (v16 + 1 == a3) {
          goto LABEL_58;
        }
        if (*v23 == 125)
        {
          int v13 = v16 + 2;
          if (!v11 && v13 != a3 && *v13 == 63)
          {
            int v13 = v16 + 3;
            uint64_t v14 = v28;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            goto LABEL_26;
          }

          uint64_t v14 = v28;
          a5 = v7;
          a6 = v6;
          a1 = v10;
LABEL_36:
          uint64_t v18 = -1LL;
          goto LABEL_45;
        }

        int v27 = -1;
        __int128 v25 = sub_183C00330(v10, v23, a3, &v27);
        if (v25 != v23 && v25 != a3 && *v25 == 125)
        {
          uint64_t v18 = v27;
          uint64_t v14 = v28;
          if (v27 >= v28)
          {
            int v13 = v25 + 1;
            char v22 = 1;
            if (!v11 && v13 != a3)
            {
              int v26 = v25[1];
              char v22 = v26 != 63;
              if (v26 == 63) {
                int v13 = v25 + 2;
              }
            }

            a5 = v7;
            a6 = v6;
            a1 = v10;
            uint64_t v21 = a4;
            goto LABEL_46;
          }

          goto LABEL_58;
        }
      }

      sub_183C00418();
    }

unsigned __int8 *sub_183C04860(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3 || *a2 != 92) {
    return a2;
  }
  __int16 v5 = a2 + 1;
  if (a2 + 1 == a3) {
    sub_183BFBE3C();
  }
  int64x2_t result = sub_183C04A10(a1, a2 + 1, a3);
  if (result == v5)
  {
    int64x2_t result = (unsigned __int8 *)sub_183BFBF3C(a1, (char *)a2 + 1, (char *)a3);
    if (result == v5)
    {
      int64x2_t result = sub_183C04ACC(a1, a2 + 1, (char *)a3, 0LL);
      if (result == v5) {
        return a2;
      }
    }
  }

  return result;
}

char *sub_183C04900(uint64_t a1, char *a2, char *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3) {
      goto LABEL_20;
    }
    __int16 v5 = a2[1] == 94 ? a2 + 2 : a2 + 1;
    int v6 = (uint64_t *)sub_183BFCC8C(a1, a2[1] == 94);
    if (v5 == a3) {
      goto LABEL_20;
    }
    int v7 = v6;
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *v5 == 93)
    {
      sub_183BFCD04((uint64_t)v6, 93LL);
      ++v5;
    }

    if (v5 == a3) {
      goto LABEL_20;
    }
    do
    {
      uint64_t v8 = v5;
      __int16 v5 = sub_183C04D98(a1, v5, a3, v7);
    }

    while (v5 != v8);
    if (v8 == a3) {
      goto LABEL_20;
    }
    if (*v8 == 45)
    {
      sub_183BFCD04((uint64_t)v7, 45LL);
      ++v8;
    }

    if (v8 == a3 || *v8 != 93) {
LABEL_20:
    }
      sub_183BFE0DC();
    return v8 + 1;
  }

  return a2;
}

unsigned __int8 *sub_183C04A10(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (a2 == a3) {
    return a2;
  }
  int v4 = *a2;
  uint64_t v5 = (v4 - 48);
  if (v4 == 48)
  {
    sub_183BFC2E4(a1, v5);
    return a2 + 1;
  }

  int v6 = a3;
  int v7 = a2 + 1;
  if (a2 + 1 != a3)
  {
    while (1)
    {
      int v8 = *v7;
      ++v7;
      LODWORD(v5) = v8 + 10 * v5 - 48;
      if (v7 == a3) {
        goto LABEL_12;
      }
    }

    int v6 = v7;
LABEL_12:
    if (!(_DWORD)v5) {
      goto LABEL_16;
    }
  }

  if (v5 > *(_DWORD *)(a1 + 28)) {
LABEL_16:
  }
    sub_183BFC3C8();
  sub_183BFC414(a1, v5);
  return v6;
}

unsigned __int8 *sub_183C04ACC(uint64_t a1, unsigned __int8 *a2, char *a3, std::string *this)
{
  int v4 = a2;
  if (a2 != (unsigned __int8 *)a3)
  {
    int v5 = (char)*a2;
    if (v5 > 109)
    {
      char v6 = 0;
      switch(*a2)
      {
        case 'n':
          if (this)
          {
            int v7 = this;
            LOBYTE(v8) = 10;
            goto LABEL_50;
          }

          uint64_t v8 = 10LL;
          goto LABEL_59;
        case 'r':
          if (this)
          {
            int v7 = this;
            LOBYTE(v8) = 13;
            goto LABEL_50;
          }

          uint64_t v8 = 13LL;
          goto LABEL_59;
        case 't':
          if (this)
          {
            int v7 = this;
            LOBYTE(v8) = 9;
            goto LABEL_50;
          }

          uint64_t v8 = 9LL;
          goto LABEL_59;
        case 'u':
          int v9 = a2[1];
          if ((v9 & 0xF8) != 0x30 && (v9 & 0xFE) != 0x38 && (v9 | 0x20u) - 97 >= 6) {
            goto LABEL_64;
          }
          int v4 = a2 + 2;
          int v10 = *v4;
          char v11 = -48;
          if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38) {
            goto LABEL_24;
          }
          v10 |= 0x20u;
          char v11 = -87;
LABEL_24:
          char v6 = 16 * (v11 + v10);
LABEL_25:
          int v12 = v4[1];
          char v13 = -48;
          if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38) {
            goto LABEL_30;
          }
          v12 |= 0x20u;
          char v13 = -87;
LABEL_30:
          int v14 = v4[2];
          char v15 = -48;
          if ((v14 & 0xF8) == 0x30 || (v14 & 0xFE) == 0x38) {
            goto LABEL_35;
          }
          v14 |= 0x20u;
          char v15 = -87;
LABEL_35:
          if (this) {
            std::string::operator=(this, v15 + v14 + 16 * (v13 + v12 + v6));
          }
          else {
            sub_183BFC2E4(a1, (char)(v15 + v14 + 16 * (v13 + v12 + v6)));
          }
          v4 += 3;
          return v4;
        case 'v':
          if (this)
          {
            int v7 = this;
            LOBYTE(v8) = 11;
            goto LABEL_50;
          }

          uint64_t v8 = 11LL;
          break;
        case 'x':
          goto LABEL_25;
        default:
          goto LABEL_45;
      }

      goto LABEL_59;
    }

    if (v5 == 48)
    {
      if (this)
      {
        int v7 = this;
        LOBYTE(v8) = 0;
        goto LABEL_50;
      }

      uint64_t v8 = 0LL;
LABEL_59:
      sub_183BFC2E4(a1, v8);
      return ++v4;
    }

    if (v5 != 99)
    {
      if (v5 == 102)
      {
        if (this)
        {
          int v7 = this;
          LOBYTE(v8) = 12;
LABEL_50:
          std::string::operator=(v7, v8);
          return ++v4;
        }

        uint64_t v8 = 12LL;
        goto LABEL_59;
      }

LABEL_45:
      if (*a2 != 95
        && ((v5 & 0x80) != 0 || (*(_DWORD *)(*(void *)(*(void *)(a1 + 8) + 16LL) + 4LL * *a2) & 0x500) == 0))
      {
        uint64_t v8 = (char)v5;
        if (this)
        {
          int v7 = this;
          goto LABEL_50;
        }

        goto LABEL_59;
      }

LABEL_64:
      sub_183BFBE3C();
    }

    uint64_t v16 = a2[1] & 0x1F;
    if (this) {
      std::string::operator=(this, v16);
    }
    else {
      sub_183BFC2E4(a1, v16);
    }
    v4 += 2;
  }

  return v4;
}

_BYTE *sub_183C04D98(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  int v4 = a2;
  if (a2 == a3) {
    return v4;
  }
  int v5 = *a2;
  if (v5 == 93) {
    return v4;
  }
  uint64_t v6 = (uint64_t)a4;
  memset(&v26, 0, sizeof(v26));
  if (a2 + 1 == a3 || v5 != 91)
  {
LABEL_9:
    int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
    goto LABEL_10;
  }

  int v9 = a2[1];
  if (v9 != 46)
  {
    if (v9 == 58)
    {
      uint64_t v10 = sub_183C05320(a1, a2 + 2, a3, (uint64_t)a4);
      goto LABEL_34;
    }

    if (v9 == 61)
    {
      uint64_t v10 = sub_183C05144(a1, a2 + 2, a3, a4);
LABEL_34:
      uint64_t v6 = v10;
      char v20 = 0;
      goto LABEL_38;
    }

    goto LABEL_9;
  }

  uint64_t v18 = sub_183C053D8(a1, a2 + 2, a3, (uint64_t)&v26);
  int v4 = (_BYTE *)v18;
  int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  std::string::size_type size = v26.__r_.__value_.__s.__size_;
  if ((v26.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    std::string::size_type size = v26.__r_.__value_.__l.__size_;
  }
  int v14 = (char *)v18;
  if (!size)
  {
LABEL_10:
    if ((v11 | 0x40) == 0x40)
    {
      int v12 = *v4;
      if (v12 == 92)
      {
        char v13 = v4 + 1;
        if (v11)
        {
          int v14 = sub_183C055EC(a1, v13, a3, &v26);
        }

        else
        {
          int v14 = (char *)sub_183C054C4(a1, (unsigned __int8 *)v13, a3, &v26, v6);
          int v11 = 0;
        }

        goto LABEL_16;
      }
    }

    else
    {
      LOBYTE(v12) = *v4;
    }

    std::string::operator=(&v26, v12);
    int v14 = v4 + 1;
  }

LABEL_37:
    char v20 = 1;
    int v4 = v14;
    goto LABEL_38;
  }

  memset(&v25, 0, sizeof(v25));
  int v4 = v14 + 2;
  if (v14 + 2 != a3 && *v16 == 91 && *v4 == 46)
  {
    uint64_t v22 = sub_183C053D8(a1, v14 + 3, a3, (uint64_t)&v25);
LABEL_55:
    int v4 = (_BYTE *)v22;
    goto LABEL_56;
  }

  if ((v11 | 0x40) == 0x40)
  {
    LODWORD(v16) = *v16;
    if ((_DWORD)v16 == 92)
    {
      if (v11) {
        uint64_t v22 = (uint64_t)sub_183C055EC(a1, v14 + 2, a3, &v25);
      }
      else {
        uint64_t v22 = (uint64_t)sub_183C054C4(a1, (unsigned __int8 *)v14 + 2, a3, &v25, v6);
      }
      goto LABEL_55;
    }
  }

  else
  {
    LOBYTE(v16) = *v16;
  }

  std::string::operator=(&v25, (std::string::value_type)v16);
LABEL_56:
  std::string v24 = v26;
  memset(&v26, 0, sizeof(v26));
  std::string __p = v25;
  memset(&v25, 0, sizeof(v25));
  sub_183BFEB58(v6, (char *)&v24, (char *)&__p);
  char v20 = 1;
LABEL_38:
  if ((v20 & 1) != 0) {
    return v4;
  }
  return (_BYTE *)v6;
}

void sub_183C050E4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, void *a23, uint64_t a24, int a25, __int16 a26, char a27, char a28)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_183C05144(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_33;
  }
  for (uint64_t i = 0LL; a2[i] != 61 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i) {
      goto LABEL_33;
    }
  }

  if (&a2[i] == a3) {
LABEL_33:
  }
    sub_183BFE0DC();
  sub_183C057C4(a1, a2, &a2[i], &v17);
  if (((char)v17.__r_.__value_.__s.__size_ & 0x80000000) == 0)
  {
    std::string::size_type size = v17.__r_.__value_.__s.__size_;
    if (v17.__r_.__value_.__s.__size_)
    {
      int v9 = &v17;
      goto LABEL_14;
    }

void sub_183C052E8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_183C05320(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_11;
  }
  for (uint64_t i = 0LL; a2[i] != 58 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i) {
      goto LABEL_11;
    }
  }

  if (&a2[i] == a3) {
LABEL_11:
  }
    sub_183BFE0DC();
  int v7 = sub_183C05958(a1, a2, &a2[i], *(_BYTE *)(a1 + 24) & 1);
  if (!v7) {
    sub_183BFF870();
  }
  *(_DWORD *)(a4 + 160) |= v7;
  return (uint64_t)&a2[i + 2];
}

uint64_t sub_183C053D8(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_15;
  }
  for (uint64_t i = 0LL; a2[i] != 46 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i) {
      goto LABEL_15;
    }
  }

  if (&a2[i] == a3) {
LABEL_15:
  }
    sub_183BFE0DC();
  sub_183C057C4(a1, a2, &a2[i], &v10);
  *(_OWORD *)a4 = *(_OWORD *)&v10.__r_.__value_.__l.__data_;
  std::string::size_type cap = v10.__r_.__value_.__l.__cap_;
  *(void *)(a4 + 16) = v10.__r_.__value_.__l.__cap_;
  std::string::size_type v8 = HIBYTE(cap);
  if ((v8 & 0x80u) != 0LL) {
    std::string::size_type v8 = *(void *)(a4 + 8);
  }
  if (v8 - 1 >= 2) {
    sub_183BFF144();
  }
  return (uint64_t)&a2[i + 2];
}

unsigned __int8 *sub_183C054C4(uint64_t a1, unsigned __int8 *a2, char *a3, std::string *this, uint64_t a5)
{
  int v6 = (char)*a2;
  if (v6 > 97)
  {
    if (v6 > 114)
    {
      if (v6 != 115)
      {
        if (v6 != 119) {
          return sub_183C04ACC(a1, a2, a3, this);
        }
        *(_DWORD *)(a5 + 160) |= 0x500u;
        sub_183BFCD04(a5, 95LL);
        return a2 + 1;
      }

      int v8 = *(_DWORD *)(a5 + 160) | 0x4000;
    }

    else
    {
      if (v6 == 98)
      {
        std::string v10 = this;
        std::string::value_type v9 = 8;
LABEL_19:
        std::string::operator=(v10, v9);
        return a2 + 1;
      }

      if (v6 != 100) {
        return sub_183C04ACC(a1, a2, a3, this);
      }
      int v8 = *(_DWORD *)(a5 + 160) | 0x400;
    }

    *(_DWORD *)(a5 + 160) = v8;
    return a2 + 1;
  }

  if (v6 <= 82)
  {
    if (*a2)
    {
      if (v6 == 68)
      {
        int v7 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_21:
        *(_DWORD *)(a5 + 164) = v7;
        return a2 + 1;
      }

      return sub_183C04ACC(a1, a2, a3, this);
    }

    std::string::value_type v9 = 0;
    std::string v10 = this;
    goto LABEL_19;
  }

  if (v6 == 83)
  {
    int v7 = *(_DWORD *)(a5 + 164) | 0x4000;
    goto LABEL_21;
  }

  if (v6 == 87)
  {
    *(_DWORD *)(a5 + 164) |= 0x500u;
    sub_183BFF974(a5, 95LL);
    return a2 + 1;
  }

  return sub_183C04ACC(a1, a2, a3, this);
}

char *sub_183C055EC(uint64_t a1, char *a2, char *a3, std::string *this)
{
  if (a2 == a3) {
LABEL_52:
  }
    sub_183BFBE3C();
  uint64_t v5 = *a2;
  if ((int)v5 > 97)
  {
    switch((int)v5)
    {
      case 'n':
        if (this)
        {
          int v6 = this;
          LOBYTE(v5) = 10;
          goto LABEL_16;
        }

        uint64_t v5 = 10LL;
        goto LABEL_49;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_21;
      case 'r':
        if (this)
        {
          int v6 = this;
          LOBYTE(v5) = 13;
          goto LABEL_16;
        }

        uint64_t v5 = 13LL;
        goto LABEL_49;
      case 't':
        if (this)
        {
          int v6 = this;
          LOBYTE(v5) = 9;
          goto LABEL_16;
        }

        uint64_t v5 = 9LL;
        goto LABEL_49;
      case 'v':
        if (this)
        {
          int v6 = this;
          LOBYTE(v5) = 11;
          goto LABEL_16;
        }

        uint64_t v5 = 11LL;
        goto LABEL_49;
      default:
        if ((_DWORD)v5 == 98)
        {
          if (this)
          {
            int v6 = this;
            LOBYTE(v5) = 8;
            goto LABEL_16;
          }

          uint64_t v5 = 8LL;
        }

        else
        {
          if ((_DWORD)v5 != 102) {
            goto LABEL_21;
          }
          if (this)
          {
            int v6 = this;
            LOBYTE(v5) = 12;
            goto LABEL_16;
          }

          uint64_t v5 = 12LL;
        }

        break;
    }

    goto LABEL_49;
  }

  if ((int)v5 > 91)
  {
    if ((_DWORD)v5 != 92)
    {
      if ((_DWORD)v5 != 97) {
        goto LABEL_21;
      }
      if (this)
      {
        int v6 = this;
        LOBYTE(v5) = 7;
LABEL_16:
        std::string::operator=(v6, v5);
        return a2 + 1;
      }

      uint64_t v5 = 7LL;
LABEL_49:
      sub_183BFC2E4(a1, v5);
      return a2 + 1;
    }

void sub_183C057C4(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, std::string *a4@<X8>)
{
  a4->__r_.__value_.__r.__words[0] = 0LL;
  a4->__r_.__value_.__l.__size_ = 0LL;
  a4->__r_.__value_.__l.__cap_ = 0LL;
  if ((char)__s.__r_.__value_.__s.__size_ < 0)
  {
    if (!__s.__r_.__value_.__l.__size_) {
      goto LABEL_9;
    }
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }

  else
  {
    if (!__s.__r_.__value_.__s.__size_) {
      return;
    }
    p_s = &__s;
  }

  std::__get_collation_name(&v13, (const char *)p_s);
  *(_OWORD *)&a4->__r_.__value_.__l.__data_ = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
  std::string::size_type cap = v13.__r_.__value_.__l.__cap_;
  a4->__r_.__value_.__l.__cap_ = v13.__r_.__value_.__l.__cap_;
  std::string::size_type size = HIBYTE(cap);
  if ((size & 0x80u) != 0LL) {
    std::string::size_type size = a4->__r_.__value_.__l.__size_;
  }
  if (size) {
    goto LABEL_9;
  }
  if ((char)__s.__r_.__value_.__s.__size_ < 0)
  {
    std::string::size_type v9 = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3) {
      goto LABEL_9;
    }
    int v10 = (std::string *)__s.__r_.__value_.__r.__words[0];
  }

  else
  {
    std::string::size_type v9 = __s.__r_.__value_.__s.__size_;
    if (__s.__r_.__value_.__s.__size_ >= 3u) {
      return;
    }
    int v10 = &__s;
  }

  (*(void (**)(std::string *__return_ptr, void, std::string *, char *))(**(void **)(a1 + 16) + 32LL))( &v13,  *(void *)(a1 + 16),  v10,  (char *)v10 + v9);
  *a4 = v13;
  if (((char)a4->__r_.__value_.__s.__size_ & 0x80000000) == 0)
  {
    int v11 = a4->__r_.__value_.__s.__size_;
    if (v11 != 12 && v11 != 1)
    {
      a4->__r_.__value_.__s.__data_[0] = 0;
      a4->__r_.__value_.__s.__size_ = 0;
      goto LABEL_9;
    }

    goto LABEL_25;
  }

  std::string::size_type v12 = a4->__r_.__value_.__l.__size_;
  if (v12 == 1 || v12 == 12)
  {
LABEL_25:
    std::string::operator=(a4, &__s);
    goto LABEL_9;
  }

  *a4->__r_.__value_.__l.__data_ = 0;
  a4->__r_.__value_.__l.__size_ = 0LL;
LABEL_9:
}

void sub_183C05924( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_183C05958(uint64_t a1, char *a2, char *a3, BOOL a4)
{
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    std::string::value_type v7 = __p;
  }
  else {
    std::string::value_type v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a1 + 8) + 48LL))( *(void *)(a1 + 8),  v7,  (char *)v7 + v6);
  if ((v12 & 0x80u) == 0) {
    int v8 = __p;
  }
  else {
    int v8 = (void **)__p[0];
  }
  uint64_t classname = std::__get_classname((const char *)v8, a4);
  return classname;
}

void sub_183C059F4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

unsigned __int8 *sub_183C05A10(uint64_t a1, char *a2, char *a3)
{
  if (a2 == a3) {
    return (unsigned __int8 *)a2;
  }
  uint64_t v6 = *(void *)(a1 + 56);
  int v7 = *(_DWORD *)(a1 + 28);
  int v8 = (unsigned __int8 *)sub_183C05A98(a1, a2, a3);
  else {
    return sub_183C05BA4(a1, v8, (unsigned __int8 *)a3, v6, v7 + 1, *(_DWORD *)(a1 + 28) + 1);
  }
}

char *sub_183C05A98(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6 = sub_183C05D44(a1, a2, a3);
  int v7 = v6;
  if (v6 == a2 && v6 != a3)
  {
    if (a2 + 1 == a3 || *a2 != 92)
    {
      return a2;
    }

    else
    {
      int v8 = a2[1];
      if (v8 == 40)
      {
        uint64_t v9 = (uint64_t)(a2 + 2);
        sub_183BFBC38((void *)a1);
        int v10 = *(_DWORD *)(a1 + 28);
        do
        {
          int v11 = (char *)v9;
          uint64_t v9 = sub_183C05A10(a1, v9, a3);
        }

        while ((char *)v9 != v11);
        if (v11 == a3 || v11 + 1 == a3 || *v11 != 92 || v11[1] != 41) {
          sub_183BFA408();
        }
        int v7 = v11 + 2;
        sub_183BFBC9C((void *)a1, v10);
      }

      else
      {
        int v13 = sub_183C00E88(a1, v8);
        uint64_t v14 = 2LL;
        if (!v13) {
          uint64_t v14 = 0LL;
        }
        return &a2[v14];
      }
    }
  }

  return v7;
}

unsigned __int8 *sub_183C05BA4( uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, int a5, int a6)
{
  uint64_t v6 = a2;
  if (a2 != a3)
  {
    int v11 = *a2;
    if (v11 == 42)
    {
      sub_183C001FC(a1, 0LL, -1LL, a4, a5, a6, 1);
      return ++v6;
    }

    if (a2 + 1 != a3 && v11 == 92 && a2[1] == 123)
    {
      int v13 = a2 + 2;
      int v25 = 0;
      uint64_t v14 = sub_183C00330(a1, a2 + 2, a3, &v25);
      if (v14 == v13) {
        goto LABEL_16;
      }
      if (v14 != a3)
      {
        int v15 = v14 + 1;
        int v16 = *v14;
        if (v16 == 44)
        {
          int v24 = -1;
          uint64_t v17 = sub_183C00330(a1, v15, a3, &v24);
          if (v17 != a3 && v17 + 1 != a3 && *v17 == 92 && v17[1] == 125)
          {
            uint64_t v19 = v24;
            uint64_t v18 = v25;
            if (v24 == -1)
            {
              uint64_t v19 = -1LL;
            }

            else if (v24 < v25)
            {
LABEL_16:
              sub_183C003CC();
            }

            uint64_t v6 = &v17[2 * (v17[1] == 125)];
            int v20 = a5;
            int v21 = a6;
            uint64_t v22 = a1;
LABEL_23:
            sub_183C001FC(v22, v18, v19, a4, v20, v21, 1);
            return v6;
          }
        }

        else if (v15 != a3 && v16 == 92 && *v15 == 125)
        {
          uint64_t v6 = v14 + 2;
          uint64_t v18 = v25;
          int v20 = a5;
          int v21 = a6;
          uint64_t v22 = a1;
          uint64_t v19 = v25;
          goto LABEL_23;
        }
      }

      sub_183C00418();
    }
  }

  return v6;
}

char *sub_183C05D44(uint64_t a1, char *a2, char *a3)
{
  if (a2 == a3)
  {
    int64x2_t result = sub_183C00D48(a1, a2, a3);
    if (result != a2) {
      return result;
    }
    return sub_183C04900(a1, a2, a3);
  }

  int v6 = *a2;
  if ((a2 + 1 != a3 || v6 != 36)
    && ((v6 - 46) > 0x2E || ((1LL << (v6 - 46)) & 0x600000000001LL) == 0))
  {
    sub_183BFC2E4(a1, (char)v6);
    return a2 + 1;
  }

  int64x2_t result = sub_183C00D48(a1, a2, a3);
  if (result != a2) {
    return result;
  }
  if (*a2 != 46) {
    return sub_183C04900(a1, a2, a3);
  }
  uint64_t v9 = operator new(0x10uLL);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(v10 + 8);
  void *v9 = &unk_189D385A0;
  v9[1] = v11;
  *(void *)(v10 + 8) = v9;
  *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
  return a2 + 1;
}

unsigned __int8 *sub_183C05E4C(uint64_t a1, char *a2, char *a3)
{
  int v6 = sub_183C05EA8(a1, a2, a3);
  do
  {
    int v7 = v6;
    int v6 = sub_183C05EA8(a1, (char *)v6, a3);
  }

  while (v6 != v7);
  return v7;
}

unsigned __int8 *sub_183C05EA8(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  int v7 = *(_DWORD *)(a1 + 28);
  int v8 = sub_183C06038(a1, a2, a3);
  uint64_t v9 = (unsigned __int8 *)v8;
  if (v8 != a2 || v8 == a3) {
    goto LABEL_12;
  }
  int v10 = *a2;
  switch(v10)
  {
    case '$':
      uint64_t v11 = operator new(0x18uLL);
      BOOL v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = (char *)&unk_189D38080;
      goto LABEL_8;
    case '(':
      sub_183BFBC38((void *)a1);
      int v16 = *(_DWORD *)(a1 + 28);
      ++*(_DWORD *)(a1 + 36);
      uint64_t v17 = (char *)sub_183C03D4C(a1, a2 + 1, a3);
      if (v17 == a3 || (uint64_t v18 = v17, *v17 != 41)) {
        sub_183BFA408();
      }
      sub_183BFBC9C((void *)a1, v16);
      --*(_DWORD *)(a1 + 36);
      uint64_t v9 = (unsigned __int8 *)(v18 + 1);
LABEL_12:
      return (unsigned __int8 *)a2;
    case '^':
      uint64_t v11 = operator new(0x18uLL);
      BOOL v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = (char *)&unk_189D38038;
LABEL_8:
      uint64_t v15 = *(void *)(v13 + 8);
      *uint64_t v11 = v14 + 16;
      v11[1] = v15;
      *((_BYTE *)v11 + 16) = v12;
      *(void *)(v13 + 8) = v11;
      *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
      uint64_t v9 = (unsigned __int8 *)(a2 + 1);
      return sub_183C04560(a1, v9, (unsigned __int8 *)a3, v6, v7 + 1, *(_DWORD *)(a1 + 28) + 1);
  }

  return (unsigned __int8 *)a2;
}

char *sub_183C06038(uint64_t a1, char *a2, char *a3)
{
  int64x2_t result = sub_183C01188(a1, a2, a3);
  if (result == a2)
  {
    int64x2_t result = sub_183C060F0(a1, a2, a3);
    if (result == a2)
    {
      if (a2 == a3 || *a2 != 46)
      {
        return sub_183C04900(a1, a2, a3);
      }

      else
      {
        int v7 = operator new(0x10uLL);
        uint64_t v8 = *(void *)(a1 + 56);
        uint64_t v9 = *(void *)(v8 + 8);
        *int v7 = &unk_189D385A0;
        v7[1] = v9;
        *(void *)(v8 + 8) = v7;
        *(void *)(a1 + 56) = *(void *)(*(void *)(a1 + 56) + 8LL);
        return a2 + 1;
      }
    }
  }

  return result;
}

char *sub_183C060F0(uint64_t a1, char *a2, char *a3)
{
  BOOL v3 = a2;
  if (a2 == a3) {
    return v3;
  }
  int v4 = a2 + 1;
  if (v3 + 1 == a3 || *v3 != 92) {
    return v3;
  }
  int v5 = *v4;
  signed __int8 v6 = *v4;
  BOOL v7 = (v5 - 36) > 0x3A || ((1LL << (*v4 - 36)) & 0x5800000080004F1LL) == 0;
  if (!v7 || (v5 - 123) < 3)
  {
    sub_183BFC2E4(a1, v6);
    v3 += 2;
    return v3;
  }

  if ((*(_DWORD *)(a1 + 24) & 0x1F0) != 0x40)
  {
    int v9 = sub_183C00E88(a1, v6);
    uint64_t v10 = 2LL;
    if (!v9) {
      uint64_t v10 = 0LL;
    }
    v3 += v10;
    return v3;
  }

  return sub_183C055EC(a1, v4, a3, 0LL);
}

BOOL sub_183C061B4(const void **a1, void *__s1)
{
  size_t v2 = *((unsigned __int8 *)a1 + 23);
  int v3 = (char)v2;
  if ((v2 & 0x80u) != 0LL) {
    size_t v2 = (size_t)a1[1];
  }
  if ((*((char *)__s1 + 23) & 0x80000000) == 0)
  {
    size_t v4 = *((unsigned __int8 *)__s1 + 23);
    if (v2 >= v4) {
      goto LABEL_9;
    }
    return 0LL;
  }

  size_t v4 = __s1[1];
  if (v2 < v4) {
    return 0LL;
  }
  __s1 = (void *)*__s1;
LABEL_9:
  if (v3 >= 0) {
    signed __int8 v6 = a1;
  }
  else {
    signed __int8 v6 = *a1;
  }
  return memcmp(__s1, v6, v4) == 0;
}

uint64_t sub_183C06228(uint64_t *a1, uint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    unint64_t v9 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(v7 - *a1) >> 3);
    if (v9 + 1 > 0x222222222222222LL) {
      sub_183BF77E4();
    }
    unint64_t v10 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(v5 - *a1) >> 3);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= v9 + 1) {
      uint64_t v11 = v9 + 1;
    }
    if (v10 >= 0x111111111111111LL) {
      unint64_t v12 = 0x222222222222222LL;
    }
    else {
      unint64_t v12 = v11;
    }
    uint64_t v19 = v4;
    if (v12) {
      uint64_t v13 = (char *)sub_183C08B28(v4, v12);
    }
    else {
      uint64_t v13 = 0LL;
    }
    uint64_t v15 = v13;
    int v16 = &v13[120 * v9];
    uint64_t v18 = &v13[120 * v12];
    sub_183C06D58((uint64_t)v16, a2);
    uint64_t v17 = v16 + 120;
    sub_183C08AB4(a1, &v15);
    uint64_t v8 = a1[1];
    sub_183C08D2C(&v15);
  }

  else
  {
    sub_183C06D58(*(void *)(v4 - 8), a2);
    uint64_t v8 = v7 + 120;
    a1[1] = v7 + 120;
  }

  a1[1] = v8;
  return v8 - 120;
}

void sub_183C06338(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_183C0634C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  v98[2] = *MEMORY[0x1895F89C0];
  *(void *)((char *)v98 + 7) = 0LL;
  v98[0] = 0LL;
  *(void *)((char *)v97 + 7) = 0LL;
  v97[0] = 0LL;
  int v93 = 1;
  LOBYTE(v94) = 0;
  uint64_t v3 = *(unsigned __int8 *)(a1 + 23);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  if ((v3 & 0x80u) == 0LL) {
    uint64_t v6 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    uint64_t v6 = *(void *)(a1 + 8);
  }
  if ((v3 & 0x80u) == 0LL) {
    unint64_t v7 = (char *)a1;
  }
  else {
    unint64_t v7 = *(char **)a1;
  }
  uint64_t v8 = &v7[v6];
  if (v6 >= 2)
  {
    unint64_t v9 = v7;
    do
    {
      unint64_t v10 = (char *)memchr(v9, 32, v6 - 1);
      if (!v10) {
        break;
      }
      if (*(_WORD *)v10 == 8224) {
        goto LABEL_13;
      }
      unint64_t v9 = v10 + 1;
      uint64_t v6 = v8 - (_BYTE *)v9;
    }

    while (v8 - (_BYTE *)v9 > 1);
  }

  unint64_t v10 = v8;
LABEL_13:
  uint64_t v11 = v10 - v7;
  if (v10 == v8) {
    uint64_t v11 = -1LL;
  }
  if ((v3 & 0x80) != 0)
  {
    if (v11 == -1)
    {
      uint64_t v12 = v4 + v5;
      goto LABEL_20;
    }

    goto LABEL_19;
  }

  uint64_t v4 = a1;
  if (v11 != -1)
  {
LABEL_19:
    uint64_t v12 = v4 + v11;
    goto LABEL_20;
  }

  uint64_t v12 = a1 + v3;
LABEL_20:
  unsigned __int8 v13 = atomic_load((unsigned __int8 *)&qword_18C662E98);
  if ((v13 & 1) == 0 && __cxa_guard_acquire(&qword_18C662E98))
  {
    sub_183C03918((const std::locale *)&unk_18C662E58, "(-{1,2})?(.*?)([,= ]|$)", 0);
    __cxa_atexit((void (*)(void *))sub_183BF8F10, &unk_18C662E58, &dword_183BF4000);
    __cxa_guard_release(&qword_18C662E98);
  }

  else {
    uint64_t v14 = *(void *)a1;
  }
  uint64_t v58 = v12;
  sub_183C03818((uint64_t)v86, v14, v12, (uint64_t)&unk_18C662E58, 32);
  unsigned __int8 v62 = 0;
  std::string __p = 0LL;
  __int128 v61 = 0LL;
  unsigned __int8 v15 = 0;
  int v16 = 0;
  uint64_t v78 = 0LL;
  uint64_t v79 = 0LL;
  char v80 = 0;
  uint64_t v81 = 0LL;
  uint64_t v82 = 0LL;
  char v83 = 0;
  char v84 = 0;
  uint64_t v85 = 0LL;
  *(_OWORD *)&v76[32] = 0u;
  memset(v77, 0, 25);
  memset(v76, 0, 28);
  while (!sub_183C01494((uint64_t)v86, (uint64_t)v76))
  {
    unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * (((char *)v86[5] - (char *)v86[4]) >> 3);
    uint64_t v18 = (char *)v86[4] + 40;
    if (v17 <= 1) {
      uint64_t v18 = v89;
    }
    if (*v18)
    {
      uint64_t v19 = (uint64_t *)((char *)v86[4] + 24);
      if (v17 <= 1) {
        uint64_t v19 = &v87;
      }
      uint64_t v20 = *v19;
      int v21 = (char *)v86[4] + 32;
      if (v17 <= 1) {
        int v21 = &v88;
      }
      uint64_t v22 = *(void *)v21 - v20;
      unint64_t v23 = (char *)v86[4] + 64;
      if (v17 <= 2) {
        unint64_t v23 = v89;
      }
      if (v22 == 1)
      {
        if (*v23)
        {
          BOOL v24 = v17 > 2;
          if (v17 <= 2) {
            int v25 = (char **)&v87;
          }
          else {
            int v25 = (char **)((char *)v86[4] + 48);
          }
          std::string v26 = (char **)((char *)v86[4] + 56);
          if (!v24) {
            std::string v26 = (char **)&v88;
          }
          sub_183BFDE9C(&v74, *v25, *v26, *v26 - *v25);
        }

        else
        {
          memset(&v74, 0, sizeof(v74));
        }

        uint64_t v35 = std::string::insert(&v74, 0LL, "-");
        uint64_t v36 = (void *)v35->__r_.__value_.__r.__words[0];
        v96[0] = v35->__r_.__value_.__l.__size_;
        *(void *)((char *)v96 + 7) = *(std::string::size_type *)((char *)&v35->__r_.__value_.__r.__words[1] + 7);
        unsigned __int8 size = v35->__r_.__value_.__s.__size_;
        v35->__r_.__value_.__l.__size_ = 0LL;
        v35->__r_.__value_.__l.__cap_ = 0LL;
        v35->__r_.__value_.__r.__words[0] = 0LL;
        if ((v62 & 0x80) != 0) {
          operator delete(__p);
        }
        v98[0] = v96[0];
        *(void *)((char *)v98 + 7) = *(void *)((char *)v96 + 7);
        unsigned __int8 v62 = size;
        std::string __p = v36;
      }

      else
      {
        if (*v23)
        {
          BOOL v32 = v17 > 2;
          if (v17 <= 2) {
            unint64_t v33 = (char **)&v87;
          }
          else {
            unint64_t v33 = (char **)((char *)v86[4] + 48);
          }
          unint64_t v34 = (char **)((char *)v86[4] + 56);
          if (!v32) {
            unint64_t v34 = (char **)&v88;
          }
          sub_183BFDE9C(&v74, *v33, *v34, *v34 - *v33);
        }

        else
        {
          memset(&v74, 0, sizeof(v74));
        }

        char v38 = std::string::insert(&v74, 0LL, "--");
        uint64_t v39 = (void *)v38->__r_.__value_.__r.__words[0];
        v96[0] = v38->__r_.__value_.__l.__size_;
        *(void *)((char *)v96 + 7) = *(std::string::size_type *)((char *)&v38->__r_.__value_.__r.__words[1] + 7);
        unsigned __int8 v40 = v38->__r_.__value_.__s.__size_;
        v38->__r_.__value_.__l.__size_ = 0LL;
        v38->__r_.__value_.__l.__cap_ = 0LL;
        v38->__r_.__value_.__r.__words[0] = 0LL;
        if ((v15 & 0x80) != 0) {
          operator delete(v61);
        }
        v97[0] = v96[0];
        *(void *)((char *)v97 + 7) = *(void *)((char *)v96 + 7);
        __int128 v61 = v39;
        unsigned __int8 v15 = v40;
      }
    }

    else
    {
      int v27 = (char *)v86[4] + 64;
      if (v17 <= 2) {
        int v27 = v89;
      }
      if (*v27)
      {
        BOOL v28 = v17 > 2;
        if (v17 <= 2) {
          uint64_t v29 = &v87;
        }
        else {
          uint64_t v29 = (uint64_t *)((char *)v86[4] + 48);
        }
        uint64_t v30 = *v29;
        __int128 v31 = (char *)v86[4] + 56;
        if (!v28) {
          __int128 v31 = &v88;
        }
        if (*(void *)v31 - v30 > 0) {
          int v16 = 1;
        }
      }
    }

    unint64_t v41 = 0xAAAAAAAAAAAAAAABLL * (((char *)v86[5] - (char *)v86[4]) >> 3);
    uint64_t v42 = (char *)v86[4] + 88;
    if (v41 <= 3) {
      uint64_t v42 = v89;
    }
    if (!*v42) {
      break;
    }
    BOOL v43 = v41 > 3;
    if (v41 <= 3) {
      int v44 = &v87;
    }
    else {
      int v44 = (uint64_t *)((char *)v86[4] + 72);
    }
    uint64_t v45 = *v44;
    unint64_t v46 = (char *)v86[4] + 80;
    if (!v43) {
      unint64_t v46 = &v88;
    }
    if (*(void *)v46 == v45) {
      break;
    }
    sub_183C012D4((uint64_t)v86);
  }

  if (*(void *)&v76[32])
  {
    *(void *)&v76[40] = *(void *)&v76[32];
    operator delete(*(void **)&v76[32]);
  }

  if (v86[4])
  {
    v86[5] = v86[4];
    operator delete(v86[4]);
  }

  if (v16)
  {
    memset(v77, 0, 17);
    *(void *)&v77[24] = 0LL;
    uint64_t v78 = 0LL;
    LOBYTE(v79) = 0;
    char v80 = 0;
    uint64_t v81 = 0LL;
    memset(v76, 0, 41);
    int v47 = *(char *)(a1 + 23);
    if (v47 >= 0) {
      uint64_t v48 = a1;
    }
    else {
      uint64_t v48 = *(void *)a1;
    }
    if (v47 >= 0) {
      uint64_t v49 = *(unsigned __int8 *)(a1 + 23);
    }
    else {
      uint64_t v49 = *(void *)(a1 + 8);
    }
    sub_183C03918((const std::locale *)&v74, "\\[default: (.*)\\]", 1);
    v86[6] = 0LL;
    uint64_t v87 = 0LL;
    char v88 = 0;
    v89[0] = 0LL;
    v89[1] = 0LL;
    char v90 = 0;
    char v91 = 0;
    uint64_t v92 = 0LL;
    memset(v86, 0, 41);
    int v50 = sub_183C01654((uint64_t)&v74, v58, v48 + v49, (uint64_t)v86, 0);
    sub_183C0182C((uint64_t)v76, v58, v48 + v49, (uint64_t *)v86, 0);
    if (v86[0])
    {
      v86[1] = v86[0];
      operator delete(v86[0]);
    }

    uint64_t v51 = v75;
    if (v75)
    {
      p_shared_owners = (unint64_t *)&v75->__shared_owners_;
      do
        unint64_t v53 = __ldaxr(p_shared_owners);
      while (__stlxr(v53 - 1, p_shared_owners));
      if (!v53)
      {
        ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
        std::__shared_weak_count::__release_weak(v51);
      }
    }

    std::locale::~locale((std::locale *)&v74);
    __int128 v54 = *(void **)v76;
    if (!v50) {
      goto LABEL_125;
    }
    unint64_t v55 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&v76[8] - *(void *)v76) >> 3);
    if (v55 <= 1) {
      __int128 v56 = v76;
    }
    else {
      __int128 v56 = *(_BYTE **)v76;
    }
    if (v56[40])
    {
      if (v55 <= 1) {
        int v57 = (char **)v76;
      }
      else {
        int v57 = *(char ***)v76;
      }
      sub_183BFDE9C(v72, v57[3], v57[4], v57[4] - v57[3]);
    }

    else
    {
      v72[0] = 0LL;
      v72[1] = 0LL;
      unint64_t v73 = 0LL;
    }

    LODWORD(v86[0]) = 3;
    *(_OWORD *)&v86[1] = *(_OWORD *)v72;
    v86[3] = v73;
    v72[0] = 0LL;
    v72[1] = 0LL;
    unint64_t v73 = 0LL;
    if (v93 == 3)
    {
      if (SHIBYTE(v95) < 0) {
        operator delete((void *)v94);
      }
    }

    else
    {
      if (v93 != 4)
      {
        int v93 = 3;
LABEL_119:
        __int128 v94 = *(_OWORD *)&v86[1];
        uint64_t v95 = v86[3];
        memset(&v86[1], 0, 24);
LABEL_122:
        if (SHIBYTE(v73) < 0) {
          operator delete(v72[0]);
        }
        __int128 v54 = *(void **)v76;
LABEL_125:
        if (v54)
        {
          *(void *)&v76[8] = v54;
          operator delete(v54);
        }

        goto LABEL_127;
      }

      v74.__r_.__value_.__r.__words[0] = (std::string::size_type)&v94;
      sub_183C11DE0((void ***)&v74);
    }

    int v93 = (int)v86[0];
    switch(LODWORD(v86[0]))
    {
      case 1:
        LOBYTE(v94) = v86[1];
        break;
      case 2:
        *(void **)&__int128 v94 = v86[1];
        break;
      case 3:
        goto LABEL_119;
      case 4:
        __int128 v94 = *(_OWORD *)&v86[1];
        uint64_t v95 = v86[3];
        memset(&v86[1], 0, 24);
        v74.__r_.__value_.__r.__words[0] = (std::string::size_type)&v86[1];
        sub_183C11DE0((void ***)&v74);
        break;
      default:
        goto LABEL_122;
    }

    goto LABEL_122;
  }

LABEL_127:
  uint64_t v69 = __p;
  *(void *)uint64_t v70 = v98[0];
  *(void *)&v70[7] = *(void *)((char *)v98 + 7);
  unsigned __int8 v71 = v62;
  size_t v66 = v61;
  *(void *)int v67 = v97[0];
  *(void *)&v67[7] = *(void *)((char *)v97 + 7);
  unsigned __int8 v68 = v15;
  int v63 = v93;
  switch(v93)
  {
    case 1:
      LOBYTE(v64[0]) = v94;
      break;
    case 2:
      v64[0] = (void *)v94;
      break;
    case 3:
      *(_OWORD *)size_t v64 = v94;
      unint64_t v65 = v95;
      uint64_t v95 = 0LL;
      __int128 v94 = 0uLL;
      break;
    case 4:
      *(_OWORD *)size_t v64 = v94;
      unint64_t v65 = v95;
      uint64_t v95 = 0LL;
      __int128 v94 = 0uLL;
      break;
    default:
      break;
  }

  sub_183C08DA0(a2, (__int128 *)&v69, (__int128 *)&v66, v16, (uint64_t)&v63);
  if (v63 == 4)
  {
    v86[0] = v64;
    sub_183C11DE0((void ***)v86);
  }

  else if (v63 == 3 && SHIBYTE(v65) < 0)
  {
    operator delete(v64[0]);
  }

  if (v93 == 4)
  {
    v86[0] = &v94;
    sub_183C11DE0((void ***)v86);
  }

  else if (v93 == 3 && SHIBYTE(v95) < 0)
  {
    operator delete((void *)v94);
  }

void sub_183C06BA4(_Unwind_Exception *a1)
{
}

uint64_t sub_183C06CBC(uint64_t a1)
{
  *(void *)a1 = off_189D38670;
  int v2 = *(_DWORD *)(a1 + 32);
  if (v2 == 4)
  {
    uint64_t v4 = (void **)(a1 + 40);
    sub_183C11DE0(&v4);
  }

  else if (v2 == 3 && *(char *)(a1 + 63) < 0)
  {
    operator delete(*(void **)(a1 + 40));
  }

  return a1;
}

__n128 sub_183C06D58(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_189D38670;
  __int128 v2 = *(_OWORD *)(a2 + 8);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = v2;
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  *(void *)(a2 + 8) = 0LL;
  int v3 = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 32) = v3;
  int v4 = v3 - 1;
  uint64_t v5 = (_BYTE *)(a1 + 40);
  switch(v4)
  {
    case 0:
      *uint64_t v5 = *(_BYTE *)(a2 + 40);
      break;
    case 1:
      *(void *)uint64_t v5 = *(void *)(a2 + 40);
      break;
    case 2:
      __int128 v6 = *(_OWORD *)(a2 + 40);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(_OWORD *)uint64_t v5 = v6;
      *(void *)(a2 + 48) = 0LL;
      *(void *)(a2 + 56) = 0LL;
      *(void *)(a2 + 40) = 0LL;
      break;
    case 3:
      *(void *)uint64_t v5 = 0LL;
      *(void *)(a1 + 48) = 0LL;
      *(void *)(a1 + 56) = 0LL;
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a2 + 40) = 0LL;
      *(void *)(a2 + 48) = 0LL;
      *(void *)(a2 + 56) = 0LL;
      break;
    default:
      break;
  }

  *(void *)a1 = off_189D385E8;
  __int128 v7 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = v7;
  *(void *)(a2 + 72) = 0LL;
  *(void *)(a2 + 80) = 0LL;
  *(void *)(a2 + 64) = 0LL;
  __n128 result = *(__n128 *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(__n128 *)(a1 + 88) = result;
  *(void *)(a2 + 96) = 0LL;
  *(void *)(a2 + 104) = 0LL;
  *(void *)(a2 + 88) = 0LL;
  *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
  return result;
}

uint64_t sub_183C06E48@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, void *a3@<X8>)
{
  uint64_t result = a2();
  a3[1] = 0LL;
  a3[2] = 0LL;
  *a3 = 0LL;
  if ((_DWORD)result)
  {
    __int128 v6 = operator new(8uLL);
    *a3 = v6;
    *__int128 v6 = a1;
    uint64_t result = (uint64_t)(v6 + 1);
    a3[1] = result;
    a3[2] = result;
  }

  return result;
}

void sub_183C06E8C(uint64_t a1, void **a2)
{
  uint64_t v4 = (uint64_t)(a2 + 2);
  unint64_t v5 = (unint64_t)a2[2];
  __int128 v6 = a2[1];
  if ((unint64_t)v6 >= v5)
  {
    uint64_t v8 = ((char *)v6 - (_BYTE *)*a2) >> 3;
    uint64_t v9 = v5 - (void)*a2;
    uint64_t v10 = v9 >> 2;
    else {
      unint64_t v11 = v10;
    }
    if (v11) {
      uint64_t v12 = (char *)sub_183BF77F8(v4, v11);
    }
    else {
      uint64_t v12 = 0LL;
    }
    unsigned __int8 v13 = &v12[8 * v8];
    uint64_t v14 = &v12[8 * v11];
    *(void *)unsigned __int8 v13 = a1;
    __int128 v7 = v13 + 8;
    int v16 = (char *)*a2;
    unsigned __int8 v15 = (char *)a2[1];
    if (v15 != *a2)
    {
      do
      {
        uint64_t v17 = *((void *)v15 - 1);
        v15 -= 8;
        *((void *)v13 - 1) = v17;
        v13 -= 8;
      }

      while (v15 != v16);
      unsigned __int8 v15 = (char *)*a2;
    }

    *a2 = v13;
    a2[1] = v7;
    a2[2] = v14;
    if (v15) {
      operator delete(v15);
    }
  }

  else
  {
    *__int128 v6 = a1;
    __int128 v7 = v6 + 1;
  }

  a2[1] = v7;
}

BOOL sub_183C06F64(_DWORD *a1, void *a2, char **a3)
{
  (*(void (**)(uint64_t *__return_ptr))(*(void *)a1 + 64LL))(&v47);
  uint64_t v6 = v48;
  if (!(void)v48) {
    goto LABEL_66;
  }
  uint64_t v7 = a2[1];
  uint64_t v8 = *a2 + 16 * v47;
  uint64_t v9 = v8 + 16;
  if (v8 + 16 != v7)
  {
    uint64_t v10 = *a2 + 16 * v47;
    do
    {
      sub_183C07FEC(v10, (__int128 *)(v10 + 16));
      v8 += 16LL;
      uint64_t v11 = v10 + 32;
      v10 += 16LL;
    }

    while (v11 != v7);
    uint64_t v9 = a2[1];
  }

  while (v9 != v8)
    uint64_t v9 = sub_183BF7C10(v9 - 16);
  a2[1] = v8;
  uint64_t v12 = *a3;
  unsigned __int8 v13 = a3[1];
  if (*a3 != v13)
  {
    do
    {
      uint64_t v14 = (unsigned __int8 *)(*(uint64_t (**)(void))(**(void **)v12 + 24LL))(*(void *)v12);
      uint64_t v15 = (*(uint64_t (**)(_DWORD *))(*(void *)a1 + 24LL))(a1);
      uint64_t v16 = v14[23];
      if ((v16 & 0x80u) == 0LL) {
        uint64_t v17 = v14[23];
      }
      else {
        uint64_t v17 = *((void *)v14 + 1);
      }
      uint64_t v18 = *(unsigned __int8 *)(v15 + 23);
      int v19 = (char)v18;
      if ((v18 & 0x80u) != 0LL) {
        uint64_t v18 = *(void *)(v15 + 8);
      }
      if (v17 == v18)
      {
        if (v19 >= 0) {
          uint64_t v20 = (unsigned __int8 *)v15;
        }
        else {
          uint64_t v20 = *(unsigned __int8 **)v15;
        }
        if ((v16 & 0x80) != 0)
        {
        }

        else
        {
          if (!v14[23]) {
            goto LABEL_26;
          }
          while (*v14 == *v20)
          {
            ++v14;
            ++v20;
            if (!--v16) {
              goto LABEL_26;
            }
          }
        }
      }

      v12 += 16;
    }

    while (v12 != v13);
    uint64_t v12 = v13;
  }

LABEL_26:
  int v21 = a1[8];
  if (v21 == 4)
  {
    *(void *)unint64_t v41 = 0LL;
    uint64_t v42 = 0LL;
    uint64_t v43 = 0LL;
    uint64_t v24 = v48;
    int v25 = (int *)(v48 + 32);
    if (*(_DWORD *)(v48 + 32) == 4)
    {
      sub_183BF7048(v25, 4u);
      if (v41 != (int *)(v24 + 40)) {
        sub_183C0809C( (uint64_t)v41,  *(std::string **)(v24 + 40),  *(__int128 **)(v24 + 48),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v24 + 48) - *(void *)(v24 + 40)) >> 3));
      }
    }

    else if (*(_DWORD *)(v48 + 32) == 3)
    {
      sub_183BF7048(v25, 3u);
      uint64_t v42 = (__int128 *)sub_183BFF4B4((uint64_t *)v41, (__int128 *)(v24 + 40));
    }

    if (v12 == a3[1])
    {
      sub_183C07D68(a3, &v48);
      uint64_t v29 = v48;
      uint64_t v40 = 0LL;
      __int128 v39 = 0uLL;
      sub_183C11D5C((char *)&v39, *(__int128 **)v41, v42, 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v42 - *(void *)v41) >> 3));
      LODWORD(v44) = 4;
      *(_OWORD *)std::string __p = v39;
      uint64_t v46 = v40;
      __int128 v39 = 0uLL;
      uint64_t v40 = 0LL;
      sub_183C07EA8(v29, (int *)&v44);
      if ((_DWORD)v44 == 4)
      {
        uint64_t v49 = __p;
        sub_183C11DE0(&v49);
      }

      else if ((_DWORD)v44 == 3 && SHIBYTE(v46) < 0)
      {
        operator delete(__p[0]);
      }

      uint64_t v30 = (void **)&v39;
    }

    else
    {
      uint64_t v27 = *(void *)v12;
      if (*(_DWORD *)(*(void *)v12 + 32LL) == 4)
      {
        sub_183BF7048((int *)(*(void *)v12 + 32LL), 4u);
        sub_183C08424( (uint64_t *)v41,  *(std::string **)v41,  *(std::string **)(v27 + 40),  *(__int128 **)(v27 + 48),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v27 + 48) - *(void *)(v27 + 40)) >> 3));
        uint64_t v28 = *(void *)v12;
        uint64_t v38 = 0LL;
        __int128 v37 = 0uLL;
        sub_183C11D5C( (char *)&v37,  *(__int128 **)v41,  v42,  0xAAAAAAAAAAAAAAABLL * (((uint64_t)v42 - *(void *)v41) >> 3));
        LODWORD(v44) = 4;
        *(_OWORD *)std::string __p = v37;
        uint64_t v46 = v38;
        __int128 v37 = 0uLL;
        uint64_t v38 = 0LL;
        sub_183C07EA8(v28, (int *)&v44);
        if ((_DWORD)v44 == 4)
        {
          uint64_t v49 = __p;
          sub_183C11DE0(&v49);
        }

        else if ((_DWORD)v44 == 3 && SHIBYTE(v46) < 0)
        {
          operator delete(__p[0]);
        }

        uint64_t v30 = (void **)&v37;
      }

      else
      {
        uint64_t v36 = 0LL;
        __int128 v35 = 0uLL;
        sub_183C11D5C( (char *)&v35,  *(__int128 **)v41,  v42,  0xAAAAAAAAAAAAAAABLL * (((uint64_t)v42 - *(void *)v41) >> 3));
        LODWORD(v44) = 4;
        *(_OWORD *)std::string __p = v35;
        uint64_t v46 = v36;
        __int128 v35 = 0uLL;
        uint64_t v36 = 0LL;
        sub_183C07EA8(v27, (int *)&v44);
        if ((_DWORD)v44 == 4)
        {
          uint64_t v49 = __p;
          sub_183C11DE0(&v49);
        }

        else if ((_DWORD)v44 == 3 && SHIBYTE(v46) < 0)
        {
          operator delete(__p[0]);
        }

        uint64_t v30 = (void **)&v35;
      }
    }

    uint64_t v49 = v30;
    sub_183C11DE0(&v49);
    int v44 = v41;
    std::string v26 = (int *)&v44;
    goto LABEL_65;
  }

  if (v21 != 2)
  {
    sub_183C07D68(a3, &v48);
    goto LABEL_66;
  }

  if (v12 == a3[1])
  {
    sub_183C07D68(a3, &v48);
    uint64_t v22 = v48;
  }

  else
  {
    uint64_t v22 = *(void *)v12;
    if (*(_DWORD *)(*(void *)v12 + 32LL) == 2)
    {
      uint64_t v23 = sub_183BF535C(*(void *)v12 + 32LL) + 1;
      uint64_t v22 = *(void *)v12;
      LODWORD(v44) = 2;
      goto LABEL_37;
    }
  }

  LODWORD(v44) = 2;
  uint64_t v23 = 1LL;
LABEL_37:
  __p[0] = (void *)v23;
  sub_183C07EA8(v22, (int *)&v44);
  if ((_DWORD)v44 == 4)
  {
    *(void *)unint64_t v41 = __p;
    std::string v26 = v41;
LABEL_65:
    sub_183C11DE0((void ***)v26);
    goto LABEL_66;
  }

  if ((_DWORD)v44 == 3 && SHIBYTE(v46) < 0) {
    operator delete(__p[0]);
  }
LABEL_66:
  __int128 v31 = (std::__shared_weak_count *)*((void *)&v48 + 1);
  if (*((void *)&v48 + 1))
  {
    BOOL v32 = (unint64_t *)(*((void *)&v48 + 1) + 8LL);
    do
      unint64_t v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }

  return v6 != 0;
}

void sub_183C074D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20, uint64_t a21, uint64_t a22, void **a23)
{
  a23 = (void **)&a20;
  sub_183C11DE0(&a23);
  sub_183BF7C10(v23);
  _Unwind_Resume(a1);
}

uint64_t sub_183C07528(uint64_t a1)
{
  return a1 + 8;
}

BOOL sub_183C07530(uint64_t a1)
{
  return *(_DWORD *)(a1 + 32) != 0;
}

uint64_t sub_183C07540(uint64_t a1)
{
  unint64_t v2 = sub_183C07740((void *)a1);
  unint64_t v3 = ((v2 << 6) + (v2 >> 2) + sub_183C077E4((uint64_t)&v6, a1 + 64) + 2654435769u) ^ v2;
  unint64_t v4 = (sub_183C077E4((uint64_t)&v7, a1 + 88) + (v3 << 6) + (v3 >> 2) + 2654435769u) ^ v3;
  return (*(int *)(a1 + 112) + (v4 << 6) + (v4 >> 2) + 2654435769u) ^ v4;
}

void sub_183C075CC(void **__p)
{
  void *__p = off_189D38670;
  int v2 = *((_DWORD *)__p + 8);
  if (v2 == 4)
  {
    unint64_t v3 = __p + 5;
    sub_183C11DE0(&v3);
  }

  else if (v2 == 3 && *((char *)__p + 63) < 0)
  {
    operator delete(__p[5]);
  }

  operator delete(__p);
}

uint64_t sub_183C0766C@<X0>(uint64_t result@<X0>, uint64_t **a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  uint64_t v11 = result;
  if (v4 == v5) {
    goto LABEL_12;
  }
  while (1)
  {
    uint64_t result = sub_183C0894C(&v11, (uint64_t)v4);
    if ((result & 1) != 0) {
      break;
    }
    v4 += 2;
    if (v4 == v5)
    {
      unint64_t v4 = v5;
      break;
    }
  }

  if (v4 == a2[1])
  {
LABEL_12:
    *a3 = 0LL;
    a3[1] = 0LL;
    a3[2] = 0LL;
  }

  else
  {
    uint64_t v7 = ((char *)v4 - (char *)*a2) >> 4;
    uint64_t result = *v4;
    if (*v4
      && (uint64_t result = (uint64_t)__dynamic_cast( (const void *)result,  (const struct __class_type_info *)&unk_189D37E20,  (const struct __class_type_info *)&unk_189D38630,  0LL)) != 0)
    {
      uint64_t v8 = v4[1];
      if (v8)
      {
        uint64_t v9 = (unint64_t *)(v8 + 8);
        do
          unint64_t v10 = __ldxr(v9);
        while (__stxr(v10 + 1, v9));
      }
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    *a3 = v7;
    a3[1] = result;
    a3[2] = v8;
  }

  return result;
}

unint64_t sub_183C07740(void *a1)
{
  if (!a1) {
    __cxa_bad_typeid();
  }
  unint64_t v2 = *(void *)(*(void *)(*a1 - 8LL) + 8LL);
  if ((v2 & 0x8000000000000000LL) != 0)
  {
    unint64_t v3 = (unsigned __int8 *)(v2 & 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v4 = 5381LL;
    do
    {
      unint64_t v2 = v4;
      unsigned int v5 = *v3++;
      uint64_t v4 = (33 * v4) ^ v5;
    }

    while (v5);
  }

  unint64_t v6 = ((v2 << 6) + (v2 >> 2) + sub_183C077E4((uint64_t)&v8, (uint64_t)(a1 + 1)) + 2654435769u) ^ v2;
  return (sub_183C07C8C((uint64_t)&v9, (uint64_t)(a1 + 4)) + (v6 << 6) + (v6 >> 2) + 2654435769u) ^ v6;
}

unint64_t sub_183C077E4(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }

  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }

  return sub_183C07820((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t sub_183C07820(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69LL
          * (v6 ^ ((0x9DDFEA08EB382D69LL * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69LL * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69LL * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297LL * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      uint64_t v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0LL);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273LL * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273LL * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64LL;
      }

      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297LL
          * ((0x9DDFEA08EB382D69LL
            * (v21 ^ ((0x9DDFEA08EB382D69LL * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69LL * (v21 ^ ((0x9DDFEA08EB382D69LL * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69LL
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297LL
                  * ((0x9DDFEA08EB382D69LL
                    * (v20 ^ ((0x9DDFEA08EB382D69LL * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69LL * (v20 ^ ((0x9DDFEA08EB382D69LL * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69LL
           * ((0x9DDFEA08EB382D69LL * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69LL * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }

    else
    {
      return sub_183C07BCC(a2, a3);
    }
  }

  else if (a3 > 0x10)
  {
    return sub_183C07B20(a2, a3);
  }

  else
  {
    return sub_183C07A28(a2, a3);
  }

unint64_t sub_183C07A28(_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557LL * (a2 + 4LL * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }

    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69LL * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69LL
           * ((0x9DDFEA08EB382D69LL * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69LL * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }

  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69LL
          * ((0x9DDFEA08EB382D69LL
            * (v4 ^ ((0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69LL * (v4 ^ ((0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }

  return result;
}

unint64_t sub_183C07B20(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273LL * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557LL, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69LL * (v5 ^ (v4 - 0x3C5A37A36834CED9LL * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69LL
       * ((0x9DDFEA08EB382D69LL * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69LL * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t sub_183C07BCC(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9LL * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9LL * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127LL * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1LL
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9LL * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9LL * (v13 ^ (v13 >> 47))) >> 47));
}

unint64_t sub_183C07C8C(uint64_t a1, uint64_t a2)
{
  switch(*(_DWORD *)a2)
  {
    case 1:
      unint64_t i = *(unsigned __int8 *)(a2 + 8);
      break;
    case 2:
      unint64_t i = *(void *)(a2 + 8);
      break;
    case 3:
      unint64_t i = sub_183C077E4((uint64_t)&v6, a2 + 8);
      break;
    case 4:
      uint64_t v3 = *(void *)(a2 + 8);
      uint64_t v4 = *(void *)(a2 + 16);
      for (unint64_t i = 0xAAAAAAAAAAAAAAABLL * ((v4 - v3) >> 3); v3 != v4; v3 += 24LL)
        i ^= (i << 6) + (i >> 2) + sub_183C077E4((uint64_t)&v7, v3) + 2654435769u;
      break;
    default:
      unint64_t i = 0xD7C06285B9DE677ALL;
      break;
  }

  return i;
}

uint64_t sub_183C07D68(char **a1, __int128 *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  char v7 = *(char **)(result - 8);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v12 = (v7 - *a1) >> 4;
    unint64_t v13 = v12 + 1;
    uint64_t v14 = v5 - (void)*a1;
    if (v14 >> 3 > v13) {
      unint64_t v13 = v14 >> 3;
    }
    else {
      unint64_t v15 = v13;
    }
    uint64_t v31 = result;
    unint64_t v16 = (char *)sub_183BF7BDC(result, v15);
    uint64_t v18 = &v16[16 * v12];
    __int128 v19 = *a2;
    *(_OWORD *)uint64_t v18 = *a2;
    if (*((void *)&v19 + 1))
    {
      uint64_t v20 = (unint64_t *)(*((void *)&v19 + 1) + 8LL);
      do
        unint64_t v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }

    uint64_t v23 = *a1;
    uint64_t v22 = a1[1];
    if (v22 == *a1)
    {
      int64x2_t v26 = vdupq_n_s64((unint64_t)v22);
      unint64_t v24 = &v16[16 * v12];
    }

    else
    {
      unint64_t v24 = &v16[16 * v12];
      do
      {
        __int128 v25 = *((_OWORD *)v22 - 1);
        v22 -= 16;
        *((_OWORD *)v24 - 1) = v25;
        v24 -= 16;
        *(void *)uint64_t v22 = 0LL;
        *((void *)v22 + 1) = 0LL;
      }

      while (v22 != v23);
      int64x2_t v26 = *(int64x2_t *)a1;
    }

    uint64_t v11 = v18 + 16;
    *a1 = v24;
    a1[1] = v18 + 16;
    int64x2_t v29 = v26;
    uint64_t v27 = a1[2];
    a1[2] = &v16[16 * v17];
    uint64_t v30 = v27;
    uint64_t v28 = v26.i64[0];
    uint64_t result = sub_183C08050((uint64_t)&v28);
  }

  else
  {
    *(void *)char v7 = *(void *)a2;
    uint64_t v8 = *((void *)a2 + 1);
    *((void *)v7 + 1) = v8;
    if (v8)
    {
      uint64_t v9 = (unint64_t *)(v8 + 8);
      do
        unint64_t v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }

    uint64_t v11 = v7 + 16;
  }

  a1[1] = v11;
  return result;
}

__n128 sub_183C07EA8(uint64_t a1, int *a2)
{
  int v4 = *(_DWORD *)(a1 + 32);
  if (v4 == 4)
  {
    uint64_t v9 = (void **)(a1 + 40);
    sub_183C11DE0(&v9);
  }

  else if (v4 == 3 && *(char *)(a1 + 63) < 0)
  {
    operator delete(*(void **)(a1 + 40));
  }

  int v6 = *a2;
  *(_DWORD *)(a1 + 32) = *a2;
  int v7 = v6 - 1;
  uint64_t v8 = (_BYTE *)(a1 + 40);
  switch(v7)
  {
    case 0:
      *uint64_t v8 = *((_BYTE *)a2 + 8);
      break;
    case 1:
      *(void *)uint64_t v8 = *((void *)a2 + 1);
      break;
    case 2:
      __n128 result = *(__n128 *)(a2 + 2);
      *(void *)(a1 + 56) = *((void *)a2 + 3);
      *(__n128 *)uint64_t v8 = result;
      *((void *)a2 + 2) = 0LL;
      *((void *)a2 + 3) = 0LL;
      *((void *)a2 + 1) = 0LL;
      break;
    case 3:
      *(void *)uint64_t v8 = 0LL;
      *(void *)(a1 + 48) = 0LL;
      *(void *)(a1 + 56) = 0LL;
      __n128 result = *(__n128 *)(a2 + 2);
      *(__n128 *)(a1 + 40) = result;
      *(void *)(a1 + 56) = *((void *)a2 + 3);
      *((void *)a2 + 1) = 0LL;
      *((void *)a2 + 2) = 0LL;
      *((void *)a2 + 3) = 0LL;
      break;
    default:
      return result;
  }

  return result;
}

uint64_t sub_183C07F8C(uint64_t a1)
{
  if (*(_DWORD *)a1 == 4)
  {
    uint64_t v3 = (void **)(a1 + 8);
    sub_183C11DE0(&v3);
  }

  else if (*(_DWORD *)a1 == 3 && *(char *)(a1 + 31) < 0)
  {
    operator delete(*(void **)(a1 + 8));
  }

  return a1;
}

uint64_t sub_183C07FEC(uint64_t a1, __int128 *a2)
{
  __int128 v3 = *a2;
  *(void *)a2 = 0LL;
  *((void *)a2 + 1) = 0LL;
  int v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      unint64_t v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }

  return a1;
}

uint64_t sub_183C08050(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 16;
    sub_183BF7C10(i - 16);
  }

  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_183C0809C(uint64_t a1, std::string *__str, __int128 *a3, unint64_t a4)
{
  uint64_t v8 = a1 + 16;
  uint64_t v9 = *(std::string **)a1;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3) < a4)
  {
    sub_183C08210((uint64_t *)a1);
    if (a4 > 0xAAAAAAAAAAAAAAALL) {
      sub_183BF77E4();
    }
    unint64_t v10 = 0x5555555555555556LL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 3);
    if (v10 <= a4) {
      unint64_t v10 = a4;
    }
    else {
      unint64_t v11 = v10;
    }
    sub_183BFB0A0((void *)a1, v11);
    uint64_t v12 = sub_183C08248(v8, (__int128 *)__str, a3, *(char **)(a1 + 8));
    goto LABEL_11;
  }

  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 3) < a4)
  {
    unint64_t v13 = (std::string *)((char *)__str + 8 * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 3));
    sub_183C0837C(__str, v13, v9);
    uint64_t v12 = sub_183C08248(v8, (__int128 *)v13, a3, *(char **)(a1 + 8));
LABEL_11:
    *(void *)(a1 + 8) = v12;
    return;
  }

  sub_183C0837C(__str, (std::string *)a3, v9);
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)(a1 + 8);
  if (v16 != v14)
  {
    do
    {
      v16 -= 24LL;
    }

    while (v16 != v15);
  }

  *(void *)(a1 + 8) = v15;
}

void sub_183C08200(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_183C08208(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_183C08210(uint64_t *a1)
{
  if (*a1)
  {
    sub_183C083D8(a1);
    operator delete((void *)*a1);
    *a1 = 0LL;
    a1[1] = 0LL;
    a1[2] = 0LL;
  }

char *sub_183C08248(uint64_t a1, __int128 *a2, __int128 *a3, char *__dst)
{
  int v4 = __dst;
  unint64_t v11 = __dst;
  uint64_t v12 = __dst;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    unint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        sub_183BFF5D4(v4, *(void **)v6, *((void *)v6 + 1));
        int v4 = v12;
      }

      else
      {
        __int128 v7 = *v6;
        *((void *)v4 + 2) = *((void *)v6 + 2);
        *(_OWORD *)int v4 = v7;
      }

      unint64_t v6 = (__int128 *)((char *)v6 + 24);
      v4 += 24;
      uint64_t v12 = v4;
    }

    while (v6 != a3);
  }

  char v10 = 1;
  sub_183C08304((uint64_t)v9);
  return v4;
}

void sub_183C082F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_183C08304(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_183C08338(a1);
  }
  return a1;
}

void sub_183C08338(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    v1 -= 24LL;
  }

std::string *sub_183C0837C(std::string *__str, std::string *a2, std::string *this)
{
  int v4 = __str;
  if (__str != a2)
  {
    do
      std::string::operator=(this++, v4++);
    while (v4 != a2);
    return a2;
  }

  return (std::string *)v4;
}

void sub_183C083D8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24LL)
  {
  }

  a1[1] = v2;
}

std::string *sub_183C08424(uint64_t *a1, std::string *a2, std::string *a3, __int128 *a4, uint64_t a5)
{
  unint64_t v5 = a2;
  if (a5 >= 1)
  {
    uint64_t v11 = a1[2];
    uint64_t v9 = (uint64_t)(a1 + 2);
    uint64_t v10 = v11;
    unint64_t v12 = *(void *)(v9 - 8);
    if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v12) >> 3)) >= a5)
    {
      uint64_t v20 = v12 - (void)a2;
      if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - (void)a2) >> 3)) >= a5)
      {
        unint64_t v21 = (__int128 *)&a3[a5];
      }

      else
      {
        unint64_t v21 = (__int128 *)(&a3->__r_.__value_.__l.__data_ + ((uint64_t)(v12 - (void)a2) >> 3));
        a1[1] = (uint64_t)sub_183C08790(v9, v21, a4, *(char **)(v9 - 8));
        if (v20 < 1) {
          return v5;
        }
      }

      sub_183C085E4((uint64_t)a1, (uint64_t)v5, v12, (uint64_t)&v5[a5]);
      sub_183C0837C(a3, (std::string *)v21, v5);
    }

    else
    {
      uint64_t v13 = *a1;
      unint64_t v14 = a5 - 0x5555555555555555LL * ((uint64_t)(v12 - *a1) >> 3);
      if (v14 > 0xAAAAAAAAAAAAAAALL) {
        sub_183BF77E4();
      }
      unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)a2 - v13) >> 3);
      unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((v10 - v13) >> 3);
      uint64_t v17 = 2 * v16;
      if (2 * v16 <= v14) {
        uint64_t v17 = v14;
      }
      if (v16 >= 0x555555555555555LL) {
        unint64_t v18 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v18 = v17;
      }
      uint64_t v27 = v9;
      if (v18) {
        __int128 v19 = (char *)sub_183BFB0F0(v9, v18);
      }
      else {
        __int128 v19 = 0LL;
      }
      uint64_t v23 = v19;
      unint64_t v24 = &v19[24 * v15];
      __int128 v25 = v24;
      int64x2_t v26 = &v19[24 * v18];
      sub_183C08650(&v23, (__int128 *)a3, a5);
      unint64_t v5 = (std::string *)sub_183C086E0((uint64_t)a1, &v23, (__int128 *)v5);
      sub_183BFF7E8((uint64_t)&v23);
    }
  }

  return v5;
}

void sub_183C085C4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  *(void *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

uint64_t sub_183C085E4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = a2 + v6 - a4;
  uint64_t v8 = v6;
  if (v7 < a3)
  {
    unint64_t v9 = v7;
    uint64_t v8 = *(void *)(a1 + 8);
    do
    {
      __int128 v10 = *(_OWORD *)v9;
      *(void *)(v8 + 16) = *(void *)(v9 + 16);
      *(_OWORD *)uint64_t v8 = v10;
      v8 += 24LL;
      *(void *)(v9 + 8) = 0LL;
      *(void *)(v9 + 16) = 0LL;
      *(void *)unint64_t v9 = 0LL;
      v9 += 24LL;
    }

    while (v9 < a3);
  }

  *(void *)(a1 + 8) = v8;
  return sub_183C0884C((uint64_t)&v12, a2, v7, v6);
}

void *sub_183C08650(void *result, __int128 *a2, uint64_t a3)
{
  uint64_t v3 = result;
  uint64_t v4 = result[2];
  if (a3)
  {
    uint64_t v6 = v4 + 24 * a3;
    uint64_t v7 = 24 * a3;
    do
    {
      if (*((char *)a2 + 23) < 0)
      {
        __n128 result = sub_183BFF5D4((_BYTE *)v4, *(void **)a2, *((void *)a2 + 1));
      }

      else
      {
        __int128 v8 = *a2;
        *(void *)(v4 + 16) = *((void *)a2 + 2);
        *(_OWORD *)uint64_t v4 = v8;
      }

      v4 += 24LL;
      a2 = (__int128 *)((char *)a2 + 24);
      v7 -= 24LL;
    }

    while (v7);
    uint64_t v4 = v6;
  }

  _OWORD v3[2] = v4;
  return result;
}

void sub_183C086D8(_Unwind_Exception *a1)
{
  *(void *)(v1 + 16) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_183C086E0(uint64_t a1, void *a2, __int128 *a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = a1 + 16;
  sub_183BFF6D4(a1 + 16, (uint64_t)a3, (uint64_t)a3, *(void *)a1, *(void *)a1, v6, v6);
  a2[1] = v8;
  a2[2] = sub_183C088D0(v7, a3, *(__int128 **)(a1 + 8), a2[2]);
  uint64_t v9 = *(void *)a1;
  *(void *)a1 = a2[1];
  a2[1] = v9;
  uint64_t v10 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = a2[2];
  a2[2] = v10;
  uint64_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return v6;
}

char *sub_183C08790(uint64_t a1, __int128 *a2, __int128 *a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v11 = __dst;
  char v12 = __dst;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        sub_183BFF5D4(v4, *(void **)v6, *((void *)v6 + 1));
        uint64_t v4 = v12;
      }

      else
      {
        __int128 v7 = *v6;
        *((void *)v4 + 2) = *((void *)v6 + 2);
        *(_OWORD *)uint64_t v4 = v7;
      }

      uint64_t v6 = (__int128 *)((char *)v6 + 24);
      v4 += 24;
      char v12 = v4;
    }

    while (v6 != a3);
  }

  char v10 = 1;
  sub_183C08304((uint64_t)v9);
  return v4;
}

void sub_183C08838( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_183C0884C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 != a2)
  {
    uint64_t v6 = a3;
    do
    {
      uint64_t v7 = a4 - 24;
      __int128 v8 = *(_OWORD *)(v6 - 24);
      *(void *)(v7 + 16) = *(void *)(v6 - 8);
      *(_OWORD *)uint64_t v7 = v8;
      *(_BYTE *)(v6 - 1) = 0;
      *(_BYTE *)(v6 - 24) = 0;
      a4 = v7;
      v6 -= 24LL;
    }

    while (v6 != a2);
  }

  return a3;
}

uint64_t sub_183C088D0(uint64_t a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v9 = a4;
  v7[0] = a1;
  v7[1] = &v9;
  v7[2] = &v10;
  if (a2 != a3)
  {
    do
    {
      __int128 v5 = *a2;
      *(void *)(v4 + 16) = *((void *)a2 + 2);
      *(_OWORD *)uint64_t v4 = v5;
      v4 += 24LL;
      *((void *)a2 + 1) = 0LL;
      *((void *)a2 + 2) = 0LL;
      *(void *)a2 = 0LL;
      a2 = (__int128 *)((char *)a2 + 24);
    }

    while (a2 != a3);
    uint64_t v10 = v4;
  }

  char v8 = 1;
  sub_183C08304((uint64_t)v7);
  return v4;
}

BOOL sub_183C0894C(uint64_t *a1, uint64_t a2)
{
  if (!*(void *)a2) {
    return 0LL;
  }
  uint64_t v3 = *a1;
  uint64_t v4 = __dynamic_cast( *(const void **)a2,  (const struct __class_type_info *)&unk_189D37E20,  (const struct __class_type_info *)&unk_189D38630,  0LL);
  if (!v4) {
    return 0LL;
  }
  __int128 v5 = *(std::__shared_weak_count **)(a2 + 8);
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      unint64_t v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }

  uint64_t v8 = (*(uint64_t (**)(void *))(*(void *)v4 + 24LL))(v4);
  uint64_t v9 = *(unsigned __int8 *)(v3 + 31);
  if ((v9 & 0x80u) == 0LL) {
    uint64_t v10 = *(unsigned __int8 *)(v3 + 31);
  }
  else {
    uint64_t v10 = *(void *)(v3 + 16);
  }
  uint64_t v11 = *(unsigned __int8 *)(v8 + 23);
  int v12 = (char)v11;
  if ((v11 & 0x80u) != 0LL) {
    uint64_t v11 = *(void *)(v8 + 8);
  }
  if (v10 == v11)
  {
    uint64_t v13 = (const void **)(v3 + 8);
    if (v12 >= 0) {
      unint64_t v14 = (unsigned __int8 *)v8;
    }
    else {
      unint64_t v14 = *(unsigned __int8 **)v8;
    }
    if ((v9 & 0x80) != 0)
    {
      BOOL v22 = memcmp(*v13, v14, *(void *)(v3 + 16)) == 0;
      goto LABEL_28;
    }

    if (*(_BYTE *)(v3 + 31))
    {
      uint64_t v15 = v9 - 1;
      do
      {
        int v17 = *(unsigned __int8 *)v13;
        uint64_t v13 = (const void **)((char *)v13 + 1);
        int v16 = v17;
        int v19 = *v14++;
        int v18 = v19;
        BOOL v21 = v15-- != 0;
        BOOL v22 = v16 == v18;
      }

      while (v16 == v18 && v21);
LABEL_28:
      if (!v5) {
        return v22;
      }
      goto LABEL_29;
    }

    BOOL v22 = 1LL;
    if (!v5) {
      return v22;
    }
  }

  else
  {
    BOOL v22 = 0LL;
    if (!v5) {
      return v22;
    }
  }

void sub_183C08AA0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_183C08AB4(uint64_t *a1, void *a2)
{
  uint64_t result = sub_183C08B6C((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_183C08B28(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x222222222222223LL) {
    sub_183BF7310();
  }
  return operator new(120 * a2);
}

uint64_t sub_183C08B6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v15 = a6;
  *((void *)&v15 + 1) = a7;
  __int128 v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  char v13 = 0;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }

  else
  {
    uint64_t v9 = a3;
    do
    {
      v9 -= 120LL;
      sub_183C06D58(v7 - 120, v9);
      uint64_t v7 = *((void *)&v15 + 1) - 120LL;
      *((void *)&v15 + 1) -= 120LL;
    }

    while (v9 != a5);
    uint64_t v10 = v15;
  }

  char v13 = 1;
  sub_183C08C10((uint64_t)v12);
  return v10;
}

uint64_t sub_183C08C10(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_183C08C44((uint64_t *)a1);
  }
  return a1;
}

void sub_183C08C44(uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      sub_183C08C94(v3, v1);
      v1 += 120LL;
    }

    while (v1 != v2);
  }

void sub_183C08C94(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = off_189D38670;
  int v3 = *(_DWORD *)(a2 + 32);
  if (v3 == 4)
  {
    uint64_t v4 = (void **)(a2 + 40);
    sub_183C11DE0(&v4);
  }

  else if (v3 == 3 && *(char *)(a2 + 63) < 0)
  {
    operator delete(*(void **)(a2 + 40));
  }

void **sub_183C08D2C(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_183C08D5C(void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 120;
    sub_183C08C94(v4, i - 120);
  }

uint64_t sub_183C08DA0(uint64_t a1, __int128 *a2, __int128 *a3, int a4, uint64_t a5)
{
  else {
    uint64_t v10 = *((unsigned __int8 *)a3 + 23);
  }
  if (v10) {
    uint64_t v11 = a3;
  }
  else {
    uint64_t v11 = a2;
  }
  if (*((char *)v11 + 23) < 0)
  {
    sub_183BFF5D4(__dst, *(void **)v11, *((void *)v11 + 1));
  }

  else
  {
    *(_OWORD *)std::string __dst = *v11;
    uint64_t v22 = *((void *)v11 + 2);
  }

  int v18 = *(_DWORD *)a5;
  switch(v18)
  {
    case 1:
      LOBYTE(__p[0]) = *(_BYTE *)(a5 + 8);
      break;
    case 2:
      __p[0] = *(void **)(a5 + 8);
      break;
    case 3:
      *(_OWORD *)std::string __p = *(_OWORD *)(a5 + 8);
      uint64_t v20 = *(void *)(a5 + 24);
      goto LABEL_15;
    case 4:
      *(_OWORD *)std::string __p = *(_OWORD *)(a5 + 8);
      uint64_t v20 = *(void *)(a5 + 24);
LABEL_15:
      *(void *)(a5 + 16) = 0LL;
      *(void *)(a5 + 24) = 0LL;
      *(void *)(a5 + 8) = 0LL;
      break;
    default:
      break;
  }

  sub_183C08FE8(a1, (__n128 *)__dst, &v18);
  if (v18 == 4)
  {
    __int128 v15 = __p;
    sub_183C11DE0(&v15);
  }

  else if (v18 == 3 && SHIBYTE(v20) < 0)
  {
    operator delete(__p[0]);
  }

  if (SHIBYTE(v22) < 0) {
    operator delete(__dst[0]);
  }
  *(void *)a1 = off_189D385E8;
  __int128 v12 = *a2;
  *(void *)(a1 + 80) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 64) = v12;
  *((void *)a2 + 1) = 0LL;
  *((void *)a2 + 2) = 0LL;
  *(void *)a2 = 0LL;
  __int128 v13 = *a3;
  *(void *)(a1 + 104) = *((void *)a3 + 2);
  *(_OWORD *)(a1 + 88) = v13;
  *((void *)a3 + 1) = 0LL;
  *((void *)a3 + 2) = 0LL;
  *(void *)a3 = 0LL;
  *(_DWORD *)(a1 + 112) = a4;
  if (a4)
  {
    if (*(_DWORD *)a5 == 1)
    {
      sub_183BF7048((int *)a5, 1u);
      if (!*(_BYTE *)(a5 + 8))
      {
        LODWORD(v15) = 0;
        sub_183C07EA8(a1, (int *)&v15);
        if ((_DWORD)v15 == 4)
        {
          uint64_t v23 = &v16;
          sub_183C11DE0(&v23);
        }

        else if ((_DWORD)v15 == 3 && v17 < 0)
        {
          operator delete(v16);
        }
      }
    }
  }

  return a1;
}

void sub_183C08FB4(_Unwind_Exception *a1)
{
}

__n128 sub_183C08FE8(uint64_t a1, __n128 *a2, int *a3)
{
  *(void *)a1 = off_189D38670;
  __n128 result = *a2;
  *(void *)(a1 + 24) = a2[1].n128_u64[0];
  *(__n128 *)(a1 + 8) = result;
  a2->n128_u64[1] = 0LL;
  a2[1].n128_u64[0] = 0LL;
  a2->n128_u64[0] = 0LL;
  int v4 = *a3;
  *(_DWORD *)(a1 + 32) = *a3;
  int v5 = v4 - 1;
  uint64_t v6 = (_BYTE *)(a1 + 40);
  switch(v5)
  {
    case 0:
      *uint64_t v6 = *((_BYTE *)a3 + 8);
      break;
    case 1:
      *(void *)uint64_t v6 = *((void *)a3 + 1);
      break;
    case 2:
      __n128 result = *(__n128 *)(a3 + 2);
      *(void *)(a1 + 56) = *((void *)a3 + 3);
      *(__n128 *)uint64_t v6 = result;
      *((void *)a3 + 2) = 0LL;
      *((void *)a3 + 3) = 0LL;
      *((void *)a3 + 1) = 0LL;
      break;
    case 3:
      *(void *)uint64_t v6 = 0LL;
      *(void *)(a1 + 48) = 0LL;
      *(void *)(a1 + 56) = 0LL;
      __n128 result = *(__n128 *)(a3 + 2);
      *(__n128 *)(a1 + 40) = result;
      *(void *)(a1 + 56) = *((void *)a3 + 3);
      *((void *)a3 + 1) = 0LL;
      *((void *)a3 + 2) = 0LL;
      *((void *)a3 + 3) = 0LL;
      break;
    default:
      return result;
  }

  return result;
}

uint64_t sub_183C09094(uint64_t a1)
{
  *(void *)a1 = off_189D38670;
  int v2 = *(_DWORD *)(a1 + 32);
  if (v2 == 4)
  {
    int v4 = (void **)(a1 + 40);
    sub_183C11DE0(&v4);
  }

  else if (v2 == 3 && *(char *)(a1 + 63) < 0)
  {
    operator delete(*(void **)(a1 + 40));
  }

  return a1;
}

void sub_183C09110(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&qword_18C662EE0);
  if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_18C662EE0))
  {
    sub_183C03918((const std::locale *)&unk_18C662EA0, "(?:\\s*)([\\[\\]\\(\\)\\|]|\\.\\.\\.)", 0);
    __cxa_atexit((void (*)(void *))sub_183BF8F10, &unk_18C662EA0, &dword_183BF4000);
    __cxa_guard_release(&qword_18C662EE0);
  }

  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&qword_18C662F28);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_18C662F28))
  {
    sub_183C03918((const std::locale *)&unk_18C662EE8, "(?:\\s*)(\\S*<.*?>|[^<>\\s]+)", 0);
    __cxa_atexit((void (*)(void *))sub_183BF8F10, &unk_18C662EE8, &dword_183BF4000);
    __cxa_guard_release(&qword_18C662F28);
  }

  int64x2_t v26 = 0LL;
  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  uint64_t v6 = *(unsigned __int8 *)(a1 + 23);
  if ((v6 & 0x80u) == 0LL) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = *(void *)a1;
  }
  if ((v6 & 0x80u) != 0LL) {
    uint64_t v6 = *(void *)(a1 + 8);
  }
  sub_183C03818((uint64_t)v23, v7, v7 + v6, (uint64_t)&unk_18C662EA0, 0);
  uint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  char v17 = 0;
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  char v20 = 0;
  char v21 = 0;
  uint64_t v22 = 0LL;
  *(_OWORD *)std::string __p = 0u;
  memset(v14, 0, sizeof(v14));
  memset(v11, 0, sizeof(v11));
  int v12 = 0;
  sub_183C098A4((uint64_t)v23, (uint64_t)v11, (uint64_t *)&v26);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  if (v24)
  {
    __int128 v25 = v24;
    operator delete(v24);
  }

  __int128 v9 = 0uLL;
  uint64_t v10 = 0LL;
  sub_183C11D5C((char *)&v9, v26, v27, 0xAAAAAAAAAAAAAAABLL * (((char *)v27 - (char *)v26) >> 3));
  *(_OWORD *)a2 = v9;
  uint64_t v8 = v10;
  uint64_t v10 = 0LL;
  __int128 v9 = 0uLL;
  *(void *)(a2 + 16) = v8;
  *(void *)(a2 + 24) = 0LL;
  *(_BYTE *)(a2 + 32) = 0;
  int64x2_t v29 = (__int128 **)&v9;
  sub_183C11DE0((void ***)&v29);
  int64x2_t v29 = &v26;
  sub_183C11DE0((void ***)&v29);
}

void sub_183C09304( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, void *a35, uint64_t a36)
{
}

void sub_183C0936C(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  sub_183C09D80(a1, a2, (uint64_t)&v49);
  uint64_t v6 = sub_183C0ABC0(a1);
  int v7 = *((char *)v6 + 23);
  if (v7 < 0)
  {
    if (v6[1] != 1)
    {
LABEL_8:
      *(_OWORD *)a3 = v49;
      *(void *)(a3 + 16) = v50;
      uint64_t v50 = 0LL;
      __int128 v49 = 0uLL;
      goto LABEL_56;
    }

    uint64_t v6 = (uint64_t *)*v6;
  }

  else if (v7 != 1)
  {
    goto LABEL_8;
  }

  if (*(_BYTE *)v6 != 124) {
    goto LABEL_8;
  }
  int64x2_t v47 = 0uLL;
  v48[0] = 0LL;
  sub_183C0AC6C(&v49, &v54);
  uint64_t v8 = (v47.i64[1] - v47.i64[0]) >> 4;
  unint64_t v9 = (v48[0] - v47.i64[0]) >> 3;
  if (v9 <= v8 + 1) {
    unint64_t v9 = v8 + 1;
  }
  if (v48[0] - v47.i64[0] >= 0x7FFFFFFFFFFFFFF0uLL) {
    unint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v10 = v9;
  }
  unint64_t v53 = v48;
  uint64_t v11 = (char *)sub_183BF7BDC((uint64_t)v48, v10);
  __int128 v13 = &v11[16 * v8];
  *(_OWORD *)__int128 v13 = v54;
  __int128 v14 = (void *)v47.i64[1];
  uint64_t v15 = (void *)v47.i64[0];
  if (v47.i64[1] == v47.i64[0])
  {
    int64x2_t v18 = vdupq_n_s64(v47.u64[1]);
    uint64_t v16 = &v11[16 * v8];
  }

  else
  {
    uint64_t v16 = &v11[16 * v8];
    do
    {
      __int128 v17 = *((_OWORD *)v14 - 1);
      v14 -= 2;
      *((_OWORD *)v16 - 1) = v17;
      v16 -= 16;
      void *v14 = 0LL;
      v14[1] = 0LL;
    }

    while (v14 != v15);
    int64x2_t v18 = v47;
  }

  uint64_t v19 = v13 + 16;
  v47.i64[0] = (uint64_t)v16;
  *(int64x2_t *)&v51[8] = v18;
  uint64_t v20 = v48[0];
  v48[0] = &v11[16 * v12];
  uint64_t v52 = v20;
  *(void *)uint64_t v51 = v18.i64[0];
  sub_183C08050((uint64_t)v51);
  for (v47.i64[1] = (uint64_t)v19; ; v47.i64[1] = (uint64_t)v24)
  {
    char v21 = sub_183C0ABC0(a1);
    int v22 = *((char *)v21 + 23);
    if (v22 < 0)
    {
      if (v21[1] != 1) {
        break;
      }
      char v21 = (uint64_t *)*v21;
    }

    else if (v22 != 1)
    {
      break;
    }

    if (*(_BYTE *)v21 != 124) {
      break;
    }
    sub_183C0ACC8(a1, &__p);
    if (v46 < 0) {
      operator delete((void *)__p.n128_u64[0]);
    }
    sub_183C09D80(a1, a2, (uint64_t)v51);
    sub_183BF7D78((void **)&v49);
    __int128 v49 = *(_OWORD *)v51;
    uint64_t v50 = *(void *)&v51[16];
    memset(v51, 0, sizeof(v51));
    *(void *)&__int128 v54 = v51;
    sub_183BF7C68((void ***)&v54);
    sub_183C0AC6C(&v49, &v54);
    uint64_t v23 = v47.i64[1];
    if (v47.i64[1] >= v48[0])
    {
      uint64_t v25 = (v47.i64[1] - v47.i64[0]) >> 4;
      unint64_t v26 = (v48[0] - v47.i64[0]) >> 3;
      if (v26 <= v25 + 1) {
        unint64_t v26 = v25 + 1;
      }
      if (v48[0] - v47.i64[0] >= 0x7FFFFFFFFFFFFFF0uLL) {
        unint64_t v27 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v27 = v26;
      }
      unint64_t v53 = v48;
      uint64_t v28 = (char *)sub_183BF7BDC((uint64_t)v48, v27);
      uint64_t v30 = &v28[16 * v25];
      *(_OWORD *)uint64_t v30 = v54;
      uint64_t v31 = (void *)v47.i64[1];
      uint64_t v32 = (void *)v47.i64[0];
      if (v47.i64[1] == v47.i64[0])
      {
        int64x2_t v35 = vdupq_n_s64(v47.u64[1]);
        uint64_t v33 = &v28[16 * v25];
      }

      else
      {
        uint64_t v33 = &v28[16 * v25];
        do
        {
          __int128 v34 = *((_OWORD *)v31 - 1);
          v31 -= 2;
          *((_OWORD *)v33 - 1) = v34;
          v33 -= 16;
          void *v31 = 0LL;
          v31[1] = 0LL;
        }

        while (v31 != v32);
        int64x2_t v35 = v47;
      }

      unint64_t v24 = v30 + 16;
      v47.i64[0] = (uint64_t)v33;
      v47.i64[1] = (uint64_t)(v30 + 16);
      *(int64x2_t *)&v51[8] = v35;
      uint64_t v36 = v48[0];
      v48[0] = &v28[16 * v29];
      uint64_t v52 = v36;
      *(void *)uint64_t v51 = v35.i64[0];
      sub_183C08050((uint64_t)v51);
    }

    else
    {
      *(_OWORD *)v47.i64[1] = v54;
      unint64_t v24 = (_OWORD *)(v23 + 16);
    }
  }

  uint64_t v37 = v47.i64[0];
  if (v47.i64[1] - v47.i64[0] == 16)
  {
    uint64_t v39 = *(void *)v47.i64[0];
    unint64_t v38 = *(std::__shared_weak_count **)(v47.i64[0] + 8);
    *(void *)&__int128 v54 = *(void *)v47.i64[0];
    *((void *)&v54 + 1) = v38;
    *(void *)v47.i64[0] = 0LL;
    *(void *)(v37 + 8) = 0LL;
  }

  else
  {
    sub_183C0ED24((__int128 *)v47.i8, v51);
    unint64_t v38 = *(std::__shared_weak_count **)&v51[8];
    uint64_t v39 = *(void *)v51;
    __int128 v54 = *(_OWORD *)v51;
  }

  *(void *)a3 = 0LL;
  *(void *)(a3 + 8) = 0LL;
  *(void *)(a3 + 16) = 0LL;
  *(void *)uint64_t v51 = a3;
  v51[8] = 0;
  unint64_t v40 = operator new(0x10uLL);
  *(void *)a3 = v40;
  *(void *)(a3 + 8) = v40;
  unint64_t v41 = v40 + 2;
  *(void *)(a3 + 16) = v40 + 2;
  void *v40 = v39;
  v40[1] = v38;
  if (v38)
  {
    p_shared_owners = (unint64_t *)&v38->__shared_owners_;
    do
      unint64_t v43 = __ldxr(p_shared_owners);
    while (__stxr(v43 + 1, p_shared_owners));
    *(void *)(a3 + 8) = v41;
    do
      unint64_t v44 = __ldaxr(p_shared_owners);
    while (__stlxr(v44 - 1, p_shared_owners));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }

  else
  {
    *(void *)(a3 + 8) = v41;
  }

  *(void *)uint64_t v51 = &v47;
  sub_183BF7C68((void ***)v51);
LABEL_56:
  *(void *)uint64_t v51 = &v49;
  sub_183BF7C68((void ***)v51);
}

void sub_183C0977C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  *(void *)(v17 - 112) = &a13;
  sub_183BF7C68((void ***)(v17 - 112));
  a13 = (void **)&a17;
  sub_183BF7C68(&a13);
  _Unwind_Resume(a1);
}

void sub_183C097F0(void *a1@<X0>, std::string *a2@<X8>)
{
  unint64_t v3 = a1[3];
  unsigned __int8 v4 = (char *)a1[1];
  if (v3 >= 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v4[-*a1] >> 3))
  {
    a2->__r_.__value_.__r.__words[0] = 0LL;
    a2->__r_.__value_.__l.__size_ = 0LL;
    a2->__r_.__value_.__l.__cap_ = 0LL;
  }

  else
  {
    unsigned __int8 v5 = (char *)(*a1 + 24 * v3);
    sub_183C11CAC(__p, " ");
    sub_183BF6D2C(v5, v4, (uint64_t)__p, a2);
    if (v7 < 0) {
      operator delete(__p[0]);
    }
  }

void sub_183C09888( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_183C098A4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3 = a3;
  char v7 = a3;
  if (!sub_183C01494(a1, a2))
  {
    do
    {
      sub_183C09914(&v7, (uint64_t *)(a1 + 32));
      sub_183C012D4(a1);
    }

    while (!sub_183C01494(a1, a2));
    return v7;
  }

  return v3;
}

void sub_183C09914(uint64_t **a1, uint64_t *a2)
{
  if (*((_BYTE *)a2 + 64))
  {
    sub_183C03818((uint64_t)v35, a2[6], a2[7], (uint64_t)&unk_18C662EE8, 0);
    uint64_t v27 = 0LL;
    uint64_t v28 = 0LL;
    char v29 = 0;
    uint64_t v30 = 0LL;
    uint64_t v31 = 0LL;
    char v32 = 0;
    char v33 = 0;
    uint64_t v34 = 0LL;
    *(_OWORD *)__n128 __p = 0u;
    memset(v26, 0, sizeof(v26));
    memset(v23, 0, sizeof(v23));
    int v24 = 0;
    sub_183C09B68((uint64_t)v35, (uint64_t)v23, *a1);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }

    if (v36)
    {
      uint64_t v37 = v36;
      operator delete(v36);
    }
  }

  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3);
  BOOL v5 = v4 > 1;
  if (v4 <= 1) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = (uint64_t *)*a2;
  }
  if (v5) {
    uint64_t v7 = *a2 + 24;
  }
  else {
    uint64_t v7 = (uint64_t)(a2 + 3);
  }
  if (*(_BYTE *)(v7 + 16))
  {
    uint64_t v8 = *a1;
    sub_183BFDE9C(v21, (char *)v6[3], *(char **)(v7 + 8), *(void *)(v7 + 8) - v6[3]);
    unint64_t v9 = v8[1];
    unint64_t v10 = v8[2];
    if (v9 >= v10)
    {
      unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - *v8) >> 3);
      unint64_t v13 = v12 + 1;
      if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
        sub_183BF77E4();
      }
      unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - *v8) >> 3);
      if (2 * v14 > v13) {
        unint64_t v13 = 2 * v14;
      }
      if (v14 >= 0x555555555555555LL) {
        unint64_t v15 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v15 = v13;
      }
      v38[4] = v8 + 2;
      if (v15) {
        uint64_t v16 = (char *)sub_183BFB0F0((uint64_t)(v8 + 2), v15);
      }
      else {
        uint64_t v16 = 0LL;
      }
      uint64_t v17 = &v16[24 * v12];
      v38[0] = v16;
      v38[1] = v17;
      v38[3] = &v16[24 * v15];
      __int128 v18 = *(_OWORD *)v21;
      *((void *)v17 + 2) = v22;
      *(_OWORD *)uint64_t v17 = v18;
      v21[1] = 0LL;
      uint64_t v22 = 0LL;
      v21[0] = 0LL;
      v38[2] = v17 + 24;
      sub_183BFF660(v8, v38);
      uint64_t v19 = v8[1];
      sub_183BFF7E8((uint64_t)v38);
      int v20 = SHIBYTE(v22);
      v8[1] = v19;
      if (v20 < 0) {
        operator delete(v21[0]);
      }
    }

    else
    {
      __int128 v11 = *(_OWORD *)v21;
      *(void *)(v9 + 16) = v22;
      *(_OWORD *)unint64_t v9 = v11;
      v8[1] = v9 + 24;
    }
  }

void sub_183C09B18( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t *sub_183C09B68(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3 = a3;
  uint64_t v7 = a3;
  if (!sub_183C01494(a1, a2))
  {
    do
    {
      sub_183C09BD8(&v7, (void *)(a1 + 32));
      sub_183C012D4(a1);
    }

    while (!sub_183C01494(a1, a2));
    return v7;
  }

  return v3;
}

void sub_183C09BD8(uint64_t **a1, void *a2)
{
  int v2 = *a1;
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2[1] - *a2) >> 3);
  BOOL v4 = v3 > 1;
  if (v3 <= 1) {
    BOOL v5 = a2;
  }
  else {
    BOOL v5 = (void *)*a2;
  }
  if (v4) {
    uint64_t v6 = *a2 + 24LL;
  }
  else {
    uint64_t v6 = (uint64_t)(a2 + 3);
  }
  if (*(_BYTE *)(v6 + 16))
  {
    sub_183BFDE9C(__p, (char *)v5[3], *(char **)(v6 + 8), *(void *)(v6 + 8) - v5[3]);
  }

  else
  {
    __p[0] = 0LL;
    __p[1] = 0LL;
    uint64_t v20 = 0LL;
  }

  unint64_t v7 = v2[2];
  unint64_t v8 = v2[1];
  if (v8 >= v7)
  {
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - *v2) >> 3);
    unint64_t v11 = v10 + 1;
    if (v10 + 1 > 0xAAAAAAAAAAAAAAALL) {
      sub_183BF77E4();
    }
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - *v2) >> 3);
    if (2 * v12 > v11) {
      unint64_t v11 = 2 * v12;
    }
    if (v12 >= 0x555555555555555LL) {
      unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v13 = v11;
    }
    v21[4] = v2 + 2;
    if (v13) {
      unint64_t v14 = (char *)sub_183BFB0F0((uint64_t)(v2 + 2), v13);
    }
    else {
      unint64_t v14 = 0LL;
    }
    unint64_t v15 = &v14[24 * v10];
    v21[0] = v14;
    v21[1] = v15;
    v21[3] = &v14[24 * v13];
    __int128 v16 = *(_OWORD *)__p;
    *((void *)v15 + 2) = v20;
    *(_OWORD *)unint64_t v15 = v16;
    __p[1] = 0LL;
    uint64_t v20 = 0LL;
    __p[0] = 0LL;
    v21[2] = v15 + 24;
    sub_183BFF660(v2, v21);
    uint64_t v17 = v2[1];
    sub_183BFF7E8((uint64_t)v21);
    int v18 = SHIBYTE(v20);
    v2[1] = v17;
    if (v18 < 0) {
      operator delete(__p[0]);
    }
  }

  else
  {
    __int128 v9 = *(_OWORD *)__p;
    *(void *)(v8 + 16) = v20;
    *(_OWORD *)unint64_t v8 = v9;
    v2[1] = v8 + 24;
  }

void sub_183C09D54( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_183C09D80(void *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = 0LL;
  *(void *)(a3 + 8) = 0LL;
  *(void *)(a3 + 16) = 0LL;
  if (a1[3] < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a1[1] - *a1) >> 3))
  {
    uint64_t v148 = a3 + 16;
    uint64_t v6 = MEMORY[0x1895F8770];
    do
    {
      unint64_t v7 = sub_183C0ABC0(a1);
      int v8 = *((char *)v7 + 23);
      if (v8 < 0)
      {
        if (v7[1] != 1) {
          goto LABEL_13;
        }
        int v10 = *(unsigned __int8 *)*v7;
        if (v10 == 41 || v10 == 93) {
          return;
        }
        int v9 = *(unsigned __int8 *)*v7;
      }

      else
      {
        if (v8 != 1) {
          goto LABEL_13;
        }
        int v9 = *(unsigned __int8 *)v7;
        if (v9 == 41 || v9 == 93) {
          return;
        }
      }

      if (v9 == 124) {
        return;
      }
LABEL_13:
      unint64_t v11 = sub_183C0ABC0(a1);
      unint64_t v12 = v11;
      v152[0] = 0LL;
      __int128 v151 = 0uLL;
      int v13 = *((unsigned __int8 *)v11 + 23);
      if ((v13 & 0x80) != 0)
      {
        uint64_t v15 = v11[1];
        if (v15 == 1)
        {
          int v26 = *(unsigned __int8 *)*v11;
          if (v26 == 40)
          {
LABEL_57:
            __n128 v31 = sub_183C0ACC8(a1, &__p);
            if (v158 < 0) {
              operator delete((void *)__p.n128_u64[0]);
            }
            sub_183C0936C(v156, a1, a2, v31);
            sub_183C0ACC8(a1, &v154);
            if (v155 < 0)
            {
              if (v154.n128_u64[1] != 1) {
                goto LABEL_222;
              }
              char v32 = (__n128 *)v154.n128_u64[0];
            }

            else
            {
              if (v155 != 1) {
                goto LABEL_222;
              }
              char v32 = &v154;
            }

            if (v32->n128_u8[0] != 41)
            {
LABEL_222:
              exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              std::runtime_error::runtime_error(exception, "Mismatched '('");
              exception->__vftable = (std::runtime_error_vtbl *)&unk_189D38C30;
              __cxa_throw( exception,  (struct type_info *)&unk_189D37D60,  (void (*)(void *))std::runtime_error::~runtime_error);
            }

            sub_183C0CAB8(v156, &v153);
            __int128 v48 = (_OWORD *)*((void *)&v151 + 1);
            if (*((void *)&v151 + 1) < v152[0]) {
              goto LABEL_102;
            }
            uint64_t v61 = (uint64_t)(*((void *)&v151 + 1) - v151) >> 4;
            unint64_t v62 = v61 + 1;
            uint64_t v63 = v152[0] - v151;
            else {
              unint64_t v64 = v62;
            }
            uint64_t v161 = v152;
            unint64_t v65 = (char *)sub_183BF7BDC((uint64_t)v152, v64);
            int v67 = &v65[16 * v61];
            *(_OWORD *)int v67 = v153;
            __int128 v153 = 0uLL;
            unsigned __int8 v68 = (void *)*((void *)&v151 + 1);
            uint64_t v69 = (void *)v151;
            if (*((void *)&v151 + 1) == (void)v151)
            {
              int64x2_t v72 = vdupq_n_s64(*((unint64_t *)&v151 + 1));
              uint64_t v70 = &v65[16 * v61];
            }

            else
            {
              uint64_t v70 = &v65[16 * v61];
              do
              {
                __int128 v71 = *((_OWORD *)v68 - 1);
                v68 -= 2;
                *((_OWORD *)v70 - 1) = v71;
                v70 -= 16;
                void *v68 = 0LL;
                v68[1] = 0LL;
              }

              while (v68 != v69);
              int64x2_t v72 = (int64x2_t)v151;
            }

            uint64_t v119 = v67 + 16;
            *(void *)&__int128 v151 = v70;
            *((void *)&v151 + 1) = v67 + 16;
            *(int64x2_t *)&__s1[8] = v72;
            uint64_t v120 = v152[0];
            v152[0] = &v65[16 * v66];
            uint64_t v160 = v120;
            *(void *)__s1 = v72.i64[0];
            sub_183C08050((uint64_t)__s1);
            unint64_t v116 = (std::__shared_weak_count *)*((void *)&v153 + 1);
            *((void *)&v151 + 1) = v119;
            if (*((void *)&v153 + 1))
            {
              unsigned __int8 v121 = (unint64_t *)(*((void *)&v153 + 1) + 8LL);
              do
                unint64_t v118 = __ldaxr(v121);
              while (__stlxr(v118 - 1, v121));
              goto LABEL_181;
            }

LABEL_183:
            if (v155 < 0) {
              operator delete((void *)v154.n128_u64[0]);
            }
            *(void *)__s1 = v156;
            p_p = (void ***)__s1;
            goto LABEL_186;
          }

          if (v26 == 91) {
            goto LABEL_39;
          }
        }

        if (v15 != 7) {
          goto LABEL_31;
        }
        unint64_t v14 = (int *)*v11;
      }

      else
      {
        if (v13 == 1)
        {
          int v23 = *(unsigned __int8 *)v11;
          if (v23 == 40) {
            goto LABEL_57;
          }
          if (v23 == 91)
          {
LABEL_39:
            __n128 v27 = sub_183C0ACC8(a1, &__p);
            if (v158 < 0) {
              operator delete((void *)__p.n128_u64[0]);
            }
            sub_183C0936C(v156, a1, a2, v27);
            sub_183C0ACC8(a1, &v154);
            if (v155 < 0)
            {
              if (v154.n128_u64[1] != 1) {
                goto LABEL_221;
              }
              uint64_t v28 = (__n128 *)v154.n128_u64[0];
            }

            else
            {
              if (v155 != 1) {
                goto LABEL_221;
              }
              uint64_t v28 = &v154;
            }

            if (v28->n128_u8[0] != 93)
            {
LABEL_221:
              v146 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              std::runtime_error::runtime_error(v146, "Mismatched '['");
              v146->__vftable = (std::runtime_error_vtbl *)&unk_189D38C30;
              __cxa_throw( v146,  (struct type_info *)&unk_189D37D60,  (void (*)(void *))std::runtime_error::~runtime_error);
            }

            sub_183C0C904(v156, &v153);
            __int128 v48 = (_OWORD *)*((void *)&v151 + 1);
            if (*((void *)&v151 + 1) >= v152[0])
            {
              uint64_t v49 = (uint64_t)(*((void *)&v151 + 1) - v151) >> 4;
              unint64_t v50 = v49 + 1;
              uint64_t v51 = v152[0] - v151;
              else {
                unint64_t v52 = v50;
              }
              uint64_t v161 = v152;
              unint64_t v53 = (char *)sub_183BF7BDC((uint64_t)v152, v52);
              uint64_t v55 = &v53[16 * v49];
              *(_OWORD *)uint64_t v55 = v153;
              __int128 v153 = 0uLL;
              __int128 v56 = (void *)*((void *)&v151 + 1);
              int v57 = (void *)v151;
              if (*((void *)&v151 + 1) == (void)v151)
              {
                int64x2_t v60 = vdupq_n_s64(*((unint64_t *)&v151 + 1));
                uint64_t v58 = &v53[16 * v49];
              }

              else
              {
                uint64_t v58 = &v53[16 * v49];
                do
                {
                  __int128 v59 = *((_OWORD *)v56 - 1);
                  v56 -= 2;
                  *((_OWORD *)v58 - 1) = v59;
                  v58 -= 16;
                  void *v56 = 0LL;
                  v56[1] = 0LL;
                }

                while (v56 != v57);
                int64x2_t v60 = (int64x2_t)v151;
              }

              int v114 = v55 + 16;
              *(void *)&__int128 v151 = v58;
              *((void *)&v151 + 1) = v55 + 16;
              *(int64x2_t *)&__s1[8] = v60;
              uint64_t v115 = v152[0];
              v152[0] = &v53[16 * v54];
              uint64_t v160 = v115;
              *(void *)__s1 = v60.i64[0];
              sub_183C08050((uint64_t)__s1);
              unint64_t v116 = (std::__shared_weak_count *)*((void *)&v153 + 1);
              *((void *)&v151 + 1) = v114;
              if (*((void *)&v153 + 1))
              {
                uint64_t v117 = (unint64_t *)(*((void *)&v153 + 1) + 8LL);
                do
                  unint64_t v118 = __ldaxr(v117);
                while (__stlxr(v118 - 1, v117));
LABEL_181:
                if (!v118)
                {
                  ((void (*)(std::__shared_weak_count *))v116->__on_zero_shared)(v116);
                  std::__shared_weak_count::__release_weak(v116);
                }
              }

              goto LABEL_183;
            }

LABEL_102:
            _OWORD *v48 = v153;
            *((void *)&v151 + 1) = v48 + 1;
            goto LABEL_183;
          }

LABEL_31:
          sub_183C11CAC(__s1, "--");
          if (sub_183C061B4((const void **)v12, __s1))
          {
            int v24 = *((char *)v12 + 23);
            if (v24 < 0)
            {
              if (v12[1] != 2) {
                goto LABEL_47;
              }
              uint64_t v25 = (unsigned __int16 *)*v12;
            }

            else
            {
              uint64_t v25 = (unsigned __int16 *)v12;
              if (v24 != 2)
              {
LABEL_47:
                BOOL v29 = 1;
                goto LABEL_48;
              }
            }

            BOOL v29 = *v25 != 11565;
LABEL_48:
            if ((__s1[23] & 0x80000000) != 0)
            {
              operator delete(*(void **)__s1);
              if (v29)
              {
LABEL_50:
                sub_183C0AD28((uint64_t)a1, a2, (char **)__s1);
                goto LABEL_83;
              }
            }

            else if (v29)
            {
              goto LABEL_50;
            }
          }

          else if ((__s1[23] & 0x80000000) != 0)
          {
            operator delete(*(void **)__s1);
          }

          sub_183C11CAC(__s1, "-");
          if (sub_183C061B4((const void **)v12, __s1))
          {
            if (*((char *)v12 + 23) < 0)
            {
              uint64_t v33 = v12[1];
              if (v33 != 1 || *(_BYTE *)*v12 != 45)
              {
                if (v33 != 2) {
                  goto LABEL_77;
                }
                uint64_t v30 = (unsigned __int16 *)*v12;
                goto LABEL_65;
              }
            }

            else
            {
              if (*((_BYTE *)v12 + 23) != 1)
              {
                uint64_t v30 = (unsigned __int16 *)v12;
                if (*((_BYTE *)v12 + 23) != 2)
                {
LABEL_77:
                  BOOL v34 = 1;
                  goto LABEL_78;
                }

LABEL_65:
                BOOL v34 = *v30 != 11565;
LABEL_78:
                if ((__s1[23] & 0x80000000) != 0)
                {
                  operator delete(*(void **)__s1);
                  if (v34)
                  {
LABEL_82:
                    sub_183C0BCE8((uint64_t)a1, a2, (char **)__s1);
LABEL_83:
                    sub_183BF7D78((void **)&v151);
                    __int128 v151 = *(_OWORD *)__s1;
                    v152[0] = *(void *)&__s1[16];
                    memset(__s1, 0, sizeof(__s1));
                    __p.n128_u64[0] = (unint64_t)__s1;
                    p_p = (void ***)&__p;
LABEL_186:
                    sub_183BF7C68(p_p);
                    goto LABEL_187;
                  }
                }

                else if (v34)
                {
                  goto LABEL_82;
                }

LABEL_116:
                if (*((char *)v12 + 23) < 0)
                {
                  uint64_t v75 = v12[1];
                  if (v75)
                  {
                    std::string v74 = (char *)*v12;
                    unint64_t v73 = (char *)*v12;
                    if (*(_BYTE *)*v12 != 60) {
                      goto LABEL_125;
                    }
                    goto LABEL_122;
                  }

LABEL_142:
                  sub_183C0ACC8(a1, &__p);
                  sub_183C0DFEC((uint64_t)&__p, v156);
                  uint64_t v79 = (_OWORD *)*((void *)&v151 + 1);
                  if (*((void *)&v151 + 1) >= v152[0])
                  {
                    uint64_t v92 = (uint64_t)(*((void *)&v151 + 1) - v151) >> 4;
                    unint64_t v93 = v92 + 1;
                    uint64_t v94 = v152[0] - v151;
                    else {
                      unint64_t v95 = v93;
                    }
                    uint64_t v161 = v152;
                    BOOL v96 = (char *)sub_183BF7BDC((uint64_t)v152, v95);
                    v98 = &v96[16 * v92];
                    *(_OWORD *)v98 = v156[0];
                    v156[0] = 0uLL;
                    int v99 = (void *)*((void *)&v151 + 1);
                    unint64_t v100 = (void *)v151;
                    if (*((void *)&v151 + 1) == (void)v151)
                    {
                      int64x2_t v103 = vdupq_n_s64(*((unint64_t *)&v151 + 1));
                      uint64_t v101 = &v96[16 * v92];
                    }

                    else
                    {
                      uint64_t v101 = &v96[16 * v92];
                      do
                      {
                        __int128 v102 = *((_OWORD *)v99 - 1);
                        v99 -= 2;
                        *((_OWORD *)v101 - 1) = v102;
                        v101 -= 16;
                        void *v99 = 0LL;
                        v99[1] = 0LL;
                      }

                      while (v99 != v100);
                      int64x2_t v103 = (int64x2_t)v151;
                    }

                    int v104 = v98 + 16;
                    *(void *)&__int128 v151 = v101;
                    *((void *)&v151 + 1) = v98 + 16;
                    *(int64x2_t *)&__s1[8] = v103;
                    uint64_t v105 = v152[0];
                    v152[0] = &v96[16 * v97];
                    uint64_t v160 = v105;
                    *(void *)__s1 = v103.i64[0];
                    sub_183C08050((uint64_t)__s1);
                    int v106 = (std::__shared_weak_count *)*((void *)&v156[0] + 1);
                    *((void *)&v151 + 1) = v104;
                    if (*((void *)&v156[0] + 1))
                    {
                      int v107 = (unint64_t *)(*((void *)&v156[0] + 1) + 8LL);
                      do
                        unint64_t v108 = __ldaxr(v107);
                      while (__stlxr(v108 - 1, v107));
                      goto LABEL_163;
                    }

LABEL_165:
                    if (v158 < 0) {
                      operator delete((void *)__p.n128_u64[0]);
                    }
                    goto LABEL_187;
                  }
                }

                else
                {
                  if (!*((_BYTE *)v12 + 23)) {
                    goto LABEL_142;
                  }
                  if (*(_BYTE *)v12 != 60) {
                    goto LABEL_124;
                  }
                  unint64_t v73 = (char *)*v12;
                  std::string v74 = (char *)v12;
                  uint64_t v75 = *((unsigned __int8 *)v12 + 23);
LABEL_122:
                  if (v74[v75 - 1] != 62)
                  {
                    if ((*((_BYTE *)v12 + 23) & 0x80) == 0)
                    {
LABEL_124:
                      std::string v74 = (char *)v12;
                      uint64_t v75 = *((unsigned __int8 *)v12 + 23);
LABEL_125:
                      uint64_t v76 = &v74[v75];
                      unint64_t v73 = v74;
                      goto LABEL_126;
                    }

                    uint64_t v113 = v12[1];
                    if (v113)
                    {
                      uint64_t v76 = &v73[v113];
LABEL_126:
                      do
                      {
                        unsigned int v77 = *v73;
                        if (!((v77 & 0x80000000) != 0
                             ? __maskrune(v77, 0x8000uLL)
                             : *(_DWORD *)(v6 + 4LL * v77 + 60) & 0x8000))
                          goto LABEL_142;
                      }

                      while (++v73 != v76);
                    }
                  }

                  sub_183C0ACC8(a1, &__p);
                  sub_183C0D9F8((uint64_t)&__p, v156);
                  uint64_t v79 = (_OWORD *)*((void *)&v151 + 1);
                  if (*((void *)&v151 + 1) >= v152[0])
                  {
                    uint64_t v80 = (uint64_t)(*((void *)&v151 + 1) - v151) >> 4;
                    unint64_t v81 = v80 + 1;
                    uint64_t v82 = v152[0] - v151;
                    else {
                      unint64_t v83 = v81;
                    }
                    uint64_t v161 = v152;
                    char v84 = (char *)sub_183BF7BDC((uint64_t)v152, v83);
                    unsigned int v86 = &v84[16 * v80];
                    *(_OWORD *)unsigned int v86 = v156[0];
                    v156[0] = 0uLL;
                    uint64_t v87 = (void *)*((void *)&v151 + 1);
                    char v88 = (void *)v151;
                    if (*((void *)&v151 + 1) == (void)v151)
                    {
                      int64x2_t v91 = vdupq_n_s64(*((unint64_t *)&v151 + 1));
                      uint64_t v89 = &v84[16 * v80];
                    }

                    else
                    {
                      uint64_t v89 = &v84[16 * v80];
                      do
                      {
                        __int128 v90 = *((_OWORD *)v87 - 1);
                        v87 -= 2;
                        *((_OWORD *)v89 - 1) = v90;
                        v89 -= 16;
                        *uint64_t v87 = 0LL;
                        v87[1] = 0LL;
                      }

                      while (v87 != v88);
                      int64x2_t v91 = (int64x2_t)v151;
                    }

                    uint64_t v109 = v86 + 16;
                    *(void *)&__int128 v151 = v89;
                    *((void *)&v151 + 1) = v86 + 16;
                    *(int64x2_t *)&__s1[8] = v91;
                    uint64_t v110 = v152[0];
                    v152[0] = &v84[16 * v85];
                    uint64_t v160 = v110;
                    *(void *)__s1 = v91.i64[0];
                    sub_183C08050((uint64_t)__s1);
                    int v106 = (std::__shared_weak_count *)*((void *)&v156[0] + 1);
                    *((void *)&v151 + 1) = v109;
                    if (*((void *)&v156[0] + 1))
                    {
                      unsigned __int8 v111 = (unint64_t *)(*((void *)&v156[0] + 1) + 8LL);
                      do
                        unint64_t v108 = __ldaxr(v111);
                      while (__stlxr(v108 - 1, v111));
LABEL_163:
                      if (!v108)
                      {
                        ((void (*)(std::__shared_weak_count *))v106->__on_zero_shared)(v106);
                        std::__shared_weak_count::__release_weak(v106);
                      }
                    }

                    goto LABEL_165;
                  }
                }

                *uint64_t v79 = v156[0];
                v156[0] = 0uLL;
                *((void *)&v151 + 1) = v79 + 1;
                goto LABEL_165;
              }

              if (*(_BYTE *)v12 != 45) {
                goto LABEL_77;
              }
            }
          }

          if ((__s1[23] & 0x80000000) != 0) {
            operator delete(*(void **)__s1);
          }
          goto LABEL_116;
        }

        unint64_t v14 = (int *)v11;
        if (v13 != 7) {
          goto LABEL_31;
        }
      }

      int v16 = *v14;
      int v17 = *(int *)((char *)v14 + 3);
      if (v16 != 1769238639 || v17 != 1936617321) {
        goto LABEL_31;
      }
      sub_183C0ACC8(a1, &__p);
      if (v158 < 0) {
        operator delete((void *)__p.n128_u64[0]);
      }
      uint64_t v19 = operator new(0x38uLL);
      v19[1] = 0LL;
      v19[2] = 0LL;
      *uint64_t v19 = off_189D387E0;
      v19[4] = 0LL;
      v19[5] = 0LL;
      v19[6] = 0LL;
      memset(__s1, 0, sizeof(__s1));
      v154.n128_u64[0] = (unint64_t)__s1;
      sub_183BF7C68((void ***)&v154);
      std::locale v19[3] = off_189D38830;
      uint64_t v20 = v19 + 3;
      *(void *)&v156[0] = v19 + 3;
      *((void *)&v156[0] + 1) = v19;
      uint64_t v21 = *((void *)&v151 + 1);
      if (*((void *)&v151 + 1) >= v152[0])
      {
        uint64_t v35 = (uint64_t)(*((void *)&v151 + 1) - v151) >> 4;
        unint64_t v36 = v35 + 1;
        uint64_t v37 = v152[0] - v151;
        else {
          unint64_t v38 = v36;
        }
        uint64_t v161 = v152;
        uint64_t v39 = (char *)sub_183BF7BDC((uint64_t)v152, v38);
        unint64_t v41 = &v39[16 * v35];
        *(void *)unint64_t v41 = v20;
        *((void *)v41 + 1) = v19;
        uint64_t v42 = (void *)*((void *)&v151 + 1);
        unint64_t v43 = (void *)v151;
        if (*((void *)&v151 + 1) == (void)v151)
        {
          int64x2_t v46 = vdupq_n_s64(*((unint64_t *)&v151 + 1));
          unint64_t v44 = &v39[16 * v35];
        }

        else
        {
          unint64_t v44 = &v39[16 * v35];
          do
          {
            __int128 v45 = *((_OWORD *)v42 - 1);
            v42 -= 2;
            *((_OWORD *)v44 - 1) = v45;
            v44 -= 16;
            void *v42 = 0LL;
            v42[1] = 0LL;
          }

          while (v42 != v43);
          int64x2_t v46 = (int64x2_t)v151;
        }

        uint64_t v22 = v41 + 16;
        *(void *)&__int128 v151 = v44;
        *((void *)&v151 + 1) = v41 + 16;
        *(int64x2_t *)&__s1[8] = v46;
        uint64_t v112 = v152[0];
        v152[0] = &v39[16 * v40];
        uint64_t v160 = v112;
        *(void *)__s1 = v46.i64[0];
        sub_183C08050((uint64_t)__s1);
      }

      else
      {
        **((void **)&v151 + 1) = v20;
        *(void *)(v21 + 8) = v19;
        uint64_t v22 = (void *)(v21 + 16);
      }

      *((void *)&v151 + 1) = v22;
LABEL_187:
      unsigned __int8 v122 = sub_183C0ABC0(a1);
      int v123 = *((char *)v122 + 23);
      if (v123 < 0)
      {
        if (v122[1] != 3) {
          goto LABEL_196;
        }
        unsigned __int8 v122 = (uint64_t *)*v122;
      }

      else if (v123 != 3)
      {
        goto LABEL_196;
      }

      if (*(_WORD *)v122 == 11822 && *((_BYTE *)v122 + 2) == 46)
      {
        sub_183C0E82C(&v151, &__p);
        v128 = *(__n128 **)(a3 + 8);
        unint64_t v127 = *(void *)(a3 + 16);
        if ((unint64_t)v128 >= v127)
        {
          uint64_t v129 = ((uint64_t)v128 - *(void *)a3) >> 4;
          unint64_t v130 = v129 + 1;
          uint64_t v131 = v127 - *(void *)a3;
          if (v131 >> 3 > v130) {
            unint64_t v130 = v131 >> 3;
          }
          else {
            unint64_t v132 = v130;
          }
          uint64_t v161 = (void *)v148;
          __int128 v133 = (char *)sub_183BF7BDC(v148, v132);
          __int128 v135 = (__n128 *)&v133[16 * v129];
          *__int128 v135 = __p;
          __n128 __p = 0uLL;
          v137 = *(void **)a3;
          v136 = *(void **)(a3 + 8);
          if (v136 == *(void **)a3)
          {
            int64x2_t v140 = vdupq_n_s64((unint64_t)v136);
            v138 = &v133[16 * v129];
          }

          else
          {
            v138 = &v133[16 * v129];
            do
            {
              __int128 v139 = *((_OWORD *)v136 - 1);
              v136 -= 2;
              *((_OWORD *)v138 - 1) = v139;
              v138 -= 16;
              void *v136 = 0LL;
              v136[1] = 0LL;
            }

            while (v136 != v137);
            int64x2_t v140 = *(int64x2_t *)a3;
          }

          v141 = v135 + 1;
          *(void *)a3 = v138;
          *(void *)(a3 + 8) = v135 + 1;
          *(int64x2_t *)&__s1[8] = v140;
          uint64_t v142 = *(void *)(a3 + 16);
          *(void *)(a3 + 16) = &v133[16 * v134];
          uint64_t v160 = v142;
          *(void *)__s1 = v140.i64[0];
          sub_183C08050((uint64_t)__s1);
          int v143 = (std::__shared_weak_count *)__p.n128_u64[1];
          *(void *)(a3 + 8) = v141;
          if (v143)
          {
            p_shared_owners = (unint64_t *)&v143->__shared_owners_;
            do
              unint64_t v145 = __ldaxr(p_shared_owners);
            while (__stlxr(v145 - 1, p_shared_owners));
            if (!v145)
            {
              ((void (*)(std::__shared_weak_count *))v143->__on_zero_shared)(v143);
              std::__shared_weak_count::__release_weak(v143);
            }
          }
        }

        else
        {
          __n128 *v128 = __p;
          *(void *)(a3 + 8) = v128 + 1;
        }

        sub_183C0ACC8(a1, &v149);
        if (v150 < 0) {
          operator delete((void *)v149.n128_u64[0]);
        }
        goto LABEL_219;
      }

LABEL_196:
      uint64_t v125 = *((void *)&v151 + 1);
      for (uint64_t i = v151; i != v125; i += 16LL)
        sub_183C0CE4C((char **)a3, i);
LABEL_219:
      *(void *)__s1 = &v151;
      sub_183BF7C68((void ***)__s1);
    }

    while (a1[3] < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a1[1] - *a1) >> 3));
  }

void sub_183C0AA60( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, char **__p, uint64_t a21, int a22, __int16 a23, char a24, char a25, char *a26, uint64_t a27, uint64_t a28, uint64_t a29, void *a30, uint64_t a31, int a32, __int16 a33, char a34, char a35)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  __n128 __p = &a26;
  sub_183BF7C68((void ***)&__p);
  a26 = &a13;
  sub_183BF7C68((void ***)&a26);
  sub_183BF7C68((void ***)&a26);
  _Unwind_Resume(a1);
}

uint64_t *sub_183C0ABC0(void *a1)
{
  unint64_t v1 = a1[3];
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&qword_18C662F48);
  if ((v3 & 1) != 0) {
    return &qword_18C662F30;
  }
  if (__cxa_guard_acquire(&qword_18C662F48))
  {
    qword_18C662F30 = 0LL;
    *(void *)algn_18C662F38 = 0LL;
    qword_18C662F40 = 0LL;
    __cxa_atexit(MEMORY[0x189614350], &qword_18C662F30, &dword_183BF4000);
    __cxa_guard_release(&qword_18C662F48);
  }

  return &qword_18C662F30;
}

double sub_183C0AC6C@<D0>(__int128 *a1@<X0>, _OWORD *a2@<X8>)
{
  unsigned __int8 v3 = *(__int128 **)a1;
  if (*((void *)a1 + 1) - *(void *)a1 == 16LL)
  {
    __int128 v4 = *v3;
    *a2 = *v3;
    *(void *)unsigned __int8 v3 = 0LL;
    *((void *)v3 + 1) = 0LL;
  }

  else
  {
    sub_183C0CAB8(a1, &v6);
    *(void *)&__int128 v4 = v6;
    *a2 = v6;
  }

  return *(double *)&v4;
}

__n128 sub_183C0ACC8@<Q0>(void *a1@<X0>, __n128 *a2@<X8>)
{
  unint64_t v2 = a1[3];
  a1[3] = v2 + 1;
  unsigned __int8 v3 = (__n128 *)(*a1 + 24 * v2);
  __n128 result = *v3;
  *a2 = *v3;
  a2[1].n128_u64[0] = v3[1].n128_u64[0];
  v3->n128_u64[1] = 0LL;
  v3[1].n128_u64[0] = 0LL;
  v3->n128_u64[0] = 0LL;
  return result;
}

void sub_183C0AD28(uint64_t a1@<X0>, uint64_t *a2@<X1>, char **a3@<X8>)
{
  __s1 = 0LL;
  uint64_t v125 = 0LL;
  uint64_t v126 = 0LL;
  unsigned __int8 v121 = 0LL;
  uint64_t v122 = 0LL;
  uint64_t v123 = 0LL;
  int v118 = 0;
  sub_183C0ACC8((void *)a1, (__n128 *)&__str);
  sub_183C11CAC(&v113, "=");
  __int128 v116 = 0u;
  memset(&v117, 0, sizeof(v117));
  memset(__p, 0, sizeof(__p));
  int64_t size = __str.__r_.__value_.__s.__size_;
  if ((__str.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_str = &__str;
  }
  else {
    p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
  }
  if ((__str.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    int64_t size = __str.__r_.__value_.__l.__size_;
  }
  if ((v113.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    int v8 = &v113;
  }
  else {
    int v8 = (std::string *)v113.__r_.__value_.__r.__words[0];
  }
  if ((v113.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    int64_t v9 = v113.__r_.__value_.__s.__size_;
  }
  else {
    int64_t v9 = v113.__r_.__value_.__l.__size_;
  }
  if (v9)
  {
    if (size >= v9)
    {
      int v10 = (char *)p_str + size;
      int v11 = v8->__r_.__value_.__s.__data_[0];
      unint64_t v12 = p_str;
      do
      {
        int64_t v13 = size - v9;
        if (v13 == -1) {
          break;
        }
        unint64_t v14 = (char *)memchr(v12, v11, v13 + 1);
        if (!v14) {
          break;
        }
        uint64_t v15 = v14;
        if (!memcmp(v14, v8, v9))
        {
          if (v15 != v10)
          {
            std::string::size_type v16 = v15 - (char *)p_str;
          }

          break;
        }

        unint64_t v12 = (std::string *)(v15 + 1);
        int64_t size = v10 - (v15 + 1);
      }

      while (size >= v9);
    }
  }

  else
  {
    std::string::size_type v16 = 0LL;
LABEL_21:
    std::string::basic_string(&v127, &__str, v16 + v9, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v112);
    std::string v117 = v127;
    std::string::operator=((std::string *)&__p[24], &v113);
    std::string::resize(&__str, v16, 0);
    if ((__p[23] & 0x80000000) != 0) {
      operator delete(*(void **)__p);
    }
  }

  *(std::string *)__n128 __p = __str;
  __str.__r_.__value_.__s.__size_ = 0;
  __str.__r_.__value_.__s.__data_[0] = 0;
  v127.__r_.__value_.__r.__words[0] = (std::string::size_type)&__s1;
  v127.__r_.__value_.__l.__size_ = (std::string::size_type)&v121;
  v127.__r_.__value_.__l.__cap_ = (std::string::size_type)&v118;
  sub_183C0CF54(&v127, (__int128 *)__p);
  if (SHIBYTE(v116) < 0) {
    operator delete(*(void **)&__p[24]);
  }
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
  uint64_t v17 = HIBYTE(v123);
  if (v123 < 0) {
    uint64_t v17 = v122;
  }
  if (v17) {
    goto LABEL_36;
  }
  *(_DWORD *)__n128 __p = 0;
  if (v118 == 3)
  {
    if (SHIBYTE(v120) < 0) {
      operator delete((void *)v119);
    }
    goto LABEL_130;
  }

  if (v118 == 4)
  {
    v127.__r_.__value_.__r.__words[0] = (std::string::size_type)&v119;
    sub_183C11DE0((void ***)&v127);
LABEL_130:
    int v118 = *(_DWORD *)__p;
    switch(*(_DWORD *)__p)
    {
      case 1:
        LOBYTE(v119) = __p[8];
        break;
      case 2:
        *(void *)&__int128 v119 = *(void *)&__p[8];
        break;
      case 3:
        __int128 v119 = *(_OWORD *)&__p[8];
        uint64_t v120 = *(void *)&__p[24];
        break;
      case 4:
        __int128 v119 = *(_OWORD *)&__p[8];
        uint64_t v120 = *(void *)&__p[24];
        memset(&__p[8], 0, 24);
        v127.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p[8];
        sub_183C11DE0((void ***)&v127);
        break;
      default:
        goto LABEL_36;
    }

    goto LABEL_36;
  }

  int v118 = 0;
LABEL_36:
  memset(&v127, 0, sizeof(v127));
  uint64_t v18 = *a2;
  uint64_t v19 = a2[1];
  if (*a2 == v19)
  {
    uint64_t v35 = (_BYTE *)(a1 + 32);
    if (!*(_BYTE *)(a1 + 32))
    {
      *a3 = 0LL;
      a3[1] = 0LL;
      a3[2] = 0LL;
      goto LABEL_119;
    }

    BOOL v34 = 0LL;
    goto LABEL_80;
  }

  uint64_t v20 = 0LL;
  do
  {
    uint64_t v21 = *(unsigned __int8 *)(v18 + 111);
    if ((v21 & 0x80u) == 0LL) {
      uint64_t v22 = *(unsigned __int8 *)(v18 + 111);
    }
    else {
      uint64_t v22 = *(void *)(v18 + 96);
    }
    uint64_t v23 = HIBYTE(v126);
    if (v126 < 0) {
      uint64_t v23 = v125;
    }
    if (v22 == v23)
    {
      if (v126 >= 0) {
        p_s1 = (void **)&__s1;
      }
      else {
        p_s1 = __s1;
      }
      if ((v21 & 0x80) != 0)
      {
LABEL_54:
        if ((unint64_t)v20 >= v127.__r_.__value_.__l.__cap_)
        {
          uint64_t v26 = (uint64_t)((uint64_t)v20 - v127.__r_.__value_.__r.__words[0]) >> 3;
          unint64_t v27 = (uint64_t)(v127.__r_.__value_.__l.__cap_ - v127.__r_.__value_.__r.__words[0]) >> 2;
          if (v27 <= v26 + 1) {
            unint64_t v27 = v26 + 1;
          }
          if (v127.__r_.__value_.__l.__cap_ - v127.__r_.__value_.__r.__words[0] >= 0x7FFFFFFFFFFFFFF8LL) {
            unint64_t v28 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v28 = v27;
          }
          if (v28) {
            BOOL v29 = (char *)sub_183BF77F8((uint64_t)&v127.__r_.__value_.__l.__cap_, v28);
          }
          else {
            BOOL v29 = 0LL;
          }
          uint64_t v30 = (uint64_t *)&v29[8 * v26];
          *uint64_t v30 = v18;
          uint64_t v20 = v30 + 1;
          __n128 v31 = (char *)v127.__r_.__value_.__l.__size_;
          std::string::size_type v32 = v127.__r_.__value_.__r.__words[0];
          if (v127.__r_.__value_.__l.__size_ != v127.__r_.__value_.__r.__words[0])
          {
            do
            {
              uint64_t v33 = *((void *)v31 - 1);
              v31 -= 8;
              *--uint64_t v30 = v33;
            }

            while (v31 != (char *)v32);
            __n128 v31 = (char *)v127.__r_.__value_.__r.__words[0];
          }

          v127.__r_.__value_.__r.__words[0] = (std::string::size_type)v30;
          v127.__r_.__value_.__l.__size_ = (std::string::size_type)v20;
          v127.__r_.__value_.__l.__cap_ = (std::string::size_type)&v29[8 * v28];
          if (v31) {
            operator delete(v31);
          }
        }

        else
        {
          *v20++ = v18;
        }

        v127.__r_.__value_.__l.__size_ = (std::string::size_type)v20;
        goto LABEL_71;
      }

      if (!*(_BYTE *)(v18 + 111)) {
        goto LABEL_54;
      }
      uint64_t v25 = 0LL;
      while (*(unsigned __int8 *)(v18 + v25 + 88) == *((unsigned __int8 *)p_s1 + v25))
      {
        if (v21 == ++v25) {
          goto LABEL_54;
        }
      }
    }

LABEL_71:
    v18 += 120LL;
  }

  while (v18 != v19);
  BOOL v34 = (uint64_t *)v127.__r_.__value_.__r.__words[0];
  uint64_t v35 = (_BYTE *)(a1 + 32);
  if (*(_BYTE *)(a1 + 32) && (uint64_t *)v127.__r_.__value_.__l.__data_ == v20)
  {
LABEL_80:
    uint64_t v36 = *a2;
    uint64_t v37 = a2[1];
    if (*a2 == v37)
    {
      uint64_t v20 = v34;
      goto LABEL_108;
    }

    uint64_t v20 = v34;
    while (1)
    {
      if (*(char *)(v36 + 111) < 0)
      {
        if (*(void *)(v36 + 96))
        {
LABEL_86:
          if (sub_183C061B4((const void **)(v36 + 88), &__s1))
          {
            if ((unint64_t)v20 >= v127.__r_.__value_.__l.__cap_)
            {
              uint64_t v38 = (uint64_t)((uint64_t)v20 - v127.__r_.__value_.__r.__words[0]) >> 3;
              unint64_t v39 = (uint64_t)(v127.__r_.__value_.__l.__cap_ - v127.__r_.__value_.__r.__words[0]) >> 2;
              if (v39 <= v38 + 1) {
                unint64_t v39 = v38 + 1;
              }
              if (v127.__r_.__value_.__l.__cap_ - v127.__r_.__value_.__r.__words[0] >= 0x7FFFFFFFFFFFFFF8LL) {
                unint64_t v40 = 0x1FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v40 = v39;
              }
              if (v40) {
                unint64_t v41 = (char *)sub_183BF77F8((uint64_t)&v127.__r_.__value_.__l.__cap_, v40);
              }
              else {
                unint64_t v41 = 0LL;
              }
              uint64_t v42 = (uint64_t *)&v41[8 * v38];
              uint64_t *v42 = v36;
              uint64_t v20 = v42 + 1;
              unint64_t v43 = (char *)v127.__r_.__value_.__l.__size_;
              std::string::size_type v44 = v127.__r_.__value_.__r.__words[0];
              if (v127.__r_.__value_.__l.__size_ != v127.__r_.__value_.__r.__words[0])
              {
                do
                {
                  uint64_t v45 = *((void *)v43 - 1);
                  v43 -= 8;
                  *--uint64_t v42 = v45;
                }

                while (v43 != (char *)v44);
                unint64_t v43 = (char *)v127.__r_.__value_.__r.__words[0];
              }

              v127.__r_.__value_.__r.__words[0] = (std::string::size_type)v42;
              v127.__r_.__value_.__l.__size_ = (std::string::size_type)v20;
              v127.__r_.__value_.__l.__cap_ = (std::string::size_type)&v41[8 * v40];
              if (v43) {
                operator delete(v43);
              }
            }

            else
            {
              *v20++ = v36;
            }

            v127.__r_.__value_.__l.__size_ = (std::string::size_type)v20;
          }
        }
      }

      else if (*(_BYTE *)(v36 + 111))
      {
        goto LABEL_86;
      }

      v36 += 120LL;
      if (v36 == v37)
      {
        BOOL v34 = (uint64_t *)v127.__r_.__value_.__r.__words[0];
        break;
      }
    }
  }

  uint64_t v42 = (void **)&v46;
  sub_183C11C3C(&v42);
}

LABEL_175:
      if (*(_WORD *)v47 != 11565) {
        goto LABEL_176;
      }
    }

LABEL_115:
    sub_183BF714C(" requires an argument", (const void **)(v113.__r_.__value_.__r.__words[0] + 88), (void **)__p);
    __int128 v48 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v48, (const std::string *)__p);
    v48->__vftable = (std::runtime_error_vtbl *)&off_189D388A8;
    __cxa_throw( v48,  (struct type_info *)&unk_189D37D48,  (void (*)(void *))std::runtime_error::~runtime_error);
  }

LABEL_119:
  uint64_t v50 = HIBYTE(v123);
  if (v123 < 0) {
    uint64_t v50 = v122;
  }
  LODWORD(v110[0]) = v50 != 0;
  unint64_t v51 = a2[1];
  if (v51 >= a2[2])
  {
    uint64_t v52 = sub_183C0D1E8(a2, (char *)&unk_183C1629A, (uint64_t)&__s1, (int *)v110);
  }

  else
  {
    sub_183C0D30C((_DWORD)a2 + 16, a2[1], (char *)&unk_183C1629A, (uint64_t)&__s1, (int *)v110);
    uint64_t v52 = v51 + 120;
    a2[1] = v51 + 120;
  }

  a2[1] = v52;
  sub_183C0D430(v52 - 120, &v113);
  if (*v35)
  {
    uint64_t v53 = v113.__r_.__value_.__r.__words[0];
    if (LODWORD(v110[0]))
    {
      *(_DWORD *)__n128 __p = v118;
      switch(v118)
      {
        case 1:
          char v54 = v119;
          goto LABEL_134;
        case 2:
          *(void *)&__p[8] = v119;
          break;
        case 3:
          if (SHIBYTE(v120) < 0)
          {
            sub_183BFF5D4(&__p[8], (void *)v119, *((unint64_t *)&v119 + 1));
          }

          else
          {
            *(_OWORD *)&__p[8] = v119;
            *(void *)&__p[24] = v120;
          }

          break;
        case 4:
          memset(&__p[8], 0, 24);
          sub_183C11D5C( &__p[8],  (__int128 *)v119,  *((__int128 **)&v119 + 1),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v119 + 1) - v119) >> 3));
          break;
        default:
          break;
      }
    }

    else
    {
      char v54 = 1;
      *(_DWORD *)__n128 __p = 1;
LABEL_134:
      __p[8] = v54;
    }

    sub_183C07EA8(v53, (int *)__p);
    if (*(_DWORD *)__p == 4)
    {
      v112.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p[8];
      sub_183C11DE0((void ***)&v112);
    }

    else if (*(_DWORD *)__p == 3 && (__p[31] & 0x80000000) != 0)
    {
      operator delete(*(void **)&__p[8]);
    }
  }

  __int128 v55 = *(_OWORD *)&v113.__r_.__value_.__l.__data_;
  *(_OWORD *)&v112.__r_.__value_.__l.__data_ = *(_OWORD *)&v113.__r_.__value_.__l.__data_;
  std::string::size_type v56 = v113.__r_.__value_.__l.__size_;
  if (v113.__r_.__value_.__l.__size_)
  {
    int v57 = (unint64_t *)(v113.__r_.__value_.__l.__size_ + 8);
    do
      unint64_t v58 = __ldxr(v57);
    while (__stxr(v58 + 1, v57));
  }

  unint64_t v59 = (unint64_t)a3[2];
  int64x2_t v60 = a3[1];
  if ((unint64_t)v60 >= v59)
  {
    __int128 v107 = v55;
    uint64_t v62 = (v60 - *a3) >> 4;
    uint64_t v63 = v59 - (void)*a3;
    uint64_t v64 = v63 >> 3;
    else {
      unint64_t v65 = v64;
    }
    *(void *)&__int128 v116 = a3 + 2;
    uint64_t v66 = (char *)sub_183BF7BDC((uint64_t)(a3 + 2), v65);
    unsigned __int8 v68 = &v66[16 * v62];
    *(_OWORD *)unsigned __int8 v68 = v107;
    uint64_t v70 = *a3;
    uint64_t v69 = a3[1];
    if (v69 == *a3)
    {
      int64x2_t v73 = vdupq_n_s64((unint64_t)v69);
      __int128 v71 = &v66[16 * v62];
    }

    else
    {
      __int128 v71 = &v66[16 * v62];
      do
      {
        __int128 v72 = *((_OWORD *)v69 - 1);
        v69 -= 16;
        *((_OWORD *)v71 - 1) = v72;
        v71 -= 16;
        *(void *)uint64_t v69 = 0LL;
        *((void *)v69 + 1) = 0LL;
      }

      while (v69 != v70);
      int64x2_t v73 = *(int64x2_t *)a3;
    }

    uint64_t v61 = v68 + 16;
    *a3 = v71;
    a3[1] = v68 + 16;
    *(int64x2_t *)&__p[8] = v73;
    std::string v74 = a3[2];
    a3[2] = &v66[16 * v67];
    *(void *)&__p[24] = v74;
    *(void *)__n128 __p = v73.i64[0];
    sub_183C08050((uint64_t)__p);
  }

  else
  {
    *(void *)int64x2_t v60 = v55;
    *((void *)v60 + 1) = v56;
    uint64_t v61 = v60 + 16;
  }

  a3[1] = v61;
  uint64_t v75 = (std::__shared_weak_count *)v113.__r_.__value_.__l.__size_;
  if (v113.__r_.__value_.__l.__size_)
  {
    uint64_t v76 = (unint64_t *)(v113.__r_.__value_.__l.__size_ + 8);
    do
      unint64_t v77 = __ldaxr(v76);
    while (__stlxr(v77 - 1, v76));
    goto LABEL_226;
  }

LABEL_228:
  if (v127.__r_.__value_.__r.__words[0])
  {
    v127.__r_.__value_.__l.__size_ = v127.__r_.__value_.__r.__words[0];
    operator delete(v127.__r_.__value_.__l.__data_);
  }

  if (v118 == 4)
  {
    *(void *)__n128 __p = &v119;
    sub_183C11DE0((void ***)__p);
  }

  else if (v118 == 3 && SHIBYTE(v120) < 0)
  {
    operator delete((void *)v119);
  }

  if (SHIBYTE(v123) < 0) {
    operator delete(v121);
  }
  if (SHIBYTE(v126) < 0) {
    operator delete(__s1);
  }
}

void sub_183C0BB3C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20, uint64_t a21, int a22, __int16 a23, char a24, char a25, uint64_t a26, void **__p, uint64_t a28, int a29, __int16 a30, char a31, char a32, uint64_t a33, uint64_t a34, int a35, __int16 a36, char a37, char a38, void *a39, uint64_t a40, int a41, __int16 a42, char a43, char a44)
{
  if (a32 < 0) {
    operator delete(__p);
  }
  __n128 __p = &a39;
  sub_183C11DE0(&__p);
  sub_183BF7C68(&__p);
  uint64_t v46 = *(void **)(v44 - 120);
  if (v46)
  {
    *(void *)(v44 - 112) = v46;
    operator delete(v46);
  }

  sub_183C07F8C(v44 - 200);
  _Unwind_Resume(a1);
}

void sub_183C0BCE8(uint64_t a1@<X0>, uint64_t *a2@<X1>, char **a3@<X8>)
{
  uint64_t v5 = v103;
  __int128 v6 = (__n128 *)v102.n128_u64[0];
  if ((v103 & 0x80u) == 0) {
    __int128 v6 = &v102;
  }
  unint64_t v7 = (__n128 *)((char *)v6->n128_u64 + 1);
  a3[2] = 0LL;
  uint64_t v86 = (uint64_t)(a3 + 2);
  *a3 = 0LL;
  a3[1] = 0LL;
  if ((v5 & 0x80) != 0) {
    goto LABEL_6;
  }
  while (2)
  {
LABEL_7:
    unsigned __int8 v8 = v7->n128_u8[0];
    unint64_t v7 = (__n128 *)((char *)v7 + 1);
    char v101 = 2;
    LOBYTE(v100[0]) = 45;
    *(_WORD *)((char *)v100 + 1) = v8;
    int64x2_t v97 = 0LL;
    v98 = 0LL;
    int v99 = 0LL;
    uint64_t v10 = *a2;
    uint64_t v9 = a2[1];
    if (*a2 == v9) {
      goto LABEL_49;
    }
    int v11 = 0LL;
    do
    {
      uint64_t v12 = *(unsigned __int8 *)(v10 + 87);
      if ((v12 & 0x80u) == 0LL) {
        int64_t v13 = (const void *)*(unsigned __int8 *)(v10 + 87);
      }
      else {
        int64_t v13 = *(const void **)(v10 + 72);
      }
      unint64_t v14 = v101;
      if (v101 < 0) {
        unint64_t v14 = (unint64_t)v100[1];
      }
      if (v13 == (const void *)v14)
      {
        if (v101 >= 0) {
          uint64_t v15 = v100;
        }
        else {
          uint64_t v15 = (const void **)v100[0];
        }
        if ((v12 & 0x80) != 0)
        {
LABEL_25:
          if (v11 >= v99)
          {
            uint64_t v17 = ((char *)v11 - (_BYTE *)v97) >> 3;
            unint64_t v18 = ((char *)v99 - (_BYTE *)v97) >> 2;
            if (v18 <= v17 + 1) {
              unint64_t v18 = v17 + 1;
            }
            else {
              unint64_t v19 = v18;
            }
            if (v19) {
              uint64_t v20 = (char *)sub_183BF77F8((uint64_t)&v99, v19);
            }
            else {
              uint64_t v20 = 0LL;
            }
            uint64_t v21 = (uint64_t *)&v20[8 * v17];
            uint64_t *v21 = v10;
            int v11 = v21 + 1;
            uint64_t v23 = (char *)v97;
            uint64_t v22 = (char *)v98;
            if (v98 != v97)
            {
              do
              {
                uint64_t v24 = *((void *)v22 - 1);
                v22 -= 8;
                *--uint64_t v21 = v24;
              }

              while (v22 != v23);
              uint64_t v22 = (char *)v97;
            }

            int64x2_t v97 = v21;
            v98 = v11;
            int v99 = (uint64_t *)&v20[8 * v19];
            if (v22) {
              operator delete(v22);
            }
          }

          else
          {
            *v11++ = v10;
          }

          v98 = v11;
          goto LABEL_42;
        }

        if (!*(_BYTE *)(v10 + 87)) {
          goto LABEL_25;
        }
        uint64_t v16 = 0LL;
        while (*(unsigned __int8 *)(v10 + v16 + 64) == *((unsigned __int8 *)v15 + v16))
        {
          if (v12 == ++v16) {
            goto LABEL_25;
          }
        }
      }

LABEL_42:
      v10 += 120LL;
    }

    while (v10 != v9);
    if ((unint64_t)((char *)v11 - (_BYTE *)v97) > 8)
    {
      sub_183BF714C(" is specified ambiguously ", v100, (void **)&v96.__r_.__value_.__l.__data_);
      std::to_string(&v95, ((char *)v98 - (_BYTE *)v97) >> 3);
      if ((v95.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v78 = &v95;
      }
      else {
        uint64_t v78 = (std::string *)v95.__r_.__value_.__r.__words[0];
      }
      if ((v95.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        std::string::size_type size = v95.__r_.__value_.__s.__size_;
      }
      else {
        std::string::size_type size = v95.__r_.__value_.__l.__size_;
      }
      std::string::size_type v80 = std::string::append(&v96, (const std::string::value_type *)v78, size);
      __int128 v81 = *(_OWORD *)&v80->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__l.__cap_ = v80->__r_.__value_.__l.__cap_;
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v81;
      v80->__r_.__value_.__l.__size_ = 0LL;
      v80->__r_.__value_.__l.__cap_ = 0LL;
      v80->__r_.__value_.__r.__words[0] = 0LL;
      unint64_t v82 = std::string::append(&__p, " times");
      __int128 v83 = *(_OWORD *)&v82->__r_.__value_.__l.__data_;
      v104.__r_.__value_.__l.__cap_ = v82->__r_.__value_.__l.__cap_;
      *(_OWORD *)&v104.__r_.__value_.__l.__data_ = v83;
      v82->__r_.__value_.__l.__size_ = 0LL;
      v82->__r_.__value_.__l.__cap_ = 0LL;
      v82->__r_.__value_.__r.__words[0] = 0LL;
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, &v104);
      exception->__vftable = (std::runtime_error_vtbl *)&off_189D388A8;
      __cxa_throw( exception,  (struct type_info *)&unk_189D37D48,  (void (*)(void *))std::runtime_error::~runtime_error);
    }

    if (v97 != v11)
    {
      sub_183C0D710(*(void *)v97, &v96);
      LODWORD(__p.__r_.__value_.__l.__data_) = 0;
      if (!*(_DWORD *)(v96.__r_.__value_.__r.__words[0] + 112)) {
        goto LABEL_118;
      }
      if (((char)v103 & 0x80000000) == 0)
      {
        unint64_t v25 = v103;
        if (v7 != (__n128 *)((char *)&v102 + v103))
        {
          uint64_t v26 = &v102;
          goto LABEL_80;
        }

LABEL_83:
        uint64_t v52 = sub_183C0ABC0((void *)a1);
        if ((*((char *)v52 + 23) & 0x80000000) == 0)
        {
          if (*((_BYTE *)v52 + 23) != 2)
          {
            if (!*((_BYTE *)v52 + 23)) {
              goto LABEL_183;
            }
            goto LABEL_105;
          }

LABEL_104:
          if (*(_WORD *)v52 == 11565) {
            goto LABEL_183;
          }
          goto LABEL_105;
        }

        uint64_t v53 = v52[1];
        if (v53 == 2)
        {
          uint64_t v52 = (uint64_t *)*v52;
          goto LABEL_104;
        }

        if (!v53)
        {
LABEL_183:
          sub_183BF714C(" requires an argument", v100, (void **)&v104.__r_.__value_.__l.__data_);
          uint64_t v85 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v85, &v104);
          v85->__vftable = (std::runtime_error_vtbl *)&off_189D388A8;
          __cxa_throw( v85,  (struct type_info *)&unk_189D37D48,  (void (*)(void *))std::runtime_error::~runtime_error);
        }

LABEL_105:
        sub_183C0ACC8((void *)a1, (__n128 *)v91);
        LODWORD(v104.__r_.__value_.__l.__data_) = 3;
        *(_OWORD *)&v104.__r_.__value_.__r.__words[1] = *(_OWORD *)v91;
        std::string::size_type v105 = v92;
        v91[0] = 0LL;
        v91[1] = 0LL;
        uint64_t v92 = 0LL;
        if (LODWORD(__p.__r_.__value_.__l.__data_) == 3)
        {
          if (SHIBYTE(v94) < 0) {
            operator delete((void *)__p.__r_.__value_.__l.__size_);
          }
LABEL_110:
          LODWORD(__p.__r_.__value_.__l.__data_) = v104.__r_.__value_.__l.__data_;
          switch(LODWORD(v104.__r_.__value_.__l.__data_))
          {
            case 1:
              __p.__r_.__value_.__s.__data_[8] = v104.__r_.__value_.__s.__data_[8];
              break;
            case 2:
              __p.__r_.__value_.__l.__size_ = v104.__r_.__value_.__l.__size_;
              break;
            case 3:
              goto LABEL_113;
            case 4:
              *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = *(_OWORD *)&v104.__r_.__value_.__r.__words[1];
              uint64_t v94 = v105;
              std::string::size_type v105 = 0LL;
              *(_OWORD *)&v104.__r_.__value_.__r.__words[1] = 0uLL;
              v95.__r_.__value_.__r.__words[0] = (std::string::size_type)&v104.__r_.__value_.__l.__size_;
              sub_183C11DE0((void ***)&v95);
              break;
            default:
              break;
          }
        }

        else
        {
          if (LODWORD(__p.__r_.__value_.__l.__data_) == 4)
          {
            v95.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
            sub_183C11DE0((void ***)&v95);
            goto LABEL_110;
          }

          LODWORD(__p.__r_.__value_.__l.__data_) = 3;
LABEL_113:
          *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = *(_OWORD *)&v104.__r_.__value_.__r.__words[1];
          uint64_t v94 = v105;
          std::string::size_type v105 = 0LL;
          *(_OWORD *)&v104.__r_.__value_.__r.__words[1] = 0uLL;
        }

        if (SHIBYTE(v92) < 0) {
          operator delete(v91[0]);
        }
LABEL_118:
        std::string::size_type v56 = v96.__r_.__value_.__r.__words[0];
        if (*(_BYTE *)(a1 + 32))
        {
          if (LODWORD(__p.__r_.__value_.__l.__data_))
          {
            LODWORD(v104.__r_.__value_.__l.__data_) = __p.__r_.__value_.__l.__data_;
            switch(LODWORD(__p.__r_.__value_.__l.__data_))
            {
              case 1:
                std::string::value_type v57 = __p.__r_.__value_.__s.__data_[8];
                goto LABEL_123;
              case 2:
                v104.__r_.__value_.__l.__size_ = __p.__r_.__value_.__l.__size_;
                break;
              case 3:
                *(_OWORD *)&v104.__r_.__value_.__r.__words[1] = *(_OWORD *)&__p.__r_.__value_.__r.__words[1];
                std::string::size_type v105 = v94;
                uint64_t v94 = 0LL;
                *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = 0uLL;
                break;
              case 4:
                *(_OWORD *)&v104.__r_.__value_.__r.__words[1] = *(_OWORD *)&__p.__r_.__value_.__r.__words[1];
                std::string::size_type v105 = v94;
                uint64_t v94 = 0LL;
                *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = 0uLL;
                break;
              default:
                break;
            }
          }

          else
          {
            std::string::value_type v57 = 1;
            LODWORD(v104.__r_.__value_.__l.__data_) = 1;
LABEL_123:
            v104.__r_.__value_.__s.__data_[8] = v57;
          }

          sub_183C07EA8((uint64_t)v96.__r_.__value_.__l.__data_, (int *)&v104);
          if (LODWORD(v104.__r_.__value_.__l.__data_) == 4)
          {
            v95.__r_.__value_.__r.__words[0] = (std::string::size_type)&v104.__r_.__value_.__l.__size_;
            sub_183C11DE0((void ***)&v95);
          }

          else if (LODWORD(v104.__r_.__value_.__l.__data_) == 3 && SHIBYTE(v105) < 0)
          {
            operator delete((void *)v104.__r_.__value_.__l.__size_);
          }

          std::string::size_type v56 = v96.__r_.__value_.__r.__words[0];
        }

        std::string::size_type v58 = v96.__r_.__value_.__l.__size_;
        v95.__r_.__value_.__r.__words[0] = v56;
        v95.__r_.__value_.__l.__size_ = v96.__r_.__value_.__l.__size_;
        if (v96.__r_.__value_.__l.__size_)
        {
          unint64_t v59 = (unint64_t *)(v96.__r_.__value_.__l.__size_ + 8);
          do
            unint64_t v60 = __ldxr(v59);
          while (__stxr(v60 + 1, v59));
        }

        uint64_t v62 = (std::string::size_type *)a3[1];
        unint64_t v61 = (unint64_t)a3[2];
        if ((unint64_t)v62 >= v61)
        {
          uint64_t v64 = ((char *)v62 - *a3) >> 4;
          unint64_t v65 = v64 + 1;
          uint64_t v66 = v61 - (void)*a3;
          if (v66 >> 3 > v65) {
            unint64_t v65 = v66 >> 3;
          }
          else {
            unint64_t v67 = v65;
          }
          int v106 = a3 + 2;
          unsigned __int8 v68 = (char *)sub_183BF7BDC(v86, v67);
          uint64_t v70 = (std::string::size_type *)&v68[16 * v64];
          std::string::size_type *v70 = v56;
          v70[1] = v58;
          __int128 v72 = *a3;
          __int128 v71 = a3[1];
          if (v71 == *a3)
          {
            int64x2_t v75 = vdupq_n_s64((unint64_t)v71);
            int64x2_t v73 = &v68[16 * v64];
          }

          else
          {
            int64x2_t v73 = &v68[16 * v64];
            do
            {
              __int128 v74 = *((_OWORD *)v71 - 1);
              v71 -= 16;
              *((_OWORD *)v73 - 1) = v74;
              v73 -= 16;
              *(void *)__int128 v71 = 0LL;
              *((void *)v71 + 1) = 0LL;
            }

            while (v71 != v72);
            int64x2_t v75 = *(int64x2_t *)a3;
          }

          uint64_t v63 = (char *)(v70 + 2);
          *a3 = v73;
          a3[1] = (char *)(v70 + 2);
          *(int64x2_t *)&v104.__r_.__value_.__r.__words[1] = v75;
          uint64_t v76 = a3[2];
          a3[2] = &v68[16 * v69];
          std::string::size_type v105 = v76;
          v104.__r_.__value_.__r.__words[0] = v75.i64[0];
          sub_183C08050((uint64_t)&v104);
        }

        else
        {
          *uint64_t v62 = v56;
          v62[1] = v58;
          uint64_t v63 = (char *)(v62 + 2);
        }

        a3[1] = v63;
        if (LODWORD(__p.__r_.__value_.__l.__data_) == 4)
        {
          v104.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
          sub_183C11DE0((void ***)&v104);
        }

        else if (LODWORD(__p.__r_.__value_.__l.__data_) == 3 && SHIBYTE(v94) < 0)
        {
          operator delete((void *)__p.__r_.__value_.__l.__size_);
        }

        uint64_t v49 = (std::__shared_weak_count *)v96.__r_.__value_.__l.__size_;
        if (v96.__r_.__value_.__l.__size_)
        {
          unint64_t v77 = (unint64_t *)(v96.__r_.__value_.__l.__size_ + 8);
          do
            unint64_t v51 = __ldaxr(v77);
          while (__stlxr(v51 - 1, v77));
LABEL_158:
          if (!v51)
          {
            ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
            std::__shared_weak_count::__release_weak(v49);
          }
        }

        goto LABEL_160;
      }

      unint64_t v25 = v102.n128_u64[1];
      uint64_t v26 = (__n128 *)v102.n128_u64[0];
      if (v7 == (__n128 *)(v102.n128_u64[0] + v102.n128_u64[1])) {
        goto LABEL_83;
      }
LABEL_80:
      sub_183BFDE9C(v89, (char *)v7, (char *)v26 + v25, (char *)v26 + v25 - (char *)v7);
      LODWORD(v104.__r_.__value_.__l.__data_) = 3;
      *(_OWORD *)&v104.__r_.__value_.__r.__words[1] = *(_OWORD *)v89;
      std::string::size_type v105 = v90;
      v89[0] = 0LL;
      v89[1] = 0LL;
      __int128 v90 = 0LL;
      if (LODWORD(__p.__r_.__value_.__l.__data_) == 3)
      {
        if (SHIBYTE(v94) < 0) {
          operator delete((void *)__p.__r_.__value_.__l.__size_);
        }
LABEL_89:
        LODWORD(__p.__r_.__value_.__l.__data_) = v104.__r_.__value_.__l.__data_;
        switch(LODWORD(v104.__r_.__value_.__l.__data_))
        {
          case 1:
            __p.__r_.__value_.__s.__data_[8] = v104.__r_.__value_.__s.__data_[8];
            break;
          case 2:
            __p.__r_.__value_.__l.__size_ = v104.__r_.__value_.__l.__size_;
            break;
          case 3:
            goto LABEL_92;
          case 4:
            *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = *(_OWORD *)&v104.__r_.__value_.__r.__words[1];
            uint64_t v94 = v105;
            std::string::size_type v105 = 0LL;
            *(_OWORD *)&v104.__r_.__value_.__r.__words[1] = 0uLL;
            v95.__r_.__value_.__r.__words[0] = (std::string::size_type)&v104.__r_.__value_.__l.__size_;
            sub_183C11DE0((void ***)&v95);
            break;
          default:
            break;
        }
      }

      else
      {
        if (LODWORD(__p.__r_.__value_.__l.__data_) == 4)
        {
          v95.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
          sub_183C11DE0((void ***)&v95);
          goto LABEL_89;
        }

        LODWORD(__p.__r_.__value_.__l.__data_) = 3;
LABEL_92:
        *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = *(_OWORD *)&v104.__r_.__value_.__r.__words[1];
        uint64_t v94 = v105;
        std::string::size_type v105 = 0LL;
        *(_OWORD *)&v104.__r_.__value_.__r.__words[1] = 0uLL;
      }

      if (SHIBYTE(v90) < 0) {
        operator delete(v89[0]);
      }
      unint64_t v54 = v103;
      __int128 v55 = &v102;
      if ((v103 & 0x80u) != 0)
      {
        unint64_t v54 = v102.n128_u64[1];
        __int128 v55 = (__n128 *)v102.n128_u64[0];
      }

      unint64_t v7 = (__n128 *)((char *)v55 + v54);
      goto LABEL_118;
    }

LABEL_160:
    if (v97)
    {
      v98 = (uint64_t *)v97;
      operator delete(v97);
    }

    if (v101 < 0) {
      operator delete((void *)v100[0]);
    }
    uint64_t v5 = v103;
    if ((v103 & 0x80) == 0) {
      continue;
    }
    break;
  }

LABEL_6:
  if (v7 != (__n128 *)(v102.n128_u64[0] + v102.n128_u64[1])) {
    goto LABEL_7;
  }
  operator delete((void *)v102.n128_u64[0]);
}

void sub_183C0C7B8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, void *a23, uint64_t a24, int a25, __int16 a26, char a27, char a28, uint64_t a29, uint64_t a30, void *a31, uint64_t a32, int a33, __int16 a34, char a35, char a36, uint64_t a37, uint64_t a38, int a39, __int16 a40, char a41, char a42, void *__p, uint64_t a44)
{
  if (__p)
  {
    a44 = (uint64_t)__p;
    operator delete(__p);
  }

  sub_183BF7C68((void ***)&a23);
  _Unwind_Resume(a1);
}

void sub_183C0C904(__int128 *a1@<X1>, void *a2@<X8>)
{
  __int128 v4 = operator new(0x38uLL);
  v4[1] = 0LL;
  v4[2] = 0LL;
  *__int128 v4 = off_189D386C8;
  uint64_t v5 = *((void *)a1 + 2);
  __int128 v6 = *a1;
  *((void *)a1 + 1) = 0LL;
  *((void *)a1 + 2) = 0LL;
  *(void *)a1 = 0LL;
  *((_OWORD *)v4 + 2) = v6;
  v4[6] = v5;
  memset(v7, 0, sizeof(v7));
  v4[3] = off_189D38718;
  unsigned __int8 v8 = (void **)v7;
  sub_183BF7C68(&v8);
  *a2 = v4 + 3;
  a2[1] = v4;
}

void sub_183C0C994(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_189D386C8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_183C0C9A4(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_189D386C8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_183C0C9C4(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 24) + 48LL))(a1 + 24);
}

uint64_t sub_183C0C9D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v3 = *(uint64_t **)(a1 + 8);
  __int128 v4 = *(uint64_t **)(a1 + 16);
  while (v3 != v4)
  {
    uint64_t v7 = *v3;
    v3 += 2;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 16LL))(v7, a2, a3);
  }

  return 1LL;
}

uint64_t sub_183C0CA2C(uint64_t a1)
{
  *(void *)a1 = off_189D37E70;
  unsigned __int8 v3 = (void **)(a1 + 8);
  sub_183BF7C68(&v3);
  return a1;
}

void sub_183C0CA70(char *a1)
{
  *(void *)a1 = off_189D37E70;
  unint64_t v2 = (void **)(a1 + 8);
  sub_183BF7C68(&v2);
  operator delete(a1);
}

void sub_183C0CAB8(__int128 *a1@<X1>, void *a2@<X8>)
{
  __int128 v4 = operator new(0x38uLL);
  v4[1] = 0LL;
  v4[2] = 0LL;
  *__int128 v4 = off_189D38790;
  uint64_t v5 = *((void *)a1 + 2);
  __int128 v6 = *a1;
  *((void *)a1 + 1) = 0LL;
  *((void *)a1 + 2) = 0LL;
  *(void *)a1 = 0LL;
  *((_OWORD *)v4 + 2) = v6;
  v4[6] = v5;
  memset(v7, 0, sizeof(v7));
  v4[3] = off_189D37DD0;
  unsigned __int8 v8 = (void **)v7;
  sub_183BF7C68(&v8);
  *a2 = v4 + 3;
  a2[1] = v4;
}

void sub_183C0CB48(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_189D38790;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_183C0CB58(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_189D38790;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_183C0CB78(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 24) + 48LL))(a1 + 24);
}

void sub_183C0CB88(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_189D387E0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_183C0CB98(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_189D387E0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_183C0CBB8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 24) + 48LL))(a1 + 24);
}

uint64_t sub_183C0CBC8(uint64_t a1)
{
  *(void *)a1 = off_189D37E70;
  unsigned __int8 v3 = (void **)(a1 + 8);
  sub_183BF7C68(&v3);
  return a1;
}

void sub_183C0CC0C(char *a1)
{
  *(void *)a1 = off_189D37E70;
  unint64_t v2 = (void **)(a1 + 8);
  sub_183BF7C68(&v2);
  operator delete(a1);
}

uint64_t sub_183C0CC54(uint64_t a1)
{
  return a1;
}

void sub_183C0CCA4(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = 0LL;
  a3[1] = 0LL;
  a3[2] = 0LL;
  unsigned __int8 v8 = a3;
  if (a1 != a2)
  {
    __int128 v4 = a1;
    do
    {
      uint64_t v5 = *v4;
      if (*(char *)(*v4 + 111) < 0)
      {
        sub_183BFF5D4(__p, *(void **)(v5 + 88), *(void *)(v5 + 96));
      }

      else
      {
        *(_OWORD *)std::string __p = *(_OWORD *)(v5 + 88);
        uint64_t v7 = *(void *)(v5 + 104);
      }

      sub_183C0D090(&v8, (__int128 *)__p);
      if (SHIBYTE(v7) < 0) {
        operator delete(__p[0]);
      }
      ++v4;
    }

    while (v4 != a2);
  }

void sub_183C0CD40( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
}

char *sub_183C0CD70@<X0>(char *result@<X0>, char *a2@<X1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  if (result == a2)
  {
    a4->__r_.__value_.__r.__words[0] = 0LL;
    a4->__r_.__value_.__l.__size_ = 0LL;
    a4->__r_.__value_.__l.__cap_ = 0LL;
  }

  else
  {
    uint64_t v7 = result;
    if (result[23] < 0)
    {
      __n128 result = (char *)sub_183BFF5D4(a4, *(void **)result, *((void *)result + 1));
    }

    else
    {
      __int128 v8 = *(_OWORD *)result;
      a4->__r_.__value_.__l.__cap_ = *((void *)result + 2);
      *(_OWORD *)&a4->__r_.__value_.__l.__data_ = v8;
    }

    for (uint64_t i = v7 + 24; i != a2; i += 24)
    {
      int v10 = *(char *)(a3 + 23);
      if (v10 >= 0) {
        int v11 = (const std::string::value_type *)a3;
      }
      else {
        int v11 = *(const std::string::value_type **)a3;
      }
      if (v10 >= 0) {
        std::string::size_type v12 = *(unsigned __int8 *)(a3 + 23);
      }
      else {
        std::string::size_type v12 = *(void *)(a3 + 8);
      }
      std::string::append(a4, v11, v12);
      int v13 = i[23];
      if (v13 >= 0) {
        unint64_t v14 = i;
      }
      else {
        unint64_t v14 = *(const std::string::value_type **)i;
      }
      if (v13 >= 0) {
        std::string::size_type v15 = i[23];
      }
      else {
        std::string::size_type v15 = *((void *)i + 1);
      }
      __n128 result = (char *)std::string::append(a4, v14, v15);
    }
  }

  return result;
}

void sub_183C0CE2C(_Unwind_Exception *exception_object)
{
}

uint64_t sub_183C0CE4C(char **a1, uint64_t a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(char **)(result - 8);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = (v7 - *a1) >> 4;
    uint64_t v10 = v5 - (void)*a1;
    uint64_t v11 = v10 >> 3;
    else {
      unint64_t v12 = v11;
    }
    uint64_t v25 = result;
    int v13 = (char *)sub_183BF7BDC(result, v12);
    std::string::size_type v15 = &v13[16 * v9];
    *(_OWORD *)std::string::size_type v15 = *(_OWORD *)a2;
    *(void *)a2 = 0LL;
    *(void *)(a2 + 8) = 0LL;
    uint64_t v17 = *a1;
    uint64_t v16 = a1[1];
    if (v16 == *a1)
    {
      int64x2_t v20 = vdupq_n_s64((unint64_t)v16);
      unint64_t v18 = &v13[16 * v9];
    }

    else
    {
      unint64_t v18 = &v13[16 * v9];
      do
      {
        __int128 v19 = *((_OWORD *)v16 - 1);
        v16 -= 16;
        *((_OWORD *)v18 - 1) = v19;
        v18 -= 16;
        *(void *)uint64_t v16 = 0LL;
        *((void *)v16 + 1) = 0LL;
      }

      while (v16 != v17);
      int64x2_t v20 = *(int64x2_t *)a1;
    }

    __int128 v8 = v15 + 16;
    *a1 = v18;
    a1[1] = v15 + 16;
    int64x2_t v23 = v20;
    uint64_t v21 = a1[2];
    a1[2] = &v13[16 * v14];
    uint64_t v24 = v21;
    uint64_t v22 = v20.i64[0];
    uint64_t result = sub_183C08050((uint64_t)&v22);
  }

  else
  {
    *(_OWORD *)uint64_t v7 = *(_OWORD *)a2;
    __int128 v8 = v7 + 16;
    *(void *)a2 = 0LL;
    *(void *)(a2 + 8) = 0LL;
  }

  a1[1] = v8;
  return result;
}

void sub_183C0CF54(void *a1, __int128 *a2)
{
  v14[2] = *MEMORY[0x1895F89C0];
  uint64_t v4 = *a1;
  __int128 v5 = *a2;
  *(void *)(v4 + 16) = *((void *)a2 + 2);
  *(_OWORD *)uint64_t v4 = v5;
  *((_BYTE *)a2 + 23) = 0;
  *(_BYTE *)a2 = 0;
  uint64_t v6 = a1[1];
  __int128 v7 = *(__int128 *)((char *)a2 + 24);
  *(void *)(v6 + 16) = *((void *)a2 + 5);
  *(_OWORD *)uint64_t v6 = v7;
  *((_BYTE *)a2 + 47) = 0;
  *((_BYTE *)a2 + 24) = 0;
  uint64_t v8 = *((void *)a2 + 6);
  v13[0] = *((void *)a2 + 7);
  *(void *)((char *)v13 + 7) = *(void *)((char *)a2 + 63);
  char v9 = *((_BYTE *)a2 + 71);
  *((void *)a2 + 7) = 0LL;
  *((void *)a2 + 8) = 0LL;
  *((void *)a2 + 6) = 0LL;
  v14[0] = v13[0];
  *(void *)((char *)v14 + 7) = *(void *)((char *)v13 + 7);
  uint64_t v10 = a1[2];
  if (*(_DWORD *)v10 == 4)
  {
    unint64_t v12 = (void **)(v10 + 8);
    sub_183C11DE0(&v12);
  }

  else if (*(_DWORD *)v10 == 3 && *(char *)(v10 + 31) < 0)
  {
    operator delete(*(void **)(v10 + 8));
  }

  *(_DWORD *)uint64_t v10 = 3;
  uint64_t v11 = v14[0];
  *(void *)(v10 + 8) = v8;
  *(void *)(v10 + 16) = v11;
  *(void *)(v10 + 23) = *(void *)((char *)v14 + 7);
  *(_BYTE *)(v10 + 31) = v9;
}

uint64_t **sub_183C0D090(uint64_t **a1, __int128 *a2)
{
  uint64_t v4 = *a1;
  unint64_t v5 = (*a1)[1];
  uint64_t v6 = *a1;
  unint64_t v9 = v6[2];
  uint64_t v7 = (uint64_t)(v6 + 2);
  unint64_t v8 = v9;
  if (v5 >= v9)
  {
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *v4) >> 3);
    unint64_t v13 = v12 + 1;
    if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
      sub_183BF77E4();
    }
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - *v4) >> 3);
    if (2 * v14 > v13) {
      unint64_t v13 = 2 * v14;
    }
    if (v14 >= 0x555555555555555LL) {
      unint64_t v15 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v15 = v13;
    }
    v20[4] = v7;
    if (v15) {
      uint64_t v16 = (char *)sub_183BFB0F0(v7, v15);
    }
    else {
      uint64_t v16 = 0LL;
    }
    uint64_t v17 = &v16[24 * v12];
    v20[0] = v16;
    v20[1] = v17;
    void v20[3] = &v16[24 * v15];
    __int128 v18 = *a2;
    *((void *)v17 + 2) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v17 = v18;
    *((void *)a2 + 1) = 0LL;
    *((void *)a2 + 2) = 0LL;
    *(void *)a2 = 0LL;
    v20[2] = v17 + 24;
    sub_183BFF660(v4, v20);
    uint64_t v11 = v4[1];
    sub_183BFF7E8((uint64_t)v20);
  }

  else
  {
    __int128 v10 = *a2;
    *(void *)(v5 + 16) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v5 = v10;
    *((void *)a2 + 1) = 0LL;
    *((void *)a2 + 2) = 0LL;
    *(void *)a2 = 0LL;
    uint64_t v11 = v5 + 24;
    v4[1] = v5 + 24;
  }

  v4[1] = v11;
  return a1;
}

void sub_183C0D1C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_183C0D1D4(std::runtime_error *a1)
{
}

uint64_t sub_183C0D1E8(uint64_t *a1, char *a2, uint64_t a3, int *a4)
{
  unint64_t v5 = 0xEEEEEEEEEEEEEEEFLL * ((a1[1] - *a1) >> 3);
  unint64_t v6 = v5 + 1;
  if (v5 + 1 > 0x222222222222222LL) {
    sub_183BF77E4();
  }
  if (0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3) > v6) {
    unint64_t v6 = 0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3);
  }
  if (0xEEEEEEEEEEEEEEEFLL * ((a1[2] - *a1) >> 3) >= 0x111111111111111LL) {
    unint64_t v10 = 0x222222222222222LL;
  }
  else {
    unint64_t v10 = v6;
  }
  __int128 v18 = a1 + 2;
  if (v10) {
    uint64_t v11 = (char *)sub_183C08B28((uint64_t)(a1 + 2), v10);
  }
  else {
    uint64_t v11 = 0LL;
  }
  unint64_t v14 = v11;
  unint64_t v15 = &v11[120 * v5];
  uint64_t v17 = &v11[120 * v10];
  sub_183C0D30C((_DWORD)a1 + 16, (uint64_t)v15, a2, a3, a4);
  uint64_t v16 = v15 + 120;
  sub_183C08AB4(a1, &v14);
  uint64_t v12 = a1[1];
  sub_183C08D2C(&v14);
  return v12;
}

void sub_183C0D2F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_183C0D30C(int a1, uint64_t a2, char *__s, uint64_t a4, int *a5)
{
  if (*(char *)(a4 + 23) < 0)
  {
    sub_183BFF5D4(__dst, *(void **)a4, *(void *)(a4 + 8));
  }

  else
  {
    *(_OWORD *)std::string __dst = *(_OWORD *)a4;
    uint64_t v13 = *(void *)(a4 + 16);
  }

  int v8 = *a5;
  int v9 = 1;
  LOBYTE(__p) = 0;
  sub_183C08DA0(a2, (__int128 *)v14, (__int128 *)__dst, v8, (uint64_t)&v9);
  if (v9 == 4)
  {
    p_p = &__p;
    sub_183C11DE0(&p_p);
  }

  else if (v9 == 3 && v11 < 0)
  {
    operator delete(__p);
  }

  if (SHIBYTE(v13) < 0) {
    operator delete(__dst[0]);
  }
  if (v15 < 0) {
    operator delete(v14[0]);
  }
}

void sub_183C0D3F4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *__p, uint64_t a21, int a22, __int16 a23, char a24, char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_183C0D430@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0x90uLL);
  uint64_t result = sub_183C0D488(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_183C0D474(_Unwind_Exception *a1)
{
}

void *sub_183C0D488(void *a1, uint64_t a2)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_189D388D0;
  sub_183C0D528((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_183C0D4BC(_Unwind_Exception *a1)
{
}

void sub_183C0D4D0(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_189D388D0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_183C0D4E0(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_189D388D0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void sub_183C0D500(uint64_t a1)
{
}

uint64_t sub_183C0D528(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_183C0D5F4(a1, a2);
  *(void *)uint64_t v4 = off_189D385E8;
  if (*(char *)(a2 + 87) < 0)
  {
    sub_183BFF5D4((_BYTE *)(v4 + 64), *(void **)(a2 + 64), *(void *)(a2 + 72));
  }

  else
  {
    __int128 v5 = *(_OWORD *)(a2 + 64);
    *(void *)(v4 + 80) = *(void *)(a2 + 80);
    *(_OWORD *)(v4 + 64) = v5;
  }

  unint64_t v6 = (_BYTE *)(a1 + 88);
  if (*(char *)(a2 + 111) < 0)
  {
    sub_183BFF5D4(v6, *(void **)(a2 + 88), *(void *)(a2 + 96));
  }

  else
  {
    __int128 v7 = *(_OWORD *)(a2 + 88);
    *(void *)(a1 + 104) = *(void *)(a2 + 104);
    *(_OWORD *)unint64_t v6 = v7;
  }

  *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
  return a1;
}

void sub_183C0D5C8(_Unwind_Exception *a1)
{
}

uint64_t sub_183C0D5F4(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_189D38670;
  if (*(char *)(a2 + 31) < 0)
  {
    sub_183BFF5D4((_BYTE *)(a1 + 8), *(void **)(a2 + 8), *(void *)(a2 + 16));
  }

  else
  {
    __int128 v4 = *(_OWORD *)(a2 + 8);
    *(void *)(a1 + 24) = *(void *)(a2 + 24);
    *(_OWORD *)(a1 + 8) = v4;
  }

  int v5 = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 32) = v5;
  unint64_t v6 = (char *)(a1 + 40);
  switch(v5)
  {
    case 1:
      *unint64_t v6 = *(_BYTE *)(a2 + 40);
      break;
    case 2:
      *(void *)unint64_t v6 = *(void *)(a2 + 40);
      break;
    case 3:
      if (*(char *)(a2 + 63) < 0)
      {
        sub_183BFF5D4(v6, *(void **)(a2 + 40), *(void *)(a2 + 48));
      }

      else
      {
        __int128 v7 = *(_OWORD *)(a2 + 40);
        *(void *)(a1 + 56) = *(void *)(a2 + 56);
        *(_OWORD *)unint64_t v6 = v7;
      }

      break;
    case 4:
      *(void *)unint64_t v6 = 0LL;
      *(void *)(a1 + 48) = 0LL;
      *(void *)(a1 + 56) = 0LL;
      sub_183C11D5C( v6,  *(__int128 **)(a2 + 40),  *(__int128 **)(a2 + 48),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 48) - *(void *)(a2 + 40)) >> 3));
      break;
    default:
      return a1;
  }

  return a1;
}

void sub_183C0D6F4(_Unwind_Exception *exception_object)
{
}

void *sub_183C0D710@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  __int128 v4 = operator new(0x90uLL);
  uint64_t result = sub_183C0D768(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_183C0D754(_Unwind_Exception *a1)
{
}

void *sub_183C0D768(void *a1, uint64_t a2)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_189D388D0;
  sub_183C0D528((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_183C0D79C(_Unwind_Exception *a1)
{
}

uint64_t sub_183C0D7B0(uint64_t *a1, uint64_t a2, char *a3, int *a4)
{
  unint64_t v5 = 0xEEEEEEEEEEEEEEEFLL * ((a1[1] - *a1) >> 3);
  unint64_t v6 = v5 + 1;
  if (v5 + 1 > 0x222222222222222LL) {
    sub_183BF77E4();
  }
  if (0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3) > v6) {
    unint64_t v6 = 0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3);
  }
  if (0xEEEEEEEEEEEEEEEFLL * ((a1[2] - *a1) >> 3) >= 0x111111111111111LL) {
    unint64_t v10 = 0x222222222222222LL;
  }
  else {
    unint64_t v10 = v6;
  }
  __int128 v18 = a1 + 2;
  if (v10) {
    char v11 = (char *)sub_183C08B28((uint64_t)(a1 + 2), v10);
  }
  else {
    char v11 = 0LL;
  }
  unint64_t v14 = v11;
  char v15 = &v11[120 * v5];
  uint64_t v17 = &v11[120 * v10];
  sub_183C0D8D4((_DWORD)a1 + 16, (uint64_t)v15, a2, a3, a4);
  uint64_t v16 = v15 + 120;
  sub_183C08AB4(a1, &v14);
  uint64_t v12 = a1[1];
  sub_183C08D2C(&v14);
  return v12;
}

void sub_183C0D8C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_183C0D8D4(int a1, uint64_t a2, uint64_t a3, char *__s, int *a5)
{
  if (*(char *)(a3 + 23) < 0)
  {
    sub_183BFF5D4(__dst, *(void **)a3, *(void *)(a3 + 8));
  }

  else
  {
    *(_OWORD *)std::string __dst = *(_OWORD *)a3;
    uint64_t v15 = *(void *)(a3 + 16);
  }

  sub_183C11CAC(v12, __s);
  int v8 = *a5;
  int v9 = 1;
  LOBYTE(__p) = 0;
  sub_183C08DA0(a2, (__int128 *)__dst, (__int128 *)v12, v8, (uint64_t)&v9);
  if (v9 == 4)
  {
    p_p = &__p;
    sub_183C11DE0(&p_p);
  }

  else if (v9 == 3 && v11 < 0)
  {
    operator delete(__p);
  }

  if (v13 < 0) {
    operator delete(v12[0]);
  }
  if (SHIBYTE(v15) < 0) {
    operator delete(__dst[0]);
  }
}

void sub_183C0D9BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20, uint64_t a21, int a22, __int16 a23, char a24, char a25)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  _Unwind_Resume(a1);
}

void *sub_183C0D9F8@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  __int128 v4 = operator new(0x58uLL);
  uint64_t result = sub_183C0DA50(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_183C0DA3C(_Unwind_Exception *a1)
{
}

void *sub_183C0DA50(void *a1, uint64_t a2)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_189D38920;
  sub_183C0DAEC((uint64_t)&v4, (uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_183C0DA98(_Unwind_Exception *a1)
{
}

void sub_183C0DAAC(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_189D38920;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_183C0DABC(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_189D38920;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_183C0DADC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 24) + 48LL))(a1 + 24);
}

void sub_183C0DAEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)__int128 v7 = *(_OWORD *)a3;
  uint64_t v8 = *(void *)(a3 + 16);
  *(void *)(a3 + 8) = 0LL;
  *(void *)(a3 + 16) = 0LL;
  *(void *)a3 = 0LL;
  int v4 = 0;
  sub_183C08FE8(a2, (__n128 *)v7, &v4);
  *unsigned __int8 v3 = off_189D38970;
  if (v4 == 4)
  {
    p_p = &__p;
    sub_183C11DE0(&p_p);
  }

  else if (v4 == 3 && v6 < 0)
  {
    operator delete(__p);
  }

  if (SHIBYTE(v8) < 0) {
    operator delete(v7[0]);
  }
}

uint64_t sub_183C0DB90(uint64_t a1)
{
  *(void *)a1 = off_189D38670;
  int v2 = *(_DWORD *)(a1 + 32);
  if (v2 == 4)
  {
    int v4 = (void **)(a1 + 40);
    sub_183C11DE0(&v4);
  }

  else if (v2 == 3 && *(char *)(a1 + 63) < 0)
  {
    operator delete(*(void **)(a1 + 40));
  }

  return a1;
}

void sub_183C0DC0C(char *__p)
{
  *(void *)std::string __p = off_189D38670;
  int v2 = *((_DWORD *)__p + 8);
  if (v2 == 4)
  {
    unsigned __int8 v3 = (void **)(__p + 40);
    sub_183C11DE0(&v3);
  }

  else if (v2 == 3 && __p[63] < 0)
  {
    operator delete(*((void **)__p + 5));
  }

  if (__p[31] < 0) {
    operator delete(*((void **)__p + 1));
  }
  operator delete(__p);
}

void sub_183C0DC8C(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = 0LL;
  a3[1] = 0LL;
  a3[2] = 0LL;
  int v4 = *(const void ***)a2;
  uint64_t v5 = *(void *)(a2 + 8) - *(void *)a2;
  if (v5)
  {
    uint64_t v7 = 0LL;
    unint64_t v8 = v5 >> 4;
    if (v8 <= 1) {
      uint64_t v9 = 1LL;
    }
    else {
      uint64_t v9 = v8;
    }
    while (1)
    {
      if (*v4)
      {
        unint64_t v10 = __dynamic_cast( *v4,  (const struct __class_type_info *)&unk_189D37E20,  (const struct __class_type_info *)&unk_189D389B8,  0LL);
        if (v10) {
          break;
        }
      }

      ++v7;
      v4 += 2;
      if (v9 == v7) {
        return;
      }
    }

    char v11 = v10;
    *a3 = v7;
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 24LL))(a1);
    sub_183C0DDB4(v12, (uint64_t)v11 + 32, &v16);
    sub_183C07FEC((uint64_t)(a3 + 1), &v16);
    char v13 = (std::__shared_weak_count *)*((void *)&v16 + 1);
    if (*((void *)&v16 + 1))
    {
      unint64_t v14 = (unint64_t *)(*((void *)&v16 + 1) + 8LL);
      do
        unint64_t v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }

void sub_183C0DDA0(_Unwind_Exception *a1)
{
}

void *sub_183C0DDB4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, void *a3@<X8>)
{
  char v6 = operator new(0x58uLL);
  uint64_t result = sub_183C0DE14(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_183C0DE00(_Unwind_Exception *a1)
{
}

void *sub_183C0DE14(void *a1, uint64_t a2, uint64_t a3)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_189D38920;
  sub_183C0DE74((uint64_t)&v5, a1 + 3, a2, a3);
  return a1;
}

void sub_183C0DE60(_Unwind_Exception *a1)
{
}

void sub_183C0DE74(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (*(char *)(a3 + 23) < 0)
  {
    sub_183BFF5D4(__dst, *(void **)a3, *(void *)(a3 + 8));
  }

  else
  {
    *(_OWORD *)std::string __dst = *(_OWORD *)a3;
    uint64_t v10 = *(void *)(a3 + 16);
  }

  int v6 = *(_DWORD *)a4;
  switch(v6)
  {
    case 1:
      LOBYTE(__p) = *(_BYTE *)(a4 + 8);
      break;
    case 2:
      *(void *)&__int128 __p = *(void *)(a4 + 8);
      break;
    case 3:
      if (*(char *)(a4 + 31) < 0)
      {
        sub_183BFF5D4(&__p, *(void **)(a4 + 8), *(void *)(a4 + 16));
      }

      else
      {
        __int128 __p = *(_OWORD *)(a4 + 8);
        uint64_t v8 = *(void *)(a4 + 24);
      }

      break;
    case 4:
      __int128 __p = 0uLL;
      uint64_t v8 = 0LL;
      sub_183C11D5C( (char *)&__p,  *(__int128 **)(a4 + 8),  *(__int128 **)(a4 + 16),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a4 + 16) - *(void *)(a4 + 8)) >> 3));
      break;
    default:
      break;
  }

  sub_183C08FE8((uint64_t)a2, (__n128 *)__dst, &v6);
  *a2 = off_189D38970;
  if (v6 == 4)
  {
    p_p = (void **)&__p;
    sub_183C11DE0(&p_p);
  }

  else if (v6 == 3 && SHIBYTE(v8) < 0)
  {
    operator delete((void *)__p);
  }

  if (SHIBYTE(v10) < 0) {
    operator delete(__dst[0]);
  }
}

void sub_183C0DFD0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_183C0DFEC@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  int v4 = operator new(0x58uLL);
  uint64_t result = sub_183C0E044(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_183C0E030(_Unwind_Exception *a1)
{
}

void *sub_183C0E044(void *a1, uint64_t a2)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_189D389E0;
  sub_183C0E0E0((uint64_t)&v4, a1 + 3, a2);
  return a1;
}

void sub_183C0E08C(_Unwind_Exception *a1)
{
}

void sub_183C0E0A0(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_189D389E0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_183C0E0B0(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_189D389E0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_183C0E0D0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 24) + 48LL))(a1 + 24);
}

void sub_183C0E0E0(uint64_t a1, void *a2, uint64_t a3)
{
  *(_OWORD *)int v6 = *(_OWORD *)a3;
  uint64_t v7 = *(void *)(a3 + 16);
  *(void *)(a3 + sub_183BF7C10(v1 + 8) = 0LL;
  *(void *)(a3 + 16) = 0LL;
  *(void *)a3 = 0LL;
  int v3 = 1;
  LOBYTE(__p) = 0;
  sub_183C0E180(a2, (uint64_t)v6, (uint64_t)&v3);
  if (v3 == 4)
  {
    p_p = &__p;
    sub_183C11DE0(&p_p);
  }

  else if (v3 == 3 && v5 < 0)
  {
    operator delete(__p);
  }

  if (SHIBYTE(v7) < 0) {
    operator delete(v6[0]);
  }
}

void *sub_183C0E180(void *a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)uint64_t v8 = *(_OWORD *)a2;
  uint64_t v9 = *(void *)(a2 + 16);
  *(void *)(a2 + sub_183BF7C10(v1 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *(void *)a2 = 0LL;
  int v5 = *(_DWORD *)a3;
  switch(v5)
  {
    case 1:
      LOBYTE(__p[0]) = *(_BYTE *)(a3 + 8);
      break;
    case 2:
      __p[0] = *(void **)(a3 + 8);
      break;
    case 3:
      *(_OWORD *)__int128 __p = *(_OWORD *)(a3 + 8);
      uint64_t v7 = *(void *)(a3 + 24);
      goto LABEL_6;
    case 4:
      *(_OWORD *)__int128 __p = *(_OWORD *)(a3 + 8);
      uint64_t v7 = *(void *)(a3 + 24);
LABEL_6:
      *(void *)(a3 + 16) = 0LL;
      *(void *)(a3 + 24) = 0LL;
      *(void *)(a3 + sub_183BF7C10(v1 + 8) = 0LL;
      break;
    default:
      break;
  }

  sub_183C08FE8((uint64_t)a1, (__n128 *)v8, &v5);
  *a1 = off_189D38970;
  if (v5 == 4)
  {
    uint64_t v10 = __p;
    sub_183C11DE0(&v10);
  }

  else if (v5 == 3 && SHIBYTE(v7) < 0)
  {
    operator delete(__p[0]);
  }

  if (SHIBYTE(v9) < 0) {
    operator delete(v8[0]);
  }
  *a1 = off_189D38A30;
  return a1;
}

uint64_t sub_183C0E2A4(uint64_t a1)
{
  *(void *)a1 = off_189D38670;
  int v2 = *(_DWORD *)(a1 + 32);
  if (v2 == 4)
  {
    char v4 = (void **)(a1 + 40);
    sub_183C11DE0(&v4);
  }

  else if (v2 == 3 && *(char *)(a1 + 63) < 0)
  {
    operator delete(*(void **)(a1 + 40));
  }

  return a1;
}

void sub_183C0E320(char *__p)
{
  *(void *)__int128 __p = off_189D38670;
  int v2 = *((_DWORD *)__p + 8);
  if (v2 == 4)
  {
    int v3 = (void **)(__p + 40);
    sub_183C11DE0(&v3);
  }

  else if (v2 == 3 && __p[63] < 0)
  {
    operator delete(*((void **)__p + 5));
  }

  if (__p[31] < 0) {
    operator delete(*((void **)__p + 1));
  }
  operator delete(__p);
}

void sub_183C0E3A0(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = 0LL;
  a3[1] = 0LL;
  a3[2] = 0LL;
  char v4 = *(const void ***)a2;
  uint64_t v5 = *(void *)(a2 + 8) - *(void *)a2;
  if (v5)
  {
    uint64_t v7 = 0LL;
    unint64_t v8 = v5 >> 4;
    if (v8 <= 1) {
      uint64_t v9 = 1LL;
    }
    else {
      uint64_t v9 = v8;
    }
    while (1)
    {
      if (*v4)
      {
        uint64_t v10 = (unsigned __int8 *)__dynamic_cast( *v4,  (const struct __class_type_info *)&unk_189D37E20,  (const struct __class_type_info *)&unk_189D389B8,  0LL);
        if (v10) {
          break;
        }
      }

      ++v7;
      v4 += 2;
      if (v9 == v7) {
        return;
      }
    }

    char v11 = v10;
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 24LL))(a1);
    if (*(char *)(v12 + 23) < 0)
    {
      sub_183BFF5D4(__dst, *(void **)v12, *(void *)(v12 + 8));
    }

    else
    {
      __int128 v14 = *(_OWORD *)v12;
      uint64_t v36 = *(void *)(v12 + 16);
      *(_OWORD *)std::string __dst = v14;
    }

    int v37 = 3;
    *(_OWORD *)__int128 __p = *(_OWORD *)__dst;
    uint64_t v39 = v36;
    __dst[0] = 0LL;
    __dst[1] = 0LL;
    uint64_t v36 = 0LL;
    if (*((_DWORD *)v11 + 8) != 3) {
      goto LABEL_31;
    }
    if (v39 >= 0) {
      unint64_t v15 = (void *)HIBYTE(v39);
    }
    else {
      unint64_t v15 = __p[1];
    }
    __int128 v16 = (void *)v11[63];
    int v17 = (char)v16;
    if (v15 == v16)
    {
      int64x2_t v20 = (unsigned __int8 *)*((void *)v11 + 5);
      __int128 v19 = v11 + 40;
      __int128 v18 = v20;
      if (v17 >= 0) {
        char v13 = v19;
      }
      else {
        char v13 = v18;
      }
      if (v39 < 0)
      {
        BOOL v29 = memcmp(__p[0], v13, (size_t)__p[1]) == 0;
      }

      else if (HIBYTE(v39))
      {
        uint64_t v21 = __p;
        uint64_t v22 = HIBYTE(v39) - 1LL;
        do
        {
          int v24 = *(unsigned __int8 *)v21;
          uint64_t v21 = (void **)((char *)v21 + 1);
          int v23 = v24;
          int v26 = *v13++;
          int v25 = v26;
          BOOL v28 = v22-- != 0;
          BOOL v29 = v23 == v25;
        }

        while (v23 == v25 && v28);
      }

      else
      {
        BOOL v29 = 1;
      }
    }

    else
    {
LABEL_31:
      BOOL v29 = 0;
    }

    if (SHIBYTE(v39) < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v36) < 0)
    {
      operator delete(__dst[0]);
      if (!v29) {
        return;
      }
    }

    else if (!v29)
    {
      return;
    }

    *a3 = v7;
    uint64_t v30 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(void *)a1 + 24LL))(a1, v13);
    int v37 = 1;
    LOBYTE(__p[0]) = 1;
    sub_183C0E648(v30, &v37, &v34);
    sub_183C07FEC((uint64_t)(a3 + 1), &v34);
    __n128 v31 = (std::__shared_weak_count *)*((void *)&v34 + 1);
    if (*((void *)&v34 + 1))
    {
      unint64_t v32 = (unint64_t *)(*((void *)&v34 + 1) + 8LL);
      do
        unint64_t v33 = __ldaxr(v32);
      while (__stlxr(v33 - 1, v32));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
    }

    if (v37 == 4)
    {
      unint64_t v40 = __p;
      sub_183C11DE0(&v40);
    }

    else if (v37 == 3 && SHIBYTE(v39) < 0)
    {
      operator delete(__p[0]);
    }
  }

void sub_183C0E620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

void *sub_183C0E648@<X0>(uint64_t a1@<X1>, int *a2@<X2>, void *a3@<X8>)
{
  uint64_t v6 = operator new(0x58uLL);
  uint64_t result = sub_183C0E6A8(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_183C0E694(_Unwind_Exception *a1)
{
}

void *sub_183C0E6A8(void *a1, uint64_t a2, int *a3)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_189D389E0;
  sub_183C0E708((uint64_t)&v5, a1 + 3, a2, a3);
  return a1;
}

void sub_183C0E6F4(_Unwind_Exception *a1)
{
}

void sub_183C0E708(uint64_t a1, void *a2, uint64_t a3, int *a4)
{
  if (*(char *)(a3 + 23) < 0)
  {
    sub_183BFF5D4(__dst, *(void **)a3, *(void *)(a3 + 8));
  }

  else
  {
    *(_OWORD *)std::string __dst = *(_OWORD *)a3;
    uint64_t v10 = *(void *)(a3 + 16);
  }

  int v6 = *a4;
  switch(v6)
  {
    case 1:
      LOBYTE(__p[0]) = *((_BYTE *)a4 + 8);
      break;
    case 2:
      __p[0] = *((void **)a4 + 1);
      break;
    case 3:
      *(_OWORD *)__int128 __p = *(_OWORD *)(a4 + 2);
      uint64_t v8 = *((void *)a4 + 3);
      goto LABEL_9;
    case 4:
      *(_OWORD *)__int128 __p = *(_OWORD *)(a4 + 2);
      uint64_t v8 = *((void *)a4 + 3);
LABEL_9:
      *((void *)a4 + 2) = 0LL;
      *((void *)a4 + 3) = 0LL;
      *((void *)a4 + 1) = 0LL;
      break;
    default:
      break;
  }

  sub_183C0E180(a2, (uint64_t)__dst, (uint64_t)&v6);
  if (v6 == 4)
  {
    char v11 = __p;
    sub_183C11DE0(&v11);
  }

  else if (v6 == 3 && SHIBYTE(v8) < 0)
  {
    operator delete(__p[0]);
  }

  if (SHIBYTE(v10) < 0) {
    operator delete(__dst[0]);
  }
}

void sub_183C0E82C(__int128 *a1@<X1>, void *a2@<X8>)
{
  char v4 = operator new(0x38uLL);
  v4[1] = 0LL;
  v4[2] = 0LL;
  *char v4 = off_189D38AA0;
  uint64_t v5 = *((void *)a1 + 2);
  __int128 v6 = *a1;
  *((void *)a1 + 1) = 0LL;
  *((void *)a1 + 2) = 0LL;
  *(void *)a1 = 0LL;
  *((_OWORD *)v4 + 2) = v6;
  v4[6] = v5;
  memset(v7, 0, sizeof(v7));
  v4[3] = off_189D38AF0;
  uint64_t v8 = (void **)v7;
  sub_183BF7C68(&v8);
  *a2 = v4 + 3;
  a2[1] = v4;
}

void sub_183C0E8BC(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_189D38AA0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_183C0E8CC(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_189D38AA0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_183C0E8EC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 24) + 48LL))(a1 + 24);
}

BOOL sub_183C0E8FC(uint64_t a1, void **a2, void **a3)
{
  __int128 v19 = 0uLL;
  int64x2_t v20 = 0LL;
  sub_183BF7AFC((char *)&v19, *a2, a2[1], ((_BYTE *)a2[1] - (_BYTE *)*a2) >> 4);
  __int128 v17 = 0uLL;
  __int128 v18 = 0LL;
  sub_183BF7CD8((char *)&v17, *a3, a3[1], ((_BYTE *)a3[1] - (_BYTE *)*a3) >> 4);
  uint64_t v6 = 0LL;
  __int128 v14 = 0LL;
  uint64_t v15 = 0LL;
  char v7 = 1;
  char v8 = 1;
  uint64_t v16 = 0LL;
  while ((v7 & 1) != 0)
  {
    unsigned int v9 = (*(uint64_t (**)(void, __int128 *, __int128 *))(***(void ***)(a1 + 8) + 16LL))( **(void **)(a1 + 8),  &v19,  &v17);
    char v7 = v9;
    v6 += v9;
    uint64_t v10 = *((void *)&v19 + 1) - v19;
    if ((v8 & 1) == 0)
    {
      char v11 = v14;
      if (v10 == v15 - (void)v14)
      {
        if ((void)v19 == *((void *)&v19 + 1)) {
          break;
        }
        uint64_t v12 = (void **)v19;
        while (*v12 == *v11)
        {
          v12 += 2;
          v11 += 2;
        }
      }
    }

    sub_183C0EB60((uint64_t)&v14, (uint64_t *)v19, *((uint64_t **)&v19 + 1), v10 >> 4);
    char v8 = 0;
  }

LABEL_11:
  if (v6)
  {
    sub_183BF7D78(a2);
    *(_OWORD *)a2 = v19;
    a2[2] = v20;
    int64x2_t v20 = 0LL;
    __int128 v19 = 0uLL;
    sub_183BF7D78(a3);
    *(_OWORD *)a3 = v17;
    a3[2] = v18;
    __int128 v18 = 0LL;
    __int128 v17 = 0uLL;
  }

  uint64_t v21 = &v14;
  sub_183BF7C68((void ***)&v21);
  __int128 v14 = (void **)&v17;
  sub_183BF7C68(&v14);
  *(void *)&__int128 v17 = &v19;
  sub_183BF7C68((void ***)&v17);
  return v6 != 0;
}

void sub_183C0EA90( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  a13 = (void **)&a17;
  sub_183BF7C68(&a13);
  _Unwind_Resume(a1);
}

uint64_t sub_183C0EAD4(uint64_t a1)
{
  *(void *)a1 = off_189D37E70;
  int v3 = (void **)(a1 + 8);
  sub_183BF7C68(&v3);
  return a1;
}

void sub_183C0EB18(char *a1)
{
  *(void *)a1 = off_189D37E70;
  int v2 = (void **)(a1 + 8);
  sub_183BF7C68(&v2);
  operator delete(a1);
}

uint64_t sub_183C0EB60(uint64_t a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  char v8 = *(uint64_t **)a1;
  if (a4 > (uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 4)
  {
    sub_183BF7D78((void **)a1);
    if (a4 >> 60) {
      sub_183BF77E4();
    }
    uint64_t v9 = *(void *)(a1 + 16) - *(void *)a1;
    uint64_t v10 = v9 >> 3;
    if (v9 >> 3 <= a4) {
      uint64_t v10 = a4;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t result = (uint64_t)sub_183BF7B9C((void *)a1, v11);
    char v13 = *(uint64_t **)(a1 + 8);
    while (v6 != a3)
    {
      uint64_t v14 = v6[1];
      uint64_t *v13 = *v6;
      v13[1] = v14;
      if (v14)
      {
        uint64_t v15 = (unint64_t *)(v14 + 8);
        do
          unint64_t v16 = __ldxr(v15);
        while (__stxr(v16 + 1, v15));
      }

      v6 += 2;
      v13 += 2;
    }

LABEL_25:
    *(void *)(a1 + sub_183BF7C10(v6 + 8) = v13;
    return result;
  }

  uint64_t result = *(void *)(a1 + 8);
  unint64_t v17 = (result - (uint64_t)v8) >> 4;
  if (v17 < a4)
  {
    __int128 v18 = &a2[2 * v17];
    if ((uint64_t *)result != v8)
    {
      uint64_t v19 = 16 * v17;
      do
      {
        uint64_t result = (uint64_t)sub_183BF7DD4(v8, v6);
        v6 += 2;
        v8 += 2;
        v19 -= 16LL;
      }

      while (v19);
      char v8 = *(uint64_t **)(a1 + 8);
    }

    char v13 = v8;
    if (v18 != a3)
    {
      char v13 = v8;
      do
      {
        uint64_t v20 = v18[1];
        uint64_t *v13 = *v18;
        v13[1] = v20;
        if (v20)
        {
          uint64_t v21 = (unint64_t *)(v20 + 8);
          do
            unint64_t v22 = __ldxr(v21);
          while (__stxr(v22 + 1, v21));
        }

        v18 += 2;
        v13 += 2;
      }

      while (v18 != a3);
    }

    goto LABEL_25;
  }

  if (a2 == a3)
  {
    int v23 = v8;
  }

  else
  {
    int v23 = v8;
    do
    {
      sub_183BF7DD4(v8, v6);
      v6 += 2;
      v8 += 2;
      v23 += 2;
    }

    while (v6 != a3);
    uint64_t result = *(void *)(a1 + 8);
  }

  *(void *)(a1 + sub_183BF7C10(v6 + 8) = v23;
  return result;
}

      int v3 = -1LL;
      uint64_t v14 = -1LL;
LABEL_26:
      std::string::basic_string(&__p, a1, v11, v14, (std::allocator<char> *)v28);
      unint64_t v16 = a3[1];
      uint64_t v15 = a3[2];
      if (v16 >= v15)
      {
        __int128 v18 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16 - *a3) >> 3);
        uint64_t v19 = v18 + 1;
        if (v18 + 1 > 0xAAAAAAAAAAAAAAALL) {
          sub_183BF77E4();
        }
        uint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v15 - *a3) >> 3);
        if (2 * v20 > v19) {
          uint64_t v19 = 2 * v20;
        }
        uint64_t v21 = v20 >= 0x555555555555555LL ? 0xAAAAAAAAAAAAAAALL : v19;
        v28[4] = v6;
        unint64_t v22 = v21 ? (char *)sub_183BFB0F0(v6, v21) : 0LL;
        int v23 = &v22[24 * v18];
        v28[0] = v22;
        v28[1] = v23;
        v28[3] = &v22[24 * v21];
        int v24 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        *((void *)v23 + 2) = __p.__r_.__value_.__l.__cap_;
        *(_OWORD *)int v23 = v24;
        memset(&__p, 0, sizeof(__p));
        v28[2] = v23 + 24;
        sub_183BFF660(a3, v28);
        int v25 = a3[1];
        sub_183BFF7E8((uint64_t)v28);
        int v26 = (char)__p.__r_.__value_.__s.__size_;
        a3[1] = v25;
        if (v26 < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }

      else
      {
        unint64_t v17 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        *(void *)(v16 + 16) = __p.__r_.__value_.__l.__cap_;
        *(_OWORD *)unint64_t v16 = v17;
        a3[1] = v16 + 24;
      }
    }

    while (v3 != -1LL);
  }

void sub_183C0ED10()
{
}

void sub_183C0ED24(__int128 *a1@<X1>, void *a2@<X8>)
{
  char v4 = operator new(0x38uLL);
  v4[1] = 0LL;
  v4[2] = 0LL;
  *char v4 = off_189D38B68;
  uint64_t v5 = *((void *)a1 + 2);
  __int128 v6 = *a1;
  *((void *)a1 + 1) = 0LL;
  *((void *)a1 + 2) = 0LL;
  *(void *)a1 = 0LL;
  *((_OWORD *)v4 + 2) = v6;
  v4[6] = v5;
  memset(v7, 0, sizeof(v7));
  v4[3] = off_189D38BB8;
  char v8 = (void **)v7;
  sub_183BF7C68(&v8);
  *a2 = v4 + 3;
  a2[1] = v4;
}

void sub_183C0EDB4(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_189D38B68;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_183C0EDC4(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_189D38B68;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_183C0EDE4(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)(a1 + 24) + 48LL))(a1 + 24);
}

uint64_t sub_183C0EDF4(uint64_t a1, void **a2, void **a3)
{
  __int128 v18 = 0LL;
  uint64_t v19 = 0LL;
  unint64_t v20 = 0LL;
  int v3 = *(void **)(a1 + 8);
  char v4 = *(void **)(a1 + 16);
  if (v3 == v4) {
    goto LABEL_16;
  }
  do
  {
    __int128 v16 = 0uLL;
    uint64_t v17 = 0LL;
    sub_183BF7AFC((char *)&v16, *a2, a2[1], ((char *)a2[1] - (char *)*a2) >> 4);
    __int128 v14 = 0uLL;
    uint64_t v15 = 0LL;
    sub_183BF7CD8((char *)&v14, *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
    if ((*(unsigned int (**)(void, __int128 *, __int128 *))(*(void *)*v3 + 16LL))(*v3, &v16, &v14))
    {
      char v7 = v19;
      if ((unint64_t)v19 >= v20)
      {
        uint64_t v8 = sub_183C0F0E4((uint64_t *)&v18, (uint64_t)&v16, (uint64_t)&v14);
      }

      else
      {
        *uint64_t v19 = 0LL;
        v7[1] = 0LL;
        v7[2] = 0LL;
        *(_OWORD *)char v7 = v16;
        v7[2] = v17;
        __int128 v16 = 0uLL;
        uint64_t v17 = 0LL;
        *(_OWORD *)(v7 + 3) = v14;
        v7[5] = v15;
        __int128 v14 = 0uLL;
        uint64_t v15 = 0LL;
        uint64_t v8 = (uint64_t)(v7 + 6);
      }

      uint64_t v19 = (uint64_t *)v8;
    }

    uint64_t v21 = (void **)&v14;
    sub_183BF7C68(&v21);
    *(void *)&__int128 v14 = &v16;
    sub_183BF7C68((void ***)&v14);
    v3 += 2;
  }

  while (v3 != v4);
  uint64_t v9 = (uint64_t)v18;
  if (v18 != v19)
  {
    uint64_t v10 = v18 + 6;
    if (v18 + 6 != v19)
    {
      uint64_t v11 = *v18;
      do
      {
        if (v10[1] - *v10 < (unint64_t)(*(void *)(v9 + 8) - v11))
        {
          uint64_t v11 = *v10;
          uint64_t v9 = (uint64_t)v10;
        }

        v10 += 6;
      }

      while (v10 != v19);
    }
  }

  if ((uint64_t *)v9 == v19)
  {
LABEL_16:
    uint64_t v12 = 0LL;
  }

  else
  {
    *(void *)&__int128 v16 = a2;
    *((void *)&v16 + 1) = a3;
    sub_183C0F070((uint64_t)&v16, v9);
    uint64_t v12 = 1LL;
  }

  *(void *)&__int128 v16 = &v18;
  sub_183C0F500((void ***)&v16);
  return v12;
}

void sub_183C0EF98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void ***a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  a9 = &a13;
  sub_183BF7C68((void ***)&a9);
  a13 = (void **)&a17;
  sub_183C0F500(&a13);
  _Unwind_Resume(a1);
}

uint64_t sub_183C0EFE4(uint64_t a1)
{
  *(void *)a1 = off_189D37E70;
  int v3 = (void **)(a1 + 8);
  sub_183BF7C68(&v3);
  return a1;
}

void sub_183C0F028(char *a1)
{
  *(void *)a1 = off_189D37E70;
  int v2 = (void **)(a1 + 8);
  sub_183BF7C68(&v2);
  operator delete(a1);
}

uint64_t sub_183C0F070(uint64_t a1, uint64_t a2)
{
  char v4 = *(void ***)a1;
  sub_183BF7D78(*(void ***)a1);
  *(_OWORD *)char v4 = *(_OWORD *)a2;
  v4[2] = *(void **)(a2 + 16);
  *(void *)a2 = 0LL;
  *(void *)(a2 + sub_183BF7C10(v6 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  uint64_t v5 = *(void *)(a1 + 8);
  sub_183BF7D78((void **)v5);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)(a2 + 24);
  *(void *)(v5 + 16) = *(void *)(a2 + 40);
  *(void *)(a2 + 24) = 0LL;
  *(void *)(a2 + 32) = 0LL;
  *(void *)(a2 + 40) = 0LL;
  return a1;
}

uint64_t sub_183C0F0E4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v6 = v5 + 1;
  if (v5 + 1 > 0x555555555555555LL) {
    sub_183BF77E4();
  }
  uint64_t v9 = (uint64_t)(a1 + 2);
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v4) >> 4);
  if (2 * v10 > v6) {
    unint64_t v6 = 2 * v10;
  }
  if (v10 >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v11 = 0x555555555555555LL;
  }
  else {
    unint64_t v11 = v6;
  }
  v17[4] = a1 + 2;
  uint64_t v12 = (char *)sub_183BFFE64(v9, v11);
  char v13 = &v12[48 * v5];
  v17[0] = v12;
  v17[1] = v13;
  v17[3] = &v12[48 * v14];
  *((void *)v13 + 1) = 0LL;
  *((void *)v13 + 2) = 0LL;
  *(void *)char v13 = 0LL;
  *(_OWORD *)char v13 = *(_OWORD *)a2;
  *((void *)v13 + 2) = *(void *)(a2 + 16);
  *(void *)a2 = 0LL;
  *(void *)(a2 + sub_183BF7C10(v6 + 8) = 0LL;
  *(void *)(a2 + 16) = 0LL;
  *((void *)v13 + 4) = 0LL;
  *((void *)v13 + 5) = 0LL;
  *((void *)v13 + 3) = 0LL;
  *(_OWORD *)(v13 + 24) = *(_OWORD *)a3;
  *((void *)v13 + 5) = *(void *)(a3 + 16);
  *(void *)a3 = 0LL;
  *(void *)(a3 + sub_183BF7C10(v6 + 8) = 0LL;
  *(void *)(a3 + 16) = 0LL;
  v17[2] = v13 + 48;
  sub_183C0F210(a1, v17);
  uint64_t v15 = a1[1];
  sub_183C0F460((uint64_t)v17);
  return v15;
}

void sub_183C0F1FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_183C0F210(uint64_t *a1, void *a2)
{
  uint64_t result = sub_183C0F284((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

uint64_t sub_183C0F284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v14 = a6;
  *((void *)&v14 + 1) = a7;
  __int128 v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }

  else
  {
    do
    {
      *(void *)(v7 - 4sub_183BF7C10(v6 + 8) = 0LL;
      *(void *)(v7 - 40) = 0LL;
      *(void *)(v7 - 32) = 0LL;
      __int128 v8 = *(_OWORD *)(a3 - 48);
      a3 -= 48LL;
      *(_OWORD *)(v7 - 4sub_183BF7C10(v6 + 8) = v8;
      *(void *)(v7 - 32) = *(void *)(a3 + 16);
      *(void *)a3 = 0LL;
      *(void *)(a3 + sub_183BF7C10(v6 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      *(void *)(v7 - 24) = 0LL;
      *(void *)(v7 - 16) = 0LL;
      *(void *)(v7 - sub_183BF7C10(v6 + 8) = 0LL;
      *(_OWORD *)(v7 - 24) = *(_OWORD *)(a3 + 24);
      *(void *)(v7 - sub_183BF7C10(v6 + 8) = *(void *)(a3 + 40);
      *(void *)(a3 + 24) = 0LL;
      *(void *)(a3 + 32) = 0LL;
      *(void *)(a3 + 40) = 0LL;
      uint64_t v7 = *((void *)&v14 + 1) - 48LL;
      *((void *)&v14 + 1) -= 48LL;
    }

    while (a3 != a5);
    uint64_t v9 = v14;
  }

  char v12 = 1;
  sub_183C0F344((uint64_t)v11);
  return v9;
}

uint64_t sub_183C0F344(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_183C0F378((uint64_t *)a1);
  }
  return a1;
}

void sub_183C0F378(uint64_t *a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v1 = (uint64_t *)a1[2];
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v14 = v3;
  uint64_t v15 = v2;
  uint64_t v16 = v3;
  uint64_t v17 = v2;
  uint64_t v4 = *a1;
  uint64_t v5 = (uint64_t *)a1[1];
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  uint64_t v9 = v7;
  uint64_t v10 = v6;
  uint64_t v11 = v7;
  uint64_t v12 = v6;
  sub_183C0F3EC(v4, (uint64_t)v13, (uint64_t)v8);
}

void sub_183C0F3EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  for (uint64_t i = *(void ***)(a2 + 32); i != *(void ***)(a3 + 32); *(void *)(a2 + 32) = i)
  {
    uint64_t v6 = i + 3;
    sub_183BF7C68(&v6);
    uint64_t v6 = i;
    sub_183BF7C68(&v6);
    uint64_t i = (void **)(*(void *)(a2 + 32) + 48LL);
  }

uint64_t sub_183C0F460(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_183C0F494(uint64_t a1, uint64_t a2)
{
  for (uint64_t i = *(void *)(a1 + 16); i != a2; uint64_t i = *(void *)(a1 + 16))
  {
    uint64_t v5 = (void **)(i - 48);
    *(void *)(a1 + 16) = i - 48;
    uint64_t v6 = (void **)(i - 24);
    sub_183BF7C68(&v6);
    uint64_t v6 = v5;
    sub_183BF7C68(&v6);
  }

void sub_183C0F500(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_183C0F540((uint64_t)v2, (void **)*v2);
    operator delete(**a1);
  }

void sub_183C0F540(uint64_t a1, void **a2)
{
  uint64_t v4 = *(void ***)(a1 + 8);
  if (v4 != a2)
  {
    do
    {
      uint64_t v5 = v4 - 6;
      uint64_t v6 = v4 - 3;
      sub_183BF7C68(&v6);
      uint64_t v6 = v5;
      sub_183BF7C68(&v6);
      uint64_t v4 = v5;
    }

    while (v5 != a2);
  }

  *(void *)(a1 + sub_183BF7C10(v6 + 8) = a2;
}

void sub_183C0F5AC(std::runtime_error *a1)
{
}

void sub_183C0F5C0(const std::string *a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = 0LL;
  a3[1] = 0LL;
  a3[2] = 0LL;
  if (a2 != -1LL)
  {
    unint64_t v3 = a2;
    uint64_t v6 = (uint64_t)(a3 + 2);
    do
    {
      int size = (char)a1->__r_.__value_.__s.__size_;
      if (size >= 0) {
        std::string::size_type v8 = (std::string::size_type)a1;
      }
      else {
        std::string::size_type v8 = a1->__r_.__value_.__r.__words[0];
      }
      if (size >= 0) {
        std::string::size_type v9 = a1->__r_.__value_.__s.__size_;
      }
      else {
        std::string::size_type v9 = a1->__r_.__value_.__l.__size_;
      }
      if (v9 <= v3) {
        break;
      }
      uint64_t v10 = (unsigned __int8 *)(v8 + v9);
      std::string::size_type v11 = v3;
      while (memchr(" \t\r\n\v\f", *(char *)(v8 + v11), 6uLL))
      {
        if (v9 == ++v11) {
          return;
        }
      }

      if (v11 == -1LL) {
        break;
      }
      if (v9 > v11)
      {
        uint64_t v12 = (unsigned __int8 *)(v8 + v11);
LABEL_17:
        uint64_t v13 = 0LL;
        while (*v12 != asc_183C162FA[v13])
        {
          if (++v13 == 6)
          {
            if (++v12 != v10) {
              goto LABEL_17;
            }
            goto LABEL_25;
          }
        }

        if (v12 != v10)
        {
          unint64_t v3 = (unint64_t)&v12[-v8];
          if (&v12[-v8] != (unsigned __int8 *)-1LL)
          {
            std::string::size_type v14 = v3 - v11;
            goto LABEL_26;
          }
        }
      }

void sub_183C0F7F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  sub_183C11DE0((void ***)&__p);
  _Unwind_Resume(a1);
}

const void *sub_183C0F838(const void *result)
{
  if (result) {
    return (const void *)(__dynamic_cast( result,  (const struct __class_type_info *)&unk_189D37E20,  (const struct __class_type_info *)&unk_189D38648,  0LL) != 0LL);
  }
  return result;
}

void ***sub_183C0F86C(void ***a1, void *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = (*a1)[1];
  uint64_t v6 = *a1;
  unint64_t v9 = (unint64_t)v6[2];
  uint64_t v7 = (uint64_t)(v6 + 2);
  unint64_t v8 = v9;
  if ((unint64_t)v5 >= v9)
  {
    uint64_t v11 = ((char *)v5 - (_BYTE *)*v4) >> 3;
    uint64_t v12 = v8 - (void)*v4;
    uint64_t v13 = v12 >> 2;
    else {
      unint64_t v14 = v13;
    }
    if (v14) {
      unint64_t v15 = (char *)sub_183BF77F8(v7, v14);
    }
    else {
      unint64_t v15 = 0LL;
    }
    unint64_t v16 = &v15[8 * v11];
    __int128 v17 = &v15[8 * v14];
    *(void *)unint64_t v16 = *a2;
    uint64_t v10 = v16 + 8;
    unint64_t v19 = (char *)*v4;
    unint64_t v18 = (char *)v4[1];
    if (v18 != *v4)
    {
      do
      {
        uint64_t v20 = *((void *)v18 - 1);
        v18 -= 8;
        *((void *)v16 - 1) = v20;
        v16 -= 8;
      }

      while (v18 != v19);
      unint64_t v18 = (char *)*v4;
    }

    *uint64_t v4 = v16;
    v4[1] = v10;
    v4[2] = v17;
    if (v18) {
      operator delete(v18);
    }
  }

  else
  {
    *uint64_t v5 = *a2;
    uint64_t v10 = v5 + 1;
  }

  v4[1] = v10;
  return a1;
}

uint64_t sub_183C0F954(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a2 != a3)
  {
    uint64_t v5 = a2;
    do
    {
      sub_183C0F9CC(a1, v5, v5);
      ++v5;
    }

    while (v5 != a3);
  }

  return a1;
}

void sub_183C0F9B8(_Unwind_Exception *a1)
{
}

void *sub_183C0F9CC(uint64_t a1, uint64_t *a2, void *a3)
{
  unint64_t v7 = sub_183C07540(*a2);
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v7 >= v9) {
        unint64_t v3 = v7 % v9;
      }
    }

    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }

    uint64_t v12 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      for (uint64_t i = *v12; i; uint64_t i = (void *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == v8)
        {
          uint64_t v15 = *a2;
          uint64_t v16 = sub_183C07540(i[2]);
          if (v16 == sub_183C07540(v15)) {
            return i;
          }
        }

        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9) {
              v14 %= v9;
            }
          }

          else
          {
            v14 &= v9 - 1;
          }

          if (v14 != v3) {
            break;
          }
        }
      }
    }
  }

  uint64_t i = operator new(0x18uLL);
  *uint64_t i = 0LL;
  i[1] = v8;
  i[2] = *a3;
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v18 = *(float *)(a1 + 32);
  if (!v9 || (float)(v18 * (float)v9) < v17)
  {
    BOOL v19 = 1LL;
    if (v9 >= 3) {
      BOOL v19 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v9);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    sub_183BF80FC(a1, v22);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }

    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }

  uint64_t v23 = *(void *)a1;
  __int128 v24 = *(void **)(*(void *)a1 + 8 * v3);
  if (v24)
  {
    *uint64_t i = *v24;
LABEL_38:
    *__int128 v24 = i;
    goto LABEL_39;
  }

  *uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v23 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v25 = *(void *)(*i + 8LL);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v25 >= v9) {
        v25 %= v9;
      }
    }

    else
    {
      v25 &= v9 - 1;
    }

    __int128 v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_38;
  }

LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

  ++*(void *)(a1 + 24);
  return i;
}

void sub_183C0FC10(_Unwind_Exception *a1)
{
}

uint64_t sub_183C0FC24(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

const void *sub_183C0FC6C(const void *result)
{
  if (result) {
    return (const void *)(__dynamic_cast( result,  (const struct __class_type_info *)&unk_189D37E20,  (const struct __class_type_info *)&unk_189D38880,  0LL) != 0LL);
  }
  return result;
}

void *sub_183C0FCA0(void *a1, uint64_t *a2)
{
  unint64_t v4 = sub_183C07540(*a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0LL;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }

  else
  {
    unint64_t v9 = (*(void *)&v5 - 1LL) & v4;
  }

  uint8x8_t v10 = *(void **)(*a1 + 8 * v9);
  if (!v10) {
    return 0LL;
  }
  unint64_t v11 = (void *)*v10;
  if (*v10)
  {
    do
    {
      unint64_t v12 = v11[1];
      if (v6 == v12)
      {
        uint64_t v13 = *a2;
        uint64_t v14 = sub_183C07540(v11[2]);
        if (v14 == sub_183C07540(v13)) {
          return v11;
        }
      }

      else
      {
        if (v8 > 1)
        {
          if (v12 >= *(void *)&v5) {
            v12 %= *(void *)&v5;
          }
        }

        else
        {
          v12 &= *(void *)&v5 - 1LL;
        }

        if (v12 != v9) {
          return 0LL;
        }
      }

      unint64_t v11 = (void *)*v11;
    }

    while (v11);
  }

  return v11;
}

void *sub_183C0FDB0(uint64_t a1, uint64_t *a2, void *a3)
{
  unint64_t v7 = sub_183C07540(*a2);
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v7 >= v9) {
        unint64_t v3 = v7 % v9;
      }
    }

    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }

    unint64_t v12 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      for (uint64_t i = *v12; i; uint64_t i = (void *)*i)
      {
        unint64_t v14 = i[1];
        if (v14 == v8)
        {
          uint64_t v15 = *a2;
          uint64_t v16 = sub_183C07540(i[2]);
          if (v16 == sub_183C07540(v15)) {
            return i;
          }
        }

        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9) {
              v14 %= v9;
            }
          }

          else
          {
            v14 &= v9 - 1;
          }

          if (v14 != v3) {
            break;
          }
        }
      }
    }
  }

  uint64_t i = operator new(0x18uLL);
  *uint64_t i = 0LL;
  i[1] = v8;
  i[2] = *a3;
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v18 = *(float *)(a1 + 32);
  if (!v9 || (float)(v18 * (float)v9) < v17)
  {
    BOOL v19 = 1LL;
    if (v9 >= 3) {
      BOOL v19 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v9);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    sub_183BF80FC(a1, v22);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }

    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }

  uint64_t v23 = *(void *)a1;
  __int128 v24 = *(void **)(*(void *)a1 + 8 * v3);
  if (v24)
  {
    *uint64_t i = *v24;
LABEL_38:
    *__int128 v24 = i;
    goto LABEL_39;
  }

  *uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v23 + 8 * v3) = a1 + 16;
  if (*i)
  {
    unint64_t v25 = *(void *)(*i + 8LL);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v25 >= v9) {
        v25 %= v9;
      }
    }

    else
    {
      v25 &= v9 - 1;
    }

    __int128 v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_38;
  }

void sub_183C0FFF4(_Unwind_Exception *a1)
{
}

void *sub_183C10008@<X0>(char *a1@<X1>, uint64_t a2@<X2>, void *a3@<X8>)
{
  unint64_t v6 = operator new(0x58uLL);
  uint64_t result = sub_183C10068(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_183C10054(_Unwind_Exception *a1)
{
}

void *sub_183C10068(void *a1, char *__s, uint64_t a3)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_189D38920;
  sub_183C100C8((int)&v5, a1 + 3, __s, a3);
  return a1;
}

void sub_183C100B4(_Unwind_Exception *a1)
{
}

void sub_183C100C8(int a1, void *a2, char *__s, uint64_t a4)
{
  void v15[2] = *MEMORY[0x1895F89C0];
  sub_183C11CAC(&v12, __s);
  unint64_t v6 = *(void **)a4;
  v15[0] = *(void *)(a4 + 8);
  *(void *)((char *)v15 + 7) = *(void *)(a4 + 15);
  char v7 = *(_BYTE *)(a4 + 23);
  *(void *)(a4 + sub_183BF7C10(v6 + 8) = 0LL;
  *(void *)(a4 + 16) = 0LL;
  *(void *)a4 = 0LL;
  int v8 = 3;
  std::string __p = v6;
  *(void *)uint8x8_t v10 = v15[0];
  *(void *)&v10[7] = *(void *)((char *)v15 + 7);
  char v11 = v7;
  sub_183C08FE8((uint64_t)a2, &v12, &v8);
  *a2 = off_189D38970;
  if (v8 == 4)
  {
    p_p = &__p;
    sub_183C11DE0(&p_p);
  }

  else if (v8 == 3 && v11 < 0)
  {
    operator delete(__p);
  }

  if (v13 < 0) {
    operator delete((void *)v12.n128_u64[0]);
  }
}

void sub_183C101CC(std::runtime_error *a1)
{
}

uint64_t sub_183C101E0(uint64_t **a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  if (*a1 != v4)
  {
    while (1)
    {
      uint64_t v8 = *v3;
      char v7 = (std::__shared_weak_count *)v3[1];
      if (v7)
      {
        p_shared_owners = (unint64_t *)&v7->__shared_owners_;
        do
          unint64_t v10 = __ldxr(p_shared_owners);
        while (__stxr(v10 + 1, p_shared_owners));
      }

      uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 24LL))(v8);
      __n128 v12 = (const void **)v11;
      uint64_t v13 = *(unsigned __int8 *)(v11 + 23);
      size_t v14 = *(void *)(v11 + 8);
      if ((v13 & 0x80u) == 0LL) {
        uint64_t v15 = *(unsigned __int8 *)(v11 + 23);
      }
      else {
        uint64_t v15 = *(void *)(v11 + 8);
      }
      uint64_t v16 = a2[23];
      int v17 = (char)v16;
      if ((v16 & 0x80u) != 0LL) {
        uint64_t v16 = *((void *)a2 + 1);
      }
      if (v15 == v16)
      {
        if (v17 >= 0) {
          float v18 = a2;
        }
        else {
          float v18 = *(unsigned __int8 **)a2;
        }
        if ((v13 & 0x80) != 0)
        {
        }

        else
        {
          if (!*(_BYTE *)(v11 + 23)) {
            goto LABEL_38;
          }
          BOOL v19 = (unsigned __int8 *)v11;
          uint64_t v20 = *(unsigned __int8 *)(v11 + 23);
          while (*v19 == *v18)
          {
            ++v19;
            ++v18;
            if (!--v20) {
              goto LABEL_38;
            }
          }
        }
      }

      uint64_t v21 = a3[23];
      int v22 = (char)v21;
      if ((v21 & 0x80u) != 0LL) {
        uint64_t v21 = *((void *)a3 + 1);
      }
      if (v21) {
        BOOL v23 = v15 == v21;
      }
      else {
        BOOL v23 = 0;
      }
      if (!v23) {
        goto LABEL_27;
      }
      if (v22 >= 0) {
        float v18 = a3;
      }
      else {
        float v18 = *(unsigned __int8 **)a3;
      }
      if ((v13 & 0x80) != 0)
      {
        if (memcmp(*v12, v18, v14)) {
          goto LABEL_27;
        }
      }

      else if ((_DWORD)v13)
      {
        while (*(unsigned __int8 *)v12 == *v18)
        {
          __n128 v12 = (const void **)((char *)v12 + 1);
          ++v18;
          if (!--v13) {
            goto LABEL_38;
          }
        }

LABEL_27:
        uint64_t v24 = 0LL;
        if (v7) {
          goto LABEL_39;
        }
        goto LABEL_43;
      }

LABEL_38:
      uint64_t v24 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(void *)v8 + 32LL))(v8, v18);
      if (v7)
      {
LABEL_39:
        unint64_t v25 = (unint64_t *)&v7->__shared_owners_;
        do
          unint64_t v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
      }

LABEL_43:
      v3 += 2;
      if (v3 == v4) {
        char v27 = 1;
      }
      else {
        char v27 = v24;
      }
      if ((v27 & 1) != 0) {
        return v24;
      }
    }
  }

  return 0LL;
}

void sub_183C103B4(_Unwind_Exception *exception_object)
{
  if (v1) {
    sub_183C13C88(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_183C103D4(std::runtime_error *a1)
{
}

void sub_183C103E8(std::runtime_error *a1)
{
}

void sub_183C103FC(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  memset(v45, 0, sizeof(v45));
  sub_183BF7AFC( (char *)v45,  *(void **)(a1 + 8),  *(void **)(a1 + 16),  (uint64_t)(*(void *)(a1 + 16) - *(void *)(a1 + 8)) >> 4);
  __int128 v46 = 0LL;
  int64x2_t v47 = 0LL;
  uint64_t v48 = 0LL;
  uint64_t v42 = 0LL;
  unint64_t v43 = 0LL;
  uint64_t v44 = 0LL;
  sub_183C10B7C((uint64_t *)&v42, (uint64_t)v45);
  for (uint64_t i = v42; v42 != v43; uint64_t i = v42)
  {
    memset(__p, 0, sizeof(__p));
    *(_OWORD *)std::string __p = *(_OWORD *)i;
    __p[2] = i[2];
    *uint64_t i = 0LL;
    i[1] = 0LL;
    i[2] = 0LL;
    sub_183C10ECC((uint64_t)&v52, (uint64_t)(v42 + 3), (uint64_t)v43, (uint64_t)v42);
    unint64_t v3 = v2;
    unint64_t v4 = v43;
    while (v4 != v3)
    {
      v4 -= 3;
      *(void *)&__int128 v49 = v4;
      sub_183BF7C68((void ***)&v49);
    }

    unint64_t v43 = v3;
    char v5 = (const void **)__p[0];
    unint64_t v6 = (const void **)__p[1];
    if (__p[0] != __p[1])
    {
      while (!*v5
           || !__dynamic_cast( *v5,  (const struct __class_type_info *)&unk_189D37E20,  (const struct __class_type_info *)&unk_189D37E30,  0LL))
      {
        v5 += 2;
        if (v5 == v6) {
          goto LABEL_31;
        }
      }
    }

    if (v5 == v6)
    {
LABEL_31:
      sub_183C10B7C((uint64_t *)&v46, (uint64_t)__p);
    }

    else
    {
      __int128 v51 = *(_OWORD *)v5;
      *char v5 = 0LL;
      v5[1] = 0LL;
      char v7 = v5 + 2;
      uint64_t v8 = (char *)__p[1];
      if (v5 + 2 != __p[1])
      {
        do
        {
          unint64_t v9 = v5 + 2;
          sub_183C07FEC((uint64_t)v5, (__int128 *)v5 + 1);
          unint64_t v10 = (char *)(v5 + 4);
          v5 += 2;
        }

        while (v10 != v8);
        char v7 = (const void **)__p[1];
        char v5 = v9;
      }

      while (v7 != v5)
        char v7 = (const void **)sub_183BF7C10((uint64_t)(v7 - 2));
      __p[1] = v5;
      uint64_t v11 = (const void *)v51;
      __n128 v12 = __dynamic_cast( (const void *)v51,  (const struct __class_type_info *)&unk_189D37E20,  (const struct __class_type_info *)&unk_189D38C08,  0LL);
      if (v12)
      {
        uint64_t v13 = (uint64_t *)v12[1];
        size_t v14 = (uint64_t *)v12[2];
        while (v13 != v14)
        {
          uint64_t v16 = *v13;
          uint64_t v15 = (std::__shared_weak_count *)v13[1];
          uint64_t v54 = *v13;
          __int128 v55 = v15;
          if (v15)
          {
            p_shared_owners = (unint64_t *)&v15->__shared_owners_;
            do
              unint64_t v18 = __ldxr(p_shared_owners);
            while (__stxr(v18 + 1, p_shared_owners));
          }

          __int128 v49 = 0uLL;
          uint64_t v50 = 0LL;
          uint64_t v52 = (void **)&v49;
          char v53 = 0;
          BOOL v19 = operator new(0x10uLL);
          *(void *)&__int128 v49 = v19;
          *((void *)&v49 + 1) = v19;
          uint64_t v50 = v19 + 2;
          *BOOL v19 = v16;
          v19[1] = v15;
          if (v15)
          {
            uint64_t v20 = (unint64_t *)&v15->__shared_owners_;
            do
              unint64_t v21 = __ldxr(v20);
            while (__stxr(v21 + 1, v20));
            *((void *)&v49 + 1) = v19 + 2;
            do
              unint64_t v22 = __ldaxr(v20);
            while (__stlxr(v22 - 1, v20));
            if (!v22)
            {
              ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
              std::__shared_weak_count::__release_weak(v15);
            }
          }

          else
          {
            *((void *)&v49 + 1) = v19 + 2;
          }

          sub_183C10F40( (uint64_t *)&v49,  *((uint64_t *)&v49 + 1),  (uint64_t *)__p[0],  (uint64_t *)__p[1],  ((char *)__p[1] - (char *)__p[0]) >> 4);
          sub_183C10B7C((uint64_t *)&v42, (uint64_t)&v49);
          uint64_t v52 = (void **)&v49;
          sub_183BF7C68(&v52);
          v13 += 2;
        }
      }

      else
      {
        BOOL v23 = (void **)__dynamic_cast( v11,  (const struct __class_type_info *)&unk_189D37E20,  (const struct __class_type_info *)&unk_189D38B40,  0LL);
        if (v23)
        {
          uint64_t v24 = v23;
          uint64_t v50 = 0LL;
          __int128 v49 = 0uLL;
          sub_183BF7AFC((char *)&v49, v23[1], v23[2], ((char *)v23[2] - (char *)v23[1]) >> 4);
          sub_183C11244((uint64_t *)&v49, *((uint64_t *)&v49 + 1), v24[1], v24[2], ((char *)v24[2] - (char *)v24[1]) >> 4);
        }

        else
        {
          unint64_t v25 = (void **)__dynamic_cast( v11,  (const struct __class_type_info *)&unk_189D37E20,  (const struct __class_type_info *)&unk_189D37E30,  0LL);
          uint64_t v50 = 0LL;
          __int128 v49 = 0uLL;
          sub_183BF7AFC((char *)&v49, v25[1], v25[2], ((char *)v25[2] - (char *)v25[1]) >> 4);
        }

        sub_183C10F40( (uint64_t *)&v49,  *((uint64_t *)&v49 + 1),  (uint64_t *)__p[0],  (uint64_t *)__p[1],  ((char *)__p[1] - (char *)__p[0]) >> 4);
        sub_183C10B7C((uint64_t *)&v42, (uint64_t)&v49);
        uint64_t v52 = (void **)&v49;
        sub_183BF7C68(&v52);
      }

      unint64_t v26 = (std::__shared_weak_count *)*((void *)&v51 + 1);
      if (*((void *)&v51 + 1))
      {
        char v27 = (unint64_t *)(*((void *)&v51 + 1) + 8LL);
        do
          unint64_t v28 = __ldaxr(v27);
        while (__stlxr(v28 - 1, v27));
        if (!v28)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }
    }

    *(void *)&__int128 v49 = __p;
    sub_183BF7C68((void ***)&v49);
  }

  __p[0] = &v42;
  sub_183C11C3C((void ***)__p);
  uint64_t v42 = (void **)v45;
  sub_183BF7C68(&v42);
  BOOL v29 = v46;
  uint64_t v30 = v47;
  if (v46 != v47)
  {
    while (1)
    {
      sub_183C11430((uint64_t)&v42, *v29, v29[1]);
      __n128 v31 = v44;
      if (v44) {
        break;
      }
LABEL_70:
      sub_183C11A90((uint64_t)&v42);
      v29 += 3;
      if (v29 == v30) {
        goto LABEL_71;
      }
    }

    while (1)
    {
      unint64_t v32 = (const void **)(v31 + 2);
      if (sub_183C11B04(&v42, v31 + 2) == 1) {
        goto LABEL_69;
      }
      if (!*v32) {
        goto LABEL_69;
      }
      unint64_t v33 = __dynamic_cast( *v32,  (const struct __class_type_info *)&unk_189D37E20,  (const struct __class_type_info *)&unk_189D38630,  0LL);
      if (!v33) {
        goto LABEL_69;
      }
      uint64_t v34 = (uint64_t)v33;
      if (__dynamic_cast( v33,  (const struct __class_type_info *)&unk_189D38630,  (const struct __class_type_info *)&unk_189D38A78,  0LL))
      {
        goto LABEL_49;
      }

      if (__dynamic_cast( (const void *)v34,  (const struct __class_type_info *)&unk_189D38630,  (const struct __class_type_info *)&unk_189D389B8,  0LL))
      {
        goto LABEL_54;
      }

      int v37 = __dynamic_cast( (const void *)v34,  (const struct __class_type_info *)&unk_189D38630,  (const struct __class_type_info *)&unk_189D38648,  0LL);
      if (v37) {
        break;
      }
LABEL_69:
      __n128 v31 = (void *)*v31;
      if (!v31) {
        goto LABEL_70;
      }
    }

    if (v37[28])
    {
LABEL_54:
      __int128 v49 = 0uLL;
      uint64_t v50 = 0LL;
      int v35 = *(_DWORD *)(v34 + 32);
      if (v35 == 3)
      {
        sub_183BF7048((int *)(v34 + 32), 3u);
        sub_183C0F5C0((const std::string *)(v34 + 40), 0LL, (uint64_t *)__p);
        sub_183C08210((uint64_t *)&v49);
        __int128 v49 = *(_OWORD *)__p;
        uint64_t v50 = __p[2];
        memset(__p, 0, sizeof(__p));
        uint64_t v52 = __p;
        sub_183C11DE0(&v52);
        int v35 = *(_DWORD *)(v34 + 32);
      }

      if (v35 != 4)
      {
        uint64_t v39 = 0LL;
        __int128 v38 = 0uLL;
        sub_183C11D5C( (char *)&v38,  (__int128 *)v49,  *((__int128 **)&v49 + 1),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v49 + 1) - v49) >> 3));
        LODWORD(__p[0]) = 4;
        *(_OWORD *)&__p[1] = v38;
        uint64_t v41 = v39;
        __int128 v38 = 0uLL;
        uint64_t v39 = 0LL;
        sub_183C07EA8(v34, (int *)__p);
        if (LODWORD(__p[0]) == 4)
        {
          uint64_t v52 = &__p[1];
          sub_183C11DE0(&v52);
        }

        else if (LODWORD(__p[0]) == 3 && SHIBYTE(v41) < 0)
        {
          operator delete(__p[1]);
        }

        uint64_t v52 = (void **)&v38;
        sub_183C11DE0(&v52);
      }

      __p[0] = &v49;
      uint64_t v36 = __p;
    }

    else
    {
LABEL_49:
      LODWORD(__p[0]) = 2;
      __p[1] = 0LL;
      sub_183C07EA8(v34, (int *)__p);
      if (LODWORD(__p[0]) != 4)
      {
        if (LODWORD(__p[0]) == 3 && SHIBYTE(v41) < 0) {
          operator delete(__p[1]);
        }
        goto LABEL_69;
      }

      *(void *)&__int128 v49 = &__p[1];
      uint64_t v36 = (void **)&v49;
    }

    sub_183C11DE0((void ***)v36);
    goto LABEL_69;
  }

void sub_183C10A7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void ***a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void **a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, char a26, uint64_t a27, uint64_t a28, void ***a29)
{
  *(void *)(v29 - 12sub_183BF7C10(v6 + 8) = &a29;
  sub_183BF7C68((void ***)(v29 - 128));
  sub_183BF7C10(v29 - 144);
  a29 = (void ***)&a13;
  sub_183BF7C68((void ***)&a29);
  a13 = &a18;
  sub_183C11C3C((void ***)&a13);
  a18 = (void **)&a26;
  sub_183C11C3C(&a18);
  a18 = (void **)&a23;
  sub_183BF7C68(&a18);
  _Unwind_Resume(a1);
}

void *sub_183C10B7C(uint64_t *a1, uint64_t a2)
{
  unint64_t v6 = a1[2];
  unint64_t v4 = a1 + 2;
  unint64_t v5 = v6;
  char v7 = (void *)*(v4 - 1);
  if ((unint64_t)v7 >= v6)
  {
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v7 - *a1) >> 3);
    unint64_t v10 = v9 + 1;
    if (v9 + 1 > 0xAAAAAAAAAAAAAAALL) {
      sub_183BF77E4();
    }
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *a1) >> 3);
    if (2 * v11 > v10) {
      unint64_t v10 = 2 * v11;
    }
    if (v11 >= 0x555555555555555LL) {
      unint64_t v12 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v12 = v10;
    }
    v17[4] = v4;
    uint64_t v13 = (char *)sub_183BFB0F0((uint64_t)v4, v12);
    size_t v14 = &v13[24 * v9];
    v17[0] = v13;
    v17[1] = v14;
    v17[3] = &v13[24 * v15];
    *((void *)v14 + 1) = 0LL;
    *((void *)v14 + 2) = 0LL;
    *(void *)size_t v14 = 0LL;
    *(_OWORD *)size_t v14 = *(_OWORD *)a2;
    *((void *)v14 + 2) = *(void *)(a2 + 16);
    *(void *)a2 = 0LL;
    *(void *)(a2 + sub_183BF7C10(v6 + 8) = 0LL;
    *(void *)(a2 + 16) = 0LL;
    v17[2] = v14 + 24;
    sub_183C10CBC(a1, v17);
    uint64_t v8 = (void *)a1[1];
    sub_183C10E4C(v17);
  }

  else
  {
    *char v7 = 0LL;
    v7[1] = 0LL;
    v7[2] = 0LL;
    *(_OWORD *)char v7 = *(_OWORD *)a2;
    v7[2] = *(void *)(a2 + 16);
    *(void *)a2 = 0LL;
    *(void *)(a2 + sub_183BF7C10(v6 + 8) = 0LL;
    *(void *)(a2 + 16) = 0LL;
    uint64_t v8 = v7 + 3;
    a1[1] = (uint64_t)(v7 + 3);
  }

  a1[1] = (uint64_t)v8;
  return v8 - 3;
}

void sub_183C10CA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_183C10CBC(uint64_t *a1, void *a2)
{
  uint64_t result = sub_183C10D30((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
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

uint64_t sub_183C10D30(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v14 = a6;
  *((void *)&v14 + 1) = a7;
  __int128 v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }

  else
  {
    do
    {
      *(void *)(v7 - 24) = 0LL;
      *(void *)(v7 - 16) = 0LL;
      *(void *)(v7 - sub_183BF7C10(v6 + 8) = 0LL;
      __int128 v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(void *)(v7 - sub_183BF7C10(v6 + 8) = a3[2];
      *a3 = 0LL;
      a3[1] = 0LL;
      a3[2] = 0LL;
      uint64_t v7 = *((void *)&v14 + 1) - 24LL;
      *((void *)&v14 + 1) -= 24LL;
    }

    while (a3 != a5);
    uint64_t v9 = v14;
  }

  char v12 = 1;
  sub_183C10DD0((uint64_t)v11);
  return v9;
}

uint64_t sub_183C10DD0(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_183C10E04(a1);
  }
  return a1;
}

void sub_183C10E04(uint64_t a1)
{
  uint64_t v1 = *(void ***)(*(void *)(a1 + 16) + 8LL);
  uint64_t v2 = *(void ***)(*(void *)(a1 + 8) + 8LL);
  while (v1 != v2)
  {
    unint64_t v3 = v1;
    sub_183BF7C68(&v3);
    v1 += 3;
  }

void **sub_183C10E4C(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_183C10E7C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v2; uint64_t i = *(void *)(a1 + 16))
  {
    unint64_t v4 = (void **)(i - 24);
    *(void *)(a1 + 16) = v4;
    uint64_t v5 = v4;
    sub_183BF7C68(&v5);
  }

uint64_t sub_183C10ECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a2;
  if (a2 == a3) {
    return a2;
  }
  uint64_t v6 = a3;
  do
  {
    sub_183BF7D78((void **)a4);
    *(_OWORD *)a4 = *(_OWORD *)v5;
    *(void *)(a4 + 16) = *(void *)(v5 + 16);
    *(void *)uint64_t v5 = 0LL;
    *(void *)(v5 + sub_183BF7C10(v6 + 8) = 0LL;
    *(void *)(v5 + 16) = 0LL;
    a4 += 24LL;
    v5 += 24LL;
  }

  while (v5 != v6);
  return v6;
}

void *sub_183C10F40(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v5 = (void *)a2;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v11 = a1[2];
  uint64_t v9 = (uint64_t)(a1 + 2);
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 4)
  {
    uint64_t v13 = *a1;
    unint64_t v14 = a5 + ((uint64_t)(v12 - *a1) >> 4);
    if (v14 >> 60) {
      sub_183BF77E4();
    }
    uint64_t v15 = (a2 - v13) >> 4;
    uint64_t v16 = v10 - v13;
    if (v16 >> 3 > v14) {
      unint64_t v14 = v16 >> 3;
    }
    else {
      unint64_t v17 = v14;
    }
    v33[4] = v9;
    if (v17) {
      unint64_t v18 = (char *)sub_183BF7BDC(v9, v17);
    }
    else {
      unint64_t v18 = 0LL;
    }
    unint64_t v26 = (uint64_t *)&v18[16 * v15];
    v33[0] = v18;
    v33[1] = v26;
    v33[3] = &v18[16 * v17];
    char v27 = &v26[2 * a5];
    do
    {
      uint64_t *v26 = *a3;
      uint64_t v28 = a3[1];
      v26[1] = v28;
      if (v28)
      {
        uint64_t v29 = (unint64_t *)(v28 + 8);
        do
          unint64_t v30 = __ldxr(v29);
        while (__stxr(v30 + 1, v29));
      }

      v26 += 2;
      a3 += 2;
    }

    while (v26 != v27);
    v33[2] = v27;
    uint64_t v5 = (void *)sub_183C111A8(a1, v33, v5);
    sub_183C08050((uint64_t)v33);
    return v5;
  }

  uint64_t v19 = (uint64_t)(v12 - a2) >> 4;
  if (v19 >= a5)
  {
    uint64_t v20 = &a3[2 * a5];
LABEL_29:
    sub_183C1112C((uint64_t)a1, a2, v12, (char *)(a2 + 16 * a5));
    if (v20 != a3)
    {
      __n128 v31 = v5;
      do
      {
        sub_183BF7DD4(v31, a3);
        a3 += 2;
        v31 += 2;
      }

      while (a3 != v20);
    }

    return v5;
  }

  uint64_t v20 = &a3[2 * v19];
  if (v20 == a4)
  {
    unint64_t v22 = *(uint64_t **)(v9 - 8);
  }

  else
  {
    unint64_t v21 = &a3[2 * v19];
    unint64_t v22 = *(uint64_t **)(v9 - 8);
    do
    {
      *unint64_t v22 = *v21;
      uint64_t v23 = v21[1];
      v22[1] = v23;
      if (v23)
      {
        uint64_t v24 = (unint64_t *)(v23 + 8);
        do
          unint64_t v25 = __ldxr(v24);
        while (__stxr(v25 + 1, v24));
      }

      v21 += 2;
      v22 += 2;
    }

    while (v21 != a4);
  }

  a1[1] = (uint64_t)v22;
  return v5;
}

void sub_183C11118(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_183C1112C(uint64_t result, uint64_t a2, unint64_t a3, char *a4)
{
  unint64_t v4 = *(char **)(result + 8);
  uint64_t v5 = (char *)(a2 + v4 - a4);
  uint64_t v6 = v4;
  while ((unint64_t)v5 < a3)
  {
    *(_OWORD *)uint64_t v6 = *(_OWORD *)v5;
    v6 += 16;
    *(void *)uint64_t v5 = 0LL;
    *((void *)v5 + 1) = 0LL;
    v5 += 16;
  }

  *(void *)(result + sub_183BF7C10(v6 + 8) = v6;
  if (v4 != a4)
  {
    uint64_t v7 = (uint64_t)(v4 - 16);
    uint64_t v8 = 16 * ((v4 - a4) >> 4);
    uint64_t v9 = a2 - 16;
    do
    {
      uint64_t result = sub_183C07FEC(v7, (__int128 *)(v9 + v8));
      v7 -= 16LL;
      v8 -= 16LL;
    }

    while (v8);
  }

  return result;
}

uint64_t sub_183C111A8(void *a1, void *a2, void *a3)
{
  uint64_t result = a2[1];
  uint64_t v5 = (void *)*a1;
  uint64_t v6 = result;
  if ((void *)*a1 != a3)
  {
    uint64_t v7 = a3;
    uint64_t v6 = a2[1];
    do
    {
      __int128 v8 = *((_OWORD *)v7 - 1);
      v7 -= 2;
      *(_OWORD *)(v6 - 16) = v8;
      v6 -= 16LL;
      *uint64_t v7 = 0LL;
      v7[1] = 0LL;
    }

    while (v7 != v5);
  }

  a2[1] = v6;
  uint64_t v9 = (void *)a1[1];
  uint64_t v10 = (_OWORD *)a2[2];
  if (v9 != a3)
  {
    do
    {
      *v10++ = *(_OWORD *)a3;
      *a3 = 0LL;
      a3[1] = 0LL;
      a3 += 2;
    }

    while (a3 != v9);
    uint64_t v6 = a2[1];
  }

  a2[2] = v10;
  uint64_t v11 = (void *)*a1;
  *a1 = v6;
  a2[1] = v11;
  uint64_t v12 = a1[1];
  a1[1] = a2[2];
  a2[2] = v12;
  uint64_t v13 = a1[2];
  a1[2] = a2[3];
  a2[3] = v13;
  *a2 = a2[1];
  return result;
}

void *sub_183C11244(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v5 = (void *)a2;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v11 = a1[2];
  uint64_t v9 = (uint64_t)(a1 + 2);
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 4)
  {
    uint64_t v13 = *a1;
    unint64_t v14 = a5 + ((uint64_t)(v12 - *a1) >> 4);
    if (v14 >> 60) {
      sub_183BF77E4();
    }
    uint64_t v15 = (a2 - v13) >> 4;
    uint64_t v16 = v10 - v13;
    if (v16 >> 3 > v14) {
      unint64_t v14 = v16 >> 3;
    }
    else {
      unint64_t v17 = v14;
    }
    v33[4] = v9;
    if (v17) {
      unint64_t v18 = (char *)sub_183BF7BDC(v9, v17);
    }
    else {
      unint64_t v18 = 0LL;
    }
    unint64_t v26 = (uint64_t *)&v18[16 * v15];
    v33[0] = v18;
    v33[1] = v26;
    v33[3] = &v18[16 * v17];
    char v27 = &v26[2 * a5];
    do
    {
      uint64_t *v26 = *a3;
      uint64_t v28 = a3[1];
      v26[1] = v28;
      if (v28)
      {
        uint64_t v29 = (unint64_t *)(v28 + 8);
        do
          unint64_t v30 = __ldxr(v29);
        while (__stxr(v30 + 1, v29));
      }

      v26 += 2;
      a3 += 2;
    }

    while (v26 != v27);
    v33[2] = v27;
    uint64_t v5 = (void *)sub_183C111A8(a1, v33, v5);
    sub_183C08050((uint64_t)v33);
    return v5;
  }

  uint64_t v19 = (uint64_t)(v12 - a2) >> 4;
  if (v19 >= a5)
  {
    uint64_t v20 = &a3[2 * a5];
LABEL_29:
    sub_183C1112C((uint64_t)a1, a2, v12, (char *)(a2 + 16 * a5));
    if (v20 != a3)
    {
      __n128 v31 = v5;
      do
      {
        sub_183BF7DD4(v31, a3);
        a3 += 2;
        v31 += 2;
      }

      while (a3 != v20);
    }

    return v5;
  }

  uint64_t v20 = &a3[2 * v19];
  if (v20 == a4)
  {
    unint64_t v22 = *(uint64_t **)(v9 - 8);
  }

  else
  {
    unint64_t v21 = &a3[2 * v19];
    unint64_t v22 = *(uint64_t **)(v9 - 8);
    do
    {
      *unint64_t v22 = *v21;
      uint64_t v23 = v21[1];
      v22[1] = v23;
      if (v23)
      {
        uint64_t v24 = (unint64_t *)(v23 + 8);
        do
          unint64_t v25 = __ldxr(v24);
        while (__stxr(v25 + 1, v24));
      }

      v21 += 2;
      v22 += 2;
    }

    while (v21 != a4);
  }

  a1[1] = (uint64_t)v22;
  return v5;
}

void sub_183C1141C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_183C11430(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a2 != a3)
  {
    uint64_t v5 = a2;
    do
    {
      sub_183C114A4((void *)a1, v5);
      v5 += 2;
    }

    while (v5 != a3);
  }

  return a1;
}

void sub_183C11490(_Unwind_Exception *a1)
{
}

void *sub_183C114A4(void *a1, uint64_t *a2)
{
  unint64_t v3 = sub_183C115A4(a1, v5[0]);
  v5[0] = 0LL;
  sub_183BF8330((uint64_t)v5, 0LL);
  return v3;
}

void sub_183C114F4(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_183C1150C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 16;
  uint64_t v6 = operator new(0x20uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + sub_183BF7C10(v6 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  *uint64_t v6 = 0LL;
  v6[1] = 0LL;
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  v6[2] = *a2;
  v6[3] = v8;
  if (v8)
  {
    uint64_t v9 = (unint64_t *)(v8 + 8);
    do
      unint64_t v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
    uint64_t v7 = v6[2];
  }

  *(_BYTE *)(a3 + 16) = 1;
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 40LL))(v7);
  v6[1] = result;
  return result;
}

void sub_183C1158C(_Unwind_Exception *a1)
{
}

void *sub_183C115A4(void *a1, void *a2)
{
  unint64_t v4 = a2 + 2;
  unint64_t v5 = (*(uint64_t (**)(void))(*(void *)a2[2] + 40LL))(a2[2]);
  a2[1] = v5;
  uint64_t v6 = sub_183C11608((uint64_t)a1, v5, v4);
  sub_183C1175C(a1, a2, v6);
  return a2;
}

void *sub_183C11608(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    uint64_t v9 = 2 * v6;
    BOOL v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    size_t v11 = v10 | v9;
    unint64_t v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12) {
      size_t v13 = v12;
    }
    else {
      size_t v13 = v11;
    }
    sub_183C11844(a1, v13);
    unint64_t v6 = *(void *)(a1 + 8);
  }

  uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    unint64_t v15 = a2;
    if (v6 <= a2) {
      unint64_t v15 = a2 % v6;
    }
  }

  else
  {
    unint64_t v15 = (v6 - 1) & a2;
  }

  uint64_t v16 = *(void **)(*(void *)a1 + 8 * v15);
  if (!v16) {
    return 0LL;
  }
  int v17 = 0;
  do
  {
    uint64_t result = v16;
    uint64_t v16 = (void *)*v16;
    if (!v16) {
      break;
    }
    unint64_t v19 = v16[1];
    if (v14.u32[0] > 1uLL)
    {
      unint64_t v20 = v16[1];
      if (v19 >= v6) {
        unint64_t v20 = v19 % v6;
      }
    }

    else
    {
      unint64_t v20 = v19 & (v6 - 1);
    }

    if (v20 != v15) {
      break;
    }
    BOOL v21 = v19 == a2 && v16[2] == *a3;
    int v22 = v17 & !v21;
    v17 |= v21;
  }

  while (v22 != 1);
  return result;
}

void *sub_183C1175C(void *result, void *a2, void *a3)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }

  else
  {
    v4 &= *(void *)&v3 - 1LL;
  }

  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(void *)(*result + 8 * v4) = result + 2;
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v6 = *(void *)(*a2 + 8LL);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }

    else
    {
      v6 &= *(void *)&v3 - 1LL;
    }

LABEL_18:
    *(void *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }

  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8LL);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }

    else
    {
      v6 &= *(void *)&v3 - 1LL;
    }

    if (v6 != v4) {
      goto LABEL_18;
    }
  }

LABEL_19:
  ++result[3];
  return result;
}

void sub_183C11844(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2LL;
  }

  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }

  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }

    else
    {
      uint64_t v7 = 1LL << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }

    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4) {
LABEL_16:
    }
      sub_183C11920(a1, prime);
  }

void sub_183C11920(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_183BF7310();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0LL;
    *(void *)(a1 + sub_183BF7C10(v6 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0LL;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }

      else
      {
        v8 &= a2 - 1;
      }

      *(void *)(*(void *)a1 + 8 * vsub_183BF7C10(v6 + 8) = a1 + 16;
      for (uint64_t i = (void *)*v7; *v7; uint64_t i = (void *)*v7)
      {
        unint64_t v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2) {
            v12 %= a2;
          }
        }

        else
        {
          v12 &= a2 - 1;
        }

        if (v12 == v8)
        {
          uint64_t v7 = i;
        }

        else
        {
          size_t v13 = i;
          if (*(void *)(*(void *)a1 + 8 * v12))
          {
            do
            {
              uint8x8_t v14 = v13;
              size_t v13 = (void *)*v13;
            }

            while (v13 && i[2] == v13[2]);
            *uint64_t v7 = v13;
            void *v14 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = i;
          }

          else
          {
            *(void *)(*(void *)a1 + 8 * v12) = v7;
            uint64_t v7 = i;
            unint64_t v8 = v12;
          }
        }
      }
    }
  }

  else
  {
    BOOL v10 = *(void **)a1;
    *(void *)a1 = 0LL;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + sub_183BF7C10(v6 + 8) = 0LL;
  }

uint64_t sub_183C11A90(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_183C11AC8(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      int8x8_t v3 = (void *)*v2;
      sub_183BF7C10((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

uint64_t sub_183C11B04(void *a1, void *a2)
{
  int8x8_t v3 = sub_183C11B58(a1, a2);
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = 1LL;
  do
  {
    uint64_t v5 = v4;
    int8x8_t v3 = (void *)*v3;
    if (!v3) {
      break;
    }
    ++v4;
  }

  while (v3[2] == *a2);
  return v5;
}

void *sub_183C11B58(void *a1, void *a2)
{
  unint64_t v4 = (*(uint64_t (**)(void))(*(void *)*a2 + 40LL))(*a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0LL;
  }
  uint8x8_t v6 = (uint8x8_t)vcnt_s8(v5);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    unint64_t v7 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v7 = v4 % *(void *)&v5;
    }
  }

  else
  {
    unint64_t v7 = (*(void *)&v5 - 1LL) & v4;
  }

  uint64_t i = *(void **)(*a1 + 8 * v7);
  if (i)
  {
    for (uint64_t i = (void *)*i; i; uint64_t i = (void *)*i)
    {
      unint64_t v9 = i[1];
      if (v4 == v9)
      {
        if (i[2] == *a2) {
          return i;
        }
      }

      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v9 >= *(void *)&v5) {
            v9 %= *(void *)&v5;
          }
        }

        else
        {
          v9 &= *(void *)&v5 - 1LL;
        }

        if (v9 != v7) {
          return 0LL;
        }
      }
    }
  }

  return i;
}

void sub_183C11C3C(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    unint64_t v4 = (void **)v1[1];
    int8x8_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
        uint8x8_t v6 = v4;
        sub_183BF7C68(&v6);
      }

      while (v4 != v2);
      int8x8_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void *sub_183C11CAC(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_183BF7288();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint8x8_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    uint8x8_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

char *sub_183C11D5C(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  if (a4)
  {
    uint8x8_t v6 = result;
    sub_183BFB0A0(result, a4);
    uint64_t result = sub_183C08248((uint64_t)(v6 + 16), a2, a3, *((char **)v6 + 1));
    *((void *)v6 + 1) = result;
  }

  return result;
}

void sub_183C11DC0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + sub_183BF7C10(v6 + 8) = v10;
  sub_183C11DE0(&a9);
  _Unwind_Resume(a1);
}

void sub_183C11DE0(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_183C083D8((uint64_t *)v2);
    operator delete(**a1);
  }

void *sub_183C11E20(void *a1, uint64_t a2, uint64_t a3)
{
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)));
      uint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x189614558]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32LL);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }

    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!sub_183C11F84(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)),  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24LL) + 32) | 5);
    }
  }

  MEMORY[0x186E232E4](v13);
  return a1;
}

void sub_183C11F28( void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
}

void sub_183C11F70(_Unwind_Exception *a1)
{
}

uint64_t sub_183C11F84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0LL;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (v12 >= 1)
    {
      sub_183BFE034(__p, v12, __c);
      size_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96LL))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0LL;
      }
    }

    uint64_t v15 = a4 - a3;
    else {
      return 0LL;
    }
  }

  return v6;
}

void sub_183C120A4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_183C120C0(void ***a1)
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
        v4 -= 120LL;
        sub_183C08C94((uint64_t)(v1 + 2), v4);
      }

      while ((void *)v4 != v2);
      size_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void sub_183C12144(void **a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    uint64_t v3 = (uint64_t)a1[1];
    uint64_t v4 = *a1;
    if ((void *)v3 != v1)
    {
      do
      {
        v3 -= 120LL;
        sub_183C08C94((uint64_t)(a1 + 2), v3);
      }

      while ((void *)v3 != v1);
      uint64_t v4 = *a1;
    }

    a1[1] = v1;
    operator delete(v4);
    *a1 = 0LL;
    a1[1] = 0LL;
    a1[2] = 0LL;
  }

void sub_183C121B0(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_183C121B0(a1, *a2);
    sub_183C121B0(a1, a2[1]);
    sub_183C121F8((uint64_t)(a2 + 4));
    operator delete(a2);
  }

void sub_183C121F8(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 24);
  if (v2 == 4)
  {
    uint64_t v3 = (void **)(a1 + 32);
    sub_183C11DE0(&v3);
  }

  else if (v2 == 3 && *(char *)(a1 + 55) < 0)
  {
    operator delete(*(void **)(a1 + 32));
  }

uint64_t *sub_183C12264(uint64_t **a1, const void **a2, uint64_t a3, __int128 **a4)
{
  uint64_t v6 = (uint64_t **)sub_183C1230C((uint64_t)a1, &v11, a2);
  uint64_t v7 = *v6;
  if (!*v6)
  {
    int v8 = v6;
    sub_183C123A8((uint64_t)a1, a4, (uint64_t)v10);
    sub_183C12438(a1, v11, v8, v10[0]);
    uint64_t v7 = v10[0];
    v10[0] = 0LL;
    sub_183C1268C((uint64_t)v10, 0LL);
  }

  return v7;
}

void *sub_183C1230C(uint64_t a1, void *a2, const void **a3)
{
  size_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        int v8 = (void *)v4;
        int v9 = (const void **)(v4 + 32);
        uint64_t v4 = *v8;
        size_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }

      if (!sub_183C1248C(v7, v9, a3)) {
        break;
      }
      size_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }

    while (v4);
  }

  else
  {
    int v8 = (void *)(a1 + 8);
  }

LABEL_10:
  *a2 = v8;
  return v5;
}

_BYTE *sub_183C123A8@<X0>(uint64_t a1@<X0>, __int128 **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x58uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + sub_183BF7C10(v6 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  uint64_t result = v6 + 32;
  int v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    uint64_t result = sub_183BFF5D4(result, *(void **)v8, *((void *)v8 + 1));
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

void sub_183C12420(_Unwind_Exception *a1)
{
}

uint64_t *sub_183C12438(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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

  uint64_t result = sub_183C124F4(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

BOOL sub_183C1248C(uint64_t a1, const void **a2, const void **a3)
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
    int v8 = a3;
  }
  else {
    int v8 = *a3;
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

uint64_t *sub_183C124F4(uint64_t *result, uint64_t *a2)
{
  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      int v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24)) {
        return result;
      }
      int v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), size_t v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            size_t v9 = (uint64_t **)a2[2];
          }

          else
          {
            size_t v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              int v3 = (uint64_t *)v2[2];
            }

            v9[2] = v3;
            *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = v9;
            unint64_t *v9 = v2;
            v2[2] = (uint64_t)v9;
            int v3 = v9[2];
            int v2 = (uint64_t *)*v3;
          }

          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *int v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }

      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), size_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            int v3 = (uint64_t *)v2[2];
          }

          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          int v3 = (uint64_t *)a2[2];
        }

        else
        {
          a2 = (uint64_t *)a2[2];
        }

        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        int v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        _OWORD v3[2] = (uint64_t)v2;
        return result;
      }

      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *size_t v5 = 1;
    }

    while (v3 != result);
  }

  return result;
}

void sub_183C1268C(uint64_t a1, uint64_t a2)
{
  int v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16)) {
      sub_183C121F8((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }

dispatch_time_t applesauce::dispatch::v1::walltime( std::chrono::duration<long long, std::ratio<1, 1000000>>::rep a1)
{
  __t.__d_.__rep_ = a1;
  time_t v1 = std::chrono::system_clock::to_time_t(&__t);
  v2.__d_.__rep_ = std::chrono::system_clock::from_time_t(v1).__d_.__rep_;
  uint64_t v3 = 1000 * (__t.__d_.__rep_ - v2.__d_.__rep_);
  if (__t.__d_.__rep_ < v2.__d_.__rep_) {
    v3 += 1000000000LL;
  }
  when.tv_sec = v1 + ((__t.__d_.__rep_ - v2.__d_.__rep_) >> 63);
  when.tv_nsec = v3;
  return dispatch_walltime(&when, 0LL);
}

void applesauce::xpc::object::to_string(void **this@<X0>, void *a2@<X8>)
{
  *a2 = 0LL;
  a2[1] = 0LL;
  a2[2] = 0LL;
  v2[0] = a2;
  v2[1] = 0LL;
  sub_183C12790((uint64_t)v2, *this);
}

void sub_183C12774(_Unwind_Exception *exception_object)
{
}

void sub_183C12790(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x186E235D8](a2);
  if (v4 == MEMORY[0x1895F9250])
  {
    std::string::push_back(*(std::string **)a1, 123);
    if (xpc_dictionary_get_count(a2))
    {
      std::string::size_type v5 = MEMORY[0x1895F87A8];
      ++*(void *)(a1 + 8);
      applier.__r_.__value_.__r.__words[0] = v5;
      applier.__r_.__value_.__l.__size_ = 0x40000000LL;
      applier.__r_.__value_.__l.__cap_ = (std::string::size_type)sub_183C1309C;
      int64x2_t v47 = &unk_189D38CE8;
      uint64_t v48 = a1;
      xpc_dictionary_apply(a2, &applier);
      int v6 = *(std::string **)a1;
      --*(void *)(a1 + 8);
      else {
        std::string::size_type size = v6->__r_.__value_.__s.__size_;
      }
      std::string::resize(v6, size - 1, 0);
      std::string::push_back(*(std::string **)a1, 10);
      std::string::append(*(std::string **)a1, *(void *)(a1 + 8), 9);
    }

    int v22 = *(std::string **)a1;
    std::string::value_type v23 = 125;
    goto LABEL_44;
  }

  if (v4 == MEMORY[0x1895F92E8])
  {
    string_ptr = xpc_string_get_string_ptr(a2);
    std::string::size_type length = xpc_string_get_length(a2);
    std::string::push_back(*(std::string **)a1, 34);
    std::string::append(*(std::string **)a1, string_ptr, length);
    std::string::push_back(*(std::string **)a1, 34);
    return;
  }

  if (v4 == MEMORY[0x1895F9280])
  {
    int64_t value = xpc_int64_get_value(a2);
    uint64_t v11 = *(std::string **)a1;
    std::to_string(&applier, value);
    if ((applier.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_std::string applier = &applier;
    }
    else {
      p_std::string applier = (std::string *)applier.__r_.__value_.__r.__words[0];
    }
    if ((applier.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      std::string::size_type v13 = applier.__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type v13 = applier.__r_.__value_.__l.__size_;
    }
LABEL_25:
    std::string::append(v11, (const std::string::value_type *)p_applier, v13);
    return;
  }

  if (v4 == MEMORY[0x1895F9220])
  {
    std::string::push_back(*(std::string **)a1, 91);
    size_t count = xpc_array_get_count(a2);
    if (!count)
    {
      std::string::push_back(*(std::string **)a1, 93);
      return;
    }

    size_t v15 = count;
    unint64_t v16 = 0LL;
    ++*(void *)(a1 + 8);
    do
    {
      if (v16) {
        std::string::push_back(*(std::string **)a1, 44);
      }
      std::string::push_back(*(std::string **)a1, 10);
      std::string::append(*(std::string **)a1, *(void *)(a1 + 8), 9);
      int v17 = *(std::string **)a1;
      std::to_string(&applier, v16);
      if ((applier.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        char v18 = &applier;
      }
      else {
        char v18 = (std::string *)applier.__r_.__value_.__r.__words[0];
      }
      if ((applier.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        std::string::size_type v19 = applier.__r_.__value_.__s.__size_;
      }
      else {
        std::string::size_type v19 = applier.__r_.__value_.__l.__size_;
      }
      std::string::append(v17, (const std::string::value_type *)v18, v19);
      std::string::append(*(std::string **)a1, ": ");
      xpc_object_t v20 = xpc_array_get_value(a2, v16);
      sub_183C12790(a1, v20);
      ++v16;
    }

    while (v15 != v16);
    BOOL v21 = *(std::string **)a1;
    --*(void *)(a1 + 8);
    std::string::push_back(v21, 10);
    std::string::append(*(std::string **)a1, *(void *)(a1 + 8), 9);
    int v22 = *(std::string **)a1;
    std::string::value_type v23 = 93;
    goto LABEL_44;
  }

  if (v4 != MEMORY[0x1895F9240])
  {
    if (v4 == MEMORY[0x1895F9228])
    {
      if (xpc_BOOL_get_value(a2)) {
        uint64_t v36 = "true";
      }
      else {
        uint64_t v36 = "false";
      }
      int v37 = *(std::string **)a1;
      goto LABEL_82;
    }

    if (v4 != MEMORY[0x1895F92F0])
    {
      if (v4 != MEMORY[0x1895F92A8])
      {
        if (v4 == MEMORY[0x1895F9258])
        {
          sub_183C12E6C((std::string **)a1, a2);
        }

        else if (v4 == MEMORY[0x1895F9248])
        {
          sub_183C12EF4((std::string **)a1, a2);
        }

        else if (v4 == MEMORY[0x1895F92F8])
        {
          sub_183C12F9C((std::string **)a1, a2);
        }

        else if (v4 == MEMORY[0x1895F9268])
        {
          sub_183C13008((std::string **)a1, a2);
        }

        else
        {
          xpc_object_t object = a2;
          if (a2) {
            xpc_retain(a2);
          }
          else {
            xpc_object_t object = xpc_null_create();
          }
          uint64_t v42 = *(std::string **)a1;
          sub_183C13064(&object, &applier);
          if ((applier.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            unint64_t v43 = &applier;
          }
          else {
            unint64_t v43 = (std::string *)applier.__r_.__value_.__r.__words[0];
          }
          if ((applier.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            std::string::size_type v44 = applier.__r_.__value_.__s.__size_;
          }
          else {
            std::string::size_type v44 = applier.__r_.__value_.__l.__size_;
          }
          std::string::append(v42, (const std::string::value_type *)v43, v44);
          xpc_release(object);
        }

        return;
      }

      int v37 = *(std::string **)a1;
      uint64_t v36 = "null";
LABEL_82:
      std::string::append(v37, v36);
      return;
    }

    uint64_t v38 = xpc_uint64_get_value(a2);
    uint64_t v39 = *(std::string **)a1;
    std::to_string(&applier, v38);
    if ((applier.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      unint64_t v40 = &applier;
    }
    else {
      unint64_t v40 = (std::string *)applier.__r_.__value_.__r.__words[0];
    }
    if ((applier.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      std::string::size_type v41 = applier.__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type v41 = applier.__r_.__value_.__l.__size_;
    }
    std::string::append(v39, (const std::string::value_type *)v40, v41);
    int v22 = *(std::string **)a1;
    std::string::value_type v23 = 117;
LABEL_44:
    std::string::push_back(v22, v23);
    return;
  }

  bytes_ptr = xpc_data_get_bytes_ptr(a2);
  int64_t v25 = xpc_data_get_length(a2);
  std::string::append(*(std::string **)a1, "[");
  unint64_t v26 = *(std::string **)a1;
  std::to_string(&applier, v25);
  if ((applier.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    char v27 = &applier;
  }
  else {
    char v27 = (std::string *)applier.__r_.__value_.__r.__words[0];
  }
  if ((applier.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    std::string::size_type v28 = applier.__r_.__value_.__s.__size_;
  }
  else {
    std::string::size_type v28 = applier.__r_.__value_.__l.__size_;
  }
  std::string::append(v26, (const std::string::value_type *)v27, v28);
  std::string::append(*(std::string **)a1, " bytes]");
  if (v25)
  {
    std::string::append(*(std::string **)a1, " ");
    uint64_t v11 = *(std::string **)a1;
    memset(&applier, 0, sizeof(applier));
    if (v25 < 1)
    {
      signed __int8 v33 = 0;
    }

    else
    {
      uint64_t v29 = &bytes_ptr[v25];
      do
      {
        else {
          char v30 = 48;
        }
        std::string::push_back(&applier, v30 + (*bytes_ptr >> 4));
        unsigned int v31 = *bytes_ptr & 0xF;
        if (v31 >= 0xA) {
          char v32 = 87;
        }
        else {
          char v32 = 48;
        }
        std::string::push_back(&applier, v32 + v31);
        std::string::push_back(&applier, 32);
        ++bytes_ptr;
      }

      while (bytes_ptr < v29);
      signed __int8 v33 = applier.__r_.__value_.__s.__size_;
      if ((char)applier.__r_.__value_.__s.__size_ < 0)
      {
        std::string::size_type v34 = applier.__r_.__value_.__l.__size_;
        if (applier.__r_.__value_.__l.__size_)
        {
          std::string::size_type v35 = applier.__r_.__value_.__r.__words[0];
          goto LABEL_87;
        }
      }

      else if (applier.__r_.__value_.__s.__size_)
      {
        std::string::size_type v34 = applier.__r_.__value_.__s.__size_;
        std::string::size_type v35 = (std::string::size_type)&applier;
LABEL_87:
        std::string::erase(&applier, ~v35 + v35 + v34, 1uLL);
        signed __int8 v33 = applier.__r_.__value_.__s.__size_;
      }
    }

    if (v33 >= 0) {
      p_std::string applier = &applier;
    }
    else {
      p_std::string applier = (std::string *)applier.__r_.__value_.__r.__words[0];
    }
    if (v33 >= 0) {
      std::string::size_type v13 = v33;
    }
    else {
      std::string::size_type v13 = applier.__r_.__value_.__l.__size_;
    }
    goto LABEL_25;
  }

void sub_183C12E08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  xpc_release(object);
  _Unwind_Resume(a1);
}

void sub_183C12E6C(std::string **a1, xpc_object_t xdouble)
{
  double value = xpc_double_get_value(xdouble);
  uint64_t v4 = *a1;
  std::to_string(&v7, value);
  if ((v7.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    std::string::size_type v5 = &v7;
  }
  else {
    std::string::size_type v5 = (std::string *)v7.__r_.__value_.__r.__words[0];
  }
  if ((v7.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    std::string::size_type size = v7.__r_.__value_.__s.__size_;
  }
  else {
    std::string::size_type size = v7.__r_.__value_.__l.__size_;
  }
  std::string::append(v4, (const std::string::value_type *)v5, size);
}

void sub_183C12ED8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::string *sub_183C12EF4(std::string **a1, xpc_object_t xdate)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  time_t v5 = xpc_date_get_value(xdate) / 0x3B9ACA00uLL;
  localtime_r(&v5, &v4);
  strftime(__s, 0x1EuLL, "%F %T %Z", &v4);
  return std::string::append(*a1, __s);
}

std::string *sub_183C12F9C(std::string **a1, xpc_object_t xuuid)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  bytes = xpc_uuid_get_bytes(xuuid);
  uuid_unparse_lower(bytes, out);
  return std::string::append(*a1, out);
}

void sub_183C13008(std::string **a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1895F91B0]);
  std::string::append(*a1, "XPC_ERROR(");
  std::string::append(*a1, string);
  std::string::push_back(*a1, 41);
}

void sub_183C13064(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (char *)MEMORY[0x186E23560](*a1);
  sub_183C11CAC(a2, v3);
  free(v3);
}

uint64_t sub_183C1309C(uint64_t a1, const std::string::value_type *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  std::string::push_back(*(std::string **)v5, 10);
  std::string::append(*(std::string **)v5, *(void *)(v5 + 8), 9);
  std::string::push_back(*(std::string **)v5, 34);
  std::string::append(*(std::string **)v5, a2);
  std::string::append(*(std::string **)v5, ": ");
  sub_183C12790(v5, a3);
  std::string::push_back(*(std::string **)v5, 44);
  return 1LL;
}

uint64_t applesauce::xpc::dyn_cast_or_default(xpc_object_t *a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x186E235D8](*a1);
  xpc_object_t v5 = *a1;
  if (v4 == MEMORY[0x1895F9280]) {
    return xpc_int64_get_value(v5);
  }
  uint64_t v6 = MEMORY[0x186E235D8](v5);
  xpc_object_t v7 = *a1;
  if (v6 == MEMORY[0x1895F92F0]) {
    return xpc_uint64_get_value(v7);
  }
  if (MEMORY[0x186E235D8](v7) == MEMORY[0x1895F9228]) {
    return applesauce::xpc::dyn_cast_or_default(a1, 0LL);
  }
  return a2;
}

BOOL applesauce::xpc::dyn_cast_or_default(xpc_object_t *a1, uint64_t a2)
{
  uint64_t v4 = MEMORY[0x186E235D8](*a1);
  xpc_object_t v5 = *a1;
  if (v4 == MEMORY[0x1895F9228]) {
    return v5 == (xpc_object_t)MEMORY[0x1895F9178];
  }
  uint64_t v6 = MEMORY[0x186E235D8](v5);
  xpc_object_t v7 = *a1;
  if (v6 == MEMORY[0x1895F9280])
  {
    uint64_t value = xpc_int64_get_value(v7);
    return value != 0;
  }

  if (MEMORY[0x186E235D8](v7) == MEMORY[0x1895F92F0])
  {
    uint64_t value = xpc_uint64_get_value(*a1);
    return value != 0;
  }

  return a2;
}

uint64_t applesauce::xpc::dyn_cast_or_default(xpc_object_t *a1, int64_t value)
{
  uint64_t v4 = MEMORY[0x186E235D8](*a1);
  xpc_object_t v5 = *a1;
  if (v4 == MEMORY[0x1895F9280])
  {
    uint64_t value = xpc_int64_get_value(v5);
    if (value < 0)
    {
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      sub_183BFDB40(exception, "dyn_cast to uint64_t requires nonnegative values");
      __cxa_throw(exception, (struct type_info *)off_189D37AF8, MEMORY[0x189614200]);
    }
  }

  else if (MEMORY[0x186E235D8](v5) == MEMORY[0x1895F92F0])
  {
    return xpc_uint64_get_value(*a1);
  }

  return value;
}

void sub_183C13304(_Unwind_Exception *a1)
{
}

uint64_t applesauce::xpc::dyn_cast_or_default(xpc_object_t *a1, int a2)
{
  return applesauce::xpc::dyn_cast_or_default(a1, a2);
}

uint64_t applesauce::xpc::dyn_cast_or_default(xpc_object_t *a1, unsigned int a2)
{
  return applesauce::xpc::dyn_cast_or_default(a1, a2);
}

char *applesauce::xpc::dyn_cast_or_default@<X0>(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, char **a3@<X8>)
{
  uint64_t v6 = MEMORY[0x186E235D8](*a1);
  uint64_t v7 = MEMORY[0x1895F9240];
  a3[1] = 0LL;
  a3[2] = 0LL;
  *a3 = 0LL;
  if (v6 != v7) {
    return (char *)sub_183C13810(a3, *(const void **)a2, *(void *)(a2 + 8), *(void *)(a2 + 8) - *(void *)a2);
  }
  bytes_ptr = (char *)xpc_data_get_bytes_ptr(*a1);
  size_t length = xpc_data_get_length(*a1);
  return sub_183C13628((uint64_t)a3, *a3, bytes_ptr, &bytes_ptr[length], length);
}

void sub_183C133E4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + sub_183BF7C10(v6 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void *applesauce::xpc::dyn_cast_or_default@<X0>(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t result = (void *)MEMORY[0x186E235D8](*a1);
  if (result == (void *)MEMORY[0x1895F92E8])
  {
    string_ptr = (char *)xpc_string_get_string_ptr(*a1);
    size_t length = xpc_string_get_length(*a1);
    return sub_183C13580(a3, string_ptr, length);
  }

  else if (*(char *)(a2 + 23) < 0)
  {
    return sub_183BFF5D4(a3, *(void **)a2, *(void *)(a2 + 8));
  }

  else
  {
    *(_OWORD *)a3 = *(_OWORD *)a2;
    a3[2] = *(void *)(a2 + 16);
  }

  return result;
}

void *applesauce::xpc::dyn_cast_or_default@<X0>(xpc_object_t *a1@<X0>, char *a2@<X1>, void *a3@<X8>)
{
  if (MEMORY[0x186E235D8](*a1) != MEMORY[0x1895F92E8]) {
    return sub_183C11CAC(a3, a2);
  }
  string_ptr = (char *)xpc_string_get_string_ptr(*a1);
  size_t length = xpc_string_get_length(*a1);
  return sub_183C13580(a3, string_ptr, length);
}

double applesauce::xpc::dyn_cast_or_default(xpc_object_t *a1, double a2)
{
  if (MEMORY[0x186E235D8](*a1) == MEMORY[0x1895F9258]) {
    return xpc_double_get_value(*a1);
  }
  else {
    return a2;
  }
}

void *sub_183C13580(void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_183BF7288();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000LL;
    *std::string __dst = v6;
  }

  else
  {
    *((_BYTE *)__dst + 23) = __len;
    uint64_t v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }

  memmove(v6, __src, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

char *sub_183C13628(uint64_t a1, char *__dst, char *__src, char *a4, int64_t a5)
{
  xpc_object_t v5 = __dst;
  if (a5 < 1) {
    return v5;
  }
  int v10 = *(char **)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    uint64_t v11 = *(char **)a1;
    uint64_t v12 = (uint64_t)&v10[a5 - *(void *)a1];
    if (v12 < 0) {
      sub_183BF77E4();
    }
    std::string::size_type v13 = (char *)(__dst - v11);
    unint64_t v14 = v9 - (void)v11;
    if (2 * v14 > v12) {
      uint64_t v12 = 2 * v14;
    }
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v15 = v12;
    }
    if (v15)
    {
      size_t v16 = v15;
      int v17 = (char *)operator new(v15);
    }

    else
    {
      size_t v16 = 0LL;
      int v17 = 0LL;
    }

    char v27 = &v13[(void)v17];
    memcpy(&v13[(void)v17], __src, a5);
    std::string::size_type v28 = &v13[(void)v17];
    size_t v29 = v16;
    if (v11 != v5)
    {
      do
      {
        v13[(void)v17 - 1] = v13[(void)(v11 - 1)];
        --v13;
      }

      while (v13);
      int v10 = *(char **)(a1 + 8);
      std::string::size_type v28 = v17;
    }

    char v30 = &v27[a5];
    unsigned int v31 = &v17[v29];
    if (v10 != v5) {
      memmove(v30, v5, v10 - v5);
    }
    char v32 = *(char **)a1;
    *(void *)a1 = v28;
    *(void *)(a1 + sub_183BF7C10(v6 + 8) = &v30[v10 - v5];
    *(void *)(a1 + 16) = v31;
    if (v32) {
      operator delete(v32);
    }
    return v27;
  }

  uint64_t v18 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    std::string::size_type v19 = &__src[a5];
    BOOL v21 = *(char **)(a1 + 8);
LABEL_17:
    int v22 = &v5[a5];
    std::string::value_type v23 = &v21[-a5];
    uint64_t v24 = v21;
    if (&v21[-a5] < v10)
    {
      int64_t v25 = &v10[a5] - v21;
      uint64_t v24 = v21;
      do
      {
        char v26 = *v23++;
        *v24++ = v26;
        --v25;
      }

      while (v25);
    }

    *(void *)(a1 + sub_183BF7C10(v6 + 8) = v24;
    if (v21 != v22) {
      memmove(&v5[a5], v5, v21 - v22);
    }
    if (v19 != __src) {
      memmove(v5, __src, v19 - __src);
    }
    return v5;
  }

  std::string::size_type v19 = &__src[v18];
  int64_t v20 = a4 - &__src[v18];
  if (a4 != &__src[v18]) {
    memmove(*(void **)(a1 + 8), &__src[v18], a4 - &__src[v18]);
  }
  BOOL v21 = &v10[v20];
  *(void *)(a1 + sub_183BF7C10(v6 + 8) = &v10[v20];
  if (v18 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void *sub_183C13810(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    uint64_t v6 = result;
    uint64_t result = sub_183C13888(result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }

  return result;
}

void sub_183C1386C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + sub_183BF7C10(v6 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_183C13888(void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000LL) != 0) {
    sub_183BF77E4();
  }
  uint64_t result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void applesauce::xpc::auto_reply::create_from_request(xpc_object_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = MEMORY[0x186E235D8](*a1);
  uint64_t v5 = MEMORY[0x1895F9250];
  if (v4 != MEMORY[0x1895F9250])
  {
    *a2 = 0LL;
    a2[1] = 0LL;
    return;
  }

  xpc_object_t reply = xpc_dictionary_create_reply(*a1);
  xpc_object_t v7 = reply;
  if (reply)
  {
    xpc_object_t v9 = reply;
  }

  else
  {
    xpc_object_t v7 = xpc_null_create();
    xpc_object_t v9 = v7;
    if (!v7)
    {
      size_t v8 = 0LL;
      goto LABEL_10;
    }
  }

  if (MEMORY[0x186E235D8](v7) != v5)
  {
    size_t v8 = v7;
LABEL_10:
    xpc_object_t v7 = xpc_null_create();
    xpc_object_t v9 = v7;
    goto LABEL_11;
  }

  xpc_retain(v7);
  size_t v8 = v7;
LABEL_11:
  applesauce::xpc::auto_reply::create_from_reply(&v9, a2);
  xpc_release(v7);
  xpc_object_t v9 = 0LL;
  xpc_release(v8);
}

void applesauce::xpc::auto_reply::create_from_reply(xpc_object_t *a1@<X0>, void *a2@<X8>)
{
  if (MEMORY[0x186E235D8](*a1) != MEMORY[0x1895F9250])
  {
    *a2 = 0LL;
    a2[1] = 0LL;
    return;
  }

  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(*a1);
  xpc_object_t v5 = remote_connection;
  uint64_t v6 = MEMORY[0x1895F9238];
  if (remote_connection)
  {
    xpc_retain(remote_connection);
    xpc_object_t v8 = v5;
  }

  else
  {
    xpc_object_t v5 = xpc_null_create();
    xpc_object_t v8 = v5;
    if (!v5) {
      goto LABEL_7;
    }
  }

  if (MEMORY[0x186E235D8](v5) == v6)
  {
    xpc_retain(v5);
    goto LABEL_9;
  }

LABEL_7:
  xpc_object_t v8 = xpc_null_create();
LABEL_9:
  xpc_release(v5);
  xpc_object_t v7 = v8;
  if (MEMORY[0x186E235D8](v8) == v6)
  {
    applesauce::xpc::auto_reply::create_from_dict((std::__shared_weak_count_vtbl **)a1, (uint64_t *)&v8, a2);
  }

  else
  {
    *a2 = 0LL;
    a2[1] = 0LL;
  }

  xpc_release(v7);
}

void applesauce::xpc::auto_reply::create_from_dict( std::__shared_weak_count_vtbl **a1@<X0>, uint64_t *a2@<X1>, void *a3@<X8>)
{
  if (MEMORY[0x186E235D8](*a1) == MEMORY[0x1895F9250] && MEMORY[0x186E235D8](*a2) == MEMORY[0x1895F9238])
  {
    uint64_t v6 = (std::__shared_weak_count *)operator new(0x28uLL);
    v6->__shared_owners_ = 0LL;
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    v6->__shared_weak_owners_ = 0LL;
    v6->__vftable = (std::__shared_weak_count_vtbl *)off_189D38D18;
    xpc_object_t v8 = *a1;
    v6[1].__vftable = *a1;
    xpc_object_t v9 = &v6[1].__vftable;
    if (v8) {
      xpc_retain(v8);
    }
    else {
      void *v9 = xpc_null_create();
    }
    int v10 = (void *)*a2;
    v6[1].__shared_owners_ = *a2;
    if (v10) {
      xpc_retain(v10);
    }
    else {
      v6[1].__shared_owners_ = (uint64_t)xpc_null_create();
    }
    do
      unint64_t v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
    *a3 = v9;
    a3[1] = v6;
    do
      unint64_t v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

  else
  {
    *a3 = 0LL;
    a3[1] = 0LL;
  }

void sub_183C13BCC(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_189D38D18;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_183C13BDC(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_189D38D18;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void sub_183C13BFC(uint64_t a1)
{
  if (MEMORY[0x186E235D8](*(void *)(a1 + 32)) == MEMORY[0x1895F9238]
    && MEMORY[0x186E235D8](*(void *)(a1 + 24)) == MEMORY[0x1895F9250])
  {
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 24));
  }

  xpc_release(*(xpc_object_t *)(a1 + 32));
  *(void *)(a1 + 32) = 0LL;
  xpc_release(*(xpc_object_t *)(a1 + 24));
  *(void *)(a1 + 24) = 0LL;
}

void sub_183C13C88(std::__shared_weak_count *a1)
{
  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    unint64_t v3 = __ldaxr(p_shared_owners);
  while (__stlxr(v3 - 1, p_shared_owners));
  if (!v3)
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string::size_type std::string::find( const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x189614170](this, __c, __pos);
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x1896141C0](retstr, this);
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

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x189614220](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x189614238](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x189614228](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x189614240](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x189614268](this);
}

std::regex_error *__cdecl std::regex_error::regex_error( std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x189614280](this, *(void *)&__ecode);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1896142A0](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1896142C8](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1896142D0](this, __s);
}

std::string *__cdecl std::string::append( std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1896142D8](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1896142E8](this, __n, __c);
}

std::string *__cdecl std::string::insert( std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x189614308](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string( std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x189614348](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x189614358](this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x189614360](this, __c);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1896143B0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1896143B8]();
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
  return MEMORY[0x189614410]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x189614458](__s, __icase);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x1896144D8](retstr, __s);
}

uint64_t std::stol(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x189614550](__str, __idx, *(void *)&__base);
}

std::chrono::system_clock::time_point std::chrono::system_clock::from_time_t(time_t __t)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x1896145A0](__t);
}

time_t std::chrono::system_clock::to_time_t(const std::chrono::system_clock::time_point *__t)
{
  return MEMORY[0x1896145B0](__t);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x1896145B8](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x1896145C0](this);
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x189614640](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x189614668](retstr, __val);
}

{
  return (std::string *)MEMORY[0x189614678](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x189614670](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x189614680]();
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_189D37B28(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1896147A0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1895F8878](lpfunc, obj, lpdso_handle);
}

void __cxa_bad_typeid(void)
{
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

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1896147F0](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast( const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x189614810](lpsrc, lpstype, lpdtype, s2d);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1895FAEF0](when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1895FBA20](a1, a2);
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FBE00](__s, *(void *)&__c, __n);
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

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1895FD090](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1895FD808](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1895FD860](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1895FD8C0](xBOOL);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1895FDA98](object);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1895FDB20](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1895FDB30](xdata);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x1895FDB58](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1895FDB78](xdict, applier);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1895FDBB0](original);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1895FDBF8](xdict);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1895FDC38](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1895FDC48](xdict, key);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1895FDEC8](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1895FDF48]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1895FDF88](object);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x1895FE070](xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1895FE080](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1895FE0E0](xuint);
}