void __cxa_bad_cast(void)
{
  std::bad_cast *exception;
  std::bad_cast *v1;
  exception = (std::bad_cast *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_cast::bad_cast(exception);
}

void __cxa_bad_typeid(void)
{
  exception = (std::bad_typeid *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_typeid::bad_typeid(exception);
}

void __cxa_throw_bad_array_new_length(void)
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void demangling_terminate_handler(void)
{
  globals_fast = (const _Unwind_Exception **)__cxa_get_globals_fast();
  if (!globals_fast || (v8 = *globals_fast) == 0LL) {
    abort_message("terminating", v1, v2, v3, v4, v5, v6, v7, v33);
  }
  if (__cxxabiv1::__isOurExceptionClass(v8 + 3))
  {
    if (__cxxabiv1::__getExceptionClass(v8 + 3) == 0x434C4E47432B2B01LL) {
      exception_cleanup = v8->exception_cleanup;
    }
    else {
      exception_cleanup = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))&v8[4];
    }
    v34 = exception_cleanup;
    private_1 = (const __cxxabiv1::__shim_type_info *)v8->private_1;
    __cxa_demangle((const char *)(*((void *)private_1 + 1) & 0x7FFFFFFFFFFFFFFFLL), 0LL, 0LL, 0LL);
    {
      char v25 = cause;
      (*(void (**)(void *))(*(void *)v34 + 16LL))(v34);
      abort_message("terminating due to %s exception of type %s: %s", v26, v27, v28, v29, v30, v31, v32, v25);
    }

    abort_message("terminating due to %s exception of type %s", v18, v19, v20, v21, v22, v23, v24, cause);
  }

  abort_message("terminating due to %s foreign exception", v9, v10, v11, v12, v13, v14, v15, cause);
}

void sub_18040F468(_Unwind_Exception *exception_object)
{
  if (v1) {
    v2(v1);
  }
  _Unwind_Resume(exception_object);
}

void demangling_unexpected_handler(void)
{
  cause = (uint64_t)"unexpected";
  std::terminate();
}

std::unexpected_handler std::set_unexpected(std::unexpected_handler a1)
{
  std::unexpected_handler v1 = (std::unexpected_handler)demangling_unexpected_handler;
  if (a1) {
    std::unexpected_handler v1 = a1;
  }
  do
    std::unexpected_handler result = (std::unexpected_handler)__ldaxr((unint64_t *)&__cxa_unexpected_handler);
  while (__stlxr((unint64_t)v1, (unint64_t *)&__cxa_unexpected_handler));
  return result;
}

void __clang_call_terminate(void *a1)
{
}

std::terminate_handler std::set_terminate(std::terminate_handler a1)
{
  std::unexpected_handler v1 = demangling_terminate_handler;
  if (a1) {
    std::unexpected_handler v1 = a1;
  }
  do
    std::terminate_handler result = (std::terminate_handler)__ldaxr((unint64_t *)&__cxa_terminate_handler);
  while (__stlxr((unint64_t)v1, (unint64_t *)&__cxa_terminate_handler));
  return result;
}

std::new_handler std::set_new_handler(std::new_handler a1)
{
  do
    std::unexpected_handler v1 = (void (*)(void))__ldaxr(&__cxa_new_handler);
  while (__stlxr((unint64_t)a1, &__cxa_new_handler));
  return v1;
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  uint64_t v4 = (const char *)MEMORY[0x1895F8858](lpmangled, lpout, lpoutlen, lpstatus);
  v8 = v7;
  uint64_t v73 = *MEMORY[0x1895F89C0];
  if (!v4 || (uint64_t v9 = v6, v10 = v5, v11 = (unsigned __int8 *)v4, v5) && !v6)
  {
    uint64_t v12 = 0LL;
    if (v7) {
      *uint64_t v7 = -3;
    }
    return v12;
  }

  size_t v13 = strlen(v4);
  v50 = v11;
  v51 = &v11[v13];
  v52 = v55;
  v53 = v55;
  v54 = v56;
  memset(v55, 0, sizeof(v55));
  v56[0] = v57;
  v56[1] = v57;
  memset(v57, 0, sizeof(v57));
  memset(v59, 0, sizeof(v59));
  v58[0] = v59;
  v58[1] = v59;
  v56[2] = v58;
  v58[2] = v60;
  v60[0] = v61;
  v60[1] = v61;
  v60[2] = &v62;
  memset(v61, 0, sizeof(v61));
  memset(v65, 0, sizeof(v65));
  v62 = v65;
  v63 = v65;
  v64 = &v66;
  __int16 v66 = 1;
  char v67 = 0;
  uint64_t v68 = -1LL;
  int v70 = 0;
  uint64_t v69 = 0LL;
  v71[0] = 0u;
  v72 = v71;
  if (v13 >= 2)
  {
    if (*(_WORD *)v11 == 23135)
    {
      uint64_t v32 = 2LL;
    }

    else
    {
      if (v13 < 3) {
        goto LABEL_20;
      }
      if (*(_WORD *)v11 != 24415 || v11[2] != 90)
      {
        if (v13 < 4) {
          goto LABEL_20;
        }
        if (*(_DWORD *)v11 == 1516199775)
        {
          uint64_t v36 = 4LL;
        }

        else
        {
          if (v13 < 5) {
            goto LABEL_20;
          }
          if (*(_DWORD *)v11 != 1600085855 || v11[4] != 90) {
            goto LABEL_20;
          }
          uint64_t v36 = 5LL;
        }

        v50 = &v11[v36];
        if (!v45
          || (v37 = v50, (unint64_t)(v51 - v50) < 0xD)
          || (*(void *)v50 == 0x695F6B636F6C625FLL ? (BOOL v38 = *(void *)(v50 + 5) == 0x656B6F766E695F6BLL) : (BOOL v38 = 0),
              !v38))
        {
LABEL_38:
          char v33 = 0LL;
          goto LABEL_49;
        }

        v50 += 13;
        if (v37 + 13 == v51 || v37[13] != 95)
        {
        }

        else
        {
          v50 = v37 + 14;
          if (!v24) {
            goto LABEL_38;
          }
        }

        if (v51 != v50)
        {
          if (*v50 != 46) {
            goto LABEL_38;
          }
          v50 = v51;
        }

        goto LABEL_48;
      }

      uint64_t v32 = 3LL;
    }

    v50 = &v11[v32];
    if (!v33) {
      goto LABEL_21;
    }
    v34 = v50;
    if (v51 != v50)
    {
      if (*v50 != 46)
      {
        uint64_t v12 = 0LL;
        int v31 = -2;
        goto LABEL_59;
      }

      uint64_t v44 = v51 - v50;
      *((_BYTE *)v35 + 8) = 1;
      *(_WORD *)((char *)v35 + 9) = *(_WORD *)((_BYTE *)v35 + 9) & 0xF000 | 0x540;
      void *v35 = off_18965A240;
      v35[2] = v33;
      v35[3] = v34;
      v35[4] = v44;
      v50 = v51;
      char v33 = v35;
    }

LABEL_50:
    if (v10) {
      uint64_t v39 = *v9;
    }
    else {
      uint64_t v39 = 0LL;
    }
    v45 = v10;
    uint64_t v46 = 0LL;
    uint64_t v47 = v39;
    uint64_t v48 = -1LL;
    int v49 = 1;
    if (v62 != v63) {
      abort_message( "%s:%d: %s",  v24,  v25,  v26,  v27,  v28,  v29,  v30,  (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/cxa_demangle.cpp");
    }
    (*(void (**)(void *, void **))(*v33 + 32LL))(v33, &v45);
    if ((*(_WORD *)((_BYTE *)v33 + 9) & 0xC0) != 0x40) {
      (*(void (**)(void *, void **))(*v33 + 40LL))(v33, &v45);
    }
    uint64_t v40 = v46++;
    *((_BYTE *)v45 + v40) = 0;
    if (v9) {
      *uint64_t v9 = v46;
    }
    int v31 = 0;
    uint64_t v12 = (char *)v45;
    goto LABEL_59;
  }

LABEL_20:
  if (v51 == v50)
  {
LABEL_48:
    char v33 = v23;
LABEL_49:
    if (!v33) {
      goto LABEL_21;
    }
    goto LABEL_50;
  }

LABEL_21:
  uint64_t v12 = 0LL;
  int v31 = -2;
LABEL_59:
  if (v8) {
    int *v8 = v31;
  }
  v41 = (void **)v72;
  if (v72)
  {
    do
    {
      while (1)
      {
        v42 = (void **)*v41;
        v72 = *v41;
        free(v41);
        v41 = (void **)v72;
        if (!v72) {
          goto LABEL_66;
        }
      }

      v41 = v42;
    }

    while (v42);
  }

  if (v11 >= 2 && *(_WORD *)v8 == 17220)
  {
    *a1 = v8 + 2;
    uint64_t v28 = a1[2];
    uint64_t v29 = a1[3];
    if (!v45) {
      return 0LL;
    }
    uint64_t v30 = (v29 - v28) >> 3;
    while (1)
    {
      v37 = *a1;
      if (*a1 != a1[1] && *v37 == 69) {
        break;
      }
      if (!v45) {
        return 0LL;
      }
    }

    *a1 = v37 + 1;
    uint64_t v40 = v39;
    *((_BYTE *)v20 + 8) = 53;
    *(_WORD *)((char *)v20 + 9) = *(_WORD *)((_BYTE *)v20 + 9) & 0xF000 | 0x540;
    *uint64_t v20 = off_189659C20;
    v20[2] = v38;
    v20[3] = v40;
  }

  else
  {
    if ((v14 & 1) != 0 || *v8 - 67 > 1)
    {
      goto LABEL_35;
    }

    uint64_t v7 = 0LL;
    if (!a3 || v46) {
      return v7;
    }
    if (*((_BYTE *)a3 + 8) == 48)
    {
      uint64_t v16 = *((_DWORD *)a3 + 3);
      *((_BYTE *)v15 + 8) = 47;
      *(_WORD *)((char *)v15 + 9) = *(_WORD *)((_BYTE *)v15 + 9) & 0xF000 | 0x540;
      *uint64_t v15 = off_189659B58;
      *((_DWORD *)v15 + 3) = v16;
      v8 = *a1;
      uint64_t v9 = (unsigned __int8 *)a1[1];
      a3 = v15;
    }

    uint64_t v17 = *v8;
    if (v17 == 67)
    {
      uint64_t v18 = (unsigned __int8 *)(v8 + 1);
      *a1 = v8 + 1;
      if (v8 + 1 == (char *)v9)
      {
        uint64_t v19 = 0;
        uint64_t v18 = v9;
      }

      else if (*v18 == 73)
      {
        uint64_t v18 = (unsigned __int8 *)(v8 + 2);
        *a1 = v8 + 2;
        uint64_t v19 = 1;
      }

      else
      {
        uint64_t v19 = 0;
      }

      if (v9 == v18) {
        return 0LL;
      }
      uint64_t v44 = *v18;
      *a1 = (char *)(v18 + 1);
      if (a2) {
        *a2 = 1;
      }
      if (v19
      {
        return 0LL;
      }

      v42 = v44 - 48;
      uint64_t v20 = v43;
      *((_BYTE *)v43 + 8) = 49;
      *(_WORD *)((char *)v43 + 9) = *(_WORD *)((_BYTE *)v43 + 9) & 0xF000 | 0x540;
      *v43 = off_189659C90;
      v43[2] = a3;
      *((_BYTE *)v43 + 24) = 0;
    }

    else
    {
      uint64_t v7 = 0LL;
      if (v17 != 68) {
        return v7;
      }
      uint64_t v7 = 0LL;
      v41 = v8[1];
      if (v41 > 0x35 || ((1LL << v41) & 0x37000000000000LL) == 0) {
        return v7;
      }
      v42 = v41 - 48;
      *a1 = v8 + 2;
      if (a2) {
        *a2 = 1;
      }
      uint64_t v20 = v43;
      *((_BYTE *)v43 + 8) = 49;
      *(_WORD *)((char *)v43 + 9) = *(_WORD *)((_BYTE *)v43 + 9) & 0xF000 | 0x540;
      *v43 = off_189659C90;
      v43[2] = a3;
      *((_BYTE *)v43 + 24) = 1;
    }

    *((_DWORD *)v43 + 7) = v42;
  }

    goto LABEL_23;
  }

  if (*(_WORD *)v2 == 28271) {
    *a1 = v2 + 2;
  }
LABEL_10:
  if (!v11 || a1[1] == *a1 || **a1 != 73) {
    return v11;
  }
  if (!v12) {
    return 0LL;
  }
  size_t v13 = v12;
  *((_BYTE *)v14 + 8) = 45;
  *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
  *uint64_t v14 = off_189659FA0;
  v14[2] = v11;
  v14[3] = v13;
  return v14;
}

LABEL_66:
  v71[0] = 0uLL;
  v72 = v71;
  if (v62 != v65) {
    free(v62);
  }
  if (v60[0] != v61) {
    free(v60[0]);
  }
  if (v58[0] != v59) {
    free(v58[0]);
  }
  if (v56[0] != v57) {
    free(v56[0]);
  }
  if (v52 != v55) {
    free(v52);
  }
  return v12;
}

void sub_18040FA8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void *anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>::~ManglingParser( void *a1)
{
  uint64_t v2 = a1 + 101;
  uint64_t v3 = (void *)a1[613];
  if (v3)
  {
    do
    {
      while (1)
      {
        uint64_t v4 = (void *)*v3;
        a1[613] = *v3;
        if (v3 == v2) {
          break;
        }
        free(v3);
        uint64_t v3 = (void *)a1[613];
        if (!v3) {
          goto LABEL_6;
        }
      }

      uint64_t v3 = v4;
    }

    while (v4);
  }

LABEL_6:
  *uint64_t v2 = 0LL;
  v2[1] = 0LL;
  a1[613] = v2;
  uint64_t v5 = (void *)a1[90];
  if (v5 != a1 + 93) {
    free(v5);
  }
  uint64_t v6 = (void *)a1[83];
  if (v6 != a1 + 86) {
    free(v6);
  }
  uint64_t v7 = (void *)a1[72];
  if (v7 != a1 + 75) {
    free(v7);
  }
  v8 = (void *)a1[37];
  if (v8 != a1 + 40) {
    free(v8);
  }
  uint64_t v9 = (void *)a1[2];
  if (v9 != a1 + 5) {
    free(v9);
  }
  return a1;
}

void *anonymous namespace'::itanium_demangle::OutputBuffer::grow(void *this, uint64_t a2)
{
  unint64_t v2 = this[2];
  unint64_t v3 = this[1] + a2;
  if (v3 > v2)
  {
    uint64_t v4 = this;
    size_t v5 = v3 + 992;
    unint64_t v6 = 2 * v2;
    if (v6 <= v5) {
      size_t v7 = v5;
    }
    else {
      size_t v7 = v6;
    }
    this[2] = v7;
    this = realloc((void *)*this, v7);
    *uint64_t v4 = this;
    if (!this) {
      abort();
    }
  }

  return this;
}

uint64_t anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::consumeIf( const void **a1, const void *a2, size_t a3)
{
  unint64_t v3 = (char *)*a1;
  if (a3 > (_BYTE *)a1[1] - (_BYTE *)*a1 || memcmp(*a1, a2, a3)) {
    return 0LL;
  }
  *a1 = &v3[a3];
  return 1LL;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseEncoding( unsigned __int8 **a1)
{
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];
  unint64_t v11 = v10 - *a1;
  if (v10 == *a1)
  {
LABEL_9:
    LOWORD(v91) = 0;
    HIDWORD(v91) = 0;
    char v92 = 0;
    unint64_t v93 = (a1[91] - a1[90]) >> 3;
    char v94 = 0;
    if (!v15) {
      goto LABEL_119;
    }
    unint64_t v25 = v93;
    uint64_t v26 = a1[90];
    unint64_t v27 = (a1[91] - v26) >> 3;
    if (v93 < v27)
    {
      uint64_t v28 = a1[83];
      if (v28 == a1[84]) {
        goto LABEL_118;
      }
      if (!*(void *)v28) {
        goto LABEL_118;
      }
      uint64_t v29 = *(void *)&v26[8 * v93];
      unint64_t v30 = *(void *)(v29 + 16);
      uint64_t v31 = **(void **)v28;
      if (v30 >= (*(void *)(*(void *)v28 + 8LL) - v31) >> 3) {
        goto LABEL_118;
      }
      unint64_t v32 = v93 + 1;
      while (1)
      {
        *(void *)(v29 + 24) = *(void *)(v31 + 8 * v30);
        if (v27 == v32) {
          break;
        }
        unint64_t v33 = v32;
        if (*(void *)v28)
        {
          uint64_t v29 = *(void *)&v26[8 * v32];
          unint64_t v30 = *(void *)(v29 + 16);
          uint64_t v31 = **(void **)v28;
          ++v32;
          if (v30 < (*(void *)(*(void *)v28 + 8LL) - v31) >> 3) {
            continue;
          }
        }

        if (v33 >= v27) {
          goto LABEL_28;
        }
        goto LABEL_118;
      }
    }

    if (v27 < v25) {
      abort_message( "%s:%d: %s",  v18,  v19,  v20,  v21,  v22,  v23,  v24,  (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/ItaniumDemangle.h");
    }
    a1[91] = &v26[8 * v25];
LABEL_28:
    uint64_t v36 = *a1;
    v35 = a1[1];
    if (v35 != *a1)
    {
      unsigned int v37 = *v36 - 46;
      BOOL v38 = v37 > 0x31;
      uint64_t v39 = (1LL << v37) & 0x2000000800001LL;
      if (v38 || v39 == 0)
      {
        if ((unint64_t)(v35 - *a1) >= 0xD
          && (*(void *)v36 == 0x6C62616E65396155LL ? (BOOL v41 = *(void *)(v36 + 5) == 0x4966695F656C6261LL) : (BOOL v41 = 0),
              v41))
        {
          v83 = v36 + 13;
          *a1 = v83;
          unint64_t v84 = (a1[3] - a1[2]) >> 3;
          while (v83 == v35 || *v83 != 69)
          {
            if (!v90) {
              goto LABEL_118;
            }
            v83 = *a1;
            v35 = a1[1];
          }

          *a1 = v83 + 1;
          uint64_t v88 = v87;
          *((_BYTE *)v42 + 8) = 10;
          *(_WORD *)((char *)v42 + 9) = *(_WORD *)((_BYTE *)v42 + 9) & 0xF000 | 0x540;
          void *v42 = off_18965A0F0;
          v42[2] = v86;
          v42[3] = v88;
        }

        else
        {
          v42 = 0LL;
        }

        v43 = 0LL;
        if (!(_BYTE)v91)
        {
          if (BYTE1(v91))
          {
            if (!v43) {
              goto LABEL_118;
            }
          }
        }

        v45 = *a1;
        uint64_t v44 = a1[1];
        if (*a1 == v44 || *v45 != 118)
        {
          v89 = v42;
          unint64_t v53 = (a1[3] - a1[2]) >> 3;
          while (1)
          {
            v90 = v54;
            if (!v54) {
              goto LABEL_118;
            }
            if (v94) {
              BOOL v55 = v53 == (a1[3] - a1[2]) >> 3;
            }
            else {
              BOOL v55 = 0;
            }
            if (v55)
            {
              *((_BYTE *)v56 + 8) = 87;
              *(_WORD *)((char *)v56 + 9) = *(_WORD *)((_BYTE *)v56 + 9) & 0xF000 | 0x540;
              void *v56 = off_18965A160;
              v56[2] = v54;
              v90 = v56;
            }

            if (a1[1] != *a1)
            {
              unsigned int v57 = **a1 - 46;
              BOOL v38 = v57 > 0x31;
              uint64_t v58 = (1LL << v57) & 0x2000800800001LL;
              if (v38 || v58 == 0) {
                continue;
              }
            }

            v42 = v89;
            uint64_t v47 = v60;
            uint64_t v48 = *a1;
            uint64_t v44 = a1[1];
            goto LABEL_72;
          }
        }

        uint64_t v46 = 0LL;
        uint64_t v47 = 0LL;
        uint64_t v48 = v45 + 1;
        *a1 = v48;
LABEL_72:
        if (v48 == v44 || *v48 != 81)
        {
          uint64_t v63 = 0LL;
        }

        else
        {
          *a1 = v48 + 1;
          char v61 = *((_BYTE *)a1 + 778);
          *((_BYTE *)a1 + 778) = 1;
          uint64_t v63 = v62;
          *((_BYTE *)a1 + 778) = v61;
          if (!v62) {
            goto LABEL_118;
          }
        }

        int v71 = HIDWORD(v91);
        char v72 = v92;
        *((_BYTE *)v70 + 8) = 19;
        *(_WORD *)((char *)v70 + 9) = *(_WORD *)((_BYTE *)v70 + 9) & 0xF000 | 0x100;
        *int v70 = off_18965A1D0;
        v70[2] = v43;
        v70[3] = v15;
        v70[4] = v46;
        v70[5] = v47;
        v70[6] = v42;
        v70[7] = v63;
        *((_DWORD *)v70 + 16) = v71;
        *((_BYTE *)v70 + 68) = v72;
LABEL_112:
        uint64_t v15 = v70;
      }
    }

    goto LABEL_119;
  }

  int v12 = *v9;
  if (v12 != 71)
  {
    if (v12 == 84)
    {
      if (v11 >= 2)
      {
        switch(v9[1])
        {
          case 'A':
            *a1 = v9 + 2;
            if (!v13) {
              goto LABEL_118;
            }
            uint64_t v15 = v14;
            *((_BYTE *)v14 + 8) = 21;
            *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
            *uint64_t v14 = off_189657FB0;
            uint64_t v16 = "template parameter object for ";
            uint64_t v17 = 30LL;
            goto LABEL_108;
          case 'B':
          case 'D':
          case 'E':
          case 'F':
          case 'G':
            break;
          case 'C':
            *a1 = v9 + 2;
            if (!v73) {
              goto LABEL_118;
            }
            if (!v74) {
              goto LABEL_118;
            }
            v81 = *a1;
            if (*a1 == a1[1]) {
              goto LABEL_118;
            }
            if (*v81 != 95) {
              goto LABEL_118;
            }
            *a1 = v81 + 1;
            if (!v82) {
              goto LABEL_118;
            }
            *((_BYTE *)v15 + 8) = 22;
            *(_WORD *)((char *)v15 + 9) = *(_WORD *)((_BYTE *)v15 + 9) & 0xF000 | 0x540;
            *uint64_t v15 = off_189658030;
            v15[2] = v82;
            v15[3] = v73;
            goto LABEL_119;
          case 'H':
            *a1 = v9 + 2;
            if (!v13) {
              goto LABEL_118;
            }
            uint64_t v15 = v14;
            *((_BYTE *)v14 + 8) = 21;
            *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
            *uint64_t v14 = off_189657FB0;
            v14[2] = "thread-local initialization routine for ";
            v14[3] = 40LL;
            goto LABEL_109;
          case 'I':
            *a1 = v9 + 2;
            if (!v13) {
              goto LABEL_118;
            }
            uint64_t v15 = v14;
            *((_BYTE *)v14 + 8) = 21;
            *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
            *uint64_t v14 = off_189657FB0;
            uint64_t v16 = "typeinfo for ";
            uint64_t v17 = 13LL;
            goto LABEL_108;
          default:
            switch(v9[1])
            {
              case 'S':
                *a1 = v9 + 2;
                if (!v13) {
                  goto LABEL_118;
                }
                uint64_t v15 = v14;
                *((_BYTE *)v14 + 8) = 21;
                *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
                *uint64_t v14 = off_189657FB0;
                uint64_t v16 = "typeinfo name for ";
                uint64_t v17 = 18LL;
                goto LABEL_108;
              case 'T':
                *a1 = v9 + 2;
                if (!v13) {
                  goto LABEL_118;
                }
                uint64_t v15 = v14;
                *((_BYTE *)v14 + 8) = 21;
                *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
                *uint64_t v14 = off_189657FB0;
                uint64_t v16 = "VTT for ";
                uint64_t v17 = 8LL;
                goto LABEL_108;
              case 'U':
                goto LABEL_81;
              case 'V':
                *a1 = v9 + 2;
                if (!v13) {
                  goto LABEL_118;
                }
                uint64_t v15 = v14;
                *((_BYTE *)v14 + 8) = 21;
                *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
                *uint64_t v14 = off_189657FB0;
                uint64_t v16 = "vtable for ";
                uint64_t v17 = 11LL;
                goto LABEL_108;
              case 'W':
                *a1 = v9 + 2;
                if (!v91) {
                  goto LABEL_118;
                }
                goto LABEL_112;
              default:
                if (v9[1] != 99) {
                  goto LABEL_81;
                }
                *a1 = v9 + 2;
                if (!v13) {
                  goto LABEL_118;
                }
                uint64_t v15 = v14;
                *((_BYTE *)v14 + 8) = 21;
                *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
                *uint64_t v14 = off_189657FB0;
                uint64_t v16 = "covariant return thunk to ";
                uint64_t v17 = 26LL;
                break;
            }

            goto LABEL_108;
        }
      }

LABEL_81:
      v64 = v9 + 1;
      *a1 = v64;
      BOOL v65 = v10 != v64 && *v64 == 118;
      {
        if (v66)
        {
          uint64_t v15 = v67;
          *((_BYTE *)v67 + 8) = 21;
          *(_WORD *)((char *)v67 + 9) = *(_WORD *)((_BYTE *)v67 + 9) & 0xF000 | 0x540;
          *char v67 = off_189657FB0;
          if (v65)
          {
            uint64_t v68 = "virtual thunk to ";
            uint64_t v69 = 17LL;
          }

          else
          {
            uint64_t v68 = "non-virtual thunk to ";
            uint64_t v69 = 21LL;
          }

          v67[2] = v68;
          v67[3] = v69;
          v67[4] = v66;
          goto LABEL_119;
        }
      }

LABEL_118:
      uint64_t v15 = 0LL;
      goto LABEL_119;
    }

    goto LABEL_9;
  }

  if (v11 < 2) {
    goto LABEL_118;
  }
  int v34 = (char)v9[1];
  switch(v34)
  {
    case 'I':
      *a1 = v9 + 2;
      v91 = 0LL;
      size_t v13 = v91;
      if (v91) {
        char v52 = v51;
      }
      else {
        char v52 = 1;
      }
      if ((v52 & 1) != 0) {
        goto LABEL_118;
      }
      uint64_t v15 = v14;
      *((_BYTE *)v14 + 8) = 21;
      *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
      *uint64_t v14 = off_189657FB0;
      uint64_t v16 = "initializer for module ";
      uint64_t v17 = 23LL;
      break;
    case 'R':
      *a1 = v9 + 2;
      if (!v13) {
        goto LABEL_118;
      }
      v50 = *a1;
      if (*a1 == a1[1] || *v50 != 95)
      {
        if (!v49) {
          goto LABEL_118;
        }
      }

      else
      {
        *a1 = v50 + 1;
      }

      uint64_t v15 = v14;
      *((_BYTE *)v14 + 8) = 21;
      *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
      *uint64_t v14 = off_189657FB0;
      uint64_t v16 = "reference temporary for ";
      uint64_t v17 = 24LL;
      break;
    case 'V':
      *a1 = v9 + 2;
      if (!v13) {
        goto LABEL_118;
      }
      uint64_t v15 = v14;
      *((_BYTE *)v14 + 8) = 21;
      *(_WORD *)((char *)v14 + 9) = *(_WORD *)((_BYTE *)v14 + 9) & 0xF000 | 0x540;
      *uint64_t v14 = off_189657FB0;
      uint64_t v16 = "guard variable for ";
      uint64_t v17 = 19LL;
      break;
    default:
      goto LABEL_118;
  }

LABEL_108:
  v14[2] = v16;
  v14[3] = v17;
LABEL_109:
  v14[4] = v13;
LABEL_119:
  return v15;
}

void sub_1804106BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

char *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseNumber( char **a1, int a2)
{
  std::terminate_handler result = *a1;
  uint64_t v4 = a1[1];
  uint64_t v5 = result;
  if (a2)
  {
    if (result == v4) {
      return 0LL;
    }
    uint64_t v5 = result;
    if (*result == 110)
    {
      uint64_t v5 = result + 1;
      *a1 = result + 1;
    }
  }

  if (v4 == v5) {
    return 0LL;
  }
  if (*v5 < 0) {
    return 0LL;
  }
  uint64_t v6 = MEMORY[0x1895F8770];
  do
  {
    if (*v5 < 0) {
      break;
    }
    *a1 = ++v5;
  }

  while (v5 != v4);
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::SpecialName,char const(&)[34],anonymous namespace'::itanium_demangle::Node *&>( uint64_t a1, const char *a2, uint64_t *a3)
{
  size_t v6 = strlen(a2);
  uint64_t v7 = *a3;
  *((_BYTE *)v5 + 8) = 21;
  *(_WORD *)((char *)v5 + 9) = *(_WORD *)((_BYTE *)v5 + 9) & 0xF000 | 0x540;
  *uint64_t v5 = off_189657FB0;
  v5[2] = a2;
  v5[3] = v6;
  v5[4] = v7;
  return v5;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseType( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v99 = 0LL;
  uint64_t v9 = *(unsigned __int8 **)a1;
  uint64_t v10 = *(unsigned __int8 **)(a1 + 8);
  unint64_t v11 = (unint64_t)&v10[-*(void *)a1];
  if (v10 == *(unsigned __int8 **)a1)
  {
LABEL_63:
LABEL_64:
    uint64_t v26 = v19;
    v99 = v19;
    goto LABEL_65;
  }

  int v12 = *v9;
  switch(*v9)
  {
    case 'A':
      if (v12 != 65) {
        goto LABEL_127;
      }
      *(void *)a1 = v9 + 1;
      if (v10 == v9 + 1)
      {
        if ((*(_BYTE *)(MEMORY[0x1895F8770] + 61LL) & 4) == 0) {
          goto LABEL_119;
        }
        goto LABEL_121;
      }

      uint64_t v20 = (char)v9[1];
      if (v20 < 0) {
        goto LABEL_119;
      }
      if ((*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * v20 + 60) & 0x400) != 0)
      {
LABEL_121:
        uint64_t v72 = v71;
        *((_BYTE *)v69 + 8) = 8;
        *(_WORD *)((char *)v69 + 9) = *(_WORD *)((_BYTE *)v69 + 9) & 0xF000 | 0x540;
        *uint64_t v69 = off_1896580A0;
        v69[2] = v70;
        v69[3] = v72;
        goto LABEL_122;
      }

      if ((_DWORD)v20 == 95)
      {
        uint64_t v21 = 0LL;
        uint64_t v22 = v9 + 2;
        goto LABEL_125;
      }

LABEL_119:
      if (!v69) {
        goto LABEL_127;
      }
LABEL_122:
      uint64_t v73 = *(unsigned __int8 **)a1;
      if (*(void *)a1 == *(void *)(a1 + 8) || *v73 != 95) {
        goto LABEL_127;
      }
      uint64_t v21 = v69;
      uint64_t v22 = v73 + 1;
LABEL_125:
      *(void *)a1 = v22;
      if (v74)
      {
        uint64_t v75 = v74;
        *((_BYTE *)v26 + 8) = 15;
        *(_WORD *)((char *)v26 + 9) = *(_WORD *)((_BYTE *)v26 + 9) & 0xF000 | 0x400;
        *uint64_t v26 = off_18965A7F0;
        v26[2] = v75;
        v26[3] = v21;
        goto LABEL_128;
      }

LABEL_127:
      uint64_t v26 = 0LL;
LABEL_128:
      v99 = v26;
LABEL_65:
      if (v26) {
LABEL_66:
      }
      return v26;
    case 'C':
      *(void *)a1 = v9 + 1;
      if (!v23) {
        return 0LL;
      }
      uint64_t v24 = v23;
      uint64_t v26 = v25;
      *((_BYTE *)v25 + 8) = 5;
      *(_WORD *)((char *)v25 + 9) = *(_WORD *)((_BYTE *)v25 + 9) & 0xF000 | 0x540;
      *unint64_t v25 = off_18965A6A0;
      v25[2] = v24;
      v25[3] = " complex";
      uint64_t v27 = 8LL;
      goto LABEL_36;
    case 'D':
      if (v11 < 2) {
        return 0LL;
      }
      uint64_t v26 = 0LL;
      int v28 = v9[1];
      switch(v9[1])
      {
        case 'B':
        case 'U':
          BOOL v29 = v28 == 66;
          unint64_t v30 = (unint64_t)(v9 + 2);
          *(void *)a1 = v30;
          if (v10 == (unsigned __int8 *)v30)
          {
            unint64_t v30 = 0LL;
          }

          else
          {
            LODWORD(v30) = *(char *)v30;
            if ((v30 & 0x80000000) != 0) {
              goto LABEL_156;
            }
            unint64_t v30 = v30;
          }

          if ((*(_DWORD *)(MEMORY[0x1895F8770] + 4 * v30 + 60) & 0x400) != 0)
          {
            uint64_t v97 = v96;
            *((_BYTE *)v94 + 8) = 8;
            *(_WORD *)((char *)v94 + 9) = *(_WORD *)((_BYTE *)v94 + 9) & 0xF000 | 0x540;
            *char v94 = off_1896580A0;
            v94[2] = v95;
            v94[3] = v97;
            goto LABEL_159;
          }

LABEL_156:
          char v94 = v93;
          if (!v93) {
            return 0LL;
          }
LABEL_159:
          v98 = *(unsigned __int8 **)a1;
          if (*(void *)a1 == *(void *)(a1 + 8) || *v98 != 95) {
            return 0LL;
          }
          *(void *)a1 = v98 + 1;
          *((_BYTE *)v26 + 8) = 32;
          *(_WORD *)((char *)v26 + 9) = *(_WORD *)((_BYTE *)v26 + 9) & 0xF000 | 0x540;
          *uint64_t v26 = off_18965A630;
          v26[2] = v94;
          *((_BYTE *)v26 + 24) = v29;
          break;
        case 'F':
          *(void *)a1 = v9 + 2;
          uint64_t v87 = v86;
          *((_BYTE *)v88 + 8) = 8;
          *(_WORD *)((char *)v88 + 9) = *(_WORD *)((_BYTE *)v88 + 9) & 0xF000 | 0x540;
          *uint64_t v88 = off_1896580A0;
          v88[2] = v85;
          v88[3] = v87;
          v89 = *(unsigned __int8 **)a1;
          if (*(void *)a1 == *(void *)(a1 + 8) || *v89 != 95) {
            return 0LL;
          }
          v90 = v88;
          *(void *)a1 = v89 + 1;
          *((_BYTE *)v26 + 8) = 31;
          *(_WORD *)((char *)v26 + 9) = *(_WORD *)((_BYTE *)v26 + 9) & 0xF000 | 0x540;
          *uint64_t v26 = off_18965A5C0;
          v26[2] = v90;
          return v26;
        case 'K':
        case 'k':
          *(void *)a1 = v9 + 2;
          if (!v79) {
            return 0LL;
          }
          uint64_t v80 = v79;
          *((_BYTE *)v26 + 8) = 5;
          *(_WORD *)((char *)v26 + 9) = *(_WORD *)((_BYTE *)v26 + 9) & 0xF000 | 0x540;
          *uint64_t v26 = off_18965A6A0;
          v26[2] = v80;
          int32x2_t v81 = vdup_n_s32(v28 == 107);
          v82.i64[0] = v81.u32[0];
          v82.i64[1] = v81.u32[1];
          int8x16_t v83 = (int8x16_t)vdupq_n_s64(0xFuLL);
          v83.i64[0] = (uint64_t)" decltype(auto)";
          int8x16_t v84 = (int8x16_t)vdupq_n_s64(5uLL);
          v84.i64[0] = (uint64_t)" auto";
          *(int8x16_t *)(v26 + 3) = vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v82, 0x3FuLL)), v84, v83);
          return v26;
        case 'O':
        case 'o':
        case 'w':
        case 'x':
          goto LABEL_117;
        case 'T':
        case 't':
          goto LABEL_64;
        case 'a':
          *(void *)a1 = v9 + 2;
          uint64_t v46 = "auto";
        case 'c':
          *(void *)a1 = v9 + 2;
          BOOL v55 = "decltype(auto)";
        case 'd':
          *(void *)a1 = v9 + 2;
          BOOL v65 = "decimal64";
        case 'e':
          *(void *)a1 = v9 + 2;
          char v51 = "decimal128";
        case 'f':
          *(void *)a1 = v9 + 2;
          BOOL v65 = "decimal32";
        case 'h':
          *(void *)a1 = v9 + 2;
          uint64_t v46 = "half";
        case 'i':
          *(void *)a1 = v9 + 2;
          v54 = "char32_t";
        case 'n':
          *(void *)a1 = v9 + 2;
          BOOL v55 = "std::nullptr_t";
        case 'p':
          *(void *)a1 = v9 + 2;
          if (!v91) {
            return 0LL;
          }
          uint64_t v92 = v91;
          uint64_t v26 = v25;
          *((_BYTE *)v25 + 8) = 42;
          *(_WORD *)((char *)v25 + 9) = *(_WORD *)((_BYTE *)v25 + 9) & 0xF000 | 0x540;
          *unint64_t v25 = off_1896592F0;
          v25[2] = v92;
          goto LABEL_49;
        case 's':
          *(void *)a1 = v9 + 2;
          v54 = "char16_t";
        case 'u':
          *(void *)a1 = v9 + 2;
          v64 = "char8_t";
        case 'v':
          goto LABEL_64;
        default:
          return v26;
      }

      return v26;
    case 'F':
      goto LABEL_117;
    case 'G':
      *(void *)a1 = v9 + 1;
      if (!v31) {
        return 0LL;
      }
      uint64_t v32 = v31;
      uint64_t v26 = v25;
      *((_BYTE *)v25 + 8) = 5;
      *(_WORD *)((char *)v25 + 9) = *(_WORD *)((_BYTE *)v25 + 9) & 0xF000 | 0x540;
      *unint64_t v25 = off_18965A6A0;
      v25[2] = v32;
      v25[3] = " imaginary";
      uint64_t v27 = 10LL;
LABEL_36:
      v25[4] = v27;
      goto LABEL_49;
    case 'K':
    case 'V':
    case 'r':
      unint64_t v13 = v12 == 114;
      if (v11 > v13)
      {
        int v14 = v12 == 114 ? 2 : 1;
        if (v9[v13] == 86) {
          LODWORD(v13) = v14;
        }
      }

      unint64_t v15 = v13;
      if (v11 > v13)
      {
        else {
          unint64_t v15 = v13;
        }
        LODWORD(v13) = v15;
      }

      if (v11 <= v15) {
        goto LABEL_20;
      }
      int v16 = v9[v15];
      if (v16 != 70)
      {
        unint64_t v17 = v13 + 1LL;
        BOOL v18 = v16 == 68 && v11 > v17;
        if (!v18) {
          goto LABEL_20;
        }
        unsigned int v66 = v9[v17] - 79;
        BOOL v18 = v66 > 0x29;
        uint64_t v67 = (1LL << v66) & 0x30100000001LL;
        if (v18 || v67 == 0) {
          goto LABEL_20;
        }
      }

LABEL_117:
      goto LABEL_64;
    case 'M':
      if (v12 != 77) {
        goto LABEL_127;
      }
      *(void *)a1 = v9 + 1;
      if (!v101) {
        goto LABEL_127;
      }
      if (!v100) {
        goto LABEL_127;
      }
      goto LABEL_128;
    case 'O':
      *(void *)a1 = v9 + 1;
      if (!v101) {
        return 0LL;
      }
      LODWORD(v100) = 1;
      goto LABEL_47;
    case 'P':
      *(void *)a1 = v9 + 1;
      if (!v101) {
        return 0LL;
      }
      goto LABEL_48;
    case 'R':
      *(void *)a1 = v9 + 1;
      if (!v101) {
        return 0LL;
      }
      LODWORD(v100) = 0;
LABEL_47:
LABEL_48:
      uint64_t v26 = v25;
      goto LABEL_49;
    case 'S':
      if (v11 >= 2 && v9[1] == 116) {
        goto LABEL_63;
      }
      LOBYTE(v101) = 0;
      v99 = v33;
      if (!v33) {
        return 0LL;
      }
      uint64_t v26 = v33;
      if (*(void *)(a1 + 8) == *(void *)a1)
      {
        int v40 = v101;
      }

      else
      {
        int v40 = v101;
        if (**(_BYTE **)a1 == 73)
        {
          if ((_BYTE)v101)
          {
            if (!*(_BYTE *)(a1 + 776)) {
              return v26;
            }
          }

          else
          {
          }

LABEL_133:
          if (v76)
          {
            uint64_t v77 = v76;
            *((_BYTE *)v78 + 8) = 45;
            *(_WORD *)((char *)v78 + 9) = *(_WORD *)((_BYTE *)v78 + 9) & 0xF000 | 0x540;
            *uint64_t v78 = off_189659FA0;
            v78[2] = v26;
            v78[3] = v77;
            v99 = v78;
            uint64_t v26 = v78;
            goto LABEL_66;
          }

          return 0LL;
        }
      }

      if (v40) {
        return v26;
      }
      goto LABEL_66;
    case 'T':
      if (v11 >= 2)
      {
        unsigned int v41 = v9[1] - 101;
        BOOL v18 = v41 > 0x10;
        int v42 = (1 << v41) & 0x14001;
        if (!v18 && v42 != 0) {
          goto LABEL_63;
        }
      }

      v99 = v26;
      if (!v26) {
        return v26;
      }
      if (*(_BYTE *)(a1 + 776) && *(void *)(a1 + 8) != *(void *)a1 && **(_BYTE **)a1 == 73) {
        goto LABEL_133;
      }
      goto LABEL_66;
    case 'U':
LABEL_20:
      goto LABEL_64;
    case 'a':
      *(void *)a1 = v9 + 1;
      v45 = "signed char";
    case 'b':
      *(void *)a1 = v9 + 1;
      uint64_t v46 = "BOOL";
    case 'c':
      *(void *)a1 = v9 + 1;
      uint64_t v46 = "char";
    case 'd':
      *(void *)a1 = v9 + 1;
      uint64_t v26 = v47;
      *((_BYTE *)v47 + 8) = 8;
      *(_WORD *)((char *)v47 + 9) = *(_WORD *)((_BYTE *)v47 + 9) & 0xF000 | 0x540;
      *uint64_t v47 = off_1896580A0;
      uint64_t v48 = "double";
      uint64_t v49 = 6LL;
      goto LABEL_104;
    case 'e':
      *(void *)a1 = v9 + 1;
      v45 = "long double";
    case 'f':
      *(void *)a1 = v9 + 1;
      v50 = "float";
    case 'g':
      *(void *)a1 = v9 + 1;
      char v51 = "__float128";
    case 'h':
      *(void *)a1 = v9 + 1;
      char v52 = "unsigned char";
    case 'i':
      *(void *)a1 = v9 + 1;
      unint64_t v53 = "int";
    case 'j':
      *(void *)a1 = v9 + 1;
      uint64_t v26 = v47;
      *((_BYTE *)v47 + 8) = 8;
      *(_WORD *)((char *)v47 + 9) = *(_WORD *)((_BYTE *)v47 + 9) & 0xF000 | 0x540;
      *uint64_t v47 = off_1896580A0;
      uint64_t v48 = "unsigned int";
      uint64_t v49 = 12LL;
      goto LABEL_104;
    case 'l':
      *(void *)a1 = v9 + 1;
      uint64_t v46 = "long";
    case 'm':
      *(void *)a1 = v9 + 1;
      char v52 = "unsigned long";
    case 'n':
      *(void *)a1 = v9 + 1;
      v54 = "__int128";
    case 'o':
      *(void *)a1 = v9 + 1;
      uint64_t v26 = v47;
      *((_BYTE *)v47 + 8) = 8;
      *(_WORD *)((char *)v47 + 9) = *(_WORD *)((_BYTE *)v47 + 9) & 0xF000 | 0x540;
      *uint64_t v47 = off_1896580A0;
      uint64_t v48 = "unsigned __int128";
      uint64_t v49 = 17LL;
      goto LABEL_104;
    case 's':
      *(void *)a1 = v9 + 1;
      v50 = "short";
    case 't':
      *(void *)a1 = v9 + 1;
      BOOL v55 = "unsigned short";
    case 'u':
      *(void *)a1 = v9 + 1;
      if (!v57) {
        return 0LL;
      }
      uint64_t v58 = v56;
      uint64_t v59 = v57;
      uint64_t v60 = *(unsigned __int8 **)a1;
      if (*(void *)a1 == *(void *)(a1 + 8) || *v60 != 73)
      {
        uint64_t v26 = v25;
        *((_BYTE *)v25 + 8) = 8;
        *(_WORD *)((char *)v25 + 9) = *(_WORD *)((_BYTE *)v25 + 9) & 0xF000 | 0x540;
        *unint64_t v25 = off_1896580A0;
        v25[2] = v58;
        v25[3] = v59;
      }

      else
      {
        *(void *)a1 = v60 + 1;
        if (!v61) {
          return 0LL;
        }
        uint64_t v62 = *(unsigned __int8 **)a1;
        if (*(void *)a1 == *(void *)(a1 + 8) || *v62 != 69) {
          return 0LL;
        }
        uint64_t v63 = v61;
        *(void *)a1 = v62 + 1;
        uint64_t v26 = v25;
        *((_BYTE *)v25 + 8) = 7;
        *(_WORD *)((char *)v25 + 9) = *(_WORD *)((_BYTE *)v25 + 9) & 0xF000 | 0x540;
        *unint64_t v25 = off_18965A550;
        v25[2] = v58;
        v25[3] = v59;
        v25[4] = v63;
      }

LABEL_49:
      v99 = v25;
      goto LABEL_66;
    case 'v':
      *(void *)a1 = v9 + 1;
      uint64_t v46 = "void";
    case 'w':
      *(void *)a1 = v9 + 1;
      v64 = "wchar_t";
    case 'x':
      *(void *)a1 = v9 + 1;
      BOOL v65 = "long long";
    case 'y':
      *(void *)a1 = v9 + 1;
      uint64_t v26 = v47;
      *((_BYTE *)v47 + 8) = 8;
      *(_WORD *)((char *)v47 + 9) = *(_WORD *)((_BYTE *)v47 + 9) & 0xF000 | 0x540;
      *uint64_t v47 = off_1896580A0;
      uint64_t v48 = "unsigned long long";
      uint64_t v49 = 18LL;
LABEL_104:
      v47[2] = v48;
      v47[3] = v49;
      return v26;
    case 'z':
      *(void *)a1 = v9 + 1;
      unint64_t v53 = "...";
    default:
      goto LABEL_63;
  }
}

uint64_t anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::SaveTemplateParams::SaveTemplateParams( uint64_t a1, uint64_t a2)
{
  *(void *)a1 = a2;
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 8) = a1 + 32;
  *(_OWORD *)(a1 + 88) = 0u;
  *(void *)(a1 + 64) = a1 + 88;
  *(void *)(a1 + 16) = a1 + 32;
  *(void *)(a1 + 24) = a1 + 64;
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)(a1 + 72) = a1 + 88;
  *(void *)(a1 + 80) = a1 + 152;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  uint64_t v3 = *(void **)a1;
  v3[84] = *(void *)(*(void *)a1 + 664LL);
  v3[73] = v3[72];
  return a1;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseName( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *(const char **)a1;
  unint64_t v11 = *(const char **)(a1 + 8);
  int v12 = *(unsigned __int8 *)v10;
  if (v12 == 90)
  {
    *(void *)a1 = v10 + 1;
    if (!v24) {
      return 0LL;
    }
    uint64_t v27 = *(const char **)a1;
    uint64_t v26 = *(const char **)(a1 + 8);
    uint64_t v28 = v24;
    *(void *)a1 = v27 + 1;
    if (v27 + 1 != v26 && v27[1] == 115)
    {
      *(void *)a1 = v27 + 2;
      *((_BYTE *)v20 + 8) = 26;
      *(_WORD *)((char *)v20 + 9) = *(_WORD *)((_BYTE *)v20 + 9) & 0xF000 | 0x540;
      *uint64_t v20 = off_189659E50;
      v20[2] = v28;
      v20[3] = v29;
      return v20;
    }

    v43 = *(const char **)a1;
    if (*(void *)a1 == *(void *)(a1 + 8) || *v43 != 100)
    {
      if (!v45)
      {
LABEL_87:
        uint64_t v20 = 0LL;
        goto LABEL_88;
      }
    }

    else
    {
      *(void *)a1 = v43 + 1;
      uint64_t v44 = *(const char **)a1;
      if (*(void *)a1 == *(void *)(a1 + 8)) {
        goto LABEL_87;
      }
      if (*v44 != 95) {
        goto LABEL_87;
      }
      *(void *)a1 = v44 + 1;
      if (!v45) {
        goto LABEL_87;
      }
    }

    *((_BYTE *)v20 + 8) = 26;
    *(_WORD *)((char *)v20 + 9) = *(_WORD *)((_BYTE *)v20 + 9) & 0xF000 | 0x540;
    *uint64_t v20 = off_189659E50;
    v20[2] = v28;
    v20[3] = v45;
LABEL_88:
    return v20;
  }

  if (v12 == 78)
  {
    *(void *)a1 = v10 + 1;
    if (v10 + 1 != v11 && v10[1] == 72)
    {
      unint64_t v13 = v10 + 2;
      *(void *)a1 = v13;
      if (a2) {
        *(_BYTE *)(a2 + 24) = 1;
      }
      goto LABEL_37;
    }

    if (a2) {
      *(_DWORD *)(a2 + 4) = v30;
    }
    unint64_t v13 = *(const char **)a1;
    unint64_t v11 = *(const char **)(a1 + 8);
    if (*(const char **)a1 != v11)
    {
      int v31 = *(unsigned __int8 *)v13;
      if (v31 == 82)
      {
        *(void *)a1 = ++v13;
        if (a2)
        {
          char v32 = 1;
          goto LABEL_36;
        }

LABEL_37:
        uint64_t v20 = 0LL;
        v48[0] = 0LL;
        while (1)
        {
          while (1)
          {
            if (v13 != v11 && *v13 == 69)
            {
              *(void *)a1 = v13 + 1;
              if (v20)
              {
                uint64_t v41 = *(void *)(a1 + 304);
                if (*(void *)(a1 + 296) != v41)
                {
                  *(void *)(a1 + 304) = v41 - 8;
                  return v20;
                }

                return 0LL;
              }

              return v20;
            }

            if (a2) {
              *(_BYTE *)(a2 + 1) = 0;
            }
            unint64_t v33 = v11 - v13;
            if (!v33) {
              goto LABEL_60;
            }
            uint64_t v34 = 0LL;
            unsigned int v35 = *(unsigned __int8 *)v13;
            if (v35 > 0x52) {
              break;
            }
            if (v35 == 68)
            {
              if (v33 >= 2 && (*((unsigned __int8 *)v13 + 1) | 0x20) == 0x74)
              {
                if (v20) {
                  return 0LL;
                }
LABEL_62:
                uint64_t v20 = v39;
                v48[0] = (uint64_t)v39;
                if (!v39) {
                  return v20;
                }
                goto LABEL_63;
              }

LABEL_60:
              uint64_t v34 = 0LL;
              goto LABEL_61;
            }

            if (v35 != 73) {
              goto LABEL_61;
            }
            if (!v20) {
              return v20;
            }
            if (!v36 || *((_BYTE *)v20 + 8) == 45) {
              return 0LL;
            }
            uint64_t v37 = v36;
            if (a2) {
              *(_BYTE *)(a2 + 1) = 1;
            }
            *((_BYTE *)v38 + 8) = 45;
            *(_WORD *)((char *)v38 + 9) = *(_WORD *)((_BYTE *)v38 + 9) & 0xF000 | 0x540;
            *uint64_t v38 = off_189659FA0;
            v38[2] = v20;
            v38[3] = v37;
            v48[0] = (uint64_t)v38;
            uint64_t v20 = v38;
LABEL_63:
            unint64_t v13 = *(const char **)a1;
            int v40 = *(const char **)(a1 + 8);
            unint64_t v11 = *(const char **)a1;
            if (*(const char **)a1 != v40)
            {
              unint64_t v11 = *(const char **)(a1 + 8);
              if (*v13 == 77)
              {
                *(void *)a1 = ++v13;
                unint64_t v11 = v40;
              }
            }
          }

          if (v35 != 83)
          {
            if (v35 == 84)
            {
              if (v20) {
                return 0LL;
              }
              goto LABEL_62;
            }

LABEL_61:
            goto LABEL_62;
          }

          if (v33 >= 2 && v13[1] == 116)
          {
            *(void *)a1 = v13 + 2;
          }

          else
          {
            if (!v34) {
              return 0LL;
            }
          }

          if (*((_BYTE *)v34 + 8) == 27) {
            goto LABEL_61;
          }
          if (v20) {
            return 0LL;
          }
          v48[0] = (uint64_t)v34;
          uint64_t v20 = v34;
          unint64_t v13 = *(const char **)a1;
          unint64_t v11 = *(const char **)(a1 + 8);
        }
      }

      if (v31 == 79)
      {
        *(void *)a1 = ++v13;
        if (a2)
        {
          char v32 = 2;
LABEL_36:
          *(_BYTE *)(a2 + 8) = v32;
          goto LABEL_37;
        }

        goto LABEL_37;
      }
    }

    if (a2) {
      *(_BYTE *)(a2 + 8) = 0;
    }
    goto LABEL_37;
  }

LABEL_8:
  char v47 = 0;
  v48[0] = (uint64_t)v20;
  if (v20)
  {
    if (*(void *)(a1 + 8) == *(void *)a1 || **(_BYTE **)a1 != 73)
    {
      if (!v47) {
        return v20;
      }
      return 0LL;
    }

    if (!v47) {
    if (!v21)
    }
      return 0LL;
    uint64_t v22 = v21;
    if (a2) {
      *(_BYTE *)(a2 + 1) = 1;
    }
    *((_BYTE *)v23 + 8) = 45;
    *(_WORD *)((char *)v23 + 9) = *(_WORD *)((_BYTE *)v23 + 9) & 0xF000 | 0x540;
    *uint64_t v23 = off_189659FA0;
    v23[2] = v20;
    v23[3] = v22;
    return v23;
  }

  return v20;
}

      std::terminate();
    }

    uint64_t v8 = malloc(0x1000uLL);
    if (!v8) {
      goto LABEL_8;
    }
    uint64_t v4 = 0LL;
    void *v8 = v3;
    v8[1] = 0LL;
    uint64_t v3 = v8;
    *((void *)this + 512) = v8;
  }

  v3[1] = v4 + v2;
  return (void *)((char *)v3 + v4 + 16);
}

    if (*(void *)(a2 + 8) == a3 && *(_DWORD *)(a2 + 52) != 1) {
      *(_DWORD *)(a2 + 52) = a4;
    }
    return result;
  }

  std::terminate_handler result = std::type_info::operator==[abi:ne180100](result, v10);
  if ((result & 1) != 0) {
    goto LABEL_8;
  }
  std::terminate_handler result = std::type_info::operator==[abi:ne180100](v9, *(void *)a2);
  if ((result & 1) == 0) {
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)(v9 + 16) + 48LL))( *(void *)(v9 + 16),  a2,  a3,  a4,  a5);
  }
LABEL_12:
  if (*(void *)(a2 + 32) == a3 || *(void *)(a2 + 40) == a3)
  {
    if ((_DWORD)a4 == 1) {
      *(_DWORD *)(a2 + 56) = 1;
    }
  }

  else
  {
    *(_DWORD *)(a2 + 56) = a4;
    if (*(_DWORD *)(a2 + 68) != 4)
    {
      *(_WORD *)(a2 + 76) = 0;
      std::terminate_handler result = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)(v9 + 16)
                                                                                              + 40LL))( *(void *)(v9 + 16),  a2,  a3,  a3,  1LL,  a5);
      if (*(_BYTE *)(a2 + 77))
      {
        int v12 = *(unsigned __int8 *)(a2 + 76);
        *(_DWORD *)(a2 + 68) = 3;
        if (v12) {
          return result;
        }
      }

      else
      {
        *(_DWORD *)(a2 + 68) = 4;
      }
    }

    *(void *)(a2 + 40) = a3;
    unint64_t v13 = *(_DWORD *)(a2 + 60);
    ++*(_DWORD *)(a2 + 64);
    if (v13 == 1 && *(_DWORD *)(a2 + 48) == 2) {
      *(_BYTE *)(a2 + 78) = 1;
    }
  }

  return result;
}

void sub_180411B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseTemplateArg( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = (char *)*a1;
  uint64_t v9 = (char *)a1[1];
  else {
    int v11 = *v10;
  }
  HIDWORD(v12) = v11;
  LODWORD(v12) = v11 - 74;
  switch((v12 >> 1))
  {
    case 0u:
      unint64_t v13 = v10 + 1;
      *a1 = v13;
      unint64_t v14 = (uint64_t)(a1[3] - a1[2]) >> 3;
      while (1)
      {
        if (v13 != v9 && *v13 == 69)
        {
          *a1 = v13 + 1;
          uint64_t v17 = v20;
          *((_BYTE *)result + 8) = 41;
          *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
          uint64_t v18 = off_18965A010;
          goto LABEL_26;
        }

        uint64_t v21 = result;
        if (!result) {
          break;
        }
        unint64_t v13 = (char *)*a1;
        uint64_t v9 = (char *)a1[1];
      }

      break;
    case 1u:
      if ((unint64_t)&v9[-*a1] >= 2 && v10[1] == 90)
      {
        *a1 = v10 + 2;
        if (result) {
          goto LABEL_20;
        }
      }

      else
      {
      }

      break;
    case 5u:
      if (result)
      {
        uint64_t v16 = result;
        if (result)
        {
          uint64_t v17 = result;
          *((_BYTE *)result + 8) = 34;
          *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
          uint64_t v18 = off_18965A080;
LABEL_26:
          *std::terminate_handler result = v18;
          result[2] = v16;
          result[3] = v17;
        }
      }

      break;
    case 7u:
      *a1 = v10 + 1;
      if (result)
      {
LABEL_20:
        uint64_t v19 = (char *)*a1;
        if (*a1 == a1[1] || *v19 != 69) {
          std::terminate_handler result = 0LL;
        }
        else {
          *a1 = v19 + 1;
        }
      }

      break;
    default:
LABEL_18:
      break;
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::PODSmallVector<anonymous namespace'::itanium_demangle::Node *,32ul>::push_back( void *result, uint64_t *__size)
{
  uint64_t v3 = result;
  uint64_t v4 = (void *)result[1];
  if (v4 == (void *)result[2])
  {
    uint64_t v5 = (void *)*result;
    int64_t v6 = (int64_t)v4 - *result;
    if ((void *)*result == result + 3)
    {
      std::terminate_handler result = malloc(2 * v6);
      if (!result) {
        goto LABEL_11;
      }
      uint64_t v7 = result;
      if (v4 != v5) {
        std::terminate_handler result = memmove(result, v5, v6);
      }
      *uint64_t v3 = v7;
    }

    else
    {
      std::terminate_handler result = realloc((void *)*result, 2 * v6);
      uint64_t v7 = result;
      *uint64_t v3 = result;
      if (!result) {
LABEL_11:
      }
        abort();
    }

    uint64_t v4 = &v7[v6 >> 3];
    v3[1] = v4;
    v3[2] = &v7[v6 >> 2];
  }

  uint64_t v8 = *__size;
  v3[1] = v4 + 1;
  *uint64_t v4 = v8;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::popTrailingNodeArray( void *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a1[2];
  uint64_t v9 = a1[3];
  if (a2 > (v9 - v8) >> 3) {
    goto LABEL_6;
  }
  unint64_t v12 = (const void *)(v8 + 8 * a2);
  unint64_t v14 = v13;
  size_t v15 = v9 - (void)v12;
  if (v15) {
    memmove(v13, v12, v15);
  }
  uint64_t v16 = a1[2];
  if (a2 > (a1[3] - v16) >> 3) {
LABEL_6:
  }
    abort_message( "%s:%d: %s",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/ItaniumDemangle.h");
  a1[3] = v16 + 8 * a2;
  return v14;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::SaveTemplateParams::~SaveTemplateParams( void *a1)
{
  uint64_t v2 = (void *)a1[8];
  if (v2 != a1 + 11) {
    free(v2);
  }
  uint64_t v3 = (void *)a1[1];
  if (v3 != a1 + 4) {
    free(v3);
  }
  return a1;
}

char *anonymous namespace'::itanium_demangle::PODSmallVector<anonymous namespace'::itanium_demangle::PODSmallVector<anonymous namespace'::itanium_demangle::Node *,8ul> *,4ul>::operator=( char *__dst, uint64_t a2)
{
  uint64_t v5 = (_BYTE *)(a2 + 24);
  uint64_t v4 = *(_BYTE **)a2;
  uint64_t v7 = __dst + 24;
  int64_t v6 = *(char **)__dst;
  if (v4 == v5)
  {
    if (v6 != v7)
    {
      free(v6);
      *(void *)__dst = v7;
      *((void *)__dst + 1) = v7;
      *((void *)__dst + 2) = __dst + 56;
      uint64_t v4 = *(_BYTE **)a2;
    }

    uint64_t v10 = *(_BYTE **)(a2 + 8);
    if (v10 == v4)
    {
      int v11 = v4;
    }

    else
    {
      memmove(v7, v4, v10 - v4);
      uint64_t v4 = *(_BYTE **)a2;
      int v11 = *(_BYTE **)(a2 + 8);
    }

    *((void *)__dst + 1) = &v7[v11 - v4];
    *(void *)(a2 + 8) = v4;
  }

  else
  {
    *(void *)__dst = v4;
    if (v6 == v7)
    {
      *(_OWORD *)(__dst + 8) = *(_OWORD *)(a2 + 8);
      *(void *)a2 = v5;
      *(void *)(a2 + 8) = v5;
      *(void *)(a2 + 16) = a2 + 56;
    }

    else
    {
      *(void *)a2 = v6;
      uint64_t v8 = *((void *)__dst + 1);
      *((void *)__dst + 1) = *(void *)(a2 + 8);
      *(void *)(a2 + 8) = v8;
      uint64_t v9 = *((void *)__dst + 2);
      *((void *)__dst + 2) = *(void *)(a2 + 16);
      *(void *)(a2 + 8) = *(void *)a2;
      *(void *)(a2 + 16) = v9;
    }
  }

  return __dst;
}

char *anonymous namespace'::itanium_demangle::PODSmallVector<anonymous namespace'::itanium_demangle::Node *,8ul>::operator=( char *__dst, uint64_t a2)
{
  uint64_t v5 = (_BYTE *)(a2 + 24);
  uint64_t v4 = *(_BYTE **)a2;
  uint64_t v7 = __dst + 24;
  int64_t v6 = *(char **)__dst;
  if (v4 == v5)
  {
    if (v6 != v7)
    {
      free(v6);
      *(void *)__dst = v7;
      *((void *)__dst + 1) = v7;
      *((void *)__dst + 2) = __dst + 88;
      uint64_t v4 = *(_BYTE **)a2;
    }

    uint64_t v10 = *(_BYTE **)(a2 + 8);
    if (v10 == v4)
    {
      int v11 = v4;
    }

    else
    {
      memmove(v7, v4, v10 - v4);
      uint64_t v4 = *(_BYTE **)a2;
      int v11 = *(_BYTE **)(a2 + 8);
    }

    *((void *)__dst + 1) = &v7[v11 - v4];
    *(void *)(a2 + 8) = v4;
  }

  else
  {
    *(void *)__dst = v4;
    if (v6 == v7)
    {
      *(_OWORD *)(__dst + 8) = *(_OWORD *)(a2 + 8);
      *(void *)a2 = v5;
      *(void *)(a2 + 8) = v5;
      *(void *)(a2 + 16) = a2 + 88;
    }

    else
    {
      *(void *)a2 = v6;
      uint64_t v8 = *((void *)__dst + 1);
      *((void *)__dst + 1) = *(void *)(a2 + 8);
      *(void *)(a2 + 8) = v8;
      uint64_t v9 = *((void *)__dst + 2);
      *((void *)__dst + 2) = *(void *)(a2 + 16);
      *(void *)(a2 + 8) = *(void *)a2;
      *(void *)(a2 + 16) = v9;
    }
  }

  return __dst;
}

uint64_t anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseCallOffset( uint64_t a1)
{
  std::unexpected_handler v1 = *(char **)a1;
  if (*(void *)a1 == *(void *)(a1 + 8)) {
    return 1LL;
  }
  int v3 = *v1;
  if (v3 != 118)
  {
    if (v3 == 104)
    {
      *(void *)a1 = v1 + 1;
      uint64_t v4 = 1LL;
      goto LABEL_5;
    }

    return 1LL;
  }

  *(void *)a1 = v1 + 1;
  uint64_t v4 = 1LL;
  if (!v8) {
    return v4;
  }
  uint64_t v9 = *(char **)a1;
  if (*(void *)a1 == *(void *)(a1 + 8) || *v9 != 95) {
    return v4;
  }
  *(void *)a1 = v9 + 1;
LABEL_5:
  if (v5)
  {
    int64_t v6 = *(char **)a1;
    if (*(void *)a1 != *(void *)(a1 + 8) && *v6 == 95)
    {
      uint64_t v4 = 0LL;
      *(void *)a1 = v6 + 1;
    }
  }

  return v4;
}

uint64_t anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseSeqId( unsigned __int8 **a1, uint64_t *a2)
{
  int v3 = *a1;
  uint64_t v2 = (char *)a1[1];
  unsigned int v4 = *v3;
  if (v4 >= 0x3A && v4 - 65 > 0x19) {
    return 1LL;
  }
  uint64_t v6 = 0LL;
  do
  {
    if (*v3 >= 0x3Au)
    {
      uint64_t v7 = -55LL;
    }

    else
    {
      uint64_t v7 = -48LL;
    }

    uint64_t v6 = v7 + 36 * v6 + *v3++;
    *a1 = v3;
  }

  while (v3 != (unsigned __int8 *)v2);
  uint64_t result = 0LL;
  *a2 = v6;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseModuleNameOpt( void *a1, uint64_t *a2)
{
  uint64_t v2 = (_BYTE *)*a1;
  int v3 = (_BYTE *)a1[1];
  if ((_BYTE *)*a1 != v3)
  {
    uint64_t v6 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 101);
    uint64_t v7 = a1 + 37;
    while (*v2 == 87)
    {
      *a1 = v2 + 1;
      if (v2 + 1 == v3 || v2[1] != 80)
      {
        char v8 = 0;
      }

      else
      {
        *a1 = v2 + 2;
        char v8 = 1;
      }

      if (!v9) {
        return 1LL;
      }
      uint64_t v10 = v9;
      uint64_t v12 = *a2;
      *((_BYTE *)v11 + 8) = 27;
      *(_WORD *)((char *)v11 + 9) = *(_WORD *)((_BYTE *)v11 + 9) & 0xF000 | 0x540;
      *int v11 = off_189658110;
      v11[2] = v12;
      v11[3] = v10;
      *((_BYTE *)v11 + 32) = v8;
      *a2 = (uint64_t)v11;
      unint64_t v14 = v11;
      uint64_t v2 = (_BYTE *)*a1;
      int v3 = (_BYTE *)a1[1];
      if ((_BYTE *)*a1 == v3) {
        return 0LL;
      }
    }
  }

  return 0LL;
}

void *anonymous namespace'::BumpPointerAllocator::allocate( _anonymous_namespace_::BumpPointerAllocator *this, int a2)
{
  unint64_t v2 = (a2 + 15) & 0xFFFFFFF0;
  int v3 = (void *)*((void *)this + 512);
  uint64_t v4 = v3[1];
  if (v4 + v2 >= 0xFF0)
  {
    if (v2 >= 0xFF1)
    {
      uint64_t v5 = malloc(v2 + 16);
      if (v5)
      {
        *uint64_t v5 = *v3;
        v5[1] = 0LL;
        *int v3 = v5;
        return v5 + 2;
      }

uint64_t anonymous namespace'::itanium_demangle::Node::hasRHSComponentSlow()
{
  return 0LL;
}

uint64_t anonymous namespace'::itanium_demangle::Node::hasArraySlow()
{
  return 0LL;
}

uint64_t anonymous namespace'::itanium_demangle::Node::hasFunctionSlow()
{
  return 0LL;
}

uint64_t anonymous namespace'::itanium_demangle::SpecialName::printLeft( void *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v4 = a1[3];
  if (v4)
  {
    uint64_t v5 = (const void *)a1[2];
    memcpy((void *)(*(void *)this + *((void *)this + 1)), v5, v4);
    *((void *)this + 1) += v4;
  }

  uint64_t v6 = a1[4];
  uint64_t result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v6 + 32LL))( v6,  this);
  if ((*(_WORD *)(v6 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v6 + 40LL))( v6,  this);
  }
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::Node::getBaseName( _anonymous_namespace_::itanium_demangle::Node *this)
{
  return 0LL;
}

uint64_t anonymous namespace'::itanium_demangle::CtorVtableSpecialName::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  *((void *)this + 1) += 24LL;
  uint64_t v4 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v4 + 32LL))( v4,  this);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v4 + 40LL))( v4,  this);
  }
  *(_DWORD *)(*(void *)this + *((void *)this + 1)) = 762210605;
  *((void *)this + 1) += 4LL;
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v5 + 32LL))( v5,  this);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v5 + 40LL))( v5,  this);
  }
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseSourceName( uint64_t a1)
{
  unint64_t v7 = 0LL;
  uint64_t result = 0LL;
  if ((v2 & 1) == 0)
  {
    uint64_t v4 = *(unsigned __int8 **)a1;
    unint64_t v5 = v7;
    if (v7 - 1 >= *(void *)(a1 + 8) - *(void *)a1)
    {
      return 0LL;
    }

    else
    {
      *(void *)a1 = &v4[v7];
      if (v5 >= 0xA && *(void *)v4 == 0x5F4C41424F4C475FLL && *((_WORD *)v4 + 4) == 20063)
      {
        uint64_t v4 = "(anonymous namespace)";
        unint64_t v5 = 21LL;
      }

      *((_BYTE *)result + 8) = 8;
      *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
      *uint64_t result = off_1896580A0;
      result[2] = v4;
      result[3] = v5;
    }
  }

  return result;
}

uint64_t anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parsePositiveInteger( unsigned __int8 **a1, uint64_t *a2)
{
  *a2 = 0LL;
  int v3 = *a1;
  char v2 = a1[1];
  if (v2 == *a1) {
    return 1LL;
  }
  int v4 = *v3;
  if ((v4 - 48) <= 9)
  {
    uint64_t v6 = 0LL;
    unint64_t v7 = v3 + 1;
    do
    {
      uint64_t v8 = 5 * v6;
      *a2 = 2 * v8;
      *a1 = v7;
      uint64_t v6 = (char)*(v7 - 1) + 2 * v8 - 48;
      *a2 = v6;
      if (v7 == v2) {
        break;
      }
      int v9 = *v7++;
    }

    while ((v9 - 48) <= 9);
  }

  return 0LL;
}

void *anonymous namespace'::itanium_demangle::NameType::printLeft( void *result, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v2 = result[3];
  if (v2)
  {
    int v4 = (const void *)result[2];
    uint64_t result = memcpy((void *)(*(void *)this + *((void *)this + 1)), v4, v2);
    *((void *)this + 1) += v2;
  }

  return result;
}

uint64_t anonymous namespace'::itanium_demangle::NameType::getBaseName( _anonymous_namespace_::itanium_demangle::NameType *this)
{
  return *((void *)this + 2);
}

uint64_t anonymous namespace'::itanium_demangle::ModuleName::printLeft(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    goto LABEL_8;
  }
  (*(void (**)(void, uint64_t *))(*(void *)v4 + 32LL))(*(void *)(a1 + 16), a2);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v4 + 40LL))(v4, a2);
  }
  if (*(void *)(a1 + 16))
  {
    if (*(_BYTE *)(a1 + 32)) {
      char v5 = 58;
    }
    else {
      char v5 = 46;
    }
  }

  else
  {
LABEL_8:
    if (!*(_BYTE *)(a1 + 32)) {
      goto LABEL_11;
    }
    char v5 = 58;
  }

  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  a2[1] = v7 + 1;
  *(_BYTE *)(v6 + v7) = v5;
LABEL_11:
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v8 + 32LL))(v8, a2);
  if ((*(_WORD *)(v8 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v8 + 40LL))(v8, a2);
  }
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseUnscopedName( uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  uint64_t v6 = *(char **)a1;
  uint64_t v7 = *(char **)(a1 + 8);
  if ((unint64_t)&v7[-*(void *)a1] >= 2 && *(_WORD *)v6 == 29779)
  {
    *(void *)a1 = v6 + 2;
    uint64_t v6 = *(char **)a1;
    uint64_t v7 = *(char **)(a1 + 8);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  if (v7 == v6 || *v6 != 83)
  {
    uint64_t v10 = 0LL;
  }

  if (!result) {
    return result;
  }
  uint64_t v10 = (uint64_t)result;
  if (*((_BYTE *)result + 8) == 27) {
  uint64_t result = 0LL;
  }
  if (a3)
  {
    if (!v8)
    {
      *a3 = 1;
      return (void *)v10;
    }
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseTemplateArgs( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(_BYTE **)a1;
  int v9 = *(_BYTE **)(a1 + 8);
  if (*(_BYTE **)a1 == v9 || *v8 != 73) {
    return 0LL;
  }
  int v10 = a2;
  uint64_t v12 = v8 + 1;
  *(void *)a1 = v12;
  if ((_DWORD)a2)
  {
    *(void *)(a1 + 672) = *(void *)(a1 + 664);
    uint64_t v34 = (void *)(a1 + 576);
    *(void *)(a1 + 584) = *(void *)(a1 + 576);
    uint64_t v12 = *(_BYTE **)a1;
    int v9 = *(_BYTE **)(a1 + 8);
  }

  unint64_t v32 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3;
  unint64_t v13 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 808);
  do
  {
    if (v12 != v9 && *v12 == 69)
    {
      uint64_t v28 = 0LL;
LABEL_39:
      *(void *)a1 = v12 + 1;
      uint64_t v31 = v30;
      *((_BYTE *)result + 8) = 43;
      *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
      *uint64_t result = off_189659F30;
      result[2] = v29;
      result[3] = v31;
      result[4] = v28;
      return result;
    }

    if (v10)
    {
      uint64_t v34 = result;
      if (!result) {
        return result;
      }
      uint64_t v15 = (uint64_t)result;
      unint64_t v33 = (void *)v15;
      int v16 = *(unsigned __int8 *)(v15 + 8);
      if (v16 == 41)
      {
        uint64_t v17 = *(void *)(v15 + 16);
        uint64_t v18 = *(void *)(v15 + 24);
        *((_BYTE *)v19 + 8) = 40;
        __int16 v20 = *(_WORD *)((_BYTE *)v19 + 9) & 0xF000;
        *uint64_t v19 = off_189659EC0;
        v19[2] = v17;
        v19[3] = v18;
        __int16 v21 = v20 | 0xA80;
        *(_WORD *)((char *)v19 + 9) = v20 | 0xA80;
        uint64_t v22 = 8 * v18;
        if (v18)
        {
          uint64_t v23 = 8 * v18;
          uint64_t v24 = v17;
          while ((*(_WORD *)(*(void *)v24 + 9LL) & 0x300) == 0x100)
          {
            v24 += 8LL;
            v23 -= 8LL;
            if (!v23) {
              goto LABEL_19;
            }
          }
        }

        else
        {
LABEL_19:
          __int16 v21 = v20 | 0x980;
          *(_WORD *)((char *)v19 + 9) = v20 | 0x980;
        }

        if (v18)
        {
          uint64_t v25 = 8 * v18;
          uint64_t v26 = v17;
          while ((*(_WORD *)(*(void *)v26 + 9LL) & 0xC00) == 0x400)
          {
            v26 += 8LL;
            v25 -= 8LL;
            if (!v25) {
              goto LABEL_24;
            }
          }
        }

        else
        {
LABEL_24:
          __int16 v21 = v21 & 0xF3FF | 0x400;
          *(_WORD *)((char *)v19 + 9) = v21;
        }

        if (v18)
        {
          while ((*(_WORD *)(*(void *)v17 + 9LL) & 0xC0) == 0x40)
          {
            v17 += 8LL;
            v22 -= 8LL;
            if (!v22) {
              goto LABEL_28;
            }
          }
        }

        else
        {
LABEL_28:
          *(_WORD *)((char *)v19 + 9) = v21 & 0xFF3F | 0x40;
        }

        unint64_t v33 = v19;
      }

      else if (v16 == 34)
      {
        unint64_t v33 = *(void **)(v15 + 24);
      }
    }

    else
    {
      uint64_t v34 = result;
      if (!result) {
        return result;
      }
    }

    uint64_t v12 = *(_BYTE **)a1;
    int v9 = *(_BYTE **)(a1 + 8);
  }

  while (*(_BYTE **)a1 == v9 || *v12 != 81);
  *(void *)a1 = v12 + 1;
  char v27 = *(_BYTE *)(a1 + 778);
  *(_BYTE *)(a1 + 778) = 1;
  *(_BYTE *)(a1 + 778) = v27;
  if (v28)
  {
    uint64_t v12 = *(_BYTE **)a1;
    if (*(void *)a1 != *(void *)(a1 + 8) && *v12 == 69) {
      goto LABEL_39;
    }
  }

  return 0LL;
}

void sub_180412CE0(_Unwind_Exception *a1)
{
  *(_BYTE *)(v1 + 778) = v2;
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseCVQualifiers( uint64_t a1)
{
  uint64_t v1 = *(_BYTE **)a1;
  char v2 = *(_BYTE **)(a1 + 8);
  if (*(_BYTE **)a1 == v2 || *v1 != 114)
  {
    uint64_t v3 = 0LL;
  }

  else
  {
    *(void *)a1 = ++v1;
    uint64_t v3 = 4LL;
  }

  if (v1 != v2)
  {
    if (*v1 == 86)
    {
      *(void *)a1 = ++v1;
      uint64_t v3 = v3 | 2;
    }

    if (v1 != v2 && *v1 == 75)
    {
      *(void *)a1 = v1 + 1;
      return v3 | 1;
    }
  }

  return v3;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseTemplateParam( uint64_t a1)
{
  char v2 = *(unsigned __int8 **)a1;
  uint64_t v1 = *(unsigned __int8 **)(a1 + 8);
  uint64_t v4 = v2 + 1;
  *(void *)a1 = v2 + 1;
  uint64_t v24 = 0LL;
  if (v2 + 1 == v1)
  {
    unint64_t v6 = 0LL;
    uint64_t v23 = 0LL;
  }

  else
  {
    if (*v4 == 76)
    {
      *(void *)a1 = v2 + 2;
        return 0LL;
      char v5 = *(unsigned __int8 **)a1;
      uint64_t v1 = *(unsigned __int8 **)(a1 + 8);
      unint64_t v6 = v24 + 1;
      uint64_t v4 = v5 + 1;
      *(void *)a1 = v4;
    }

    else
    {
      unint64_t v6 = 0LL;
    }

    uint64_t v23 = 0LL;
    if (v4 != v1 && *v4 == 95)
    {
      unint64_t v7 = 0LL;
      goto LABEL_18;
    }
  }

    return 0LL;
  uint64_t v4 = *(unsigned __int8 **)a1;
  if (*(void *)a1 == *(void *)(a1 + 8) || *v4 != 95) {
    return 0LL;
  }
  unint64_t v7 = v23 + 1;
LABEL_18:
  *(void *)a1 = v4 + 1;
  if (*(_BYTE *)(a1 + 778))
  {
    int64_t v8 = v4 - v2;
    *((_BYTE *)v9 + 8) = 8;
    *(_WORD *)((char *)v9 + 9) = *(_WORD *)((_BYTE *)v9 + 9) & 0xF000 | 0x540;
    *int v9 = off_1896580A0;
    v9[2] = v2;
    v9[3] = v8;
    return v9;
  }

  if (*(_BYTE *)(a1 + 777) && !v6)
  {
    *((_BYTE *)v9 + 8) = 44;
    *(_WORD *)((char *)v9 + 9) = *(_WORD *)((_BYTE *)v9 + 9) & 0xF000 | 0xA80;
    *int v9 = off_189658180;
    v9[2] = v7;
    v9[3] = 0LL;
    *((_BYTE *)v9 + 32) = 0;
    int v11 = *(char **)(a1 + 728);
    if (v11 == *(char **)(a1 + 736))
    {
      uint64_t v12 = *(char **)(a1 + 720);
      uint64_t v13 = v11 - v12;
      if (v12 == (char *)(a1 + 744))
      {
        __int16 v21 = (char *)malloc(2 * (v11 - v12));
        if (!v21) {
          goto LABEL_43;
        }
        unint64_t v14 = v21;
        if (v11 != v12) {
          memmove(v21, v12, v11 - v12);
        }
        *(void *)(a1 + 720) = v14;
      }

      else
      {
        unint64_t v14 = (char *)realloc(*(void **)(a1 + 720), 2 * (v11 - v12));
        *(void *)(a1 + 720) = v14;
        if (!v14) {
LABEL_43:
        }
          abort();
      }

      int v11 = &v14[8 * (v13 >> 3)];
      *(void *)(a1 + 736) = &v14[8 * (v13 >> 2)];
    }

    *(void *)(a1 + 728) = v11 + 8;
    *(void *)int v11 = v9;
    return v9;
  }

  uint64_t v15 = *(void *)(a1 + 664);
  uint64_t v16 = *(void *)(a1 + 672) - v15;
  if (v6 < v16 >> 3)
  {
    uint64_t v17 = *(void **)(v15 + 8 * v6);
    if (v17)
    {
      uint64_t v19 = v17;
      uint64_t v18 = *v17;
      if (v7 < (v19[1] - v18) >> 3) {
        return *(void **)(v18 + 8 * v7);
      }
    }
  }

  int v9 = 0LL;
  unint64_t v20 = v16 >> 3;
  if (v6 <= v20 && *(void *)(a1 + 784) == v6)
  {
    if (v6 == v20)
    {
      uint64_t v22 = 0LL;
    }
  }

  return v9;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseDecltype( uint64_t a1)
{
  uint64_t v1 = *(_BYTE **)a1;
  char v2 = *(_BYTE **)(a1 + 8);
  if (*(_BYTE **)a1 == v2) {
    return 0LL;
  }
  if (*v1 != 68) {
    return 0LL;
  }
  *(void *)a1 = v1 + 1;
  *(void *)a1 = v1 + 2;
  if (!result) {
    return result;
  }
  char v5 = *(_BYTE **)a1;
  if (*(void *)a1 == *(void *)(a1 + 8) || *v5 != 69) {
    return 0LL;
  }
  unint64_t v6 = result;
  *(void *)a1 = v5 + 1;
  *((_BYTE *)result + 8) = 60;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
  *uint64_t result = off_189658AA0;
  result[2] = "decltype";
  result[3] = 8LL;
  result[5] = 0LL;
  result[6] = 0LL;
  result[4] = v6;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,char const(&)[4]>( uint64_t a1, const char *a2)
{
  size_t v4 = strlen(a2);
  *((_BYTE *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x540;
  *uint64_t v3 = off_1896580A0;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseSubstitution( uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 **)a1;
  char v2 = *(unsigned __int8 **)(a1 + 8);
  *(void *)a1 = v1 + 1;
  if (v2 == v1 + 1) {
    goto LABEL_11;
  }
  unsigned int v4 = v1[1];
  if ((char)v1[1] < 97)
  {
    if (v4 == 95)
    {
      *(void *)a1 = v1 + 2;
      uint64_t v7 = *(void *)(a1 + 296);
      if (v7 != *(void *)(a1 + 304)) {
        return *(void **)v7;
      }
      return 0LL;
    }

LABEL_11:
    unint64_t v14 = 0LL;
    char v5 = 0LL;
      return v5;
    int64_t v8 = *(unsigned __int8 **)a1;
    if (*(void *)a1 != *(void *)(a1 + 8) && *v8 == 95)
    {
      unint64_t v9 = (unint64_t)v14 + 1;
      *(void *)a1 = v8 + 1;
      uint64_t v10 = *(void *)(a1 + 296);
      if (v9 < (*(void *)(a1 + 304) - v10) >> 3) {
        return *(void **)(v10 + 8 * v9);
      }
    }

    return 0LL;
  }

  if (v4 > 0x7A) {
    goto LABEL_11;
  }
  char v5 = 0LL;
  int v6 = 0;
  switch(v1[1])
  {
    case 'a':
      goto LABEL_24;
    case 'b':
      int v6 = 1;
      goto LABEL_24;
    case 'c':
    case 'e':
    case 'f':
    case 'g':
    case 'h':
      return v5;
    case 'd':
      int v6 = 5;
      goto LABEL_24;
    case 'i':
      int v6 = 3;
      goto LABEL_24;
    default:
      if (v4 == 111)
      {
        int v6 = 4;
      }

      else
      {
        if (v4 != 115) {
          return v5;
        }
        int v6 = 2;
      }

LABEL_24:
      *(void *)a1 = v1 + 2;
      *((_BYTE *)v5 + 8) = 48;
      *(_WORD *)((char *)v5 + 9) = *(_WORD *)((_BYTE *)v5 + 9) & 0xF000 | 0x540;
      *((_DWORD *)v5 + 3) = v6;
      *char v5 = off_189659AD0;
      unint64_t v14 = v12;
      if (v12 != v5)
      {
        uint64_t v13 = v12;
        char v5 = v13;
      }

      break;
  }

  return v5;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseUnqualifiedName( char **a1, _BYTE *a2, void *a3, uint64_t a4)
{
  uint64_t v46 = a4;
    return 0LL;
  int64_t v8 = *a1;
  unint64_t v9 = (unsigned __int8 *)a1[1];
  if (!a3) {
    goto LABEL_7;
  }
  if (v8 == (char *)v9)
  {
    unint64_t v11 = 0LL;
    char v14 = 1;
    unint64_t v9 = (unsigned __int8 *)*a1;
    char v10 = 1;
    goto LABEL_21;
  }

  if (*v8 == 70)
  {
    char v10 = 0;
    *a1 = ++v8;
  }

  else
  {
LABEL_7:
    char v10 = 1;
  }

  if (v8 == (char *)v9)
  {
    unint64_t v11 = 0LL;
    char v14 = 1;
    int64_t v8 = (char *)v9;
  }

  else
  {
    if (*v8 == 76) {
      *a1 = ++v8;
    }
    unint64_t v11 = v9 - (unsigned __int8 *)v8;
    if (v9 == (unsigned __int8 *)v8)
    {
      char v14 = 1;
    }

    else
    {
      if (*v8 >= 49)
      {
        unsigned int v12 = *v8;
        if (v12 <= 0x39)
        {
LABEL_35:
          unint64_t v20 = v13;
          goto LABEL_36;
        }

        if (v12 == 85)
        {
          goto LABEL_35;
        }
      }

      char v14 = 0;
    }
  }

LABEL_36:
  if (!v20 || (uint64_t v21 = v46) == 0)
  {
    if (v20) {
      goto LABEL_40;
    }
    return 0LL;
  }

  *((_BYTE *)v22 + 8) = 28;
  *(_WORD *)((char *)v22 + 9) = *(_WORD *)((_BYTE *)v22 + 9) & 0xF000 | 0x540;
  *uint64_t v22 = off_189659D00;
  v22[2] = v21;
  v22[3] = v20;
  unint64_t v20 = v22;
LABEL_40:
  uint64_t v7 = v23;
  if (v23) {
    char v24 = v10;
  }
  else {
    char v24 = 1;
  }
  if ((v24 & 1) == 0)
  {
    *((_BYTE *)v25 + 8) = 25;
    *(_WORD *)((char *)v25 + 9) = *(_WORD *)((_BYTE *)v25 + 9) & 0xF000 | 0x540;
    uint64_t v26 = off_189659D70;
    goto LABEL_48;
  }

  if (a3 && v23)
  {
    *((_BYTE *)v25 + 8) = 24;
    *(_WORD *)((char *)v25 + 9) = *(_WORD *)((_BYTE *)v25 + 9) & 0xF000 | 0x540;
    uint64_t v26 = off_189659DE0;
LABEL_48:
    *uint64_t v25 = v26;
    v25[2] = a3;
    v25[3] = v7;
    return v25;
  }

  return v7;
}

void *anonymous namespace'::itanium_demangle::PODSmallVector<anonymous namespace'::itanium_demangle::PODSmallVector<anonymous namespace'::itanium_demangle::Node *,8ul> *,4ul>::push_back( void *result, uint64_t *__size)
{
  uint64_t v3 = result;
  unsigned int v4 = (void *)result[1];
  if (v4 == (void *)result[2])
  {
    char v5 = (void *)*result;
    int64_t v6 = (int64_t)v4 - *result;
    if ((void *)*result == result + 3)
    {
      uint64_t result = malloc(2 * v6);
      if (!result) {
        goto LABEL_11;
      }
      uint64_t v7 = result;
      if (v4 != v5) {
        uint64_t result = memmove(result, v5, v6);
      }
      *uint64_t v3 = v7;
    }

    else
    {
      uint64_t result = realloc((void *)*result, 2 * v6);
      uint64_t v7 = result;
      *uint64_t v3 = result;
      if (!result) {
LABEL_11:
      }
        abort();
    }

    unsigned int v4 = &v7[v6 >> 3];
    v3[1] = v4;
    v3[2] = &v7[v6 >> 2];
  }

  uint64_t v8 = *__size;
  v3[1] = v4 + 1;
  *unsigned int v4 = v8;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,char const(&)[5]>( uint64_t a1, const char *a2)
{
  size_t v4 = strlen(a2);
  *((_BYTE *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x540;
  *uint64_t v3 = off_1896580A0;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

uint64_t anonymous namespace'::itanium_demangle::ForwardTemplateReference::hasRHSComponentSlow(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 32)) {
    return 0LL;
  }
  *(_BYTE *)(a1 + 32) = 1;
  uint64_t v3 = *(void *)(a1 + 24);
  unsigned int v4 = *(unsigned __int8 *)(v3 + 9);
  if ((v4 & 0xC0) == 0x80) {
    uint64_t result = (**(uint64_t (***)(uint64_t))v3)(v3);
  }
  else {
    uint64_t result = v4 < 0x40;
  }
  *(_BYTE *)(a1 + 32) = 0;
  return result;
}

void sub_180413988(_Unwind_Exception *a1)
{
  *(_BYTE *)(v1 + 32) = 0;
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::itanium_demangle::ForwardTemplateReference::hasArraySlow(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 32)) {
    return 0LL;
  }
  *(_BYTE *)(a1 + 32) = 1;
  uint64_t v3 = *(_BYTE **)(a1 + 24);
  int v4 = v3[10] & 3;
  if (v4 == 2) {
    uint64_t result = (*(uint64_t (**)(_BYTE *))(*(void *)v3 + 8LL))(v3);
  }
  else {
    uint64_t result = v4 == 0;
  }
  *(_BYTE *)(a1 + 32) = 0;
  return result;
}

void sub_1804139F4(_Unwind_Exception *a1)
{
  *(_BYTE *)(v1 + 32) = 0;
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::itanium_demangle::ForwardTemplateReference::hasFunctionSlow(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 32)) {
    return 0LL;
  }
  *(_BYTE *)(a1 + 32) = 1;
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = (*(unsigned __int16 *)(v3 + 9) >> 10) & 3;
  if (v4 == 2) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16LL))(v3);
  }
  else {
    uint64_t result = v4 == 0;
  }
  *(_BYTE *)(a1 + 32) = 0;
  return result;
}

void sub_180413A60(_Unwind_Exception *a1)
{
  *(_BYTE *)(v1 + 32) = 0;
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::itanium_demangle::ForwardTemplateReference::getSyntaxNode(uint64_t a1)
{
  uint64_t v1 = a1;
  if (!*(_BYTE *)(a1 + 32))
  {
    *(_BYTE *)(a1 + 32) = 1;
    uint64_t v2 = (*(uint64_t (**)(void))(**(void **)(a1 + 24) + 24LL))(*(void *)(a1 + 24));
    *(_BYTE *)(v1 + 32) = 0;
    return v2;
  }

  return v1;
}

void sub_180413AB0(_Unwind_Exception *a1)
{
  *(_BYTE *)(v1 + 32) = 0;
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::itanium_demangle::ForwardTemplateReference::printLeft(uint64_t result)
{
  if (!*(_BYTE *)(result + 32))
  {
    uint64_t v1 = result;
    *(_BYTE *)(result + 32) = 1;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(result + 24) + 32LL))(*(void *)(result + 24));
    *(_BYTE *)(v1 + 32) = 0;
  }

  return result;
}

void sub_180413AF8(_Unwind_Exception *a1)
{
  *(_BYTE *)(v1 + 32) = 0;
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::itanium_demangle::ForwardTemplateReference::printRight(uint64_t result)
{
  if (!*(_BYTE *)(result + 32))
  {
    uint64_t v1 = result;
    *(_BYTE *)(result + 32) = 1;
    uint64_t result = (*(uint64_t (**)(void))(**(void **)(result + 24) + 40LL))(*(void *)(result + 24));
    *(_BYTE *)(v1 + 32) = 0;
  }

  return result;
}

void sub_180413B40(_Unwind_Exception *a1)
{
  *(_BYTE *)(v1 + 32) = 0;
  _Unwind_Resume(a1);
}

void anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseExpr( uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 **)a1;
  if (*(void *)(a1 + 8) - *(void *)a1 >= 2uLL && *(_WORD *)v2 == 29543)
  {
    *(void *)a1 = v2 + 2;
    int v3 = 1;
  }

  else
  {
    int v3 = 0;
  }

  char v99 = v3;
  if (v4)
  {
    unint64_t v11 = v4;
    v98[1] = v12;
    __asm { BR              X10 }
  }

  uint64_t v13 = *(unsigned __int8 **)a1;
  char v14 = *(char **)(a1 + 8);
  unint64_t v15 = (unint64_t)&v14[-*(void *)a1];
  if (v15 < 2) {
    return;
  }
  int v16 = *v13;
  switch(v16)
  {
    case 'f':
      int v17 = (char *)(v13 + 1);
      int v18 = v13[1];
      if (v18 != 112)
      {
        if (v18 != 76) {
          goto LABEL_36;
        }
        if (v15 < 3)
        {
          uint64_t v19 = 0LL;
        }

        else
        {
          uint64_t v19 = v13[2];
        }

        if ((*(_DWORD *)(MEMORY[0x1895F8770] + 4 * v19 + 60) & 0x400) == 0)
        {
LABEL_36:
          if (v13 != (unsigned __int8 *)v14)
          {
            *(void *)a1 = v17;
            if (v14 != v17)
            {
              int v30 = *v17;
              if (v30 > 107)
              {
                if (v30 == 108)
                {
                  int v36 = 0;
                  int v31 = 1;
                }

                else
                {
                  if (v30 != 114) {
                    return;
                  }
                  int v31 = 0;
                  int v36 = 0;
                }
              }

              else
              {
                if (v30 == 76)
                {
                  int v31 = 1;
                }

                else
                {
                  if (v30 != 82) {
                    return;
                  }
                  int v31 = 0;
                }

                int v36 = 1;
              }

              *(void *)a1 = v13 + 2;
              if (v41)
              {
                uint64_t v42 = (uint64_t)v41;
                int v43 = v41[2];
                if (v43 == 2
                  || v43 == 4 && *(_BYTE *)(strlen(*((const char **)v41 + 1)) + *((void *)v41 + 1) - 1) == 42)
                {
                  if (v44)
                  {
                    uint64_t v45 = v44;
                    if (v36)
                    {
                      if (!v46) {
                        return;
                      }
                      if (v31) {
                        uint64_t v47 = v45;
                      }
                      else {
                        uint64_t v47 = v46;
                      }
                      if (v31) {
                        uint64_t v45 = v46;
                      }
                    }

                    else
                    {
                      uint64_t v47 = 0LL;
                    }

                    uint64_t v60 = v59;
                    *((_BYTE *)v61 + 8) = 71;
                    *(_WORD *)((char *)v61 + 9) = *(_WORD *)((_BYTE *)v61 + 9) & 0xF000 | 0x540;
                    *uint64_t v61 = off_189659280;
                    v61[2] = v45;
                    v61[3] = v47;
                    v61[4] = Symbol;
                    v61[5] = v60;
                    *((_BYTE *)v61 + 48) = v31;
                    return;
                  }
                }
              }
            }
          }

          return;
        }
      }

      return;
    case 'T':
      return;
    case 'L':
      return;
  }

  if (*(_WORD *)v13 == 27753)
  {
    char v27 = v13 + 2;
    *(void *)a1 = v27;
    unint64_t v28 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3;
    while (v27 == (unsigned __int8 *)v14 || *v27 != 69)
    {
      if (!v101.n128_u64[0]) {
        return;
      }
      char v27 = *(unsigned __int8 **)a1;
      char v14 = *(char **)(a1 + 8);
    }

    *(void *)a1 = v27 + 1;
    uint64_t v34 = v33;
    *((_BYTE *)v35 + 8) = 70;
    *(_WORD *)((char *)v35 + 9) = *(_WORD *)((_BYTE *)v35 + 9) & 0xF000 | 0x540;
    void *v35 = off_189659440;
    v35[2] = 0LL;
    v35[3] = v32;
    v35[4] = v34;
  }

  else
  {
    if (*(_WORD *)v13 == 25453)
    {
      *(void *)a1 = v13 + 2;
      return;
    }

    {
      if (v101.n128_u64[0])
      {
        LODWORD(v98[0]) = 2;
      }

      return;
    }

    BOOL v29 = *(unsigned __int8 **)a1;
    if (*(void *)(a1 + 8) - *(void *)a1 >= 2uLL && *v29 == 114 && (v29[1] | 0x20) == 0x71)
    {
      return;
    }

    {
      return;
    }

    {
      if (!v37) {
        return;
      }
      uint64_t v38 = (void *)v37;
      *((_BYTE *)v39 + 8) = 42;
      *(_WORD *)((char *)v39 + 9) = *(_WORD *)((_BYTE *)v39 + 9) & 0xF000 | 0x540;
      uint64_t v40 = off_1896592F0;
      goto LABEL_52;
    }

    {
      if (*(void *)(a1 + 8) != *(void *)a1 && **(_BYTE **)a1 == 84)
      {
        if (!v48) {
          return;
        }
        uint64_t v38 = v48;
        *((_BYTE *)v39 + 8) = 62;
        *(_WORD *)((char *)v39 + 9) = *(_WORD *)((_BYTE *)v39 + 9) & 0xF000 | 0x540;
        uint64_t v40 = off_189659750;
        goto LABEL_52;
      }

      if (!v101.n128_u64[0]) {
        return;
      }
LABEL_94:
      return;
    }

    {
      unint64_t v56 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3;
      while (1)
      {
        uint64_t v57 = *(unsigned __int8 **)a1;
        if (*(void *)a1 != *(void *)(a1 + 8) && *v57 == 69) {
          break;
        }
        if (!v101.n128_u64[0]) {
          return;
        }
      }

      *(void *)a1 = v57 + 1;
      uint64_t v74 = v73;
      *((_BYTE *)v75 + 8) = 0;
      *(_WORD *)((char *)v75 + 9) = *(_WORD *)((_BYTE *)v75 + 9) & 0xF000 | 0x540;
      *uint64_t v75 = off_1896597C0;
      v75[2] = v72;
      v75[3] = v74;
      v101.n128_u64[0] = (unint64_t)v75;
      goto LABEL_94;
    }

    {
      if (v62)
      {
        uint64_t v69 = v62;
        unint64_t v70 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3;
        while (1)
        {
          uint64_t v71 = *(unsigned __int8 **)a1;
          if (*(void *)a1 != *(void *)(a1 + 8) && *v71 == 69) {
            break;
          }
          if (!v101.n128_u64[0]) {
            return;
          }
        }

        *(void *)a1 = v71 + 1;
        uint64_t v91 = v90;
        *((_BYTE *)v92 + 8) = 70;
        *(_WORD *)((char *)v92 + 9) = *(_WORD *)((_BYTE *)v92 + 9) & 0xF000 | 0x540;
        *uint64_t v92 = off_189659440;
        v92[2] = v69;
        v92[3] = v89;
        v92[4] = v91;
      }

      return;
    }

    {
      return;
    }

    {
      if (!v76) {
        return;
      }
      uint64_t v38 = (void *)v76;
      *((_BYTE *)v39 + 8) = 72;
      *(_WORD *)((char *)v39 + 9) = *(_WORD *)((_BYTE *)v39 + 9) & 0xF000 | 0x540;
      uint64_t v40 = off_189659830;
LABEL_52:
      *uint64_t v39 = v40;
      v39[2] = v38;
      return;
    }

    uint64_t v77 = *(unsigned __int8 **)a1;
    if (*(void *)a1 == *(void *)(a1 + 8) || *v77 != 117)
    {
      return;
    }

    *(void *)a1 = v77 + 1;
    v98[0] = (uint64_t)v78;
    if (v78)
    {
      uint64_t v79 = (void *)(*(uint64_t (**)(void *))(*v78 + 48LL))(v78);
      if (v80 == 8 && *v79 == 0x666F646975755F5FLL)
      {
        char v94 = *(unsigned __int8 **)a1;
        if (*(void *)a1 != *(void *)(a1 + 8))
        {
          int v95 = *v94;
          if (v95 == 122)
          {
            *(void *)a1 = v94 + 1;
            goto LABEL_117;
          }

          if (v95 == 116)
          {
            *(void *)a1 = v94 + 1;
LABEL_117:
            uint64_t v97 = v96;
            if (!v96) {
              return;
            }
            uint64_t v87 = *(void *)(a1 + 24) - *(void *)(a1 + 16);
LABEL_111:
            v101.n128_u64[1] = v93;
            LODWORD(v100) = 1;
            return;
          }
        }
      }

      uint64_t v87 = *(void *)(a1 + 24) - *(void *)(a1 + 16);
      while (1)
      {
        uint64_t v88 = *(unsigned __int8 **)a1;
        if (*(void *)a1 != *(void *)(a1 + 8) && *v88 == 69) {
          break;
        }
        if (!v101.n128_u64[0]) {
          return;
        }
      }

      *(void *)a1 = v88 + 1;
      goto LABEL_111;
    }
  }

void sub_1804149E8(_Unwind_Exception *a1)
{
  *(_BYTE *)(v1 + 776) = v2;
  _Unwind_Resume(a1);
}

unsigned __int8 *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseOperatorEncoding( unsigned __int8 **a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = 0LL;
  int v3 = *v1;
  uint64_t v4 = 61LL;
  do
  {
    unint64_t v5 = (v4 + v2) >> 1;
       + 16 * v5;
    if (*v6 >= (char)v3)
    {
      if (*v6 == v3)
      {
        else {
          unint64_t v2 = v5 + 1;
        }
      }

      else
      {
        uint64_t v4 = (v4 + v2) >> 1;
      }
    }

    else
    {
      unint64_t v2 = v5 + 1;
    }
  }

  while (v4 != v2);
     + 16 * v2;
  if (*v7 != v3 || v7[1] != v1[1]) {
    return 0LL;
  }
  *a1 = v1 + 2;
  return v7;
}

const char *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::OperatorInfo::getSymbol( uint64_t a1)
{
  unint64_t v2 = *(const char **)(a1 + 8);
  size_t v3 = strlen(v2);
  size_t v10 = v3;
  if (v3 < 8 || *(void *)v2 != 0x726F74617265706FLL) {
    abort_message( "%s:%d: %s",  v3,  v4,  v5,  v6,  v7,  v8,  v9,  (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/ItaniumDemangle.h");
  }
  uint64_t result = v2 + 8;
  if (v10 != 8 && *result == 32) {
    return v2 + 9;
  }
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parsePrefixExpr( uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  if (result)
  {
    uint64_t v9 = result;
    *((_BYTE *)result + 8) = 66;
    *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | a4 & 0x3F | 0x540;
    *uint64_t result = off_189658640;
    result[2] = a2;
    result[3] = a3;
    result[4] = v9;
  }

  return result;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::MemberExpr,anonymous namespace'::itanium_demangle::Node *&,std::string_view &,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node::Prec>( uint64_t a1, uint64_t *a2, __n128 *a3, uint64_t *a4, _WORD *a5)
{
  uint64_t v10 = *a2;
  uint64_t v11 = *a4;
  char v12 = *a5;
  *((_BYTE *)v9 + 8) = 58;
  __int16 v13 = *(_WORD *)((_BYTE *)v9 + 9) & 0xF000 | v12 & 0x3F | 0x540;
  *uint64_t v9 = off_189658790;
  __n128 result = *a3;
  *(_WORD *)((char *)v9 + 9) = v13;
  v9[2] = v10;
  *(__n128 *)(v9 + 3) = result;
  v9[5] = v11;
  return result;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NewExpr,anonymous namespace'::itanium_demangle::NodeArray &,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::NodeArray &,BOOL &,BOOL,anonymous namespace'::itanium_demangle::Node::Prec>( uint64_t a1, __n128 *a2, uint64_t *a3, __int128 *a4, char *a5, char *a6, _WORD *a7)
{
  uint64_t v14 = *a3;
  char v15 = *a5;
  char v16 = *a6;
  char v17 = *a7;
  *((_BYTE *)v13 + 8) = 64;
  __int16 v18 = *(_WORD *)((_BYTE *)v13 + 9) & 0xF000 | v17 & 0x3F | 0x540;
  *__int16 v13 = off_189658800;
  __n128 result = *a2;
  __int128 v20 = *a4;
  *(_WORD *)((char *)v13 + 9) = v18;
  *((__n128 *)v13 + 1) = result;
  v13[4] = v14;
  *(_OWORD *)(v13 + 5) = v20;
  *((_BYTE *)v13 + 56) = v15;
  *((_BYTE *)v13 + 57) = v16;
  return result;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::CallExpr,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::NodeArray,anonymous namespace'::itanium_demangle::Node::Prec>( uint64_t a1, uint64_t *a2, __n128 *a3, _WORD *a4)
{
  uint64_t v8 = *a2;
  char v9 = *a4;
  *((_BYTE *)v7 + 8) = 63;
  __int16 v10 = *(_WORD *)((_BYTE *)v7 + 9) & 0xF000 | v9 & 0x3F | 0x540;
  *uint64_t v7 = off_1896588E0;
  __n128 result = *a3;
  *(_WORD *)((char *)v7 + 9) = v10;
  v7[2] = v8;
  *(__n128 *)(v7 + 3) = result;
  return result;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::ConversionExpr,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::NodeArray &,anonymous namespace'::itanium_demangle::Node::Prec>( uint64_t a1, uint64_t *a2, __n128 *a3, _WORD *a4)
{
  uint64_t v8 = *a2;
  char v9 = *a4;
  *((_BYTE *)v7 + 8) = 68;
  __int16 v10 = *(_WORD *)((_BYTE *)v7 + 9) & 0xF000 | v9 & 0x3F | 0x540;
  *uint64_t v7 = off_189658950;
  __n128 result = *a3;
  *(_WORD *)((char *)v7 + 9) = v10;
  v7[2] = v8;
  *(__n128 *)(v7 + 3) = result;
  return result;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::CastExpr,std::string_view &,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node::Prec>( uint64_t a1, __n128 *a2, uint64_t *a3, uint64_t *a4, _WORD *a5)
{
  uint64_t v10 = *a3;
  uint64_t v11 = *a4;
  char v12 = *a5;
  *((_BYTE *)v9 + 8) = 61;
  __int16 v13 = *(_WORD *)((_BYTE *)v9 + 9) & 0xF000 | v12 & 0x3F | 0x540;
  *char v9 = off_189658A30;
  __n128 result = *a2;
  *(_WORD *)((char *)v9 + 9) = v13;
  *((__n128 *)v9 + 1) = result;
  v9[4] = v10;
  v9[5] = v11;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseExprPrimary( uint64_t a1)
{
  uint64_t v1 = *(char **)a1;
  unint64_t v2 = *(char **)(a1 + 8);
  if (*(char **)a1 != v2 && *v1 == 76)
  {
    uint64_t v4 = v1 + 1;
    *(void *)a1 = v1 + 1;
    unint64_t v5 = v2 - (v1 + 1);
    if (v2 == v1 + 1)
    {
LABEL_10:
      if (!result) {
        return result;
      }
      uint64_t v10 = result;
      if (v12)
      {
        __int16 v13 = *(char **)a1;
        if (*(void *)a1 != *(void *)(a1 + 8) && *v13 == 69)
        {
          uint64_t v14 = v11;
          uint64_t v15 = v12;
          *(void *)a1 = v13 + 1;
          *((_BYTE *)result + 8) = 76;
          *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
          *__n128 result = off_1896591A0;
          result[2] = v10;
          result[3] = v14;
          result[4] = v15;
          return result;
        }
      }
    }

    else
    {
      __n128 result = 0LL;
      switch(*(_BYTE *)v4)
      {
        case 'A':
          if (!result) {
            return result;
          }
          uint64_t v7 = *(char **)a1;
          if (*(void *)a1 == *(void *)(a1 + 8) || *v7 != 69) {
            return 0LL;
          }
          uint64_t v8 = result;
          *(void *)a1 = v7 + 1;
          *((_BYTE *)result + 8) = 74;
          *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
          char v9 = off_189658D40;
          goto LABEL_9;
        case 'D':
          if (v5 < 2) {
            return 0LL;
          }
          if (*v4 != 28228) {
            return 0LL;
          }
          char v16 = v1 + 3;
          *(void *)a1 = v1 + 3;
          if (v1 + 3 == v2) {
            return 0LL;
          }
          if (*v16 == 48)
          {
            char v16 = v1 + 4;
            *(void *)a1 = v1 + 4;
          }

          if (v16 == v2 || *v16 != 69) {
            return 0LL;
          }
          *(void *)a1 = v16 + 1;
        case 'T':
          return result;
        case 'U':
          if (v5 < 2 || v1[2] != 108) {
            return 0LL;
          }
          if (!result) {
            return result;
          }
          char v17 = *(char **)a1;
          if (*(void *)a1 == *(void *)(a1 + 8) || *v17 != 69) {
            return 0LL;
          }
          uint64_t v8 = result;
          *(void *)a1 = v17 + 1;
          *((_BYTE *)result + 8) = 75;
          *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
          char v9 = off_189659130;
LABEL_9:
          *__n128 result = v9;
          result[2] = v8;
          return result;
        case '_':
          if (v5 < 2 || *v4 != 23135) {
            return 0LL;
          }
          *(void *)a1 = v1 + 3;
          if (!result) {
            return result;
          }
          __int16 v18 = *(char **)a1;
          if (*(void *)a1 == *(void *)(a1 + 8) || *v18 != 69) {
            return 0LL;
          }
          *(void *)a1 = v18 + 1;
          return result;
        case 'a':
          *(void *)a1 = v1 + 2;
        case 'b':
          if (v5 >= 3 && (*v4 == 12386 ? (BOOL v19 = v1[3] == 69) : (BOOL v19 = 0), v19))
          {
            *(void *)a1 = v1 + 4;
            int v34 = 0;
            __int128 v20 = &v34;
          }

          else
          {
              return 0LL;
            int v33 = 1;
            __int128 v20 = &v33;
          }

        case 'c':
          *(void *)a1 = v1 + 2;
        case 'd':
          uint64_t v21 = v1 + 2;
          *(void *)a1 = v1 + 2;
          uint64_t v22 = 0LL;
          uint64_t v23 = v1 + 18;
          while ((v21[v22] & 0x80000000) == 0
               && (*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * v21[v22] + 60) & 0x10000) != 0)
          {
            if (++v22 == 16)
            {
              *(void *)a1 = v23;
              if (v23 != v2 && *v23 == 69)
              {
                *(void *)a1 = v1 + 19;
                *((_BYTE *)result + 8) = 79;
                *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
                *__n128 result = off_189658C60;
                uint64_t v24 = 16LL;
                goto LABEL_86;
              }

              return 0LL;
            }
          }

          return 0LL;
        case 'e':
          uint64_t v25 = v1 + 2;
          *(void *)a1 = v1 + 2;
          uint64_t v26 = 0LL;
          char v27 = v1 + 34;
          while ((v25[v26] & 0x80000000) == 0
               && (*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * v25[v26] + 60) & 0x10000) != 0)
          {
            if (++v26 == 32)
            {
              *(void *)a1 = v27;
              if (v27 != v2 && *v27 == 69)
              {
                *(void *)a1 = v1 + 35;
                *((_BYTE *)result + 8) = 80;
                *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
                *__n128 result = off_189658CD0;
                result[2] = v25;
                result[3] = 32LL;
                return result;
              }

              return 0LL;
            }
          }

          return 0LL;
        case 'f':
          uint64_t v21 = v1 + 2;
          *(void *)a1 = v1 + 2;
          uint64_t v31 = 0LL;
          uint64_t v32 = v1 + 10;
          break;
        case 'h':
          *(void *)a1 = v1 + 2;
        case 'i':
          *(void *)a1 = v1 + 2;
        case 'j':
          *(void *)a1 = v1 + 2;
          unint64_t v28 = "u";
          goto LABEL_67;
        case 'l':
          *(void *)a1 = v1 + 2;
          unint64_t v28 = "l";
LABEL_67:
          uint64_t v29 = a1;
          uint64_t v30 = 1LL;
        case 'm':
          *(void *)a1 = v1 + 2;
          unint64_t v28 = "ul";
          goto LABEL_75;
        case 'n':
          *(void *)a1 = v1 + 2;
        case 'o':
          *(void *)a1 = v1 + 2;
        case 's':
          *(void *)a1 = v1 + 2;
        case 't':
          *(void *)a1 = v1 + 2;
        case 'w':
          *(void *)a1 = v1 + 2;
        case 'x':
          *(void *)a1 = v1 + 2;
          unint64_t v28 = "ll";
LABEL_75:
          uint64_t v29 = a1;
          uint64_t v30 = 2LL;
        case 'y':
          *(void *)a1 = v1 + 2;
          unint64_t v28 = "ull";
          uint64_t v29 = a1;
          uint64_t v30 = 3LL;
        default:
          goto LABEL_10;
      }

      while ((v21[v31] & 0x80000000) == 0
           && (*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * v21[v31] + 60) & 0x10000) != 0)
      {
        if (++v31 == 8)
        {
          *(void *)a1 = v32;
          if (v32 == v2 || *v32 != 69) {
            return 0LL;
          }
          *(void *)a1 = v1 + 11;
          *((_BYTE *)result + 8) = 78;
          *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
          *__n128 result = off_189658BF0;
          uint64_t v24 = 8LL;
LABEL_86:
          result[2] = v21;
          result[3] = v24;
          return result;
        }
      }
    }
  }

  return 0LL;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseFunctionParam( uint64_t a1)
{
  unint64_t v2 = *(char **)a1;
  unint64_t v3 = *(void *)(a1 + 8) - *(void *)a1;
  if (v3 < 3)
  {
    if (v3 != 2) {
      return 0LL;
    }
LABEL_8:
    if (*(_WORD *)v2 == 28774)
    {
      uint64_t v7 = v2 + 2;
    }

    else
    {
      if (*(_WORD *)v2 != 19558) {
        return 0LL;
      }
      *(void *)a1 = v2 + 2;
      if (!v5) {
        return 0LL;
      }
      uint64_t v6 = *(char **)a1;
      if (*(void *)a1 == *(void *)(a1 + 8) || *v6 != 112) {
        return 0LL;
      }
      uint64_t v7 = v6 + 1;
    }

    *(void *)a1 = v7;
    uint64_t v10 = *(char **)a1;
    if (*(void *)a1 != *(void *)(a1 + 8) && *v10 == 95)
    {
      uint64_t v11 = v8;
      uint64_t v12 = v9;
      *(void *)a1 = v10 + 1;
      *((_BYTE *)result + 8) = 67;
      *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
      *__n128 result = off_189659210;
      result[2] = v11;
      result[3] = v12;
      return result;
    }

    return 0LL;
  }

  if (*(_WORD *)v2 != 28774 || v2[2] != 84) {
    goto LABEL_8;
  }
  *(void *)a1 = v2 + 3;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseBracedExpr( void *a1)
{
  unint64_t v2 = (_BYTE *)*a1;
  if (a1[1] - *a1 < 2uLL || *v2 != 100) {
  int v3 = (char)v2[1];
  }
  switch(v3)
  {
    case 'X':
      *a1 = v2 + 2;
      if (result)
      {
        uint64_t v7 = result;
        if (result)
        {
          uint64_t v8 = result;
          if (result)
          {
            uint64_t v9 = result;
            *((_BYTE *)result + 8) = 82;
            *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
            *__n128 result = off_1896593D0;
            result[2] = v7;
            result[3] = v8;
            result[4] = v9;
          }
        }
      }

      break;
    case 'x':
      *a1 = v2 + 2;
      if (result)
      {
        uint64_t v10 = result;
        if (result)
        {
          uint64_t v11 = result;
          *((_BYTE *)result + 8) = 81;
          *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
          *__n128 result = off_189659360;
          result[2] = v10;
          result[3] = v11;
          *((_BYTE *)result + 32) = 1;
        }
      }

      break;
    case 'i':
      *a1 = v2 + 2;
      if (result)
      {
        uint64_t v5 = result;
        if (result)
        {
          uint64_t v6 = result;
          *((_BYTE *)result + 8) = 81;
          *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
          *__n128 result = off_189659360;
          result[2] = v5;
          result[3] = v6;
          *((_BYTE *)result + 32) = 0;
        }
      }

      return result;
    default:
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parsePointerToMemberConversionExpr( uint64_t a1)
{
  if (result)
  {
    int v3 = result;
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v7 = *(char **)a1;
      if (*(void *)a1 == *(void *)(a1 + 8) || *v7 != 69)
      {
        return 0LL;
      }

      else
      {
        uint64_t v8 = v5;
        uint64_t v9 = v6;
        *(void *)a1 = v7 + 1;
        *((_BYTE *)result + 8) = 69;
        *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x542;
        *__n128 result = off_1896594B0;
        result[2] = v3;
        result[3] = v4;
        result[4] = v8;
        result[5] = v9;
      }
    }
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::EnclosingExpr,char const(&)[10],anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node::Prec>( uint64_t a1, uint64_t *a2, _WORD *a3)
{
  uint64_t v6 = *a2;
  char v7 = *a3;
  *((_BYTE *)result + 8) = 60;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | v7 & 0x3F | 0x540;
  *__n128 result = off_189658AA0;
  result[2] = "noexcept ";
  result[3] = 9LL;
  result[5] = 0LL;
  result[6] = 0LL;
  result[4] = v6;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseRequiresExpr( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (_WORD *)*a1;
  uint64_t v9 = (_BYTE *)a1[1];
  if (*v8 == 20850)
  {
    uint64_t v12 = v8 + 1;
    *a1 = v12;
    unint64_t v13 = (uint64_t)(a1[3] - a1[2]) >> 3;
    while (v12 == v9 || *v12 != 95)
    {
      int v43 = result;
      if (!result) {
        return result;
      }
      uint64_t v12 = (_BYTE *)*a1;
      uint64_t v9 = (_BYTE *)a1[1];
    }

    *a1 = v12 + 1;
    uint64_t v42 = v15;
    uint64_t v11 = (_BYTE *)*a1;
    uint64_t v9 = (_BYTE *)a1[1];
  }

  else
  {
    if (*v8 != 29042) {
      return 0LL;
    }
    unsigned int v41 = 0LL;
    uint64_t v42 = 0LL;
    uint64_t v11 = v8 + 1;
    *a1 = v11;
  }

  uint64_t v16 = a1[2];
  uint64_t v17 = a1[3];
  int v43 = 0LL;
  if (v11 != v9)
  {
    unint64_t v40 = (v17 - v16) >> 3;
    __int16 v18 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 101);
    while (1)
    {
      int v19 = *v11;
      if (v19 == 81) {
        break;
      }
      if (v19 == 84)
      {
        *a1 = v11 + 1;
        if (!v28) {
          return 0LL;
        }
        uint64_t v26 = v28;
        *((_BYTE *)v27 + 8) = 85;
        *(_WORD *)((char *)v27 + 9) = *(_WORD *)((_BYTE *)v27 + 9) & 0xF000 | 0x540;
        *char v27 = off_189659590;
        goto LABEL_24;
      }

      if (v19 != 88) {
        return 0LL;
      }
      *a1 = v11 + 1;
      if (!v20) {
        return 0LL;
      }
      uint64_t v21 = v20;
      uint64_t v22 = (_BYTE *)*a1;
      uint64_t v23 = (_BYTE *)a1[1];
      if ((_BYTE *)*a1 == v23 || *v22 != 78)
      {
        char v24 = 0;
      }

      else
      {
        *a1 = ++v22;
        char v24 = 1;
      }

      if (v22 == v23 || *v22 != 82)
      {
        uint64_t v29 = 0LL;
      }

      else
      {
        *a1 = v22 + 1;
        if (!v29) {
          return 0LL;
        }
      }

      *((_BYTE *)v27 + 8) = 84;
      *(_WORD *)((char *)v27 + 9) = *(_WORD *)((_BYTE *)v27 + 9) & 0xF000 | 0x540;
      *char v27 = off_189659520;
      v27[2] = v21;
      *((_BYTE *)v27 + qmemcpy((void *)(*(void *)this + *((void *)this + 1)), "construction vtable for ", 24) = v24;
      v27[4] = v29;
LABEL_32:
      int v43 = v27;
      uint64_t v11 = (_BYTE *)*a1;
      int v36 = (_BYTE *)a1[1];
      if ((_BYTE *)*a1 != v36 && *v11 == 69)
      {
        *a1 = v11 + 1;
        uint64_t v39 = v38;
        *((_BYTE *)result + 8) = 83;
        *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
        *__n128 result = off_189659670;
        result[2] = v41;
        result[3] = v42;
        result[4] = v37;
        result[5] = v39;
        return result;
      }

      int v43 = 0LL;
      if (v11 == v36) {
        return 0LL;
      }
    }

    *a1 = v11 + 1;
    if (!v25) {
      return 0LL;
    }
    uint64_t v26 = v25;
    *((_BYTE *)v27 + 8) = 86;
    *(_WORD *)((char *)v27 + 9) = *(_WORD *)((_BYTE *)v27 + 9) & 0xF000 | 0x540;
    *char v27 = off_189659600;
LABEL_24:
    v27[2] = v26;
    goto LABEL_32;
  }

  return 0LL;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseSubobjectExpr( uint64_t a1)
{
  if (result)
  {
    int v3 = result;
    if (result)
    {
      uint64_t v4 = result;
      unint64_t v13 = *(char **)a1;
      uint64_t v14 = *(char **)(a1 + 8);
      if (*(char **)a1 != v14)
      {
        uint64_t v15 = v5;
        uint64_t v16 = v6;
        uint64_t v17 = *(void *)(a1 + 16);
        uint64_t v18 = *(void *)(a1 + 24);
        int v19 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 808);
        int v20 = *v13;
        if (v20 == 95)
        {
          uint64_t v30 = *(void *)(a1 + 24);
          uint64_t v31 = *(void *)(a1 + 16);
          uint64_t v32 = v6;
          uint64_t v33 = v5;
          while (1)
          {
            *(void *)a1 = v13 + 1;
            uint64_t v23 = v22;
            *((_BYTE *)v24 + 8) = 8;
            *(_WORD *)((char *)v24 + 9) = *(_WORD *)((_BYTE *)v24 + 9) & 0xF000 | 0x540;
            *char v24 = off_1896580A0;
            v24[2] = v21;
            v24[3] = v23;
            uint64_t v34 = v24;
            unint64_t v13 = *(char **)a1;
            uint64_t v14 = *(char **)(a1 + 8);
            int v20 = *v13;
            if (v20 != 95)
            {
              uint64_t v16 = v32;
              uint64_t v15 = v33;
              uint64_t v18 = v30;
              uint64_t v17 = v31;
              goto LABEL_9;
            }
          }
        }

        else
        {
LABEL_9:
          BOOL v25 = v13 != v14 && v20 == 112;
          char v26 = v25;
          if (v25) {
            *(void *)a1 = ++v13;
          }
          if (v13 != v14 && *v13 == 69)
          {
            *(void *)a1 = v13 + 1;
            uint64_t v29 = v28;
            *((_BYTE *)result + 8) = 59;
            *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
            *__n128 result = off_1896596E0;
            result[2] = v3;
            result[3] = v4;
            result[4] = v15;
            result[5] = v16;
            result[6] = v27;
            result[7] = v29;
            *((_BYTE *)result + 64) = v26;
            return result;
          }
        }
      }

      return 0LL;
    }
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::EnclosingExpr,char const(&)[11],anonymous namespace'::itanium_demangle::Node *&>( uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  *((_BYTE *)result + 8) = 60;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
  *__n128 result = off_189658AA0;
  result[2] = "sizeof... ";
  result[3] = 10LL;
  result[4] = v4;
  result[5] = 0LL;
  result[6] = 0LL;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,char const(&)[6]>( uint64_t a1, const char *a2)
{
  size_t v4 = strlen(a2);
  *((_BYTE *)v3 + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x540;
  *int v3 = off_1896580A0;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseUnresolvedName( uint64_t a1, int a2)
{
  size_t v4 = *(unsigned __int8 **)a1;
  uint64_t v5 = *(char **)(a1 + 8);
  unint64_t v6 = (unint64_t)&v5[-*(void *)a1];
  if (v6 >= 3)
  {
    if (*(_WORD *)v4 == 29299 && v4[2] == 78)
    {
      *(void *)a1 = v4 + 3;
      if (v11)
      {
        uint64_t v18 = v11;
        if (*(void *)(a1 + 8) != *(void *)a1 && **(_BYTE **)a1 == 73)
        {
          if (!v19) {
            return 0LL;
          }
          int v20 = v19;
          *((_BYTE *)v21 + 8) = 45;
          *(_WORD *)((char *)v21 + 9) = *(_WORD *)((_BYTE *)v21 + 9) & 0xF000 | 0x540;
          *uint64_t v21 = off_189659FA0;
          v21[2] = v18;
          v21[3] = v20;
          uint64_t v18 = v21;
        }

        uint64_t v22 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 808);
        while (1)
        {
          uint64_t v23 = *(unsigned __int8 **)a1;
          if (*(void *)a1 != *(void *)(a1 + 8) && *v23 == 69) {
            break;
          }
          if (!v8) {
            return v8;
          }
          *((_BYTE *)v24 + 8) = 23;
          *(_WORD *)((char *)v24 + 9) = *(_WORD *)((_BYTE *)v24 + 9) & 0xF000 | 0x540;
          *char v24 = off_1896598A0;
          v24[2] = v18;
          v24[3] = v8;
          uint64_t v18 = v24;
        }

        *(void *)a1 = v23 + 1;
        if (v41)
        {
          uint64_t v42 = v41;
          *((_BYTE *)v8 + 8) = 23;
          *(_WORD *)((char *)v8 + 9) = *(_WORD *)((_BYTE *)v8 + 9) & 0xF000 | 0x540;
          void *v8 = off_1896598A0;
          v8[2] = v18;
          v8[3] = v42;
          return v8;
        }
      }

      return 0LL;
    }
  }

  else if (v6 != 2)
  {
    goto LABEL_9;
  }

  if (*(_WORD *)v4 == 29299)
  {
    unint64_t v10 = (unint64_t)(v4 + 2);
    *(void *)a1 = v10;
    if (v5 == (char *)v10)
    {
      unint64_t v10 = 0LL;
    }

    else
    {
      LODWORD(v10) = *(char *)v10;
      if ((v10 & 0x80000000) != 0) {
        goto LABEL_27;
      }
      unint64_t v10 = v10;
    }

    if ((*(_DWORD *)(MEMORY[0x1895F8770] + 4 * v10 + 60) & 0x400) == 0)
    {
LABEL_27:
      if (v25)
      {
        uint64_t v32 = v25;
        if (*(void *)(a1 + 8) == *(void *)a1 || **(_BYTE **)a1 != 73)
        {
LABEL_47:
          if (v43)
          {
            uint64_t v44 = v43;
            *((_BYTE *)v8 + 8) = 23;
            *(_WORD *)((char *)v8 + 9) = *(_WORD *)((_BYTE *)v8 + 9) & 0xF000 | 0x540;
            void *v8 = off_1896598A0;
            v8[2] = v32;
            v8[3] = v44;
            return v8;
          }
        }

        else
        {
          if (v33)
          {
            uint64_t v34 = v33;
            *((_BYTE *)v35 + 8) = 45;
            *(_WORD *)((char *)v35 + 9) = *(_WORD *)((_BYTE *)v35 + 9) & 0xF000 | 0x540;
            void *v35 = off_189659FA0;
            v35[2] = v32;
            v35[3] = v34;
            uint64_t v32 = v35;
            goto LABEL_47;
          }
        }
      }

      return 0LL;
    }

    if (!v36) {
      return 0LL;
    }
    uint64_t v37 = v36;
    uint64_t v32 = 0LL;
    while (1)
    {
      if (v32)
      {
        *((_BYTE *)v38 + 8) = 23;
        *(_WORD *)((char *)v38 + 9) = *(_WORD *)((_BYTE *)v38 + 9) & 0xF000 | 0x540;
        *uint64_t v38 = off_1896598A0;
        v38[2] = v32;
        uint64_t v39 = v38 + 3;
        uint64_t v32 = v38;
      }

      else
      {
        if (!a2)
        {
          uint64_t v32 = v37;
          goto LABEL_39;
        }

        *((_BYTE *)v32 + 8) = 46;
        *(_WORD *)((char *)v32 + 9) = *(_WORD *)((_BYTE *)v32 + 9) & 0xF000 | 0x540;
        *uint64_t v32 = off_189659A60;
        uint64_t v39 = v32 + 2;
      }

      *uint64_t v39 = v37;
LABEL_39:
      unint64_t v40 = *(unsigned __int8 **)a1;
      if (*(void *)a1 != *(void *)(a1 + 8) && *v40 == 69)
      {
        *(void *)a1 = v40 + 1;
        goto LABEL_47;
      }

      if (!v37) {
        return 0LL;
      }
    }
  }

LABEL_9:
  if (v8 && a2)
  {
    *((_BYTE *)v9 + 8) = 46;
    *(_WORD *)((char *)v9 + 9) = *(_WORD *)((_BYTE *)v9 + 9) & 0xF000 | 0x540;
    *uint64_t v9 = off_189659A60;
    v9[2] = v8;
    return v9;
  }

  return v8;
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::BinaryExpr,anonymous namespace'::itanium_demangle::Node *&,std::string_view &,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node::Prec &>( uint64_t a1, uint64_t *a2, __n128 *a3, uint64_t *a4, _WORD *a5)
{
  uint64_t v10 = *a2;
  uint64_t v11 = *a4;
  char v12 = *a5;
  *((_BYTE *)v9 + 8) = 54;
  __int16 v13 = *(_WORD *)((_BYTE *)v9 + 9) & 0xF000 | v12 & 0x3F | 0x540;
  *uint64_t v9 = off_1896585D0;
  __n128 result = *a3;
  *(_WORD *)((char *)v9 + 9) = v13;
  v9[2] = v10;
  *(__n128 *)(v9 + 3) = result;
  v9[5] = v11;
  return result;
}

void *anonymous namespace'::itanium_demangle::BinaryExpr::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  if (*((_DWORD *)this + 8)) {
    goto LABEL_2;
  }
  uint64_t v15 = *(_BYTE **)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  if (v16 != 2)
  {
    if (v16 == 1 && *v15 == 62) {
      goto LABEL_19;
    }
LABEL_2:
    int v4 = 0;
    goto LABEL_3;
  }

  if (memcmp(v15, ">>", 2uLL)) {
    goto LABEL_2;
  }
LABEL_19:
  int v4 = 1;
  *((_DWORD *)this + 8) = 1;
  uint64_t v17 = *(void *)this;
  uint64_t v18 = *((void *)this + 1);
  *((void *)this + 1) = v18 + 1;
  *(_BYTE *)(v17 + v18) = 40;
LABEL_3:
  int v5 = *(unsigned __int16 *)(a1 + 9);
  __int16 v6 = (_WORD)v5 << 10;
  int v7 = (unsigned __int16)((_WORD)v5 << 10);
  int v8 = v5 << 26 >> 26;
  if (v7 == 17408) {
    int v9 = 15;
  }
  else {
    int v9 = v8;
  }
  if (*(void *)(a1 + 32) == 1LL && **(_BYTE **)(a1 + 24) == 44)
  {
    size_t v10 = 1LL;
  }

  else
  {
    *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 32;
    size_t v10 = *(void *)(a1 + 32);
    if (!v10) {
      goto LABEL_11;
    }
  }

  uint64_t v11 = *(const void **)(a1 + 24);
  memcpy((void *)(*(void *)this + *((void *)this + 1)), v11, v10);
  *((void *)this + 1) += v10;
LABEL_11:
  *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 32;
  if (v4)
  {
    --*((_DWORD *)this + 8);
    uint64_t v13 = *(void *)this;
    uint64_t v14 = *((void *)this + 1);
    *((void *)this + 1) = v14 + 1;
    *(_BYTE *)(v13 + v14) = 41;
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::Node::printAsOperand( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this, int a3, int a4)
{
  if (a4 + a3 <= (*(unsigned __int16 *)(a1 + 9) << 26 >> 26))
  {
    ++*((_DWORD *)this + 8);
    uint64_t v7 = *(void *)this;
    uint64_t v8 = *((void *)this + 1);
    *((void *)this + 1) = v8 + 1;
    *(_BYTE *)(v7 + v8) = 40;
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)a1 + 32LL))( a1,  this);
    if ((*(_WORD *)(a1 + 9) & 0xC0) != 0x40) {
      (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)a1 + 40LL))( a1,  this);
    }
    --*((_DWORD *)this + 8);
    uint64_t v9 = *(void *)this;
    uint64_t v10 = *((void *)this + 1);
    *((void *)this + 1) = v10 + 1;
    *(_BYTE *)(v9 + v10) = 41;
  }

  else
  {
    __n128 result = (void *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)a1 + 32LL))( a1,  this);
    if ((*(_WORD *)(a1 + 9) & 0xC0) != 0x40) {
      return (void *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)a1 + 40LL))( a1,  this);
    }
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::PrefixExpr::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v4 = *(void *)(a1 + 24);
  if (v4)
  {
    int v5 = *(const void **)(a1 + 16);
    memcpy((void *)(*(void *)this + *((void *)this + 1)), v5, v4);
    *((void *)this + 1) += v4;
  }
}

void *anonymous namespace'::itanium_demangle::PostfixExpr::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *a2)
{
  size_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    __int16 v6 = *(const void **)(a1 + 24);
    __n128 result = memcpy((void *)(*(void *)a2 + *((void *)a2 + 1)), v6, v5);
    *((void *)a2 + 1) += v5;
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::ArraySubscriptExpr::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *((void *)a2 + 1);
  *((void *)a2 + 1) = v5 + 1;
  *(_BYTE *)(v4 + v5) = 91;
  --*((_DWORD *)a2 + 8);
  uint64_t v7 = *(void *)a2;
  uint64_t v8 = *((void *)a2 + 1);
  *((void *)a2 + 1) = v8 + 1;
  *(_BYTE *)(v7 + v8) = 93;
  return result;
}

void *anonymous namespace'::itanium_demangle::MemberExpr::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *a2)
{
  size_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = *(const void **)(a1 + 24);
    memcpy((void *)(*(void *)a2 + *((void *)a2 + 1)), v5, v4);
    *((void *)a2 + 1) += v4;
  }
}

void *anonymous namespace'::itanium_demangle::NewExpr::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  if (*(_BYTE *)(a1 + 56))
  {
    *(_WORD *)(*(void *)this + *((void *)this + 1)) = 14906;
    *((void *)this + 1) += 2LL;
  }

  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(_BYTE *)(v4 + 2) = 119;
  *(_WORD *)uint64_t v4 = 25966;
  *((void *)this + 1) += 3LL;
  if (*(_BYTE *)(a1 + 57))
  {
    *(_WORD *)(*(void *)this + *((void *)this + 1)) = 23899;
    *((void *)this + 1) += 2LL;
  }

  if (*(void *)(a1 + 24))
  {
    ++*((_DWORD *)this + 8);
    uint64_t v5 = *(void *)this;
    uint64_t v6 = *((void *)this + 1);
    *((void *)this + 1) = v6 + 1;
    *(_BYTE *)(v5 + v6) = 40;
    --*((_DWORD *)this + 8);
    uint64_t v7 = *(void *)this;
    uint64_t v8 = *((void *)this + 1);
    *((void *)this + 1) = v8 + 1;
    *(_BYTE *)(v7 + v8) = 41;
  }

  *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 32;
  uint64_t v9 = *(void *)(a1 + 32);
  __n128 result = (void *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v9 + 32LL))( v9,  this);
  if ((*(_WORD *)(v9 + 9) & 0xC0) != 0x40) {
    __n128 result = (void *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v9 + 40LL))( v9,  this);
  }
  if (*(void *)(a1 + 48))
  {
    ++*((_DWORD *)this + 8);
    uint64_t v11 = *(void *)this;
    uint64_t v12 = *((void *)this + 1);
    *((void *)this + 1) = v12 + 1;
    *(_BYTE *)(v11 + v12) = 40;
    --*((_DWORD *)this + 8);
    uint64_t v13 = *(void *)this;
    uint64_t v14 = *((void *)this + 1);
    *((void *)this + 1) = v14 + 1;
    *(_BYTE *)(v13 + v14) = 41;
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::NodeArray::printWithComma( void *result, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  if (result[1])
  {
    int v3 = result;
    uint64_t v4 = 0LL;
    uint64_t v5 = *((void *)this + 1);
    char v6 = 1;
    do
    {
      uint64_t v7 = v5;
      if ((v6 & 1) == 0)
      {
        *(_WORD *)(*(void *)this + *((void *)this + 1)) = 8236;
        uint64_t v7 = *((void *)this + 1) + 2LL;
        *((void *)this + 1) = v7;
      }

      if (v7 == *((void *)this + 1))
      {
        *((void *)this + 1) = v5;
      }

      else
      {
        char v6 = 0;
        uint64_t v5 = *((void *)this + 1);
      }

      ++v4;
    }

    while (v4 != v3[1]);
  }

  return result;
}

uint64_t anonymous namespace'::itanium_demangle::DeleteExpr::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  if (*(_BYTE *)(a1 + 24))
  {
    *(_WORD *)(*(void *)this + *((void *)this + 1)) = 14906;
    *((void *)this + 1) += 2LL;
  }

  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(_WORD *)(v4 + 4) = 25972;
  *(_DWORD *)uint64_t v4 = 1701602660;
  *((void *)this + 1) += 6LL;
  if (*(_BYTE *)(a1 + 25))
  {
    *(_WORD *)(*(void *)this + *((void *)this + 1)) = 23899;
    *((void *)this + 1) += 2LL;
  }

  uint64_t v5 = *(void *)this;
  uint64_t v6 = *((void *)this + 1);
  *((void *)this + 1) = v6 + 1;
  *(_BYTE *)(v5 + v6) = 32;
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v7 + 32LL))( v7,  this);
  if ((*(_WORD *)(v7 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v7 + 40LL))( v7,  this);
  }
  return result;
}

void *anonymous namespace'::itanium_demangle::CallExpr::printLeft(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t))(*(void *)v4 + 32LL))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v4 + 40LL))(v4, a2);
  }
  ++*((_DWORD *)a2 + 8);
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  a2[1] = v6 + 1;
  *(_BYTE *)(v5 + v6) = 40;
  --*((_DWORD *)a2 + 8);
  uint64_t v8 = *a2;
  uint64_t v9 = a2[1];
  a2[1] = v9 + 1;
  *(_BYTE *)(v8 + v9) = 41;
  return result;
}

void *anonymous namespace'::itanium_demangle::ConversionExpr::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this;
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = v5 + 1;
  *(_BYTE *)(v4 + v5) = 40;
  uint64_t v6 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v6 + 32LL))( v6,  this);
  if ((*(_WORD *)(v6 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v6 + 40LL))( v6,  this);
  }
  --*((_DWORD *)this + 8);
  uint64_t v7 = *(void *)this;
  uint64_t v8 = *((void *)this + 1);
  *((void *)this + 1) = v8 + 1;
  *(_BYTE *)(v7 + v++*((_DWORD *)this + 8) = 41;
  ++*((_DWORD *)this + 8);
  uint64_t v9 = *(void *)this;
  uint64_t v10 = *((void *)this + 1);
  *((void *)this + 1) = v10 + 1;
  *(_BYTE *)(v9 + v10) = 40;
  --*((_DWORD *)this + 8);
  uint64_t v12 = *(void *)this;
  uint64_t v13 = *((void *)this + 1);
  *((void *)this + 1) = v13 + 1;
  *(_BYTE *)(v12 + v13) = 41;
  return result;
}

void *anonymous namespace'::itanium_demangle::ConditionalExpr::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *a2)
{
  uint64_t v4 = *(void *)a2 + *((void *)a2 + 1);
  *(_BYTE *)(v4 + 2) = 32;
  *(_WORD *)uint64_t v4 = 16160;
  *((void *)a2 + 1) += 3LL;
  uint64_t v5 = *(void *)a2 + *((void *)a2 + 1);
  *(_BYTE *)(v5 + 2) = 32;
  *(_WORD *)uint64_t v5 = 14880;
  *((void *)a2 + 1) += 3LL;
}

void *anonymous namespace'::itanium_demangle::CastExpr::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v4 = *(void *)(a1 + 24);
  if (v4)
  {
    uint64_t v5 = *(const void **)(a1 + 16);
    memcpy((void *)(*(void *)this + *((void *)this + 1)), v5, v4);
    *((void *)this + 1) += v4;
  }

  int v6 = *((_DWORD *)this + 8);
  *((_DWORD *)this + ++*((_DWORD *)this + 8) = 0;
  *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 60;
  (*(void (**)(void, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(**(void **)(a1 + 32) + 32LL))( *(void *)(a1 + 32),  this);
  *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 62;
  *((_DWORD *)this + ++*((_DWORD *)this + 8) = v6 + 1;
  uint64_t v7 = *(void *)this;
  uint64_t v8 = *((void *)this + 1);
  *((void *)this + 1) = v8 + 1;
  *(_BYTE *)(v7 + v++*((_DWORD *)this + 8) = 40;
  --*((_DWORD *)this + 8);
  uint64_t v10 = *(void *)this;
  uint64_t v11 = *((void *)this + 1);
  *((void *)this + 1) = v11 + 1;
  *(_BYTE *)(v10 + v11) = 41;
  return result;
}

void sub_180417060(_Unwind_Exception *a1)
{
  *(_DWORD *)(v1 + 32) = v2;
  _Unwind_Resume(a1);
}

void *anonymous namespace'::itanium_demangle::EnclosingExpr::printLeft( void *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v4 = a1[3];
  if (v4)
  {
    uint64_t v5 = (const void *)a1[2];
    memcpy((void *)(*(void *)this + *((void *)this + 1)), v5, v4);
    *((void *)this + 1) += v4;
  }

  ++*((_DWORD *)this + 8);
  uint64_t v6 = *(void *)this;
  uint64_t v7 = *((void *)this + 1);
  *((void *)this + 1) = v7 + 1;
  *(_BYTE *)(v6 + v7) = 40;
  uint64_t v8 = a1[4];
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v8 + 32LL))( v8,  this);
  if ((*(_WORD *)(v8 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v8 + 40LL))( v8,  this);
  }
  --*((_DWORD *)this + 8);
  uint64_t v10 = *(void *)this;
  uint64_t v11 = *((void *)this + 1);
  *((void *)this + 1) = v11 + 1;
  *(_BYTE *)(v10 + v11) = 41;
  size_t v12 = a1[6];
  if (v12)
  {
    uint64_t v13 = (const void *)a1[5];
    uint64_t result = memcpy((void *)(*(void *)this + *((void *)this + 1)), v13, v12);
    *((void *)this + 1) += v12;
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseIntegerLiteral( uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!v7) {
    return 0LL;
  }
  uint64_t v8 = *(char **)a1;
  if (*(void *)a1 == *(void *)(a1 + 8) || *v8 != 69) {
    return 0LL;
  }
  uint64_t v9 = v6;
  uint64_t v10 = v7;
  *(void *)a1 = v8 + 1;
  *((_BYTE *)result + ++*((_DWORD *)this + 8) = 77;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
  *uint64_t result = off_189658B10;
  result[2] = a2;
  result[3] = a3;
  result[4] = v9;
  result[5] = v10;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::BoolExpr,int>( uint64_t a1, _DWORD *a2)
{
  BOOL v4 = *a2 != 0;
  *((_BYTE *)result + ++*((_DWORD *)this + 8) = 73;
  *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
  *uint64_t result = off_189658B80;
  *((_BYTE *)result + 11) = v4;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,char const(&)[8]>( uint64_t a1, const char *a2)
{
  size_t v4 = strlen(a2);
  *((_BYTE *)v3 + ++*((_DWORD *)this + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x540;
  *int v3 = off_1896580A0;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseUnnamedTypeName( char **a1, uint64_t a2)
{
  if (a2) {
    a1[84] = a1[83];
  }
  int v3 = *a1;
  switch(*(_WORD *)v3)
  {
    case 0x7455:
      *a1 = v3 + 2;
      uint64_t v9 = *a1;
      if (*a1 != a1[1] && *v9 == 95)
      {
        uint64_t v10 = v7;
        uint64_t v11 = v8;
        *a1 = v9 + 1;
        *((_BYTE *)v4 + ++*((_DWORD *)this + 8) = 51;
        *(_WORD *)((char *)v4 + 9) = *(_WORD *)((_BYTE *)v4 + 9) & 0xF000 | 0x540;
        *size_t v4 = off_189658DB0;
        v4[2] = v10;
        v4[3] = v11;
        return v4;
      }

      return 0LL;
    case 0x6C55:
      *a1 = v3 + 2;
      size_t v12 = (unsigned __int8 *)a1[98];
      a1[98] = (char *)((a1[84] - a1[83]) >> 3);
      uint64_t v13 = (unsigned __int8 *)a1[2];
      uint64_t v14 = (unsigned __int8 *)a1[3];
      {
        if (!v46.n128_u64[0]) {
          goto LABEL_43;
        }
      }

      unint64_t v28 = (v14 - v13) >> 3;
      v46.n128_u64[1] = v29;
      if (!v29)
      {
        uint64_t v30 = (unsigned __int8 *)a1[84];
        if (v30 == (unsigned __int8 *)a1[83]) {
          abort_message( "%s:%d: %s",  0LL,  v22,  v23,  v24,  v25,  v26,  v27,  (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/ItaniumDemangle.h");
        }
        a1[84] = (char *)(v30 - 8);
      }

      uint64_t v45 = 0LL;
      uint64_t v31 = *a1;
      uint64_t v32 = (unsigned __int8 *)a1[1];
      if (*a1 == (char *)v32)
      {
LABEL_28:
        while (1)
        {
          if (!(void)v44) {
            goto LABEL_43;
          }
          if (a1[1] == *a1)
          {
            int v35 = 0;
          }

          else
          {
            int v35 = **a1;
            if (v35 == 69) {
              goto LABEL_34;
            }
          }

          if (v35 == 81) {
            goto LABEL_34;
          }
        }
      }

      if (*v31 == 81)
      {
        *a1 = v31 + 1;
        char v33 = *((_BYTE *)a1 + 778);
        *((_BYTE *)a1 + 77++*((_DWORD *)this + 8) = 1;
        *((_BYTE *)a1 + 77++*((_DWORD *)this + 8) = v33;
        uint64_t v45 = v34;
        if (!v34) {
          goto LABEL_43;
        }
        uint64_t v31 = *a1;
        uint64_t v32 = (unsigned __int8 *)a1[1];
      }

      *a1 = v31 + 1;
LABEL_34:
      *((void *)&v44 + 1) = v21;
      uint64_t v43 = 0LL;
      int v36 = *a1;
      uint64_t v37 = (unsigned __int8 *)a1[1];
      if (*v36 == 81)
      {
        *a1 = v36 + 1;
        char v38 = *((_BYTE *)a1 + 778);
        *((_BYTE *)a1 + 77++*((_DWORD *)this + 8) = 1;
        *((_BYTE *)a1 + 77++*((_DWORD *)this + 8) = v38;
        uint64_t v43 = v39;
        if (!v39) {
          goto LABEL_43;
        }
        int v36 = *a1;
        uint64_t v37 = (unsigned __int8 *)a1[1];
      }

      if (v36 != (char *)v37 && *v36 == 69)
      {
        *a1 = v36 + 1;
        *((void *)&v42 + 1) = v21;
        unint64_t v40 = *a1;
        if (*a1 != a1[1] && *v40 == 95)
        {
          *a1 = v40 + 1;
          size_t v4 = v41;
LABEL_44:
          a1[98] = (char *)v12;
          return v4;
        }
      }

LABEL_43:
      size_t v4 = 0LL;
      goto LABEL_44;
    case 0x6255:
      *a1 = v3 + 2;
      uint64_t v6 = *a1;
      if (*a1 != a1[1] && *v6 == 95)
      {
        *a1 = v6 + 1;
        *((_BYTE *)v4 + ++*((_DWORD *)this + 8) = 8;
        *(_WORD *)((char *)v4 + 9) = *(_WORD *)((_BYTE *)v4 + 9) & 0xF000 | 0x540;
        *size_t v4 = off_1896580A0;
        v4[2] = "'block-literal'";
        v4[3] = 15LL;
        return v4;
      }

      break;
  }

  return 0LL;
}

void sub_180417700( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, ...)
{
  *(_BYTE *)(v19 + 77++*((_DWORD *)this + 8) = v20;
  *(void *)(v19 + 784) = v21;
  _Unwind_Resume(a1);
}

void *anonymous namespace'::itanium_demangle::IntegerLiteral::printLeft( void *result, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  int v3 = result;
  if (result[3] >= 4uLL)
  {
    ++*((_DWORD *)this + 8);
    uint64_t v4 = *(void *)this;
    uint64_t v5 = *((void *)this + 1);
    *((void *)this + 1) = v5 + 1;
    *(_BYTE *)(v4 + v5) = 40;
    size_t v6 = v3[3];
    if (v6)
    {
      uint64_t v7 = (const void *)v3[2];
      memcpy((void *)(*(void *)this + *((void *)this + 1)), v7, v6);
      *((void *)this + 1) += v6;
    }

    --*((_DWORD *)this + 8);
    uint64_t v8 = *(void *)this;
    uint64_t v9 = *((void *)this + 1);
    *((void *)this + 1) = v9 + 1;
    *(_BYTE *)(v8 + v9) = 41;
  }

  uint64_t v10 = (_BYTE *)v3[4];
  if (*v10 == 110)
  {
    uint64_t v11 = *(void *)this;
    uint64_t v13 = (void *)((char *)this + 8);
    uint64_t v12 = *((void *)this + 1);
    *((void *)this + 1) = v12 + 1;
    *(_BYTE *)(v11 + v12) = 45;
    uint64_t v14 = v3[5];
    size_t v15 = v14 - 1;
    if (v14 == 1) {
      goto LABEL_11;
    }
    uint64_t v10 = (_BYTE *)(v3[4] + 1LL);
    uint64_t v16 = *(void *)this;
    uint64_t v17 = *((void *)this + 1);
  }

  else
  {
    size_t v15 = v3[5];
    if (!v15) {
      goto LABEL_11;
    }
    uint64_t v16 = *(void *)this;
    uint64_t v13 = (void *)((char *)this + 8);
    uint64_t v17 = *((void *)this + 1);
  }

  uint64_t result = memcpy((void *)(v16 + v17), v10, v15);
  *v13 += v15;
LABEL_11:
  size_t v18 = v3[3];
  if (v18 - 4 >= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v19 = (const void *)v3[2];
    uint64_t result = memcpy((void *)(*(void *)this + *((void *)this + 1)), v19, v18);
    *((void *)this + 1) += v18;
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::BoolExpr::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  if (*(_BYTE *)(a1 + 11)) {
    size_t v3 = 4LL;
  }
  else {
    size_t v3 = 5LL;
  }
  if (*(_BYTE *)(a1 + 11)) {
    uint64_t v4 = "true";
  }
  else {
    uint64_t v4 = "false";
  }
  uint64_t result = memcpy((void *)(*(void *)this + *((void *)this + 1)), v4, v3);
  *((void *)this + 1) += v3;
  return result;
}

void *anonymous namespace'::itanium_demangle::FloatLiteralImpl<float>::printLeft(void *result, void *a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (*((void *)result + 3) >= 8uLL)
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = *((void *)result + 2);
    uint64_t v5 = v16;
    uint64_t v6 = MEMORY[0x1895F8770];
    do
    {
      uint64_t v7 = *(unsigned __int8 *)(v4 + v3);
      else {
        char v8 = -87;
      }
      uint64_t v9 = *(unsigned __int8 *)(v4 + v3 + 1);
      else {
        char v10 = -87;
      }
      *++uint64_t v5 = v9 + v10 + 16 * (v7 + v8);
      v3 += 2LL;
    }

    while (v3 != 8);
    if (v5 > &v16[1])
    {
      uint64_t v11 = &v16[2];
      do
      {
        char v12 = *(v11 - 1);
        *(v11 - 1) = *v5;
        *v5-- = v12;
      }

      while (v11++ < v5);
    }

    *(void *)__str = 0LL;
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
    uint64_t result = (void *)snprintf(__str, 0x18uLL, "%af", *(float *)&v16[1]);
    if ((_DWORD)result)
    {
      int v14 = (int)result;
      size_t v15 = (int)result;
      uint64_t result = memcpy((void *)(*a2 + a2[1]), __str, v15);
      a2[1] += v14;
    }
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::FloatLiteralImpl<double>::printLeft(void *result, void *a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (*((void *)result + 3) >= 0x10uLL)
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = *((void *)result + 2);
    uint64_t v5 = (char *)&v16 + 7;
    uint64_t v6 = MEMORY[0x1895F8770];
    do
    {
      uint64_t v7 = *(unsigned __int8 *)(v4 + v3);
      else {
        char v8 = -87;
      }
      uint64_t v9 = *(unsigned __int8 *)(v4 + v3 + 1);
      else {
        char v10 = -87;
      }
      *++uint64_t v5 = v9 + v10 + 16 * (v7 + v8);
      v3 += 2LL;
    }

    while (v3 != 16);
    if (v5 > (char *)&v17)
    {
      uint64_t v11 = (char *)&v17 + 1;
      do
      {
        char v12 = *(v11 - 1);
        *(v11 - 1) = *v5;
        *v5-- = v12;
      }

      while (v11++ < v5);
    }

    *(_OWORD *)__str = 0u;
    __int128 v19 = 0u;
    uint64_t result = (void *)snprintf(__str, 0x20uLL, "%a", v17);
    if ((_DWORD)result)
    {
      int v14 = (int)result;
      size_t v15 = (int)result;
      uint64_t result = memcpy((void *)(*a2 + a2[1]), __str, v15);
      a2[1] += v14;
    }
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::FloatLiteralImpl<long double>::printLeft( void *result, void *a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (*((void *)result + 3) >= 0x20uLL)
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = *((void *)result + 2);
    uint64_t v5 = (char *)&v16 + 7;
    uint64_t v6 = MEMORY[0x1895F8770];
    do
    {
      uint64_t v7 = *(unsigned __int8 *)(v4 + v3);
      else {
        char v8 = -87;
      }
      uint64_t v9 = *(unsigned __int8 *)(v4 + v3 + 1);
      else {
        char v10 = -87;
      }
      *++uint64_t v5 = v9 + v10 + 16 * (v7 + v8);
      v3 += 2LL;
    }

    while (v3 != 32);
    if (v5 > (char *)&v17)
    {
      uint64_t v11 = (char *)&v17 + 1;
      do
      {
        char v12 = *(v11 - 1);
        *(v11 - 1) = *v5;
        *v5-- = v12;
      }

      while (v11++ < v5);
    }

    *(_OWORD *)__str = 0u;
    memset(v19, 0, sizeof(v19));
    uint64_t result = (void *)snprintf(__str, 0x2AuLL, "%LaL", v17);
    if ((_DWORD)result)
    {
      int v14 = (int)result;
      size_t v15 = (int)result;
      uint64_t result = memcpy((void *)(*a2 + a2[1]), __str, v15);
      a2[1] += v14;
    }
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::StringLiteral::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  *(_WORD *)(*(void *)this + *((void *)this + 1)) = 15394;
  *((void *)this + 1) += 2LL;
  uint64_t v4 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v4 + 32LL))( v4,  this);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v4 + 40LL))( v4,  this);
  }
  *(_WORD *)(*(void *)this + *((void *)this + 1)) = 8766;
  *((void *)this + 1) += 2LL;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::ScopedTemplateParamList::ScopedTemplateParamList( uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (uint64_t)(*(void *)(a2 + 672) - *(void *)(a2 + 664)) >> 3;
  *(void *)a1 = a2;
  *(void *)(a1 + ++*((_DWORD *)this + 8) = v3;
  *(_OWORD *)(a1 + 40) = 0u;
  *(void *)(a1 + 16) = a1 + 40;
  *(void *)(a1 + qmemcpy((void *)(*(void *)this + *((void *)this + 1)), "construction vtable for ", 24) = a1 + 40;
  *(void *)(a1 + 32) = a1 + 104;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 8++*((_DWORD *)this + 8) = 0u;
  uint64_t v5 = a1 + 16;
  return a1;
}

void sub_180417F2C(_Unwind_Exception *exception_object)
{
  if (*v2 != v1) {
    free(*v2);
  }
  _Unwind_Resume(exception_object);
}

BOOL anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::isTemplateParamDecl( uint64_t a1)
{
  uint64_t v1 = *(_BYTE **)a1;
  unint64_t v2 = *(void *)(a1 + 8) - *(void *)a1;
  if (!v2 || *v1 != 84) {
    return 0LL;
  }
  if (v2 < 2) {
    int v3 = 0;
  }
  else {
    int v3 = (char)v1[1];
  }
  uint64_t v5 = memchr("yptnk", v3, 5uLL);
  if (v5) {
    BOOL v6 = v5 - "yptnk" == -1;
  }
  else {
    BOOL v6 = 1;
  }
  return !v6;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseTemplateParamDecl( uint64_t a1, void *a2)
{
  unint64_t v2 = *(_WORD **)a1;
  if (*(void *)(a1 + 8) - *(void *)a1 < 2uLL) {
    return 0LL;
  }
  if (*v2 == 31060)
  {
    *(void *)a1 = v2 + 1;
    int v8 = *(_DWORD *)(a1 + 792);
    *(_DWORD *)(a1 + 792) = v8 + 1;
    uint64_t v9 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 808);
    *((_BYTE *)v10 + ++*((_DWORD *)this + 8) = 33;
    *(_WORD *)((char *)v10 + 9) = *(_WORD *)((_BYTE *)v10 + 9) & 0xF000 | 0x540;
    *char v10 = off_189658E20;
    *((_DWORD *)v10 + 3) = 0;
    *((_DWORD *)v10 + 4) = v8;
    v39[0] = (uint64_t)v10;
    if (a2) {
    *((_BYTE *)v3 + ++*((_DWORD *)this + 8) = 35;
    }
    *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x500;
    *int v3 = off_189658E90;
    v3[2] = v10;
  }

  else if (*v2 == 27476)
  {
    *(void *)a1 = v2 + 1;
    if (!v11) {
      return 0LL;
    }
    uint64_t v12 = v11;
    int v13 = *(_DWORD *)(a1 + 792);
    *(_DWORD *)(a1 + 792) = v13 + 1;
    int v14 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 808);
    *((_BYTE *)v15 + ++*((_DWORD *)this + 8) = 33;
    *(_WORD *)((char *)v15 + 9) = *(_WORD *)((_BYTE *)v15 + 9) & 0xF000 | 0x540;
    *size_t v15 = off_189658E20;
    *((_DWORD *)v15 + 3) = 0;
    *((_DWORD *)v15 + 4) = v13;
    v39[0] = (uint64_t)v15;
    if (a2) {
    *((_BYTE *)v3 + ++*((_DWORD *)this + 8) = 36;
    }
    *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x500;
    *int v3 = off_189658F00;
    v3[2] = v12;
    v3[3] = v15;
  }

  else
  {
    if (*v2 == 28244)
    {
      *(void *)a1 = v2 + 1;
      int v16 = *(_DWORD *)(a1 + 796);
      *(_DWORD *)(a1 + 796) = v16 + 1;
      *((_BYTE *)v17 + ++*((_DWORD *)this + 8) = 33;
      *(_WORD *)((char *)v17 + 9) = *(_WORD *)((_BYTE *)v17 + 9) & 0xF000 | 0x540;
      *long double v17 = off_189658E20;
      *((_DWORD *)v17 + 3) = 1;
      *((_DWORD *)v17 + 4) = v16;
      v39[0] = (uint64_t)v17;
      if (a2) {
      if (v18)
      }
      {
        uint64_t v19 = v18;
        *((_BYTE *)v3 + ++*((_DWORD *)this + 8) = 37;
        *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x500;
        *int v3 = off_189658F70;
        v3[2] = v17;
        v3[3] = v19;
        return v3;
      }

      return 0LL;
    }

    if (*v2 != 29780)
    {
      if (*v2 == 28756)
      {
        *(void *)a1 = v2 + 1;
        if (v6)
        {
          uint64_t v7 = v6;
          *((_BYTE *)v3 + ++*((_DWORD *)this + 8) = 39;
          *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x500;
          *int v3 = off_189659050;
          v3[2] = v7;
          return v3;
        }
      }

      return 0LL;
    }

    *(void *)a1 = v2 + 1;
    int v20 = *(_DWORD *)(a1 + 800);
    *(_DWORD *)(a1 + 800) = v20 + 1;
    *((_BYTE *)v21 + ++*((_DWORD *)this + 8) = 33;
    *(_WORD *)((char *)v21 + 9) = *(_WORD *)((_BYTE *)v21 + 9) & 0xF000 | 0x540;
    *uint64_t v21 = off_189658E20;
    *((_DWORD *)v21 + 3) = 2;
    *((_DWORD *)v21 + 4) = v20;
    v39[0] = (uint64_t)v21;
    if (a2) {
    unint64_t v22 = (uint64_t)(*(void *)(a1 + 24) - *(void *)(a1 + 16)) >> 3;
    }
    unint64_t v29 = *(_BYTE **)a1;
    uint64_t v30 = *(_BYTE **)(a1 + 8);
    do
    {
      if (v29 != v30 && *v29 == 69)
      {
        uint64_t v33 = 0LL;
        goto LABEL_34;
      }

      if (!v38) {
        goto LABEL_32;
      }
      unint64_t v29 = *(_BYTE **)a1;
      uint64_t v30 = *(_BYTE **)(a1 + 8);
    }

    while (*(_BYTE **)a1 == v30 || *v29 != 81);
    *(void *)a1 = v29 + 1;
    char v32 = *(_BYTE *)(a1 + 778);
    *(_BYTE *)(a1 + 77++*((_DWORD *)this + 8) = 1;
    *(_BYTE *)(a1 + 77++*((_DWORD *)this + 8) = v32;
    if (!v33 || (unint64_t v29 = *(_BYTE **)a1, *(void *)a1 == *(void *)(a1 + 8)) || *v29 != 69)
    {
LABEL_32:
      int v3 = 0LL;
      goto LABEL_35;
    }

LABEL_34:
    *(void *)a1 = v29 + 1;
    uint64_t v36 = v35;
    *((_BYTE *)v3 + ++*((_DWORD *)this + 8) = 38;
    *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x500;
    *int v3 = off_189658FE0;
    v3[2] = v21;
    v3[3] = v34;
    v3[4] = v36;
    v3[5] = v33;
LABEL_35:
  }

  return v3;
}

void sub_18041846C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  *(_BYTE *)(v9 + 77++*((_DWORD *)this + 8) = v10;
  _Unwind_Resume(a1);
}

__n128 anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::ClosureTypeName,anonymous namespace'::itanium_demangle::NodeArray &,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::NodeArray &,anonymous namespace'::itanium_demangle::Node *&,std::string_view &>( uint64_t a1, __n128 *a2, uint64_t *a3, __int128 *a4, uint64_t *a5, __int128 *a6)
{
  uint64_t v12 = *a3;
  *((_BYTE *)v11 + ++*((_DWORD *)this + 8) = 52;
  __int16 v13 = *(_WORD *)((_BYTE *)v11 + 9) & 0xF000 | 0x540;
  uint64_t v14 = *a5;
  *uint64_t v11 = off_1896590C0;
  __n128 result = *a2;
  __int128 v16 = *a4;
  __int128 v17 = *a6;
  *(_WORD *)((char *)v11 + 9) = v13;
  *((__n128 *)v11 + 1) = result;
  v11[4] = v12;
  *(_OWORD *)(v11 + 5) = v16;
  v11[7] = v14;
  *((_OWORD *)v11 + 4) = v17;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::ScopedTemplateParamList::~ScopedTemplateParamList( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = a1[1];
  uint64_t v9 = *(void *)(*a1 + 664LL);
  if (v8 > (*(void *)(*a1 + 672LL) - v9) >> 3) {
    abort_message( "%s:%d: %s",  a2,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/ItaniumDemangle.h");
  }
  *(void *)(*a1 + 672LL) = v9 + 8 * v8;
  uint64_t v11 = (void *)a1[2];
  if (v11 != a1 + 5) {
    free(v11);
  }
  return a1;
}

void *anonymous namespace'::itanium_demangle::UnnamedTypeName::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  *(void *)(*(void *)this + *((void *)this + 1)) = 0x64656D616E6E7527LL;
  *((void *)this + 1) += 8LL;
  size_t v4 = *(void *)(a1 + 24);
  if (v4)
  {
    uint64_t v5 = *(const void **)(a1 + 16);
    memcpy((void *)(*(void *)this + *((void *)this + 1)), v5, v4);
    *((void *)this + 1) += v4;
  }

  *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 39;
  return result;
}

void *anonymous namespace'::itanium_demangle::PODSmallVector<anonymous namespace'::itanium_demangle::Node *,8ul>::push_back( void *result, uint64_t *__size)
{
  int v3 = result;
  size_t v4 = (void *)result[1];
  if (v4 == (void *)result[2])
  {
    uint64_t v5 = (void *)*result;
    int64_t v6 = (int64_t)v4 - *result;
    if ((void *)*result == result + 3)
    {
      __n128 result = malloc(2 * v6);
      if (!result) {
        goto LABEL_11;
      }
      uint64_t v7 = result;
      if (v4 != v5) {
        __n128 result = memmove(result, v5, v6);
      }
      *int v3 = v7;
    }

    else
    {
      __n128 result = realloc((void *)*result, 2 * v6);
      uint64_t v7 = result;
      *int v3 = result;
      if (!result) {
LABEL_11:
      }
        abort();
    }

    size_t v4 = &v7[v6 >> 3];
    v3[1] = v4;
    v3[2] = &v7[v6 >> 2];
  }

  uint64_t v8 = *__size;
  v3[1] = v4 + 1;
  *size_t v4 = v8;
  return result;
}

_DWORD *anonymous namespace'::itanium_demangle::SyntheticTemplateParamName::printLeft( _DWORD *result, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  int v3 = result;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  int v4 = result[3];
  if (v4 == 2)
  {
    uint64_t v5 = 3LL;
    uint64_t v7 = (void *)((char *)this + 8);
    uint64_t v10 = *(void *)this + *((void *)this + 1);
    *(_BYTE *)(v10 + 2) = 84;
    *(_WORD *)uint64_t v10 = 21540;
  }

  else
  {
    if (v4 == 1)
    {
      uint64_t v5 = 2LL;
      uint64_t v6 = *(void *)this;
      uint64_t v7 = (void *)((char *)this + 8);
      uint64_t v8 = *((void *)this + 1);
      __int16 v9 = 20004;
    }

    else
    {
      if (v4) {
        goto LABEL_9;
      }
      uint64_t v5 = 2LL;
      uint64_t v6 = *(void *)this;
      uint64_t v7 = (void *)((char *)this + 8);
      uint64_t v8 = *((void *)this + 1);
      __int16 v9 = 21540;
    }

    *(_WORD *)(v6 + v++*((_DWORD *)this + 8) = v9;
  }

  *v7 += v5;
LABEL_9:
  int v11 = v3[4];
  if (v11)
  {
    uint64_t v12 = 0LL;
    unint64_t v13 = (v11 - 1);
    do
    {
      v16[v12-- + 20] = (v13 % 0xA) | 0x30;
      BOOL v14 = v13 >= 9;
      BOOL v15 = v13 == 9;
      v13 /= 0xAuLL;
    }

    while (!v15 && v14);
    if (v12)
    {
      __n128 result = memcpy((void *)(*(void *)this + *((void *)this + 1)), &v16[v12 + 21], -v12);
      *((void *)this + 1) -= v12;
    }
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::TypeTemplateParamDecl::printLeft( int a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v4 = *(void *)"typename ";
  *(_BYTE *)(v4 + ++*((_DWORD *)this + 8) = 32;
  *((void *)this + 1) += 9LL;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::TypeTemplateParamDecl::printRight(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 32LL))(v3);
  if ((*(_WORD *)(v3 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v3 + 40LL))(v3, a2);
  }
  return result;
}

void *anonymous namespace'::itanium_demangle::ConstrainedTypeTemplateParamDecl::printLeft( uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t))(*(void *)v3 + 32LL))(v3);
  if ((*(_WORD *)(v3 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, void *))(*(void *)v3 + 40LL))(v3, a2);
  }
  *(_BYTE *)(*a2 + a2[1]++) = 32;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::ConstrainedTypeTemplateParamDecl::printRight( uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 32LL))(v3);
  if ((*(_WORD *)(v3 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v3 + 40LL))(v3, a2);
  }
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::NonTypeTemplateParamDecl::printLeft(uint64_t a1, void *a2)
{
  uint64_t result = *(void *)(a1 + 24);
  unsigned int v5 = *(unsigned __int8 *)(result + 9);
  if ((v5 & 0xC0) != 0x80)
  {
    if (v5 < 0x40) {
      return result;
    }
    goto LABEL_5;
  }

  uint64_t result = (**(uint64_t (***)(uint64_t, void *))result)(result, a2);
  if ((result & 1) == 0)
  {
LABEL_5:
    *(_BYTE *)(*a2 + a2[1]++) = 32;
  }

  return result;
}

uint64_t anonymous namespace'::itanium_demangle::NonTypeTemplateParamDecl::printRight( uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t))(*(void *)v4 + 32LL))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)v4 + 40LL))(v4, a2);
  }
  return (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40LL))(*(void *)(a1 + 24), a2);
}

void *anonymous namespace'::itanium_demangle::TemplateTemplateParamDecl::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  int v4 = *((_DWORD *)this + 8);
  *((_DWORD *)this + ++*((_DWORD *)this + 8) = 0;
  uint64_t v5 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v5 = *(void *)"template<";
  *(_BYTE *)(v5 + ++*((_DWORD *)this + 8) = 60;
  *((void *)this + 1) += 9LL;
  uint64_t v7 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v7 = *(void *)"> typename ";
  *(_DWORD *)(v7 + 7) = 543518049;
  *((void *)this + 1) += 11LL;
  *((_DWORD *)this + ++*((_DWORD *)this + 8) = v4;
  return result;
}

void sub_180418C04(_Unwind_Exception *a1)
{
  *(_DWORD *)(v1 + 32) = v2;
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::itanium_demangle::TemplateTemplateParamDecl::printRight( uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 32LL))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40) {
    uint64_t result = (*(uint64_t (**)(uint64_t, void *))(*(void *)v4 + 40LL))(v4, a2);
  }
  if (*(void *)(a1 + 40))
  {
    uint64_t v6 = *a2 + a2[1];
    *(void *)uint64_t v6 = *(void *)" requires ";
    *(_WORD *)(v6 + ++*((_DWORD *)this + 8) = 8307;
    a2[1] += 10LL;
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t result = (*(uint64_t (**)(uint64_t, void *))(*(void *)v7 + 32LL))(v7, a2);
    if ((*(_WORD *)(v7 + 9) & 0xC0) != 0x40) {
      return (*(uint64_t (**)(uint64_t, void *))(*(void *)v7 + 40LL))(v7, a2);
    }
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::TemplateParamPackDecl::printLeft(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2 + a2[1];
  *(_BYTE *)(v4 + 2) = 46;
  *(_WORD *)uint64_t v4 = 11822;
  a2[1] += 3LL;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::TemplateParamPackDecl::printRight(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 40LL))(*(void *)(a1 + 16));
}

void *anonymous namespace'::itanium_demangle::ClosureTypeName::printLeft( void *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = (_DWORD *)(*(void *)this + *((void *)this + 1));
  *(_DWORD *)((char *)v4 + 3) = 1633968749;
  *uint64_t v4 = 1835101223;
  *((void *)this + 1) += 7LL;
  size_t v5 = a1[9];
  if (v5)
  {
    uint64_t v6 = (const void *)a1[8];
    memcpy((void *)(*(void *)this + *((void *)this + 1)), v6, v5);
    *((void *)this + 1) += v5;
  }

  *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 39;
}

void *anonymous namespace'::itanium_demangle::ClosureTypeName::printDeclarator( void *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  if (a1[3])
  {
    int v4 = *((_DWORD *)this + 8);
    *((_DWORD *)this + ++*((_DWORD *)this + 8) = 0;
    *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 60;
    *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 62;
    *((_DWORD *)this + ++*((_DWORD *)this + 8) = v4;
  }

  if (a1[4])
  {
    uint64_t v5 = *(void *)this + *((void *)this + 1);
    *(void *)uint64_t v5 = *(void *)" requires ";
    *(_WORD *)(v5 + ++*((_DWORD *)this + 8) = 8307;
    *((void *)this + 1) += 10LL;
    uint64_t v6 = a1[4];
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v6 + 32LL))( v6,  this);
    if ((*(_WORD *)(v6 + 9) & 0xC0) != 0x40) {
      (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v6 + 40LL))( v6,  this);
    }
    *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 32;
  }

  ++*((_DWORD *)this + 8);
  uint64_t v7 = *(void *)this;
  uint64_t v8 = *((void *)this + 1);
  *((void *)this + 1) = v8 + 1;
  *(_BYTE *)(v7 + v++*((_DWORD *)this + 8) = 40;
  --*((_DWORD *)this + 8);
  uint64_t v10 = *(void *)this;
  uint64_t v11 = *((void *)this + 1);
  *((void *)this + 1) = v11 + 1;
  *(_BYTE *)(v10 + v11) = 41;
  if (a1[7])
  {
    uint64_t v12 = *(void *)this + *((void *)this + 1);
    *(void *)uint64_t v12 = *(void *)" requires ";
    *(_WORD *)(v12 + ++*((_DWORD *)this + 8) = 8307;
    *((void *)this + 1) += 10LL;
    uint64_t v13 = a1[7];
    uint64_t result = (void *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v13 + 32LL))( v13,  this);
    if ((*(_WORD *)(v13 + 9) & 0xC0) != 0x40) {
      return (void *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v13 + 40LL))( v13,  this);
    }
  }

  return result;
}

void sub_180419050(_Unwind_Exception *a1)
{
  *(_DWORD *)(v1 + 32) = v2;
  _Unwind_Resume(a1);
}

void *anonymous namespace'::itanium_demangle::LambdaExpr::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  *(_WORD *)(*(void *)this + *((void *)this + 1)) = 23899;
  *((void *)this + 1) += 2LL;
  uint64_t v4 = *(void *)(a1 + 16);
  if (*(_BYTE *)(v4 + 8) == 52) {
  uint64_t v6 = *(void *)this + *((void *)this + 1);
  }
  *(_BYTE *)(v6 + 4) = 125;
  *(_DWORD *)uint64_t v6 = 774778491;
  *((void *)this + 1) += 5LL;
  return result;
}

void *anonymous namespace'::itanium_demangle::EnumLiteral::printLeft( void *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this;
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = v5 + 1;
  *(_BYTE *)(v4 + v5) = 40;
  uint64_t v6 = a1[2];
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v6 + 32LL))( v6,  this);
  if ((*(_WORD *)(v6 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v6 + 40LL))( v6,  this);
  }
  --*((_DWORD *)this + 8);
  uint64_t v8 = *(void *)this;
  uint64_t v9 = *((void *)this + 1);
  *((void *)this + 1) = v9 + 1;
  *(_BYTE *)(v8 + v9) = 41;
  uint64_t v10 = (_BYTE *)a1[3];
  if (*v10 == 110)
  {
    uint64_t v11 = *(void *)this;
    uint64_t v12 = *((void *)this + 1);
    *((void *)this + 1) = v12 + 1;
    *(_BYTE *)(v11 + v12) = 45;
    uint64_t v13 = a1[4];
    size_t v14 = v13 - 1;
    if (v13 == 1) {
      return result;
    }
    uint64_t v15 = a1[3] + 1LL;
    __int128 v16 = (void *)(*(void *)this + *((void *)this + 1));
    uint64_t v17 = (const void *)v15;
  }

  else
  {
    size_t v14 = a1[4];
    if (!v14) {
      return result;
    }
    __int128 v16 = (void *)(*(void *)this + *((void *)this + 1));
    uint64_t v17 = v10;
  }

  uint64_t result = memcpy(v16, v17, v14);
  *((void *)this + 1) += v14;
  return result;
}

void *anonymous namespace'::itanium_demangle::FunctionParam::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  *(_WORD *)(*(void *)this + *((void *)this + 1)) = 28774;
  *((void *)this + 1) += 2LL;
  size_t v5 = *(void *)(a1 + 24);
  if (v5)
  {
    uint64_t v6 = *(const void **)(a1 + 16);
    uint64_t result = memcpy((void *)(*(void *)this + *((void *)this + 1)), v6, v5);
    *((void *)this + 1) += v5;
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::FoldExpr::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this;
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = v5 + 1;
  *(_BYTE *)(v4 + v5) = 40;
  if (*(_BYTE *)(a1 + 48))
  {
    uint64_t v6 = *(void *)(a1 + 24);
    if (!v6) {
      goto LABEL_8;
    }
  }

  else
  {
    ++*((_DWORD *)this + 8);
    uint64_t v7 = *(void *)this;
    uint64_t v8 = *((void *)this + 1);
    *((void *)this + 1) = v8 + 1;
    *(_BYTE *)(v7 + v++*((_DWORD *)this + 8) = 40;
    uint64_t v9 = *(void *)(a1 + 16);
    char v26 = 42;
    __int16 v27 = 1344;
    uint64_t v25 = off_1896592F0;
    uint64_t v28 = v9;
    --*((_DWORD *)this + 8);
    uint64_t v10 = *(void *)this;
    uint64_t v11 = *((void *)this + 1);
    *((void *)this + 1) = v11 + 1;
    *(_BYTE *)(v10 + v11) = 41;
  }

  *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 32;
  size_t v12 = *(void *)(a1 + 40);
  if (v12)
  {
    uint64_t v13 = *(const void **)(a1 + 32);
    memcpy((void *)(*(void *)this + *((void *)this + 1)), v13, v12);
    *((void *)this + 1) += v12;
  }

  *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 32;
LABEL_8:
  uint64_t v14 = *(void *)this + *((void *)this + 1);
  *(_BYTE *)(v14 + 2) = 46;
  *(_WORD *)uint64_t v14 = 11822;
  *((void *)this + 1) += 3LL;
  if (*(_BYTE *)(a1 + 48) || *(void *)(a1 + 24))
  {
    *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 32;
    size_t v15 = *(void *)(a1 + 40);
    if (v15)
    {
      __int128 v16 = *(const void **)(a1 + 32);
      memcpy((void *)(*(void *)this + *((void *)this + 1)), v16, v15);
      *((void *)this + 1) += v15;
    }

    *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 32;
    if (*(_BYTE *)(a1 + 48))
    {
      ++*((_DWORD *)this + 8);
      uint64_t v17 = *(void *)this;
      uint64_t v18 = *((void *)this + 1);
      *((void *)this + 1) = v18 + 1;
      *(_BYTE *)(v17 + v1++*((_DWORD *)this + 8) = 40;
      uint64_t v19 = *(void *)(a1 + 16);
      char v26 = 42;
      __int16 v27 = 1344;
      uint64_t v25 = off_1896592F0;
      uint64_t v28 = v19;
      --*((_DWORD *)this + 8);
      uint64_t v20 = *(void *)this;
      uint64_t v21 = *((void *)this + 1);
      *((void *)this + 1) = v21 + 1;
      *(_BYTE *)(v20 + v21) = 41;
    }

    else
    {
    }
  }

  --*((_DWORD *)this + 8);
  uint64_t v23 = *(void *)this;
  uint64_t v24 = *((void *)this + 1);
  *((void *)this + 1) = v24 + 1;
  *(_BYTE *)(v23 + vqmemcpy((void *)(*(void *)this + *((void *)this + 1)), "construction vtable for ", 24) = 41;
  return result;
}

void *anonymous namespace'::itanium_demangle::ParameterPackExpansion::printLeft(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a2 + 24);
  int v5 = *(_DWORD *)(a2 + 28);
  *(void *)(a2 + qmemcpy((void *)(*(void *)this + *((void *)this + 1)), "construction vtable for ", 24) = -1LL;
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v7 + 32LL))(v7);
  if ((*(_WORD *)(v7 + 9) & 0xC0) != 0x40) {
    uint64_t result = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v7 + 40LL))(v7, a2);
  }
  unsigned int v9 = *(_DWORD *)(a2 + 28);
  if (v9 == -1)
  {
    uint64_t v12 = *(void *)a2 + *(void *)(a2 + 8);
    *(_BYTE *)(v12 + 2) = 46;
    *(_WORD *)uint64_t v12 = 11822;
    uint64_t v6 = *(void *)(a2 + 8) + 3LL;
    goto LABEL_12;
  }

  if (!v9)
  {
LABEL_12:
    *(void *)(a2 + ++*((_DWORD *)this + 8) = v6;
    goto LABEL_13;
  }

  if (v9 >= 2)
  {
    for (int i = 1; i != v9; ++i)
    {
      *(_WORD *)(*(void *)a2 + *(void *)(a2 + 8)) = 8236;
      *(void *)(a2 + 8) += 2LL;
      *(_DWORD *)(a2 + qmemcpy((void *)(*(void *)this + *((void *)this + 1)), "construction vtable for ", 24) = i;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t result = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v11 + 32LL))(v11, a2);
      if ((*(_WORD *)(v11 + 9) & 0xC0) != 0x40) {
        uint64_t result = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v11 + 40LL))(v11, a2);
      }
    }
  }

LABEL_13:
  *(_DWORD *)(a2 + qmemcpy((void *)(*(void *)this + *((void *)this + 1)), "construction vtable for ", 24) = v4;
  *(_DWORD *)(a2 + 2++*((_DWORD *)this + 8) = v5;
  return result;
}

  *(_BYTE *)(*a2 + a2[1]++) = 62;
  return result;
}

void sub_18041973C(_Unwind_Exception *a1)
{
  *(_DWORD *)(v1 + qmemcpy((void *)(*(void *)this + *((void *)this + 1)), "construction vtable for ", 24) = v2;
  *(_DWORD *)(v1 + 2++*((_DWORD *)this + 8) = v3;
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::itanium_demangle::BracedExpr::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  int v4 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v5 = *(void *)this;
  uint64_t v6 = *((void *)this + 1);
  *((void *)this + 1) = v6 + 1;
  if (v4)
  {
    *(_BYTE *)(v5 + v6) = 91;
    uint64_t v7 = *(void *)(a1 + 16);
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v7 + 32LL))( v7,  this);
    if ((*(_WORD *)(v7 + 9) & 0xC0) != 0x40) {
      (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v7 + 40LL))( v7,  this);
    }
    uint64_t v8 = *(void *)this;
    uint64_t v9 = *((void *)this + 1);
    *((void *)this + 1) = v9 + 1;
    *(_BYTE *)(v8 + v9) = 93;
  }

  else
  {
    *(_BYTE *)(v5 + v6) = 46;
    uint64_t v10 = *(void *)(a1 + 16);
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v10 + 32LL))( v10,  this);
    if ((*(_WORD *)(v10 + 9) & 0xC0) != 0x40) {
      (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v10 + 40LL))( v10,  this);
    }
  }

  uint64_t v11 = *(void *)(a1 + 24);
  if (*(unsigned __int8 *)(v11 + 8) - 81 >= 2)
  {
    uint64_t v12 = *(void *)this + *((void *)this + 1);
    *(_BYTE *)(v12 + 2) = 32;
    *(_WORD *)uint64_t v12 = 15648;
    *((void *)this + 1) += 3LL;
    uint64_t v11 = *(void *)(a1 + 24);
  }

  uint64_t result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v11 + 32LL))( v11,  this);
  if ((*(_WORD *)(v11 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v11 + 40LL))( v11,  this);
  }
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::BracedRangeExpr::printLeft( void *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this;
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = v5 + 1;
  *(_BYTE *)(v4 + v5) = 91;
  uint64_t v6 = a1[2];
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v6 + 32LL))( v6,  this);
  if ((*(_WORD *)(v6 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v6 + 40LL))( v6,  this);
  }
  uint64_t v7 = *(void *)this + *((void *)this + 1);
  *(_BYTE *)(v7 + 4) = 32;
  *(_DWORD *)uint64_t v7 = 774778400;
  *((void *)this + 1) += 5LL;
  uint64_t v8 = a1[3];
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v8 + 32LL))( v8,  this);
  if ((*(_WORD *)(v8 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v8 + 40LL))( v8,  this);
  }
  uint64_t v9 = *(void *)this;
  uint64_t v10 = *((void *)this + 1);
  *((void *)this + 1) = v10 + 1;
  *(_BYTE *)(v9 + v10) = 93;
  uint64_t v11 = a1[4];
  if (*(unsigned __int8 *)(v11 + 8) - 81 >= 2)
  {
    uint64_t v12 = *(void *)this + *((void *)this + 1);
    *(_BYTE *)(v12 + 2) = 32;
    *(_WORD *)uint64_t v12 = 15648;
    *((void *)this + 1) += 3LL;
    uint64_t v11 = a1[4];
  }

  uint64_t result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v11 + 32LL))( v11,  this);
  if ((*(_WORD *)(v11 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v11 + 40LL))( v11,  this);
  }
  return result;
}

void *anonymous namespace'::itanium_demangle::InitListExpr::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (v4)
  {
    (*(void (**)(void, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v4 + 32LL))( *(void *)(a1 + 16),  this);
    if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40) {
      (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v4 + 40LL))( v4,  this);
    }
  }

  uint64_t v5 = *(void *)this;
  uint64_t v6 = *((void *)this + 1);
  *((void *)this + 1) = v6 + 1;
  *(_BYTE *)(v5 + v6) = 123;
  uint64_t v8 = *(void *)this;
  uint64_t v9 = *((void *)this + 1);
  *((void *)this + 1) = v9 + 1;
  *(_BYTE *)(v8 + v9) = 125;
  return result;
}

void *anonymous namespace'::itanium_demangle::PointerToMemberConversionExpr::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this;
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = v5 + 1;
  *(_BYTE *)(v4 + v5) = 40;
  uint64_t v6 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v6 + 32LL))( v6,  this);
  if ((*(_WORD *)(v6 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v6 + 40LL))( v6,  this);
  }
  --*((_DWORD *)this + 8);
  uint64_t v7 = *(void *)this;
  uint64_t v8 = *((void *)this + 1);
  *((void *)this + 1) = v8 + 1;
  *(_BYTE *)(v7 + v++*((_DWORD *)this + 8) = 41;
  ++*((_DWORD *)this + 8);
  uint64_t v9 = *(void *)this;
  uint64_t v10 = *((void *)this + 1);
  *((void *)this + 1) = v10 + 1;
  *(_BYTE *)(v9 + v10) = 40;
  uint64_t v11 = *(void *)(a1 + 24);
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v11 + 32LL))( v11,  this);
  if ((*(_WORD *)(v11 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v11 + 40LL))( v11,  this);
  }
  --*((_DWORD *)this + 8);
  uint64_t v13 = *(void *)this;
  uint64_t v14 = *((void *)this + 1);
  *((void *)this + 1) = v14 + 1;
  *(_BYTE *)(v13 + v14) = 41;
  return result;
}

void *anonymous namespace'::itanium_demangle::ExprRequirement::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 32;
  if (*(_BYTE *)(a1 + 24) || *(void *)(a1 + 32))
  {
    ++*((_DWORD *)this + 8);
    uint64_t v4 = *(void *)this;
    uint64_t v5 = *((void *)this + 1);
    *((void *)this + 1) = v5 + 1;
    *(_BYTE *)(v4 + v5) = 123;
  }

  uint64_t v6 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v6 + 32LL))( v6,  this);
  if ((*(_WORD *)(v6 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v6 + 40LL))( v6,  this);
  }
  if (*(_BYTE *)(a1 + 24) || *(void *)(a1 + 32))
  {
    --*((_DWORD *)this + 8);
    uint64_t v7 = *(void *)this;
    uint64_t v8 = *((void *)this + 1);
    *((void *)this + 1) = v8 + 1;
    *(_BYTE *)(v7 + v++*((_DWORD *)this + 8) = 125;
    if (*(_BYTE *)(a1 + 24))
    {
      uint64_t v9 = *(void *)this + *((void *)this + 1);
      *(void *)uint64_t v9 = *(void *)" noexcept";
      *(_BYTE *)(v9 + ++*((_DWORD *)this + 8) = 116;
      *((void *)this + 1) += 9LL;
    }
  }

  if (*(void *)(a1 + 32))
  {
    *(_DWORD *)(*(void *)this + *((void *)this + 1)) = 540945696;
    *((void *)this + 1) += 4LL;
    uint64_t v10 = *(void *)(a1 + 32);
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v10 + 32LL))( v10,  this);
    if ((*(_WORD *)(v10 + 9) & 0xC0) != 0x40) {
      (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v10 + 40LL))( v10,  this);
    }
  }

  uint64_t v12 = *(void *)this;
  uint64_t v13 = *((void *)this + 1);
  *((void *)this + 1) = v13 + 1;
  *(_BYTE *)(v12 + v13) = 59;
  return result;
}

void *anonymous namespace'::itanium_demangle::TypeRequirement::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v4 = *(void *)" typename ";
  *(_WORD *)(v4 + ++*((_DWORD *)this + 8) = 8293;
  *((void *)this + 1) += 10LL;
  uint64_t v5 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v5 + 32LL))( v5,  this);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v5 + 40LL))( v5,  this);
  }
  uint64_t v7 = *(void *)this;
  uint64_t v8 = *((void *)this + 1);
  *((void *)this + 1) = v8 + 1;
  *(_BYTE *)(v7 + v++*((_DWORD *)this + 8) = 59;
  return result;
}

void *anonymous namespace'::itanium_demangle::NestedRequirement::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v4 = *(void *)" requires ";
  *(_WORD *)(v4 + ++*((_DWORD *)this + 8) = 8307;
  *((void *)this + 1) += 10LL;
  uint64_t v5 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v5 + 32LL))( v5,  this);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v5 + 40LL))( v5,  this);
  }
  uint64_t v7 = *(void *)this;
  uint64_t v8 = *((void *)this + 1);
  *((void *)this + 1) = v8 + 1;
  *(_BYTE *)(v7 + v++*((_DWORD *)this + 8) = 59;
  return result;
}

void *anonymous namespace'::itanium_demangle::RequiresExpr::printLeft( void *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  *(void *)(*(void *)this + *((void *)this + 1)) = 0x7365726975716572LL;
  *((void *)this + 1) += 8LL;
  if (a1[3])
  {
    uint64_t v4 = *(void *)this;
    uint64_t v5 = *((void *)this + 1);
    *((void *)this + 1) = v5 + 1;
    *(_BYTE *)(v4 + v5) = 32;
    ++*((_DWORD *)this + 8);
    uint64_t v6 = *(void *)this;
    uint64_t v7 = *((void *)this + 1);
    *((void *)this + 1) = v7 + 1;
    *(_BYTE *)(v6 + v7) = 40;
    --*((_DWORD *)this + 8);
    uint64_t v8 = *(void *)this;
    uint64_t v9 = *((void *)this + 1);
    *((void *)this + 1) = v9 + 1;
    *(_BYTE *)(v8 + v9) = 41;
  }

  uint64_t v10 = *(void *)this;
  uint64_t v11 = *((void *)this + 1);
  *((void *)this + 1) = v11 + 1;
  *(_BYTE *)(v10 + v11) = 32;
  ++*((_DWORD *)this + 8);
  uint64_t v12 = *(void *)this;
  uint64_t v13 = *((void *)this + 1);
  *((void *)this + 1) = v13 + 1;
  *(_BYTE *)(v12 + v13) = 123;
  uint64_t v14 = a1[5];
  if (v14)
  {
    size_t v15 = (void *)a1[4];
    uint64_t v16 = 8 * v14;
    do
    {
      uint64_t v17 = *v15;
      (*(void (**)(void, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)*v15 + 32LL))( *v15,  this);
      if ((*(_WORD *)(v17 + 9) & 0xC0) != 0x40) {
        (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v17 + 40LL))( v17,  this);
      }
      ++v15;
      v16 -= 8LL;
    }

    while (v16);
  }

  uint64_t v18 = *(void *)this;
  uint64_t v19 = *((void *)this + 1);
  *((void *)this + 1) = v19 + 1;
  *(_BYTE *)(v18 + v19) = 32;
  --*((_DWORD *)this + 8);
  uint64_t v21 = *(void *)this;
  uint64_t v22 = *((void *)this + 1);
  *((void *)this + 1) = v22 + 1;
  *(_BYTE *)(v21 + v22) = 125;
  return result;
}

void *anonymous namespace'::itanium_demangle::SubobjectExpr::printLeft(void *a1, void *a2)
{
  uint64_t v4 = a1[3];
  (*(void (**)(uint64_t))(*(void *)v4 + 32LL))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, void *))(*(void *)v4 + 40LL))(v4, a2);
  }
  *(_WORD *)(*a2 + a2[1]) = 15406;
  a2[1] += 2LL;
  uint64_t v5 = a1[2];
  (*(void (**)(uint64_t, void *))(*(void *)v5 + 32LL))(v5, a2);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, void *))(*(void *)v5 + 40LL))(v5, a2);
  }
  uint64_t v6 = *a2 + a2[1];
  *(void *)uint64_t v6 = *(void *)" at offset ";
  *(_DWORD *)(v6 + 7) = 544499059;
  a2[1] += 11LL;
  size_t v7 = a1[5];
  if (!v7)
  {
    size_t v7 = 1LL;
    *(_BYTE *)(*a2 + a2[1]) = 48;
LABEL_12:
    a2[1] += v7;
    goto LABEL_13;
  }

  uint64_t v8 = (_BYTE *)a1[4];
  if (*v8 != 110)
  {
    uint64_t v11 = (void *)(*a2 + a2[1]);
    uint64_t v12 = v8;
    goto LABEL_11;
  }

  *(_BYTE *)(*a2 + a2[1]++) = 45;
  uint64_t v9 = a1[5];
  size_t v7 = v9 - 1;
  if (v9 != 1)
  {
    uint64_t v10 = a1[4] + 1LL;
    uint64_t v11 = (void *)(*a2 + a2[1]);
    uint64_t v12 = (const void *)v10;
LABEL_11:
    memcpy(v11, v12, v7);
    goto LABEL_12;
  }

void *anonymous namespace'::itanium_demangle::SizeofParamPackExpr::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v4 = *(void *)"sizeof...";
  *(_BYTE *)(v4 + ++*((_DWORD *)this + 8) = 46;
  *((void *)this + 1) += 9LL;
  ++*((_DWORD *)this + 8);
  uint64_t v5 = *(void *)this;
  uint64_t v6 = *((void *)this + 1);
  *((void *)this + 1) = v6 + 1;
  *(_BYTE *)(v5 + v6) = 40;
  uint64_t v7 = *(void *)(a1 + 16);
  char v12 = 42;
  __int16 v13 = 1344;
  uint64_t v11 = off_1896592F0;
  uint64_t v14 = v7;
  --*((_DWORD *)this + 8);
  uint64_t v9 = *(void *)this;
  uint64_t v10 = *((void *)this + 1);
  *((void *)this + 1) = v10 + 1;
  *(_BYTE *)(v9 + v10) = 41;
  return result;
}

void *anonymous namespace'::itanium_demangle::NodeArrayNode::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *a2)
{
}

uint64_t anonymous namespace'::itanium_demangle::ThrowExpr::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(_WORD *)(v4 + 4) = 8311;
  *(_DWORD *)uint64_t v4 = 1869768820;
  *((void *)this + 1) += 6LL;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v5 + 32LL))( v5,  this);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v5 + 40LL))( v5,  this);
  }
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseUnresolvedType( unsigned __int8 **a1)
{
  if (a1[1] == *a1) {
  int v2 = **a1;
  }
  if (v2 == 68)
  {
    goto LABEL_7;
  }

  if (v2 != 84) {
LABEL_7:
  }
  uint64_t v5 = v3;
  uint64_t v6 = v3;
  if (v3) {
  return v5;
  }
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseSimpleId( void *a1)
{
  if (v8 && a1[1] != *a1 && *(_BYTE *)*a1 == 73)
  {
    if (v9)
    {
      uint64_t v10 = v9;
      *((_BYTE *)v11 + ++*((_DWORD *)this + 8) = 45;
      *(_WORD *)((char *)v11 + 9) = *(_WORD *)((_BYTE *)v11 + 9) & 0xF000 | 0x540;
      *uint64_t v11 = off_189659FA0;
      v11[2] = v8;
      v11[3] = v10;
      return v11;
    }

    else
    {
      return 0LL;
    }
  }

  return v8;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseBaseUnresolvedName( unsigned __int8 **a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (char *)a1[1];
  if (v3 == (char *)*a1)
  {
    uint64_t v4 = 0LL;
  }

  else
  {
    uint64_t v4 = *v2;
  }

  if ((*(_DWORD *)(MEMORY[0x1895F8770] + 4 * v4 + 60) & 0x400) != 0) {
LABEL_6:
  }
  if (*(_WORD *)v2 == 28260)
  {
    unint64_t v16 = (unint64_t)(v2 + 2);
    *a1 = (unsigned __int8 *)v16;
    if (v3 == (char *)v16)
    {
      unint64_t v16 = 0LL;
    }

    else
    {
      LODWORD(v16) = *(char *)v16;
      if ((v16 & 0x80000000) != 0) {
        goto LABEL_21;
      }
      unint64_t v16 = v16;
    }

    if ((*(_DWORD *)(MEMORY[0x1895F8770] + 4 * v16 + 60) & 0x400) != 0)
    {
LABEL_23:
      uint64_t v18 = v17;
      if (v17)
      {
        *((_BYTE *)v11 + ++*((_DWORD *)this + 8) = 50;
        *(_WORD *)((char *)v11 + 9) = *(_WORD *)((_BYTE *)v11 + 9) & 0xF000 | 0x540;
        *uint64_t v11 = off_189659910;
        v11[2] = v18;
        return v11;
      }

      return 0LL;
    }

uint64_t anonymous namespace'::itanium_demangle::QualifiedName::printLeft(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t))(*(void *)v4 + 32LL))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, void *))(*(void *)v4 + 40LL))(v4, a2);
  }
  *(_WORD *)(*a2 + a2[1]) = 14906;
  a2[1] += 2LL;
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t result = (*(uint64_t (**)(uint64_t, void *))(*(void *)v5 + 32LL))(v5, a2);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, void *))(*(void *)v5 + 40LL))(v5, a2);
  }
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::QualifiedName::getBaseName( _anonymous_namespace_::itanium_demangle::QualifiedName *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 3) + 48LL))(*((void *)this + 3));
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseOperatorName( uint64_t a1, _BYTE *a2)
{
  if (!v4)
  {
    char v12 = *(unsigned __int8 **)a1;
    __int16 v13 = *(unsigned __int8 **)(a1 + 8);
    if ((unint64_t)&v13[-*(void *)a1] >= 2 && *(_WORD *)v12 == 26988)
    {
      *(void *)a1 = v12 + 2;
      if (!result) {
        return result;
      }
      uint64_t v14 = result;
      *((_BYTE *)result + ++*((_DWORD *)this + 8) = 20;
      *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
      size_t v15 = off_1896599F0;
    }

    else
    {
      if (v12 == v13) {
        return 0LL;
      }
      if (*v12 != 118) {
        return 0LL;
      }
      *(void *)a1 = v12 + 1;
      *(void *)a1 = v12 + 2;
      if (!result) {
        return result;
      }
      uint64_t v14 = result;
      *((_BYTE *)result + ++*((_DWORD *)this + 8) = 4;
      *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
      size_t v15 = off_189659980;
    }

    *uint64_t result = v15;
    result[2] = v14;
    return result;
  }

  unsigned int v5 = v4[2];
  if (v5 != 8)
  {
    if (v5 <= 0xA && (v5 != 4 || (v4[3] & 1) != 0))
    {
      unint64_t v16 = (const char *)*((void *)v4 + 1);
      size_t v17 = strlen(v16);
      *((_BYTE *)result + ++*((_DWORD *)this + 8) = 8;
      *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
      *uint64_t result = off_1896580A0;
      result[2] = v16;
      result[3] = v17;
      return result;
    }

    return 0LL;
  }

  char v6 = *(_BYTE *)(a1 + 776);
  *(_BYTE *)(a1 + 776) = 0;
  int v7 = *(unsigned __int8 *)(a1 + 777);
  if (a2) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v7 == 0;
  }
  char v9 = !v8;
  *(_BYTE *)(a1 + 777) = v9;
  if (v10)
  {
    if (a2) {
      *a2 = 1;
    }
    *((_BYTE *)result + ++*((_DWORD *)this + 8) = 4;
    *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
    *uint64_t result = off_189659980;
    result[2] = v10;
  }

  else
  {
    uint64_t result = 0LL;
  }

  *(_BYTE *)(a1 + 777) = v7;
  *(_BYTE *)(a1 + 776) = v6;
  return result;
}

void sub_18041AB20(_Unwind_Exception *a1)
{
  *(_BYTE *)(v1 + 777) = v3;
  *(_BYTE *)(v1 + 776) = v2;
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::itanium_demangle::DtorName::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 126;
  return (*(uint64_t (**)(void, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(**(void **)(a1 + 16) + 32LL))( *(void *)(a1 + 16),  this);
}

uint64_t anonymous namespace'::itanium_demangle::ConversionOperatorType::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v4 = *(void *)"operator ";
  *(_BYTE *)(v4 + ++*((_DWORD *)this + 8) = 32;
  *((void *)this + 1) += 9LL;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v5 + 32LL))( v5,  this);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v5 + 40LL))( v5,  this);
  }
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::LiteralOperator::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v4 = *(void *)"operator ";
  *(_DWORD *)(v4 + 7) = 539107954;
  *((void *)this + 1) += 11LL;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v5 + 32LL))( v5,  this);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v5 + 40LL))( v5,  this);
  }
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::GlobalQualifiedName::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  *(_WORD *)(*(void *)this + *((void *)this + 1)) = 14906;
  *((void *)this + 1) += 2LL;
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v4 + 32LL))( v4,  this);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v4 + 40LL))( v4,  this);
  }
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::GlobalQualifiedName::getBaseName( _anonymous_namespace_::itanium_demangle::GlobalQualifiedName *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 2) + 48LL))(*((void *)this + 2));
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseAbiTags( void *a1, void *a2)
{
  char v3 = (_BYTE *)*a1;
  if (*a1 != a1[1])
  {
    uint64_t v5 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 101);
    while (*v3 == 66)
    {
      *a1 = v3 + 1;
      if (!v7) {
        return 0LL;
      }
      BOOL v8 = v6;
      uint64_t v9 = v7;
      __int16 v11 = *(_WORD *)((char *)a2 + 9);
      *((_BYTE *)result + ++*((_DWORD *)this + 8) = 9;
      *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | v11 & 0xFC0;
      *uint64_t result = off_189659BB0;
      result[2] = a2;
      result[3] = v8;
      result[4] = v9;
      char v3 = (_BYTE *)*a1;
      a2 = result;
      if (*a1 == a1[1]) {
        return result;
      }
    }
  }

  return a2;
}

void anonymous namespace'::itanium_demangle::SpecialSubstitution::printLeft( _anonymous_namespace_::itanium_demangle::SpecialSubstitution *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(_BYTE *)(v4 + 4) = 58;
  *(_DWORD *)uint64_t v4 = 979661939;
  *((void *)this + 1) += 5LL;
  if (v6)
  {
    uint64_t v7 = v5;
    size_t v8 = v6;
    memcpy((void *)(*(void *)this + *((void *)this + 1)), v7, v8);
    *((void *)this + 1) += v8;
  }

void anonymous namespace'::itanium_demangle::SpecialSubstitution::getBaseName( _anonymous_namespace_::itanium_demangle::SpecialSubstitution *this)
{
  __asm { BR              X12 }

const char *sub_18041AF1C()
{
  return "basic_string";
}

void *anonymous namespace'::itanium_demangle::ExpandedSpecialSubstitution::printLeft( _DWORD *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(_BYTE *)(v4 + 4) = 58;
  *(_DWORD *)uint64_t v4 = 979661939;
  *((void *)this + 1) += 5LL;
  uint64_t result = (void *)(*(uint64_t (**)(_DWORD *))(*(void *)a1 + 48LL))(a1);
  if (v6)
  {
    uint64_t v7 = result;
    size_t v8 = v6;
    uint64_t result = memcpy((void *)(*(void *)this + *((void *)this + 1)), v7, v8);
    *((void *)this + 1) += v8;
  }

  if (a1[3] >= 2u)
  {
    qmemcpy((void *)(*(void *)this + *((void *)this + 1)), "<char, std::char_traits<char>", 29);
    *((void *)this + 1) += 29LL;
    if (a1[3] == 2)
    {
      qmemcpy((void *)(*(void *)this + *((void *)this + 1)), ", std::allocator<char>", 22);
      *((void *)this + 1) += 22LL;
    }

    *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 62;
  }

  return result;
}

char *anonymous namespace'::itanium_demangle::ExpandedSpecialSubstitution::getBaseName( _anonymous_namespace_::itanium_demangle::ExpandedSpecialSubstitution *this)
{
  return off_18965AA10[*((int *)this + 3)];
}

unsigned __int8 *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseBareSourceName( uint64_t a1)
{
  unint64_t v4 = 0LL;
  uint64_t result = 0LL;
  if ((v2 & 1) == 0)
  {
    uint64_t result = *(unsigned __int8 **)a1;
    if (*(void *)(a1 + 8) - *(void *)a1 >= v4) {
      *(void *)a1 = &result[v4];
    }
    else {
      return 0LL;
    }
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::AbiTagAttr::printLeft(uint64_t a1, void *a2)
{
  uint64_t v4 = *a2 + a2[1];
  *(_BYTE *)(v4 + 4) = 58;
  *(_DWORD *)uint64_t v4 = 1768055131;
  a2[1] += 5LL;
  size_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = *(const void **)(a1 + 24);
    memcpy((void *)(*a2 + a2[1]), v6, v5);
    a2[1] += v5;
  }

  *(_BYTE *)(*a2 + a2[1]++) = 93;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::AbiTagAttr::getBaseName( _anonymous_namespace_::itanium_demangle::AbiTagAttr *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 2) + 48LL))(*((void *)this + 2));
}

void *anonymous namespace'::itanium_demangle::StructuredBindingName::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this;
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = v5 + 1;
  *(_BYTE *)(v4 + v5) = 91;
  --*((_DWORD *)this + 8);
  uint64_t v7 = *(void *)this;
  uint64_t v8 = *((void *)this + 1);
  *((void *)this + 1) = v8 + 1;
  *(_BYTE *)(v7 + v++*((_DWORD *)this + 8) = 93;
  return result;
}

void *anonymous namespace'::itanium_demangle::CtorDtorName::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  if (*(_BYTE *)(a1 + 24))
  {
    *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 126;
  }

  uint64_t result = (void *)(*(uint64_t (**)(void))(**(void **)(a1 + 16) + 48LL))(*(void *)(a1 + 16));
  if (v5)
  {
    uint64_t v6 = result;
    size_t v7 = v5;
    uint64_t result = memcpy((void *)(*(void *)this + *((void *)this + 1)), v6, v7);
    *((void *)this + 1) += v7;
  }

  return result;
}

uint64_t anonymous namespace'::itanium_demangle::ModuleEntity::printLeft(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  (*(void (**)(uint64_t))(*(void *)v4 + 32LL))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v4 + 40LL))(v4, a2);
  }
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  a2[1] = v6 + 1;
  *(_BYTE *)(v5 + v6) = 64;
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v7 + 32LL))(v7, a2);
  if ((*(_WORD *)(v7 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v7 + 40LL))(v7, a2);
  }
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::ModuleEntity::getBaseName( _anonymous_namespace_::itanium_demangle::ModuleEntity *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 3) + 48LL))(*((void *)this + 3));
}

uint64_t anonymous namespace'::itanium_demangle::MemberLikeFriendName::printLeft(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t))(*(void *)v4 + 32LL))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, void *))(*(void *)v4 + 40LL))(v4, a2);
  }
  uint64_t v5 = *a2 + a2[1];
  *(void *)uint64_t v5 = *(void *)"::friend ";
  *(_BYTE *)(v5 + ++*((_DWORD *)this + 8) = 32;
  a2[1] += 9LL;
  uint64_t v6 = *(void *)(a1 + 24);
  uint64_t result = (*(uint64_t (**)(uint64_t, void *))(*(void *)v6 + 32LL))(v6, a2);
  if ((*(_WORD *)(v6 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, void *))(*(void *)v6 + 40LL))(v6, a2);
  }
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::MemberLikeFriendName::getBaseName( _anonymous_namespace_::itanium_demangle::MemberLikeFriendName *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 3) + 48LL))(*((void *)this + 3));
}

uint64_t anonymous namespace'::itanium_demangle::NestedName::printLeft(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t))(*(void *)v4 + 32LL))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, void *))(*(void *)v4 + 40LL))(v4, a2);
  }
  *(_WORD *)(*a2 + a2[1]) = 14906;
  a2[1] += 2LL;
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t result = (*(uint64_t (**)(uint64_t, void *))(*(void *)v5 + 32LL))(v5, a2);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, void *))(*(void *)v5 + 40LL))(v5, a2);
  }
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::NestedName::getBaseName( _anonymous_namespace_::itanium_demangle::NestedName *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 3) + 48LL))(*((void *)this + 3));
}

const char *anonymous namespace'::itanium_demangle::parse_discriminator( const char *this, const char *a2, const char *a3)
{
  if (this != a2)
  {
    uint64_t v3 = *(unsigned __int8 *)this;
    if (v3 == 95)
    {
      if (this + 1 != a2 && (this[1] & 0x80000000) == 0)
      {
        if ((*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * *((unsigned __int8 *)this + 1) + 60) & 0x400) != 0)
        {
          this += 2;
        }

        else
        {
          uint64_t v4 = this + 2;
          if (this[1] == 95 && v4 != a2)
          {
            while (1)
            {
              uint64_t v6 = *(unsigned __int8 *)v4;
              if (*v4 < 0 || (*(_DWORD *)(MEMORY[0x1895F8770] + 4 * v6 + 60) & 0x400) == 0) {
                break;
              }
              if (++v4 == a2) {
                return this;
              }
            }

            if ((_DWORD)v6 == 95) {
              return v4 + 1;
            }
          }
        }
      }
    }

    else if ((v3 & 0x80) == 0 && (*(_DWORD *)(MEMORY[0x1895F8770] + 4 * v3 + 60) & 0x400) != 0)
    {
      uint64_t v7 = this + 1;
      while (v7 != a2)
      {
        int v8 = *v7;
        if ((v8 & 0x80000000) == 0)
        {
          ++v7;
        }

        return this;
      }

      return a2;
    }
  }

  return this;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,char const(&)[15]>( uint64_t a1, const char *a2)
{
  size_t v4 = strlen(a2);
  *((_BYTE *)v3 + ++*((_DWORD *)this + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x540;
  *uint64_t v3 = off_1896580A0;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

uint64_t anonymous namespace'::itanium_demangle::LocalName::printLeft(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t))(*(void *)v4 + 32LL))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, void *))(*(void *)v4 + 40LL))(v4, a2);
  }
  *(_WORD *)(*a2 + a2[1]) = 14906;
  a2[1] += 2LL;
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t result = (*(uint64_t (**)(uint64_t, void *))(*(void *)v5 + 32LL))(v5, a2);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, void *))(*(void *)v5 + 40LL))(v5, a2);
  }
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::ParameterPack::hasRHSComponentSlow(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 28) == -1)
  {
    unint64_t v2 = 0LL;
    unint64_t v3 = *(void *)(a1 + 24);
    *(_DWORD *)(a2 + qmemcpy((void *)(*(void *)this + *((void *)this + 1)), "construction vtable for ", 24) = 0;
    *(_DWORD *)(a2 + 2++*((_DWORD *)this + 8) = v3;
  }

  else
  {
    unint64_t v2 = *(unsigned int *)(a2 + 24);
    unint64_t v3 = *(void *)(a1 + 24);
  }

  if (v3 <= v2) {
    return 0LL;
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 16) + 8 * v2);
  unsigned int v5 = *(unsigned __int8 *)(v4 + 9);
  if ((v5 & 0xC0) == 0x80) {
    return (**(uint64_t (***)(uint64_t))v4)(v4);
  }
  else {
    return v5 < 0x40;
  }
}

uint64_t anonymous namespace'::itanium_demangle::ParameterPack::hasArraySlow(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 28) == -1)
  {
    unint64_t v2 = 0LL;
    unint64_t v3 = *(void *)(a1 + 24);
    *(_DWORD *)(a2 + qmemcpy((void *)(*(void *)this + *((void *)this + 1)), "construction vtable for ", 24) = 0;
    *(_DWORD *)(a2 + 2++*((_DWORD *)this + 8) = v3;
  }

  else
  {
    unint64_t v2 = *(unsigned int *)(a2 + 24);
    unint64_t v3 = *(void *)(a1 + 24);
  }

  if (v3 <= v2) {
    return 0LL;
  }
  uint64_t v4 = *(_BYTE **)(*(void *)(a1 + 16) + 8 * v2);
  int v5 = v4[10] & 3;
  if (v5 == 2) {
    return (*(uint64_t (**)(_BYTE *))(*(void *)v4 + 8LL))(v4);
  }
  else {
    return v5 == 0;
  }
}

uint64_t anonymous namespace'::itanium_demangle::ParameterPack::hasFunctionSlow(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 28) == -1)
  {
    unint64_t v2 = 0LL;
    unint64_t v3 = *(void *)(a1 + 24);
    *(_DWORD *)(a2 + qmemcpy((void *)(*(void *)this + *((void *)this + 1)), "construction vtable for ", 24) = 0;
    *(_DWORD *)(a2 + 2++*((_DWORD *)this + 8) = v3;
  }

  else
  {
    unint64_t v2 = *(unsigned int *)(a2 + 24);
    unint64_t v3 = *(void *)(a1 + 24);
  }

  if (v3 <= v2) {
    return 0LL;
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 16) + 8 * v2);
  int v5 = (*(unsigned __int16 *)(v4 + 9) >> 10) & 3;
  if (v5 == 2) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v4 + 16LL))(v4);
  }
  else {
    return v5 == 0;
  }
}

uint64_t anonymous namespace'::itanium_demangle::ParameterPack::getSyntaxNode(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 28) == -1)
  {
    unint64_t v2 = 0LL;
    unint64_t v3 = *(void *)(result + 24);
    *(_DWORD *)(a2 + qmemcpy((void *)(*(void *)this + *((void *)this + 1)), "construction vtable for ", 24) = 0;
    *(_DWORD *)(a2 + 2++*((_DWORD *)this + 8) = v3;
  }

  else
  {
    unint64_t v2 = *(unsigned int *)(a2 + 24);
    unint64_t v3 = *(void *)(result + 24);
  }

  if (v3 > v2)
  {
    uint64_t v4 = *(void *)(*(void *)(result + 16) + 8 * v2);
    return (*(uint64_t (**)(uint64_t))(*(void *)v4 + 24LL))(v4);
  }

  return result;
}

uint64_t anonymous namespace'::itanium_demangle::ParameterPack::printLeft(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 28) == -1)
  {
    unint64_t v2 = 0LL;
    unint64_t v3 = *(void *)(result + 24);
    *(_DWORD *)(a2 + qmemcpy((void *)(*(void *)this + *((void *)this + 1)), "construction vtable for ", 24) = 0;
    *(_DWORD *)(a2 + 2++*((_DWORD *)this + 8) = v3;
  }

  else
  {
    unint64_t v2 = *(unsigned int *)(a2 + 24);
    unint64_t v3 = *(void *)(result + 24);
  }

  if (v3 > v2)
  {
    uint64_t v4 = *(void *)(*(void *)(result + 16) + 8 * v2);
    return (*(uint64_t (**)(uint64_t))(*(void *)v4 + 32LL))(v4);
  }

  return result;
}

uint64_t anonymous namespace'::itanium_demangle::ParameterPack::printRight(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 28) == -1)
  {
    unint64_t v2 = 0LL;
    unint64_t v3 = *(void *)(result + 24);
    *(_DWORD *)(a2 + qmemcpy((void *)(*(void *)this + *((void *)this + 1)), "construction vtable for ", 24) = 0;
    *(_DWORD *)(a2 + 2++*((_DWORD *)this + 8) = v3;
  }

  else
  {
    unint64_t v2 = *(unsigned int *)(a2 + 24);
    unint64_t v3 = *(void *)(result + 24);
  }

  if (v3 > v2)
  {
    uint64_t v4 = *(void *)(*(void *)(result + 16) + 8 * v2);
    return (*(uint64_t (**)(uint64_t))(*(void *)v4 + 40LL))(v4);
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::TemplateArgs::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  int v4 = *((_DWORD *)this + 8);
  *((_DWORD *)this + ++*((_DWORD *)this + 8) = 0;
  *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 60;
  *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 62;
  *((_DWORD *)this + ++*((_DWORD *)this + 8) = v4;
  return result;
}

void sub_18041BAF4(_Unwind_Exception *a1)
{
  *(_DWORD *)(v1 + 32) = v2;
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::itanium_demangle::NameWithTemplateArgs::printLeft(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t))(*(void *)v4 + 32LL))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, uint64_t))(*(void *)v4 + 40LL))(v4, a2);
  }
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v5 + 32LL))(v5, a2);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v5 + 40LL))(v5, a2);
  }
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::NameWithTemplateArgs::getBaseName( _anonymous_namespace_::itanium_demangle::NameWithTemplateArgs *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 2) + 48LL))(*((void *)this + 2));
}

void *anonymous namespace'::itanium_demangle::TemplateArgumentPack::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *a2)
{
}

uint64_t anonymous namespace'::itanium_demangle::TemplateParamQualifiedArg::printLeft( uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 32LL))(v3);
  if ((*(_WORD *)(v3 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v3 + 40LL))(v3, a2);
  }
  return result;
}

void *anonymous namespace'::itanium_demangle::EnableIfAttr::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v4 = *(void *)" [enable_if:";
  *(_DWORD *)(v4 + ++*((_DWORD *)this + 8) = 979790175;
  *((void *)this + 1) += 12LL;
  uint64_t v6 = *(void *)this;
  uint64_t v7 = *((void *)this + 1);
  *((void *)this + 1) = v7 + 1;
  *(_BYTE *)(v6 + v7) = 93;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::ExplicitObjectParameter::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(_BYTE *)(v4 + 4) = 32;
  *(_DWORD *)uint64_t v4 = 1936287860;
  *((void *)this + 1) += 5LL;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v5 + 32LL))( v5,  this);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v5 + 40LL))( v5,  this);
  }
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::FunctionEncoding::hasRHSComponentSlow()
{
  return 1LL;
}

uint64_t anonymous namespace'::itanium_demangle::FunctionEncoding::hasFunctionSlow()
{
  return 1LL;
}

uint64_t anonymous namespace'::itanium_demangle::FunctionEncoding::printLeft(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    goto LABEL_7;
  }
  (*(void (**)(uint64_t, void *))(*(void *)v4 + 32LL))(v4, a2);
  uint64_t v5 = *(void *)(a1 + 16);
  unsigned int v6 = *(unsigned __int8 *)(v5 + 9);
  if ((v6 & 0xC0) != 0x80)
  {
    if (v6 < 0x40) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  if (((**(uint64_t (***)(uint64_t, void *))v5)(v5, a2) & 1) == 0)
  {
LABEL_6:
    *(_BYTE *)(*a2 + a2[1]++) = 32;
  }

LABEL_7:
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t result = (*(uint64_t (**)(uint64_t, void *))(*(void *)v7 + 32LL))(v7, a2);
  if ((*(_WORD *)(v7 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, void *))(*(void *)v7 + 40LL))(v7, a2);
  }
  return result;
}

  __int16 v11 = *(unsigned __int8 *)(a1 + 68);
  if (v11 == 2)
  {
    char v12 = 3LL;
    size_t v15 = *(void *)this + *((void *)this + 1);
    *(_BYTE *)(v15 + 2) = 38;
    *(_WORD *)size_t v15 = 9760;
    goto LABEL_14;
  }

  if (v11 == 1)
  {
    char v12 = 2LL;
    *(_WORD *)(*(void *)this + *((void *)this + 1)) = 9760;
LABEL_14:
    *((void *)this + 1) += v12;
  }

  unint64_t v16 = *(void *)(a1 + 48);
  if (v16)
  {
    uint64_t result = (void *)(*(uint64_t (**)(void, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v16 + 32LL))( *(void *)(a1 + 48),  this);
    if ((*(_WORD *)(v16 + 9) & 0xC0) != 0x40) {
      uint64_t result = (void *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v16 + 40LL))( v16,  this);
    }
  }

  if (*(void *)(a1 + 56))
  {
    size_t v17 = *(void *)this + *((void *)this + 1);
    *(void *)size_t v17 = *(void *)" requires ";
    *(_WORD *)(v17 + ++*((_DWORD *)this + 8) = 8307;
    *((void *)this + 1) += 10LL;
    uint64_t v18 = *(void *)(a1 + 56);
    uint64_t result = (void *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v18 + 32LL))( v18,  this);
    if ((*(_WORD *)(v18 + 9) & 0xC0) != 0x40) {
      return (void *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v18 + 40LL))( v18,  this);
    }
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::FunctionEncoding::printRight( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this;
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = v5 + 1;
  *(_BYTE *)(v4 + v5) = 40;
  --*((_DWORD *)this + 8);
  uint64_t v6 = *(void *)this;
  uint64_t v7 = *((void *)this + 1);
  *((void *)this + 1) = v7 + 1;
  *(_BYTE *)(v6 + v7) = 41;
  uint64_t result = *(void **)(a1 + 16);
  if (result) {
    uint64_t result = (void *)(*(uint64_t (**)(void *, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*result + 40LL))( result,  this);
  }
  int v9 = *(_DWORD *)(a1 + 64);
  if ((v9 & 1) != 0)
  {
    uint64_t v13 = *(void *)this + *((void *)this + 1);
    *(_WORD *)(v13 + 4) = 29811;
    *(_DWORD *)uint64_t v13 = 1852793632;
    *((void *)this + 1) += 6LL;
    int v9 = *(_DWORD *)(a1 + 64);
    if ((v9 & 2) == 0)
    {
LABEL_5:
      if ((v9 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }

  else if ((v9 & 2) == 0)
  {
    goto LABEL_5;
  }

  uint64_t v14 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v14 = *(void *)" volatile";
  *(_BYTE *)(v14 + ++*((_DWORD *)this + 8) = 101;
  *((void *)this + 1) += 9LL;
  if ((*(_DWORD *)(a1 + 64) & 4) != 0)
  {
LABEL_6:
    uint64_t v10 = *(void *)this + *((void *)this + 1);
    *(void *)uint64_t v10 = *(void *)" restrict";
    *(_BYTE *)(v10 + ++*((_DWORD *)this + 8) = 116;
    *((void *)this + 1) += 9LL;
  }

void *anonymous namespace'::itanium_demangle::DotSuffix::printLeft(void *a1, void *a2)
{
  uint64_t v4 = a1[2];
  (*(void (**)(uint64_t))(*(void *)v4 + 32LL))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, void *))(*(void *)v4 + 40LL))(v4, a2);
  }
  *(_WORD *)(*a2 + a2[1]) = 10272;
  a2[1] += 2LL;
  size_t v5 = a1[4];
  if (v5)
  {
    uint64_t v6 = (const void *)a1[3];
    memcpy((void *)(*a2 + a2[1]), v6, v5);
    a2[1] += v5;
  }

  *(_BYTE *)(*a2 + a2[1]++) = 41;
  return result;
}

void anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseFunctionType( void *a1)
{
  uint64_t v10 = (_WORD *)*a1;
  int v9 = (_BYTE *)a1[1];
  if ((unint64_t)&v9[-*a1] < 2)
  {
LABEL_2:
    int v11 = 0LL;
    goto LABEL_12;
  }

  if (*v10 != 28484)
  {
    if (*v10 == 20292)
    {
      *a1 = v10 + 1;
      if (!v29) {
        return;
      }
      uint64_t v30 = (_BYTE *)*a1;
      if (*a1 == a1[1] || *v30 != 69) {
        return;
      }
      uint64_t v31 = v29;
      *a1 = v30 + 1;
      *((_BYTE *)v11 + ++*((_DWORD *)this + 8) = 17;
      *(_WORD *)((char *)v11 + 9) = *(_WORD *)((_BYTE *)v11 + 9) & 0xF000 | 0x540;
      *int v11 = off_18965A2B0;
      v11[2] = v31;
      goto LABEL_12;
    }

    if (*v10 == 30532)
    {
      uint64_t v12 = v10 + 1;
      *a1 = v12;
      unint64_t v13 = (uint64_t)(a1[3] - a1[2]) >> 3;
      while (v12 == v9 || *v12 != 69)
      {
        if (!v40) {
          return;
        }
        uint64_t v12 = (_BYTE *)*a1;
        int v9 = (_BYTE *)a1[1];
      }

      *a1 = v12 + 1;
      uint64_t v39 = v38;
      *((_BYTE *)v11 + ++*((_DWORD *)this + 8) = 18;
      *(_WORD *)((char *)v11 + 9) = *(_WORD *)((_BYTE *)v11 + 9) & 0xF000 | 0x540;
      *int v11 = off_18965A320;
      v11[2] = v37;
      v11[3] = v39;
      goto LABEL_12;
    }

    goto LABEL_2;
  }

  *a1 = v10 + 1;
LABEL_12:
  uint64_t v14 = (_WORD *)*a1;
  uint64_t v15 = (_WORD *)a1[1];
  if (v14 == v15 || *(_BYTE *)v14 != 70) {
    return;
  }
  *a1 = (char *)v14 + 1;
  if (!v16) {
    return;
  }
  uint64_t v23 = v16;
  unint64_t v24 = (uint64_t)(a1[3] - a1[2]) >> 3;
  uint64_t v25 = 1LL;
  while (1)
  {
    while (1)
    {
      char v26 = (_WORD *)*a1;
      uint64_t v27 = a1[1];
      if (*a1 == v27) {
        goto LABEL_25;
      }
      int v28 = *(unsigned __int8 *)v26;
      if (v28 != 118) {
        break;
      }
      *a1 = (char *)v26 + 1;
    }

    if (v28 == 69)
    {
      char v32 = 0;
      goto LABEL_39;
    }

LABEL_25:
    if ((unint64_t)(v27 - (void)v26) >= 2)
    {
      if (*v26 == 17746)
      {
        char v32 = 1;
        uint64_t v25 = 2LL;
        goto LABEL_39;
      }

      if (*v26 == 17743) {
        break;
      }
    }

    if (!v40) {
      return;
    }
  }

  uint64_t v25 = 2LL;
  char v32 = 2;
LABEL_39:
  *a1 = (char *)v26 + v25;
  uint64_t v35 = v34;
  *((_BYTE *)v36 + ++*((_DWORD *)this + 8) = 16;
  *(_WORD *)((char *)v36 + 9) = *(_WORD *)((_BYTE *)v36 + 9) & 0xF000 | 0x100;
  *uint64_t v36 = off_18965A390;
  v36[2] = v23;
  v36[3] = v33;
  v36[4] = v35;
  *((_DWORD *)v36 + 10) = v8;
  *((_BYTE *)v36 + 44) = v32;
  v36[6] = v11;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseQualifiedType( void *a1)
{
  uint64_t v2 = (_BYTE *)*a1;
  if (*a1 == a1[1] || *v2 != 85)
  {
    if (v16 && v15)
    {
      __int16 v18 = *(_WORD *)((char *)v16 + 9);
      *((_BYTE *)v17 + ++*((_DWORD *)this + 8) = 3;
      *(_WORD *)((char *)v17 + 9) = *(_WORD *)((_BYTE *)v17 + 9) & 0xF000 | v18 & 0xFC0;
      *uint64_t v17 = off_18965A4E0;
      *((_DWORD *)v17 + 3) = v15;
      v17[2] = v16;
      return v17;
    }
  }

  else
  {
    *a1 = v2 + 1;
    if (!v4) {
      return 0LL;
    }
    int v11 = v3;
    unint64_t v12 = v4;
    if (v4 < 9 || (*(void *)v3 == 0x746F7270636A626FLL ? (BOOL v13 = v3[8] == 111) : (BOOL v13 = 0), !v13))
    {
      if (a1[1] == *a1 || *(_BYTE *)*a1 != 73)
      {
        uint64_t v14 = 0LL;
      }

      else
      {
        if (!v14) {
          return 0LL;
        }
      }

      if (v19)
      {
        uint64_t v20 = v19;
        *((_BYTE *)v16 + ++*((_DWORD *)this + 8) = 2;
        *(_WORD *)((char *)v16 + 9) = *(_WORD *)((_BYTE *)v16 + 9) & 0xF000 | 0x540;
        *uint64_t v16 = off_18965A470;
        v16[2] = v20;
        v16[3] = v11;
        v16[4] = v12;
        _BYTE v16[5] = v14;
        return v16;
      }

      return 0LL;
    }

    __int128 v28 = *(_OWORD *)a1;
    *a1 = v3 + 9;
    a1[1] = &v3[v4];
    *(_OWORD *)a1 = v28;
    if (!v22) {
      return 0LL;
    }
    uint64_t v23 = v21;
    uint64_t v24 = v22;
    if (!v25) {
      return 0LL;
    }
    uint64_t v26 = v25;
    *((_BYTE *)v16 + ++*((_DWORD *)this + 8) = 11;
    *(_WORD *)((char *)v16 + 9) = *(_WORD *)((_BYTE *)v16 + 9) & 0xF000 | 0x540;
    *uint64_t v16 = off_18965A400;
    v16[2] = v26;
    v16[3] = v23;
    v16[4] = v24;
  }

  return v16;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,char const(&)[12]>( uint64_t a1, const char *a2)
{
  size_t v4 = strlen(a2);
  *((_BYTE *)v3 + ++*((_DWORD *)this + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x540;
  *uint64_t v3 = off_1896580A0;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,char const(&)[14]>( uint64_t a1, const char *a2)
{
  size_t v4 = strlen(a2);
  *((_BYTE *)v3 + ++*((_DWORD *)this + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x540;
  *uint64_t v3 = off_1896580A0;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,char const(&)[10]>( uint64_t a1, const char *a2)
{
  size_t v4 = strlen(a2);
  *((_BYTE *)v3 + ++*((_DWORD *)this + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x540;
  *uint64_t v3 = off_1896580A0;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,char const(&)[9]>( uint64_t a1, const char *a2)
{
  size_t v4 = strlen(a2);
  *((_BYTE *)v3 + ++*((_DWORD *)this + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x540;
  *uint64_t v3 = off_1896580A0;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::NameType,char const(&)[11]>( uint64_t a1, const char *a2)
{
  size_t v4 = strlen(a2);
  *((_BYTE *)v3 + ++*((_DWORD *)this + 8) = 8;
  *(_WORD *)((char *)v3 + 9) = *(_WORD *)((_BYTE *)v3 + 9) & 0xF000 | 0x540;
  *uint64_t v3 = off_1896580A0;
  v3[2] = a2;
  v3[3] = v4;
  return v3;
}

void anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseVectorType( uint64_t a1)
{
  uint64_t v1 = *(char **)a1;
  uint64_t v2 = *(char **)(a1 + 8);
  *(void *)a1 = v1 + 2;
  if (v2 == v1 + 2 || v1[2] < 49) {
    goto LABEL_15;
  }
  unsigned int v4 = v1[2];
  if (v4 <= 0x39)
  {
    uint64_t v7 = v6;
    uint64_t v8 = (_anonymous_namespace_::BumpPointerAllocator *)(a1 + 808);
    *((_BYTE *)v9 + ++*((_DWORD *)this + 8) = 8;
    *(_WORD *)((char *)v9 + 9) = *(_WORD *)((_BYTE *)v9 + 9) & 0xF000 | 0x540;
    *uint64_t v9 = off_1896580A0;
    v9[2] = v5;
    v9[3] = v7;
    uint64_t v10 = *(char **)a1;
    int v11 = *(char **)(a1 + 8);
    if (*(char **)a1 != v11 && *v10 == 95)
    {
      unint64_t v12 = v9;
      *(void *)a1 = v10 + 1;
      if (v10 + 1 == v11 || v10[1] != 112)
      {
        if (v23)
        {
          uint64_t v24 = v23;
          *((_BYTE *)v25 + ++*((_DWORD *)this + 8) = 29;
          *(_WORD *)((char *)v25 + 9) = *(_WORD *)((_BYTE *)v25 + 9) & 0xF000 | 0x540;
          *uint64_t v25 = off_18965A780;
          v25[2] = v24;
          v25[3] = v12;
        }
      }

      else
      {
        *(void *)a1 = v10 + 2;
        *((_BYTE *)v13 + ++*((_DWORD *)this + 8) = 30;
        *(_WORD *)((char *)v13 + 9) = *(_WORD *)((_BYTE *)v13 + 9) & 0xF000 | 0x540;
        *BOOL v13 = off_18965A710;
        v13[2] = v12;
      }
    }

    return;
  }

  if (v4 != 95)
  {
LABEL_15:
    if (v17)
    {
      __int16 v18 = *(char **)a1;
      if (*(void *)a1 != *(void *)(a1 + 8) && *v18 == 95)
      {
        uint64_t v19 = v17;
        *(void *)a1 = v18 + 1;
        if (v20)
        {
          uint64_t v21 = v20;
          *((_BYTE *)v22 + ++*((_DWORD *)this + 8) = 29;
          *(_WORD *)((char *)v22 + 9) = *(_WORD *)((_BYTE *)v22 + 9) & 0xF000 | 0x540;
          *uint64_t v22 = off_18965A780;
          v22[2] = v21;
          v22[3] = v19;
        }
      }
    }
  }

  else
  {
    *(void *)a1 = v1 + 3;
    if (v14)
    {
      uint64_t v15 = v14;
      *((_BYTE *)v16 + ++*((_DWORD *)this + 8) = 29;
      *(_WORD *)((char *)v16 + 9) = *(_WORD *)((_BYTE *)v16 + 9) & 0xF000 | 0x540;
      *uint64_t v16 = off_18965A780;
      v16[2] = v15;
      v16[3] = 0LL;
    }
  }

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::parseClassEnumType( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = (_WORD *)*a1;
  if (a1[1] - *a1 < 2uLL) {
  switch(*v9)
  }
  {
    case 0x7354:
      int v11 = "struct";
      uint64_t v12 = 6LL;
      break;
    case 0x7554:
      int v11 = "union";
      uint64_t v12 = 5LL;
      break;
    case 0x6554:
      int v11 = "enum";
      uint64_t v12 = 4LL;
      break;
    default:
  }

  *a1 = v9 + 1;
  if (result)
  {
    BOOL v13 = result;
    *((_BYTE *)result + ++*((_DWORD *)this + 8) = 6;
    *(_WORD *)((char *)result + 9) = *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x540;
    *uint64_t result = off_18965A8D0;
    result[2] = v11;
    result[3] = v12;
    result[4] = v13;
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::PointerType,anonymous namespace'::itanium_demangle::Node *&>( uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  char v5 = *(_WORD *)(*a2 + 9);
  *((_BYTE *)result + ++*((_DWORD *)this + 8) = 12;
  *(_WORD *)((char *)result + 9) = v5 & 0xC0 | *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x500;
  *uint64_t result = off_18965A940;
  result[2] = v4;
  return result;
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::ReferenceType,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::ReferenceKind>( uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  int v7 = *a3;
  char v8 = *(_WORD *)(*a2 + 9);
  *((_BYTE *)result + ++*((_DWORD *)this + 8) = 13;
  *(_WORD *)((char *)result + 9) = v8 & 0xC0 | *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x500;
  *uint64_t result = off_18965A9B0;
  result[2] = v6;
  *((_DWORD *)result + 6) = v7;
  *((_BYTE *)result + 2++*((_DWORD *)this + 8) = 0;
  return result;
}

void *anonymous namespace'::itanium_demangle::NoexceptSpec::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  *(void *)(*(void *)this + *((void *)this + 1)) = 0x7470656378656F6ELL;
  *((void *)this + 1) += 8LL;
  ++*((_DWORD *)this + 8);
  uint64_t v4 = *(void *)this;
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = v5 + 1;
  *(_BYTE *)(v4 + v5) = 40;
  --*((_DWORD *)this + 8);
  uint64_t v7 = *(void *)this;
  uint64_t v8 = *((void *)this + 1);
  *((void *)this + 1) = v8 + 1;
  *(_BYTE *)(v7 + v++*((_DWORD *)this + 8) = 41;
  return result;
}

void *anonymous namespace'::itanium_demangle::DynamicExceptionSpec::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(_BYTE *)(v4 + 4) = 119;
  *(_DWORD *)uint64_t v4 = 1869768820;
  *((void *)this + 1) += 5LL;
  ++*((_DWORD *)this + 8);
  uint64_t v5 = *(void *)this;
  uint64_t v6 = *((void *)this + 1);
  *((void *)this + 1) = v6 + 1;
  *(_BYTE *)(v5 + v6) = 40;
  --*((_DWORD *)this + 8);
  uint64_t v8 = *(void *)this;
  uint64_t v9 = *((void *)this + 1);
  *((void *)this + 1) = v9 + 1;
  *(_BYTE *)(v8 + v9) = 41;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::FunctionType::hasRHSComponentSlow()
{
  return 1LL;
}

uint64_t anonymous namespace'::itanium_demangle::FunctionType::hasFunctionSlow()
{
  return 1LL;
}

void *anonymous namespace'::itanium_demangle::FunctionType::printLeft(uint64_t a1, void *a2)
{
  *(_BYTE *)(*a2 + a2[1]++) = 32;
  return result;
}

void *anonymous namespace'::itanium_demangle::FunctionType::printRight( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this;
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = v5 + 1;
  *(_BYTE *)(v4 + v5) = 40;
  --*((_DWORD *)this + 8);
  uint64_t v6 = *(void *)this;
  uint64_t v7 = *((void *)this + 1);
  *((void *)this + 1) = v7 + 1;
  *(_BYTE *)(v6 + v7) = 41;
  uint64_t result = (void *)(*(uint64_t (**)(void, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(**(void **)(a1 + 16) + 40LL))( *(void *)(a1 + 16),  this);
  int v9 = *(_DWORD *)(a1 + 40);
  if ((v9 & 1) != 0)
  {
    uint64_t v13 = *(void *)this + *((void *)this + 1);
    *(_WORD *)(v13 + 4) = 29811;
    *(_DWORD *)uint64_t v13 = 1852793632;
    *((void *)this + 1) += 6LL;
    int v9 = *(_DWORD *)(a1 + 40);
    if ((v9 & 2) == 0)
    {
LABEL_3:
      if ((v9 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }

  else if ((v9 & 2) == 0)
  {
    goto LABEL_3;
  }

  uint64_t v14 = *(void *)this + *((void *)this + 1);
  *(void *)uint64_t v14 = *(void *)" volatile";
  *(_BYTE *)(v14 + ++*((_DWORD *)this + 8) = 101;
  *((void *)this + 1) += 9LL;
  if ((*(_DWORD *)(a1 + 40) & 4) != 0)
  {
LABEL_4:
    uint64_t v10 = *(void *)this + *((void *)this + 1);
    *(void *)uint64_t v10 = *(void *)" restrict";
    *(_BYTE *)(v10 + ++*((_DWORD *)this + 8) = 116;
    *((void *)this + 1) += 9LL;
  }

LABEL_5:
  int v11 = *(unsigned __int8 *)(a1 + 44);
  if (v11 == 2)
  {
    uint64_t v12 = 3LL;
    uint64_t v15 = *(void *)this + *((void *)this + 1);
    *(_BYTE *)(v15 + 2) = 38;
    *(_WORD *)uint64_t v15 = 9760;
  }

  else
  {
    if (v11 != 1) {
      goto LABEL_13;
    }
    uint64_t v12 = 2LL;
    *(_WORD *)(*(void *)this + *((void *)this + 1)) = 9760;
  }

  *((void *)this + 1) += v12;
LABEL_13:
  if (*(void *)(a1 + 48))
  {
    uint64_t v16 = *(void *)this;
    uint64_t v17 = *((void *)this + 1);
    *((void *)this + 1) = v17 + 1;
    *(_BYTE *)(v16 + v17) = 32;
    uint64_t v18 = *(void *)(a1 + 48);
    uint64_t result = (void *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v18 + 32LL))( v18,  this);
    if ((*(_WORD *)(v18 + 9) & 0xC0) != 0x40) {
      return (void *)(*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v18 + 40LL))( v18,  this);
    }
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::ObjCProtoName::printLeft(void *a1, void *a2)
{
  uint64_t v4 = a1[2];
  (*(void (**)(uint64_t))(*(void *)v4 + 32LL))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, void *))(*(void *)v4 + 40LL))(v4, a2);
  }
  *(_BYTE *)(*a2 + a2[1]++) = 60;
  size_t v5 = a1[4];
  if (v5)
  {
    uint64_t v6 = (const void *)a1[3];
    memcpy((void *)(*a2 + a2[1]), v6, v5);
    a2[1] += v5;
  }

  *(_BYTE *)(*a2 + a2[1]++) = 62;
  return result;
}

void *anonymous namespace'::itanium_demangle::VendorExtQualType::printLeft(void *a1, void *a2)
{
  uint64_t v4 = a1[2];
  (*(void (**)(uint64_t))(*(void *)v4 + 32LL))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, void *))(*(void *)v4 + 40LL))(v4, a2);
  }
  *(_BYTE *)(*a2 + a2[1]++) = 32;
  size_t v6 = a1[4];
  if (v6)
  {
    uint64_t v7 = (const void *)a1[3];
    uint64_t result = memcpy((void *)(*a2 + a2[1]), v7, v6);
    a2[1] += v6;
  }

  uint64_t v8 = a1[5];
  if (v8)
  {
    uint64_t result = (void *)(*(uint64_t (**)(uint64_t, void *))(*(void *)v8 + 32LL))(v8, a2);
    if ((*(_WORD *)(v8 + 9) & 0xC0) != 0x40) {
      return (void *)(*(uint64_t (**)(uint64_t, void *))(*(void *)v8 + 40LL))(v8, a2);
    }
  }

  return result;
}

uint64_t anonymous namespace'::itanium_demangle::QualType::hasRHSComponentSlow(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  unsigned int v2 = *(unsigned __int8 *)(v1 + 9);
  if ((v2 & 0xC0) == 0x80) {
    return (**(uint64_t (***)(uint64_t))v1)(v1);
  }
  else {
    return v2 < 0x40;
  }
}

uint64_t anonymous namespace'::itanium_demangle::QualType::hasArraySlow(uint64_t a1)
{
  uint64_t v1 = *(_BYTE **)(a1 + 16);
  int v2 = v1[10] & 3;
  if (v2 == 2) {
    return (*(uint64_t (**)(_BYTE *))(*(void *)v1 + 8LL))(v1);
  }
  else {
    return v2 == 0;
  }
}

uint64_t anonymous namespace'::itanium_demangle::QualType::hasFunctionSlow(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  int v2 = (*(unsigned __int16 *)(v1 + 9) >> 10) & 3;
  if (v2 == 2) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 16LL))(v1);
  }
  else {
    return v2 == 0;
  }
}

void *anonymous namespace'::itanium_demangle::QualType::printLeft(uint64_t a1, void *a2)
{
  uint64_t result = (void *)(*(uint64_t (**)(void))(**(void **)(a1 + 16) + 32LL))(*(void *)(a1 + 16));
  int v5 = *(_DWORD *)(a1 + 12);
  if ((v5 & 1) != 0)
  {
    uint64_t v7 = *a2 + a2[1];
    *(_WORD *)(v7 + 4) = 29811;
    *(_DWORD *)uint64_t v7 = 1852793632;
    a2[1] += 6LL;
    int v5 = *(_DWORD *)(a1 + 12);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }

  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }

  uint64_t v8 = *a2 + a2[1];
  *(void *)uint64_t v8 = *(void *)" volatile";
  *(_BYTE *)(v8 + ++*((_DWORD *)this + 8) = 101;
  a2[1] += 9LL;
  if ((*(_DWORD *)(a1 + 12) & 4) == 0) {
    return result;
  }
LABEL_4:
  uint64_t v6 = *a2 + a2[1];
  *(void *)uint64_t v6 = *(void *)" restrict";
  *(_BYTE *)(v6 + ++*((_DWORD *)this + 8) = 116;
  a2[1] += 9LL;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::QualType::printRight(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 40LL))(*(void *)(a1 + 16));
}

void *anonymous namespace'::itanium_demangle::TransformedType::printLeft( void *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v4 = a1[3];
  if (v4)
  {
    int v5 = (const void *)a1[2];
    memcpy((void *)(*(void *)this + *((void *)this + 1)), v5, v4);
    *((void *)this + 1) += v4;
  }

  uint64_t v6 = *(void *)this;
  uint64_t v7 = *((void *)this + 1);
  *((void *)this + 1) = v7 + 1;
  *(_BYTE *)(v6 + v7) = 40;
  uint64_t v8 = a1[4];
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v8 + 32LL))( v8,  this);
  if ((*(_WORD *)(v8 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v8 + 40LL))( v8,  this);
  }
  uint64_t v10 = *(void *)this;
  uint64_t v11 = *((void *)this + 1);
  *((void *)this + 1) = v11 + 1;
  *(_BYTE *)(v10 + v11) = 41;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::BinaryFPType::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)this + *((void *)this + 1);
  *(_WORD *)(v4 + 4) = 29793;
  *(_DWORD *)uint64_t v4 = 1869366879;
  *((void *)this + 1) += 6LL;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v5 + 32LL))( v5,  this);
  if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v5 + 40LL))( v5,  this);
  }
  return result;
}

void *anonymous namespace'::itanium_demangle::BitIntType::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  if (!*(_BYTE *)(a1 + 24))
  {
    uint64_t v4 = *(void *)this + *((void *)this + 1);
    *(void *)uint64_t v4 = *(void *)"unsigned ";
    *(_BYTE *)(v4 + ++*((_DWORD *)this + 8) = 32;
    *((void *)this + 1) += 9LL;
  }

  uint64_t v5 = (_DWORD *)(*(void *)this + *((void *)this + 1));
  *(_DWORD *)((char *)v5 + 3) = 1953384820;
  *uint64_t v5 = 1953055327;
  *((void *)this + 1) += 7LL;
  ++*((_DWORD *)this + 8);
  uint64_t v6 = *(void *)this;
  uint64_t v7 = *((void *)this + 1);
  *((void *)this + 1) = v7 + 1;
  *(_BYTE *)(v6 + v7) = 40;
  --*((_DWORD *)this + 8);
  uint64_t v9 = *(void *)this;
  uint64_t v10 = *((void *)this + 1);
  *((void *)this + 1) = v10 + 1;
  *(_BYTE *)(v9 + v10) = 41;
  return result;
}

void *anonymous namespace'::itanium_demangle::PostfixQualifiedType::printLeft(uint64_t a1, void *a2)
{
  uint64_t result = (void *)(*(uint64_t (**)(void))(**(void **)(a1 + 16) + 32LL))(*(void *)(a1 + 16));
  size_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = *(const void **)(a1 + 24);
    uint64_t result = memcpy((void *)(*a2 + a2[1]), v6, v5);
    a2[1] += v5;
  }

  return result;
}

void *anonymous namespace'::itanium_demangle::PixelVectorType::printLeft( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  *((void *)this + 1) += 13LL;
  uint64_t v4 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v4 + 32LL))( v4,  this);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v4 + 40LL))( v4,  this);
  }
  *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 93;
  return result;
}

void *anonymous namespace'::itanium_demangle::VectorType::printLeft(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t))(*(void *)v4 + 32LL))(v4);
  if ((*(_WORD *)(v4 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, void *))(*(void *)v4 + 40LL))(v4, a2);
  }
  *(void *)(*a2 + a2[1]) = 0x5B726F7463657620LL;
  a2[1] += 8LL;
  uint64_t v5 = *(void *)(a1 + 24);
  if (v5)
  {
    (*(void (**)(uint64_t, void *))(*(void *)v5 + 32LL))(v5, a2);
    if ((*(_WORD *)(v5 + 9) & 0xC0) != 0x40) {
      (*(void (**)(uint64_t, void *))(*(void *)v5 + 40LL))(v5, a2);
    }
  }

  *(_BYTE *)(*a2 + a2[1]++) = 93;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::ArrayType::hasRHSComponentSlow()
{
  return 1LL;
}

uint64_t anonymous namespace'::itanium_demangle::ArrayType::hasArraySlow()
{
  return 1LL;
}

uint64_t anonymous namespace'::itanium_demangle::ArrayType::printLeft(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 32LL))(*(void *)(a1 + 16));
}

uint64_t anonymous namespace'::itanium_demangle::ArrayType::printRight( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *((void *)this + 1);
  if (!v8) {
    abort_message( "%s:%d: %s",  (uint64_t)this,  a3,  a4,  a5,  a6,  a7,  a8,  (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/Utility.h");
  }
  if (*(_BYTE *)(v8 + *(void *)this - 1) != 93)
  {
    *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 32;
  }

  *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 91;
  uint64_t v11 = *(void *)(a1 + 24);
  if (v11)
  {
    (*(void (**)(void, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v11 + 32LL))( *(void *)(a1 + 24),  this);
    if ((*(_WORD *)(v11 + 9) & 0xC0) != 0x40) {
      (*(void (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v11 + 40LL))( v11,  this);
    }
  }

  *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 93;
  return (*(uint64_t (**)(void, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(**(void **)(a1 + 16) + 40LL))( *(void *)(a1 + 16),  this);
}

void *anonymous namespace'::itanium_demangle::AbstractManglingParser<anonymous namespace'::itanium_demangle::ManglingParser<anonymous namespace'::DefaultAllocator>,anonymous namespace'::DefaultAllocator>::make<anonymous namespace'::itanium_demangle::PointerToMemberType,anonymous namespace'::itanium_demangle::Node *&,anonymous namespace'::itanium_demangle::Node *&>( uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a3;
  char v8 = *(_WORD *)(*a3 + 9);
  *((_BYTE *)result + ++*((_DWORD *)this + 8) = 14;
  *(_WORD *)((char *)result + 9) = v8 & 0xC0 | *(_WORD *)((_BYTE *)result + 9) & 0xF000 | 0x500;
  *uint64_t result = off_18965A860;
  result[2] = v6;
  result[3] = v7;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::PointerToMemberType::hasRHSComponentSlow(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  unsigned int v2 = *(unsigned __int8 *)(v1 + 9);
  if ((v2 & 0xC0) == 0x80) {
    return (**(uint64_t (***)(uint64_t))v1)(v1);
  }
  else {
    return v2 < 0x40;
  }
}

void *anonymous namespace'::itanium_demangle::PointerToMemberType::printLeft(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  unsigned int v5 = *(unsigned __int16 *)(v4 + 9);
  int v6 = (v5 >> 8) & 3;
  if (!v6) {
    goto LABEL_8;
  }
  if (v6 == 2)
  {
    if (((*(uint64_t (**)(uint64_t, void *))(*(void *)v4 + 8LL))(v4, a2) & 1) != 0)
    {
LABEL_8:
      char v8 = 40;
      goto LABEL_10;
    }

    uint64_t v4 = *(void *)(a1 + 24);
    unsigned int v5 = *(unsigned __int16 *)(v4 + 9);
  }

  int v7 = (v5 >> 10) & 3;
  char v8 = 32;
LABEL_10:
  *(_BYTE *)(*a2 + a2[1]++) = v8;
  uint64_t v9 = *(void *)(a1 + 16);
  (*(void (**)(uint64_t, void *))(*(void *)v9 + 32LL))(v9, a2);
  if ((*(_WORD *)(v9 + 9) & 0xC0) != 0x40) {
    (*(void (**)(uint64_t, void *))(*(void *)v9 + 40LL))(v9, a2);
  }
  uint64_t v11 = *a2 + a2[1];
  *(_BYTE *)(v11 + 2) = 42;
  *(_WORD *)uint64_t v11 = 14906;
  a2[1] += 3LL;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::PointerToMemberType::printRight( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(void *)(a1 + 24);
  unsigned int v5 = *(unsigned __int16 *)(v4 + 9);
  int v6 = (v5 >> 8) & 3;
  if (!v6) {
    goto LABEL_8;
  }
  if (v6 == 2)
  {
    if (((*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v4 + 8LL))( v4,  this) & 1) != 0)
    {
LABEL_8:
      *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 41;
      return (*(uint64_t (**)(void, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  this);
    }

    uint64_t v4 = *(void *)(a1 + 24);
    unsigned int v5 = *(unsigned __int16 *)(v4 + 9);
  }

  int v7 = (v5 >> 10) & 3;
  if (!v7
    || v7 == 2
    && (*(unsigned int (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v4 + 16LL))( v4,  this))
  {
    goto LABEL_8;
  }

  return (*(uint64_t (**)(void, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(**(void **)(a1 + 24) + 40LL))( *(void *)(a1 + 24),  this);
}

uint64_t anonymous namespace'::itanium_demangle::ElaboratedTypeSpefType::printLeft( void *a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  size_t v4 = a1[3];
  if (v4)
  {
    unsigned int v5 = (const void *)a1[2];
    memcpy((void *)(*(void *)this + *((void *)this + 1)), v5, v4);
    *((void *)this + 1) += v4;
  }

  uint64_t v6 = *(void *)this;
  uint64_t v7 = *((void *)this + 1);
  *((void *)this + 1) = v7 + 1;
  *(_BYTE *)(v6 + v7) = 32;
  uint64_t v8 = a1[4];
  uint64_t result = (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v8 + 32LL))( v8,  this);
  if ((*(_WORD *)(v8 + 9) & 0xC0) != 0x40) {
    return (*(uint64_t (**)(uint64_t, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v8 + 40LL))( v8,  this);
  }
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::PointerType::hasRHSComponentSlow(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  unsigned int v2 = *(unsigned __int8 *)(v1 + 9);
  if ((v2 & 0xC0) == 0x80) {
    return (**(uint64_t (***)(uint64_t))v1)(v1);
  }
  else {
    return v2 < 0x40;
  }
}

void *anonymous namespace'::itanium_demangle::PointerType::printLeft(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (*(_BYTE *)(v4 + 8) != 11
  {
    (*(void (**)(uint64_t, void *))(*(void *)v4 + 32LL))(v4, a2);
    uint64_t v10 = *(_BYTE **)(a1 + 16);
    if ((v10[10] & 3) == 0
      || (v10[10] & 3) == 2 && (*(unsigned int (**)(_BYTE *, void *))(*(void *)v10 + 8LL))(v10, a2))
    {
      *(_BYTE *)(*a2 + a2[1]++) = 32;
    }

    uint64_t v11 = *(void *)(a1 + 16);
    unsigned int v12 = *(unsigned __int16 *)(v11 + 9);
    int v13 = (v12 >> 8) & 3;
    if (v13)
    {
      if (v13 != 2)
      {
LABEL_14:
        int v14 = (v12 >> 10) & 3;
        goto LABEL_17;
      }

      if (((*(uint64_t (**)(uint64_t, void *))(*(void *)v11 + 8LL))(v11, a2) & 1) == 0)
      {
        uint64_t v11 = *(void *)(a1 + 16);
        unsigned int v12 = *(unsigned __int16 *)(v11 + 9);
        goto LABEL_14;
      }
    }

LABEL_17:
    *(_BYTE *)(*a2 + a2[1]++) = 40;
LABEL_18:
    char v9 = 42;
    goto LABEL_19;
  }

  uint64_t v5 = *a2 + a2[1];
  *(_BYTE *)(v5 + 2) = 60;
  *(_WORD *)uint64_t v5 = 25705;
  a2[1] += 3LL;
  size_t v6 = *(void *)(v4 + 32);
  if (v6)
  {
    uint64_t v7 = *(const void **)(v4 + 24);
    memcpy((void *)(*a2 + a2[1]), v7, v6);
    a2[1] += v6;
  }

  char v9 = 62;
LABEL_19:
  *(_BYTE *)(*a2 + a2[1]++) = v9;
  return result;
}

uint64_t anonymous namespace'::itanium_demangle::PointerType::printRight( uint64_t a1, _anonymous_namespace_::itanium_demangle::OutputBuffer *this)
{
  uint64_t v4 = *(_BYTE **)(a1 + 16);
  if (v4[8] != 11
        (result & 1) == 0))
  {
    unsigned int v6 = *(unsigned __int16 *)(v4 + 9);
    int v7 = (v6 >> 8) & 3;
    if (v7)
    {
      if (v7 != 2)
      {
LABEL_7:
        int v8 = (v6 >> 10) & 3;
        if (v8
          && (v8 != 2
           || !(*(unsigned int (**)(_BYTE *, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v4 + 16LL))( v4,  this)))
        {
          return (*(uint64_t (**)(void, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(**(void **)(a1 + 16) + 40LL))( *(void *)(a1 + 16),  this);
        }

        goto LABEL_10;
      }

      if (((*(uint64_t (**)(_BYTE *, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(*(void *)v4 + 8LL))( v4,  this) & 1) == 0)
      {
        uint64_t v4 = *(_BYTE **)(a1 + 16);
        unsigned int v6 = *(unsigned __int16 *)(v4 + 9);
        goto LABEL_7;
      }
    }

LABEL_10:
    *(_BYTE *)(*(void *)this + (*((void *)this + 1))++) = 41;
    return (*(uint64_t (**)(void, _anonymous_namespace_::itanium_demangle::OutputBuffer *))(**(void **)(a1 + 16) + 40LL))( *(void *)(a1 + 16),  this);
  }

  return result;
}

    *(_BYTE *)(*a2 + a2[1]++) = 41;
LABEL_11:
    uint64_t result = (*(uint64_t (**)(uint64_t, void *))(*(void *)v5 + 40LL))(v5, a2);
    goto LABEL_12;
  }

  return result;
}

BOOL anonymous namespace'::itanium_demangle::ObjCProtoName::isObjCObject( _anonymous_namespace_::itanium_demangle::ObjCProtoName *this)
{
  uint64_t v1 = *((void *)this + 2);
  if (*(_BYTE *)(v1 + 8) != 8 || *(void *)(v1 + 24) != 11LL) {
    return 0LL;
  }
  unsigned int v2 = *(uint64_t **)(v1 + 16);
  uint64_t v3 = *v2;
  uint64_t v4 = *(uint64_t *)((char *)v2 + 3);
  return v3 == 0x6A626F5F636A626FLL && v4 == 0x7463656A626F5F63LL;
}

uint64_t anonymous namespace'::itanium_demangle::ReferenceType::hasRHSComponentSlow(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  unsigned int v2 = *(unsigned __int8 *)(v1 + 9);
  if ((v2 & 0xC0) == 0x80) {
    return (**(uint64_t (***)(uint64_t))v1)(v1);
  }
  else {
    return v2 < 0x40;
  }
}

uint64_t anonymous namespace'::itanium_demangle::ReferenceType::printLeft(uint64_t result, void *a2)
{
  if (!*(_BYTE *)(result + 28))
  {
    uint64_t v3 = result;
    *(_BYTE *)(result + 2++*((_DWORD *)this + 8) = 1;
    uint64_t v5 = v4;
    if (!v4)
    {
LABEL_22:
      *(_BYTE *)(v3 + 2++*((_DWORD *)this + 8) = 0;
      return result;
    }

    unsigned int v6 = result;
    (*(void (**)(uint64_t, void *))(*(void *)v4 + 32LL))(v4, a2);
    if ((*(_BYTE *)(v5 + 10) & 3) == 0
      || (*(_BYTE *)(v5 + 10) & 3) == 2
      && (*(unsigned int (**)(uint64_t, void *))(*(void *)v5 + 8LL))(v5, a2))
    {
      *(_BYTE *)(*a2 + a2[1]++) = 32;
    }

    unsigned int v7 = *(unsigned __int16 *)(v5 + 9);
    int v8 = (v7 >> 8) & 3;
    if (!v8) {
      goto LABEL_14;
    }
    if (v8 == 2)
    {
      unsigned int v7 = *(unsigned __int16 *)(v5 + 9);
    }

    int v9 = (v7 >> 10) & 3;
    if (v9 && (v9 != 2 || !(*(unsigned int (**)(uint64_t, void *))(*(void *)v5 + 16LL))(v5, a2)))
    {
LABEL_15:
      uint64_t v10 = v6;
      if (v6) {
        size_t v11 = 2LL;
      }
      else {
        size_t v11 = 1LL;
      }
      if (v10) {
        unsigned int v12 = "&&";
      }
      else {
        unsigned int v12 = "&";
      }
      uint64_t result = (uint64_t)memcpy((void *)(*a2 + a2[1]), v12, v11);
      a2[1] += v11;
      goto LABEL_22;
    }

LABEL_14:
    *(_BYTE *)(*a2 + a2[1]++) = 40;
    goto LABEL_15;
  }

  return result;
}

void sub_18041E384(_Unwind_Exception *a1)
{
  *(_BYTE *)(v1 + 2++*((_DWORD *)this + 8) = 0;
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::itanium_demangle::ReferenceType::printRight(uint64_t result, void *a2)
{
  if (!*(_BYTE *)(result + 28))
  {
    uint64_t v3 = result;
    *(_BYTE *)(result + 2++*((_DWORD *)this + 8) = 1;
    uint64_t v5 = v4;
    if (!v4)
    {
LABEL_12:
      *(_BYTE *)(v3 + 2++*((_DWORD *)this + 8) = 0;
      return result;
    }

    unsigned int v6 = *(unsigned __int16 *)(v4 + 9);
    int v7 = (v6 >> 8) & 3;
    if (v7)
    {
      if (v7 != 2)
      {
LABEL_7:
        int v8 = (v6 >> 10) & 3;
        goto LABEL_10;
      }

      if (((*(uint64_t (**)(uint64_t, void *))(*(void *)v4 + 8LL))(v4, a2) & 1) == 0)
      {
        unsigned int v6 = *(unsigned __int16 *)(v5 + 9);
        goto LABEL_7;
      }
    }

void sub_18041E468(_Unwind_Exception *a1)
{
  *(_BYTE *)(v1 + 2++*((_DWORD *)this + 8) = 0;
  _Unwind_Resume(a1);
}

uint64_t anonymous namespace'::itanium_demangle::ReferenceType::collapse(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(_DWORD *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 16);
  __ptr = (char *)v25;
  uint64_t v23 = (char *)v25;
  uint64_t v24 = (char *)&v26;
  memset(v25, 0, sizeof(v25));
  while (1)
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v4 + 24LL))(v4, a2);
    if (*(_BYTE *)(v5 + 8) != 13) {
      break;
    }
    uint64_t v4 = *(void *)(v5 + 16);
    int v13 = v23;
    if (v23 == v24)
    {
      int64_t v14 = v23 - __ptr;
      if (__ptr == (char *)v25)
      {
        uint64_t v16 = (char *)malloc(2 * (v23 - __ptr));
        if (!v16) {
LABEL_23:
        }
          abort();
        uint64_t v15 = v16;
        __ptr = v15;
      }

      else
      {
        uint64_t v15 = (char *)realloc(__ptr, 2 * (v23 - __ptr));
        __ptr = v15;
        if (!v15) {
          goto LABEL_23;
        }
      }

      int v13 = &v15[8 * (v14 >> 3)];
      uint64_t v24 = &v15[8 * (v14 >> 2)];
    }

    uint64_t v23 = v13 + 8;
    *(void *)int v13 = v4;
    uint64_t v17 = __ptr;
    uint64_t v18 = v13 + 8 - __ptr;
    if ((unint64_t)v18 >= 9)
    {
      unint64_t v19 = v18 >> 3;
      unint64_t v20 = (v18 >> 3) - 1;
      if (v19 <= v20 >> 1) {
        abort_message( "%s:%d: %s",  v6,  v7,  v8,  v9,  v10,  v11,  v12,  (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/demangle/ItaniumDemangle.h");
      }
      if (v4 == *(void *)&__ptr[8 * (v20 >> 1)]) {
        goto LABEL_19;
      }
    }
  }

  uint64_t v17 = __ptr;
LABEL_19:
  return v3;
}

void sub_18041E610( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  if (a12 != v12) {
    free(a12);
  }
  _Unwind_Resume(exception_object);
}

void *__cxa_get_globals()
{
  globals_fast = __cxa_get_globals_fast();
  if (!globals_fast)
  {
    uint64_t v1 = __cxxabiv1::__calloc_with_fallback(1uLL, 0x10uLL);
    if (!v1) {
      abort_message("cannot allocate __cxa_eh_globals", v2, v3, v4, v5, v6, v7, v8, v17);
    }
    globals_fast = v1;
      abort_message("std::__libcpp_tls_set failure in __cxa_get_globals()", v9, v10, v11, v12, v13, v14, v15, v17);
  }

  return globals_fast;
}

void *__cxa_get_globals_fast()
{
  {
    abort_message("execute once failure in __cxa_get_globals_fast()", v0, v1, v2, v3, v4, v5, v6, vars0);
  }
}

uint64_t __cxxabiv1::anonymous namespace'::construct_(__cxxabiv1::_anonymous_namespace_ *this)
{
  if ((_DWORD)result) {
    abort_message("cannot create thread specific key for __cxa_get_globals()", v2, v3, v4, v5, v6, v7, v8, vars0);
  }
  return result;
}

uint64_t __cxxabiv1::anonymous namespace'::destruct_(__cxxabiv1::_anonymous_namespace_ *this, void *a2)
{
  if ((_DWORD)result) {
    abort_message("cannot zero out thread value for __cxa_get_globals()", v3, v4, v5, v6, v7, v8, v9, vars0);
  }
  return result;
}

void *__cxxabiv1::anonymous namespace'::InitByteGlobalMutex<__cxxabiv1::anonymous namespace'::LibcppMutex,__cxxabiv1::anonymous namespace'::LibcppCondVar,__cxxabiv1::anonymous namespace'::GlobalStatic<__cxxabiv1::anonymous namespace'::LibcppMutex>::instance,__cxxabiv1::anonymous namespace'::GlobalStatic<__cxxabiv1::anonymous namespace'::LibcppCondVar>::instance,&__cxxabiv1::anonymous namespace'::PlatformThreadID>::LockGuard::~LockGuard( void *a1)
{
  if (pthread_mutex_unlock(&stru_18C439E48)) {
    abort_message("%s failed to release mutex", v2, v3, v4, v5, v6, v7, v8, *a1);
  }
  return a1;
}

  ;
}

void *OUTLINED_FUNCTION_1(uint64_t a1, ...)
{
}

std::unexpected_handler std::get_unexpected(void)
{
  return (std::unexpected_handler)atomic_load((unint64_t *)&__cxa_unexpected_handler);
}

void std::terminate(void)
{
  globals_fast = (uint64_t *)__cxa_get_globals_fast();
  if (globals_fast)
  {
    uint64_t v1 = *globals_fast;
    if (*globals_fast)
    {
      if (__cxxabiv1::__isOurExceptionClass((const _Unwind_Exception *)(v1 + 96))) {
        std::__terminate(*(void (**)(void))(v1 + 40));
      }
    }
  }

  terminate = std::get_terminate();
  std::__terminate(terminate);
}

void std::__unexpected(void (*a1)(void))
{
  abort_message("unexpected_handler unexpectedly returned", v1, v2, v3, v4, v5, v6, v7, vars0);
}

void std::unexpected(void)
{
  uint64_t v0 = (void (*)(void))atomic_load((unint64_t *)&__cxa_unexpected_handler);
  std::__unexpected(v0);
}

std::terminate_handler std::get_terminate(void)
{
  return (std::terminate_handler)atomic_load((unint64_t *)&__cxa_terminate_handler);
}

void std::__terminate(void (*a1)(void))
{
  abort_message("terminate_handler unexpectedly returned", v1, v2, v3, v4, v5, v6, v7, vars0);
}

void sub_18041E848()
{
}

std::new_handler std::get_new_handler(void)
{
  return (std::new_handler)atomic_load(&__cxa_new_handler);
}

void *__cxa_vec_new( size_t element_count, size_t element_size, size_t padding_size, __cxa_cdtor_type constructor, __cxa_cdtor_type destructor)
{
  if (!is_mul_ok(element_count, element_size)
    || (size_t v7 = element_count,
        BOOL v8 = __CFADD__(element_count * element_size, padding_size),
        element_count = element_count * element_size + padding_size,
        v8))
  {
  }

  uint64_t v11 = (char *)operator new[](element_count);
  uint64_t v12 = v11;
  if (padding_size)
  {
    uint64_t v12 = &v11[padding_size];
    *(void *)&v11[padding_size - 8] = v7;
  }

  __cxa_vec_ctor(v12, v7, element_size, constructor, destructor);
  return v12;
}

void sub_18041E908(_Unwind_Exception *a1)
{
}

void *__cxa_vec_new2( size_t element_count, size_t element_size, size_t padding_size, __cxa_cdtor_type constructor, __cxa_cdtor_type destructor, void *(*alloc)(size_t), void (*dealloc)(void *))
{
  if (!is_mul_ok(element_count, element_size)
    || (size_t v9 = element_count,
        BOOL v10 = __CFADD__(element_count * element_size, padding_size),
        element_count = element_count * element_size + padding_size,
        v10))
  {
  }

  uint64_t v13 = (char *)alloc(element_count);
  if (!v13) {
    return 0LL;
  }
  uint64_t v14 = v13;
  if (padding_size)
  {
    uint64_t v14 = &v13[padding_size];
    *(void *)&v13[padding_size - 8] = v9;
  }

  __cxa_vec_ctor(v14, v9, element_size, constructor, destructor);
  return v14;
}

void sub_18041E9C0(_Unwind_Exception *a1)
{
}

__cxa_vec_ctor_return_type __cxa_vec_ctor( void *array_address, size_t element_count, size_t element_size, __cxa_cdtor_type constructor, __cxa_cdtor_type destructor)
{
  if (constructor)
  {
    size_t v7 = (char *)array_address;
    v9[0] = array_address;
    v9[1] = &i;
    v9[2] = element_size;
    v9[3] = destructor;
    char v10 = 1;
    for (size_t i = 0LL; i < element_count; v7 += element_size)
    {
      constructor(v7);
      ++i;
    }

    char v10 = 0;
  }

void sub_18041EA5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *__cxa_vec_new3( size_t element_count, size_t element_size, size_t padding_size, __cxa_cdtor_type constructor, __cxa_cdtor_type destructor, void *(*alloc)(size_t), void (*dealloc)(void *, size_t))
{
  if (!is_mul_ok(element_count, element_size) || __CFADD__(element_count * element_size, padding_size)) {
  uint64_t v12 = (char *)alloc(element_count * element_size + padding_size);
  }
  if (!v12) {
    return 0LL;
  }
  uint64_t v13 = v12;
  if (padding_size)
  {
    uint64_t v13 = &v12[padding_size];
    *(void *)&v12[padding_size - 8] = element_count;
  }

  __cxa_vec_ctor(v13, element_count, element_size, constructor, destructor);
  return v13;
}

void sub_18041EB20(_Unwind_Exception *a1)
{
}

__cxa_vec_ctor_return_type __cxa_vec_cctor( void *dest_array, void *src_array, size_t element_count, size_t element_size, __cxa_cdtor_return_type (*constructor)(void *, void *), __cxa_cdtor_type destructor)
{
  if (constructor)
  {
    v12[0] = dest_array;
    v12[1] = &v14;
    v12[2] = element_size;
    v12[3] = destructor;
    char v13 = 1;
    size_t v14 = 0LL;
    if (element_count)
    {
      uint64_t v11 = 0LL;
      do
      {
        constructor((char *)dest_array + v11, (char *)src_array + v11);
        ++v14;
        v11 += element_size;
      }

      while (v14 < element_count);
    }

    char v13 = 0;
  }

void sub_18041EBD4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void __cxxabiv1::anonymous namespace'::st_cxa_cleanup::~st_cxa_cleanup( __cxxabiv1::_anonymous_namespace_::st_cxa_cleanup *this)
{
  if (*((_BYTE *)this + 32))
  {
    uint64_t v1 = (void (*)(void))*((void *)this + 3);
    if (v1)
    {
      uint64_t v2 = *((void *)this + 2);
      uint64_t v3 = **((void **)this + 1);
      uint64_t v4 = -v2;
      uint64_t v5 = v3 + 1;
      for (uint64_t i = *(void *)this + v2 * (v3 - 1); --v5; uint64_t i = v7)
      {
        uint64_t v7 = i + v4;
        v1();
      }
    }
  }

void __cxa_vec_dtor( void *array_address, size_t element_count, size_t element_size, __cxa_cdtor_type destructor)
{
  if (destructor)
  {
    size_t v18 = element_count;
    v16[0] = array_address;
    v16[1] = &v18;
    v16[2] = element_size;
    v16[3] = destructor;
    char v17 = 1;
    __cxa_uncaught_exception();
    uint64_t v12 = -(uint64_t)element_size;
    for (uint64_t i = (char *)array_address + element_size * (element_count - 1); v18--; uint64_t i = v15)
    {
      uint64_t v15 = &i[v12];
      ((void (*)(char *, uint64_t, uint64_t, uint64_t, uint64_t))destructor)(i, v8, v9, v10, v11);
    }

    char v17 = 0;
  }

void sub_18041ECFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (v9) {
    std::terminate();
  }
  _Unwind_Resume(a1);
}

void __cxa_vec_cleanup(void *array_address, size_t element_count, size_t s, __cxa_cdtor_type destructor)
{
  if (destructor)
  {
    uint64_t v5 = -(uint64_t)s;
    size_t v6 = element_count + 1;
    for (uint64_t i = (char *)array_address + s * (element_count - 1); --v6; uint64_t i = v8)
    {
      uint64_t v8 = &i[v5];
      ((void (*)(void))destructor)();
    }
  }

void __cxa_vec_delete( void *array_address, size_t element_size, size_t padding_size, __cxa_cdtor_type destructor)
{
  if (array_address)
  {
    uint64_t v4 = (char *)array_address - padding_size;
    if (padding_size)
    {
    }

    operator delete[](v4);
  }

void sub_18041EDB4(_Unwind_Exception *a1)
{
}

void __cxa_vec_delete2( void *array_address, size_t element_size, size_t padding_size, __cxa_cdtor_type destructor, void (*dealloc)(void *))
{
  if (array_address)
  {
    size_t v6 = (char *)array_address - padding_size;
    if (padding_size)
    {
    }

    ((void (*)(char *, size_t))dealloc)(v6, element_size);
  }

void sub_18041EE14(_Unwind_Exception *a1)
{
}

void __cxa_vec_delete3( void *array_address, size_t element_size, size_t padding_size, __cxa_cdtor_type destructor, void (*dealloc)(void *, size_t))
{
  if (array_address)
  {
    size_t v6 = (char *)array_address - padding_size;
    if (padding_size)
    {
      size_t v8 = *((void *)array_address - 1);
      size_t v9 = padding_size + v8 * element_size;
    }

    else
    {
      size_t v9 = 0LL;
    }

    dealloc(v6, v9);
  }

void sub_18041EE8C(_Unwind_Exception *a1)
{
}

void __cxxabiv1::anonymous namespace'::throw_bad_array_new_length( __cxxabiv1::_anonymous_namespace_ *this)
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v2 = std::bad_array_new_length::bad_array_new_length(exception);
}

void __cxa_pure_virtual(void)
{
}

void __cxa_deleted_virtual(void)
{
}

const char *__cdecl std::exception::what(const std::exception *this)
{
  return "std::exception";
}

const char *__cdecl std::bad_exception::what(const std::bad_exception *this)
{
  return "std::bad_exception";
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  this->__vftable = (std::bad_alloc_vtbl *)off_18965AA50;
  return this;
}

{
  this->__vftable = (std::bad_alloc_vtbl *)off_18965AA50;
  return this;
}

const char *__cdecl std::bad_alloc::what(const std::bad_alloc *this)
{
  return "std::bad_alloc";
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  this->__vftable = (std::bad_array_new_length_vtbl *)off_18965AA78;
  return this;
}

{
  this->__vftable = (std::bad_array_new_length_vtbl *)off_18965AA78;
  return this;
}

const char *__cdecl std::bad_array_new_length::what(const std::bad_array_new_length *this)
{
  return "bad_array_new_length";
}

void std::logic_error::~logic_error(std::logic_error *this)
{
  this->__vftable = (std::logic_error_vtbl *)off_18965AB48;
  imp = this->__imp_.__imp_;
  uint64_t v3 = (unsigned int *)(imp - 8);
  do
  {
    unsigned int v4 = __ldaxr(v3);
    signed int v5 = v4 - 1;
  }

  while (__stlxr(v5, v3));
  if (v5 < 0) {
    operator delete((void *)(imp - 24));
  }
  std::exception::~exception(this);
}

{
  void *v1;
  std::logic_error::~logic_error(this);
  operator delete(v1);
}

const char *__cdecl std::logic_error::what(const std::logic_error *this)
{
  return this->__imp_.__imp_;
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  this->__vftable = (std::runtime_error_vtbl *)off_18965AB70;
  imp = this->__imp_.__imp_;
  uint64_t v3 = (unsigned int *)(imp - 8);
  do
  {
    unsigned int v4 = __ldaxr(v3);
    signed int v5 = v4 - 1;
  }

  while (__stlxr(v5, v3));
  if (v5 < 0) {
    operator delete((void *)(imp - 24));
  }
  std::exception::~exception(this);
}

{
  void *v1;
  std::runtime_error::~runtime_error(this);
  operator delete(v1);
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return this->__imp_.__imp_;
}

void std::domain_error::~domain_error(std::domain_error *this)
{
}

void std::invalid_argument::~invalid_argument(std::invalid_argument *this)
{
}

void std::length_error::~length_error(std::length_error *this)
{
}

void std::out_of_range::~out_of_range(std::out_of_range *this)
{
}

void std::range_error::~range_error(std::range_error *this)
{
}

void std::overflow_error::~overflow_error(std::overflow_error *this)
{
}

void std::underflow_error::~underflow_error(std::underflow_error *this)
{
}

std::bad_cast *__cdecl std::bad_cast::bad_cast(std::bad_cast *this)
{
  this->__vftable = (std::bad_cast_vtbl *)off_18965AD88;
  return this;
}

{
  this->__vftable = (std::bad_cast_vtbl *)off_18965AD88;
  return this;
}

void std::bad_cast::~bad_cast(std::bad_cast *this)
{
}

const char *__cdecl std::bad_cast::what(const std::bad_cast *this)
{
  return "std::bad_cast";
}

std::bad_typeid *__cdecl std::bad_typeid::bad_typeid(std::bad_typeid *this)
{
  this->__vftable = (std::bad_typeid_vtbl *)off_18965ADB0;
  return this;
}

{
  this->__vftable = (std::bad_typeid_vtbl *)off_18965ADB0;
  return this;
}

void std::bad_typeid::~bad_typeid(std::bad_typeid *this)
{
}

const char *__cdecl std::bad_typeid::what(const std::bad_typeid *this)
{
  return "std::bad_typeid";
}

void abort_message( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10 = (FILE **)MEMORY[0x1895F89D0];
  fwrite("libc++abi: ", 0xBuLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
  uint64_t v11 = &a9;
  vfprintf(*v10, a1, &a9);
  fputc(10, *v10);
  uint64_t v11 = 0LL;
  vasprintf(&v11, a1, &a9);
  qword_18C52A298 = (uint64_t)v11;
  abort();
}

int *__cxxabiv1::__aligned_malloc_with_fallback(unint64_t a1)
{
  if (a1 <= 1) {
    unint64_t v1 = 1LL;
  }
  else {
    unint64_t v1 = a1;
  }
  if (((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL) <= v1) {
    size_t v2 = v1;
  }
  else {
    size_t v2 = (v1 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  }
  uint64_t result = (int *)aligned_alloc(0x10uLL, v2);
  if (!result) {
  return result;
  }
}

int *anonymous namespace'::fallback_malloc(_anonymous_namespace_ *this)
{
  {
    size_t v9 = &dword_18C52A2FC;
    dword_18C52A2FC = 8192128;
  }

  {
LABEL_11:
    char v13 = 0LL;
  }

  else
  {
    uint64_t v10 = 0LL;
    unint64_t v11 = ((unint64_t)this + 3) >> 2;
    unint64_t v12 = v11 + 1;
    while (1)
    {
      char v13 = v9 + 1;
      if (((unint64_t)(v9 + 1) & 0xF) != 0) {
        abort_message( "%s:%d: %s",  v2,  v3,  v4,  v5,  v6,  v7,  v8,  (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/fallback_malloc.cpp");
      }
      size_t v14 = v9;
      unint64_t v15 = *((unsigned __int16 *)v9 + 1);
      uint64_t v16 = ((_BYTE)v15 - (_BYTE)v12) & 3;
      if (v12 >= v15) {
        uint64_t v16 = 0LL;
      }
      unint64_t v17 = v16 + v12;
      if (v17 < v15) {
        break;
      }
      if (v11 < v15)
      {
        uint64_t v20 = *(unsigned __int16 *)v14;
        if (v10) {
          *(_WORD *)uint64_t v10 = v20;
        }
        else {
        *(_WORD *)size_t v14 = 0;
        }
        goto LABEL_18;
      }

      uint64_t v18 = 4LL * *(unsigned __int16 *)v14;
      uint64_t v10 = v14;
      if (v18 == 512) {
        goto LABEL_11;
      }
    }

    *((_WORD *)v14 + 1) = v15 - v17;
    unint64_t v19 = (unsigned __int16 *)&v14[(unsigned __int16)(v15 - v17)];
    *unint64_t v19 = 0;
    v19[1] = v17;
    char v13 = (int *)(v19 + 2);
    if (((unint64_t)(v19 + 2) & 0xF) != 0) {
      abort_message( "%s:%d: %s",  v2,  v3,  v4,  v5,  v6,  v7,  v8,  (char)"/Library/Caches/com.apple.xbs/Sources/libcxx_os/libcxxabi/src/fallback_malloc.cpp");
    }
  }

LABEL_18:
  return v13;
}

void sub_18041F420(_Unwind_Exception *a1)
{
}

void *__cxxabiv1::__calloc_with_fallback(size_t a1, size_t a2)
{
  uint64_t v4 = calloc(a1, a2);
  if (!v4)
  {
    size_t v5 = a2 * a1;
    uint64_t v4 = v6;
    if (v6) {
      bzero(v6, v5);
    }
  }

  return v4;
}

void __cxxabiv1::__aligned_free_with_fallback(void *a1, void *a2)
{
  {
    free(a1);
  }

  else
  {
  }

uint64_t anonymous namespace'::fallback_free(_anonymous_namespace_ *this, void *a2)
{
  uint64_t v3 = (unsigned __int16 *)((char *)this - 4);
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
LABEL_9:
  }

  else
  {
    size_t v5 = 0LL;
    uint64_t v6 = *((unsigned __int16 *)this - 1);
    while (1)
    {
      uint64_t v8 = v7[1];
      if (&v7[2 * v8] == v3)
      {
        v7[1] = v6 + v8;
      }

      if (&v3[2 * v6] == v7) {
        break;
      }
      uint64_t v9 = 4LL * *v7;
      size_t v5 = v7;
      if (v9 == 512) {
        goto LABEL_9;
      }
    }

    *((_WORD *)this - 1) = v6 + v8;
    if (v5)
    {
    }

    else
    {
      *uint64_t v3 = *v7;
    }
  }
}

void __cxxabiv1::__free_with_fallback(void *a1, void *a2)
{
  {
    free(a1);
  }

  else
  {
  }

void __cxxabiv1::__fundamental_type_info::~__fundamental_type_info(std::type_info *this)
{
}

void __cxxabiv1::__array_type_info::~__array_type_info(std::type_info *this)
{
}

void __cxxabiv1::__function_type_info::~__function_type_info(std::type_info *this)
{
}

void __cxxabiv1::__enum_type_info::~__enum_type_info(std::type_info *this)
{
}

void __cxxabiv1::__class_type_info::~__class_type_info(std::type_info *this)
{
}

void __cxxabiv1::__si_class_type_info::~__si_class_type_info(std::type_info *this)
{
}

void __cxxabiv1::__vmi_class_type_info::~__vmi_class_type_info(std::type_info *this)
{
}

void __cxxabiv1::__pbase_type_info::~__pbase_type_info(std::type_info *this)
{
}

void __cxxabiv1::__pointer_type_info::~__pointer_type_info(std::type_info *this)
{
}

void __cxxabiv1::__pointer_to_member_type_info::~__pointer_to_member_type_info(std::type_info *this)
{
}

BOOL is_equal(const std::type_info *a1, const std::type_info *a2, char a3)
{
  if ((a3 & 1) == 0) {
    return std::type_info::operator==[abi:ne180100]((uint64_t)a1, (uint64_t)a2);
  }
  if (a1 == a2) {
    return 1LL;
  }
  return strcmp( (const char *)(a1->__type_name & 0x7FFFFFFFFFFFFFFFLL),  (const char *)(a2->__type_name & 0x7FFFFFFFFFFFFFFFLL)) == 0;
}

uint64_t __cxxabiv1::__array_type_info::can_catch( __cxxabiv1::__array_type_info *this, const __cxxabiv1::__shim_type_info *a2, void **a3)
{
  return 0LL;
}

uint64_t __cxxabiv1::__function_type_info::can_catch( __cxxabiv1::__function_type_info *this, const __cxxabiv1::__shim_type_info *a2, void **a3)
{
  return 0LL;
}

const __cxxabiv1::__shim_type_info *__cxxabiv1::__class_type_info::can_catch( __cxxabiv1::__class_type_info *this, const __cxxabiv1::__shim_type_info *a2, void **a3)
{
  uint64_t result = __cxxabiv1::is_class_type(a2);
  if (result)
  {
    v7[0] = result;
    v7[1] = 0LL;
    v7[2] = this;
    v7[3] = -1LL;
    __int128 v8 = 0u;
    memset(v9, 0, sizeof(v9));
    char v10 = 1;
    uint64_t v11 = 0LL;
    *(_DWORD *)&v9[24] = 1;
    (*(void (**)(const __cxxabiv1::__shim_type_info *, void *, void, uint64_t))(*(void *)result + 56LL))( result,  v7,  *a3,  1LL);
    uint64_t result = (const __cxxabiv1::__shim_type_info *)(*(_DWORD *)v9 == 1);
    if (*(_DWORD *)v9 == 1) {
      *a3 = (void *)v8;
    }
  }

  return result;
}

const __cxxabiv1::__shim_type_info *__cxxabiv1::is_class_type(const __cxxabiv1::__shim_type_info *a1)
{
  if (!a1) {
    __cxa_bad_typeid();
  }
  unint64_t v1 = a1;
  {
    return 0LL;
  }

  return v1;
}

void __cxxabiv1::__class_type_info::process_found_base_class(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4 = *(_DWORD *)(a2 + 60);
  if (v4)
  {
    if (*(void *)(a2 + 40) == *(void *)(a2 + 80) && *(void *)(a2 + 32) == a3)
    {
      if (*(_DWORD *)(a2 + 48) == 2) {
        *(_DWORD *)(a2 + 4++*((_DWORD *)this + 8) = a4;
      }
    }

    else
    {
      *(_DWORD *)(a2 + 60) = v4 + 1;
      *(_DWORD *)(a2 + 4++*((_DWORD *)this + 8) = 2;
      *(_BYTE *)(a2 + 7++*((_DWORD *)this + 8) = 1;
    }
  }

  else
  {
    *(_DWORD *)(a2 + 4++*((_DWORD *)this + 8) = a4;
    uint64_t v5 = *(void *)(a2 + 80);
    *(void *)(a2 + 32) = a3;
    *(void *)(a2 + 40) = v5;
    *(_DWORD *)(a2 + 60) = 1;
  }

void __cxxabiv1::__class_type_info::has_unambiguous_public_base(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  BOOL v7 = std::type_info::operator==[abi:ne180100](a1, *(void *)(a2 + 16));
  if (v7) {
    __cxxabiv1::__class_type_info::process_found_base_class(v7, a2, a3, a4);
  }
}

void __cxxabiv1::__si_class_type_info::has_unambiguous_public_base( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v8 = std::type_info::operator==[abi:ne180100](a1, *(void *)(a2 + 16));
  if (v8) {
    __cxxabiv1::__class_type_info::process_found_base_class(v8, a2, a3, a4);
  }
  else {
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(**(void **)(a1 + 16) + 56LL))( *(void *)(a1 + 16),  a2,  a3,  a4);
  }
}

uint64_t __cxxabiv1::__base_class_type_info::has_unambiguous_public_base(void *a1, uint64_t a2)
{
  if (!*(_BYTE *)(a2 + 79) && (a1[1] & 1) != 0) {
    *(void *)(a2 + 80) = *(void *)(*a1 + 8LL) & 0x7FFFFFFFFFFFFFFFLL;
  }
  return (*(uint64_t (**)(void))(*(void *)*a1 + 56LL))(*a1);
}

void __cxxabiv1::__vmi_class_type_info::has_unambiguous_public_base( uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  BOOL v8 = std::type_info::operator==[abi:ne180100](a1, *(void *)(a2 + 16));
  if (v8)
  {
    __cxxabiv1::__class_type_info::process_found_base_class(v8, a2, a3, a4);
  }

  else
  {
    unint64_t v9 = a1 + 24 + 16LL * *(unsigned int *)(a1 + 20);
    __cxxabiv1::__base_class_type_info::has_unambiguous_public_base((void *)(a1 + 24), a2);
    if (a1 + 40 < v9)
    {
      unint64_t v10 = a1 + 56;
      do
      {
        __cxxabiv1::__base_class_type_info::has_unambiguous_public_base((void *)(v10 - 16), a2);
        if (*(_BYTE *)(a2 + 78)) {
          BOOL v11 = 1;
        }
        else {
          BOOL v11 = v10 >= v9;
        }
        v10 += 16LL;
      }

      while (!v11);
    }
  }

uint64_t __cxxabiv1::__pbase_type_info::can_catch( __cxxabiv1::__pbase_type_info *this, const __cxxabiv1::__shim_type_info *lpsrc, void **a3)
{
  if ((*((_BYTE *)this + 16) & 0x18) == 0)
  {
    if (!lpsrc) {
      return 0LL;
    }
    if (!result) {
      return result;
    }
    if ((*(_BYTE *)(result + 16) & 0x18) == 0) {
      return std::type_info::operator==[abi:ne180100]((uint64_t)this, (uint64_t)lpsrc);
    }
  }

  return this == lpsrc
      || strcmp( (const char *)(*((void *)this + 1) & 0x7FFFFFFFFFFFFFFFLL),  (const char *)(*((void *)lpsrc + 1) & 0x7FFFFFFFFFFFFFFFLL)) == 0;
}

void *__dynamic_cast( const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  BOOL v8 = v13;
  BOOL v9 = is_equal(v13, (const std::type_info *)lpdtype, 0);
  unint64_t v10 = v12;
  if (v9) {
  if (!result)
  }
  return result;
}

uint64_t __cxxabiv1::__pointer_type_info::can_catch( __cxxabiv1::__pointer_type_info *this, const __cxxabiv1::__shim_type_info *a2, void ***a3)
{
  {
    *a3 = 0LL;
    return 1LL;
  }

  if (__cxxabiv1::__pbase_type_info::can_catch(this, a2, v6))
  {
    if (*a3) {
      *a3 = (void **)**a3;
    }
    return 1LL;
  }

  if (!a2) {
    __cxa_bad_typeid();
  }
  if ((_DWORD)result)
  {
    if (*a3) {
      *a3 = (void **)**a3;
    }
    int v8 = *((_DWORD *)a2 + 4);
    int v9 = *((_DWORD *)this + 4);
    if ((v8 & ~(_BYTE)v9 & 7) != 0
      || (v9 & ~(_BYTE)v8 & 0x60) != 0)
    {
      return 0LL;
    }

    if (std::type_info::operator==[abi:ne180100](*((void *)this + 3), *((void *)a2 + 3))) {
      return 1LL;
    }
    {
      unint64_t v10 = (const void *)*((void *)a2 + 3);
      if (v10) {
      return 1LL;
      }
    }

    BOOL v11 = (const void *)*((void *)this + 3);
    if (v11)
    {
      if (v12)
      {
        if ((*((_BYTE *)this + 16) & 1) != 0) {
          return __cxxabiv1::__pointer_type_info::can_catch_nested( v12,  *((const __cxxabiv1::__shim_type_info **)a2 + 3));
        }
        return 0LL;
      }

      if (v13)
      {
        if ((*((_BYTE *)this + 16) & 1) != 0) {
          return __cxxabiv1::__pointer_to_member_type_info::can_catch_nested( v13,  *((const __cxxabiv1::__shim_type_info **)a2 + 3));
        }
        return 0LL;
      }
    }

    uint64_t result = (uint64_t)__cxxabiv1::is_class_type((const __cxxabiv1::__shim_type_info *)v11);
    if (result)
    {
      uint64_t v14 = result;
      uint64_t result = (uint64_t)__cxxabiv1::is_class_type(*((const __cxxabiv1::__shim_type_info **)a2 + 3));
      if (result)
      {
        unint64_t v15 = *a3;
        BOOL v16 = *a3 != 0LL;
        v18[0] = result;
        v18[1] = 0LL;
        v18[2] = v14;
        v18[3] = -1LL;
        __int128 v19 = 0u;
        memset(v20, 0, sizeof(v20));
        BOOL v21 = v16;
        uint64_t v22 = 0LL;
        *(_DWORD *)&v20[24] = 1;
        (*(void (**)(uint64_t, void *, void **, uint64_t))(*(void *)result + 56LL))(result, v18, v15, 1LL);
        uint64_t result = *(_DWORD *)v20 == 1;
        if (*(_DWORD *)v20 == 1)
        {
          unint64_t v17 = (void **)v19;
          if (!v15) {
            unint64_t v17 = 0LL;
          }
          *a3 = v17;
        }
      }
    }
  }

  return result;
}

uint64_t __cxxabiv1::__pointer_type_info::can_catch_nested( __cxxabiv1::__pointer_type_info *this, const __cxxabiv1::__shim_type_info *lpsrc)
{
  if (!lpsrc) {
    return 0LL;
  }
  while (1)
  {
    if (!result) {
      break;
    }
    uint64_t v4 = result;
    if ((*(_DWORD *)(result + 16) & ~*((_DWORD *)this + 4)) != 0) {
      return 0LL;
    }
    if (std::type_info::operator==[abi:ne180100](*((void *)this + 3), *(void *)(result + 24))) {
      return 1LL;
    }
    if ((*((_BYTE *)this + 16) & 1) == 0) {
      return 0LL;
    }
    uint64_t v5 = (const void *)*((void *)this + 3);
    if (!v5) {
      return 0LL;
    }
    if (!v6)
    {
      if (result) {
        return __cxxabiv1::__pointer_to_member_type_info::can_catch_nested( (__cxxabiv1::__pointer_to_member_type_info *)result,  *(const __cxxabiv1::__shim_type_info **)(v4 + 24));
      }
      return result;
    }

    this = v6;
    lpsrc = *(const __cxxabiv1::__shim_type_info **)(v4 + 24);
    if (!lpsrc) {
      return 0LL;
    }
  }

  return result;
}

BOOL __cxxabiv1::__pointer_to_member_type_info::can_catch_nested( __cxxabiv1::__pointer_to_member_type_info *this, const __cxxabiv1::__shim_type_info *lpsrc)
{
  if (lpsrc
    && std::type_info::operator==[abi:ne180100](*((void *)this + 3), v3[3]))
  {
    return std::type_info::operator==[abi:ne180100](*((void *)this + 4), v4[4]);
  }

  else
  {
    return 0LL;
  }

uint64_t __cxxabiv1::__pointer_to_member_type_info::can_catch( __cxxabiv1::__pointer_to_member_type_info *this, const __cxxabiv1::__shim_type_info *a2, void **a3)
{
  {
    BOOL v7 = (const void *)*((void *)this + 3);
    if (v7
    {
      int v8 = &__cxxabiv1::__pointer_to_member_type_info::can_catch(__cxxabiv1::__shim_type_info const*,void *&)const::null_ptr_rep;
    }

    else
    {
      int v8 = &__cxxabiv1::__pointer_to_member_type_info::can_catch(__cxxabiv1::__shim_type_info const*,void *&)const::null_ptr_rep;
    }

    *a3 = v8;
    return 1LL;
  }

  if ((__cxxabiv1::__pbase_type_info::can_catch(this, a2, v6) & 1) != 0) {
    return 1LL;
  }
  if (!a2) {
    return 0LL;
  }
  if (!result) {
    return result;
  }
  uint64_t v10 = result;
  int v11 = *(_DWORD *)(result + 16);
  int v12 = *((_DWORD *)this + 4);
  if ((v11 & ~(_BYTE)v12 & 7) != 0
    || (v12 & ~(_BYTE)v11 & 0x60) != 0)
  {
    return 0LL;
  }

  uint64_t result = std::type_info::operator==[abi:ne180100](*((void *)this + 3), *(void *)(result + 24));
  if ((_DWORD)result) {
    return std::type_info::operator==[abi:ne180100](*((void *)this + 4), *(void *)(v10 + 32));
  }
  return result;
}

void *__cxxabiv1::anonymous namespace'::dyn_cast_get_derived_info(void *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = *(void *)(*a2 - 16);
  *uint64_t result = (char *)a2 + v3;
  result[1] = *(void *)(v2 - 8);
  result[2] = v3;
  return result;
}

const void *__cxxabiv1::anonymous namespace'::dyn_cast_to_derived( __cxxabiv1::_anonymous_namespace_ *this, const void *a2, void *a3, const __cxxabiv1::__class_type_info *a4, const __cxxabiv1::__class_type_info *a5, uint64_t a6)
{
  if (a6 < 0)
  {
    if (a6 == -2) {
      return 0LL;
    }
    unint64_t v15 = a4;
    BOOL v16 = this;
    unint64_t v17 = a3;
    uint64_t v18 = a6;
    __int128 v19 = 0u;
    memset(v20, 0, 24);
    *(_DWORD *)&v20[24] = 1;
    *(_DWORD *)&v20[28] = 0x1000000;
    uint64_t v21 = 0LL;
    (*(void (**)(const __cxxabiv1::__class_type_info *, const __cxxabiv1::__class_type_info **, const void *, const void *, uint64_t, void))(*(void *)a4 + 40LL))( a4,  &v15,  a2,  a2,  1LL,  0LL);
    int v13 = *(_DWORD *)v20;
    if (!*(_DWORD *)v20)
    {
      do
      if ((v14 & (v14 - 1)) == 0) {
        syslog( 3,  "dynamic_cast error 1: Both of the following type_info's should have public visibility. At least one of them is hidden. %s, %s.\n",  (const char *)(a3[1] & 0x7FFFFFFFFFFFFFFFLL),  (const char *)(*((void *)a4 + 1) & 0x7FFFFFFFFFFFFFFFLL));
      }
      unint64_t v15 = a4;
      BOOL v16 = this;
      unint64_t v17 = a3;
      uint64_t v18 = a6;
      __int128 v19 = 0u;
      memset(v20, 0, 31);
      _BYTE v20[31] = 1;
      uint64_t v21 = 0LL;
      *(_DWORD *)&v20[24] = 1;
      (*(void (**)(const __cxxabiv1::__class_type_info *, const __cxxabiv1::__class_type_info **, const void *, const void *, uint64_t, uint64_t))(*(void *)a4 + 40LL))( a4,  &v15,  a2,  a2,  1LL,  1LL);
      int v13 = *(_DWORD *)v20;
    }

    BOOL v8 = v13 == 1;
  }

  else
  {
    BOOL v8 = (const __cxxabiv1::__class_type_info *)((char *)a5 + a6) == 0LL;
  }

  if (v8) {
    return a2;
  }
  else {
    return 0LL;
  }
}

char *__cxxabiv1::anonymous namespace'::dyn_cast_try_downcast( __cxxabiv1::_anonymous_namespace_ *this, uint64_t a2, const void *a3, const __cxxabiv1::__class_type_info *a4, unint64_t a5)
{
  if ((a5 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  uint64_t v5 = (char *)this - a5;
  v7[0] = a4;
  v7[1] = (char *)this - a5;
  v7[2] = a3;
  v7[3] = a5;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  uint64_t v10 = 0LL;
  int v11 = 1;
  int v12 = 0x1000000;
  uint64_t v13 = 0LL;
  (*(void (**)(const __cxxabiv1::__class_type_info *, void *, uint64_t, uint64_t, uint64_t, void))(*(void *)a4 + 40LL))( a4,  v7,  a2,  a2,  1LL,  0LL);
  if ((_DWORD)v9) {
    return v5;
  }
  else {
    return 0LL;
  }
}

uint64_t __cxxabiv1::anonymous namespace'::dyn_cast_slow( __cxxabiv1::_anonymous_namespace_ *this, const void *a2, void *a3, const __cxxabiv1::__class_type_info *a4, const __cxxabiv1::__class_type_info *a5, const __cxxabiv1::__class_type_info *a6)
{
  BOOL v16 = a4;
  unint64_t v17 = this;
  uint64_t v18 = a3;
  __int128 v19 = a6;
  memset(v21, 0, sizeof(v21));
  __int128 v20 = 0u;
  char v22 = 1;
  uint64_t v23 = 0LL;
  (*(void (**)(const __cxxabiv1::__class_type_info *, const __cxxabiv1::__class_type_info **, const void *, uint64_t, void))(*(void *)a5 + 48LL))( a5,  &v16,  a2,  1LL,  0LL);
  if (!*(void *)v21)
  {
    do
    if ((v12 & (v12 - 1)) == 0) {
      syslog( 3,  "dynamic_cast error 2: One or more of the following type_info's has hidden visibility or is defined in more than one translation unit. They should all have public visibility. %s, %s, %s.\n",  (const char *)(a3[1] & 0x7FFFFFFFFFFFFFFFLL),  (const char *)(*((void *)a5 + 1) & 0x7FFFFFFFFFFFFFFFLL),  (const char *)(*((void *)a4 + 1) & 0x7FFFFFFFFFFFFFFFLL));
    }
    BOOL v16 = a4;
    unint64_t v17 = this;
    uint64_t v18 = a3;
    __int128 v19 = a6;
    __int128 v20 = 0u;
    memset(v21, 0, sizeof(v21));
    char v22 = 1;
    uint64_t v23 = 0LL;
    (*(void (**)(const __cxxabiv1::__class_type_info *, const __cxxabiv1::__class_type_info **, const void *, uint64_t, uint64_t))(*(void *)a5 + 48LL))( a5,  &v16,  a2,  1LL,  1LL);
  }

  if (*(_DWORD *)&v21[12] == 1)
  {
    if (*(_DWORD *)v21 == 1) {
      return v20;
    }
    uint64_t result = 0LL;
    if (!*(_DWORD *)&v21[16] && *(void *)&v21[4] == 0x100000001LL) {
      return v20;
    }
  }

  else if (*(_DWORD *)&v21[12])
  {
    return 0LL;
  }

  else if (*(_DWORD *)&v21[8] == 1 && *(_DWORD *)&v21[4] == 1 && *(_DWORD *)&v21[16] == 1)
  {
    return *((void *)&v20 + 1);
  }

  else
  {
    return 0LL;
  }

  return result;
}

void __cxxabiv1::__class_type_info::process_static_type_above_dst( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(_BYTE *)(a2 + 77) = 1;
  if (*(void *)(a2 + 8) != a4) {
    return;
  }
  *(_BYTE *)(a2 + 76) = 1;
  uint64_t v5 = *(void *)(a2 + 32);
  if (!v5)
  {
    *(void *)(a2 + 32) = a3;
    *(_DWORD *)(a2 + 4++*((_DWORD *)this + 8) = a5;
    *(_DWORD *)(a2 + 60) = 1;
    if (a5 != 1) {
      return;
    }
    int v6 = *(_DWORD *)(a2 + 72);
    goto LABEL_11;
  }

  if (v5 != a3)
  {
    ++*(_DWORD *)(a2 + 60);
    goto LABEL_12;
  }

  int v6 = *(_DWORD *)(a2 + 48);
  if (v6 == 2)
  {
    *(_DWORD *)(a2 + 4++*((_DWORD *)this + 8) = a5;
    int v6 = a5;
  }

  if (*(_DWORD *)(a2 + 72) == 1)
  {
LABEL_11:
    if (v6 != 1) {
      return;
    }
LABEL_12:
    *(_BYTE *)(a2 + 7++*((_DWORD *)this + 8) = 1;
  }

void __cxxabiv1::__class_type_info::process_static_type_below_dst( uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (*(void *)(a2 + 8) == a3 && *(_DWORD *)(a2 + 52) != 1) {
    *(_DWORD *)(a2 + 52) = a4;
  }
}

uint64_t __cxxabiv1::__vmi_class_type_info::search_below_dst( uint64_t result, uint64_t a2, char *a3, unsigned int a4, uint64_t a5)
{
  uint64_t v9 = result;
  uint64_t v10 = *(void *)(a2 + 16);
  if ((a5 & 1) != 0)
  {
    if (v10 != result)
    {
      int v11 = (const char *)(*(void *)(result + 8) & 0x7FFFFFFFFFFFFFFFLL);
      uint64_t result = strcmp(v11, (const char *)(*(void *)(v10 + 8) & 0x7FFFFFFFFFFFFFFFLL));
      if ((_DWORD)result)
      {
        if (*(void *)a2 != v9)
        {
          uint64_t result = strcmp(v11, (const char *)(*(void *)(*(void *)a2 + 8LL) & 0x7FFFFFFFFFFFFFFFLL));
          if ((_DWORD)result) {
            goto LABEL_6;
          }
        }

        goto LABEL_27;
      }
    }

LABEL_23:
    return result;
  }

  uint64_t result = std::type_info::operator==[abi:ne180100](result, v10);
  if ((result & 1) != 0) {
    goto LABEL_23;
  }
  uint64_t result = std::type_info::operator==[abi:ne180100](v9, *(void *)a2);
  if ((result & 1) == 0)
  {
LABEL_6:
    unint64_t v12 = v9 + 16LL * *(unsigned int *)(v9 + 20) + 24;
    uint64_t v13 = *(void *)(v9 + 32);
    uint64_t v14 = v13 >> 8;
    if ((v13 & 1) != 0) {
      uint64_t v14 = *(void *)(*(void *)a3 + v14);
    }
    if ((v13 & 2) != 0) {
      uint64_t v15 = a4;
    }
    else {
      uint64_t v15 = 2LL;
    }
    uint64_t result = (*(uint64_t (**)(void, uint64_t, char *, uint64_t, uint64_t))(**(void **)(v9 + 24) + 48LL))( *(void *)(v9 + 24),  a2,  &a3[v14],  v15,  a5);
    BOOL v16 = (uint64_t *)(v9 + 40);
    if (v9 + 40 < v12)
    {
      int v17 = *(_DWORD *)(v9 + 16);
      if ((v17 & 2) != 0 || *(_DWORD *)(a2 + 60) == 1)
      {
        do
        {
          if (*(_BYTE *)(a2 + 78)) {
            break;
          }
          uint64_t v18 = v16[1];
          uint64_t v19 = v18 >> 8;
          if ((v18 & 1) != 0) {
            uint64_t v19 = *(void *)(*(void *)a3 + v19);
          }
          uint64_t v21 = *v16;
          v16 += 2;
          uint64_t v20 = v21;
          uint64_t v22 = (v18 & 2) != 0 ? a4 : 2LL;
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t))(*(void *)v20 + 48LL))( v20,  a2,  &a3[v19],  v22,  a5);
        }

        while ((unint64_t)v16 < v12);
      }

      else if ((v17 & 1) != 0)
      {
        do
        {
          if (*(_BYTE *)(a2 + 78) || *(_DWORD *)(a2 + 60) == 1 && *(_DWORD *)(a2 + 48) == 1) {
            break;
          }
          uint64_t v37 = v16[1];
          uint64_t v38 = v37 >> 8;
          if ((v37 & 1) != 0) {
            uint64_t v38 = *(void *)(*(void *)a3 + v38);
          }
          uint64_t v40 = *v16;
          v16 += 2;
          uint64_t v39 = v40;
          uint64_t v41 = (v37 & 2) != 0 ? a4 : 2LL;
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t))(*(void *)v39 + 48LL))( v39,  a2,  &a3[v38],  v41,  a5);
        }

        while ((unint64_t)v16 < v12);
      }

      else
      {
        do
        {
          if (*(_BYTE *)(a2 + 78) || *(_DWORD *)(a2 + 60) == 1) {
            break;
          }
          uint64_t v32 = v16[1];
          uint64_t v33 = v32 >> 8;
          if ((v32 & 1) != 0) {
            uint64_t v33 = *(void *)(*(void *)a3 + v33);
          }
          uint64_t v35 = *v16;
          v16 += 2;
          uint64_t v34 = v35;
          uint64_t v36 = (v32 & 2) != 0 ? a4 : 2LL;
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t, uint64_t))(*(void *)v34 + 48LL))( v34,  a2,  &a3[v33],  v36,  a5);
        }

        while ((unint64_t)v16 < v12);
      }
    }

    return result;
  }

LABEL_27:
  if (*(char **)(a2 + 32) == a3 || *(char **)(a2 + 40) == a3)
  {
    if (a4 == 1) {
      *(_DWORD *)(a2 + 56) = 1;
    }
    return result;
  }

  *(_DWORD *)(a2 + 56) = a4;
  if (*(_DWORD *)(a2 + 68) == 4)
  {
LABEL_73:
    *(void *)(a2 + 40) = a3;
    int v42 = *(_DWORD *)(a2 + 60);
    ++*(_DWORD *)(a2 + 64);
    if (v42 == 1 && *(_DWORD *)(a2 + 48) == 2) {
      *(_BYTE *)(a2 + 7++*((_DWORD *)this + 8) = 1;
    }
    return result;
  }

  uint64_t v23 = *(unsigned int *)(v9 + 20);
  if (!(_DWORD)v23)
  {
    *(_DWORD *)(a2 + 6++*((_DWORD *)this + 8) = 4;
    goto LABEL_73;
  }

  char v24 = 0;
  char v25 = 0;
  uint64_t v26 = (void *)(v9 + 24);
  unint64_t v27 = v9 + 24 + 16 * v23;
  do
  {
    *(_WORD *)(a2 + 76) = 0;
    uint64_t v28 = v26[1];
    uint64_t v29 = v28 >> 8;
    if ((v28 & 1) != 0) {
      uint64_t v29 = *(void *)(*(void *)a3 + v29);
    }
    uint64_t v30 = (v28 & 2) != 0 ? 1LL : 2LL;
    uint64_t result = (*(uint64_t (**)(void, uint64_t, char *, char *, uint64_t, uint64_t))(*(void *)*v26 + 40LL))( *v26,  a2,  a3,  &a3[v29],  v30,  a5);
    if (*(_BYTE *)(a2 + 78)) {
      break;
    }
    if (*(_BYTE *)(a2 + 77))
    {
      if (*(_BYTE *)(a2 + 76))
      {
        char v25 = 1;
        if (*(_DWORD *)(a2 + 48) == 1) {
          goto LABEL_47;
        }
        char v24 = 1;
        if ((*(_BYTE *)(v9 + 16) & 2) == 0) {
          goto LABEL_47;
        }
      }

      else
      {
        if ((*(_BYTE *)(v9 + 16) & 1) == 0) {
          goto LABEL_47;
        }
        char v24 = 1;
      }
    }

    v26 += 2;
  }

  while ((unint64_t)v26 < v27);
  if ((v24 & 1) != 0)
  {
LABEL_47:
    int v31 = 3;
    goto LABEL_72;
  }

  int v31 = 4;
LABEL_72:
  *(_DWORD *)(a2 + 6++*((_DWORD *)this + 8) = v31;
  if ((v25 & 1) == 0) {
    goto LABEL_73;
  }
  return result;
}

uint64_t __cxxabiv1::__base_class_type_info::search_above_dst( uint64_t *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v5 = a1[1];
  uint64_t v6 = v5 >> 8;
  if ((v5 & 1) != 0) {
    uint64_t v6 = *(void *)(*a4 + v6);
  }
  uint64_t v7 = *a1;
  __int128 v8 = (char *)a4 + v6;
  if ((v5 & 2) != 0) {
    a5 = a5;
  }
  else {
    a5 = 2LL;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, uint64_t))(*(void *)v7 + 40LL))( v7,  a2,  a3,  v8,  a5);
}

uint64_t __cxxabiv1::__base_class_type_info::search_below_dst( uint64_t *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4 = a1[1];
  uint64_t v5 = v4 >> 8;
  if ((v4 & 1) != 0) {
    uint64_t v5 = *(void *)(*a3 + v5);
  }
  uint64_t v6 = *a1;
  uint64_t v7 = (char *)a3 + v5;
  if ((v4 & 2) != 0) {
    a4 = a4;
  }
  else {
    a4 = 2LL;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, char *, uint64_t))(*(void *)v6 + 48LL))(v6, a2, v7, a4);
}

uint64_t __cxxabiv1::__si_class_type_info::search_below_dst( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = result;
  uint64_t v10 = *(void *)(a2 + 16);
  if ((a5 & 1) != 0)
  {
    if (v10 != result)
    {
      int v11 = (const char *)(*(void *)(result + 8) & 0x7FFFFFFFFFFFFFFFLL);
      uint64_t result = strcmp(v11, (const char *)(*(void *)(v10 + 8) & 0x7FFFFFFFFFFFFFFFLL));
      if ((_DWORD)result)
      {
        if (*(void *)a2 != v9)
        {
          uint64_t result = strcmp(v11, (const char *)(*(void *)(*(void *)a2 + 8LL) & 0x7FFFFFFFFFFFFFFFLL));
          if ((_DWORD)result) {
            return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)(v9 + 16) + 48LL))( *(void *)(v9 + 16),  a2,  a3,  a4,  a5);
          }
        }

        goto LABEL_12;
      }
    }

uint64_t __cxxabiv1::__class_type_info::search_below_dst( uint64_t result, uint64_t *a2, uint64_t a3, int a4, char a5)
{
  uint64_t v8 = result;
  uint64_t v9 = a2[2];
  if ((a5 & 1) != 0)
  {
    if (v9 != result)
    {
      uint64_t v10 = (const char *)(*(void *)(result + 8) & 0x7FFFFFFFFFFFFFFFLL);
      uint64_t result = strcmp(v10, (const char *)(*(void *)(v9 + 8) & 0x7FFFFFFFFFFFFFFFLL));
      if ((_DWORD)result)
      {
        if (*a2 != v8)
        {
          uint64_t result = strcmp(v10, (const char *)(*(void *)(*a2 + 8) & 0x7FFFFFFFFFFFFFFFLL));
          if ((_DWORD)result) {
            return result;
          }
        }

        goto LABEL_12;
      }
    }
  }

  else
  {
    uint64_t result = std::type_info::operator==[abi:ne180100](result, v9);
    if ((result & 1) == 0)
    {
      uint64_t result = std::type_info::operator==[abi:ne180100](v8, *a2);
      if ((result & 1) == 0) {
        return result;
      }
LABEL_12:
      if (a2[4] == a3 || a2[5] == a3)
      {
        if (a4 == 1) {
          *((_DWORD *)a2 + 14) = 1;
        }
      }

      else
      {
        *((_DWORD *)a2 + 14) = a4;
        a2[5] = a3;
        int v11 = *((_DWORD *)a2 + 15);
        ++*((_DWORD *)a2 + 16);
        if (v11 == 1 && *((_DWORD *)a2 + 12) == 2) {
          *((_BYTE *)a2 + 7++*((_DWORD *)this + 8) = 1;
        }
        *((_DWORD *)a2 + 17) = 4;
      }

      return result;
    }
  }

  if (a2[1] == a3 && *((_DWORD *)a2 + 13) != 1) {
    *((_DWORD *)a2 + qmemcpy((void *)(*(void *)this + *((void *)this + 1)), "pixel vector[", 13) = a4;
  }
  return result;
}

void __cxxabiv1::__vmi_class_type_info::search_above_dst( uint64_t a1, uint64_t a2, uint64_t a3, char *a4, unsigned int a5, uint64_t a6)
{
  uint64_t v11 = a1;
  uint64_t v12 = *(void *)(a2 + 16);
  if ((a6 & 1) == 0)
  {
    a1 = std::type_info::operator==[abi:ne180100](a1, v12);
    if ((a1 & 1) == 0) {
      goto LABEL_4;
    }
LABEL_25:
    __cxxabiv1::__class_type_info::process_static_type_above_dst(a1, a2, a3, (uint64_t)a4, a5);
    return;
  }

  if (v12 == a1) {
    goto LABEL_25;
  }
  a1 = strcmp( (const char *)(*(void *)(a1 + 8) & 0x7FFFFFFFFFFFFFFFLL),  (const char *)(*(void *)(v12 + 8) & 0x7FFFFFFFFFFFFFFFLL));
  if (!(_DWORD)a1) {
    goto LABEL_25;
  }
LABEL_4:
  int v13 = *(unsigned __int8 *)(a2 + 76);
  int v14 = *(unsigned __int8 *)(a2 + 77);
  unint64_t v15 = v11 + 16LL * *(unsigned int *)(v11 + 20) + 24;
  *(_WORD *)(a2 + 76) = 0;
  uint64_t v16 = *(void *)(v11 + 32);
  uint64_t v17 = v16 >> 8;
  if ((v16 & 1) != 0) {
    uint64_t v17 = *(void *)(*(void *)a4 + v17);
  }
  if ((v16 & 2) != 0) {
    uint64_t v18 = a5;
  }
  else {
    uint64_t v18 = 2LL;
  }
  (*(void (**)(void, uint64_t, uint64_t, char *, uint64_t, uint64_t))(**(void **)(v11 + 24) + 40LL))( *(void *)(v11 + 24),  a2,  a3,  &a4[v17],  v18,  a6);
  int v19 = *(unsigned __int8 *)(a2 + 76);
  int v20 = v19 | v13;
  int v21 = *(unsigned __int8 *)(a2 + 77);
  int v22 = v21 | v14;
  uint64_t v23 = (uint64_t *)(v11 + 40);
  while ((unint64_t)v23 < v15 && !*(_BYTE *)(a2 + 78))
  {
    if (v19)
    {
      if (*(_DWORD *)(a2 + 48) == 1 || (*(_BYTE *)(v11 + 16) & 2) == 0) {
        break;
      }
    }

    else if (v21 && (*(_BYTE *)(v11 + 16) & 1) == 0)
    {
      break;
    }

    *(_WORD *)(a2 + 76) = 0;
    uint64_t v24 = v23[1];
    uint64_t v25 = v24 >> 8;
    if ((v24 & 1) != 0) {
      uint64_t v25 = *(void *)(*(void *)a4 + v25);
    }
    uint64_t v27 = *v23;
    v23 += 2;
    uint64_t v26 = v27;
    if ((v24 & 2) != 0) {
      uint64_t v28 = a5;
    }
    else {
      uint64_t v28 = 2LL;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t))(*(void *)v26 + 40LL))( v26,  a2,  a3,  &a4[v25],  v28,  a6);
    int v19 = *(unsigned __int8 *)(a2 + 76);
    v20 |= v19;
    int v21 = *(unsigned __int8 *)(a2 + 77);
    v22 |= v21;
  }

  *(_BYTE *)(a2 + 76) = v20 != 0;
  *(_BYTE *)(a2 + 77) = v22 != 0;
}

void __cxxabiv1::__si_class_type_info::search_above_dst( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = a1;
  uint64_t v12 = *(void *)(a2 + 16);
  if ((a6 & 1) != 0)
  {
    if (v12 != a1)
    {
      a1 = strcmp( (const char *)(*(void *)(a1 + 8) & 0x7FFFFFFFFFFFFFFFLL),  (const char *)(*(void *)(v12 + 8) & 0x7FFFFFFFFFFFFFFFLL));
      if ((_DWORD)a1) {
        goto LABEL_4;
      }
    }
  }

  else
  {
    a1 = std::type_info::operator==[abi:ne180100](a1, v12);
    if ((a1 & 1) == 0)
    {
LABEL_4:
      (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)(v11 + 16) + 40LL))( *(void *)(v11 + 16),  a2,  a3,  a4,  a5,  a6);
      return;
    }
  }

  __cxxabiv1::__class_type_info::process_static_type_above_dst(a1, a2, a3, a4, a5);
}

void __cxxabiv1::__class_type_info::search_above_dst( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, char a6)
{
  uint64_t v10 = *(void *)(a2 + 16);
  if ((a6 & 1) == 0)
  {
    a1 = std::type_info::operator==[abi:ne180100](a1, v10);
    if ((a1 & 1) == 0) {
      return;
    }
LABEL_6:
    __cxxabiv1::__class_type_info::process_static_type_above_dst(a1, a2, a3, a4, a5);
    return;
  }

  if (v10 == a1) {
    goto LABEL_6;
  }
  a1 = strcmp( (const char *)(*(void *)(a1 + 8) & 0x7FFFFFFFFFFFFFFFLL),  (const char *)(*(void *)(v10 + 8) & 0x7FFFFFFFFFFFFFFFLL));
  if (!(_DWORD)a1) {
    goto LABEL_6;
  }
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
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

void *__cdecl operator new(size_t __sz, std::align_val_t a2, const std::nothrow_t *a3)
{
  return operator new(__sz, a2);
}

void sub_180420FAC(void *a1)
{
}

void *__cdecl operator new[](size_t __sz, std::align_val_t a2, const std::nothrow_t *a3)
{
  return operator new(__sz, a2);
}

void sub_180420FD4(void *a1)
{
}

void operator delete(void *__p, size_t __sz, std::align_val_t a3)
{
}

void operator delete[](void *__p, size_t __sz, std::align_val_t a3)
{
}

void operator new( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  __vtable(a1, a2, a3, a4, a5, a6, a7, a8);
}

  ;
}

void operator new[]( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  __vtable(a1, a2, a3, a4, a5, a6, a7, a8);
}

  ;
}

void (*$_0::operator()(void)const::{lambda(unsigned long,std::__type_descriptor_t)#2}::__invoke( unint64_t a1))(void)
{
  uint64_t result = __typed_operator_new_impl[abi:ne180100](a1);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    uint64_t v3 = std::bad_alloc::bad_alloc(exception);
  }

  return result;
}

void (*__typed_operator_new_impl[abi:ne180100](unint64_t a1))(void)
{
  if (a1 <= 1) {
    size_t v1 = 1LL;
  }
  else {
    size_t v1 = a1;
  }
  while (1)
  {
    uint64_t result = (void (*)(void))malloc(v1);
    if (result) {
      break;
    }
    uint64_t result = std::get_new_handler();
    if (!result) {
      break;
    }
    result();
  }

  return result;
}

void (*$_0::operator()(void)const::{lambda(unsigned long,std::__type_descriptor_t)#4}::__invoke( unint64_t a1))(void)
{
  uint64_t result = __typed_operator_new_impl[abi:ne180100](a1);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    uint64_t v3 = std::bad_alloc::bad_alloc(exception);
  }

  return result;
}

void $_1::__invoke( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void $_2::__invoke( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void $_3::__invoke( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void $_4::__invoke( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _GLOBAL__sub_I_stdlib_typed_new_cpp()
{
  BOOL v1 = (unint64_t)operator new[] < (unint64_t)operator new
    || (unint64_t)operator new[] > (unint64_t)_Unwind_DeleteException;
  int v2 = (unint64_t)operator new > (unint64_t)_Unwind_DeleteException || v1;
  uint64_t v3 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))$_0::operator()(void)const::{lambda(unsigned long,std::__type_descriptor_t)#4}::__invoke;
  if (v2) {
    uint64_t v3 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))$_0::operator()(void)const::{lambda(unsigned long,std::__type_descriptor_t)#3}::__invoke;
  }
  BOOL v5 = (unint64_t)operator new[] < (unint64_t)operator new
    || (unint64_t)operator new[] > (unint64_t)_Unwind_DeleteException;
  BOOL v6 = (unint64_t)operator new < (unint64_t)operator new
    || (unint64_t)operator new > (unint64_t)_Unwind_DeleteException;
  int v7 = v6 || v5;
  int v8 = v6;
  if (v7) {
    uint64_t v9 = $_0::operator()(void)const::{lambda(unsigned long,std::nothrow_t const&,std::__type_descriptor_t)#3}::__invoke;
  }
  else {
    uint64_t v9 = (void *(__cdecl *)(size_t, const std::nothrow_t *))$_0::operator()(void)const::{lambda(unsigned long,std::nothrow_t const&,std::__type_descriptor_t)#4}::__invoke;
  }
  if (v8) {
    uint64_t v10 = $_0::operator()(void)const::{lambda(unsigned long,std::nothrow_t const&,std::__type_descriptor_t)#1}::__invoke;
  }
  else {
    uint64_t v10 = (void *(__cdecl *)(size_t, const std::nothrow_t *))$_0::operator()(void)const::{lambda(unsigned long,std::nothrow_t const&,std::__type_descriptor_t)#2}::__invoke;
  }
  uint64_t v11 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))$_0::operator()(void)const::{lambda(unsigned long,std::__type_descriptor_t)#2}::__invoke;
  __vtable = v11;
  __vtable = v3;
  __vtable = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v10;
  __vtable = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v9;
}

void *__cxxabiv1::__setExceptionClass(void *result, uint64_t a2)
{
  *uint64_t result = a2;
  return result;
}

uint64_t __cxxabiv1::__getExceptionClass(const _Unwind_Exception *a1)
{
  return a1->exception_class;
}

BOOL __cxxabiv1::__isOurExceptionClass(const _Unwind_Exception *a1)
{
  return a1->exception_class >> 8 == 0x434C4E47432B2BLL;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  size_t v1 = (thrown_size + 143) & 0xFFFFFFFFFFFFFFF0LL;
  int v2 = __cxxabiv1::__aligned_malloc_with_fallback(v1);
  uint64_t v3 = v2;
  if (!v2) {
    std::terminate();
  }
  bzero(v2, v1);
  return v3 + 32;
}

void *__cxa_begin_catch(void *a1)
{
  BOOL isOurExceptionClass = __cxxabiv1::__isOurExceptionClass((const _Unwind_Exception *)a1);
  globals = (uintptr_t *)__cxa_get_globals();
  uint64_t v4 = __cxxabiv1::cxa_exception_from_exception_unwind_exception((_Unwind_Exception *)a1);
  if (isOurExceptionClass)
  {
    int private_2 = v4[1].private_2;
    if (private_2 < 0) {
      int private_2 = -private_2;
    }
    LODWORD(v4[1].private_2) = private_2 + 1;
    if (v4 != (_Unwind_Exception *)*globals)
    {
      v4[1].private_1 = *globals;
      uintptr_t *globals = (uintptr_t)v4;
    }

    --*((_DWORD *)globals + 2);
    return (void *)v4[2].private_2;
  }

  else
  {
    if (*globals) {
      std::terminate();
    }
    uintptr_t *globals = (uintptr_t)v4;
    return (char *)a1 + 32;
  }

void __cxa_free_exception(void *a1)
{
}

uint64_t __cxa_init_primary_exception(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a1 - 128;
  *(void *)(a1 - 120) = 0LL;
  *(void *)(a1 - 96) = std::get_unexpected();
  *(void *)(a1 - 8++*((_DWORD *)this + 8) = std::get_terminate();
  *(void *)(a1 - 112) = a2;
  *(void *)(a1 - 104) = a3;
  *(void *)(a1 - 32) = 0x434C4E47432B2B00LL;
  *(void *)(a1 - qmemcpy((void *)(*(void *)this + *((void *)this + 1)), "construction vtable for ", 24) = __cxxabiv1::exception_cleanup_func;
  return v6;
}

void __cxxabiv1::exception_cleanup_func(_Unwind_Reason_Code a1, _Unwind_Exception *a2)
{
  if (a1 != _URC_FOREIGN_EXCEPTION_CAUGHT) {
    std::__terminate((void (*)(void))a2[-2].exception_cleanup);
  }
  __cxa_decrement_exception_refcount(&a2[1]);
}

double __cxa_allocate_dependent_exception()
{
  uint64_t v0 = __cxxabiv1::__aligned_malloc_with_fallback(0x80uLL);
  if (!v0) {
    std::terminate();
  }
  double result = 0.0;
  *((_OWORD *)v0 + 6) = 0u;
  *((_OWORD *)v0 + 7) = 0u;
  *((_OWORD *)v0 + 4) = 0u;
  *((_OWORD *)v0 + 5) = 0u;
  *((_OWORD *)v0 + 2) = 0u;
  *((_OWORD *)v0 + 3) = 0u;
  *(_OWORD *)uint64_t v0 = 0u;
  *((_OWORD *)v0 + 1) = 0u;
  return result;
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  globals = __cxa_get_globals();
  ++globals[2];
  inited = (_Unwind_Exception *)__cxa_init_primary_exception((uint64_t)a1, (uint64_t)lptinfo, (uint64_t)a3);
  inited->exception_cleanup = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))1;
  _Unwind_RaiseException(inited + 3);
  __cxxabiv1::failed_throw((uint64_t)inited);
}

void __cxxabiv1::failed_throw(uint64_t a1)
{
}

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)*((void *)a1 - 1);
}

_Unwind_Exception *__cxxabiv1::cxa_exception_from_exception_unwind_exception(_Unwind_Exception *a1)
{
  return a1 - 3;
}

void __cxa_end_catch(void)
{
  globals_fast = (uint64_t *)__cxa_get_globals_fast();
  uint64_t v2 = *globals_fast;
  if (*globals_fast)
  {
    if (*(void *)(v2 + 96) >> 8 == 0x434C4E47432B2BLL)
    {
      int v3 = *(_DWORD *)(v2 + 56);
      if (v3 < 0)
      {
        *(_DWORD *)(v2 + 56) = v3 + 1;
        if (v3 == -1) {
          uint64_t *globals_fast = *(void *)(v2 + 48);
        }
      }

      else
      {
        int v4 = v3 - 1;
        *(_DWORD *)(v2 + 56) = v4;
        if (!v4)
        {
          uint64_t *globals_fast = *(void *)(v2 + 48);
          if (*(_BYTE *)(v2 + 96) == 1LL)
          {
            uint64_t v5 = *(void *)(v2 + 8) - 128LL;
            __cxxabiv1::__aligned_free_with_fallback((void *)v2, v0);
            uint64_t v2 = v5;
          }

          __cxa_decrement_exception_refcount((void *)(v2 + 128));
        }
      }
    }

    else
    {
      _Unwind_DeleteException((_Unwind_Exception *)(v2 + 96));
      uint64_t *globals_fast = 0LL;
    }
  }

void __cxa_decrement_exception_refcount(void *primary_exception)
{
  if (primary_exception)
  {
    uint64_t v2 = (char *)primary_exception - 128;
    int v3 = (unint64_t *)((char *)primary_exception - 120);
    do
    {
      unint64_t v4 = __ldaxr(v3);
      unint64_t v5 = v4 - 1;
    }

    while (__stlxr(v5, v3));
    if (!v5)
    {
      uint64_t v6 = (void (*)(void))*((void *)primary_exception - 13);
      if (v6) {
        v6();
      }
      __cxxabiv1::__aligned_free_with_fallback(v2, v1);
    }
  }

struct type_info *__cxa_current_exception_type(void)
{
  double result = (struct type_info *)__cxa_get_globals_fast();
  if (result)
  {
    uint64_t v1 = *(void *)result;
    if (*(void *)result && *(void *)(v1 + 96) >> 8 == 0x434C4E47432B2BLL) {
      return *(struct type_info **)(v1 + 16);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

void __cxa_rethrow(void)
{
  globals = __cxa_get_globals();
  uint64_t v1 = *(void *)globals;
  if (*(void *)globals)
  {
    unint64_t v2 = *(void *)(v1 + 96) & 0xFFFFFFFFFFFFFF00LL;
    if (v2 == 0x434C4E47432B2B00LL)
    {
      *(_DWORD *)(v1 + 56) = -*(_DWORD *)(v1 + 56);
      ++globals[2];
    }

    else
    {
      *(void *)globals = 0LL;
    }

    _Unwind_RaiseException((_Unwind_Exception *)(v1 + 96));
    __cxa_begin_catch((void *)(v1 + 96));
    if (v2 == 0x434C4E47432B2B00LL) {
      std::__terminate(*(void (**)(void))(v1 + 40));
    }
  }

  std::terminate();
}

void __cxa_increment_exception_refcount(void *primary_exception)
{
  if (primary_exception)
  {
    uint64_t v1 = (unint64_t *)((char *)primary_exception - 120);
    do
      unint64_t v2 = __ldaxr(v1);
    while (__stlxr(v2 + 1, v1));
  }

void *__cxa_current_primary_exception(void)
{
  double result = __cxa_get_globals_fast();
  if (result)
  {
    uint64_t v1 = *(void **)result;
    if (*(void *)result && v1[12] >> 8 == 0x434C4E47432B2BLL)
    {
      double result = v1 + 16;
      unint64_t v2 = v1 + 1;
      do
        unint64_t v3 = __ldaxr(v2);
      while (__stlxr(v3 + 1, v2));
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void __cxa_rethrow_primary_exception(void *primary_exception)
{
  if (primary_exception)
  {
    __cxa_allocate_dependent_exception();
    unint64_t v3 = v2;
    v2->exception_cleanup = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))primary_exception;
    unint64_t v4 = (unint64_t *)((char *)primary_exception - 120);
    do
      unint64_t v5 = __ldaxr(v4);
    while (__stlxr(v5 + 1, v4));
    v2->private_1 = *((void *)primary_exception - 14);
    v2[1].exception_class = (uint64_t)std::get_unexpected();
    std::terminate_handler terminate = std::get_terminate();
    v3[3].exception_class = 0x434C4E47432B2B01LL;
    int v7 = v3 + 3;
    v7[-2].exception_cleanup = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))terminate;
    globals = __cxa_get_globals();
    ++globals[2];
    v7->exception_cleanup = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))__cxxabiv1::dependent_exception_cleanup;
    _Unwind_RaiseException(v7);
    __cxa_begin_catch(v7);
  }

void __cxxabiv1::dependent_exception_cleanup(_Unwind_Reason_Code a1, _Unwind_Exception *a2)
{
  if (a1 != _URC_FOREIGN_EXCEPTION_CAUGHT) {
    std::__terminate((void (*)(void))a2[-2].exception_cleanup);
  }
  unint64_t v2 = a2 - 3;
  __cxa_decrement_exception_refcount(a2[-3].exception_cleanup);
  __cxxabiv1::__aligned_free_with_fallback(v2, v3);
}

BOOL __cxa_uncaught_exception(void)
{
  return __cxa_uncaught_exceptions() != 0;
}

unsigned int __cxa_uncaught_exceptions(void)
{
  globals_fast = __cxa_get_globals_fast();
  if (globals_fast) {
    LODWORD(globals_fast) = globals_fast[2];
  }
  return globals_fast;
}

uint64_t __gxx_personality_v0( int a1, int a2, uint64_t a3, _Unwind_Exception *new_value, _Unwind_Context *context)
{
  uint64_t result = 3LL;
  if (a1 != 1 || !new_value || !context) {
    return result;
  }
  char v9 = a2;
  unint64_t v10 = a3 & 0xFFFFFFFFFFFFFF00LL;
  if (a2 == 6 && v10 == 0x434C4E47432B2B00LL)
  {
    int private_2_high = HIDWORD(new_value[-2].private_2);
    *(void *)uint64_t v78 = private_2_high;
    __int128 v12 = *(_OWORD *)&new_value[-1].private_1;
    *(_OWORD *)&v78[8] = *(_OWORD *)&new_value[-1].exception_class;
    *(_OWORD *)&v78[24] = v12;
    __cxxabiv1::set_registers((uintptr_t)new_value, context, (uintptr_t *)v78);
    if (private_2_high < 0) {
      goto LABEL_7;
    }
    return 7LL;
  }

  memset(v78, 0, sizeof(v78));
  int v79 = 3;
  BOOL v13 = (a2 & 1) == 0;
  if ((a2 & 1) != 0)
  {
    if ((a2 & 0xE) != 0) {
      return result;
    }
  }

  else
  {
    if ((a2 & 2) == 0) {
      return result;
    }
    if ((~a2 & 0xC) == 0)
    {
      int v79 = 2;
      __cxxabiv1::set_registers((uintptr_t)new_value, context, (uintptr_t *)v78);
      return 7LL;
    }
  }

  uintptr_t LanguageSpecificData = _Unwind_GetLanguageSpecificData(context);
  if (!LanguageSpecificData) {
    return 8LL;
  }
  unint64_t v15 = (unsigned __int8 *)LanguageSpecificData;
  int v72 = v13;
  *(void *)&v78[16] = LanguageSpecificData;
  uintptr_t IP = _Unwind_GetIP(context);
  uintptr_t RegionStart = _Unwind_GetRegionStart(context);
  uintptr_t v18 = RegionStart;
  unsigned int v21 = *v15;
  int v20 = v15 + 1;
  unsigned int v19 = v21;
  uint64_t v82 = v20;
  if (v21 == 255)
  {
    EncodedPointer = (char *)RegionStart;
  }

  else
  {
    EncodedPointer = (char *)__cxxabiv1::readEncodedPointer((const unsigned __int8 **)&v82, v19, 0LL);
    int v20 = v82;
  }

  int v23 = *v20;
  int v22 = v20 + 1;
  uint64_t v82 = v22;
  char v77 = v23;
  if (v23 == 255)
  {
    uint64_t v76 = 0LL;
  }

  else
  {
    uint64_t v24 = 0LL;
    uint64_t v25 = 0LL;
    do
    {
      char v26 = *v22++;
      v24 |= (unint64_t)(v26 & 0x7F) << v25;
      v25 += 7LL;
    }

    while (v26 < 0);
    uint64_t v76 = &v22[v24];
  }

  unint64_t v73 = v10;
  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  unint64_t v29 = IP + ~v18;
  uint64_t v30 = v22 + 1;
  uint64_t v82 = v22 + 1;
  unsigned int v31 = *v22;
  do
  {
    char v32 = *v30++;
    v27 |= (unint64_t)(v32 & 0x7F) << v28;
    v28 += 7LL;
  }

  while (v32 < 0);
  uint64_t v81 = v30;
  uint64_t v82 = v30;
  uint64_t v71 = v27;
  uint64_t v33 = &v30[v27];
  uint64_t v34 = v30;
  while (1)
  {
    if (v34 >= v33) {
LABEL_32:
    }
      __cxxabiv1::call_terminate(v73 == 0x434C4E47432B2B00LL, new_value);
    unint64_t v35 = __cxxabiv1::readEncodedPointer((const unsigned __int8 **)&v81, v31, 0LL);
    unint64_t v36 = __cxxabiv1::readEncodedPointer((const unsigned __int8 **)&v81, v31, 0LL);
    unint64_t v37 = __cxxabiv1::readEncodedPointer((const unsigned __int8 **)&v81, v31, 0LL);
    uint64_t v38 = 0LL;
    uint64_t v39 = 0LL;
    uint64_t v34 = v81;
    do
    {
      char v40 = *v34++;
      v38 |= (unint64_t)(v40 & 0x7F) << v39;
      v39 += 7LL;
    }

    while (v40 < 0);
    uint64_t v81 = v34;
    if (v35 <= v29 && v29 < v36 + v35) {
      break;
    }
    if (v29 < v35) {
      goto LABEL_32;
    }
  }

  if (!v37) {
    return 8LL;
  }
  *(void *)&v78[24] = &EncodedPointer[v37];
  if (!v38)
  {
LABEL_66:
    if (v72) {
      uint64_t result = 6LL;
    }
    else {
      uint64_t result = 8LL;
    }
    int v79 = result;
    if (v72) {
      goto LABEL_77;
    }
    return result;
  }

  uint64_t v41 = 0LL;
  uint64_t v42 = (uint64_t)&v30[v71 - 1 + v38];
  uint64_t v75 = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))&new_value[1];
  while (1)
  {
    uint64_t v43 = 0LL;
    unint64_t v44 = 0LL;
    uint64_t v45 = (unsigned __int8 *)v42;
    do
    {
      unsigned int v47 = *v45++;
      unsigned int v46 = v47;
      v43 |= (unint64_t)(v47 & 0x7F) << v44;
      v44 += 7LL;
    }

    while ((v47 & 0x80) != 0);
    BOOL v48 = v44 < 0x40;
    uint64_t v49 = -1LL << v44;
    if ((v48 & (v46 >> 6)) == 0) {
      uint64_t v49 = 0LL;
    }
    uint64_t v50 = v43 | v49;
    if ((v43 | v49) >= 1)
    {
      unint64_t shim_type_info = __cxxabiv1::get_shim_type_info(v43 | v49, v76, v77, v73 == 0x434C4E47432B2B00LL, new_value, 0LL);
      if (!shim_type_info) {
        goto LABEL_71;
      }
      if (v73 != 0x434C4E47432B2B00LL) {
        goto LABEL_48;
      }
      unint64_t v52 = shim_type_info;
      uint64_t v80 = 0LL;
      uint64_t ExceptionClass = __cxxabiv1::__getExceptionClass(new_value);
      exception_cleanup = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))&new_value[1];
      if (ExceptionClass == 0x434C4E47432B2B01LL) {
        exception_cleanup = new_value[-3].exception_cleanup;
      }
      uint64_t v80 = exception_cleanup;
      if (!exception_cleanup) {
        goto LABEL_84;
      }
      uintptr_t private_1 = new_value[-3].private_1;
      if (!private_1) {
        goto LABEL_84;
      }
      if (!(*(unsigned int (**)(unint64_t, uintptr_t, void (__cdecl **)(_Unwind_Reason_Code, _Unwind_Exception *)))(*(void *)v52 + 32LL))( v52,  private_1,  &v80))
      {
LABEL_48:
        uint64_t v56 = v41;
        goto LABEL_57;
      }

      *(void *)uint64_t v78 = v50;
      *(void *)&v78[8] = v42;
      uint64_t v68 = v80;
LABEL_75:
      *(void *)&v78[32] = v68;
      goto LABEL_76;
    }

    uint64_t v56 = (v50 == 0) | v41;
    if ((v9 & 8) == 0 && v50)
    {
      if (v73 != 0x434C4E47432B2B00LL)
      {
LABEL_71:
        *(void *)uint64_t v78 = v50;
        *(void *)&v78[8] = v42;
        if (__cxxabiv1::__getExceptionClass(new_value) == 0x434C4E47432B2B01LL) {
          uint64_t v75 = new_value[-3].exception_cleanup;
        }
        uint64_t v68 = v75;
        goto LABEL_75;
      }

      uint64_t v57 = (void (__cdecl *)(_Unwind_Reason_Code, _Unwind_Exception *))&new_value[1];
      if (__cxxabiv1::__getExceptionClass(new_value) == 0x434C4E47432B2B01LL) {
        uint64_t v57 = new_value[-3].exception_cleanup;
      }
      if (!v57 || (uint64_t v58 = (const __cxxabiv1::__shim_type_info *)new_value[-3].private_1) == 0LL)
      {
LABEL_84:
        __cxa_begin_catch(new_value);
        std::__terminate((void (*)(void))new_value[-2].exception_cleanup);
      }

      BOOL can_catch = __cxxabiv1::exception_spec_can_catch(v50, v76, v77, v58, v57, new_value, 0LL);
      uint64_t v56 = v41;
      if (can_catch) {
        break;
      }
    }

LABEL_57:
    uint64_t v60 = 0LL;
    unint64_t v61 = 0LL;
    uint64_t v62 = v45;
    do
    {
      unsigned int v64 = *v62++;
      unsigned int v63 = v64;
      v60 |= (unint64_t)(v64 & 0x7F) << v61;
      v61 += 7LL;
    }

    while ((v64 & 0x80) != 0);
    BOOL v65 = v61 < 0x40;
    uint64_t v66 = -1LL << v61;
    if ((v65 & (v63 >> 6)) == 0) {
      uint64_t v66 = 0LL;
    }
    uint64_t v67 = v60 | v66;
    if (!v67)
    {
      int v72 = v56 & ((v9 & 2) >> 1);
      goto LABEL_66;
    }

    uint64_t v42 = (uint64_t)&v45[v67];
    uint64_t v41 = v56;
  }

  *(void *)uint64_t v78 = v50;
  *(void *)&v78[8] = v42;
  *(void *)&v78[32] = v57;
LABEL_76:
  int v79 = 6;
LABEL_77:
  if ((v9 & 1) != 0)
  {
    if (v73 == 0x434C4E47432B2B00LL)
    {
      HIDWORD(new_value[-2].private_2) = *(_DWORD *)v78;
      __int128 v70 = *(_OWORD *)&v78[24];
      *(_OWORD *)&new_value[-1].exception_class = *(_OWORD *)&v78[8];
      *(_OWORD *)&new_value[-1].uintptr_t private_1 = v70;
    }

    return 6LL;
  }

  else
  {
    uint64_t v69 = *(void *)v78;
    __cxxabiv1::set_registers((uintptr_t)new_value, context, (uintptr_t *)v78);
    if (v69 < 0) {
LABEL_7:
    }
      new_value[-1].uintptr_t private_1 = 0LL;
    return 7LL;
  }

void __cxxabiv1::set_registers(uintptr_t new_value, _Unwind_Context *context, uintptr_t *a3)
{
}

void __cxa_call_unexpected(void *a1)
{
  if (!a1)
  {
    __cxa_begin_catch(0LL);
    std::terminate();
  }

  __cxa_begin_catch(a1);
  if (__cxxabiv1::__isOurExceptionClass((const _Unwind_Exception *)a1))
  {
    unexpected = (void (*)(void))*((void *)a1 - 8);
  }

  else
  {
    std::get_terminate();
    unexpected = std::get_unexpected();
  }

  std::__unexpected(unexpected);
}

void sub_180421E60( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *a10, std::bad_exception a11, unsigned __int8 *a12)
{
}

void sub_180421FE0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::bad_exception a11)
{
}

void __cxxabiv1::call_terminate(int a1, _Unwind_Exception *a2)
{
  if (a1) {
    std::__terminate((void (*)(void))a2[-2].exception_cleanup);
  }
  std::terminate();
}

unint64_t __cxxabiv1::readEncodedPointer(const unsigned __int8 **a1, unsigned int a2, uint64_t a3)
{
  if (a2 != 255)
  {
    unint64_t v3 = *a1;
    switch(a2 & 0xF)
    {
      case 0u:
      case 4u:
      case 0xCu:
        unint64_t v5 = v3 + 8;
        unint64_t v4 = *(void *)v3;
        goto LABEL_17;
      case 1u:
        unint64_t v4 = 0LL;
        uint64_t v6 = 0LL;
        unint64_t v5 = *a1;
        do
        {
          char v7 = *v5++;
          v4 |= (unint64_t)(v7 & 0x7F) << v6;
          v6 += 7LL;
        }

        while (v7 < 0);
        goto LABEL_17;
      case 2u:
        unint64_t v5 = v3 + 2;
        unint64_t v4 = *(unsigned __int16 *)v3;
        goto LABEL_17;
      case 3u:
        unint64_t v5 = v3 + 4;
        unint64_t v4 = *(unsigned int *)v3;
        goto LABEL_17;
      case 9u:
        uint64_t v8 = 0LL;
        unint64_t v9 = 0LL;
        unint64_t v5 = *a1;
        do
        {
          unsigned int v11 = *v5++;
          unsigned int v10 = v11;
          v8 |= (unint64_t)(v11 & 0x7F) << v9;
          v9 += 7LL;
        }

        while ((v11 & 0x80) != 0);
        BOOL v12 = v9 < 0x40;
        uint64_t v13 = -1LL << v9;
        if ((v12 & (v10 >> 6)) == 0) {
          uint64_t v13 = 0LL;
        }
        unint64_t v4 = v8 | v13;
        goto LABEL_17;
      case 0xAu:
        unint64_t v5 = v3 + 2;
        unint64_t v4 = *(__int16 *)v3;
        goto LABEL_17;
      case 0xBu:
        unint64_t v5 = v3 + 4;
        unint64_t v4 = *(int *)v3;
LABEL_17:
        int v14 = (a2 >> 4) & 7;
        switch(v14)
        {
          case 0:
            goto LABEL_22;
          case 3:
            if (!v4) {
              goto LABEL_28;
            }
            v4 += a3;
            if (!v4) {
              goto LABEL_28;
            }
            break;
          case 1:
            if (!v4) {
              goto LABEL_28;
            }
            v4 += (unint64_t)v3;
LABEL_22:
            if (!v4)
            {
LABEL_28:
              *a1 = v5;
              return v4;
            }

            break;
          default:
LABEL_30:
            abort();
        }

        if ((a2 & 0x80) != 0) {
          unint64_t v4 = *(void *)v4;
        }
        goto LABEL_28;
      default:
        goto LABEL_30;
    }
  }

  return 0LL;
}

BOOL __cxxabiv1::exception_spec_can_catch( uint64_t a1, const unsigned __int8 *a2, char a3, const __cxxabiv1::__shim_type_info *a4, void *a5, _Unwind_Exception *a6, uint64_t a7)
{
  if (!a2)
  {
    __cxa_begin_catch(a6);
    std::terminate();
  }

  uint64_t v13 = 0LL;
  char v14 = 0;
  for (uint64_t i = ~a1; ; ++i)
  {
    v13 |= (unint64_t)(a2[i] & 0x7F) << v14;
    if ((a2[i] & 0x80) == 0) {
      break;
    }
    v14 += 7;
LABEL_8:
    ;
  }

  if (v13)
  {
    unint64_t shim_type_info = __cxxabiv1::get_shim_type_info(v13, a2, a3, 1, a6, a7);
    uintptr_t v18 = a5;
    if (!(*(unsigned int (**)(unint64_t, const __cxxabiv1::__shim_type_info *, void **))(*(void *)shim_type_info + 32LL))( shim_type_info,  a4,  &v18))
    {
      uint64_t v13 = 0LL;
      char v14 = 0;
      goto LABEL_8;
    }
  }

  return v13 == 0;
}

unint64_t __cxxabiv1::get_shim_type_info( uint64_t a1, const unsigned __int8 *a2, char a3, int a4, _Unwind_Exception *a5, uint64_t a6)
{
  if (!a2 || (a3 & 0xFu) >= 0xD || ((0x1C1Du >> (a3 & 0xF)) & 1) == 0) {
    __cxxabiv1::call_terminate(a4, a5);
  }
  char v7 = (unsigned __int8 *)&a2[qword_180425638[a3 & 0xF] * a1];
  return __cxxabiv1::readEncodedPointer((const unsigned __int8 **)&v7, a3, a6);
}

int __cxa_guard_acquire(__guard *a1)
{
  unint64_t v4 = "__cxa_guard_acquire";
  uint64_t v5 = pthread_mutex_lock(&stru_18C439E48);
  if ((_DWORD)v5) {
    abort_message("%s failed to acquire mutex", v6, v7, v8, v9, v10, v11, v12, (char)"__cxa_guard_acquire");
  }
  char v13 = *((_BYTE *)a1 + 1);
  if ((v13 & 2) != 0)
  {
    int v14 = *((_DWORD *)a1 + 1);
    unint64_t v15 = pthread_self();
    uint64_t v5 = pthread_mach_thread_np(v15);
    LODWORD(v4) = v5;
    if (v14 == (_DWORD)v5) {
      abort_message( "__cxa_guard_acquire detected recursive initialization: do you have a function-local static variable whose initia lization depends on that function?",  v16,  v17,  v18,  v19,  v20,  v21,  v22,  v26);
    }
  }

  while (1)
  {
    int v23 = *((unsigned __int8 *)a1 + 1);
    if ((v23 & 2) == 0) {
      break;
    }
    *((_BYTE *)a1 + 1) = v23 | 4;
    uint64_t v5 = pthread_cond_wait(&_MergedGlobals, &stru_18C439E48);
  }

  if (v23 != 1)
  {
    if ((v13 & 2) == 0)
    {
      uint64_t v24 = pthread_self();
      uint64_t v5 = pthread_mach_thread_np(v24);
      LODWORD(v4) = v5;
    }

    *((_DWORD *)a1 + 1) = (_DWORD)v4;
    *((_BYTE *)a1 + 1) = 2;
  }

  BOOL v2 = v23 != 1;
  OUTLINED_FUNCTION_1(v5);
  return v2;
}

void sub_1804223AC(_Unwind_Exception *a1)
{
}

void __cxa_guard_release(__guard *a1)
{
  uint64_t v2 = pthread_mutex_lock(&stru_18C439E48);
  if ((_DWORD)v2) {
    abort_message("%s failed to acquire mutex", v3, v4, v5, v6, v7, v8, v9, (char)"__cxa_guard_release");
  }
  char v10 = *((_BYTE *)a1 + 1);
  *((_BYTE *)a1 + 1) = 1;
  OUTLINED_FUNCTION_1(v2);
  if ((v10 & 4) != 0 && pthread_cond_broadcast(&_MergedGlobals)) {
    abort_message("%s failed to broadcast", v11, v12, v13, v14, v15, v16, v17, (char)"__cxa_guard_release");
  }
  OUTLINED_FUNCTION_0();
}

void __cxa_guard_abort(__guard *a1)
{
  uint64_t v2 = pthread_mutex_lock(&stru_18C439E48);
  if ((_DWORD)v2) {
    abort_message("%s failed to acquire mutex", v3, v4, v5, v6, v7, v8, v9, (char)"__cxa_guard_abort");
  }
  *((_DWORD *)a1 + 1) = 0;
  char v10 = *((_BYTE *)a1 + 1);
  *((_BYTE *)a1 + 1) = 0;
  OUTLINED_FUNCTION_1(v2);
  if ((v10 & 4) != 0 && pthread_cond_broadcast(&_MergedGlobals)) {
    abort_message("%s failed to broadcast", v11, v12, v13, v14, v15, v16, v17, (char)"__cxa_guard_abort");
  }
  OUTLINED_FUNCTION_0();
}

void *__cdecl operator new(size_t __sz)
{
  if (__sz <= 1) {
    size_t v1 = 1LL;
  }
  else {
    size_t v1 = __sz;
  }
  while (1)
  {
    uint64_t result = malloc(v1);
    if (result) {
      break;
    }
    new_handler = std::get_new_handler();
    if (!new_handler)
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      uint64_t v5 = std::bad_alloc::bad_alloc(exception);
    }

    new_handler();
  }

  return result;
}

{
  return __Znwm(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return operator new(__sz);
}

{
  return __ZnwmRKSt9nothrow_t(__sz, a2);
}

void sub_180422534(void *a1)
{
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
{
  return operator new[](__sz);
}

{
  return __ZnamRKSt9nothrow_t(__sz, a2);
}

void sub_180422560(void *a1)
{
}

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
{
  if (__sz <= 1) {
    size_t v2 = 1LL;
  }
  else {
    size_t v2 = __sz;
  }
  if (a2 <= 8) {
    std::align_val_t v3 = 8LL;
  }
  else {
    std::align_val_t v3 = a2;
  }
  else {
    size_t v4 = (v2 + v3 - 1) & -(uint64_t)v3;
  }
  while (1)
  {
    uint64_t result = aligned_alloc(v3, v4);
    if (result) {
      break;
    }
    new_handler = std::get_new_handler();
    if (!new_handler)
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      uint64_t v8 = std::bad_alloc::bad_alloc(exception);
    }

    new_handler();
  }

  return result;
}

{
  return __ZnwmSt11align_val_t(__sz, a2);
}

void _Unwind_DeleteException(_Unwind_Exception *exception_object)
{
}

uintptr_t _Unwind_GetIP(_Unwind_Context *context)
{
  return MEMORY[0x1895F87F0](context);
}

uintptr_t _Unwind_GetLanguageSpecificData(_Unwind_Context *context)
{
  return MEMORY[0x1895F87F8](context);
}

uintptr_t _Unwind_GetRegionStart(_Unwind_Context *context)
{
  return MEMORY[0x1895F8800](context);
}

_Unwind_Reason_Code _Unwind_RaiseException(_Unwind_Exception *exception_object)
{
  return MEMORY[0x1895F8808](exception_object);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _Unwind_SetGR(_Unwind_Context *context, int index, uintptr_t new_value)
{
}

void _Unwind_SetIP(_Unwind_Context *a1, uintptr_t new_value)
{
}

void operator delete[](void *__p)
{
}

void operator delete[](void *__p, const std::nothrow_t *a2)
{
}

void operator delete[](void *__p, std::align_val_t a2)
{
}

void operator delete[](void *__p, size_t __sz)
{
}

void operator delete(void *__p)
{
}

void operator delete(void *__p, const std::nothrow_t *a2)
{
}

void operator delete(void *__p, std::align_val_t a2)
{
}

void operator delete(void *__p, size_t __sz)
{
}

void *__cdecl operator new[](size_t __sz)
{
  return __Znam(__sz);
}

void *__cdecl operator new[](size_t __sz, std::align_val_t a2)
{
  return __ZnamSt11align_val_t(__sz, a2);
}

void abort(void)
{
}

void *__cdecl aligned_alloc(size_t __alignment, size_t __size)
{
  return (void *)MEMORY[0x1895F94A8](__alignment, __size);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
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

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x1895FC998](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1895FC9C8](a1, a2);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1895FCA40](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1895FCA60](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1895FCA70](a1);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1895FCAC8](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1895FCB20]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1895FCB48](a1, a2);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

void syslog(int a1, const char *a2, ...)
{
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FD510](a1, a2, a3);
}