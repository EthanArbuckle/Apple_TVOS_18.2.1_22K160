uint64_t getBoolValue(uint64_t *a1, uint64_t *a2, char *a3)
{
  void *v6;
  uint64_t *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t v20[16];
  v6 = objc_autoreleasePoolPush();
  else {
    v7 = (uint64_t *)*a1;
  }
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
  v9 = (void *)CFPreferencesCopyAppValue(v8, @"com.apple.MobileBluetooth.debug");

  if ((!v9 || ![v9 count]) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "ERROR: Either Dictionary is empty or null",  v20,  2u);
  }

  v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    else {
      v11 = (uint64_t *)*a2;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v12]);

    v14 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    {
      v15 = v13;
      if (([v15 isEqualToString:@"TRUE"] & 1) != 0
        || ([v15 isEqualToString:@"YES"] & 1) != 0)
      {
        v16 = 1;
LABEL_16:
        *a3 = v16;

LABEL_20:
        v17 = 1LL;
LABEL_26:

        goto LABEL_27;
      }

      if (([v15 isEqualToString:@"FALSE"] & 1) != 0
        || ([v15 isEqualToString:@"NO"] & 1) != 0)
      {
        v16 = 0;
        goto LABEL_16;
      }
    }

    else
    {
      v18 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v13, v18) & 1) != 0)
      {
        *a3 = [v13 BOOLValue];
        goto LABEL_20;
      }
    }

    v17 = 0LL;
    goto LABEL_26;
  }

  v17 = 0LL;
LABEL_27:

  objc_autoreleasePoolPop(v6);
  return v17;
}

void sub_1000023EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t getIntValue(uint64_t *a1, uint64_t *a2, _DWORD *a3)
{
  v6 = objc_autoreleasePoolPush();
  else {
    v7 = (uint64_t *)*a1;
  }
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
  v9 = (void *)CFPreferencesCopyAppValue(v8, @"com.apple.MobileBluetooth.debug");

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    else {
      v11 = (uint64_t *)*a2;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:v12]);

    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char isKindOfClass = objc_opt_isKindOfClass(v13, v14);
    if ((isKindOfClass & 1) != 0) {
      *a3 = [v13 intValue];
    }
  }

  else
  {
    char isKindOfClass = 0;
  }

  objc_autoreleasePoolPop(v6);
  return isKindOfClass & 1;
}

void sub_100002544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002CDC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20, uint64_t a21, uint64_t a22, void *a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, void *__p,uint64_t a51,int a52,__int16 a53,char a54,char a55,void *a56,uint64_t a57,int a58,__int16 a59,char a60,char a61)
{
}

void sub_100002F4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_100002F60(id a1, DEAttachmentItem *a2, DEAttachmentItem *a3)
{
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DEAttachmentItem modificationDate](a3, "modificationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DEAttachmentItem modificationDate](v4, "modificationDate"));
  id v7 = [v5 compare:v6];

  return (int64_t)v7;
}

void sub_100002FCC(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void *sub_100002FF8(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_1000030A8();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void sub_1000030A8()
{
}

void sub_1000030BC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000310C(exception, a1);
}

void sub_1000030F8(_Unwind_Exception *a1)
{
}

std::logic_error *sub_10000310C(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
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

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}