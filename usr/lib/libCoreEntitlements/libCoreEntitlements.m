uint64_t CEIndexSizeForContext(unint64_t *a1, void *a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v10;
  void v11[9];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  v4 = *a1;
  v5 = *a1 + 64;
  v17 = 0LL;
  v18 = &v17;
  v19 = 0x2000000000LL;
  v6 = MEMORY[0x1895F87A8];
  v20 = 0LL;
  v12 = MEMORY[0x1895F87A8];
  v13 = 0x40000000LL;
  v14 = (uint64_t)__count_keys_block_invoke;
  v15 = &unk_189B57698;
  v16 = &v17;
  der_vm_iterate_b((uint64_t)a1, (uint64_t)&v12);
  v7 = v18[3];
  _Block_object_dispose(&v17, 8);
  v12 = 0LL;
  v13 = (uint64_t)&v12;
  v14 = 0x2000000000LL;
  v15 = Errors;
  v11[0] = v6;
  v11[1] = 0x40000000LL;
  v11[2] = __CEIndexSizeForContext_block_invoke;
  v11[3] = &unk_189B57670;
  v11[6] = v5;
  v11[7] = v4;
  v11[4] = &v12;
  v11[5] = v4;
  v11[8] = a1;
  der_vm_iterate_b((uint64_t)a1, (uint64_t)v11);
  v8 = *(void **)(v13 + 24);
  if (v8 != Errors) {
    goto LABEL_6;
  }
  *a2 = 8 * v7;
  if (!(v7 >> 61))
  {
    if (v7 > 1) {
      v8 = Errors;
    }
    else {
      v8 = qword_189B577B8;
    }
LABEL_6:
    _Block_object_dispose(&v12, 8);
    return (uint64_t)v8;
  }

  if (v4 && v4 >= v5) {
    __break(0x5519u);
  }
  v10 = (*(uint64_t (**)(unint64_t, const char *, ...))(v4 + 32))( v4,  "[%s]: %s\n",  "CEIndexSizeForContext",  "index size overflow");
  return __count_keys_block_invoke(v10);
}

uint64_t __count_keys_block_invoke(uint64_t a1)
{
  return 1LL;
}

unint64_t __CEIndexSizeForContext_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v8 = 0LL;
  unint64_t v9 = 0LL;
  unint64_t result = a1[5];
  if (result)
  {
    if (result >= a1[6] || result < a1[7])
    {
      __break(0x5519u);
      return result;
    }

    __int128 v6 = *(_OWORD *)(a2 + 96);
  }

  else
  {
    __int128 v6 = *(_OWORD *)(a2 + 96);
    if ((der_decode_key_value(0LL, &v8, &v7, &v6) & 1) == 0) {
      goto LABEL_15;
    }
  }

LABEL_15:
  unint64_t result = 0LL;
  *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = &unk_189B57798;
  return result;
}

void CEBuildIndexForContext(unint64_t *a1)
{
  v1 = (void *)*a1;
  unint64_t v2 = *a1 + 64;
  if (*(void *)*a1 < 2uLL || !v1[6] || !v1[7])
  {
    v14 = (void (*)(void *, const char *, ...))v1[3];
    if (!v14) {
      return;
    }
    if ((unint64_t)v1 < v2)
    {
      v14(v1, "[%s]: %s\n", "CEBuildIndexForContext", "runtime doesn't support acceleration");
      return;
    }

    goto LABEL_48;
  }

  uint64_t v3 = (uint64_t)a1;
  uint64_t v37 = 0LL;
  if ((void *)CEIndexSizeForContext(a1, &v37) != Errors) {
    return;
  }
  uint64_t v48 = 0LL;
  v49 = &v48;
  uint64_t v50 = 0x2000000000LL;
  uint64_t v4 = MEMORY[0x1895F87A8];
  uint64_t v51 = 0LL;
  uint64_t v38 = MEMORY[0x1895F87A8];
  uint64_t v39 = 0x40000000LL;
  v40 = __count_keys_block_invoke;
  v41 = &unk_189B57698;
  v42 = &v48;
  der_vm_iterate_b(v3, (uint64_t)&v38);
  unint64_t v5 = v49[3];
  _Block_object_dispose(&v48, 8);
  uint64_t v6 = v37;
  unint64_t v7 = ((uint64_t (*)(void *, uint64_t))v1[6])(v1, v37);
  if (!v7) {
    return;
  }
  if (v7 > v7 + v6 || v5 > v6 >> 3)
  {
LABEL_48:
    __break(0x5519u);
    return;
  }

  *(void *)&__int128 v36 = v7;
  *((void *)&v36 + 1) = v5;
  uint64_t v9 = *(void *)v3;
  uint64_t v10 = *(void *)v3 + 64LL;
  uint64_t v48 = 0LL;
  v49 = &v48;
  uint64_t v50 = 0x2000000000LL;
  uint64_t v51 = 0LL;
  uint64_t v38 = v4;
  uint64_t v39 = 0x40000000LL;
  v40 = __copy_keys_to_accelerator_block_invoke;
  v41 = &unk_189B576C0;
  uint64_t v44 = v10;
  uint64_t v45 = v9;
  uint64_t v46 = v3;
  v47 = &v36;
  v42 = &v48;
  uint64_t v43 = v9;
  der_vm_iterate_b(v3, (uint64_t)&v38);
  _Block_object_dispose(&v48, 8);
  if (*((void *)&v36 + 1) >= 2uLL)
  {
    uint64_t v11 = 0LL;
    uint64_t v12 = 1LL;
    uint64_t v13 = 8LL;
    uint64_t v35 = v3;
    do
    {
      uint64_t v33 = v12;
      uint64_t v34 = v11;
      uint64_t v32 = v13;
      while (1)
      {
        unint64_t v16 = *((void *)&v36 + 1);
        unint64_t v15 = v36;
        unint64_t v17 = *(void *)(v36 + 8 * v11);
        uint64_t v18 = *(void *)(v3 + 40);
        unint64_t v19 = HIDWORD(v17);
        v20 = (const void *)(v18 + v17);
        if (!v20 || v19 == 0) {
          break;
        }
        unint64_t v22 = v36 + v13 - 8;
        unint64_t v23 = *(void *)(v36 + v13);
        v24 = (const void *)(v18 + v23);
        if (v24)
        {
          size_t v25 = v19 >= HIDWORD(v23) ? HIDWORD(v23) : HIDWORD(v17);
          int v26 = v19 < HIDWORD(v23) ? -1 : 1;
          int v27 = memcmp(v20, v24, v25);
          BOOL v28 = v19 != HIDWORD(v23) && v27 == 0;
          int v29 = v28 ? v26 : v27;
          uint64_t v3 = v35;
          if (v29 < 1) {
            break;
          }
        }

        if (v22 >= v15 + 8 * v16 || v22 < v15) {
          goto LABEL_48;
        }
        *(void *)(v15 + 8 * v11) = v23;
        v31 = (unint64_t *)(v36 + v13);
        if ((uint64_t)v36 + v13 >= (unint64_t)(v36 + 8LL * *((void *)&v36 + 1))
          || (unint64_t)v31 < (unint64_t)v36)
        {
          goto LABEL_48;
        }

        unint64_t *v31 = v17;
        v13 -= 8LL;
        if (--v11 == -1)
        {
          unint64_t v16 = *((void *)&v36 + 1);
          break;
        }
      }

      uint64_t v12 = v33 + 1;
      uint64_t v13 = v32 + 8;
      uint64_t v11 = v34 + 1;
    }

    while (v33 + 1 < v16);
  }

  *(_OWORD *)(v3 + 8) = v36;
}

char *__copy_keys_to_accelerator_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  unint64_t v3 = a1[5];
  if (!v3 || (v3 < a1[6] ? (BOOL v4 = v3 >= a1[7]) : (BOOL v4 = 0), v4))
  {
    __int128 v15 = *(_OWORD *)(a2 + 96);
    unint64_t v3 = der_decode_key_value(v3, &v17, &v16, &v15);
    if ((v3 & 1) != 0)
    {
      unint64_t v5 = (unint64_t *)a1[9];
      unint64_t v6 = *v5;
      unint64_t v7 = *v5 + 8 * v5[1];
      uint64_t v8 = (_DWORD *)(*v5 + 8LL * *(void *)(*(void *)(a1[4] + 8LL) + 24LL));
      if ((unint64_t)v8 < v7 && (unint64_t)v8 >= v6)
      {
        int v10 = v18;
        *uint64_t v8 = v17 - *(void *)(a1[8] + 40LL);
        v8[1] = v10;
        ++*(void *)(*(void *)(a1[4] + 8LL) + 24LL);
        return (char *)1;
      }
    }

    else
    {
      unint64_t v3 = a1[5];
      unint64_t v12 = a1[6];
      BOOL v13 = v3 + 64 > v12 || a1[7] > v3;
      if (!v13 && (!v3 || v3 < v12)) {
        goto LABEL_21;
      }
    }
  }

  __break(0x5519u);
LABEL_21:
  v14 = (char **)(*(uint64_t (**)(unint64_t, const char *, ...))(v3 + 32))( v3,  "[%s]: %s\n",  "copy_keys_to_accelerator_block_invoke",  "fatal error when decoding key/value pair");
  return CEFreeIndexForContext(v14);
}

char *CEFreeIndexForContext(char **a1)
{
  v1 = a1[2];
  if (!v1) {
    return (char *)&Errors;
  }
  unint64_t result = *a1;
  if (result) {
    BOOL v4 = result >= result + 64;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    (*((void (**)(char *, char *, uint64_t))result + 7))(result, a1[1], 8LL * (void)v1);
    a1[1] = 0LL;
    a1[2] = 0LL;
    return (char *)&Errors;
  }

  __break(0x5519u);
  return result;
}

BOOL CEContextIsAccelerated(uint64_t a1)
{
  return *(void *)(a1 + 16) != 0LL;
}

void *CEValidate(void *result, void *a2, unint64_t a3, unint64_t a4)
{
  char v4 = 0;
  if (a3 <= a4) {
    return CEValidateWithOptions(result, &v4, a2, a3, a4);
  }
  __break(0x5519u);
  return result;
}

void *CEValidateWithOptions( void *result, _BYTE *a2, void *a3, unint64_t a4, unint64_t a5)
{
  unint64_t v5 = result;
  if (!a3) {
    goto LABEL_16;
  }
  *a3 = 0LL;
  if (a4 > a5)
  {
    __break(0x5519u);
    return result;
  }

  a3[1] = a4;
  a3[2] = a5;
  if (a4 && a4 < a5)
  {
    if (a5 - a4 >= 5 && (*(_DWORD *)a4 == 1836597052 ? (BOOL v10 = *(_BYTE *)(a4 + 4) == 108) : (BOOL v10 = 0), v10))
    {
      __int128 v16 = (void (*)(void *, const char *, ...))result[3];
      if (v16) {
        v16(result, "[%s]: %s\n", "CEValidateWithOptions", "xml-looking blob was passed in");
      }
      return &unk_189B57768;
    }

    else
    {
      v18[1] = a5;
      v18[2] = 0LL;
      v18[0] = a4;
      if (ccder_blob_decode_tl())
      {
        __int128 v25 = 0uLL;
        if ((ccder_blob_decode_range() & 1) != 0)
        {
          unint64_t v19 = 0LL;
          uint64_t v20 = 0LL;
          if ((ccder_blob_decode_range() & 1) != 0)
          {
            if ((unint64_t)(v20 - (void)v19) < 9)
            {
              uint64_t v17 = (void (*)(void *, const char *, ...))v5[3];
              if (v17) {
                v17(v5, "[%s]: entitlements blob has unexpected version %lld\n", "validate_VNext", 0LL);
              }
              return &unk_189B57798;
            }

            uint64_t v11 = (void (*)(void *, const char *, ...))v5[3];
            if (v11)
            {
              unint64_t v12 = "number too large";
LABEL_31:
              __int128 v15 = "der_decode_number";
              goto LABEL_32;
            }
          }

          else
          {
            uint64_t v11 = (void (*)(void *, const char *, ...))v5[3];
            if (v11)
            {
              unint64_t v12 = "unknown number encoding";
              goto LABEL_31;
            }
          }

          return &unk_189B57798;
        }

        uint64_t v11 = (void (*)(void *, const char *, ...))v5[3];
        if (!v11) {
          return &unk_189B57798;
        }
        unint64_t v12 = "entitlements blob does not have CCDER_ENTITLEMENTS coding";
        __int128 v15 = "validate_VNext";
LABEL_32:
        v11(v5, "[%s]: %s\n", v15, v12);
        return &unk_189B57798;
      }

      __int128 v25 = 0uLL;
      unint64_t v23 = a4;
      unint64_t v24 = a5;
      if ((ccder_blob_decode_range() & 1) == 0)
      {
        uint64_t v11 = (void (*)(void *, const char *, ...))v5[3];
        if (!v11) {
          return &unk_189B57798;
        }
        unint64_t v12 = "entitlements blob does not have CCDER_CONSTRUCTED_SET coding";
        __int128 v15 = "validate_V0";
        goto LABEL_32;
      }

      uint64_t v21 = 0LL;
      uint64_t v22 = 0LL;
      unint64_t v19 = v5;
      uint64_t v20 = 0x2000000000000011LL;
      LOBYTE(v22) = *a2;
      if (recursivelyValidateEntitlements((uint64_t)&v19, v18))
      {
        *a3 = 1LL;
        v14 = &kCENoError;
      }

      else
      {
        v14 = &kCEMalformedEntitlements;
      }

      return *v14;
    }
  }

  else
  {
LABEL_16:
    BOOL v13 = (void (*)(void *, const char *, ...))result[3];
    if (v13) {
      v13(result, "[%s]: %s\n", "CEValidateWithOptions", "invalid arguments passed in");
    }
    return &unk_189B57778;
  }
}

uint64_t CEAcquireUnmanagedContext(uint64_t result, void *a2, uint64_t a3)
{
  if (!a3 || !*a2 || !a2[1] || !a2[2])
  {
    uint64_t v8 = &kCEInvalidArgument;
    return (uint64_t)*v8;
  }

  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  unint64_t v5 = a2[1];
  unint64_t v4 = a2[2];
  if (*a2 == 2LL)
  {
    if (v5 <= v4)
    {
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      *(void *)a3 = result;
      *(_OWORD *)(a3 + 24) = xmmword_1811463B0;
      *(void *)(a3 + 40) = v5;
      *(void *)(a3 + 48) = v4;
      __int128 v6 = *(_OWORD *)(a3 + 16);
      v9[0] = *(_OWORD *)a3;
      v9[1] = v6;
      v9[2] = *(_OWORD *)(a3 + 32);
      uint64_t v10 = *(void *)(a3 + 48);
      der_vm_execute_nocopy((unint64_t)v9, (size_t *)CESelectValueOperation, (uint64_t)v11);
      __int128 v7 = v11[1];
      *(_OWORD *)a3 = v11[0];
      *(_OWORD *)(a3 + 16) = v7;
      *(_OWORD *)(a3 + 32) = v11[2];
      unint64_t v4 = v12;
LABEL_12:
      *(void *)(a3 + 48) = v4;
      uint64_t v8 = &kCENoError;
      return (uint64_t)*v8;
    }
  }

  else if (v5 <= v4)
  {
    *(void *)(a3 + 8) = 0LL;
    *(void *)(a3 + 16) = 0LL;
    *(void *)a3 = result;
    *(_OWORD *)(a3 + 24) = xmmword_1811463A0;
    *(void *)(a3 + 40) = v5;
    goto LABEL_12;
  }

  __break(0x5519u);
  return result;
}

void *CEAcquireManagedContext(uint64_t a1, void *a2, void *a3)
{
  if (!a3 || !*a2 || !a2[1] || !a2[2])
  {
    uint64_t v10 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (!v10) {
      return &unk_189B57768;
    }
    uint64_t v11 = "The passed in arguments are invalid";
LABEL_11:
    v10(a1, "[%s]: %s\n", "CEAcquireManagedContext", v11);
    return &unk_189B57768;
  }

  if (!*(void *)(a1 + 8))
  {
    uint64_t v10 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (!v10) {
      return &unk_189B57768;
    }
    uint64_t v11 = "This context's runtime does not support allocating";
    goto LABEL_11;
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = *(_OWORD *)a2;
  uint64_t v13 = a2[2];
  unint64_t result = (void *)CEAcquireUnmanagedContext(a1, &v12, (uint64_t)&v14);
  if (result == Errors)
  {
    BYTE8(v17) = 1;
    __int128 v6 = (_OWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(a1, 64LL);
    *a3 = v6;
    if (v6)
    {
      __int128 v7 = v14;
      __int128 v8 = v15;
      __int128 v9 = v17;
      v6[2] = v16;
      v6[3] = v9;
      *__int128 v6 = v7;
      v6[1] = v8;
      return Errors;
    }

    else
    {
      return (void *)&unk_189B57788;
    }
  }

  return result;
}

void **CEReleaseManagedContext(void **result)
{
  if (!result) {
    goto LABEL_22;
  }
  v1 = result;
  unint64_t v2 = *result;
  if (!*result)
  {
LABEL_14:
    __int128 v7 = &kCENoError;
    return (void **)*v7;
  }

  unint64_t v3 = *v2;
  unint64_t v4 = *v2 + 64;
  if (!*(void *)(*v2 + 16))
  {
    __int128 v8 = *(void (**)(unint64_t, const char *, ...))(v3 + 24);
    if (v8)
    {
      if (v3 >= v4) {
        goto LABEL_24;
      }
      __int128 v9 = "This context's runtime does not support freeing";
      goto LABEL_21;
    }

LABEL_22:
    __int128 v7 = &kCEAPIMisuse;
    return (void **)*v7;
  }

  if (!*((_BYTE *)v2 + 56))
  {
    __int128 v8 = *(void (**)(unint64_t, const char *, ...))(v3 + 24);
    if (v8)
    {
      if (v3 >= v4) {
        goto LABEL_24;
      }
      __int128 v9 = "Trying to release an unmanaged context";
LABEL_21:
      v8(v3, "[%s]: %s\n", "CEReleaseManagedContext", v9);
      goto LABEL_22;
    }

    goto LABEL_22;
  }

  if (v2 < v2 + 8)
  {
    unint64_t v5 = v2[2];
    if (v5)
    {
      if (v3) {
        BOOL v6 = v3 >= v4;
      }
      else {
        BOOL v6 = 0;
      }
      if (v6) {
        goto LABEL_24;
      }
      unint64_t result = (void **)(*(uint64_t (**)(unint64_t, unint64_t, unint64_t))(v3 + 56))( *v2,  v2[1],  8 * v5);
      v2[1] = 0LL;
      v2[2] = 0LL;
    }

    if (v3 < v4)
    {
      (*(void (**)(unint64_t, unint64_t *))(v3 + 16))(v3, v2);
      void *v1 = 0LL;
      goto LABEL_14;
    }
  }

    __int128 v16 = 0;
    __int128 v17 = 0;
    uint64_t v18 = 0;
    unint64_t v19 = 0;
    uint64_t v20 = 0;
    goto LABEL_23;
  }

  __int128 v16 = 0;
  __int128 v17 = 0;
  unint64_t v19 = 0;
  uint64_t v20 = 5;
  uint64_t v18 = 1;
  switch((uint64_t)v77)
  {
    case 1LL:
      break;
    case 2LL:
      __int128 v16 = 0;
      __int128 v17 = 0;
      uint64_t v18 = 0;
      unint64_t v19 = 0;
      uint64_t v20 = 3;
      break;
    case 3LL:
    case 5LL:
    case 6LL:
    case 7LL:
    case 8LL:
    case 9LL:
    case 10LL:
    case 11LL:
      goto LABEL_22;
    case 4LL:
      __int128 v16 = 0;
      __int128 v17 = 0;
      uint64_t v18 = 0;
      unint64_t v19 = 0;
      uint64_t v20 = 6;
      break;
    case 12LL:
      __int128 v17 = 0;
      uint64_t v18 = 0;
      unint64_t v19 = 0;
      uint64_t v20 = 4;
      __int128 v16 = 1;
      break;
    default:
      if ((void)v77 != 0xA000000000000010LL) {
        goto LABEL_22;
      }
      goto LABEL_7;
  }

LABEL_24:
  __break(0x5519u);
  return result;
}

    if (!v7 || v7 < v7 + 64) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }

  if (*(void *)v22 - (void)v21 >= 9uLL)
  {
    __int128 v12 = *(void (**)(unint64_t, const char *, ...))(v7 + 24);
    if (v12)
    {
      uint64_t v13 = "number too large";
      goto LABEL_23;
    }

    goto LABEL_24;
  }

  if ((unint64_t)v21 >= *(void *)v22)
  {
    __int128 v9 = 0LL;
LABEL_17:
    *a3 = v9;
    return v6;
  }

  __int128 v8 = 0LL;
  __int128 v9 = 0LL;
  while (1)
  {
    if (!v8 && (*v21 & 0x80u) != 0) {
      __int128 v9 = -1LL;
    }
    uint64_t v10 = &v21[v8];
    __int128 v9 = *v10 | (unint64_t)(v9 << 8);
    if (*(void *)v22 - (void)v21 == ++v8) {
      goto LABEL_17;
    }
  }

void *CEContextQuery(__int128 *a1, size_t *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return &unk_189B57778;
  }
  uint64_t v3 = a3;
  __int128 v4 = a1[1];
  __int128 v19 = *a1;
  __int128 v20 = v4;
  char v21 = *((_BYTE *)a1 + 32);
  int v5 = *((unsigned __int8 *)a1 + 33);
  v18[0] = *(__int128 *)((char *)a1 + 34);
  for (*(void *)((char *)v18 + 14) = *((void *)a1 + 6); v3; --v3)
  {
    v10[0] = v19;
    v10[1] = v20;
    char v11 = v21;
    char v12 = v5;
    *(_OWORD *)uint64_t v13 = v18[0];
    *(void *)&v13[14] = *(void *)((char *)v18 + 14);
    if (a2) {
      __int128 v7 = a2;
    }
    else {
      __int128 v7 = 0LL;
    }
    der_vm_execute_nocopy((unint64_t)v10, v7, (uint64_t)v14);
    __int128 v19 = v14[0];
    __int128 v20 = v14[1];
    char v21 = v15;
    int v5 = v16;
    v18[0] = *(_OWORD *)v17;
    a2 += 32;
    *(void *)((char *)v18 + 14) = *(void *)&v17[14];
  }

  if (v5) {
    __int128 v8 = &kCENoError;
  }
  else {
    __int128 v8 = &kCEQueryCannotBeSatisfied;
  }
  return *v8;
}

__n128 CEConjureContextFromDER@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v2;
  __n128 result = *(__n128 *)(a1 + 32);
  *(__n128 *)(a2 + 32) = result;
  *(void *)(a2 + 48) = *(void *)(a1 + 48);
  *(_BYTE *)(a2 + 56) = 0;
  return result;
}

uint64_t CEPrepareQuery(__int16 a1, unint64_t *a2, unint64_t a3)
{
  if (!a3) {
    goto LABEL_13;
  }
  __int128 v4 = a2;
  if ((a1 & 1) == 0)
  {
    uint64_t v5 = 0LL;
    if ((a1 & 0x100) != 0)
    {
      uint64_t v22 = a2 + 2;
      BOOL v6 = 1;
      __int128 v7 = &kCENoError;
      while (1)
      {
        uint64_t v23 = *(v22 - 2);
        if ((v23 & 0x4000000000000000LL) != 0)
        {
          unint64_t v24 = v23 & 0xBFFFFFFFFFFFFFFFLL;
          BOOL v13 = v24 > 9;
          uint64_t v25 = (1LL << v24) & 0x35A;
          if (v13 || v25 == 0) {
            goto LABEL_12;
          }
          if (*v22 > 0xEFuLL) {
            goto LABEL_41;
          }
        }

        BOOL v6 = ++v5 < a3;
        v22 += 32;
        if (a3 == v5) {
          return (uint64_t)*v7;
        }
      }
    }

    BOOL v6 = 1;
    __int128 v7 = &kCENoError;
    while ((*v4 & 0x4000000000000000LL) == 0
         || (*v4 & 0xBFFFFFFFFFFFFFFFLL) <= 9 && ((1LL << *(_BYTE *)v4) & 0x35A) != 0)
    {
      v4 += 32;
      BOOL v6 = ++v5 < a3;
      if (a3 == v5) {
        return (uint64_t)*v7;
      }
    }

LABEL_12:
    if (!v6) {
      goto LABEL_13;
    }
LABEL_42:
    __int128 v7 = &kCEInvalidArgument;
    return (uint64_t)*v7;
  }

  uint64_t v10 = 0LL;
  BOOL v6 = 1;
  __int128 v7 = &kCENoError;
  if ((a1 & 0x100) != 0)
  {
    while (1)
    {
      unint64_t v17 = *v4;
      if ((*v4 & 0x4000000000000000LL) != 0)
      {
        unint64_t v18 = v17 & 0xBFFFFFFFFFFFFFFFLL;
        BOOL v13 = (v17 & 0xBFFFFFFFFFFFFFFFLL) > 9;
        uint64_t v19 = (1LL << v17) & 0x35A;
        if (v13 || v19 == 0) {
          goto LABEL_12;
        }
        unint64_t v21 = v4[2];
        if (v21 >= 0xF0) {
          goto LABEL_41;
        }
        memcpy(v4 + 1, (const void *)v4[1], v4[2]);
        v4[31] = v21;
        *__int128 v4 = v18;
      }

      BOOL v6 = ++v10 < a3;
      v4 += 32;
      if (a3 == v10) {
        return (uint64_t)*v7;
      }
    }
  }

  while (1)
  {
    unint64_t v11 = *v4;
    if ((*v4 & 0x4000000000000000LL) != 0) {
      break;
    }
LABEL_17:
    BOOL v6 = ++v10 < a3;
    v4 += 32;
    if (a3 == v10) {
      return (uint64_t)*v7;
    }
  }

  unint64_t v12 = v11 & 0xBFFFFFFFFFFFFFFFLL;
  BOOL v13 = (v11 & 0xBFFFFFFFFFFFFFFFLL) > 9;
  uint64_t v14 = (1LL << v11) & 0x35A;
  if (v13 || v14 == 0) {
    goto LABEL_12;
  }
  unint64_t v16 = v4[2];
  if (v16 <= 0xEF)
  {
    memcpy(v4 + 1, (const void *)v4[1], v4[2]);
    v4[31] = v16;
    *__int128 v4 = v12;
    goto LABEL_17;
  }

LABEL_41:
  if (v6) {
    goto LABEL_42;
  }
LABEL_13:
  __int128 v7 = &kCENoError;
  return (uint64_t)*v7;
}

void *CESizeSerialization(void *result, unint64_t a2, uint64_t *a3)
{
  *a3 = 0LL;
  uint64_t v9 = 0LL;
  if (a2 <= 1 || *result != 7LL) {
    return &unk_189B57778;
  }
  unint64_t v3 = (unint64_t)&result[4 * a2];
  __int128 v4 = (void *)(v3 - 32);
  if (v3 >= 0x20 && v4 >= result)
  {
    if (*v4 == 8LL)
    {
      __int128 v7 = result + 4;
      __int128 v8 = &result[4 * a2];
      BOOL v6 = (void *)der_size_dictionary((uint64_t)result, (unint64_t *)&v7, &v9);
      if (v6 == Errors)
      {
        if (v7 == v8)
        {
          ccder_sizeof();
          *a3 = ccder_sizeof();
        }

        else
        {
          return &unk_189B57798;
        }
      }

      return v6;
    }

    return &unk_189B57778;
  }

  __break(0x5519u);
  return result;
}

void *CESizeXMLSerialization(void *result, unint64_t a2, void *a3)
{
  *a3 = 0LL;
  uint64_t v8 = 0LL;
  if (a2 <= 1 || *result != 7LL) {
    return &unk_189B57778;
  }
  unint64_t v3 = (unint64_t)&result[4 * a2];
  __int128 v4 = (void *)(v3 - 32);
  if (v3 < 0x20 || v4 < result)
  {
    __break(0x5519u);
    return result;
  }

  if (*v4 != 8LL) {
    return &unk_189B57778;
  }
  BOOL v6 = result + 4;
  __int128 v7 = &result[4 * a2];
  __n128 result = xml_size_dictionary(result, (unint64_t *)&v6, &v8);
  if (result == Errors)
  {
    if (v6 == v7) {
      *a3 = v8 + 171;
    }
    else {
      return &unk_189B57798;
    }
  }

  return result;
}

uint64_t CESerializeWithOptions( uint64_t result, _BYTE *a2, unint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6)
{
  char v15 = (void *)result;
  unint64_t v20 = 0LL;
  unint64_t v21 = 0LL;
  if (a5 <= a6)
  {
    unint64_t v20 = a5;
    unint64_t v21 = a6;
    if (a6 > a5)
    {
      unint64_t v11 = a3 + 32 * a4;
      unint64_t v12 = (void *)(v11 - 32);
      uint64_t v13 = a4;
      while (2)
      {
        if ((--v13 & 0x8000000000000000LL) == 0)
        {
          if ((unint64_t)(v12 + 4) <= v11 && (unint64_t)v12 >= a3)
          {
            int v14 = 4;
            switch(*v12)
            {
              case 1LL:
                uint64_t v17 = 0LL;
                uint64_t v18 = 0LL;
                __n128 result = ccder_blob_reserve_tl();
                BOOL v6 = &unk_189B57778;
                int v14 = 1;
                goto LABEL_6;
              case 2LL:
              case 3LL:
                __n128 result = ccder_blob_encode_body_tl();
                if ((result & 1) == 0) {
                  return (uint64_t)&unk_189B57778;
                }
                goto LABEL_5;
              case 4LL:
                __n128 result = der_encode_number();
                if ((result & 1) != 0) {
                  goto LABEL_5;
                }
                return (uint64_t)&unk_189B57778;
              case 5LL:
              case 7LL:
                __n128 result = ccder_blob_encode_tl();
                if ((result & 1) == 0) {
                  return (uint64_t)&unk_189B57778;
                }
LABEL_5:
                int v14 = 4;
                goto LABEL_6;
              case 9LL:
                int v14 = 4;
                __n128 result = ccder_blob_encode_body_tl();
                if ((result & 1) != 0) {
                  goto LABEL_6;
                }
                return (uint64_t)&unk_189B57778;
              default:
LABEL_6:
                v12 -= 4;
                if (v14 == 4) {
                  continue;
                }
                return (uint64_t)v6;
            }
          }

          goto LABEL_30;
        }

        break;
      }
    }

    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    __n128 result = ccder_blob_reserve_tl();
    if ((result & 1) == 0) {
      return (uint64_t)&unk_189B57798;
    }
    if (a4)
    {
      ccder_sizeof();
      ccder_sizeof();
      if ((ccder_blob_encode_tl() & 1) != 0)
      {
        uint64_t v17 = 0LL;
        uint64_t v18 = 0LL;
        uint64_t v19 = 0LL;
        BOOL v6 = CEValidateWithOptions(v15, a2, &v17, a5, a6);
        if (v6 != Errors) {
          cc_clear();
        }
        return (uint64_t)v6;
      }

      return (uint64_t)&unk_189B57798;
    }
  }

LABEL_30:
  __break(0x5519u);
  return result;
}

    *a2 = v31;
    a2[1] = v10;
    a2[2] = v32;
    if (v8) {
      operator delete(v8);
    }
    goto LABEL_32;
  }

  uint64_t v23 = (void *)serializeDict(v3, a2);
LABEL_35:

  return v23;
}

uint64_t CESerialize( uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
  char v5 = 0;
  if (a4 <= a5) {
    return CESerializeWithOptions(result, &v5, a2, a3, a4, a5);
  }
  __break(0x5519u);
  return result;
}

void *CESerializeXML(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (a4 > a5) {
    goto LABEL_94;
  }
  unint64_t v24 = a4;
  unint64_t v26 = a5;
  if (a5 - a4 <= 0xA1) {
    return &unk_189B57778;
  }
  qmemcpy( (void *)(a4 + 32),  "F-8?><!DOCTYPE plist PUBLIC -//Apple//DTD PLIST 1.0//EN https://www.apple.com/DTDs/PropertyList-1.0.dtd><p list version=1.0>",  130);
  char v5 = (int *)(a4 + 162);
  qmemcpy((void *)a4, "<?xml version=1.0 encoding=UT", 32);
  uint64_t v25 = (int *)(a4 + 162);
  if (a4 < a5)
  {
    uint64_t v7 = a3;
    if (a3)
    {
      unint64_t v8 = a2 + 32 * a3;
      unint64_t v9 = a2 + 32;
      while (v9 <= v8)
      {
        switch(*(void *)(v9 - 32))
        {
          case 1LL:
            if (*(void *)(v9 - 24))
            {
              *(int *)((char *)v5 + 3) = 1043293557;
              int v10 = 1970435132;
LABEL_70:
              *char v5 = v10;
LABEL_71:
              char v5 = (int *)((char *)v5 + 7);
LABEL_72:
            }

            else
            {
              uint64_t v19 = 0x3E2F65736C61663CLL;
LABEL_79:
              *(void *)char v5 = v19;
              a5 = v26;
              char v5 = v25 + 2;
              a4 = v24;
            }

            uint64_t v25 = v5;
LABEL_9:
            v9 += 32LL;
            if (!--v7) {
              goto LABEL_82;
            }
            break;
          case 2LL:
            *(void *)char v5 = 0x3E676E697274733CLL;
            v25 += 2;
            if ((xml_copy_string_to_buffer(*(void *)(v9 - 24), *(void *)(v9 - 16), &v24) & 1) == 0) {
              return &unk_189B57778;
            }
            unint64_t v11 = v25;
            a5 = v26;
            a4 = v24;
            *((_BYTE *)v25 + 8) = 62;
            *(void *)unint64_t v11 = *(void *)"</string>";
            char v5 = (int *)((char *)v11 + 9);
            goto LABEL_72;
          case 3LL:
            *((_BYTE *)v5 + 4) = 62;
            *char v5 = 2036689724;
            unint64_t v12 = (char *)v5 + 5;
            uint64_t v25 = (int *)v12;
            if ((xml_copy_string_to_buffer(*(void *)(v9 - 24), *(void *)(v9 - 16), &v24) & 1) == 0) {
              return &unk_189B57778;
            }
            uint64_t v13 = v25;
            a5 = v26;
            a4 = v24;
            *((_WORD *)v25 + 2) = 15993;
            *uint64_t v13 = 1701523260;
            char v5 = (int *)((char *)v13 + 6);
            goto LABEL_72;
          case 4LL:
            *(void *)__str = 0LL;
            uint64_t v28 = 0LL;
            uint64_t v29 = 0LL;
            *((_BYTE *)v5 + 8) = 62;
            *(void *)char v5 = *(void *)"<integer>";
            int v14 = (char *)v5 + 9;
            uint64_t v25 = (int *)v14;
            unsigned int v15 = snprintf(__str, 0x18uLL, "%lld", *(void *)(v9 - 24));
            if (v15 > 0x18) {
              goto LABEL_94;
            }
            unsigned int v16 = v15;
            uint64_t v17 = (char *)v25;
            a5 = v26;
            if (!v16) {
              goto LABEL_49;
            }
            uint64_t v18 = v16;
            memcpy(v25, __str, v16);
            a5 = v26;
            uint64_t v17 = (char *)v25 + v18;
LABEL_49:
            a4 = v24;
            *((_WORD *)v17 + 4) = 15986;
            *(void *)uint64_t v17 = *(void *)"</integer>";
            char v5 = (int *)(v17 + 10);
            goto LABEL_72;
          case 5LL:
            if (*(_BYTE *)(v9 - 8)) {
              goto LABEL_9;
            }
            *(int *)((char *)v5 + 3) = 1048142194;
            int v10 = 1920098620;
            goto LABEL_70;
          case 6LL:
            if (*(_BYTE *)(v9 - 8)) {
              goto LABEL_9;
            }
            uint64_t v19 = 0x3E79617272612F3CLL;
            goto LABEL_79;
          case 7LL:
            *((_WORD *)v5 + 2) = 15988;
            *char v5 = 1667851324;
            char v5 = (int *)((char *)v5 + 6);
            goto LABEL_72;
          case 8LL:
            *(int *)((char *)v5 + 3) = 1047815017;
            *char v5 = 1768173372;
            goto LABEL_71;
          default:
            goto LABEL_9;
        }
      }

LABEL_94:
      __break(0x5519u);
    }
  }

LABEL_82:
  *(void *)char v5 = 0x3E7473696C702F3CLL;
  unint64_t v20 = v25 + 2;
  v25 += 2;
  if ((_BYTE *)v26 == v20) {
    return &unk_189B57778;
  }
  _BYTE *v20 = 0;
  unint64_t v21 = (char *)v25 + 1;
  uint64_t v23 = (*(uint64_t (**)(uint64_t, const char *, ...))(a1 + 32))( a1,  "[%s]: %s\n",  "CESerializeXML",  "critical failure during xml serialization, start != end");
  return (void *)CEContextIsSubset(v23);
}

void *CEContextIsSubset(uint64_t a1, uint64_t a2)
{
  v19[1] = *MEMORY[0x1895F89C0];
  if (!a1 || !a2) {
    return &unk_189B57778;
  }
  __int128 v2 = *(_OWORD *)(a1 + 32);
  v10[1] = *(_OWORD *)(a1 + 16);
  __int128 v11 = v2;
  v10[0] = *(_OWORD *)a1;
  uint64_t v12 = *(void *)(a1 + 48);
  __int128 v3 = *(_OWORD *)(a2 + 32);
  v7[1] = *(_OWORD *)(a2 + 16);
  __int128 v8 = v3;
  v7[0] = *(_OWORD *)a2;
  uint64_t v9 = *(void *)(a2 + 48);
  if (!BYTE1(v11) || !BYTE1(v8)) {
    return &unk_189B577A8;
  }
  memset(v18, 0, sizeof(v18));
  uint64_t v14 = 0LL;
  unsigned int v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  char v17 = 1;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 0x40000000LL;
  v13[2] = __valuesAreAllowed_block_invoke;
  v13[3] = &unk_189B576E8;
  v13[6] = v18;
  v13[7] = v19;
  v13[8] = v18;
  v13[9] = *(void *)&v10[0];
  v13[10] = *(void *)&v10[0] + 64LL;
  v13[11] = *(void *)&v10[0];
  v13[4] = &v14;
  v13[5] = v7;
  v13[12] = v18;
  if ((void *)der_vm_iterate_b((uint64_t)v10, (uint64_t)v13) == Errors)
  {
    int v6 = *((unsigned __int8 *)v15 + 24);
    _Block_object_dispose(&v14, 8);
    if (v6)
    {
      __int128 v4 = &kCENoError;
      return *v4;
    }
  }

  else
  {
    *((_BYTE *)v15 + 24) = 0;
    _Block_object_dispose(&v14, 8);
  }

  __int128 v4 = &kCEQueryCannotBeSatisfied;
  return *v4;
}

uint64_t __valuesAreAllowed_block_invoke(void *a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 72);
  __int128 v73 = *(_OWORD *)(a2 + 56);
  __int128 v74 = v4;
  __int128 v75 = *(_OWORD *)(a2 + 88);
  uint64_t v76 = *(void *)(a2 + 104);
  der_vm_execute_nocopy((unint64_t)&v73, (size_t *)CESelectKeyOperation, (uint64_t)v71);
  unint64_t v5 = v71[0];
  __int128 v68 = v72;
  __int128 v73 = 0uLL;
  if ((ccder_blob_decode_range() & 1) == 0) {
    goto LABEL_96;
  }
  unint64_t v5 = *((void *)&v73 + 1);
  size_t v61 = v73;
  __int128 v69 = 0u;
  memset(v70, 0, sizeof(v70));
  __int128 v68 = 0u;
  __int128 v6 = *(_OWORD *)(a2 + 72);
  __int128 v73 = *(_OWORD *)(a2 + 56);
  __int128 v74 = v6;
  __int128 v75 = *(_OWORD *)(a2 + 88);
  uint64_t v76 = *(void *)(a2 + 104);
  der_vm_execute_nocopy((unint64_t)&v73, (size_t *)CESelectValueOperation, (uint64_t)&v68);
  __int128 v66 = 0u;
  memset(v67, 0, 24);
  __int128 v65 = 0u;
  uint64_t v7 = (size_t *)a1[6];
  __int128 v8 = (__int128 *)a1[5];
  *uint64_t v7 = 0x4000000000000009LL;
  v7[1] = v61;
  _OWORD v7[2] = v5 - v61;
  __int128 v9 = *v8;
  __int128 v10 = v8[1];
  __int128 v11 = v8[2];
  uint64_t v76 = *((void *)v8 + 6);
  __int128 v74 = v10;
  __int128 v75 = v11;
  __int128 v73 = v9;
  der_vm_execute_nocopy((unint64_t)&v73, v7, (uint64_t)&v65);
  if (!BYTE1(v67[0]))
  {
    unint64_t v21 = a1[9];
    unint64_t v22 = a1[10];
    if (v21 + 64 > v22 || a1[11] > v21) {
      goto LABEL_100;
    }
    uint64_t v23 = *(void (**)(unint64_t, const char *, uint64_t, uint64_t, uint64_t))(v21 + 24);
    if (!v23) {
      goto LABEL_14;
    }
    if (v21 >= v22) {
      goto LABEL_100;
    }
    unint64_t v24 = "[%s]: subset validation failed, key not found in the superset '%.*s'\n";
LABEL_13:
    v23(v21, v24, v12, v13, v14);
LABEL_14:
    unint64_t v5 = 0LL;
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 0;
    return v5;
  }

  uint64_t v15 = *((void *)&v66 + 1);
  *(void *)&__int128 v77 = 0LL;
  __int128 v73 = *(_OWORD *)((char *)v67 + 8);
  if (v15 == (void)v77)
  {
LABEL_7:
    int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    int v19 = 1;
    int v20 = 1;
    goto LABEL_23;
  }

  if ((uint64_t)v77 > 0x200000000000000FLL)
  {
    if ((void)v77 == 0x6000000000000010LL || (void)v77 == 0x2000000000000010LL)
    {
      int v16 = 0;
      int v18 = 0;
      int v19 = 0;
      int v20 = 2;
      int v17 = 1;
      goto LABEL_23;
    }

LABEL_23:
  int v59 = v18;
  int v60 = v17;
  unint64_t v5 = *((void *)&v69 + 1);
  *(void *)&__int128 v77 = 0LL;
  int v58 = v20;
  int v57 = v19;
  if (!v70[1]) {
    goto LABEL_36;
  }
  __int128 v73 = *(_OWORD *)&v70[8];
  if (v5 != (void)v77)
  {
    if ((uint64_t)v77 <= 0x200000000000000FLL)
    {
      int v25 = 0;
      char v27 = 0;
      int v28 = 0;
      int v29 = 0;
      int v30 = 5;
      int v26 = 1;
      switch((uint64_t)v77)
      {
        case 1LL:
          goto LABEL_37;
        case 2LL:
          int v25 = 0;
          int v26 = 0;
          int v28 = 0;
          int v29 = 0;
          int v30 = 3;
          char v27 = 1;
          break;
        case 3LL:
        case 5LL:
        case 6LL:
        case 7LL:
        case 8LL:
        case 9LL:
        case 10LL:
        case 11LL:
          goto LABEL_36;
        case 4LL:
          int v25 = 0;
          int v26 = 0;
          char v27 = 0;
          int v28 = 0;
          int v29 = 0;
          int v30 = 6;
          break;
        case 12LL:
          int v26 = 0;
          char v27 = 0;
          int v28 = 0;
          int v29 = 0;
          int v30 = 4;
          int v25 = 1;
          break;
        default:
          if ((void)v77 != 0xA000000000000010LL) {
            goto LABEL_36;
          }
          goto LABEL_26;
      }

      goto LABEL_37;
    }

    if ((void)v77 == 0x6000000000000010LL || (void)v77 == 0x2000000000000010LL)
    {
      int v25 = 0;
      int v26 = 0;
      char v27 = 0;
      int v29 = 0;
      int v30 = 2;
      int v28 = 1;
      goto LABEL_37;
    }

LABEL_36:
    int v25 = 0;
    int v26 = 0;
    char v27 = 0;
    int v28 = 0;
    int v29 = 0;
    int v30 = 0;
    goto LABEL_37;
  }

LABEL_26:
  int v25 = 0;
  int v26 = 0;
  char v27 = 0;
  int v28 = 0;
  int v29 = 1;
  int v30 = 1;
LABEL_37:
  if (v16)
  {
    unint64_t v31 = a1[6];
    if (v31 >= a1[7] || v31 < a1[8]) {
      goto LABEL_100;
    }
    int v32 = v25;
    int v33 = v16;
    int v34 = v26;
    *(void *)unint64_t v31 = 3LL;
    *(_BYTE *)(v31 + 8) = 42;
    unint64_t v5 = 1LL;
    *(void *)(v31 + 248) = 1LL;
    __int128 v73 = v65;
    __int128 v74 = v66;
    __int128 v75 = v67[0];
    uint64_t v76 = *(void *)&v67[1];
    int v35 = v30;
    der_vm_execute_nocopy((unint64_t)&v73, (size_t *)v31, (uint64_t)v64);
    int v30 = v35;
    int v26 = v34;
    int v16 = v33;
    int v25 = v32;
    if (v64[33]) {
      return v5;
    }
  }

  if (((v60 | v16) & v25) != 1)
  {
    if ((v59 & v26) == 1)
    {
      __int128 v73 = v65;
      __int128 v74 = v66;
      __int128 v75 = v67[0];
      uint64_t v76 = *(void *)&v67[1];
      unint64_t v5 = der_vm_BOOL_from_context((unint64_t *)&v73);
      __int128 v73 = v68;
      __int128 v74 = v69;
      __int128 v75 = *(_OWORD *)v70;
      uint64_t v76 = *(void *)&v70[16];
      *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = v5 ^ der_vm_BOOL_from_context((unint64_t *)&v73) ^ 1;
      if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
      {
        unint64_t v42 = a1[9];
        unint64_t v46 = a1[10];
        if (v42 + 64 > v46 || a1[11] > v42) {
          goto LABEL_100;
        }
        uint64_t v44 = *(void (**)(unint64_t, const char *, uint64_t, uint64_t, uint64_t))(v42 + 24);
        if (v44)
        {
          if (v42 < v46)
          {
            uint64_t v45 = "[%s]: subset validation failed, BOOL value of key '%.*s' not allowed\n";
            goto LABEL_92;
          }

          goto LABEL_100;
        }

        return 0LL;
      }

      return 1LL;
    }

    char v47 = v27 ^ 1;
    if ((v58 & 6) != 2) {
      char v47 = 1;
    }
    if ((v47 & 1) == 0)
    {
      unint64_t v5 = a1[6];
      if (v5 && (v5 >= a1[7] || v5 < a1[8])) {
        goto LABEL_100;
      }
      __int128 v73 = v68;
      __int128 v74 = v69;
      __int128 v75 = *(_OWORD *)v70;
      uint64_t v76 = *(void *)&v70[16];
      uint64_t v48 = der_vm_integer_from_context((unint64_t *)&v73);
      *(void *)unint64_t v5 = 10LL;
      *(void *)(v5 + 8) = v48;
      __int128 v73 = v65;
      __int128 v74 = v66;
      __int128 v75 = v67[0];
      uint64_t v76 = *(void *)&v67[1];
      der_vm_execute_nocopy((unint64_t)&v73, (size_t *)v5, (uint64_t)v62);
      *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = v62[33];
      if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
      {
        unint64_t v42 = a1[9];
        unint64_t v49 = a1[10];
        if (v42 + 64 > v49 || a1[11] > v42) {
          goto LABEL_100;
        }
        uint64_t v44 = *(void (**)(unint64_t, const char *, uint64_t, uint64_t, uint64_t))(v42 + 24);
        if (v44)
        {
          if (v42 < v49)
          {
            uint64_t v45 = "[%s]: subset validation failed, integer value of key '%.*s' not allowed\n";
            goto LABEL_92;
          }

          goto LABEL_100;
        }

        return 0LL;
      }

      return 1LL;
    }

    if ((v60 & v28) == 1)
    {
      uint64_t v50 = a1[12];
      *(void *)&__int128 v77 = 0LL;
      *((void *)&v77 + 1) = &v77;
      uint64_t v78 = 0x2000000000LL;
      char v79 = 1;
      *(void *)&__int128 v73 = MEMORY[0x1895F87A8];
      *((void *)&v73 + 1) = 0x40000000LL;
      *(void *)&__int128 v74 = __valueArrayIsAllowed_block_invoke;
      *((void *)&v74 + 1) = &unk_189B57738;
      *(void *)&__int128 v75 = &v77;
      *((void *)&v75 + 1) = &v65;
      uint64_t v76 = v50;
      if ((void *)der_vm_iterate_b((uint64_t)&v68, (uint64_t)&v73) == Errors)
      {
        unint64_t v5 = *(unsigned __int8 *)(*((void *)&v77 + 1) + 24LL) != 0;
      }

      else
      {
        unint64_t v5 = 0LL;
        *(_BYTE *)(*((void *)&v77 + 1) + 24LL) = 0;
      }

      _Block_object_dispose(&v77, 8);
      *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = v5;
      if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
      {
        unint64_t v42 = a1[9];
        unint64_t v52 = a1[10];
        if (v42 + 64 > v52 || a1[11] > v42) {
          goto LABEL_100;
        }
        uint64_t v44 = *(void (**)(unint64_t, const char *, uint64_t, uint64_t, uint64_t))(v42 + 24);
        if (v44)
        {
          if (v42 < v52)
          {
            uint64_t v45 = "[%s]: subset validation failed, string array of key '%.*s' not allowed\n";
            goto LABEL_92;
          }

          goto LABEL_100;
        }

        return 0LL;
      }

      return 1LL;
    }

    if ((v57 & v29) == 1)
    {
      *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = valuesAreAllowed((uint64_t *)&v68, (uint64_t)&v65, a1[12]);
      return *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) != 0;
    }

    if (v58 == v30) {
      goto LABEL_14;
    }
    unint64_t v21 = a1[9];
    unint64_t v51 = a1[10];
    if (v21 + 64 > v51 || a1[11] > v21) {
      goto LABEL_100;
    }
    uint64_t v23 = *(void (**)(unint64_t, const char *, uint64_t, uint64_t, uint64_t))(v21 + 24);
    if (!v23) {
      goto LABEL_14;
    }
    if (v21 >= v51) {
      goto LABEL_100;
    }
    unint64_t v24 = "[%s]: subset validation failed, type mismatch for key '%.*s' %lu != %lu \n";
    goto LABEL_13;
  }

  unint64_t v5 = v68;
  __int128 v77 = *(_OWORD *)&v70[8];
  __int128 v73 = 0uLL;
  if ((ccder_blob_decode_range() & 1) == 0) {
    goto LABEL_96;
  }
  __int128 v36 = (size_t *)a1[6];
  size_t v37 = v73;
  size_t v38 = *((void *)&v73 + 1) - v73;
  *__int128 v36 = 0x4000000000000006LL;
  v36[1] = v37;
  v36[2] = v38;
  __int128 v73 = v65;
  __int128 v74 = v66;
  __int128 v75 = v67[0];
  uint64_t v76 = *(void *)&v67[1];
  der_vm_execute_nocopy((unint64_t)&v73, v36, (uint64_t)v63);
  *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = v63[33];
  if (*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL)) {
    return *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) != 0;
  }
  unint64_t v5 = v68;
  __int128 v77 = *(_OWORD *)&v70[8];
  __int128 v73 = 0uLL;
  if ((ccder_blob_decode_range() & 1) == 0)
  {
LABEL_96:
    v54 = *(void (**)(unint64_t, const char *, ...))(v5 + 24);
    if (v54) {
      v54(v5, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
    }
    if (!v5 || v5 < v5 + 64) {
      goto LABEL_101;
    }
    goto LABEL_100;
  }

  unint64_t v42 = a1[9];
  unint64_t v43 = a1[10];
  if (v42 + 64 <= v43 && a1[11] <= v42)
  {
    uint64_t v44 = *(void (**)(unint64_t, const char *, uint64_t, uint64_t, uint64_t))(v42 + 24);
    if (v44)
    {
      if (v42 < v43)
      {
        uint64_t v45 = "[%s]: subset validation failed, key %.*s with value '%.*s' not allowed\n";
LABEL_92:
        v44(v42, v45, v39, v40, v41);
        return *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) != 0;
      }

      goto LABEL_100;
    }

    return *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) != 0;
  }

  __break(0x5519u);
LABEL_27:
  uint64_t v14 = (*(uint64_t (**)(unint64_t, const char *, ...))(v7 + 32))( v7,  "[%s]: %s\n",  "der_vm_integer_from_context",  "Attempting to select an integer value from a non-integer DER object");
  return der_vm_string_is_allowed_for_key(v14, v15);
}

LABEL_100:
  __break(0x5519u);
LABEL_101:
  v55 = (void *)(*(uint64_t (**)(unint64_t, const char *, ...))(v5 + 32))( v5,  "[%s]: %s\n",  "der_vm_string_from_context",  "Attempting to select a string value from a non-string DER object");
  return __valueArrayIsAllowed_block_invoke(v55, v56);
}

uint64_t __valueArrayIsAllowed_block_invoke(void *a1, uint64_t a2)
{
  int v3 = *(_DWORD *)(a2 + 116);
  switch(v3)
  {
    case 1:
      *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 0;
      v25[0] = MEMORY[0x1895F87A8];
      v25[1] = 0x40000000LL;
      v25[2] = __valueArrayIsAllowed_block_invoke_2;
      v25[3] = &unk_189B57710;
      uint64_t v13 = a1[5];
      uint64_t v14 = a1[6];
      v25[5] = a2;
      v25[6] = v14;
      v25[4] = a1[4];
      der_vm_iterate_b(v13, (uint64_t)v25);
      return *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) != 0;
    case 3:
      __int128 v15 = *(_OWORD *)(a2 + 72);
      __int128 v27 = *(_OWORD *)(a2 + 56);
      __int128 v28 = v15;
      __int128 v29 = *(_OWORD *)(a2 + 88);
      uint64_t v30 = *(void *)(a2 + 104);
      uint64_t v16 = der_vm_integer_from_context((unint64_t *)&v27);
      int v18 = (__int128 *)a1[5];
      int v17 = (size_t *)a1[6];
      *int v17 = 10LL;
      v17[1] = v16;
      __int128 v19 = *v18;
      __int128 v20 = v18[1];
      __int128 v21 = v18[2];
      uint64_t v30 = *((void *)v18 + 6);
      __int128 v28 = v20;
      __int128 v29 = v21;
      __int128 v27 = v19;
      der_vm_execute_nocopy((unint64_t)&v27, v17, (uint64_t)v26);
      char v12 = v26[33];
      goto LABEL_8;
    case 4:
      unint64_t v4 = *(void *)(a2 + 56);
      __int128 v32 = *(_OWORD *)(a2 + 96);
      __int128 v27 = 0uLL;
      if ((ccder_blob_decode_range() & 1) != 0)
      {
        size_t v5 = v27;
        size_t v6 = *((void *)&v27 + 1) - v27;
        __int128 v8 = (__int128 *)a1[5];
        uint64_t v7 = (size_t *)a1[6];
        *uint64_t v7 = 0x4000000000000006LL;
        v7[1] = v5;
        _OWORD v7[2] = v6;
        __int128 v9 = *v8;
        __int128 v10 = v8[1];
        __int128 v11 = v8[2];
        uint64_t v30 = *((void *)v8 + 6);
        __int128 v28 = v10;
        __int128 v29 = v11;
        __int128 v27 = v9;
        der_vm_execute_nocopy((unint64_t)&v27, v7, (uint64_t)v31);
        char v12 = v31[33];
LABEL_8:
        *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = v12;
        return *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) != 0;
      }

      uint64_t v23 = *(void (**)(unint64_t, const char *, ...))(v4 + 24);
      if (v23) {
        v23(v4, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
      }
      if (v4)
      {
        if (v4 >= v4 + 64) {
          __break(0x5519u);
        }
      }

      uint64_t v24 = (*(uint64_t (**)(unint64_t, const char *, ...))(v4 + 32))( v4,  "[%s]: %s\n",  "der_vm_string_from_context",  "Attempting to select a string value from a non-string DER object");
      return valuesAreAllowed(v24);
    default:
      uint64_t result = 0LL;
      *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 0;
      break;
  }

  return result;
}

BOOL valuesAreAllowed(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a1 + 64;
  uint64_t v8 = 0LL;
  __int128 v9 = &v8;
  uint64_t v10 = 0x2000000000LL;
  char v11 = 1;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 0x40000000LL;
  _OWORD v7[2] = __valuesAreAllowed_block_invoke;
  v7[3] = &unk_189B576E8;
  v7[6] = a3;
  v7[7] = a3 + 256;
  v7[8] = a3;
  v7[9] = v3;
  v7[10] = v4;
  v7[11] = v3;
  v7[4] = &v8;
  v7[5] = a2;
  v7[12] = a3;
  if ((void *)der_vm_iterate_b((uint64_t)a1, (uint64_t)v7) == Errors)
  {
    BOOL v5 = *((unsigned __int8 *)v9 + 24) != 0;
  }

  else
  {
    BOOL v5 = 0LL;
    *((_BYTE *)v9 + 24) = 0;
  }

  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __valueArrayIsAllowed_block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t result = 1LL;
  if (*(_DWORD *)(a2 + 116) == 1)
  {
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = *(void *)(v4 + 56);
    uint64_t v9 = 0LL;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2000000000LL;
    char v12 = 1;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 0x40000000LL;
    v8[2] = __valuesAreAllowed_block_invoke;
    v8[3] = &unk_189B576E8;
    v8[6] = v5;
    v8[7] = v5 + 256;
    v8[8] = v5;
    v8[9] = v6;
    v8[10] = v6 + 64;
    v8[11] = v6;
    v8[4] = &v9;
    v8[5] = a2 + 56;
    v8[12] = v5;
    if ((void *)der_vm_iterate_b(v4 + 56, (uint64_t)v8) == Errors)
    {
      int v7 = *((unsigned __int8 *)v10 + 24);
      _Block_object_dispose(&v9, 8);
      uint64_t result = 1LL;
      if (v7)
      {
        *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 1;
        return 0LL;
      }
    }

    else
    {
      *((_BYTE *)v10 + 24) = 0;
      _Block_object_dispose(&v9, 8);
      return 1LL;
    }
  }

  return result;
}

const char *CEGetErrorString(void *a1)
{
  if (a1 >= Errors)
  {
    BOOL v1 = a1 >= qword_189B577B8;
    BOOL v2 = a1 == qword_189B577B8;
  }

  else
  {
    BOOL v1 = 1;
    BOOL v2 = 0;
  }

  if (!v2 && v1) {
    return "Not a CoreEntitlements error!";
  }
  else {
    return (const char *)a1[1];
  }
}

void *CECreateStringOpInplace(void *a1, uint64_t a2, void *__src, size_t __n)
{
  uint64_t v5 = a1;
  *a1 = a2;
  if ((a2 & 0x4000000000000000LL) != 0)
  {
    a1[1] = __src;
    uint64_t v6 = a1 + 2;
  }

  else
  {
    if (__n > 0xEF) {
      return 0LL;
    }
    memcpy(a1 + 1, __src, __n);
    uint64_t v6 = v5 + 31;
  }

  *uint64_t v6 = __n;
  return v5;
}

void *CECreateNumericOpInplace(void *result, uint64_t a2, uint64_t a3)
{
  *uint64_t result = a2;
  result[1] = a3;
  return result;
}

uint64_t der_vm_block_trampoline(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 120);
  BOOL v2 = *(uint64_t (**)(uint64_t, _OWORD *))(v1 + 16);
  __int128 v3 = *(_OWORD *)(a1 + 80);
  v8[4] = *(_OWORD *)(a1 + 64);
  v8[5] = v3;
  __int128 v4 = *(_OWORD *)(a1 + 112);
  v8[6] = *(_OWORD *)(a1 + 96);
  v8[7] = v4;
  __int128 v5 = *(_OWORD *)(a1 + 16);
  v8[0] = *(_OWORD *)a1;
  v8[1] = v5;
  __int128 v6 = *(_OWORD *)(a1 + 48);
  v8[2] = *(_OWORD *)(a1 + 32);
  v8[3] = v6;
  return v2(v1, v8);
}

void *CESizeDeserialization(uint64_t a1, void *a2)
{
  *a2 = 0LL;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 0x40000000LL;
  v6[2] = __CESizeDeserialization_block_invoke;
  v6[3] = &__block_descriptor_tmp_60;
  v6[4] = a2;
  __int128 v2 = *(_OWORD *)(a1 + 16);
  v4[0] = *(_OWORD *)a1;
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  return emitSerializationElement((unint64_t)v4, (uint64_t)v6);
}

uint64_t __CESizeDeserialization_block_invoke(uint64_t result)
{
  return result;
}

void *emitSerializationElement(unint64_t a1, uint64_t a2)
{
  if (!*(_BYTE *)(a1 + 33)) {
    return &unk_189B57778;
  }
  uint64_t v28 = 0LL;
  __int128 v29 = &v28;
  uint64_t v30 = 0x2000000000LL;
  unint64_t v31 = Errors;
  *(void *)&__int128 v32 = 0LL;
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 24);
  __int128 v22 = *(_OWORD *)(a1 + 40);
  if (v5 == (void)v32) {
    goto LABEL_4;
  }
  if ((uint64_t)v32 <= 11)
  {
    switch((void)v32)
    {
      case 0xA000000000000010LL:
LABEL_4:
        __int128 v23 = 0uLL;
        __int128 v6 = *(void (**)(uint64_t, __int128 *))(a2 + 16);
        __int128 v22 = 7uLL;
        v6(a2, &v22);
        if (a1 + 56 >= a1)
        {
          v27[0] = MEMORY[0x1895F87A8];
          v27[1] = 0x40000000LL;
          v27[2] = __emitSerializationElement_block_invoke;
          v27[3] = &unk_189B57838;
          v27[4] = a2;
          v27[5] = &v28;
          der_vm_iterate_b(a1, (uint64_t)v27);
          __int128 v23 = 0uLL;
          int v7 = *(void (**)(uint64_t, __int128 *))(a2 + 16);
          uint64_t v8 = 8LL;
LABEL_17:
          __int128 v22 = (unint64_t)v8;
LABEL_18:
          v7(a2, &v22);
          break;
        }

        goto LABEL_29;
      case 1LL:
        __int128 v14 = *(_OWORD *)(a1 + 16);
        __int128 v22 = *(_OWORD *)a1;
        __int128 v23 = v14;
        __int128 v24 = *(_OWORD *)(a1 + 32);
        uint64_t v25 = *(void *)(a1 + 48);
        unsigned int v15 = der_vm_BOOL_from_context((unint64_t *)&v22);
        int v7 = *(void (**)(uint64_t, __int128 *))(a2 + 16);
        *(void *)&__int128 v22 = 1LL;
        *((void *)&v22 + 1) = v15;
        goto LABEL_22;
      case 2LL:
        __int128 v10 = *(_OWORD *)(a1 + 16);
        __int128 v22 = *(_OWORD *)a1;
        __int128 v23 = v10;
        __int128 v24 = *(_OWORD *)(a1 + 32);
        uint64_t v25 = *(void *)(a1 + 48);
        uint64_t v11 = der_vm_integer_from_context((unint64_t *)&v22);
        int v7 = *(void (**)(uint64_t, __int128 *))(a2 + 16);
        *(void *)&__int128 v22 = 4LL;
        *((void *)&v22 + 1) = v11;
LABEL_22:
        *(void *)&__int128 v23 = 0LL;
        BYTE8(v23) = 0;
        goto LABEL_18;
    }

LABEL_19:
    uint64_t v9 = v29[3];
    _Block_object_dispose(&v28, 8);
    return (void *)v9;
  }

  if ((void)v32 != 12LL)
  {
    if ((void)v32 != 0x2000000000000010LL && (void)v32 != 0x6000000000000010LL) {
      goto LABEL_19;
    }
    __int128 v23 = 0uLL;
    char v12 = *(void (**)(uint64_t, __int128 *))(a2 + 16);
    __int128 v22 = 5uLL;
    v12(a2, &v22);
    if (a1 + 56 >= a1)
    {
      v26[0] = MEMORY[0x1895F87A8];
      v26[1] = 0x40000000LL;
      v26[2] = __emitSerializationElement_block_invoke_2;
      v26[3] = &unk_189B57860;
      v26[4] = a2;
      v26[5] = &v28;
      der_vm_iterate_b(a1, (uint64_t)v26);
      __int128 v23 = 0uLL;
      int v7 = *(void (**)(uint64_t, __int128 *))(a2 + 16);
      uint64_t v8 = 6LL;
      goto LABEL_17;
    }

    goto LABEL_29;
  }

  unint64_t v5 = *(void *)a1;
  __int128 v32 = *(_OWORD *)(a1 + 40);
  __int128 v22 = 0uLL;
  if ((ccder_blob_decode_range() & 1) != 0)
  {
    uint64_t v16 = v22;
    uint64_t v17 = *((void *)&v22 + 1) - v22;
    int v18 = *(void (**)(uint64_t, __int128 *))(a2 + 16);
    *(void *)&__int128 v22 = 2LL;
    *((void *)&v22 + 1) = v16;
    *(void *)&__int128 v23 = v17;
    BYTE8(v23) = 0;
    v18(a2, &v22);
    goto LABEL_19;
  }

  __int128 v19 = *(void (**)(unint64_t, const char *, ...))(v5 + 24);
  if (v19) {
    v19(v5, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
  }
  if (v5 && v5 >= v5 + 64) {
LABEL_29:
  }
    __break(0x5519u);
  uint64_t v20 = (*(uint64_t (**)(unint64_t, const char *, ...))(v5 + 32))( v5,  "[%s]: %s\n",  "der_vm_string_from_context",  "Attempting to select a string value from a non-string DER object");
  return (void *)__emitSerializationElement_block_invoke(v20, v21);
}

  uint64_t v17 = (*(uint64_t (**)(unint64_t, const char *, ...))(v1 + 32))( v1,  "[%s]: %s\n",  "der_vm_string_from_context",  "Attempting to select a string value from a non-string DER object");
  return CEQueryContextToCFDictionary(v17);
}

uint64_t __emitSerializationElement_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
  __int128 v26 = 5uLL;
  __int128 v27 = 0uLL;
  v4();
  __int128 v27 = 0u;
  memset(v28, 0, 24);
  __int128 v26 = 0u;
  __int128 v5 = *(_OWORD *)(a2 + 72);
  __int128 v22 = *(_OWORD *)(a2 + 56);
  __int128 v23 = v5;
  __int128 v24 = *(_OWORD *)(a2 + 88);
  uint64_t v25 = *(void *)(a2 + 104);
  der_vm_execute_nocopy((unint64_t)&v22, (size_t *)CESelectKeyOperation, (uint64_t)&v26);
  unint64_t v6 = v26;
  __int128 v18 = *(_OWORD *)((char *)v28 + 8);
  __int128 v22 = 0uLL;
  if ((ccder_blob_decode_range() & 1) != 0)
  {
    int v7 = (__int128 *)(a2 + 56);
    uint64_t v8 = v22;
    uint64_t v9 = *((void *)&v22 + 1) - v22;
    __int128 v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
    *(void *)&__int128 v22 = 3LL;
    *((void *)&v22 + 1) = v8;
    *(void *)&__int128 v23 = v9;
    BYTE8(v23) = 0;
    v10();
    uint64_t v25 = 0LL;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v22 = 0u;
    __int128 v11 = v7[1];
    __int128 v18 = *v7;
    __int128 v19 = v11;
    __int128 v20 = v7[2];
    uint64_t v21 = *((void *)v7 + 6);
    der_vm_execute_nocopy((unint64_t)&v18, (size_t *)CESelectValueOperation, (uint64_t)&v22);
    uint64_t v12 = *(void *)(a1 + 32);
    __int128 v18 = v22;
    __int128 v19 = v23;
    __int128 v20 = v24;
    uint64_t v21 = v25;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = emitSerializationElement(&v18, v12);
    uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (v13 == Errors)
    {
      __int128 v14 = *(void (**)(void))(*(void *)(a1 + 32) + 16LL);
      __int128 v18 = 6uLL;
      __int128 v19 = 0uLL;
      v14();
    }

    return v13 == Errors;
  }

  else
  {
    uint64_t v16 = *(void (**)(unint64_t, const char *, ...))(v6 + 24);
    if (v16) {
      v16(v6, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
    }
    if (v6 && v6 >= v6 + 64) {
      __break(0x5519u);
    }
    uint64_t v17 = (*(uint64_t (**)(unint64_t, const char *, ...))(v6 + 32))( v6,  "[%s]: %s\n",  "der_vm_string_from_context",  "Attempting to select a string value from a non-string DER object");
    return __emitSerializationElement_block_invoke_2(v17);
  }

BOOL __emitSerializationElement_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 72);
  v6[0] = *(_OWORD *)(a2 + 56);
  v6[1] = v4;
  v6[2] = *(_OWORD *)(a2 + 88);
  uint64_t v7 = *(void *)(a2 + 104);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = emitSerializationElement(v6, v3);
  return *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) == (void)Errors;
}

void *CEDeserialize(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v9[0] = 0LL;
  v9[1] = v9;
  v9[2] = 0x2000000000LL;
  _OWORD v9[3] = 0LL;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 0x40000000LL;
  v8[2] = __CEDeserialize_block_invoke;
  v8[3] = &unk_189B57810;
  v8[4] = v9;
  v8[5] = a3;
  v8[6] = a1;
  v8[7] = a2;
  __int128 v3 = *(_OWORD *)(a1 + 16);
  v6[0] = *(_OWORD *)a1;
  v6[1] = v3;
  v6[2] = *(_OWORD *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 48);
  __int128 v4 = emitSerializationElement((unint64_t)v6, (uint64_t)v8);
  _Block_object_dispose(v9, 8);
  return v4;
}

uint64_t __CEDeserialize_block_invoke(uint64_t result, _OWORD *a2)
{
  unint64_t v2 = *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL);
  if (v2 >= *(void *)(result + 40))
  {
    uint64_t result = (*(uint64_t (**)(void, const char *, ...))(**(void **)(result + 48) + 32LL))( **(void **)(result + 48),  "[%s]: %s\n",  "CEDeserialize_block_invoke",  "CEDeserialization length mismatch");
  }

  else
  {
    unint64_t v3 = *(void *)(result + 56);
    __int128 v4 = (_OWORD *)(v3 + 32 * v2);
    if ((unint64_t)v4 >= v3)
    {
      __int128 v5 = a2[1];
      *__int128 v4 = *a2;
      v4[1] = v5;
      ++*(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL);
      return result;
    }
  }

  __break(0x5519u);
  return result;
}

unint64_t xml_copy_string_to_buffer(unint64_t result, uint64_t a2, unint64_t *a3)
{
  if (!a2) {
    return 1LL;
  }
  unint64_t v3 = result + a2;
  __int128 v4 = (_BYTE *)result;
  while ((unint64_t)v4 < v3 && (unint64_t)v4 >= result)
  {
    switch(*v4)
    {
      case '""':
        unint64_t v5 = a3[1];
        unint64_t v6 = a3[2];
        if (v6 - v5 < 6) {
          return 0LL;
        }
        if (v5 > v6 || *a3 > v5) {
          goto LABEL_37;
        }
        *(_WORD *)(v5 + 4) = 15220;
        *(_DWORD *)unint64_t v5 = 1869967654;
        goto LABEL_22;
      case '&':
        unint64_t v11 = a3[1];
        unint64_t v12 = a3[2];
        if (v12 - v11 < 5) {
          return 0LL;
        }
        if (v11 > v12 || *a3 > v11) {
          goto LABEL_37;
        }
        *(_BYTE *)(v11 + 4) = 59;
        *(_DWORD *)unint64_t v11 = 1886216486;
        unint64_t v9 = a3[2];
        unint64_t v10 = a3[1] + 5;
        goto LABEL_32;
      case '\'':
        unint64_t v13 = a3[1];
        unint64_t v14 = a3[2];
        if (v14 - v13 < 6) {
          return 0LL;
        }
        if (v13 > v14 || *a3 > v13) {
          goto LABEL_37;
        }
        *(_WORD *)(v13 + 4) = 15219;
        *(_DWORD *)unint64_t v13 = 1869635878;
LABEL_22:
        unint64_t v9 = a3[2];
        unint64_t v10 = a3[1] + 6;
        goto LABEL_32;
      case '<':
        unsigned int v15 = (_DWORD *)a3[1];
        unint64_t v16 = a3[2];
        *unsigned int v15 = 997485606;
        goto LABEL_31;
      case '>':
        uint64_t v17 = (_DWORD *)a3[1];
        unint64_t v18 = a3[2];
        *uint64_t v17 = 997484326;
LABEL_31:
        unint64_t v9 = a3[2];
        unint64_t v10 = a3[1] + 4;
        goto LABEL_32;
      default:
        uint64_t v7 = (_BYTE *)a3[1];
        uint64_t v8 = (_BYTE *)a3[2];
        if (v8 == v7) {
          return 0LL;
        }
        *uint64_t v7 = *v4;
        unint64_t v9 = a3[2];
        unint64_t v10 = a3[1] + 1;
LABEL_32:
        if (v10 > v9 || *a3 > v10) {
          goto LABEL_37;
        }
        a3[1] = v10;
        ++v4;
        if (!--a2) {
          return 1LL;
        }
        break;
    }
  }

LABEL_37:
  __break(0x5519u);
  return result;
}

void *xml_size_dictionary(void *result, unint64_t *a2, void *a3)
{
  unint64_t v5 = result;
  uint64_t v6 = 0LL;
  unint64_t v8 = *a2;
  unint64_t v7 = a2[1];
  if (*a2 >= v7) {
    return &unk_189B57798;
  }
LABEL_2:
  unint64_t v9 = (void *)(v8 + 32);
  *a2 = (unint64_t)v9;
  if (v8)
  {
    if (*(void *)v8 != 5LL)
    {
      if (*(void *)v8 == 8LL)
      {
        *a3 = v6 + 13;
        v5[2] = v6;
        return Errors;
      }

      return &unk_189B57798;
    }

    *(_BYTE *)(v8 + 24) = 1;
    if ((unint64_t)v9 < v7)
    {
      unint64_t v10 = v8 + 64;
      if (v8 + 64 <= v7 && (unint64_t)v9 <= v10)
      {
        *a2 = v10;
        if (v8 != -32LL && *v9 == 3LL)
        {
          uint64_t v11 = *(void *)(v8 + 48);
          if (v11)
          {
            if ((unint64_t)v9 < v10)
            {
              uint64_t v12 = 0LL;
              unint64_t v13 = *(_BYTE **)(v8 + 40);
              unint64_t v14 = (unint64_t)&v13[v11];
              unsigned int v15 = v13;
              while ((unint64_t)v15 < v14 && v15 >= v13)
              {
                uint64_t v16 = 5LL;
                switch(*v15)
                {
                  case '""':
                  case '\'':
                    uint64_t v16 = 6LL;
                    break;
                  case '&':
                    break;
                  case '<':
                  case '>':
                    uint64_t v16 = 4LL;
                    break;
                  default:
                    uint64_t v16 = 1LL;
                    break;
                }

                v12 += v16;
                ++v15;
                if (!--v11)
                {
                  uint64_t result = 0LL;
                  uint64_t v21 = 0LL;
                  if (v10 < v7)
                  {
                    unint64_t v17 = v8 + 96;
                    if (v8 + 96 > v7 || v10 > v17) {
                      goto LABEL_35;
                    }
                    *a2 = v17;
                    uint64_t result = (void *)(v8 + 64);
                  }

                  uint64_t result = xml_size_element(result, (uint64_t)a2, &v21);
                  if (result != Errors) {
                    return result;
                  }
                  unint64_t v18 = *a2;
                  unint64_t v7 = a2[1];
                  unint64_t v19 = *a2 + 32;
                  if (v19 <= v7 && v18 <= v19)
                  {
                    *a2 = v19;
                    if (*(void *)v18 == 6LL)
                    {
                      *(_BYTE *)(v18 + 24) = 1;
                      uint64_t v20 = v12 + 11 + v21;
                      *(void *)(v8 + 16) = v20;
                      v6 += v20;
                      unint64_t v8 = v19;
                      if (v19 < v7) {
                        goto LABEL_2;
                      }
                    }

                    return &unk_189B57798;
                  }

                  goto LABEL_35;
                }
              }
            }

            goto LABEL_35;
          }
        }

        return &unk_189B57798;
      }

LABEL_35:
      __break(0x5519u);
      return result;
    }
  }

  return &unk_189B57798;
}

void *xml_size_element(void *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  switch(*a1)
  {
    case 1LL:
      uint64_t v6 = 7LL;
      if (!a1[1]) {
        uint64_t v6 = 8LL;
      }
      a1[2] = v6;
      goto LABEL_31;
    case 2LL:
      uint64_t v7 = a1[2];
      if (v7)
      {
        uint64_t v8 = 0LL;
        unint64_t v9 = (_BYTE *)a1[1];
        unint64_t v10 = (unint64_t)&v9[v7];
        uint64_t v11 = v9;
        do
        {
          uint64_t v12 = 5LL;
          switch(*v11)
          {
            case '""':
            case '\'':
              uint64_t v12 = 6LL;
              break;
            case '&':
              break;
            case '<':
            case '>':
              uint64_t v12 = 4LL;
              break;
            default:
              uint64_t v12 = 1LL;
              break;
          }

          v8 += v12;
          ++v11;
          --v7;
        }

        while (v7);
        uint64_t v6 = v8 + 17;
      }

      else
      {
        uint64_t v6 = 17LL;
      }

LABEL_31:
      *a3 = v6;
      uint64_t result = Errors;
      break;
    case 4LL:
      int v14 = snprintf(__str, 0x20uLL, "%lld", a1[1]);
      a1[2] = v14;
      uint64_t v6 = v14 + 19LL;
      goto LABEL_31;
    case 5LL:
      uint64_t v15 = 0LL;
      while (2)
      {
        uint64_t v16 = *(void **)a2;
        unint64_t v17 = *(void *)(a2 + 8);
        if (*(void *)a2 >= v17) {
          goto LABEL_29;
        }
        unint64_t v18 = v16 + 4;
        *(void *)a2 = v18;
        if (v16)
        {
          if (*v16 == 6LL)
          {
            *a3 = v15 + 15;
            a1[2] = v15;
            uint64_t result = Errors;
          }

          else
          {
            *(void *)__str = 0LL;
            if (v16 >= v18) {
LABEL_34:
            }
              __break(0x5519u);
            uint64_t result = (void *)xml_size_element();
            if (result == Errors)
            {
              v15 += *(void *)__str;
              continue;
            }
          }
        }

        else
        {
LABEL_29:
          uint64_t result = &unk_189B57798;
        }

        break;
      }

      break;
    case 7LL:
      return (void *)xml_size_dictionary(a1, a2, a3);
    default:
      return &unk_189B57778;
  }

  return result;
}

uint64_t recursivelyValidateEntitlements(uint64_t result, uint64_t *a2)
{
  unint64_t v2 = *(void *)result;
  unint64_t v3 = *(void *)result + 64LL;
  if (*(int *)(result + 20) > 12)
  {
    __int128 v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
    if (v4)
    {
      if (v2 < v3) {
        goto LABEL_33;
      }
      goto LABEL_95;
    }

    return 0LL;
  }

  uint64_t v21 = 0LL;
  uint64_t v22 = 0LL;
  uint64_t v20 = 0LL;
  if (v2) {
    BOOL v5 = v2 >= v3;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
LABEL_95:
    __break(0x5519u);
    return result;
  }

  uint64_t v6 = result;
  if ((der_decode_next(v2, &v22, &v20, 0LL, a2) & 1) == 0)
  {
    __int128 v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
    if (v4)
    {
LABEL_33:
      unint64_t v16 = v2;
LABEL_34:
      v4(v16, "[%s]: %s\n");
      return 0LL;
    }

    return 0LL;
  }

  if (v22 != *(void *)(v6 + 8))
  {
    switch(v22)
    {
      case 1LL:
        __int128 v26 = 0LL;
        unint64_t v27 = 0LL;
        if ((ccder_blob_decode_range() & 1) != 0)
        {
          if (v27 - (void)v26 == 1) {
            goto LABEL_89;
          }
          __int128 v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4) {
            return 0LL;
          }
        }

        else
        {
          __int128 v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4) {
            return 0LL;
          }
        }

        goto LABEL_33;
      case 2LL:
        __int128 v26 = 0LL;
        unint64_t v27 = 0LL;
        uint64_t result = ccder_blob_decode_range();
        if ((result & 1) == 0)
        {
          __int128 v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4) {
            return 0LL;
          }
          goto LABEL_33;
        }

        unint64_t v18 = v27 - (void)v26;
        if (v27 - (unint64_t)v26 >= 9)
        {
          __int128 v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4) {
            return 0LL;
          }
          goto LABEL_33;
        }

        unint64_t v19 = v26;
        while ((unint64_t)v19 < v27 && v19 >= v26)
        {
          ++v19;
          if (!--v18) {
            goto LABEL_89;
          }
        }

        goto LABEL_95;
      case 3LL:
      case 5LL:
      case 6LL:
      case 7LL:
      case 8LL:
      case 9LL:
      case 10LL:
      case 11LL:
        goto LABEL_51;
      case 4LL:
        if (*(_BYTE *)(v6 + 24))
        {
          __int128 v26 = 0LL;
          unint64_t v27 = 0LL;
          if ((der_decode_data(v2, &v26) & 1) == 0) {
            return 0LL;
          }
          goto LABEL_89;
        }

        __int128 v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
        if (!v4) {
          return 0LL;
        }
        goto LABEL_33;
      case 12LL:
        __int128 v26 = 0LL;
        unint64_t v27 = 0LL;
        if ((ccder_blob_decode_range() & 1) != 0)
        {
          if (!memchr(v26, 0, v27 - (void)v26)) {
            goto LABEL_89;
          }
          __int128 v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4) {
            return 0LL;
          }
        }

        else
        {
          __int128 v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4) {
            return 0LL;
          }
        }

        goto LABEL_33;
      default:
        if (v22 != 0x2000000000000010LL)
        {
LABEL_51:
          __int128 v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
          if (!v4) {
            return 0LL;
          }
          goto LABEL_33;
        }

        unint64_t v7 = *(void *)v6;
        unint64_t v17 = *(void *)v6 + 64LL;
        __int128 v26 = 0LL;
        unint64_t v27 = 0LL;
        uint64_t result = ccder_blob_decode_sequence_tl();
        if ((_DWORD)result)
        {
          do
          {
            ++*(_DWORD *)(v6 + 20);
            uint64_t result = recursivelyValidateEntitlements(v6, &v26);
            --*(_DWORD *)(v6 + 20);
          }

          while ((result & 1) != 0);
          __int128 v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
          if (!v4) {
            return 0LL;
          }
          if (v7 >= v17) {
            goto LABEL_95;
          }
        }

        else
        {
          __int128 v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
          if (!v4) {
            return 0LL;
          }
          if (v7 >= v17) {
            goto LABEL_95;
          }
        }

        break;
    }

    goto LABEL_43;
  }

  unint64_t v7 = *(void *)v6;
  unint64_t v8 = *(void *)v6 + 64LL;
  __int128 v26 = 0LL;
  unint64_t v27 = 0LL;
  uint64_t result = ccder_blob_decode_range();
  if (!(_DWORD)result)
  {
    __int128 v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
    if (!v4) {
      return 0LL;
    }
    if (v7 >= v8) {
      goto LABEL_95;
    }
LABEL_43:
    unint64_t v16 = v7;
    goto LABEL_34;
  }

  if ((unint64_t)v26 < v27)
  {
    unint64_t v9 = 0LL;
    size_t v10 = 0LL;
    while (1)
    {
      __int128 v24 = 0LL;
      size_t v25 = 0LL;
      __int128 v23 = 0uLL;
      uint64_t result = der_decode_key_value(v7, &v24, &v23, &v26);
      if ((result & 1) == 0)
      {
        __int128 v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
        if (!v4) {
          return 0LL;
        }
        if (v7 >= v8) {
          goto LABEL_95;
        }
        goto LABEL_43;
      }

      uint64_t v12 = v24;
      size_t v11 = v25;
      uint64_t result = (uint64_t)memchr(v24, 0, v25);
      if (result)
      {
        __int128 v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
        if (!v4) {
          return 0LL;
        }
        if (v7 >= v8) {
          goto LABEL_95;
        }
        goto LABEL_43;
      }

      if (*(_BYTE *)(v6 + 16) && v9 && v10)
      {
        if (!v12) {
          break;
        }
        size_t v13 = v10 >= v11 ? v11 : v10;
        uint64_t result = memcmp(v9, v12, v13);
        BOOL v14 = v10 != v11 && (_DWORD)result == 0;
        int v15 = (v10 < v11) << 31;
        if (!v14) {
          int v15 = result;
        }
        if ((v15 & 0x80000000) == 0) {
          break;
        }
      }

      ++*(_DWORD *)(v6 + 20);
      uint64_t result = recursivelyValidateEntitlements(v6, &v23);
      --*(_DWORD *)(v6 + 20);
      if ((result & 1) == 0)
      {
        __int128 v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
        if (!v4) {
          return 0LL;
        }
        if (v7 >= v8) {
          goto LABEL_95;
        }
        goto LABEL_43;
      }

      unint64_t v9 = v24;
      size_t v10 = v25;
    }

    __int128 v4 = *(void (**)(unint64_t, const char *))(v7 + 24);
    if (!v4) {
      return 0LL;
    }
    if (v7 < v8) {
      goto LABEL_43;
    }
    goto LABEL_95;
  }

LABEL_89:
  if (v20 != v21)
  {
    __int128 v4 = *(void (**)(unint64_t, const char *))(v2 + 24);
    if (!v4) {
      return 0LL;
    }
    goto LABEL_33;
  }

  return 1LL;
}

uint64_t der_decode_next(uint64_t a1, void *a2, void *a3, void *a4, uint64_t *a5)
{
  uint64_t v11 = *a5;
  uint64_t v10 = a5[1];
  if ((ccder_blob_decode_tag() & 1) == 0)
  {
    size_t v13 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v13)
    {
      BOOL v14 = "could not decode tag for next DER sub-sequence";
LABEL_8:
      v13(a1, "[%s]: %s\n", "der_decode_next", v14);
    }

    return 0LL;
  }

  if ((ccder_blob_decode_len() & 1) == 0)
  {
    size_t v13 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v13)
    {
      BOOL v14 = "could not decode size for next DER sub-sequence";
      goto LABEL_8;
    }

    return 0LL;
  }

  uint64_t v12 = *a5;
  if (a2) {
    *a2 = 0LL;
  }
  if (a3)
  {
    *a3 = v11;
    a3[1] = v12;
  }

  if (a4)
  {
    *a4 = v12;
    a4[1] = v12;
  }

  *a5 = v12;
  a5[1] = v10;
  return 1LL;
}

uint64_t der_decode_data(uint64_t a1, void *a2)
{
  uint64_t v4 = ccder_blob_decode_range();
  if ((v4 & 1) != 0)
  {
    if (a2)
    {
      *a2 = 0LL;
      a2[1] = 0LL;
    }
  }

  else
  {
    BOOL v5 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v5) {
      v5(a1, "[%s]: %s\n", "der_decode_data", "Unknown data encoding");
    }
  }

  return v4;
}

uint64_t CEBuffer_cmp(void *__s1, size_t a2, void *__s2, size_t a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (__s1 && a2)
  {
    if (__s2)
    {
      if (a2 >= a4) {
        size_t v8 = a4;
      }
      else {
        size_t v8 = a2;
      }
      if (a2 < a4) {
        unsigned int v9 = -1;
      }
      else {
        unsigned int v9 = 1;
      }
      LODWORD(result) = memcmp(__s1, __s2, v8);
      if (a2 != a4 && (_DWORD)result == 0) {
        return v9;
      }
      else {
        return result;
      }
    }

    else
    {
      return 1LL;
    }
  }

  return result;
}

uint64_t der_decode_key_value(uint64_t a1, void *a2, _OWORD *a3, void *a4)
{
  if ((ccder_blob_decode_sequence_tl() & 1) != 0)
  {
    if ((ccder_blob_decode_range() & 1) != 0)
    {
      if (a2)
      {
        *a2 = 0LL;
        a2[1] = 0LL;
      }

      else if (MEMORY[8])
      {
        if ((ccder_blob_decode_tag() & 1) == 0)
        {
          size_t v8 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
          if (!v8) {
            return 0LL;
          }
          unsigned int v9 = "unable to decode value tag for key-value pair";
          goto LABEL_12;
        }

        if ((ccder_blob_decode_len() & 1) == 0)
        {
          size_t v8 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
          if (!v8) {
            return 0LL;
          }
          unsigned int v9 = "unable to decode value size for key-value pair";
          goto LABEL_12;
        }

        if (!*a4)
        {
          *a3 = 0uLL;
          return 1LL;
        }

        size_t v8 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
        if (v8)
        {
          unsigned int v9 = "key-value pair contains extra elements";
          goto LABEL_12;
        }

        return 0LL;
      }
    }

    else
    {
      uint64_t v10 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
      if (v10) {
        v10(a1, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
      }
    }

    size_t v8 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v8)
    {
      unsigned int v9 = "dictionary key is not a valid string";
      goto LABEL_12;
    }
  }

  else
  {
    size_t v8 = *(void (**)(uint64_t, const char *, ...))(a1 + 24);
    if (v8)
    {
      unsigned int v9 = "key / value decoding failure";
LABEL_12:
      v8(a1, "[%s]: %s\n", "der_decode_key_value", v9);
    }
  }

  return 0LL;
}

void *der_size_element(void *a1, uint64_t a2, uint64_t *a3)
{
  if (!a1) {
    return &unk_189B57778;
  }
  switch(*a1)
  {
    case 1LL:
      a1[2] = 1LL;
      goto LABEL_28;
    case 2LL:
    case 9LL:
LABEL_28:
      *a3 = ccder_sizeof();
      return Errors;
    case 4LL:
      unint64_t v7 = a1[1];
      unint64_t v8 = HIBYTE(v7);
      if ((HIBYTE(v7) + 1) > 1u)
      {
        uint64_t v14 = 8LL;
      }

      else
      {
        if ((_DWORD)v8 == BYTE6(v7))
        {
          if ((_DWORD)v8 == BYTE5(v7))
          {
            if ((_DWORD)v8 == BYTE4(v7))
            {
              if ((_DWORD)v8 == BYTE3(v7))
              {
                if ((_DWORD)v8 == BYTE2(v7))
                {
                  if (BYTE1(v7) == (_DWORD)v8) {
                    uint64_t v9 = 2LL;
                  }
                  else {
                    uint64_t v9 = 3LL;
                  }
                  uint64_t v10 = 1LL;
                  if (BYTE1(v7) != (_DWORD)v8) {
                    uint64_t v10 = 2LL;
                  }
                }

                else
                {
                  uint64_t v10 = 3LL;
                  uint64_t v9 = 4LL;
                }
              }

              else
              {
                uint64_t v10 = 4LL;
                uint64_t v9 = 5LL;
              }
            }

            else
            {
              uint64_t v10 = 5LL;
              uint64_t v9 = 6LL;
            }
          }

          else
          {
            uint64_t v10 = 6LL;
            uint64_t v9 = 7LL;
          }
        }

        else
        {
          uint64_t v10 = 7LL;
          uint64_t v9 = 8LL;
        }

        else {
          uint64_t v14 = v10;
        }
      }

      *a3 = ccder_sizeof();
      a1[2] = v14;
      return Errors;
    case 5LL:
      goto LABEL_17;
    case 7LL:
      return (void *)der_size_dictionary(a1, a2, a3);
    default:
      return &unk_189B57778;
  }

  while (1)
  {
LABEL_17:
    uint64_t result = *(void **)a2;
    unint64_t v11 = *(void *)(a2 + 8);
    if (*(void *)a2 >= v11) {
      return &unk_189B57798;
    }
    uint64_t v12 = result + 4;
    *(void *)a2 = v12;
    if (!result) {
      return &unk_189B57798;
    }
    if (*result == 6LL)
    {
      *a3 = ccder_sizeof();
      a1[2] = 0LL;
      return Errors;
    }

    if (result >= v12) {
      break;
    }
    uint64_t result = (void *)der_size_element();
    if (result != Errors) {
      return result;
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t der_size_dictionary(uint64_t result, unint64_t *a2, uint64_t *a3)
{
  uint64_t v5 = result;
  uint64_t v6 = 0LL;
  unint64_t v7 = *a2;
  unint64_t v8 = a2[1];
  if (*a2 >= v8) {
    return (uint64_t)&unk_189B57798;
  }
  while (1)
  {
    uint64_t v9 = (void *)(v7 + 32);
    if (v7 + 32 > v8 || v7 > (unint64_t)v9)
    {
LABEL_28:
      __break(0x5519u);
      return result;
    }

    *a2 = (unint64_t)v9;
    if (!v7) {
      return (uint64_t)&unk_189B57798;
    }
    if (*(void *)v7 != 5LL) {
      break;
    }
    *(_BYTE *)(v7 + 24) = 1;
    unint64_t v10 = v7 + 64;
    *a2 = v10;
    if (v7 == -32LL || *v9 != 3LL || !*(void *)(v7 + 48)) {
      return (uint64_t)&unk_189B57798;
    }
    uint64_t v11 = ccder_sizeof();
    uint64_t result = 0LL;
    uint64_t v15 = 0LL;
    if (v10 < v8)
    {
      unint64_t v12 = v7 + 96;
      if (v7 + 96 > v8 || v10 > v12) {
        goto LABEL_28;
      }
      *a2 = v12;
      uint64_t result = v7 + 64;
    }

    uint64_t result = (uint64_t)der_size_element((void *)result, (uint64_t)a2, &v15);
    if ((void *)result != Errors) {
      return result;
    }
    unint64_t v13 = *a2;
    unint64_t v8 = a2[1];
    if (*a2 >= v8) {
      return (uint64_t)&unk_189B57798;
    }
    unint64_t v14 = v13 + 32;
    if (v13 + 32 > v8 || v13 > v14) {
      goto LABEL_28;
    }
    *a2 = v14;
    if (v13)
    {
      if (*(void *)v13 == 6LL)
      {
        *(_BYTE *)(v13 + 24) = 1;
        *(void *)(v7 + 16) = v15 + v11;
        uint64_t result = ccder_sizeof();
        v6 += result;
        unint64_t v7 = v14;
        if (v14 < v8) {
          continue;
        }
      }
    }

    return (uint64_t)&unk_189B57798;
  }

  if (*(void *)v7 != 8LL) {
    return (uint64_t)&unk_189B57798;
  }
  *a3 = ccder_sizeof();
  *(void *)(v5 + 16) = v6;
  return (uint64_t)Errors;
}

uint64_t der_encode_number()
{
  return ccder_blob_reserve_tl();
}

uint64_t der_vm_execute_match_string(uint64_t a1, __int128 *a2, uint64_t a3)
{
  unint64_t v4 = *(void *)a2;
  __int128 v5 = a2[2];
  __int128 v6 = *a2;
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + ++**(void **)(result + 32) = v5;
  *(_OWORD *)a1 = v6;
  *(void *)(a1 + 48) = *((void *)a2 + 6);
  *(_BYTE *)(a1 + 33) = 0;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  if ((*(_BYTE *)(a3 + 7) & 0x40) != 0)
  {
    uint64_t v7 = *(void *)(a3 + 8);
    unint64_t v8 = (uint64_t *)(a3 + 16);
  }

  else
  {
    uint64_t v7 = a3 + 8;
    unint64_t v8 = (uint64_t *)(a3 + 248);
  }

  uint64_t v9 = *v8;
  uint64_t result = ccder_blob_decode_range();
  if ((result & 1) != 0)
  {
    char v11 = 0;
    if (v7 && v9) {
      char v11 = 0;
    }
    if (!v9) {
      char v11 = 1;
    }
    *(_BYTE *)(a1 + 33) = v11;
  }

  else
  {
    unint64_t v12 = *(uint64_t (**)(unint64_t, const char *, ...))(v4 + 24);
    if (v12)
    {
      uint64_t result = v12(v4, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
      unint64_t v13 = *(uint64_t (**)(unint64_t, const char *, ...))(v4 + 24);
      if (v13)
      {
        if (v4 && v4 >= v4 + 64) {
          __break(0x5519u);
        }
        else {
          return v13(v4, "[%s]: %s\n", "der_vm_execute_match_string", "string decode failure");
        }
      }
    }
  }

  return result;
}

uint64_t string_value_allowed_iterate(uint64_t *a1)
{
  unint64_t v2 = (void *)a1[15];
  uint64_t v3 = v2[1];
  if ((*(_BYTE *)(v3 + 7) & 0x40) != 0)
  {
    unint64_t v4 = *(const void **)(v3 + 8);
    __int128 v5 = (size_t *)(v3 + 16);
  }

  else
  {
    unint64_t v4 = (const void *)(v3 + 8);
    __int128 v5 = (size_t *)(v3 + 248);
  }

  if (*((_DWORD *)a1 + 29) != 4)
  {
    uint64_t v8 = *a1;
    uint64_t v9 = *(void (**)(uint64_t, const char *, ...))(*a1 + 24);
    if (v9) {
      v9(v8, "[%s]: %s\n", "string_value_allowed_iterate", "Unexpected type to match against during iteration");
    }
    return 1LL;
  }

  size_t v6 = *v5;
  der_vm_execute_match_string((uint64_t)v17, (__int128 *)(a1 + 7), v3);
  if (v17[33])
  {
    uint64_t result = 0LL;
    *(_BYTE *)(*v2 + 33LL) = 1;
    return result;
  }

  unint64_t v10 = a1[7];
  __int128 v18 = *((_OWORD *)a1 + 6);
  unint64_t v19 = 0LL;
  unint64_t v20 = 0LL;
  if ((ccder_blob_decode_range() & 1) == 0)
  {
    uint64_t v15 = *(void (**)(unint64_t, const char *, ...))(v10 + 24);
    if (v15) {
      v15(v10, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
    }
    if (!v10 || v10 < v10 + 64) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }

  size_t v11 = v20 - (void)v19 - 1;
  unint64_t v12 = (_BYTE *)(v20 - 1);
  if (v20 - 1 >= v20 || v12 < v19)
  {
LABEL_26:
    __break(0x5519u);
LABEL_27:
    uint64_t v16 = (*(uint64_t (**)(unint64_t, const char *, ...))(v10 + 32))( v10,  "[%s]: %s\n",  "der_vm_string_from_context",  "Attempting to select a string value from a non-string DER object");
    return string_prefix_allowed_iterate(v16);
  }

  if (*v12 != 42 || v11 > v6) {
    return 1LL;
  }
  int v14 = memcmp(v19, v4, v11);
  uint64_t result = 1LL;
  if (!v14)
  {
    *(_BYTE *)(*v2 + 33LL) = 1;
    return 0LL;
  }

  return result;
}

uint64_t string_prefix_allowed_iterate(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)a1[15];
  uint64_t v4 = v3[1];
  int v5 = *((_DWORD *)a1 + 29);
  if ((*(_BYTE *)(v4 + 7) & 0x40) == 0)
  {
    if (v5 == 4)
    {
      uint64_t v6 = *(void *)(v4 + 248);
      goto LABEL_6;
    }

LABEL_9:
    uint64_t v8 = *(void (**)(uint64_t, const char *, ...))(v2 + 24);
    if (v8) {
      v8(v2, "[%s]: %s\n", "string_prefix_allowed_iterate", "Unexpected type to match against during iteration");
    }
    return 1LL;
  }

  if (v5 != 4) {
    goto LABEL_9;
  }
  uint64_t v6 = *(void *)(v4 + 16);
LABEL_6:
  unint64_t v7 = a1[7];
  if ((ccder_blob_decode_range() & 1) != 0)
  {
    if (!v6)
    {
LABEL_19:
      uint64_t result = 0LL;
      *(_BYTE *)(*v3 + 33LL) = 1;
      return result;
    }
  }

  else
  {
    uint64_t v9 = *(void (**)(unint64_t, const char *, ...))(v7 + 24);
    if (v9)
    {
      v9(v7, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
      unint64_t v10 = *(void (**)(unint64_t, const char *, ...))(v7 + 24);
      if (v10)
      {
        if (v7 && v7 >= v7 + 64)
        {
LABEL_24:
          __break(0x5519u);
          goto LABEL_25;
        }

        v10(v7, "[%s]: %s\n", "der_vm_execute_match_string_prefix", "string decode failure");
      }
    }
  }

  unint64_t v7 = a1[7];
  if ((ccder_blob_decode_range() & 1) != 0)
  {
    if (v6) {
      return 1LL;
    }
    goto LABEL_19;
  }

  unint64_t v12 = *(void (**)(unint64_t, const char *, ...))(v7 + 24);
  if (v12) {
    v12(v7, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
  }
  if (v7 && v7 >= v7 + 64) {
    goto LABEL_24;
  }
LABEL_25:
  uint64_t v13 = (*(uint64_t (**)(unint64_t, const char *, ...))(v7 + 32))( v7,  "[%s]: %s\n",  "der_vm_string_from_context",  "Attempting to select a string value from a non-string DER object");
  return integer_allowed_iterate(v13);
}

uint64_t integer_allowed_iterate(uint64_t *a1)
{
  if (*((_DWORD *)a1 + 29) != 3)
  {
    uint64_t v5 = *a1;
    uint64_t v6 = *(void (**)(uint64_t, const char *, ...))(v5 + 24);
    if (v6) {
      v6(v5, "[%s]: %s\n", "integer_allowed_iterate", "Unexpected type to match against during iteration");
    }
    return 0LL;
  }

  uint64_t v1 = (void *)a1[15];
  uint64_t v2 = v1[1];
  unint64_t v3 = a1[7];
  uint64_t result = ccder_blob_decode_range();
  if ((result & 1) != 0)
  {
    uint64_t result = 1LL;
    if (!*(void *)(v2 + 8))
    {
      *(_BYTE *)(*v1 + 33LL) = 1;
      return 0LL;
    }
  }

  else
  {
    unint64_t v7 = *(uint64_t (**)(unint64_t, const char *, ...))(v3 + 24);
    if (v7) {
      uint64_t result = v7(v3, "[%s]: %s\n", "der_decode_number", "unknown number encoding");
    }
    uint64_t v8 = *(void (**)(unint64_t, const char *, ...))(v3 + 24);
    if (v8)
    {
      if (v3 && v3 >= v3 + 64)
      {
        __break(0x5519u);
        return result;
      }

      v8(v3, "[%s]: %s\n", "der_vm_execute_match_integer", "BOOL decode failure");
    }

    return 1LL;
  }

  return result;
}

uint64_t der_vm_context_create@<X0>( uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, unint64_t a4@<X3>, unint64_t a5@<X4>, void *a6@<X8>)
{
  *a6 = result;
  a6[3] = a2;
  a6[4] = 256LL;
  *((_BYTE *)a6 + ++**(void **)(result + 32) = a3;
  if (a4 > a5)
  {
    __break(0x5519u);
  }

  else
  {
    a6[5] = a4;
    a6[6] = a5;
    a6[1] = 0LL;
    a6[2] = 0LL;
  }

  return result;
}

unint64_t der_vm_execute_nocopy@<X0>(unint64_t result@<X0>, size_t *a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v3 = result;
  uint64_t v138 = *MEMORY[0x1895F89C0];
  if (!*(_BYTE *)(result + 33))
  {
LABEL_6:
    __int128 v10 = *(_OWORD *)(v3 + 16);
    *(_OWORD *)a3 = *(_OWORD *)v3;
    *(_OWORD *)(a3 + 16) = v10;
    *(_OWORD *)(a3 + ++**(void **)(result + 32) = *(_OWORD *)(v3 + 32);
    uint64_t v11 = *(void *)(v3 + 48);
LABEL_7:
    *(void *)(a3 + 48) = v11;
    return result;
  }

  unint64_t v6 = *(void *)result;
  unint64_t v7 = *(void *)result + 64LL;
  size_t v8 = *a2;
  switch(*a2 & 0xBFFFFFFFFFFFFFFFLL)
  {
    case 0uLL:
      uint64_t v9 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v9) {
        goto LABEL_6;
      }
      if (v6 >= v7) {
        goto LABEL_317;
      }
      uint64_t result = v9(v6, "[%s]: %s\n", "der_vm_execute_nocopy", "noop");
      goto LABEL_6;
    case 1uLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      __int128 v33 = *(_OWORD *)(result + 16);
      __int128 v130 = *(_OWORD *)result;
      __int128 v131 = v33;
      LOBYTE(v1++**(void **)(result + 32) = *(_BYTE *)(result + 32);
      *(_OWORD *)v134 = *(_OWORD *)(result + 34);
      *(void *)&v134[14] = *(void *)(result + 48);
      *((void *)&v130 + 1) = 0LL;
      *(void *)&__int128 v131 = 0LL;
      if ((v8 & 0x4000000000000000LL) != 0)
      {
        __s1 = (void *)a2[1];
        int v34 = a2 + 2;
      }

      else
      {
        __s1 = a2 + 1;
        int v34 = a2 + 31;
      }

      size_t v60 = *v34;
      uint64_t v61 = *(void *)(result + 16);
      if (v61)
      {
        unint64_t v6 = 0LL;
        __int128 v62 = *(_OWORD *)(result + 32);
        *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
        *(_OWORD *)(a3 + ++**(void **)(result + 32) = v62;
        *(_OWORD *)a3 = *(_OWORD *)result;
        uint64_t v63 = *(void *)(result + 40);
        *(void *)(a3 + 48) = *(void *)(result + 48);
        *(_BYTE *)(a3 + 33) = 0;
        unint64_t v64 = v61 - 1;
        *(void *)(a3 + 8) = 0LL;
        *(void *)(a3 + 16) = 0LL;
        if (__s1) {
          BOOL v65 = v60 == 0;
        }
        else {
          BOOL v65 = 1;
        }
        char v66 = v65;
        uint64_t v122 = *(void *)(result + 8);
        uint64_t v123 = v63;
        while (1)
        {
          unint64_t v67 = (v6 + v64) >> 1;
          if ((v66 & 1) != 0) {
            goto LABEL_325;
          }
          unint64_t v68 = *(void *)(v122 + 8 * v67);
          __int128 v69 = (const void *)(v123 + v68);
          if (!v69) {
            goto LABEL_86;
          }
          if (v60 >= HIDWORD(v68)) {
            size_t v70 = HIDWORD(v68);
          }
          else {
            size_t v70 = v60;
          }
          if (v60 < HIDWORD(v68)) {
            int v71 = -1;
          }
          else {
            int v71 = 1;
          }
          uint64_t result = memcmp(__s1, v69, v70);
          if (v60 != HIDWORD(v68) && (_DWORD)result == 0) {
            int v73 = v71;
          }
          else {
            int v73 = result;
          }
          if (!v73)
          {
            *(_BYTE *)(a3 + 33) = 1;
            unint64_t v107 = *(void *)(a3 + 40);
            unint64_t v108 = v107 + (HIDWORD(v68) + v68);
            if (v108 <= *(void *)(a3 + 48) && v107 <= v108)
            {
              *(void *)(a3 + 40) = v108;
              return result;
            }

            while (1)
            {
              do
              {
LABEL_317:
                __break(0x5519u);
LABEL_318:
                v121 = *(void (**)(unint64_t, const char *, ...))(v6 + 24);
                if (v121) {
                  v121(v6, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
                }
              }

              while (v6 && v6 >= v6 + 64);
              (*(void (**)(unint64_t, const char *, ...))(v6 + 32))( v6,  "[%s]: %s\n",  "der_vm_string_from_context",  "Attempting to select a string value from a non-string DER object");
LABEL_316:
              v129[0] = 0LL;
              v129[1] = 0LL;
            }
          }

          if (v73 < 0)
          {
LABEL_325:
            if (v6 + v64 < 2) {
              return result;
            }
            unint64_t v64 = v67 - 1;
            if (v6 > v67 - 1) {
              return result;
            }
          }

          else
          {
LABEL_86:
            unint64_t v6 = v67 + 1;
            if (v67 + 1 > v64) {
              return result;
            }
          }
        }
      }

      v129[0] = 0LL;
      v129[1] = 0LL;
      __int128 v128 = *(_OWORD *)(result + 40);
      uint64_t result = der_decode_next(v6, 0LL, 0LL, v129, (uint64_t *)&v128);
      if ((result & 1) != 0)
      {
        if (v60)
        {
          if (v129[0] < v129[1])
          {
            if (v6 && v6 >= v7) {
              goto LABEL_317;
            }
            while (1)
            {
              __s2 = 0LL;
              size_t v127 = 0LL;
              __int128 v125 = 0uLL;
              uint64_t result = der_decode_key_value(v6, &__s2, &v125, v129);
              if (!(_DWORD)result) {
                break;
              }
              if (__s1 && __s2)
              {
                size_t v82 = v127;
                size_t v83 = v60 >= v127 ? v127 : v60;
                uint64_t result = memcmp(__s1, __s2, v83);
                if (!(_DWORD)result && v60 == v82)
                {
                  *(_OWORD *)&v134[6] = v125;
                  LOBYTE(v85) = 1;
                  goto LABEL_294;
                }
              }

              if (v129[0] >= v129[1]) {
                goto LABEL_254;
              }
            }

            v85 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
            if (v85)
            {
              uint64_t result = v85(v6, "[%s]: %s\n", "der_vm_execute_select_key", "invalid dictionary element");
              LOBYTE(v85) = 0;
            }

LABEL_294:
            __int128 v116 = v131;
            *(_OWORD *)a3 = v130;
            *(_OWORD *)(a3 + 16) = v116;
            *(_BYTE *)(a3 + ++**(void **)(result + 32) = v132;
            *(_BYTE *)(a3 + 33) = (_BYTE)v85;
            goto LABEL_255;
          }

LABEL_254:
          __int128 v110 = v131;
          *(_OWORD *)a3 = v130;
          *(_OWORD *)(a3 + 16) = v110;
          *(_BYTE *)(a3 + ++**(void **)(result + 32) = v132;
          *(_BYTE *)(a3 + 33) = 0;
LABEL_255:
          *(_OWORD *)(a3 + 34) = *(_OWORD *)v134;
          uint64_t v11 = *(void *)&v134[14];
          goto LABEL_7;
        }

        v102 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v102) {
          goto LABEL_254;
        }
        if (v6 && v6 >= v7) {
          goto LABEL_317;
        }
        v103 = "key length is invalid";
      }

      else
      {
        v102 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v102) {
          goto LABEL_254;
        }
        if (v6 && v6 >= v7) {
          goto LABEL_317;
        }
        v103 = "dictionary decoding failure";
      }

      uint64_t result = v102(v6, "[%s]: %s\n", "der_vm_execute_select_key", v103);
      goto LABEL_254;
    case 2uLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      __int128 v19 = *(_OWORD *)(result + 32);
      __int128 v20 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + ++**(void **)(result + 32) = v19;
      *(_OWORD *)a3 = v20;
      *(void *)(a3 + 48) = *(void *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      uint64_t v21 = a2[1];
      __int128 v130 = 0uLL;
      *(_OWORD *)v134 = *(_OWORD *)(result + 40);
      uint64_t result = der_decode_next(v6, 0LL, 0LL, &v130, (uint64_t *)v134);
      if (!(_DWORD)result)
      {
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54) {
          return result;
        }
        if (v6 && v6 >= v7) {
          goto LABEL_317;
        }
        v55 = "array decoding failure";
        goto LABEL_229;
      }

      BOOL v22 = (unint64_t)v130 < *((void *)&v130 + 1);
      if ((unint64_t)v130 < *((void *)&v130 + 1) && v21 >= 1)
      {
        while (1)
        {
          uint64_t result = der_decode_next(v6, 0LL, 0LL, 0LL, (uint64_t *)&v130);
          if ((result & 1) == 0) {
            break;
          }
          uint64_t v23 = v21 - 1;
          BOOL v22 = (unint64_t)v130 < *((void *)&v130 + 1);
        }

        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54) {
          return result;
        }
        if (v6 && v6 >= v7) {
          goto LABEL_317;
        }
        v55 = "encountered invalid element in an array";
LABEL_229:
        uint64_t v56 = "der_vm_execute_select_index";
        return v54(v6, "[%s]: %s\n", v56, v55);
      }

      uint64_t v23 = v21;
LABEL_148:
      if (v22 && v23 == 0)
      {
        if (!v6 || v6 < v7)
        {
          uint64_t result = der_decode_next(v6, 0LL, (void *)(a3 + 40), 0LL, (uint64_t *)&v130);
          *(_BYTE *)(a3 + 33) = result;
          return result;
        }

        goto LABEL_317;
      }

      return result;
    case 3uLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      return der_vm_execute_match_string(a3, (__int128 *)result, (uint64_t)a2);
    case 4uLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      __int128 v25 = *(_OWORD *)(result + 32);
      __int128 v26 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + ++**(void **)(result + 32) = v25;
      *(_OWORD *)a3 = v26;
      *(void *)(a3 + 48) = *(void *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      if ((v8 & 0x4000000000000000LL) != 0)
      {
        unint64_t v27 = (void *)a2[1];
        uint64_t v28 = a2 + 2;
      }

      else
      {
        unint64_t v27 = a2 + 1;
        uint64_t v28 = a2 + 31;
      }

      size_t v57 = *v28;
      *(_OWORD *)v134 = *(_OWORD *)(result + 40);
      __int128 v130 = 0uLL;
      uint64_t result = ccder_blob_decode_range();
      if ((result & 1) != 0)
      {
        if (!v57) {
          goto LABEL_308;
        }
        int v58 = (const void *)v130;
        if (v57 > *((void *)&v130 + 1) - (void)v130)
        {
LABEL_63:
          *(_BYTE *)(a3 + 33) = 0;
          return result;
        }

        uint64_t result = (unint64_t)v27;
        size_t v104 = v57;
        goto LABEL_224;
      }

      int v59 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v59) {
        return result;
      }
      uint64_t result = v59(v6, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
      v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v54) {
        return result;
      }
      if (v6 && v6 >= v7) {
        goto LABEL_317;
      }
      v55 = "string decode failure";
      uint64_t v56 = "der_vm_execute_match_string_prefix";
      return v54(v6, "[%s]: %s\n", v56, v55);
    case 5uLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      __int128 v35 = *(_OWORD *)(result + 32);
      __int128 v36 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + ++**(void **)(result + 32) = v35;
      *(_OWORD *)a3 = v36;
      *(void *)(a3 + 48) = *(void *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      *(_OWORD *)v134 = *(_OWORD *)(result + 40);
      __int128 v130 = 0uLL;
      uint64_t result = ccder_blob_decode_range();
      if ((result & 1) == 0)
      {
        __int128 v74 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v74) {
          goto LABEL_187;
        }
        __int128 v75 = "Unknown BOOLean encoding";
        goto LABEL_186;
      }

      if (*((void *)&v130 + 1) - (void)v130 == 1LL)
      {
        BOOL v18 = a2[1] == (*(_BYTE *)v130 != 0);
        goto LABEL_235;
      }

      __int128 v74 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (v74)
      {
        __int128 v75 = "BOOLean should be exactly 1 byte";
LABEL_186:
        uint64_t result = v74(v6, "[%s]: %s\n", "der_decode_BOOLean", v75);
      }

LABEL_187:
      v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v54) {
        return result;
      }
      if (v6 && v6 >= v7) {
        goto LABEL_317;
      }
      v55 = "BOOL decode failure";
      uint64_t v56 = "der_vm_execute_match_BOOL";
      return v54(v6, "[%s]: %s\n", v56, v55);
    case 6uLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      __int128 v37 = *(_OWORD *)(result + 32);
      __int128 v38 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + ++**(void **)(result + 32) = v37;
      *(_OWORD *)a3 = v38;
      *(void *)(a3 + 48) = *(void *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      if ((v8 & 0x4000000000000000LL) != 0)
      {
        uint64_t v39 = (void *)a2[1];
        uint64_t v40 = a2 + 2;
      }

      else
      {
        uint64_t v39 = a2 + 1;
        uint64_t v40 = a2 + 31;
      }

      size_t v76 = *v40;
      uint64_t v77 = *(void *)(result + 24);
      __int128 v78 = *(_OWORD *)(result + 40);
      *(void *)v134 = 0LL;
      __int128 v130 = v78;
      uint64_t result = der_decode_next(v6, v134, 0LL, 0LL, (uint64_t *)&v130);
      if (!(_DWORD)result || v77 == *(void *)v134) {
        goto LABEL_112;
      }
      if (*(void *)v134 != 12LL)
      {
        if (*(void *)v134 == 0x2000000000000010LL || *(void *)v134 == 0x6000000000000010LL)
        {
          v129[0] = (void *)a3;
          v129[1] = a2;
          __int128 v99 = *(_OWORD *)(v3 + 16);
          __int128 v130 = *(_OWORD *)v3;
          __int128 v131 = v99;
          __int128 v132 = *(_OWORD *)(v3 + 32);
          uint64_t v133 = *(void *)(v3 + 48);
          *(void *)v134 = MEMORY[0x1895F87A8];
          *(void *)&v134[8] = 0x40000000LL;
          *(void *)&v134[16] = __der_vm_iterate_block_invoke;
          v135 = &__block_descriptor_tmp_156;
          v100 = string_value_allowed_iterate;
LABEL_239:
          v136 = v129;
          v137 = v100;
          return der_vm_iterate_b((uint64_t)&v130, (uint64_t)v134);
        }

LABEL_112:
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (v54)
        {
          if (v6 >= v7) {
            goto LABEL_317;
          }
          v55 = "Unexpected type to match against";
          uint64_t v56 = "der_vm_execute_string_value_allowed";
          return v54(v6, "[%s]: %s\n", v56, v55);
        }

        return result;
      }

      uint64_t result = der_vm_execute_match_string((uint64_t)&v130, (__int128 *)v3, (uint64_t)a2);
      if (BYTE1(v132)) {
        goto LABEL_308;
      }
      unint64_t v6 = *(void *)v3;
      *(_OWORD *)v129 = *(_OWORD *)(v3 + 40);
      *(_OWORD *)v134 = 0uLL;
      if ((ccder_blob_decode_range() & 1) == 0) {
        goto LABEL_318;
      }
      uint64_t result = *(void *)v134;
      if (*(void *)&v134[8] == *(void *)v134) {
        return result;
      }
      v111 = (_BYTE *)(*(void *)&v134[8] - 1LL);
      if (*v111 != 42) {
        return result;
      }
      size_t v104 = ~*(void *)v134 + *(void *)&v134[8];
      if (!v104) {
        goto LABEL_308;
      }
      if (v104 > v76) {
        goto LABEL_63;
      }
      int v58 = v39;
      goto LABEL_224;
    case 7uLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      __int128 v41 = *(_OWORD *)(result + 32);
      __int128 v42 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + ++**(void **)(result + 32) = v41;
      *(_OWORD *)a3 = v42;
      *(void *)(a3 + 48) = *(void *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      *(_OWORD *)v134 = *(_OWORD *)(result + 40);
      __int128 v130 = 0uLL;
      uint64_t result = ccder_blob_decode_range();
      if ((result & 1) == 0)
      {
        unint64_t v43 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v43) {
          goto LABEL_118;
        }
        uint64_t v44 = "unknown number encoding";
        goto LABEL_117;
      }

      if (*((void *)&v130 + 1) - (void)v130 < 9uLL)
      {
        if ((unint64_t)v130 >= *((void *)&v130 + 1))
        {
          uint64_t v95 = 0LL;
        }

        else
        {
          uint64_t v94 = 0LL;
          uint64_t v95 = 0LL;
          do
          {
            v96 = (unsigned __int8 *)(v130 + v94);
            if ((unint64_t)(v130 + v94) >= *((void *)&v130 + 1)
              || (unint64_t)v96 < (unint64_t)v130)
            {
              goto LABEL_317;
            }

            uint64_t v95 = *v96 | (unint64_t)(v95 << 8);
            ++v94;
          }

          while (*((void *)&v130 + 1) - (void)v130 != v94);
        }

        BOOL v18 = v95 == a2[1];
        goto LABEL_235;
      }

      unint64_t v43 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (v43)
      {
        uint64_t v44 = "number too large";
LABEL_117:
        uint64_t result = v43(v6, "[%s]: %s\n", "der_decode_number", v44);
      }

LABEL_118:
      v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v54) {
        return result;
      }
      if (v6 && v6 >= v7) {
        goto LABEL_317;
      }
LABEL_121:
      v55 = "BOOL decode failure";
      uint64_t v56 = "der_vm_execute_match_integer";
      return v54(v6, "[%s]: %s\n", v56, v55);
    case 8uLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      __int128 v45 = *(_OWORD *)(result + 32);
      __int128 v46 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + ++**(void **)(result + 32) = v45;
      *(_OWORD *)a3 = v46;
      *(void *)(a3 + 48) = *(void *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      char v47 = a2 + 1;
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      if ((v8 & 0x4000000000000000LL) != 0)
      {
        unint64_t v49 = (void *)a2[1];
        uint64_t v48 = a2 + 2;
      }

      else
      {
        uint64_t v48 = a2 + 31;
        unint64_t v49 = a2 + 1;
      }

      size_t v79 = *v48;
      uint64_t v80 = *(void *)(result + 24);
      __int128 v81 = *(_OWORD *)(result + 40);
      *(void *)v134 = 0LL;
      __int128 v130 = v81;
      uint64_t result = der_decode_next(v6, v134, 0LL, 0LL, (uint64_t *)&v130);
      if (!(_DWORD)result || v80 == *(void *)v134) {
        goto LABEL_125;
      }
      if (*(void *)v134 != 12LL)
      {
        if (*(void *)v134 == 0x2000000000000010LL || *(void *)v134 == 0x6000000000000010LL)
        {
          v129[0] = (void *)a3;
          v129[1] = a2;
          __int128 v101 = *(_OWORD *)(v3 + 16);
          __int128 v130 = *(_OWORD *)v3;
          __int128 v131 = v101;
          __int128 v132 = *(_OWORD *)(v3 + 32);
          uint64_t v133 = *(void *)(v3 + 48);
          *(void *)v134 = MEMORY[0x1895F87A8];
          *(void *)&v134[8] = 0x40000000LL;
          *(void *)&v134[16] = __der_vm_iterate_block_invoke;
          v135 = &__block_descriptor_tmp_156;
          v100 = string_prefix_allowed_iterate;
          goto LABEL_239;
        }

LABEL_125:
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (v54)
        {
          if (v6 >= v7) {
            goto LABEL_317;
          }
          v55 = "Unexpected type to match against";
          uint64_t v56 = "der_vm_execute_string_prefix_value_allowed";
          return v54(v6, "[%s]: %s\n", v56, v55);
        }

        return result;
      }

      if ((*((_BYTE *)a2 + 7) & 0x40) != 0)
      {
        char v47 = (const void *)a2[1];
        v112 = a2 + 2;
      }

      else
      {
        v112 = a2 + 31;
      }

      unint64_t v6 = *(void *)v3;
      size_t v113 = *v112;
      *(_OWORD *)v134 = *(_OWORD *)(v3 + 40);
      __int128 v130 = 0uLL;
      uint64_t result = ccder_blob_decode_range();
      if ((result & 1) != 0)
      {
        if (!v113) {
          goto LABEL_308;
        }
        if (v113 <= *((void *)&v130 + 1) - (void)v130)
        {
          uint64_t result = memcmp(v47, (const void *)v130, v113);
          if (!(_DWORD)result) {
            goto LABEL_308;
          }
        }
      }

      else
      {
        v114 = *(void (**)(unint64_t, const char *, ...))(v6 + 24);
        if (v114)
        {
          v114(v6, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
          v115 = *(void (**)(unint64_t, const char *, ...))(v6 + 24);
          if (v115)
          {
            if (v6 && v6 >= v6 + 64) {
              goto LABEL_317;
            }
            v115(v6, "[%s]: %s\n", "der_vm_execute_match_string_prefix", "string decode failure");
          }
        }
      }

      unint64_t v6 = *(void *)v3;
      *(_OWORD *)v134 = *(_OWORD *)(v3 + 40);
      __int128 v130 = 0uLL;
      uint64_t result = ccder_blob_decode_range();
      if ((result & 1) == 0) {
        goto LABEL_318;
      }
      if (v79)
      {
        int v58 = (const void *)v130;
        if (v79 > *((void *)&v130 + 1) - (void)v130) {
          goto LABEL_63;
        }
        uint64_t result = (unint64_t)v49;
        size_t v104 = v79;
LABEL_224:
        uint64_t result = memcmp((const void *)result, v58, v104);
        BOOL v18 = (_DWORD)result == 0;
LABEL_235:
        char v105 = v18;
        goto LABEL_309;
      }

      goto LABEL_308;
    case 9uLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      __int128 v29 = *(_OWORD *)(result + 32);
      __int128 v30 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + ++**(void **)(result + 32) = v29;
      *(_OWORD *)a3 = v30;
      *(void *)(a3 + 48) = *(void *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      __int128 v130 = 0uLL;
      *(_OWORD *)v134 = *(_OWORD *)(result + 40);
      uint64_t result = der_decode_next(v6, 0LL, 0LL, &v130, (uint64_t *)v134);
      if ((result & 1) == 0)
      {
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54) {
          return result;
        }
        if (v6 && v6 >= v7) {
          goto LABEL_317;
        }
        v55 = "dictionary decoding failure";
        goto LABEL_247;
      }

      if ((*((_BYTE *)a2 + 7) & 0x40) != 0)
      {
        unint64_t v31 = (const void *)a2[1];
        __int128 v32 = (void **)(a2 + 2);
      }

      else
      {
        unint64_t v31 = a2 + 1;
        __int128 v32 = (void **)(a2 + 31);
      }

      v87 = (char *)*v32;
      if (!*v32)
      {
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54) {
          return result;
        }
        if (v6 && v6 >= v7) {
          goto LABEL_317;
        }
        v55 = "key length is invalid";
        goto LABEL_247;
      }

      if (v6 && v6 >= v7) {
        goto LABEL_316;
      }
      while (2)
      {
        v129[0] = 0LL;
        v129[1] = 0LL;
        __int128 v128 = 0uLL;
        uint64_t result = der_decode_key_value(v6, v129, &v128, &v130);
        if ((_DWORD)result)
        {
          v88 = (char *)v129[1];
          if (v129[1])
          {
            v89 = v129[0];
            v90 = (char *)v129[1] - 1;
            v91 = (char *)v129[0] + (unint64_t)v129[1] - 1;
            if (*v91 == 42)
            {
              if (v129[1] == (void *)1 || v90 <= v87 && (uint64_t result = memcmp(v129[0], v31, (size_t)v90), !(_DWORD)result))
              {
LABEL_162:
                *(_BYTE *)(a3 + 33) = 1;
                *(_OWORD *)(a3 + 40) = v128;
              }

LABEL_163:
              continue;
            }
          }

          else
          {
            v89 = v129[0];
          }

          if (v31 && v89)
          {
            v93 = v87 >= v129[1] ? v129[1] : v87;
            uint64_t result = memcmp(v31, v89, (size_t)v93);
            if (v87 == v88 && !(_DWORD)result) {
              goto LABEL_162;
            }
          }

          goto LABEL_163;
        }

        break;
      }

      v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
      if (!v54) {
        return result;
      }
      v55 = "invalid dictionary element";
LABEL_247:
      uint64_t v56 = "der_vm_execute_select_longest_matching_key";
      return v54(v6, "[%s]: %s\n", v56, v55);
    case 0xAuLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      __int128 v50 = *(_OWORD *)(result + 32);
      __int128 v51 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + ++**(void **)(result + 32) = v50;
      *(_OWORD *)a3 = v51;
      *(void *)(a3 + 48) = *(void *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      uint64_t v52 = *(void *)(result + 24);
      __int128 v53 = *(_OWORD *)(result + 40);
      *(void *)v134 = 0LL;
      __int128 v130 = v53;
      uint64_t result = der_decode_next(v6, v134, 0LL, 0LL, (uint64_t *)&v130);
      if (!(_DWORD)result || v52 == *(void *)v134) {
        goto LABEL_56;
      }
      if (*(void *)v134 == 0x6000000000000010LL || *(void *)v134 == 0x2000000000000010LL)
      {
        v129[0] = (void *)a3;
        v129[1] = a2;
        __int128 v106 = *(_OWORD *)(v3 + 16);
        __int128 v130 = *(_OWORD *)v3;
        __int128 v131 = v106;
        __int128 v132 = *(_OWORD *)(v3 + 32);
        uint64_t v133 = *(void *)(v3 + 48);
        *(void *)v134 = MEMORY[0x1895F87A8];
        *(void *)&v134[8] = 0x40000000LL;
        *(void *)&v134[16] = __der_vm_iterate_block_invoke;
        v135 = &__block_descriptor_tmp_156;
        v100 = integer_allowed_iterate;
        goto LABEL_239;
      }

      if (*(void *)v134 != 2LL)
      {
LABEL_56:
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54) {
          return result;
        }
        if (v6 >= v7) {
          goto LABEL_317;
        }
        v55 = "Unexpected type to match against";
        uint64_t v56 = "der_vm_execute_integer_value_allowed";
        return v54(v6, "[%s]: %s\n", v56, v55);
      }

      unint64_t v6 = *(void *)v3;
      *(_OWORD *)v134 = *(_OWORD *)(v3 + 40);
      __int128 v130 = 0uLL;
      uint64_t result = ccder_blob_decode_range();
      if ((result & 1) == 0)
      {
        v97 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (v97)
        {
          v98 = "unknown number encoding";
          goto LABEL_272;
        }

LABEL_273:
        v54 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (!v54) {
          return result;
        }
        if (v6 && v6 >= v6 + 64) {
          goto LABEL_317;
        }
        goto LABEL_121;
      }

      if (*((void *)&v130 + 1) - (void)v130 >= 9uLL)
      {
        v97 = *(uint64_t (**)(unint64_t, const char *, ...))(v6 + 24);
        if (v97)
        {
          v98 = "number too large";
LABEL_272:
          uint64_t result = v97(v6, "[%s]: %s\n", "der_decode_number", v98);
          goto LABEL_273;
        }

        goto LABEL_273;
      }

      if ((unint64_t)v130 >= *((void *)&v130 + 1))
      {
        uint64_t v118 = 0LL;
      }

      else
      {
        uint64_t v117 = 0LL;
        uint64_t v118 = 0LL;
        do
        {
          v119 = (unsigned __int8 *)(v130 + v117);
          if ((unint64_t)(v130 + v117) >= *((void *)&v130 + 1)
            || (unint64_t)v119 < (unint64_t)v130)
          {
            goto LABEL_317;
          }

          uint64_t v118 = *v119 | (unint64_t)(v118 << 8);
          ++v117;
        }

        while (*((void *)&v130 + 1) - (void)v130 != v117);
      }

      if (v118 != a2[1]) {
        return result;
      }
LABEL_308:
      char v105 = 1;
LABEL_309:
      *(_BYTE *)(a3 + 33) = v105;
      return result;
    case 0xBuLL:
      if (result + 56 < result) {
        goto LABEL_317;
      }
      __int128 v12 = *(_OWORD *)(result + 32);
      __int128 v13 = *(_OWORD *)result;
      *(_OWORD *)(a3 + 16) = *(_OWORD *)(result + 16);
      *(_OWORD *)(a3 + ++**(void **)(result + 32) = v12;
      *(_OWORD *)a3 = v13;
      *(void *)(a3 + 48) = *(void *)(result + 48);
      *(_BYTE *)(a3 + 33) = 0;
      *(void *)(a3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      size_t v14 = a2[1];
      if (v14 - 7 < 0xFFFFFFFFFFFFFFFALL) {
        return result;
      }
      uint64_t v15 = *(void *)(result + 24);
      __int128 v16 = *(_OWORD *)(result + 40);
      *(void *)v134 = 0LL;
      __int128 v130 = v16;
      uint64_t result = der_decode_next(v6, v134, 0LL, 0LL, (uint64_t *)&v130);
      if (!(_DWORD)result) {
        return result;
      }
      if (v15 == *(void *)v134)
      {
        int v17 = 1;
LABEL_13:
        BOOL v18 = v17 == (_DWORD)v14;
        goto LABEL_235;
      }

      if (*(uint64_t *)v134 > 0x200000000000000FLL)
      {
        if (*(void *)v134 == 0x6000000000000010LL || *(void *)v134 == 0x2000000000000010LL)
        {
          int v17 = 2;
          goto LABEL_13;
        }
      }

      else
      {
        int v17 = 5;
        switch(*(void *)v134)
        {
          case 1LL:
            goto LABEL_13;
          case 2LL:
            int v17 = 3;
            goto LABEL_13;
          case 4LL:
            int v17 = 6;
            goto LABEL_13;
          case 0xCLL:
            int v17 = 4;
            goto LABEL_13;
          default:
            return result;
        }
      }

      return result;
    default:
      if (v6) {
        BOOL v120 = v6 >= v7;
      }
      else {
        BOOL v120 = 0;
      }
      if (v120) {
        goto LABEL_317;
      }
      (*(void (**)(unint64_t, const char *, ...))(v6 + 32))( v6,  "[%s]: %s\n",  "der_vm_execute_nocopy",  "unhandled opcode");
      goto LABEL_316;
  }

unint64_t der_vm_execute@<X0>(unint64_t result@<X0>, size_t *a2@<X1>, uint64_t a3@<X8>)
{
  if (a2 && a2 + 32 < a2)
  {
    __break(0x5519u);
  }

  else
  {
    __int128 v3 = *(_OWORD *)(result + 16);
    v4[0] = *(_OWORD *)result;
    v4[1] = v3;
    v4[2] = *(_OWORD *)(result + 32);
    uint64_t v5 = *(void *)(result + 48);
    return der_vm_execute_nocopy((unint64_t)v4, a2, a3);
  }

  return result;
}

double der_vm_execute_seq_nocopy@<D0>(uint64_t a1@<X0>, size_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  __int128 v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a4 = *(_OWORD *)a1;
  *(_OWORD *)(a4 + 16) = v5;
  __int128 v6 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a4 + ++**(void **)(result + 32) = v6;
  *(void *)(a4 + 48) = *(void *)(a1 + 48);
  if (a3)
  {
    uint64_t v7 = a3;
    do
    {
      __int128 v11 = *(_OWORD *)(a4 + 16);
      v13[0] = *(_OWORD *)a4;
      v13[1] = v11;
      v13[2] = *(_OWORD *)(a4 + 32);
      uint64_t v14 = *(void *)(a4 + 48);
      if (a2) {
        uint64_t v9 = a2;
      }
      else {
        uint64_t v9 = 0LL;
      }
      der_vm_execute_nocopy((unint64_t)v13, v9, (uint64_t)v15);
      __int128 v10 = v15[1];
      *(_OWORD *)a4 = v15[0];
      *(_OWORD *)(a4 + 16) = v10;
      *(void *)&__int128 v6 = v16;
      *(_OWORD *)(a4 + ++**(void **)(result + 32) = v16;
      *(void *)(a4 + 48) = v17;
      a2 += 32;
      --v7;
    }

    while (v7);
  }

  return *(double *)&v6;
}

uint64_t der_vm_context_is_valid(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 33);
}

uint64_t der_vm_CEType_from_ccder_tag(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24) == a2) {
    return 1LL;
  }
  if (a2 > 0x200000000000000FLL)
  {
    if (a2 == 0x6000000000000010LL || a2 == 0x2000000000000010LL) {
      return 2LL;
    }
    else {
      return 0LL;
    }
  }

  else
  {
    uint64_t result = 5LL;
    switch(a2)
    {
      case 1LL:
        return result;
      case 2LL:
        uint64_t result = 3LL;
        break;
      case 3LL:
      case 5LL:
      case 6LL:
      case 7LL:
      case 8LL:
      case 9LL:
      case 10LL:
      case 11LL:
        return 0LL;
      case 4LL:
        uint64_t result = 6LL;
        break;
      case 12LL:
        uint64_t result = 4LL;
        break;
      default:
        return a2 == 0xA000000000000010LL;
    }
  }

  return result;
}

uint64_t der_vm_CEType_from_context(uint64_t a1, uint64_t *a2)
{
  uint64_t v8 = 0LL;
  if (!*(_BYTE *)(a1 + 33)) {
    return 0LL;
  }
  uint64_t v4 = *(void *)a1;
  __int128 v7 = *(_OWORD *)(a1 + 40);
  uint64_t result = der_decode_next(v4, &v8, 0LL, 0LL, (uint64_t *)&v7);
  if (!(_DWORD)result) {
    return result;
  }
  uint64_t v6 = v8;
  if (a2) {
    *a2 = v8;
  }
  if (*(void *)(a1 + 24) == v6) {
    return 1LL;
  }
  if (v6 > 0x200000000000000FLL)
  {
    if (v6 == 0x6000000000000010LL || v6 == 0x2000000000000010LL) {
      return 2LL;
    }
    return 0LL;
  }

  uint64_t result = 5LL;
  switch(v6)
  {
    case 1LL:
      return result;
    case 2LL:
      uint64_t result = 3LL;
      break;
    case 3LL:
    case 5LL:
    case 6LL:
    case 7LL:
    case 8LL:
    case 9LL:
    case 10LL:
    case 11LL:
      return 0LL;
    case 4LL:
      uint64_t result = 6LL;
      break;
    case 12LL:
      uint64_t result = 4LL;
      break;
    default:
      return v6 == 0xA000000000000010LL;
  }

  return result;
}

uint64_t der_vm_iterate_b(uint64_t a1, uint64_t a2)
{
  if (!a2 || !*(_BYTE *)(a1 + 33)) {
    return (uint64_t)&unk_189B57778;
  }
  unint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)a1 + 64LL;
  unint64_t v25 = 0LL;
  v26[0] = 0LL;
  unint64_t v24 = 0LL;
  __int128 v23 = *(_OWORD *)(a1 + 40);
  uint64_t result = der_decode_next(v4, v26, 0LL, &v24, (uint64_t *)&v23);
  if ((result & 1) == 0)
  {
    uint64_t v8 = *(void (**)(unint64_t, const char *, ...))(v4 + 24);
    if (!v8) {
      return (uint64_t)&unk_189B57798;
    }
    if (v4 && v4 >= v5) {
      goto LABEL_40;
    }
    uint64_t v9 = "iterable decoding failure";
LABEL_33:
    v8(v4, "[%s]: %s\n", "der_vm_iterate_b", v9);
    return (uint64_t)&unk_189B57798;
  }

  if (*(void *)(a1 + 24) == v26[0])
  {
LABEL_8:
    int v7 = 1;
    goto LABEL_16;
  }

  int v7 = 2;
  if (v26[0] == 0x6000000000000010LL || v26[0] == 0x2000000000000010LL)
  {
    while (1)
    {
LABEL_16:
      if (v24 >= v25) {
        return (uint64_t)Errors;
      }
      __int128 v11 = *(_OWORD *)(a1 + 16);
      __int128 v12 = *(_OWORD *)(a1 + 32);
      v14[0] = *(_OWORD *)a1;
      v14[1] = v11;
      _OWORD v14[2] = v12;
      uint64_t v15 = *(void *)(a1 + 48);
      __int128 v16 = v14[0];
      __int128 v17 = v11;
      __int128 v18 = v12;
      uint64_t v19 = v15;
      int v20 = v7;
      int v21 = 0;
      uint64_t v22 = 0LL;
      uint64_t result = der_decode_next(*(void *)a1, v26, (void *)&v18 + 1, 0LL, (uint64_t *)&v24);
      if ((result & 1) == 0) {
        break;
      }
      if (*((void *)&v17 + 1) == v26[0])
      {
        int v10 = 1;
      }

      else if (v26[0] > 0x200000000000000FLL)
      {
        if (v26[0] == 0x6000000000000010LL || v26[0] == 0x2000000000000010LL) {
          int v10 = 2;
        }
        else {
LABEL_25:
        }
          int v10 = 0;
      }

      else
      {
        int v10 = 5;
        switch(v26[0])
        {
          case 1LL:
            break;
          case 2LL:
            int v10 = 3;
            break;
          case 4LL:
            int v10 = 6;
            break;
          case 0xCLL:
            int v10 = 4;
            break;
          default:
            goto LABEL_25;
        }
      }

      int v21 = v10;
    }

    uint64_t v8 = *(void (**)(unint64_t, const char *, ...))(v4 + 24);
    if (!v8) {
      return (uint64_t)&unk_189B57798;
    }
    if (v4 && v4 >= v5) {
      goto LABEL_40;
    }
    uint64_t v9 = "encountered invalid element in an iterable";
    goto LABEL_33;
  }

  if (v26[0] == 0xA000000000000010LL) {
    goto LABEL_8;
  }
  __int128 v13 = *(void (**)(unint64_t, const char *, ...))(v4 + 24);
  if (!v13) {
    return (uint64_t)&unk_189B57778;
  }
  if (!v4 || v4 < v5)
  {
    v13(v4, "[%s]: %s\n", "der_vm_iterate_b", "iteration over a non-iterable type");
    return (uint64_t)&unk_189B57778;
  }

LABEL_40:
  __break(0x5519u);
  return result;
}

  __break(0x5519u);
  return result;
}

unint64_t der_vm_iterate(unint64_t result, uint64_t a2, uint64_t a3)
{
  if (result && result + 56 < result)
  {
    __break(0x5519u);
  }

  else
  {
    v5[6] = v3;
    v5[7] = v4;
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 0x40000000LL;
    v5[2] = __der_vm_iterate_block_invoke;
    v5[3] = &__block_descriptor_tmp_156;
    v5[4] = a2;
    v5[5] = a3;
    return der_vm_iterate_b(result, (uint64_t)v5);
  }

  return result;
}

uint64_t __der_vm_iterate_block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 120) = *(void *)(a1 + 32);
  uint64_t v2 = *(uint64_t (**)(_OWORD *))(a1 + 40);
  __int128 v3 = *(_OWORD *)(a2 + 80);
  v8[4] = *(_OWORD *)(a2 + 64);
  v8[5] = v3;
  __int128 v4 = *(_OWORD *)(a2 + 112);
  v8[6] = *(_OWORD *)(a2 + 96);
  v8[7] = v4;
  __int128 v5 = *(_OWORD *)(a2 + 16);
  v8[0] = *(_OWORD *)a2;
  v8[1] = v5;
  __int128 v6 = *(_OWORD *)(a2 + 48);
  v8[2] = *(_OWORD *)(a2 + 32);
  v8[3] = v6;
  return v2(v8);
}

uint64_t der_vm_iterate_nocopy(uint64_t a1, uint64_t a2, uint64_t (*a3)(_OWORD *))
{
  if (!a3 || !*(_BYTE *)(a1 + 33)) {
    return (uint64_t)&unk_189B57778;
  }
  unint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)a1 + 64LL;
  unint64_t v27 = 0LL;
  v28[0] = 0LL;
  unint64_t v26 = 0LL;
  __int128 v25 = *(_OWORD *)(a1 + 40);
  uint64_t result = der_decode_next(v6, v28, 0LL, &v26, (uint64_t *)&v25);
  if ((result & 1) == 0)
  {
    int v10 = *(void (**)(unint64_t, const char *, ...))(v6 + 24);
    if (!v10) {
      return (uint64_t)&unk_189B57798;
    }
    if (v6 && v6 >= v7) {
      goto LABEL_40;
    }
    __int128 v11 = "iterable decoding failure";
LABEL_33:
    v10(v6, "[%s]: %s\n", "der_vm_iterate_nocopy", v11);
    return (uint64_t)&unk_189B57798;
  }

  if (*(void *)(a1 + 24) == v28[0])
  {
LABEL_8:
    int v9 = 1;
    goto LABEL_16;
  }

  int v9 = 2;
  if (v28[0] == 0x6000000000000010LL || v28[0] == 0x2000000000000010LL)
  {
    while (1)
    {
LABEL_16:
      if (v26 >= v27) {
        return (uint64_t)Errors;
      }
      __int128 v13 = *(_OWORD *)(a1 + 16);
      __int128 v14 = *(_OWORD *)(a1 + 32);
      v16[0] = *(_OWORD *)a1;
      v16[1] = v13;
      v16[2] = v14;
      uint64_t v17 = *(void *)(a1 + 48);
      __int128 v18 = v16[0];
      __int128 v19 = v13;
      __int128 v20 = v14;
      uint64_t v21 = v17;
      int v22 = v9;
      int v23 = 0;
      uint64_t v24 = a2;
      uint64_t result = der_decode_next(*(void *)a1, v28, (void *)&v20 + 1, 0LL, (uint64_t *)&v26);
      if ((result & 1) == 0) {
        break;
      }
      if (*((void *)&v19 + 1) == v28[0])
      {
        int v12 = 1;
      }

      else if (v28[0] > 0x200000000000000FLL)
      {
        if (v28[0] == 0x6000000000000010LL || v28[0] == 0x2000000000000010LL) {
          int v12 = 2;
        }
        else {
LABEL_25:
        }
          int v12 = 0;
      }

      else
      {
        int v12 = 5;
        switch(v28[0])
        {
          case 1LL:
            break;
          case 2LL:
            int v12 = 3;
            break;
          case 4LL:
            int v12 = 6;
            break;
          case 0xCLL:
            int v12 = 4;
            break;
          default:
            goto LABEL_25;
        }
      }

      int v23 = v12;
      if ((a3(v16) & 1) == 0) {
        return (uint64_t)Errors;
      }
    }

    int v10 = *(void (**)(unint64_t, const char *, ...))(v6 + 24);
    if (!v10) {
      return (uint64_t)&unk_189B57798;
    }
    if (v6 && v6 >= v7) {
      goto LABEL_40;
    }
    __int128 v11 = "encountered invalid element in an iterable";
    goto LABEL_33;
  }

  if (v28[0] == 0xA000000000000010LL) {
    goto LABEL_8;
  }
  uint64_t v15 = *(void (**)(unint64_t, const char *, ...))(v6 + 24);
  if (!v15) {
    return (uint64_t)&unk_189B57778;
  }
  if (!v6 || v6 < v7)
  {
    v15(v6, "[%s]: %s\n", "der_vm_iterate_nocopy", "iteration over a non-iterable type");
    return (uint64_t)&unk_189B57778;
  }

uint64_t der_vm_integer_from_context(unint64_t *a1)
{
  unint64_t v1 = *a1;
  if ((ccder_blob_decode_range() & 1) != 0) {
    return 0LL;
  }
  __int128 v3 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
  if (v3) {
    v3(v1, "[%s]: %s\n", "der_decode_number", "unknown number encoding");
  }
  if (v1)
  {
    if (v1 >= v1 + 64) {
      __break(0x5519u);
    }
  }

  uint64_t v4 = (*(uint64_t (**)(unint64_t, const char *, ...))(v1 + 32))( v1,  "[%s]: %s\n",  "der_vm_integer_from_context",  "Attempting to select an integer value from a non-integer DER object");
  return der_vm_string_from_context(v4);
}

uint64_t der_vm_string_from_context(unint64_t *a1)
{
  unint64_t v1 = *a1;
  if ((ccder_blob_decode_range() & 1) != 0) {
    return 0LL;
  }
  __int128 v3 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
  if (v3) {
    v3(v1, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
  }
  if (v1)
  {
    if (v1 >= v1 + 64) {
      __break(0x5519u);
    }
  }

  uint64_t v4 = (unint64_t *)(*(uint64_t (**)(unint64_t, const char *, ...))(v1 + 32))( v1,  "[%s]: %s\n",  "der_vm_string_from_context",  "Attempting to select a string value from a non-string DER object");
  return der_vm_BOOL_from_context(v4);
}

uint64_t der_vm_BOOL_from_context(unint64_t *a1)
{
  unint64_t v1 = *a1;
  if ((ccder_blob_decode_range() & 1) != 0)
  {
    uint64_t v2 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
    if (v2)
    {
      __int128 v3 = "BOOLean should be exactly 1 byte";
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v2 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
    if (v2)
    {
      __int128 v3 = "Unknown BOOLean encoding";
LABEL_6:
      v2(v1, "[%s]: %s\n", "der_decode_BOOLean", v3);
    }
  }

  if (v1 && v1 >= v1 + 64) {
    __break(0x5519u);
  }
  uint64_t v4 = (*(uint64_t (**)(unint64_t, const char *, ...))(v1 + 32))( v1,  "[%s]: %s\n",  "der_vm_BOOL_from_context",  "Attempting to select a BOOLean value from a non-BOOLean DER object");
  return der_vm_data_from_context(v4);
}

uint64_t der_vm_data_from_context(unint64_t *a1)
{
  unint64_t v1 = *a1;
  if ((ccder_blob_decode_range() & 1) != 0) {
    return 0LL;
  }
  __int128 v3 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
  if (v3) {
    v3(v1, "[%s]: %s\n", "der_decode_data", "Unknown data encoding");
  }
  if (v1)
  {
    if (v1 >= v1 + 64) {
      __break(0x5519u);
    }
  }

  uint64_t v4 = (*(uint64_t (**)(unint64_t, const char *, ...))(v1 + 32))( v1,  "[%s]: %s\n",  "der_vm_data_from_context",  "Attempting to select a data value from a non-data DER object");
  return der_vm_buffer_from_context(v4);
}

uint64_t der_vm_buffer_from_context(uint64_t a1)
{
  unint64_t v1 = *(void *)a1;
  uint64_t v5 = 0LL;
  uint64_t v6 = 0LL;
  __int128 v4 = *(_OWORD *)(a1 + 40);
  uint64_t result = der_decode_next(v1, 0LL, 0LL, &v5, (uint64_t *)&v4);
  if ((result & 1) != 0)
  {
    if (v6 == v5) {
      return 0LL;
    }
    else {
      return v5;
    }
  }

  else
  {
    if (v1) {
      BOOL v3 = v1 >= v1 + 64;
    }
    else {
      BOOL v3 = 0;
    }
    if (!v3) {
      uint64_t result = (*(uint64_t (**)(unint64_t, const char *, ...))(v1 + 32))( v1,  "[%s]: %s\n",  "der_vm_buffer_from_context",  "Failed during buffer decoding");
    }
    __break(0x5519u);
  }

  return result;
}

uint64_t der_vm_select_BOOL_for_key(uint64_t a1, char *__s, BOOL *a3)
{
  unint64_t v3 = (unint64_t)__s;
  uint64_t v41 = *MEMORY[0x1895F89C0];
  if (!__s) {
    return v3;
  }
  __int128 v38 = 0u;
  __int128 v37 = 0u;
  __int128 v36 = 0u;
  __int128 v35 = 0u;
  __int128 v34 = 0u;
  __int128 v33 = 0u;
  __int128 v32 = 0u;
  __int128 v31 = 0u;
  __int128 v30 = 0u;
  __int128 v29 = 0u;
  __int128 v28 = 0u;
  __int128 v27 = 0u;
  __int128 v26 = 0u;
  __int128 v25 = 0u;
  v24[0] = 0x4000000000000001LL;
  v24[1] = (size_t)__s;
  uint64_t v39 = 0LL;
  v24[2] = strlen(__s);
  v40[0] = xmmword_1811463C0;
  memset(&v40[1], 0, 240);
  char v6 = *(_BYTE *)(a1 + 33);
  *(void *)__int128 v13 = *(void *)a1;
  *(_OWORD *)&v13[8] = *(_OWORD *)(a1 + 8);
  *(_OWORD *)&v13[17] = *(_OWORD *)(a1 + 17);
  char v14 = v6;
  int v15 = *(_DWORD *)(a1 + 34);
  __int16 v16 = *(_WORD *)(a1 + 38);
  __int128 v17 = *(_OWORD *)(a1 + 40);
  der_vm_execute_nocopy((unint64_t)v13, v24, (uint64_t)&v18);
  *(_OWORD *)&v13[8] = *(_OWORD *)v19;
  *(_OWORD *)&v13[17] = *(_OWORD *)&v19[9];
  int v15 = v21;
  __int16 v16 = v22;
  *(void *)__int128 v13 = v18;
  char v14 = v20;
  __int128 v17 = v23;
  der_vm_execute_nocopy((unint64_t)v13, (size_t *)v40, (uint64_t)&v18);
  unint64_t v3 = v20 != 0;
  if (!a3 || !v20) {
    return v3;
  }
  unint64_t v7 = (unint64_t)v18;
  *(_OWORD *)__int128 v13 = v23;
  __int128 v18 = 0LL;
  *(void *)__int128 v19 = 0LL;
  if ((ccder_blob_decode_range() & 1) == 0)
  {
    int v9 = *(void (**)(unint64_t, const char *, ...))(v7 + 24);
    if (v9)
    {
      int v10 = "Unknown BOOLean encoding";
LABEL_13:
      v9(v7, "[%s]: %s\n", "der_decode_BOOLean", v10);
    }

LABEL_14:
    if (!v7 || v7 < v7 + 64) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

  if (*(void *)v19 - (void)v18 != 1LL)
  {
    int v9 = *(void (**)(unint64_t, const char *, ...))(v7 + 24);
    if (v9)
    {
      int v10 = "BOOLean should be exactly 1 byte";
      goto LABEL_13;
    }

    goto LABEL_14;
  }

  if ((unint64_t)v18 < *(void *)v19)
  {
    *a3 = *v18 != 0;
    return v3;
  }

    uint64_t v8 = 0;
    goto LABEL_15;
  }

  return v6;
}

LABEL_16:
  __break(0x5519u);
LABEL_17:
  int v11 = (*(uint64_t (**)(unint64_t, const char *, ...))(v7 + 32))( v7,  "[%s]: %s\n",  "der_vm_BOOL_from_context",  "Attempting to select a BOOLean value from a non-BOOLean DER object");
  return der_vm_select_int_for_key(v11, v12);
}

uint64_t der_vm_select_int_for_key(uint64_t a1, char *__s, uint64_t *a3)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  if (!__s) {
    return 0LL;
  }
  __int128 v41 = 0u;
  __int128 v40 = 0u;
  __int128 v39 = 0u;
  __int128 v38 = 0u;
  __int128 v37 = 0u;
  __int128 v36 = 0u;
  __int128 v35 = 0u;
  __int128 v34 = 0u;
  __int128 v33 = 0u;
  __int128 v32 = 0u;
  __int128 v31 = 0u;
  __int128 v30 = 0u;
  __int128 v29 = 0u;
  __int128 v28 = 0u;
  v27[0] = 0x4000000000000001LL;
  v27[1] = (size_t)__s;
  uint64_t v42 = 0LL;
  v27[2] = strlen(__s);
  v43[0] = xmmword_1811463D0;
  memset(&v43[1], 0, 240);
  char v5 = *(_BYTE *)(a1 + 33);
  *(void *)__int16 v16 = *(void *)a1;
  *(_OWORD *)&v16[8] = *(_OWORD *)(a1 + 8);
  *(_OWORD *)&v16[17] = *(_OWORD *)(a1 + 17);
  char v17 = v5;
  int v18 = *(_DWORD *)(a1 + 34);
  __int16 v19 = *(_WORD *)(a1 + 38);
  __int128 v20 = *(_OWORD *)(a1 + 40);
  der_vm_execute_nocopy((unint64_t)v16, v27, (uint64_t)&v21);
  *(_OWORD *)&v16[8] = *(_OWORD *)v22;
  *(_OWORD *)&v16[17] = *(_OWORD *)&v22[9];
  int v18 = v24;
  __int16 v19 = v25;
  *(void *)__int16 v16 = v21;
  char v17 = v23;
  __int128 v20 = v26;
  der_vm_execute_nocopy((unint64_t)v16, (size_t *)v43, (uint64_t)&v21);
  BOOL v6 = v23 != 0;
  if (!a3 || !v23) {
    return v6;
  }
  unint64_t v7 = (unint64_t)v21;
  *(_OWORD *)__int16 v16 = v26;
  int v21 = 0LL;
  *(void *)__int16 v22 = 0LL;
  if ((ccder_blob_decode_range() & 1) == 0)
  {
    int v12 = *(void (**)(unint64_t, const char *, ...))(v7 + 24);
    if (v12)
    {
      __int128 v13 = "unknown number encoding";
LABEL_23:
      v12(v7, "[%s]: %s\n", "der_decode_number", v13);
    }

BOOL der_vm_string_is_allowed_for_key(__int128 *a1, char *__s, const char *a3)
{
  BOOL result = 0LL;
  uint64_t v47 = *MEMORY[0x1895F89C0];
  if (__s)
  {
    if (a3)
    {
      __int128 v29 = 0u;
      __int128 v28 = 0u;
      __int128 v27 = 0u;
      __int128 v26 = 0u;
      __int128 v25 = 0u;
      __int128 v24 = 0u;
      __int128 v23 = 0u;
      __int128 v22 = 0u;
      __int128 v21 = 0u;
      __int128 v20 = 0u;
      __int128 v19 = 0u;
      __int128 v18 = 0u;
      __int128 v17 = 0u;
      __int128 v16 = 0u;
      v15[0] = 0x4000000000000001LL;
      v15[1] = (size_t)__s;
      _OWORD v15[2] = strlen(__s);
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      uint64_t v30 = 0LL;
      v31[0] = 0x4000000000000006LL;
      v31[1] = (size_t)a3;
      v31[2] = strlen(a3);
      uint64_t v46 = 0LL;
      char v6 = *((_BYTE *)a1 + 33);
      __int128 v7 = a1[1];
      __int128 v8 = *a1;
      __int128 v9 = v7;
      LOBYTE(v10) = *((_BYTE *)a1 + 32);
      HIBYTE(v10) = v6;
      *(_OWORD *)int v11 = *(__int128 *)((char *)a1 + 34);
      *(void *)&v11[14] = *((void *)a1 + 6);
      der_vm_execute_nocopy((unint64_t)&v8, v15, (uint64_t)v12);
      __int128 v8 = v12[0];
      __int128 v9 = v12[1];
      __int16 v10 = v13;
      *(_OWORD *)int v11 = *(_OWORD *)v14;
      *(void *)&v11[14] = *(void *)&v14[14];
      der_vm_execute_nocopy((unint64_t)&v8, v31, (uint64_t)v12);
      return HIBYTE(v13) != 0;
    }
  }

  return result;
}

BOOL der_vm_type_for_key(uint64_t a1, char *__s, int *a3)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (!__s) {
    return 0LL;
  }
  __int128 v30 = 0u;
  __int128 v29 = 0u;
  __int128 v28 = 0u;
  __int128 v27 = 0u;
  __int128 v26 = 0u;
  __int128 v25 = 0u;
  __int128 v24 = 0u;
  __int128 v23 = 0u;
  __int128 v22 = 0u;
  __int128 v21 = 0u;
  __int128 v20 = 0u;
  __int128 v19 = 0u;
  __int128 v18 = 0u;
  __int128 v17 = 0u;
  v16[0] = 0x4000000000000001LL;
  v16[1] = (size_t)__s;
  uint64_t v31 = 0LL;
  v16[2] = strlen(__s);
  __int128 v13 = 0u;
  memset(v14, 0, 24);
  __int128 v12 = 0u;
  __int128 v5 = *(_OWORD *)(a1 + 16);
  v10[0] = *(_OWORD *)a1;
  v10[1] = v5;
  _OWORD v10[2] = *(_OWORD *)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 48);
  der_vm_execute_nocopy((unint64_t)v10, v16, (uint64_t)&v12);
  BOOL v6 = BYTE1(v14[0]) != 0;
  if (a3 && BYTE1(v14[0]))
  {
    uint64_t v7 = *((void *)&v13 + 1);
    uint64_t v15 = 0LL;
    v10[0] = *(_OWORD *)((char *)v14 + 8);
    if (der_decode_next(v12, &v15, 0LL, 0LL, (uint64_t *)v10))
    {
      if (v7 == v15)
      {
        int v8 = 1;
LABEL_15:
        *a3 = v8;
        return v6;
      }

      if (v15 <= 0x200000000000000FLL)
      {
        int v8 = 5;
        switch(v15)
        {
          case 1LL:
            goto LABEL_15;
          case 2LL:
            int v8 = 3;
            break;
          case 4LL:
            int v8 = 6;
            break;
          case 12LL:
            int v8 = 4;
            break;
          default:
            goto LABEL_14;
        }

        goto LABEL_15;
      }

      if (v15 == 0x6000000000000010LL || v15 == 0x2000000000000010LL)
      {
        int v8 = 2;
        goto LABEL_15;
      }
    }

BOOL der_vm_key_is_present(uint64_t a1, char *__s)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (!__s) {
    return 0LL;
  }
  __int128 v24 = 0u;
  __int128 v23 = 0u;
  __int128 v22 = 0u;
  __int128 v21 = 0u;
  __int128 v20 = 0u;
  __int128 v19 = 0u;
  __int128 v18 = 0u;
  __int128 v17 = 0u;
  __int128 v16 = 0u;
  __int128 v15 = 0u;
  __int128 v14 = 0u;
  __int128 v13 = 0u;
  __int128 v12 = 0u;
  __int128 v11 = 0u;
  v10[0] = 0x4000000000000001LL;
  v10[1] = (size_t)__s;
  uint64_t v25 = 0LL;
  _OWORD v10[2] = strlen(__s);
  uint64_t v9 = 0LL;
  __int128 v8 = 0u;
  memset(v7, 0, sizeof(v7));
  __int128 v3 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  der_vm_execute_nocopy((unint64_t)v5, v10, (uint64_t)v7);
  return BYTE1(v8) != 0;
}

void *serializeId(void *a1, void *a2)
{
  uint64_t v90 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v4 = v3;
    uint64_t v5 = [v4 UTF8String];
    uint64_t v6 = [v4 lengthOfBytesUsingEncoding:4];
    __int128 v8 = (char *)a2[1];
    unint64_t v7 = a2[2];
    if ((unint64_t)v8 < v7)
    {
      uint64_t v9 = 2LL;
LABEL_4:
      *(void *)__int128 v8 = v9;
      *((void *)v8 + 1) = v5;
      *((void *)v8 + 2) = v6;
      v8[24] = 0;
      __int16 v10 = v8 + 32;
LABEL_32:
      a2[1] = v10;
      goto LABEL_33;
    }

    __int128 v17 = (char *)*a2;
    uint64_t v18 = (uint64_t)&v8[-*a2] >> 5;
    unint64_t v19 = v18 + 1;
    uint64_t v20 = v7 - (void)v17;
    if (v20 >> 4 > v19) {
      unint64_t v19 = v20 >> 4;
    }
    else {
      unint64_t v21 = v19;
    }
    if (v21)
    {
      if (v21 >> 59) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      __int128 v22 = (char *)operator new(32 * v21);
    }

    else
    {
      __int128 v22 = 0LL;
    }

    uint64_t v31 = &v22[32 * v18];
    *(void *)uint64_t v31 = 2LL;
    *((void *)v31 + 1) = v5;
    uint64_t v32 = &v22[32 * v21];
    *((void *)v31 + 2) = v6;
    v31[24] = 0;
    __int16 v10 = v31 + 32;
    if (v8 != v17)
    {
      do
      {
        __int128 v33 = *((_OWORD *)v8 - 1);
        *((_OWORD *)v31 - 2) = *((_OWORD *)v8 - 2);
        *((_OWORD *)v31 - 1) = v33;
        v31 -= 32;
        v8 -= 32;
      }

      while (v8 != v17);
LABEL_29:
      __int128 v8 = (char *)*a2;
      goto LABEL_30;
    }

    goto LABEL_30;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v11 = v3;
    CFTypeID v12 = CFGetTypeID(v11);
    if (v12 == CFBooleanGetTypeID())
    {
      unsigned int v13 = [v11 BOOLValue];
      uint64_t v14 = v13;
      __int128 v16 = (char *)a2[1];
      unint64_t v15 = a2[2];
      if ((unint64_t)v16 < v15)
      {
        *(void *)__int128 v16 = 1LL;
        *((void *)v16 + 1) = v13;
LABEL_22:
        *((void *)v16 + 2) = 0LL;
        v16[24] = 0;
        a2[1] = v16 + 32;
LABEL_33:

LABEL_34:
        __int128 v23 = Errors;
        goto LABEL_35;
      }

      __int128 v35 = (char *)*a2;
      uint64_t v36 = (uint64_t)&v16[-*a2] >> 5;
      unint64_t v37 = v36 + 1;
      uint64_t v38 = v15 - (void)v35;
      if (v38 >> 4 > v37) {
        unint64_t v37 = v38 >> 4;
      }
      else {
        unint64_t v39 = v37;
      }
      if (v39)
      {
        if (v39 >> 59) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        __int128 v40 = (char *)operator new(32 * v39);
      }

      else
      {
        __int128 v40 = 0LL;
      }

      v55 = &v40[32 * v36];
      *(void *)v55 = 1LL;
      *((void *)v55 + 1) = v14;
      uint64_t v56 = &v40[32 * v39];
      *((void *)v55 + 2) = 0LL;
      v55[24] = 0;
      size_t v57 = v55 + 32;
      if (v16 != v35)
      {
        do
        {
          __int128 v58 = *((_OWORD *)v16 - 1);
          *((_OWORD *)v55 - 2) = *((_OWORD *)v16 - 2);
          *((_OWORD *)v55 - 1) = v58;
          v55 -= 32;
          v16 -= 32;
        }

        while (v16 != v35);
LABEL_74:
        __int128 v16 = (char *)*a2;
      }
    }

    else
    {
      uint64_t v24 = [v11 longLongValue];
      uint64_t v25 = v24;
      __int128 v16 = (char *)a2[1];
      unint64_t v26 = a2[2];
      if ((unint64_t)v16 < v26)
      {
        *(void *)__int128 v16 = 4LL;
        *((void *)v16 + 1) = v24;
        goto LABEL_22;
      }

      __int128 v41 = (char *)*a2;
      uint64_t v42 = (uint64_t)&v16[-*a2] >> 5;
      unint64_t v43 = v42 + 1;
      uint64_t v44 = v26 - (void)v41;
      if (v44 >> 4 > v43) {
        unint64_t v43 = v44 >> 4;
      }
      else {
        unint64_t v45 = v43;
      }
      if (v45)
      {
        if (v45 >> 59) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        uint64_t v46 = (char *)operator new(32 * v45);
      }

      else
      {
        uint64_t v46 = 0LL;
      }

      v55 = &v46[32 * v42];
      *(void *)v55 = 4LL;
      *((void *)v55 + 1) = v25;
      uint64_t v56 = &v46[32 * v45];
      *((void *)v55 + 2) = 0LL;
      v55[24] = 0;
      size_t v57 = v55 + 32;
      if (v16 != v41)
      {
        do
        {
          __int128 v59 = *((_OWORD *)v16 - 1);
          *((_OWORD *)v55 - 2) = *((_OWORD *)v16 - 2);
          *((_OWORD *)v55 - 1) = v59;
          v55 -= 32;
          v16 -= 32;
        }

        while (v16 != v41);
        goto LABEL_74;
      }
    }

    *a2 = v55;
    a2[1] = v57;
    a2[2] = v56;
    if (v16) {
      operator delete(v16);
    }
    a2[1] = v57;
    goto LABEL_33;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v27 = v3;
      __int128 v29 = (char *)a2[1];
      unint64_t v28 = a2[2];
      if ((unint64_t)v29 >= v28)
      {
        unint64_t v49 = (char *)*a2;
        uint64_t v50 = (uint64_t)&v29[-*a2] >> 5;
        unint64_t v51 = v50 + 1;
        uint64_t v52 = v28 - (void)v49;
        if (v52 >> 4 > v51) {
          unint64_t v51 = v52 >> 4;
        }
        else {
          unint64_t v53 = v51;
        }
        if (v53)
        {
          if (v53 >> 59) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v54 = (char *)operator new(32 * v53);
        }

        else
        {
          v54 = 0LL;
        }

        char v66 = &v54[32 * v50];
        *(void *)char v66 = 5LL;
        *((void *)v66 + 1) = 0LL;
        *((void *)v66 + 2) = 0LL;
        *((void *)v66 + 3) = 0LL;
        __int128 v30 = v66 + 32;
        if (v29 != v49)
        {
          do
          {
            __int128 v67 = *((_OWORD *)v29 - 1);
            *((_OWORD *)v66 - 2) = *((_OWORD *)v29 - 2);
            *((_OWORD *)v66 - 1) = v67;
            v66 -= 32;
            v29 -= 32;
          }

          while (v29 != v49);
          __int128 v29 = (char *)*a2;
        }

        *a2 = v66;
        a2[1] = v30;
        a2[2] = &v54[32 * v53];
        if (v29) {
          operator delete(v29);
        }
      }

      else
      {
        *(void *)__int128 v29 = 5LL;
        *((void *)v29 + 1) = 0LL;
        *((void *)v29 + 2) = 0LL;
        *((void *)v29 + 3) = 0LL;
        __int128 v30 = v29 + 32;
      }

      a2[1] = v30;
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v87 = 0u;
      __int128 v88 = 0u;
      id v68 = v27;
      uint64_t v69 = [v68 countByEnumeratingWithState:&v85 objects:v89 count:16];
      if (v69)
      {
        uint64_t v70 = *(void *)v86;
        while (2)
        {
          for (uint64_t i = 0LL; i != v69; ++i)
          {
            if (*(void *)v86 != v70) {
              objc_enumerationMutation(v68);
            }
            uint64_t v72 = *(void *)(*((void *)&v85 + 1) + 8 * i);
            if (!v72 || (void *)serializeId(v72, a2) != Errors)
            {

              goto LABEL_125;
            }
          }

          uint64_t v69 = [v68 countByEnumeratingWithState:&v85 objects:v89 count:16];
          if (v69) {
            continue;
          }
          break;
        }
      }

      __int128 v74 = (char *)a2[1];
      unint64_t v73 = a2[2];
      if ((unint64_t)v74 >= v73)
      {
        size_t v76 = (char *)*a2;
        uint64_t v77 = (uint64_t)&v74[-*a2] >> 5;
        unint64_t v78 = v77 + 1;
        uint64_t v79 = v73 - (void)v76;
        if (v79 >> 4 > v78) {
          unint64_t v78 = v79 >> 4;
        }
        else {
          unint64_t v80 = v78;
        }
        if (v80)
        {
          if (v80 >> 59) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          __int128 v81 = (char *)operator new(32 * v80);
        }

        else
        {
          __int128 v81 = 0LL;
        }

        size_t v83 = &v81[32 * v77];
        *(void *)size_t v83 = 6LL;
        *((void *)v83 + 1) = 0LL;
        *((void *)v83 + 2) = 0LL;
        *((void *)v83 + 3) = 0LL;
        __int128 v75 = v83 + 32;
        if (v74 != v76)
        {
          do
          {
            __int128 v84 = *((_OWORD *)v74 - 1);
            *((_OWORD *)v83 - 2) = *((_OWORD *)v74 - 2);
            *((_OWORD *)v83 - 1) = v84;
            v83 -= 32;
            v74 -= 32;
          }

          while (v74 != v76);
          __int128 v74 = (char *)*a2;
        }

        *a2 = v83;
        a2[1] = v75;
        a2[2] = &v81[32 * v80];
        if (v74) {
          operator delete(v74);
        }
      }

      else
      {
        *(void *)__int128 v74 = 6LL;
        *((void *)v74 + 1) = 0LL;
        *((void *)v74 + 2) = 0LL;
        *((void *)v74 + 3) = 0LL;
        __int128 v75 = v74 + 32;
      }

      a2[1] = v75;
LABEL_125:

      goto LABEL_34;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __int128 v23 = &unk_189B57798;
      goto LABEL_35;
    }

    id v47 = v3;
    uint64_t v5 = [v47 bytes];
    uint64_t v6 = [v47 length];
    __int128 v8 = (char *)a2[1];
    unint64_t v48 = a2[2];
    if ((unint64_t)v8 < v48)
    {
      uint64_t v9 = 9LL;
      goto LABEL_4;
    }

    size_t v60 = (char *)*a2;
    uint64_t v61 = (uint64_t)&v8[-*a2] >> 5;
    unint64_t v62 = v61 + 1;
    uint64_t v63 = v48 - (void)v60;
    if (v63 >> 4 > v62) {
      unint64_t v62 = v63 >> 4;
    }
    else {
      unint64_t v64 = v62;
    }
    if (v64)
    {
      if (v64 >> 59) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      BOOL v65 = (char *)operator new(32 * v64);
    }

    else
    {
      BOOL v65 = 0LL;
    }

    uint64_t v31 = &v65[32 * v61];
    *(void *)uint64_t v31 = 9LL;
    *((void *)v31 + 1) = v5;
    uint64_t v32 = &v65[32 * v64];
    *((void *)v31 + 2) = v6;
    v31[24] = 0;
    __int16 v10 = v31 + 32;
    if (v8 != v60)
    {
      do
      {
        __int128 v82 = *((_OWORD *)v8 - 1);
        *((_OWORD *)v31 - 2) = *((_OWORD *)v8 - 2);
        *((_OWORD *)v31 - 1) = v82;
        v31 -= 32;
        v8 -= 32;
      }

      while (v8 != v60);
      goto LABEL_29;
    }

void sub_181144DF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<CESerializedElement>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  unint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x189614700], MEMORY[0x189614270]);
}

void *serializeDict(void *a1, char **a2)
{
  uint64_t v85 = *MEMORY[0x1895F89C0];
  id v79 = a1;
  id v4 = a2[1];
  unint64_t v3 = (unint64_t)a2[2];
  if ((unint64_t)v4 >= v3)
  {
    uint64_t v6 = *a2;
    uint64_t v7 = (v4 - *a2) >> 5;
    unint64_t v8 = v7 + 1;
    uint64_t v9 = v3 - (void)v6;
    if (v9 >> 4 > v8) {
      unint64_t v8 = v9 >> 4;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10)
    {
      if (v10 >> 59) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      id v11 = (char *)operator new(32 * v10);
    }

    else
    {
      id v11 = 0LL;
    }

    CFTypeID v12 = &v11[32 * v7];
    *(void *)CFTypeID v12 = 7LL;
    *((void *)v12 + 1) = 0LL;
    *((void *)v12 + 2) = 0LL;
    *((void *)v12 + 3) = 0LL;
    uint64_t v5 = v12 + 32;
    if (v4 != v6)
    {
      do
      {
        __int128 v13 = *((_OWORD *)v4 - 1);
        *((_OWORD *)v12 - 2) = *((_OWORD *)v4 - 2);
        *((_OWORD *)v12 - 1) = v13;
        v12 -= 32;
        v4 -= 32;
      }

      while (v4 != v6);
      id v4 = *a2;
    }

    *a2 = v12;
    a2[1] = v5;
    a2[2] = &v11[32 * v10];
    if (v4) {
      operator delete(v4);
    }
  }

  else
  {
    *(void *)id v4 = 7LL;
    *((void *)v4 + 1) = 0LL;
    *((void *)v4 + 2) = 0LL;
    *((void *)v4 + 3) = 0LL;
    uint64_t v5 = v4 + 32;
  }

  a2[1] = v5;
  uint64_t v14 = (void *)MEMORY[0x189603FA8];
  [v79 allKeys];
  unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 arrayWithArray:v15];
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "sortUsingSelector:", sel_compare_, v16);
  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  id obj = v16;
  uint64_t v17 = [obj countByEnumeratingWithState:&v80 objects:v84 count:16];
  if (v17)
  {
    uint64_t v78 = *(void *)v81;
LABEL_20:
    uint64_t v18 = 0LL;
    while (1)
    {
      if (*(void *)v81 != v78) {
        objc_enumerationMutation(obj);
      }
      unint64_t v19 = *(void **)(*((void *)&v80 + 1) + 8 * v18);
      unint64_t v21 = a2[1];
      unint64_t v20 = (unint64_t)a2[2];
      if ((unint64_t)v21 >= v20)
      {
        __int128 v23 = *a2;
        uint64_t v24 = (v21 - *a2) >> 5;
        unint64_t v25 = v24 + 1;
        uint64_t v26 = v20 - (void)v23;
        if (v26 >> 4 > v25) {
          unint64_t v25 = v26 >> 4;
        }
        unint64_t v27 = (unint64_t)v26 >= 0x7FFFFFFFFFFFFFE0LL ? 0x7FFFFFFFFFFFFFFLL : v25;
        if (v27)
        {
          if (v27 >> 59) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          unint64_t v28 = (char *)operator new(32 * v27);
        }

        else
        {
          unint64_t v28 = 0LL;
        }

        __int128 v29 = &v28[32 * v24];
        *(void *)__int128 v29 = 5LL;
        *((void *)v29 + 1) = 0LL;
        *((void *)v29 + 2) = 0LL;
        *((void *)v29 + 3) = 0LL;
        __int128 v30 = v29;
        if (v21 != v23)
        {
          do
          {
            __int128 v31 = *((_OWORD *)v21 - 1);
            *((_OWORD *)v30 - 2) = *((_OWORD *)v21 - 2);
            *((_OWORD *)v30 - 1) = v31;
            v30 -= 32;
            v21 -= 32;
          }

          while (v21 != v23);
          unint64_t v21 = *a2;
        }

        __int128 v22 = v29 + 32;
        *a2 = v30;
        a2[1] = v29 + 32;
        a2[2] = &v28[32 * v27];
        if (v21) {
          operator delete(v21);
        }
      }

      else
      {
        *(void *)unint64_t v21 = 5LL;
        *((void *)v21 + 1) = 0LL;
        __int128 v22 = v21 + 32;
        *((void *)v21 + 2) = 0LL;
        *((void *)v21 + 3) = 0LL;
      }

      a2[1] = v22;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      id v32 = v19;
      uint64_t v33 = [v32 UTF8String];
      uint64_t v34 = [v32 lengthOfBytesUsingEncoding:4];
      uint64_t v35 = v34;
      unint64_t v37 = a2[1];
      unint64_t v36 = (unint64_t)a2[2];
      if ((unint64_t)v37 >= v36)
      {
        unint64_t v39 = *a2;
        uint64_t v40 = (v37 - *a2) >> 5;
        unint64_t v41 = v40 + 1;
        uint64_t v42 = v36 - (void)v39;
        if (v42 >> 4 > v41) {
          unint64_t v41 = v42 >> 4;
        }
        else {
          unint64_t v43 = v41;
        }
        if (v43)
        {
          if (v43 >> 59) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          uint64_t v44 = (char *)operator new(32 * v43);
        }

        else
        {
          uint64_t v44 = 0LL;
        }

        unint64_t v45 = &v44[32 * v40];
        *(void *)unint64_t v45 = 3LL;
        *((void *)v45 + 1) = v33;
        *((void *)v45 + 2) = v35;
        v45[24] = 0;
        uint64_t v46 = v45;
        if (v37 != v39)
        {
          do
          {
            __int128 v47 = *((_OWORD *)v37 - 1);
            *((_OWORD *)v46 - 2) = *((_OWORD *)v37 - 2);
            *((_OWORD *)v46 - 1) = v47;
            v46 -= 32;
            v37 -= 32;
          }

          while (v37 != v39);
          unint64_t v37 = *a2;
        }

        unint64_t v48 = &v44[32 * v43];
        uint64_t v38 = v45 + 32;
        *a2 = v46;
        a2[1] = v45 + 32;
        a2[2] = v48;
        if (v37) {
          operator delete(v37);
        }
      }

      else
      {
        *(void *)unint64_t v37 = 3LL;
        *((void *)v37 + 1) = v33;
        *((void *)v37 + 2) = v34;
        uint64_t v38 = v37 + 32;
        v37[24] = 0;
      }

      a2[1] = v38;
      [v79 objectForKeyedSubscript:v32];
      unint64_t v49 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v50 = v49;
      if (!v49)
      {
        unint64_t v51 = &unk_189B57798;
LABEL_83:

LABEL_84:
        goto LABEL_101;
      }

      unint64_t v51 = serializeId(v49, a2);
      if (v51 != Errors) {
        goto LABEL_83;
      }
      unint64_t v53 = a2[1];
      unint64_t v52 = (unint64_t)a2[2];
      if ((unint64_t)v53 >= v52)
      {
        v55 = *a2;
        uint64_t v56 = (v53 - *a2) >> 5;
        unint64_t v57 = v56 + 1;
        uint64_t v58 = v52 - (void)v55;
        if (v58 >> 4 > v57) {
          unint64_t v57 = v58 >> 4;
        }
        else {
          unint64_t v59 = v57;
        }
        if (v59)
        {
          if (v59 >> 59) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          size_t v60 = (char *)operator new(32 * v59);
        }

        else
        {
          size_t v60 = 0LL;
        }

        uint64_t v61 = &v60[32 * v56];
        *(void *)uint64_t v61 = 6LL;
        *((void *)v61 + 1) = 0LL;
        *((void *)v61 + 2) = 0LL;
        *((void *)v61 + 3) = 0LL;
        unint64_t v62 = v61;
        if (v53 != v55)
        {
          do
          {
            __int128 v63 = *((_OWORD *)v53 - 1);
            *((_OWORD *)v62 - 2) = *((_OWORD *)v53 - 2);
            *((_OWORD *)v62 - 1) = v63;
            v62 -= 32;
            v53 -= 32;
          }

          while (v53 != v55);
          unint64_t v53 = *a2;
        }

        unint64_t v64 = &v60[32 * v59];
        v54 = v61 + 32;
        *a2 = v62;
        a2[1] = v61 + 32;
        a2[2] = v64;
        if (v53) {
          operator delete(v53);
        }
      }

      else
      {
        *(void *)unint64_t v53 = 6LL;
        *((void *)v53 + 1) = 0LL;
        v54 = v53 + 32;
        *((void *)v53 + 2) = 0LL;
        *((void *)v53 + 3) = 0LL;
      }

      a2[1] = v54;

      if (++v18 == v17)
      {
        uint64_t v17 = [obj countByEnumeratingWithState:&v80 objects:v84 count:16];
        if (v17) {
          goto LABEL_20;
        }
        goto LABEL_79;
      }
    }

    unint64_t v51 = &unk_189B57798;
    goto LABEL_84;
  }

LABEL_79:
  char v66 = a2[1];
  unint64_t v65 = (unint64_t)a2[2];
  if ((unint64_t)v66 >= v65)
  {
    id v68 = *a2;
    uint64_t v69 = (v66 - *a2) >> 5;
    unint64_t v70 = v69 + 1;
    uint64_t v71 = v65 - (void)v68;
    if (v71 >> 4 > v70) {
      unint64_t v70 = v71 >> 4;
    }
    else {
      unint64_t v72 = v70;
    }
    if (v72)
    {
      if (v72 >> 59) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      unint64_t v73 = (char *)operator new(32 * v72);
    }

    else
    {
      unint64_t v73 = 0LL;
    }

    __int128 v74 = &v73[32 * v69];
    *(void *)__int128 v74 = 8LL;
    *((void *)v74 + 1) = 0LL;
    *((void *)v74 + 2) = 0LL;
    *((void *)v74 + 3) = 0LL;
    __int128 v67 = v74 + 32;
    if (v66 != v68)
    {
      do
      {
        __int128 v75 = *((_OWORD *)v66 - 1);
        *((_OWORD *)v74 - 2) = *((_OWORD *)v66 - 2);
        *((_OWORD *)v74 - 1) = v75;
        v74 -= 32;
        v66 -= 32;
      }

      while (v66 != v68);
      char v66 = *a2;
    }

    *a2 = v74;
    a2[1] = v67;
    a2[2] = &v73[32 * v72];
    if (v66) {
      operator delete(v66);
    }
  }

  else
  {
    *(void *)char v66 = 8LL;
    *((void *)v66 + 1) = 0LL;
    *((void *)v66 + 2) = 0LL;
    *((void *)v66 + 3) = 0LL;
    __int128 v67 = v66 + 32;
  }

  a2[1] = v67;
  unint64_t v51 = Errors;
LABEL_101:

  return v51;
}

void sub_1811454E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, void *a12)
{
}

void std::__throw_length_error[abi:ne180100]()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_189B574B0, MEMORY[0x1896141F8]);
}

void sub_1811455A8(_Unwind_Exception *a1)
{
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  BOOL result = std::logic_error::logic_error(a1, "vector");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x189614778] + 16LL);
  return result;
}

void *CESerializeCFDictionaryWithOptions(uint64_t a1, _BYTE *a2, void *a3, void *a4)
{
  __p = 0LL;
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  uint64_t v7 = serializeDict(a3, (char **)&__p);
  unint64_t v8 = __p;
  if (v7 == Errors)
  {
    uint64_t v15 = 0LL;
    uint64_t v9 = (v17 - (uint64_t)__p) >> 5;
    uint64_t v7 = CESizeSerialization(__p, v9, &v15);
    if (v7 == Errors)
    {
      uint64_t v10 = v15;
      id v11 = [MEMORY[0x189603FB8] dataWithLength:v15];
      unint64_t v12 = [v11 bytes];
      id v13 = v11;
      uint64_t v7 = (void *)CESerializeWithOptions(a1, a2, (unint64_t)v8, v9, v12, [v13 bytes] + v10);
      if (v7 == Errors)
      {
        *a4 = v13;
        uint64_t v7 = Errors;
      }
    }
  }

  if (v8) {
    operator delete(v8);
  }
  return v7;
}

void sub_181145714( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (v10) {
    operator delete(v10);
  }
  _Unwind_Resume(exception_object);
}

void *CESerializeCFDictionary(uint64_t a1, void *a2, void *a3)
{
  char v4 = 0;
  return CESerializeCFDictionaryWithOptions(a1, &v4, a2, a3);
}

void *ce_malloc(int a1, size_t __size)
{
  return malloc(__size);
}

void ce_free(int a1, void *a2)
{
}

void ce_log( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void ce_abort( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

uint64_t CEManagedContextFromCFData(void *a1, CFDataRef theData, void *a3)
{
  __int128 v10 = 0uLL;
  uint64_t v11 = 0LL;
  BytePtr = CFDataGetBytePtr(theData);
  uint64_t result = CFDataGetLength(theData);
  LOBYTE(v8) = 0;
  if (result < 0)
  {
    __break(0x5519u);
  }

  else
  {
    uint64_t result = (uint64_t)CEValidateWithOptions( a1,  &v8,  &v10,  (unint64_t)BytePtr,  (unint64_t)&BytePtr[result]);
    if ((void *)result == Errors)
    {
      __int128 v8 = v10;
      uint64_t v9 = v11;
      return (uint64_t)CEAcquireManagedContext((uint64_t)a1, &v8, a3);
    }
  }

  return result;
}

void *CEManagedContextFromCFDataWithOptions(void *a1, _BYTE *a2, CFDataRef theData, void *a4)
{
  __int128 v13 = 0uLL;
  uint64_t v14 = 0LL;
  BytePtr = CFDataGetBytePtr(theData);
  CFIndex Length = CFDataGetLength(theData);
  uint64_t result = CEValidateWithOptions(a1, a2, &v13, (unint64_t)BytePtr, (unint64_t)&BytePtr[Length]);
  if (result == Errors)
  {
    __int128 v11 = v13;
    uint64_t v12 = v14;
    return CEAcquireManagedContext((uint64_t)a1, &v11, a4);
  }

  return result;
}

id objectForActiveContext(uint64_t a1)
{
  unint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = *(unsigned __int8 *)(a1 + 33);
  __n128 v5 = *(__n128 *)(a1 + 40);
  *(void *)&__int128 v21 = 0LL;
  if (v4)
  {
    uint64_t v1 = a1;
    __n128 v17 = v5;
    if (der_decode_next(v2, &v21, 0LL, 0LL, (uint64_t *)&v17))
    {
      if (v3 == (void)v21)
      {
LABEL_4:
        uint64_t v6 = [MEMORY[0x189603FC8] dictionaryWithCapacity:0];
LABEL_5:
        uint64_t v7 = (void *)v6;
        __int128 v8 = *(_OWORD *)(v1 + 16);
        __n128 v17 = *(__n128 *)v1;
        __int128 v18 = v8;
        __int128 v19 = *(_OWORD *)(v1 + 32);
        uint64_t v20 = *(void *)(v1 + 48);
        *(void *)&__int128 v21 = MEMORY[0x1895F87A8];
        *((void *)&v21 + 1) = 0x40000000LL;
        __int128 v22 = __der_vm_iterate_block_invoke;
        __int128 v23 = &__block_descriptor_tmp_156;
        uint64_t v24 = v6;
        unint64_t v25 = manufacturingCallback;
        der_vm_iterate_b((uint64_t)&v17, (uint64_t)&v21);
        return v7;
      }

      if ((uint64_t)v21 > 0x200000000000000FLL)
      {
        if ((void)v21 == 0x6000000000000010LL || (void)v21 == 0x2000000000000010LL)
        {
          uint64_t v6 = [MEMORY[0x189603FA8] arrayWithCapacity:0];
          goto LABEL_5;
        }
      }

      else
      {
        switch((uint64_t)v21)
        {
          case 1LL:
            __int128 v9 = *(_OWORD *)(v1 + 16);
            __n128 v17 = *(__n128 *)v1;
            __int128 v18 = v9;
            __int128 v19 = *(_OWORD *)(v1 + 32);
            uint64_t v20 = *(void *)(v1 + 48);
            int v10 = der_vm_BOOL_from_context(v17.n128_u64);
            __int128 v11 = (void *)MEMORY[0x189604A80];
            if (v10) {
              __int128 v11 = (void *)MEMORY[0x189604A88];
            }
            id v12 = v11;
            goto LABEL_21;
          case 2LL:
            goto LABEL_16;
          case 3LL:
          case 5LL:
          case 6LL:
          case 7LL:
          case 8LL:
          case 9LL:
          case 10LL:
          case 11LL:
            break;
          case 4LL:
            unint64_t v2 = *(void *)v1;
            __int128 v21 = *(_OWORD *)(v1 + 40);
            __n128 v17 = 0uLL;
            if ((ccder_blob_decode_range() & 1) != 0)
            {
              id v12 = (id)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v17.n128_u64[0] length:v17.n128_u64[1] - v17.n128_u64[0]];
              goto LABEL_21;
            }

            __int128 v16 = *(void (**)(unint64_t, const char *, ...))(v2 + 24);
            if (v16) {
              v16(v2, "[%s]: %s\n", "der_decode_data", "Unknown data encoding");
            }
            if (v2 && v2 >= v2 + 64) {
              goto LABEL_32;
            }
            break;
          case 12LL:
            unint64_t v2 = *(void *)v1;
            __int128 v21 = *(_OWORD *)(v1 + 40);
            __n128 v17 = 0uLL;
            if ((ccder_blob_decode_range() & 1) != 0)
            {
              id v12 = (id)[objc_alloc(NSString) initWithBytes:v17.n128_u64[0] length:v17.n128_u64[1] - v17.n128_u64[0] encoding:4];
              goto LABEL_21;
            }

            uint64_t v15 = *(void (**)(unint64_t, const char *, ...))(v2 + 24);
            if (v15) {
              v15(v2, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
            }
            if (v2 && v2 >= v2 + 64) {
LABEL_32:
            }
              __break(0x5519u);
            break;
          default:
            if ((void)v21 != 0xA000000000000010LL) {
              break;
            }
            goto LABEL_4;
        }
      }
    }
  }

  (*(void (**)(unint64_t, const char *, __n128))(v2 + 32))(v2, "[%s]: %s\n", v5);
LABEL_16:
  __int128 v13 = *(_OWORD *)(v1 + 16);
  __n128 v17 = *(__n128 *)v1;
  __int128 v18 = v13;
  __int128 v19 = *(_OWORD *)(v1 + 32);
  uint64_t v20 = *(void *)(v1 + 48);
  [MEMORY[0x189607968] numberWithLongLong:der_vm_integer_from_context(v17.n128_u64)];
  id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:
  uint64_t v7 = v12;
  return v7;
}

uint64_t manufacturingCallback(unint64_t a1)
{
  unint64_t v1 = a1;
  uint64_t v29 = *MEMORY[0x1895F89C0];
  unint64_t v2 = *(void (***)(void, const char *, ...))a1;
  id v3 = *(id *)(a1 + 120);
  id v4 = *(id *)(v1 + 120);
  int v5 = *(_DWORD *)(v1 + 116);
  if (v5 != 2)
  {
    if (v5)
    {
      if (*(_DWORD *)(v1 + 112) == 2)
      {
        __int128 v6 = *(_OWORD *)(v1 + 72);
        v28[0] = *(_OWORD *)(v1 + 56);
        v28[1] = v6;
        void v28[2] = *(_OWORD *)(v1 + 88);
        *(void *)&v28[3] = *(void *)(v1 + 104);
        objectForActiveContext((uint64_t)v28);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 addObject:v7];

LABEL_10:
        return 1LL;
      }

      v2[4](v2, "[%s]: %s\n", "manufacturingCallback", "CoreEntitlements: not a sequence");
    }

    else
    {
      v2[4](v2, "[%s]: %s\n", "manufacturingCallback", "CoreEntitlements: unknown DER type");
    }

    goto LABEL_19;
  }

  if (*(_DWORD *)(v1 + 112) != 1)
  {
    [MEMORY[0x189603FA8] arrayWithCapacity:0];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v14 = *(_OWORD *)(v1 + 72);
    v28[0] = *(_OWORD *)(v1 + 56);
    v28[1] = v14;
    void v28[2] = *(_OWORD *)(v1 + 88);
    *(void *)&v28[3] = *(void *)(v1 + 104);
    *(void *)&__int128 v24 = MEMORY[0x1895F87A8];
    *((void *)&v24 + 1) = 0x40000000LL;
    *(void *)&__int128 v25 = __der_vm_iterate_block_invoke;
    *((void *)&v25 + 1) = &__block_descriptor_tmp_156;
    *(void *)&__int128 v26 = v13;
    *((void *)&v26 + 1) = manufacturingCallback;
    if ((void *)der_vm_iterate_b((uint64_t)v28, (uint64_t)&v24) == Errors)
    {
      [v4 addObject:v13];

      goto LABEL_10;
    }

    goto LABEL_18;
  }

  __int128 v18 = *(_OWORD *)(v1 + 56);
  __int128 v19 = *(_OWORD *)(v1 + 72);
  __int128 v20 = *(_OWORD *)(v1 + 88);
  uint64_t v21 = *(void *)(v1 + 104);
  memset(v23, 0, 56);
  memset((char *)v28 + 8, 0, 248);
  __int128 v8 = *(_OWORD *)(v1 + 72);
  __int128 v24 = *(_OWORD *)(v1 + 56);
  __int128 v25 = v8;
  __int128 v26 = *(_OWORD *)(v1 + 88);
  uint64_t v27 = *(void *)(v1 + 104);
  *(void *)&v28[0] = 2LL;
  unint64_t v2 = (void (**)(void, const char *, ...))v3;
  der_vm_execute_nocopy((unint64_t)&v24, (size_t *)v28, (uint64_t)v23);
  unint64_t v1 = *(void *)&v23[0];
  __int128 v24 = *(_OWORD *)((char *)&v23[2] + 8);
  v28[0] = 0uLL;
  if ((ccder_blob_decode_range() & 1) != 0)
  {
    uint64_t v9 = *(void *)&v28[0];
    uint64_t v10 = *((void *)&v28[0] + 1) - *(void *)&v28[0];
    __int128 v24 = v18;
    __int128 v25 = v19;
    __int128 v26 = v20;
    uint64_t v27 = v21;
    v28[0] = xmmword_1811463E0;
    memset(&v28[1], 0, 240);
    der_vm_execute_nocopy((unint64_t)&v24, (size_t *)v28, (uint64_t)v22);
    objectForActiveContext((uint64_t)v22);
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = (void *)[objc_alloc(NSString) initWithBytes:v9 length:v10 encoding:4];
    [v2 setObject:v11 forKey:v12];

    goto LABEL_10;
  }

  __int128 v16 = *(void (**)(unint64_t, const char *, ...))(v1 + 24);
  if (v16) {
    v16(v1, "[%s]: %s\n", "der_decode_string", "Unknown string encoding");
  }
  if (v1 && v1 >= v1 + 64)
  {
    __break(0x5519u);
LABEL_18:
    v2[4](v2, "[%s]: %s\n", "manufacturingCallback", "CoreEntitlements: Couldn't iterate over DER entitlements\n");
  }

uint64_t CEQueryContextToCFDictionary(uint64_t a1, void *a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v5 = *(_OWORD *)(a1 + 16);
  v9[0] = *(_OWORD *)a1;
  v9[1] = v5;
  v9[2] = *(_OWORD *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 48);
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 0x40000000LL;
  v11[2] = __der_vm_iterate_block_invoke;
  _OWORD v11[3] = &__block_descriptor_tmp_156;
  v11[4] = v4;
  v11[5] = manufacturingCallback;
  if ((void *)der_vm_iterate_b((uint64_t)v9, (uint64_t)v11) == Errors)
  {
    *a2 = v4;
    __int128 v6 = (uint64_t *)&kCENoError;
  }

  else
  {
    __int128 v6 = (uint64_t *)&kCEMalformedEntitlements;
  }

  uint64_t v7 = *v6;

  return v7;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1896141E0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x189614268](this);
}

void operator delete(void *__p)
{
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_189B574D0(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1896147A0](thrown_size);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void abort(void)
{
}

uint64_t cc_clear()
{
  return MEMORY[0x1895F9748]();
}

uint64_t ccder_blob_decode_len()
{
  return MEMORY[0x1895F98C0]();
}

uint64_t ccder_blob_decode_range()
{
  return MEMORY[0x1895F98D0]();
}

uint64_t ccder_blob_decode_sequence_tl()
{
  return MEMORY[0x1895F98D8]();
}

uint64_t ccder_blob_decode_tag()
{
  return MEMORY[0x1895F98E0]();
}

uint64_t ccder_blob_decode_tl()
{
  return MEMORY[0x1895F98E8]();
}

uint64_t ccder_blob_encode_body_tl()
{
  return MEMORY[0x1895F9900]();
}

uint64_t ccder_blob_encode_tl()
{
  return MEMORY[0x1895F9918]();
}

uint64_t ccder_blob_reserve_tl()
{
  return MEMORY[0x1895F9920]();
}

uint64_t ccder_sizeof()
{
  return MEMORY[0x1895F99D0]();
}

void free(void *a1)
{
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}