void UsagePayload::UsagePayload(uint64_t a1, UsagePayload *this, int a3, int a4)
{
  std::string::size_type v6;
  uint64_t v7;
  char v8;
  *(_DWORD *)a1 = a3;
  *(_DWORD *)(a1 + 4) = a4;
  *(void *)(a1 + 1032) = 0LL;
  if (*((char *)this + 23) < 0)
  {
    v6 = *((void *)this + 1);
    if (v6 >= 0x401)
    {
      v8 = 0;
      goto LABEL_8;
    }
  }

  else
  {
    v6 = *((unsigned __int8 *)this + 23);
  }

  std::string::copy((const std::string *)this, (std::string::value_type *)(a1 + 8), v6, 0LL);
  v7 = *((unsigned __int8 *)this + 23);
  if ((v7 & 0x80u) != 0LL) {
    v7 = *((void *)this + 1);
  }
  *(void *)(a1 + 1032) = v7;
  v8 = 1;
LABEL_8:
  *(_BYTE *)(a1 + 1040) = v8;
}

void *UsagePayload::UsagePayload(void *__dst, size_t __n, void *__src)
{
  __dst[129] = 0LL;
  *((_BYTE *)__dst + 1040) = 0;
  if (__n - 1033 >= 0xFFFFFFFFFFFFFBFFLL)
  {
    memcpy(__dst, __src, __n);
    __dst[129] = __n - 8;
    *((_BYTE *)__dst + 1040) = 1;
  }

  return __dst;
}

void *UsagePayload::serialization@<X0>(UsagePayload *this@<X0>, void *a2@<X8>)
{
  result = operator new(0x10uLL);
  *a2 = result;
  void *result = *((void *)this + 129) + 8LL;
  result[1] = this;
  return result;
}

double UsagePayload::getArchiveArch@<D0>(UsagePayload *this@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)a2 = __dst;
  *(void *)(a2 + 16) = v6;
  double result = *(double *)this;
  *(void *)(a2 + 24) = *(void *)this;
  return result;
}

void **MTLArchiveUsageDB::MTLArchiveUsageDB(void **a1, uint64_t *a2)
{
  return MTLVersionedDB::MTLVersionedDB(a1, a2, 4u, 1, 1);
}

void MTLArchiveUsageDB::store(MTLVersionedDB *a1, UsagePayload *a2, int a3, int a4, uint64_t a5)
{
  __darwin_time_t v18 = v19.tv_sec - a5;
  UsagePayload::UsagePayload((uint64_t)v21, a2, a3, a4);
  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v17, a1);
  uint64_t v10 = v17;
  if (v17)
  {
    unsigned int v11 = *((_DWORD *)a1 + 2);
    v12 = (size_t *)operator new(0x10uLL);
    size_t *v12 = 8LL;
    v12[1] = (size_t)&v18;
    v13 = operator new(0x10uLL);
    void *v13 = v22 + 8;
    v13[1] = v21;
    int v14 = mdb_put(v10, v11, v12, (uint64_t)v13, 0);
    operator delete(v13);
    operator delete(v12);
    if (v14)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v15 = mdb_strerror(v14);
        MTLArchiveUsageDB::store((uint64_t)v15, (uint64_t)v20, v16);
      }
    }
  }

  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v17);
}

void sub_100001134( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void MTLArchiveUsageDB::prune(MTLArchiveUsageDB *this, uint64_t a2)
{
  __darwin_time_t tv_sec = v13.tv_sec;
  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v12, this);
  if (v12)
  {
    uint64_t v11 = 0LL;
    int v5 = mdb_cursor_open(v12, *((_DWORD *)this + 2), &v11);
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = mdb_strerror(v5);
        MTLArchiveUsageDB::prune((uint64_t)v6, (uint64_t)v14, v7);
      }
    }

    else
    {
      int v8 = mdb_cursor_get(v11, v14, v10, 0);
      unint64_t v9 = tv_sec - a2;
      while (v8 != -30798)
      {
        if (*(void *)v14[1] < v9) {
          mdb_cursor_del(v11, 32);
        }
        int v8 = mdb_cursor_get(v11, v14, v10, 11);
      }
    }
  }

  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v12);
}

void sub_100001290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

uint64_t MTLArchiveUsageDB::getPrioritizedList@<X0>(MTLArchiveUsageDB *this@<X0>, uint64_t *a2@<X8>)
{
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  int v26 = 1065353216;
  a2[1] = 0LL;
  a2[2] = 0LL;
  *a2 = 0LL;
  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v23, this);
  if (v23)
  {
    uint64_t v22 = 0LL;
    int v4 = mdb_cursor_open(v23, *((_DWORD *)this + 2), &v22);
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        int v5 = mdb_strerror(v4);
        MTLArchiveUsageDB::prune((uint64_t)v5, (uint64_t)__dst, v6);
      }
    }

    else
    {
      for (int i = mdb_cursor_get(v22, v21, v20, 0); i != -30798; int i = mdb_cursor_get(v22, v21, v20, 8))
      {
        if (!MTLVersionedDB::isVersionEntry((uint64_t)this, v21[0], (char *)v21[1]))
        {
          size_t v8 = 0LL;
          size_t v9 = v20[0];
          size_t v29 = 0LL;
          char v30 = 0;
          if (v20[0] - 1033 >= 0xFFFFFFFFFFFFFBFFLL)
          {
            memcpy(__dst, (const void *)v20[1], v20[0]);
            size_t v8 = v9 - 8;
            size_t v29 = v9 - 8;
            char v30 = 1;
          }

          std::string::basic_string[abi:ne180100](&v27, &__dst[0].__r_.__value_.__r.__words[1], v8);
          std::string __p = v27;
          std::string::size_type v19 = __dst[0].__r_.__value_.__r.__words[0];
          v27.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
          uint64_t v10 = std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__emplace_unique_key_args<std::tuple<std::string,unsigned int,unsigned int>,std::piecewise_construct_t const&,std::tuple<std::tuple<std::string,unsigned int,unsigned int>&&>,std::tuple<>>( (uint64_t)&v24,  (uint64_t)&__p,  (uint64_t)std::piecewise_construct,  (__int128 **)&v27);
          ++v10[12];
        }
      }

      memset(&__p, 0, sizeof(__p));
      unint64_t v11 = 0LL;
      if ((void)v25)
      {
        uint64_t v12 = (void *)v25;
        do
        {
          ++v11;
          uint64_t v12 = (void *)*v12;
        }

        while (v12);
      }

      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__init_with_size[abi:ne180100]<std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>,std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>>( &__p,  (uint64_t *)v25,  0LL,  v11);
      unint64_t v13 = 126
          - 2
          * __clz(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3));
      if (__p.__r_.__value_.__l.__size_ == __p.__r_.__value_.__r.__words[0]) {
        uint64_t v14 = 0LL;
      }
      else {
        uint64_t v14 = v13;
      }
      std::__introsort<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *,false>( (uint64_t)__p.__r_.__value_.__l.__data_,  (void *)__p.__r_.__value_.__l.__size_,  v14,  1);
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
      for (j = (__int128 *)__p.__r_.__value_.__r.__words[0]; j != (__int128 *)size; j = (__int128 *)((char *)j + 40))
      {
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,std::string,unsigned int,unsigned int>::__tuple_impl( __dst,  j);
        std::vector<std::tuple<std::string,unsigned int,unsigned int>>::push_back[abi:ne180100](a2, (__int128 *)__dst);
      }

      __dst[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__destroy_vector::operator()[abi:ne180100]((void ***)__dst);
    }
  }

  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v23);
  return std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table((uint64_t)&v24);
}

void sub_100001548( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, int a22, __int16 a23, char a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, void *a35, uint64_t a36, int a37, __int16 a38, char a39, char a40)
{
}

void __clang_call_terminate(void *a1)
{
}

void *std::string::basic_string[abi:ne180100](void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    std::string::__throw_length_error[abi:ne180100]();
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
    *__int128 __dst = v6;
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

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_1000016E4(_Unwind_Exception *a1)
{
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table( uint64_t a1)
{
  v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__deallocate_node( int a1, void **__p)
{
  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (void **)*v2;
      operator delete(v2);
      v2 = v3;
    }

    while (v3);
  }
}

void std::vector<std::tuple<std::string,unsigned int,unsigned int>>::__destroy_vector::operator()[abi:ne180100]( void ***a1)
{
  v2 = *a1;
  if (*v2)
  {
    std::vector<std::tuple<std::string,unsigned int,unsigned int>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }

void std::vector<std::tuple<std::string,unsigned int,unsigned int>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 32LL)
  {
  }

  a1[1] = v2;
}

void *std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__emplace_unique_key_args<std::tuple<std::string,unsigned int,unsigned int>,std::piecewise_construct_t const&,std::tuple<std::tuple<std::string,unsigned int,unsigned int>&&>,std::tuple<>>( uint64_t a1, uint64_t a2, uint64_t a3, __int128 **a4)
{
  unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)v31, a2);
  uint64_t v9 = *(unsigned int *)(a2 + 28);
  uint64_t v10 = v8 ^ (2LL * *(unsigned int *)(a2 + 24));
  unint64_t v11 = v10 ^ (4 * v9);
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      uint64_t v4 = v10 ^ (4 * v9);
      if (v11 >= v12) {
        uint64_t v4 = v11 % v12;
      }
    }

    else
    {
      uint64_t v4 = v11 & (v12 - 1);
    }

    v15 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v15)
    {
      for (uint64_t i = *v15; i; uint64_t i = *(void **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v11)
        {
          if (std::__tuple_equal<1ul>::operator()[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>>( (uint64_t)v31,  (unsigned __int8 *)i + 16,  (unsigned __int8 *)a2)
            && *((_DWORD *)i + 10) == *(_DWORD *)(a2 + 24)
            && *((_DWORD *)i + 11) == *(_DWORD *)(a2 + 28))
          {
            return i;
          }
        }

        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12) {
              v17 %= v12;
            }
          }

          else
          {
            v17 &= v12 - 1;
          }

          if (v17 != v4) {
            break;
          }
        }
      }
    }
  }

  __darwin_time_t v18 = (void *)(a1 + 16);
  uint64_t i = operator new(0x38uLL);
  uint64_t v32 = a1 + 16;
  *(void *)uint64_t i = 0LL;
  *((void *)i + 1) = v11;
  std::string::size_type v19 = *a4;
  __int128 v20 = **a4;
  *((void *)i + 4) = *((void *)*a4 + 2);
  *((_OWORD *)i + 1) = v20;
  *((void *)v19 + 1) = 0LL;
  *((void *)v19 + 2) = 0LL;
  *(void *)std::string::size_type v19 = 0LL;
  *((_DWORD *)i + 10) = *((_DWORD *)v19 + 6);
  *((_DWORD *)i + 11) = *((_DWORD *)v19 + 7);
  *((_DWORD *)i + 12) = 0;
  char v33 = 1;
  float v21 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v22 = *(float *)(a1 + 32);
  if (!v12 || (float)(v22 * (float)v12) < v21)
  {
    BOOL v23 = 1LL;
    if (v12 >= 3) {
      BOOL v23 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v24 = v23 | (2 * v12);
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      size_t v26 = v25;
    }
    else {
      size_t v26 = v24;
    }
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__rehash<true>( a1,  v26);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        uint64_t v4 = v11 % v12;
      }
      else {
        uint64_t v4 = v11;
      }
    }

    else
    {
      uint64_t v4 = (v12 - 1) & v11;
    }
  }

  uint64_t v27 = *(void *)a1;
  v28 = *(void **)(*(void *)a1 + 8 * v4);
  if (v28)
  {
    *(void *)uint64_t i = *v28;
LABEL_40:
    void *v28 = i;
    goto LABEL_41;
  }

  *(void *)uint64_t i = *v18;
  *__darwin_time_t v18 = i;
  *(void *)(v27 + 8 * v4) = v18;
  if (*(void *)i)
  {
    unint64_t v29 = *(void *)(*(void *)i + 8LL);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v29 >= v12) {
        v29 %= v12;
      }
    }

    else
    {
      v29 &= v12 - 1;
    }

    v28 = (void *)(*(void *)a1 + 8 * v29);
    goto LABEL_40;
  }

LABEL_41:
  ++*(void *)(a1 + 24);
  return i;
}

  double result = 0LL;
  *(_DWORD *)(v2 + 128) += v20 - v27;
  *uint64_t v4 = v27;
  return result;
}

    if (!(_DWORD)v22)
    {
      *(_WORD *)(a1 + 328) = 0;
      if (a4 != 17 || a5) {
        return 4294936498LL;
      }
      goto LABEL_46;
    }

    goto LABEL_6;
  }

  if ((v12[5] & 0x20) != 0)
  {
    float v21 = (uint64_t)v12 + v35 * (v20 - 1) + 16;
  }

  else
  {
    unint64_t v14 = (uint64_t)v12 + (unsigned __int16)v12[v20 + 7];
    *(void *)&v35 = *(unsigned __int16 *)(v14 + 6);
    float v21 = v14 + 8;
  }

  *((void *)&v35 + 1) = v21;
  BOOL v23 = (*(uint64_t (**)(void *, __int128 *))(*(void *)(a1 + 48) + 16LL))(a2, &v35);
  if (!v23)
  {
    *(_WORD *)(a1 + 2LL * *(unsigned __int16 *)(a1 + 66) + 328) = v20 - 1;
    goto LABEL_27;
  }

  if ((v23 & 0x80000000) == 0) {
    goto LABEL_33;
  }
  char v33 = *(unsigned __int16 *)(a1 + 2LL * *(unsigned __int16 *)(a1 + 66) + 328);
  if (v33 < ((unsigned __int16)v12[6] - 16) >> 1)
  {
    if ((v12[5] & 0x20) != 0)
    {
      v34 = (uint64_t)v12 + v35 * v33 + 16;
    }

    else
    {
      unint64_t v14 = (uint64_t)v12 + (unsigned __int16)v12[v33 + 8];
      *(void *)&v35 = *(unsigned __int16 *)(v14 + 6);
      v34 = v14 + 8;
    }

    *((void *)&v35 + 1) = v34;
    if (!(*(unsigned int (**)(void *, __int128 *))(*(void *)(a1 + 48) + 16LL))(a2, &v35))
    {
LABEL_27:
      if (a5) {
        *a5 = 1;
      }
      goto LABEL_46;
    }
  }

  *(_DWORD *)(a1 + 68) &= ~2u;
LABEL_8:
  uint8x8_t v13 = mdb_node_search(a1, a2, a5);
  unint64_t v14 = (uint64_t)v13;
  if (a5 && !*a5) {
    return 4294936498LL;
  }
  if (!v13)
  {
    double result = mdb_cursor_sibling(a1, 1LL);
    if ((_DWORD)result)
    {
      *(_DWORD *)(a1 + 68) |= 2u;
      return result;
    }

    unint64_t v12 = *(_WORD **)(a1 + 8LL * *(unsigned __int16 *)(a1 + 66) + 72);
    unint64_t v14 = (uint64_t)v12 + (unsigned __int16)v12[8];
  }

  if ((_DWORD)result) {
    uint64_t v27 = 2;
  }
  else {
    uint64_t v27 = 8;
  }
  *(_DWORD *)(v4 + 124) |= v27;
  return result;
}

void sub_100001ADC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
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

  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]( uint64_t a1, uint64_t *a2, unint64_t a3)
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
      float v22 = a2 + 4;
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
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }

  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }

  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100]( _DWORD *a1, unint64_t a2)
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

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100]( void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273LL * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557LL, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69LL * (v5 ^ (v4 - 0x3C5A37A36834CED9LL * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69LL
       * ((0x9DDFEA08EB382D69LL * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69LL * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100]( void *a1, uint64_t a2)
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

uint64_t std::__tuple_equal<1ul>::operator()[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>>( uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0LL) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0LL) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0LL;
  }
  if (v7 < 0) {
    uint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1LL;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }

  while (v9 == v11 && v14);
  return result;
}

void std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__rehash<true>( uint64_t a1, size_t __n)
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
      std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__do_rehash<true>( a1,  prime);
  }

void std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__do_rehash<true>( uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
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
      int v11 = (void *)*v7;
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
            *int v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            int v11 = v7;
          }

          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          int v11 = (void *)*v11;
          unint64_t v8 = v12;
        }

        while (v11);
      }
    }
  }

  else
  {
    int v10 = *(void **)a1;
    *(void *)a1 = 0LL;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0LL;
  }

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100]( uint64_t a1, void **__p)
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

std::string *std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__init_with_size[abi:ne180100]<std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>,std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>>( std::string *result, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__vallocate[abi:ne180100]( result,  a4);
    uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>,std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>,std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>*>( (uint64_t)&v6->__r_.__value_.__l.__cap_,  a2,  a3,  (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }

  return result;
}

void sub_100002328( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__vallocate[abi:ne180100]( void *a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667LL) {
    std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>( (uint64_t)(a1 + 2),  a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[40 * v4];
  return result;
}

void std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>( uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667LL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(40 * a2);
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>,std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>,std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>*>( uint64_t a1, uint64_t *a2, uint64_t *a3, std::string *this)
{
  uint64_t v4 = this;
  uint64_t v10 = this;
  int v11 = this;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = (__int128 *)a2;
    do
    {
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,std::string,unsigned int,unsigned int>::__tuple_impl( v4,  v6 + 1);
      LODWORD(v4[1].__r_.__value_.__r.__words[1]) = *((_DWORD *)v6 + 12);
      uint64_t v6 = *(__int128 **)v6;
      uint64_t v4 = (std::string *)((char *)v11 + 40);
      int v11 = (std::string *)((char *)v11 + 40);
    }

    while (v6 != (__int128 *)a3);
  }

  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_100002484( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

std::string *std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,std::string,unsigned int,unsigned int>::__tuple_impl( std::string *this, __int128 *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v4 = *a2;
    this->__r_.__value_.__l.__cap_ = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }

  LODWORD(this[1].__r_.__value_.__l.__data_) = *((_DWORD *)a2 + 6);
  HIDWORD(this[1].__r_.__value_.__r.__words[0]) = *((_DWORD *)a2 + 7);
  return this;
}

void std::string::__init_copy_ctor_external( std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  unint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8LL) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    unint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__l.__cap_ = v7 | 0x8000000000000000LL;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    unint64_t v5 = v8;
  }

  else
  {
    this->__r_.__value_.__s.__size_ = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>*>>::~__exception_guard_exceptions[abi:ne180100]( uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>*>::operator()[abi:ne180100]( uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    v1 -= 40LL;
  }

void std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__destroy_vector::operator()[abi:ne180100]( void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }

void std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__clear[abi:ne180100]( uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 40LL)
  {
  }

  a1[1] = v2;
}

void std::__introsort<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *,false>( uint64_t a1, void *a2, uint64_t a3, char a4)
{
LABEL_1:
  v113 = (__int128 *)(a2 - 10);
  v114 = (__int128 *)(a2 - 5);
  v112 = (__int128 *)(a2 - 15);
  unint64_t v7 = a1;
  unint64_t v120 = (unint64_t)a2;
  while (2)
  {
    a1 = v7;
    uint64_t v8 = (uint64_t)a2 - v7;
    uint64_t v9 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)((uint64_t)a2 - v7) >> 3);
    switch(v9)
    {
      case 0LL:
      case 1LL:
        return;
      case 2LL:
        if (*((_DWORD *)a2 - 2) > *(_DWORD *)(a1 + 32))
        {
          uint64_t v137 = *(void *)(a1 + 16);
          __int128 v129 = *(_OWORD *)a1;
          __int128 v52 = *(_OWORD *)(a2 - 5);
          *(void *)(a1 + 16) = *(a2 - 3);
          *(_OWORD *)a1 = v52;
          *(a2 - 3) = v137;
          *(_OWORD *)(a2 - 5) = v129;
          int v53 = *(_DWORD *)(a1 + 24);
          *(_DWORD *)(a1 + 24) = *((_DWORD *)a2 - 4);
          *((_DWORD *)a2 - 4) = v53;
          int v54 = *(_DWORD *)(a1 + 28);
          *(_DWORD *)(a1 + 28) = *((_DWORD *)a2 - 3);
          *((_DWORD *)a2 - 3) = v54;
          int v55 = *(_DWORD *)(a1 + 32);
          *(_DWORD *)(a1 + 32) = *((_DWORD *)a2 - 2);
          *((_DWORD *)a2 - 2) = v55;
        }

        return;
      case 3LL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>( (__int128 *)a1,  (__int128 *)(a1 + 40),  v114);
        return;
      case 4LL:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>( a1,  a1 + 40,  a1 + 80,  (uint64_t)v114);
        return;
      case 5LL:
        std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *,0>( (__n128 *)a1,  (__n128 *)(a1 + 40),  (__n128 *)(a1 + 80),  (__n128 *)(a1 + 120),  (__n128 *)v114);
        return;
      default:
        if (v8 <= 959)
        {
          v56 = (void *)(a1 + 40);
          BOOL v58 = (void *)a1 == a2 || v56 == a2;
          if ((a4 & 1) != 0)
          {
            if (!v58)
            {
              uint64_t v59 = 0LL;
              uint64_t v60 = a1;
              do
              {
                v61 = v56;
                unsigned int v62 = *(_DWORD *)(v60 + 72);
                if (v62 > *(_DWORD *)(v60 + 32))
                {
                  uint64_t v63 = *v56;
                  *(void *)v130 = *(void *)(v60 + 48);
                  *(void *)&v130[7] = *(void *)(v60 + 55);
                  char v64 = *(_BYTE *)(v60 + 63);
                  v56[1] = 0LL;
                  v56[2] = 0LL;
                  void *v56 = 0LL;
                  uint64_t v65 = *(void *)(v60 + 64);
                  uint64_t v66 = v59;
                  while (1)
                  {
                    uint64_t v67 = a1 + v66;
                    std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>( a1 + v66 + 40,  (__n128 *)(a1 + v66));
                    *(_DWORD *)(a1 + v66 + 72) = *(_DWORD *)(a1 + v66 + 32);
                    if (!v66) {
                      break;
                    }
                    v66 -= 40LL;
                    if (v62 <= *(_DWORD *)(v67 - 8))
                    {
                      uint64_t v68 = a1 + v66 + 40;
                      goto LABEL_79;
                    }
                  }

                  uint64_t v68 = a1;
LABEL_79:
                  *(void *)uint64_t v68 = v63;
                  *(void *)(v68 + 8) = *(void *)v130;
                  *(void *)(v68 + 15) = *(void *)&v130[7];
                  *(_BYTE *)(v68 + 23) = v64;
                  *(void *)(v68 + 24) = v65;
                  *(_DWORD *)(v68 + 32) = v62;
                }

                v56 = v61 + 5;
                v59 += 40LL;
                uint64_t v60 = (uint64_t)v61;
              }

              while (v61 + 5 != (void *)v120);
            }
          }

          else if (!v58)
          {
            v103 = (unsigned int *)(a1 + 72);
            do
            {
              v104 = v56;
              unsigned int v105 = *(_DWORD *)(a1 + 72);
              if (v105 > *(_DWORD *)(a1 + 32))
              {
                uint64_t v106 = *v56;
                *(void *)v133 = *(void *)(a1 + 48);
                *(void *)&v133[7] = *(void *)(a1 + 55);
                char v107 = *(_BYTE *)(a1 + 63);
                v56[1] = 0LL;
                v56[2] = 0LL;
                void *v56 = 0LL;
                uint64_t v108 = *(void *)(a1 + 64);
                v109 = v103;
                do
                {
                  v110 = v109;
                  std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>( (uint64_t)(v109 - 8),  (__n128 *)(v109 - 18));
                  unsigned int v111 = *(v109 - 10);
                  v109 -= 10;
                  unsigned int *v110 = v111;
                }

                while (v105 > *(v110 - 20));
                *((void *)v109 - 4) = v106;
                *(void *)((char *)v109 - 17) = *(void *)&v133[7];
                *((void *)v109 - 3) = *(void *)v133;
                *((_BYTE *)v109 - 9) = v107;
                *((void *)v109 - 1) = v108;
                unsigned int *v109 = v105;
              }

              v56 = v104 + 5;
              v103 += 10;
              a1 = (uint64_t)v104;
            }

            while (v104 + 5 != (void *)v120);
          }

          return;
        }

        if (!a3)
        {
          if ((void *)a1 != a2)
          {
            int64_t v69 = (unint64_t)(v9 - 2) >> 1;
            int64_t v70 = v69;
            do
            {
              int64_t v71 = v70;
              if (v69 >= v70)
              {
                uint64_t v72 = (2 * v70) | 1;
                v73 = (__n128 *)(a1 + 40 * v72);
                if (2 * v71 + 2 < v9)
                {
                  unsigned __int32 v74 = *(_DWORD *)(a1 + 40 * v72 + 32);
                  unsigned __int32 v75 = v73[4].n128_u32[2];
                  v73 = (__n128 *)((char *)v73 + 40 * (v74 > v75));
                  if (v74 > v75) {
                    uint64_t v72 = 2 * v71 + 2;
                  }
                }

                unsigned __int32 v76 = *(_DWORD *)(a1 + 40 * v71 + 32);
                if (v73[2].n128_u32[0] <= v76)
                {
                  v77 = (__n128 *)(a1 + 40 * v71);
                  unint64_t v118 = v77->n128_u64[0];
                  *(void *)&v131[7] = *(unint64_t *)((char *)&v77->n128_u64[1] + 7);
                  *(void *)v131 = v77->n128_u64[1];
                  unsigned __int8 v115 = v77[1].n128_u8[7];
                  v77->n128_u64[0] = 0LL;
                  v77->n128_u64[1] = 0LL;
                  v77[1].n128_u64[0] = 0LL;
                  unint64_t v78 = v77[1].n128_u64[1];
                  do
                  {
                    uint64_t v79 = (uint64_t)v77;
                    v77 = v73;
                    std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>( v79,  v73);
                    *(_DWORD *)(v79 + 32) = v77[2].n128_u32[0];
                    if (v69 < v72) {
                      break;
                    }
                    uint64_t v80 = (2 * v72) | 1;
                    v73 = (__n128 *)(a1 + 40 * v80);
                    if (2 * v72 + 2 < v9)
                    {
                      unsigned __int32 v81 = *(_DWORD *)(a1 + 40 * v80 + 32);
                      unsigned __int32 v82 = v73[4].n128_u32[2];
                      v73 = (__n128 *)((char *)v73 + 40 * (v81 > v82));
                      if (v81 > v82) {
                        uint64_t v80 = 2 * v72 + 2;
                      }
                    }

                    uint64_t v72 = v80;
                  }

                  while (v73[2].n128_u32[0] <= v76);
                  if (v77[1].n128_i8[7] < 0) {
                    operator delete((void *)v77->n128_u64[0]);
                  }
                  v77->n128_u64[0] = v118;
                  v77->n128_u64[1] = *(void *)v131;
                  *(unint64_t *)((char *)&v77->n128_u64[1] + 7) = *(void *)&v131[7];
                  v77[1].n128_u8[7] = v115;
                  v77[1].n128_u64[1] = v78;
                  v77[2].n128_u32[0] = v76;
                }
              }

              int64_t v70 = v71 - 1;
            }

            while (v71);
            int64_t v83 = v8 / 0x28uLL;
            v84 = (void **)v120;
            do
            {
              uint64_t v85 = 0LL;
              v119 = *(void **)a1;
              v86 = v84;
              *(void *)v125 = *(void *)(a1 + 8);
              *(void *)&v125[7] = *(void *)(a1 + 15);
              char v121 = *(_BYTE *)(a1 + 23);
              *(void *)(a1 + 8) = 0LL;
              *(void *)(a1 + 16) = 0LL;
              *(void *)a1 = 0LL;
              int v87 = *(_DWORD *)(a1 + 24);
              int v116 = *(_DWORD *)(a1 + 28);
              uint64_t v88 = a1;
              int v89 = *(_DWORD *)(a1 + 32);
              do
              {
                uint64_t v90 = v85 + 1;
                uint64_t v91 = v88 + 40 * (v85 + 1);
                uint64_t v92 = (2 * v85) | 1;
                uint64_t v93 = 2 * v85 + 2;
                if (v93 < v83)
                {
                  unsigned int v94 = *(_DWORD *)(v88 + 40 * v90 + 32);
                  unsigned int v95 = *(_DWORD *)(v91 + 72);
                  v91 += 40LL * (v94 > v95);
                  if (v94 > v95) {
                    uint64_t v92 = v93;
                  }
                }

                std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>( v88,  (__n128 *)v91);
                *(_DWORD *)(v88 + 32) = *(_DWORD *)(v91 + 32);
                uint64_t v88 = v91;
                uint64_t v85 = v92;
              }

              while (v92 <= (uint64_t)((unint64_t)(v83 - 2) >> 1));
              v84 -= 5;
              if ((void **)v91 == v86 - 5)
              {
                *(void *)uint64_t v91 = v119;
                *(void *)(v91 + 8) = *(void *)v125;
                *(void *)(v91 + 15) = *(void *)&v125[7];
                *(_BYTE *)(v91 + 23) = v121;
                *(_DWORD *)(v91 + 24) = v87;
                *(_DWORD *)(v91 + 28) = v116;
                *(_DWORD *)(v91 + 32) = v89;
              }

              else
              {
                std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>( v91,  (__n128 *)(v86 - 5));
                *(_DWORD *)(v91 + 32) = *((_DWORD *)v86 - 2);
                *(v86 - 5) = v119;
                *(void **)((char *)v86 - 25) = *(void **)&v125[7];
                *(v86 - 4) = *(void **)v125;
                *((_BYTE *)v86 - 17) = v121;
                *((_DWORD *)v86 - 4) = v87;
                *((_DWORD *)v86 - 3) = v116;
                *((_DWORD *)v86 - 2) = v89;
                uint64_t v96 = v91 + 40 - a1;
                if (v96 >= 41)
                {
                  unint64_t v97 = (v96 / 0x28uLL - 2) >> 1;
                  unsigned int v98 = *(_DWORD *)(v91 + 32);
                  if (*(_DWORD *)(a1 + 40 * v97 + 32) > v98)
                  {
                    v99 = *(void **)v91;
                    *(void *)v132 = *(void *)(v91 + 8);
                    *(void *)&v132[7] = *(void *)(v91 + 15);
                    char v122 = *(_BYTE *)(v91 + 23);
                    *(void *)(v91 + 8) = 0LL;
                    *(void *)(v91 + 16) = 0LL;
                    *(void *)uint64_t v91 = 0LL;
                    uint64_t v100 = *(void *)(v91 + 24);
                    do
                    {
                      uint64_t v101 = v91;
                      uint64_t v91 = a1 + 40 * v97;
                      std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>( v101,  (__n128 *)v91);
                      *(_DWORD *)(v101 + 32) = *(_DWORD *)(v91 + 32);
                      if (!v97) {
                        break;
                      }
                      unint64_t v97 = (v97 - 1) >> 1;
                    }

                    while (*(_DWORD *)(a1 + 40 * v97 + 32) > v98);
                    *(void *)uint64_t v91 = v99;
                    *(void *)(v91 + 15) = *(void *)&v132[7];
                    *(void *)(v91 + 8) = *(void *)v132;
                    *(_BYTE *)(v91 + 23) = v122;
                    *(void *)(v91 + 24) = v100;
                    *(_DWORD *)(v91 + 32) = v98;
                  }
                }
              }
            }

            while (v83-- > 2);
          }

          return;
        }

        unint64_t v10 = (unint64_t)v9 >> 1;
        unint64_t v11 = a1 + 40 * ((unint64_t)v9 >> 1);
        if ((unint64_t)v8 < 0x1401)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>( (__int128 *)v11,  (__int128 *)a1,  v114);
        }

        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>( (__int128 *)a1,  (__int128 *)v11,  v114);
          uint64_t v12 = 5 * v10;
          uint64_t v13 = a1 + 8 * v12;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>( (__int128 *)(a1 + 40),  (__int128 *)(v13 - 40),  v113);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>( (__int128 *)(a1 + 80),  (__int128 *)(a1 + 40 + 8 * v12),  v112);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>( (__int128 *)(v13 - 40),  (__int128 *)v11,  (__int128 *)(a1 + 40 + 8 * v12));
          uint64_t v134 = *(void *)(a1 + 16);
          __int128 v126 = *(_OWORD *)a1;
          uint64_t v14 = *(void *)(v11 + 16);
          *(_OWORD *)a1 = *(_OWORD *)v11;
          *(void *)(a1 + 16) = v14;
          *(void *)(v11 + 16) = v134;
          *(_OWORD *)unint64_t v11 = v126;
          uint64_t v15 = *(void *)(a1 + 24);
          *(void *)(a1 + 24) = *(void *)(v11 + 24);
          *(void *)(v11 + 24) = v15;
          LODWORD(v14) = *(_DWORD *)(a1 + 32);
          *(_DWORD *)(a1 + 32) = *(_DWORD *)(v13 + 32);
          *(_DWORD *)(v13 + 32) = v14;
        }

        --a3;
        a2 = (void *)v120;
        if ((a4 & 1) == 0)
        {
          unsigned int v16 = *(_DWORD *)(a1 + 32);
          if (*(_DWORD *)(a1 - 8) > v16) {
            goto LABEL_11;
          }
          uint64_t v36 = *(void *)a1;
          *(void *)v124 = *(void *)(a1 + 8);
          *(void *)&v124[7] = *(void *)(a1 + 15);
          char v37 = *(_BYTE *)(a1 + 23);
          *(void *)(a1 + 8) = 0LL;
          *(void *)(a1 + 16) = 0LL;
          *(void *)a1 = 0LL;
          if (v16 <= *(_DWORD *)(v120 - 8))
          {
            unint64_t v40 = a1 + 40;
            do
            {
              unint64_t v7 = v40;
              if (v40 >= v120) {
                break;
              }
              unsigned int v41 = *(_DWORD *)(v40 + 32);
              v40 += 40LL;
            }

            while (v16 <= v41);
          }

          else
          {
            uint64_t v38 = a1;
            do
            {
              unint64_t v7 = v38 + 40;
              unsigned int v39 = *(_DWORD *)(v38 + 72);
              v38 += 40LL;
            }

            while (v16 <= v39);
          }

          unint64_t v42 = v120;
          if (v7 < v120)
          {
            unint64_t v43 = v120;
            do
            {
              unint64_t v42 = v43 - 40;
              unsigned int v44 = *(_DWORD *)(v43 - 8);
              v43 -= 40LL;
            }

            while (v16 > v44);
          }

          uint64_t v45 = *(void *)(a1 + 24);
          while (v7 < v42)
          {
            uint64_t v136 = *(void *)(v7 + 16);
            __int128 v128 = *(_OWORD *)v7;
            __int128 v46 = *(_OWORD *)v42;
            *(void *)(v7 + 16) = *(void *)(v42 + 16);
            *(_OWORD *)unint64_t v7 = v46;
            *(void *)(v42 + 16) = v136;
            *(_OWORD *)unint64_t v42 = v128;
            int v47 = *(_DWORD *)(v7 + 24);
            *(_DWORD *)(v7 + 24) = *(_DWORD *)(v42 + 24);
            *(_DWORD *)(v42 + 24) = v47;
            int v48 = *(_DWORD *)(v7 + 28);
            *(_DWORD *)(v7 + 28) = *(_DWORD *)(v42 + 28);
            *(_DWORD *)(v42 + 28) = v48;
            int v49 = *(_DWORD *)(v7 + 32);
            *(_DWORD *)(v7 + 32) = *(_DWORD *)(v42 + 32);
            *(_DWORD *)(v42 + 32) = v49;
            do
            {
              unsigned int v50 = *(_DWORD *)(v7 + 72);
              v7 += 40LL;
            }

            while (v16 <= v50);
            do
            {
              unsigned int v51 = *(_DWORD *)(v42 - 8);
              v42 -= 40LL;
            }

            while (v16 > v51);
          }

          if (v7 - 40 != a1)
          {
            std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>( a1,  (__n128 *)(v7 - 40));
            *(_DWORD *)(a1 + 32) = *(_DWORD *)(v7 - 8);
          }

          a4 = 0;
          *(void *)(v7 - 40) = v36;
          *(void *)(v7 - 25) = *(void *)&v124[7];
          *(void *)(v7 - 32) = *(void *)v124;
          *(_BYTE *)(v7 - 17) = v37;
          *(void *)(v7 - 16) = v45;
          *(_DWORD *)(v7 - 8) = v16;
          continue;
        }

        unsigned int v16 = *(_DWORD *)(a1 + 32);
LABEL_11:
        uint64_t v17 = 0LL;
        uint64_t v18 = *(void *)a1;
        *(void *)v123 = *(void *)(a1 + 8);
        *(void *)&v123[7] = *(void *)(a1 + 15);
        char v19 = *(_BYTE *)(a1 + 23);
        *(void *)(a1 + 8) = 0LL;
        *(void *)(a1 + 16) = 0LL;
        *(void *)a1 = 0LL;
        uint64_t v20 = *(void *)(a1 + 24);
        do
        {
          unsigned int v21 = *(_DWORD *)(a1 + v17 + 72);
          v17 += 40LL;
        }

        while (v21 > v16);
        unint64_t v22 = a1 + v17;
        unint64_t v23 = v120;
        if (v17 == 40)
        {
          unint64_t v26 = v120;
          while (v22 < v26)
          {
            unint64_t v24 = v26 - 40;
            unsigned int v27 = *(_DWORD *)(v26 - 8);
            v26 -= 40LL;
            if (v27 > v16) {
              goto LABEL_21;
            }
          }

          unint64_t v24 = v26;
        }

        else
        {
          do
          {
            unint64_t v24 = v23 - 40;
            unsigned int v25 = *(_DWORD *)(v23 - 8);
            v23 -= 40LL;
          }

          while (v25 <= v16);
        }

LABEL_21:
        unint64_t v7 = v22;
        if (v22 < v24)
        {
          unint64_t v28 = v24;
          do
          {
            uint64_t v135 = *(void *)(v7 + 16);
            __int128 v127 = *(_OWORD *)v7;
            __int128 v29 = *(_OWORD *)v28;
            *(void *)(v7 + 16) = *(void *)(v28 + 16);
            *(_OWORD *)unint64_t v7 = v29;
            *(void *)(v28 + 16) = v135;
            *(_OWORD *)unint64_t v28 = v127;
            int v30 = *(_DWORD *)(v7 + 24);
            *(_DWORD *)(v7 + 24) = *(_DWORD *)(v28 + 24);
            *(_DWORD *)(v28 + 24) = v30;
            int v31 = *(_DWORD *)(v7 + 28);
            *(_DWORD *)(v7 + 28) = *(_DWORD *)(v28 + 28);
            *(_DWORD *)(v28 + 28) = v31;
            int v32 = *(_DWORD *)(v7 + 32);
            *(_DWORD *)(v7 + 32) = *(_DWORD *)(v28 + 32);
            *(_DWORD *)(v28 + 32) = v32;
            do
            {
              unsigned int v33 = *(_DWORD *)(v7 + 72);
              v7 += 40LL;
            }

            while (v33 > v16);
            do
            {
              unsigned int v34 = *(_DWORD *)(v28 - 8);
              v28 -= 40LL;
            }

            while (v34 <= v16);
          }

          while (v7 < v28);
        }

        if (v7 - 40 != a1)
        {
          std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>( a1,  (__n128 *)(v7 - 40));
          *(_DWORD *)(a1 + 32) = *(_DWORD *)(v7 - 8);
        }

        *(void *)(v7 - 40) = v18;
        *(void *)(v7 - 25) = *(void *)&v123[7];
        *(void *)(v7 - 32) = *(void *)v123;
        *(_BYTE *)(v7 - 17) = v19;
        *(void *)(v7 - 16) = v20;
        *(_DWORD *)(v7 - 8) = v16;
        if (v22 < v24)
        {
LABEL_34:
          std::__introsort<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *,false>( a1,  v7 - 40,  a3,  a4 & 1);
          a4 = 0;
          continue;
        }

        BOOL v35 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>( a1,  v7 - 40);
        if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>( v7,  v120))
        {
          if (v35) {
            continue;
          }
          goto LABEL_34;
        }

        a2 = (void *)(v7 - 40);
        if (!v35) {
          goto LABEL_1;
        }
        return;
    }
  }

    --*(_WORD *)(a1 + 66);
    mdb_node_del((void *)a1, 0);
    uint64_t v17 = *(unsigned __int16 *)(a1 + 66);
    if (!*(_WORD *)(a1 + 2 * v17 + 328))
    {
      unsigned int v51 = 0LL;
      uint64_t result = mdb_update_key(a1, (uint64_t)&v51);
      LOWORD(v17) = *(_WORD *)(a1 + 66);
      if ((_DWORD)result)
      {
        *(_WORD *)(a1 + 66) = v17 + 1;
        return result;
      }
    }

    uint64_t v18 = v17 + 1;
    *(_WORD *)(a1 + 66) = v18;
    char v19 = *(void *)(a1 + 8LL * v18 + 72);
    uint64_t v20 = *(void *)v19;
    unsigned int v21 = *(void *)(a1 + 24);
    unint64_t v22 = *(_WORD *)(v19 + 10);
    if ((v22 & 0x10) != 0 && *(_DWORD *)(a1 + 32))
    {
      if (!*(void *)v21)
      {
LABEL_35:
        *(void *)(v19 + 48) = *(void *)(v21 + 48);
        *(void *)(v21 + 48) = v19;
        ++*(_DWORD *)(v21 + 56);
        unsigned int v25 = v22 | 0x4000;
        *(_WORD *)(v19 + 10) = v25;
LABEL_36:
        unint64_t v26 = (v25 & 2) == 0;
        unsigned int v27 = 16LL;
        if (v26) {
          unsigned int v27 = 8LL;
        }
        --*(void *)(*(void *)(a1 + 40) + v27);
        unint64_t v28 = *(void **)(*(void *)(*(void *)(a1 + 24) + 104LL) + 8LL * *(unsigned int *)(a1 + 32));
        if (v28)
        {
          __int128 v29 = *(unsigned __int16 *)(a1 + 66);
          int v30 = *(_DWORD *)(a1 + 68);
          int v31 = (v29 - 1);
          do
          {
            int v32 = v28;
            if ((v30 & 4) != 0) {
              int v32 = (void *)v28[2];
            }
            if (v32 != (void *)a1 && *((unsigned __int16 *)v32 + 32) >= *(unsigned __int16 *)(a1 + 64))
            {
              unsigned int v33 = &v32[v29];
              uint64_t v36 = v33[9];
              BOOL v35 = v33 + 9;
              unsigned int v34 = v36;
              if (v36 == v19)
              {
                *BOOL v35 = v6;
                *((_WORD *)v32 + v29 + 164) += v7 >> 1;
                *((_WORD *)v32 + v31 + 164) = *(_WORD *)(a2 + 2LL * v31 + 328);
                unsigned int v34 = v6;
              }

              else if (v32[v31 + 9] == *(void *)(a1 + 8LL * v31 + 72))
              {
                char v37 = (char *)v32 + 2 * v31;
                uint64_t v38 = *((unsigned __int16 *)v37 + 164);
              }

              if ((*(_WORD *)(v19 + 10) & 2) != 0)
              {
                unsigned int v39 = v32[2];
                if (v39)
                {
                  if ((*(_BYTE *)(v39 + 68) & 1) != 0)
                  {
                    unint64_t v40 = *((unsigned __int16 *)v32 + v29 + 164);
                    if (v40 < (*(unsigned __int16 *)(v34 + 12) - 16) >> 1)
                    {
                      unsigned int v41 = v34 + *(unsigned __int16 *)(v34 + 2 * v40 + 16);
                      if ((*(_WORD *)(v41 + 4) & 6) == 4) {
                        *(void *)(v39 + 72) = v41 + *(unsigned __int16 *)(v41 + 6) + 8;
                      }
                    }
                  }
                }
              }
            }

            unint64_t v28 = (void *)*v28;
          }

          while (v28);
        }

        unint64_t v42 = *(_WORD *)(a2 + 64);
        unint64_t v43 = *(_WORD *)(*(void *)(a2 + 40) + 6LL);
        if (v42)
        {
          *(_WORD *)(a2 + 64) = v42 - 1;
          if (v42 == 1) {
            *(_DWORD *)(a2 + 68) &= ~1u;
          }
          else {
            --*(_WORD *)(a2 + 66);
          }
        }

        uint64_t result = mdb_rebalance(a2);
        unsigned int v44 = *(_WORD *)(*(void *)(a2 + 40) + 6LL) - v43 + v42;
        *(_WORD *)(a2 + 64) = v44;
        *(_WORD *)(a2 + 66) = v44 - 1;
        return result;
      }

      unint64_t v23 = *(void **)(v21 + 72);
      if (*v23)
      {
        unint64_t v24 = mdb_mid2l_search(*(unsigned int **)(v21 + 72), *(void *)v19);
        if (*v23 >= (unint64_t)v24 && v23[2 * v24] == v20)
        {
          if (v23[2 * v24 + 1] != v19)
          {
            *(_DWORD *)(a1 + 68) &= 0xFFFFFFFC;
            *(_DWORD *)(v21 + 124) |= 2u;
            return 4294936517LL;
          }

          unint64_t v22 = *(_WORD *)(v19 + 10);
          goto LABEL_35;
        }
      }
    }

    uint64_t result = mdb_midl_append((unint64_t **)(v21 + 40), v20);
    if ((_DWORD)result) {
      return result;
    }
    unsigned int v25 = *(_WORD *)(v19 + 10);
    goto LABEL_36;
  }

  unsigned int v51 = **(unsigned int **)(a1 + 40);
  __int128 v52 = (unsigned int *)(v4 + 16);
  if ((*(_WORD *)(v4 + 12) & 0xFFFE) == 0x10) {
    goto LABEL_21;
  }
  uint64_t v15 = 0;
  unsigned int v16 = v7 >> 1;
  while (1)
  {
    uint64_t result = mdb_node_add(a2, (unsigned __int16)v16, (const void **)&v51, 0LL, 0LL, 0);
    if ((_DWORD)result) {
      return result;
    }
    __int128 v52 = (unsigned int *)((char *)v52 + v51);
    ++v15;
    LOWORD(v16) = v16 + 1;
  }

__n128 std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *,0>( __n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, __n128 *a5)
{
  result.n128_u64[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>( (uint64_t)a1,  (uint64_t)a2,  (uint64_t)a3,  (uint64_t)a4).n128_u64[0];
  if (a5[2].n128_u32[0] > a4[2].n128_u32[0])
  {
    unint64_t v11 = a4[1].n128_u64[0];
    __n128 result = *a4;
    unint64_t v12 = a5[1].n128_u64[0];
    *a4 = *a5;
    a4[1].n128_u64[0] = v12;
    *a5 = result;
    a5[1].n128_u64[0] = v11;
    LODWORD(v11) = a4[1].n128_u32[2];
    a4[1].n128_u32[2] = a5[1].n128_u32[2];
    a5[1].n128_u32[2] = v11;
    LODWORD(v11) = a4[1].n128_u32[3];
    a4[1].n128_u32[3] = a5[1].n128_u32[3];
    a5[1].n128_u32[3] = v11;
    LODWORD(v11) = a4[2].n128_u32[0];
    a4[2].n128_u32[0] = a5[2].n128_u32[0];
    a5[2].n128_u32[0] = v11;
    if (a4[2].n128_u32[0] > a3[2].n128_u32[0])
    {
      unint64_t v13 = a3[1].n128_u64[0];
      __n128 result = *a3;
      unint64_t v14 = a4[1].n128_u64[0];
      *a3 = *a4;
      a3[1].n128_u64[0] = v14;
      *a4 = result;
      a4[1].n128_u64[0] = v13;
      LODWORD(v13) = a3[1].n128_u32[2];
      a3[1].n128_u32[2] = a4[1].n128_u32[2];
      a4[1].n128_u32[2] = v13;
      LODWORD(v13) = a3[1].n128_u32[3];
      a3[1].n128_u32[3] = a4[1].n128_u32[3];
      a4[1].n128_u32[3] = v13;
      LODWORD(v13) = a3[2].n128_u32[0];
      a3[2].n128_u32[0] = a4[2].n128_u32[0];
      a4[2].n128_u32[0] = v13;
      if (a3[2].n128_u32[0] > a2[2].n128_u32[0])
      {
        unint64_t v15 = a2[1].n128_u64[0];
        __n128 result = *a2;
        unint64_t v16 = a3[1].n128_u64[0];
        *a2 = *a3;
        a2[1].n128_u64[0] = v16;
        *a3 = result;
        a3[1].n128_u64[0] = v15;
        LODWORD(v15) = a2[1].n128_u32[2];
        a2[1].n128_u32[2] = a3[1].n128_u32[2];
        a3[1].n128_u32[2] = v15;
        LODWORD(v15) = a2[1].n128_u32[3];
        a2[1].n128_u32[3] = a3[1].n128_u32[3];
        a3[1].n128_u32[3] = v15;
        LODWORD(v15) = a2[2].n128_u32[0];
        a2[2].n128_u32[0] = a3[2].n128_u32[0];
        a3[2].n128_u32[0] = v15;
        if (a2[2].n128_u32[0] > a1[2].n128_u32[0])
        {
          unint64_t v17 = a1[1].n128_u64[0];
          __n128 result = *a1;
          unint64_t v18 = a2[1].n128_u64[0];
          *a1 = *a2;
          a1[1].n128_u64[0] = v18;
          *a2 = result;
          a2[1].n128_u64[0] = v17;
          LODWORD(v17) = a1[1].n128_u32[2];
          a1[1].n128_u32[2] = a2[1].n128_u32[2];
          a2[1].n128_u32[2] = v17;
          LODWORD(v17) = a1[1].n128_u32[3];
          a1[1].n128_u32[3] = a2[1].n128_u32[3];
          a2[1].n128_u32[3] = v17;
          LODWORD(v17) = a1[2].n128_u32[0];
          a1[2].n128_u32[0] = a2[2].n128_u32[0];
          a2[2].n128_u32[0] = v17;
        }
      }
    }
  }

  return result;
}

__int128 *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>( __int128 *result, __int128 *a2, __int128 *a3)
{
  uint64_t v3 = (int *)(a2 + 2);
  unsigned int v4 = *((_DWORD *)a2 + 8);
  unint64_t v5 = (int *)(result + 2);
  unsigned int v6 = *((_DWORD *)a3 + 8);
  if (v4 > *((_DWORD *)result + 8))
  {
    if (v6 <= v4)
    {
      uint64_t v18 = *((void *)result + 2);
      __int128 v19 = *result;
      uint64_t v20 = *((void *)a2 + 2);
      char *result = *a2;
      *((void *)result + 2) = v20;
      *a2 = v19;
      *((void *)a2 + 2) = v18;
      LODWORD(v18) = *((_DWORD *)result + 6);
      *((_DWORD *)result + 6) = *((_DWORD *)a2 + 6);
      *((_DWORD *)a2 + 6) = v18;
      unint64_t v7 = (int *)a2 + 7;
      int v21 = *((_DWORD *)result + 7);
      *((_DWORD *)result + 7) = *((_DWORD *)a2 + 7);
      *((_DWORD *)a2 + 7) = v21;
      LODWORD(v18) = *((_DWORD *)result + 8);
      *((_DWORD *)result + 8) = *((_DWORD *)a2 + 8);
      *((_DWORD *)a2 + 8) = v18;
      uint64_t v22 = *((void *)a2 + 2);
      __int128 v23 = *a2;
      uint64_t v24 = *((void *)a3 + 2);
      *a2 = *a3;
      *((void *)a2 + 2) = v24;
      *a3 = v23;
      *((void *)a3 + 2) = v22;
      LODWORD(v22) = *((_DWORD *)a2 + 6);
      *((_DWORD *)a2 + 6) = *((_DWORD *)a3 + 6);
      *((_DWORD *)a3 + 6) = v22;
      unint64_t v11 = (int *)a3 + 7;
      unint64_t v5 = (int *)(a2 + 2);
    }

    else
    {
      unint64_t v7 = (int *)result + 7;
      uint64_t v8 = *((void *)result + 2);
      __int128 v9 = *result;
      uint64_t v10 = *((void *)a3 + 2);
      char *result = *a3;
      *((void *)result + 2) = v10;
      *a3 = v9;
      *((void *)a3 + 2) = v8;
      LODWORD(v8) = *((_DWORD *)result + 6);
      *((_DWORD *)result + 6) = *((_DWORD *)a3 + 6);
      *((_DWORD *)a3 + 6) = v8;
      unint64_t v11 = (int *)a3 + 7;
    }

    uint64_t v3 = (int *)(a3 + 2);
    goto LABEL_10;
  }

  if (v6 > v4)
  {
    uint64_t v12 = *((void *)a2 + 2);
    __int128 v13 = *a2;
    uint64_t v14 = *((void *)a3 + 2);
    *a2 = *a3;
    *((void *)a2 + 2) = v14;
    *a3 = v13;
    *((void *)a3 + 2) = v12;
    LODWORD(v12) = *((_DWORD *)a2 + 6);
    *((_DWORD *)a2 + 6) = *((_DWORD *)a3 + 6);
    *((_DWORD *)a3 + 6) = v12;
    unint64_t v11 = (int *)a2 + 7;
    LODWORD(v12) = *((_DWORD *)a2 + 7);
    *((_DWORD *)a2 + 7) = *((_DWORD *)a3 + 7);
    *((_DWORD *)a3 + 7) = v12;
    LODWORD(v12) = *((_DWORD *)a2 + 8);
    *((_DWORD *)a2 + 8) = *((_DWORD *)a3 + 8);
    *((_DWORD *)a3 + 8) = v12;
    if (*((_DWORD *)a2 + 8) > *v5)
    {
      uint64_t v15 = *((void *)result + 2);
      __int128 v16 = *result;
      uint64_t v17 = *((void *)a2 + 2);
      char *result = *a2;
      *((void *)result + 2) = v17;
      *a2 = v16;
      *((void *)a2 + 2) = v15;
      LODWORD(v15) = *((_DWORD *)result + 6);
      *((_DWORD *)result + 6) = *((_DWORD *)a2 + 6);
      *((_DWORD *)a2 + 6) = v15;
      unint64_t v7 = (int *)result + 7;
LABEL_10:
      int v25 = *v7;
      *unint64_t v7 = *v11;
      *unint64_t v11 = v25;
      int v26 = *v5;
      *unint64_t v5 = *v3;
      *uint64_t v3 = v26;
    }
  }

  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>( uint64_t a1, uint64_t a2)
{
  unint64_t v4 = 0xCCCCCCCCCCCCCCCDLL * ((a2 - a1) >> 3);
  BOOL result = 1LL;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      if (*(_DWORD *)(a2 - 8) > *(_DWORD *)(a1 + 32))
      {
        uint64_t v6 = *(void *)(a1 + 16);
        __int128 v7 = *(_OWORD *)a1;
        uint64_t v8 = *(void *)(a2 - 24);
        *(_OWORD *)a1 = *(_OWORD *)(a2 - 40);
        *(void *)(a1 + 16) = v8;
        *(_OWORD *)(a2 - 40) = v7;
        *(void *)(a2 - 24) = v6;
        LODWORD(v6) = *(_DWORD *)(a1 + 24);
        *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 - 16);
        *(_DWORD *)(a2 - 16) = v6;
        LODWORD(v6) = *(_DWORD *)(a1 + 28);
        *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 - 12);
        *(_DWORD *)(a2 - 12) = v6;
        LODWORD(v6) = *(_DWORD *)(a1 + 32);
        *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 - 8);
        *(_DWORD *)(a2 - 8) = v6;
      }

      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>( (__int128 *)a1,  (__int128 *)(a1 + 40),  (__int128 *)(a2 - 40));
      return 1LL;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>( a1,  a1 + 40,  a1 + 80,  a2 - 40);
      return 1LL;
    case 5uLL:
      std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *,0>( (__n128 *)a1,  (__n128 *)(a1 + 40),  (__n128 *)(a1 + 80),  (__n128 *)(a1 + 120),  (__n128 *)(a2 - 40));
      return 1LL;
    default:
      uint64_t v9 = a1 + 80;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>( (__int128 *)a1,  (__int128 *)(a1 + 40),  (__int128 *)(a1 + 80));
      uint64_t v10 = a1 + 120;
      if (a1 + 120 == a2) {
        return 1LL;
      }
      uint64_t v11 = 0LL;
      int v12 = 0;
      break;
  }

  while (1)
  {
    unsigned int v13 = *(_DWORD *)(v10 + 32);
    if (v13 > *(_DWORD *)(v9 + 32))
    {
      uint64_t v14 = *(void *)v10;
      *(void *)uint64_t v20 = *(void *)(v10 + 8);
      *(void *)&v20[7] = *(void *)(v10 + 15);
      char v15 = *(_BYTE *)(v10 + 23);
      *(void *)(v10 + 8) = 0LL;
      *(void *)(v10 + 16) = 0LL;
      *(void *)uint64_t v10 = 0LL;
      uint64_t v16 = *(void *)(v10 + 24);
      uint64_t v17 = v11;
      while (1)
      {
        uint64_t v18 = a1 + v17;
        std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>( a1 + v17 + 120,  (__n128 *)(a1 + v17 + 80));
        *(_DWORD *)(a1 + v17 + 152) = *(_DWORD *)(a1 + v17 + 112);
        if (v17 == -80) {
          break;
        }
        v17 -= 40LL;
        if (v13 <= *(_DWORD *)(v18 + 72))
        {
          uint64_t v19 = a1 + v17 + 120;
          goto LABEL_12;
        }
      }

      uint64_t v19 = a1;
LABEL_12:
      *(void *)uint64_t v19 = v14;
      *(void *)(v19 + 8) = *(void *)v20;
      *(void *)(v19 + 15) = *(void *)&v20[7];
      *(_BYTE *)(v19 + 23) = v15;
      *(void *)(v19 + 24) = v16;
      *(_DWORD *)(v19 + 32) = v13;
      if (++v12 == 8) {
        return v10 + 40 == a2;
      }
    }

    uint64_t v9 = v10;
    v11 += 40LL;
    v10 += 40LL;
    if (v10 == a2) {
      return 1LL;
    }
  }

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(_DWORD *)(a4 + 32) > *(_DWORD *)(a3 + 32))
  {
    uint64_t v9 = *(void *)(a3 + 16);
    __n128 result = *(__n128 *)a3;
    uint64_t v10 = *(void *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(void *)(a3 + 16) = v10;
    *(__n128 *)a4 = result;
    *(void *)(a4 + 16) = v9;
    LODWORD(v9) = *(_DWORD *)(a3 + 24);
    *(_DWORD *)(a3 + 24) = *(_DWORD *)(a4 + 24);
    *(_DWORD *)(a4 + 24) = v9;
    LODWORD(v9) = *(_DWORD *)(a3 + 28);
    *(_DWORD *)(a3 + 28) = *(_DWORD *)(a4 + 28);
    *(_DWORD *)(a4 + 28) = v9;
    LODWORD(v9) = *(_DWORD *)(a3 + 32);
    *(_DWORD *)(a3 + 32) = *(_DWORD *)(a4 + 32);
    *(_DWORD *)(a4 + 32) = v9;
    if (*(_DWORD *)(a3 + 32) > *(_DWORD *)(a2 + 32))
    {
      uint64_t v11 = *(void *)(a2 + 16);
      __n128 result = *(__n128 *)a2;
      uint64_t v12 = *(void *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(void *)(a2 + 16) = v12;
      *(__n128 *)a3 = result;
      *(void *)(a3 + 16) = v11;
      LODWORD(v11) = *(_DWORD *)(a2 + 24);
      *(_DWORD *)(a2 + 24) = *(_DWORD *)(a3 + 24);
      *(_DWORD *)(a3 + 24) = v11;
      LODWORD(v11) = *(_DWORD *)(a2 + 28);
      *(_DWORD *)(a2 + 28) = *(_DWORD *)(a3 + 28);
      *(_DWORD *)(a3 + 28) = v11;
      LODWORD(v11) = *(_DWORD *)(a2 + 32);
      *(_DWORD *)(a2 + 32) = *(_DWORD *)(a3 + 32);
      *(_DWORD *)(a3 + 32) = v11;
      if (*(_DWORD *)(a2 + 32) > *(_DWORD *)(a1 + 32))
      {
        uint64_t v13 = *(void *)(a1 + 16);
        __n128 result = *(__n128 *)a1;
        uint64_t v14 = *(void *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = v14;
        *(__n128 *)a2 = result;
        *(void *)(a2 + 16) = v13;
        LODWORD(v13) = *(_DWORD *)(a1 + 24);
        *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
        *(_DWORD *)(a2 + 24) = v13;
        LODWORD(v13) = *(_DWORD *)(a1 + 28);
        *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
        *(_DWORD *)(a2 + 28) = v13;
        LODWORD(v13) = *(_DWORD *)(a1 + 32);
        *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
        *(_DWORD *)(a2 + 32) = v13;
      }
    }
  }

  return result;
}

__n128 std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>( uint64_t a1, __n128 *a2)
{
  __n128 result = *a2;
  *(void *)(a1 + 16) = a2[1].n128_u64[0];
  *(__n128 *)a1 = result;
  a2[1].n128_u8[7] = 0;
  a2->n128_u8[0] = 0;
  *(_DWORD *)(a1 + 24) = a2[1].n128_u32[2];
  *(_DWORD *)(a1 + 28) = a2[1].n128_u32[3];
  return result;
}

uint64_t std::vector<std::tuple<std::string,unsigned int,unsigned int>>::push_back[abi:ne180100]( uint64_t *a1, __int128 *a2)
{
  unint64_t v6 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(result - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t)(v7 - *a1) >> 5;
    unint64_t v11 = v10 + 1;
    uint64_t v12 = v5 - *a1;
    if (v12 >> 4 > v11) {
      unint64_t v11 = v12 >> 4;
    }
    else {
      unint64_t v13 = v11;
    }
    v17[4] = result;
    if (v13) {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>>( result,  v13);
    }
    else {
      uint64_t v14 = 0LL;
    }
    char v15 = &v14[32 * v10];
    v17[0] = v14;
    v17[1] = v15;
    v17[3] = &v14[32 * v13];
    __int128 v16 = *a2;
    *((void *)v15 + 2) = *((void *)a2 + 2);
    *(_OWORD *)char v15 = v16;
    *((void *)a2 + 1) = 0LL;
    *((void *)a2 + 2) = 0LL;
    *(void *)a2 = 0LL;
    *((_DWORD *)v15 + 6) = *((_DWORD *)a2 + 6);
    *((_DWORD *)v15 + 7) = *((_DWORD *)a2 + 7);
    v17[2] = v15 + 32;
    std::vector<std::tuple<std::string,unsigned int,unsigned int>>::__swap_out_circular_buffer(a1, v17);
    uint64_t v9 = a1[1];
    uint64_t result = std::__split_buffer<std::tuple<std::string,unsigned int,unsigned int>>::~__split_buffer((uint64_t)v17);
  }

  else
  {
    __int128 v8 = *a2;
    *(void *)(v7 + 16) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v7 = v8;
    *((void *)a2 + 1) = 0LL;
    *((void *)a2 + 2) = 0LL;
    *(void *)a2 = 0LL;
    *(_DWORD *)(v7 + 24) = *((_DWORD *)a2 + 6);
    *(_DWORD *)(v7 + 28) = *((_DWORD *)a2 + 7);
    uint64_t v9 = v7 + 32;
    a1[1] = v7 + 32;
  }

  a1[1] = v9;
  return result;
}

void sub_100003AF0(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t std::vector<std::tuple<std::string,unsigned int,unsigned int>>::__swap_out_circular_buffer( uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>>( (uint64_t)(a1 + 2),  a1[1],  a1[1],  *a1,  *a1,  a2[1],  a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>>( uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
    uint64_t v8 = a7;
    do
    {
      __int128 v9 = *(_OWORD *)(a3 - 32);
      *(void *)(v8 - 16) = *(void *)(a3 - 16);
      *(_OWORD *)(v8 - 32) = v9;
      *(void *)(a3 - 24) = 0LL;
      *(void *)(a3 - 16) = 0LL;
      *(void *)(a3 - 32) = 0LL;
      *(_DWORD *)(v8 - 8) = *(_DWORD *)(a3 - 8);
      *(_DWORD *)(v8 - 4) = *(_DWORD *)(a3 - 4);
      v8 -= 32LL;
      v7 -= 32LL;
      a3 -= 32LL;
    }

    while (a3 != a5);
    *((void *)&v15 + 1) = v8;
    uint64_t v10 = v15;
  }

  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>>>::~__exception_guard_exceptions[abi:ne180100]( uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>>::operator()[abi:ne180100]( uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8LL);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8LL);
  while (v1 != v2)
  {
    v1 += 32LL;
  }

uint64_t std::__split_buffer<std::tuple<std::string,unsigned int,unsigned int>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::tuple<std::string,unsigned int,unsigned int>>::__destruct_at_end[abi:ne180100]( uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 4;
      *(void *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }

      uint64_t v2 = v5;
    }

    while (v5 != a2);
  }

void OUTLINED_FUNCTION_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

const char *MTLAssetUpgraderD::archiveTypeToString(unsigned int a1)
{
  if (a1 > 4) {
    return "Unknown";
  }
  else {
    return off_10001C628[a1];
  }
}

const char *MTLAssetUpgraderD::dynamicLibraryTypeToString(unsigned int a1)
{
  if (a1 > 4) {
    return "Unknown";
  }
  else {
    return off_10001C650[a1];
  }
}

void MTLAssetUpgraderD::listPrioritizedAppLaunches(uint64_t a1@<X8>)
{
  context = objc_autoreleasePoolPush();
  uint64_t v3 = BiomeLibrary();
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 App]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 InFocus]);
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v6 publisher]);

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = ___ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv_block_invoke_2;
  v38[3] = &unk_10001C560;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
  unsigned int v39 = v7;
  id v8 = [v29 sinkWithCompletion:&__block_literal_global receiveInput:v38];
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSCountedSet allObjects](v7, "allObjects"));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = ___ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv_block_invoke_3;
  v36[3] = &unk_10001C588;
  unsigned int v27 = v7;
  char v37 = v27;
  uint64_t v10 = (std::string *)objc_claimAutoreleasedReturnValue([v9 sortedArrayUsingComparator:v36]);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf.__first_) = 138412290;
    *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__first_ + 4) = v10;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "sorted: %@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  unint64_t v11 = v10;
  id v12 = unk_100020818(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16LL);
  if (v12)
  {
    uint64_t v13 = *(void *)v33;
    do
    {
      for (uint64_t i = 0LL; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v11);
        }
        std::string::basic_string[abi:ne180100]<0>( __p, (char *)[*(id *)(*((void *)&v32 + 1) + 8 * (void)i) UTF8String]);
        unint64_t v16 = *(void *)(a1 + 8);
        unint64_t v15 = *(void *)(a1 + 16);
        if (v16 >= v15)
        {
          unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16 - *(void *)a1) >> 3);
          unint64_t v19 = v18 + 1;
          if (v18 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v15 - *(void *)a1) >> 3);
          if (2 * v20 > v19) {
            unint64_t v19 = 2 * v20;
          }
          if (v20 >= 0x555555555555555LL) {
            unint64_t v21 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v21 = v19;
          }
          buf.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 16);
          if (v21) {
            uint64_t v22 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(a1 + 16, v21);
          }
          else {
            uint64_t v22 = 0LL;
          }
          __int128 v23 = v22 + v18;
          buf.__first_ = v22;
          buf.__begin_ = v23;
          buf.__end_cap_.__value_ = &v22[v21];
          __int128 v24 = *(_OWORD *)__p;
          v23->__r_.__value_.__l.__cap_ = v31;
          *(_OWORD *)&v23->__r_.__value_.__l.__data_ = v24;
          __p[1] = 0LL;
          std::string::size_type v31 = 0LL;
          __p[0] = 0LL;
          buf.__end_ = v23 + 1;
          std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &buf);
          uint64_t v25 = *(void *)(a1 + 8);
          std::__split_buffer<std::string>::~__split_buffer(&buf);
          int v26 = SHIBYTE(v31);
          *(void *)(a1 + 8) = v25;
          if (v26 < 0) {
            operator delete(__p[0]);
          }
        }

        else
        {
          __int128 v17 = *(_OWORD *)__p;
          *(void *)(v16 + 16) = v31;
          *(_OWORD *)unint64_t v16 = v17;
          *(void *)(a1 + 8) = v16 + 24;
        }
      }

      id v12 = unk_100020820(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16LL);
    }

    while (v12);
  }

  objc_autoreleasePoolPop(context);
}

void sub_100004144( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, void *a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, void *a37)
{
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

void ___ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv_block_invoke(id a1, BPSCompletion *a2)
{
  uint64_t v2 = a2;
  if (-[BPSCompletion state](v2, "state") && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[BPSCompletion error](v2, "error"));
    id v4 = objc_claimAutoreleasedReturnValue([v3 description]);
    ___ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv_block_invoke_cold_1( (uint64_t)[v4 UTF8String],  (uint64_t)&v5,  v4,  v3);
  }
}

void sub_1000042C8(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void ___ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v10 = v3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 eventBody]);
    if (![v4 starting])
    {
LABEL_5:

      id v3 = v10;
      goto LABEL_6;
    }

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v10 eventBody]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bundleID]);
    unsigned __int8 v7 = [v6 hasPrefix:@"com.apple."];

    id v3 = v10;
    if ((v7 & 1) == 0)
    {
      id v8 = *(void **)(a1 + 32);
      id v4 = (void *)objc_claimAutoreleasedReturnValue([v10 eventBody]);
      __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleID]);
      [v8 addObject:v9];

      goto LABEL_5;
    }
  }

LABEL_6:
}

void sub_1000043CC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv_block_invoke_3( uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) countForObject:v5];
  if (v7 >= [*(id *)(a1 + 32) countForObject:v6])
  {
    id v9 = [*(id *)(a1 + 32) countForObject:v5];
    if (v9 <= [*(id *)(a1 + 32) countForObject:v6]) {
      uint64_t v8 = 0LL;
    }
    else {
      uint64_t v8 = -1LL;
    }
  }

  else
  {
    uint64_t v8 = 1LL;
  }

  return v8;
}

void sub_1000044A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MTLAssetUpgraderD::getArchiveType(uint64_t a1, uint64_t *a2, void *a3)
{
  id v4 = a3;
  else {
    id v5 = (uint64_t *)*a2;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v6));
  id v11 = 0LL;
  id v8 = +[_MTLBinaryArchive archiveTypeAtURL:device:error:]( &OBJC_CLASS____MTLBinaryArchive,  "archiveTypeAtURL:device:error:",  v7,  v4,  &v11);
  id v9 = v11;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    MTLAssetUpgraderD::getArchiveType();
    if (!v9) {
      goto LABEL_8;
    }
  }

  else if (!v9)
  {
    goto LABEL_8;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    MTLAssetUpgraderD::getArchiveType();
  }
LABEL_8:

  return v8;
}

void sub_1000045D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MTLAssetUpgraderD::getDynamicLibraryType(uint64_t a1, uint64_t *a2, void *a3)
{
  id v4 = a3;
  else {
    id v5 = (uint64_t *)*a2;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v6));
  id v11 = 0LL;
  id v8 = +[_MTLDynamicLibrary dynamicLibraryTypeAtURL:device:error:]( &OBJC_CLASS____MTLDynamicLibrary,  "dynamicLibraryTypeAtURL:device:error:",  v7,  v4,  &v11);
  id v9 = v11;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    MTLAssetUpgraderD::getDynamicLibraryType();
    if (!v9) {
      goto LABEL_8;
    }
  }

  else if (!v9)
  {
    goto LABEL_8;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    MTLAssetUpgraderD::getArchiveType();
  }
LABEL_8:

  return v8;
}

void sub_10000471C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MTLAssetUpgraderD::addRecompilationWork( MTLAssetUpgraderD *a1, unsigned int *a2, uint64_t a3, std::string *a4, int a5, int a6, int a7)
{
  if (a7 | a6)
  {
    id Device = MTLAssetUpgraderD::findDevice(a1, a6, a7);
    id obj = (id)objc_claimAutoreleasedReturnValue(Device);
    id v67 = obj;
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v67, 1LL));
  }

  else
  {
    id obj = MTLCreateSystemDefaultDevice();
    id v68 = obj;
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v68, 1LL));
  }

  id v12 = (void *)v11;

  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id obja = v12;
  id v13 = [obja countByEnumeratingWithState:&v55 objects:v66 count:16];
  id v15 = v13;
  if (!v13)
  {
    LOBYTE(v51) = 0;
    goto LABEL_67;
  }

  int v51 = 0;
  uint64_t v50 = *(void *)v56;
  *(void *)&__int128 v14 = 136315650LL;
  __int128 v44 = v14;
  do
  {
    unint64_t v16 = 0LL;
    do
    {
      if (*(void *)v56 != v50) {
        objc_enumerationMutation(obja);
      }
      __int128 v17 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)v16);
      id ArchiveType = MTLAssetUpgraderD::getArchiveType((uint64_t)v13, (uint64_t *)a4, v17);
      int v19 = (int)ArchiveType;
      unsigned int DynamicLibraryType = MTLAssetUpgraderD::getDynamicLibraryType( (uint64_t)ArchiveType,  (uint64_t *)a4,  v17);
      if (a5 == 1 && v19 == 1)
      {
        id CacheDirectory = MTLAssetUpgraderD::getCacheDirectory(3, (uint64_t *)a3);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(CacheDirectory);
        if (v22 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          int v46 = *(char *)(a3 + 23);
          uint64_t v45 = *(void *)a3;
          id v40 = [v22 fileSystemRepresentation];
          uint64_t v41 = v45;
          if (v46 >= 0) {
            uint64_t v41 = a3;
          }
          if ((a4->__r_.__value_.__s.__size_ & 0x80u) == 0) {
            uint64_t v42 = (uint64_t)a4;
          }
          else {
            uint64_t v42 = a4->__r_.__value_.__r.__words[0];
          }
          *(_DWORD *)std::string __p = v44;
          *(void *)&__p[4] = v41;
          *(_WORD *)&__p[12] = 2080;
          *(void *)&__p[14] = v40;
          __int16 v60 = 2080;
          uint64_t v61 = v42;
          _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "addRecompilationWork: pruning (app = %s cache=%s archive=%s)",  __p,  0x20u);
        }
      }

      BOOL v25 = v19 == 3 || DynamicLibraryType == 1 || DynamicLibraryType == 3;
      int v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "targetDeviceArchitecture", v44));
      if (a5) {
        BOOL v27 = 0;
      }
      else {
        BOOL v27 = v25;
      }
      if (!v27) {
        goto LABEL_46;
      }
      id v28 = MTLAssetUpgraderD::getCacheDirectory(0, (uint64_t *)a3);
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      int v30 = (void *)objc_claimAutoreleasedReturnValue([v29 URLByAppendingPathComponent:@"archiveMapping.db"]);

      id v31 = v30;
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v31 fileSystemRepresentation]);
      MTLArchiveMapDB::MTLArchiveMapDB((void **)v54, (uint64_t *)__p);
      if (SHIBYTE(v60) < 0) {
        operator delete(*(void **)__p);
      }
      MTLArchiveMapDB::read(v54, a4, (int)[v26 cpuType], (int)objc_msgSend(v26, "subType"), __p);
      BOOL v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v32)
      {
        unsigned int v39 = __p;
        if (v60 < 0) {
          unsigned int v39 = *(_BYTE **)__p;
        }
        *(_DWORD *)std::__split_buffer<std::string> buf = 138412546;
        id v63 = v31;
        __int16 v64 = 2080;
        uint64_t v65 = v39;
        _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "addRecompilationWork: remap(%@) -> '%s'",  buf,  0x16u);
      }

      if (SHIBYTE(v60) < 0)
      {
        if (*(void *)&__p[8])
        {
LABEL_34:
          id v33 = MTLAssetUpgraderD::getArchiveType(v32, (uint64_t *)__p, v17);
          int v34 = (int)v33;
          unsigned int v35 = MTLAssetUpgraderD::getDynamicLibraryType((uint64_t)v33, (uint64_t *)a4, v17);
          LOBYTE(v25) = v34 == 3 || v35 == 1 || v35 == 3;
          if (SHIBYTE(v60) < 0) {
            operator delete(*(void **)__p);
          }
          MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v54);

LABEL_46:
          if (!v25) {
            goto LABEL_53;
          }
          goto LABEL_50;
        }

        operator delete(*(void **)__p);
      }

      else if (HIBYTE(v60))
      {
        goto LABEL_34;
      }

      MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v54);

LABEL_50:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        MTLAssetUpgraderD::addRecompilationWork(&v52, v53, v38);
      }
      RecompilationWork::RecompilationWork( (uint64_t)__p,  (__int128 *)a3,  (__int128 *)a4,  a5,  (int)[v26 cpuType],  (int)objc_msgSend(v26, "subType"));
      RecompilationWork::serialize((RecompilationWork *)__p);
      v51 |= MTLWorkQueue<RecompilationWork>::push(a2, (uint64_t)__p);
      RecompilationWork::~RecompilationWork((RecompilationWork *)__p);
LABEL_53:

      unint64_t v16 = (char *)v16 + 1;
    }

    while (v15 != v16);
    id v13 = [obja countByEnumeratingWithState:&v55 objects:v66 count:16];
    id v15 = v13;
  }

  while (v13);
LABEL_67:

  return v51 & 1;
}

void sub_100004C28( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, void *__p, uint64_t a34, int a35, __int16 a36, char a37, char a38)
{
}

id MTLAssetUpgraderD::findDevice(MTLAssetUpgraderD *this, int a2, int a3)
{
  id v5 = MTLCreateSystemDefaultDevice();
  id v20 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));

  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "targetDeviceArchitecture", (void)v15));
        if ([v12 cpuType] == a2 && objc_msgSend(v12, "subType") == a3)
        {
          id v13 = v11;

          goto LABEL_12;
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v13 = 0LL;
LABEL_12:

  return v13;
}

void sub_100004E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MTLAssetUpgraderD::getCacheDirectory(int a1, uint64_t *a2)
{
  id v4 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  else {
    id v5 = (uint64_t *)*a2;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v5));
  if (a1 == 2)
  {
    id v39 = 0LL;
    id v7 = (MTLAssetUpgraderD *)objc_claimAutoreleasedReturnValue( -[NSFileManager URLForDirectory:inDomain:appropriateForURL:create:error:]( v4,  "URLForDirectory:inDomain:appropriateForURL:create:error:",  13LL,  1LL,  0LL,  1LL,  &v39));
    id v8 = v39;
    id v10 = MTLAssetUpgraderD::resolveFileURL(v7, v9);
    id v11 = (id)objc_claimAutoreleasedReturnValue(v10);
  }

  else
  {
    id v38 = 0LL;
    id v7 = (MTLAssetUpgraderD *)[[LSApplicationRecord alloc] initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v38];
    id v8 = v38;
    if (v8)
    {
      id v11 = 0LL;
    }

    else
    {
      id v36 = 0LL;
      id v37 = 0LL;
      -[MTLAssetUpgraderD getDataContainerURL:error:](v7, "getDataContainerURL:error:", &v37, &v36);
      id v12 = (MTLAssetUpgraderD *)v37;
      id v13 = v36;
      id v8 = v13;
      if (v12)
      {
        id v15 = MTLAssetUpgraderD::resolveFileURL(v12, v14);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

        id v11 = (id)objc_claimAutoreleasedReturnValue([v16 URLByAppendingPathComponent:@"Library/Caches/"]);
      }

      else
      {
        id v35 = v13;
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSFileManager URLForDirectory:inDomain:appropriateForURL:create:error:]( v4,  "URLForDirectory:inDomain:appropriateForURL:create:error:",  13LL,  1LL,  0LL,  1LL,  &v35));
        id v17 = v35;

        id v19 = MTLAssetUpgraderD::resolveFileURL((MTLAssetUpgraderD *)v16, v18);
        id v11 = (id)objc_claimAutoreleasedReturnValue(v19);
        id v8 = v17;
      }
    }
  }

  if (v8 || !v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue([v8 userInfo]);
      MTLAssetUpgraderD::getCacheDirectory();
    }

    __int128 v23 = 0LL;
  }

  else
  {
    switch(a1)
    {
      case 0:
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:@"com.apple.metalassetupgrader"]);

        unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 URLByAppendingPathComponent:@"recompiled"]);
        uint64_t v22 = objc_claimAutoreleasedReturnValue([v21 URLByAppendingPathComponent:v6]);
        goto LABEL_21;
      case 1:
        v45[0] = @"com.apple.metalassetupgrader";
        v45[1] = @"recompiled";
        v45[2] = v6;
        unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v45, 3LL));
        __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v21));
        uint64_t v25 = objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:v24]);

        id v11 = (id)v25;
        goto LABEL_22;
      case 2:
        uint64_t v22 = objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:@"com.apple.MTLAssetUpgraderD"]);
        unint64_t v21 = v11;
LABEL_21:
        id v11 = (id)v22;
LABEL_22:

        goto LABEL_23;
      case 3:
        v44[0] = v6;
        v44[1] = @"com.apple.metal";
        __int128 v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v44, 2LL));
        int v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v29));
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:v30]);

        id v34 = 0LL;
        unsigned __int8 v32 = [v31 checkResourceIsReachableAndReturnError:&v34];
        id v8 = v34;
        if ((v32 & 1) != 0)
        {
          id v11 = v31;
LABEL_24:
          id v33 = v8;
          unsigned __int8 v26 = -[NSFileManager createDirectoryAtURL:withIntermediateDirectories:attributes:error:]( v4,  "createDirectoryAtURL:withIntermediateDirectories:attributes:error:",  v11,  1LL,  0LL,  &v33);
          id v27 = v33;

          if ((v26 & 1) != 0)
          {
            id v11 = v11;
            id v8 = v27;
            __int128 v23 = v11;
          }

          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)std::__split_buffer<std::string> buf = 138412546;
              id v41 = v11;
              __int16 v42 = 2112;
              id v43 = v27;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Failed to create cache directory '%@': %@",  buf,  0x16u);
            }

            __int128 v23 = 0LL;
            id v8 = v27;
          }
        }

        else
        {
          __int128 v23 = 0LL;
          id v11 = v31;
        }

        break;
      default:
LABEL_23:
        id v8 = 0LL;
        goto LABEL_24;
    }
  }

  return v23;
}

void sub_100005370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

std::string::size_type RecompilationWork::serialize(RecompilationWork *this)
{
  size_t v2 = *((void *)this + 3) + *((void *)this + 4) + 40LL;
  *((void *)this + 13) = v2;
  if (*((void *)this + 12))
  {
    operator delete[](*((void **)this + 12));
    size_t v2 = *((void *)this + 13);
  }

  id v3 = (char *)operator new[](v2);
  *((void *)this + 12) = v3;
  __int128 v4 = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)id v3 = *(_OWORD *)((char *)this + 8);
  *((_OWORD *)v3 + 1) = v4;
  *((void *)v3 + 4) = *((void *)this + 5);
  id v5 = v3 + 40;
  std::string::copy((const std::string *)this + 2, v3 + 40, *((void *)this + 3), 0LL);
  return std::string::copy((const std::string *)this + 3, &v5[*((void *)this + 3)], *((void *)this + 4), 0LL);
}

uint64_t MTLWorkQueue<RecompilationWork>::push(unsigned int *a1, uint64_t a2)
{
  if (!v38)
  {
    BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v6) {
      MTLWorkQueue<RecompilationWork>::push(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    goto LABEL_30;
  }

  uint64_t v37 = 0LL;
  int v4 = mdb_cursor_open(v38, a1[2], &v37);
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v5 = mdb_strerror(v4);
      MTLWorkQueue<RecompilationWork>::push((uint64_t)v5, (uint64_t)&v40);
    }

LABEL_30:
    uint64_t v32 = 0LL;
    goto LABEL_31;
  }

  for (int i = mdb_cursor_get(v37, &v40, v36, 0); !i; int i = mdb_cursor_get(v37, &v40, v36, 8))
  {
    if (!MTLVersionedDB::isVersionEntry((uint64_t)a1, v40, v41))
    {
      id v15 = operator new(0x70uLL);
      *(void *)id v15 = off_10001C5D8;
      v15[3] = 0u;
      v15[4] = 0u;
      v15[5] = 0u;
      v15[6] = 0u;
      RecompilationWork::deserialize((uint64_t)v15, v36);
      if (operator==((uint64_t)v15, a2))
      {
        BOOL v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v18) {
          MTLWorkQueue<RecompilationWork>::push(v18, v19, v20, v21, v22, v23, v24, v25);
        }
        (*(void (**)(_OWORD *))(*(void *)v15 + 8LL))(v15);
        goto LABEL_30;
      }

      (*(void (**)(_OWORD *))(*(void *)v15 + 8LL))(v15);
    }
  }

  int v16 = mdb_cursor_get(v37, &v40, v36, 6);
  if (!v16) {
    int v16 = mdb_cursor_get(v37, &v40, v36, 12);
  }
  if (v16 == -30798)
  {
    uint64_t v17 = 0LL;
  }

  else
  {
    if (v16)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        id v33 = mdb_strerror(v16);
        MTLWorkQueue<RecompilationWork>::push((uint64_t)v33, (uint64_t)__p);
      }

      goto LABEL_30;
    }

    uint64_t v17 = *(void *)v41 + 1LL;
  }

  uint64_t v35 = v17;
  uint64_t v26 = v38;
  unsigned int v27 = a1[2];
  id v28 = (size_t *)operator new(0x10uLL);
  size_t *v28 = 8LL;
  v28[1] = (size_t)&v35;
  (*(void (**)(void **__return_ptr, uint64_t))(*(void *)a2 + 32LL))(__p, a2);
  int v29 = mdb_put(v26, v27, v28, (uint64_t)__p[0], 0);
  int v30 = __p[0];
  __p[0] = 0LL;
  if (v30) {
    operator delete(v30);
  }
  operator delete(v28);
  if (v29 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v31 = mdb_strerror(v29);
    MTLWorkQueue<RecompilationWork>::push((uint64_t)v31, (uint64_t)__p);
  }

  uint64_t v32 = 1LL;
LABEL_31:
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v38);
  return v32;
}
}

void sub_100005724( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, void *__p)
{
}

void MTLAssetUpgraderD::processAppEvent(MTLAssetUpgraderD *a1, uint64_t *a2, int a3)
{
  if (isValidAppName((char *)a2) && a3)
  {
    id AppBundleDirectory = MTLAssetUpgraderD::getAppBundleDirectory(a2);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(AppBundleDirectory);
    if (v21)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        MTLAssetUpgraderD::processAppEvent();
      }
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)&unk_10001870B);
      id CacheDirectory = MTLAssetUpgraderD::getCacheDirectory(2, (uint64_t *)__p);
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(CacheDirectory);
      id v20 = (id)objc_claimAutoreleasedReturnValue([v6 URLByAppendingPathComponent:@"upgraderWork.db"]);

      if (SHIBYTE(v32) < 0) {
        operator delete(__p[0]);
      }
      uint64_t v7 = v20;
      if (v20)
      {
        std::string::basic_string[abi:ne180100]<0>( __p, (char *)[v20 fileSystemRepresentation]);
        MTLVersionedDB::MTLVersionedDB((void **)v30, (uint64_t *)__p, 5u, 1, 0);
        if (SHIBYTE(v32) < 0) {
          operator delete(__p[0]);
        }
        uint64_t v19 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
        NSURLResourceKey v38 = NSURLNameKey;
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v38, 1LL));
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSFileManager enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:]( v19,  "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:",  v21,  v8,  0LL,  0LL));

        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v26 = 0u;
        __int128 v27 = 0u;
        id v10 = v9;
        id v11 = [v10 countByEnumeratingWithState:&v26 objects:v37 count:16];
        if (v11)
        {
          char v12 = 0;
          uint64_t v13 = *(void *)v27;
          do
          {
            for (int i = 0LL; i != v11; int i = (char *)i + 1)
            {
              if (*(void *)v27 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
              int v16 = objc_autoreleasePoolPush();
              id v25 = 0LL;
              [v15 getResourceValue:&v25 forKey:NSURLNameKey error:0];
              id v17 = v25;
              if ([v17 hasSuffix:@".metallib"])
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                  MTLAssetUpgraderD::processAppEvent(v35, (uint64_t)v15, &v36);
                }
                if ([v15 getFileSystemRepresentation:__p maxLength:1024])
                {
                  std::string::basic_string[abi:ne180100]<0>(&v24, (char *)__p);
                  char v18 = MTLAssetUpgraderD::addRecompilationWork(a1, v30, (uint64_t)a2, &v24, 0, 0, 0);
                  v12 |= v18;
                }
              }

              objc_autoreleasePoolPop(v16);
            }

            id v11 = [v10 countByEnumeratingWithState:&v26 objects:v37 count:16];
          }

          while (v11);

          if ((v12 & 1) != 0)
          {
            __p[0] = _NSConcreteStackBlock;
            __p[1] = (void *)3221225472LL;
            uint64_t v32 = ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke;
            id v33 = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
            id v34 = a1;
            xpc_activity_register("com.apple.MTLAssetUpgraderD.recompilationActivity", XPC_ACTIVITY_CHECK_IN, __p);
          }
        }

        else
        {
        }

        MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v30);
        uint64_t v7 = v20;
      }
    }
  }

void sub_100005B30( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20, char a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, char a32, uint64_t a33, void *__p, uint64_t a35, int a36, __int16 a37, char a38, char a39)
{
  MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)&a32);
  _Unwind_Resume(a1);
}

BOOL isValidAppName(char *a1)
{
  uint64_t v1 = a1[23];
  BOOL v2 = (v1 & 0x80u) != 0LL;
  if ((v1 & 0x80u) != 0LL) {
    uint64_t v1 = *((void *)a1 + 1);
  }
  if (v2) {
    id v3 = *(char **)a1;
  }
  else {
    id v3 = a1;
  }
  int v4 = &v3[v1];
  if (v1 >= 10)
  {
    id v5 = v3;
    do
    {
      BOOL v6 = (char *)memchr(v5, 99, v1 - 9);
      if (!v6) {
        break;
      }
      if (*(void *)v6 == 0x6C7070612E6D6F63LL && *((_WORD *)v6 + 4) == 11877) {
        return v6 == v4 || v6 != v3;
      }
      id v5 = v6 + 1;
      uint64_t v1 = v4 - (_BYTE *)v5;
    }

    while (v4 - (_BYTE *)v5 > 9);
  }

  BOOL v6 = v4;
  return v6 == v4 || v6 != v3;
}

id MTLAssetUpgraderD::getAppBundleDirectory(uint64_t *a1)
{
  id v2 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
  else {
    id v3 = (uint64_t *)*a1;
  }
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3));
  id v9 = 0LL;
  id v5 = [v2 initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v9];
  id v6 = v9;

  if (v6) {
    uint64_t v7 = 0LL;
  }
  else {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 URL]);
  }

  return v7;
}

void sub_100005D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::kickRecompilationActivity(MTLAssetUpgraderD *this)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = this;
  xpc_activity_register("com.apple.MTLAssetUpgraderD.recompilationActivity", XPC_ACTIVITY_CHECK_IN, handler);
}

void MTLAssetUpgraderD::setupAppHandler(dispatch_queue_s **this)
{
  uint64_t v1 = *this;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = this;
  xpc_set_event_stream_handler("com.apple.distnoted.matching", v1, handler);
}

void ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(MTLAssetUpgraderD **)(a1 + 32);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v5 = xpc_copy_description(v3);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_5();
    }
    free(v5);
  }

  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  uint64_t v7 = string;
  if (string)
  {
    int v8 = strcmp(string, "Application Installed");
    if (!v8 || !strcmp(v7, "Application Uninstalled"))
    {
      xpc_object_t value = xpc_dictionary_get_value(v3, "UserInfo");
      id v10 = (void *)objc_claimAutoreleasedReturnValue(value);
      id v11 = v10;
      if (v10)
      {
        if (xpc_get_type(v10) == (xpc_type_t)&_xpc_type_dictionary)
        {
          BOOL v29 = xpc_dictionary_get_BOOL(v11, "isPlaceholder");
          xpc_object_t array = xpc_dictionary_get_array(v11, "bundleIDs");
          id v31 = (void *)objc_claimAutoreleasedReturnValue(array);
          if (!v29)
          {
            for (size_t i = 0LL; i < xpc_array_get_count(v31); ++i)
            {
              id v33 = objc_autoreleasePoolPush();
              id v34 = (char *)xpc_array_get_string(v31, i);
              std::string::basic_string[abi:ne180100]<0>(__p, v34);
              MTLAssetUpgraderD::processAppEvent(v4, (uint64_t *)__p, v8 == 0);
              if (v36 < 0) {
                operator delete(__p[0]);
              }
              objc_autoreleasePoolPop(v33);
            }
          }
        }

        else
        {
          BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v12) {
            ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_3(v12, v13, v14, v15, v16, v17, v18, v19);
          }
        }
      }

      else
      {
        BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v21) {
          ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_2(v21, v22, v23, v24, v25, v26, v27, v28);
        }
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_4();
    }
  }

  else
  {
    id v20 = xpc_copy_description(v3);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_1();
    }
    free(v20);
  }
}

void sub_100006080( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::generateArchiveName(const char *a1@<X0>, void *a2@<X8>)
{
  uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  if (a1[23] >= 0) {
    int v4 = a1;
  }
  else {
    int v4 = *(const char **)a1;
  }
  mkdir(v4, 0x1EDu);
  do
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

    int v7 = a1[23];
    int v8 = *(uint64_t **)a1;
    id v9 = v6;
    id v10 = [v9 UTF8String];
    if (v7 >= 0) {
      id v11 = (uint64_t *)a1;
    }
    else {
      id v11 = v8;
    }
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s/%s.metallib",  v11,  v10));
    if (-[NSFileManager fileExistsAtPath:](v14, "fileExistsAtPath:", v12))
    {

      BOOL v12 = 0LL;
    }
  }

  while (!v12);
  id v13 = v12;
  std::string::basic_string[abi:ne180100]<0>(a2, (char *)[v13 UTF8String]);
}

void sub_100006204( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

id MTLAssetUpgraderD::resolveFileURL(MTLAssetUpgraderD *this, NSURL *a2)
{
  id v2 = this;
  id v3 = v2;
  if (v2
    && (-[MTLAssetUpgraderD isFileURL](v2, "isFileURL") & 1) != 0
    && (int v4 = realpath_DARWIN_EXTSN( (const char *)-[MTLAssetUpgraderD fileSystemRepresentation]( v3, "fileSystemRepresentation"), 0LL)) != 0LL)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v4));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));

    free(v4);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

void sub_1000062E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::processPrune(MTLAssetUpgraderD *this)
{
  uint64_t v1 = v12;
  id v2 = v13;
  if (v12 != v13)
  {
    while (1)
    {
      if (*((char *)v1 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v11, *(const std::string::value_type **)v1, *((void *)v1 + 1));
      }

      else
      {
        __int128 v3 = *v1;
        v11.__r_.__value_.__l.__cap_ = *((void *)v1 + 2);
        *(_OWORD *)&v11.__r_.__value_.__l.__data_ = v3;
      }

      id CacheDirectory = MTLAssetUpgraderD::getCacheDirectory(3, (uint64_t *)&v11);
      id v5 = (void *)objc_claimAutoreleasedReturnValue(CacheDirectory);
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"archiveUsage.db"]);

      if (!v6) {
        break;
      }
      id v7 = v6;
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v7 fileSystemRepresentation]);
      MTLArchiveUsageDB::MTLArchiveUsageDB(v10, (uint64_t *)__p);
      if (v9 < 0) {
        operator delete(__p[0]);
      }
      MTLArchiveUsageDB::prune((MTLArchiveUsageDB *)v10, 2419200LL);
      MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v10);

      uint64_t v1 = (__int128 *)((char *)v1 + 24);
      if (v1 == v2) {
        goto LABEL_14;
      }
    }
  }

LABEL_14:
  v11.__r_.__value_.__r.__words[0] = (std::string::size_type)&v12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v11);
}

void sub_10000643C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, char *__p, uint64_t a19, int a20, __int16 a21, char a22, char a23, char a24)
{
  std::string __p = &a24;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

uint64_t MTLAssetUpgraderD::getRecompilationType(void *a1, void *a2, uint64_t *a3)
{
  id v5 = a1;
  id v6 = a2;
  else {
    id v7 = (uint64_t *)*a3;
  }
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
  char v9 = (MTLAssetUpgraderD *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v8));
  id v11 = MTLAssetUpgraderD::resolveFileURL(v9, v10);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v12)
  {
    if (v6)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v24 = 0LL;
      unsigned __int8 v14 = [v13 getRelationship:&v25 ofDirectoryAtURL:v6 toItemAtURL:v12 error:&v24];
      id v15 = v24;

      if (v25) {
        unsigned __int8 v16 = 0;
      }
      else {
        unsigned __int8 v16 = v14;
      }
      if ((v16 & 1) != 0)
      {
        uint64_t v17 = 1LL;
LABEL_21:

        goto LABEL_22;
      }

      uint64_t v18 = v15;
      if (!v5) {
        goto LABEL_19;
      }
    }

    else
    {
      uint64_t v18 = 0LL;
      if (!v5)
      {
LABEL_19:
        id v15 = v18;
        goto LABEL_20;
      }
    }

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v23 = v18;
    unsigned __int8 v20 = [v19 getRelationship:&v25 ofDirectoryAtURL:v5 toItemAtURL:v12 error:&v23];
    id v15 = v23;

    if (v25) {
      unsigned __int8 v21 = 0;
    }
    else {
      unsigned __int8 v21 = v20;
    }
    if ((v21 & 1) != 0)
    {
      uint64_t v17 = 0LL;
      goto LABEL_21;
    }

LABEL_20:
    uint64_t v17 = 2LL;
    goto LABEL_21;
  }

  uint64_t v17 = 2LL;
LABEL_22:

  return v17;
}

    id v7 = 0xFFFFFFFFLL;
    goto LABEL_21;
  }

  id v7 = v18;
LABEL_21:
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v12);
  operator delete(v3);
  return v7;
}

      id v7 = *v11;
      if (!*v11) {
        break;
      }
      id v10 = (char *)*v12;
      *id v11 = 0;
    }

    *id v6 = 0;
    --*(_DWORD *)(a1 + 192);
    pthread_cond_signal((pthread_cond_t *)(a1 + 80));
  }

  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  return 0LL;
}

void sub_100006638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MTLAssetUpgraderD::getRecompilationType(uint64_t *a1, uint64_t *a2)
{
  id AppBundleDirectory = MTLAssetUpgraderD::getAppBundleDirectory(a1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(AppBundleDirectory);
  id CacheDirectory = MTLAssetUpgraderD::getCacheDirectory(3, a1);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(CacheDirectory);
  uint64_t RecompilationType = MTLAssetUpgraderD::getRecompilationType(v5, v7, a2);

  return RecompilationType;
}

void sub_100006700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::processOSUpdate(MTLAssetUpgraderD *this)
{
  id CacheDirectory = MTLAssetUpgraderD::getCacheDirectory(2, (uint64_t *)&buf);
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(CacheDirectory);
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v26 URLByAppendingPathComponent:@"upgraderWork.db"]);
  if (v2)
  {
    id v25 = v2;
    std::string::basic_string[abi:ne180100]<0>( &buf, (char *)[v2 fileSystemRepresentation]);
    MTLVersionedDB::MTLVersionedDB((void **)v38, (uint64_t *)&buf, 5u, 1, 0);
    MTLAssetUpgraderD::listPrioritizedAppLaunches((uint64_t)&v36);
    __int128 v3 = v36;
    uint64_t v28 = v37;
    if (v36 != v37)
    {
      int v30 = 0;
      do
      {
        if (*((char *)v3 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v35, *(const std::string::value_type **)v3, *((void *)v3 + 1));
        }

        else
        {
          __int128 v4 = *v3;
          v35.__r_.__value_.__l.__cap_ = *((void *)v3 + 2);
          *(_OWORD *)&v35.__r_.__value_.__l.__data_ = v4;
        }

        id v5 = objc_autoreleasePoolPush();
        id AppBundleDirectory = MTLAssetUpgraderD::getAppBundleDirectory((uint64_t *)&v35);
        id v7 = (void *)objc_claimAutoreleasedReturnValue(AppBundleDirectory);
        id v8 = MTLAssetUpgraderD::getCacheDirectory(3, (uint64_t *)&v35);
        char v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:@"archiveUsage.db"]);
        id v11 = v10;
        if (v7 && v10)
        {
          id v34 = 0LL;
          unsigned __int8 v12 = [v10 checkResourceIsReachableAndReturnError:&v34];
          id v13 = v34;
          if ((v12 & 1) != 0)
          {
            id v27 = v13;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              unsigned __int8 v14 = &v35;
              if ((v35.__r_.__value_.__s.__size_ & 0x80u) != 0) {
                unsigned __int8 v14 = (std::string *)v35.__r_.__value_.__r.__words[0];
              }
              LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
              *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v14;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "processOSUpdate: updating bundleID %s",  (uint8_t *)&buf,  0xCu);
            }

            std::string::basic_string[abi:ne180100]<0>( &buf, (char *)[v11 fileSystemRepresentation]);
            MTLArchiveUsageDB::MTLArchiveUsageDB(v33, (uint64_t *)&buf);
            MTLArchiveUsageDB::getPrioritizedList((MTLArchiveUsageDB *)v33, v32);
            id v15 = (__int128 *)v32[0];
            uint64_t v16 = v32[1];
            while (v15 != (__int128 *)v16)
            {
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,std::string,unsigned int,unsigned int>::__tuple_impl( &buf,  v15);
              if ((char)buf.__r_.__value_.__s.__size_ < 0) {
                std::string::__init_copy_ctor_external( &v31,  buf.__r_.__value_.__l.__data_,  buf.__r_.__value_.__l.__size_);
              }
              else {
                std::string v31 = buf;
              }
              uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager", v25));
              if ((v31.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                uint64_t v18 = &v31;
              }
              else {
                uint64_t v18 = (std::string *)v31.__r_.__value_.__r.__words[0];
              }
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v18));
              unsigned __int8 v20 = [v17 fileExistsAtPath:v19];

              if ((v20 & 1) != 0)
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  unsigned __int8 v21 = &v31;
                  if ((v31.__r_.__value_.__s.__size_ & 0x80u) != 0) {
                    unsigned __int8 v21 = (std::string *)v31.__r_.__value_.__r.__words[0];
                  }
                  *(_DWORD *)id v39 = 136315138;
                  uint64_t v40 = v21;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "processOSUpdate: updating archive %s",  v39,  0xCu);
                }

                int RecompilationType = MTLAssetUpgraderD::getRecompilationType(v7, v9, (uint64_t *)&v31);
                if (RecompilationType == 2)
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                  {
                    id v23 = &v35;
                    if ((v35.__r_.__value_.__s.__size_ & 0x80u) != 0) {
                      id v23 = (std::string *)v35.__r_.__value_.__r.__words[0];
                    }
                    id v24 = &v31;
                    if ((v31.__r_.__value_.__s.__size_ & 0x80u) != 0) {
                      id v24 = (std::string *)v31.__r_.__value_.__r.__words[0];
                    }
                    *(_DWORD *)id v39 = 136315394;
                    uint64_t v40 = v23;
                    __int16 v41 = 2080;
                    __int16 v42 = v24;
                    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "processOSUpdate: Invalid recompilation bundleID=%s archive=%s",  v39,  0x16u);
                  }
                }

                else
                {
                  v30 |= MTLAssetUpgraderD::addRecompilationWork( this,  v38,  (uint64_t)&v35,  &v31,  RecompilationType,  (int)v44,  SHIDWORD(v44));
                }
              }

              v15 += 2;
            }

            buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v32;
            std::vector<std::tuple<std::string,unsigned int,unsigned int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
            MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v33);
            id v13 = v27;
          }
        }

        objc_autoreleasePoolPop(v5);
        __int128 v3 = (__int128 *)((char *)v3 + 24);
      }

      while (v3 != v28);
      if ((v30 & 1) != 0)
      {
        buf.__r_.__value_.__r.__words[0] = (std::string::size_type)_NSConcreteStackBlock;
        buf.__r_.__value_.__l.__size_ = 3221225472LL;
        buf.__r_.__value_.__l.__cap_ = (std::string::size_type)___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke;
        __int128 v44 = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
        uint64_t v45 = this;
        xpc_activity_register("com.apple.MTLAssetUpgraderD.recompilationActivity", XPC_ACTIVITY_CHECK_IN, &buf);
      }
    }

    buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v36;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
    MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v38);
    id v2 = v25;
  }
}

void sub_100006C40( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, void *a21, uint64_t a22, int a23, __int16 a24, char a25, char a26, uint64_t a27, char a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, char *__p, uint64_t a35, int a36, __int16 a37, char a38, char a39, char a40)
{
  std::string __p = &a40;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)(v40 - 192));

  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::setupXPCActivityHandler(MTLAssetUpgraderD *this)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = this;
  xpc_activity_register("com.apple.MTLAssetUpgraderD.os-update", XPC_ACTIVITY_CHECK_IN, handler);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke_72;
  v2[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v2[4] = this;
  xpc_activity_register("com.apple.MTLAssetUpgraderD.prune", XPC_ACTIVITY_CHECK_IN, v2);
}

void ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke(uint64_t a1, void *a2)
{
  __int128 v3 = a2;
  __int128 v4 = *(MTLAssetUpgraderD **)(a1 + 32);
  id v5 = objc_autoreleasePoolPush();
  BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v6) {
    ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke_cold_1(v6, v7, v8);
  }
  if (xpc_activity_get_state(v3)) {
    MTLAssetUpgraderD::processOSUpdate(v4);
  }
  objc_autoreleasePoolPop(v5);
}

void sub_100006EC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke_72(uint64_t a1, void *a2)
{
  id v2 = a2;
  __int128 v3 = objc_autoreleasePoolPush();
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v4) {
    ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke_72_cold_1(v4, v5, v6);
  }
  state = (MTLAssetUpgraderD *)xpc_activity_get_state(v2);
  if (state) {
    MTLAssetUpgraderD::processPrune(state);
  }
  objc_autoreleasePoolPop(v3);
}

void sub_100006F38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::popCurrentWorkItem(MTLAssetUpgraderD *this)
{
  id CacheDirectory = MTLAssetUpgraderD::getCacheDirectory(2, (uint64_t *)__p);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(CacheDirectory);
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@"upgraderWork.db"]);

  if (v6 < 0)
  {
    operator delete(__p[0]);
    if (!v3) {
      goto LABEL_8;
    }
  }

  else if (!v3)
  {
    goto LABEL_8;
  }

  std::string::basic_string[abi:ne180100]<0>( __p, (char *)[v3 fileSystemRepresentation]);
  MTLVersionedDB::MTLVersionedDB((void **)v4, (uint64_t *)__p, 5u, 1, 0);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  MTLWorkQueue<RecompilationWork>::pop(v4);
  MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v4);
LABEL_8:
}

void sub_100007018( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  _Unwind_Resume(a1);
}

void MTLWorkQueue<RecompilationWork>::pop(unsigned int *a1)
{
  if (!v10) {
    goto LABEL_15;
  }
  uint64_t v9 = 0LL;
  int v2 = mdb_cursor_open(v10, a1[2], &v9);
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      __int128 v3 = mdb_strerror(v2);
      MTLWorkQueue<RecompilationWork>::push((uint64_t)v3, (uint64_t)v12);
    }

    goto LABEL_15;
  }

  int v4 = mdb_cursor_get(v9, v12, v8, 0);
  if (!v4)
  {
    if (!MTLVersionedDB::isVersionEntry((uint64_t)a1, v12[0], (char *)v12[1]))
    {
LABEL_10:
      int v5 = mdb_cursor_del(v9, 0);
      if (v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        char v6 = mdb_strerror(v5);
        MTLWorkQueue<RecompilationWork>::pop((uint64_t)v6, (uint64_t)v11);
      }

      goto LABEL_15;
    }

    int v4 = mdb_cursor_get(v9, v12, v8, 8);
  }

  if (v4 == -30798) {
    goto LABEL_15;
  }
  if (!v4) {
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = mdb_strerror(v4);
    MTLWorkQueue<RecompilationWork>::push((uint64_t)v7, (uint64_t)v11);
  }

LABEL_15:
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v10);
}

    *(_DWORD *)(v3 + 124) |= 2u;
    return result;
  }

  uint64_t result = 0LL;
  if ((v4 & 0x40) == 0 && *(void *)v3)
  {
    unsigned __int8 v14 = *(unsigned int **)(v3 + 72);
    uint64_t v8 = *(void **)v2;
    if (*(void *)v14)
    {
      id v15 = mdb_mid2l_search(*(unsigned int **)(v3 + 72), *(void *)v2);
      if (*(void *)v14 >= (unint64_t)v15 && *(void **)&v14[4 * v15] == v8)
      {
        if (v2 != *(void *)&v14[4 * v15 + 2])
        {
          *(_DWORD *)(a1 + 68) &= 0xFFFFFFFC;
          *(_DWORD *)(v3 + 124) |= 2u;
          return 4294936517LL;
        }

        return 0LL;
      }
    }

    uint64_t v16 = mdb_page_malloc(v3, 1u);
    if (v16)
    {
      uint64_t v7 = v16;
      __dst[0] = v8;
      __dst[1] = v16;
      mdb_mid2l_insert(v14, (unint64_t *)__dst);
LABEL_18:
      mdb_page_copy(v7, (_WORD *)v2, *(_DWORD *)(*(void *)(v3 + 32) + 16LL));
      *(void *)uint64_t v7 = v8;
      *((_WORD *)v7 + 5) |= 0x10u;
      goto LABEL_20;
    }

    return 12LL;
  }

  return result;
}

void sub_1000071D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void MTLAssetUpgraderD::remapTemporary(uint64_t a1, uint64_t a2)
{
  int v4 = *(std::string **)(a1 + 8);
  else {
    std::string v33 = v4[2];
  }
  id CacheDirectory = MTLAssetUpgraderD::getCacheDirectory(1, (uint64_t *)&v33);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(CacheDirectory);
  uint64_t v7 = (void *)v6;
  if ((char)v33.__r_.__value_.__s.__size_ < 0)
  {
    operator delete(v33.__r_.__value_.__l.__data_);
    if (!v7) {
      goto LABEL_70;
    }
  }

  else if (!v6)
  {
    goto LABEL_70;
  }

  std::string::basic_string[abi:ne180100]<0>( &v33, (char *)[v7 fileSystemRepresentation]);
  MTLAssetUpgraderD::generateArchiveName((const char *)&v33, &__p);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    p_p = &__p;
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    LODWORD(v33.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)v33.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_p;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "recompilation: rename bundle temporary to %s",  (uint8_t *)&v33,  0xCu);
  }

  else {
    uint64_t v9 = *(const char **)a2;
  }
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t v10 = &__p;
  }
  else {
    uint64_t v10 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if (renamex_np(v9, (const char *)v10, 0x10u))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        id v11 = &__p;
      }
      else {
        id v11 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      unsigned __int8 v12 = __error();
      id v13 = strerror(*v12);
      MTLAssetUpgraderD::remapTemporary((uint64_t)v13, (uint64_t)&v33, (uint64_t)v11, a2);
    }

    id v14 = 0LL;
    goto LABEL_67;
  }

  id v15 = *(std::string **)(a1 + 8);
  else {
    std::string v33 = v15[2];
  }
  id v16 = MTLAssetUpgraderD::getCacheDirectory(0, (uint64_t *)&v33);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 URLByAppendingPathComponent:@"archiveMapping.db"]);

  if ((char)v33.__r_.__value_.__s.__size_ < 0)
  {
    operator delete(v33.__r_.__value_.__l.__data_);
    if (v18)
    {
LABEL_34:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        LODWORD(v33.__r_.__value_.__l.__data_) = 138412290;
        *(std::string::size_type *)((char *)v33.__r_.__value_.__r.__words + 4) = (std::string::size_type)v18;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "recompilation: storing bundle archive map %@",  (uint8_t *)&v33,  0xCu);
      }

      std::string::basic_string[abi:ne180100]<0>( &v33, (char *)[v18 fileSystemRepresentation]);
      MTLArchiveMapDB::MTLArchiveMapDB((void **)v30, (uint64_t *)&v33);
      uint64_t v19 = *(void *)(a1 + 8);
      if (*(char *)(v19 + 95) < 0)
      {
        std::string::__init_copy_ctor_external( &v32,  *(const std::string::value_type **)(v19 + 72),  *(void *)(v19 + 80));
        uint64_t v19 = *(void *)(a1 + 8);
      }

      else
      {
        std::string v32 = *(std::string *)(v19 + 72);
      }

      MTLArchiveMapDB::read(v30, &v32, *(_DWORD *)(v19 + 12), *(_DWORD *)(v19 + 16), &v33);
      uint64_t v20 = *(void *)(a1 + 8);
      if (*(char *)(v20 + 95) < 0)
      {
        std::string::__init_copy_ctor_external( &v32,  *(const std::string::value_type **)(v20 + 72),  *(void *)(v20 + 80));
        uint64_t v20 = *(void *)(a1 + 8);
      }

      else
      {
        std::string v32 = *(std::string *)(v20 + 72);
      }

      MTLArchiveMapDB::store((MTLVersionedDB *)v30, &v32, &__p, *(_DWORD *)(v20 + 12), *(_DWORD *)(v20 + 16));
      if ((char)v33.__r_.__value_.__s.__size_ < 0)
      {
        if (!v33.__r_.__value_.__l.__size_)
        {
          id v14 = 0LL;
LABEL_63:
          goto LABEL_65;
        }
      }

      else if (!v33.__r_.__value_.__s.__size_)
      {
        id v14 = 0LL;
LABEL_65:
        MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v30);
        goto LABEL_66;
      }

      unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      if ((v33.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        uint64_t v22 = &v33;
      }
      else {
        uint64_t v22 = (std::string *)v33.__r_.__value_.__r.__words[0];
      }
      id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v22));
      id v29 = 0LL;
      [v21 removeItemAtPath:v23 error:&v29];
      id v14 = v29;

      if (v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        int size = (char)v33.__r_.__value_.__s.__size_;
        std::string::size_type v25 = v33.__r_.__value_.__r.__words[0];
        std::string::size_type v26 = objc_claimAutoreleasedReturnValue([v14 userInfo]);
        id v27 = (void *)v26;
        uint64_t v28 = &v33;
        if (size < 0) {
          uint64_t v28 = (std::string *)v25;
        }
        LODWORD(v32.__r_.__value_.__l.__data_) = 136315394;
        *(std::string::size_type *)((char *)v32.__r_.__value_.__r.__words + 4) = (std::string::size_type)v28;
        WORD2(v32.__r_.__value_.__r.__words[1]) = 2112;
        *(std::string::size_type *)((char *)&v32.__r_.__value_.__r.__words[1] + 6) = v26;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "recompilation: removal of replaced binary archive '%s' failed: %@",  (uint8_t *)&v32,  0x16u);
      }

      goto LABEL_63;
    }
  }

  else if (v18)
  {
    goto LABEL_34;
  }

  id v14 = 0LL;
LABEL_66:

LABEL_67:
LABEL_70:
}

void sub_1000076D8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20, __int16 a21, char a22, char a23, uint64_t a24, void *__p, uint64_t a26, int a27, __int16 a28, char a29, char a30)
{
  if (a30 < 0) {
    operator delete(__p);
  }
  MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)&a10);

  if (a17 < 0) {
    operator delete(a12);
  }

  _Unwind_Resume(a1);
}

BOOL MTLAssetUpgraderD::recompileSingleStep(MTLAssetUpgraderD *this)
{
  id CacheDirectory = MTLAssetUpgraderD::getCacheDirectory(2, (uint64_t *)&__p.st_dev);
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue(CacheDirectory);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:@"upgraderWork.db"]);

  if (SHIBYTE(__p.st_gid) < 0)
  {
    operator delete(*(void **)&__p.st_dev);
    if (v4)
    {
LABEL_3:
      std::string::basic_string[abi:ne180100]<0>( &__p, (char *)[v4 fileSystemRepresentation]);
      MTLVersionedDB::MTLVersionedDB((void **)v145, (uint64_t *)&__p.st_dev, 5u, 1, 0);
      if (SHIBYTE(__p.st_gid) < 0) {
        operator delete(*(void **)&__p.st_dev);
      }
      MTLWorkQueue<RecompilationWork>::peek(v145, &v144);
      BOOL v5 = v144 != 0;
      if (!v144) {
        goto LABEL_48;
      }
      if (*(_DWORD *)(v144 + 40) == 1)
      {
        id v6 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          if (*(char *)(v144 + 95) < 0)
          {
            std::string::__init_copy_ctor_external( (std::string *)v147,  *(const std::string::value_type **)(v144 + 72),  *(void *)(v144 + 80));
          }

          else
          {
            *(_OWORD *)v147 = *(_OWORD *)(v144 + 72);
            *(void *)&v147[16] = *(void *)(v144 + 88);
          }

          MTLAssetUpgraderD::recompileSingleStep();
        }

LABEL_44:
LABEL_45:
        MTLWorkQueue<RecompilationWork>::pop(v145);
LABEL_46:
        uint64_t v21 = v144;
        uint64_t v144 = 0LL;
        if (v21) {
          (*(void (**)(uint64_t))(*(void *)v21 + 8LL))(v21);
        }
LABEL_48:
        MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v145);
        goto LABEL_49;
      }

      MTLWorkQueue<RecompilationWork>::setState(v145, 1);
      if (*(char *)(v144 + 71) < 0)
      {
        std::string::__init_copy_ctor_external( (std::string *)&__p,  *(const std::string::value_type **)(v144 + 48),  *(void *)(v144 + 56));
      }

      else
      {
        *(_OWORD *)&__p.st_dev = *(_OWORD *)(v144 + 48);
        *(void *)&__p.st_uid = *(void *)(v144 + 64);
      }

      BOOL valid = isValidAppName((char *)&__p);
      BOOL v8 = valid;
      if (SHIBYTE(__p.st_gid) < 0)
      {
        operator delete(*(void **)&__p.st_dev);
        if (v8)
        {
LABEL_17:
          uint64_t v9 = v144;
          if (*(char *)(v144 + 71) < 0)
          {
            std::string::__init_copy_ctor_external( (std::string *)&__p,  *(const std::string::value_type **)(v144 + 48),  *(void *)(v144 + 56));
            uint64_t v9 = v144;
          }

          else
          {
            *(_OWORD *)&__p.st_dev = *(_OWORD *)(v144 + 48);
            *(void *)&__p.st_uid = *(void *)(v144 + 64);
          }

          if (*(char *)(v9 + 95) < 0)
          {
            std::string::__init_copy_ctor_external( (std::string *)v147,  *(const std::string::value_type **)(v9 + 72),  *(void *)(v9 + 80));
          }

          else
          {
            *(_OWORD *)v147 = *(_OWORD *)(v9 + 72);
            *(void *)&v147[16] = *(void *)(v9 + 88);
          }

          int RecompilationType = (MTLAssetUpgraderD *)MTLAssetUpgraderD::getRecompilationType( (uint64_t *)&__p.st_dev,  (uint64_t *)v147);
          int v12 = (int)RecompilationType;
          int v13 = *(_DWORD *)(v144 + 8);
          if ((v147[23] & 0x80000000) != 0) {
            operator delete(*(void **)v147);
          }
          if (SHIBYTE(__p.st_gid) < 0) {
            operator delete(*(void **)&__p.st_dev);
          }
          if (v12 != v13)
          {
            id v20 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              uint64_t v44 = v144;
              if (*(char *)(v144 + 71) < 0)
              {
                std::string::__init_copy_ctor_external( (std::string *)&__p,  *(const std::string::value_type **)(v144 + 48),  *(void *)(v144 + 56));
                uint64_t v44 = v144;
              }

              else
              {
                *(_OWORD *)&__p.st_dev = *(_OWORD *)(v144 + 48);
                *(void *)&__p.st_uid = *(void *)(v144 + 64);
              }

              if ((__p.st_gid & 0x80000000) == 0) {
                p_p = &__p;
              }
              else {
                p_p = *(stat **)&__p.st_dev;
              }
              if (*(char *)(v44 + 95) < 0)
              {
                std::string::__init_copy_ctor_external( (std::string *)v147,  *(const std::string::value_type **)(v44 + 72),  *(void *)(v44 + 80));
              }

              else
              {
                *(_OWORD *)v147 = *(_OWORD *)(v44 + 72);
                *(void *)&v147[16] = *(void *)(v44 + 88);
              }

              int v46 = v147;
              if (v147[23] < 0) {
                int v46 = *(_BYTE **)v147;
              }
              LODWORD(v149.__r_.__value_.__l.__data_) = 136315394;
              *(std::string::size_type *)((char *)v149.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_p;
              WORD2(v149.__r_.__value_.__r.__words[1]) = 2080;
              *(std::string::size_type *)((char *)&v149.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v46;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "recompilation: invalid archive for recompilation bundleID=%s archivePath=%s",  (uint8_t *)&v149,  0x16u);
              if ((v147[23] & 0x80000000) != 0) {
                operator delete(*(void **)v147);
              }
              if (SHIBYTE(__p.st_gid) < 0) {
                operator delete(*(void **)&__p.st_dev);
              }
            }

            goto LABEL_44;
          }

          id Device = MTLAssetUpgraderD::findDevice(RecompilationType, *(_DWORD *)(v144 + 12), *(_DWORD *)(v144 + 16));
          uint64_t v15 = objc_claimAutoreleasedReturnValue(Device);
          id v16 = (void *)*((void *)this + 2);
          *((void *)this + 2) = v15;

          if (!*((void *)this + 2))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              int v24 = *(_DWORD *)(v144 + 12);
              int v23 = *(_DWORD *)(v144 + 16);
              __p.st_dev = 67109376;
              *(_DWORD *)&__p.st_mode = v24;
              LOWORD(__p.st_ino) = 1024;
              *(_DWORD *)((char *)&__p.st_ino + 2) = v23;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "recompilation: couldn't find device for (%08X %08X)",  (uint8_t *)&__p,  0xEu);
            }

            goto LABEL_45;
          }

          uint64_t v18 = (char *)this + 8;
          uint64_t v17 = *((void *)this + 1);
          uint64_t v19 = (std::string *)v144;
          uint64_t v144 = 0LL;
          *((void *)this + 1) = v19;
          if (v17)
          {
            (*(void (**)(uint64_t))(*(void *)v17 + 8LL))(v17);
            uint64_t v19 = *(std::string **)v18;
          }

          if ((char)v19[3].__r_.__value_.__s.__size_ < 0) {
            std::string::__init_copy_ctor_external( &v149,  v19[3].__r_.__value_.__l.__data_,  v19[3].__r_.__value_.__l.__size_);
          }
          else {
            std::string v149 = v19[3];
          }
          std::string::size_type v25 = objc_opt_new(&OBJC_CLASS___MTLBinaryArchiveDescriptor);
          if ((v149.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            std::string::size_type v26 = &v149;
          }
          else {
            std::string::size_type v26 = (std::string *)v149.__r_.__value_.__r.__words[0];
          }
          id v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v26));
          uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v27));
          -[MTLBinaryArchiveDescriptor setUrl:](v25, "setUrl:", v28);

          -[MTLBinaryArchiveDescriptor setOptions:]( v25,  "setOptions:",  (unint64_t)-[MTLBinaryArchiveDescriptor options](v25, "options") | 0x18);
          id v29 = objc_claimAutoreleasedReturnValue(-[MTLBinaryArchiveDescriptor url](v25, "url"));
          LOBYTE(v28) = stat((const char *)[v29 fileSystemRepresentation], &__p) == 0;

          if ((v28 & 1) == 0)
          {
            BOOL v30 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v30)
            {
              objc_claimAutoreleasedReturnValue(-[MTLBinaryArchiveDescriptor url](v25, "url"));
              MTLAssetUpgraderD::recompileSingleStep();
            }

            MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v30);
            id v31 = 0LL;
            goto LABEL_170;
          }

          std::string::basic_string[abi:ne180100]<0>(v147, (char *)&unk_10001870B);
          id v32 = MTLAssetUpgraderD::getCacheDirectory(2, (uint64_t *)v147);
          std::string v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
          if ((v147[23] & 0x80000000) != 0) {
            operator delete(*(void **)v147);
          }
          __int128 v127 = v33;
          id v128 = (id)objc_claimAutoreleasedReturnValue([v33 URLByAppendingPathComponent:@"temp"]);
          id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          id v143 = 0LL;
          unsigned __int8 v35 = [v34 createDirectoryAtURL:v128 withIntermediateDirectories:1 attributes:0 error:&v143];
          id v31 = v143;

          if ((v35 & 1) == 0)
          {
            BOOL v42 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v42) {
              MTLAssetUpgraderD::recompileSingleStep();
            }
            id v43 = v128;
            MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v42);
            goto LABEL_169;
          }

          std::string::basic_string[abi:ne180100]<0>( v147, (char *)[v128 fileSystemRepresentation]);
          MTLAssetUpgraderD::generateArchiveName(v147, v141);
          if ((v147[23] & 0x80000000) != 0) {
            operator delete(*(void **)v147);
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            char v36 = v141;
            if (v142 < 0) {
              char v36 = (void **)v141[0];
            }
            *(_DWORD *)v147 = 136315138;
            *(void *)&v147[4] = v36;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "recompilation: bundle temporary location %s",  v147,  0xCu);
          }

          uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTLBinaryArchiveDescriptor url](v25, "url"));
          uint64_t v38 = *((void *)this + 2);
          id v140 = v31;
          unsigned int v39 = +[_MTLBinaryArchive archiveTypeAtURL:device:error:]( &OBJC_CLASS____MTLBinaryArchive,  "archiveTypeAtURL:device:error:",  v37,  v38,  &v140);
          id v40 = v140;

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            if (v39 > 4) {
              __int16 v41 = "Unknown";
            }
            else {
              __int16 v41 = off_10001C628[v39];
            }
            int v47 = (void *)objc_claimAutoreleasedReturnValue(-[MTLBinaryArchiveDescriptor url](v25, "url"));
            *(_DWORD *)v147 = 136315394;
            *(void *)&v147[4] = v41;
            *(_WORD *)&v147[12] = 2112;
            *(void *)&v147[14] = v47;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "recompilation: %s - %@",  v147,  0x16u);
          }

          if (v39 != 3)
          {
            int v51 = (void *)objc_claimAutoreleasedReturnValue(-[MTLBinaryArchiveDescriptor url](v25, "url"));
            uint64_t v52 = *((void *)this + 2);
            id v139 = v40;
            unsigned int v53 = +[_MTLDynamicLibrary dynamicLibraryTypeAtURL:device:error:]( &OBJC_CLASS____MTLDynamicLibrary,  "dynamicLibraryTypeAtURL:device:error:",  v51,  v52,  &v139);
            id v54 = v139;

            __int128 v55 = v54;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              if (v53 > 4) {
                __int128 v56 = "Unknown";
              }
              else {
                __int128 v56 = off_10001C650[v53];
              }
              id v63 = (void *)objc_claimAutoreleasedReturnValue(-[MTLBinaryArchiveDescriptor url](v25, "url"));
              *(_DWORD *)v147 = 136315394;
              *(void *)&v147[4] = v56;
              *(_WORD *)&v147[12] = 2112;
              *(void *)&v147[14] = v63;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "recompilation: %s - %@",  v147,  0x16u);
            }

            if ((v53 & 0xFFFFFFFD) != 1)
            {
              BOOL v69 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
              if (v69)
              {
                int64_t v70 = (void *)objc_claimAutoreleasedReturnValue(-[MTLBinaryArchiveDescriptor url](v25, "url"));
                *(_DWORD *)v147 = 138412290;
                *(void *)&v147[4] = v70;
                _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "recompilation: %@ has unexpected dylib type",  v147,  0xCu);
              }

              MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v69);
              goto LABEL_166;
            }

            __int16 v64 = (void *)*((void *)this + 2);
            uint64_t v65 = (void *)objc_claimAutoreleasedReturnValue(-[MTLBinaryArchiveDescriptor url](v25, "url"));
            id v138 = 0LL;
            id v126 = [v64 newDynamicLibraryWithURL:v65 error:&v138];
            id v49 = v138;

            if (v49)
            {
              BOOL v66 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
              if (v66)
              {
                id v67 = (void *)objc_claimAutoreleasedReturnValue(-[MTLBinaryArchiveDescriptor url](v25, "url"));
                id v68 = (void *)objc_claimAutoreleasedReturnValue([v49 userInfo]);
                MTLAssetUpgraderD::recompileSingleStep(v67, v68, (uint64_t)v147);
              }

              MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v66);
              goto LABEL_165;
            }

            if (v142 >= 0) {
              int64_t v71 = v141;
            }
            else {
              int64_t v71 = (void **)v141[0];
            }
            uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v71));
            v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v72));
            id v137 = 0LL;
            [v126 serializeToURL:v73 error:&v137];
            id v49 = v137;

            if (v49)
            {
              BOOL v74 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
              if (v74)
              {
                objc_claimAutoreleasedReturnValue(-[MTLBinaryArchiveDescriptor url](v25, "url"));
                MTLAssetUpgraderD::recompileSingleStep();
              }

              MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v74);
              goto LABEL_165;
            }

            MTLAssetUpgraderD::remapTemporary((uint64_t)this, (uint64_t)v141);
            goto LABEL_164;
          }

          int v48 = (void *)*((void *)this + 2);
          id v136 = v40;
          id v126 = [v48 newBinaryArchiveWithDescriptor:v25 error:&v136];
          id v49 = v136;

          if (v49)
          {
            BOOL v50 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v50)
            {
              int size = (char)v149.__r_.__value_.__s.__size_;
              std::string::size_type v89 = v149.__r_.__value_.__r.__words[0];
              uint64_t v90 = objc_claimAutoreleasedReturnValue([v49 userInfo]);
              uint64_t v91 = (void *)v90;
              uint64_t v92 = &v149;
              if (size < 0) {
                uint64_t v92 = (std::string *)v89;
              }
              *(_DWORD *)v147 = 136315394;
              *(void *)&v147[4] = v92;
              *(_WORD *)&v147[12] = 2112;
              *(void *)&v147[14] = v90;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "recompilation: failed open of archive '%s': %@",  v147,  0x16u);
            }

            MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v50);
LABEL_165:

            __int128 v55 = v49;
            goto LABEL_166;
          }

          if (v142 >= 0) {
            __int128 v57 = v141;
          }
          else {
            __int128 v57 = (void **)v141[0];
          }
          __int128 v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v57));
          uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v58));
          id v135 = 0LL;
          unsigned __int8 v60 = [v126 recompileToArchiveWithURL:v59 error:&v135];
          id v49 = v135;

          uint64_t v61 = *(std::string **)v18;
          int v62 = *(_DWORD *)(*(void *)v18 + 8LL);
          if (!v62)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              unsigned __int32 v75 = v141;
              if (v142 < 0) {
                unsigned __int32 v75 = (void **)v141[0];
              }
              *(_DWORD *)v147 = 136315138;
              *(void *)&v147[4] = v75;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "recompilation: serialize bundle temporary %s",  v147,  0xCu);
            }

            if ((v60 & 1) == 0)
            {
              BOOL v76 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
              if (v76)
              {
                int v105 = (char)v149.__r_.__value_.__s.__size_;
                std::string::size_type v106 = v149.__r_.__value_.__r.__words[0];
                int v107 = v142;
                uint64_t v108 = (void **)v141[0];
                uint64_t v109 = objc_claimAutoreleasedReturnValue([v49 userInfo]);
                v110 = (void *)v109;
                unsigned int v111 = v141;
                if (v107 < 0) {
                  unsigned int v111 = v108;
                }
                *(_DWORD *)v147 = 136315650;
                v112 = &v149;
                if (v105 < 0) {
                  v112 = (std::string *)v106;
                }
                *(void *)&v147[4] = v112;
                *(_WORD *)&v147[12] = 2080;
                *(void *)&v147[14] = v111;
                *(_WORD *)&v147[22] = 2112;
                *(void *)&v147[24] = v109;
                _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "recompilation: recompilation failed for archive '%s' to '%s' : %@",  v147,  0x20u);
              }

              MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v76);
              goto LABEL_165;
            }

            MTLAssetUpgraderD::remapTemporary((uint64_t)this, (uint64_t)v141);
            goto LABEL_164;
          }

          if (v62 != 1)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              MTLAssetUpgraderD::recompileSingleStep((uint64_t)this + 8);
            }
            goto LABEL_164;
          }

          if ((char)v61[3].__r_.__value_.__s.__size_ < 0) {
            std::string::__init_copy_ctor_external( &v134,  v61[3].__r_.__value_.__l.__data_,  v61[3].__r_.__value_.__l.__size_);
          }
          else {
            std::string v134 = v61[3];
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            v77 = v141;
            if (v142 < 0) {
              v77 = (void **)v141[0];
            }
            *(_DWORD *)v147 = 136315138;
            *(void *)&v147[4] = v77;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "recompilation: serialize cache temporary %s",  v147,  0xCu);
          }

          if ((v60 & 1) != 0)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              unint64_t v78 = &v134;
              if ((v134.__r_.__value_.__s.__size_ & 0x80u) != 0) {
                unint64_t v78 = (std::string *)v134.__r_.__value_.__r.__words[0];
              }
              *(_DWORD *)v147 = 136315138;
              *(void *)&v147[4] = v78;
              _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "recompilation: rename cache temporary to %s",  v147,  0xCu);
            }

            if (v142 >= 0) {
              uint64_t v79 = v141;
            }
            else {
              uint64_t v79 = (void **)v141[0];
            }
            if ((v134.__r_.__value_.__s.__size_ & 0x80u) == 0) {
              uint64_t v80 = &v134;
            }
            else {
              uint64_t v80 = (std::string *)v134.__r_.__value_.__r.__words[0];
            }
            if (!renamex_np((const char *)v79, (const char *)v80, 0x10u))
            {
              v124 = objc_opt_new(&OBJC_CLASS___MTLBinaryArchiveDescriptor);
              if ((v134.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                uint64_t v93 = &v134;
              }
              else {
                uint64_t v93 = (std::string *)v134.__r_.__value_.__r.__words[0];
              }
              unsigned int v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v93));
              unsigned int v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v94));
              -[MTLBinaryArchiveDescriptor setUrl:](v124, "setUrl:", v95);

              uint64_t v96 = (void *)*((void *)this + 2);
              id v133 = v49;
              id v122 = [v96 newBinaryArchiveWithDescriptor:v124 error:&v133];
              id v123 = v133;

              if (v123)
              {
                BOOL v97 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                if (v97)
                {
                  objc_claimAutoreleasedReturnValue([v123 userInfo]);
                  MTLAssetUpgraderD::recompileSingleStep();
                }

                MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v97);
                int v86 = 1;
              }

              else
              {
                char v121 = (void *)objc_claimAutoreleasedReturnValue([v122 archiveFunctionIds]);
                unsigned int v98 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
                __int128 v131 = 0u;
                __int128 v132 = 0u;
                __int128 v129 = 0u;
                __int128 v130 = 0u;
                id obj = v121;
                id v99 = [obj countByEnumeratingWithState:&v129 objects:v146 count:16];
                if (v99)
                {
                  uint64_t v100 = *(void *)v130;
                  do
                  {
                    for (size_t i = 0LL; i != v99; size_t i = (char *)i + 1)
                    {
                      if (*(void *)v130 != v100) {
                        objc_enumerationMutation(obj);
                      }
                      v102 = (char *)objc_msgSend( *(id *)(*((void *)&v129 + 1) + 8 * (void)i),  "pointerValue",  v121);
                      __int128 v103 = *(_OWORD *)(v102 + 40);
                      *(_OWORD *)v147 = *(_OWORD *)(v102 + 24);
                      *(_OWORD *)&v147[16] = v103;
                      v104 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v147,  32LL));
                      -[NSMutableArray addObject:](v98, "addObject:", v104);
                    }

                    id v99 = [obj countByEnumeratingWithState:&v129 objects:v146 count:16];
                  }

                  while (v99);
                }

                int v86 = 2;
              }

              id v49 = v123;
LABEL_161:
              if (v86 != 2) {
                goto LABEL_165;
              }
LABEL_164:

              MTLAssetUpgraderD::popCurrentWorkItem(v87);
              __int128 v55 = v49;
LABEL_166:
              if (v142 < 0) {
                operator delete(v141[0]);
              }
              id v31 = v55;
              id v43 = v128;
LABEL_169:

LABEL_170:
              goto LABEL_46;
            }

            BOOL v81 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v81)
            {
              if ((v134.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                unsigned __int32 v82 = &v134;
              }
              else {
                unsigned __int32 v82 = (std::string *)v134.__r_.__value_.__r.__words[0];
              }
              if (v142 >= 0) {
                int64_t v83 = v141;
              }
              else {
                int64_t v83 = (void **)v141[0];
              }
              v84 = __error();
              uint64_t v85 = strerror(*v84);
              MTLAssetUpgraderD::remapTemporary((uint64_t)v85, (uint64_t)v147, (uint64_t)v82, (uint64_t)v83);
            }
          }

          else
          {
            BOOL v81 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v81)
            {
              int v113 = (char)v149.__r_.__value_.__s.__size_;
              std::string::size_type v114 = v149.__r_.__value_.__r.__words[0];
              int v115 = v142;
              int v116 = (void **)v141[0];
              uint64_t v117 = objc_claimAutoreleasedReturnValue([v49 userInfo]);
              unint64_t v118 = (void *)v117;
              v119 = v141;
              if (v115 < 0) {
                v119 = v116;
              }
              *(_DWORD *)v147 = 136315650;
              unint64_t v120 = &v149;
              if (v113 < 0) {
                unint64_t v120 = (std::string *)v114;
              }
              *(void *)&v147[4] = v120;
              *(_WORD *)&v147[12] = 2080;
              *(void *)&v147[14] = v119;
              *(_WORD *)&v147[22] = 2112;
              *(void *)&v147[24] = v117;
              _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "recompilation: recompilation failed for archive '%s' to '%s' : %@",  v147,  0x20u);
            }
          }

          MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v81);
          int v86 = 1;
          goto LABEL_161;
        }
      }

      else if (valid)
      {
        goto LABEL_17;
      }

      id v10 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        if (*(char *)(v144 + 71) < 0)
        {
          std::string::__init_copy_ctor_external( (std::string *)&__p,  *(const std::string::value_type **)(v144 + 48),  *(void *)(v144 + 56));
        }

        else
        {
          *(_OWORD *)&__p.st_dev = *(_OWORD *)(v144 + 48);
          *(void *)&__p.st_uid = *(void *)(v144 + 64);
        }

        MTLAssetUpgraderD::recompileSingleStep();
      }

      goto LABEL_44;
    }
  }

  else if (v4)
  {
    goto LABEL_3;
  }

  BOOL v5 = 0LL;
LABEL_49:

  return v5;
}

void sub_1000089FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, void *a27, uint64_t a28, int a29, __int16 a30, char a31, char a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, void *__p, uint64_t a40, int a41, __int16 a42, char a43, char a44, uint64_t a45, uint64_t a46, char a47)
{
  if (a32 < 0) {
    operator delete(a27);
  }

  if (a44 < 0) {
    operator delete(__p);
  }

  if (a46) {
    (*(void (**)(uint64_t))(*(void *)a46 + 8LL))(a46);
  }
  MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)&a47);

  _Unwind_Resume(a1);
}

void MTLWorkQueue<RecompilationWork>::peek(unsigned int *a1@<X0>, void *a2@<X8>)
{
  if (!v11) {
    goto LABEL_13;
  }
  uint64_t v10 = 0LL;
  int v4 = mdb_cursor_open(v11, a1[2], &v10);
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = mdb_strerror(v4);
      MTLWorkQueue<RecompilationWork>::push((uint64_t)v5, (uint64_t)v13);
    }

    goto LABEL_13;
  }

  int v6 = mdb_cursor_get(v10, v13, v9, 0);
  if (!v6)
  {
    int v6 = mdb_cursor_get(v10, v13, v9, 8);
  }

  if (v6 == -30798)
  {
LABEL_13:
    *a2 = 0LL;
    goto LABEL_14;
  }

  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = mdb_strerror(v6);
      MTLWorkQueue<RecompilationWork>::push((uint64_t)v8, (uint64_t)v12);
    }

    goto LABEL_13;
  }

LABEL_10:
  uint64_t v7 = operator new(0x70uLL);
  *(void *)uint64_t v7 = off_10001C5D8;
  v7[3] = 0u;
  v7[4] = 0u;
  v7[5] = 0u;
  v7[6] = 0u;
  *a2 = v7;
  RecompilationWork::deserialize((uint64_t)v7, v9);
LABEL_14:
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v11);
}

void sub_100008EC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void MTLWorkQueue<RecompilationWork>::setState(unsigned int *a1, int a2)
{
  if (!v16) {
    goto LABEL_18;
  }
  uint64_t v15 = 0LL;
  int v4 = mdb_cursor_open(v16, a1[2], &v15);
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      BOOL v5 = mdb_strerror(v4);
      MTLWorkQueue<RecompilationWork>::push((uint64_t)v5, (uint64_t)v18);
    }

    goto LABEL_18;
  }

  int v6 = mdb_cursor_get(v15, v18, v14, 0);
  if (!v6)
  {
    if (!MTLVersionedDB::isVersionEntry((uint64_t)a1, v18[0], (char *)v18[1]))
    {
LABEL_10:
      uint64_t v7 = operator new(0x70uLL);
      *(void *)uint64_t v7 = off_10001C5D8;
      v7[3] = 0u;
      v7[4] = 0u;
      v7[5] = 0u;
      v7[6] = 0u;
      double v8 = RecompilationWork::deserialize((uint64_t)v7, v14);
      *((_DWORD *)v7 + 10) = a2;
      (*(void (**)(_OWORD *, double))(*(void *)v7 + 24LL))(v7, v8);
      uint64_t v9 = v15;
      (*(void (**)(void **__return_ptr, _OWORD *))(*(void *)v7 + 32LL))(__p, v7);
      int v10 = mdb_cursor_put(v9, v18, (uint64_t)__p[0], 64);
      uint64_t v11 = __p[0];
      __p[0] = 0LL;
      if (v11) {
        operator delete(v11);
      }
      if (v10 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        int v12 = mdb_strerror(0);
        MTLWorkQueue<RecompilationWork>::setState((uint64_t)v12, (uint64_t)__p);
      }

      (*(void (**)(_OWORD *))(*(void *)v7 + 8LL))(v7);
      goto LABEL_18;
    }

    int v6 = mdb_cursor_get(v15, v18, v14, 8);
  }

  if (v6 == -30798) {
    goto LABEL_18;
  }
  if (!v6) {
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v13 = mdb_strerror(v6);
    MTLWorkQueue<RecompilationWork>::push((uint64_t)v13, (uint64_t)__p);
  }

LABEL_18:
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v16);
}

      int v6 = *(_WORD *)(v5 + 10);
    }

    while ((v6 & 1) != 0);
  }

  if ((v6 & 2) != 0)
  {
    uint64_t result = 0LL;
    *(_DWORD *)(a1 + 68) = *(_DWORD *)(a1 + 68) & 0xFFFFFFFC | 1;
  }

  else
  {
    *(_DWORD *)(*(void *)(a1 + 24) + 124LL) |= 2u;
    return 4294936500LL;
  }

  return result;
}

void sub_1000090F0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, void *__p)
{
}

void ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke(uint64_t a1, void *a2)
{
  __int128 v3 = a2;
  int v4 = *(MTLAssetUpgraderD **)(a1 + 32);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    int state = xpc_activity_get_state(v3);
    ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke_cold_3(state, buf);
  }

  if (xpc_activity_get_state(v3))
  {
    v6.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    do
    {
      if (!MTLAssetUpgraderD::recompileSingleStep(v4)) {
        goto LABEL_22;
      }
    }

    while (std::chrono::steady_clock::now().__d_.__rep_ - v6.__d_.__rep_ < 2501000000LL
         || !xpc_activity_should_defer(v3));
    BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v7) {
      ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke_cold_2(v7, v8, v9);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)&unk_10001870B);
    id CacheDirectory = MTLAssetUpgraderD::getCacheDirectory(2, (uint64_t *)__p);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(CacheDirectory);
    xpc_object_t empty = (xpc_object_t)objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:@"upgraderWork.db"]);

    if (v23 < 0)
    {
      operator delete(__p[0]);
      if (!empty)
      {
LABEL_18:
        if (!xpc_activity_set_state(v3, 3LL))
        {
          BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v13) {
            ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke_cold_1( v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20);
          }
        }

        goto LABEL_21;
      }
    }

    else if (!empty)
    {
      goto LABEL_18;
    }

    std::string::basic_string[abi:ne180100]<0>( __p, (char *)[empty fileSystemRepresentation]);
    MTLVersionedDB::MTLVersionedDB((void **)v21, (uint64_t *)__p, 5u, 1, 0);
    if (v23 < 0) {
      operator delete(__p[0]);
    }
    MTLWorkQueue<RecompilationWork>::setState(v21, 2);
    MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v21);
    goto LABEL_18;
  }

  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(empty, XPC_ACTIVITY_DELAY, 5LL);
  xpc_activity_set_criteria(v3, empty);
LABEL_21:

LABEL_22:
}

void sub_100009360( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::run(id *this)
{
}

int main(int argc, const char **argv, const char **envp)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v3[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "MTLAssetUpgraderD startup",  (uint8_t *)v3,  2u);
  }

  memset(v3, 0, 24);
  MTLAssetUpgraderD::run(v3);
}

void sub_100009494( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
}

void MTLAssetUpgraderD::~MTLAssetUpgraderD(id *this)
{
  id v2 = this[1];
  this[1] = 0LL;
  if (v2) {
    (*(void (**)(id))(*(void *)v2 + 8LL))(v2);
  }
}

uint64_t RecompilationWork::RecompilationWork(uint64_t a1, __int128 *a2, __int128 *a3, int a4, int a5, int a6)
{
  *(void *)a1 = off_10001C5D8;
  *(_DWORD *)(a1 + 8) = a4;
  *(_DWORD *)(a1 + 12) = a5;
  *(_DWORD *)(a1 + 16) = a6;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 37) = 0LL;
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external( (std::string *)(a1 + 48),  *(const std::string::value_type **)a2,  *((void *)a2 + 1));
  }

  else
  {
    __int128 v9 = *a2;
    *(void *)(a1 + 64) = *((void *)a2 + 2);
    *(_OWORD *)(a1 + 48) = v9;
  }

  int v10 = (std::string *)(a1 + 72);
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v10, *(const std::string::value_type **)a3, *((void *)a3 + 1));
  }

  else
  {
    __int128 v11 = *a3;
    *(void *)(a1 + 88) = *((void *)a3 + 2);
    *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
  }

  *(void *)(a1 + 96) = 0LL;
  *(void *)(a1 + 104) = 0LL;
  uint64_t v12 = *((unsigned __int8 *)a2 + 23);
  if ((v12 & 0x80u) != 0LL) {
    uint64_t v12 = *((void *)a2 + 1);
  }
  *(void *)(a1 + 24) = v12;
  uint64_t v13 = *((unsigned __int8 *)a3 + 23);
  if ((v13 & 0x80u) != 0LL) {
    uint64_t v13 = *((void *)a3 + 1);
  }
  *(void *)(a1 + 32) = v13;
  return a1;
}

void sub_1000095C4(_Unwind_Exception *exception_object)
{
}

void RecompilationWork::~RecompilationWork(RecompilationWork *this)
{
}

{
  void *v2;
  *(void *)this = off_10001C5D8;
  id v2 = (void *)*((void *)this + 12);
  if (v2) {
    operator delete[](v2);
  }
}

double RecompilationWork::deserialize(uint64_t a1, void *a2)
{
  if (*a2 >= 0x28uLL)
  {
    int v4 = (__int128 *)a2[1];
    __int128 v5 = *v4;
    __int128 v6 = v4[1];
    *(void *)(a1 + 40) = *((void *)v4 + 4);
    *(_OWORD *)(a1 + 24) = v6;
    *(_OWORD *)(a1 + 8) = v5;
    size_t v7 = *(void *)(a1 + 24);
    if (*a2 == v7 + *(void *)(a1 + 32) + 40)
    {
      std::string::basic_string[abi:ne180100](&__dst, (void *)(a2[1] + 40LL), v7);
      uint64_t v8 = (void **)(a1 + 48);
      *(_OWORD *)uint64_t v8 = __dst;
      *(void *)(a1 + 64) = v12;
      std::string::basic_string[abi:ne180100]( &__dst,  (void *)(a2[1] + *(void *)(a1 + 24) + 40LL),  *(void *)(a1 + 32));
      __int128 v9 = (void **)(a1 + 72);
      *(void *)&__int128 v5 = __dst;
      *(_OWORD *)__int128 v9 = __dst;
      *(void *)(a1 + 88) = v12;
    }
  }

  return *(double *)&v5;
}

void *RecompilationWork::serialization@<X0>(RecompilationWork *this@<X0>, void *a2@<X8>)
{
  uint64_t result = operator new(0x10uLL);
  *a2 = result;
  uint64_t v5 = *((void *)this + 12);
  void *result = *((void *)this + 13);
  result[1] = v5;
  return result;
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    std::string::__throw_length_error[abi:ne180100]();
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

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  id v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24LL)
  {
  }

  a1[1] = v2;
}

void std::vector<std::string>::__swap_out_circular_buffer( std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  xpc_object_t value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]( uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100]( uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8LL);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8LL);
  while (v1 != v2)
  {
    v1 += 24LL;
  }

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      size_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        size_t v5 = *(void ***)(a1 + 16);
      }

      uint64_t v2 = v5;
    }

    while (v5 != a2);
  }

uint64_t operator==(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 8) != *(_DWORD *)(a2 + 8)
    || *(_DWORD *)(a1 + 12) != *(_DWORD *)(a2 + 12)
    || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 16))
  {
    return 0LL;
  }

  uint64_t v4 = *(unsigned __int8 *)(a1 + 71);
  if ((v4 & 0x80u) == 0LL) {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 71);
  }
  else {
    uint64_t v5 = *(void *)(a1 + 56);
  }
  uint64_t v6 = *(unsigned __int8 *)(a2 + 71);
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0LL) {
    uint64_t v6 = *(void *)(a2 + 56);
  }
  if (v5 != v6) {
    return 0LL;
  }
  uint64_t v8 = (const void **)(a1 + 48);
  if (v7 >= 0) {
    uint64_t v9 = (unsigned __int8 *)(a2 + 48);
  }
  else {
    uint64_t v9 = *(unsigned __int8 **)(a2 + 48);
  }
  if ((v4 & 0x80) != 0)
  {
    if (memcmp(*v8, v9, *(void *)(a1 + 56))) {
      return 0LL;
    }
  }

  else if (*(_BYTE *)(a1 + 71))
  {
    while (*(unsigned __int8 *)v8 == *v9)
    {
      uint64_t v8 = (const void **)((char *)v8 + 1);
      ++v9;
      if (!--v4) {
        goto LABEL_19;
      }
    }

    return 0LL;
  }

LABEL_19:
  uint64_t v10 = *(unsigned __int8 *)(a1 + 95);
  if ((v10 & 0x80u) == 0LL) {
    uint64_t v11 = *(unsigned __int8 *)(a1 + 95);
  }
  else {
    uint64_t v11 = *(void *)(a1 + 80);
  }
  uint64_t v12 = *(unsigned __int8 *)(a2 + 95);
  int v13 = (char)v12;
  if ((v12 & 0x80u) != 0LL) {
    uint64_t v12 = *(void *)(a2 + 80);
  }
  if (v11 != v12) {
    return 0LL;
  }
  __int128 v14 = (const void **)(a1 + 72);
  uint64_t v17 = *(unsigned __int8 **)(a2 + 72);
  uint64_t v16 = (unsigned __int8 *)(a2 + 72);
  __int128 v15 = v17;
  if (v13 >= 0) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = v15;
  }
  if ((v10 & 0x80) != 0) {
    return memcmp(*v14, v18, *(void *)(a1 + 80)) == 0;
  }
  if (!*(_BYTE *)(a1 + 95)) {
    return 1LL;
  }
  uint64_t v19 = v10 - 1;
  do
  {
    int v21 = *(unsigned __int8 *)v14;
    __int128 v14 = (const void **)((char *)v14 + 1);
    int v20 = v21;
    int v23 = *v18++;
    int v22 = v23;
    BOOL v25 = v19-- != 0;
    uint64_t result = v20 == v22;
  }

  while (v20 == v22 && v25);
  return result;
}

uint64_t OUTLINED_FUNCTION_1(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void OUTLINED_FUNCTION_2( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_6(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t OUTLINED_FUNCTION_7(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, float a5)
{
  *(float *)a2 = a5;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2080;
  *(void *)(a2 + 14) = a4;
  *(_WORD *)(a2 + 22) = 2080;
  *(void *)(a2 + 24) = result;
  return result;
}

  ;
}

void OUTLINED_FUNCTION_9(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_12(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_13( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_14(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_15(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void FileSignature::FileSignature(FileSignature *this)
{
  *(_DWORD *)this = 0;
  *((void *)this + 1) = 0LL;
  *((_DWORD *)this + 4) = 0;
}

uint64_t FileSignature::FileSignature(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = 0;
  *(void *)(a1 + 8) = 0LL;
  *(_DWORD *)(a1 + 16) = 0;
  else {
    uint64_t v4 = *(const char **)a2;
  }
  if (!stat(v4, &v11))
  {
    *(_DWORD *)a1 = v11.st_dev;
    *(void *)(a1 + 8) = v11.st_ino;
  }

  uint64_t v10 = 0LL;
  __int128 v9 = xmmword_100017AB0;
  else {
    uint64_t v5 = *(const char **)a2;
  }
  if (!getattrlist(v5, &v9, v7, 8uLL, 0x20u)) {
    *(_DWORD *)(a1 + 16) = v8;
  }
  return a1;
}

BOOL operator==(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 != *(_DWORD *)a2) {
    return 0LL;
  }
  return *(void *)(a1 + 8) == *(void *)(a2 + 8)
      && *(_DWORD *)(a1 + 16) == (unint64_t)*(unsigned int *)(a2 + 16);
}

{
  BOOL v2;
  if (*(_BYTE *)(a1 + 1088)) {
    uint64_t v2 = *(_BYTE *)(a2 + 1088) == 0;
  }
  else {
    uint64_t v2 = 1;
  }
  return !v2
      && *(_DWORD *)(a1 + 8) == *(_DWORD *)(a2 + 8)
      && *(void *)(a1 + 16) == *(void *)(a2 + 16)
      && *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24)
      && *(_DWORD *)(a1 + 32) == *(_DWORD *)(a2 + 32)
      && *(void *)(a1 + 40) == *(void *)(a2 + 40)
      && *(_DWORD *)(a1 + 48) == *(_DWORD *)(a2 + 48);
}

BOOL operator!=(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)a1 != *(_DWORD *)a2
      || *(void *)(a1 + 8) != *(void *)(a2 + 8)
      || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 16);
}

uint64_t ArchivePayload::ArchivePayload(uint64_t a1, uint64_t a2, const std::string *a3, int a4, int a5)
{
  *(_DWORD *)a1 = a4;
  *(_DWORD *)(a1 + 4) = a5;
  FileSignature::FileSignature(a1 + 8, a2);
  FileSignature::FileSignature(a1 + 32, (uint64_t)a3);
  *(void *)(a1 + 1080) = 0LL;
  if ((char)a3->__r_.__value_.__s.__size_ < 0)
  {
    std::string::size_type size = a3->__r_.__value_.__l.__size_;
    if (size >= 0x401)
    {
      char v9 = 0;
      goto LABEL_8;
    }
  }

  else
  {
    std::string::size_type size = a3->__r_.__value_.__s.__size_;
  }

  std::string::copy(a3, (std::string::value_type *)(a1 + 56), size, 0LL);
  std::string::size_type v8 = a3->__r_.__value_.__s.__size_;
  if ((v8 & 0x80u) != 0LL) {
    std::string::size_type v8 = a3->__r_.__value_.__l.__size_;
  }
  *(void *)(a1 + 1080) = v8;
  char v9 = 1;
LABEL_8:
  *(_BYTE *)(a1 + 1088) = v9;
  return a1;
}

_DWORD *ArchivePayload::ArchivePayload(_DWORD *__dst, size_t __n, void *__src)
{
  __dst[2] = 0;
  *((void *)__dst + 2) = 0LL;
  __dst[6] = 0;
  __dst[8] = 0;
  *((void *)__dst + 5) = 0LL;
  __dst[12] = 0;
  *((void *)__dst + 135) = 0LL;
  *((_BYTE *)__dst + 1088) = 0;
  if (__n - 1081 >= 0xFFFFFFFFFFFFFBFFLL)
  {
    memcpy(__dst, __src, __n);
    *((void *)__dst + 135) = __n - 56;
    *((_BYTE *)__dst + 1088) = 1;
  }

  return __dst;
}

void *ArchivePayload::serialization@<X0>(ArchivePayload *this@<X0>, void *a2@<X8>)
{
  uint64_t result = operator new(0x10uLL);
  *a2 = result;
  void *result = *((void *)this + 135) + 56LL;
  result[1] = this;
  return result;
}

void *ArchivePayload::getRecompiledArchive@<X0>(ArchivePayload *this@<X0>, void *a2@<X8>)
{
  return std::string::basic_string[abi:ne180100](a2, (char *)this + 56, *((void *)this + 135));
}

uint64_t ArchivePayload::isValid(ArchivePayload *this)
{
  return *((unsigned __int8 *)this + 1088);
}

BOOL ArchivePayload::matchesCurrent(uint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a1 + 1088)) {
    return 0LL;
  }
  std::string::basic_string[abi:ne180100](&__p, (void *)(a1 + 56), *(void *)(a1 + 1080));
  ArchivePayload::ArchivePayload((uint64_t)v6, a2, &__p, 0, 0);
  return operator==((uint64_t)v6, a1);
}

void sub_10000A088( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void **MTLArchiveMapDB::MTLArchiveMapDB(void **a1, uint64_t *a2)
{
  return MTLVersionedDB::MTLVersionedDB(a1, a2, 3u, 0, 1);
}

void MTLArchiveMapDB::remove(uint64_t a1, uint64_t a2, std::string *a3, int a4, int a5)
{
  else {
    std::string v35 = *a3;
  }
  if ((char)v35.__r_.__value_.__s.__size_ < 0)
  {
    std::string::__init_copy_ctor_external(&v36, v35.__r_.__value_.__l.__data_, v35.__r_.__value_.__l.__size_);
  }

  else
  {
    std::string v36 = v35;
  }

  uint64_t v34 = 0LL;
  int v9 = mdb_cursor_open(a2, *(_DWORD *)(a1 + 8), &v34);
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = mdb_strerror(v9);
      MTLArchiveUsageDB::prune((uint64_t)v10, (uint64_t)v38, v11);
    }
  }

  else
  {
    uint64_t v12 = v34;
    int v13 = operator new(0x10uLL);
    __int128 v14 = v13;
    std::string::size_type size = v36.__r_.__value_.__s.__size_;
    if ((v36.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      std::string::size_type size = v36.__r_.__value_.__l.__size_;
    }
    uint64_t v16 = &v36;
    if ((v36.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      uint64_t v16 = (std::string *)v36.__r_.__value_.__r.__words[0];
    }
    void *v13 = size;
    v13[1] = v16;
    int v17 = mdb_cursor_get(v12, v13, v37, 16);
    operator delete(v14);
    if (v17 != -30798)
    {
      uint64_t v18 = v34;
      uint64_t v19 = operator new(0x10uLL);
      int v20 = v19;
      std::string::size_type v21 = v36.__r_.__value_.__s.__size_;
      if ((v36.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        std::string::size_type v21 = v36.__r_.__value_.__l.__size_;
      }
      int v22 = &v36;
      if ((v36.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        int v22 = (std::string *)v36.__r_.__value_.__r.__words[0];
      }
      *uint64_t v19 = v21;
      v19[1] = v22;
      int v23 = mdb_cursor_get(v18, v19, v37, 1);
      operator delete(v20);
      if (v23 != -30798)
      {
        while (1)
        {
          int v24 = operator new(0x448uLL);
          BOOL v25 = v24;
          size_t v27 = v37[0];
          std::string::size_type v26 = (const void *)v37[1];
          v24[2] = 0;
          *((void *)v24 + 2) = 0LL;
          v24[6] = 0;
          v24[8] = 0;
          *((void *)v24 + 5) = 0LL;
          v24[12] = 0;
          *((void *)v24 + 135) = 0LL;
          *((_BYTE *)v24 + 1088) = 0;
          if (v27 - 1081 < 0xFFFFFFFFFFFFFBFFLL
            || (memcpy(v24, v26, v27), *((void *)v25 + 135) = v27 - 56, *((_BYTE *)v25 + 1088) = 1, *v25 == a4))
          {
            if (v25[1] == a5) {
              break;
            }
          }

          uint64_t v28 = v34;
          id v29 = operator new(0x10uLL);
          BOOL v30 = v29;
          std::string::size_type v31 = v36.__r_.__value_.__s.__size_;
          if ((v36.__r_.__value_.__s.__size_ & 0x80u) == 0)
          {
            id v32 = &v36;
          }

          else
          {
            std::string::size_type v31 = v36.__r_.__value_.__l.__size_;
            id v32 = (std::string *)v36.__r_.__value_.__r.__words[0];
          }

          *id v29 = v31;
          v29[1] = v32;
          int v33 = mdb_cursor_get(v28, v29, v37, 9);
          operator delete(v30);
          operator delete(v25);
          if (v33 == -30798) {
            goto LABEL_30;
          }
        }

        mdb_cursor_del(v34, 0);
        operator delete(v25);
      }
    }
  }

void sub_10000A404( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20, __int16 a21, char a22, char a23)
{
  if (a23 < 0) {
    operator delete(a18);
  }
  _Unwind_Resume(a1);
}

void MTLArchiveMapDB::read( unsigned int *a1@<X0>, std::string *a2@<X1>, int a3@<W2>, int a4@<W3>, void *a5@<X8>)
{
  if (!v39)
  {
    std::string::basic_string[abi:ne180100]<0>(a5, (char *)&unk_10001870B);
    goto LABEL_37;
  }

  else {
    std::string v36 = *a2;
  }
  if ((char)v36.__r_.__value_.__s.__size_ < 0)
  {
    std::string::__init_copy_ctor_external(&v37, v36.__r_.__value_.__l.__data_, v36.__r_.__value_.__l.__size_);
  }

  else
  {
    std::string v37 = v36;
  }

  uint64_t v35 = 0LL;
  int v10 = mdb_cursor_open(v39, a1[2], &v35);
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = mdb_strerror(v10);
      MTLArchiveUsageDB::prune((uint64_t)v11, (uint64_t)v40, v12);
    }
  }

  else
  {
    uint64_t v13 = v35;
    __int128 v14 = operator new(0x10uLL);
    __int128 v15 = v14;
    std::string::size_type size = v37.__r_.__value_.__s.__size_;
    if ((v37.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      std::string::size_type size = v37.__r_.__value_.__l.__size_;
    }
    int v17 = &v37;
    if ((v37.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      int v17 = (std::string *)v37.__r_.__value_.__r.__words[0];
    }
    *__int128 v14 = size;
    v14[1] = v17;
    int v18 = mdb_cursor_get(v13, v14, v38, 16);
    operator delete(v15);
    if (v18 != -30798)
    {
      uint64_t v19 = v35;
      int v20 = operator new(0x10uLL);
      std::string::size_type v21 = v20;
      std::string::size_type v22 = v37.__r_.__value_.__s.__size_;
      if ((v37.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        std::string::size_type v22 = v37.__r_.__value_.__l.__size_;
      }
      int v23 = &v37;
      if ((v37.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        int v23 = (std::string *)v37.__r_.__value_.__r.__words[0];
      }
      *int v20 = v22;
      v20[1] = v23;
      int v24 = mdb_cursor_get(v19, v20, v38, 1);
      operator delete(v21);
      if (v24 != -30798)
      {
        while (1)
        {
          BOOL v25 = (size_t *)operator new(0x448uLL);
          std::string::size_type v26 = v25;
          size_t v28 = v38[0];
          size_t v27 = (const void *)v38[1];
          *((_DWORD *)v25 + 2) = 0;
          v25[2] = 0LL;
          *((_DWORD *)v25 + 6) = 0;
          *((_DWORD *)v25 + 8) = 0;
          v25[5] = 0LL;
          *((_DWORD *)v25 + 12) = 0;
          v25[135] = 0LL;
          *((_BYTE *)v25 + 1088) = 0;
          if (v28 - 1081 < 0xFFFFFFFFFFFFFBFFLL
            || (memcpy(v25, v27, v28), v26[135] = v28 - 56, *((_BYTE *)v26 + 1088) = 1, *(_DWORD *)v26 == a3))
          {
            if (*((_DWORD *)v26 + 1) == a4) {
              break;
            }
          }

          uint64_t v29 = v35;
          BOOL v30 = operator new(0x10uLL);
          std::string::size_type v31 = v30;
          std::string::size_type v32 = v37.__r_.__value_.__s.__size_;
          if ((v37.__r_.__value_.__s.__size_ & 0x80u) == 0)
          {
            int v33 = &v37;
          }

          else
          {
            std::string::size_type v32 = v37.__r_.__value_.__l.__size_;
            int v33 = (std::string *)v37.__r_.__value_.__r.__words[0];
          }

          *BOOL v30 = v32;
          v30[1] = v33;
          int v34 = mdb_cursor_get(v29, v30, v38, 9);
          operator delete(v31);
          operator delete(v26);
          if (v34 == -30798) {
            goto LABEL_34;
          }
        }

        if (ArchivePayload::matchesCurrent((uint64_t)v26, (uint64_t)a2))
        {
          std::string::basic_string[abi:ne180100](a5, v26 + 7, v26[135]);
          operator delete(v26);
          goto LABEL_35;
        }

        operator delete(v26);
      }
    }
  }

LABEL_34:
  std::string::basic_string[abi:ne180100]<0>(a5, (char *)&unk_10001870B);
LABEL_35:
LABEL_37:
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v39);
}

void sub_10000A7B0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20, __int16 a21, char a22, char a23, uint64_t a24, uint64_t a25, char a26)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&a26);
  _Unwind_Resume(a1);
}

void MTLArchiveMapDB::store(MTLVersionedDB *a1, std::string *a2, std::string *a3, int a4, int a5)
{
  if (v22)
  {
    else {
      std::string __p = *a2;
    }
    if ((char)__p.__r_.__value_.__s.__size_ < 0)
    {
      std::string::__init_copy_ctor_external(&v21, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    }

    else
    {
      std::string v21 = __p;
    }

    ArchivePayload::ArchivePayload((uint64_t)v24, (uint64_t)a2, a3, a4, a5);
    if (v26)
    {
      MTLArchiveMapDB::remove((uint64_t)a1, v22, a2, a4, a5);
      uint64_t v10 = v22;
      unsigned int v11 = *((_DWORD *)a1 + 2);
      uint64_t v12 = (size_t *)operator new(0x10uLL);
      uint64_t v13 = v12;
      std::string::size_type size = v21.__r_.__value_.__s.__size_;
      if ((v21.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        std::string::size_type size = v21.__r_.__value_.__l.__size_;
      }
      __int128 v15 = &v21;
      if ((v21.__r_.__value_.__s.__size_ & 0x80u) != 0) {
        __int128 v15 = (std::string *)v21.__r_.__value_.__r.__words[0];
      }
      size_t *v12 = size;
      v12[1] = (size_t)v15;
      uint64_t v16 = operator new(0x10uLL);
      *uint64_t v16 = v25 + 56;
      v16[1] = v24;
      int v17 = mdb_put(v10, v11, v13, (uint64_t)v16, 0);
      operator delete(v16);
      operator delete(v13);
      if (v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        int v18 = mdb_strerror(v17);
        MTLArchiveUsageDB::store((uint64_t)v18, (uint64_t)v23, v19);
      }
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      MTLArchiveMapDB::store((char *)&a2->__r_.__value_.__s.__size_, a2, (uint64_t *)a3);
    }
  }

  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v22);
}

void sub_10000AA44( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21, char a22)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&a22);
  _Unwind_Resume(a1);
}

BOOL MTLVersionedDB::isVersionEntry(uint64_t a1, uint64_t a2, char *__s1)
{
  if (*(_BYTE *)(a1 + 12))
  {
    if (a2 == 8) {
      return *(void *)__s1 == 0xFFFFFFFFLL;
    }
    return 0LL;
  }

  if (a2 != 12) {
    return 0LL;
  }
  return strncmp(__s1, "_DB_VERSION_", 0xCuLL) == 0;
}

uint64_t MTLVersionedDB::getOrSetVersion(MTLVersionedDB *this, unsigned int a2)
{
  unsigned int v18 = a2;
  uint64_t v16 = 4LL;
  int v17 = &v18;
  uint64_t v15 = 0xFFFFFFFFLL;
  std::string::basic_string[abi:ne180100]<0>(&__p, "_DB_VERSION_");
  if ((char)__p.__r_.__value_.__s.__size_ < 0)
  {
    std::string::__init_copy_ctor_external(&v14, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
  }

  else
  {
    std::string v14 = __p;
  }

  if (*((_BYTE *)this + 12))
  {
    __int128 v3 = (size_t *)operator new(0x10uLL);
    *__int128 v3 = 8LL;
    uint64_t v4 = (std::string *)&v15;
  }

  else
  {
    uint64_t v5 = (size_t *)operator new(0x10uLL);
    __int128 v3 = v5;
    if ((v14.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      std::string::size_type size = v14.__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type size = v14.__r_.__value_.__l.__size_;
    }
    uint64_t v4 = &v14;
    if ((v14.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      uint64_t v4 = (std::string *)v14.__r_.__value_.__r.__words[0];
    }
    *uint64_t v5 = size;
  }

  v3[1] = (size_t)v4;
  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v12, this);
  if (!v12) {
    goto LABEL_20;
  }
  if (!mdb_get(v12, *((_DWORD *)this + 2), v3, &v16) && v16 == 4)
  {
    uint64_t v7 = *v17;
    goto LABEL_21;
  }

  int v8 = mdb_put(v12, *((_DWORD *)this + 2), v3, (uint64_t)&v16, 0);
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v9 = mdb_strerror(v8);
      MTLArchiveUsageDB::store((uint64_t)v9, (uint64_t)v19, v10);
    }

void sub_10000ACC8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(a13);
  }
  _Unwind_Resume(a1);
}

void MTLVersionedDB::openDB(uint64_t *a1, uint64_t a2, unsigned int a3, _BYTE *a4, _BYTE *a5)
{
  *a4 = 1;
  *a5 = 1;
  int v10 = mdb_env_create(a1);
  if (v10)
  {
    int v11 = v10;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      MTLVersionedDB::openDB(v11);
    }
LABEL_14:
    *a1 = 0LL;
    return;
  }

  else {
    uint64_t v12 = *(const char **)a2;
  }
  mkdir(v12, 0x1EDu);
  else {
    uint64_t v13 = *(const char **)a2;
  }
  int v14 = mdb_env_open(*a1, v13, 0, 0x1A4u);
  if (v14)
  {
    int v15 = v14;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      MTLVersionedDB::openDB((char *)(a2 + 23), (void *)a2, v15);
    }
    mdb_env_close((void *)*a1);
    *a4 = 0;
    goto LABEL_14;
  }

  int v16 = MTLVersionedDB::getOrSetVersion((MTLVersionedDB *)a1, a3);
  if (v16 != a3)
  {
    int v17 = v16;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      MTLVersionedDB::openDB(v17, a3);
    }
    *a5 = 0;
  }

void **MTLVersionedDB::MTLVersionedDB(void **a1, uint64_t *a2, unsigned int a3, char a4, char a5)
{
  *a1 = 0LL;
  *((_DWORD *)a1 + 2) = 0;
  *((_BYTE *)a1 + 12) = a4;
  *((_BYTE *)a1 + 13) = a5;
  MTLVersionedDB::openDB((uint64_t *)a1, (uint64_t)a2, a3, &v15, &v14);
  if (v15) {
    BOOL v8 = v14 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      MTLVersionedDB::MTLVersionedDB();
    }
    if (*a1)
    {
      MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v13, (MTLVersionedDB *)a1);
      if (v13)
      {
        mdb_drop(v13, *((_DWORD *)a1 + 2), 0);
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        MTLVersionedDB::MTLVersionedDB(a2, v10, v11);
      }

      MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v13);
      int v9 = *a1;
    }

    else
    {
      int v9 = 0LL;
    }

    mdb_env_close(v9);
    MTLVersionedDB::openDB((uint64_t *)a1, (uint64_t)a2, a3, &v15, &v14);
    if (!v15 || !v14)
    {
      if (*a1) {
        mdb_env_close(*a1);
      }
      *a1 = 0LL;
    }
  }

  return a1;
}

void sub_10000AF90( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

MTLVersionedDB::Transaction *MTLVersionedDB::Transaction::Transaction( MTLVersionedDB::Transaction *this, MTLVersionedDB *a2)
{
  *(void *)this = 0LL;
  if (*(void *)a2)
  {
    int v4 = mdb_txn_begin(*(void *)a2, 0LL, 0, (uint64_t *)this);
    if (v4)
    {
      int v5 = v4;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        MTLVersionedDB::Transaction::Transaction(v5);
      }
LABEL_12:
      *(void *)this = 0LL;
      return this;
    }

    if (*((_BYTE *)a2 + 12)) {
      int v6 = 262152;
    }
    else {
      int v6 = 0x40000;
    }
    int v7 = mdb_dbi_open( *(void *)this,  0LL,  v6 | (4 * *((unsigned __int8 *)a2 + 13)),  (unsigned int *)a2 + 2);
    if (v7)
    {
      int v8 = v7;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        MTLVersionedDB::Transaction::Transaction(v8);
      }
      mdb_txn_abort(*(void *)this);
      goto LABEL_12;
    }
  }

  return this;
}

void MTLVersionedDB::Transaction::~Transaction(MTLVersionedDB::Transaction *this)
{
  uint64_t v1 = *(void *)this;
  if (v1)
  {
    int v2 = mdb_txn_commit(v1);
    if (v2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        __int128 v3 = mdb_strerror(v2);
        MTLVersionedDB::Transaction::~Transaction((uint64_t)v3, (uint64_t)&v5, v4);
      }
    }
  }

void sub_10000B10C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void MTLVersionedDB::~MTLVersionedDB(MTLVersionedDB *this)
{
  uint64_t v2 = *(void *)this;
  if (v2)
  {
    mdb_dbi_close(v2, *((_DWORD *)this + 2));
    mdb_env_close(*(void **)this);
  }

void MTLVersionedDB::dumpTable(MTLVersionedDB *this)
{
  if (v10)
  {
    uint64_t v9 = 0LL;
    int v2 = mdb_cursor_open(v10, *((_DWORD *)this + 2), &v9);
    if (v2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        __int128 v3 = mdb_strerror(v2);
        MTLArchiveUsageDB::prune((uint64_t)v3, (uint64_t)buf, v4);
      }
    }

    else
    {
      int v5 = mdb_cursor_get(v9, v8, v7, 0);
      int v6 = 0;
      while (v5 != -30798)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)std::string buf = 67110144;
          int v12 = v6;
          __int16 v13 = 2048;
          uint64_t v14 = v8[0];
          __int16 v15 = 2048;
          uint64_t v16 = v8[1];
          __int16 v17 = 2048;
          uint64_t v18 = v7[0];
          __int16 v19 = 2048;
          uint64_t v20 = v7[1];
          _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%d: key(%zu,%p) data(%zu,%p)",  buf,  0x30u);
          ++v6;
        }

        int v5 = mdb_cursor_get(v9, v8, v7, 8);
      }
    }
  }

  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v10);
}

void sub_10000B2E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

char *OUTLINED_FUNCTION_2_0@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 8) = a2;
  return mdb_strerror(a1);
}

char *mdb_strerror(int a1)
{
  if (!a1) {
    return "Successful return: 0";
  }
  return mdb_errstr[a1 + 30799];
}

uint64_t mdb_cmp(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 80) + 48LL * a2 + 16))(a3, a4);
}

uint64_t mdb_dcmp(uint64_t a1, unsigned int a2, void *a3, uint64_t a4)
{
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 80) + 48LL * a2 + 24);
  if (v4 == mdb_cmp_int)
  {
    if (*a3 == 8LL) {
      return mdb_cmp_cint(a3, a4);
    }
    uint64_t v4 = mdb_cmp_int;
  }

  return v4((uint64_t)a3, a4);
}

uint64_t mdb_cmp_int(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = **(_DWORD **)(a1 + 8);
  unsigned int v3 = **(_DWORD **)(a2 + 8);
  BOOL v4 = v2 >= v3;
  BOOL v5 = v2 > v3;
  if (v4) {
    return v5;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t mdb_cmp_cint(void *a1, uint64_t a2)
{
  unint64_t v2 = a1[1];
  uint64_t v3 = *a1 - 2LL;
  BOOL v4 = (unsigned __int16 *)(*(void *)(a2 + 8) + v3);
  BOOL v5 = (unsigned __int16 *)(v2 + v3);
  int v6 = v5;
  do
  {
    int v8 = *v6--;
    int v7 = v8;
    int v9 = *v4--;
    uint64_t result = (v7 - v9);
    BOOL v11 = v7 == v9 && (unint64_t)v5 > v2;
    BOOL v5 = v6;
  }

  while (v11);
  return result;
}

uint64_t mdb_env_sync0(uint64_t a1, int a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a1 + 12);
  if ((v3 & 0x20000) != 0) {
    return 13LL;
  }
  if (!a2 && (v3 & 0x10000) != 0) {
    return 0LL;
  }
  if ((v3 & 0x80000) == 0)
  {
    uint64_t result = fsync(*(_DWORD *)a1);
    if (!(_DWORD)result) {
      return result;
    }
    return *__error();
  }

  if (((a2 == 0) & ((v3 & 0x100000u) >> 20)) != 0) {
    int v5 = 1;
  }
  else {
    int v5 = 16;
  }
  uint64_t result = msync(*(void **)(a1 + 56), *(unsigned int *)(a1 + 16) * a3, v5);
  if ((_DWORD)result) {
    return *__error();
  }
  return result;
}

uint64_t mdb_env_sync(uint64_t a1, int a2)
{
  return mdb_env_sync0( a1,  a2,  *(void *)(*(void *)(a1 + 72 + 8LL * ((*(_DWORD *)(a1 + 12) >> 25) & 1 ^ (*(void *)(*(void *)(a1 + 72)
                                                                                                + 128LL) < *(void *)(*(void *)(a1 + 80) + 128LL))))
                     + 120LL)
         + 1LL);
}

uint64_t mdb_txn_renew(uint64_t a1)
{
  if (!a1 || (~*(_DWORD *)(a1 + 124) & 0x20001) != 0) {
    return 22LL;
  }
  else {
    return mdb_txn_renew0(a1);
  }
}

uint64_t mdb_txn_renew0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 64);
  int v4 = *(_DWORD *)(a1 + 124);
  if ((v4 & 0x20000) == 0)
  {
    if (v3)
    {
      uint64_t v5 = pthread_mutex_lock((pthread_mutex_t *)(v3 + 128));
      if ((_DWORD)v5) {
        return v5;
      }
      uint64_t v6 = *(void *)(v3 + 8);
      uint64_t v7 = *(void *)(v2 + 8 * (v6 & 1) + 72);
    }

    else
    {
      uint64_t v7 = *(void *)(v2
                     + 72
                     + 8LL
                     * ((*(_DWORD *)(v2 + 12) >> 25) & 1 ^ (*(void *)(*(void *)(v2 + 72) + 128LL) < *(void *)(*(void *)(v2 + 80) + 128LL))));
      uint64_t v6 = *(void *)(v7 + 128);
    }

    *(void *)(a1 + 24) = v6 + 1;
    *(void *)(a1 + 8) = 0LL;
    *(_DWORD *)(a1 + 56) = 0;
    *(_DWORD *)(a1 + 128) = 0x1FFFF;
    int v9 = *(void **)(v2 + 208);
    *(void *)(a1 + 72) = v9;
    *int v9 = 0LL;
    uint64_t v10 = *(void **)(v2 + 200);
    *(void *)(a1 + 40) = v10;
    *(void *)(a1 + 48) = 0LL;
    *uint64_t v10 = 0LL;
    *(void *)(a1 + 64) = 0LL;
    *(void *)(v2 + 96) = a1;
    memcpy(*(void **)(a1 + 96), *(const void **)(v2 + 152), 4LL * *(unsigned int *)(v2 + 36));
    int v11 = 0;
    goto LABEL_35;
  }

  if (!v3)
  {
    int v11 = 0;
    uint64_t v7 = *(void *)(v2
                   + 72
                   + 8LL
                   * ((*(_DWORD *)(v2 + 12) >> 25) & 1 ^ (*(void *)(*(void *)(v2 + 72) + 128LL) < *(void *)(*(void *)(v2 + 80) + 128LL))));
    *(void *)(a1 + 24) = *(void *)(v7 + 128);
    *(void *)(a1 + 72) = 0LL;
LABEL_35:
    int v24 = *(_OWORD **)(a1 + 88);
    __int128 v25 = *(_OWORD *)(v7 + 40);
    *int v24 = *(_OWORD *)(v7 + 24);
    v24[1] = v25;
    __int128 v26 = *(_OWORD *)(v7 + 56);
    __int128 v27 = *(_OWORD *)(v7 + 72);
    __int128 v28 = *(_OWORD *)(v7 + 104);
    v24[4] = *(_OWORD *)(v7 + 88);
    v24[5] = v28;
    v24[2] = v26;
    v24[3] = v27;
    *(void *)(a1 + 16) = *(void *)(v7 + 120) + 1LL;
    LODWORD(v24) = *(_DWORD *)(v2 + 32);
    *(_DWORD *)(a1 + 120) = (_DWORD)v24;
    *(_DWORD *)(a1 + 124) = v4 & 0x20000;
    if (v24 >= 3)
    {
      unint64_t v29 = 2LL;
      uint64_t v30 = 100LL;
      do
      {
        int v31 = *(__int16 *)(*(void *)(v2 + 144) + 2 * v29);
        *(_WORD *)(*(void *)(a1 + 88) + v30) = *(_WORD *)(*(void *)(v2 + 144) + 2 * v29) & 0x7FFF;
        if (v31 < 0) {
          char v32 = 26;
        }
        else {
          char v32 = 0;
        }
        *(_BYTE *)(*(void *)(a1 + 112) + v29++) = v32;
        v30 += 48LL;
      }

      while (v29 < *(unsigned int *)(a1 + 120));
    }

    *(_BYTE *)(*(void *)(a1 + 112) + 1LL) = 24;
    **(_BYTE **)(a1 + 112) = 8;
    if ((*(_DWORD *)(v2 + 12) & 0x80000000) != 0)
    {
      uint64_t v5 = 4294936501LL;
    }

    else
    {
      if (*(void *)(v2 + 128) >= *(void *)(a1 + 16)) {
        return 0LL;
      }
      uint64_t v5 = 4294936511LL;
    }

    mdb_txn_end((unsigned int *)a1, v11 | 5);
    return v5;
  }

  if ((*(_BYTE *)(v2 + 14) & 0x20) != 0)
  {
    int v8 = *(_DWORD **)(a1 + 72);
    if (v8) {
      goto LABEL_8;
    }
  }

  else
  {
    int v8 = pthread_getspecific(*(void *)(v2 + 160));
    if (v8)
    {
LABEL_8:
      if (v8[2] != *(_DWORD *)(v2 + 40) || *(void *)v8 != -1LL) {
        return 4294936513LL;
      }
      goto LABEL_32;
    }
  }

  int v12 = *(_DWORD *)(v2 + 40);
  pthread_t v13 = pthread_self();
  uint64_t v14 = *(void *)(v2 + 64);
  if (!*(_DWORD *)(v2 + 224))
  {
    uint64_t v5 = mdb_reader_pid(v2, 8, v12);
    if ((_DWORD)v5) {
      return v5;
    }
    *(_DWORD *)(v2 + 224) = 1;
  }

  __int16 v15 = (pthread_mutex_t *)(v14 + 24);
  uint64_t v5 = pthread_mutex_lock((pthread_mutex_t *)(v14 + 24));
  if (!(_DWORD)v5)
  {
    int v16 = *(_DWORD *)(v3 + 16);
    if (v16)
    {
      unsigned int v17 = 0;
      uint64_t v18 = (int *)(v3 + 200);
      while (1)
      {
        int v19 = *v18;
        v18 += 16;
        if (!v19) {
          break;
        }
        if (v16 == ++v17)
        {
          unsigned int v17 = *(_DWORD *)(v3 + 16);
          break;
        }
      }
    }

    else
    {
      unsigned int v17 = 0;
    }

    if (v17 == *(_DWORD *)(v2 + 24))
    {
      pthread_mutex_unlock((pthread_mutex_t *)(v14 + 24));
      return 4294936506LL;
    }

    uint64_t v20 = v3 + ((unint64_t)v17 << 6);
    *(_DWORD *)(v20 + 200) = 0;
    *(void *)(v20 + 192) = -1LL;
    int v8 = (_DWORD *)(v20 + 192);
    *((void *)v8 + 2) = v13;
    if (v17 == v16) {
      *(_DWORD *)(v3 + 16) = ++v16;
    }
    *(_DWORD *)(v2 + 28) = v16;
    void v8[2] = v12;
    pthread_mutex_unlock(v15);
    int v21 = *(_DWORD *)(v2 + 12);
    if ((v21 & 0x200000) != 0)
    {
      int v11 = v21 & 0x200000;
      goto LABEL_33;
    }

    uint64_t v22 = pthread_setspecific(*(void *)(v2 + 160), v8);
    if ((_DWORD)v22)
    {
      uint64_t v5 = v22;
      void v8[2] = 0;
      return v5;
    }

LABEL_32:
    int v11 = 0;
    do
LABEL_33:
      *(void *)int v8 = *(void *)(v3 + 8);
    while (*(void *)v8 != *(void *)(v3 + 8));
    uint64_t v23 = *(void *)v8;
    *(void *)(a1 + 24) = *(void *)v8;
    *(void *)(a1 + 72) = v8;
    uint64_t v7 = *(void *)(v2 + 8 * (v23 & 1) + 72);
    goto LABEL_35;
  }

  return v5;
}

  if (v12 != *(void *)(a1 + 104)) {
    free((void *)v12);
  }
  return v5;
}

    uint64_t v23 = a1[31] | 1;
    a1[30] = 0;
    a1[31] = v23;
    goto LABEL_33;
  }

  if ((v13 & 1) == 0)
  {
    __int16 v15 = (_OWORD *)(v4 + 176);
    uint64_t v14 = *(void *)(v4 + 176);
    if ((a2 & 0x10) == 0) {
      mdb_cursors_close((uint64_t)a1, 0);
    }
    if ((*(_BYTE *)(v4 + 14) & 8) == 0)
    {
      int v16 = (unsigned int *)*((void *)a1 + 9);
      unsigned int v17 = *v16;
      if (*v16)
      {
        uint64_t v18 = *((void *)a1 + 4);
        int v19 = 1;
        do
        {
          uint64_t v20 = *(void **)&v16[4 * v19 + 2];
          if ((*((_WORD *)v20 + 5) & 4) != 0 && *((_DWORD *)v20 + 3) != 1)
          {
            free(v20);
          }

          else
          {
            *uint64_t v20 = *(void *)(v18 + 192);
            *(void *)(v18 + 192) = v20;
          }

          ++v19;
        }

        while (v19 <= v17);
      }

      *(void *)int v16 = 0LL;
    }

    *((void *)a1 + 15) = &_mh_execute_header;
    int v21 = *(void *)a1;
    if (*(void *)a1)
    {
      *(void *)(v21 + 8) = 0LL;
      *(_DWORD *)(v21 + 124) &= ~0x10u;
      pthread_mutex_t *v15 = *(_OWORD *)(a1 + 34);
      mdb_midl_free(*((void *)a1 + 5));
      free(*((void **)a1 + 9));
    }

    else
    {
      mdb_midl_shrink((uint64_t *)a1 + 5);
      *(void *)(v4 + 200) = *((void *)a1 + 5);
      *(void *)(v4 + 96) = 0LL;
      *(void *)__int16 v15 = 0LL;
      *(void *)(v4 + 184) = 0LL;
      int v24 = *(pthread_mutex_t **)(v4 + 64);
      if (v24) {
        pthread_mutex_unlock(v24 + 2);
      }
      LOBYTE(a2) = 0;
    }

    mdb_midl_free(*((void *)a1 + 8));
    mdb_midl_free(v14);
    if ((a2 & 0x20) != 0) {
      goto LABEL_39;
    }
    return;
  }

    unsigned int v17 = *(_DWORD *)(a1 + 36);
    uint64_t v18 = calloc(1uLL, *(unsigned int *)(a1 + 16));
    *(void *)(a1 + 88) = v18;
    if (v18)
    {
      int v19 = calloc(1uLL, 61 * v17 + 136);
      if (v19)
      {
        int v4 = 0LL;
        v19[11] = v19 + 17;
        uint64_t v20 = *(unsigned int *)(a1 + 36);
        int v21 = (uint64_t)&v19[6 * v20 + 17];
        uint64_t v22 = v21 + 8 * v20;
        v19[12] = v22;
        v19[13] = v21;
        v19[14] = v22 + 4 * v20;
        v19[4] = a1;
        v19[10] = *(void *)(a1 + 136);
        *((_DWORD *)v19 + 31) = 1;
        *(void *)(a1 + 104) = v19;
        goto LABEL_37;
      }
    }

    goto LABEL_35;
  }

  int v16 = mdb_env_share_locks(a1, &v26);
  int v4 = v16;
  if ((_DWORD)v16) {
LABEL_36:
  }
    mdb_env_close1(a1);
LABEL_37:
  if (v24[1]) {
    free(v25);
  }
  return v4;
}

uint64_t mdb_txn_begin(uint64_t a1, uint64_t a2, int a3, uint64_t *a4)
{
  int v4 = *(_DWORD *)(a1 + 12);
  if ((v4 & ~a3 & 0x20000) != 0) {
    return 13LL;
  }
  int v10 = v4 & 0x80000 | a3 & 0x70000;
  if (a2)
  {
    int v11 = *(_DWORD *)(a2 + 124);
    v10 |= v11;
    if ((v10 & 0xA0013) != 0)
    {
      if ((v11 & 0x20000) != 0) {
        return 22LL;
      }
      else {
        return 4294936514LL;
      }
    }

    int v13 = 152;
    int v14 = 57;
    uint64_t v15 = 19LL;
  }

  else
  {
    if ((a3 & 0x20000) == 0)
    {
      uint64_t v12 = *(void *)(a1 + 104);
      goto LABEL_28;
    }

    uint64_t v15 = 17LL;
    int v14 = 49;
    int v13 = 136;
  }

  size_t v16 = v13 + *(_DWORD *)(a1 + 36) * v14;
  unsigned int v17 = calloc(1uLL, v16);
  if (!v17) {
    return 12LL;
  }
  uint64_t v12 = (uint64_t)v17;
  v17[10] = *(void *)(a1 + 136);
  v17[11] = &v17[v15];
  uint64_t v18 = *(unsigned int *)(a1 + 36);
  v17[14] = (char *)v17 + v16 - v18;
  *((_DWORD *)v17 + 31) = v10;
  v17[4] = a1;
  if (a2)
  {
    v17[12] = *(void *)(a2 + 96);
    v17[13] = &v17[6 * v18 + v15];
    int v19 = malloc(0x200000uLL);
    *(void *)(v12 + 72) = v19;
    if (v19)
    {
      uint64_t v20 = mdb_midl_alloc(0x1FFFF);
      *(void *)(v12 + 40) = v20;
      int v19 = *(void **)(v12 + 72);
      if (v20)
      {
        *(_DWORD *)(v12 + 128) = *(_DWORD *)(a2 + 128);
        *int v19 = 0LL;
        *(void *)(v12 + 64) = 0LL;
        *(_OWORD *)(v12 + 16) = *(_OWORD *)(a2 + 16);
        uint64_t v21 = *(unsigned int *)(a2 + 120);
        *(_DWORD *)(a2 + 124) |= 0x10u;
        *(void *)(a2 + 8) = v12;
        *(void *)uint64_t v12 = a2;
        *(_DWORD *)(v12 + 120) = v21;
        memcpy(*(void **)(v12 + 88), *(const void **)(a2 + 88), 48 * v21);
        if (*(_DWORD *)(v12 + 120))
        {
          unint64_t v22 = 0LL;
          do
          {
            *(_BYTE *)(*(void *)(v12 + 112) + v22) = *(_BYTE *)(*(void *)(a2 + 112) + v22) & 0xFB;
            ++v22;
          }

          while (v22 < *(unsigned int *)(v12 + 120));
        }

        *(_OWORD *)(v12 + 136) = *(_OWORD *)(a1 + 176);
        uint64_t v23 = *(int **)(a1 + 176);
        if (v23)
        {
          int v24 = *v23;
          __int128 v25 = mdb_midl_alloc(*v23);
          *(void *)(a1 + 176) = v25;
          if (!v25)
          {
            uint64_t v5 = 12LL;
LABEL_31:
            mdb_txn_end((unsigned int *)v12, 6);
            goto LABEL_32;
          }

          memcpy(v25, *(const void **)(v12 + 136), 8 * v24 + 8);
        }

        uint64_t v5 = mdb_cursor_shadow(a2, (void *)v12);
        if (!(_DWORD)v5) {
          goto LABEL_29;
        }
        goto LABEL_31;
      }
    }

    free(v19);
    free((void *)v12);
    return 12LL;
  }

  v17[12] = *(void *)(a1 + 152);
LABEL_28:
  uint64_t v5 = mdb_txn_renew0(v12);
  if (!(_DWORD)v5)
  {
LABEL_29:
    uint64_t v5 = 0LL;
    *(_DWORD *)(v12 + 124) |= v10;
    *a4 = v12;
    return v5;
  }

uint64_t mdb_cursor_shadow(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 120);
  while (1)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 104) + 8LL * (v2 - 1));
    if (v5) {
      break;
    }
LABEL_10:
    if (v2-- <= 1) {
      return 0LL;
    }
  }

  uint64_t v6 = (v2 - 1);
  if (v5[2]) {
    size_t v7 = 888LL;
  }
  else {
    size_t v7 = 392LL;
  }
  while (1)
  {
    int v8 = (void **)malloc(v7);
    if (!v8) {
      return 12LL;
    }
    int v9 = v8;
    memcpy(v8, v5, 0x188uLL);
    v5[1] = v9;
    v5[5] = a2[11] + 48LL * (v2 - 1);
    v5[3] = a2;
    v5[7] = a2[14] + v6;
    uint64_t v10 = v5[2];
    if (v10)
    {
      memcpy(v9 + 49, (const void *)v5[2], 0x1F0uLL);
      *(void *)(v10 + 24) = a2;
    }

    uint64_t v11 = a2[13];
    *uint64_t v5 = *(void *)(v11 + 8 * v6);
    *(void *)(v11 + 8 * v6) = v5;
    uint64_t v5 = *v9;
    if (!*v9) {
      goto LABEL_10;
    }
  }

void mdb_txn_end(unsigned int *a1, int a2)
{
  uint64_t v4 = *((void *)a1 + 4);
  uint64_t v5 = a1[30];
  if ((int)v5 >= 3)
  {
    uint64_t v6 = *((void *)a1 + 14);
    unint64_t v7 = v5 + 1;
    do
    {
      uint64_t v8 = (v7 - 2);
      if ((*(_BYTE *)(v6 + v8) & 4) != 0)
      {
        if ((a2 & 0x10) != 0)
        {
          *(_WORD *)(*(void *)(v4 + 144) + 2 * v8) = *(_WORD *)(*((void *)a1 + 11) + 48LL * v8 + 4) | 0x8000;
        }

        else
        {
          uint64_t v9 = *(void *)(v4 + 136);
          uint64_t v10 = *(void **)(v9 + 48LL * v8 + 8);
          if (v10)
          {
            uint64_t v11 = (void *)(v9 + 48LL * v8);
            *uint64_t v11 = 0LL;
            v11[1] = 0LL;
            uint64_t v12 = *(void *)(v4 + 152);
            *(_WORD *)(*(void *)(v4 + 144) + 2 * v8) = 0;
            ++*(_DWORD *)(v12 + 4 * v8);
            free(v10);
          }
        }
      }

      --v7;
    }

    while (v7 > 3);
  }

  unsigned int v13 = a1[31];
  if ((v13 & 0x20000) != 0)
  {
    unint64_t v22 = (void *)*((void *)a1 + 9);
    if (v22)
    {
      *unint64_t v22 = -1LL;
      if ((*(_BYTE *)(v4 + 14) & 0x20) == 0)
      {
LABEL_31:
        *((void *)a1 + 9) = 0LL;
        goto LABEL_32;
      }

      if ((a2 & 0x200000) != 0)
      {
        *(_DWORD *)(*((void *)a1 + 9) + 8LL) = 0;
        goto LABEL_31;
      }
    }

LABEL_33:
  if ((a2 & 0x20) != 0) {
LABEL_39:
  }
    free(a1);
}

uint64_t mdb_txn_env(uint64_t result)
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

uint64_t mdb_txn_id(uint64_t result)
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

void mdb_txn_reset(uint64_t a1)
{
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 126) & 2) != 0) {
      mdb_txn_end((unsigned int *)a1, 3);
    }
  }

void mdb_txn_abort(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)(a1 + 8)) {
      mdb_txn_abort();
    }
    mdb_txn_end((unsigned int *)a1, 2097186);
  }

uint64_t mdb_txn_commit(uint64_t a1)
{
  if (!a1) {
    return 22LL;
  }
  if (*(void *)(a1 + 8))
  {
    uint64_t appended = mdb_txn_commit();
    if ((_DWORD)appended) {
      goto LABEL_9;
    }
  }

  int v3 = 2097201;
  int v4 = *(_DWORD *)(a1 + 124);
  if ((v4 & 0x20000) != 0) {
    goto LABEL_53;
  }
  uint64_t v5 = *(void *)a1;
  if ((v4 & 3) != 0)
  {
    if (v5) {
      *(_DWORD *)(v5 + 124) |= 2u;
    }
    uint64_t appended = 4294936514LL;
LABEL_9:
    mdb_txn_abort(a1);
    return appended;
  }

  if (!v5)
  {
    uint64_t v20 = *(void *)(a1 + 32);
    if (*(void *)(v20 + 96) != a1)
    {
      uint64_t appended = 22LL;
      goto LABEL_9;
    }

    mdb_cursors_close(a1, 0);
    if (**(void **)(a1 + 72) || (*(_BYTE *)(a1 + 124) & 0xC) != 0)
    {
      if (*(_DWORD *)(a1 + 120) >= 3u)
      {
        v60[0] = 48LL;
        mdb_cursor_init((uint64_t)v61, a1, 1u, 0LL);
        unint64_t v21 = *(unsigned int *)(a1 + 120);
        if (v21 >= 3)
        {
          unint64_t v22 = 2LL;
          uint64_t v23 = 96LL;
          do
          {
            if ((*(_BYTE *)(*(void *)(a1 + 112) + v22) & 1) != 0)
            {
              if (*(_DWORD *)(*(void *)(a1 + 96) + 4 * v22) != *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 152LL)
                                                                            + 4 * v22))
              {
                uint64_t appended = 4294936516LL;
                goto LABEL_9;
              }

              uint64_t v24 = *(void *)(a1 + 80);
              v60[1] = *(void *)(a1 + 88) + v23;
              uint64_t v25 = mdb_cursor_put((uint64_t)v61, (size_t *)(v24 + v23), (uint64_t)v60, 2);
              if ((_DWORD)v25)
              {
                uint64_t appended = v25;
                goto LABEL_9;
              }

              unint64_t v21 = *(unsigned int *)(a1 + 120);
            }

            ++v22;
            v23 += 48LL;
          }

          while (v22 < v21);
        }
      }

      uint64_t appended = mdb_freelist_save(a1);
      if ((_DWORD)appended) {
        goto LABEL_9;
      }
      mdb_midl_free(*(void *)(v20 + 176));
      *(void *)(v20 + 176) = 0LL;
      mdb_midl_shrink((uint64_t *)(a1 + 40));
      uint64_t appended = mdb_page_flush(a1, 0);
      if ((_DWORD)appended) {
        goto LABEL_9;
      }
      if ((*(_BYTE *)(a1 + 126) & 1) == 0)
      {
        uint64_t appended = mdb_env_sync0(v20, 0, *(void *)(a1 + 16));
        if ((_DWORD)appended) {
          goto LABEL_9;
        }
      }

      uint64_t appended = mdb_env_write_meta(a1);
      if ((_DWORD)appended) {
        goto LABEL_9;
      }
      int v26 = *(_DWORD *)(v20 + 12);
      if ((v26 & 0x2000000) != 0)
      {
        if ((v26 & 0x400000) == 0)
        {
          uint64_t appended = mdb_env_share_locks(v20, v61);
          if ((_DWORD)appended) {
            goto LABEL_9;
          }
          int v26 = *(_DWORD *)(v20 + 12);
        }

        *(_DWORD *)(v20 + 12) = v26 ^ 0x2000000;
      }

      int v3 = 16;
    }

LABEL_53:
    mdb_txn_end((unsigned int *)a1, v3);
    return 0LL;
  }

  uint64_t appended = mdb_midl_append_list((uint64_t **)(v5 + 40), *(uint64_t **)(a1 + 40));
  if ((_DWORD)appended) {
    goto LABEL_9;
  }
  mdb_midl_free(*(void *)(a1 + 40));
  *(void *)(v5 + 16) = *(void *)(a1 + 16);
  *(_DWORD *)(v5 + 124) = *(_DWORD *)(a1 + 124);
  mdb_cursors_close(a1, 1);
  memcpy(*(void **)(v5 + 88), *(const void **)(a1 + 88), 48LL * *(unsigned int *)(a1 + 120));
  *(_DWORD *)(v5 + 120) = *(_DWORD *)(a1 + 120);
  **(_BYTE **)(v5 + 112) = **(_BYTE **)(a1 + 112);
  *(_BYTE *)(*(void *)(v5 + 112) + 1LL) = *(_BYTE *)(*(void *)(a1 + 112) + 1LL);
  if (*(_DWORD *)(a1 + 120) >= 3u)
  {
    unint64_t v6 = 2LL;
    do
    {
      *(_BYTE *)(*(void *)(v5 + 112) + v6) = *(_BYTE *)(*(void *)(a1 + 112) + v6) | *(_BYTE *)(*(void *)(v5 + 112)
                                                                                                 + v6) & 4;
      ++v6;
    }

    while (v6 < *(unsigned int *)(a1 + 120));
  }

  unint64_t v7 = *(unsigned int **)(v5 + 64);
  uint64_t v9 = *(unsigned int **)(v5 + 72);
  uint64_t v8 = (int **)(v5 + 64);
  uint64_t v10 = *(unsigned int **)(a1 + 72);
  if (v7)
  {
    unsigned int v11 = *v7;
    if (*v7)
    {
      *(void *)unint64_t v7 = -1LL;
      unsigned int v12 = *v10;
      if (*v10)
      {
        if (v12 + 1 > 2) {
          uint64_t v13 = v12 + 1;
        }
        else {
          uint64_t v13 = 2LL;
        }
        uint64_t v14 = 1LL;
        unsigned int v15 = v11;
        int v16 = v11;
        do
        {
          unint64_t v17 = 2LL * *(void *)&v10[4 * v14];
          do
          {
            int v18 = v16;
            unint64_t v19 = *(void *)&v7[2 * v16--];
          }

          while (v17 > v19);
          if (v17 == v19)
          {
            *(void *)&v7[2 * v18] = 1LL;
            unsigned int v15 = v16;
          }

          else
          {
            ++v16;
          }

          ++v14;
        }

        while (v14 != v13);
      }

      else
      {
        unsigned int v15 = v11;
      }

      for (unsigned int i = v15 + 1; i <= v11; ++i)
      {
        uint64_t v29 = *(void *)&v7[2 * i];
        if ((v29 & 1) == 0) {
          *(void *)&v7[2 * ++v15] = v29;
        }
      }

      *(void *)unint64_t v7 = v15;
    }
  }

  uint64_t v30 = *(unint64_t **)(a1 + 64);
  if (v30 && *v30)
  {
    unint64_t v31 = 1LL;
    do
    {
      unint64_t v32 = v30[v31];
      if ((v32 & 1) == 0)
      {
        unint64_t v33 = v32 >> 1;
        unsigned int v34 = mdb_mid2l_search(v9, v32 >> 1);
        if (*(void *)v9 >= (unint64_t)v34)
        {
          unint64_t v35 = v34;
          if (*(void *)&v9[4 * v34] == v33)
          {
            free(*(void **)&v9[4 * v34 + 2]);
            uint64_t v36 = *(void *)v9;
            if (*(void *)v9 > v35)
            {
              unsigned int v37 = v35 + 1;
              do
              {
                *(_OWORD *)&v9[4 * v35] = *(_OWORD *)&v9[4 * v37];
                unint64_t v35 = v37;
                uint64_t v36 = *(void *)v9;
              }

              while (*(void *)v9 > (unint64_t)v37++);
            }

            *(void *)uint64_t v9 = v36 - 1;
          }
        }
      }

      unint64_t v31 = (v31 + 1);
      uint64_t v30 = *(unint64_t **)(a1 + 64);
    }

    while (*v30 >= v31);
  }

  uint64_t v39 = *(void *)v9;
  *(void *)uint64_t v9 = 0LL;
  if (*(void *)v5)
  {
    unsigned int v40 = *v10 + v39;
    int v41 = mdb_mid2l_search(v10, *(void *)&v9[4 * v39] + 1LL);
    int v42 = v41 - 1;
    if (v41 != 1 && (_DWORD)v39 != 0)
    {
      int v44 = v39;
      do
      {
        unint64_t v45 = *(void *)&v10[4 * v42];
        int v46 = v44 + 1;
        do
          unint64_t v47 = *(void *)&v9[4 * --v46];
        while (v45 < v47);
        int v48 = v45 == v47;
        v40 -= v48;
        if (!--v42) {
          break;
        }
        int v44 = v46 - v48;
      }

      while (v44);
    }
  }

  else
  {
    unsigned int v40 = 0x1FFFF - *(_DWORD *)(a1 + 128);
  }

  uint64_t v49 = *v10;
  if (*v10)
  {
    unsigned int v50 = v40;
    do
    {
      int v51 = &v10[4 * v49];
      unint64_t v52 = *(void *)v51;
      unsigned int v53 = &v9[4 * v39];
      uint64_t v54 = *(void *)v53;
      if (*(void *)v51 >= *(void *)v53)
      {
        uint64_t v55 = v39;
      }

      else
      {
        do
        {
          *(_OWORD *)&v9[4 * v50--] = *(_OWORD *)v53;
          uint64_t v39 = (v39 - 1);
          unsigned int v53 = &v9[4 * v39];
          uint64_t v54 = *(void *)v53;
        }

        while (v52 < *(void *)v53);
        uint64_t v55 = v39;
      }

      if (v52 == v54)
      {
        LODWORD(v39) = v39 - 1;
        free(*(void **)&v9[4 * v55 + 2]);
      }

      *(_OWORD *)&v9[4 * v50--] = *(_OWORD *)v51;
      --v49;
    }

    while ((_DWORD)v49);
  }

  *(void *)uint64_t v9 = v40;
  free(*(void **)(a1 + 72));
  *(_DWORD *)(v5 + 128) = *(_DWORD *)(a1 + 128);
  __int128 v56 = *(uint64_t **)(a1 + 64);
  if (v56)
  {
    if (*v8)
    {
      uint64_t appended = mdb_midl_append_list((uint64_t **)(v5 + 64), v56);
      if ((_DWORD)appended) {
        *(_DWORD *)(v5 + 124) |= 2u;
      }
      mdb_midl_free(*(void *)(a1 + 64));
      mdb_midl_sort(*v8);
    }

    else
    {
      uint64_t appended = 0LL;
      *uint64_t v8 = (int *)v56;
    }
  }

  else
  {
    uint64_t appended = 0LL;
  }

  __int128 v57 = (void *)(v5 + 48);
  do
  {
    __int128 v58 = v57;
    uint64_t v59 = *v57;
    __int128 v57 = (void *)(*v57 + 48LL);
  }

  while (v59);
  *__int128 v58 = *(void *)(a1 + 48);
  *(_DWORD *)(v5 + 56) += *(_DWORD *)(a1 + 56);
  *(void *)(v5 + 8) = 0LL;
  mdb_midl_free(*(void *)(a1 + 136));
  free((void *)a1);
  return appended;
}

    if (!v26) {
      goto LABEL_58;
    }
  }

  *(_DWORD *)(a1 + 68) &= ~1u;
LABEL_57:
  *(_WORD *)(a1 + 328) = 0;
LABEL_58:
  uint64_t result = mdb_midl_append((unint64_t **)(v7 + 40), *(void *)(*(void *)(a1 + 40) + 40LL));
LABEL_59:
  if ((_DWORD)result) {
LABEL_60:
  }
    *(_DWORD *)(v7 + 124) |= 2u;
LABEL_61:
  *(_DWORD *)(a1 + 68) &= ~1u;
  return result;
}

void mdb_cursors_close(uint64_t a1, int a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 120);
  if ((int)v2 >= 1)
  {
    uint64_t v4 = *(void *)(a1 + 104);
    do
    {
      uint64_t v5 = *(void **)(v4 + 8LL * (v2 - 1));
      while (v5)
      {
        unint64_t v6 = v5;
        uint64_t v5 = (void *)*v5;
        unint64_t v7 = (void *)v6[1];
        if (v7)
        {
          if (a2)
          {
            *(_OWORD *)unint64_t v6 = *(_OWORD *)v7;
            v6[3] = v7[3];
            v6[5] = v7[5];
            v6[7] = v7[7];
            uint64_t v8 = v6[2];
            if (v8) {
              *(void *)(v8 + 24) = v7[3];
            }
          }

          else
          {
            memcpy(v6, (const void *)v6[1], 0x188uLL);
            uint64_t v9 = (void *)v6[2];
            if (v9) {
              memcpy(v9, v7 + 49, 0x1F0uLL);
            }
          }
        }

        else
        {
          unint64_t v7 = v6;
        }

        free(v7);
      }

      *(void *)(v4 + 8LL * (v2 - 1)) = 0LL;
    }

    while (v2-- > 1);
  }

uint64_t mdb_cursor_init(uint64_t result, uint64_t a2, unsigned int a3, uint64_t a4)
{
  *(void *)uint64_t result = 0LL;
  *(void *)(result + 8) = 0LL;
  *(_DWORD *)(result + 32) = a3;
  *(void *)(result + 24) = a2;
  uint64_t v4 = *(void *)(a2 + 80) + 48LL * a3;
  *(void *)(result + 40) = *(void *)(a2 + 88) + 48LL * a3;
  *(void *)(result + 48) = v4;
  uint64_t v5 = (_BYTE *)(*(void *)(a2 + 112) + a3);
  *(void *)(result + 56) = v5;
  *(_DWORD *)(result + 64) = 0;
  *(void *)(result + 72) = 0LL;
  *(_WORD *)(result + 328) = 0;
  int v6 = *(_DWORD *)(a2 + 124) & 0xA0000;
  *(_DWORD *)(result + 68) = v6;
  if ((*(_BYTE *)(*(void *)(a2 + 88) + 48LL * a3 + 4) & 4) != 0)
  {
    *(void *)(result + 16) = a4;
    *(void *)(a4 + 16) = 0LL;
    *(void *)(a4 + 24) = a2;
    *(void *)(a4 + 40) = a4 + 392;
    *(void *)(a4 + 48) = a4 + 440;
    *(_DWORD *)(a4 + 32) = a3;
    *(void *)(a4 + 56) = a4 + 488;
    *(_DWORD *)(a4 + 64) = 0;
    *(_DWORD *)(a4 + 68) = v6 | 4;
    *(void *)(a4 + 440) = 0LL;
    *(void *)(a4 + 448) = 0LL;
    uint64_t v7 = *(void *)(result + 48);
    uint64_t v5 = *(_BYTE **)(result + 56);
    uint64_t v9 = *(void *)(v7 + 24);
    uint64_t v8 = *(void *)(v7 + 32);
    *(void *)(a4 + 456) = v9;
    *(void *)(a4 + 464) = 0LL;
    *(void *)(a4 + 472) = v8;
  }

  else
  {
    *(void *)(result + 16) = 0LL;
  }

  if ((*v5 & 2) != 0) {
    return mdb_page_search(result, 0LL, 2);
  }
  return result;
}

uint64_t mdb_cursor_put(uint64_t a1, size_t *a2, uint64_t a3, int a4)
{
  uint64_t result = 22LL;
  if (!a1 || !a2) {
    return result;
  }
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(v9 + 32);
  if ((a4 & 0x80000) != 0)
  {
    unsigned int v11 = *(_DWORD *)(a3 + 16);
    *(void *)(a3 + 16) = 0LL;
    if ((*(_WORD *)(*(void *)(a1 + 40) + 4LL) & 0x10) == 0) {
      return 4294936512LL;
    }
  }

  else
  {
    unsigned int v11 = 0;
  }

  int v12 = *(_DWORD *)(v9 + 124);
  if ((v12 & 0x20013) != 0)
  {
    if ((v12 & 0x20000) != 0) {
      return 13LL;
    }
    else {
      return 4294936514LL;
    }
  }

  if (*a2 - 512 < 0xFFFFFFFFFFFFFE01LL) {
    return 4294936515LL;
  }
  uint64_t v13 = *(void *)(a1 + 40);
  unint64_t v14 = 511LL;
  if ((*(_WORD *)(v13 + 4) & 4) == 0) {
    unint64_t v14 = 0xFFFFFFFFLL;
  }
  if (*(void *)a3 > v14) {
    return 4294936515LL;
  }
  v124[0] = 0LL;
  if ((a4 & 0x40) != 0)
  {
    unsigned int v17 = *(_DWORD *)(a1 + 68);
    if ((v17 & 1) == 0) {
      return result;
    }
    LODWORD(v16) = 0;
  }

  else if (*(void *)(v13 + 40) == -1LL)
  {
    unsigned int v17 = *(_DWORD *)(a1 + 68) & 0xFFFFFFFE;
    *(_DWORD *)(a1 + 64) = 0;
    *(_DWORD *)(a1 + 68) = v17;
    LODWORD(v16) = -30769;
  }

  else
  {
    LODWORD(v122) = 0;
    if ((a4 & 0x20000) != 0)
    {
      uint64_t v16 = mdb_cursor_last(a1, &v125, v118);
      if (!(_DWORD)v16)
      {
        if ((*(int (**)(size_t *, uint64_t *))(*(void *)(a1 + 48) + 16LL))(a2, &v125) < 1)
        {
          uint64_t v16 = 4294936497LL;
        }

        else
        {
          uint64_t v18 = a1 + 2LL * *(unsigned __int16 *)(a1 + 66);
          ++*(_WORD *)(v18 + 328);
          uint64_t v16 = 4294936498LL;
        }
      }
    }

    else
    {
      uint64_t v15 = mdb_cursor_set(a1, a2, v118, 15, (int *)&v122);
      uint64_t v16 = v15;
      if ((a4 & 0x10) != 0 && !(_DWORD)v15)
      {
        *(_OWORD *)a3 = *(_OWORD *)v118;
        return 4294936497LL;
      }
    }

    if ((_DWORD)v16 != -30798 && (_DWORD)v16) {
      return v16;
    }
    unsigned int v17 = *(_DWORD *)(a1 + 68);
  }

  if ((v17 & 8) != 0) {
    *(_DWORD *)(a1 + 68) = v17 ^ 8;
  }
  if ((a4 & 0x8000) == 0)
  {
    unint64_t v19 = (uint64_t *)a3;
    if ((a4 & 0x80000) != 0)
    {
      uint64_t v125 = *(void *)a3 * v11;
      unint64_t v19 = &v125;
    }

    uint64_t result = mdb_page_spill(a1, a2, v19);
    if ((_DWORD)result) {
      return result;
    }
  }

  unsigned int v20 = a4 & 0xFFFF7FFF;
  if ((_DWORD)v16 == -30769)
  {
    uint64_t result = mdb_page_new(a1, 2, 1, (char **)v118);
    if ((_DWORD)result) {
      return result;
    }
    uint64_t v21 = *(void *)v118;
    uint64_t v22 = *(unsigned __int16 *)(a1 + 64);
    if (v22 < 0x20)
    {
      *(_WORD *)(a1 + 64) = v22 + 1;
      *(_WORD *)(a1 + 66) = v22;
      *(void *)(a1 + 8 * v22 + 72) = v21;
      *(_WORD *)(a1 + 2 * v22 + 328) = 0;
    }

    else
    {
      *(_DWORD *)(*(void *)(a1 + 24) + 124LL) |= 2u;
    }

    uint64_t v24 = *(void *)(a1 + 40);
    *(void *)(v24 + 40) = *(void *)v21;
    ++*(_WORD *)(v24 + 6);
    **(_BYTE **)(a1 + 56) |= 1u;
    __int16 v23 = *(_WORD *)(*(void *)(a1 + 40) + 4LL);
    if ((v23 & 0x14) == 0x10) {
      *(_WORD *)(v21 + 10) |= 0x20u;
    }
    *(_DWORD *)(a1 + 68) |= 1u;
LABEL_51:
    if ((v23 & 4) == 0 || *a2 + *(void *)a3 + 8 <= *(unsigned int *)(v10 + 220))
    {
      uint64_t v109 = 0LL;
      int v110 = 0;
      uint64_t v27 = 0LL;
      __int128 v28 = (size_t *)a3;
      goto LABEL_128;
    }

    int v112 = v16;
    int v110 = 0;
    uint64_t v25 = *(char **)(v10 + 88);
    *((_WORD *)v25 + 4) = *(void *)a3;
    *((_DWORD *)v25 + 3) = 1048592;
    size_t v122 = 16LL;
    __int16 v26 = 18;
    goto LABEL_111;
  }

  uint64_t result = mdb_cursor_touch(a1);
  if ((_DWORD)result) {
    return result;
  }
  if ((_DWORD)v16)
  {
    __int16 v23 = *(_WORD *)(*(void *)(a1 + 40) + 4LL);
    goto LABEL_51;
  }

  uint64_t v29 = *(unsigned __int16 *)(a1 + 66);
  uint64_t v30 = *(void *)(a1 + 8 * v29 + 72);
  unint64_t v31 = *(unsigned int **)(a1 + 40);
  if ((*(_WORD *)(v30 + 10) & 0x20) != 0)
  {
    uint64_t v32 = *v31;
    size_t v33 = *a2;
    if (*a2 == v32)
    {
      unsigned int v34 = (void *)(v30 + v32 * *(unsigned __int16 *)(a1 + 2 * v29 + 328) + 16);
      unint64_t v35 = (const void *)a2[1];
LABEL_59:
      memcpy(v34, v35, v33);
      uint64_t v36 = *(unsigned __int16 *)(a1 + 66);
      if (*(_WORD *)(a1 + 66) && !*(_WORD *)(a1 + 2 * v36 + 328))
      {
        int v37 = v36 - 1;
        *(_WORD *)(a1 + 66) = v36 - 1;
        if ((_WORD)v36 == 1)
        {
          LOWORD(v37) = 0;
          LOWORD(v36) = 1;
        }

        else
        {
          __int16 v38 = 1;
          while (!*(_WORD *)(a1 + 2LL * (unsigned __int16)v37 + 328))
          {
            *(_WORD *)(a1 + 66) = --v37;
            ++v38;
            if (!(_WORD)v37)
            {
              LOWORD(v37) = 0;
              goto LABEL_68;
            }
          }

          LOWORD(v36) = v38;
        }

LABEL_68:
        if (*(_WORD *)(a1 + 2LL * (unsigned __int16)v37 + 328))
        {
          uint64_t result = mdb_update_key(a1, (uint64_t)a2);
          *(_WORD *)(a1 + 66) += v36;
          if ((_DWORD)result) {
            return result;
          }
        }

        else
        {
          *(_WORD *)(a1 + 66) = v37 + v36;
        }
      }

      return 0LL;
    }

    return 4294936515LL;
  }

  unsigned int v114 = a4 & 0xFFFF7FFF;
  uint64_t v109 = 0LL;
  int v110 = 0;
  uint64_t v27 = 0LL;
  while (1)
  {
    uint64_t v39 = (unsigned int *)(v30 + *(unsigned __int16 *)(v30 + 2LL * *(unsigned __int16 *)(a1 + 2 * v29 + 328) + 16));
    size_t v122 = *v39;
    id v123 = (char *)v39 + *((unsigned __int16 *)v39 + 3) + 8;
    if ((v31[1] & 4) != 0)
    {
      unsigned int v40 = *(char **)(v10 + 88);
      id v126 = v40;
      __int128 v127 = v40;
      *(void *)unsigned int v40 = *(void *)v30;
      __int16 v41 = *((_WORD *)v39 + 2);
      if ((v41 & 4) != 0)
      {
        if ((v41 & 2) != 0)
        {
          unsigned int v108 = v27;
          int v113 = 0;
          unsigned int v20 = v114 | 6;
          goto LABEL_161;
        }

        uint64_t v25 = v123;
        if (v114 == 64) {
          goto LABEL_201;
        }
        if ((*(_WORD *)(*(void *)(a1 + 40) + 4LL) & 0x10) != 0)
        {
          unsigned int v62 = *((unsigned __int16 *)v123 + 4);
          if (v62 <= (unsigned __int16)(*((_WORD *)v123 + 7) - *((_WORD *)v123 + 6)))
          {
LABEL_201:
            unsigned int v108 = v27;
            int v113 = 0;
            *((_WORD *)v123 + 5) |= 0x10u;
            *(_WORD *)uint64_t v25 = *(_WORD *)v40;
            *((_WORD *)v25 + 1) = *((_WORD *)v40 + 1);
            *((_WORD *)v25 + 2) = *((_WORD *)v40 + 2);
            *((_WORD *)v25 + 3) = *((_WORD *)v40 + 3);
            *(void *)(*(void *)(a1 + 16) + 72LL) = v25;
            unsigned int v20 = v114 | 4;
            goto LABEL_161;
          }

          unsigned int v48 = 4 * v62;
        }

        else
        {
          unsigned int v48 = (*(_DWORD *)a3 + 11) & 0xFFFFFFFE;
        }

        size_t v60 = v122;
        size_t v61 = v122 + v48;
        uint64_t v125 = v61;
        __int16 v26 = *((_WORD *)v123 + 5);
        goto LABEL_109;
      }

      if (v114 != 64)
      {
        int v42 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 48) + 24LL);
        if (v42(a3, (uint64_t)&v122))
        {
          size_t v44 = v122;
          v124[0] = v122;
          memcpy(v40 + 24, v123, v122);
          v124[1] = v40 + 24;
          *((_WORD *)v40 + 5) = 82;
          *((_WORD *)v40 + 6) = 16;
          uint64_t v45 = *(void *)a3;
          uint64_t v46 = v44 + *(void *)a3 + 16;
          if ((*(_BYTE *)(*(void *)(a1 + 40) + 4LL) & 0x10) != 0)
          {
            __int16 v26 = 114;
            *((_WORD *)v40 + 5) = 114;
            *((_WORD *)v40 + 4) = v45;
            uint64_t v47 = 2 * v45;
          }

          else
          {
            uint64_t v47 = ((*(void *)a3 & 1LL) + (v44 & 1)) | 0x14;
            __int16 v26 = 82;
          }

          LOWORD(v48) = 0;
          size_t v60 = v47 + v46;
          uint64_t v125 = v60;
          *((_WORD *)v40 + 7) = v60;
          size_t v122 = v60;
          size_t v61 = v60;
          uint64_t v25 = v40;
LABEL_109:
          int v112 = 0;
          if (*((unsigned __int16 *)v39 + 3) + v61 + 8 <= *(unsigned int *)(v10 + 220))
          {
            int v65 = v114;
          }

          else
          {
            int v112 = 0;
            v26 &= ~0x40u;
            unsigned int v20 = v114;
LABEL_111:
            uint64_t v63 = *(void *)(a1 + 40);
            if ((*(_WORD *)(v63 + 4) & 0x10) != 0)
            {
              v26 |= 0x20u;
              *(_DWORD *)unint64_t v118 = *((unsigned __int16 *)v25 + 4);
              *(_WORD *)&v118[4] = 16;
              if ((*(_WORD *)(v63 + 4) & 0x20) != 0) {
                __int16 v64 = 24;
              }
              else {
                __int16 v64 = 16;
              }
              *(_WORD *)&v118[4] = v64;
            }

            else
            {
              *(_DWORD *)unint64_t v118 = 0;
              *(_WORD *)&v118[4] = 0;
            }

            *(_WORD *)&v118[6] = 1;
            *(_OWORD *)&v118[8] = xmmword_100017AE0;
            uint64_t v119 = 0LL;
            uint64_t v120 = (*((unsigned __int16 *)v25 + 6) - 16) >> 1;
            uint64_t v125 = 48LL;
            id v126 = v118;
            uint64_t result = mdb_page_alloc(a1, 1, &v127);
            if ((_DWORD)result) {
              return result;
            }
            size_t v60 = v122;
            unsigned int v48 = *(_DWORD *)(v10 + 16) - v122;
            int v65 = v20 | 6;
            unsigned int v40 = v127;
            uint64_t v121 = *(void *)v127;
            uint64_t v109 = v127;
          }

          if (v40 != v25)
          {
            *((_WORD *)v40 + 5) = v26 | 0x10;
            *((_WORD *)v40 + 4) = *((_WORD *)v25 + 4);
            *((_WORD *)v40 + 6) = *((_WORD *)v25 + 6);
            unsigned __int16 v66 = *((_WORD *)v25 + 7) + v48;
            *((_WORD *)v40 + 7) = v66;
            if ((v26 & 0x20) != 0)
            {
              memcpy( v40 + 16,  v25 + 16,  ((*((unsigned __int16 *)v25 + 6) - 16) >> 1) * *((unsigned __int16 *)v25 + 4));
            }

            else
            {
              memcpy(&v40[v66], &v25[*((unsigned __int16 *)v25 + 7)], v60 - *((unsigned __int16 *)v25 + 7));
              memcpy(v40 + 16, v25 + 16, (*((unsigned __int16 *)v25 + 6) - 16) & 0xFFFFFFFE);
              if ((*((_WORD *)v25 + 6) & 0xFFFE) != 0x10)
              {
                unint64_t v67 = 0LL;
                do
                  *(_WORD *)&v40[2 * v67++ + 16] += v48;
                while (v67 < (*((unsigned __int16 *)v25 + 6) - 16) >> 1);
              }
            }
          }

          unsigned int v20 = v65 | 4;
          __int128 v28 = (size_t *)&v125;
          uint64_t v27 = 1LL;
          LODWORD(v16) = v112;
          if (!v112)
          {
            mdb_node_del((void *)a1, 0);
            __int128 v28 = (size_t *)&v125;
          }

          goto LABEL_128;
        }

        if ((v114 & 0x40020) != 0) {
          return 4294936497LL;
        }
      }
    }

    int v49 = *((unsigned __int16 *)v39 + 2);
    if (((v114 ^ v49) & 2) != 0) {
      return 4294936512LL;
    }
    if ((v49 & 1) == 0)
    {
      size_t v50 = *(void *)a3;
      if (*(void *)a3 == v122)
      {
        if ((v114 & 0x10000) != 0)
        {
          uint64_t result = 0LL;
          int v105 = v123;
LABEL_216:
          *(void *)(a3 + 8) = v105;
          return result;
        }

        if ((*(_BYTE *)(a1 + 68) & 4) != 0)
        {
          size_t v33 = *a2;
          unint64_t v35 = (const void *)a2[1];
          unsigned int v34 = v39 + 2;
          goto LABEL_59;
        }

        int v51 = v123;
        unint64_t v52 = *(const void **)(a3 + 8);
        goto LABEL_219;
      }

      goto LABEL_103;
    }

    uint64_t v53 = v27;
    uint64_t v54 = *(void *)a3;
    unint64_t v55 = *(unsigned int *)(v10 + 16);
    unint64_t v56 = *(void *)v123;
    uint64_t result = mdb_page_get(a1, *(void *)v123, (unint64_t *)&v117, &v116);
    if ((_DWORD)result) {
      return result;
    }
    int v57 = (v54 + 15) / v55 + 1;
    __int128 v58 = v117;
    uint64_t v59 = *((int *)v117 + 3);
    if ((int)v59 >= v57)
    {
      if ((*((_WORD *)v117 + 5) & 0x10) != 0) {
        break;
      }
      if (v116 || (*(_BYTE *)(v10 + 14) & 8) != 0)
      {
        uint64_t result = mdb_page_unspill(*(void *)(a1 + 24), (uint64_t)v117, &v117);
        if ((_DWORD)result) {
          return result;
        }
        int v116 = 0;
        __int128 v58 = v117;
        if ((*((_WORD *)v117 + 5) & 0x10) != 0) {
          break;
        }
      }
    }

    uint64_t result = mdb_ovpage_free(a1, (uint64_t)v58);
    uint64_t v27 = v53;
    if ((_DWORD)result) {
      return result;
    }
LABEL_103:
    mdb_node_del((void *)a1, 0);
    LODWORD(v16) = 0;
    __int128 v28 = (size_t *)a3;
    unsigned int v20 = v114;
LABEL_128:
    uint64_t v68 = *(unsigned __int16 *)(a1 + 66);
    BOOL v69 = *(_WORD **)(a1 + 8 * v68 + 72);
    unint64_t v70 = *a2;
    if ((v69[5] & 0x20) == 0)
    {
      unint64_t v71 = v70 + *v28 + 8;
      uint64_t v72 = 8 - *v28;
      unint64_t v70 = (v71 + v72 + 3) & 0xFFFFFFFFFFFFFFFELL;
    }

    if (v70 <= (unsigned __int16)(v69[7] - v69[6]))
    {
      uint64_t result = mdb_node_add(a1, *(unsigned __int16 *)(a1 + 2 * v68 + 328), (const void **)a2, v28, 0LL, v20 & 0x30006);
      if ((_DWORD)result) {
        goto LABEL_206;
      }
      unsigned __int32 v75 = *(void **)(*(void *)(*(void *)(a1 + 24) + 104LL) + 8LL * *(unsigned int *)(a1 + 32));
      if (v75)
      {
        uint64_t v76 = *(unsigned __int16 *)(a1 + 66);
        uint64_t v77 = *(void *)(a1 + 8 * v76 + 72);
        int v78 = *(_DWORD *)(a1 + 68);
        do
        {
          uint64_t v79 = v75;
          if ((v78 & 4) != 0) {
            uint64_t v79 = (void *)v75[2];
          }
          if (v79 != (void *)a1
            && *((unsigned __int16 *)v79 + 32) >= *(unsigned __int16 *)(a1 + 64)
            && v79[v76 + 9] == v77)
          {
            uint64_t v80 = (char *)v79 + 2 * v76;
            unsigned int v81 = *((unsigned __int16 *)v80 + 164);
            if ((_DWORD)v16 && v81 >= *(unsigned __int16 *)(a1 + 2 * v76 + 328))
            {
              LOWORD(v81) = v81 + 1;
              *((_WORD *)v80 + 164) = v81;
            }

            uint64_t v82 = v79[2];
            if (v82)
            {
              if ((*(_BYTE *)(v82 + 68) & 1) != 0
                && (*(unsigned __int16 *)(v77 + 12) - 16) >> 1 > (unsigned __int16)v81)
              {
                uint64_t v83 = v77 + *(unsigned __int16 *)(v77 + 2LL * (unsigned __int16)v81 + 16);
                if ((*(_WORD *)(v83 + 4) & 6) == 4) {
                  *(void *)(v82 + 72) = v83 + *(unsigned __int16 *)(v83 + 6) + 8;
                }
              }
            }
          }

          unsigned __int32 v75 = (void *)*v75;
        }

        while (v75);
      }
    }

    else
    {
      if ((v20 & 6) == 4) {
        int v73 = v20 & 0x10006;
      }
      else {
        int v73 = v20 & 0x30006;
      }
      if ((_DWORD)v16) {
        int v74 = v73;
      }
      else {
        int v74 = v73 | 0x40000;
      }
      uint64_t result = mdb_page_split(a1, (uint64_t)a2, v28, 0xFFFFFFFFFFFFFFFFLL, v74);
      if ((_DWORD)result) {
        goto LABEL_206;
      }
    }

    if (!(_DWORD)v27)
    {
      uint64_t result = 0LL;
      int v98 = v16;
      goto LABEL_192;
    }

    int v113 = v16;
    unsigned int v108 = 1;
LABEL_161:
    uint64_t v125 = 0LL;
    id v126 = (char *)&unk_10001870B;
    uint64_t v111 = *(void *)(a1 + 8LL * *(unsigned __int16 *)(a1 + 66) + 72)
         + *(unsigned __int16 *)(*(void *)(a1 + 8LL * *(unsigned __int16 *)(a1 + 66) + 72)
    uint64_t v84 = 32832LL;
    if ((v20 & 0x40040) != 0x40)
    {
      mdb_xcursor_init1(a1, v111);
      if ((v20 & 0x20) != 0) {
        uint64_t v84 = 32784LL;
      }
      else {
        uint64_t v84 = 0x8000LL;
      }
    }

    if (v109) {
      *(void *)(*(void *)(a1 + 16) + 72LL) = v109;
    }
    int v107 = v124[0];
    if (v124[0])
    {
      LODWORD(result) = mdb_cursor_put(*(void *)(a1 + 16), v124, &v125, v84);
      if ((_DWORD)result) {
        goto LABEL_203;
      }
      v124[0] = 0LL;
    }

    if (v109 || (*(_WORD *)(v111 + 4) & 2) == 0)
    {
      uint64_t v85 = *(void *)(*(void *)(*(void *)(a1 + 24) + 104LL) + 8LL * *(unsigned int *)(a1 + 32));
      if (v85)
      {
        uint64_t v86 = *(void *)(a1 + 16);
        uint64_t v87 = *(unsigned __int16 *)(a1 + 66);
        uint64_t v88 = *(void *)(a1 + 8 * v87 + 72);
        do
        {
          if (v85 != a1
            && *(unsigned __int16 *)(v85 + 64) >= *(unsigned __int16 *)(a1 + 64)
            && (*(_BYTE *)(v85 + 68) & 1) != 0
            && *(void *)(v85 + 8 * v87 + 72) == v88)
          {
            unsigned int v89 = *(unsigned __int16 *)(v85 + 2 * v87 + 328);
            if (v89 == *(unsigned __int16 *)(a1 + 2 * v87 + 328))
            {
              unsigned int v106 = v11;
              uint64_t v90 = v84;
              uint64_t v91 = v88;
              mdb_xcursor_init2(v85, v86, v107);
              uint64_t v88 = v91;
              uint64_t v84 = v90;
              unsigned int v11 = v106;
            }

            else if (!v113)
            {
              uint64_t v92 = *(void *)(v85 + 16);
              if (v92)
              {
                if ((*(_BYTE *)(v92 + 68) & 1) != 0 && v89 < (*(unsigned __int16 *)(v88 + 12) - 16) >> 1)
                {
                  uint64_t v93 = v88 + *(unsigned __int16 *)(v88 + 2LL * *(unsigned __int16 *)(v85 + 2 * v87 + 328) + 16);
                  if ((*(_WORD *)(v93 + 4) & 6) == 4) {
                    *(void *)(v92 + 72) = v93 + *(unsigned __int16 *)(v93 + 6) + 8;
                  }
                }
              }
            }
          }

          uint64_t v85 = *(void *)v85;
        }

        while (v85);
      }
    }

    uint64_t v94 = *(void *)(a1 + 16);
    uint64_t v16 = *(void *)(v94 + 424);
    uint64_t result = mdb_cursor_put(v94, a3, &v125, v84 | (v20 >> 1) & 0x20000);
    if ((v20 & 2) != 0)
    {
      uint64_t v95 = v111 + *(unsigned __int16 *)(v111 + 6);
      __int128 v97 = *(_OWORD *)(*(void *)(a1 + 16) + 408LL);
      __int128 v96 = *(_OWORD *)(*(void *)(a1 + 16) + 424LL);
      *(_OWORD *)(v95 + 8) = *(_OWORD *)(*(void *)(a1 + 16) + 392LL);
      *(_OWORD *)(v95 + 24) = v97;
      *(_OWORD *)(v95 + 40) = v96;
    }

    int v98 = *(_DWORD *)(*(void *)(a1 + 16) + 424LL) - v16;
    LODWORD(v16) = v113;
    uint64_t v27 = v108;
LABEL_192:
    if (v98) {
      ++*(void *)(*(void *)(a1 + 40) + 32LL);
    }
    if ((_DWORD)v16)
    {
      if ((_DWORD)result)
      {
LABEL_203:
        if ((_DWORD)result == -30799) {
          uint64_t result = 4294936517LL;
        }
        else {
          uint64_t result = result;
        }
LABEL_206:
        *(_DWORD *)(*(void *)(a1 + 24) + 124LL) |= 2u;
        return result;
      }

      *(_DWORD *)(a1 + 68) |= 1u;
    }

    if ((v20 & 0x80000) == 0 || (_DWORD)result) {
      return result;
    }
    uint64_t v99 = (v110 + 1);
    *(void *)(a3 + 16) = v99;
    ++v110;
    unsigned int v114 = v20;
    *(void *)(a3 + 8) += *(void *)a3;
    uint64_t v29 = *(unsigned __int16 *)(a1 + 66);
    uint64_t v30 = *(void *)(a1 + 8 * v29 + 72);
    unint64_t v31 = *(unsigned int **)(a1 + 40);
  }

  if (v116 <= 1)
  {
    int v104 = v114 & 0x10000;
    v102 = v58;
    goto LABEL_214;
  }

  uint64_t v100 = *(unsigned int *)(v10 + 16);
  uint64_t v101 = mdb_page_malloc(*(void *)(a1 + 24), v59);
  if (v101)
  {
    v102 = v101;
    size_t v103 = v100 * v59;
    v115[0] = v56;
    v115[1] = (unint64_t)v101;
    mdb_mid2l_insert(*(unsigned int **)(*(void *)(a1 + 24) + 72LL), v115);
    int v104 = v114 & 0x10000;
    if ((v114 & 0x10000) == 0)
    {
      memcpy( &v102[(*(void *)a3 & 0xFFFFFFFFFFFFFFF8LL) + 16],  &v58[(*(void *)a3 & 0xFFFFFFFFFFFFFFF8LL) + 16],  v103 - ((*(void *)a3 & 0xFFFFFFFFFFFFFFF8LL) + 16));
      size_t v103 = 16LL;
    }

    memcpy(v102, v58, v103);
LABEL_214:
    size_t v50 = *(void *)a3;
    *uint64_t v39 = *(void *)a3;
    int v105 = v102 + 16;
    if (v104)
    {
      uint64_t result = 0LL;
      goto LABEL_216;
    }

    unint64_t v52 = *(const void **)(a3 + 8);
    int v51 = v102 + 16;
LABEL_219:
    memcpy(v51, v52, v50);
    return 0LL;
  }

  return 12LL;
}

      uint64_t v24 = v166;
      if (v65 == v44)
      {
        id v43 = *v64;
        uint64_t v84 = v64[1];
        *(void *)&v196[0] = *v64;
        *((void *)&v196[0] + 1) = v84;
        v173 = v44;
      }

      else
      {
        v173 = v65;
        uint64_t v85 = v12 + *(unsigned __int16 *)&v42[2 * v65 + 16];
        id v43 = *(unsigned __int16 *)(v85 + 6);
        *(void *)&v196[0] = v43;
        *((void *)&v196[0] + 1) = v85 + 8;
      }

      goto LABEL_71;
    }

    uint64_t result = 12LL;
LABEL_177:
    *(_DWORD *)(*(void *)(a1 + 24) + 124LL) |= 2u;
    return result;
  }

  uint64_t v46 = *(unsigned __int16 *)(a1 + 2LL * (unsigned __int16)v17 + 328);
  uint64_t v47 = v46 - v27;
  id v43 = **(unsigned int **)(a1 + 40);
  unsigned int v48 = v12 + 16 + v43 * v27;
  int v49 = v43 * (v26 - v27);
  *(_WORD *)(v12 + 12) -= 2 * (v26 - v27);
  *((_WORD *)v178 + 6) += 2 * (v26 - v27);
  size_t v50 = v43 * (v26 - v27) - 2 * (v26 - v27);
  *(_WORD *)(v12 + 14) += v50;
  *((_WORD *)v178 + 7) -= v50;
  *(void *)&v196[0] = v43;
  int v51 = v48;
  if (v27 == (_DWORD)v176) {
    int v51 = *(void *)(v179 + 8);
  }
  *((void *)&v196[0] + 1) = v51;
  v164 = v28;
  v173 = ((v25 >> 1) + 1) >> 1;
  if (v47 < 0)
  {
    unint64_t v55 = (char *)(v12 + 16 + v43 * *(unsigned __int16 *)(a1 + 328 + 2LL * *(unsigned __int16 *)(a1 + 66)));
    memcpy(v178 + 16, (const void *)(v12 + 16 + v43 * v27), v49);
    *((void *)&v196[0] + 1) = v178 + 16;
    memmove( &v55[v43],  v55,  ((((v25 >> 1) + 1) >> 1) - *(unsigned __int16 *)(a1 + 328 + 2LL * *(unsigned __int16 *)(a1 + 66)))
    * v43);
    unint64_t v56 = v55;
    __int128 v28 = v164;
    memcpy(v56, *(const void **)(v179 + 8), v43);
    size_t v44 = v176;
    __int16 v23 = (size_t *)v178;
    __int16 v41 = v172;
    int v42 = 0LL;
    *(_WORD *)(v12 + 12) += 2;
    *(_WORD *)(v12 + 14) = *(_WORD *)(v12 + 14) - v43 + 2;
    uint64_t v45 = v18;
    uint64_t v24 = v166;
  }

  else
  {
    unint64_t v52 = (v47 * v43);
    if (v46 != v27)
    {
      memcpy(v178 + 16, (const void *)(v12 + 16 + v43 * v27), (v47 * v43));
      __int16 v23 = (size_t *)v178;
    }

    int v57 = (char *)v23 + v52 + 16;
    memcpy(v57, *(const void **)(v179 + 8), v43);
    memcpy(&v57[v43], (const void *)(v48 + v52), (v49 - v52));
    __int16 v23 = (size_t *)v178;
    int v42 = 0LL;
    *((_WORD *)v178 + 6) += 2;
    *((_WORD *)v178 + 7) = *((_WORD *)v178 + 7) - v43 + 2;
    *(_WORD *)(a1 + 2LL * *(unsigned __int16 *)(a1 + 66) + 328) = v47;
    __int128 v28 = v164;
    uint64_t v24 = v166;
    uint64_t v45 = v18;
    size_t v44 = v176;
    __int16 v41 = v172;
  }

uint64_t mdb_freelist_save(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(int *)(v2 + 216);
  unint64_t v51 = 0LL;
  mdb_cursor_init((uint64_t)v52, a1, 0, 0LL);
  uint64_t v4 = (uint64_t **)(v2 + 176);
  if (!*(void *)(v2 + 176)) {
    goto LABEL_95;
  }
  uint64_t result = mdb_page_search((uint64_t)v52, 0LL, 5);
  if ((_DWORD)result && (_DWORD)result != -30798) {
    return result;
  }
  if (!*v4)
  {
LABEL_95:
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 72);
      uint64_t result = mdb_midl_need((_DWORD **)(a1 + 40), *(_DWORD *)(a1 + 56));
      if ((_DWORD)result) {
        return result;
      }
      do
      {
        uint64_t v8 = *(uint64_t **)(a1 + 40);
        uint64_t v9 = *v8 + 1;
        *uint64_t v8 = v9;
        v8[v9] = *(void *)v6;
        if ((*(_BYTE *)(a1 + 126) & 8) != 0)
        {
          if (*(void *)v7)
          {
            unint64_t v10 = 1LL;
            do
            {
              if (*(void *)(v7 + 16 * v10) == *(void *)v6) {
                break;
              }
              unint64_t v10 = (v10 + 1);
            }

            while (*(void *)v7 >= v10);
          }

          else
          {
            LODWORD(std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100]( v11, v10) = 1;
          }
        }

        else
        {
          LODWORD(std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100]( v11, v10) = mdb_mid2l_search((unsigned int *)v7, *(void *)v6);
          if ((*(_WORD *)(v6 + 10) & 4) != 0 && *(_DWORD *)(v6 + 12) != 1)
          {
            free((void *)v6);
          }

          else
          {
            *(void *)uint64_t v6 = *(void *)(v2 + 192);
            *(void *)(v2 + 192) = v6;
          }
        }

        *(void *)(v7 + 16LL * v10 + 8) = 0LL;
        uint64_t v6 = *(void *)(v6 + 48);
      }

      while (v6);
      unint64_t v11 = *(void *)v7;
      if (*(void *)(v7 + 24))
      {
        unint64_t v12 = 1LL;
        while (v11 >= v12)
        {
          unint64_t v12 = (v12 + 1);
          unsigned int v13 = v12;
        }

        unsigned int v13 = v12;
      }

      else
      {
        unsigned int v13 = 1;
        unint64_t v12 = 1LL;
      }

LABEL_27:
      if (v11 >= v12)
      {
        LODWORD(v15) = v13;
        while (1)
        {
          do
          {
            unint64_t v15 = (v15 + 1);
            else {
              BOOL v16 = v11 >= v15;
            }
          }

          while (v16);
          if (v11 < v15) {
            break;
          }
          *(_OWORD *)(v7 + 16LL * v13++) = *(_OWORD *)(v7 + 16 * v15);
          unint64_t v11 = *(void *)v7;
        }

        uint64_t v14 = v13 - 1;
      }

      else
      {
        uint64_t v14 = 0LL;
      }

      *(void *)uint64_t v7 = v14;
      *(void *)(a1 + 48) = 0LL;
      *(_DWORD *)(a1 + 56) = 0;
    }
  }

  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  unint64_t v19 = 0LL;
  unint64_t v20 = 0LL;
  uint64_t v21 = *(_DWORD *)(v2 + 12) & 0x1080000;
  int v45 = 1;
  while (1)
  {
LABEL_39:
    if (v20 < *(void *)(v2 + 184))
    {
      while (1)
      {
        uint64_t result = mdb_cursor_first((uint64_t)v52, &v49, 0LL);
        if ((_DWORD)result) {
          return result;
        }
        unint64_t v20 = *v50;
        unint64_t v51 = *v50;
        uint64_t result = mdb_cursor_del((uint64_t)v52, 0);
        if ((_DWORD)result) {
          return result;
        }
        if (v20 >= *(void *)(v2 + 184))
        {
          uint64_t v17 = 0LL;
          uint64_t v18 = 0LL;
          break;
        }
      }
    }

    if (v19 < **(void **)(a1 + 40))
    {
      if (v19 || (uint64_t result = mdb_page_search((uint64_t)v52, 0LL, 9), !(_DWORD)result) || (_DWORD)result == -30798)
      {
        uint64_t v22 = *(unint64_t **)(a1 + 40);
        size_t v49 = 8LL;
        size_t v50 = (unint64_t *)(a1 + 24);
        unint64_t v23 = *v22;
        while (1)
        {
          unint64_t v19 = v23;
          size_t v47 = 8 * v23 + 8;
          uint64_t result = mdb_cursor_put((uint64_t)v52, &v49, (uint64_t)&v47, 0x10000);
          if ((_DWORD)result) {
            break;
          }
          uint64_t v24 = *(unint64_t **)(a1 + 40);
          unint64_t v23 = *v24;
          if (v19 >= *v24)
          {
            mdb_midl_sort(*(int **)(a1 + 40));
            memcpy(v48, v24, v47);
            goto LABEL_39;
          }
        }
      }

      return result;
    }

    uint64_t v25 = *v4;
    uint64_t v26 = v21;
    uint64_t v27 = *v4 ? *v25 : 0LL;
    uint64_t v28 = *(int *)(a1 + 56);
    uint64_t v29 = v27 + v28;
    if (v18 >= v27 + v28) {
      break;
    }
    unint64_t v30 = v51;
    if (v17 >= v3 && v51 >= 2)
    {
      uint64_t v17 = 0LL;
      unint64_t v30 = --v51;
    }

LABEL_64:
    uint64_t v32 = v18 - v17;
    uint64_t v33 = v29 - (v18 - v17);
    if (v33 > v3 && v30 >= 2) {
      uint64_t v17 = v3 + (uint64_t)(v33 / v30) / ((int)v3 + 1) * ((int)v3 + 1);
    }
    else {
      uint64_t v17 = v33 & ~(v33 >> 63);
    }
    uint64_t v21 = v26;
    size_t v49 = 8LL;
    size_t v50 = &v51;
    size_t v47 = 8 * v17 + 8;
    uint64_t result = mdb_cursor_put((uint64_t)v52, &v49, (uint64_t)&v47, 0x10000);
    if ((_DWORD)result) {
      return result;
    }
    if (v17 > v3 && (_DWORD)v21 == 0) {
      uint64_t v36 = v17;
    }
    else {
      uint64_t v36 = 0LL;
    }
    bzero(&v48[v36 & (v36 >> 63)], 8 * (v36 - (v36 & (v36 >> 63))) + 8);
    uint64_t v18 = v17 + v32;
  }

  if (v18 != v27 + v28 && v45 >= 1)
  {
    --v45;
    unint64_t v30 = v51;
    goto LABEL_64;
  }

  int v37 = *(void **)(a1 + 48);
  if (v37)
  {
    uint64_t v38 = *(unsigned int *)(a1 + 56);
    uint64_t result = mdb_midl_need((_DWORD **)(v2 + 176), (2 * v28) | 1);
    if ((_DWORD)result) {
      return result;
    }
    uint64_t v25 = *v4;
    uint64_t v39 = (int *)&(*v4)[*(*v4 - 1) - v38];
    unsigned int v40 = 1;
    do
    {
      unsigned int v41 = v40;
      *(void *)&v39[2 * v40] = *v37;
      int v37 = (void *)v37[6];
      ++v40;
    }

    while (v37);
    *(void *)uint64_t v39 = v41;
    mdb_midl_sort(v39);
    mdb_midl_xmerge(v25, (uint64_t *)v39);
    *(void *)(a1 + 48) = 0LL;
    *(_DWORD *)(a1 + 56) = 0;
    uint64_t v29 = *v25;
  }

  if (!v29) {
    return 0LL;
  }
  uint64_t result = mdb_cursor_first((uint64_t)v52, &v49, &v47);
  if (!(_DWORD)result)
  {
    int v42 = &v25[v29];
    do
    {
      unint64_t v46 = *v50;
      int64_t v43 = (v47 >> 3) - 1;
      size_t v50 = &v46;
      if (v43 > v29)
      {
        size_t v47 = 8 * v29 + 8;
        int64_t v43 = v29;
      }

      v42 -= v43;
      unsigned int v48 = v42;
      int64_t v44 = *v42;
      *int v42 = v43;
      uint64_t result = mdb_cursor_put((uint64_t)v52, &v49, (uint64_t)&v47, 64);
      *int v42 = v44;
      if ((_DWORD)result) {
        break;
      }
      v29 -= v43;
      if (!v29) {
        break;
      }
      uint64_t result = mdb_cursor_next((uint64_t)v52, &v49, &v47, 8);
    }

    while (!(_DWORD)result);
  }

  return result;
}

uint64_t mdb_page_flush(uint64_t a1, int a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(uint64_t **)(a1 + 72);
  uint64_t v5 = *v4;
  if ((*(_BYTE *)(v3 + 14) & 8) == 0)
  {
    uint64_t v37 = *(void *)(a1 + 32);
    unint64_t v6 = 0LL;
    off_t v7 = 0LL;
    uint64_t v8 = 0LL;
    size_t v9 = 0LL;
    off_t v10 = 0LL;
    int v11 = 0;
    unint64_t v12 = *(unsigned int *)(v3 + 16);
    int v13 = *(_DWORD *)v3;
    unsigned int v41 = *(uint64_t **)(a1 + 72);
    uint64_t v42 = (int)v5;
    int v38 = v5 + 1;
    uint64_t v14 = 1LL;
    int v39 = 1 - v5;
    uint64_t v40 = *v4;
    int v35 = a2;
    int v15 = a2;
    while (1)
    {
      if (v15 >= (int)v5)
      {
        BOOL v19 = 0;
        LODWORD(v20) = v15++;
      }

      else
      {
        uint64_t v16 = v15 + 1LL;
        uint64_t v17 = &v4[2 * v16];
        uint64_t v8 = v17[1];
        unsigned int v18 = *(unsigned __int16 *)(v8 + 10);
        if (v18 >= 0x4000)
        {
          uint64_t v16 = 0LL;
          while (1)
          {
            *(_WORD *)(v8 + 10) = v18 & 0x7FFF;
            *uint64_t v17 = 0LL;
            if (!(v39 + v15 + (_DWORD)v16)) {
              break;
            }
            uint64_t v8 = v17[3];
            unsigned int v18 = *(unsigned __int16 *)(v8 + 10);
            v17 += 2;
            ++v16;
            if (v18 < 0x4000)
            {
              uint64_t v21 = v15 + v16;
              BOOL v19 = v21 < v42;
              LODWORD(v20) = v15 + v16;
              LODWORD(v16) = v21 + 1;
              goto LABEL_11;
            }
          }

          BOOL v19 = v15 + v16 + 1 < v42;
          LODWORD(v20) = v15 + v16 + 1;
          int v15 = v38;
        }

        else
        {
          BOOL v19 = 1;
          LODWORD(v20) = v15;
LABEL_11:
          int v15 = v16;
          uint64_t v22 = *v17;
          *(_WORD *)(v8 + 10) = v18 & 0x3FEF;
          off_t v7 = v22 * v12;
          if ((v18 & 4) != 0) {
            unint64_t v6 = *(unsigned int *)(v8 + 12) * (unint64_t)v12;
          }
          else {
            unint64_t v6 = v12;
          }
        }
      }

      if (v7 != v14 || v11 == 64 || v6 + v9 >= 0x40000001)
      {
        if (v11)
        {
          BOOL v43 = v19;
          unint64_t v23 = v12;
          while (1)
          {
            if (v11 == 1)
            {
              ssize_t v24 = pwrite(v13, __buf[0].iov_base, v9, v10);
            }

            else
            {
              while (lseek(v13, v10, 0) == -1)
              {
                uint64_t result = *__error();
                if ((_DWORD)result != 4) {
                  return result;
                }
              }

              ssize_t v24 = writev(v13, __buf, v11);
            }

            LODWORD(v5) = v40;
            uint64_t v4 = v41;
            unint64_t v12 = v23;
            BOOL v19 = v43;
            if (v24 == v9) {
              break;
            }
            if ((v24 & 0x8000000000000000LL) == 0) {
              return 5LL;
            }
            uint64_t result = *__error();
            if ((_DWORD)result != 4) {
              return result;
            }
          }
        }

        if (!v19)
        {
          if ((*(_BYTE *)(v37 + 14) & 8) != 0)
          {
            unsigned int v27 = v35;
          }

          else
          {
            unsigned int v27 = v35;
            if ((int)v5 <= v35)
            {
              LODWORD(v20) = v35;
            }

            else
            {
              unint64_t v31 = v4 + 2;
              int v32 = v35;
              do
              {
                uint64_t v20 = v32;
                uint64_t v33 = &v31[2 * v32];
                while (1)
                {
                  unsigned int v34 = (uint64_t *)v33[1];
                  if (!*v33) {
                    break;
                  }
                  if ((*((_WORD *)v34 + 5) & 4) != 0 && *((_DWORD *)v34 + 3) != 1)
                  {
                    free(v34);
                    LODWORD(v5) = v40;
                    uint64_t v4 = v41;
                  }

                  else
                  {
                    *unsigned int v34 = *(void *)(v37 + 192);
                    *(void *)(v37 + 192) = v34;
                  }

                  ++v20;
                  v33 += 2;
                  if (v20 >= v42) {
                    goto LABEL_59;
                  }
                }

                int v32 = v20 + 1;
                *(_OWORD *)&v4[2 * ++v27] = *(_OWORD *)v33;
                v4[2 * v27] = *v34;
              }

              while ((int)v20 + 1 < (int)v5);
              LODWORD(v20) = v20 + 1;
            }
          }

LABEL_59:
          uint64_t v2 = a1;
          goto LABEL_41;
        }

        size_t v9 = 0LL;
        int v11 = 0;
        off_t v10 = v7;
      }

      uint64_t v26 = &__buf[v11];
      v26->iov_base = (void *)v8;
      v26->iov_len = v6;
      uint64_t v14 = v7 + v6;
      v9 += v6;
      ++v11;
    }
  }

  if ((int)v5 <= a2)
  {
    LODWORD(v20) = a2;
    unsigned int v27 = a2;
  }

  else
  {
    unsigned int v27 = a2;
    do
    {
      uint64_t v20 = a2;
      uint64_t v28 = (uint64_t)&v4[2 * a2 + 3];
      while (1)
      {
        uint64_t v29 = *(void *)v28;
        unsigned int v30 = *(unsigned __int16 *)(*(void *)v28 + 10LL);
        if (v30 >= 0x4000) {
          break;
        }
        ++v20;
        *(_WORD *)(v29 + 10) = v30 & 0xFFEF;
        v28 += 16LL;
      }

      a2 = v20 + 1;
      *(_WORD *)(v29 + 10) = v30 & 0x7FFF;
      *(_OWORD *)&v4[2 * ++v27] = *(_OWORD *)(v28 - 8);
    }

    while ((int)v20 + 1 < (int)v5);
    LODWORD(v20) = v20 + 1;
  }

        free(__dst);
      }

      else
      {
        return 12LL;
      }
    }
  }

  return v7;
}

uint64_t mdb_env_write_meta(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(_DWORD *)(v3 + 12) | *(_DWORD *)(a1 + 124);
  uint64_t v5 = *(void *)(v3 + 72 + 8 * (v2 & 1));
  unint64_t v6 = *(void *)(*(void *)(v3 + 72 + 8LL * !(v2 & 1)) + 16LL);
  if (v6 <= *(void *)(v3 + 112)) {
    unint64_t v6 = *(void *)(v3 + 112);
  }
  if ((v4 & 0x80000) == 0)
  {
    uint64_t v28 = *(void *)(v5 + 128);
    uint64_t v7 = *(void *)(v5 + 120);
    unint64_t v29 = v6;
    uint64_t v8 = *(__int128 **)(a1 + 88);
    __int128 v9 = *v8;
    __int128 v10 = v8[2];
    __int128 v31 = v8[1];
    __int128 v32 = v10;
    __int128 v30 = v9;
    __int128 v12 = v8[4];
    __int128 v11 = v8[5];
    __int128 v33 = v8[3];
    __int128 v34 = v12;
    __int128 v35 = v11;
    uint64_t v36 = *(void *)(a1 + 16) - 1LL;
    uint64_t v37 = v2;
    off_t v13 = v5 - *(void *)(v3 + 56) + 16;
    int v14 = *(_DWORD *)(v3 + 8LL * ((v4 & 0x50000) == 0));
    while (1)
    {
      int v15 = pwrite(v14, &v29, 0x78uLL, v13);
      if (v15 == 120) {
        goto LABEL_10;
      }
      if ((v15 & 0x80000000) == 0)
      {
        uint64_t v16 = 5LL;
LABEL_19:
        uint64_t v36 = v7;
        uint64_t v37 = v28;
        pwrite(*(_DWORD *)v3, &v29, 0x78uLL, v13);
        goto LABEL_20;
      }

      uint64_t v16 = *__error();
      if ((_DWORD)v16 != 4) {
        goto LABEL_19;
      }
    }
  }

  *(void *)(v5 + 16) = v6;
  uint64_t v17 = *(__int128 **)(a1 + 88);
  __int128 v18 = *v17;
  __int128 v19 = v17[1];
  *(_OWORD *)(v5 + 56) = v17[2];
  *(_OWORD *)(v5 + 40) = v19;
  *(_OWORD *)(v5 + 24) = v18;
  uint64_t v20 = *(_OWORD **)(a1 + 88);
  __int128 v21 = v20[3];
  __int128 v22 = v20[4];
  *(_OWORD *)(v5 + 104) = v20[5];
  *(_OWORD *)(v5 + 88) = v22;
  *(_OWORD *)(v5 + 72) = v21;
  *(void *)(v5 + 120) = *(void *)(a1 + 16) - 1LL;
  *(void *)(v5 + 128) = *(void *)(a1 + 24);
  if ((v4 & 0x50000) != 0
    || ((*(_DWORD *)(v3 + 12) & 0x100000) != 0 ? (int v24 = 1) : (int v24 = 16),
        uint64_t v25 = v5 - 16,
        int v26 = (*(_DWORD *)(v3 + 20) - 1) & (v25 - *(_DWORD *)(v3 + 56)),
        !msync((void *)(v25 - v26), (v26 + *(_DWORD *)(v3 + 16)), v24)))
  {
LABEL_10:
    uint64_t v23 = *(void *)(v3 + 64);
    uint64_t v16 = 0LL;
    if (v23) {
      *(void *)(v23 + 8) = *(void *)(a1 + 24);
    }
    return v16;
  }

  uint64_t v16 = *__error();
LABEL_20:
  *(_DWORD *)(v3 + 12) |= 0x80000000;
  return v16;
}

uint64_t mdb_cmp_long(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = **(void **)(a1 + 8);
  unint64_t v3 = **(void **)(a2 + 8);
  BOOL v4 = v2 >= v3;
  BOOL v5 = v2 > v3;
  if (v4) {
    return v5;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t mdb_get(uint64_t a1, unsigned int a2, void *a3, void *a4)
{
  int v9 = 0;
  uint64_t result = 22LL;
  if (a1 && a3 && a4 && *(_DWORD *)(a1 + 120) > a2 && (*(_BYTE *)(*(void *)(a1 + 112) + a2) & 0x10) != 0)
  {
    if ((*(_BYTE *)(a1 + 124) & 0x13) != 0)
    {
      return 4294936514LL;
    }

    else
    {
      mdb_cursor_init((uint64_t)v11, a1, a2, (uint64_t)v10);
      return mdb_cursor_set((uint64_t)v11, a3, a4, 15, &v9);
    }
  }

  return result;
}

uint64_t mdb_cursor_set(uint64_t a1, void *a2, void *a3, int a4, int *a5)
{
  if (!*a2) {
    return 4294936515LL;
  }
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10) {
    *(_DWORD *)(v10 + 68) &= 0xFFFFFFFC;
  }
  if ((*(_BYTE *)(a1 + 68) & 1) == 0)
  {
    *(void *)(a1 + 72) = 0LL;
LABEL_6:
    uint64_t result = mdb_page_search(a1, a2, 0LL);
    if ((_DWORD)result) {
      return result;
    }
    __int128 v12 = *(_WORD **)(a1 + 8LL * *(unsigned __int16 *)(a1 + 66) + 72);
    goto LABEL_8;
  }

  uint64_t v15 = *(unsigned __int16 *)(a1 + 66);
  __int128 v12 = *(_WORD **)(a1 + 8 * v15 + 72);
  if ((v12[6] & 0xFFFE) == 0x10)
  {
    *(_WORD *)(a1 + 2 * v15 + 328) = 0;
    return 4294936498LL;
  }

  if ((v12[5] & 0x20) != 0)
  {
    uint64_t v14 = 0LL;
    uint64_t v16 = **(unsigned int **)(a1 + 40);
    uint64_t v17 = v12 + 8;
  }

  else
  {
    uint64_t v14 = (uint64_t)v12 + (unsigned __int16)v12[8];
    uint64_t v16 = *(unsigned __int16 *)(v14 + 6);
    uint64_t v17 = (_WORD *)(v14 + 8);
  }

  *(void *)&__int128 v35 = v16;
  *((void *)&v35 + 1) = v17;
  int v18 = (*(uint64_t (**)(void *, __int128 *))(*(void *)(a1 + 48) + 16LL))(a2, &v35);
  if (!v18)
  {
    *(_WORD *)(a1 + 2LL * *(unsigned __int16 *)(a1 + 66) + 328) = 0;
    goto LABEL_27;
  }

  if (v18 <= 0)
  {
    LODWORD(v22) = *(unsigned __int16 *)(a1 + 66);
    goto LABEL_41;
  }

  unsigned int v19 = (unsigned __int16)v12[6] - 16;
  unsigned int v20 = v19 >> 1;
  if (v19 < 4)
  {
LABEL_33:
    uint64_t v22 = *(unsigned __int16 *)(a1 + 66);
    if (*(_WORD *)(a1 + 66))
    {
      uint64_t v24 = 0LL;
      while (((*(unsigned __int16 *)(*(void *)(a1 + 328 + 8 * v24 - 256) + 12LL) - 16) >> 1) - 1 <= *(unsigned __int16 *)(a1 + 328 + 2 * v24))
      {
        if (v22 == ++v24) {
          goto LABEL_40;
        }
      }
    }

    else
    {
      LODWORD(v24) = 0;
    }

    if ((_DWORD)v24 == (_DWORD)v22)
    {
LABEL_40:
      *(_WORD *)(a1 + 2 * v22 + 328) = v20;
      return 4294936498LL;
    }

LABEL_46:
  *(_DWORD *)(a1 + 68) = *(_DWORD *)(a1 + 68) & 0xFFFFFFFC | 1;
  if ((v12[5] & 0x20) != 0)
  {
    uint64_t result = 0LL;
    if ((a4 & 0xFFFFFFFE) == 0x10)
    {
      uint64_t v30 = **(unsigned int **)(a1 + 40);
      *a2 = v30;
      a2[1] = (char *)v12
            + *(unsigned __int16 *)(a1 + 2LL * *(unsigned __int16 *)(a1 + 66) + 328)
            * (unint64_t)v30
            + 16;
    }

    return result;
  }

  if ((*(_WORD *)(v14 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v14);
    if ((a4 - 15) > 2)
    {
      if (a4 == 2)
      {
        LODWORD(v35) = 0;
        __int128 v31 = &v35;
      }

      else
      {
        __int128 v31 = 0LL;
      }

      uint64_t result = mdb_cursor_set(*(void *)(a1 + 16), a3, 0LL, 17LL, v31);
      if (!(_DWORD)result) {
        goto LABEL_80;
      }
      return result;
    }

    uint64_t result = mdb_cursor_first(*(void *)(a1 + 16), a3, 0LL);
LABEL_80:
    if ((a4 & 0xFFFFFFFE) == 0x10)
    {
      *a2 = *(unsigned __int16 *)(v14 + 6);
      a2[1] = v14 + 8;
    }

    return result;
  }

  if (!a3)
  {
    uint64_t result = 0LL;
    goto LABEL_80;
  }

  if ((a4 & 0xFFFFFFFE) == 2)
  {
    uint64_t result = mdb_node_read(a1, (unsigned int *)v14, &v35);
    if ((_DWORD)result) {
      return result;
    }
    uint64_t v25 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 48) + 24LL);
    int v27 = v25((uint64_t)a3, (uint64_t)&v35);
    BOOL v29 = a4 == 2 || v27 > 0;
    if (!v27 || !v29)
    {
      uint64_t result = 0LL;
      *(_OWORD *)a3 = v35;
      goto LABEL_80;
    }

    return 4294936498LL;
  }

  uint64_t v32 = *(void *)(a1 + 16);
  if (v32) {
    *(_DWORD *)(v32 + 68) &= 0xFFFFFFFC;
  }
  uint64_t result = mdb_node_read(a1, (unsigned int *)v14, a3);
  if (!(_DWORD)result) {
    goto LABEL_80;
  }
  return result;
}

uint64_t mdb_cursor_get(uint64_t a1, void *a2, void *a3, int a4)
{
  int v29 = 0;
  if (!a1) {
    return 22LL;
  }
  if ((*(_BYTE *)(*(void *)(a1 + 24) + 124LL) & 0x13) != 0) {
    return 4294936514LL;
  }
  uint64_t v7 = mdb_cursor_first;
  switch(a4)
  {
    case 0:
      uint64_t result = mdb_cursor_first(a1, a2, a3);
      break;
    case 1:
      goto LABEL_32;
    case 2:
    case 3:
      if (!a3) {
        goto LABEL_58;
      }
      if (!*(void *)(a1 + 16)) {
        goto LABEL_47;
      }
LABEL_10:
      if (!a2) {
        goto LABEL_58;
      }
      if (a4 == 17) {
        uint64_t v8 = 0LL;
      }
      else {
        uint64_t v8 = &v29;
      }
      uint64_t result = mdb_cursor_set(a1, a2, a3, a4, v8);
      break;
    case 4:
      if ((*(_BYTE *)(a1 + 68) & 1) == 0) {
        goto LABEL_58;
      }
      uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
      uint64_t v10 = *(void *)(a1 + 8 * v9 + 72);
      unsigned int v11 = *(unsigned __int16 *)(v10 + 12) - 16;
      unsigned int v12 = v11 >> 1;
      if (v11 < 2 || (uint64_t v13 = *(unsigned __int16 *)(a1 + 2 * v9 + 328), v12 <= v13))
      {
        *(_WORD *)(a1 + 2 * v9 + 328) = v12;
        goto LABEL_56;
      }

      if ((*(_WORD *)(v10 + 10) & 0x20) != 0)
      {
        uint64_t result = 0LL;
        uint64_t v28 = **(unsigned int **)(a1 + 40);
        *a2 = v28;
        a2[1] = v10 + v28 * (unint64_t)v13 + 16;
      }

      else
      {
        uint64_t v14 = v10 + *(unsigned __int16 *)(v10 + 2 * v13 + 16);
        if (a2)
        {
          *a2 = *(unsigned __int16 *)(v14 + 6);
          a2[1] = v14 + 8;
        }

        if (a3)
        {
          if ((*(_WORD *)(v14 + 4) & 4) == 0) {
            goto LABEL_39;
          }
          uint64_t result = mdb_cursor_get(*(void *)(a1 + 16), a3, 0LL, 4LL);
        }

        else
        {
LABEL_29:
          uint64_t result = 0LL;
        }
      }

      break;
    case 5:
      if (!a3 || (*(_BYTE *)(a1 + 68) & 1) == 0) {
        goto LABEL_58;
      }
      if ((*(_WORD *)(*(void *)(a1 + 40) + 4LL) & 0x10) == 0) {
        goto LABEL_47;
      }
      uint64_t v15 = *(void *)(a1 + 16);
      if ((*(_DWORD *)(v15 + 68) & 3) != 1) {
        goto LABEL_29;
      }
      goto LABEL_54;
    case 6:
      uint64_t result = mdb_cursor_last(a1, a2, a3);
      break;
    case 7:
      uint64_t v7 = mdb_cursor_last;
LABEL_32:
      if (!a3) {
        goto LABEL_58;
      }
      int v16 = *(_DWORD *)(a1 + 68);
      if ((v16 & 1) == 0) {
        goto LABEL_58;
      }
      uint64_t v17 = *(void *)(a1 + 16);
      if (!v17) {
        goto LABEL_47;
      }
      uint64_t v18 = *(unsigned __int16 *)(a1 + 66);
      uint64_t v19 = a1 + 2 * v18;
      uint64_t v20 = *(unsigned __int16 *)(v19 + 328);
      uint64_t v21 = *(void *)(a1 + 8 * v18 + 72);
      unsigned int v22 = *(unsigned __int16 *)(v21 + 12) - 16;
      if (v20 >= v22 >> 1)
      {
        *(_WORD *)(v19 + 328) = v22 >> 1;
        goto LABEL_56;
      }

      *(_DWORD *)(a1 + 68) = v16 & 0xFFFFFFFD;
      uint64_t v14 = v21 + *(unsigned __int16 *)(v21 + 2 * v20 + 16);
      if ((*(_WORD *)(v14 + 4) & 4) != 0)
      {
        if ((*(_BYTE *)(v17 + 68) & 1) != 0) {
          uint64_t result = v7(v17, a3, 0LL);
        }
        else {
LABEL_58:
        }
          uint64_t result = 22LL;
      }

      else
      {
        if (a2)
        {
          *a2 = *(unsigned __int16 *)(v14 + 6);
          a2[1] = v14 + 8;
        }

LABEL_39:
        uint64_t result = mdb_node_read(a1, (unsigned int *)v14, a3);
      }

      break;
    case 8:
    case 9:
    case 11:
      uint64_t result = mdb_cursor_next(a1, a2, a3, a4);
      break;
    case 10:
      if (!a3) {
        goto LABEL_58;
      }
      if ((*(_WORD *)(*(void *)(a1 + 40) + 4LL) & 0x10) == 0) {
        goto LABEL_47;
      }
      uint64_t result = mdb_cursor_next(a1, a2, a3, 9);
      if ((_DWORD)result) {
        break;
      }
      uint64_t v15 = *(void *)(a1 + 16);
      if ((*(_BYTE *)(v15 + 68) & 1) == 0) {
        goto LABEL_56;
      }
      goto LABEL_54;
    case 12:
    case 13:
    case 14:
      uint64_t result = mdb_cursor_prev(a1, a2, a3, a4);
      break;
    case 15:
    case 16:
    case 17:
      goto LABEL_10;
    case 18:
      if (!a3) {
        goto LABEL_58;
      }
      if ((*(_WORD *)(*(void *)(a1 + 40) + 4LL) & 0x10) != 0)
      {
        if ((*(_BYTE *)(a1 + 68) & 1) != 0 || (uint64_t result = mdb_cursor_last(a1, a2, a3), !(_DWORD)result))
        {
          uint64_t v23 = *(void *)(a1 + 16);
          if ((*(_BYTE *)(v23 + 68) & 1) != 0)
          {
            uint64_t result = mdb_cursor_sibling(v23, 0LL);
            if (!(_DWORD)result)
            {
              uint64_t v15 = *(void *)(a1 + 16);
LABEL_54:
              uint64_t result = 0LL;
              uint64_t v24 = *(unsigned __int16 *)(v15 + 66);
              uint64_t v25 = v15 + 8 * v24;
              uint64_t v26 = *(void *)(v25 + 72);
              *a3 = ((*(unsigned __int16 *)(v26 + 12) - 16) >> 1) * **(_DWORD **)(v15 + 40);
              a3[1] = v26 + 16;
              *(_WORD *)(v15 + 2 * v24 + 328) = ((*(unsigned __int16 *)(*(void *)(v25 + 72) + 12LL)
                                                + 131056) >> 1)
                                              - 1;
            }
          }

          else
          {
LABEL_56:
            uint64_t result = 4294936498LL;
          }
        }
      }

      else
      {
LABEL_47:
        uint64_t result = 4294936512LL;
      }

      break;
    default:
      goto LABEL_58;
  }

  int v27 = *(_DWORD *)(a1 + 68);
  if ((v27 & 8) != 0) {
    *(_DWORD *)(a1 + 68) = v27 ^ 8;
  }
  return result;
}

uint64_t mdb_node_read(uint64_t a1, unsigned int *a2, void *a3)
{
  __int16 v4 = *((_WORD *)a2 + 2);
  *a3 = *a2;
  BOOL v5 = (unint64_t *)((char *)a2 + *((unsigned __int16 *)a2 + 3) + 8);
  if ((v4 & 1) != 0)
  {
    uint64_t result = mdb_page_get(a1, *v5, &v7, 0LL);
    if ((_DWORD)result) {
      return result;
    }
    BOOL v5 = (unint64_t *)(v7 + 16);
  }

  uint64_t result = 0LL;
  a3[1] = v5;
  return result;
}

uint64_t mdb_cursor_next(uint64_t a1, void *a2, void *a3, int a4)
{
  int v8 = *(_DWORD *)(a1 + 68);
  if (a4 == 9 && (v8 & 8) != 0) {
    return 4294936498LL;
  }
  if ((v8 & 1) == 0) {
    return mdb_cursor_first(a1, a2, a3);
  }
  uint64_t v10 = *(unsigned __int16 *)(a1 + 66);
  uint64_t v11 = *(void *)(a1 + 8 * v10 + 72);
  if ((v8 & 2) != 0)
  {
    *(_DWORD *)(a1 + 68) = v8 ^ 2;
  }

  if ((*(_WORD *)(*(void *)(a1 + 40) + 4LL) & 4) != 0)
  {
    uint64_t v12 = v11 + *(unsigned __int16 *)(v11 + 2LL * *(unsigned __int16 *)(a1 + 2 * v10 + 328) + 16);
    if ((*(_WORD *)(v12 + 4) & 4) == 0)
    {
      *(_DWORD *)(*(void *)(a1 + 16) + 68LL) &= 0xFFFFFFFC;
      if (a4 != 9) {
        goto LABEL_17;
      }
      return 4294936498LL;
    }

    if ((a4 & 0xFFFFFFFE) == 8)
    {
      uint64_t result = mdb_cursor_next(*(void *)(a1 + 16), a3, 0LL, 8LL);
      if (a4 != 8 || (_DWORD)result != -30798)
      {
        if (a2 && !(_DWORD)result)
        {
          uint64_t v17 = *(unsigned __int16 *)(v12 + 6);
          unint64_t v18 = v12 + 8;
          goto LABEL_36;
        }

        return result;
      }
    }
  }

LABEL_17:
  int v13 = *(_DWORD *)(a1 + 68);
  if ((v13 & 8) != 0)
  {
    *(_DWORD *)(a1 + 68) = v13 ^ 8;
  }

  else
  {
    uint64_t v14 = a1 + 2LL * *(unsigned __int16 *)(a1 + 66);
    unsigned int v15 = *(unsigned __int16 *)(v14 + 328) + 1;
    if (v15 >= (*(unsigned __int16 *)(v11 + 12) - 16) >> 1)
    {
      uint64_t result = mdb_cursor_sibling(a1, 1LL);
      if ((_DWORD)result)
      {
        *(_DWORD *)(a1 + 68) |= 2u;
        return result;
      }

      uint64_t v11 = *(void *)(a1 + 8LL * *(unsigned __int16 *)(a1 + 66) + 72);
    }

    else
    {
      *(_WORD *)(v14 + 328) = v15;
    }
  }

  if ((*(_WORD *)(v11 + 10) & 0x20) != 0)
  {
    uint64_t result = 0LL;
    uint64_t v17 = **(unsigned int **)(a1 + 40);
    unint64_t v18 = v11
        + *(unsigned __int16 *)(a1 + 2LL * *(unsigned __int16 *)(a1 + 66) + 328) * (unint64_t)v17
        + 16;
LABEL_36:
    *a2 = v17;
    a2[1] = v18;
    return result;
  }

  uint64_t v16 = v11
      + *(unsigned __int16 *)(v11 + 2LL * *(unsigned __int16 *)(a1 + 2LL * *(unsigned __int16 *)(a1 + 66) + 328) + 16);
  if ((*(_WORD *)(v16 + 4) & 4) != 0)
  {
    mdb_xcursor_init1( a1,  v11 + *(unsigned __int16 *)(v11 + 2LL * *(unsigned __int16 *)(a1 + 2LL * *(unsigned __int16 *)(a1 + 66) + 328) + 16));
    uint64_t result = mdb_cursor_first(*(void *)(a1 + 16), a3, 0LL);
    if ((_DWORD)result) {
      return result;
    }
  }

  else if (a3)
  {
    uint64_t result = mdb_node_read( a1,  (unsigned int *)(v11 + *(unsigned __int16 *)(v11 + 2LL * *(unsigned __int16 *)(a1 + 2LL * *(unsigned __int16 *)(a1 + 66)
                                                                          + 328)
                                                    + 16)),
               a3);
    if ((_DWORD)result) {
      return result;
    }
  }

  uint64_t result = 0LL;
  if (a2)
  {
    uint64_t v17 = *(unsigned __int16 *)(v16 + 6);
    unint64_t v18 = v16 + 8;
    goto LABEL_36;
  }

  return result;
}

uint64_t mdb_cursor_last(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6) {
    *(_DWORD *)(v6 + 68) &= 0xFFFFFFFC;
  }
  int v7 = *(_DWORD *)(a1 + 68);
  if ((v7 & 1) != 0 && !*(_WORD *)(a1 + 66))
  {
    uint64_t v9 = 0LL;
  }

  else
  {
    uint64_t result = mdb_page_search(a1, 0LL, 8LL);
    if ((_DWORD)result) {
      return result;
    }
    uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
    int v7 = *(_DWORD *)(a1 + 68);
  }

  uint64_t v10 = *(void *)(a1 + 8 * v9 + 72);
  unsigned int v11 = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
  *(_WORD *)(a1 + 2 * v9 + 328) = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
  *(_DWORD *)(a1 + 68) = v7 | 3;
  if ((*(_BYTE *)(v10 + 10) & 0x20) != 0)
  {
    if (a2)
    {
      uint64_t v13 = **(unsigned int **)(a1 + 40);
      *a2 = v13;
      unint64_t v14 = v10 + v13 * (unint64_t)(unsigned __int16)v11 + 16;
LABEL_18:
      uint64_t result = 0LL;
      a2[1] = v14;
      return result;
    }

    return 0LL;
  }

  uint64_t v12 = v10 + *(unsigned __int16 *)(v10 + 2LL * (unsigned __int16)v11 + 16);
  if ((*(_WORD *)(v12 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v12);
    uint64_t result = mdb_cursor_last(*(void *)(a1 + 16), a3, 0LL);
    if ((_DWORD)result) {
      return result;
    }
LABEL_16:
    if (a2)
    {
      *a2 = *(unsigned __int16 *)(v12 + 6);
      unint64_t v14 = v12 + 8;
      goto LABEL_18;
    }

    return 0LL;
  }

  if (!a3) {
    goto LABEL_16;
  }
  uint64_t result = mdb_node_read(a1, (unsigned int *)v12, a3);
  if (!(_DWORD)result) {
    goto LABEL_16;
  }
  return result;
}

uint64_t mdb_cursor_sibling(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int16 *)(a1 + 64);
  if (v2 < 2) {
    return 4294936498LL;
  }
  int v4 = a2;
  *(_WORD *)(a1 + 64) = v2 - 1;
  unsigned __int16 v6 = *(_WORD *)(a1 + 66) - 1;
  *(_WORD *)(a1 + 66) = v6;
  uint64_t v7 = v6;
  int v8 = (_WORD *)(a1 + 2LL * v6 + 328);
  int v9 = (unsigned __int16)*v8;
  if ((_DWORD)a2)
  {
LABEL_8:
    *int v8 = v9;
    goto LABEL_12;
  }

  if (*v8)
  {
    LOWORD(v9) = v9 - 1;
    goto LABEL_8;
  }

LABEL_9:
  uint64_t result = mdb_cursor_sibling(a1, a2);
  uint64_t v7 = *(unsigned __int16 *)(a1 + 66);
  if ((_DWORD)result)
  {
    *(_WORD *)(a1 + 66) = v7 + 1;
    ++*(_WORD *)(a1 + 64);
    return result;
  }

  LOWORD(v9) = *(_WORD *)(a1 + 2 * v7 + 328);
LABEL_12:
  uint64_t result = mdb_page_get(a1, *v10 | ((unint64_t)*((unsigned __int16 *)v10 + 2) << 32), &v13, 0LL);
  if ((_DWORD)result)
  {
    *(_DWORD *)(a1 + 68) &= 0xFFFFFFFC;
  }

  else
  {
    unint64_t v11 = v13;
    uint64_t v12 = *(unsigned __int16 *)(a1 + 64);
    if (v12 < 0x20)
    {
      *(_WORD *)(a1 + 64) = v12 + 1;
      *(_WORD *)(a1 + 66) = v12;
      *(void *)(a1 + 8 * v12 + 72) = v11;
      *(_WORD *)(a1 + 2 * v12 + 328) = 0;
    }

    else
    {
      *(_DWORD *)(*(void *)(a1 + 24) + 124LL) |= 2u;
    }

    uint64_t result = 0LL;
    if (!v4) {
      *(_WORD *)(a1 + 2LL * *(unsigned __int16 *)(a1 + 66) + 328) = ((*(unsigned __int16 *)(v11 + 12)
    }
                                                                    + 131056) >> 1)
                                                                  - 1;
  }

  return result;
}

uint64_t mdb_cursor_prev(uint64_t a1, void *a2, void *a3, int a4)
{
  if ((*(_BYTE *)(a1 + 68) & 1) != 0)
  {
    uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
  }

  else
  {
    uint64_t result = mdb_cursor_last(a1, a2, a3);
    if ((_DWORD)result) {
      return result;
    }
    uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
    ++*(_WORD *)(a1 + 2 * v9 + 328);
  }

  uint64_t v10 = *(void *)(a1 + 8 * v9 + 72);
  if ((*(_WORD *)(*(void *)(a1 + 40) + 4LL) & 4) != 0)
  {
    uint64_t v11 = *(unsigned __int16 *)(a1 + 2 * v9 + 328);
    if (v11 < (*(unsigned __int16 *)(v10 + 12) - 16) >> 1)
    {
      uint64_t v12 = v10 + *(unsigned __int16 *)(v10 + 2 * v11 + 16);
      if ((*(_WORD *)(v12 + 4) & 4) != 0)
      {
        if ((a4 & 0xFFFFFFFE) == 0xC)
        {
          uint64_t result = mdb_cursor_prev(*(void *)(a1 + 16), a3, 0LL, 12LL);
          if (a4 != 12 || (_DWORD)result != -30798)
          {
            if (!(_DWORD)result)
            {
              if (a2)
              {
                *a2 = *(unsigned __int16 *)(v12 + 6);
                a2[1] = v12 + 8;
              }

              uint64_t result = 0LL;
              *(_DWORD *)(a1 + 68) &= ~2u;
            }

            return result;
          }

          uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
        }
      }

      else
      {
        *(_DWORD *)(*(void *)(a1 + 16) + 68LL) &= 0xFFFFFFFC;
        if (a4 == 13) {
          return 4294936498LL;
        }
      }
    }
  }

  *(_DWORD *)(a1 + 68) &= 0xFFFFFFF5;
  uint64_t v13 = a1 + 2 * v9;
  __int16 v14 = *(_WORD *)(v13 + 328);
  if (v14)
  {
    unsigned int v15 = (_WORD *)(v13 + 328);
    LOWORD(v13) = v14 - 1;
    _WORD *v15 = v14 - 1;
  }

  else
  {
    uint64_t result = mdb_cursor_sibling(a1, 0LL);
    if ((_DWORD)result) {
      return result;
    }
    uint64_t v18 = *(unsigned __int16 *)(a1 + 66);
    uint64_t v10 = *(void *)(a1 + 8 * v18 + 72);
    LODWORD(v13) = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
    *(_WORD *)(a1 + 2 * v18 + 328) = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
  }

  __int16 v16 = *(_WORD *)(v10 + 10);
  if ((v16 & 2) == 0) {
    return 4294936500LL;
  }
  if ((v16 & 0x20) != 0)
  {
    uint64_t result = 0LL;
    uint64_t v19 = **(unsigned int **)(a1 + 40);
    *a2 = v19;
    a2[1] = v10 + (unsigned __int16)v13 * (unint64_t)v19 + 16;
    return result;
  }

  uint64_t v17 = v10 + *(unsigned __int16 *)(v10 + 2LL * (unsigned __int16)v13 + 16);
  if ((*(_WORD *)(v17 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v17);
    uint64_t result = mdb_cursor_last(*(void *)(a1 + 16), a3, 0LL);
    if ((_DWORD)result) {
      return result;
    }
    goto LABEL_27;
  }

  if (!a3 || (uint64_t result = mdb_node_read(a1, (unsigned int *)v17, a3), !(_DWORD)result))
  {
LABEL_27:
    uint64_t result = 0LL;
    if (a2)
    {
      *a2 = *(unsigned __int16 *)(v17 + 6);
      a2[1] = v17 + 8;
    }
  }

  return result;
}

uint64_t mdb_cursor_first(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6) {
    *(_DWORD *)(v6 + 68) &= 0xFFFFFFFC;
  }
  int v7 = *(_DWORD *)(a1 + 68);
  if ((v7 & 1) != 0 && !*(_WORD *)(a1 + 66))
  {
    uint64_t v9 = 0LL;
  }

  else
  {
    uint64_t result = mdb_page_search(a1, 0LL, 4LL);
    if ((_DWORD)result) {
      return result;
    }
    uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
    int v7 = *(_DWORD *)(a1 + 68);
  }

  uint64_t v10 = *(void *)(a1 + 8 * v9 + 72);
  uint64_t v11 = v10 + 16;
  uint64_t v12 = *(unsigned __int16 *)(v10 + 16);
  *(_DWORD *)(a1 + 68) = v7 & 0xFFFFFFFC | 1;
  *(_WORD *)(a1 + 2 * v9 + 328) = 0;
  if ((*(_BYTE *)(v10 + 10) & 0x20) != 0)
  {
    if (a2)
    {
      *a2 = **(unsigned int **)(a1 + 40);
LABEL_18:
      uint64_t result = 0LL;
      a2[1] = v11;
      return result;
    }

    return 0LL;
  }

  uint64_t v13 = v10 + v12;
  if ((*(_WORD *)(v10 + v12 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v10 + v12);
    uint64_t result = mdb_cursor_first(*(void *)(a1 + 16), a3, 0LL);
    if ((_DWORD)result) {
      return result;
    }
LABEL_16:
    if (a2)
    {
      *a2 = *(unsigned __int16 *)(v13 + 6);
      uint64_t v11 = v13 + 8;
      goto LABEL_18;
    }

    return 0LL;
  }

  if (!a3) {
    goto LABEL_16;
  }
  uint64_t result = mdb_node_read(a1, (unsigned int *)(v10 + v12), a3);
  if (!(_DWORD)result) {
    goto LABEL_16;
  }
  return result;
}

uint64_t mdb_page_spill(uint64_t a1, void *a2, void *a3)
{
  if ((*(_BYTE *)(a1 + 68) & 4) != 0) {
    return 0LL;
  }
  uint64_t v4 = *(void *)(a1 + 24);
  int v5 = *(unsigned __int16 *)(*(void *)(a1 + 40) + 6LL);
  if (*(_DWORD *)(a1 + 32) >= 2u) {
    v5 += *(unsigned __int16 *)(*(void *)(v4 + 88) + 54LL);
  }
  if (a2)
  {
    unint64_t v6 = *(unsigned int *)(*(void *)(v4 + 32) + 16LL);
    v5 += (*a2 + *a3 + v6 + 8) / v6;
  }

  int v8 = *(_DWORD **)(v4 + 72);
  uint64_t v9 = *(_DWORD **)(v4 + 64);
  if (v9)
  {
    int v10 = *v9;
    if (*v9)
    {
      unsigned int v11 = 0;
      else {
        uint64_t v12 = 2LL;
      }
      uint64_t v13 = (uint64_t *)(v9 + 2);
      uint64_t v14 = v12 - 1;
      do
      {
        uint64_t v16 = *v13++;
        uint64_t v15 = v16;
        if ((v16 & 1) == 0) {
          *(void *)&v9[2 * ++v11] = v15;
        }
        --v14;
      }

      while (v14);
    }

    else
    {
      unsigned int v11 = 0;
    }

    *(void *)uint64_t v9 = v11;
  }

  else
  {
    uint64_t v17 = mdb_midl_alloc(0x1FFFF);
    *(void *)(v4 + 64) = v17;
    if (!v17) {
      return 12LL;
    }
  }

  uint64_t result = mdb_pages_xkeep(a1, 16, 1);
  if (!(_DWORD)result)
  {
    uint64_t v18 = *v8;
    if (*v8)
    {
      else {
        int v19 = 2 * v5;
      }
      do
      {
        uint64_t v20 = &v8[4 * v18];
        uint64_t v21 = v20[1];
        if ((*(_WORD *)(v21 + 10) & 0xC000) == 0)
        {
          unint64_t v22 = 2LL * *v20;
          uint64_t v23 = *(void **)v4;
          if (*(void *)v4)
          {
            while (1)
            {
              uint64_t v24 = (unsigned int *)v23[8];
              if (v24)
              {
                unsigned int v25 = mdb_midl_search(v24, v22);
                uint64_t v26 = (void *)v23[8];
              }

              uint64_t v23 = (void *)*v23;
              if (!v23) {
                goto LABEL_33;
              }
            }

            *(_WORD *)(v21 + 10) |= 0x8000u;
          }

          else
          {
LABEL_33:
            uint64_t result = mdb_midl_append((unint64_t **)(v4 + 64), v22);
            if ((_DWORD)result) {
              goto LABEL_41;
            }
            --v19;
          }
        }

        --v18;
      }

      while ((_DWORD)v18 && v19);
    }

    mdb_midl_sort(*(int **)(v4 + 64));
    uint64_t result = mdb_page_flush(v4, v18);
    if (!(_DWORD)result) {
      uint64_t result = mdb_pages_xkeep(a1, 32784, v18);
    }
  }

uint64_t mdb_page_new(uint64_t a1, __int16 a2, signed int a3, char **a4)
{
  uint64_t result = mdb_page_alloc(a1, a3, &v10);
  if (!(_DWORD)result)
  {
    uint64_t v9 = v10;
    *((_WORD *)v10 + 5) = a2 | 0x10;
    *((_WORD *)v9 + 6) = 16;
    *((_WORD *)v9 + 7) = *(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 32LL) + 16LL);
    if ((a2 & 1) != 0)
    {
      ++*(void *)(*(void *)(a1 + 40) + 8LL);
    }

    else if ((a2 & 2) != 0)
    {
      ++*(void *)(*(void *)(a1 + 40) + 16LL);
    }

    else if ((a2 & 4) != 0)
    {
      *(void *)(*(void *)(a1 + 40) + 24LL) += a3;
      *((_DWORD *)v9 + 3) = a3;
    }

    *a4 = v9;
  }

  return result;
}

uint64_t mdb_cursor_touch(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 32);
  if (v2 >= 2 && (**(_BYTE **)(a1 + 56) & 0x21) == 0)
  {
    uint64_t v6 = *(void *)(a1 + 24);
    if (*(_DWORD *)(*(void *)(v6 + 96) + 4 * v2) != *(_DWORD *)(*(void *)(*(void *)(v6 + 32) + 152LL) + 4 * v2)) {
      return 4294936516LL;
    }
    mdb_cursor_init((uint64_t)v8, v6, 1u, (uint64_t)v7);
    uint64_t result = mdb_page_search((uint64_t)v8, *(void **)(a1 + 48), 1);
    if ((_DWORD)result) {
      return result;
    }
    **(_BYTE **)(a1 + 56) |= 1u;
  }

  *(_WORD *)(a1 + 66) = 0;
  if (!*(_WORD *)(a1 + 64)) {
    return 0LL;
  }
  do
  {
    uint64_t result = mdb_page_touch(a1);
    unsigned int v4 = *(unsigned __int16 *)(a1 + 64);
    if ((_DWORD)result) {
      break;
    }
    unsigned __int16 v5 = *(_WORD *)(a1 + 66) + 1;
    *(_WORD *)(a1 + 66) = v5;
  }

  while (v4 > v5);
  *(_WORD *)(a1 + 66) = v4 - 1;
  return result;
}

uint64_t mdb_update_key(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(unsigned __int16 *)(a1 + 66);
  unsigned int v4 = *(unsigned __int16 **)(a1 + 8 * v3 + 72);
  unsigned __int16 v5 = &v4[*(unsigned __int16 *)(a1 + 2 * v3 + 328)];
  unsigned int v8 = v5[8];
  int v7 = v5 + 8;
  uint64_t v6 = v8;
  uint64_t v9 = (unsigned __int16 *)((char *)v4 + v8);
  size_t v10 = *(void *)a2;
  int v11 = (*(void *)a2 + 1) & 0xFFFFFFFE;
  int v12 = v9[3];
  int v13 = (v12 + 1) & 0x1FFFE;
  int v14 = v11 - v13;
  if (v11 != v13)
  {
    if (v14 <= 0)
    {
      int v15 = v4[6];
    }

    else
    {
      int v15 = v4[6];
      if (v14 > (unsigned __int16)(v4[7] - v15))
      {
        size_t v17 = *(unsigned int *)v9 | ((unint64_t)v9[2] << 32);
        mdb_node_del((void *)a1, 0);
        return mdb_page_split(a1, a2, 0LL, v17, 0x40000);
      }
    }

    uint64_t v19 = (unsigned __int16)((v15 + 131056) >> 1);
    if ((unsigned __int16)((v15 + 131056) >> 1))
    {
      uint64_t v20 = v4 + 8;
      do
      {
        unsigned int v21 = (unsigned __int16)*v20;
        ++v20;
        --v19;
      }

      while (v19);
    }

    memmove((char *)v4 + v4[7] - v14, (char *)v4 + v4[7], v6 - v4[7] + 8);
    v4[7] -= v14;
    uint64_t v9 = (unsigned __int16 *)((char *)v4 + *v7);
    int v12 = v9[3];
    size_t v10 = *(void *)a2;
  }

  if (v10 != v12) {
    v9[3] = v10;
  }
  if (v10) {
    memcpy(v9 + 4, *(const void **)(a2 + 8), v10);
  }
  return 0LL;
}

uint64_t mdb_page_alloc(uint64_t a1, signed int a2, char **a3)
{
  signed int v3 = a2;
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(v4 + 32);
  int v7 = (uint64_t **)(v5 + 176);
  uint64_t v6 = *(uint64_t **)(v5 + 176);
  if (v6) {
    unsigned int v8 = *(_DWORD *)v6;
  }
  else {
    unsigned int v8 = 0;
  }
  uint64_t v9 = (a2 - 1);
  if (a2 == 1 && (uint64_t v10 = *(void *)(v4 + 48)) != 0)
  {
    uint64_t result = 0LL;
    *(void *)(v4 + 48) = *(void *)(v10 + 48);
    --*(_DWORD *)(v4 + 56);
    *a3 = (char *)v10;
  }

  else
  {
    *a3 = 0LL;
    if (*(_DWORD *)(v4 + 128))
    {
      unint64_t oldest = 0LL;
      int v13 = 0;
      int v34 = 0;
      char v14 = 1;
      int v15 = 1 - a2;
      int v31 = 60 * a2;
      while (1)
      {
        if (v8 > v9)
        {
          unsigned int v32 = v8;
          unsigned int v16 = v8;
          while (1)
          {
            uint64_t v17 = v6[v16];
            if (v6[v15 + v16] == v17 + v9) {
              goto LABEL_40;
            }
            if (--v16 <= v9)
            {
              unsigned int v8 = v32;
              BOOL v18 = v31-- < 1;
              signed int v3 = a2;
              if (v18) {
                goto LABEL_38;
              }
              break;
            }
          }
        }

        if ((v14 & 1) != 0)
        {
          unint64_t v40 = *(void *)(v5 + 184);
          unint64_t oldest = *(void *)(v5 + 168);
          mdb_cursor_init(v37, v4, 0LL, 0LL);
          unint64_t v19 = v40;
          if (v40)
          {
            uint64_t v42 = (char *)&v40;
            uint64_t v41 = 8LL;
            int v13 = 17;
          }

          else
          {
            int v13 = 0;
          }
        }

        else
        {
          unint64_t v19 = v40;
        }

        unint64_t v20 = v19 + 1;
        unint64_t v40 = v20;
        if (oldest <= v20)
        {
          if (!v34)
          {
            unint64_t oldest = mdb_find_oldest(v4);
            *(void *)(v5 + 168) = oldest;
            unint64_t v20 = v40;
          }

          if (oldest <= v20) {
            goto LABEL_38;
          }
          int v34 = 1;
        }

        uint64_t result = mdb_cursor_get((uint64_t)v37, &v41, 0LL, v13);
        if ((_DWORD)result) {
          break;
        }
        unint64_t v21 = *(void *)v42;
        unint64_t v40 = v21;
        if (oldest <= v21)
        {
          if (!v34)
          {
            unint64_t oldest = mdb_find_oldest(v4);
            *(void *)(v5 + 168) = oldest;
            unint64_t v21 = v40;
          }

          if (oldest <= v21) {
            goto LABEL_38;
          }
          int v34 = 1;
        }

        uint64_t result = mdb_node_read( (uint64_t)v37,  (unsigned int *)(v39[v38] + *(unsigned __int16 *)(v39[v38] + 2LL * *((unsigned __int16 *)&v39[32] + v38) + 16)),  &v35);
        if ((_DWORD)result) {
          goto LABEL_54;
        }
        unint64_t v22 = (uint64_t *)v36;
        if (v6)
        {
          uint64_t result = mdb_midl_need((_DWORD **)v7, *v36);
          if ((_DWORD)result) {
            goto LABEL_54;
          }
          uint64_t v6 = *v7;
        }

        else
        {
          uint64_t v6 = mdb_midl_alloc(*v36);
          *int v7 = v6;
          if (!v6) {
            goto LABEL_42;
          }
        }

        *(void *)(v5 + 184) = v40;
        mdb_midl_xmerge(v6, v22);
        char v14 = 0;
        unsigned int v8 = *(_DWORD *)v6;
        int v13 = 8;
      }

      if ((_DWORD)result != -30798) {
        goto LABEL_54;
      }
LABEL_38:
      unsigned int v32 = v8;
      uint64_t v17 = *(void *)(v4 + 16);
      if ((unint64_t)(v17 + v3) >= *(void *)(v5 + 128))
      {
        uint64_t result = 4294936504LL;
        goto LABEL_54;
      }

      unsigned int v16 = 0;
LABEL_40:
      if ((*(_BYTE *)(v5 + 14) & 8) != 0)
      {
        uint64_t v23 = (char *)(*(void *)(v5 + 56) + v17 * *(unsigned int *)(v5 + 16));
      }

      else
      {
        uint64_t v23 = mdb_page_malloc(v4, a2);
        if (!v23)
        {
LABEL_42:
          uint64_t result = 12LL;
          goto LABEL_54;
        }
      }

      if (v16)
      {
        uint64_t v24 = v32 - a2;
        *uint64_t v6 = v24;
        unsigned int v25 = v16 - a2;
        if (v16 - a2 < v24)
        {
          uint64_t v26 = v24 - v25;
          int v27 = &v6[v25 + 1];
          unsigned int v28 = v16 + 1;
          do
          {
            *v27++ = v6[v28++];
            --v26;
          }

          while (v26);
        }
      }

      else
      {
        *(void *)(v4 + 16) = v17 + a2;
      }

      *(void *)uint64_t v23 = v17;
      int v29 = (void (*)(void, uint64_t *))mdb_mid2l_append;
      if ((*(_DWORD *)(v4 + 124) & 0x80000) == 0) {
        int v29 = (void (*)(void, uint64_t *))mdb_mid2l_insert;
      }
      uint64_t v41 = v17;
      uint64_t v42 = v23;
      v29(*(void *)(v4 + 72), &v41);
      uint64_t result = 0LL;
      --*(_DWORD *)(v4 + 128);
      *a3 = v23;
    }

    else
    {
      uint64_t result = 4294936508LL;
LABEL_54:
      *(_DWORD *)(v4 + 124) |= 2u;
    }
  }

  return result;
}

void *mdb_node_del(void *result, int a2)
{
  uint64_t v2 = *((unsigned __int16 *)result + 33);
  signed int v3 = (_WORD *)result[v2 + 9];
  uint64_t v4 = *((unsigned __int16 *)result + v2 + 164);
  uint64_t v5 = (unsigned __int16)v3[6];
  unint64_t v6 = v5 + 131056;
  __int16 v7 = v3[5];
  if ((v7 & 0x20) != 0)
  {
    __int16 v12 = a2;
    int v13 = ~(_DWORD)v4 + (unsigned __int16)(v6 >> 1);
    if (v13)
    {
      char v14 = (char *)v3 + (int)v4 * (uint64_t)a2 + 16;
      uint64_t result = memmove(v14, &v14[a2], v13 * a2);
      LOWORD(v5) = v3[6];
    }

    __int16 v17 = v3[7];
    int v15 = v3 + 7;
    LOWORD(v16) = v17;
    *(v15 - 1) = v5 - 2;
    __int16 v18 = v12 - 2;
  }

  else
  {
    uint64_t v8 = (unsigned __int16)v3[v4 + 8];
    uint64_t v9 = (char *)v3 + v8;
    int v10 = *(unsigned __int16 *)((char *)v3 + v8 + 6);
    int v11 = v10 + 8;
    if ((v7 & 2) != 0)
    {
      if ((*((_WORD *)v9 + 2) & 1) != 0) {
        int v11 = v10 + 16;
      }
      else {
        v11 += *(_DWORD *)v9;
      }
    }

    unsigned int v16 = (v11 + 1) & 0xFFFFFFFE;
    uint64_t v19 = (unsigned __int16)(v6 >> 1);
    if ((_DWORD)v19)
    {
      unsigned __int16 v20 = 0;
      unint64_t v21 = v3 + 8;
      do
      {
        if (v4)
        {
          __int16 v22 = *v21;
          uint64_t v23 = &v3[v20];
          v23[8] = *v21;
          uint64_t v24 = v23 + 8;
          ++v20;
        }

        ++v21;
        --v4;
        --v19;
      }

      while (v19);
    }

    uint64_t result = memmove( (char *)v3 + (unsigned __int16)v3[7] + v16,  (char *)v3 + (unsigned __int16)v3[7],  v8 - (unsigned __int16)v3[7]);
    v3[6] -= 2;
    __int16 v18 = v3[7];
    int v15 = v3 + 7;
  }

  _WORD *v15 = v18 + v16;
  return result;
}

uint64_t mdb_page_get(uint64_t a1, unint64_t a2, unint64_t *a3, int *a4)
{
  uint64_t v7 = *(void *)(a1 + 24);
  if ((*(_BYTE *)(a1 + 70) & 0xA) != 0)
  {
LABEL_10:
    if (*(void *)(v7 + 16) <= a2)
    {
      *(_DWORD *)(v7 + 124) |= 2u;
      return 4294936499LL;
    }

    int v9 = 0;
  }

  else
  {
    uint64_t v8 = 2 * a2;
    int v9 = 1;
    int v10 = *(void **)(a1 + 24);
    while (1)
    {
      int v11 = (unsigned int *)v10[8];
      __int16 v12 = (unsigned int *)v10[9];
      if (v11)
      {
        unsigned int v13 = mdb_midl_search(v11, 2 * a2);
        char v14 = (void *)v10[8];
      }

      if (*(void *)v12)
      {
        unsigned int v15 = mdb_mid2l_search(v12, a2);
        if (*(void *)v12 >= (unint64_t)v15 && *(void *)&v12[4 * v15] == a2)
        {
          unint64_t v16 = *(void *)&v12[4 * v15 + 2];
          goto LABEL_13;
        }
      }

      ++v9;
      int v10 = (void *)*v10;
      if (!v10) {
        goto LABEL_10;
      }
    }
  }

  unint64_t v16 = *(void *)(*(void *)(v7 + 32) + 56LL) + *(unsigned int *)(*(void *)(v7 + 32) + 16LL) * a2;
LABEL_13:
  *a3 = v16;
  uint64_t result = 0LL;
  if (a4) {
    *a4 = v9;
  }
  return result;
}

uint64_t mdb_page_unspill(uint64_t a1, uint64_t a2, char **a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  unint64_t v7 = 2LL * *(void *)a2;
  uint64_t v8 = (void *)a1;
  while (1)
  {
    int v9 = (unsigned int *)v8[8];
    if (v9)
    {
      unsigned int v10 = mdb_midl_search(v9, v7);
      int v11 = (void *)v8[8];
      if (*v11 >= (unint64_t)v10)
      {
        uint64_t v12 = v10;
        if (v11[v10] == v7) {
          break;
        }
      }
    }

    uint64_t v8 = (void *)*v8;
    if (!v8) {
      return 0LL;
    }
  }

  if (!*(_DWORD *)(a1 + 128)) {
    return 4294936508LL;
  }
  if ((*(_WORD *)(a2 + 10) & 4) != 0) {
    signed int v14 = *(_DWORD *)(a2 + 12);
  }
  else {
    signed int v14 = 1;
  }
  if ((*(_BYTE *)(v6 + 14) & 8) != 0)
  {
    unint64_t v16 = (char *)a2;
  }

  else
  {
    unsigned int v15 = mdb_page_malloc(a1, v14);
    if (!v15) {
      return 12LL;
    }
    unint64_t v16 = v15;
    int v17 = *(_DWORD *)(v6 + 16);
    if (v14 < 2) {
      mdb_page_copy(v15, (_WORD *)a2, v17);
    }
    else {
      memcpy(v15, (const void *)a2, (v17 * v14));
    }
  }

  if (v8 == (void *)a1)
  {
    __int16 v18 = *(void **)(a1 + 64);
    if (*v18 == v12) {
      *__int16 v18 = v12 - 1;
    }
    else {
      v18[v12] |= 1uLL;
    }
  }

  if ((*(_DWORD *)(a1 + 124) & 0x80000) != 0) {
    uint64_t v19 = mdb_mid2l_append;
  }
  else {
    uint64_t v19 = mdb_mid2l_insert;
  }
  v20[0] = *(void *)v16;
  v20[1] = v16;
  ((void (*)(void, void *))v19)(*(void *)(a1 + 72), v20);
  uint64_t result = 0LL;
  --*(_DWORD *)(a1 + 128);
  *((_WORD *)v16 + 5) |= 0x10u;
  *a3 = v16;
  return result;
}

char *mdb_page_malloc(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  size_t v4 = *(unsigned int *)(v3 + 16);
  if (a2 == 1)
  {
    uint64_t v5 = *(char **)(v3 + 192);
    if (v5)
    {
      *(void *)(v3 + 192) = *(void *)v5;
      return v5;
    }

    size_t v7 = v4 - 16;
    uint64_t v6 = 16LL;
  }

  else
  {
    uint64_t v6 = v4 * (unint64_t)a2 - v4;
    size_t v7 = *(unsigned int *)(v3 + 16);
    size_t v4 = v4 * (unint64_t)a2;
  }

  uint64_t v8 = (char *)malloc(v4);
  uint64_t v5 = v8;
  if (v8)
  {
    if ((*(_BYTE *)(v3 + 15) & 1) == 0)
    {
      bzero(&v8[v6], v7);
      *((_WORD *)v5 + 4) = 0;
    }
  }

  else
  {
    *(_DWORD *)(a1 + 124) |= 2u;
  }

  return v5;
}

uint64_t mdb_ovpage_free(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  unint64_t v4 = *(void *)a2;
  uint64_t v5 = *(unsigned int *)(a2 + 12);
  uint64_t v6 = *(void *)(v3 + 32);
  size_t v7 = (unsigned int **)(v6 + 176);
  if (!*(void *)(v6 + 176) || *(void *)v3)
  {
LABEL_3:
    uint64_t result = mdb_midl_append_range((uint64_t **)(v3 + 40), v4, v5);
    if ((_DWORD)result) {
      return result;
    }
    goto LABEL_4;
  }

  unsigned int v10 = *(void **)(v3 + 64);
  if ((*(_WORD *)(a2 + 10) & 0x10) != 0)
  {
    unsigned int v12 = 0;
  }

  else
  {
    if (!v10) {
      goto LABEL_3;
    }
    unsigned int v11 = mdb_midl_search(*(unsigned int **)(v3 + 64), 2 * v4);
    unsigned int v12 = v11;
    if (v10[v11] != 2 * v4) {
      goto LABEL_3;
    }
  }

  uint64_t result = mdb_midl_need(v7, v5);
  if (!(_DWORD)result)
  {
    if ((*(_WORD *)(a2 + 10) & 0x10) == 0)
    {
      if (*v10 == v12) {
        *unsigned int v10 = v12 - 1LL;
      }
      else {
        v10[v12] |= 1uLL;
      }
LABEL_23:
      uint64_t v23 = *v7;
      unsigned int v24 = **v7;
      if (v24)
      {
        while (1)
        {
          unsigned int v25 = v5 + v24;
          unint64_t v26 = *(void *)&v23[2 * v24];
          if (v26 >= v4) {
            break;
          }
          *(void *)&v23[2 * v25] = v26;
          if (!--v24)
          {
            unsigned int v25 = v5;
            break;
          }
        }
      }

      else
      {
        unsigned int v25 = v5;
      }

      if (v25 > v24)
      {
        int v27 = &v23[2 * v25];
        do
        {
          *(void *)int v27 = v4;
          v27 -= 2;
          ++v4;
          --v25;
        }

        while (v24 < v25);
      }

      *(void *)v23 += v5;
LABEL_4:
      uint64_t result = 0LL;
      *(void *)(*(void *)(a1 + 40) + 24LL) -= v5;
      return result;
    }

    unsigned int v13 = *(uint64_t **)(v3 + 72);
    uint64_t v14 = (*v13)--;
    unsigned int v15 = &v13[2 * v14];
    uint64_t v16 = v15[1];
    if (v16 == a2)
    {
LABEL_20:
      ++*(_DWORD *)(v3 + 128);
      if ((*(_BYTE *)(v6 + 14) & 8) == 0) {
        mdb_dpage_free(v6, (void *)a2);
      }
      goto LABEL_23;
    }

    uint64_t v17 = v14;
    uint64_t v18 = *v15;
    uint64_t v19 = v17 + 1;
    unsigned __int16 v20 = &v13[2 * v17 - 1];
    while ((unint64_t)--v19 >= 2)
    {
      uint64_t v21 = *(v20 - 1);
      uint64_t v22 = *v20;
      *(v20 - 1) = v18;
      *unsigned __int16 v20 = v16;
      v20 -= 2;
      uint64_t v18 = v21;
      uint64_t v16 = v22;
      if (v22 == a2) {
        goto LABEL_20;
      }
    }

    uint64_t v28 = *v13 + 1;
    uint64_t *v13 = v28;
    int v29 = &v13[2 * v28];
    *int v29 = v18;
    v29[1] = v16;
    *(_DWORD *)(v3 + 124) |= 2u;
    return 4294936517LL;
  }

  return result;
}

uint64_t mdb_page_split(uint64_t a1, uint64_t a2, size_t *a3, size_t a4, int a5)
{
  uint64_t v10 = *(void *)(*(void *)(a1 + 24) + 32LL);
  uint64_t v11 = *(unsigned __int16 *)(a1 + 66);
  uint64_t v12 = *(void *)(a1 + 8 * v11 + 72);
  unsigned int v13 = (void *)(a1 + 328);
  uint64_t v14 = *(unsigned __int16 *)(a1 + 328 + 2 * v11);
  int v15 = *(unsigned __int16 *)(v12 + 12);
  uint64_t result = mdb_page_new(a1, *(_WORD *)(v12 + 10), 1, &v194);
  if ((_DWORD)result) {
    return result;
  }
  v174 = a3;
  v178 = v194;
  uint64_t v179 = a2;
  *((_WORD *)v194 + 4) = *(_WORD *)(v12 + 8);
  int v17 = *(unsigned __int16 *)(a1 + 66);
  if (*(_WORD *)(a1 + 66))
  {
    size_t v171 = a4;
    int v18 = a5;
    uint64_t v19 = v10;
    uint64_t v176 = v14;
    unsigned int v20 = 0;
    unsigned int v21 = v17 - 1;
  }

  else
  {
    uint64_t result = mdb_page_new(a1, 1, 1, &v193);
    if ((_DWORD)result) {
      goto LABEL_177;
    }
    size_t v171 = a4;
    uint64_t v31 = *(unsigned __int16 *)(a1 + 64);
    if (*(_WORD *)(a1 + 64))
    {
      unint64_t v32 = v31 + 1;
      uint64_t v33 = (void *)(a1 + 8 * v31 + 72);
      int v34 = (_WORD *)(a1 + 2 * v31 + 328);
      uint64_t v35 = v33;
      uint64_t v36 = v34;
      do
      {
        uint64_t v37 = *--v35;
        *uint64_t v33 = v37;
        LOWORD(v37) = *--v36;
        *int v34 = v37;
        --v32;
        int v34 = v36;
        uint64_t v33 = v35;
      }

      while (v32 > 1);
    }

    unsigned __int16 v38 = v193;
    *(void *)(a1 + 72) = v193;
    *(_WORD *)(a1 + 328) = 0;
    uint64_t v39 = *(void *)(a1 + 40);
    *(void *)(v39 + 40) = *(void *)v38;
    unsigned int v20 = *(unsigned __int16 *)(v39 + 6);
    *(_WORD *)(v39 + 6) = v20 + 1;
    uint64_t result = mdb_node_add(a1, 0, 0LL, 0LL, *(void *)v12, 0);
    if ((_DWORD)result)
    {
      *(void *)(a1 + 72) = *(void *)(a1 + 80);
      *(_WORD *)(a1 + 328) = *(_WORD *)(a1 + 330);
      uint64_t v40 = *(void *)(a1 + 40);
      *(void *)(v40 + 40) = *(void *)v12;
      --*(_WORD *)(v40 + 6);
      goto LABEL_177;
    }

    int v18 = a5;
    uint64_t v19 = v10;
    uint64_t v176 = v14;
    unsigned int v21 = 0;
    ++*(_WORD *)(a1 + 64);
    LOWORD(v17) = *(_WORD *)(a1 + 66) + 1;
    *(_WORD *)(a1 + 66) = v17;
  }

  mdb_cursor_copy(a1, (uint64_t)v184);
  uint64_t v185 = 0LL;
  uint64_t v22 = v189;
  uint64_t v23 = (size_t *)v178;
  v191[v189] = v178;
  unsigned int v24 = &v184[v21];
  v24[164] = *(_WORD *)(a1 + 2LL * v21 + 328) + 1;
  unsigned int v172 = v21;
  unsigned int v170 = v20;
  if ((v18 & 0x20000) != 0)
  {
    unsigned int v41 = v21;
    uint64_t v42 = 0LL;
    unsigned int v175 = 0;
    v192[v22] = 0;
    v196[0] = *(_OWORD *)v179;
    size_t v43 = *(void *)&v196[0];
    signed int v44 = v176;
    signed int v173 = v176;
    uint64_t v28 = v19;
    int v45 = v18;
    goto LABEL_71;
  }

  unsigned int v25 = v15 - 16;
  unsigned int v26 = v25 >> 1;
  unsigned int v27 = ((v25 >> 1) + 1) >> 1;
  uint64_t v28 = v19;
  unsigned int v175 = v25 >> 1;
  v166 = v24;
  if ((*((_WORD *)v178 + 5) & 0x20) == 0)
  {
    unsigned int v29 = (v26 + 1) >> 1;
    if ((*(_WORD *)(v12 + 10) & 2) != 0)
    {
      unint64_t v53 = *(void *)v179 + *v174 + 8;
      uint64_t v54 = 8 - *v174;
      LODWORD(v30) = (v53 + v54 + 3) & 0xFFFFFFFE;
    }

    else if (v179)
    {
      uint64_t v30 = *(void *)v179 + 10LL;
    }

    else
    {
      LODWORD(v30) = 10;
    }

    int v58 = *(_DWORD *)(v28 + 16);
    uint64_t v59 = mdb_page_malloc(*(void *)(a1 + 24), 1u);
    if (v59)
    {
      uint64_t v42 = v59;
      int v60 = v58 - 16;
      int v61 = (v30 + 1) & 0xFFFFFFFE;
      *(void *)uint64_t v59 = *(void *)v12;
      *((_WORD *)v59 + 5) = *(_WORD *)(v12 + 10);
      *((_WORD *)v59 + 6) = 16;
      *((_WORD *)v59 + 7) = *(_DWORD *)(v28 + 16);
      if (v25 > 1)
      {
        int v66 = 0;
        unsigned int v62 = v25 >> 1;
        if (v175 <= 1) {
          uint64_t v67 = 1LL;
        }
        else {
          uint64_t v67 = v175;
        }
        uint64_t v68 = (__int16 *)(v12 + 16);
        signed int v44 = v176;
        uint64_t v69 = v176;
        unsigned int v65 = v29;
        do
        {
          if (!v69)
          {
            unint64_t v70 = &v59[2 * v66++];
            *((_WORD *)v70 + 8) = 0;
          }

          __int16 v71 = *v68++;
          uint64_t v72 = &v59[2 * v66++];
          *((_WORD *)v72 + 8) = v71;
          --v69;
          --v67;
        }

        while (v67);
        if (v60 >= 0) {
          int v73 = v58 - 16;
        }
        else {
          int v73 = v58 - 1;
        }
        BOOL v63 = v175 > v176;
        unsigned int v41 = v172;
        uint64_t v23 = (size_t *)v178;
        __int16 v64 = (size_t *)v179;
        if (v25 >= 0x40 && v61 <= v73 >> 4 && v175 > v176)
        {
          int v45 = v18;
          goto LABEL_68;
        }
      }

      else
      {
        signed int v44 = v176;
        uint64_t v23 = (size_t *)v178;
        unsigned int v62 = v25 >> 1;
        BOOL v63 = v175 > v176;
        unsigned int v41 = v172;
        __int16 v64 = (size_t *)v179;
        unsigned int v65 = v29;
      }

      if (v65 < v44 && v63)
      {
        int v74 = v65 - 1;
        int v75 = -1;
        BOOL v63 = 1;
        LODWORD(v76) = v62;
      }

      else
      {
        LODWORD(v76) = 0;
        if (v63)
        {
          BOOL v63 = 0;
          int v74 = v65 + ((*(unsigned __int16 *)(v12 + 10) >> 1) & 1) + 1;
          int v75 = 1;
          int v45 = v18;
          goto LABEL_54;
        }

        int v75 = 1;
        int v74 = v62;
      }

      int v45 = v18;
      if ((_DWORD)v76 != v74)
      {
LABEL_54:
        signed int v77 = 0;
        uint64_t v78 = v75;
        uint64_t v79 = v74 - v75;
        int v80 = -(int)v76;
        int v81 = -v74;
        uint64_t v76 = v76;
        while (1)
        {
          if (v44 == v76)
          {
            v77 += v61;
          }

          else
          {
            uint64_t v82 = v12 + *(unsigned __int16 *)&v42[2 * v76 + 16];
            int v83 = v77 + *(unsigned __int16 *)(v82 + 6) + 10;
            if ((*(_WORD *)(v12 + 10) & 2) != 0)
            {
              if ((*(_WORD *)(v82 + 4) & 1) != 0) {
                v83 += 8;
              }
              else {
                v83 += *(_DWORD *)v82;
              }
            }

            signed int v77 = (v83 + 1) & 0xFFFFFFFE;
          }

          if (v77 > v60 || v79 == v76) {
            break;
          }
          v76 += v78;
          v80 -= v78;
          if (v81 == v80) {
            goto LABEL_67;
          }
        }

        unsigned int v65 = v63 - v80;
LABEL_67:
        uint64_t v23 = (size_t *)v178;
      }

LABEL_71:
  uint64_t v86 = v191[v41];
  unsigned __int16 v87 = *(_WORD *)(v86 + 14) - *(_WORD *)(v86 + 12);
  unint64_t v168 = v43 + 10;
  if (v43 + 10 <= v87)
  {
    unsigned __int16 v167 = *(_WORD *)(v86 + 14) - *(_WORD *)(v86 + 12);
    --v189;
    LODWORD(result) = mdb_node_add((uint64_t)v184, (unsigned __int16)v24[164], (const void **)v196, 0LL, *v23, 0);
    ++v189;
    size_t v100 = v171;
    uint64_t v101 = (const void **)v179;
    if (!(_DWORD)result) {
      goto LABEL_91;
    }
    goto LABEL_82;
  }

  signed int v177 = v44;
  int v169 = v45;
  uint64_t v88 = v28;
  unsigned int v89 = *(unsigned __int16 *)(a1 + 64);
  --v188;
  --v189;
  uint64_t v90 = *(void *)(v186 + 104);
  uint64_t v91 = v187;
  uint64_t v92 = (const void **)v184;
  if ((v190 & 4) != 0)
  {
    int v183 = 1;
    v182 = v184;
    uint64_t v92 = (const void **)&v180;
  }

  *uint64_t v92 = *(const void **)(v90 + 8LL * v187);
  *(void *)(v90 + 8 * v91) = v92;
  uint64_t result = mdb_page_split(v184, v196, 0LL, *v23, 0LL);
  *(void *)(v90 + 8 * v91) = *v92;
  uint64_t v28 = v88;
  if ((_DWORD)result) {
    goto LABEL_174;
  }
  unsigned __int16 v167 = v87;
  else {
    unint64_t v93 = v172 + 1;
  }
  uint64_t v94 = v191[v93];
  uint64_t v95 = a1 + 8LL * v93;
  uint64_t v98 = *(void *)(v95 + 72);
  __int128 v96 = (void *)(v95 + 72);
  uint64_t v97 = v98;
  unsigned int v172 = v93;
  if (v94 == v98)
  {
    int v45 = v169;
    signed int v44 = v177;
    size_t v100 = v171;
    uint64_t v101 = (const void **)v179;
    goto LABEL_91;
  }

  uint64_t v99 = a1 + 2 * v93;
  signed int v44 = v177;
  size_t v100 = v171;
  uint64_t v101 = (const void **)v179;
  if (*(unsigned __int16 *)(v99 + 328) < (*(unsigned __int16 *)(v97 + 12) - 16) >> 1)
  {
    int v45 = v169;
    goto LABEL_91;
  }

  int v45 = v169;
  if ((int)v93 >= 1)
  {
    unint64_t v102 = 0LL;
    uint64_t v103 = a1 + 328;
    do
    {
      *(void *)(v103 + 8 * v102 - 256) = v191[v102];
      *(_WORD *)(v103 + 2 * v102) = v192[v102];
      ++v102;
    }

    while (v102 < v93);
  }

  int v104 = (_WORD *)(v99 + 328);
  *__int128 v96 = v94;
  if (v192[v93])
  {
    _WORD *v104 = v192[v93] - 1;
    goto LABEL_91;
  }

  _WORD *v104 = 0;
  LODWORD(result) = mdb_cursor_sibling(a1, 0LL);
  if ((_DWORD)result)
  {
LABEL_82:
    if ((_DWORD)result == -30798) {
      uint64_t result = 4294936517LL;
    }
    else {
      uint64_t result = result;
    }
    goto LABEL_174;
  }

LABEL_91:
  if ((v45 & 0x20000) != 0)
  {
    uint64_t v124 = *(unsigned __int16 *)(a1 + 66);
    *(void *)(a1 + 8 * v124 + 72) = v178;
    *(_WORD *)(a1 + 2 * v124 + 328) = 0;
    uint64_t result = mdb_node_add(a1, 0, v101, v174, v100, v45);
    unsigned __int16 v117 = v167;
    if ((_DWORD)result) {
      goto LABEL_174;
    }
    unsigned int v116 = v170;
    unsigned int v123 = v172;
    if (*(_WORD *)(a1 + 66))
    {
      memcpy(v13, v192, 2LL * *(unsigned __int16 *)(a1 + 66));
      unsigned int v123 = v172;
    }

    goto LABEL_139;
  }

  if ((*(_WORD *)(v12 + 10) & 0x20) != 0)
  {
    unsigned int v116 = v170;
    unsigned int v123 = v172;
    unsigned __int16 v117 = v167;
    if (v173 <= v44)
    {
      *(void *)(a1 + 72 + 8LL * *(unsigned __int16 *)(a1 + 66)) = v178;
      uint64_t v125 = a1 + 2LL * v172;
      unsigned __int16 v126 = *(_WORD *)(v125 + 328) + 1;
      *(_WORD *)(v125 + 328) = v126;
      uint64_t v127 = *(void *)(a1 + 72 + 8LL * v172);
      if (v191[v172] != v127
        && (*(unsigned __int16 *)(v127 + 12) - 16) >> 1 <= v126
        && (v172 & 0x80000000) == 0)
      {
        uint64_t v128 = 0LL;
        do
        {
          *(void *)(a1 + 8 * v128 + 72) = v191[v128];
          *(_WORD *)(a1 + 2 * v128 + 328) = v192[v128];
          ++v128;
        }

        while (v172 + 1 != v128);
      }
    }

LABEL_139:
    id v135 = *(uint64_t **)(*(void *)(*(void *)(a1 + 24) + 104LL) + 8LL * *(unsigned int *)(a1 + 32));
    if (!v135)
    {
LABEL_173:
      uint64_t result = 0LL;
      goto LABEL_174;
    }

    unsigned int v136 = *(unsigned __int16 *)(v12 + 12) - 16;
    unsigned int v137 = v136 >> 1;
    int v138 = *(_DWORD *)(a1 + 68);
    id v139 = v194;
    uint64_t v140 = 2LL * v116 + 330;
    uint64_t v141 = 8LL * v116 + 80;
    while (1)
    {
      char v142 = v135;
      if ((v138 & 4) != 0) {
        char v142 = (uint64_t *)v135[2];
      }
      if (!v116) {
        break;
      }
      if (v142[9] == v12)
      {
        id v143 = (_WORD *)((char *)v142 + v140);
        uint64_t v144 = (uint64_t *)((char *)v142 + v141);
        uint64_t v145 = v116 + 1LL;
        v146 = (_WORD *)((char *)v142 + v140);
        v147 = (uint64_t *)((char *)v142 + v141);
        do
        {
          __int16 v148 = *--v146;
          *id v143 = v148;
          uint64_t v149 = *--v147;
          *uint64_t v144 = v149;
          uint64_t v144 = v147;
          id v143 = v146;
        }

        while (v145-- > 1);
        *((_WORD *)v142 + 164) = v137 <= *((unsigned __int16 *)v142 + 164);
        v142[9] = *(void *)(a1 + 72);
        ++*((_WORD *)v142 + 32);
        unsigned __int16 v151 = *((_WORD *)v142 + 33) + 1;
        *((_WORD *)v142 + 33) = v151;
        goto LABEL_152;
      }

LABEL_172:
      id v135 = (uint64_t *)*v135;
      if (!v135) {
        goto LABEL_173;
      }
    }

    unsigned __int16 v151 = *((_WORD *)v142 + 33);
LABEL_152:
    uint64_t v152 = *(unsigned __int16 *)(a1 + 66);
    if (v152 <= v151 && v142[v152 + 9] == v12)
    {
      uint64_t v155 = (uint64_t)v142 + 2 * v152;
      unsigned int v156 = *(unsigned __int16 *)(v155 + 328);
      if ((v45 & 0x40000) == 0 && v156 >= v44)
      {
        *(_WORD *)(v155 + 328) = v156 + 1;
        uint64_t v152 = *(unsigned __int16 *)(a1 + 66);
        unsigned int v156 = *((unsigned __int16 *)v142 + v152 + 164);
      }

      if (v137 <= v156)
      {
        v142[v152 + 9] = (uint64_t)v139;
        *((_WORD *)v142 + v152 + 164) = v156 - (v136 >> 1);
        if (*(_WORD *)(a1 + 66))
        {
          unint64_t v157 = 0LL;
          v158 = v142 + 41;
          do
          {
            *((_WORD *)v158 + v157) = v192[v157];
            v158[v157 - 32] = v191[v157];
            ++v157;
          }

          while (v157 < *(unsigned __int16 *)(a1 + 66));
        }
      }
    }

    else if (v168 <= v117 && (int)v123 <= v151 && v142[v123 + 9] == *(void *)(a1 + 8LL * v123 + 72))
    {
      uint64_t v153 = (uint64_t)v142 + 2 * v123;
      unsigned int v154 = *(unsigned __int16 *)(v153 + 328);
    }

    if ((*(_WORD *)(v12 + 10) & 2) != 0)
    {
      uint64_t v159 = v142[2];
      if (v159)
      {
        if ((*(_BYTE *)(v159 + 68) & 1) != 0)
        {
          uint64_t v160 = *(unsigned __int16 *)(a1 + 66);
          uint64_t v161 = v142[v160 + 9];
          uint64_t v162 = *((unsigned __int16 *)v142 + v160 + 164);
          if (v162 < (*(unsigned __int16 *)(v161 + 12) - 16) >> 1)
          {
            uint64_t v163 = v161 + *(unsigned __int16 *)(v161 + 2 * v162 + 16);
            if ((*(_WORD *)(v163 + 4) & 6) == 4) {
              *(void *)(v159 + 72) = v163 + *(unsigned __int16 *)(v163 + 6) + 8;
            }
          }
        }
      }
    }

    goto LABEL_172;
  }

  uint64_t v165 = v28;
  int v105 = 0;
  size_t v106 = 0LL;
  *(void *)(a1 + 8LL * *(unsigned __int16 *)(a1 + 66) + 72) = v178;
  int v107 = v195;
  signed int v108 = v173;
  while (1)
  {
    if (v108 == v44)
    {
      uint64_t v109 = *(unsigned int **)(v179 + 8);
      size_t v180 = *(void *)v179;
      v181 = v109;
      if ((*(_WORD *)(v12 + 10) & 2) != 0) {
        int v107 = v174;
      }
      else {
        size_t v106 = v100;
      }
      *(_WORD *)(a1 + 2LL * *(unsigned __int16 *)(a1 + 66) + 328) = v105;
      __int16 v110 = *(_WORD *)(v12 + 10);
      LODWORD(v111) = v45;
    }

    else
    {
      int v112 = (unsigned int *)(v12 + *(unsigned __int16 *)&v42[2 * v108 + 16]);
      v181 = v112 + 2;
      int v113 = (char *)*((unsigned __int16 *)v112 + 3);
      size_t v180 = (size_t)v113;
      __int16 v110 = *(_WORD *)(v12 + 10);
      if ((v110 & 2) != 0)
      {
        v195[0] = *v112;
        v195[1] = &v113[(void)(v112 + 2)];
        LODWORD(v111) = *((unsigned __int16 *)v112 + 2);
        int v107 = v195;
      }

      else
      {
        uint64_t v111 = *((unsigned __int16 *)v112 + 2);
        size_t v106 = *v112 | (unint64_t)(v111 << 32);
      }
    }

    if (!(v110 & 2 | v105)) {
      size_t v180 = 0LL;
    }
    uint64_t result = mdb_node_add(a1, (unsigned __int16)v105, (const void **)&v180, v107, v106, v111);
    if ((_DWORD)result) {
      break;
    }
    if (v108 == v175)
    {
      int v105 = 0;
      signed int v108 = 0;
      *(void *)(a1 + 8LL * *(unsigned __int16 *)(a1 + 66) + 72) = v42;
    }

    else
    {
      ++v108;
      ++v105;
    }

    if (v108 == v173)
    {
      LODWORD(v114) = *((unsigned __int16 *)v42 + 6);
      unsigned int v115 = (v114 - 16) >> 1;
      uint64_t v28 = v165;
      unsigned int v116 = v170;
      unsigned __int16 v117 = v167;
      if ((v114 - 16) >= 2)
      {
        if (v115 <= 1) {
          uint64_t v118 = 1LL;
        }
        else {
          uint64_t v118 = v115;
        }
        uint64_t v119 = (__int16 *)(v42 + 16);
        uint64_t v120 = (_WORD *)(v12 + 16);
        do
        {
          __int16 v121 = *v119++;
          *v120++ = v121;
          --v118;
        }

        while (v118);
        uint64_t v114 = *((unsigned __int16 *)v42 + 6);
      }

      *(_WORD *)(v12 + 12) = v114;
      *(_WORD *)(v12 + 14) = *((_WORD *)v42 + 7);
      memcpy( (void *)(v12 + *(unsigned __int16 *)(v12 + 2LL * v115 - 2 + 16)),  &v42[*(unsigned __int16 *)&v42[2 * v115 + 14]],  *(_DWORD *)(v165 + 16) - *((unsigned __int16 *)v42 + 7));
      if (v173 <= v44)
      {
        uint64_t v122 = *(unsigned __int16 *)(a1 + 66);
        *(void *)(a1 + 72 + 8 * v122) = v194;
        unsigned int v123 = v172;
        uint64_t v129 = a1 + 2LL * v172;
        unsigned __int16 v130 = *(_WORD *)(v129 + 328) + 1;
        *(_WORD *)(v129 + 328) = v130;
        uint64_t v131 = *(void *)(a1 + 72 + 8LL * v172);
        if (v191[v172] != v131
          && (*(unsigned __int16 *)(v131 + 12) - 16) >> 1 <= v130
          && (v172 & 0x80000000) == 0)
        {
          uint64_t v132 = 0LL;
          do
          {
            *(void *)(a1 + 8 * v132 + 72) = v191[v132];
            *(_WORD *)(a1 + 2 * v132 + 328) = v192[v132];
            ++v132;
          }

          while (v172 + 1 != v132);
        }
      }

      else
      {
        uint64_t v122 = *(unsigned __int16 *)(a1 + 66);
        *(void *)(a1 + 8 * v122 + 72) = v12;
        unsigned int v123 = v172;
      }

      if ((v45 & 0x10000) != 0)
      {
        uint64_t v133 = *(void *)(a1 + 8LL * v122 + 72);
        uint64_t v134 = v133
             + *(unsigned __int16 *)(v133 + 2LL * *(unsigned __int16 *)(a1 + 2LL * v122 + 328) + 16);
        if ((*(_WORD *)(v134 + 4) & 1) == 0) {
          v174[1] = v134 + *(unsigned __int16 *)(v134 + 6) + 8;
        }
      }

      goto LABEL_139;
    }
  }

  uint64_t v28 = v165;
LABEL_174:
  if (v42)
  {
    *(void *)uint64_t v42 = *(void *)(v28 + 192);
    *(void *)(v28 + 192) = v42;
  }

  if ((_DWORD)result) {
    goto LABEL_177;
  }
  return result;
}

uint64_t mdb_node_add(uint64_t a1, int a2, const void **a3, size_t *a4, size_t a5, int a6)
{
  uint64_t v8 = *(_WORD **)(a1 + 8LL * *(unsigned __int16 *)(a1 + 66) + 72);
  uint64_t v35 = 0LL;
  __int16 v9 = v8[5];
  if ((v9 & 0x20) != 0)
  {
    size_t v15 = **(int **)(a1 + 40);
    int v16 = (((unsigned __int16)v8[6] - 16) >> 1) - a2;
    if (v16 >= 1) {
      memmove((char *)v8 + (int)v15 * (uint64_t)a2 + v15 + 16, (char *)v8 + (int)v15 * (uint64_t)a2 + 16, v16 * (int)v15);
    }
    memcpy((char *)v8 + (int)v15 * (uint64_t)a2 + 16, a3[1], v15);
    uint64_t result = 0LL;
    v8[6] += 2;
    v8[7] = v8[7] - v15 + 2;
    return result;
  }

  int v10 = a6;
  int v13 = (unsigned __int16)v8[6];
  if (a3) {
    uint64_t v14 = (uint64_t)*a3 + 8;
  }
  else {
    uint64_t v14 = 8LL;
  }
  uint64_t v18 = (unsigned __int16)(v8[7] - v13) - 2LL;
  if ((v9 & 2) == 0)
  {
    unint64_t v19 = v14;
    goto LABEL_16;
  }

  if ((a6 & 1) != 0)
  {
    unint64_t v19 = v14 + 8;
LABEL_16:
    int64_t v22 = (v19 + 1) & 0xFFFFFFFFFFFFFFFELL;
    if (v22 > v18)
    {
      uint64_t v20 = *(void *)(a1 + 24);
      goto LABEL_18;
    }

    goto LABEL_19;
  }

  unint64_t v19 = *a4 + v14;
  uint64_t v20 = *(void *)(a1 + 24);
  uint64_t v21 = *(void *)(v20 + 32);
  int64_t v22 = (v14 + 9) & 0xFFFFFFFFFFFFFFFELL;
  if (v22 > v18)
  {
LABEL_18:
    *(_DWORD *)(v20 + 124) |= 2u;
    return 4294936510LL;
  }

  uint64_t result = mdb_page_new(a1, 4, ((*a4 + 15) / *(unsigned int *)(v21 + 16)) + 1, &v35);
  if ((_DWORD)result) {
    return result;
  }
  v10 |= 1u;
  int v13 = (unsigned __int16)v8[6];
LABEL_19:
  unsigned int v23 = (v13 - 16) >> 1;
  if (v23 > a2)
  {
    unsigned int v24 = &v8[v23 + 8];
    unsigned int v25 = &v8[v23 + 7];
    do
    {
      --v23;
      __int16 v26 = *v25--;
      *v24-- = v26;
    }

    while (v23 > a2);
    LOWORD(v13) = v8[6];
  }

  unsigned __int16 v27 = v8[7] - v22;
  v8[a2 + 8] = v27;
  v8[7] = v27;
  v8[6] = v13 + 2;
  uint64_t v28 = (char *)v8 + v27;
  if (a3) {
    unsigned __int16 v29 = *(_WORD *)a3;
  }
  else {
    unsigned __int16 v29 = 0;
  }
  *((_WORD *)v28 + 3) = v29;
  *((_WORD *)v28 + 2) = v10;
  if ((v8[5] & 2) != 0) {
    a5 = *a4;
  }
  else {
    *((_WORD *)v28 + 2) = WORD2(a5);
  }
  *(_DWORD *)uint64_t v28 = a5;
  if (a3) {
    memcpy(v28 + 8, a3[1], (size_t)*a3);
  }
  if ((v8[5] & 2) != 0)
  {
    uint64_t v30 = &v28[v29 + 8];
    if (v35)
    {
      uint64_t v31 = v35 + 16;
      *(void *)uint64_t v30 = *(void *)v35;
      if ((v10 & 0x10000) != 0)
      {
        uint64_t result = 0LL;
        a4[1] = (size_t)v31;
        return result;
      }

      size_t v33 = *a4;
      unint64_t v32 = (const void *)a4[1];
      int v34 = v31;
    }

    else
    {
      if ((v10 & 1) != 0)
      {
        uint64_t result = 0LL;
        *(void *)uint64_t v30 = *(void *)a4[1];
        return result;
      }

      if ((v10 & 0x10000) != 0)
      {
        uint64_t result = 0LL;
        a4[1] = (size_t)v30;
        return result;
      }

      size_t v33 = *a4;
      unint64_t v32 = (const void *)a4[1];
      int v34 = &v28[v29 + 8];
    }

    memcpy(v34, v32, v33);
  }

  return 0LL;
}

uint64_t mdb_xcursor_init1(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  int v3 = *(_DWORD *)(v2 + 68) & 0xA0004;
  *(_DWORD *)(v2 + 68) = v3;
  if ((*(_BYTE *)(a2 + 4) & 2) != 0)
  {
    uint64_t v8 = a2 + *(unsigned __int16 *)(a2 + 6);
    __int128 v9 = *(_OWORD *)(v8 + 8);
    __int128 v10 = *(_OWORD *)(v8 + 40);
    *(_OWORD *)(v2 + 408) = *(_OWORD *)(v8 + 24);
    *(_OWORD *)(v2 + 424) = v10;
    *(_OWORD *)(v2 + 392) = v9;
    *(void *)(v2 + 72) = 0LL;
    *(_DWORD *)(v2 + 64) = 0;
  }

  else
  {
    uint64_t v4 = a2 + *(unsigned __int16 *)(a2 + 6);
    *(void *)(v2 + 392) = 0x1000000000000LL;
    __int16 v6 = *(_WORD *)(v4 + 8);
    uint64_t v5 = (_WORD *)(v4 + 8);
    *(_OWORD *)(v2 + 400) = xmmword_100017AE0;
    *(void *)(v2 + 416) = 0LL;
    *(void *)(v2 + 424) = ((unsigned __int16)v5[6] - 16) >> 1;
    *(_WORD *)(v2 + 432) = v6;
    *(_WORD *)(v2 + 434) = v5[1];
    *(_WORD *)(v2 + 436) = v5[2];
    *(_WORD *)(v2 + 438) = v5[3];
    *(_DWORD *)(v2 + 64) = 1;
    *(_DWORD *)(v2 + 68) = v3 | 1;
    *(void *)(v2 + 72) = v5;
    *(_WORD *)(v2 + 328) = 0;
    uint64_t v7 = *(void *)(result + 40);
    if ((*(_BYTE *)(v7 + 4) & 0x10) != 0)
    {
      *(_WORD *)(v2 + 396) = 16;
      *(_DWORD *)(v2 + 392) = (unsigned __int16)v5[4];
      if ((*(_BYTE *)(v7 + 4) & 0x20) != 0) {
        *(_WORD *)(v2 + 396) = 24;
      }
    }
  }

  *(_BYTE *)(v2 + 488) = 56;
  return result;
}

__n128 mdb_xcursor_init2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (a3)
  {
    int v4 = *(_DWORD *)(v3 + 68) | 1;
    *(_DWORD *)(v3 + 64) = 1;
    *(_DWORD *)(v3 + 68) = v4;
    *(_WORD *)(v3 + 328) = 0;
    *(_BYTE *)(v3 + 488) = 56;
    *(void *)(v3 + 456) = *(void *)(a2 + 456);
  }

  else if ((*(_BYTE *)(v3 + 68) & 1) == 0)
  {
    return result;
  }

  __n128 result = *(__n128 *)(a2 + 392);
  __int128 v6 = *(_OWORD *)(a2 + 424);
  *(_OWORD *)(v3 + 408) = *(_OWORD *)(a2 + 408);
  *(_OWORD *)(v3 + 424) = v6;
  *(__n128 *)(v3 + 392) = result;
  *(void *)(v3 + 72) = *(void *)(a2 + 72);
  return result;
}

uint64_t mdb_cursor_del(uint64_t a1, int a2)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 24) + 124LL);
  if ((v2 & 0x20013) != 0)
  {
    if ((v2 & 0x20000) != 0) {
      return 13LL;
    }
    else {
      return 4294936514LL;
    }
  }

  if ((*(_BYTE *)(a1 + 68) & 1) == 0) {
    return 22LL;
  }
  if (*(unsigned __int16 *)(a1 + 2LL * *(unsigned __int16 *)(a1 + 66) + 328) >= (*(unsigned __int16 *)(*(void *)(a1 + 8LL * *(unsigned __int16 *)(a1 + 66) + 72) + 12LL)
                                                                                - 16) >> 1)
    return 4294936498LL;
  if ((a2 & 0x8000) != 0 || (uint64_t result = mdb_page_spill(a1, 0LL, 0LL), !(_DWORD)result))
  {
    uint64_t result = mdb_cursor_touch(a1);
    if (!(_DWORD)result)
    {
      uint64_t v6 = *(unsigned __int16 *)(a1 + 66);
      uint64_t v7 = *(void *)(a1 + 8 * v6 + 72);
      __int16 v8 = *(_WORD *)(v7 + 10);
      if ((v8 & 2) == 0) {
        return 4294936500LL;
      }
      if ((v8 & 0x20) != 0) {
        return mdb_cursor_del0(a1);
      }
      uint64_t v9 = v7 + *(unsigned __int16 *)(v7 + 2LL * *(unsigned __int16 *)(a1 + 2 * v6 + 328) + 16);
      int v10 = *(unsigned __int16 *)(v9 + 4);
      if ((v10 & 4) == 0)
      {
        if (((v10 ^ a2) & 2) != 0)
        {
          uint64_t result = 4294936512LL;
LABEL_45:
          *(_DWORD *)(*(void *)(a1 + 24) + 124LL) |= 2u;
          return result;
        }

        goto LABEL_41;
      }

      if ((a2 & 0x20) != 0)
      {
        uint64_t v11 = *(void *)(a1 + 16);
        *(void *)(*(void *)(a1 + 40) + 32LL) = *(void *)(*(void *)(a1 + 40) + 32LL)
                                                 - *(void *)(v11 + 424)
                                                 + 1LL;
        *(_DWORD *)(v11 + 68) &= ~1u;
        if ((v10 & 2) == 0) {
          goto LABEL_41;
        }
        goto LABEL_38;
      }

      if ((v10 & 2) == 0) {
        *(void *)(*(void *)(a1 + 16) + 72LL) = v9 + *(unsigned __int16 *)(v9 + 6) + 8;
      }
      uint64_t result = mdb_cursor_del(*(void *)(a1 + 16), 0x8000LL);
      if (!(_DWORD)result)
      {
        uint64_t v11 = *(void *)(a1 + 16);
        if (*(void *)(v11 + 424))
        {
          if ((*(_WORD *)(v9 + 4) & 2) != 0)
          {
            uint64_t v18 = v9 + *(unsigned __int16 *)(v9 + 6);
            __int128 v20 = *(_OWORD *)(v11 + 408);
            __int128 v19 = *(_OWORD *)(v11 + 424);
            *(_OWORD *)(v18 + 8) = *(_OWORD *)(v11 + 392);
            *(_OWORD *)(v18 + 24) = v20;
            *(_OWORD *)(v18 + 40) = v19;
          }

          else
          {
            mdb_node_shrink((char *)v7, *(unsigned __int16 *)(a1 + 328 + 2LL * *(unsigned __int16 *)(a1 + 66)));
            uint64_t v12 = *(unsigned __int16 *)(a1 + 66);
            uint64_t v13 = v7 + *(unsigned __int16 *)(v7 + 2LL * *(unsigned __int16 *)(a1 + 328 + 2 * v12) + 16);
            *(void *)(*(void *)(a1 + 16) + 72LL) = v13 + *(unsigned __int16 *)(v13 + 6) + 8;
            for (unsigned int i = *(uint64_t **)(*(void *)(*(void *)(a1 + 24) + 104LL) + 8LL * *(unsigned int *)(a1 + 32));
                  i;
                  unsigned int i = (uint64_t *)*i)
            {
              if (i != (uint64_t *)a1
                && *((unsigned __int16 *)i + 32) >= *(unsigned __int16 *)(a1 + 64)
                && (*((_BYTE *)i + 68) & 1) != 0
                && i[v12 + 9] == v7)
              {
                uint64_t v15 = i[2];
                if (v15)
                {
                  if ((*(_BYTE *)(v15 + 68) & 1) != 0)
                  {
                    uint64_t v16 = *((unsigned __int16 *)i + v12 + 164);
                    if (v16 < (*(unsigned __int16 *)(v7 + 12) - 16) >> 1)
                    {
                      uint64_t v17 = v7 + *(unsigned __int16 *)(v7 + 2 * v16 + 16);
                      if ((*(_WORD *)(v17 + 4) & 6) == 4) {
                        *(void *)(v15 + 72) = v17 + *(unsigned __int16 *)(v17 + 6) + 8;
                      }
                    }
                  }
                }
              }
            }
          }

          uint64_t result = 0LL;
          --*(void *)(*(void *)(a1 + 40) + 32LL);
          return result;
        }

        *(_DWORD *)(v11 + 68) &= ~1u;
        LOWORD(std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100]( v11, v10) = *(_WORD *)(v9 + 4);
        if ((v10 & 2) == 0)
        {
LABEL_41:
          if ((v10 & 1) != 0)
          {
            uint64_t result = mdb_page_get( a1,  *(void *)(v9 + *(unsigned __int16 *)(v9 + 6) + 8),  (unint64_t *)&v21,  0LL);
            if ((_DWORD)result) {
              goto LABEL_45;
            }
            uint64_t result = mdb_ovpage_free(a1, v21);
            if ((_DWORD)result) {
              goto LABEL_45;
            }
          }

          return mdb_cursor_del0(a1);
        }

LABEL_38:
        uint64_t result = mdb_drop0(v11, 0);
        if ((_DWORD)result) {
          goto LABEL_45;
        }
        LOWORD(std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100]( v11, v10) = *(_WORD *)(v9 + 4);
        goto LABEL_41;
      }
    }
  }

  return result;
}

char *mdb_node_shrink(char *result, int a2)
{
  int v2 = result;
  uint64_t v3 = &result[2 * a2];
  int v5 = *((unsigned __int16 *)v3 + 8);
  int v4 = (unsigned __int16 *)(v3 + 16);
  uint64_t v6 = &result[v5];
  uint64_t v7 = &v6[*((unsigned __int16 *)v6 + 3)];
  __int16 v8 = v7 + 8;
  int v9 = *((unsigned __int16 *)v7 + 10);
  unsigned __int16 v10 = *((_WORD *)v7 + 11) - v9;
  __int16 v11 = *(_WORD *)v6 - v10;
  if ((*((_WORD *)v7 + 9) & 0x20) != 0)
  {
    if ((v11 & 1) != 0) {
      return result;
    }
    uint64_t v12 = (unsigned __int16)(*((_WORD *)v7 + 11) - v9);
    uint64_t v13 = (unsigned __int16)(*(_WORD *)v6 - v10);
  }

  else
  {
    uint64_t v12 = (unsigned __int16)(*((_WORD *)v7 + 11) - v9);
    if ((v9 - 16) >= 2)
    {
      unint64_t v14 = ((v9 - 16) >> 1) + 1LL;
      uint64_t v13 = 16LL;
      do
      {
        *(_WORD *)((char *)&v8[(v14 - 2) + 8] + std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100]( v11, v10) = v8[(v14 - 2) + 8] - v10;
        --v14;
      }

      while (v14 > 1);
    }

    else
    {
      uint64_t v13 = 16LL;
    }
  }

  v8[7] = v9;
  *(void *)__int16 v8 = *(void *)result;
  *(_WORD *)uint64_t v6 = v11;
  *((_WORD *)v6 + 1) = 0;
  uint64_t result = (char *)memmove( &result[*((unsigned __int16 *)result + 7) + v12],  &result[*((unsigned __int16 *)result + 7)],  (char *)v8 + v13 - &result[*((unsigned __int16 *)result + 7)]);
  unsigned int v15 = *((unsigned __int16 *)v2 + 6) - 16;
  if (v15 >= 2)
  {
    unsigned int v16 = *v4;
    unint64_t v17 = (v15 >> 1) + 1LL;
    do
    {
      uint64_t v18 = &v2[2 * (v17 - 2)];
      unsigned int v21 = *((unsigned __int16 *)v18 + 8);
      __int128 v19 = v18 + 16;
      __int16 v20 = v21;
      if (v21 <= v16) {
        *__int128 v19 = v20 + v10;
      }
      --v17;
    }

    while (v17 > 1);
  }

  *((_WORD *)v2 + 7) += v10;
  return result;
}

uint64_t mdb_drop0(uint64_t a1, int a2)
{
  LODWORD(result) = mdb_page_search(a1, 0LL, 4);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == -30798) {
      uint64_t result = 0LL;
    }
    else {
      uint64_t result = result;
    }
    goto LABEL_61;
  }

  int v5 = *(_DWORD *)(a1 + 68);
  if (((v5 & 4) != 0 || !a2 && !*(void *)(*(void *)(a1 + 40) + 24LL)) && *(_WORD *)(a1 + 64))
  {
    __int16 v6 = *(_WORD *)(a1 + 64) - 1;
    *(_WORD *)(a1 + 64) = v6;
    if (v6) {
      --*(_WORD *)(a1 + 66);
    }
    else {
      *(_DWORD *)(a1 + 68) = v5 & 0xFFFFFFFE;
    }
  }

  uint64_t v7 = *(void *)(a1 + 24);
  mdb_cursor_copy(a1, (uint64_t)v34);
  if (!*(_WORD *)(a1 + 64)) {
    goto LABEL_58;
  }
  uint64_t v31 = v7;
  unint64_t v32 = (uint64_t **)(v7 + 40);
  uint64_t v8 = a1 + 330;
  while (1)
  {
    int v9 = *(_WORD **)(a1 + 8LL * *(unsigned __int16 *)(a1 + 66) + 72);
    unsigned int v10 = (unsigned __int16)v9[6] - 16;
    unsigned int v11 = v10 >> 1;
    if ((v9[5] & 2) != 0)
    {
      if (v10 >= 2)
      {
        uint64_t v13 = 0LL;
        if (v11 <= 1) {
          uint64_t v12 = 1LL;
        }
        else {
          uint64_t v12 = v11;
        }
        do
        {
          uint64_t v14 = (uint64_t)v9 + (unsigned __int16)v9[v13 + 8];
          __int16 v15 = *(_WORD *)(v14 + 4);
          if ((v15 & 1) != 0)
          {
            unint64_t v16 = *(void *)(v14 + *(unsigned __int16 *)(v14 + 6) + 8);
            uint64_t result = mdb_page_get(a1, v16, &v33, 0LL);
            if ((_DWORD)result
              || (v17 = v33, uint64_t result = mdb_midl_append_range(v32, v16, *(_DWORD *)(v33 + 12)), (_DWORD)result))
            {
LABEL_55:
              uint64_t v7 = v31;
              goto LABEL_60;
            }

            uint64_t v18 = *(void *)(a1 + 40);
            uint64_t v19 = *(void *)(v18 + 24) - *(unsigned int *)(v17 + 12);
            *(void *)(v18 + 24) = v19;
            if (!a2 && !v19)
            {
              uint64_t v7 = v31;
              goto LABEL_47;
            }
          }

          else if (a2)
          {
            if ((v15 & 2) != 0)
            {
              mdb_xcursor_init1(a1, v14);
              uint64_t result = mdb_drop0(*(void *)(a1 + 16), 0LL);
              if ((_DWORD)result) {
                goto LABEL_55;
              }
            }
          }

          ++v13;
        }

        while (v12 != v13);
        uint64_t v7 = v31;
        if (a2) {
          goto LABEL_42;
        }
LABEL_35:
        if (!*(void *)(*(void *)(a1 + 40) + 24LL)) {
          goto LABEL_47;
        }
        goto LABEL_42;
      }

      LOWORD(v12) = 0;
      if (!a2) {
        goto LABEL_35;
      }
    }

    else
    {
      uint64_t result = mdb_midl_need((_DWORD **)v32, v10 >> 1);
      if ((_DWORD)result) {
        goto LABEL_60;
      }
      if (v10 >= 2)
      {
        __int16 v20 = *v32;
        uint64_t v21 = v11 <= 1 ? 1LL : v11;
        LOWORD(v12) = v21;
        int64_t v22 = v9 + 8;
        do
        {
          unsigned int v23 = *v22++;
          unint64_t v24 = *(unsigned int *)((char *)v9 + v23) | ((unint64_t)*(unsigned __int16 *)((char *)v9 + v23 + 4) << 32);
          uint64_t v25 = *v20 + 1;
          *__int16 v20 = v25;
          v20[v25] = v24;
          --v21;
        }

        while (v21);
      }

      else
      {
        LOWORD(v12) = 0;
      }
    }

LABEL_42:
    if (!*(_WORD *)(a1 + 66)) {
      goto LABEL_58;
    }
    *(_WORD *)(a1 + 2LL * *(unsigned __int16 *)(a1 + 66) + 328) = v12;
    uint64_t result = mdb_cursor_sibling(a1, 1LL);
    if ((_DWORD)result != -30798)
    {
      if ((_DWORD)result) {
        goto LABEL_59;
      }
      int v26 = *(unsigned __int16 *)(a1 + 64);
      goto LABEL_53;
    }

LABEL_47:
    __int16 v27 = *(_WORD *)(a1 + 64);
    if (!v27) {
      goto LABEL_57;
    }
    unsigned __int16 v28 = v27 - 1;
    *(_WORD *)(a1 + 64) = v27 - 1;
    if (v27 == 1) {
      break;
    }
    --*(_WORD *)(a1 + 66);
    *(_WORD *)(a1 + 328) = 0;
    int v26 = (unsigned __int16)(v27 - 1);
    if (v28 != 1)
    {
      uint64_t v29 = 0LL;
      uint64_t v30 = v28 - 1LL;
      do
      {
        *(_WORD *)(v8 + 2 * v29) = 0;
        *(void *)(v8 + 8 * v29 - 250) = *(void *)&v34[8 * v29 + 80];
        ++v29;
      }

      while (v30 != v29);
      int v26 = 1;
    }

uint64_t mdb_cursor_del0(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 32);
  uint64_t v3 = *(unsigned __int16 *)(a1 + 66);
  unsigned int v4 = *(unsigned __int16 *)(a1 + 2 * v3 + 328);
  uint64_t v5 = *(void *)(a1 + 8 * v3 + 72);
  mdb_node_del((void *)a1, **(_DWORD **)(a1 + 40));
  --*(void *)(*(void *)(a1 + 40) + 32LL);
  for (unsigned int i = *(uint64_t **)(*(void *)(*(void *)(a1 + 24) + 104LL) + 8 * v2); i; unsigned int i = (uint64_t *)*i)
  {
    uint64_t v7 = i;
    if ((*(_BYTE *)(a1 + 68) & 4) != 0) {
      uint64_t v7 = (uint64_t *)i[2];
    }
    if (v7 != (uint64_t *)a1)
    {
      int v8 = *((_DWORD *)v7 + 17);
      if ((*((_DWORD *)i + 17) & v8 & 1) != 0
        && *((unsigned __int16 *)v7 + 32) >= *(unsigned __int16 *)(a1 + 64))
      {
        uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
        if (v7[v9 + 9] == v5)
        {
          uint64_t v10 = (uint64_t)v7 + 2 * v9;
          unsigned int v11 = *(unsigned __int16 *)(v10 + 328);
          if (v11 == v4)
          {
            *((_DWORD *)v7 + 17) = v8 | 8;
            if ((*(_WORD *)(*(void *)(a1 + 40) + 4LL) & 4) != 0) {
              *(_DWORD *)(v7[2] + 68) &= 0xFFFFFFFC;
            }
          }

          else
          {
            if (v11 > v4) {
              *(_WORD *)(v10 + 328) = v11 - 1;
            }
            uint64_t v12 = v7[2];
            if (v12)
            {
              if ((*(_BYTE *)(v12 + 68) & 1) != 0)
              {
                uint64_t v13 = *((unsigned __int16 *)v7 + *(unsigned __int16 *)(a1 + 66) + 164);
                if (v13 < (*(unsigned __int16 *)(v5 + 12) - 16) >> 1)
                {
                  uint64_t v14 = v5 + *(unsigned __int16 *)(v5 + 2 * v13 + 16);
                  if ((*(_WORD *)(v14 + 4) & 6) == 4) {
                    *(void *)(v12 + 72) = v14 + *(unsigned __int16 *)(v14 + 6) + 8;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  uint64_t result = mdb_rebalance(a1);
  if (!(_DWORD)result)
  {
    if (!*(_WORD *)(a1 + 64))
    {
      uint64_t result = 0LL;
      unint64_t v16 = (_DWORD *)(a1 + 68);
      goto LABEL_22;
    }

    uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 24) + 104LL) + 8 * v2);
    if (!v18)
    {
LABEL_47:
      uint64_t result = 0LL;
      unint64_t v16 = (_DWORD *)(a1 + 68);
      int v17 = 8;
      goto LABEL_48;
    }

    uint64_t v19 = *(void *)(a1 + 8LL * *(unsigned __int16 *)(a1 + 66) + 72);
    unsigned int v20 = (*(unsigned __int16 *)(v19 + 12) - 16) >> 1;
    while (1)
    {
      uint64_t v21 = v18;
      if ((*(_BYTE *)(a1 + 68) & 4) != 0) {
        uint64_t v21 = *(void *)(v18 + 16);
      }
      int64_t v22 = (_BYTE *)(v21 + 68);
      if ((*(_DWORD *)(v18 + 68) & *(_DWORD *)(v21 + 68) & 1) == 0) {
        goto LABEL_46;
      }
      uint64_t v23 = *(unsigned __int16 *)(a1 + 66);
      if (*(void *)(v21 + 8 * v23 + 72) != v19) {
        goto LABEL_46;
      }
      unsigned int v24 = *(unsigned __int16 *)(v21 + 2 * v23 + 328);
      if (v20 <= v24)
      {
        uint64_t result = mdb_cursor_sibling(v21, 1LL);
        if ((_DWORD)result == -30798)
        {
          int v28 = 2;
          goto LABEL_45;
        }

        if ((_DWORD)result) {
          break;
        }
      }

      uint64_t v25 = *(void *)(v21 + 16);
      if (!v25 || (*v22 & 2) != 0) {
        goto LABEL_46;
      }
      uint64_t v26 = *(void *)(v21 + 8LL * *(unsigned __int16 *)(v21 + 66) + 72)
          + *(unsigned __int16 *)(*(void *)(v21 + 8LL * *(unsigned __int16 *)(v21 + 66) + 72)
      __int16 v27 = *(_WORD *)(v26 + 4);
      if ((v27 & 4) != 0)
      {
        if ((*(_BYTE *)(v25 + 68) & 1) != 0)
        {
          if ((v27 & 2) == 0) {
            *(void *)(v25 + 72) = v26 + *(unsigned __int16 *)(v26 + 6) + 8;
          }
        }

        else
        {
          mdb_xcursor_init1(v21, v26);
          uint64_t result = mdb_cursor_first(*(void *)(v21 + 16), 0LL, 0LL);
          if ((_DWORD)result) {
            break;
          }
        }
      }

      int64_t v22 = (_BYTE *)(*(void *)(v21 + 16) + 68LL);
      int v28 = 8;
LABEL_45:
      *(_DWORD *)v22 |= v28;
LABEL_46:
      uint64_t v18 = *(void *)v18;
      if (!v18) {
        goto LABEL_47;
      }
    }
  }

  unint64_t v16 = (_DWORD *)(*(void *)(a1 + 24) + 124LL);
LABEL_22:
  int v17 = 2;
LABEL_48:
  *v16 |= v17;
  return result;
}

uint64_t mdb_cursor_open(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t result = 22LL;
  if (a1 && a3 && *(_DWORD *)(a1 + 120) > a2 && (*(_BYTE *)(*(void *)(a1 + 112) + a2) & 8) != 0)
  {
    int v7 = *(_DWORD *)(a1 + 124);
    if ((v7 & 0x13) != 0)
    {
      return 4294936514LL;
    }

    else if (v7 & 0x20000 | a2)
    {
      if ((*(_WORD *)(*(void *)(a1 + 88) + 48LL * a2 + 4) & 4) != 0) {
        size_t v8 = 888LL;
      }
      else {
        size_t v8 = 392LL;
      }
      uint64_t v9 = malloc(v8);
      if (v9)
      {
        uint64_t v10 = v9;
        mdb_cursor_init((uint64_t)v9, a1, a2, (uint64_t)(v9 + 98));
        uint64_t v11 = *(void *)(a1 + 104);
        if (v11)
        {
          *(void *)uint64_t v10 = *(void *)(v11 + 8LL * a2);
          *(void *)(v11 + 8LL * a2) = v10;
          v10[17] |= 0x40u;
        }

        uint64_t result = 0LL;
        *a3 = v10;
      }

      else
      {
        return 12LL;
      }
    }
  }

  return result;
}

uint64_t mdb_cursor_renew(uint64_t a1, uint64_t a2)
{
  uint64_t result = 22LL;
  if (a1 && a2)
  {
    uint64_t v4 = *(unsigned int *)(a2 + 32);
    if (v4 >= *(_DWORD *)(a1 + 120)
      || (*(_BYTE *)(*(void *)(a1 + 112) + v4) & 8) == 0
      || (*(_BYTE *)(a2 + 68) & 0x40) != 0
      || *(void *)(a1 + 104))
    {
      return 22LL;
    }

    else if ((*(_BYTE *)(a1 + 124) & 0x13) != 0)
    {
      return 4294936514LL;
    }

    else
    {
      mdb_cursor_init(a2, a1, v4, *(void *)(a2 + 16));
      return 0LL;
    }
  }

  return result;
}

uint64_t mdb_cursor_count(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = 22LL;
  if (a1 && a2)
  {
    uint64_t v3 = *(void *)(a1 + 16);
    if (!v3) {
      return 4294936512LL;
    }
    if ((*(_BYTE *)(*(void *)(a1 + 24) + 124LL) & 0x13) != 0) {
      return 4294936514LL;
    }
    int v4 = *(_DWORD *)(a1 + 68);
    if ((v4 & 1) == 0) {
      return 22LL;
    }
    if (*(_WORD *)(a1 + 64))
    {
      uint64_t v5 = *(unsigned __int16 *)(a1 + 66);
      if ((v4 & 2) == 0)
      {
        uint64_t v6 = *(void *)(a1 + 8 * v5 + 72);
        unsigned int v7 = *(unsigned __int16 *)(a1 + 2 * v5 + 328);
        goto LABEL_14;
      }

      unsigned int v7 = *(unsigned __int16 *)(a1 + 2 * v5 + 328);
      uint64_t v6 = *(void *)(a1 + 8 * v5 + 72);
      if (v7 < (*(unsigned __int16 *)(v6 + 12) - 16) >> 1)
      {
        *(_DWORD *)(a1 + 68) = v4 ^ 2;
LABEL_14:
        if ((*(_WORD *)(v6 + *(unsigned __int16 *)(v6 + 2LL * v7 + 16) + 4) & 4) != 0)
        {
          if ((*(_BYTE *)(v3 + 68) & 1) == 0) {
            return 22LL;
          }
          uint64_t v8 = *(void *)(v3 + 424);
        }

        else
        {
          uint64_t v8 = 1LL;
        }

        uint64_t v2 = 0LL;
        *a2 = v8;
        return v2;
      }
    }

    return 4294936498LL;
  }

  return v2;
}

void mdb_cursor_close(void *a1)
{
  if (a1 && !*((void *)a1 + 1))
  {
    if ((*((_BYTE *)a1 + 68) & 0x40) != 0)
    {
      uint64_t v1 = *(void *)(*((void *)a1 + 3) + 104LL);
      if (v1)
      {
        uint64_t v2 = (void *)(v1 + 8LL * *((unsigned int *)a1 + 8));
        do
        {
          uint64_t v3 = v2;
          uint64_t v2 = (void *)*v2;
          if (v2) {
            BOOL v4 = v2 == a1;
          }
          else {
            BOOL v4 = 1;
          }
        }

        while (!v4);
        if (v2 == a1) {
          *uint64_t v3 = *(void *)a1;
        }
      }
    }

    free(a1);
  }

uint64_t mdb_cursor_dbi(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t mdb_del(uint64_t a1, unsigned int a2, void *a3, __int128 *a4)
{
  uint64_t v4 = 22LL;
  if (!a1 || !a3) {
    return v4;
  }
  if (*(_DWORD *)(a1 + 120) <= a2 || (*(_BYTE *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22LL;
  }
  int v6 = *(_DWORD *)(a1 + 124);
  if ((v6 & 0x20013) != 0)
  {
    if ((v6 & 0x20000) != 0) {
      return 13LL;
    }
    else {
      return 4294936514LL;
    }
  }

  if ((*(_WORD *)(*(void *)(a1 + 88) + 48LL * a2 + 4) & 4) == 0) {
    a4 = 0LL;
  }
  return mdb_del0(a1, a2, a3, a4, 0);
}

uint64_t mdb_del0(uint64_t a1, unsigned int a2, void *a3, __int128 *a4, int a5)
{
  int v14 = 0;
  mdb_cursor_init((uint64_t)v17, a1, a2, (uint64_t)v16);
  if (a4)
  {
    __int128 v15 = *a4;
    uint64_t v10 = &v15;
    int v11 = 2;
  }

  else
  {
    uint64_t v10 = 0LL;
    a5 |= 0x20u;
    int v11 = 15;
  }

  uint64_t result = mdb_cursor_set((uint64_t)v17, a3, v10, v11, &v14);
  if (!(_DWORD)result)
  {
    uint64_t v13 = *(void *)(a1 + 104);
    v17[0] = *(void *)(v13 + 8LL * a2);
    *(void *)(v13 + 8LL * a2) = v17;
    uint64_t result = mdb_cursor_del((uint64_t)v17, a5);
    *(void *)(*(void *)(a1 + 104) + 8LL * a2) = v17[0];
  }

  return result;
}

uint64_t mdb_put(uint64_t a1, unsigned int a2, size_t *a3, uint64_t a4, int a5)
{
  uint64_t result = 22LL;
  if (a1
    && a3
    && a4
    && *(_DWORD *)(a1 + 120) > a2
    && (a5 & 0xFFF8FFCF) == 0
    && (*(_BYTE *)(*(void *)(a1 + 112) + a2) & 0x10) != 0)
  {
    int v10 = *(_DWORD *)(a1 + 124);
    if ((v10 & 0x20013) != 0)
    {
      if ((v10 & 0x20000) != 0) {
        return 13LL;
      }
      else {
        return 4294936514LL;
      }
    }

    else
    {
      uint64_t v11 = a2;
      mdb_cursor_init((uint64_t)v14, a1, a2, (uint64_t)v13);
      uint64_t v12 = *(void *)(a1 + 104);
      v14[0] = *(void *)(v12 + 8 * v11);
      *(void *)(v12 + 8 * v11) = v14;
      uint64_t result = mdb_cursor_put((uint64_t)v14, a3, a4, a5);
      *(void *)(*(void *)(a1 + 104) + 8 * v11) = v14[0];
    }
  }

  return result;
}

uint64_t mdb_dbi_open(uint64_t a1, char *__s, int a3, unsigned int *a4)
{
  if ((a3 & 0xFFFBFF81) != 0) {
    return 22LL;
  }
  if ((*(_BYTE *)(a1 + 124) & 0x13) != 0) {
    return 4294936514LL;
  }
  if (!__s)
  {
    *a4 = 1;
    if ((a3 & 0x7FFF) != 0)
    {
      uint64_t v17 = *(void *)(a1 + 88);
      int v18 = *(unsigned __int16 *)(v17 + 52);
      int v19 = a3 & 0x7FFF | v18;
      if (v19 != v18)
      {
        *(_WORD *)(v17 + 52) = v19;
        *(_DWORD *)(a1 + 124) |= 4u;
      }
    }

    mdb_default_cmp(a1, 1u);
    return 0LL;
  }

  if (!*(void *)(*(void *)(a1 + 80) + 64LL)) {
    mdb_default_cmp(a1, 1u);
  }
  size_t v10 = strlen(__s);
  uint64_t v11 = *(unsigned int *)(a1 + 120);
  unsigned int v12 = 0;
  uint64_t v13 = (const char **)(*(void *)(a1 + 80) + 104LL);
  for (uint64_t i = 2LL; i != v11; ++i)
  {
    uint64_t v15 = (uint64_t)*(v13 - 1);
    if (v15)
    {
      if (v10 == v15 && !strncmp(__s, *v13, v10))
      {
        uint64_t v4 = 0LL;
        *a4 = i;
        return v4;
      }
    }

    else if (!v12)
    {
      unsigned int v12 = i;
    }

    v13 += 6;
  }

  if (v12)
  {
    int v16 = 0;
  }

  else
  {
LABEL_20:
    unsigned int v12 = 0;
    int v16 = 1;
  }

  if ((*(_WORD *)(*(void *)(a1 + 88) + 52LL) & 0xC) == 0)
  {
    int v36 = 0;
    v48[0] = v10;
    v48[1] = (size_t)__s;
    mdb_cursor_init((uint64_t)v40, a1, 1u, 0LL);
    uint64_t v20 = mdb_cursor_set((uint64_t)v40, v48, &v46, 15, &v36);
    if ((_DWORD)v20 == -30798)
    {
      if ((a3 & 0x40000) == 0) {
        return 4294936498LL;
      }
      if ((*(_BYTE *)(a1 + 126) & 2) != 0) {
        return 13LL;
      }
      uint64_t v29 = strdup(__s);
      if (v29)
      {
        int64_t v22 = v29;
        uint64_t v46 = 48LL;
        int v47 = v37;
        memset(v37, 0, sizeof(v37));
        uint64_t v38 = 0LL;
        uint64_t v39 = -1LL;
        WORD2(v37[0]) = a3 & 0x7FFF;
        uint64_t v30 = *(void *)(v41 + 104);
        uint64_t v31 = v42;
        unint64_t v32 = v40;
        if ((v44 & 4) != 0)
        {
          int v35 = 1;
          v34[2] = v40;
          unint64_t v32 = v34;
        }

        *unint64_t v32 = *(void *)(v30 + 8LL * v42);
        *(void *)(v30 + 8 * v31) = v32;
        uint64_t v33 = mdb_cursor_put((uint64_t)v40, v48, (uint64_t)&v46, 2);
        *(void *)(v30 + 8 * v31) = *v32;
        if ((_DWORD)v33)
        {
          uint64_t v4 = v33;
          free(v22);
          return v4;
        }

        char v23 = 29;
        if (!v16)
        {
LABEL_38:
          unsigned int v24 = (size_t *)(*(void *)(a1 + 80) + 48LL * v12);
          *unsigned int v24 = v10;
          v24[1] = (size_t)v22;
          v24[4] = 0LL;
          *(_BYTE *)(*(void *)(a1 + 112) + v12) = v23;
          uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 152LL);
          LODWORD(v24) = *(_DWORD *)(v25 + 4LL * v12) + 1;
          *(_DWORD *)(v25 + 4LL * v12) = (_DWORD)v24;
          *(_DWORD *)(*(void *)(a1 + 96) + 4LL * v12) = (_DWORD)v24;
          uint64_t v26 = (_OWORD *)(*(void *)(a1 + 88) + 48LL * v12);
          __int128 v27 = *v47;
          __int128 v28 = v47[2];
          v26[1] = v47[1];
          v26[2] = v28;
          *uint64_t v26 = v27;
          *a4 = v12;
          mdb_default_cmp(a1, v12);
          if (v16)
          {
            uint64_t v4 = 0LL;
            ++*(_DWORD *)(a1 + 120);
            return v4;
          }

          return 0LL;
        }

LABEL_37:
        unsigned int v12 = *(_DWORD *)(a1 + 120);
        goto LABEL_38;
      }
    }

    else
    {
      uint64_t v4 = v20;
      if ((_DWORD)v20) {
        return v4;
      }
      if ((*(_WORD *)(v45[v43]
                     + *(unsigned __int16 *)(v45[v43] + 2LL * *((unsigned __int16 *)&v45[32] + v43) + 16)
                     + 4LL) & 6) != 2)
        return 4294936512LL;
      uint64_t v21 = strdup(__s);
      if (v21)
      {
        int64_t v22 = v21;
        char v23 = 28;
        if (!v16) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
    }

    return 12LL;
  }

  if ((a3 & 0x40000) != 0) {
    return 4294936512LL;
  }
  else {
    return 4294936498LL;
  }
}

uint64_t mdb_default_cmp(uint64_t result, unsigned int a2)
{
  uint64_t v2 = *(void *)(result + 80);
  uint64_t v3 = mdb_cmp_cint;
  __int16 v4 = *(_WORD *)(*(void *)(result + 88) + 48LL * a2 + 4);
  if ((v4 & 8) != 0) {
    uint64_t v5 = mdb_cmp_cint;
  }
  else {
    uint64_t v5 = mdb_cmp_memn;
  }
  if ((v4 & 2) != 0) {
    uint64_t v5 = mdb_cmp_memnr;
  }
  *(void *)(v2 + 48LL * a2 + 16) = v5;
  if ((v4 & 0x40) != 0) {
    int v6 = mdb_cmp_memnr;
  }
  else {
    int v6 = mdb_cmp_memn;
  }
  if ((v4 & 0x10) != 0) {
    uint64_t v3 = mdb_cmp_int;
  }
  if ((v4 & 0x20) != 0) {
    int v6 = (uint64_t (*)(void *, void *))v3;
  }
  if ((v4 & 4) == 0) {
    int v6 = 0LL;
  }
  *(void *)(v2 + 48LL * a2 + 24) = v6;
  return result;
}

void mdb_dbi_close(uint64_t a1, unsigned int a2)
{
  if (a2 >= 2 && *(_DWORD *)(a1 + 36) > a2)
  {
    uint64_t v2 = *(void *)(a1 + 136);
    uint64_t v3 = *(void **)(v2 + 48LL * a2 + 8);
    if (v3)
    {
      __int16 v4 = (void *)(v2 + 48LL * a2);
      *__int16 v4 = 0LL;
      v4[1] = 0LL;
      uint64_t v5 = *(void *)(a1 + 152);
      *(_WORD *)(*(void *)(a1 + 144) + 2LL * a2) = 0;
      ++*(_DWORD *)(v5 + 4LL * a2);
      free(v3);
    }
  }

uint64_t mdb_dbi_flags(uint64_t a1, unsigned int a2, int *a3)
{
  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(_BYTE *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *a3 = *(_WORD *)(*(void *)(a1 + 88) + 48LL * a2 + 4) & 0x7FFF;
  return result;
}

uint64_t mdb_drop(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v3 = 22LL;
  if (a1 && a3 <= 1 && *(_DWORD *)(a1 + 120) > a2 && (*(_BYTE *)(*(void *)(a1 + 112) + a2) & 0x10) != 0)
  {
    if ((*(_BYTE *)(a1 + 126) & 2) != 0)
    {
      return 13LL;
    }

    else if (*(_DWORD *)(*(void *)(a1 + 96) + 4LL * a2) == *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 152LL) {
                                                                        + 4LL * a2))
    }
    {
      uint64_t v3 = mdb_cursor_open(a1, a2, &v12);
      if (!(_DWORD)v3)
      {
        uint64_t v7 = mdb_drop0((uint64_t)v12, *(_WORD *)(v12[5] + 4LL) & 4);
        uint64_t v3 = v7;
        if ((_DWORD)v7) {
          goto LABEL_20;
        }
        if (a2 >= 2 && a3)
        {
          uint64_t v3 = mdb_del0(a1, 1u, (void *)v12[6], 0LL, 2);
          if (!(_DWORD)v3)
          {
            *(_BYTE *)(*(void *)(a1 + 112) + a2) = 2;
            mdb_dbi_close(*(void *)(a1 + 32), a2);
            goto LABEL_20;
          }

          int v9 = *(_DWORD *)(a1 + 124) | 2;
        }

        else
        {
          uint64_t v3 = 0LL;
          *(_BYTE *)(*(void *)(a1 + 112) + a2) |= 1u;
          uint64_t v10 = *(void *)(a1 + 88) + 48LL * a2;
          *(_WORD *)(v10 + 38) = 0;
          *(_OWORD *)(v10 + 22) = 0u;
          *(_OWORD *)(v10 + 6) = 0u;
          *(void *)(v10 + 40) = -1LL;
          int v9 = *(_DWORD *)(a1 + 124) | 4;
        }

        *(_DWORD *)(a1 + 124) = v9;
LABEL_20:
        mdb_cursor_close(v12);
      }
    }

    else
    {
      return 4294936516LL;
    }
  }

  return v3;
}

uint64_t mdb_set_compare(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(_BYTE *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(void *)(*(void *)(a1 + 80) + 48LL * a2 + 16) = a3;
  return result;
}

uint64_t mdb_set_dupsort(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(_BYTE *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(void *)(*(void *)(a1 + 80) + 48LL * a2 + 24) = a3;
  return result;
}

uint64_t mdb_set_relfunc(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(_BYTE *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(void *)(*(void *)(a1 + 80) + 48LL * a2 + 32) = a3;
  return result;
}

uint64_t mdb_set_relctx(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(_BYTE *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(void *)(*(void *)(a1 + 80) + 48LL * a2 + 40) = a3;
  return result;
}

uint64_t mdb_reader_pid(uint64_t a1, int a2, int a3)
{
  uint64_t v5 = a3;
  uint64_t v10 = a3;
  __int128 v11 = xmmword_100017B00;
  WORD6(v11) = 3;
  for (int i = fcntl(*(_DWORD *)(a1 + 4), a2, &v10); i; int i = fcntl(*(_DWORD *)(a1 + 4), a2, &v10))
  {
    uint64_t result = *__error();
    if ((_DWORD)result != 4) {
      return result;
    }
    uint64_t v10 = v5;
    __int128 v11 = xmmword_100017B00;
    WORD6(v11) = 3;
  }

  int v9 = a2 == 7 && WORD6(v11) != 2;
  return (v9 << 31 >> 31);
}

void mdb_dpage_free(uint64_t a1, void *a2)
{
  if ((*((_WORD *)a2 + 5) & 4) != 0 && *((_DWORD *)a2 + 3) != 1)
  {
    free(a2);
  }

  else
  {
    *a2 = *(void *)(a1 + 192);
    *(void *)(a1 + 192) = a2;
  }

uint64_t mdb_page_search(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = *(void *)(a1 + 24);
  if ((*(_BYTE *)(v4 + 124) & 0x13) != 0) {
    return 4294936514LL;
  }
  if ((**(_BYTE **)(a1 + 56) & 2) == 0) {
    goto LABEL_5;
  }
  if (*(_DWORD *)(*(void *)(v4 + 96) + 4LL * *(unsigned int *)(a1 + 32)) != *(_DWORD *)(*(void *)(*(void *)(v4 + 32) + 152LL) {
                                                                                         + 4LL
  }
  mdb_cursor_init(v17, v4, 1LL, 0LL);
  uint64_t result = mdb_page_search(v17, *(void *)(a1 + 48), 0LL);
  if (!(_DWORD)result)
  {
    int v14 = 0;
    uint64_t v10 = mdb_node_search((uint64_t)v17, *(void **)(a1 + 48), &v14);
    if (!v14) {
      return 4294936498LL;
    }
    if ((*((_WORD *)v10 + 2) & 6) != 2) {
      return 4294936512LL;
    }
    uint64_t result = mdb_node_read((uint64_t)v17, (unsigned int *)v10, &v15);
    if ((_DWORD)result) {
      return result;
    }
    uint64_t v11 = *(void *)(a1 + 40);
    if ((*(_WORD *)(v11 + 4) & 0x7FFF) != *((_WORD *)v16 + 2)) {
      return 4294936512LL;
    }
    __int128 v12 = *v16;
    __int128 v13 = v16[2];
    *(_OWORD *)(v11 + 16) = v16[1];
    *(_OWORD *)(v11 + 32) = v13;
    *(_OWORD *)uint64_t v11 = v12;
    **(_BYTE **)(a1 + 56) &= ~2u;
LABEL_5:
    unint64_t v8 = *(void *)(*(void *)(a1 + 40) + 40LL);
    if (v8 != -1LL)
    {
      int v9 = *(void **)(a1 + 72);
      if (v9 && *v9 == v8 || (uint64_t result = mdb_page_get(a1, v8, (unint64_t *)(a1 + 72), 0LL), !(_DWORD)result))
      {
        *(_DWORD *)(a1 + 64) = 1;
        if ((a3 & 1) == 0 || (uint64_t result = mdb_page_touch(a1), !(_DWORD)result))
        {
          if ((a3 & 2) != 0) {
            return 0LL;
          }
          else {
            return mdb_page_search_root(a1, a2, a3);
          }
        }
      }

      return result;
    }

    return 4294936498LL;
  }

  return result;
}

char *mdb_node_search(uint64_t a1, void *a2, int *a3)
{
  uint64_t v5 = *(unsigned __int16 **)(a1 + 8LL * *(unsigned __int16 *)(a1 + 66) + 72);
  unsigned int v6 = v5[6] - 16;
  unsigned int v7 = v6 >> 1;
  unsigned int v8 = v5[5];
  unsigned int v9 = ((v8 >> 1) & 1) == 0;
  int v10 = (v6 >> 1) - 1;
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t))(*(void *)(a1 + 48) + 16LL);
  if (v11 == mdb_cmp_cint)
  {
    if ((v8 & 1) != 0)
    {
      else {
        uint64_t v11 = (uint64_t (*)(void *, uint64_t))mdb_cmp_int;
      }
      if ((v8 & 0x20) == 0) {
        goto LABEL_3;
      }
    }

    else
    {
      uint64_t v11 = mdb_cmp_cint;
      if ((v8 & 0x20) == 0) {
        goto LABEL_3;
      }
    }
  }

  else if ((v8 & 0x20) == 0)
  {
LABEL_3:
    if (v9 < v7)
    {
      int v19 = v5[6] - 16;
      __int128 v12 = a3;
      while (1)
      {
        LODWORD(v13) = (int)(v10 + v9) >> 1;
        int v14 = (char *)v5 + v5[v13 + 8];
        uint64_t v20 = *((unsigned __int16 *)v14 + 3);
        uint64_t v21 = (uint64_t)(v14 + 8);
        int v15 = v11(a2, (uint64_t)&v20);
        if (!v15) {
          break;
        }
        if (v15 <= 0) {
          int v10 = v13 - 1;
        }
        else {
          unsigned int v9 = v13 + 1;
        }
        if ((int)v9 > v10)
        {
          a3 = v12;
          goto LABEL_27;
        }
      }

      int v16 = 1;
      a3 = v12;
LABEL_43:
      unsigned int v6 = v19;
      if (!a3) {
        goto LABEL_36;
      }
LABEL_33:
      if (v6 <= 1) {
        int v16 = 0;
      }
      *a3 = v16;
      goto LABEL_36;
    }

    LODWORD(v13) = 0;
    int v14 = 0LL;
LABEL_32:
    int v16 = 1;
    if (!a3) {
      goto LABEL_36;
    }
    goto LABEL_33;
  }

  uint64_t v20 = **(unsigned int **)(a1 + 40);
  int v14 = (char *)v5 + v5[8];
  if (v9 >= v7)
  {
    LODWORD(v13) = 0;
    goto LABEL_32;
  }

  int v19 = v6;
  int v18 = a3;
  do
  {
    uint64_t v13 = ((int)(v10 + v9) >> 1);
    uint64_t v21 = (uint64_t)v5 + v20 * v13 + 16;
    int v15 = v11(a2, (uint64_t)&v20);
    if (!v15)
    {
      int v16 = 1;
      a3 = v18;
      goto LABEL_43;
    }

    if (v15 <= 0) {
      int v10 = v13 - 1;
    }
    else {
      unsigned int v9 = v13 + 1;
    }
  }

  while ((int)v9 <= v10);
  a3 = v18;
LABEL_27:
  unsigned int v6 = v19;
  if (v15 < 1 || (LODWORD(v13) = v13 + 1, (v5[5] & 0x20) != 0))
  {
    int v16 = 0;
    if (a3) {
      goto LABEL_33;
    }
  }

  else
  {
    int v16 = 0;
    int v14 = (char *)v5 + v5[v13 + 8];
    if (a3) {
      goto LABEL_33;
    }
  }

LABEL_36:
  *(_WORD *)(a1 + 2LL * *(unsigned __int16 *)(a1 + 66) + 328) = v13;
  else {
    return v14;
  }
}

      if (++v8 == v5) {
        goto LABEL_42;
      }
    }
  }

  unsigned int v9 = 0;
LABEL_42:
  uint64_t v26 = 0LL;
LABEL_43:
  free(v7);
  if (a2) {
    *a2 = v9;
  }
  return v26;
}

uint64_t mdb_page_touch(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8LL * *(unsigned __int16 *)(a1 + 66) + 72);
  uint64_t v3 = *(void *)(a1 + 24);
  __int16 v4 = *(_WORD *)(v2 + 10);
  if ((v4 & 0x10) == 0)
  {
    if ((*(_BYTE *)(v3 + 124) & 8) != 0)
    {
      __dst[0] = 0LL;
      uint64_t result = mdb_page_unspill(v3, v2, (char **)__dst);
      if ((_DWORD)result) {
        goto LABEL_15;
      }
      unsigned int v7 = (char *)__dst[0];
      if (__dst[0])
      {
LABEL_20:
        uint64_t v17 = *(unsigned __int16 *)(a1 + 66);
        *(void *)(a1 + 8 * v17 + 72) = v7;
        int v18 = *(uint64_t **)(*(void *)(v3 + 104) + 8LL * *(unsigned int *)(a1 + 32));
        if ((*(_BYTE *)(a1 + 68) & 4) != 0)
        {
          if (v18)
          {
            unsigned int v26 = *(unsigned __int16 *)(a1 + 64);
            do
            {
              uint64_t v27 = v18[2];
              if (*(unsigned __int16 *)(v27 + 64) >= v26)
              {
                uint64_t v28 = v27 + 8 * v17;
                uint64_t v30 = *(void *)(v28 + 72);
                uint64_t v29 = (char **)(v28 + 72);
                if (v30 == v2) {
                  *uint64_t v29 = v7;
                }
              }

              int v18 = (uint64_t *)*v18;
            }

            while (v18);
          }
        }

        else if (v18)
        {
          unsigned int v19 = *(unsigned __int16 *)(a1 + 64);
          do
          {
            if (v18 != (uint64_t *)a1 && *((unsigned __int16 *)v18 + 32) >= v19)
            {
              uint64_t v20 = &v18[v17];
              uint64_t v22 = v20[9];
              uint64_t v21 = (char **)(v20 + 9);
              if (v22 == v2)
              {
                *uint64_t v21 = v7;
                if ((*((_WORD *)v7 + 5) & 2) != 0)
                {
                  uint64_t v23 = v18[2];
                  if (v23)
                  {
                    if ((*(_BYTE *)(v23 + 68) & 1) != 0)
                    {
                      uint64_t v24 = *((unsigned __int16 *)v18 + v17 + 164);
                      if (v24 < (*((unsigned __int16 *)v7 + 6) - 16) >> 1)
                      {
                        uint64_t v25 = &v7[*(unsigned __int16 *)&v7[2 * v24 + 16]];
                        if ((*((_WORD *)v25 + 2) & 6) == 4) {
                          *(void *)(v23 + 72) = &v25[*((unsigned __int16 *)v25 + 3) + 8];
                        }
                      }
                    }
                  }
                }
              }
            }

            int v18 = (uint64_t *)*v18;
          }

          while (v18);
        }

        return 0LL;
      }
    }

    uint64_t v5 = (uint64_t **)(v3 + 40);
    uint64_t result = mdb_midl_need((_DWORD **)(v3 + 40), 1);
    if (!(_DWORD)result)
    {
      uint64_t result = mdb_page_alloc(a1, 1, (char **)__dst);
      if (!(_DWORD)result)
      {
        unsigned int v7 = (char *)__dst[0];
        unsigned int v8 = *(void **)__dst[0];
        unsigned int v9 = *v5;
        uint64_t v10 = **v5 + 1;
        *unsigned int v9 = v10;
        v9[v10] = *(void *)v2;
        if (*(_WORD *)(a1 + 66))
        {
          unsigned int v11 = *(unsigned __int16 *)(a1 + 66) - 1;
          uint64_t v12 = *(void *)(a1 + 8LL * v11 + 72);
          uint64_t v13 = v12 + *(unsigned __int16 *)(v12 + 2LL * *(unsigned __int16 *)(a1 + 2LL * v11 + 328) + 16);
          *(_DWORD *)uint64_t v13 = (_DWORD)v8;
          *(_WORD *)(v13 + 4) = WORD2(v8);
        }

        else
        {
          *(void *)(*(void *)(a1 + 40) + 4gettimeofday(&v13, 0LL) = v8;
        }

        goto LABEL_18;
      }
    }

uint64_t mdb_page_search_root(uint64_t a1, void *a2, char a3)
{
  unint64_t v4 = *(unsigned __int16 *)(a1 + 66);
  unint64_t v5 = *(void *)(a1 + 8 * v4 + 72);
  unint64_t v14 = v5;
  __int16 v6 = *(_WORD *)(v5 + 10);
  if ((v6 & 1) != 0)
  {
    int v9 = a3 & 0xC;
    do
    {
      if (v9)
      {
        if ((a3 & 8) != 0)
        {
          unsigned int v10 = ((*(unsigned __int16 *)(v5 + 12) + 131056) >> 1) - 1;
          if ((*(_BYTE *)(a1 + 68) & 1) != 0
            && *(unsigned __int16 *)(a1 + 2LL * (unsigned __int16)v4 + 328) == (unsigned __int16)v10)
          {
            unint64_t v4 = *(unsigned __int16 *)(a1 + 64);
            *(_WORD *)(a1 + 64) = v4 + 1;
            *(_WORD *)(a1 + 66) = v4;
            unint64_t v5 = *(void *)(a1 + 8 * v4 + 72);
            unint64_t v14 = v5;
            if ((a3 & 1) != 0) {
              goto LABEL_16;
            }
            goto LABEL_18;
          }
        }

        else
        {
          LOWORD(std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100]( v11, v10) = 0;
        }
      }

      else if (mdb_node_search(a1, a2, &v13))
      {
        LOWORD(std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100]( v11, v10) = *(_WORD *)(a1 + 2LL * *(unsigned __int16 *)(a1 + 66) + 328) - (v13 == 0);
      }

      else
      {
        unsigned int v10 = ((*(unsigned __int16 *)(v5 + 12) + 131056) >> 1) - 1;
      }

      unsigned int v11 = (unsigned int *)(v5 + *(unsigned __int16 *)(v5 + 2LL * (unsigned __int16)v10 + 16));
      uint64_t result = mdb_page_get(a1, *v11 | ((unint64_t)*((unsigned __int16 *)v11 + 2) << 32), &v14, 0LL);
      if ((_DWORD)result) {
        return result;
      }
      *(_WORD *)(a1 + 2LL * *(unsigned __int16 *)(a1 + 66) + 328) = v10;
      unint64_t v4 = *(unsigned __int16 *)(a1 + 64);
      if (v4 > 0x1F)
      {
        *(_DWORD *)(*(void *)(a1 + 24) + 124LL) |= 2u;
        return 4294936509LL;
      }

      unint64_t v5 = v14;
      *(_WORD *)(a1 + 64) = v4 + 1;
      *(_WORD *)(a1 + 66) = v4;
      *(void *)(a1 + 8 * v4 + 72) = v5;
      *(_WORD *)(a1 + 2 * v4 + 328) = 0;
      if ((a3 & 1) != 0)
      {
LABEL_16:
        uint64_t result = mdb_page_touch(a1);
        if ((_DWORD)result) {
          return result;
        }
        unint64_t v4 = *(unsigned __int16 *)(a1 + 66);
        unint64_t v5 = *(void *)(a1 + 8 * v4 + 72);
        unint64_t v14 = v5;
      }

void *mdb_page_copy(char *__dst, _WORD *__src, int a3)
{
  unint64_t v4 = __src;
  unint64_t v5 = __dst;
  unsigned __int16 v6 = __src[7];
  int v7 = (unsigned __int16)__src[6];
  if (((v6 - (_WORD)v7) & 0xFFF8) == 0 || (__src[5] & 0x20) != 0)
  {
    size_t v9 = a3 - ((v6 - (_WORD)v7) & 0xFFF8u);
  }

  else
  {
    uint64_t v8 = v6 & 0xFFF8;
    memcpy(__dst, __src, (v7 + 7) & 0x1FFF8);
    __int128 __dst = &v5[v8];
    __src = (_WORD *)((char *)v4 + v8);
    size_t v9 = (a3 - v8);
  }

  return memcpy(__dst, __src, v9);
}

uint64_t mdb_env_reader_dest(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 8);
  uint64_t result = getpid();
  if (v2 == (_DWORD)result) {
    *(_DWORD *)(a1 + 8) = 0;
  }
  return result;
}

uint64_t mdb_pages_xkeep(uint64_t a1, int a2, int a3)
{
  uint64_t v5 = *(void *)(a1 + 24);
  unsigned int v6 = *(_DWORD *)(v5 + 120);
  unsigned int v7 = v6;
  uint64_t v8 = a1;
  do
  {
LABEL_2:
    if ((*(_BYTE *)(v8 + 68) & 1) != 0)
    {
      uint64_t v12 = v8;
      do
      {
        uint64_t v13 = *(unsigned __int16 *)(v12 + 64);
        if (*(_WORD *)(v12 + 64))
        {
          uint64_t v14 = 0LL;
          do
          {
            uint64_t v15 = *(void *)(v12 + 72 + 8 * v14);
            __int16 v16 = *(_WORD *)(v15 + 10);
            if ((v16 & 0xC050) == a2) {
              *(_WORD *)(v15 + 10) = v16 ^ 0x8000;
            }
            ++v14;
          }

          while (v13 != v14);
          unsigned int v17 = v14 - 1;
        }

        else
        {
          uint64_t v15 = 0LL;
          unsigned int v17 = -1;
        }

        uint64_t v18 = *(void *)(v12 + 16);
        if (!v18) {
          break;
        }
        if (!v15) {
          break;
        }
        if ((*(_DWORD *)(v18 + 68) & 1) == 0) {
          break;
        }
        if ((*(_WORD *)(v15 + 10) & 2) == 0) {
          break;
        }
        __int16 v19 = *(_WORD *)(v15 + *(unsigned __int16 *)(v15 + 2LL * *(unsigned __int16 *)(v12 + 2LL * v17 + 328) + 16) + 4);
        uint64_t v12 = *(void *)(v12 + 16);
      }

      while ((v19 & 2) != 0);
    }

    uint64_t v8 = *(void *)v8;
    if (v8) {
      BOOL v9 = v8 == a1;
    }
    else {
      BOOL v9 = 1;
    }
  }

  while (!v9);
  uint64_t v10 = 8LL * v7 - 8;
  while (v10 != -8)
  {
    uint64_t v8 = *(void *)(*(void *)(v5 + 104) + v10);
    v10 -= 8LL;
    --v7;
    if (v8) {
      BOOL v11 = v8 == a1;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11) {
      goto LABEL_2;
    }
  }

  uint64_t result = 0LL;
  if (a3 && v6)
  {
    unint64_t v21 = 0LL;
    uint64_t v22 = 40LL;
    do
    {
      if ((*(_BYTE *)(*(void *)(v5 + 112) + v21) & 1) != 0)
      {
        unint64_t v23 = *(void *)(*(void *)(v5 + 88) + v22);
        if (v23 != -1LL)
        {
          uint64_t result = mdb_page_get(a1, v23, &v27, &v26);
          if ((_DWORD)result) {
            return result;
          }
          __int16 v24 = *(_WORD *)(v27 + 10);
          if ((v24 & 0xC050) == a2 && v26 <= 1) {
            *(_WORD *)(v27 + 10) = v24 ^ 0x8000;
          }
        }
      }

      ++v21;
      v22 += 48LL;
    }

    while (v21 < *(unsigned int *)(v5 + 120));
    return 0LL;
  }

  return result;
}

unint64_t mdb_find_oldest(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unint64_t result = *(void *)(a1 + 24) - 1LL;
  uint64_t v3 = *(void *)(v1 + 64);
  if (v3)
  {
    uint64_t v4 = *(unsigned int *)(v3 + 16);
    if ((int)v4 >= 1)
    {
      uint64_t v5 = v3 + 192;
      unint64_t v6 = v4 + 1;
      do
      {
        uint64_t v7 = v5 + ((unint64_t)(v6 - 2) << 6);
        if (*(_DWORD *)(v7 + 8))
        {
          unint64_t v8 = *(void *)v7;
          if (result >= v8) {
            unint64_t result = v8;
          }
        }

        --v6;
      }

      while (v6 > 1);
    }
  }

  return result;
}

uint64_t mdb_rebalance(uint64_t a1)
{
  int v2 = (unint64_t *)(a1 + 72);
  uint64_t v3 = *(unsigned __int16 *)(a1 + 66);
  uint64_t v4 = *(_WORD **)(a1 + 72 + 8 * v3);
  if ((v4[5] & 1) != 0) {
    unsigned int v5 = 2;
  }
  else {
    unsigned int v5 = 1;
  }
  if ((v4[5] & 1) != 0) {
    unint64_t v6 = 1LL;
  }
  else {
    unint64_t v6 = 250LL;
  }
  uint64_t v7 = *(void *)(a1 + 24);
  unint64_t v8 = (*(_DWORD *)(*(void *)(v7 + 32) + 16LL) - 16);
  __int16 v9 = v4[7];
  int v10 = (unsigned __int16)v4[6];
  if (1000 * (unint64_t)(v8 - (unsigned __int16)(v9 - v10)) / v8 >= v6
    && v5 <= (v10 - 16) >> 1)
  {
    return 0LL;
  }

  if (*(unsigned __int16 *)(a1 + 64) > 1u)
  {
    mdb_cursor_copy(a1, (uint64_t)v116);
    int v20 = *(unsigned __int16 *)(a1 + 328 + 2 * v3);
    int v21 = *(unsigned __int16 *)(a1 + 328 + 2LL * (v3 - 1));
    v116[2] = 0LL;
    uint64_t v22 = (unsigned __int16 *)&v123[32] + (v3 - 1);
    unsigned __int16 v23 = *v22;
    __int16 v24 = (void *)(a1 + 8LL * (v3 - 1) + 72);
    if (v21)
    {
      unsigned __int16 v25 = v23 - 1;
      *uint64_t v22 = v25;
      int v26 = (unsigned int *)(*v24 + *(unsigned __int16 *)(*v24 + 2LL * v25 + 16));
      uint64_t updated = mdb_page_get(a1, *v26 | ((unint64_t)*((unsigned __int16 *)v26 + 2) << 32), &v123[v121], 0LL);
      if ((_DWORD)updated) {
        return updated;
      }
      uint64_t v27 = v121;
      uint64_t v28 = v123[v121];
      unsigned int v29 = ((*(unsigned __int16 *)(v28 + 12) + 131056) >> 1) - 1;
      *((_WORD *)&v123[32] + v121) = ((*(unsigned __int16 *)(v28 + 12) + 131056) >> 1) - 1;
      *(_WORD *)(a1 + 2LL * *(unsigned __int16 *)(a1 + 66) + 328) = 0;
    }

    else
    {
      unsigned __int16 v30 = v23 + 1;
      *uint64_t v22 = v30;
      uint64_t v31 = (unsigned int *)(*v24 + *(unsigned __int16 *)(*v24 + 2LL * v30 + 16));
      uint64_t updated = mdb_page_get(a1, *v31 | ((unint64_t)*((unsigned __int16 *)v31 + 2) << 32), &v123[v121], 0LL);
      if ((_DWORD)updated) {
        return updated;
      }
      LOWORD(v29) = 0;
      uint64_t v27 = v121;
      *((_WORD *)&v123[32] + v121) = 0;
      uint64_t v28 = v123[v27];
    }

    unint64_t v32 = (*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 32LL) + 16LL) - 16);
    __int16 v33 = *(_WORD *)(v28 + 14);
    int v34 = *(unsigned __int16 *)(v28 + 12);
    if (1000 * (unint64_t)(v32 - (unsigned __int16)(v33 - v34)) / v32 < v6
      || v5 >= (v34 - 16) >> 1)
    {
      if (v21)
      {
        v20 += (v34 + 131056) >> 1;
        int v45 = v116;
        *((_WORD *)&v123[32] + v27) = *(_WORD *)(a1 + 2 * v27 + 328) + v29 + 1;
        uint64_t v46 = *(void *)(v117 + 104);
        uint64_t v47 = v118;
        if ((v122 & 4) != 0)
        {
          int v134 = 1;
          uint64_t v128 = v116;
          int v45 = v127;
        }

        *int v45 = *(void *)(v46 + 8LL * v118);
        *(void *)(v46 + 8 * v47) = v45;
        uint64_t updated = mdb_page_merge(a1, (uint64_t)v116);
        *(void *)(v46 + 8 * v47) = *v45;
        mdb_cursor_copy((uint64_t)v116, a1);
      }

      else
      {
        uint64_t updated = mdb_page_merge((uint64_t)v116, a1);
      }

      *(_DWORD *)(a1 + 68) &= ~2u;
      goto LABEL_119;
    }

    uint64_t updated = mdb_page_touch((uint64_t)v116);
    if ((_DWORD)updated) {
      goto LABEL_117;
    }
    uint64_t updated = mdb_page_touch(a1);
    if ((_DWORD)updated) {
      goto LABEL_117;
    }
    uint64_t v35 = v123[v121];
    __int16 v36 = *(_WORD *)(v35 + 10);
    if ((v36 & 0x20) != 0)
    {
      LODWORD(v39) = 0;
      size_t v56 = 0LL;
      unint64_t v57 = v35 + *((unsigned __int16 *)&v123[32] + v121) * (unint64_t)*v119 + 16;
      unint64_t v138 = *v119;
      id v139 = (unsigned int *)v57;
      size_t v136 = 0LL;
      uint64_t v137 = 0LL;
    }

    else
    {
      uint64_t v37 = (unsigned int *)(v35 + *(unsigned __int16 *)(v35 + 2LL * *((unsigned __int16 *)&v123[32] + v121) + 16));
      uint64_t v38 = *v37;
      uint64_t v39 = *((unsigned __int16 *)v37 + 2);
      if ((v36 & 1) == 0 || *((_WORD *)&v123[32] + v121))
      {
        int64_t v58 = *((unsigned __int16 *)v37 + 3);
        unint64_t v138 = v58;
        id v139 = v37 + 2;
      }

      else
      {
        __int16 v40 = v120;
        uint64_t updated = mdb_page_search_lowest((uint64_t)v116);
        if ((_DWORD)updated) {
          goto LABEL_117;
        }
        uint64_t v41 = v123[v121];
        if ((*(_WORD *)(v41 + 10) & 0x20) != 0)
        {
          unint64_t v43 = *v119;
          char v44 = (unsigned int *)(v41 + 16);
        }

        else
        {
          uint64_t v42 = v41 + *(unsigned __int16 *)(v41 + 16);
          unint64_t v43 = *(unsigned __int16 *)(v42 + 6);
          char v44 = (unsigned int *)(v42 + 8);
        }

        unint64_t v138 = v43;
        id v139 = v44;
        __int16 v120 = v40;
        unsigned __int16 v121 = v40 - 1;
        int64_t v58 = *((unsigned __int16 *)v37 + 3);
      }

      size_t v56 = v38 | (v39 << 32);
      size_t v136 = *v37;
      uint64_t v137 = (uint64_t)v37 + v58 + 8;
    }

    uint64_t v128 = 0LL;
    uint64_t v59 = *(unsigned __int16 *)(a1 + 66);
    if ((*(_WORD *)(*(void *)(a1 + 8 * v59 + 72) + 10LL) & 1) != 0 && !*(_WORD *)(a1 + 2 * v59 + 328))
    {
      int v77 = *(unsigned __int16 *)(a1 + 64);
      mdb_cursor_copy(a1, (uint64_t)v127);
      uint64_t v78 = mdb_page_search_lowest((uint64_t)v127);
      if ((_DWORD)v78)
      {
        uint64_t updated = v78;
        goto LABEL_117;
      }

      uint64_t v104 = v135[v133];
      if ((*(_WORD *)(v104 + 10) & 0x20) != 0)
      {
        uint64_t v106 = *v131;
        uint64_t v107 = v104 + 16;
      }

      else
      {
        uint64_t v105 = v104 + *(unsigned __int16 *)(v104 + 16);
        uint64_t v106 = *(unsigned __int16 *)(v105 + 6);
        uint64_t v107 = v105 + 8;
      }

      v124[0] = v106;
      v124[1] = v107;
      __int16 v132 = v77;
      unsigned __int16 v133 = v77 - 1;
      *((_WORD *)&v135[32] + (v77 - 1)) = 0;
      uint64_t updated = mdb_update_key((uint64_t)v127, (uint64_t)v124);
      if ((_DWORD)updated)
      {
LABEL_117:
        if (v21) {
          LOWORD(v20) = v20 + 1;
        }
LABEL_119:
        *(_WORD *)(a1 + 2LL * *(unsigned __int16 *)(a1 + 66) + 328) = v20;
        return updated;
      }

      uint64_t v59 = *(unsigned __int16 *)(a1 + 66);
    }

    uint64_t updated = mdb_node_add(a1, *(unsigned __int16 *)(a1 + 2 * v59 + 328), (const void **)&v138, &v136, v56, v39);
    if (!(_DWORD)updated)
    {
      mdb_node_del(v116, v138);
      uint64_t v60 = v123[v121];
      if (v21)
      {
        int v61 = *(void **)(*(void *)(v117 + 104) + 8LL * v118);
        if (v61)
        {
          uint64_t v62 = *(void *)(a1 + 8LL * v121 + 72);
          char v63 = v122;
          do
          {
            __int16 v64 = v61;
            if ((v63 & 4) != 0) {
              __int16 v64 = (void *)v61[2];
            }
            if ((*((_BYTE *)v64 + 68) & 1) != 0 && *((unsigned __int16 *)v64 + 33) >= v121)
            {
              if (v64 != (void *)a1 && v64[v121 + 9] == v62)
              {
                unsigned int v65 = (char *)v64 + 2 * v121;
                unsigned int v66 = *((unsigned __int16 *)v65 + 164);
              }

              if (v64 != v116)
              {
                uint64_t v67 = &v64[v121];
                uint64_t v69 = v67[9];
                uint64_t v68 = v67 + 9;
                if (v69 == v60)
                {
                  unint64_t v70 = (char *)v64 + 2 * v121;
                  if (*((unsigned __int16 *)v70 + 164) == *((unsigned __int16 *)&v123[32] + v121))
                  {
                    __int16 v71 = v70 + 328;
                    uint64_t v72 = *(unsigned __int16 *)(a1 + 66);
                    *uint64_t v68 = *(void *)(a1 + 8 * v72 + 72);
                    *__int16 v71 = *(_WORD *)(a1 + 2 * v72 + 328);
                    ++*((_WORD *)v64 + v121 + 163);
                  }
                }
              }

              if ((*(_WORD *)(v60 + 10) & 2) != 0)
              {
                uint64_t v73 = v64[2];
                if (v73)
                {
                  if ((*(_BYTE *)(v73 + 68) & 1) != 0)
                  {
                    uint64_t v74 = v64[v121 + 9];
                    uint64_t v75 = *((unsigned __int16 *)v64 + v121 + 164);
                    if (v75 < (*(unsigned __int16 *)(v74 + 12) - 16) >> 1)
                    {
                      uint64_t v76 = v74 + *(unsigned __int16 *)(v74 + 2 * v75 + 16);
                      if ((*(_WORD *)(v76 + 4) & 6) == 4) {
                        *(void *)(v73 + 72) = v76 + *(unsigned __int16 *)(v76 + 6) + 8;
                      }
                    }
                  }
                }
              }
            }

            int v61 = (void *)*v61;
          }

          while (v61);
        }
      }

      else
      {
        uint64_t v79 = *(void **)(*(void *)(v117 + 104) + 8LL * v118);
        if (v79)
        {
          char v80 = v122;
          do
          {
            int v81 = v79;
            if ((v80 & 4) != 0) {
              int v81 = (void *)v79[2];
            }
            if (v81 != v116 && (*((_BYTE *)v81 + 68) & 1) != 0 && *((unsigned __int16 *)v81 + 33) >= v121)
            {
              uint64_t v82 = &v81[v121];
              uint64_t v84 = v82[9];
              int v83 = v82 + 9;
              if (v84 == v60)
              {
                uint64_t v85 = (__int16 *)v81 + v121 + 164;
                __int16 v86 = *v85;
                if (!*v85)
                {
                  uint64_t v87 = *(unsigned __int16 *)(a1 + 66);
                  *int v83 = *(void *)(a1 + 8 * v87 + 72);
                  *uint64_t v85 = *(_WORD *)(a1 + 2 * v87 + 328);
                  uint64_t v85 = (__int16 *)v81 + v121 + 163;
                  __int16 v86 = *v85;
                }

                *uint64_t v85 = v86 - 1;
                if ((*(_WORD *)(v60 + 10) & 2) != 0)
                {
                  uint64_t v88 = v81[2];
                  if (v88)
                  {
                    if ((*(_BYTE *)(v88 + 68) & 1) != 0)
                    {
                      uint64_t v89 = v81[v121 + 9];
                      uint64_t v90 = *((unsigned __int16 *)v81 + v121 + 164);
                      if (v90 < (*(unsigned __int16 *)(v89 + 12) - 16) >> 1)
                      {
                        uint64_t v91 = v89 + *(unsigned __int16 *)(v89 + 2 * v90 + 16);
                        if ((*(_WORD *)(v91 + 4) & 6) == 4) {
                          *(void *)(v88 + 72) = v91 + *(unsigned __int16 *)(v91 + 6) + 8;
                        }
                      }
                    }
                  }
                }
              }
            }

            uint64_t v79 = (void *)*v79;
          }

          while (v79);
        }
      }

      uint64_t v92 = v121;
      unint64_t v93 = (char *)v116 + 2 * v121;
      if (!*((_WORD *)v93 + 164))
      {
        if (*((_WORD *)v93 + 163))
        {
          uint64_t v97 = v123[v121];
          if ((*(_WORD *)(v97 + 10) & 0x20) != 0)
          {
            uint64_t v99 = (unsigned int *)(v97 + 16);
          }

          else
          {
            uint64_t v98 = v97 + *(unsigned __int16 *)(v97 + 16);
            unint64_t v138 = *(unsigned __int16 *)(v98 + 6);
            uint64_t v99 = (unsigned int *)(v98 + 8);
          }

          id v139 = v99;
          signed int v108 = v127;
          mdb_cursor_copy((uint64_t)v116, (uint64_t)v127);
          --v132;
          --v133;
          uint64_t v109 = *(void *)(v129 + 104);
          uint64_t v110 = v130;
          if ((v134 & 4) != 0)
          {
            int v126 = 1;
            uint64_t v125 = v127;
            signed int v108 = v124;
          }

          *signed int v108 = *(void *)(v109 + 8LL * v130);
          *(void *)(v109 + 8 * v110) = v108;
          uint64_t updated = mdb_update_key((uint64_t)v127, (uint64_t)&v138);
          *(void *)(v109 + 8 * v110) = *v108;
          if ((_DWORD)updated) {
            goto LABEL_117;
          }
          uint64_t v92 = v121;
        }

        if ((*(_WORD *)(v123[v92] + 10LL) & 1) != 0)
        {
          __int16 v111 = *((_WORD *)&v123[32] + v92);
          v124[0] = 0LL;
          *((_WORD *)&v123[32] + v92) = 0;
          mdb_update_key((uint64_t)v116, (uint64_t)v124);
          LODWORD(v92) = v121;
          *((_WORD *)&v123[32] + v121) = v111;
        }
      }

      uint64_t v94 = *(unsigned __int16 *)(a1 + 66);
      uint64_t v95 = a1 + 2 * v94;
      if (*(_WORD *)(v95 + 328)) {
        goto LABEL_116;
      }
      if (*(_WORD *)(v95 + 326))
      {
        __int16 v100 = *(_WORD *)(v123[v92] + 10LL);
        uint64_t v101 = *(void *)(a1 + 8 * v94 + 72);
        if ((v100 & 0x20) != 0)
        {
          uint64_t v103 = (unsigned int *)(v101 + 16);
        }

        else
        {
          uint64_t v102 = v101 + *(unsigned __int16 *)(v101 + 16);
          unint64_t v138 = *(unsigned __int16 *)(v102 + 6);
          uint64_t v103 = (unsigned int *)(v102 + 8);
        }

        id v139 = v103;
        int v112 = v127;
        mdb_cursor_copy(a1, (uint64_t)v127);
        --v132;
        --v133;
        uint64_t v113 = *(void *)(v129 + 104);
        uint64_t v114 = v130;
        if ((v134 & 4) != 0)
        {
          int v126 = 1;
          uint64_t v125 = v127;
          int v112 = v124;
        }

        void *v112 = *(void *)(v113 + 8LL * v130);
        *(void *)(v113 + 8 * v114) = v112;
        uint64_t updated = mdb_update_key((uint64_t)v127, (uint64_t)&v138);
        *(void *)(v113 + 8 * v114) = *v112;
        if ((_DWORD)updated) {
          goto LABEL_117;
        }
        uint64_t v94 = *(unsigned __int16 *)(a1 + 66);
      }

      if ((*(_WORD *)(*(void *)(a1 + 8 * v94 + 72) + 10LL) & 1) == 0)
      {
LABEL_116:
        uint64_t updated = 0LL;
      }

      else
      {
        __int16 v115 = *(_WORD *)(a1 + 328 + 2 * v94);
        v124[0] = 0LL;
        *(_WORD *)(a1 + 328 + 2 * v94) = 0;
        mdb_update_key(a1, (uint64_t)v124);
        uint64_t updated = 0LL;
        *(_WORD *)(a1 + 328 + 2LL * *(unsigned __int16 *)(a1 + 66)) = v115;
      }
    }

    goto LABEL_117;
  }

  unint64_t v11 = *v2;
  __int16 v12 = *(_WORD *)(*v2 + 10);
  if ((v12 & 0x40) != 0) {
    return 0LL;
  }
  unsigned int v13 = *(unsigned __int16 *)(v11 + 12) - 16;
  if (v13 <= 1)
  {
    uint64_t v14 = *(void *)(a1 + 40);
    *(void *)(v14 + 40) = -1LL;
    *(_WORD *)(v14 + 6) = 0;
    *(void *)(v14 + 16) = 0LL;
    uint64_t updated = mdb_midl_append((unint64_t **)(v7 + 40), *(void *)v11);
    if ((_DWORD)updated) {
      return updated;
    }
    unsigned int v16 = *(_DWORD *)(a1 + 68) & 0xFFFFFFFE;
    *(_DWORD *)(a1 + 64) = 0;
    *(_DWORD *)(a1 + 68) = v16;
    unsigned int v17 = *(void **)(*(void *)(*(void *)(a1 + 24) + 104LL) + 8LL * *(unsigned int *)(a1 + 32));
    if (v17)
    {
      do
      {
        uint64_t v18 = v17;
        if ((*(_BYTE *)(a1 + 68) & 4) != 0) {
          uint64_t v18 = (void *)v17[2];
        }
        int v19 = *((_DWORD *)v18 + 17);
        if ((v19 & 1) != 0
          && *((unsigned __int16 *)v18 + 32) >= *(unsigned __int16 *)(a1 + 64)
          && v18[9] == v11)
        {
          *((_DWORD *)v18 + 16) = 0;
          *((_DWORD *)v18 + 17) = v19 & 0xFFFFFFFE;
        }

        uint64_t updated = 0LL;
        unsigned int v17 = (void *)*v17;
      }

      while (v17);
      return updated;
    }

    return 0LL;
  }

  uint64_t updated = 0LL;
  if ((v12 & 1) == 0) {
    return updated;
  }
  if ((v13 & 0xFFFFFFFE) != 2) {
    return updated;
  }
  uint64_t updated = mdb_midl_append((unint64_t **)(v7 + 40), *(void *)v11);
  if ((_DWORD)updated) {
    return updated;
  }
  unint64_t v48 = *(unsigned int *)(v11 + *(unsigned __int16 *)(v11 + 16)) | ((unint64_t)*(unsigned __int16 *)(v11 + *(unsigned __int16 *)(v11 + 16) + 4) << 32);
  *(void *)(*(void *)(a1 + 40) + 4gettimeofday(&v13, 0LL) = v48;
  uint64_t updated = mdb_page_get(a1, v48, v2, 0LL);
  if ((_DWORD)updated) {
    return updated;
  }
  uint64_t v49 = *(void *)(a1 + 40);
  --*(_WORD *)(v49 + 6);
  --*(void *)(v49 + 8);
  *(_WORD *)(a1 + 328) = *(_WORD *)(a1 + 330);
  if (*(unsigned __int16 *)(v49 + 6) >= 2u)
  {
    uint64_t v50 = 0LL;
    do
    {
      *(void *)(a1 + 8 * v50 + 80) = *(void *)(a1 + 8 * v50 + 88);
      *(_WORD *)(a1 + 2 * v50 + 330) = *(_WORD *)(a1 + 2 * v50 + 332);
      unint64_t v51 = v50 + 2;
      ++v50;
    }

    while (v51 < *(unsigned __int16 *)(v49 + 6));
  }

  uint64_t v52 = *(void **)(*(void *)(*(void *)(a1 + 24) + 104LL) + 8LL * *(unsigned int *)(a1 + 32));
  if (!v52) {
    return 0LL;
  }
  int v53 = *(_DWORD *)(a1 + 68);
  do
  {
    uint64_t v54 = v52;
    if ((v53 & 4) != 0) {
      uint64_t v54 = (void *)v52[2];
    }
    if (v54 != (void *)a1 && (*((_BYTE *)v54 + 68) & 1) != 0 && v54[9] == v11)
    {
      if (*(_WORD *)(v49 + 6))
      {
        unint64_t v55 = 0LL;
        do
        {
          v54[v55 + 9] = v54[v55 + 10];
          *((_WORD *)v54 + v55 + 164) = *((_WORD *)v54 + v55 + 165);
          uint64_t v49 = *(void *)(a1 + 40);
          ++v55;
        }

        while (v55 < *(unsigned __int16 *)(v49 + 6));
      }

      --*((_WORD *)v54 + 32);
      --*((_WORD *)v54 + 33);
    }

    uint64_t updated = 0LL;
    uint64_t v52 = (void *)*v52;
  }

  while (v52);
  return updated;
}

uint64_t mdb_cursor_copy(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 24) = *(void *)(result + 24);
  *(_DWORD *)(a2 + 32) = *(_DWORD *)(result + 32);
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(result + 40);
  *(_DWORD *)(a2 + 64) = *(_DWORD *)(result + 64);
  *(_DWORD *)(a2 + 68) = *(_DWORD *)(result + 68);
  if (*(_WORD *)(result + 64))
  {
    unint64_t v2 = 0LL;
    uint64_t v3 = result + 328;
    uint64_t v4 = a2 + 328;
    do
    {
      __int16 v5 = *(_WORD *)(v3 + 2 * v2);
      *(void *)(v4 + 8 * v2 - 256) = *(void *)(v3 + 8 * v2 - 256);
      *(_WORD *)(v4 + 2 * v2++) = v5;
    }

    while (v2 < *(unsigned __int16 *)(result + 64));
  }

  return result;
}

uint64_t mdb_page_merge(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8LL * *(unsigned __int16 *)(a1 + 66) + 72);
  uint64_t result = mdb_page_touch(a2);
  if ((_DWORD)result) {
    return result;
  }
  uint64_t v6 = *(void *)(a2 + 8LL * *(unsigned __int16 *)(a2 + 66) + 72);
  unsigned int v7 = *(unsigned __int16 *)(v6 + 12) + 131056;
  if ((*(_WORD *)(v4 + 10) & 0x20) == 0)
  {
    if ((*(_WORD *)(v4 + 12) & 0xFFFE) != 0x10)
    {
      unsigned __int16 v8 = 0;
      unsigned int v9 = v7 >> 1;
      do
      {
        int v10 = (unsigned int *)(v4 + *(unsigned __int16 *)(v4 + 2LL * v8 + 16));
        if (!v8 && (*(_WORD *)(v4 + 10) & 1) != 0)
        {
          mdb_cursor_copy(a1, (uint64_t)v45);
          uint64_t v46 = 0LL;
          uint64_t result = mdb_page_search_lowest((uint64_t)v45);
          if ((_DWORD)result) {
            return result;
          }
          uint64_t v12 = v49[v48];
          if ((*(_WORD *)(v12 + 10) & 0x20) != 0)
          {
            unint64_t v51 = *v47;
            uint64_t v14 = (unsigned int *)(v12 + 16);
          }

          else
          {
            uint64_t v13 = v12 + *(unsigned __int16 *)(v12 + 16);
            unint64_t v51 = *(unsigned __int16 *)(v13 + 6);
            uint64_t v14 = (unsigned int *)(v13 + 8);
          }

          uint64_t v52 = v14;
          unint64_t v11 = *((unsigned __int16 *)v10 + 3);
        }

        else
        {
          unint64_t v11 = *((unsigned __int16 *)v10 + 3);
          unint64_t v51 = v11;
          uint64_t v52 = v10 + 2;
        }

        v50[0] = *v10;
        v50[1] = (size_t)v10 + v11 + 8;
        uint64_t result = mdb_node_add( a2,  (unsigned __int16)v9,  (const void **)&v51,  v50,  v50[0] | ((unint64_t)*((unsigned __int16 *)v10 + 2) << 32),  *((unsigned __int16 *)v10 + 2));
        if ((_DWORD)result) {
          return result;
        }
        ++v8;
        LOWORD(v9) = v9 + 1;
      }

      while ((*(unsigned __int16 *)(v4 + 12) - 16) >> 1 > v8);
    }

uint64_t mdb_page_search_lowest(uint64_t a1)
{
  unint64_t v5 = *(void *)(a1 + 8LL * *(unsigned __int16 *)(a1 + 66) + 72);
  uint64_t result = mdb_page_get( a1,  *(unsigned int *)(v5 + *(unsigned __int16 *)(v5 + 16)) | ((unint64_t)*(unsigned __int16 *)(v5 + *(unsigned __int16 *)(v5 + 16) + 4) << 32),  &v5,  0LL);
  if (!(_DWORD)result)
  {
    *(_WORD *)(a1 + 2LL * *(unsigned __int16 *)(a1 + 66) + 328) = 0;
    uint64_t v3 = *(unsigned __int16 *)(a1 + 64);
    if (v3 < 0x20)
    {
      unint64_t v4 = v5;
      *(_WORD *)(a1 + 64) = v3 + 1;
      *(_WORD *)(a1 + 66) = v3;
      *(void *)(a1 + 8 * v3 + 72) = v4;
      *(_WORD *)(a1 + 2 * v3 + 328) = 0;
      return mdb_page_search_root(a1, 0LL, 4);
    }

    else
    {
      *(_DWORD *)(*(void *)(a1 + 24) + 124LL) |= 2u;
      return 4294936509LL;
    }
  }

  return result;
}

uint64_t mdb_cmp_memnr(void *a1, void *a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = v2 + *a1;
  uint64_t v4 = *a1 - *a2;
  unint64_t v5 = v2 + (v4 & ~(v4 >> 63));
  if (v4 >= 1) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = *a1 - *a2;
  }
  unsigned int v7 = (unsigned __int8 *)(*a2 + a2[1] - 1LL);
  while (v3 > v5)
  {
    int v9 = *(unsigned __int8 *)--v3;
    int v8 = v9;
    int v10 = *v7--;
    uint64_t result = (v8 - v10);
    if (v8 != v10) {
      return result;
    }
  }

  if (v6 < 0) {
    return -1LL;
  }
  else {
    return v6;
  }
}

uint64_t mdb_cmp_memn(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = (const void *)a1[1];
  uint64_t v5 = *a2;
  uint64_t v4 = (const void *)a2[1];
  int v7 = v3 - v5;
  BOOL v6 = v3 <= v5;
  if (v3 < v5) {
    int v7 = -1;
  }
  if (v3 > v5) {
    LODWORD(v3) = v5;
  }
  if (v6) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 1;
  }
  LODWORD(result) = memcmp(v2, v4, v3);
  if ((_DWORD)result) {
    return result;
  }
  else {
    return v8;
  }
}

uint64_t mdb_midl_search(unsigned int *a1, unint64_t a2)
{
  unsigned int v2 = *a1;
  if (!*a1) {
    return 1LL;
  }
  int v3 = 0;
  do
  {
    unsigned int v4 = v2 >> 1;
    uint64_t v5 = v3 + (v2 >> 1) + 1;
    unint64_t v6 = *(void *)&a1[2 * v5];
    if (v6 >= a2)
    {
      if (v6 <= a2) {
        return v5;
      }
      unsigned int v4 = v2 + ~v4;
      v3 += (v2 >> 1) + 1;
    }

    unsigned int v2 = v4;
  }

  while (v4);
  if (v6 <= a2) {
    return v5;
  }
  else {
    return (v5 + 1);
  }
}

void *mdb_midl_alloc(int a1)
{
  unsigned int v2 = malloc(8LL * (a1 + 2));
  if (!v2) {
    return 0LL;
  }
  v2[1] = 0LL;
  int v3 = v2 + 1;
  void *v2 = a1;
  return v3;
}

void mdb_midl_free(uint64_t a1)
{
  if (a1) {
    free((void *)(a1 - 8));
  }
}

void *mdb_midl_shrink(uint64_t *a1)
{
  uint64_t v2 = *a1;
  unint64_t v4 = *(void *)(v2 - 8);
  uint64_t result = (void *)(v2 - 8);
  if (v4 >= 0x20000)
  {
    uint64_t result = realloc(result, 0x100008uLL);
    if (result)
    {
      *result++ = 0x1FFFFLL;
      *a1 = (uint64_t)result;
    }
  }

  return result;
}

uint64_t mdb_midl_need(_DWORD **a1, int a2)
{
  int v3 = *a1;
  unint64_t v4 = (*v3 + a2);
  unint64_t v6 = *((void *)v3 - 1);
  uint64_t v5 = v3 - 2;
  if (v6 >= v4) {
    return 0LL;
  }
  uint64_t v7 = ((_DWORD)v4 + (v4 >> 2) + 258) & 0xFFFFFF00;
  unsigned int v8 = realloc(v5, 8 * v7);
  if (!v8) {
    return 12LL;
  }
  int v9 = v8;
  uint64_t result = 0LL;
  *int v9 = (v7 - 2);
  *a1 = v9 + 1;
  return result;
}

uint64_t mdb_midl_append(unint64_t **a1, unint64_t a2)
{
  int v3 = *a1;
  unint64_t v4 = **a1;
  if (v4 >= *(*a1 - 1))
  {
    int v3 = *a1;
    unint64_t v4 = **a1;
  }

  uint64_t result = 0LL;
  unint64_t v7 = v4 + 1;
  *int v3 = v7;
  v3[v7] = a2;
  return result;
}

uint64_t mdb_midl_grow(void *a1, int a2)
{
  unint64_t v4 = realloc((void *)(*a1 - 8LL), 8 * (*(void *)(*a1 - 8LL) + a2) + 16LL);
  if (!v4) {
    return 12LL;
  }
  uint64_t v5 = v4;
  uint64_t result = 0LL;
  *v5 += a2;
  *a1 = v5 + 1;
  return result;
}

uint64_t mdb_midl_append_list(uint64_t **a1, uint64_t *a2)
{
  int v3 = *a1;
  uint64_t v4 = **a1;
  uint64_t v5 = *a2;
  if (v5 + v4 >= (unint64_t)*(*a1 - 1))
  {
    int v3 = *a1;
    uint64_t v4 = **a1;
    uint64_t v5 = *a2;
  }

  memcpy(&v3[v4 + 1], a2 + 1, 8 * v5);
  uint64_t result = 0LL;
  *v3 += *a2;
  return result;
}

uint64_t mdb_midl_append_range(uint64_t **a1, uint64_t a2, unsigned int a3)
{
  uint64_t v5 = *a1;
  uint64_t v6 = **a1;
  unint64_t v7 = v6 + a3;
  if (v7 > *(*a1 - 1))
  {
    uint64_t v5 = *a1;
  }

  *uint64_t v5 = v7;
  if (a3)
  {
    uint64_t v10 = a3;
    unint64_t v11 = &v5[v6];
    do
      v11[v10--] = a2++;
    while ((_DWORD)v10);
  }

  return 0LL;
}

uint64_t *mdb_midl_xmerge(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = *result;
  uint64_t v4 = *result + *a2;
  void *result = -1LL;
  if (v2)
  {
    unint64_t v5 = result[v3];
    uint64_t v6 = v4;
    do
    {
      unint64_t v7 = a2[v2];
      if (v5 >= v7)
      {
        uint64_t v9 = v3;
        uint64_t v8 = v6;
      }

      else
      {
        do
        {
          uint64_t v8 = v6 - 1;
          result[v6] = v5;
          uint64_t v9 = v3 - 1;
          unint64_t v5 = result[v3 - 1];
          --v6;
          --v3;
        }

        while (v5 < v7);
      }

      uint64_t v6 = v8 - 1;
      result[v8] = v7;
      uint64_t v3 = v9;
      --v2;
    }

    while (v2);
  }

  void *result = v4;
  return result;
}

int *mdb_midl_sort(int *result)
{
  LODWORD(v1) = 0;
  int v2 = *result;
  LODWORD(v3) = 1;
LABEL_2:
  while (2)
  {
    uint64_t v4 = (int)v3 + 1LL;
    while (v2 - (int)v3 > 7)
    {
      int v5 = (v2 + (int)v3) >> 1;
      unint64_t v6 = *(void *)&result[2 * v5];
      *(void *)&result[2 * v5] = *(void *)&result[2 * v4];
      *(void *)&result[2 * v4] = v6;
      unint64_t v7 = *(void *)&result[2 * (int)v3];
      unint64_t v8 = *(void *)&result[2 * v2];
      if (v7 < v8)
      {
        *(void *)&result[2 * (int)v3] = v8;
        *(void *)&result[2 * v2] = v7;
        unint64_t v6 = *(void *)&result[2 * v4];
        unint64_t v8 = v7;
      }

      if (v6 < v8)
      {
        *(void *)&result[2 * v4] = v8;
        *(void *)&result[2 * v2] = v6;
        unint64_t v6 = *(void *)&result[2 * v4];
      }

      unint64_t v9 = *(void *)&result[2 * (int)v3];
      if (v9 < v6)
      {
        *(void *)&result[2 * (int)v3] = v6;
        *(void *)&result[2 * v4] = v9;
        unint64_t v6 = v9;
      }

      int v10 = v2;
      int v11 = v3 + 1;
      while (1)
      {
        uint64_t v12 = &result[2 * v11 + 2];
        do
        {
          unint64_t v14 = *(void *)v12;
          v12 += 2;
          unint64_t v13 = v14;
          ++v11;
        }

        while (v14 > v6);
        int v15 = &result[2 * v10];
        do
        {
          unint64_t v17 = *((void *)v15 - 1);
          v15 -= 2;
          unint64_t v16 = v17;
          --v10;
        }

        while (v17 < v6);
        if (v10 + 1 <= v11) {
          break;
        }
        *((void *)v12 - 1) = v16;
        *(void *)int v15 = v13;
      }

      *(void *)&result[2 * v4] = v16;
      *(void *)int v15 = v6;
      uint64_t v18 = (int)v1;
      uint64_t v1 = (int)v1 + 2LL;
      if (v2 - v11 + 1 < v10 - (int)v3)
      {
        v23[(int)v1] = v10 - 1;
        v23[v18 + 1] = v3;
        LODWORD(v3) = v11;
        goto LABEL_2;
      }

      v23[v1] = v2;
      v23[v18 + 1] = v11;
      int v2 = v10 - 1;
    }

    if (v2 > (int)v3)
    {
      uint64_t v3 = (int)v3;
      do
      {
        uint64_t v19 = v3++;
        unint64_t v20 = *(void *)&result[2 * v3];
        if (v19 >= 1)
        {
          while (1)
          {
            unint64_t v21 = *(void *)&result[2 * v19];
            if (v21 >= v20) {
              break;
            }
            *(void *)&result[2 * (v19 + 1)] = v21;
            BOOL v22 = __OFSUB__((_DWORD)v19, 1);
            LODWORD(v19) = v19 - 1;
            if (((int)v19 < 0) ^ v22 | ((_DWORD)v19 == 0))
            {
              LODWORD(v19) = 0;
              break;
            }
          }
        }

        *(void *)&result[2 * (int)v19 + 2] = v20;
      }

      while (v3 != v2);
    }

    if ((_DWORD)v1)
    {
      LODWORD(v3) = v23[(int)v1 - 1];
      int v2 = v23[(int)v1];
      LODWORD(v1) = v1 - 2;
      continue;
    }

    return result;
  }

uint64_t mdb_mid2l_search(unsigned int *a1, unint64_t a2)
{
  unsigned int v2 = *a1;
  if (!*a1) {
    return 1LL;
  }
  int v3 = 0;
  do
  {
    unsigned int v4 = v2 >> 1;
    uint64_t v5 = v3 + (v2 >> 1) + 1;
    unint64_t v6 = *(void *)&a1[4 * v5];
    if (v6 <= a2)
    {
      if (v6 >= a2) {
        return v5;
      }
      unsigned int v4 = v2 + ~v4;
      v3 += (v2 >> 1) + 1;
    }

    unsigned int v2 = v4;
  }

  while (v4);
  if (v6 >= a2) {
    return v5;
  }
  else {
    return (v5 + 1);
  }
}

__n128 mdb_mid2l_insert(unsigned int *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  unsigned int v5 = mdb_mid2l_search(a1, *a2);
  if (v5)
  {
    unint64_t v7 = *(void *)a1;
    if ((*(void *)a1 < (unint64_t)v5 || *(void *)&a1[4 * v5] != v4) && v7 <= 0x1FFFE)
    {
      unsigned int v8 = v7 + 1;
      *(void *)a1 = v7 + 1;
      if (v5 < (int)v7 + 1)
      {
        unint64_t v9 = &a1[4 * v7 + 4];
        int v10 = &a1[4 * v7];
        do
        {
          __int128 v11 = *(_OWORD *)v10;
          v10 -= 4;
          *(_OWORD *)unint64_t v9 = v11;
          v9 -= 4;
          --v8;
        }

        while (v5 < v8);
      }

      __n128 result = *(__n128 *)a2;
      *(_OWORD *)&a1[4 * v5] = *(_OWORD *)a2;
    }
  }

  return result;
}

__n128 mdb_mid2l_append(uint64_t *a1, __n128 *a2)
{
  if ((unint64_t)*a1 <= 0x1FFFE)
  {
    uint64_t v2 = *a1 + 1;
    *a1 = v2;
    __n128 result = *a2;
    *(__n128 *)&a1[2 * v2] = *a2;
  }

  return result;
}

void MTLArchiveUsageDB::store(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, (os_log_s *)&_os_log_default, a3, "mdb_put error: %s", (uint8_t *)a2);
}

void MTLArchiveUsageDB::prune(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "mdb_cursor_open error: %s",  (uint8_t *)a2);
}

void ___ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv_block_invoke_cold_1( uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  OUTLINED_FUNCTION_5();
}

void MTLAssetUpgraderD::getArchiveType()
{
  int v2 = 136315138;
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_0( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v1,  "addRecompilationWork: failed to get archive type of '%s'",  (uint8_t *)&v2);
  OUTLINED_FUNCTION_4();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_13( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v0,  "addRecompilationWork: %s - %s",  v1,  v2,  v3,  v4,  v5);
  OUTLINED_FUNCTION_4();
}

void MTLAssetUpgraderD::getDynamicLibraryType()
{
}

void MTLAssetUpgraderD::addRecompilationWork(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_6( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "addRecompilationWork: queued recompilation",  a1);
}

void MTLAssetUpgraderD::getCacheDirectory()
{
  OUTLINED_FUNCTION_5();
}

void MTLWorkQueue<RecompilationWork>::push( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_2( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "skipping adding duplicate item to work queue",  a5,  a6,  a7,  a8,  0);
  OUTLINED_FUNCTION_3();
}

void MTLWorkQueue<RecompilationWork>::push(uint64_t a1, uint64_t a2)
{
}

{
  uint64_t v2;
  uint8_t *v3;
  OUTLINED_FUNCTION_1(a1, a2, 4.8149e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, (os_log_s *)&_os_log_default, v2, "mdb_put error: %s", v3);
}

{
  uint64_t v2;
  uint8_t *v3;
  OUTLINED_FUNCTION_1(a1, a2, 4.8149e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, (os_log_s *)&_os_log_default, v2, "mdb_cursor_open error: %s", v3);
}

void MTLAssetUpgraderD::processAppEvent(uint8_t *a1, uint64_t a2, void *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_9( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  (uint64_t)a3,  "processAppEvent: metallib: %@",  a1);
}

void MTLAssetUpgraderD::processAppEvent()
{
}

void ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_1()
{
}

void ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_2( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_3( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_4()
{
}

void ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_5()
{
}

void ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke_cold_1( uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  OUTLINED_FUNCTION_6( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "xpc activity os-update: entered",  v3);
  OUTLINED_FUNCTION_3();
}

void ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke_72_cold_1( uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, (os_log_s *)&_os_log_default, a3, "xpc activity prune: entered", v3);
  OUTLINED_FUNCTION_3();
}

void MTLWorkQueue<RecompilationWork>::pop(uint64_t a1, uint64_t a2)
{
}

void MTLAssetUpgraderD::remapTemporary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void MTLAssetUpgraderD::recompileSingleStep()
{
  int v2 = *(_DWORD *)(v1 + 12);
  int v3 = *(_DWORD *)(v1 + 16);
  *(_DWORD *)uint64_t v4 = 136315650;
  *(void *)(v4 + 4) = v5;
  *(_WORD *)(v4 + 12) = 1024;
  *(_DWORD *)(v4 + 14) = v2;
  *(_WORD *)(v4 + 18) = 1024;
  *(_DWORD *)(v4 + 20) = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "recompilation: detected crash for work item (%s, %08X %08X) - skipping",  v6,  0x18u);
  OUTLINED_FUNCTION_5();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v3,  "recompilation: creation of target archive failed': %@",  v4);

  OUTLINED_FUNCTION_5();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v3,  "recompilation: serialization of dynamic library %@ failed",  v4);

  OUTLINED_FUNCTION_5();
}

{
  uint64_t v0;
  uint64_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  OUTLINED_FUNCTION_11();
  int v3 = 2112;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_14( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v1,  "recompilation: temp directory unavailable '%@': %@",  v2);
  OUTLINED_FUNCTION_4();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v3,  "recompilation: not on filesystem - archive %@ ",  v4);

  OUTLINED_FUNCTION_5();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  OUTLINED_FUNCTION_8();
  *(_DWORD *)uint64_t v1 = 136315138;
  *(void *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_0( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v3,  "recompilation: invalid app for recompilation bundleID=%s",  v4);
  OUTLINED_FUNCTION_5();
}

void MTLAssetUpgraderD::recompileSingleStep(uint64_t a1)
{
  int v1 = *(_DWORD *)(*(void *)a1 + 8LL);
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "recompilation: unknown recompilation work type %d",  (uint8_t *)v2,  8u);
  OUTLINED_FUNCTION_3();
}

void MTLAssetUpgraderD::recompileSingleStep(void *a1, void *a2, uint64_t a3)
{
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_14( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "recompilation: open/rebuild of dynamic library %@ failed: %@",  (uint8_t *)a3);

  OUTLINED_FUNCTION_5();
}

void MTLWorkQueue<RecompilationWork>::setState(uint64_t a1, uint64_t a2)
{
}

void ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke_cold_2( uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)int v3 = 0;
  OUTLINED_FUNCTION_6( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "com.apple.MTLAssetUpgraderD.recompilationActivity: defer",  v3);
  OUTLINED_FUNCTION_3();
}

void ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke_cold_3(int a1, uint8_t *buf)
{
  *(_DWORD *)std::string buf = 67109120;
  *((_DWORD *)buf + 1) = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "com.apple.MTLAssetUpgraderD.recompilationActivity: entered state %d",  buf,  8u);
}

void MTLArchiveMapDB::store(char *a1, void *a2, uint64_t *a3)
{
  if (*a1 >= 0) {
    int v3 = a2;
  }
  else {
    int v3 = (void *)*a2;
  }
  else {
    uint64_t v4 = (uint64_t *)*a3;
  }
  int v5 = 136315394;
  uint64_t v6 = v3;
  __int16 v7 = 2080;
  unsigned int v8 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "storeArchive('%s', '%s') invalid payload",  (uint8_t *)&v5,  0x16u);
}

void MTLVersionedDB::openDB(int a1, int a2)
{
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "db version mismatch: file %u, current %u",  (uint8_t *)v2,  0xEu);
  OUTLINED_FUNCTION_4();
}

void MTLVersionedDB::openDB(char *a1, void *a2, int a3)
{
  if (*a1 >= 0) {
    __int16 v3 = a2;
  }
  else {
    __int16 v3 = (void *)*a2;
  }
  int v4 = 136315394;
  int v5 = v3;
  __int16 v6 = 2080;
  __int16 v7 = mdb_strerror(a3);
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "mdb_env_open(%s) error: %s",  (uint8_t *)&v4,  0x16u);
}

void MTLVersionedDB::openDB(int a1)
{
  int v2 = 136315138;
  __int16 v3 = OUTLINED_FUNCTION_2_0(a1, __stack_chk_guard);
  OUTLINED_FUNCTION_0( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v1,  "mdb_env_create error: %s",  (uint8_t *)&v2);
  OUTLINED_FUNCTION_4();
}

void MTLVersionedDB::MTLVersionedDB(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  else {
    __int16 v3 = (uint64_t *)*a1;
  }
  int v4 = 136315138;
  int v5 = v3;
  OUTLINED_FUNCTION_0( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "Failed to drop database %s",  (uint8_t *)&v4);
  OUTLINED_FUNCTION_4();
}

void MTLVersionedDB::MTLVersionedDB()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Database invalid - resetting",  v0,  2u);
}

void MTLVersionedDB::Transaction::Transaction(int a1)
{
  int v2 = 136315138;
  __int16 v3 = OUTLINED_FUNCTION_2_0(a1, __stack_chk_guard);
  OUTLINED_FUNCTION_0( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v1,  "mdb_dbi_open error: %s",  (uint8_t *)&v2);
  OUTLINED_FUNCTION_4();
}

{
  uint64_t v1;
  int v2;
  char *v3;
  int v2 = 136315138;
  __int16 v3 = OUTLINED_FUNCTION_2_0(a1, __stack_chk_guard);
  OUTLINED_FUNCTION_0( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  v1,  "mdb_txn_begin error: %s",  (uint8_t *)&v2);
  OUTLINED_FUNCTION_4();
}

void MTLVersionedDB::Transaction::~Transaction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 136315138;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0( (void *)&_mh_execute_header,  (os_log_s *)&_os_log_default,  a3,  "mdb_txn_commit error: %s",  (uint8_t *)a2);
}

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

const char *mdb_version(_DWORD *a1, _DWORD *a2, _DWORD *a3)
{
  if (a1) {
    *a1 = 0;
  }
  if (a2) {
    *a2 = 9;
  }
  if (a3) {
    *a3 = 70;
  }
  return "LMDB 0.9.70: (December 19, 2015)";
}

uint64_t mdb_env_share_locks(uint64_t a1, int *a2)
{
  *(void *)(*(void *)(a1 + 64) + 8LL) = *(void *)(*(void *)(a1
                                                                  + 72
                                                                  + 8LL
  uint64_t v7 = 0x100000000LL;
  __int128 v6 = xmmword_100017AE0;
  do
  {
    uint64_t result = fcntl(*(_DWORD *)(a1 + 4), 8, &v6);
    if (!(_DWORD)result) {
      break;
    }
    uint64_t result = *__error();
  }

  while ((_DWORD)result == 4);
  if ((_DWORD)result) {
    int v5 = -1;
  }
  else {
    int v5 = 0;
  }
  *a2 = v5;
  return result;
}

uint64_t mdb_env_create(void *a1)
{
  int v2 = calloc(1uLL, 0xF8uLL);
  if (!v2) {
    return 12LL;
  }
  __int16 v3 = v2;
  v2[6] = 126;
  *((void *)v2 + 4) = 0x200000002LL;
  *(void *)int v2 = -1LL;
  _DWORD v2[2] = -1;
  v2[10] = getpid();
  int v4 = sysconf(29);
  uint64_t result = 0LL;
  v3[5] = v4;
  *a1 = v3;
  return result;
}

uint64_t mdb_env_set_mapsize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  int v4 = *(void **)(a1 + 56);
  if (!v4) {
    goto LABEL_12;
  }
  if (*(void *)(a1 + 96)) {
    return 22LL;
  }
  uint64_t v6 = *(void *)(a1
                 + 72
                 + 8LL
                 * ((*(_DWORD *)(a1 + 12) >> 25) & 1 ^ (*(void *)(*(void *)(a1 + 72) + 128LL) < *(void *)(*(void *)(a1 + 80) + 128LL))));
  if (!a2) {
    unint64_t v2 = *(void *)(v6 + 16);
  }
  unint64_t v7 = *(unsigned int *)(a1 + 16) + *(unsigned int *)(a1 + 16) * *(void *)(v6 + 120);
  if (v2 <= v7) {
    unint64_t v2 = v7;
  }
  munmap(v4, *(void *)(a1 + 112));
  *(void *)(a1 + 112) = v2;
  unsigned int v8 = (*(_BYTE *)(a1 + 12) & 1) != 0 ? *(char **)(a1 + 56) : 0LL;
  uint64_t result = mdb_env_map(a1, v8);
  if (!(_DWORD)result)
  {
LABEL_12:
    *(void *)(a1 + 112) = v2;
    unint64_t v9 = *(unsigned int *)(a1 + 16);
    uint64_t result = 0LL;
    if ((_DWORD)v9) {
      *(void *)(a1 + 128) = v2 / v9;
    }
  }

  return result;
}

uint64_t mdb_env_map(uint64_t a1, char *a2)
{
  int v4 = *(_DWORD *)(a1 + 12);
  if ((v4 & 0x80000) != 0)
  {
    if (ftruncate(*(_DWORD *)a1, *(void *)(a1 + 112)) < 0) {
      return *__error();
    }
    int v5 = 3;
  }

  else
  {
    int v5 = 1;
  }

  uint64_t v6 = (char *)mmap(a2, *(void *)(a1 + 112), v5, 1, *(_DWORD *)a1, 0LL);
  *(void *)(a1 + 56) = v6;
  if (v6 == (char *)-1LL)
  {
    *(void *)(a1 + 56) = 0LL;
    return *__error();
  }

  if ((v4 & 0x800000) != 0)
  {
    madvise(v6, *(void *)(a1 + 112), 1);
    uint64_t v6 = *(char **)(a1 + 56);
  }

  if (a2 && v6 != a2) {
    return 16LL;
  }
  uint64_t v7 = 0LL;
  uint64_t v8 = (uint64_t)&v6[*(unsigned int *)(a1 + 16) + 16];
  *(void *)(a1 + 72) = v6 + 16;
  *(void *)(a1 + 80) = v8;
  return v7;
}

uint64_t mdb_env_set_maxdbs(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 56)) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)(a1 + 36) = a2 + 2;
  return result;
}

uint64_t mdb_env_set_maxreaders(uint64_t a1, int a2)
{
  uint64_t result = 22LL;
  if (a2)
  {
    if (!*(void *)(a1 + 56))
    {
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 24) = a2;
    }
  }

  return result;
}

uint64_t mdb_env_get_maxreaders(uint64_t a1, _DWORD *a2)
{
  uint64_t result = 22LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *a2 = *(_DWORD *)(a1 + 24);
    }
  }

  return result;
}

uint64_t mdb_env_open(uint64_t a1, const char *a2, int a3, unsigned int a4)
{
  int v26 = -1;
  uint64_t v4 = 22LL;
  if ((a3 & 0xFC00BFFE) != 0) {
    return v4;
  }
  if (*(_DWORD *)a1 != -1) {
    return v4;
  }
  int v8 = *(_DWORD *)(a1 + 12) | a3;
  uint64_t v4 = mdb_fname_init(a2, v8, (uint64_t)v24);
  if ((_DWORD)v4) {
    return v4;
  }
  unsigned int v9 = v8 | 0x20000000;
  if ((v8 & 0x20000) != 0)
  {
    unsigned int v9 = v8 & 0xDFF7FFFF | 0x20000000;
  }

  else
  {
    int v10 = mdb_midl_alloc(0x1FFFF);
    *(void *)(a1 + 200) = v10;
    if (!v10 || (__int128 v11 = calloc(0x20000uLL, 0x10uLL), (*(void *)(a1 + 208) = v11) == 0LL))
    {
      *(_DWORD *)(a1 + 12) = v9;
LABEL_35:
      uint64_t v4 = 12LL;
      goto LABEL_36;
    }
  }

  *(_DWORD *)(a1 + 12) = v9;
  *(void *)(a1 + 48) = strdup(a2);
  *(void *)(a1 + 136) = calloc(*(unsigned int *)(a1 + 36), 0x30uLL);
  *(void *)(a1 + 144) = calloc(*(unsigned int *)(a1 + 36), 2uLL);
  uint64_t v12 = calloc(*(unsigned int *)(a1 + 36), 4uLL);
  *(void *)(a1 + 152) = v12;
  uint64_t v13 = *(void *)(a1 + 136);
  if (!v13 || !*(void *)(a1 + 48)) {
    goto LABEL_35;
  }
  uint64_t v4 = 12LL;
  if (!*(void *)(a1 + 144) || !v12) {
    goto LABEL_36;
  }
  *(void *)(v13 + 16) = mdb_cmp_long;
  if ((v9 & 0x420000) == 0)
  {
    uint64_t v4 = mdb_env_setup_locks(a1, v24, a4, &v26);
    if ((_DWORD)v4) {
      goto LABEL_36;
    }
    if ((v9 & 0x2000000) != 0 && !v26)
    {
      uint64_t v4 = 35LL;
      goto LABEL_36;
    }
  }

  int v14 = v9 & 0x20000;
  if ((v9 & 0x20000) != 0) {
    int v15 = 0;
  }
  else {
    int v15 = 514;
  }
  uint64_t v4 = mdb_fopen((unsigned int *)a1, v24, v15, a4, (int *)a1);
  if ((_DWORD)v4) {
    goto LABEL_36;
  }
  if ((v9 & 0x420000) == 0x20000)
  {
    uint64_t v4 = mdb_env_setup_locks(a1, v24, a4, &v26);
    if ((_DWORD)v4) {
      goto LABEL_36;
    }
  }

  uint64_t v4 = mdb_env_open2(a1, v9 & 0x2000000);
  if ((_DWORD)v4) {
    goto LABEL_36;
  }
  uint64_t v4 = mdb_fopen((unsigned int *)a1, v24, 20971521, a4, (int *)(a1 + 8));
  if ((_DWORD)v4) {
    goto LABEL_36;
  }
  if ((v9 & 0x2000000) != 0 || v26 < 1)
  {
    if (v14)
    {
      uint64_t v4 = 0LL;
      goto LABEL_37;
    }

uint64_t mdb_fname_init(const char *a1, int a2, uint64_t a3)
{
  int v5 = ~a2 & 0x404000;
  *(_DWORD *)(a3 + 4) = 0;
  int v6 = strlen(a1);
  *(_DWORD *)a3 = v6;
  if (v5)
  {
    int v8 = (char *)malloc(v6 + 10);
    *(void *)(a3 + 8) = v8;
    if (v8)
    {
      *(_DWORD *)(a3 + 4) = 1;
      strcpy(v8, a1);
      return 0LL;
    }

    else
    {
      return 12LL;
    }
  }

  else
  {
    uint64_t result = 0LL;
    *(void *)(a3 + 8) = a1;
  }

  return result;
}

uint64_t mdb_env_setup_locks(uint64_t a1, int *a2, unsigned __int16 a3, int *a4)
{
  int v6 = (int *)(a1 + 4);
  uint64_t v7 = mdb_fopen((unsigned int *)a1, a2, 16777734, a3, (int *)(a1 + 4));
  if (!(_DWORD)v7)
  {
    if ((*(_BYTE *)(a1 + 14) & 0x20) == 0)
    {
      uint64_t v8 = pthread_key_create((pthread_key_t *)(a1 + 160), (void (__cdecl *)(void *))mdb_env_reader_dest);
      if ((_DWORD)v8) {
        return v8;
      }
      *(_DWORD *)(a1 + 12) |= 0x10000000u;
    }

    uint64_t v16 = 0x300000000LL;
    pthread_mutexattr_t v15 = (pthread_mutexattr_t)xmmword_100017AE0;
    do
    {
      if (!fcntl(*v6, 8, &v15)) {
        goto LABEL_12;
      }
      int v9 = *__error();
    }

    while (v9 == 4);
    if (v9)
    {
      WORD2(v16) = 1;
      do
      {
        if (!fcntl(*v6, 9, &v15))
        {
          LODWORD(v8) = 0;
          goto LABEL_13;
        }

        uint64_t v8 = *__error();
      }

      while ((_DWORD)v8 == 4);
      if (!(_DWORD)v8) {
        goto LABEL_13;
      }
      return v8;
    }

LABEL_12:
    LODWORD(v8) = 1;
LABEL_13:
    *a4 = v8;
    off_t v10 = lseek(*v6, 0LL, 2);
    if (v10 != -1)
    {
      int64_t v11 = ((unint64_t)(*(_DWORD *)(a1 + 24) - 1) << 6) + 256;
      if (v10 >= v11 || *a4 < 1)
      {
        *(_DWORD *)(a1 + 24) = ((unint64_t)(v10 + 0x3FFFFFFF00LL) >> 6) + 1;
        int64_t v11 = v10;
      }

      else if (ftruncate(*v6, ((unint64_t)(*(_DWORD *)(a1 + 24) - 1) << 6) + 256))
      {
        return *__error();
      }

      uint64_t v12 = (char *)mmap(0LL, v11, 3, 1, *v6, 0LL);
      if (v12 != (char *)-1LL)
      {
        *(void *)(a1 + 64) = v12;
        if (*a4 < 1)
        {
          if (*(_DWORD *)v12 != -1091583778) {
            return 4294936503LL;
          }
          if (*((_DWORD *)v12 + 1) != 774479874) {
            return 4294936502LL;
          }
          uint64_t v8 = *__error();
        }

        else
        {
          *(_OWORD *)(v12 + 72) = 0u;
          *(_OWORD *)(v12 + 56) = 0u;
          *(_OWORD *)(v12 + 40) = 0u;
          *(_OWORD *)(v12 + 24) = 0u;
          uint64_t v13 = *(_OWORD **)(a1 + 64);
          v13[10] = 0u;
          v13[11] = 0u;
          v13[8] = 0u;
          v13[9] = 0u;
          uint64_t v8 = pthread_mutexattr_init(&v15);
          if (!(_DWORD)v8)
          {
            uint64_t v8 = pthread_mutexattr_setpshared(&v15, 1);
            if ((_DWORD)v8
              || (uint64_t v8 = pthread_mutex_init((pthread_mutex_t *)(*(void *)(a1 + 64) + 24LL), &v15), (_DWORD)v8))
            {
              pthread_mutexattr_destroy(&v15);
            }

            else
            {
              uint64_t v8 = pthread_mutex_init((pthread_mutex_t *)(*(void *)(a1 + 64) + 128LL), &v15);
              pthread_mutexattr_destroy(&v15);
              if (!(_DWORD)v8)
              {
                **(_DWORD **)(a1 + 64) = -1091583778;
                *(_DWORD *)(*(void *)(a1 + 64) + 4LL) = 774479874;
                *(void *)(*(void *)(a1 + 64) + 8LL) = 0LL;
                *(_DWORD *)(*(void *)(a1 + 64) + 16LL) = 0;
              }
            }
          }
        }

        return v8;
      }
    }

    return *__error();
  }

  uint64_t v8 = v7;
  if ((_DWORD)v7 == 30)
  {
    if ((*(_BYTE *)(a1 + 14) & 2) == 0) {
      return 30LL;
    }
    return 0LL;
  }

  return v8;
}

uint64_t mdb_fopen(unsigned int *a1, int *a2, int a3, unsigned int a4, int *a5)
{
  if (a2[1]) {
    strcpy( (char *)(*((void *)a2 + 1) + *a2),  (&(&mdb_suffixes)[2 * (a3 == 16777734)])[((unint64_t)a1[3] >> 14) & 1]);
  }
  int v10 = open(*((const char **)a2 + 1), a3 & 0x1400A03, a4);
  int v11 = v10;
  if (v10 == -1)
  {
    uint64_t result = *__error();
  }

  else
  {
    if (a3 == 16779777 && a1[4] >= a1[5]) {
      fcntl(v10, 48, 1LL);
    }
    uint64_t result = 0LL;
  }

  *a5 = v11;
  return result;
}

uint64_t mdb_env_open2(uint64_t a1, int a2)
{
  int v4 = 0;
  int v5 = *(_DWORD *)(a1 + 12);
  char v6 = 1;
  while (1)
  {
    char v7 = v6;
    int v8 = pread(*(_DWORD *)a1, __buf, 0x98uLL, v4);
    if (v8 != 152) {
      break;
    }
    uint64_t result = 4294936503LL;
    if ((__buf[10] & 8) == 0 || (_DWORD)v20 != -1091583778) {
      goto LABEL_20;
    }
    if (DWORD1(v20) != 1)
    {
      uint64_t result = 4294936502LL;
      goto LABEL_20;
    }

    if (!v4) {
      goto LABEL_9;
    }
    if (!a2)
    {
      if (v28 <= *(void *)&v18[8]) {
        goto LABEL_10;
      }
LABEL_9:
      v18[0] = v20;
      v18[4] = v24;
      size_t v18[3] = v23;
      v18[2] = v22;
      v18[1] = v21;
      *(void *)&v18[8] = v28;
      v18[7] = v27;
      v18[6] = v26;
      v18[5] = v25;
      goto LABEL_10;
    }

    if (v28 < *(void *)&v18[8]) {
      goto LABEL_9;
    }
LABEL_10:
    char v6 = 0;
    unsigned int v10 = DWORD2(v18[1]);
    v4 += DWORD2(v18[1]);
    if ((v7 & 1) == 0) {
      goto LABEL_44;
    }
  }

  if (!(v4 | v8))
  {
    uint64_t result = 2LL;
    goto LABEL_20;
  }

  if ((v8 & 0x80000000) == 0)
  {
    uint64_t result = 4294936503LL;
    goto LABEL_20;
  }

  uint64_t result = *__error();
  if ((_DWORD)result)
  {
LABEL_20:
    if ((_DWORD)result != 2) {
      return result;
    }
    char v11 = 0;
    unsigned int v10 = *(_DWORD *)(a1 + 20);
    if (v10 >= 0x8000) {
      unsigned int v10 = 0x8000;
    }
    *(_DWORD *)(a1 + 16) = v10;
    memset((char *)&v18[1] + 8, 0, 112);
    *(_OWORD *)((char *)v18 + 8) = 0u;
    *(void *)&v18[0] = 0x1BEEFC0DELL;
    WORD6(v18[1]) = *(_WORD *)(a1 + 12) | 8;
    *(void *)&v18[4] = -1LL;
    *(void *)&v18[1] = 0x100000LL;
    unint64_t v12 = *(void *)(a1 + 112);
    DWORD2(v18[1]) = v10;
    v18[7] = xmmword_100017AF0;
    if (!v12) {
      goto LABEL_24;
    }
  }

  else
  {
    unsigned int v10 = DWORD2(v18[1]);
LABEL_44:
    *(_DWORD *)(a1 + 16) = v10;
    unint64_t v12 = *(void *)(a1 + 112);
    char v11 = 1;
    if (!v12)
    {
LABEL_24:
      unint64_t v12 = *(void *)&v18[1];
      *(void *)(a1 + 112) = *(void *)&v18[1];
    }
  }

  unint64_t v13 = v10 * *((void *)&v18[7] + 1) + v10;
  if (v12 < v13)
  {
    *(void *)(a1 + 112) = v13;
    unint64_t v12 = v13;
  }

  *(void *)&v18[1] = v12;
  int v14 = v5 & 1;
  if ((v11 & 1) != 0)
  {
LABEL_28:
    char v15 = 1;
LABEL_33:
    if (v14) {
      uint64_t v16 = (char *)*((void *)&v18[0] + 1);
    }
    else {
      uint64_t v16 = 0LL;
    }
    uint64_t result = mdb_env_map(a1, v16);
    if (!(_DWORD)result)
    {
      if ((v15 & 1) != 0) {
        goto LABEL_41;
      }
      if (v14) {
        *((void *)&v18[0] + 1) = *(void *)(a1 + 56);
      }
      uint64_t result = mdb_env_init_meta(a1, (uint64_t)v18);
      if (!(_DWORD)result)
      {
LABEL_41:
        uint64_t result = 0LL;
        unint64_t v17 = *(unsigned int *)(a1 + 16);
        *(_DWORD *)(a1 + 216) = ((v17 - 16) >> 3) - 1;
        *(_DWORD *)(a1 + 220) = (((v17 - 16) >> 1) & 0x7FFFFFFE) - 2;
        *(void *)(a1 + 128) = *(void *)(a1 + 112) / v17;
      }
    }
  }

  else
  {
    if ((v5 & 1) != 0)
    {
      char v15 = 0;
      int v14 = 1;
      goto LABEL_33;
    }

    uint64_t result = mdb_env_init_meta(a1, (uint64_t)v18);
    if (!(_DWORD)result)
    {
      int v14 = 0;
      goto LABEL_28;
    }
  }

  return result;
}

uint64_t mdb_env_close1(uint64_t result)
{
  if ((*(_BYTE *)(result + 15) & 0x20) != 0)
  {
    uint64_t v1 = result;
    unint64_t v2 = *(void **)(result + 136);
    if (v2)
    {
      uint64_t v3 = *(unsigned int *)(v1 + 36);
      if ((int)v3 >= 3)
      {
        unint64_t v4 = v3 + 1;
        do
          free(*(void **)(*(void *)(v1 + 136) + 48LL * (v4-- - 2) + 8));
        while (v4 > 3);
        unint64_t v2 = *(void **)(v1 + 136);
      }

      free(v2);
    }

    free(*(void **)(v1 + 88));
    free(*(void **)(v1 + 152));
    free(*(void **)(v1 + 144));
    free(*(void **)(v1 + 48));
    free(*(void **)(v1 + 208));
    free(*(void **)(v1 + 104));
    mdb_midl_free(*(void *)(v1 + 200));
    if ((*(_BYTE *)(v1 + 15) & 0x10) != 0) {
      pthread_key_delete(*(void *)(v1 + 160));
    }
    int v5 = *(void **)(v1 + 56);
    if (v5) {
      munmap(v5, *(void *)(v1 + 112));
    }
    int v6 = *(_DWORD *)(v1 + 8);
    if (v6 != -1) {
      close(v6);
    }
    if (*(_DWORD *)v1 != -1) {
      close(*(_DWORD *)v1);
    }
    if (*(void *)(v1 + 64))
    {
      pid_t v7 = getpid();
      uint64_t v8 = *(unsigned int *)(v1 + 28);
      if ((int)v8 >= 1)
      {
        unint64_t v9 = v8 + 1;
        do
        {
          unint64_t v10 = *(void *)(v1 + 64) + ((unint64_t)(v9 - 2) << 6);
          int v12 = *(_DWORD *)(v10 + 200);
          char v11 = (_DWORD *)(v10 + 200);
          if (v12 == v7) {
            *char v11 = 0;
          }
          --v9;
        }

        while (v9 > 1);
      }

      munmap(*(void **)(v1 + 64), ((unint64_t)(*(_DWORD *)(v1 + 24) - 1) << 6) + 256);
    }

    uint64_t result = *(unsigned int *)(v1 + 4);
    if ((_DWORD)result != -1) {
      uint64_t result = close(result);
    }
    *(_DWORD *)(v1 + 12) &= 0xCFFFFFFF;
  }

  return result;
}

void mdb_env_close(void *a1)
{
  if (a1)
  {
    while (1)
    {
      unint64_t v2 = (void *)a1[24];
      if (!v2) {
        break;
      }
      a1[24] = *v2;
      free(v2);
    }

    mdb_env_close1((uint64_t)a1);
    free(a1);
  }

size_t mdb_env_copyfd2(_DWORD *a1, int a2, char a3)
{
  if ((a3 & 1) != 0)
  {
    uint64_t v55 = 0LL;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    *(_OWORD *)unint64_t v51 = 0u;
    __int128 v52 = 0u;
    memset(&v50, 0, sizeof(v50));
    *(_OWORD *)unsigned __int16 v48 = 0u;
    memset(&v49, 0, sizeof(v49));
    uint64_t v47 = 0LL;
    size_t v5 = pthread_mutex_init(&v49, 0LL);
    if ((_DWORD)v5) {
      return v5;
    }
    size_t v9 = pthread_cond_init(&v50, 0LL);
    if ((_DWORD)v9)
    {
      size_t v5 = v9;
      pthread_mutex_destroy(&v49);
      return v5;
    }

    size_t v14 = posix_memalign((void **)__memptr, a1[5], 0x200000uLL);
    if ((_DWORD)v14)
    {
      size_t v5 = v14;
      goto LABEL_59;
    }

    uint64_t v15 = *(void *)&__memptr[0].st_dev;
    v51[0] = *(void **)&__memptr[0].st_dev;
    bzero(*(void **)&__memptr[0].st_dev, 0x200000uLL);
    *(void *)&__int128 v54 = 2LL;
    v51[1] = (void *)(v15 + 0x100000);
    v48[0] = a1;
    DWORD2(v54) = a2;
    size_t v5 = pthread_create(&v46, 0LL, (void *(__cdecl *)(void *))mdb_env_copythr, v48);
    if ((_DWORD)v5)
    {
LABEL_59:
      free(v51[0]);
      pthread_cond_destroy(&v50);
      pthread_mutex_destroy(&v49);
      if (!(_DWORD)v5) {
        return HIDWORD(v55);
      }
      return v5;
    }

    int v16 = mdb_txn_begin((uint64_t)a1, 0LL, 0x20000, (uint64_t *)&v47);
    if (v16)
    {
      unint64_t v17 = v47;
      goto LABEL_57;
    }

    __int128 v25 = v51[0];
    bzero(v51[0], (2 * a1[4]));
    *(void *)__int128 v25 = 0LL;
    v25[5] = 8;
    *((void *)v25 + 2) = 0x1BEEFC0DELL;
    *((void *)v25 + 4) = *((void *)a1 + 14);
    uint64_t v26 = a1[4];
    *((_DWORD *)v25 + 10) = v26;
    v25[22] = *((_WORD *)a1 + 6) | 8;
    *((void *)v25 + 10) = -1LL;
    *((_OWORD *)v25 + 8) = xmmword_100017AF0;
    *((void *)v25 + 3) = *(void *)(*((void *)a1 + 9) + 8LL);
    __int128 v27 = (char *)v51[0] + v26;
    *(void *)__int128 v27 = 1LL;
    *((_WORD *)v27 + 5) = 8;
    *((_OWORD *)v27 + 1) = *((_OWORD *)v25 + 1);
    __int128 v28 = *((_OWORD *)v25 + 2);
    __int128 v29 = *((_OWORD *)v25 + 3);
    __int128 v30 = *((_OWORD *)v25 + 4);
    *((_OWORD *)v27 + 5) = *((_OWORD *)v25 + 5);
    *((_OWORD *)v27 + 4) = v30;
    *((_OWORD *)v27 + 3) = v29;
    *((_OWORD *)v27 + 2) = v28;
    __int128 v31 = *((_OWORD *)v25 + 6);
    __int128 v32 = *((_OWORD *)v25 + 7);
    __int128 v33 = *((_OWORD *)v25 + 8);
    *((void *)v27 + 18) = *((void *)v25 + 18);
    *((_OWORD *)v27 + 8) = v33;
    *((_OWORD *)v27 + 7) = v32;
    *((_OWORD *)v27 + 6) = v31;
    unint64_t v17 = v47;
    uint64_t v34 = v47[11];
    unint64_t v45 = *(void *)(v34 + 88);
    if (v45 == -1LL)
    {
      int v41 = *(unsigned __int16 *)(v34 + 52);
      *((_WORD *)v27 + 46) = v41;
      uint64_t v37 = -1LL;
      if (!v41) {
        goto LABEL_54;
      }
    }

    else
    {
      mdb_cursor_init((uint64_t)__memptr, (uint64_t)v47, 0, 0LL);
      for (uint64_t i = 0LL; ; i += *(void *)v42[1])
      {
        int v16 = mdb_cursor_get((uint64_t)__memptr, &v43, v42, 8);
        if (v16) {
          break;
        }
      }

      if (v16 != -30798) {
        goto LABEL_57;
      }
      uint64_t v36 = v17[11];
      uint64_t v37 = v17[2] + ~(*(void *)(v36 + 8) + i + *(void *)(v36 + 16) + *(void *)(v36 + 24));
      *((void *)v27 + 17) = v37;
      __int128 v38 = *(_OWORD *)(v36 + 48);
      __int128 v39 = *(_OWORD *)(v36 + 64);
      uint64_t v40 = *(void *)(v36 + 80);
      *(_OWORD *)(v27 + 104) = v39;
      *(_OWORD *)(v27 + 88) = v38;
      *((void *)v27 + 15) = v40;
      *((void *)v27 + 16) = v37;
    }

    *((void *)v27 + 18) = 1LL;
LABEL_54:
    LODWORD(v53) = 2 * a1[4];
    v48[1] = v17;
    int v16 = mdb_env_cwalk((uint64_t)v48, &v45, 0);
    if (!v16)
    {
      if (v45 == v37)
      {
LABEL_58:
        mdb_env_cthr_toggle((uint64_t)v48, 17);
        size_t v5 = pthread_join(v46, 0LL);
        mdb_txn_abort((uint64_t)v17);
        goto LABEL_59;
      }

      int v16 = -30784;
    }

LABEL_57:
    HIDWORD(v55) = v16;
    goto LABEL_58;
  }

  v48[0] = 0LL;
  size_t v5 = mdb_txn_begin((uint64_t)a1, 0LL, 0x20000, (uint64_t *)v48);
  if (!(_DWORD)v5)
  {
    if (*((void *)a1 + 8))
    {
      int v6 = v48[0];
      mdb_txn_end((unsigned int *)v48[0], 4);
      pid_t v7 = (pthread_mutex_t *)(*((void *)a1 + 8) + 128LL);
      size_t v5 = pthread_mutex_lock(v7);
      if ((_DWORD)v5)
      {
LABEL_28:
        mdb_txn_abort((uint64_t)v48[0]);
        return v5;
      }

      uint64_t v8 = mdb_txn_renew0((uint64_t)v6);
      if ((_DWORD)v8)
      {
        size_t v5 = v8;
        pthread_mutex_unlock(v7);
        goto LABEL_28;
      }
    }

    else
    {
      pid_t v7 = 0LL;
    }

    int v10 = a1[4];
    uint64_t v11 = (2 * v10);
    int v12 = (char *)*((void *)a1 + 7);
    if ((_DWORD)v11)
    {
      size_t v5 = (2 * v10);
      while (1)
      {
        ssize_t v13 = write(a2, v12, v5);
        if (v13 < 0)
        {
          size_t v5 = *__error();
          goto LABEL_25;
        }

        if (!v13) {
          break;
        }
        v12 += v13;
        v5 -= v13;
        if (!v5) {
          goto LABEL_25;
        }
      }

      size_t v5 = 5LL;
    }

    else
    {
      size_t v5 = 0LL;
    }

                pid_t v7 = v24;
                goto LABEL_59;
              }
            }

            unint64_t v51 = *(_DWORD *)(a1 + 4LL * v16 + 160);
            if (v51 < 0x100000)
            {
              __int128 v52 = v16;
            }

            else
            {
              ssize_t v24 = mdb_env_cthr_toggle(a1, 1);
              if ((_DWORD)v24) {
                goto LABEL_57;
              }
              int v16 = *(_DWORD *)(a1 + 188);
              __int128 v52 = v16;
              unint64_t v51 = *(_DWORD *)(a1 + 4LL * v16 + 160);
            }

            __int128 v53 = a1 + 4 * v52;
            __int128 v54 = *(void *)(a1 + 8 * v52 + 128) + v51;
            mdb_page_copy((char *)v54, v66, *(_DWORD *)(*(void *)a1 + 16LL));
            uint64_t v55 = *(void *)(a1 + 176);
            *(void *)(a1 + 176) = v55 + 1;
            *(void *)__int128 v54 = v55;
            *(_DWORD *)(v53 + 160) += *(_DWORD *)(*(void *)a1 + 16LL);
            size_t v56 = WORD1(v71[0]);
            if (!WORD1(v71[0])) {
              break;
            }
            unint64_t v57 = *((void *)v71 + WORD1(v71[0]));
            int64_t v58 = v57
                + *(unsigned __int16 *)(v57
            *(_DWORD *)int64_t v58 = *(void *)v54;
            *(_WORD *)(v58 + 4) = *(_DWORD *)(v54 + 4);
            if (LOWORD(v71[0]))
            {
              if (--LOWORD(v71[0]))
              {
                int v12 = v56 - 1;
                WORD1(v71[0]) = v56 - 1;
                __int128 v25 = 1;
LABEL_51:
                if (v25) {
                  continue;
                }
              }
            }

            goto LABEL_58;
          }

          pid_t v7 = 0LL;
          *a2 = *(void *)v54;
        }

        else
        {
LABEL_58:
          pid_t v7 = 0LL;
        }

LABEL_25:
    if (v7) {
      pthread_mutex_unlock(v7);
    }
    if ((_DWORD)v5) {
      goto LABEL_28;
    }
    uint64_t v19 = *((void *)v48[0] + 2);
    uint64_t v20 = a1[4];
    if (fstat(*a1, __memptr))
    {
      size_t v5 = *__error();
      if ((_DWORD)v5) {
        goto LABEL_28;
      }
      st_std::string::size_type size = 0LL;
    }

    else
    {
      st_std::string::size_type size = v19 * v20;
    }

    unint64_t v22 = st_size - v11;
    if (st_size == v11)
    {
      size_t v5 = 0LL;
    }

    else
    {
      while (1)
      {
        if (v22 >= 0x40000000) {
          size_t v23 = 0x40000000LL;
        }
        else {
          size_t v23 = v22;
        }
        ssize_t v24 = write(a2, v12, v23);
        if (v24 < 0)
        {
          size_t v5 = *__error();
          goto LABEL_28;
        }

        if (!v24) {
          break;
        }
        size_t v5 = 0LL;
        v12 += v24;
        v22 -= v24;
        if (!v22) {
          goto LABEL_28;
        }
      }

      size_t v5 = 5LL;
    }

    goto LABEL_28;
  }

  return v5;
}

size_t mdb_env_copyfd(_DWORD *a1, int a2)
{
  return mdb_env_copyfd2(a1, a2, 0);
}

size_t mdb_env_copy2(unsigned int *a1, const char *a2, char a3)
{
  int v8 = -1;
  size_t v5 = mdb_fname_init(a2, a1[3] | 0x400000, (uint64_t)v9);
  if (!(_DWORD)v5)
  {
    size_t v5 = mdb_fopen(a1, v9, 16779777, 0x1B6u, &v8);
    if (v9[1]) {
      free(v10);
    }
    if (!(_DWORD)v5)
    {
      int v6 = v8;
      size_t v5 = mdb_env_copyfd2(a1, v8, a3);
      if (close(v6) < 0 && !(_DWORD)v5) {
        return *__error();
      }
    }
  }

  return v5;
}

size_t mdb_env_copy(unsigned int *a1, const char *a2)
{
  return mdb_env_copy2(a1, a2, 0);
}

uint64_t mdb_env_set_flags(uint64_t a1, int a2, int a3)
{
  if ((a2 & 0xFEEAFFFF) != 0) {
    return 22LL;
  }
  uint64_t result = 0LL;
  if (a3) {
    int v5 = *(_DWORD *)(a1 + 12) | a2;
  }
  else {
    int v5 = *(_DWORD *)(a1 + 12) & ~a2;
  }
  *(_DWORD *)(a1 + 12) = v5;
  return result;
}

uint64_t mdb_env_get_flags(uint64_t a1, int *a2)
{
  uint64_t result = 22LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *a2 = *(_DWORD *)(a1 + 12) & 0x3FF4001;
    }
  }

  return result;
}

uint64_t mdb_env_set_userctx(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 22LL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + 232) = a2;
  return result;
}

uint64_t mdb_env_get_userctx(uint64_t result)
{
  if (result) {
    return *(void *)(result + 232);
  }
  return result;
}

uint64_t mdb_env_set_assert(uint64_t a1)
{
  if (a1) {
    return 0LL;
  }
  else {
    return 22LL;
  }
}

uint64_t mdb_env_get_path(uint64_t a1, void *a2)
{
  uint64_t result = 22LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *a2 = *(void *)(a1 + 48);
    }
  }

  return result;
}

uint64_t mdb_env_get_fd(_DWORD *a1, _DWORD *a2)
{
  uint64_t result = 22LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *a2 = *a1;
    }
  }

  return result;
}

__n128 mdb_env_stat(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a2)
    {
      uint64_t v2 = *(void *)(a1
                     + 72
                     + 8LL
                     * ((*(_DWORD *)(a1 + 12) >> 25) & 1 ^ (*(void *)(*(void *)(a1 + 72) + 128LL) < *(void *)(*(void *)(a1 + 80) + 128LL))));
      int v3 = *(unsigned __int16 *)(v2 + 78);
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 16);
      *(_DWORD *)(a2 + 4) = v3;
      *(_OWORD *)(a2 + 8) = *(_OWORD *)(v2 + 80);
      __n128 result = *(__n128 *)(v2 + 96);
      *(__n128 *)(a2 + 24) = result;
    }
  }

  return result;
}

uint64_t mdb_env_info(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 22LL;
  if (a1 && a2)
  {
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v5 = *(void *)(a1 + 80);
    uint64_t v3 = a1 + 72;
    int v6 = *(void **)(v3
                    + 8LL
                    * ((*(_DWORD *)(v3 - 60) >> 25) & 1 ^ (*(void *)(v4 + 128) < *(void *)(v5 + 128))));
    *(void *)a2 = v6[1];
    *(void *)(a2 + 16) = v6[15];
    *(void *)(a2 + 24) = v6[16];
    *(void *)(a2 + 8) = *(void *)(v3 + 40);
    *(_DWORD *)(a2 + 32) = *(_DWORD *)(v3 - 48);
    uint64_t v7 = *(void *)(v3 - 8);
    if (v7) {
      int v8 = *(_DWORD *)(v7 + 16);
    }
    else {
      int v8 = 0;
    }
    uint64_t v2 = 0LL;
    *(_DWORD *)(a2 + 36) = v8;
  }

  return v2;
}

__n128 mdb_stat(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a1
    && a3
    && *(_DWORD *)(a1 + 120) > a2
    && (*(_BYTE *)(*(void *)(a1 + 112) + a2) & 8) != 0
    && (*(_BYTE *)(a1 + 124) & 0x13) == 0)
  {
    if ((*(_BYTE *)(*(void *)(a1 + 112) + a2) & 2) != 0) {
      mdb_cursor_init((uint64_t)v10, a1, a2, (uint64_t)v9);
    }
    uint64_t v6 = *(void *)(a1 + 88);
    *(_DWORD *)a3 = *(_DWORD *)(*(void *)(a1 + 32) + 16LL);
    uint64_t v7 = v6 + 48LL * a2;
    *(_DWORD *)(a3 + 4) = *(unsigned __int16 *)(v7 + 6);
    *(_OWORD *)(a3 + 8) = *(_OWORD *)(v7 + 8);
    __n128 result = *(__n128 *)(v7 + 24);
    *(__n128 *)(a3 + 24) = result;
  }

  return result;
}

uint64_t mdb_env_get_maxkeysize()
{
  return 511LL;
}

uint64_t mdb_reader_list(uint64_t a1, uint64_t (*a2)(const char *, uint64_t), uint64_t a3)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    uint64_t v6 = a2;
    if (a2)
    {
      uint64_t v7 = *(void *)(a1 + 64);
      if (v7)
      {
        uint64_t v8 = *(unsigned int *)(v7 + 16);
        if (!(_DWORD)v8) {
          return v6("(no active readers)\n", a3);
        }
        uint64_t result = 0LL;
        uint64_t v9 = v7 + 208;
        int v10 = 1;
        do
        {
          if (*(_DWORD *)(v9 - 8))
          {
            if (*(void *)(v9 - 16) == -1LL) {
              snprintf(__str, 0x40uLL, "%10d %zx -\n");
            }
            else {
              snprintf(__str, 0x40uLL, "%10d %zx %zu\n");
            }
            if (v10)
            {
              uint64_t result = a2("    pid     thread     txnid\n", a3);
              if ((result & 0x80000000) != 0) {
                return result;
              }
            }

            uint64_t result = a2(__str, a3);
            if ((result & 0x80000000) != 0) {
              return result;
            }
            int v10 = 0;
            uint64_t v6 = a2;
          }

          v9 += 64LL;
          --v8;
        }

        while (v8);
        if (v10) {
          return v6("(no active readers)\n", a3);
        }
      }

      else
      {
        return a2("(no reader locks)\n", a3);
      }
    }
  }

  return result;
}

uint64_t mdb_reader_check(uint64_t a1, _DWORD *a2)
{
  if (!a1) {
    return 22LL;
  }
  if (a2) {
    *a2 = 0;
  }
  uint64_t v4 = *(void *)(a1 + 64);
  if (!v4) {
    return 0LL;
  }
  uint64_t v5 = *(unsigned int *)(v4 + 16);
  uint64_t v6 = (unsigned int *)malloc(4LL * (v5 + 1));
  if (!v6) {
    return 12LL;
  }
  uint64_t v7 = v6;
  *uint64_t v6 = 0;
  if ((_DWORD)v5)
  {
    uint64_t v8 = 0LL;
    int v9 = 0;
    int v10 = (pthread_mutex_t *)(v4 + 24);
    uint64_t v11 = v4 + 192;
    uint64_t v28 = v4 + 200;
    while (1)
    {
      int v12 = *(_DWORD *)(v11 + (v8 << 6) + 8);
      if (v12 && v12 != *(_DWORD *)(a1 + 40))
      {
        uint64_t v13 = *v7;
        if ((_DWORD)v13)
        {
          unsigned int v14 = 0;
          unsigned int v15 = *v7;
          do
          {
            while (1)
            {
              unsigned int v16 = v15 >> 1;
              unsigned int v17 = v14 + (v15 >> 1) + 1;
              int v18 = v12 - v7[v17];
              if (v18 >= 0) {
                break;
              }
              v15 >>= 1;
              if (!v16) {
                goto LABEL_17;
              }
            }

            if (!v18) {
              goto LABEL_36;
            }
            v15 += ~v16;
            unsigned int v14 = v17;
          }

          while (v15);
LABEL_17:
          unsigned int v19 = v18 <= 0 ? v17 : v17 + 1;
        }

        else
        {
          unsigned int v19 = 1;
        }

        uint64_t v20 = (v13 + 1);
        *uint64_t v7 = v20;
        if (v20 > v19)
        {
          uint64_t v21 = v20;
          do
            v7[v21--] = v7[v13--];
          while (v19 < (int)v13 + 1);
          uint64_t v20 = v13 + 1;
        }

        v7[v20] = v12;
        if (!mdb_reader_pid(a1, 7, v12))
        {
          uint64_t v22 = pthread_mutex_lock(v10);
          if ((_DWORD)v22)
          {
            uint64_t v26 = v22;
            goto LABEL_43;
          }

          else {
            uint64_t v23 = v8;
          }
          if (v23 < v5)
          {
            int v24 = v5 - v23;
            __int128 v25 = (_DWORD *)(v28 + (v23 << 6));
            do
            {
              if (*v25 == v12)
              {
                *__int128 v25 = 0;
                ++v9;
              }

              v25 += 16;
              --v24;
            }

            while (v24);
          }

          pthread_mutex_unlock(v10);
        }
      }

uint64_t mdb_env_init_meta(uint64_t a1, uint64_t a2)
{
  size_t v4 = *(unsigned int *)(a1 + 16);
  uint64_t v5 = (char *)calloc(2uLL, v4);
  if (!v5) {
    return 12LL;
  }
  uint64_t v6 = v5;
  *(void *)uint64_t v5 = 0LL;
  *((_WORD *)v5 + 5) = 8;
  *((_OWORD *)v5 + 1) = *(_OWORD *)a2;
  __int128 v7 = *(_OWORD *)(a2 + 16);
  __int128 v8 = *(_OWORD *)(a2 + 32);
  __int128 v9 = *(_OWORD *)(a2 + 48);
  *((_OWORD *)v5 + 5) = *(_OWORD *)(a2 + 64);
  *((_OWORD *)v5 + 4) = v9;
  *((_OWORD *)v5 + 3) = v8;
  *((_OWORD *)v5 + 2) = v7;
  __int128 v10 = *(_OWORD *)(a2 + 80);
  __int128 v11 = *(_OWORD *)(a2 + 96);
  __int128 v12 = *(_OWORD *)(a2 + 112);
  *((void *)v5 + 18) = *(void *)(a2 + 128);
  *((_OWORD *)v5 + 8) = v12;
  *((_OWORD *)v5 + 7) = v11;
  *((_OWORD *)v5 + 6) = v10;
  uint64_t v13 = &v5[v4];
  *(void *)uint64_t v13 = 1LL;
  *((_WORD *)v13 + 5) = 8;
  *((_OWORD *)v13 + 1) = *(_OWORD *)a2;
  __int128 v14 = *(_OWORD *)(a2 + 16);
  __int128 v15 = *(_OWORD *)(a2 + 32);
  __int128 v16 = *(_OWORD *)(a2 + 48);
  *((_OWORD *)v13 + 5) = *(_OWORD *)(a2 + 64);
  *((_OWORD *)v13 + 4) = v16;
  *((_OWORD *)v13 + 3) = v15;
  *((_OWORD *)v13 + 2) = v14;
  __int128 v17 = *(_OWORD *)(a2 + 80);
  __int128 v18 = *(_OWORD *)(a2 + 96);
  __int128 v19 = *(_OWORD *)(a2 + 112);
  *((void *)v13 + 18) = *(void *)(a2 + 128);
  *((_OWORD *)v13 + 8) = v19;
  *((_OWORD *)v13 + 7) = v18;
  *((_OWORD *)v13 + 6) = v17;
  size_t v20 = (2 * v4);
  while (1)
  {
    int v21 = pwrite(*(_DWORD *)a1, v6, v20, 0LL);
    if (v21 != -1) {
      break;
    }
    if (*__error() != 4) {
      goto LABEL_11;
    }
  }

  if (v21 < 0)
  {
LABEL_11:
    uint64_t v22 = *__error();
    goto LABEL_12;
  }

  if ((_DWORD)v20 == v21) {
    uint64_t v22 = 0LL;
  }
  else {
    uint64_t v22 = 28LL;
  }
LABEL_12:
  free(v6);
  return v22;
}

uint64_t mdb_env_copythr(uint64_t a1)
{
  sigset_t v18 = 4096;
  int v2 = pthread_sigmask(1, &v18, 0LL);
  if (v2) {
    *(_DWORD *)(a1 + 196) = v2;
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  for (uint64_t i = 0LL; ; i ^= 1uLL)
  {
    while (1)
    {
      int v4 = *(_DWORD *)(a1 + 192);
      if (v4) {
        break;
      }
      pthread_cond_wait((pthread_cond_t *)(a1 + 80), (pthread_mutex_t *)(a1 + 16));
    }

    if (v4 == 16) {
      break;
    }
    uint64_t v5 = a1 + 4 * i;
    int v8 = *(_DWORD *)(v5 + 160);
    uint64_t v6 = (_DWORD *)(v5 + 160);
    int v7 = v8;
    uint64_t v9 = a1 + 8 * i;
    __int128 v10 = *(char **)(v9 + 128);
    __int128 v11 = v6 + 2;
    __int128 v12 = (const void **)(v9 + 144);
    while (1)
    {
      if (v7 >= 1)
      {
        while (1)
        {
          if (*(_DWORD *)(a1 + 196)) {
            goto LABEL_20;
          }
          unsigned int v13 = write(*(_DWORD *)(a1 + 184), v10, v7);
          if ((v13 & 0x80000000) != 0) {
            break;
          }
          if (!v13)
          {
            int v15 = 5;
LABEL_19:
            *(_DWORD *)(a1 + 196) = v15;
            goto LABEL_20;
          }

          v10 += v13;
          BOOL v14 = __OFSUB__(v7, v13);
          v7 -= v13;
          if ((v7 < 0) ^ v14 | (v7 == 0)) {
            goto LABEL_20;
          }
        }

        int v15 = *__error();
        if (!v15) {
          goto LABEL_20;
        }
        if (v15 == 32)
        {
          sigwait(&v18, &v17);
          int v15 = 32;
        }

        goto LABEL_19;
      }

uint64_t mdb_env_cwalk(uint64_t a1, unint64_t *a2, char a3)
{
  uint64_t v72 = 0LL;
  memset(v71, 0, sizeof(v71));
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  unint64_t v4 = *a2;
  if (v4 == -1LL) {
    return 0LL;
  }
  LOWORD(v71[0]) = 1;
  *((void *)&v68 + 1) = *(void *)(a1 + 8);
  DWORD1(v71[0]) = *(_DWORD *)(*((void *)&v68 + 1) + 124LL) & 0xA0000;
  uint64_t v7 = mdb_page_get((uint64_t)&v67, v4, (unint64_t *)v71 + 1, 0LL);
  if (!(_DWORD)v7)
  {
    uint64_t v7 = mdb_page_search_root((uint64_t)&v67, 0LL, 4);
    if (!(_DWORD)v7)
    {
      uint64_t v8 = *(void *)a1;
      LODWORD(v9) = *(_DWORD *)(*(void *)a1 + 16LL);
      int v10 = LOWORD(v71[0]);
      __int128 v11 = malloc(v9 * LOWORD(v71[0]));
      if (v11)
      {
        unsigned __int16 v12 = WORD1(v71[0]);
        __int128 __dst = v11;
        unsigned int v13 = (char *)v11;
        if (WORD1(v71[0]))
        {
          BOOL v14 = (char **)v71 + 1;
          uint64_t v15 = WORD1(v71[0]);
          unsigned int v13 = (char *)v11;
          do
          {
            mdb_page_copy(v13, *v14, v9);
            *v14++ = v13;
            uint64_t v9 = *(unsigned int *)(v8 + 16);
            v13 += v9;
            --v15;
          }

          while (v15);
        }

        if (v10)
        {
          int v16 = *(_DWORD *)(a1 + 188);
          int v60 = a3 & 4;
          while (1)
          {
            int v17 = (_WORD *)*((void *)v71 + v12 + 1);
            unsigned int v66 = v17;
            unsigned int v18 = (unsigned __int16)v17[6] - 16;
            unsigned int v19 = v18 >> 1;
            __int16 v20 = v17[5];
            if ((v20 & 2) != 0)
            {
              if (v20 & 0x20 | v60) {
                BOOL v28 = 0;
              }
              else {
                BOOL v28 = v18 >= 2;
              }
              if (v28)
              {
                if (v19 <= 1) {
                  uint64_t v29 = 1LL;
                }
                else {
                  uint64_t v29 = v19;
                }
                uint64_t v30 = -v29;
                uint64_t v31 = 8LL;
                uint64_t v62 = -v29;
                do
                {
                  __int128 v32 = v66;
                  __int128 v33 = (char *)v66 + *((unsigned __int16 *)v66 + v31);
                  __int16 v34 = *((_WORD *)v33 + 2);
                  if ((v34 & 1) != 0)
                  {
                    if (v66 != v13)
                    {
                      *((void *)v71 + WORD1(v71[0]) + 1) = v13;
                      mdb_page_copy(v13, v32, *(_DWORD *)(*(void *)a1 + 16LL));
                      unsigned int v66 = v13;
                      __int128 v33 = &v13[*(unsigned __int16 *)&v13[2 * v31]];
                    }

                    int v41 = &v33[*((unsigned __int16 *)v33 + 3)];
                    unint64_t v42 = *((void *)v41 + 1);
                    *((void *)v41 + 1) = *(void *)(a1 + 176);
                    uint64_t v24 = mdb_page_get((uint64_t)&v67, v42, (unint64_t *)__src, 0LL);
                    if ((_DWORD)v24) {
                      goto LABEL_57;
                    }
                    int v43 = *(_DWORD *)(a1 + 4LL * v16 + 160);
                    if (v43 < 0x100000)
                    {
                      uint64_t v44 = v16;
                    }

                    else
                    {
                      uint64_t v24 = mdb_env_cthr_toggle(a1, 1);
                      if ((_DWORD)v24) {
                        goto LABEL_57;
                      }
                      int v16 = *(_DWORD *)(a1 + 188);
                      uint64_t v44 = v16;
                      int v43 = *(_DWORD *)(a1 + 4LL * v16 + 160);
                    }

                    uint64_t v45 = a1 + 8 * v44;
                    uint64_t v46 = a1 + 4 * v44;
                    uint64_t v47 = (void *)(*(void *)(v45 + 128) + v43);
                    unsigned __int16 v48 = (unsigned int *)__src[0];
                    memcpy(v47, __src[0], *(unsigned int *)(*(void *)a1 + 16LL));
                    *uint64_t v47 = *(void *)(a1 + 176);
                    *(void *)(a1 + 176) += v48[3];
                    uint64_t v49 = *(void *)a1;
                    *(_DWORD *)(v46 + 160) += *(_DWORD *)(*(void *)a1 + 16LL);
                    unsigned int v50 = v48[3];
                    if (v50 >= 2)
                    {
                      *(_DWORD *)(v46 + 168) = *(_DWORD *)(v49 + 16) * (v50 - 1);
                      *(void *)(v45 + 144) = (char *)v48 + *(unsigned int *)(v49 + 16);
                      uint64_t v24 = mdb_env_cthr_toggle(a1, 1);
                      if ((_DWORD)v24) {
                        goto LABEL_57;
                      }
                      int v16 = *(_DWORD *)(a1 + 188);
                    }

                    uint64_t v30 = v62;
                  }

                  else if ((v34 & 2) != 0)
                  {
                    if (v66 != v13)
                    {
                      *((void *)v71 + WORD1(v71[0]) + 1) = v13;
                      mdb_page_copy(v13, v32, *(_DWORD *)(*(void *)a1 + 16LL));
                      unsigned int v66 = v13;
                      __int128 v33 = &v13[*(unsigned __int16 *)&v13[2 * v31]];
                    }

                    uint64_t v35 = &v33[*((unsigned __int16 *)v33 + 3) + 8];
                    __int128 v36 = *(_OWORD *)v35;
                    __int128 v37 = *((_OWORD *)v35 + 2);
                    __int128 v64 = *((_OWORD *)v35 + 1);
                    __int128 v65 = v37;
                    *(_OWORD *)__src = v36;
                    *(_DWORD *)(a1 + 188) = v16;
                    uint64_t v24 = mdb_env_cwalk(a1, (char *)&v65 + 8, *((_WORD *)v33 + 2) & 4);
                    if ((_DWORD)v24) {
                      goto LABEL_57;
                    }
                    int v16 = *(_DWORD *)(a1 + 188);
                    __int128 v38 = &v33[*((unsigned __int16 *)v33 + 3) + 8];
                    __int128 v40 = v64;
                    __int128 v39 = v65;
                    *(_OWORD *)__int128 v38 = *(_OWORD *)__src;
                    *((_OWORD *)v38 + 1) = v40;
                    *((_OWORD *)v38 + 2) = v39;
                  }

                  ++v31;
                }

                while (v30 + v31 != 8);
              }
            }

            else
            {
              int v21 = (char *)&v67 + 2 * v12;
              unsigned __int16 v22 = *((_WORD *)v21 + 164) + 1;
              *((_WORD *)v21 + 164) = v22;
              if (v19 > v22)
              {
                for (uint64_t i = (char *)v17 + (unsigned __int16)v17[v22 + 8];
                      ;
                      uint64_t i = &v26[*(unsigned __int16 *)&v26[2 * *((unsigned __int16 *)&v71[16] + WORD1(v71[0]) + 4) + 16]])
                {
                  uint64_t v24 = mdb_page_get( (uint64_t)&v67,  *(unsigned int *)i | ((unint64_t)*((unsigned __int16 *)i + 2) << 32),  (unint64_t *)&v66,  0LL);
                  if ((_DWORD)v24) {
                    break;
                  }
                  unsigned __int16 v12 = WORD1(v71[0]) + 1;
                  WORD1(v71[0]) = v12;
                  __int16 v25 = ++LOWORD(v71[0]);
                  *((_WORD *)&v71[16] + v12 + 4) = 0;
                  uint64_t v26 = (char *)v66;
                  __int128 v27 = (char **)v71 + v12 + 1;
                  if ((*((_BYTE *)v66 + 10) & 1) == 0)
                  {
                    *__int128 v27 = (char *)v66;
                    goto LABEL_51;
                  }

                  mdb_page_copy(*v27, v66, *(_DWORD *)(*(void *)a1 + 16LL));
                }

uint64_t mdb_env_cthr_toggle(uint64_t a1, int a2)
{
  unint64_t v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  *(_DWORD *)(a1 + 192) += a2;
  pthread_cond_signal((pthread_cond_t *)(a1 + 80));
  while ((*(_BYTE *)(a1 + 192) & 2) != 0)
    pthread_cond_wait((pthread_cond_t *)(a1 + 80), v4);
  pthread_mutex_unlock(v4);
  int v5 = *(_DWORD *)(a1 + 188) ^ a2 & 1;
  *(_DWORD *)(a1 + 188) = v5;
  *(_DWORD *)(a1 + 4LL * v5 + 160) = 0;
  return *(unsigned int *)(a1 + 196);
}