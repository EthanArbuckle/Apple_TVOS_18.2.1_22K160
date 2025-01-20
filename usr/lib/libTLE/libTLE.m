void TLE::andDeserializer(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, uint64_t a4@<X8>)
{
  __int128 v5;
  const char *v6;
  void *v7;
  int v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *exception;
  der_vm_context v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  if (*a3)
  {
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_DWORD *)a4 = 6;
    *(void *)(a4 + 8) = "$and operator disallowed for active fact";
    *(void *)(a4 + 16) = 40LL;
    return;
  }

  v23 = 0LL;
  v21 = 0u;
  v22 = 0u;
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v20.runtime = *(_OWORD *)a2;
  *(_OWORD *)&v20.lookup.index_count = v5;
  *(_OWORD *)&v20.sorted = *(_OWORD *)(a2 + 32);
  v20.var0.ccstate.der_end = *(char **)(a2 + 48);
  TLE::Executor::getDependentOpsFromDictionary(a1, &v20, (uint64_t)&v21);
  if ((_DWORD)v21)
  {
    *(_OWORD *)a4 = v21;
    v7 = (void *)*((void *)&v22 + 1);
    *(void *)(a4 + 16) = v22;
    *(void *)(a4 + 24) = 0LL;
    if (!v7) {
      return;
    }
  }

  else
  {
    v8 = v23;
    if ((_DWORD)v23 != 1)
    {
      v17 = operator new(0x30uLL);
      v17[2] = 0LL;
      v17[3] = 0LL;
      *v17 = off_189F82F60;
      v17[1] = 1LL;
      v17[4] = *((void *)&v22 + 1);
      *((_DWORD *)v17 + 10) = v8;
      *(void *)a4 = 0LL;
      *(void *)(a4 + 8) = 0LL;
      *(void *)(a4 + 16) = 0LL;
      *(void *)(a4 + 24) = v17;
      return;
    }

    v7 = (void *)*((void *)&v22 + 1);
    if (!*((void *)&v22 + 1)) {
      goto LABEL_26;
    }
    v9 = 8LL * v23;
    if (*((void *)&v22 + 1) + v9 < *((void *)&v22 + 1) || HIDWORD(v9)) {
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [b egin, end) is not a well-formed range",  v6);
    }
    if ((v9 & 0xFFFFFFF8) == 0) {
LABEL_26:
    }
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory ou tside of the bounds set originally",  v6);
    *(void *)a4 = 0LL;
    *(void *)(a4 + 8) = 0LL;
    v10 = (void *)*v7;
    *(void *)(a4 + 16) = 0LL;
    *(void *)(a4 + 24) = v10;
    if (v10)
    {
      v11 = v10[1];
      if (v11 < 1)
      {
        exception = __cxa_allocate_exception(8uLL);
        *exception = "Attempted resurection of an object";
        __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
      }

      v10[1] = v11 + 1;
    }
  }

  if ((_DWORD)v23)
  {
    v12 = 8LL * v23;
    v13 = (void **)v7;
    do
    {
      v14 = *v13;
      if (*v13)
      {
        v15 = v14[1];
        if (v15 <= 0)
        {
          v18 = __cxa_allocate_exception(8uLL);
          *v18 = "Over-release of an object";
          __cxa_throw(v18, MEMORY[0x1896146E0], 0LL);
        }

        v16 = v15 - 1;
        v14[1] = v16;
        if (!v16) {
          (*(void (**)(void *))(*v14 + 8LL))(v14);
        }
      }

      *v13++ = 0LL;
      v12 -= 8LL;
    }

    while (v12);
  }

  free(v7);
}

void sub_186DB9290( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void TLE::orDeserializer(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, uint64_t a4@<X8>)
{
  if (*a3)
  {
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_DWORD *)a4 = 6;
    *(void *)(a4 + 8) = "$or operator disallowed for active fact";
    *(void *)(a4 + 16) = 39LL;
    return;
  }

  uint64_t v23 = 0LL;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v20.runtime = *(_OWORD *)a2;
  *(_OWORD *)&v20.lookup.index_count = v5;
  *(_OWORD *)&v20.sorted = *(_OWORD *)(a2 + 32);
  v20.var0.ccstate.der_end = *(char **)(a2 + 48);
  TLE::Executor::getDependentOpsFromDictionary(a1, &v20, (uint64_t)&v21);
  if ((_DWORD)v21)
  {
    *(_OWORD *)a4 = v21;
    v7 = (void *)*((void *)&v22 + 1);
    *(void *)(a4 + 16) = v22;
    *(void *)(a4 + 24) = 0LL;
    if (!v7) {
      return;
    }
  }

  else
  {
    int v8 = v23;
    if ((_DWORD)v23 != 1)
    {
      v17 = operator new(0x30uLL);
      v17[2] = 0LL;
      v17[3] = 0LL;
      void *v17 = off_189F82FD0;
      v17[1] = 1LL;
      v17[4] = *((void *)&v22 + 1);
      *((_DWORD *)v17 + 10) = v8;
      *(void *)a4 = 0LL;
      *(void *)(a4 + 8) = 0LL;
      *(void *)(a4 + 16) = 0LL;
      *(void *)(a4 + 24) = v17;
      return;
    }

    v7 = (void *)*((void *)&v22 + 1);
    if (!*((void *)&v22 + 1)) {
      goto LABEL_26;
    }
    unint64_t v9 = 8LL * v23;
    if (*((void *)&v22 + 1) + v9 < *((void *)&v22 + 1) || HIDWORD(v9)) {
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [b egin, end) is not a well-formed range",  v6);
    }
    if ((v9 & 0xFFFFFFF8) == 0) {
LABEL_26:
    }
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory ou tside of the bounds set originally",  v6);
    *(void *)a4 = 0LL;
    *(void *)(a4 + 8) = 0LL;
    v10 = (void *)*v7;
    *(void *)(a4 + 16) = 0LL;
    *(void *)(a4 + 24) = v10;
    if (v10)
    {
      uint64_t v11 = v10[1];
      if (v11 < 1)
      {
        exception = __cxa_allocate_exception(8uLL);
        void *exception = "Attempted resurection of an object";
        __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
      }

      v10[1] = v11 + 1;
    }
  }

  if ((_DWORD)v23)
  {
    uint64_t v12 = 8LL * v23;
    v13 = (void **)v7;
    do
    {
      v14 = *v13;
      if (*v13)
      {
        uint64_t v15 = v14[1];
        if (v15 <= 0)
        {
          v18 = __cxa_allocate_exception(8uLL);
          void *v18 = "Over-release of an object";
          __cxa_throw(v18, MEMORY[0x1896146E0], 0LL);
        }

        uint64_t v16 = v15 - 1;
        v14[1] = v16;
        if (!v16) {
          (*(void (**)(void *))(*v14 + 8LL))(v14);
        }
      }

      *v13++ = 0LL;
      v12 -= 8LL;
    }

    while (v12);
  }

  free(v7);
}

void sub_186DB94B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void TLE::inDeserializer(__int128 *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  if (*(_DWORD *)a2 > 6u || ((1 << *(_DWORD *)a2) & 0x58) == 0)
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)a3 = 3;
    v10 = "Got an unexpected type (not an integer, string or data) when trying to generate an In operation.";
    uint64_t v11 = 96LL;
  }

  else
  {
    if (der_vm_CEType_from_context() == 2)
    {
      v7 = operator new(0x58uLL);
      __int128 v8 = *a1;
      __int128 v9 = a1[2];
      v7[3] = a1[1];
      v7[4] = v9;
      *((void *)v7 + 10) = *((void *)a1 + 6);
      *(void *)v7 = off_189F83018;
      *((void *)v7 + 1) = 1LL;
      v7[1] = *(_OWORD *)(a2 + 8);
      v7[2] = v8;
      *(void *)a3 = 0LL;
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      *(void *)(a3 + 24) = v7;
      return;
    }

    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)a3 = 3;
    v10 = "Got an unexpected type (not a sequence) when trying to read the array of matches.";
    uint64_t v11 = 81LL;
  }

  *(void *)(a3 + 8) = v10;
  *(void *)(a3 + 16) = v11;
}

double _ZN3TLE17intOpDeserializerINS_11BinaryIntOpIxXtlNS_3__0EEEEEEENS_5TupleINS_5ErrorEN7libkern20intrusive_shared_ptrINS_9OperationENS_14RefCountPolicyEEEEERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE@<D0>( uint64_t a1@<X2>, void *a2@<X8>)
{
  if (*(_DWORD *)a1 == 3 && der_vm_CEType_from_context() == 3)
  {
    uint64_t v4 = der_vm_integer_from_context();
    __int128 v5 = operator new(0x28uLL);
    *__int128 v5 = off_189F82BF0;
    v5[1] = 1LL;
    v5[4] = v4;
    __int128 v6 = *(_OWORD *)(a1 + 8);
    *((_OWORD *)v5 + 1) = v6;
    *a2 = 0LL;
    a2[1] = 0LL;
    a2[2] = 0LL;
    a2[3] = v5;
  }

  else
  {
    *(void *)&__int128 v6 = 0LL;
    *(_OWORD *)a2 = 0u;
    *((_OWORD *)a2 + 1) = 0u;
    *(_DWORD *)a2 = 3;
    a2[1] = "Got an unexpected type (not an integer) when trying to generate an integer operation.";
    a2[2] = 85LL;
  }

  return *(double *)&v6;
}

double _ZN3TLE17intOpDeserializerINS_11BinaryIntOpIxXtlNS_3__1EEEEEEENS_5TupleINS_5ErrorEN7libkern20intrusive_shared_ptrINS_9OperationENS_14RefCountPolicyEEEEERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE@<D0>( uint64_t a1@<X2>, void *a2@<X8>)
{
  if (*(_DWORD *)a1 == 3 && der_vm_CEType_from_context() == 3)
  {
    uint64_t v4 = der_vm_integer_from_context();
    __int128 v5 = operator new(0x28uLL);
    *__int128 v5 = off_189F82C38;
    v5[1] = 1LL;
    v5[4] = v4;
    __int128 v6 = *(_OWORD *)(a1 + 8);
    *((_OWORD *)v5 + 1) = v6;
    *a2 = 0LL;
    a2[1] = 0LL;
    a2[2] = 0LL;
    a2[3] = v5;
  }

  else
  {
    *(void *)&__int128 v6 = 0LL;
    *(_OWORD *)a2 = 0u;
    *((_OWORD *)a2 + 1) = 0u;
    *(_DWORD *)a2 = 3;
    a2[1] = "Got an unexpected type (not an integer) when trying to generate an integer operation.";
    a2[2] = 85LL;
  }

  return *(double *)&v6;
}

double _ZN3TLE17intOpDeserializerINS_11BinaryIntOpIxXtlNS_3__2EEEEEEENS_5TupleINS_5ErrorEN7libkern20intrusive_shared_ptrINS_9OperationENS_14RefCountPolicyEEEEERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE@<D0>( uint64_t a1@<X2>, void *a2@<X8>)
{
  if (*(_DWORD *)a1 == 3 && der_vm_CEType_from_context() == 3)
  {
    uint64_t v4 = der_vm_integer_from_context();
    __int128 v5 = operator new(0x28uLL);
    *__int128 v5 = off_189F82C80;
    v5[1] = 1LL;
    v5[4] = v4;
    __int128 v6 = *(_OWORD *)(a1 + 8);
    *((_OWORD *)v5 + 1) = v6;
    *a2 = 0LL;
    a2[1] = 0LL;
    a2[2] = 0LL;
    a2[3] = v5;
  }

  else
  {
    *(void *)&__int128 v6 = 0LL;
    *(_OWORD *)a2 = 0u;
    *((_OWORD *)a2 + 1) = 0u;
    *(_DWORD *)a2 = 3;
    a2[1] = "Got an unexpected type (not an integer) when trying to generate an integer operation.";
    a2[2] = 85LL;
  }

  return *(double *)&v6;
}

double _ZN3TLE17intOpDeserializerINS_11BinaryIntOpIxXtlNS_3__3EEEEEEENS_5TupleINS_5ErrorEN7libkern20intrusive_shared_ptrINS_9OperationENS_14RefCountPolicyEEEEERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE@<D0>( uint64_t a1@<X2>, void *a2@<X8>)
{
  if (*(_DWORD *)a1 == 3 && der_vm_CEType_from_context() == 3)
  {
    uint64_t v4 = der_vm_integer_from_context();
    __int128 v5 = operator new(0x28uLL);
    *__int128 v5 = off_189F82CC8;
    v5[1] = 1LL;
    v5[4] = v4;
    __int128 v6 = *(_OWORD *)(a1 + 8);
    *((_OWORD *)v5 + 1) = v6;
    *a2 = 0LL;
    a2[1] = 0LL;
    a2[2] = 0LL;
    a2[3] = v5;
  }

  else
  {
    *(void *)&__int128 v6 = 0LL;
    *(_OWORD *)a2 = 0u;
    *((_OWORD *)a2 + 1) = 0u;
    *(_DWORD *)a2 = 3;
    a2[1] = "Got an unexpected type (not an integer) when trying to generate an integer operation.";
    a2[2] = 85LL;
  }

  return *(double *)&v6;
}

double _ZN3TLE17intOpDeserializerINS_11BinaryIntOpIxXtlNS_3__4EEEEEEENS_5TupleINS_5ErrorEN7libkern20intrusive_shared_ptrINS_9OperationENS_14RefCountPolicyEEEEERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE@<D0>( uint64_t a1@<X2>, void *a2@<X8>)
{
  if (*(_DWORD *)a1 == 3 && der_vm_CEType_from_context() == 3)
  {
    uint64_t v4 = der_vm_integer_from_context();
    __int128 v5 = operator new(0x28uLL);
    *__int128 v5 = off_189F82D10;
    v5[1] = 1LL;
    v5[4] = v4;
    __int128 v6 = *(_OWORD *)(a1 + 8);
    *((_OWORD *)v5 + 1) = v6;
    *a2 = 0LL;
    a2[1] = 0LL;
    a2[2] = 0LL;
    a2[3] = v5;
  }

  else
  {
    *(void *)&__int128 v6 = 0LL;
    *(_OWORD *)a2 = 0u;
    *((_OWORD *)a2 + 1) = 0u;
    *(_DWORD *)a2 = 3;
    a2[1] = "Got an unexpected type (not an integer) when trying to generate an integer operation.";
    a2[2] = 85LL;
  }

  return *(double *)&v6;
}

void TLE::optionalOpDeserializer(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v19 = 0LL;
  __int128 v17 = 0u;
  *(_OWORD *)v18 = 0u;
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v16.runtime = *(_OWORD *)a2;
  *(_OWORD *)&v16.lookup.index_count = v4;
  *(_OWORD *)&v16.sorted = *(_OWORD *)(a2 + 32);
  v16.var0.ccstate.der_end = *(char **)(a2 + 48);
  TLE::Executor::getDependentOpsFromDictionary(a1, &v16, (uint64_t)&v17);
  if ((_DWORD)v17)
  {
    *(_OWORD *)a3 = v17;
    *(void **)(a3 + 16) = v18[0];
    *(void *)(a3 + 24) = 0LL;
    __int128 v6 = (void **)v18[1];
    if (!v18[1]) {
      return;
    }
    goto LABEL_12;
  }

  if ((_DWORD)v19 != 1)
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)a3 = 6;
    *(void *)(a3 + 8) = "$optional only supports a single dependent operation";
    *(void *)(a3 + 16) = 52LL;
    __int128 v6 = (void **)v18[1];
    if (!v18[1]) {
      return;
    }
    goto LABEL_12;
  }

  v7 = v18[1];
  if (!v18[1]) {
    goto LABEL_23;
  }
  unint64_t v8 = 8LL * v19;
  if ((char *)v18[1] + v8 < v18[1] || HIDWORD(v8)) {
    os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [beg in, end) is not a well-formed range",  v5);
  }
  if ((v8 & 0xFFFFFFF8) == 0) {
LABEL_23:
  }
    os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outs ide of the bounds set originally",  v5);
  __int128 v9 = operator new(0x30uLL);
  v9[2] = 0LL;
  v9[3] = 0LL;
  *__int128 v9 = off_189F830A8;
  v9[1] = 1LL;
  v9[4] = *v7;
  void *v7 = 0LL;
  *((_BYTE *)v9 + 40) = 0;
  *(void *)a3 = 0LL;
  *(void *)(a3 + 8) = 0LL;
  *(void *)(a3 + 16) = 0LL;
  *(void *)(a3 + 24) = v9;
  __int128 v6 = (void **)v18[1];
  if (v18[1])
  {
LABEL_12:
    if ((_DWORD)v19)
    {
      uint64_t v10 = 8LL * v19;
      uint64_t v11 = v6;
      do
      {
        uint64_t v12 = *v11;
        if (*v11)
        {
          uint64_t v13 = v12[1];
          if (v13 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            void *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
          }

          uint64_t v14 = v13 - 1;
          v12[1] = v14;
          if (!v14) {
            (*(void (**)(void *))(*v12 + 8LL))(v12);
          }
        }

        *v11++ = 0LL;
        v10 -= 8LL;
      }

      while (v10);
    }

    free(v6);
  }
}

void sub_186DB9C0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void TLE::queryOpDeserializer(__int128 *a1@<X1>, uint64_t a2@<X2>, void *a3@<X8>)
{
  if (*(_DWORD *)a2 == 1)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2000000000LL;
    char v12 = 1;
    der_vm_iterate_b();
    if (*((_BYTE *)v10 + 24))
    {
      __int128 v6 = operator new(0x58uLL);
      __int128 v7 = *a1;
      __int128 v8 = a1[2];
      v6[3] = a1[1];
      v6[4] = v8;
      *((void *)v6 + 10) = *((void *)a1 + 6);
      *(void *)__int128 v6 = off_189F83060;
      *((void *)v6 + 1) = 1LL;
      v6[1] = *(_OWORD *)(a2 + 8);
      v6[2] = v7;
      *a3 = 0LL;
      a3[1] = 0LL;
      a3[2] = 0LL;
      a3[3] = v6;
    }

    else
    {
      *(_OWORD *)a3 = 0u;
      *((_OWORD *)a3 + 1) = 0u;
      *(_DWORD *)a3 = 6;
      a3[1] = "$query deserialization failed since it has an invalid query definition";
      a3[2] = 70LL;
    }

    _Block_object_dispose(&v9, 8);
  }

  else
  {
    *(_OWORD *)a3 = 0u;
    *((_OWORD *)a3 + 1) = 0u;
    *(_DWORD *)a3 = 3;
    a3[1] = "Got an unexpected type (not a dictionary) when trying to generate a query operation.";
    a3[2] = 84LL;
  }

void sub_186DB9D5C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void TLE::andArrayOpDeserializer(const der_vm_context *a1@<X1>, _DWORD *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v20 = 0LL;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  TLE::opArrayOpDeserializer(a1, a2, (uint64_t)&v18);
  if ((_DWORD)v18)
  {
    *(_OWORD *)a3 = v18;
    __int128 v5 = (void *)*((void *)&v19 + 1);
    *(void *)(a3 + 16) = v19;
    *(void *)(a3 + 24) = 0LL;
    if (!v5) {
      return;
    }
  }

  else
  {
    int v6 = v20;
    if ((_DWORD)v20 != 1)
    {
      uint64_t v15 = operator new(0x30uLL);
      v15[2] = 0LL;
      v15[3] = 0LL;
      *uint64_t v15 = off_189F82F60;
      v15[1] = 1LL;
      v15[4] = *((void *)&v19 + 1);
      *((_DWORD *)v15 + 10) = v6;
      *(void *)a3 = 0LL;
      *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      *(void *)(a3 + 24) = v15;
      return;
    }

    __int128 v5 = (void *)*((void *)&v19 + 1);
    if (!*((void *)&v19 + 1)) {
      goto LABEL_24;
    }
    unint64_t v7 = 8LL * v20;
    if (*((void *)&v19 + 1) + v7 < *((void *)&v19 + 1) || HIDWORD(v7)) {
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [b egin, end) is not a well-formed range",  v4);
    }
    if ((v7 & 0xFFFFFFF8) == 0) {
LABEL_24:
    }
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory ou tside of the bounds set originally",  v4);
    *(void *)a3 = 0LL;
    *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
    __int128 v8 = (void *)*v5;
    *(void *)(a3 + 16) = 0LL;
    *(void *)(a3 + 24) = v8;
    if (v8)
    {
      uint64_t v9 = v8[1];
      if (v9 < 1)
      {
        exception = __cxa_allocate_exception(8uLL);
        void *exception = "Attempted resurection of an object";
        __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
      }

      v8[1] = v9 + 1;
    }
  }

  if ((_DWORD)v20)
  {
    uint64_t v10 = 8LL * v20;
    uint64_t v11 = (void **)v5;
    do
    {
      char v12 = *v11;
      if (*v11)
      {
        uint64_t v13 = v12[1];
        if (v13 <= 0)
        {
          der_vm_context v16 = __cxa_allocate_exception(8uLL);
          *der_vm_context v16 = "Over-release of an object";
          __cxa_throw(v16, MEMORY[0x1896146E0], 0LL);
        }

        uint64_t v14 = v13 - 1;
        v12[1] = v14;
        if (!v14) {
          (*(void (**)(void *))(*v12 + 8LL))(v12);
        }
      }

      *v11++ = 0LL;
      v10 -= 8LL;
    }

    while (v10);
  }

  free(v5);
}

void sub_186DB9F28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void TLE::orArrayOpDeserializer(uint64_t a1@<X8>)
{
  uint64_t v18 = 0LL;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  TLE::opArrayOpDeserializer(&v16);
  if ((_DWORD)v16)
  {
    *(_OWORD *)a1 = v16;
    v3 = (void *)*((void *)&v17 + 1);
    *(void *)(a1 + 16) = v17;
    *(void *)(a1 + 24) = 0LL;
    if (!v3) {
      return;
    }
  }

  else
  {
    int v4 = v18;
    if ((_DWORD)v18 != 1)
    {
      uint64_t v13 = operator new(0x30uLL);
      v13[2] = 0LL;
      v13[3] = 0LL;
      *uint64_t v13 = off_189F82FD0;
      v13[1] = 1LL;
      v13[4] = *((void *)&v17 + 1);
      *((_DWORD *)v13 + 10) = v4;
      *(void *)a1 = 0LL;
      *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
      *(void *)(a1 + 16) = 0LL;
      *(void *)(a1 + 24) = v13;
      return;
    }

    v3 = (void *)*((void *)&v17 + 1);
    if (!*((void *)&v17 + 1)) {
      goto LABEL_24;
    }
    unint64_t v5 = 8LL * v18;
    if (*((void *)&v17 + 1) + v5 < *((void *)&v17 + 1) || HIDWORD(v5)) {
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [b egin, end) is not a well-formed range",  v2);
    }
    if ((v5 & 0xFFFFFFF8) == 0) {
LABEL_24:
    }
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory ou tside of the bounds set originally",  v2);
    *(void *)a1 = 0LL;
    *(void *)(a1 + _Block_object_dispose(va, 8) = 0LL;
    int v6 = (void *)*v3;
    *(void *)(a1 + 16) = 0LL;
    *(void *)(a1 + 24) = v6;
    if (v6)
    {
      uint64_t v7 = v6[1];
      if (v7 < 1)
      {
        exception = __cxa_allocate_exception(8uLL);
        void *exception = "Attempted resurection of an object";
        __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
      }

      v6[1] = v7 + 1;
    }
  }

  if ((_DWORD)v18)
  {
    uint64_t v8 = 8LL * v18;
    uint64_t v9 = (void **)v3;
    do
    {
      uint64_t v10 = *v9;
      if (*v9)
      {
        uint64_t v11 = v10[1];
        if (v11 <= 0)
        {
          uint64_t v14 = __cxa_allocate_exception(8uLL);
          void *v14 = "Over-release of an object";
          __cxa_throw(v14, MEMORY[0x1896146E0], 0LL);
        }

        uint64_t v12 = v11 - 1;
        v10[1] = v12;
        if (!v12) {
          (*(void (**)(void *))(*v10 + 8LL))(v10);
        }
      }

      *v9++ = 0LL;
      v8 -= 8LL;
    }

    while (v8);
  }

  free(v3);
}

void sub_186DBA0FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void TLE::opArrayOpDeserializer(const der_vm_context *a1@<X1>, _DWORD *a2@<X2>, uint64_t a3@<X8>)
{
  if (*a2)
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)(a3 + 32) = 0;
    *(_DWORD *)a3 = 6;
    int v4 = "factless operator disallowed for active fact";
    uint64_t v5 = 44LL;
LABEL_11:
    *(void *)(a3 + _Block_object_dispose(va, 8) = v4;
    *(void *)(a3 + 16) = v5;
    return;
  }

  __int128 v7 = *(_OWORD *)&a1->lookup.index_count;
  __int128 v31 = *(_OWORD *)&a1->runtime;
  __int128 v32 = v7;
  __int128 v33 = *(_OWORD *)&a1->sorted;
  der_end = a1->var0.ccstate.der_end;
  if (der_vm_CEType_from_context() != 2)
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)(a3 + 32) = 0;
    *(_DWORD *)a3 = 3;
    int v4 = "Got an unexpected type (not a sequence) when trying to read the array of matches.";
    uint64_t v5 = 81LL;
    goto LABEL_11;
  }

  unint64_t v8 = count_ce_elements(a1);
  if (!v8)
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)(a3 + 32) = 0;
    *(_DWORD *)a3 = 4;
    int v4 = "The array of dependent operations is empty.";
    uint64_t v5 = 43LL;
    goto LABEL_11;
  }

  unint64_t v9 = v8;
  uint64_t v30 = 0LL;
  if (HIDWORD(v8))
  {
    uint64_t v10 = 0LL;
    LODWORD(v9) = 0;
  }

  else
  {
    uint64_t v10 = malloc(8 * v8);
    bzero(v10, 8 * v9);
  }

  v29 = v10;
  LODWORD(v30) = v9;
  uint64_t v21 = 0LL;
  __int128 v22 = &v21;
  uint64_t v23 = 0x4002000000LL;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  uint64_t v26 = 0LL;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2000000000LL;
  v20[3] = 0LL;
  der_vm_iterate_b();
  uint64_t v11 = v22 + 5;
  if (*((_DWORD *)v22 + 10))
  {
    *(_DWORD *)(a3 + 32) = 0;
    *(void *)(a3 + 24) = 0LL;
    __int128 v12 = *(_OWORD *)v11;
    *(void *)(a3 + 16) = v11[2];
    *(_OWORD *)a3 = v12;
  }

  else
  {
    TLE::Tuple<TLE::Error,libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>>::Tuple( a3,  (uint64_t)&v29);
  }

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v21, 8);
  uint64_t v13 = v29;
  if (v29)
  {
    if ((_DWORD)v30)
    {
      uint64_t v14 = 8LL * v30;
      uint64_t v15 = (void **)v29;
      do
      {
        __int128 v16 = *v15;
        if (*v15)
        {
          uint64_t v17 = v16[1];
          if (v17 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            void *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
          }

          uint64_t v18 = v17 - 1;
          v16[1] = v18;
          if (!v18) {
            (*(void (**)(void *))(*v16 + 8LL))(v16);
          }
        }

        *v15++ = 0LL;
        v14 -= 8LL;
      }

      while (v14);
    }

    free(v13);
  }

void sub_186DBA3BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation(v11 - 144);
  _Unwind_Resume(a1);
}

void os_detail::panic_trapping_policy::trap( os_detail::panic_trapping_policy *this, const char *a2)
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = this;
  __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
}

void __clang_call_terminate(void *a1)
{
}

uint64_t TLE::Tuple<TLE::Error,libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>>::~Tuple( uint64_t a1)
{
  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    uint64_t v3 = *(unsigned int *)(a1 + 32);
    if ((_DWORD)v3)
    {
      uint64_t v4 = 8 * v3;
      uint64_t v5 = *(void ***)(a1 + 24);
      do
      {
        int v6 = *v5;
        if (*v5)
        {
          uint64_t v7 = v6[1];
          if (v7 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            void *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
          }

          uint64_t v8 = v7 - 1;
          v6[1] = v8;
          if (!v8) {
            (*(void (**)(void *))(*v6 + 8LL))(v6);
          }
        }

        *v5++ = 0LL;
        v4 -= 8LL;
      }

      while (v4);
    }

    free(v2);
  }

  return a1;
}

uint64_t count_ce_elements(const der_vm_context *a1)
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2000000000LL;
  uint64_t v6 = 0LL;
  der_vm_iterate_b();
  uint64_t v1 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_186DBA564( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

__n128 __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

void *___ZN3TLE21opArrayOpDeserializerERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE_block_invoke( uint64_t a1, const der_vm_context *a2)
{
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  TLE::opTupleDeserializer(*(void *)(a1 + 48), a2 + 1, *(_DWORD **)(a1 + 56), (uint64_t)&v37);
  if ((_DWORD)v37)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
    *(_OWORD *)(v4 + 40) = v37;
    __n128 result = (void *)*((void *)&v38 + 1);
    *(void *)(v4 + 56) = v38;
    if (result)
    {
      uint64_t v6 = result[1];
      if (v6 <= 0)
      {
        exception = __cxa_allocate_exception(8uLL);
        void *exception = "Over-release of an object";
        __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
      }

      uint64_t v7 = v6 - 1;
      result[1] = v7;
      if (!v7) {
        (*(void (**)(void *))(*result + 8LL))(result);
      }
      return 0LL;
    }

    return result;
  }

  uint64_t v8 = *(unint64_t **)(a1 + 64);
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  unint64_t v10 = *v8;
  if (*v8)
  {
    unint64_t v11 = v10 + 8LL * *((unsigned int *)v8 + 2);
    BOOL v12 = v11 >= v10;
    unint64_t v13 = v11 - v10;
    if (!v12 || HIDWORD(v13)) {
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [b egin, end) is not a well-formed range",  v3);
    }
  }

  else
  {
    LODWORD(v13) = 0;
  }

  if (v9 >= 0) {
    unint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  }
  else {
    unint64_t v14 = -v9;
  }
  unint64_t v15 = ((unint64_t)v9 >> 63) + 0x7FFFFFFFFFFFFFFFLL;
  if (v9 >= 0) {
    uint64_t v16 = 8 * v14;
  }
  else {
    uint64_t v16 = -8LL * v14;
  }
  if (v14 >> 61) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = 8 * v14 > v15;
  }
  if (v17)
  {
    uint64_t v18 = "bounded_ptr<T>::operator+=(n): Calculating the number of bytes to add to the offset (n * sizeof(T)) would trigger an overflow";
    goto LABEL_48;
  }

  if (v16 != (int)v16)
  {
    uint64_t v18 = "bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the current pos"
          "ition would overflow.";
    goto LABEL_48;
  }

  uint64_t v18 = "bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally";
  if ((v16 & 0x80000000) != 0
    || (int)v16 + 8 > v13
    || ((v19 = (int)v16, uint64_t v20 = (uint64_t)(int)v16 >> 63, v21 = (void **)(v10 + v19), !__CFADD__(v10, v19))
      ? (uint64_t v22 = v20)
      : (uint64_t v22 = v20 + 1),
        (uint64_t v23 = v22 << 63 >> 63,
         uint64_t v18 = "This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.",
         v23 ^ v22)
     || v23 < 0))
  {
LABEL_48:
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)v18, v3);
  }

  v24 = (void *)*((void *)&v38 + 1);
  v25 = *v21;
  if (*v21)
  {
    uint64_t v26 = v25[1];
    if (v26 <= 0)
    {
      v36 = __cxa_allocate_exception(8uLL);
      void *v36 = "Over-release of an object";
      __cxa_throw(v36, MEMORY[0x1896146E0], 0LL);
    }

    uint64_t v27 = v26 - 1;
    v25[1] = v27;
    if (!v27) {
      (*(void (**)(void *))(*v25 + 8LL))(v25);
    }
  }

  *uint64_t v21 = v24;
  uint64_t v28 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v29 = *(void *)(v28 + 24);
  uint64_t v30 = v29 + 1;
  uint64_t v31 = v29 == -1;
  BOOL v33 = v31 << 63 >> 63 != v31 || v31 << 63 >> 63 == -1;
  if (v33)
  {
    uint64_t v34 = *(void *)(*(void *)(a1 + 32) + 8LL);
    *(_DWORD *)(v34 + 40) = 10;
    *(void *)(v34 + 4_Block_object_dispose(va, 8) = "Array contains too many elements";
    *(void *)(v34 + 56) = 32LL;
  }

  else
  {
    *(void *)(v28 + 24) = v30;
  }

  return (void *)!v33;
}

void sub_186DBA7E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation( uint64_t a1)
{
  v2 = *(void ***)a1;
  if (*(void *)a1)
  {
    uint64_t v3 = *(unsigned int *)(a1 + 8);
    if ((_DWORD)v3)
    {
      uint64_t v4 = 8 * v3;
      uint64_t v5 = *(void ***)a1;
      do
      {
        uint64_t v6 = *v5;
        if (*v5)
        {
          uint64_t v7 = v6[1];
          if (v7 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            void *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
          }

          uint64_t v8 = v7 - 1;
          v6[1] = v8;
          if (!v8) {
            (*(void (**)(void *))(*v6 + 8LL))(v6);
          }
        }

        *v5++ = 0LL;
        v4 -= 8LL;
      }

      while (v4);
    }

    free(v2);
  }

  return a1;
}

uint64_t TLE::Tuple<TLE::Error,libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>>::Tuple( uint64_t result, uint64_t a2)
{
  *(_DWORD *)(result + 32) = 0;
  *(_OWORD *)__n128 result = 0u;
  *(_OWORD *)(result + 16) = 0u;
  if (result + 24 != a2)
  {
    *(void *)(result + 24) = *(void *)a2;
    *(_DWORD *)(result + 32) = *(_DWORD *)(a2 + 8);
    *(void *)a2 = 0LL;
    *(_DWORD *)(a2 + _Block_object_dispose(va, 8) = 0;
  }

  return result;
}

void TLE::opTupleDeserializer( uint64_t a1@<X0>, const der_vm_context *a2@<X1>, _DWORD *a3@<X2>, uint64_t a4@<X8>)
{
  if (*a3)
  {
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_DWORD *)a4 = 6;
    uint64_t v5 = "factless operator disallowed for active fact";
    uint64_t v6 = 44LL;
  }

  else
  {
    __int128 v10 = *(_OWORD *)&a2->lookup.index_count;
    __int128 v16 = *(_OWORD *)&a2->runtime;
    __int128 v17 = v10;
    __int128 v18 = *(_OWORD *)&a2->sorted;
    der_end = a2->var0.ccstate.der_end;
    if (der_vm_CEType_from_context() == 2)
    {
      if (count_ce_elements(a2) == 2)
      {
        uint64_t v15 = 0LL;
        __int128 v13 = 0u;
        __int128 v14 = 0u;
        TLE::keyForContext(&v13);
        if ((_DWORD)v13)
        {
          *(_OWORD *)a4 = v13;
          *(void *)(a4 + 16) = v14;
          *(void *)(a4 + 24) = 0LL;
          return;
        }

        uint64_t v12 = 0LL;
        memset(v11, 0, sizeof(v11));
        der_vm_execute_nocopy();
        if (der_vm_CEType_from_context() == 1)
        {
          if (!CEBuffer_cmp())
          {
            TLE::andDeserializer(a1, (uint64_t)v11, a3, a4);
            return;
          }

          if (!CEBuffer_cmp())
          {
            TLE::orDeserializer(a1, (uint64_t)v11, a3, a4);
            return;
          }

          if (!CEBuffer_cmp())
          {
            TLE::optionalOpDeserializer(a1, (uint64_t)v11, a4);
            return;
          }
        }

        else
        {
          if (der_vm_CEType_from_context() != 2)
          {
            *(_OWORD *)a4 = 0u;
            *(_OWORD *)(a4 + 16) = 0u;
            *(_DWORD *)a4 = 3;
            uint64_t v5 = "Unexpected type in Array tuple";
            uint64_t v6 = 30LL;
            goto LABEL_9;
          }

          if (!CEBuffer_cmp())
          {
            TLE::andArrayOpDeserializer(a1, v11, a3);
            return;
          }

          if (!CEBuffer_cmp())
          {
            TLE::orArrayOpDeserializer(a4);
            return;
          }
        }

        *(_OWORD *)a4 = 0u;
        *(_OWORD *)(a4 + 16) = 0u;
        *(_DWORD *)a4 = 9;
        uint64_t v5 = "Unexpected operator in Array tuple";
        uint64_t v6 = 34LL;
      }

      else
      {
        *(_OWORD *)a4 = 0u;
        *(_OWORD *)(a4 + 16) = 0u;
        *(_DWORD *)a4 = 6;
        uint64_t v5 = "Incorrect number of elements in operator Array tuple";
        uint64_t v6 = 52LL;
      }
    }

    else
    {
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
      *(_DWORD *)a4 = 6;
      uint64_t v5 = "Non array element found in operator Array";
      uint64_t v6 = 41LL;
    }
  }

LABEL_9:
  *(void *)(a4 + _Block_object_dispose(va, 8) = v5;
  *(void *)(a4 + 16) = v6;
}

uint64_t TLE::Tuple<TLE::Error,libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>::~Tuple( uint64_t a1)
{
  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    uint64_t v3 = v2[1];
    if (v3 <= 0)
    {
      exception = __cxa_allocate_exception(8uLL);
      void *exception = "Over-release of an object";
      __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
    }

    uint64_t v4 = v3 - 1;
    v2[1] = v4;
    if (!v4) {
      (*(void (**)(void *))(*v2 + 8LL))(v2);
    }
  }

  *(void *)(a1 + 24) = 0LL;
  return a1;
}

double TLE::keyForContext@<D0>(void *a1@<X8>)
{
  if (der_vm_CEType_from_context() == 4)
  {
    uint64_t v4 = der_vm_string_from_context();
    *a1 = 0LL;
    a1[1] = 0LL;
    a1[2] = 0LL;
    a1[3] = v4;
    a1[4] = v6;
  }

  else
  {
    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *((_OWORD *)a1 + 1) = 0u;
    a1[4] = 0LL;
    *(_DWORD *)a1 = 3;
    a1[1] = "Expected operator string in Array tuple";
    a1[2] = 39LL;
  }

  return result;
}

uint64_t ___ZL17count_ce_elementsRK14der_vm_context_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v2 = *(void *)(v1 + 24);
  BOOL v3 = __CFADD__(v2, 1LL);
  uint64_t v4 = v2 + 1;
  uint64_t v5 = v3;
  BOOL v6 = v5 << 63 >> 63 != v5 || v5 << 63 >> 63 == -1;
  int v7 = v6;
  if (!v6) {
    *(void *)(v1 + 24) = v4;
  }
  return v7 ^ 1u;
}

uint64_t ___ZN3TLE19queryOpDeserializerERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE_block_invoke( uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 116) == 2 && count_ce_elements((const der_vm_context *)(a2 + 56)) == 2) {
    return 1LL;
  }
  uint64_t result = 0LL;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  return result;
}

void TLE::Executor::getDependentOpsFromDictionary( uint64_t a1@<X0>, const der_vm_context *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + _Block_object_dispose(va, 8) = v5 + 1;
  if ((unint64_t)(v5 + 1) >= 6)
  {
    *(void *)(a1 + _Block_object_dispose(va, 8) = v5;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)(a3 + 32) = 0;
    *(_DWORD *)a3 = 8;
    BOOL v6 = "Constraint is too deeply nested. Failing to avoid recursion overflow";
    uint64_t v7 = 68LL;
LABEL_11:
    *(void *)(a3 + _Block_object_dispose(va, 8) = v6;
    *(void *)(a3 + 16) = v7;
    return;
  }

  __int128 v9 = *(_OWORD *)&a2->lookup.index_count;
  __int128 v34 = *(_OWORD *)&a2->runtime;
  __int128 v35 = v9;
  __int128 v36 = *(_OWORD *)&a2->sorted;
  der_end = a2->var0.ccstate.der_end;
  if (der_vm_CEType_from_context() != 1)
  {
    --*(void *)(a1 + 8);
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)(a3 + 32) = 0;
    *(_DWORD *)a3 = 3;
    BOOL v6 = "Got an unexpected type (not a dictionary) when trying to generate dependent operations for evaluation.";
    uint64_t v7 = 102LL;
    goto LABEL_11;
  }

  unint64_t v10 = count_ce_elements(a2);
  if (!v10)
  {
    --*(void *)(a1 + 8);
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)(a3 + 32) = 0;
    *(_DWORD *)a3 = 4;
    BOOL v6 = "The dictionary of dependent operations is empty.";
    uint64_t v7 = 48LL;
    goto LABEL_11;
  }

  unint64_t v11 = v10;
  uint64_t v33 = 0LL;
  if (HIDWORD(v10))
  {
    uint64_t v12 = 0LL;
    LODWORD(v11) = 0;
  }

  else
  {
    uint64_t v12 = malloc(8 * v10);
    bzero(v12, 8 * v11);
  }

  __int128 v32 = v12;
  LODWORD(v33) = v11;
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x4002000000LL;
  uint64_t v27 = __Block_byref_object_copy_;
  uint64_t v28 = __Block_byref_object_dispose_;
  uint64_t v30 = 0LL;
  uint64_t v31 = 0LL;
  uint64_t v29 = 0LL;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2000000000LL;
  v23[3] = 0LL;
  der_vm_iterate_b();
  __int128 v13 = v25 + 5;
  int v14 = *((_DWORD *)v25 + 10);
  --*(void *)(a1 + 8);
  if (v14)
  {
    *(_DWORD *)(a3 + 32) = 0;
    *(void *)(a3 + 24) = 0LL;
    __int128 v15 = *(_OWORD *)v13;
    *(void *)(a3 + 16) = v13[2];
    *(_OWORD *)a3 = v15;
  }

  else
  {
    TLE::Tuple<TLE::Error,libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>>::Tuple( a3,  (uint64_t)&v32);
  }

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v24, 8);
  __int128 v16 = v32;
  if (v32)
  {
    if ((_DWORD)v33)
    {
      uint64_t v17 = 8LL * v33;
      __int128 v18 = (void **)v32;
      do
      {
        uint64_t v19 = *v18;
        if (*v18)
        {
          uint64_t v20 = v19[1];
          if (v20 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            void *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
          }

          uint64_t v21 = v20 - 1;
          v19[1] = v21;
          if (!v21) {
            (*(void (**)(void *))(*v19 + 8LL))(v19);
          }
        }

        *v18++ = 0LL;
        v17 -= 8LL;
      }

      while (v17);
    }

    free(v16);
  }

void sub_186DBB0BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v15 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation(v13 - 160);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3TLE8Executor29getDependentOpsFromDictionaryE14der_vm_contextRKNS_14FactDefinitionEbmPK8CEBuffer_block_invoke( uint64_t a1, uint64_t a2)
{
  uint64_t v152 = *MEMORY[0x1895F89C0];
  v141 = *(void **)(a1 + 48);
  memset(v150, 0, 40);
  BOOL v3 = (__int128 *)(a2 + 56);
  TLE::keyForContext(v150);
  if (LODWORD(v150[0]))
  {
    uint64_t result = 0LL;
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
    *(_OWORD *)(v5 + 40) = v150[0];
    *(void *)(v5 + 56) = *(void *)&v150[1];
    return result;
  }

  uint64_t v149 = 0LL;
  memset(v148, 0, sizeof(v148));
  __int128 v6 = v3[1];
  __int128 v144 = *v3;
  __int128 v145 = v6;
  __int128 v146 = v3[2];
  uint64_t v147 = *((void *)v3 + 6);
  der_vm_execute_nocopy();
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8)
  {
    __int128 v9 = (_BYTE *)*((void *)&v150[1] + 1);
    uint64_t v10 = *(void *)(a1 + 64) + 8LL;
    while (1)
    {
      uint64_t result = CEBuffer_cmp();
      if (!(_DWORD)result) {
        break;
      }
      v10 += 16LL;
      if (!--v8) {
        goto LABEL_9;
      }
    }

    uint64_t v28 = *(void *)(*(void *)(a1 + 32) + 8LL);
    *(_DWORD *)(v28 + 40) = 6;
    uint64_t v29 = "Unexpected key for parsing context";
    uint64_t v30 = 34LL;
    goto LABEL_48;
  }

  __int128 v9 = (_BYTE *)*((void *)&v150[1] + 1);
LABEL_9:
  if (*v9 != 36)
  {
    if (!*(_BYTE *)(a1 + 88))
    {
      uint64_t result = 0LL;
      uint64_t v28 = *(void *)(*(void *)(a1 + 32) + 8LL);
      *(_DWORD *)(v28 + 40) = 6;
      uint64_t v29 = "Fact not allowed in context";
      uint64_t v30 = 27LL;
LABEL_48:
      *(void *)(v28 + 4_Block_object_dispose(va, 8) = v29;
      *(void *)(v28 + 56) = v30;
      return result;
    }

    uint64_t v24 = *(void *)&v150[2];
    if (((*(uint64_t (**)(void, _BYTE *, void))(*(void *)*v141 + 32LL))(*v141, v9, *(void *)&v150[2]) & 1) == 0)
    {
      *(_OWORD *)((char *)v151 + 4) = *(_OWORD *)((char *)&v150[1] + 8);
      __int128 v36 = (char *)operator new(0x38uLL);
      *((_DWORD *)v36 + _Block_object_dispose(va, 8) = 5;
      *(_OWORD *)(v36 + 36) = v151[0];
      *((_DWORD *)v36 + 13) = v151[1];
      *((void *)v36 + 2) = 0LL;
      *((void *)v36 + 3) = 0LL;
      *(void *)__int128 v36 = off_189F82E78;
      *((void *)v36 + 1) = 1LL;
      v142 = v36;
      __int128 v37 = *(unint64_t **)(a1 + 80);
      uint64_t v38 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      unint64_t v39 = *v37;
      if (*v37)
      {
        unint64_t v40 = v39 + 8LL * *((unsigned int *)v37 + 2);
        BOOL v41 = v40 >= v39;
        unint64_t v42 = v40 - v39;
        if (!v41 || HIDWORD(v42)) {
          os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, o r [begin, end) is not a well-formed range",  v35);
        }
      }

      else
      {
        LODWORD(v42) = 0;
      }

      if (v38 >= 0) {
        unint64_t v55 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      }
      else {
        unint64_t v55 = -v38;
      }
      unint64_t v56 = ((unint64_t)v38 >> 63) + 0x7FFFFFFFFFFFFFFFLL;
      if (v38 >= 0) {
        uint64_t v57 = 8 * v55;
      }
      else {
        uint64_t v57 = -8LL * v55;
      }
      if (v55 >> 61) {
        BOOL v58 = 1;
      }
      else {
        BOOL v58 = 8 * v55 > v56;
      }
      if (v58)
      {
        v59 = "bounded_ptr<T>::operator+=(n): Calculating the number of bytes to add to the offset (n * sizeof(T)) would "
              "trigger an overflow";
      }

      else if (v57 == (int)v57)
      {
        v59 = "bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally";
        if ((v57 & 0x80000000) == 0 && (int)v57 + 8 <= v42)
        {
          uint64_t v60 = (int)v57;
          uint64_t v61 = (uint64_t)(int)v57 >> 63;
          v62 = (void **)(v39 + v60);
          uint64_t v63 = __CFADD__(v39, v60) ? v61 + 1 : v61;
          uint64_t v64 = v63 << 63 >> 63;
          v59 = "This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.";
          if (v64 == v63 && (v64 & 0x8000000000000000LL) == 0)
          {
            v65 = *v62;
            if (*v62)
            {
              uint64_t v66 = v65[1];
              if (v66 <= 0)
              {
                exception = __cxa_allocate_exception(8uLL);
                void *exception = "Over-release of an object";
                __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
              }

              goto LABEL_159;
            }

LABEL_161:
            *v62 = v36;
            uint64_t v106 = *(void *)(*(void *)(a1 + 40) + 8LL);
            uint64_t v107 = *(void *)(v106 + 24);
            uint64_t v108 = v107 + 1;
            uint64_t v109 = v107 == -1;
            BOOL v111 = v109 << 63 >> 63 != v109 || v109 << 63 >> 63 == -1;
            if (v111)
            {
              uint64_t v112 = *(void *)(*(void *)(a1 + 32) + 8LL);
              *(_DWORD *)(v112 + 40) = 10;
              *(void *)(v112 + 4_Block_object_dispose(va, 8) = "Too many elements in dictionary";
              *(void *)(v112 + 56) = 31LL;
              return 0LL;
            }

            else
            {
              *(void *)(v106 + 24) = v108;
              return !v111;
            }
          }
        }
      }

      else
      {
        v59 = "bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the current"
              " position would overflow.";
      }

      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)v59, v35);
    }

    v142 = 0LL;
    __int128 v143 = 0uLL;
    (*(void (**)(char **__return_ptr, void, _BYTE *, uint64_t))(*(void *)*v141 + 16LL))( &v142,  *v141,  v9,  v24);
    int v25 = der_vm_CEType_from_context();
    if (v25 == 1)
    {
      memset(v151, 0, sizeof(v151));
      TLE::factOpDeserializer((uint64_t)v141, (uint64_t)v148, (uint64_t)&v142, (uint64_t)v151);
      if (LODWORD(v151[0]))
      {
        uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 8LL);
        *(_OWORD *)(v27 + 40) = v151[0];
        *(void *)(v27 + 56) = *(void *)&v151[1];
        TLE::Tuple<TLE::Error,libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>::~Tuple((uint64_t)v151);
        return 0LL;
      }

      v113 = *(unint64_t **)(a1 + 80);
      uint64_t v114 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      unint64_t v115 = *v113;
      if (*v113)
      {
        unint64_t v116 = v115 + 8LL * *((unsigned int *)v113 + 2);
        BOOL v41 = v116 >= v115;
        unint64_t v117 = v116 - v115;
        if (!v41 || HIDWORD(v117)) {
          os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, o r [begin, end) is not a well-formed range",  v26);
        }
      }

      else
      {
        LODWORD(v117) = 0;
      }

      if (v114 >= 0) {
        unint64_t v118 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      }
      else {
        unint64_t v118 = -v114;
      }
      unint64_t v119 = ((unint64_t)v114 >> 63) + 0x7FFFFFFFFFFFFFFFLL;
      if (v114 >= 0) {
        uint64_t v120 = 8 * v118;
      }
      else {
        uint64_t v120 = -8LL * v118;
      }
      if (v118 >> 61) {
        BOOL v121 = 1;
      }
      else {
        BOOL v121 = 8 * v118 > v119;
      }
      if (v121)
      {
        v122 = "bounded_ptr<T>::operator+=(n): Calculating the number of bytes to add to the offset (n * sizeof(T)) would"
               " trigger an overflow";
      }

      else if (v120 == (int)v120)
      {
        v122 = "bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally";
        if ((v120 & 0x80000000) == 0 && (int)v120 + 8 <= v117)
        {
          uint64_t v123 = (int)v120;
          uint64_t v124 = (uint64_t)(int)v120 >> 63;
          BOOL v41 = __CFADD__(v115, v123);
          v125 = (void **)(v115 + v123);
          if (v41) {
            ++v124;
          }
          uint64_t v126 = v124 << 63 >> 63;
          v122 = "This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.";
          if (v126 == v124 && (v126 & 0x8000000000000000LL) == 0)
          {
            libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::operator=(v125, (void *)&v151[1] + 1);
            TLE::Tuple<TLE::Error,libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>::~Tuple((uint64_t)v151);
LABEL_213:
            uint64_t v85 = *(void *)(*(void *)(a1 + 40) + 8LL);
            uint64_t v86 = *(void *)(v85 + 24);
            goto LABEL_214;
          }
        }
      }

      else
      {
        v122 = "bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the curren"
               "t position would overflow.";
      }

      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)v122, v26);
    }

    if (v25 == (_DWORD)v142)
    {
      v48 = TLE::opForContext(v25);
      if (v48)
      {
        *((_OWORD *)v48 + 1) = v143;
        *(void *)&v151[0] = v48;
        v50 = *(unint64_t **)(a1 + 80);
        uint64_t v51 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
        unint64_t v52 = *v50;
        if (*v50)
        {
          unint64_t v53 = v52 + 8LL * *((unsigned int *)v50 + 2);
          BOOL v41 = v53 >= v52;
          unint64_t v54 = v53 - v52;
          if (!v41 || HIDWORD(v54)) {
            os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range",  v49);
          }
        }

        else
        {
          LODWORD(v54) = 0;
        }

        if (v51 >= 0) {
          unint64_t v127 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
        }
        else {
          unint64_t v127 = -v51;
        }
        if (v51 >= 0) {
          uint64_t v128 = 8 * v127;
        }
        else {
          uint64_t v128 = -8LL * v127;
        }
        v129 = "bounded_ptr<T>::operator+=(n): Calculating the number of bytes to add to the offset (n * sizeof(T)) would"
               " trigger an overflow";
        if (!(v127 >> 61) && 8 * v127 <= ((unint64_t)v51 >> 63) + 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v128 == (int)v128)
          {
            v129 = "bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally";
            if ((v128 & 0x80000000) == 0 && (int)v128 + 8 <= v54)
            {
              uint64_t v130 = (uint64_t)(int)v128 >> 63;
              BOOL v41 = __CFADD__(v52, (int)v128);
              v131 = (void **)(v52 + (int)v128);
              if (v41) {
                ++v130;
              }
              uint64_t v132 = v130 << 63 >> 63;
              v129 = "This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.";
              if (v132 == v130 && (v132 & 0x8000000000000000LL) == 0)
              {
                libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::operator=(v131, v151);
                libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::~intrusive_shared_ptr((void **)v151);
                goto LABEL_213;
              }
            }
          }

          else
          {
            v129 = "bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the cu"
                   "rrent position would overflow.";
          }
        }

        os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)v129, v49);
      }

      uint64_t v68 = *(void *)(*(void *)(a1 + 32) + 8LL);
      *(_DWORD *)(v68 + 40) = 3;
      v69 = "Unexpected type of an fact declaration.";
      uint64_t v70 = 39LL;
    }

    else
    {
      uint64_t v68 = *(void *)(*(void *)(a1 + 32) + 8LL);
      *(_DWORD *)(v68 + 40) = 3;
      v69 = "Unexpected type of an operation declaration.";
      uint64_t v70 = 44LL;
    }

    *(void *)(v68 + 4_Block_object_dispose(va, 8) = v69;
    *(void *)(v68 + 56) = v70;
    return 0LL;
  }

  unint64_t v11 = TLE::operations;
  uint64_t v12 = &TLE::operations[3 * dword_18C6AB328];
  if (v12 < TLE::operations || (24 * (unint64_t)dword_18C6AB328) >> 32) {
    os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [beg in, end) is not a well-formed range",  v7);
  }
  unint64_t v14 = (unint64_t)((unint64_t)v12 - (unsigned __int128)(unint64_t)TLE::operations) >> 64;
  unint64_t v13 = 24LL * dword_18C6AB328;
  if (v13 >= 0xFFFFFFFF80000000LL) {
    LOBYTE(v14) = v14 + 1;
  }
  if (v14 & 1 | ((v13 + 0x80000000) >> 32)) {
    os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"The offset of the pointer inside its valid memory range can't be represented using int32_t",  v7);
  }
  uint64_t v15 = (char *)TLE::operations + (int)v13;
  else {
    uint64_t v16 = (uint64_t)(int)v13 >> 63;
  }
  uint64_t v17 = v16 << 63 >> 63;
  uint64_t v18 = v17 ^ v16;
  if (v17 < 0 || v18 != 0) {
    os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.",  v7);
  }
  for (uint64_t i = (24 * dword_18C6AB328); ; i += 0x1800000000LL)
  {
    uint64_t v21 = (char *)v11 + (i >> 32);
    if (__CFADD__(v11, i >> 32)) {
      uint64_t v22 = (i >> 63) + 1;
    }
    else {
      uint64_t v22 = i >> 63;
    }
    uint64_t v23 = v22 << 63 >> 63;
    if (v23 != v22 || v23 < 0) {
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.",  v7);
    }
    if (v21 == v15) {
      goto LABEL_113;
    }
    if (i < 0 || HIDWORD(i) + 24 > i) {
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory ou tside of the bounds set originally",  v7);
    }
    if ((unint64_t)((i >> 32) - 2147483624) < 0xFFFFFFFF00000000LL) {
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the o ffset representing the current position would overflow.",  v7);
    }
  }

  memset(v151, 0, sizeof(v151));
  (*((void (**)(_OWORD *__return_ptr, void *, _OWORD *, void))v21 + 2))( v151,  v141,  v148,  *(void *)(a1 + 72));
  if (!LODWORD(v151[0]))
  {
    v43 = *(unint64_t **)(a1 + 80);
    uint64_t v44 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    unint64_t v45 = *v43;
    if (*v43)
    {
      unint64_t v46 = v45 + 8LL * *((unsigned int *)v43 + 2);
      BOOL v41 = v46 >= v45;
      unint64_t v47 = v46 - v45;
      if (!v41 || HIDWORD(v47)) {
        os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range",  v7);
      }
    }

    else
    {
      LODWORD(v47) = 0;
    }

    if (v44 >= 0) {
      unint64_t v71 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    }
    else {
      unint64_t v71 = -v44;
    }
    unint64_t v72 = ((unint64_t)v44 >> 63) + 0x7FFFFFFFFFFFFFFFLL;
    if (v44 >= 0) {
      uint64_t v73 = 8 * v71;
    }
    else {
      uint64_t v73 = -8LL * v71;
    }
    if (v71 >> 61) {
      BOOL v74 = 1;
    }
    else {
      BOOL v74 = 8 * v71 > v72;
    }
    if (v74)
    {
      v75 = "bounded_ptr<T>::operator+=(n): Calculating the number of bytes to add to the offset (n * sizeof(T)) would tr"
            "igger an overflow";
    }

    else if (v73 == (int)v73)
    {
      v75 = "bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally";
      if ((v73 & 0x80000000) == 0 && (int)v73 + 8 <= v47)
      {
        v76 = (void **)(v45 + (int)v73);
        uint64_t v77 = __CFADD__(v45, (int)v73) ? ((uint64_t)(int)v73 >> 63) + 1 : (uint64_t)(int)v73 >> 63;
        uint64_t v78 = v77 << 63 >> 63;
        v75 = "This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.";
        if (v78 == v77 && (v78 & 0x8000000000000000LL) == 0)
        {
          v79 = (void *)*((void *)&v151[1] + 1);
          v80 = *v76;
          if (*v76)
          {
            uint64_t v81 = v80[1];
            if (v81 <= 0)
            {
              v140 = __cxa_allocate_exception(8uLL);
              void *v140 = "Over-release of an object";
              __cxa_throw(v140, MEMORY[0x1896146E0], 0LL);
            }

            uint64_t v82 = v81 - 1;
            v80[1] = v82;
            if (!v82) {
              (*(void (**)(void *))(*v80 + 8LL))(v80);
            }
          }

          *v76 = v79;
LABEL_113:
          v83 = *(unint64_t **)(a1 + 80);
          uint64_t v84 = *(void *)(a1 + 40);
          uint64_t v85 = *(void *)(v84 + 8);
          uint64_t v86 = *(void *)(v85 + 24);
          unint64_t v87 = *v83;
          if (*v83)
          {
            unint64_t v88 = 8LL * *((unsigned int *)v83 + 2);
            if (v87 + v88 < v87 || HIDWORD(v88)) {
              os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this typ e, or [begin, end) is not a well-formed range",  v7);
            }
          }

          else
          {
            LODWORD(v8_Block_object_dispose(va, 8) = 0;
          }

          if (v86 >= 0) {
            unint64_t v89 = *(void *)(v85 + 24);
          }
          else {
            unint64_t v89 = -v86;
          }
          if (v86 >= 0) {
            uint64_t v90 = 8 * v89;
          }
          else {
            uint64_t v90 = -8LL * v89;
          }
          if (v89 >> 61) {
            BOOL v91 = 1;
          }
          else {
            BOOL v91 = 8 * v89 > ((unint64_t)v86 >> 63) + 0x7FFFFFFFFFFFFFFFLL;
          }
          if (v91) {
            os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator+=(n): Calculating the number of bytes to add to the offset (n * sizeof(T)) would trigger an overflow",  v7);
          }
          if (v90 != (int)v90) {
            os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the current position would overflow.",  v7);
          }
          if ((v90 & 0x80000000) != 0 || (int)v90 + 8 > v88) {
            os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access mem ory outside of the bounds set originally",  v7);
          }
          uint64_t v92 = (int)v90;
          uint64_t v93 = (uint64_t)(int)v90 >> 63;
          BOOL v41 = __CFADD__(v87, v92);
          v94 = (void *)(v87 + v92);
          if (v41) {
            ++v93;
          }
          uint64_t v95 = v93 << 63 >> 63;
          if (v95 != v93 || v95 < 0) {
            os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"This bounded_ptr is pointing to memory outside of what can be represen ted by a native pointer.",  v7);
          }
          if (!*v94)
          {
            *(_OWORD *)((char *)v151 + 4) = *(_OWORD *)((char *)&v150[1] + 8);
            __int128 v36 = (char *)operator new(0x38uLL);
            *((_DWORD *)v36 + _Block_object_dispose(va, 8) = 1;
            *(_OWORD *)(v36 + 36) = v151[0];
            *((_DWORD *)v36 + 13) = v151[1];
            *((void *)v36 + 2) = 0LL;
            *((void *)v36 + 3) = 0LL;
            *(void *)__int128 v36 = off_189F82E78;
            *((void *)v36 + 1) = 1LL;
            v142 = v36;
            uint64_t v97 = *(void *)(*(void *)(v84 + 8) + 24LL);
            unint64_t v98 = *v83;
            if (*v83)
            {
              unint64_t v99 = 8LL * *((unsigned int *)v83 + 2);
              if (v98 + v99 < v98 || HIDWORD(v99)) {
                os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this t ype, or [begin, end) is not a well-formed range",  v96);
              }
            }

            else
            {
              LODWORD(v99) = 0;
            }

            if (v97 >= 0) {
              unint64_t v100 = *(void *)(*(void *)(v84 + 8) + 24LL);
            }
            else {
              unint64_t v100 = -v97;
            }
            if (v97 >= 0) {
              uint64_t v101 = 8 * v100;
            }
            else {
              uint64_t v101 = -8LL * v100;
            }
            v102 = "bounded_ptr<T>::operator+=(n): Calculating the number of bytes to add to the offset (n * sizeof(T)) w"
                   "ould trigger an overflow";
            if (!(v100 >> 61) && 8 * v100 <= ((unint64_t)v97 >> 63) + 0x7FFFFFFFFFFFFFFFLL)
            {
              if (v101 == (int)v101)
              {
                v102 = "bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally";
                if ((v101 & 0x80000000) == 0 && (int)v101 + 8 <= v99)
                {
                  v62 = (void **)(v98 + (int)v101);
                  uint64_t v103 = __CFADD__(v98, (int)v101) ? ((uint64_t)(int)v101 >> 63) + 1 : (uint64_t)(int)v101 >> 63;
                  uint64_t v104 = v103 << 63 >> 63;
                  v102 = "This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.";
                  if (v104 == v103 && (v104 & 0x8000000000000000LL) == 0)
                  {
                    v65 = *v62;
                    if (*v62)
                    {
                      uint64_t v66 = v65[1];
                      if (v66 <= 0)
                      {
                        v139 = __cxa_allocate_exception(8uLL);
                        void *v139 = "Over-release of an object";
                        __cxa_throw(v139, MEMORY[0x1896146E0], 0LL);
                      }

LABEL_159:
                      uint64_t v105 = v66 - 1;
                      v65[1] = v105;
                      if (!v105) {
                        (*(void (**)(void *))(*v65 + 8LL))(v65);
                      }
                      goto LABEL_161;
                    }

                    goto LABEL_161;
                  }
                }
              }

              else
              {
                v102 = "bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing th"
                       "e current position would overflow.";
              }
            }

            os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)v102, v96);
          }

LABEL_214:
          uint64_t v133 = v86 + 1;
          uint64_t v134 = v86 == -1;
          BOOL v136 = v134 << 63 >> 63 != v134 || v134 << 63 >> 63 == -1;
          if (v136)
          {
            uint64_t v137 = *(void *)(*(void *)(a1 + 32) + 8LL);
            *(_DWORD *)(v137 + 40) = 10;
            *(void *)(v137 + 4_Block_object_dispose(va, 8) = "Too many elements in dictionary";
            *(void *)(v137 + 56) = 31LL;
          }

          else
          {
            *(void *)(v85 + 24) = v133;
          }

          return !v136;
        }
      }
    }

    else
    {
      v75 = "bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the current p"
            "osition would overflow.";
    }

    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)v75, v7);
  }

  uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 8LL);
  *(_OWORD *)(v31 + 40) = v151[0];
  __int128 v32 = (void *)*((void *)&v151[1] + 1);
  *(void *)(v31 + 56) = *(void *)&v151[1];
  if (v32)
  {
    uint64_t v33 = v32[1];
    if (v33 <= 0)
    {
      v138 = __cxa_allocate_exception(8uLL);
      void *v138 = "Over-release of an object";
      __cxa_throw(v138, MEMORY[0x1896146E0], 0LL);
    }

    uint64_t v34 = v33 - 1;
    v32[1] = v34;
    if (!v34) {
      (*(void (**)(void *))(*v32 + 8LL))(v32);
    }
  }

  return 0LL;
}

void sub_186DBBD08( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void **libkern::intrusive_shared_ptr<TLE::ConstErrorOperation,TLE::RefCountPolicy>::~intrusive_shared_ptr( void **a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    uint64_t v3 = v2[1];
    if (v3 <= 0)
    {
      exception = __cxa_allocate_exception(8uLL);
      void *exception = "Over-release of an object";
      __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
    }

    uint64_t v4 = v3 - 1;
    v2[1] = v4;
    if (!v4) {
      (*(void (**)(void *))(*v2 + 8LL))(v2);
    }
  }

  *a1 = 0LL;
  return a1;
}

__n128 TLE::factOpDeserializer@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v24 = 0LL;
  __n128 v22 = 0u;
  *(_OWORD *)uint64_t v23 = 0u;
  __int128 v5 = *(_OWORD *)(a2 + 16);
  v20[0] = *(_OWORD *)a2;
  v20[1] = v5;
  v20[2] = *(_OWORD *)(a2 + 32);
  uint64_t v21 = *(void *)(a2 + 48);
  TLE::Executor::getDependentOpsFromDictionary(&v22, a1, v20, a3, 0LL, 0LL, 0LL);
  if (v22.n128_u32[0])
  {
    __n128 result = v22;
    *(__n128 *)a4 = v22;
    *(void **)(a4 + 16) = v23[0];
    *(void *)(a4 + 24) = 0LL;
    uint64_t v8 = (void **)v23[1];
    if (!v23[1]) {
      return result;
    }
    goto LABEL_13;
  }

  if ((_DWORD)v24 != 1)
  {
    __n128 result = 0uLL;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_DWORD *)a4 = 6;
    *(void *)(a4 + _Block_object_dispose(va, 8) = "There should only be one operation to match a fact";
    *(void *)(a4 + 16) = 50LL;
    uint64_t v8 = (void **)v23[1];
    if (!v23[1]) {
      return result;
    }
    goto LABEL_13;
  }

  __int128 v9 = (uint64_t *)v23[1];
  if (!v23[1]) {
    goto LABEL_27;
  }
  unint64_t v10 = 8LL * v24;
  if ((char *)v23[1] + v10 < v23[1] || HIDWORD(v10)) {
    os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [beg in, end) is not a well-formed range",  v6);
  }
  if ((v10 & 0xFFFFFFF8) == 0) {
LABEL_27:
  }
    os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outs ide of the bounds set originally",  v6);
  *(void *)a4 = 0LL;
  *(void *)(a4 + _Block_object_dispose(va, 8) = 0LL;
  uint64_t v11 = *v9;
  *(void *)(a4 + 16) = 0LL;
  *(void *)(a4 + 24) = v11;
  if (v11)
  {
    uint64_t v12 = *(void *)(v11 + 8);
    if (v12 < 1)
    {
      exception = __cxa_allocate_exception(8uLL);
      void *exception = "Attempted resurection of an object";
      __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
    }

    *(void *)(v11 + _Block_object_dispose(va, 8) = v12 + 1;
  }

  uint64_t v8 = (void **)v23[1];
  if (v23[1])
  {
LABEL_13:
    if ((_DWORD)v24)
    {
      uint64_t v13 = 8LL * v24;
      unint64_t v14 = v8;
      do
      {
        uint64_t v15 = *v14;
        if (*v14)
        {
          uint64_t v16 = v15[1];
          if (v16 <= 0)
          {
            uint64_t v18 = __cxa_allocate_exception(8uLL);
            void *v18 = "Over-release of an object";
            __cxa_throw(v18, MEMORY[0x1896146E0], 0LL);
          }

          uint64_t v17 = v16 - 1;
          v15[1] = v17;
          if (!v17) {
            (*(void (**)(void *))(*v15 + 8LL))(v15);
          }
        }

        *v14++ = 0LL;
        v13 -= 8LL;
      }

      while (v13);
    }

    free(v8);
  }

  return result;
}

void sub_186DBBFEC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void **libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::operator=( void **a1, void *a2)
{
  uint64_t v4 = (void *)*a2;
  __int128 v5 = *a1;
  if (v5)
  {
    uint64_t v6 = v5[1];
    if (v6 <= 0)
    {
      exception = __cxa_allocate_exception(8uLL);
      void *exception = "Over-release of an object";
      __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
    }

    uint64_t v7 = v6 - 1;
    v5[1] = v7;
    if (!v7) {
      (*(void (**)(void *))(*v5 + 8LL))(v5);
    }
  }

  *a1 = v4;
  *a2 = 0LL;
  return a1;
}

void *TLE::opForContext(int a1)
{
  switch(a1)
  {
    case 3:
      uint64_t v1 = operator new(0x28uLL);
      uint64_t v2 = der_vm_integer_from_context();
      v1[2] = 0LL;
      v1[3] = 0LL;
      *uint64_t v1 = off_189F82DA0;
      v1[1] = 1LL;
      v1[4] = v2;
      break;
    case 4:
      uint64_t v1 = operator new(0x30uLL);
      uint64_t v4 = der_vm_string_from_context();
      v1[2] = 0LL;
      v1[3] = 0LL;
      uint64_t v6 = off_189F82DE8;
      goto LABEL_7;
    case 5:
      uint64_t v1 = operator new(0x28uLL);
      char v3 = der_vm_BOOL_from_context();
      v1[2] = 0LL;
      v1[3] = 0LL;
      *uint64_t v1 = off_189F82D58;
      v1[1] = 1LL;
      *((_BYTE *)v1 + 32) = v3;
      break;
    case 6:
      uint64_t v1 = operator new(0x30uLL);
      uint64_t v4 = der_vm_data_from_context();
      v1[2] = 0LL;
      v1[3] = 0LL;
      uint64_t v6 = off_189F82E30;
LABEL_7:
      *uint64_t v1 = v6;
      v1[1] = 1LL;
      v1[4] = v4;
      v1[5] = v5;
      break;
    default:
      uint64_t v1 = 0LL;
      break;
  }

  return v1;
}

void sub_186DBC20C(_Unwind_Exception *a1)
{
}

void **libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::~intrusive_shared_ptr( void **a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    uint64_t v3 = v2[1];
    if (v3 <= 0)
    {
      exception = __cxa_allocate_exception(8uLL);
      void *exception = "Over-release of an object";
      __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
    }

    uint64_t v4 = v3 - 1;
    v2[1] = v4;
    if (!v4) {
      (*(void (**)(void *))(*v2 + 8LL))(v2);
    }
  }

  *a1 = 0LL;
  return a1;
}

void *_ZN3TLE12BinaryDataOpI8CEBufferXtlNS_3__8EEEED1Ev(void *result)
{
  *__n128 result = off_189F830F0;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  return result;
}

void _ZN3TLE12BinaryDataOpI8CEBufferXtlNS_3__8EEEED0Ev(void *a1)
{
  *a1 = off_189F830F0;
  if (a1[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  operator delete(a1);
}

void *_ZN3TLE12BinaryDataOpI8CEBufferXtlNS_3__8EEEE7ExecuteERNS_12EncyclopediaE@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = 0LL;
  memset(v5, 0, sizeof(v5));
  __n128 result = (*(void *(**)(_OWORD *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24LL))( v5,  a2,  *(void *)(a1 + 16),  *(void *)(a1 + 24));
  if (LODWORD(v5[0]) == 6)
  {
    __n128 result = (void *)CEBuffer_cmp();
    *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
    *(void *)(a3 + 16) = 0LL;
    *(void *)a3 = 0LL;
    *(_BYTE *)(a3 + 24) = (_DWORD)result == 0;
  }

  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(void *)a3 = 0LL;
    *(void *)(a3 + _Block_object_dispose(va, 8) = "Invalid fact type for this operation (expected data)";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 52LL;
  }

  return result;
}

uint64_t TLE::Operation::shouldIgnore(TLE::Operation *this)
{
  return 0LL;
}

void TLE::RefCounted::~RefCounted(TLE::RefCounted *this)
{
  *(void *)this = off_189F830F0;
  if (*((void *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

{
  void *exception;
  *(void *)this = off_189F830F0;
  if (*((void *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  operator delete(this);
}

void *_ZN3TLE11BinaryStrOpI8CEBufferXtlNS_3__7EEEED1Ev(void *result)
{
  *__n128 result = off_189F830F0;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  return result;
}

void _ZN3TLE11BinaryStrOpI8CEBufferXtlNS_3__7EEEED0Ev(void *a1)
{
  *a1 = off_189F830F0;
  if (a1[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  operator delete(a1);
}

void *_ZN3TLE11BinaryStrOpI8CEBufferXtlNS_3__7EEEE7ExecuteERNS_12EncyclopediaE@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = 0LL;
  memset(v5, 0, sizeof(v5));
  __n128 result = (*(void *(**)(_OWORD *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24LL))( v5,  a2,  *(void *)(a1 + 16),  *(void *)(a1 + 24));
  if (LODWORD(v5[0]) == 4)
  {
    __n128 result = (void *)CEBuffer_cmp();
    *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
    *(void *)(a3 + 16) = 0LL;
    *(void *)a3 = 0LL;
    *(_BYTE *)(a3 + 24) = (_DWORD)result == 0;
  }

  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(void *)a3 = 0LL;
    *(void *)(a3 + _Block_object_dispose(va, 8) = "Invalid fact type for this operation (expected a string)";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 56LL;
  }

  return result;
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__6EEEED1Ev(void *result)
{
  *__n128 result = off_189F830F0;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  return result;
}

void _ZN3TLE11BinaryIntOpIxXtlNS_3__6EEEED0Ev(void *a1)
{
  *a1 = off_189F830F0;
  if (a1[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  operator delete(a1);
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__6EEEE7ExecuteERNS_12EncyclopediaE@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v10 = 0LL;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __n128 result = (*(void *(**)(__int128 *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24LL))( &v8,  a2,  a1[2],  a1[3]);
  if ((_DWORD)v8 == 3 || (_DWORD)v8 == 5)
  {
    BOOL v7 = *((void *)&v9 + 1) == a1[4];
    *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
    *(void *)(a3 + 16) = 0LL;
    *(void *)a3 = 0LL;
    *(_BYTE *)(a3 + 24) = v7;
  }

  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(void *)a3 = 0LL;
    *(void *)(a3 + _Block_object_dispose(va, 8) = "Invalid fact type for this operation (expected an integer or BOOL)";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 66LL;
  }

  return result;
}

void *_ZN3TLE11BinaryIntOpIbXtlNS_3__5EEEED1Ev(void *result)
{
  *__n128 result = off_189F830F0;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  return result;
}

void _ZN3TLE11BinaryIntOpIbXtlNS_3__5EEEED0Ev(void *a1)
{
  *a1 = off_189F830F0;
  if (a1[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  operator delete(a1);
}

void *_ZN3TLE11BinaryIntOpIbXtlNS_3__5EEEE7ExecuteERNS_12EncyclopediaE@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v11 = 0LL;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __n128 result = (*(void *(**)(__int128 *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24LL))( &v9,  a2,  *(void *)(a1 + 16),  *(void *)(a1 + 24));
  if ((_DWORD)v9 == 3 || (_DWORD)v9 == 5)
  {
    BOOL v7 = *((void *)&v10 + 1) == 0LL;
    BOOL v8 = *(_BYTE *)(a1 + 32) != 0;
    *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
    *(void *)(a3 + 16) = 0LL;
    *(void *)a3 = 0LL;
    *(_BYTE *)(a3 + 24) = v7 ^ v8;
  }

  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(void *)a3 = 0LL;
    *(void *)(a3 + _Block_object_dispose(va, 8) = "Invalid fact type for this operation (expected an integer or BOOL)";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 66LL;
  }

  return result;
}

void TLE::ConstErrorOperation::~ConstErrorOperation(TLE::ConstErrorOperation *this)
{
  *(void *)this = off_189F830F0;
  if (*((void *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

{
  void *exception;
  *(void *)this = off_189F830F0;
  if (*((void *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  operator delete(this);
}

__n128 TLE::ConstErrorOperation::Execute@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  a2[1].n128_u8[8] = 0;
  __n128 result = a1[2];
  *a2 = result;
  a2[1].n128_u64[0] = a1[3].n128_u64[0];
  return result;
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__4EEEED1Ev(void *result)
{
  *__n128 result = off_189F830F0;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  return result;
}

void _ZN3TLE11BinaryIntOpIxXtlNS_3__4EEEED0Ev(void *a1)
{
  *a1 = off_189F830F0;
  if (a1[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  operator delete(a1);
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__4EEEE7ExecuteERNS_12EncyclopediaE@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v10 = 0LL;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __n128 result = (*(void *(**)(__int128 *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24LL))( &v8,  a2,  a1[2],  a1[3]);
  if ((_DWORD)v8 == 3 || (_DWORD)v8 == 5)
  {
    BOOL v7 = (a1[4] & ~*((void *)&v9 + 1)) == 0LL;
    *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
    *(void *)(a3 + 16) = 0LL;
    *(void *)a3 = 0LL;
    *(_BYTE *)(a3 + 24) = v7;
  }

  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(void *)a3 = 0LL;
    *(void *)(a3 + _Block_object_dispose(va, 8) = "Invalid fact type for this operation (expected an integer or BOOL)";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 66LL;
  }

  return result;
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__3EEEED1Ev(void *result)
{
  *__n128 result = off_189F830F0;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  return result;
}

void _ZN3TLE11BinaryIntOpIxXtlNS_3__3EEEED0Ev(void *a1)
{
  *a1 = off_189F830F0;
  if (a1[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  operator delete(a1);
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__3EEEE7ExecuteERNS_12EncyclopediaE@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v10 = 0LL;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __n128 result = (*(void *(**)(__int128 *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24LL))( &v8,  a2,  a1[2],  a1[3]);
  if ((_DWORD)v8 == 3 || (_DWORD)v8 == 5)
  {
    BOOL v7 = *((void *)&v9 + 1) >= a1[4];
    *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
    *(void *)(a3 + 16) = 0LL;
    *(void *)a3 = 0LL;
    *(_BYTE *)(a3 + 24) = v7;
  }

  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(void *)a3 = 0LL;
    *(void *)(a3 + _Block_object_dispose(va, 8) = "Invalid fact type for this operation (expected an integer or BOOL)";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 66LL;
  }

  return result;
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__2EEEED1Ev(void *result)
{
  *__n128 result = off_189F830F0;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  return result;
}

void _ZN3TLE11BinaryIntOpIxXtlNS_3__2EEEED0Ev(void *a1)
{
  *a1 = off_189F830F0;
  if (a1[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  operator delete(a1);
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__2EEEE7ExecuteERNS_12EncyclopediaE@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v10 = 0LL;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __n128 result = (*(void *(**)(__int128 *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24LL))( &v8,  a2,  a1[2],  a1[3]);
  if ((_DWORD)v8 == 3 || (_DWORD)v8 == 5)
  {
    BOOL v7 = *((void *)&v9 + 1) > a1[4];
    *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
    *(void *)(a3 + 16) = 0LL;
    *(void *)a3 = 0LL;
    *(_BYTE *)(a3 + 24) = v7;
  }

  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(void *)a3 = 0LL;
    *(void *)(a3 + _Block_object_dispose(va, 8) = "Invalid fact type for this operation (expected an integer or BOOL)";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 66LL;
  }

  return result;
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__1EEEED1Ev(void *result)
{
  *__n128 result = off_189F830F0;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  return result;
}

void _ZN3TLE11BinaryIntOpIxXtlNS_3__1EEEED0Ev(void *a1)
{
  *a1 = off_189F830F0;
  if (a1[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  operator delete(a1);
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__1EEEE7ExecuteERNS_12EncyclopediaE@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v10 = 0LL;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __n128 result = (*(void *(**)(__int128 *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24LL))( &v8,  a2,  a1[2],  a1[3]);
  if ((_DWORD)v8 == 3 || (_DWORD)v8 == 5)
  {
    BOOL v7 = *((void *)&v9 + 1) <= a1[4];
    *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
    *(void *)(a3 + 16) = 0LL;
    *(void *)a3 = 0LL;
    *(_BYTE *)(a3 + 24) = v7;
  }

  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(void *)a3 = 0LL;
    *(void *)(a3 + _Block_object_dispose(va, 8) = "Invalid fact type for this operation (expected an integer or BOOL)";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 66LL;
  }

  return result;
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__0EEEED1Ev(void *result)
{
  *__n128 result = off_189F830F0;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  return result;
}

void _ZN3TLE11BinaryIntOpIxXtlNS_3__0EEEED0Ev(void *a1)
{
  *a1 = off_189F830F0;
  if (a1[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  operator delete(a1);
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__0EEEE7ExecuteERNS_12EncyclopediaE@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v10 = 0LL;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __n128 result = (*(void *(**)(__int128 *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24LL))( &v8,  a2,  a1[2],  a1[3]);
  if ((_DWORD)v8 == 3 || (_DWORD)v8 == 5)
  {
    BOOL v7 = *((void *)&v9 + 1) < a1[4];
    *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
    *(void *)(a3 + 16) = 0LL;
    *(void *)a3 = 0LL;
    *(_BYTE *)(a3 + 24) = v7;
  }

  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(void *)a3 = 0LL;
    *(void *)(a3 + _Block_object_dispose(va, 8) = "Invalid fact type for this operation (expected an integer or BOOL)";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 66LL;
  }

  return result;
}

BOOL TLE::getLowestCompatibleVersionFor(uint64_t a1)
{
  return a1 == 1;
}

uint64_t TLE::LWCR::LWCR(uint64_t this)
{
  *(_BYTE *)(this + 80) = 0;
  *(_BYTE *)(this + 57) = 0;
  *(void *)(this + _Block_object_dispose(va, 8) = 0LL;
  *(void *)(this + 16) = 0LL;
  *(void *)this = 0LL;
  return this;
}

{
  *(_BYTE *)(this + 80) = 0;
  *(_BYTE *)(this + 57) = 0;
  *(void *)(this + _Block_object_dispose(va, 8) = 0LL;
  *(void *)(this + 16) = 0LL;
  *(void *)this = 0LL;
  return this;
}

char *TLE::LWCR::requirements(TLE::LWCR *this)
{
  uint64_t v1 = (char *)this + 24;
  else {
    return 0LL;
  }
}

uint64_t TLE::LWCR::version(TLE::LWCR *this)
{
  return *(void *)this;
}

uint64_t TLE::LWCR::compatVersion(TLE::LWCR *this)
{
  return *((void *)this + 1);
}

uint64_t TLE::LWCR::constraintCategory(TLE::LWCR *this)
{
  return *((void *)this + 2);
}

uint64_t TLE::LWCR::loadFromCE@<X0>(TLE::LWCR *this@<X0>, CEQueryContext *a2@<X1>, uint64_t a3@<X8>)
{
  runtime = a2->der_context.runtime;
  uint64_t result = der_vm_select_int_for_key();
  if (!(_DWORD)result || (uint64_t result = der_vm_select_int_for_key(), (result & 1) == 0))
  {
    __int128 v9 = (uint64_t (*)(CERuntime *, const char *, ...))*((void *)runtime + 3);
    if (v9) {
      uint64_t result = v9(runtime, "[%s]: %s\n", "loadFromCE", "LWCR: invalid version / compatible version fields");
    }
    *(_DWORD *)a3 = 7;
    BOOL v7 = "LWCRs are not encoded correctly";
    uint64_t v8 = 31LL;
    goto LABEL_8;
  }

  if (*((uint64_t *)this + 1) >= 2)
  {
    *(_DWORD *)a3 = 6;
    BOOL v7 = "This LWCR is not compatible with this runtime";
    uint64_t v8 = 45LL;
LABEL_8:
    *(void *)(a3 + _Block_object_dispose(va, 8) = v7;
    *(void *)(a3 + 16) = v8;
    return result;
  }

  uint64_t v10 = (void *)((char *)this + 16);
  uint64_t result = der_vm_select_int_for_key();
  if ((_DWORD)result && (*v10 & 0x8000000000000000LL) != 0)
  {
    *(_DWORD *)a3 = 7;
    BOOL v7 = "LWCRs constraint category cannot be less that zero";
    uint64_t v8 = 50LL;
    goto LABEL_8;
  }

  der_vm_execute_nocopy();
  if (der_vm_context_is_valid())
  {
    uint64_t result = der_vm_CEType_from_context();
    if ((_DWORD)result != 1)
    {
      *(_DWORD *)a3 = 7;
      BOOL v7 = "LWCRs 'requirements' field is not a dictionary";
      uint64_t v8 = 46LL;
      goto LABEL_8;
    }
  }

  if (!*v10)
  {
    uint64_t result = der_vm_context_is_valid();
    if ((result & 1) == 0)
    {
      *(_DWORD *)a3 = 7;
      BOOL v7 = "LWCRs do not specify a constraint category or explicit requirements";
      uint64_t v8 = 67LL;
      goto LABEL_8;
    }
  }

  uint64_t result = der_vm_context_is_valid();
  if ((_DWORD)result)
  {
    uint64_t result = CEConjureContextFromDER();
    *(_OWORD *)((char *)this + 24) = v11;
    *(_OWORD *)((char *)this + 40) = v12;
    *(_OWORD *)((char *)this + 56) = v13;
    *(_OWORD *)((char *)this + 72) = v14;
  }

  *(_DWORD *)a3 = 0;
  *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
  *(void *)(a3 + 16) = 0LL;
  return result;
}

void TLE::Executor::getOperationsFromCE(TLE::Executor *this@<X0>, CEQueryContext *a2@<X1>, uint64_t a3@<X8>)
{
  if (!a2)
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)a3 = 2;
    *(void *)(a3 + _Block_object_dispose(va, 8) = "Null query context";
    *(void *)(a3 + 16) = 18LL;
    return;
  }

  __int128 v4 = *(_OWORD *)&a2->der_context.lookup.index_count;
  *(_OWORD *)&v19.runtime = *(_OWORD *)&a2->der_context.runtime;
  *(_OWORD *)&v19.lookup.index_count = v4;
  *(_OWORD *)&v19.sorted = *(_OWORD *)&a2->der_context.sorted;
  v19.var0.ccstate.der_end = a2->der_context.var0.ccstate.der_end;
  uint64_t v22 = 0LL;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  TLE::Executor::getDependentOpsFromDictionary((uint64_t)this, &v19, (uint64_t)&v20);
  if ((_DWORD)v20)
  {
    *(_OWORD *)a3 = v20;
    uint64_t v6 = (void *)*((void *)&v21 + 1);
    *(void *)(a3 + 16) = v21;
    *(void *)(a3 + 24) = 0LL;
    if (!v6) {
      return;
    }
  }

  else
  {
    int v7 = v22;
    if ((_DWORD)v22 != 1)
    {
      uint64_t v16 = operator new(0x30uLL);
      v16[2] = 0LL;
      v16[3] = 0LL;
      *uint64_t v16 = off_189F82F60;
      v16[1] = 1LL;
      v16[4] = *((void *)&v21 + 1);
      *((_DWORD *)v16 + 10) = v7;
      *(void *)a3 = 0LL;
      *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      *(void *)(a3 + 24) = v16;
      return;
    }

    uint64_t v6 = (void *)*((void *)&v21 + 1);
    if (!*((void *)&v21 + 1)) {
      goto LABEL_26;
    }
    unint64_t v8 = 8LL * v22;
    if (*((void *)&v21 + 1) + v8 < *((void *)&v21 + 1) || HIDWORD(v8)) {
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [b egin, end) is not a well-formed range",  v5);
    }
    if ((v8 & 0xFFFFFFF8) == 0) {
LABEL_26:
    }
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory ou tside of the bounds set originally",  v5);
    *(void *)a3 = 0LL;
    *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
    __int128 v9 = (void *)*v6;
    *(void *)(a3 + 16) = 0LL;
    *(void *)(a3 + 24) = v9;
    if (v9)
    {
      uint64_t v10 = v9[1];
      if (v10 < 1)
      {
        exception = __cxa_allocate_exception(8uLL);
        void *exception = "Attempted resurection of an object";
        __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
      }

      v9[1] = v10 + 1;
    }
  }

  if ((_DWORD)v22)
  {
    uint64_t v11 = 8LL * v22;
    __int128 v12 = (void **)v6;
    do
    {
      __int128 v13 = *v12;
      if (*v12)
      {
        uint64_t v14 = v13[1];
        if (v14 <= 0)
        {
          uint64_t v17 = __cxa_allocate_exception(8uLL);
          void *v17 = "Over-release of an object";
          __cxa_throw(v17, MEMORY[0x1896146E0], 0LL);
        }

        uint64_t v15 = v14 - 1;
        v13[1] = v15;
        if (!v15) {
          (*(void (**)(void *))(*v13 + 8LL))(v13);
        }
      }

      *v12++ = 0LL;
      v11 -= 8LL;
    }

    while (v11);
  }

  free(v6);
}

void sub_186DBD4B0(_Unwind_Exception *a1)
{
}

BOOL TLE::matchRestrictList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v3 = a2 - 1;
  uint64_t v4 = a3 + 8;
  do
  {
    int v5 = CEBuffer_cmp();
    BOOL result = v5 == 0;
    if (v5) {
      BOOL v7 = v3 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    --v3;
    v4 += 16LL;
  }

  while (!v7);
  return result;
}

void TLE::AndOperation::~AndOperation(TLE::AndOperation *this)
{
}

{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void **v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *exception;
  void *v10;
  *(void *)this = off_189F82F60;
  uint64_t v2 = (void *)*((void *)this + 4);
  if (v2)
  {
    uint64_t v3 = *((unsigned int *)this + 10);
    if ((_DWORD)v3)
    {
      uint64_t v4 = 8 * v3;
      int v5 = (void **)*((void *)this + 4);
      do
      {
        uint64_t v6 = *v5;
        if (*v5)
        {
          BOOL v7 = v6[1];
          if (v7 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            void *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
          }

          unint64_t v8 = v7 - 1;
          v6[1] = v8;
          if (!v8) {
            (*(void (**)(void *))(*v6 + 8LL))(v6);
          }
        }

        *v5++ = 0LL;
        v4 -= 8LL;
      }

      while (v4);
    }

    free(v2);
  }

  *(void *)this = off_189F830F0;
  if (*((void *)this + 1))
  {
    uint64_t v10 = __cxa_allocate_exception(8uLL);
    void *v10 = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(v10, MEMORY[0x1896146E0], 0LL);
  }

void *TLE::AndOperation::Execute@<X0>(void *result@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v5 = result[4];
  if (v5)
  {
    unint64_t v6 = v5 + 8LL * *((unsigned int *)result + 10);
    if (v6 < v5 || (8 * (unint64_t)*((unsigned int *)result + 10)) >> 32) {
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [b egin, end) is not a well-formed range",  a2);
    }
    uint64_t v8 = (v6 - (unsigned __int128)v5) >> 64;
    uint64_t v7 = 8LL * *((unsigned int *)result + 10);
    if ((v8 & 1) != (unint64_t)(int)v7 >> 63 || v7 != (int)v7) {
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"The offset of the pointer inside its valid memory range can't be represented using int32_t",  a2);
    }
    uint64_t v10 = (8 * *((_DWORD *)result + 10));
  }

  else
  {
    uint64_t v10 = 0LL;
    LODWORD(v7) = 0;
  }

  uint64_t v11 = (int)v7;
  uint64_t v12 = (uint64_t)(int)v7 >> 63;
  __int128 v13 = (void *)(v5 + v11);
  if (__CFADD__(v5, v11)) {
    uint64_t v14 = v12 + 1;
  }
  else {
    uint64_t v14 = v12;
  }
  BOOL v16 = v14 << 63 >> 63 != v14 || v14 << 63 >> 63 == -1;
  while (1)
  {
    uint64_t v17 = (void *)(v5 + (v10 >> 32));
    if (__CFADD__(v5, v10 >> 32)) {
      uint64_t v18 = (v10 >> 63) + 1;
    }
    else {
      uint64_t v18 = v10 >> 63;
    }
    uint64_t v19 = v18 << 63 >> 63;
    if (v19 != v18 || v19 < 0 || v16) {
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.",  a2);
    }
    if (v17 == v13)
    {
      *(void *)a3 = 0LL;
      *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      *(_BYTE *)(a3 + 24) = 1;
      return result;
    }

    if (v10 < 0 || HIDWORD(v10) + 8 > v10) {
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory ou tside of the bounds set originally",  a2);
    }
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    BOOL result = (*(void *(**)(__int128 *__return_ptr, void, const char *))(*(void *)*v17 + 16LL))( &v20,  *v17,  a2);
    if ((_DWORD)v20)
    {
      *(_BYTE *)(a3 + 24) = 0;
      *(_OWORD *)a3 = v20;
      *(void *)(a3 + 16) = v21;
      return result;
    }

    if (!BYTE8(v21)) {
      break;
    }
    if ((unint64_t)((v10 >> 32) - 2147483640) < 0xFFFFFFFF00000000LL) {
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the o ffset representing the current position would overflow.",  a2);
    }
    v10 += 0x800000000LL;
  }

  *(void *)a3 = 0LL;
  *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
  *(_BYTE *)(a3 + 24) = 0;
  *(void *)(a3 + 16) = 0LL;
  return result;
}

void TLE::OrOperation::~OrOperation(TLE::OrOperation *this)
{
}

{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void **v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *exception;
  void *v10;
  *(void *)this = off_189F82FD0;
  uint64_t v2 = (void *)*((void *)this + 4);
  if (v2)
  {
    uint64_t v3 = *((unsigned int *)this + 10);
    if ((_DWORD)v3)
    {
      uint64_t v4 = 8 * v3;
      unint64_t v5 = (void **)*((void *)this + 4);
      do
      {
        unint64_t v6 = *v5;
        if (*v5)
        {
          uint64_t v7 = v6[1];
          if (v7 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            void *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
          }

          uint64_t v8 = v7 - 1;
          v6[1] = v8;
          if (!v8) {
            (*(void (**)(void *))(*v6 + 8LL))(v6);
          }
        }

        *v5++ = 0LL;
        v4 -= 8LL;
      }

      while (v4);
    }

    free(v2);
  }

  *(void *)this = off_189F830F0;
  if (*((void *)this + 1))
  {
    uint64_t v10 = __cxa_allocate_exception(8uLL);
    void *v10 = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(v10, MEMORY[0x1896146E0], 0LL);
  }

uint64_t TLE::OrOperation::Execute@<X0>(uint64_t result@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v5 = *(void *)(result + 32);
  if (v5)
  {
    unint64_t v6 = v5 + 8LL * *(unsigned int *)(result + 40);
    if (v6 < v5 || (8 * (unint64_t)*(unsigned int *)(result + 40)) >> 32) {
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [b egin, end) is not a well-formed range",  a2);
    }
    uint64_t v8 = (v6 - (unsigned __int128)v5) >> 64;
    uint64_t v7 = 8LL * *(unsigned int *)(result + 40);
    if ((v8 & 1) != (unint64_t)(int)v7 >> 63 || v7 != (int)v7) {
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"The offset of the pointer inside its valid memory range can't be represented using int32_t",  a2);
    }
    uint64_t v10 = (8 * *(_DWORD *)(result + 40));
  }

  else
  {
    uint64_t v10 = 0LL;
    LODWORD(v7) = 0;
  }

  uint64_t v11 = (int)v7;
  uint64_t v12 = (uint64_t)(int)v7 >> 63;
  __int128 v13 = (void *)(v5 + v11);
  if (__CFADD__(v5, v11)) {
    uint64_t v14 = v12 + 1;
  }
  else {
    uint64_t v14 = v12;
  }
  BOOL v16 = v14 << 63 >> 63 != v14 || v14 << 63 >> 63 == -1;
  while (1)
  {
    uint64_t v17 = (void *)(v5 + (v10 >> 32));
    if (__CFADD__(v5, v10 >> 32)) {
      uint64_t v18 = (v10 >> 63) + 1;
    }
    else {
      uint64_t v18 = v10 >> 63;
    }
    uint64_t v19 = v18 << 63 >> 63;
    if (v19 != v18 || v19 < 0 || v16) {
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.",  a2);
    }
    if (v17 == v13)
    {
      *(void *)a3 = 0LL;
      *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
      *(_BYTE *)(a3 + 24) = 0;
      *(void *)(a3 + 16) = 0LL;
      return result;
    }

    if (v10 < 0 || HIDWORD(v10) + 8 > v10) {
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory ou tside of the bounds set originally",  a2);
    }
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    BOOL result = (uint64_t)(*(void *(**)(__int128 *__return_ptr, void, const char *))(*(void *)*v17 + 16LL))( &v20,  *v17,  a2);
    if ((_DWORD)v20)
    {
      *(_BYTE *)(a3 + 24) = 0;
      *(_OWORD *)a3 = v20;
      *(void *)(a3 + 16) = v21;
      return result;
    }

    BOOL result = (*(uint64_t (**)(void))(*(void *)*v17 + 24LL))(*v17);
    if ((result & 1) == 0)
    {
      if (BYTE8(v21)) {
        break;
      }
    }

    if ((unint64_t)((v10 >> 32) - 2147483640) < 0xFFFFFFFF00000000LL) {
      os_detail::panic_trapping_policy::trap( (os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the o ffset representing the current position would overflow.",  a2);
    }
    v10 += 0x800000000LL;
  }

  *(void *)a3 = 0LL;
  *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
  *(void *)(a3 + 16) = 0LL;
  *(_BYTE *)(a3 + 24) = 1;
  return result;
}

void TLE::InOperation::~InOperation(TLE::InOperation *this)
{
  *(void *)this = off_189F830F0;
  if (*((void *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

{
  void *exception;
  *(void *)this = off_189F830F0;
  if (*((void *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  operator delete(this);
}

void TLE::InOperation::Execute(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  char v10 = 0;
  uint64_t v6 = 0LL;
  memset(v5, 0, sizeof(v5));
  (*(void (**)(_OWORD *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24LL))( v5,  a2,  *(void *)(a1 + 16),  *(void *)(a1 + 24));
  if (LODWORD(v5[0]) == 3 || LODWORD(v5[0]) == 4 || LODWORD(v5[0]) == 6)
  {
    der_vm_iterate_b();
    uint64_t v4 = v8;
    *(void *)(a3 + _Block_object_dispose(va, 8) = 0LL;
    *(void *)(a3 + 16) = 0LL;
    *(void *)a3 = 0LL;
    *(_BYTE *)(a3 + 24) = *((_BYTE *)v4 + 24);
  }

  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(void *)a3 = 0LL;
    *(void *)(a3 + _Block_object_dispose(va, 8) = "In Operation expected the Fact to be an integer, string or data";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 63LL;
  }

  _Block_object_dispose(&v7, 8);
}

void sub_186DBDD64(_Unwind_Exception *a1)
{
}

uint64_t ___ZN3TLE11InOperation7ExecuteERNS_12EncyclopediaE_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 116) != 3) {
    return 1LL;
  }
  uint64_t v3 = der_vm_integer_from_context();
  uint64_t result = 1LL;
  if (v3 == *(void *)(a1 + 40))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    return 0LL;
  }

  return result;
}

uint64_t ___ZN3TLE11InOperation7ExecuteERNS_12EncyclopediaE_block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 116) != 4) {
    return 1LL;
  }
  der_vm_string_from_context();
  int v3 = CEBuffer_cmp();
  uint64_t result = 1LL;
  if (!v3)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    return 0LL;
  }

  return result;
}

uint64_t ___ZN3TLE11InOperation7ExecuteERNS_12EncyclopediaE_block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 116) != 6) {
    return 1LL;
  }
  der_vm_data_from_context();
  int v3 = CEBuffer_cmp();
  uint64_t result = 1LL;
  if (!v3)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    return 0LL;
  }

  return result;
}

void TLE::QueryOperation::~QueryOperation(TLE::QueryOperation *this)
{
  *(void *)this = off_189F830F0;
  if (*((void *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

{
  void *exception;
  *(void *)this = off_189F830F0;
  if (*((void *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
  }

  operator delete(this);
}

void TLE::QueryOperation::Execute(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  uint64_t v25 = 0LL;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  (*(void (**)(__int128 *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24LL))( &v23,  a2,  *(void *)(a1 + 16),  *(void *)(a1 + 24));
  if ((_DWORD)v23 == 1)
  {
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    v18[0] = 0LL;
    v18[1] = v18;
    v18[2] = 0x6002000000LL;
    v18[3] = __Block_byref_object_copy__33;
    v18[4] = __Block_byref_object_dispose__34;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    uint64_t v22 = 0LL;
    __int128 v5 = *(_OWORD *)(*((void *)&v24 + 1) + 16LL);
    __int128 v4 = *(_OWORD *)(*((void *)&v24 + 1) + 32LL);
    uint64_t v6 = *(void *)(*((void *)&v24 + 1) + 48LL);
    __int128 v19 = **((_OWORD **)&v24 + 1);
    uint64_t v22 = v6;
    __int128 v21 = v4;
    __int128 v20 = v5;
    uint64_t v10 = 0LL;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x4002000000LL;
    __int128 v13 = __Block_byref_object_copy__5;
    uint64_t v14 = __Block_byref_object_dispose__6;
    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
    uint64_t v15 = 0LL;
    uint64_t v7 = der_vm_iterate_b();
    uint64_t v8 = v11 + 5;
    if (*((_DWORD *)v11 + 10))
    {
      *(_BYTE *)(a3 + 24) = 0;
      *(_OWORD *)a3 = *(_OWORD *)v8;
      *(void *)(a3 + 16) = v8[2];
    }

    else if (v7 == *MEMORY[0x1896135D8])
    {
      char is_valid = der_vm_context_is_valid();
      *(void *)a3 = 0LL;
      *(void *)(a3 + _Block_object_dispose((const void *)(v1 - 64), 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      *(_BYTE *)(a3 + 24) = is_valid;
    }

    else
    {
      *(_BYTE *)(a3 + 24) = 0;
      *(void *)a3 = 0LL;
      *(void *)(a3 + _Block_object_dispose((const void *)(v1 - 64), 8) = "Attempted to execute a non-iterable query";
      *(_DWORD *)a3 = 6;
      *(void *)(a3 + 16) = 41LL;
    }

    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(v18, 8);
  }

  else
  {
    *(_BYTE *)(a3 + 24) = 0;
    *(void *)a3 = 0LL;
    *(void *)(a3 + _Block_object_dispose((const void *)(v1 - 64), 8) = "Query Operation expected the Fact to be a CoreEntitlements dictionary";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 69LL;
  }

void sub_186DBE228( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

__n128 __Block_byref_object_copy__33(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  __int128 v3 = *(_OWORD *)(a2 + 56);
  __int128 v4 = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 8_Block_object_dispose((const void *)(v1 - 64), 8) = *(void *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = v4;
  *(_OWORD *)(a1 + 56) = v3;
  *(__n128 *)(a1 + 40) = result;
  return result;
}

__n128 __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

uint64_t ___ZN3TLE14QueryOperation7ExecuteERNS_12EncyclopediaE_block_invoke(uint64_t a1)
{
  unint64_t v2 = der_vm_integer_from_context() & 0xBFFFFFFFFFFFFFFFLL;
  **(void **)(a1 + 4_Block_object_dispose((const void *)(v1 - 64), 8) = v2;
  if (v2 > 0xB) {
    goto LABEL_12;
  }
  if (((1LL << v2) & 0x35A) == 0)
  {
    if (((1LL << v2) & 0xC80) != 0)
    {
      *(void *)(*(void *)(a1 + 48) + 8LL) = der_vm_integer_from_context();
      goto LABEL_8;
    }

    if (v2 == 5)
    {
      *(void *)(*(void *)(a1 + 48) + 8LL) = der_vm_BOOL_from_context();
      goto LABEL_8;
    }

LABEL_12:
    uint64_t result = 0LL;
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
    *(_DWORD *)(v8 + 40) = 1;
    *(void *)(v8 + 4_Block_object_dispose((const void *)(v1 - 64), 8) = "Attempted to execute unknown CoreEntitlements operation";
    *(void *)(v8 + 56) = 55LL;
    return result;
  }

  uint64_t v3 = der_vm_string_from_context();
  uint64_t v4 = *(void *)(a1 + 48);
  *(void *)(v4 + _Block_object_dispose((const void *)(v1 - 64), 8) = v3;
  *(void *)(v4 + 16) = v5;
  **(void **)(a1 + 48) |= 0x4000000000000000uLL;
LABEL_8:
  if (der_vm_context_is_valid())
  {
    der_vm_execute_nocopy();
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
    *(_OWORD *)(v6 + 40) = v9;
    *(_OWORD *)(v6 + 56) = v10;
    *(_OWORD *)(v6 + 72) = v11;
    *(void *)(v6 + 8_Block_object_dispose((const void *)(v1 - 64), 8) = v12;
  }

  return 1LL;
}

void TLE::OptionalOperation::~OptionalOperation(TLE::OptionalOperation *this)
{
  *(void *)this = off_189F830A8;
  unint64_t v2 = (void *)*((void *)this + 4);
  if (v2)
  {
    uint64_t v3 = v2[1];
    if (v3 <= 0)
    {
      exception = __cxa_allocate_exception(8uLL);
      void *exception = "Over-release of an object";
      __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
    }

    uint64_t v4 = v3 - 1;
    v2[1] = v4;
    if (!v4) {
      (*(void (**)(void *))(*v2 + 8LL))(v2);
    }
  }

  *((void *)this + 4) = 0LL;
  *(void *)this = off_189F830F0;
  if (*((void *)this + 1))
  {
    uint64_t v5 = __cxa_allocate_exception(8uLL);
    *uint64_t v5 = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(v5, MEMORY[0x1896146E0], 0LL);
  }

{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *exception;
  *(void *)this = off_189F830A8;
  unint64_t v2 = (void *)*((void *)this + 4);
  if (v2)
  {
    uint64_t v3 = v2[1];
    if (v3 <= 0)
    {
      exception = __cxa_allocate_exception(8uLL);
      void *exception = "Over-release of an object";
      __cxa_throw(exception, MEMORY[0x1896146E0], 0LL);
    }

    uint64_t v4 = v3 - 1;
    v2[1] = v4;
    if (!v4) {
      (*(void (**)(void *))(*v2 + 8LL))(v2);
    }
  }

  *((void *)this + 4) = 0LL;
  *(void *)this = off_189F830F0;
  if (*((void *)this + 1))
  {
    uint64_t v5 = __cxa_allocate_exception(8uLL);
    *uint64_t v5 = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(v5, MEMORY[0x1896146E0], 0LL);
  }

  operator delete(this);
}

double TLE::OptionalOperation::Execute@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  (*(void (**)(__int128 *__return_ptr))(**(void **)(a1 + 32) + 16LL))(&v7);
  if ((_DWORD)v7)
  {
    if ((_DWORD)v7 != 5 && (_DWORD)v7 != 1)
    {
      *(_BYTE *)(a2 + 24) = 0;
      double result = *(double *)&v7;
      *(_OWORD *)a2 = v7;
      *(void *)(a2 + 16) = v8;
      return result;
    }

    char v6 = 1;
    *(_BYTE *)(a1 + 40) = 1;
    *(void *)(a2 + _Block_object_dispose((const void *)(v1 - 64), 8) = 0LL;
    *(void *)(a2 + 16) = 0LL;
    *(void *)a2 = 0LL;
  }

  else
  {
    *(void *)a2 = 0LL;
    *(void *)(a2 + _Block_object_dispose((const void *)(v1 - 64), 8) = 0LL;
    *(void *)(a2 + 16) = 0LL;
    char v6 = BYTE8(v8);
  }

  *(_BYTE *)(a2 + 24) = v6;
  return result;
}

uint64_t TLE::OptionalOperation::shouldIgnore(TLE::OptionalOperation *this)
{
  return *((unsigned __int8 *)this + 40);
}

void sub_186DBE7C8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  __int128 v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)&OBJC_CLASS___LWCR;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

LABEL_10:
  return v9;
}

void sub_186DBEB04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186DBED4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186DBEE04( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  __int128 v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)&OBJC_CLASS___LWCRFact;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_186DBEE88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186DBEF60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186DBEFF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186DBF0D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186DBF164(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186DBF3B0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, id a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, id a30)
{
  _Unwind_Resume(a1);
}

void sub_186DBF494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186DBF53C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_186DBF5BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void TLE::CallbackEncyclopedia::~CallbackEncyclopedia(id *this)
{
}

{

  operator delete(this);
}

uint64_t TLE::CallbackEncyclopedia::getFact(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16LL))();
}

uint64_t TLE::CallbackEncyclopedia::resolveFact(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 16) + 16LL))();
}

uint64_t TLE::CallbackEncyclopedia::hasFactFor(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16LL))();
}

uint64_t CEBuffer_cmp()
{
  return MEMORY[0x1896134D0]();
}

uint64_t CEConjureContextFromDER()
{
  return MEMORY[0x1896134E0]();
}

uint64_t CEManagedContextFromCFData()
{
  return MEMORY[0x189613500]();
}

uint64_t CEManagedContextFromCFDataWithOptions()
{
  return MEMORY[0x189613508]();
}

uint64_t CEQueryContextToCFDictionary()
{
  return MEMORY[0x189613510]();
}

uint64_t CEReleaseManagedContext()
{
  return MEMORY[0x189613518]();
}

uint64_t CESerializeCFDictionary()
{
  return MEMORY[0x189613530]();
}

uint64_t CESerializeCFDictionaryWithOptions()
{
  return MEMORY[0x189613538]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_189F82870(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1896147A0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void bzero(void *a1, size_t a2)
{
}

uint64_t der_vm_CEType_from_context()
{
  return MEMORY[0x189613578]();
}

uint64_t der_vm_BOOL_from_context()
{
  return MEMORY[0x189613580]();
}

uint64_t der_vm_context_is_valid()
{
  return MEMORY[0x189613588]();
}

uint64_t der_vm_data_from_context()
{
  return MEMORY[0x189613590]();
}

uint64_t der_vm_execute_nocopy()
{
  return MEMORY[0x1896135A0]();
}

uint64_t der_vm_integer_from_context()
{
  return MEMORY[0x1896135A8]();
}

uint64_t der_vm_iterate_b()
{
  return MEMORY[0x1896135B8]();
}

uint64_t der_vm_select_int_for_key()
{
  return MEMORY[0x1896135C0]();
}

uint64_t der_vm_string_from_context()
{
  return MEMORY[0x1896135C8]();
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}