BOOL Key::isModifier(Key *this)
{
  int v1;
  unsigned int v2;
  v1 = *((_DWORD *)this + 1);
  if (v1 == 65281 || v1 == 255)
  {
    if (*(_DWORD *)this == 3) {
      return 1LL;
    }
  }

  else if (v1 == 7)
  {
    v2 = *(_DWORD *)this;
    if (*(_DWORD *)this >= 0xE0u) {
      return v2 < 0xE8;
    }
    if (v2 == 57) {
      return 1LL;
    }
  }

  return 0LL;
}

uint64_t Key::modifierMask(Key *this)
{
  uint64_t result = Key::isModifier(this);
  if ((_DWORD)result)
  {
    int v3 = *((_DWORD *)this + 1);
    if (v3 == 65281 || v3 == 255)
    {
      return (*(_DWORD *)this == 3) << 9;
    }

    else if (v3 == 7 && (int v4 = *(_DWORD *)this - 224, v4 < 8))
    {
      return dword_1890C1780[v4];
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void sub_1890B8DB8(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_18C767EA8;
  qword_18C767EA8 = (uint64_t)v1;
}

void sub_1890B8EAC(_Unwind_Exception *a1)
{
}

void sub_1890B8F2C(_Unwind_Exception *a1)
{
}

IOHIDKeyboardFilter *IOHIDKeyboardFilterFactory(uint64_t a1, const void *a2)
{
  int v3 = (const __CFAllocator *)*MEMORY[0x189604DD0];
  CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes( (CFAllocatorRef)*MEMORY[0x189604DD0],  0x6Bu,  3u,  0x40u,  0xD3u,  0x57u,  0x98u,  0x40u,  0x64u,  0xAAu,  0x17u,  0x92u,  4u,  0xC7u,  0xB0u,  0x6Fu,  0xFDu);
  if (!CFEqual(a2, v4)) {
    return 0LL;
  }
  v5 = (IOHIDKeyboardFilter *)MEMORY[0x1895DEFD0](*MEMORY[0x189604DB0], 536LL, 0LL);
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes( v3,  0x55u,  0x12u,  0x66u,  0x8Eu,  0xFFu,  0x47u,  0x4Eu,  0x70u,  0xB3u,  0x3Eu,  0xE1u,  0xFFu,  0xFAu,  0xEFu,  1u,  0xA8u);
  IOHIDKeyboardFilter::IOHIDKeyboardFilter(v5, v6);
  return v5;
}

uint64_t IOHIDKeyboardFilter::AddRef(IOHIDKeyboardFilter *this, void *a2)
{
  uint64_t v2 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v2;
  return v2;
}

void *IOHIDKeyboardFilter::setEventCallback( void *result, void (*a2)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4), uint64_t a3, uint64_t a4)
{
  CFUUIDRef v4 = IOHIDKeyboardFilter::defaultEventCallback;
  if (a2) {
    CFUUIDRef v4 = a2;
  }
  result[4] = v4;
  result[5] = a3;
  result[6] = a4;
  return result;
}

{
  void (*v4)(uint64_t, uint64_t, uint64_t, uint64_t);
  CFUUIDRef v4 = IOHIDKeyboardFilter::defaultEventCallback;
  if (a2) {
    CFUUIDRef v4 = a2;
  }
  result[4] = v4;
  result[5] = a3;
  result[6] = a4;
  return result;
}

void IOHIDKeyboardFilter::IOHIDKeyboardFilter(IOHIDKeyboardFilter *this, CFTypeRef cf)
{
  unint64_t v23 = *MEMORY[0x1895F89C0];
  *(void *)this = &IOHIDKeyboardFilter::sIOHIDKeyboardFilterFtbl;
  *((void *)this + 1) = CFRetain(cf);
  *((void *)this + 3) = 0LL;
  *((void *)this + 4) = IOHIDKeyboardFilter::defaultEventCallback;
  *((void *)this + 9) = 0LL;
  *((void *)this + 8) = (char *)this + 72;
  *((void *)this + 12) = 0LL;
  *((void *)this + 11) = (char *)this + 96;
  *((void *)this + 15) = 0LL;
  *((void *)this + 14) = (char *)this + 120;
  *((void *)this + 18) = 0LL;
  *((void *)this + 22) = 0LL;
  *((void *)this + 23) = 0LL;
  *((void *)this + 20) = (char *)this + 168;
  *((void *)this + 21) = (char *)this + 176;
  *((void *)this + 26) = 0LL;
  *((void *)this + 29) = 0LL;
  *((void *)this + 32) = 0LL;
  *((void *)this + 44) = 0LL;
  *((_DWORD *)this + 90) = 0;
  *((void *)this + 35) = 0LL;
  *((void *)this + 36) = 0LL;
  *((void *)this + 37) = 0LL;
  *((void *)this + 38) = 0LL;
  *((void *)this + 50) = -4294967221LL;
  *((_OWORD *)this + 23) = 0u;
  *((_OWORD *)this + 24) = 0u;
  *((_DWORD *)this + 102) = 0;
  *((void *)this + 52) = 0LL;
  *((_DWORD *)this + 106) = 150;
  *((_DWORD *)this + 112) = 0;
  *((void *)this + 54) = 0LL;
  *((void *)this + 55) = 0LL;
  *((void *)this + 57) = *MEMORY[0x189608680];
  *((void *)this + 58) = 0LL;
  *((_DWORD *)this + 122) = 0;
  *((void *)this + 59) = 0LL;
  *((void *)this + 60) = 0LL;
  *((_OWORD *)this + 31) = 0u;
  *((_OWORD *)this + 32) = 0u;
  *((void *)this + 66) = 0LL;
  *((void *)this + 17) = (char *)this + 144;
  *((void *)this + 25) = 0LL;
  *((void *)this + 24) = (char *)this + 200;
  *((void *)this + 28) = 0LL;
  *((void *)this + 27) = (char *)this + 224;
  *((void *)this + 2) = 1LL;
  *((void *)this + 10) = 0LL;
  *((void *)this + 5) = 0LL;
  *((void *)this + 6) = 0LL;
  *((_BYTE *)this + 56) = 0;
  *((void *)this + 13) = 0LL;
  *((void *)this + 16) = 0LL;
  *((void *)this + 19) = 0LL;
  *((void *)this + 31) = 0LL;
  *((void *)this + 30) = (char *)this + 248;
  *((void *)this + 34) = 0LL;
  *((void *)this + 33) = (char *)this + 272;
  CFPlugInAddInstanceForFactory((CFUUIDRef)cf);
  memset_pattern16((char *)this + 312, &unk_1890C1940, 0x28uLL);
  unint64_t v7 = 0x70000004FLL;
  char v8 = 0;
  uint64_t v9 = 0x70000004DLL;
  char v10 = 0;
  uint64_t v11 = 0x700000050LL;
  char v12 = 0;
  uint64_t v13 = 0x70000004ALL;
  char v14 = 0;
  uint64_t v15 = 0x700000051LL;
  char v16 = 0;
  uint64_t v17 = 0x70000004ELL;
  char v18 = 0;
  uint64_t v19 = 0x700000052LL;
  char v20 = 0;
  uint64_t v21 = 0x70000004BLL;
  char v22 = 0;
  unsigned int v5 = 1;
  CFUUIDRef v6 = &v5;
  CFUUIDRef v4 = sub_1890BF650((uint64_t **)this + 24, &v5, (uint64_t)&std::piecewise_construct, &v6);
  sub_1890BF908(v4 + 5, &v7, &v23);
}

void sub_1890B9330( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_1890BF5C4(v17, *(void **)(v10 + 272));
  sub_1890BF5C4(v16, *(void **)(v10 + 248));
  sub_1890BF5C4(v15, *(void **)(v10 + 224));
  sub_1890BF604(v14, *(void **)(v10 + 200));
  sub_1890BF604(a10, *(void **)(v10 + 176));
  sub_1890BF5C4(v18, *(void **)(v10 + 144));
  sub_1890BF5C4(v13, *(void **)(v10 + 120));
  sub_1890BF5C4(v12, *(void **)(v10 + 96));
  sub_1890BF5C4(v11, *(void **)(v10 + 72));
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::defaultEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1890C0C70(a4, v5);
  }
}

void IOHIDKeyboardFilter::~IOHIDKeyboardFilter(IOHIDKeyboardFilter *this)
{
  sub_1890BF5C4((uint64_t)this + 264, *((void **)this + 34));
  sub_1890BF5C4((uint64_t)this + 240, *((void **)this + 31));
  sub_1890BF5C4((uint64_t)this + 216, *((void **)this + 28));
  sub_1890BF604((uint64_t)this + 192, *((void **)this + 25));
  sub_1890BF604((uint64_t)this + 168, *((void **)this + 22));
  sub_1890BF5C4((uint64_t)this + 136, *((void **)this + 18));
  sub_1890BF5C4((uint64_t)this + 112, *((void **)this + 15));
  sub_1890BF5C4((uint64_t)this + 88, *((void **)this + 12));
  sub_1890BF5C4((uint64_t)this + 64, *((void **)this + 9));
}

void sub_1890B9544(void *a1)
{
}

uint64_t IOHIDKeyboardFilter::QueryInterface(IOHIDKeyboardFilter *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0LL, a2);
  CFUUIDRef v6 = (const __CFAllocator *)*MEMORY[0x189604DD0];
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes( (CFAllocatorRef)*MEMORY[0x189604DD0],  5u,  5u,  0xD7u,  0x8Du,  0x4Fu,  0x4Eu,  0x4Cu,  0x41u,  0xA3u,  0xA6u,  0xC7u,  0xA7u,  0x7Bu,  0x41u,  0xBDu,  0xACu);
  if (CFEqual(v5, v7)
    || (CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes( v6,  0xC7u,  0x10u,  0x95u,  0x1Du,  0x18u,  0x40u,  0x45u,  0x6Eu,  0x82u,  0xE7u,  0xFCu,  0xA1u,  0xA0u,  0xFAu,  0x7Fu,  0xE4u),  CFEqual(v5, v8))
    || (CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(v6, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u), CFEqual(v5, v9)))
  {
    uint64_t v10 = 0LL;
    ++*((_DWORD *)this + 4);
  }

  else
  {
    this = 0LL;
    uint64_t v10 = 2147483652LL;
  }

  *a3 = this;
  CFRelease(v5);
  return v10;
}

uint64_t IOHIDKeyboardFilter::AddRef(IOHIDKeyboardFilter *this)
{
  uint64_t v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t IOHIDKeyboardFilter::Release(IOHIDKeyboardFilter *this)
{
  int v1 = *((_DWORD *)this + 4);
  uint64_t v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    IOHIDKeyboardFilter::~IOHIDKeyboardFilter(this);
    operator delete(v3);
  }

  return v2;
}

void IOHIDKeyboardFilter::setEjectKeyProperty(IOHIDKeyboardFilter *this, unsigned int a2)
{
  int v3 = (void *)IOHIDServiceCopyProperty();
  CFUUIDRef v4 = (void *)IOHIDServiceCopyProperty();
  CFUUIDRef v5 = (void *)IOHIDServiceCopyProperty();
  if ([v3 unsignedIntValue] != 1
    || [v4 unsignedIntValue] != 6
    || [v5 unsignedIntValue] != 1452)
  {
LABEL_9:
    uint64_t v6 = 0LL;
    goto LABEL_10;
  }

  uint64_t v6 = IOHIDServiceCopyProperty();
  if (!v6)
  {
    if (a2 - 195 < 7 || a2 < 0x1F || a2 - 40 <= 2) {
      IOHIDServiceSetProperty();
    }
    goto LABEL_9;
  }

LABEL_10:
  id v7 = (id)v6;
}

void sub_1890B980C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::setDoNotDisturbState(IOHIDKeyboardFilter *this)
{
  uint64_t v2 = (IOHIDKeyboardFilter *)*((void *)this + 17);
  if (v2 == (IOHIDKeyboardFilter *)((char *)this + 144))
  {
LABEL_9:
    uint64_t v6 = (const __CFBoolean *)IOHIDServiceCopyProperty();
    if (v6)
    {
      id v7 = v6;
      *((_DWORD *)this + 122) = CFBooleanGetValue(v6);
      CFRelease(v7);
    }
  }

  else
  {
    while (*((void *)v2 + 6) != 0x10000009BLL)
    {
      int v3 = (IOHIDKeyboardFilter *)*((void *)v2 + 1);
      if (v3)
      {
        do
        {
          CFUUIDRef v4 = v3;
          int v3 = *(IOHIDKeyboardFilter **)v3;
        }

        while (v3);
      }

      else
      {
        do
        {
          CFUUIDRef v4 = (IOHIDKeyboardFilter *)*((void *)v2 + 2);
          BOOL v5 = *(void *)v4 == (void)v2;
          uint64_t v2 = v4;
        }

        while (!v5);
      }

      uint64_t v2 = v4;
    }

    *((_DWORD *)this + 122) = 1;
  }
}

void IOHIDKeyboardFilter::open(IOHIDKeyboardFilter *this, __IOHIDService *a2)
{
  *((void *)this + 3) = a2;
  uint64_t v3 = IOHIDServiceCopyProperty();
  CFUUIDRef v4 = (void *)*((void *)this + 58);
  *((void *)this + 58) = v3;

  uint64_t v5 = IOHIDServiceCopyProperty();
  uint64_t v6 = (void *)*((void *)this + 59);
  *((void *)this + 59) = v5;

  int valuePtr = 0;
  id v7 = (const __CFNumber *)IOHIDServiceCopyProperty();
  if (!v7)
  {
    int valuePtr = IOHIDKeyboardFilter::getKeyboardID(this);
    CFNumberRef v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt32Type, &valuePtr);
    if (!v8) {
      goto LABEL_5;
    }
    id v7 = v8;
    IOHIDServiceSetProperty();
  }

  CFNumberGetValue(v7, kCFNumberSInt32Type, &valuePtr);
  CFRelease(v7);
LABEL_5:
  CFUUIDRef v9 = (const __CFNumber *)IOHIDServiceCopyProperty();
  if (v9)
  {
    uint64_t v10 = v9;
    CFTypeID v11 = CFGetTypeID(v9);
    if (v11 == CFNumberGetTypeID()) {
      CFNumberGetValue(v10, kCFNumberSInt32Type, (char *)this + 292);
    }
    CFRelease(v10);
  }

  uint64_t v12 = (const __CFString *)IOHIDServiceCopyProperty();
  if (v12)
  {
    uint64_t v13 = v12;
    CFTypeID v14 = CFGetTypeID(v12);
    if (v14 == CFStringGetTypeID())
    {
      IOHIDKeyboardFilter::createMapFromStringMap(v13, (uint64_t)&v74);
      uint64_t v15 = (char *)this + 144;
      sub_1890BF5C4((uint64_t)this + 136, *((void **)this + 18));
      uint64_t v16 = v75;
      *((void *)this + 17) = v74;
      *((void *)this + 18) = v16;
      uint64_t v17 = v76;
      *((void *)this + 19) = v76;
      if (v17)
      {
        v16[2] = v15;
        unint64_t v74 = (unint64_t)&v75;
        v75 = 0LL;
        uint64_t v76 = 0LL;
        uint64_t v16 = 0LL;
      }

      else
      {
        *((void *)this + 17) = v15;
      }

      sub_1890BF5C4((uint64_t)&v74, v16);
    }

    CFRelease(v13);
  }

  uint64_t v18 = (const __CFString *)IOHIDServiceCopyProperty();
  if (v18)
  {
    uint64_t v19 = v18;
    CFTypeID v20 = CFGetTypeID(v18);
    if (v20 == CFStringGetTypeID())
    {
      IOHIDKeyboardFilter::createMapFromStringMap(v19, (uint64_t)&v74);
      unsigned int v73 = 512;
      v78 = &v73;
      uint64_t v21 = sub_1890BF650((uint64_t **)this + 21, &v73, (uint64_t)&std::piecewise_construct, &v78);
      char v22 = v21 + 6;
      unint64_t v23 = v21 + 5;
      sub_1890BF5C4((uint64_t)(v21 + 5), v21[6]);
      v24 = v75;
      *(v22 - 1) = v74;
      *char v22 = v24;
      uint64_t v25 = v76;
      v22[1] = v76;
      if (v25)
      {
        v24[2] = v22;
        unint64_t v74 = (unint64_t)&v75;
        v75 = 0LL;
        uint64_t v76 = 0LL;
        v24 = 0LL;
      }

      else
      {
        *unint64_t v23 = v22;
      }

      sub_1890BF5C4((uint64_t)&v74, v24);
      LODWORD(v78) = 512;
      unint64_t v74 = (unint64_t)&v78;
      v26 = sub_1890BF650( (uint64_t **)this + 21,  (unsigned int *)&v78,  (uint64_t)&std::piecewise_construct,  (_DWORD **)&v74)[5];
      LODWORD(v78) = 512;
      unint64_t v74 = (unint64_t)&v78;
      if (v26 != (uint64_t *)(sub_1890BF650( (uint64_t **)this + 21,  (unsigned int *)&v78,  (uint64_t)&std::piecewise_construct,  (_DWORD **)&v74)
                            + 6))
      {
        do
        {
          v27 = (uint64_t *)v26[1];
          v28 = v26;
          if (v27)
          {
            do
            {
              v29 = (uint64_t **)v27;
              v27 = (uint64_t *)*v27;
            }

            while (v27);
          }

          else
          {
            do
            {
              v29 = (uint64_t **)v28[2];
              BOOL v30 = *v29 == v28;
              v28 = (uint64_t *)v29;
            }

            while (!v30);
          }

          if (*((_DWORD *)v26 + 9) == 7 && (*((_DWORD *)v26 + 8) - 79) <= 3)
          {
            LODWORD(v78) = 512;
            unint64_t v74 = (unint64_t)&v78;
            v32 = sub_1890BF650( (uint64_t **)this + 21,  (unsigned int *)&v78,  (uint64_t)&std::piecewise_construct,  (_DWORD **)&v74);
            sub_1890BFC7C(v32 + 5, v26);
            operator delete(v26);
          }

          LODWORD(v78) = 512;
          unint64_t v74 = (unint64_t)&v78;
          v26 = (uint64_t *)v29;
        }

        while (v29 != sub_1890BF650( (uint64_t **)this + 21,  (unsigned int *)&v78,  (uint64_t)&std::piecewise_construct,  (_DWORD **)&v74)
                     + 6);
      }
    }

    CFRelease(v19);
  }

  v33 = (const __CFString *)IOHIDServiceCopyProperty();
  if (v33)
  {
    v34 = v33;
    CFTypeID v35 = CFGetTypeID(v33);
    if (v35 == CFStringGetTypeID())
    {
      IOHIDKeyboardFilter::createMapFromStringMap(v34, (uint64_t)&v74);
      unsigned int v73 = 1;
      v78 = &v73;
      v36 = sub_1890BF650((uint64_t **)this + 24, &v73, (uint64_t)&std::piecewise_construct, &v78);
      v37 = v36 + 6;
      v38 = v36 + 5;
      sub_1890BF5C4((uint64_t)(v36 + 5), v36[6]);
      v39 = v75;
      *(v37 - 1) = v74;
      void *v37 = v39;
      uint64_t v40 = v76;
      v37[1] = v76;
      if (v40)
      {
        v39[2] = v37;
        unint64_t v74 = (unint64_t)&v75;
        v75 = 0LL;
        uint64_t v76 = 0LL;
        v39 = 0LL;
      }

      else
      {
        void *v38 = v37;
      }

      sub_1890BF5C4((uint64_t)&v74, v39);
    }

    CFRelease(v34);
  }

  v41 = (const __CFString *)IOHIDServiceCopyProperty();
  if (v41)
  {
    v42 = v41;
    CFTypeID v43 = CFGetTypeID(v41);
    if (v43 == CFStringGetTypeID())
    {
      IOHIDKeyboardFilter::createMapFromStringMap(v42, (uint64_t)&v74);
      v44 = (char *)this + 248;
      sub_1890BF5C4((uint64_t)this + 240, *((void **)this + 31));
      v45 = v75;
      *((void *)this + 30) = v74;
      *((void *)this + 31) = v45;
      uint64_t v46 = v76;
      *((void *)this + 32) = v76;
      if (v46)
      {
        v45[2] = v44;
        unint64_t v74 = (unint64_t)&v75;
        v75 = 0LL;
        uint64_t v76 = 0LL;
        v45 = 0LL;
      }

      else
      {
        *((void *)this + 30) = v44;
      }

      sub_1890BF5C4((uint64_t)&v74, v45);
    }

    CFRelease(v42);
  }

  IOHIDKeyboardFilter::setDoNotDisturbState(this);
  v47 = (const __CFBoolean *)IOHIDPreferencesCopyDomain();
  if (v47)
  {
    v48 = v47;
    v49 = (int *)((char *)this + 452);
    *((_DWORD *)this + 113) = CFBooleanGetValue(v47);
    CFRelease(v48);
  }

  else
  {
    v49 = (int *)((char *)this + 452);
    *((_DWORD *)this + 113) = 1;
  }

  v50 = (const __CFBoolean *)IOHIDServiceCopyProperty();
  v51 = v50;
  if (*((_DWORD *)this + 113))
  {
    if (v50) {
      int Value = CFBooleanGetValue(v50);
    }
    else {
      int Value = 1;
    }
    int *v49 = Value;
  }

  if (v51) {
    CFRelease(v51);
  }
  v53 = (const __CFDictionary *)IOHIDServiceCopyProperty();
  if (v53)
  {
    v54 = v53;
    v55 = (const __CFBoolean *)CFDictionaryGetValue(v53, @"HIDCapsLockStateCache");
    if (v55) {
      LODWORD(v55) = CFBooleanGetValue(v55);
    }
    *((_DWORD *)this + 110) = (_DWORD)v55;
    *((_DWORD *)this + 111) = (_DWORD)v55;
    v56 = (const __CFBoolean *)CFDictionaryGetValue(v54, @"HIDCapsLockLEDInhibit");
    if (v56) {
      LODWORD(v56) = CFBooleanGetValue(v56);
    }
    v57 = (void *)MEMORY[0x189608680];
    *((_DWORD *)this + 112) = (_DWORD)v56;
    *((void *)this + 57) = *v57;
    v58 = CFDictionaryGetValue(v54, (const void *)*MEMORY[0x189608678]);
    if (v58)
    {
      v59 = v58;
      uint64_t v60 = *MEMORY[0x189608698];
      if (CFEqual(v58, (CFTypeRef)*MEMORY[0x189608698])
        || (uint64_t v60 = *MEMORY[0x189608690], CFEqual(v59, (CFTypeRef)*MEMORY[0x189608690]))
        || (uint64_t v60 = *MEMORY[0x189608688], CFEqual(v59, (CFTypeRef)*MEMORY[0x189608688])))
      {
        *((void *)this + 57) = v60;
      }
    }

    v61 = (const __CFArray *)CFDictionaryGetValue(v54, @"HIDKeyboardModifierMappingPairs");
    if (v61)
    {
      v62 = v61;
      CFTypeID v63 = CFGetTypeID(v61);
      if (v63 == CFArrayGetTypeID())
      {
        IOHIDKeyboardFilter::createMapFromArrayOfPairs(v62, (uint64_t)&v74);
        v64 = (char *)this + 120;
        sub_1890BF5C4((uint64_t)this + 112, *((void **)this + 15));
        v65 = v75;
        *((void *)this + 14) = v74;
        *((void *)this + 15) = v65;
        uint64_t v66 = v76;
        *((void *)this + 16) = v76;
        if (v66)
        {
          v65[2] = v64;
          unint64_t v74 = (unint64_t)&v75;
          v75 = 0LL;
          uint64_t v76 = 0LL;
          v65 = 0LL;
        }

        else
        {
          *((void *)this + 14) = v64;
        }

        sub_1890BF5C4((uint64_t)&v74, v65);
      }
    }

    v67 = (const __CFNumber *)CFDictionaryGetValue(v54, @"HIDSlowKeysDelay");
    if (v67) {
      CFNumberGetValue(v67, kCFNumberSInt32Type, (char *)this + 304);
    }
    v68 = (const __CFNumber *)CFDictionaryGetValue(v54, @"HIDInitialKeyRepeat");
    if (v68)
    {
      unint64_t v74 = 0LL;
      CFNumberGetValue(v68, kCFNumberSInt64Type, &v74);
      *((void *)this + 47) = v74 / 0xF4240;
    }

    v69 = (const __CFNumber *)CFDictionaryGetValue(v54, @"HIDKeyRepeat");
    if (v69)
    {
      unint64_t v74 = 0LL;
      CFNumberGetValue(v69, kCFNumberSInt64Type, &v74);
      *((void *)this + 48) = v74 / 0xF4240;
    }

    v70 = (const __CFNumber *)CFDictionaryGetValue(v54, @"CapsLockDelay");
    if (v70) {
      CFNumberGetValue(v70, kCFNumberSInt32Type, (char *)this + 400);
    }
    v71 = (const __CFNumber *)CFDictionaryGetValue(v54, @"CapsLockDelayOverride");
    if (v71) {
      CFNumberGetValue(v71, kCFNumberSInt32Type, (char *)this + 404);
    }
    v72 = (const __CFNumber *)CFDictionaryGetValue(v54, @"LockKeyDelay");
    if (v72) {
      CFNumberGetValue(v72, kCFNumberSInt32Type, (char *)this + 424);
    }
    CFRelease(v54);
  }

void sub_1890BA08C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, void *a11)
{
}

uint64_t IOHIDKeyboardFilter::getKeyboardID(IOHIDKeyboardFilter *this)
{
  unsigned int valuePtr = 3;
  int v1 = (const __CFNumber *)IOHIDServiceCopyProperty();
  if (v1 && (v2 = v1, CFTypeID v3 = CFGetTypeID(v1), v3 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v2, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    return valuePtr;
  }

  else
  {
    unsigned __int16 v13 = -1;
    unsigned __int16 v12 = -1;
    uint64_t v5 = (const __CFNumber *)IOHIDServiceCopyProperty();
    if (v5)
    {
      uint64_t v6 = v5;
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberSInt16Type, &v13);
        CFRelease(v6);
      }
    }

    TypeID = (const __CFNumber *)IOHIDServiceCopyProperty();
    if (TypeID
      && (CFUUIDRef v9 = TypeID,
          CFTypeID v10 = CFGetTypeID(TypeID),
          TypeID = (const __CFNumber *)CFNumberGetTypeID(),
          (const __CFNumber *)v10 == TypeID))
    {
      CFNumberGetValue(v9, kCFNumberSInt16Type, &v12);
      CFRelease(v9);
      int v11 = v12;
    }

    else
    {
      int v11 = 0xFFFF;
    }

    return IOHIDKeyboardFilter::getKeyboardID(TypeID, v13, v11);
  }

void IOHIDKeyboardFilter::createMapFromStringMap(CFStringRef theString@<X1>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 8) = 0LL;
  *(void *)a2 = a2 + 8;
  if (theString)
  {
    CStringPtr = (char *)CFStringGetCStringPtr(theString, 0);
    if (CStringPtr)
    {
      *(void *)&__int128 v5 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v22[8] = v5;
      v22[9] = v5;
      v22[6] = v5;
      v22[7] = v5;
      v22[4] = v5;
      v22[5] = v5;
      v22[2] = v5;
      v22[3] = v5;
      v22[0] = v5;
      v22[1] = v5;
      *(_OWORD *)CFTypeID v20 = v5;
      __int128 v21 = v5;
      __int128 v18 = v5;
      __int128 v19 = v5;
      __int128 v16 = v5;
      __int128 v17 = v5;
      __int128 v15 = v5;
      sub_1890BF48C(&__p, CStringPtr);
      sub_1890BDBE0(&v15, &__p, 8);
      memset(&v14, 0, sizeof(v14));
      memset(&__str, 0, sizeof(__str));
      while (1)
      {
        uint64_t v6 = sub_1890BDCC4(&v15, &v14, 0x2Cu);
        if ((*((_BYTE *)v6 + *(void *)(*v6 - 24LL) + 32) & 5) != 0) {
          break;
        }
        CFTypeID v7 = sub_1890BDCC4(&v15, &__str, 0x2Cu);
        if ((*((_BYTE *)v7 + *(void *)(*v7 - 24LL) + 32) & 5) != 0) {
          break;
        }
        unint64_t v8 = std::stoul(&__str, 0LL, 0);
        if (v8)
        {
          unint64_t v9 = std::stoul(&v14, 0LL, 0);
          LODWORD(__p.__r_.__value_.__l.__data_) = (unsigned __int16)v9;
          HIDWORD(__p.__r_.__value_.__r.__words[0]) = v9 >> 16;
          __p.__r_.__value_.__s.__data_[8] = 0;
          *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[1] + 1) = -1431655766;
          HIDWORD(__p.__r_.__value_.__r.__words[1]) = -1431655766;
          LODWORD(__p.__r_.__value_.__r.__words[2]) = (unsigned __int16)v8;
          HIDWORD(__p.__r_.__value_.__r.__words[2]) = v8 >> 16;
          char v11 = 0;
          memset(v12, 170, sizeof(v12));
          sub_1890BFB5C((uint64_t **)a2, (unint64_t *)&__p, &__p);
        }
      }

      *(void *)&__int128 v15 = *MEMORY[0x189614730];
      *(void *)((char *)&v15 + *(void *)(v15 - 24)) = *(void *)(MEMORY[0x189614730] + 24LL);
      *(void *)&__int128 v16 = MEMORY[0x189614750] + 16LL;
      if (SBYTE7(v21) < 0) {
        operator delete(v20[0]);
      }
      std::streambuf::~streambuf();
      std::istream::~istream();
      MEMORY[0x1895DF300]((char *)v22 + 8);
    }
  }

void sub_1890BA3E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, void *a22, uint64_t a23, int a24, __int16 a25, char a26, char a27, char a28)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  sub_1890BF5C4(v28, *(void **)(v28 + 8));
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::createMapFromArrayOfPairs(CFArrayRef theArray@<X1>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 16) = 0LL;
  *(void *)(a2 + 8) = 0LL;
  *(void *)a2 = a2 + 8;
  if (theArray && CFArrayGetCount(theArray))
  {
    for (CFIndex i = 0LL; i < CFArrayGetCount(theArray); ++i)
    {
      uint64_t v14 = 0LL;
      uint64_t valuePtr = 0LL;
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, i);
      CFTypeID v7 = ValueAtIndex;
      if (ValueAtIndex)
      {
        CFTypeID v8 = CFGetTypeID(ValueAtIndex);
        if (v8 == CFDictionaryGetTypeID())
        {
          int Value = (const __CFNumber *)CFDictionaryGetValue(v7, @"HIDKeyboardModifierMappingSrc");
          if (Value)
          {
            CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
            CFTypeID v10 = (const __CFNumber *)CFDictionaryGetValue(v7, @"HIDKeyboardModifierMappingDst");
            if (v10)
            {
              CFNumberGetValue(v10, kCFNumberSInt64Type, &v14);
              *(void *)&__int128 v11 = valuePtr;
              BYTE8(v11) = 0;
              uint64_t v12 = v14;
              char v13 = 0;
              sub_1890BFB5C((uint64_t **)a2, (unint64_t *)&v11, &v11);
            }
          }
        }
      }
    }
  }

void sub_1890BA56C(_Unwind_Exception *a1)
{
}

void IOHIDKeyboardFilter::scheduleWithDispatchQueue(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  objc_storeStrong((id *)(a1 + 496), a2);
  __int128 v5 = -[StickyKeyHandler initWithFilter:service:]( objc_alloc(&OBJC_CLASS___StickyKeyHandler),  "initWithFilter:service:",  a1,  *(void *)(a1 + 24));
  uint64_t v6 = *(void **)(a1 + 480);
  *(void *)(a1 + 480) = v5;

  dispatch_source_t v7 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, *(dispatch_queue_t *)(a1 + 496));
  CFTypeID v8 = *(void **)(a1 + 504);
  *(void *)(a1 + 504) = v7;

  unint64_t v9 = *(dispatch_source_s **)(a1 + 504);
  uint64_t v10 = MEMORY[0x1895F87A8];
  if (v9)
  {
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = sub_1890BA990;
    handler[3] = &unk_18A3441C8;
    handler[4] = a1;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 504), 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
    dispatch_resume(*(dispatch_object_t *)(a1 + 504));
  }

  dispatch_source_t v11 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, *(dispatch_queue_t *)(a1 + 496));
  uint64_t v12 = *(void **)(a1 + 512);
  *(void *)(a1 + 512) = v11;

  char v13 = *(dispatch_source_s **)(a1 + 512);
  if (v13)
  {
    v31[0] = v10;
    v31[1] = 3221225472LL;
    v31[2] = sub_1890BA9C4;
    v31[3] = &unk_18A3441C8;
    v31[4] = a1;
    dispatch_source_set_event_handler(v13, v31);
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 512), 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
    dispatch_resume(*(dispatch_object_t *)(a1 + 512));
  }

  dispatch_source_t v14 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, *(dispatch_queue_t *)(a1 + 496));
  __int128 v15 = *(void **)(a1 + 520);
  *(void *)(a1 + 520) = v14;

  __int128 v16 = *(dispatch_source_s **)(a1 + 520);
  if (v16)
  {
    v30[0] = v10;
    v30[1] = 3221225472LL;
    v30[2] = sub_1890BAA6C;
    v30[3] = &unk_18A3441C8;
    v30[4] = a1;
    dispatch_source_set_event_handler(v16, v30);
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 520), 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
    dispatch_resume(*(dispatch_object_t *)(a1 + 520));
  }

  dispatch_source_t v17 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, *(dispatch_queue_t *)(a1 + 496));
  __int128 v18 = *(void **)(a1 + 528);
  *(void *)(a1 + 528) = v17;

  __int128 v19 = *(dispatch_source_s **)(a1 + 528);
  if (v19)
  {
    v29[0] = v10;
    v29[1] = 3221225472LL;
    v29[2] = sub_1890BAB00;
    v29[3] = &unk_18A3441C8;
    v29[4] = a1;
    dispatch_source_set_event_handler(v19, v29);
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 528), 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
    dispatch_resume(*(dispatch_object_t *)(a1 + 528));
  }

  dispatch_source_t v20 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, *(dispatch_queue_t *)(a1 + 496));
  __int128 v21 = *(void **)(a1 + 432);
  *(void *)(a1 + 432) = v20;

  char v22 = *(dispatch_source_s **)(a1 + 432);
  if (v22)
  {
    v28[0] = v10;
    v28[1] = 3221225472LL;
    v28[2] = sub_1890BAB80;
    v28[3] = &unk_18A3441C8;
    v28[4] = a1;
    dispatch_source_set_event_handler(v22, v28);
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 432), 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
    dispatch_resume(*(dispatch_object_t *)(a1 + 432));
  }

  if ([*(id *)(a1 + 464) BOOLValue])
  {
    +[AppleKeyboardStateManager sharedManager](&OBJC_CLASS___AppleKeyboardStateManager, "sharedManager");
    unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    int v24 = [v23 isCapsLockEnabled:*(void *)(a1 + 472)];

    if (v24)
    {
      _IOHIDLogCategory();
      uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t RegistryID = *(void *)(a1 + 24);
        if (RegistryID) {
          uint64_t RegistryID = IOHIDServiceGetRegistryID();
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = RegistryID;
        _os_log_impl(&dword_1890B7000, v25, OS_LOG_TYPE_INFO, "[%@] Restoring capslock state\n", buf, 0xCu);
      }

      mach_absolute_time();
      KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
      if (KeyboardEvent)
      {
        (*(void (**)(void, void, uint64_t, const void *, void))(a1 + 32))( *(void *)(a1 + 40),  *(void *)(a1 + 48),  a1,  KeyboardEvent,  0LL);
        CFRelease(KeyboardEvent);
      }
    }
  }
}

void sub_1890BA958(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1890BA990(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_source_set_timer(*(dispatch_source_t *)(v1 + 504), 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
  *(_DWORD *)(v1 + 308) = 0;
}

void sub_1890BA9C4(uint64_t a1)
{
  uint64_t v1 = *(dispatch_source_t **)(a1 + 32);
  dispatch_source_set_timer(v1[64], 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
  IOHIDKeyboardFilter::dispatchSlowKey((IOHIDKeyboardFilter *)v1);
}

void IOHIDKeyboardFilter::dispatchSlowKey(IOHIDKeyboardFilter *this)
{
  uint64_t v1 = (const void *)*((void *)this + 37);
  *((void *)this + 37) = 0LL;
  if (v1)
  {
    mach_absolute_time();
    IOHIDEventSetTimeStamp();
    IOHIDEventSetIntegerValue();
    (*((void (**)(void, void, IOHIDKeyboardFilter *, const void *, void))this + 4))( *((void *)this + 5),  *((void *)this + 6),  this,  v1,  0LL);
    CFRelease(v1);
  }

void sub_1890BAA6C(uint64_t a1)
{
  uint64_t v1 = *(dispatch_source_t **)(a1 + 32);
  dispatch_source_set_timer(v1[65], 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
  IOHIDKeyboardFilter::dispatchKeyRepeat((IOHIDKeyboardFilter *)v1);
}

void IOHIDKeyboardFilter::dispatchKeyRepeat(IOHIDKeyboardFilter *this)
{
  uint64_t v1 = (const void *)*((void *)this + 46);
  *((void *)this + 46) = 0LL;
  if (v1)
  {
    mach_absolute_time();
    IOHIDEventSetTimeStamp();
    (*((void (**)(void, void, IOHIDKeyboardFilter *, const void *, void))this + 4))( *((void *)this + 5),  *((void *)this + 6),  this,  v1,  0LL);
    CFRelease(v1);
  }

void sub_1890BAB00(uint64_t a1)
{
  uint64_t v1 = *(dispatch_source_t **)(a1 + 32);
  dispatch_source_set_timer(v1[66], 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
  IOHIDKeyboardFilter::dispatchCapsLock((IOHIDKeyboardFilter *)v1);
}

void IOHIDKeyboardFilter::dispatchCapsLock(IOHIDKeyboardFilter *this)
{
  uint64_t v1 = (const void *)*((void *)this + 49);
  *((void *)this + 49) = 0LL;
  if (v1)
  {
    (*((void (**)(void, void, IOHIDKeyboardFilter *, const void *, void))this + 4))( *((void *)this + 5),  *((void *)this + 6),  this,  v1,  0LL);
    CFRelease(v1);
  }

void sub_1890BAB80(uint64_t a1)
{
  uint64_t v1 = *(dispatch_source_t **)(a1 + 32);
  dispatch_source_set_timer(v1[54], 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
  IOHIDKeyboardFilter::dispatchLockKey((IOHIDKeyboardFilter *)v1);
}

void IOHIDKeyboardFilter::dispatchLockKey(IOHIDKeyboardFilter *this)
{
  uint64_t v1 = (const void *)*((void *)this + 52);
  *((void *)this + 52) = 0LL;
  if (v1)
  {
    (*((void (**)(void, void, IOHIDKeyboardFilter *, const void *, void))this + 4))( *((void *)this + 5),  *((void *)this + 6),  this,  v1,  0LL);
    CFRelease(v1);
  }

void IOHIDKeyboardFilter::unscheduleFromDispatchQueue(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(dispatch_source_s **)(a1 + 504);
  if (v4) {
    dispatch_source_cancel(v4);
  }
  __int128 v5 = *(dispatch_source_s **)(a1 + 512);
  if (v5) {
    dispatch_source_cancel(v5);
  }
  uint64_t v6 = *(dispatch_source_s **)(a1 + 520);
  if (v6) {
    dispatch_source_cancel(v6);
  }
  dispatch_source_t v7 = *(dispatch_source_s **)(a1 + 528);
  if (v7) {
    dispatch_source_cancel(v7);
  }
  CFTypeID v8 = *(dispatch_source_s **)(a1 + 432);
  if (v8) {
    dispatch_source_cancel(v8);
  }
  [*(id *)(a1 + 480) removeObserver];
  v11[0] = 0LL;
  v11[1] = v11;
  v11[2] = 0x2020000000LL;
  CFTypeRef v12 = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  CFTypeRef v12 = CFRetain(*(CFTypeRef *)(a1 + 24));
  unint64_t v9 = *(dispatch_queue_s **)(a1 + 496);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = sub_1890BAD00;
  v10[3] = &unk_18A3441F0;
  v10[4] = v11;
  v10[5] = a1;
  dispatch_async(v9, v10);
  _Block_object_dispose(v11, 8);
}

void sub_1890BACEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1890BAD00(uint64_t a1)
{
  uint64_t v2 = *(IOHIDKeyboardFilter **)(a1 + 40);
  IOHIDKeyboardFilter::dispatchStickyKeys(v2, 14);
  id v3 = (const void *)*((void *)v2 + 37);
  if (v3)
  {
    CFRelease(v3);
    *((void *)v2 + 37) = 0LL;
  }

  id v4 = (const void *)*((void *)v2 + 49);
  if (v4)
  {
    CFRelease(v4);
    *((void *)v2 + 49) = 0LL;
  }

  __int128 v5 = (const void *)*((void *)v2 + 52);
  if (v5)
  {
    CFRelease(v5);
    *((void *)v2 + 52) = 0LL;
  }

  CFRelease(*(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
}

void IOHIDKeyboardFilter::stopStickyKey(IOHIDKeyboardFilter *this)
{
}

CFTypeRef IOHIDKeyboardFilter::copyPropertyForClient( IOHIDKeyboardFilter *this, CFTypeRef cf1, const void *a3)
{
  if (CFEqual(cf1, @"HIDCapsLockState"))
  {
    uint64_t v5 = MEMORY[0x189604DE8];
    int v6 = *((_DWORD *)this + 110);
  }

  else
  {
    if (CFEqual(cf1, @"ServiceFilterDebug"))
    {
      unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
      CFTypeRef cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
      sub_1890BF1C8(&v10, 0);
      if (cf)
      {
        IOHIDKeyboardFilter::serialize(this, (__CFDictionary *)cf);
        CFTypeRef v8 = CFRetain(cf);
      }

      else
      {
        CFTypeRef v8 = 0LL;
      }

      sub_1890BF270(&v10);
      return v8;
    }

    if (CFEqual(cf1, (CFTypeRef)*MEMORY[0x189608678]))
    {
      uint64_t v5 = MEMORY[0x189608698];
      int v6 = *((_DWORD *)this + 111);
      uint64_t v7 = MEMORY[0x189608690];
      goto LABEL_4;
    }

    if (CFEqual(cf1, @"HIDStickyKeysOn"))
    {
      sub_1890C0070(&v10, *((_DWORD *)this + 89));
      CFTypeRef v8 = cf;
      sub_1890BF2B0(&v10);
      return v8;
    }

    if (CFEqual(cf1, @"UnifiedKeyMapping"))
    {
      uint64_t v5 = MEMORY[0x189604DE8];
      int v6 = *((unsigned __int8 *)this + 56);
    }

    else
    {
      if (!CFEqual(cf1, @"HIDKeyboardSupportsDoNotDisturbKey")) {
        return 0LL;
      }
      uint64_t v5 = MEMORY[0x189604DE8];
      int v6 = *((_DWORD *)this + 122);
    }
  }

  uint64_t v7 = MEMORY[0x189604DE0];
LABEL_4:
  if (!v6) {
    uint64_t v5 = v7;
  }
  return *(CFTypeRef *)v5;
}

void sub_1890BAEF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *IOHIDKeyboardFilter::serialize(IOHIDKeyboardFilter *this, __CFDictionary *a2)
{
  uint64_t v7 = (void *)0xAAAAAAAAAAAAAAAALL;
  CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_1890BF40C(&v7, a2, 0);
  uint64_t v7 = &unk_18A344240;
  CFDictionarySetValue(theDict, @"Class", @"IOHIDKeyboardFilter");
  IOHIDKeyboardFilter::serializeMapper((uint64_t)this + 136, (uint64_t)&v5);
  if (value) {
    CFDictionarySetValue(theDict, @"FnFunctionUsageMap", value);
  }
  sub_1890BF3CC(&v5);
  id v3 = (const void **)MEMORY[0x189604DE8];
  if (!*((_BYTE *)this + 56)) {
    id v3 = (const void **)MEMORY[0x189604DE0];
  }
  if (*v3) {
    CFDictionarySetValue(theDict, @"UnifiedKeyMapping", *v3);
  }
  IOHIDKeyboardFilter::serializeModifierMappings((uint64_t)this + 192, (uint64_t)&v5);
  if (value) {
    CFDictionarySetValue(theDict, @"UnifiedKeyMaps", value);
  }
  sub_1890BF3CC(&v5);
  IOHIDKeyboardFilter::serializeModifierMappings((uint64_t)this + 168, (uint64_t)&v5);
  if (value) {
    CFDictionarySetValue(theDict, @"LegacyKeyMaps", value);
  }
  sub_1890BF3CC(&v5);
  IOHIDKeyboardFilter::serializeMapper((uint64_t)this + 112, (uint64_t)&v5);
  if (value) {
    CFDictionarySetValue(theDict, @"HIDKeyboardModifierMappingPairs", value);
  }
  sub_1890BF3CC(&v5);
  IOHIDKeyboardFilter::serializeMapper((uint64_t)this + 240, (uint64_t)&v5);
  if (value) {
    CFDictionarySetValue(theDict, @"NumLockKeyboardUsageMap", value);
  }
  sub_1890BF3CC(&v5);
  IOHIDKeyboardFilter::serializeMapper((uint64_t)this + 264, (uint64_t)&v5);
  if (value) {
    CFDictionarySetValue(theDict, @"UserKeyMapping", value);
  }
  sub_1890BF3CC(&v5);
  sub_1890BEDF4((uint64_t)&v7, @"HIDInitialKeyRepeat", *((void *)this + 47));
  sub_1890BEDF4((uint64_t)&v7, @"HIDKeyRepeat", *((void *)this + 48));
  sub_1890BEDF4((uint64_t)&v7, @"LockKeyDelay", *((unsigned int *)this + 106));
  sub_1890BEDF4((uint64_t)&v7, @"CapsLockState", *((int *)this + 110));
  sub_1890BEDF4((uint64_t)&v7, @"CapsLockLEDState", *((int *)this + 111));
  sub_1890BEDF4((uint64_t)&v7, @"MatchScore", *((int *)this + 5));
  sub_1890BEDF4((uint64_t)&v7, @"FnKeyMode", *((unsigned int *)this + 72));
  return sub_1890BF270(&v7);
}

void sub_1890BB158( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
}

uint64_t IOHIDKeyboardFilter::hasTCCPermissions()
{
  return IOHIDAccessCheckAuditToken();
}

uint64_t IOHIDKeyboardFilter::allowRemapping(IOHIDKeyboardFilter *this, const void *a2, const void *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (!a3) {
    return 1LL;
  }
  *(void *)&__int128 v3 = -1LL;
  *((void *)&v3 + 1) = -1LL;
  v7[0] = v3;
  v7[1] = v3;
  IOHIDEventSystemConnectionGetAuditToken();
  if ((IOHIDAccessCheckAuditToken() & 1) != 0) {
    return 1LL;
  }
  _IOHIDLogCategory();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t UUID = IOHIDEventSystemConnectionGetUUID();
    sub_1890C0CE4(UUID, (uint64_t)v7);
  }

  return 0LL;
}

void sub_1890BB2D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::setPropertyForClient( IOHIDKeyboardFilter *this, const __CFString *a2, const __CFBoolean *a3, const __CFString *a4)
{
  uint64_t v74 = *MEMORY[0x1895F89C0];
  if (a3) {
    id v4 = a3;
  }
  else {
    id v4 = (const __CFBoolean *)*MEMORY[0x189604DE0];
  }
  if (!a2) {
    return;
  }
  int v6 = a3;
  int v9 = *((_DWORD *)this + 89);
  int v10 = *((_DWORD *)this + 90);
  _IOHIDLogCategory();
  dispatch_source_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t RegistryID = *((void *)this + 3);
    if (RegistryID) {
      uint64_t RegistryID = IOHIDServiceGetRegistryID();
    }
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = RegistryID;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = a2;
    *(_WORD *)&buf[22] = 2112;
    v71 = v6;
    __int16 v72 = 2112;
    unsigned int v73 = a4;
    _os_log_debug_impl( &dword_1890B7000,  v11,  OS_LOG_TYPE_DEBUG,  "[%@] IOHIDKeyboardFilter::setPropertyForClient: %@  %@  %@\n",  buf,  0x2Au);
  }

  CFTypeRef v12 = (_DWORD *)((char *)this + 360);
  if (CFStringCompare(a2, @"HIDStickyKeysDisabled", 0LL) == kCFCompareEqualTo)
  {
    if (v6) {
      int v10 = CFBooleanGetValue(v6) != 0;
    }
    else {
      int v10 = 0;
    }
    _IOHIDLogCategory();
    dispatch_source_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      if (*((void *)this + 3)) {
        IOHIDServiceGetRegistryID();
      }
      sub_1890C0D5C();
    }

    goto LABEL_57;
  }

  if (CFStringCompare(a2, @"HIDStickyKeysOn", 0LL) == kCFCompareEqualTo)
  {
    if (v6) {
      int v9 = CFBooleanGetValue(v6) != 0;
    }
    else {
      int v9 = 0;
    }
    goto LABEL_58;
  }

  if (CFStringCompare(a2, @"HIDStickyKeysShiftToggles", 0LL) == kCFCompareEqualTo)
  {
    if (v6) {
      BOOL v16 = CFBooleanGetValue(v6) != 0;
    }
    else {
      BOOL v16 = 0;
    }
    *((_DWORD *)this + 88) = v16;
    *((_DWORD *)this + 77) = 0;
    _IOHIDLogCategory();
    dispatch_source_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      if (*((void *)this + 3)) {
        IOHIDServiceGetRegistryID();
      }
      sub_1890C0D90();
    }

    goto LABEL_57;
  }

  if (CFStringCompare(a2, @"HIDInitialKeyRepeat", 0LL) == kCFCompareEqualTo)
  {
    if (!v6) {
      goto LABEL_58;
    }
    valuePtr[0] = 0LL;
    CFNumberGetValue(v6, kCFNumberSInt64Type, valuePtr);
    *((void *)this + 47) = (unint64_t)valuePtr[0] / 0xF4240;
    _IOHIDLogCategory();
    dispatch_source_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = *((void *)this + 3);
      if (v18) {
        uint64_t v18 = IOHIDServiceGetRegistryID();
      }
      sub_1890C0DC4(v18, (uint64_t)this + 376, (uint64_t)buf);
    }

    goto LABEL_41;
  }

  if (CFStringCompare(a2, @"HIDKeyRepeat", 0LL) == kCFCompareEqualTo)
  {
    if (!v6) {
      goto LABEL_58;
    }
    valuePtr[0] = 0LL;
    CFNumberGetValue(v6, kCFNumberSInt64Type, valuePtr);
    *((void *)this + 48) = (unint64_t)valuePtr[0] / 0xF4240;
    _IOHIDLogCategory();
    dispatch_source_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = *((void *)this + 3);
      if (v20) {
        uint64_t v20 = IOHIDServiceGetRegistryID();
      }
      sub_1890C0E00(v20, (uint64_t)this + 384, (uint64_t)buf);
    }

LABEL_41:
    goto LABEL_58;
  }

  if (CFStringCompare(a2, @"HIDCapsLockState", 0LL) == kCFCompareEqualTo)
  {
    if (v6)
    {
      CFTypeID TypeID = CFBooleanGetTypeID();
      LODWORD(v6) = TypeID == CFGetTypeID(v6) && CFBooleanGetValue(v6) != 0;
    }

    if (a4) {
      v29 = a4;
    }
    else {
      v29 = @"HIDCapsLockState";
    }
    IOHIDKeyboardFilter::setCapsLockState(this, (int)v6, v29);
    _IOHIDLogCategory();
    BOOL v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v31 = *((void *)this + 3);
      if (v31) {
        uint64_t v31 = IOHIDServiceGetRegistryID();
      }
      sub_1890C0E3C(v31, (uint64_t)buf, (int)v6);
    }

    goto LABEL_58;
  }

  if (CFEqual(a2, (CFTypeRef)*MEMORY[0x189608678]))
  {
    if (v6)
    {
      *((void *)this + 57) = *MEMORY[0x189608680];
      uint64_t v13 = *MEMORY[0x189608698];
      if (CFEqual(v6, (CFTypeRef)*MEMORY[0x189608698])
        || (uint64_t v13 = *MEMORY[0x189608690], CFEqual(v6, (CFTypeRef)*MEMORY[0x189608690]))
        || (uint64_t v13 = *MEMORY[0x189608688], CFEqual(v6, (CFTypeRef)*MEMORY[0x189608688])))
      {
        *((void *)this + 57) = v13;
      }

      IOHIDKeyboardFilter::updateCapslockLED(this, a4);
    }

    _IOHIDLogCategory();
    dispatch_source_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = *((void *)this + 3);
      if (v15) {
        uint64_t v15 = IOHIDServiceGetRegistryID();
      }
      sub_1890C107C(v15, (uint64_t)this, (uint64_t)buf, v14);
    }

LABEL_57:
    goto LABEL_58;
  }

  if (CFStringCompare(a2, @"HIDCapsLockLEDInhibit", 0LL) == kCFCompareEqualTo)
  {
    *((_DWORD *)this + 112) = CFBooleanGetValue(v4);
    IOHIDKeyboardFilter::updateCapslockLED(this, a4);
    _IOHIDLogCategory();
    dispatch_source_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      if (*((void *)this + 3)) {
        IOHIDServiceGetRegistryID();
      }
      sub_1890C0E74();
    }

    goto LABEL_57;
  }

  if (CFStringCompare(a2, @"HIDCapsLockLEDDarkWakeInhibit", 0LL) == kCFCompareEqualTo)
  {
    *((_DWORD *)this + 113) = CFBooleanGetValue(v4);
    _IOHIDLogCategory();
    dispatch_source_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      if (*((void *)this + 3)) {
        IOHIDServiceGetRegistryID();
      }
      sub_1890C0EA8();
    }

    goto LABEL_57;
  }

  if (CFStringCompare(a2, @"HIDKeyboardModifierMappingPairs", 0LL) == kCFCompareEqualTo)
  {
    if (!v6) {
      goto LABEL_58;
    }
    CFTypeID v32 = CFGetTypeID(v6);
    v33 = (IOHIDKeyboardFilter *)CFArrayGetTypeID();
    if ((IOHIDKeyboardFilter *)v32 != v33) {
      goto LABEL_58;
    }
    memset(buf, 170, sizeof(buf));
    IOHIDKeyboardFilter::createMapFromArrayOfPairs(v6, (uint64_t)buf);
    IOHIDKeyboardFilter::resetModifiedKeyState(this);
    sub_1890C00F0(v67, (uint64_t)buf);
    IOHIDKeyboardFilter::resetModifiedKeyState((uint64_t)this, v67);
    sub_1890BF5C4((uint64_t)v67, (void *)v67[1]);
    uint64_t v34 = (void *)*((void *)this + 15);
    if (v34)
    {
      uint64_t v35 = (void *)((char *)this + 120);
      do
      {
        unint64_t v36 = v34[4];
        BOOL v37 = v36 >= 0x700000039LL;
        if (v36 >= 0x700000039LL) {
          v38 = v34;
        }
        else {
          v38 = v34 + 1;
        }
        if (v37) {
          uint64_t v35 = v34;
        }
        uint64_t v34 = (void *)*v38;
      }

      while (*v38);
      if (v35 != (void *)((char *)this + 120) && v35[4] < 0x70000003AuLL)
      {
        if (a4) {
          v39 = a4;
        }
        else {
          v39 = @"HIDKeyboardModifierMappingPairs";
        }
        IOHIDKeyboardFilter::setCapsLockState(this, 0, v39);
      }
    }

    _IOHIDLogCategory();
    uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v41 = *((void *)this + 3);
      if (v41) {
        uint64_t v41 = IOHIDServiceGetRegistryID();
      }
      sub_1890C0EDC(v41, (uint64_t)v69);
    }

    goto LABEL_151;
  }

  if (CFStringCompare(a2, @"HIDFKeyMode", 0LL) == kCFCompareEqualTo)
  {
    if (!v6) {
      goto LABEL_58;
    }
    CFTypeID v42 = CFGetTypeID(v6);
    if (v42 != CFNumberGetTypeID()) {
      goto LABEL_58;
    }
    CFNumberGetValue(v6, kCFNumberSInt32Type, (char *)this + 288);
    _IOHIDLogCategory();
    dispatch_source_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      if (*((void *)this + 3)) {
        IOHIDServiceGetRegistryID();
      }
      sub_1890C0F10();
    }

    goto LABEL_57;
  }

  if (CFStringCompare(a2, @"UserKeyMapping", 0LL) == kCFCompareEqualTo)
  {
    if (!v6) {
      goto LABEL_58;
    }
    CFTypeID v43 = CFGetTypeID(v6);
    v44 = (IOHIDKeyboardFilter *)CFArrayGetTypeID();
    if ((IOHIDKeyboardFilter *)v43 != v44) {
      goto LABEL_58;
    }
    memset(buf, 170, sizeof(buf));
    IOHIDKeyboardFilter::createMapFromArrayOfPairs(v6, (uint64_t)buf);
    IOHIDKeyboardFilter::resetModifiedKeyState(this);
    sub_1890C00F0(v66, (uint64_t)buf);
    IOHIDKeyboardFilter::resetModifiedKeyState((uint64_t)this, v66);
    sub_1890BF5C4((uint64_t)v66, (void *)v66[1]);
    _IOHIDLogCategory();
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v46 = *((void *)this + 3);
      if (v46) {
        uint64_t v46 = IOHIDServiceGetRegistryID();
      }
      sub_1890C0F44(v46, (uint64_t)v69);
    }

    goto LABEL_151;
  }

  if (CFStringCompare(a2, @"HIDSlowKeysDelay", 0LL))
  {
    if (CFStringCompare(a2, @"CapsLockDelay", 0LL))
    {
      if (CFStringCompare(a2, @"CapsLockDelayOverride", 0LL) == kCFCompareEqualTo)
      {
        if (v6)
        {
          CFTypeID v52 = CFGetTypeID(v6);
          if (v52 == CFNumberGetTypeID())
          {
            CFNumberGetValue(v6, kCFNumberSInt32Type, (char *)this + 404);
            _IOHIDLogCategory();
            v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              if (*((void *)this + 3)) {
                IOHIDServiceGetRegistryID();
              }
              sub_1890C0FE0();
            }

            if (*((_DWORD *)this + 100) == *((_DWORD *)this + 101)) {
              *((_DWORD *)this + 101) = -1;
            }
          }
        }

        goto LABEL_58;
      }

      int v25 = CFEqual(a2, @"LockKeyDelay");
      BOOL v26 = v6 == 0LL;
      if (!v25) {
        BOOL v26 = 1;
      }
      if (!v26)
      {
        CFNumberGetValue(v6, kCFNumberSInt32Type, (char *)this + 424);
        _IOHIDLogCategory();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          if (*((void *)this + 3)) {
            IOHIDServiceGetRegistryID();
          }
          sub_1890C1014();
        }

        if (!*((_DWORD *)this + 106))
        {
          uint64_t v28 = (const void *)*((void *)this + 52);
          if (v28)
          {
            CFRelease(v28);
            *((void *)this + 52) = 0LL;
          }
        }

        goto LABEL_58;
      }

      if (CFEqual(a2, @"UnifiedKeyMapping")) {
        BOOL v54 = v6 != 0LL;
      }
      else {
        BOOL v54 = 0;
      }
      if (v54) {
        goto LABEL_58;
      }
      int v55 = CFEqual(a2, @"CtrlKeyboardUsageMap");
      BOOL v56 = v6 == 0LL;
      if (!v55) {
        BOOL v56 = 1;
      }
      if (v56) {
        goto LABEL_58;
      }
      CFTypeID v57 = CFGetTypeID(v6);
      v58 = (IOHIDKeyboardFilter *)CFStringGetTypeID();
      if ((IOHIDKeyboardFilter *)v57 != v58) {
        goto LABEL_58;
      }
      memset(buf, 170, sizeof(buf));
      IOHIDKeyboardFilter::createMapFromStringMap((CFStringRef)v6, (uint64_t)buf);
      IOHIDKeyboardFilter::resetModifiedKeyState(this);
      sub_1890C00F0(v65, (uint64_t)buf);
      IOHIDKeyboardFilter::resetModifiedKeyState((uint64_t)this, v65);
      sub_1890BF5C4((uint64_t)v65, (void *)v65[1]);
      v69[0] = 1;
      valuePtr[0] = v69;
      v59 = sub_1890BF650((uint64_t **)this + 24, v69, (uint64_t)&std::piecewise_construct, valuePtr);
      sub_1890BFC14((uint64_t)(v59 + 5), buf);
      _IOHIDLogCategory();
      uint64_t v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v61 = *((void *)this + 3);
        if (v61) {
          uint64_t v61 = IOHIDServiceGetRegistryID();
        }
        sub_1890C1048(v61, (uint64_t)v69);
      }

LABEL_151:
      sub_1890BF5C4((uint64_t)buf, *(void **)&buf[8]);
      goto LABEL_58;
    }

    if (!v6) {
      goto LABEL_58;
    }
    CFTypeID v50 = CFGetTypeID(v6);
    if (v50 != CFNumberGetTypeID()) {
      goto LABEL_58;
    }
    CFNumberGetValue(v6, kCFNumberSInt32Type, (char *)this + 400);
    _IOHIDLogCategory();
    v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      if (*((void *)this + 3)) {
        IOHIDServiceGetRegistryID();
      }
      sub_1890C0FAC();
    }

    if (*((_DWORD *)this + 100)) {
      goto LABEL_58;
    }
    v49 = (const void *)*((void *)this + 49);
    if (!v49) {
      goto LABEL_58;
    }
    goto LABEL_169;
  }

  if (v6)
  {
    CFTypeID v47 = CFGetTypeID(v6);
    if (v47 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v6, kCFNumberSInt32Type, (char *)this + 304);
      _IOHIDLogCategory();
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      {
        if (*((void *)this + 3)) {
          IOHIDServiceGetRegistryID();
        }
        sub_1890C0F78();
      }

      if (!*((_DWORD *)this + 76))
      {
        v62 = (const void *)*((void *)this + 37);
        if (v62)
        {
          CFRelease(v62);
          *((void *)this + 37) = 0LL;
        }

        goto LABEL_58;
      }

      v49 = (const void *)*((void *)this + 49);
      if (v49)
      {
LABEL_169:
        CFRelease(v49);
        *((void *)this + 49) = 0LL;
      }
    }
  }

LABEL_58:
  if (v10 != *v12)
  {
    *CFTypeRef v12 = v10;
    if (v10) {
      int v9 = 0;
    }
  }

  if (v9 != *((_DWORD *)this + 89))
  {
    *((_DWORD *)this + 89) = v9;
    _IOHIDLogCategory();
    __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v22 = *((void *)this + 3);
      if (v22) {
        uint64_t v22 = IOHIDServiceGetRegistryID();
      }
      sub_1890C0D24(v22, (uint64_t)valuePtr, v9);
    }

    unint64_t v23 = (dispatch_queue_s *)*((void *)this + 62);
    if (v23)
    {
      v63[0] = MEMORY[0x1895F87A8];
      v63[1] = 3221225472LL;
      v63[2] = sub_1890BC6A8;
      v63[3] = &unk_18A344210;
      v63[4] = this;
      int v64 = v9;
      dispatch_async(v23, v63);
    }
  }

void sub_1890BBF98(_Unwind_Exception *a1)
{
  sub_1890BF5C4(v2 - 144, *(void **)(v2 - 136));
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::setCapsLockState(IOHIDKeyboardFilter *this, int a2, const void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (*((_DWORD *)this + 110) != a2)
  {
    *((_DWORD *)this + 110) = a2;
    +[AppleKeyboardStateManager sharedManager](&OBJC_CLASS___AppleKeyboardStateManager, "sharedManager");
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setCapsLockEnabled:*((_DWORD *)this + 110) != 0 locationID:*((void *)this + 59)];

    _IOHIDLogCategory();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t RegistryID = *((void *)this + 3);
      if (RegistryID) {
        uint64_t RegistryID = IOHIDServiceGetRegistryID();
      }
      int v9 = 138412802;
      uint64_t v10 = RegistryID;
      __int16 v11 = 1024;
      int v12 = a2;
      __int16 v13 = 2112;
      dispatch_source_t v14 = a3;
      _os_log_impl( &dword_1890B7000,  v7,  OS_LOG_TYPE_INFO,  "[%@] Set capslock state: %d client: %@\n",  (uint8_t *)&v9,  0x1Cu);
    }
  }

void sub_1890BC1F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::updateCapslockLED(IOHIDKeyboardFilter *this, const void *a2)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if ((*((_BYTE *)this + 295) & 1) == 0) {
    return;
  }
  int v4 = *((_DWORD *)this + 111);
  if (CFEqual(*((CFTypeRef *)this + 57), (CFTypeRef)*MEMORY[0x189608688])) {
    goto LABEL_17;
  }
  *((_DWORD *)this + 111) = *((_DWORD *)this + 110);
  if (CFEqual(*((CFTypeRef *)this + 57), (CFTypeRef)*MEMORY[0x189608698]))
  {
    int v5 = 1;
LABEL_8:
    *((_DWORD *)this + 111) = v5;
    goto LABEL_9;
  }

  if (CFEqual(*((CFTypeRef *)this + 57), (CFTypeRef)*MEMORY[0x189608690]) || *((_DWORD *)this + 112))
  {
    int v5 = 0;
    goto LABEL_8;
  }

LABEL_9:
  if (!*((void *)this + 3))
  {
LABEL_17:
    int v6 = 0;
    goto LABEL_11;
  }

  IOHIDServiceSetElementValue();
  IOHIDServiceSetProperty();
  int v6 = 1;
LABEL_11:
  _IOHIDLogCategory();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t RegistryID = *((void *)this + 3);
    if (RegistryID) {
      uint64_t RegistryID = IOHIDServiceGetRegistryID();
    }
    int v9 = *((_DWORD *)this + 111);
    uint64_t v10 = *((void *)this + 57);
    int v11 = *((_DWORD *)this + 110);
    int v12 = 138413826;
    uint64_t v13 = RegistryID;
    __int16 v14 = 1024;
    BOOL v15 = v4 != 0;
    __int16 v16 = 1024;
    int v17 = v9;
    __int16 v18 = 2112;
    uint64_t v19 = v10;
    __int16 v20 = 1024;
    int v21 = v11;
    __int16 v22 = 2112;
    unint64_t v23 = a2;
    __int16 v24 = 1024;
    int v25 = v6;
    _os_log_impl( &dword_1890B7000,  v7,  OS_LOG_TYPE_INFO,  "[%@] updateCapslockLED:%d->%d capsLockLED:%@ capsLockState:%d client:%@, didUpdateCapsLockLEDState:%d\n",  (uint8_t *)&v12,  0x38u);
  }
}

void sub_1890BC3F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::resetModifiedKeyState(IOHIDKeyboardFilter *this)
{
  uint64_t v2 = (void *)v7[0];
  if ((void *)v7[0] != &v7[1])
  {
    do
    {
      if (*((_BYTE *)v2 + 40))
      {
        mach_absolute_time();
        KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
        if (KeyboardEvent)
        {
          (*((void (**)(void, void, IOHIDKeyboardFilter *, const void *, void))this + 4))( *((void *)this + 5),  *((void *)this + 6),  this,  KeyboardEvent,  0LL);
          CFRelease(KeyboardEvent);
        }
      }

      int v4 = (void *)v2[1];
      if (v4)
      {
        do
        {
          int v5 = v4;
          int v4 = (void *)*v4;
        }

        while (v4);
      }

      else
      {
        do
        {
          int v5 = (void *)v2[2];
          BOOL v6 = *v5 == (void)v2;
          uint64_t v2 = v5;
        }

        while (!v6);
      }

      uint64_t v2 = v5;
    }

    while (v5 != &v7[1]);
  }

  sub_1890BF5C4((uint64_t)v7, (void *)v7[1]);
}

void sub_1890BC504( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, void *a11)
{
}

void IOHIDKeyboardFilter::resetModifiedKeyState(uint64_t a1, void *a2)
{
  uint64_t v2 = a2 + 1;
  __int128 v3 = (void *)*a2;
  if ((void *)*a2 != a2 + 1)
  {
    int v5 = (void *)(a1 + 72);
    do
    {
      BOOL v6 = (void *)*v5;
      if (*v5)
      {
        unint64_t v7 = v3[4];
        uint64_t v8 = v5;
        do
        {
          unint64_t v9 = v6[4];
          BOOL v10 = v9 >= v7;
          if (v9 >= v7) {
            int v11 = v6;
          }
          else {
            int v11 = v6 + 1;
          }
          if (v10) {
            uint64_t v8 = v6;
          }
          BOOL v6 = (void *)*v11;
        }

        while (*v11);
        if (v8 != v5 && v7 >= v8[4])
        {
          mach_absolute_time();
          uint64_t KeyboardEvent = IOHIDEventCreateKeyboardEvent();
          if (KeyboardEvent)
          {
            uint64_t v13 = (const void *)KeyboardEvent;
            (*(void (**)(void, void, uint64_t, uint64_t, void))(a1 + 32))( *(void *)(a1 + 40),  *(void *)(a1 + 48),  a1,  KeyboardEvent,  0LL);
            CFRelease(v13);
          }
        }
      }

      __int16 v14 = (void *)v3[1];
      if (v14)
      {
        do
        {
          BOOL v15 = v14;
          __int16 v14 = (void *)*v14;
        }

        while (v14);
      }

      else
      {
        do
        {
          BOOL v15 = (void *)v3[2];
          BOOL v16 = *v15 == (void)v3;
          __int128 v3 = v15;
        }

        while (!v16);
      }

      __int128 v3 = v15;
    }

    while (v15 != v2);
  }

void IOHIDKeyboardFilter::resetSlowKey(IOHIDKeyboardFilter *this)
{
  uint64_t v2 = (const void *)*((void *)this + 37);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 37) = 0LL;
  }

void IOHIDKeyboardFilter::resetCapsLockDelay(IOHIDKeyboardFilter *this)
{
  uint64_t v2 = (const void *)*((void *)this + 49);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 49) = 0LL;
  }

void IOHIDKeyboardFilter::resetLockKeyDelay(IOHIDKeyboardFilter *this)
{
  uint64_t v2 = (const void *)*((void *)this + 52);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 52) = 0LL;
  }

void sub_1890BC6A8(uint64_t a1)
{
  uint64_t v2 = *(IOHIDKeyboardFilter **)(a1 + 32);
  if (*(_DWORD *)(a1 + 40)) {
    IOHIDKeyboardFilter::startStickyKey(v2);
  }
  else {
    IOHIDKeyboardFilter::dispatchStickyKeys(v2, 14);
  }
}

void IOHIDKeyboardFilter::startStickyKey(IOHIDKeyboardFilter *this)
{
  uint64_t v2 = (void *)v7[0];
  if ((void *)v7[0] != &v7[1])
  {
    do
    {
      if (Key::isModifier((Key *)(v2 + 4)))
      {
        mach_absolute_time();
        uint64_t KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
        if (KeyboardEvent)
        {
          IOHIDEventSetIntegerValue();
          (*((void (**)(void, void, IOHIDKeyboardFilter *, const void *, void))this + 4))( *((void *)this + 5),  *((void *)this + 6),  this,  KeyboardEvent,  0LL);
          CFRelease(KeyboardEvent);
        }
      }

      int v4 = (void *)v2[1];
      if (v4)
      {
        do
        {
          int v5 = v4;
          int v4 = (void *)*v4;
        }

        while (v4);
      }

      else
      {
        do
        {
          int v5 = (void *)v2[2];
          BOOL v6 = *v5 == (void)v2;
          uint64_t v2 = v5;
        }

        while (!v6);
      }

      uint64_t v2 = v5;
    }

    while (v5 != &v7[1]);
  }

  sub_1890BF5C4((uint64_t)v7, (void *)v7[1]);
}

void sub_1890BC7D8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, void *a11)
{
}

uint64_t IOHIDKeyboardFilter::match(IOHIDKeyboardFilter *this, __IOHIDService *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  int v3 = 300;
  if (!IOHIDServiceConformsTo())
  {
    else {
      int v3 = 0;
    }
  }

  *((_DWORD *)this + 5) = v3;
  _IOHIDLogCategory();
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t RegistryID = IOHIDServiceGetRegistryID();
    int v7 = *((_DWORD *)this + 5);
    int v8 = 134218498;
    unint64_t v9 = this;
    __int16 v10 = 2112;
    uint64_t v11 = RegistryID;
    __int16 v12 = 1024;
    int v13 = v7;
    _os_log_debug_impl( &dword_1890B7000,  v4,  OS_LOG_TYPE_DEBUG,  "(%p) for ServiceID %@ with score %d\n",  (uint8_t *)&v8,  0x1Cu);
  }

  return *((unsigned int *)this + 5);
}

void sub_1890BC904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

const void *IOHIDKeyboardFilter::filter(uint64_t a1, const void *a2)
{
  uint64_t v2 = a2;
  v12[3] = *MEMORY[0x1895F89C0];
  if (a2 && IOHIDEventGetType() == 3)
  {
    __int16 EventFlags = IOHIDEventGetEventFlags();
    uint64_t v2 = (const void *)IOHIDKeyboardFilter::processKeyMappings(a1, (uint64_t)v2);
    IOHIDKeyboardFilter::processModifiedKeyState(a1, (uint64_t)v2);
    IOHIDKeyboardFilter::dispatchEventCopy(a1, (uint64_t)v2);
    if (!*(_DWORD *)(a1 + 304) || (uint64_t v2 = IOHIDKeyboardFilter::processSlowKeys(a1, v2), !*(_DWORD *)(a1 + 304)))
    {
      if (!*(_DWORD *)(a1 + 400)
        || !*(_DWORD *)(a1 + 404)
        || (uint64_t v2 = IOHIDKeyboardFilter::processCapsLockDelay(a1, v2), !*(_DWORD *)(a1 + 304)))
      {
        if (*(_DWORD *)(a1 + 424) && !IOHIDKeyboardFilter::isModifiersPressed((IOHIDKeyboardFilter *)a1)) {
          uint64_t v2 = IOHIDKeyboardFilter::processLockKeyDelay(a1, v2);
        }
      }
    }

    if (!*(_DWORD *)(a1 + 360)) {
      uint64_t v2 = (const void *)IOHIDKeyboardFilter::processStickyKeys(a1, (uint64_t)v2);
    }
    IOHIDKeyboardFilter::processCapsLockState(a1, (uint64_t)v2);
    uint64_t v5 = *(void *)(a1 + 376);
    if (v5 && (EventFlags & 0x100) == 0)
    {
      if (*(_DWORD *)(a1 + 304))
      {
        uint64_t v6 = a1;
        int v7 = v2;
        uint64_t v5 = 420LL;
        uint64_t v8 = 420LL;
      }

      else
      {
        uint64_t v8 = *(void *)(a1 + 384);
        uint64_t v6 = a1;
        int v7 = v2;
      }

      IOHIDKeyboardFilter::processKeyRepeats(v6, v7, v5, v8);
    }

    IOHIDKeyboardFilter::processKeyState(a1, (uint64_t)v2);
    if (!v2)
    {
      _IOHIDLogCategory();
      unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t RegistryID = *(void *)(a1 + 24);
        if (RegistryID) {
          uint64_t RegistryID = IOHIDServiceGetRegistryID();
        }
        sub_1890C10C8(RegistryID, (uint64_t)v12);
      }

      return 0LL;
    }
  }

  return v2;
}

void sub_1890BCAD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::dispatchEventCopy(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    Integerint Value = IOHIDEventGetIntegerValue();
    if (IOHIDEventGetIntegerValue() == 7 && IntegerValue == 57LL)
    {
      IOHIDEventGetIntegerValue();
      mach_absolute_time();
      uint64_t VendorDefinedEvent = IOHIDEventCreateVendorDefinedEvent();
      if (VendorDefinedEvent)
      {
        uint64_t v5 = (const void *)VendorDefinedEvent;
        (*(void (**)(void, void, uint64_t, uint64_t, void))(a1 + 32))( *(void *)(a1 + 40),  *(void *)(a1 + 48),  a1,  VendorDefinedEvent,  0LL);
        CFRelease(v5);
      }
    }
  }

uint64_t IOHIDKeyboardFilter::processKeyMappings(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (a2)
  {
    Integerint Value = IOHIDEventGetIntegerValue();
    unsigned int v5 = IOHIDEventGetIntegerValue();
    int EventFlags = IOHIDEventGetEventFlags();
    if (!*(void *)(a1 + 368)
      || IntegerValue != IOHIDEventGetIntegerValue()
      || v5 != IOHIDEventGetIntegerValue())
    {
      int v7 = (const void *)_IOHIDEventCopyAttachment();
      Copy = v7;
      if (v7 == (const void *)*MEMORY[0x189604DE8])
      {
LABEL_16:
        CFRelease(Copy);
        return v2;
      }

      if (v7) {
        CFRelease(v7);
      }
      if ((EventFlags & 0x6F0000) == 0 && !IOHIDEventGetIntegerValue() && !IOHIDKeyboardFilter::isDelayedEvent())
      {
        uint64_t v9 = IOHIDKeyboardFilter::remapKey(a1, IntegerValue | ((unint64_t)v5 << 32));
        if (!v9) {
          return 0LL;
        }
        if (v9 != __PAIR64__(v5, IntegerValue))
        {
          Copy = (const void *)IOHIDEventCreateCopy();
          Children = (__CFArray *)IOHIDEventGetChildren();
          if (Children) {
            CFArrayRemoveAllValues(Children);
          }
          IOHIDEventAppendEvent();
          _IOHIDEventSetAttachment();
          IOHIDEventSetIntegerValue();
          IOHIDEventSetIntegerValue();
          goto LABEL_16;
        }
      }
    }
  }

  return v2;
}

void IOHIDKeyboardFilter::processModifiedKeyState(uint64_t a1, uint64_t a2)
{
  if (a2 && !IOHIDEventGetIntegerValue())
  {
    Integerint Value = IOHIDEventGetIntegerValue();
    int v4 = IOHIDEventGetIntegerValue();
    uint64_t v5 = 0LL;
    while (dword_1890C17F0[v5] != v4 || dword_1890C17F0[v5 + 1] != IntegerValue)
    {
      v5 += 2LL;
      if (v5 == 8) {
        return;
      }
    }

    if (v4 == 255 && IntegerValue == 3LL)
    {
      int v6 = 1;
    }

    else
    {
      BOOL v7 = v4 == 65281 && IntegerValue == 3LL;
      int v6 = v7;
    }

    memset(v20, 170, sizeof(v20));
    sub_1890C0814((uint64_t)v20, a1 + 64);
    uint64_t v8 = (void *)v20[0];
    if ((void *)v20[0] != &v20[1])
    {
      uint64_t v9 = (void *)(a1 + 96);
      do
      {
        __int16 v10 = v8 + 4;
        if (*((_BYTE *)v8 + 40) && !Key::modifierMask((Key *)(v8 + 4))
          || v6 && *((_DWORD *)v8 + 9) == 7 && (*(_DWORD *)v10 - 58) < 0xC)
        {
          uint64_t v11 = (void *)*v9;
          if (!*v9) {
            goto LABEL_35;
          }
          unint64_t v12 = *v10;
          int v13 = (void *)(a1 + 96);
          do
          {
            unint64_t v14 = v11[4];
            BOOL v15 = v14 >= v12;
            if (v14 >= v12) {
              BOOL v16 = v11;
            }
            else {
              BOOL v16 = v11 + 1;
            }
            if (v15) {
              int v13 = v11;
            }
            uint64_t v11 = (void *)*v16;
          }

          while (*v16);
          if (v13 == v9 || v12 < v13[4])
          {
LABEL_35:
            sub_1890C0980((uint64_t **)(a1 + 88), v8 + 4, (_OWORD *)v8 + 2);
            mach_absolute_time();
            uint64_t KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
            if (KeyboardEvent)
            {
              _IOHIDEventSetAttachment();
              (*(void (**)(void, void, uint64_t, const void *, void))(a1 + 32))( *(void *)(a1 + 40),  *(void *)(a1 + 48),  a1,  KeyboardEvent,  0LL);
              CFRelease(KeyboardEvent);
            }

            sub_1890C0A38(a1 + 88, v8 + 4);
          }
        }

        __int16 v18 = (void *)v8[1];
        if (v18)
        {
          do
          {
            uint64_t v19 = v18;
            __int16 v18 = (void *)*v18;
          }

          while (v18);
        }

        else
        {
          do
          {
            uint64_t v19 = (void *)v8[2];
            BOOL v7 = *v19 == (void)v8;
            uint64_t v8 = v19;
          }

          while (!v7);
        }

        uint64_t v8 = v19;
      }

      while (v19 != &v20[1]);
    }

    sub_1890BF5C4((uint64_t)v20, (void *)v20[1]);
  }

void sub_1890BCFF8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, void *a11)
{
}

const void *IOHIDKeyboardFilter::processSlowKeys(uint64_t a1, const void *a2)
{
  uint64_t v2 = a2;
  if (a2 && IOHIDEventGetIntegerValue() != 3)
  {
    Integerint Value = IOHIDEventGetIntegerValue();
    int v5 = IOHIDEventGetIntegerValue();
    if (IOHIDEventGetIntegerValue())
    {
      CFRetain(v2);
      int v6 = *(const void **)(a1 + 296);
      if (v6) {
        CFRelease(v6);
      }
      *(void *)(a1 + 296) = v2;
      BOOL v7 = *(dispatch_source_s **)(a1 + 512);
      dispatch_time_t v8 = dispatch_time(0LL, 1000000LL * *(unsigned int *)(a1 + 304));
      dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0LL);
      return 0LL;
    }

    else if (*(void *)(a1 + 296) {
           && IOHIDEventGetIntegerValue() == IntegerValue
    }
           && IOHIDEventGetIntegerValue() == v5)
    {
      dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 512), 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
      if ((IOHIDEventGetEventFlags() & 0x10000) == 0) {
        uint64_t v2 = 0LL;
      }
      __int16 v10 = *(const void **)(a1 + 296);
      if (v10)
      {
        CFRelease(v10);
        *(void *)(a1 + 296) = 0LL;
      }
    }
  }

  return v2;
}

const void *IOHIDKeyboardFilter::processCapsLockDelay(uint64_t a1, const void *a2)
{
  uint64_t v2 = a2;
  if (a2)
  {
    Integerint Value = IOHIDEventGetIntegerValue();
    int v5 = IOHIDEventGetIntegerValue();
    int v6 = IOHIDEventGetIntegerValue();
    if (v5 == 7 && IntegerValue == 57LL)
    {
      int v7 = v6;
      if (IOHIDKeyboardFilter::isDelayedEvent())
      {
        _IOHIDEventRemoveAttachment();
        return v2;
      }

      int v8 = *(_DWORD *)(a1 + 404);
      if (v8 <= 0)
      {
        int v8 = *(_DWORD *)(a1 + 400);
        if (!v7) {
          goto LABEL_11;
        }
      }

      else if (!v7)
      {
        goto LABEL_11;
      }

      if (!*(_DWORD *)(a1 + 440))
      {
        __int16 v10 = *(dispatch_source_s **)(a1 + 528);
        dispatch_time_t v11 = dispatch_time(0LL, 1000000LL * v8);
        dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0LL);
        _IOHIDEventSetAttachment();
        *(void *)(a1 + 392) = v2;
        CFRetain(v2);
        return 0LL;
      }

LABEL_11:
      if (!*(void *)(a1 + 392)) {
        return v2;
      }
      dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 528), 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
      uint64_t v9 = *(const void **)(a1 + 392);
      if (v9)
      {
        CFRelease(v9);
        uint64_t v2 = 0LL;
        *(void *)(a1 + 392) = 0LL;
        return v2;
      }

      return 0LL;
    }
  }

  return v2;
}

BOOL IOHIDKeyboardFilter::isModifiersPressed(IOHIDKeyboardFilter *this)
{
  uint64_t v1 = (void *)*((void *)this + 8);
  uint64_t v2 = (char *)this + 72;
  while (1)
  {
    BOOL result = Key::isModifier((Key *)(v1 + 4));
    if (result) {
      break;
    }
    int v4 = (void *)v1[1];
    if (v4)
    {
      do
      {
        int v5 = v4;
        int v4 = (void *)*v4;
      }

      while (v4);
    }

    else
    {
      do
      {
        int v5 = (void *)v1[2];
        BOOL v6 = *v5 == (void)v1;
        uint64_t v1 = v5;
      }

      while (!v6);
    }

    uint64_t v1 = v5;
    if (v5 == (void *)v2) {
      return result;
    }
  }

  return 1LL;
}

const void *IOHIDKeyboardFilter::processLockKeyDelay(uint64_t a1, const void *a2)
{
  uint64_t v2 = a2;
  if (a2)
  {
    Integerint Value = IOHIDEventGetIntegerValue();
    int v5 = IOHIDEventGetIntegerValue();
    int v6 = IOHIDEventGetIntegerValue();
    if (v5 == 12 && IntegerValue == 414LL)
    {
      int v7 = v6;
      if (IOHIDKeyboardFilter::isDelayedEvent())
      {
        _IOHIDEventRemoveAttachment();
      }

      else
      {
        if (v7)
        {
          int v8 = *(dispatch_source_s **)(a1 + 432);
          dispatch_time_t v9 = dispatch_time(0LL, 1000000LL * *(unsigned int *)(a1 + 424));
          dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0LL);
          _IOHIDEventSetAttachment();
          *(void *)(a1 + 416) = v2;
          CFRetain(v2);
        }

        else
        {
          if (!*(void *)(a1 + 416)) {
            return v2;
          }
          dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 432), 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
          dispatch_time_t v11 = *(const void **)(a1 + 416);
          if (v11)
          {
            CFRelease(v11);
            uint64_t v2 = 0LL;
            *(void *)(a1 + 416) = 0LL;
            return v2;
          }
        }

        return 0LL;
      }
    }
  }

  return v2;
}

uint64_t IOHIDKeyboardFilter::processStickyKeys(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  unsigned int v12 = 0;
  if (a2)
  {
    int v4 = *(_DWORD *)(a1 + 356);
    if (IOHIDEventGetIntegerValue() != 3 && IOHIDEventGetIntegerValue() != 1 && IOHIDEventGetIntegerValue() != 2)
    {
      Integerint Value = IOHIDEventGetIntegerValue();
      unsigned int v6 = IOHIDEventGetIntegerValue();
      uint64_t v7 = IOHIDEventGetIntegerValue();
      if (v6 == 7 && (IntegerValue & 0xFFFFFFFB) == 0xE1)
      {
        if (!v7) {
          IOHIDKeyboardFilter::processShiftKey((IOHIDKeyboardFilter *)a1);
        }
      }

      else
      {
        *(_DWORD *)(a1 + 308) = 0;
      }

      if (*(_DWORD *)(a1 + 356))
      {
        if (IntegerValue != 57 || v6 != 7)
        {
          unint64_t v13 = IntegerValue | ((unint64_t)v6 << 32);
          char v14 = 0;
          if (Key::isModifier((Key *)&v13))
          {
            if (*(_DWORD *)(a1 + 356) == (v4 != 0))
            {
              if (v7) {
                int v8 = IOHIDKeyboardFilter::processStickyKeyDown((IOHIDKeyboardFilter *)a1, v6, IntegerValue, &v12);
              }
              else {
                int v8 = IOHIDKeyboardFilter::processStickyKeyUp((IOHIDKeyboardFilter *)a1, v6, IntegerValue, &v12);
              }
              if (!v8) {
                return 0LL;
              }
              IOHIDEventSetIntegerValue();
              IOHIDEventGetEventFlags();
              IOHIDEventSetEventFlags();
            }

            else
            {
              IOHIDEventGetEventFlags();
              IOHIDEventSetEventFlags();
            }

            goto LABEL_28;
          }
        }

        if (*(_DWORD *)(a1 + 308)) {
          dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 504), 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
        }
        if (!v7)
        {
          dispatch_time_t v9 = *(dispatch_queue_s **)(a1 + 496);
          v11[0] = MEMORY[0x1895F87A8];
          v11[1] = 3221225472LL;
          v11[2] = sub_1890BECA4;
          void v11[3] = &unk_18A3441C8;
          v11[4] = a1;
          dispatch_async(v9, v11);
          *(_DWORD *)(a1 + 308) = 0;
        }

        IOHIDKeyboardFilter::updateStickyKeysState((IOHIDKeyboardFilter *)a1, 8, 16);
      }

      else if (v4)
      {
        IOHIDEventGetEventFlags();
        IOHIDEventSetEventFlags();
LABEL_28:
        IOHIDEventSetIntegerValue();
      }
    }
  }

  return v2;
}

uint64_t IOHIDKeyboardFilter::processCapsLockState(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = (IOHIDKeyboardFilter *)result;
    BOOL result = IOHIDEventGetIntegerValue();
    if (result != 1)
    {
      BOOL result = IOHIDEventGetIntegerValue();
      if (result != 2)
      {
        Integerint Value = IOHIDEventGetIntegerValue();
        int v4 = IOHIDEventGetIntegerValue();
        BOOL result = IOHIDEventGetIntegerValue();
        if (v4 == 7 && IntegerValue == 57LL)
        {
          if ((_DWORD)result)
          {
            IOHIDKeyboardFilter::setCapsLockState(v2, *((_DWORD *)v2 + 110) == 0, @"Keyboard");
            return IOHIDServiceSetProperty();
          }
        }
      }
    }
  }

  return result;
}

const void *IOHIDKeyboardFilter::processKeyRepeats(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4)
{
  if (!a2) {
    return a2;
  }
  if (IOHIDEventGetIntegerValue() == 1) {
    return a2;
  }
  if (IOHIDEventGetIntegerValue() == 2) {
    return a2;
  }
  Integerint Value = IOHIDEventGetIntegerValue();
  int v9 = IOHIDEventGetIntegerValue();
  int v10 = IOHIDEventGetIntegerValue();
  unint64_t v18 = IntegerValue | ((unint64_t)v9 << 32);
  char v19 = 0;
  if (Key::isModifier((Key *)&v18)) {
    return a2;
  }
  if (v9 > 11)
  {
    if (v9 == 12)
    {
      if (IntegerValue - 48 <= 0x10 && ((1 << (IntegerValue - 48)) & 0x10005) != 0
        || IntegerValue - 176 <= 0x1D && ((1 << (IntegerValue + 80)) & 0x20000101) != 0)
      {
        return a2;
      }

      goto LABEL_29;
    }

    if (v9 != 255) {
      goto LABEL_21;
    }
    if ((IntegerValue & 0xFFFFFFFE) == 6) {
      return a2;
    }
  }

  else
  {
    if (v9 != 7)
    {
      if (v9 == 11) {
        return a2;
      }
LABEL_21:
      BOOL v13 = IntegerValue == 34 && v9 == 65281;
      if (v9 == 65289 || v13) {
        return a2;
      }
      goto LABEL_29;
    }
  }

LABEL_29:
  char v14 = *(const void **)(a1 + 368);
  if (v10)
  {
    if (v14) {
      CFRelease(v14);
    }
    CFGetAllocator(a2);
    mach_absolute_time();
    *(void *)(a1 + 368) = IOHIDEventCreateKeyboardEvent();
    BOOL v15 = *(dispatch_source_s **)(a1 + 520);
    if ((IOHIDEventGetEventFlags() & 0x10000) != 0) {
      uint64_t v16 = a4;
    }
    else {
      uint64_t v16 = a3;
    }
    dispatch_time_t v17 = dispatch_time(0LL, 1000000 * v16);
    dispatch_source_set_timer(v15, v17, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }

  else if (v14 {
         && IntegerValue == IOHIDEventGetIntegerValue()
  }
         && v9 == IOHIDEventGetIntegerValue())
  {
    dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 520), 0xFFFFFFFFFFFFFFFFLL, 0LL, 0LL);
    CFRelease(*(CFTypeRef *)(a1 + 368));
    *(void *)(a1 + 368) = 0LL;
  }

  return a2;
}

    *a3 = v17;
    return v5;
  }

  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = a2;
    return a4;
  }

  dispatch_time_t v11 = a2[1];
  if (v11)
  {
    unsigned int v12 = (void *)a2[1];
    do
    {
      a4 = v12;
      unsigned int v12 = (void *)*v12;
    }

    while (v12);
  }

  else
  {
    char v19 = a2;
    do
    {
      a4 = (void *)v19[2];
      char v14 = *a4 == (void)v19;
      char v19 = a4;
    }

    while (!v14);
  }

  if (a4 != v5 && v6 >= a4[4])
  {
    __int16 v20 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          int v21 = v20;
          __int16 v22 = v20[4];
          if (v6 >= v22) {
            break;
          }
          __int16 v20 = (void *)*v21;
          int v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }

        if (v22 >= v6) {
          break;
        }
        int v5 = v21 + 1;
        __int16 v20 = (void *)v21[1];
      }

      while (v20);
    }

    else
    {
      int v21 = a1 + 1;
    }

void IOHIDKeyboardFilter::processKeyState(uint64_t a1, uint64_t a2)
{
  if (a2 && IOHIDEventGetIntegerValue() != 1 && IOHIDEventGetIntegerValue() != 2)
  {
    Integerint Value = IOHIDEventGetIntegerValue();
    unsigned int v4 = IOHIDEventGetIntegerValue();
    int v5 = IOHIDEventGetIntegerValue();
    int EventFlags = IOHIDEventGetEventFlags();
    uint64_t v7 = (const void *)_IOHIDEventCopyAttachment();
    BOOL v8 = v7 == (const void *)*MEMORY[0x189604DE8];
    if (v7) {
      CFRelease(v7);
    }
    unint64_t v9 = IntegerValue | ((unint64_t)v4 << 32);
    int v10 = (uint64_t **)(a1 + 64);
    if (v5)
    {
      unint64_t v18 = v9;
      BOOL v19 = v8;
      v20[0] = -1431655766;
      *(_DWORD *)((char *)v20 + 3) = -1431655766;
      *(_DWORD *)((char *)&v20[1] + 3) = EventFlags;
      sub_1890C0AB0(v10, &v18, (uint64_t)&v18);
    }

    else
    {
      BOOL v13 = *(void **)(a1 + 72);
      unsigned int v12 = (uint64_t *)(a1 + 72);
      dispatch_time_t v11 = v13;
      if (v13)
      {
        char v14 = v12;
        do
        {
          unint64_t v15 = v11[4];
          BOOL v16 = v15 >= v9;
          if (v15 >= v9) {
            dispatch_time_t v17 = v11;
          }
          else {
            dispatch_time_t v17 = v11 + 1;
          }
          if (v16) {
            char v14 = v11;
          }
          dispatch_time_t v11 = (void *)*v17;
        }

        while (*v17);
        if (v14 != v12 && v9 >= v14[4])
        {
          sub_1890BFC7C(v10, v14);
          operator delete(v14);
        }
      }
    }
  }

void *sub_1890BDBE0(void *a1, const std::string *a2, int a3)
{
  uint64_t v6 = MEMORY[0x189614760];
  uint64_t v7 = MEMORY[0x189614760] + 64LL;
  a1[15] = MEMORY[0x189614760] + 64LL;
  uint64_t v8 = (uint64_t)(a1 + 2);
  uint64_t v9 = *(void *)(MEMORY[0x189614730] + 8LL);
  uint64_t v10 = *(void *)(MEMORY[0x189614730] + 16LL);
  *a1 = v9;
  *(void *)((char *)a1 + *(void *)(v9 - 24)) = v10;
  a1[1] = 0LL;
  dispatch_time_t v11 = (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL));
  std::ios_base::init(v11, a1 + 2);
  v11[1].__vftable = 0LL;
  v11[1].__fmtflags_ = -1;
  *a1 = v6 + 24;
  a1[15] = v7;
  sub_1890C0674(v8, a2, a3 | 8);
  return a1;
}

void sub_1890BDC9C(_Unwind_Exception *a1)
{
}

void *sub_1890BDCC4(void *a1, std::string *a2, unsigned __int8 a3)
{
  char v11 = -86;
  MEMORY[0x1895DF2AC](&v11, a1, 1LL);
  if (!v11) {
    return a1;
  }
  if ((char)a2->__r_.__value_.__s.__size_ < 0)
  {
    *a2->__r_.__value_.__l.__data_ = 0;
    a2->__r_.__value_.__l.__size_ = 0LL;
  }

  else
  {
    a2->__r_.__value_.__s.__data_[0] = 0;
    a2->__r_.__value_.__s.__size_ = 0;
  }

  uint64_t v6 = 0LL;
  while (1)
  {
    uint64_t v7 = *(void **)((char *)a1 + *(void *)(*a1 - 24LL) + 40);
    uint64_t v8 = (_BYTE *)v7[3];
    if (v8 != (_BYTE *)v7[4])
    {
      void v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }

    LODWORD(v7) = (*(uint64_t (**)(void *))(*v7 + 80LL))(v7);
    if ((_DWORD)v7 == -1) {
      break;
    }
LABEL_9:
    if (v7 == a3)
    {
      int v9 = 0;
      goto LABEL_17;
    }

    std::string::push_back(a2, (std::string::value_type)v7);
    --v6;
    if ((char)a2->__r_.__value_.__s.__size_ < 0 && a2->__r_.__value_.__l.__size_ == 0x7FFFFFFFFFFFFFF7LL)
    {
      int v9 = 4;
      goto LABEL_17;
    }
  }

  if (v6) {
    int v9 = 2;
  }
  else {
    int v9 = 6;
  }
LABEL_17:
  std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)),  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24LL) + 32) | v9);
  return a1;
}

void sub_1890BDDF8(void *a1)
{
  uint64_t v2 = *v1;
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24LL) + 32) |= 1u;
  if ((*((_BYTE *)v1 + *(void *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x1890BDDC4LL);
  }

  __cxa_rethrow();
}

void sub_1890BDE3C(_Unwind_Exception *a1)
{
}

uint64_t sub_1890BDE50(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x189614730];
  uint64_t v3 = *MEMORY[0x189614730];
  *(void *)a1 = *MEMORY[0x189614730];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 16) = MEMORY[0x189614750] + 16LL;
  std::streambuf::~streambuf();
  std::istream::~istream();
  MEMORY[0x1895DF300](a1 + 120);
  return a1;
}

BOOL IOHIDKeyboardFilter::isKeyPressed(uint64_t a1, unint64_t a2)
{
  unsigned int v4 = *(void **)(a1 + 72);
  uint64_t v2 = (void *)(a1 + 72);
  uint64_t v3 = v4;
  if (!v4) {
    goto LABEL_12;
  }
  int v5 = v2;
  do
  {
    unint64_t v6 = v3[4];
    BOOL v7 = v6 >= a2;
    if (v6 >= a2) {
      uint64_t v8 = v3;
    }
    else {
      uint64_t v8 = v3 + 1;
    }
    if (v7) {
      int v5 = v3;
    }
    uint64_t v3 = (void *)*v8;
  }

  while (*v8);
  if (v5 == v2 || a2 < v5[4]) {
LABEL_12:
  }
    int v5 = v2;
  return v5 != v2;
}

BOOL IOHIDKeyboardFilter::isDelayedEvent()
{
  v0 = (const void *)_IOHIDEventCopyAttachment();
  if (!v0) {
    return 0LL;
  }
  BOOL v1 = v0 == (const void *)*MEMORY[0x189604DE8];
  CFRelease(v0);
  return v1;
}

uint64_t IOHIDKeyboardFilter::remapKey(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  uint64_t result = 0x70000003ELL;
  if (a2 != 0x70000003ELL) {
    goto LABEL_22;
  }
  int v5 = (void *)(a1 + 72);
  unint64_t v6 = *(void **)(a1 + 72);
  if (!v6) {
    goto LABEL_22;
  }
  BOOL v7 = (void *)(a1 + 72);
  uint64_t v8 = (void *)(a1 + 72);
  int v9 = *(void **)(a1 + 72);
  do
  {
    unint64_t v10 = v9[4];
    BOOL v11 = v10 >= 0x7000000E3LL;
    if (v10 >= 0x7000000E3LL) {
      unsigned int v12 = v9;
    }
    else {
      unsigned int v12 = v9 + 1;
    }
    if (v11) {
      uint64_t v8 = v9;
    }
    int v9 = (void *)*v12;
  }

  while (*v12);
  if (v8 == v5 || v8[4] >= 0x7000000E4uLL)
  {
    do
    {
      unint64_t v13 = v6[4];
      BOOL v14 = v13 >= 0x7000000E7LL;
      if (v13 >= 0x7000000E7LL) {
        unint64_t v15 = v6;
      }
      else {
        unint64_t v15 = v6 + 1;
      }
      if (v14) {
        BOOL v7 = v6;
      }
      unint64_t v6 = (void *)*v15;
    }

    while (*v15);
    if (v7 == v5 || v7[4] >= 0x7000000E8uLL)
    {
LABEL_22:
      int ActiveModifiers = IOHIDKeyboardFilter::getActiveModifiers((IOHIDKeyboardFilter *)a1);
      if ((*(_DWORD *)(a1 + 288) == 0) != (unsigned __int16)(ActiveModifiers & 0x200) >> 9)
      {
        dispatch_time_t v17 = *(void **)(a1 + 144);
        if (v17)
        {
          unint64_t v18 = (void *)(a1 + 144);
          do
          {
            unint64_t v19 = v17[4];
            BOOL v20 = v19 >= v2;
            if (v19 >= v2) {
              int v21 = v17;
            }
            else {
              int v21 = v17 + 1;
            }
            if (v20) {
              unint64_t v18 = v17;
            }
            dispatch_time_t v17 = (void *)*v21;
          }

          while (*v21);
          if (v18 != (void *)(a1 + 144) && v2 >= v18[4]) {
            unint64_t v2 = v18[6];
          }
        }
      }

      __int16 v22 = *(void **)(a1 + 160);
      int v25 = (void *)*v22;
      unint64_t v23 = v22 + 1;
      __int16 v24 = v25;
      if (v25 != v23)
      {
        while (1)
        {
          if (((_DWORD)v24[4] & ActiveModifiers) != 0)
          {
            uint64_t v26 = (void *)v24[6];
            if (v26)
            {
              v27 = v24 + 6;
              do
              {
                unint64_t v28 = v26[4];
                BOOL v29 = v28 >= v2;
                if (v28 >= v2) {
                  BOOL v30 = v26;
                }
                else {
                  BOOL v30 = v26 + 1;
                }
                if (v29) {
                  v27 = v26;
                }
                uint64_t v26 = (void *)*v30;
              }

              while (*v30);
              if (v27 != v24 + 6 && v2 >= v27[4]) {
                break;
              }
            }
          }

          uint64_t v31 = (void *)v24[1];
          if (v31)
          {
            do
            {
              CFTypeID v32 = v31;
              uint64_t v31 = (void *)*v31;
            }

            while (v31);
          }

          else
          {
            do
            {
              CFTypeID v32 = (void *)v24[2];
              BOOL v33 = *v32 == (void)v24;
              __int16 v24 = v32;
            }

            while (!v33);
          }

          __int16 v24 = v32;
          if (v32 == v23) {
            goto LABEL_54;
          }
        }

        unint64_t v2 = v27[6];
      }

LABEL_54:
      if (*(_DWORD *)(a1 + 408))
      {
        uint64_t v34 = *(void **)(a1 + 248);
        if (v34)
        {
          uint64_t v35 = (void *)(a1 + 248);
          do
          {
            unint64_t v36 = v34[4];
            BOOL v37 = v36 >= v2;
            if (v36 >= v2) {
              v38 = v34;
            }
            else {
              v38 = v34 + 1;
            }
            if (v37) {
              uint64_t v35 = v34;
            }
            uint64_t v34 = (void *)*v38;
          }

          while (*v38);
          if (v35 != (void *)(a1 + 248) && v2 >= v35[4]) {
            unint64_t v2 = v35[6];
          }
        }
      }

      v39 = *(void **)(a1 + 120);
      if (v39)
      {
        uint64_t v40 = (void *)(a1 + 120);
        do
        {
          unint64_t v41 = v39[4];
          BOOL v42 = v41 >= v2;
          if (v41 >= v2) {
            CFTypeID v43 = v39;
          }
          else {
            CFTypeID v43 = v39 + 1;
          }
          if (v42) {
            uint64_t v40 = v39;
          }
          v39 = (void *)*v43;
        }

        while (*v43);
        if (v40 != (void *)(a1 + 120) && v2 >= v40[4]) {
          unint64_t v2 = v40[6];
        }
      }

      v44 = *(void **)(a1 + 272);
      if (!v44) {
        return v2;
      }
      v45 = (void *)(a1 + 272);
      do
      {
        unint64_t v46 = v44[4];
        BOOL v47 = v46 >= v2;
        if (v46 >= v2) {
          v48 = v44;
        }
        else {
          v48 = v44 + 1;
        }
        if (v47) {
          v45 = v44;
        }
        v44 = (void *)*v48;
      }

      while (*v48);
      if (v45 != (void *)(a1 + 272) && v2 >= v45[4]) {
        return v45[6];
      }
      else {
        return v2;
      }
    }
  }

  return result;
}

uint64_t IOHIDKeyboardFilter::getActiveModifiers(IOHIDKeyboardFilter *this)
{
  BOOL v1 = (char *)*((void *)this + 8);
  unint64_t v2 = (char *)this + 72;
  LODWORD(v3) = 0;
  do
  {
    int v4 = Key::modifierMask((Key *)(v1 + 32));
    int v5 = (char *)*((void *)v1 + 1);
    if (v5)
    {
      do
      {
        unint64_t v6 = v5;
        int v5 = *(char **)v5;
      }

      while (v5);
    }

    else
    {
      do
      {
        unint64_t v6 = (char *)*((void *)v1 + 2);
        BOOL v7 = *(void *)v6 == (void)v1;
        BOOL v1 = v6;
      }

      while (!v7);
    }

    uint64_t v3 = v4 | v3;
    BOOL v1 = v6;
  }

  while (v6 != v2);
  return v3;
}

BOOL IOHIDKeyboardFilter::isNumLockMode(IOHIDKeyboardFilter *this)
{
  return *((_DWORD *)this + 102) != 0;
}

uint64_t IOHIDKeyboardFilter::getStickyKeyState(IOHIDKeyboardFilter *this, int a2, unsigned int a3)
{
  if (a3 == 57)
  {
    uint64_t v3 = 0LL;
  }

  else if (a2 == 255 && a3 == 3)
  {
    uint64_t v3 = 9LL;
  }

  else
  {
    char v4 = a3 - 4;
    if (a3 <= 0xE3) {
      char v4 = a3;
    }
    uint64_t v3 = (v4 + 33);
  }

  return *((unsigned int *)this + v3 + 78);
}

void IOHIDKeyboardFilter::setStickyKeyState(IOHIDKeyboardFilter *this, int a2, unsigned int a3, int a4)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a3 == 57)
  {
    uint64_t v6 = 0LL;
  }

  else if (a2 == 255 && a3 == 3)
  {
    uint64_t v6 = 9LL;
  }

  else
  {
    char v7 = a3 - 4;
    if (a3 <= 0xE3) {
      char v7 = a3;
    }
    uint64_t v6 = (v7 + 33);
  }

  _IOHIDLogCategory();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t RegistryID = *((void *)this + 3);
    if (RegistryID) {
      uint64_t RegistryID = IOHIDServiceGetRegistryID();
    }
    int v10 = *((_DWORD *)this + v6 + 78);
    int v11 = 138412802;
    uint64_t v12 = RegistryID;
    __int16 v13 = 1024;
    int v14 = v10;
    __int16 v15 = 1024;
    int v16 = a4;
    _os_log_debug_impl( &dword_1890B7000,  v8,  OS_LOG_TYPE_DEBUG,  "[%@] StickyKey state %x -> %x\n",  (uint8_t *)&v11,  0x18u);
  }

  *((_DWORD *)this + v6 + 78) = a4;
}

void sub_1890BE450(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t IOHIDKeyboardFilter::processStickyKeyDown( IOHIDKeyboardFilter *this, int a2, unsigned int a3, unsigned int *a4)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (a3 == 57)
  {
    uint64_t v7 = 0LL;
  }

  else if (a2 == 255 && a3 == 3)
  {
    uint64_t v7 = 9LL;
  }

  else
  {
    char v8 = a3 - 4;
    if (a3 <= 0xE3) {
      char v8 = a3;
    }
    uint64_t v7 = (v8 + 33);
  }

  int v9 = *((_DWORD *)this + v7 + 78);
  switch(v9)
  {
    case 4:
      uint64_t v10 = 0LL;
      int v9 = 1;
      break;
    case 2:
      *a4 = 0x40000;
      uint64_t v10 = 2LL;
      int v9 = 4;
      break;
    case 1:
      *a4 = 0x20000;
      uint64_t v10 = 1LL;
      int v9 = 8;
      break;
    default:
      _IOHIDLogCategory();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t RegistryID = *((void *)this + 3);
        if (RegistryID) {
          uint64_t RegistryID = IOHIDServiceGetRegistryID();
        }
        int v16 = 138412802;
        uint64_t v17 = RegistryID;
        __int16 v18 = 1024;
        unsigned int v19 = a2;
        __int16 v20 = 1024;
        unsigned int v21 = a3;
        _os_log_error_impl( &dword_1890B7000,  v11,  OS_LOG_TYPE_ERROR,  "[%@] StickyKey DOWN in bad state for 0x%x:0x%x\n",  (uint8_t *)&v16,  0x18u);
      }

      uint64_t v10 = 0LL;
      break;
  }

  IOHIDKeyboardFilter::setStickyKeyState(this, a2, a3, v9);
  _IOHIDLogCategory();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *((void *)this + 3);
    if (v14) {
      uint64_t v14 = IOHIDServiceGetRegistryID();
    }
    int v16 = 138413058;
    uint64_t v17 = v14;
    __int16 v18 = 1024;
    unsigned int v19 = a3;
    __int16 v20 = 1024;
    unsigned int v21 = a2;
    __int16 v22 = 1024;
    int v23 = v10;
    _os_log_debug_impl( &dword_1890B7000,  v12,  OS_LOG_TYPE_DEBUG,  "[%@] StickyKey DOWN 0x%x:0x%x phase 0x%x\n",  (uint8_t *)&v16,  0x1Eu);
  }

  return v10;
}

void sub_1890BE674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t IOHIDKeyboardFilter::processStickyKeyUp( IOHIDKeyboardFilter *this, int a2, unsigned int a3, unsigned int *a4)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (a3 == 57)
  {
    uint64_t v7 = 0LL;
  }

  else if (a2 == 255 && a3 == 3)
  {
    uint64_t v7 = 9LL;
  }

  else
  {
    char v8 = a3 - 4;
    if (a3 <= 0xE3) {
      char v8 = a3;
    }
    uint64_t v7 = (v8 + 33);
  }

  uint64_t v9 = 0LL;
  int v10 = *((_DWORD *)this + v7 + 78);
  if (v10 <= 7)
  {
    if (v10 == 1)
    {
      *a4 = 0x80000;
      uint64_t v9 = 3LL;
      goto LABEL_21;
    }

    if (v10 == 4) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }

  if (v10 == 8)
  {
    int v11 = 2;
    goto LABEL_18;
  }

  if (v10 == 16)
  {
    *a4 = 0x80000;
    uint64_t v9 = 3LL;
    int v11 = 1;
LABEL_18:
    IOHIDKeyboardFilter::setStickyKeyState(this, a2, a3, v11);
    goto LABEL_21;
  }

LABEL_19:
  _IOHIDLogCategory();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t RegistryID = *((void *)this + 3);
    if (RegistryID) {
      uint64_t RegistryID = IOHIDServiceGetRegistryID();
    }
    int v17 = 138412802;
    uint64_t v18 = RegistryID;
    __int16 v19 = 1024;
    unsigned int v20 = a2;
    __int16 v21 = 1024;
    unsigned int v22 = a3;
    _os_log_error_impl( &dword_1890B7000,  v12,  OS_LOG_TYPE_ERROR,  "[%@] StickyKey UP in bad state for 0x%x:0x%x\n",  (uint8_t *)&v17,  0x18u);
  }

  uint64_t v9 = 0LL;
LABEL_21:
  _IOHIDLogCategory();
  __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *((void *)this + 3);
    if (v15) {
      uint64_t v15 = IOHIDServiceGetRegistryID();
    }
    int v17 = 138413058;
    uint64_t v18 = v15;
    __int16 v19 = 1024;
    unsigned int v20 = a3;
    __int16 v21 = 1024;
    unsigned int v22 = a2;
    __int16 v23 = 1024;
    int v24 = v9;
    _os_log_debug_impl( &dword_1890B7000,  v13,  OS_LOG_TYPE_DEBUG,  "[%@] StickyKey UP 0x%x:0x%x phase 0x%x\n",  (uint8_t *)&v17,  0x1Eu);
  }

  return v9;
}

void sub_1890BE8B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void IOHIDKeyboardFilter::resetStickyKeys(IOHIDKeyboardFilter *this)
{
  BOOL v1 = (dispatch_queue_s *)*((void *)this + 62);
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = sub_1890BE92C;
  block[3] = &unk_18A3441C8;
  block[4] = this;
  dispatch_async(v1, block);
}

void sub_1890BE92C(uint64_t a1)
{
  BOOL v1 = *(IOHIDKeyboardFilter **)(a1 + 32);
  IOHIDKeyboardFilter::updateStickyKeysState(v1, 8, 16);
  IOHIDKeyboardFilter::dispatchStickyKeys(v1, 2);
  *((_DWORD *)v1 + 77) = 0;
}

void IOHIDKeyboardFilter::updateStickyKeysState(IOHIDKeyboardFilter *this, int a2, int a3)
{
  for (unsigned int i = 0; i != 10; ++i)
  {
    int v7 = i + 223;
    char v8 = i - 37;
    if (i <= 4) {
      char v8 = i - 33;
    }
    uint64_t v9 = (v8 + 33);
    if (i <= 8)
    {
      int v10 = 7;
    }

    else
    {
      int v7 = 3;
      int v10 = 255;
    }

    if (i > 8) {
      uint64_t v9 = 9LL;
    }
    if (i) {
      unsigned int v11 = v7;
    }
    else {
      unsigned int v11 = 57;
    }
    if (i) {
      int v12 = v10;
    }
    else {
      int v12 = 7;
    }
    if (i) {
      uint64_t v13 = v9;
    }
    else {
      uint64_t v13 = 0LL;
    }
    if (*((_DWORD *)this + v13 + 78) == a2) {
      IOHIDKeyboardFilter::setStickyKeyState(this, v12, v11, a3);
    }
  }

void IOHIDKeyboardFilter::dispatchStickyKeys(IOHIDKeyboardFilter *this, int a2)
{
  for (unsigned int i = 0; i != 10; ++i)
  {
    int v5 = i + 223;
    char v6 = i - 37;
    if (i <= 4) {
      char v6 = i - 33;
    }
    uint64_t v7 = (v6 + 33);
    if (i <= 8)
    {
      int v8 = 7;
    }

    else
    {
      int v5 = 3;
      int v8 = 255;
    }

    if (i > 8) {
      uint64_t v7 = 9LL;
    }
    if (i) {
      unsigned int v9 = v5;
    }
    else {
      unsigned int v9 = 57;
    }
    if (i) {
      int v10 = v8;
    }
    else {
      int v10 = 7;
    }
    if (i) {
      uint64_t v11 = v7;
    }
    else {
      uint64_t v11 = 0LL;
    }
    if ((*((_DWORD *)this + v11 + 78) & a2) != 0)
    {
      mach_absolute_time();
      uint64_t KeyboardEvent = IOHIDEventCreateKeyboardEvent();
      if (KeyboardEvent)
      {
        uint64_t v13 = (const void *)KeyboardEvent;
        IOHIDEventSetIntegerValue();
        (*((void (**)(void, void, IOHIDKeyboardFilter *, const void *, void))this + 4))( *((void *)this + 5),  *((void *)this + 6),  this,  v13,  0LL);
        CFRelease(v13);
        IOHIDKeyboardFilter::setStickyKeyState(this, v10, v9, 1);
      }
    }
  }

void IOHIDKeyboardFilter::processShiftKey(IOHIDKeyboardFilter *this)
{
  v8[3] = *MEMORY[0x1895F89C0];
  if (*((_DWORD *)this + 88))
  {
    int v2 = *((_DWORD *)this + 77);
    unsigned int v3 = v2 + 1;
    *((_DWORD *)this + 77) = v2 + 1;
    if (!v2)
    {
      char v4 = (dispatch_source_s *)*((void *)this + 63);
      dispatch_time_t v5 = dispatch_time(0LL, 30000000000LL);
      dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0LL);
      unsigned int v3 = *((_DWORD *)this + 77);
    }

    if (v3 >= 5)
    {
      *((_DWORD *)this + 77) = 0;
      *((_DWORD *)this + 89) = *((_DWORD *)this + 89) == 0;
      _IOHIDLogCategory();
      char v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t RegistryID = *((void *)this + 3);
        if (RegistryID) {
          uint64_t RegistryID = IOHIDServiceGetRegistryID();
        }
        sub_1890C10FC(RegistryID, (_DWORD *)this + 89, (uint64_t)v8, v6);
      }

      IOHIDServiceSetProperty();
      if (*((_DWORD *)this + 89)) {
        IOHIDKeyboardFilter::startStickyKey(this);
      }
      else {
        IOHIDKeyboardFilter::dispatchStickyKeys(this, 14);
      }
    }
  }

void sub_1890BEC8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1890BECA4(uint64_t a1)
{
}

void *IOHIDKeyboardFilter::serializeMapper@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAAAALL;
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], *(int *)(a1 + 16), MEMORY[0x189605228]);
  uint64_t result = sub_1890BF308((void *)a2, Mutable, 1);
  *(void *)a2 = &unk_18A344310;
  char v6 = *(void **)a1;
  if (*(void *)a1 != a1 + 8)
  {
    do
    {
      unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
      value = (void *)0xAAAAAAAAAAAAAAAALL;
      sub_1890BF1C8(&v10, 2);
      sub_1890BEDF4((uint64_t)&v10, @"Src", v6[4]);
      sub_1890BEDF4((uint64_t)&v10, @"Dst", v6[6]);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a2 + 8), value);
      uint64_t result = sub_1890BF270(&v10);
      uint64_t v7 = (void *)v6[1];
      if (v7)
      {
        do
        {
          int v8 = v7;
          uint64_t v7 = (void *)*v7;
        }

        while (v7);
      }

      else
      {
        do
        {
          int v8 = (void *)v6[2];
          BOOL v9 = *v8 == (void)v6;
          char v6 = v8;
        }

        while (!v9);
      }

      char v6 = v8;
    }

    while (v8 != (void *)(a1 + 8));
  }

  return result;
}

void sub_1890BEDD0(_Unwind_Exception *a1)
{
}

void *sub_1890BEDF4(uint64_t a1, const void *a2, uint64_t a3)
{
  if (a2 && value) {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 8), a2, value);
  }
  return sub_1890BF2B0(&v6);
}

void sub_1890BEE4C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *IOHIDKeyboardFilter::serializeModifierMappings@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a2 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAAAALL;
  char v4 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], *(int *)(a1 + 16), MEMORY[0x189605228]);
  uint64_t result = sub_1890BF308((void *)a2, Mutable, 1);
  *(void *)a2 = &unk_18A344310;
  uint64_t v7 = *(void **)a1;
  if (*(void *)a1 != a1 + 8)
  {
    do
    {
      unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
      CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
      sub_1890BF1C8(&v14, *((_DWORD *)v7 + 14));
      CFStringRef v8 = CFStringCreateWithFormat(v4, 0LL, @"%#x", *((unsigned int *)v7 + 8));
      IOHIDKeyboardFilter::serializeMapper((uint64_t)(v7 + 5), (uint64_t)&v12);
      if (v8 && value) {
        CFDictionarySetValue(theDict, v8, value);
      }
      sub_1890BF3CC(&v12);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a2 + 8), theDict);
      uint64_t result = sub_1890BF270(&v14);
      BOOL v9 = (void *)v7[1];
      if (v9)
      {
        do
        {
          unint64_t v10 = v9;
          BOOL v9 = (void *)*v9;
        }

        while (v9);
      }

      else
      {
        do
        {
          unint64_t v10 = (void *)v7[2];
          BOOL v11 = *v10 == (void)v7;
          uint64_t v7 = v10;
        }

        while (!v11);
      }

      uint64_t v7 = v10;
    }

    while (v10 != (void *)(a1 + 8));
  }

  return result;
}

void sub_1890BEFA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v5 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  sub_1890BF3CC((uint64_t *)va);
  sub_1890BF270((uint64_t *)va1);
  sub_1890BF3CC(v3);
  _Unwind_Resume(a1);
}

uint64_t IOHIDKeyboardFilter::getKeyboardID(IOHIDKeyboardFilter *this, int a2, int a3)
{
  if (a3 != 1452) {
    return 3LL;
  }
  return dword_1890C18F4[(__int16)(a2 - 514)];
}

void sub_1890BF0B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1890BF1B4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void *sub_1890BF1C8(void *a1, int a2)
{
  *a1 = &unk_18A344240;
  a1[1] = CFDictionaryCreateMutable(0LL, a2, MEMORY[0x189605240], MEMORY[0x189605250]);
  return a1;
}

void sub_1890BF218(_Unwind_Exception *a1)
{
}

void sub_1890BF22C(void *a1)
{
  BOOL v1 = sub_1890BF270(a1);
  operator delete(v1);
}

void sub_1890BF244(void *a1)
{
  BOOL v1 = sub_1890BF270(a1);
  operator delete(v1);
}

void sub_1890BF25C(void *a1)
{
  BOOL v1 = sub_1890BF270(a1);
  operator delete(v1);
}

void *sub_1890BF270(void *a1)
{
  int v2 = (const void *)a1[1];
  *a1 = &unk_18A3442C0;
  a1[1] = 0LL;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *sub_1890BF2B0(void *a1)
{
  int v2 = (const void *)a1[1];
  *a1 = &unk_18A3442E0;
  a1[1] = 0LL;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_1890BF2F4(void *a1)
{
  BOOL v1 = sub_1890BF2B0(a1);
  operator delete(v1);
}

void *sub_1890BF308(void *a1, CFTypeRef cf, char a3)
{
  if (cf)
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFArrayGetTypeID()) {
      CFTypeRef v7 = cf;
    }
    else {
      CFTypeRef v7 = 0LL;
    }
    *a1 = &unk_18A344390;
    a1[1] = v7;
    if (v7 && (a3 & 1) == 0) {
      CFRetain(v7);
    }
  }

  else
  {
    a1[1] = 0LL;
  }

  *a1 = &unk_18A344370;
  return a1;
}

void sub_1890BF388(void *a1)
{
  BOOL v1 = sub_1890BF3CC(a1);
  operator delete(v1);
}

void sub_1890BF3A0(void *a1)
{
  BOOL v1 = sub_1890BF3CC(a1);
  operator delete(v1);
}

void sub_1890BF3B8(void *a1)
{
  BOOL v1 = sub_1890BF3CC(a1);
  operator delete(v1);
}

void *sub_1890BF3CC(void *a1)
{
  int v2 = (const void *)a1[1];
  *a1 = &unk_18A344390;
  a1[1] = 0LL;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void *sub_1890BF40C(void *a1, CFTypeRef cf, char a3)
{
  if (cf)
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFDictionaryGetTypeID()) {
      CFTypeRef v7 = cf;
    }
    else {
      CFTypeRef v7 = 0LL;
    }
    *a1 = &unk_18A3442C0;
    a1[1] = v7;
    if (v7 && (a3 & 1) == 0) {
      CFRetain(v7);
    }
  }

  else
  {
    a1[1] = 0LL;
  }

  *a1 = &unk_18A3442A0;
  return a1;
}

void *sub_1890BF48C(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_1890BF53C();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    CFTypeID v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    CFTypeID v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void sub_1890BF53C()
{
}

void sub_1890BF550(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1890BF5A0(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_18A343F90, MEMORY[0x1896141F8]);
}

void sub_1890BF58C(_Unwind_Exception *a1)
{
}

std::logic_error *sub_1890BF5A0(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x189614778] + 16LL);
  return result;
}

void sub_1890BF5C4(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_1890BF5C4(a1, *a2);
    sub_1890BF5C4(a1, a2[1]);
    operator delete(a2);
  }

void sub_1890BF604(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_1890BF604(a1, *a2);
    sub_1890BF604(a1, a2[1]);
    sub_1890BF5C4((uint64_t)(a2 + 5), (void *)a2[6]);
    operator delete(a2);
  }

uint64_t **sub_1890BF650(uint64_t **a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v7 = a1 + 1;
  CFTypeID v6 = a1[1];
  if (v6)
  {
    unsigned int v8 = *a2;
    while (1)
    {
      while (1)
      {
        BOOL v9 = (uint64_t **)v6;
        unsigned int v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10) {
          break;
        }
        CFTypeID v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }

      if (v10 >= v8) {
        break;
      }
      CFTypeID v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    BOOL v9 = a1 + 1;
LABEL_10:
    BOOL v11 = operator new(0x40uLL);
    v11[8] = **a4;
    *((void *)v11 + 7) = 0LL;
    *((void *)v11 + 6) = 0LL;
    *((void *)v11 + 5) = v11 + 12;
    sub_1890BF71C(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }

  return v9;
}

uint64_t *sub_1890BF71C(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0LL;
  a4[1] = 0LL;
  a4[2] = a2;
  *a3 = a4;
  size_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }

  uint64_t result = sub_1890BF770(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_1890BF770(uint64_t *result, uint64_t *a2)
{
  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      int v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24)) {
        return result;
      }
      unsigned int v3 = (uint64_t *)v2[2];
      size_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), size_t v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            BOOL v9 = (uint64_t **)a2[2];
          }

          else
          {
            BOOL v9 = (uint64_t **)v2[1];
            unsigned int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              unsigned int v3 = (uint64_t *)v2[2];
            }

            v9[2] = v3;
            *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = v9;
            *BOOL v9 = v2;
            v2[2] = (uint64_t)v9;
            unsigned int v3 = v9[2];
            int v2 = (uint64_t *)*v3;
          }

          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *unsigned int v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }

      else if (!v4 || (int v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          uint64_t *v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            unsigned int v3 = (uint64_t *)v2[2];
          }

          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          unsigned int v3 = (uint64_t *)a2[2];
        }

        else
        {
          a2 = (uint64_t *)a2[2];
        }

        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        int v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
        uint64_t *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }

      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      _BYTE *v5 = 1;
    }

    while (v3 != result);
  }

  return result;
}

uint64_t **sub_1890BF908(uint64_t **result, unint64_t *a2, unint64_t *a3)
{
  size_t v5 = result;
  if (result[2])
  {
    int v6 = *result;
    uint64_t v7 = result[1];
    *uint64_t result = (uint64_t *)(result + 1);
    _OWORD v7[2] = 0LL;
    result[1] = 0LL;
    result[2] = 0LL;
    if (v6[1]) {
      int v8 = (uint64_t *)v6[1];
    }
    else {
      int v8 = v6;
    }
    unsigned int v10 = result;
    uint64_t v11 = v8;
    uint64_t v12 = v8;
    if (v8)
    {
      uint64_t v11 = sub_1890BFAB4((uint64_t)v8);
      while (a2 != a3)
      {
        sub_1890BFA0C(v5, a2, (uint64_t)v8);
        if ((v9 & 1) != 0)
        {
          int v8 = v11;
          uint64_t v12 = v11;
          if (!v11)
          {
            a2 += 4;
            break;
          }

          uint64_t v11 = sub_1890BFAB4((uint64_t)v11);
        }

        else
        {
          int v8 = v12;
        }

        a2 += 4;
        if (!v8) {
          break;
        }
      }
    }

    uint64_t result = (uint64_t **)sub_1890BFB08((uint64_t)&v10);
  }

  while (a2 != a3)
  {
    uint64_t result = sub_1890BFB5C(v5, a2, a2);
    a2 += 4;
  }

  return result;
}

void sub_1890BF9F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t **sub_1890BFA0C(uint64_t **a1, unint64_t *a2, uint64_t a3)
{
  size_t v4 = a1 + 1;
  size_t v5 = a1[1];
  if (v5)
  {
    unint64_t v6 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v7 = (uint64_t **)v5;
        unint64_t v8 = v5[4];
        if (v6 >= v8) {
          break;
        }
        size_t v5 = *v7;
        size_t v4 = v7;
        if (!*v7) {
          goto LABEL_10;
        }
      }

      if (v8 >= v6) {
        return v7;
      }
      size_t v5 = v7[1];
      if (!v5)
      {
        size_t v4 = v7 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    uint64_t v7 = a1 + 1;
LABEL_10:
    unint64_t v9 = *a2;
    *(_BYTE *)(a3 + 40) = *((_BYTE *)a2 + 8);
    *(void *)(a3 + 32) = v9;
    unint64_t v10 = a2[2];
    *(_BYTE *)(a3 + 56) = *((_BYTE *)a2 + 24);
    *(void *)(a3 + 48) = v10;
    sub_1890BF71C(a1, (uint64_t)v7, v4, (uint64_t *)a3);
  }

  return (uint64_t **)a3;
}

void *sub_1890BFAB4(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 16);
  if (result)
  {
    unsigned int v3 = (void *)*result;
    if (*result == a1)
    {
      *uint64_t result = 0LL;
      while (1)
      {
        size_t v4 = (void *)result[1];
        if (!v4) {
          break;
        }
        do
        {
          uint64_t result = v4;
          size_t v4 = (void *)*v4;
        }

        while (v4);
      }
    }

    else
    {
      for (result[1] = 0LL; v3; unsigned int v3 = (void *)result[1])
      {
        do
        {
          uint64_t result = v3;
          unsigned int v3 = (void *)*v3;
        }

        while (v3);
      }
    }
  }

  return result;
}

uint64_t sub_1890BFB08(uint64_t a1)
{
  int v2 = *(void **)(a1 + 8);
  if (v2)
  {
    unsigned int v3 = (void *)v2[2];
    if (v3)
    {
      do
      {
        int v2 = v3;
        unsigned int v3 = (void *)v3[2];
      }

      while (v3);
      *(void *)(a1 + 8) = v2;
    }

    sub_1890BF5C4(*(void *)a1, v2);
  }

  return a1;
}

uint64_t **sub_1890BFB5C(uint64_t **a1, unint64_t *a2, _OWORD *a3)
{
  unint64_t v6 = a1 + 1;
  size_t v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        unint64_t v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
        if (v7 >= v9) {
          break;
        }
        size_t v5 = *v8;
        unint64_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }

      if (v9 >= v7) {
        break;
      }
      size_t v5 = v8[1];
      if (!v5)
      {
        unint64_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    unint64_t v8 = a1 + 1;
LABEL_10:
    unint64_t v10 = (uint64_t *)operator new(0x40uLL);
    __int128 v11 = a3[1];
    *((_OWORD *)v10 + 2) = *a3;
    *((_OWORD *)v10 + 3) = v11;
    sub_1890BF71C(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }

  return v8;
}

void sub_1890BFC14(uint64_t a1, void *a2)
{
  size_t v4 = (void *)(a1 + 8);
  sub_1890BF5C4(a1, *(void **)(a1 + 8));
  *(void *)a1 = *a2;
  size_t v5 = a2 + 1;
  uint64_t v6 = a2[1];
  *size_t v4 = v6;
  uint64_t v7 = a2[2];
  *(void *)(a1 + 16) = v7;
  if (v7)
  {
    *(void *)(v6 + 16) = v4;
    *a2 = v5;
    void *v5 = 0LL;
    a2[2] = 0LL;
  }

  else
  {
    *(void *)a1 = v4;
  }

uint64_t *sub_1890BFC7C(uint64_t **a1, uint64_t *a2)
{
  int v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      unsigned int v3 = v2;
      int v2 = (uint64_t *)*v2;
    }

    while (v2);
  }

  else
  {
    size_t v4 = a2;
    do
    {
      unsigned int v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      size_t v4 = v3;
    }

    while (!v5);
  }

  if (*a1 == a2) {
    *a1 = v3;
  }
  uint64_t v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  sub_1890BFCEC(v6, a2);
  return v3;
}

uint64_t *sub_1890BFCEC(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  unsigned int v3 = a2;
  if (*a2)
  {
    size_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      unsigned int v3 = a2;
      goto LABEL_7;
    }

    do
    {
      unsigned int v3 = v4;
      size_t v4 = (uint64_t *)*v4;
    }

    while (v4);
  }

  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }

  int v5 = 1;
LABEL_8:
  uint64_t v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    *uint64_t v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      uint64_t v7 = 0LL;
      uint64_t result = (uint64_t *)v2;
    }

    else
    {
      uint64_t v7 = v6[1];
    }
  }

  else
  {
    v6[1] = (uint64_t *)v2;
  }

  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8LL * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    *unsigned int v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2) {
      uint64_t result = v3;
    }
  }

  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }

  while (1)
  {
    uint64_t v12 = v7[2];
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      uint64_t v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8LL * (**(void **)(v12 + 16) != v12)) = v13;
      *uint64_t v13 = v12;
      *(void *)(v12 + 16) = v13;
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
    }

    uint64_t v15 = (void *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      int v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        *uint64_t v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8LL * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        _OWORD v7[2] = (uint64_t)v15;
        int v16 = v7;
      }

      else
      {
        uint64_t v15 = v7;
      }

      uint64_t v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      int v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8LL * (**(void **)(v23 + 16) != v23)) = v24;
      uint64_t *v24 = v23;
      goto LABEL_72;
    }

    int v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24)) {
      goto LABEL_55;
    }
    *((_BYTE *)v7 + 24) = 0;
    int v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      int v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }

    if (!*((_BYTE *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    uint64_t v7 = *(uint64_t **)(v17[2] + 8LL * (*(void *)v17[2] == (void)v17));
  }

  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    _OWORD v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8LL * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    uint64_t v7 = *(uint64_t **)v12;
  }

  __int16 v19 = (void *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24)) {
    goto LABEL_68;
  }
  unsigned int v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    int v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }

  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    unsigned int v20 = v7;
  }

  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8LL * (*(void *)v7[2] != (void)v7)) = v20;
    *unsigned int v20 = (uint64_t)v7;
    _OWORD v7[2] = (uint64_t)v20;
    __int16 v19 = v7;
  }

  uint64_t v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  int v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8LL);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8LL * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

void *sub_1890C0070(void *a1, int a2)
{
  int valuePtr = a2;
  *a1 = &unk_18A3443B0;
  a1[1] = 0LL;
  a1[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt32Type, &valuePtr);
  return a1;
}

void sub_1890C00C8(_Unwind_Exception *a1)
{
}

void sub_1890C00DC(void *a1)
{
  BOOL v1 = sub_1890BF2B0(a1);
  operator delete(v1);
}

uint64_t *sub_1890C00F0(uint64_t *a1, uint64_t a2)
{
  a1[2] = 0LL;
  a1[1] = 0LL;
  *a1 = (uint64_t)(a1 + 1);
  sub_1890C0144(a1, *(void **)a2, (void *)(a2 + 8));
  return a1;
}

void sub_1890C012C(_Unwind_Exception *a1)
{
}

uint64_t *sub_1890C0144(uint64_t *result, void *a2, void *a3)
{
  if (a2 != a3)
  {
    size_t v4 = a2;
    int v5 = (uint64_t **)result;
    uint64_t v6 = result + 1;
    do
    {
      uint64_t result = sub_1890C01C8(v5, v6, v4 + 4, (_OWORD *)v4 + 2);
      uint64_t v7 = (void *)v4[1];
      if (v7)
      {
        do
        {
          int v8 = v7;
          uint64_t v7 = (void *)*v7;
        }

        while (v7);
      }

      else
      {
        do
        {
          int v8 = (void *)v4[2];
          BOOL v9 = *v8 == (void)v4;
          size_t v4 = v8;
        }

        while (!v9);
      }

      size_t v4 = v8;
    }

    while (v8 != a3);
  }

  return result;
}

uint64_t *sub_1890C01C8(uint64_t **a1, void *a2, unint64_t *a3, _OWORD *a4)
{
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v6 = (void **)sub_1890C0254(a1, a2, &v12, &v11, a3);
  uint64_t v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    int v8 = (uint64_t **)v6;
    uint64_t v7 = (uint64_t *)operator new(0x40uLL);
    __int128 v9 = a4[1];
    *((_OWORD *)v7 + 2) = *a4;
    *((_OWORD *)v7 + 3) = v9;
    sub_1890BF71C(a1, v12, v8, v7);
  }

  return v7;
}

void *sub_1890C0254(void *a1, void *a2, void *a3, void *a4, unint64_t *a5)
{
  int v5 = a1 + 1;
  if (a1 + 1 == a2 || (unint64_t v6 = *a5, v7 = a2[4], *a5 < v7))
  {
    uint64_t v8 = *a2;
    if ((void *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }

      else
      {
        *a3 = a2;
        return a2;
      }
    }

    if (v8)
    {
      __int128 v9 = (void *)*a2;
      do
      {
        uint64_t v10 = v9;
        __int128 v9 = (void *)v9[1];
      }

      while (v9);
    }

    else
    {
      uint64_t v13 = a2;
      do
      {
        uint64_t v10 = (void *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        uint64_t v13 = v10;
      }

      while (v14);
    }

    unint64_t v15 = *a5;
    if (v10[4] < *a5) {
      goto LABEL_17;
    }
    int v16 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          int v17 = v16;
          unint64_t v18 = v16[4];
          if (v15 >= v18) {
            break;
          }
          int v16 = (void *)*v17;
          int v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }

        if (v18 >= v15) {
          break;
        }
        int v5 = v17 + 1;
        int v16 = (void *)v17[1];
      }

      while (v16);
    }

    else
    {
      int v17 = a1 + 1;
    }

LABEL_48:
    *a3 = v21;
    return v5;
  }

  if (v11)
  {
    *a3 = a4;
  }

  else
  {
    *a3 = a2;
    return a2 + 1;
  }

  return a4;
}

uint64_t **sub_1890C03FC(uint64_t **result, void *a2, void *a3)
{
  int v5 = result;
  if (result[2])
  {
    unint64_t v6 = *result;
    unint64_t v7 = result[1];
    *uint64_t result = (uint64_t *)(result + 1);
    _OWORD v7[2] = 0LL;
    result[1] = 0LL;
    result[2] = 0LL;
    if (v6[1]) {
      uint64_t v8 = (uint64_t *)v6[1];
    }
    else {
      uint64_t v8 = v6;
    }
    int v16 = result;
    int v17 = v8;
    unint64_t v18 = v8;
    if (v8)
    {
      int v17 = sub_1890BFAB4((uint64_t)v8);
      if (a2 != a3)
      {
        __int128 v9 = a2;
        do
        {
          uint64_t v10 = v9[4];
          *((_BYTE *)v8 + 40) = *((_BYTE *)v9 + 40);
          void v8[4] = v10;
          uint64_t v11 = v9[6];
          *((_BYTE *)v8 + 56) = *((_BYTE *)v9 + 56);
          v8[6] = v11;
          sub_1890C0574(v5, v8);
          uint64_t v8 = v17;
          unint64_t v18 = v17;
          if (v17) {
            int v17 = sub_1890BFAB4((uint64_t)v17);
          }
          uint64_t v12 = (void *)v9[1];
          if (v12)
          {
            do
            {
              a2 = v12;
              uint64_t v12 = (void *)*v12;
            }

            while (v12);
          }

          else
          {
            do
            {
              a2 = (void *)v9[2];
              BOOL v13 = *a2 == (void)v9;
              __int128 v9 = a2;
            }

            while (!v13);
          }

          if (!v8) {
            break;
          }
          __int128 v9 = a2;
        }

        while (a2 != a3);
      }
    }

    uint64_t result = (uint64_t **)sub_1890BFB08((uint64_t)&v16);
  }

  if (a2 != a3)
  {
    do
    {
      uint64_t result = (uint64_t **)sub_1890C05E0(v5, (_OWORD *)a2 + 2);
      BOOL v14 = (void *)a2[1];
      if (v14)
      {
        do
        {
          unint64_t v15 = v14;
          BOOL v14 = (void *)*v14;
        }

        while (v14);
      }

      else
      {
        do
        {
          unint64_t v15 = (void *)a2[2];
          BOOL v13 = *v15 == (void)a2;
          a2 = v15;
        }

        while (!v13);
      }

      a2 = v15;
    }

    while (v15 != a3);
  }

  return result;
}

void sub_1890C0560(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t *sub_1890C0574(uint64_t **a1, uint64_t *a2)
{
  unsigned int v3 = a1 + 1;
  size_t v4 = a1[1];
  if (v4)
  {
    do
    {
      while (1)
      {
        unsigned int v3 = (uint64_t **)v4;
        size_t v4 = (uint64_t *)*v4;
        int v5 = v3;
        if (!*v3) {
          goto LABEL_8;
        }
      }

      size_t v4 = (uint64_t *)v4[1];
    }

    while (v4);
    int v5 = v3 + 1;
  }

  else
  {
    int v5 = a1 + 1;
  }

LABEL_8:
  sub_1890BF71C(a1, (uint64_t)v3, v5, a2);
  return a2;
}

  sub_1890BF71C(a1, (uint64_t)v7, v9, (uint64_t *)v4);
  return v5;
}

_OWORD *sub_1890C05E0(uint64_t **a1, _OWORD *a2)
{
  size_t v4 = operator new(0x40uLL);
  int v5 = v4;
  __int128 v6 = a2[1];
  v4[2] = *a2;
  v4[3] = v6;
  unint64_t v7 = a1 + 1;
  uint64_t v8 = a1[1];
  if (v8)
  {
    do
    {
      while (1)
      {
        unint64_t v7 = (uint64_t **)v8;
        uint64_t v8 = (uint64_t *)*v8;
        __int128 v9 = v7;
        if (!*v7) {
          goto LABEL_8;
        }
      }

      uint64_t v8 = (uint64_t *)v8[1];
    }

    while (v8);
    __int128 v9 = v7 + 1;
  }

  else
  {
    __int128 v9 = a1 + 1;
  }

uint64_t sub_1890C0674(uint64_t a1, const std::string *a2, int a3)
{
  uint64_t v6 = std::streambuf::basic_streambuf();
  *(void *)uint64_t v6 = MEMORY[0x189614750] + 16LL;
  *(_OWORD *)(v6 + sub_1890C0814((uint64_t)v7, (uint64_t)this + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_DWORD *)(v6 + 96) = a3;
  std::string::operator=((std::string *)(v6 + 64), a2);
  sub_1890C0704(a1);
  return a1;
}

void sub_1890C06E0(_Unwind_Exception *a1)
{
}

void sub_1890C0704(uint64_t a1)
{
  *(void *)(a1 + 88) = 0LL;
  uint64_t v2 = (std::string *)(a1 + 64);
  char v3 = *(_BYTE *)(a1 + 87);
  if (v3 < 0)
  {
    size_t v4 = *(std::string **)(a1 + 64);
    unint64_t v5 = *(void *)(a1 + 72);
  }

  else
  {
    size_t v4 = v2;
    unint64_t v5 = *(unsigned __int8 *)(a1 + 87);
  }

  int v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = (char *)v4 + v5;
  }

  if ((v6 & 0x10) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    std::string::size_type v7 = v3 < 0 ? (*(void *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22LL;
    std::string::resize(v2, v7, 0);
    uint64_t v8 = *(char *)(a1 + 87) < 0 ? *(void *)(a1 + 72) : *(unsigned __int8 *)(a1 + 87);
    *(void *)(a1 + 40) = v4;
    *(void *)(a1 + 48) = v4;
    *(void *)(a1 + 56) = (char *)v4 + v8;
    if ((*(_BYTE *)(a1 + 96) & 3) != 0)
    {
      if (v5 >> 31)
      {
        uint64_t v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        unint64_t v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
        size_t v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
        unint64_t v5 = v5 - v10 - 0x7FFFFFFF;
        *(void *)(a1 + 48) = v4;
      }

      if (v5) {
        *(void *)(a1 + 48) = (char *)v4 + v5;
      }
    }
  }

uint64_t sub_1890C0814(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(void *)a1 = a1 + 8;
  sub_1890C0868((_OWORD *)a1, *(void **)a2, (void *)(a2 + 8));
  return a1;
}

void sub_1890C0850(_Unwind_Exception *a1)
{
}

_OWORD *sub_1890C0868(_OWORD *result, void *a2, void *a3)
{
  if (a2 != a3)
  {
    size_t v4 = a2;
    unint64_t v5 = (uint64_t **)result;
    int v6 = (void *)result + 1;
    do
    {
      uint64_t result = sub_1890C08EC(v5, v6, v4 + 4, (uint64_t)(v4 + 4));
      std::string::size_type v7 = (void *)v4[1];
      if (v7)
      {
        do
        {
          uint64_t v8 = v7;
          std::string::size_type v7 = (void *)*v7;
        }

        while (v7);
      }

      else
      {
        do
        {
          uint64_t v8 = (void *)v4[2];
          BOOL v9 = *v8 == (void)v4;
          size_t v4 = v8;
        }

        while (!v9);
      }

      size_t v4 = v8;
    }

    while (v8 != a3);
  }

  return result;
}

_OWORD *sub_1890C08EC(uint64_t **a1, void *a2, unint64_t *a3, uint64_t a4)
{
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  int v6 = (void **)sub_1890C0254(a1, a2, &v11, &v10, a3);
  std::string::size_type v7 = *v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    std::string::size_type v7 = operator new(0x38uLL);
    _OWORD v7[2] = *(_OWORD *)a4;
    *((void *)v7 + 6) = *(void *)(a4 + 16);
    sub_1890BF71C(a1, v11, v8, (uint64_t *)v7);
  }

  return v7;
}

uint64_t **sub_1890C0980(uint64_t **a1, unint64_t *a2, _OWORD *a3)
{
  int v6 = a1 + 1;
  unint64_t v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
        if (v7 >= v9) {
          break;
        }
        unint64_t v5 = *v8;
        int v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }

      if (v9 >= v7) {
        break;
      }
      unint64_t v5 = v8[1];
      if (!v5)
      {
        int v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    uint64_t v8 = a1 + 1;
LABEL_10:
    unint64_t v10 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v10 + 2) = *a3;
    sub_1890BF71C(a1, (uint64_t)v8, v6, v10);
    return (uint64_t **)v10;
  }

  return v8;
}

uint64_t sub_1890C0A38(uint64_t a1, unint64_t *a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (!v2) {
    return 0LL;
  }
  unint64_t v3 = *a2;
  size_t v4 = (uint64_t *)(a1 + 8);
  do
  {
    unint64_t v5 = v2[4];
    BOOL v6 = v5 >= v3;
    if (v5 >= v3) {
      unint64_t v7 = v2;
    }
    else {
      unint64_t v7 = v2 + 1;
    }
    if (v6) {
      size_t v4 = v2;
    }
    uint64_t v2 = (void *)*v7;
  }

  while (*v7);
  sub_1890BFC7C((uint64_t **)a1, v4);
  operator delete(v4);
  return 1LL;
}

uint64_t **sub_1890C0AB0(uint64_t **a1, unint64_t *a2, uint64_t a3)
{
  BOOL v6 = a1 + 1;
  unint64_t v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
        if (v7 >= v9) {
          break;
        }
        unint64_t v5 = *v8;
        BOOL v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }

      if (v9 >= v7) {
        break;
      }
      unint64_t v5 = v8[1];
      if (!v5)
      {
        BOOL v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    uint64_t v8 = a1 + 1;
LABEL_10:
    unint64_t v10 = operator new(0x38uLL);
    v10[2] = *(_OWORD *)a3;
    *((_DWORD *)v10 + 12) = *(_DWORD *)(a3 + 16);
    sub_1890BF71C(a1, (uint64_t)v8, v6, (uint64_t *)v10);
    return (uint64_t **)v10;
  }

  return v8;
}

void *sub_1890C0B70(void *a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  *a1 = &unk_18A3443B0;
  a1[1] = 0LL;
  a1[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt64Type, &valuePtr);
  return a1;
}

void sub_1890C0BC8(_Unwind_Exception *a1)
{
}

uint64_t sub_1890C0BDC(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 1024;
  *(_DWORD *)(a4 + IOHIDKeyboardFilter::dispatchStickyKeys(this, 14) = v4;
  return result;
}

void sub_1890C0BF4(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, os_log_s *a4@<X8>)
{
}

  ;
}

void sub_1890C0C14(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, os_log_s *a4@<X8>)
{
}

void sub_1890C0C24(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
}

uint64_t sub_1890C0C34(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

uint64_t sub_1890C0C40(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + IOHIDKeyboardFilter::dispatchStickyKeys(this, 14) = a3;
  return result;
}

uint64_t sub_1890C0C58(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 2048;
  *(void *)(a4 + IOHIDKeyboardFilter::dispatchStickyKeys(this, 14) = v4;
  return result;
}

void sub_1890C0C70(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1890B7000, a2, OS_LOG_TYPE_DEBUG, "Event dropped: %@\n", (uint8_t *)&v2, 0xCu);
}

void sub_1890C0CE4(uint64_t a1, uint64_t a2)
{
}

void sub_1890C0D24(uint64_t a1, uint64_t a2, int a3)
{
}

void sub_1890C0D5C()
{
}

void sub_1890C0D90()
{
}

void sub_1890C0DC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_1890C0E00(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_1890C0E3C(uint64_t a1, uint64_t a2, int a3)
{
}

void sub_1890C0E74()
{
}

void sub_1890C0EA8()
{
}

void sub_1890C0EDC(uint64_t a1, uint64_t a2)
{
}

void sub_1890C0F10()
{
}

void sub_1890C0F44(uint64_t a1, uint64_t a2)
{
}

void sub_1890C0F78()
{
  sub_1890C0BF4(&dword_1890B7000, "[%@] _slowKeysDelayMS = %d\n", v3, v4);
}

void sub_1890C0FAC()
{
}

void sub_1890C0FE0()
{
}

void sub_1890C1014()
{
}

void sub_1890C1048(uint64_t a1, uint64_t a2)
{
}

void sub_1890C107C(uint64_t a1, uint64_t a2, uint64_t a3, os_log_s *a4)
{
  uint64_t v4 = *(void *)(a2 + 456);
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + IOHIDKeyboardFilter::dispatchStickyKeys(this, 14) = v4;
  sub_1890C0C14(&dword_1890B7000, "[%@] _capsLockLED: %@\n", (uint8_t *)a3, a4);
}

void sub_1890C10C8(uint64_t a1, uint64_t a2)
{
}

void sub_1890C10FC(uint64_t a1, _DWORD *a2, uint64_t a3, os_log_s *a4)
{
  uint64_t v4 = "ON";
  if (!*a2) {
    uint64_t v4 = "OFF";
  }
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2080;
  *(void *)(a3 + IOHIDKeyboardFilter::dispatchStickyKeys(this, 14) = v4;
  sub_1890C0C14(&dword_1890B7000, "[%@] StickyKey state change (5xSHIFT) to %s\n", (uint8_t *)a3, a4);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1896025D8](allocator, size, hint);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
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

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1896027C8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1896027D0](BOOLean);
}

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
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

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x189602D18](cf);
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

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x189603500](theString, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x189603880](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes( CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x189603898](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

uint64_t IOHIDAccessCheckAuditToken()
{
  return MEMORY[0x189607DA8]();
}

uint64_t IOHIDEventAppendEvent()
{
  return MEMORY[0x189607F30]();
}

uint64_t IOHIDEventCreateCopy()
{
  return MEMORY[0x189607F58]();
}

uint64_t IOHIDEventCreateKeyboardEvent()
{
  return MEMORY[0x189607F68]();
}

uint64_t IOHIDEventCreateVendorDefinedEvent()
{
  return MEMORY[0x189607F70]();
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x189607F90]();
}

uint64_t IOHIDEventGetEventFlags()
{
  return MEMORY[0x189607FA8]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x189607FB8]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x189607FE0]();
}

uint64_t IOHIDEventSetEventFlags()
{
  return MEMORY[0x189608000]();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return MEMORY[0x189608010]();
}

uint64_t IOHIDEventSetTimeStamp()
{
  return MEMORY[0x189608028]();
}

uint64_t IOHIDEventSystemConnectionGetAuditToken()
{
  return MEMORY[0x1896080A8]();
}

uint64_t IOHIDEventSystemConnectionGetUUID()
{
  return MEMORY[0x1896080B0]();
}

uint64_t IOHIDEventSystemConnectionHasEntitlement()
{
  return MEMORY[0x1896080B8]();
}

uint64_t IOHIDPreferencesCopyDomain()
{
  return MEMORY[0x189608158]();
}

uint64_t IOHIDServiceConformsTo()
{
  return MEMORY[0x189608198]();
}

uint64_t IOHIDServiceCopyProperty()
{
  return MEMORY[0x1896081A8]();
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x1896081B8]();
}

uint64_t IOHIDServiceSetElementValue()
{
  return MEMORY[0x1896081C0]();
}

uint64_t IOHIDServiceSetProperty()
{
  return MEMORY[0x1896081C8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _IOHIDEventCopyAttachment()
{
  return MEMORY[0x189608608]();
}

uint64_t _IOHIDEventRemoveAttachment()
{
  return MEMORY[0x189608620]();
}

uint64_t _IOHIDEventSetAttachment()
{
  return MEMORY[0x189608628]();
}

uint64_t _IOHIDIsRestrictedRemappingProperty()
{
  return MEMORY[0x189608630]();
}

uint64_t _IOHIDLogCategory()
{
  return MEMORY[0x189608638]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1896141E0](this, a2);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x189614358](this, __str);
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1896143A0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1896143A8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x189614470]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x189614478]();
}

unint64_t std::stoul(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x189614580](__str, __idx, *(void *)&__base);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x189614638]();
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_18A343FC0(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1896147A0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer( dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}