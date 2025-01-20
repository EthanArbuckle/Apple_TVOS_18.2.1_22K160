int main(int argc, const char **argv, const char **envp)
{
  id v3;
  _CFPrefsSetDirectModeEnabled(1LL, argv, envp);
  _CFPrefsSetReadOnly(1LL);
  v3 = -[CGPDFServiceListener initForXPCService](objc_alloc(&OBJC_CLASS___CGPDFServiceListener), "initForXPCService");
  [v3 run];

  return 0;
}

void sub_100001414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100001470( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)&OBJC_CLASS___CGPDFPageImpl;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_100001580( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100001628( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000016F8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_100001830( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_100001990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

const void **applesauce::CF::ObjectRef<CGColorSpace *>::~ObjectRef(const void **a1)
{
  v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **applesauce::CF::ObjectRef<CGContext *>::~ObjectRef(const void **a1)
{
  v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_100001ABC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100001B18( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100001E9C(_Unwind_Exception *a1, void *a2, ...)
{
  applesauce::CF::ObjectRef<CGDataProvider *>::~ObjectRef((const void **)va);
  _Unwind_Resume(a1);
}

void std::vector<CGPDFPageImpl * {__strong}>::resize(uint64_t a1, unint64_t a2, id *a3)
{
  uint64_t v4 = *(void *)(a1 + 8);
  unint64_t v5 = (v4 - *(void *)a1) >> 3;
  if (a2 <= v5)
  {
    if (a2 < v5)
    {
      uint64_t v6 = *(void *)a1 + 8 * a2;
      while (v4 != v6)
      {
        v7 = *(void **)(v4 - 8);
        v4 -= 8LL;
      }

      *(void *)(a1 + 8) = v6;
    }
  }

  else
  {
    std::vector<CGPDFPageImpl * {__strong}>::__append((char **)a1, a2 - v5, a3);
  }
}

const void **applesauce::CF::ObjectRef<CGDataProvider *>::~ObjectRef(const void **a1)
{
  v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_1000020CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000021A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100002284( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100002348( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10000240C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000024E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_100002544( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void *std::vector<CGPDFPageImpl * {__strong}>::__append(char **a1, unint64_t a2, id *a3)
{
  v8 = a1[2];
  result = a1 + 2;
  v7 = v8;
  v9 = (char *)*(result - 1);
  if (a2 <= (v8 - v9) >> 3)
  {
    if (a2)
    {
      uint64_t v16 = 8 * a2;
      v17 = &v9[8 * a2];
      do
      {
        result = *a3;
        *(void *)v9 = result;
        v9 += 8;
        v16 -= 8LL;
      }

      while (v16);
      v9 = v17;
    }

    a1[1] = v9;
  }

  else
  {
    uint64_t v10 = v9 - *a1;
    unint64_t v11 = a2 + (v10 >> 3);
    if (v11 >> 61) {
      std::vector<CGPDFPageImpl * {__strong}>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v10 >> 3;
    uint64_t v13 = v7 - *a1;
    if (v13 >> 2 > v11) {
      unint64_t v11 = v13 >> 2;
    }
    else {
      unint64_t v14 = v11;
    }
    v31 = result;
    if (v14) {
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPDFPageImpl * {__strong}>>( (uint64_t)result,  v14);
    }
    else {
      v15 = 0LL;
    }
    v18 = &v15[8 * v12];
    v19 = &v15[8 * v14];
    v30 = v19;
    uint64_t v20 = 8 * a2;
    v21 = v18;
    v22 = &v18[8 * a2];
    do
    {
      *(void *)v21 = *a3;
      v21 += 8;
      v20 -= 8LL;
    }

    while (v20);
    v29.i64[1] = (uint64_t)v22;
    v24 = *a1;
    v23 = a1[1];
    if (v23 == *a1)
    {
      int64x2_t v26 = vdupq_n_s64((unint64_t)v23);
    }

    else
    {
      do
      {
        uint64_t v25 = *((void *)v23 - 1);
        v23 -= 8;
        *(void *)v23 = 0LL;
        *((void *)v18 - 1) = v25;
        v18 -= 8;
      }

      while (v23 != v24);
      int64x2_t v26 = *(int64x2_t *)a1;
      v22 = (char *)v29.i64[1];
      v19 = v30;
    }

    *a1 = v18;
    a1[1] = v22;
    int64x2_t v29 = v26;
    v27 = a1[2];
    a1[2] = v19;
    v30 = v27;
    uint64_t v28 = v26.i64[0];
    return (void *)std::__split_buffer<CGPDFPageImpl * {__strong}>::~__split_buffer((uint64_t)&v28);
  }

  return result;
}

void std::vector<CGPDFPageImpl * {__strong}>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_10000276C(_Unwind_Exception *a1)
{
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CGPDFPageImpl * {__strong}>>( uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t std::__split_buffer<CGPDFPageImpl * {__strong}>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
  }

  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::vector<CGPDFPageImpl * {__strong}>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    unint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        uint64_t v6 = (void *)*((void *)v4 - 1);
        v4 -= 8;
      }

      while (v4 != v2);
      unint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
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

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}