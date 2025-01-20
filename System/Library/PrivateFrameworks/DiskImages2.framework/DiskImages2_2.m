void di_log::logger<di_log::log_printer<388ul>>::~logger(char *a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<388ul>>::~logger_buf((uint64_t)a1);
  MEMORY[0x1895BC2CC](a1 + 368);
  operator delete(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<388ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<388ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<388ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1ED068;
  di_log::logger_buf<di_log::log_printer<388ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<388ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<388ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_1881502CC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<388ul>>::~logger_buf(uint64_t a1)
{
  v1 = (void *)di_log::logger_buf<di_log::log_printer<388ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<388ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 388LL;
    __int16 v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 388LL;
      __int16 v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  result = __error();
  int *result = v5;
  return result;
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<398ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<398ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<398ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<398ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<398ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<398ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger<di_log::log_printer<398ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<398ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<398ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<398ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1ED288;
  di_log::logger_buf<di_log::log_printer<398ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<398ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<398ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_188150878( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<398ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<398ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<398ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 398LL;
    __int16 v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 398LL;
      __int16 v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  result = __error();
  int *result = v5;
  return result;
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<411ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<411ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<411ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<411ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<411ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<411ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger<di_log::log_printer<411ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<411ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<411ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<411ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1ED4A8;
  di_log::logger_buf<di_log::log_printer<411ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<411ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<411ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_188150E24( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<411ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<411ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<411ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 411LL;
    __int16 v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 411LL;
      __int16 v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  result = __error();
  int *result = v5;
  return result;
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<424ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<424ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<424ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<424ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<424ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<424ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger<di_log::log_printer<424ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<424ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<424ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<424ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1ED6C8;
  di_log::logger_buf<di_log::log_printer<424ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<424ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<424ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_1881513D0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<424ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<424ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<424ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 424LL;
    __int16 v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 424LL;
      __int16 v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  result = __error();
  int *result = v5;
  return result;
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<432ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<432ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<432ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<432ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<432ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<432ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger<di_log::log_printer<432ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<432ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<432ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<432ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1ED8E8;
  di_log::logger_buf<di_log::log_printer<432ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<432ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<432ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_18815197C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<432ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<432ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<432ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 432LL;
    __int16 v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 432LL;
      __int16 v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  result = __error();
  int *result = v5;
  return result;
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<441ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<441ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<441ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<441ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<441ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<441ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger<di_log::log_printer<441ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<441ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<441ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<441ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1EDB08;
  di_log::logger_buf<di_log::log_printer<441ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<441ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<441ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_188151F28( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<441ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<441ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<441ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 441LL;
    __int16 v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 441LL;
      __int16 v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  result = __error();
  int *result = v5;
  return result;
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<449ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<449ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<449ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<449ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<449ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<449ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger<di_log::log_printer<449ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<449ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<449ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<449ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1EDD28;
  di_log::logger_buf<di_log::log_printer<449ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<449ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<449ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_1881524D4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<449ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<449ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<449ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 449LL;
    __int16 v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 449LL;
      __int16 v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  result = __error();
  int *result = v5;
  return result;
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<489ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<489ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<489ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<489ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<489ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<489ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger<di_log::log_printer<489ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<489ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<489ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<489ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1EDF48;
  di_log::logger_buf<di_log::log_printer<489ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<489ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<489ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_188152A80( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<489ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<489ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<489ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 489LL;
    __int16 v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 489LL;
      __int16 v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  result = __error();
  int *result = v5;
  return result;
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<502ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<502ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<502ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<502ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<502ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<502ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger<di_log::log_printer<502ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<502ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<502ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<502ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1EE168;
  di_log::logger_buf<di_log::log_printer<502ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<502ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<502ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_18815302C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<502ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<502ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<502ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 502LL;
    __int16 v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 502LL;
      __int16 v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  result = __error();
  int *result = v5;
  return result;
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<643ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<643ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<643ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<643ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<643ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<643ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger<di_log::log_printer<643ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<643ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<643ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<643ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1EE388;
  di_log::logger_buf<di_log::log_printer<643ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<643ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<643ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_1881535D8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<643ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<643ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<643ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 643LL;
    __int16 v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 643LL;
      __int16 v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  result = __error();
  int *result = v5;
  return result;
}

void std::allocate_shared[abi:ne180100]<FileLocal,std::allocator<FileLocal>,FileLocal&,void>( const FileLocal *a1@<X1>, void *a2@<X8>)
{
  int v4 = operator new(0x470uLL);
  std::__shared_ptr_emplace<FileLocal>::__shared_ptr_emplace[abi:ne180100]<FileLocal&,std::allocator<FileLocal>,0>( v4,  a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  std::shared_ptr<PurgeableFileBackend>::__enable_weak_this[abi:ne180100]<Backend,PurgeableFileBackend,void>( (uint64_t)a2,  v4 + 4,  (uint64_t)(v4 + 3));
}

void sub_188153848(_Unwind_Exception *a1)
{
}

void *std::__shared_ptr_emplace<FileLocal>::__shared_ptr_emplace[abi:ne180100]<FileLocal&,std::allocator<FileLocal>,0>( void *a1, const FileLocal *a2)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_18A1CBC00;
  FileLocal::FileLocal((FileLocal *)(a1 + 3), a2);
  return a1;
}

void sub_188153890(_Unwind_Exception *a1)
{
}

void FileLocal::FileLocal(FileLocal *this, const FileLocal *a2)
{
  *(void *)uint64_t v3 = off_18A1EBA08;
  *(void *)(v3 + 24) = &unk_18A1EBAE8;
  *(void *)(v3 + 32) = &unk_18A1EBB20;
  uint64_t v4 = *((void *)a2 + 5);
  uint64_t v5 = *((void *)a2 + 6);
  *(void *)(v3 + 40) = v4;
  *(void *)(v3 + 48) = v5;
  if (v5)
  {
    char v6 = (unint64_t *)(v5 + 8);
    do
      unint64_t v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
    uint64_t v4 = *(void *)(v3 + 40);
  }

  *(void *)(v3 + 56) = v4 + 8;
  *(void *)(v3 + 64) = v3 + 88;
  *(_OWORD *)(v3 + 72) = xmmword_188179140;
}

void boost::container::vector<FileLocal::promise_io_t,boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,void>::priv_insert_forward_range_no_capacity<boost::container::dtl::insert_emplace_proxy<boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,FileLocal::promise_io_t*,FileLocal::promise_io_t>>( uint64_t *a1@<X0>, uint64_t a2@<X1>, const char *a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v10 = *a1;
  unint64_t v11 = boost::container::vector_alloc_holder<boost::container::small_vector_allocator<udif::run_io_info,boost::container::new_allocator<void>,void>,unsigned long,boost::move_detail::integral_constant<unsigned int,1u>>::next_capacity<boost::container::growth_factor_60>( (uint64_t)a1,  a3);
  if (v11 >> 57) {
    boost::container::throw_length_error((boost::container *)"get_next_capacity, allocator's max size reached", v12);
  }
  uint64_t v13 = v11;
  v14 = operator new(v11 << 6);
  boost::container::vector<FileLocal::promise_io_t,boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,void>::priv_insert_forward_range_new_allocation<boost::container::dtl::insert_emplace_proxy<boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,FileLocal::promise_io_t*,FileLocal::promise_io_t>>( a1,  (uint64_t)v14,  v13,  a2,  (uint64_t)a3,  a4);
  *a5 = *a1 + a2 - v10;
}

void boost::container::vector<FileLocal::promise_io_t,boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,void>::priv_insert_forward_range_new_allocation<boost::container::dtl::insert_emplace_proxy<boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,FileLocal::promise_io_t*,FileLocal::promise_io_t>>( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = *a1;
  boost::container::uninitialized_move_and_insert_alloc<boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,FileLocal::promise_io_t*,FileLocal::promise_io_t*,boost::container::dtl::insert_emplace_proxy<boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,FileLocal::promise_io_t*,FileLocal::promise_io_t>>( (uint64_t)a1,  *a1,  a4,  *a1 + (a1[1] << 6),  a2,  a5,  a6);
  if (v10)
  {
    for (uint64_t i = a1[1]; i; v10 += 64LL)
    {
      uint64_t v12 = *(void *)(v10 + 56);
      if (v12) {
        *(void *)(v12 + 32) = 0LL;
      }
      --i;
      std::shared_ptr<char>::~shared_ptr[abi:ne180100](v10);
    }
  }

  uint64_t v13 = a1[1] + a5;
  *a1 = a2;
  a1[1] = v13;
  a1[2] = a3;
}

void sub_188153A60(_Unwind_Exception *exception_object)
{
  if (v1)
  {
  }

  _Unwind_Resume(exception_object);
}

__n128 boost::container::uninitialized_move_and_insert_alloc<boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,FileLocal::promise_io_t*,FileLocal::promise_io_t*,boost::container::dtl::insert_emplace_proxy<boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,FileLocal::promise_io_t*,FileLocal::promise_io_t>>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  while (a2 != a3)
  {
    *(_OWORD *)a5 = *(_OWORD *)a2;
    *(void *)a2 = 0LL;
    *(void *)(a2 + 8) = 0LL;
    __int128 v7 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a5 + 25) = *(_OWORD *)(a2 + 25);
    *(_OWORD *)(a5 + 16) = v7;
    int v8 = *(_DWORD *)(a2 + 48);
    *(void *)(a5 + 56) = *(void *)(a2 + 56);
    uint64_t v9 = a5 + 56;
    *(_DWORD *)(v9 - 8) = v8;
    *(void *)(a2 + 56) = 0LL;
    *(void *)(*(void *)v9 + 32LL) = v9;
    a5 = v9 + 8;
    a2 += 64LL;
  }

  *(_OWORD *)a5 = *(_OWORD *)a7;
  *(void *)a7 = 0LL;
  *(void *)(a7 + 8) = 0LL;
  __n128 result = *(__n128 *)(a7 + 16);
  *(_OWORD *)(a5 + 25) = *(_OWORD *)(a7 + 25);
  *(__n128 *)(a5 + 16) = result;
  *(void *)(a5 + 56) = *(void *)(a7 + 56);
  *(_DWORD *)(a5 + 48) = *(_DWORD *)(a7 + 48);
  *(void *)(a7 + 56) = 0LL;
  *(void *)(*(void *)(a5 + 56) + 32LL) = a5 + 56;
  if (a3 != a4)
  {
    uint64_t v11 = a5 + (a6 << 6);
    do
    {
      *(_OWORD *)uint64_t v11 = *(_OWORD *)a3;
      *(void *)a3 = 0LL;
      *(void *)(a3 + 8) = 0LL;
      __n128 result = *(__n128 *)(a3 + 16);
      *(_OWORD *)(v11 + 25) = *(_OWORD *)(a3 + 25);
      *(__n128 *)(v11 + 16) = result;
      int v12 = *(_DWORD *)(a3 + 48);
      *(void *)(v11 + 56) = *(void *)(a3 + 56);
      uint64_t v13 = v11 + 56;
      *(_DWORD *)(v13 - 8) = v12;
      *(void *)(a3 + 56) = 0LL;
      *(void *)(*(void *)v13 + 32LL) = v13;
      a3 += 64LL;
      uint64_t v11 = v13 + 8;
    }

    while (a3 != a4);
  }

  return result;
}

uint64_t di_log::logger_buf<di_log::log_printer<66ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EBD48;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_188153BCC(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<78ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EBF68;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_188153C48(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<95ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EC188;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_188153CC4(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<103ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EC3A8;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_188153D40(_Unwind_Exception *a1)
{
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<FileLocal::shared_state_t::init_unmap_zeros(void)::$_0 &&>>( uint64_t ***a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t v1 = **a1;
  uint64_t v2 = *v1;
  if ((fstatfs(*(_DWORD *)(*v1 + 8), &v20) & 0x80000000) == 0)
  {
    size_t f_bsize = v20.f_bsize;
    if (!*(_BYTE *)(v2 + 88)) {
      *(_BYTE *)(v2 + 88) = 1;
    }
    *(void *)(v2 + 72) = f_bsize;
    char v4 = valloc(f_bsize);
    if (!v4)
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      v15 = std::bad_alloc::bad_alloc(exception);
      __cxa_throw(v15, MEMORY[0x189614708], MEMORY[0x189614690]);
    }

    *(void *)&__int128 v21 = off_18A1EE628;
    v23 = &v21;
    v16 = v4;
    std::__function::__value_func<void ()(char *)>::__value_func[abi:ne180100]((uint64_t)&v17, (uint64_t)&v21);
    __int128 v5 = v23;
    if (v23 == &v21)
    {
      uint64_t v6 = 4LL;
      __int128 v5 = &v21;
    }

    else
    {
      if (!v23) {
        goto LABEL_14;
      }
      uint64_t v6 = 5LL;
    }

    (*(void (**)(void))(*(void *)v5 + 8 * v6))();
LABEL_14:
    std::expected<std::unique_ptr<char,std::function<void ()(char *)>>,std::error_code>::operator=[abi:ne180100]<std::unique_ptr<char,std::function<void ()(char *)>>>( v2 + 96,  (uint64_t *)&v16);
    std::unique_ptr<char,std::function<void ()(char *)>>::~unique_ptr[abi:ne180100]((uint64_t *)&v16);
    int64_t v13 = *(void *)(v2 + 72);
    if (v13 >= 1) {
      bzero(*(void **)(v2 + 96), v13);
    }
    return;
  }

  *(void *)&__int128 v21 = "FileLocal::shared_state_t::init_unmap_zeros()::(anonymous class)::operator()() const";
  *((void *)&v21 + 1) = 76LL;
  int v22 = 16;
  di_log::logger<di_log::log_printer<236ul>>::logger(&v16, &v21);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( &v18,  (uint64_t)"fstatfs failed with err code ",  29LL);
  __error();
  std::ostream::operator<<();
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<236ul>>::~logger_buf((uint64_t)&v16);
  MEMORY[0x1895BC2CC](&v19);
  int v7 = *__error();
  int v8 = std::generic_category();
  int v9 = *(unsigned __int8 *)(v2 + 88);
  *(_DWORD *)(v2 + 72) = v7;
  *(void *)(v2 + 80) = v8;
  if (v9) {
    *(_BYTE *)(v2 + 88) = 0;
  }
  int v10 = *__error();
  uint64_t v11 = std::generic_category();
  int v12 = v11;
  if (*(_BYTE *)(v2 + 136))
  {
    std::unique_ptr<char,std::function<void ()(char *)>>::~unique_ptr[abi:ne180100]((uint64_t *)(v2 + 96));
    *(_DWORD *)(v2 + 96) = v10;
    *(void *)(v2 + 104) = v12;
    *(_BYTE *)(v2 + 136) = 0;
  }

  else
  {
    *(_DWORD *)(v2 + 96) = v10;
    *(void *)(v2 + 104) = v11;
  }

void sub_188153F58(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void *di_log::logger<di_log::log_printer<236ul>>::logger(void *a1, __int128 *a2)
{
  uint64_t v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x189614770] + 16LL;
  di_log::logger_buf<di_log::log_printer<236ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = off_18A1EE410;
  a1[45] = &unk_18A1EE510;
  a1[46] = &unk_18A1EE538;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_18A1EE410;
  a1[45] = &unk_18A1EE498;
  a1[46] = &unk_18A1EE4C0;
  return a1;
}

void sub_188154024(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger<di_log::log_printer<236ul>>::~logger(uint64_t a1)
{
  return a1;
}

uint64_t std::expected<std::unique_ptr<char,std::function<void ()(char *)>>,std::error_code>::operator=[abi:ne180100]<std::unique_ptr<char,std::function<void ()(char *)>>>( uint64_t a1, uint64_t *a2)
{
  if (*(_BYTE *)(a1 + 40)) {
    std::unique_ptr<char,std::function<void ()(char *)>>::operator=[abi:ne180100]((uint64_t *)a1, a2);
  }
  else {
    std::expected<std::unique_ptr<char,std::function<void ()(char *)>>,std::error_code>::__reinit_expected[abi:ne180100]<std::in_place_t,std::unexpect_t,std::unique_ptr<char,std::function<void ()(char *)>>,std::error_code,std::unique_ptr<char,std::function<void ()(char *)>>>( a1,  a1,  a2);
  }
  return a1;
}

uint64_t di_log::logger_buf<di_log::log_printer<236ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EE5A8;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_188154138(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<236ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1EE5A8;
  di_log::logger_buf<di_log::log_printer<236ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

void di_log::logger<di_log::log_printer<236ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<236ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<236ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<236ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<236ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<236ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<236ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<236ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<236ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger_buf<di_log::log_printer<236ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<236ul>>::~logger_buf(a1);
  operator delete(v1);
}

uint64_t di_log::logger_buf<di_log::log_printer<236ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    unsigned __int8 v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<236ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_1881544EC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

int *di_log::log_printer<236ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 236LL;
    __int16 v22 = 2082;
    v23 = v8;
    int v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      int v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    uint64_t v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 236LL;
      __int16 v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  __n128 result = __error();
  int *result = v5;
  return result;
}

uint64_t std::expected<std::unique_ptr<char,std::function<void ()(char *)>>,std::error_code>::__reinit_expected[abi:ne180100]<std::in_place_t,std::unexpect_t,std::unique_ptr<char,std::function<void ()(char *)>>,std::error_code,std::unique_ptr<char,std::function<void ()(char *)>>>( uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if (*(_BYTE *)(a1 + 40)) {
    std::unique_ptr<char,std::function<void ()(char *)>>::~unique_ptr[abi:ne180100]((uint64_t *)a1);
  }
  uint64_t v5 = *a3;
  *a3 = 0LL;
  *(void *)a1 = v5;
  uint64_t result = std::__function::__value_func<void ()(char *)>::__value_func[abi:ne180100](a1 + 8, (uint64_t)(a3 + 1));
  *(_BYTE *)(a1 + 40) = 1;
  return result;
}

uint64_t di_log::logger_buf<di_log::log_printer<298ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EC5C8;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_188154844(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<313ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EC7E8;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_1881548C0(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<336ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1ECA08;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_18815493C(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<370ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1ECC28;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_1881549B8(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<381ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1ECE48;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_188154A34(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<388ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1ED068;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_188154AB0(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<398ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1ED288;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_188154B2C(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<411ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1ED4A8;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_188154BA8(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<424ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1ED6C8;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_188154C24(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<432ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1ED8E8;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_188154CA0(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<441ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EDB08;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_188154D1C(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<449ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EDD28;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_188154D98(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<489ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EDF48;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_188154E14(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<502ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EE168;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_188154E90(_Unwind_Exception *a1)
{
}

uint64_t *std::back_insert_iterator<boost::container::small_vector<iovec,16ul,void,void>>::operator=[abi:ne180100]( uint64_t *a1, _OWORD *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)(v4 + 8);
  char v6 = (char *)(*(void *)v4 + 16 * v5);
  if (v5 == *(void *)(v4 + 16))
  {
    boost::container::vector<std::pair<std::chrono::time_point<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>,unsigned long>,boost::container::small_vector_allocator<std::pair<std::chrono::time_point<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>,unsigned long>,boost::container::new_allocator<void>,void>,void>::priv_insert_forward_range_no_capacity<boost::container::dtl::insert_emplace_proxy<boost::container::small_vector_allocator<std::pair<std::chrono::time_point<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>,unsigned long>,boost::container::new_allocator<void>,void>,std::pair<std::chrono::time_point<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>,unsigned long>*,std::pair<std::chrono::time_point<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>,unsigned long>>>( (void **)v4,  v6,  (const char *)1,  a2,  &v8);
  }

  else
  {
    *(_OWORD *)char v6 = *a2;
    ++*(void *)(v4 + 8);
  }

  return a1;
}

void *boost::container::vector<FileLocal::promise_io_t,boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,void>::priv_destroy_all( void *result)
{
  uint64_t v1 = result;
  uint64_t v2 = result[1];
  if (v2)
  {
    uint64_t result = (void *)*result;
    do
    {
      uint64_t v3 = result[7];
      if (v3) {
        *(void *)(v3 + 32) = 0LL;
      }
      --v2;
      uint64_t result = (void *)(std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)result) + 64);
    }

    while (v2);
  }

  v1[1] = 0LL;
  return result;
}

uint64_t di_log::logger_buf<di_log::log_printer<643ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EE388;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_188154FBC(_Unwind_Exception *a1)
{
}

uint64_t Ram::write(uint64_t a1, uint64_t a2)
{
  size_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v3 + v4 <= *(void *)(a1 + 72))
  {
    memcpy((void *)(*(void *)(a1 + 64) + v4), *(const void **)a2, v3);
    return *(unsigned int *)(a2 + 16);
  }

  else
  {
    *(void *)&__int128 v6 = "int Ram::write(const sg_entry &)";
    *((void *)&v6 + 1) = 14LL;
    int v7 = 16;
    di_log::logger<di_log::log_printer<30ul>>::logger(v8, &v6);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)"Trying to write @ ", 18LL);
    std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)" ", 1LL);
    std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( &v9,  (uint64_t)"bytes, which is after end of ramdisk",  36LL);
    std::ostream::~ostream();
    di_log::logger_buf<di_log::log_printer<30ul>>::~logger_buf((uint64_t)v8);
    MEMORY[0x1895BC2CC](&v10);
    return 4294967274LL;
  }

void sub_1881550D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void *di_log::logger<di_log::log_printer<30ul>>::logger(void *a1, __int128 *a2)
{
  size_t v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x189614770] + 16LL;
  di_log::logger_buf<di_log::log_printer<30ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = off_18A1EE788;
  a1[45] = &unk_18A1EE888;
  a1[46] = &unk_18A1EE8B0;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_18A1EE788;
  a1[45] = &unk_18A1EE810;
  a1[46] = &unk_18A1EE838;
  return a1;
}

void sub_188155170(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger<di_log::log_printer<30ul>>::~logger(uint64_t a1)
{
  return a1;
}

uint64_t Ram::read(uint64_t a1, uint64_t a2)
{
  size_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v3 + v4 <= *(void *)(a1 + 72))
  {
    memcpy(*(void **)a2, (const void *)(*(void *)(a1 + 64) + v4), v3);
    return *(unsigned int *)(a2 + 16);
  }

  else
  {
    *(void *)&__int128 v6 = "int Ram::read(const sg_entry &)";
    *((void *)&v6 + 1) = 13LL;
    int v7 = 16;
    di_log::logger<di_log::log_printer<42ul>>::logger(v8, &v6);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)"Trying to read @ ", 17LL);
    std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)" ", 1LL);
    std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( &v9,  (uint64_t)"bytes, which is after end of ramdisk",  36LL);
    std::ostream::~ostream();
    di_log::logger_buf<di_log::log_printer<42ul>>::~logger_buf((uint64_t)v8);
    MEMORY[0x1895BC2CC](&v10);
    return 4294967274LL;
  }

void sub_1881552D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void *di_log::logger<di_log::log_printer<42ul>>::logger(void *a1, __int128 *a2)
{
  size_t v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x189614770] + 16LL;
  di_log::logger_buf<di_log::log_printer<42ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = off_18A1EE9A8;
  a1[45] = &unk_18A1EEAA8;
  a1[46] = &unk_18A1EEAD0;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_18A1EE9A8;
  a1[45] = &unk_18A1EEA30;
  a1[46] = &unk_18A1EEA58;
  return a1;
}

void sub_188155378(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger<di_log::log_printer<42ul>>::~logger(uint64_t a1)
{
  return a1;
}

void Ram::~Ram(Ram *this)
{
}

{
  std::__shared_weak_count *v2;
  *(void *)this = off_18A1EE6A8;
  std::unique_ptr<char,std::function<void ()(char *)>>::~unique_ptr[abi:ne180100]((uint64_t *)this + 3);
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
}

uint64_t Ram::flush()
{
  return 0LL;
}

uint64_t Ram::unmap_range(Ram *this, unint64_t a2, uint64_t a3)
{
  if (a3 == -1) {
    return 0LL;
  }
  unint64_t v3 = *((void *)this + 12);
  unint64_t v4 = (a2 + v3 - 1) / v3 * v3;
  if (a2 > v4 || v4 >= a3 + a2) {
    return 0LL;
  }
  unint64_t v6 = a2 - v4 + a3;
  size_t v7 = v6 / v3 * v3;
  if (v6 == v6 % v3) {
    return 0LL;
  }
  uint64_t v8 = 4294967262LL;
  if (__CFADD__(v4, v7)) {
    return v8;
  }
  unint64_t v10 = *((void *)this + 9);
  if (v4 > v10 || v7 + v4 > v10) {
    return v8;
  }
  return madvise((void *)(*((void *)this + 8) + v4), v7, 5);
}

uint64_t Ram::supports_unmap(Ram *this)
{
  return 1LL;
}

uint64_t Ram::get_size(Ram *this)
{
  return *((void *)this + 9);
}

uint64_t Ram::is_writable(Ram *this)
{
  return 1LL;
}

uint64_t Ram::truncate(Ram *this, unint64_t a2)
{
  if (*((void *)this + 9) < a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0LL;
  *((void *)this + 9) = a2;
  return result;
}

void *Ram::name(uint64_t a1, void *a2)
{
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"ram", 3LL);
}

uint64_t Ram::get_identifier(Ram *this)
{
  return *((void *)this + 10);
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<30ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<30ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<30ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<30ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<30ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<30ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger<di_log::log_printer<30ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<30ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<30ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<30ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1EE920;
  di_log::logger_buf<di_log::log_printer<30ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<30ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<30ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_188155864( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<30ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<30ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<30ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 30LL;
    __int16 v22 = 2082;
    v23 = v8;
    uint64_t v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      unint64_t v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    uint64_t v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 30LL;
      __int16 v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<42ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<42ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<42ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<42ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<42ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<42ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger<di_log::log_printer<42ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<42ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<42ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<42ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1EEB40;
  di_log::logger_buf<di_log::log_printer<42ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<42ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<42ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_188155E10( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<42ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<42ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<42ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 42LL;
    __int16 v22 = 2082;
    v23 = v8;
    uint64_t v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      unint64_t v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    uint64_t v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 42LL;
      __int16 v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

uint64_t di_log::logger_buf<di_log::log_printer<30ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EE920;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_1881560D8(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<42ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EEB40;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_188156154(_Unwind_Exception *a1)
{
}

uint64_t SparseBundleBackend::SparseBundleBackend( uint64_t a1, uint64_t a2, __int16 a3, unint64_t a4, _OWORD *a5)
{
  int v9 = SparseBundleBackend::open_bundle(a2, a3);
  FileDescriptorBackend::FileDescriptorBackend((FileDescriptorBackend *)a1, v9, (a3 & 3) != 0);
  *(void *)a1 = off_18A1EEBC0;
  *(void *)(a1 + 24) = &unk_18A1EEC98;
  *(void *)(a1 + 72) = &unk_18A1EECC0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 136) = *a5;
  if ((a3 & 0x200) != 0)
  {
    SparseBundleBackend::set_bytes_per_band(a1, a4);
    SparseBundleBackend::prepare_new_bundle((SparseBundleBackend *)a1);
    BOOL v10 = 1;
  }

  else if (*(_BYTE *)(a1 + 36))
  {
    BOOL v10 = faccessat(*(_DWORD *)(a1 + 32), "mapped", 0, 0) != 0;
  }

  else
  {
    BOOL v10 = 0;
  }

  if (!*(void *)(a1 + 112)) {
    SparseBundleBackend::read_info((SparseBundleBackend *)a1);
  }
  if (v10) {
    SparseBundleBackend::create_mapped_folder((SparseBundleBackend *)a1, (a3 & 0x200) != 0);
  }
  return a1;
}

void sub_188156268(_Unwind_Exception *a1)
{
  uint64_t v4 = *((void *)v1 + 14);
  *((void *)v1 + 14) = 0LL;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8LL))(v4);
  }
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)v1 + 96);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v2);
  FileDescriptorBackend::~FileDescriptorBackend(v1);
  _Unwind_Resume(a1);
}

uint64_t SparseBundleBackend::open_bundle(uint64_t a1, __int16 a2)
{
  uint64_t v2 = a1;
  if ((a2 & 0x200) != 0)
  {
    exception = (DiskImagesRuntimeException *)__cxa_allocate_exception(0x40uLL);
    unsigned int v7 = *__error();
    uint64_t v8 = "Failed creating sparsebundle folder";
LABEL_16:
    DiskImagesRuntimeException::DiskImagesRuntimeException(exception, v8, v7);
  }

  if ((a2 & 3) == 0 || geteuid()) {
    return FileDescriptorWrapper::open_file(v2, 0);
  }
  else {
    uint64_t v3 = *(const char **)v2;
  }
  if (stat(v3, &v11))
  {
    exception = (DiskImagesRuntimeException *)__cxa_allocate_exception(0x40uLL);
    unsigned int v7 = *__error();
    uint64_t v8 = "stat failed";
    goto LABEL_16;
  }

  if (!v11.st_uid) {
    return FileDescriptorWrapper::open_file(v2, 0);
  }
  set_euid_wrapper::set_euid_wrapper((set_euid_wrapper *)v10, v11.st_uid);
  uint64_t v4 = FileDescriptorWrapper::open_file(v2, 0);
  set_euid_wrapper::~set_euid_wrapper((set_euid_wrapper *)v10);
  return v4;
}

void sub_1881563B8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, int a12, char a13)
{
}

void FileDescriptorBackend::FileDescriptorBackend(FileDescriptorBackend *this, int a2, char a3)
{
  *(void *)this = off_18A1EED68;
  *((void *)this + 3) = &unk_18A1EEE28;
}

void sub_188156504(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 16);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SparseBundleBackend::set_bytes_per_band(uint64_t this, unint64_t a2)
{
  if (a2 < 0x100000 || a2 > 0x200000000LL || (a2 & 0xFFF) != 0)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v3);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)"Invalid band size (", 19LL);
    std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)" bytes)", 7LL);
    DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)exception, (uint64_t)v3, 0x16u);
  }

  *(void *)(this + 128) = a2;
  return this;
}

void sub_1881565DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void SparseBundleBackend::prepare_new_bundle(SparseBundleBackend *this)
{
  v28[131] = *MEMORY[0x1895F89C0];
  if (mkdirat(*((_DWORD *)this + 8), "bands", 0x1FFu) == -1)
  {
    exception = (DiskImagesRuntimeException *)__cxa_allocate_exception(0x40uLL);
    uint64_t v13 = __error();
    DiskImagesRuntimeException::DiskImagesRuntimeException(exception, "Failed creating bands folder", *v13);
  }

  SparseBundleBackend::write_info_plists(this);
  int v2 = *((_DWORD *)this + 8);
  std::string::basic_string[abi:ne180100]<0>(__p, "token");
  int v3 = FileDescriptorWrapper::open_from(v2, (uint64_t)__p, 1538);
  FileLocal::FileLocal((FileLocal *)&v23, v3, 1, 0);
  if (SHIBYTE(v18) < 0) {
    operator delete(__p[0]);
  }
  int v4 = *((_DWORD *)this + 8);
  std::string::basic_string[abi:ne180100]<0>(v15, "lock");
  int v5 = FileDescriptorWrapper::open_from(v4, (uint64_t)v15, 1538);
  FileLocal::FileLocal((FileLocal *)__p, v5, 1, 0);
  if (v16 < 0) {
    operator delete(v15[0]);
  }
  __p[0] = off_18A1EBA08;
  uint64_t v19 = &unk_18A1EBAE8;
  __int16 v20 = &unk_18A1EBB20;
  boost::container::vector<FileLocal::promise_io_t,boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,void>::~vector((uint64_t)&v22);
  uint64_t v6 = v21;
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      unint64_t v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }

  if (v18) {
    std::__shared_weak_count::__release_weak(v18);
  }
  v23 = off_18A1EBA08;
  v25 = &unk_18A1EBAE8;
  v26 = &unk_18A1EBB20;
  boost::container::vector<FileLocal::promise_io_t,boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,void>::~vector((uint64_t)v28);
  int v9 = v27;
  if (v27)
  {
    BOOL v10 = (unint64_t *)&v27->__shared_owners_;
    do
      unint64_t v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  if (v24) {
    std::__shared_weak_count::__release_weak(v24);
  }
}

void sub_188156828(_Unwind_Exception *a1)
{
}

void SparseBundleBackend::read_info(SparseBundleBackend *this)
{
  uint64_t v2 = *((void *)this + 14);
  *((void *)this + 14) = v3;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  if (v5 < 0) {
    operator delete(__p[0]);
  }
}

void sub_188156904( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, __int128 a11, int a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  if (a2 == 1)
  {
    v64 = __cxa_begin_catch(exception_object);
    *(void *)&a11 = "SparseBundleBackend::read_info()";
    *((void *)&a11 + 1) = 30LL;
    a12 = 16;
    di_log::logger<di_log::log_printer<263ul>>::logger(&__p, &a11);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&a61, (uint64_t)"Failed to read ", 15LL);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&a61, (uint64_t)"Info.plist", 10LL);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&a61, (uint64_t)", ", 2LL);
    v65 = (const char *)(*(uint64_t (**)(void *))(*(void *)v64 + 16LL))(v64);
    size_t v66 = strlen(v65);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&a61, (uint64_t)v65, v66);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( &a61,  (uint64_t)", reading from backup",  21LL);
    di_log::logger<di_log::log_printer<263ul>>::~logger((uint64_t)&__p);
    __cxa_end_catch();
    std::string::basic_string[abi:ne180100]<0>(&__p, "Info.bckup");
    SparseBundleBackend::read_info((uint64_t)v61, (uint64_t)&__p, (FileLocal **)&a10);
    uint64_t v67 = a10;
    a10 = 0LL;
    if (v67) {
      (*(void (**)(uint64_t))(*(void *)v67 + 8LL))(v67);
    }
    if (a18 < 0) {
      operator delete(__p);
    }
    JUMPOUT(0x1881568ECLL);
  }

  _Unwind_Resume(exception_object);
}

uint64_t SparseBundleBackend::create_mapped_folder(SparseBundleBackend *this, char a2)
{
  uint64_t result = mkdirat(*((_DWORD *)this + 8), "mapped", 0x1FFu);
  if ((_DWORD)result == -1)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"Failed creating ", 16LL);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"mapped", 6LL);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" folder", 7LL);
    uint64_t v6 = __error();
    DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)exception, (uint64_t)v12, *v6);
  }

  if ((a2 & 1) == 0)
  {
    FileDescriptor::get_stat((SparseBundleBackend *)((char *)this + 24), &v11);
    if (fchmodat(*((_DWORD *)this + 8), "mapped", v11.st_mode & 0x1FF, 0) == -1)
    {
      unsigned int v7 = __cxa_allocate_exception(0x40uLL);
      std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( v12,  (uint64_t)"fchmodat failed for ",  20LL);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"mapped", 6LL);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" folder", 7LL);
      unint64_t v8 = __error();
      DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)v7, (uint64_t)v12, *v8);
    }

    uint64_t result = geteuid();
    if (!(_DWORD)result && v11.st_uid)
    {
      uint64_t result = fchownat(*((_DWORD *)this + 8), "mapped", v11.st_uid, 0xFFFFFFFF, 0);
      if ((_DWORD)result == -1)
      {
        int v9 = __cxa_allocate_exception(0x40uLL);
        std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( v12,  (uint64_t)"fchownat failed for ",  20LL);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"mapped", 6LL);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" folder", 7LL);
        BOOL v10 = __error();
        DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)v9, (uint64_t)v12, *v10);
      }
    }
  }

  return result;
}

void sub_188156D94( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28)
{
}

void FileDescriptorBackend::~FileDescriptorBackend(FileDescriptorBackend *this)
{
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
}

FileDescriptorBackend *SparseBundleBackend::SparseBundleBackend( FileDescriptorBackend *a1, int a2, char a3, void *a4, uint64_t *a5)
{
  *unint64_t v8 = off_18A1EEBC0;
  v8[3] = &unk_18A1EEC98;
  int v9 = (FileDescriptor *)(v8 + 3);
  v8[9] = &unk_18A1EECC0;
  v8[10] = *a4;
  uint64_t v10 = a4[1];
  v8[11] = v10;
  if (v10)
  {
    stat v11 = (unint64_t *)(v10 + 8);
    do
      unint64_t v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }

  *((void *)a1 + 12) = 0LL;
  *((void *)a1 + 13) = 0LL;
  *((void *)a1 + 14) = 0LL;
  SparseBundleBackend::read_info(a1);
  std::shared_ptr<DiskImage>::operator=[abi:ne180100]((void *)a1 + 12, a5);
  if ((*(unsigned int (**)(FileDescriptorBackend *))(*(void *)a1 + 48LL))(a1))
  {
    FileDescriptor::get_stat(v9, v16);
    umask(v16[0].st_mode & 0x1B6 ^ 0x1B6);
    *(void *)&__int128 v14 = "SparseBundleBackend::SparseBundleBackend(int, BOOL, const shared_ptr<FileLocal> &, const shared_pt"
                      "r<crypto::format> &)";
    *((void *)&v14 + 1) = 40LL;
    int v15 = 0;
    di_log::logger<di_log::log_printer<93ul>>::logger(v16, &v14);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( &v17,  (uint64_t)"Mode for new files in bundle: ",  30LL);
    *(_DWORD *)((char *)&v17 + *(void *)(v17 - 24) + 8) = *(_DWORD *)((_BYTE *)&v17 + *(void *)(v17 - 24) + 8) & 0xFFFFFFB5 | 0x40;
    std::ostream::operator<<();
    *(_DWORD *)((char *)&v17 + *(void *)(v17 - 24) + 8) = *(_DWORD *)((_BYTE *)&v17 + *(void *)(v17 - 24) + 8) & 0xFFFFFFB5 | 2;
    std::ostream::~ostream();
    di_log::logger_buf<di_log::log_printer<93ul>>::~logger_buf((uint64_t)v16);
    MEMORY[0x1895BC2CC](&v18);
  }

  return a1;
}

void sub_188156FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v8 = *((void *)v4 + 14);
  *((void *)v4 + 14) = 0LL;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8LL))(v8);
  }
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v6);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v5);
  FileDescriptorBackend::~FileDescriptorBackend(v4);
  _Unwind_Resume(a1);
}

void *di_log::logger<di_log::log_printer<161ul>>::logger(void *a1, __int128 *a2)
{
  int v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x189614770] + 16LL;
  di_log::logger_buf<di_log::log_printer<161ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = off_18A1EF298;
  a1[45] = &unk_18A1EF398;
  a1[46] = &unk_18A1EF3C0;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_18A1EF298;
  a1[45] = &unk_18A1EF320;
  a1[46] = &unk_18A1EF348;
  return a1;
}

void sub_188157090(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger<di_log::log_printer<161ul>>::~logger(uint64_t a1)
{
  return a1;
}

void SparseBundleBackend::write_info_plists(SparseBundleBackend *this)
{
  v17[93] = *MEMORY[0x1895F89C0];
  *(void *)&__int128 __p = "SparseBundleBackend::write_info_plists()";
  *((void *)&__p + 1) = 38LL;
  int v8 = 0;
  di_log::logger<di_log::log_printer<322ul>>::logger(v10, &__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v16, (uint64_t)"Updating ", 9LL);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v16, (uint64_t)"Info.bckup", 10LL);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v16, (uint64_t)", disk size: ", 13LL);
  std::ostream::operator<<();
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<322ul>>::~logger_buf((uint64_t)v10);
  MEMORY[0x1895BC2CC](v17);
  int v2 = *((_DWORD *)this + 8);
  std::string::basic_string[abi:ne180100]<0>(&__p, "Info.bckup");
  int v3 = FileDescriptorWrapper::open_from(v2, (uint64_t)&__p, 1538);
  FileLocal::FileLocal((FileLocal *)v10, v3, 1, 0);
  if (v9 < 0) {
    operator delete((void *)__p);
  }
  SparseBundleBackend::write_info_to_file(this, (Backend *)v10);
  SparseBundleBackend::write_primary_info_plist(this);
  v10[0] = off_18A1EBA08;
  unint64_t v12 = &unk_18A1EBAE8;
  uint64_t v13 = &unk_18A1EBB20;
  boost::container::vector<FileLocal::promise_io_t,boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,void>::~vector((uint64_t)&v15);
  int v4 = v14;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      unint64_t v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }

  if (v11) {
    std::__shared_weak_count::__release_weak(v11);
  }
}

void sub_1881572A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
}

void SparseBundleBackend::read_info(uint64_t a1@<X0>, uint64_t a2@<X1>, FileLocal **a3@<X8>)
{
  int v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 48LL))(a1);
  BOOL v7 = v6;
  if (v6) {
    int v8 = 2;
  }
  else {
    int v8 = 0;
  }
  char v9 = (FileLocal *)operator new(0x458uLL);
  int v10 = FileDescriptorWrapper::open_from(*(_DWORD *)(a1 + 32), a2, v8);
  FileLocal::FileLocal(v9, v10, v7, 0);
  *a3 = v9;
  unint64_t v11 = (*(uint64_t (**)(FileLocal *))(*(void *)v9 + 40LL))(v9);
  if (v11 >= 0x401)
  {
    *(void *)&__int128 bytes = "SparseBundleBackend::read_info(const std::string &)";
    *((void *)&bytes + 1) = 30LL;
    int v55 = 16;
    di_log::logger<di_log::log_printer<207ul>>::logger(&valuePtr, &bytes);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v62, (uint64_t)"Info.plist", 10LL);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v62, (uint64_t)" is ", 4LL);
    std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( &v62,  (uint64_t)" bytes, reading only ",  21LL);
    std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v62, (uint64_t)" bytes", 6LL);
    std::ostream::~ostream();
    di_log::logger_buf<di_log::log_printer<207ul>>::~logger_buf((uint64_t)&valuePtr);
    MEMORY[0x1895BC2CC](&v63);
    unint64_t v11 = 1024LL;
  }

  std::vector<unsigned char>::vector(&bytes, v11);
  unint64_t v12 = (unsigned __int8 *)bytes;
  uint64_t v13 = (std::__shared_weak_count *)*((void *)details::get_dummy_shared_ptr() + 1);
  valuePtr = v12;
  v57 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      unint64_t v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
  }

  int64_t v58 = v11;
  uint64_t v59 = 0LL;
  unint64_t v60 = v11;
  char v61 = 0;
  int v16 = (*(uint64_t (**)(FileLocal *, unsigned __int8 **))(*(void *)v9 + 88LL))(v9, &valuePtr);
  uint64_t v17 = v57;
  if (v57)
  {
    uint64_t v18 = (unint64_t *)&v57->__shared_owners_;
    do
      unint64_t v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

  if (v11 != v16)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&valuePtr);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( &valuePtr,  (uint64_t)"Failed reading ",  15LL);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&valuePtr, (uint64_t)"Info.plist", 10LL);
    v37 = __error();
    DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)exception, (uint64_t)&valuePtr, *v37);
  }

  __int16 v20 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFDataRef v21 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const UInt8 *)bytes, v11);
  CFDataRef v53 = v21;
  if (!v21)
  {
    v38 = __cxa_allocate_exception(0x40uLL);
    void *v38 = off_18A1E43B0;
    v39 = std::generic_category();
    v38[1] = 12LL;
    v38[2] = v39;
    *((_BYTE *)v38 + 24) = 0;
    *((_BYTE *)v38 + 48) = 0;
    v38[7] = "Failed creating CFData";
  }

  CFErrorRef error = 0LL;
  CFPropertyListRef v22 = CFPropertyListCreateWithData(v20, v21, 0LL, 0LL, &error);
  v51 = v22;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (!v22)
  {
    v40 = __cxa_allocate_exception(0x40uLL);
    void *v40 = off_18A1E43B0;
    v41 = std::generic_category();
    v40[1] = 22LL;
    v40[2] = v41;
    *((_BYTE *)v40 + 24) = 0;
    *((_BYTE *)v40 + 48) = 0;
    v40[7] = "Corrupted plist";
  }

  if (CFGetTypeID(v22) != TypeID)
  {
    v42 = (cf::CFUtilException *)__cxa_allocate_exception(0x40uLL);
    CFGetTypeID(v22);
    v43 = cf::CFUtilException::CFUtilException(v42);
  }

  Value = CFDictionaryGetValue((CFDictionaryRef)v22, @"size");
  CFTypeID v25 = CFNumberGetTypeID();
  if (Value && CFGetTypeID(Value) != v25)
  {
    v44 = (cf::CFUtilException *)__cxa_allocate_exception(0x40uLL);
    CFGetTypeID(Value);
    v45 = cf::CFUtilException::CFUtilException(v44);
  }

  v26 = CFDictionaryGetValue((CFDictionaryRef)v22, @"band-size");
  CFTypeID v27 = CFNumberGetTypeID();
  if (v26 && CFGetTypeID(v26) != v27)
  {
    v46 = (cf::CFUtilException *)__cxa_allocate_exception(0x40uLL);
    CFGetTypeID(v26);
    v47 = cf::CFUtilException::CFUtilException(v46);
  }

  v28 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v22, @"uuid");
  CFTypeID v29 = CFStringGetTypeID();
  if (v28 && CFGetTypeID(v28) != v29)
  {
    v48 = (cf::CFUtilException *)__cxa_allocate_exception(0x40uLL);
    CFGetTypeID(v28);
    v49 = cf::CFUtilException::CFUtilException(v48);
  }

  v30 = "Corrupted plist dictionary";
  if (!Value || !v26)
  {
LABEL_41:
    v34 = __cxa_allocate_exception(0x40uLL);
    void *v34 = off_18A1E43B0;
    v35 = std::generic_category();
    v34[1] = 22LL;
    v34[2] = v35;
    *((_BYTE *)v34 + 24) = 0;
    *((_BYTE *)v34 + 48) = 0;
    v34[7] = v30;
  }

  if (!CFNumberGetValue((CFNumberRef)Value, kCFNumberLongLongType, &valuePtr)
    || (*(void *)(a1 + 120) = valuePtr, !CFNumberGetValue((CFNumberRef)v26, kCFNumberLongLongType, &valuePtr)))
  {
    v30 = "Failed converting CFNumber to longlong";
    goto LABEL_41;
  }

  SparseBundleBackend::set_bytes_per_band(a1, (unint64_t)valuePtr);
  if (v28)
  {
    toNativeType(v28, &valuePtr);
    v31 = (std::__shared_weak_count *)HIBYTE(v58);
    if (v58 >= 0) {
      p_valuePtr = (unsigned __int8 *)&valuePtr;
    }
    else {
      p_valuePtr = valuePtr;
    }
    if (v58 < 0) {
      v31 = v57;
    }
    *(void *)(a1 + 136) = boost::uuids::string_generator::operator()<std::__wrap_iter<char const*>>( (boost::uuids::string_generator *)&v50,  p_valuePtr,  (unsigned __int8 *)v31 + (void)p_valuePtr);
    *(void *)(a1 + 144) = v33;
    if (SHIBYTE(v58) < 0) {
      operator delete(valuePtr);
    }
  }

  else
  {
    *(void *)(a1 + 136) = 0LL;
    *(void *)(a1 + 144) = 0LL;
  }

  CFAutoRelease<void const*>::~CFAutoRelease(&v51);
  CFAutoRelease<__CFData const*>::~CFAutoRelease((const void **)&v53);
  if ((void)bytes)
  {
    *((void *)&bytes + 1) = bytes;
    operator delete((void *)bytes);
  }

void sub_1881578FC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (__p) {
    operator delete(__p);
  }
  uint64_t v23 = *v21;
  *CFDataRef v21 = 0LL;
  if (v23) {
    (*(void (**)(uint64_t))(*(void *)v23 + 8LL))(v23);
  }
  _Unwind_Resume(a1);
}

void *di_log::logger<di_log::log_printer<207ul>>::logger(void *a1, __int128 *a2)
{
  int v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x189614770] + 16LL;
  di_log::logger_buf<di_log::log_printer<207ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = off_18A1EF4B8;
  a1[45] = &unk_18A1EF5B8;
  a1[46] = &unk_18A1EF5E0;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_18A1EF4B8;
  a1[45] = &unk_18A1EF540;
  a1[46] = &unk_18A1EF568;
  return a1;
}

void sub_188157AE8(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger<di_log::log_printer<207ul>>::~logger(uint64_t a1)
{
  return a1;
}

void *di_log::logger<di_log::log_printer<263ul>>::logger(void *a1, __int128 *a2)
{
  int v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x189614770] + 16LL;
  di_log::logger_buf<di_log::log_printer<263ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = off_18A1EF6D8;
  a1[45] = &unk_18A1EF7D8;
  a1[46] = &unk_18A1EF800;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_18A1EF6D8;
  a1[45] = &unk_18A1EF760;
  a1[46] = &unk_18A1EF788;
  return a1;
}

void sub_188157BD0(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger<di_log::log_printer<263ul>>::~logger(uint64_t a1)
{
  return a1;
}

const void **SparseBundleBackend::write_primary_info_plist(SparseBundleBackend *this)
{
  *(void *)&__int128 v11 = "SparseBundleBackend::write_primary_info_plist()";
  *((void *)&v11 + 1) = 45LL;
  int v12 = 0;
  di_log::logger<di_log::log_printer<304ul>>::logger(__p, &v11);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v15, (uint64_t)"Updating ", 9LL);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v15, (uint64_t)"Info.plist", 10LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<304ul>>::~logger_buf((uint64_t)__p);
  MEMORY[0x1895BC2CC](&v16);
  uint64_t v2 = *((void *)this + 14);
  if (v2)
  {
    unsigned int v3 = (*(uint64_t (**)(uint64_t, void))(*(void *)v2 + 56LL))(v2, 0LL);
    if (v3)
    {
      unsigned int v4 = v3;
      exception = (DiskImagesRuntimeException *)__cxa_allocate_exception(0x40uLL);
      DiskImagesRuntimeException::DiskImagesRuntimeException(exception, "Failed truncating plist", v4);
    }
  }

  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "Info.plist");
    BOOL v7 = (FileLocal *)operator new(0x458uLL);
    int v8 = FileDescriptorWrapper::open_from(*((_DWORD *)this + 8), (uint64_t)__p, 514);
    FileLocal::FileLocal(v7, v8, 1, 0);
    uint64_t v9 = *((void *)this + 14);
    *((void *)this + 14) = v7;
    if (v9) {
      (*(void (**)(uint64_t))(*(void *)v9 + 8LL))(v9);
    }
    if (v14 < 0) {
      operator delete(__p[0]);
    }
  }

  return SparseBundleBackend::write_info_to_file(this, *((Backend **)this + 14));
}

void sub_188157D94( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *di_log::logger<di_log::log_printer<270ul>>::logger(void *a1, __int128 *a2)
{
  unsigned int v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x189614770] + 16LL;
  di_log::logger_buf<di_log::log_printer<270ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = off_18A1EF8F8;
  a1[45] = &unk_18A1EF9F8;
  a1[46] = &unk_18A1EFA20;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_18A1EF8F8;
  a1[45] = &unk_18A1EF980;
  a1[46] = &unk_18A1EF9A8;
  return a1;
}

void sub_188157E54(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger<di_log::log_printer<270ul>>::~logger(uint64_t a1)
{
  return a1;
}

const void **SparseBundleBackend::write_info_to_file(SparseBundleBackend *this, Backend *a2)
{
  unsigned int v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  CFDictionarySetValue(Mutable, @"diskimage-bundle-type", @"com.apple.diskimage.sparsebundle");
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x189604E08], @"6.0");
  addCFNumber64ToDict(Mutable, @"bundle-backingstore-version", 2LL);
  addCFNumber64ToDict(Mutable, @"size", *((void *)this + 15));
  addCFNumber64ToDict(Mutable, @"band-size", *((void *)this + 16));
  uint64_t v5 = Mutable;
  int v6 = operator new(0x28uLL);
  __int128 __p = v6;
  __int128 v23 = xmmword_18817DE60;
  *int v6 = 0u;
  v6[1] = 0u;
  *(void *)((char *)v6 + 29) = 0LL;
  boost::uuids::to_chars<char *>((uint64_t)this + 136, v6);
  addCFStringToDict(v5, @"uuid", (uint64_t)&__p);
  if (SHIBYTE(v23) < 0) {
    operator delete(__p);
  }
  CFErrorRef error = 0LL;
  CFDataRef v7 = CFPropertyListCreateData(v4, Mutable, kCFPropertyListXMLFormat_v1_0, 0LL, &error);
  CFTypeID v27 = v7;
  if (!v7)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&__p);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( &__p,  (uint64_t)"Failed creating property list",  29LL);
    unsigned int Code = CFErrorGetCode(error);
    DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)exception, (uint64_t)&__p, Code);
  }

  CFIndex Length = CFDataGetLength(v7);
  BytePtr = (UInt8 *)CFDataGetBytePtr(v27);
  uint64_t v10 = *((void *)details::get_dummy_shared_ptr() + 1);
  __int128 __p = BytePtr;
  *(void *)&__int128 v23 = v10;
  if (v10)
  {
    __int128 v11 = (unint64_t *)(v10 + 8);
    do
      unint64_t v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }

  *((void *)&v23 + 1) = Length;
  uint64_t v24 = 0LL;
  CFIndex v25 = Length;
  char v26 = 0;
  unsigned int v13 = (*(uint64_t (**)(Backend *, void **))(*(void *)a2 + 96LL))(a2, &__p);
  char v14 = (std::__shared_weak_count *)v23;
  if ((void)v23)
  {
    uint64_t v15 = (unint64_t *)(v23 + 8);
    do
      unint64_t v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

  if ((v13 & 0x80000000) != 0
    || (unsigned int v13 = (*(uint64_t (**)(Backend *, uint64_t))(*(void *)a2 + 16LL))(a2, 2LL)) != 0)
  {
    uint64_t v18 = __cxa_allocate_exception(0x40uLL);
    *uint64_t v18 = off_18A1E43B0;
    unint64_t v19 = std::generic_category();
    v18[1] = v13;
    v18[2] = v19;
    *((_BYTE *)v18 + 24) = 0;
    *((_BYTE *)v18 + 48) = 0;
    v18[7] = "Failed writing sparsebundle info";
  }

  CFAutoRelease<__CFData const*>::~CFAutoRelease((const void **)&v27);
  CFAutoRelease<__CFError *>::~CFAutoRelease((const void **)&error);
  return CFAutoRelease<__CFDictionary *>::~CFAutoRelease((const void **)&Mutable);
}

void sub_188158184( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
}

void *di_log::logger<di_log::log_printer<304ul>>::logger(void *a1, __int128 *a2)
{
  unsigned int v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x189614770] + 16LL;
  di_log::logger_buf<di_log::log_printer<304ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = off_18A1EFB18;
  a1[45] = &unk_18A1EFC18;
  a1[46] = &unk_18A1EFC40;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_18A1EFB18;
  a1[45] = &unk_18A1EFBA0;
  a1[46] = &unk_18A1EFBC8;
  return a1;
}

void sub_1881582AC(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger<di_log::log_printer<304ul>>::~logger(uint64_t a1)
{
  return a1;
}

void *di_log::logger<di_log::log_printer<322ul>>::logger(void *a1, __int128 *a2)
{
  unsigned int v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x189614770] + 16LL;
  di_log::logger_buf<di_log::log_printer<322ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = off_18A1EFD38;
  a1[45] = &unk_18A1EFE38;
  a1[46] = &unk_18A1EFE60;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_18A1EFD38;
  a1[45] = &unk_18A1EFDC0;
  a1[46] = &unk_18A1EFDE8;
  return a1;
}

void sub_188158394(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger<di_log::log_printer<322ul>>::~logger(uint64_t a1)
{
  return a1;
}

uint64_t SparseBundleBackend::truncate(SparseBundleBackend *this, uint64_t a2)
{
  *((void *)this + 15) = (a2 + 4095) & 0xFFFFFFFFFFFFF000LL;
  SparseBundleBackend::write_info_plists(this);
  return 0LL;
}

void SparseBundleBackend::open_token_file(SparseBundleBackend *this@<X0>, void *a2@<X8>)
{
  unsigned int v3 = (int *)((char *)this + 32);
  else {
    int v4 = 0;
  }
  int v7 = v4;
  std::string::basic_string[abi:ne180100]<0>(__p, "token");
  std::allocate_shared[abi:ne180100]<FileLocal,std::allocator<FileLocal>,int &,std::string,int &,void>( v3,  (uint64_t)__p,  &v7,  a2);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1881585A8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SparseBundleBackend::lock(SparseBundleBackend *this)
{
  if (((*(uint64_t (**)(SparseBundleBackend *))(*(void *)this + 192LL))(this) & 1) == 0)
  {
    else {
      int v2 = 20;
    }
    int v13 = v2;
    std::string::basic_string[abi:ne180100]<0>(__p, "lock");
    std::allocate_shared[abi:ne180100]<FileLocal,std::allocator<FileLocal>,int &,std::string,int &,void>( (int *)this + 8,  (uint64_t)__p,  &v13,  &v7);
    std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100]((uint64_t)this + 80, &v7);
    unsigned int v3 = (std::__shared_weak_count *)*((void *)&v7 + 1);
    if (*((void *)&v7 + 1))
    {
      int v4 = (unint64_t *)(*((void *)&v7 + 1) + 8LL);
      do
        unint64_t v5 = __ldaxr(v4);
      while (__stlxr(v5 - 1, v4));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }

    if (v10 < 0) {
      operator delete(__p[0]);
    }
    *(void *)&__int128 v7 = "int SparseBundleBackend::lock()";
    *((void *)&v7 + 1) = 29LL;
    int v8 = 0;
    di_log::logger<di_log::log_printer<361ul>>::logger(__p, &v7);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( &v11,  (uint64_t)"Opened bundle's lock file with flags 0x",  39LL);
    *(_DWORD *)((char *)&v11 + *(void *)(v11 - 24) + 8) = *(_DWORD *)((_BYTE *)&v11 + *(void *)(v11 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::ostream::operator<<();
    *(_DWORD *)((char *)&v11 + *(void *)(v11 - 24) + 8) = *(_DWORD *)((_BYTE *)&v11 + *(void *)(v11 - 24) + 8) & 0xFFFFFFB5 | 2;
    std::ostream::~ostream();
    di_log::logger_buf<di_log::log_printer<361ul>>::~logger_buf((uint64_t)__p);
    MEMORY[0x1895BC2CC](&v12);
  }

  return 0LL;
}

void sub_188158750( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int128 a10, int a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60)
{
  if (a2 == 1)
  {
    unint64_t v60 = __cxa_begin_catch(exception_object);
    int v61 = v60[2];
    if (v61 < 0) {
      int v61 = -v61;
    }
    BOOL v62 = v61 == 45 || v61 == 2;
    *(void *)&a10 = "int SparseBundleBackend::lock()";
    *((void *)&a10 + 1) = 29LL;
    if (v62)
    {
      a11 = 0;
      di_log::logger<di_log::log_printer<367ul>>::logger(&__p, &a10);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( &a60,  (uint64_t)"Cannot lock bundle, ignoring: ",  30LL);
      operator<<(&a60, (uint64_t)v60);
      di_log::logger<di_log::log_printer<367ul>>::~logger((uint64_t)&__p);
    }

    else
    {
      a11 = 16;
      di_log::logger<di_log::log_printer<370ul>>::logger(&__p, &a10);
      operator<<(&a60, (uint64_t)v60);
      di_log::logger<di_log::log_printer<370ul>>::~logger((uint64_t)&__p);
    }

    __cxa_end_catch();
    JUMPOUT(0x188158738LL);
  }

  _Unwind_Resume(exception_object);
}

void *di_log::logger<di_log::log_printer<367ul>>::logger(void *a1, __int128 *a2)
{
  unsigned int v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x189614770] + 16LL;
  di_log::logger_buf<di_log::log_printer<367ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = off_18A1EFF58;
  a1[45] = &unk_18A1F0058;
  a1[46] = &unk_18A1F0080;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_18A1EFF58;
  a1[45] = &unk_18A1EFFE0;
  a1[46] = &unk_18A1F0008;
  return a1;
}

void sub_188158918(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger<di_log::log_printer<367ul>>::~logger(uint64_t a1)
{
  return a1;
}

uint64_t non-virtual thunk to'SparseBundleBackend::lock(SparseBundleBackend *this)
{
  return SparseBundleBackend::lock((SparseBundleBackend *)((char *)this - 72));
}

uint64_t SparseBundleBackend::unlock_all(SparseBundleBackend *this)
{
  if ((*(unsigned int (**)(SparseBundleBackend *))(*(void *)this + 192LL))(this))
  {
    std::shared_ptr<Backend>::reset[abi:ne180100]((void *)this + 10);
    *(void *)&__int128 v3 = "int SparseBundleBackend::unlock_all()";
    *((void *)&v3 + 1) = 35LL;
    int v4 = 0;
    di_log::logger<di_log::log_printer<379ul>>::logger(v5, &v3);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( &v6,  (uint64_t)"Bundle's lock file is closed",  28LL);
    std::ostream::~ostream();
    di_log::logger_buf<di_log::log_printer<379ul>>::~logger_buf((uint64_t)v5);
    MEMORY[0x1895BC2CC](&v7);
  }

  return 0LL;
}

void sub_188158A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void *di_log::logger<di_log::log_printer<379ul>>::logger(void *a1, __int128 *a2)
{
  __int128 v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x189614770] + 16LL;
  di_log::logger_buf<di_log::log_printer<379ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = off_18A1F0178;
  a1[45] = &unk_18A1F0278;
  a1[46] = &unk_18A1F02A0;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_18A1F0178;
  a1[45] = &unk_18A1F0200;
  a1[46] = &unk_18A1F0228;
  return a1;
}

void sub_188158AC0(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger<di_log::log_printer<379ul>>::~logger(uint64_t a1)
{
  return a1;
}

uint64_t non-virtual thunk to'SparseBundleBackend::unlock_all(SparseBundleBackend *this)
{
  return 0LL;
}

BOOL SparseBundleBackend::is_locked(SparseBundleBackend *this)
{
  return *((void *)this + 10) != 0LL;
}

BOOL non-virtual thunk to'SparseBundleBackend::is_locked(SparseBundleBackend *this)
{
  return *((void *)this + 1) != 0LL;
}

void SparseBundleBackend::open_bands_folder(SparseBundleBackend *this@<X0>, void *a2@<X8>)
{
  int v4 = operator new(0x10uLL);
  int v5 = FileDescriptorWrapper::open_from(*((_DWORD *)this + 8), (uint64_t)__p, 0);
  *(void *)int v4 = &off_18A1EB878;
  v4[2] = v5;
  *a2 = v4;
  if (v7 < 0) {
    operator delete(__p[0]);
  }
}

void sub_188158BE4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void SparseBundleBackend::open_mapped_folder(SparseBundleBackend *this@<X0>, void *a2@<X8>)
{
  int v4 = operator new(0x10uLL);
  int v5 = FileDescriptorWrapper::open_from(*((_DWORD *)this + 8), (uint64_t)__p, 0);
  *(void *)int v4 = &off_18A1EB878;
  v4[2] = v5;
  *a2 = v4;
  if (v7 < 0) {
    operator delete(__p[0]);
  }
}

void sub_188158C94( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t SparseBundleBackend::browse_bands_folder(uint64_t a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "bands");
  int v4 = FileDescriptorWrapper::open_from(v3, (uint64_t)__p, 0);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  dirEntries_t::dirEntries_t((dirEntries_t *)&v10, v4);
  while (1)
  {
    int v5 = readdir(v10);
    if (!v5) {
      break;
    }
    *__error() = 0;
    d_name = v5->d_name;
    uint64_t v7 = strtoll(d_name, 0LL, 16);
    if (!*__error())
    {
      std::string::basic_string[abi:ne180100]<0>(__p, d_name);
      uint64_t v13 = v7;
      uint64_t v8 = *(void *)(a2 + 24);
      if (!v8) {
        std::__throw_bad_function_call[abi:ne180100]();
      }
      (*(void (**)(uint64_t, void **, uint64_t *))(*(void *)v8 + 48LL))(v8, __p, &v13);
      if (v12 < 0) {
        operator delete(__p[0]);
      }
    }
  }

  return closedir(v10);
}

void sub_188158DC0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, DIR *a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SparseBundleBackend::get_existing_bands@<X0>(SparseBundleBackend *this@<X0>, void *a2@<X8>)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  unint64_t v16 = (unint64_t)(*((void *)this + 15) + *((void *)this + 16) - 1LL) / *((void *)this + 16);
  int v4 = operator new(0x50uLL);
  lock_free::bitmap_dynamically_allocated_t::bitmap_dynamically_allocated_t(v4, v16, 0);
  uint64_t v14 = 0LL;
  uint64_t v15 = v4;
  *(void *)&__int128 v9 = "SparseBundleBackend::get_existing_bands() const";
  *((void *)&v9 + 1) = 39LL;
  int v10 = 0;
  di_log::logger<di_log::log_printer<437ul>>::logger(v11, &v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( &v12,  (uint64_t)"Looking for existing bands",  26LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<437ul>>::~logger_buf((uint64_t)v11);
  MEMORY[0x1895BC2CC](v13);
  uint64_t v18 = 0LL;
  int v5 = operator new(0x20uLL);
  *int v5 = off_18A1F07D0;
  v5[1] = &v16;
  v5[2] = &v15;
  v5[3] = &v14;
  uint64_t v18 = v5;
  SparseBundleBackend::browse_bands_folder((uint64_t)this, (uint64_t)v17);
  uint64_t v6 = v18;
  if (v18 == v17)
  {
    uint64_t v7 = 4LL;
    uint64_t v6 = v17;
    goto LABEL_5;
  }

  if (v18)
  {
    uint64_t v7 = 5LL;
LABEL_5:
    (*(void (**)(void))(*v6 + 8 * v7))();
  }

  *(void *)&__int128 v9 = "SparseBundleBackend::get_existing_bands() const";
  *((void *)&v9 + 1) = 39LL;
  int v10 = 0;
  di_log::logger<di_log::log_printer<446ul>>::logger(v11, &v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v12, (uint64_t)"Found ", 6LL);
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v12, (uint64_t)" existing bands", 15LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<446ul>>::~logger_buf((uint64_t)v11);
  uint64_t result = MEMORY[0x1895BC2CC](v13);
  *a2 = v15;
  return result;
}

void sub_188158FF0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  uint64_t v14 = *(void *)(v12 - 104);
  *(void *)(v12 - 104) = 0LL;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8LL))(v14);
  }
  _Unwind_Resume(exception_object);
}

void *di_log::logger<di_log::log_printer<437ul>>::logger(void *a1, __int128 *a2)
{
  int v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x189614770] + 16LL;
  di_log::logger_buf<di_log::log_printer<437ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = off_18A1F0398;
  a1[45] = &unk_18A1F0498;
  a1[46] = &unk_18A1F04C0;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_18A1F0398;
  a1[45] = &unk_18A1F0420;
  a1[46] = &unk_18A1F0448;
  return a1;
}

void sub_188159104(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger<di_log::log_printer<437ul>>::~logger(uint64_t a1)
{
  return a1;
}

void *di_log::logger<di_log::log_printer<446ul>>::logger(void *a1, __int128 *a2)
{
  int v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x189614770] + 16LL;
  di_log::logger_buf<di_log::log_printer<446ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = off_18A1F05B8;
  a1[45] = &unk_18A1F06B8;
  a1[46] = &unk_18A1F06E0;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_18A1F05B8;
  a1[45] = &unk_18A1F0640;
  a1[46] = &unk_18A1F0668;
  return a1;
}

void sub_1881591EC(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger<di_log::log_printer<446ul>>::~logger(uint64_t a1)
{
  return a1;
}

void SparseBundleBackend::~SparseBundleBackend(SparseBundleBackend *this)
{
  *(void *)this = off_18A1EEBC0;
  *((void *)this + 3) = &unk_18A1EEC98;
  uint64_t v2 = (SparseBundleBackend *)((char *)this + 24);
  *((void *)this + 9) = &unk_18A1EECC0;
  uint64_t v3 = *((void *)this + 14);
  *((void *)this + 14) = 0LL;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 96);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 80);
  FileDescriptorWrapper::~FileDescriptorWrapper(v2);
  int v4 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
}

{
  FileDescriptorWrapper *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  *(void *)this = off_18A1EEBC0;
  *((void *)this + 3) = &unk_18A1EEC98;
  uint64_t v2 = (SparseBundleBackend *)((char *)this + 24);
  *((void *)this + 9) = &unk_18A1EECC0;
  uint64_t v3 = *((void *)this + 14);
  *((void *)this + 14) = 0LL;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 96);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 80);
  FileDescriptorWrapper::~FileDescriptorWrapper(v2);
  int v4 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  operator delete(this);
}

uint64_t SparseBundleBackend::flush(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 112) + 16LL))(*(void *)(a1 + 112));
}

uint64_t SparseBundleBackend::get_size(SparseBundleBackend *this)
{
  return *((void *)this + 15);
}

uint64_t FileDescriptorBackend::is_writable(FileDescriptorBackend *this)
{
  return *((unsigned __int8 *)this + 36);
}

void *SparseBundleBackend::name(uint64_t a1, void *a2)
{
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"sparsebundle", 12LL);
}

uint64_t SparseBundleBackend::write()
{
  return 4294967251LL;
}

uint64_t SparseBundleBackend::read()
{
  return 4294967251LL;
}

uint64_t FileDescriptorBackend::get_identifier(FileDescriptorBackend *this)
{
  return *((void *)this + 7);
}

void non-virtual thunk to'SparseBundleBackend::~SparseBundleBackend(SparseBundleBackend *this)
{
  *((void *)this - 3) = off_18A1EEBC0;
  *(void *)this = &unk_18A1EEC98;
  *((void *)this + 6) = &unk_18A1EECC0;
  uint64_t v2 = *((void *)this + 11);
  *((void *)this + 11) = 0LL;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 72);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 56);
  FileDescriptorWrapper::~FileDescriptorWrapper(this);
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this - 1);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
}

{
  char *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  *((void *)this - 3) = off_18A1EEBC0;
  uint64_t v2 = (char *)this - 24;
  *(void *)this = &unk_18A1EEC98;
  *((void *)this + 6) = &unk_18A1EECC0;
  uint64_t v3 = *((void *)this + 11);
  *((void *)this + 11) = 0LL;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 72);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 56);
  FileDescriptorWrapper::~FileDescriptorWrapper(this);
  int v4 = (std::__shared_weak_count *)*((void *)this - 1);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  operator delete(v2);
}

{
  FileDescriptorWrapper *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  *((void *)this - 9) = off_18A1EEBC0;
  *((void *)this - 6) = &unk_18A1EEC98;
  uint64_t v2 = (SparseBundleBackend *)((char *)this - 48);
  *(void *)this = &unk_18A1EECC0;
  uint64_t v3 = *((void *)this + 5);
  *((void *)this + 5) = 0LL;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
  FileDescriptorWrapper::~FileDescriptorWrapper(v2);
  int v4 = (std::__shared_weak_count *)*((void *)this - 7);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
}

{
  char *v2;
  FileDescriptorWrapper *v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  *((void *)this - 9) = off_18A1EEBC0;
  uint64_t v2 = (char *)this - 72;
  *((void *)this - 6) = &unk_18A1EEC98;
  uint64_t v3 = (SparseBundleBackend *)((char *)this - 48);
  *(void *)this = &unk_18A1EECC0;
  int v4 = *((void *)this + 5);
  *((void *)this + 5) = 0LL;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8LL))(v4);
  }
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
  FileDescriptorWrapper::~FileDescriptorWrapper(v3);
  int v5 = (std::__shared_weak_count *)*((void *)this - 7);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  operator delete(v2);
}

void set_euid_wrapper::set_euid_wrapper(set_euid_wrapper *this, uid_t a2)
{
  if (seteuid(a2))
  {
    exception = __cxa_allocate_exception(0x40uLL);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v5);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( v5,  (uint64_t)"failed to set euid to ",  22LL);
    std::ostream::operator<<();
    DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)exception, (uint64_t)v5, 1u);
  }

  *(void *)&__int128 v3 = "set_euid_wrapper::set_euid_wrapper(uid_t)";
  *((void *)&v3 + 1) = 34LL;
  int v4 = 0;
  di_log::logger<di_log::log_printer<128ul>>::logger(v5, &v3);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( &v6,  (uint64_t)"uid temporarily set to ",  23LL);
  std::ostream::operator<<();
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<128ul>>::~logger_buf((uint64_t)v5);
  MEMORY[0x1895BC2CC](&v7);
}

void sub_188159694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void *di_log::logger<di_log::log_printer<128ul>>::logger(void *a1, __int128 *a2)
{
  __int128 v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x189614770] + 16LL;
  di_log::logger_buf<di_log::log_printer<128ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = off_18A1EEE58;
  a1[45] = &unk_18A1EEF58;
  a1[46] = &unk_18A1EEF80;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_18A1EEE58;
  a1[45] = &unk_18A1EEEE0;
  a1[46] = &unk_18A1EEF08;
  return a1;
}

void sub_18815975C(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger<di_log::log_printer<128ul>>::~logger(uint64_t a1)
{
  return a1;
}

uint64_t di_log::logger_buf<di_log::log_printer<128ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EEFF0;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_188159828(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<128ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1EEFF0;
  di_log::logger_buf<di_log::log_printer<128ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - FileDescriptorWrapper::~FileDescriptorWrapper((FileDescriptorBackend *)((char *)this + 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

void di_log::logger<di_log::log_printer<128ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<128ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<128ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<128ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<128ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<128ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<128ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<128ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<128ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger_buf<di_log::log_printer<128ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<128ul>>::~logger_buf(a1);
  operator delete(v1);
}

uint64_t di_log::logger_buf<di_log::log_printer<128ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    unsigned __int8 v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<128ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_188159BDC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

int *di_log::log_printer<128ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 128LL;
    __int16 v22 = 2082;
    __int128 v23 = v8;
    __int128 v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      int v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    uint64_t v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        uint64_t v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 128LL;
      __int16 v22 = 2082;
      __int128 v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

void set_euid_wrapper::~set_euid_wrapper(set_euid_wrapper *this)
{
  *(void *)&__int128 v1 = "set_euid_wrapper::~set_euid_wrapper()";
  *((void *)&v1 + 1) = 35LL;
  int v2 = 0;
  di_log::logger<di_log::log_printer<133ul>>::logger(v3, &v1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( &v4,  (uint64_t)"uid restored to 0 (res=",  23LL);
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v4, (uint64_t)")", 1LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<133ul>>::~logger_buf((uint64_t)v3);
  MEMORY[0x1895BC2CC](&v5);
}

void *di_log::logger<di_log::log_printer<133ul>>::logger(void *a1, __int128 *a2)
{
  uint64_t v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x189614770] + 16LL;
  di_log::logger_buf<di_log::log_printer<133ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = off_18A1EF078;
  a1[45] = &unk_18A1EF178;
  a1[46] = &unk_18A1EF1A0;
  std::ios_base::init(v3, a1);
  a1[63] = 0LL;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = off_18A1EF078;
  a1[45] = &unk_18A1EF100;
  a1[46] = &unk_18A1EF128;
  return a1;
}

void sub_188159F2C(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger<di_log::log_printer<133ul>>::~logger(uint64_t a1)
{
  return a1;
}

uint64_t di_log::logger_buf<di_log::log_printer<133ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EF210;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_188159FF8(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<133ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1EF210;
  di_log::logger_buf<di_log::log_printer<133ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - FileDescriptorWrapper::~FileDescriptorWrapper((FileDescriptorBackend *)((char *)this + 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

void di_log::logger<di_log::log_printer<133ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<133ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<133ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<133ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<133ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<133ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<133ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<133ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<133ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger_buf<di_log::log_printer<133ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<133ul>>::~logger_buf(a1);
  operator delete(v1);
}

uint64_t di_log::logger_buf<di_log::log_printer<133ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    unsigned __int8 v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<133ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_18815A3AC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

int *di_log::log_printer<133ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 133LL;
    __int16 v22 = 2082;
    __int128 v23 = v8;
    __int128 v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      int v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    uint64_t v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        uint64_t v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 133LL;
      __int16 v22 = 2082;
      __int128 v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<161ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<161ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  unsigned __int8 v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<161ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<161ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<161ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<161ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger<di_log::log_printer<161ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<161ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<161ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<161ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1EF430;
  di_log::logger_buf<di_log::log_printer<161ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - FileDescriptorWrapper::~FileDescriptorWrapper((FileDescriptorBackend *)((char *)this + 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<161ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<161ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_18815A940( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<161ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<161ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<161ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 161LL;
    __int16 v22 = 2082;
    __int128 v23 = v8;
    __int128 v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      int v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    uint64_t v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        uint64_t v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 161LL;
      __int16 v22 = 2082;
      __int128 v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<207ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<207ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<207ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<207ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<207ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<207ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger<di_log::log_printer<207ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<207ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<207ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<207ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1EF650;
  di_log::logger_buf<di_log::log_printer<207ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - FileDescriptorWrapper::~FileDescriptorWrapper((FileDescriptorBackend *)((char *)this + 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<207ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<207ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_18815AEEC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<207ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<207ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<207ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 207LL;
    __int16 v22 = 2082;
    __int128 v23 = v8;
    __int128 v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      int v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    uint64_t v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        uint64_t v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 207LL;
      __int16 v22 = 2082;
      __int128 v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

void *std::vector<unsigned char>::vector(void *a1, size_t a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    std::vector<std::byte>::__vallocate[abi:ne180100](a1, a2);
    int v4 = (char *)a1[1];
    int v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }

  return a1;
}

void sub_18815B164(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<263ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<263ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<263ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<263ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<263ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<263ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger<di_log::log_printer<263ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<263ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<263ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<263ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1EF870;
  di_log::logger_buf<di_log::log_printer<263ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - FileDescriptorWrapper::~FileDescriptorWrapper((FileDescriptorBackend *)((char *)this + 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<263ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<263ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_18815B508( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<263ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<263ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<263ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 263LL;
    __int16 v22 = 2082;
    __int128 v23 = v8;
    __int128 v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      int v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    uint64_t v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        uint64_t v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 263LL;
      __int16 v22 = 2082;
      __int128 v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<270ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<270ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<270ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<270ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<270ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<270ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger<di_log::log_printer<270ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<270ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<270ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<270ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1EFA90;
  di_log::logger_buf<di_log::log_printer<270ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - FileDescriptorWrapper::~FileDescriptorWrapper((FileDescriptorBackend *)((char *)this + 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<270ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<270ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_18815BAB4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<270ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<270ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<270ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 270LL;
    __int16 v22 = 2082;
    __int128 v23 = v8;
    __int128 v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      int v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    uint64_t v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        uint64_t v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 270LL;
      __int16 v22 = 2082;
      __int128 v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<304ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<304ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<304ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<304ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<304ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<304ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger<di_log::log_printer<304ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<304ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<304ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<304ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1EFCB0;
  di_log::logger_buf<di_log::log_printer<304ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - FileDescriptorWrapper::~FileDescriptorWrapper((FileDescriptorBackend *)((char *)this + 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<304ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<304ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_18815C060( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<304ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<304ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<304ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 304LL;
    __int16 v22 = 2082;
    __int128 v23 = v8;
    __int128 v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      int v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    uint64_t v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        uint64_t v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 304LL;
      __int16 v22 = 2082;
      __int128 v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<322ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<322ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<322ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<322ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<322ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<322ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger<di_log::log_printer<322ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<322ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<322ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<322ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1EFED0;
  di_log::logger_buf<di_log::log_printer<322ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - FileDescriptorWrapper::~FileDescriptorWrapper((FileDescriptorBackend *)((char *)this + 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<322ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<322ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_18815C60C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<322ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<322ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<322ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 322LL;
    __int16 v22 = 2082;
    __int128 v23 = v8;
    __int128 v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      int v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    uint64_t v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        uint64_t v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 322LL;
      __int16 v22 = 2082;
      __int128 v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<367ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<367ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<367ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<367ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<367ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<367ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger<di_log::log_printer<367ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<367ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<367ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<367ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1F00F0;
  di_log::logger_buf<di_log::log_printer<367ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - FileDescriptorWrapper::~FileDescriptorWrapper((FileDescriptorBackend *)((char *)this + 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<367ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<367ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_18815CBB8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<367ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<367ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<367ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 367LL;
    __int16 v22 = 2082;
    __int128 v23 = v8;
    __int128 v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      int v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    uint64_t v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        uint64_t v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 367LL;
      __int16 v22 = 2082;
      __int128 v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<379ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<379ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<379ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<379ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<379ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<379ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger<di_log::log_printer<379ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<379ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<379ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<379ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1F0310;
  di_log::logger_buf<di_log::log_printer<379ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - FileDescriptorWrapper::~FileDescriptorWrapper((FileDescriptorBackend *)((char *)this + 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<379ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<379ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_18815D164( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<379ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<379ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<379ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 379LL;
    __int16 v22 = 2082;
    __int128 v23 = v8;
    __int128 v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      int v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    uint64_t v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        uint64_t v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 379LL;
      __int16 v22 = 2082;
      __int128 v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

void dirEntries_t::dirEntries_t(dirEntries_t *this, int a2)
{
  uint64_t v3 = fdopendir(a2);
  *(void *)this = v3;
  if (!v3)
  {
    exception = (DiskImagesRuntimeException *)__cxa_allocate_exception(0x40uLL);
    DiskImagesRuntimeException::DiskImagesRuntimeException( exception,  "Failed opening folder for entries reading",  0x13u);
  }

void non-virtual thunk to'di_log::logger<di_log::log_printer<437ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<437ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<437ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<437ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<437ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<437ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger<di_log::log_printer<437ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<437ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<437ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<437ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1F0530;
  di_log::logger_buf<di_log::log_printer<437ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - FileDescriptorWrapper::~FileDescriptorWrapper((FileDescriptorBackend *)((char *)this + 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<437ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<437ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_18815D76C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<437ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<437ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<437ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 437LL;
    __int16 v22 = 2082;
    __int128 v23 = v8;
    __int128 v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      int v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    uint64_t v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        uint64_t v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 437LL;
      __int16 v22 = 2082;
      __int128 v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

void non-virtual thunk to'di_log::logger<di_log::log_printer<446ul>>::~logger(uint64_t a1)
{
  uint64_t v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<446ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  void *v2;
  uint64_t v2 = (void *)(a1 - 360);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<446ul>>::~logger_buf((uint64_t)v2);
  MEMORY[0x1895BC2CC](a1 + 8);
  operator delete(v2);
}

void virtual thunk to'di_log::logger<di_log::log_printer<446ul>>::~logger(void *a1)
{
  uint64_t v1 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<446ul>>::~logger_buf(v1);
  JUMPOUT(0x1895BC2CCLL);
}

{
  char *v1;
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24LL);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<446ul>>::~logger_buf((uint64_t)v1);
  MEMORY[0x1895BC2CC](v1 + 368);
  operator delete(v1);
}

void di_log::logger<di_log::log_printer<446ul>>::~logger(char *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<446ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64)) {
    std::ostream::write();
  }
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<446ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2 = a2;
  if (a1[64])
  {
    if (a2 == -1) {
      (*(void (**)(_BYTE *))(*(void *)a1 + 48LL))(a1);
    }
    else {
      std::ostream::put();
    }
  }

  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<446ul>>::~logger_buf(uint64_t a1)
{
  *(void *)a1 = off_18A1F0750;
  di_log::logger_buf<di_log::log_printer<446ul>>::_sync(a1);
  uint64_t v2 = MEMORY[0x189614738];
  uint64_t v3 = *MEMORY[0x189614738];
  *(void *)(a1 + 96) = *MEMORY[0x189614738];
  *(void *)(a1 + 96 + *(void *)(v3 - FileDescriptorWrapper::~FileDescriptorWrapper((FileDescriptorBackend *)((char *)this + 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 104) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1895BC2CC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<446ul>>::_sync(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 64))
  {
    uint64_t v2 = (void *)(a1 + 96);
    uint64_t v3 = a1 + 96 + *(void *)(*(void *)(a1 + 96) - 24LL);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**(void **)(v3 + 40) + 32LL))( __p,  *(void *)(v3 + 40),  0LL,  1LL,  16LL);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<446ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(void *)(*v2 - 24LL)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return 0LL;
}

void sub_18815DD18( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<446ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v1 = (void *)di_log::logger_buf<di_log::log_printer<446ul>>::~logger_buf(a1);
  operator delete(v1);
}

int *di_log::log_printer<446ul>::log(uint64_t *a1, uint64_t *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  int v4 = *((_DWORD *)a1 + 2);
  int v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = (os_log_s *)getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    uint64_t v7 = *a1;
    else {
      uint64_t v8 = (uint64_t *)*a2;
    }
    *(_DWORD *)buf = 68158466;
    int v17 = v4;
    __int16 v18 = 2080;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = 446LL;
    __int16 v22 = 2082;
    __int128 v23 = v8;
    __int128 v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      int v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x1895F89D0], "%s\n", v9);
      free(v10);
    }
  }

  else
  {
    uint64_t v11 = (os_log_s *)getDIOSLog();
    os_log_type_t v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = *a1;
      else {
        uint64_t v14 = (uint64_t *)*a2;
      }
      *(_DWORD *)buf = 68158466;
      int v17 = v4;
      __int16 v18 = 2080;
      uint64_t v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = 446LL;
      __int16 v22 = 2082;
      __int128 v23 = v14;
      _os_log_impl(&dword_188046000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }

  uint64_t result = __error();
  int *result = v5;
  return result;
}

uint64_t di_log::logger_buf<di_log::log_printer<161ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EF430;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_18815DFA4(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<207ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EF650;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_18815E020(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<263ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EF870;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_18815E09C(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<270ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EFA90;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_18815E118(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<304ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EFCB0;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_18815E194(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<322ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1EFED0;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_18815E210(_Unwind_Exception *a1)
{
}

void std::allocate_shared[abi:ne180100]<FileLocal,std::allocator<FileLocal>,int &,std::string,int &,void>( int *a1@<X1>, uint64_t a2@<X2>, int *a3@<X3>, void *a4@<X8>)
{
  uint64_t v8 = operator new(0x470uLL);
  std::__shared_ptr_emplace<FileLocal>::__shared_ptr_emplace[abi:ne180100]<int &,std::string,int &,std::allocator<FileLocal>,0>( v8,  a1,  a2,  a3);
  *a4 = v8 + 3;
  a4[1] = v8;
  std::shared_ptr<PurgeableFileBackend>::__enable_weak_this[abi:ne180100]<Backend,PurgeableFileBackend,void>( (uint64_t)a4,  v8 + 4,  (uint64_t)(v8 + 3));
}

void sub_18815E288(_Unwind_Exception *a1)
{
}

void *std::__shared_ptr_emplace<FileLocal>::__shared_ptr_emplace[abi:ne180100]<int &,std::string,int &,std::allocator<FileLocal>,0>( void *a1, int *a2, uint64_t a3, int *a4)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_18A1CBC00;
  int v5 = *a4;
  int v6 = FileDescriptorWrapper::open_from(*a2, a3, *a4);
  FileLocal::FileLocal((FileLocal *)(a1 + 3), v6, (v5 & 3) != 0, 0);
  return a1;
}

void sub_18815E2F8(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<367ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1F00F0;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_18815E374(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<379ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1F0310;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_18815E3F0(_Unwind_Exception *a1)
{
}

uint64_t di_log::logger_buf<di_log::log_printer<437ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1F0530;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_18815E46C(_Unwind_Exception *a1)
{
}

__n128 std::__function::__func<SparseBundleBackend::get_existing_bands(void)::$_0,std::allocator<SparseBundleBackend::get_existing_bands(void)::$_0>,void ()(std::string const&,unsigned long long)>::__clone( uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = off_18A1F07D0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<SparseBundleBackend::get_existing_bands(void)::$_0,std::allocator<SparseBundleBackend::get_existing_bands(void)::$_0>,void ()(std::string const&,unsigned long long)>::__clone( uint64_t a1, uint64_t a2)
{
  *(void *)a2 = off_18A1F07D0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

BOOL std::__function::__func<SparseBundleBackend::get_existing_bands(void)::$_0,std::allocator<SparseBundleBackend::get_existing_bands(void)::$_0>,void ()(std::string const&,unsigned long long)>::operator()( uint64_t a1, uint64_t a2, unint64_t *a3)
{
  if (**(void **)(a1 + 8) <= *a3)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v10);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( v10,  (uint64_t)"Bands folder contains an out of range band (",  44LL);
    int v7 = *(char *)(a2 + 23);
    if (v7 >= 0) {
      uint64_t v8 = a2;
    }
    else {
      uint64_t v8 = *(void *)a2;
    }
    if (v7 >= 0) {
      uint64_t v9 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      uint64_t v9 = *(void *)(a2 + 8);
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, v8, v9);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)")", 1LL);
    DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)exception, (uint64_t)v10, 0x16u);
  }

  BOOL result = lock_free::bitmap_t::set_bit(**(lock_free::bitmap_t ***)(a1 + 16), *a3, 1);
  ++**(void **)(a1 + 24);
  return result;
}

void sub_18815E5E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20, int a21, __int16 a22, char a23, char a24)
{
  a10 = *MEMORY[0x189614738];
  *(uint64_t *)((char *)&a10 + *(void *)(a10 - FileDescriptorWrapper::~FileDescriptorWrapper((FileDescriptorBackend *)((char *)this + 24)) = *(void *)(MEMORY[0x189614738] + 24LL);
  a11 = MEMORY[0x189614750] + 16LL;
  if (a24 < 0) {
    operator delete(__p);
  }
  std::__function::__func<info::DiskImageInfoSparseBundle::count_mapped_bytes(DiskImageSparseBundle const&)::$_0,std::allocator<info::DiskImageInfoSparseBundle::count_mapped_bytes(DiskImageSparseBundle const&)::$_0>,void ()(std::string const&,unsigned long long)>::operator()( (uint64_t)&a11,  (uint64_t)&a10);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<SparseBundleBackend::get_existing_bands(void)::$_0,std::allocator<SparseBundleBackend::get_existing_bands(void)::$_0>,void ()(std::string const&,unsigned long long)>::target( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

void *std::__function::__func<SparseBundleBackend::get_existing_bands(void)::$_0,std::allocator<SparseBundleBackend::get_existing_bands(void)::$_0>,void ()(std::string const&,unsigned long long)>::target_type()
{
}

uint64_t di_log::logger_buf<di_log::log_printer<446ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  *(void *)std::streambuf::basic_streambuf() = off_18A1F0750;
  if (*((_DWORD *)a2 + 4) == 2) {
    char v4 = DIDebugLogsEnabled();
  }
  else {
    char v4 = 1;
  }
  *(_BYTE *)(a1 + 64) = v4;
  __int128 v5 = *a2;
  *(void *)(a1 + 88) = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_18815E750(_Unwind_Exception *a1)
{
}

const void **info::DiskImageStackableInfo::get_layers@<X0>( const DiskImageStackable *a1@<X1>, char a2@<W2>, const __CFArray **a3@<X8>)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  Mutable = CFArrayCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a1 + 3) - *((void *)a1 + 2)) >> 4),  MEMORY[0x189605228]);
  CFArrayRef theArray = Mutable;
  uint64_t v8 = (int *)*((void *)a1 + 2);
  uint64_t v9 = (int *)*((void *)a1 + 3);
  if (v8 != v9)
  {
    do
    {
      (*(void (**)(char **__return_ptr, void, void))(**((void **)v8 + 3) + 48LL))( &v23,  *((void *)v8 + 3),  0LL);
      CFIndex Count = CFArrayGetCount(theArray);
      uint64_t v11 = @"Base";
      __int16 v22 = v11;
      os_log_type_t v12 = theArray;
      if ((a2 & 4) != 0)
      {
        CFIndex v25 = @"Role";
        char v26 = v11;
        CFRetain(v11);
        (*(void (**)(uint64_t *__return_ptr))(*(void *)&v23[*(void *)(*(void *)v23 - 96LL)] + 16LL))(&v18);
        CFTypeID v27 = @"Image";
        uint64_t v28 = v18;
        uint64_t v18 = 0LL;
        uint64_t v19 = &v25;
        uint64_t v20 = 2LL;
        cf::create_dict_from_list((uint64_t *)&v19, (CFMutableDictionaryRef *)&value);
        CFArrayAppendValue(v12, value);
        CFAutoRelease<__CFDictionary *>::~CFAutoRelease((const void **)&value);
        for (uint64_t i = 24LL; i != -8; i -= 16LL)
          CFAutoRelease<void const*>::~CFAutoRelease((const void **)((char *)&v25 + i));
        CFAutoRelease<__CFDictionary const*>::~CFAutoRelease((const void **)&v18);
      }

      else
      {
        CFIndex v25 = @"Role";
        char v26 = v11;
        CFRetain(v11);
        uint64_t v13 = (*(uint64_t (**)(char *))(*(void *)&v23[*(void *)(*(void *)v23 - 96LL)] + 24LL))(&v23[*(void *)(*(void *)v23 - 96LL)]);
        CFTypeID v27 = @"Image Format";
        uint64_t v28 = v13;
        uint64_t v19 = &v25;
        uint64_t v20 = 2LL;
        cf::create_dict_from_list((uint64_t *)&v19, (CFMutableDictionaryRef *)&value);
        CFArrayAppendValue(v12, value);
        CFAutoRelease<__CFDictionary *>::~CFAutoRelease((const void **)&value);
        for (uint64_t j = 24LL; j != -8; j -= 16LL)
          CFAutoRelease<void const*>::~CFAutoRelease((const void **)((char *)&v25 + j));
      }

      CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)&v22);
      unint64_t v16 = v23;
      __int128 v23 = 0LL;
      if (v16) {
        (*(void (**)(char *))(*(void *)v16 + 8LL))(v16);
      }
      v8 += 12;
    }

    while (v8 != v9);
    Mutable = theArray;
  }

  *a3 = Mutable;
  CFArrayRef theArray = 0LL;
  return CFAutoRelease<__CFArray *>::~CFAutoRelease((const void **)&theArray);
}

void sub_18815E9D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, const void *a11, uint64_t a12, uint64_t a13, const void *a14, const void *a15, uint64_t a16, const void *a17, char a18)
{
  for (uint64_t i = 24LL; i != -8; i -= 16LL)
    CFAutoRelease<void const*>::~CFAutoRelease((const void **)(&a18 + i));
  CFAutoRelease<__CFDictionary const*>::~CFAutoRelease(&a11);
  CFAutoRelease<__CFString const*>::~CFAutoRelease(&a15);
  uint64_t v20 = a16;
  a16 = 0LL;
  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 8LL))(v20);
  }
  CFAutoRelease<__CFArray *>::~CFAutoRelease(&a17);
  _Unwind_Resume(a1);
}

CFTypeRef *CFAutoRelease<__CFString const*>::operator=(CFTypeRef *a1, CFTypeRef *a2)
{
  if (*a2) {
    CFRetain(*a2);
  }
  if (*a1) {
    CFRelease(*a1);
  }
  *a1 = *a2;
  return a1;
}

info::DiskImageStackableInfo *info::DiskImageStackableInfo::DiskImageStackableInfo( info::DiskImageStackableInfo *this, const DiskImageStackable *a2, uint64_t a3)
{
  *(void *)this = off_18A1F0D78;
  *((void *)this + 7) = off_18A1F0EE0;
  *((void *)this + 8) = off_18A1F0F28;
  *((void *)this + 9) = off_18A1F11B0;
  *((void *)this + 3) = off_18A1F1208;
  *((void *)this + 4) = off_18A1F0E08;
  *((_BYTE *)this + 96) = 0;
  *((_BYTE *)this + 104) = 0;
  *((_BYTE *)this + 112) = 0;
  *((_BYTE *)this + 120) = 0;
  *((void *)this + 17) = off_18A1F12F8;
  *((void *)this + 5) = off_18A1F1350;
  *((void *)this + 6) = off_18A1F0E98;
  *((_BYTE *)this + 144) = 0;
  *((_BYTE *)this + 152) = 0;
  *((void *)this + 20) = 0LL;
  info::IdentityInfo::IdentityInfo<DiskImageStackable>((void *)this + 21, (DiskImage *)&off_18A1F0CF8, (uint64_t)a2);
  *(void *)this = off_18A1F08C0;
  *((void *)this + 3) = &unk_18A1F0908;
  *((void *)this + 4) = &unk_18A1F0950;
  *((void *)this + 5) = &unk_18A1F0998;
  *((void *)this + 6) = &unk_18A1F09E0;
  *((void *)this + 7) = &unk_18A1F0A28;
  *((void *)this + 8) = &unk_18A1F0A70;
  *((void *)this + 9) = &unk_18A1F0AD0;
  *((void *)this + 17) = &unk_18A1F0B40;
  *((void *)this + 1) = 0LL;
  int v6 = (CFTypeRef *)((char *)this + 8);
  *((void *)this + 2) = 0LL;
  int v7 = (CFTypeRef *)((char *)this + 16);
  *((void *)this + 21) = &unk_18A1F0BB0;
  uint64_t v8 = *((void *)a2 + 2);
  uint64_t v9 = *(void *)(v8 + 24);
  int v10 = *(std::__shared_weak_count **)(v8 + 32);
  v26[1] = v9;
  v26[2] = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      unint64_t v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }

  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(*(void *)v9 + 48LL))(v26, v9, a3);
  uint64_t v13 = (*(uint64_t (**)(void))(*(void *)(v26[0] + *(void *)(*(void *)v26[0] - 24LL)) + 16LL))(v26[0] + *(void *)(*(void *)v26[0] - 24LL));
  uint64_t v14 = *(void *)this;
  *(void *)((char *)this + *(void *)(*(void *)this - 112LL) + 16) = *(void *)(v13 + 16);
  *(void *)((char *)this + *(void *)(v14 - 112) + 8) = *(void *)(v13 + 8);
  *(void *)((char *)this + *(void *)(v14 - 112) + 56) = *(void *)(v13 + 56);
  uint64_t v15 = (char *)this + *(void *)(v14 - 112);
  uint64_t v16 = *(void *)(v13 + 40);
  v15[48] = *(_BYTE *)(v13 + 48);
  *((void *)v15 + 5) = v16;
  int v17 = (char *)this + *(void *)(*(void *)this - 112LL);
  uint64_t v18 = *(void *)(v13 + 24);
  v17[32] = *(_BYTE *)(v13 + 32);
  *((void *)v17 + 3) = v18;
  uint64_t v19 = (*(uint64_t (**)(void))(*(void *)(v26[0] + *(void *)(*(void *)v26[0] - 64LL)) + 16LL))(v26[0] + *(void *)(*(void *)v26[0] - 64LL));
  CFAutoRelease<__CFString const*>::operator=( (CFTypeRef *)((char *)this + *(void *)(*(void *)this - 128LL) + 16),  (CFTypeRef *)(v19 + 16));
  CFAutoRelease<__CFString const*>::operator=( (CFTypeRef *)((char *)this + *(void *)(*(void *)this - 128LL) + 24),  (CFTypeRef *)(v19 + 24));
  info::DiskImageStackableInfo::get_layers(a2, a3, (const __CFArray **)&v25);
  if (*v6) {
    CFRelease(*v6);
  }
  *int v6 = v25;
  CFIndex v25 = 0LL;
  CFAutoRelease<__CFArray const*>::~CFAutoRelease(&v25);
  CFIndex v25 = v20;
  if (*v7)
  {
    CFRelease(*v7);
    uint64_t v20 = v25;
  }

  *int v7 = v20;
  CFIndex v25 = 0LL;
  CFAutoRelease<__CFString const*>::~CFAutoRelease(&v25);
  uint64_t v21 = v26[0];
  v26[0] = 0LL;
  if (v21) {
    (*(void (**)(uint64_t))(*(void *)v21 + 8LL))(v21);
  }
  if (v10)
  {
    __int16 v22 = (unint64_t *)&v10->__shared_owners_;
    do
      unint64_t v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  return this;
}

void sub_18815EDDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, uint64_t a10, char a11)
{
  uint64_t v18 = a10;
  a10 = 0LL;
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8LL))(v18);
  }
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  CFAutoRelease<__CFString const*>::~CFAutoRelease(v14);
  CFAutoRelease<__CFArray const*>::~CFAutoRelease(v15);
  info::IdentityInfo::~IdentityInfo(v13, (const void **)&off_18A1F0CF8);
  *(void *)(v11 + 136) = v16;
  *(void *)(v11 + 40) = v16 + 88;
  CFAutoRelease<__CFString const*>::~CFAutoRelease(v12);
  _Unwind_Resume(a1);
}

void *info::IdentityInfo::IdentityInfo<DiskImageStackable>(void *a1, DiskImage *a2, uint64_t a3)
{
  *a1 = off_18A1D7610;
  uint64_t v4 = *((void *)a2 + 1);
  *a1 = v4;
  *(void *)((char *)a1 + *(void *)(v4 - FileDescriptorWrapper::~FileDescriptorWrapper((FileDescriptorBackend *)((char *)this + 24)) = *((void *)a2 + 2);
  uint64_t v5 = *(void *)a2;
  *a1 = *(void *)a2;
  *(void *)((char *)a1 + *(void *)(v5 - FileDescriptorWrapper::~FileDescriptorWrapper((FileDescriptorBackend *)((char *)this + 24)) = *((void *)a2 + 3);
  a1[1] = 0LL;
  a1[2] = 0LL;
  int v6 = (CFTypeRef *)(a1 + 1);
  a1[3] = 0LL;
  uint64_t identifier = di_stackable::get_identifier(*(di_stackable **)(*(void *)(a3 + 16) + 24LL), a2);
  uint64_t v9 = v8;
  int v10 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  *(void *)&v15.byte0 = identifier;
  *(void *)&v15.byte8 = v9;
  uint64_t v14 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x189604DB0], v15);
  CFStringRef v11 = CFUUIDCreateString(v10, v14);
  uint64_t v13 = v11;
  if (*v6)
  {
    CFRelease(*v6);
    CFStringRef v11 = v13;
  }

  a1[1] = v11;
  uint64_t v13 = 0LL;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)&v13);
  CFAutoRelease<__CFUUID const*>::~CFAutoRelease((const void **)&v14);
  return a1;
}

void sub_18815EF58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

void info::DiskImageStackableInfo::~DiskImageStackableInfo(info::DiskImageStackableInfo *this)
{
  *(void *)this = off_18A1F08C0;
  *((void *)this + 3) = &unk_18A1F0908;
  *((void *)this + 4) = &unk_18A1F0950;
  *((void *)this + 5) = &unk_18A1F0998;
  *((void *)this + 6) = &unk_18A1F09E0;
  *((void *)this + 7) = &unk_18A1F0A28;
  *((void *)this + 8) = &unk_18A1F0A70;
  *((void *)this + 9) = &unk_18A1F0AD0;
  *((void *)this + 17) = &unk_18A1F0B40;
  *((void *)this + 21) = &unk_18A1F0BB0;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)this + 2);
  CFAutoRelease<__CFArray const*>::~CFAutoRelease((const void **)this + 1);
  *((void *)this + 21) = off_18A1F1440;
  *((void *)this + 8) = off_18A1F1498;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)this + 24);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)this + 23);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)this + 22);
  *((void *)this + 17) = off_18A1F12F8;
  *((void *)this + 5) = off_18A1F1350;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)this + 20);
}

{
  *(void *)this = off_18A1F08C0;
  *((void *)this + 3) = &unk_18A1F0908;
  *((void *)this + 4) = &unk_18A1F0950;
  *((void *)this + 5) = &unk_18A1F0998;
  *((void *)this + 6) = &unk_18A1F09E0;
  *((void *)this + 7) = &unk_18A1F0A28;
  *((void *)this + 8) = &unk_18A1F0A70;
  *((void *)this + 9) = &unk_18A1F0AD0;
  *((void *)this + 17) = &unk_18A1F0B40;
  *((void *)this + 21) = &unk_18A1F0BB0;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)this + 2);
  CFAutoRelease<__CFArray const*>::~CFAutoRelease((const void **)this + 1);
  *((void *)this + 21) = off_18A1F1440;
  *((void *)this + 8) = off_18A1F1498;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)this + 24);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)this + 23);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)this + 22);
  *((void *)this + 17) = off_18A1F12F8;
  *((void *)this + 5) = off_18A1F1350;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)this + 20);
  operator delete(this);
}

const void **info::DiskImageStackableInfo::serialize_to_dict@<X0>(CFArrayRef *this@<X0>, void *a2@<X8>)
{
  v13[14] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (*((uint64_t (**)(CFArrayRef *))*this + 3))(this);
  v13[0] = @"Image Format";
  v13[1] = v4;
  v13[2] = @"Format Description";
  v13[3] = @"Stackable image";
  info::SizeInfo::serialize_to_dict((info::SizeInfo *)((char *)this + *((void *)*this - 14)), &valuePtr);
  v13[4] = @"Size Info";
  v13[5] = valuePtr;
  CFIndex valuePtr = 0LL;
  CFAutoRelease<__CFDictionary const*>::~CFAutoRelease((const void **)&valuePtr);
  info::EncryptionInfo::serialize_to_dict((info::EncryptionInfo *)((char *)this + *((void *)*this - 15)), &valuePtr);
  v13[6] = @"Encryption Info";
  v13[7] = valuePtr;
  CFIndex valuePtr = 0LL;
  CFAutoRelease<__CFDictionary const*>::~CFAutoRelease((const void **)&valuePtr);
  info::IdentityInfo::serialize_to_dict((info::IdentityInfo *)((char *)this + *((void *)*this - 16)), &valuePtr);
  v13[8] = @"Identity Info";
  v13[9] = valuePtr;
  CFIndex valuePtr = 0LL;
  CFAutoRelease<__CFDictionary const*>::~CFAutoRelease((const void **)&valuePtr);
  CFIndex valuePtr = CFArrayGetCount(this[1]);
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberLongType, &valuePtr);
  v13[10] = @"Images Count";
  v13[11] = v5;
  uint64_t v9 = 0LL;
  CFArrayRef v6 = this[1];
  v13[12] = @"Stack Info";
  v13[13] = v6;
  if (v6) {
    CFRetain(v6);
  }
  v10[0] = (uint64_t)v13;
  v10[1] = 7LL;
  cf::create_dict_from_list(v10, (CFMutableDictionaryRef *)&v11);
  *a2 = v11;
  CFStringRef v11 = 0LL;
  CFAutoRelease<__CFDictionary *>::~CFAutoRelease(&v11);
  for (uint64_t i = 13LL; i != -1; i -= 2LL)
    CFAutoRelease<void const*>::~CFAutoRelease((const void **)&v13[i]);
  return CFAutoRelease<__CFNumber const*>::~CFAutoRelease(&v9);
}

void sub_18815F2F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  do
  {
    CFAutoRelease<void const*>::~CFAutoRelease(v14 - 1);
    v14 -= 2;
  }

  while (v14 != (const void **)&a14);
  _Unwind_Resume(a1);
}

const __CFString *info::DiskImageStackableInfo::get_category(info::DiskImageStackableInfo *this)
{
  return @"STCK";
}

void virtual thunk to'info::DiskImageStackableInfo::~DiskImageStackableInfo( info::DiskImageStackableInfo *this)
{
  uint64_t v1 = (char *)this + *(void *)(*(void *)this - 24LL);
  *(void *)uint64_t v1 = off_18A1F08C0;
  *((void *)v1 + 3) = &unk_18A1F0908;
  *((void *)v1 + 4) = &unk_18A1F0950;
  *((void *)v1 + 5) = &unk_18A1F0998;
  *((void *)v1 + 6) = &unk_18A1F09E0;
  *((void *)v1 + 7) = &unk_18A1F0A28;
  *((void *)v1 + 8) = &unk_18A1F0A70;
  *((void *)v1 + 9) = &unk_18A1F0AD0;
  *((void *)v1 + 17) = &unk_18A1F0B40;
  *((void *)v1 + 21) = &unk_18A1F0BB0;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 2);
  CFAutoRelease<__CFArray const*>::~CFAutoRelease((const void **)v1 + 1);
  *((void *)v1 + 21) = off_18A1F1440;
  *((void *)v1 + 8) = off_18A1F1498;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 24);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 23);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 22);
  *((void *)v1 + 17) = off_18A1F12F8;
  *((void *)v1 + 5) = off_18A1F1350;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 20);
}

{
  char *v1;
  uint64_t v1 = (char *)this + *(void *)(*(void *)this - 24LL);
  *(void *)uint64_t v1 = off_18A1F08C0;
  *((void *)v1 + 3) = &unk_18A1F0908;
  *((void *)v1 + 4) = &unk_18A1F0950;
  *((void *)v1 + 5) = &unk_18A1F0998;
  *((void *)v1 + 6) = &unk_18A1F09E0;
  *((void *)v1 + 7) = &unk_18A1F0A28;
  *((void *)v1 + 8) = &unk_18A1F0A70;
  *((void *)v1 + 9) = &unk_18A1F0AD0;
  *((void *)v1 + 17) = &unk_18A1F0B40;
  *((void *)v1 + 21) = &unk_18A1F0BB0;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 2);
  CFAutoRelease<__CFArray const*>::~CFAutoRelease((const void **)v1 + 1);
  *((void *)v1 + 21) = off_18A1F1440;
  *((void *)v1 + 8) = off_18A1F1498;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 24);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 23);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 22);
  *((void *)v1 + 17) = off_18A1F12F8;
  *((void *)v1 + 5) = off_18A1F1350;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 20);
  operator delete(v1);
}

{
  char *v1;
  uint64_t v1 = (char *)this + *(void *)(*(void *)this - 32LL);
  *(void *)uint64_t v1 = off_18A1F08C0;
  *((void *)v1 + 3) = &unk_18A1F0908;
  *((void *)v1 + 4) = &unk_18A1F0950;
  *((void *)v1 + 5) = &unk_18A1F0998;
  *((void *)v1 + 6) = &unk_18A1F09E0;
  *((void *)v1 + 7) = &unk_18A1F0A28;
  *((void *)v1 + 8) = &unk_18A1F0A70;
  *((void *)v1 + 9) = &unk_18A1F0AD0;
  *((void *)v1 + 17) = &unk_18A1F0B40;
  *((void *)v1 + 21) = &unk_18A1F0BB0;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 2);
  CFAutoRelease<__CFArray const*>::~CFAutoRelease((const void **)v1 + 1);
  *((void *)v1 + 21) = off_18A1F1440;
  *((void *)v1 + 8) = off_18A1F1498;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 24);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 23);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 22);
  *((void *)v1 + 17) = off_18A1F12F8;
  *((void *)v1 + 5) = off_18A1F1350;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 20);
}

{
  char *v1;
  uint64_t v1 = (char *)this + *(void *)(*(void *)this - 32LL);
  *(void *)uint64_t v1 = off_18A1F08C0;
  *((void *)v1 + 3) = &unk_18A1F0908;
  *((void *)v1 + 4) = &unk_18A1F0950;
  *((void *)v1 + 5) = &unk_18A1F0998;
  *((void *)v1 + 6) = &unk_18A1F09E0;
  *((void *)v1 + 7) = &unk_18A1F0A28;
  *((void *)v1 + 8) = &unk_18A1F0A70;
  *((void *)v1 + 9) = &unk_18A1F0AD0;
  *((void *)v1 + 17) = &unk_18A1F0B40;
  *((void *)v1 + 21) = &unk_18A1F0BB0;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 2);
  CFAutoRelease<__CFArray const*>::~CFAutoRelease((const void **)v1 + 1);
  *((void *)v1 + 21) = off_18A1F1440;
  *((void *)v1 + 8) = off_18A1F1498;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 24);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 23);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 22);
  *((void *)v1 + 17) = off_18A1F12F8;
  *((void *)v1 + 5) = off_18A1F1350;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 20);
  operator delete(v1);
}

const void **virtual thunk to'info::DiskImageStackableInfo::serialize_to_dict@<X0>( info::DiskImageStackableInfo *this@<X0>, void *a2@<X8>)
{
  return info::DiskImageStackableInfo::serialize_to_dict( (CFArrayRef *)((char *)this + *(void *)(*(void *)this - 40LL)),  a2);
}

const __CFString *virtual thunk to'info::DiskImageStackableInfo::get_category( info::DiskImageStackableInfo *this)
{
  return @"STCK";
}

void KnoxbackendData::KnoxbackendData( std::string *this, __int128 *a2, std::string::size_type a3, std::string::size_type *a4, std::string::size_type a5)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v10 = *a2;
    this->__r_.__value_.__l.__cap_ = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v10;
  }

  std::string::size_type v11 = a4[1];
  this[1].__r_.__value_.__l.__size_ = *a4;
  this[1].__r_.__value_.__r.__words[0] = a3;
  this[1].__r_.__value_.__l.__cap_ = v11;
  if (v11)
  {
    unint64_t v12 = (unint64_t *)(v11 + 8);
    do
      unint64_t v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }

  int v14 = *((char *)a2 + 23);
  if (v14 >= 0) {
    CFUUIDBytes v15 = (std::string::value_type *)a2;
  }
  else {
    CFUUIDBytes v15 = *(std::string::value_type **)a2;
  }
  if (v14 >= 0) {
    uint64_t v16 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    uint64_t v16 = *((void *)a2 + 1);
  }
  this[2].__r_.__value_.__r.__words[0] = di_utils::buffer_to_uuid((di_utils *)v15, v16);
  this[2].__r_.__value_.__l.__size_ = v17;
  this[2].__r_.__value_.__l.__cap_ = a5;
}

void sub_18815F74C(_Unwind_Exception *a1)
{
}

void Knoxbackend::KnoxCreateStreams(uint64_t a1, char *a2, uint64_t a3, uint8_t **a4)
{
  if (a2[23] >= 0) {
    CFArrayRef v6 = a2;
  }
  else {
    CFArrayRef v6 = *(char **)a2;
  }
  *(void *)&__int128 v10 = AAS3DownloadStreamOpen(v6, 0LL, 0LL, 0);
  AEAwrapper::ByteStream::ByteStream(&v13, &v10);
  AEAwrapper::Context::Context((AEAwrapper::Context *)&v12, (AEAwrapper::ByteStream *)&v13);
  AEAwrapper::Context::setSymmetricKey(&v12, *a4, 0x20uLL);
  AEAwrapper::ByteStream::make_DecryptionRandomAccessInputStream( &v13,  &v12,  0xFFFFFFFFFFFFFFFFLL,  0x4000000000000000uLL,  0,  (uint64_t *)&v11);
  std::allocate_shared[abi:ne180100]<AEAwrapper::DecryptionStream,std::allocator<AEAwrapper::DecryptionStream>,AEAwrapper::ByteStream,AEAwrapper::Context,AEAwrapper::ByteStream,void>( &v13,  (uint64_t *)&v12,  &v11,  &v10);
  std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100](a1 + 40, &v10);
  int v7 = (std::__shared_weak_count *)*((void *)&v10 + 1);
  if (*((void *)&v10 + 1))
  {
    uint64_t v8 = (unint64_t *)(*((void *)&v10 + 1) + 8LL);
    do
      unint64_t v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  AEAwrapper::ByteStream::~ByteStream(&v11);
  AEAwrapper::Context::~Context(&v12);
  AEAwrapper::ByteStream::~ByteStream(&v13);
}

void sub_18815F874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  AAByteStream v4 = va_arg(va1, AAByteStream);
  va_copy(va2, va1);
  AEAContext v6 = va_arg(va2, AEAContext);
  AEAwrapper::ByteStream::~ByteStream((AAByteStream *)va);
  AEAwrapper::Context::~Context((AEAContext *)va1);
  AEAwrapper::ByteStream::~ByteStream((AAByteStream *)va2);
  _Unwind_Resume(a1);
}

Backend *Knoxbackend::Knoxbackend(Backend *a1, char **a2, uint64_t a3, std::string::size_type *a4)
{
  *(_OWORD *)(v8 + 24) = 0u;
  uint64_t v9 = v8 + 24;
  *(_OWORD *)(v8 + 40) = 0u;
  __int128 v10 = (AEAContext **)(v8 + 40);
  *(void *)uint64_t v8 = off_18A1F15C8;
  AAByteStream v11 = *a2;
  AEAContext v12 = (uint8_t *)a4[1];
  v25[0] = (uint8_t *)*a4;
  v25[1] = v12;
  if (v12)
  {
    AAByteStream v13 = (unint64_t *)(v12 + 8);
    do
      unint64_t v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }

  Knoxbackend::KnoxCreateStreams((uint64_t)a1, v11, v7, v25);
  if (v12)
  {
    CFUUIDBytes v15 = (unint64_t *)(v12 + 8);
    do
      unint64_t v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      (*(void (**)(uint8_t *))(*(void *)v12 + 16LL))(v12);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v12);
    }
  }

  std::string::size_type v17 = (__int128 *)*a2;
  std::string::size_type RawSize = AEAwrapper::DecryptionStream::getRawSize(*v10);
  std::string::size_type CompressionBlockSize = AEAwrapper::DecryptionStream::getCompressionBlockSize(*v10);
  std::allocate_shared[abi:ne180100]<KnoxbackendData,std::allocator<KnoxbackendData>,std::string &,unsigned long long,std::shared_ptr<unsigned char> const&,unsigned long,void>( v17,  &RawSize,  a4,  &CompressionBlockSize,  &v24);
  std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100](v9, &v24);
  uint64_t v18 = (std::__shared_weak_count *)*((void *)&v24 + 1);
  if (*((void *)&v24 + 1))
  {
    uint64_t v19 = (unint64_t *)(*((void *)&v24 + 1) + 8LL);
    do
      unint64_t v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }

  return a1;
}

void sub_18815F9F0(_Unwind_Exception *a1)
{
  CFNumberRef v5 = *(std::__shared_weak_count **)(v1 + 16);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  _Unwind_Resume(a1);
}

ssize_t Knoxbackend::read(uint64_t a1, uint64_t a2)
{
  return AEAwrapper::DecryptionStream::pread( *(AAByteStream **)(a1 + 40),  *(void **)a2,  *(void *)(a2 + 16),  *(void *)(a2 + 24));
}

void Knoxbackend::~Knoxbackend(Knoxbackend *this)
{
}

{
  std::__shared_weak_count *v2;
  *(void *)this = off_18A1F15C8;
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 40);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
}

uint64_t Knoxbackend::flush()
{
  return 4294967251LL;
}

uint64_t Knoxbackend::get_size(Knoxbackend *this)
{
  return *(void *)(*((void *)this + 3) + 24LL);
}

uint64_t Knoxbackend::is_writable(Knoxbackend *this)
{
  return 0LL;
}

uint64_t Knoxbackend::truncate(Knoxbackend *this)
{
  return 4294967251LL;
}

void *Knoxbackend::name(uint64_t a1, void *a2)
{
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"knox", 4LL);
}

double Knoxbackend::getContext@<D0>(Knoxbackend *this@<X0>, _OWORD *a2@<X8>)
{
  double result = v4[0];
  *a2 = *(_OWORD *)v4;
  return result;
}

uint64_t Knoxbackend::write()
{
  return 4294967251LL;
}

uint64_t Knoxbackend::get_identifier(Knoxbackend *this)
{
  return *(void *)(*((void *)this + 3) + 48LL);
}

void std::allocate_shared[abi:ne180100]<Knoxbackend,std::allocator<Knoxbackend>,Knoxbackend&,void>( const Knoxbackend *a1@<X1>, void *a2@<X8>)
{
  AAByteStream v4 = operator new(0x50uLL);
  std::__shared_ptr_emplace<Knoxbackend>::__shared_ptr_emplace[abi:ne180100]<Knoxbackend&,std::allocator<Knoxbackend>,0>( v4,  a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  std::shared_ptr<PurgeableFileBackend>::__enable_weak_this[abi:ne180100]<Backend,PurgeableFileBackend,void>( (uint64_t)a2,  v4 + 4,  (uint64_t)(v4 + 3));
}

void sub_18815FB84(_Unwind_Exception *a1)
{
}

void *std::__shared_ptr_emplace<Knoxbackend>::__shared_ptr_emplace[abi:ne180100]<Knoxbackend&,std::allocator<Knoxbackend>,0>( void *a1, const Knoxbackend *a2)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_18A1CC428;
  Knoxbackend::Knoxbackend((Knoxbackend *)(a1 + 3), a2);
  return a1;
}

void sub_18815FBCC(_Unwind_Exception *a1)
{
}

void Knoxbackend::Knoxbackend(Knoxbackend *this, const Knoxbackend *a2)
{
  *uint64_t v3 = off_18A1F15C8;
  *(_OWORD *)(v3 + 5) = 0u;
  AAByteStream v4 = v3 + 5;
  *(_OWORD *)(v3 + 3) = 0u;
  std::shared_ptr<DiskImage>::operator=[abi:ne180100](v3 + 3, (uint64_t *)a2 + 3);
  std::shared_ptr<DiskImage>::operator=[abi:ne180100](v4, (uint64_t *)a2 + 5);
}

std::string *std::allocate_shared[abi:ne180100]<KnoxbackendData,std::allocator<KnoxbackendData>,std::string &,unsigned long long,std::shared_ptr<unsigned char> const&,unsigned long,void>@<X0>( __int128 *a1@<X1>, std::string::size_type *a2@<X2>, std::string::size_type *a3@<X3>, std::string::size_type *a4@<X4>, void *a5@<X8>)
{
  __int128 v10 = (std::string *)operator new(0x60uLL);
  double result = std::__shared_ptr_emplace<KnoxbackendData>::__shared_ptr_emplace[abi:ne180100]<std::string &,unsigned long long,std::shared_ptr<unsigned char> const&,unsigned long,std::allocator<KnoxbackendData>,0>( v10,  a1,  a2,  a3,  a4);
  *a5 = v10 + 1;
  a5[1] = v10;
  return result;
}

void sub_18815FCA4(_Unwind_Exception *a1)
{
}

std::string *std::__shared_ptr_emplace<KnoxbackendData>::__shared_ptr_emplace[abi:ne180100]<std::string &,unsigned long long,std::shared_ptr<unsigned char> const&,unsigned long,std::allocator<KnoxbackendData>,0>( std::string *a1, __int128 *a2, std::string::size_type *a3, std::string::size_type *a4, std::string::size_type *a5)
{
  a1->__r_.__value_.__l.__size_ = 0LL;
  a1->__r_.__value_.__l.__cap_ = 0LL;
  a1->__r_.__value_.__r.__words[0] = (std::string::size_type)off_18A1F16A0;
  KnoxbackendData::KnoxbackendData(a1 + 1, a2, *a3, a4, *a5);
  return a1;
}

void sub_18815FCF4(_Unwind_Exception *a1)
{
}

void std::__shared_ptr_emplace<KnoxbackendData>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_18A1F16A0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<KnoxbackendData>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_18A1F16A0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<KnoxbackendData>::__on_zero_shared(uint64_t a1)
{
}

void std::__destroy_at[abi:ne180100]<KnoxbackendData,0>(uint64_t a1)
{
}

Backend *readSynchronizer::readSynchronizer(Backend *a1, void *a2)
{
  *(void *)uint64_t v3 = off_18A1F16F0;
  *(_OWORD *)(v3 + 40) = 0u;
  AAByteStream v4 = (uint64_t **)(v3 + 40);
  *(_OWORD *)(v3 + 56) = 0u;
  CFNumberRef v5 = (uint64_t *)(v3 + 56);
  *(void *)(v3 + 72) = 0LL;
  AEAContext v6 = (unint64_t *)(v3 + 72);
  resources = system_properties::get_resources((system_properties *)v3);
  int v8 = *((_DWORD *)resources + 2);
  if (v8 == 1)
  {
    unsigned int v9 = ((uint64_t (*)(void))*resources)();
  }

  else
  {
    if (v8) {
      std::__throw_bad_variant_access[abi:ne180100]();
    }
    unsigned int v9 = *(_DWORD *)resources;
  }

  LODWORD(v25) = v9 + 1;
  int v26 = 0;
  std::allocate_shared[abi:ne180100]<ref::Allocator<CurrentReader,unsigned long long>,std::allocator<ref::Allocator<CurrentReader,unsigned long long>>,unsigned int,int,void>( (unsigned int *)&v25,  &v26,  &v27);
  std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100]((uint64_t)v5, &v27);
  __int128 v10 = (std::__shared_weak_count *)*((void *)&v27 + 1);
  if (*((void *)&v27 + 1))
  {
    AAByteStream v11 = (unint64_t *)(*((void *)&v27 + 1) + 8LL);
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  AAByteStream v13 = operator new(0x18uLL);
  std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>::vector(v13, v9);
  std::shared_ptr<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>::shared_ptr[abi:ne180100]<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>,void>( &v27,  (uint64_t)v13);
  std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100]((uint64_t)v4, &v27);
  unint64_t v14 = (std::__shared_weak_count *)*((void *)&v27 + 1);
  if (*((void *)&v27 + 1))
  {
    CFUUIDBytes v15 = (unint64_t *)(*((void *)&v27 + 1) + 8LL);
    do
      unint64_t v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

  ref::Allocator<CurrentReader,unsigned long long>::allocate( *v5,  (ref::details **)0xFFFFFFFFFFFFFFFELL,  1,  (unint64_t *)&v27);
  ref::tagged_ptr<CurrentReader,unsigned long long>::operator=(v6, (unint64_t *)&v27);
  ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v27);
  __int128 v27 = 0uLL;
  uint64_t v25 = 0LL;
  ref::tagged_ptr<CurrentReader,unsigned long long>::make_value<std::shared_ptr<char>,unsigned long long>( (uint64_t *)v6,  (uint64_t *)&v27,  &v25);
  std::string::size_type v17 = (std::__shared_weak_count *)*((void *)&v27 + 1);
  if (*((void *)&v27 + 1))
  {
    uint64_t v18 = (unint64_t *)(*((void *)&v27 + 1) + 8LL);
    do
      unint64_t v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

  if ((*v4)[1] != **v4)
  {
    unint64_t v20 = 0LL;
    do
    {
      *(void *)&__int128 v27 = 0LL;
      unint64_t v21 = atomic_load(v6);
      atomic_store(v21, (unint64_t *)&v27);
      uint64_t v22 = **v4;
      do
        unint64_t v23 = __ldaxr((unint64_t *)&v27);
      while (__stlxr(0LL, (unint64_t *)&v27));
      atomic_store(v23, (unint64_t *)(v22 + 8 * v20++));
    }

    while (v20 < ((*v4)[1] - **v4) >> 3);
  }

  return a1;
}

void sub_18815FFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

unint64_t *ref::Allocator<CurrentReader,unsigned long long>::allocate@<X0>( uint64_t a1@<X0>, ref::details **a2@<X1>, int a3@<W2>, unint64_t *a4@<X8>)
{
  unint64_t v16 = 0LL;
  std::string::size_type v17 = a2;
  ref::Allocator<CurrentReader,unsigned long long>::add_tag(a1, a2, a3, &v14);
  if (v14 && !*(_BYTE *)(v14 + 312) || v14 && *(_BYTE *)(v14 + 312))
  {
    *a4 = 0LL;
    do
      unint64_t v7 = __ldaxr(&v14);
    while (__stlxr(0LL, &v14));
LABEL_21:
    atomic_store(v7, a4);
    return ref::tagged_ptr<CurrentReader,unsigned long long>::reset(&v14);
  }

  if (*(_BYTE *)(a1 + 704) && v15 != (void *)(a1 + 728))
  {
    do
    {
      ref::Allocator<CurrentReader,unsigned long long>::allocate_from_empty_pool(a1, (uint64_t)a2, &v12);
      unint64_t v16 = v12;
      ref::tagged_ptr<CurrentReader,unsigned long long>::operator=(&v14, &v13);
      ref::tagged_ptr<CurrentReader,unsigned long long>::reset(&v13);
      if (v14)
      {
        if (!*(_BYTE *)(v14 + 312)) {
          break;
        }
      }

      min = (unint64_t *)ref::Allocator<CurrentReader,unsigned long long>::extract_min((void *)a1);
      if (min)
      {
        unint64_t v16 = min;
        ref::Allocator<CurrentReader,unsigned long long>::insert_elem(a1, min, (uint64_t)a2, (unint64_t *)&v12);
        ref::tagged_ptr<CurrentReader,unsigned long long>::operator=(&v14, (unint64_t *)&v12);
        ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v12);
        break;
      }
    }

    while (*(_BYTE *)(a1 + 704));
    std::mutex::lock((std::mutex *)(a1 + 744));
    unsigned int v9 = std::__tree<std::__value_type<unsigned long long,ref::details::tagged_allocated_type<di_asif::details::map_element,unsigned long long> *>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,ref::details::tagged_allocated_type<di_asif::details::map_element,unsigned long long> *>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,ref::details::tagged_allocated_type<di_asif::details::map_element,unsigned long long> *>>>::__emplace_hint_unique_key_args<unsigned long long,unsigned long long const&,ref::details::tagged_allocated_type<di_asif::details::map_element,unsigned long long> *&>( (uint64_t **)(a1 + 720),  v15,  (unint64_t *)&v17,  (uint64_t *)&v17,  (uint64_t *)&v16);
    if (!v10) {
      v9[5] = (uint64_t)v16;
    }
    std::condition_variable::notify_all((std::condition_variable *)(a1 + 808));
    std::mutex::unlock((std::mutex *)(a1 + 744));
    ref::Allocator<CurrentReader,unsigned long long>::run_failed_dtors_list(a1, 0, 0LL, 0);
    *a4 = 0LL;
    do
      unint64_t v7 = __ldaxr(&v14);
    while (__stlxr(0LL, &v14));
    goto LABEL_21;
  }

  *a4 = 0LL;
  return ref::tagged_ptr<CurrentReader,unsigned long long>::reset(&v14);
}

void sub_1881601B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

unint64_t *ref::tagged_ptr<CurrentReader,unsigned long long>::operator=( unint64_t *a1, unint64_t *a2)
{
  if (a2 != a1)
  {
    do
      unint64_t v3 = __ldaxr(a2);
    while (__stlxr(0LL, a2));
    ref::tagged_ptr<CurrentReader,unsigned long long>::reset(a1);
    atomic_store(v3, a1);
  }

  return a1;
}

uint64_t ref::tagged_ptr<CurrentReader,unsigned long long>::make_value<std::shared_ptr<char>,unsigned long long>( uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  return ref::details::ctrl_blk<CurrentReader,unsigned long long>::make_value<std::shared_ptr<char>,unsigned long long>( *a1,  a2,  a3);
}

void sub_188160264( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (*v10)
  {
    uint64_t v11 = *(void *)(*v10 + 256);
    if (v11)
    {
      a10 = *v10;
      (*(void (**)(uint64_t, uint64_t *, uint64_t *))(*(void *)v11 + 48LL))(v11, &a10, v10);
    }
  }

  __cxa_rethrow();
}

void sub_188160298(_Unwind_Exception *a1)
{
}

unint64_t *readSynchronizer::get_reader_ptr@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  AEAContext v6 = (ref::details **)a2[3];
  unint64_t v7 = *(unint64_t ***)(a1 + 40);
  int v8 = *v7;
  unsigned int v9 = v7[1];
  while (v8 != v9)
  {
    ref::tagged_weak_ptr<CurrentReader,unsigned long long>::lock_if_tag(v8, (uint64_t)v6, (unint64_t *)&v26);
    if (v26 && !*(_BYTE *)(v26 + 312))
    {
      ref::tagged_ptr<CurrentReader,unsigned long long>::tagged_ptr((unint64_t *)&v24, (unint64_t *)&v26);
      uint64_t v25 = -2LL;
      *(void *)a3 = 0LL;
      do
        unint64_t v22 = __ldaxr((unint64_t *)&v24);
      while (__stlxr(0LL, (unint64_t *)&v24));
      atomic_store(v22, (unint64_t *)a3);
      *(_DWORD *)(a3 + 8) = v25;
      ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v24);
      return ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v26);
    }

    ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v26);
    ++v8;
  }

  ref::Allocator<CurrentReader,unsigned long long>::allocate(*(void *)(a1 + 56), v6, 1, (unint64_t *)&v26);
  if (!v26 || (unsigned int v10 = atomic_load((unsigned int *)(v26 + 24)), v10 != 2))
  {
    uint64_t v24 = a2[3];
    ref::tagged_ptr<CurrentReader,unsigned long long>::make_value<std::shared_ptr<char> const&,unsigned long long>( &v26,  a2,  &v24);
    unint64_t v12 = *(unint64_t ***)(a1 + 40);
    unint64_t v13 = *v12;
    unint64_t v14 = v12[1];
    if (*v12 == v14)
    {
      int v15 = 0;
      goto LABEL_37;
    }

    int v15 = 0;
    while (1)
    {
      unint64_t v16 = atomic_load(v13);
      while (!v16 || *(void *)(v16 + 32) == -2LL)
      {
        unint64_t v17 = atomic_load((unint64_t *)&v26);
        unint64_t v18 = __ldaxr(v13);
        if (v18 != v16)
        {
          __clrex();
LABEL_20:
          int v19 = 0;
          goto LABEL_21;
        }

        if (__stlxr(v17, v13)) {
          goto LABEL_20;
        }
        int v19 = 1;
LABEL_21:
        unint64_t v16 = v18;
        if (v19)
        {
          ref::tagged_ptr<CurrentReader,unsigned long long>::tagged_ptr( (unint64_t *)&v24,  (unint64_t *)&v26);
          goto LABEL_24;
        }
      }

      uint64_t v24 = 0LL;
      atomic_store(0LL, (unint64_t *)&v24);
LABEL_24:
      if (v24) {
        int v20 = *(unsigned __int8 *)(v24 + 312) == 0;
      }
      else {
        int v20 = 0;
      }
      if (v26) {
        int v21 = *(unsigned __int8 *)(v26 + 312) == 0;
      }
      else {
        int v21 = 0;
      }
      ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v24);
      if (v20 != v21)
      {
        ++v15;
        if (++v13 != v14) {
          continue;
        }
      }

void sub_188160504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

unint64_t *ref::tagged_weak_ptr<CurrentReader,unsigned long long>::lock_if_tag@<X0>( unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t v4 = atomic_load(result);
  if (v4 && *(void *)(v4 + 32) == a2)
  {
    AEAContext v6 = (unint64_t *)atomic_load(result);
    ref::tagged_ptr<CurrentReader,unsigned long long>::tagged_ptr(&v9, v6, 1);
    if (v9 && !*(_BYTE *)(v9 + 312))
    {
      uint64_t v7 = *(void *)(v9 + 32);
      *a3 = 0LL;
      if (v7 == a2)
      {
        do
          unint64_t v8 = __ldaxr(&v9);
        while (__stlxr(0LL, &v9));
        atomic_store(v8, a3);
      }
    }

    else
    {
      *a3 = 0LL;
    }

    return ref::tagged_ptr<CurrentReader,unsigned long long>::reset(&v9);
  }

  else
  {
    *a3 = 0LL;
  }

  return result;
}

uint64_t ref::tagged_ptr<CurrentReader,unsigned long long>::make_value<std::shared_ptr<char> const&,unsigned long long>( uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  return ref::details::ctrl_blk<CurrentReader,unsigned long long>::make_value<std::shared_ptr<char> const&,unsigned long long>( *a1,  a2,  a3);
}

void sub_188160624( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (*v10)
  {
    uint64_t v11 = *(void *)(*v10 + 256);
    if (v11)
    {
      a10 = *v10;
      (*(void (**)(uint64_t, uint64_t *, uint64_t *))(*(void *)v11 + 48LL))(v11, &a10, v10);
    }
  }

  __cxa_rethrow();
}

void sub_188160658(_Unwind_Exception *a1)
{
}

uint64_t readSynchronizer::try_copy(uint64_t a1, uint64_t *a2, int *a3, void **a4)
{
  if (*(_BYTE *)(*a2 + 192)) {
    uint64_t v4 = *a2 + 40;
  }
  else {
    uint64_t v4 = 0LL;
  }
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)(v4 + 140));
  if ((v5 & 1) != 0)
  {
    uint64_t v7 = *(_BYTE *)(*a2 + 192) ? *a2 + 40 : 0LL;
    size_t v8 = atomic_load((unsigned int *)(v7 + 144));
    *a3 = v8;
    if ((v8 & 0x80000000) == 0)
    {
      unint64_t v9 = *a4;
      if (*(_BYTE *)(*a2 + 192)) {
        uint64_t v10 = *a2 + 40;
      }
      else {
        uint64_t v10 = 0LL;
      }
      uint64_t v11 = *(const void **)v10;
      unint64_t v12 = *(std::__shared_weak_count **)(v10 + 8);
      if (v12)
      {
        p_shared_owners = (unint64_t *)&v12->__shared_owners_;
        do
          unint64_t v14 = __ldxr(p_shared_owners);
        while (__stxr(v14 + 1, p_shared_owners));
        memcpy(v9, v11, *a3);
        do
          unint64_t v15 = __ldaxr(p_shared_owners);
        while (__stlxr(v15 - 1, p_shared_owners));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }

      else
      {
        memcpy(v9, v11, v8);
      }

      uint64_t v16 = *a2;
      if (*a2)
      {
        if (*(_BYTE *)(v16 + 192)) {
          v16 += 40LL;
        }
        else {
          uint64_t v16 = 0LL;
        }
      }

      unint64_t v17 = (unsigned int *)(v16 + 136);
      do
        unsigned int v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
    }
  }

  return v5 & 1;
}

void readSynchronizer::try_notify(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if (*a2)
  {
    if (*(_BYTE *)(v3 + 192)) {
      v3 += 40LL;
    }
    else {
      uint64_t v3 = 0LL;
    }
  }

  uint64_t v4 = (std::mutex *)(v3 + 72);
  std::mutex::lock((std::mutex *)(v3 + 72));
  if (*(_BYTE *)(*a2 + 192)) {
    uint64_t v5 = *a2 + 40;
  }
  else {
    uint64_t v5 = 0LL;
  }
  if (atomic_load((unsigned int *)(v5 + 136)))
  {
    uint64_t v7 = *a2;
    if (*a2)
    {
      if (*(_BYTE *)(v7 + 192)) {
        v7 += 40LL;
      }
      else {
        uint64_t v7 = 0LL;
      }
    }

    std::condition_variable::notify_all((std::condition_variable *)(v7 + 24));
  }

  std::mutex::unlock(v4);
}

uint64_t readSynchronizer::_read(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  if (*a2)
  {
    if (*(_BYTE *)(v6 + 192)) {
      v6 += 40LL;
    }
    else {
      uint64_t v6 = 0LL;
    }
  }

  uint64_t v7 = (std::mutex *)(v6 + 72);
  std::mutex::lock((std::mutex *)(v6 + 72));
  uint64_t v8 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 88LL))(*(void *)(a1 + 24), a3);
  uint64_t v9 = v8;
  if (*(_BYTE *)(*a2 + 192)) {
    uint64_t v10 = *a2 + 40;
  }
  else {
    uint64_t v10 = 0LL;
  }
  atomic_store(v8, (unsigned int *)(v10 + 144));
  if (*(_BYTE *)(*a2 + 192)) {
    uint64_t v11 = *a2 + 40;
  }
  else {
    uint64_t v11 = 0LL;
  }
  atomic_store(1u, (unsigned __int8 *)(v11 + 140));
  std::mutex::unlock(v7);
  return v9;
}

void sub_1881608AC(_Unwind_Exception *a1)
{
}

uint64_t readSynchronizer::read(uint64_t a1, uint64_t *a2)
{
  uint64_t p_shared_owners = (uint64_t)a2;
  reader_ptr = readSynchronizer::get_reader_ptr(a1, a2, (uint64_t)&v29);
  unint64_t v5 = v30;
  if (v30 != -2)
  {
    uint64_t v13 = readSynchronizer::_read(a1, &v29, p_shared_owners);
    unsigned int v31 = v13;
    readSynchronizer::try_notify(v13, &v29);
    if (v5 < (uint64_t)(*(void *)(*(void *)(a1 + 40) + 8LL) - **(void **)(a1 + 40)) >> 3)
    {
      __lk.__m_ = 0LL;
      unint64_t v14 = atomic_load((unint64_t *)(a1 + 72));
      atomic_store(v14, (unint64_t *)&__lk);
      uint64_t v15 = **(void **)(a1 + 40);
      do
        unint64_t v16 = __ldaxr((unint64_t *)&__lk);
      while (__stlxr(0LL, (unint64_t *)&__lk));
      atomic_store(v16, (unint64_t *)(v15 + 8 * v5));
    }

    if (v29)
    {
      uint64_t v17 = *(void *)(v29 + 256);
      if (v17)
      {
        __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)v29;
        (*(void (**)(uint64_t, std::unique_lock<std::mutex> *, uint64_t *))(*(void *)v17 + 48LL))( v17,  &__lk,  &v29);
      }
    }

    goto LABEL_44;
  }

  uint64_t v6 = v29;
  if (v29)
  {
    if (*(_BYTE *)(v29 + 192)) {
      uint64_t v6 = v29 + 40;
    }
    else {
      uint64_t v6 = 0LL;
    }
  }

  uint64_t v7 = (unsigned int *)(v6 + 136);
  do
    unsigned int v8 = __ldaxr(v7);
  while (__stlxr(v8 + 1, v7));
  uint64_t v9 = v29;
  if (v29)
  {
    if (*(_BYTE *)(v29 + 192)) {
      uint64_t v9 = v29 + 40;
    }
    else {
      uint64_t v9 = 0LL;
    }
  }

  __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(v9 + 72);
  __lk.__owns_ = 1;
  std::mutex::lock((std::mutex *)(v9 + 72));
  int v11 = readSynchronizer::try_copy(v10, &v29, (int *)&v31, (void **)p_shared_owners);
  char v12 = v11;
  if (v11)
  {
    uint64_t p_shared_owners = v31;
  }

  else
  {
    uint64_t v18 = v29;
    if (v29)
    {
      if (*(_BYTE *)(v29 + 192)) {
        uint64_t v18 = v29 + 40;
      }
      else {
        uint64_t v18 = 0LL;
      }
    }

    std::condition_variable::wait((std::condition_variable *)(v18 + 24), &__lk);
    if (*(_BYTE *)(v29 + 192)) {
      uint64_t v19 = v29 + 40;
    }
    else {
      uint64_t v19 = 0LL;
    }
    size_t v20 = atomic_load((unsigned int *)(v19 + 144));
    unsigned int v31 = v20;
    if ((int)v20 >= 1)
    {
      int v21 = *(void **)p_shared_owners;
      if (*(_BYTE *)(v29 + 192)) {
        uint64_t v22 = v29 + 40;
      }
      else {
        uint64_t v22 = 0LL;
      }
      unint64_t v23 = *(const void **)v22;
      uint64_t v24 = *(std::__shared_weak_count **)(v22 + 8);
      if (v24)
      {
        uint64_t p_shared_owners = (uint64_t)&v24->__shared_owners_;
        do
          unint64_t v25 = __ldxr((unint64_t *)p_shared_owners);
        while (__stxr(v25 + 1, (unint64_t *)p_shared_owners));
        memcpy(v21, v23, v20);
        do
          unint64_t v26 = __ldaxr((unint64_t *)p_shared_owners);
        while (__stlxr(v26 - 1, (unint64_t *)p_shared_owners));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
      }

      else
      {
        memcpy(v21, v23, v20);
      }
    }
  }

  if (__lk.__owns_) {
    std::mutex::unlock(__lk.__m_);
  }
  if ((v12 & 1) == 0) {
LABEL_44:
  }
    uint64_t p_shared_owners = v31;
  ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v29);
  return p_shared_owners;
}

void sub_188160AF8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::mutex *a10, char a11, int a12, unint64_t a13)
{
  if (a11) {
    std::mutex::unlock(a10);
  }
  ref::tagged_ptr<CurrentReader,unsigned long long>::reset(&a13);
  _Unwind_Resume(a1);
}

double readSynchronizer::construct_context_from_inner@<D0>( void *a1@<X0>, void *a2@<X1>, _OWORD *a3@<X8>)
{
  double result = v5[0];
  *a3 = *(_OWORD *)v5;
  return result;
}

void readSynchronizer::~readSynchronizer(readSynchronizer *this)
{
}

{
  std::__shared_weak_count *v2;
  *(void *)this = off_18A1F16F0;
  ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)this + 9);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 56);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 40);
  *(void *)this = off_18A1E5578;
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
}

void *readSynchronizer::name(uint64_t a1, void *a2)
{
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"readSynchronizer", 16LL);
}

void *std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>::vector( void *a1, unint64_t a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    std::vector<io_rings_sqe_t const*>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }

  return a1;
}

void sub_188160BF4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

unint64_t *ref::tagged_ptr<CurrentReader,unsigned long long>::tagged_ptr( unint64_t *a1, unint64_t *a2)
{
  *a1 = 0LL;
  uint64_t v3 = (unint64_t *)atomic_load(a2);
  if (!v3) {
    goto LABEL_9;
  }
  unint64_t v4 = atomic_load(v3);
  if (!v4) {
    goto LABEL_8;
  }
  while (1)
  {
    unint64_t v5 = __ldaxr(v3);
    if (v5 != v4)
    {
      __clrex();
      goto LABEL_7;
    }

    if (!__stlxr(v4 + 1, v3)) {
      break;
    }
LABEL_7:
    unint64_t v4 = v5;
    if (!v5) {
      goto LABEL_8;
    }
  }

  uint64_t v7 = (unint64_t *)v3[37];
  if (v7)
  {
    do
      unint64_t v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
    v3[38] = v8;
  }

  if (!ref::details::ctrl_blk<CurrentReader,unsigned long long>::wait_for_ready((uint64_t)v3))
  {
    do
      unint64_t v9 = __ldaxr(v3);
    while (__stlxr(v9 - 1, v3));
    if (v9 == 1)
    {
      uint64_t v10 = v3[4];
      v3[4] = -1LL;
      ref::details::ctrl_blk<CurrentReader,unsigned long long>::reset_val((uint64_t)v3, v10, 1u);
    }

BOOL ref::details::ctrl_blk<CurrentReader,unsigned long long>::wait_for_ready(uint64_t a1)
{
  uint64_t v2 = (unsigned int *)(a1 + 24);
  unsigned int v3 = atomic_load((unsigned int *)(a1 + 24));
  if (v3 == 2)
  {
    unint64_t v4 = atomic_load((unint64_t *)a1);
    return v4 > 1;
  }

  else
  {
    uint64_t v6 = (unint64_t *)(a1 + 8);
    do
      unint64_t v7 = __ldaxr(v6);
    while (__stlxr(v7 + 1, v6));
    unsigned int v8 = atomic_load(v2);
    if (v8 != 2 && !*(_BYTE *)(a1 + 312)) {
      std::__atomic_base<ref::details::ctrl_blk<CurrentReader,unsigned long long>::ready_state,false>::wait[abi:ne180100]( a1 + 24,  1u,  5u);
    }
    do
      unint64_t v9 = __ldaxr(v6);
    while (__stlxr(v9 - 1, v6));
    unint64_t v10 = atomic_load((unint64_t *)a1);
    if (v10 < 2)
    {
      return 0LL;
    }

    else
    {
      unsigned int v11 = atomic_load(v2);
      return v11 == 2;
    }
  }

BOOL std::__atomic_base<ref::details::ctrl_blk<CurrentReader,unsigned long long>::ready_state,false>::wait[abi:ne180100]( uint64_t a1, unsigned int a2, unsigned int a3)
{
  *(void *)&__int128 v4 = a1;
  *((void *)&v4 + 1) = __PAIR64__(a3, a2);
  uint64_t v5 = a1;
  __int128 v6 = v4;
  return std::__libcpp_thread_poll_with_backoff[abi:ne180100]<std::__cxx_atomic_wait_test_fn_impl<std::__cxx_atomic_impl<ref::details::ctrl_blk<di_asif::details::map_element,unsigned long long>::ready_state,std::__cxx_atomic_base_impl<ref::details::ctrl_blk<di_asif::details::map_element,unsigned long long>::ready_state>>,ref::details::ctrl_blk<di_asif::details::map_element,unsigned long long>::ready_state> &,std::__libcpp_atomic_wait_backoff_impl<std::__cxx_atomic_impl<ref::details::ctrl_blk<di_asif::details::map_element,unsigned long long>::ready_state,std::__cxx_atomic_base_impl<ref::details::ctrl_blk<di_asif::details::map_element,unsigned long long>::ready_state>>,std::__cxx_atomic_wait_test_fn_impl<std::__cxx_atomic_impl<ref::details::ctrl_blk<di_asif::details::map_element,unsigned long long>::ready_state,std::__cxx_atomic_base_impl<ref::details::ctrl_blk<di_asif::details::map_element,unsigned long long>::ready_state>>,ref::details::ctrl_blk<di_asif::details::map_element,unsigned long long>::ready_state>> &>( (uint64_t)&v4,  (uint64_t)&v5,  0LL);
}

uint64_t ref::details::ctrl_blk<CurrentReader,unsigned long long>::reset_val( uint64_t a1, uint64_t a2, unsigned int a3)
{
  char v3 = a3;
  if (*(_BYTE *)(a1 + 312)
    || (unsigned int v6 = atomic_load((unsigned int *)(a1 + 24)), v6 != 2)
    || !*(_BYTE *)(a1 + 192)
    || (uint64_t v7 = *(void *)(a1 + 288)) == 0)
  {
    int v8 = (a3 >> 1) & 2;
    goto LABEL_11;
  }

  int v8 = (a3 >> 1) & 2;
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(void *)v7 + 48LL))(v7, a1 + 40))
  {
LABEL_11:
    atomic_store(0, (unsigned int *)(a1 + 24));
    std::__optional_destruct_base<CurrentReader,false>::reset[abi:ne180100](a1 + 40);
    std::function<void ()(ref::details::ctrl_blk<di_asif::details::table,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::operator()( a1 + 200,  a1,  a2,  v8);
    MEMORY[0x1895BC200](a1 + 24);
    return 1LL;
  }

  if ((v3 & 2) != 0)
  {
    *(void *)&__int128 v10 = "ref::details::ctrl_blk<CurrentReader, unsigned long long>::reset_val(tag_t, details::reset_val_option_set) [T = CurrentReader, tag_t = unsigned long long]";
    *((void *)&v10 + 1) = 68LL;
    int v11 = 16;
    di_log::logger<di_log::log_printer<210ul>>::logger(v12, &v10);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( &v13,  (uint64_t)"Got error when trying to close ",  31LL);
    std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v13, (uint64_t)" with ret ", 10LL);
    std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v13, (uint64_t)", Force closing.", 16LL);
    std::ostream::~ostream();
    di_log::logger_buf<di_log::log_printer<210ul>>::~logger_buf((uint64_t)v12);
    MEMORY[0x1895BC2CC](&v14);
    goto LABEL_11;
  }

  if ((v3 & 1) != 0) {
    std::function<void ()(ref::details::ctrl_blk<di_asif::details::table,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::operator()( a1 + 200,  a1,  a2,  v8 | 1);
  }
  return 0LL;
}

void sub_188160F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

uint64_t std::__optional_destruct_base<CurrentReader,false>::reset[abi:ne180100](uint64_t result)
{
  if (*(_BYTE *)(result + 152))
  {
    uint64_t v1 = result;
    std::mutex::~mutex((std::mutex *)(result + 72));
    std::condition_variable::~condition_variable((std::condition_variable *)(v1 + 24));
    double result = std::shared_ptr<char>::~shared_ptr[abi:ne180100](v1);
    *(_BYTE *)(v1 + 152) = 0;
  }

  return result;
}

unint64_t *ref::tagged_ptr<CurrentReader,unsigned long long>::reset(unint64_t *a1)
{
  do
    double result = (unint64_t *)__ldaxr(a1);
  while (__stlxr(0LL, a1));
  if (result)
  {
    do
    {
      unint64_t v3 = __ldaxr(result);
      unint64_t v4 = v3 - 1;
    }

    while (__stlxr(v4, result));
    if (!v4)
    {
      uint64_t v5 = result[4];
      result[4] = -1LL;
      return (unint64_t *)ref::details::ctrl_blk<CurrentReader,unsigned long long>::reset_val( (uint64_t)result,  v5,  1u);
    }
  }

  return result;
}

void *std::allocate_shared[abi:ne180100]<ref::Allocator<CurrentReader,unsigned long long>,std::allocator<ref::Allocator<CurrentReader,unsigned long long>>,unsigned int,int,void>@<X0>( unsigned int *a1@<X1>, int *a2@<X2>, void *a3@<X8>)
{
  unsigned int v6 = operator new(0x580uLL);
  double result = std::__shared_ptr_emplace<ref::Allocator<CurrentReader,unsigned long long>>::__shared_ptr_emplace[abi:ne180100]<unsigned int,int,std::allocator<ref::Allocator<CurrentReader,unsigned long long>>,0>( v6,  a1,  a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_1881610B4(_Unwind_Exception *a1)
{
}

void *std::__shared_ptr_emplace<ref::Allocator<CurrentReader,unsigned long long>>::__shared_ptr_emplace[abi:ne180100]<unsigned int,int,std::allocator<ref::Allocator<CurrentReader,unsigned long long>>,0>( void *a1, unsigned int *a2, int *a3)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_18A1F17D0;
  std::construct_at[abi:ne180100]<ref::Allocator<CurrentReader,unsigned long long>,unsigned int,int,ref::Allocator<CurrentReader,unsigned long long>*>( (uint64_t)(a1 + 3),  a2,  a3);
  return a1;
}

void sub_1881610FC(_Unwind_Exception *a1)
{
}

void std::__shared_ptr_emplace<ref::Allocator<CurrentReader,unsigned long long>>::~__shared_ptr_emplace( std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_18A1F17D0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ref::Allocator<CurrentReader,unsigned long long>>::~__shared_ptr_emplace( std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_18A1F17D0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void *std::__shared_ptr_emplace<ref::Allocator<CurrentReader,unsigned long long>>::__on_zero_shared( uint64_t a1)
{
  return ref::Allocator<CurrentReader,unsigned long long>::~Allocator(a1 + 24);
}

uint64_t std::construct_at[abi:ne180100]<ref::Allocator<CurrentReader,unsigned long long>,unsigned int,int,ref::Allocator<CurrentReader,unsigned long long>*>( uint64_t a1, unsigned int *a2, int *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  __int128 v10 = 0LL;
  ref::Allocator<CurrentReader,unsigned long long>::Allocator(a1, v4, v5, (uint64_t)v9);
  unsigned int v6 = v10;
  if (v10 == v9)
  {
    uint64_t v7 = 4LL;
    unsigned int v6 = v9;
    goto LABEL_5;
  }

  if (v10)
  {
    uint64_t v7 = 5LL;
LABEL_5:
    (*(void (**)(void))(*v6 + 8 * v7))();
  }

  return a1;
}

void sub_1881611E4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  uint64_t v15 = a13;
  if (a13 == v13)
  {
    uint64_t v16 = 4LL;
    uint64_t v15 = &a10;
  }

  else
  {
    if (!a13) {
      goto LABEL_6;
    }
    uint64_t v16 = 5LL;
  }

  (*(void (**)(void))(*(void *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t ref::Allocator<CurrentReader,unsigned long long>::Allocator( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::error_ctrl_blk_t(a1);
  *(void *)(v8 + 424) = a2;
  *(void *)(v8 + 432) = a3;
  unint64_t v9 = (void *)(v8 + 440);
  *(_OWORD *)(v8 + 440) = 0u;
  *(_OWORD *)(v8 + 456) = 0u;
  *(_OWORD *)(v8 + 472) = 0u;
  *(void *)(v8 + 488) = 850045863LL;
  *(_OWORD *)(v8 + 496) = 0u;
  *(_OWORD *)(v8 + 512) = 0u;
  *(_OWORD *)(v8 + 528) = 0u;
  *(void *)(v8 + 544) = 0LL;
  *(_OWORD *)(v8 + 560) = 0u;
  *(_OWORD *)(v8 + 576) = 0u;
  *(void *)(v8 + 592) = 850045863LL;
  *(_OWORD *)(v8 + 600) = 0u;
  *(_OWORD *)(v8 + 616) = 0u;
  *(_OWORD *)(v8 + 632) = 0u;
  *(void *)(v8 + 648) = 0LL;
  *(void *)(v8 + 656) = 1018212795LL;
  *(void *)(v8 + 696) = 0LL;
  *(_OWORD *)(v8 + 680) = 0u;
  *(_BYTE *)(v8 + 704) = 1;
  *(_OWORD *)(v8 + 664) = 0u;
  uint64_t v16 = (dispatch_object_t *)(v8 + 712);
  gcd::gcd_queue::gcd_queue(v8 + 712, "dealloc_queue", 2LL);
  *(void *)(a1 + 736) = 0LL;
  *(void *)(a1 + 728) = 0LL;
  *(void *)(a1 + 720) = a1 + 728;
  *(void *)(a1 + 744) = 850045863LL;
  *(_OWORD *)(a1 + 752) = 0u;
  *(_OWORD *)(a1 + 768) = 0u;
  *(_OWORD *)(a1 + 784) = 0u;
  *(void *)(a1 + 800) = 0LL;
  *(void *)(a1 + 808) = 1018212795LL;
  *(_OWORD *)(a1 + 816) = 0u;
  *(_OWORD *)(a1 + 832) = 0u;
  *(void *)(a1 + 848) = 0LL;
  *(void *)(a1 + 856) = 850045863LL;
  *(_OWORD *)(a1 + 864) = 0u;
  *(_OWORD *)(a1 + 880) = 0u;
  *(_OWORD *)(a1 + 896) = 0u;
  *(void *)(a1 + 912) = 0LL;
  *(void *)(a1 + 920) = a1 + 920;
  *(void *)(a1 + 928) = a1 + 920;
  *(void *)(a1 + 936) = 0LL;
  std::__function::__value_func<diskimage_uio::expected_ns::std::experimental::fundamentals_v3::expected<std::unique_ptr<DiskImage::Context>,std::error_code> ()(void)>::__value_func[abi:ne180100]( a1 + 944,  a4);
  ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(a1 + 976, a1);
  *(void *)(a1 + 1320) = off_18A1F1AD0;
  *(void *)(a1 + 1328) = a1;
  *(void *)(a1 + 1344) = a1 + 1320;
  *(void *)(a1 + 1352) = off_18A1F1B60;
  *(void *)(a1 + 1360) = a1;
  *(void *)(a1 + 1376) = a1 + 1352;
  if (a2 >> 61) {
    size_t v10 = -1LL;
  }
  else {
    size_t v10 = 8 * a2;
  }
  uint64_t v11 = operator new[](v10);
  char v12 = v11;
  if (a2) {
    bzero(v11, 8 * a2);
  }
  *(void *)(a1 + 552) = v12;
  gcd::gcd_queue::set_target_priority(v16, 3);
  if (a2)
  {
    uint64_t v13 = 0LL;
    do
    {
      uint64_t v14 = operator new(0x158uLL);
      ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type((uint64_t)v14, a1);
      uint64_t v17 = v14;
      std::deque<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *>>::emplace_back<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *>( v9,  &v17);
      atomic_store(0LL, (unint64_t *)(*(void *)(a1 + 552) + 8 * v13++));
    }

    while (a2 != v13);
  }

  return a1;
}

void sub_18816141C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **a10, std::condition_variable *a11, void *a12, dispatch_object_s **a13)
{
  uint64_t v18 = *(void **)(v13 + 968);
  if (v18 == a12)
  {
    uint64_t v19 = 4LL;
    uint64_t v18 = a12;
  }

  else
  {
    if (!v18) {
      goto LABEL_6;
    }
    uint64_t v19 = 5LL;
  }

  (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_6:
  std::__list_imp<std::pair<ref::details::tagged_allocated_type<di_asif::details::table,unsigned long long> *,unsigned long long>>::clear(v16);
  std::mutex::~mutex((std::mutex *)(v13 + 856));
  std::condition_variable::~condition_variable((std::condition_variable *)(v13 + 808));
  std::mutex::~mutex((std::mutex *)(v13 + 744));
  std::__tree<std::__value_type<boost::icl::discrete_interval<unsigned long long,std::less>,udif::details::run_info>,std::__map_value_compare<boost::icl::discrete_interval<unsigned long long,std::less>,std::__value_type<boost::icl::discrete_interval<unsigned long long,std::less>,udif::details::run_info>,boost::icl::exclusive_less_than<boost::icl::discrete_interval<unsigned long long,std::less>>,true>,std::allocator<std::__value_type<boost::icl::discrete_interval<unsigned long long,std::less>,udif::details::run_info>>>::destroy( v13 + 720,  *a10);
  gcd::gcd_group::~gcd_group(a13);
  std::condition_variable::~condition_variable(a11);
  std::mutex::~mutex(v15);
  std::mutex::~mutex((std::mutex *)(v13 + 488));
  std::deque<std::atomic<DiskImage::Context *>>::~deque[abi:ne180100](v14);
  ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::~error_ctrl_blk_t((void *)v13);
  _Unwind_Resume(a1);
}

uint64_t std::deque<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *>>::emplace_back<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *>( void *a1, void *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  if (v4 == v5) {
    uint64_t v6 = 0LL;
  }
  else {
    uint64_t v6 = ((v4 - v5) << 6) - 1;
  }
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  unint64_t v9 = v8 + v7;
  if (v6 == v8 + v7)
  {
    std::deque<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *>>::__add_back_capacity(a1);
    uint64_t v7 = a1[4];
    uint64_t v8 = a1[5];
    uint64_t v5 = a1[1];
    unint64_t v9 = v7 + v8;
  }

  *(void *)(*(void *)(v5 + ((v9 >> 6) & 0x3FFFFFFFFFFFFF8LL)) + 8 * (v9 & 0x1FF)) = *a2;
  a1[5] = v8 + 1;
  unint64_t v10 = v7 + v8 + 1;
  uint64_t v11 = a1[1];
  char v12 = (void *)(v11 + 8 * (v10 >> 9));
  uint64_t v13 = *v12 + 8 * (v10 & 0x1FF);
  if (a1[2] == v11) {
    uint64_t v13 = 0LL;
  }
  if (v13 == *v12) {
    uint64_t v13 = *(v12 - 1) + 4096LL;
  }
  return v13 - 8;
}

uint64_t ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::~tagged_allocated_type( uint64_t a1)
{
  return a1;
}

uint64_t ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::error_ctrl_blk_t(uint64_t a1)
{
  *(void *)(a1 + 32) = off_18A1F18B0;
  *(void *)(a1 + 56) = a1 + 32;
  *(void *)a1 = off_18A1F1820;
  *(void *)(a1 + 64) = off_18A1F1940;
  *(void *)(a1 + 24) = a1;
  *(void *)(a1 + 88) = a1 + 64;
  *(void *)(a1 + 96) = 0LL;
  uint64_t v2 = ref::details::ctrl_blk<CurrentReader,unsigned long long>::ctrl_blk(a1 + 104, a1, a1 + 32, a1 + 64, a1 + 96);
  ref::details::ctrl_blk<CurrentReader,unsigned long long>::init(v2, -1LL);
  atomic_store(0, (unsigned int *)(a1 + 128));
  *(_BYTE *)(a1 + 416) = 1;
  return a1;
}

void sub_1881616EC(_Unwind_Exception *a1)
{
  uint64_t v7 = *(void **)(v1 + 88);
  if (v7 == v5)
  {
    uint64_t v8 = 4LL;
  }

  else
  {
    if (!v7) {
      goto LABEL_6;
    }
    uint64_t v8 = 5LL;
    uint64_t v5 = *(void **)(v1 + 88);
  }

  (*(void (**)(void *))(*v5 + 8 * v8))(v5);
LABEL_6:
  ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::error_ctrl_blk_t(v4, v3, v2, v1);
  _Unwind_Resume(a1);
}

uint64_t ref::details::ctrl_blk<CurrentReader,unsigned long long>::init(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = a2;
  *(_BYTE *)(a1 + 312) = 0;
  atomic_store(1uLL, (unint64_t *)a1);
  atomic_store(0LL, (unint64_t *)(a1 + 8));
  atomic_store(0LL, (unint64_t *)(a1 + 16));
  uint64_t result = std::__optional_destruct_base<CurrentReader,false>::reset[abi:ne180100](a1 + 40);
  uint64_t v4 = *(unint64_t **)(a1 + 296);
  if (v4)
  {
    do
      unint64_t v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
    *(void *)(a1 + 304) = v5;
  }

  atomic_store(1u, (unsigned int *)(a1 + 24));
  __dmb(0xBu);
  return result;
}

void *std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = off_18A1F1820;
  return result;
}

void std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::__clone( uint64_t a1, void *a2)
{
  *a2 = off_18A1F1820;
}

uint64_t std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::target( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

void *std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::target_type()
{
}

void *std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = off_18A1F18B0;
  return result;
}

void std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::__clone( uint64_t a1, void *a2)
{
  *a2 = off_18A1F18B0;
}

uint64_t std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::target( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

void *std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::target_type()
{
}

void *std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1}>,int ()(CurrentReader&)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = off_18A1F1940;
  return result;
}

void std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1}>,int ()(CurrentReader&)>::__clone( uint64_t a1, void *a2)
{
  *a2 = off_18A1F1940;
}

uint64_t std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1}>,int ()(CurrentReader&)>::operator()()
{
  return 0LL;
}

uint64_t std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1}>,int ()(CurrentReader&)>::target( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

void *std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1}>,int ()(CurrentReader&)>::target_type()
{
}

uint64_t ref::details::ctrl_blk<CurrentReader,unsigned long long>::ctrl_blk( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 32) = -1LL;
  *(_BYTE *)(a1 + 40) = 0;
  *(_BYTE *)(a1 + 192) = 0;
  std::__function::__value_func<diskimage_uio::expected_ns::std::experimental::fundamentals_v3::expected<std::unique_ptr<DiskImage::Context>,std::error_code> ()(void)>::__value_func[abi:ne180100]( a1 + 200,  a2);
  std::__function::__value_func<diskimage_uio::expected_ns::std::experimental::fundamentals_v3::expected<std::unique_ptr<DiskImage::Context>,std::error_code> ()(void)>::__value_func[abi:ne180100]( a1 + 232,  a3);
  std::__function::__value_func<diskimage_uio::expected_ns::std::experimental::fundamentals_v3::expected<std::unique_ptr<DiskImage::Context>,std::error_code> ()(void)>::__value_func[abi:ne180100]( a1 + 264,  a4);
  *(void *)(a1 + 296) = a5;
  *(void *)(a1 + 304) = 0LL;
  *(_BYTE *)(a1 + 312) = 0;
  return a1;
}

void sub_1881619F0(_Unwind_Exception *a1)
{
  uint64_t v6 = *(void **)(v2 + 256);
  if (v6 == v4)
  {
    uint64_t v7 = 4LL;
  }

  else
  {
    if (!v6) {
      goto LABEL_6;
    }
    uint64_t v7 = 5LL;
    uint64_t v4 = *(void **)(v2 + 256);
  }

  (*(void (**)(void *))(*v4 + 8 * v7))(v4);
LABEL_6:
  uint64_t v8 = *(void **)(v2 + 224);
  if (v8 == v3)
  {
    uint64_t v9 = 4LL;
    uint64_t v8 = v3;
  }

  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    uint64_t v9 = 5LL;
  }

  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_11:
  std::__optional_destruct_base<CurrentReader,false>::~__optional_destruct_base[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t std::__optional_destruct_base<CurrentReader,false>::~__optional_destruct_base[abi:ne180100]( uint64_t a1)
{
  if (*(_BYTE *)(a1 + 152))
  {
    std::mutex::~mutex((std::mutex *)(a1 + 72));
    std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 24));
    std::shared_ptr<char>::~shared_ptr[abi:ne180100](a1);
  }

  return a1;
}

void *ref::details::ctrl_blk<CurrentReader,unsigned long long>::~ctrl_blk(void *a1)
{
  uint64_t v2 = a1 + 33;
  unint64_t v3 = (void *)a1[36];
  if (v3 == v2)
  {
    uint64_t v4 = 4LL;
    unint64_t v3 = v2;
  }

  else
  {
    if (!v3) {
      goto LABEL_6;
    }
    uint64_t v4 = 5LL;
  }

  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  unint64_t v5 = (void *)a1[32];
  if (v5 == a1 + 29)
  {
    uint64_t v6 = 4LL;
    unint64_t v5 = a1 + 29;
  }

  else
  {
    if (!v5) {
      goto LABEL_11;
    }
    uint64_t v6 = 5LL;
  }

  (*(void (**)(void))(*v5 + 8 * v6))();
LABEL_11:
  uint64_t v7 = (void *)a1[28];
  if (v7 == a1 + 25)
  {
    uint64_t v8 = 4LL;
    uint64_t v7 = a1 + 25;
    goto LABEL_15;
  }

  if (v7)
  {
    uint64_t v8 = 5LL;
LABEL_15:
    (*(void (**)(void))(*v7 + 8 * v8))();
  }

  std::__optional_destruct_base<CurrentReader,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)(a1 + 5));
  return a1;
}

uint64_t ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type( uint64_t a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  *(void *)a1 = a2;
  v10[0] = off_18A1F19D0;
  v10[1] = a1;
  uint64_t v11 = v10;
  v8[0] = off_18A1F1A50;
  v8[1] = a1;
  uint64_t v9 = v8;
  ref::details::ctrl_blk<CurrentReader,unsigned long long>::ctrl_blk( a1 + 8,  (uint64_t)v10,  (uint64_t)v8,  a2 + 944,  a2 + 568);
  unint64_t v3 = v9;
  if (v9 == v8)
  {
    uint64_t v4 = 4LL;
    unint64_t v3 = v8;
  }

  else
  {
    if (!v9) {
      goto LABEL_6;
    }
    uint64_t v4 = 5LL;
  }

  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  unint64_t v5 = v11;
  if (v11 == v10)
  {
    uint64_t v6 = 4LL;
    unint64_t v5 = v10;
    goto LABEL_10;
  }

  if (v11)
  {
    uint64_t v6 = 5LL;
LABEL_10:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }

  *(void *)(a1 + 328) = 0LL;
  *(_DWORD *)(a1 + 336) = 0;
  return a1;
}

void sub_188161C60( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  uint64_t v19 = a13;
  if (a13 == v17)
  {
    uint64_t v20 = 4LL;
    uint64_t v19 = &a10;
  }

  else
  {
    if (!a13) {
      goto LABEL_6;
    }
    uint64_t v20 = 5LL;
  }

  (*(void (**)(void))(*(void *)v19 + 8 * v20))();
LABEL_6:
  int v21 = a17;
  if (a17 == &a14)
  {
    uint64_t v22 = 4LL;
    int v21 = &a14;
  }

  else
  {
    if (!a17) {
      goto LABEL_11;
    }
    uint64_t v22 = 5LL;
  }

  (*(void (**)(void))(*(void *)v21 + 8 * v22))();
LABEL_11:
  _Unwind_Resume(exception_object);
}

void *std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::__clone( uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = off_18A1F19D0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::__clone( uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_18A1F19D0;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::operator()( uint64_t a1, uint64_t a2, uint64_t *a3, int *a4)
{
  return std::function<void ()(ref::details::ctrl_blk<di_asif::details::table,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::operator()( **(void **)(a1 + 8) + 1320LL,  *(void *)(a1 + 8),  *a3,  *a4);
}

uint64_t std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::target( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

void *std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::target_type()
{
}

void *std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::__clone( uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = off_18A1F1A50;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::__clone( uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_18A1F1A50;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::operator()( uint64_t a1)
{
  return std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1} &,ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &>((uint64_t **)(a1 + 8));
}

uint64_t std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::target( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

void *std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::target_type()
{
}

uint64_t std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1} &,ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &>( uint64_t **a1)
{
  uint64_t v1 = **a1;
  uint64_t v4 = *a1;
  uint64_t v2 = *(void *)(v1 + 1376);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t **))(*(void *)v2 + 48LL))(v2, &v4);
}

void *std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::__clone( uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = off_18A1F1AD0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::__clone( uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_18A1F1AD0;
  a2[1] = v2;
  return result;
}

void std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::operator()( uint64_t a1, unint64_t *a2, unint64_t *a3, _DWORD *a4)
{
}

uint64_t std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::target( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

void *std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::target_type()
{
}

void ref::Allocator<CurrentReader,unsigned long long>::deleter( uint64_t a1, unint64_t a2, unint64_t a3, char a4)
{
  if ((*(_DWORD *)(a2 + 336) & 1) == 0)
  {
    uint64_t v7 = (unsigned int *)(a2 + 336);
    if ((a4 & 3) == 1LL)
    {
      uint64_t v8 = (std::mutex *)(a1 + 856);
      std::mutex::lock((std::mutex *)(a1 + 856));
      uint64_t v9 = operator new(0x20uLL);
      v9[2] = a2;
      v9[3] = a3;
      uint64_t v11 = *(void *)(a1 + 920);
      void *v9 = v11;
      v9[1] = a1 + 920;
      *(void *)(v11 + 8) = v9;
      *(void *)(a1 + 920) = v9;
      ++*(void *)(a1 + 936);
      do
        unsigned int v12 = __ldaxr(v7);
      while (__stlxr(v12 | 4, v7));
      tagged_ptr_lock = (std::mutex *)ref::details::_get_tagged_ptr_lock(a2, v10);
      std::mutex::lock(tagged_ptr_lock);
      tagged_ptr_cond = (std::condition_variable *)ref::details::_get_tagged_ptr_cond(a2, v14);
      std::condition_variable::notify_all(tagged_ptr_cond);
      std::mutex::unlock(tagged_ptr_lock);
LABEL_20:
      std::mutex::unlock(v8);
      return;
    }

    ref::Allocator<CurrentReader,unsigned long long>::delete_tag(a1, a3);
    ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)(a2 + 328));
    do
      unsigned int v17 = __ldaxr(v7);
    while (__stlxr(v17 | 1, v7));
    if ((v17 & 2) == 0) {
      ref::Allocator<CurrentReader,unsigned long long>::add_to_free_pool(a1, a2);
    }
    uint64_t v18 = (unint64_t *)(a1 + 576);
    do
    {
      unint64_t v19 = __ldaxr(v18);
      unint64_t v20 = v19 - 1;
    }

    while (__stlxr(v20, v18));
    if (!v20)
    {
      if (atomic_load((unint64_t *)(a1 + 584)))
      {
        std::mutex::lock((std::mutex *)(a1 + 592));
        std::mutex::unlock((std::mutex *)(a1 + 592));
      }
    }

    unint64_t v23 = (unint64_t *)(a1 + 560);
    if (atomic_load(v23))
    {
      uint64_t v8 = (std::mutex *)ref::details::_get_tagged_ptr_lock(a2, v16);
      std::mutex::lock(v8);
      if (atomic_load(v23))
      {
        __int128 v27 = (std::condition_variable *)ref::details::_get_tagged_ptr_cond(a2, v25);
        std::condition_variable::notify_all(v27);
      }

      goto LABEL_20;
    }
  }

void sub_18816209C(_Unwind_Exception *a1)
{
}

void ref::Allocator<CurrentReader,unsigned long long>::delete_tag(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = a2;
  uint64_t v3 = (std::mutex *)(a1 + 744);
  std::mutex::lock((std::mutex *)(a1 + 744));
  std::__tree<std::__value_type<unsigned long long,ref::details::tagged_allocated_type<di_asif::details::table,unsigned long long> *>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,ref::details::tagged_allocated_type<di_asif::details::table,unsigned long long> *>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,ref::details::tagged_allocated_type<di_asif::details::table,unsigned long long> *>>>::__erase_unique<unsigned long long>( a1 + 720,  &v4);
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 808));
  std::mutex::unlock(v3);
}

void sub_188162118(_Unwind_Exception *a1)
{
}

void ref::Allocator<CurrentReader,unsigned long long>::add_to_free_pool(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v3 = (std::mutex *)(a1 + 488);
  std::mutex::lock((std::mutex *)(a1 + 488));
  std::deque<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *>>::push_back( (void *)(a1 + 440),  &v4);
  std::mutex::unlock(v3);
}

void sub_188162174(_Unwind_Exception *a1)
{
}

void std::deque<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *>>::push_back( void *a1, void *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  if (v4 == v5) {
    uint64_t v6 = 0LL;
  }
  else {
    uint64_t v6 = ((v4 - v5) << 6) - 1;
  }
  uint64_t v7 = a1[5];
  unint64_t v8 = v7 + a1[4];
  if (v6 == v8)
  {
    std::deque<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *>>::__add_back_capacity(a1);
    uint64_t v5 = a1[1];
    uint64_t v7 = a1[5];
    unint64_t v8 = a1[4] + v7;
  }

  *(void *)(*(void *)(v5 + ((v8 >> 6) & 0x3FFFFFFFFFFFFF8LL)) + 8 * (v8 & 0x1FF)) = *a2;
  a1[5] = v7 + 1;
}

void std::deque<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *>>::__add_back_capacity( void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x200;
  unint64_t v4 = v2 - 512;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)unint64_t v8 = v10;
      a1[2] += 8LL;
      return;
    }

    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      v34 = (char *)std::allocator<std::unique_ptr<diskimage_uio::stack_image_node const>>::allocate_at_least[abi:ne180100]( v5,  v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      unint64_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        unint64_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)v41 = v42;
          v41 += 8;
          v40 -= 8LL;
        }

        while (v40);
      }

      goto LABEL_30;
    }

void sub_1881624D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void *std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::__clone( uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = off_18A1F1B60;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::__clone( uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_18A1F1B60;
  a2[1] = v2;
  return result;
}

void std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::operator()( uint64_t a1, unint64_t *a2, unint64_t *a3)
{
}

uint64_t std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::target( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }

  else
  {
    return 0LL;
  }

void *std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::target_type()
{
}

void ref::Allocator<CurrentReader,unsigned long long>::deallocate( uint64_t a1, unint64_t a2, unint64_t *a3)
{
  uint64_t v3 = *(void *)(a1 + 424);
  if (v3 >= 1)
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = *(void *)(a1 + 552);
    unint64_t v8 = v7 + 8 * v3;
    while (!(v7 + v6) || *(void *)(v7 + v6) != a2)
    {
      v6 += 8LL;
      if (v7 + v6 >= v8) {
        return;
      }
    }

    if ((v6 & 0x8000000000000000LL) == 0)
    {
      uint64_t v9 = (unint64_t *)(v7 + v6);
      while (1)
      {
        unint64_t v10 = __ldaxr(v9);
        if (v10 != a2) {
          break;
        }
        if (!__stlxr(0LL, v9))
        {
          ref::Allocator<CurrentReader,unsigned long long>::drop_elem(a1, a2, 1uLL, a3);
          ref::Allocator<CurrentReader,unsigned long long>::add_to_free_pool(a1, a2);
          return;
        }
      }

      __clrex();
    }
  }

uint64_t ref::Allocator<CurrentReader,unsigned long long>::drop_elem( uint64_t a1, unint64_t a2, unint64_t a3, unint64_t *a4)
{
  uint64_t v8 = a3 & 0x100;
  uint64_t v9 = (a3 >> 8) & 1;
  unint64_t v10 = (unint64_t *)(a1 + 576);
  do
    unint64_t v11 = __ldaxr(v10);
  while (__stlxr(v11 + 1, v10));
  if ((a3 & 1) != 0)
  {
    uint64_t v12 = (unint64_t *)(a1 + 560);
    do
      unint64_t v13 = __ldaxr(v12);
    while (__stlxr(v13 + 1, v12));
  }

  BOOL v14 = (unsigned int *)(a2 + 336);
  do
    unsigned int v15 = __ldaxr(v14);
  while (__stlxr(v15 | 2, v14));
  ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)(a2 + 328));
  if (a4) {
    ref::tagged_ptr<CurrentReader,unsigned long long>::reset(a4);
  }
  if ((a3 & 1) != 0)
  {
    char v16 = atomic_load(v14);
    if ((v16 & 4) == 0)
    {
      uint64_t v17 = (a3 >> 16) & 1;
      do
      {
        if ((*v14 & 1) != 0) {
          break;
        }
        if ((_DWORD)v9)
        {
          std::mutex::lock((std::mutex *)(a1 + 488));
          uint64_t v18 = *(void *)(a1 + 480);
          std::mutex::unlock((std::mutex *)(a1 + 488));
          if (v18) {
            break;
          }
        }

        if (ref::Allocator<CurrentReader,unsigned long long>::run_failed_dtors_list(a1, v17, 0LL, 0) == -1)
        {
          __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)ref::details::_get_tagged_ptr_lock(a2, v19);
          __lk.__owns_ = 1;
          std::mutex::lock(__lk.__m_);
          tagged_ptr_cond = (std::condition_variable *)ref::details::_get_tagged_ptr_cond(a2, v26);
          v28.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
          uint64_t v38 = a1;
          std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v39 = v28.__d_.__rep_ + 200000;
          unint64_t v35 = a2;
          char v36 = v9;
          *(_DWORD *)v37 = *(_DWORD *)v41;
          *(_DWORD *)&v37[3] = *(_DWORD *)&v41[3];
          std::condition_variable::wait_until<std::chrono::system_clock,std::chrono::duration<long long,std::ratio<1l,1000000l>>,ref::Allocator<CurrentReader,unsigned long long>::drop_elem(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::Allocator<CurrentReader,unsigned long long>::drop_elem_options,ref::tagged_ptr<CurrentReader,unsigned long long> *)::{lambda(void)#1}>( tagged_ptr_cond,  &__lk,  &v39,  (uint64_t)&v35);
        }

        else
        {
          __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)ref::details::_get_tagged_ptr_lock(a2, v19);
          __lk.__owns_ = 1;
          std::mutex::lock(__lk.__m_);
          uint64_t v21 = ref::details::_get_tagged_ptr_cond(a2, v20);
          char v22 = atomic_load(v14);
          if ((v22 & 4) == 0)
          {
            uint64_t v23 = (std::condition_variable *)v21;
            do
            {
              if ((*v14 & 1) != 0) {
                break;
              }
              if ((_DWORD)v9)
              {
                std::mutex::lock((std::mutex *)(a1 + 488));
                uint64_t v24 = *(void *)(a1 + 480);
                std::mutex::unlock((std::mutex *)(a1 + 488));
                if (v24) {
                  break;
                }
              }

              std::condition_variable::wait(v23, &__lk);
              char v25 = atomic_load(v14);
            }

            while ((v25 & 4) == 0);
          }
        }

        if (__lk.__owns_) {
          std::mutex::unlock(__lk.__m_);
        }
        unsigned int v29 = *v14;
        if (!v8 || (v29 & 1) != 0)
        {
          if ((v29 & 1) != 0) {
            break;
          }
        }

        else if (*(void *)(a1 + 480))
        {
          break;
        }

        char v30 = atomic_load(v14);
      }

      while ((v30 & 4) == 0);
    }

    __int128 v31 = (unint64_t *)(a1 + 560);
    do
      unint64_t v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
  }

  do
    unsigned int v33 = __ldaxr(v14);
  while (__stlxr(v33 & 0xFFFFFFFD, v14));
  return v33 & 1;
}

void sub_1881628A4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::mutex *a14, char a15)
{
  if (a15) {
    std::mutex::unlock(a14);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ref::Allocator<CurrentReader,unsigned long long>::run_failed_dtors_list( uint64_t a1, int a2, uint64_t a3, unsigned __int8 a4)
{
  if (!*(void *)(a1 + 936)) {
    return 0LL;
  }
  int64_t v20 = (std::mutex *)(a1 + 856);
  std::mutex::lock((std::mutex *)(a1 + 856));
  if (*(void *)(a1 + 936))
  {
    uint64_t v8 = *(uint64_t **)(a1 + 928);
    if (v8 == (uint64_t *)(a1 + 920))
    {
      uint64_t v11 = 1LL;
    }

    else
    {
      uint64_t v9 = a4;
      if (a2) {
        unsigned int v10 = 6;
      }
      else {
        unsigned int v10 = 4;
      }
      uint64_t v11 = 1LL;
      do
      {
        unint64_t v12 = v8[2];
        if ((ref::details::ctrl_blk<CurrentReader,unsigned long long>::reset_val(v12 + 8, v8[3], v10) | a2) == 1)
        {
          tagged_ptr_lock = (std::mutex *)ref::details::_get_tagged_ptr_lock(v12, v13);
          std::mutex::lock(tagged_ptr_lock);
          unsigned int v15 = (unsigned int *)(v12 + 336);
          do
            unsigned int v16 = __ldaxr(v15);
          while (__stlxr(v16 & 0xFFFFFFFB, v15));
          std::mutex::unlock(tagged_ptr_lock);
          uint64_t v17 = *v8;
          uint64_t v18 = (uint64_t *)v8[1];
          *(void *)(v17 + 8) = v18;
          *(void *)v8[1] = v17;
          --*(void *)(a1 + 936);
          operator delete(v8);
          uint64_t v8 = v18;
        }

        else
        {
          if (!v9 || v8[3] == a3) {
            uint64_t v11 = 0xFFFFFFFFLL;
          }
          uint64_t v8 = (uint64_t *)v8[1];
        }
      }

      while (v8 != (uint64_t *)(a1 + 920));
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  std::mutex::unlock(v20);
  return v11;
}

void sub_188162A18( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::mutex *a10)
{
}

uint64_t std::condition_variable::wait_until<std::chrono::system_clock,std::chrono::duration<long long,std::ratio<1l,1000000l>>,ref::Allocator<CurrentReader,unsigned long long>::drop_elem(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::Allocator<CurrentReader,unsigned long long>::drop_elem_options,ref::tagged_ptr<CurrentReader,unsigned long long> *)::{lambda(void)#1}>( std::condition_variable *a1, std::unique_lock<std::mutex> *a2, uint64_t *a3, uint64_t a4)
{
  do
  {
    uint64_t v8 = *(void *)(a4 + 16);
    char v9 = atomic_load((unsigned int *)(*(void *)a4 + 336LL));
    if ((v9 & 4) != 0) {
      return 1LL;
    }
    if ((*(_DWORD *)(*(void *)a4 + 336LL) & 1) != 0) {
      return 1LL;
    }
    if (*(_BYTE *)(a4 + 8))
    {
      unsigned int v10 = (std::mutex *)(v8 + 488);
      std::mutex::lock((std::mutex *)(v8 + 488));
      uint64_t v11 = *(void *)(v8 + 480);
      std::mutex::unlock(v10);
      if (v11) {
        return 1LL;
      }
    }

    v12.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
    uint64_t v13 = *a3;
    if (*a3 <= v12.__d_.__rep_) {
      break;
    }
    if (!v13)
    {
      v14.__d_.__rep_ = 0LL;
      goto LABEL_14;
    }

    if (v13 < 1)
    {
      if ((unint64_t)v13 < 0xFFDF3B645A1CAC09LL)
      {
        v14.__d_.__rep_ = 0x8000000000000000LL;
        goto LABEL_14;
      }
    }

    else if ((unint64_t)v13 > 0x20C49BA5E353F7LL)
    {
      v14.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_14;
    }

    v14.__d_.__rep_ = 1000 * v13;
LABEL_14:
    std::condition_variable::__do_timed_wait(a1, a2, v14);
  }

  while (std::chrono::system_clock::now().__d_.__rep_ < *a3);
  uint64_t v15 = *(void *)(a4 + 16);
  char v16 = atomic_load((unsigned int *)(*(void *)a4 + 336LL));
  if ((v16 & 4) != 0 || (*(_DWORD *)(*(void *)a4 + 336LL) & 1) != 0) {
    return 1LL;
  }
  if (!*(_BYTE *)(a4 + 8)) {
    return 0LL;
  }
  std::mutex::lock((std::mutex *)(v15 + 488));
  BOOL v17 = *(void *)(v15 + 480) != 0LL;
  std::mutex::unlock((std::mutex *)(v15 + 488));
  return v17;
}

void *ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::~error_ctrl_blk_t(void *a1)
{
  uint64_t v2 = a1 + 13;
  do
  {
    unint64_t v3 = __ldaxr(v2);
    unint64_t v4 = v3 - 1;
  }

  while (__stlxr(v4, v2));
  if (!v4)
  {
    uint64_t v5 = a1[17];
    a1[17] = -1LL;
    ref::details::ctrl_blk<CurrentReader,unsigned long long>::reset_val((uint64_t)(a1 + 13), v5, 1u);
  }

  ref::details::ctrl_blk<CurrentReader,unsigned long long>::~ctrl_blk(v2);
  uint64_t v6 = (void *)a1[11];
  if (v6 == a1 + 8)
  {
    uint64_t v7 = 4LL;
    uint64_t v6 = a1 + 8;
  }

  else
  {
    if (!v6) {
      goto LABEL_10;
    }
    uint64_t v7 = 5LL;
  }

  (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_10:
  uint64_t v8 = (void *)a1[7];
  if (v8 == a1 + 4)
  {
    uint64_t v9 = 4LL;
    uint64_t v8 = a1 + 4;
  }

  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    uint64_t v9 = 5LL;
  }

  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_15:
  unsigned int v10 = (void *)a1[3];
  if (v10 == a1)
  {
    uint64_t v11 = 4LL;
    unsigned int v10 = a1;
    goto LABEL_19;
  }

  if (v10)
  {
    uint64_t v11 = 5LL;
LABEL_19:
    (*(void (**)(void))(*v10 + 8 * v11))();
  }

  return a1;
}

void *ref::Allocator<CurrentReader,unsigned long long>::~Allocator(uint64_t a1)
{
  *(_BYTE *)(a1 + 704) = 0;
  if (*(void *)(a1 + 424))
  {
    unint64_t v3 = 0LL;
    do
    {
      unint64_t v4 = (unint64_t *)(*(void *)(a1 + 552) + 8 * v3);
      do
        uint64_t v5 = (unint64_t *)__ldaxr(v4);
      while (__stlxr(0LL, v4));
      if (v5)
      {
        unint64_t v1 = v1 & 0xFFFFFFFFFF000000LL | 0x10001;
        ref::Allocator<CurrentReader,unsigned long long>::drop_elem(a1, (unint64_t)v5, v1, 0LL);
        ref::tagged_ptr<CurrentReader,unsigned long long>::reset(v5 + 41);
        ref::details::ctrl_blk<CurrentReader,unsigned long long>::~ctrl_blk(v5 + 1);
        operator delete(v5);
      }

      ++v3;
    }

    while (*(void *)(a1 + 424) > v3);
  }

  gcd::gcd_queue::barrier_sync((dispatch_queue_t *)(a1 + 712), &__block_literal_global_9);
  uint64_t v6 = *(void **)(a1 + 552);
  if (v6) {
    operator delete[](v6);
  }
  std::mutex::lock((std::mutex *)(a1 + 488));
  uint64_t v7 = *(void *)(a1 + 448);
  if (*(void *)(a1 + 456) != v7)
  {
    unint64_t v8 = *(void *)(a1 + 472);
    uint64_t v9 = (void *)(v7 + 8 * (v8 >> 9));
    unsigned int v10 = (unint64_t **)(*v9 + 8 * (v8 & 0x1FF));
    uint64_t v11 = *(void *)(v7 + (((*(void *)(a1 + 480) + v8) >> 6) & 0x3FFFFFFFFFFFFF8LL))
        + 8 * ((*(void *)(a1 + 480) + v8) & 0x1FF);
    while (v10 != (unint64_t **)v11)
    {
      std::chrono::system_clock::time_point v12 = *v10;
      if (*v10)
      {
        ref::tagged_ptr<CurrentReader,unsigned long long>::reset(v12 + 41);
        ref::details::ctrl_blk<CurrentReader,unsigned long long>::~ctrl_blk(v12 + 1);
        operator delete(v12);
      }

      if ((unint64_t **)((char *)++v10 - *v9) == (unint64_t **)4096)
      {
        uint64_t v13 = (unint64_t **)v9[1];
        ++v9;
        unsigned int v10 = v13;
      }
    }
  }

  std::mutex::unlock((std::mutex *)(a1 + 488));
  std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v14 = *(void **)(a1 + 1376);
  if (v14 == (void *)(a1 + 1352))
  {
    uint64_t v15 = 4LL;
    std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v14 = (void *)(a1 + 1352);
  }

  else
  {
    if (!v14) {
      goto LABEL_22;
    }
    uint64_t v15 = 5LL;
  }

  (*(void (**)(void))(*v14 + 8 * v15))();
LABEL_22:
  char v16 = *(void **)(a1 + 1344);
  if (v16 == (void *)(a1 + 1320))
  {
    uint64_t v17 = 4LL;
    char v16 = (void *)(a1 + 1320);
  }

  else
  {
    if (!v16) {
      goto LABEL_27;
    }
    uint64_t v17 = 5LL;
  }

  (*(void (**)(void))(*v16 + 8 * v17))();
LABEL_27:
  ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)(a1 + 1304));
  ref::details::ctrl_blk<CurrentReader,unsigned long long>::~ctrl_blk((void *)(a1 + 984));
  uint64_t v18 = *(void **)(a1 + 968);
  if (v18 == (void *)(a1 + 944))
  {
    uint64_t v19 = 4LL;
    uint64_t v18 = (void *)(a1 + 944);
    goto LABEL_31;
  }

  if (v18)
  {
    uint64_t v19 = 5LL;
LABEL_31:
    (*(void (**)(void))(*v18 + 8 * v19))();
  }

  std::__list_imp<std::pair<ref::details::tagged_allocated_type<di_asif::details::table,unsigned long long> *,unsigned long long>>::clear((void *)(a1 + 920));
  std::mutex::~mutex((std::mutex *)(a1 + 856));
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 808));
  std::mutex::~mutex((std::mutex *)(a1 + 744));
  std::__tree<std::__value_type<boost::icl::discrete_interval<unsigned long long,std::less>,udif::details::run_info>,std::__map_value_compare<boost::icl::discrete_interval<unsigned long long,std::less>,std::__value_type<boost::icl::discrete_interval<unsigned long long,std::less>,udif::details::run_info>,boost::icl::exclusive_less_than<boost::icl::discrete_interval<unsigned long long,std::less>>,true>,std::allocator<std::__value_type<boost::icl::discrete_interval<unsigned long long,std::less>,udif::details::run_info>>>::destroy( a1 + 720,  *(void **)(a1 + 728));
  gcd::gcd_group::~gcd_group((dispatch_object_s **)(a1 + 712));
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 656));
  std::mutex::~mutex((std::mutex *)(a1 + 592));
  std::mutex::~mutex((std::mutex *)(a1 + 488));
  std::deque<std::atomic<DiskImage::Context *>>::~deque[abi:ne180100]((void *)(a1 + 440));
  return ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::~error_ctrl_blk_t((void *)a1);
}

void *std::shared_ptr<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>::shared_ptr[abi:ne180100]<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>,void>( void *a1, uint64_t a2)
{
  *a1 = a2;
  unint64_t v4 = operator new(0x20uLL);
  *unint64_t v4 = off_18A1F1C30;
  v4[1] = 0LL;
  v4[2] = 0LL;
  double v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_188162F40( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  a10 = 0LL;
  if (v10) {
    std::default_delete<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>::operator()[abi:ne180100]( (int)&a10,  v10);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>> *,std::shared_ptr<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>::__shared_ptr_default_delete<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>,std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>,std::allocator<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>>::~__shared_ptr_pointer( std::__shared_weak_count *a1)
{
}

void std::__shared_ptr_pointer<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>> *,std::shared_ptr<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>::__shared_ptr_default_delete<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>,std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>,std::allocator<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>>::__on_zero_shared( uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>> *,std::shared_ptr<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>::__shared_ptr_default_delete<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>,std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>,std::allocator<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>>::__get_deleter( uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }

  else
  {
    return 0LL;
  }

void std::default_delete<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>::operator()[abi:ne180100]( int a1, void **__p)
{
  if (__p)
  {
    unint64_t v3 = *__p;
    if (*__p)
    {
      __p[1] = v3;
      operator delete(v3);
    }

    operator delete(__p);
  }

void ref::Allocator<CurrentReader,unsigned long long>::add_tag( uint64_t a1@<X0>, ref::details **a2@<X1>, int a3@<W2>, unint64_t *a4@<X8>)
{
  uint64_t v52 = a2;
  uint64_t v7 = (std::mutex *)(a1 + 744);
  unint64_t v8 = (void *)(a1 + 728);
  uint64_t v9 = (ref::details *)(a1 + 976);
  unsigned int v10 = (unint64_t *)(a1 + 560);
  uint64_t v45 = (unint64_t *)(a1 + 104);
  unint64_t v46 = (std::condition_variable *)(a1 + 808);
  uint64_t v47 = (uint64_t **)(a1 + 720);
  while (2)
  {
    __lk.__m_ = v7;
    __lk.__owns_ = 1;
    std::mutex::lock(v7);
    if (a3)
    {
      uint64_t v11 = v52;
    }

    else
    {
      char v16 = (void *)*v8;
      if (!*v8) {
        goto LABEL_20;
      }
      uint64_t v11 = v52;
      uint64_t v17 = v8;
      do
      {
        unint64_t v18 = v16[4];
        BOOL v19 = v18 >= (unint64_t)v52;
        else {
          int64_t v20 = v16 + 1;
        }
        if (v19) {
          uint64_t v17 = v16;
        }
        char v16 = (void *)*v20;
      }

      while (*v20);
      if (v17 == v8 || (unint64_t)v52 < v17[4] || (ref::details *)v17[5] == v9)
      {
LABEL_20:
        CFDataRef v53 = 0LL;
        *a4 = 0LL;
        do
          unint64_t v21 = __ldaxr((unint64_t *)&v53);
        while (__stlxr(0LL, (unint64_t *)&v53));
        atomic_store(v21, a4);
        a4[1] = (unint64_t)v8;
        ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v53);
        goto LABEL_23;
      }
    }

    CFDataRef v53 = v11;
    __int128 v54 = (unint64_t *)v9;
    std::chrono::system_clock::time_point v12 = std::__tree<std::__value_type<unsigned long long,ref::details::tagged_allocated_type<di_asif::details::map_element,unsigned long long> *>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,ref::details::tagged_allocated_type<di_asif::details::map_element,unsigned long long> *>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,ref::details::tagged_allocated_type<di_asif::details::map_element,unsigned long long> *>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,ref::details::tagged_allocated_type<di_asif::details::map_element,unsigned long long> *>>( v47,  (unint64_t *)&v53,  (uint64_t *)&v53);
    uint64_t v13 = v12;
    if (v14)
    {
      CFDataRef v53 = 0LL;
      *a4 = 0LL;
      do
        unint64_t v15 = __ldaxr((unint64_t *)&v53);
      while (__stlxr(0LL, (unint64_t *)&v53));
      atomic_store(v15, a4);
      a4[1] = (unint64_t)v12;
      ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v53);
LABEL_23:
      int v22 = 1;
      goto LABEL_24;
    }

    uint64_t v50 = (ref::details *)v12[5];
    if (v50 == v9)
    {
      char v30 = (void *)*v8;
      if (*v8)
      {
        __int128 v31 = v52;
        unint64_t v32 = v8;
        while (1)
        {
          unint64_t v33 = v30[4];
          BOOL v34 = v33 >= (unint64_t)v31;
          else {
            unint64_t v35 = v30 + 1;
          }
          if (v34) {
            unint64_t v32 = v30;
          }
          char v30 = (void *)*v35;
          if (!*v35)
          {
            if (v32 == v8) {
              break;
            }
            char v36 = (ref::details *)v32[5];
            if (v36 != v9)
            {
              uint64_t v37 = *((void *)v36 + 41);
              if (v37)
              {
                if (!*(_BYTE *)(v37 + 312)) {
                  break;
                }
              }
            }

            if (!*(_BYTE *)(a1 + 704)) {
              break;
            }
            std::condition_variable::wait(v46, &__lk);
            char v30 = (void *)*v8;
            unint64_t v32 = v8;
            if (!*v8) {
              break;
            }
          }
        }
      }

      int v22 = 0;
      goto LABEL_24;
    }

    std::unique_lock<std::mutex>::unlock(&__lk);
    ref::tagged_ptr<CurrentReader,unsigned long long>::tagged_ptr(&v49, (unint64_t *)v50 + 41);
    if (v49 && !*(_BYTE *)(v49 + 312))
    {
      uint64_t v23 = (uint64_t)v52;
      if (*(ref::details ***)(v49 + 32) == v52)
      {
        *a4 = 0LL;
        do
          unint64_t v39 = __ldaxr(&v49);
        while (__stlxr(0LL, &v49));
        atomic_store(v39, a4);
        a4[1] = (unint64_t)v13;
        goto LABEL_84;
      }

      if (*(void *)(v49 + 32) == -1LL)
      {
        uint64_t v24 = v45;
        if ((a3 & 1) == 0)
        {
          CFDataRef v53 = 0LL;
          *a4 = 0LL;
          do
            unint64_t v38 = __ldaxr((unint64_t *)&v53);
          while (__stlxr(0LL, (unint64_t *)&v53));
          goto LABEL_83;
        }

        goto LABEL_35;
      }
    }

    else
    {
      if (!a3)
      {
        CFDataRef v53 = 0LL;
        *a4 = 0LL;
        do
          unint64_t v38 = __ldaxr((unint64_t *)&v53);
        while (__stlxr(0LL, (unint64_t *)&v53));
        goto LABEL_83;
      }

      uint64_t v23 = (uint64_t)v52;
    }

    uint64_t v24 = v45;
LABEL_35:
    if (ref::Allocator<CurrentReader,unsigned long long>::run_failed_dtors_list(a1, 0, v23, 1u) != -1)
    {
      do
        unint64_t v26 = __ldaxr(v10);
      while (__stlxr(v26 + 1, v10));
      v48.__m_ = (std::unique_lock<std::mutex>::mutex_type *)ref::details::_get_tagged_ptr_lock( (unint64_t)v50,  v25);
      v48.__owns_ = 1;
      std::mutex::lock(v48.__m_);
      tagged_ptr_cond = (std::condition_variable *)ref::details::_get_tagged_ptr_cond((unint64_t)v50, v27);
      std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v56 = std::chrono::steady_clock::now().__d_.__rep_ + 200000000;
      CFDataRef v53 = &v50;
      __int128 v54 = &v49;
      __int128 v55 = &v52;
      std::condition_variable::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>,ref::Allocator<CurrentReader,unsigned long long>::add_tag(unsigned long long,BOOL)::{lambda(void)#1}>( tagged_ptr_cond,  &v48,  &v56,  (uint64_t)&v53);
      do
        unint64_t v29 = __ldaxr(v10);
      while (__stlxr(v29 - 1, v10));
      if (v48.__owns_) {
        std::mutex::unlock(v48.__m_);
      }
      int v22 = 3;
      goto LABEL_85;
    }

    CFDataRef v53 = 0LL;
    unint64_t v40 = atomic_load(v24);
    if (!v40) {
      goto LABEL_81;
    }
    while (1)
    {
      unint64_t v41 = __ldaxr(v24);
      if (v41 != v40)
      {
        __clrex();
        goto LABEL_71;
      }

      if (!__stlxr(v40 + 1, v24)) {
        break;
      }
LABEL_71:
      unint64_t v40 = v41;
      if (!v41) {
        goto LABEL_81;
      }
    }

    uint64_t v42 = *(unint64_t **)(a1 + 400);
    unint64_t v40 = (unint64_t)v24;
    if (v42)
    {
      do
        unint64_t v43 = __ldxr(v42);
      while (__stxr(v43 + 1, v42));
      *(void *)(a1 + 408) = v43;
      unint64_t v40 = (unint64_t)v24;
    }

void sub_188163458( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::mutex *a12, char a13, int a14, unint64_t a15, uint64_t a16, std::mutex *a17, char a18)
{
  if (a18) {
    std::mutex::unlock(a17);
  }
  _Unwind_Resume(a1);
}

unint64_t *ref::Allocator<CurrentReader,unsigned long long>::allocate_from_empty_pool@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t **a3@<X8>)
{
  unint64_t v12 = 0LL;
  uint64_t v6 = (std::mutex *)(a1 + 488);
  std::mutex::lock((std::mutex *)(a1 + 488));
  uint64_t v7 = *(void *)(a1 + 480);
  if (v7)
  {
    ++*(void *)(a1 + 472);
    *(void *)(a1 + 480) = v7 - 1;
    std::deque<std::atomic<DiskImage::Context *>>::__maybe_remove_front_spare[abi:ne180100](a1 + 440, 1);
    ref::Allocator<CurrentReader,unsigned long long>::insert_elem(a1, v8, a2, v13);
    ref::tagged_ptr<CurrentReader,unsigned long long>::operator=(&v12, v13);
    ref::tagged_ptr<CurrentReader,unsigned long long>::reset(v13);
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  std::mutex::unlock(v6);
  unint64_t v9 = atomic_load((unint64_t *)(a1 + 576));
  if (v9 + v7 >= *(void *)(a1 + 432))
  {
    ref::Allocator<CurrentReader,unsigned long long>::run_failed_dtors_list(a1, 0, 0LL, 0);
  }

  else
  {
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = (unint64_t)___ZN3ref9AllocatorI13CurrentReaderyE9evict_lruEv_block_invoke;
    v13[3] = (unint64_t)&__block_descriptor_tmp_23;
    v13[4] = a1;
    gcd::gcd_queue::async((dispatch_queue_t *)(a1 + 712), v13);
  }

  *a3 = v8;
  a3[1] = 0LL;
  do
    unint64_t v10 = __ldaxr(&v12);
  while (__stlxr(0LL, &v12));
  atomic_store(v10, (unint64_t *)a3 + 1);
  return ref::tagged_ptr<CurrentReader,unsigned long long>::reset(&v12);
}

void sub_18816360C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
}

unint64_t ref::Allocator<CurrentReader,unsigned long long>::extract_min(void *a1)
{
  unint64_t v1 = atomic_load(a1 + 71);
  uint64_t v2 = a1[53];
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  int v4 = 0;
  unint64_t v5 = 0LL;
  do
  {
    uint64_t v6 = a1[69];
    uint64_t v7 = *(void *)(v6 + 8 * v3);
    if (v7 && v1 - *(void *)(v7 + 312) != -1LL)
    {
      unint64_t v5 = *(void *)(v6 + 8 * v3);
      int v4 = v3;
    }

    ++v3;
  }

  while (v2 != v3);
  if (!v5) {
    return 0LL;
  }
  unint64_t v8 = (unint64_t *)(a1[69] + 8LL * v4);
  do
  {
    unint64_t v9 = __ldaxr(v8);
    if (v9 != v5)
    {
      __clrex();
      return 0LL;
    }
  }

  while (__stlxr(0LL, v8));
  return v5;
}

unint64_t *ref::Allocator<CurrentReader,unsigned long long>::insert_elem@<X0>( uint64_t a1@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  uint64_t v7 = a2 + 1;
  unint64_t v17 = 0LL;
  unint64_t v8 = atomic_load(a2 + 1);
  if (!v8)
  {
LABEL_7:
    uint64_t v7 = 0LL;
    goto LABEL_11;
  }

  while (1)
  {
    unint64_t v9 = __ldaxr(v7);
    if (v9 != v8)
    {
      __clrex();
      goto LABEL_6;
    }

    if (!__stlxr(v8 + 1, v7)) {
      break;
    }
LABEL_6:
    unint64_t v8 = v9;
    if (!v9) {
      goto LABEL_7;
    }
  }

  unint64_t v10 = (unint64_t *)a2[38];
  if (v10)
  {
    do
      unint64_t v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
    a2[39] = v11;
  }

unint64_t *ref::tagged_ptr<CurrentReader,unsigned long long>::tagged_ptr( unint64_t *a1, unint64_t *a2, int a3)
{
  uint64_t v3 = a2;
  *a1 = 0LL;
  if (!a2) {
    goto LABEL_9;
  }
  unint64_t v5 = atomic_load(a2);
  if (!v5) {
    goto LABEL_8;
  }
  while (1)
  {
    unint64_t v6 = __ldaxr(a2);
    if (v6 != v5)
    {
      __clrex();
      goto LABEL_7;
    }

    if (!__stlxr(v5 + 1, a2)) {
      break;
    }
LABEL_7:
    unint64_t v5 = v6;
    if (!v6) {
      goto LABEL_8;
    }
  }

  unint64_t v8 = (unint64_t *)a2[37];
  if (v8)
  {
    do
      unint64_t v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
    a2[38] = v9;
  }

  if (a3 && !ref::details::ctrl_blk<CurrentReader,unsigned long long>::wait_for_ready((uint64_t)a2))
  {
    do
      unint64_t v10 = __ldaxr(v3);
    while (__stlxr(v10 - 1, v3));
    if (v10 == 1)
    {
      uint64_t v11 = v3[4];
      v3[4] = -1LL;
      ref::details::ctrl_blk<CurrentReader,unsigned long long>::reset_val((uint64_t)v3, v11, 1u);
    }

BOOL std::condition_variable::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>,ref::Allocator<CurrentReader,unsigned long long>::add_tag(unsigned long long,BOOL)::{lambda(void)#1}>( std::condition_variable *a1, std::unique_lock<std::mutex> *a2, std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *a3, uint64_t a4)
{
  do
  {
    if ((*(_DWORD *)(**(void **)a4 + 336LL) & 1) != 0) {
      return 1LL;
    }
    uint64_t v8 = *(void *)(a4 + 8);
    if (*(void *)v8)
    {
      if (!*(_BYTE *)(*(void *)v8 + 312LL) && *(void *)(*(void *)v8 + 32LL) == **(void **)(a4 + 16)) {
        return 1LL;
      }
    }

    if (*a3 <= std::chrono::steady_clock::now().__d_.__rep_) {
      break;
    }
    std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v9 = *a3;
    v10.__d_.__rep_ = v9 - std::chrono::steady_clock::now().__d_.__rep_;
    if (v10.__d_.__rep_ >= 1)
    {
      std::chrono::steady_clock::now();
      v11.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
      if (v11.__d_.__rep_)
      {
        if (v11.__d_.__rep_ < 1)
        {
          if ((unint64_t)v11.__d_.__rep_ < 0xFFDF3B645A1CAC09LL)
          {
            std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v12 = 0x8000000000000000LL;
            goto LABEL_17;
          }
        }

        else if ((unint64_t)v11.__d_.__rep_ > 0x20C49BA5E353F7LL)
        {
          std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v12 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_15;
        }

        std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v12 = 1000 * v11.__d_.__rep_;
      }

      else
      {
        std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v12 = 0LL;
      }

uint64_t ___ZN3ref9AllocatorI13CurrentReaderyE9evict_lruEv_block_invoke(uint64_t a1)
{
  unint64_t v1 = *(void **)(a1 + 32);
  unint64_t min = ref::Allocator<CurrentReader,unsigned long long>::extract_min(v1);
  if (min) {
    ref::Allocator<CurrentReader,unsigned long long>::add_to_free_pool((uint64_t)v1, min);
  }
  return ref::Allocator<CurrentReader,unsigned long long>::run_failed_dtors_list((uint64_t)v1, 0, 0LL, 0);
}

unint64_t *ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::mark_used( uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (unint64_t *)(a1 + 8);
  ref::details::ctrl_blk<CurrentReader,unsigned long long>::init(a1 + 8, a2);
  unint64_t v12 = 0LL;
  unint64_t v4 = atomic_load(v3);
  if (!v4) {
    goto LABEL_11;
  }
  while (1)
  {
    unint64_t v5 = __ldaxr(v3);
    if (v5 != v4)
    {
      __clrex();
      goto LABEL_6;
    }

    if (!__stlxr(v4 + 1, v3)) {
      break;
    }
LABEL_6:
    unint64_t v4 = v5;
    if (!v5) {
      goto LABEL_11;
    }
  }

  unint64_t v6 = *(unint64_t **)(a1 + 304);
  unint64_t v4 = (unint64_t)v3;
  if (v6)
  {
    do
      unint64_t v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
    *(void *)(a1 + 312) = v7;
    unint64_t v4 = (unint64_t)v3;
  }

uint64_t ref::details::ctrl_blk<CurrentReader,unsigned long long>::make_value<std::shared_ptr<char>,unsigned long long>( uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  *(void *)(a1 + 304) = **(void **)(a1 + 296);
  uint64_t v6 = a1 + 40;
  std::__optional_destruct_base<CurrentReader,false>::reset[abi:ne180100](a1 + 40);
  std::construct_at[abi:ne180100]<CurrentReader,std::shared_ptr<char>,unsigned long long,CurrentReader*>(v6, a2, a3);
  *(_BYTE *)(a1 + 192) = 1;
  atomic_store(2u, (unsigned int *)(a1 + 24));
  return ref::details::ctrl_blk<CurrentReader,unsigned long long>::notify_ready(a1);
}

void sub_188163BF8(void *a1)
{
  *(_BYTE *)(v1 + 312) = 1;
  ref::details::ctrl_blk<CurrentReader,unsigned long long>::notify_ready(v1);
  __cxa_rethrow();
}

void sub_188163C1C(_Unwind_Exception *a1)
{
}

uint64_t ref::details::ctrl_blk<CurrentReader,unsigned long long>::notify_ready(uint64_t result)
{
  return result;
}

uint64_t std::construct_at[abi:ne180100]<CurrentReader,std::shared_ptr<char>,unsigned long long,CurrentReader*>( uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v4 = *a2;
  unint64_t v5 = (std::__shared_weak_count *)a2[1];
  *a2 = 0LL;
  a2[1] = 0LL;
  uint64_t v6 = *a3;
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  if (v5)
  {
    uint64_t p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      unint64_t v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }

  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = 1018212795LL;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)(a1 + 64) = 0LL;
  *(void *)(a1 + 72) = 850045863LL;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 125) = 0u;
  *(_DWORD *)(a1 + 144) = -1;
  if (v5)
  {
    unint64_t v9 = (unint64_t *)&v5->__shared_owners_;
    do
      unint64_t v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

  return a1;
}

uint64_t ref::details::ctrl_blk<CurrentReader,unsigned long long>::make_value<std::shared_ptr<char> const&,unsigned long long>( uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  *(void *)(a1 + 304) = **(void **)(a1 + 296);
  uint64_t v6 = a1 + 40;
  std::__optional_destruct_base<CurrentReader,false>::reset[abi:ne180100](a1 + 40);
  std::construct_at[abi:ne180100]<CurrentReader,std::shared_ptr<char> const&,unsigned long long,CurrentReader*>( v6,  a2,  a3);
  *(_BYTE *)(a1 + 192) = 1;
  atomic_store(2u, (unsigned int *)(a1 + 24));
  return ref::details::ctrl_blk<CurrentReader,unsigned long long>::notify_ready(a1);
}

void sub_188163D74(void *a1)
{
  *(_BYTE *)(v1 + 312) = 1;
  ref::details::ctrl_blk<CurrentReader,unsigned long long>::notify_ready(v1);
  __cxa_rethrow();
}

void sub_188163D98(_Unwind_Exception *a1)
{
}

uint64_t std::construct_at[abi:ne180100]<CurrentReader,std::shared_ptr<char> const&,unsigned long long,CurrentReader*>( uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v4 = *a2;
  unint64_t v5 = (std::__shared_weak_count *)a2[1];
  if (v5)
  {
    uint64_t p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      unint64_t v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
    uint64_t v8 = *a3;
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = v5;
    do
      unint64_t v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }

  else
  {
    uint64_t v8 = *a3;
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = 0LL;
  }

  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 24) = 1018212795LL;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)(a1 + 64) = 0LL;
  *(void *)(a1 + 72) = 850045863LL;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 125) = 0u;
  *(_DWORD *)(a1 + 144) = -1;
  if (v5)
  {
    unint64_t v10 = (unint64_t *)&v5->__shared_owners_;
    do
      unint64_t v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

  return a1;
}

void std::allocate_shared[abi:ne180100]<readSynchronizer,std::allocator<readSynchronizer>,readSynchronizer&,std::shared_ptr<Backend> const&,void>( void *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  uint64_t v6 = operator new(0x68uLL);
  std::__shared_ptr_emplace<readSynchronizer>::__shared_ptr_emplace[abi:ne180100]<readSynchronizer&,std::shared_ptr<Backend> const&,std::allocator<readSynchronizer>,0>( v6,  a1,  a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  std::shared_ptr<PurgeableFileBackend>::__enable_weak_this[abi:ne180100]<Backend,PurgeableFileBackend,void>( (uint64_t)a3,  v6 + 4,  (uint64_t)(v6 + 3));
}

void sub_188163EC8(_Unwind_Exception *a1)
{
}

void *std::__shared_ptr_emplace<readSynchronizer>::__shared_ptr_emplace[abi:ne180100]<readSynchronizer&,std::shared_ptr<Backend> const&,std::allocator<readSynchronizer>,0>( void *a1, void *a2, void *a3)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_18A1CC338;
  readSynchronizer::readSynchronizer((uint64_t)(a1 + 3), a2, a3);
  return a1;
}

void sub_188163F10(_Unwind_Exception *a1)
{
}

uint64_t readSynchronizer::readSynchronizer(uint64_t a1, void *a2, void *a3)
{
  *unint64_t v5 = off_18A1F16F0;
  uint64_t v6 = a2[6];
  v5[5] = a2[5];
  v5[6] = v6;
  if (v6)
  {
    unint64_t v7 = (unint64_t *)(v6 + 8);
    do
      unint64_t v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }

  uint64_t v9 = a2[8];
  *(void *)(a1 + 56) = a2[7];
  *(void *)(a1 + 64) = v9;
  if (v9)
  {
    unint64_t v10 = (unint64_t *)(v9 + 8);
    do
      unint64_t v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }

  ref::tagged_ptr<CurrentReader,unsigned long long>::tagged_ptr((unint64_t *)(a1 + 72), a2 + 9);
  return a1;
}

void sub_188163FBC(_Unwind_Exception *a1)
{
}

uint64_t sg_vec_ns::details::buffer_iterator::make_value@<X0>( uint64_t this@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  if (*(void *)(this + 24) == *(void *)(this + 16))
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return this;
  }

  uint64_t v3 = **(void **)this + *(void *)(this + 32);
  if (*(void *)(this + 56)) {
    BOOL v4 = a2 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    uint64_t v5 = *(void *)(*(void *)this + 8LL);
    if (!v5) {
      goto LABEL_12;
    }
LABEL_10:
    uint64_t v6 = (unint64_t *)(v5 + 8);
    do
      unint64_t v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
    goto LABEL_12;
  }

  uint64_t v5 = *(void *)(this + 64);
  if (v5) {
    goto LABEL_10;
  }
LABEL_12:
  *(void *)a3 = v3;
  *(void *)(a3 + 8) = v5;
  unint64_t v8 = *(void *)(this + 32);
  unint64_t v9 = *(void *)(*(void *)this + 16LL) - v8;
  if (v9 >= *(void *)(this + 24) - *(void *)(this + 16)) {
    unint64_t v9 = *(void *)(this + 24) - *(void *)(this + 16);
  }
  unint64_t v10 = **(void **)(this + 8);
  BOOL v11 = v10 >= v8;
  unint64_t v12 = v10 - v8;
  if (!v11) {
    unint64_t v12 = 0LL;
  }
  *(void *)(a3 + 16) = v9;
  *(void *)(a3 + 24) = v12;
  return this;
}

sg_vec_ns::details::buffer_iterator *sg_vec_ns::details::buffer_iterator::buffer_iterator( sg_vec_ns::details::buffer_iterator *this, void *a2, unint64_t **a3, unint64_t a4, unint64_t a5, unint64_t a6, char a7)
{
  unint64_t v8 = 0LL;
  *(void *)this = *a2;
  unint64_t v9 = *a3;
  *((void *)this + 7) = 0LL;
  unint64_t v10 = (char *)this + 56;
  *((void *)this + 1) = v9;
  *((void *)this + 2) = a4;
  *((void *)this + 3) = a5;
  *((void *)this + 4) = a6;
  *((_BYTE *)this + 48) = a7;
  *((void *)this + 8) = 0LL;
  if (a4 < a5)
  {
    unint64_t v8 = **a3;
    if (v8 >= a6) {
      unint64_t v8 = a6;
    }
  }

  *((void *)this + 5) = v8;
  sg_vec_ns::details::buffer_iterator::make_value((uint64_t)this, 1, (uint64_t)v15);
  std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100]((uint64_t)v10, v15);
  *(_OWORD *)((char *)this + 72) = v15[1];
  BOOL v11 = (std::__shared_weak_count *)*((void *)&v15[0] + 1);
  if (*((void *)&v15[0] + 1))
  {
    unint64_t v12 = (unint64_t *)(*((void *)&v15[0] + 1) + 8LL);
    do
      unint64_t v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }

  return this;
}

sg_vec_ns::details::buffer_iterator *sg_vec_ns::details::buffer_iterator::operator++( sg_vec_ns::details::buffer_iterator *this)
{
  uint64_t v2 = *((void *)this + 2);
  uint64_t v3 = *((void *)this + 3);
  if (v2 != v3)
  {
    uint64_t v4 = *((void *)this + 1);
    uint64_t v5 = *(void *)(*(void *)this + 16LL) + v2 - *((void *)this + 4);
    uint64_t v6 = *(void *)this + 24LL;
    *((void *)this + 4) = 0LL;
    *((void *)this + 5) = 0LL;
    *(void *)this = v6;
    *((void *)this + 1) = v4 + 8;
    *((void *)this + 2) = v5;
  }

  sg_vec_ns::details::buffer_iterator::make_value((uint64_t)this, v2 != v3, (uint64_t)v11);
  std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100]((uint64_t)this + 56, v11);
  *(_OWORD *)((char *)this + 72) = v11[1];
  unint64_t v7 = (std::__shared_weak_count *)*((void *)&v11[0] + 1);
  if (*((void *)&v11[0] + 1))
  {
    unint64_t v8 = (unint64_t *)(*((void *)&v11[0] + 1) + 8LL);
    do
      unint64_t v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  return this;
}

sg_vec_ns::details::buffer_iterator *sg_vec_ns::details::buffer_iterator::operator+=( sg_vec_ns::details::buffer_iterator *this, unint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *((void *)this + 2);
    unint64_t v4 = *((void *)this + 3) - v3;
    if (*(void *)(*(void *)this + 16LL) - *((void *)this + 4) < v4) {
      unint64_t v4 = *(void *)(*(void *)this + 16LL) - *((void *)this + 4);
    }
    BOOL v5 = v4 <= a2;
    if (v4 <= a2)
    {
      int v6 = *((unsigned __int8 *)this + 48);
      uint64_t v7 = *((void *)this + 1) + 8LL;
      uint64_t v8 = *(void *)this + 24LL;
      do
      {
        uint64_t v9 = v7;
        uint64_t v10 = v8;
        if (v6)
        {
          *(void *)(v7 - 8) = *((void *)this + 5) + v4;
          uint64_t v3 = *((void *)this + 2);
        }

        *((void *)this + 4) = 0LL;
        *((void *)this + 5) = 0LL;
        v3 += v4;
        *((void *)this + 2) = v3;
        a2 -= v4;
        if (!a2) {
          break;
        }
        unint64_t v4 = *(void *)(v8 + 16);
        if (v4 >= *((void *)this + 3) - v3) {
          unint64_t v4 = *((void *)this + 3) - v3;
        }
        v7 += 8LL;
        v8 += 24LL;
        BOOL v11 = v4 > a2;
        if (v4 >= a2) {
          unint64_t v4 = a2;
        }
      }

      while (!v11);
      *(void *)this = v10;
      *((void *)this + 1) = v9;
    }
  }

  else
  {
    BOOL v5 = 0;
  }

  unint64_t v12 = *((void *)this + 5) + a2;
  *((void *)this + 5) = v12;
  if (v12 && *((_BYTE *)this + 48)) {
    **((void **)this + 1) = v12;
  }
  *((void *)this + 2) += a2;
  *((void *)this + 4) += a2;
  sg_vec_ns::details::buffer_iterator::make_value((uint64_t)this, v5, (uint64_t)v17);
  std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100]((uint64_t)this + 56, v17);
  *(_OWORD *)((char *)this + 72) = v17[1];
  unint64_t v13 = (std::__shared_weak_count *)*((void *)&v17[0] + 1);
  if (*((void *)&v17[0] + 1))
  {
    uint64_t v14 = (unint64_t *)(*((void *)&v17[0] + 1) + 8LL);
    do
      unint64_t v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

  return this;
}

{
  char v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  __int128 v22[2];
  uint64_t v3 = 0;
  if (a2)
  {
    unint64_t v4 = *((void *)this + 4);
    BOOL v5 = *((void *)this + 2);
    int v6 = *((void *)this + 3);
    uint64_t v7 = *((void *)this + 1) + 8LL;
    uint64_t v8 = *(void *)this + 24LL;
    while (1)
    {
      uint64_t v9 = v6 - v5;
      if (*(void *)(v8 - 8) - v4 < v6 - v5) {
        uint64_t v9 = *(void *)(v8 - 8) - v4;
      }
      uint64_t v10 = *(void *)(v7 - 8);
      BOOL v11 = v10 >= v4;
      unint64_t v12 = v10 - v4;
      unint64_t v13 = v11 ? v12 : 0LL;
      uint64_t v14 = v13 >= v9 ? v9 : v13;
      if (v14 >= a2 && (v9 > v13 || a2 != v14)) {
        break;
      }
      unint64_t v4 = 0LL;
      v5 += v9;
      *((void *)this + 1) = v7;
      *((void *)this + 2) = v5;
      *(void *)this = v8;
      if (a2 >= v14) {
        char v16 = a2 - v14;
      }
      else {
        char v16 = 0LL;
      }
      v7 += 8LL;
      *((void *)this + 4) = 0LL;
      *((void *)this + 5) = 0LL;
      uint64_t v3 = 1;
      v8 += 24LL;
      BOOL v11 = v14 >= a2;
      a2 = v16;
      if (v11) {
        goto LABEL_22;
      }
    }

    unint64_t v17 = *((void *)this + 5) + a2;
    *((void *)this + 2) = v5 + a2;
    *((void *)this + 4) = v4 + a2;
    *((void *)this + 5) = v17;
  }

void *sg_vec_ns::details::buffer_iterator::rtrim_written(void *this)
{
  uint64_t v1 = this[2];
  if (v1 != this[3])
  {
    uint64_t v2 = this[4];
    uint64_t v3 = (void *)this[1];
    unint64_t v4 = (uint64_t *)(*this + 16LL);
    do
    {
      *v3++ = v2;
      uint64_t v5 = *v4;
      v4 += 3;
      uint64_t v6 = this[3];
      unint64_t v7 = v5 - v2;
      if (v7 >= v6 - v1) {
        unint64_t v7 = v6 - v1;
      }
      v1 += v7;
      uint64_t v2 = 0LL;
    }

    while (v1 != v6);
  }

  return this;
}

void sg_vec_ns::details::sg_vec_iterator::make_val( sg_vec_ns::details::sg_vec_iterator *this@<X0>, const sg_vec_ns::details::sg_vec_iterator *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *((void *)this + 6);
  if (sg_vec_ns::details::sg_vec_iterator::operator==((uint64_t)this, (uint64_t)a2))
  {
    *(_OWORD *)(a3 + 25) = 0u;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }

  else
  {
    sg_vec_ns::details::buffer_iterator::sync((sg_vec_ns::details::sg_vec_iterator *)((char *)this + 56));
    uint64_t v7 = *((void *)this + 14);
    uint64_t v8 = (std::__shared_weak_count *)*((void *)this + 15);
    if (v8)
    {
      uint64_t p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        unint64_t v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
      unint64_t v11 = *((void *)this + 16);
      uint64_t v12 = *((void *)this + 18);
      unint64_t v13 = *((void *)a2 + 18) - v12;
      if (v13 >= v11) {
        unint64_t v13 = *((void *)this + 16);
      }
      do
        unint64_t v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
      char v15 = *(_BYTE *)(v6 + 200);
      *(void *)a3 = v7;
      *(void *)(a3 + 8) = v8;
      do
        unint64_t v16 = __ldxr(p_shared_owners);
      while (__stxr(v16 + 1, p_shared_owners));
      *(void *)(a3 + 16) = v13;
      *(void *)(a3 + 24) = v12;
      *(void *)(a3 + 32) = v11;
      *(_BYTE *)(a3 + 40) = v15;
      do
        unint64_t v17 = __ldaxr(p_shared_owners);
      while (__stlxr(v17 - 1, p_shared_owners));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }

      do
        unint64_t v18 = __ldaxr(p_shared_owners);
      while (__stlxr(v18 - 1, p_shared_owners));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }

    else
    {
      unint64_t v19 = *((void *)this + 16);
      uint64_t v20 = *((void *)this + 18);
      unint64_t v21 = *((void *)a2 + 18) - v20;
      if (v21 >= v19) {
        unint64_t v21 = *((void *)this + 16);
      }
      char v22 = *(_BYTE *)(v6 + 200);
      *(void *)a3 = v7;
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = v21;
      *(void *)(a3 + 24) = v20;
      *(void *)(a3 + 32) = v19;
      *(_BYTE *)(a3 + 40) = v22;
    }
  }

BOOL sg_vec_ns::details::sg_vec_iterator::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2 != *(void **)(a2 + 48)) {
    return 0LL;
  }
  if (*(_BYTE *)(a1 + 152)) {
    BOOL v4 = *(_BYTE *)(a2 + 152) == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    return *(void *)(a1 + 144) == *(void *)(a2 + 144);
  }
  uint64_t v5 = (std::__shared_weak_count *)v2[27];
  if (v5)
  {
    uint64_t p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      unint64_t v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }

  uint64_t v8 = v2[33];
  uint64_t v9 = v2[34];
  uint64_t v10 = v2[35];
  unint64_t v11 = (std::__shared_weak_count *)v2[41];
  if (v11)
  {
    uint64_t v12 = (unint64_t *)&v11->__shared_owners_;
    do
      unint64_t v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }

  uint64_t v14 = *(void *)(a1 + 56);
  BOOL v15 = v14 == v8 && *(void *)(a1 + 64) == v9 && *(void *)(a1 + 72) == v10;
  uint64_t v17 = *(void *)(a2 + 56);
  uint64_t v16 = *(void *)(a2 + 64);
  if (v17 == v8 && v16 == v9)
  {
    int v20 = v15 ^ (*(void *)(a2 + 72) != v10);
    if (v14 != v8 || v20 == 0) {
      goto LABEL_34;
    }
  }

  else
  {
    char v19 = v14 != v17 || v15;
    if ((v19 & 1) != 0) {
      goto LABEL_34;
    }
  }

  if (*(void *)(a1 + 64) == v16 && *(void *)(a1 + 72) == *(void *)(a2 + 72))
  {
    BOOL v3 = *(void *)(a1 + 144) == *(void *)(a2 + 144);
    goto LABEL_35;
  }

double sg_vec_ref::end@<D0>(sg_vec_ref *this@<X0>, uint64_t a2@<X8>)
{
  *(void *)&double result = sg_vec_ns::details::sg_vec_iterator::sg_vec_iterator(a2, (uint64_t)this + 208).n128_u64[0];
  return result;
}

void sg_vec_ref::sg_vec_ref( sg_vec_ref *this, const sg_vec_ns::details::buffer_iterator *a2, const sg_vec_ns::details::buffer_iterator *a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = *((void *)a3 + 2);
  *((void *)this + 1) = *(void *)a2;
  uint64_t v8 = (sg_vec_ref *)((char *)this + 8);
  uint64_t v9 = *((void *)a2 + 1);
  *(void *)this = v7 - *((void *)a2 + 2);
  *((void *)this + 2) = v9;
  __int128 v10 = *((_OWORD *)a2 + 1);
  __int128 v11 = *((_OWORD *)a2 + 2);
  *((_BYTE *)this + 56) = *((_BYTE *)a2 + 48);
  *(_OWORD *)((char *)this + 40) = v11;
  *(_OWORD *)((char *)this + 24) = v10;
  uint64_t v12 = *((void *)a2 + 8);
  *((void *)this + 8) = *((void *)a2 + 7);
  *((void *)this + 9) = v12;
  if (v12)
  {
    unint64_t v13 = (unint64_t *)(v12 + 8);
    do
      unint64_t v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }

  *((_OWORD *)this + 5) = *(_OWORD *)((char *)a2 + 72);
  *((void *)this + 12) = *(void *)a3;
  *((void *)this + 13) = *((void *)a3 + 1);
  __int128 v15 = *((_OWORD *)a3 + 1);
  __int128 v16 = *((_OWORD *)a3 + 2);
  *((_BYTE *)this + 144) = *((_BYTE *)a3 + 48);
  *((_OWORD *)this + 7) = v15;
  *((_OWORD *)this + 8) = v16;
  uint64_t v17 = *((void *)a3 + 8);
  *((void *)this + 19) = *((void *)a3 + 7);
  *((void *)this + 20) = v17;
  if (v17)
  {
    unint64_t v18 = (unint64_t *)(v17 + 8);
    do
      unint64_t v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }

  *(_OWORD *)((char *)this + 168) = *(_OWORD *)((char *)a3 + 72);
  *((void *)this + 23) = a4;
  *((void *)this + 24) = a5;
  *((_BYTE *)this + 200) = a6;
  sg_vec_ns::details::sg_vec_iterator::sg_vec_iterator( (sg_vec_ref *)((char *)this + 208),  this,  (sg_vec_ref *)((char *)this + 96),  0);
  sg_vec_ns::details::sg_vec_iterator::sg_vec_iterator((sg_vec_ref *)((char *)this + 368), this, v8, 1);
}

void sub_1881648FC(_Unwind_Exception *a1)
{
}

uint64_t sg_vec_ref::sg_vec_ref( uint64_t a1, uint64_t *a2, uint64_t *a3, unint64_t **a4, unint64_t **a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12 = *a2;
  uint64_t v13 = *a3;
  if (*a2 == *a3)
  {
    unint64_t v14 = 0LL;
  }

  else
  {
    unint64_t v14 = 0LL;
    do
    {
      __int128 v15 = *(std::__shared_weak_count **)(v12 + 8);
      if (v15)
      {
        uint64_t p_shared_owners = (unint64_t *)&v15->__shared_owners_;
        do
          unint64_t v17 = __ldxr(p_shared_owners);
        while (__stxr(v17 + 1, p_shared_owners));
        uint64_t v18 = *(void *)(v12 + 16);
        do
          unint64_t v19 = __ldaxr(p_shared_owners);
        while (__stlxr(v19 - 1, p_shared_owners));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }

      else
      {
        uint64_t v18 = *(void *)(v12 + 16);
      }

      v14 += v18;
      v12 += 24LL;
    }

    while (v12 != v13);
  }

  *(void *)a1 = v14;
  sg_vec_ns::details::buffer_iterator::buffer_iterator( (sg_vec_ns::details::buffer_iterator *)(a1 + 8),  a2,  a4,  0LL,  v14,  0LL,  1);
  sg_vec_ns::details::buffer_iterator::buffer_iterator( (sg_vec_ns::details::buffer_iterator *)(a1 + 96),  a3,  a5,  *(void *)a1,  *(void *)a1,  0LL,  1);
  *(void *)(a1 + 184) = a6;
  *(void *)(a1 + 192) = a7;
  *(_BYTE *)(a1 + 200) = 0;
  sg_vec_ns::details::sg_vec_iterator::sg_vec_iterator( (sg_vec_ns::details::sg_vec_iterator *)(a1 + 208),  (sg_vec_ref *)a1,  (const sg_vec_ns::details::buffer_iterator *)(a1 + 96),  0);
  sg_vec_ns::details::sg_vec_iterator::sg_vec_iterator( (sg_vec_ns::details::sg_vec_iterator *)(a1 + 368),  (sg_vec_ref *)a1,  (const sg_vec_ns::details::buffer_iterator *)(a1 + 8),  1);
  return a1;
}

void sub_188164A9C(_Unwind_Exception *a1)
{
}

double sg_vec_ref::begin@<D0>(sg_vec_ref *this@<X0>, uint64_t a2@<X8>)
{
  *(void *)&double result = sg_vec_ns::details::sg_vec_iterator::sg_vec_iterator(a2, (uint64_t)this + 368).n128_u64[0];
  return result;
}

void sg_vec_ref::subvec( sg_vec_ref *this@<X0>, const sg_vec_ns::details::sg_vec_iterator *a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = *((void *)this + 27);
  *(void *)&__int128 v141 = *((void *)this + 26);
  *((void *)&v141 + 1) = v10;
  if (v10)
  {
    __int128 v11 = (unint64_t *)(v10 + 8);
    do
      unint64_t v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }

  v142[0] = *((_OWORD *)this + 14);
  *(_OWORD *)((char *)v142 + 9) = *(_OWORD *)((char *)this + 233);
  uint64_t v13 = (__int128 *)((char *)this + 264);
  __int128 v144 = *(_OWORD *)((char *)this + 264);
  __int128 v14 = *(_OWORD *)((char *)this + 296);
  __int128 v145 = *(_OWORD *)((char *)this + 280);
  uint64_t v143 = *((void *)this + 32);
  char v147 = *((_BYTE *)this + 312);
  __int128 v146 = v14;
  __int128 v15 = (std::__shared_weak_count *)*((void *)this + 41);
  uint64_t v148 = *((void *)this + 40);
  v149 = v15;
  if (v15)
  {
    uint64_t p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      unint64_t v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
  }

  __n128 v150 = *((__n128 *)this + 21);
  unint64_t v151 = *((void *)this + 44);
  char v152 = *((_BYTE *)this + 360);
  BOOL v18 = sg_vec_ns::details::sg_vec_iterator::operator==((uint64_t)a2, (uint64_t)&v141);
  if (v15)
  {
    unint64_t v19 = (unint64_t *)&v15->__shared_owners_;
    do
      unint64_t v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }

  unint64_t v21 = (std::__shared_weak_count *)*((void *)&v141 + 1);
  if (*((void *)&v141 + 1))
  {
    char v22 = (unint64_t *)(*((void *)&v141 + 1) + 8LL);
    do
      unint64_t v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

  uint64_t v24 = (_OWORD *)((char *)this + 224);
  unint64_t v25 = (__int128 *)((char *)this + 280);
  v125 = (__n128 *)((char *)this + 336);
  unint64_t v26 = (uint64_t *)((char *)this + 352);
  if (v18)
  {
    uint64_t v27 = *((void *)this + 27);
    *(void *)&__int128 v141 = *((void *)this + 26);
    *((void *)&v141 + 1) = v27;
    if (v27)
    {
      std::chrono::system_clock::time_point v28 = (unint64_t *)(v27 + 8);
      do
        unint64_t v29 = __ldxr(v28);
      while (__stxr(v29 + 1, v28));
    }

    v142[0] = *v24;
    *(_OWORD *)((char *)v142 + 9) = *(_OWORD *)((char *)this + 233);
    __int128 v144 = *v13;
    __int128 v30 = *(_OWORD *)((char *)this + 296);
    __int128 v145 = *v25;
    uint64_t v143 = *((void *)this + 32);
    __int128 v146 = v30;
    char v147 = *((_BYTE *)this + 312);
    __int128 v31 = (std::__shared_weak_count *)*((void *)this + 41);
    uint64_t v148 = *((void *)this + 40);
    v149 = v31;
    if (v31)
    {
      unint64_t v32 = (unint64_t *)&v31->__shared_owners_;
      do
        unint64_t v33 = __ldxr(v32);
      while (__stxr(v33 + 1, v32));
    }

    __n128 v150 = *v125;
    unint64_t v151 = *v26;
    char v152 = *((_BYTE *)this + 360);
    BOOL v34 = (std::__shared_weak_count *)*((void *)this + 27);
    uint64_t v128 = *((void *)this + 26);
    v129 = v34;
    if (v34)
    {
      unint64_t v35 = (unint64_t *)&v34->__shared_owners_;
      do
        unint64_t v36 = __ldxr(v35);
      while (__stxr(v36 + 1, v35));
    }

    v130[0] = *v24;
    *(_OWORD *)((char *)v130 + 9) = *(_OWORD *)((char *)this + 233);
    __int128 v132 = *v13;
    __int128 v37 = *(_OWORD *)((char *)this + 296);
    __int128 v133 = *v25;
    uint64_t v131 = *((void *)this + 32);
    __int128 v134 = v37;
    char v135 = *((_BYTE *)this + 312);
    unint64_t v38 = (std::__shared_weak_count *)*((void *)this + 41);
    uint64_t v136 = *((void *)this + 40);
    v137 = v38;
    if (v38)
    {
      unint64_t v39 = (unint64_t *)&v38->__shared_owners_;
      do
        unint64_t v40 = __ldxr(v39);
      while (__stxr(v40 + 1, v39));
    }

    __n128 v138 = *v125;
    unint64_t v139 = *v26;
    char v140 = *((_BYTE *)this + 360);
    __n128 v41 = std::pair<sg_vec_ns::details::sg_vec_iterator,sg_vec_ns::details::sg_vec_iterator>::pair[abi:ne180100]<sg_vec_ns::details::sg_vec_iterator,sg_vec_ns::details::sg_vec_iterator,0>( a5,  (uint64_t)&v141,  (uint64_t)&v128);
    uint64_t v42 = v137;
    if (v137)
    {
      unint64_t v43 = (unint64_t *)&v137->__shared_owners_;
      do
        unint64_t v44 = __ldaxr(v43);
      while (__stlxr(v44 - 1, v43));
      if (!v44)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v42->__on_zero_shared)(v42, v41);
        std::__shared_weak_count::__release_weak(v42);
      }
    }

    uint64_t v45 = v129;
    if (v129)
    {
      unint64_t v46 = (unint64_t *)&v129->__shared_owners_;
      do
        unint64_t v47 = __ldaxr(v46);
      while (__stlxr(v47 - 1, v46));
      if (!v47)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v45->__on_zero_shared)(v45, v41);
        std::__shared_weak_count::__release_weak(v45);
      }
    }

    std::unique_lock<std::mutex> v48 = v149;
    if (v149)
    {
      unint64_t v49 = (unint64_t *)&v149->__shared_owners_;
      do
        unint64_t v50 = __ldaxr(v49);
      while (__stlxr(v50 - 1, v49));
      if (!v50)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v48->__on_zero_shared)(v48, v41);
        std::__shared_weak_count::__release_weak(v48);
      }
    }

    v51 = (std::__shared_weak_count *)*((void *)&v141 + 1);
    if (*((void *)&v141 + 1))
    {
      uint64_t v52 = (unint64_t *)(*((void *)&v141 + 1) + 8LL);
      do
        unint64_t v53 = __ldaxr(v52);
      while (__stlxr(v53 - 1, v52));
LABEL_144:
      if (!v53)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v51->__on_zero_shared)(v51, v41);
        std::__shared_weak_count::__release_weak(v51);
      }
    }
  }

  else
  {
    uint64_t v54 = *((void *)this + 24);
    if (v54 + *((void *)this + 23) >= a3) {
      unint64_t v55 = a3;
    }
    else {
      unint64_t v55 = v54 + *((void *)this + 23);
    }
    if (v55 >= *((void *)a2 + 18))
    {
      uint64_t v80 = *((void *)a2 + 1);
      *(void *)&__int128 v141 = *(void *)a2;
      *((void *)&v141 + 1) = v80;
      if (v80)
      {
        v81 = (unint64_t *)(v80 + 8);
        do
          unint64_t v82 = __ldxr(v81);
        while (__stxr(v82 + 1, v81));
      }

      v142[0] = *((_OWORD *)a2 + 1);
      *(_OWORD *)((char *)v142 + 9) = *(_OWORD *)((char *)a2 + 25);
      uint64_t v143 = *((void *)a2 + 6);
      __int128 v144 = *(_OWORD *)((char *)a2 + 56);
      __int128 v145 = *(_OWORD *)((char *)a2 + 72);
      __int128 v146 = *(_OWORD *)((char *)a2 + 88);
      char v147 = *((_BYTE *)a2 + 104);
      v83 = (std::__shared_weak_count *)*((void *)a2 + 15);
      uint64_t v148 = *((void *)a2 + 14);
      v149 = v83;
      if (v83)
      {
        v84 = (unint64_t *)&v83->__shared_owners_;
        do
          unint64_t v85 = __ldxr(v84);
        while (__stxr(v85 + 1, v84));
      }

      __n128 v150 = *((__n128 *)a2 + 8);
      unint64_t v151 = *((void *)a2 + 18);
      char v152 = *((_BYTE *)a2 + 152);
      if (a4)
      {
        unint64_t v86 = sg_vec_ns::length<written_bytes_t>(&v144, (uint64_t)this + 96);
        unint64_t v87 = v86;
        if (v86 >= a4) {
          unint64_t v88 = a4;
        }
        else {
          unint64_t v88 = v86;
        }
        if (v88) {
          sg_vec_ns::details::sg_vec_iterator::operator+=((uint64_t)&v141, v88);
        }
        if (v87 < a4) {
          sg_vec_ns::details::sg_vec_iterator::operator+=((uint64_t)&v141, a4 - v88);
        }
      }

      v89 = (std::__shared_weak_count *)*((void *)this + 27);
      uint64_t v128 = *((void *)this + 26);
      v129 = v89;
      if (v89)
      {
        v90 = (unint64_t *)&v89->__shared_owners_;
        do
          unint64_t v91 = __ldxr(v90);
        while (__stxr(v91 + 1, v90));
      }

      v130[0] = *v24;
      *(_OWORD *)((char *)v130 + 9) = *(_OWORD *)((char *)this + 233);
      __int128 v132 = *v13;
      __int128 v92 = *(_OWORD *)((char *)this + 296);
      __int128 v133 = *v25;
      uint64_t v131 = *((void *)this + 32);
      __int128 v134 = v92;
      char v135 = *((_BYTE *)this + 312);
      v93 = (std::__shared_weak_count *)*((void *)this + 41);
      uint64_t v136 = *((void *)this + 40);
      v137 = v93;
      if (v93)
      {
        v94 = (unint64_t *)&v93->__shared_owners_;
        do
          unint64_t v95 = __ldxr(v94);
        while (__stxr(v95 + 1, v94));
      }

      __n128 v138 = *v125;
      char v140 = *((_BYTE *)this + 360);
      unint64_t v139 = v55;
      sg_vec_ns::details::sg_vec_iterator::make_val( (sg_vec_ns::details::sg_vec_iterator *)&v141,  (const sg_vec_ns::details::sg_vec_iterator *)&v128,  (uint64_t)&v126);
      __int128 v96 = v126;
      __int128 v126 = 0uLL;
      v97 = (std::__shared_weak_count *)*((void *)&v141 + 1);
      __int128 v141 = v96;
      if (v97)
      {
        v98 = (unint64_t *)&v97->__shared_owners_;
        do
          unint64_t v99 = __ldaxr(v98);
        while (__stlxr(v99 - 1, v98));
        if (!v99)
        {
          ((void (*)(std::__shared_weak_count *))v97->__on_zero_shared)(v97);
          std::__shared_weak_count::__release_weak(v97);
        }
      }

      v142[0] = v127[0];
      *(_OWORD *)((char *)v142 + 9) = *(_OWORD *)((char *)v127 + 9);
      v100 = (std::__shared_weak_count *)*((void *)&v126 + 1);
      if (*((void *)&v126 + 1))
      {
        v101 = (unint64_t *)(*((void *)&v126 + 1) + 8LL);
        do
          unint64_t v102 = __ldaxr(v101);
        while (__stlxr(v102 - 1, v101));
        if (!v102)
        {
          ((void (*)(std::__shared_weak_count *))v100->__on_zero_shared)(v100);
          std::__shared_weak_count::__release_weak(v100);
        }
      }

      uint64_t v103 = *((void *)&v141 + 1);
      *(void *)a5 = v141;
      *(void *)(a5 + 8) = v103;
      if (v103)
      {
        v104 = (unint64_t *)(v103 + 8);
        do
          unint64_t v105 = __ldxr(v104);
        while (__stxr(v105 + 1, v104));
      }

      *(_OWORD *)(a5 + 16) = v142[0];
      *(_OWORD *)(a5 + 25) = *(_OWORD *)((char *)v142 + 9);
      *(_OWORD *)(a5 + 56) = v144;
      __int128 v106 = v146;
      *(_OWORD *)(a5 + 72) = v145;
      *(void *)(a5 + 48) = v143;
      *(_OWORD *)(a5 + 88) = v106;
      *(_BYTE *)(a5 + 104) = v147;
      v107 = v149;
      *(void *)(a5 + 112) = v148;
      *(void *)(a5 + 120) = v107;
      if (v107)
      {
        v108 = (unint64_t *)&v107->__shared_owners_;
        do
          unint64_t v109 = __ldxr(v108);
        while (__stxr(v109 + 1, v108));
      }

      *(__n128 *)(a5 + 128) = v150;
      *(void *)(a5 + 144) = v151;
      *(_BYTE *)(a5 + std::shared_ptr<char>::~shared_ptr[abi:ne180100](v1 + 152) = v152;
      v110 = v129;
      *(void *)(a5 + 160) = v128;
      *(void *)(a5 + 168) = v110;
      if (v110)
      {
        v111 = (unint64_t *)&v110->__shared_owners_;
        do
          unint64_t v112 = __ldxr(v111);
        while (__stxr(v112 + 1, v111));
      }

      *(_OWORD *)(a5 + 176) = v130[0];
      *(_OWORD *)(a5 + 185) = *(_OWORD *)((char *)v130 + 9);
      *(_OWORD *)(a5 + 216) = v132;
      __int128 v113 = v134;
      *(_OWORD *)(a5 + 232) = v133;
      *(void *)(a5 + 208) = v131;
      *(_OWORD *)(a5 + 248) = v113;
      *(_BYTE *)(a5 + 2std::shared_ptr<char>::~shared_ptr[abi:ne180100](v1 + 64) = v135;
      v114 = v137;
      *(void *)(a5 + 272) = v136;
      *(void *)(a5 + 280) = v114;
      if (v114)
      {
        v115 = (unint64_t *)&v114->__shared_owners_;
        do
          unint64_t v116 = __ldxr(v115);
        while (__stxr(v116 + 1, v115));
        __n128 v41 = v138;
        *(__n128 *)(a5 + 288) = v138;
        *(void *)(a5 + 304) = v139;
        *(_BYTE *)(a5 + 312) = v140;
        do
          unint64_t v117 = __ldaxr(v115);
        while (__stlxr(v117 - 1, v115));
        if (!v117)
        {
          ((void (*)(std::__shared_weak_count *))v114->__on_zero_shared)(v114);
          std::__shared_weak_count::__release_weak(v114);
        }
      }

      else
      {
        __n128 v41 = v138;
        *(__n128 *)(a5 + 288) = v138;
        *(void *)(a5 + 304) = v139;
        *(_BYTE *)(a5 + 312) = v140;
      }

      v118 = v129;
      if (v129)
      {
        v119 = (unint64_t *)&v129->__shared_owners_;
        do
          unint64_t v120 = __ldaxr(v119);
        while (__stlxr(v120 - 1, v119));
        if (!v120)
        {
          ((void (*)(std::__shared_weak_count *))v118->__on_zero_shared)(v118);
          std::__shared_weak_count::__release_weak(v118);
        }
      }

      v121 = v149;
      if (v149)
      {
        v122 = (unint64_t *)&v149->__shared_owners_;
        do
          unint64_t v123 = __ldaxr(v122);
        while (__stlxr(v123 - 1, v122));
        if (!v123)
        {
          ((void (*)(std::__shared_weak_count *))v121->__on_zero_shared)(v121);
          std::__shared_weak_count::__release_weak(v121);
        }
      }

      v51 = (std::__shared_weak_count *)*((void *)&v141 + 1);
      if (*((void *)&v141 + 1))
      {
        v124 = (unint64_t *)(*((void *)&v141 + 1) + 8LL);
        do
          unint64_t v53 = __ldaxr(v124);
        while (__stlxr(v53 - 1, v124));
        goto LABEL_144;
      }
    }

    else
    {
      uint64_t v56 = *((void *)this + 27);
      *(void *)&__int128 v141 = *((void *)this + 26);
      *((void *)&v141 + 1) = v56;
      if (v56)
      {
        v57 = (unint64_t *)(v56 + 8);
        do
          unint64_t v58 = __ldxr(v57);
        while (__stxr(v58 + 1, v57));
      }

      v142[0] = *v24;
      *(_OWORD *)((char *)v142 + 9) = *(_OWORD *)((char *)this + 233);
      __int128 v144 = *v13;
      __int128 v59 = *(_OWORD *)((char *)this + 296);
      __int128 v145 = *v25;
      uint64_t v143 = *((void *)this + 32);
      __int128 v146 = v59;
      char v147 = *((_BYTE *)this + 312);
      unint64_t v60 = (std::__shared_weak_count *)*((void *)this + 41);
      uint64_t v148 = *((void *)this + 40);
      v149 = v60;
      if (v60)
      {
        int v61 = (unint64_t *)&v60->__shared_owners_;
        do
          unint64_t v62 = __ldxr(v61);
        while (__stxr(v62 + 1, v61));
      }

      __n128 v150 = *v125;
      unint64_t v151 = *v26;
      char v152 = *((_BYTE *)this + 360);
      uint64_t v63 = (std::__shared_weak_count *)*((void *)this + 27);
      uint64_t v128 = *((void *)this + 26);
      v129 = v63;
      if (v63)
      {
        v64 = (unint64_t *)&v63->__shared_owners_;
        do
          unint64_t v65 = __ldxr(v64);
        while (__stxr(v65 + 1, v64));
      }

      v130[0] = *v24;
      *(_OWORD *)((char *)v130 + 9) = *(_OWORD *)((char *)this + 233);
      __int128 v132 = *v13;
      __int128 v66 = *(_OWORD *)((char *)this + 296);
      __int128 v133 = *v25;
      uint64_t v131 = *((void *)this + 32);
      __int128 v134 = v66;
      char v135 = *((_BYTE *)this + 312);
      uint64_t v67 = (std::__shared_weak_count *)*((void *)this + 41);
      uint64_t v136 = *((void *)this + 40);
      v137 = v67;
      if (v67)
      {
        v68 = (unint64_t *)&v67->__shared_owners_;
        do
          unint64_t v69 = __ldxr(v68);
        while (__stxr(v69 + 1, v68));
      }

      __n128 v138 = *v125;
      unint64_t v139 = *v26;
      char v140 = *((_BYTE *)this + 360);
      __n128 v41 = std::pair<sg_vec_ns::details::sg_vec_iterator,sg_vec_ns::details::sg_vec_iterator>::pair[abi:ne180100]<sg_vec_ns::details::sg_vec_iterator,sg_vec_ns::details::sg_vec_iterator,0>( a5,  (uint64_t)&v141,  (uint64_t)&v128);
      v70 = v137;
      if (v137)
      {
        v71 = (unint64_t *)&v137->__shared_owners_;
        do
          unint64_t v72 = __ldaxr(v71);
        while (__stlxr(v72 - 1, v71));
        if (!v72)
        {
          ((void (*)(std::__shared_weak_count *, __n128))v70->__on_zero_shared)(v70, v41);
          std::__shared_weak_count::__release_weak(v70);
        }
      }

      v73 = v129;
      if (v129)
      {
        v74 = (unint64_t *)&v129->__shared_owners_;
        do
          unint64_t v75 = __ldaxr(v74);
        while (__stlxr(v75 - 1, v74));
        if (!v75)
        {
          ((void (*)(std::__shared_weak_count *, __n128))v73->__on_zero_shared)(v73, v41);
          std::__shared_weak_count::__release_weak(v73);
        }
      }

      v76 = v149;
      if (v149)
      {
        v77 = (unint64_t *)&v149->__shared_owners_;
        do
          unint64_t v78 = __ldaxr(v77);
        while (__stlxr(v78 - 1, v77));
        if (!v78)
        {
          ((void (*)(std::__shared_weak_count *, __n128))v76->__on_zero_shared)(v76, v41);
          std::__shared_weak_count::__release_weak(v76);
        }
      }

      v51 = (std::__shared_weak_count *)*((void *)&v141 + 1);
      if (*((void *)&v141 + 1))
      {
        v79 = (unint64_t *)(*((void *)&v141 + 1) + 8LL);
        do
          unint64_t v53 = __ldaxr(v79);
        while (__stlxr(v53 - 1, v79));
        goto LABEL_144;
      }
    }
  }

void sub_1881654B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51)
{
}

uint64_t sg_vec_ns::length<written_bytes_t>(__int128 *a1, uint64_t a2)
{
  uint64_t v2 = a1 + 1;
  unint64_t v3 = *(void *)(a2 + 16);
  if (*((void *)a1 + 2) > v3) {
    return 0LL;
  }
  __int128 v6 = *v2;
  __int128 v7 = a1[2];
  __int128 v15 = *a1;
  __int128 v16 = v6;
  __int128 v17 = v7;
  char v18 = *((_BYTE *)a1 + 48);
  uint64_t v8 = (std::__shared_weak_count *)*((void *)a1 + 8);
  uint64_t v19 = *((void *)a1 + 7);
  unint64_t v20 = v8;
  if (v8)
  {
    uint64_t p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      unint64_t v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
    unint64_t v3 = *(void *)(a2 + 16);
  }

  __int128 v21 = *(__int128 *)((char *)a1 + 72);
  if ((unint64_t)v16 >= v3)
  {
    uint64_t v4 = 0LL;
    if (!v8) {
      return v4;
    }
    goto LABEL_19;
  }

  uint64_t v4 = 0LL;
  do
  {
    sg_vec_ns::details::buffer_iterator::sync((sg_vec_ns::details::buffer_iterator *)&v15);
    if (*(void *)(a2 + 16) - *(void *)v2 >= *((void *)&v21 + 1)) {
      unint64_t v11 = *((void *)&v21 + 1);
    }
    else {
      unint64_t v11 = *(void *)(a2 + 16) - *(void *)v2;
    }
    if (v11) {
      sg_vec_ns::details::buffer_iterator::operator+=((sg_vec_ns::details::buffer_iterator *)&v15, v11);
    }
    else {
      sg_vec_ns::details::buffer_iterator::operator++((sg_vec_ns::details::buffer_iterator *)&v15);
    }
    v4 += v11;
  }

  while ((unint64_t)v16 < *(void *)(a2 + 16));
  uint64_t v8 = v20;
  if (v20)
  {
LABEL_19:
    unint64_t v12 = (unint64_t *)&v8->__shared_owners_;
    do
      unint64_t v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }

  return v4;
}

void sub_188165644(_Unwind_Exception *a1)
{
}

uint64_t sg_vec_ns::details::sg_vec_iterator::operator+=(uint64_t a1, unint64_t a2)
{
  *(void *)(a1 + 144) += a2;
  sg_vec_ns::details::buffer_iterator::operator+=((sg_vec_ns::details::buffer_iterator *)(a1 + 56), a2);
  if (*(void *)(a1 + 80) != *(void *)(a1 + 72))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = *(std::__shared_weak_count **)(v3 + 216);
    uint64_t v20 = *(void *)(v3 + 208);
    __int128 v21 = v4;
    if (v4)
    {
      uint64_t p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        unint64_t v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }

    v22[0] = *(_OWORD *)(v3 + 224);
    *(_OWORD *)((char *)v22 + 9) = *(_OWORD *)(v3 + 233);
    uint64_t v23 = *(void *)(v3 + 256);
    __int128 v24 = *(_OWORD *)(v3 + 264);
    char v27 = *(_BYTE *)(v3 + 312);
    __int128 v25 = *(_OWORD *)(v3 + 280);
    __int128 v26 = *(_OWORD *)(v3 + 296);
    __int128 v7 = *(std::__shared_weak_count **)(v3 + 328);
    uint64_t v28 = *(void *)(v3 + 320);
    unint64_t v29 = v7;
    if (v7)
    {
      uint64_t v8 = (unint64_t *)&v7->__shared_owners_;
      do
        unint64_t v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }

    __int128 v30 = *(_OWORD *)(v3 + 336);
    uint64_t v31 = *(void *)(v3 + 352);
    char v32 = *(_BYTE *)(v3 + 360);
    sg_vec_ns::details::sg_vec_iterator::make_val( (sg_vec_ns::details::sg_vec_iterator *)a1,  (const sg_vec_ns::details::sg_vec_iterator *)&v20,  (uint64_t)&v33);
    std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100](a1, &v33);
    *(_OWORD *)(a1 + 16) = v34[0];
    *(_OWORD *)(a1 + 25) = *(_OWORD *)((char *)v34 + 9);
    unint64_t v10 = (std::__shared_weak_count *)*((void *)&v33 + 1);
    if (*((void *)&v33 + 1))
    {
      unint64_t v11 = (unint64_t *)(*((void *)&v33 + 1) + 8LL);
      do
        unint64_t v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }

    unint64_t v13 = v29;
    if (v29)
    {
      __int128 v14 = (unint64_t *)&v29->__shared_owners_;
      do
        unint64_t v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }

    __int128 v16 = v21;
    if (v21)
    {
      __int128 v17 = (unint64_t *)&v21->__shared_owners_;
      do
        unint64_t v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }

  return a1;
}

{
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v20;
  std::__shared_weak_count *v21;
  _OWORD v22[2];
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  _OWORD v34[2];
  *(void *)(a1 + 144) += a2;
  sg_vec_ns::details::buffer_iterator::operator+=((sg_vec_ns::details::buffer_iterator *)(a1 + 56), a2);
  if (*(void *)(a1 + 80) != *(void *)(a1 + 72))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = *(std::__shared_weak_count **)(v3 + 216);
    uint64_t v20 = *(void *)(v3 + 208);
    __int128 v21 = v4;
    if (v4)
    {
      uint64_t p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        unint64_t v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }

    v22[0] = *(_OWORD *)(v3 + 224);
    *(_OWORD *)((char *)v22 + 9) = *(_OWORD *)(v3 + 233);
    uint64_t v23 = *(void *)(v3 + 256);
    __int128 v24 = *(_OWORD *)(v3 + 264);
    char v27 = *(_BYTE *)(v3 + 312);
    __int128 v25 = *(_OWORD *)(v3 + 280);
    __int128 v26 = *(_OWORD *)(v3 + 296);
    __int128 v7 = *(std::__shared_weak_count **)(v3 + 328);
    uint64_t v28 = *(void *)(v3 + 320);
    unint64_t v29 = v7;
    if (v7)
    {
      uint64_t v8 = (unint64_t *)&v7->__shared_owners_;
      do
        unint64_t v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }

    __int128 v30 = *(_OWORD *)(v3 + 336);
    uint64_t v31 = *(void *)(v3 + 352);
    char v32 = *(_BYTE *)(v3 + 360);
    sg_vec_ns::details::sg_vec_iterator::make_val( (sg_vec_ns::details::sg_vec_iterator *)a1,  (const sg_vec_ns::details::sg_vec_iterator *)&v20,  (uint64_t)&v33);
    std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100](a1, &v33);
    *(_OWORD *)(a1 + 16) = v34[0];
    *(_OWORD *)(a1 + 25) = *(_OWORD *)((char *)v34 + 9);
    unint64_t v10 = (std::__shared_weak_count *)*((void *)&v33 + 1);
    if (*((void *)&v33 + 1))
    {
      unint64_t v11 = (unint64_t *)(*((void *)&v33 + 1) + 8LL);
      do
        unint64_t v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }

    unint64_t v13 = v29;
    if (v29)
    {
      __int128 v14 = (unint64_t *)&v29->__shared_owners_;
      do
        unint64_t v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }

    __int128 v16 = v21;
    if (v21)
    {
      __int128 v17 = (unint64_t *)&v21->__shared_owners_;
      do
        unint64_t v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }

  return a1;
}

void sub_188165814( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1881659EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sg_vec_ns::details::sg_vec_iterator::operator++(uint64_t a1)
{
  if (*(void *)(a1 + 80) != *(void *)(a1 + 72))
  {
    uint64_t v2 = *(void *)(a1 + 48);
    uint64_t v3 = *(std::__shared_weak_count **)(v2 + 216);
    uint64_t v19 = *(void *)(v2 + 208);
    uint64_t v20 = v3;
    if (v3)
    {
      uint64_t p_shared_owners = (unint64_t *)&v3->__shared_owners_;
      do
        unint64_t v5 = __ldxr(p_shared_owners);
      while (__stxr(v5 + 1, p_shared_owners));
    }

    v21[0] = *(_OWORD *)(v2 + 224);
    *(_OWORD *)((char *)v21 + 9) = *(_OWORD *)(v2 + 233);
    uint64_t v22 = *(void *)(v2 + 256);
    __int128 v23 = *(_OWORD *)(v2 + 264);
    char v26 = *(_BYTE *)(v2 + 312);
    __int128 v24 = *(_OWORD *)(v2 + 280);
    __int128 v25 = *(_OWORD *)(v2 + 296);
    unint64_t v6 = *(std::__shared_weak_count **)(v2 + 328);
    uint64_t v27 = *(void *)(v2 + 320);
    uint64_t v28 = v6;
    if (v6)
    {
      __int128 v7 = (unint64_t *)&v6->__shared_owners_;
      do
        unint64_t v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }

    __int128 v29 = *(_OWORD *)(v2 + 336);
    uint64_t v30 = *(void *)(v2 + 352);
    char v31 = *(_BYTE *)(v2 + 360);
    sg_vec_ns::details::sg_vec_iterator::make_val( (sg_vec_ns::details::sg_vec_iterator *)a1,  (const sg_vec_ns::details::sg_vec_iterator *)&v19,  (uint64_t)&v32);
    std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100](a1, &v32);
    *(_OWORD *)(a1 + 16) = v33[0];
    *(_OWORD *)(a1 + 25) = *(_OWORD *)((char *)v33 + 9);
    uint64_t v9 = (std::__shared_weak_count *)*((void *)&v32 + 1);
    if (*((void *)&v32 + 1))
    {
      unint64_t v10 = (unint64_t *)(*((void *)&v32 + 1) + 8LL);
      do
        unint64_t v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }

    unint64_t v12 = v28;
    if (v28)
    {
      unint64_t v13 = (unint64_t *)&v28->__shared_owners_;
      do
        unint64_t v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }

    unint64_t v15 = v20;
    if (v20)
    {
      __int128 v16 = (unint64_t *)&v20->__shared_owners_;
      do
        unint64_t v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }

  return a1;
}

void sub_188165BB8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL sg_vec_ns::details::sg_vec_iterator::is_end_of_buffers(sg_vec_ns::details::sg_vec_iterator *this)
{
  return *((void *)this + 10) == *((void *)this + 9);
}

void sg_vec_ns::details::sg_vec_iterator::subvec( sg_vec_ns::details::sg_vec_iterator *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6 = *((void *)a1 + 3);
  unsigned int v7 = *(unsigned __int8 *)(a2 + 16);
  if (v6 >= (unint64_t)(v7 & 1) + *(void *)(a2 + 8) - 1)
  {
    sg_vec_ns::details::sg_vec_iterator::sg_vec_iterator(a4, a3);
    sg_vec_ns::details::sg_vec_iterator::sg_vec_iterator(a4 + 160, a3);
    return;
  }

  unint64_t v10 = *((void *)a1 + 2) + v6;
  char v11 = v7 & 2;
  unint64_t v12 = *(void *)a2;
  if ((v7 & 2) != 0) {
    unint64_t v13 = *(void *)a2;
  }
  else {
    unint64_t v13 = v12 + 1;
  }
  if (v10 > v13)
  {
LABEL_91:
    if (v11) {
      unint64_t v81 = v12;
    }
    else {
      unint64_t v81 = v12 + 1;
    }
    unint64_t v82 = v81 - v6;
    if (v81 < v6)
    {
      if (v7)
      {
        if (v7 == 3)
        {
          unint64_t v83 = *(void *)(a2 + 8);
          if (v83 < v12) {
            goto LABEL_107;
          }
        }

        else
        {
          unint64_t v83 = *(void *)(a2 + 8);
          if (v12 >= v83)
          {
LABEL_107:
            uint64_t v85 = boost::icl::identity_element<unsigned long long>::value(void)::_value;
            goto LABEL_108;
          }
        }
      }

      else
      {
        unint64_t v83 = *(void *)(a2 + 8);
        if (v12 >= v83 || v12 + 1 >= v83) {
          goto LABEL_107;
        }
      }

      uint64_t v85 = (v7 & 1) - v12 + (int)(((v7 >> 1) & 1) - 1) + v83;
LABEL_108:
      unint64_t v86 = v85 + v81;
      unint64_t v87 = (sg_vec_ref *)*((void *)a1 + 6);
      if (*(void *)(a3 + 144) >= v86) {
        unint64_t v88 = v86;
      }
      else {
        unint64_t v88 = *(void *)(a3 + 144);
      }
      uint64_t v89 = a4;
      v90 = a1;
      unint64_t v82 = 0LL;
LABEL_121:
      sg_vec_ref::subvec(v87, v90, v88, v82, v89);
      return;
    }

    if (v7)
    {
      if (v7 == 3)
      {
        unint64_t v84 = *(void *)(a2 + 8);
        if (v84 < v12) {
          goto LABEL_116;
        }
      }

      else
      {
        unint64_t v84 = *(void *)(a2 + 8);
        if (v12 >= v84)
        {
LABEL_116:
          uint64_t v91 = boost::icl::identity_element<unsigned long long>::value(void)::_value;
          goto LABEL_117;
        }
      }
    }

    else
    {
      unint64_t v84 = *(void *)(a2 + 8);
      if (v12 >= v84 || v12 + 1 >= v84) {
        goto LABEL_116;
      }
    }

    uint64_t v91 = (v7 & 1) - v12 + (int)(((v7 >> 1) & 1) - 1) + v84;
LABEL_117:
    unint64_t v92 = v91 + v81;
    unint64_t v87 = (sg_vec_ref *)*((void *)a1 + 6);
    if (*(void *)(a3 + 144) >= v92) {
      unint64_t v88 = v92;
    }
    else {
      unint64_t v88 = *(void *)(a3 + 144);
    }
    uint64_t v89 = a4;
    v90 = a1;
    goto LABEL_121;
  }

  uint64_t v14 = *((void *)a1 + 6);
  unint64_t v15 = (std::__shared_weak_count *)*((void *)a1 + 1);
  uint64_t v119 = *(void *)a1;
  unint64_t v120 = v15;
  if (v15)
  {
    uint64_t p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      unint64_t v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
    uint64_t v18 = *((void *)a1 + 6);
  }

  else
  {
    uint64_t v18 = v14;
  }

  v121[0] = *((_OWORD *)a1 + 1);
  *(_OWORD *)((char *)v121 + 9) = *(_OWORD *)((char *)a1 + 25);
  uint64_t v122 = v18;
  __int128 v123 = *(_OWORD *)((char *)a1 + 56);
  __int128 v124 = *(_OWORD *)((char *)a1 + 72);
  __int128 v125 = *(_OWORD *)((char *)a1 + 88);
  char v126 = *((_BYTE *)a1 + 104);
  uint64_t v19 = (std::__shared_weak_count *)*((void *)a1 + 15);
  uint64_t v127 = *((void *)a1 + 14);
  uint64_t v128 = v19;
  if (v19)
  {
    uint64_t v20 = (unint64_t *)&v19->__shared_owners_;
    do
      unint64_t v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
  }

  __int128 v129 = *((_OWORD *)a1 + 8);
  uint64_t v130 = *((void *)a1 + 18);
  char v131 = *((_BYTE *)a1 + 152);
  while (!sg_vec_ns::details::sg_vec_iterator::operator==((uint64_t)&v119, a3))
  {
    v10 += *(void *)&v121[0];
    unint64_t v22 = *(void *)a2;
    if ((*(_BYTE *)(a2 + 16) & 2) == 0) {
      ++v22;
    }
    if (v10 >= v22) {
      break;
    }
    sg_vec_ns::details::sg_vec_iterator::operator++((uint64_t)&v119);
  }

  __int128 v23 = *(std::__shared_weak_count **)(v14 + 216);
  uint64_t v106 = *(void *)(v14 + 208);
  v107 = v23;
  if (v23)
  {
    __int128 v24 = (unint64_t *)&v23->__shared_owners_;
    do
      unint64_t v25 = __ldxr(v24);
    while (__stxr(v25 + 1, v24));
  }

  v108[0] = *(_OWORD *)(v14 + 224);
  *(_OWORD *)((char *)v108 + 9) = *(_OWORD *)(v14 + 233);
  char v26 = (__int128 *)(v14 + 264);
  __int128 v110 = *(_OWORD *)(v14 + 264);
  __int128 v27 = *(_OWORD *)(v14 + 296);
  __int128 v111 = *(_OWORD *)(v14 + 280);
  uint64_t v109 = *(void *)(v14 + 256);
  char v113 = *(_BYTE *)(v14 + 312);
  __int128 v112 = v27;
  uint64_t v28 = *(std::__shared_weak_count **)(v14 + 328);
  uint64_t v114 = *(void *)(v14 + 320);
  v115 = v28;
  if (v28)
  {
    __int128 v29 = (unint64_t *)&v28->__shared_owners_;
    do
      unint64_t v30 = __ldxr(v29);
    while (__stxr(v30 + 1, v29));
  }

  __int128 v116 = *(_OWORD *)(v14 + 336);
  uint64_t v117 = *(void *)(v14 + 352);
  char v118 = *(_BYTE *)(v14 + 360);
  BOOL v31 = sg_vec_ns::details::sg_vec_iterator::operator==((uint64_t)&v119, (uint64_t)&v106);
  if (v28)
  {
    __int128 v32 = (unint64_t *)&v28->__shared_owners_;
    do
      unint64_t v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }

  BOOL v34 = v107;
  if (v107)
  {
    unint64_t v35 = (unint64_t *)&v107->__shared_owners_;
    do
      unint64_t v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
      if (v31) {
        goto LABEL_37;
      }
      goto LABEL_80;
    }
  }

  if (!v31)
  {
LABEL_80:
    unint64_t v75 = v128;
    if (v128)
    {
      v76 = (unint64_t *)&v128->__shared_owners_;
      do
        unint64_t v77 = __ldaxr(v76);
      while (__stlxr(v77 - 1, v76));
      if (!v77)
      {
        ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
        std::__shared_weak_count::__release_weak(v75);
      }
    }

    unint64_t v78 = v120;
    if (v120)
    {
      v79 = (unint64_t *)&v120->__shared_owners_;
      do
        unint64_t v80 = __ldaxr(v79);
      while (__stlxr(v80 - 1, v79));
      if (!v80)
      {
        ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
        std::__shared_weak_count::__release_weak(v78);
      }
    }

    unsigned int v7 = *(unsigned __int8 *)(a2 + 16);
    unint64_t v12 = *(void *)a2;
    unint64_t v6 = *((void *)a1 + 3);
    char v11 = v7 & 2;
    goto LABEL_91;
  }

void sub_1881662E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, char a30)
{
}

void sg_vec_ns::details::sg_vec_iterator::subvec( sg_vec_ns::details::sg_vec_iterator *this@<X0>, const sg_vec_ns::details::sg_vec_iterator *a2@<X2>, unint64_t a3@<X1>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v6 = (sg_vec_ref *)*((void *)this + 6);
  if (*((void *)a2 + 18) >= a3) {
    unint64_t v7 = a3;
  }
  else {
    unint64_t v7 = *((void *)a2 + 18);
  }
  sg_vec_ref::subvec(v6, this, v7, a4, a5);
}

sg_vec_ns::details::sg_vec_iterator *sg_vec_ns::details::sg_vec_iterator::sg_vec_iterator( sg_vec_ns::details::sg_vec_iterator *this, sg_vec_ref *a2, const sg_vec_ns::details::buffer_iterator *a3, char a4)
{
  *(_OWORD *)((char *)this + 25) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((void *)this + 6) = a2;
  *((void *)this + 7) = *(void *)a3;
  *((void *)this + 8) = *((void *)a3 + 1);
  __int128 v6 = *((_OWORD *)a3 + 1);
  __int128 v7 = *((_OWORD *)a3 + 2);
  *((_BYTE *)this + 104) = *((_BYTE *)a3 + 48);
  *(_OWORD *)((char *)this + 88) = v7;
  *(_OWORD *)((char *)this + 72) = v6;
  *((void *)this + 14) = *((void *)a3 + 7);
  uint64_t v8 = *((void *)a3 + 8);
  *((void *)this + 15) = v8;
  if (v8)
  {
    uint64_t v9 = (unint64_t *)(v8 + 8);
    do
      unint64_t v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }

  char v11 = (__int128 *)((char *)a3 + 16);
  *((_OWORD *)this + 8) = *(_OWORD *)((char *)a3 + 72);
  *((_BYTE *)this + std::shared_ptr<char>::~shared_ptr[abi:ne180100](v1 + 152) = a4;
  uint64_t v12 = *(void *)a3;
  if (*(_OWORD *)a3 == *((_OWORD *)a2 + 6) && *(void *)v11 == *((void *)a2 + 14))
  {
    *((void *)this + 18) = *((void *)a2 + 23) + *((void *)a2 + 24);
  }

  else
  {
    __int128 v73 = *(_OWORD *)((char *)a2 + 8);
    __int128 v74 = *(_OWORD *)((char *)a2 + 24);
    __int128 v75 = *(_OWORD *)((char *)a2 + 40);
    char v76 = *((_BYTE *)a2 + 56);
    unint64_t v13 = (std::__shared_weak_count *)*((void *)a2 + 9);
    uint64_t v77 = *((void *)a2 + 8);
    unint64_t v78 = v13;
    if (v13)
    {
      uint64_t p_shared_owners = (unint64_t *)&v13->__shared_owners_;
      do
        unint64_t v15 = __ldxr(p_shared_owners);
      while (__stxr(v15 + 1, p_shared_owners));
      uint64_t v12 = *(void *)a3;
    }

    __int128 v79 = *((_OWORD *)a2 + 5);
    uint64_t v16 = *((void *)a3 + 1);
    uint64_t v65 = v12;
    uint64_t v66 = v16;
    __int128 v17 = *((_OWORD *)a3 + 2);
    __int128 v67 = *v11;
    __int128 v68 = v17;
    char v69 = *((_BYTE *)a3 + 48);
    uint64_t v18 = (std::__shared_weak_count *)*((void *)a3 + 8);
    uint64_t v70 = *((void *)a3 + 7);
    unint64_t v71 = v18;
    if (v18)
    {
      uint64_t v19 = (unint64_t *)&v18->__shared_owners_;
      do
        unint64_t v20 = __ldxr(v19);
      while (__stxr(v20 + 1, v19));
    }

    int v21 = 0;
    __int128 v72 = *(_OWORD *)((char *)a3 + 72);
    while ((void)v73 != v65 || *((void *)&v73 + 1) != v66 || (void)v74 != (void)v67)
    {
      sg_vec_ns::details::buffer_iterator::sync((sg_vec_ns::details::buffer_iterator *)&v73);
      unint64_t v22 = v78;
      if (v78)
      {
        __int128 v23 = (unint64_t *)&v78->__shared_owners_;
        do
          unint64_t v24 = __ldxr(v23);
        while (__stxr(v24 + 1, v23));
        int v25 = DWORD2(v79);
        do
          unint64_t v26 = __ldaxr(v23);
        while (__stlxr(v26 - 1, v23));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }

      else
      {
        int v25 = DWORD2(v79);
      }

      v21 += v25;
      sg_vec_ns::details::buffer_iterator::operator++((sg_vec_ns::details::buffer_iterator *)&v73);
    }

    *((void *)this + 18) = *((void *)a2 + 23) + v21;
    if (v71)
    {
      __int128 v27 = &v71->__shared_owners_;
      do
        unint64_t v28 = __ldaxr((unint64_t *)v27);
      while (__stlxr(v28 - 1, (unint64_t *)v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
        std::__shared_weak_count::__release_weak(v71);
      }
    }

    __int128 v29 = v78;
    if (v78)
    {
      uint64_t v30 = (unint64_t *)&v78->__shared_owners_;
      do
        unint64_t v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }

    __int128 v32 = (std::__shared_weak_count *)*((void *)a2 + 27);
    uint64_t v50 = *((void *)a2 + 26);
    __int128 v51 = v32;
    if (v32)
    {
      unint64_t v33 = (unint64_t *)&v32->__shared_owners_;
      do
        unint64_t v34 = __ldxr(v33);
      while (__stxr(v34 + 1, v33));
    }

    v52[0] = *((_OWORD *)a2 + 14);
    *(_OWORD *)((char *)v52 + 9) = *(_OWORD *)((char *)a2 + 233);
    uint64_t v53 = *((void *)a2 + 32);
    __int128 v35 = *(_OWORD *)((char *)a2 + 264);
    char v57 = *((_BYTE *)a2 + 312);
    __int128 v36 = *(_OWORD *)((char *)a2 + 280);
    __int128 v54 = v35;
    __int128 v55 = v36;
    __int128 v56 = *(_OWORD *)((char *)a2 + 296);
    __int128 v37 = (std::__shared_weak_count *)*((void *)a2 + 41);
    uint64_t v58 = *((void *)a2 + 40);
    unint64_t v59 = v37;
    if (v37)
    {
      unint64_t v38 = (unint64_t *)&v37->__shared_owners_;
      do
        unint64_t v39 = __ldxr(v38);
      while (__stxr(v39 + 1, v38));
    }

    __int128 v60 = *((_OWORD *)a2 + 21);
    uint64_t v61 = *((void *)a2 + 44);
    char v62 = *((_BYTE *)a2 + 360);
    sg_vec_ns::details::sg_vec_iterator::make_val( this,  (const sg_vec_ns::details::sg_vec_iterator *)&v50,  (uint64_t)&v63);
    std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100]((uint64_t)this, &v63);
    *((_OWORD *)this + 1) = v64[0];
    *(_OWORD *)((char *)this + 25) = *(_OWORD *)((char *)v64 + 9);
    unint64_t v40 = (std::__shared_weak_count *)*((void *)&v63 + 1);
    if (*((void *)&v63 + 1))
    {
      unint64_t v41 = (unint64_t *)(*((void *)&v63 + 1) + 8LL);
      do
        unint64_t v42 = __ldaxr(v41);
      while (__stlxr(v42 - 1, v41));
      if (!v42)
      {
        ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
        std::__shared_weak_count::__release_weak(v40);
      }
    }

    unint64_t v43 = v59;
    if (v59)
    {
      unint64_t v44 = (unint64_t *)&v59->__shared_owners_;
      do
        unint64_t v45 = __ldaxr(v44);
      while (__stlxr(v45 - 1, v44));
      if (!v45)
      {
        ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
        std::__shared_weak_count::__release_weak(v43);
      }
    }

    unint64_t v46 = v51;
    if (v51)
    {
      unint64_t v47 = (unint64_t *)&v51->__shared_owners_;
      do
        unint64_t v48 = __ldaxr(v47);
      while (__stlxr(v48 - 1, v47));
      if (!v48)
      {
        ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
        std::__shared_weak_count::__release_weak(v46);
      }
    }
  }

  return this;
}

void sub_18816675C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sg_vec_ns::details::sg_vec_iterator::get_cow(sg_vec_ns::details::sg_vec_iterator *this)
{
  return *(unsigned __int8 *)(*((void *)this + 6) + 200LL);
}

void sg_vec_ns::generate_vec_ref( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, sg_vec_ref *a6@<X8>)
{
  unint64_t v6 = *(void *)(a2 + 144) - a3;
  if (v6 <= a4) {
    unint64_t v6 = a4;
  }
  if (v6 < a5) {
    a5 = v6;
  }
  sg_vec_ref::sg_vec_ref( a6,  (const sg_vec_ns::details::buffer_iterator *)(a1 + 56),  (const sg_vec_ns::details::buffer_iterator *)(a2 + 56),  a3,  a5,  *(_BYTE *)(*(void *)(a1 + 48) + 200LL));
}

BOOL sg_vec_ns::should_create_new_sg_vec_ref( sg_vec_ns *this, const sg_vec_ns::details::sg_vec_iterator *a2, const sg_vec_ns::details::sg_vec_iterator *a3, unint64_t a4)
{
  unint64_t v4 = *((void *)this + 18);
  return v4 > (unint64_t)a3 || *((void *)a2 + 18) - v4 < a4;
}

uint64_t sg_vec_ns::make@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  void v13[15] = *MEMORY[0x1895F89C0];
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  if (v4)
  {
    unint64_t v6 = (unint64_t *)(v4 + 8);
    do
      unint64_t v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }

  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  char v11 = v13;
  v13[0] = v5;
  v13[1] = v4;
  v13[2] = v9;
  __int128 v12 = xmmword_188178820;
  sg_vec::sg_vec(a2, (uint64_t)&v11, v8, a1[2]);
  return boost::container::vector<std::pair<std::shared_ptr<char>,unsigned long>,boost::container::small_vector_allocator<std::pair<std::shared_ptr<char>,unsigned long>,boost::container::new_allocator<void>,void>,void>::~vector((uint64_t)&v11);
}

void sub_1881668AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  boost::container::vector<std::pair<std::shared_ptr<char>,unsigned long>,boost::container::small_vector_allocator<std::pair<std::shared_ptr<char>,unsigned long>,boost::container::new_allocator<void>,void>,void>::~vector((uint64_t)va1);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

__n128 std::pair<sg_vec_ns::details::sg_vec_iterator,sg_vec_ns::details::sg_vec_iterator>::pair[abi:ne180100]<sg_vec_ns::details::sg_vec_iterator,sg_vec_ns::details::sg_vec_iterator,0>( uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)a2 = 0LL;
  *(void *)(a2 + 8) = 0LL;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(_OWORD *)(a1 + 16) = v3;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + std::shared_ptr<char>::~shared_ptr[abi:ne180100](v1 + 64) = *(void *)(a2 + 64);
  __int128 v4 = *(_OWORD *)(a2 + 72);
  __int128 v5 = *(_OWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = v5;
  *(_OWORD *)(a1 + 72) = v4;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(void *)(a2 + 112) = 0LL;
  *(void *)(a2 + 120) = 0LL;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  uint64_t v6 = *(void *)(a2 + 144);
  *(_BYTE *)(a1 + std::shared_ptr<char>::~shared_ptr[abi:ne180100](v1 + 152) = *(_BYTE *)(a2 + 152);
  *(void *)(a1 + 144) = v6;
  *(_OWORD *)(a1 + 160) = *(_OWORD *)a3;
  *(void *)a3 = 0LL;
  *(void *)(a3 + 8) = 0LL;
  __int128 v7 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(a1 + 185) = *(_OWORD *)(a3 + 25);
  *(_OWORD *)(a1 + 176) = v7;
  *(void *)(a1 + 208) = *(void *)(a3 + 48);
  *(void *)(a1 + 216) = *(void *)(a3 + 56);
  *(void *)(a1 + 224) = *(void *)(a3 + 64);
  __int128 v8 = *(_OWORD *)(a3 + 72);
  __int128 v9 = *(_OWORD *)(a3 + 88);
  *(_BYTE *)(a1 + 2std::shared_ptr<char>::~shared_ptr[abi:ne180100](v1 + 64) = *(_BYTE *)(a3 + 104);
  *(_OWORD *)(a1 + std::shared_ptr<char>::~shared_ptr[abi:ne180100](v31 - 248) = v9;
  *(_OWORD *)(a1 + 232) = v8;
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a3 + 112);
  *(void *)(a3 + 112) = 0LL;
  *(void *)(a3 + 120) = 0LL;
  __n128 result = *(__n128 *)(a3 + 128);
  *(__n128 *)(a1 + 288) = result;
  uint64_t v11 = *(void *)(a3 + 144);
  *(_BYTE *)(a1 + 312) = *(_BYTE *)(a3 + 152);
  *(void *)(a1 + 304) = v11;
  return result;
}

uint64_t zero_sg_entry(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void *trim_sg_to_interval@<X0>(void *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v3 = result[3];
  unsigned int v4 = *(unsigned __int8 *)(a2 + 16);
  unint64_t v5 = *(void *)(a2 + 8);
  if (v3 > (v4 & 1) + v5 - 1
    || ((uint64_t v6 = result[2], v7 = v6 + v3, v8 = *(void *)a2, (v4 & 2) != 0) ? (v9 = *(void *)a2) : (v9 = v8 + 1),
        v7 <= v9))
  {
    *(_OWORD *)(a3 + 25) = 0u;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return result;
  }

  unint64_t v10 = v9 - v3;
  if (v9 >= v3)
  {
    if (*(_BYTE *)(a2 + 16))
    {
      if (v4 == 3)
      {
        if (v5 < v8) {
          goto LABEL_31;
        }
      }

      else if (v8 >= v5)
      {
LABEL_31:
        unint64_t v18 = boost::icl::identity_element<unsigned long long>::value(void)::_value;
        goto LABEL_32;
      }
    }

    else if (v8 >= v5 || v8 + 1 >= v5)
    {
      goto LABEL_31;
    }

    unint64_t v18 = v5 + (v4 & 1) + (int)(((v4 >> 1) & 1) - 1) - v8;
LABEL_32:
    if (v6 - v10 < v18) {
      unint64_t v18 = v6 - v10;
    }
    uint64_t v19 = result[4];
    uint64_t v20 = result[1];
    *(void *)a3 = *result + v10;
    *(void *)(a3 + 8) = v20;
    if (v20)
    {
      int v21 = (unint64_t *)(v20 + 8);
      do
        unint64_t v22 = __ldxr(v21);
      while (__stxr(v22 + 1, v21));
    }

    *(void *)(a3 + 16) = v18;
    *(void *)(a3 + 24) = v9;
    *(void *)(a3 + 32) = v19 - v10;
    goto LABEL_38;
  }

  if (*(_BYTE *)(a2 + 16))
  {
    if (v4 == 3)
    {
      if (v5 < v8) {
        goto LABEL_20;
      }
    }

    else if (v8 >= v5)
    {
LABEL_20:
      uint64_t v11 = boost::icl::identity_element<unsigned long long>::value(void)::_value;
      goto LABEL_21;
    }
  }

  else if (v8 >= v5 || v8 + 1 >= v5)
  {
    goto LABEL_20;
  }

  uint64_t v11 = v5 + (v4 & 1) + (int)(((v4 >> 1) & 1) - 1) - v8;
LABEL_21:
  unint64_t v12 = v11 + v9;
  if (v12 >= v7) {
    unint64_t v12 = v6 + v3;
  }
  unint64_t v13 = v12 - v3;
  uint64_t v14 = result[4];
  uint64_t v15 = result[1];
  *(void *)a3 = *result;
  *(void *)(a3 + 8) = v15;
  if (v15)
  {
    uint64_t v16 = (unint64_t *)(v15 + 8);
    do
      unint64_t v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }

  *(void *)(a3 + 16) = v13;
  *(void *)(a3 + 24) = v3;
  *(void *)(a3 + 32) = v14;
LABEL_38:
  *(_BYTE *)(a3 + 40) = 0;
  return result;
}

gcd::gcd_group *gcd::gcd_group::gcd_group(gcd::gcd_group *this)
{
  *(void *)this = dispatch_group_create();
  return this;
}

void gcd::gcd_group::~gcd_group(dispatch_object_s **this)
{
  uint64_t v1 = *this;
  if (v1) {
    dispatch_release(v1);
  }
}

uint64_t gcd::gcd_group::wait(dispatch_group_t *this, dispatch_time_t a2)
{
  return dispatch_group_wait(*this, a2);
}

dispatch_queue_t *gcd::gcd_queue::gcd_queue(dispatch_queue_t *a1, char *label, int a3)
{
  switch(a3)
  {
    case 2:
      uint64_t v6 = (dispatch_queue_attr_s *)MEMORY[0x1895F8AF8];
      unint64_t v5 = label;
      goto LABEL_6;
    case 1:
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
      dispatch_queue_t v7 = dispatch_queue_create_with_target_V2(label, 0LL, global_queue);
      goto LABEL_8;
    case 0:
      unint64_t v5 = label;
      uint64_t v6 = 0LL;
LABEL_6:
      dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
LABEL_8:
      *a1 = v7;
      break;
  }

  return a1;
}

void *gcd::gcd_queue::gcd_queue(void *result, void *a2)
{
  unint64_t *result = *a2;
  *a2 = 0LL;
  return result;
}

void gcd::gcd_queue::async(dispatch_queue_t *a1, void *a2)
{
}

void gcd::gcd_queue::async(dispatch_queue_t *a1, dispatch_group_t *a2, void *a3)
{
}

void gcd::gcd_queue::async(dispatch_queue_t *a1, dispatch_block_t *a2, uint64_t a3)
{
  dispatch_block_t v4 = *a2;
  if (v4)
  {
    if (a3)
    {
      dispatch_time_t v6 = dispatch_time(0LL, 1000 * a3);
      dispatch_after(v6, *a1, *a2);
    }

    else
    {
      dispatch_async(*a1, v4);
    }
  }

void gcd::gcd_queue::sync(dispatch_queue_t *a1, void *a2)
{
}

void gcd::gcd_queue::barrier_async(dispatch_queue_t *a1, void *a2)
{
}

void gcd::gcd_queue::barrier_sync(dispatch_queue_t *a1, void *a2)
{
}

void gcd::gcd_queue::suspend(dispatch_object_t *this)
{
}

void gcd::gcd_queue::resume(dispatch_object_t *this)
{
}

uint64_t gcd::gcd_queue::set_target_priority(dispatch_object_t *a1, int a2)
{
  else {
    uint64_t v3 = *(void *)&asc_188184958[8 * a2 - 8];
  }
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(v3, 0LL);
  if (!global_queue) {
    return 22LL;
  }
  dispatch_set_target_queue(*a1, global_queue);
  return 0LL;
}

gcd::gcd_semaphore *gcd::gcd_semaphore::gcd_semaphore(gcd::gcd_semaphore *this, uint64_t value)
{
  *(void *)this = dispatch_semaphore_create(value);
  return this;
}

uint64_t gcd::gcd_semaphore::wait(dispatch_semaphore_t *this, dispatch_time_t a2)
{
  return dispatch_semaphore_wait(*this, a2);
}

uint64_t gcd::gcd_semaphore::signal(dispatch_semaphore_t *this)
{
  return dispatch_semaphore_signal(*this);
}

dispatch_block_t *gcd::gcd_block::gcd_block(dispatch_block_t *a1, void *a2)
{
  *a1 = dispatch_block_create((dispatch_block_flags_t)0LL, a2);
  return a1;
}

void gcd::gcd_block::cancel(void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    dispatch_block_cancel(v1);
  }
}

void gcd::gcd_block::~gcd_block(const void **this)
{
  uint64_t v2 = (void *)*this;
  if (v2)
  {
    dispatch_block_cancel(v2);
    if (*this) {
      _Block_release(*this);
    }
  }

std::string *workqueue::workqueue::workqueue(std::string *this, __int128 *a2, unint64_t a3)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v5 = *a2;
    this->__r_.__value_.__l.__cap_ = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }

  *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&this[1].__r_.__value_.__r.__words[2] = 0u;
  this[2].__r_.__value_.__s.__data_[8] = a3 != 0;
  if (a3)
  {
    std::vector<gcd::gcd_queue>::reserve(this[1].__r_.__value_.__r.__words, a3);
    do
    {
      dispatch_time_t v6 = this;
      gcd::gcd_queue::gcd_queue(&v9, v6, 0LL);
      std::vector<gcd::gcd_queue>::emplace_back<gcd::gcd_queue>(this[1].__r_.__value_.__r.__words, &v9);
      gcd::gcd_group::~gcd_group(&v9);
      --a3;
    }

    while (a3);
  }

  else
  {
    dispatch_queue_t v7 = this;
    gcd::gcd_queue::gcd_queue(&v9, v7, 2LL);
    std::vector<gcd::gcd_queue>::emplace_back<gcd::gcd_queue>(this[1].__r_.__value_.__r.__words, &v9);
    gcd::gcd_group::~gcd_group(&v9);
  }

  return this;
}

void sub_188166EF4(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t std::vector<gcd::gcd_queue>::reserve(void *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<iovec>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::allocator<std::unique_ptr<diskimage_uio::stack_image_node const>>::allocate_at_least[abi:ne180100]( result,  a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 8 * v6;
    std::vector<gcd::gcd_queue>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<gcd::gcd_queue>::~__split_buffer((uint64_t)v7);
  }

  return result;
}

void sub_188166FB4(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

unint64_t std::vector<gcd::gcd_queue>::emplace_back<gcd::gcd_queue>(void *a1, void *a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v9 = (uint64_t)(v7 - *a1) >> 3;
    uint64_t v10 = v5 - *a1;
    uint64_t v11 = v10 >> 2;
    else {
      unint64_t v12 = v11;
    }
    uint64_t v19 = v4;
    if (v12) {
      unint64_t v13 = (char *)std::allocator<std::unique_ptr<diskimage_uio::stack_image_node const>>::allocate_at_least[abi:ne180100]( v4,  v12);
    }
    else {
      unint64_t v13 = 0LL;
    }
    uint64_t v15 = v13;
    uint64_t v16 = &v13[8 * v9];
    unint64_t v18 = &v13[8 * v12];
    gcd::gcd_queue::gcd_queue(v16, a2);
    unint64_t v17 = v16 + 8;
    std::vector<gcd::gcd_queue>::__swap_out_circular_buffer(a1, &v15);
    unint64_t v8 = a1[1];
    std::__split_buffer<gcd::gcd_queue>::~__split_buffer((uint64_t)&v15);
  }

  else
  {
    gcd::gcd_queue::gcd_queue(*(void **)(v4 - 8), a2);
    unint64_t v8 = v7 + 8;
    a1[1] = v7 + 8;
  }

  a1[1] = v8;
  return v8 - 8;
}

void sub_1881670B8(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t workqueue::workqueue::set_target_priority(uint64_t result, int a2)
{
  uint64_t v2 = *(dispatch_object_t **)(result + 24);
  for (uint64_t i = *(dispatch_object_t **)(result + 32); v2 != i; ++v2)
    uint64_t result = gcd::gcd_queue::set_target_priority(v2, a2);
  return result;
}

void workqueue::concurrent_limit::get(std::condition_variable *this)
{
  v5.__m_ = (std::unique_lock<std::mutex>::mutex_type *)&this[1];
  v5.__owns_ = 1;
  std::mutex::lock((std::mutex *)&this[1]);
  uint64_t v2 = *(void *)&this[2].__cv_.__opaque[8];
  if (v2)
  {
    *(void *)&this[2].__cv_.__opaque[8] = v2 - 1;
LABEL_5:
    std::mutex::unlock(v5.__m_);
    return;
  }

  do
  {
    std::condition_variable::wait(this, &v5);
    uint64_t v3 = *(void *)&this[2].__cv_.__opaque[8];
  }

  while (!v3);
  BOOL owns = v5.__owns_;
  *(void *)&this[2].__cv_.__opaque[8] = v3 - 1;
  if (owns) {
    goto LABEL_5;
  }
}

void workqueue::concurrent_limit::put(std::condition_variable *this)
{
  uint64_t v2 = (std::mutex *)&this[1];
  std::mutex::lock((std::mutex *)&this[1]);
  ++*(void *)&this[2].__cv_.__opaque[8];
  std::condition_variable::notify_one(this);
  std::mutex::unlock(v2);
}

void workqueue::transaction::add(dispatch_group_t *a1, void *a2)
{
  if (*((_BYTE *)a1 + 136))
  {
    workqueue::concurrent_limit::get((std::condition_variable *)(a1 + 2));
    dispatch_group_t v4 = *a1;
    std::unique_lock<std::mutex> v5 = (unint64_t *)((char *)*a1 + 48);
    do
      unint64_t v6 = __ldaxr(v5);
    while (__stlxr(v6 + 1, v5));
    uint64_t v8 = (uint64_t)v4 + 24;
    uint64_t v7 = *((void *)v4 + 3);
    unint64_t v9 = v6 % ((*(void *)(v8 + 8) - v7) >> 3);
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 0x40000000LL;
    v13[2] = ___ZN9workqueue11transaction3addEU13block_pointerFvvE_block_invoke;
    v13[3] = &unk_18A1F1CC0;
    v13[4] = a2;
    unint64_t v13[5] = a1;
    gcd::gcd_queue::async((dispatch_queue_t *)(v7 + 8 * v9), a1 + 1, v13);
  }

  else
  {
    dispatch_group_t v10 = *a1;
    uint64_t v11 = (unint64_t *)((char *)*a1 + 48);
    do
      unint64_t v12 = __ldaxr(v11);
    while (__stlxr(v12 + 1, v11));
    gcd::gcd_queue::async( (dispatch_queue_t *)(*((void *)v10 + 3)
                         + 8 * (v12 % ((uint64_t)(*((void *)v10 + 4) - *((void *)v10 + 3)) >> 3))),
      a1 + 1,
      a2);
  }

void ___ZN9workqueue11transaction3addEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  workqueue::concurrent_limit::put((std::condition_variable *)(v1 + 16));
}

uint64_t workqueue::transaction::flush(dispatch_group_t *this, dispatch_time_t a2)
{
  return gcd::gcd_group::wait(this + 1, a2);
}

void workqueue::transaction::~transaction(dispatch_group_t *this)
{
  uint64_t v2 = this + 1;
  gcd::gcd_group::wait(this + 1, 0xFFFFFFFFFFFFFFFFLL);
  std::__optional_destruct_base<workqueue::concurrent_limit,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)(this + 2));
  gcd::gcd_group::~gcd_group(v2);
}

uint64_t workqueue::transaction::transaction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = a2;
  gcd::gcd_group::gcd_group((gcd::gcd_group *)(a1 + 8));
  *(_BYTE *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 136) = 0;
  if (a3)
  {
    std::__optional_destruct_base<workqueue::concurrent_limit,false>::reset[abi:ne180100](a1 + 16);
    *(void *)(a1 + 16) = 1018212795LL;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(void *)(a1 + 56) = 0LL;
    *(void *)(a1 + std::shared_ptr<char>::~shared_ptr[abi:ne180100](v1 + 64) = 850045863LL;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 88) = 0u;
    *(_OWORD *)(a1 + 104) = 0u;
    *(void *)(a1 + 120) = 0LL;
    *(void *)(a1 + 128) = a3;
    *(_BYTE *)(a1 + 136) = 1;
  }

  return a1;
}

uint64_t workqueue::workqueue::create_transaction@<X0>( workqueue::workqueue *this@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return workqueue::transaction::transaction(a3, (uint64_t)this, a2);
}

uint64_t workqueue::workqueue::create_recurrent_block@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return workqueue::recurrent_block::recurrent_block(a4, a1, a2, a3);
}

uint64_t workqueue::recurrent_block::recurrent_block(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = a2;
  unint64_t v6 = a2 + 6;
  do
    unint64_t v7 = __ldaxr(v6);
  while (__stlxr(v7 + 1, v6));
  *(void *)(a1 + 8) = a2[3] + 8 * (v7 % ((uint64_t)(a2[4] - a2[3]) >> 3));
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 0x40000000LL;
  v9[2] = ___ZN9workqueue15recurrent_blockC2ERNS_9workqueueEU13block_pointerFvvEy_block_invoke;
  v9[3] = &unk_18A1F1CE8;
  v9[4] = a3;
  v9[5] = a1;
  v9[6] = a4;
  gcd::gcd_block::gcd_block((dispatch_block_t *)(a1 + 16), v9);
  if (*(void *)(a1 + 16) && *(_BYTE *)(*(void *)a1 + 56LL)) {
    gcd::gcd_queue::async(*(dispatch_queue_t **)(a1 + 8), (dispatch_block_t *)(a1 + 16), a4);
  }
  return a1;
}

void sub_1881674A4(_Unwind_Exception *a1)
{
}

void ___ZN9workqueue15recurrent_blockC2ERNS_9workqueueEU13block_pointerFvvEy_block_invoke(void *a1)
{
  uint64_t v2 = a1[5];
  (*(void (**)(void))(a1[4] + 16LL))();
  gcd::gcd_queue::async(*(dispatch_queue_t **)(v2 + 8), (dispatch_block_t *)(v2 + 16), a1[6]);
}

void workqueue::recurrent_block::~recurrent_block(workqueue::recurrent_block *this)
{
}

void workqueue::recurrent_block::cancel(workqueue::recurrent_block *this)
{
  if (*((void *)this + 2))
  {
    if (*(_BYTE *)(*(void *)this + 56LL))
    {
      uint64_t v2 = (dispatch_queue_t *)*((void *)this + 1);
      v3[0] = MEMORY[0x1895F87A8];
      v3[1] = 0x40000000LL;
      v3[2] = ___ZN9workqueue15recurrent_block6cancelEv_block_invoke;
      v3[3] = &__block_descriptor_tmp_2_0;
      v3[4] = this;
      gcd::gcd_queue::async(v2, v3);
      gcd::gcd_queue::sync(*((dispatch_queue_t **)this + 1), &__block_literal_global_10);
    }
  }

void ___ZN9workqueue15recurrent_block6cancelEv_block_invoke(uint64_t a1)
{
}

void *std::vector<gcd::gcd_queue>::__swap_out_circular_buffer(void *a1, void *a2)
{
  std::unique_lock<std::mutex> v5 = (void *)*a1;
  dispatch_group_t v4 = (void *)a1[1];
  uint64_t result = (void *)a2[1];
  while (v4 != v5)
    uint64_t result = gcd::gcd_queue::gcd_queue(result - 1, --v4);
  a2[1] = result;
  unint64_t v7 = (void *)*a1;
  *a1 = result;
  a2[1] = v7;
  uint64_t v8 = a1[1];
  a1[1] = a2[2];
  a2[2] = v8;
  uint64_t v9 = a1[2];
  a1[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<gcd::gcd_queue>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    gcd::gcd_group::~gcd_group((dispatch_object_s **)(i - 8));
  }

  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::__optional_destruct_base<workqueue::concurrent_limit,false>::~__optional_destruct_base[abi:ne180100]( uint64_t a1)
{
  if (*(_BYTE *)(a1 + 120))
  {
    std::mutex::~mutex((std::mutex *)(a1 + 48));
    std::condition_variable::~condition_variable((std::condition_variable *)a1);
  }

  return a1;
}

void std::__optional_destruct_base<workqueue::concurrent_limit,false>::reset[abi:ne180100](uint64_t a1)
{
  if (*(_BYTE *)(a1 + 120))
  {
    std::mutex::~mutex((std::mutex *)(a1 + 48));
    std::condition_variable::~condition_variable((std::condition_variable *)a1);
    *(_BYTE *)(a1 + 120) = 0;
  }

void waitForDevCB(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = -[DIIOIterator initWithIOIterator:retain:]( objc_alloc(&OBJC_CLASS___DIIOIterator),  "initWithIOIterator:retain:",  a2,  1LL);
  uint64_t v3 = -[DIIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___DIIOObject), "initWithIteratorNext:", v9);
  if (v3)
  {
    dispatch_group_t v4 = v3;
    std::unique_lock<std::mutex> v5 = 0LL;
    do
    {
      id v6 = -[DIIOObject newIteratorWithOptions:error:](v4, "newIteratorWithOptions:error:", 3LL, 0LL);
      if (v6)
      {
        while (1)
        {
          unint64_t v7 = v5;
          std::unique_lock<std::mutex> v5 = -[DIIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___DIIOObject), "initWithIteratorNext:", v6);

          if (!v5 || IOObjectConformsTo(-[DIIOObject ioObj](v5, "ioObj"), "IOMedia")) {
            break;
          }
          if (IOObjectIsEqualTo(-[DIIOObject ioObj](v5, "ioObj"), *(_DWORD *)(a1 + 8)))
          {
            **(_BYTE **)a1 = 1;

            goto LABEL_9;
          }
        }
      }

      uint64_t v8 = -[DIIOObject initWithIteratorNext:](objc_alloc(&OBJC_CLASS___DIIOObject), "initWithIteratorNext:", v9);
      dispatch_group_t v4 = v8;
    }

    while (v8);
LABEL_9:
  }
}

uint64_t DiskImages2_Attach(uint64_t a1, void *a2, void *a3)
{
  id v11 = 0LL;
  id v12 = 0LL;
  BOOL v5 = +[DICommonAttach defaultDiskImageAttach:BSDName:error:]( &OBJC_CLASS___DICommonAttach,  "defaultDiskImageAttach:BSDName:error:",  a1,  &v12,  &v11);
  id v6 = v12;
  id v7 = v11;
  uint64_t v8 = v7;
  if (v5)
  {
    uint64_t v9 = 0LL;
    if (a2) {
      *a2 = v6;
    }
  }

  else
  {
    if (a3) {
      *a3 = v7;
    }
    uint64_t v9 = [v8 code];
  }

  return v9;
}

void *diskimage_uio::small_vector_ns::llvm::safe_malloc(size_t this)
{
  while (1)
  {
    size_t v1 = this;
    uint64_t result = malloc(this);
    if (result) {
      break;
    }
    this = 1LL;
    if (v1) {
      abort();
    }
  }

  return result;
}

void *diskimage_uio::small_vector_ns::llvm::safe_calloc( diskimage_uio::small_vector_ns::llvm *this, size_t a2)
{
  uint64_t result = calloc((size_t)this, a2);
  if (!result && (this && a2 || (uint64_t result = malloc(1uLL)) == 0LL)) {
    abort();
  }
  return result;
}

void *diskimage_uio::small_vector_ns::llvm::safe_realloc( diskimage_uio::small_vector_ns::llvm *this, size_t a2)
{
  uint64_t result = realloc(this, a2);
  if (!result && (a2 || (uint64_t result = malloc(1uLL)) == 0LL)) {
    abort();
  }
  return result;
}

void diskimage_uio::small_vector_ns::report_size_overflow( diskimage_uio::small_vector_ns *this, unint64_t a2)
{
  uint64_t v3 = std::string::insert(&v15, 0LL, "SmallVector unable to grow. Requested capacity (", 0x30uLL);
  __int128 v4 = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
  v16.__r_.__value_.__l.__cap_ = v3->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v4;
  v3->__r_.__value_.__l.__size_ = 0LL;
  v3->__r_.__value_.__l.__cap_ = 0LL;
  v3->__r_.__value_.__r.__words[0] = 0LL;
  BOOL v5 = std::string::append(&v16, ") is larger than maximum value for size type (", 0x2EuLL);
  __int128 v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
  v17.__r_.__value_.__l.__cap_ = v5->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v6;
  v5->__r_.__value_.__l.__size_ = 0LL;
  v5->__r_.__value_.__l.__cap_ = 0LL;
  v5->__r_.__value_.__r.__words[0] = 0LL;
  std::to_string(&__p, a2);
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
  uint64_t v9 = std::string::append(&v17, (const std::string::value_type *)p_p, size);
  __int128 v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v18.__r_.__value_.__l.__cap_ = v9->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v18.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0LL;
  v9->__r_.__value_.__l.__cap_ = 0LL;
  v9->__r_.__value_.__r.__words[0] = 0LL;
  id v11 = std::string::append(&v18, ")", 1uLL);
  __int128 v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  v19.__r_.__value_.__l.__cap_ = v11->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v12;
  v11->__r_.__value_.__l.__size_ = 0LL;
  v11->__r_.__value_.__l.__cap_ = 0LL;
  v11->__r_.__value_.__r.__words[0] = 0LL;
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::logic_error::logic_error(exception, &v19);
  exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x189614778] + 16LL);
  __cxa_throw(exception, (struct type_info *)off_18A1C7C90, MEMORY[0x1896141F8]);
}

void sub_188169F40( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, void *a21, uint64_t a22, int a23, __int16 a24, char a25, char a26, uint64_t a27, void *a28, uint64_t a29, int a30, __int16 a31, char a32, char a33)
{
}

void diskimage_uio::small_vector_ns::report_at_maximum_capacity( diskimage_uio::small_vector_ns *this)
{
  size_t v1 = std::string::insert(&v4, 0LL, "SmallVector capacity unable to grow. Already at maximum size ", 0x3DuLL);
  __int128 v2 = *(_OWORD *)&v1->__r_.__value_.__l.__data_;
  v5.__r_.__value_.__l.__cap_ = v1->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v5.__r_.__value_.__l.__data_ = v2;
  v1->__r_.__value_.__l.__size_ = 0LL;
  v1->__r_.__value_.__l.__cap_ = 0LL;
  v1->__r_.__value_.__r.__words[0] = 0LL;
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::logic_error::logic_error(exception, &v5);
  exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x189614778] + 16LL);
  __cxa_throw(exception, (struct type_info *)off_18A1C7C90, MEMORY[0x1896141F8]);
}

void sub_18816A078( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL check_mntfromname(const char *a1)
{
  return !strcmp(a1, "lifs") || strcmp(a1, "fskit") == 0;
}

uint64_t _FSGetLocationFromStatfs(uint64_t a1, char *a2, size_t a3)
{
  __int128 v6 = calloc(1uLL, 0x400uLL);
  if (v6)
  {
    id v7 = v6;
    if (check_mntfromname((const char *)(a1 + 72)))
    {
      uint64_t v8 = strstr((const char *)(a1 + 1112), "://");
      if (!v8 || (v9 = v8 + 3, (__int128 v10 = strchr(v8 + 3, 47)) == 0LL))
      {
        uint64_t v12 = 22LL;
LABEL_17:
        free(v7);
        return v12;
      }

      if (v10 - v9 >= 1023) {
        uint64_t v11 = 1023LL;
      }
      else {
        uint64_t v11 = v10 - v9;
      }
      __memcpy_chk();
      *((_BYTE *)v7 + v11) = 0;
      if (!a2)
      {
LABEL_16:
        uint64_t v12 = 0LL;
        goto LABEL_17;
      }
    }

    else
    {
      __strlcpy_chk();
      if (!a2) {
        goto LABEL_16;
      }
    }

    strlcpy(a2, (const char *)v7, a3);
    goto LABEL_16;
  }

  return 12LL;
}

uint64_t aaS3ContextClone(uint64_t a1)
{
  __int128 v2 = malloc(0xAF8uLL);
  uint64_t v3 = (uint64_t)v2;
  if (!v2)
  {
    __int16 v7 = 192;
LABEL_36:
    uint64_t v33 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Context.c",  (uint64_t)"aaS3ContextClone",  v7,  80,  *v33,  "malloc",  v34,  v35,  v46);
    AAS3ContextDestroy(v3);
    return 0LL;
  }

  memset_s(v2, 0xAF8uLL, 0, 0xAF8uLL);
  if (*(_DWORD *)a1)
  {
    *(_DWORD *)uint64_t v3 = 1;
    memcpy((void *)(v3 + 4), (const void *)(a1 + 4), 0xAC4uLL);
  }

  std::string v4 = *(const void **)(a1 + 2760);
  if (v4)
  {
    size_t v5 = strlen(*(const char **)(a1 + 2760));
    size_t v6 = v5 + 1;
    if (v5 + 1 >= 0x2000000001LL)
    {
      *__error() = 12;
LABEL_13:
      unint64_t v13 = (void *)(v3 + 2760);
      __int16 v7 = 198;
LABEL_35:
      *unint64_t v13 = 0LL;
      goto LABEL_36;
    }

    uint64_t v8 = malloc(v5 + 1);
    if (!v8) {
      goto LABEL_13;
    }
    uint64_t v9 = v8;
    memcpy(v8, v4, v6);
    *(void *)(v3 + 2760) = v9;
  }

  __int128 v10 = *(const void **)(a1 + 2768);
  if (v10)
  {
    size_t v11 = strlen(*(const char **)(a1 + 2768));
    size_t v12 = v11 + 1;
    if (v11 + 1 >= 0x2000000001LL)
    {
      *__error() = 12;
LABEL_19:
      unint64_t v13 = (void *)(v3 + 2768);
      __int16 v7 = 199;
      goto LABEL_35;
    }

    uint64_t v14 = malloc(v11 + 1);
    if (!v14) {
      goto LABEL_19;
    }
    std::string v15 = v14;
    memcpy(v14, v10, v12);
    *(void *)(v3 + 2768) = v15;
  }

  std::string v16 = *(const void **)(a1 + 2776);
  if (v16)
  {
    size_t v17 = strlen(*(const char **)(a1 + 2776));
    size_t v18 = v17 + 1;
    if (v17 + 1 >= 0x2000000001LL)
    {
      *__error() = 12;
LABEL_25:
      unint64_t v13 = (void *)(v3 + 2776);
      __int16 v7 = 200;
      goto LABEL_35;
    }

    std::string v19 = malloc(v17 + 1);
    if (!v19) {
      goto LABEL_25;
    }
    uint64_t v20 = v19;
    memcpy(v19, v16, v18);
    *(void *)(v3 + 2776) = v20;
  }

  int v21 = *(const void **)(a1 + 2784);
  if (v21)
  {
    size_t v22 = strlen(*(const char **)(a1 + 2784));
    size_t v23 = v22 + 1;
    if (v22 + 1 >= 0x2000000001LL)
    {
      *__error() = 12;
LABEL_34:
      unint64_t v13 = (void *)(v3 + 2784);
      __int16 v7 = 201;
      goto LABEL_35;
    }

    unint64_t v24 = malloc(v22 + 1);
    if (!v24) {
      goto LABEL_34;
    }
    int v25 = v24;
    memcpy(v24, v21, v23);
    *(void *)(v3 + 2784) = v25;
  }

  uint64_t v26 = *(void *)(a1 + 2792);
  if (v26)
  {
    list = 0LL;
    p_list = &list;
    while (1)
    {
      unint64_t v28 = (curl_slist *)malloc(0x10uLL);
      if (!v28) {
        break;
      }
      p_data = &v28->data;
      v28->data = 0LL;
      v28->next = 0LL;
      *p_list = v28;
      uint64_t v30 = strdup(*(const char **)v26);
      *p_data = v30;
      if (!v30) {
        break;
      }
      p_list = (curl_slist **)(p_data + 1);
      uint64_t v26 = *(void *)(v26 + 8);
      if (!v26)
      {
        BOOL v31 = 1;
        __int128 v32 = list;
        goto LABEL_39;
      }
    }

    curl_slist_free_all(list);
    __int128 v32 = 0LL;
    BOOL v31 = *(void *)(a1 + 2792) != 0LL;
LABEL_39:
    *(void *)(v3 + 2792) = v32;
    if (v31 && v32 == 0LL)
    {
      __int16 v7 = 202;
      goto LABEL_36;
    }
  }

  else
  {
    *(void *)(v3 + 2792) = 0LL;
  }

  uint64_t v38 = *(void *)(a1 + 2800);
  if (!v38)
  {
    *(void *)(v3 + 2800) = 0LL;
    return v3;
  }

  list = 0LL;
  unint64_t v39 = &list;
  while (1)
  {
    unint64_t v40 = (curl_slist *)malloc(0x10uLL);
    if (!v40) {
      break;
    }
    unint64_t v41 = &v40->data;
    v40->data = 0LL;
    v40->next = 0LL;
    std::__shared_weak_count *v39 = v40;
    unint64_t v42 = strdup(*(const char **)v38);
    unint64_t *v41 = v42;
    if (!v42) {
      break;
    }
    unint64_t v39 = (curl_slist **)(v41 + 1);
    uint64_t v38 = *(void *)(v38 + 8);
    if (!v38)
    {
      BOOL v43 = 1;
      unint64_t v44 = list;
      goto LABEL_53;
    }
  }

  curl_slist_free_all(list);
  unint64_t v44 = 0LL;
  BOOL v43 = *(void *)(a1 + 2800) != 0LL;
LABEL_53:
  *(void *)(v3 + 2800) = v44;
  if (v43 && v44 == 0LL)
  {
    __int16 v7 = 203;
    goto LABEL_36;
  }

  return v3;
}

void AAS3ContextDestroy(uint64_t a1)
{
  if (a1)
  {
    free(*(void **)(a1 + 2760));
    free(*(void **)(a1 + 2768));
    free(*(void **)(a1 + 2776));
    free(*(void **)(a1 + 2784));
    curl_slist_free_all(*(curl_slist **)(a1 + 2792));
    curl_slist_free_all(*(curl_slist **)(a1 + 2800));
    memset_s((void *)a1, 0xAF8uLL, 0, 0xAF8uLL);
    free((void *)a1);
  }

void *AAS3ContextCreate()
{
  v0 = malloc(0xAF8uLL);
  size_t v1 = v0;
  if (!v0)
  {
    uint64_t v9 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Context.c",  (uint64_t)"AAS3ContextCreate",  355,  80,  *v9,  "malloc",  v10,  v11,  v13);
    goto LABEL_5;
  }

  memset_s(v0, 0xAF8uLL, 0, 0xAF8uLL);
  if ((AAS3ContextSetFieldString((uint64_t)v1, 5, "Not A Ninja/1.0", v2, v3, v4, v5, v6) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Context.c",  (uint64_t)"AAS3ContextCreate",  358,  80,  0,  "set context",  v7,  v8,  v13);
    memset_s(v1, 0xAF8uLL, 0, 0xAF8uLL);
LABEL_5:
    free(v1);
    return 0LL;
  }

  return v1;
}

uint64_t AAS3ContextSetFieldString( uint64_t a1, int a2, char *__s, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  switch(a2)
  {
    case 0:
      uint64_t v9 = (void **)(a1 + 2760);
      if (__s) {
        goto LABEL_17;
      }
      goto LABEL_20;
    case 1:
      uint64_t v9 = (void **)(a1 + 2768);
      if (!__s) {
        goto LABEL_20;
      }
      goto LABEL_17;
    case 2:
      uint64_t v9 = (void **)(a1 + 2776);
      if (!__s) {
        goto LABEL_20;
      }
      goto LABEL_17;
    case 3:
      uint64_t v10 = (curl_slist **)(a1 + 2792);
      if (!__s) {
        return 0LL;
      }
      goto LABEL_12;
    case 4:
      uint64_t v10 = (curl_slist **)(a1 + 2800);
      if (!__s) {
        return 0LL;
      }
LABEL_12:
      if (!*__s) {
        return 0LL;
      }
      uint64_t v11 = curl_slist_append(*v10, __s);
      if (v11)
      {
        size_t v12 = v11;
        uint64_t result = 0LL;
        const void *v10 = v12;
        return result;
      }

      int v18 = *__error();
      __int16 v21 = 407;
      goto LABEL_26;
    case 5:
      uint64_t v9 = (void **)(a1 + 2784);
      if (!__s) {
        goto LABEL_20;
      }
LABEL_17:
      if (!*__s)
      {
LABEL_20:
        std::string v16 = 0LL;
LABEL_21:
        free(*v9);
        uint64_t result = 0LL;
        int *v9 = v16;
        return result;
      }

      size_t v14 = strlen(__s);
      size_t v15 = v14 + 1;
      if (v14 + 1 >= 0x2000000001LL)
      {
        *__error() = 12;
        goto LABEL_24;
      }

      size_t v17 = malloc(v14 + 1);
      if (v17)
      {
        std::string v16 = v17;
        memcpy(v17, __s, v15);
        goto LABEL_21;
      }

uint64_t downloadStreamClose_curl(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)a1 >> 62)
    {
      gettimeofday(&v10, 0LL);
      double v2 = (double)v10.tv_sec + (double)v10.tv_usec * 0.000001 - *(double *)(a1 + 40);
      uint64_t v3 = (FILE **)MEMORY[0x1895F89D0];
      fwrite("AAS3DownloadStream (curl)\n", 0x1AuLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
      uint64_t v4 = *v3;
      unint64_t v5 = atomic_load((unint64_t *)(a1 + 32));
      unint64_t v6 = atomic_load((unint64_t *)(a1 + 32));
      fprintf(v4, "%12llu bytes downloaded (%.2f MB)\n", v5, (double)v6 * 0.000000953674316);
      uint64_t v7 = *v3;
      unint64_t v8 = atomic_load((unint64_t *)(a1 + 32));
      fprintf(v7, "%12.2f MB/s download speed\n", (double)v8 / v2 * 0.000000953674316);
    }

    s3StreamBaseRelease(a1);
    memset_s((void *)a1, 0x30uLL, 0, 0x30uLL);
    free((void *)a1);
  }

  return 0LL;
}

AAByteStream_impl *s3DownloadStreamOpen_curl(char *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = AACustomByteStreamOpen();
  uint64_t v7 = (double *)malloc(0x30uLL);
  if (!v7 || (unint64_t v8 = v7, memset_s(v7, 0x30uLL, 0, 0x30uLL), !v6))
  {
    perror("malloc");
    goto LABEL_7;
  }

  if ((s3StreamBaseInit(v8, a1, a2, a3) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamCurl.c",  (uint64_t)"s3DownloadStreamOpen_curl",  132,  83,  0,  "s3StreamBaseInit",  v9,  v10,  v12.tv_sec);
LABEL_7:
    AAByteStreamClose(v6);
    return 0LL;
  }

  gettimeofday(&v12, 0LL);
  v8[5] = (double)v12.tv_sec + (double)v12.tv_usec * 0.000001;
  AACustomByteStreamSetData(v6, v8);
  AACustomByteStreamSetCloseProc(v6, (AAByteStreamCloseProc)downloadStreamClose_curl);
  AACustomByteStreamSetPReadProc(v6, (AAByteStreamPReadProc)downloadStreamPRead);
  AACustomByteStreamSetReadProc(v6, (AAByteStreamReadProc)downloadStreamRead);
  return v6;
}

uint64_t downloadStreamPRead(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  *(void *)&__int128 v21 = a2;
  *((void *)&v21 + 1) = a3;
  uint64_t v22 = 0LL;
  uint64_t v5 = a2;
  if (a3)
  {
    uint64_t v18 = a2;
    uint64_t v6 = a4 + a3;
    uint64_t v7 = a4 + a3 - 1;
    while (1)
    {
      snprintf(__str, 0xC8uLL, "Range: bytes=%llu-%llu", v6 - a3, v7);
      unsigned int v11 = 0;
      v23[0] = __str;
      v23[1] = 0LL;
      __int128 v19 = v21;
      uint64_t v20 = v22;
      useconds_t v12 = 125000;
      do
      {
        if (v11)
        {
          pc_log_warning( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamCurl.c",  (uint64_t)"downloadStreamPRead",  65,  83,  "s3Perform retry after %u ms",  v8,  v9,  v10,  v12 / 0x3E8);
          usleep(v12);
          v12 *= 2;
        }

        __int128 v21 = v19;
        uint64_t v22 = v20;
        int v13 = s3Perform(1u, *(char **)(a1 + 8), a1, 0LL, &v21, 0LL, v23);
        if ((v13 & 0x80000000) == 0) {
          break;
        }
      }

      while (v11++ < 3);
      if (v13 < 0) {
        break;
      }
      a3 = *((void *)&v21 + 1);
      if (!*((void *)&v21 + 1))
      {
        uint64_t v5 = v21;
        a2 = v18;
        goto LABEL_12;
      }
    }

    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamCurl.c",  (uint64_t)"downloadStreamPRead",  81,  83,  0,  "s3Perform failed (after retry), %s",  v9,  v10,  (char)__str);
    return -1LL;
  }

  else
  {
LABEL_12:
    uint64_t result = v5 - a2;
    std::string v16 = (unint64_t *)(a1 + 32);
    do
      unint64_t v17 = __ldxr(v16);
    while (__stxr(v17 + result, v16));
  }

  return result;
}

uint64_t downloadStreamRead(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (unint64_t *)(a1 + 24);
  do
    uint64_t v4 = __ldaxr(v3);
  while (__stlxr(v4 + a3, v3));
  return downloadStreamPRead(a1, a2, a3, v4);
}

uint64_t s3HMAC_SHA256(_DWORD *a1, unsigned int *a2, const void *a3, size_t a4)
{
  *a1 = 32;
  memset_s(a1 + 9, 0xE0uLL, 0, 0xE0uLL);
  memset_s(&v8, 0x180uLL, 0, 0x180uLL);
  return 0LL;
}

uint64_t s3SHA256(uint64_t a1, const void *a2, CC_LONG a3)
{
  *(_DWORD *)a1 = 32;
  memset_s((void *)(a1 + 36), 0xE0uLL, 0, 0xE0uLL);
  return memset_s(&c, 0x68uLL, 0, 0x68uLL);
}

size_t s3BufWrite(char *__src, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = __src;
  size_t v5 = a3 * a2;
  uint64_t v6 = *(void *)(a4 + 16);
  if (v6)
  {
    if (*(void *)(v6 + 24))
    {
      uint64_t v7 = 0LL;
      if (v5)
      {
        while (1)
        {
          uint64_t v8 = (*(uint64_t (**)(void, char *, size_t))(v6 + 24))(*(void *)v6, v4, v5);
          if (v8 < 1) {
            break;
          }
          v4 += v8;
          v7 += v8;
          v5 -= v8;
          if (!v5) {
            return v7 & ~(v7 >> 63);
          }
        }

        uint64_t v7 = v8;
      }
    }

    else
    {
      uint64_t v7 = -1LL;
    }

    return v7 & ~(v7 >> 63);
  }

  else
  {
    if (v5 >= *(void *)(a4 + 8)) {
      size_t v5 = *(void *)(a4 + 8);
    }
    memcpy(*(void **)a4, __src, v5);
    size_t v10 = *(void *)(a4 + 8) - v5;
    *(void *)a4 += v5;
    *(void *)(a4 + 8) = v10;
    return v5;
  }

size_t s3BufRead(char *__dst, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = __dst;
  size_t v5 = a3 * a2;
  uint64_t v6 = *(void *)(a4 + 16);
  if (v6)
  {
    if (*(void *)(v6 + 16))
    {
      uint64_t v7 = 0LL;
      if (v5)
      {
        while (1)
        {
          uint64_t v8 = (*(uint64_t (**)(void, char *, size_t))(v6 + 16))(*(void *)v6, v4, v5);
          if (v8 < 0) {
            break;
          }
          if (v8)
          {
            v4 += v8;
            v7 += v8;
            v5 -= v8;
            if (v5) {
              continue;
            }
          }

          return v7 & ~(v7 >> 63);
        }

        uint64_t v7 = v8;
      }
    }

    else
    {
      uint64_t v7 = -1LL;
    }

    return v7 & ~(v7 >> 63);
  }

  else
  {
    if (v5 >= *(void *)(a4 + 8)) {
      size_t v5 = *(void *)(a4 + 8);
    }
    memcpy(__dst, *(const void **)a4, v5);
    size_t v10 = *(void *)(a4 + 8) - v5;
    *(void *)a4 += v5;
    *(void *)(a4 + 8) = v10;
    return v5;
  }

uint64_t s3HeaderAppendWithFormat(curl_slist **a1, char *__format, ...)
{
  int v4 = vsnprintf(0LL, 0LL, __format, va);
  if (v4 < 0)
  {
    unsigned int v11 = 0LL;
LABEL_8:
    useconds_t v12 = "vsnprintf";
    __int16 v13 = 156;
    int v14 = 0;
LABEL_12:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c",  (uint64_t)"s3HeaderAppendWithFormat",  v13,  84,  v14,  v12,  v5,  v6,  v20);
    uint64_t v18 = 0xFFFFFFFFLL;
    uint64_t v7 = v11;
  }

  else
  {
    uint64_t v7 = 0LL;
    char v8 = 1;
    while ((v8 & 1) != 0)
    {
      size_t v9 = (v4 + 1);
      size_t v10 = (char *)realloc(v7, v9);
      unsigned int v11 = v10;
      if (!v10)
      {
        free(v7);
        int v14 = *__error();
        useconds_t v12 = "malloc";
        __int16 v13 = 161;
        goto LABEL_12;
      }

      int v4 = vsnprintf(v10, v9, __format, va);
      char v8 = 0;
      uint64_t v7 = v11;
      if (v4 < 0) {
        goto LABEL_8;
      }
    }

    size_t v15 = curl_slist_append(*a1, v7);
    if (v15)
    {
      uint64_t v18 = 0LL;
      *a1 = v15;
    }

    else
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c",  (uint64_t)"s3HeaderAppendWithFormat",  168,  84,  0,  "curl_slist_append failed\n",  v16,  v17,  v20);
      uint64_t v18 = 0xFFFFFFFFLL;
    }
  }

  free(v7);
  return v18;
}

uint64_t s3HeaderAppend(curl_slist **a1, const char *a2)
{
  uint64_t v3 = curl_slist_append(*a1, a2);
  uint64_t v6 = v3;
  if (v3) {
    *a1 = v3;
  }
  else {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c",  (uint64_t)"s3HeaderAppend",  182,  84,  0,  "curl_slist_append failed\n",  v4,  v5,  v8);
  }
  if (v6) {
    return 0LL;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

unint64_t curlWriteData(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v6 = a3 * a2;
  if ((*(_DWORD *)(a4 + 8) & 0x80000000) != 0)
  {
    uint64_t v11 = 499LL;
    curl_easy_getinfo(*(CURL **)a4, CURLINFO_RESPONSE_CODE, &v11);
    int v7 = v11;
    *(_DWORD *)(a4 + 8) = v11;
    if (v7 == 200)
    {
      if (*(_DWORD *)(a4 + 12)) {
        *(void *)(a4 + 24) = *(void *)(a4 + 16);
      }
    }
  }

  unint64_t v8 = *(void *)(a4 + 24);
  uint64_t v9 = v6 - v8;
  if (v6 >= v8)
  {
    if (v8)
    {
      a1 += v8;
      *(void *)(a4 + 24) = 0LL;
    }

    else
    {
      uint64_t v9 = v6;
    }

    s3BufWrite(a1, v9, 1LL, *(void *)(a4 + 32));
  }

  else
  {
    *(void *)(a4 + 24) = v8 - v6;
  }

  return v6;
}

uint64_t s3Perform( unsigned int a1, char *a2, uint64_t a3, uint64_t a4, __int128 *a5, uint64_t a6, const char **a7)
{
  uint64_t v14 = *(void *)(a3 + 16);
  uint64_t v61 = 0LL;
  if (a4) {
    uint64_t v15 = *(void *)(a4 + 8);
  }
  else {
    uint64_t v15 = -1LL;
  }
  __int128 v59 = 0uLL;
  uint64_t v60 = 0LL;
  if (a5)
  {
    __int128 v59 = *a5;
    uint64_t v60 = *((void *)a5 + 2);
  }

  uint64_t v58 = 0LL;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  uint64_t v16 = curl_easy_init();
  if (!v16)
  {
    uint64_t v26 = (FILE *)*MEMORY[0x1895F89D0];
    __int128 v27 = "curl_easy_init failed\n";
    size_t v28 = 22LL;
LABEL_42:
    fwrite(v27, v28, 1uLL, v26);
    goto LABEL_43;
  }

  if ((s3HeaderAppend(&v61, "Content-Type:") & 0x80000000) != 0
    || (s3HeaderAppend(&v61, "Transfer-Encoding:") & 0x80000000) != 0
    || (s3HeaderAppend(&v61, "Accept: application/xml") & 0x80000000) != 0
    || (v15 & 0x8000000000000000LL) == 0
    && (s3HeaderAppendWithFormat(&v61, "Content-Length: %zd", v15) & 0x80000000) != 0)
  {
    goto LABEL_43;
  }

  uint64_t v17 = *(void *)(*(void *)(a3 + 16) + 2792LL);
  if (v17)
  {
    while ((s3HeaderAppend(&v61, *(const char **)v17) & 0x80000000) == 0)
    {
      uint64_t v17 = *(void *)(v17 + 8);
      if (!v17) {
        goto LABEL_15;
      }
    }

    goto LABEL_43;
  }

uint64_t s3Sign(curl_slist **a1, unsigned int a2, char *__s, uint64_t a4, uint64_t a5)
{
  v124[32] = *MEMORY[0x1895F89C0];
  v117[0] = 0LL;
  v117[1] = 0LL;
  char v118 = 0LL;
  v115[0] = 0LL;
  v115[1] = 0LL;
  __int128 v116 = 0LL;
  v113[0] = 0LL;
  v113[1] = 0LL;
  uint64_t v114 = 0LL;
  v111[0] = 0LL;
  v111[1] = 0LL;
  __int128 v112 = 0LL;
  int v122 = 0;
  memset(__sa, 0, sizeof(__sa));
  size_t v10 = strlen(__s);
  if (v10 < 7) {
    goto LABEL_8;
  }
  if (*(_DWORD *)__s == 1886680168 && *(_DWORD *)(__s + 3) == 791624304)
  {
    uint64_t v19 = 7LL;
  }

  else
  {
    if (v10 < 8 || *(void *)__s != 0x2F2F3A7370747468LL)
    {
LABEL_8:
      uint64_t v14 = "Invalid URL";
      __int16 v15 = 486;
LABEL_9:
      int v16 = 0;
LABEL_10:
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c",  (uint64_t)"s3Sign",  v15,  84,  v16,  v14,  v11,  v12,  v99);
LABEL_11:
      BOOL v17 = 0;
      goto LABEL_12;
    }

    uint64_t v19 = 8LL;
  }

  char v20 = &__s[v19];
  CURLcode v21 = strchr(&__s[v19], 47);
  if (!v21)
  {
    uint64_t v14 = "Invalid URL";
    __int16 v15 = 488;
    goto LABEL_9;
  }

  CURLcode v22 = v21;
  uint64_t v109 = v20;
  unsigned int v107 = a2;
  CURLcode v23 = strchr(v21, 63);
  BOOL v24 = "/";
  v108 = v22;
  if (!v23)
  {
    size_t v30 = strlen(v22);
    if (v30 <= 1) {
      uint64_t v29 = 1LL;
    }
    else {
      uint64_t v29 = v30;
    }
    if (v30) {
      BOOL v24 = v22;
    }
    goto LABEL_32;
  }

  BOOL v25 = v23;
  uint64_t v26 = v23 + 1;
  size_t v27 = strlen(v23 + 1);
  BOOL v28 = v25 == v22;
  if (v25 == v22) {
    uint64_t v29 = 1LL;
  }
  else {
    uint64_t v29 = v25 - v22;
  }
  if (!v28) {
    BOOL v24 = v22;
  }
  if (!v27)
  {
LABEL_32:
    size_t v27 = 0LL;
    uint64_t v26 = "";
  }

  size_t __n = v27;
  uint64_t v106 = (char *)v26;
  if ((s3HeaderAppendWithFormat(a1, "X-Amz-Date: %s", (const char *)(a4 + 68)) & 0x80000000) != 0
    || *(_BYTE *)(a4 + 452)
    && (s3HeaderAppendWithFormat(a1, "X-Amz-Security-Token: %s", (const char *)(a4 + 452)) & 0x80000000) != 0)
  {
    goto LABEL_11;
  }

  __srCC_SHA256_CTX c = (char *)v24;
  if (a5)
  {
    s3SHA256((uint64_t)&v123, *(const void **)a5, *(void *)(a5 + 8));
    if (v123)
    {
      uint64_t v31 = v29;
      unsigned __int32 v32 = (unsigned __int8 *)v124;
      uint64_t v33 = 2LL * v123;
      size_t v34 = v33 | 1;
      uint64_t v35 = __str;
      do
      {
        int v36 = *v32++;
        snprintf(v35, v34, "%02x", v36);
        v34 -= 2LL;
        v35 += 2;
      }

      while (v34 != 1);
LABEL_44:
      uint64_t v29 = v31;
      goto LABEL_46;
    }
  }

  else
  {
    s3SHA256((uint64_t)&v123, 0LL, 0);
    if (v123)
    {
      uint64_t v31 = v29;
      uint64_t v37 = (unsigned __int8 *)v124;
      uint64_t v33 = 2LL * v123;
      size_t v38 = v33 | 1;
      unint64_t v39 = __str;
      do
      {
        int v40 = *v37++;
        snprintf(v39, v38, "%02x", v40);
        v38 -= 2LL;
        v39 += 2;
      }

      while (v38 != 1);
      goto LABEL_44;
    }
  }

  uint64_t v33 = 0LL;
LABEL_46:
  __str[v33] = 0;
  memset_s(&v123, 0x104uLL, 0, 0x104uLL);
  if ((s3HeaderAppendWithFormat(a1, "X-Amz-Content-Sha256: %s", __str) & 0x80000000) != 0) {
    goto LABEL_11;
  }
  int v41 = *a1;
  if (*a1)
  {
    uint64_t v42 = 0LL;
    do
    {
      ++v42;
      int v41 = v41->next;
    }

    while (v41);
  }

  else
  {
    uint64_t v42 = 0LL;
  }

  __int128 v110 = calloc(v42 + 1, 8uLL);
  if (!v110)
  {
    int v16 = *__error();
    uint64_t v14 = "malloc";
    __int16 v15 = 520;
    goto LABEL_10;
  }

  unint64_t v102 = (char *)(a4 + 68);
  size_t v103 = v29;
  char v100 = a1;
  uint64_t v101 = a4;
  BOOL v43 = *a1;
  if (!v43)
  {
    uint64_t v44 = 0LL;
LABEL_77:
    size_t v54 = v22 - v109;
    size_t v55 = v108 - v109 + 6;
    if (v55 >= 0x2000000001LL)
    {
      *__error() = 12;
LABEL_82:
      int v59 = *__error();
      __int16 v62 = 554;
      goto LABEL_85;
    }

    __int128 v56 = (char *)malloc(v55);
    if (!v56) {
      goto LABEL_82;
    }
    __int128 v57 = &v56[v54];
    v110[v44] = v56;
    v56[4] = 58;
    *(_DWORD *)__int128 v56 = 1953722216;
    memcpy(v56 + 5, v109, v54);
    v57[5] = 0;
    qsort(v110, v44 + 1, 8uLL, (int (__cdecl *)(const void *, const void *))s3StringCompare);
    if (v107 > 3) {
      uint64_t v58 = "???";
    }
    else {
      uint64_t v58 = off_18A1F1D68[v107];
    }
    size_t v63 = strlen(v58);
    if ((s3StringBufferAppend(v117, v58, v63) & 0x80000000) == 0
      && (s3StringBufferAppend(v117, "\n", 1uLL) & 0x80000000) == 0
      && (s3StringBufferAppend(v117, __src, v103) & 0x80000000) == 0
      && (s3StringBufferAppend(v117, "\n", 1uLL) & 0x80000000) == 0
      && (s3StringBufferAppend(v117, v106, __n) & 0x80000000) == 0
      && (s3StringBufferAppend(v117, "\n", 1uLL) & 0x80000000) == 0)
    {
      if (v44 == -1)
      {
LABEL_102:
        if ((s3StringBufferAppend(v117, "\n", 1uLL) & 0x80000000) == 0)
        {
          unint64_t v71 = v116;
          size_t v72 = strlen(v116);
          if ((s3StringBufferAppend(v117, v116, v72) & 0x80000000) == 0
            && (s3StringBufferAppend(v117, "\n", 1uLL) & 0x80000000) == 0)
          {
            size_t v73 = strlen(__str);
            if ((s3StringBufferAppend(v117, __str, v73) & 0x80000000) == 0
              && (s3StringBufferAppend(v113, "AWS4-HMAC-SHA256\n", 0x11uLL) & 0x80000000) == 0)
            {
              size_t v74 = strlen(v102);
              if ((s3StringBufferAppend(v113, v102, v74) & 0x80000000) == 0
                && (s3StringBufferAppend(v113, "\n", 1uLL) & 0x80000000) == 0)
              {
                __int128 v75 = (char *)(v101 + 4);
                size_t v76 = strlen((const char *)(v101 + 4));
                if ((s3StringBufferAppend(v113, (void *)(v101 + 4), v76) & 0x80000000) == 0
                  && (s3StringBufferAppend(v113, "/", 1uLL) & 0x80000000) == 0)
                {
                  uint64_t v77 = (char *)(v101 + 132);
                  size_t v78 = strlen((const char *)(v101 + 132));
                  if ((s3StringBufferAppend(v113, (void *)(v101 + 132), v78) & 0x80000000) == 0
                    && (s3StringBufferAppend(v113, "/s3/aws4_request\n", 0x11uLL) & 0x80000000) == 0)
                  {
                    CC_LONG v79 = strlen(v118);
                    s3SHA256((uint64_t)&v123, v118, v79);
                    if (v123)
                    {
                      unint64_t v80 = (unsigned __int8 *)v124;
                      uint64_t v81 = 2LL * v123;
                      size_t v82 = v81 | 1;
                      unint64_t v83 = v119;
                      do
                      {
                        int v84 = *v80++;
                        snprintf(v83, v82, "%02x", v84);
                        v82 -= 2LL;
                        v83 += 2;
                      }

                      while (v82 != 1);
                    }

                    else
                    {
                      uint64_t v81 = 0LL;
                    }

                    v119[v81] = 0;
                    memset_s(&v123, 0x104uLL, 0, 0x104uLL);
                    size_t v87 = strlen(v119);
                    if ((s3StringBufferAppend(v113, v119, v87) & 0x80000000) == 0)
                    {
                      size_t v88 = strlen(v114);
                      s3HMAC_SHA256(__sa, (unsigned int *)(v101 + 2500), v114, v88);
                      if (LODWORD(__sa[0]))
                      {
                        uint64_t v89 = (unsigned __int8 *)__sa + 4;
                        uint64_t v90 = 2LL * LODWORD(__sa[0]);
                        size_t v91 = v90 | 1;
                        unint64_t v92 = v119;
                        do
                        {
                          int v93 = *v89++;
                          snprintf(v92, v91, "%02x", v93);
                          v91 -= 2LL;
                          v92 += 2;
                        }

                        while (v91 != 1);
                      }

                      else
                      {
                        uint64_t v90 = 0LL;
                      }

                      v119[v90] = 0;
                      if ((s3StringBufferAppend(v111, "AWS4-HMAC-SHA256 Credential=", 0x1CuLL) & 0x80000000) == 0)
                      {
                        size_t v94 = strlen((const char *)(v101 + 196));
                        if ((s3StringBufferAppend(v111, (void *)(v101 + 196), v94) & 0x80000000) == 0
                          && (s3StringBufferAppend(v111, "/", 1uLL) & 0x80000000) == 0)
                        {
                          size_t v95 = strlen(v75);
                          if ((s3StringBufferAppend(v111, v75, v95) & 0x80000000) == 0
                            && (s3StringBufferAppend(v111, "/", 1uLL) & 0x80000000) == 0)
                          {
                            size_t v96 = strlen(v77);
                            if ((s3StringBufferAppend(v111, v77, v96) & 0x80000000) == 0
                              && (s3StringBufferAppend(v111, "/s3/aws4_request,SignedHeaders=", 0x1FuLL) & 0x80000000) == 0)
                            {
                              size_t v97 = strlen(v71);
                              if ((s3StringBufferAppend(v111, v71, v97) & 0x80000000) == 0
                                && (s3StringBufferAppend(v111, ",Signature=", 0xBuLL) & 0x80000000) == 0)
                              {
                                size_t v98 = strlen(v119);
                                if ((s3StringBufferAppend(v111, v119, v98) & 0x80000000) == 0)
                                {
                                  BOOL v17 = (int)s3HeaderAppendWithFormat(v100, "Authorization: %s", v112) >= 0;
                                  goto LABEL_119;
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

      else
      {
        uint64_t v64 = 0LL;
        while (1)
        {
          uint64_t v65 = (char *)v110[v64];
          uint64_t v66 = strchr(v65, 58);
          if (!v66) {
            break;
          }
          char v69 = v66;
          size_t v70 = strlen(v65);
          if ((s3StringBufferAppend(v117, v65, v70) & 0x80000000) != 0
            || (s3StringBufferAppend(v117, "\n", 1uLL) & 0x80000000) != 0
            || v64 && (s3StringBufferAppend(v115, ";", 1uLL) & 0x80000000) != 0
            || (s3StringBufferAppend(v115, v65, v69 - v65) & 0x80000000) != 0)
          {
            goto LABEL_118;
          }

          if (v44 + 1 == ++v64) {
            goto LABEL_102;
          }
        }

        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c",  (uint64_t)"s3Sign",  580,  84,  0,  "Invalid header: %s",  v67,  v68,  (char)v65);
      }
    }

LABEL_118:
    BOOL v17 = 0;
LABEL_119:
    ++v44;
    goto LABEL_120;
  }

  uint64_t v44 = 0LL;
  uint64_t v45 = MEMORY[0x1895F8770];
  while (1)
  {
    data = v43->data;
    if (strncasecmp(v43->data, "x-amz-", 6uLL)) {
      goto LABEL_73;
    }
    size_t v47 = strlen(data);
    if (v47 + 1 >= 0x2000000001LL) {
      break;
    }
    char v48 = malloc(v47 + 1);
    if (!v48) {
      goto LABEL_84;
    }
    uint64_t v49 = v48;
    v110[v44] = v48;
    if (v47)
    {
      uint64_t v50 = 0LL;
      uint64_t v51 = 0LL;
      int v52 = 1;
      while (1)
      {
        unsigned int v53 = v43->data[v50];
        if ((v53 & 0x80000000) != 0)
        {
          if (!__maskrune(v43->data[v50], 0x4000uLL))
          {
LABEL_64:
            if (v53 == 58) {
              int v52 = 0;
            }
            if (v52) {
              LOBYTE(v53) = __tolower(v53);
            }
            v49[v51++] = v53;
          }
        }

        else if ((*(_DWORD *)(v45 + 4LL * v53 + 60) & 0x4000) == 0)
        {
          goto LABEL_64;
        }

        if (v47 == ++v50) {
          goto LABEL_72;
        }
      }
    }

    uint64_t v51 = 0LL;
LABEL_72:
    ++v44;
    v49[v51] = 0;
LABEL_73:
    BOOL v43 = v43->next;
    if (!v43) {
      goto LABEL_77;
    }
  }

  *__error() = 12;
LABEL_84:
  int v59 = *__error();
  __int16 v62 = 538;
LABEL_85:
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c",  (uint64_t)"s3Sign",  v62,  84,  v59,  "malloc",  v60,  v61,  v99);
  BOOL v17 = 0;
LABEL_120:
  if (v44)
  {
    uint64_t v85 = (void **)v110;
    do
    {
      unint64_t v86 = *v85++;
      free(v86);
      --v44;
    }

    while (v44);
  }

  free(v110);
LABEL_12:
  memset_s(__sa, 0x104uLL, 0, 0x104uLL);
  memset_s(v119, 0x80uLL, 0, 0x80uLL);
  memset_s(__str, 0x80uLL, 0, 0x80uLL);
  s3StringBufferFree((uint64_t)v117);
  s3StringBufferFree((uint64_t)v115);
  s3StringBufferFree((uint64_t)v113);
  s3StringBufferFree((uint64_t)v111);
  if (v17) {
    return 0LL;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t s3StringCompare(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

uint64_t s3StringBufferAppend(unint64_t *a1, void *__src, size_t __n)
{
  unint64_t v7 = *a1;
  unint64_t v6 = a1[1];
  size_t v8 = v6 + __n + 1;
  BOOL v9 = v8 >= *a1;
  size_t v10 = v8 - *a1;
  if (!v9) {
    size_t v10 = 0LL;
  }
  unint64_t v11 = (v10 + 255) & 0xFFFFFFFFFFFFFF00LL;
  unint64_t v12 = v7 + v11;
  __int16 v13 = (char *)a1[2];
  if (v7 + v11 <= v7) {
    goto LABEL_8;
  }
  if (v12 < 0x2000000001LL)
  {
    uint64_t v14 = (char *)realloc((void *)a1[2], v7 + v11);
    if (!v14)
    {
      free(v13);
      goto LABEL_10;
    }

    a1[2] = (unint64_t)v14;
    *a1 = v12;
    __int16 v13 = v14;
    unint64_t v6 = a1[1];
LABEL_8:
    memcpy(&v13[v6], __src, __n);
    uint64_t result = 0LL;
    unint64_t v16 = a1[2];
    uint64_t v17 = a1[1] + __n;
    a1[1] = v17;
    *(_BYTE *)(v16 + v17) = 0;
    return result;
  }

  *__error() = 12;
LABEL_10:
  a1[2] = 0LL;
  uint64_t v18 = __error();
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c",  (uint64_t)"s3StringBufferAppend",  431,  84,  *v18,  "malloc",  v19,  v20,  v21);
  *a1 = 0LL;
  a1[1] = 0LL;
  return 0xFFFFFFFFLL;
}

void s3StringBufferFree(uint64_t a1)
{
  size_t v1 = *(void **)(a1 + 16);
  if (v1) {
    memset_s(*(void **)(a1 + 16), *(void *)a1, 0, *(void *)a1);
  }
  free(v1);
}

uint64_t s3StreamBaseInit(void *__s, char *a2, uint64_t a3, uint64_t a4)
{
  if (__s) {
    memset_s(__s, 0x18uLL, 0, 0x18uLL);
  }
  *__s = a4;
  if (a2)
  {
    size_t v8 = strlen(a2);
    size_t v9 = v8 + 1;
    if (v8 + 1 >= 0x2000000001LL)
    {
      *__error() = 12;
LABEL_10:
      __s[1] = 0LL;
      int v13 = *__error();
      unint64_t v16 = "strdup";
      __int16 v17 = 653;
      goto LABEL_15;
    }

    size_t v10 = malloc(v8 + 1);
    if (!v10) {
      goto LABEL_10;
    }
    unint64_t v11 = v10;
    memcpy(v10, a2, v9);
    __s[1] = v11;
  }

  if (a3) {
    uint64_t v12 = aaS3ContextClone(a3);
  }
  else {
    uint64_t v12 = (uint64_t)AAS3ContextCreate();
  }
  __s[2] = v12;
  if (v12) {
    return 0LL;
  }
  int v13 = *__error();
  unint64_t v16 = "malloc";
  __int16 v17 = 656;
LABEL_15:
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c",  (uint64_t)"s3StreamBaseInit",  v17,  84,  v13,  v16,  v14,  v15,  v19);
  s3StreamBaseRelease((uint64_t)__s);
  return 0xFFFFFFFFLL;
}

uint64_t s3StreamBaseRelease(uint64_t a1)
{
  return memset_s((void *)a1, 0x18uLL, 0, 0x18uLL);
}

AAByteStream_impl *AAS3DownloadStreamOpen(char *a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a2 && *(_DWORD *)a2) {
    return s3DownloadStreamOpen_curl(a1, a2, a3);
  }
  else {
    return s3DownloadStreamOpen_urlsession(a1, a2, a3, a4);
  }
}

void sub_18816C928( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void __copy_helper_block_e8_32w(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_e8_32w(uint64_t a1)
{
}

uint64_t downloadStreamClose_urlsession(void *a1)
{
  if (a1)
  {
    double v2 = (void *)a1[3];
    if (v2)
    {
      a1[3] = 0LL;
      atomic_store([v2 bytesDownloaded], a1 + 5);
      [v2 invalidateAndCancel];
    }

    if (*a1 >> 62)
    {
      gettimeofday(&v11, 0LL);
      double v3 = (double)v11.tv_sec + (double)v11.tv_usec * 0.000001 - *((double *)a1 + 6);
      uint64_t v4 = (FILE **)MEMORY[0x1895F89D0];
      fwrite("AAS3DownloadStream (NSURLSession)\n", 0x22uLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
      fprintf(*v4, "%12u max attempts for a request\n", *((_DWORD *)a1 + 14));
      fprintf(*v4, "%12u max requests in flight\n", *((_DWORD *)a1 + 16));
      fprintf(*v4, "%12.2f initial interval between retries (s)\n", *((float *)a1 + 15));
      uint64_t v5 = *v4;
      unint64_t v6 = atomic_load(a1 + 5);
      unint64_t v7 = atomic_load(a1 + 5);
      fprintf(v5, "%12llu bytes downloaded (%.2f MB)\n", v6, (double)v7 * 0.000000953674316);
      size_t v8 = *v4;
      unint64_t v9 = atomic_load(a1 + 5);
      fprintf(v8, "%12.2f MB/s download speed\n", (double)v9 / v3 * 0.000000953674316);
    }

    s3StreamBaseRelease((uint64_t)a1);
    memset_s(a1, 0x48uLL, 0, 0x48uLL);
    free(a1);
  }

  return 0LL;
}

AAByteStream s3DownloadStreamOpen_urlsession(char *a1, uint64_t a2, uint64_t a3, int a4)
{
  AAByteStream v8 = AACustomByteStreamOpen();
  unint64_t v9 = (double *)malloc(0x48uLL);
  size_t v10 = v9;
  if (!v9 || (memset_s(v9, 0x48uLL, 0, 0x48uLL), !v8))
  {
    perror("malloc");
    goto LABEL_12;
  }

  if ((s3StreamBaseInit(v10, a1, a2, a3) & 0x80000000) != 0)
  {
    uint64_t v20 = "s3StreamBaseInit";
    __int16 v21 = 697;
LABEL_11:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m",  (uint64_t)"s3DownloadStreamOpen_urlsession",  v21,  121,  0,  v20,  v11,  v12,  v23.tv_sec);
LABEL_12:
    free(v8);
    downloadStreamClose_urlsession(v10);
    return 0LL;
  }

  gettimeofday(&v23, 0LL);
  v10[6] = (double)v23.tv_sec + (double)v23.tv_usec * 0.000001;
  v10[7] = 32.0;
  if (a4) {
    int v13 = a4;
  }
  else {
    int v13 = 16;
  }
  *((_DWORD *)v10 + 16) = v13;
  uint64_t v14 = objc_alloc(&OBJC_CLASS___AAS3DownloadSession);
  uint64_t v15 = (void *)MEMORY[0x189604030];
  id v16 = (id)[NSString stringWithUTF8String:a1];
  id v17 = (id)[v15 URLWithString:v16];
  LODWORD(v18) = *((_DWORD *)v10 + 15);
  uint64_t v19 = -[AAS3DownloadSession initWithURL:streamBase:maxAttempts:pauseInterval:maxRequestsInFlight:]( v14,  "initWithURL:streamBase:maxAttempts:pauseInterval:maxRequestsInFlight:",  v17,  v10,  *((unsigned int *)v10 + 14),  *((unsigned int *)v10 + 16),  v18);

  if (!v19)
  {
    uint64_t v20 = "creating session";
    __int16 v21 = 710;
    goto LABEL_11;
  }

  *((void *)v10 + 3) = v19;
  *(void *)AAByteStream v8 = v10;
  *((void *)v8 + 1) = downloadStreamClose_urlsession;
  *((void *)v8 + 4) = downloadStreamPRead_0;
  *((void *)v8 + 2) = downloadStreamRead_0;
  *((void *)v8 + 10) = downloadStreamPReadAsync;
  return v8;
}

uint64_t downloadStreamPRead_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)a1 >> 62 == 3LL) {
    fprintf((FILE *)*MEMORY[0x1895F89D0], "NSURLSession read to buffer nbyte=%zx offset=%llx\n", a3, a4);
  }
  return [*(id *)(a1 + 24) readToBuffer:a2 size:a3 atOffset:a4];
}

uint64_t downloadStreamRead_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v3 = (unint64_t *)(a1 + 32);
  do
    uint64_t v4 = __ldaxr(v3);
  while (__stlxr(v4 + a3, v3));
  return downloadStreamPRead_0(a1, a2, a3, v4);
}

uint64_t downloadStreamPReadAsync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)a1 >> 62 == 3LL) {
    fprintf((FILE *)*MEMORY[0x1895F89D0], "NSURLSession read to stream nbyte=%zx offset=%llx\n", a3, a4);
  }
  return [*(id *)(a1 + 24) readToAsyncByteStream:a2 size:a3 atOffset:a4];
}

uint64_t contextCreate(char **a1, uint64_t a2)
{
  uint64_t v4 = malloc(0x58uLL);
  uint64_t v5 = (uint64_t)v4;
  if (!v4)
  {
    int v7 = *__error();
    size_t v10 = "malloc";
    __int16 v11 = 308;
LABEL_12:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"contextCreate",  v11,  125,  v7,  v10,  v8,  v9,  v16);
    goto LABEL_13;
  }

  memset_s(v4, 0x58uLL, 0, 0x58uLL);
  *(void *)(v5 + 80) = a2;
  if (a1)
  {
    if ((contextSetString(v5, 0, *a1, "KNOX_APPLECONNECT_ACCOUNT") & 0x80000000) != 0
      || (contextSetString(v5, 1u, a1[1], "KNOX_KEYTAB_FILE") & 0x80000000) != 0
      || (contextSetString(v5, 2u, a1[2], "KNOX_DAW_TOKEN") & 0x80000000) != 0
      || (contextSetString(v5, 3u, a1[3], "KNOX_DAW_TOKEN_FILE") & 0x80000000) != 0
      || (contextSetString(v5, 4u, a1[4], "KNOX_WESTGATE_TOKEN") & 0x80000000) != 0
      || (contextSetString(v5, 5u, a1[5], "KNOX_WESTGATE_TOKEN_FILE") & 0x80000000) != 0
      || (contextSetString(v5, 8u, a1[6], "KNOX_USER_AGENT") & 0x80000000) != 0)
    {
      goto LABEL_13;
    }

    unint64_t v6 = a1[7];
  }

  else
  {
    if ((contextSetString(v5, 0, 0LL, "KNOX_APPLECONNECT_ACCOUNT") & 0x80000000) != 0) {
      goto LABEL_13;
    }
    if ((contextSetString(v5, 1u, 0LL, "KNOX_KEYTAB_FILE") & 0x80000000) != 0) {
      goto LABEL_13;
    }
    if ((contextSetString(v5, 2u, 0LL, "KNOX_DAW_TOKEN") & 0x80000000) != 0) {
      goto LABEL_13;
    }
    if ((contextSetString(v5, 3u, 0LL, "KNOX_DAW_TOKEN_FILE") & 0x80000000) != 0) {
      goto LABEL_13;
    }
    if ((contextSetString(v5, 4u, 0LL, "KNOX_WESTGATE_TOKEN") & 0x80000000) != 0) {
      goto LABEL_13;
    }
    if ((contextSetString(v5, 5u, 0LL, "KNOX_WESTGATE_TOKEN_FILE") & 0x80000000) != 0) {
      goto LABEL_13;
    }
    int v13 = contextSetString(v5, 8u, 0LL, "KNOX_USER_AGENT");
    unint64_t v6 = 0LL;
    if (v13 < 0) {
      goto LABEL_13;
    }
  }

  if ((contextSetString(v5, 9u, v6, "KNOX_PROXY") & 0x80000000) != 0)
  {
LABEL_13:
    contextDestroy((char *)v5);
    return 0LL;
  }

  if (!*(void *)(v5 + 16))
  {
    uint64_t v15 = *(char **)(v5 + 24);
    if (v15)
    {
      if ((contextLoadString(v5, 2u, v15) & 0x80000000) != 0)
      {
        size_t v10 = "loading daw token";
        __int16 v11 = 324;
        goto LABEL_31;
      }
    }
  }

  if (!*(void *)(v5 + 32))
  {
    uint64_t v14 = *(char **)(v5 + 40);
    if (v14)
    {
      if ((contextLoadString(v5, 4u, v14) & 0x80000000) != 0)
      {
        size_t v10 = "loading westgate token";
        __int16 v11 = 327;
LABEL_31:
        int v7 = 0;
        goto LABEL_12;
      }
    }
  }

  return v5;
}

uint64_t contextResolveWestgateToken(uint64_t a1, char *__s)
{
  v122[2] = *(const char **)MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 32)) {
    return 0LL;
  }
  uint64_t v5 = *(const char **)(a1 + 16);
  if (v5) {
    goto LABEL_4;
  }
  size_t v11 = strlen(__s);
  size_t v12 = v11 + 200;
  if (v11 + 200 >= 0x2000000001LL)
  {
    *__error() = 12;
LABEL_72:
    uint64_t v65 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"contextGetServiceName",  345,  125,  *v65,  "malloc",  v66,  v67,  v117);
    size_t v27 = 0LL;
    size_t v38 = 0LL;
    size_t v30 = 0LL;
LABEL_101:
    AAJSONInputStreamClose(v38);
    AAByteStreamClose(v30);
    free(v27);
    BOOL v24 = "getting service name and realm";
    __int16 v25 = 649;
    goto LABEL_102;
  }

  uint64_t v26 = malloc(v11 + 200);
  if (!v26) {
    goto LABEL_72;
  }
  size_t v27 = v26;
  size_t v30 = (AAByteStream_impl *)AATempStreamOpen();
  if (!v30)
  {
    size_t v88 = "AATempStreamOpen";
    __int16 v89 = 348;
LABEL_94:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"contextGetServiceName",  v89,  125,  0,  v88,  v28,  v29,  v117);
    size_t v38 = 0LL;
    goto LABEL_101;
  }

  snprintf((char *)v27, v12, "https://%s/westgate/appinfo", __s);
  if ((knoxRequest(a1, 1u, (char *)v27, 0LL, (uint64_t)v30) & 0x80000000) != 0)
  {
    char v117 = (char)v27;
    size_t v88 = "Knox request failed: %s";
    __int16 v89 = 351;
    goto LABEL_94;
  }

  AAByteStreamSeek(v30, 0LL, 0);
  uint64_t v31 = (void **)AAJSONInputStreamOpen((uint64_t)v30);
  size_t v38 = v31;
  if (!v31)
  {
    char v100 = "AAJSONInputStreamOpen";
    __int16 v101 = 356;
    goto LABEL_100;
  }

  if ((AAJSONInputStreamRead((uint64_t)v31, (int *)&__sa, v32, v33, v34, v35, v36, v37) & 0x80000000) != 0)
  {
LABEL_95:
    char v100 = "parsing JSON";
    __int16 v101 = 363;
    goto LABEL_100;
  }

  int v43 = 0;
  int v44 = 0;
  while (1)
  {
    if (__sa < 2)
    {
      if (v44 == 1 && __s1 && !strcmp(__s1, "idms")) {
        int v43 = 1;
      }
      ++v44;
      goto LABEL_41;
    }

    if ((_DWORD)__sa != 2)
    {
      if ((_DWORD)__sa == 3)
      {
        if (v43)
        {
          uint64_t v45 = __s1;
          if (__s1)
          {
            if (strcmp(__s1, "realm"))
            {
LABEL_33:
              if (!strcmp(v45, "serviceName") && (contextSetString(a1, 7u, v121, 0LL) & 0x80000000) != 0)
              {
                char v100 = "serviceName";
                __int16 v101 = 378;
                goto LABEL_100;
              }

              goto LABEL_41;
            }

            if ((contextSetString(a1, 6u, v121, 0LL) & 0x80000000) == 0)
            {
              uint64_t v45 = __s1;
              goto LABEL_33;
            }

            char v100 = "realm";
            __int16 v101 = 377;
LABEL_100:
            pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"contextGetServiceName",  v101,  125,  0,  v100,  v36,  v37,  v118);
            goto LABEL_101;
          }
        }
      }

void contextDestroy(char *a1)
{
  if (a1)
  {
    for (uint64_t i = 0LL; i != 80; i += 8LL)
      free(*(void **)&a1[i]);
    free(a1);
  }

uint64_t knoxRequest(uint64_t a1, unsigned int a2, char *a3, const char **a4, uint64_t a5)
{
  v77[0] = 0LL;
  v77[1] = 0LL;
  __int128 v75 = 0uLL;
  uint64_t v76 = 0LL;
  uint64_t v72 = 0LL;
  uint64_t v73 = 0LL;
  uint64_t v74 = 0LL;
  size_t v10 = AAS3ContextCreate();
  uint64_t v78 = (uint64_t)v10;
  if (!v10)
  {
    __int128 v57 = "AAS3ContextCreate";
    __int16 v58 = 189;
LABEL_41:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"knoxRequest",  v58,  125,  0,  v57,  v11,  v12,  v68);
    uint64_t v22 = 0LL;
LABEL_42:
    uint64_t v29 = 0LL;
    uint64_t v28 = 0LL;
LABEL_43:
    uint64_t v59 = 0xFFFFFFFFLL;
    goto LABEL_44;
  }

  uint64_t v13 = (uint64_t)v10;
  __int16 v14 = malloc(0x18uLL);
  int v15 = v14;
  if (!v14)
  {
    uint64_t v22 = (uint64_t (**)(int *))calloc(1uLL, 0x68uLL);
    goto LABEL_40;
  }

  memset_s(v14, 0x18uLL, 0, 0x18uLL);
  char v16 = (uint64_t (**)(int *))calloc(1uLL, 0x68uLL);
  uint64_t v22 = v16;
  if (!v16)
  {
LABEL_40:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"knoxPageStreamOpen",  165,  125,  0,  "malloc",  v20,  v21,  v68);
    free(v15);
    free(v22);
    __int128 v57 = "open page stream";
    __int16 v58 = 192;
    goto LABEL_41;
  }

  void *v15 = a5;
  void *v16 = (uint64_t (*)(int *))v15;
  v16[1] = knoxPageStreamClose;
  v16[3] = (uint64_t (*)(int *))knoxPageStreamWrite;
  if ((AAS3ContextSetFieldString(v13, 5, *(char **)(a1 + 64), v17, v18, v19, v20, v21) & 0x80000000) != 0)
  {
    __int16 v61 = 194;
LABEL_47:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"knoxRequest",  v61,  125,  0,  "setup context",  v26,  v27,  v68);
    goto LABEL_42;
  }

  if ((AAS3ContextSetFieldString(v13, 0, *(char **)(a1 + 72), v23, v24, v25, v26, v27) & 0x80000000) != 0)
  {
    __int16 v61 = 195;
    goto LABEL_47;
  }

  uint64_t v28 = (char *)malloc(0x800uLL);
  if (!v28)
  {
    int v62 = *__error();
    __int16 v63 = 200;
LABEL_53:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"knoxRequest",  v63,  125,  v62,  "malloc",  v55,  v56,  v68);
    uint64_t v29 = 0LL;
    goto LABEL_43;
  }

  uint64_t v29 = 0LL;
  size_t v30 = "link:";
  uint64_t v70 = a3;
  unint64_t v71 = a4;
  while (2)
  {
    memset_s(v28, 0x800uLL, 0, 0x800uLL);
    __int128 v75 = 0uLL;
    uint64_t v76 = v22;
    uint64_t v72 = v28;
    uint64_t v73 = 2047LL;
    uint64_t v33 = a3;
    uint64_t v74 = 0LL;
    if (v29)
    {
      if (v22[1] == knoxPageStreamClose)
      {
        uint64_t v34 = *v22;
        if (!*((_DWORD *)v34 + 5) || AAByteStreamWrite(*(AAByteStream *)v34, ",", 1uLL) == 1)
        {
          *(void *)((char *)v34 + 12) = 1LL;
LABEL_15:
          *((_DWORD *)v34 + 5) = 0;
          uint64_t v33 = v29;
          goto LABEL_16;
        }

        __int16 v64 = "writing ','";
        __int16 v65 = 146;
      }

      else
      {
        __int16 v64 = "invalid stream";
        __int16 v65 = 132;
      }

      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"knoxPageStreamEndPage",  v65,  125,  0,  v64,  v31,  v32,  v68);
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"knoxRequest",  209,  125,  0,  "page stream next page",  v66,  v67,  v69);
      goto LABEL_43;
    }

uint64_t contextGetDecryptionComponents( uint64_t a1, const char *a2, const char *a3, const char *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  v75[2] = *(const char **)MEMORY[0x1895F89C0];
  uint64_t v8 = *(char **)(a1 + 32);
  unint64_t v9 = *(void *)(a1 + 80);
  *a5 = 0LL;
  *a6 = 0LL;
  if (!v8)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"contextGetDecryptionComponents",  568,  125,  0,  "missing Westgate token",  a7,  a8,  v64);
    uint64_t v21 = 0LL;
    uint64_t v18 = 0LL;
LABEL_14:
    uint64_t v27 = 0LL;
    goto LABEL_15;
  }

  if (v9 >> 62) {
    fwrite("  requesting decryption components from the Knox server\n", 0x38uLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
  }
  uint64_t v18 = (AAByteStream_impl *)AATempStreamOpen();
  if (!v18)
  {
    uint64_t v22 = "AATempStreamOpen";
    __int16 v23 = 573;
    int v24 = 0;
LABEL_13:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"contextGetDecryptionComponents",  v23,  125,  v24,  v22,  v16,  v17,  v64);
    uint64_t v21 = 0LL;
    uint64_t v8 = 0LL;
    goto LABEL_14;
  }

  size_t v19 = strlen(a2);
  size_t v20 = v19 + 200;
  if (v19 + 200 >= 0x2000000001LL)
  {
    *__error() = 12;
LABEL_12:
    int v24 = *__error();
    uint64_t v22 = "malloc";
    __int16 v23 = 577;
    goto LABEL_13;
  }

  __str = (char *)malloc(v19 + 200);
  if (!__str) {
    goto LABEL_12;
  }
  size_t v25 = strlen(v8);
  size_t v26 = v25 + 200;
  if (v25 + 200 >= 0x2000000001LL)
  {
    *__error() = 12;
LABEL_54:
    uint64_t v59 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"contextGetDecryptionComponents",  580,  125,  *v59,  "malloc",  v60,  v61,  v64);
    uint64_t v21 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v28 = 0xFFFFFFFFLL;
    uint64_t v27 = __str;
    goto LABEL_16;
  }

  size_t v30 = (char *)malloc(v25 + 200);
  if (!v30) {
    goto LABEL_54;
  }
  __int16 v65 = v8;
  uint64_t v8 = v30;
  snprintf(v30, v26, "Authorization: Bearer %s", v65);
  v75[0] = v8;
  v75[1] = 0LL;
  uint64_t v67 = a4;
  uint64_t v27 = __str;
  snprintf(__str, v20, "https://%s/spaces/%s/files/%s/decryption-components", a2, a3, v67);
  if ((knoxRequest(a1, 2u, __str, v75, (uint64_t)v18) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"contextGetDecryptionComponents",  587,  125,  0,  "Knox request failed: %s",  v31,  v32,  (char)__str);
    uint64_t v21 = 0LL;
    goto LABEL_15;
  }

  AAByteStreamSeek(v18, 0LL, 0);
  uint64_t v33 = (void **)AAJSONInputStreamOpen((uint64_t)v18);
  uint64_t v21 = v33;
  if (!v33)
  {
    int v62 = "AAJSONInputStreamOpen";
    __int16 v63 = 592;
    goto LABEL_62;
  }

  if ((AAJSONInputStreamRead((uint64_t)v33, (int *)&v72, v34, v35, v36, v37, v38, v39) & 0x80000000) != 0)
  {
LABEL_56:
    int v62 = "parsing JSON";
    __int16 v63 = 600;
    goto LABEL_62;
  }

  int v44 = 0;
  int v45 = 0;
  int v46 = 0;
  uint64_t v70 = v8;
  while (v72 >= 2)
  {
    if (v72 == 2)
    {
      int v45 = 0;
      int v44 = 0;
      --v46;
      goto LABEL_47;
    }

    if (v72 != 3) {
      goto LABEL_47;
    }
    uint64_t v47 = __s1;
    if (v46 == 2 && v45 && __s1 && !strcmp(__s1, "key"))
    {
      int v68 = v44;
      char v48 = __s;
      if (!__s) {
        goto LABEL_64;
      }
      size_t v49 = strlen(__s);
      size_t v50 = v49 + 1;
      if (v49 + 1 >= 0x2000000001LL)
      {
        *__error() = 12;
LABEL_64:
        *a6 = 0LL;
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"contextGetDecryptionComponents",  618,  125,  0,  "key",  v38,  v39,  v66);
        uint64_t v8 = v70;
        uint64_t v27 = __str;
        goto LABEL_15;
      }

      uint64_t v51 = malloc(v49 + 1);
      if (!v51) {
        goto LABEL_64;
      }
      size_t v52 = v51;
      memcpy(v51, v48, v50);
      *a6 = v52;
      uint64_t v27 = __str;
      int v44 = v68;
    }

    if (v46 != 2 || !v44 || !v47)
    {
      uint64_t v8 = v70;
      goto LABEL_47;
    }

    if (!strcmp(v47, "uri"))
    {
      int v69 = v44;
      size_t v54 = __s;
      uint64_t v8 = v70;
      if (!__s) {
        goto LABEL_66;
      }
      size_t v55 = strlen(__s);
      size_t v56 = v55 + 1;
      if (v55 + 1 >= 0x2000000001LL)
      {
        *__error() = 12;
LABEL_66:
        *a5 = 0LL;
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"contextGetDecryptionComponents",  623,  125,  0,  "uri",  v38,  v39,  v66);
        uint64_t v27 = __str;
        goto LABEL_15;
      }

      __int128 v57 = malloc(v55 + 1);
      if (!v57) {
        goto LABEL_66;
      }
      __int16 v58 = v57;
      memcpy(v57, v54, v56);
      *a5 = v58;
      int v46 = 2;
      uint64_t v27 = __str;
      int v44 = v69;
    }

    else
    {
      int v46 = 2;
      uint64_t v8 = v70;
    }

uint64_t AAS3KnoxResolveURL( const char *a1, char **a2, void *a3, size_t a4, _BYTE *a5, size_t *a6, unint64_t a7)
{
  __s = 0LL;
  if (strncmp(a1, "knox://", 7uLL))
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"AAS3KnoxResolveURL",  854,  125,  0,  "invalid Knox scheme: %s",  v14,  v15,  (char)a1);
LABEL_13:
    __int16 v23 = 0LL;
    int v24 = 0LL;
    size_t v20 = 0LL;
    goto LABEL_14;
  }

  uint64_t v16 = a1 + 7;
  uint64_t v17 = strchr(a1 + 7, 47);
  size_t v20 = v17;
  if (!v17)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"AAS3KnoxResolveURL",  859,  125,  0,  "invalid Knox host: %s",  v18,  v19,  (char)a1);
    __int16 v23 = 0LL;
    int v24 = 0LL;
LABEL_14:
    uint64_t v32 = 0LL;
    size_t v26 = 0LL;
    goto LABEL_15;
  }

  uint64_t v21 = (char *)(v17 - v16);
  size_t v22 = v17 - v16 + 1;
  if (v22 >= 0x2000000001LL)
  {
    *__error() = 12;
LABEL_12:
    int v33 = *__error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"AAS3KnoxResolveURL",  863,  125,  v33,  "malloc",  v34,  v35,  v72);
    goto LABEL_13;
  }

  uint64_t v73 = a6;
  size_t v25 = (char *)malloc(v22);
  if (!v25) {
    goto LABEL_12;
  }
  size_t v26 = v25;
  memcpy(v25, a1 + 7, v20 - v16);
  v21[(void)v26] = 0;
  if (strncmp(v20 + 1, "download/", 9uLL))
  {
    char v72 = (char)a1;
    uint64_t v29 = "invalid Knox action: %s";
    __int16 v30 = 869;
LABEL_10:
    int v31 = 0;
LABEL_11:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"AAS3KnoxResolveURL",  v30,  125,  v31,  v29,  v27,  v28,  v72);
    __int16 v23 = 0LL;
    int v24 = 0LL;
    size_t v20 = 0LL;
    uint64_t v32 = 0LL;
    goto LABEL_15;
  }

  uint64_t v38 = v20 + 10;
  uint64_t v39 = strchr(v38, 47);
  if (!v39)
  {
    char v72 = (char)a1;
    uint64_t v29 = "invalid Knox space: %s";
    __int16 v30 = 874;
    goto LABEL_10;
  }

  uint64_t v40 = v39;
  size_t v41 = v39 - v38;
  size_t v42 = v39 - v38 + 1;
  if (v42 >= 0x2000000001LL)
  {
    *__error() = 12;
LABEL_37:
    int v31 = *__error();
    uint64_t v29 = "malloc";
    __int16 v30 = 878;
    goto LABEL_11;
  }

  uint64_t v43 = (char *)malloc(v42);
  if (!v43) {
    goto LABEL_37;
  }
  uint64_t v32 = v43;
  memcpy(v43, v38, v41);
  size_t v44 = 0LL;
  v32[v41] = 0;
  int v45 = v40 + 1;
  int v46 = v40 + 1;
  do
  {
    size_t v47 = v44;
    unsigned int v48 = (char)v45[v44];
    if (!v45[v44]) {
      break;
    }
    if ((v48 & 0x80000000) != 0)
    {
      int v49 = __maskrune((char)v45[v44], 0x4000uLL);
      int v45 = v46;
    }

    else
    {
      int v49 = *(_DWORD *)(MEMORY[0x1895F8770] + 4LL * v48 + 60) & 0x4000;
    }

    if (v48 == 35) {
      break;
    }
    size_t v44 = v47 + 1;
  }

  while (!v49);
  if (v47 + 1 >= 0x2000000001LL)
  {
    *__error() = 12;
LABEL_48:
    uint64_t v67 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"AAS3KnoxResolveURL",  895,  125,  *v67,  "malloc",  v68,  v69,  v72);
    __int16 v23 = 0LL;
    int v24 = 0LL;
    size_t v20 = 0LL;
    goto LABEL_15;
  }

  uint64_t v51 = (char *)malloc(v47 + 1);
  if (!v51) {
    goto LABEL_48;
  }
  size_t v20 = v51;
  memcpy(v51, v46, v47);
  v20[v47] = 0;
  if (a7 >> 62)
  {
    size_t v52 = (FILE **)MEMORY[0x1895F89D0];
    fwrite("Knox resolve URL\n", 0x11uLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
    fprintf(*v52, "  host: %s\n", v26);
    fprintf(*v52, "  space: %s\n", v32);
    fprintf(*v52, "  file digest: %s\n", v20);
  }

  uint64_t v53 = contextCreate(a2, a7);
  int v24 = (char *)v53;
  if (!v53)
  {
    uint64_t v70 = "contextInit failed";
    __int16 v71 = 909;
LABEL_51:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"AAS3KnoxResolveURL",  v71,  125,  0,  v70,  v54,  v55,  v72);
    __int16 v23 = 0LL;
    goto LABEL_15;
  }

  if ((contextResolveWestgateToken(v53, v26) & 0x80000000) != 0)
  {
    uint64_t v70 = "getting Westgate token";
    __int16 v71 = 912;
    goto LABEL_51;
  }

  if ((contextGetDecryptionComponents((uint64_t)v24, v26, v32, v20, a3, &__s, v54, v55) & 0x80000000) != 0)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"AAS3KnoxResolveURL",  915,  125,  0,  "getting decryption credentials",  v56,  v57,  v72);
    uint64_t v36 = 0xFFFFFFFFLL;
    __int16 v23 = __s;
    goto LABEL_16;
  }

  __int16 v23 = __s;
  size_t v58 = strlen(__s);
  if (!v58 || (v58 & 1) != 0)
  {
    char v72 = v58;
    __int16 v65 = "invalid key length: %zu";
    __int16 v66 = 919;
  }

  else
  {
    size_t v64 = v58 >> 1;
    if (v58 >> 1 <= a4)
    {
      if ((aaParseHexString(v58 >> 1, a5, (uint64_t)__s, v59, v60, v61, v62, v63) & 0x80000000) == 0)
      {
        uint64_t v36 = 0LL;
        size_t *v73 = v64;
        goto LABEL_16;
      }

      __int16 v65 = "invalid hex key";
      __int16 v66 = 922;
    }

    else
    {
      __int16 v65 = "key_capacity is too low";
      __int16 v66 = 921;
    }
  }

  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"AAS3KnoxResolveURL",  v66,  125,  0,  v65,  v62,  v63,  v72);
LABEL_15:
  uint64_t v36 = 0xFFFFFFFFLL;
LABEL_16:
  free(v26);
  free(v32);
  free(v20);
  free(v23);
  contextDestroy(v24);
  return v36;
}

uint64_t contextSetString(uint64_t a1, unsigned int a2, char *__s, char *a4)
{
  uint64_t v4 = __s;
  if (!__s)
  {
    if (a4) {
      uint64_t v4 = getenv(a4);
    }
  }

  if (!v4)
  {
    uint64_t result = 0LL;
    *(void *)(a1 + 8LL * a2) = 0LL;
    return result;
  }

  size_t v7 = strlen(v4);
  size_t v8 = v7 + 1;
  if (v7 + 1 < 0x2000000001LL)
  {
    size_t v10 = malloc(v7 + 1);
    if (v10)
    {
      uint64_t v11 = v10;
      memcpy(v10, v4, v8);
      uint64_t result = 0LL;
      *(void *)(a1 + 8LL * a2) = v11;
      return result;
    }
  }

  else
  {
    *__error() = 12;
  }

  *(void *)(a1 + 8LL * a2) = 0LL;
  uint64_t v12 = __error();
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"contextSetString",  259,  125,  *v12,  "malloc",  v13,  v14,  v15);
  return 0xFFFFFFFFLL;
}

uint64_t contextLoadString(uint64_t a1, unsigned int a2, char *a3)
{
  int v6 = open(a3, 0);
  if ((v6 & 0x80000000) == 0)
  {
    int v7 = v6;
    if (fstat(v6, &v33) < 0
      || ((st_size = v33.st_size, (v33.st_mode & 0xF000) == 0x8000) ? (BOOL v11 = v33.st_size == 0) : (BOOL v11 = 1), v11))
    {
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"contextLoadString",  274,  125,  0,  "invalid file: %s",  v8,  v9,  (char)a3);
    }

    else
    {
      if ((unint64_t)(v33.st_size + 1) < 0x2000000001LL)
      {
        uint64_t v16 = malloc(v33.st_size + 1);
        if (v16)
        {
          uint64_t v17 = v16;
          ssize_t v18 = read(v7, v16, st_size);
          if (v18 < 0)
          {
            int v29 = *__error();
            __int16 v30 = 280;
            int v31 = a3;
          }

          else
          {
            if (v18 == st_size)
            {
              uint64_t v21 = MEMORY[0x1895F8770];
              do
              {
                off_t v22 = st_size;
                if (!st_size) {
                  break;
                }
                unsigned int v23 = (char)v17[st_size - 1];
                int v24 = (v23 & 0x80000000) != 0 ? __maskrune(v23, 0x4000uLL) : *(_DWORD *)(v21 + 4LL * v23 + 60) & 0x4000;
                --st_size;
              }

              while (v24);
              uint64_t v15 = 0LL;
              v17[v22] = 0;
              *(void *)(a1 + 8LL * a2) = v17;
              goto LABEL_25;
            }

            int v31 = "truncated read";
            __int16 v30 = 281;
            int v29 = 0;
          }

          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"contextLoadString",  v30,  125,  v29,  v31,  v19,  v20,  v32);
LABEL_24:
          free(v17);
          uint64_t v15 = 0xFFFFFFFFLL;
LABEL_25:
          close(v7);
          return v15;
        }
      }

      else
      {
        *__error() = 12;
      }

      int v25 = *__error();
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"contextLoadString",  277,  125,  v25,  "malloc",  v26,  v27,  v32);
    }

    uint64_t v17 = 0LL;
    goto LABEL_24;
  }

  uint64_t v12 = __error();
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"contextLoadString",  273,  125,  *v12,  a3,  v13,  v14,  v32);
  return 0xFFFFFFFFLL;
}

uint64_t knoxPageStreamClose(int *a1)
{
  if (!a1) {
    return 0LL;
  }
  if (a1[2] >= 1 && a1[4] && AAByteStreamWrite(*(AAByteStream *)a1, "]\n", 2uLL) != 2)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"knoxPageStreamClose",  67,  125,  0,  "writing final ']'",  v2,  v3,  v6);
    uint64_t v4 = 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  free(a1);
  return v4;
}

uint64_t knoxPageStreamWrite( uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a3;
  uint64_t v9 = a2;
  int v11 = *(_DWORD *)(a1 + 8);
  if (v11)
  {
    if (v11 < 1)
    {
      uint64_t v12 = 0LL;
      goto LABEL_28;
    }
  }

  else
  {
    if (!a3 || *a2 != 91)
    {
      uint64_t v12 = 0LL;
      *(_DWORD *)(a1 + 8) = -1;
      goto LABEL_28;
    }

    *(_DWORD *)(a1 + 8) = 1;
  }

  uint64_t v12 = 0LL;
  if (a3 && *(_DWORD *)(a1 + 12))
  {
    if (*a2 != 91)
    {
      uint64_t v14 = "expected '['";
      __int16 v15 = 93;
LABEL_41:
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"knoxPageStreamWrite",  v15,  125,  0,  v14,  a7,  a8,  v23);
      return -1LL;
    }

    *(_DWORD *)(a1 + 12) = 0;
    uint64_t v9 = a2 + 1;
    uint64_t v8 = a3 - 1;
    uint64_t v12 = 1LL;
  }

  if (!v8) {
    goto LABEL_35;
  }
  if (!*(_DWORD *)(a1 + 16))
  {
    uint64_t v13 = 0LL;
    goto LABEL_18;
  }

  if (AAByteStreamWrite(*(AAByteStream *)a1, "]", 1uLL) != 1)
  {
    uint64_t v14 = "writing ']'";
    __int16 v15 = 105;
    goto LABEL_41;
  }

  *(_DWORD *)(a1 + 16) = 0;
  uint64_t v13 = 1LL;
LABEL_18:
  uint64_t v16 = v12 + 1;
  uint64_t v17 = v8 - 1;
  uint64_t v18 = MEMORY[0x1895F8770];
  while (1)
  {
    unsigned int v19 = (char)v9[v17];
    if ((v19 & 0x80000000) != 0) {
      break;
    }
    if ((*(_DWORD *)(v18 + 4LL * v19 + 60) & 0x4000) == 0) {
      goto LABEL_25;
    }
LABEL_23:
    ++v16;
    if (--v17 == -1) {
      goto LABEL_27;
    }
  }

  if (__maskrune(v19, 0x4000uLL)) {
    goto LABEL_23;
  }
LABEL_25:
  if (v9[v17] == 93)
  {
    *(_DWORD *)(a1 + 16) = 1;
    uint64_t v12 = v16;
    uint64_t v8 = v17;
  }

LABEL_35:
      uint64_t v13 = 0LL;
      goto LABEL_39;
    }

    uint64_t v13 = -1LL;
LABEL_37:
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c",  (uint64_t)"knoxPageStreamWrite",  124,  125,  0,  "write",  a7,  a8,  v23);
  }

  else
  {
LABEL_39:
    v13 += v12;
  }

  return v13;
}

size_t pc_log_error( uint64_t a1, uint64_t a2, __int16 a3, int a4, int a5, const char *a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  bzero(__str, 0x400uLL);
  uint64_t v13 = (_WORD *)(((a3 & 0x3FFF) << 10) | (a4 << 24) | a5 & 0x3FF | 0x80000000);
  if (a5 >= 1)
  {
    uint64_t v14 = strerror(a5);
    snprintf(__str, 0x400uLL, "%s: ", v14);
  }

  size_t v15 = strlen(__str);
  vsnprintf(&__str[v15], 1024 - v15, a6, &a9);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    pc_log_error_cold_1((uint64_t)__str, (int)v13);
  }
  return ParallelCompressionUpdateError(v13, (size_t)__str);
}

uint64_t pc_log_warning( uint64_t a1, uint64_t a2, __int16 a3, int a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  bzero(__s, 0x400uLL);
  uint64_t v12 = ((a3 & 0x3FFF) << 10) | (a4 << 24) | 0x80000000;
  size_t v13 = strlen(__s);
  vsnprintf(&__s[v13], 1024 - v13, a5, &a9);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v16 = v12;
    __int16 v17 = 2080;
    uint64_t v18 = __s;
    _os_log_impl(&dword_188046000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "[0x%08x](warning) %s", buf, 0x12u);
  }

  return ParallelCompressionUpdateWarning(v12, __s);
}

void pc_log_error_cold_1(uint64_t a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v2[0] = 67109378;
  v2[1] = a2;
  __int16 v3 = 2080;
  uint64_t v4 = a1;
  _os_log_error_impl(&dword_188046000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR, "[0x%08x] %s", (uint8_t *)v2, 0x12u);
}

size_t appendThreadErrorContextString(size_t result)
{
  if (result)
  {
    size_t v1 = (const void *)result;
    uint64_t result = strlen((const char *)result);
    if (result - 8193 >= 0xFFFFFFFFFFFFE000LL)
    {
      size_t v2 = result;
      pthread_key_t ErrorContextKey = getErrorContextKey();
      uint64_t result = (size_t)pthread_getspecific(ErrorContextKey);
      if (result)
      {
        size_t v4 = result;
        __int16 v5 = v2 + 3;
        uint64_t v6 = *(unsigned __int16 *)(result + 72);
        if (v6 + (unsigned __int16)(v2 + 3) <= *(unsigned __int16 *)(result + 74))
        {
          size_t v7 = result + v6;
          *(_WORD *)(v7 + 76) = v5;
          size_t v8 = v7 + 78;
          uint64_t result = (size_t)memcpy((void *)(v7 + 78), v1, v2);
          *(_BYTE *)(v8 + v2) = 0;
          *(_WORD *)(v4 + 72) += v5;
        }
      }
    }
  }

  return result;
}

_WORD *updateThreadErrorContextErrorCode(_WORD *result)
{
  if ((result & 0x80000000) != 0)
  {
    int v1 = (int)result;
    pthread_key_t ErrorContextKey = getErrorContextKey();
    uint64_t result = pthread_getspecific(ErrorContextKey);
    if (result)
    {
      if ((*(_DWORD *)result & 0x80000000) == 0)
      {
        *(_DWORD *)uint64_t result = v1;
        result[3] = 0;
      }
    }
  }

  return result;
}

_DWORD *updateThreadErrorContextWarningCode(_DWORD *result)
{
  if ((result & 0x80000000) != 0)
  {
    int v1 = (int)result;
    pthread_key_t ErrorContextKey = getErrorContextKey();
    uint64_t result = pthread_getspecific(ErrorContextKey);
    if (result)
    {
      if ((*result & 0x80000000) == 0)
      {
        uint64_t v3 = *((unsigned __int16 *)result + 3);
        if (v3 <= 0xF)
        {
          result[v3 + 2] = v1;
          *((_WORD *)result + 3) = v3 + 1;
        }
      }
    }
  }

  return result;
}

size_t ParallelCompressionUpdateError(_WORD *a1, size_t a2)
{
  return appendThreadErrorContextString(a2);
}

uint64_t getErrorContextKey()
{
  if (pthread_once(&getErrorContextKey_errorContextOnce, (void (*)(void))createErrorContextKey))
  {
    v0 = __error();
    pc_log_error( "/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/Threads.c",  "getErrorContextKey",  53LL,  5LL,  *v0,  "pthread_once");
  }

  return gErrorContextKey;
}

uint64_t createErrorContextKey()
{
  uint64_t result = pthread_key_create((pthread_key_t *)&gErrorContextKey, 0LL);
  if ((_DWORD)result)
  {
    int v1 = __error();
    return pc_log_error( "/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/Threads.c",  "createErrorContextKey",  42LL,  5LL,  *v1,  "pthread_key_create");
  }

  return result;
}

uint64_t aaParseHexString( int a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = (2 * a1);
  if (!(_DWORD)v8)
  {
LABEL_13:
    int v11 = 0;
    return (v11 << 31 >> 31);
  }

  char v9 = 0;
  uint64_t v10 = 0LL;
  int v11 = 1;
  while (1)
  {
    int v12 = *(unsigned __int8 *)(a3 + v10);
    if (!*(_BYTE *)(a3 + v10))
    {
      uint64_t v14 = "truncated hex string";
      __int16 v15 = 13;
      goto LABEL_16;
    }

    char v13 = -48;
LABEL_10:
    char v9 = v13 + 16 * v9 + v12;
    if ((v10 & 1) != 0)
    {
      *a2++ = v9;
      char v9 = 0;
    }

    int v11 = ++v10 < v8;
    if (v8 == v10) {
      goto LABEL_13;
    }
  }

  if ((v12 - 97) < 6)
  {
    char v13 = -87;
    goto LABEL_10;
  }

  if ((v12 - 65) < 6)
  {
    char v13 = -55;
    goto LABEL_10;
  }

  uint64_t v14 = "invalid hex string";
  __int16 v15 = 18;
LABEL_16:
  pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AASerialization.c",  (uint64_t)"aaParseHexString",  v15,  106,  0,  v14,  a7,  a8,  v17);
  return (v11 << 31 >> 31);
}

uint64_t jsonPushLabel(uint64_t a1, char a2)
{
  unint64_t v4 = *(void *)(a1 + 72);
  unint64_t v5 = *(void *)(a1 + 80);
  uint64_t v6 = (void *)(a1 + 72);
  if (v5 >= v4)
  {
    if (v4) {
      size_t v8 = v4 + (v4 >> 1);
    }
    else {
      size_t v8 = 256LL;
    }
    *(void *)(a1 + 72) = v8;
    size_t v7 = reallocf(*(void **)(a1 + 88), v8);
    *(void *)(a1 + 88) = v7;
    if (!v7)
    {
      uint64_t v10 = __error();
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c",  (uint64_t)"jsonPushLabel",  358,  109,  *v10,  "malloc",  v11,  v12,  v14);
      *uint64_t v6 = 0LL;
      v6[1] = 0LL;
      return 0xFFFFFFFFLL;
    }

    unint64_t v5 = *(void *)(a1 + 80);
  }

  else
  {
    size_t v7 = *(_BYTE **)(a1 + 88);
  }

  uint64_t v9 = 0LL;
  *(void *)(a1 + 80) = v5 + 1;
  v7[v5] = a2;
  return v9;
}

uint64_t jsonPushValue(uint64_t a1, char a2)
{
  unint64_t v4 = *(void *)(a1 + 96);
  unint64_t v5 = *(void *)(a1 + 104);
  uint64_t v6 = (void *)(a1 + 96);
  if (v5 >= v4)
  {
    if (v4) {
      size_t v8 = v4 + (v4 >> 1);
    }
    else {
      size_t v8 = 256LL;
    }
    *(void *)(a1 + 96) = v8;
    size_t v7 = reallocf(*(void **)(a1 + 112), v8);
    *(void *)(a1 + 112) = v7;
    if (!v7)
    {
      uint64_t v10 = __error();
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c",  (uint64_t)"jsonPushValue",  372,  109,  *v10,  "malloc",  v11,  v12,  v14);
      *uint64_t v6 = 0LL;
      v6[1] = 0LL;
      return 0xFFFFFFFFLL;
    }

    unint64_t v5 = *(void *)(a1 + 104);
  }

  else
  {
    size_t v7 = *(_BYTE **)(a1 + 112);
  }

  uint64_t v9 = 0LL;
  *(void *)(a1 + 104) = v5 + 1;
  v7[v5] = a2;
  return v9;
}

void *AAJSONInputStreamOpen(uint64_t a1)
{
  size_t v2 = malloc(0x78uLL);
  uint64_t v3 = v2;
  if (v2)
  {
    memset_s(v2, 0x78uLL, 0, 0x78uLL);
    v3[1] = a1;
    void v3[5] = 0x10000LL;
    unint64_t v4 = malloc(0x10000uLL);
    v3[8] = v4;
    if (v4)
    {
      *(void *)((char *)v3 + 20) = 32LL;
      v3[4] = calloc(0x20uLL, 4uLL);
    }

    else
    {
      size_t v8 = __error();
      pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c",  (uint64_t)"AAJSONInputStreamOpen",  387,  109,  *v8,  "malloc",  v9,  v10,  v12);
      AAJSONInputStreamClose((void **)v3);
      return 0LL;
    }
  }

  else
  {
    unint64_t v5 = __error();
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c",  (uint64_t)"AAJSONInputStreamOpen",  382,  109,  *v5,  "malloc",  v6,  v7,  v12);
  }

  return v3;
}

void AAJSONInputStreamClose(void **a1)
{
  if (a1)
  {
    free(a1[4]);
    free(a1[11]);
    free(a1[14]);
    free(a1[8]);
    free(a1);
  }

uint64_t AAJSONInputStreamRead( uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10 = *(_DWORD *)(a1 + 16);
  if (v10 == 9 || v10 == -1)
  {
    pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c",  (uint64_t)"AAJSONInputStreamRead",  418,  109,  0,  "unexpected read call",  a7,  a8,  v46);
    return 0xFFFFFFFFLL;
  }

  *(void *)(a1 + 80) = 0LL;
  *(void *)(a1 + 104) = 0LL;
  uint64_t v14 = MEMORY[0x1895F8770];
  while (2)
  {
    unint64_t v15 = *(void *)(a1 + 56);
    int v16 = *(unsigned __int8 **)(a1 + 64);
    if (v15 >= *(void *)(a1 + 48))
    {
      ssize_t v17 = AAByteStreamRead(*(AAByteStream *)(a1 + 8), v16, *(void *)(a1 + 40));
      if (v17 < 0)
      {
        pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c",  (uint64_t)"AAJSONInputStreamRead",  430,  109,  0,  "read error: %zd",  a7,  a8,  v17);
LABEL_104:
        uint64_t result = 0xFFFFFFFFLL;
        *(_DWORD *)(a1 + 16) = -1;
        return result;
      }

      if (!v17)
      {
        __int16 v30 = "EOF reached";
        __int16 v31 = 431;
        goto LABEL_103;
      }

      unint64_t v15 = 0LL;
      *(void *)(a1 + 48) = v17;
      int v16 = *(unsigned __int8 **)(a1 + 64);
    }

    *(void *)(a1 + 56) = v15 + 1;
    int v18 = v16[v15];
    char v19 = v16[v15];
    switch(*(_DWORD *)(a1 + 16))
    {
      case 0:
        *(void *)(a1 + 104) = 0LL;
        if ((char)v18 < 0)
        {
        }

        else if ((*(_DWORD *)(v14 + 4LL * (char)v18 + 60) & 0x4000) != 0)
        {
          continue;
        }

        if (v18 == 34) {
          goto LABEL_68;
        }
        if (v18 == 43 || v18 == 45 || ((char)v18 - 48) <= 9)
        {
          if ((jsonPushValue(a1, v18) & 0x80000000) == 0)
          {
            int v23 = 3;
            goto LABEL_69;
          }

          __int16 v30 = "jsonPushValue";
          __int16 v31 = 451;
          goto LABEL_103;
        }

        if (v18 == 123)
        {
          uint64_t v32 = *(unsigned int *)(a1 + 24);
          if ((_DWORD)v32 == *(_DWORD *)(a1 + 20))
          {
            __int16 v30 = "max level reached";
            __int16 v31 = 465;
            goto LABEL_103;
          }

          int v27 = 0;
          uint64_t v44 = *(void *)(a1 + 32);
          *(_DWORD *)(a1 + 24) = v32 + 1;
          *(_DWORD *)(v44 + 4 * v32) = 0;
          int v37 = 6;
          goto LABEL_125;
        }

        if (v18 == 91)
        {
          uint64_t v33 = *(unsigned int *)(a1 + 24);
          if ((_DWORD)v33 == *(_DWORD *)(a1 + 20))
          {
            __int16 v30 = "max level reached";
            __int16 v31 = 457;
            goto LABEL_103;
          }

          int v37 = 0;
          uint64_t v45 = *(void *)(a1 + 32);
          *(_DWORD *)(a1 + 24) = v33 + 1;
          int v27 = 1;
          *(_DWORD *)(v45 + 4 * v33) = 1;
          goto LABEL_125;
        }

        if (((char)v18 - 97) <= 0x19)
        {
          if ((jsonPushValue(a1, v18) & 0x80000000) == 0)
          {
            int v23 = 4;
            goto LABEL_69;
          }

          __int16 v30 = "jsonPushValue";
          __int16 v31 = 473;
          goto LABEL_103;
        }

        unsigned int v25 = *(_DWORD *)(a1 + 24) - 1;
        BOOL v34 = (*(_DWORD *)(*(void *)(a1 + 32) + 4LL * v25) & 1) == 0 || (char)v18 != 93;
        BOOL v35 = (*(_DWORD *)(*(void *)(a1 + 32) + 4LL * v25) & 1) == 0 && (char)v18 == 125;
        if (v34 && !v35) {
          goto LABEL_102;
        }
        goto LABEL_121;
      case 1:
        if (v18 == 92)
        {
          int v23 = 2;
          goto LABEL_69;
        }

        if (v18 == 34)
        {
          *(_DWORD *)(a1 + 16) = 5;
          if ((jsonPushValue(a1, 0) & 0x80000000) == 0)
          {
            int v27 = 3;
            goto LABEL_126;
          }

          __int16 v30 = "jsonPushValue";
          __int16 v31 = 499;
          goto LABEL_103;
        }

        if ((jsonPushValue(a1, v18) & 0x80000000) != 0)
        {
          __int16 v30 = "jsonPushValue";
          __int16 v31 = 503;
          goto LABEL_103;
        }

        continue;
      case 2:
        HIDWORD(v21) = (char)v18;
        LODWORD(v21) = ((char)v18 << 24) - 1644167168;
        unsigned __int8 v20 = v21 >> 25;
        if (v20 < 0xAu && ((0x341u >> v20) & 1) != 0)
        {
          char v22 = asc_1881849B1[(char)v20];
        }

        else if ((char)v18 == 102)
        {
          char v22 = 12;
        }

        else
        {
          char v22 = v19;
        }

        if ((jsonPushValue(a1, v22) & 0x80000000) != 0)
        {
          __int16 v30 = "jsonPushValue";
          __int16 v31 = 512;
          goto LABEL_103;
        }

LABEL_68:
        int v23 = 1;
        goto LABEL_69;
      case 3:
        if (((char)v18 - 48) > 9)
        {
          *(_DWORD *)(a1 + 16) = 5;
          *(void *)(a1 + 56) = v15;
          if ((jsonPushValue(a1, 0) & 0x80000000) == 0)
          {
            int v27 = 4;
            goto LABEL_126;
          }

          __int16 v30 = "jsonPushValue";
          __int16 v31 = 539;
          goto LABEL_103;
        }

        if ((jsonPushValue(a1, v18) & 0x80000000) != 0)
        {
          __int16 v30 = "jsonPushValue";
          __int16 v31 = 533;
          goto LABEL_103;
        }

        continue;
      case 4:
        if (((char)v18 - 97) > 0x19)
        {
          *(_DWORD *)(a1 + 16) = 5;
          *(void *)(a1 + 56) = v15;
          if ((jsonPushValue(a1, 0) & 0x80000000) == 0)
          {
            uint64_t v28 = *(const char **)(a1 + 112);
            if (!strcmp(v28, "false") || !strcmp(v28, "true"))
            {
              int v27 = 6;
            }

            else
            {
              if (strcmp(v28, "null")) {
                goto LABEL_102;
              }
              int v27 = 7;
            }

            goto LABEL_126;
          }

          __int16 v30 = "jsonPushValue";
          __int16 v31 = 524;
          goto LABEL_103;
        }

        if ((jsonPushValue(a1, v18) & 0x80000000) != 0)
        {
          __int16 v30 = "jsonPushValue";
          __int16 v31 = 519;
          goto LABEL_103;
        }

        continue;
      case 5:
        if ((char)v18 < 0)
        {
        }

        else if ((*(_DWORD *)(v14 + 4LL * (char)v18 + 60) & 0x4000) != 0)
        {
          continue;
        }

        int v24 = *(_DWORD *)(a1 + 24);
        if (!v24)
        {
          __int16 v30 = "invalid JSON state";
          __int16 v31 = 546;
          goto LABEL_103;
        }

        unsigned int v25 = v24 - 1;
        int v26 = *(_DWORD *)(*(void *)(a1 + 32) + 4LL * v25);
        if (v18 != 44)
        {
          if (v18 == 93)
          {
            if ((v26 & 1) != 0) {
              goto LABEL_121;
            }
            char v19 = 93;
          }

          else if (v18 == 125)
          {
            goto LABEL_91;
          }

LABEL_61:
        if (v18 == 34)
        {
          int v23 = 7;
          goto LABEL_69;
        }

        if (v18 != 125) {
          goto LABEL_102;
        }
        int v29 = *(_DWORD *)(a1 + 24);
        if (!v29) {
          goto LABEL_92;
        }
        unsigned int v25 = v29 - 1;
        int v26 = *(_DWORD *)(*(void *)(a1 + 32) + 4LL * v25);
LABEL_91:
        if ((v26 & 1) != 0)
        {
LABEL_92:
          char v19 = 125;
          goto LABEL_102;
        }

LABEL_121:
        *(_DWORD *)(a1 + 24) = v25;
        if (v25) {
          int v37 = 5;
        }
        else {
          int v37 = 9;
        }
        int v27 = 2;
LABEL_125:
        *(_DWORD *)(a1 + 16) = v37;
LABEL_126:
        if (a2) {
          memset_s(a2, 0x38uLL, 0, 0x38uLL);
        }
        *a2 = v27;
        uint64_t v38 = *(void *)(a1 + 80);
        if (v38) {
          uint64_t v38 = *(void *)(a1 + 88);
        }
        *((void *)a2 + 1) = v38;
        a2[12] = *(_DWORD *)(a1 + 24);
        if (v27 == 6)
        {
          int v39 = strcmp(*(const char **)(a1 + 112), "true");
          uint64_t result = 0LL;
          a2[9] = v39 == 0;
        }

        else if (v27 == 4)
        {
          uint64_t v40 = *(const char **)(a1 + 112);
          if (*v40 == 45)
          {
            unint64_t v41 = strtoull(v40 + 1, 0LL, 10);
            uint64_t result = 0LL;
            *((void *)a2 + 3) = v41;
            int v42 = -1;
          }

          else
          {
            unint64_t v43 = strtoull(v40, 0LL, 0);
            uint64_t result = 0LL;
            *((void *)a2 + 3) = v43;
            int v42 = v43 != 0;
          }

          a2[8] = v42;
        }

        else
        {
          uint64_t result = 0LL;
          if (v27 == 3) {
            *((void *)a2 + 2) = *(void *)(a1 + 112);
          }
        }

        return result;
      case 7:
        if ((char)v18 == 34)
        {
          if ((jsonPushLabel(a1, 0) & 0x80000000) == 0)
          {
            int v23 = 8;
            goto LABEL_69;
          }

          __int16 v30 = "jsonPushLabel";
          __int16 v31 = 587;
LABEL_103:
          pc_log_error( (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c",  (uint64_t)"AAJSONInputStreamRead",  v31,  109,  0,  v30,  a7,  a8,  v46);
          goto LABEL_104;
        }

        if ((jsonPushLabel(a1, v18) & 0x80000000) != 0)
        {
          __int16 v30 = "jsonPushLabel";
          __int16 v31 = 591;
          goto LABEL_103;
        }

        continue;
      case 8:
        if ((char)v18 < 0)
        {
        }

        else if ((*(_DWORD *)(v14 + 4LL * (char)v18 + 60) & 0x4000) != 0)
        {
          continue;
        }

        int v23 = 0;
        goto LABEL_69;
      default:
        goto LABEL_102;
    }
  }

id frk_unwrapped_symmetric_key_with_shipping_private_key(void *a1, void *a2, void *a3)
{
  v44[1] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  uint64_t v6 = [a1 objectForKey:@"com.apple.wkms.fcs-response"];
  uint64_t v7 = (void *)v6;
  if (!v5)
  {
    __int16 v31 = a3;
    int v18 = (void *)MEMORY[0x189607870];
    uint64_t v43 = *MEMORY[0x1896075E0];
    v44[0] = @"ERROR: Shipping private key is NULL.";
    [MEMORY[0x189603F68] dictionaryWithObjects:v44 forKeys:&v43 count:1];
    char v12 = (void *)objc_claimAutoreleasedReturnValue();
    char v19 = v18;
    uint64_t v20 = 26LL;
LABEL_14:
    [v19 errorWithDomain:@"com.apple.internal.fetchrestorekeys" code:v20 userInfo:v12];
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    size_t v8 = 0LL;
    int v10 = 0LL;
    uint64_t v11 = 0LL;
LABEL_16:
    uint64_t v14 = 0LL;
    int v16 = 0LL;
    goto LABEL_17;
  }

  if (!v6)
  {
    __int16 v31 = a3;
    unint64_t v21 = (void *)MEMORY[0x189607870];
    uint64_t v41 = *MEMORY[0x1896075E0];
    int v42 = @"ERROR: This archive does not contain a shipping key response.";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    char v12 = (void *)objc_claimAutoreleasedReturnValue();
    char v19 = v21;
    uint64_t v20 = 25LL;
    goto LABEL_14;
  }

  id v34 = 0LL;
  [MEMORY[0x1896078D8] JSONObjectWithData:v6 options:0 error:&v34];
  size_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v34;
  if (!v8)
  {
    int v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v14 = 0LL;
    int v16 = 0LL;
    if (!a3) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }

  [v8 objectForKey:@"wrapped-key"];
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKey:@"enc-request"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  __int16 v31 = a3;
  if (!v10
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || !v11
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    char v22 = (void *)MEMORY[0x189607870];
    uint64_t v39 = *MEMORY[0x1896075E0];
    uint64_t v40 = @"ERROR: Response dictionary is missing required keys. Will fail";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    char v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 errorWithDomain:@"com.apple.internal.fetchrestorekeys" code:23 userInfo:v12];
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }

  char v12 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBase64EncodedString:v10 options:0];
  uint64_t v13 = [objc_alloc(MEMORY[0x189603F48]) initWithBase64EncodedString:v11 options:0];
  __int16 v30 = (void *)v13;
  if (!v12)
  {
    unsigned int v25 = (void *)MEMORY[0x189607870];
    uint64_t v37 = *MEMORY[0x1896075E0];
    uint64_t v38 = @"ERROR: shipping key wrapped-key failed base64 decode";
    int v26 = (void *)MEMORY[0x189603F68];
    int v27 = &v38;
    uint64_t v28 = &v37;
LABEL_24:
    objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, 1, v30);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [v25 errorWithDomain:@"com.apple.internal.fetchrestorekeys" code:19 userInfo:v15];

    id v17 = (id)v29;
    uint64_t v14 = 0LL;
    int v16 = 0LL;
    goto LABEL_25;
  }

  if (!v13)
  {
    unsigned int v25 = (void *)MEMORY[0x189607870];
    uint64_t v35 = *MEMORY[0x1896075E0];
    uint64_t v36 = @"ERROR: shipping key enc-request failed base64 decode";
    int v26 = (void *)MEMORY[0x189603F68];
    int v27 = &v36;
    uint64_t v28 = &v35;
    goto LABEL_24;
  }

  id v33 = v9;
  +[CryptoKitWrapper convertPrivateKeyTox963WithPemPrivateKey:error:]( &OBJC_CLASS____TtC16FetchRestoreKeys16CryptoKitWrapper,  "convertPrivateKeyTox963WithPemPrivateKey:error:",  v5,  &v33);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v33;

  if (!v14)
  {
    int v16 = 0LL;
    goto LABEL_26;
  }

  id v32 = v15;
  +[CryptoKitWrapper unwrapEncryptionKeyWithWrappedKey:encapsulatedKey:privateKey:error:]( &OBJC_CLASS____TtC16FetchRestoreKeys16CryptoKitWrapper,  "unwrapEncryptionKeyWithWrappedKey:encapsulatedKey:privateKey:error:",  v12,  v30,  v14,  &v32);
  int v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = v32;
LABEL_25:

  id v15 = v17;
LABEL_26:

LABEL_17:
  id v9 = v15;
  a3 = v31;
  if (v31) {
LABEL_18:
  }
    *a3 = v9;
LABEL_19:
  id v23 = v16;

  return v23;
}

id frk_metadata_from_aea_auth_data(AEAAuthData_impl *a1, void *a2)
{
  v42[1] = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  EntryCFIndex Count = AEAAuthDataGetEntryCount(a1);
  if (!EntryCount)
  {
LABEL_12:
    int v16 = (void *)[v4 copy];
    id v17 = 0LL;
    if (a2) {
      goto LABEL_23;
    }
    goto LABEL_24;
  }

  uint32_t v6 = EntryCount;
  uint32_t v7 = 0;
  while (1)
  {
    data_std::string::size_type size = 0LL;
    size_t key_length = 0LL;
    if (AEAAuthDataGetEntry(a1, v7, 0LL, 0LL, &key_length, 0LL, 0LL, &data_size))
    {
      int v18 = (void *)MEMORY[0x189607870];
      uint64_t v29 = *MEMORY[0x1896075E0];
      __int16 v30 = @"Failed to parse auth data blob.";
      [MEMORY[0x189603F68] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      char v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 errorWithDomain:@"com.apple.internal.fetchrestorekeys" code:17 userInfo:v19];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }

    if (!key_length)
    {
      uint64_t v20 = (void *)MEMORY[0x189607870];
      uint64_t v41 = *MEMORY[0x1896075E0];
      v42[0] = @"Failed to parse key in KVS (zero size key).";
      unint64_t v21 = (void *)MEMORY[0x189603F68];
      char v22 = (const __CFString **)v42;
      id v23 = &v41;
LABEL_20:
      [v21 dictionaryWithObjects:v22 forKeys:v23 count:1];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 errorWithDomain:@"com.apple.internal.fetchrestorekeys" code:17 userInfo:v13];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }

    size_t v8 = ++key_length;
    if (!data_size)
    {
      uint64_t v20 = (void *)MEMORY[0x189607870];
      uint64_t v39 = *MEMORY[0x1896075E0];
      uint64_t v40 = @"Failed to parse key in KVS (zero size data).";
      unint64_t v21 = (void *)MEMORY[0x189603F68];
      char v22 = &v40;
      id v23 = &v39;
      goto LABEL_20;
    }

    id v9 = calloc(1uLL, v8);
    if (!v9)
    {
      uint64_t v20 = (void *)MEMORY[0x189607870];
      uint64_t v37 = *MEMORY[0x1896075E0];
      uint64_t v38 = @"KVS keyBuffer allocation failure.";
      unint64_t v21 = (void *)MEMORY[0x189603F68];
      char v22 = &v38;
      id v23 = &v37;
      goto LABEL_20;
    }

    int v10 = v9;
    uint64_t v11 = (uint8_t *)calloc(1uLL, data_size);
    if (!v11)
    {
      free(v10);
      uint64_t v20 = (void *)MEMORY[0x189607870];
      uint64_t v35 = *MEMORY[0x1896075E0];
      uint64_t v36 = @"KVS dataBuffer allocation failure.";
      unint64_t v21 = (void *)MEMORY[0x189603F68];
      char v22 = &v36;
      id v23 = &v35;
      goto LABEL_20;
    }

    char v12 = v11;
    if (AEAAuthDataGetEntry(a1, v7, key_length, (char *)v10, &key_length, data_size, v11, &data_size))
    {
      free(v10);
      free(v12);
      uint64_t v20 = (void *)MEMORY[0x189607870];
      uint64_t v33 = *MEMORY[0x1896075E0];
      id v34 = @"KVS data fetch failure.";
      unint64_t v21 = (void *)MEMORY[0x189603F68];
      char v22 = &v34;
      id v23 = &v33;
      goto LABEL_20;
    }

    uint64_t v13 = (void *)[objc_alloc(NSString) initWithUTF8String:v10];
    id v14 = objc_alloc(MEMORY[0x189603F48]);
    id v15 = (void *)[v14 initWithBytesNoCopy:v12 length:data_size freeWhenDone:1];
    free(v10);
    if (!v13 || !v15) {
      break;
    }
    [v4 setObject:v15 forKey:v13];

    if (v6 == ++v7) {
      goto LABEL_12;
    }
  }

  unsigned int v25 = (void *)MEMORY[0x189607870];
  uint64_t v31 = *MEMORY[0x1896075E0];
  id v32 = @"KVS key value - parse failure.";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  int v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 errorWithDomain:@"com.apple.internal.fetchrestorekeys" code:17 userInfo:v26];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
LABEL_22:
  int v16 = 0LL;
  if (a2) {
LABEL_23:
  }
    *a2 = v17;
LABEL_24:

  return v16;
}

unint64_t sub_188172108(uint64_t a1, unint64_t a2)
{
  return sub_188172910(a1, a2);
}

unint64_t sub_18817211C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x18961AFF0];
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7019E0);
  uint64_t v2 = sub_188174570();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }

  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_188173E28(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1881727CC(v15, v16);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_188173E70(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1LL);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48LL;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_188172244(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x18961AFF0];
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C7019D8);
  uint64_t v2 = (void *)sub_188174570();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }

  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_1881727CC(v5, v6);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    _DWORD v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void *sub_188172370()
{
  return sub_188172B94();
}

id sub_188172390( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t (*a5)(uint64_t, unint64_t))
{
  id v6 = a3;
  uint64_t v7 = sub_188174444();
  unint64_t v9 = v8;

  uint64_t v10 = a5(v7, v9);
  unint64_t v12 = v11;
  sub_188173D1C(v7, v9);
  uint64_t v13 = (void *)sub_18817442C();
  sub_188173D1C(v10, v12);
  return v13;
}

uint64_t *sub_188172478( uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_188172DF4(a1, a2, a3, a4, a5, a6);
}

char *sub_188172600(uint64_t a1, uint64_t a2, __SecCertificate *a3)
{
  return sub_1881732E8(a1, a2, a3);
}

id sub_188172710()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id sub_188172730()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CryptoKitWrapper();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_18817279C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CryptoKitWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1881727CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_188174594();
  return sub_188172830(a1, a2, v4);
}

unint64_t sub_188172830(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_18817457C() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (sub_18817457C() & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_188172910(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = sub_188174558();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  unint64_t v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v9 = sub_188174504();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1895F8858](v9);
  uint64_t v12 = &v21[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v22 = a1;
  unint64_t v23 = a2;
  sub_188173DE4(a1, a2);
  sub_1881744F8();
  if (!v2)
  {
    uint64_t v24 = v9;
    sub_1881744E0();
    sub_18817454C();
    a2 = sub_188174534();
    unint64_t v14 = v13;
    swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    if (v14 >> 60 == 15)
    {
      sub_188174528();
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C7019C0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1881849C0;
      *(void *)(inited + 32) = sub_188174528();
      *(void *)(inited + 40) = v16;
      a2 = MEMORY[0x189617FA8];
      *(void *)(inited + 72) = MEMORY[0x189617FA8];
      *(void *)(inited + 48) = 0xD000000000000017LL;
      *(void *)(inited + 56) = 0x80000001881A55E0LL;
      sub_18817211C(inited);
      id v17 = objc_allocWithZone(MEMORY[0x189607870]);
      int v18 = (void *)sub_18817451C();
      swift_bridgeObjectRelease();
      char v19 = (void *)sub_188174510();
      swift_bridgeObjectRelease();
      objc_msgSend(v17, sel_initWithDomain_code_userInfo_, v18, 31, v19);

      swift_willThrow();
      (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v24);
    }

    else
    {
      (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v24);
    }
  }

  return a2;
}

void *sub_188172B94()
{
  int v1 = v0;
  uint64_t v2 = sub_188174558();
  MEMORY[0x1895F8858](v2);
  uint64_t v3 = sub_188174504();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  MEMORY[0x1895F8858](v3);
  unint64_t v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  sub_18817454C();
  uint64_t v7 = sub_188174540();
  if (v8)
  {
    MEMORY[0x1895F8858](v7);
    sub_1881744D4();
    if (!v0)
    {
      uint64_t v13 = (*(uint64_t (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 32))(&v15[-v6], &v15[-v6], v3);
      int v1 = (void *)MEMORY[0x1895BB870](v13);
      (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(&v15[-v6], v3);
    }
  }

  else
  {
    sub_188174528();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7019C0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1881849C0;
    *(void *)(inited + 32) = sub_188174528();
    *(void *)(inited + 40) = v10;
    *(void *)(inited + 72) = MEMORY[0x189617FA8];
    *(void *)(inited + 48) = 0xD000000000000017LL;
    *(void *)(inited + 56) = 0x80000001881A55E0LL;
    sub_18817211C(inited);
    id v11 = objc_allocWithZone(MEMORY[0x189607870]);
    uint64_t v12 = (void *)sub_18817451C();
    swift_bridgeObjectRelease();
    int v1 = (void *)sub_188174510();
    swift_bridgeObjectRelease();
    objc_msgSend(v11, sel_initWithDomain_code_userInfo_, v12, 31, v1);

    swift_willThrow();
  }

  return v1;
}

uint64_t *sub_188172DF4( uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
  if (MEMORY[0x189605BB8]) {
    BOOL v7 = MEMORY[0x189605BC8] == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7 || MEMORY[0x189605BC0] == 0LL)
  {
    sub_188174528();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7019C0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1881849C0;
    *(void *)(inited + 32) = sub_188174528();
    *(void *)(inited + 40) = v16;
    *(void *)(inited + 72) = MEMORY[0x189617FA8];
    *(void *)(inited + 48) = 0xD000000000000027LL;
    *(void *)(inited + 56) = 0x80000001881A55B0LL;
    sub_18817211C(inited);
    uint64_t v13 = (uint64_t *)objc_allocWithZone(MEMORY[0x189607870]);
    id v17 = (void *)sub_18817451C();
    swift_bridgeObjectRelease();
    int v18 = (void *)sub_188174510();
    swift_bridgeObjectRelease();
    objc_msgSend(v13, sel_initWithDomain_code_userInfo_, v17, 12, v18);

    swift_willThrow();
  }

  else
  {
    unint64_t v46 = a2;
    unint64_t v47 = a4;
    uint64_t v45 = a1;
    uint64_t v12 = sub_188174504();
    uint64_t v13 = &v33;
    uint64_t v50 = *(void *)(v12 - 8);
    uint64_t v14 = *(void *)(v50 + 64);
    MEMORY[0x1895F8858](v12);
    uint64_t v48 = a5;
    unint64_t v49 = a6;
    sub_188173DE4(a5, a6);
    sub_1881744F8();
    if (!v6)
    {
      uint64_t v38 = &v33;
      uint64_t v43 = sub_18817445C();
      uint64_t v37 = &v33;
      uint64_t v19 = *(void *)(v43 - 8);
      uint64_t v20 = *(void *)(v19 + 64);
      MEMORY[0x1895F8858](v43);
      uint64_t v44 = a3;
      sub_188174450();
      uint64_t v21 = sub_1881744B0();
      uint64_t v36 = &v33;
      uint64_t v34 = v21;
      uint64_t v33 = *(void *)(v21 - 8);
      uint64_t v22 = MEMORY[0x1895F8858](v21);
      uint64_t v24 = (char *)&v33 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      int v42 = &v33;
      MEMORY[0x1895F8858](v22);
      unsigned int v25 = *(uint64_t (**)(char *))(v50 + 16);
      uint64_t v40 = v26;
      uint64_t v27 = v25((char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL));
      uint64_t v39 = &v33;
      MEMORY[0x1895F8858](v27);
      uint64_t v28 = v43;
      uint64_t v41 = v19;
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))( (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL),  (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v43);
      sub_188173DE4(v44, v47);
      uint64_t v35 = v24;
      sub_188174498();
      unint64_t v47 = (unint64_t)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v29 = v40;
      uint64_t v30 = v41;
      uint64_t v48 = v45;
      unint64_t v49 = v46;
      sub_188173E80();
      uint64_t v31 = v35;
      uint64_t v13 = (uint64_t *)sub_1881744A4();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v31, v34);
      (*(void (**)(unint64_t, uint64_t))(v30 + 8))(v47, v28);
      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v29, v12);
    }
  }

  return v13;
}

char *sub_1881732E8(uint64_t a1, uint64_t a2, SecCertificateRef certificate)
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  if (MEMORY[0x189605BB8]) {
    BOOL v4 = MEMORY[0x189605BC8] == 0LL;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4 || MEMORY[0x189605BC0] == 0LL)
  {
    sub_188174528();
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C7019C0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1881849C0;
    *(void *)(inited + 32) = sub_188174528();
    *(void *)(inited + 40) = v16;
    *(void *)(inited + 72) = MEMORY[0x189617FA8];
    *(void *)(inited + 48) = 0xD000000000000027LL;
    *(void *)(inited + 56) = 0x80000001881A55B0LL;
    sub_18817211C(inited);
    id v17 = objc_allocWithZone(MEMORY[0x189607870]);
    int v18 = (void *)sub_18817451C();
    swift_bridgeObjectRelease();
    uint64_t v12 = (char *)sub_188174510();
    swift_bridgeObjectRelease();
    objc_msgSend(v17, sel_initWithDomain_code_userInfo_, v18, 12, v12);

    swift_willThrow();
    return v12;
  }

  uint64_t v45 = a2;
  uint64_t v44 = a1;
  uint64_t v6 = SecCertificateCopyKey(certificate);
  if (!v6)
  {
    __break(1u);
    goto LABEL_18;
  }

  BOOL v7 = v6;
  CFDataRef v8 = SecKeyCopyExternalRepresentation(v6, 0LL);
  if (!v8)
  {
LABEL_18:
    __break(1u);
    JUMPOUT(0x188173CECLL);
  }

  CFDataRef v9 = v8;
  uint64_t v10 = sub_1881744C8();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(char **)(v11 + 64);
  MEMORY[0x1895F8858](v10);
  unint64_t v13 = (unint64_t)(v12 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v47 = sub_188174444();
  uint64_t v48 = v14;
  sub_1881744BC();
  if (v3)
  {
  }

  else
  {
    CFDataRef v34 = v9;
    uint64_t v35 = v7;
    int v42 = v33;
    uint64_t v43 = sub_18817445C();
    uint64_t v36 = v33;
    uint64_t v20 = *(void *)(v43 - 8);
    uint64_t v21 = v11;
    uint64_t v41 = 0LL;
    uint64_t v22 = *(void *)(v20 + 64);
    MEMORY[0x1895F8858](v43);
    uint64_t v46 = v10;
    uint64_t v23 = (char *)v33 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    sub_188174450();
    uint64_t v24 = sub_18817448C();
    uint64_t v37 = v33;
    v33[4] = v24;
    v33[3] = *(void *)(v24 - 8);
    uint64_t v25 = MEMORY[0x1895F8858](v24);
    uint64_t v27 = (char *)v33 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v40 = v33;
    MEMORY[0x1895F8858](v25);
    uint64_t v12 = (char *)v33 - v13;
    uint64_t v39 = v21;
    uint64_t v28 = *(uint64_t (**)(char *, char *, uint64_t))(v21 + 16);
    uint64_t v29 = v43;
    uint64_t v38 = (char *)v33 - v13;
    uint64_t v30 = v28((char *)v33 - v13, (char *)v33 - v13, v46);
    MEMORY[0x1895F8858](v30);
    uint64_t v31 = v46;
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v23, v23, v29);
    uint64_t v32 = v41;
    sub_188174468();
    if (!v32)
    {
      _OWORD v33[2] = v27;
      v33[1] = (char *)v33 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v41 = v20;
      __asm { BR              X10 }
    }

    (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v29);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v38, v31);
  }

  return v12;
}

uint64_t type metadata accessor for CryptoKitWrapper()
{
  return objc_opt_self();
}

uint64_t sub_188173D1C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895BCDAC]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_188173DA0()
{
  unint64_t result = qword_18C7019C8;
  if (!qword_18C7019C8)
  {
    unint64_t result = MEMORY[0x1895BCDB8](MEMORY[0x1896071A8], MEMORY[0x1896181D0]);
    atomic_store(result, (unint64_t *)&qword_18C7019C8);
  }

  return result;
}

uint64_t sub_188173DE4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_188173E28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C7019E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

_OWORD *sub_188173E70(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_188173E80()
{
  unint64_t result = qword_18C7019F0;
  if (!qword_18C7019F0)
  {
    unint64_t result = MEMORY[0x1895BCDB8](MEMORY[0x189606D48], MEMORY[0x189606D70]);
    atomic_store(result, (unint64_t *)&qword_18C7019F0);
  }

  return result;
}

void di_hybrid_subscriber_t::handle_sub_cqe(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  BOOL v7 = *(std::__shared_weak_count **)(a1 + 8);
  if (v7)
  {
    uint64_t p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }

  *(void *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
}

void di_hybrid_subscriber_t::handle_sub_cqe(std::__shared_weak_count *a1)
{
  uint64_t p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    unint64_t v3 = __ldaxr(p_shared_owners);
  while (__stlxr(v3 - 1, p_shared_owners));
  if (!v3)
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }

void std::__function::__func<di_hybrid_subscriber_t::di_hybrid_subscriber_t(io_rings_desc_t *,diskimage_uio::details::diskimage_impl &)::$_0,std::allocator<di_hybrid_subscriber_t::di_hybrid_subscriber_t(io_rings_desc_t *,diskimage_uio::details::diskimage_impl &)::$_0>,diskimage_uio::expected_ns::std::experimental::fundamentals_v3::expected<std::unique_ptr<DiskImage::Context>,std::error_code> ()(void)>::operator()( void *a1, uint64_t a2, uint64_t a3)
{
  int v4 = *((_DWORD *)__cxa_begin_catch(a1) + 2);
  uint64_t v5 = std::generic_category();
  *(_DWORD *)a3 = v4;
  *(void *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  __cxa_end_catch();
}

void diskimage_uio::diskimage_open_params::create(void *a1)
{
  int v1 = OUTLINED_FUNCTION_7(a1);
  OUTLINED_FUNCTION_1(v1);
  OUTLINED_FUNCTION_3();
}

void diskimage_uio::diskimage::create(void *a1)
{
  *(_OWORD *)uint64_t v1 = *(_OWORD *)OUTLINED_FUNCTION_7(a1);
  *(_BYTE *)(v1 + 16) = 0;
  OUTLINED_FUNCTION_8();
}

uint64_t diskimage_uio::details::diskimage_impl::create_context(uint64_t *a1)
{
  uint64_t result = *a1;
  *a1 = 0LL;
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 40LL))(result);
  }
  return result;
}

void diskimage_uio::details::diskimage_open_params_impl::diskimage_open_params_impl(uint64_t a1, uint64_t a2)
{
  else {
    OUTLINED_FUNCTION_3();
  }
}

void diskimage_uio::details::diskimage_impl::create_context_impl(void *a1)
{
  int v2 = *((_DWORD *)OUTLINED_FUNCTION_7(a1) + 2);
  unint64_t v3 = std::generic_category();
  *(_DWORD *)uint64_t v1 = v2;
  *(void *)(v1 + 8) = v3;
  *(_BYTE *)(v1 + 16) = 0;
  OUTLINED_FUNCTION_8();
}

void diskimage_uio::details::setup_sync_subscriber(io_rings_subscriber_sync_t &)::$_0::__invoke()
{
  if (v0)
  {
    uint64_t v1 = (unint64_t *)(v0 + 8);
    do
      OUTLINED_FUNCTION_0(v1);
    while (v3);
    if (!v2)
    {
      OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_9();
    }
  }

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6();
}

{
  unint64_t *v0;
  uint64_t v1;
  int v2;
  OUTLINED_FUNCTION_11();
  do
    OUTLINED_FUNCTION_0(v0);
  while (v2);
  if (!v1)
  {
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_10();
  }

  OUTLINED_FUNCTION_3();
}

uint64_t std::__function::__func<info::DiskImageInfoSparseBundle::count_mapped_bytes(DiskImageSparseBundle const&)::$_0,std::allocator<info::DiskImageInfoSparseBundle::count_mapped_bytes(DiskImageSparseBundle const&)::$_0>,void ()(std::string const&,unsigned long long)>::operator()( uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1895BC2CC](a2 + 112);
}

void std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](uint64_t a1)
{
}

void di_asif::details::table::read(di_asif::details::ContextASIF &,sg_vec_ns::details::sg_vec_iterator const&,sg_vec_ns::details::sg_vec_iterator const&)::bitmap_handle_t::~bitmap_handle_t( std::__shared_weak_count *a1)
{
  uint64_t p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    unint64_t v3 = __ldaxr(p_shared_owners);
  while (__stlxr(v3 - 1, p_shared_owners));
  if (!v3)
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }

  OUTLINED_FUNCTION_3();
}

void ref::Allocator<di_asif::details::table,unsigned long long>::error_ctrl_blk_t::error_ctrl_blk_t()
{
  if (v4)
  {
    uint64_t v5 = 4LL;
  }

  else
  {
    if (!v3) {
      goto LABEL_6;
    }
    uint64_t v5 = 5LL;
    uint64_t v2 = v3;
  }

  OUTLINED_FUNCTION_1_0(v2, v5);
LABEL_6:
  if ((void *)*v1 == v0)
  {
    uint64_t v6 = 4LL;
    goto LABEL_10;
  }

  if (*v1)
  {
    uint64_t v6 = 5LL;
    uint64_t v0 = (void *)*v1;
LABEL_10:
    OUTLINED_FUNCTION_0_1((uint64_t)v0, *(uint64_t (**)(void))(*v0 + 8 * v6));
    return;
  }

  OUTLINED_FUNCTION_3();
}

uint64_t DiskImage::extents_t::extents_t(uint64_t *a1)
{
  uint64_t result = *a1;
  *a1 = 0LL;
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 40LL))(result);
  }
  return result;
}

void replace_internal_backend(std::__shared_weak_count *a1)
{
  uint64_t p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    unint64_t v3 = __ldaxr(p_shared_owners);
  while (__stlxr(v3 - 1, p_shared_owners));
  if (!v3)
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }

uint64_t boost::container::uninitialized_move_alloc<boost::container::small_vector_allocator<CompressedBackend::promise_io_t,boost::container::new_allocator<void>,void>,CompressedBackend::promise_io_t*,CompressedBackend::promise_io_t*>( uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  for (uint64_t result = (uint64_t)__cxa_begin_catch(a2); a4 != a1; a4 += 104LL)
  {
    uint64_t v8 = *(void *)(a4 + 48);
    if (v8) {
      *(void *)(v8 + 32) = 0LL;
    }
    uint64_t result = std::shared_ptr<char>::~shared_ptr[abi:ne180100](a4);
  }

  return result;
}

void *ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::error_ctrl_blk_t( void *result, void *a2, void *a3, uint64_t a4)
{
  if ((void *)*result == a2)
  {
    uint64_t v6 = 4LL;
  }

  else
  {
    if (!*result) {
      goto LABEL_6;
    }
    uint64_t v6 = 5LL;
    a2 = (void *)*result;
  }

  uint64_t result = (void *)(*(uint64_t (**)(void *))(*a2 + 8 * v6))(a2);
LABEL_6:
  if (*a3 == a4) {
    return (void *)(*(uint64_t (**)(uint64_t))(*(void *)a4 + 32LL))(a4);
  }
  if (*a3) {
    return (void *)(*(uint64_t (**)(void))(*(void *)*a3 + 40LL))(*a3);
  }
  return result;
}

uint64_t sub_1881743FC()
{
  return MEMORY[0x189606208]();
}

uint64_t sub_188174408()
{
  return MEMORY[0x189606230]();
}

uint64_t sub_188174414()
{
  return MEMORY[0x189606240]();
}

uint64_t sub_188174420()
{
  return MEMORY[0x189606928]();
}

uint64_t sub_18817442C()
{
  return MEMORY[0x189606C58]();
}

uint64_t sub_188174438()
{
  return MEMORY[0x189606C68]();
}

uint64_t sub_188174444()
{
  return MEMORY[0x189606CA0]();
}

uint64_t sub_188174450()
{
  return MEMORY[0x189605AF8]();
}

uint64_t sub_18817445C()
{
  return MEMORY[0x189605B10]();
}

uint64_t sub_188174468()
{
  return MEMORY[0x189605B50]();
}

uint64_t sub_188174474()
{
  return MEMORY[0x189605B60]();
}

uint64_t sub_188174480()
{
  return MEMORY[0x189605B70]();
}

uint64_t sub_18817448C()
{
  return MEMORY[0x189605B78]();
}

uint64_t sub_188174498()
{
  return MEMORY[0x189605B90]();
}

uint64_t sub_1881744A4()
{
  return MEMORY[0x189605BA0]();
}

uint64_t sub_1881744B0()
{
  return MEMORY[0x189605BA8]();
}

uint64_t sub_1881744BC()
{
  return MEMORY[0x189605BE8]();
}

uint64_t sub_1881744C8()
{
  return MEMORY[0x189605C00]();
}

uint64_t sub_1881744D4()
{
  return MEMORY[0x189605C28]();
}

uint64_t sub_1881744E0()
{
  return MEMORY[0x189605C30]();
}

uint64_t sub_1881744EC()
{
  return MEMORY[0x189605C40]();
}

uint64_t sub_1881744F8()
{
  return MEMORY[0x189605C50]();
}

uint64_t sub_188174504()
{
  return MEMORY[0x189605C70]();
}

uint64_t sub_188174510()
{
  return MEMORY[0x189607050]();
}

uint64_t sub_18817451C()
{
  return MEMORY[0x1896070D8]();
}

uint64_t sub_188174528()
{
  return MEMORY[0x189607100]();
}

uint64_t sub_188174534()
{
  return MEMORY[0x189607118]();
}

uint64_t sub_188174540()
{
  return MEMORY[0x189607120]();
}

uint64_t sub_18817454C()
{
  return MEMORY[0x189607160]();
}

uint64_t sub_188174558()
{
  return MEMORY[0x189607178]();
}

uint64_t sub_188174564()
{
  return MEMORY[0x189617DD8]();
}

uint64_t sub_188174570()
{
  return MEMORY[0x189619960]();
}

uint64_t sub_18817457C()
{
  return MEMORY[0x18961A050]();
}

uint64_t sub_188174588()
{
  return MEMORY[0x18961A680]();
}

uint64_t sub_188174594()
{
  return MEMORY[0x18961A6C0]();
}

uint64_t AAAsyncByteStreamProcess()
{
  return MEMORY[0x189613090]();
}

int AAByteStreamClose(AAByteStream s)
{
  return MEMORY[0x1896130A8](s);
}

ssize_t AAByteStreamPRead(AAByteStream s, void *buf, size_t nbyte, off_t offset)
{
  return MEMORY[0x1896130B0](s, buf, nbyte, offset);
}

ssize_t AAByteStreamRead(AAByteStream s, void *buf, size_t nbyte)
{
  return MEMORY[0x1896130D0](s, buf, nbyte);
}

off_t AAByteStreamSeek(AAByteStream s, off_t offset, int whence)
{
  return MEMORY[0x1896130E0](s, offset, *(void *)&whence);
}

ssize_t AAByteStreamWrite(AAByteStream s, const void *buf, size_t nbyte)
{
  return MEMORY[0x1896130F8](s, buf, nbyte);
}

AAByteStream AACustomByteStreamOpen(void)
{
  return (AAByteStream)MEMORY[0x189613158]();
}

void AACustomByteStreamSetCloseProc(AAByteStream s, AAByteStreamCloseProc proc)
{
}

void AACustomByteStreamSetData(AAByteStream s, void *data)
{
}

void AACustomByteStreamSetPReadProc(AAByteStream s, AAByteStreamPReadProc proc)
{
}

void AACustomByteStreamSetReadProc(AAByteStream s, AAByteStreamReadProc proc)
{
}

AAByteStream AAFileStreamOpenWithFD(int fd, int automatic_close)
{
  return (AAByteStream)MEMORY[0x1896132F8](*(void *)&fd, *(void *)&automatic_close);
}

uint64_t AATempStreamOpen()
{
  return MEMORY[0x1896133F0]();
}

AEAAuthData AEAAuthDataCreateWithContext(AEAContext context)
{
  return (AEAAuthData)MEMORY[0x1896133F8](context);
}

void AEAAuthDataDestroy(AEAAuthData auth_data)
{
}

int AEAAuthDataGetEntry( AEAAuthData auth_data, uint32_t i, size_t key_capacity, char *key, size_t *key_length, size_t data_capacity, uint8_t *data, size_t *data_size)
{
  return MEMORY[0x189613408](auth_data, *(void *)&i, key_capacity, key, key_length, data_capacity, data, data_size);
}

uint32_t AEAAuthDataGetEntryCount(AEAAuthData auth_data)
{
  return MEMORY[0x189613410](auth_data);
}

AEAContext AEAContextCreateWithEncryptedStream(AAByteStream encrypted_stream)
{
  return (AEAContext)MEMORY[0x189613420](encrypted_stream);
}

void AEAContextDestroy(AEAContext context)
{
}

int AEAContextGetFieldBlob( AEAContext context, AEAContextField field, AEAContextFieldRepresentation representation, size_t buf_capacity, uint8_t *buf, size_t *buf_size)
{
  return MEMORY[0x189613458](context, *(void *)&field, *(void *)&representation, buf_capacity, buf, buf_size);
}

uint64_t AEAContextGetFieldUInt(AEAContext context, AEAContextField field)
{
  return MEMORY[0x189613460](context, *(void *)&field);
}

int AEAContextSetFieldBlob( AEAContext context, AEAContextField field, AEAContextFieldRepresentation representation, const uint8_t *buf, size_t buf_size)
{
  return MEMORY[0x189613470](context, *(void *)&field, *(void *)&representation, buf, buf_size);
}

AAByteStream AEADecryptionRandomAccessInputStreamOpen( AAByteStream encrypted_stream, AEAContext context, size_t alloc_limit, AAFlagSet flags, int n_threads)
{
  return (AAByteStream)MEMORY[0x189613498](encrypted_stream, context, alloc_limit, flags, *(void *)&n_threads);
}

int BZ2_bzBuffToBuffCompress( char *dest, unsigned int *destLen, char *source, unsigned int sourceLen, int blockSize100k, int verbosity, int workFactor)
{
  return MEMORY[0x189614120]( dest,  destLen,  source,  *(void *)&sourceLen,  *(void *)&blockSize100k,  *(void *)&verbosity,  *(void *)&workFactor);
}

int BZ2_bzBuffToBuffDecompress( char *dest, unsigned int *destLen, char *source, unsigned int sourceLen, int small, int verbosity)
{
  return MEMORY[0x189614128](dest, destLen, source, *(void *)&sourceLen, *(void *)&small, *(void *)&verbosity);
}

unsigned int CCCalibratePBKDF( CCPBKDFAlgorithm algorithm, size_t passwordLen, size_t saltLen, CCPseudoRandomAlgorithm prf, size_t derivedKeyLen, uint32_t msec)
{
  return MEMORY[0x1895F8080]( *(void *)&algorithm,  passwordLen,  saltLen,  *(void *)&prf,  derivedKeyLen,  *(void *)&msec);
}

CCCryptorStatus CCCrypt( CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1895F8090]( *(void *)&op,  *(void *)&alg,  *(void *)&options,  key,  keyLength,  iv,  dataIn,  dataInLength);
}

CCCryptorStatus CCCryptorCreate( CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1895F80B0](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1895F8120](cryptorRef);
}

CCCryptorStatus CCCryptorReset(CCCryptorRef cryptorRef, const void *iv)
{
  return MEMORY[0x1895F8128](cryptorRef, iv);
}

CCCryptorStatus CCCryptorUpdate( CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1895F8130](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

int CCKeyDerivationPBKDF( CCPBKDFAlgorithm algorithm, const char *password, size_t passwordLen, const uint8_t *salt, size_t saltLen, CCPseudoRandomAlgorithm prf, unsigned int rounds, uint8_t *derivedKey, size_t derivedKeyLen)
{
  return MEMORY[0x1895F81F8]( *(void *)&algorithm,  password,  passwordLen,  salt,  saltLen,  *(void *)&prf,  *(void *)&rounds,  derivedKey);
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x1895F8228](bytes, count);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F8290](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F82D0](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82D8](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82E0](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82E8](c, data, *(void *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x189602638](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFDictionaryRef CFDictionaryCreate( CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x189602BA8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy( CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BC8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x189602BD0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x189602C70](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData( CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x189602FD0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData( CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x189602FF0](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x189603138]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFStringRef CFStringCreateWithBytes( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x189603450](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes( CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1896034F0]( theString,  range.location,  range.length,  *(void *)&encoding,  lossByte,  isExternalRepresentation,  buffer,  maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x189603558](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x189603880](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x189603888](alloc, uuid);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1896038B0](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CFUserNotificationRef CFUserNotificationCreate( CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1896038D0](allocator, flags, error, dictionary, timeout);
}

CFStringRef CFUserNotificationGetResponseValue( CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return (CFStringRef)MEMORY[0x1896038F8](userNotification, key, idx);
}

SInt32 CFUserNotificationReceiveResponse( CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x189603900](userNotification, responseFlags, timeout);
}

CFDictionaryRef DADiskCopyDescription(DADiskRef disk)
{
  return (CFDictionaryRef)MEMORY[0x18960F180](disk);
}

DADiskRef DADiskCreateFromBSDName(CFAllocatorRef allocator, DASessionRef session, const char *name)
{
  return (DADiskRef)MEMORY[0x18960F190](allocator, session, name);
}

DADiskRef DADiskCreateFromVolumePath(CFAllocatorRef allocator, DASessionRef session, CFURLRef path)
{
  return (DADiskRef)MEMORY[0x18960F198](allocator, session, path);
}

void DADiskEject(DADiskRef disk, DADiskEjectOptions options, DADiskEjectCallback callback, void *context)
{
}

void DADiskUnmount(DADiskRef disk, DADiskUnmountOptions options, DADiskUnmountCallback callback, void *context)
{
}

uint64_t DADissenterGetProcessID()
{
  return MEMORY[0x18960F1B0]();
}

DAReturn DADissenterGetStatus(DADissenterRef dissenter)
{
  return MEMORY[0x18960F1B8](dissenter);
}

void DARegisterDiskDisappearedCallback( DASessionRef session, CFDictionaryRef match, DADiskDisappearedCallback callback, void *context)
{
}

uint64_t DARegisterIdleCallback()
{
  return MEMORY[0x18960F1C8]();
}

DASessionRef DASessionCreate(CFAllocatorRef allocator)
{
  return (DASessionRef)MEMORY[0x18960F1D0](allocator);
}

void DASessionScheduleWithRunLoop(DASessionRef session, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

void DASessionUnscheduleFromRunLoop(DASessionRef session, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
}

void DAUnregisterCallback(DASessionRef session, void *callback, void *context)
{
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x189607C80](*(void *)&mainPort, *(void *)&options, bsdName);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x1896082E8](*(void *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1896082F0](*(void *)&iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x189608330](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x189608348](notify);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x189608360](*(void *)&object, className);
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return (CFStringRef)MEMORY[0x189608368](*(void *)&object);
}

BOOLean_t IOObjectIsEqualTo(io_object_t object, io_object_t anObject)
{
  return MEMORY[0x189608388](*(void *)&object, *(void *)&anObject);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x1896083A0](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryCreateIterator( io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return MEMORY[0x189608480](*(void *)&entry, plane, *(void *)&options, iterator);
}

kern_return_t IORegistryEntryGetParentEntry( io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1896084D0](*(void *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x189608500](*(void *)&entry, entryID);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608508](entryID);
}

kern_return_t IOServiceAddMatchingNotification( IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x189608548](notifyPort, notificationType, matching, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608580](name);
}

kern_return_t IOServiceWaitQuiet(io_service_t service, mach_timespec_t *waitTime)
{
  return MEMORY[0x1896085A0](*(void *)&service, waitTime);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x18960B290](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x18960B2E8](allocator, data);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x18960B3F8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x18960B400](query, result);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x18960B430](key, error);
}

CFDataRef SecKeyCreateDecryptedData( SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef ciphertext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x18960B480](key, algorithm, ciphertext, error);
}

CFDataRef SecKeyCreateEncryptedData( SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef plaintext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x18960B490](key, algorithm, plaintext, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x189614180](this, __s);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1896141C8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1896141D0](this);
}

const char *__cdecl std::exception::what(const std::exception *this)
{
  return (const char *)MEMORY[0x1896141D8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1896141E0](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x1896141E8](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x189614220](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x189614230](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x189614268](this);
}

void std::__call_once(unint64_t *a1, void *a2, void (__cdecl *a3)(void *))
{
}

std::__sp_mut *__cdecl std::__get_sp_mut(const void *a1)
{
  return (std::__sp_mut *)MEMORY[0x189614298](a1);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1896142A0](__n);
}

void std::string::__grow_by_and_replace( std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1896142C8](this, __pos, __n);
}

std::string *__cdecl std::string::append( std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1896142D8](this, __s, __n);
}

std::string::iterator std::string::insert( std::string *this, std::string::const_iterator __pos, std::string::value_type __c)
{
  return (std::string::iterator)MEMORY[0x189614300](this, __pos.__i_, __c);
}

std::string *__cdecl std::string::insert( std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x189614310](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::__grow_by( std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x189614358](this, __str);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1896143B0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1896143B8]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x1896143C0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1896143C8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1896143D0]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1896143D8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1896143E0]();
}

{
  return MEMORY[0x1896143E8]();
}

{
  return MEMORY[0x189614400]();
}

{
  return MEMORY[0x189614408]();
}

{
  return MEMORY[0x189614410]();
}

{
  return MEMORY[0x189614418]();
}

{
  return MEMORY[0x189614428]();
}

{
  return MEMORY[0x189614438]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x189614448]();
}

void std::error_category::~error_category(std::error_category *this)
{
}

std::__thread_struct *__cdecl std::__thread_struct::__thread_struct(std::__thread_struct *this)
{
  return (std::__thread_struct *)MEMORY[0x189614460](this);
}

void std::__thread_struct::~__thread_struct(std::__thread_struct *this)
{
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x189614470]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x189614478]();
}

std::stringbuf *__cdecl std::stringbuf::basic_stringbuf(std::stringbuf *this, std::stringbuf *__rhs)
{
  return (std::stringbuf *)MEMORY[0x189614480](this, __rhs);
}

const std::error_category *std::generic_category(void)
{
  return (const std::error_category *)MEMORY[0x189614488]();
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
}

void std::condition_variable::notify_one(std::condition_variable *this)
{
}

void std::condition_variable::__do_timed_wait( std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1896144C0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::__thread_specific_ptr<std::__thread_struct> *std::__thread_local_data(void)
{
  return (std::__thread_specific_ptr<std::__thread_struct> *)MEMORY[0x1896144D0]();
}

void std::__libcpp_atomic_wait(const void *a1, std::__cxx_contention_t a2)
{
}

void std::__throw_system_error(int ev, const char *what_arg)
{
}

void std::__cxx_atomic_notify_all(const void *a1)
{
}

std::__cxx_contention_t std::__libcpp_atomic_monitor(const void *a1)
{
  return MEMORY[0x189614500](a1);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status( const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x189614530](a1, __ec);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x189614598]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x1896145A8]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::thread::join(std::thread *this)
{
}

void std::thread::~thread(std::thread *this)
{
}

void std::__sp_mut::lock(std::__sp_mut *this)
{
}

void std::__sp_mut::unlock(std::__sp_mut *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::move(std::ios_base *this, std::ios_base *a2)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x189614638]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x189614650](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x189614658](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x189614668](retstr, __val);
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x189614688](this);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[](void *__p)
{
}

void operator delete(void *__p)
{
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_18A1C7D18(__sz);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_18A1C7D20(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1896147A0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1895F8878](lpfunc, obj, lpdso_handle);
}

void __cxa_bad_cast(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x1896147C8](lpmangled, lpout, lpoutlen, lpstatus);
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

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void *__dynamic_cast( const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x189614810](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1895F8A00]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895F8A28](*(void *)&a1);
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1895F8DE0]();
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1895F9328](a1, *(void *)&a2);
}

char *__cdecl basename_r(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895F95F8](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FA5A8](a1);
}

size_t compression_decode_buffer( uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x189614998](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_decode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x1896149A0](*(void *)&algorithm);
}

size_t compression_encode_buffer( uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1896149A8](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x1896149B0](*(void *)&algorithm);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x1895FA5E8](*(void *)&a1, a2, a3);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x189617578](crc, buf, *(void *)&len);
}

void curl_easy_cleanup(CURL *curl)
{
}

CURLcode curl_easy_getinfo(CURL *curl, CURLINFO info, ...)
{
  return MEMORY[0x18961D298](curl, *(void *)&info);
}

CURL *curl_easy_init(void)
{
  return (CURL *)MEMORY[0x18961D2A0]();
}

CURLcode curl_easy_perform(CURL *curl)
{
  return MEMORY[0x18961D2A8](curl);
}

CURLcode curl_easy_setopt(CURL *curl, CURLoption option, ...)
{
  return MEMORY[0x18961D2B0](curl, *(void *)&option);
}

const char *__cdecl curl_easy_strerror(CURLcode a1)
{
  return (const char *)MEMORY[0x18961D2B8](*(void *)&a1);
}

CURLcode curl_global_init(uint64_t flags)
{
  return MEMORY[0x18961D2C0](flags);
}

curl_slist *__cdecl curl_slist_append(curl_slist *list, const char *data)
{
  return (curl_slist *)MEMORY[0x18961D2C8](list, data);
}

void curl_slist_free_all(curl_slist *list)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1895FABB0](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1895FAC60]();
}

uint64_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAC80](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2( const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD90](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1895FAFA8](*(void *)&a1);
}

int faccessat(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x1895FB1C8](*(void *)&a1, a2, *(void *)&a3, *(void *)&a4);
}

int fchmodat(int a1, const char *a2, mode_t a3, int a4)
{
  return MEMORY[0x1895FB1E8](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fchownat(int a1, const char *a2, uid_t a3, gid_t a4, int a5)
{
  return MEMORY[0x1895FB1F8](*(void *)&a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x1895FB230](*(void *)&a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x1895FB248](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1895FB250](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1895FB2A0](a1);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1895FB2F0](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB388](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x1895FB458](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1895FB460](*(void *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x1895FB468](*(void *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1895FB480](*(void *)&a1, a2);
}

int futimes(int a1, const timeval *a2)
{
  return MEMORY[0x1895FB4C0](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

group *__cdecl getgrgid(gid_t a1)
{
  return (group *)MEMORY[0x1895FB558](*(void *)&a1);
}

int getmntinfo_r_np(statfs **a1, int a2)
{
  return MEMORY[0x1895FB5D0](a1, *(void *)&a2);
}

int getpagesize(void)
{
  return MEMORY[0x1895FB608]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1895FB6E0](a1, a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1895FB850](*(void *)&a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x1895FB868](*(void *)&a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FBA80](*(void *)&a1, a2, *(void *)&a3);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1895FBC80](a1, a2, *(void *)&a3);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1895FBE68](__s, __smax, *(void *)&__c, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1895FBEF0](a1, a2);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return MEMORY[0x1895FBEF8](*(void *)&a1, a2, a3);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FBF70](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FBF98](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1896165B8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1896165F8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616718](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1895FC6A8]();
}

int pclose(FILE *a1)
{
  return MEMORY[0x1895FC778](a1);
}

void perror(const char *a1)
{
}

FILE *__cdecl popen(const char *a1, const char *a2)
{
  return (FILE *)MEMORY[0x1895FC7C8](a1, a2);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FC880](*(void *)&__fd, __buf, __nbyte, a4);
}

ssize_t preadv(int a1, const iovec *a2, int a3, off_t a4)
{
  return MEMORY[0x1895FC888](*(void *)&a1, a2, *(void *)&a3, a4);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1895FC9D8](a1, a2, a3, a4);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1895FCA40](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1895FCA60](a1, a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1895FCAC8](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1895FCB48](a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FCBA0](*(void *)&__fd, __buf, __nbyte, a4);
}

ssize_t pwritev(int a1, const iovec *a2, int a3, off_t a4)
{
  return MEMORY[0x1895FCBA8](*(void *)&a1, a2, *(void *)&a3, a4);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1895FCBB8]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

int raise(int a1)
{
  return MEMORY[0x1895FCBE0](*(void *)&a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1895FCC40](a1);
}

char *__cdecl readpassphrase(const char *a1, char *a2, size_t a3, int a4)
{
  return (char *)MEMORY[0x1895FCC60](a1, a2, a3, *(void *)&a4);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC70](__ptr, __size);
}

int sched_yield(void)
{
  return MEMORY[0x1895FCE08]();
}

int seteuid(uid_t a1)
{
  return MEMORY[0x1895FCE70](*(void *)&a1);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1895FCF88](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD030](a1, a2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1895FD0D0](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FD100](__s1, __n);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}

double strtod(const char *a1, char **a2)
{
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1A0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1C8](__str, __endptr, *(void *)&__base);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x18961B118]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x18961B1E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x18961B310]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x18961B328]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x18961B348]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x18961B3E0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x18961B518]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

mode_t umask(mode_t a1)
{
  return MEMORY[0x1895FD448](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1895FD490](*(void *)&a1);
}

void uuid_generate_random(uuid_t out)
{
}

void *__cdecl valloc(size_t a1)
{
  return (void *)MEMORY[0x1895FD508](a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1895FD610](__str, __size, __format, a4);
}

uint64_t objc_msgSend_createShadowDiskImageWithBackend_numBlocks_sinkDiskImage_cache_only_stack_size_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_createShadowDiskImageWithBackend_numBlocks_sinkDiskImage_cache_only_stack_size_);
}

uint64_t objc_msgSend_enqueueRequestWithSize_atOffset_destinationBuffer_destinationStream_completionSemaphore_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_enqueueRequestWithSize_atOffset_destinationBuffer_destinationStream_completionSemaphore_);
}

uint64_t objc_msgSend_initWithPluginName_pluginParams_tag_UUID_parentNode_metadata_isCache_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithPluginName_pluginParams_tag_UUID_parentNode_metadata_isCache_);
}

uint64_t objc_msgSend_initWithSession_size_atOffset_destinationBuffer_destinationStream_completionSemaphore_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithSession_size_atOffset_destinationBuffer_destinationStream_completionSemaphore_);
}

uint64_t objc_msgSend_initWithURL_streamBase_maxAttempts_pauseInterval_maxRequestsInFlight_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithURL_streamBase_maxAttempts_pauseInterval_maxRequestsInFlight_);
}

uint64_t objc_msgSend_newUnlockBackendXPCValidateArgsWithPassphrase_certificate_isNewImage_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_newUnlockBackendXPCValidateArgsWithPassphrase_certificate_isNewImage_error_);
}

uint64_t objc_msgSend_populateNodesDictsWithArray_pstackURL_nodesDict_isTopLevelPstack_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_populateNodesDictsWithArray_pstackURL_nodesDict_isTopLevelPstack_error_);
}