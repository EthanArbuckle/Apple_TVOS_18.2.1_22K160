uint64_t amfi_check_dyld_policy_self(uint64_t a1, void *a2)
{
  uint64_t result;
  void v4[3];
  if (!a2) {
    return 22LL;
  }
  *a2 = 0LL;
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  v4[1] = a1;
  v4[2] = v4;
  result = __sandbox_ms();
  if ((_DWORD)result) {
    result = *__error();
  }
  *a2 = v4[0];
  return result;
}

uint64_t amfi_check_dyld_policy_for_pid(int a1, uint64_t a2, void *a3)
{
  if (!a3) {
    return 22LL;
  }
  *a3 = 0LL;
  int v7 = -1431655766;
  v5[0] = 0xAAAAAAAAAAAAAAAALL;
  v5[1] = a2;
  v5[2] = v5;
  int v6 = a1;
  uint64_t result = __sandbox_ms();
  if ((_DWORD)result) {
    uint64_t result = *__error();
  }
  *a3 = v5[0];
  return result;
}

uint64_t amfi_load_trust_cache()
{
  return __sandbox_ms();
}
}

void *_os_log_set_nscf_formatter(void *result)
{
  _NSCF_function = result;
  return result;
}

void *_os_log_get_nscf_formatter()
{
  return _NSCF_function;
}

uint64_t _os_log_fmt_flatten_object_impl( _BYTE *a1, unsigned int a2, uint64_t a3, objc_class *a4, size_t a5, uint64_t a6, uint64_t a7, size_t a8, char a9)
{
  uint64_t v44 = *MEMORY[0x1895FEE08];
  HIBYTE(v40) = a9;
  if ((-[objc_class isProxy](a4, "isProxy") & 1) != 0)
  {
LABEL_2:
    size_t v17 = a5;
    if (a8 >= 0x400)
    {
      while (1)
      {
        v21 = (char *)malloc(a8);
        if (v21) {
          break;
        }
        _os_trace_temporary_resource_shortage();
      }

      v19 = v21;
      string_ptr = _os_log_fmt_flatten_NSCF(a4, v21, a8, (_BYTE *)&v40 + 7);
    }

    else
    {
      MEMORY[0x1895FE128]();
      string_ptr = _os_log_fmt_flatten_NSCF( a4,  (char *)&v40 - ((a8 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a8,  (_BYTE *)&v40 + 7);
      v19 = 0LL;
    }

    goto LABEL_66;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0) {
    return _os_log_fmt_flatten_coder((uint64_t)a1, a4, a8, a2, a3, a6, a7);
  }
  __stringp = out;
  if (object_isClass(a4))
  {
    Name = class_getName(a4);
    goto LABEL_11;
  }

  if (-[objc_class isNSString](a4, "isNSString"))
  {
    int v24 = -[objc_class isNSCFConstantString](a4, "isNSCFConstantString") ^ 1;
    uint64_t v25 = -[objc_class _fastCStringContents:](a4, "_fastCStringContents:", 1LL);
    char v23 = v24;
    string_ptr = (const char *)v25;
    if (!v25) {
      goto LABEL_2;
    }
    goto LABEL_65;
  }

  if (-[objc_class isNSNumber](a4, "isNSNumber"))
  {
    v26 = (_BYTE *)-[objc_class objCType](a4, "objCType");
    char v23 = 0;
    int v27 = (char)*v26;
    string_ptr = "<NSNumber: invalid type>";
    if (v27 > 80)
    {
      switch(*v26)
      {
        case 'c':
          goto LABEL_43;
        case 'd':
          -[objc_class doubleValue](a4, "doubleValue");
          v29 = "%0.16g";
          goto LABEL_52;
        case 'e':
        case 'g':
        case 'h':
        case 'j':
        case 'k':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
          goto LABEL_65;
        case 'f':
          -[objc_class floatValue](a4, "floatValue");
          double v28 = v35;
          v29 = "%0.7g";
          goto LABEL_52;
        case 'i':
          *(double *)&uint64_t v33 = COERCE_DOUBLE(-[objc_class intValue](a4, "intValue"));
          v29 = "%d";
          goto LABEL_63;
        case 'l':
          *(double *)&uint64_t v33 = COERCE_DOUBLE(-[objc_class longValue](a4, "longValue"));
          v29 = "%ld";
          goto LABEL_63;
        case 'q':
          *(double *)&uint64_t v33 = COERCE_DOUBLE(-[objc_class longLongValue](a4, "longLongValue"));
          goto LABEL_60;
        case 's':
          *(void *)&double v32 = (int)-[objc_class shortValue](a4, "shortValue");
          v29 = "%hi";
          break;
        default:
          if (v27 == 81)
          {
            *(double *)&uint64_t v33 = COERCE_DOUBLE(-[objc_class unsignedLongLongValue](a4, "unsignedLongLongValue"));
            goto LABEL_62;
          }

          if (v27 != 83) {
            goto LABEL_65;
          }
          *(void *)&double v32 = -[objc_class unsignedShortValue](a4, "unsignedShortValue");
          v29 = "%hu";
          break;
      }

LABEL_57:
      double v39 = v32;
      goto LABEL_64;
    }

    if (v27 <= 72)
    {
      if (v27 == 66)
      {
LABEL_43:
        *(void *)&double v32 = (int)-[objc_class charValue](a4, "charValue");
        v29 = "%d";
      }

      else
      {
        if (v27 != 67) {
          goto LABEL_65;
        }
        *(void *)&double v32 = -[objc_class unsignedCharValue](a4, "unsignedCharValue");
        v29 = "%u";
      }

      goto LABEL_57;
    }

    if (v27 == 73)
    {
      *(double *)&uint64_t v33 = COERCE_DOUBLE(-[objc_class unsignedIntValue](a4, "unsignedIntValue"));
      v29 = "%u";
    }

    else
    {
      if (v27 != 76) {
        goto LABEL_65;
      }
      *(double *)&uint64_t v33 = COERCE_DOUBLE(-[objc_class unsignedLongValue](a4, "unsignedLongValue"));
      v29 = "%lu";
    }

  uint64_t result = os_trace_blob_addf(v10, "length=%u", a3, a4, a5, a6, a7, a8, v17);
  uint64_t v37 = v15 - 4;
  if (v37 >= v16) {
    v38 = v16;
  }
  else {
    v38 = v37;
  }
  if (v38)
  {
    double v39 = (uint64_t)(a2 + 4);
    if ((*(_WORD *)(v10 + 20) & 2) == 0)
    {
      uint64_t v40 = *(unsigned int *)(v10 + 8);
      if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v40 - 1) <= 1)
      {
        os_trace_blob_add_slow(v10, ", ", 2uLL);
      }

      else
      {
        *(_WORD *)(*(void *)v10 + v40) = 8236;
        time_t v41 = *(_DWORD *)(v10 + 8) + 2;
        *(_DWORD *)(v10 + 8) = v41;
        if (!*(_BYTE *)(v10 + 22)) {
          *(_BYTE *)(*(void *)v10 + v41) = 0;
        }
      }
    }

    uint64_t result = os_trace_blob_add_hexdump(v10, v39, v38, v37 < v16);
  }

  if ((*(_WORD *)(v10 + 20) & 2) == 0)
  {
    v42 = *(unsigned int *)(v10 + 8);
    if (*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - 1 == (_DWORD)v42)
    {
      v43 = ">";
      uint64_t result = v10;
      uint64_t v44 = 1LL;
      return os_trace_blob_add_slow(result, v43, v44);
    }

    *(_BYTE *)(*(void *)v10 + v42) = 62;
    v12 = *(_DWORD *)(v10 + 8) + 1;
    goto LABEL_69;
  }

  return result;
}

LABEL_63:
    double v39 = *(double *)&v33;
    goto LABEL_64;
  }

  if (-[objc_class isNSDate](a4, "isNSDate"))
  {
    -[objc_class timeIntervalSince1970](a4, "timeIntervalSince1970");
    time_t v41 = (uint64_t)v30;
    if (!ctime_r(&v41, out))
    {
      string_ptr = 0LL;
LABEL_12:
      char v23 = 0;
      if (!string_ptr) {
        goto LABEL_2;
      }
      goto LABEL_65;
    }

    Name = strsep(&__stringp, "\n\r");
LABEL_11:
    string_ptr = Name;
    goto LABEL_12;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_2;
  }
  Class Class = object_getClass(a4);
  if (Class != (Class)MEMORY[0x1896009B8])
  {
    if (Class == (Class)MEMORY[0x1896009C8])
    {
      bytes = xpc_uuid_get_bytes(a4);
      string_ptr = out;
      uuid_unparse_upper(bytes, out);
      char v23 = 1;
      goto LABEL_65;
    }

    if (Class == (Class)MEMORY[0x1896009A8])
    {
      *(double *)&uint64_t v33 = COERCE_DOUBLE(xpc_int64_get_value(a4));
LABEL_60:
      v29 = "%lld";
    }

    else
    {
      if (Class != (Class)MEMORY[0x1896009C0])
      {
        if (Class != (Class)MEMORY[0x189600988])
        {
          if (Class == (Class)MEMORY[0x189600960])
          {
            BOOL value = xpc_BOOL_get_value(a4);
            char v23 = 0;
            if (value) {
              string_ptr = "true";
            }
            else {
              string_ptr = "false";
            }
            goto LABEL_65;
          }

          if (Class == (Class)MEMORY[0x1896009B0])
          {
            char v23 = 0;
            string_ptr = "(null)";
            goto LABEL_65;
          }

          if (Class != (Class)MEMORY[0x189600998])
          {
            if (Class == (Class)MEMORY[0x189600978]) {
              goto LABEL_2;
            }
            char v23 = 0;
            string_ptr = "<xpc object>";
            goto LABEL_65;
          }

          Name = xpc_dictionary_get_string(a4, (const char *)*MEMORY[0x189600940]);
          goto LABEL_11;
        }

        double v28 = xpc_double_get_value(a4);
        v29 = "%f";
LABEL_52:
        double v39 = v28;
LABEL_64:
        string_ptr = out;
        __sprintf_chk(out, 0, 0x40uLL, v29, *(void *)&v39);
        char v23 = 0;
        goto LABEL_65;
      }

      *(double *)&uint64_t v33 = COERCE_DOUBLE(xpc_uint64_get_value(a4));
LABEL_62:
      v29 = "%llu";
    }

    goto LABEL_63;
  }

  string_ptr = xpc_string_get_string_ptr(a4);
  char v23 = 1;
  if (!string_ptr) {
    goto LABEL_2;
  }
LABEL_65:
  size_t v17 = a5;
  v19 = 0LL;
  HIBYTE(v40) = v23;
LABEL_66:
  if ((*a1 & 7) == 0 && HIBYTE(v40) != 0) {
    *a1 |= 1u;
  }
  uint64_t v37 = _os_log_fmt_flatten_to_blob((uint64_t)a1, a2, a3, a4, v17, a6, a7, a8, (unint64_t)string_ptr, 0LL);
  free(v19);
  return v37;
}

uint64_t _os_log_fmt_flatten_coder( uint64_t a1, void *a2, size_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v26[1] = *MEMORY[0x1895FEE08];
  v14 = (objc_class *)objc_opt_class();
  class_getInstanceSize(v14);
  v15 = (char *)v26 - ((MEMORY[0x1895FE128]() + 15) & 0xFFFFFFFFFFFFFFF0LL);
  bzero(v15, v16);
  size_t v17 = objc_constructInstance(v14, v15);
  v17[1] = a1;
  v17[3] = a6;
  v17[4] = a7;
  *((_BYTE *)v17 + 40) = a4;
  *((_BYTE *)v17 + 214) = a5 != 0;
  v17[25] = a3;
  if (a5) {
    BOOL v18 = 1;
  }
  else {
    BOOL v18 = a4 > 1;
  }
  if ((*(_BYTE *)a1 & 1) != 0) {
    uint64_t v19 = 1LL;
  }
  else {
    uint64_t v19 = *(_BYTE *)a1 & 2;
  }
  if (v18) {
    uint64_t v20 = v19 | 0x100;
  }
  else {
    uint64_t v20 = v19;
  }
  v21 = (void *)MEMORY[0x186DF4DBC]();
  [a2 encodeWithOSLogCoder:v17 options:v20 maxLength:a3];
  objc_autoreleasePoolPop(v21);
  if ([v17 retainCount] != 1)
  {
    qword_18C50A768 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: A reference to the coder escaped";
    __break(1u);
  }

  v22 = (_BYTE **)v17[2];
  if (v22 == v17 + 6)
  {
    *((_WORD *)v17 + 105) = *(_DWORD *)(a6 + 8);
    *((_WORD *)v17 + 104) = _os_log_fmt_flatten_masked_data( (_BYTE *)a1,  a4,  a5,  a6,  *v22,  *((unsigned int *)v17 + 14),  a3,  (_BYTE *)v17 + 212);
    if ((*((_WORD *)v17 + 34) & 1) != 0)
    {
      char v23 = *v22;
      *v22 = (_BYTE *)3954044928LL;
      *((_WORD *)v22 + 10) = 0;
      free(v23);
    }
  }

  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a1 & 0xF | 0x30;
  }

  __int16 v24 = v17[26] & 0x7FFF | (*((unsigned __int8 *)v17 + 212) << 15);
  *(_WORD *)(a1 + 2) = *((_WORD *)v17 + 105);
  *(_WORD *)(a1 + 4) = v24;
  return *((unsigned __int16 *)v17 + 104);
}

const char *_os_log_fmt_flatten_NSCF(void *a1, char *a2, size_t a3, _BYTE *a4)
{
  int v6 = a2;
  if (_NSCF_function)
  {
    if ((_NSCF_function(a1, a2, a3, a4) & 1) == 0)
    {
      *a4 = 0;
      return "<invalid NS/CF object>";
    }
  }

  else
  {
    Class Class = object_getClass(a1);
    *a4 = 0;
    if (!Class) {
      return "<invalid NS/CF object>";
    }
    Name = class_getName(Class);
    snprintf(v6, a3, "<%s instance>", Name);
  }

  return v6;
}

Class __os_log_fmt_object_for_data_block_invoke()
{
  os_log_fmt_object_for_data__NSString = (uint64_t)objc_getClass("NSString");
  os_log_fmt_object_for_data__NSNumber = (uint64_t)objc_getClass("NSNumber");
  Class result = objc_getClass("NSData");
  os_log_fmt_object_for_data__NSData = (uint64_t)result;
  return result;
}

unint64_t _os_log_fmt_plugin_annotated( uint64_t a1, uint64_t a2, uint64_t a3, char *a4, char *a5, unsigned int a6, char a7)
{
  uint64_t v26 = *MEMORY[0x1895FEE08];
  plugin = os_log_fmt_get_plugin(*(const char **)(a3 + 32), *(unsigned __int16 *)(a3 + 14));
  unint64_t v15 = (unint64_t)plugin;
  if (plugin)
  {
    if (!plugin[3]) {
      return 0LL;
    }
    char v16 = *a4;
    if (os_log_fmt_object_for_data_onceToken != -1) {
      dispatch_once(&os_log_fmt_object_for_data_onceToken, &__block_literal_global);
    }
    double v17 = (*(_WORD *)(a3 + 8) & 0x10) != 0 ? COERCE_DOUBLE(os_log_fmt_read_scalar(a3, a5, a6)) : 0.0;
    switch(*(_BYTE *)(a3 + 10))
    {
      case 1:
        id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithChar:SLOBYTE(v17)];
        break;
      case 2:
        id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithUnsignedChar:LOBYTE(v17)];
        break;
      case 3:
        id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithShort:SLOWORD(v17)];
        break;
      case 4:
        id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithUnsignedShort:LOWORD(v17)];
        break;
      case 5:
      case 7:
      case 8:
        goto LABEL_21;
      case 6:
        goto LABEL_17;
      case 9:
        if (a2 == 4)
        {
LABEL_21:
          id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithInt:*(void *)&v17];
        }

        else
        {
          if (a2 == 8) {
            goto LABEL_20;
          }
LABEL_22:
          id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithLongLong:*(void *)&v17];
        }

        break;
      case 0xA:
      case 0xD:
        if (a2 == 4)
        {
LABEL_17:
          id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithUnsignedInt:*(void *)&v17];
        }

        else if (a2 == 8)
        {
LABEL_20:
          id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithLong:*(void *)&v17];
        }

        else
        {
LABEL_15:
          id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithUnsignedLongLong:*(void *)&v17];
        }

        break;
      case 0xB:
        goto LABEL_22;
      case 0xC:
        goto LABEL_15;
      case 0xE:
      case 0xF:
        id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithDouble:v17];
        break;
      case 0x10:
      case 0x11:
      case 0x12:
      case 0x13:
        if ((v16 & 0xF0) == 0x30)
        {
          id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSData) initWithBytes:a5 length:a6];
        }

        else if (a6)
        {
          id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSString) initWithBytes:a5 length:a6 - 1 encoding:4];
        }

        else
        {
          id v18 = objc_alloc_init((Class)os_log_fmt_object_for_data__NSString);
        }

        break;
      default:
        return 0LL;
    }

    uint64_t v19 = v18;
    if (v18)
    {
      int v23 = 1;
      char v24 = a7;
      __strlcpy_chk();
      uint64_t v20 = (void *)(*(uint64_t (**)(char *, void *, int *))(v15 + 24))(v25, v19, &v23);
      v21 = (void *)[v20 string];
      unint64_t v15 = v21 != 0LL;
      if (v21) {
        os_trace_blob_adds_CF(a1, v21);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v15;
}

#error "18010D2DC: call analysis failed (funcsize=19)"
void *os_log_fmt_get_plugin(const char *a1, size_t a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  const char *v8;
  int v9;
  void *v10;
  if ((_dyld_dlsym_blocked() & 1) != 0) {
    return 0LL;
  }
  if (qword_18C43B7B0 != -1) {
    dispatch_once_f(&qword_18C43B7B0, 0LL, (dispatch_function_t)_os_trace_formatters_list);
  }
  v4 = qword_18C43B7A8;
  if (!qword_18C43B7A8) {
    return 0LL;
  }
  v5 = 0LL;
  int v6 = _formatters;
  while (1)
  {
    int v7 = (v5 + v4) >> 1;
    v8 = *(const char **)(v6 + 40 * v7 + 8);
    v9 = strncasecmp(a1, v8, a2);
    if (!v9) {
      break;
    }
LABEL_9:
    if (v9 >= 0) {
      v5 = v7 + 1;
    }
    else {
      v4 = (v5 + v4) >> 1;
    }
    if (v5 >= v4) {
      return 0LL;
    }
  }

  if (v8[a2])
  {
    v9 = -v8[a2];
    goto LABEL_9;
  }

  v10 = (void *)(v6 + 40 * v7);
  if (*v10 != -1LL) {
    dispatch_once_f( (dispatch_once_t *)(v6 + 40 * v7),  (void *)(v6 + 40 * v7),  (dispatch_function_t)_os_trace_load_formatter);
  }
  return v10;
}

void _os_trace_formatters_list()
{
  uint64_t v21 = *MEMORY[0x1895FEE08];
  uint64_t v17 = 0LL;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  uint64_t v20 = 0LL;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0LL;
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  uint64_t v12 = 0LL;
  v0 = getenv("OS_ACTIVITY_FORMATTER");
  if (!v0 || strcmp(v0, "disable"))
  {
    uint64_t v1 = 0LL;
    char v2 = 1;
    do
    {
      char v3 = v2;
      v4 = opendir((&plugin_dirs)[2 * v1]);
      v5 = v4;
      if (v4)
      {
        for (i = readdir(v4); i; i = readdir(v5))
        {
          if (i->d_type == 8)
          {
            int v7 = _os_trace_formatter_record((char *)v18[3], i->d_name, v1, v14 + 3, v10 + 3);
            v18[3] = (uint64_t)v7;
          }
        }

        closedir(v5);
      }

      char v2 = 0;
      uint64_t v1 = 1LL;
    }

    while ((v3 & 1) != 0);
    qsort_b((void *)v18[3], v14[3], 0x28uLL, &__block_literal_global_60);
    uint64_t v8 = v14[3];
    _formatters = v18[3];
    qword_18C43B7A8 = v8;
  }

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

void sub_18010D658( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 88), 8);
  _Unwind_Resume(a1);
}

void *_os_trace_load_formatter(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1895FEE08];
  snprintf(__str, 0x400uLL, "%sliblog_%s.dylib", (&plugin_dirs)[2 * *(void *)(a1 + 16)], *(const char **)(a1 + 8));
  Class result = dlopen(__str, 6);
  *(void *)(a1 + 16) = result;
  if (result)
  {
    *(void *)(a1 + 24) = dlsym(result, "OSLogCopyFormattedString");
    Class result = dlsym(*(void **)(a1 + 16), "OSStateCreateStringWithData");
    *(void *)(a1 + 32) = result;
  }

  return result;
}

char *_os_trace_formatter_record(char *a1, char *__s1, uint64_t a3, uint64_t *a4, void *a5)
{
  if (!strncmp(__s1, "liblog_", 7uLL) && !strchr(__s1, 47))
  {
    uint64_t v11 = strrchr(__s1, 46);
    if (v11)
    {
      uint64_t v12 = v11;
      if (!strcmp(v11, ".dylib"))
      {
        uint64_t v13 = strndup(__s1 + 7, v12 - (__s1 + 7));
        uint64_t v14 = *a4;
        if (*a4)
        {
          uint64_t v15 = 8LL;
          uint64_t v16 = *a4;
          while (strcasecmp(*(const char **)&a1[v15], v13))
          {
            v15 += 40LL;
            if (!--v16) {
              goto LABEL_10;
            }
          }

          free(v13);
        }

        else
        {
LABEL_10:
          if (v14 == *a5)
          {
            *a5 = v14 + 8;
            while (1)
            {
              uint64_t v17 = (char *)realloc(a1, 40 * (v14 + 8));
              if (v17) {
                break;
              }
              _os_trace_temporary_resource_shortage();
            }

            uint64_t v14 = *a4;
            a1 = v17;
          }

          *a4 = v14 + 1;
          id v18 = &a1[40 * v14];
          *(void *)id v18 = 0LL;
          *((void *)v18 + 1) = v13;
          *((void *)v18 + 3) = 0LL;
          *((void *)v18 + 4) = 0LL;
          *((void *)v18 + 2) = a3;
        }
      }
    }
  }

  return a1;
}

char *___os_trace_formatters_list_block_invoke(char *result, uint64_t a2)
{
  char v3 = result;
  char v4 = 0;
  uint64_t v5 = 0LL;
  char v6 = 1;
  do
  {
    char v7 = v6;
    if ((v4 & 1) != 0 || !v3[56])
    {
      size_t v8 = strlen((&plugin_dirs)[2 * v5]);
      uint64_t v9 = *(const char **)(a2 + 40);
      Class result = (char *)strncmp(v9, (&plugin_dirs)[2 * v5], v8);
      if (!(_DWORD)result)
      {
        Class result = _os_trace_formatter_record( *(char **)(*(void *)(*((void *)v3 + 4) + 8LL) + 24LL),  (char *)&v9[v8],  v5,  (uint64_t *)(*(void *)(*((void *)v3 + 5) + 8LL) + 24LL),  (void *)(*(void *)(*((void *)v3 + 6) + 8LL) + 24LL));
        *(void *)(*(void *)(*((void *)v3 + 4) + 8LL) + 24LL) = result;
      }
    }

    char v6 = 0;
    char v4 = 1;
    uint64_t v5 = 1LL;
  }

  while ((v7 & 1) != 0);
  return result;
}

uint64_t ___os_trace_formatters_list_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return strcasecmp(*(const char **)(a2 + 8), *(const char **)(a3 + 8));
}

void _os_trace_logd_send()
{
  v0 = _os_trace_logd_pipe_copy(0LL);
  if (v0)
  {
    uint64_t v1 = v0;
    if (xpc_pipe_simpleroutine() == 32)
    {
      char v2 = _os_trace_logd_pipe_copy(v1);
      if (!v2) {
        return;
      }
      uint64_t v1 = v2;
      xpc_pipe_simpleroutine();
    }

    xpc_release(v1);
  }

void *_os_trace_logd_pipe_copy(void *a1)
{
  char v2 = (void *)_event_pipe;
  if (a1)
  {
    if ((void *)_event_pipe == a1)
    {
      xpc_release(a1);
      char v2 = 0LL;
    }

    xpc_release(a1);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&_event_lock);
  return v2;
}

uint64_t _os_trace_logd_send_with_reply()
{
  v0 = _os_trace_logd_pipe_copy(0LL);
  if (v0)
  {
    uint64_t v1 = v0;
    if (xpc_pipe_routine() != 32)
    {
LABEL_5:
      xpc_release(v1);
      return 0LL;
    }

    char v2 = _os_trace_logd_pipe_copy(v1);
    if (v2)
    {
      uint64_t v1 = v2;
      xpc_pipe_routine();
      goto LABEL_5;
    }
  }

  return 0LL;
}

uint64_t _os_trace_macho_for_each_slice(_DWORD *a1, unint64_t a2, uint64_t a3)
{
  if (a2 < 4) {
    return 88LL;
  }
  int v7 = *a1;
  uint64_t result = 88LL;
  if (v7 > -805638659)
  {
    if (v7 != -17958193)
    {
      if (v7 == -17958194)
      {
LABEL_14:
        if (a2 < 0x1C) {
          return result;
        }
        return (*(uint64_t (**)(uint64_t, _DWORD *, unint64_t))(a3 + 16))(a3, a1, a2);
      }

      if (v7 != -805638658) {
        return result;
      }
    }

    if (a2 < 0x20) {
      return result;
    }
    return (*(uint64_t (**)(uint64_t, _DWORD *, unint64_t))(a3 + 16))(a3, a1, a2);
  }

  switch(v7)
  {
    case -1095041334:
      if (a2 < 8) {
        return result;
      }
      unsigned int v8 = bswap32(a1[1]);
      int v9 = 1;
      break;
    case -889275714:
      if (a2 < 8) {
        return result;
      }
      int v9 = 0;
      unsigned int v8 = a1[1];
      break;
    case -822415874:
      goto LABEL_14;
    default:
      return result;
  }

  if (20LL * v8 == 20 * v8 && a2 - 8 >= 20 * v8)
  {
    unint64_t v11 = v8;
    if (!v8) {
      return 0LL;
    }
    uint64_t v12 = a1 + 5;
    for (unint64_t i = 1LL; ; ++i)
    {
      unsigned int v14 = *(v12 - 1);
      if (v9)
      {
        unsigned int v14 = bswap32(v14);
        unsigned int v15 = bswap32(*v12);
      }

      else
      {
        unsigned int v15 = *v12;
      }

      if (a2 < v14 || a2 - v14 < v15) {
        break;
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, char *, void))(a3 + 16))(a3, (char *)a1 + v14, v15);
      if ((_DWORD)result) {
        BOOL v16 = 1;
      }
      else {
        BOOL v16 = i >= v11;
      }
      v12 += 5;
      if (v16) {
        return result;
      }
    }

    return 88LL;
  }

  return result;
}

uint64_t _os_trace_get_image_info(_DWORD *a1, unint64_t a2, uuid_t uu, uint64_t a4, char a5)
{
  uint64_t v54 = 0LL;
  v55 = &v54;
  uint64_t v56 = 0x2000000000LL;
  char v57 = 0;
  uint64_t v50 = 0LL;
  v51 = &v50;
  uint64_t v52 = 0x2000000000LL;
  char v53 = 0;
  uint64_t v46 = 0LL;
  v47 = &v46;
  uint64_t v48 = 0x2000000000LL;
  uint64_t v49 = 0LL;
  uint64_t v42 = 0LL;
  v43 = &v42;
  uint64_t v44 = 0x2000000000LL;
  uint64_t v45 = 0LL;
  if (a4)
  {
    *(void *)(a4 + 48) = 0LL;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)a4 = 0u;
    *(_BYTE *)(a4 + 1) = _dyld_is_memory_immutable() ^ 1;
  }

  v41[0] = MEMORY[0x1895FED80];
  v41[1] = 0x40000000LL;
  v41[2] = ___os_trace_get_image_info_block_invoke;
  v41[3] = &unk_1896245F0;
  v41[4] = &v42;
  v41[5] = a4;
  v32[0] = MEMORY[0x1895FED80];
  v32[1] = 0x40000000LL;
  uint64_t v33 = ___os_trace_get_image_info_block_invoke_2;
  v34 = &unk_189624618;
  unsigned __int8 *__attribute__((__org_typedef(uuid_t))) v39 = uu;
  uint64_t v40 = a4;
  float v35 = v41;
  v36 = &v54;
  uint64_t v37 = &v46;
  v38 = &v50;
  if (a2 <= 3 && (a5 & 1) == 0) {
    goto LABEL_14;
  }
  if (*a1 == -17958194)
  {
    if ((a5 & 1) != 0 || a2 >= 0x1C && a2 - 28 >= a1[5])
    {
      char v31 = 0;
      uint64_t v10 = a1 + 7;
      goto LABEL_30;
    }

LABEL_14:
    int v11 = 88;
    if (!a4) {
      goto LABEL_73;
    }
LABEL_15:
    if (*((_BYTE *)v51 + 24) && !*(_DWORD *)(a4 + 32))
    {
      *(void *)(a4 + 32) = v43[3];
      if ((a5 & 1) != 0) {
        goto LABEL_73;
      }
    }

    else if ((a5 & 1) != 0)
    {
      goto LABEL_73;
    }

    uint64_t v12 = 0LL;
    while (1)
    {
      unint64_t v13 = *(unsigned int *)(a4 + v12 + 20);
      if ((_DWORD)v13)
      {
        unint64_t v14 = *(unsigned int *)(a4 + v12 + 16);
        BOOL v16 = a2 >= v14;
        unint64_t v15 = a2 - v14;
        BOOL v16 = v16 && v15 >= v13;
        if (!v16) {
          goto LABEL_78;
        }
      }

      v12 += 8LL;
      if (v12 == 40) {
        goto LABEL_73;
      }
    }
  }

  uint64_t v10 = a1 + 8;
  char v31 = 1;
LABEL_30:
  int v17 = 0;
  unsigned int v18 = a1[4];
  BOOL v19 = v18 == 0;
  if (v18)
  {
    unint64_t v20 = a1[5];
    if (v20 >= 8)
    {
      unsigned int v21 = 1;
      while (1)
      {
        unint64_t v22 = v10[1];
        BOOL v16 = v20 >= v22;
        v20 -= v22;
        if (!v16) {
          goto LABEL_14;
        }
        int v17 = 0;
        int v23 = *v10;
        if ((int)*v10 > 26)
        {
          switch(v23)
          {
            case 44:
              char v26 = v31;
              if ((v26 & 1) == 0) {
                goto LABEL_14;
              }
              goto LABEL_60;
            case 33:
              char v27 = v31;
              if ((v27 & 1) != 0) {
                goto LABEL_14;
              }
              goto LABEL_60;
            case 27:
LABEL_43:
LABEL_60:
              int v17 = v33(v32, (uint64_t)v10);
              break;
          }
        }

        else
        {
          switch(v23)
          {
            case 1:
              BOOL v24 = v22 >= 0x38;
              char v25 = v31;
              break;
            case 12:
              goto LABEL_43;
            case 25:
              BOOL v24 = v22 >= 0x48;
              char v25 = v31 ^ 1;
              break;
            default:
              goto LABEL_61;
          }

          if (!v24) {
            char v25 = 1;
          }
          if ((v25 & 1) != 0) {
            goto LABEL_14;
          }
          if (!strcmp((const char *)v10 + 8, "__TEXT")
            || !strcmp((const char *)v10 + 8, "__CTF")
            || !strcmp((const char *)v10 + 8, "__OS_LOG"))
          {
            goto LABEL_60;
          }

          int v17 = 0;
        }

  double v32 = 0LL;
  uint64_t v33 = &v32;
  v34 = 0x2800000000LL;
  float v35 = 0LL;
  v36 = 0LL;
  BOOL v28 = 0LL;
  uint64_t v29 = &v28;
  double v30 = 0x2000000000LL;
  char v31 = 0;
  BOOL v24 = 0LL;
  char v25 = &v24;
  char v26 = 0x2000000000LL;
  char v27 = 1;
  applier[0] = MEMORY[0x1895FED80];
  applier[1] = 0x40000000LL;
  applier[2] = ___os_log_matches_logical_expression_filter_block_invoke;
  applier[3] = &unk_189624AD0;
  applier[4] = &v32;
  applier[5] = &v28;
  applier[6] = &v24;
  applier[7] = a2;
  xpc_array_apply(v9, applier);
  unint64_t v20 = v33;
  unsigned int v21 = *a3;
  if ((unint64_t)(v19 - 1) >= 2)
  {
    *a3 = v33[4] | v21;
    a3[1] |= v20[3];
    uint64_t v10 = *((_BYTE *)v29 + 24) == 0;
  }

  else
  {
    *a3 = v33[3] | v21;
    a3[1] |= v20[4];
    if (v19 == 2) {
      unint64_t v22 = v29;
    }
    else {
      unint64_t v22 = v25;
    }
    uint64_t v10 = *((unsigned __int8 *)v22 + 24) != 0;
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  return v10;
}

LABEL_61:
        if (v17) {
          BOOL v28 = 1;
        }
        else {
          BOOL v28 = v21 >= v18;
        }
        BOOL v19 = v28;
        if (v20 >= 8)
        {
          uint64_t v10 = (_DWORD *)((char *)v10 + v22);
          ++v21;
          if (!v19) {
            continue;
          }
        }

        break;
      }
    }
  }

  if (v19) {
    int v11 = v17;
  }
  else {
    int v11 = 88;
  }
  if (a4) {
    goto LABEL_15;
  }
LABEL_73:
  if (v11 != 89 && v11 || !*((_BYTE *)v55 + 24) || (uint64_t v29 = v47[3]) == 0)
  {
    uuid_clear(uu);
LABEL_78:
    uint64_t v29 = 0LL;
  }

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
  return v29;
}

    *__error() = v0;
  }

uint64_t ___os_trace_get_image_info_block_invoke(uint64_t a1, void *a2, int a3, int a4)
{
  uint64_t v4 = 0LL;
  uint64_t v5 = "__cstring";
  do
  {
    if (*a2 == *(void *)v5 && a2[1] == *((void *)v5 + 1))
    {
      uint64_t v8 = *(void *)(a1 + 40) + 8 * v4;
      *(_DWORD *)(v8 + 16) = a3;
      int v7 = (_DWORD *)(v8 + 20);
      goto LABEL_10;
    }

    ++v4;
    v5 += 16;
  }

  while (v4 != 5);
  if (*a2 ^ 0x74736E6F635F5FLL | a2[1]) {
    return 0LL;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a3;
  int v7 = (_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 28LL);
LABEL_10:
  *int v7 = a4;
  return 0LL;
}

uint64_t ___os_trace_get_image_info_block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t result = 0LL;
  int v4 = *(_DWORD *)a2;
  if (*(int *)a2 > 26)
  {
    if (v4 == 44 || v4 == 33)
    {
      unint64_t v14 = (_BYTE *)a1[9];
      if (!v14 || !*(_DWORD *)(a2 + 16)) {
        goto LABEL_58;
      }
      goto LABEL_29;
    }

    if (v4 != 27) {
      goto LABEL_59;
    }
    int v11 = (_OWORD *)a1[8];
    if (v11) {
      *int v11 = *(_OWORD *)(a2 + 8);
    }
    uint64_t v12 = a1[9];
    if (v12) {
      *(void *)(v12 + 8) = a2 + 8;
    }
    unint64_t v13 = a1 + 5;
LABEL_26:
    unint64_t v14 = (_BYTE *)(*(void *)(*v13 + 8LL) + 24LL);
LABEL_29:
    uint64_t result = 0LL;
    _BYTE *v14 = 1;
    goto LABEL_59;
  }

  switch(v4)
  {
    case 1:
      *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = *(unsigned int *)(a2 + 36);
      unint64_t v15 = (_BYTE *)a1[9];
      if (v15)
      {
        if ((*(_BYTE *)(a2 + 52) & 8) != 0) {
          _BYTE *v15 = 1;
        }
        unint64_t v16 = *(unsigned int *)(a2 + 48);
        if (68 * (unint64_t)v16 + 56 <= *(unsigned int *)(a2 + 4))
        {
          if ((_DWORD)v16)
          {
            uint64_t v26 = a1[4];
            uint64_t v27 = a2 + 56;
            unint64_t v28 = 1LL;
            do
            {
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, void))(v26 + 16))( v26,  v27,  *(unsigned int *)(v27 + 40),  *(unsigned int *)(v27 + 36));
              if ((_DWORD)result) {
                BOOL v29 = 1;
              }
              else {
                BOOL v29 = v28 >= v16;
              }
              ++v28;
              v27 += 68LL;
            }

            while (!v29);
            break;
          }

          goto LABEL_58;
        }

LABEL_34:
        uint64_t result = 88LL;
        break;
      }

LABEL_58:
      uint64_t result = 0LL;
      break;
    case 12:
      unsigned int v18 = *(_DWORD *)(a2 + 4);
      uint64_t v17 = *(unsigned int *)(a2 + 8);
      unint64_t v20 = (uint64_t *)(a2 + v17);
      uint64_t v21 = *v20;
      uint64_t v22 = v20[1];
      uint64_t v23 = *(uint64_t *)((char *)v20 + 15);
      BOOL v24 = v21 == 0x6C2F687461707240LL && v22 == 0x5F676E616C636269LL;
      if (!v24 || v23 != 0x6E6173612E74725FLL) {
        goto LABEL_58;
      }
      unint64_t v13 = a1 + 7;
      goto LABEL_26;
    case 25:
      *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = *(void *)(a2 + 48);
      uint64_t v5 = (_BYTE *)a1[9];
      if (v5)
      {
        if ((*(_BYTE *)(a2 + 68) & 8) != 0) {
          _BYTE *v5 = 1;
        }
        unint64_t v6 = *(unsigned int *)(a2 + 64);
        if (80 * (unint64_t)v6 + 72 <= *(unsigned int *)(a2 + 4))
        {
          if ((_DWORD)v6)
          {
            uint64_t v7 = a1[4];
            uint64_t v8 = a2 + 72;
            unint64_t v9 = 1LL;
            while (!HIDWORD(*(void *)(v8 + 40)))
            {
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(v7 + 16))( v7,  v8,  *(unsigned int *)(v8 + 48));
              if ((_DWORD)result) {
                BOOL v10 = 1;
              }
              else {
                BOOL v10 = v9 >= v6;
              }
              ++v9;
              v8 += 80LL;
              if (v10) {
                goto LABEL_59;
              }
            }

            uint64_t result = 34LL;
            break;
          }

          goto LABEL_58;
        }

        goto LABEL_34;
      }

      goto LABEL_58;
  }

LABEL_59:
  if (!a1[9] && *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL))
  {
    if (*(void *)(*(void *)(a1[6] + 8LL) + 24LL)) {
      return 89LL;
    }
  }

  return result;
}

void _os_trace_mh_map_insert_impl(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = *(unsigned __int16 *)(a4 + 10);
  unint64_t v5 = (a2 >> *MEMORY[0x189600140]) % v4;
  while (1)
  {
    uint64_t v6 = a4 + 16 * v5;
    uint64_t v7 = *(void *)(v6 + 16);
    if (!v7 || v7 == -1) {
      break;
    }
    if (v7 == a2) {
      goto LABEL_11;
    }
    if (v5 + 1 == v4) {
      unint64_t v5 = 0LL;
    }
    else {
      ++v5;
    }
  }

  *(void *)(a4 + 16 * v5 + 24) = a3;
  atomic_store(a2, (unint64_t *)(v6 + 16));
  ++*(_WORD *)(a4 + 8);
LABEL_11:
  if (a1) {
    _os_trace_rwptr_wrunlock(a1, (void *)a4);
  }
}

uint64_t _os_trace_rwptr_rdlock_wait(uint64_t result)
{
  uint64_t v1 = (unint64_t *)result;
  uint64_t v2 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    do
    {
LABEL_2:
      unint64_t v3 = __ldxr(v1);
      if (!(_DWORD)v3)
      {
LABEL_15:
        __clrex();
        return result;
      }

      if ((v3 & 0xFFFFFFFE) == v3)
      {
        __clrex();
        break;
      }
    }

    while (__stxr(v3 & 0xFFFFFFFE, v1));
    while (1)
    {
      uint64_t result = __ulock_wait();
      if ((result & 0x80000000) == 0) {
        break;
      }
      uint64_t result = (uint64_t)__error();
      unsigned int v4 = *(_DWORD *)result;
      if (*(_DWORD *)result != 4)
      {
        if (v4 > 0x3C || ((1LL << v4) & 0x1000000000004001LL) == 0)
        {
          qword_18C50A768 = (uint64_t)"BUG IN LIBTRACE: ulock_wait() failed";
          qword_18C50A798 = (int)v4;
          __break(1u);
          goto LABEL_15;
        }

        goto LABEL_2;
      }
    }
  }

  qword_18C50A768 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: trying to lock recursively";
  __break(1u);
  return result;
}

void _os_trace_rwptr_cleanup(uint64_t a1)
{
  uint64_t v2 = *(_BYTE ***)(a1 + 8);
  unint64_t v3 = *v2;
  if (*v2)
  {
    do
    {
      unsigned int v4 = *(_BYTE **)v3;
      if (v3[12]) {
        free(v3);
      }
      unint64_t v3 = v4;
    }

    while (v4);
  }

  *uint64_t v2 = 0LL;
  int v5 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    unsigned int v6 = __ldxr((unsigned int *)a1);
  while (__stlxr(0, (unsigned int *)a1));
  if (v6 != v5) {
    _os_trace_rwptr_wrunlock_slow(a1, v5, v6);
  }
}

void _os_trace_rwptr_wrunlock_slow(uint64_t a1, int a2, unsigned int a3)
{
  if ((a3 ^ a2) > 1)
  {
    int v3 = a3;
    qword_18C50A768 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: lock not owned by current thread";
    qword_18C50A798 = a3;
    __break(1u);
LABEL_11:
    qword_18C50A768 = (uint64_t)"BUG IN LIBTRACE: ulock_wake() failed";
    qword_18C50A798 = v3;
    __break(1u);
  }

  else
  {
    while ((__ulock_wake() & 0x80000000) != 0)
    {
      int v3 = *__error();
      if (v3 != 4)
      {
        if (v3) {
          BOOL v4 = v3 == 2;
        }
        else {
          BOOL v4 = 1;
        }
        if (v4) {
          return;
        }
        goto LABEL_11;
      }
    }
  }

void _os_trace_rwptr_wrunlock(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2 != a2) {
    *a2 = v2;
  }
  atomic_store((unint64_t)a2, (unint64_t *)(a1 + 8));
  do
  {
    unint64_t v3 = __ldxr((unint64_t *)a1);
    unint64_t v4 = v3 | 0x100000000LL;
    if (v2 == a2) {
      unint64_t v4 = v3;
    }
    unint64_t v5 = v4 >> 33;
    unint64_t v6 = v4 & ((int)(v4 >> 1) >> 31);
    unint64_t v7 = v4 & 0xFFFFFFFF00000000LL;
    if (!v5) {
      unint64_t v7 = v6;
    }
  }

  while (__stlxr(v7, (unint64_t *)a1));
  if ((_DWORD)v7)
  {
    _os_trace_rwptr_cleanup(a1);
  }

  else
  {
    int v8 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    if (v8 != (_DWORD)v3) {
      _os_trace_rwptr_wrunlock_slow(a1, v8, v3);
    }
  }

uint64_t _os_activity_create_addr(uint64_t result, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  unint64_t v7 = result;
  uint64_t v66 = *MEMORY[0x1895FEE08];
  if ((a4 & 2) == 0) {
    goto LABEL_6;
  }
  if ((a4 & 1) != 0)
  {
    qword_18C50A768 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Invalid flags passed";
    __break(1u);
    goto LABEL_82;
  }

  if (a3 != -3)
  {
LABEL_82:
    qword_18C50A768 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Parent must be OS_ACTIVITY_CURRENT when OS_ACTIVITY_FLAG_NONE_PRESENT is used";
    __break(1u);
    return result;
  }

  if (voucher_get_activity_id()) {
    return voucher_copy();
  }
LABEL_6:
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0LL, (dispatch_function_t)_os_trace_init_slow);
  }
  if (dword_18C43B70C != -1) {
    _os_trace_prefs_and_mode_refresh_slow(dword_18C43B70C);
  }
  unsigned int v8 = dword_18C43B710;
  int v9 = dword_18C43B714;
  if (dword_18C43B714 != dword_18C43B710)
  {
    while (1)
    {
      unsigned int v38 = __ldxr((unsigned int *)&dword_18C43B714);
      if (v38 != v9) {
        break;
      }
      if (!__stxr(v8, (unsigned int *)&dword_18C43B714))
      {
        _os_log_preferences_refresh_process();
        goto LABEL_11;
      }
    }

    __clrex();
  }

LABEL_11:
  if (off_18C43B6F0) {
    BOOL v10 = (unint64_t *)((char *)off_18C43B6F0 + 8);
  }
  else {
    BOOL v10 = 0LL;
  }
  unint64_t v11 = 0x18C43B000uLL;
  if (_os_trace_dsc_load_addr <= v7 && _os_trace_dsc_size + _os_trace_dsc_load_addr > v7)
  {
    unsigned int v61 = a5 - _os_trace_dsc_load_addr;
    __int16 v62 = (unint64_t)(a5 - _os_trace_dsc_load_addr) >> 32;
    uint64_t v64 = 0LL;
    if (v62) {
      __int16 v63 = 6;
    }
    else {
      __int16 v63 = 4;
    }
    goto LABEL_48;
  }

  if (*(_DWORD *)(v7 + 12) != 2)
  {
    if (off_18C43B6F0)
    {
      do
      {
        while (1)
        {
          unint64_t v12 = __ldxr(v10);
          if (!(_DWORD)v12) {
            break;
          }
          __clrex();
          unint64_t v13 = v10;
          _os_trace_rwptr_rdlock_wait((uint64_t)v10);
          BOOL v10 = v13;
          unint64_t v11 = 0x18C43B000LL;
        }
      }

      while (__stxr(v12 + 0x200000000LL, v10));
      unint64_t v14 = v10[1];
      unint64_t v15 = *(unsigned __int16 *)(v14 + 10);
      unint64_t v16 = (v7 >> *MEMORY[0x189600140]) % v15;
      while (1)
      {
        unint64_t v17 = v14 + 16 * v16;
        uint64_t v18 = *(void *)(v17 + 16);
        if (v18 == v7) {
          break;
        }
        if (v16 + 1 == v15) {
          unint64_t v16 = 0LL;
        }
        else {
          ++v16;
        }
        if (v18) {
          BOOL v19 = v16 == (v7 >> *MEMORY[0x189600140]) % v15;
        }
        else {
          BOOL v19 = 1;
        }
        if (v19)
        {
          uint64_t v20 = 0LL;
          goto LABEL_37;
        }
      }

      uint64_t v20 = *(void *)(v17 + 24);
LABEL_37:
      unint64_t v21 = *(unsigned int *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      do
      {
        unint64_t v22 = __ldxr(v10);
        unint64_t v23 = v22 - 0x200000000LL;
        if (v23 == 0x100000000LL) {
          unint64_t v23 = v21;
        }
      }

      while (__stxr(v23, v10));
      if (v23 == v21)
      {
        __dmb(9u);
        uint64_t v43 = v20;
        _os_trace_rwptr_cleanup((uint64_t)v10);
        uint64_t v20 = v43;
      }

      uint64_t v64 = v20;
      if (v20)
      {
        unsigned int v61 = a5 - v7;
        __int16 v62 = (a5 - v7) >> 32;
        __int16 v63 = 20;
        goto LABEL_48;
      }
    }

    else
    {
      uint64_t v64 = 0LL;
    }

    unsigned int v61 = a5;
    __int16 v62 = WORD2(a5);
    __int16 v63 = 6;
    goto LABEL_48;
  }

  unsigned int v61 = a5 - v7;
  __int16 v62 = (a5 - v7) >> 32;
  __int16 v63 = 4;
  uint64_t v64 = 0LL;
LABEL_48:
  if (a2)
  {
    unint64_t v24 = *(void *)(v11 + 2640);
    if (v24 <= v7)
    {
      if (_os_trace_dsc_size + v24 <= v7) {
        unint64_t v24 = v7;
      }
      unint64_t v25 = a2 - v24;
    }

    else
    {
      unint64_t v25 = a2 - v7;
    }

    unint64_t v26 = v25 & 0x7FFFFFFF | ((unint64_t)(unsigned __int16)(v25 >> 31) << 32);
  }

  else
  {
    unint64_t v26 = 0LL;
  }

  unint64_t v60 = v26;
  int v27 = MEMORY[0x1895FE128]();
  float v35 = (char *)&v42 - v34;
  if (v36)
  {
    *(_DWORD *)float v35 = v61;
    *((_WORD *)v35 + 2) = v62;
  }

  else
  {
    *(_DWORD *)float v35 = v27;
    if ((v33 & 1) == 0) {
      *(_OWORD *)(v35 + 4) = *v30;
    }
  }

  if (v29)
  {
    v32 |= 0x20u;
    *(_WORD *)&v35[v31] = WORD2(v28);
  }

  unint64_t v65 = ((unint64_t)v32 << 16) | (v28 << 32) | 0x102;
  _os_get_logging_unreliable_for_current_thread();
  uint64_t v37 = voucher_activity_create_with_data_2();
  if ((dword_18C43B700 & 0x500) == 0
    && (MEMORY[0xFFFFFC104] & 0x500) == 0
    && ((dword_18C43B700 & 8) != 0
     || (MEMORY[0xFFFFFC104] & 8) != 0
     || (voucher_get_activity_id() & 0x800000000000000LL) != 0)
    && (dword_18C43B770 & 1) != 0)
  {
    unsigned __int8 *__attribute__((__org_typedef(uuid_t))) v39 = _os_trace_diagnosticd_pipe(0LL);
    if (v39)
    {
      uint64_t v40 = v39;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      memset(v44, 0, sizeof(v44));
      else {
        unsigned int v41 = bswap32(v65) >> 16;
      }
      v44[0] = v41;
      *((void *)&v45 + 1) = v65;
      *(void *)&__int128 v46 = v59;
      *(void *)&__int128 v48 = v57;
      *((void *)&v48 + 1) = (v58 / 0x3E8);
      *(void *)&__int128 v51 = a2;
      _os_activity_stream_reflect((uint64_t)v40, (uint64_t)v44, v7, v37, &v61, (uint64_t)&v60);
      xpc_release(v40);
    }
  }

  return v37;
}

  if (v9 != -305 && v9) {
    goto LABEL_7;
  }
}

  *a1 = v6;
  return v3;
}

void _os_activity_stream_reflect( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unsigned int *a5, uint64_t a6)
{
  uint64_t v28 = *MEMORY[0x1895FEE08];
  unint64_t v11 = (char *)off_18C43B6F0;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2000000000LL;
  int v26 = 0;
  *(_DWORD *)(a2 + 4) = getpid();
  *(void *)(a2 + 8) = *((void *)&xmmword_18C43B738 + 1);
  *(_DWORD *)(a2 + 16) = geteuid();
  if (v11) {
    unint64_t v12 = v11 + 24;
  }
  else {
    unint64_t v12 = 0LL;
  }
  *(void *)(a2 + 24) = v12;
  *(void *)(a2 + 32) = xmmword_18C43B738;
  *(void *)(a2 + 40) = voucher_get_activity_id();
  unint64_t v13 = *a5 | ((unint64_t)*((unsigned __int16 *)a5 + 2) << 32);
  if (*(_DWORD *)(a3 + 12) == 2)
  {
    *(void *)(a2 + 120) = v13;
  }

  else if (*((void *)a5 + 1))
  {
    *(void *)(a2 + 120) = v13;
    unint64_t v12 = (char *)*((void *)a5 + 1);
  }

  else
  {
    uint64_t v14 = _os_trace_dsc_load_addr;
    if (_os_trace_dsc_load_addr <= a3)
    {
      if (_os_trace_dsc_size + _os_trace_dsc_load_addr <= a3) {
        uint64_t v14 = 0LL;
      }
      v13 += v14;
    }

    *(void *)(a2 + 120) = v13 - a3;
    unint64_t v12 = &v27;
  }

  *(void *)(a2 + 80) = v12;
  int v15 = *(_DWORD *)a6;
  else {
    unint64_t v16 = v15 & 0x7FFFFFFF | ((unint64_t)*(unsigned __int16 *)(a6 + 4) << 31) | 0x8000000000000000LL;
  }
  *(void *)(a2 + 128) = v16;
  uint64_t v17 = dyld_image_path_containing_address();
  uint64_t v18 = *(void *)(a2 + 96);
  *(void *)(a2 + 88) = v17;
  *(void *)(a2 + 72) = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  if (!v18) {
    gettimeofday((timeval *)(a2 + 96), 0LL);
  }
  if (!*(_DWORD *)(a2 + 112))
  {
    time_t v24 = *(void *)(a2 + 96);
    localtime_r(&v24, &v23);
    int tm_isdst = v23.tm_isdst;
    unint64_t v20 = ((unsigned __int128)(v23.tm_gmtoff * (__int128)0x7777777777777777LL) >> 64) - v23.tm_gmtoff;
    *(_DWORD *)(a2 + 112) = (v20 >> 5) + (v20 >> 63) + 60 * v23.tm_isdst;
    *(_DWORD *)(a2 + 116) = tm_isdst;
  }

  xpc_object_t v21 = _os_activity_stream_entry_encode((unsigned int *)a2);
  xpc_dictionary_set_uint64(v21, "action", 6uLL);
  v22[0] = MEMORY[0x1895FED80];
  v22[1] = 0x40000000LL;
  v22[2] = ___os_activity_stream_reflect_block_invoke;
  v22[3] = &unk_189624640;
  v22[5] = a1;
  v22[6] = v21;
  v22[4] = v25;
  dispatch_block_perform(DISPATCH_BLOCK_DETACHED, v22);
  xpc_release(v21);
LABEL_22:
  _Block_object_dispose(v25, 8);
}

xpc_object_t _os_activity_stream_entry_encode(unsigned int *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_uint64(v2, "pid", (int)a1[1]);
  xpc_dictionary_set_uint64(v2, "procid", *((void *)a1 + 1));
  xpc_dictionary_set_uint64(v2, "uid", a1[4]);
  unint64_t v3 = (const unsigned __int8 *)*((void *)a1 + 3);
  if (v3) {
    xpc_dictionary_set_uuid(v2, "procuuid", v3);
  }
  unint64_t v4 = (const char *)*((void *)a1 + 4);
  if (v4) {
    xpc_dictionary_set_string(v2, "procpath", v4);
  }
  uint64_t v5 = *((void *)a1 + 5);
  if (v5) {
    xpc_dictionary_set_uint64(v2, "aid", v5);
  }
  uint64_t v6 = *((void *)a1 + 6);
  if (v6) {
    xpc_dictionary_set_uint64(v2, "paid", v6);
  }
  xpc_dictionary_set_uint64(v2, "type", *a1);
  if ((a1[34] & 1) != 0) {
    xpc_dictionary_set_BOOL(v2, "32bits", 1);
  }
  int64_t v7 = *((void *)a1 + 12);
  if (v7)
  {
    xpc_dictionary_set_int64(v2, "timeGMTsec", v7);
    xpc_dictionary_set_int64(v2, "timeGMTusec", (int)a1[26]);
  }

  int64_t v8 = (int)a1[29];
  if ((_DWORD)v8) {
    xpc_dictionary_set_int64(v2, "timezoneDSTflag", v8);
  }
  int64_t v9 = (int)a1[28];
  if ((_DWORD)v9) {
    xpc_dictionary_set_int64(v2, "timezoneMinutesWest", v9);
  }
  int v10 = *a1;
  if ((int)*a1 > 767)
  {
    if (v10 == 1536)
    {
      xpc_dictionary_set_uint64(v2, "signpostid", *((void *)a1 + 26));
      unint64_t v20 = (const char *)*((void *)a1 + 27);
      if (v20) {
        xpc_dictionary_set_string(v2, "signpostname", v20);
      }
    }

    else if (v10 != 1024)
    {
      if (v10 == 768)
      {
        xpc_dictionary_set_uint64(v2, "traceid", *((void *)a1 + 7));
        xpc_dictionary_set_uint64(v2, "thread", *((void *)a1 + 9));
        xpc_dictionary_set_uint64(v2, "timestamp", *((void *)a1 + 8));
        xpc_dictionary_set_uint64(v2, "offset", *((void *)a1 + 15));
        xpc_dictionary_set_uint64(v2, "formatoffset", *((void *)a1 + 16));
        xpc_dictionary_set_value(v2, "payload", *((xpc_object_t *)a1 + 21));
        unint64_t v11 = (const unsigned __int8 *)*((void *)a1 + 10);
        if (v11) {
          xpc_dictionary_set_uuid(v2, "imageuuid", v11);
        }
        unint64_t v12 = (const char *)*((void *)a1 + 11);
        if (v12) {
          xpc_dictionary_set_string(v2, "imagepath", v12);
        }
        unint64_t v13 = (const char *)*((void *)a1 + 18);
        if (v13) {
          xpc_dictionary_set_string(v2, "name", v13);
        }
        uint64_t v14 = (const void *)*((void *)a1 + 19);
        if (v14)
        {
          size_t v15 = *((void *)a1 + 20);
          if (v15) {
            xpc_dictionary_set_data(v2, "buffer", v14, v15);
          }
        }
      }

      return v2;
    }

    xpc_dictionary_set_uint64(v2, "traceid", *((void *)a1 + 7));
    xpc_dictionary_set_uint64(v2, "thread", *((void *)a1 + 9));
    xpc_dictionary_set_uint64(v2, "timestamp", *((void *)a1 + 8));
    xpc_dictionary_set_uint64(v2, "offset", *((void *)a1 + 15));
    xpc_dictionary_set_uint64(v2, "formatoffset", *((void *)a1 + 16));
    xpc_dictionary_set_uint64(v2, "timeToLive", *((unsigned __int8 *)a1 + 204));
    xpc_object_t v21 = (const unsigned __int8 *)*((void *)a1 + 10);
    if (v21) {
      xpc_dictionary_set_uuid(v2, "imageuuid", v21);
    }
    unint64_t v22 = (const char *)*((void *)a1 + 11);
    if (v22) {
      xpc_dictionary_set_string(v2, "imagepath", v22);
    }
    tm v23 = (const char *)*((void *)a1 + 18);
    if (v23)
    {
      xpc_dictionary_set_string(v2, "name", v23);
      time_t v24 = (const char *)*((void *)a1 + 18);
      if (v24) {
        xpc_dictionary_set_string(v2, "formatstring", v24);
      }
    }

    unint64_t v25 = (const void *)*((void *)a1 + 19);
    if (v25)
    {
      size_t v26 = *((void *)a1 + 20);
      if (v26) {
        xpc_dictionary_set_data(v2, "buffer", v25, v26);
      }
    }

    char v27 = (const void *)*((void *)a1 + 21);
    if (v27)
    {
      size_t v28 = *((void *)a1 + 22);
      if (v28) {
        xpc_dictionary_set_data(v2, "privdata", v27, v28);
      }
    }

    uint64_t v29 = (const char *)*((void *)a1 + 24);
    if (v29) {
      xpc_dictionary_set_string(v2, "category", v29);
    }
    double v30 = (const char *)*((void *)a1 + 23);
    if (v30) {
      xpc_dictionary_set_string(v2, "subsystem", v30);
    }
    char v19 = *((_BYTE *)a1 + 205);
LABEL_59:
    xpc_dictionary_set_BOOL(v2, "persisted", v19);
    return v2;
  }

  if (v10 != 513)
  {
    if (v10 != 515) {
      return v2;
    }
    xpc_dictionary_set_uint64(v2, "traceid", *((void *)a1 + 7));
    xpc_dictionary_set_uint64(v2, "thread", *((void *)a1 + 9));
    xpc_dictionary_set_uint64(v2, "timestamp", *((void *)a1 + 8));
    xpc_dictionary_set_uint64(v2, "offset", *((void *)a1 + 15));
    xpc_dictionary_set_uint64(v2, "formatoffset", *((void *)a1 + 16));
    unint64_t v16 = (const unsigned __int8 *)*((void *)a1 + 10);
    if (v16) {
      xpc_dictionary_set_uuid(v2, "imageuuid", v16);
    }
    uint64_t v17 = (const char *)*((void *)a1 + 11);
    if (v17) {
      xpc_dictionary_set_string(v2, "imagepath", v17);
    }
    uint64_t v18 = (const char *)*((void *)a1 + 18);
    if (v18) {
      xpc_dictionary_set_string(v2, "name", v18);
    }
    char v19 = *((_BYTE *)a1 + 152);
    goto LABEL_59;
  }

  xpc_dictionary_set_uint64(v2, "traceid", *((void *)a1 + 7));
  xpc_dictionary_set_uint64(v2, "thread", *((void *)a1 + 9));
  xpc_dictionary_set_uint64(v2, "timestamp", *((void *)a1 + 8));
  uint64_t v31 = (const char *)*((void *)a1 + 18);
  if (v31) {
    xpc_dictionary_set_string(v2, "name", v31);
  }
  unsigned int v32 = (const unsigned __int8 *)*((void *)a1 + 10);
  if (v32) {
    xpc_dictionary_set_uuid(v2, "imageuuid", v32);
  }
  char v33 = (const char *)*((void *)a1 + 11);
  if (v33) {
    xpc_dictionary_set_string(v2, "imagepath", v33);
  }
  xpc_dictionary_set_uint64(v2, "offset", *((void *)a1 + 15));
  xpc_dictionary_set_uint64(v2, "formatoffset", *((void *)a1 + 16));
  return v2;
}

void ___os_activity_stream_reflect_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = *(void **)(a1 + 40);
  while (1)
  {
    int v3 = xpc_pipe_simpleroutine();
    if (v3 != 32) {
      break;
    }
    xpc_object_t v2 = _os_trace_diagnosticd_pipe(v2);
    if (!v2)
    {
      int v4 = 32;
      goto LABEL_10;
    }
  }

  int v4 = v3;
LABEL_10:
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v4;
}

os_activity_t _os_activity_create( void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  uint64_t v5 = -3LL;
  if (activity != (os_activity_t)&_os_activity_current) {
    uint64_t v5 = (uint64_t)activity;
  }
  if (activity == (os_activity_t)&_os_activity_none) {
    uint64_t v6 = 0LL;
  }
  else {
    uint64_t v6 = v5;
  }
  return (os_activity_t)_os_activity_create_addr((uint64_t)dso, (uint64_t)description, v6, flags, v4);
}

void _os_activity_initiate_impl(uint64_t a1, uint64_t a2, char a3, uint64_t a4, void (*a5)(uint64_t))
{
  int64_t v8 = (void *)voucher_adopt();
  os_release(v8);
}

void _os_activity_initiate( void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
}

void _os_activity_label_useraction_impl(unint64_t a1, uint64_t a2)
{
  uint64_t v69 = *MEMORY[0x1895FEE08];
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0LL, (dispatch_function_t)_os_trace_init_slow);
  }
  if (dword_18C43B70C != -1) {
    _os_trace_prefs_and_mode_refresh_slow(dword_18C43B70C);
  }
  unsigned int v5 = dword_18C43B710;
  int v6 = dword_18C43B714;
  if (dword_18C43B714 != dword_18C43B710)
  {
    while (1)
    {
      unsigned int v40 = __ldxr((unsigned int *)&dword_18C43B714);
      if (v40 != v6) {
        break;
      }
      if (!__stxr(v5, (unsigned int *)&dword_18C43B714))
      {
        _os_log_preferences_refresh_process();
        goto LABEL_6;
      }
    }

    __clrex();
  }

LABEL_6:
  if ((dword_18C43B700 & 0x500) == 0 && (MEMORY[0xFFFFFC104] & 0x500) == 0)
  {
    if (off_18C43B6F0) {
      int64_t v7 = (unint64_t *)((char *)off_18C43B6F0 + 8);
    }
    else {
      int64_t v7 = 0LL;
    }
    unint64_t v8 = 0x18C43B000uLL;
    if (_os_trace_dsc_load_addr <= a1 && _os_trace_dsc_size + _os_trace_dsc_load_addr > a1)
    {
      unsigned int v65 = v2 - _os_trace_dsc_load_addr;
      __int16 v66 = (unint64_t)(v2 - _os_trace_dsc_load_addr) >> 32;
      uint64_t v68 = 0LL;
      if (v66)
      {
        uint64_t v9 = 6LL;
        __int16 v67 = 6;
        uint64_t v10 = 1LL;
        if (!a2) {
          goto LABEL_52;
        }
      }

      else
      {
        uint64_t v10 = 0LL;
        uint64_t v9 = 4LL;
        __int16 v67 = 4;
        if (!a2) {
          goto LABEL_52;
        }
      }

  if ((dword_18C43B700 & 3) != 0
    || (MEMORY[0xFFFFFC104] & 3) != 0
    || (voucher_get_activity_id() & 0x300000000000000LL) != 0)
  {
    return 1;
  }

  if (((dword_18C43B700 & 8) != 0
     || (MEMORY[0xFFFFFC104] & 8) != 0
     || (voucher_get_activity_id() & 0x800000000000000LL) != 0)
    && (dword_18C43B770 & 2) != 0)
  {
    return BYTE4(qword_18C43B768) & 1;
  }

  return 0;
}

  if ((dword_18C43B700 & 2) != 0
    || (MEMORY[0xFFFFFC104] & 2) != 0
    || (voucher_get_activity_id() & 0x200000000000000LL) != 0)
  {
    LOBYTE(v2) = 1;
  }

  else if (((dword_18C43B700 & 8) != 0 {
          || (MEMORY[0xFFFFFC104] & 8) != 0
  }
          || (voucher_get_activity_id() & 0x800000000000000LL) != 0)
         && (dword_18C43B770 & 2) != 0)
  {
    return (BYTE4(qword_18C43B768) >> 1) & 1;
  }

  else
  {
    LOBYTE(v2) = 0;
  }

  return v2;
}

  if ((dword_18C43B700 & 0x100) != 0 || (MEMORY[0xFFFFFC104] & 0x100) != 0) {
    return 0LL;
  }
  os_unfair_lock_lock_with_options();
  if (byte_18C43B77B) {
    goto LABEL_9;
  }
  if (dword_18C43B724 != dword_18C43B710) {
    _os_log_preference_load_cache();
  }
  unsigned int v5 = (const void *)*((void *)&xmmword_18C43B728 + 1);
  if (!*((void *)&xmmword_18C43B728 + 1))
  {
LABEL_9:
    uint64_t v4 = 0LL;
  }

  else
  {
    int v6 = xmmword_18C43B728;
    while (1)
    {
      int64_t v7 = malloc(v6);
      if (v7) {
        break;
      }
      _os_trace_temporary_resource_shortage();
    }

    uint64_t v4 = v7;
    memcpy(v7, v5, v6);
    *a1 = xmmword_18C43B728;
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&dword_18C43B720);
  return v4;
}

  if ((dword_18C43B700 & 0x100) != 0 || (MEMORY[0xFFFFFC104] & 0x100) != 0) {
    return (os_log_t)&_os_log_disabled;
  }
  int v6 = strlen(subsystem) + 1;
  int64_t v7 = strlen(category);
  unint64_t v8 = (v7 + 1);
  uint64_t v9 = v6 + v8 + 4;
  MEMORY[0x1895FE128](v7);
  unint64_t v11 = (char *)v27 - v10;
  v11[2] = v6;
  v11[3] = v12;
  unint64_t v13 = (char *)v27 - v10 + 4;
  strlcpy(v13, subsystem, v14);
  strlcpy(&v13[v6], category, v8);
  unint64_t v15 = _os_log_find((uint64_t)v11);
  if (v15) {
    return (os_log_t)v15;
  }
  os_unfair_lock_lock_with_options();
  uint64_t result = (os_log_t)_os_log_find((uint64_t)v11);
  if (result)
  {
    unint64_t v15 = (unint64_t)result;
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_18C43BA08);
    return (os_log_t)v15;
  }

  if ((MEMORY[0xFFFFFC104] & 0x80000000) != 0
    || (MEMORY[0xFFFFFC104] & 0x10000000) == 0
    || (unsigned __int16)os_log_create_subsystem_id < 0xFA0u)
  {
    unint64_t v15 = _os_object_alloc_realized();
    *(_DWORD *)(v15 + 8) = 0x7FFFFFFF;
    *(_DWORD *)(v15 + 12) = 0x7FFFFFFF;
    *(void *)(v15 + 56) = 0x45000000000000LL;
    _os_log_set_default_signpost_opts(category, v15 + 56);
    metadata_buffer = voucher_activity_get_metadata_buffer();
    if (!metadata_buffer
      || (uint64_t v18 = v27[0] - 568LL,
          v27[0] -= 568LL,
          BOOL v19 = *(unsigned __int16 *)(metadata_buffer + 4),
          uint64_t v20 = (v9 & 1) + (_DWORD)v9 + (_DWORD)v19,
          WORD1(v20))
      || v18 <= v20)
    {
      *(_DWORD *)(v15 + 60) |= 0x4000000u;
      while (1)
      {
        unint64_t v23 = (unsigned __int16 *)malloc(v9);
        if (v23) {
          break;
        }
        _os_trace_temporary_resource_shortage();
      }

      unint64_t v21 = v23;
      unint64_t v22 = 0;
    }

    else
    {
      unint64_t v21 = (unsigned __int16 *)(metadata_buffer + v19 + 568);
      *(_WORD *)(metadata_buffer + 4) = (v9 & 1) + v9 + v19;
      unint64_t v22 = 1;
    }

    memcpy(v21, v11, v9);
    do
      unint64_t v24 = __ldxr((unsigned __int16 *)&os_log_create_subsystem_id);
    while (__stxr(v24 + 1, (unsigned __int16 *)&os_log_create_subsystem_id));
    const unsigned __int8 *v21 = v24;
    *(void *)(v15 + 24) = v21;
    *(_DWORD *)(v15 + 48) = dword_18C43B710;
    unint64_t v25 = &_os_log_globals[os_simple_hash() & 0x3F];
    os_unfair_lock_assert_owner((os_unfair_lock_t)&dword_18C43BA08);
    ++dword_18C43BA0C;
    *(void *)(v15 + 16) = *v25;
    atomic_store(v15, v25);
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_18C43BA08);
    if ((v22 & 1) == 0)
    {
      mach_continuous_time();
      voucher_activity_trace();
    }

    _os_log_preferences_refresh(v15);
    return (os_log_t)v15;
  }

  qword_18C50A768 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Too many os_log_t objects";
  qword_18C50A798 = (unsigned __int16)os_log_create_subsystem_id;
  __break(1u);
  return result;
}

  int64_t v7 = dword_18C43B700;
  if ((dword_18C43B700 & 0x100) != 0
    || (MEMORY[0xFFFFFC104] & 0x100) != 0
    || !byte_18C43B777 && ((dword_18C43B700 & 0x400) != 0 || (MEMORY[0xFFFFFC104] & 0x400) != 0) && !_os_log_hook)
  {
    goto LABEL_36;
  }

  LOBYTE(v8) = 0;
  if (oslog && oslog != (os_log_t)&_os_log_disabled)
  {
    if (*((void *)oslog + 3))
    {
      uint64_t v9 = dword_18C43B710;
      uint64_t v10 = *((_DWORD *)oslog + 12);
      if (v10 != dword_18C43B710)
      {
        unint64_t v16 = (unsigned int *)((char *)oslog + 48);
        while (1)
        {
          unint64_t v17 = __ldxr(v16);
          if (v17 != v10) {
            break;
          }
          if (!__stxr(v9, v16))
          {
            _os_log_preferences_refresh((uint64_t)oslog);
            int64_t v7 = dword_18C43B700;
            goto LABEL_16;
          }
        }

        __clrex();
      }
    }

  if ((dword_18C43B700 & 0x500) != 0 || (MEMORY[0xFFFFFC104] & 0x500) != 0)
  {
    LOBYTE(v4) = 0;
  }

  else
  {
    LOBYTE(v4) = 0;
    if (log && log != (os_log_t)&_os_log_disabled)
    {
      if (*((void *)log + 3))
      {
        unsigned int v5 = dword_18C43B710;
        int v6 = *((_DWORD *)log + 12);
        if (v6 != dword_18C43B710)
        {
          unint64_t v8 = (unsigned int *)((char *)log + 48);
          while (1)
          {
            uint64_t v9 = __ldxr(v8);
            if (v9 != v6) {
              break;
            }
            if (!__stxr(v5, v8))
            {
              _os_log_preferences_refresh((uint64_t)log);
              return (*((unsigned __int8 *)log + 62) >> 2) & 1;
            }
          }

          __clrex();
        }
      }

      return (*((unsigned __int8 *)log + 62) >> 2) & 1;
    }
  }

  return v4;
}

  if ((dword_18C43B700 & 0x500) == 0)
  {
    unint64_t v11 = (MEMORY[0xFFFFFC104] & 0x500) != 0 || off_18C43B6F0 == 0LL;
    if (!v11 && dword_18C43B70C == -1 && dword_18C43B6E4)
    {
      os_unfair_lock_lock_with_options();
      if (byte_18C43B6E0)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C43B6D0);
      }

      else
      {
        byte_18C43B6E0 = 1;
        os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C43B6D0);
        unint64_t v15 = *a2;
        v14[0] = MEMORY[0x1895FED80];
        v14[2] = ___os_state_request_for_self_block_invoke;
        v14[3] = &__block_descriptor_tmp_368;
        unint64_t v12 = *((void *)a2 + 2);
        v14[1] = 0x40000000LL;
        v14[4] = a1;
        uint64_t v18 = a3;
        unint64_t v16 = v12;
        unint64_t v17 = a4;
        dispatch_async((dispatch_queue_t)qword_18C43B6D8, v14);
      }
    }
  }

LABEL_44:
      unint64_t v24 = *(void *)(v8 + 2640);
      if (v24 <= a1)
      {
        if (_os_trace_dsc_size + v24 <= a1) {
          unint64_t v24 = a1;
        }
        unint64_t v25 = a2 - v24;
      }

      else
      {
        unint64_t v25 = a2 - a1;
      }

      unint64_t v26 = v25 & 0x7FFFFFFF | ((unint64_t)(unsigned __int16)(v25 >> 31) << 32);
      goto LABEL_53;
    }

    if (*(_DWORD *)(a1 + 12) == 2)
    {
      uint64_t v10 = 0LL;
      unsigned int v65 = v2 - a1;
      __int16 v66 = (v2 - a1) >> 32;
      uint64_t v9 = 4LL;
      __int16 v67 = 4;
      uint64_t v68 = 0LL;
      goto LABEL_43;
    }

    if (off_18C43B6F0)
    {
      do
      {
        while (1)
        {
          unint64_t v11 = __ldxr(v7);
          if (!(_DWORD)v11) {
            break;
          }
          __clrex();
          unint64_t v12 = v8;
          unint64_t v13 = v7;
          _os_trace_rwptr_rdlock_wait((uint64_t)v7);
          int64_t v7 = v13;
          unint64_t v8 = v12;
        }
      }

      while (__stxr(v11 + 0x200000000LL, v7));
      unint64_t v14 = v7[1];
      unint64_t v15 = *(unsigned __int16 *)(v14 + 10);
      unint64_t v16 = (a1 >> *MEMORY[0x189600140]) % v15;
      while (1)
      {
        unint64_t v17 = v14 + 16 * v16;
        uint64_t v18 = *(void *)(v17 + 16);
        if (v18 == a1) {
          break;
        }
        if (v16 + 1 == v15) {
          unint64_t v16 = 0LL;
        }
        else {
          ++v16;
        }
        if (v18) {
          BOOL v19 = v16 == (a1 >> *MEMORY[0x189600140]) % v15;
        }
        else {
          BOOL v19 = 1;
        }
        if (v19)
        {
          uint64_t v20 = 0LL;
          goto LABEL_35;
        }
      }

      uint64_t v20 = *(void *)(v17 + 24);
LABEL_35:
      unint64_t v21 = *(unsigned int *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      do
      {
        unint64_t v22 = __ldxr(v7);
        unint64_t v23 = v22 - 0x200000000LL;
        if (v23 == 0x100000000LL) {
          unint64_t v23 = v21;
        }
      }

      while (__stxr(v23, v7));
      if (v23 == v21)
      {
        __dmb(9u);
        uint64_t v45 = v20;
        _os_trace_rwptr_cleanup((uint64_t)v7);
        uint64_t v20 = v45;
      }

      uint64_t v68 = v20;
      if (v20)
      {
        uint64_t v10 = 0LL;
        unsigned int v65 = v2 - a1;
        __int16 v66 = (v2 - a1) >> 32;
        uint64_t v9 = 20LL;
        __int16 v67 = 20;
LABEL_43:
        if (a2) {
          goto LABEL_44;
        }
LABEL_52:
        unint64_t v26 = 0LL;
LABEL_53:
        unint64_t v64 = v26;
        uint64_t v27 = v9 + 2LL * ((v26 & 0xFFFF00000000LL) != 0);
        int v28 = MEMORY[0x1895FE128](v10);
        uint64_t v37 = (char *)v46 - v36;
        if (v28)
        {
          *(_DWORD *)uint64_t v37 = v65;
          *((_WORD *)v37 + 2) = v66;
        }

        else
        {
          *(_DWORD *)uint64_t v37 = v29;
          if ((v35 & 1) == 0) {
            *(_OWORD *)(v37 + 4) = *v33;
          }
        }

        if (v31) {
          *(_WORD *)&v37[v34] = v30;
        }
        if (((dword_18C43B700 & 8) != 0 || (*v32 & 8) != 0 || (voucher_get_activity_id() & 0x800000000000000LL) != 0)
          && (dword_18C43B770 & 1) != 0)
        {
          int v38 = 1;
        }

        else
        {
          int v38 = 0;
          uint64_t v63 = mach_continuous_time();
        }

        _os_get_logging_unreliable_for_current_thread();
        uint64_t v59 = v37;
        uint64_t v60 = v27;
        uint64_t v39 = voucher_activity_trace_v_2();
        if (v38)
        {
          uint64_t v41 = v39;
          uint64_t v42 = _os_trace_diagnosticd_pipe(0LL);
          if (v42)
          {
            uint64_t v43 = v42;
            __int128 v57 = 0u;
            __int128 v58 = 0u;
            __int128 v55 = 0u;
            __int128 v56 = 0u;
            __int128 v53 = 0u;
            __int128 v54 = 0u;
            __int128 v51 = 0u;
            __int128 v52 = 0u;
            __int128 v49 = 0u;
            __int128 v50 = 0u;
            __int128 v47 = 0u;
            __int128 v48 = 0u;
            memset(v46, 0, sizeof(v46));
            else {
              unsigned int v44 = bswap32(v41) >> 16;
            }
            v46[0] = v44;
            *((void *)&v47 + 1) = v41;
            *(void *)&__int128 v48 = v63;
            *(void *)&__int128 v50 = v61;
            *((void *)&v50 + 1) = (v62 / 0x3E8);
            *(void *)&__int128 v53 = a2;
            BYTE8(v53) = 1;
            _os_activity_stream_reflect((uint64_t)v42, (uint64_t)v46, a1, -3LL, &v65, (uint64_t)&v64);
            xpc_release(v43);
          }
        }

        return;
      }
    }

    else
    {
      uint64_t v68 = 0LL;
    }

    unsigned int v65 = v2;
    __int16 v66 = WORD2(v2);
    uint64_t v9 = 6LL;
    __int16 v67 = 6;
    uint64_t v10 = 1LL;
    if (a2) {
      goto LABEL_44;
    }
    goto LABEL_52;
  }

void os_activity_apply_f(os_activity_t activity, void *context, os_function_t function)
{
  if (activity == (os_activity_t)&_os_activity_current)
  {
    qword_18C50A768 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: OS_ACTIVITY_CURRENT passed";
    __break(1u);
  }

  else
  {
    if (activity != (os_activity_t)&_os_activity_none) {
      os_retain(activity);
    }
    voucher_adopt();
    ((void (*)(void *))function)(context);
    unsigned int v5 = (void *)voucher_adopt();
    os_release(v5);
  }

void os_activity_apply(os_activity_t activity, os_block_t block)
{
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  if (activity == (os_activity_t)&_os_activity_current)
  {
    qword_18C50A768 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: OS_ACTIVITY_CURRENT passed";
    __break(1u);
  }

  else
  {
    if (activity != (os_activity_t)&_os_activity_none) {
      os_retain(activity);
    }
    state->opaque[0] = voucher_get_activity_id();
    state->opaque[1] = voucher_adopt();
  }

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  uint64_t activity_id = voucher_get_activity_id();
  if (activity_id && activity_id != state->opaque[0])
  {
    _os_assumes_log_ctx();
    int v3 = (void *)state->opaque[1];
  }

  else
  {
    int v3 = (void *)voucher_adopt();
  }

  os_release(v3);
  state->opaque[0] = 0LL;
  state->opaque[1] = 0LL;
}

os_activity_id_t os_activity_get_identifier(os_activity_t activity, os_activity_id_t *parent_id)
{
  return voucher_get_activity_id();
}

void _os_trace_init_slow()
{
  uint64_t v29 = *MEMORY[0x1895FEE08];
  if ((dword_18C43B700 & 0x100) == 0 && (MEMORY[0xFFFFFC104] & 0x100) == 0)
  {
    int v0 = *__error();
    _dyld_get_prog_image_header();
    *(void *)&xmmword_18C43B738 = dyld_image_path_containing_address();
    main = (void *)xpc_bundle_create_main();
    info_xpc_object_t dictionary = (void *)xpc_bundle_get_info_dictionary();
    if (info_dictionary)
    {
      int v3 = info_dictionary;
      string = xpc_dictionary_get_string(info_dictionary, "CFBundleIdentifier");
      if (string) {
        qword_18C43B788 = (uint64_t)strdup(string);
      }
      xpc_object_t dictionary = xpc_dictionary_get_dictionary(v3, "OSLogPreferences");
      if (dictionary) {
        qword_18C43B780 = (uint64_t)xpc_retain(dictionary);
      }
    }

    xpc_release(main);
    if (_os_trace_allow_development_env_vars_once != -1) {
      dispatch_once(&_os_trace_allow_development_env_vars_once, &__block_literal_global_36);
    }
    int v6 = _os_trace_allow_development_env_vars_allowed;
    voucher_activity_get_metadata_buffer();
    int64_t v7 = getenv("OS_ACTIVITY_MODE");
    unint64_t v8 = getenv("OS_ACTIVITY_STREAM");
    uint64_t v9 = getenv("OS_ACTIVITY_PROPAGATE_MODE");
    int v10 = dword_18C43B700;
    if (v8 && !strcasecmp(v8, "live")) {
      v10 |= 8u;
    }
    if (v9) {
      int v11 = v10 | 0x10000;
    }
    else {
      int v11 = v10;
    }
    if (v7)
    {
      if (!strcasecmp(v7, "info"))
      {
        v11 |= 1u;
      }

      else if (!strcasecmp(v7, "debug"))
      {
        v11 |= 3u;
      }

      else if (!strcasecmp(v7, "off"))
      {
        v11 |= 0x400u;
      }

      else if (!strcasecmp(v7, "disable"))
      {
        v11 |= 0x100u;
      }

      else if (!strcasecmp(v7, "stream"))
      {
        v11 |= 0xBu;
        if (isatty(2)) {
          fputs("use OS_ACTIVITY_STREAM for configuring streaming.\n", (FILE *)*MEMORY[0x1895FEE10]);
        }
      }
    }

    dword_18C43B700 = v11;
    *(uint64_t *)((char *)&qword_18C43B768 + 4) = 0x70000000BLL;
    arc4random_buf(&xmmword_18C43B748, 8uLL);
    if (byte_18C43B775)
    {
      uint32_t v12 = _dyld_image_count();
      if (v12)
      {
        uint32_t v13 = v12;
        for (uint32_t i = 0; i != v13; ++i)
        {
          image_header = (mach_header *)_dyld_get_image_header(i);
          if (image_header) {
            _os_trace_image_was_loaded(image_header);
          }
        }
      }
    }

    else
    {
      _dyld_register_func_for_add_image((void (__cdecl *)(const mach_header *, intptr_t))_os_trace_image_was_loaded);
      _dyld_register_func_for_remove_image((void (__cdecl *)(const mach_header *, intptr_t))_os_trace_image_was_unloaded);
    }

    voucher_activity_flush();
    int v25 = 0;
    *(void *)unint64_t v26 = 0xE00000001LL;
    int v27 = 1;
    pid_t v28 = getpid();
    size_t v23 = 648LL;
    sysctl(v26, 4u, v24, &v23, 0LL, 0LL);
    if ((v25 & 0x800) != 0)
    {
      if (!v7) {
        dword_18C43B700 |= 3u;
      }
    }

    else if (issetugid())
    {
      goto LABEL_61;
    }

    unint64_t v16 = getenv("ACTIVITY_LOG_STDERR");
    if (!v16) {
      unint64_t v16 = getenv("CFLOG_FORCE_STDERR");
    }
    if (v6 && v16) {
      byte_18C43B776 = 1;
    }
    unint64_t v17 = getenv("OS_ACTIVITY_DT_MODE");
    if (v6 && v17) {
      byte_18C43B777 = 1;
    }
    uint64_t v18 = getenv("OS_ACTIVITY_TOOLS_PRIVACY");
    if (v6 && v18) {
      byte_18C43B778 = 1;
    }
    BOOL v19 = getenv("OS_ACTIVITY_TOOLS_OVERSIZE");
    if (v6)
    {
      if (v19) {
        byte_18C43B779 = 1;
      }
    }

    uint64_t v20 = getenv("OS_LOG_FAULT_REPORTS");
    if (!v20) {
      goto LABEL_61;
    }
    unint64_t v21 = v20;
    if (!strcasecmp(v20, "always"))
    {
      char v22 = 2;
      goto LABEL_60;
    }

    if (!strcasecmp(v21, "off"))
    {
      char v22 = 3;
LABEL_60:
      byte_18C43B77C = v22;
    }

void _os_trace_image_was_loaded(_DWORD *a1)
{
  if (off_18C43B6F0
    && (_os_trace_dsc_load_addr > (unint64_t)a1
     || _os_trace_dsc_size + _os_trace_dsc_load_addr <= (unint64_t)a1))
  {
    _os_trace_dylib_or_main_executable_was_loaded(a1);
  }

void _os_trace_image_was_unloaded(unint64_t a1)
{
  if (off_18C43B6F0
    && (_os_trace_dsc_load_addr > a1 || _os_trace_dsc_size + _os_trace_dsc_load_addr <= a1)
    && _dyld_get_image_uuid())
  {
    mach_continuous_time();
    voucher_activity_trace();
    uint64_t v2 = off_18C43B6F0;
    int v3 = (unsigned int *)((char *)off_18C43B6F0 + 8);
    unsigned int v4 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    while (!__ldaxr(v3))
    {
      if (!__stxr(v4, v3)) {
        goto LABEL_10;
      }
    }

    __clrex();
    os_unfair_lock_lock_with_options();
LABEL_10:
    uint64_t v6 = v2[2];
    unint64_t v7 = *(unsigned __int16 *)(v6 + 10);
    unint64_t v8 = (a1 >> *MEMORY[0x189600140]) % v7;
    while (1)
    {
      uint64_t v9 = v6 + 16 * v8;
      uint64_t v10 = *(void *)(v9 + 16);
      if (v10 == a1) {
        break;
      }
      if (v8 + 1 == v7) {
        unint64_t v8 = 0LL;
      }
      else {
        ++v8;
      }
      if (v10) {
        BOOL v11 = v8 == (a1 >> *MEMORY[0x189600140]) % v7;
      }
      else {
        BOOL v11 = 1;
      }
      if (v11) {
        goto LABEL_35;
      }
    }

    uint32_t v12 = (unint64_t *)(v9 + 16);
    *(void *)(v6 + 16 + 16 * v8 + 8) = 0LL;
    --*(_WORD *)(v6 + 8);
    unint64_t v13 = *(unsigned __int16 *)(v6 + 10);
    if (v8 + 1 < v13) {
      unint64_t v14 = v8 + 1;
    }
    else {
      unint64_t v14 = 0LL;
    }
    uint64_t v15 = *(void *)(v6 + 16 + 16 * v14);
    if (v15) {
      unint64_t v16 = -1LL;
    }
    else {
      unint64_t v16 = 0LL;
    }
    atomic_store(v16, v12);
    if (!v15)
    {
      if (!v8) {
        unint64_t v8 = v13;
      }
      unint64_t v17 = v8 - 1;
      uint64_t v18 = v6 + 16 * v17;
      if (*(void *)(v18 + 16) == -1LL)
      {
        BOOL v19 = (void *)(v18 + 16);
        do
        {
          void *v19 = 0LL;
          if (!v17) {
            unint64_t v17 = v13;
          }
          --v17;
          BOOL v19 = (void *)(v6 + 16 * v17 + 16);
        }

        while (*v19 == -1LL);
      }
    }

LABEL_35:
    _os_trace_rwptr_wrunlock((uint64_t)(v2 + 1), (void *)v6);
  }

void _os_trace_dylib_or_main_executable_was_loaded(_DWORD *a1)
{
  uint64_t v26 = *MEMORY[0x1895FEE08];
  uint64_t v2 = (char *)off_18C43B6F0;
  int v3 = (const char *)dyld_image_path_containing_address();
  if (v3)
  {
    unsigned int v4 = v3;
    size_t v5 = strlen(v3);
    uint64_t v6 = &v24[-((MEMORY[0x1895FE128]() + 48) & 0xFFFFFFFFFFFFFFF0LL)];
    *((void *)v6 + 2) = a1;
    uint64_t image_info = _os_trace_get_image_info(a1, 0LL, v6, (uint64_t)v24, 1);
    *((void *)v6 + 3) = image_info;
    if (image_info)
    {
      memcpy(v6 + 32, v4, v5 + 1);
      if (v24[0])
      {
        __int16 v8 = *(_WORD *)v2;
        if ((*(_WORD *)v2 & 4) == 0)
        {
          if ((v8 & 2) == 0)
          {
            else {
              __int16 v9 = 4;
            }
            __int16 v8 = *(_WORD *)v2 | v9;
            *(_WORD *)uint64_t v2 = v8;
          }

          if ((v8 & 2) != 0) {
            _os_trace_send_sections_to_logd((uint64_t)v6, (uint64_t)a1, (uint64_t)v24);
          }
        }
      }

      if (a1[3] != 2)
      {
        if (v24[1])
        {
          uint64_t v10 = (unsigned int *)(v2 + 8);
          uint64_t v11 = v25;
          unsigned int v12 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
          while (!__ldaxr(v10))
          {
            if (!__stxr(v12, v10)) {
              goto LABEL_21;
            }
          }

          __clrex();
          os_unfair_lock_lock_with_options();
LABEL_21:
          uint64_t v14 = *((void *)v2 + 2);
          uint64_t v15 = *(unsigned __int16 *)(v14 + 10);
          uint64_t v16 = v14;
          if (3 * (int)v15 < 4 * *(unsigned __int16 *)(v14 + 8))
          {
            size_t v17 = (32 * v15) | 0x10;
            while (1)
            {
              uint64_t v18 = calloc(1uLL, v17);
              if (v18) {
                break;
              }
              _os_trace_temporary_resource_shortage();
            }

            uint64_t v16 = (uint64_t)v18;
            v18[5] = 2 * *(_WORD *)(v14 + 10);
            *((_BYTE *)v18 + 12) = 1;
            unsigned int v19 = *(unsigned __int16 *)(v14 + 10);
            if (*(_WORD *)(v14 + 10))
            {
              unint64_t v20 = 0LL;
              unint64_t v21 = (uint64_t *)(v14 + 24);
              do
              {
                unint64_t v22 = *(v21 - 1);
                if (v22) {
                  BOOL v23 = v22 == -1LL;
                }
                else {
                  BOOL v23 = 1;
                }
                if (!v23)
                {
                  _os_trace_mh_map_insert_impl(0LL, v22, *v21, v16);
                  unsigned int v19 = *(unsigned __int16 *)(v14 + 10);
                }

                ++v20;
                v21 += 2;
              }

              while (v20 < v19);
            }
          }

          _os_trace_mh_map_insert_impl((uint64_t)v10, (unint64_t)a1, v11, v16);
        }

        mach_continuous_time();
        voucher_activity_trace();
      }
    }
  }

  else
  {
    _os_trace_log_simple("no path for address %p", a1);
  }

void _os_trace_send_sections_to_logd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_object_t v7 = xpc_array_create(0LL, 0LL);
  for (uint64_t i = 0LL; i != 40; i += 8LL)
    xpc_array_set_data( v7,  0xFFFFFFFFFFFFFFFFLL,  (const void *)(a2 + *(unsigned int *)(a3 + i + 16)),  *(unsigned int *)(a3 + i + 20));
  xpc_dictionary_set_uint64(v6, "operation", 4uLL);
  xpc_dictionary_set_uuid(v6, "uuid", (const unsigned __int8 *)a1);
  xpc_dictionary_set_string(v6, "path", (const char *)(a1 + 32));
  xpc_dictionary_set_value(v6, "sections", v7);
  xpc_release(v7);
  _os_trace_logd_send();
  xpc_release(v6);
}

uint64_t ___os_trace_allow_development_env_vars_block_invoke()
{
  uint64_t v2 = 0LL;
  uint64_t result = amfi_check_dyld_policy_self(0LL, &v2);
  char v1 = BYTE1(v2) & 1;
  if ((_DWORD)result) {
    char v1 = 0;
  }
  _os_trace_allow_development_env_vars_allowed = v1;
  return result;
}

void _os_trace_mig_server(uint64_t a1, mach_msg_header_t *a2)
{
  v11[1] = *MEMORY[0x1895FEE08];
  int v3 = (char *)v11 - ((MEMORY[0x1895FE128]() + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int v5 = *v4 & 0x1F;
  int v6 = v4[2];
  *(_DWORD *)int v3 = v5;
  *((_DWORD *)v3 + 1) = 36;
  int v7 = v4[5];
  *((_DWORD *)v3 + 4) = 0;
  *((_DWORD *)v3 + 5) = v7 + 100;
  *((_DWORD *)v3 + 2) = v6;
  *((_DWORD *)v3 + 3) = 0;
  if ((v7 - 50003) < 0xFFFFFFFD
    || (__int16 v8 = ostracemig_do_libtraceMIG_subsystem[5 * (v7 - 50000) + 5]) == 0LL)
  {
    *((void *)v3 + 3) = *MEMORY[0x1895FF688];
    *((_DWORD *)v3 + 8) = -303;
LABEL_7:
    a2->msgh_remote_port = 0;
    mach_msg_destroy(a2);
    return;
  }

  ((void (*)(mach_msg_header_t *, char *))v8)(a2, v3);
  if ((*(_DWORD *)v3 & 0x80000000) != 0)
  {
    int v9 = 0;
  }

  else
  {
    int v9 = *((_DWORD *)v3 + 8);
    if (v9) {
      goto LABEL_11;
    }
  }

  if (v5 == 18)
  {
    uint64_t v10 = *((int *)v3 + 5);
    qword_18C50A768 = (uint64_t)"BUG IN LIBTRACE: _os_trace_mig_server doesn't handle replies";
    qword_18C50A798 = v10;
    __break(1u);
    return;
  }

void *_os_trace_diagnosticd_pipe(void *a1)
{
  uint64_t v2 = (void *)qword_18C43B760;
  if ((void *)qword_18C43B760 != a1 || qword_18C43B760 == 0)
  {
    if (qword_18C43B760)
    {
LABEL_8:
      xpc_retain(v2);
      goto LABEL_9;
    }
  }

  else
  {
    xpc_release(a1);
    qword_18C43B760 = 0LL;
  }

  uint64_t v2 = (void *)xpc_pipe_create();
  qword_18C43B760 = (uint64_t)v2;
  if (v2) {
    goto LABEL_8;
  }
LABEL_9:
  os_unfair_lock_unlock((os_unfair_lock_t)&qword_18C43B768);
  return v2;
}

void _libtrace_fork_child()
{
  if (qword_18C43B760)
  {
    xpc_pipe_invalidate();
    xpc_release((xpc_object_t)qword_18C43B760);
  }

  memset(&v0, 0, 17);
  dword_18C43B708 = 0;
  *(_OWORD *)&qword_18C43B6F8 = 0u;
  *(_OWORD *)&_os_trace = 0u;
  dword_18C43B70C = -2;
  dword_18C43B710 = 0;
  dword_18C43B714 = -1;
  dword_18C43B720 = 0;
  qword_18C43B718 = 0LL;
  dword_18C43B724 = -1;
  byte_18C43B774 = 0;
  dword_18C43B770 = 0;
  qword_18C43B768 = 0LL;
  *(_OWORD *)&qword_18C43B758 = v0;
  xmmword_18C43B748 = 0u;
  xmmword_18C43B728 = 0u;
  xmmword_18C43B738 = 0u;
  byte_18C43B775 = 1;
  word_18C43B796 = 0;
  *(_OWORD *)((char *)&qword_18C43B780 + 6) = 0u;
  *(_OWORD *)&byte_18C43B776 = 0u;
  dword_18C43B708 = _os_trace_create_debug_control_port();
  if (_event_pipe)
  {
    xpc_pipe_invalidate();
    xpc_release((xpc_object_t)_event_pipe);
    _event_pipe = 0LL;
  }

  _event_lock = 0;
}

uint64_t _os_trace_create_debug_control_port()
{
  options.reserved[1] = 0LL;
  *(_OWORD *)&options.flags = xmmword_180124080;
  __int128 v0 = (task_t *)MEMORY[0x1895FFD48];
  if (mach_port_construct(*MEMORY[0x1895FFD48], &options, 0x71B75ACEuLL, &name))
  {
    _os_assumes_log();
    return 0LL;
  }

  else
  {
    if (task_set_special_port(*v0, 10, name)) {
      _os_assumes_log();
    }
    return name;
  }

uint64_t _os_trace_is_development_build()
{
  if ((MEMORY[0xFFFFFC104] & 0x80000000) != 0) {
    return 0LL;
  }
  else {
    return (MEMORY[0xFFFFFC104] >> 28) & 1;
  }
}

char *_os_trace_atm_diagnostic_config(_DWORD *a1)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  size_t v6 = 1024LL;
  if (sysctlbyname("kern.bootargs", __big, &v6, 0LL, 0LL)) {
    return 0LL;
  }
  uint64_t result = strcasestr(__big, "atm_diagnostic_config=");
  if (result)
  {
    __endptr = 0LL;
    int v3 = strtoul(result + 22, &__endptr, 16);
    if (__endptr)
    {
      unsigned int v4 = *__endptr;
      if (*__endptr)
      {
        if ((v4 & 0x80000000) != 0)
        {
          uint64_t result = (char *)__maskrune(v4, 0x4000uLL);
          if (!(_DWORD)result) {
            return result;
          }
        }

        else
        {
          uint64_t result = (char *)(*(_DWORD *)(MEMORY[0x1895FED88] + 4LL * v4 + 60) & 0x4000);
          if (!(_DWORD)result) {
            return result;
          }
        }
      }
    }

    *a1 = v3;
    return (char *)1;
  }

  return result;
}

uint64_t _os_trace_prefs_latest_version_4tests()
{
  if ((byte_18C43B774 & 1) == 0 && _dispatch_is_multithreaded())
  {
    do
      unsigned __int8 v0 = __ldxr((unsigned __int8 *)&byte_18C43B774);
    while (__stxr(1u, (unsigned __int8 *)&byte_18C43B774));
    if ((v0 & 1) == 0) {
      _os_log_watch_for_prefchanges();
    }
  }

  return dword_18C43B710;
}

BOOL _os_trace_mode_match_4tests(int a1)
{
  if ((byte_18C43B774 & 1) == 0 && _dispatch_is_multithreaded())
  {
    do
      unsigned __int8 v2 = __ldxr((unsigned __int8 *)&byte_18C43B774);
    while (__stxr(1u, (unsigned __int8 *)&byte_18C43B774));
    if ((v2 & 1) == 0) {
      _os_log_watch_for_prefchanges();
    }
  }

  return (dword_18C43B700 & a1) != 0
      || (MEMORY[0xFFFFFC104] & a1) != 0
      || (_BYTE)a1 && (((unint64_t)voucher_get_activity_id() >> 56) & a1) != 0;
}

uint64_t _os_trace_set_diagnostic_flags(uint32_t a1)
{
  host_priv_t v2 = MEMORY[0x186DF4CB4]();
  uint64_t v3 = host_set_atm_diagnostic_flag(v2, a1);
  mach_port_deallocate(*MEMORY[0x1895FFD48], v2);
  return v3;
}

uint64_t _os_trace_commpage_compute(int a1, int a2, int a3, int a4, char a5)
{
  unsigned int v5 = a1 & 0x8000000 | 0x80000000;
  if (a1 >= 0) {
    unsigned int v5 = a1 & 0x8000000;
  }
  if (a2 && (v5 |= 0x60000000u, (a5 & 1) == 0))
  {
    unsigned int v11 = a1 & 0x8000000 | 0x71000000;
    if (!a4) {
      unsigned int v11 = v5;
    }
    if (a1 >= 0) {
      return v11;
    }
    else {
      return v5;
    }
  }

  else
  {
    int v6 = a3 ^ 1 | a1 | v5;
    unsigned int v7 = v6 & 0xEEFFFFFF;
    unsigned int v8 = v6 | 0x11000001;
    if (!a4) {
      unsigned int v8 = v7;
    }
    unsigned int v9 = v5 | 1;
    if (a1 < 0) {
      return v9;
    }
    else {
      return v8;
    }
  }

uint64_t _os_trace_update_with_datavolume_4launchd()
{
  return _os_trace_commpage_setup();
}

uint64_t _os_trace_commpage_setup()
{
  int v0 = MEMORY[0xFFFFFC104];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  unsigned int v2 = v0 & 0xEEFFFFFE | 1;
  if (v0 < 0) {
    uint64_t result = v0 & 0x8000000 | 0x80000001;
  }
  else {
    uint64_t result = v2;
  }
  if ((_DWORD)result != v0) {
    return _os_trace_set_diagnostic_flags(result);
  }
  return result;
}

uint64_t _libtrace_init()
{
  _os_trace_dsc_load_addr = _dyld_get_shared_cache_range();
  if (getpid() == 1) {
    _os_trace_commpage_setup();
  }
  dword_18C43BA08 = 0;
  _os_log_mask_callback = (uint64_t)_os_log_mask_callback_impl;
  int v0 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  qword_18C43B6D8 = (uint64_t)dispatch_queue_create("com.apple.libtrace.state.block-list", v0);
  dword_18C43B708 = _os_trace_create_debug_control_port();
  return voucher_activity_initialize_4libtrace();
}

uint64_t _os_trace_get_logd_port()
{
  if ((dword_18C43B700 & 0x100) != 0 || (MEMORY[0xFFFFFC104] & 0x100) != 0) {
    return 0LL;
  }
  if (client_has_mach_ports_disabled_once != -1) {
    dispatch_once(&client_has_mach_ports_disabled_once, &__block_literal_global_33);
  }
  if ((client_has_mach_ports_disabled_has_entitlement & 1) != 0) {
    return 0LL;
  }
  return dword_18C43B704;
}

void _os_trace_debug_channel_handler(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
    _os_trace_mig_server(48LL, msg);
  }

  else if (a2 == 1 && (byte_18C43B774 & 1) == 0 && _dispatch_is_multithreaded())
  {
    do
      unsigned __int8 v2 = __ldxr((unsigned __int8 *)&byte_18C43B774);
    while (__stxr(1u, (unsigned __int8 *)&byte_18C43B774));
    if ((v2 & 1) == 0) {
      _os_log_watch_for_prefchanges();
    }
  }

uint64_t _os_trace_get_reconnect_info(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1895FE128](a1);
  __int128 v53 = v2;
  address = (mach_vm_address_t *)v1;
  uint64_t v65 = *MEMORY[0x1895FEE08];
  uint64_t __src = 0LL;
  __int128 v55 = &v64;
  uint64_t v56 = 0x100000000000LL;
  __int16 v58 = 0;
  char v59 = 1;
  int v57 = 0x100000;
  uint32_t v3 = _dyld_image_count();
  if (v3)
  {
    uint32_t v4 = v3;
    uint32_t v5 = 0;
    while (1)
    {
      image_header = _dyld_get_image_header(v5);
      if (image_header)
      {
        unsigned int v7 = (mach_header *)image_header;
        if ((_os_trace_dsc_load_addr > (unint64_t)image_header
           || _os_trace_dsc_size + _os_trace_dsc_load_addr <= (unint64_t)image_header)
          && image_header->filetype != 2)
        {
          image_mach_port_name_t name = _dyld_get_image_name(v5);
          if (image_name)
          {
            unsigned int v9 = (char *)image_name;
            size_t v10 = strlen(image_name);
            *(void *)&__int128 v63 = v7;
            *((void *)&v63 + 1) = _os_trace_get_image_info(v7, 0LL, uu, 0LL, 1);
            if (*((void *)&v63 + 1)) {
              break;
            }
          }
        }
      }

LABEL_26:
      if (v4 == ++v5) {
        goto LABEL_33;
      }
    }

    LOBYTE(v11) = v10 + 33;
    LODWORD(v60) = 3;
    HIDWORD(v60) = v10 + 33;
    char v12 = v58;
    if ((v58 & 2) == 0)
    {
      char v13 = v59;
      int v14 = v56;
      if ((v59 + HIDWORD(v56) - v56 - 1) <= 7)
      {
        os_trace_blob_add_slow((uint64_t)&v55, &v60, 8uLL);
        char v12 = v58;
        if ((v58 & 2) == 0)
        {
LABEL_14:
          char v18 = v59;
          int v19 = v56;
          if ((v59 + HIDWORD(v56) - v56 - 1) <= 0x1F)
          {
            os_trace_blob_add_slow((uint64_t)&v55, uu, 0x20uLL);
            char v12 = v58;
          }

          else
          {
            unint64_t v20 = v55;
            unint64_t v21 = (char *)v55 + v56;
            __int128 v22 = v63;
            _OWORD *v21 = *(_OWORD *)uu;
            v21[1] = v22;
            int v23 = v19 + 32;
            LODWORD(v56) = v23;
            if (!v18) {
              v20[v23] = 0;
            }
          }
        }

LABEL_17:
        if ((v12 & 2) == 0)
        {
          size_t v24 = v10 + 1;
          int v25 = v56;
          if (v24 > (v59 + HIDWORD(v56) - v56 - 1))
          {
            os_trace_blob_add_slow((uint64_t)&v55, v9, v24);
          }

          else
          {
            int v26 = v59;
            int v27 = v55;
            memcpy((char *)v55 + v56, v9, v24);
            LODWORD(v56) = v25 + v24;
            if (!v26) {
              v27[(v25 + v24)] = 0;
            }
          }
        }

        if ((v11 & 7) != 0 && (v58 & 2) == 0)
        {
          size_t v28 = 8 - (v11 & 7);
          int v29 = v56;
          if (v59 + HIDWORD(v56) - (int)v56 - 1 < v28)
          {
            os_trace_blob_add_slow((uint64_t)&v55, &__src, v28);
          }

          else
          {
            int v30 = v59;
            uint64_t v31 = v55;
            memcpy((char *)v55 + v56, &__src, v28);
            LODWORD(v56) = v29 + v28;
            if (!v30) {
              v31[(v29 + v28)] = 0;
            }
          }
        }

        goto LABEL_26;
      }

      uint64_t v15 = v55;
      unint64_t v16 = v60;
      *(void *)((char *)v55 + v56) = v60;
      int v17 = v14 + 8;
      LODWORD(v56) = v17;
      unint64_t v11 = HIDWORD(v16);
      if (!v13) {
        v15[v17] = 0;
      }
    }

    if ((v12 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_17;
  }

  if (!_os_log_mask_callback) {
    goto LABEL_33;
  }
  if (a3 > 0x6D6D75736C69616CLL)
  {
    if (a3 > 0x7075626D6C69616CLL)
    {
      if (a3 == 0x726464616C69616DLL) {
        goto LABEL_30;
      }
      int v14 = 0x7075626D6C69616DLL;
    }

    else
    {
      if (a3 == 0x6D6D75736C69616DLL) {
        goto LABEL_30;
      }
      int v14 = 0x6F6363616C69616DLL;
    }
  }

  else
  {
    if (a3 <= 0x656D616E6C69616CLL)
    {
      if (a3 != 0x786F626C69616DLL)
      {
        int v14 = 0x617474616C69616DLL;
        goto LABEL_29;
      }

LABEL_33:
  os_unfair_lock_lock_with_options();
  for (uint64_t i = 0LL; i != 64; ++i)
  {
    for (uint64_t j = _os_log_globals[i]; j; uint64_t j = *(void *)(j + 16))
    {
      if ((*(_BYTE *)(j + 63) & 4) != 0)
      {
        uint64_t v34 = *(unsigned __int8 **)(j + 24);
        LODWORD(v35) = v34[2] + v34[3] + 4;
        LODWORD(v60) = 2;
        HIDWORD(v60) = v35;
        char v36 = v58;
        if ((v58 & 2) == 0)
        {
          char v37 = v59;
          int v38 = v56;
          if ((v59 + HIDWORD(v56) - v56 - 1) <= 7)
          {
            os_trace_blob_add_slow((uint64_t)&v55, &v60, 8uLL);
            char v36 = v58;
          }

          else
          {
            uint64_t v39 = v55;
            unint64_t v40 = v60;
            *(void *)((char *)v55 + v56) = v60;
            int v41 = v38 + 8;
            LODWORD(v56) = v41;
            unint64_t v35 = HIDWORD(v40);
            if (!v37) {
              v39[v41] = 0;
            }
          }
        }

        if ((v36 & 2) == 0)
        {
          int v42 = v56;
          if (v59 + HIDWORD(v56) - (int)v56 - 1 < v35)
          {
            os_trace_blob_add_slow((uint64_t)&v55, v34, v35);
          }

          else
          {
            int v43 = v59;
            unsigned int v44 = v55;
            memcpy((char *)v55 + v56, v34, v35);
            LODWORD(v56) = v42 + v35;
            if (!v43) {
              v44[(v42 + v35)] = 0;
            }
          }
        }

        if ((v35 & 7) != 0 && (v58 & 2) == 0)
        {
          size_t v45 = 8 - (v35 & 7);
          int v46 = v56;
          if (v59 + HIDWORD(v56) - (int)v56 - 1 < v45)
          {
            os_trace_blob_add_slow((uint64_t)&v55, &__src, v45);
          }

          else
          {
            int v47 = v59;
            __int128 v48 = v55;
            memcpy((char *)v55 + v56, &__src, v45);
            LODWORD(v56) = v46 + v45;
            if (!v47) {
              v48[(v46 + v45)] = 0;
            }
          }
        }
      }
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&dword_18C43BA08);
  mach_vm_address_t *address = 0LL;
  size_t v49 = v56;
  mach_vm_size_t v50 = ~*MEMORY[0x189600138] & (*MEMORY[0x189600138] + v56);
  *__int128 v53 = v50;
  if (!v50) {
    return 0LL;
  }
  uint64_t v51 = mach_vm_allocate(*MEMORY[0x1895FFD48], address, v50, 1);
  if (!(_DWORD)v51) {
    memcpy((void *)*address, v55, v49);
  }
  if ((v58 & 1) != 0) {
    free(v55);
  }
  return v51;
}

      if (*a8)
      {
        LOWORD(v25) = 0;
      }

      else
      {
        _os_log_mask_create_device_digest((uint64_t)a5, a6, (uint64_t)__src);
        if (a3 == 0x7075626D6C69616DLL) {
          int v25 = 2LL;
        }
        else {
          int v25 = 16LL;
        }
        if (v25 > a7)
        {
          *unsigned int v8 = 1;
          int v25 = a7;
        }

        if ((*(_WORD *)(a4 + 20) & 2) == 0)
        {
          int v29 = *(unsigned int *)(a4 + 8);
          if (v25 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v29 - 1))
          {
            os_trace_blob_add_slow(a4, __src, v25);
          }

          else
          {
            memcpy((void *)(*(void *)a4 + v29), __src, v25);
            int v30 = *(_DWORD *)(a4 + 8) + v25;
            *(_DWORD *)(a4 + 8) = v30;
            if (!*(_BYTE *)(a4 + 22)) {
              *(_BYTE *)(*(void *)a4 + v30) = 0;
            }
          }
        }
      }

      LOWORD(a7) = v25;
      return (unsigned __int16)a7;
    }
  }

  else
  {
    if (a3 <= 0x786F626C69616CLL) {
      goto LABEL_31;
    }
    if (a3 != 0x786F626C69616DLL)
    {
      if (a3 != 0x617474616C69616DLL)
      {
        int v14 = 0x656D616E6C69616DLL;
LABEL_41:
        if (a3 != v14) {
          goto LABEL_213;
        }
        goto LABEL_42;
      }

      LODWORD(v89) = 0x1000000;
      __src[0] = 0LL;
      uint64_t v31 = _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(a5, a6, a6, __src, 0);
      unsigned int v32 = v31;
      if (v31)
      {
        char v33 = 0LL;
        uint64_t v34 = __src[0];
        unint64_t v35 = 5LL;
        if (v31 < 5) {
          unint64_t v35 = v31;
        }
        char v36 = a5 - 1;
        while (v35 != v33)
        {
          char v37 = v36[v31];
          ++v33;
          --v36;
          if (v37 == 46) {
            goto LABEL_134;
          }
        }

        char v33 = v35;
LABEL_134:
        __int16 v58 = v8;
        uint64_t v61 = &a5[v31 - v33];
        if (v61 != a5)
        {
          _os_log_mask_create_device_digest((uint64_t)a5, v31, (uint64_t)__src);
          unint64_t v62 = 0;
          __int128 v63 = 2LL;
          LOBYTE(v89) = 2;
          char v64 = -1;
          if (v34 < 0xFF) {
            char v64 = v34;
          }
          BYTE1(v89) = v64;
LABEL_139:
          if (a7 > 3)
          {
            uint64_t v65 = 4LL;
          }

          else
          {
            *__int16 v58 = 1;
            uint64_t v65 = a7;
          }

          if ((*(_WORD *)(a4 + 20) & 2) == 0)
          {
            __int16 v66 = *(unsigned int *)(a4 + 8);
            if (v65 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v66 - 1))
            {
              os_trace_blob_add_slow(a4, &v89, v65);
              if ((v62 & 1) == 0) {
                goto LABEL_147;
              }
              goto LABEL_154;
            }

            memcpy((void *)(*(void *)a4 + v66), &v89, v65);
            __int16 v67 = *(_DWORD *)(a4 + 8) + v65;
            *(_DWORD *)(a4 + 8) = v67;
            if (!*(_BYTE *)(a4 + 22)) {
              *(_BYTE *)(*(void *)a4 + v67) = 0;
            }
          }

          if ((v62 & 1) == 0)
          {
LABEL_147:
            if (a7 - v65 < v63)
            {
              *__int16 v58 = 1;
              __int128 v63 = a7 - v65;
            }

            if ((*(_WORD *)(a4 + 20) & 2) == 0)
            {
              uint64_t v68 = *(unsigned int *)(a4 + 8);
              if (v63 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v68 - 1))
              {
                os_trace_blob_add_slow(a4, __src, v63);
              }

              else
              {
                memcpy((void *)(*(void *)a4 + v68), __src, v63);
                uint64_t v69 = *(_DWORD *)(a4 + 8) + v63;
                *(_DWORD *)(a4 + 8) = v69;
                if (!*(_BYTE *)(a4 + 22)) {
                  *(_BYTE *)(*(void *)a4 + v69) = 0;
                }
              }
            }

            v65 += v63;
          }

size_t _os_trace_metadata_init(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1895FEE08];
  off_18C43B6F0 = (_UNKNOWN *)a1;
  if (a2 != 2048)
  {
    qword_18C50A768 = (uint64_t)"BUG IN LIBTRACE: Invalid metadata buffer size";
    qword_18C50A798 = a2;
    __break(1u);
LABEL_7:
    uint64_t v6 = *__error();
    qword_18C50A768 = (uint64_t)"BUG IN LIBTRACE: Unable to get unique pid";
    qword_18C50A798 = v6;
    __break(1u);
  }

  *(_WORD *)(a1 + 66) = 31;
  *(void *)(a1 + 16) = a1 + 56;
  pid_t v3 = getpid();
  if (proc_pidinfo(v3, 17, 0LL, &v7, 56) != 56) {
    goto LABEL_7;
  }
  *((void *)&xmmword_18C43B738 + 1) = v8;
  *(_OWORD *)(a1 + 24) = v7;
  _dyld_get_shared_cache_uuid();
  strlcpy((char *)(a1 + 568), (const char *)xmmword_18C43B738, 0x400uLL);
  size_t result = strlen((const char *)(a1 + 568));
  __int16 v5 = result + 1;
  if (((result + 1) & 1) != 0) {
    __int16 v5 = result + 2;
  }
  *(_WORD *)(a1 + 4) = v5;
  *(_WORD *)(a1 + 2) = v5;
  return result;
}

void __LIBTRACE_CLIENT_QUARANTINED_DUE_TO_HIGH_LOGGING_VOLUME__()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)int v0 = 0;
    _os_log_fault_impl( &dword_18010B000,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "QUARANTINED DUE TO HIGH LOGGING VOLUME",  v0,  2u);
  }

  byte_18C43B77A = 1;
}

void __client_has_mach_ports_disabled_block_invoke()
{
  int v0 = (void *)xpc_copy_entitlement_for_token();
  if (v0 == (void *)MEMORY[0x189600928])
  {
    client_has_mach_ports_disabled_has_entitlement = 1;
    goto LABEL_5;
  }

  if (v0) {
LABEL_5:
  }
    xpc_release(v0);
}

uint64_t _os_trace_assumes_log()
{
  return 1LL;
}

void _os_trace_with_buffer( void *dso, const char *message, uint8_t type, const void *buffer, size_t buffer_size, os_trace_payload_t payload)
{
  int v10 = type;
  uint64_t v66 = *MEMORY[0x1895FEE08];
  if (dyld_sdk_at_least())
  {
    if (_os_trace != -1) {
      dispatch_once_f(&_os_trace, 0LL, (dispatch_function_t)_os_trace_init_slow);
    }
    if (dword_18C43B70C != -1) {
      _os_trace_prefs_and_mode_refresh_slow(dword_18C43B70C);
    }
    unsigned int v13 = dword_18C43B710;
    int v14 = dword_18C43B714;
    if (dword_18C43B714 != dword_18C43B710)
    {
      while (1)
      {
        unsigned int v20 = __ldxr((unsigned int *)&dword_18C43B714);
        if (v20 != v14) {
          break;
        }
        if (!__stxr(v13, (unsigned int *)&dword_18C43B714))
        {
          _os_log_preferences_refresh_process();
          goto LABEL_7;
        }
      }

      __clrex();
    }

LABEL_7:
    if ((dword_18C43B700 & 0x500) == 0 && (MEMORY[0xFFFFFC104] & 0x500) == 0)
    {
      v55[0] = (uint64_t)payload;
      if (((dword_18C43B700 & 8) != 0
         || (MEMORY[0xFFFFFC104] & 8) != 0
         || (voucher_get_activity_id() & 0x800000000000000LL) != 0)
        && (dword_18C43B770 & 2) != 0)
      {
        if (v10 == 2)
        {
          int v15 = (BYTE4(qword_18C43B768) >> 1) & 1;
          goto LABEL_40;
        }

        if (v10 == 4)
        {
          int v15 = BYTE4(qword_18C43B768) & 1;
LABEL_16:
          if ((dword_18C43B700 & 3) != 0 || (MEMORY[0xFFFFFC104] & 3) != 0)
          {
            BOOL v58 = 0;
          }

          else
          {
            uint64_t activity_id = voucher_get_activity_id();
            if ((activity_id & 0x300000000000000LL) != 0) {
              char v19 = 1;
            }
            else {
              char v19 = v15;
            }
            if ((v19 & 1) == 0) {
              return;
            }
            BOOL v58 = (activity_id & 0x300000000000000LL) == 0;
          }

          uint64_t v16 = 256LL;
          goto LABEL_46;
        }

        int v15 = (BYTE4(qword_18C43B768) >> 3) & 1;
      }

      else
      {
        int v15 = 0;
      }

      if (v10 > 64)
      {
        uint64_t v16 = 4096LL;
        uint64_t v17 = 4352LL;
        if (v10 != 193) {
          uint64_t v17 = 0LL;
        }
        BOOL v58 = 0;
        if (v10 != 65) {
          uint64_t v16 = v17;
        }
LABEL_46:
        uint64_t v57 = v16;
LABEL_47:
        if (off_18C43B6F0) {
          __int128 v22 = (unint64_t *)((char *)off_18C43B6F0 + 8);
        }
        else {
          __int128 v22 = 0LL;
        }
        int v59 = v15;
        if (_os_trace_dsc_load_addr <= (unint64_t)dso
          && _os_trace_dsc_size + _os_trace_dsc_load_addr > (unint64_t)dso)
        {
          unsigned int v62 = v6 - _os_trace_dsc_load_addr;
          __int16 v63 = (unint64_t)(v6 - _os_trace_dsc_load_addr) >> 32;
          uint64_t v65 = 0LL;
          int v23 = 0LL;
          if (v63)
          {
            uint64_t v24 = 6LL;
            __int16 v64 = 6;
          }

          else
          {
            uint64_t v24 = 4LL;
            __int16 v64 = 4;
          }

          goto LABEL_84;
        }

        if (*((_DWORD *)dso + 3) == 2)
        {
          int v23 = 0LL;
          unsigned int v62 = v6 - (_DWORD)dso;
          __int16 v63 = (unint64_t)(v6 - (void)dso) >> 32;
          uint64_t v24 = 4LL;
          __int16 v64 = 4;
          uint64_t v65 = 0LL;
LABEL_84:
          if (message)
          {
            uint64_t v35 = _os_trace_dsc_load_addr;
            if (_os_trace_dsc_load_addr <= (unint64_t)dso)
            {
              unint64_t v36 = (unint64_t)&message[-v35];
            }

            else
            {
              unint64_t v36 = message - (_BYTE *)dso;
            }

            unint64_t v37 = v36 & 0x7FFFFFFF | ((unint64_t)(unsigned __int16)(v36 >> 31) << 32);
          }

          else
          {
            unint64_t v37 = 0LL;
          }

          unint64_t v61 = v37;
          uint64_t v38 = v24 + 2LL * ((v37 & 0xFFFF00000000LL) != 0);
          size_t v45 = (char *)v55 - MEMORY[0x1895FE128]((v38 + 1039) & 0xFFFFFFFFFFFFFFF0LL);
          if (v46)
          {
            *(_DWORD *)size_t v45 = v62;
            *((_WORD *)v45 + 2) = v63;
          }

          else
          {
            *(_DWORD *)size_t v45 = v43;
            if ((v42 & 1) == 0) {
              *(_OWORD *)(v45 + 4) = *v23;
            }
          }

          if (v44)
          {
            uint64_t v39 = v39 | 0x20;
            *(_WORD *)&v45[v41] = WORD2(v37);
          }

          unint64_t v60 = buffer;
          v55[1] = v40;
          uint64_t v56 = v39;
          if (buffer_size > 0x3FF)
          {
            uint64_t v47 = *((char *)buffer + buffer_size - 1);
            if (*((char *)buffer + buffer_size - 1))
            {
              size_t v48 = 0LL;
              size_t v49 = 0LL;
              mach_vm_size_t v50 = (char *)buffer + buffer_size + ~v47;
              while (1)
              {
                size_t v51 = v49 + (v50[v48] & 0x3F);
                size_t v52 = v48 + 1;
                if (v48 + 1 + v51 >= 0x401) {
                  break;
                }
                ++v48;
                size_t v49 = v51;
                if (v47 == v52) {
                  goto LABEL_107;
                }
              }

              memcpy(&v45[v38], v60, v49);
              memcpy(&v45[v38 + v49], v50, v48);
              v45[v49 + v38 + v48] = v48;
            }
          }

          else
          {
            memcpy(&v45[v38], buffer, buffer_size);
          }

LABEL_107:
          uint64_t v53 = mach_continuous_time();
          uint64_t v54 = ((unint64_t)v56 << 16) | (v37 << 32) | v57 | 3;
          if (!v58) {
            uint64_t v54 = voucher_activity_trace();
          }
          if (v59) {
            _os_trace_stream( (unint64_t)dso,  (uint64_t)message,  &v62,  (uint64_t)&v61,  (uint64_t)v60,  (void *)buffer_size,  v54,  v53,  v55[0]);
          }
          return;
        }

        if (off_18C43B6F0)
        {
          do
          {
            while (1)
            {
              unint64_t v25 = __ldxr(v22);
              if (!(_DWORD)v25) {
                break;
              }
              __clrex();
              _os_trace_rwptr_rdlock_wait((uint64_t)v22);
            }
          }

          while (__stxr(v25 + 0x200000000LL, v22));
          unint64_t v26 = v22[1];
          unint64_t v27 = *(unsigned __int16 *)(v26 + 10);
          unint64_t v28 = ((unint64_t)dso >> *MEMORY[0x189600140]) % v27;
          while (1)
          {
            unint64_t v29 = v26 + 16 * v28;
            int v30 = *(void **)(v29 + 16);
            if (v30 == dso) {
              break;
            }
            if (v28 + 1 == v27) {
              unint64_t v28 = 0LL;
            }
            else {
              ++v28;
            }
            if (v30) {
              BOOL v31 = v28 == ((unint64_t)dso >> *MEMORY[0x189600140]) % v27;
            }
            else {
              BOOL v31 = 1;
            }
            if (v31)
            {
              int v23 = 0LL;
              goto LABEL_73;
            }
          }

          int v23 = *(_OWORD **)(v29 + 24);
LABEL_73:
          unint64_t v32 = *(unsigned int *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
          do
          {
            unint64_t v33 = __ldxr(v22);
            unint64_t v34 = v33 - 0x200000000LL;
            if (v34 == 0x100000000LL) {
              unint64_t v34 = v32;
            }
          }

          while (__stxr(v34, v22));
          if (v34 == v32)
          {
            __dmb(9u);
            _os_trace_rwptr_cleanup((uint64_t)v22);
          }

          uint64_t v65 = v23;
          if (v23)
          {
            unsigned int v62 = v6 - (_DWORD)dso;
            __int16 v63 = (unint64_t)(v6 - (void)dso) >> 32;
            uint64_t v24 = 20LL;
            __int16 v64 = 20;
            goto LABEL_84;
          }
        }

        else
        {
          uint64_t v65 = 0LL;
        }

        int v23 = 0LL;
        unsigned int v62 = v6;
        __int16 v63 = WORD2(v6);
        uint64_t v24 = 6LL;
        __int16 v64 = 6;
        goto LABEL_84;
      }

      if (v10 != 2)
      {
        if (v10 != 4)
        {
          BOOL v58 = 0;
          uint64_t v57 = 0LL;
          goto LABEL_47;
        }

        goto LABEL_16;
      }

LABEL_40:
      if ((dword_18C43B700 & 2) != 0 || (MEMORY[0xFFFFFC104] & 2) != 0)
      {
        BOOL v58 = 0;
      }

      else
      {
        uint64_t v21 = voucher_get_activity_id();
        BOOL v58 = (v21 & 0x200000000000000LL) == 0;
      }

      uint64_t v16 = 512LL;
      goto LABEL_46;
    }
  }

void _os_trace_stream( unint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17 = _os_trace_diagnosticd_pipe(0LL);
  if (v17)
  {
    char v18 = v17;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    *(_OWORD *)object = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    memset(v21, 0, sizeof(v21));
    else {
      unsigned int v19 = bswap32(a7) >> 16;
    }
    LODWORD(v21[0]) = v19;
    *((void *)&v22 + 1) = a7;
    *(void *)&__int128 v23 = a8;
    *(void *)&__int128 v28 = a2;
    *((void *)&v28 + 1) = a5;
    object[0] = a6;
    if (a9)
    {
      xpc_object_t v20 = xpc_dictionary_create(0LL, 0LL, 0LL);
      (*(void (**)(uint64_t, xpc_object_t))(a9 + 16))(a9, v20);
      if (xpc_dictionary_get_count(v20)) {
        object[1] = v20;
      }
      else {
        xpc_release(v20);
      }
    }

    _os_activity_stream_reflect((uint64_t)v18, (uint64_t)v21, a1, -3LL, a3, a4);
    if (object[1])
    {
      xpc_release(object[1]);
      object[1] = 0LL;
    }

    xpc_release(v18);
  }

uint64_t os_trace_get_type(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 1);
  if (v1 <= 1)
  {
    if (!*(_BYTE *)(a1 + 1)) {
      return 1LL;
    }
    if (v1 == 1) {
      return 4LL;
    }
  }

  else
  {
    switch(v1)
    {
      case 2u:
        return 2LL;
      case 0x10u:
        return 65LL;
      case 0x11u:
        return 193LL;
    }
  }

  return 0LL;
}

uint64_t os_trace_set_mode(uint64_t result)
{
  if ((dword_18C43B700 & 0x100) == 0 && (MEMORY[0xFFFFFC104] & 0x100) == 0) {
    dword_18C43B700 = result & 0xFFFFFF;
  }
  return result;
}

uint64_t os_trace_get_mode()
{
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0LL, (dispatch_function_t)_os_trace_init_slow);
  }
  if (dword_18C43B70C != -1) {
    _os_trace_prefs_and_mode_refresh_slow(dword_18C43B70C);
  }
  unsigned int v0 = dword_18C43B710;
  int v1 = dword_18C43B714;
  if (dword_18C43B714 != dword_18C43B710)
  {
    while (1)
    {
      unsigned int v3 = __ldxr((unsigned int *)&dword_18C43B714);
      if (v3 != v1) {
        break;
      }
      if (!__stxr(v0, (unsigned int *)&dword_18C43B714))
      {
        _os_log_preferences_refresh_process();
        return dword_18C43B700;
      }
    }

    __clrex();
  }

  return dword_18C43B700;
}

BOOL _os_trace_set_mode_for_pid(int pid, int a2)
{
  mach_port_name_t name = 0;
  unsigned int v3 = (ipc_space_t *)MEMORY[0x1895FFD48];
  BOOL v4 = 0LL;
  if (!debug_control_port_for_pid(*MEMORY[0x1895FFD48], pid, &name))
  {
    if (name)
    {
      uint64_t v8 = *MEMORY[0x1895FF688];
      int v9 = a2;
      uint64_t v10 = 0LL;
      msg.msgh_bits = 19;
      msg.msgh_remote_port = name;
      msg.msgh_id = 50000;
      *(void *)&msg.msgh_local_port = 0LL;
      if (MEMORY[0x189600168]) {
        voucher_mach_msg_set(&msg);
      }
      BOOL v4 = mach_msg(&msg, 1, 0x2Cu, 0, 0, 0, 0) == 0;
      if (mach_port_deallocate(*v3, name)) {
        _os_assumes_log();
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v4;
}

BOOL _os_trace_get_mode_for_pid(int pid, _DWORD *a2)
{
  kern_return_t v4;
  BOOL result;
  mach_port_t v6;
  mach_port_t reply_port;
  mach_msg_return_t v8;
  int v9;
  BOOL v10;
  unsigned __int16 v11;
  mach_port_name_t name;
  mach_msg_header_t msg;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v16 = *MEMORY[0x1895FEE08];
  mach_port_name_t name = 0;
  unsigned int v3 = (ipc_space_t *)MEMORY[0x1895FFD48];
  BOOL v4 = debug_control_port_for_pid(*MEMORY[0x1895FFD48], pid, &name);
  size_t result = 0LL;
  if (v4) {
    return result;
  }
  uint64_t v6 = name;
  if (!name) {
    return 0LL;
  }
  reply_port = mig_get_reply_port();
  msg.msgh_remote_port = v6;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0xC35200000000LL;
  if (MEMORY[0x189600168])
  {
    voucher_mach_msg_set(&msg);
    reply_port = msg.msgh_local_port;
  }

  uint64_t v8 = mach_msg(&msg, 275, 0x18u, 0x38u, reply_port, 0x3E8u, 0);
  int v9 = v8;
  if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    goto LABEL_22;
  }

  if (!v8)
  {
    if (msg.msgh_id == 71)
    {
      int v9 = -308;
    }

    else if (msg.msgh_id == 50102)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 48)
        {
          if (!msg.msgh_remote_port)
          {
            int v9 = v14;
            if (!v14)
            {
              *a2 = v15;
              goto LABEL_36;
            }

            goto LABEL_30;
          }
        }

        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            uint64_t v10 = 1;
          }
          else {
            uint64_t v10 = v14 == 0;
          }
          if (v10) {
            int v9 = -300;
          }
          else {
            int v9 = v14;
          }
          goto LABEL_30;
        }
      }

      int v9 = -300;
    }

    else
    {
      int v9 = -301;
    }

LABEL_30:
    mach_msg_destroy(&msg);
    goto LABEL_31;
  }

  mig_dealloc_reply_port(msg.msgh_local_port);
LABEL_22:
  if (v9 == 268435460)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*v3, msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
    unint64_t v11 = 4;
LABEL_35:
    int v9 = v11 | 0x10000000;
    goto LABEL_36;
  }

      int v15 = v12 >> 4;
      if (v15 == 4 || v15 == 2) {
        goto LABEL_32;
      }
LABEL_33:
      LOWORD(v8) = 0;
      *a8 = 0;
      goto LABEL_34;
    }

    if (a3 == 0x656D616E6C69616DLL) {
      goto LABEL_30;
    }
    int v14 = 0x6A6275736C69616DLL;
  }

LABEL_31:
  if (v9 == 268451843)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      msg.msgh_bits = 67109120;
      msg.msgh_size = 268451843;
      _os_log_error_impl( &dword_18010B000,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Timed out get mode error %d",  (uint8_t *)&msg,  8u);
    }

    unint64_t v11 = 16387;
    goto LABEL_35;
  }

      if (a3 == 1752392040)
      {
        if (*a8)
        {
          LOWORD(a7) = 0;
        }

        else
        {
          _os_log_mask_create_digest((uint64_t)a5, a6, (uint64_t)&xmmword_18C43B748, (uint64_t)__src);
          if (a7 > 0xF) {
            a7 = 16LL;
          }
          else {
            *uint64_t v8 = 1;
          }
          if ((*(_WORD *)(a4 + 20) & 2) == 0)
          {
            int v59 = *(unsigned int *)(a4 + 8);
            if (a7 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v59 - 1))
            {
              os_trace_blob_add_slow(a4, __src, a7);
            }

            else
            {
              memcpy((void *)(*(void *)a4 + v59), __src, a7);
              unint64_t v60 = *(_DWORD *)(a4 + 8) + a7;
              *(_DWORD *)(a4 + 8) = v60;
              if (!*(_BYTE *)(a4 + 22)) {
                *(_BYTE *)(*(void *)a4 + v60) = 0;
              }
            }
          }
        }

        return (unsigned __int16)a7;
      }

      if (a3 == 0x68736168766564LL) {
        goto LABEL_33;
      }
LABEL_213:
      _os_crash();
      __break(1u);
      goto LABEL_214;
    }

    if (a3 <= 0x6F6363616C69616CLL)
    {
      if (a3 != 0x6A6275736C69616DLL)
      {
        unsigned int v13 = 0x6D6D75736C69616DLL;
        goto LABEL_37;
      }
    }

    else if (a3 != 0x726464616C69616DLL)
    {
      if (a3 != 0x7075626D6C69616DLL)
      {
        unsigned int v13 = 0x6F6363616C69616DLL;
        goto LABEL_37;
      }

      goto LABEL_33;
    }

  __int128 v24 = (objc_class *)MEMORY[0x189600960];
  __int128 v25 = _os_log_preference_value((uint64_t)&v52, "Supports-Signpost-Introspection", MEMORY[0x189600960]);
  __int128 v26 = _os_log_preference_value((uint64_t)&v52, "Signpost-Enabled", v24);
  uint64_t v47 = v10;
  if (v26)
  {
    if (v26 == v18)
    {
LABEL_36:
      __int128 v27 = 0x40000;
      goto LABEL_38;
    }
  }

  else if (strcmp(a2, "DynamicTracing") && strcmp(a2, "DynamicStackTracing"))
  {
    goto LABEL_36;
  }

  __int128 v27 = 0;
LABEL_38:
  __int128 v28 = (objc_class *)MEMORY[0x189600960];
  unint64_t v29 = _os_log_preference_value((uint64_t)&v52, "Signpost-Persisted", MEMORY[0x189600960]);
  __int128 v30 = _os_log_preference_value((uint64_t)&v52, "Signpost-Backtraces-Enabled", v28);
  if (v30)
  {
    if (v30 == v18) {
      __int128 v31 = 1;
    }
    else {
      __int128 v31 = 2;
    }
  }

  else
  {
    __int128 v31 = strcmp(a2, "DynamicStackTracing") == 0;
  }

  __int128 v32 = _os_log_preference_value((uint64_t)&v52, "Signpost-Allow-Streaming", v28);
  __int128 v33 = _os_log_preference_value((uint64_t)&v52, "Enable-Fault-Crashlogs", v28);
  if (v33 == v18)
  {
LABEL_50:
    unint64_t v36 = 0x1000000;
    goto LABEL_51;
  }

  if (v33 == (xpc_object_t)MEMORY[0x189600920]) {
    goto LABEL_49;
  }
  unint64_t v34 = _os_log_preference_value((uint64_t)&v52, "Enable-Fault-Crashlogs", MEMORY[0x1896009B8]);
  if (!v34) {
    goto LABEL_49;
  }
  uint64_t v35 = xpc_string_get_string_ptr(v34);
  if (strcasecmp(v35, "Once"))
  {
    if (!strcasecmp(v35, "None") || strcasecmp(v35, "Always"))
    {
LABEL_49:
      unint64_t v36 = 0;
      goto LABEL_51;
    }

    goto LABEL_50;
  }

  unint64_t v36 = 0x800000;
LABEL_51:
  if (v32 == v18 || v32 == 0LL) {
    uint64_t v38 = 0x400000;
  }
  else {
    uint64_t v38 = 0;
  }
  size_t result = _os_log_preference_value((uint64_t)&v52, "Enable-Fault-Crashlog-Excerpts", MEMORY[0x189600960]);
  *(_BYTE *)a3 = 0;
  *(_BYTE *)(a3 + 1) = v47;
  *(_BYTE *)(a3 + 2) = v11;
  *(_BYTE *)(a3 + 3) = v46;
  *(_DWORD *)(a3 + 4) = (v45 | (8 * v44)) | ((v43 == v18) << 9) | ((v42 == v18) << 10) | v41 | v40 | v23 | ((v25 == v18) << 17) | v27 | ((v29 == v18) << 19) | (v31 << 20) | v38 | v36 | ((result == v18) << 25);
  return result;
}

      __int16 v5 = *(int **)v5;
      if (!v5) {
        goto LABEL_32;
      }
    }

    if (v8 >= v9 + 10)
    {
      if (v8 < 70) {
        goto LABEL_13;
      }
      uint64_t v10 = 1;
    }

    else if ((int)v9 <= 30)
    {
      uint64_t v10 = 2 * v9;
    }

    else
    {
      uint64_t v10 = 60;
    }

    v5[14] = v10;
LABEL_13:
    *((void *)v5 + 6) = v3;
    if (_dyld_get_image_uuid())
    {
      *(void *)unint64_t v37 = 0LL;
      uint64_t v38 = v37;
      uint64_t v39 = 0x2000000000LL;
      uint64_t v40 = 0LL;
      unint64_t v11 = (dispatch_queue_s *)*((void *)v5 + 4);
      block[0] = v7;
      block[1] = 0x40000000LL;
      block[2] = ___os_state_request_for_self_impl_block_invoke;
      block[3] = &unk_189624CB0;
      block[4] = v37;
      block[5] = v5;
      block[6] = &v34;
      dispatch_sync(v11, block);
      char v12 = *((void *)v38 + 3);
      if (v12)
      {
        unsigned int v13 = *(unsigned int *)(v12 + 4);
        if (v13 < 0x7F39)
        {
          int v14 = v7;
          int v15 = v6;
          uint64_t v16 = v1;
          uint64_t v17 = v13 + 200;
          *(_BYTE *)(v12 + 199) = 0;
          *(_BYTE *)(v12 + 71) = 0;
          *(_BYTE *)(v12 + 135) = 0;
          char v18 = xpc_dictionary_create(0LL, 0LL, 0LL);
          unsigned int v19 = dispatch_data_create(*((const void **)v38 + 3), v17, 0LL, destructor);
          xpc_object_t v20 = xpc_data_create_with_dispatch_data(v19);
          xpc_dictionary_set_value(v18, "data", v20);
          xpc_release(v20);
          dispatch_release(v19);
          uint64_t v21 = mach_continuous_time();
          xpc_dictionary_set_uint64(v18, "ts", v21);
          xpc_dictionary_set_uuid(v18, "uuid", uuid);
          if ((_DWORD)value) {
            xpc_dictionary_set_uint64(v18, "ttl", value);
          }
          xpc_array_append_value(v4, v18);
          xpc_release(v18);
          int v1 = v16;
          if (xpc_array_get_count(v4) == 10)
          {
            __int128 v22 = v35;
            __int128 v23 = xpc_dictionary_create(0LL, 0LL, 0LL);
            xpc_dictionary_set_uint64(v23, "operation", 2uLL);
            uint64_t v6 = v15;
            xpc_dictionary_set_uint64(v23, "aid", v1);
            xpc_dictionary_set_value(v23, "entries", v4);
            if (*(_BYTE *)(v15 + 1914) && v22 != 3) {
              xpc_dictionary_set_BOOL(v23, "quarantined", 1);
            }
            _os_trace_logd_send();
            xpc_release(v23);
            xpc_release(v4);
            BOOL v4 = xpc_array_create(0LL, 0LL);
          }

          else
          {
            uint64_t v6 = v15;
          }

          __int128 v7 = v14;
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_18010B000,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Statedump too large",  buf,  2u);
            char v12 = *((void *)v38 + 3);
          }

          free((void *)v12);
        }
      }

      _Block_object_dispose(v37, 8);
    }

    goto LABEL_31;
  }

LABEL_36:
  if (mach_port_deallocate(*v3, name)) {
    _os_assumes_log();
  }
  return v9 == 0;
}

BOOL os_trace_info_enabled(void)
{
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0LL, (dispatch_function_t)_os_trace_init_slow);
  }
  if (dword_18C43B70C != -1) {
    _os_trace_prefs_and_mode_refresh_slow(dword_18C43B70C);
  }
  unsigned int v0 = dword_18C43B710;
  int v1 = dword_18C43B714;
  if (dword_18C43B714 != dword_18C43B710)
  {
    while (1)
    {
      unsigned int v3 = __ldxr((unsigned int *)&dword_18C43B714);
      if (v3 != v1) {
        break;
      }
      if (!__stxr(v0, (unsigned int *)&dword_18C43B714))
      {
        _os_log_preferences_refresh_process();
        goto LABEL_6;
      }
    }

    __clrex();
  }

BOOL os_trace_debug_enabled(void)
{
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0LL, (dispatch_function_t)_os_trace_init_slow);
  }
  if (dword_18C43B70C != -1) {
    _os_trace_prefs_and_mode_refresh_slow(dword_18C43B70C);
  }
  unsigned int v0 = dword_18C43B710;
  int v1 = dword_18C43B714;
  if (dword_18C43B714 != dword_18C43B710)
  {
    while (1)
    {
      unsigned int v3 = __ldxr((unsigned int *)&dword_18C43B714);
      if (v3 != v1) {
        break;
      }
      if (!__stxr(v0, (unsigned int *)&dword_18C43B714))
      {
        _os_log_preferences_refresh_process();
        goto LABEL_6;
      }
    }

    __clrex();
  }

BOOL _os_trace_lazy_init_completed_4libxpc()
{
  return _os_trace != 0;
}

BOOL _os_trace_lazy_init_completed_4swift()
{
  return _os_trace != 0;
}

uint64_t _os_log_mask_callback_impl( int a1, _BYTE *a2, uint64_t a3, uint64_t a4, _BYTE *a5, unint64_t a6, size_t a7, _BYTE *a8)
{
  uint64_t v8 = a8;
  __src[4] = *MEMORY[0x1895FEE08];
  if (a1 == 1)
  {
    if (a3 <= 0x6A6275736C69616CLL)
    {
      if (a3 > 0x786F626C69616CLL)
      {
        if (a3 == 0x786F626C69616DLL || a3 == 0x617474616C69616DLL) {
          goto LABEL_38;
        }
        uint64_t v13 = 0x656D616E6C69616DLL;
LABEL_37:
        if (a3 == v13) {
          goto LABEL_38;
        }
        goto LABEL_213;
      }

LABEL_38:
    LOWORD(a7) = 0;
    *a2 = 1;
    return (unsigned __int16)a7;
  }

  if (a3 > 0x6A6275736C69616CLL)
  {
    if (a3 <= 0x6F6363616C69616CLL)
    {
      if (a3 == 0x6A6275736C69616DLL) {
        goto LABEL_42;
      }
      uint64_t v14 = 0x6D6D75736C69616DLL;
      goto LABEL_41;
    }

    if (a3 != 0x6F6363616C69616DLL)
    {
      if (a3 != 0x7075626D6C69616DLL)
      {
        if (a3 == 0x726464616C69616DLL)
        {
          LODWORD(v89) = 0x2000000;
          __src[0] = 0LL;
          unint64_t v15 = _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(a5, a6, a6, __src, 0);
          uint64_t v16 = v15;
          char v17 = __src[0];
          if (__src[0] <= 1)
          {
            if (v15 >= 0xFF) {
              size_t v55 = 255LL;
            }
            else {
              size_t v55 = v15;
            }
            BYTE1(v89) = v55;
            uint64_t v56 = v8;
            if (a7 > 3)
            {
              size_t v57 = 4LL;
            }

            else
            {
              *uint64_t v8 = 1;
              size_t v57 = a7;
            }

            if ((*(_WORD *)(a4 + 20) & 2) == 0)
            {
              uint64_t v76 = *(unsigned int *)(a4 + 8);
              if (v57 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v76 - 1))
              {
                os_trace_blob_add_slow(a4, &v89, v57);
              }

              else
              {
                memcpy((void *)(*(void *)a4 + v76), &v89, v57);
                unsigned int v77 = *(_DWORD *)(a4 + 8) + v57;
                *(_DWORD *)(a4 + 8) = v77;
                if (!*(_BYTE *)(a4 + 22)) {
                  *(_BYTE *)(*(void *)a4 + v77) = 0;
                }
              }
            }

            if (a7 - v57 < v55)
            {
              *uint64_t v56 = 1;
              size_t v55 = a7 - v57;
            }

            if ((*(_WORD *)(a4 + 20) & 2) == 0)
            {
              uint64_t v78 = *(unsigned int *)(a4 + 8);
              if (v55 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v78 - 1))
              {
                os_trace_blob_add_slow(a4, a5, v55);
              }

              else
              {
                memcpy((void *)(*(void *)a4 + v78), a5, v55);
                unsigned int v79 = *(_DWORD *)(a4 + 8) + v55;
                *(_DWORD *)(a4 + 8) = v79;
                if (!*(_BYTE *)(a4 + 22)) {
                  *(_BYTE *)(*(void *)a4 + v79) = 0;
                }
              }
            }

            LOWORD(a7) = v55 + v57;
          }

          else
          {
            char v18 = v8;
            if (__src[0] >= 0xFF) {
              char v17 = -1;
            }
            BYTE1(v89) = v17;
            unint64_t v19 = _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(a5, v15, 1uLL, __src, 64);
            if (v19 >= 0xFF) {
              size_t v20 = 255LL;
            }
            else {
              size_t v20 = v19;
            }
            BYTE2(v89) = v20;
            uint64_t v21 = strnstr(&a5[v19], "@", v16 - v19);
            if (v21) {
              __int128 v22 = v21;
            }
            else {
              __int128 v22 = &a5[v16];
            }
            size_t v23 = _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(v22, &a5[v16] - v22, 2uLL, __src, 0);
            _os_log_mask_create_device_digest((uint64_t)a5, v16, (uint64_t)__src);
            LOBYTE(v89) = 2;
            if (a7 > 3)
            {
              size_t v24 = 4LL;
            }

            else
            {
              *char v18 = 1;
              size_t v24 = a7;
            }

            if ((*(_WORD *)(a4 + 20) & 2) == 0)
            {
              uint64_t v73 = *(unsigned int *)(a4 + 8);
              if (v24 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v73 - 1))
              {
                os_trace_blob_add_slow(a4, &v89, v24);
              }

              else
              {
                memcpy((void *)(*(void *)a4 + v73), &v89, v24);
                unsigned int v74 = *(_DWORD *)(a4 + 8) + v24;
                *(_DWORD *)(a4 + 8) = v74;
                if (!*(_BYTE *)(a4 + 22)) {
                  *(_BYTE *)(*(void *)a4 + v74) = 0;
                }
              }
            }

            size_t v75 = a7 - v24;
            if (a7 - v24 > 1) {
              size_t v75 = 2LL;
            }
            else {
              *char v18 = 1;
            }
            if ((*(_WORD *)(a4 + 20) & 2) == 0)
            {
              uint64_t v80 = *(unsigned int *)(a4 + 8);
              if (v75 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v80 - 1))
              {
                os_trace_blob_add_slow(a4, __src, v75);
              }

              else
              {
                memcpy((void *)(*(void *)a4 + v80), __src, v75);
                unsigned int v81 = *(_DWORD *)(a4 + 8) + v75;
                *(_DWORD *)(a4 + 8) = v81;
                if (!*(_BYTE *)(a4 + 22)) {
                  *(_BYTE *)(*(void *)a4 + v81) = 0;
                }
              }
            }

            size_t v82 = v75 + v24;
            if (a7 - v82 < v20)
            {
              *char v18 = 1;
              size_t v20 = a7 - v82;
            }

            if ((*(_WORD *)(a4 + 20) & 2) == 0)
            {
              uint64_t v83 = *(unsigned int *)(a4 + 8);
              if (v20 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v83 - 1))
              {
                os_trace_blob_add_slow(a4, a5, v20);
              }

              else
              {
                memcpy((void *)(*(void *)a4 + v83), a5, v20);
                unsigned int v84 = *(_DWORD *)(a4 + 8) + v20;
                *(_DWORD *)(a4 + 8) = v84;
                if (!*(_BYTE *)(a4 + 22)) {
                  *(_BYTE *)(*(void *)a4 + v84) = 0;
                }
              }
            }

            if (v23 > a7 - (v20 + v82))
            {
              *char v18 = 1;
              size_t v23 = a7 - (v20 + v82);
            }

            if ((*(_WORD *)(a4 + 20) & 2) == 0)
            {
              uint64_t v85 = *(unsigned int *)(a4 + 8);
              if (v23 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v85 - 1))
              {
                os_trace_blob_add_slow(a4, v22, v23);
              }

              else
              {
                memcpy((void *)(*(void *)a4 + v85), v22, v23);
                unsigned int v86 = *(_DWORD *)(a4 + 8) + v23;
                *(_DWORD *)(a4 + 8) = v86;
                if (!*(_BYTE *)(a4 + 22)) {
                  *(_BYTE *)(*(void *)a4 + v86) = 0;
                }
              }
            }

            LOWORD(a7) = v23 + v20 + v82;
          }

          return (unsigned __int16)a7;
        }

        goto LABEL_213;
      }

          HIWORD(v30) = HIWORD(scalar);
          return os_trace_blob_addf(a1, v12, v14, v15, v16, v17, v18, v19, v31);
        }
      }

      else
      {
        if ((v24 & 0x80000000) != 0) {
          uint64_t result = __maskrune(v12[v23], 0x8000uLL);
        }
        else {
          uint64_t result = *(_DWORD *)(MEMORY[0x1895FED88] + 4LL * v24 + 60) & 0x8000;
        }
        if ((_DWORD)result)
        {
          v12[v21] = 108;
          uint64_t result = __tolower(v24);
          LOBYTE(v24) = result;
          __int128 v22 = v21 + 1;
          uint64_t v29 = 2;
        }

        else
        {
          v12[v21 - 2] = 108;
          uint64_t v29 = 1;
        }

        v12[v23] = 108;
        v12[v22] = v24;
        v12[v29 + (unint64_t)v21] = 0;
LABEL_34:
        if (v10 != 2)
        {
          if (v10 != 1)
          {
            if (v10) {
              return result;
            }
            return os_trace_blob_addf(a1, v12, v14, v15, v16, v17, v18, v19, scalar);
          }

          goto LABEL_38;
        }
      }

      return os_trace_blob_addf(a1, v12, v14, v15, v16, v17, v18, v19, v31);
    case 0xB:
    case 0xC:
    case 0xE:
    case 0xF:
      goto LABEL_34;
    default:
      return result;
  }

LABEL_154:
          size_t v70 = a5 - v61 + v32;
          if (v70 > a7 - v65)
          {
            *BOOL v58 = 1;
            size_t v70 = a7 - v65;
          }

          if ((*(_WORD *)(a4 + 20) & 2) == 0)
          {
            uint64_t v71 = *(unsigned int *)(a4 + 8);
            if (v70 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v71 - 1))
            {
              os_trace_blob_add_slow(a4, v61, v70);
            }

            else
            {
              memcpy((void *)(*(void *)a4 + v71), v61, v70);
              unsigned int v72 = *(_DWORD *)(a4 + 8) + v70;
              *(_DWORD *)(a4 + 8) = v72;
              if (!*(_BYTE *)(a4 + 22)) {
                *(_BYTE *)(*(void *)a4 + v72) = 0;
              }
            }
          }

          LOWORD(a7) = v70 + v65;
          return (unsigned __int16)a7;
        }
      }

      else
      {
        BOOL v58 = v8;
      }

      size_t v63 = 0LL;
      char v62 = 1;
      unint64_t v61 = a5;
      goto LABEL_139;
    }
  }

LABEL_42:
  int v88 = 0;
  __src[0] = 0LL;
  unint64_t v26 = _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(a5, a6, a6, __src, 0);
  unint64_t v27 = __src[0];
  if (a3 > 0x6D6D75736C69616CLL)
  {
    if (a3 > 0x7075626D6C69616CLL)
    {
      if (a3 == 0x7075626D6C69616DLL)
      {
        unint64_t v28 = 0LL;
        goto LABEL_79;
      }

      if (a3 == 0x726464616C69616DLL)
      {
        unint64_t v28 = 1LL;
        goto LABEL_79;
      }

      goto LABEL_214;
    }

    if (a3 != 0x6D6D75736C69616DLL)
    {
      if (a3 != 0x6F6363616C69616DLL) {
        goto LABEL_214;
      }
LABEL_50:
      unint64_t v28 = 2LL;
      goto LABEL_79;
    }

LABEL_65:
    unint64_t v28 = 3LL;
    goto LABEL_79;
  }

  if (a3 > 0x656D616E6C69616CLL)
  {
    if (a3 != 0x656D616E6C69616DLL && a3 != 0x6A6275736C69616DLL) {
      goto LABEL_214;
    }
    goto LABEL_65;
  }

  if (a3 == 0x786F626C69616DLL) {
    goto LABEL_50;
  }
  if (a3 == 0x617474616C69616DLL)
  {
    unint64_t v28 = 5LL;
LABEL_79:
    char v38 = -1;
    if (__src[0] < 0xFF) {
      char v38 = __src[0];
    }
    BYTE1(v88) = v38;
    if (__src[0] <= v28)
    {
      unsigned int v39 = 0;
    }

    else
    {
      _os_log_mask_create_device_digest((uint64_t)a5, v26, (uint64_t)__src);
      unsigned int v39 = 2;
    }

    LOBYTE(v88) = v39;
    if (a7 > 3)
    {
      size_t v40 = 4LL;
    }

    else
    {
      *uint64_t v8 = 1;
      size_t v40 = a7;
    }

    if ((*(_WORD *)(a4 + 20) & 2) == 0)
    {
      uint64_t v41 = *(unsigned int *)(a4 + 8);
      if (v40 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v41 - 1))
      {
        os_trace_blob_add_slow(a4, &v88, v40);
      }

      else
      {
        memcpy((void *)(*(void *)a4 + v41), &v88, v40);
        unsigned int v42 = *(_DWORD *)(a4 + 8) + v40;
        *(_DWORD *)(a4 + 8) = v42;
        if (!*(_BYTE *)(a4 + 22)) {
          *(_BYTE *)(*(void *)a4 + v42) = 0;
        }
      }
    }

    if (v27 > v28)
    {
      size_t v43 = a7 - v40;
      if (a7 - v40 >= v39) {
        size_t v43 = v39;
      }
      else {
        *uint64_t v8 = 1;
      }
      if ((*(_WORD *)(a4 + 20) & 2) == 0)
      {
        uint64_t v44 = *(unsigned int *)(a4 + 8);
        if (v43 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v44 - 1))
        {
          os_trace_blob_add_slow(a4, __src, v43);
        }

        else
        {
          memcpy((void *)(*(void *)a4 + v44), __src, v43);
          unsigned int v45 = *(_DWORD *)(a4 + 8) + v43;
          *(_DWORD *)(a4 + 8) = v45;
          if (!*(_BYTE *)(a4 + 22)) {
            *(_BYTE *)(*(void *)a4 + v45) = 0;
          }
        }
      }

      v40 += v43;
    }

    if (a3 == 0x6A6275736C69616DLL)
    {
      int v46 = a5;
      v87 = v8;
      if (v26 >= 4)
      {
        int v46 = a5;
        for (unint64_t i = v26; i > 3; i += v48)
        {
          if (!strncmp(v46, "Re: ", 4uLL))
          {
            uint64_t v48 = -4LL;
            uint64_t v49 = 4LL;
          }

          else
          {
            if (i < 5 || strncmp(v46, "Fwd: ", 5uLL)) {
              break;
            }
            uint64_t v48 = -5LL;
            uint64_t v49 = 5LL;
          }

          v46 += v49;
        }
      }

      unsigned __int8 v50 = _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(v46, v26 - (v46 - a5), v28, &v89, 0)
          + (_BYTE)v46
          - (_BYTE)a5;
      uint64_t v8 = v87;
    }

    else
    {
      unsigned __int8 v50 = _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(a5, v26, v28, &v89, 0);
    }

    if (v50 >= v26) {
      size_t v51 = v26;
    }
    else {
      size_t v51 = v50;
    }
    if (v51 > a7 - v40)
    {
      *uint64_t v8 = 1;
      size_t v51 = a7 - v40;
    }

    if ((*(_WORD *)(a4 + 20) & 2) == 0)
    {
      uint64_t v52 = *(unsigned int *)(a4 + 8);
      if (v51 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v52 - 1))
      {
        os_trace_blob_add_slow(a4, a5, v51);
      }

      else
      {
        memcpy((void *)(*(void *)a4 + v52), a5, v51);
        unsigned int v53 = *(_DWORD *)(a4 + 8) + v51;
        *(_DWORD *)(a4 + 8) = v53;
        if (!*(_BYTE *)(a4 + 22)) {
          *(_BYTE *)(*(void *)a4 + v53) = 0;
        }
      }
    }

    LOWORD(a7) = v51 + v40;
    return (unsigned __int16)a7;
  }

    ++v6;
LABEL_66:
    unint64_t v19 = v12;
    if (!*v6) {
      goto LABEL_76;
    }
  }

LABEL_214:
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t _os_log_mask_create_digest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v9[1] = *MEMORY[0x1895FEE08];
  uint64_t v5 = ccsha256_di();
  MEMORY[0x1895FE128]();
  __int128 v7 = (char *)v9 - v6;
  ccdigest_init();
  ccdigest_update();
  ccdigest_update();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 56))(v5, v7, a4);
  return cc_clear();
}

uint64_t _os_log_mask_create_device_digest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_18C43B758 != -1) {
    dispatch_once(&qword_18C43B758, &__block_literal_global_104);
  }
  return _os_log_mask_create_digest(a1, a2, (uint64_t)&xmmword_18C43B748 + 8, a3);
}

unint64_t _os_log_mask_bytes_size_for_unicode_codepoint_count_stop( _BYTE *a1, unint64_t a2, unint64_t a3, unint64_t *a4, int a5)
{
  unint64_t v5 = 0LL;
  if (a2)
  {
    unint64_t result = 0LL;
    if (a3)
    {
      unint64_t result = 0LL;
      unint64_t v5 = 0LL;
      while (1)
      {
        int v8 = *a1;
        if (!*a1 || v8 == a5) {
          break;
        }
        if ((v8 & 0x80) != 0)
        {
          if ((v8 & 0xF8) == 0xF0)
          {
            uint64_t v10 = 4LL;
          }

          else if ((v8 & 0xF0) == 0xE0)
          {
            uint64_t v10 = 3LL;
          }

          else
          {
            if ((v8 & 0xE0) != 0xC0) {
              break;
            }
            uint64_t v10 = 2LL;
          }

          if (v10 + result <= a2)
          {
            uint64_t v11 = 1LL;
            while ((a1[v11] & 0xC0) == 0x80)
            {
              if (v10 == ++v11)
              {
                result += v10;
                goto LABEL_22;
              }
            }
          }

          break;
        }

        if (result < a2)
        {
          ++result;
          uint64_t v10 = 1LL;
LABEL_22:
          ++v5;
          if (result < a2)
          {
            a1 += v10;
            if (v5 < a3) {
              continue;
            }
          }
        }

        break;
      }
    }
  }

  else
  {
    unint64_t result = 0LL;
  }

  *a4 = v5;
  return result;
}

void ___os_log_mask_create_device_digest_block_invoke()
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "operation", 5uLL);
  int v1 = (void *)_os_trace_logd_send_with_reply();
  if (!v1)
  {
    xpc_release(empty);
LABEL_5:
    uint64_t uint64 = xmmword_18C43B748;
    goto LABEL_6;
  }

  BOOL v2 = v1;
  uint64_t uint64 = xpc_dictionary_get_uint64(v1, "device_salt");
  xpc_release(v2);
  xpc_release(empty);
LABEL_6:
  *((void *)&xmmword_18C43B748 + 1) = uint64;
}

void *os_trace_blob_detach(uint64_t a1, void *a2)
{
  __int16 v2 = *(_WORD *)(a1 + 20);
  unsigned int v3 = *(const void **)a1;
  *(void *)a1 = 3954044928LL;
  *(_WORD *)(a1 + 20) = 0;
  if (a2) {
    *a2 = *(unsigned int *)(a1 + 8);
  }
  if ((v2 & 1) == 0)
  {
    unsigned int v4 = *(_DWORD *)(a1 + 8);
    if (*(_BYTE *)(a1 + 22)) {
      size_t v5 = v4;
    }
    else {
      size_t v5 = v4 + 1;
    }
    while (1)
    {
      uint64_t v6 = malloc(v5);
      if (v6) {
        break;
      }
      _os_trace_temporary_resource_shortage();
    }

    __int128 v7 = v6;
    memcpy(v6, v3, v5);
    return v7;
  }

  return (void *)v3;
}

uint64_t os_trace_blob_grow(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(_DWORD *)(a1 + 8);
  if (*(_BYTE *)(a1 + 22)) {
    size_t v4 = v3;
  }
  else {
    size_t v4 = v3 + 1;
  }
  size_t v5 = v4 + a2;
  if (__CFADD__(v4, a2) || HIDWORD(v5))
  {
    unsigned int v6 = *(_DWORD *)(a1 + 12);
    unsigned int v7 = *(_DWORD *)(a1 + 16);
  }

  else
  {
    unsigned int v6 = *(_DWORD *)(a1 + 12);
    if ((v6 & 0x80000000) != 0)
    {
      unsigned int v7 = *(_DWORD *)(a1 + 16);
    }

    else
    {
      else {
        unsigned int v7 = *(_DWORD *)(a1 + 16);
      }
    }
  }

  if (v7 > v6)
  {
    int v8 = *(void **)a1;
    if ((*(_WORD *)(a1 + 20) & 1) != 0)
    {
      while (1)
      {
        uint64_t v10 = realloc(v8, v7);
        if (v10) {
          break;
        }
        _os_trace_temporary_resource_shortage();
      }

      *(void *)a1 = v10;
    }

    else
    {
      while (1)
      {
        int v9 = malloc(v7);
        if (v9) {
          break;
        }
        _os_trace_temporary_resource_shortage();
      }

      *(void *)a1 = v9;
      memcpy(v9, v8, v4);
      *(_WORD *)(a1 + 20) |= 1u;
    }

    *(_DWORD *)(a1 + 12) = v7;
  }

  return v7 - v4;
}

size_t os_trace_blob_add_slow(uint64_t a1, void *__src, size_t __n)
{
  if ((*(_WORD *)(a1 + 20) & 2) != 0) {
    return 0LL;
  }
  size_t v3 = __n;
  unsigned int v6 = *(_DWORD *)(a1 + 12);
  size_t v7 = *(char *)(a1 + 22) + v6 - *(_DWORD *)(a1 + 8) - 1;
  if (v7 < __n)
  {
    if (v6 < *(_DWORD *)(a1 + 16)) {
      size_t v7 = os_trace_blob_grow(a1, __n);
    }
    if (v7 < v3)
    {
      *(_WORD *)(a1 + 20) |= 2u;
      size_t v3 = v7;
    }
  }

  memcpy((void *)(*(void *)a1 + *(unsigned int *)(a1 + 8)), __src, v3);
  unsigned int v8 = *(_DWORD *)(a1 + 8) + v3;
  *(_DWORD *)(a1 + 8) = v8;
  if (!*(_BYTE *)(a1 + 22)) {
    *(_BYTE *)(*(void *)a1 + v8) = 0;
  }
  return v3;
}

unint64_t os_trace_blob_addns(uint64_t a1, _BYTE *__src, unint64_t a3, void *a4)
{
  if ((*(_WORD *)(a1 + 20) & 2) != 0) {
    return 0LL;
  }
  unint64_t v5 = a3;
  unsigned int v6 = __src;
  int v8 = *(_DWORD *)(a1 + 8);
  if (!*(_BYTE *)(a1 + 22)) {
    ++v8;
  }
  int v9 = *(_DWORD *)(a1 + 16);
  if (v9)
  {
    unint64_t v10 = (v9 - v8);
  }

  else
  {
    int v11 = *(_DWORD *)(a1 + 12);
    LODWORD(v10) = v11 - v8;
    if (v11) {
      unint64_t v10 = v10;
    }
    else {
      unint64_t v10 = 0LL;
    }
  }

  if (v10 < a3) {
    unint64_t v5 = v10;
  }
  if (!*__src)
  {
    unint64_t v19 = 0LL;
LABEL_76:
    if (a4) {
      goto LABEL_77;
    }
    return v19;
  }

  unint64_t v12 = 0LL;
  uint64_t v13 = MEMORY[0x1895FED88];
  while (1)
  {
    size_t v14 = 0LL;
    size_t v15 = v5 - v12;
    if (v5 != v12)
    {
      while ((char)v6[v14] >= 1 && (*(_DWORD *)(v13 + 4LL * v6[v14] + 60) & 0x4200) != 0x200)
      {
        if (v15 == ++v14)
        {
          size_t v14 = v5 - v12;
          break;
        }
      }
    }

    if (v14 >= v15) {
      size_t v16 = v5 - v12;
    }
    else {
      size_t v16 = v14;
    }
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      uint64_t v17 = *(unsigned int *)(a1 + 8);
      if (v16 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v17 - 1))
      {
        os_trace_blob_add_slow(a1, v6, v16);
      }

      else
      {
        memcpy((void *)(*(void *)a1 + v17), v6, v16);
        unsigned int v18 = *(_DWORD *)(a1 + 8) + v16;
        *(_DWORD *)(a1 + 8) = v18;
        if (!*(_BYTE *)(a1 + 22)) {
          *(_BYTE *)(*(void *)a1 + v18) = 0;
        }
      }
    }

    v6 += v16;
    unint64_t v19 = v16 + v12;
    if (v5 == v19) {
      break;
    }
    int v20 = *v6;
    if (!*v6) {
      goto LABEL_76;
    }
    if ((v20 & 0x80) == 0)
    {
      unint64_t v12 = v19 + 3;
      if (v19 + 3 > v5) {
        goto LABEL_76;
      }
      if (v20 == 127) {
        char v21 = 63;
      }
      else {
        char v21 = v20 + 64;
      }
      __int16 v40 = 24156;
      char v41 = v21;
      if ((*(_BYTE *)(a1 + 20) & 2) != 0) {
        goto LABEL_65;
      }
      uint64_t v22 = *(unsigned int *)(a1 + 8);
      if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v22 - 1) <= 2)
      {
        p_srca = &v40;
        uint64_t v35 = a1;
        size_t v36 = 3LL;
        goto LABEL_74;
      }

      uint64_t v23 = *(void *)a1 + v22;
      *(_WORD *)uint64_t v23 = v40;
      *(_BYTE *)(v23 + 2) = v41;
      unsigned int v24 = *(_DWORD *)(a1 + 8) + 3;
      goto LABEL_63;
    }

    if ((v20 & 0xF8) == 0xF0)
    {
      size_t v25 = 4LL;
    }

    else if ((v20 & 0xF0) == 0xE0)
    {
      size_t v25 = 3LL;
    }

    else
    {
      if ((v20 & 0xE0) != 0xC0) {
        goto LABEL_51;
      }
      size_t v25 = 2LL;
    }

    if (v25 > v5 - v19) {
      goto LABEL_76;
    }
    uint64_t v26 = 1LL;
    while ((v6[v26] & 0xC0) == 0x80)
    {
      if (v25 == ++v26)
      {
        if ((*(_WORD *)(a1 + 20) & 2) == 0)
        {
          uint64_t v27 = *(unsigned int *)(a1 + 8);
          if (v25 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v27 - 1))
          {
            os_trace_blob_add_slow(a1, v6, v25);
          }

          else
          {
            memcpy((void *)(*(void *)a1 + v27), v6, v25);
            unsigned int v28 = *(_DWORD *)(a1 + 8) + v25;
            *(_DWORD *)(a1 + 8) = v28;
            if (!*(_BYTE *)(a1 + 22)) {
              *(_BYTE *)(*(void *)a1 + v28) = 0;
            }
          }
        }

        v6 += v25;
        unint64_t v12 = v25 + v19;
        if (v12 != v5) {
          goto LABEL_66;
        }
        goto LABEL_79;
      }
    }

LABEL_51:
    unint64_t v12 = v19 + 4;
    if (v19 + 4 > v5) {
      goto LABEL_76;
    }
    uint64_t v29 = v20 & 0x7F;
    if ((*(_DWORD *)(v13 + 4 * v29 + 60) & 0x200) == 0)
    {
      qmemcpy(&v38, "\\M-", 3);
      HIBYTE(v38) = v29;
      if ((*(_BYTE *)(a1 + 20) & 2) != 0) {
        goto LABEL_65;
      }
      uint64_t v30 = *(unsigned int *)(a1 + 8);
      if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v30 - 1) <= 3)
      {
        p_srca = (__int16 *)&v38;
        goto LABEL_73;
      }

      uint64_t v31 = *(void *)a1;
      int v32 = v38;
      goto LABEL_62;
    }

    if ((_DWORD)v29 == 127) {
      char v33 = 63;
    }
    else {
      char v33 = v29 + 64;
    }
    qmemcpy(&__srca, "\\M^", 3);
    HIBYTE(__srca) = v33;
    if ((*(_BYTE *)(a1 + 20) & 2) == 0)
    {
      uint64_t v30 = *(unsigned int *)(a1 + 8);
      if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v30 - 1) <= 3)
      {
        p_srca = (__int16 *)&__srca;
LABEL_73:
        uint64_t v35 = a1;
        size_t v36 = 4LL;
LABEL_74:
        os_trace_blob_add_slow(v35, p_srca, v36);
        goto LABEL_65;
      }

      uint64_t v31 = *(void *)a1;
      int v32 = __srca;
LABEL_62:
      *(_DWORD *)(v31 + v30) = v32;
      unsigned int v24 = *(_DWORD *)(a1 + 8) + 4;
LABEL_63:
      *(_DWORD *)(a1 + 8) = v24;
      if (!*(_BYTE *)(a1 + 22)) {
        *(_BYTE *)(*(void *)a1 + v24) = 0;
      }
    }

LABEL_79:
  unint64_t v19 = v5;
  if (!a4) {
    return v19;
  }
LABEL_77:
  *a4 = v6;
  return v19;
}

uint64_t os_trace_blob_vaddf(uint64_t a1, const char *a2, int a3, va_list a4)
{
  if (*(_BYTE *)(a1 + 22))
  {
    qword_18C50A768 = (uint64_t)"BUG IN LIBTRACE: Can't use addf() in binary blobs";
    __break(1u);
    return 0LL;
  }

  if ((*(_WORD *)(a1 + 20) & 2) != 0) {
    return 0LL;
  }
  int v8 = *(_DWORD *)(a1 + 8);
  int v7 = *(_DWORD *)(a1 + 12);
  *__error() = a3;
  uint64_t v9 = vsnprintf((char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)), (v7 - v8), a2, a4);
  if ((v9 & 0x80000000) != 0)
  {
    uint64_t v10 = 0LL;
    *(_BYTE *)(*(void *)a1 + *(unsigned int *)(a1 + 8)) = 0;
  }

  else
  {
    uint64_t v10 = v9;
    uint64_t v11 = (v7 + ~v8);
    if (v9 > v11)
    {
      if (*(_DWORD *)(a1 + 12) < *(_DWORD *)(a1 + 16))
      {
        uint64_t v11 = os_trace_blob_grow(a1, v9);
        *__error() = a3;
        vsnprintf((char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)), (v11 + 1), a2, a4);
      }

      if (v10 > v11)
      {
        *(_WORD *)(a1 + 20) |= 2u;
        uint64_t v10 = v11;
      }
    }

    *(_DWORD *)(a1 + 8) += v10;
  }

  return v10;
}

uint64_t os_trace_blob_addf( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return os_trace_blob_vaddf(a1, a2, 0, &a9);
}

tm *os_trace_blob_add_localtime(tm *result, time_t a2, char a3, unsigned int a4)
{
  time_t v20 = a2;
  if (BYTE2(result->tm_year))
  {
    qword_18C50A768 = (uint64_t)"BUG IN LIBTRACE: Can't use addf() in binary blobs";
    __break(1u);
  }

  else
  {
    uint64_t v4 = (uint64_t)result;
    if ((result->tm_year & 2) == 0)
    {
      unint64_t result = localtime_r(&v20, &v19);
      if (result)
      {
        os_trace_blob_addf(v4, "%04d-%02d-%02d %02d:%02d:%02d", v7, v8, v9, v10, v11, v12, LOBYTE(v19.tm_year) + 108);
        if (a4 <= 2) {
          os_trace_blob_addf(v4, off_189624730[a4], v13, v14, v15, v16, v17, v18, a3);
        }
        return (tm *)os_trace_blob_addf( v4,  "%+05ld",  v13,  v14,  v15,  v16,  v17,  v18,  (v19.tm_gmtoff / 60 % 60) + 100 * (v19.tm_gmtoff / 3600));
      }
    }
  }

  return result;
}

unint64_t os_trace_blob_add_hexdump(unint64_t result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7 = result;
  char v27 = 39;
  if ((*(_WORD *)(result + 20) & 2) == 0)
  {
    uint64_t v8 = *(unsigned int *)(result + 8);
    if (*(char *)(result + 22) + *(_DWORD *)(result + 12) - 1 == (_DWORD)v8)
    {
      unint64_t result = os_trace_blob_add_slow(result, &v27, 1uLL);
      if (!a3) {
        goto LABEL_27;
      }
      goto LABEL_6;
    }

    *(_BYTE *)(*(void *)result + v8) = 39;
    unsigned int v9 = *(_DWORD *)(result + 8) + 1;
    *(_DWORD *)(result + 8) = v9;
    if (!*(_BYTE *)(result + 22)) {
      *(_BYTE *)(*(void *)result + v9) = 0;
    }
  }

  if (!a3) {
    goto LABEL_27;
  }
LABEL_6:
  uint64_t v10 = 0LL;
  do
  {
    unint64_t v11 = *(unsigned __int8 *)(a2 + v10);
    __int16 v12 = *(_WORD *)(v7 + 20);
    if (v10)
    {
      char v26 = 32;
      if ((v12 & 2) == 0)
      {
        uint64_t v13 = *(unsigned int *)(v7 + 8);
        if (*(char *)(v7 + 22) + *(_DWORD *)(v7 + 12) - 1 == (_DWORD)v13)
        {
          unint64_t result = os_trace_blob_add_slow(v7, &v26, 1uLL);
        }

        else
        {
          *(_BYTE *)(*(void *)v7 + v13) = 32;
          unsigned int v14 = *(_DWORD *)(v7 + 8) + 1;
          *(_DWORD *)(v7 + 8) = v14;
          if (!*(_BYTE *)(v7 + 22)) {
            *(_BYTE *)(*(void *)v7 + v14) = 0;
          }
        }
      }

      __int16 v12 = *(_WORD *)(v7 + 20);
    }

    char v15 = a0123456789abcd[v11 >> 4];
    char __src = v15;
    if ((v12 & 2) == 0)
    {
      uint64_t v16 = *(unsigned int *)(v7 + 8);
      if (*(char *)(v7 + 22) + *(_DWORD *)(v7 + 12) - 1 == (_DWORD)v16)
      {
        unint64_t result = os_trace_blob_add_slow(v7, &__src, 1uLL);
      }

      else
      {
        *(_BYTE *)(*(void *)v7 + v16) = v15;
        unsigned int v17 = *(_DWORD *)(v7 + 8) + 1;
        *(_DWORD *)(v7 + 8) = v17;
        if (!*(_BYTE *)(v7 + 22)) {
          *(_BYTE *)(*(void *)v7 + v17) = 0;
        }
      }
    }

    char v18 = a0123456789abcd[v11 & 0xF];
    char v24 = v18;
    if ((*(_WORD *)(v7 + 20) & 2) == 0)
    {
      uint64_t v19 = *(unsigned int *)(v7 + 8);
      if (*(char *)(v7 + 22) + *(_DWORD *)(v7 + 12) - 1 == (_DWORD)v19)
      {
        unint64_t result = os_trace_blob_add_slow(v7, &v24, 1uLL);
      }

      else
      {
        *(_BYTE *)(*(void *)v7 + v19) = v18;
        unsigned int v20 = *(_DWORD *)(v7 + 8) + 1;
        *(_DWORD *)(v7 + 8) = v20;
        if (!*(_BYTE *)(v7 + 22)) {
          *(_BYTE *)(*(void *)v7 + v20) = 0;
        }
      }
    }

    ++v10;
  }

  while (a3 != v10);
LABEL_27:
  if ((a4 & 1) != 0) {
    return os_trace_blob_addns(v7, "…'", 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }
  char v23 = 39;
  if ((*(_WORD *)(v7 + 20) & 2) == 0)
  {
    uint64_t v21 = *(unsigned int *)(v7 + 8);
    if (*(char *)(v7 + 22) + *(_DWORD *)(v7 + 12) - 1 == (_DWORD)v21)
    {
      return os_trace_blob_add_slow(v7, &v23, 1uLL);
    }

    else
    {
      *(_BYTE *)(*(void *)v7 + v21) = 39;
      unsigned int v22 = *(_DWORD *)(v7 + 8) + 1;
      *(_DWORD *)(v7 + 8) = v22;
      if (!*(_BYTE *)(v7 + 22)) {
        *(_BYTE *)(*(void *)v7 + v22) = 0;
      }
    }
  }

  return result;
}

_WORD *os_trace_blob_pwrite(_WORD *result, unsigned int a2, __int16 a3)
{
  if (a2 <= 1)
  {
    _os_assert_log();
    unint64_t result = (_WORD *)_os_crash();
    __break(1u);
  }

  else
  {
    *unint64_t result = a3;
  }

  return result;
}

char *os_log_fmt_delimit(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  uint64_t v4 = a1 + 1;
  uint64_t v5 = v6;
  if (v6 != 37)
  {
    qword_18C50A768 = (uint64_t)"BUG IN LIBTRACE: Should start with '%'";
    qword_18C50A798 = v5;
    __break(1u);
    JUMPOUT(0x180114784LL);
  }

  *(void *)(a3 + 56) = 0LL;
  *(_OWORD *)(a3 + 40) = 0u;
  *(_OWORD *)(a3 + 24) = 0u;
  *(_OWORD *)(a3 + 8) = 0u;
  *(void *)a3 = a1;
  if (a1[1] != 123)
  {
    unsigned int v11 = 0;
LABEL_50:
    unsigned int v24 = 0;
    while (1)
    {
      while (1)
      {
        int v26 = *v4++;
        int v25 = v26;
LABEL_52:
        do
        {
          int v27 = *v4++;
          int v25 = v27;
        }

        while ((v27 - 48) < 0xA);
        if (v25 != 36) {
          goto LABEL_52;
        }
        v11 |= 1u;
        *(_WORD *)(a3 + 8) = v11;
      }

      switch(v25)
      {
        case ' ':
        case '#':
        case '\'':
        case '+':
        case '-':
        case '0':
          continue;
        case '*':
          if ((v11 & 8) != 0)
          {
            v11 |= 1u;
            *(_WORD *)(a3 + 8) = v11;
          }

          char v33 = v4;
          do
          {
            int v35 = *v33++;
            char v34 = v35;
          }

          while ((v35 - 48) < 0xA);
          if (v34 == 36) {
            v11 |= 1u;
          }
          else {
            v11 |= (v11 >> 1) & 1 | 2;
          }
          if (v34 == 36) {
            uint64_t v4 = v33;
          }
          *(_WORD *)(a3 + 8) = v11;
          continue;
        case '.':
          int v28 = *v4++;
          int v25 = v28;
          if (v28 != 42)
          {
            *(_DWORD *)(a3 + 24) = 0;
            int v29 = v25 - 48;
            if ((v25 - 48) <= 9)
            {
              int v30 = 0;
              do
              {
                int v30 = v29 + 10 * v30;
                *(_DWORD *)(a3 + 24) = v30;
                int v31 = *v4++;
                int v25 = v31;
                int v29 = v31 - 48;
              }

              while ((v31 - 48) < 0xA);
            }

            int v32 = (v11 >> 3) & 1 | v11;
            unsigned int v11 = v32 | 8;
            *(_WORD *)(a3 + 8) = v32 | 8;
            goto LABEL_52;
          }

          size_t v36 = v4;
          do
          {
            int v38 = *v36++;
            char v37 = v38;
          }

          while ((v38 - 48) < 0xA);
          if (v37 == 36)
          {
            v11 |= 1u;
            *(_WORD *)(a3 + 8) = v11;
            uint64_t v4 = v36;
          }

          else
          {
            int v39 = v11 | ((v11 & 0xC) != 0);
            unsigned int v11 = v39 | 0xC;
            *(_WORD *)(a3 + 8) = v39 | 0xC;
          }

          break;
        case '@':
          char v41 = 18;
          goto LABEL_130;
        case 'A':
        case 'E':
        case 'F':
        case 'G':
        case 'a':
        case 'e':
        case 'f':
        case 'g':
          if ((v24 & 8) != 0) {
            char v40 = 15;
          }
          else {
            char v40 = 14;
          }
          goto LABEL_132;
        case 'C':
          LOBYTE(v24) = 16;
          goto LABEL_107;
        case 'D':
          LOWORD(v24) = v24 | 0x10;
          goto LABEL_111;
        case 'L':
          v24 |= 8u;
          continue;
        case 'O':
        case 'U':
          LOWORD(v24) = v24 | 0x10;
          goto LABEL_92;
        case 'P':
          if (a2 != 2) {
            return 0LL;
          }
          if ((v11 & 8) == 0) {
            *(_WORD *)(a3 + 8) = v11 | 1;
          }
          char v41 = 19;
          goto LABEL_130;
        case 'S':
          LOBYTE(v24) = 16;
          goto LABEL_127;
        case 'X':
        case 'o':
        case 'u':
        case 'x':
LABEL_92:
          if ((v24 & 0x1000) != 0) {
            goto LABEL_103;
          }
          if ((v24 & 0xC00) != 0) {
            goto LABEL_94;
          }
          if ((v24 & 0x20) != 0)
          {
LABEL_103:
            char v41 = 12;
          }

          else if ((v24 & 0x10) != 0)
          {
LABEL_94:
            char v41 = 10;
          }

          else
          {
            if ((v24 & 0x2000) != 0) {
              char v42 = 2;
            }
            else {
              char v42 = 6;
            }
            if ((v24 & 0x40) != 0) {
              char v41 = 4;
            }
            else {
              char v41 = v42;
            }
          }

          *(_WORD *)(a3 + 8) = v11 | 0x30;
LABEL_130:
          *(_BYTE *)(a3 + 10) = v41;
          goto LABEL_134;
        case 'c':
LABEL_107:
          if ((v24 & 0x10) != 0) {
            char v40 = 7;
          }
          else {
            char v40 = 5;
          }
          goto LABEL_132;
        case 'd':
        case 'i':
LABEL_111:
          if ((v24 & 0x1000) != 0) {
            goto LABEL_119;
          }
          if ((v24 & 0x400) != 0 || (v24 & 0x800) != 0) {
            goto LABEL_120;
          }
          if ((v24 & 0x20) != 0)
          {
LABEL_119:
            char v40 = 11;
          }

          else if ((v24 & 0x10) != 0)
          {
LABEL_120:
            char v40 = 9;
          }

          else if ((v24 & 0x40) != 0)
          {
            char v40 = 3;
          }

          else if ((v24 & 0x2000) != 0)
          {
            char v40 = 1;
          }

          else
          {
            char v40 = 5;
          }

LABEL_132:
          *(_BYTE *)(a3 + 10) = v40;
          __int16 v43 = v11 | 0x10;
LABEL_133:
          *(_WORD *)(a3 + 8) = v43;
LABEL_134:
          *(_WORD *)(a3 + 12) = (_WORD)v4 - (_WORD)a1;
          return (char *)(unsigned __int16)((_WORD)v4 - (_WORD)a1);
        case 'h':
          if ((v24 & 0x40) != 0) {
            unsigned int v24 = v24 & 0xFFFFDFBF | 0x2000;
          }
          else {
            v24 |= 0x40u;
          }
          continue;
        case 'j':
          v24 |= 0x1000u;
          continue;
        case 'l':
          if ((v24 & 0x10) != 0) {
            unsigned int v24 = v24 & 0xFFFFFFCF | 0x20;
          }
          else {
            v24 |= 0x10u;
          }
          continue;
        case 'm':
          char v40 = 8;
          goto LABEL_132;
        case 'n':
          __int16 v43 = v11 | 1;
          goto LABEL_133;
        case 'p':
          *(_BYTE *)(a3 + 10) = 13;
          __int16 v43 = v11 | 0x30;
          goto LABEL_133;
        case 'q':
          v24 |= 0x20u;
          continue;
        case 's':
LABEL_127:
          if ((v24 & 0x10) != 0) {
            char v41 = 17;
          }
          else {
            char v41 = 16;
          }
          goto LABEL_130;
        case 't':
          v24 |= 0x800u;
          continue;
        case 'z':
          v24 |= 0x400u;
          continue;
        default:
          return 0LL;
      }
    }
  }

  if (a2 != 2) {
    return 0LL;
  }
  unint64_t result = strchr(v4, 125);
  if (result)
  {
    uint64_t v10 = a1 + 2;
    if (a1[2] == 125)
    {
      unsigned int v11 = 0;
LABEL_49:
      uint64_t v4 = result + 1;
      goto LABEL_50;
    }

    uint64_t v44 = result;
    unsigned int v11 = 0;
    do
    {
      __int16 v12 = &v10[strspn(v10, ", ")];
      size_t v13 = strcspn(v12, ",}");
      switch(v13)
      {
        case 0uLL:
          unint64_t result = v44;
          goto LABEL_49;
        case 6uLL:
          if (*(_DWORD *)v12 != 1818391920 || *((_WORD *)v12 + 2) != 25449) {
            goto LABEL_26;
          }
          v11 |= 0x100u;
          goto LABEL_38;
        case 7uLL:
          if (*(_DWORD *)v12 != 1986622064 || *(_DWORD *)(v12 + 3) != 1702125942) {
            goto LABEL_26;
          }
          v11 |= 0x200u;
          goto LABEL_38;
        case 9uLL:
          if (*(void *)v12 != 0x76697469736E6573LL || v12[8] != 101) {
            goto LABEL_26;
          }
          v11 |= 0x400u;
LABEL_38:
          *(_WORD *)(a3 + 8) = v11;
          break;
        default:
LABEL_26:
          if (!memchr(v12, 61, v13))
          {
            if (!strncmp(v12, "mask.", 5uLL))
            {
              if (v13 - 6 <= 7)
              {
                uint64_t v19 = 0LL;
                uint64_t v20 = 0LL;
                v11 |= 0x800u;
                *(_WORD *)(a3 + 8) = v11;
                uint64_t v21 = (char *)(v12 + 5);
                *(void *)(a3 + 48) = v12 + 5;
                *(_WORD *)(a3 + 18) = v13 - 5;
                do
                {
                  uint64_t v22 = *v21++;
                  v20 |= v22 << v19;
                  v19 += 8LL;
                }

                while (8LL * (unsigned __int16)(v13 - 5) != v19);
                *(void *)(a3 + 56) = v20;
              }
            }

            else
            {
              int v17 = v11 | 0x40;
              *(_WORD *)(a3 + 8) = v11 | 0x40;
              if (!strncmp(v12, "builtin:", 8uLL))
              {
                v11 |= 0xC0u;
                *(_WORD *)(a3 + 8) = v11;
                *(_WORD *)(a3 + 14) = 7;
                *(void *)(a3 + 32) = "builtin";
                *(void *)(a3 + 40) = v12 + 8;
                *(_WORD *)(a3 + 16) = v13 - 8;
              }

              else
              {
                char v18 = (char *)memchr(v12, 58, v13);
                if (v18)
                {
                  if ((v11 & 0x80) != 0)
                  {
                    v17 ^= 0x80u;
                    *(_WORD *)(a3 + 8) = v17;
                  }

                  *(_WORD *)(a3 + 14) = (_WORD)v18 - (_WORD)v12;
                  *(void *)(a3 + 32) = v12;
                  *(void *)(a3 + 40) = v18 + 1;
                  *(_WORD *)(a3 + 16) = (_WORD)v12 + v13 - ((_WORD)v18 + 1);
                  unsigned int v11 = v17;
                }

                else
                {
                  v11 |= 0xC0u;
                  *(_WORD *)(a3 + 8) = v11;
                  *(_WORD *)(a3 + 14) = 7;
                  *(void *)(a3 + 32) = "builtin";
                  *(void *)(a3 + 40) = v12;
                  *(_WORD *)(a3 + 16) = v13;
                }
              }
            }
          }

          break;
      }

      uint64_t v10 = &v12[v13];
    }

    while (*v10 != 125);
    if ((v11 & 0x400) != 0)
    {
      int v23 = 64767;
      unint64_t result = v44;
    }

    else
    {
      unint64_t result = v44;
      if ((v11 & 0x200) == 0) {
        goto LABEL_49;
      }
      int v23 = 65279;
    }

    v11 &= v23;
    *(_WORD *)(a3 + 8) = v11;
    goto LABEL_49;
  }

  return result;
}

_WORD *os_log_fmt_encode(const char *a1, uint64_t a2, _WORD *a3, _WORD *a4, _DWORD *a5)
{
  uint64_t v6 = a3;
  unsigned int v69 = a5;
  BOOL v58 = a3;
  uint64_t v59 = 0x36200000000LL;
  int v60 = 0;
  __int16 v61 = 0;
  char v62 = 1;
  if (strnlen(a1, 0x801uLL) >= 0x801)
  {
LABEL_2:
    if (a4) {
      *a4 = 0;
    }
    if ((v61 & 1) == 0) {
      return 0LL;
    }
    qword_18C50A768 = (uint64_t)"BUG IN LIBTRACE: Buffer needs free";
    __break(1u);
LABEL_131:
    qword_18C50A768 = (uint64_t)"BUG IN LIBTRACE: Buffer needs free";
    __break(1u);
LABEL_132:
    qword_18C50A768 = (uint64_t)"BUG IN LIBTRACE: Unexpected type";
    qword_18C50A798 = 0LL;
    __break(1u);
    JUMPOUT(0x180115148LL);
  }

  *uint64_t v6 = 0;
  LODWORD(v59) = 2;
  unsigned int v9 = strchr(a1, 37);
  if (!v9)
  {
    __int16 v55 = 0;
    goto LABEL_126;
  }

  uint64_t v10 = v9;
  __int16 v11 = 0;
  int v12 = 0;
  int v13 = 0;
  while (1)
  {
    unsigned int v14 = os_log_fmt_delimit(v10, a2, (uint64_t)v64);
    if (!v14)
    {
      if (!v10[1]) {
        goto LABEL_125;
      }
      int v26 = v10 + 2;
      goto LABEL_105;
    }

    unsigned int v15 = v65;
    if ((v65 & 1) != 0) {
      goto LABEL_2;
    }
    uint64_t v16 = v14;
    if ((v65 & 0x800) != 0) {
      break;
    }
LABEL_22:
    if ((v15 & 2) == 0) {
      goto LABEL_33;
    }
    unsigned __int16 __src = 1024;
    uint64_t v21 = v69;
    v69 += 2;
    LODWORD(v57) = *v21;
    if ((v61 & 2) == 0)
    {
      if ((v62 + HIDWORD(v59) - v59 - 1) > 1)
      {
        unsigned int v22 = __src;
        *(_WORD *)((char *)v58 + v59) = __src;
        unsigned int v23 = v59 + 2;
        LODWORD(v59) = v59 + 2;
        size_t v24 = v22 >> 8;
        if (!v62) {
          *((_BYTE *)v58 + v23) = 0;
        }
        goto LABEL_27;
      }

      os_trace_blob_add_slow((uint64_t)&v58, &__src, 2uLL);
    }

    size_t v24 = 4LL;
LABEL_27:
    if ((v61 & 2) == 0)
    {
      if (v62 + HIDWORD(v59) - (int)v59 - 1 < v24)
      {
        os_trace_blob_add_slow((uint64_t)&v58, &v57, v24);
      }

      else
      {
        memcpy((char *)v58 + v59, &v57, v24);
        unsigned int v25 = v59 + v24;
        LODWORD(v59) = v59 + v24;
        if (!v62) {
          *((_BYTE *)v58 + v25) = 0;
        }
      }
    }

    unsigned int v15 = v65;
LABEL_33:
    if ((v15 & 4) != 0)
    {
      int v27 = v69;
      v69 += 2;
      v67[0] = *v27;
      if ((v15 & 8) == 0) {
        goto LABEL_38;
      }
    }

    else
    {
      if ((v15 & 0x10) != 0 || v66 == 18)
      {
        v15 &= ~8u;
        unsigned __int16 v65 = v15;
      }

      if ((v15 & 8) == 0)
      {
LABEL_38:
        if ((v15 & 0x10) != 0) {
          goto LABEL_65;
        }
        goto LABEL_39;
      }
    }

    if ((v15 & 0x10) != 0 || v66 == 18)
    {
      LOBYTE(__src) = 0;
    }

    else
    {
      if ((v15 & 4) != 0)
      {
        char v29 = 16;
      }

      else
      {
        if ((v15 & 0x400) != 0)
        {
          LOBYTE(v28) = 5;
        }

        else if ((v15 & 0x200) != 0)
        {
          LOBYTE(v28) = 1;
        }

        else
        {
          int v28 = (v15 >> 7) & 2;
        }

        char v29 = v28 | 0x10;
      }

      LOBYTE(__src) = v29;
    }

    HIBYTE(__src) = 4;
    if ((v61 & 2) != 0) {
      goto LABEL_118;
    }
    if ((v62 + HIDWORD(v59) - v59 - 1) <= 1)
    {
      os_trace_blob_add_slow((uint64_t)&v58, &__src, 2uLL);
LABEL_118:
      size_t v32 = 4LL;
      goto LABEL_59;
    }

    unsigned int v30 = __src;
    *(_WORD *)((char *)v58 + v59) = __src;
    unsigned int v31 = v59 + 2;
    LODWORD(v59) = v59 + 2;
    size_t v32 = v30 >> 8;
    if (!v62) {
      *((_BYTE *)v58 + v31) = 0;
    }
LABEL_59:
    if ((v61 & 2) == 0)
    {
      if (v62 + HIDWORD(v59) - (int)v59 - 1 < v32)
      {
        os_trace_blob_add_slow((uint64_t)&v58, v67, v32);
      }

      else
      {
        memcpy((char *)v58 + v59, v67, v32);
        unsigned int v33 = v59 + v32;
        LODWORD(v59) = v59 + v32;
        if (!v62) {
          *((_BYTE *)v58 + v33) = 0;
        }
      }
    }

    unsigned int v15 = v65;
    if ((v65 & 0x10) != 0)
    {
LABEL_65:
      LOBYTE(__src) = __src & 0xF;
      goto LABEL_66;
    }

LABEL_39:
    v12 |= 2u;
LABEL_66:
    v12 |= (v15 & 0x600) != 0;
    int v34 = (v15 >> 7) & 2;
    if ((v15 & 0x200) != 0) {
      LOBYTE(v34) = 1;
    }
    if ((v15 & 0x400) != 0) {
      unsigned __int8 v35 = 5;
    }
    else {
      unsigned __int8 v35 = v34;
    }
    LOBYTE(__src) = __src & 0xF0 | v35;
    switch(v66)
    {
      case 0:
        goto LABEL_132;
      case 1:
        int v39 = (char *)v69;
        v69 += 2;
        int v37 = *v39;
        goto LABEL_78;
      case 2:
        char v40 = (unsigned __int8 *)v69;
        v69 += 2;
        int v37 = *v40;
        goto LABEL_78;
      case 3:
        char v41 = (__int16 *)v69;
        v69 += 2;
        int v37 = *v41;
        goto LABEL_78;
      case 4:
        char v42 = (unsigned __int16 *)v69;
        v69 += 2;
        int v37 = *v42;
        goto LABEL_78;
      case 5:
      case 6:
      case 7:
        size_t v36 = v69;
        v69 += 2;
        int v37 = *v36;
LABEL_78:
        LODWORD(v57) = v37;
        HIBYTE(__src) = 4;
        if ((v61 & 2) != 0) {
          goto LABEL_81;
        }
        uint64_t v43 = v59;
        os_trace_blob_add_slow((uint64_t)&v58, &__src, 2uLL);
LABEL_81:
        size_t v44 = 4LL;
        goto LABEL_99;
      case 8:
        unsigned __int16 __src = v35 | 0x60;
        if ((v61 & 2) != 0) {
          goto LABEL_121;
        }
        if ((v62 + HIDWORD(v59) - v59 - 1) <= 1)
        {
          os_trace_blob_add_slow((uint64_t)&v58, &__src, 2uLL);
LABEL_121:
          size_t v44 = 0LL;
        }

        else
        {
          unsigned int v45 = __src;
          *(_WORD *)((char *)v58 + v59) = __src;
          unsigned int v46 = v59 + 2;
          LODWORD(v59) = v59 + 2;
          size_t v44 = v45 >> 8;
          if (!v62) {
            *((_BYTE *)v58 + v46) = 0;
          }
        }

        v12 |= 2u;
        if ((v61 & 2) != 0) {
          goto LABEL_104;
        }
        if (v62 + HIDWORD(v59) - (int)v59 - 1 >= v44)
        {
          uint64_t v47 = (char *)v58 + v59;
          uint64_t v48 = 0LL;
          goto LABEL_102;
        }

        uint64_t v54 = 0LL;
        goto LABEL_108;
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
        goto LABEL_94;
      case 14:
      case 15:
        int v38 = (uint64_t *)v69;
        v69 += 2;
        uint64_t v57 = *v38;
        goto LABEL_95;
      case 16:
        char v49 = v35 | 0x20;
        goto LABEL_93;
      case 17:
        char v49 = v35 | 0x50;
        goto LABEL_93;
      case 18:
        char v49 = v35 | 0x40;
        goto LABEL_93;
      case 19:
        char v49 = v35 | 0x30;
LABEL_93:
        LOBYTE(__src) = v49;
LABEL_94:
        unsigned __int8 v50 = (uint64_t *)v69;
        v69 += 2;
        uint64_t v57 = *v50;
LABEL_95:
        HIBYTE(__src) = 8;
        if ((v61 & 2) != 0) {
          goto LABEL_110;
        }
        uint64_t v43 = v59;
        if ((v62 + HIDWORD(v59) - v59 - 1) <= 1)
        {
          os_trace_blob_add_slow((uint64_t)&v58, &__src, 2uLL);
LABEL_110:
          size_t v44 = 8LL;
        }

        else
        {
LABEL_97:
          unsigned int v51 = __src;
          *(_WORD *)((char *)v58 + v43) = __src;
          unsigned int v52 = v59 + 2;
          LODWORD(v59) = v59 + 2;
          size_t v44 = v51 >> 8;
          if (!v62) {
            *((_BYTE *)v58 + v52) = 0;
          }
        }

LABEL_99:
        if ((v61 & 2) != 0) {
          goto LABEL_104;
        }
        if (v62 + HIDWORD(v59) - (int)v59 - 1 < v44)
        {
          uint64_t v54 = &v57;
LABEL_108:
          os_trace_blob_add_slow((uint64_t)&v58, v54, v44);
        }

        else
        {
          uint64_t v47 = (char *)v58 + v59;
          uint64_t v48 = &v57;
LABEL_102:
          memcpy(v47, v48, v44);
          unsigned int v53 = v59 + v44;
          LODWORD(v59) = v59 + v44;
          if (!v62) {
            *((_BYTE *)v58 + v53) = 0;
          }
        }

LABEL_104:
        int v26 = &v16[(void)v10];
        __int16 v11 = ++v13;
        break;
      default:
        goto LABEL_104;
    }

LABEL_105:
    uint64_t v10 = strchr(v26, 37);
    if (!v10) {
      goto LABEL_125;
    }
  }

  unsigned __int16 __src = 2160;
  if ((v61 & 2) != 0) {
    goto LABEL_112;
  }
  if ((v62 + HIDWORD(v59) - v59 - 1) <= 1)
  {
    os_trace_blob_add_slow((uint64_t)&v58, &__src, 2uLL);
LABEL_112:
    size_t v19 = 8LL;
    goto LABEL_16;
  }

  unsigned int v17 = __src;
  *(_WORD *)((char *)v58 + v59) = __src;
  unsigned int v18 = v59 + 2;
  LODWORD(v59) = v59 + 2;
  size_t v19 = v17 >> 8;
  if (!v62) {
    *((_BYTE *)v58 + v18) = 0;
  }
LABEL_16:
  if ((v61 & 2) == 0)
  {
    if (v62 + HIDWORD(v59) - (int)v59 - 1 < v19)
    {
      os_trace_blob_add_slow((uint64_t)&v58, &v68, v19);
    }

    else
    {
      memcpy((char *)v58 + v59, &v68, v19);
      unsigned int v20 = v59 + v19;
      LODWORD(v59) = v59 + v19;
      if (!v62) {
        *((_BYTE *)v58 + v20) = 0;
      }
    }
  }

  v12 |= 2u;
  if (++v13 != 48)
  {
    unsigned int v15 = v65;
    goto LABEL_22;
  }

LABEL_124:
  __int16 v11 = 48;
LABEL_125:
  __int16 v55 = v12 | (unsigned __int16)(v11 << 8);
LABEL_126:
  *uint64_t v6 = v55;
  if (a4) {
    *a4 = v59;
  }
  if ((v61 & 1) != 0) {
    goto LABEL_131;
  }
  return v6;
}

const char *os_log_fmt_extract_symptom(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 1)) {
    return 0LL;
  }
  int v1 = *(_BYTE *)(a1 + 2) & 0xF0;
  if (v1 == 32)
  {
    uint64_t v4 = *(const char **)(a1 + 4);
    strlen(v4);
    return v4;
  }

  uint64_t v2 = a1 + 4 + *(unsigned __int8 *)(a1 + 3);
  int v3 = *(_BYTE *)v2 & 0xF0;
  if (v3 == 32)
  {
    uint64_t v4 = *(const char **)(v2 + 2);
    strnlen(v4, *(int *)(a1 + 4));
    return v4;
  }

  if (v3 == 48) {
    return *(const char **)(v2 + 2);
  }
  else {
    return 0LL;
  }
}

uint64_t _os_log_fmt_flatten_masked_data( _BYTE *a1, int a2, uint64_t a3, uint64_t a4, _BYTE *a5, unint64_t a6, size_t a7, _BYTE *a8)
{
  uint64_t v20 = *MEMORY[0x1895FEE08];
  if (!a3)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_47;
  }

  size_t v8 = a7;
  uint64_t v10 = a4;
  unsigned int v9 = a1;
  unsigned int v12 = *a1;
  *a1 = v12 & 0xF8 | 2;
  if (a3 <= 0x656D616E6C69616CLL)
  {
    if (a3 <= 0x786F626C69616CLL)
    {
      if (a3 == 1752392040) {
        goto LABEL_17;
      }
      uint64_t v13 = 0x68736168766564LL;
      goto LABEL_16;
    }

    if (a3 == 0x786F626C69616DLL) {
      goto LABEL_17;
    }
    if (a3 != 0x35646D6E69616C70LL)
    {
      uint64_t v13 = 0x617474616C69616DLL;
      goto LABEL_16;
    }

    if (*a8)
    {
      LOWORD(v8) = 0;
      goto LABEL_34;
    }

    ccmd5_di();
    ccdigest();
    if (v8 > 0xF) {
      size_t v8 = 16LL;
    }
    else {
      *a8 = 1;
    }
    if ((*(_WORD *)(v10 + 20) & 2) != 0) {
      goto LABEL_34;
    }
    uint64_t v17 = *(unsigned int *)(v10 + 8);
    if (v8 <= (*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v17 - 1))
    {
      memcpy((void *)(*(void *)v10 + v17), __src, v8);
      unsigned int v18 = *(_DWORD *)(v10 + 8) + v8;
      *(_DWORD *)(v10 + 8) = v18;
      if (!*(_BYTE *)(v10 + 22)) {
        *(_BYTE *)(*(void *)v10 + v18) = 0;
      }
      goto LABEL_34;
    }

LABEL_47:
    os_trace_blob_add_slow(v10, __src, v8);
    goto LABEL_34;
  }

  if (a3 > 0x6F6363616C69616CLL)
  {
    if (a3 == 0x6F6363616C69616DLL || a3 == 0x7075626D6C69616DLL) {
      goto LABEL_17;
    }
    uint64_t v13 = 0x726464616C69616DLL;
  }

  else
  {
    if (a3 == 0x656D616E6C69616DLL || a3 == 0x6A6275736C69616DLL) {
      goto LABEL_17;
    }
    uint64_t v13 = 0x6D6D75736C69616DLL;
  }

LABEL_16:
  if (a3 != v13)
  {
    LOWORD(v8) = 0;
    *a1 = v12 & 8 | 0xE2;
    *a8 = 0;
    return (unsigned __int16)v8;
  }

    if ((v7 & 8) == 0 && (MEMORY[0xFFFFFC104] & 8) == 0 && (voucher_get_activity_id() & 0x800000000000000LL) == 0
      || (*((_DWORD *)oslog + 15) & 7) == 4)
    {
      goto LABEL_19;
    }

    if ((dword_18C43B770 & 4) == 0)
    {
LABEL_56:
      unsigned int v15 = (*((_DWORD *)oslog + 15) >> 27) & 7;
      if (v15 == 1)
      {
      }

      else if (v15 == 3 || v15 == 2 && v2 != 2)
      {
        goto LABEL_78;
      }

LABEL_29:
  if (a3 == v14) {
    goto LABEL_30;
  }
LABEL_32:
  __src[0] = 2;
  LOWORD(v8) = _os_log_mask_callback_impl(a2, __src, a3, a4, a5, a6, a7, a8);
  *unsigned int v9 = __src[0] & 0xF | *v9 & 0xF8;
LABEL_34:
  *v9 |= 0xF0u;
  return (unsigned __int16)v8;
}

  if (v8 != a2) {
    free(v8);
  }
  return v6;
}

uint64_t _os_log_fmt_flatten_to_blob( uint64_t a1, unsigned int a2, uint64_t a3, void *a4, size_t a5, uint64_t a6, uint64_t a7, size_t a8, unint64_t a9, unint64_t a10)
{
  uint64_t v28 = *MEMORY[0x1895FEE08];
  BOOL v26 = 0;
  if (privacy_flags2opt[*(_BYTE *)a1 & 7] <= a2 || (*(_BYTE *)a1 & 0xF0) == 0x80)
  {
    if ((*(_BYTE *)a1 & 1) != 0) {
      uint64_t v18 = a7;
    }
    else {
      uint64_t v18 = a6;
    }
    int v15 = *(_DWORD *)(v18 + 8);
    unsigned __int16 v17 = _os_log_fmt_flatten_data_into_blob(v18, a9, a10, a4, a5, a8, &v26);
  }

  else
  {
    if (!a3) {
      return 0;
    }
    uint64_t v21 = &v27;
    uint64_t v22 = 0x36200000000LL;
    __int16 v24 = 0;
    char v25 = 1;
    int v23 = 0x10000;
    _os_log_fmt_flatten_data_into_blob((uint64_t)&v21, a9, a10, a4, a5, 0x10000uLL, &v26);
    int v15 = *(_DWORD *)(a6 + 8);
    uint64_t v16 = v21;
    unsigned __int16 v17 = _os_log_fmt_flatten_masked_data((_BYTE *)a1, a2, a3, a6, v21, v22, a8, &v26);
    if ((v24 & 1) != 0) {
      free(v16);
    }
  }

  __int16 v19 = v17 & 0x7FFF | (v26 << 15);
  *(_WORD *)(a1 + 2) = v15;
  *(_WORD *)(a1 + 4) = v19;
  return v17;
}

size_t _os_log_fmt_flatten_data_into_blob( uint64_t a1, unint64_t __src, unint64_t a3, void *a4, size_t __n, size_t a6, BOOL *a7)
{
  size_t v8 = __n;
  unsigned int v9 = (_DWORD *)a3;
  uint64_t v11 = a1;
  *a7 = 0;
  if (__src && a6)
  {
    if (__n + 1 < a6) {
      size_t v12 = __n + 1;
    }
    else {
      size_t v12 = a6;
    }
    if (!__n) {
      size_t v12 = a6;
    }
    int v13 = os_trace_blob_addns(a1, (_BYTE *)__src, v12 - 1, &v37);
    char v39 = 0;
    if ((*(_WORD *)(v11 + 20) & 2) == 0)
    {
      uint64_t v14 = *(unsigned int *)(v11 + 8);
      if (*(char *)(v11 + 22) + *(_DWORD *)(v11 + 12) - 1 == (_DWORD)v14)
      {
        os_trace_blob_add_slow(v11, &v39, 1uLL);
      }

      else
      {
        *(_BYTE *)(*(void *)v11 + v14) = 0;
        unsigned int v15 = *(_DWORD *)(v11 + 8) + 1;
        *(_DWORD *)(v11 + 8) = v15;
        if (!*(_BYTE *)(v11 + 22)) {
          *(_BYTE *)(*(void *)v11 + v15) = 0;
        }
      }
    }

    BOOL v16 = (!v8 || (unint64_t)v37 < __src + v8) && *v37 != 0;
    *a7 = v16;
    return (v13 + 1);
  }

  if (a3 && a6)
  {
    size_t v17 = a6 - 1;
    int v18 = *(_DWORD *)(a1 + 8);
    if (!*(_BYTE *)(a1 + 22)) {
      ++v18;
    }
    int v19 = *(_DWORD *)(a1 + 16);
    if (v19)
    {
      size_t v20 = (v19 - v18);
    }

    else
    {
      int v23 = *(_DWORD *)(a1 + 12);
      LODWORD(v20) = v23 - v18;
      if (v23) {
        size_t v20 = v20;
      }
      else {
        size_t v20 = 0LL;
      }
    }

    if (v17 > v20) {
      size_t v17 = v20;
    }
    unsigned int v24 = *(_DWORD *)a3;
    if (*(_DWORD *)a3)
    {
      uint64_t v25 = 0LL;
      do
      {
        if (v24 >= 0x80)
        {
          if (v24 >= 0x800)
          {
            if (HIWORD(v24))
            {
              if (HIWORD(v24) > 0x10u) {
                break;
              }
              char v27 = -16;
              size_t v26 = 4LL;
            }

            else
            {
              if (v24 >> 11 == 27) {
                break;
              }
              char v27 = -32;
              size_t v26 = 3LL;
            }
          }

          else
          {
            char v27 = -64;
            size_t v26 = 2LL;
          }

          size_t v28 = v26 - 1;
          do
          {
            __srca[v28] = v24 & 0x3F | 0x80;
            unsigned int v24 = (int)v24 >> 6;
            --v28;
          }

          while (v28);
          LOBYTE(v24) = v24 | v27;
        }

        else
        {
          size_t v26 = 1LL;
        }

        __srca[0] = v24;
        if (v26 + v25 > v17 || (*(_WORD *)(v11 + 20) & 2) != 0) {
          break;
        }
        uint64_t v29 = *(unsigned int *)(v11 + 8);
        if (v26 > (*(char *)(v11 + 22) + *(_DWORD *)(v11 + 12) - v29 - 1))
        {
          LODWORD(v26) = os_trace_blob_add_slow(v11, __srca, v26);
          if (!(_DWORD)v26) {
            break;
          }
        }

        else
        {
          memcpy((void *)(*(void *)v11 + v29), __srca, v26);
          unsigned int v30 = *(_DWORD *)(v11 + 8) + v26;
          *(_DWORD *)(v11 + 8) = v30;
          if (!*(_BYTE *)(v11 + 22)) {
            *(_BYTE *)(*(void *)v11 + v30) = 0;
          }
        }

        v25 += v26;
        unsigned int v31 = v9[1];
        ++v9;
        unsigned int v24 = v31;
      }

      while (v31);
    }

    else
    {
      LODWORD(v25) = 0;
    }

    size_t v8 = (v25 + 1);
    __int16 v32 = *(_WORD *)(v11 + 20);
    *a7 = *v9 != 0;
    char v38 = 0;
    if ((v32 & 2) == 0)
    {
      uint64_t v33 = *(unsigned int *)(v11 + 8);
      if (*(char *)(v11 + 22) + *(_DWORD *)(v11 + 12) - 1 != (_DWORD)v33)
      {
        *(_BYTE *)(*(void *)v11 + v33) = 0;
        unsigned int v22 = *(_DWORD *)(v11 + 8) + 1;
LABEL_62:
        *(_DWORD *)(v11 + 8) = v22;
        if (!*(_BYTE *)(v11 + 22)) {
          *(_BYTE *)(*(void *)v11 + v22) = 0;
        }
        return v8;
      }

      unsigned __int8 v35 = &v38;
      a1 = v11;
      size_t v36 = 1LL;
      goto LABEL_68;
    }
  }

  else
  {
    if (__src | a3)
    {
      size_t v8 = 0LL;
      *a7 = 1;
      return v8;
    }

    if (__n > a6)
    {
      *a7 = 1;
      size_t v8 = a6;
    }

    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      uint64_t v21 = *(unsigned int *)(a1 + 8);
      if (v8 <= (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v21 - 1))
      {
        memcpy((void *)(*(void *)a1 + v21), a4, v8);
        unsigned int v22 = *(_DWORD *)(v11 + 8) + v8;
        goto LABEL_62;
      }

      unsigned __int8 v35 = (char *)a4;
      size_t v36 = v8;
LABEL_68:
      os_trace_blob_add_slow(a1, v35, v36);
    }
  }

  return v8;
}

uint64_t os_log_fmt_read_scalar(uint64_t a1, char *a2, int a3)
{
  int v3 = *(unsigned __int8 *)(a1 + 10);
  if (v3 != 15 && v3 != 14)
  {
    if ((*(_WORD *)(a1 + 8) & 0x20) == 0)
    {
      switch(a3)
      {
        case 1:
          return *a2;
        case 2:
          return *(__int16 *)a2;
        case 4:
          return *(int *)a2;
        case 8:
          return *(void *)a2;
        default:
          goto LABEL_14;
      }
    }

    switch(a3)
    {
      case 1:
        return *a2;
      case 2:
        return *(unsigned __int16 *)a2;
      case 4:
        return *(unsigned int *)a2;
      case 8:
        return *(void *)a2;
      default:
LABEL_14:
        _os_crash();
        __break(1u);
        JUMPOUT(0x180115BD4LL);
    }
  }

  return *(void *)a2;
}

_BYTE *os_log_fmt_convert_trace(_BYTE *a1, char *a2, uint64_t a3)
{
  int v3 = a1;
  uint64_t v5 = &a2[a3 - 1];
  uint64_t v4 = *v5;
  *a1 = 0;
  a1[1] = v4;
  if (v4)
  {
    uint64_t v6 = -v4;
    uint64_t v7 = &a2[a3 + ~v4];
    size_t v8 = a1 + 2;
    while (1)
    {
      size_t v9 = v5[v6] & 0x3F;
      uint64_t v10 = &a2[v9];
      if (&a2[v9] > v7) {
        break;
      }
      *size_t v8 = 0;
      v8[1] = v9;
      uint64_t v11 = v8 + 2;
      memcpy(v8 + 2, a2, v9);
      size_t v8 = &v11[v9];
      a2 = v10;
      if (__CFADD__(v6++, 1LL)) {
        return v3;
      }
    }

    return 0LL;
  }

  return v3;
}

_BYTE *os_log_fmt_extract_pubdata(_BYTE *result, int a2, void *a3, unsigned __int16 *a4)
{
  *a3 = 0LL;
  *a4 = 0;
  if (!a2) {
    return &os_log_fmt_extract_pubdata_empty_hdr;
  }
  if (a2 == 1) {
    return 0LL;
  }
  uint64_t v4 = result + 2;
  unsigned __int16 v5 = a2 - 2;
  if (result[1])
  {
    int v6 = 0;
    while (v5 >= 2u)
    {
      unint64_t v7 = v4[1] + 2LL;
      if (v7 > v5) {
        break;
      }
      v4 += v7;
      v5 -= v7;
    }

    return 0LL;
  }

LABEL_10:
  *a3 = v4;
  *a4 = v5;
  return result;
}

unint64_t os_log_fmt_compose( size_t a1, char *__s, uint64_t a3, unsigned int a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, unsigned int a8, uint64_t a9, unsigned __int16 a10)
{
  int v13 = a6 + 2;
  int v14 = a6[1];
  unsigned int v69 = (unsigned __int16)a5;
  unsigned int v70 = (*a6 >> 5) & 3;
  while (1)
  {
    unint64_t result = strcspn(__s, "%");
    unint64_t v16 = result;
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      uint64_t v17 = *(unsigned int *)(a1 + 8);
      if (result > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v17 - 1))
      {
        unint64_t result = os_trace_blob_add_slow(a1, __s, result);
      }

      else
      {
        unint64_t result = (unint64_t)memcpy((void *)(*(void *)a1 + v17), __s, result);
        unsigned int v18 = *(_DWORD *)(a1 + 8) + v16;
        *(_DWORD *)(a1 + 8) = v18;
        if (!*(_BYTE *)(a1 + 22)) {
          *(_BYTE *)(*(void *)a1 + v18) = 0;
        }
      }
    }

    int v19 = &__s[v16];
    if (!*v19) {
      break;
    }
    unint64_t result = (unint64_t)os_log_fmt_delimit(v19, a3, (uint64_t)&v75);
    if (result)
    {
      char v27 = v76;
      if ((v76 & 1) != 0) {
        return _os_log_fmt_decode_give_up(a1, v75, v78, v21, v22, v23, v24, v25);
      }
      if ((v76 & 2) != 0)
      {
        if ((_WORD)v14)
        {
          --v14;
          uint64_t v28 = v13[1];
          uint64_t v29 = &v13[v28 + 2];
          if (v28 == 4 && ((unsigned int v30 = *v13, v30 < 0x10) || (v30 & 0xF0) == 0x10)) {
            int v31 = *(_DWORD *)(v13 + 2);
          }
          else {
            int v31 = 0;
          }
        }

        else
        {
          int v31 = 0;
          int v14 = 0;
          uint64_t v29 = v13;
        }

        int v80 = v31;
        int v13 = v29;
      }

      if ((v76 & 8) == 0) {
        goto LABEL_41;
      }
      if ((v76 & 4) == 0 && ((v76 & 0x10) != 0 || v77 == 18))
      {
        if ((_WORD)v14)
        {
          if ((*v13 & 0xF0) == 0x10)
          {
            --v14;
            v13 += v13[1] + 2;
          }
        }

        else
        {
          int v14 = 0;
        }

        char v27 = v76 & 0xF7;
        v76 &= ~8u;
        goto LABEL_41;
      }

      if (!(_WORD)v14)
      {
        int v14 = 0;
        goto LABEL_34;
      }

      --v14;
      uint64_t v35 = v13[1];
      size_t v36 = &v13[v35 + 2];
      if (v35 != 4 || (unsigned int v37 = *v13, v37 >= 0x10) && (v37 & 0xF0) != 0x10)
      {
        int v13 = v36;
LABEL_34:
        int v81 = -1;
LABEL_41:
        size_t v36 = v13;
        goto LABEL_42;
      }

      int v81 = *(_DWORD *)(v13 + 2);
LABEL_42:
      __s = &v19[result];
      if (!(_WORD)v14)
      {
        int v14 = 0;
        int v13 = v36;
        goto LABEL_106;
      }

      --v14;
      char v38 = (char *)(v36 + 2);
      uint64_t v39 = v36[1];
      int v13 = &v36[v39 + 2];
      unsigned __int8 v40 = *v36;
      if ((*v36 & 0xF0) == 0xE0)
      {
        uint64_t v56 = 10LL;
        if (v83 > 0x656D616E6C69616CLL)
        {
          if (v83 > 0x6F6363616C69616CLL)
          {
            if (v83 != 0x6F6363616C69616DLL && v83 != 0x7075626D6C69616DLL)
            {
              uint64_t v59 = 0x726464616C69616DLL;
              goto LABEL_145;
            }
          }

          else if (v83 != 0x656D616E6C69616DLL && v83 != 0x6A6275736C69616DLL)
          {
            uint64_t v59 = 0x6D6D75736C69616DLL;
            goto LABEL_145;
          }

LABEL_146:
          uint64_t v56 = 8LL;
          goto LABEL_147;
        }

        if (v83 > 0x786F626C69616CLL)
        {
          if (v83 != 0x786F626C69616DLL && v83 != 0x35646D6E69616C70LL)
          {
            uint64_t v59 = 0x617474616C69616DLL;
            goto LABEL_145;
          }

          goto LABEL_146;
        }

        if (v83)
        {
          if (v83 != 1752392040)
          {
            uint64_t v59 = 0x68736168766564LL;
LABEL_145:
            if (v83 != v59) {
              goto LABEL_147;
            }
          }

          goto LABEL_146;
        }

LABEL_159:
        unint64_t v48 = 0LL;
        goto LABEL_160;
      }

      unsigned int v41 = a8;
      uint64_t v42 = a7;
      if ((*v36 & 1) == 0) {
        goto LABEL_45;
      }
      if (((0xD8uLL >> (v40 & 7)) & 1) != 0) {
        goto LABEL_159;
      }
      unsigned int v44 = privacy_flags2opt[v40 & 7];
      if (v44 <= a4)
      {
        if (v70 - 1 > 2)
        {
          if (a9)
          {
            BOOL v43 = 0;
            uint64_t v42 = a9;
            unsigned int v41 = a10;
            goto LABEL_61;
          }

          goto LABEL_50;
        }

        unsigned int v41 = a10;
        uint64_t v42 = a9;
        if ((v40 & 0xF0) != 0x80)
        {
          unsigned int v41 = a10;
          uint64_t v42 = a9;
          if (v44 > v70) {
            goto LABEL_50;
          }
        }

LABEL_45:
        BOOL v43 = v42 == 0;
        if (!v41 || v42)
        {
LABEL_61:
          if ((*v36 & 0xF1) == 0)
          {
            LODWORD(v55) = v39 == 0;
            unint64_t v48 = v36[1];
            goto LABEL_84;
          }

          unint64_t v48 = 0LL;
          if ((*v36 & 0xE1) != 0 && (_DWORD)v39 == 4)
          {
            uint64_t v49 = *(unsigned __int16 *)v38;
            int v50 = v41 - v49;
            __int16 v51 = *((_WORD *)v36 + 2);
            unsigned __int16 v52 = v51 & 0x7FFF;
            if (v50 < (v51 & 0x7FFF)) {
              goto LABEL_96;
            }
            if (*v36 <= 0xFu && v51 < 0)
            {
LABEL_106:
              _os_log_fmt_decode_error(a1);
            }

            else
            {
              unsigned int v53 = (char *)(v42 + v49);
              if (v43) {
                char v38 = 0LL;
              }
              else {
                char v38 = v53;
              }
              int v54 = v50 >= 0x8000;
              else {
                unint64_t v48 = v51 & 0x7FFF;
              }
              else {
                uint64_t v55 = (v51 >> 15) & 1;
              }
              if (*v36 < 0xF0u)
              {
LABEL_84:
                if ((_DWORD)v55 && *v36 < 0x10u) {
                  goto LABEL_106;
                }
                if ((v40 & 0xF0) == 0x10) {
                  goto LABEL_160;
                }
                if ((v27 & 0x10) != 0)
                {
                  v26.i32[0] = v48;
                }

                switch(v77)
                {
                  case 1u:
                  case 2u:
                  case 3u:
                  case 4u:
                  case 5u:
                  case 6u:
                  case 7u:
                  case 8u:
                    unsigned __int16 v58 = v48;
                    goto LABEL_160;
                  case 9u:
                  case 0xAu:
                    unsigned __int16 v58 = v48;
                    goto LABEL_92;
                  case 0xBu:
                  case 0xCu:
                    unsigned __int16 v58 = v48;
                    goto LABEL_92;
                  case 0xDu:
                    unsigned __int16 v58 = a5;
                    goto LABEL_92;
                  case 0xEu:
                  case 0xFu:
                    if ((_DWORD)v48 != 8) {
                      goto LABEL_160;
                    }
                    unsigned __int16 v58 = 8;
LABEL_92:
                    if ((v27 & 0x40) == 0) {
                      goto LABEL_102;
                    }
                    if (v27 < 0)
                    {
                    }

                    else if ((_os_log_fmt_plugin_annotated(a1, a5, (uint64_t)&v75, (char *)v36, v38, v58, v55) & 1) != 0)
                    {
                      continue;
                    }

LABEL_102:
                    if ((v76 & 0x10) != 0) {
                      _os_log_fmt_compose_scalar(a1, (uint64_t)&v75, a5, v38, v58);
                    }
                    else {
                      _os_log_fmt_compose_data(a1, (uint64_t)&v75, v36, v38, v58, v55);
                    }
                    break;
                  case 0x10u:
                    unsigned __int16 v58 = v48;
                    if ((v40 & 0xF0) != 0x20) {
                      goto LABEL_160;
                    }
                    goto LABEL_92;
                  case 0x11u:
                    unsigned __int16 v58 = v48;
                    if ((v40 & 0xF0) != 0x50) {
                      goto LABEL_160;
                    }
                    goto LABEL_92;
                  case 0x12u:
                    unsigned int v64 = (v40 >> 4) - 2;
                    if (v64 < 7) {
                      __asm { BR              X10 }
                    }

                    goto LABEL_160;
                  case 0x13u:
                    unsigned __int16 v58 = v48;
                    if ((v40 & 0xF0) != 0x30) {
                      goto LABEL_160;
                    }
                    goto LABEL_92;
                  default:
                    qword_18C50A768 = (uint64_t)"BUG IN LIBTRACE: Unexpected type";
                    qword_18C50A798 = v77;
                    __break(1u);
                    JUMPOUT(0x180116854LL);
                }
              }

              else
              {
                uint64_t v56 = 9LL;
                if (v83 <= 0x656D616E6C69616CLL)
                {
                  if (v83 > 0x786F626C69616CLL)
                  {
                    if (v83 == 0x786F626C69616DLL) {
                      goto LABEL_116;
                    }
                    if (v83 != 0x35646D6E69616C70LL)
                    {
                      uint64_t v57 = 0x617474616C69616DLL;
                      goto LABEL_115;
                    }

                    goto LABEL_129;
                  }

                  if (v83 != 1752392040 && v83 != 0x68736168766564LL)
                  {
                    if (v83) {
                      goto LABEL_147;
                    }
                    goto LABEL_159;
                  }

LABEL_129:
                  os_trace_blob_addf(a1, "<mask.%.*s: ", v20, 9LL, v22, v23, v24, v25, v79);
                  if ((_DWORD)v48 || (_DWORD)v55)
                  {
                    os_trace_blob_add_hexdump(a1, (uint64_t)v38, v48, v55);
                  }

                  else if ((*(_WORD *)(a1 + 20) & 2) == 0)
                  {
                    uint64_t v60 = *(unsigned int *)(a1 + 8);
                    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v60 - 1) <= 5)
                    {
                      os_trace_blob_add_slow(a1, "(null)", 6uLL);
                    }

                    else
                    {
                      uint64_t v61 = *(void *)a1 + v60;
                      *(_WORD *)(v61 + 4) = 10604;
                      *(_DWORD *)uint64_t v61 = 1819635240;
                      unsigned int v62 = *(_DWORD *)(a1 + 8) + 6;
                      *(_DWORD *)(a1 + 8) = v62;
                      if (!*(_BYTE *)(a1 + 22)) {
                        *(_BYTE *)(*(void *)a1 + v62) = 0;
                      }
                    }
                  }

                  if ((*(_WORD *)(a1 + 20) & 2) == 0)
                  {
                    uint64_t v63 = *(unsigned int *)(a1 + 8);
                    if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 != (_DWORD)v63)
                    {
                      *(_BYTE *)(*(void *)a1 + v63) = 62;
                      unsigned int v47 = *(_DWORD *)(a1 + 8) + 1;
                      goto LABEL_53;
                    }

                    os_trace_blob_add_slow(a1, ">", 1uLL);
                  }
                }

                else if (v83 > 0x6F6363616C69616CLL)
                {
                  if (v83 == 0x6F6363616C69616DLL) {
                    goto LABEL_116;
                  }
                  if (v83 == 0x7075626D6C69616DLL) {
                    goto LABEL_129;
                  }
                  uint64_t v57 = 0x726464616C69616DLL;
LABEL_115:
                  if (v83 == v57) {
                    goto LABEL_116;
                  }
LABEL_147:
                  _os_log_fmt_decode_masked_unknown(a1, v79, v82, v56, v22, v23, v24, v25);
                }

                else
                {
                  if (v83 != 0x656D616E6C69616DLL && v83 != 0x6A6275736C69616DLL)
                  {
                    uint64_t v57 = 0x6D6D75736C69616DLL;
                    goto LABEL_115;
                  }

LABEL_116:
                  _os_log_fmt_compose_masked_partial_redacted(a1, (unsigned __int8 *)v38, v48, v55, v22, v23, v24, v25);
                }
              }
            }
          }

          else
          {
LABEL_160:
            _os_log_fmt_decode_cmd_mismatch(a1, v75, v78, v36, v48, v23, v24, v25);
          }
        }

        else
        {
LABEL_96:
          _os_log_fmt_decode_bad_range( a1,  v75,  v78,  *((unsigned __int16 *)v36 + 1),  *((unsigned __int16 *)v36 + 2),  0LL,  v24,  v25);
        }
      }

      else
      {
LABEL_50:
        if ((*(_WORD *)(a1 + 20) & 2) == 0)
        {
          uint64_t v45 = *(unsigned int *)(a1 + 8);
          if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v45 - 1) <= 8)
          {
            os_trace_blob_add_slow(a1, "<private>", 9uLL);
          }

          else
          {
            uint64_t v46 = *(void *)a1 + v45;
            *(void *)uint64_t v46 = *(void *)"<private>";
            *(_BYTE *)(v46 + 8) = 62;
            unsigned int v47 = *(_DWORD *)(a1 + 8) + 9;
LABEL_53:
            *(_DWORD *)(a1 + 8) = v47;
            if (!*(_BYTE *)(a1 + 22)) {
              *(_BYTE *)(*(void *)a1 + v47) = 0;
            }
          }
        }
      }
    }

    else
    {
      char v32 = v19[1];
      if (!v32) {
        break;
      }
      __src[0] = v19[1];
      if ((*(_BYTE *)(a1 + 20) & 2) == 0)
      {
        uint64_t v33 = *(unsigned int *)(a1 + 8);
        if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == (_DWORD)v33)
        {
          os_trace_blob_add_slow(a1, __src, 1uLL);
        }

        else
        {
          *(_BYTE *)(*(void *)a1 + v33) = v32;
          unsigned int v34 = *(_DWORD *)(a1 + 8) + 1;
          *(_DWORD *)(a1 + 8) = v34;
          if (!*(_BYTE *)(a1 + 22)) {
            *(_BYTE *)(*(void *)a1 + v34) = 0;
          }
        }
      }

      __s = v19 + 2;
    }
  }

  uint64_t v65 = *(unsigned int *)(a1 + 8) - 1LL;
  uint64_t v66 = MEMORY[0x1895FED88];
  while (v65 != -1)
  {
    unsigned int v67 = *(char *)(*(void *)a1 + v65);
    if ((v67 & 0x80000000) != 0) {
      unint64_t result = __maskrune(v67, 0x4000uLL);
    }
    else {
      unint64_t result = *(_DWORD *)(v66 + 4LL * v67 + 60) & 0x4000;
    }
    --v65;
    if (!(_DWORD)result)
    {
      unsigned int v68 = v65 + 2;
      goto LABEL_174;
    }
  }

  unsigned int v68 = 0;
LABEL_174:
  *(_DWORD *)(a1 + 8) = v68;
  if (!*(_BYTE *)(a1 + 22)) {
    *(_BYTE *)(*(void *)a1 + v68) = 0;
  }
  return result;
}

uint64_t _os_log_fmt_compose_masked_partial_redacted( uint64_t result, unsigned __int8 *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a4;
  unint64_t v10 = result;
  if (!(_DWORD)a3 && (a4 & 1) == 0)
  {
    if ((*(_WORD *)(result + 20) & 2) != 0) {
      return result;
    }
    uint64_t v11 = *(unsigned int *)(result + 8);
    if ((*(char *)(result + 22) + *(_DWORD *)(result + 12) - v11 - 1) > 7)
    {
      *(void *)(*(void *)result + v11) = 0x3E296C6C756E283CLL;
      unsigned int v12 = *(_DWORD *)(result + 8) + 8;
      goto LABEL_69;
    }

    BOOL v43 = "<(null)>";
    size_t v44 = 8LL;
    return os_trace_blob_add_slow(result, v43, v44);
  }

  if (a3 <= 3)
  {
    if ((*(_WORD *)(result + 20) & 2) != 0) {
      return result;
    }
    uint64_t v13 = *(unsigned int *)(result + 8);
    if ((*(char *)(result + 22) + *(_DWORD *)(result + 12) - v13 - 1) <= 4)
    {
      BOOL v43 = "<…>";
      size_t v44 = 5LL;
      return os_trace_blob_add_slow(result, v43, v44);
    }

    uint64_t v14 = *(void *)result + v13;
    *(_BYTE *)(v14 + 4) = 62;
    *(_DWORD *)uint64_t v14 = -1501502916;
    unsigned int v12 = *(_DWORD *)(result + 8) + 5;
LABEL_69:
    *(_DWORD *)(v10 + 8) = v12;
    if (!*(_BYTE *)(v10 + 22)) {
      *(_BYTE *)(*(void *)v10 + v12) = 0;
    }
    return result;
  }

  unint64_t v15 = a3;
  unint64_t v16 = *a2;
  char v17 = a2[1];
  unint64_t v18 = a2[2];
  int v19 = a2[3];
  BOOL v21 = v19 != 2 || v18 == 0;
  if (!(_DWORD)a4 && !*a2 && v21) {
    return os_trace_blob_addns(result, a2 + 4, a3 - 4LL, 0LL);
  }
  BOOL v22 = v19 == 1;
  if ((*(_WORD *)(result + 20) & 2) == 0)
  {
    uint64_t v23 = *(unsigned int *)(result + 8);
    if (*(char *)(result + 22) + *(_DWORD *)(result + 12) - 1 == (_DWORD)v23)
    {
      os_trace_blob_add_slow(result, "<", 1uLL);
    }

    else
    {
      *(_BYTE *)(*(void *)result + v23) = 60;
      unsigned int v24 = *(_DWORD *)(result + 8) + 1;
      *(_DWORD *)(result + 8) = v24;
      if (!*(_BYTE *)(result + 22)) {
        *(_BYTE *)(*(void *)result + v24) = 0;
      }
    }
  }

  unint64_t v25 = v16 + 4;
  if (v15 > v16 + 4)
  {
    if (v15 - (v16 + 4) < v18) {
      unint64_t v18 = v15 - (v16 + 4);
    }
    if (v19 == 2) {
      a3 = v18;
    }
    else {
      a3 = v15 - (v16 + 4);
    }
    if (a3)
    {
      if (v19 == 1 && (*(_WORD *)(v10 + 20) & 2) == 0)
      {
        uint64_t v26 = *(unsigned int *)(v10 + 8);
        if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v26 - 1) <= 2)
        {
          unint64_t v45 = a3;
          os_trace_blob_add_slow(v10, "…", 3uLL);
          a3 = v45;
        }

        else
        {
          uint64_t v27 = *(void *)v10 + v26;
          *(_BYTE *)(v27 + 2) = -90;
          *(_WORD *)uint64_t v27 = -32542;
          unsigned int v28 = *(_DWORD *)(v10 + 8) + 3;
          *(_DWORD *)(v10 + 8) = v28;
          if (!*(_BYTE *)(v10 + 22)) {
            *(_BYTE *)(*(void *)v10 + v28) = 0;
          }
        }
      }

      if (os_trace_blob_addns(v10, &a2[v25], a3, 0LL))
      {
        if (((v19 | 2) == 2 || v8) && (*(_WORD *)(v10 + 20) & 2) == 0)
        {
          uint64_t v29 = *(unsigned int *)(v10 + 8);
          if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v29 - 1) <= 2)
          {
            os_trace_blob_add_slow(v10, "…", 3uLL);
          }

          else
          {
            uint64_t v30 = *(void *)v10 + v29;
            *(_BYTE *)(v30 + 2) = -90;
            *(_WORD *)uint64_t v30 = -32542;
            unsigned int v31 = *(_DWORD *)(v10 + 8) + 3;
            *(_DWORD *)(v10 + 8) = v31;
            if (!*(_BYTE *)(v10 + 22)) {
              *(_BYTE *)(*(void *)v10 + v31) = 0;
            }
          }
        }

        BOOL v22 = 1;
      }
    }

    else
    {
      BOOL v22 = 0;
    }

    if (v19 == 2
      && (a3 = v15 - (v18 + v25), v15 != v18 + v25)
      && os_trace_blob_addns(v10, &a2[v18 + v25], a3, 0LL))
    {
      if ((*(_WORD *)(v10 + 20) & 2) == 0)
      {
        uint64_t v32 = *(unsigned int *)(v10 + 8);
        if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v32 - 1) <= 2)
        {
          os_trace_blob_add_slow(v10, "…", 3uLL);
        }

        else
        {
          uint64_t v33 = *(void *)v10 + v32;
          *(_BYTE *)(v33 + 2) = -90;
          *(_WORD *)uint64_t v33 = -32542;
          unsigned int v34 = *(_DWORD *)(v10 + 8) + 3;
          *(_DWORD *)(v10 + 8) = v34;
          if (!*(_BYTE *)(v10 + 22)) {
            *(_BYTE *)(*(void *)v10 + v34) = 0;
          }
        }
      }
    }

    else if (!v22)
    {
      goto LABEL_57;
    }

    if ((*(_WORD *)(v10 + 20) & 2) == 0)
    {
      uint64_t v35 = *(unsigned int *)(v10 + 8);
      if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v35 - 1) <= 1)
      {
        os_trace_blob_add_slow(v10, ", ", 2uLL);
      }

      else
      {
        *(_WORD *)(*(void *)v10 + v35) = 8236;
        unsigned int v36 = *(_DWORD *)(v10 + 8) + 2;
        *(_DWORD *)(v10 + 8) = v36;
        if (!*(_BYTE *)(v10 + 22)) {
          *(_BYTE *)(*(void *)v10 + v36) = 0;
        }
      }
    }
  }

uint64_t _os_log_fmt_builtin_annotated( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7)
{
  unint64_t v10 = 0LL;
  uint64_t v11 = *(const char **)(a3 + 40);
  size_t v12 = *(unsigned __int16 *)(a3 + 16);
  unint64_t v13 = 17LL;
  while (1)
  {
    unint64_t v14 = (v10 + v13) >> 1;
    unint64_t v15 = (&_os_log_fmt_builtin_annotated_functions)[2 * v14];
    int v16 = strncmp(v11, v15, v12);
    if (!v16) {
      break;
    }
LABEL_5:
    if (v16 >= 0) {
      unint64_t v10 = v14 + 1;
    }
    else {
      unint64_t v13 = (v10 + v13) >> 1;
    }
    if (v10 >= v13) {
      return 0LL;
    }
  }

  if (v15[v12])
  {
    int v16 = -v15[v12];
    goto LABEL_5;
  }

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void))(&_os_log_fmt_builtin_annotated_functions)[2 * v14 + 1])( a1,  a2,  a3,  a4,  a5,  a6,  a7);
}

unint64_t _os_log_fmt_compose_scalar(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, int a5)
{
  uint64_t v32 = *MEMORY[0x1895FEE08];
  uint64_t scalar = os_log_fmt_read_scalar(a2, a4, a5);
  __int16 v9 = *(_WORD *)(a2 + 8);
  if ((v9 & 2) == 0)
  {
    unsigned int v10 = 0;
    if ((v9 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  int v31 = *(_DWORD *)(a2 + 20);
  unsigned int v10 = 1;
  if ((v9 & 4) != 0) {
LABEL_5:
  }
    *(&v31 + v10++) = *(_DWORD *)(a2 + 24);
LABEL_6:
  MEMORY[0x1895FE128]();
  size_t v12 = (char *)&v31 - v11;
  unint64_t result = _os_log_fmt_compose_format_copy((_BYTE *)&v31 - v11, *(void **)a2, *(_WORD *)(a2 + 12));
  uint64_t v20 = *(unsigned __int8 *)(a2 + 10);
  switch(*(_BYTE *)(a2 + 10))
  {
    case 0:
    case 0x10:
    case 0x11:
    case 0x12:
    case 0x13:
      HIWORD(v30) = HIWORD(scalar);
      qword_18C50A768 = (uint64_t)"BUG IN LIBTRACE: Unexpected type";
      qword_18C50A798 = v20;
      __break(1u);
      JUMPOUT(0x18011720CLL);
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      goto LABEL_7;
    case 8:
      unint64_t v25 = strerror(scalar);
      unint64_t result = strlen(v25);
      if ((*(_WORD *)(a1 + 20) & 2) == 0)
      {
        int v26 = result;
        uint64_t v27 = *(unsigned int *)(a1 + 8);
        if (result > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v27 - 1))
        {
          return os_trace_blob_add_slow(a1, v25, result);
        }

        else
        {
          unint64_t result = (unint64_t)memcpy((void *)(*(void *)a1 + v27), v25, result);
          unsigned int v28 = *(_DWORD *)(a1 + 8) + v26;
          *(_DWORD *)(a1 + 8) = v28;
          if (!*(_BYTE *)(a1 + 22)) {
            *(_BYTE *)(*(void *)a1 + v28) = 0;
          }
        }
      }

      return result;
    case 9:
    case 0xA:
    case 0xD:
      if (a3 == 8 || (_DWORD)v20 == 13) {
        goto LABEL_34;
      }
      unsigned int v21 = result;
      uint64_t v22 = result;
      uint64_t v23 = result - 1LL;
      unsigned int v24 = v12[v23];
      if (a3 == 4)
      {
        if ((v24 & 0x80000000) != 0) {
          unint64_t result = __maskrune(v12[v23], 0x8000uLL);
        }
        else {
          unint64_t result = *(_DWORD *)(MEMORY[0x1895FED88] + 4LL * v24 + 60) & 0x8000;
        }
        if ((_DWORD)result) {
          unint64_t result = __tolower(v24);
        }
        else {
          v12[v21 - 2] = v24;
        }
        v12[v23] = result;
LABEL_7:
        if (v10 != 2)
        {
          if (v10 != 1)
          {
            if (v10) {
              return result;
            }
            return os_trace_blob_addf(a1, v12, v14, v15, v16, v17, v18, v19, scalar);
          }

_DWORD *_os_log_fmt_compose_data( unint64_t a1, uint64_t a2, _BYTE *a3, const char *a4, unsigned int a5, int a6)
{
  uint64_t v29 = *MEMORY[0x1895FEE08];
  MEMORY[0x1895FE128]();
  unint64_t v13 = (char *)&v28 - v12;
  unint64_t result = (_DWORD *)_os_log_fmt_compose_format_copy((_BYTE *)&v28 - v12, *v14, *(_WORD *)(a2 + 12));
  if ((*a3 & 0xF0) == 0x30) {
    return (_DWORD *)os_trace_blob_add_hexdump(a1, (uint64_t)a4, a5, a6);
  }
  if (*(_BYTE *)(a2 + 10) == 18) {
    v13[result - 1] = 115;
  }
  __int16 v22 = *(_WORD *)(a2 + 8);
  if ((v22 & 2) == 0)
  {
    unsigned int v23 = 0;
    if (a5) {
      goto LABEL_7;
    }
LABEL_10:
    if (a6) {
      a4 = (const char *)&unk_180123A61;
    }
    else {
      a4 = "(null)";
    }
    if ((v22 & 4) != 0)
    {
      unsigned int v24 = v23 + 1;
      *(&v28 + v23) = 0x7FFFFFFF;
    }

    else
    {
      unsigned int v24 = v23;
    }

    goto LABEL_21;
  }

  int v28 = *(_DWORD *)(a2 + 20);
  unsigned int v23 = 1;
  if (!a5) {
    goto LABEL_10;
  }
LABEL_7:
  if ((v22 & 8) != 0)
  {
    unsigned int v24 = v23 + 1;
    uint64_t v25 = v23;
    if ((v22 & 4) != 0)
    {
      unsigned int v26 = *(_DWORD *)(a2 + 24);
      if (v26 <= a5)
      {
        *(&v28 + v25) = v26;
        goto LABEL_21;
      }
    }

    else
    {
      unint64_t result = strrchr(v13, 46);
      *unint64_t result = 7547438;
    }

    *(&v28 + v25) = a5;
  }

  else
  {
    *(_DWORD *)&v13[result - 1] = 7547438;
    unsigned int v24 = v23 + 1;
    *(&v28 + v23) = a5;
  }

LABEL_21:
  switch(v24)
  {
    case 2u:
      unint64_t result = (_DWORD *)os_trace_blob_addf(a1, v13, v16, v17, v18, v19, v20, v21, v28);
      break;
    case 1u:
      HIBYTE(v27) = HIBYTE(a4);
      unint64_t result = (_DWORD *)os_trace_blob_addf(a1, v13, v16, v17, v18, v19, v20, v21, v28);
      break;
    case 0u:
      unint64_t result = (_DWORD *)os_trace_blob_addf(a1, v13, v16, v17, v18, v19, v20, v21, (char)a4);
      break;
  }

  if (a6) {
    return (_DWORD *)os_trace_blob_addns(a1, "<…>", 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }
  return result;
}

  *a4 = 0LL;
  uint64_t v12 = 0LL;
  *__error() = v10;
  return (uint64_t)v12;
}

uint64_t _os_log_fmt_compose_format_copy(_BYTE *a1, void *__s, unsigned __int16 a3)
{
  unsigned __int16 v3 = a3;
  size_t v6 = a3;
  unint64_t v7 = memchr(__s, 125, a3);
  if (v7)
  {
    v3 += (_WORD)__s - (_WORD)v7;
    size_t v6 = v3;
    memcpy(a1, v7, v3);
    *a1 = 37;
  }

  else
  {
    memcpy(a1, __s, v6);
  }

  a1[v6] = 0;
  return v3;
}

uint64_t _os_log_fmt_builtin_BOOL(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, char *a5, uint64_t a6)
{
  if (!_os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 1))
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v11, v12, v13);
    return 1LL;
  }

  uint64_t scalar = os_log_fmt_read_scalar(a3, a5, a6);
  __int16 v15 = *(_WORD *)(a1 + 20);
  if (**(_BYTE **)(a3 + 40) == 66)
  {
    if (scalar) {
      uint64_t v16 = "YES";
    }
    else {
      uint64_t v16 = "NO";
    }
    if (scalar) {
      size_t v17 = 3LL;
    }
    else {
      size_t v17 = 2LL;
    }
    if ((v15 & 2) != 0) {
      return 1LL;
    }
LABEL_18:
    uint64_t v18 = *(unsigned int *)(a1 + 8);
    if (v17 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v18 - 1))
    {
      os_trace_blob_add_slow(a1, v16, v17);
    }

    else
    {
      memcpy((void *)(*(void *)a1 + v18), v16, v17);
      unsigned int v19 = *(_DWORD *)(a1 + 8) + v17;
      *(_DWORD *)(a1 + 8) = v19;
      if (!*(_BYTE *)(a1 + 22)) {
        *(_BYTE *)(*(void *)a1 + v19) = 0;
      }
    }

    return 1LL;
  }

  if (scalar) {
    uint64_t v16 = "true";
  }
  else {
    uint64_t v16 = "false";
  }
  if (scalar) {
    size_t v17 = 4LL;
  }
  else {
    size_t v17 = 5LL;
  }
  if ((v15 & 2) == 0) {
    goto LABEL_18;
  }
  return 1LL;
}

uint64_t _os_log_fmt_builtin_bitrate(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, char *a5, uint64_t a6)
{
  return 1LL;
}

uint64_t _os_log_fmt_builtin_bytes(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, char *a5, uint64_t a6)
{
  return 1LL;
}

uint64_t _os_log_fmt_builtin_darwin_errno(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, int *a5, uint64_t a6)
{
  BOOL is_integer = _os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0);
  if ((_DWORD)a6 == 4 && is_integer)
  {
    int v18 = *a5;
    if (*a5)
    {
      strerror(*a5);
      os_trace_blob_addf(a1, "[%d: %s]", v19, v20, v21, v22, v23, v24, v18);
    }

    else
    {
      os_trace_blob_addf(a1, "[%d: %s]", v12, v13, v14, v15, v16, v17, 0);
    }
  }

  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v15, v16, v17);
  }

  return 1LL;
}

uint64_t _os_log_fmt_builtin_darwin_mode( uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, unsigned int *a5, uint64_t a6)
{
  uint64_t v31 = *MEMORY[0x1895FEE08];
  BOOL is_integer = _os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0);
  if ((_DWORD)a6 == 4 && is_integer)
  {
    unsigned int v15 = *a5;
    __src[0] = aPcDBLSW[(unsigned __int16)*a5 >> 12];
    if ((v15 & 0x40) != 0) {
      __int8 v16 = 120;
    }
    else {
      __int8 v16 = 45;
    }
    if ((v15 & 0x40) != 0) {
      __int8 v17 = 115;
    }
    else {
      __int8 v17 = 83;
    }
    if ((v15 & 8) != 0) {
      __int8 v18 = 120;
    }
    else {
      __int8 v18 = 45;
    }
    if ((v15 & 8) != 0) {
      __int8 v19 = 115;
    }
    else {
      __int8 v19 = 83;
    }
    int8x16_t v20 = (int8x16_t)vdupq_n_s32(v15);
    v21.i16[0] = 11565;
    v21.i8[3] = 45;
    v21.i8[4] = 45;
    v21.i16[3] = 11565;
    v21.i8[2] = v16;
    v21.i8[5] = v18;
    v22.i16[0] = 30578;
    v22.i8[2] = v17;
    v22.i8[3] = 114;
    v22.i8[4] = 119;
    v22.i8[5] = v19;
    v22.i16[3] = 30578;
    *(int8x8_t *)&__src[1] = vbsl_s8( vmovn_s16( vuzp1q_s16( (int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v20, (int8x16_t)xmmword_1801240B0)),  (int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v20, (int8x16_t)xmmword_1801240C0)))),  v21,  v22);
    if ((v15 & 1) != 0) {
      char v23 = 120;
    }
    else {
      char v23 = 45;
    }
    if ((v15 & 1) != 0) {
      char v24 = 116;
    }
    else {
      char v24 = 84;
    }
    if ((v15 & 0x200) != 0) {
      char v25 = v24;
    }
    else {
      char v25 = v23;
    }
    char __src[9] = v25;
    if ((*(_BYTE *)(a1 + 20) & 2) == 0)
    {
      uint64_t v26 = *(unsigned int *)(a1 + 8);
      if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v26 - 1) <= 9)
      {
        os_trace_blob_add_slow(a1, __src, 0xAuLL);
      }

      else
      {
        uint64_t v27 = *(void *)a1 + v26;
        *(void *)uint64_t v27 = *(void *)__src;
        *(_WORD *)(v27 + 8) = *(_WORD *)&__src[8];
        unsigned int v28 = *(_DWORD *)(a1 + 8) + 10;
        *(_DWORD *)(a1 + 8) = v28;
        if (!*(_BYTE *)(a1 + 22)) {
          *(_BYTE *)(*(void *)a1 + v28) = 0;
        }
      }
    }
  }

  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v12, v13, v14);
  }

  return 1LL;
}

uint64_t _os_log_fmt_builtin_darwin_signal( uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, _DWORD *a5, uint64_t a6)
{
  BOOL is_integer = _os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0);
  if ((_DWORD)a6 == 4 && is_integer)
  {
    uint64_t v18 = *a5;
    else {
      os_trace_blob_addf(a1, "[%d: Unknown signal]", v12, v13, v14, v15, v16, v17, *a5);
    }
  }

  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v15, v16, v17);
  }

  return 1LL;
}

uint64_t _os_log_fmt_builtin_iec_bitrate(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, char *a5, uint64_t a6)
{
  return 1LL;
}

uint64_t _os_log_fmt_builtin_iec_bytes(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, char *a5, uint64_t a6)
{
  return 1LL;
}

uint64_t _os_log_fmt_builtin_mach_errno( uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, kern_return_t *a5, uint64_t a6)
{
  kern_return_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL is_integer = _os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0);
  if ((_DWORD)a6 == 4 && is_integer)
  {
    uint64_t v15 = *a5;
    else {
      bootstrap_strerror(*a5);
    }
    os_trace_blob_addf(a1, "[%#x: %s]", v16, v17, v18, v19, v20, v21, v15);
  }

  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v12, v13, v14);
  }

  return 1LL;
}

uint64_t _os_log_fmt_builtin_trace_mode(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, int *a5, uint64_t a6)
{
  BOOL is_integer = _os_log_fmt_spec_is_integer(*(_BYTE *)(a3 + 10), 0);
  if ((_DWORD)a6 != 4 || !is_integer)
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v15, v16, v17);
    return 1LL;
  }

  int v18 = *a5;
  os_trace_blob_addf(a1, "0x%X", v12, v13, v14, v15, v16, v17, *a5);
  uint64_t v19 = 0LL;
  char v20 = 1;
  do
  {
    if ((_os_log_fmt_builtin_trace_mode_masks[v19] & v18) == 0) {
      goto LABEL_20;
    }
    if ((v20 & 1) != 0) {
      int8x8_t v21 = "(";
    }
    else {
      int8x8_t v21 = ", ";
    }
    if ((v20 & 1) != 0) {
      size_t v22 = 3LL;
    }
    else {
      size_t v22 = 2LL;
    }
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      uint64_t v23 = *(unsigned int *)(a1 + 8);
      if (v22 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v23 - 1))
      {
        os_trace_blob_add_slow(a1, v21, v22);
      }

      else
      {
        memcpy((void *)(*(void *)a1 + v23), v21, v22);
        unsigned int v24 = *(_DWORD *)(a1 + 8) + v22;
        *(_DWORD *)(a1 + 8) = v24;
        if (!*(_BYTE *)(a1 + 22)) {
          *(_BYTE *)(*(void *)a1 + v24) = 0;
        }
      }
    }

    char v25 = *(char **)&_os_log_fmt_builtin_trace_mode_masks[v19 + 2];
    unint64_t v26 = strlen(v25);
    if ((*(_WORD *)(a1 + 20) & 2) != 0) {
      goto LABEL_18;
    }
    int v27 = v26;
    uint64_t v28 = *(unsigned int *)(a1 + 8);
    if (v26 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v28 - 1))
    {
      os_trace_blob_add_slow(a1, v25, v26);
LABEL_18:
      char v20 = 0;
      goto LABEL_20;
    }

    memcpy((void *)(*(void *)a1 + v28), v25, v26);
    unsigned int v29 = *(_DWORD *)(a1 + 8) + v27;
    *(_DWORD *)(a1 + 8) = v29;
    char v20 = *(_BYTE *)(a1 + 22);
    if (v20) {
      goto LABEL_18;
    }
    *(_BYTE *)(*(void *)a1 + v29) = 0;
LABEL_20:
    v19 += 4LL;
  }

  while (v19 != 28);
  if ((v20 & 1) == 0 && (*(_WORD *)(a1 + 20) & 2) == 0)
  {
    uint64_t v30 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v30 - 1) <= 1)
    {
      os_trace_blob_add_slow(a1, ")", 2uLL);
    }

    else
    {
      *(_WORD *)(*(void *)a1 + v30) = 10528;
      unsigned int v31 = *(_DWORD *)(a1 + 8) + 2;
      *(_DWORD *)(a1 + 8) = v31;
      if (!*(_BYTE *)(a1 + 22)) {
        *(_BYTE *)(*(void *)a1 + v31) = 0;
      }
    }
  }

  return 1LL;
}

uint64_t _os_log_fmt_builtin_time(tm *a1, uint64_t a2, uint64_t a3, _BYTE *a4, time_t *a5, uint64_t a6)
{
  if ((_DWORD)a6 == 4)
  {
    time_t v14 = *(int *)a5;
    goto LABEL_6;
  }

  if ((_DWORD)a6 != 8)
  {
LABEL_8:
    _os_log_fmt_decode_cmd_mismatch((uint64_t)a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v11, v12, v13);
    return 1LL;
  }

  time_t v14 = *a5;
LABEL_6:
  os_trace_blob_add_localtime(a1, v14, 0, 3u);
  return 1LL;
}

uint64_t _os_log_fmt_builtin_timespec( tm *a1, uint64_t a2, uint64_t a3, _BYTE *a4, time_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a3 + 10) == 19 && a6 <= 0x10 && ((_DWORD)a6 == 16 || (a7 & 1) != 0))
  {
    if ((_DWORD)a6 != 16 && (_DWORD)a7) {
      _os_log_fmt_decode_error((size_t)a1);
    }
    else {
      os_trace_blob_add_localtime(a1, *a5, a5[1], 0);
    }
  }

  else
  {
    _os_log_fmt_decode_cmd_mismatch((uint64_t)a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, a6, a7, a8);
  }

  return 1LL;
}

uint64_t _os_log_fmt_builtin_timeval( tm *a1, uint64_t a2, uint64_t a3, _BYTE *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_BYTE *)(a3 + 10) == 19 && a6 <= 0x10 && ((_DWORD)a6 == 16 || (a7 & 1) != 0))
  {
    if ((_DWORD)a6 != 16 && (_DWORD)a7) {
      _os_log_fmt_decode_error((size_t)a1);
    }
    else {
      os_trace_blob_add_localtime(a1, *(void *)a5, *(_DWORD *)(a5 + 8), 1u);
    }
  }

  else
  {
    _os_log_fmt_decode_cmd_mismatch((uint64_t)a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, a6, a7, a8);
  }

  return 1LL;
}

uint64_t _os_log_fmt_builtin_uuid_t( size_t a1, int a2, uint64_t a3, _BYTE *a4, unsigned __int8 *uu, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  if (*(_BYTE *)(a3 + 10) == 19 && a6 <= 0x10 && ((_DWORD)a6 == 16 || (a7 & 1) != 0))
  {
    if ((_DWORD)a6 != 16 && (_DWORD)a7)
    {
      _os_log_fmt_decode_error(a1);
    }

    else
    {
      uuid_unparse_upper(uu, out);
      unint64_t v9 = strlen(out);
      if ((*(_WORD *)(a1 + 20) & 2) == 0)
      {
        int v10 = v9;
        uint64_t v11 = *(unsigned int *)(a1 + 8);
        if (v9 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v11 - 1))
        {
          os_trace_blob_add_slow(a1, out, v9);
        }

        else
        {
          memcpy((void *)(*(void *)a1 + v11), out, v9);
          unsigned int v12 = *(_DWORD *)(a1 + 8) + v10;
          *(_DWORD *)(a1 + 8) = v12;
          if (!*(_BYTE *)(a1 + 22)) {
            *(_BYTE *)(*(void *)a1 + v12) = 0;
          }
        }
      }
    }
  }

  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, a6, a7, a8);
  }

  return 1LL;
}

BOOL _os_log_fmt_spec_is_integer(unsigned __int8 a1, int a2)
{
  int v2 = a2 ^ 1;
  if (v2) {
    return a1 - 1 < 0xC;
  }
  else {
    return a1 == 13;
  }
}

uint64_t _os_log_fmt_builtin_scaled( uint64_t a1, unsigned int a2, uint64_t a3, _BYTE *a4, char *a5, uint64_t a6, void *a7)
{
  unint64_t scalar = os_log_fmt_read_scalar(a3, a5, a6);
  double v24 = 0.0;
  int v25 = 0;
  if (*a7 && a7[1] && scalar >= 0x3E8)
  {
    int v25 = 0;
    do
    {
      int v26 = scalar;
      uint64_t v27 = a7[v25 + 2];
      ++v25;
      scalar /= a2;
    }

    while (v27 && scalar > 0x3E7);
    double v24 = (double)(v26 - scalar * a2) * 100.0;
  }

  unsigned int v28 = vcvtad_u64_f64(v24 / (double)a2);
  if (v28 == 100) {
    unint64_t v29 = scalar + 1;
  }
  else {
    unint64_t v29 = scalar;
  }
  if (v28 == 100) {
    unsigned int v28 = 0;
  }
  if (!v25) {
    return os_trace_blob_addf(a1, "%llu %s", v18, v19, v20, v21, v22, v23, v29);
  }
  if (v29 <= 9 && -10 * (v28 / 0xA) != -v28) {
    return os_trace_blob_addf(a1, "%llu.%02u %s", v18, v19, v20, v21, v22, v23, v29);
  }
  if (v28 && v29 <= 0x63) {
    return os_trace_blob_addf(a1, "%llu.%01u %s", v18, v19, v20, v21, v22, v23, v29);
  }
  else {
    return os_trace_blob_addf(a1, "%llu %s", v18, v19, v20, v21, v22, v23, v29);
  }
}

uint64_t _os_trace_sysprefsdir_path()
{
  if (_os_trace_paths_init_once != -1) {
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_203);
  }
  return _os_trace_system_preferences_path;
}

void ___os_trace_paths_init_block_invoke()
{
  _os_trace_system_preferences_path = (uint64_t)"/System/Library/Preferences/Logging";
  _os_trace_os_cryptex_system_preferences_path = (uint64_t)"/System/Cryptexes/OS/System/Library/Preferences/Logging";
  _os_trace_app_cryptex_system_preferences_path = (uint64_t)"/System/Cryptexes/App/System/Library/Preferences/Logging";
  _os_trace_internal_preferences_path = (uint64_t)"/AppleInternal/Library/Preferences/Logging";
  _os_trace_preferences_path = (uint64_t)"/Library/Preferences/Logging";
}

uint64_t _os_trace_os_cryptex_sysprefsdir_path()
{
  if (_os_trace_paths_init_once != -1) {
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_203);
  }
  return _os_trace_os_cryptex_system_preferences_path;
}

uint64_t _os_trace_app_cryptex_sysprefsdir_path()
{
  if (_os_trace_paths_init_once != -1) {
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_203);
  }
  return _os_trace_app_cryptex_system_preferences_path;
}

uint64_t _os_trace_intprefsdir_path()
{
  if (_os_trace_paths_init_once != -1) {
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_203);
  }
  return _os_trace_internal_preferences_path;
}

uint64_t _os_trace_prefsdir_path()
{
  if (_os_trace_paths_init_once != -1) {
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_203);
  }
  return _os_trace_preferences_path;
}

void _os_log_preferences_merge(void *a1, xpc_object_t xdict, char *a3)
{
  if (a3)
  {
    _os_log_preferences_merge_category(a1, xdict, "DEFAULT-OPTIONS");
    _os_log_preferences_merge_category(a1, xdict, a3);
  }

  else
  {
    v6[0] = MEMORY[0x1895FED80];
    v6[1] = 0x40000000LL;
    v6[2] = ___os_log_preferences_merge_block_invoke;
    v6[3] = &__block_descriptor_tmp_214;
    v6[4] = a1;
    v6[5] = xdict;
    xpc_dictionary_apply(xdict, v6);
  }

void _os_log_preferences_merge_category(void *a1, xpc_object_t xdict, char *key)
{
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(xdict, key);
  if (dictionary)
  {
    size_t v6 = dictionary;
    xpc_object_t v7 = xpc_dictionary_get_dictionary(a1, key);
    if (v7) {
      _os_log_preferences_apply_overrides(v7, v6);
    }
    else {
      xpc_dictionary_set_value(a1, key, v6);
    }
  }

uint64_t ___os_log_preferences_merge_block_invoke(uint64_t a1, char *key)
{
  return 1LL;
}

uint64_t _os_log_preferences_apply_overrides(void *a1, void *a2)
{
  if (a1 == a2)
  {
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
  }

  else
  {
    uint64_t result = (uint64_t)object_getClass(a1);
    if (a2)
    {
      uint64_t v5 = MEMORY[0x189600980];
      if (result == MEMORY[0x189600980])
      {
        uint64_t result = (uint64_t)object_getClass(a2);
        if (result == v5)
        {
          applier[0] = MEMORY[0x1895FED80];
          applier[1] = 0x40000000LL;
          applier[2] = ___os_log_preferences_apply_overrides_block_invoke;
          applier[3] = &__block_descriptor_tmp_32_216;
          applier[4] = a1;
          return xpc_dictionary_apply(a2, applier);
        }
      }
    }
  }

  return result;
}

uint64_t ___os_log_preferences_apply_overrides_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  xpc_object_t value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), a2);
  if (!value) {
    goto LABEL_5;
  }
  xpc_object_t v7 = value;
  if (object_getClass(value) == (Class)MEMORY[0x189600980])
  {
    _os_log_preferences_apply_overrides(v7, a3);
    return 1LL;
  }

  if (object_getClass(a3) != (Class)MEMORY[0x1896009B8]
    || (string_ptr = xpc_string_get_string_ptr(a3), strcasecmp(string_ptr, "inherit")))
  {
LABEL_5:
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  }

  return 1LL;
}

void *_os_log_preferences_load_sysprefs(const char *a1, char *a2)
{
  uint64_t v9 = *MEMORY[0x1895FEE08];
  base_sysprefs_file = (void *)_os_log_preferences_load_base_sysprefs_file(__str, a1);
  if ((MEMORY[0xFFFFFC104] & 0x80000000) == 0 && (MEMORY[0xFFFFFC104] & 0x10000000) != 0)
  {
    if (_os_trace_paths_init_once != -1) {
      dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_203);
    }
    snprintf(__str, 0x400uLL, "%s/%s/%s.plist", (const char *)_os_trace_internal_preferences_path, "Subsystems", a1);
    plist_at = _os_trace_read_plist_at(-2, __str);
    if (plist_at)
    {
      size_t v6 = plist_at;
      if (base_sysprefs_file)
      {
        _os_log_preferences_merge(base_sysprefs_file, plist_at, a2);
        xpc_release(v6);
      }

      else
      {
        return plist_at;
      }
    }
  }

  return base_sysprefs_file;
}

uint64_t _os_log_preferences_load_base_sysprefs_file(char *__str, const char *a2)
{
  if (_os_trace_paths_init_once != -1) {
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_203);
  }
  snprintf(__str, 0x400uLL, "%s/%s/%s.plist", (const char *)_os_trace_system_preferences_path, "Subsystems", a2);
  return _os_trace_read_plist_at(4294967294LL, __str);
}

void *_os_log_preferences_load(const char *a1, char *a2)
{
  uint64_t v12 = *MEMORY[0x1895FEE08];
  base_sysprefs_file = (void *)_os_log_preferences_load_base_sysprefs_file(__str, a1);
  if ((MEMORY[0xFFFFFC104] & 0x80000000) == 0 && (MEMORY[0xFFFFFC104] & 0x10000000) != 0)
  {
    if (_os_trace_paths_init_once != -1) {
      dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_203);
    }
    snprintf(__str, 0x400uLL, "%s/%s/%s.plist", (const char *)_os_trace_internal_preferences_path, "Subsystems", a1);
    plist_at = (void *)_os_trace_read_plist_at(4294967294LL, __str);
  }

  else
  {
    plist_at = 0LL;
  }

  if (_os_trace_paths_init_once != -1) {
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_203);
  }
  snprintf(__str, 0x400uLL, "%s/%s/%s.plist", (const char *)_os_trace_preferences_path, "Subsystems", a1);
  size_t v6 = (void *)_os_trace_read_plist_at(4294967294LL, __str);
  if (qword_18C43B780)
  {
    xpc_object_t dictionary = xpc_dictionary_get_dictionary((xpc_object_t)qword_18C43B780, a1);
    if (dictionary)
    {
      xpc_object_t v8 = xpc_copy(dictionary);
      if (!v6) {
        goto LABEL_12;
      }
LABEL_16:
      if (v8)
      {
        _os_log_preferences_merge(v8, v6, a2);
        if (plist_at)
        {
LABEL_23:
          _os_log_preferences_merge(plist_at, v8, a2);
          uint64_t v9 = v8;
          goto LABEL_24;
        }

LABEL_18:
        uint64_t v9 = 0LL;
        if (base_sysprefs_file) {
          goto LABEL_25;
        }
        goto LABEL_19;
      }

      xpc_object_t v8 = v6;
LABEL_22:
      size_t v6 = 0LL;
      if (plist_at) {
        goto LABEL_23;
      }
      goto LABEL_18;
    }
  }

  xpc_object_t v8 = 0LL;
  if (v6) {
    goto LABEL_16;
  }
LABEL_12:
  if (v8) {
    goto LABEL_22;
  }
  if (!plist_at) {
    return base_sysprefs_file;
  }
  uint64_t v9 = 0LL;
  size_t v6 = 0LL;
LABEL_24:
  xpc_object_t v8 = plist_at;
  if (base_sysprefs_file)
  {
LABEL_25:
    _os_log_preferences_merge(base_sysprefs_file, v8, a2);
    xpc_release(v8);
    if (!v6) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }

  _os_assert_log();
  _os_crash();
  __break(1u);
}

LABEL_19:
  base_sysprefs_file = v8;
  if (v6) {
LABEL_26:
  }
    xpc_release(v6);
LABEL_27:
  if (v9) {
    xpc_release(v9);
  }
  return base_sysprefs_file;
}

      if (_os_log_hook)
      {
        if (_os_log_hook_level <= 1u)
        {
          if (_os_log_hook_level)
          {
            if (_os_log_hook_level == 1 && v2 != 2) {
              goto LABEL_78;
            }
          }

          else if ((v2 - 16) < 0xFFFFFFF1)
          {
            goto LABEL_78;
          }
        }

        else
        {
          if (_os_log_hook_level == 2) {
            goto LABEL_78;
          }
          if (_os_log_hook_level == 16)
          {
          }

          else if (_os_log_hook_level == 17 && v2 == 17)
          {
            goto LABEL_78;
          }
        }
      }

      uint64_t v11 = *((_DWORD *)oslog + 15) & 7;
      if (!v11) {
        uint64_t v11 = process_prefs_0 & 3;
      }
      if (v11 == 4)
      {
LABEL_36:
        LOBYTE(v8) = 0;
        return v8;
      }

      if (v2 == 2)
      {
        uint64_t v13 = v11 - 1;
        if (v13 < 3)
        {
          LOBYTE(v8) = (v13 & 7) == 2;
          return v8;
        }

        if ((dword_18C43B700 & 2) == 0 && (MEMORY[0xFFFFFC104] & 2) == 0) {
          return ((unint64_t)voucher_get_activity_id() >> 57) & 1;
        }
      }

      else if (v2 == 1)
      {
        uint64_t v12 = v11 - 1;
        if (v12 < 3)
        {
          LODWORD(v8) = (6u >> (v12 & 7)) & 1;
          return v8;
        }

        if ((dword_18C43B700 & 3) == 0 && (MEMORY[0xFFFFFC104] & 3) == 0)
        {
          LOBYTE(v8) = (voucher_get_activity_id() & 0x300000000000000LL) != 0;
          return v8;
        }
      }

    char *v4 = v3;
    do
      uint64_t v5 = __ldxr((unsigned int *)&dword_18C43B6E4);
    while (__stxr(v5 - 1, (unsigned int *)&dword_18C43B6E4));
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C43B6D0);
    _os_state_block_entry_free((uint64_t)v2);
  }

xpc_object_t _os_log_preferences_compute(void *a1, const char *a2, uint64_t a3)
{
  xpc_object_t v52 = 0LL;
  xpc_object_t v53 = 0LL;
  xpc_object_t v50 = 0LL;
  xpc_object_t v51 = 0LL;
  xpc_object_t v48 = 0LL;
  xpc_object_t v49 = 0LL;
  if (a1)
  {
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(a1, "DEFAULT-OPTIONS");
    xpc_object_t v52 = dictionary;
    if (dictionary)
    {
      xpc_object_t v7 = dictionary;
      xpc_object_t v48 = xpc_dictionary_get_dictionary(dictionary, "Level");
      xpc_object_t v50 = xpc_dictionary_get_dictionary(v7, "TTL");
    }

    if (a2)
    {
      xpc_object_t v8 = xpc_dictionary_get_dictionary(a1, a2);
      xpc_object_t v53 = v8;
      if (v8)
      {
        uint64_t v9 = v8;
        xpc_object_t v49 = xpc_dictionary_get_dictionary(v8, "Level");
        xpc_object_t v51 = xpc_dictionary_get_dictionary(v9, "TTL");
      }
    }
  }

  unsigned __int8 v10 = _os_log_preference_option_ttl((uint64_t)&v50, "Default");
  unsigned __int8 v11 = _os_log_preference_option_ttl((uint64_t)&v50, "Info");
  unsigned __int8 v12 = _os_log_preference_option_ttl((uint64_t)&v50, "Debug");
  char v45 = _os_log_preference_option(&v48, "Enable");
  char v44 = _os_log_preference_option(&v48, "Persist");
  uint64_t v13 = (objc_class *)MEMORY[0x189600960];
  xpc_object_t v43 = _os_log_preference_value((uint64_t)&v52, "Symptoms", MEMORY[0x189600960]);
  xpc_object_t v42 = _os_log_preference_value((uint64_t)&v52, "Enable-Oversize-Messages", v13);
  xpc_object_t v14 = _os_log_preference_value((uint64_t)&v52, "Default-Privacy-Setting", MEMORY[0x1896009B8]);
  unsigned __int8 v46 = v12;
  if (!v14) {
    goto LABEL_11;
  }
  string_ptr = xpc_string_get_string_ptr(v14);
  if (!strcasecmp(string_ptr, "Sensitive"))
  {
    int v16 = 6144;
  }

  else if (!strcasecmp(string_ptr, "Private"))
  {
    int v16 = 4096;
  }

  else
  {
    if (strcasecmp(string_ptr, "Public"))
    {
LABEL_11:
      int v41 = 0;
      goto LABEL_16;
    }

    int v16 = 2048;
  }

  int v41 = v16;
LABEL_16:
  xpc_object_t v17 = _os_log_preference_value((uint64_t)&v52, "Privacy-Enable-Level", MEMORY[0x1896009B8]);
  xpc_object_t v18 = (xpc_object_t)MEMORY[0x189600928];
  if (!v17)
  {
LABEL_20:
    int v20 = (_os_log_preference_value((uint64_t)&v52, "Enable-Private-Data", MEMORY[0x189600960]) == v18) << 14;
    goto LABEL_24;
  }

  uint64_t v19 = xpc_string_get_string_ptr(v17);
  if (!strcasecmp(v19, "Sensitive"))
  {
    int v20 = 24576;
  }

  else if (!strcasecmp(v19, "Private"))
  {
    int v20 = 0x4000;
  }

  else
  {
    if (strcasecmp(v19, "Public")) {
      goto LABEL_20;
    }
    int v20 = 0x2000;
  }

LABEL_24:
  int v40 = v20;
  xpc_object_t v21 = _os_log_preference_value((uint64_t)&v52, "Signpost-Scope", MEMORY[0x1896009B8]);
  if (!v21)
  {
LABEL_28:
    int v23 = 0x10000;
    goto LABEL_31;
  }

  uint64_t v22 = xpc_string_get_string_ptr(v21);
  if (!strcasecmp(v22, "Thread"))
  {
    int v23 = 0x8000;
  }

  else
  {
    if (!strcasecmp(v22, "Process") || strcasecmp(v22, "System")) {
      goto LABEL_28;
    }
    int v23 = 98304;
  }

  xpc_object_t result = __error();
  *xpc_object_t result = v2;
  return result;
}

xpc_object_t _os_log_preference_option_ttl(uint64_t a1, char *a2)
{
  xpc_object_t result = _os_log_preference_value(a1, a2, MEMORY[0x1896009A8]);
  if (result) {
    LOBYTE(result) = xpc_int64_get_value(result);
  }
  return (xpc_object_t)result;
}

uint64_t _os_log_preference_option(void **a1, const char *a2)
{
  uint64_t result = _os_log_option_for_key(a1[1], a2);
  if (!(_DWORD)result) {
    return _os_log_option_for_key(*a1, a2);
  }
  return result;
}

xpc_object_t _os_log_preference_value(uint64_t a1, char *key, objc_class *a3)
{
  size_t v6 = *(void **)(a1 + 8);
  if (!v6 || (xpc_object_t v7 = xpc_dictionary_get_value(v6, key)) == 0LL || (v8 = v7, object_getClass(v7) != a3))
  {
    if (*(void *)a1 && (xpc_object_t value = xpc_dictionary_get_value(*(xpc_object_t *)a1, key)) != 0LL)
    {
      xpc_object_t v10 = value;
      if (object_getClass(value) == a3) {
        return v10;
      }
      else {
        return 0LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v8;
}

uint64_t _os_log_option_for_key(void *a1, const char *a2)
{
  if (!a1) {
    return 0LL;
  }
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value) {
    return 0LL;
  }
  unsigned __int16 v3 = value;
  if (object_getClass(value) != (Class)MEMORY[0x1896009B8]) {
    return 0LL;
  }
  string_ptr = xpc_string_get_string_ptr(v3);
  if (!strcasecmp(string_ptr, "default")) {
    return 1LL;
  }
  size_t v6 = xpc_string_get_string_ptr(v3);
  if (!strcasecmp(v6, "info")) {
    return 2LL;
  }
  xpc_object_t v7 = xpc_string_get_string_ptr(v3);
  if (!strcasecmp(v7, "debug")) {
    return 3LL;
  }
  xpc_object_t v8 = xpc_string_get_string_ptr(v3);
  if (strcasecmp(v8, "off"))
  {
    uint64_t v9 = xpc_string_get_string_ptr(v3);
    if (strcasecmp(v9, "none")) {
      return 0LL;
    }
  }

  return 4LL;
}

void *_os_log_preferences_copy_cache(void *a1)
{
  *a1 = 0LL;
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0LL, (dispatch_function_t)_os_trace_init_slow);
  }
  if (dword_18C43B70C != -1) {
    _os_trace_prefs_and_mode_refresh_slow(dword_18C43B70C);
  }
  unsigned int v2 = dword_18C43B710;
  int v3 = dword_18C43B714;
  if (dword_18C43B714 != dword_18C43B710)
  {
    while (1)
    {
      unsigned int v9 = __ldxr((unsigned int *)&dword_18C43B714);
      if (v9 != v3) {
        break;
      }
      if (!__stxr(v2, (unsigned int *)&dword_18C43B714))
      {
        _os_log_preferences_refresh_process();
        goto LABEL_6;
      }
    }

    __clrex();
  }

int *_os_trace_prefs_and_mode_refresh_slow(int a1)
{
  int v1 = a1;
  uint64_t v12 = *MEMORY[0x1895FEE08];
  int out_token = a1;
  int v2 = *__error();
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW_APPROX);
  do
  {
    unint64_t v4 = __ldxr(&qword_18C43B6F8);
    if (v3 < v4)
    {
      __clrex();
      goto LABEL_20;
    }
  }

  while (__stxr(v3 + 1000000000, &qword_18C43B6F8));
  mach_port_name_t v5 = dword_18C43B708;
  while (!mach_msg(&msg, 67109122, 0, 0x6Cu, v5, 0, 0))
    _os_trace_mig_server(108LL, &msg);
  if (v1 == -2)
  {
    if (!notify_register_check("com.apple.system.logging.prefschanged", &out_token))
    {
      int v6 = out_token;
      while (1)
      {
        int v1 = __ldxr((unsigned int *)&dword_18C43B70C);
        if (v1 != -2) {
          break;
        }
        if (!__stxr(v6, (unsigned int *)&dword_18C43B70C))
        {
          int v1 = v6;
          if (v6 < 0) {
            goto LABEL_20;
          }
          goto LABEL_17;
        }
      }

      __clrex();
      notify_cancel(v6);
      int out_token = v1;
      if ((v1 & 0x80000000) == 0) {
        goto LABEL_17;
      }
    }
  }

  else
  {
LABEL_17:
    if (!notify_check(v1, (int *)&msg) && msg.msgh_bits)
    {
      do
        unsigned int v7 = __ldxr((unsigned int *)&dword_18C43B710);
      while (__stxr(v7 + 1, (unsigned int *)&dword_18C43B710));
    }
  }

LABEL_20:
  if ((byte_18C43B774 & 1) == 0 && _dispatch_is_multithreaded())
  {
    do
      unsigned __int8 v8 = __ldxr((unsigned __int8 *)&byte_18C43B774);
    while (__stxr(1u, (unsigned __int8 *)&byte_18C43B774));
    if ((v8 & 1) == 0) {
      _os_log_watch_for_prefchanges();
    }
  }

  uint64_t result = __error();
  *uint64_t result = v2;
  return result;
}

void _os_log_preferences_refresh_process()
{
  uint64_t v17 = *MEMORY[0x1895FEE08];
  if ((dword_18C43B700 & 0x100) == 0 && (MEMORY[0xFFFFFC104] & 0x100) == 0)
  {
    int v0 = *__error();
    if (_os_trace_paths_init_once != -1) {
      dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_203);
    }
    snprintf(__str, 0x400uLL, "%s/%s.plist", (const char *)_os_trace_preferences_path, "com.apple.diagnosticd.filter");
    plist_at = _os_trace_read_plist_at(-2, __str);
    if (plist_at)
    {
      int v2 = plist_at;
      xpc_object_t dictionary = 0LL;
      xpc_object_t v11 = 0LL;
      uint64_t proc_path = _os_log_get_proc_path();
      uint64_t v13 = v3;
      pid_t v14 = getpid();
      uid_t v15 = geteuid();
      v9[0] = 0LL;
      v9[1] = 0LL;
      int64_t int64 = xpc_dictionary_get_int64(v2, "global");
      v9[0] |= int64;
      HIDWORD(qword_18C43B768) = HIDWORD(v9[0]);
      dword_18C43B770 = WORD1(v9[0]);
      xpc_release(v2);
    }

    else
    {
      *(uint64_t *)((char *)&qword_18C43B768 + 4) = 0x70000000BLL;
    }

    if (qword_18C43B788)
    {
      xpc_object_t dictionary = 0LL;
      xpc_object_t v11 = 0LL;
      if (_os_trace_paths_init_once != -1) {
        dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_203);
      }
      snprintf( __str,  0x400uLL,  "%s/%s/%s.plist",  (const char *)_os_trace_system_preferences_path,  "Processes",  (const char *)qword_18C43B788);
      mach_port_name_t v5 = _os_trace_read_plist_at(-2, __str);
      int v6 = v5;
      if (v5) {
        xpc_object_t dictionary = xpc_dictionary_get_dictionary(v5, "Level");
      }
      if (_os_trace_paths_init_once != -1) {
        dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_203);
      }
      snprintf( __str,  0x400uLL,  "%s/%s/%s.plist",  (const char *)_os_trace_preferences_path,  "Processes",  (const char *)qword_18C43B788);
      unsigned int v7 = _os_trace_read_plist_at(-2, __str);
      unsigned __int8 v8 = v7;
      if (v7) {
        xpc_object_t v11 = xpc_dictionary_get_dictionary(v7, "Level");
      }
      process_prefs_0 = process_prefs_0 & 0xFC | _os_log_preference_option(&dictionary, "Enable") & 3;
      process_prefs_0 = process_prefs_0 & 0xE3 | (4 * _os_log_preference_option(&dictionary, "Persist"));
      if (v8) {
        xpc_release(v8);
      }
      if (v6) {
        xpc_release(v6);
      }
    }

    *__error() = v0;
  }

uint64_t _os_log_preference_load_cache()
{
  uint64_t v4 = *MEMORY[0x1895FEE08];
  dword_18C43B724 = dword_18C43B710;
  int v0 = (vm_map_t *)MEMORY[0x1895FFD48];
  if (*((void *)&xmmword_18C43B728 + 1)) {
    mach_vm_deallocate(*MEMORY[0x1895FFD48], *((mach_vm_address_t *)&xmmword_18C43B728 + 1), xmmword_18C43B728);
  }
  logging_preferences = (_DWORD *)voucher_activity_get_logging_preferences();
  *((void *)&xmmword_18C43B728 + 1) = logging_preferences;
  if (logging_preferences && ((unint64_t)xmmword_18C43B728 < 4 || *logging_preferences != 6))
  {
    mach_vm_deallocate(*v0, (mach_vm_address_t)logging_preferences, xmmword_18C43B728);
    xmmword_18C43B728 = 0uLL;
  }

  if (_os_trace_paths_init_once != -1) {
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_203);
  }
  snprintf(__str, 0x400uLL, "%s/%s.plist", (const char *)_os_trace_preferences_path, "com.apple.diagnosticd.filter");
  if (qword_18C43B718)
  {
    xpc_release((xpc_object_t)qword_18C43B718);
    qword_18C43B718 = 0LL;
  }

  uint64_t result = _os_trace_read_plist_at(4294967294LL, __str);
  qword_18C43B718 = result;
  return result;
}

uint64_t _os_log_get_proc_path()
{
  uint64_t v0 = xmmword_18C43B738;
  if ((void)xmmword_18C43B738) {
    strrchr((const char *)xmmword_18C43B738, 47);
  }
  else {
    _os_assumes_log();
  }
  return v0;
}

BOOL _os_log_matches_filter(void *a1, uint64_t a2, uint64_t *a3)
{
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a1, "logicalExp");
  if (!dictionary)
  {
    BOOL v11 = _os_log_simple_filter_subtype_matches_string(a1, "subsystem", *(void *)a2, (uint64_t)a3);
    BOOL v12 = _os_log_simple_filter_subtype_matches_string(a1, "category", *(void *)(a2 + 8), (uint64_t)a3);
    BOOL v13 = _os_log_simple_filter_subtype_matches_string(a1, "processImagePath", *(void *)(a2 + 16), (uint64_t)a3);
    BOOL v14 = _os_log_simple_filter_subtype_matches_string(a1, "process", *(void *)(a2 + 24), (uint64_t)a3);
    BOOL v15 = _os_log_simple_filter_subtype_matches_number(a1, "pid", *(int *)(a2 + 32), -1LL, (uint64_t)a3);
    return _os_log_simple_filter_subtype_matches_number( a1,  "uid",  *(unsigned int *)(a2 + 36),  0xFFFFFFFFLL,  (uint64_t)a3)
        || v15
        || v14
        || v13
        || v12
        || v11;
  }

  unsigned int v7 = dictionary;
  xpc_object_t array = xpc_dictionary_get_array(dictionary, "subfilters");
  if (!array) {
    return 0LL;
  }
  unsigned int v9 = array;
  if (object_getClass(array) != (Class)MEMORY[0x189600958] || !xpc_array_get_count(v9)) {
    return 0LL;
  }
  xpc_object_t value = xpc_dictionary_get_value(v7, "operator");
  if (!value)
  {
    uint64_t v19 = 2LL;
    goto LABEL_14;
  }

  int64_t v18 = xpc_int64_get_value(value);
  uint64_t v19 = v18;
  if ((unint64_t)(v18 - 1) >= 2)
  {
    if (!v18 && xpc_array_get_count(v9) == 1)
    {
      uint64_t v19 = 0LL;
      goto LABEL_14;
    }

    return 0LL;
  }

uint64_t ___os_log_matches_logical_expression_filter_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = _os_log_matches_filter(a3, *(void *)(a1 + 56), *(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  uint64_t v5 = 48LL;
  if (v4) {
    uint64_t v5 = 40LL;
  }
  *(_BYTE *)(*(void *)(*(void *)(a1 + v5) + 8LL) + 24LL) = v4;
  return 1LL;
}

BOOL _os_log_simple_filter_subtype_matches_string(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return 0LL;
  }
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a1, a2);
  if (!dictionary) {
    return 0LL;
  }
  uint64_t v10 = 0LL;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  char v13 = 0;
  applier[0] = MEMORY[0x1895FED80];
  applier[1] = 0x40000000LL;
  applier[2] = ___os_log_simple_filter_subtype_matches_string_block_invoke;
  applier[3] = &unk_189624AF8;
  applier[4] = &v10;
  void applier[5] = a3;
  applier[6] = a4;
  xpc_dictionary_apply(dictionary, applier);
  BOOL v7 = *((_BYTE *)v11 + 24) != 0;
  _Block_object_dispose(&v10, 8);
  return v7;
}

BOOL _os_log_simple_filter_subtype_matches_number( void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a3 == a4) {
    return 0LL;
  }
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a1, a2);
  if (!dictionary) {
    return 0LL;
  }
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  char v14 = 0;
  applier[0] = MEMORY[0x1895FED80];
  applier[1] = 0x40000000LL;
  applier[2] = ___os_log_simple_filter_subtype_matches_number_block_invoke;
  applier[3] = &unk_189624B20;
  applier[4] = &v11;
  void applier[5] = a3;
  applier[6] = a5;
  xpc_dictionary_apply(dictionary, applier);
  BOOL v8 = *((_BYTE *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t ___os_log_simple_filter_subtype_matches_number_block_invoke( void *a1, const char *a2, xpc_object_t xint)
{
  int64_t value = xpc_int64_get_value(xint);
  uint64_t v6 = a1[5];
  if (v6 == strtoul(a2, 0LL, 10))
  {
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 1;
    BOOL v7 = (void *)a1[6];
  }

  else
  {
    BOOL v7 = (void *)(a1[6] + 8LL);
  }

  *v7 |= value;
  return 1LL;
}

uint64_t ___os_log_simple_filter_subtype_matches_string_block_invoke( void *a1, const char *a2, xpc_object_t xint)
{
  int64_t value = xpc_int64_get_value(xint);
  uint64_t v6 = (const char *)a1[5];
  if ((value & 1) != 0)
  {
    if (!strcasestr(v6, a2)) {
      goto LABEL_3;
    }
LABEL_5:
    *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = 1;
    BOOL v7 = (void *)a1[6];
    goto LABEL_6;
  }

  if (!strcmp(v6, a2)) {
    goto LABEL_5;
  }
LABEL_3:
  BOOL v7 = (void *)(a1[6] + 8LL);
LABEL_6:
  *v7 |= value;
  return 1LL;
}

void _os_log_watch_for_prefchanges()
{
  uint64_t v0 = dispatch_queue_create_with_target_V2("com.apple.os.log.notify", 0LL, 0LL);
  uint32_t v1 = notify_register_dispatch("com.apple.system.logging.prefschanged", &out_token, v0, &__block_literal_global_278);
  dispatch_release(v0);
  if (!v1)
  {
    do
      int v2 = __ldxr((unsigned int *)&dword_18C43B70C);
    while (__stxr(0xFFFFFFFF, (unsigned int *)&dword_18C43B70C));
    int out_token = v2;
    if ((v2 & 0x80000000) == 0)
    {
      if (notify_check(v2, &check)) {
        BOOL v3 = 1;
      }
      else {
        BOOL v3 = check == 0;
      }
      if (!v3)
      {
        do
          unsigned int v4 = __ldxr((unsigned int *)&dword_18C43B710);
        while (__stxr(v4 + 1, (unsigned int *)&dword_18C43B710));
      }

      notify_cancel(out_token);
    }
  }

void ___os_log_watch_for_prefchanges_block_invoke()
{
  do
    unsigned int v0 = __ldxr((unsigned int *)&dword_18C43B710);
  while (__stxr(v0 + 1, (unsigned int *)&dword_18C43B710));
}

uint64_t os_log_set_client_type(uint64_t a1)
{
  if (pthread_is_threaded_np())
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_9;
  }

  uint64_t result = _dispatch_is_multithreaded();
  if ((_DWORD)result)
  {
LABEL_9:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_10;
  }

  if (_os_trace)
  {
LABEL_10:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_11;
  }

  if (dword_18C43B704)
  {
LABEL_11:
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
    return result;
  }

  if (a1 == 1) {
    byte_18C43B77B = 1;
  }
  return result;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  v27[1] = *MEMORY[0x1895FEE08];
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0LL, (dispatch_function_t)_os_trace_init_slow);
  }
  if (dword_18C43B70C != -1) {
    _os_trace_prefs_and_mode_refresh_slow(dword_18C43B70C);
  }
  unsigned int v4 = dword_18C43B710;
  int v5 = dword_18C43B714;
  if (dword_18C43B714 != dword_18C43B710)
  {
    while (1)
    {
      unsigned int v26 = __ldxr((unsigned int *)&dword_18C43B714);
      if (v26 != v5) {
        break;
      }
      if (!__stxr(v4, (unsigned int *)&dword_18C43B714))
      {
        _os_log_preferences_refresh_process();
        goto LABEL_6;
      }
    }

    __clrex();
  }

uint64_t _os_log_find(uint64_t a1)
{
  int v2 = (const void *)(a1 + 4);
  for (uint64_t i = _os_log_globals[os_simple_hash() & 0x3F]; i; uint64_t i = *(void *)(i + 16))
  {
    uint64_t v4 = *(void *)(i + 24);
    unsigned int v5 = *(unsigned __int16 *)(v4 + 2);
  }

  return i;
}

uint64_t _os_log_set_default_signpost_opts(const char *a1, uint64_t a2)
{
  uint64_t result = strcmp(a1, "DynamicTracing");
  if ((_DWORD)result)
  {
    uint64_t result = strcmp(a1, "DynamicStackTracing");
    if ((_DWORD)result) {
      return result;
    }
    unsigned int v5 = *(_DWORD *)(a2 + 4) & 0xFFCBFFFF | 0x100000;
  }

  else
  {
    unsigned int v5 = *(_DWORD *)(a2 + 4) & 0xFFFBFFFF;
  }

  *(_DWORD *)(a2 + 4) = v5;
  return result;
}

int *_os_log_preferences_refresh(uint64_t a1)
{
  int v2 = *__error();
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 24);
    if (v3)
    {
      uint64_t v4 = (char *)(v3 + 4);
      unsigned int v5 = (char *)(v3 + *(unsigned __int8 *)(v3 + 2) + 4);
      if (qword_18C43B780)
      {
        xpc_object_t dictionary = xpc_dictionary_get_dictionary((xpc_object_t)qword_18C43B780, v4);
        os_unfair_lock_lock_with_options();
        if (dictionary)
        {
LABEL_17:
          _os_log_stream_filter_refresh(a1);
          os_unfair_lock_unlock((os_unfair_lock_t)&dword_18C43B720);
          char v12 = _os_log_preferences_load(v4, v5);
          _os_log_preferences_compute(v12, v5, (uint64_t)&v15);
          if (v12) {
            xpc_release(v12);
          }
          goto LABEL_23;
        }
      }

      else
      {
        os_unfair_lock_lock_with_options();
      }

      if (byte_18C43B77B) {
        goto LABEL_17;
      }
      if (dword_18C43B724 != dword_18C43B710) {
        _os_log_preference_load_cache();
      }
      if (!*((void *)&xmmword_18C43B728 + 1)) {
        goto LABEL_17;
      }
      record_by_mach_port_name_t name = (unsigned int *)_os_log_preferences_cache_find_record_by_name( (unsigned int *)(*((void *)&xmmword_18C43B728 + 1) + 4LL),  xmmword_18C43B728 - 4,  v4);
      if (record_by_name)
      {
        size_t v8 = record_by_name;
        unsigned int v9 = record_by_name[1];
        if ((((_BYTE)v9 + 1) & 3) != 0) {
          uint64_t v10 = v9 - (((_BYTE)v9 + 1) & 3) + 5;
        }
        else {
          uint64_t v10 = v9 + 1;
        }
        uint64_t v11 = _os_log_preferences_cache_find_record_by_name( (unsigned int *)((char *)record_by_name + v10 + 20),  *record_by_name - v10 - 20,  v5);
        if (v11)
        {
          uint64_t v15 = *(void *)(v11 + 12);
LABEL_22:
          _os_log_stream_filter_refresh(a1);
          os_unfair_lock_unlock((os_unfair_lock_t)&dword_18C43B720);
LABEL_23:
          HIDWORD(v15) = HIDWORD(v15) & 0x83FFFFFF | (((*(_DWORD *)(a1 + 60) >> 26) & 0x1F) << 26);
          *(void *)(a1 + 56) = v15;
          goto LABEL_24;
        }

        uint64_t v13 = *(void *)(v8 + 3);
      }

      else
      {
        uint64_t v13 = 0x45000000000000LL;
      }

      uint64_t v15 = v13;
      _os_log_set_default_signpost_opts(v5, (uint64_t)&v15);
      goto LABEL_22;
    }
  }

uint64_t _os_log_preferences_cache_find_record_by_name(unsigned int *a1, unint64_t a2, char *__s)
{
  int v6 = strlen(__s);
  int v7 = os_simple_hash();
  uint64_t v8 = 0LL;
  uint64_t v22 = 0x2000000000LL;
  v13[0] = MEMORY[0x1895FED80];
  size_t v14 = ___os_log_preferences_cache_find_record_by_name_block_invoke;
  uint64_t v15 = &unk_189624B48;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v23 = 0LL;
  v13[1] = 0x40000000LL;
  int v18 = v7;
  int v19 = v6;
  int v16 = &v20;
  uint64_t v17 = __s;
  if (a2 >= 0x14)
  {
    do
    {
      unint64_t v9 = *a1;
      if (a2 < v9) {
        break;
      }
      uint64_t v10 = a1[1];
      if (v10 + 21 > v9) {
        break;
      }
      if (*((_BYTE *)a1 + v10 + 20)) {
        break;
      }
      uint64_t v11 = *a1;
      a1 = (unsigned int *)((char *)a1 + v11);
      a2 -= v11;
    }

    while (a2 > 0x13);
    uint64_t v8 = v21[3];
  }

  _Block_object_dispose(&v20, 8);
  return v8;
}

BOOL _os_log_stream_filter_refresh(BOOL result)
{
  uint64_t v1 = result;
  int v2 = (void *)qword_18C43B718;
  if (!qword_18C43B718) {
    goto LABEL_9;
  }
  uint64_t proc_path = _os_log_get_proc_path();
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = v5 + 4;
  if (!v5) {
    uint64_t v6 = 0LL;
  }
  v9[0] = v6;
  if (v5) {
    v5 += *(unsigned __int8 *)(v5 + 2) + 4LL;
  }
  v9[1] = v5;
  uint64_t v9[2] = proc_path;
  v9[3] = v4;
  pid_t v10 = getpid();
  uid_t v11 = geteuid();
  v8[0] = 0LL;
  v8[1] = 0LL;
  uint64_t result = _os_log_matches_filter(v2, (uint64_t)v9, v8);
  if (result)
  {
    if ((v8[0] & 0x40000) != 0)
    {
      if ((v8[0] & 0x200000000LL) != 0)
      {
        unsigned int v7 = *(_DWORD *)(v1 + 60) & 0xC7FFFFFF | 0x18000000;
      }

      else if ((v8[0] & 0x100000000LL) != 0)
      {
        unsigned int v7 = *(_DWORD *)(v1 + 60) & 0xC7FFFFFF | 0x10000000;
      }

      else if ((v8[0] & 0x800000000LL) != 0)
      {
        unsigned int v7 = *(_DWORD *)(v1 + 60) & 0xC7FFFFFF | 0x8000000;
      }

      else
      {
        unsigned int v7 = *(_DWORD *)(v1 + 60);
      }
    }

    else
    {
      unsigned int v7 = *(_DWORD *)(v1 + 60) & 0xC7FFFFFF | 0x20000000;
    }

    *(_DWORD *)(v1 + 60) = v7 & 0xBFFFFFFF | (((LODWORD(v8[0]) >> 19) & 1) << 30);
  }

  else
  {
LABEL_9:
    *(_DWORD *)(v1 + 60) &= 0x87FFFFFF;
  }

  return result;
}

BOOL ___os_log_preferences_cache_find_record_by_name_block_invoke(uint64_t a1, unsigned int *a2)
{
  if (a2[2] == *(_DWORD *)(a1 + 48))
  {
    size_t v4 = a2[1];
  }

  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) == 0LL;
}

os_log_t _os_log_create(void *dso, const char *subsystem, const char *category)
{
  return os_log_create(subsystem, category);
}

uint64_t os_log_errors_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t os_log_faults_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

uint64_t os_log_get_type(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 1);
}

BOOL os_log_is_debug_enabled(os_log_t log)
{
  return os_log_type_enabled(log, OS_LOG_TYPE_DEBUG);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  int v2 = type;
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0LL, (dispatch_function_t)_os_trace_init_slow);
  }
  refreshed = (int *)dword_18C43B70C;
  if (dword_18C43B70C != -1) {
    refreshed = _os_trace_prefs_and_mode_refresh_slow(dword_18C43B70C);
  }
  unsigned int v5 = dword_18C43B710;
  int v6 = dword_18C43B714;
  if (dword_18C43B714 != dword_18C43B710)
  {
    while (1)
    {
      unsigned int v14 = __ldxr((unsigned int *)&dword_18C43B714);
      if (v14 != v6) {
        break;
      }
      if (!__stxr(v5, (unsigned int *)&dword_18C43B714))
      {
        _os_log_preferences_refresh_process(refreshed);
        goto LABEL_6;
      }
    }

    __clrex();
  }

LABEL_78:
      LOBYTE(v8) = 1;
      return v8;
    }

    if (v2 > 15)
    {
    }

    else if (v2)
    {
      if (v2 == 1)
      {
        if ((qword_18C43B768 & 0x100000000LL) != 0) {
          goto LABEL_78;
        }
      }

      else if (v2 == 2 && (qword_18C43B768 & 0x200000000LL) != 0)
      {
        goto LABEL_78;
      }

      goto LABEL_56;
    }

    if ((qword_18C43B768 & 0x800000000LL) != 0) {
      goto LABEL_78;
    }
    goto LABEL_56;
  }

  return v8;
}

BOOL os_log_is_enabled(os_log_t log)
{
  return 1;
}

BOOL os_signpost_enabled(os_log_t log)
{
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0LL, (dispatch_function_t)_os_trace_init_slow);
  }
  if (dword_18C43B70C != -1) {
    _os_trace_prefs_and_mode_refresh_slow(dword_18C43B70C);
  }
  unsigned int v2 = dword_18C43B710;
  int v3 = dword_18C43B714;
  if (dword_18C43B714 != dword_18C43B710)
  {
    while (1)
    {
      unsigned int v7 = __ldxr((unsigned int *)&dword_18C43B714);
      if (v7 != v3) {
        break;
      }
      if (!__stxr(v2, (unsigned int *)&dword_18C43B714))
      {
        _os_log_preferences_refresh_process();
        goto LABEL_6;
      }
    }

    __clrex();
  }

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  if (!os_signpost_enabled(log)) {
    return 0LL;
  }
  if ((~*((_DWORD *)log + 15) & 0x18000) == 0) {
    return -1LL;
  }
  unint64_t v5 = os_signpost_id_make_with_pointer__os_signpost_slide;
  uint64_t __buf = os_signpost_id_make_with_pointer__os_signpost_slide;
  if (os_signpost_id_make_with_pointer__os_signpost_slide == -1LL)
  {
    _NSGetMachExecuteHeader();
    if (_dyld_get_image_slide())
    {
      arc4random_buf(&__buf, 8uLL);
      unint64_t v5 = __buf & ~*MEMORY[0x189600118];
      while (1)
      {
        unint64_t v6 = __ldxr(&os_signpost_id_make_with_pointer__os_signpost_slide);
        if (v6 != -1LL) {
          break;
        }
        if (!__stxr(v5, &os_signpost_id_make_with_pointer__os_signpost_slide))
        {
          int v7 = 1;
          goto LABEL_15;
        }
      }

      int v7 = 0;
      __clrex();
LABEL_15:
      if (!v7) {
        unint64_t v5 = v6;
      }
    }

    else
    {
      unint64_t v5 = 0LL;
      os_signpost_id_make_with_pointer__os_signpost_slide = 0LL;
    }
  }

  return (os_signpost_id_t)ptr + v5;
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  if (!os_signpost_enabled(log)) {
    return 0LL;
  }
  if ((~*((_DWORD *)log + 15) & 0x18000) == 0) {
    return voucher_activity_id_allocate();
  }
  do
    os_signpost_id_t result = __ldxr(&os_signpost_id_generate__os_signpost_id_next);
  while (__stxr(result + 1, &os_signpost_id_generate__os_signpost_id_next));
  return result;
}

const char *os_log_type_get_name(int a1)
{
  if (a1 <= 1)
  {
    if (!a1) {
      return "Default";
    }
    if (a1 == 1) {
      return "Info";
    }
  }

  else
  {
    switch(a1)
    {
      case 2:
        return "Debug";
      case 16:
        return "Error";
      case 17:
        return "Fault";
    }
  }

  os_signpost_id_t result = (const char *)_os_crash();
  __break(1u);
  return result;
}

char *os_log_copy_message_string(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  uint64_t v1 = *(char **)(a1 + 88);
  unsigned int v2 = *(unsigned __int8 **)(a1 + 96);
  if (!v2)
  {
    if (v1) {
      return strdup(*(const char **)(a1 + 88));
    }
LABEL_21:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_22;
  }

  unint64_t v3 = *(void *)(a1 + 104);
  if (v3 >= 0x10000)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_20;
  }

  unint64_t v4 = *(void *)(a1 + 120);
  if (v4 >= 0x10000)
  {
LABEL_20:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_21;
  }

  if ((unsigned __int16)*(void *)(a1 + 104))
  {
    uint64_t v5 = (uint64_t)(v2 + 2);
    LOWORD(v3) = v3 - 2;
    if (v2[1])
    {
      int v6 = 0;
      while ((unsigned __int16)v3 >= 2u)
      {
        unint64_t v7 = *(unsigned __int8 *)(v5 + 1) + 2LL;
        v5 += v7;
        LOWORD(v3) = v3 - v7;
      }

LABEL_22:
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
  }

  else
  {
    uint64_t v5 = 0LL;
    unsigned int v2 = (unsigned __int8 *)&os_log_fmt_extract_pubdata_empty_hdr;
  }

LABEL_15:
  v10[0] = &v14;
  v10[1] = 0x40000000000LL;
  __int16 v12 = 0;
  char v13 = 0;
  int v11 = 0x10000;
  if ((*(_DWORD *)(a1 + 80) & 1) != 0) {
    uint64_t v9 = 4LL;
  }
  else {
    uint64_t v9 = 8LL;
  }
  os_log_fmt_compose((size_t)v10, v1, 2LL, 3u, v9, v2, v5, (unsigned __int16)v3, *(void *)(a1 + 112), v4);
  return (char *)os_trace_blob_detach((uint64_t)v10, 0LL);
}

void *os_log_copy_decorated_message(int a1, uint64_t a2)
{
  uint64_t v33 = *MEMORY[0x1895FEE08];
  *(void *)&v32[0].tm_sec = &v32[0].tm_wday;
  *(void *)&v32[0].tm_hour = 0x40000000000LL;
  v32[0].tm_mon = 0;
  LOWORD(v32[0].tm_year) = 0;
  BYTE2(v32[0].tm_year) = 0;
  os_trace_blob_add_localtime(v32, *(void *)(a2 + 40), *(_DWORD *)(a2 + 48), 1u);
  char name = os_log_type_get_name(a1);
  os_trace_blob_addf((uint64_t)v32, " %s", v5, v6, v7, v8, v9, v10, name);
  LOBYTE(a1) = getprogname();
  getpid();
  os_trace_blob_addf((uint64_t)v32, " %s[%d:%llx]", v11, v12, v13, v14, v15, v16, a1);
  uint64_t v23 = *(void *)(a2 + 128);
  if (v23)
  {
    if (*(void *)(a2 + 136)
      || (os_trace_blob_addf((uint64_t)v32, "[%s]", v17, v18, v19, v20, v21, v22, *(void *)(a2 + 128)),
          (uint64_t v23 = *(void *)(a2 + 128)) != 0)
      && *(void *)(a2 + 136))
    {
      os_trace_blob_addf((uint64_t)v32, "[%s:%s]", v17, v18, v19, v20, v21, v22, v23);
    }
  }

  unsigned __int16 v24 = os_log_copy_message_string(a2);
  os_trace_blob_addf((uint64_t)v32, " %s\n", v25, v26, v27, v28, v29, v30, (char)v24);
  free(v24);
  return os_trace_blob_detach((uint64_t)v32, 0LL);
}

uint64_t os_log_compare_enablement(uint64_t a1, uint64_t a2)
{
  enablement_int64_t value = _os_log_get_enablement_value(a1);
  return enablement_value - _os_log_get_enablement_value(a2);
}

uint64_t _os_log_get_enablement_value(uint64_t result)
{
  if ((int)result > 1)
  {
    switch((_DWORD)result)
    {
      case 2:
        return 0LL;
      case 0x10:
        return 3LL;
      case 0x11:
        return 4LL;
    }

LABEL_12:
    os_signpost_id_t result = _os_crash();
    __break(1u);
    return result;
  }

  if (!(_DWORD)result) {
    return 2LL;
  }
  if ((_DWORD)result != 1) {
    goto LABEL_12;
  }
  return result;
}

unint64_t os_log_set_hook(unsigned __int8 a1, void *aBlock)
{
  return _os_log_set_hook_impl(a1, 0LL, aBlock);
}

unint64_t _os_log_set_hook_impl(unsigned __int8 a1, uint64_t a2, void *aBlock)
{
  if (!aBlock)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_15;
  }

  unint64_t v3 = aBlock;
  uint64_t v4 = a2;
  unsigned __int8 v5 = a1;
  if (_os_log_set_hook_impl_once != -1) {
LABEL_15:
  }
    dispatch_once(&_os_log_set_hook_impl_once, &__block_literal_global_78);
LABEL_3:
  int v6 = _os_log_hook_level;
  if (_os_log_hook_level)
  {
    enablement_int64_t value = _os_log_get_enablement_value(_os_log_hook_level);
  }

  do
  {
    int v8 = __ldxr((unsigned __int8 *)&_os_log_hook_level);
    if (v8 != v6)
    {
      __clrex();
      goto LABEL_3;
    }
  }

  while (__stxr(v5, (unsigned __int8 *)&_os_log_hook_level));
  do
    unint64_t v9 = __ldxr((unint64_t *)&_os_log_hook_params);
  while (__stxr(v9 | v4, (unint64_t *)&_os_log_hook_params));
  uint64_t v10 = _Block_copy(v3);
  do
    unint64_t v11 = __ldxr((unint64_t *)&_os_log_hook);
  while (__stxr((unint64_t)v10, (unint64_t *)&_os_log_hook));
  return v11;
}

uint64_t ___os_log_set_hook_impl_block_invoke()
{
  uint64_t result = pthread_key_create((pthread_key_t *)&_os_log_hook_thread_key, 0LL);
  if ((_DWORD)result)
  {
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
  }

  return result;
}

unint64_t os_log_set_fault_callback(unint64_t a1)
{
  if (!a1) {
    return _os_log_current_fault_callback;
  }
  do
    unint64_t result = __ldxr((unint64_t *)&_os_log_current_fault_callback);
  while (__stxr(a1, (unint64_t *)&_os_log_current_fault_callback));
  return result;
}

unint64_t os_log_set_test_callback(unint64_t a1)
{
  do
    unint64_t v1 = __ldxr(&_os_log_current_test_callback);
  while (__stxr(a1, &_os_log_current_test_callback));
  return v1;
}

void _os_log()
{
}

void _os_log_impl_flatten_and_send()
{
  uint64_t v8 = MEMORY[0x1895FE128]();
  LODWORD(v234) = v11;
  uint64_t v304 = *MEMORY[0x1895FEE08];
  v255 = &v293;
  uint64_t v256 = 0x40000000000LL;
  int v257 = 0;
  __int16 v258 = 0;
  char v259 = 1;
  v250 = &v292;
  uint64_t v251 = 0x40000000000LL;
  int v252 = 0;
  __int16 v253 = 0;
  char v254 = 1;
  v245 = &v291;
  *(void *)v246 = 0x40000000000LL;
  int v247 = 0;
  __int16 v248 = 0;
  char v249 = 1;
  if (!v12)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_517:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_518:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_519;
  }

  LODWORD(v15) = v13;
  if (v13 <= 1) {
    goto LABEL_517;
  }
  size_t v5 = v14;
  unint64_t v1 = v12;
  unsigned int v2 = v10;
  uint64_t v3 = v9;
  uint64_t v6 = v8;
  if ((v11 & 0x200000) != 0 || _os_get_logging_unreliable_for_current_thread() == 1)
  {
    *v1 |= 0x10u;
    LODWORD(v4) = 1;
  }

  else
  {
    LODWORD(v4) = 0;
  }

  unint64_t v16 = *(unsigned int *)(v3 + 60);
  uint64_t v211 = v7;
  if ((v4 & 1) != 0
    || !(*(_DWORD *)(v3 + 60) & 0x400 | byte_18C43B777 | byte_18C43B779))
  {
    uint64_t v17 = v1;
    if ((v234 & 0x100000) != 0) {
      char v18 = v4;
    }
    else {
      char v18 = 1;
    }
    if ((v18 & 1) != 0)
    {
      LOWORD(v1) = 1024;
      goto LABEL_16;
    }

    LODWORD(v1) = 2048;
  }

  else
  {
    uint64_t v17 = v1;
    LODWORD(v1) = 0x8000;
  }

  int v247 = (int)v1;
  int v252 = (int)v1;
  int v257 = (int)v1;
LABEL_16:
  char v19 = 0;
  unsigned int v229 = 3;
  char v20 = 1;
  if ((v16 & 0x6000) == 0x6000 || byte_18C43B777 || byte_18C43B778) {
    goto LABEL_28;
  }
  if ((dword_18C43B700 & 0x2000000) != 0 || (MEMORY[0xFFFFFC104] & 0x2000000) != 0)
  {
    char v19 = 0;
    int v21 = 3;
  }

  else
  {
    char v19 = 0;
    unsigned int v229 = 2;
    if ((v234 & 0x40000000) != 0 || (v16 & 0x6000) == 0x4000) {
      goto LABEL_28;
    }
    if ((dword_18C43B700 & 0x1000000) != 0 || (MEMORY[0xFFFFFC104] & 0x1000000) != 0)
    {
      char v19 = 0;
      int v21 = 2;
    }

    else
    {
      char v20 = 0;
      char v19 = 1;
      int v21 = 1;
    }
  }

  unsigned int v229 = v21;
LABEL_28:
  if ((v234 & 0x100000) != 0) {
    char v22 = v4;
  }
  else {
    char v22 = 1;
  }
  char v227 = v20;
  char v212 = v19;
  if ((v22 & 1) == 0) {
    goto LABEL_526;
  }
  while (2)
  {
    char v23 = *v17;
    uint64_t v0 = (unsigned __int16)v1;
    if ((*v17 & 3) == 0 && (unsigned __int16)v1 >= v15 && (v16 & 0x1000) == 0)
    {
      unint64_t v1 = v17;
      LOBYTE(v0) = v227;
      if ((v258 & 2) == 0)
      {
        if (v259 + HIDWORD(v256) - (int)v256 - 1 < v15)
        {
          os_trace_blob_add_slow((uint64_t)&v255, v17, v15);
        }

        else
        {
          memcpy((char *)v255 + v256, v17, v15);
          unsigned int v24 = v256 + v15;
          LODWORD(v256) = v256 + v15;
          if (!v259) {
            *((_BYTE *)v255 + v24) = 0;
          }
        }
      }

      goto LABEL_173;
    }

    LODWORD(v297) = (unsigned __int16)v234;
    int v25 = v256;
    uint64_t v224 = v256;
    if (!v259) {
      int v25 = v256 + 1;
    }
    if (v257)
    {
      unsigned int v26 = v257 - v25;
    }

    else
    {
      unsigned int v26 = HIDWORD(v256) - v25;
      if (!HIDWORD(v256)) {
        unsigned int v26 = 0;
      }
    }

    unint64_t v1 = v17;
    int v27 = v251;
    if (!v254) {
      int v27 = v251 + 1;
    }
    if (v252)
    {
      unsigned int v28 = v252 - v27;
    }

    else
    {
      unsigned int v28 = HIDWORD(v251) - v27;
      if (!HIDWORD(v251)) {
        unsigned int v28 = 0;
      }
    }

    int v29 = *(_DWORD *)v246;
    if (!v249) {
      int v29 = *(_DWORD *)v246 + 1;
    }
    if (v247)
    {
      unsigned int v30 = v247 - v29;
    }

    else
    {
      unsigned int v30 = *(_DWORD *)&v246[2] - v29;
      if (!*(_DWORD *)&v246[2]) {
        unsigned int v30 = 0;
      }
    }

    int v214 = v4;
    uint64_t v221 = v3;
    unsigned int v218 = v2;
    char v31 = privacy_opt2flags[(v16 >> 11) & 3];
    uint64_t v3 = v229;
    LOWORD(v294) = (32 * v229);
    if ((v23 & 0x10) != 0) {
      LOBYTE(v294) = (32 * v229) | 0x10;
    }
    size_t v209 = v5;
    uint64_t v216 = v6;
    if ((v258 & 2) == 0)
    {
      if ((~(_DWORD)v256 + v259 + HIDWORD(v256)) <= 1)
      {
        os_trace_blob_add_slow((uint64_t)&v255, &v294, 2uLL);
      }

      else
      {
        *(_WORD *)((char *)v255 + v256) = v294;
        unsigned int v32 = v256 + 2;
        LODWORD(v256) = v256 + 2;
        if (!v259) {
          *((_BYTE *)v255 + v32) = 0;
        }
      }
    }

    if (!v17[1]) {
      goto LABEL_172;
    }
    uint64_t v4 = 0LL;
    uint64_t v232 = 0LL;
    unsigned int v2 = 0;
    uint64_t v17 = (_BYTE *)(v0 - v224 - 2);
    size_t v5 = (size_t)(v1 + 2);
    int v222 = v31 & 0xF;
LABEL_68:
    uint64_t v6 = v5 + 2;
    LOWORD(v236) = *(_WORD *)v5;
    unsigned int v33 = (unsigned __int16)v236;
    unsigned int v34 = v236;
    if ((v236 & 7) == 0)
    {
      unsigned int v34 = v222 | v236;
      LOBYTE(v236) = v222 | v236;
    }

    uint64_t v15 = v33 >> 8;
    uint64_t v35 = v34 >> 4;
    switch((int)v35)
    {
      case 0:
        uint64_t v36 = (objc_class *)(v5 + 2);
        uint64_t v4 = v15;
        if ((v34 & 1) != 0) {
          goto LABEL_97;
        }
        goto LABEL_83;
      case 1:
        if ((_DWORD)v15 != 4) {
          goto LABEL_524;
        }
        uint64_t v4 = *(_DWORD *)v6 & ~(*(int *)v6 >> 31);
        unsigned int v34 = v34 & 0xF0 | 2;
        LOBYTE(v236) = v34;
        uint64_t v36 = (objc_class *)(v5 + 2);
        if ((v34 & 1) != 0) {
          goto LABEL_97;
        }
        goto LABEL_83;
      case 6:
        v34 &= 0xFu;
        LOBYTE(v236) = v34;
        LODWORD(v15) = 4;
        BYTE1(v236) = 4;
        uint64_t v36 = (objc_class *)&v297;
        uint64_t v4 = 4LL;
        if ((v34 & 1) != 0) {
          goto LABEL_97;
        }
        goto LABEL_83;
      case 7:
        if ((_DWORD)v15 == 8)
        {
          uint64_t v232 = *(void *)v6;
          goto LABEL_162;
        }

        _os_assert_log();
        _os_crash();
        __break(1u);
LABEL_523:
        _os_assert_log();
        _os_crash();
        __break(1u);
LABEL_524:
        _os_assert_log();
        _os_crash();
        __break(1u);
LABEL_525:
        _os_assert_log();
        _os_crash();
        __break(1u);
LABEL_526:
        LOWORD(v297) = 0;
        if ((_DWORD)v251)
        {
          _os_assert_log();
          _os_crash();
          __break(1u);
LABEL_588:
          os_trace_blob_add_slow((uint64_t)&v250, &v297, 2uLL);
          goto LABEL_531;
        }

        LODWORD(v234) = v234 | 0x80000;
        if ((v253 & 2) != 0) {
          goto LABEL_531;
        }
        *(_WORD *)v250 = 0;
        unsigned int v190 = v251 + 2;
        LODWORD(v251) = v251 + 2;
        if (!v254) {
          *((_BYTE *)v250 + v190) = 0;
        }
LABEL_531:
        v191 = (void **)os_log_backtrace_create_from_return_address(64LL, *(void *)(v6 + 32));
        os_log_backtrace_serialize_to_blob();
        free(*v191);
        free(v191);
        os_trace_blob_pwrite(v250, v251, 1);
        LOWORD(v1) = (_WORD)v1 - v251;
        unint64_t v16 = *(unsigned int *)(v3 + 60);
        continue;
      default:
        if ((_DWORD)v15 != 8) {
          goto LABEL_525;
        }
        uint64_t v36 = *(objc_class **)v6;
        LOBYTE(v294) = v294 | 2;
        if ((v34 & 1) != 0) {
          goto LABEL_97;
        }
LABEL_83:
        if ((unint64_t)(v34 >> 4) - 6 <= 0xFFFFFFFFFFFFFFFBLL)
        {
          unint64_t v37 = v15 + 2LL;
          BOOL v38 = (unint64_t)v17 >= v37;
          v17 -= v37;
          if (!v38) {
            goto LABEL_171;
          }
          ++BYTE1(v294);
          if ((v258 & 2) == 0)
          {
            if ((v259 + HIDWORD(v256) - v256 - 1) <= 1)
            {
              os_trace_blob_add_slow((uint64_t)&v255, &v236, 2uLL);
            }

            else
            {
              unsigned int v39 = (unsigned __int16)v236;
              *(_WORD *)((char *)v255 + v256) = (_WORD)v236;
              unsigned int v40 = v256 + 2;
              LODWORD(v256) = v256 + 2;
              LODWORD(v15) = v39 >> 8;
              if (!v259) {
                *((_BYTE *)v255 + v40) = 0;
              }
            }
          }

          if ((v258 & 2) == 0)
          {
            if (v259 + HIDWORD(v256) - (int)v256 - 1 < v15)
            {
              os_trace_blob_add_slow((uint64_t)&v255, v36, v15);
            }

            else
            {
              memcpy((char *)v255 + v256, v36, v15);
              unsigned int v41 = v256 + v15;
              LODWORD(v256) = v256 + v15;
              if (!v259) {
                *((_BYTE *)v255 + v41) = 0;
              }
            }
          }

          if (!v255) {
            goto LABEL_172;
          }
LABEL_162:
          ++v2;
          size_t v5 = v6 + *(unsigned __int8 *)(v5 + 1);
          goto LABEL_68;
        }

LABEL_97:
        BYTE1(v236) = 4;
        LODWORD(__src) = 0;
        BOOL v38 = (unint64_t)v17 >= 6;
        v17 -= 6;
        if (!v38)
        {
LABEL_171:
          LOBYTE(v294) = v294 | 0x80;
LABEL_172:
          *(_WORD *)((char *)v255 + v224) = v294;
          unsigned int v2 = v218;
          uint64_t v3 = v221;
          uint64_t v6 = v216;
          LODWORD(v4) = v214;
          size_t v5 = v209;
          LOBYTE(v0) = v227;
LABEL_173:
          int v62 = v251;
          int v63 = *(_DWORD *)v246;
          if ((v234 & 0x8000000) == 0)
          {
LABEL_174:
            unsigned int v64 = v62 + v63 + v256;
            if ((v234 & 0x100000) != 0) {
              int v65 = v4;
            }
            else {
              int v65 = 1;
            }
            if (v65) {
              unsigned int v66 = 1024;
            }
            else {
              unsigned int v66 = 2048;
            }
            if (v64 <= v66) {
              LODWORD(v36) = v234;
            }
            else {
              LODWORD(v36) = v234 | 0x2000000;
            }
            if (v63) {
              char v67 = v0;
            }
            else {
              char v67 = 1;
            }
            if ((v67 & 1) != 0 || (v248 & 4) != 0)
            {
              v236 = &v255;
              v237 = &v250;
              v238 = &v245;
              size_t v239 = v5;
              __int128 v240 = 0u;
              __int128 v241 = 0u;
              uint64_t v242 = 0LL;
              int v243 = (int)v36;
              char v244 = 0;
              int v215 = v4;
              uint64_t v221 = v3;
              if ((v36 & 0x800000) != 0)
              {
                *(void *)&__int128 v240 = os_log_fmt_extract_symptom((uint64_t)v1);
                *((void *)&v240 + 1) = v193;
              }

              unint64_t v69 = *(void *)(v6 + 24);
              unint64_t v68 = *(void *)(v6 + 32);
              unint64_t v70 = *(void *)(v6 + 40);
              if ((v36 & 0x400000) == 0)
              {
                if (off_18C43B6F0) {
                  uint64_t v71 = (unint64_t *)((char *)off_18C43B6F0 + 8);
                }
                else {
                  uint64_t v71 = 0LL;
                }
                uint64_t v217 = v6;
                if (_os_trace_dsc_load_addr > v69 || _os_trace_dsc_size + _os_trace_dsc_load_addr <= v69)
                {
                  if (*(_DWORD *)(v69 + 12) != 2)
                  {
                    if (off_18C43B6F0)
                    {
                      do
                      {
                        while (1)
                        {
                          unint64_t v81 = __ldxr(v71);
                          if (!(_DWORD)v81) {
                            break;
                          }
                          __clrex();
                          _os_trace_rwptr_rdlock_wait((uint64_t)v71);
                        }
                      }

                      while (__stxr(v81 + 0x200000000LL, v71));
                      unint64_t v84 = v71[1];
                      unint64_t v85 = *(unsigned __int16 *)(v84 + 10);
                      unint64_t v86 = (v69 >> *MEMORY[0x189600140]) % v85;
                      while (1)
                      {
                        unint64_t v87 = v84 + 16 * v86;
                        uint64_t v88 = *(void *)(v87 + 16);
                        if (v69 == v88) {
                          break;
                        }
                        if (v86 + 1 == v85) {
                          unint64_t v86 = 0LL;
                        }
                        else {
                          ++v86;
                        }
                        if (v88) {
                          BOOL v89 = v86 == (v69 >> *MEMORY[0x189600140]) % v85;
                        }
                        else {
                          BOOL v89 = 1;
                        }
                        if (v89)
                        {
                          v90 = 0LL;
                          goto LABEL_247;
                        }
                      }

                      v90 = *(_OWORD **)(v87 + 24);
LABEL_247:
                      unint64_t v98 = *(unsigned int *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
                      do
                      {
                        unint64_t v99 = __ldxr(v71);
                        unint64_t v100 = v99 - 0x200000000LL;
                        if (v100 == 0x100000000LL) {
                          unint64_t v100 = v98;
                        }
                      }

                      while (__stxr(v100, v71));
                      if (v100 == v98)
                      {
                        __dmb(9u);
                        _os_trace_rwptr_cleanup((uint64_t)v71);
                      }

                      v264 = v90;
                      if (v90)
                      {
                        unsigned int v261 = v68 - v69;
                        unint64_t v73 = (v68 - v69) >> 32;
                        __int16 v262 = (v68 - v69) >> 32;
                        unsigned int v79 = 20;
                        __int16 v263 = 20;
                        unsigned int v294 = v68 - v69;
                        v213 = (char *)v90;
                        __int128 v295 = *v90;
                        int v74 = 10;
                        unsigned int v72 = v68 - v69;
                        uint64_t v3 = v221;
                        goto LABEL_267;
                      }
                    }

                    else
                    {
                      v264 = 0LL;
                    }

                    unsigned int v261 = v68;
                    unint64_t v73 = HIDWORD(v68);
                    __int16 v262 = WORD2(v68);
                    int v74 = 8;
                    unsigned int v72 = v68;
                    uint64_t v3 = v221;
LABEL_266:
                    v213 = 0LL;
                    unsigned int v79 = 6;
                    __int16 v263 = 6;
                    unsigned int v294 = v261;
                    LOWORD(v295) = v262;
LABEL_267:
                    uint64_t v104 = v243 & 0x20000000;
                    if ((_DWORD)v104) {
                      unint64_t v105 = v68;
                    }
                    else {
                      unint64_t v105 = v70;
                    }
                    if (v105)
                    {
                      uint64_t v106 = 4 * v104;
                      uint64_t v107 = _os_trace_dsc_load_addr;
                      if (_os_trace_dsc_load_addr <= v69)
                      {
                        if (_os_trace_dsc_size + _os_trace_dsc_load_addr <= v69) {
                          uint64_t v107 = v69;
                        }
                        unint64_t v108 = v105 - v107;
                      }

                      else
                      {
                        unint64_t v108 = v105 - v69;
                      }

                      uint64_t v110 = v108 & 0x7FFFFFFF;
                      unint64_t v105 = v108 >> 31;
                      uint64_t v109 = v110 | v106;
                    }

                    else
                    {
                      uint64_t v109 = 0LL;
                    }

                    unint64_t v111 = v109 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)v105 << 32);
                    unint64_t v260 = v111;
                    if ((((unint64_t)(unsigned __int16)v105 << 32) & 0xFFFF00000000LL) != 0)
                    {
                      v74 |= 0x20u;
                      *(_WORD *)((char *)&v294 + v79) = WORD2(v111);
                      v79 += 2;
                    }

                    v112 = *(_WORD **)(v3 + 24);
                    if (v112)
                    {
                      v74 |= 0x200u;
                      *(_WORD *)((char *)&v294 + v79) = *v112;
                      v79 += 2;
                    }

                    char v219 = v2;
                    uint64_t v113 = v2 & 0x7F;
                    if ((_DWORD)v113 == 17)
                    {
                      v114 = (unsigned int *)(v3 + 44);
                    }

                    else
                    {
                      if ((_DWORD)v113 != 16) {
                        goto LABEL_287;
                      }
                      v114 = (unsigned int *)(v3 + 40);
                    }

                    do
                      unsigned int v2 = __ldxr(v114);
                    while (__stxr(v2 + 1, v114));
LABEL_287:
                    uint64_t v235 = v109;
                    unsigned int v223 = v72;
                    unsigned __int16 v225 = v73;
                    unsigned int v115 = *(_DWORD *)(v3 + 60);
                    int v116 = process_prefs_0 & 3;
                    if ((v115 & 7) != 0) {
                      int v116 = *(_DWORD *)(v3 + 60) & 7;
                    }
                    if (v116 == 4)
                    {
                      char v117 = 0;
LABEL_291:
                      int v118 = 255;
                      goto LABEL_387;
                    }

                    int v119 = (v115 >> 3) & 7;
                    if (v119) {
                      char v120 = v119;
                    }
                    else {
                      char v120 = (process_prefs_0 >> 2) & 7;
                    }
                    if ((int)v113 > 15)
                    {
                    }

                    else if ((_DWORD)v113)
                    {
                      if ((_DWORD)v113 != 1)
                      {
                        if ((_DWORD)v113 == 2)
                        {
                          int v121 = v74;
                          if (v116 != 3
                            && ((_BYTE)v116
                             || (dword_18C43B700 & 2) == 0
                             && (MEMORY[0xFFFFFC104] & 2) == 0
                             && (voucher_get_activity_id() & 0x200000000000000LL) == 0))
                          {
                            char v117 = *(_BYTE *)(v3 + 59);
                            int v74 = v121;
                            goto LABEL_291;
                          }

                          BOOL v122 = v120 == 3;
                          uint64_t v123 = 59LL;
                          int v74 = v121;
                          goto LABEL_307;
                        }

LABEL_381:
                        if (v219 < 0)
                        {
LABEL_384:
                          char v117 = 14;
LABEL_385:
                          v74 |= 0x400u;
                          *((_BYTE *)&v294 + v79++) = v117;
                          int v118 = 1;
                          goto LABEL_386;
                        }

                        char v117 = 0;
                        goto LABEL_383;
                      }

                      if ((v116 & 6) != 2)
                      {
                        if ((_BYTE)v116
                          || (dword_18C43B700 & 3) == 0
                          && (MEMORY[0xFFFFFC104] & 3) == 0
                          && (int v172 = v74,
                              uint64_t activity_id = voucher_get_activity_id(),
                              int v74 = v172,
                              (activity_id & 0x300000000000000LL) == 0))
                        {
                          char v117 = *(_BYTE *)(v3 + 58);
                          goto LABEL_291;
                        }
                      }

                      BOOL v122 = (v120 & 6) == 2;
                      uint64_t v123 = 58LL;
LABEL_307:
                      char v117 = *(_BYTE *)(v3 + v123);
                      if ((v219 & 0x80) == 0 && v122)
                      {
                        if ((_DWORD)v113 != 17 && !*(_BYTE *)(v3 + v123))
                        {
                          char v117 = 0;
                          int v118 = 0;
LABEL_386:
                          v243 |= 0x10000000u;
LABEL_387:
                          int v149 = v243;
                          if ((v243 & 0x2000000) != 0)
                          {
                            if ((v215 & 1) != 0)
                            {
LABEL_590:
                              qword_18C50A768 = (uint64_t)"BUG IN LIBTRACE: Using oversized messages with unreliable inter"
                                                         "faces shouldn't be possible";
                              __break(1u);
                              goto LABEL_591;
                            }

                            do
                              unsigned int v195 = __ldxr(&_oversize_message_id);
                            while (__stxr(v195 + 1, &_oversize_message_id));
                            v74 |= 0x800u;
                            unsigned int v208 = v195;
                            *(unsigned int *)((char *)&v294 + v79) = v195;
                            v79 += 4;
                            uint64_t v3 = v221;
                            if ((v149 & 0x80000) == 0)
                            {
LABEL_389:
                              int v231 = v74;
                              unsigned __int8 v210 = v117;
                              if ((dword_18C43B700 & 8) == 0
                                && (MEMORY[0xFFFFFC104] & 8) == 0
                                && (voucher_get_activity_id() & 0x800000000000000LL) == 0
                                || (*(_DWORD *)(v3 + 60) & 7) == 4)
                              {
                                goto LABEL_392;
                              }

                              if ((dword_18C43B770 & 4) == 0) {
                                goto LABEL_536;
                              }
                              if ((int)v113 > 15)
                              {
                              }

                              else if ((_DWORD)v113)
                              {
                                if ((_DWORD)v113 == 1)
                                {
                                  if ((qword_18C43B768 & 0x100000000LL) != 0) {
                                    goto LABEL_573;
                                  }
                                }

                                else if ((_DWORD)v113 == 2 && (qword_18C43B768 & 0x200000000LL) != 0)
                                {
                                  goto LABEL_573;
                                }

LABEL_536:
                                int v192 = (*(_DWORD *)(v3 + 60) >> 27) & 7;
                                if (v192 != 3)
                                {
                                  if (v192 != 2)
                                  {
                                    if (v192 == 1)
                                    {
                                      BOOL v150 = (v113 - 3) < 0xFEu;
                                      goto LABEL_393;
                                    }

LABEL_392:
                                    BOOL v150 = 0;
                                    goto LABEL_393;
                                  }

                                  BOOL v150 = v113 != 2;
LABEL_393:
                                  unsigned int v233 = v118;
                                  BOOL v152 = v118 != 255
                                      && (byte_18C43B776 | byte_18C43B777) != 0;
                                  char v153 = _os_log_hook;
                                  BOOL v228 = v150;
                                  if (_os_log_hook)
                                  {
                                    char v153 = 0;
                                    if (_os_log_hook_level <= 1u)
                                    {
                                      if (_os_log_hook_level)
                                      {
                                        if (_os_log_hook_level == 1) {
                                          char v153 = (_DWORD)v113 != 2;
                                        }
                                      }

                                      else
                                      {
                                        char v153 = (v113 - 16) < 0xF1u;
                                      }
                                    }

                                    else
                                    {
                                      switch(_os_log_hook_level)
                                      {
                                        case 2:
                                          goto LABEL_425;
                                        case 16:
                                          char v153 = v113 > 0xF;
                                          break;
                                        case 17:
                                          char v153 = (_DWORD)v113 == 17;
                                          break;
                                      }
                                    }
                                  }

                                  if (!v150 && !v152 && (v153 & 1) == 0 && (v243 & 0x4000000) == 0)
                                  {
                                    *(void *)uint64_t v217 = mach_continuous_time();
                                    goto LABEL_414;
                                  }

LABEL_425:
LABEL_414:
                                  unint64_t v155 = ((_DWORD)v113 << 8) | (v231 << 16) | ((unint64_t)v235 << 32) | 4;
                                  uint64_t v156 = _os_log_hook;
                                  if (!_os_log_hook) {
                                    goto LABEL_469;
                                  }
                                  if (_os_log_hook_level <= 1u)
                                  {
                                    if (_os_log_hook_level)
                                    {
                                      if (_os_log_hook_level != 1 || (_DWORD)v113 == 2) {
                                        goto LABEL_469;
                                      }
                                    }

                                    else if ((v113 - 16) >= 0xF1u)
                                    {
                                      goto LABEL_469;
                                    }
                                  }

                                  else if (_os_log_hook_level != 2)
                                  {
                                    if (_os_log_hook_level == 16)
                                    {
                                    }

                                    else if (_os_log_hook_level != 17 || (_DWORD)v113 != 17)
                                    {
                                      goto LABEL_469;
                                    }
                                  }

                                  v157 = pthread_getspecific(_os_log_hook_thread_key);
                                  unint64_t v155 = ((_DWORD)v113 << 8) | (v231 << 16) | ((unint64_t)v235 << 32) | 4;
                                  if (v157) {
                                    goto LABEL_469;
                                  }
                                  v286 = &v297;
                                  uint64_t v287 = 0x40000000000LL;
                                  int v288 = 0;
                                  __int16 v289 = 0;
                                  unsigned __int8 v290 = 1;
                                  if ((v243 & 0x2000000) != 0) {
                                    int v288 = 0x8000;
                                  }
                                  unsigned int v158 = *((_DWORD *)v236 + 2);
                                  if (v158 > 0x400)
                                  {
                                    os_trace_blob_add_slow((uint64_t)&v286, *v236, *((unsigned int *)v236 + 2));
                                    unsigned int v158 = v287;
                                    if ((v289 & 2) != 0) {
                                      goto LABEL_438;
                                    }
                                    int v205 = HIDWORD(v287);
                                    int v159 = v290;
                                  }

                                  else
                                  {
                                    int v205 = 1024;
                                    __memcpy_chk();
                                    LODWORD(v287) = v158;
                                    int v159 = 1;
                                  }

                                  v160 = *v237;
                                  size_t v161 = *((unsigned int *)v237 + 2);
                                  int v203 = v159;
                                  if (v205 - v158 + (char)(v159 - 1) < v161)
                                  {
                                    os_trace_blob_add_slow((uint64_t)&v286, v160, v161);
                                    LOWORD(v158) = v287;
                                  }

                                  else
                                  {
                                    v206 = v286;
                                    memcpy((char *)v286 + v158, v160, v161);
                                    v158 += v161;
                                    LODWORD(v287) = v158;
                                    if (!v203) {
                                      *((_BYTE *)v206 + v158) = 0;
                                    }
                                  }

LABEL_438:
                                  int v162 = v235;
                                  uint64_t v163 = *(void *)v217;
                                  time_t v164 = *(void *)(v217 + 8);
                                  unint64_t __src = ((_DWORD)v113 << 8) | (v231 << 16) | ((unint64_t)v235 << 32) | 4;
                                  uint64_t v268 = v163;
                                  uint64_t v269 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
                                  __int128 v270 = 0uLL;
                                  uint64_t v165 = (*(void *)(v217 + 16) / 0x3E8uLL);
                                  *(void *)&__int128 v271 = v164;
                                  *((void *)&v271 + 1) = v165;
                                  memset(v272, 0, 28);
                                  uint64_t v273 = *(void *)(v217 + 40);
                                  v274 = v286;
                                  uint64_t v275 = (unsigned __int16)v158;
                                  v276 = *v238;
                                  uint64_t v166 = *(void *)(v221 + 24);
                                  uint64_t v167 = v166 + 4;
                                  if (!v166) {
                                    uint64_t v167 = 0LL;
                                  }
                                  uint64_t v277 = *((unsigned __int16 *)v238 + 4);
                                  uint64_t v278 = v167;
                                  v207 = v286;
                                  if (v166) {
                                    v166 += *(unsigned __int8 *)(v166 + 2) + 4LL;
                                  }
                                  uint64_t v279 = v166;
                                  int v280 = 0;
                                  __int16 v281 = 0;
                                  uint64_t v285 = 0LL;
                                  uint64_t v283 = 0LL;
                                  uint64_t v282 = 0LL;
                                  __int16 v284 = 0;
                                  uint64_t v168 = _os_log_hook_params;
                                  if ((_os_log_hook_params & 0x8000000000000002LL) == 0) {
                                    goto LABEL_464;
                                  }
                                  uint64_t v169 = v235 << 32;
                                  unint64_t v170 = v223 | ((unint64_t)v225 << 32);
                                  time_t v204 = v164;
                                  if (*(_DWORD *)(*(void *)(v217 + 24) + 12LL) == 2)
                                  {
                                    LODWORD(v272[1]) = v223;
                                    WORD2(v272[1]) = v225;
                                    if (off_18C43B6F0) {
                                      v171 = (char *)off_18C43B6F0 + 24;
                                    }
                                    else {
                                      v171 = 0LL;
                                    }
                                  }

                                  else if (v213)
                                  {
                                    LODWORD(v272[1]) = v223;
                                    WORD2(v272[1]) = v225;
                                    v171 = v213;
                                  }

                                  else
                                  {
                                    unint64_t v226 = *(void *)(v217 + 24);
                                    int image_uuid = _dyld_get_image_uuid();
                                    uint64_t v169 = v235 << 32;
                                    int v162 = v235;
                                    if (!image_uuid)
                                    {
LABEL_463:
                                      v272[2] = v169 & 0x8000000000000000LL | v162 & 0x7FFFFFFF | (v111 >> 1) & 0x7FFF80000000LL;
                                      *((void *)&v270 + 1) = dyld_image_path_containing_address();
                                      time_t v164 = v204;
LABEL_464:
                                      if ((v168 & 0x8000000000000001LL) != 0)
                                      {
                                        time_t v266 = v164;
                                        localtime_r(&v266, &v265);
                                        HIDWORD(v272[0]) = v265.tm_isdst;
                                        LODWORD(v272[0]) = (v176 >> 5) + (v176 >> 63) + 60 * v265.tm_isdst;
                                      }

                                      pthread_setspecific(_os_log_hook_thread_key, (const void *)1);
                                      (*(void (**)(uint64_t, uint64_t, unint64_t *))(v156 + 16))( v156,  v113,  &__src);
                                      pthread_setspecific(_os_log_hook_thread_key, 0LL);
                                      if ((v289 & 1) != 0) {
                                        free(v207);
                                      }
                                      unint64_t v155 = ((_DWORD)v113 << 8) | (v231 << 16) | ((unint64_t)v235 << 32) | 4;
LABEL_469:
                                      uint64_t v3 = v221;
                                      if (v152)
                                      {
                                        unint64_t v196 = v155;
                                        _os_log_impl_mirror_to_stderr((char *)v217, v221, v113, (uint64_t)&v236, v231);
                                        unint64_t v155 = v196;
                                      }

                                      if ((dword_18C43B700 & 0x400) != 0 || (MEMORY[0xFFFFFC104] & 0x400) != 0) {
                                        goto LABEL_503;
                                      }
                                      if ((dword_18C43B700 & 0x40000000) != 0)
                                      {
                                        if (v233 == 255)
                                        {
                                          int v177 = 0;
                                          goto LABEL_500;
                                        }
                                      }

                                      else if (v233 == 255 || (MEMORY[0xFFFFFC104] & 0x40000000) == 0)
                                      {
LABEL_476:
                                        int v177 = 0;
                                        if (v233 != 255 && off_18C43B6F0)
                                        {
                                          if ((void)v240)
                                          {
                                            unint64_t v200 = v155;
                                            _os_log_impl_mirror_symptom(v217, v221, (uint64_t)&v236);
                                            unint64_t v155 = v200;
                                          }

                                          if ((_DWORD)v113 == 17) {
                                            char v178 = v215;
                                          }
                                          else {
                                            char v178 = 1;
                                          }
                                          if ((v178 & 1) == 0)
                                          {
                                            int v201 = (*(_DWORD *)(v221 + 60) >> 23) & 3;
                                            if (v201 == 2
                                              || v201 == 1
                                              && (byte_18C43B77C == 2
                                               || byte_18C43B77C != 3
                                               && (MEMORY[0xFFFFFC104] & 0x80000000) == 0
                                               && (MEMORY[0xFFFFFC104] & 0x10000000) != 0
                                               && !v2))
                                            {
                                              unint64_t v202 = v155;
                                              _os_log_impl_generate_crashlog(v221, v217, (uint64_t)&v236);
                                              unint64_t v155 = v202;
                                            }
                                          }

                                          if (v219 < 0 || (_DWORD)v113 == 17) {
                                            int v180 = v215;
                                          }
                                          else {
                                            int v180 = 1;
                                          }
                                          if ((v180 & 1) == 0)
                                          {
                                            LODWORD(v297) = 1;
                                            *((void *)&v297 + 1) = 0LL;
                                            if ((_DWORD)v113 == 17) {
                                              unsigned int v181 = 2;
                                            }
                                            else {
                                              unsigned int v181 = 1;
                                            }
                                            uint64_t v298 = v181 | 0x100000000LL;
                                            _os_activity_create_addr( &dword_18010B000,  "Activity for state dumps",  -3LL,  0LL,  v211,  v155);
                                            uint64_t v182 = voucher_get_activity_id();
                                            voucher_adopt();
                                            _os_state_request_for_self(v182, &v297, v210, v69);
                                          }

                                          int v177 = v180 ^ 1;
                                          if ((v243 & 0x2000000) == 0)
                                          {
                                            *(void *)&__int128 v297 = &v294;
                                            *((void *)&v297 + 1) = v79;
                                            uint64_t v298 = (uint64_t)*v236;
                                            uint64_t v299 = *((unsigned int *)v236 + 2);
                                            v300 = *v237;
                                            uint64_t v301 = *((unsigned int *)v237 + 2);
                                            v302 = *v238;
                                            uint64_t v303 = *((unsigned int *)v238 + 2);
                                            uint64_t v183 = voucher_activity_trace_v_2();
LABEL_497:
                                            unint64_t v155 = v183;
                                            goto LABEL_500;
                                          }

                                          if (!v215)
                                          {
                                            uint64_t v3 = v221;
                                            _os_log_impl_send_oversize( v221,  v233,  v210,  *(void *)v217,  v208,  (const void ***)&v236);
                                            uint64_t v183 = voucher_activity_trace();
                                            goto LABEL_497;
                                          }

LABEL_591:
                                          qword_18C50A768 = (uint64_t)"BUG IN LIBTRACE: Using oversized messages with unre"
                                                                     "liable interfaces shouldn't be possible";
                                          __break(1u);
                                          JUMPOUT(0x18011D634LL);
                                        }

LABEL_500:
                                        if (v228)
                                        {
                                          _os_log_impl_stream( (uint64_t *)v217,  v3,  &v261,  (uint64_t)&v260,  (uint64_t *)&v236,  v155,  v210);
                                          if (!v177) {
                                            goto LABEL_503;
                                          }
                                        }

                                        else if (!v177)
                                        {
LABEL_503:
                                          LOBYTE(v2) = v219;
                                          uint64_t v6 = v217;
                                          goto LABEL_504;
                                        }

                                        v184 = (void *)voucher_adopt();
                                        os_release(v184);
                                        goto LABEL_503;
                                      }

                                      unint64_t v197 = v155;
                                      _os_log_mirror_syslog(v217, v221, v154, v113, (uint64_t)&v236);
                                      unint64_t v155 = v197;
                                      goto LABEL_476;
                                    }

                                    uint64_t v175 = _os_trace_dsc_load_addr;
                                    if (_os_trace_dsc_load_addr <= v226)
                                    {
                                      if (_os_trace_dsc_size + _os_trace_dsc_load_addr <= v226) {
                                        uint64_t v175 = 0LL;
                                      }
                                      v170 += v175;
                                    }

                                    v272[1] = v170 - v226;
                                    v171 = (char *)v296;
                                  }

                                  *(void *)&__int128 v270 = v171;
                                  goto LABEL_463;
                                }

LABEL_573:
                                BOOL v150 = 1;
                                goto LABEL_393;
                              }

                              if ((qword_18C43B768 & 0x800000000LL) != 0) {
                                goto LABEL_573;
                              }
                              goto LABEL_536;
                            }
                          }

                          else
                          {
                            unsigned int v208 = 0;
                            if ((v243 & 0x80000) == 0) {
                              goto LABEL_389;
                            }
                          }

                          v74 |= 0x1000u;
                          goto LABEL_389;
                        }

LABEL_313:
                        if (*(_BYTE *)(v3 + v123)) {
                          goto LABEL_385;
                        }
                        goto LABEL_384;
                      }

                      if (v219 < 0) {
                        goto LABEL_313;
                      }
LABEL_383:
                      int v118 = 2;
                      goto LABEL_387;
                    }

                    BOOL v122 = v120 != 4;
                    uint64_t v123 = 57LL;
                    goto LABEL_307;
                  }

                  unsigned int v261 = v68 - v69;
                  unint64_t v73 = (v68 - v69) >> 32;
                  __int16 v262 = (v68 - v69) >> 32;
                  __int16 v263 = 4;
                  v264 = 0LL;
                  int v74 = 2;
                  unsigned int v72 = v68 - v69;
                }

                else
                {
                  unsigned int v72 = v68 - _os_trace_dsc_load_addr;
                  unsigned int v261 = v68 - _os_trace_dsc_load_addr;
                  unint64_t v73 = (v68 - _os_trace_dsc_load_addr) >> 32;
                  __int16 v262 = (v68 - _os_trace_dsc_load_addr) >> 32;
                  v264 = 0LL;
                  if (v262)
                  {
                    int v74 = 12;
                    goto LABEL_266;
                  }

                  LOWORD(v73) = 0;
                  int v74 = 4;
                  __int16 v263 = 4;
                }

                v213 = 0LL;
                unsigned int v294 = v72;
                unsigned int v79 = 4;
                goto LABEL_267;
              }

              uint64_t v75 = *(void *)(v6 + 56);
              if (off_18C43B6F0) {
                __int16 v76 = (unint64_t *)((char *)off_18C43B6F0 + 8);
              }
              else {
                __int16 v76 = 0LL;
              }
              if (_os_trace_dsc_load_addr > v69 || _os_trace_dsc_size + _os_trace_dsc_load_addr <= v69)
              {
                if (*(_DWORD *)(v69 + 12) != 2)
                {
                  if (off_18C43B6F0)
                  {
                    do
                    {
                      while (1)
                      {
                        unint64_t v82 = __ldxr(v76);
                        if (!(_DWORD)v82) {
                          break;
                        }
                        __clrex();
                        uint64_t v83 = v75;
                        _os_trace_rwptr_rdlock_wait((uint64_t)v76);
                        uint64_t v75 = v83;
                      }
                    }

                    while (__stxr(v82 + 0x200000000LL, v76));
                    unint64_t v91 = v76[1];
                    unint64_t v92 = *(unsigned __int16 *)(v91 + 10);
                    unint64_t v93 = (v69 >> *MEMORY[0x189600140]) % v92;
                    while (1)
                    {
                      unint64_t v94 = v91 + 16 * v93;
                      uint64_t v95 = *(void *)(v94 + 16);
                      if (v69 == v95) {
                        break;
                      }
                      if (v93 + 1 == v92) {
                        unint64_t v93 = 0LL;
                      }
                      else {
                        ++v93;
                      }
                      if (v95) {
                        BOOL v96 = v93 == (v69 >> *MEMORY[0x189600140]) % v92;
                      }
                      else {
                        BOOL v96 = 1;
                      }
                      if (v96)
                      {
                        v97 = 0LL;
                        goto LABEL_256;
                      }
                    }

                    v97 = *(__int128 **)(v94 + 24);
LABEL_256:
                    unint64_t v101 = *(unsigned int *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
                    do
                    {
                      unint64_t v102 = __ldxr(v76);
                      unint64_t v103 = v102 - 0x200000000LL;
                      if (v103 == 0x100000000LL) {
                        unint64_t v103 = v101;
                      }
                    }

                    while (__stxr(v103, v76));
                    if (v103 == v101)
                    {
                      __dmb(9u);
                      uint64_t v198 = (uint64_t)v76;
                      uint64_t v199 = v75;
                      _os_trace_rwptr_cleanup(v198);
                      uint64_t v75 = v199;
                    }

                    uint64_t v287 = (uint64_t)v97;
                    if (v97)
                    {
                      LODWORD(v286) = v68 - v69;
                      WORD2(v286) = (v68 - v69) >> 32;
                      unsigned int v80 = 20;
                      HIWORD(v286) = 20;
                      unsigned int v294 = v68 - v69;
                      __int128 v295 = *v97;
                      unsigned int v78 = 10;
                      goto LABEL_320;
                    }
                  }

                  else
                  {
                    uint64_t v287 = 0LL;
                  }

                  LODWORD(v286) = v68;
                  WORD2(v286) = WORD2(v68);
                  unsigned int v78 = 8;
LABEL_319:
                  unsigned int v80 = 6;
                  HIWORD(v286) = 6;
                  unsigned int v294 = v286;
                  LOWORD(v295) = WORD2(v286);
LABEL_320:
                  if (v70)
                  {
                    uint64_t v124 = _os_trace_dsc_load_addr;
                    if (_os_trace_dsc_load_addr <= v69)
                    {
                      if (_os_trace_dsc_size + _os_trace_dsc_load_addr <= v69) {
                        uint64_t v124 = v69;
                      }
                      unint64_t v125 = v70 - v124;
                    }

                    else
                    {
                      unint64_t v125 = v70 - v69;
                    }

                    unint64_t v70 = v125 & 0x7FFFFFFF;
                    unint64_t v126 = v125 >> 31;
                  }

                  else
                  {
                    LOWORD(v126) = 0;
                  }

                  v296[0] = v70 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)v126 << 32);
                  uint64_t v127 = *(void *)(v6 + 48);
                  if (v127)
                  {
                    uint64_t v128 = _os_trace_dsc_load_addr;
                    if (_os_trace_dsc_load_addr <= v69)
                    {
                      if (_os_trace_dsc_size + _os_trace_dsc_load_addr <= v69) {
                        uint64_t v128 = v69;
                      }
                      unint64_t v129 = v127 - v128;
                    }

                    else
                    {
                      unint64_t v129 = v127 - v69;
                    }

                    unsigned int v131 = v129 & 0x7FFFFFFF;
                    unint64_t v130 = v129 >> 31;
                  }

                  else
                  {
                    LOWORD(v130) = 0;
                    unsigned int v131 = 0;
                  }

                  if ((unsigned __int16)v130 | (unsigned __int16)v126)
                  {
                    v78 |= 0x20u;
                    *(_WORD *)((char *)&v294 + v80) = v126;
                    v80 += 2;
                  }

                  v132 = *(_WORD **)(v3 + 24);
                  if (v132)
                  {
                    v78 |= 0x200u;
                    *(_WORD *)((char *)&v294 + v80) = *v132;
                    v80 += 2;
                  }

                  int v133 = *(_DWORD *)(v3 + 60);
                  if ((v133 & 0x80000) != 0)
                  {
                    v243 |= 0x10000000u;
                    LODWORD(v51) = 4;
                  }

                  else
                  {
                    LODWORD(v51) = 2;
                  }

                  *(void *)((char *)&v294 + v80) = v75;
                  uint64_t v17 = (_BYTE *)(v80 + 8LL);
                  if (v127)
                  {
                    *(unsigned int *)((char *)&v294 + (void)v17) = v131;
                    uint64_t v17 = (_BYTE *)(v80 + 12LL);
                    if ((v78 & 0x20) != 0)
                    {
                      *(_WORD *)((char *)&v294 + (void)v17) = v130;
                      LODWORD(v17) = v80 + 14;
                    }

                    v78 |= 0x8000u;
                  }

                  int v134 = v243;
                  uint64_t v234 = v75;
                  if ((v243 & 0x2000000) != 0)
                  {
                    do
                      unsigned int v194 = __ldxr(&_oversize_message_id);
                    while (__stxr(v194 + 1, &_oversize_message_id));
                    v78 |= 0x800u;
                    LODWORD(v232) = v194;
                    *(unsigned int *)((char *)&v294 + v17) = v194;
                    LODWORD(v17) = (_DWORD)v17 + 4;
                  }

                  else
                  {
                    LODWORD(v232) = 0;
                  }

                  if ((v134 & 0x80000) != 0) {
                    uint64_t v135 = v78 | 0x1000;
                  }
                  else {
                    uint64_t v135 = v78;
                  }
                  if ((v133 & 0x400000) != 0
                    && ((dword_18C43B700 & 8) != 0
                     || (MEMORY[0xFFFFFC104] & 8) != 0
                     || (voucher_get_activity_id() & 0x800000000000000LL) != 0)
                    && ((dword_18C43B770 & 8) != 0 || (*(_BYTE *)(v3 + 63) & 0x40) != 0))
                  {
                    LODWORD(v5) = 1;
                  }

                  else
                  {
                    LODWORD(v5) = 0;
                    *(void *)uint64_t v6 = mach_continuous_time();
                  }

                  uint64_t v4 = (v70 << 32) | (v135 << 16) | ((unint64_t)v2 << 8) | 6;
                  if ((*(_BYTE *)(v3 + 62) & 2) != 0 && _signpost_hook)
                  {
                    *(void *)&v265.tm_sec = &v297;
                    *(void *)&v265.tm_hour = 0x40000000000LL;
                    v265.tm_mon = 0;
                    LOWORD(v265.tm_year) = 0;
                    BYTE2(v265.tm_year) = 1;
                    if ((v243 & 0x2000000) != 0) {
                      goto LABEL_561;
                    }
                    goto LABEL_362;
                  }

                  goto LABEL_374;
                }

                unsigned int v77 = v68 - v69;
                LODWORD(v286) = v68 - v69;
                WORD2(v286) = (v68 - v69) >> 32;
                HIWORD(v286) = 4;
                uint64_t v287 = 0LL;
                unsigned int v78 = 2;
              }

              else
              {
                unsigned int v77 = v68 - _os_trace_dsc_load_addr;
                LODWORD(v286) = v68 - _os_trace_dsc_load_addr;
                WORD2(v286) = (v68 - _os_trace_dsc_load_addr) >> 32;
                uint64_t v287 = 0LL;
                if (WORD2(v286))
                {
                  unsigned int v78 = 12;
                  goto LABEL_319;
                }

                HIDWORD(v286) = 0x40000;
                unsigned int v78 = 4;
              }

              unsigned int v294 = v77;
              unsigned int v80 = 4;
              goto LABEL_320;
            }

            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_521:
            _os_log_invoke_callback( v6,  v3,  v2,  (uint64_t)&v236,  (uint64_t (**)(int *))&_os_log_current_fault_callback);
            goto LABEL_505;
          }

LABEL_519:
          os_log_fmt_compose( v5,  *(char **)(v6 + 40),  2LL,  3u,  8LL,  (unsigned __int8 *)v255,  (uint64_t)v250,  (unsigned __int16)v62,  (uint64_t)v245,  v63);
          int v62 = v251;
          int v63 = *(_DWORD *)v246;
          goto LABEL_174;
        }

        uint64_t v42 = v256;
        ++BYTE1(v294);
        if ((v258 & 2) != 0) {
          goto LABEL_167;
        }
        if ((v259 + HIDWORD(v256) - v256 - 1) <= 1)
        {
          os_trace_blob_add_slow((uint64_t)&v255, &v236, 2uLL);
LABEL_167:
          size_t v45 = 4LL;
          goto LABEL_103;
        }

        unsigned int v43 = (unsigned __int16)v236;
        *(_WORD *)((char *)v255 + v256) = (_WORD)v236;
        unsigned int v44 = v256 + 2;
        LODWORD(v256) = v256 + 2;
        size_t v45 = v43 >> 8;
        if (!v259) {
          *((_BYTE *)v255 + v44) = 0;
        }
LABEL_103:
        if ((v258 & 2) == 0)
        {
          if (v259 + HIDWORD(v256) - (int)v256 - 1 < v45)
          {
            os_trace_blob_add_slow((uint64_t)&v255, &__src, v45);
          }

          else
          {
            memcpy((char *)v255 + v256, &__src, v45);
            unsigned int v46 = v256 + v45;
            LODWORD(v256) = v256 + v45;
            if (!v259) {
              *((_BYTE *)v255 + v46) = 0;
            }
          }
        }

        if (!v255) {
          goto LABEL_172;
        }
        unsigned __int8 v47 = (unsigned __int8 *)v255 + v42;
        unsigned int v48 = privacy_flags2opt[v236 & 7];
        if (!v36)
        {
          unsigned __int8 v55 = *v47 & 8 | 0xF2;
          unsigned __int8 *v47 = v55;
          if ((v55 & 1) == 0) {
            goto LABEL_161;
          }
          goto LABEL_160;
        }

        if (v48 > v3 && !v232)
        {
          unsigned int v49 = *v47;
          if ((v49 & 0xF0) == 0x40)
          {
            if ((-[objc_class isProxy](v36, "isProxy") & 1) == 0
              && ((objc_opt_respondsToSelector() & 1) == 0
               || (-[objc_class isNSNumber](v36, "isNSNumber") & 1) == 0
               && (-[objc_class isNSString](v36, "isNSString") & 1) == 0))
            {
              sel_registerName("redactedDescription");
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                uint64_t v232 = 0LL;
                unsigned __int8 *v47 = *v47 & 0xF | 0x80;
                v248 |= 4u;
                goto LABEL_118;
              }
            }

LABEL_156:
            unsigned int v49 = *v47;
          }

          if (v49 > 0xF || (*((_WORD *)v47 + 2) & 0x7FFF) != 0)
          {
            if ((v49 & 1) != 0) {
              goto LABEL_160;
            }
LABEL_161:
            uint64_t v232 = 0LL;
            uint64_t v4 = 0LL;
            goto LABEL_162;
          }

          *((_WORD *)v47 + 2) |= 0x8000u;
          if ((v49 & 1) == 0) {
            goto LABEL_161;
          }
LABEL_160:
          LOBYTE(v294) = v294 | 1;
          goto LABEL_161;
        }

LABEL_118:
        xpc_object_t v50 = v1;
        else {
          size_t v51 = (size_t)v17;
        }
        unsigned int v52 = *v47;
        switch(v52 >> 4)
        {
          case 0u:
            if ((_DWORD)v4)
            {
              unint64_t v53 = 0LL;
              unint64_t v54 = 0LL;
LABEL_153:
              unsigned int v57 = _os_log_fmt_flatten_to_blob( (uint64_t)v47,  v229,  v232,  v36,  v4,  (uint64_t)&v250,  (uint64_t)&v245,  v51,  v54,  v53);
LABEL_154:
              unint64_t v53 = v57;
LABEL_155:
              v17 -= v53;
              unint64_t v1 = v50;
              uint64_t v3 = v229;
              goto LABEL_156;
            }

            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_559:
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_560:
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_561:
            v265.tm_mon = 0x8000;
LABEL_362:
            unsigned int v220 = v2;
            size_t v136 = *((unsigned int *)v236 + 2);
            int v230 = v51;
            if (v136 > 0x400)
            {
              os_trace_blob_add_slow((uint64_t)&v265, *v236, v136);
              LODWORD(v136) = v265.tm_hour;
              if ((v265.tm_year & 2) == 0)
              {
                int tm_mday = v265.tm_mday;
                int v139 = BYTE2(v265.tm_year);
                int v138 = SBYTE2(v265.tm_year) - 1;
                goto LABEL_364;
              }
            }

            else
            {
              int tm_mday = 1024;
              __memcpy_chk();
              int v138 = 0;
              v265.tm_hour = v136;
              int v139 = 1;
LABEL_364:
              v140 = *v237;
              unsigned int v141 = *((_DWORD *)v237 + 2);
              if (tm_mday - (int)v136 + v138 < v141)
              {
                os_trace_blob_add_slow((uint64_t)&v265, v140, *((unsigned int *)v237 + 2));
                LOWORD(v136) = v265.tm_hour;
              }

              else
              {
                uint64_t v142 = *(void *)&v265.tm_sec;
                memcpy((void *)(*(void *)&v265.tm_sec + v136), v140, *((unsigned int *)v237 + 2));
                LODWORD(v136) = v136 + v141;
                if (!v139) {
                  *(_BYTE *)(v142 + v136) = 0;
                }
              }
            }

            uint64_t v143 = *(void *)v6;
            unint64_t __src = v4;
            uint64_t v268 = v143;
            uint64_t v144 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
            memset(v272, 0, 28);
            __int128 v271 = 0u;
            __int128 v270 = 0u;
            uint64_t v145 = *(void *)(v6 + 40);
            uint64_t v269 = v144;
            v146 = *(void **)&v265.tm_sec;
            uint64_t v273 = v145;
            v274 = *(__int128 **)&v265.tm_sec;
            uint64_t v275 = (unsigned __int16)v136;
            v276 = *v238;
            uint64_t v3 = v221;
            uint64_t v147 = *(void *)(v221 + 24);
            uint64_t v148 = v147 + 4;
            if (!v147) {
              uint64_t v148 = 0LL;
            }
            uint64_t v277 = *((unsigned __int16 *)v238 + 4);
            uint64_t v278 = v148;
            LOBYTE(v2) = v220;
            if (v147) {
              v147 += *(unsigned __int8 *)(v147 + 2) + 4LL;
            }
            uint64_t v279 = v147;
            int v280 = 0;
            __int16 v281 = 0;
            uint64_t v282 = v234;
            uint64_t v283 = 0LL;
            __int16 v284 = 0;
            uint64_t v285 = 0LL;
            _signpost_hook(v220 >> 6, v220 & 3, &__src);
            if ((v265.tm_year & 1) != 0) {
              free(v146);
            }
            LODWORD(v51) = v230;
LABEL_374:
            if ((v243 & 0x2000000) != 0)
            {
              _os_log_impl_send_oversize(v3, v51, 0, *(void *)v6, v232, (const void ***)&v236);
              voucher_activity_trace();
              if ((_DWORD)v5) {
LABEL_376:
              }
                _os_log_impl_stream((uint64_t *)v6, v3, (unsigned int *)&v286, (uint64_t)v296, (uint64_t *)&v236, v4, 0);
            }

            else
            {
              *(void *)&__int128 v297 = &v294;
              *((void *)&v297 + 1) = v17;
              uint64_t v298 = (uint64_t)*v236;
              uint64_t v299 = *((unsigned int *)v236 + 2);
              v300 = *v237;
              uint64_t v301 = *((unsigned int *)v237 + 2);
              v302 = *v238;
              uint64_t v303 = *((unsigned int *)v238 + 2);
              voucher_activity_trace_v_2();
              if ((_DWORD)v5) {
                goto LABEL_376;
              }
            }

LABEL_504:
            if ((v2 & 0x7F) == 0x11) {
              goto LABEL_521;
            }
LABEL_505:
            _os_log_invoke_callback( v6,  v3,  v2,  (uint64_t)&v236,  (uint64_t (**)(int *))&_os_log_current_test_callback);
            if ((v258 & 1) != 0)
            {
              v185 = v255;
              v255 = (void *)3954044928LL;
              __int16 v258 = 0;
              free(v185);
            }

            if ((v253 & 1) != 0)
            {
              v186 = v250;
              v250 = (void *)3954044928LL;
              __int16 v253 = 0;
              free(v186);
            }

            if ((v248 & 1) != 0)
            {
              v187 = v245;
              v245 = (void *)3954044928LL;
              __int16 v248 = 0;
              free(v187);
            }

            if ((v36 & 0x8000000) == 0)
            {
              size_t v188 = v239;
              if (v239)
              {
                if ((*(_WORD *)(v239 + 20) & 1) != 0)
                {
                  v189 = *(void **)v239;
                  *(void *)size_t v239 = 3954044928LL;
                  *(_WORD *)(v188 + 20) = 0;
                  free(v189);
                }
              }
            }

            return;
          case 2u:
            if ((v52 & 7) != 0)
            {
              unint64_t v53 = 0LL;
              unint64_t v54 = (unint64_t)v36;
              goto LABEL_153;
            }

            if ((_DWORD)v4) {
              strnlen((const char *)v36, v4);
            }
            else {
              strlen((const char *)v36);
            }
            char is_memory_immutable = _dyld_is_memory_immutable();
            uint64_t v60 = 0LL;
            unint64_t v53 = 0LL;
            unsigned __int16 v58 = v36;
            unint64_t v54 = (unint64_t)v36;
            if ((is_memory_immutable & 1) == 0) {
              goto LABEL_151;
            }
            goto LABEL_153;
          case 3u:
            unint64_t v53 = 0LL;
            if (!(_DWORD)v4) {
              goto LABEL_155;
            }
            if ((v52 & 7) != 0)
            {
              unint64_t v54 = 0LL;
              goto LABEL_153;
            }

            unsigned __int16 v58 = 0LL;
            goto LABEL_152;
          case 4u:
            if ((v52 & 0xF0) != 0x40) {
              goto LABEL_560;
            }
            char v56 = v212;
            if ((v52 & 2) != 0) {
              char v56 = 0;
            }
            goto LABEL_140;
          case 5u:
            if ((v52 & 7) != 0)
            {
              unint64_t v54 = 0LL;
              unint64_t v53 = (unint64_t)v36;
            }

            else
            {
              if ((_DWORD)v4) {
                wcsnlen((const __int32 *)v36, v4);
              }
              else {
                wcslen((const __int32 *)v36);
              }
              char v59 = _dyld_is_memory_immutable();
              unsigned __int16 v58 = 0LL;
              unint64_t v54 = 0LL;
              uint64_t v60 = v36;
              unint64_t v53 = (unint64_t)v36;
              if ((v59 & 1) == 0)
              {
LABEL_151:
                LOBYTE(v52) = *v47;
                unint64_t v53 = (unint64_t)v60;
LABEL_152:
                unsigned __int8 *v47 = v52 | 1;
                unint64_t v54 = (unint64_t)v58;
              }
            }

            goto LABEL_153;
          case 8u:
            if ((v52 & 0xF0) != 0x80) {
              goto LABEL_559;
            }
            char v56 = 1;
LABEL_140:
            unsigned int v57 = _os_log_fmt_flatten_object_impl( v47,  v229,  v232,  v36,  v4,  (uint64_t)&v250,  (uint64_t)&v245,  v51,  v56);
            goto LABEL_154;
          default:
            _os_crash();
            __break(1u);
            goto LABEL_590;
        }
    }
  }

void *_os_get_logging_unreliable_for_current_thread()
{
  if (_init_unreliable_thread_key_unreliable_once != -1) {
    dispatch_once(&_init_unreliable_thread_key_unreliable_once, &__block_literal_global_80);
  }
  return pthread_getspecific(_os_log_unreliable_thread_key);
}

void _os_log_impl_send_oversize( uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, unsigned int a5, const void ***a6)
{
  if (off_18C43B6F0)
  {
    xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v12, "operation", 3uLL);
    xpc_dictionary_set_uuid(v12, "dsc_uuid", (const unsigned __int8 *)off_18C43B6F0 + 40);
    if ((*(_WORD *)off_18C43B6F0 & 1) != 0) {
      xpc_dictionary_set_BOOL(v12, "32bits", 1);
    }
    xpc_dictionary_set_uint64(v12, "stream_id", a2);
    xpc_dictionary_set_uint64(v12, "message_id", a5);
    xpc_dictionary_set_data(v12, "commands", **a6, *((unsigned int *)*a6 + 2));
    xpc_dictionary_set_data(v12, "pubdata", *a6[1], *((unsigned int *)a6[1] + 2));
    xpc_dictionary_set_data(v12, "privdata", *a6[2], *((unsigned int *)a6[2] + 2));
    xpc_dictionary_set_uint64(v12, "ts", a4);
    if (a3) {
      xpc_dictionary_set_uint64(v12, "ttl", a3);
    }
    if (byte_18C43B77A) {
      xpc_dictionary_set_BOOL(v12, "quarantined", 1);
    }
    if (a1)
    {
      unsigned int v13 = *(unsigned __int8 **)(a1 + 24);
      if (v13) {
        xpc_dictionary_set_data(v12, "subsystem", v13, v13[2] + (unint64_t)v13[3] + 4);
      }
    }

    size_t v14 = (void *)_os_trace_logd_send_with_reply();
    if (v14) {
      xpc_release(v14);
    }
    xpc_release(v12);
  }

void _os_log_impl_stream( uint64_t *a1, uint64_t a2, unsigned int *a3, uint64_t a4, uint64_t *a5, uint64_t a6, char a7)
{
  size_t v14 = _os_trace_diagnosticd_pipe(0LL);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *a5;
    if ((*(_WORD *)(*a5 + 20) & 2) == 0)
    {
      uint64_t v17 = (void **)a5[1];
      char v18 = *v17;
      size_t v19 = *((unsigned int *)v17 + 2);
      uint64_t v20 = *(unsigned int *)(v16 + 8);
      if (*(char *)(v16 + 22) + *(_DWORD *)(v16 + 12) - (int)v20 - 1 < v19)
      {
        os_trace_blob_add_slow(*a5, v18, v19);
      }

      else
      {
        memcpy((void *)(*(void *)v16 + v20), v18, v19);
        unsigned int v21 = *(_DWORD *)(v16 + 8) + v19;
        *(_DWORD *)(v16 + 8) = v21;
        if (!*(_BYTE *)(v16 + 22)) {
          *(_BYTE *)(*(void *)v16 + v21) = 0;
        }
      }
    }

    else {
      unsigned int v22 = bswap32(a6) >> 16;
    }
    unsigned int v31 = v22;
    uint64_t v33 = 0LL;
    uint64_t v32 = 0LL;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    uint64_t v23 = *a1;
    uint64_t v24 = a1[1];
    uint64_t v36 = a6;
    uint64_t v37 = v23;
    uint64_t v38 = 0LL;
    uint64_t v39 = 0LL;
    uint64_t v25 = (a1[2] / 0x3E8uLL);
    uint64_t v40 = 0LL;
    uint64_t v41 = v24;
    uint64_t v42 = v25;
    uint64_t v43 = 0LL;
    int v46 = 0;
    uint64_t v44 = 0LL;
    uint64_t v45 = 0LL;
    uint64_t v47 = a1[5];
    uint64_t v26 = *a5;
    uint64_t v48 = *(void *)*a5;
    uint64_t v49 = *(unsigned __int16 *)(v26 + 8);
    int v27 = (uint64_t *)a5[2];
    uint64_t v50 = *v27;
    uint64_t v51 = *((unsigned __int16 *)v27 + 4);
    if (a2)
    {
      uint64_t v28 = *(void *)(a2 + 24);
      uint64_t v29 = v28 + 4;
      if (!v28) {
        uint64_t v29 = 0LL;
      }
      uint64_t v52 = v29;
      if (v28) {
        v28 += *(unsigned __int8 *)(v28 + 2) + 4LL;
      }
    }

    else
    {
      uint64_t v28 = 0LL;
      uint64_t v52 = 0LL;
    }

    uint64_t v53 = v28;
    int v54 = 0;
    char v55 = a7;
    BOOL v56 = (a5[9] & 0x10000000) != 0;
    uint64_t v30 = a1[6];
    uint64_t v57 = a1[7];
    uint64_t v58 = v30;
    __int16 v59 = 0;
    uint64_t v60 = 0LL;
    _os_activity_stream_reflect((uint64_t)v15, (uint64_t)&v31, a1[3], -3LL, a3, a4);
    xpc_release(v15);
  }

char *_os_log_impl_mirror_to_stderr(char *result, uint64_t a2, int a3, uint64_t a4, char a5)
{
  uint64_t v8 = result;
  uint64_t v35 = *MEMORY[0x1895FEE08];
  int v9 = byte_18C43B777;
  if (byte_18C43B776) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = byte_18C43B777 == 0;
  }
  if (!v10)
  {
    if ((a3 & 0xFE) != 0x10 && (a5 & 0xE) != 2 && (*(_DWORD *)(a4 + 72) & 0x40000000) == 0)
    {
      if ((a5 & 6 | 8) == 0xC) {
        return result;
      }
      int v11 = (const char *)dyld_image_path_containing_address();
      if (v11)
      {
        xpc_object_t v12 = v11;
        unint64_t result = (char *)strncmp(v11, "/System/Developer/", 0x12uLL);
        if (!(_DWORD)result) {
          return result;
        }
        unint64_t result = (char *)strncmp(v12, "/System/Library/", 0x10uLL);
        if (!(_DWORD)result) {
          return result;
        }
        unint64_t result = (char *)strncmp(v12, "/usr/lib/", 9uLL);
        if (!(_DWORD)result) {
          return result;
        }
      }
    }

    int v9 = byte_18C43B777;
  }

  if (!a2
    || a3 != 17
    || !v9
    || (uint64_t v13 = *(void *)(a2 + 24)) == 0
    || strcmp((const char *)(v13 + 4), "com.apple.runtime-issues")
    && strcmp((const char *)(v13 + *(unsigned __int8 *)(v13 + 2) + 4), "RuntimeIssues")
    || (unint64_t result = strstr(*((const char **)v8 + 5), "xcode:text-backtrace")) == 0LL)
  {
    time_t v14 = *((void *)v8 + 1);
    unint64_t v15 = *((void *)v8 + 2);
    *(void *)&v31.tm_sec = &v34;
    *(void *)&v31.tm_hour = 0x10000000000LL;
    v31.tm_mon = 0;
    LOWORD(v31.tm_year) = 0;
    BYTE2(v31.tm_year) = 0;
    os_trace_blob_add_localtime(&v31, v14, v15 / 0x3E8, 1u);
    char v16 = getprogname();
    getpid();
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    os_trace_blob_addf((uint64_t)&v31, " %s[%d:%llu] ", v17, v18, v19, v20, v21, v22, v16);
    if (a2)
    {
      uint64_t v29 = *(void *)(a2 + 24);
      if (v29) {
        os_trace_blob_addf((uint64_t)&v31, "[%s] ", v23, v24, v25, v26, v27, v28, v29 + *(_BYTE *)(v29 + 2) + 4);
      }
    }

    uint64_t v30 = *(void *)(a4 + 24);
    if (!v30)
    {
      _os_log_impl_compose(*((char **)v8 + 5), a4);
      uint64_t v30 = *(void *)(a4 + 24);
    }

    *(void *)&v31.tm_wday = *(void *)&v31.tm_sec;
    *(void *)&v31.int tm_isdst = v31.tm_hour;
    v31.tm_gmtoff = *(void *)v30;
    v31.tm_zone = (char *)*(unsigned int *)(v30 + 8);
    uint64_t v32 = "\n";
    uint64_t v33 = 1LL;
    return (char *)_os_trace_writev(2, (iovec *)&v31.tm_wday, 3LL);
  }

  return result;
}

uint64_t _os_log_mirror_syslog(uint64_t result, uint64_t a2, double a3, uint64_t a4, uint64_t a5)
{
  uint64_t v17 = 0LL;
  if ((*(_BYTE *)(a5 + 75) & 0x40) != 0) {
    return result;
  }
  uint64_t v7 = result;
  unint64_t result = asl_new_delayInitStub(a3);
  if (a2)
  {
    uint64_t v9 = *(void *)(a2 + 24);
    if (v9) {
      BOOL v10 = (const char *)(v9 + *(unsigned __int8 *)(v9 + 2) + 4);
    }
    else {
      BOOL v10 = 0LL;
    }
    if (!result) {
      return result;
    }
  }

  else
  {
    BOOL v10 = 0LL;
    if (!result) {
      return result;
    }
  }

  asl_set_delayInitStub(v8);
  xpc_object_t v12 = *(const char ***)(a5 + 24);
  if (!v12)
  {
    _os_log_impl_compose(*(char **)(v7 + 40), a5);
    xpc_object_t v12 = *(const char ***)(a5 + 24);
  }

  if (v10)
  {
    asprintf(&v17, "[%s] %s", v10, *v12);
    asl_set_delayInitStub(v13);
    free(v17);
  }

  else
  {
    asl_set_delayInitStub(v11);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&_os_log_mirror_syslog_asl_lock);
  if (!*(void *)(a2 + 32))
  {
    *(void *)(a2 + 32) = asl_open_delayInitStub(v14);
    asl_set_filter_delayInitStub(v16);
  }

  asl_send_delayInitStub(v14);
  os_unfair_lock_unlock((os_unfair_lock_t)&_os_log_mirror_syslog_asl_lock);
  return asl_release_delayInitStub(v15);
}

uint64_t _os_log_impl_mirror_symptom(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (off_18C43B6F0)
  {
    uint64_t v5 = result;
    if (_os_log_impl_mirror_symptom_reporter
      || (unint64_t result = symptom_framework_init(), (_os_log_impl_mirror_symptom_reporter = result) != 0))
    {
      unint64_t result = symptom_new();
      if (result)
      {
        voucher_get_activity_id();
        if (a2)
        {
          uint64_t v6 = *(void *)(a2 + 24);
          if (v6) {
            a2 = v6 + *(unsigned __int8 *)(v6 + 2) + 4;
          }
          else {
            a2 = 0LL;
          }
        }

        if (!*(void *)(a3 + 24)) {
          _os_log_impl_compose(*(char **)(v5 + 40), a3);
        }
        symptom_set_qualifier();
        symptom_set_qualifier();
        symptom_set_qualifier();
        strlen((const char *)a2);
        symptom_set_additional_qualifier();
        symptom_set_additional_qualifier();
        symptom_set_additional_qualifier();
        symptom_set_additional_qualifier();
        return symptom_send();
      }
    }
  }

  return result;
}

void _os_log_impl_generate_crashlog(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(const char ***)(a3 + 24);
  if (!v5)
  {
    _os_log_impl_compose(*(char **)(a2 + 40), a3);
    uint64_t v5 = *(const char ***)(a3 + 24);
  }

  uint64_t v6 = *v5;
  size_t v7 = strlen(*v5);
  unint64_t v8 = v7 + 1;
  unint64_t v9 = *(void *)(a1 + 24);
  if (v9) {
    unint64_t v9 = *(unsigned __int8 *)(v9 + 3) + (unint64_t)*(unsigned __int8 *)(v9 + 2);
  }
  size_t v10 = v7 + v9 + 21;
  if (v10 >= 0x801 && v8 > 2028 - v9)
  {
    *(_DWORD *)&v6[-v9 + 2024] = 3026478;
    size_t v10 = 2048LL;
    unint64_t v8 = 2028 - v9;
  }

  while (1)
  {
    double v11 = (char *)malloc(v10);
    if (v11) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }

  xpc_object_t v12 = v11;
  *(_DWORD *)double v11 = 1;
  *(void *)(v11 + 12) = 0LL;
  *(void *)(v11 + 4) = 0LL;
  double v13 = v11 + 20;
  uint64_t v14 = *(void *)(a1 + 24);
  if (!v14) {
    goto LABEL_14;
  }
  *((_DWORD *)v11 + 2) = 20;
  size_t v15 = *(unsigned __int8 *)(v14 + 2);
  if (strlcpy(v11 + 20, (const char *)(v14 + 4), v15) + 1 != v15)
  {
LABEL_17:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_18;
  }

  double v16 = &v13[v15];
  v12[3] = (_DWORD)v16 - (_DWORD)v12;
  uint64_t v17 = *(void *)(a1 + 24);
  size_t v18 = *(unsigned __int8 *)(v17 + 3);
  if (strlcpy(v16, (const char *)(v17 + *(unsigned __int8 *)(v17 + 2) + 4), v18) + 1 == v18)
  {
    double v13 = &v16[v18];
LABEL_14:
    v12[4] = (_DWORD)v13 - (_DWORD)v12;
    if (v8 == strlcpy(v13, **(const char ***)(a3 + 24), v10 - ((_DWORD)v13 - (_DWORD)v12)) + 1)
    {
      os_fault_with_payload();
      free(v12);
      return;
    }

    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_17;
  }

uint64_t _os_log_invoke_callback( uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t (**a5)(int *))
{
  uint64_t v5 = *a5;
  if (*a5)
  {
    uint64_t v9 = result;
    if (!*(void *)(a4 + 24)) {
      _os_log_impl_compose(*(char **)(result + 40), a4);
    }
    int v14 = 1;
    uint64_t v15 = a2;
    if (a2)
    {
      uint64_t v10 = *(void *)(a2 + 24);
      uint64_t v11 = v10 + 4;
      if (!v10) {
        uint64_t v11 = 0LL;
      }
      uint64_t v16 = v11;
      if (v10) {
        v10 += *(unsigned __int8 *)(v10 + 2) + 4LL;
      }
    }

    else
    {
      uint64_t v10 = 0LL;
      uint64_t v16 = 0LL;
    }

    uint64_t v13 = *(void *)(v9 + 32);
    uint64_t v12 = *(void *)(v9 + 40);
    uint64_t v17 = v10;
    uint64_t v18 = v12;
    uint64_t v19 = **(void **)(a4 + 24);
    uint64_t v20 = v13;
    char v21 = a3 & 0x7F;
    return v5(&v14);
  }

  return result;
}

unint64_t _os_log_impl_compose(char *__s, uint64_t a2)
{
  *(void *)(a2 + 48) = a2 + 76;
  *(void *)(a2 + 56) = 0x100000000LL;
  *(_WORD *)(a2 + 68) = 0;
  *(_BYTE *)(a2 + 70) = 0;
  *(_DWORD *)(a2 + 64) = 0x10000;
  *(void *)(a2 + 24) = a2 + 48;
  return os_log_fmt_compose( a2 + 48,  __s,  2LL,  3u,  8LL,  **(unsigned __int8 ***)a2,  **(void **)(a2 + 8),  *(unsigned __int16 *)(*(void *)(a2 + 8) + 8LL),  **(void **)(a2 + 16),  *(_DWORD *)(*(void *)(a2 + 16) + 8LL));
}

uint64_t ___init_unreliable_thread_key_block_invoke()
{
  uint64_t result = pthread_key_create((pthread_key_t *)&_os_log_unreliable_thread_key, 0LL);
  if ((_DWORD)result)
  {
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
  }

  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_unreliable_impl(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == 17)
  {
    qword_18C50A768 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Calling the unreliable interfaces on a fault is not supported";
    __break(1u);
  }

  else
  {
    _os_log();
  }

uint64_t os_set_logging_unreliable_for_current_thread()
{
  if (_init_unreliable_thread_key_unreliable_once != -1) {
    dispatch_once(&_init_unreliable_thread_key_unreliable_once, &__block_literal_global_80);
  }
  return pthread_setspecific(_os_log_unreliable_thread_key, (const void *)1);
}

char *_os_log_send_and_compose_impl( char a1, void *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2) {
    *a2 = a8;
  }
  uint64_t v14 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = a5;
  uint64_t v18 = a8;
  uint64_t v19 = 0LL;
  uint64_t v20 = 0LL;
  int v21 = 0;
  __error();
  char v13 = 0;
  if (a3) {
    uint64_t v10 = a3;
  }
  else {
    uint64_t v10 = &v13;
  }
  uint64_t v12 = v10;
  _os_log_impl_flatten_and_send();
  uint64_t result = 0LL;
  if ((a1 & 2) != 0)
  {
    uint64_t result = v12;
    if (v12 == &v13)
    {
      while (1)
      {
        uint64_t result = strdup((const char *)&unk_180123A61);
        if (result) {
          break;
        }
        _os_trace_temporary_resource_shortage();
      }
    }
  }

  return result;
}

unint64_t os_signpost_set_introspection_hook_4Perf(unint64_t a1)
{
  do
    unint64_t v1 = __ldxr((unint64_t *)&_signpost_hook);
  while (__stxr(a1, (unint64_t *)&_signpost_hook));
  return v1;
}

void _os_signpost_emit_impl(uint64_t a1, uint64_t a2)
{
}

void __os_signpost_emit_impl(uint64_t a1, uint64_t a2)
{
  if (((*(_DWORD *)(a2 + 60) >> 20) & 3) == 0 && (dword_18C43B700 & 4) == 0 && (MEMORY[0xFFFFFC104] & 4) == 0) {
    voucher_get_activity_id();
  }
  _os_log_impl_flatten_and_send();
}

void _os_signpost_emit_with_name_impl( void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_unreliably_with_name_impl(uint64_t a1, uint64_t a2)
{
}

void _os_log_internal(void *dso, os_log_t log, os_log_type_t type, const char *message, ...)
{
  uint64_t v17 = *MEMORY[0x1895FEE08];
  int v9 = *(unsigned __int16 *)__error();
  if (dyld_sdk_at_least() && log && log != (os_log_t)&_os_log_disabled)
  {
    os_log_type_t v10 = *((_BYTE *)log + 56);
    if (v10 == OS_LOG_TYPE_DEFAULT) {
      os_log_type_t v10 = type;
    }
    uint64_t v11 = v10 & 0x7F;
    if (os_log_type_enabled(log, (os_log_type_t)(v10 & 0x7F)))
    {
      va_copy(v14, va);
      memset(v12, 0, 24);
      v12[3] = dso;
      v12[4] = v4;
      v12[5] = message;
      v12[6] = 0LL;
      v12[7] = 0LL;
      int v13 = 0;
      if (os_log_fmt_encode(message, 2LL, v16, &v15, (int *)va))
      {
        _os_log_impl_flatten_and_send();
      }

      else
      {
        va_copy(v14, va);
        _os_log_impl_dynamic((uint64_t)v12, (uint64_t)log, v11, 0LL, v9, va);
      }
    }
  }

void _os_log_impl_dynamic(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5, va_list a6)
{
  uint64_t v21 = *MEMORY[0x1895FEE08];
  v14[0] = &v20;
  v14[1] = 0x40000000000LL;
  int v15 = 0;
  __int16 v16 = 0;
  char v17 = 0;
  if (a4)
  {
    if (os_trace_blob_vaddf_CF_once != -1) {
      dispatch_once(&os_trace_blob_vaddf_CF_once, &__block_literal_global_339);
    }
    * __error() = a5;
    os_log_type_t v10 = (void *)MEMORY[0x186DF4DBC]();
    uint64_t v11 = (objc_class *)os_trace_blob_vaddf_CF__NSString;
    id v12 = a4;
    int v13 = (void *)[[v11 alloc] initWithFormat:v12 arguments:a6];

    os_trace_blob_adds_CF((uint64_t)v14, v13);
    objc_autoreleasePoolPop(v10);
  }

  else
  {
    os_trace_blob_vaddf((uint64_t)v14, *(const char **)(a1 + 40), a5, a6);
  }

  int v18 = 136380675;
  uint64_t v19 = v14[0];
  *(void *)(a1 + 40) = "%s";
  _os_log_impl_flatten_and_send();
}

uint64_t _os_log_pack_size(uint64_t a1)
{
  return a1 + 72;
}

uint64_t _os_log_pack_fill(uint64_t result, unint64_t a2, __int16 a3, uint64_t a4, uint64_t a5)
{
  *(void *)uint64_t result = 0LL;
  *(void *)(result + 8) = 0LL;
  *(void *)(result + 16) = 0LL;
  *(void *)(result + 24) = a4;
  *(void *)(result + 32) = v5;
  *(void *)(result + 40) = a5;
  if (a2 >= 0x10000)
  {
    qword_18C50A768 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Absurdly large size";
    qword_18C50A798 = a2;
    __break(1u);
  }

  else
  {
    *(void *)(result + 48) = 0LL;
    *(void *)(result + 56) = 0LL;
    *(_WORD *)(result + 64) = a3;
    *(_WORD *)(result + 66) = a2 - 72;
    result += 68LL;
  }

  return result;
}

size_t _os_signpost_pack_fill( size_t result, unint64_t a2, __int16 a3, uint64_t a4, char *a5, char *__s, uint64_t a7)
{
  uint64_t v13 = result;
  if (!a5)
  {
    uint64_t result = strlen(__s);
    a5 = &__s[result];
  }

  *(void *)uint64_t v13 = 0LL;
  *(void *)(v13 + 8) = 0LL;
  *(void *)(v13 + 16) = 0LL;
  *(void *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v7;
  *(void *)(v13 + 40) = a5;
  if (a2 >= 0x10000)
  {
    qword_18C50A768 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Absurdly large size";
    qword_18C50A798 = a2;
    __break(1u);
  }

  else
  {
    *(void *)(v13 + 48) = __s;
    *(void *)(v13 + 56) = a7;
    *(_WORD *)(v13 + 64) = a3;
    *(_WORD *)(v13 + 66) = a2 - 72;
    return v13 + 68;
  }

  return result;
}

char *os_log_pack_send_and_compose(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  char v7 = 0;
  uint64_t v4 = &v7;
  if (a4) {
    uint64_t v4 = a4;
  }
  uint64_t v6 = v4;
  _os_log_impl_flatten_and_send();
  return v6;
}

void os_log_pack_send()
{
}

void _os_signpost_pack_send()
{
}

char *os_log_pack_compose(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  char v7 = 0;
  uint64_t v4 = &v7;
  if (a4) {
    uint64_t v4 = a4;
  }
  uint64_t v6 = v4;
  _os_log_impl_flatten_and_send();
  return v6;
}

uint64_t os_log_shim_legacy_logging_enabled()
{
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0LL, (dispatch_function_t)_os_trace_init_slow);
  }
  if ((dword_18C43B700 & 0x20000000) != 0) {
    return 1LL;
  }
  else {
    return (MEMORY[0xFFFFFC104] >> 29) & 1;
  }
}

uint64_t os_log_shim_enabled(uint64_t a1)
{
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0LL, (dispatch_function_t)_os_trace_init_slow);
  }
  if ((dword_18C43B700 & 0x60000000) != 0 || (MEMORY[0xFFFFFC104] & 0x60000000) != 0) {
    return 0LL;
  }
  if (a1 && dyld_image_header_containing_address()) {
    return dyld_sdk_at_least();
  }
  return 1LL;
}

void os_log_with_args( os_log_s *a1, char a2, const char *a3, _DWORD *a4, void (*a5)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5, va_list a6))
{
}

void _os_log_with_args_impl( os_log_s *a1, char a2, const char *a3, _DWORD *a4, void (*a5)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5, va_list a6), void *a6)
{
  char v7 = a5;
  va_list v8 = (va_list)a4;
  uint64_t v28 = *MEMORY[0x1895FEE08];
  uint64_t v25 = a5;
  uint64_t v26 = a4;
  int v12 = *(unsigned __int16 *)__error();
  uint64_t v13 = a2 & 0x7F;
  if (os_log_type_enabled(a1, (os_log_type_t)v13))
  {
    uint64_t v14 = dyld_image_header_containing_address();
    if (v14)
    {
      first_non_jit_frame = (const mach_header_64 *)v14;
      if (a3 || !a6)
      {
        uint64_t v16 = dyld_image_header_containing_address();
        if (v16)
        {
          if (first_non_jit_frame == (const mach_header_64 *)v16)
          {
            char v17 = getsegmentdata(first_non_jit_frame, "__TEXT", &size);
            if (v17)
            {
              if (v17 <= (uint8_t *)a3 && &a3[strlen(a3)] < (const char *)&v17[size])
              {
                uint64_t v23 = 0LL;
                __int128 v21 = 0u;
                __int128 v22 = 0u;
                __int128 v19 = 0u;
                __int128 v20 = 0u;
                if (os_log_fmt_encode(a3, 3LL, v27, &v18, v26))
                {
                  *((void *)&v20 + 1) = first_non_jit_frame;
                  *(void *)&__int128 v21 = v7;
                  *((void *)&v21 + 1) = a3;
                  _os_log_impl_flatten_and_send();
                  return;
                }

                va_list v8 = (va_list)v26;
              }
            }
          }
        }
      }
    }

    else
    {
      first_non_jit_frame = (const mach_header_64 *)os_log_with_args_find_first_non_jit_frame(&v25);
      char v7 = v25;
    }

    *((void *)&v20 + 1) = first_non_jit_frame;
    *(void *)&__int128 v21 = v7;
    *((void *)&v21 + 1) = a3;
    _os_log_impl_dynamic((uint64_t)&v19, (uint64_t)a1, v13, a6, v12, v8);
  }

int *os_log_with_args_find_first_non_jit_frame( void (**a1)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5, va_list a6))
{
  v10[32] = *(void **)MEMORY[0x1895FEE08];
  int v2 = backtrace(v10, 32);
  uint64_t v3 = &dword_18010B000;
  if (v2 < 1)
  {
    uint64_t v6 = _os_log_impl_dynamic;
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = v2;
    uint64_t v6 = _os_log_impl_dynamic;
    while (1)
    {
      char v7 = (int *)dyld_image_header_containing_address();
      if (v7 && v7 != &dword_18010B000) {
        break;
      }
      if (v5 == ++v4) {
        goto LABEL_11;
      }
    }

    uint64_t v6 = (void (*)(uint64_t, uint64_t, uint64_t, void *, int, va_list))v10[v4];
    uint64_t v3 = v7;
  }

void os_log_shim_with_CFString( void (*a1)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5, va_list a6), os_log_s *a2, int a3, void *a4, _DWORD *a5)
{
  uint64_t v11 = (const char *)[a4 _fastCStringContents:1];
  if (a1) {
    int v12 = a1;
  }
  else {
    int v12 = v5;
  }
  if (a3 == 4) {
    char v13 = 1;
  }
  else {
    char v13 = 2 * (a3 == 2);
  }
  _os_log_with_args_impl(a2, v13, v11, a5, v12, a4);
}

image_offset **os_log_backtrace_create_from_pcs(void *const *a1, int a2)
{
  while (1)
  {
    uint64_t v4 = (image_offset **)calloc(1uLL, 0x10uLL);
    if (v4) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }

  uint64_t v5 = v4;
  *((_DWORD *)v4 + 2) = a2;
  while (1)
  {
    uint64_t v6 = (image_offset *)malloc(20LL * a2);
    if (v6) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }

  char *v5 = v6;
  backtrace_image_offsets(a1, v6, a2);
  return v5;
}

image_offset **os_log_backtrace_create_from_current(uint64_t a1)
{
  v7[1] = *MEMORY[0x1895FEE08];
  MEMORY[0x1895FE128](a1);
  uint64_t v4 = (void *const *)((char *)v7 - v3);
  if (v1) {
    int v5 = backtrace_from_fp(v1, (void **)((char *)v7 - v3), v2);
  }
  else {
    int v5 = backtrace((void **)((char *)v7 - v3), v2);
  }
  return os_log_backtrace_create_from_pcs(v4, v5);
}

image_offset **os_log_backtrace_create_from_return_address(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1895FEE08];
  MEMORY[0x1895FE128]();
  uint64_t v4 = (char *)&v10 - v3;
  thread_stack_async_pcs();
  uint64_t v5 = HIDWORD(v10);
  if (HIDWORD(v10))
  {
    int v6 = HIDWORD(v10) - 1;
    while (!*(void *)&v4[8 * (v5 - 1)])
    {
      HIDWORD(v10) = v6--;
      --v5;
      if (v6 == -1)
      {
        LODWORD(v5) = 0;
        goto LABEL_6;
      }
    }

    BOOL v7 = v5 != 0;
    if ((_DWORD)v5)
    {
      uint64_t v9 = 0LL;
      while (*(void *)&v4[8 * v9] != a2)
      {
        if (v5 == ++v9) {
          return os_log_backtrace_create_from_pcs((void *const *)&v4[8 * v7], (int)v5 - v7);
        }
      }

      BOOL v7 = v9;
    }
  }

  else
  {
LABEL_6:
    BOOL v7 = 0;
  }

  return os_log_backtrace_create_from_pcs((void *const *)&v4[8 * v7], (int)v5 - v7);
}

void os_log_backtrace_destroy(void **a1)
{
}

uint64_t os_log_backtrace_get_frames(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t os_log_backtrace_get_length(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

void os_log_backtrace_serialize_to_blob()
{
  uint64_t v0 = MEMORY[0x1895FE128]();
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v35 = *MEMORY[0x1895FEE08];
  uint64_t v4 = MEMORY[0x1895FE128]();
  uint64_t v5 = (char *)&v32 - ((v6 + 15) & 0x1FFFFFFF0LL);
  LODWORD(v6) = *(_DWORD *)(v4 + 8);
  if ((int)v6 < 1)
  {
    int v8 = 255;
  }

  else
  {
    uint64_t v32 = (uint64_t)&v32;
    uint64_t v7 = 0LL;
    int v8 = 255;
    do
    {
      if (v8 > 254) {
        goto LABEL_12;
      }
      int v9 = v8;
      uint64_t v10 = (const unsigned __int8 *)&v34[4 * v8 + 1];
      while (uuid_compare(v10, (const unsigned __int8 *)(*(void *)v3 + 20 * v7)))
      {
        ++v9;
        v10 += 16;
        if (v9 == 255) {
          goto LABEL_11;
        }
      }

      if (v9 != -1) {
        goto LABEL_13;
      }
LABEL_11:
      if (v8 < 1)
      {
LABEL_4:
        LOBYTE(v9) = -1;
      }

      else
      {
LABEL_12:
        uuid_copy((unsigned __int8 *)&v34[4 * --v8 + 1], (const unsigned __int8 *)(*(void *)v3 + 20 * v7));
        LOBYTE(v9) = v8;
      }

LABEL_13:
      v5[v7++] = v9;
      uint64_t v6 = *(int *)(v3 + 8);
    }

    while (v7 < v6);
  }

  LOBYTE(v34[0]) = 18;
  BYTE1(v34[0]) = -1 - v8;
  HIWORD(v34[0]) = v6;
  if ((*(_BYTE *)(v2 + 20) & 2) == 0)
  {
    uint64_t v11 = *(unsigned int *)(v2 + 8);
    if ((*(char *)(v2 + 22) + *(_DWORD *)(v2 + 12) - v11 - 1) <= 3)
    {
      os_trace_blob_add_slow(v2, v34, 4uLL);
    }

    else
    {
      *(_DWORD *)(*(void *)v2 + v11) = v34[0];
      unsigned int v12 = *(_DWORD *)(v2 + 8) + 4;
      *(_DWORD *)(v2 + 8) = v12;
      if (!*(_BYTE *)(v2 + 22)) {
        *(_BYTE *)(*(void *)v2 + v12) = 0;
      }
    }
  }

  if ((*(_WORD *)(v2 + 20) & 2) == 0)
  {
    char v13 = &v34[4 * v8 + 1];
    size_t v14 = 16LL * (255 - v8);
    uint64_t v15 = *(unsigned int *)(v2 + 8);
    if (v14 > (*(char *)(v2 + 22) + *(_DWORD *)(v2 + 12) - v15 - 1))
    {
      os_trace_blob_add_slow(v2, v13, v14);
    }

    else
    {
      memcpy((void *)(*(void *)v2 + v15), v13, v14);
      unsigned int v16 = *(_DWORD *)(v2 + 8) + v14;
      *(_DWORD *)(v2 + 8) = v16;
      if (!*(_BYTE *)(v2 + 22)) {
        *(_BYTE *)(*(void *)v2 + v16) = 0;
      }
    }
  }

  LODWORD(v17) = *(_DWORD *)(v3 + 8);
  if ((int)v17 >= 1)
  {
    uint64_t v18 = 0LL;
    uint64_t v19 = 16LL;
    do
    {
      if ((*(_WORD *)(v2 + 20) & 2) == 0)
      {
        __int128 v20 = (_DWORD *)(*(void *)v3 + v19);
        uint64_t v21 = *(unsigned int *)(v2 + 8);
        if ((*(char *)(v2 + 22) + *(_DWORD *)(v2 + 12) - v21 - 1) <= 3)
        {
          os_trace_blob_add_slow(v2, v20, 4uLL);
        }

        else
        {
          *(_DWORD *)(*(void *)v2 + v21) = *v20;
          unsigned int v22 = *(_DWORD *)(v2 + 8) + 4;
          *(_DWORD *)(v2 + 8) = v22;
          if (!*(_BYTE *)(v2 + 22)) {
            *(_BYTE *)(*(void *)v2 + v22) = 0;
          }
        }
      }

      ++v18;
      uint64_t v17 = *(int *)(v3 + 8);
      v19 += 20LL;
    }

    while (v18 < v17);
    if ((int)v17 >= 1)
    {
      for (uint64_t i = 0LL; i < v17; ++i)
      {
        uint64_t v24 = &v5[i];
        int v25 = v5[i];
        if (v25 != 255)
        {
          LOBYTE(v25) = v25 - v8;
          *uint64_t v24 = v25;
        }

        if ((*(_WORD *)(v2 + 20) & 2) == 0)
        {
          uint64_t v26 = *(unsigned int *)(v2 + 8);
          if (*(char *)(v2 + 22) + *(_DWORD *)(v2 + 12) - 1 == (_DWORD)v26)
          {
            os_trace_blob_add_slow(v2, v24, 1uLL);
          }

          else
          {
            *(_BYTE *)(*(void *)v2 + v26) = v25;
            unsigned int v27 = *(_DWORD *)(v2 + 8) + 1;
            *(_DWORD *)(v2 + 8) = v27;
            if (!*(_BYTE *)(v2 + 22)) {
              *(_BYTE *)(*(void *)v2 + v27) = 0;
            }
          }
        }

        uint64_t v17 = *(int *)(v3 + 8);
      }
    }
  }

  int v28 = v17 & 3;
  if (v28)
  {
    int v33 = 0;
    if ((*(_WORD *)(v2 + 20) & 2) == 0)
    {
      size_t v29 = (4 - v28);
      uint64_t v30 = *(unsigned int *)(v2 + 8);
      if (*(char *)(v2 + 22) + *(_DWORD *)(v2 + 12) - (int)v30 - 1 < v29)
      {
        os_trace_blob_add_slow(v2, &v33, v29);
      }

      else
      {
        memcpy((void *)(*(void *)v2 + v30), &v33, v29);
        unsigned int v31 = *(_DWORD *)(v2 + 8) + v29;
        *(_DWORD *)(v2 + 8) = v31;
        if (!*(_BYTE *)(v2 + 22)) {
          *(_BYTE *)(*(void *)v2 + v31) = 0;
        }
      }
    }
  }

void *os_log_backtrace_copy_serialized_buffer(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v10 = *MEMORY[0x1895FEE08];
  v5[0] = &v9;
  v5[1] = (void *)0x100000000000LL;
  int v6 = 0;
  __int16 v7 = 0;
  char v8 = 1;
  os_log_backtrace_serialize_to_blob();
  uint64_t v3 = os_trace_blob_detach((uint64_t)v5, v2);
  if ((v7 & 1) != 0) {
    free(v5[0]);
  }
  return v3;
}

_DWORD *os_log_backtrace_create_from_buffer(void *a1, unint64_t *a2)
{
  unint64_t v2 = *a2;
  if (*a2 < 4) {
    return 0LL;
  }
  uint64_t v4 = (_BYTE *)*a1;
  if (*(_BYTE *)*a1 != 18) {
    return 0LL;
  }
  uint64_t v5 = *((unsigned __int16 *)v4 + 1);
  unint64_t v6 = (v5 & 3) != 0
     ? v5 + 16LL * v4[1] + 4 * v5 + 4 - (v5 & 3) + 4
     : v5 + 16LL * v4[1] + 4 * v5 + 4;
  BOOL v7 = v2 >= v6;
  unint64_t v8 = v2 - v6;
  if (!v7) {
    return 0LL;
  }
  unint64_t v21 = v8;
  while (1)
  {
    unsigned int v12 = calloc(1uLL, 0x10uLL);
    if (v12) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }

  char v9 = v12;
  size_t v13 = 20LL * *((unsigned __int16 *)v4 + 1);
  while (1)
  {
    size_t v14 = (char *)malloc(v13);
    if (v14) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }

  *(void *)char v9 = v14;
  uint64_t v15 = *((unsigned __int16 *)v4 + 1);
  uint64_t v9[2] = v15;
  if (v15)
  {
    unint64_t v16 = 0LL;
    uint64_t v17 = (uint64_t)&v4[16 * v4[1] + 4];
    uint64_t v18 = v17 + 4 * v15;
    uint64_t v19 = 16LL;
    do
    {
      uint64_t v20 = *(unsigned __int8 *)(v18 + v16);
      if ((_DWORD)v20 == 255)
      {
        uuid_clear((unsigned __int8 *)&v14[v19 - 16]);
      }

      else
      {
        if (v20 >= v4[1])
        {
          free(v14);
          free(v9);
          return 0LL;
        }

        uuid_copy((unsigned __int8 *)&v14[v19 - 16], &v4[16 * v20 + 4]);
      }

      size_t v14 = *(char **)v9;
      *(_DWORD *)(*(void *)v9 + v19) = *(_DWORD *)(v17 + 4 * v16++);
      v19 += 20LL;
    }

    while (v16 < *((unsigned __int16 *)v4 + 1));
  }

  *a1 = &v4[v6];
  *a2 = v21;
  return v9;
}

uint64_t os_log_backtrace_print_to_blob(uint64_t result, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1895FEE08];
  if (*(int *)(result + 8) >= 1)
  {
    uint64_t v3 = result;
    uint64_t v4 = 0LL;
    uint64_t v5 = 16LL;
    do
    {
      uuid_unparse((const unsigned __int8 *)(*(void *)v3 + v5 - 16), out);
      uint64_t result = os_trace_blob_addf(a2, "%s +0x%x\n", v6, v7, v8, v9, v10, v11, (char)out);
      ++v4;
      v5 += 20LL;
    }

    while (v4 < *(int *)(v3 + 8));
  }

  return result;
}

void *os_log_backtrace_copy_description(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1895FE128](a1);
  uint64_t v9 = *MEMORY[0x1895FEE08];
  v4[0] = &v8;
  v4[1] = (void *)0x100000000000LL;
  int v5 = 0;
  __int16 v6 = 0;
  char v7 = 0;
  os_log_backtrace_print_to_blob(v1, (uint64_t)v4);
  unint64_t v2 = os_trace_blob_detach((uint64_t)v4, 0LL);
  if ((v6 & 1) != 0) {
    free(v4[0]);
  }
  return v2;
}

unint64_t os_trace_blob_adds_CF(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (_BYTE *)[v3 _fastCStringContents:1];
  if (v4)
  {
    unint64_t v5 = os_trace_blob_addns(a1, v4, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }

  else
  {
    unint64_t v6 = [v3 lengthOfBytesUsingEncoding:4];
    unint64_t v12 = v6;
    unsigned int v7 = *(_DWORD *)(a1 + 8);
    unint64_t v8 = *(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v7 - 1;
    if (v6 > v8)
    {
      unint64_t v9 = v6;
      os_trace_blob_grow(a1, v6);
      unsigned int v7 = *(_DWORD *)(a1 + 8);
      unint64_t v8 = *(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v7 - 1;
      if (v9 > v8) {
        *(_WORD *)(a1 + 20) |= 2u;
      }
    }

    objc_msgSend( v3,  "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:",  *(void *)a1 + v7,  v8,  &v12,  4,  1,  0,  objc_msgSend(v3, "length"),  0);
    unint64_t v5 = v12;
    unsigned int v10 = *(_DWORD *)(a1 + 8) + v12;
    *(_DWORD *)(a1 + 8) = v10;
    if (!*(_BYTE *)(a1 + 22)) {
      *(_BYTE *)(*(void *)a1 + v10) = 0;
    }
  }

  return v5;
}

uint64_t _os_trace_read_file_at(int a1, const char *a2, off_t a3, int64_t *a4)
{
  int v6 = openat(a1, a2, 16777476);
  if (v6 < 0)
  {
    int v10 = *__error();
    goto LABEL_21;
  }

  int v7 = v6;
  off_t v8 = lseek(v6, 0LL, 2);
  if (v8 < 0)
  {
    int v10 = *__error();
    goto LABEL_20;
  }

  int64_t v9 = v8;
  if (v8 > a3)
  {
    int v10 = 34;
    goto LABEL_20;
  }

  while (1)
  {
    uint64_t v11 = (char *)malloc(v9);
    if (v11) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }

  unint64_t v12 = v11;
  if (v9 < 1)
  {
LABEL_16:
    if (close(v7) == -1)
    {
      int v17 = *__error();
      uint64_t result = *__error();
      if (v17 == 9)
      {
LABEL_28:
        qword_18C50A768 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_18C50A798 = result;
        __break(1u);
        return result;
      }

      _os_assumes_log();
    }

    *a4 = v9;
    return (uint64_t)v12;
  }

  off_t v13 = 0LL;
  while (1)
  {
    ssize_t v14 = pread(v7, &v12[v13], v9 - v13, v13);
    if ((v14 & 0x8000000000000000LL) == 0) {
      break;
    }
    int v10 = *__error();
    if (v10 != 4) {
      goto LABEL_19;
    }
LABEL_15:
    if (v13 >= v9) {
      goto LABEL_16;
    }
  }

  if (v14)
  {
    v13 += v14;
    goto LABEL_15;
  }

  int v10 = 70;
LABEL_19:
  free(v12);
LABEL_20:
  if (close(v7) == -1)
  {
    int v16 = *__error();
    uint64_t result = *__error();
    if (v16 != 9)
    {
      _os_assumes_log();
      goto LABEL_21;
    }

    qword_18C50A768 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_18C50A798 = result;
    __break(1u);
    goto LABEL_28;
  }

uint64_t _os_trace_temporary_resource_shortage()
{
  return sleep(1u);
}

void *_os_trace_malloc(size_t __size)
{
  while (1)
  {
    uint64_t result = malloc(__size);
    if (result) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }

  return result;
}

void *_os_trace_read_plist_at(int a1, const char *a2)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  uint64_t v3 = _os_trace_read_file_at(a1, a2, 0x10000LL, &v10);
  if (!v3)
  {
    int v8 = *__error();
    if (v8 == 2 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_DWORD *)buf = 136446466;
    unint64_t v12 = a2;
    __int16 v13 = 1024;
    int v14 = v8;
    int v6 = "failed to read %{public}s: %{darwin.errno}d";
    uint32_t v7 = 18;
    goto LABEL_12;
  }

  uint64_t v4 = (void *)v3;
  unint64_t v5 = (void *)xpc_create_from_plist();
  free(v4);
  if (!v5)
  {
LABEL_5:
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      return 0LL;
    }
    *(_DWORD *)buf = 136446210;
    unint64_t v12 = a2;
    int v6 = "invalid property list at %{public}s";
    uint32_t v7 = 12;
LABEL_12:
    _os_log_error_impl(&dword_18010B000, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v6, buf, v7);
    return 0LL;
  }

  if (object_getClass(v5) != (Class)MEMORY[0x189600980])
  {
    xpc_release(v5);
    goto LABEL_5;
  }

  return v5;
}

uint64_t _os_trace_fdscandir_b(int a1, void *a2, uint64_t a3, void *a4)
{
  int v7 = dup(a1);
  if (v7 == -1)
  {
    __error();
    _os_assumes_log();
    goto LABEL_25;
  }

  int v8 = v7;
  if (lseek(v7, 0LL, 0) == -1)
  {
    __error();
    _os_assumes_log();
  }

  int64_t v9 = fdopendir(v8);
  if (v9)
  {
    int64_t v10 = v9;
    while (1)
    {
      uint64_t v11 = malloc(0x100uLL);
      if (v11) {
        break;
      }
      _os_trace_temporary_resource_shortage();
    }

    unint64_t v12 = v11;
    rewinddir(v10);
    size_t v13 = 0LL;
    unint64_t v14 = 32LL;
    while (1)
    {
      uint64_t v15 = readdir(v10);
      if (!v15) {
        break;
      }
      int v16 = (unsigned __int16 *)v15;
      if (!a3 || (*(unsigned int (**)(uint64_t, dirent *))(a3 + 16))(a3, v15))
      {
        size_t v17 = v16[9] + 22LL;
        while (1)
        {
          uint64_t v18 = malloc(v17);
          if (v18) {
            break;
          }
          _os_trace_temporary_resource_shortage();
        }

        uint64_t v19 = v18;
        memcpy(v18, v16, v17);
        if (v13 >= v14)
        {
          uint64_t v20 = realloc(v12, 16 * v14);
          if (!v20)
          {
            free(v19);
            closedir(v10);
            _os_trace_scandir_free_namelist(v13, (void **)v12);
            goto LABEL_25;
          }

          v14 *= 2LL;
          unint64_t v12 = v20;
        }

        *((void *)v12 + v13++) = v19;
      }
    }

    closedir(v10);
    if (a4 && v13) {
      qsort_b(v12, v13, 8uLL, a4);
    }
    *a2 = v12;
    return v13;
  }

  int v21 = *__error();
  if (close(v8) != -1)
  {
LABEL_24:
    * __error() = v21;
LABEL_25:
    *a2 = 0LL;
    return 0xFFFFFFFFLL;
  }

  int v23 = *__error();
  uint64_t result = *__error();
  if (v23 != 9)
  {
    _os_assumes_log();
    goto LABEL_24;
  }

  qword_18C50A768 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C50A798 = result;
  __break(1u);
  return result;
}

void _os_trace_scandir_free_namelist(int a1, void **a2)
{
  if (a1 >= 1)
  {
    unint64_t v3 = a1 + 1LL;
    do
      free(a2[(v3-- - 2)]);
    while (v3 > 1);
  }

  free(a2);
}

uint64_t _os_trace_write(int __fd, uint64_t a2, size_t __nbyte)
{
  if (__nbyte)
  {
    size_t v3 = __nbyte;
    uint64_t v6 = 0LL;
    while (1)
    {
      ssize_t v7 = write(__fd, (const void *)(a2 + v6), v3);
      if (v7 < 0)
      {
        int v8 = *__error();
        if (v8 != 4)
        {
          _os_trace_undo_write(__fd, v6, v8);
          return -1LL;
        }
      }

      else
      {
        v6 += v7;
        v3 -= v7;
      }

      if (!v3) {
        return v6;
      }
    }
  }

  return 0LL;
}

int *_os_trace_undo_write(int a1, uint64_t a2, int a3)
{
  off_t v5 = lseek(a1, -a2, 1);
  if (v5 != -1) {
    ftruncate(a1, v5);
  }
  uint64_t result = __error();
  *uint64_t result = a3;
  return result;
}

uint64_t _os_trace_writev(int a1, iovec *a2, uint64_t a3)
{
  uint64_t v6 = 0LL;
  int v7 = 0;
  int v8 = a2;
  while (2)
  {
    else {
      int v9 = a3 - v7;
    }
    uint64_t v10 = v7;
    while (1)
    {
      ssize_t v11 = writev(a1, &v8[v7], v9);
      if ((v11 & 0x8000000000000000LL) == 0) {
        break;
      }
      if (*__error() != 4)
      {
        if (v8 != a2) {
          free(v8);
        }
        if (v6)
        {
          uint64_t v20 = __error();
          _os_trace_undo_write(a1, v6, *v20);
        }

        return -1LL;
      }
    }

    unint64_t v12 = v11;
    v6 += v11;
    if ((int)a3 > v7)
    {
      p_iov_len = &v8[v7].iov_len;
      while (1)
      {
        size_t v14 = *p_iov_len;
        p_iov_len += 2;
        unint64_t v15 = v12 - v14;
        if (v12 < v14) {
          break;
        }
        ++v10;
        unint64_t v12 = v15;
      }

      int v7 = v10;
    }

    uint64_t v16 = (a3 - v7);
    if ((_DWORD)a3 != v7)
    {
      if (v8 == a2 && v12)
      {
        while (1)
        {
          size_t v17 = (iovec *)malloc(16LL * (int)v16);
          if (v17) {
            break;
          }
          _os_trace_temporary_resource_shortage();
        }

        int v8 = v17;
        memcpy(v17, &a2[v7], 16LL * (int)v16);
        int v7 = 0;
      }

      else
      {
        uint64_t v16 = a3;
      }

      uint64_t v18 = &v8[v7];
      unint64_t v19 = v18->iov_len - v12;
      v18->iov_base = (char *)v18->iov_base + v12;
      v18->iov_len = v19;
      a3 = v16;
      continue;
    }

    break;
  }

void *_os_trace_mmap(int a1, size_t *a2)
{
  size_t v4 = lseek(a1, 0LL, 2);
  if ((v4 & 0x8000000000000000LL) != 0) {
    goto LABEL_4;
  }
  size_t v5 = v4;
  if (!v4)
  {
    int v7 = 34;
    goto LABEL_6;
  }

  uint64_t result = mmap(0LL, v4, 1, 8194, a1, 0LL);
  if ((unint64_t)result + 1 <= 1)
  {
LABEL_4:
    int v7 = *__error();
LABEL_6:
    int v8 = __error();
    size_t v5 = 0LL;
    uint64_t result = 0LL;
    *int v8 = v7;
  }

  *a2 = v5;
  return result;
}

void *_os_trace_mmap_offset(int a1, size_t a2, off_t a3)
{
  uint64_t result = mmap(0LL, a2, 1, 8194, a1, a3);
  return result;
}

uint64_t _os_trace_mmap_at(int a1, const char *a2, int a3, size_t *a4)
{
  int v5 = openat(a1, a2, a3 | 0x1000004);
  if (v5 < 0) {
    goto LABEL_8;
  }
  int v6 = v5;
  int v7 = _os_trace_mmap(v5, a4);
  if (!v7)
  {
    int v11 = *__error();
    if (close(v6) == -1)
    {
      int v12 = *__error();
      uint64_t result = *__error();
      if (v12 == 9) {
        goto LABEL_13;
      }
      _os_assumes_log();
    }

    * __error() = v11;
LABEL_8:
    int v8 = 0LL;
    *a4 = 0LL;
    return (uint64_t)v8;
  }

  int v8 = v7;
  if (close(v6) != -1) {
    return (uint64_t)v8;
  }
  int v9 = *__error();
  uint64_t result = *__error();
  if (v9 != 9)
  {
    _os_assumes_log();
    return (uint64_t)v8;
  }

  qword_18C50A768 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C50A798 = result;
  __break(1u);
LABEL_13:
  qword_18C50A768 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C50A798 = result;
  __break(1u);
  return result;
}

uint64_t _os_trace_getxattr_at(int a1, const char *a2, int a3, const char *a4, void *a5, size_t a6)
{
  int v9 = openat(a1, a2, a3 | 0x1000004);
  if (v9 < 0) {
    return -1LL;
  }
  int v10 = v9;
  ssize_t v11 = fgetxattr(v9, a4, a5, a6, 0, 0);
  if (v11 == -1)
  {
    int v15 = *__error();
    if (close(v10) == -1)
    {
      int v16 = *__error();
      uint64_t result = *__error();
      if (v16 == 9) {
        goto LABEL_13;
      }
      _os_assumes_log();
    }

    * __error() = v15;
    return -1LL;
  }

  ssize_t v12 = v11;
  if (close(v10) != -1) {
    return v12;
  }
  int v13 = *__error();
  uint64_t result = *__error();
  if (v13 != 9)
  {
    _os_assumes_log();
    return v12;
  }

  qword_18C50A768 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C50A798 = result;
  __break(1u);
LABEL_13:
  qword_18C50A768 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_18C50A798 = result;
  __break(1u);
  return result;
}

void *_os_trace_get_boot_uuid()
{
  if (_os_trace_get_boot_uuid_once != -1) {
    dispatch_once_f( &_os_trace_get_boot_uuid_once,  &_os_trace_get_boot_uuid_uuid_str,  (dispatch_function_t)_os_trace_get_boot_uuid_slow);
  }
  return &_os_trace_get_boot_uuid_uuid_str;
}

int *_os_trace_get_boot_uuid_slow(void *a1)
{
  size_t v3 = 37LL;
  uint64_t result = (int *)sysctlbyname("kern.bootsessionuuid", a1, &v3, 0LL, 0LL);
  if ((result & 0x80000000) != 0)
  {
    uint64_t result = __error();
    uint64_t v2 = *result;
    qword_18C50A768 = (uint64_t)"BUG IN LIBTRACE: Unable to grab boot uuid";
    qword_18C50A798 = v2;
    __break(1u);
  }

  return result;
}

uint64_t _os_trace_get_times_now(void *a1, void *a2, _DWORD *a3)
{
  uint64_t result = mach_get_times();
  if ((_DWORD)result) {
    uint64_t result = _os_assumes_log();
  }
  uint64_t v7 = v14;
  *a1 = v15;
  time_t v8 = v13;
  *a2 = v7 + 1000000000 * v13;
  if (a3)
  {
    time_t v12 = v8;
    uint64_t result = (uint64_t)localtime_r(&v12, &v11);
    int tm_isdst = v11.tm_isdst;
    unint64_t v10 = ((unsigned __int128)(v11.tm_gmtoff * (__int128)0x7777777777777777LL) >> 64) - v11.tm_gmtoff;
    *a3 = (v10 >> 5) + (v10 >> 63) + 60 * v11.tm_isdst;
    a3[1] = tm_isdst;
  }

  return result;
}

void _os_trace_log_simple(char *a1, ...)
{
  v1[0] = 0LL;
  va_copy((va_list)&v1[1], va);
  vasprintf((char **)v1, a1, va);
  _simple_asl_log();
  free(v1[0]);
}

void *_os_trace_memdup(const void *a1, size_t __size)
{
  while (1)
  {
    size_t v4 = malloc(__size);
    if (v4) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }

  return memcpy(v4, a1, __size);
}

char *_os_trace_strdup(char *__s1)
{
  while (1)
  {
    uint64_t result = strdup(__s1);
    if (result) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }

  return result;
}

void *_os_trace_realloc(void *__ptr, size_t __size)
{
  while (1)
  {
    uint64_t result = realloc(__ptr, __size);
    if (result) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }

  return result;
}

void *_os_trace_calloc(size_t __count, size_t __size)
{
  while (1)
  {
    uint64_t result = calloc(__count, __size);
    if (result) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }

  return result;
}

void *_os_trace_zalloc(size_t __size)
{
  while (1)
  {
    uint64_t result = calloc(1uLL, __size);
    if (result) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }

  return result;
}

uint64_t os_state_add_handler(dispatch_object_s *a1, const void *a2)
{
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0LL, (dispatch_function_t)_os_trace_init_slow);
  }
  if ((dword_18C43B700 & 0x100) != 0 || (MEMORY[0xFFFFFC104] & 0x100) != 0) {
    return 0LL;
  }
  while (1)
  {
    size_t v4 = calloc(1uLL, 0x40uLL);
    if (v4) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }

  int v6 = v4;
  do
    unint64_t v7 = __ldxr(&os_state_add_handler_handle);
  while (__stxr(v7 + 1, &os_state_add_handler_handle));
  v4[2] = v7;
  v4[3] = _Block_copy(a2);
  v6[4] = a1;
  dispatch_retain(a1);
  v6[5] = dyld_image_header_containing_address();
  void v6[6] = 0LL;
  *((_DWORD *)v6 + 14) = 1;
  os_unfair_lock_lock_with_options();
  uint64_t v8 = 24LL;
  if (!byte_18C43B6E0) {
    uint64_t v8 = 8LL;
  }
  int v9 = *(_UNKNOWN **)((char *)&os_state_blocks + v8);
  *int v6 = 0LL;
  v6[1] = v9;
  *int v9 = v6;
  *(_UNKNOWN **)((char *)&os_state_blocks + v8) = v6;
  do
    unsigned int v10 = __ldxr((unsigned int *)&dword_18C43B6E4);
  while (__stxr(v10 + 1, (unsigned int *)&dword_18C43B6E4));
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C43B6D0);
  return v6[2];
}

void os_state_remove_handler(void *a1)
{
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0LL, (dispatch_function_t)_os_trace_init_slow);
  }
  if ((dword_18C43B700 & 0x100) == 0 && (MEMORY[0xFFFFFC104] & 0x100) == 0)
  {
    uint64_t v2 = &os_state_blocks;
    os_unfair_lock_lock_with_options();
    do
    {
      uint64_t v2 = (_UNKNOWN **)*v2;
      if (!v2)
      {
        uint64_t v2 = &off_18C43B6C0;
        while (1)
        {
          uint64_t v2 = (_UNKNOWN **)*v2;
          if (!v2) {
            goto LABEL_11;
          }
          if (v2[2] == a1)
          {
            size_t v3 = (_UNKNOWN **)*v2;
            size_t v4 = v2[1];
            if (*v2) {
              goto LABEL_17;
            }
            off_18C43B6C8 = (_UNKNOWN **)v2[1];
            goto LABEL_19;
          }
        }
      }
    }

    while (*((_BYTE *)v2 + 60) || v2[2] != a1);
    if (byte_18C43B6E0)
    {
      *((_BYTE *)v2 + 60) = 1;
LABEL_11:
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C43B6D0);
      return;
    }

    size_t v3 = (_UNKNOWN **)*v2;
    size_t v4 = v2[1];
    if (*v2)
    {
LABEL_17:
      v3[1] = v4;
      size_t v4 = v2[1];
    }

    else
    {
      off_18C43B6B8 = (_UNKNOWN **)v2[1];
    }

void _os_state_block_entry_free(uint64_t a1)
{
}

void _os_state_request_for_self(uint64_t a1, __int128 *a2, char a3, uint64_t a4)
{
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0LL, (dispatch_function_t)_os_trace_init_slow);
  }
  refreshed = (int *)dword_18C43B70C;
  if (dword_18C43B70C != -1) {
    refreshed = _os_trace_prefs_and_mode_refresh_slow(dword_18C43B70C);
  }
  unsigned int v9 = dword_18C43B710;
  int v10 = dword_18C43B714;
  if (dword_18C43B714 != dword_18C43B710)
  {
    while (1)
    {
      unsigned int v13 = __ldxr((unsigned int *)&dword_18C43B714);
      if (v13 != v10) {
        break;
      }
      if (!__stxr(v9, (unsigned int *)&dword_18C43B714))
      {
        _os_log_preferences_refresh_process(refreshed);
        goto LABEL_6;
      }
    }

    __clrex();
  }

void *___os_state_request_for_self_block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1895FEE08];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t value = *(unsigned __int8 *)(a1 + 72);
  __int128 v34 = *(_OWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v35 = *(void *)(a1 + 56);
  time_t v3 = time(0LL);
  xpc_object_t v4 = xpc_array_create(0LL, 0LL);
  unsigned int v5 = (int *)os_state_blocks;
  unint64_t v6 = 0x18C43B000uLL;
  if (os_state_blocks)
  {
    uint64_t v7 = MEMORY[0x1895FED80];
    dispatch_block_t destructor = (dispatch_block_t)*MEMORY[0x1895FE7A0];
    while (1)
    {
      if ((_DWORD)v35 != 1 || *((void *)v5 + 5) == v2)
      {
        uint64_t v8 = v3 - *((void *)v5 + 6);
        uint64_t v9 = v5[14];
        if (v8 >= v9) {
          break;
        }
      }

LABEL_32:
  if (xpc_array_get_count(v4))
  {
    int v24 = v35;
    xpc_object_t v25 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v25, "operation", 2uLL);
    xpc_dictionary_set_uint64(v25, "aid", v1);
    xpc_dictionary_set_value(v25, "entries", v4);
    if (*(_BYTE *)(v6 + 1914) && v24 != 3) {
      xpc_dictionary_set_BOOL(v25, "quarantined", 1);
    }
    _os_trace_logd_send();
    xpc_release(v25);
  }

  xpc_release(v4);
  *(void *)uint64_t v37 = 0LL;
  uint64_t v38 = v37;
  os_unfair_lock_lock_with_options();
  uint64_t v26 = (unsigned __int8 *)os_state_blocks;
  if (os_state_blocks)
  {
    do
    {
      unsigned int v27 = *(unsigned __int8 **)v26;
      if (v26[60])
      {
        int v28 = (unsigned __int8 **)*((void *)v26 + 1);
        if (v27)
        {
          *((void *)v27 + 1) = v28;
          int v28 = (unsigned __int8 **)*((void *)v26 + 1);
        }

        else
        {
          off_18C43B6B8 = (_UNKNOWN **)*((void *)v26 + 1);
        }

        *int v28 = v27;
        *(void *)uint64_t v26 = 0LL;
        *((void *)v26 + 1) = v38;
        *(void *)uint64_t v38 = v26;
        uint64_t v38 = v26;
        do
          unsigned int v29 = __ldxr((unsigned int *)&dword_18C43B6E4);
        while (__stxr(v29 - 1, (unsigned int *)&dword_18C43B6E4));
      }

      uint64_t v26 = v27;
    }

    while (v27);
  }

  if (off_18C43B6C0)
  {
    *off_18C43B6B8 = off_18C43B6C0;
    *((void *)off_18C43B6C0 + 1) = off_18C43B6B8;
    off_18C43B6B8 = off_18C43B6C8;
    off_18C43B6C0 = 0LL;
    off_18C43B6C8 = &off_18C43B6C0;
  }

  byte_18C43B6E0 = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_18C43B6D0);
  uint64_t result = *(void **)v37;
  if (*(void *)v37)
  {
    do
    {
      unsigned int v31 = (void *)*result;
      _os_state_block_entry_free((uint64_t)result);
      uint64_t result = v31;
    }

    while (v31);
  }

  return result;
}

uint64_t ___os_state_request_for_self_impl_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 40) + 24LL) + 16LL))();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t _os_state_request_for_pidlist(uint64_t a1, int a2)
{
  if (_os_state_request_for_pidlist_onceToken != -1) {
    dispatch_once(&_os_state_request_for_pidlist_onceToken, &__block_literal_global_380);
  }
  uint64_t result = dispatch_semaphore_wait((dispatch_semaphore_t)_os_state_request_for_pidlist_sema, 0LL);
  if (!result)
  {
    if (_os_trace != -1) {
      dispatch_once_f(&_os_trace, 0LL, (dispatch_function_t)_os_trace_init_slow);
    }
    if (dword_18C43B70C != -1) {
      _os_trace_prefs_and_mode_refresh_slow(dword_18C43B70C);
    }
    unsigned int v5 = dword_18C43B710;
    int v6 = dword_18C43B714;
    if (dword_18C43B714 != dword_18C43B710)
    {
      while (1)
      {
        unsigned int v7 = __ldxr((unsigned int *)&dword_18C43B714);
        if (v7 != v6) {
          break;
        }
        if (!__stxr(v5, (unsigned int *)&dword_18C43B714))
        {
          _os_log_preferences_refresh_process();
          goto LABEL_9;
        }
      }

      __clrex();
    }

LABEL_9:
    v8[0] = MEMORY[0x1895FED80];
    v8[1] = 0x40000000LL;
    uint64_t v8[2] = ___os_state_request_for_pidlist_block_invoke_2;
    v8[3] = &__block_descriptor_tmp_3_381;
    int v9 = a2;
    v8[4] = a1;
    _os_activity_initiate_impl( (uint64_t)&dword_18010B000,  (uint64_t)"System-wide statedump",  0,  (uint64_t)v8,  (void (*)(uint64_t))___os_state_request_for_pidlist_block_invoke_2);
    return dispatch_semaphore_signal((dispatch_semaphore_t)_os_state_request_for_pidlist_sema);
  }

  return result;
}

uint64_t ___os_state_request_for_pidlist_block_invoke_2(uint64_t a1)
{
  uint64_t result = voucher_get_activity_id();
  if (*(_DWORD *)(a1 + 40))
  {
    uint64_t v3 = result;
    unint64_t v4 = 0LL;
    unsigned int v5 = (mach_port_name_t *)MEMORY[0x1895FFD48];
    int v6 = (uint64_t *)MEMORY[0x1895FF688];
    unsigned int v7 = MEMORY[0x189600168];
    do
    {
      uint64_t result = debug_control_port_for_pid(*v5, *(_DWORD *)(*(void *)(a1 + 32) + 4 * v4), &name);
      if ((_DWORD)result) {
        BOOL v8 = 1;
      }
      else {
        BOOL v8 = name == 0;
      }
      if (!v8)
      {
        uint64_t v11 = *v6;
        uint64_t v12 = v3;
        msg.msgh_bits = 19;
        msg.msgh_remote_port = name;
        msg.msgh_local_port = 0;
        msg.msgh_voucher_port = 0;
        msg.msgh_id = 50001;
        if (v7) {
          voucher_mach_msg_set(&msg);
        }
        if (mach_msg(&msg, 17, 0x28u, 0, 0, 0x32u, 0) == 268435460)
        {
          if ((msg.msgh_bits & 0x1F00) == 0x1100) {
            mach_port_deallocate(*v5, msg.msgh_local_port);
          }
          mach_msg_destroy(&msg);
        }

        uint64_t result = mach_port_deallocate(*v5, name);
      }

      ++v4;
    }

    while (v4 < *(unsigned int *)(a1 + 40));
  }

  return result;
}

dispatch_semaphore_t ___os_state_request_for_pidlist_block_invoke()
{
  dispatch_semaphore_t result = dispatch_semaphore_create(1LL);
  _os_state_request_for_pidlist_sema = (uint64_t)result;
  return result;
}

unsigned int os_activity_get_active(os_activity_id_t *entries, unsigned int *count)
{
  if (*count >= 2)
  {
    os_activity_id_t activity_id = voucher_get_activity_id();
    *entries = activity_id;
    if (entries[1]) {
      unsigned int result = (activity_id != 0) + 1;
    }
    else {
      unsigned int result = activity_id != 0;
    }
    goto LABEL_7;
  }

  if (*count == 1)
  {
    os_activity_id_t v6 = voucher_get_activity_id();
    *entries = v6;
    unsigned int result = v6 != 0;
LABEL_7:
    *count = result;
    return result;
  }

  return 0;
}

os_activity_t _os_activity_start(void *dso, const char *description, os_activity_flag_t flags)
{
  return 0LL;
}

uint64_t os_activity_diagnostic_for_pid()
{
  return 0LL;
}

uint64_t os_activity_for_task_thread()
{
  return 0LL;
}

uint64_t os_activity_for_thread()
{
  return 0LL;
}

uint64_t os_activity_messages_for_thread()
{
  return 0LL;
}

uint64_t (*libtraceMIG_server_routine(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

void _XChangeMode(_DWORD *a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1895FEE08];
  if ((*a1 & 0x80000000) != 0 || a1[1] != 44)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1895FF688];
  }

  else
  {
    if ((dword_18C43B700 & 0x100) == 0)
    {
      int v3 = a1[8];
      int v4 = a1[9];
      int v5 = a1[10];
      if ((MEMORY[0xFFFFFC104] & 0x100) == 0)
      {
        if (_os_trace != -1)
        {
          int v8 = a1[8];
          dispatch_once_f(&_os_trace, 0LL, (dispatch_function_t)_os_trace_init_slow);
          int v3 = v8;
        }

        int v6 = dword_18C43B700;
        int v7 = v3 & 0xFFFFFF;
        dword_18C43B700 = v3 & 0xFFFFFF;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v9[0] = 67109888;
          v9[1] = v6;
          __int16 v10 = 1024;
          int v11 = v7;
          __int16 v12 = 1024;
          int v13 = v4;
          __int16 v14 = 1024;
          int v15 = v5;
          _os_log_impl( &dword_18010B000,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Change Mode: %{os_trace_procmode_t}d, Final: %{os_trace_procmode_t}d, Interval: %d, Filter: 0x%x",  (uint8_t *)v9,  0x1Au);
        }
      }
    }

    *(_DWORD *)(a2 + 32) = 0;
  }

void _XStateDump(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 40)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1895FF688];
  }

  else
  {
    _os_state_request_for_self(*(void *)(a1 + 32), &ostracemig_do_StateDump_hints, 14, 0LL);
    *(_DWORD *)(a2 + 32) = 0;
  }

_DWORD *_XGetMode(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    uint64_t v5 = *MEMORY[0x1895FF688];
  }

  else
  {
    mach_port_t v3 = result[2];
    int v4 = (uint64_t *)MEMORY[0x1895FF688];
    uint64_t v7 = *MEMORY[0x1895FF688];
    int v8 = 0;
    int v9 = dword_18C43B700;
    uint64_t v10 = 0LL;
    v6.msgh_bits = 18;
    v6.msgh_remote_port = v3;
    v6.msgh_id = 50102;
    *(void *)&v6.msgh_local_port = 0LL;
    if (MEMORY[0x189600168]) {
      voucher_mach_msg_set(&v6);
    }
    unsigned int result = (_DWORD *)mach_msg(&v6, 1, 0x30u, 0, 0, 0, 0);
    *(_DWORD *)(a2 + 32) = -305;
    uint64_t v5 = *v4;
  }

  *(void *)(a2 + 24) = v5;
  return result;
}

size_t _os_log_fmt_decode_error(size_t result)
{
  if ((*(_WORD *)(result + 20) & 2) == 0)
  {
    uint64_t v1 = *(unsigned int *)(result + 8);
    if ((*(char *)(result + 22) + *(_DWORD *)(result + 12) - v1 - 1) <= 0x15)
    {
      return os_trace_blob_add_slow(result, "<decode: missing data>", 0x16uLL);
    }

    else
    {
      qmemcpy((void *)(*(void *)result + v1), "<decode: missing data>", 22);
      unsigned int v2 = *(_DWORD *)(result + 8) + 22;
      *(_DWORD *)(result + 8) = v2;
      if (!*(_BYTE *)(result + 22)) {
        *(_BYTE *)(*(void *)result + v2) = 0;
      }
    }
  }

  return result;
}

uint64_t _os_log_fmt_decode_cmd_mismatch( uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = a5;
  os_trace_blob_addf(a1, "<decode: mismatch for [%.*s] got [", a3, (uint64_t)a4, a5, a6, a7, a8, a3);
  unint64_t v17 = *a4;
  if (v17 > 0x4F)
  {
    os_trace_blob_addf(a1, "%d", v11, v12, v13, v14, v15, v16, *a4 >> 4);
  }

  else
  {
    xpc_object_t v18 = _cmd_type2str[v17 >> 4];
    unint64_t v19 = strlen(v18);
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      int v26 = v19;
      uint64_t v27 = *(unsigned int *)(a1 + 8);
      if (v19 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v27 - 1))
      {
        os_trace_blob_add_slow(a1, v18, v19);
      }

      else
      {
        memcpy((void *)(*(void *)a1 + v27), v18, v19);
        unsigned int v28 = *(_DWORD *)(a1 + 8) + v26;
        *(_DWORD *)(a1 + 8) = v28;
        if (!*(_BYTE *)(a1 + 22)) {
          *(_BYTE *)(*(void *)a1 + v28) = 0;
        }
      }
    }
  }

  if ((*a4 & 2) != 0 && (*(_WORD *)(a1 + 20) & 2) == 0)
  {
    uint64_t v29 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v29 - 1) <= 6)
    {
      os_trace_blob_add_slow(a1, " public", 7uLL);
    }

    else
    {
      uint64_t v30 = (_DWORD *)(*(void *)a1 + v29);
      *(_DWORD *)((char *)v30 + 3) = 1667853410;
      *uint64_t v30 = 1651863584;
      unsigned int v31 = *(_DWORD *)(a1 + 8) + 7;
      *(_DWORD *)(a1 + 8) = v31;
      if (!*(_BYTE *)(a1 + 22)) {
        *(_BYTE *)(*(void *)a1 + v31) = 0;
      }
    }
  }

  if ((*a4 & 1) != 0 && (*(_WORD *)(a1 + 20) & 2) == 0)
  {
    uint64_t v32 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v32 - 1) <= 7)
    {
      os_trace_blob_add_slow(a1, " private", 8uLL);
    }

    else
    {
      *(void *)(*(void *)a1 + v32) = 0x6574617669727020LL;
      unsigned int v33 = *(_DWORD *)(a1 + 8) + 8;
      *(_DWORD *)(a1 + 8) = v33;
      if (!*(_BYTE *)(a1 + 22)) {
        *(_BYTE *)(*(void *)a1 + v33) = 0;
      }
    }
  }

  return os_trace_blob_addf(a1, " sz:%d]>", v20, v21, v22, v23, v24, v25, v8);
}

uint64_t _os_log_fmt_decode_bad_range( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_trace_blob_addf( a1,  "<decode: bad range for [%.*s] got [offs:%d len:%d within:%d]>",  a3,  a4,  a5,  a6,  a7,  a8,  a3);
}

uint64_t _os_log_fmt_decode_masked_unknown( uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t _os_log_fmt_decode_give_up( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_trace_blob_addf(a1, "<decode: can't compose [%.*s]>", a3, a4, a5, a6, a7, a8, a3);
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895FED58](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

mach_header_64 *_NSGetMachExecuteHeader(void)
{
  return (mach_header_64 *)MEMORY[0x1895FEDA8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895FF6D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895FEDD0](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895FEDD8]();
}

uint64_t __sandbox_ms()
{
  return MEMORY[0x1895FF808]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x1895FEDF0](a1, a2, *(void *)&a3, a4, a5);
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1895FEDF8](a1, *(void *)&a2, a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895FEE38]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895FEE48](*(void *)&a1);
}

uint64_t __ulock_wait()
{
  return MEMORY[0x1895FF888]();
}

uint64_t __ulock_wake()
{
  return MEMORY[0x1895FF898]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x1895FE7F8]();
}

uint64_t _dyld_dlsym_blocked()
{
  return MEMORY[0x1895FEBD8]();
}

const mach_header *__cdecl _dyld_get_image_header(uint32_t image_index)
{
  return (const mach_header *)MEMORY[0x1895FEBE8](*(void *)&image_index);
}

const char *__cdecl _dyld_get_image_name(uint32_t image_index)
{
  return (const char *)MEMORY[0x1895FEBF0](*(void *)&image_index);
}

uint64_t _dyld_get_image_slide()
{
  return MEMORY[0x1895FEBF8]();
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x1895FEC00]();
}

uint64_t _dyld_get_prog_image_header()
{
  return MEMORY[0x1895FEC10]();
}

uint64_t _dyld_get_shared_cache_range()
{
  return MEMORY[0x1895FEC18]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x1895FEC20]();
}

uint32_t _dyld_image_count(void)
{
  return MEMORY[0x1895FEC28]();
}

uint64_t _dyld_is_memory_immutable()
{
  return MEMORY[0x1895FEC38]();
}

void _dyld_register_func_for_add_image(void (__cdecl *func)(const mach_header *, intptr_t))
{
}

void _dyld_register_func_for_remove_image(void (__cdecl *func)(const mach_header *, intptr_t))
{
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1895FEE58]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1895FEE60]();
}

uint64_t _os_assumes_log_ctx()
{
  return MEMORY[0x1895FEE68]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895FEE78]();
}

uint64_t _os_object_alloc_realized()
{
  return MEMORY[0x1895FE848]();
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x1896004C0]();
}

uint64_t _simple_sappend()
{
  return MEMORY[0x1896004F8]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895FEF50](a1, a2);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1895FEF70](a1, *(void *)&a2);
}

int backtrace_from_fp(void *startfp, void **array, int size)
{
  return MEMORY[0x1895FEF78](startfp, array, *(void *)&size);
}

void backtrace_image_offsets(void *const *array, image_offset *image_offsets, int size)
{
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1896009D0]();
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x1896009E0](*(void *)&r);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x189600258](__count, __size);
}

uint64_t cc_clear()
{
  return MEMORY[0x1895FE160]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1895FE2E8]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x1895FE2F0]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x1895FE2F8]();
}

uint64_t ccmd5_di()
{
  return MEMORY[0x1895FE470]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1895FE618]();
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x1896164B8](cls);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1896164D0](cls);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1895FEFB0](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1895FF960](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FEFB8](a1);
}

char *__cdecl ctime_r(const time_t *a1, char *a2)
{
  return (char *)MEMORY[0x1895FEFD0](a1, a2);
}

kern_return_t debug_control_port_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return MEMORY[0x1895FF990](*(void *)&target_tport, *(void *)&pid, t);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_perform(dispatch_block_flags_t flags, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create( const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1895FE8F0](buffer, size, queue, destructor);
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1895FE9D0]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FEA28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FEA40](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2( const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1895FEA48](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FEA78](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FEA80](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FEA88](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FEC80](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FEC88](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1895FF998](*(void *)&a1);
}

uint64_t dyld_image_header_containing_address()
{
  return MEMORY[0x1895FECA0]();
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1895FECA8]();
}

uint64_t dyld_sdk_at_least()
{
  return MEMORY[0x1895FECC0]();
}

uint64_t dyld_shared_cache_iterate_text()
{
  return MEMORY[0x1895FECC8]();
}

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x1895FF010](*(void *)&a1);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FF9F8](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1895FF080](a1, a2);
}

void free(void *a1)
{
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1895FFA78](*(void *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FF0E8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FFAA8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1895FFAE0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FF100]();
}

uint8_t *__cdecl getsegmentdata(const mach_header_64 *mhp, const char *segname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x1895FECE8](mhp, segname, size);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1895FF108](a1, a2);
}

kern_return_t host_set_atm_diagnostic_flag(host_priv_t host_priv, uint32_t diagnostic_flag)
{
  return MEMORY[0x1895FFB68](*(void *)&host_priv, *(void *)&diagnostic_flag);
}

int isatty(int a1)
{
  return MEMORY[0x1895FF140](*(void *)&a1);
}

int issetugid(void)
{
  return MEMORY[0x1895FFB80]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1895FF150](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FFBF0](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1895FFC20]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1895FFC28](*(void *)&error_value);
}

uint64_t mach_get_times()
{
  return MEMORY[0x1895FFC70]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1895FFC78]();
}

mach_msg_return_t mach_msg( mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1895FFC90]( msg,  *(void *)&option,  *(void *)&send_size,  *(void *)&rcv_size,  *(void *)&rcv_name,  *(void *)&timeout,  *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_construct( ipc_space_t task, mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  return MEMORY[0x1895FFCB8](*(void *)&task, options, context, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FFCC0](*(void *)&task, *(void *)&name);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1895FFD60](*(void *)&target, address, size, *(void *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1895FFD70](*(void *)&target, address, size);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x189600268](__size);
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FF160](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FF168](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FF170](__dst, __src, __n);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1895FFDF8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FFE30](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x189600358](*(void *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x189600360](*(void *)&token, check);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x189600388](name, out_token);
}

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x189600390](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1896165F8](exc_buf);
}

id objc_constructInstance(Class cls, void *bytes)
{
  return (id)MEMORY[0x189616608](cls, bytes);
}

void objc_end_catch(void)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

void objc_terminate(void)
{
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1896169A8](a1);
}

BOOL object_isClass(id obj)
{
  return MEMORY[0x1896169D0](obj);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1895FFE70](*(void *)&a1, a2, *(void *)&a3);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FF1C0](a1);
}

uint64_t os_fault_with_payload()
{
  return MEMORY[0x1895FFE88]();
}

void os_release(void *object)
{
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x1895FEB48](object);
}

uint64_t os_simple_hash()
{
  return MEMORY[0x1895FF5A0]();
}

void os_unfair_lock_assert_owner(os_unfair_lock_t lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x189600568]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_check()
{
  return MEMORY[0x1895FF5B0]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1895FF5C0]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FFEF8](*(void *)&__fd, __buf, __nbyte, a4);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1895FFF10](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1896006B0](a1);
}

int pthread_is_threaded_np(void)
{
  return MEMORY[0x1896006C0]();
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1896006C8](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x189600758](a1, a2);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1895FF210](a1);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x189600320](__ptr, __size);
}

void rewinddir(DIR *a1)
{
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x189616A68](str);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1895FF290](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FF2A0](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FF2C8](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FF2D0](__big, __little);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FF2E0](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FF2E8](__s1, __s2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1895FF2F8](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FF300](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FF308](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FF328](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FF330](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1895FF338](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FF340](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1895FF350](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1895FF358](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1895FF360](__big, __little, __len);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FF370](__s, *(void *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1895FF378](__stringp, __delim);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1895FF380](__s, __charset);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FF388](__big, __little);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FF3B0](__str, __endptr, *(void *)&__base);
}

uint64_t symptom_framework_init()
{
  return MEMORY[0x1896007F0]();
}

uint64_t symptom_new()
{
  return MEMORY[0x1896007F8]();
}

uint64_t symptom_send()
{
  return MEMORY[0x189600800]();
}

uint64_t symptom_set_additional_qualifier()
{
  return MEMORY[0x189600808]();
}

uint64_t symptom_set_qualifier()
{
  return MEMORY[0x189600810]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FF3E8](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FF3F0](a1, a2, a3, a4, a5);
}

kern_return_t task_set_special_port(task_t task, int which_port, mach_port_t special_port)
{
  return MEMORY[0x1896000A8](*(void *)&task, *(void *)&which_port, *(void *)&special_port);
}

uint64_t thread_stack_async_pcs()
{
  return MEMORY[0x1895FF400]();
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FF410](a1);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1895FF440](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1895FF458](uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FF478](a1, a2, a3);
}

uint64_t voucher_activity_create_with_data_2()
{
  return MEMORY[0x1895FEB50]();
}

uint64_t voucher_activity_flush()
{
  return MEMORY[0x1895FEB58]();
}

uint64_t voucher_activity_get_logging_preferences()
{
  return MEMORY[0x1895FEB60]();
}

uint64_t voucher_activity_get_metadata_buffer()
{
  return MEMORY[0x1895FEB68]();
}

uint64_t voucher_activity_id_allocate()
{
  return MEMORY[0x1895FEB70]();
}

uint64_t voucher_activity_initialize_4libtrace()
{
  return MEMORY[0x1895FEB78]();
}

uint64_t voucher_activity_should_send_strings()
{
  return MEMORY[0x1895FEB80]();
}

uint64_t voucher_activity_trace()
{
  return MEMORY[0x1895FEB88]();
}

uint64_t voucher_activity_trace_v_2()
{
  return MEMORY[0x1895FEB90]();
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1895FEB98]();
}

uint64_t voucher_copy()
{
  return MEMORY[0x1895FEBA0]();
}

uint64_t voucher_get_activity_id()
{
  return MEMORY[0x1895FEBB0]();
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x189600168](msg);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1895FF488](__str, __size, __format, a4);
}

size_t wcslen(const __int32 *a1)
{
  return MEMORY[0x1895FF498](a1);
}

size_t wcsnlen(const __int32 *a1, size_t a2)
{
  return MEMORY[0x1895FF4A0](a1, a2);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x189600208](*(void *)&__fd, __buf, __nbyte);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x189600218](*(void *)&a1, a2, *(void *)&a3);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1896009F8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x189600A00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x189600A08](xarray);
}

void xpc_array_set_data(xpc_object_t xarray, size_t index, const void *bytes, size_t length)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x189600A40](xBOOL);
}

uint64_t xpc_bundle_create_main()
{
  return MEMORY[0x189600A50]();
}

uint64_t xpc_bundle_get_info_dictionary()
{
  return MEMORY[0x189600A60]();
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x189600AE0](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x189600AF0]();
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x189600AF8]();
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x189600B08](ddata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x189600B30](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x189600B40](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x189600B48]();
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x189600B58](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x189600B68](xdict);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x189600B78](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x189600B80](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x189600B88](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x189600B90](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x189600BA0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x189600C10](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x189600C20](xint);
}

uint64_t xpc_pipe_create()
{
  return MEMORY[0x189600C38]();
}

uint64_t xpc_pipe_invalidate()
{
  return MEMORY[0x189600C48]();
}

uint64_t xpc_pipe_routine()
{
  return MEMORY[0x189600C50]();
}

uint64_t xpc_pipe_simpleroutine()
{
  return MEMORY[0x189600C58]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x189600C68](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x189600C88](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x189600CA0](xuint);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x189600CC8](xuuid);
}

uint64_t asl_new_delayInitStub(double a1)
{
  return MEMORY[0x1895FED08]();
}

uint64_t asl_set_delayInitStub(double a1)
{
  return MEMORY[0x1895FED30]();
}

uint64_t asl_send_delayInitStub(double a1)
{
  return MEMORY[0x1895FED28]();
}

uint64_t asl_release_delayInitStub(double a1)
{
  return MEMORY[0x1895FED20]();
}

uint64_t asl_open_delayInitStub(double a1)
{
  return MEMORY[0x1895FED18]();
}

uint64_t asl_set_filter_delayInitStub(double a1)
{
  return MEMORY[0x1895FED38]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_libsystem_asl_dylib( double a1)
{
  return a1;
}

uint64_t objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_);
}