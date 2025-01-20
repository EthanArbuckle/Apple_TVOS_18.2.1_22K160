void sub_100001EEC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100001F08(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100001F18(uint64_t a1)
{
}

uint64_t sub_100001F20(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  xpc_type_t type = xpc_get_type(v5);
  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    v12 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", xpc_BOOL_get_value(v5));
    id v13 = (id)objc_claimAutoreleasedReturnValue(v12);
LABEL_22:
    v22 = v13;
    [v11 addObject:v13];

    uint64_t v10 = 1LL;
    goto LABEL_23;
  }

  if (type == (xpc_type_t)&_xpc_type_string)
  {
    v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    v14 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  xpc_string_get_string_ptr(v5),  4LL);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v14);
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    v15 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", xpc_int64_get_value(v5));
    id v13 = (id)objc_claimAutoreleasedReturnValue(v15);
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_uint64)
  {
    v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    v16 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  xpc_uint64_get_value(v5));
    id v13 = (id)objc_claimAutoreleasedReturnValue(v16);
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_data)
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    size_t length = xpc_data_get_length(v5);
    v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", bytes_ptr, length));
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_double)
  {
    v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    v19 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", xpc_double_get_value(v5));
    id v13 = (id)objc_claimAutoreleasedReturnValue(v19);
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithXPCDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithXPCDictionary:",  v5));
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_array)
  {
    v20 = *(void **)(a1 + 32);
    v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v13 = [v20 initWithXPCArray:v5];
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_date)
  {
    v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    v21 = +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)xpc_date_get_value(v5));
    id v13 = (id)objc_claimAutoreleasedReturnValue(v21);
    goto LABEL_22;
  }

  id v7 = sub_100021D84();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100025618(a2, v8, v9);
  }

  uint64_t v10 = 0LL;
LABEL_23:

  return v10;
}

void sub_1000022A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000022B8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = a2;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = *(void **)(a1 + 32);
    xpc_object_t v9 = xpc_string_create((const char *)[v6 UTF8String]);
LABEL_5:
    v12 = v9;
    xpc_array_append_value(v8, v9);

    goto LABEL_6;
  }

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
  {
    v8 = *(void **)(a1 + 32);
    id v11 = v6;
    xpc_object_t v9 = xpc_data_create([v11 bytes], (size_t)objc_msgSend(v11, "length"));
    goto LABEL_5;
  }

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v6, v13) & 1) != 0)
  {
    id v14 = v6;
    if (!strcmp((const char *)[v14 objCType], "i")
      || (id v15 = v14, !strcmp((const char *)[v15 objCType], "s"))
      || (id v16 = v15, !strcmp((const char *)[v16 objCType], "q"))
      || (id v17 = v16, !strcmp((const char *)[v17 objCType], "q")))
    {
      v25 = *(void **)(a1 + 32);
      xpc_object_t v26 = xpc_int64_create((int64_t)[v14 longLongValue]);
    }

    else
    {
      id v18 = v17;
      if (!strcmp((const char *)[v18 objCType], "f")
        || (id v19 = v18, !strcmp((const char *)[v19 objCType], "d")))
      {
        v25 = *(void **)(a1 + 32);
        [v18 doubleValue];
        xpc_object_t v26 = xpc_double_create(v33);
      }

      else
      {
        id v20 = v19;
        if (strcmp((const char *)[v20 objCType], "B"))
        {
          id v21 = v20;
          if (strcmp((const char *)[v21 objCType], "c"))
          {
            id v22 = sub_100021D84();
            v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              sub_100025684(v21, v23);
            }

            *a4 = 1;
            *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
            goto LABEL_23;
          }
        }

        v25 = *(void **)(a1 + 32);
        xpc_object_t v26 = xpc_BOOL_create((BOOL)[v20 BOOLValue]);
      }
    }

    v27 = v26;
    xpc_array_append_value(v25, v26);

LABEL_23:
    goto LABEL_6;
  }

  uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v6, v24) & 1) != 0)
  {
    v8 = *(void **)(a1 + 32);
    xpc_object_t v9 = (xpc_object_t)objc_claimAutoreleasedReturnValue([v6 xpcArrayFromArray]);
    goto LABEL_5;
  }

  uint64_t v28 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v6, v28) & 1) != 0)
  {
    v8 = *(void **)(a1 + 32);
    xpc_object_t v9 = (xpc_object_t)objc_claimAutoreleasedReturnValue([v6 createXPCDictionary]);
    goto LABEL_5;
  }

  uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSDate);
  if ((objc_opt_isKindOfClass(v6, v29) & 1) != 0)
  {
    v8 = *(void **)(a1 + 32);
    [v6 timeIntervalSince1970];
    xpc_object_t v9 = xpc_date_create((uint64_t)v30);
    goto LABEL_5;
  }

  id v31 = sub_100021D84();
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    sub_100025708(v32);
  }

  *a4 = 1;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
LABEL_6:
}

void sub_10000260C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

LABEL_9:
  id v17 = 0;
LABEL_15:

  return v17;
}

void sub_100002B20( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

char *sub_100002B58(int *a1)
{
  return strerror(*a1);
}

LABEL_7:
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v5,  (unint64_t)[v3 length] >> 1,  1));
LABEL_8:

  return (NSData *)v8;
}

      v8 = v43;
      id v6 = v44;
      xpc_object_t v9 = v42;
    }

    else if (([v9 isEqualToString:@"ExtensionData"] & 1) != 0 {
           || ([v9 isEqualToString:@"AppData"] & 1) != 0
    }
           || [v9 isEqualToString:@"GroupData"])
    {
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"Identifier"]);
      double v30 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v28]);
      id v31 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v30, v31) & 1) == 0)
      {
        v38 = sub_100021D84();
        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
          sub_100028548();
        }

        goto LABEL_10;
      }

      v32 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:@"RigorousCheckType"]);
      double v33 = [v32 isEqualToString:@"Skip"];

      if ((v33 & 1) != 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }

    v27 = sub_100021D84();
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_100028460();
    }
    goto LABEL_10;
  }

  uint64_t v29 = 1;
LABEL_22:

  return v29;
}

LABEL_6:
  return v10;
}

  return v10;
}

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v4));
  id v11 = v10;
LABEL_7:

  return v17;
}

LABEL_12:
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v10 != v7);
      id v31 = [v5 countByEnumeratingWithState:&v47 objects:v60 count:16];
      uint64_t v7 = v31;
    }

    while (v31);
  }

  v3 = 1;
LABEL_34:

  return v3;
}

  id v17 = 0LL;
LABEL_52:

  return v17;
}

void sub_100005250( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005274(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100005284(uint64_t a1)
{
}

void sub_10000528C(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingPathComponent:a2]);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqualToString:@"/"] & 1) == 0)
  {
    xpc_object_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) nonContainerizedContentRoots]);
    unsigned int v10 = [v9 containsObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    if (v10)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
      *a4 = 1;
    }
  }
}

void sub_10000617C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000618C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10000619C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

void sub_1000061C4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

CFStringRef sub_10000656C(unsigned __int8 *a1)
{
  return CFStringCreateWithCString(kCFAllocatorDefault, __str, 0x8000100u);
}

unsigned __int8 *sub_100006668(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  v4 = sub_1000066C8(a2);
  id v5 = v4;
  if (v4)
  {
    v4 = sub_1000066C8(a3);
    if (v4)
    {
      for (uint64_t i = 0LL; i != 20; ++i)
        v5[i] ^= v4[i];
    }
  }

  free(v4);
  return v5;
}

unsigned __int8 *sub_1000066C8(const __CFString *a1)
{
  if (!a1) {
    return 0LL;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 == CFBooleanGetTypeID())
  {
    v3 = (unsigned __int8 *)calloc(1uLL, 0x14uLL);
    LOBYTE(v17.h0) = CFBooleanGetValue((CFBooleanRef)a1);
    v4 = &v17;
    CC_LONG Length = 1;
LABEL_10:
    CC_SHA1(v4, Length, v3);
    return v3;
  }

  if (v2 != CFStringGetTypeID())
  {
    if (v2 == CFDateGetTypeID())
    {
      v3 = (unsigned __int8 *)calloc(1uLL, 0x14uLL);
      *(void *)&v17.h0 = CFDateGetAbsoluteTime((CFDateRef)a1);
      v4 = &v17;
      CC_LONG Length = 8;
      goto LABEL_10;
    }

    if (v2 == CFDataGetTypeID())
    {
      v3 = (unsigned __int8 *)calloc(1uLL, 0x14uLL);
      BytePtr = CFDataGetBytePtr((CFDataRef)a1);
      CC_LONG Length = CFDataGetLength((CFDataRef)a1);
      v4 = (CC_SHA1_CTX *)BytePtr;
      goto LABEL_10;
    }

    if (v2 == CFArrayGetTypeID())
    {
      if (CFArrayGetCount((CFArrayRef)a1))
      {
        if (!sub_100006EBC((const __CFArray *)a1))
        {
          v3 = (unsigned __int8 *)sub_1000066C8(@"array");
          CC_SHA1_Init(&v17);
          if (CFArrayGetCount((CFArrayRef)a1) >= 1)
          {
            CFIndex v12 = 0LL;
            do
            {
              ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v12);
              uint64_t v14 = (unsigned __int8 *)sub_1000066C8(ValueAtIndex);
              if (!v14) {
                break;
              }
              id v15 = v14;
              CC_SHA1_Update(&v17, v14, 0x14u);
              CC_SHA1_Final(v15, &v17);
              if (v3)
              {
                for (uint64_t i = 0LL; i != 20; ++i)
                  v3[i] ^= v15[i];
              }

              free(v15);
              ++v12;
            }

            while (CFArrayGetCount((CFArrayRef)a1) > v12);
          }

          return v3;
        }

        id v9 = sub_100021D84();
        unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17.h0) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Failing to hash due to duplicate array entries",  (uint8_t *)&v17,  2u);
        }
      }
    }

    else
    {
      if (v2 == CFDictionaryGetTypeID()) {
        return (unsigned __int8 *)sub_100006CB8((const __CFDictionary *)a1);
      }
      if (v2 == CFNumberGetTypeID()) {
        return sub_100006E0C((const __CFNumber *)a1);
      }
    }

    return 0LL;
  }

  v3 = (unsigned __int8 *)calloc(1uLL, 0x14uLL);
  size_t v6 = CFStringGetLength(a1) + 1;
  uint64_t v7 = (char *)calloc(1uLL, v6);
  CFStringGetCString(a1, v7, v6, 0x8000100u);
  CC_SHA1(v7, v6, v3);
  free(v7);
  return v3;
}

CFDataRef sub_100006978( const __CFAllocator *a1, const __CFString *a2, CFStringRef theString1, uint64_t a4, void (*a5)(uint64_t, float, float), uint64_t a6)
{
  if (CFStringCompare(theString1, @"SHA-1", 0LL) == kCFCompareEqualTo)
  {
    id v21 = CFURLCreateWithFileSystemPath(a1, a2, kCFURLPOSIXPathStyle, 0);
    if (!v21)
    {
      id v34 = sub_100021D84();
      CFIndex v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100026964((uint64_t)a2, v12);
      }
      goto LABEL_4;
    }

    id v22 = v21;
    v23 = CFReadStreamCreateWithFile(a1, v21);
    if (!v23)
    {
      id v35 = sub_100021D84();
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_1000269D4();
      }

      CFDataRef v20 = 0LL;
      goto LABEL_40;
    }

    uint64_t v24 = v23;
    if (CFReadStreamOpen(v23))
    {
      if (a5) {
        a5(a6, 0.0, -1.0);
      }
      CC_SHA1_Init(&c);
      v25 = (UInt8 *)calloc(1uLL, 0x10000uLL);
      if (v25)
      {
        xpc_object_t v26 = v25;
        gettimeofday(&v59, 0LL);
        CFIndex v27 = CFReadStreamRead(v24, v26, 0x10000LL);
        if (v27 < 1)
        {
LABEL_18:
          CC_SHA1_Final(md, &c);
          CFDataRef v32 = CFDataCreate(a1, md, 20LL);
          if (v32)
          {
            CFDataRef v20 = v32;
            CFStringRef v33 = sub_10000656C(md);
            if (v33) {
              CFRelease(v33);
            }
            if (a5) {
              a5(a6, 1.0, -1.0);
            }
            goto LABEL_38;
          }

          id v47 = sub_100021D84();
          v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            sub_100026AC4(v48, v49, v50, v51, v52, v53, v54, v55);
          }
        }

        else
        {
          CFIndex v28 = v27;
          uint64_t v29 = 0LL;
          while (1)
          {
            CC_SHA1_Update(&c, v26, v28);
            v29 += v28;
            v30.n128_u32[0] = -1.0;
            if (a4) {
              v30.n128_f32[0] = (float)v29 / (float)a4;
            }
            if (a5)
            {
              int v31 = ((uint64_t (*)(uint64_t, __n128, float))a5)(a6, v30, -1.0);
              if (v31) {
                break;
              }
            }

            CFIndex v28 = CFReadStreamRead(v24, v26, 0x10000LL);
            if (v28 <= 0) {
              goto LABEL_18;
            }
          }

          int v56 = v31;
          id v57 = sub_100021D84();
          v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            sub_100026AF4(v56, v48);
          }
        }

        CFDataRef v20 = 0LL;
LABEL_38:
        free(v26);
        goto LABEL_39;
      }

      id v39 = sub_100021D84();
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_100026A94(v38, v40, v41, v42, v43, v44, v45, v46);
      }
    }

    else
    {
      id v37 = sub_100021D84();
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_100026A34();
      }
    }

    CFDataRef v20 = 0LL;
LABEL_39:
    CFReadStreamClose(v24);
    CFRelease(v24);
LABEL_40:
    CFRelease(v22);
    return v20;
  }

  id v11 = sub_100021D84();
  CFIndex v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_100026B64(v12, v13, v14, v15, v16, v17, v18, v19);
  }
LABEL_4:

  return 0LL;
}

uint64_t sub_100006CB8(const __CFDictionary *a1)
{
  if (!CFDictionaryGetCount(a1)) {
    return 0LL;
  }
  uint64_t v2 = sub_1000066C8(@"dictionary");
  int64_t Count = CFDictionaryGetCount(a1);
  v4 = (const void **)calloc(Count, 8uLL);
  CFDictionaryGetKeysAndValues(a1, v4, 0LL);
  if (Count >= 1)
  {
    for (uint64_t i = 0LL; i != Count; ++i)
    {
      size_t v6 = (void *)sub_1000066C8(v4[i]);
      Value = CFDictionaryGetValue(a1, v4[i]);
      v8 = (void *)sub_1000066C8(Value);
      CC_SHA1_Init(&v12);
      id v9 = (unsigned __int8 *)calloc(1uLL, 0x14uLL);
      if (v6)
      {
        CC_SHA1_Update(&v12, v6, 0x14u);
        free(v6);
      }

      if (v8)
      {
        CC_SHA1_Update(&v12, v8, 0x14u);
        free(v8);
      }

      CC_SHA1_Final(v9, &v12);
      if (v2 && v9)
      {
        for (uint64_t j = 0LL; j != 20; ++j)
          *(_BYTE *)(v2 + j) ^= v9[j];
      }

      free(v9);
    }
  }

  free(v4);
  return v2;
}

unsigned __int8 *sub_100006E0C(const __CFNumber *a1)
{
  uint64_t v2 = (unsigned __int8 *)calloc(1uLL, 0x14uLL);
  CFNumberGetValue(a1, kCFNumberSInt64Type, &valuePtr);
  else {
    size_t v3 = 4LL;
  }
  else {
    CFNumberType v4 = kCFNumberSInt64Type;
  }
  id v5 = calloc(1uLL, v3);
  CFNumberGetValue(a1, v4, v5);
  CC_SHA1(v5, v3, v2);
  free(v5);
  return v2;
}

uint64_t sub_100006EBC(const __CFArray *a1)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1) {
    return 0LL;
  }
  CFIndex v3 = Count;
  CFIndex v4 = 0LL;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a1, v4);
    v7.location = 0LL;
    v7.size_t length = v3;
    if (CFArrayGetCountOfValue(a1, v7, ValueAtIndex) >= 2) {
      break;
    }
    if (v3 == ++v4) {
      return 0LL;
    }
  }

  return 1LL;
}

void sub_100006F34( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100006F44(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

LABEL_52:
LABEL_53:
                    self = v55;
                    goto LABEL_54;
                  }

                  [v61 addObject:v28];
                  if (!+[MSDXattr setContentRoot:](&OBJC_CLASS___MSDXattr, "setContentRoot:", v28)) {
                    goto LABEL_53;
                  }
                  v25 = v10;
                }

                else
                {
                  if (v33)
                  {
                    *(_DWORD *)buf = 138543362;
                    v86 = v27;
                    _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  ">>> Skipping non-existent item: %{public}@",  buf,  0xCu);
                  }
                }
              }

              v23 = [v62 countByEnumeratingWithState:&v69 objects:v91 count:16];
              if (v23) {
                continue;
              }
              break;
            }

            unsigned int v10 = v25;
            self = v55;
          }
        }

        else
        {
          v48 = sub_100021D84();
          v62 = (id)objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled((os_log_t)v62, OS_LOG_TYPE_ERROR)) {
            sub_100026B94(&v73, v74, (os_log_s *)v62);
          }
LABEL_54:

          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          v62 = v61;
          uint64_t v41 = [v62 countByEnumeratingWithState:&v64 objects:v84 count:16];
          if (v41)
          {
            uint64_t v42 = v41;
            uint64_t v43 = *(void *)v65;
            while (2)
            {
              for (k = 0LL; k != v42; k = (char *)k + 1)
              {
                if (*(void *)v65 != v43) {
                  objc_enumerationMutation(v62);
                }
                uint64_t v45 = *(const __CFString **)(*((void *)&v64 + 1) + 8LL * (void)k);
                if ([v4 fileExistsAtPath:v45])
                {
                  v63 = v10;
                  uint64_t v46 = [v4 removeItemAtPath:v45 error:&v63];
                  id v9 = v63;

                  if ((v46 & 1) == 0)
                  {
                    uint64_t v50 = sub_100021D84();
                    uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
                    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
                      *(_DWORD *)buf = 138543618;
                      v86 = v45;
                      v87 = 2114;
                      v88 = v52;
                      _os_log_error_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_ERROR,  "Failed to clean up item %{public}@ with error - %{public}@",  buf,  0x16u);
                    }

                    objc_autoreleasePoolPop(context);
                    goto LABEL_73;
                  }

                  unsigned int v10 = v9;
                }
              }

              uint64_t v42 = [v62 countByEnumeratingWithState:&v64 objects:v84 count:16];
              if (v42) {
                continue;
              }
              break;
            }
          }
        }

        objc_autoreleasePoolPop(context);
        id v11 = v59 + 1;
      }

      while ((id)(v59 + 1) != v58);
      uint64_t v49 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v79,  v93,  16LL);
      v58 = v49;
    }

    while (v49);
  }

  id v9 = v10;
LABEL_73:
}

BOOL sub_1000085C4(id a1, NSURL *a2, NSError *a3)
{
  CFIndex v3 = a3;
  id v4 = sub_100021D84();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100026E04(v3, v5);
  }

  return 1;
}

LABEL_33:
      id v5 = v24;
      id v21 = (char *)v21 + 1;
    }

    while (v19 != v21);
    uint64_t v16 = obj;
    uint64_t v40 = [obj countByEnumeratingWithState:&v73 objects:v87 count:16];
    uint64_t v19 = v40;
  }

  while (v40);
LABEL_39:

  unsigned int v10 = v20;
  CC_SHA1_CTX v12 = v15;
  size_t v6 = v66;
  v8 = &selRef_orPredicateWithSubpredicates_;
LABEL_40:
  if (![v8 + 335 isContentRoot:v5])
  {
    v48 = 0LL;
    uint64_t v49 = 1;
    goto LABEL_67;
  }

  uint64_t v41 = [v8 + 335 isContentRootToRemove:v5];
  [v8 + 335 removeXattr:v5];
  CFDataRef v20 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHSnapshottedDataSaver originalPathFor:](self, "originalPathFor:", v5));

  v69 = v12;
  uint64_t v42 = [v6 removeItemAtPath:v20 error:&v69];
  uint64_t v15 = v69;

  if ((v42 & 1) == 0)
  {
    v58 = sub_100021D84();
    id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_100026F8C();
    }
    v48 = 0LL;
    goto LABEL_76;
  }

  CC_SHA1_CTX v12 = v15;
  size_t v6 = v66;
LABEL_44:
  if ((v41 & 1) == 0)
  {
    uint64_t v50 = sub_100021D84();
    uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v80 = (const char *)v5;
      v81 = 2112;
      v82 = (uint64_t)v20;
      _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_DEFAULT,  "Moving content root item %@ to %@.",  buf,  0x16u);
    }

    v48 = (void *)objc_claimAutoreleasedReturnValue([v20 stringByDeletingLastPathComponent]);
    size_t v6 = v66;
    if (([v66 fileExistsAtPath:v48 isDirectory:&v78] & 1) == 0
      && !-[MSDHSnapshottedDataSaver createIntermdediateDirectoriesInPathAndRestoreAttributes:]( self,  "createIntermdediateDirectoriesInPathAndRestoreAttributes:",  v48))
    {
      uint64_t v49 = 0;
      unsigned int v10 = v20;
      goto LABEL_67;
    }

    v68 = v12;
    uint64_t v52 = [v66 moveItemAtPath:v5 toPath:v20 error:&v68];
    uint64_t v15 = v68;

    if ((v52 & 1) != 0)
    {
      uint64_t v49 = 1;
      goto LABEL_66;
    }

    timeval v59 = sub_100021D84();
    id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedDescription]);
      *(_DWORD *)buf = 138412802;
      v80 = (const char *)v5;
      v81 = 2112;
      v82 = (uint64_t)v20;
      v83 = 2112;
      v84 = v60;
      _os_log_error_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "Cannot move %@ to %@.  Error:  %@",  buf,  0x20u);
    }

LABEL_76:
    uint64_t v49 = 0;
    goto LABEL_65;
  }

  v67 = v12;
  uint64_t v43 = [v6 removeItemAtPath:v5 error:&v67];
  uint64_t v15 = v67;

  if ((v43 & 1) == 0)
  {
    uint64_t v44 = sub_100021D84();
    uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      sub_100026F0C();
    }
  }

  uint64_t v46 = sub_100021D84();
  id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v80 = (const char *)v20;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Removed %@.", buf, 0xCu);
  }

  v48 = 0LL;
  uint64_t v49 = 1;
LABEL_65:

LABEL_66:
  unsigned int v10 = v20;
  CC_SHA1_CTX v12 = v15;
  size_t v6 = v66;
LABEL_67:

  return v49;
}

void sub_100009058( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t sub_10000908C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000909C(uint64_t a1)
{
}

void sub_1000090A4(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6 = a1 + 40;
  uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingPathComponent:a2]);
  uint64_t v8 = *(void *)(*(void *)v6 + 8LL);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id v10 = sub_100021D84();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(*(void *)(*(void *)v6 + 8LL) + 40LL);
    *(_DWORD *)buf = 136315394;
    CFStringRef v33 = "-[MSDHSnapshottedDataSaver createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke";
    __int16 v34 = 2112;
    uint64_t v35 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s - intermediatePath:  %@", buf, 0x16u);
  }

  if (([*(id *)(a1 + 32) fileExistsAtPath:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)] & 1) == 0)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter" stringByAppendingPathComponent:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)]);
    uint64_t v14 = *(void **)(a1 + 32);
    id v31 = 0LL;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 attributesOfItemAtPath:v13 error:&v31]);
    id v16 = v31;
    if (v15)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 fileType]);
      unsigned int v18 = [v17 isEqualToString:NSFileTypeDirectory];

      if (v18)
      {
        id v19 = sub_100021D84();
        CFDataRef v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = *(void *)(*(void *)(*(void *)v6 + 8LL) + 40LL);
          *(_DWORD *)buf = 136315394;
          CFStringRef v33 = "-[MSDHSnapshottedDataSaver createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke";
          __int16 v34 = 2112;
          uint64_t v35 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s - Creating directory:  %@",  buf,  0x16u);
        }

        id v22 = *(void **)(a1 + 32);
        uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
        id v30 = v16;
        unsigned __int8 v24 = [v22 createDirectoryAtPath:v23 withIntermediateDirectories:0 attributes:v15 error:&v30];
        id v25 = v30;

        *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v24;
        if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
          goto LABEL_17;
        }
        id v26 = sub_100021D84();
        CFIndex v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_1000271A4(v6, v25);
        }
        id v16 = v25;
      }

      else
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
        id v29 = sub_100021D84();
        CFIndex v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_100027250(v6, v27);
        }
      }
    }

    else
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
      id v28 = sub_100021D84();
      CFIndex v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_10002711C();
      }
    }

    id v25 = v16;
LABEL_17:
    if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
      *a4 = 1;
    }
  }

void sub_100009494( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void sub_1000094E0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1000094F4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

  ;
}

uint64_t sub_100009540(uint64_t a1, uint64_t a2)
{
  return a2;
}

  ;
}

void sub_100009598(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MSDPlatform);
  uint64_t v2 = (void *)qword_10004F808;
  qword_10004F808 = (uint64_t)v1;
}

void sub_100009600(id a1)
{
  byte_10004F818 = NSClassFromString(@"MSDHubBundleManager") != 0LL;
}

LABEL_13:
  uint64_t v6 = sub_100021D84();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPlatform platformType](v2, "platformType"));
    *(_DWORD *)buf = 136315394;
    uint64_t v12 = "-[MSDPlatform init]";
    uint64_t v13 = 2114;
    uint64_t v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: PlatformType '%{public}@'.", buf, 0x16u);
  }

  return v2;
}

  id v28 = sub_100021D84();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v30 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "A certificate for non-manual signing is used.",  v30,  2u);
  }

  id v10 = 0;
LABEL_16:

  return v10;
}

            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19->fts_accpath,  4LL));
            unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v23));
            id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForReadingFromURL:error:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForReadingFromURL:error:",  v24,  0LL));

            if (v25)
            {
              id v26 = archive_entry_new();
              archive_entry_set_pathname(v26, &v19->fts_path[v20]);
              id v31 = disk_new;
              if (archive_read_disk_entry_from_file( disk_new,  v26,  -[os_log_s fileDescriptor](v25, "fileDescriptor"),  v19->fts_statp))
              {
                v38 = sub_100021D84();
                id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
                  sub_1000295F8(&v49, v50);
                }
              }

              else
              {
                if (!archive_write_header(v13, v26))
                {
                  st_size = v19->fts_statp->st_size;
                  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s readDataOfLength:](v25, "readDataOfLength:", st_size));
                  for (i = v28; ; id v28 = i)
                  {
                    if (![v28 length])
                    {
                      archive_entry_free(v26);

                      goto LABEL_10;
                    }

                    id v30 = i;
                    uint64_t i = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s readDataOfLength:](v25, "readDataOfLength:", st_size));
                  }

                  __int16 v34 = sub_100021D84();
                  uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
                    sub_1000295A0(&v49, v50);
                  }

                  goto LABEL_26;
                }

                id v39 = sub_100021D84();
                id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
                  sub_1000295CC(&v49, v50);
                }
              }

              uint64_t v8 = v46;
            }

            else
            {
              v36 = sub_100021D84();
              id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
              uint64_t v8 = v46;
              id v31 = disk_new;
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
                sub_100029574(&v49, v50);
              }
              id v26 = 0LL;
            }

            id v10 = v47;

LABEL_27:
            unsigned int v18 = 0;
            if (v26) {
              archive_entry_free(v26);
            }
LABEL_29:
            if (!v13) {
              goto LABEL_32;
            }
          }

          else
          {
            id v31 = disk_new;
            if (!v13)
            {
LABEL_32:
              if (v31) {
                archive_read_free(v31);
              }
              if (v14) {
                fts_close(v14);
              }
LABEL_36:

              return v18;
            }
          }
        }

        else
        {
          uint64_t v42 = sub_100021D84();
          uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
            sub_100029544();
          }

          unsigned int v18 = 0;
          id v31 = disk_new;
          if (!v13) {
            goto LABEL_32;
          }
        }

        goto LABEL_32;
      }
    }
  }

  uint64_t v44 = sub_100021D84();
  uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
    sub_100029684();
  }

  __break(1u);
  return result;
}

  return (char)v8;
}

  return (char)v9;
}

  return v12;
}

LABEL_26:
  return v12;
}

LABEL_5:
  return v6;
}

  return v7;
}

LABEL_18:
  return v5;
}

LABEL_36:
      if (acl_valid(v47))
      {
        v64 = sub_100021D84();
        v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
          sub_100027604();
        }
      }

      else
      {
        if (!acl_set_file( (const char *)[v4 fileSystemRepresentation], ACL_TYPE_EXTENDED, v47)) {
          goto LABEL_38;
        }
        v66 = sub_100021D84();
        v65 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
          sub_100027A20();
        }
      }

LABEL_38:
      acl_free(v47);
    }

    else
    {
      id v47 = acl_init(0);
      if (v47) {
        goto LABEL_36;
      }
      v67 = sub_100021D84();
      uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        sub_1000279B4();
      }
LABEL_65:
    }
  }

  CFStringRef v33 = 0LL;
LABEL_40:
  uint64_t v54 = 1;
LABEL_41:

  return v54;
}

LABEL_56:
  return v47;
}

int *sub_10000C008()
{
  return __error();
}

  ;
}

  ;
}

  ;
}

LABEL_19:
    id v10 = v5;
    goto LABEL_20;
  }

  if (v6 != 6) {
    goto LABEL_19;
  }
  if (![v5 hasPrefix:@"app."])
  {
    if ([v5 hasPrefix:@"backup."])
    {
      uint64_t v7 = @"backup.";
      goto LABEL_15;
    }

    goto LABEL_7;
  }

  uint64_t v7 = @"app.";
LABEL_15:
  uint64_t v8 = (uint64_t)-[__CFString length](v7, "length");
  id v9 = v5;
LABEL_16:
  id v10 = (id)objc_claimAutoreleasedReturnValue([v9 substringFromIndex:v8]);
LABEL_20:
  id v11 = v10;

  return v11;
}

void sub_10000DCB0(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MSDDemoManifestCheck);
  uint64_t v2 = (void *)qword_10004F830;
  qword_10004F830 = (uint64_t)v1;
}

LABEL_31:
  v159 = 0u;
  v160 = 0u;
  v157 = 0u;
  v158 = 0u;
  obuint64_t j = (os_log_s *)v135;
  v128 = v22;
  v125 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v157,  v175,  16LL);
  uint64_t v35 = 0LL;
  v36 = 0LL;
  id v37 = 0;
  if (v125)
  {
    v126 = *(void *)v158;
    while (1)
    {
      v38 = 0LL;
      do
      {
        if (*(void *)v158 != v126) {
          objc_enumerationMutation(obj);
        }
        id v39 = v35;
        v127 = v38;
        uint64_t v40 = *(void **)(*((void *)&v157 + 1) + 8 * v38);
        v153 = 0u;
        v154 = 0u;
        v155 = 0u;
        v156 = 0u;
        v141 = v40;
        v136 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "objectForKey:"));
        v139 = [v136 countByEnumeratingWithState:&v153 objects:v174 count:16];
        if (!v139) {
          goto LABEL_50;
        }
        v137 = *(void *)v154;
        while (2)
        {
          uint64_t v41 = 0LL;
          do
          {
            v145 = v37;
            v147 = v24;
            uint64_t v42 = v36;
            uint64_t v43 = v23;
            if (*(void *)v154 != v137) {
              objc_enumerationMutation(v136);
            }
            uint64_t v44 = *(const __CFString **)(*((void *)&v153 + 1) + 8LL * (void)v41);
            uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue([v140 objectForKey:v141]);
            v36 = (void *)objc_claimAutoreleasedReturnValue([v45 objectForKey:v44]);

            uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue([v36 objectForKey:@"Certificate"]);
            id v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v143, "objectForKey:", v46));
            v48 = v47;
            uint64_t v35 = v39;
            if (!v47)
            {
              v85 = sub_100021D84();
              v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v85);
              if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
                sub_100028168();
              }
LABEL_100:
              id v16 = v131;
              uint64_t v8 = v132;

              uint64_t v23 = v43;
              id v11 = v133;
              id v22 = v128;
LABEL_101:
              unsigned __int8 v24 = v147;
              goto LABEL_102;
            }

            uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKey:@"TypeOfSignature"]);

            if ((v138 & [v49 isEqualToString:@"UAT"]) == 1)
            {
              v108 = sub_100021D84();
              v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v108);
              if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
                sub_1000281D4(v86, v109, v110, v111, v112, v113, v114, v115);
              }
              goto LABEL_99;
            }

            uint64_t v50 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck getComponentData:](v148, "getComponentData:", v36));

            if (!v50)
            {
              v87 = sub_100021D84();
              v86 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
              if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
                sub_100028244();
              }
              uint64_t v35 = 0LL;
LABEL_99:
              uint64_t v43 = v49;
              goto LABEL_100;
            }

            uint64_t v51 = (__SecKey *)[v48 objectForKey:@"publicKey"];
            uint64_t v52 = v36;
            id v39 = (__CFString *)v50;
            uint64_t v53 = sub_100006668((uint64_t)kCFAllocatorDefault, v44, v50);
            uint64_t v54 = (const __CFData *)objc_claimAutoreleasedReturnValue([v36 objectForKey:@"Signature"]);
            LODWORD(v51) = SecKeyVerifySignature( v51,  kSecKeyAlgorithmRSASignatureDigestPKCS1v15SHA1,  (CFDataRef)+[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v53,  20LL),  v54,  &error);
            free(v53);
            v144 = v52;
            if (!(_DWORD)v51)
            {
              v88 = sub_100021D84();
              v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
              v90 = v131;
              if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                v168 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
                v169 = 2114;
                *(void *)v170 = v44;
                *(_WORD *)&v170[8] = 2114;
                v171 = v141;
                v172 = 2114;
                v173 = error;
                _os_log_error_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_ERROR,  "%s: signature verification failed for %{public}@ in section %{public}@. Error: %{public}@",  buf,  0x2Au);
              }

LABEL_87:
              id v22 = v128;
              uint64_t v35 = v39;
              v36 = v144;
              uint64_t v23 = v49;
              id v16 = v90;
              uint64_t v8 = v132;
              id v11 = v133;
              goto LABEL_101;
            }

            uint64_t v55 = (__CFString *)objc_claimAutoreleasedReturnValue([v48 objectForKey:@"RigorousCheckType"]);

            [v52 setObject:v55 forKey:@"RigorousCheckType"];
            int v56 = -[__CFString isEqualToString:](v55, "isEqualToString:", @"Skip");
            id v57 = v55;
            if (-[__CFString isEqualToString:](v55, "isEqualToString:", @"AppleISTCertCheck")
              && [v141 isEqualToString:@"Apps"]
              && !-[MSDDemoManifestCheck validateISTSignedApp:manifest:]( v148,  "validateISTSignedApp:manifest:",  v44,  v140))
            {
              v147 = v55;
              v90 = v131;
              goto LABEL_87;
            }

            id v37 = v56 ^ 1 | v145;

            uint64_t v41 = (char *)v41 + 1;
            v36 = v144;
            uint64_t v23 = v49;
            unsigned __int8 v24 = v57;
          }

          while (v139 != v41);
          v139 = [v136 countByEnumeratingWithState:&v153 objects:v174 count:16];
          if (v139) {
            continue;
          }
          break;
        }

  CFIndex v27 = (void *)objc_claimAutoreleasedReturnValue([v5 componentsSeparatedByString:@"/"]);
  if ([v27 count] != v36 || (objc_msgSend(v35, "annotated:", v18) & 1) != 0)
  {
LABEL_35:
    LOBYTE(v26) = 1;
    goto LABEL_36;
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  id v30 = [v29 iOS];

  if (v30)
  {
  }

  else if (objc_msgSend(v35, "shouldRestoreSystemContainer_WatchAndTV:shared:", v19, v26))
  {
    goto LABEL_35;
  }

  CFDataRef v32 = sub_100021D84();
  CFStringRef v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    sub_10002CDA8((uint64_t)v5, v33);
  }

  LOBYTE(v26) = 0;
LABEL_36:

  return v26;
}

LABEL_50:
        id v22 = v128;
        v38 = v127 + 1;
        v58 = v148;
        uint64_t v35 = v39;
      }

      while ((id)(v127 + 1) != v125);
      v125 = -[os_log_s countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v157,  v175,  16LL);
      if (!v125) {
        goto LABEL_54;
      }
    }
  }

  v58 = v148;
LABEL_54:

  id v16 = v131;
  if (!os_variant_has_internal_content("com.apple.mobilestoredemod")
    || !v134
    || (timeval v59 = v37 & 1, v59 == [v134 BOOLValue]))
  {
    if ((v37 & 1) == 0) {
      goto LABEL_60;
    }
    goto LABEL_66;
  }

  v60 = sub_100021D84();
  v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    v62 = [v134 BOOLValue];
    *(_DWORD *)buf = 136315650;
    v168 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
    v169 = 1024;
    *(_DWORD *)v170 = v59;
    *(_WORD *)&v170[4] = 1024;
    *(_DWORD *)&v170[6] = v62;
    _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "%s: Overriding rigorous testing from %{BOOL}d to %{BOOL}d",  buf,  0x18u);
  }

  if ([v134 BOOLValue])
  {
LABEL_66:
    uint64_t v8 = v132;
    id v11 = v133;
    if (-[MSDDemoManifestCheck secureManifestCheckForSegmentedManifest:options:]( v58,  "secureManifestCheckForSegmentedManifest:options:",  v140,  v132))
    {
      goto LABEL_67;
    }

    v120 = v35;
    v121 = v36;
    v122 = v120;
    v123 = sub_100021D84();
    obuint64_t j = (os_log_s *)objc_claimAutoreleasedReturnValue(v123);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      sub_10002813C();
    }
    uint64_t v8 = v132;
    id v11 = v133;
    id v16 = v131;
    id v22 = v128;
    v124 = v122;
    v36 = v121;
    uint64_t v35 = v124;
    goto LABEL_102;
  }

LABEL_60:
  v63 = sub_100021D84();
  v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
  id v11 = v133;
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v168 = "-[MSDDemoManifestCheck verifyManifestSignature:forDataSectionKeys:withOptions:]";
    _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "%s: Skipping rigorous manifest testing.",  buf,  0xCu);
  }

  uint64_t v8 = v132;
LABEL_67:
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck blocklistedItems](v58, "blocklistedItems"));
  v75 = [v74 count];

  if (!v75)
  {
    v117 = sub_100021D84();
    v76 = (os_log_s *)objc_claimAutoreleasedReturnValue(v117);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_DEFAULT,  "No items blocklisted, skip blocklist item exclusion",  buf,  2u);
    }

    goto LABEL_107;
  }

  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  v76 = (os_log_s *)v140;
  v77 = -[os_log_s countByEnumeratingWithState:objects:count:]( v76,  "countByEnumeratingWithState:objects:count:",  &v149,  v166,  16LL);
  if (!v77)
  {
LABEL_107:
    id v11 = v133;
    goto LABEL_108;
  }

  v78 = v77;
  v79 = v36;
  v80 = *(void *)v150;
  do
  {
    for (uint64_t i = 0LL; i != v78; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v150 != v80) {
        objc_enumerationMutation(v76);
      }
      v82 = *(void *)(*((void *)&v149 + 1) + 8LL * (void)i);
      v83 = -[os_log_s objectForKey:ofType:]( v76,  "objectForKey:ofType:",  v82,  objc_opt_class(&OBJC_CLASS___NSMutableDictionary));
      v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
      if (v84) {
        -[MSDDemoManifestCheck removeBlocklistedItemFromSection:withName:]( v148,  "removeBlocklistedItemFromSection:withName:",  v84,  v82);
      }
    }

    v78 = -[os_log_s countByEnumeratingWithState:objects:count:]( v76,  "countByEnumeratingWithState:objects:count:",  &v149,  v166,  16LL);
  }

  while (v78);
  id v11 = v133;
  id v22 = v128;
  v36 = v79;
  uint64_t v8 = v132;
  id v16 = v131;
LABEL_108:

LABEL_109:
  if (cf) {
    CFRelease(cf);
  }
  v116 = v140;
LABEL_112:

  return v116;
}

void sub_10000F95C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10000F988(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000F998(uint64_t a1)
{
}

void sub_10000F9A0(uint64_t a1, const __CFData *a2, uint64_t a3, _BYTE *a4)
{
  SecCertificateRef v6 = SecCertificateCreateWithData(kCFAllocatorDefault, a2);
  if (v6)
  {
    SecCertificateRef v18 = v6;
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
  }

  else
  {
    id v7 = sub_100021D84();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100028BCC(v8, v9, v10, v11, v12, v13, v14, v15);
    }

    uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0LL;

    *a4 = 1;
  }

void sub_1000101D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100010204(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v10 = a2;
  id v7 = a3;
  if ([*(id *)(a1 + 32) containsObject:v10])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000102FC;
    v11[3] = &unk_100044CF8;
    v11[4] = *(void *)(a1 + 40);
    id v8 = v10;
    uint64_t v9 = *(void *)(a1 + 72);
    id v12 = v8;
    uint64_t v16 = v9;
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    id v15 = *(id *)(a1 + 64);
    uint64_t v17 = a4;
    [v7 enumerateKeysAndObjectsUsingBlock:v11];
  }
}

void sub_1000102FC(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) checkType]);
  if (v9) {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) checkType]);
  }
  else {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RigorousCheckType"]);
  }
  uint64_t v11 = (char *)v10;

  id v12 = sub_100021D84();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = *(char **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    id v29 = v7;
    __int16 v30 = 2114;
    id v31 = v14;
    __int16 v32 = 2114;
    CFStringRef v33 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Name: %{public}@, Section Name: %{public}@, Check Type: %{public}@",  buf,  0x20u);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getComponentData:v8]);
  if ([v11 isEqualToString:@"Skip"])
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 1;
  }

  else if ([v11 isEqualToString:@"Default"])
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [*(id *)(a1 + 32) runSecurityChecksForSection:v15 dataType :*(void *)(a1 + 40) componentName:v7 options:*(void *)(a1 + 48)];
  }

  else
  {
    if ([v11 isEqualToString:@"AppleISTCertCheck"])
    {
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  *(void *)(a1 + 40),  v7));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allowedISTSignedComponents]);
      unsigned int v18 = [v17 containsObject:v16];

      if (v18)
      {
        if ([v7 isEqualToString:*(void *)(a1 + 56)]
          && [*(id *)(a1 + 40) isEqualToString:*(void *)(a1 + 64)])
        {
          id v19 = sub_100021D84();
          CFDataRef v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v29 = (const char *)v16;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "About to run app layout checks for %{public}@",  buf,  0xCu);
          }

          unsigned __int8 v21 = [*(id *)(a1 + 32) runAppLayoutSecurityCheck:v15];
        }

        else
        {
          unsigned __int8 v21 = [*(id *)(a1 + 32) runSecurityChecksForSection:v15 dataType:*(void *)(a1 + 40) componentName:v7 options:*(void *)(a1 + 48)];
        }

        *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = v21;
      }

      else
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
        id v24 = sub_100021D84();
        id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_100028FEC();
        }
      }
    }

    else
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL) = 0;
      id v22 = sub_100021D84();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        id v29 = "-[MSDDemoManifestCheck runSecurityCheck:]_block_invoke";
        __int16 v30 = 2114;
        id v31 = v11;
        __int16 v32 = 2114;
        CFStringRef v33 = v7;
        __int16 v34 = 2114;
        uint64_t v35 = v23;
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s: Unknown rigorous check type (%{public}@) for %{public}@ (from %{public}@).",  buf,  0x2Au);
      }
    }
  }

  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL))
  {
    id v26 = sub_100021D84();
    CFIndex v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100028F54((uint64_t)v7, a1, v27);
    }

    *a4 = 1;
    **(_BYTE **)(a1 + 80) = 1;
  }
}

LABEL_78:
          uint64_t v40 = v96;
LABEL_79:
          id v19 = v82;
          uint64_t v44 = v98;
LABEL_80:

          objc_autoreleasePoolPop(context);
          v68 = 4;
          v69 = v40;
          uint64_t v10 = v84;
          goto LABEL_81;
        }

        uint64_t v50 = v49;
        v100 = 0;
        uint64_t v51 = *(void *)v110;
        uint64_t v52 = v102;
        do
        {
          for (uint64_t i = 0LL; i != v50; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v110 != v51) {
              objc_enumerationMutation(obja);
            }
            uint64_t v54 = *(void *)(*((void *)&v109 + 1) + 8LL * (void)i);
            if ([v52 rangeOfString:v54] != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck allowedSymLinks](self, "allowedSymLinks"));
              int v56 = (void *)objc_claimAutoreleasedReturnValue([v55 objectForKey:v54]);

              v107 = 0u;
              v108 = 0u;
              v105 = 0u;
              v106 = 0u;
              id v57 = v56;
              v58 = [v57 countByEnumeratingWithState:&v105 objects:v121 count:16];
              if (v58)
              {
                timeval v59 = v58;
                v60 = self;
                v61 = *(void *)v106;
                while (2)
                {
                  for (uint64_t j = 0LL; j != v59; uint64_t j = (char *)j + 1)
                  {
                    if (*(void *)v106 != v61) {
                      objc_enumerationMutation(v57);
                    }
                    if ([v48 rangeOfString:*(void *)(*((void *)&v105 + 1) + 8 * (void)j)] != (id)0x7FFFFFFFFFFFFFFFLL)
                    {
                      v100 = 1;
                      goto LABEL_49;
                    }
                  }

                  timeval v59 = [v57 countByEnumeratingWithState:&v105 objects:v121 count:16];
                  if (v59) {
                    continue;
                  }
                  break;
                }

LABEL_49:
                self = v60;
                uint64_t v52 = v102;
              }
            }
          }

          uint64_t v50 = [obja countByEnumeratingWithState:&v109 objects:v122 count:16];
        }

        while (v50);

        uint64_t v35 = v48;
        uint64_t v17 = v87;
        uint64_t v9 = v89;
        v38 = v90;
        id v37 = v91;
        if ((v100 & 1) == 0) {
          goto LABEL_77;
        }
      }

      v63 = (void *)objc_claimAutoreleasedReturnValue([v98 valueForKey:@"NSFilePosixPermissions"]);
      v64 = (unsigned __int16)[v63 longValue];

      if ((v64 & 0xC00) != 0)
      {
        v75 = sub_100021D84();
        v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
          sub_1000292DC();
        }
        goto LABEL_78;
      }

      if ([v9 isEqualToString:v38])
      {
        v65 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoManifestCheck whitelistChecker](self, "whitelistChecker"));
        v66 = [v65 handleSystemContainerFiles:v102 withMetadata:v97];

        if ((v66 & 1) == 0)
        {
          v76 = sub_100021D84();
          v74 = (os_log_s *)objc_claimAutoreleasedReturnValue(v76);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
            sub_10002927C();
          }
          goto LABEL_78;
        }
      }

      objc_autoreleasePoolPop(context);
      id v39 = v94 + 1;
      uint64_t v40 = v96;
      uint64_t v41 = v98;
    }

    while ((id)(v94 + 1) != v93);
    v67 = [v37 countByEnumeratingWithState:&v113 objects:v123 count:16];
    v36 = v96;
    v93 = v67;
    if (v67) {
      continue;
    }
    break;
  }

  v68 = 0;
  id v19 = v82;
  uint64_t v10 = v84;
  uint64_t v44 = v98;
  v69 = v96;
LABEL_81:

  if (v68 == 4)
  {
    id v8 = v19;
    uint64_t v11 = v85;
LABEL_83:
    v72 = 0;
  }

  else
  {
    v72 = 1;
    id v8 = v19;
    uint64_t v11 = v85;
  }

LABEL_85:
  return v72;
}

void sub_100011D6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100021D84();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    SecCertificateRef v6 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    int v9 = 138543618;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    id v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Notification received for entitlement check for: %{public}@ %{public}@",  (uint8_t *)&v9,  0x16u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  [*(id *)(a1 + 32) setItemBeingInstalled:v8];
}

_BYTE *sub_100013A24(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

LABEL_24:
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v6, "objectForKey:", @"HomeDomain"));
  if (!v8 || (uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary), (objc_opt_isKindOfClass(v8, v23) & 1) == 0))
  {
    id v37 = sub_100021D84();
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000297AC();
    }
    goto LABEL_44;
  }

  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RelativePathsNotToBackup"]);

  if (!v10 || (id v24 = objc_opt_class(&OBJC_CLASS___NSMutableArray), (objc_opt_isKindOfClass(v10, v24) & 1) == 0))
  {
    uint64_t v40 = sub_100021D84();
    CFStringRef v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_1000297D8();
    }
LABEL_37:

LABEL_38:
LABEL_39:

LABEL_40:
    __int16 v34 = 0LL;
    goto LABEL_41;
  }

  -[os_log_s addObject:](v10, "addObject:", @"Library/Preferences/com.apple.identityservices.idstatuscache.plist");
  -[os_log_s addObject:](v10, "addObject:", @"Library/Preferences/com.apple.identityservicesd.plist");
  -[os_log_s addObject:](v10, "addObject:", @"Library/Preferences/com.apple.ids.deviceproperties.plist");
  -[os_log_s addObject:](v10, "addObject:", @"Library/Preferences/com.apple.ids.subservices.plist");
  -[os_log_s addObject:](v10, "addObject:", @"Library/Preferences/com.apple.ids.plist");
  -[os_log_s removeObject:]( v10,  "removeObject:",  @"Library/MobileBluetooth/com.apple.MobileBluetooth.ledevices.other.db");
  [v8 setObject:v10 forKey:@"RelativePathsNotToBackup"];
  -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v8, @"HomeDomain");
  id v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RelativePathsToBackupAndRestore"]);

  if (!v12 || (id v25 = objc_opt_class(&OBJC_CLASS___NSMutableArray), (objc_opt_isKindOfClass(v12, v25) & 1) == 0))
  {
    uint64_t v43 = sub_100021D84();
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_100029804();
    }
    goto LABEL_44;
  }

  -[NSMutableArray removeObject:](v12, "removeObject:", @"Library/Accounts");
  -[NSMutableArray removeObject:](v12, "removeObject:", @"Library/DeviceRegistry");
  -[NSMutableArray removeObject:](v12, "removeObject:", @"Library/DeviceRegistry.state");
  -[NSMutableArray removeObject:](v12, "removeObject:", @"Library/MobileBluetooth");
  -[NSMutableArray addObject:](v12, "addObject:", @"Library/Application Support/ScreenSaverManager");
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RelativePathsToBackupToDriveAndStandardAccount"]);
  if (v26 && (CFIndex v27 = objc_opt_class(&OBJC_CLASS___NSMutableArray), (objc_opt_isKindOfClass(v26, v27) & 1) != 0))
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray arrayByAddingObjectsFromArray:](v12, "arrayByAddingObjectsFromArray:", v26));
    id v29 = (NSMutableArray *)[v28 mutableCopy];

    __int16 v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    [v8 setObject:v30 forKey:@"RelativePathsToBackupToDriveAndStandardAccount"];

    id v12 = v29;
  }

  else
  {
    v48 = sub_100021D84();
    uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v109 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Cannot find RelativePathsToBackupToDriveAndStandardAccount under HomeDomain.",  v109,  2u);
    }
  }

  [v8 setObject:v12 forKey:@"RelativePathsToBackupAndRestore"];
  -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v8, @"HomeDomain");
  uint64_t v50 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RelativePathsToBackupAndRestore"]);

  if (!v50 || (uint64_t v51 = objc_opt_class(&OBJC_CLASS___NSMutableArray), (objc_opt_isKindOfClass(v50, v51) & 1) == 0))
  {
    v81 = sub_100021D84();
    v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
      sub_100029830();
    }
    goto LABEL_112;
  }

  -[NSMutableArray addObject:](v50, "addObject:", @"Library/DoNotDisturb/DB/ModeConfigurations.json");
  -[NSMutableArray addObject:](v50, "addObject:", @"Library/DoNotDisturb/DB/ModeConfigurationsSecure.json");
  [v8 setObject:v50 forKey:@"RelativePathsToBackupAndRestore"];
  -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v8, @"HomeDomain");
  id v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RelativePathsToRestoreOnly"]);

  if (!v12 || (uint64_t v52 = objc_opt_class(&OBJC_CLASS___NSMutableArray), (objc_opt_isKindOfClass(v12, v52) & 1) == 0))
  {
    v84 = sub_100021D84();
    v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
      sub_10002985C();
    }
    goto LABEL_117;
  }

  -[NSMutableArray removeObject:](v12, "removeObject:", @"Library/DoNotDisturb/DB/ModeConfigurations.json");
  -[NSMutableArray removeObject:](v12, "removeObject:", @"Library/DoNotDisturb/DB/ModeConfigurationsSecure.json");
  [v8 setObject:v12 forKey:@"RelativePathsToRestoreOnly"];
  -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v8, @"HomeDomain");
  uint64_t v50 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RelativePathsToOnlyBackupEncrypted"]);

  if (!v50 || (uint64_t v53 = objc_opt_class(&OBJC_CLASS___NSMutableArray), (objc_opt_isKindOfClass(v50, v53) & 1) == 0))
  {
    v87 = sub_100021D84();
    v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
      sub_100029888();
    }
    goto LABEL_112;
  }

  -[NSMutableArray removeObject:](v50, "removeObject:", @"Library/DoNotDisturb/DB/ModeConfigurations.json");
  -[NSMutableArray removeObject:](v50, "removeObject:", @"Library/DoNotDisturb/DB/ModeConfigurationsSecure.json");
  [v8 setObject:v50 forKey:@"RelativePathsToOnlyBackupEncrypted"];
  -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v8, @"HomeDomain");
  id v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RelativePathsToBackupAndRestore"]);

  if (!v12 || (uint64_t v54 = objc_opt_class(&OBJC_CLASS___NSMutableArray), (objc_opt_isKindOfClass(v12, v54) & 1) == 0))
  {
    v88 = sub_100021D84();
    v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
      sub_1000298B4();
    }
    goto LABEL_117;
  }

  -[NSMutableArray addObject:](v12, "addObject:", @"Library/Safari/SafariTabs.db");
  [v8 setObject:v12 forKey:@"RelativePathsToBackupAndRestore"];
  -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v8, @"HomeDomain");
  uint64_t v50 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RelativePathsToRestoreOnly"]);

  if (!v50 || (uint64_t v55 = objc_opt_class(&OBJC_CLASS___NSMutableArray), (objc_opt_isKindOfClass(v50, v55) & 1) == 0))
  {
    v89 = sub_100021D84();
    v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
      sub_1000298E0();
    }
    goto LABEL_112;
  }

  -[NSMutableArray removeObject:](v50, "removeObject:", @"Library/Safari/SafariTabs.db");
  [v8 setObject:v50 forKey:@"RelativePathsToRestoreOnly"];
  -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v8, @"HomeDomain");
  id v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RelativePathsToOnlyBackupEncrypted"]);

  if (!v12 || (int v56 = objc_opt_class(&OBJC_CLASS___NSMutableArray), (objc_opt_isKindOfClass(v12, v56) & 1) == 0))
  {
    v90 = sub_100021D84();
    v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v90);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
      sub_10002990C();
    }
    goto LABEL_117;
  }

  -[NSMutableArray removeObject:](v12, "removeObject:", @"Library/Safari/SafariTabs.db");
  [v8 setObject:v12 forKey:@"RelativePathsToOnlyBackupEncrypted"];
  -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v8, @"HomeDomain");
  uint64_t v50 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RelativePathsNotToBackupToService"]);

  if (!v50 || (id v57 = objc_opt_class(&OBJC_CLASS___NSMutableArray), (objc_opt_isKindOfClass(v50, v57) & 1) == 0))
  {
    v91 = sub_100021D84();
    v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
      sub_100029938();
    }
    goto LABEL_112;
  }

  -[NSMutableArray removeObject:](v50, "removeObject:", @"Library/Safari/SafariTabs.db");
  [v8 setObject:v50 forKey:@"RelativePathsNotToBackupToService"];
  -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v8, @"HomeDomain");
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v6, "objectForKey:", @"KeychainDomain"));

  if (!v58 || (timeval v59 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary), (objc_opt_isKindOfClass(v58, v59) & 1) == 0))
  {
    v92 = sub_100021D84();
    v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
      sub_100029964();
    }

    goto LABEL_40;
  }

  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  [v58 setObject:v60 forKey:@"RelativePathsToBackupAndRestore"];

  -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v58, @"KeychainDomain");
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v6, "objectForKey:", @"MediaDomain"));

  if (!v61 || (v62 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary), (objc_opt_isKindOfClass(v61, v62) & 1) == 0))
  {
    v94 = sub_100021D84();
    v95 = (os_log_s *)objc_claimAutoreleasedReturnValue(v94);
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
      sub_100029990();
    }
    goto LABEL_135;
  }

  [v61 removeObjectForKey:@"RelativePathsNotToBackupToDrive"];
  -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v61, @"MediaDomain");
  v63 = (void *)objc_claimAutoreleasedReturnValue([v61 objectForKey:@"RelativePathsToBackupAndRestore"]);

  if (!v63 || (v64 = objc_opt_class(&OBJC_CLASS___NSMutableArray), (objc_opt_isKindOfClass(v63, v64) & 1) == 0))
  {
    v96 = sub_100021D84();
    v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR)) {
      sub_1000299BC();
    }

    goto LABEL_139;
  }

  [v63 removeObject:@"Media/iTunes_Control/Device/Trainer"];
  [v63 removeObject:@"Media/iTunes_Control/iTunes/iTunesPrefs.plist"];
  [v63 removeObject:@"Media/iTunes_Control/iTunes/MobileSync.plist"];
  [v63 removeObject:@"Media/iTunes_Control/iTunes/iPhotoAlbumPrefs"];
  [v63 removeObject:@"Media/iTunes_Control/iTunes/ApertureAlbumPrefs"];
  [v63 removeObject:@"Media/iTunes_Control/iTunes/PSAlbumAlbums"];
  [v63 removeObject:@"Media/iTunes_Control/iTunes/PSElementsAlbums"];
  [v63 removeObject:@"Media/iTunes_Control/iTunes/PhotosFolderPrefs"];
  [v63 removeObject:@"Media/iTunes_Control/iTunes/PhotosFolderAlbums"];
  [v63 removeObject:@"Media/iTunes_Control/iTunes/PhotosFolderName"];
  [v63 removeObject:@"Media/iTunes_Control/iTunes/MediaLibrary.sqlitedb"];
  [v63 addObject:@"Media/iTunes_Control/iTunes"];
  [v63 addObject:@"Media/iTunes_Control/Music"];
  [v63 addObject:@"Media/iTunes_Control/Sync"];
  [v63 addObject:@"Media/iTunes_Control/Artwork"];
  [v63 addObject:@"Media/Books"];
  [v63 addObject:@"Media/Music/Downloads"];
  [v61 setObject:v63 forKey:@"RelativePathsToBackupAndRestore"];
  -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v61, @"MediaDomain");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v6, "objectForKey:", @"RootDomain"));

  if (!v8 || (v65 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary), (objc_opt_isKindOfClass(v8, v65) & 1) == 0))
  {
    v98 = sub_100021D84();
    v99 = (os_log_s *)objc_claimAutoreleasedReturnValue(v98);
    if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR)) {
      sub_1000299E8();
    }

    goto LABEL_39;
  }

  id v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RelativePathsToRemoveOnRestore"]);

  if (!v12 && (id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray)) == 0LL
    || (v66 = objc_opt_class(&OBJC_CLASS___NSMutableArray), (objc_opt_isKindOfClass(v12, v66) & 1) == 0))
  {
    v100 = sub_100021D84();
    v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v100);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
      sub_100029A14();
    }
    goto LABEL_117;
  }

  -[NSMutableArray addObject:](v12, "addObject:", @"Library/Preferences/com.apple.ASPCarryLog.plist");
  [v8 setObject:v12 forKey:@"RelativePathsToRemoveOnRestore"];
  -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v8, @"RootDomain");
  uint64_t v50 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RelativePathsNotToRemoveIfNotRestored"]);

  if (!v50 && (uint64_t v50 = objc_alloc_init(&OBJC_CLASS___NSMutableArray)) == 0LL
    || (v67 = objc_opt_class(&OBJC_CLASS___NSMutableArray), (objc_opt_isKindOfClass(v50, v67) & 1) == 0))
  {
    v101 = sub_100021D84();
    v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v101);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
      sub_100029A40();
    }
    goto LABEL_112;
  }

  -[NSMutableArray addObject:](v50, "addObject:", @"Library/Preferences/com.apple.MobileAsset.plist");
  [v8 setObject:v50 forKey:@"RelativePathsNotToRemoveIfNotRestored"];
  -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v8, @"RootDomain");
  id v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RelativePathsNotToRestore"]);

  if (!v12 || (v68 = objc_opt_class(&OBJC_CLASS___NSMutableArray), (objc_opt_isKindOfClass(v12, v68) & 1) == 0))
  {
    v102 = sub_100021D84();
    v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v102);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR)) {
      sub_100029A6C();
    }
LABEL_117:

LABEL_44:
    goto LABEL_39;
  }

  -[NSMutableArray removeObject:]( v12,  "removeObject:",  @"Library/Preferences/com.apple.powerd.lowpowermode.state.plist");
  [v8 setObject:v12 forKey:@"RelativePathsNotToRestore"];
  -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v8, @"RootDomain");
  uint64_t v50 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"RelativePathsNotToBackup"]);

  if (!v50 || (v69 = objc_opt_class(&OBJC_CLASS___NSMutableArray), (objc_opt_isKindOfClass(v50, v69) & 1) == 0))
  {
    v103 = sub_100021D84();
    v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
      sub_100029A98();
    }
LABEL_112:

    goto LABEL_39;
  }

  -[NSMutableArray removeObject:]( v50,  "removeObject:",  @"Library/Preferences/com.apple.powerd.lowpowermode.state.plist");
  [v8 setObject:v50 forKey:@"RelativePathsNotToBackup"];
  -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v8, @"RootDomain");
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v6, "objectForKey:", @"SystemPreferencesDomain"));

  if (!v61 || (v70 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary), (objc_opt_isKindOfClass(v61, v70) & 1) == 0))
  {
    v104 = sub_100021D84();
    v95 = (os_log_s *)objc_claimAutoreleasedReturnValue(v104);
    if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
      sub_100029AC4();
    }
LABEL_135:

LABEL_139:
    goto LABEL_40;
  }

  v71 = (void *)objc_claimAutoreleasedReturnValue([v61 objectForKey:@"RelativePathsNotToBackup"]);

  if (!v71 || (v72 = objc_opt_class(&OBJC_CLASS___NSMutableArray), (objc_opt_isKindOfClass(v71, v72) & 1) == 0))
  {
    v105 = sub_100021D84();
    v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
    if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR)) {
      sub_100029AF0();
    }

    goto LABEL_139;
  }

  [v71 addObject:@"SystemConfiguration/com.apple.wifi.plist"];
  [v71 addObject:@"SystemConfiguration/com.apple.wifi-networks.plist"];
  [v61 setObject:v71 forKey:@"RelativePathsNotToBackup"];
  -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v61, @"SystemPreferencesDomain");
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s objectForKey:](v6, "objectForKey:", @"KeyboardDomain"));

  if (!v73 || (v74 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary), (objc_opt_isKindOfClass(v73, v74) & 1) == 0))
  {
    v107 = sub_100021D84();
    v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR)) {
      sub_100029B1C();
    }

    goto LABEL_40;
  }

  v75 = (void *)objc_claimAutoreleasedReturnValue([v73 objectForKey:@"RelativePathsToBackupAndRestore"]);

  if (v75)
  {
    v76 = objc_opt_class(&OBJC_CLASS___NSMutableArray);
    if ((objc_opt_isKindOfClass(v75, v76) & 1) != 0) {
      [v75 addObject:@"Library/KeyboardServices"];
    }
  }

  v77 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);

  -[NSMutableDictionary setObject:forKey:](v77, "setObject:forKey:", @"/var/MobileAsset", @"RootPath");
  v78 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);

  -[NSMutableArray addObject:](v78, "addObject:", @"AssetsV2/com_apple_MobileAsset_SystemEnvironmentAsset");
  -[NSMutableArray addObject:]( v78,  "addObject:",  @"PreinstalledAssetsV2/InstallWithOs/com_apple_MobileAsset_UAF_FM_GenerativeModels");
  -[NSMutableArray addObject:]( v78,  "addObject:",  @"PreinstalledAssetsV2/InstallWithOs/com_apple_MobileAsset_UAF_FM_Overrides");
  -[NSMutableArray addObject:]( v78,  "addObject:",  @"PreinstalledAssetsV2/InstallWithOs/com_apple_MobileAsset_UAF_Siri_Understanding");
  -[NSMutableArray addObject:]( v78,  "addObject:",  @"PreinstalledAssetsV2/InstallWithOs/com_apple_MobileAsset_UAF_Siri_UnderstandingNLOverrides");
  -[NSMutableArray addObject:]( v78,  "addObject:",  @"PreinstalledAssetsV2/InstallWithOs/com_apple_MobileAsset_UAF_IF_Planner");
  -[NSMutableArray addObject:]( v78,  "addObject:",  @"PreinstalledAssetsV2/InstallWithOs/com_apple_MobileAsset_UAF_IF_PlannerOverrides");
  -[NSMutableDictionary setObject:forKey:](v77, "setObject:forKey:", v78, @"RelativePathsToBackupAndRestore");
  -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v77, @"MobileAssetDomain");
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));

  [v79 setObject:@"/var/mobile/XcodeBuiltProducts" forKey:@"RootPath"];
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));

  [v80 addObject:@"PressDemoScripts.xctestproducts"];
  [v79 setObject:v80 forKey:@"RelativePathsToBackupAndRestore"];
  -[os_log_s setObject:forKey:](v6, "setObject:forKey:", v79, @"DemoPortalScriptsDomain");
  [v5 setObject:v6 forKey:@"SystemDomains"];
  __int16 v34 = v5;

LABEL_41:
  return v34;
}

void sub_10001518C(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MSDHVolumeManager);
  uint64_t v2 = (void *)qword_10004F840;
  qword_10004F840 = (uint64_t)v1;
}

LABEL_22:
          unsigned int v18 = 1;
          goto LABEL_23;
        }

        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_100029D68();
        }
      }

      else
      {
        uint64_t v17 = sub_100021D84();
        __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = 138543362;
          id v24 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Unknown snapshot operation: %{public}@",  (uint8_t *)&v23,  0xCu);
        }
      }
    }

LABEL_17:
    unsigned int v18 = 0;
LABEL_23:

    close(v7);
    goto LABEL_24;
  }

  unsigned __int8 v21 = sub_100021D84();
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_100029C24();
  }

  unsigned int v18 = 0;
LABEL_24:

  return v18;
}

    id v3 = v3->ifa_next;
  }

  while (v3);
  if (v31) {
    freeifaddrs(v31);
  }
LABEL_20:
  unsigned __int8 v21 = v2;
LABEL_21:

  return v21;
}

void sub_100015A28(id a1)
{
  io_iterator_t iterator = 0;
  bzero(&v28, 0x878uLL);
  if (statfs("/", &v28))
  {
    id v17 = sub_100021D84();
    unsigned int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100029F94(v18);
    }

    id v4 = 0LL;
    v1 = 0LL;
    goto LABEL_34;
  }

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v28.f_mntfromname));
  uint64_t v2 = (char *)[v1 rangeOfString:@"/dev/"];
  if (v2 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    id v19 = sub_100021D84();
    CFDataRef v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100029EAC();
    }

    id v4 = 0LL;
    goto LABEL_34;
  }

  id v4 = objc_claimAutoreleasedReturnValue([v1 substringFromIndex:&v2[v3]]);
  id v5 = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)[v4 UTF8String]);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v5);
  if (!MatchingService)
  {
    id v21 = sub_100021D84();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_100029ED8();
    }

    goto LABEL_34;
  }

  io_object_t v7 = MatchingService;
  if (IORegistryEntryCreateIterator(MatchingService, "IOService", 3u, &iterator))
  {
    id v23 = sub_100021D84();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100029F30();
    }

    IOObjectRelease(v7);
LABEL_34:
    __int16 v11 = 0LL;
    goto LABEL_15;
  }

  io_object_t v8 = IOIteratorNext(iterator);
  if (v8)
  {
    while (!IOObjectConformsTo(v8, "AppleAPFSContainer"))
    {
      IOObjectRelease(v8);
      io_object_t v8 = IOIteratorNext(iterator);
      if (!v8) {
        goto LABEL_8;
      }
    }

    CFTypeRef v12 = IORegistryEntrySearchCFProperty(v8, "IOService", @"BSD Name", 0LL, 3u);
    if (v12)
    {
      __int16 v11 = (void *)v12;
      uint64_t v13 = objc_claimAutoreleasedReturnValue([@"/dev/" stringByAppendingString:v12]);
      id v14 = (void *)qword_10004F850;
      qword_10004F850 = v13;

      IOObjectRelease(v7);
LABEL_14:
      IOObjectRelease(v8);
      goto LABEL_15;
    }
  }

LABEL_8:
  id v9 = sub_100021D84();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100029F04();
  }

  IOObjectRelease(v7);
  __int16 v11 = 0LL;
  if (v8) {
    goto LABEL_14;
  }
LABEL_15:
  if (iterator) {
    IOObjectRelease(iterator);
  }
  if (!qword_10004F850)
  {
    qword_10004F850 = (uint64_t)@"/dev/disk0s1";
  }

  id v15 = sub_100021D84();
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v27 = qword_10004F850;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Current APFS boot container: %{public}@",  buf,  0xCu);
  }
}
          }
        }

        SecCertificateRef v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v21 = [v2 countByEnumeratingWithState:&v24 objects:v32 count:16];
      id v4 = v21;
    }

    while (v21);
  }

  return 1;
}

  return v10;
}

LABEL_25:
LABEL_26:
  return v9;
}

LABEL_32:
  return v11;
}

void sub_100016CD4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100016D00(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100016D0C( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100016D6C(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MSDTestPreferences);
  uint64_t v2 = (void *)qword_10004F860;
  qword_10004F860 = (uint64_t)v1;
}

uint64_t sub_100017EF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 1LL;
}

LABEL_39:
      v71 = 0LL;
LABEL_40:
      v36 = v29;
      __int16 v32 = v28;
      goto LABEL_41;
    }

    id v14 = v31;
    id v15 = v76;
    if (v31
      && (uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v19, "path")),
          uint64_t v41 = -[MSDManifest folder:contains:](v77, "folder:contains:", v31, v40),
          v40,
          v41)
      || v76
      && (uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v19, "path")),
          uint64_t v43 = -[MSDManifest path:inSuperSet:](v77, "path:inSuperSet:", v42, v76),
          v42,
          (v43 & 1) == 0))
    {
      uint64_t v44 = context;
      goto LABEL_18;
    }

    if (([v27 BOOLValue] & 1) == 0
      && ([v26 BOOLValue] & 1) == 0
      && ![v28 BOOLValue])
    {
      uint64_t v55 = sub_100021D84();
      int v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        id v57 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v19, "path"));
        *(_DWORD *)buf = 138543362;
        v90 = (NSURLResourceKey)v57;
        _os_log_impl( (void *)&_mh_execute_header,  v56,  OS_LOG_TYPE_DEFAULT,  "%{public}@ is special file. Leave it along",  buf,  0xCu);
        goto LABEL_38;
      }

      goto LABEL_39;
    }

    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v19, "path"));
    uint64_t v46 = (char *)[v45 rangeOfString:*p_rootPath];
    v70 = v47;

    if (v46)
    {
      if (v46 == (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        v48 = 0LL;
        goto LABEL_29;
      }

      v68 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v19, "path"));
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v68 substringFromIndex:&v46[v70]]);
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue( [v50 stringByReplacingOccurrencesOfString:*p_rootPath withString:&stru_1000457D8]);

      uint64_t v49 = v68;
    }

    else
    {
      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v19, "path"));
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue( [v49 stringByReplacingOccurrencesOfString:*p_rootPath withString:&stru_1000457D8]);
    }

LABEL_29:
    if (-[__CFString length](v48, "length"))
    {
      v71 = v48;
    }

    else
    {

      v71 = @"/";
    }

    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s path](v19, "path"));
    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[MSDFileMetadata fileMetadatatWithPath:]( &OBJC_CLASS___MSDFileMetadata,  "fileMetadatatWithPath:",  v51));

    if (!v52)
    {
      v64 = sub_100021D84();
      int v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_10002A634(v87, v19, &v88, v56);
      }
      v74 = 0LL;
      goto LABEL_40;
    }

    uint64_t v53 = v71;
    if ((v73[2](v73, v52, v71) & 1) == 0) {
      break;
    }
    v74 = v52;
    uint64_t v54 = context;
LABEL_35:

    uint64_t v44 = v54;
LABEL_18:
    objc_autoreleasePoolPop(v44);
    id v25 = objc_claimAutoreleasedReturnValue([v79 nextObject]);

    __int16 v30 = v25 == 0;
    if (((v25 == 0) & v78) != 0)
    {

      CFDataRef v20 = 1;
      id v19 = (os_log_s *)v79;
      goto LABEL_54;
    }
  }

  v66 = sub_100021D84();
  v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v66);
  if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
    sub_10002A6A8(v19, v67);
  }

  objc_autoreleasePoolPop(context);
  CFDataRef v20 = 0;
LABEL_54:
  CFTypeRef v12 = v75;
  uint64_t v13 = v69;
  id v17 = v73;
LABEL_55:

  return v20;
}

BOOL sub_100018878(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = sub_100021D84();
  io_object_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    io_object_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](v4, "path"));
    int v10 = 136315906;
    __int16 v11 = "-[MSDManifest enumerateAndCollectMetaData:relativeTo:skip:superSet:handler:]_block_invoke";
    __int16 v12 = 2114;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    id v15 = v4;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Could not enumerate %{public}@, url=%{public}@, error=%{public}@",  (uint8_t *)&v10,  0x2Au);
  }

  return 1;
}

void sub_100018DD0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100018DEC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100018DFC(uint64_t a1)
{
}

uint64_t sub_100018E04(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](&OBJC_CLASS___NSString, "stringWithCString:encoding:", a2, 4LL));
  xpc_type_t type = xpc_get_type(v5);
  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    __int16 v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    uint64_t v13 = +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", xpc_BOOL_get_value(v5));
    id v14 = (id)objc_claimAutoreleasedReturnValue(v13);
LABEL_22:
    id v23 = v14;
    [v12 setObject:v14 forKey:v6];

    uint64_t v11 = 1LL;
    goto LABEL_23;
  }

  if (type == (xpc_type_t)&_xpc_type_string)
  {
    __int16 v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v15 = +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  xpc_string_get_string_ptr(v5),  4LL);
    id v14 = (id)objc_claimAutoreleasedReturnValue(v15);
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    __int16 v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    __int16 v16 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", xpc_int64_get_value(v5));
    id v14 = (id)objc_claimAutoreleasedReturnValue(v16);
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_uint64)
  {
    __int16 v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v17 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  xpc_uint64_get_value(v5));
    id v14 = (id)objc_claimAutoreleasedReturnValue(v17);
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    unsigned int v18 = *(void **)(a1 + 32);
    __int16 v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v14 = [v18 initWithXPCDictionary:v5];
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_data)
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    size_t length = xpc_data_get_length(v5);
    __int16 v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", bytes_ptr, length));
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_array)
  {
    __int16 v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithXPCArray:](&OBJC_CLASS___NSArray, "arrayWithXPCArray:", v5));
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_double)
  {
    __int16 v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v21 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", xpc_double_get_value(v5));
    id v14 = (id)objc_claimAutoreleasedReturnValue(v21);
    goto LABEL_22;
  }

  if (type == (xpc_type_t)&_xpc_type_date)
  {
    __int16 v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    id v22 = +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  (double)xpc_date_get_value(v5));
    id v14 = (id)objc_claimAutoreleasedReturnValue(v22);
    goto LABEL_22;
  }

  id v8 = sub_100021D84();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_10002A93C((uint64_t)v6, v9, v10);
  }

  uint64_t v11 = 0LL;
LABEL_23:

  return v11;
}

id sub_10001997C()
{
  return [v0 code];
}

id sub_100019988()
{
  if (qword_10004F878 != -1) {
    dispatch_once(&qword_10004F878, &stru_100044E60);
  }
  return (id)qword_10004F870;
}

void sub_1000199C8(id a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  unsigned int v2 = [v1 watchOS];

  if (v2)
  {
    uint64_t v3 = +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"/var/mobile/Demo.mov",  @"/var/mobile/Demo.plist",  @"/var/mobile/Media",  @"/var/mobile/Library/AddressBook",  @"/var/mobile/Library/Alarms",  @"/var/mobile/Library/Calendar",  @"/var/mobile/Library/CallHistoryDB",  @"/var/mobile/Library/Carousel",  @"/var/mobile/Library/Health",  @"/var/mobile/Library/Maps",  @"/var/mobile/Library/MapsHistory.plist",  @"/var/mobile/Library/NanoMailKit",  @"/var/mobile/Library/NanoMusicSync",  @"/var/mobile/Library/NanoPasses",  @"/var/mobile/Library/NanoPodcasts",  @"/var/mobile/Library/NanoPhotos",  @"/var/mobile/Library/NanoWeatherDemo",  @"/var/mobile/Library/News",  @"/var/mobile/Library/RetailDemo",  @"/var/mobile/Library/Reminders",  @"/var/mobile/Library/SMS",  @"/var/mobile/Library/UserConfigurationProfiles",  @"/var/mobile/Library/Preferences/.GlobalPreferences.plist",  @"/var/mobile/Library/Preferences/.GlobalPreferences_m.plist",  @"/var/mobile/Library/Preferences/com.apple.Accessibility.plist",  @"/var/mobile/Library/Preferences/com.apple.ActivitySharing.plist",  @"/var/mobile/Library/Preferences/com.apple.AppleMediaServices.plist",  @"/var/mobile/Library/Preferences/com.apple.assistant.backedup.plist",  @"/var/mobile/Library/Preferences/com.apple.assistant.nano.plist",  @"/var/mobile/Library/Preferences/com.apple.assistant.support.plist",  @"/var/mobile/Library/Preferences/com.apple.backboardd.plist",  @"/var/mobile/Library/Preferences/com.apple.Carousel.plist",  @"/var/mobile/Library/Preferences/com.apple.coremedia.plist",  @"/var/mobile/Library/Preferences/com.apple.ControlCenter.plist",  @"/var/mobile/Library/Preferences/com.apple.DeepBreathing.plist",  @"/var/mobile/Library/Preferences/com.apple.demo-settings.plist",  @"/var/mobile/Library/Preferences/com.apple.findmy.plist",  @"/var/mobile/Library/Preferences/com.apple.healthd.plist",  @"/var/mobile/Library/Preferences/com.apple.ids.plist",  @"/var/mobile/Library/Preferences/com.apple.locationd.plist",  @"/var/mobile/Library/Preferences/com.apple.mobileme.fmf1.plist",  @"/var/mobile/Library/Preferences/com.apple.mobilephone.plist",  @"/var/mobile/Library/Preferences/com.apple.mobilephone.speeddial.plist",  @"/var/mobile/Library/Preferences/com.apple.mobiletimer.plist",  @"/var/mobile/Library/Preferences/com.apple.nanobuddy.plist",  @"/var/mobile/Library/Preferences/com.apple.nanolifestyle.plist",  @"/var/mobile/Library/Preferences/com.apple.nanolifestyle.privacy.plist",
           @"/var/mobile/Library/Preferences/com.apple.NanoMediaUI.plist",
           @"/var/mobile/Library/Preferences/com.apple.NanoMusicSync.plist",
           @"/var/mobile/Library/Preferences/com.apple.nanopassbook.plist",
           @"/var/mobile/Library/Preferences/com.apple.nanophotos.plist",
           @"/var/mobile/Library/Preferences/com.apple.nanonews.sync.plist",
           @"/var/mobile/Library/Preferences/com.apple.Noise.plist",
           @"/var/mobile/Library/Preferences/com.apple.podcasts.plist",
           @"/var/mobile/Library/Preferences/com.apple.SessionTrackerApp.plist",
           @"/var/mobile/Library/Preferences/com.apple.stockholm.plist",
           @"/var/mobile/Library/Preferences/com.apple.system.prefs.plist",
           @"/var/mobile/Library/Preferences/com.apple.timed.plist",
           @"/var/mobile/Library/Preferences/com.apple.voicememod.plist",
           @"/var/mobile/Library/Preferences/group.com.apple.stocks.plist",
           @"/var/mobile/Library/Preferences/Avalon");
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
    unsigned int v5 = [v4 tvOS];

    if (!v5) {
      return;
    }
    uint64_t v3 = +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"/var/mobile/Media/DCIM",  @"/var/mobile/Media/PhotoData",  @"/var/mobile/Library/Preferences/com.apple.demo-settings.plist",  @"/var/MobileDevice/ProvisioningProfiles",  @"/var/mobile/Library/com.apple.HeadBoard/HBDemoModeAppOrder",  @"/var/mobile/Library/com.apple.HeadBoard/AppOrder.plist",  @"/var/mobile/Library/Preferences/.GlobalPreferences.plist",  @"/var/mobile/Library/Preferences/.GlobalPreferences_m.plist",  @"/var/mobile/Library/DemoLoop",  0LL,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  v28,  v29,  v30,  v31,  v32,  v33,  v34,  v35,  v36,  v37,  v38,  v39,  v40,  v41,  v42,  v43,  v44,
           v45,
           v46,
           v47,
           v48,
           v49,
           v50,
           v51,
           v52,
           v53,
           v54,
           v55,
           v56,
           v57,
           v58);
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue(v3);
  io_object_t v7 = (void *)qword_10004F870;
  qword_10004F870 = v6;
}

id sub_100019DF4()
{
  if (qword_10004F888 != -1) {
    dispatch_once(&qword_10004F888, &stru_100044E80);
  }
  return (id)qword_10004F880;
}

void sub_100019E34(id a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  unsigned int v2 = [v1 watchOS];

  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"/var/mobile/Library/Caches/sharedCaches/com.apple.WatchListKit.NSURLCache",  @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/VaryState.db-shm",  @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/VaryState.db-wal",  @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/VaryState.db",  @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/Cache.db",  @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/Cache.db-wal",  @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/Cache.db-shm",  @"/var/mobile/Library/Caches/sharedCaches/com.apple.iTunesStore.NSURLCache/fsCachedData",  0LL));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
    unsigned int v5 = [v4 tvOS];

    if (!v5) {
      return;
    }
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }

  uint64_t v6 = (void *)qword_10004F880;
  qword_10004F880 = v3;
}

id sub_100019F34()
{
  if (qword_10004F898 != -1) {
    dispatch_once(&qword_10004F898, &stru_100044EA0);
  }
  return (id)qword_10004F890;
}

void sub_100019F74(id a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
  unsigned int v2 = [v1 watchOS];

  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"systemgroup.com.apple.configurationprofiles",  0LL));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPlatform sharedInstance](&OBJC_CLASS___MSDPlatform, "sharedInstance"));
    unsigned int v5 = [v4 tvOS];

    if (!v5) {
      return;
    }
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  }

  uint64_t v6 = (void *)qword_10004F890;
  qword_10004F890 = v3;
}

id sub_10001A030()
{
  if (qword_10004F8A8 != -1) {
    dispatch_once(&qword_10004F8A8, &stru_100044EC0);
  }
  return (id)qword_10004F8A0;
}

void sub_10001A070(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"/.com.apple.mobile_container_manager.metadata.plist",  @"/Library/Caches",  @"/Library/SyncedPreferences",  @"/Library/Saved Application State",  @"/SystemData/com.apple.AuthenticationServices",  0LL));
  unsigned int v2 = (void *)qword_10004F8A0;
  qword_10004F8A0 = v1;
}

id sub_10001A0D8()
{
  if (qword_10004F8B8 != -1) {
    dispatch_once(&qword_10004F8B8, &stru_100044EE0);
  }
  return (id)qword_10004F8B0;
}

void sub_10001A118(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  @"/.com.apple.mobile_container_manager.metadata.plist",  @"/Library/Caches",  @"/Library/SyncedPreferences",  @"/Library/Saved Application State",  @"/SystemData/com.apple.AuthenticationServices",  0LL));
  unsigned int v2 = (void *)qword_10004F8B0;
  qword_10004F8B0 = v1;
}

id sub_10001A180()
{
  v6[0] = @"ContentRootDomain";
  id v0 = sub_100019988();
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v6[1] = @"SystemContainerDomain";
  v7[0] = v1;
  id v2 = sub_100019F34();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v7[1] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));

  return v4;
}

void sub_10001A59C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_10001A5C4(uint64_t a1, uint64_t a2)
{
  id v4 = objc_autoreleasePoolPush();
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectAtIndex:a2]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    io_object_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) metadataForFile:v5]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) stringByAppendingPathComponent:v5]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) pathsToSkip]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 lowercaseString]);
    unsigned int v11 = [v9 containsObject:v10];

    if (v11)
    {
      id v12 = sub_100021D84();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315394;
        uint64_t v17 = "-[MSDHFileMetadataRestore restoreAttributesUnder:fromManifestData:]_block_invoke";
        __int16 v18 = 2114;
        uint64_t v19 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Skip file attributes restore for %{public}@",  (uint8_t *)&v16,  0x16u);
      }
    }

    else
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
      id v15 = sub_100021D84();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10002AD60();
      }
    }
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 0;
    id v14 = sub_100021D84();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Got non-string value from array.",  (uint8_t *)&v16,  2u);
    }

    io_object_t v7 = 0LL;
    uint64_t v8 = 0LL;
  }

LABEL_9:
  objc_autoreleasePoolPop(v4);
}

void sub_10001AED4(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___MSDHOperations);
  id v2 = (void *)qword_10004F8C0;
  qword_10004F8C0 = (uint64_t)v1;
}

LABEL_11:
  uint64_t v17 = 1;
LABEL_12:

  return v17;
}

LABEL_12:
}

LABEL_2:
  unsigned int v5 = @"CreateSnapshot";
LABEL_5:
  uint64_t v6 = [v4 manageSnapshot:v5 forVolumeAt:@"/private/var"];
LABEL_6:

  return v6;
}

LABEL_23:
        unsigned int v11 = 0;
        goto LABEL_8;
      }

      uint64_t v19 = sub_100021D84();
      __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        goto LABEL_27;
      }
      goto LABEL_28;
    }

    if (-[__CFString isEqualToString:](v5, "isEqualToString:", @"MountSnapshot"))
    {
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 userHomePath]);
      if (v8)
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.snapshot/private/var" stringByAppendingPathComponent:v6]);
        id v14 = [v7 mountSnapshotAt:v13 forVolumeAt:v8];
LABEL_19:
        unsigned int v11 = v14;
LABEL_20:

        goto LABEL_8;
      }

      uint64_t v20 = sub_100021D84();
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
LABEL_34:
      }
        sub_10002B8DC();
    }

    else
    {
      if (!-[__CFString isEqualToString:](v5, "isEqualToString:", @"UnmountSnapshot"))
      {
        id v15 = sub_100021D84();
        uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = 138543362;
          uint64_t v23 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Unknown volume operation: %{public}@",  (uint8_t *)&v22,  0xCu);
        }

        goto LABEL_23;
      }

      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 userHomePath]);
      if (v8)
      {
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.snapshot/private/var" stringByAppendingPathComponent:v6]);
        id v14 = [v7 unmountSnapshotAt:v13];
        goto LABEL_19;
      }

      uint64_t v21 = sub_100021D84();
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
    }

    unsigned int v11 = 0;
    goto LABEL_20;
  }

  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 userHomePath]);
  if (!v8)
  {
    uint64_t v17 = sub_100021D84();
    __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
LABEL_27:
    }
      sub_10002B8DC();
LABEL_28:

    goto LABEL_23;
  }

  uint64_t v9 = v7;
  uint64_t v10 = v5;
LABEL_7:
  unsigned int v11 = [v9 manageSnapshot:v10 forVolumeAt:v8];
LABEL_8:

  return v11;
}

LABEL_29:
    unsigned int v5 = v37;
  }

  else
  {
    uint64_t v33 = 1;
  }

  return v33;
}

LABEL_16:
  return v27;
}

void sub_10001E340( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001E374(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001E384(uint64_t a1)
{
}

void sub_10001E38C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[OSLogEventStream alloc] initWithSource:v3];

  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  io_object_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  *(void *)(a1 + 32)));
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setFilterPredicate:v7];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001E4F4;
  v10[3] = &unk_100044F50;
  uint64_t v12 = *(void *)(a1 + 56);
  id v11 = *(id *)(a1 + 40);
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setInvalidationHandler:v10];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001E5F0;
  v9[3] = &unk_100044F78;
  v9[4] = *(void *)(a1 + 64);
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setEventHandler:v9];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  -172800.0));
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) activateStreamFromDate:v8];
}

uint64_t sub_10001E4F4(uint64_t a1, uint64_t a2)
{
  if (a2 == 5) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }
  id v4 = sub_100021D84();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
      uint64_t v6 = @"successful";
    }
    else {
      uint64_t v6 = @"failed";
    }
    int v8 = 138543618;
    uint64_t v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Log file creation %{public}@, OSLogEventStreamInvalidation: %lu",  (uint8_t *)&v8,  0x16u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001E5F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSISO8601DateFormatter);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](&OBJC_CLASS___NSTimeZone, "systemTimeZone"));
  -[NSISO8601DateFormatter setTimeZone:](v12, "setTimeZone:", v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 date]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSISO8601DateFormatter stringFromDate:](v12, "stringFromDate:", v5));

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) seekToEndOfFile];
  io_object_t v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  int v8 = (void *)objc_claimAutoreleasedReturnValue([v3 process]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v3 composedMessage]);

  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %@: %@\n",  v6,  v8,  v9));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dataUsingEncoding:4]);
  [v7 writeData:v11];
}

void sub_10001F114( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void *sub_10001F5D8(uint64_t a1)
{
  uint64_t v5 = 0LL;
  if (!qword_10004F8D8)
  {
    __int128 v6 = off_100044FE8;
    uint64_t v7 = 0LL;
    qword_10004F8D8 = _sl_dlopen(&v6, &v5);
    id v3 = v5;
    id v2 = (void *)qword_10004F8D8;
    if (qword_10004F8D8)
    {
      if (!v5) {
        goto LABEL_5;
      }
    }

    else
    {
      id v3 = (char *)abort_report_np("%s", v5);
    }

    free(v3);
    goto LABEL_5;
  }

  id v2 = (void *)qword_10004F8D8;
LABEL_5:
  result = dlsym(v2, "SFTerminateProcessNamed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  off_10004F8D0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_10001F6C8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_10001F6F4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10001F700()
{
  return SCError();
}

uint64_t sub_10001F708()
{
  if (!qword_10004F8E0)
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.mobilestoredemodhelper", 0LL, 1uLL);
    uint64_t v1 = (void *)qword_10004F8E0;
    qword_10004F8E0 = (uint64_t)mach_service;

    if (!qword_10004F8E0)
    {
      id v3 = sub_100021D84();
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Could not create XPC listener.", v5, 2u);
      }

      exit(1);
    }

    xpc_connection_set_event_handler((xpc_connection_t)qword_10004F8E0, &stru_100045020);
    xpc_connection_resume((xpc_connection_t)qword_10004F8E0);
  }

  return 0LL;
}

void sub_10001F7C0(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  id v3 = (id)qword_10004F8E0;
  id v4 = v2;
  if (xpc_get_type(v4) != (xpc_type_t)&_xpc_type_connection)
  {
    if (v4 == (OS_xpc_object *)&_xpc_error_termination_imminent)
    {
      id v11 = sub_100021D84();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      LOWORD(v16) = 0;
      uint64_t v13 = "XPC connection will be closed";
    }

    else
    {
      id v14 = sub_100021D84();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      BOOL v15 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v4 != (OS_xpc_object *)&_xpc_error_connection_invalid)
      {
        if (v15)
        {
          LODWORD(v16) = 136446210;
          *(void *)((char *)&v16 + 4) = xpc_dictionary_get_string(v4, _xpc_error_key_description);
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Got XPC error on listener connection: %{public}s",  (uint8_t *)&v16,  0xCu);
        }

        xpc_connection_cancel((xpc_connection_t)qword_10004F8E0);
        exit(1);
      }

      if (!v15)
      {
LABEL_14:

        exit(0);
      }

      LOWORD(v16) = 0;
      uint64_t v13 = "No XPC connection, exiting";
    }

    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 2u);
    goto LABEL_14;
  }

  id v5 = sub_100021D84();
  __int128 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10002C75C();
  }

  uint64_t v7 = v4;
  id v8 = sub_100021D84();
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Start to deal with new connection",  (uint8_t *)&v16,  2u);
  }

  *(void *)&__int128 v16 = _NSConcreteStackBlock;
  *((void *)&v16 + 1) = 3221225472LL;
  uint64_t v17 = sub_10001FAE0;
  uint64_t v18 = &unk_100045048;
  uint64_t v19 = v7;
  __int16 v10 = v7;
  xpc_connection_set_event_handler(v10, &v16);
  xpc_connection_resume(v10);
}

uint64_t start(uint64_t a1, uint64_t *a2)
{
  id v3 = sub_100021D84();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *a2;
    int v8 = 136446210;
    uint64_t v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s started", (uint8_t *)&v8, 0xCu);
  }

  sub_10001F708();
  __int128 v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v6 run];

  return 0LL;
}

void sub_10001FAE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  id v5 = sub_100021D84();
  __int128 v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10002C860();
  }

  id v7 = sub_100021D84();
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (type != (xpc_type_t)&_xpc_type_error)
  {
    if (v9) {
      sub_10002C834();
    }

    if (type != (xpc_type_t)&_xpc_type_dictionary) {
      sub_10002C80C();
    }
    id v10 = *(id *)(a1 + 32);
    id v11 = v3;
    id v12 = sub_100021D84();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10002C7E0();
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHMessageResponder sharedInstance](&OBJC_CLASS___MSDHMessageResponder, "sharedInstance"));
    [v14 handleXPCMessage:v11 fromConnection:v10];

    id v15 = sub_100021D84();
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10002C7B4();
    }
    goto LABEL_11;
  }

  if (v9) {
    sub_10002C788();
  }

  if (v3 == &_xpc_error_connection_invalid)
  {
    id v20 = sub_100021D84();
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v18 = "XPC disconnected by client";
      uint64_t v19 = buf;
      goto LABEL_21;
    }
  }

  else
  {
    if (v3 != &_xpc_error_termination_imminent) {
      goto LABEL_12;
    }
    id v17 = sub_100021D84();
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = 0;
      uint64_t v18 = "XPC connection will be closed";
      uint64_t v19 = (uint8_t *)&v21;
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v18, v19, 2u);
    }
  }

void sub_10001FCD8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id sub_100021D84()
{
  if (qword_10004F8F0 != -1) {
    dispatch_once(&qword_10004F8F0, &stru_100045068);
  }
  return (id)qword_10004F8E8;
}

void sub_100021DC4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.MobileStoreDemo", "Default");
  id v2 = (void *)qword_10004F8E8;
  qword_10004F8E8 = (uint64_t)v1;
}

id sub_100021DF4()
{
  if (qword_10004F900 != -1) {
    dispatch_once(&qword_10004F900, &stru_100045088);
  }
  return (id)qword_10004F8F8;
}

void sub_100021E34(id a1)
{
  os_log_t v1 = os_log_create("com.apple.MobileStoreDemo", "ScreenSaver");
  id v2 = (void *)qword_10004F8F8;
  qword_10004F8F8 = (uint64_t)v1;
}

id sub_100021E64()
{
  if (qword_10004F910 != -1) {
    dispatch_once(&qword_10004F910, &stru_1000450A8);
  }
  return (id)qword_10004F908;
}

void sub_100021EA4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.MobileStoreDemo", "Message");
  id v2 = (void *)qword_10004F908;
  qword_10004F908 = (uint64_t)v1;
}

id sub_100021ED4()
{
  if (qword_10004F920 != -1) {
    dispatch_once(&qword_10004F920, &stru_1000450C8);
  }
  return (id)qword_10004F918;
}

void sub_100021F14(id a1)
{
  if (os_variant_has_internal_content("com.apple.mobilestoredemod"))
  {
    os_log_t v1 = os_log_create("com.apple.MobileStoreDemo", "Signpost");
  }

  else
  {
    os_log_t v1 = (os_log_t)&_os_log_disabled;
    id v2 = &_os_log_disabled;
  }

  id v3 = (void *)qword_10004F918;
  qword_10004F918 = (uint64_t)v1;
}

void sub_100021F70( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
  [v10 logWithFormat:v9 andArgs:&a9];
}

void sub_10002200C(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___MSDLogModel);
  id v2 = (void *)qword_10004F928;
  qword_10004F928 = (uint64_t)v1;
}

void sub_1000221A8(_Unwind_Exception *a1)
{
}

void sub_100022538( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_100022550(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100022560(uint64_t a1)
{
}

void sub_100022568(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id v14 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringByAppendingFormat:@"/%@", a2]);
  __int128 v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) description]);
  NSLog(@"Checking existing log file (full path) %@ against %@", v14, v6);

  uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) attributesOfItemAtPath:v14 error:0]);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileCreationDate]);
  id v11 = [v10 compare:*(void *)(a1 + 40)];

  if (v11 == (id)-1LL)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileCreationDate]);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 description]);
    NSLog(@"Removing %@ whose creation date is %@.", v14, v13);

    [*(id *)(a1 + 48) removeItemAtPath:v14 error:0];
  }

  *a4 = 0;
}

void sub_100022804(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___MSDHMessageResponder);
  id v2 = (void *)qword_10004F938;
  qword_10004F938 = (uint64_t)v1;
}

void sub_100022A40(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"updateSignedManifest",  @"migratePreferencesFile:",  @"stageDeviceForUpdateProcess:",  @"clearStagedDeviceAfterUpdateProcess",  @"prepareWorkDirectory:",  @"removeWorkDirectory:",  @"createDeviceManifest:",  @"fileExistsAtPath:",  @"readPlistFile:outContent:",  @"touchFile:",  @"cloneFile:",  @"restoreBackupAttributes:",  @"restoreAppDataAttributes:",  @"deleteNvram:",  @"writeNvram:",  @"manageVolume:",  @"disableLaunchdServicesForWatch:",  @"moveStagingToFinal:",  @"switchToBackupFolder:",  @"reboot:",  @"quitHelper:",  @"collectDemoLogsToFolder:",  @"preserveBluetoothFileToShelter:",  @"restartBluetooth:",  @"setComputerNameAndHostname:",  @"executeTestScriptOfIdentifier:",  @"preserveSecondPartyAppDataToShelter:outErrorDict:",  @"setPreferences:",  0LL));
  id v2 = (void *)qword_10004F948;
  qword_10004F948 = v1;
}

id sub_100022C48(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleXPCMessage:*(void *)(a1 + 40) fromConnection:*(void *)(a1 + 48)];
}

LABEL_20:
  return 0;
}

void sub_1000247E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_10002559C(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40LL);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Converted from xpc to NSArray: %{public}@",  (uint8_t *)&v3,  0xCu);
}

void sub_100025618(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 134217984;
  uint64_t v4 = a1;
  sub_10000260C( (void *)&_mh_execute_header,  a2,  a3,  "The value at index %lu in this xpcArray are of an unsupported type",  (uint8_t *)&v3);
}

void sub_100025684(void *a1, os_log_s *a2)
{
  int v4 = 136315138;
  id v5 = [a1 objCType];
  sub_10000260C( (void *)&_mh_execute_header,  a2,  v3,  "Unsupported NSNumber type: %s for xpc dictionary encoding",  (uint8_t *)&v4);
}

void sub_100025708(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "The values in this NSArray are of an unsupported type",  v1,  2u);
}

void sub_100025748()
{
  id v0 = __error();
  sub_100002B58(v0);
  sub_100002B34();
  sub_100002B20((void *)&_mh_execute_header, v1, v2, "Cannot remove xattr for %{public}@ - %s", v3, v4, v5, v6, v7);
  sub_100002B4C();
}

void sub_1000257BC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Could not extract extended file attributes from %{public}@, returned %ld",  (uint8_t *)&v3,  0x16u);
}

void sub_100025840()
{
  id v0 = __error();
  sub_100002B58(v0);
  sub_100002B34();
  sub_100002B20( (void *)&_mh_execute_header,  v1,  v2,  "Coud not extract extended file attributes from %{public}@. File is expected to have extended attributes.  %s",  v3,  v4,  v5,  v6,  v7);
  sub_100002B4C();
}

void sub_1000258B4(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v6 = __error();
  int v7 = 138543874;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  __int16 v11 = 2080;
  id v12 = sub_100002B58(v6);
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to set xattr %{public}@ on %{public}@ - %s",  (uint8_t *)&v7,  0x20u);
}

void sub_100025968(void *a1, os_log_s *a2)
{
  int v4 = 134217984;
  unint64_t v5 = (unint64_t)[a1 length] >> 1;
  sub_10000260C((void *)&_mh_execute_header, a2, v3, "Unable to malloc bytes of size: %lu", (uint8_t *)&v4);
}

void sub_1000259EC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "String should be all hex digits: %@ (bad digit around %ld)",  (uint8_t *)&v3,  0x16u);
}

void sub_100025A70(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  sub_10000260C( (void *)&_mh_execute_header,  a2,  a3,  "Hex strings should have an even number of digits (%@)",  (uint8_t *)&v3);
}

void sub_100025ADC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025B4C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025BBC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025C2C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025C9C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025D0C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "One or more components have an invalid platformType",  v1,  2u);
}

void sub_100025D4C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)int v3 = 136315650;
  *(void *)&v3[4] = "-[MSDSignedManifestV7 initWithManifestData:]";
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2048;
  sub_1000061C4( (void *)&_mh_execute_header,  a2,  a3,  "%s - InstallationOrder count (%lu) doesn't match number of components in manifest (%lu)",  *(const char **)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
}

void sub_100025DD0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025E40( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025EB0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025F20( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025F90( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026000()
{
}

void sub_10002606C()
{
}

void sub_1000260D8()
{
}

void sub_100026144()
{
}

void sub_1000261B0()
{
  int v2 = 136315650;
  sub_1000061A8();
  sub_1000061C4( (void *)&_mh_execute_header,  v0,  v1,  "%s - Missing manifest data for section: %{public}@ for identifier: %{public}@",  v2);
}

void sub_100026228()
{
}

void sub_100026294()
{
}

void sub_100026300()
{
}

void sub_10002636C()
{
}

void sub_1000263D8()
{
}

void sub_100026440( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000264B0()
{
}

void sub_100026518()
{
}

void sub_100026594()
{
}

void sub_100026610()
{
}

void sub_10002668C()
{
}

void sub_1000266F8(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  v4[0] = 136315394;
  sub_1000061A8();
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s:  Failed to convert manifest file to property list.  Error:  %{public}@",  (uint8_t *)v4,  0x16u);

  sub_100002B4C();
}

void sub_10002678C()
{
}

void sub_1000267F8(void *a1, os_log_s *a2)
{
  int v3 = 136315394;
  uint64_t v4 = "+[MSDSignedManifestFactory readManifestFromFile:]";
  __int16 v5 = 1024;
  unsigned int v6 = [a1 intValue];
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s:  Manifest version %d is not supported yet.",  (uint8_t *)&v3,  0x12u);
  sub_100002B4C();
}

void sub_10002688C()
{
}

void sub_1000268F8()
{
}

void sub_100026964(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Can't create URL %{public}@",  (uint8_t *)&v2,  0xCu);
  sub_1000061BC();
}

void sub_1000269D4()
{
}

void sub_100026A34()
{
}

void sub_100026A94( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026AC4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026AF4(int a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Progress handler returned with status %d; failing verification",
    (uint8_t *)v2,
    8u);
  sub_100006F58();
}

void sub_100026B64( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026B94(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1000094F4( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Skipping all items in current item domain due to insufficient free disk space.",  a1);
}

void sub_100026BC8(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_10000954C();
  sub_10000260C((void *)&_mh_execute_header, a2, v4, "Failed to remove data shelter folder with error - %{public}@", v5);

  sub_100002B4C();
}

void sub_100026C48()
{
}

void sub_100026CAC()
{
}

void sub_100026D20()
{
}

void sub_100026D94(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_1000094F4((void *)&_mh_execute_header, a1, a3, "Failed to get answer for kMGQDiskUsage.", v3);
}

void sub_100026DCC(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_1000094F4((void *)&_mh_execute_header, a1, a3, "Failed to extract disk space information.", v3);
}

void sub_100026E04(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_10000954C();
  sub_10000260C((void *)&_mh_execute_header, a2, v4, "Enumeration error at (but will continue): %{public}@", v5);

  sub_100002B4C();
}

void sub_100026E84()
{
  id v2 = objc_msgSend((id)sub_100009540(v0, v1), "localizedDescription");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_1000094A8();
  sub_100009494((void *)&_mh_execute_header, v4, v5, "%s: Cannot find files/dirs under %@ - %@", v6, v7, v8, v9, 2u);

  sub_1000094C4();
}

void sub_100026F0C()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 localizedDescription]);
  sub_100009528();
  sub_100002B20((void *)&_mh_execute_header, v2, v3, "Failed to remove:  %@ - Error:  %@", v4, v5, v6, v7, v8);

  sub_100009500();
}

void sub_100026F8C()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 localizedDescription]);
  sub_100009528();
  sub_100002B20((void *)&_mh_execute_header, v2, v3, "Cannot remove %@ - %@", v4, v5, v6, v7, v8);

  sub_100009500();
}

void sub_10002700C()
{
  id v2 = objc_msgSend((id)sub_100009540(v0, v1), "localizedDescription");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_1000094A8();
  sub_100009494((void *)&_mh_execute_header, v4, v5, "%s: Cannot get attribute from %@ - %@", v6, v7, v8, v9, 2u);

  sub_1000094C4();
}

void sub_100027094()
{
  id v2 = objc_msgSend((id)sub_100009540(v0, v1), "localizedDescription");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_1000094A8();
  sub_100009494((void *)&_mh_execute_header, v4, v5, "%s: Cannot remove item: %@ - Error:  %@", v6, v7, v8, v9, 2u);

  sub_1000094C4();
}

void sub_10002711C()
{
  id v2 = objc_msgSend((id)sub_100009540(v0, v1), "localizedDescription");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_1000094A8();
  sub_100009494( (void *)&_mh_execute_header,  v4,  v5,  "%s - Failed to read attributes of folder:  %@ - Error:  %@",  v6,  v7,  v8,  v9,  2u);

  sub_1000094C4();
}

void sub_1000271A4(uint64_t a1, void *a2)
{
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_100009494( (void *)&_mh_execute_header,  v2,  v3,  "%s - Failed to create directory:  %@ - Error:  %@",  v4,  v5,  v6,  v7,  2u);

  sub_1000094C4();
}

void sub_100027250(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8LL) + 40LL);
  int v3 = 136315394;
  uint64_t v4 = "-[MSDHSnapshottedDataSaver createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s - Intermediate path:  %@ must be folder.",  (uint8_t *)&v3,  0x16u);
  sub_1000061BC();
}

void sub_1000272E0()
{
}

void sub_100027344()
{
}

void sub_1000273A4(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_10000C01C();
  sub_100002B20( (void *)&_mh_execute_header,  v3,  v4,  "Get file attributes failed for %{public}@ with error - %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100009500();
}

void sub_100027428()
{
}

void sub_100027494()
{
}

void sub_100027500()
{
  uint64_t v0 = sub_10000C008();
  sub_100002B58(v0);
  sub_10000BFF0();
  sub_100002B20( (void *)&_mh_execute_header,  v1,  v2,  "Could not get ACL for %{public}@ with error - %{public}s",  v3,  v4,  v5,  v6,  v7);
  sub_100002B4C();
}

void sub_10002756C()
{
}

void sub_100027598()
{
  uint64_t v0 = sub_10000C008();
  sub_100002B58(v0);
  sub_10000BFF0();
  sub_100002B20( (void *)&_mh_execute_header,  v1,  v2,  "Could not create ACL binary format for %{public}@ with error - %{public}s",  v3,  v4,  v5,  v6,  v7);
  sub_100002B4C();
}

void sub_100027604()
{
  uint64_t v0 = sub_10000C008();
  sub_100002B58(v0);
  sub_10000BFF0();
  sub_100002B20( (void *)&_mh_execute_header,  v1,  v2,  "Could not validate ACL for %{public}@ with error - %{public}s",  v3,  v4,  v5,  v6,  v7);
  sub_100002B4C();
}

void sub_100027670()
{
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  sub_10000619C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Could not extract extended file attributes from %{public}@, returned %td",  v2);
  sub_1000061BC();
}

void sub_1000276E4()
{
}

void sub_100027744()
{
}

void sub_1000277A4(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_10000C01C();
  sub_100002B20( (void *)&_mh_execute_header,  v3,  v4,  "Could not get destination of symbolic link %{public}@ with error - %{public}@",  v5,  v6,  v7,  v8,  v9);

  sub_100009500();
}

void sub_100027828()
{
}

void sub_100027888()
{
}

void sub_1000278E8()
{
}

void sub_100027914()
{
  sub_100006F34((void *)&_mh_execute_header, v0, v1, "Inconsistent return value from listxattr.", v2, v3, v4, v5, v6);
  sub_100006F58();
}

void sub_100027940()
{
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  sub_10000619C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Cannot remove extended attribte %{public}s from %{public}@.",  v2);
  sub_1000061BC();
}

void sub_1000279B4()
{
  uint64_t v0 = sub_10000C008();
  sub_100002B58(v0);
  sub_10000BFF0();
  sub_100002B20( (void *)&_mh_execute_header,  v1,  v2,  "Could not create empty ACL for %{public}@ with error - %{public}s",  v3,  v4,  v5,  v6,  v7);
  sub_100002B4C();
}

void sub_100027A20()
{
  uint64_t v0 = sub_10000C008();
  sub_100002B58(v0);
  sub_10000BFF0();
  sub_100002B20( (void *)&_mh_execute_header,  v1,  v2,  "Could not set ACL for %{public}@ with error - %{public}s",  v3,  v4,  v5,  v6,  v7);
  sub_100002B4C();
}

void sub_100027A8C()
{
  uint64_t v0 = sub_10000C008();
  sub_100002B58(v0);
  sub_10000BFF0();
  sub_100002B20( (void *)&_mh_execute_header,  v1,  v2,  "Could not load ACL for %{public}@ with error - %{public}s",  v3,  v4,  v5,  v6,  v7);
  sub_100002B4C();
}

void sub_100027AF8()
{
}

void sub_100027B58()
{
}

void sub_100027B84()
{
}

void sub_100027BB0()
{
}

void sub_100027C1C()
{
}

void sub_100027C88( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100027CF8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100027D68()
{
}

void sub_100027D94()
{
}

void sub_100027DC0()
{
}

void sub_100027DEC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100027E5C()
{
}

void sub_100027E88( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100027EF8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100027F68( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100027FD8()
{
}

void sub_100028004( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028074( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000280E4()
{
}

void sub_100028110()
{
}

void sub_10002813C()
{
}

void sub_100028168()
{
}

void sub_1000281D4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028244()
{
}

void sub_1000282A4()
{
}

void sub_100028310( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028380( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000283F0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028460()
{
}

void sub_1000284C0(os_log_t log)
{
  int v1 = 136315394;
  uint64_t v2 = "-[MSDDemoManifestCheck checkFileForEntitlements:forCorrespondingManifestEntry:]";
  __int16 v3 = 1024;
  int v4 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s:There is unexpected invalid signature/entitlements:%08x",  (uint8_t *)&v1,  0x12u);
  sub_1000061BC();
}

void sub_100028548()
{
}

void sub_1000285B4()
{
}

void sub_100028620( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028690( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028700()
{
}

void sub_10002872C()
{
}

void sub_100028758( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000287C8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028838( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000288A0()
{
}

void sub_100028900()
{
}

void sub_10002892C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002899C()
{
}

void sub_100028A0C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028A7C()
{
}

void sub_100028AEC()
{
}

void sub_100028B5C()
{
}

void sub_100028BCC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028C3C(int a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[MSDDemoManifestCheck verifySignature:forData:withKey:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%s: Failed in verifying signature(%d)",  (uint8_t *)&v2,  0x12u);
  sub_1000061BC();
}

void sub_100028CC0()
{
}

void sub_100028CF8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028D68( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028DD8()
{
}

void sub_100028E04( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028E74( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028EE4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100028F54(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 40);
  int v4 = 136315650;
  uint64_t v5 = "-[MSDDemoManifestCheck runSecurityCheck:]_block_invoke";
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s: Failed rigorous check for:%{public}@ (from %{public}@)",  (uint8_t *)&v4,  0x20u);
}

void sub_100028FEC()
{
}

void sub_10002904C()
{
}

void sub_1000290B8()
{
}

void sub_100029124()
{
}

void sub_100029190()
{
}

void sub_1000291F0()
{
}

void sub_100029250()
{
}

void sub_10002927C()
{
}

void sub_1000292DC()
{
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  sub_10000619C((void *)&_mh_execute_header, v1, (uint64_t)v1, "File permissions failed for file:%{public}@(%ld)", v2);
  sub_1000061BC();
}

void sub_100029350()
{
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  sub_10000619C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Not a valid fileType (%{public}@) for file: %{public}@",  v2);
  sub_1000061BC();
}

void sub_1000293C4()
{
}

void sub_100029424()
{
}

void sub_100029484()
{
}

void sub_1000294E4()
{
}

void sub_100029544()
{
}

void sub_100029574(_BYTE *a1, _BYTE *a2)
{
}

void sub_1000295A0(_BYTE *a1, _BYTE *a2)
{
}

void sub_1000295CC(_BYTE *a1, _BYTE *a2)
{
}

void sub_1000295F8(_BYTE *a1, _BYTE *a2)
{
}

void sub_100029624()
{
}

void sub_100029654()
{
}

void sub_100029684()
{
}

void sub_1000296B4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Cannot load Domains.plist: %{public}@.",  (uint8_t *)&v2,  0xCu);
}

void sub_100029728()
{
}

void sub_100029754()
{
}

void sub_100029780()
{
}

void sub_1000297AC()
{
}

void sub_1000297D8()
{
}

void sub_100029804()
{
}

void sub_100029830()
{
}

void sub_10002985C()
{
}

void sub_100029888()
{
}

void sub_1000298B4()
{
}

void sub_1000298E0()
{
}

void sub_10002990C()
{
}

void sub_100029938()
{
}

void sub_100029964()
{
}

void sub_100029990()
{
}

void sub_1000299BC()
{
}

void sub_1000299E8()
{
}

void sub_100029A14()
{
}

void sub_100029A40()
{
}

void sub_100029A6C()
{
}

void sub_100029A98()
{
}

void sub_100029AC4()
{
}

void sub_100029AF0()
{
}

void sub_100029B1C()
{
}

void sub_100029B48()
{
}

void sub_100029B74()
{
}

void sub_100029BA0()
{
}

void sub_100029BCC()
{
}

void sub_100029BF8()
{
}

void sub_100029C24()
{
}

void sub_100029C90()
{
}

void sub_100029CFC()
{
}

void sub_100029D68()
{
}

void sub_100029DD4()
{
}

void sub_100029E40()
{
}

void sub_100029EAC()
{
}

void sub_100029ED8()
{
}

void sub_100029F04()
{
}

void sub_100029F30()
{
}

void sub_100029F94(os_log_s *a1)
{
  int v2 = *__error();
  v4[0] = 67240192;
  v4[1] = v2;
  sub_100016D00( (void *)&_mh_execute_header,  a1,  v3,  "Failed to statfs '/' with error - %{public, errno}d",  (uint8_t *)v4);
  sub_1000061BC();
}

void sub_10002A014()
{
}

void sub_10002A040()
{
}

void sub_10002A0A4()
{
}

void sub_10002A108(void *a1, unint64_t a2, os_log_s *a3)
{
  uint64_t v3 = *a1 >> 20;
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  unint64_t v7 = a2 >> 20;
  sub_10000619C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "Free space left: %llu MB but needed: %lld MB",  (uint8_t *)&v4);
  sub_1000061BC();
}

void sub_10002A18C()
{
}

void sub_10002A1F0()
{
}

void sub_10002A254()
{
  uint64_t v0 = sub_10000C008();
  strerror(*v0);
  sub_100016D0C( (void *)&_mh_execute_header,  v1,  v2,  "Failed to get mounted filesystem info - %{public}s",  v3,  v4,  v5,  v6,  2u);
  sub_100002B4C();
}

void sub_10002A2C8(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_100016D0C( (void *)&_mh_execute_header,  v2,  v3,  "Failed to set file attributes on mount point - %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_100002B4C();
}

void sub_10002A344(os_log_s *a1)
{
  int v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_100016D00((void *)&_mh_execute_header, a1, v3, "Failed to get file stat - %{errno}d", (uint8_t *)v4);
  sub_1000061BC();
}

void sub_10002A3C4(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_10000C01C();
  sub_10000619C((void *)&_mh_execute_header, a3, v5, "Failed to create mount point at '%{public}@' - %{public}@", v6);

  sub_100009500();
}

void sub_10002A450()
{
}

void sub_10002A47C(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  sub_10000C01C();
  sub_10000619C((void *)&_mh_execute_header, a3, v5, "Failed to remove mount point at '%{public}@' -  %{public}@", v6);

  sub_100009500();
}

void sub_10002A508()
{
  uint64_t v0 = sub_10000C008();
  strerror(*v0);
  sub_100016D0C((void *)&_mh_execute_header, v1, v2, "Failed to unmount APFS volume - %{public}s", v3, v4, v5, v6, 2u);
  sub_100002B4C();
}

void sub_10002A57C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to synchronize with CFPreferences.",  v1,  2u);
}

void sub_10002A5BC(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315138;
  uint64_t v4 = "-[MSDManifest addFilesUsingSourceManifest:]";
  sub_10000260C( (void *)&_mh_execute_header,  a1,  a3,  "%s: Root path must be the same between source and device manifest.",  (uint8_t *)&v3);
}

void sub_10002A634(uint8_t *a1, void *a2, void *a3, os_log_s *a4)
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a2 path]);
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl( (void *)&_mh_execute_header,  a4,  OS_LOG_TYPE_ERROR,  "Couldn't get meta data for %{public}@",  a1,  0xCu);
}

void sub_10002A6A8(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 path]);
  int v5 = 138543362;
  uint64_t v6 = v3;
  sub_10000260C((void *)&_mh_execute_header, a2, v4, "Couldn't run handler against %{public}@", (uint8_t *)&v5);
}

void sub_10002A734(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "rootPath already specified. Could not add more files.",  v1,  2u);
}

void sub_10002A774(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 absoluteString]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByRemovingPercentEncoding]);
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Cannot read file %{public}@",  (uint8_t *)&v5,  0xCu);

  sub_100009500();
}

void sub_10002A814(void *a1, uint64_t a2, os_log_s *a3)
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue([a1 absoluteString]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByRemovingPercentEncoding]);
  int v7 = 138543618;
  __int16 v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Cannot read data from %{public}@ - %{public}@.",  (uint8_t *)&v7,  0x16u);

  sub_100009500();
}

void sub_10002A8C4(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40LL);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Converted from xpc to NSDictionary: %{public}@",  (uint8_t *)&v3,  0xCu);
  sub_1000061BC();
}

void sub_10002A93C(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 138543362;
  uint64_t v4 = a1;
  sub_10000260C( (void *)&_mh_execute_header,  a2,  a3,  "The value for key %{public}@ has a type that is not supported yet",  (uint8_t *)&v3);
  sub_1000061BC();
}

void sub_10002A9A4(void *a1, os_log_s *a2)
{
  int v4 = 136315138;
  id v5 = [a1 objCType];
  sub_10000260C( (void *)&_mh_execute_header,  a2,  v3,  "Unsupported NSNumber type: %s for xpc dictionary encoding",  (uint8_t *)&v4);
  sub_100002B4C();
}

void sub_10002AA20(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v8 = 138543618;
  uint64_t v9 = a1;
  sub_10001996C();
  id v6 = v5;
  sub_10000619C( (void *)&_mh_execute_header,  a3,  v7,  "The value for key %{public}@ has unsupported type %{public}@",  (uint8_t *)&v8);

  sub_100002B4C();
}

void sub_10002AAB0(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315394;
  int v4 = "+[NSDictionary(xpcdictConv) dictionaryFromJsonData:]";
  __int16 v5 = 2114;
  uint64_t v6 = 0LL;
  sub_10000619C((void *)&_mh_execute_header, a1, a3, "%s: Cannot convert %{public}@ to dictionary", (uint8_t *)&v3);
  sub_1000061BC();
}

void sub_10002AB30(void *a1)
{
  sub_1000094C4();
}

void sub_10002ABB4()
{
  int v2 = 136315394;
  uint64_t v3 = "+[NSDictionary(xpcdictConv) dictionaryFromJsonData:]";
  sub_10001996C();
  sub_10000619C((void *)&_mh_execute_header, v0, v1, "%s: format not correct: %{public}@", (uint8_t *)&v2);
  sub_1000061BC();
}

void sub_10002AC28(void *a1)
{
  sub_1000094C4();
}

void sub_10002ACAC()
{
  int v2 = 136315394;
  uint64_t v3 = "-[NSDictionary(xpcdictConv) convertToNSData]";
  sub_10001996C();
  sub_10000619C((void *)&_mh_execute_header, v0, v1, "%s: Not a valid JSON object: %{public}@", (uint8_t *)&v2);
  sub_1000061BC();
}

void sub_10002AD20(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Failed to create manifest from manifest data.",  v1,  2u);
}

void sub_10002AD60()
{
}

void sub_10002ADCC(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 deviceUID]);
  int v4 = *__error();
  uint64_t v5 = __error();
  uint64_t v6 = strerror(*v5);
  int v7 = 136315906;
  uint8_t v8 = "-[MSDHFileMetadataRestore _gatherDeviceDemoUserAccountInfo]";
  __int16 v9 = 2114;
  uint64_t v10 = v3;
  __int16 v11 = 1024;
  int v12 = v4;
  __int16 v13 = 2082;
  id v14 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s - Failed to get password entry for UID:  %{public}@ - errno:  %d - %{public}s",  (uint8_t *)&v7,  0x26u);
}

void sub_10002AEA8(void *a1, _DWORD *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 deviceUID]);
  LODWORD(a2) = *a2;
  int v6 = *__error();
  int v7 = __error();
  uint8_t v8 = strerror(*v7);
  int v9 = 136316162;
  uint64_t v10 = "-[MSDHFileMetadataRestore _gatherDeviceDemoUserAccountInfo]";
  __int16 v11 = 2114;
  int v12 = v5;
  __int16 v13 = 1024;
  int v14 = (int)a2;
  __int16 v15 = 1024;
  int v16 = v6;
  __int16 v17 = 2082;
  uint64_t v18 = v8;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%s - Failed to get group entry for UID:  %{public}@ with group ID:  %d - errno:  %d - %{public}s",  (uint8_t *)&v9,  0x2Cu);
}

void sub_10002AF94()
{
}

void sub_10002B000(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "File %{public}@ belong to UID: %{public}@; file metadata does not need to be updated",
    (uint8_t *)&v3,
    0x16u);
  sub_1000061BC();
}

void sub_10002B080(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315394;
  uint64_t v4 = "-[MSDHOperations updateSignedManifest]";
  __int16 v5 = 2114;
  uint64_t v6 = @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/Manifest.signed.plist";
  sub_10000619C((void *)&_mh_execute_header, a1, a3, "%s - Cannot load manifest:  %{public}@", (uint8_t *)&v3);
  sub_1000061BC();
}

void sub_10002B108(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315394;
  uint64_t v4 = "-[MSDHOperations updateSignedManifest]";
  __int16 v5 = 2114;
  uint64_t v6 = @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/Manifest.signed.plist";
  sub_10000619C((void *)&_mh_execute_header, a1, a3, "%s - Manifest file does not exist:  %{public}@", (uint8_t *)&v3);
  sub_1000061BC();
}

void sub_10002B190()
{
}

void sub_10002B1F0()
{
}

void sub_10002B258()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 localizedDescription]);
  sub_10001F6D8();
  sub_100009494( (void *)&_mh_execute_header,  v2,  v3,  "%s: Cannot get attribute from %{public}@ - %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_1000094C4();
}

void sub_10002B2E4()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 localizedDescription]);
  sub_10001F6D8();
  sub_100009494( (void *)&_mh_execute_header,  v2,  v3,  "%s: Cannot set attribute for %{public}@ - %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_1000094C4();
}

void sub_10002B370()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v0 localizedDescription]);
  sub_10001F6D8();
  sub_100009494( (void *)&_mh_execute_header,  v2,  v3,  "%s: Cannot create direcotry at %{public}@ - %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_1000094C4();
}

void sub_10002B3FC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B46C()
{
  int v3 = 136315650;
  uint64_t v4 = "-[MSDHOperations createDeviceManifestForComponent:ofType:withRootPath:userHomePath:andSavePath:]";
  sub_10001996C();
  __int16 v5 = v0;
  uint64_t v6 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "%s: No manifest data found for component: %{public}@ of type: %{public}@",  (uint8_t *)&v3,  0x20u);
}

void sub_10002B4F8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002B568(void *a1, os_log_s *a2)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_10000954C();
  sub_10000260C((void *)&_mh_execute_header, a2, v4, "Cannot write device manifest with error - %{public}@", v5);

  sub_100002B4C();
}

void sub_10002B5E8()
{
  id v2 = objc_msgSend((id)sub_10001F6F4(v0, v1), "localizedDescription");
  int v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000C01C();
  sub_100002B20( (void *)&_mh_execute_header,  v4,  v5,  "Failed to read plist file at %{public}@ - %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_100009500();
}

void sub_10002B664()
{
}

void sub_10002B690()
{
}

void sub_10002B6F0()
{
}

void sub_10002B71C()
{
}

void sub_10002B748()
{
}

void sub_10002B774()
{
}

void sub_10002B7A0(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_10001996C();
  sub_100002B20( (void *)&_mh_execute_header,  v2,  v3,  "Failed to create folder at: %{public}@ error: %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_100002B4C();
}

void sub_10002B828(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_10001996C();
  sub_100002B20( (void *)&_mh_execute_header,  v2,  v3,  "Failed to remove folder at: %{public}@ error: %{public}@",  v4,  v5,  v6,  v7,  2u);

  sub_100002B4C();
}

void sub_10002B8B0()
{
}

void sub_10002B8DC()
{
}

void sub_10002B93C()
{
  id v2 = objc_msgSend((id)sub_10001F6F4(v0, v1), "localizedDescription");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000C01C();
  sub_100002B20( (void *)&_mh_execute_header,  v4,  v5,  "Failed to create folder: %{public}@ error: %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_100009500();
}

void sub_10002B9B8()
{
}

void sub_10002BA18()
{
  id v2 = objc_msgSend((id)sub_10001F6F4(v0, v1), "localizedDescription");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000C01C();
  sub_100002B20( (void *)&_mh_execute_header,  v4,  v5,  "Failed to get file attributes of %{public}@ - %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_100009500();
}

void sub_10002BA94()
{
  id v2 = objc_msgSend((id)sub_10001F6F4(v0, v1), "localizedDescription");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000C01C();
  sub_100002B20( (void *)&_mh_execute_header,  v4,  v5,  "Cannot get destination path for %{public}@ - %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_100009500();
}

void sub_10002BB10()
{
  id v2 = objc_msgSend((id)sub_10001F6F4(v0, v1), "localizedDescription");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000C01C();
  sub_100002B20( (void *)&_mh_execute_header,  v4,  v5,  "Cannot remove symlink %{public}@ - %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_100009500();
}

void sub_10002BB8C()
{
  id v2 = objc_msgSend((id)sub_10001F6F4(v0, v1), "localizedDescription");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000C01C();
  sub_100002B20( (void *)&_mh_execute_header,  v4,  v5,  "Could not remove %{public}@ with error - %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_100009500();
}

void sub_10002BC08()
{
}

void sub_10002BC68(os_log_s *a1)
{
  int v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_100016D00( (void *)&_mh_execute_header,  a1,  v3,  "Failed to rename temporary backup folder to the real backup folder: %{errno}d",  (uint8_t *)v4);
  sub_1000061BC();
}

void sub_10002BCE8(int a1, os_log_s *a2, uint64_t a3)
{
  v3[0] = 67109120;
  v3[1] = a1;
  sub_100016D00((void *)&_mh_execute_header, a2, a3, "Failed to reboot device with error - %d", (uint8_t *)v3);
  sub_100006F58();
}

void sub_10002BD50()
{
}

void sub_10002BD7C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002BDEC()
{
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  sub_10000619C( (void *)&_mh_execute_header,  v1,  (uint64_t)v1,  "Couldn't load manifest dict for backup range location = %lu; size_t length = %lu",
    v2);
  sub_1000061BC();
}

void sub_10002BE60()
{
}

void sub_10002BE8C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002BEFC()
{
}

void sub_10002BF64()
{
}

void sub_10002BF90(void *a1, os_log_s *a2)
{
}

void sub_10002C004()
{
}

void sub_10002C030()
{
}

void sub_10002C05C()
{
}

void sub_10002C088()
{
}

void sub_10002C0B4()
{
}

void sub_10002C0E0()
{
}

void sub_10002C10C()
{
}

void sub_10002C138()
{
  id v2 = objc_msgSend((id)sub_10001F6F4(v0, v1), "localizedDescription");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000C01C();
  sub_100002B20( (void *)&_mh_execute_header,  v4,  v5,  "Failed to create parent folder %{public}@ with error - %{public}@",  v6,  v7,  v8,  v9,  v10);

  sub_100009500();
}

void sub_10002C1B4()
{
}

void sub_10002C214()
{
}

void sub_10002C274()
{
}

void sub_10002C2D4()
{
}

void sub_10002C334()
{
}

uint64_t sub_10002C394()
{
  uint64_t v0 = dlerror();
  uint64_t v1 = abort_report_np("%s", v0);
  return sub_10002C3B4(v1);
}

void sub_10002C3B4(int a1, os_log_s *a2, uint64_t a3)
{
  v3[0] = 67109120;
  v3[1] = a1;
  sub_100016D00((void *)&_mh_execute_header, a2, a3, "Failed to restart bluetoothd: %d", (uint8_t *)v3);
  sub_100006F58();
}

void sub_10002C41C(os_log_s *a1)
{
  int v2 = sub_10001F700();
  SCErrorString(v2);
  sub_10000954C();
  sub_10000260C((void *)&_mh_execute_header, a1, v3, "SCPreferencesCreate failed - Error:  %{public}s", v4);
  sub_100002B4C();
}

void sub_10002C490(os_log_s *a1)
{
  int v2 = sub_10001F700();
  SCErrorString(v2);
  sub_10000954C();
  sub_10000260C((void *)&_mh_execute_header, a1, v3, "SCPreferencesSetComputerName failed - Error:  %{public}s", v4);
  sub_100002B4C();
}

void sub_10002C504()
{
}

void sub_10002C530(os_log_s *a1)
{
  int v2 = sub_10001F700();
  SCErrorString(v2);
  sub_10000954C();
  sub_10000260C((void *)&_mh_execute_header, a1, v3, "SCPreferencesSetLocalHostName failed - Error:  %{public}s", v4);
  sub_100002B4C();
}

void sub_10002C5A4(os_log_s *a1)
{
  int v2 = sub_10001F700();
  SCErrorString(v2);
  sub_10000954C();
  sub_10000260C((void *)&_mh_execute_header, a1, v3, "SCPreferencesCommitChanges failed - Error:  %{public}s", v4);
  sub_100002B4C();
}

void sub_10002C618(os_log_s *a1)
{
  int v2 = sub_10001F700();
  SCErrorString(v2);
  sub_10000954C();
  sub_10000260C((void *)&_mh_execute_header, a1, v3, "SCPreferencesApplyChanges failed - Error:  %{public}s", v4);
  sub_100002B4C();
}

void sub_10002C68C()
{
}

void sub_10002C6EC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C75C()
{
}

void sub_10002C788()
{
}

void sub_10002C7B4()
{
}

void sub_10002C7E0()
{
}

void sub_10002C80C()
{
  __assert_rtn("MSDH_handle_connection_block_invoke", "demod_helper.m", 56, "type == XPC_TYPE_DICTIONARY");
}

void sub_10002C834()
{
}

void sub_10002C860()
{
}

void sub_10002C88C()
{
  uint64_t v0 = sub_10000C008();
  sub_100002B58(v0);
  sub_10000954C();
  sub_100016D0C((void *)&_mh_execute_header, v1, v2, "ip address - inet_ntop failed - %s", v3, v4, v5, v6, v7);
  sub_100002B4C();
}

void sub_10002C8F8()
{
  uint64_t v0 = sub_10000C008();
  sub_100002B58(v0);
  sub_10000954C();
  sub_100016D0C((void *)&_mh_execute_header, v1, v2, "net mask - inet_ntop failed - %s", v3, v4, v5, v6, v7);
  sub_100002B4C();
}

void sub_10002C964()
{
  uint64_t v0 = sub_10000C008();
  sub_100002B58(v0);
  sub_10000954C();
  sub_100016D0C((void *)&_mh_execute_header, v1, v2, "broadcast addr - inet_ntop failed - %s", v3, v4, v5, v6, v7);
  sub_100002B4C();
}

void sub_10002C9D0(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing interface name", buf, 2u);
}

void sub_10002CA0C()
{
  uint64_t v0 = sub_10000C008();
  sub_100002B58(v0);
  sub_10000954C();
  sub_100016D0C((void *)&_mh_execute_header, v1, v2, "getifaddrs failed - %s", v3, v4, v5, v6, v7);
  sub_100002B4C();
}

void sub_10002CA78(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to remove file from %{public}@ - %{public}@",  (uint8_t *)&v6,  0x16u);
}

void sub_10002CB28(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to set file attributes: %{public}@",  (uint8_t *)&v2,  0xCu);
}

void sub_10002CB9C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v6 = *__error();
  int v7 = 138543874;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  __int16 v11 = 1024;
  int v12 = v6;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "Failed to clonefile from %{public}@ to %{public}@ - %{errno}d",  (uint8_t *)&v7,  0x1Cu);
}

void sub_10002CC50(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Cannot load domains.plist from %{public}@.",  (uint8_t *)&v2,  0xCu);
  sub_1000061BC();
}

void sub_10002CCC0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002CCF4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002CD28(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Manifest file path %{public}@ is not same as real path: %{public}@",  (uint8_t *)&v3,  0x16u);
  sub_1000061BC();
}

void sub_10002CDA8(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  int v3 = "-[WhitelistChecker handleSystemContainerFiles:withMetadata:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s:Container check failed for %{public}@",  (uint8_t *)&v2,  0x16u);
  sub_1000061BC();
}

void sub_10002CE2C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002CE9C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002CF0C()
{
  v2[0] = 136315394;
  sub_1000061A8();
  sub_10000619C((void *)&_mh_execute_header, v0, v1, "%s: format not correct: %{public}@", (uint8_t *)v2);
  sub_1000061BC();
}

void sub_10002CF7C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002CFAC()
{
}

void sub_10002D00C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D03C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D0AC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D11C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D18C()
{
  v1[0] = 136315394;
  sub_1000061A8();
  _os_log_debug_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEBUG,  "Entering %s with parameter: %{public}@",  (uint8_t *)v1,  0x16u);
  sub_1000061BC();
}

void sub_10002D204()
{
  __int16 v3 = 1026;
  int v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "INFO - computerName:  %{public}@ - encoding:  0x%{public}x",  v2,  0x12u);
  sub_1000061BC();
}

void sub_10002D280( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002D2F0()
{
}

void sub_10002D350(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  id v5 = [(id)objc_opt_class(a1) description];
  uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_10000954C();
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  sub_10000619C((void *)&_mh_execute_header, a3, v7, "%{public}@ does not respond to %{public}@.", v8);
}

void sub_10002D3F4()
{
}

void sub_10002D454( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_createDeviceManifestForComponent_ofType_withRootPath_userHomePath_andSavePath_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDeviceManifestForComponent:ofType:withRootPath:userHomePath:andSavePath:");
}

id objc_msgSend_restoreAppDataAttributesUnder_containerType_identifier_manifestUID_deviceUID_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreAppDataAttributesUnder:containerType:identifier:manifestUID:deviceUID:");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}