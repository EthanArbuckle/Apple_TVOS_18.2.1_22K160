void **std::unique_ptr<mlc::xpc_dispatch_t>::~unique_ptr[abi:ne180100](void **a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  uint64_t v7;
  void *v8;
  v2 = *a1;
  *a1 = 0LL;
  if (!v2) {
    return a1;
  }
  v3 = (void *)v2[3];
  if (v3)
  {
    do
    {
      v8 = (void *)*v3;
      v6 = (void *)v3[6];
      if (v6 == v3 + 3)
      {
        v6 = v3 + 3;
        v7 = 4LL;
      }

      else
      {
        if (!v6) {
          goto LABEL_9;
        }
        v7 = 5LL;
      }

      (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_9:
      operator delete(v3);
      v3 = v8;
    }

    while (v8);
  }

  v4 = (void *)v2[1];
  v2[1] = 0LL;
  if (v4) {
    operator delete(v4);
  }
  operator delete(v2);
  return a1;
}

int main(int argc, const char **argv, const char **envp)
{
  os_log_t v3 = os_log_create("com.apple.mlcompiler.service.compiler", "Compilation");
  v4 = (char *)operator new(0x30uLL);
  *(void *)v4 = v3;
  *(_OWORD *)(v4 + 8) = 0u;
  *(_OWORD *)(v4 + 24) = 0u;
  *((_DWORD *)v4 + 10) = 1065353216;
  v5 = (void *)global_dispatch;
  global_dispatch = (uint64_t)v4;
  if (!v5) {
    goto LABEL_6;
  }
  v6 = (void *)v5[3];
  if (!v6)
  {
LABEL_3:
    v7 = (void *)v5[1];
    v5[1] = 0LL;
    if (v7) {
      operator delete(v7);
    }
    operator delete(v5);
    v4 = (char *)global_dispatch;
LABEL_6:
    unint64_t v15 = 1031LL;
    *(void *)buf = &v15;
    v8 = std::__hash_table<std::__hash_value_type<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>>,std::__unordered_map_hasher<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>,std::hash<mlc::function_kind_t>,std::equal_to<mlc::function_kind_t>,true>,std::__unordered_map_equal<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>,std::equal_to,std::hash,true>,std::allocator<std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>>>::__emplace_unique_key_args<mlc::function_kind_t,std::piecewise_construct_t const&,std::tuple<mlc::function_kind_t const&>,std::piecewise_construct_t const&<>>( (uint64_t)(v4 + 8),  &v15,  (uint64_t)&std::piecewise_construct,  (void **)buf);
    *(void *)buf = off_100004240;
    v17 = xpc_compile;
    v18 = buf;
    std::__function::__value_func<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>::swap[abi:ne180100](buf, v8 + 3);
    v9 = v18;
    if (v18 == buf)
    {
      uint64_t v10 = 4LL;
      v9 = buf;
    }

    else
    {
      if (!v18) {
        goto LABEL_17;
      }
      uint64_t v10 = 5LL;
    }

    (*(void (**)(void))(*(void *)v9 + 8 * v10))();
LABEL_17:
    v14 = os_log_create("com.apple.mlcompiler.service.compiler", "Compilation");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Started\n", buf, 2u);
    }

    xpc_main((xpc_connection_handler_t)conection_handler);
  }

  while (1)
  {
    v13 = (void *)*v6;
    v11 = (void *)v6[6];
    if (v11 == v6 + 3)
    {
      v11 = v6 + 3;
      uint64_t v12 = 4LL;
    }

    else
    {
      if (!v11) {
        goto LABEL_10;
      }
      uint64_t v12 = 5LL;
    }

    (*(void (**)(void))(*v11 + 8 * v12))();
LABEL_10:
    operator delete(v6);
    v6 = v13;
    if (!v13) {
      goto LABEL_3;
    }
  }
}

uint64_t xpc_compile(xpc_object_t *a1, uint64_t a2)
{
  uint64_t v11 = a2;
  uint64_t v12 = 0LL;
  v13 = &_free;
  uint64_t v14 = 0LL;
  pthread_attr_init(&v20);
  pthread_attr_setstacksize(&v20, 0x404000uLL);
  pthread_create(v15, &v20, (void *(__cdecl *)(void *))compile_thread_handler, &v11);
  pthread_join(v15[0], 0LL);
  os_log_t v3 = os_log_create("com.apple.mlcompiler.service.compiler", "Compilation");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v12;
    if (v12 && !*v12) {
      v4 = &unk_100003E26;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = v4;
    __int16 v17 = 2048;
    uint64_t v18 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Compilation completed: %s (%lfms)",  buf,  0x16u);
  }

  char v19 = 1;
  strcpy(buf, "m");
  v5 = v12;
  if (v12 && !*v12) {
    v5 = (const char *)&unk_100003E26;
  }
  v6 = (_opaque_pthread_t *)xpc_string_create(v5);
  v15[1] = v6;
  xpc_dictionary_set_value(*a1, buf, v6);
  if (v6) {
    xpc_release(v6);
  }
  if (v19 < 0)
  {
    operator delete(*(void **)buf);
    v7 = v12;
    if (v12) {
      goto LABEL_13;
    }
  }

  else
  {
    v7 = v12;
    if (v12)
    {
LABEL_13:
      BOOL v8 = *v7 == 0;
      goto LABEL_16;
    }
  }

  BOOL v8 = 0;
LABEL_16:
  mlc::xpc_auto_message_t::set_ret(a1, v8);
  xpc_dictionary_send_reply(*a1);
  if (*a1) {
    xpc_release(*a1);
  }
  *a1 = 0LL;
  uint64_t result = (uint64_t)v12;
  uint64_t v12 = 0LL;
  if (result) {
    return ((uint64_t (*)(uint64_t, uint64_t))v13)(result, v9);
  }
  return result;
}

void sub_100002914( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void conection_handler(_xpc_connection_s *a1)
{
  v2 = xpc_copy_description(a1);
  free(v2);
  xpc_connection_set_event_handler(a1, &__block_literal_global);
  xpc_connection_activate(a1);
}

uint64_t compile_thread_handler(double *a1)
{
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep rep = std::chrono::steady_clock::now().__d_.__rep_;
  uint64_t v3 = mlc_model_compile((*(void *)(*(void *)a1 + 8LL) - **(void **)a1) >> 3);
  a1[3] = (double)(std::chrono::steady_clock::now().__d_.__rep_ - rep) / 1000000.0;
  uint64_t v4 = *((void *)a1 + 1);
  *((void *)a1 + 1) = v3;
  if (v4) {
    (*((void (**)(void))a1 + 2))();
  }
  return 0LL;
}

void __clang_call_terminate(void *a1)
{
}

void mlc::xpc_auto_handle_t::~xpc_auto_handle_t(void **this)
{
  v1 = *this;
  if (v1) {
    xpc_release(v1);
  }
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_100002AA8(_Unwind_Exception *a1)
{
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

xpc_object_t *mlc::xpc_auto_message_t::set_ret(xpc_object_t *this, BOOL value)
{
  char v6 = 1;
  LOWORD(__p) = 114;
  xpc_object_t v3 = xpc_BOOL_create(value);
  xpc_object_t v7 = v3;
  xpc_dictionary_set_value(*this, (const char *)&__p, v3);
  if (v3) {
    xpc_release(v3);
  }
  if (v6 < 0) {
    operator delete(__p);
  }
  return this;
}

void sub_100002B80( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void ___ZL17conection_handlerP17_xpc_connection_s_block_invoke(id a1, void *a2)
{
}

void *std::__hash_table<std::__hash_value_type<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>>,std::__unordered_map_hasher<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>,std::hash<mlc::function_kind_t>,std::equal_to<mlc::function_kind_t>,true>,std::__unordered_map_equal<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>,std::equal_to,std::hash,true>,std::allocator<std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>>>::__emplace_unique_key_args<mlc::function_kind_t,std::piecewise_construct_t const&,std::tuple<mlc::function_kind_t const&>,std::piecewise_construct_t const&<>>( uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }

    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (i = *v10; i; i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7) {
            return i;
          }
        }

        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }

          else
          {
            v12 &= v8 - 1;
          }

          if (v12 != v4) {
            break;
          }
        }
      }
    }
  }

  v13 = (void *)(a1 + 16);
  i = operator new(0x38uLL);
  void *i = 0LL;
  i[1] = v7;
  i[2] = **a4;
  i[6] = 0LL;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    BOOL v16 = 1LL;
    if (v8 >= 3) {
      BOOL v16 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v8);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t prime = v18;
    }
    else {
      size_t prime = v17;
    }
    if (prime == 1)
    {
      size_t prime = 2LL;
    }

    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
      unint64_t v8 = *(void *)(a1 + 8);
    }

    if (prime > v8) {
      goto LABEL_30;
    }
    if (prime < v8)
    {
      unint64_t v20 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v8 < 3 || (uint8x8_t v21 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v21.i16[0] = vaddlv_u8(v21), v21.u32[0] > 1uLL))
      {
        unint64_t v20 = std::__next_prime(v20);
      }

      else
      {
        uint64_t v22 = 1LL << -(char)__clz(v20 - 1);
        if (v20 >= 2) {
          unint64_t v20 = v22;
        }
      }

      if (prime <= v20) {
        size_t prime = v20;
      }
      if (prime < v8) {
LABEL_30:
      }
        std::__hash_table<std::__hash_value_type<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>>,std::__unordered_map_hasher<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>,std::hash<mlc::function_kind_t>,std::equal_to<mlc::function_kind_t>,true>,std::__unordered_map_equal<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>,std::equal_to,std::hash,true>,std::allocator<std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>>>::__do_rehash<true>( a1,  prime);
    }

    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }

    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }

  uint64_t v23 = *(void *)a1;
  v24 = *(void **)(*(void *)a1 + 8 * v4);
  if (v24)
  {
    void *i = *v24;
LABEL_55:
    void *v24 = i;
    goto LABEL_56;
  }

  void *i = *v13;
  void *v13 = i;
  *(void *)(v23 + 8 * v4) = v13;
  if (*i)
  {
    unint64_t v25 = *(void *)(*i + 8LL);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v25 >= v8) {
        v25 %= v8;
      }
    }

    else
    {
      v25 &= v8 - 1;
    }

    v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_55;
  }

LABEL_56:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_100002E80(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t std::unique_ptr<std::__hash_node<std::__hash_value_type<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>>,mlc::xpc_auto_reply_t &&>,std::__hash_node_destructor<std::allocator<std::__hash_value_type<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>>>>>::~unique_ptr[abi:ne180100]( uint64_t a1)
{
  v2 = *(void **)a1;
  *(void *)a1 = 0LL;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
    {
      xpc_object_t v3 = (void *)v2[6];
      if (v3 == v2 + 3)
      {
        uint64_t v4 = 4LL;
        xpc_object_t v3 = v2 + 3;
        goto LABEL_7;
      }

      if (v3)
      {
        uint64_t v4 = 5LL;
LABEL_7:
        (*(void (**)(void))(*v3 + 8 * v4))();
      }
    }

    operator delete(v2);
  }

  return a1;
}

void std::__hash_table<std::__hash_value_type<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>>,std::__unordered_map_hasher<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>,std::hash<mlc::function_kind_t>,std::equal_to<mlc::function_kind_t>,true>,std::__unordered_map_equal<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>,std::equal_to,std::hash,true>,std::allocator<std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>>>::__do_rehash<true>( uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0LL;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0LL;
    while (a2 != v6);
    unint64_t v7 = *(void **)(a1 + 16);
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
      uint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v13 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v13 >= a2) {
              v13 %= a2;
            }
          }

          else
          {
            v13 &= a2 - 1;
          }

          if (v13 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v13))
            {
              *(void *)(*(void *)a1 + 8 * v13) = v7;
              goto LABEL_19;
            }

            void *v7 = *v11;
            uint64_t v12 = 8 * v13;
            void *v11 = **(void **)(*(void *)a1 + v12);
            **(void **)(*(void *)a1 + v12) = v11;
            uint64_t v11 = v7;
          }

          unint64_t v13 = v8;
LABEL_19:
          unint64_t v7 = v11;
          uint64_t v11 = (void *)*v11;
          unint64_t v8 = v13;
        }

        while (v11);
      }
    }
  }

  else
  {
    uint64_t v10 = *(void **)a1;
    *(void *)a1 = 0LL;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0LL;
  }

void *std::__function::__func<void mlc::xpc_dispatch_t::add<void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>)>(mlc::function_kind_t,void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>) &&)::{lambda(mlc::xpc_auto_reply_t&&,void *)#1},std::allocator<mlc::xpc_auto_reply_t&&>,BOOL ()(void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>) &&,mlc::xpc_auto_reply_t&)>::__clone( uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = off_100004240;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void mlc::xpc_dispatch_t::add<void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>)>(mlc::function_kind_t,void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>) &&)::{lambda(mlc::xpc_auto_reply_t&&,void *)#1},std::allocator<mlc::xpc_auto_reply_t&&>,BOOL ()(void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>) &&,mlc::xpc_auto_reply_t&)>::__clone( uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_100004240;
  a2[1] = v2;
  return result;
}

BOOL std::__function::__func<void mlc::xpc_dispatch_t::add<void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>)>(mlc::function_kind_t,void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>) &&)::{lambda(mlc::xpc_auto_reply_t&&,void *)#1},std::allocator<mlc::xpc_auto_reply_t&&>,BOOL ()(void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>) &&,mlc::xpc_auto_reply_t&)>::operator()( uint64_t a1, __int128 *a2, xpc_object_t *a3)
{
  xpc_object_t v4 = *a3;
  v5 = *(void (**)(xpc_object_t *, void **))(a1 + 8);
  size_t count = xpc_array_get_count(*a3);
  if (count == 1) {
    mlc::detail::dispatch_impl_t<void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>),void,mlc::xpc_auto_reply_t,std::vector<char const*>>::invoke_with_seq<mlc::xpc_auto_reply_t&&,0ul>( v5,  a2,  v4);
  }
  return count == 1;
}

void mlc::detail::dispatch_impl_t<void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>),void,mlc::xpc_auto_reply_t,std::vector<char const*>>::invoke_with_seq<mlc::xpc_auto_reply_t&&,0ul>( void (*a1)(xpc_object_t *, void **), __int128 *a2, xpc_object_t xarray)
{
  __int128 v4 = *a2;
  *(void *)a2 = 0LL;
  *(_OWORD *)object = v4;
  xpc_object_t value = xpc_array_get_value(xarray, 0LL);
  mlc::xpc<std::vector<char const*>>::get_value(value, (const char ***)__p);
  a1(object, __p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  if (object[0]) {
    xpc_release(object[0]);
  }
}

void sub_10000317C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13)
{
  if (__p) {
    operator delete(__p);
  }
  mlc::xpc_auto_reply_t::~xpc_auto_reply_t(&a13);
  _Unwind_Resume(a1);
}

void mlc::xpc<std::vector<char const*>>::get_value(void *a1@<X0>, const char ***a2@<X8>)
{
  *a2 = 0LL;
  a2[1] = 0LL;
  a2[2] = 0LL;
  size_t count = xpc_array_get_count(a1);
  if (count)
  {
    __int128 v4 = 0LL;
    size_t v5 = 0LL;
    while (1)
    {
      xpc_object_t value = xpc_array_get_value(a1, v5);
      string_ptr = xpc_string_get_string_ptr(value);
      uint8x8_t v9 = string_ptr;
      unint64_t v10 = (unint64_t)a2[2];
      void *v4 = string_ptr;
      uint64_t v6 = v4 + 1;
LABEL_4:
      a2[1] = v6;
      ++v5;
      __int128 v4 = v6;
      if (v5 == count) {
        return;
      }
    }

    uint64_t v11 = *a2;
    uint64_t v12 = (char *)v4 - (char *)*a2;
    uint64_t v13 = v12 >> 3;
    unint64_t v14 = (v12 >> 3) + 1;
    if (v14 >> 61) {
      std::vector<char const*>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = v10 - (void)v11;
    if (v15 >> 2 > v14) {
      unint64_t v14 = v15 >> 2;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16)
    {
      if (v16 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      unint64_t v17 = operator new(8 * v16);
    }

    else
    {
      unint64_t v17 = 0LL;
    }

    unint64_t v18 = (const char **)&v17[8 * v13];
    uint8_t *v18 = v9;
    uint64_t v6 = v18 + 1;
    if (v4 == v11)
    {
LABEL_21:
      *a2 = v18;
      a2[1] = v6;
      a2[2] = (const char **)&v17[8 * v16];
      if (v4) {
        operator delete(v4);
      }
      goto LABEL_4;
    }

    unint64_t v19 = (char *)v4 - (char *)v11 - 8;
    if (v19 >= 0x168)
    {
      unint64_t v22 = ((char *)(v4 - 1) - (char *)v11) & 0xFFFFFFFFFFFFFFF8LL;
      if (&v17[v12 - 8 - v22] > &v17[v12 - 8])
      {
        unint64_t v20 = v4;
      }

      else if ((const char **)((char *)v4 - v22 - 8) > v4 - 1)
      {
        unint64_t v20 = v4;
      }

      else if ((unint64_t)((char *)v4 - v17 - v12) >= 0x20)
      {
        uint64_t v23 = (v19 >> 3) + 1;
        uint64_t v24 = 8 * (v23 & 0x3FFFFFFFFFFFFFFCLL);
        unint64_t v20 = &v4[v24 / 0xFFFFFFFFFFFFFFF8LL];
        unint64_t v18 = (const char **)((char *)v18 - v24);
        unint64_t v25 = &v17[8 * v13 - 16];
        v26 = v4 - 2;
        uint64_t v27 = v23 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          __int128 v28 = *(_OWORD *)v26;
          *(v25 - 1) = *((_OWORD *)v26 - 1);
          *unint64_t v25 = v28;
          v25 -= 2;
          v26 -= 4;
          v27 -= 4LL;
        }

        while (v27);
        if (v23 == (v23 & 0x3FFFFFFFFFFFFFFCLL)) {
          goto LABEL_20;
        }
      }

      else
      {
        unint64_t v20 = v4;
      }
    }

    else
    {
      unint64_t v20 = v4;
    }

    do
    {
      uint8x8_t v21 = *--v20;
      *--unint64_t v18 = v21;
    }

    while (v20 != v11);
LABEL_20:
    __int128 v4 = *a2;
    goto LABEL_21;
  }

void sub_1000033A8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void mlc::xpc_auto_reply_t::~xpc_auto_reply_t(void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    xpc_release(v1);
  }
}

void std::vector<char const*>::__throw_length_error[abi:ne180100]()
{
}

void *std::__function::__value_func<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>::swap[abi:ne180100]( void *result, void *a2)
{
  if (a2 != result)
  {
    uint64_t v3 = result;
    __int128 v4 = (void *)result[3];
    size_t v5 = (void *)a2[3];
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

void sub_100003578(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

uint64_t _GLOBAL__sub_I_main_cpp()
{
  return __cxa_atexit( (void (*)(void *))std::unique_ptr<mlc::xpc_dispatch_t>::~unique_ptr[abi:ne180100],  &global_dispatch,  (void *)&_mh_execute_header);
}

void mlc::xpc_dispatch_t::handle_xpc_call(os_log_s **this@<X0>, xpc_object_t object@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = xpc_copy_description(object);
  xpc_type_t type = xpc_get_type(object);
  unint64_t v8 = *this;
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (v9) {
      mlc::xpc_dispatch_t::handle_xpc_call((uint64_t)v6, v8, v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_4;
  }

  if (v9) {
    mlc::xpc_dispatch_t::handle_xpc_call((uint64_t)v6, v8, v10, v11, v12, v13, v14, v15);
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(object, "fc");
  xpc_object_t array = xpc_dictionary_get_array(object, "args");
  if (!uint64 || (xpc_object_t v18 = array, xpc_get_type(array) != (xpc_type_t)&_xpc_type_array))
  {
LABEL_4:
    *(_BYTE *)a3 = 0;
    *(_BYTE *)(a3 + 16) = 0;
    if (!v6) {
      return;
    }
    goto LABEL_5;
  }

  *(void *)a3 = uint64;
  *(void *)(a3 + 8) = v18;
  *(_BYTE *)(a3 + 16) = 1;
  if (!v6) {
    return;
  }
LABEL_5:
  free(v6);
}

void sub_1000036A0(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t mlc::xpc_dispatch_t::handle(os_log_s **this, void *a2, _xpc_connection_s *a3)
{
  if (!v18) {
    return 0LL;
  }
  uint64_t v6 = v17[0];
  int8x8_t v7 = (int8x8_t)this[2];
  if (!*(void *)&v7) {
    goto LABEL_18;
  }
  uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    uint64_t v9 = v17[0];
    if (v17[0] >= *(void *)&v7) {
      uint64_t v9 = v17[0] % *(void *)&v7;
    }
  }

  else
  {
    uint64_t v9 = (*(void *)&v7 - 1LL) & v17[0];
  }

  uint64_t v10 = (void *)*((void *)this[1] + v9);
  if (!v10 || (uint64_t v11 = (void *)*v10) == 0LL)
  {
LABEL_18:
    uint64_t v13 = *this;
    uint64_t v14 = 0LL;
    if (!os_log_type_enabled(*this, OS_LOG_TYPE_DEFAULT)) {
      return v14;
    }
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unknown function: %llu", (uint8_t *)&buf, 0xCu);
    return 0LL;
  }

  while (1)
  {
    unint64_t v12 = v11[1];
    if (v17[0] == v12) {
      break;
    }
    if (v8.u32[0] > 1uLL)
    {
      if (v12 >= *(void *)&v7) {
        v12 %= *(void *)&v7;
      }
    }

    else
    {
      v12 &= *(void *)&v7 - 1LL;
    }

    if (v12 != v9) {
      goto LABEL_18;
    }
LABEL_11:
    uint64_t v11 = (void *)*v11;
    if (!v11) {
      goto LABEL_18;
    }
  }

  if (v11[2] != v17[0]) {
    goto LABEL_11;
  }
  *(void *)&__int128 buf = xpc_dictionary_create_reply(a2);
  *((void *)&buf + 1) = a3;
  uint64_t v19 = v17[1];
  uint64_t v16 = v11[6];
  if (!v16) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  uint64_t v14 = (*(uint64_t (**)(uint64_t, __int128 *, uint64_t *))(*(void *)v16 + 48LL))(v16, &buf, &v19);
  if ((void)buf) {
    xpc_release((xpc_object_t)buf);
  }
  return v14;
}

void sub_100003878( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void mlc::xpc_dispatch_t::handle_xpc_call( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Unhandled message: %s", a5, a6, a7, a8, 2u);
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