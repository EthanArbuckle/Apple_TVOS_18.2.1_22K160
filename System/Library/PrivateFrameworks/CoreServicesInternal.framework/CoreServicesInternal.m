uint64_t currentBookmarkVersion(void)
{
  return 268697600LL;
}

BOOL bookmarkVersionOK(int a1)
{
  return (a1 - 1) < 0x1FFFFFFF;
}

CFArrayRef createURLParentageArray(const __CFAllocator *a1, const __CFURL *a2)
{
  v2 = (const __CFAllocator *)MEMORY[0x1895F8858](a1);
  v5 = v2;
  values[512] = *(void **)MEMORY[0x1895F89C0];
  if (!v3) {
    return CFArrayCreate(v2, 0LL, 0LL, MEMORY[0x189605228]);
  }
  int v6 = v4;
  CFURLRef v7 = v3;
  bzero(values, 0xFF8uLL);
  uint64_t v8 = 0LL;
  values[511] = v7;
  v9 = (const __CFString *)*MEMORY[0x189605440];
  unint64_t v10 = -4088LL;
  while (1)
  {
    CFURLRef PathComponent = 0LL;
    int v11 = CFURLCopyResourcePropertyForKey(v7, v9, &PathComponent, 0LL);
    if ((v6 & 0x10000000) != 0 && !v11)
    {
      v12 = CFURLCopyPath(v7);
      if (v12)
      {
        v13 = v12;
        if (CFStringGetLength(v12) >= 1) {
          CFURLRef PathComponent = CFURLCreateCopyDeletingLastPathComponent(v5, v7);
        }
        CFRelease(v13);
      }
    }

    CFURLRef v7 = PathComponent;
    values[v8 + 510] = PathComponent;
    if (!v7) {
      break;
    }
    --v8;
    v10 += 8LL;
    if (v8 == -511)
    {
      CFArrayRef v14 = CFArrayCreate(v5, (const void **)values, 512LL, MEMORY[0x189605228]);
      uint64_t v15 = 0LL;
      goto LABEL_15;
    }
  }

  CFArrayRef v14 = CFArrayCreate(v5, (const void **)&values[v10 / 0xFFFFFFFFFFFFFFF8LL], 1 - v8, MEMORY[0x189605228]);
  uint64_t v15 = v8 + 511;
  do
  {
LABEL_15:
    v17 = values[v15];
    if (v17)
    {
      CFRelease(v17);
      values[v15] = 0LL;
    }

    ++v15;
  }

  while ((_DWORD)v15 != 511);
  return v14;
}

CFArrayRef copyOfArray(const __CFAllocator *a1, CFArrayRef theArray, CFRange a3)
{
  values[100] = *(void **)MEMORY[0x1895F89C0];
  if (!theArray) {
    return 0LL;
  }
  CFIndex length = a3.length;
  CFIndex location = a3.location;
  if (CFArrayGetCount(theArray) >= a3.length)
  {
    Mutable = CFArrayCreateMutable(a1, 0LL, MEMORY[0x189605228]);
    v12.CFIndex location = location;
    v12.CFIndex length = length;
    CFArrayAppendArray(Mutable, theArray, v12);
    CFArrayRef Copy = CFArrayCreateCopy(a1, Mutable);
    if (Mutable) {
      CFRelease(Mutable);
    }
  }

  else
  {
    v11.CFIndex location = location;
    v11.CFIndex length = length;
    CFArrayGetValues(theArray, v11, (const void **)values);
    return CFArrayCreate(a1, (const void **)&values[location], length, MEMORY[0x189605228]);
  }

  return Copy;
}

CFArrayRef createArrayOfPathComponentsFromString( const __CFAllocator *a1, const __CFString *a2, int a3)
{
  if (!a2) {
    return 0LL;
  }
  LODWORD(v3) = a3;
  ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(a1, a2, @"/");
  int v6 = ArrayBySeparatingStrings;
  if (ArrayBySeparatingStrings && CFArrayGetCount(ArrayBySeparatingStrings) >= 1)
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, 0LL);
    if (CFStringGetLength(ValueAtIndex)) {
      CFIndex v3 = v3;
    }
    else {
      CFIndex v3 = (v3 + 1);
    }
    if ((_DWORD)v3)
    {
      v11.CFIndex length = CFArrayGetCount(v6) - v3;
      v11.CFIndex location = v3;
      CFArrayRef v8 = copyOfArray(a1, v6, v11);
      if (v6 != v8)
      {
        CFArrayRef v9 = v8;
        CFRelease(v6);
        return v9;
      }
    }
  }

  return v6;
}

uint64_t sameFileURL(CFTypeRef cf1, CFTypeRef cf2)
{
  uint64_t result = cf1 == cf2;
  if (cf2)
  {
    if (cf1)
    {
      if (cf1 != cf2)
      {
        uint64_t result = CFEqual(cf1, cf2);
        if (!(_DWORD)result)
        {
          CFTypeID v5 = CFGetTypeID(cf1);
          if (v5 != CFURLGetTypeID()) {
            return 0LL;
          }
          CFTypeID v6 = CFGetTypeID(cf2);
          if (v6 != CFURLGetTypeID()) {
            return 0LL;
          }
          int v7 = _CFURLCopyResourcePropertyValuesAndFlags();
          uint64_t result = 0LL;
          if (v7)
          {
            if (v10 == 12)
            {
              int v8 = _CFURLCopyResourcePropertyValuesAndFlags();
              uint64_t result = 0LL;
              if (v8)
              {
                if (v9 == 12)
                {
                  if (v14 == v12) {
                    return v13 == v11;
                  }
                  return 0LL;
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

CFDictionaryRef CFDictionaryCreateWithItems(const __CFAllocator *a1, void *a2, void *a3, void *a4, void *a5)
{
  keys[2] = *(void **)MEMORY[0x1895F89C0];
  if (a2 && a3)
  {
    keys[0] = a2;
    values[0] = a3;
    CFIndex v5 = 1LL;
    if (!a4 || !a5) {
      return CFDictionaryCreate( a1,  (const void **)keys,  (const void **)values,  v5,  MEMORY[0x189605240],  MEMORY[0x189605250]);
    }
    goto LABEL_8;
  }

  if (!a4) {
    return 0LL;
  }
  CFIndex v5 = 0LL;
  uint64_t v6 = 0LL;
  if (a5)
  {
LABEL_8:
    keys[v5] = a4;
    values[v5++] = a5;
    return CFDictionaryCreate( a1,  (const void **)keys,  (const void **)values,  v5,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  }

  return (CFDictionaryRef)v6;
}

os_log_t init_logging(void)
{
  defaultLog = (uint64_t)os_log_create("com.apple.FileURL", "default");
  securityScopedLog = (uint64_t)os_log_create("com.apple.FileURL", "scoped");
  bmarkLog = (uint64_t)os_log_create("com.apple.FileURL", "bookmark");
  resolveLog = (uint64_t)os_log_create("com.apple.FileURL", "resolve");
  os_log_t result = os_log_create("com.apple.FileURL", "alias");
  aliasLog = (uint64_t)result;
  return result;
}

uint64_t asString(const void *const *a1)
{
  v1 = (CFTypeRef *)MEMORY[0x1895F8858](a1);
  CFIndex v3 = v2;
  uint64_t v81 = *MEMORY[0x1895F89C0];
  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)&v75);
  if (!*v1)
  {
    uint64_t v9 = "<NULL>";
LABEL_9:
    int v8 = &v75;
    uint64_t v10 = 6LL;
    goto LABEL_34;
  }

  CFTypeID v4 = CFGetTypeID(*v1);
  if (v4 == CFStringGetTypeID())
  {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)*v1, 0x8000100u);
    if (CStringPtr
      || (CStringPtr = CFStringGetCStringPtr((CFStringRef)*v1, 0x600u)) != 0LL
      || (CStringPtr = CFStringGetCStringPtr((CFStringRef)*v1, 0)) != 0LL)
    {
      LOBYTE(v78) = 34;
      uint64_t v6 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v75, (uint64_t)&v78, 1LL);
      size_t v7 = strlen(CStringPtr);
      int v8 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v6, (uint64_t)CStringPtr, v7);
      LOBYTE(v78) = 34;
      uint64_t v9 = (const char *)&v78;
    }

    else
    {
      v72 = 0LL;
      v37 = (const __CFString *)*v1;
      v82.CFIndex length = CFStringGetLength(v37);
      v82.CFIndex location = 0LL;
      if (!CFStringGetBytes(v37, v82, 0x8000100u, 0, 0, (UInt8 *)&v78, 0xFFFFLL, (CFIndex *)&v72))
      {
        uint64_t v9 = "< unrepresentable string>";
        int v8 = &v75;
        uint64_t v10 = 25LL;
        goto LABEL_34;
      }

      *((_BYTE *)&v78 + (void)v72) = 0;
      LOBYTE(v70[0]) = 34;
      v38 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v75, (uint64_t)v70, 1LL);
      size_t v39 = strlen((const char *)&v78);
      int v8 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v38, (uint64_t)&v78, v39);
      LOBYTE(v70[0]) = 34;
      uint64_t v9 = (const char *)v70;
    }

    goto LABEL_7;
  }

  if (v4 == CFArrayGetTypeID())
  {
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v75, (uint64_t)"[", 1LL);
    if (CFArrayGetCount((CFArrayRef)*v1) >= 1)
    {
      CFIndex v11 = 0LL;
      do
      {
        v70[0] = CFArrayGetValueAtIndex((CFArrayRef)*v1, v11);
        if (v11) {
          uint64_t v12 = ", ";
        }
        else {
          uint64_t v12 = "";
        }
        std::string::basic_string[abi:nn180100]<0>(&v78, v12);
        if ((v80 & 0x80u) == 0) {
          uint64_t v13 = (void **)&v78;
        }
        else {
          uint64_t v13 = v78;
        }
        if ((v80 & 0x80u) == 0) {
          uint64_t v14 = v80;
        }
        else {
          uint64_t v14 = v79;
        }
        uint64_t v15 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v75, (uint64_t)v13, v14);
        asString((uint64_t *)&v72, v70);
        if ((v74 & 0x80u) == 0) {
          v16 = &v72;
        }
        else {
          v16 = (__CFString **)v72;
        }
        if ((v74 & 0x80u) == 0) {
          uint64_t v17 = v74;
        }
        else {
          uint64_t v17 = v73;
        }
        std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v15, (uint64_t)v16, v17);
        ++v11;
      }

      while (v11 < CFArrayGetCount((CFArrayRef)*v1));
    }

    uint64_t v9 = "] ";
    int v8 = &v75;
    uint64_t v10 = 2LL;
    goto LABEL_34;
  }

  CFTypeID TypeID = CFDictionaryGetTypeID();
  v20 = (const __CFDictionary *)*v1;
  if (v4 == TypeID)
  {
    v66 = v3;
    int64_t Count = CFDictionaryGetCount(v20);
    v65[1] = v65;
    MEMORY[0x1895F8858](Count);
    v23 = (const void **)((char *)v65 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    CFDictionaryGetKeysAndValues(v20, v23, 0LL);
    qsort_b(v23, Count, 8uLL, &__block_literal_global);
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v75, (uint64_t)"{", 1LL);
    if (Count >= 1)
    {
      uint64_t v24 = 0LL;
      do
      {
        if (v24) {
          v25 = ", ";
        }
        else {
          v25 = "";
        }
        std::string::basic_string[abi:nn180100]<0>(&v78, v25);
        if ((v80 & 0x80u) == 0) {
          v26 = (void **)&v78;
        }
        else {
          v26 = v78;
        }
        if ((v80 & 0x80u) == 0) {
          uint64_t v27 = v80;
        }
        else {
          uint64_t v27 = v79;
        }
        v28 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v75, (uint64_t)v26, v27);
        asString((uint64_t *)&v72, v23);
        if ((v74 & 0x80u) == 0) {
          v29 = &v72;
        }
        else {
          v29 = (__CFString **)v72;
        }
        if ((v74 & 0x80u) == 0) {
          uint64_t v30 = v74;
        }
        else {
          uint64_t v30 = v73;
        }
        v31 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v28, (uint64_t)v29, v30);
        v32 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v31, (uint64_t)"=", 1LL);
        Value = CFDictionaryGetValue(v20, *v23);
        asString((uint64_t *)v70, &Value);
        if ((v71 & 0x80u) == 0) {
          v33 = v70;
        }
        else {
          v33 = (const void **)v70[0];
        }
        if ((v71 & 0x80u) == 0) {
          uint64_t v34 = v71;
        }
        else {
          uint64_t v34 = (uint64_t)v70[1];
        }
        std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v32, (uint64_t)v33, v34);
        --v24;
        ++v23;
      }

      while (-Count != v24);
    }

    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v75, (uint64_t)"} ", 2LL);
    CFIndex v3 = v66;
    goto LABEL_35;
  }

  if (v20 == (const __CFDictionary *)*MEMORY[0x189604DE8])
  {
    uint64_t v9 = "TRUE ";
    int v8 = &v75;
    uint64_t v10 = 5LL;
    goto LABEL_34;
  }

  if (v20 == (const __CFDictionary *)*MEMORY[0x189604DE0])
  {
    uint64_t v9 = "FALSE ";
    goto LABEL_9;
  }

  if (v4 == CFNumberGetTypeID())
  {
    LODWORD(v72) = 0;
    v78 = 0LL;
    if (CFNumberGetValue((CFNumberRef)*v1, kCFNumberSInt32Type, &v72))
    {
      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v75, (uint64_t)"#", 1LL);
      v35 = (void *)std::ostream::operator<<();
      v36 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v35, (uint64_t)"/0x", 3LL);
      *(_DWORD *)((char *)v36 + *(void *)(*v36 - 24LL) + 8) = *(_DWORD *)((_BYTE *)v36 + *(void *)(*v36 - 24LL) + 8) & 0xFFFFFFB5 | 8;
      int v8 = (uint64_t *)std::ostream::operator<<();
    }

    else
    {
      if (!CFNumberGetValue((CFNumberRef)*v1, kCFNumberSInt64Type, &v78))
      {
        uint64_t v9 = "[CFNumber?] ";
        int v8 = &v75;
        uint64_t v10 = 12LL;
        goto LABEL_34;
      }

      std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v75, (uint64_t)"#", 1LL);
      v61 = (void *)std::ostream::operator<<();
      v62 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v61, (uint64_t)"/0x", 3LL);
      *(_DWORD *)((char *)v62 + *(void *)(*v62 - 24LL) + 8) = *(_DWORD *)((_BYTE *)v62 + *(void *)(*v62 - 24LL) + 8) & 0xFFFFFFB5 | 8;
      int v8 = (uint64_t *)std::ostream::operator<<();
    }

    *(_DWORD *)((char *)v8 + *(void *)(*v8 - 24) + 8) = *(_DWORD *)((_BYTE *)v8 + *(void *)(*v8 - 24) + 8) & 0xFFFFFFB5 | 2;
    uint64_t v9 = " ";
LABEL_7:
    uint64_t v10 = 1LL;
LABEL_34:
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v8, (uint64_t)v9, v10);
    goto LABEL_35;
  }

  if (v4 == CFDateGetTypeID())
  {
    CFAbsoluteTime v40 = MEMORY[0x186E19B18](*v1);
    CFAbsoluteTimeGetGregorianDate(v40, 0LL);
    *(std::streambuf::char_type **)((char *)&v76.__binp_ + *(void *)(v75 - 24)) = (std::streambuf::char_type *)4;
    LOBYTE(v78) = 48;
    std::operator<<[abi:nn180100]<std::char_traits<char>>(&v75, (char *)&v78);
    v41 = (void *)std::ostream::operator<<();
    v42 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v41, (uint64_t)"/", 1LL);
    *(void *)((char *)v42 + *(void *)(*v42 - 24LL) + 24) = 2LL;
    LOBYTE(v72) = 48;
    std::operator<<[abi:nn180100]<std::char_traits<char>>(v42, (char *)&v72);
    v43 = (void *)std::ostream::operator<<();
    v44 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v43, (uint64_t)"/", 1LL);
    *(void *)((char *)v44 + *(void *)(*v44 - 24LL) + 24) = 2LL;
    LOBYTE(v70[0]) = 48;
    std::operator<<[abi:nn180100]<std::char_traits<char>>(v44, (char *)v70);
    v45 = (void *)std::ostream::operator<<();
    v46 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v45, (uint64_t)" ", 1LL);
    *(void *)((char *)v46 + *(void *)(*v46 - 24LL) + 24) = 2LL;
    LOBYTE(Value) = 48;
    std::operator<<[abi:nn180100]<std::char_traits<char>>(v46, (char *)&Value);
    v47 = (void *)std::ostream::operator<<();
    v48 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v47, (uint64_t)":", 1LL);
    *(void *)((char *)v48 + *(void *)(*v48 - 24LL) + 24) = 2LL;
    char v68 = 48;
    std::operator<<[abi:nn180100]<std::char_traits<char>>(v48, &v68);
    v49 = (void *)std::ostream::operator<<();
    v50 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v49, (uint64_t)":", 1LL);
    *(void *)((char *)v50 + *(void *)(*v50 - 24LL) + 24) = 2LL;
    char v67 = 48;
    std::operator<<[abi:nn180100]<std::char_traits<char>>(v50, &v67);
    std::ostream::operator<<();
    goto LABEL_35;
  }

  CFTypeID v51 = CFURLGetTypeID();
  CFTypeRef v52 = *v1;
  if (v4 != v51)
  {
    v55 = (__CFString *)CFCopyDescription(v52);
    v72 = v55;
    asString((uint64_t *)&v78, (const void *const *)&v72);
    if ((v80 & 0x80u) == 0) {
      v59 = (const char *)&v78;
    }
    else {
      v59 = (const char *)v78;
    }
    if ((v80 & 0x80u) == 0) {
      uint64_t v60 = v80;
    }
    else {
      uint64_t v60 = v79;
    }
    v58 = &v75;
    goto LABEL_101;
  }

  CFURLRef v53 = CFURLGetBaseURL((CFURLRef)v52);
  v54 = (const __CFURL *)*v1;
  if (v53)
  {
    v55 = (__CFString *)CFURLCopyAbsoluteURL(v54);
    v72 = (__CFString *)CFURLGetString((CFURLRef)v55);
    asString((uint64_t *)&v78, (const void *const *)&v72);
    if ((v80 & 0x80u) == 0) {
      v56 = (void **)&v78;
    }
    else {
      v56 = v78;
    }
    if ((v80 & 0x80u) == 0) {
      uint64_t v57 = v80;
    }
    else {
      uint64_t v57 = v79;
    }
    v58 = std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v75, (uint64_t)v56, v57);
    v59 = "(*)";
    uint64_t v60 = 3LL;
LABEL_101:
    std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v58, (uint64_t)v59, v60);
    if (v55) {
      CFRelease(v55);
    }
    goto LABEL_35;
  }

  v72 = (__CFString *)CFURLGetString(v54);
  asString((uint64_t *)&v78, (const void *const *)&v72);
  if ((v80 & 0x80u) == 0) {
    v63 = (void **)&v78;
  }
  else {
    v63 = v78;
  }
  if ((v80 & 0x80u) == 0) {
    uint64_t v64 = v80;
  }
  else {
    uint64_t v64 = v79;
  }
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(&v75, (uint64_t)v63, v64);
LABEL_35:
  std::stringbuf::str(v3, &v76);
  uint64_t v75 = *MEMORY[0x189614738];
  *(uint64_t *)((char *)&v75 + *(void *)(v75 - 24)) = *(void *)(MEMORY[0x189614738] + 24LL);
  v76.__vftable = (std::stringbuf_vtbl *)(MEMORY[0x189614750] + 16LL);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x186E1A250](&v77);
}

uint64_t std::ostringstream::basic_ostringstream[abi:nn180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x189614768];
  uint64_t v3 = MEMORY[0x189614768] + 64LL;
  *(void *)(a1 + 112) = MEMORY[0x189614768] + 64LL;
  uint64_t v5 = *(void *)(MEMORY[0x189614738] + 8LL);
  uint64_t v4 = *(void *)(MEMORY[0x189614738] + 16LL);
  *(void *)a1 = v5;
  *(void *)(a1 + *(void *)(v5 - 24)) = v4;
  uint64_t v6 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24LL));
  std::ios_base::init(v6, (void *)(a1 + 8));
  v6[1].__vftable = 0LL;
  v6[1].__fmtflags_ = -1;
  *(void *)a1 = v2 + 24;
  *(void *)(a1 + 112) = v3;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x189614750] + 16LL;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

CFComparisonResult ___Z8asStringRKPKv_block_invoke(uint64_t a1, CFStringRef *a2, CFStringRef *a3)
{
  return CFStringCompare(*a2, *a3, 0LL);
}

void *std::operator<<[abi:nn180100]<std::char_traits<char>>(void *a1, char *a2)
{
  uint64_t v3 = (char *)a1 + *(void *)(*a1 - 24LL);
  int v4 = *a2;
  if (*((_DWORD *)v3 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)));
    uint64_t v5 = std::locale::use_facet(&v7, MEMORY[0x189614558]);
    ((void (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 32LL);
    std::locale::~locale(&v7);
  }

  *((_DWORD *)v3 + 36) = v4;
  return a1;
}

void *std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>( void *a1, uint64_t a2, uint64_t a3)
{
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24LL);
    uint64_t v7 = *(void *)(v6 + 40);
    uint64_t v8 = a2 + a3;
    if ((*(_DWORD *)(v6 + 8) & 0xB0) == 0x20) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = a2;
    }
    int v10 = *(_DWORD *)(v6 + 144);
    if (v10 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)));
      CFIndex v11 = std::locale::use_facet(&v14, MEMORY[0x189614558]);
      int v10 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v11->__vftable[2].~facet_0)(v11, 32LL);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v10;
    }

    if (!std::__pad_and_output[abi:nn180100]<char,std::char_traits<char>>(v7, a2, v9, v8, v6, (char)v10)) {
      std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)),  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24LL) + 32) | 5);
    }
  }

  MEMORY[0x186E1A1E4](v13);
  return a1;
}

uint64_t std::__pad_and_output[abi:nn180100]<char,std::char_traits<char>>( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0LL;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:nn180100](__p, v12, __c);
      uint64_t v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96LL))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0LL;
      }
    }

    uint64_t v15 = a4 - a3;
    else {
      return 0LL;
    }
  }

  return v6;
}

void *std::string::basic_string[abi:nn180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8LL) {
    abort();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000LL;
    *__b = v6;
  }

  else
  {
    *((_BYTE *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }

  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void *std::string::basic_string[abi:nn180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    abort();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

BOOL CFBookmarkHeader::validate(CFBookmarkHeader *this)
{
  BOOL v1 = *(_DWORD *)this == 1936288865 || *(_DWORD *)this == 1802465122;
  return v1 && *((_DWORD *)this + 3) >= 0x10u && bookmarkVersionOK(*((_DWORD *)this + 2));
}

void BookmarkData::BookmarkData(BookmarkData *this, const __CFAllocator *a2, CFTypeRef cf)
{
  *(void *)this = a2;
  size_t v4 = (char *)this + 8;
  if (cf)
  {
    CFRetain(cf);
    *((void *)this + 1) = cf;
    *((void *)this + 2) = 0LL;
    uint64_t v6 = (CFBookmarkHeader **)((char *)this + 16);
    *((void *)this + 3) = CFDataGetBytePtr((CFDataRef)cf);
    uint64_t v7 = (CFBookmarkHeader **)((char *)this + 24);
    uint64_t v8 = (const __CFData *)*((void *)this + 1);
    if (v8)
    {
      else {
        LODWORD(v8) = CFDataGetLength(*(CFDataRef *)v4);
      }
    }
  }

  else
  {
    LODWORD(v8) = 0;
    uint64_t v6 = (CFBookmarkHeader **)((char *)this + 16);
    uint64_t v7 = (CFBookmarkHeader **)((char *)this + 24);
    *(void *)size_t v4 = 0LL;
    *((void *)v4 + 1) = 0LL;
    *((void *)v4 + 2) = 0LL;
  }

  *((void *)this + 7) = 0LL;
  *(void *)((char *)this + 36) = 0LL;
  *((_DWORD *)this + 8) = (_DWORD)v8;
  *((void *)this + 8) = 0LL;
  *((void *)this + 6) = (char *)this + 56;
  uint64_t v9 = "invalid bookmark length";
  if (v8 >= 0x10)
  {
    int v10 = *v7;
    if (CFBookmarkHeader::validate(*v7) && (unsigned int v11 = *((_DWORD *)this + 8), *((_DWORD *)v10 + 1) <= v11))
    {
      *uint64_t v6 = v10;
      uint64_t v12 = *((unsigned int *)v10 + 3);
      if (v12 >= 0x10
        && ((v12 & 3) == 0 ? (BOOL v13 = v11 > v12) : (BOOL v13 = 0),
            v13 && (unsigned int v14 = v11 - v12, *((_DWORD *)this + 9) = v12, *((_DWORD *)this + 10) = v14, v14 >= 4)))
      {
        if (*v7) {
          unsigned int v15 = *(_DWORD *)((char *)*v7 + v12);
        }
        else {
          unsigned int v15 = 0;
        }
        uint64_t TOCAtOffset = BookmarkData::getTOCAtOffset(this, v15);
        if (!TOCAtOffset) {
          return;
        }
        uint64_t v18 = TOCAtOffset;
        uint64_t v19 = BookmarkData::getTOCAtOffset(this, *(_DWORD *)(TOCAtOffset + 12));
        uint64_t v9 = "invalid TOC: cycle";
        while (!v19 || v18 != v19)
        {
          uint64_t v20 = *(unsigned int *)(v18 + 16);
          if ((_DWORD)v20)
          {
            v21 = (unsigned int *)(v18 + 24);
            while (1)
            {
              unsigned int v22 = *v21;
              v21 += 3;
              if (!BookmarkData::getDataItemAtOffset(this, v22)) {
                break;
              }
              if (!--v20) {
                goto LABEL_38;
              }
            }

            uint64_t v9 = "invalid data item pointer";
            break;
          }

LABEL_38:
          uint64_t v18 = BookmarkData::getTOCAtOffset(this, *(_DWORD *)(v18 + 12));
          if (v19)
          {
            uint64_t v23 = BookmarkData::getTOCAtOffset(this, *(_DWORD *)(v19 + 12));
            if (v23) {
              uint64_t v19 = BookmarkData::getTOCAtOffset(this, *(_DWORD *)(v23 + 12));
            }
            else {
              uint64_t v19 = 0LL;
            }
          }

          if (!v18) {
            return;
          }
        }
      }

      else
      {
        uint64_t v9 = "invalid data section length";
      }
    }

    else if (!CFBookmarkHeader::validate(v10))
    {
      uint64_t v9 = "invalid header";
    }
  }

  if (*(void *)v4)
  {
    CFRelease(*(CFTypeRef *)v4);
    *(void *)size_t v4 = 0LL;
  }

  *((void *)this + 2) = 0LL;
  *((void *)this + 3) = 0LL;
  *((_DWORD *)this + 10) = 0;
  *((void *)this + 4) = 0LL;
  v16 = (os_log_s *)bmarkLog;
  if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_ERROR)) {
    BookmarkData::BookmarkData((uint64_t)v9, v16);
  }
}

uint64_t BookmarkData::getTOCAtOffset(BookmarkData *this, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  unint64_t v2 = *((unsigned int *)this + 10);
  unint64_t v3 = a2 + 20LL;
  if (v2 >= a2)
  {
    BOOL v4 = v3 >= v2;
    BOOL v5 = v3 == v2;
  }

  else
  {
    BOOL v4 = 1;
    BOOL v5 = 0;
  }

  if (!v5 && v4) {
    return 0LL;
  }
  uint64_t v6 = *((unsigned int *)this + 9);
  if ((((_BYTE)v6 + (_BYTE)a2) & 3) != 0) {
    return 0LL;
  }
  uint64_t v7 = *((void *)this + 3) + v6 + a2;
  if (*(_DWORD *)(v7 + 4) != -2) {
    return 0LL;
  }
  unsigned int v8 = *(_DWORD *)(v7 + 16);
  if (v8 > 0x15555552) {
    return 0LL;
  }
  return 0LL;
}

unsigned int *BookmarkData::getDataItemAtOffset(BookmarkData *this, unsigned int a2)
{
  unint64_t v2 = *((unsigned int *)this + 10);
  uint64_t v4 = *((unsigned int *)this + 9);
  if ((((_BYTE)v4 + (_BYTE)a2) & 3) != 0) {
    return 0LL;
  }
  uint64_t v6 = *((void *)this + 3);
  if (!v6) {
    return 0LL;
  }
  uint64_t v7 = (unsigned int *)(v6 + v4 + a2);
  uint64_t v8 = *v7;
  return 0LL;
}

void BookmarkData::~BookmarkData(BookmarkData *this)
{
  unint64_t v2 = (char *)this + 48;
  unint64_t v3 = (char *)*((void *)this + 6);
  uint64_t v4 = (char *)this + 56;
  if (v3 != (char *)this + 56)
  {
    do
    {
      BOOL v5 = (const void *)*((void *)v3 + 5);
      if (v5)
      {
        CFRelease(v5);
        *((void *)v3 + 5) = 0LL;
      }

      uint64_t v6 = (char *)*((void *)v3 + 1);
      if (v6)
      {
        do
        {
          uint64_t v7 = v6;
          uint64_t v6 = *(char **)v6;
        }

        while (v6);
      }

      else
      {
        do
        {
          uint64_t v7 = (char *)*((void *)v3 + 2);
          BOOL v8 = *(void *)v7 == (void)v3;
          unint64_t v3 = v7;
        }

        while (!v8);
      }

      unint64_t v3 = v7;
    }

    while (v7 != v4);
  }

  uint64_t v9 = (const void *)*((void *)this + 1);
  if (v9)
  {
    CFRelease(v9);
    *((void *)this + 1) = 0LL;
  }

  std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::destroy( (uint64_t)v2,  *((void **)this + 7));
}

uint64_t BookmarkData::dataSectionAtOffset(BookmarkData *this, unsigned int a2, unsigned int a3)
{
  unint64_t v3 = *((unsigned int *)this + 10);
  uint64_t v5 = *((unsigned int *)this + 9);
  if ((((_BYTE)v5 + (_BYTE)a2) & 3) != 0) {
    return 0LL;
  }
  else {
    return *((void *)this + 3) + v5 + a2;
  }
}

unsigned int *BookmarkData::getDataItemForTOCItem(BookmarkData *a1, uint64_t a2)
{
  if (a2) {
    return BookmarkData::getDataItemAtOffset(a1, *(_DWORD *)(a2 + 4));
  }
  else {
    return 0LL;
  }
}

CFNumberRef BookmarkData::copyItem(CFAllocatorRef *a1, unsigned int *a2, uint64_t a3)
{
  v6[0] = 0LL;
  v6[1] = 0LL;
  uint64_t v5 = v6;
  CFNumberRef v3 = BookmarkData::copyItem(a1, a2, (uint64_t)&v5, a3);
  std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::destroy( (uint64_t)&v5,  v6[0]);
  return v3;
}

CFNumberRef BookmarkData::copyItem(CFAllocatorRef *a1, unsigned int *a2, uint64_t a3, uint64_t a4)
{
  v95 = a2;
  if (!a2) {
    return 0LL;
  }
  BOOL v8 = *(void **)(a3 + 8);
  if (v8)
  {
    uint64_t v9 = a3 + 8;
    do
    {
      unint64_t v10 = v8[4];
      BOOL v11 = v10 >= (unint64_t)a2;
      else {
        uint64_t v12 = v8 + 1;
      }
      if (v11) {
        uint64_t v9 = (uint64_t)v8;
      }
      BOOL v8 = (void *)*v12;
    }

    while (*v12);
    if (v9 != a3 + 8 && *(void *)(v9 + 32) <= (unint64_t)a2)
    {
      uint64_t v19 = (os_log_s *)bmarkLog;
      if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_ERROR)) {
        BookmarkData::copyItem((uint64_t)a2, v19);
      }
      return 0LL;
    }
  }

  CFNumberRef v13 = 0LL;
  CFIndex v14 = *a2;
  int v15 = a2[1];
  if (v15 <= 1023)
  {
    switch(v15)
    {
      case 769:
        if (!(_DWORD)v14) {
          goto LABEL_95;
        }
        LOBYTE(__p) = *((_BYTE *)a2 + 8);
        v16 = *a1;
        CFNumberType v17 = kCFNumberSInt8Type;
        goto LABEL_196;
      case 770:
        LOWORD(__p) = *((_WORD *)a2 + 4);
        v16 = *a1;
        CFNumberType v17 = kCFNumberSInt16Type;
        goto LABEL_196;
      case 771:
        LODWORD(__p) = a2[2];
        v16 = *a1;
        CFNumberType v17 = kCFNumberSInt32Type;
        goto LABEL_196;
      case 772:
        __p = *((void **)a2 + 1);
        v16 = *a1;
        CFNumberType v17 = kCFNumberSInt64Type;
        goto LABEL_196;
      case 773:
        LODWORD(__p) = a2[2];
        v16 = *a1;
        CFNumberType v17 = kCFNumberFloat32Type;
        goto LABEL_196;
      case 774:
        __p = *((void **)a2 + 1);
        v16 = *a1;
        CFNumberType v17 = kCFNumberFloat64Type;
        goto LABEL_196;
      case 775:
        if (!(_DWORD)v14) {
          goto LABEL_95;
        }
        LOBYTE(__p) = *((_BYTE *)a2 + 8);
        v16 = *a1;
        CFNumberType v17 = kCFNumberCharType;
        goto LABEL_196;
      case 776:
        LOWORD(__p) = *((_WORD *)a2 + 4);
        v16 = *a1;
        CFNumberType v17 = kCFNumberShortType;
        goto LABEL_196;
      case 777:
        LODWORD(__p) = a2[2];
        v16 = *a1;
        CFNumberType v17 = kCFNumberIntType;
        goto LABEL_196;
      case 778:
        if ((_DWORD)v14 == 8)
        {
          CFAbsoluteTime v40 = (void *)*((void *)a2 + 1);
        }

        else
        {
          if ((_DWORD)v14 != 4) {
            return 0LL;
          }
          CFAbsoluteTime v40 = (void *)(int)a2[2];
        }

        __p = v40;
        v16 = *a1;
        CFNumberType v17 = kCFNumberLongType;
        goto LABEL_196;
      case 779:
        __p = *((void **)a2 + 1);
        v16 = *a1;
        CFNumberType v17 = kCFNumberLongLongType;
        goto LABEL_196;
      case 780:
        LODWORD(__p) = a2[2];
        v16 = *a1;
        CFNumberType v17 = kCFNumberFloatType;
        goto LABEL_196;
      case 781:
        if (v14 >= 8)
        {
          __p = *((void **)a2 + 1);
          v16 = *a1;
          CFNumberType v17 = kCFNumberDoubleType;
          goto LABEL_196;
        }

LABEL_95:
        CFNumberRef v13 = 0LL;
        if (a4) {
          goto LABEL_198;
        }
        return v13;
      case 782:
        if ((_DWORD)v14 == 8)
        {
          v41 = (void *)*((void *)a2 + 1);
        }

        else
        {
          if ((_DWORD)v14 != 4) {
            return 0LL;
          }
          v41 = (void *)(int)a2[2];
        }

        __p = v41;
        v16 = *a1;
        CFNumberType v17 = kCFNumberCFIndexType;
        goto LABEL_196;
      case 783:
        if ((_DWORD)v14 == 8)
        {
          v42 = (void *)*((void *)a2 + 1);
        }

        else
        {
          if ((_DWORD)v14 != 4) {
            return 0LL;
          }
          v42 = (void *)(int)a2[2];
        }

        __p = v42;
        v16 = *a1;
        CFNumberType v17 = kCFNumberNSIntegerType;
        goto LABEL_196;
      case 784:
        if ((_DWORD)v14 == 8)
        {
          __p = *((void **)a2 + 1);
        }

        else
        {
          if ((_DWORD)v14 != 4) {
            return 0LL;
          }
          *(double *)&__p = *((float *)a2 + 2);
        }

        v16 = *a1;
        CFNumberType v17 = kCFNumberCGFloatType;
LABEL_196:
        CFNumberRef v13 = CFNumberCreate(v16, v17, &__p);
        goto LABEL_197;
      default:
        if (v15 == 257)
        {
          uint64_t v20 = (const __CFNumber *)CFStringCreateWithBytes(*a1, (const UInt8 *)a2 + 8, v14, 0x8000100u, 0);
        }

        else
        {
          if (v15 != 513) {
            return v13;
          }
          uint64_t v20 = CFDataCreate(*a1, (const UInt8 *)a2 + 8, v14);
        }

        break;
    }

  v59 = *(_DWORD *)a6 | 8;
  *(_DWORD *)a6 = v59;
  if ((v16 & 0x200000) != 0)
  {
    uint64_t v61 = *v43++;
    uint64_t v60 = v61;
  }

  else
  {
    uint64_t v60 = 0;
  }

  *(_DWORD *)a6 = v59 & 0xFC7FFFFF | ((v60 & 7) << 23);
LABEL_99:
  v138 = 0LL;
  if ((v10 & 0x400000) == 0 || (v16 & 0x400000) == 0)
  {
    v62 = v43;
    if ((v16 & 0x800000) != 0) {
      goto LABEL_109;
    }
    goto LABEL_105;
  }

  v62 = v43 + 2;
  if (!v43[1])
  {
    v138 = 0LL;
    if ((v16 & 0x800000) != 0) {
      goto LABEL_109;
    }
LABEL_105:
    v134 = 0LL;
    if ((v16 & 0x1000000) == 0) {
      goto LABEL_110;
    }
    goto LABEL_106;
  }

  v63 = v27;
  uint64_t v64 = acl_copy_int_native((char *)v43 + *v43);
  uint64_t v27 = v63;
  v138 = v64;
  if ((v16 & 0x800000) == 0) {
    goto LABEL_105;
  }
LABEL_109:
  uint64_t v66 = *(_OWORD *)v62;
  v62 += 4;
  v145 = v66;
  v134 = (const unsigned __int8 *)&v145;
  if ((v16 & 0x1000000) == 0)
  {
LABEL_110:
    v132 = 0LL;
    if ((v10 & 0x2000000) == 0) {
      goto LABEL_113;
    }
    goto LABEL_111;
  }

LABEL_115:
    CFNumberRef v13 = v20;
    if (!a4) {
      return v13;
    }
    goto LABEL_198;
  }

  if (v15 <= 1792)
  {
    if (v15 > 1280)
    {
      if (v15 != 1281)
      {
        if (v15 != 1537) {
          return v13;
        }
        unsigned int v21 = v14 >> 2;
        *(double *)&__p = 0.0;
        v93 = 0LL;
        v94 = 0LL;
        std::__tree<CFBookmarkDataItem const*>::__emplace_unique_key_args<CFBookmarkDataItem const*,CFBookmarkDataItem const* const&>( (uint64_t **)a3,  (unint64_t *)&v95,  (uint64_t *)&v95);
        uint64_t v22 = 0LL;
        if (v21 <= 1) {
          uint64_t v23 = 1LL;
        }
        else {
          uint64_t v23 = v21;
        }
        do
        {
          if (v95)
          {
            if (4 * v22 + 4 <= (unint64_t)*v95)
            {
              DataItemAtOffset = BookmarkData::getDataItemAtOffset((BookmarkData *)a1, v95[v22 + 2]);
              if (DataItemAtOffset)
              {
                uint64_t v25 = BookmarkData::copyItem(a1, DataItemAtOffset, a3, 0LL);
                if (v25)
                {
                  uint64_t v26 = v25;
                  uint64_t v27 = v93;
                  if (v93 >= (uint64_t *)v94)
                  {
                    uint64_t v29 = ((char *)v93 - (_BYTE *)__p) >> 3;
                    if ((unint64_t)(v29 + 1) >> 61) {
LABEL_210:
                    }
                      abort();
                    unint64_t v30 = (v94 - (_BYTE *)__p) >> 2;
                    if (v30 <= v29 + 1) {
                      unint64_t v30 = v29 + 1;
                    }
                    else {
                      unint64_t v31 = v30;
                    }
                    if (v31) {
                      v32 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<void const*>>( (uint64_t)&v94,  v31);
                    }
                    else {
                      v32 = 0LL;
                    }
                    v33 = (uint64_t *)&v32[8 * v29];
                    uint64_t *v33 = v26;
                    v28 = v33 + 1;
                    v35 = (char *)__p;
                    uint64_t v34 = (char *)v93;
                    if (v93 != __p)
                    {
                      do
                      {
                        uint64_t v36 = *((void *)v34 - 1);
                        v34 -= 8;
                        *--v33 = v36;
                      }

                      while (v34 != v35);
                      uint64_t v34 = (char *)__p;
                    }

                    __p = v33;
                    v93 = v28;
                    v94 = &v32[8 * v31];
                    if (v34) {
                      operator delete(v34);
                    }
                  }

                  else
                  {
                    uint64_t *v93 = v25;
                    v28 = v27 + 1;
                  }

                  v93 = v28;
                }
              }
            }
          }

          ++v22;
        }

        while (v22 != v23);
        std::__tree<CFBookmarkDataItem const*>::__erase_unique<CFBookmarkDataItem const*>(a3, (unint64_t *)&v95);
        CFNumberRef v13 = CFArrayCreate(*a1, (const void **)__p, ((char *)v93 - (_BYTE *)__p) >> 3, MEMORY[0x189605228]);
        v38 = (CFTypeRef *)__p;
        v37 = v93;
        if (__p < v93)
        {
          do
          {
            if (*v38)
            {
              CFRelease(*v38);
              CFTypeRef *v38 = 0LL;
              v37 = v93;
            }

            ++v38;
          }

          while (v38 < (CFTypeRef *)v37);
          v38 = (CFTypeRef *)__p;
        }

        if (v38)
        {
          v93 = (uint64_t *)v38;
          size_t v39 = v38;
          goto LABEL_186;
        }

        goto LABEL_197;
      }

      uint64_t v18 = (CFNumberRef *)MEMORY[0x189604DE8];
    }

    else
    {
      if (v15 == 1024)
      {
        if (v14 >= 8)
        {
          uint64_t v20 = CFDateCreate(*a1, COERCE_CFABSOLUTETIME(bswap64(*((void *)a2 + 1))));
          goto LABEL_115;
        }

        return 0LL;
      }

      if (v15 != 1280) {
        return v13;
      }
      uint64_t v18 = (CFNumberRef *)MEMORY[0x189604DE0];
    }

    if ((v10 & 0x10000000) == 0) {
      goto LABEL_116;
    }
    goto LABEL_133;
  }

  v87 = 0;
LABEL_113:
  MountInfoDestroy(v96);
  uint64_t v23 = v87;
LABEL_114:
  _FileCacheUnlock(a2);
  return v23;
}

LABEL_174:
    CFNumberRef v13 = *v18;
    if (!a4) {
      return v13;
    }
    goto LABEL_198;
  }

  if (v15 > 2304)
  {
    if (v15 != 2305)
    {
      if (v15 != 2306)
      {
        if (v15 != 2561) {
          return v13;
        }
        uint64_t v18 = (CFNumberRef *)MEMORY[0x189605018];
        goto LABEL_174;
      }

      if (v14 >= 8)
      {
        std::__tree<CFBookmarkDataItem const*>::__emplace_unique_key_args<CFBookmarkDataItem const*,CFBookmarkDataItem const* const&>( (uint64_t **)a3,  (unint64_t *)&v95,  (uint64_t *)&v95);
        v45 = BookmarkData::getDataItemAtOffset((BookmarkData *)a1, a2[2]);
        v46 = BookmarkData::getDataItemAtOffset((BookmarkData *)a1, a2[3]);
        CFTypeID v47 = CFURLGetTypeID();
        v48 = (const __CFURL *)BookmarkData::copyItem(a1, v45, a3, v47);
        CFTypeID TypeID = CFStringGetTypeID();
        v50 = (const __CFString *)BookmarkData::copyItem(a1, v46, a3, TypeID);
        std::__tree<CFBookmarkDataItem const*>::__erase_unique<CFBookmarkDataItem const*>(a3, (unint64_t *)&v95);
        if (!v48)
        {
          if (!v50) {
            return 0LL;
          }
          v86 = v50;
          goto LABEL_201;
        }

        if (v50)
        {
          CFNumberRef v13 = CFURLCreateWithString(*a1, v50, v48);
          CFRelease(v50);
        }

        else
        {
          CFNumberRef v13 = 0LL;
        }

        v44 = v48;
        goto LABEL_208;
      }

      return 0LL;
    }

    v43 = CFStringCreateWithBytes(*a1, (const UInt8 *)a2 + 8, v14, 0x8000100u, 0);
    CFNumberRef v13 = CFURLCreateWithString(*a1, v43, 0LL);
    if (v43)
    {
      v44 = v43;
LABEL_208:
      CFRelease(v44);
      if (!a4) {
        return v13;
      }
      goto LABEL_198;
    }

  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
  {
    createByResolvingBookmarkDataInternal();
    if (!a7) {
      goto LABEL_181;
    }
  }

  else if (!a7)
  {
    goto LABEL_181;
  }

  if (!v23)
  {
    v69 = (__CFError *)cf;
    if (cf) {
      cf = 0LL;
    }
    else {
      v69 = CFErrorCreate(a1, (CFErrorDomain)*MEMORY[0x189604F40], 4LL, 0LL);
    }
    *a7 = v69;
  }

LABEL_197:
    if (!a4) {
      return v13;
    }
    goto LABEL_198;
  }

  if (v15 != 1793)
  {
    if (v15 != 2049) {
      return v13;
    }
    if ((_DWORD)v14 == 16)
    {
      *(void *)byte7 = *(void *)((char *)a2 + 15);
      uint64_t v20 = CFUUIDCreateWithBytes( *a1,  *((_BYTE *)a2 + 8),  *((_BYTE *)a2 + 9),  *((_BYTE *)a2 + 10),  *((_BYTE *)a2 + 11),  *((_BYTE *)a2 + 12),  *((_BYTE *)a2 + 13),  *((_BYTE *)a2 + 14),  byte7[0],  byte7[1],  byte7[2],  byte7[3],  byte7[4],  byte7[5],  byte7[6],  byte7[7],  *((_BYTE *)a2 + 23));
      goto LABEL_115;
    }

    return 0LL;
  }

  unsigned int v51 = v14 >> 3;
  *(double *)&__p = 0.0;
  v93 = 0LL;
  v94 = 0LL;
  values = 0LL;
  v90 = 0LL;
  v91 = 0LL;
  std::__tree<CFBookmarkDataItem const*>::__emplace_unique_key_args<CFBookmarkDataItem const*,CFBookmarkDataItem const* const&>( (uint64_t **)a3,  (unint64_t *)&v95,  (uint64_t *)&v95);
  uint64_t v52 = 0LL;
  if (v51 <= 1) {
    uint64_t v53 = 1LL;
  }
  else {
    uint64_t v53 = v51;
  }
  do
  {
    v54 = v95;
    if (!v95) {
      goto LABEL_167;
    }
    uint64_t v55 = 2 * v52;
    unint64_t v56 = *v95;
    unint64_t v57 = (8 * v52) | 4;
    v58 = v57 <= v56 ? BookmarkData::getDataItemAtOffset((BookmarkData *)a1, v95[v55 + 2]) : 0LL;
    if (v55 * 4 + 8 > v56) {
      goto LABEL_167;
    }
    v59 = BookmarkData::getDataItemAtOffset((BookmarkData *)a1, *(unsigned int *)((char *)v54 + v57 + 8));
    if (!v58) {
      goto LABEL_167;
    }
    uint64_t v60 = v59;
    if (!v59) {
      goto LABEL_167;
    }
    uint64_t v61 = BookmarkData::copyItem(a1, v58, a3, 0LL);
    v62 = (void *)BookmarkData::copyItem(a1, v60, a3, 0LL);
    v63 = v62;
    if (!v61)
    {
      if (!v62) {
        goto LABEL_167;
      }
      goto LABEL_135;
    }

    if (!v62)
    {
      v62 = (void *)v61;
LABEL_135:
      CFRelease(v62);
      goto LABEL_167;
    }

    uint64_t v64 = v93;
    if (v93 >= (uint64_t *)v94)
    {
      uint64_t v66 = ((char *)v93 - (_BYTE *)__p) >> 3;
      unint64_t v67 = (v94 - (_BYTE *)__p) >> 2;
      if (v67 <= v66 + 1) {
        unint64_t v67 = v66 + 1;
      }
      else {
        unint64_t v68 = v67;
      }
      if (v68) {
        v69 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<void const*>>((uint64_t)&v94, v68);
      }
      else {
        v69 = 0LL;
      }
      v70 = (uint64_t *)&v69[8 * v66];
      uint64_t *v70 = v61;
      v65 = v70 + 1;
      v72 = (char *)__p;
      unsigned __int8 v71 = (char *)v93;
      if (v93 != __p)
      {
        do
        {
          uint64_t v73 = *((void *)v71 - 1);
          v71 -= 8;
          *--v70 = v73;
        }

        while (v71 != v72);
        unsigned __int8 v71 = (char *)__p;
      }

      __p = v70;
      v93 = v65;
      v94 = &v69[8 * v68];
      if (v71) {
        operator delete(v71);
      }
    }

    else
    {
      uint64_t *v93 = v61;
      v65 = v64 + 1;
    }

    v93 = v65;
    if (v90 >= v91)
    {
      uint64_t v75 = v90 - values;
      unint64_t v76 = ((char *)v91 - (char *)values) >> 2;
      if (v76 <= v75 + 1) {
        unint64_t v76 = v75 + 1;
      }
      else {
        unint64_t v77 = v76;
      }
      if (v77) {
        v78 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<void const*>>((uint64_t)&v91, v77);
      }
      else {
        v78 = 0LL;
      }
      uint64_t v79 = (void **)&v78[8 * v75];
      *uint64_t v79 = v63;
      unsigned __int8 v74 = v79 + 1;
      unsigned __int8 v80 = v90;
      if (v90 != values)
      {
        do
        {
          uint64_t v81 = *--v80;
          *--uint64_t v79 = v81;
        }

        while (v80 != values);
        unsigned __int8 v80 = values;
      }

      values = v79;
      v91 = (void **)&v78[8 * v77];
      if (v80) {
        operator delete(v80);
      }
    }

    else
    {
      *v90 = v63;
      unsigned __int8 v74 = v90 + 1;
    }

    v90 = v74;
LABEL_167:
    ++v52;
  }

  while (v52 != v53);
  std::__tree<CFBookmarkDataItem const*>::__erase_unique<CFBookmarkDataItem const*>(a3, (unint64_t *)&v95);
  CFNumberRef v13 = CFDictionaryCreate( *a1,  (const void **)__p,  (const void **)values,  ((char *)v93 - (_BYTE *)__p) >> 3,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  v83 = (CFTypeRef *)__p;
  CFRange v82 = (CFTypeRef *)v93;
  while (v83 != v82)
  {
    if (*v83)
    {
      CFRelease(*v83);
      CFTypeRef *v83 = 0LL;
      CFRange v82 = (CFTypeRef *)v93;
    }

    ++v83;
  }

  v85 = (CFTypeRef *)values;
  v84 = (CFTypeRef *)v90;
  if (values != v90)
  {
    do
    {
      if (*v85)
      {
        CFRelease(*v85);
        CFTypeRef *v85 = 0LL;
        v84 = (CFTypeRef *)v90;
      }

      ++v85;
    }

    while (v85 != v84);
    v85 = (CFTypeRef *)values;
  }

  if (v85) {
    operator delete(v85);
  }
  size_t v39 = __p;
  v93 = (uint64_t *)__p;
LABEL_186:
  operator delete(v39);
  if (a4)
  {
LABEL_198:
    if (!v13 || CFGetTypeID(v13) == a4) {
      return v13;
    }
    v86 = v13;
LABEL_201:
    CFRelease(v86);
    return 0LL;
  }

  return v13;
}

CFTypeRef BookmarkData::copyItemFromCache(BookmarkData *this, unsigned int a2, unsigned int a3)
{
  CFTypeRef v3 = 0LL;
  if (a2 && a3)
  {
    v7[0] = a2;
    v7[1] = a3;
    uint64_t v5 = (CFTypeRef *)std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::find<std::pair<unsigned int,unsigned int>>( (uint64_t)this + 48,  v7);
    if ((CFTypeRef *)((char *)this + 56) == v5)
    {
      return 0LL;
    }

    else
    {
      CFTypeRef v3 = v5[5];
      if (v3) {
        CFRetain(v5[5]);
      }
    }
  }

  return v3;
}

uint64_t BookmarkData::addItemToCache(BookmarkData *this, unsigned int a2, unsigned int a3, const void *a4)
{
  if (a2 && a3)
  {
    unint64_t v11 = __PAIR64__(a3, a2);
    uint64_t v6 = (uint64_t **)((char *)this + 48);
    uint64_t v7 = std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::find<std::pair<unsigned int,unsigned int>>( (uint64_t)this + 48,  (unsigned int *)&v11);
    if ((uint64_t *)((char *)this + 56) == v7)
    {
      if (a4) {
        CFRetain(a4);
      }
      *(void *)&__int128 v10 = v11;
      *((void *)&v10 + 1) = a4;
      std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::__emplace_unique_key_args<std::pair<unsigned int,unsigned int>,std::pair<std::pair<unsigned int,unsigned int> const,void const*> const&>( v6,  (unsigned int *)&v10,  &v10);
    }

    else
    {
      BOOL v8 = (const void *)v7[5];
      if (v8 != a4)
      {
        if (a4) {
          CFRetain(a4);
        }
        *(void *)&__int128 v10 = v11;
        *((void *)&v10 + 1) = a4;
        std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::__emplace_unique_key_args<std::pair<unsigned int,unsigned int>,std::pair<std::pair<unsigned int,unsigned int> const,void const*> const&>( v6,  (unsigned int *)&v10,  &v10);
        if (v8) {
          CFRelease(v8);
        }
      }
    }
  }

  return 0LL;
}

const void *BookmarkData::copyItem(BookmarkData *this, unsigned int a2, unsigned int a3, uint64_t a4)
{
  BOOL v8 = BookmarkData::copyItemFromCache(this, a2, a3);
  if (!v8)
  {
    uint64_t ItemInTOC = BookmarkData::findItemInTOC(this, a2, a3);
    if (ItemInTOC)
    {
      BOOL v8 = BookmarkData::copyDataItemAtOffset(this, *(_DWORD *)(ItemInTOC + 4), a4);
      if (v8) {
        BookmarkData::addItemToCache(this, a2, a3, v8);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v8;
}

uint64_t BookmarkData::findItemInTOC(BookmarkData *this, unsigned int a2, int a3)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t FirstTOC = BookmarkData::getFirstTOC(this, a3);
  if (!FirstTOC) {
    return 0LL;
  }
  uint64_t v7 = FirstTOC;
  do
  {
    if (a3 && *(_DWORD *)(v7 + 8) != a3) {
      uint64_t ItemInSingleTOCByItemType = 0LL;
    }
    else {
      uint64_t ItemInSingleTOCByItemType = BookmarkData::findItemInSingleTOCByItemType(FirstTOC, v7, a2);
    }
    uint64_t FirstTOC = BookmarkData::getTOCAtOffset(this, *(_DWORD *)(v7 + 12));
    BOOL v9 = FirstTOC != 0 && FirstTOC != v7;
    if (FirstTOC != 0 && FirstTOC != v7) {
      uint64_t v7 = FirstTOC;
    }
    else {
      uint64_t v7 = 0LL;
    }
  }

  while (v9 && ItemInSingleTOCByItemType == 0);
  return ItemInSingleTOCByItemType;
}

CFNumberRef BookmarkData::copyItem(BookmarkData *a1, uint64_t a2, uint64_t a3)
{
  return BookmarkData::copyDataItemAtOffset(a1, *(_DWORD *)(a2 + 4), a3);
}

CFNumberRef BookmarkData::copyItem(BookmarkData *this, const __CFString *a2, int a3, uint64_t a4)
{
  CFNumberRef result = (CFNumberRef)BookmarkData::findItemInTOC(this, a2, a3);
  if (result) {
    return BookmarkData::copyDataItemAtOffset(this, *((_DWORD *)result + 1), a4);
  }
  return result;
}

uint64_t BookmarkData::findItemInTOC(BookmarkData *this, CFStringRef theString, int a3)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (!theString) {
    return 0LL;
  }
  CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
  if (CStringPtr)
  {
    uint64_t v7 = (UInt8 *)CStringPtr;
    CFIndex Length = CFStringGetLength(theString);
    BOOL v9 = 0LL;
    CFIndex usedBufLen = Length;
  }

  else
  {
    CFIndex usedBufLen = 0LL;
    v21.CFIndex length = CFStringGetLength(theString);
    uint64_t v7 = buffer;
    v21.CFIndex location = 0LL;
    if (CFStringGetBytes(theString, v21, 0x8000100u, 0, 0, buffer, 128LL, &usedBufLen))
    {
      BOOL v9 = 0LL;
    }

    else
    {
      CFIndex maxBufLen = 0LL;
      v22.CFIndex length = CFStringGetLength(theString);
      v22.CFIndex location = 0LL;
      if (CFStringGetBytes(theString, v22, 0x8000100u, 0, 0, 0LL, 0LL, &maxBufLen))
      {
        uint64_t v7 = (UInt8 *)malloc(maxBufLen);
        v23.CFIndex length = CFStringGetLength(theString);
        v23.CFIndex location = 0LL;
        if (!CFStringGetBytes(theString, v23, 0x8000100u, 0, 0, v7, maxBufLen, &usedBufLen)) {
          CFIndex usedBufLen = 0LL;
        }
      }

      else
      {
        uint64_t v7 = 0LL;
      }

      BOOL v9 = v7;
    }
  }

  uint64_t ItemInSingleTOCByKeyStringBytes = 0LL;
  if (v7)
  {
    size_t v11 = usedBufLen;
    if (usedBufLen >= 1)
    {
      uint64_t FirstTOC = BookmarkData::getFirstTOC(this, a3);
      if (!FirstTOC)
      {
        uint64_t ItemInSingleTOCByKeyStringBytes = 0LL;
        if (!v9) {
          return ItemInSingleTOCByKeyStringBytes;
        }
        goto LABEL_24;
      }

      uint64_t v13 = FirstTOC;
      uint64_t ItemInSingleTOCByKeyStringBytes = 0LL;
      do
      {
        if (*(_DWORD *)(v13 + 8) == a3) {
          uint64_t ItemInSingleTOCByKeyStringBytes = BookmarkData::findItemInSingleTOCByKeyStringBytes(this, v13, v7, v11);
        }
        uint64_t TOCAtOffset = BookmarkData::getTOCAtOffset(this, *(_DWORD *)(v13 + 12));
        if (TOCAtOffset) {
          BOOL v15 = TOCAtOffset == v13;
        }
        else {
          BOOL v15 = 1;
        }
        uint64_t v13 = TOCAtOffset;
      }

      while (!v15);
    }
  }

  if (v9) {
LABEL_24:
  }
    free(v9);
  return ItemInSingleTOCByKeyStringBytes;
}

CFNumberRef BookmarkData::copyDataItemAtOffset(BookmarkData *this, unsigned int a2, uint64_t a3)
{
  DataItemAtOffset = BookmarkData::getDataItemAtOffset(this, a2);
  v9[0] = 0LL;
  v9[1] = 0LL;
  BOOL v8 = v9;
  CFNumberRef v6 = BookmarkData::copyItem((CFAllocatorRef *)this, DataItemAtOffset, (uint64_t)&v8, a3);
  std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::destroy( (uint64_t)&v8,  v9[0]);
  return v6;
}

BOOL BookmarkData::getItemAs(BookmarkData *this, unsigned int a2, int a3, unsigned int *a4)
{
  uint64_t ItemInTOC = BookmarkData::findItemInTOC(this, a2, a3);
  if (!ItemInTOC) {
    return 0LL;
  }
  unsigned int v7 = *(_DWORD *)(ItemInTOC + 4);
  DataItemAtOffset = BookmarkData::getDataItemAtOffset(this, v7);
  if (!DataItemAtOffset) {
    return 0LL;
  }
  unsigned int v9 = DataItemAtOffset[1];
  if (v9 != 771 && v9 != 513)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    uint64_t v12 = BookmarkData::copyDataItemAtOffset(this, v7, TypeID);
    if (v12)
    {
      uint64_t v13 = v12;
      BOOL v10 = CFNumberGetValue(v12, kCFNumberSInt32Type, a4) != 0;
      CFRelease(v13);
      return v10;
    }

    return 0LL;
  }

  if (*DataItemAtOffset != 4) {
    return 0LL;
  }
  *a4 = DataItemAtOffset[2];
  return 1LL;
}

uint64_t BookmarkData::getItemAs(BookmarkData *this, unsigned int a2, int a3, BOOL *a4)
{
  uint64_t result = BookmarkData::findItemInTOC(this, a2, a3);
  if (result)
  {
    uint64_t result = (uint64_t)BookmarkData::getDataItemAtOffset(this, *(_DWORD *)(result + 4));
    if (result)
    {
      int v7 = *(_DWORD *)(result + 4);
      if (v7 == 1281)
      {
        BOOL v8 = 1;
        goto LABEL_7;
      }

      if (v7 == 1280)
      {
        BOOL v8 = 0;
LABEL_7:
        *a4 = v8;
        return 1LL;
      }

      return 0LL;
    }
  }

  return result;
}

BOOL BookmarkData::getURLResourceProperties(BookmarkData *a1, int a2, uint64_t a3)
{
  MisalignedItemDataPtr = BookmarkData::getMisalignedItemDataPtr(a1, 0x1010u, 0x18u, a2, &v7);
  if (MisalignedItemDataPtr)
  {
    __int128 v5 = *(_OWORD *)MisalignedItemDataPtr;
    *(void *)(a3 + 16) = *((void *)MisalignedItemDataPtr + 2);
    *(_OWORD *)a3 = v5;
  }

  return MisalignedItemDataPtr != 0LL;
}

unsigned int *BookmarkData::getMisalignedItemDataPtr( BookmarkData *this, unsigned int a2, unsigned int a3, int a4)
{
  return BookmarkData::getMisalignedItemDataPtr(this, a2, a3, a4, &v5);
}

BOOL BookmarkData::getURLVolumeProperties(BookmarkData *a1, int a2, uint64_t a3)
{
  MisalignedItemDataPtr = BookmarkData::getMisalignedItemDataPtr(a1, 0x2020u, 0x18u, a2, &v7);
  if (MisalignedItemDataPtr)
  {
    __int128 v5 = *(_OWORD *)MisalignedItemDataPtr;
    *(void *)(a3 + 16) = *((void *)MisalignedItemDataPtr + 2);
    *(_OWORD *)a3 = v5;
  }

  return MisalignedItemDataPtr != 0LL;
}

uint64_t BookmarkData::getNextTOC(BookmarkData *a1, uint64_t a2)
{
  if (a2) {
    uint64_t result = BookmarkData::getTOCAtOffset(a1, *(_DWORD *)(a2 + 12));
  }
  else {
    uint64_t result = 0LL;
  }
  if (result == a2 || result == 0) {
    return 0LL;
  }
  return result;
}

uint64_t BookmarkData::getFirstTOC(BookmarkData *this, int a2)
{
  uint64_t v4 = *((void *)this + 3);
  if (v4) {
    unsigned int v5 = *(_DWORD *)(v4 + *((unsigned int *)this + 9));
  }
  else {
    unsigned int v5 = 0;
  }
  uint64_t TOCAtOffset = BookmarkData::getTOCAtOffset(this, v5);
  uint64_t result = 0LL;
  if (a2 && TOCAtOffset)
  {
    while (*(_DWORD *)(TOCAtOffset + 8) != a2)
    {
      uint64_t v8 = BookmarkData::getTOCAtOffset(this, *(_DWORD *)(TOCAtOffset + 12));
      if (v8) {
        BOOL v9 = v8 == TOCAtOffset;
      }
      else {
        BOOL v9 = 1;
      }
      uint64_t TOCAtOffset = v8;
      if (v9) {
        return 0LL;
      }
    }

    return TOCAtOffset;
  }

  return result;
}

_DWORD *BookmarkData::getIndexedItemInTOC(BookmarkData *this, unsigned int a2, int a3)
{
  uint64_t result = (_DWORD *)BookmarkData::getFirstTOC(this, a3);
  if (result)
  {
    unsigned int v7 = result;
    while (1)
    {
      if (!a3 || v7[2] == a3)
      {
        unsigned int v8 = v7[4];
        BOOL v9 = a2 >= v8;
        unsigned int v10 = a2 - v8;
        if (v10 == 0 || !v9)
        {
          if (v9) {
            return 0LL;
          }
          else {
            return &v7[3 * a2 + 5];
          }
        }

        a2 = v10;
      }

      uint64_t TOCAtOffset = BookmarkData::getTOCAtOffset(this, v7[3]);
      if (TOCAtOffset) {
        BOOL v12 = TOCAtOffset == (void)v7;
      }
      else {
        BOOL v12 = 1;
      }
      unsigned int v7 = (_DWORD *)TOCAtOffset;
      if (v12) {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t BookmarkData::findItemInSingleTOCByItemType(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v3 = *(_DWORD *)(a2 + 16);
  if (a3 == -1)
  {
    if (v3) {
      return a2 + 20;
    }
    else {
      return 0LL;
    }
  }

  else
  {
    uint64_t result = 0LL;
    if (a3)
    {
      if (v3)
      {
        signed int v5 = v3 - 1;
        if ((v5 & 0x80000000) == 0)
        {
          signed int v6 = 0;
          while (1)
          {
            int v7 = v6 + v5;
            if (v6 + v5 < 0 != __OFADD__(v6, v5)) {
              ++v7;
            }
            unsigned int v8 = v7 >> 1;
            uint64_t v9 = a2 + 12LL * v8;
            unsigned int v11 = *(_DWORD *)(v9 + 20);
            uint64_t result = v9 + 20;
            unsigned int v10 = v11;
            if (v11 == a3) {
              break;
            }
            if (v10 <= a3) {
              signed int v6 = v8 + 1;
            }
            else {
              signed int v5 = v8 - 1;
            }
            if (v6 > v5) {
              return 0LL;
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t BookmarkData::findItemInSingleTOCByKeyStringBytes( BookmarkData *this, uint64_t a2, const void *a3, size_t a4)
{
  uint64_t v4 = *(unsigned int *)(a2 + 16);
  if ((_DWORD)v4)
  {
    uint64_t v9 = 12 * v4;
    uint64_t v10 = a2 + 8;
    do
    {
      int v11 = *(_DWORD *)(v10 + v9);
      if ((v11 & 0x80000000) == 0) {
        break;
      }
      DataItemAtOffset = BookmarkData::getDataItemAtOffset(this, v11 & 0x7FFFFFFF);
      if (DataItemAtOffset
        && DataItemAtOffset[1] == 257
        && *DataItemAtOffset == (_DWORD)a4
        && !memcmp(a3, DataItemAtOffset + 2, a4))
      {
        return a2 + v9 + 8;
      }

      v9 -= 12LL;
    }

    while (v9);
  }

  return 0LL;
}

unsigned int *BookmarkData::getMisalignedItemDataPtr( BookmarkData *this, unsigned int a2, unsigned int a3, int a4, unsigned int *a5)
{
  uint64_t result = (unsigned int *)BookmarkData::findItemInTOC(this, a2, a4);
  if (result)
  {
    uint64_t result = BookmarkData::getDataItemAtOffset(this, result[1]);
    if (result)
    {
      unsigned int v9 = *result;
      result += 2;
      *a5 = v9;
      if (v9 < a3) {
        return 0LL;
      }
    }
  }

  return result;
}

void BookmarkMutableData::BookmarkMutableData(BookmarkMutableData *this, const __CFAllocator *a2, int a3)
{
  *(void *)this = a2;
  *((_DWORD *)this + 2) = a3;
  *((_DWORD *)this + 3) = currentBookmarkVersion();
  *((_DWORD *)this + 8) = 0;
  *((void *)this + 5) = (char *)this + 40;
  *((void *)this + 6) = (char *)this + 40;
  *((void *)this + 7) = 0LL;
  *((void *)this + 3) = 0x20000000004LL;
  uint64_t v4 = malloc(0x200uLL);
  *((void *)this + 2) = v4;
  *uint64_t v4 = 0;
}

void BookmarkMutableData::BookmarkMutableData( BookmarkMutableData *this, const __CFAllocator *a2, const __CFData *a3)
{
  *((void *)this + 1) = 0LL;
  *((void *)this + 2) = 0LL;
  *(void *)this = a2;
  *((_DWORD *)this + 8) = 0;
  *((void *)this + 5) = (char *)this + 40;
  *((void *)this + 6) = (char *)this + 40;
  *((void *)this + 7) = 0LL;
  *((void *)this + 3) = 0x20000000004LL;
  signed int v6 = malloc(0x200uLL);
  *((void *)this + 2) = v6;
  *signed int v6 = 0;
  BookmarkData::BookmarkData((BookmarkData *)v19, a2, a3);
  int v7 = v20;
  if (v20)
  {
    *((_DWORD *)this + 2) = *v20;
    *((_DWORD *)this + 3) = v7[2];
    uint64_t FirstTOC = BookmarkData::getFirstTOC((BookmarkData *)v19, 1);
    if (FirstTOC)
    {
      uint64_t v9 = FirstTOC;
      do
      {
        BookmarkMutableData::createTOC(this, *(_DWORD *)(v9 + 8));
        uint64_t v10 = *(unsigned int *)(v9 + 16);
        if ((_DWORD)v10)
        {
          int v11 = (int *)(v9 + 28);
          do
          {
            int v12 = *(v11 - 2);
            if (v12 < 0)
            {
              DataItemAtOffset = BookmarkData::getDataItemAtOffset((BookmarkData *)v19, v12 & 0x7FFFFFFF);
              v22[0] = 0LL;
              v22[1] = 0LL;
              CFRange v21 = v22;
              uint64_t v13 = (const __CFString *)BookmarkData::copyItem(v19, DataItemAtOffset, (uint64_t)&v21, 0LL);
              std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::destroy( (uint64_t)&v21,  v22[0]);
              BOOL v15 = (const __CFString *)BookmarkData::copyDataItemAtOffset((BookmarkData *)v19, *(v11 - 1), 0LL);
              BookmarkMutableData::encodeItem((void **)this, v13, v15, *v11);
              if (v15) {
                CFRelease(v15);
              }
            }

            else
            {
              uint64_t v13 = (const __CFString *)BookmarkData::copyDataItemAtOffset((BookmarkData *)v19, *(v11 - 1), 0LL);
              BookmarkMutableData::encodeItem((uint64_t **)this, *(v11 - 2), v13, *v11);
            }

            if (v13) {
              CFRelease(v13);
            }
            v11 += 3;
            --v10;
          }

          while (v10);
        }

        int v16 = *(_DWORD *)(v9 + 8);
        if (v16 != 1) {
          BookmarkMutableData::finalizeTOC(this, v16);
        }
        uint64_t TOCAtOffset = BookmarkData::getTOCAtOffset((BookmarkData *)v19, *(_DWORD *)(v9 + 12));
        if (TOCAtOffset) {
          BOOL v18 = TOCAtOffset == v9;
        }
        else {
          BOOL v18 = 1;
        }
        uint64_t v9 = TOCAtOffset;
      }

      while (!v18);
    }
  }

  BookmarkData::~BookmarkData((BookmarkData *)v19);
}

uint64_t BookmarkMutableData::createTOC(BookmarkMutableData *this, int a2)
{
  uint64_t v4 = (char *)this + 40;
  signed int v5 = (char *)*((void *)this + 6);
  uint64_t v6 = *((void *)this + 6);
  do
  {
    uint64_t v7 = *(void *)(v6 + 16);
    if (a2 && *(_DWORD *)(v7 + 8) != a2) {
      uint64_t v7 = 0LL;
    }
    if (v7) {
      break;
    }
    uint64_t v6 = *(void *)(v6 + 8);
  }

  while ((char *)v6 != v4);
  if (!v7)
  {
LABEL_18:
    CFIndex v14 = malloc(0x14uLL);
    *(void *)CFIndex v14 = 0xFFFFFFFE00000014LL;
    v14[3] = 0;
    v14[4] = 0;
    v14[2] = a2;
    BOOL v15 = operator new(0x18uLL);
    v15[2] = v14;
    uint64_t v16 = *(void *)v5;
    *(void *)(v16 + 8) = v15;
    *BOOL v15 = v16;
    *(void *)signed int v5 = v15;
    v15[1] = v5;
    uint64_t v10 = (void *)((char *)this + 56);
LABEL_19:
    ++*v10;
    return 1LL;
  }

  unsigned int v8 = (char *)*((void *)this + 6);
  while (*((void *)v8 + 2) != v7)
  {
    unsigned int v8 = (char *)*((void *)v8 + 1);
    if (v8 == v4)
    {
      unsigned int v8 = (char *)this + 40;
      break;
    }
  }

  if (v8 != v5)
  {
    while (*((void *)v5 + 2) != v7)
    {
      signed int v5 = (char *)*((void *)v5 + 1);
      if (v5 == v4)
      {
        signed int v5 = (char *)this + 40;
        break;
      }
    }

    uint64_t v9 = *(void *)v5;
    *(void *)(v9 + 8) = *((void *)v5 + 1);
    **((void **)v5 + 1) = v9;
    uint64_t v10 = (void *)((char *)this + 56);
    --*((void *)this + 7);
    operator delete(v5);
    int v11 = (uint64_t *)*(v10 - 1);
    int v12 = operator new(0x18uLL);
    v12[2] = v7;
    uint64_t v13 = *v11;
    *(void *)(v13 + 8) = v12;
    void *v12 = v13;
    *int v11 = (uint64_t)v12;
    v12[1] = v11;
    goto LABEL_19;
  }

  return 1LL;
}

uint64_t BookmarkMutableData::encodeItem(void **this, const __CFString *cf2, const __CFString *a3, int a4)
{
  if (!a3) {
    return 0LL;
  }
  unsigned int v8 = CFBookmarkPropertyKeyToKnownType(cf2);
  if (!v8)
  {
    unsigned int v9 = BookmarkMutableData::encodeItem(this, cf2);
    if (v9) {
      unsigned int v8 = v9 | 0x80000000;
    }
    else {
      unsigned int v8 = 0;
    }
  }

  if (!BookmarkMutableData::itemInTOC((BookmarkMutableData *)this, v8, 0)
    && (int v10 = BookmarkMutableData::encodeItem(this, a3), v8)
    && v10)
  {
    return BookmarkMutableData::appendTOCItem((uint64_t **)this, v8, v10, a4);
  }

  else
  {
    return 0LL;
  }
}

uint64_t BookmarkMutableData::encodeItem(uint64_t **this, unsigned int a2, const __CFString *a3, int a4)
{
  else {
    return 0LL;
  }
}

BOOL BookmarkMutableData::finalizeTOC(BookmarkMutableData *this, int a2)
{
  unint64_t v2 = (void *)*((void *)this + 6);
  do
  {
    int v3 = (_DWORD *)v2[2];
    if (a2 && v3[2] != a2) {
      int v3 = 0LL;
    }
    if (v3) {
      break;
    }
    unint64_t v2 = (void *)v2[1];
  }

  while (v2 != (void *)((char *)this + 40));
  return v3 && BookmarkMutableData::finalizeTOC(this, v3);
}

void BookmarkMutableData::~BookmarkMutableData(BookmarkMutableData *this)
{
  while (*((void *)this + 7))
  {
    free(*(void **)(*((void *)this + 6) + 16LL));
    unint64_t v2 = (uint64_t *)*((void *)this + 6);
    uint64_t v3 = *((void *)this + 7);
    uint64_t v4 = *v2;
    *(void *)(v4 + 8) = v2[1];
    *(void *)v2[1] = v4;
    *((void *)this + 7) = v3 - 1;
    operator delete(v2);
  }

  signed int v5 = (void *)*((void *)this + 2);
  if (v5) {
    free(v5);
  }
  *((void *)this + 2) = 0LL;
  std::__list_imp<CFBookmarkTOC *>::clear((void *)this + 5);
}

unsigned int *BookmarkMutableData::getDataItemAtOffset(BookmarkMutableData *this, unsigned int a2)
{
  unint64_t v2 = *((unsigned int *)this + 6);
  uint64_t v3 = *((void *)this + 2);
  if (!v3) {
    return 0LL;
  }
  uint64_t result = (unsigned int *)(v3 + a2);
  uint64_t v5 = *result;
  return result;
}

uint64_t BookmarkMutableData::getTOCAtOffset(BookmarkMutableData *this, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  unint64_t v2 = *((unsigned int *)this + 6);
  uint64_t v3 = *((void *)this + 2) + a2;
  if (*(_DWORD *)(v3 + 4) != -2) {
    return 0LL;
  }
  unsigned int v4 = *(_DWORD *)(v3 + 16);
  if (v4 > 0x15555552) {
    return 0LL;
  }
  return 0LL;
}

uint64_t BookmarkMutableData::findDataItem(BookmarkMutableData *this, int a2, const void *__s1, size_t __n)
{
  if (a2)
  {
    unint64_t v5 = *((unsigned int *)this + 6);
    if (v5 >= 5)
    {
      uint64_t v9 = 4LL;
      do
      {
        uint64_t v10 = *((void *)this + 2);
        if (!v10) {
          break;
        }
        int v11 = (unsigned int *)(v10 + v9);
        uint64_t v12 = *v11;
        if (v12 == __n && v11[1] == a2 && (!__s1 || !memcmp(__s1, v11 + 2, __n))) {
          return v9;
        }
        uint64_t v9 = ((_DWORD)v9 + (_DWORD)v12 + 11) & 0xFFFFFFFC;
      }

      while (v9 < v5);
    }
  }

  return 0LL;
}

uint64_t BookmarkMutableData::appendDataItem(void **this, int a2, const void *a3, size_t a4)
{
  uint64_t DataItem = BookmarkMutableData::findDataItem((BookmarkMutableData *)this, a2, a3, a4);
  uint64_t v9 = DataItem;
  if (a4 <= 0x7FFFFFFE && !(_DWORD)DataItem)
  {
    if ((a4 & 3) != 0) {
      uint64_t v10 = 4 - (a4 & 3);
    }
    else {
      uint64_t v10 = 0LL;
    }
    uint64_t v9 = *((unsigned int *)this + 6);
    unint64_t v11 = a4 + 8 + v10 + v9;
    if (v11 > 0x7FFFFFFE)
    {
      return 0LL;
    }

    else
    {
      unint64_t v12 = *((unsigned int *)this + 7);
      if (v11 <= v12)
      {
        BOOL v15 = (char *)this[2];
      }

      else
      {
        unint64_t v13 = 2 * v12;
        if (v13 >= 0x7FFFFFFF) {
          unint64_t v13 = 0x7FFFFFFFLL;
        }
        if (v11 <= v13) {
          size_t v14 = v13;
        }
        else {
          size_t v14 = v11;
        }
        *((_DWORD *)this + 7) = v14;
        BOOL v15 = (char *)realloc(this[2], v14);
        this[2] = v15;
        uint64_t v9 = *((unsigned int *)this + 6);
      }

      *((_DWORD *)this + 6) = v11;
      uint64_t v16 = &v15[v9];
      *(_DWORD *)uint64_t v16 = a4;
      *((_DWORD *)v16 + 1) = a2;
      if (a3)
      {
        else {
          CFNumberType v17 = 0LL;
        }
        memcpy(v17, a3, a4);
      }

      if ((a4 & 3) != 0) {
        bzero((char *)this[2] + (a4 + 8 + v9), 4 - (a4 & 3));
      }
    }
  }

  return v9;
}

uint64_t BookmarkMutableData::encodeCFStringAs(void **this, CFStringRef theString, int a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  CFIndex Length = CFStringGetLength(theString);
  CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
  if (CStringPtr)
  {
    unsigned int v8 = CStringPtr;
    size_t v9 = strlen(CStringPtr);
    return BookmarkMutableData::appendDataItem(this, a3, v8, v9);
  }

  else if (Length)
  {
    CFIndex maxBufLen = 0LL;
    v19.CFIndex location = 0LL;
    v19.CFIndex length = Length;
    if (CFStringGetBytes(theString, v19, 0x8000100u, 0, 0, buffer, 128LL, &maxBufLen) == Length) {
      return BookmarkMutableData::appendDataItem(this, a3, buffer, maxBufLen);
    }
    v20.CFIndex location = 0LL;
    v20.CFIndex length = Length;
    uint64_t v11 = 0LL;
    if (CFStringGetBytes(theString, v20, 0x8000100u, 0, 0, 0LL, 0LL, &maxBufLen) == Length)
    {
      uint64_t appended = BookmarkMutableData::appendDataItem(this, a3, 0LL, maxBufLen);
      uint64_t v11 = appended;
      if ((_DWORD)appended)
      {
        else {
          unint64_t v13 = 0LL;
        }
        v21.CFIndex location = 0LL;
        v21.CFIndex length = Length;
        if (CFStringGetBytes(theString, v21, 0x8000100u, 0, 0, v13, maxBufLen, 0LL) == Length) {
          uint64_t v11 = v11;
        }
        else {
          uint64_t v11 = 0LL;
        }
      }

      else {
        size_t v14 = 0LL;
      }
      int DataItem = BookmarkMutableData::findDataItem((BookmarkMutableData *)this, a3, v14, maxBufLen);
      if ((_DWORD)v11)
      {
        if (DataItem != (_DWORD)v11)
        {
          *((_DWORD *)this + 6) = v11;
          return 1LL;
        }
      }
    }

    return v11;
  }

  else
  {
    return BookmarkMutableData::appendDataItem(this, a3, 0LL, 0LL);
  }

_DWORD *BookmarkMutableData::encodeItem(void **this, const __CFString *a2)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  if (!a2) {
    return 0LL;
  }
  CFTypeID v4 = CFGetTypeID(a2);
  if ((const __CFString *)*MEMORY[0x189604DE8] == a2)
  {
    int v7 = this;
    int v8 = 1281;
    return (_DWORD *)BookmarkMutableData::appendDataItem(v7, v8, 0LL, 0LL);
  }

  if ((const __CFString *)*MEMORY[0x189604DE0] == a2)
  {
    int v7 = this;
    int v8 = 1280;
    return (_DWORD *)BookmarkMutableData::appendDataItem(v7, v8, 0LL, 0LL);
  }

  CFTypeID v5 = v4;
  if (v4 == CFStringGetTypeID()) {
    return (_DWORD *)BookmarkMutableData::encodeCFStringAs(this, a2, 257);
  }
  if (v5 == CFNumberGetTypeID())
  {
    size_t v9 = 0LL;
    switch(CFNumberGetType((CFNumberRef)a2))
    {
      case kCFNumberSInt8Type:
        valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt8Type, &valuePtr)) {
          return 0LL;
        }
        uint64_t v10 = this;
        int v11 = 769;
        goto LABEL_49;
      case kCFNumberSInt16Type:
        *(_WORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt16Type, &valuePtr)) {
          return 0LL;
        }
        uint64_t v10 = this;
        int v11 = 770;
        goto LABEL_52;
      case kCFNumberSInt32Type:
        *(_DWORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt32Type, &valuePtr)) {
          return 0LL;
        }
        uint64_t v10 = this;
        int v11 = 771;
        goto LABEL_55;
      case kCFNumberSInt64Type:
        *(void *)&valuePtr.byte0 = 0LL;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt64Type, &valuePtr)) {
          return 0LL;
        }
        uint64_t v10 = this;
        int v11 = 772;
        goto LABEL_17;
      case kCFNumberFloat32Type:
        *(_DWORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberFloat32Type, &valuePtr)) {
          return 0LL;
        }
        uint64_t v10 = this;
        int v11 = 773;
        goto LABEL_55;
      case kCFNumberFloat64Type:
        *(void *)&valuePtr.byte0 = 0LL;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberFloat64Type, &valuePtr)) {
          return 0LL;
        }
        uint64_t v10 = this;
        int v11 = 774;
        goto LABEL_17;
      case kCFNumberCharType:
        valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberCharType, &valuePtr)) {
          return 0LL;
        }
        uint64_t v10 = this;
        int v11 = 775;
LABEL_49:
        size_t v14 = 1LL;
        return (_DWORD *)BookmarkMutableData::appendDataItem(v10, v11, &valuePtr, v14);
      case kCFNumberShortType:
        *(_WORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberShortType, &valuePtr)) {
          return 0LL;
        }
        uint64_t v10 = this;
        int v11 = 776;
LABEL_52:
        size_t v14 = 2LL;
        return (_DWORD *)BookmarkMutableData::appendDataItem(v10, v11, &valuePtr, v14);
      case kCFNumberIntType:
        *(_DWORD *)&valuePtr.byte0 = 0;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberIntType, &valuePtr)) {
          return 0LL;
        }
        uint64_t v10 = this;
        int v11 = 777;
LABEL_55:
        size_t v14 = 4LL;
        return (_DWORD *)BookmarkMutableData::appendDataItem(v10, v11, &valuePtr, v14);
      case kCFNumberLongType:
        *(void *)&valuePtr.byte0 = 0LL;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberLongType, &valuePtr)) {
          return 0LL;
        }
        uint64_t v10 = this;
        int v11 = 778;
        goto LABEL_17;
      case kCFNumberLongLongType:
        *(void *)&valuePtr.byte0 = 0LL;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberLongLongType, &valuePtr)) {
          return 0LL;
        }
        uint64_t v10 = this;
        int v11 = 779;
        goto LABEL_17;
      case kCFNumberCFIndexType:
        *(void *)&valuePtr.byte0 = 0LL;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberCFIndexType, &valuePtr)) {
          return 0LL;
        }
        uint64_t v10 = this;
        int v11 = 782;
        goto LABEL_17;
      case kCFNumberNSIntegerType:
        *(void *)&valuePtr.byte0 = 0LL;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberNSIntegerType, &valuePtr)) {
          return 0LL;
        }
        uint64_t v10 = this;
        int v11 = 783;
        goto LABEL_17;
      case kCFNumberCGFloatType:
        *(void *)&valuePtr.byte0 = 0LL;
        if (!CFNumberGetValue((CFNumberRef)a2, kCFNumberCGFloatType, &valuePtr)) {
          return 0LL;
        }
        uint64_t v10 = this;
        int v11 = 784;
        goto LABEL_17;
      default:
        return v9;
    }
  }

  if (v5 == CFDataGetTypeID())
  {
    BytePtr = CFDataGetBytePtr((CFDataRef)a2);
    size_t Length = CFDataGetLength((CFDataRef)a2);
    return (_DWORD *)BookmarkMutableData::appendDataItem(this, 513, BytePtr, Length);
  }

  if (v5 == CFDateGetTypeID())
  {
    *(void *)&valuePtr.byte0 = bswap64(COERCE_UNSIGNED_INT64(MEMORY[0x186E19B18](a2)));
    uint64_t v10 = this;
    int v11 = 1024;
LABEL_17:
    size_t v14 = 8LL;
    return (_DWORD *)BookmarkMutableData::appendDataItem(v10, v11, &valuePtr, v14);
  }

  if (v5 != CFArrayGetTypeID())
  {
    if (v5 == CFDictionaryGetTypeID())
    {
      CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)a2);
      CFRange v21 = (const void **)malloc(8 * Count);
      CFRange v22 = malloc(8 * Count);
      CFRange v23 = v22;
      if (v21 && v22)
      {
        CFDictionaryGetKeysAndValues((CFDictionaryRef)a2, v21, 0LL);
        if (Count < 1)
        {
          uint64_t v24 = 0LL;
        }

        else
        {
          uint64_t v24 = 0LL;
          uint64_t v25 = v21;
          do
          {
            int v26 = BookmarkMutableData::encodeItem((BookmarkMutableData *)this, *v25);
            v23[v24] = v26;
            if (v26)
            {
              Value = CFDictionaryGetValue((CFDictionaryRef)a2, *v25);
              int v28 = BookmarkMutableData::encodeItem((BookmarkMutableData *)this, Value);
              if (v28)
              {
                v23[v24 + 1] = v28;
                v24 += 2LL;
              }
            }

            ++v25;
            --Count;
          }

          while (Count);
        }

        uint64_t appended = BookmarkMutableData::appendDataItem(this, 1793, v23, 4 * v24);
      }

      else
      {
        uint64_t appended = 0LL;
        size_t v9 = 0LL;
        if (!v21)
        {
LABEL_85:
          if (v23) {
            free(v23);
          }
          return v9;
        }
      }

      free(v21);
      size_t v9 = (_DWORD *)appended;
      goto LABEL_85;
    }

    if (v5 == CFUUIDGetTypeID())
    {
      CFUUIDBytes valuePtr = CFUUIDGetUUIDBytes((CFUUIDRef)a2);
      uint64_t v10 = this;
      int v11 = 2049;
      size_t v14 = 16LL;
      return (_DWORD *)BookmarkMutableData::appendDataItem(v10, v11, &valuePtr, v14);
    }

    if (v5 == CFURLGetTypeID())
    {
      if (!CFURLIsFileReferenceURL((CFURLRef)a2)
        || (unint64_t v30 = CFGetAllocator(a2), (v31 = CFURLCreateFilePathURL(v30, (CFURLRef)a2, 0LL)) == 0LL))
      {
        CFRetain(a2);
        unint64_t v31 = (const __CFURL *)a2;
      }

      CFURLRef v32 = CFURLGetBaseURL(v31);
      if (v32)
      {
        *(_DWORD *)&valuePtr.byte0 = BookmarkMutableData::encodeItem((BookmarkMutableData *)this, v32);
        CFStringRef v33 = CFURLGetString(v31);
        *(_DWORD *)&valuePtr.byte4 = BookmarkMutableData::encodeItem((BookmarkMutableData *)this, v33);
        uint64_t v34 = BookmarkMutableData::appendDataItem(this, 2306, &valuePtr, 8uLL);
      }

      else
      {
        uint64_t v36 = CFURLGetString(v31);
        uint64_t v34 = BookmarkMutableData::encodeCFStringAs(this, v36, 2305);
      }

      size_t v9 = (_DWORD *)v34;
      CFRelease(v31);
      return v9;
    }

    if (v5 == CFNullGetTypeID())
    {
      int v7 = this;
      int v8 = 2561;
      return (_DWORD *)BookmarkMutableData::appendDataItem(v7, v8, 0LL, 0LL);
    }

    return 0LL;
  }

  CFIndex v15 = CFArrayGetCount((CFArrayRef)a2);
  size_t v9 = malloc(4 * v15);
  if (!v9) {
    return v9;
  }
  if (v15 < 1)
  {
    uint64_t v16 = 0LL;
  }

  else
  {
    uint64_t v16 = 0LL;
    for (CFIndex i = 0LL; i != v15; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a2, i);
      int v19 = BookmarkMutableData::encodeItem((BookmarkMutableData *)this, ValueAtIndex);
      if (v19) {
        v9[v16++] = v19;
      }
    }
  }

  uint64_t v35 = BookmarkMutableData::appendDataItem(this, 1537, v9, 4 * v16);
  free(v9);
  return (_DWORD *)v35;
}

uint64_t BookmarkMutableData::appendTOCItem(uint64_t **this, unsigned int a2, int a3, int a4)
{
  if (!this[7]) {
    BookmarkMutableData::createTOC((BookmarkMutableData *)this, 1);
  }
  int v8 = this[6];
  size_t v9 = (_DWORD *)v8[2];
  int v10 = v9[4];
  if (v10)
  {
    char v11 = 0;
    unint64_t v12 = v9 + 6;
    uint64_t v13 = v9[4];
    do
    {
      if (a2 == *(v12 - 1))
      {
        v11 |= *v12 == a3;
        if (*v12 == a3) {
          a2 = 0;
        }
      }

      v12 += 3;
      --v13;
    }

    while (v13);
    if (!a2) {
      return v11 & 1;
    }
  }

  else
  {
    char v11 = 0;
    if (!a2) {
      return v11 & 1;
    }
  }

  size_t v14 = (uint64_t *)(this + 5);
  size_t v15 = 12LL * (v10 + 1) + 20;
  while (v8 != v14)
  {
    if ((_DWORD *)v8[2] == v9)
    {
      size_t v14 = v8;
      break;
    }

    int v8 = (uint64_t *)v8[1];
  }

  uint64_t v16 = *v14;
  *(void *)(v16 + 8) = v14[1];
  *(void *)v14[1] = v16;
  this[7] = (uint64_t *)((char *)this[7] - 1);
  operator delete(v14);
  CFNumberType v17 = realloc(v9, v15);
  uint64_t v18 = this[6];
  int v19 = operator new(0x18uLL);
  CFAllocatorRef v19[2] = v17;
  uint64_t v20 = *v18;
  *(void *)(v20 + 8) = v19;
  *int v19 = v20;
  *uint64_t v18 = (uint64_t)v19;
  v19[1] = v18;
  this[7] = (uint64_t *)((char *)this[7] + 1);
  _DWORD *v17 = v15;
  v17[4] = v10 + 1;
  if (v10)
  {
    uint64_t v21 = (uint64_t)&v17[3 * v10 + 5];
    while (1)
    {
      uint64_t v22 = (v10 - 1);
      CFRange v23 = &v17[3 * v22];
      unsigned int v25 = v23[5];
      uint64_t v24 = v23 + 5;
      if (a2 >= v25) {
        break;
      }
      uint64_t v26 = *(void *)v24;
      *(_DWORD *)(v21 + 8) = v24[2];
      *(void *)uint64_t v21 = v26;
      v21 -= 12LL;
      --v10;
      if (!v22) {
        goto LABEL_21;
      }
    }
  }

  else
  {
LABEL_21:
    int v10 = 0;
  }

  uint64_t v27 = &v17[3 * v10];
  v27[5] = a2;
  v27[6] = a3;
  v27[7] = a4;
  char v11 = 1;
  return v11 & 1;
}

BOOL BookmarkMutableData::itemInTOC(BookmarkMutableData *this, int a2, int a3)
{
  int v3 = a3;
  if (!a3)
  {
    if (*((void *)this + 7)) {
      int v3 = *(_DWORD *)(*(void *)(*((void *)this + 6) + 16LL) + 8LL);
    }
    else {
      int v3 = 0;
    }
  }

  uint64_t v6 = (void *)*((void *)this + 6);
  BOOL v7 = 0;
  do
  {
    uint64_t v8 = v6[2];
    unint64_t v9 = *(unsigned int *)(v8 + 16);
    if ((_DWORD)v9 && !v7)
    {
      int v10 = (int *)(v8 + 20);
      unint64_t v11 = 1LL;
      do
      {
        int v13 = *v10;
        v10 += 3;
        int v12 = v13;
        BOOL v7 = v13 == a2;
        if (v11 >= v9) {
          break;
        }
        ++v11;
      }

      while (v12 != a2);
    }

    uint64_t v6 = (void *)v6[1];
  }

  while (v6 != (void *)((char *)this + 40));
  if (v7) {
    return 1LL;
  }
LABEL_15:
  unsigned int v15 = *((_DWORD *)this + 8);
  if (!v15) {
    return 0LL;
  }
  uint64_t TOCAtOffset = (_DWORD *)BookmarkMutableData::getTOCAtOffset(this, v15);
  if (!TOCAtOffset) {
    return 0LL;
  }
  do
  {
    if (TOCAtOffset[2] == v3 && (unint64_t v17 = TOCAtOffset[4], (_DWORD)v17))
    {
      uint64_t v18 = TOCAtOffset + 5;
      unint64_t v19 = 1LL;
      do
      {
        int v21 = *v18;
        v18 += 3;
        int v20 = v21;
        BOOL v14 = v21 == a2;
        if (v19 >= v17) {
          break;
        }
        ++v19;
      }

      while (v20 != a2);
    }

    else
    {
      BOOL v14 = 0LL;
    }

    uint64_t TOCAtOffset = (_DWORD *)BookmarkMutableData::getTOCAtOffset(this, TOCAtOffset[3]);
    if (TOCAtOffset) {
      BOOL v22 = !v14;
    }
    else {
      BOOL v22 = 0;
    }
  }

  while (v22);
  return v14;
}

uint64_t BookmarkMutableData::encodeValue(void **this, unsigned int a2, int a3, int a4)
{
  int v8 = a3;
  uint64_t result = BookmarkMutableData::appendDataItem(this, 771, &v8, 4uLL);
  if ((_DWORD)result) {
    return BookmarkMutableData::appendTOCItem((uint64_t **)this, a2, result, a4);
  }
  return result;
}

uint64_t BookmarkMutableData::encodeRawData(uint64_t **this, unsigned int a2, UInt8 *bytes, CFIndex length)
{
  uint64_t v6 = (const __CFString *)CFDataCreateWithBytesNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  bytes,  length,  (CFAllocatorRef)*MEMORY[0x189604DC8]);
  if (!v6) {
    return 0LL;
  }
  BOOL v7 = v6;
  uint64_t v8 = BookmarkMutableData::encodeItem(this, a2, v6, 0);
  CFRelease(v7);
  return v8;
}

uint64_t BookmarkMutableData::tocExists(BookmarkMutableData *this, int a2)
{
  unint64_t v2 = (void *)*((void *)this + 6);
  do
  {
    uint64_t v3 = v2[2];
    if (a2 && *(_DWORD *)(v3 + 8) != a2) {
      uint64_t v3 = 0LL;
    }
    if (v3) {
      break;
    }
    unint64_t v2 = (void *)v2[1];
  }

  while (v2 != (void *)((char *)this + 40));
  if (!v3)
  {
LABEL_9:
    uint64_t v4 = *((unsigned int *)this + 8);
    if ((_DWORD)v4)
    {
      unint64_t v5 = *((unsigned int *)this + 6);
      if (v4 + 20 <= v5)
      {
        for (uint64_t i = *((void *)this + 2) + v4; ; uint64_t i = *((void *)this + 2) + v8)
        {
          LOBYTE(v4) = *(_DWORD *)(i + 8) == a2;
          if (*(_DWORD *)(i + 8) == a2) {
            break;
          }
          uint64_t v8 = *(unsigned int *)(i + 12);
          if (!(_DWORD)v8) {
            goto LABEL_11;
          }
          if (v8 + 20 > v5) {
            break;
          }
        }
      }

      else
      {
LABEL_11:
        LOBYTE(v4) = 0;
      }
    }
  }

  else
  {
    LOBYTE(v4) = 1;
  }

  return v4 & 1;
}

uint64_t BookmarkMutableData::findOpenTOC(BookmarkMutableData *this, int a2)
{
  unint64_t v2 = (char *)this + 40;
  uint64_t v3 = (char *)*((void *)this + 6);
  do
  {
    uint64_t result = *((void *)v3 + 2);
    if (a2 && *(_DWORD *)(result + 8) != a2) {
      uint64_t result = 0LL;
    }
    if (result) {
      break;
    }
    uint64_t v3 = (char *)*((void *)v3 + 1);
  }

  while (v3 != v2);
  return result;
}

uint64_t BookmarkMutableData::findUnusedDepth(BookmarkMutableData *this, uint64_t a2, unsigned int a3)
{
  uint64_t v4 = a2;
  while (BookmarkMutableData::tocExists(this, v4))
  {
    uint64_t v4 = (v4 + 1);
    if (a3 == (_DWORD)v4) {
      return 0LL;
    }
  }

  return v4;
}

BOOL BookmarkMutableData::finalizeTOC(BookmarkMutableData *this, _DWORD *a2)
{
  if (a2)
  {
    int v4 = a2[4];
    if (v4)
    {
      uint64_t v5 = (12 * v4 + 20);
      *a2 = v5;
      a2[3] = *((_DWORD *)this + 8);
      *((_DWORD *)this + 8) = BookmarkMutableData::appendDataItem((void **)this, -2, a2 + 2, v5 - 8);
    }

    uint64_t v6 = (void **)((char *)this + 40);
    for (uint64_t i = (void **)*((void *)this + 6); i != v6; uint64_t i = (void **)i[1])
    {
      if (i[2] == a2)
      {
        if (i != v6)
        {
          uint64_t v8 = *i;
          v8[1] = i[1];
          *(void *)i[1] = v8;
          --*((void *)this + 7);
          operator delete(i);
        }

        break;
      }
    }

    free(a2);
  }

  return a2 != 0LL;
}

uint64_t BookmarkMutableData::setRevocable(uint64_t this, int a2)
{
  *(_DWORD *)(this + 12) = *(_DWORD *)(this + 12) & 0xFFFFFFFE | a2;
  return this;
}

CFDataRef BookmarkMutableData::Finalize(CFAllocatorRef *this, const void *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  Mutable = CFDataCreateMutable(*this, 0LL);
  __int128 v22 = 0u;
  __int128 v21 = 0u;
  int v7 = *((_DWORD *)this + 3);
  *(_DWORD *)bytes = *((_DWORD *)this + 2);
  int v18 = 0;
  int v19 = v7;
  int v20 = 48;
  CFDataAppendBytes(Mutable, bytes, 48LL);
  if (this[7])
  {
    uint64_t v8 = (char *)(this + 5);
    while (1)
    {
      CFAllocatorRef v9 = this[6];
      if (v9 != (CFAllocatorRef)v8) {
        break;
      }
      int v10 = 0LL;
LABEL_13:
      BookmarkMutableData::finalizeTOC((BookmarkMutableData *)this, v10);
      if (!this[7]) {
        goto LABEL_14;
      }
    }

    int v10 = 0LL;
    while (1)
    {
      if (v10)
      {
        unint64_t v11 = (_DWORD *)*((void *)v9 + 2);
        if (v10[2] <= v11[2]) {
          goto LABEL_10;
        }
      }

      else
      {
        unint64_t v11 = (_DWORD *)*((void *)v9 + 2);
      }

      int v10 = v11;
LABEL_10:
      CFAllocatorRef v9 = (CFAllocatorRef)*((void *)v9 + 1);
      if (v9 == (CFAllocatorRef)v8) {
        goto LABEL_13;
      }
    }
  }

LABEL_14:
  int v12 = (UInt8 *)this[2];
  *(_DWORD *)int v12 = *((_DWORD *)this + 8);
  CFDataAppendBytes(Mutable, v12, *((unsigned int *)this + 6));
  if (CFDataGetLength(Mutable) > 2147483646)
  {
    if (Mutable) {
      CFRelease(Mutable);
    }
    return 0LL;
  }

  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  *((_DWORD *)MutableBytePtr + 1) = CFDataGetLength(Mutable);
  if (a2)
  {
    if (a3 != 32) {
      BookmarkMutableData::Finalize();
    }
    size_t Length = CFDataGetLength(Mutable);
    CCHmac(2u, a2, 0x20uLL, MutableBytePtr, Length, MutableBytePtr + 16);
  }

  if (!Mutable) {
    return 0LL;
  }
  CFDataRef Copy = CFDataCreateCopy(*this, Mutable);
  CFRelease(Mutable);
  return Copy;
}

    *((void *)&v21 + 1) |= 0x8000000uLL;
    goto LABEL_15;
  }

  VolumeFlags = MountInfoGetVolumeFlags(a3);
  int v7 = VolumeFlags & 0x7F ^ 1;
  if ((VolumeFlags & 0x80) != 0)
  {
    v7 |= 0x80uLL;
    *((void *)&v21 + 1) = v7;
  }

  *((void *)&v21 + 1) = VolumeFlags & 0x700 | v7 & 0xFFFFFFFFC3FFEFFFLL | (((VolumeFlags >> 11) & 1) << 12) & 0xFFFFFFFFC3FFFFFFLL | (((VolumeFlags >> 23) & 0xF) << 26) | MountInfoGetCapabilities(a3);
  VolumeCreationDate = MountInfoGetVolumeCreationDate(a3);
  if (VolumeCreationDate | v9) {
    int v10 = (double)VolumeCreationDate - *MEMORY[0x189604DA8] + (double)v9 * 0.000000001;
  }
  else {
    int v10 = -1.0 - *MEMORY[0x189604DA0];
  }
  *(double *)&__int128 v22 = v10;
  else {
    BOOL v14 = 56LL;
  }
  *((void *)&v22 + 1) = MountInfoGetMaxFileSize(a3);
LABEL_27:
  unsigned int v15 = CFGetAllocator(a1);
  Mutable = CFDataCreateMutable(v15, v14);
  if (Mutable)
  {
    unint64_t v17 = Mutable;
    CFDataAppendBytes(Mutable, bytes, v14);
    _FileCacheSetVolumeInfo(a2, v17);
    CFRelease(v17);
  }

    if (*a4) {
      CFRetain(*a4);
    }
LABEL_16:
    ++a4;
    ++a3;
    if (!--v6) {
      return 1LL;
    }
  }

  if ((~*(_DWORD *)_FileCacheGetAttributes(a2) & 0x2001) == 0)
  {
    uint64_t result = CFURLHasDirectoryPath(a1);
    if (!(_DWORD)result) {
      return result;
    }
    *a4 = (void *)CFRetain(a1);
    goto LABEL_16;
  }

  return 0LL;
}

void *std::__list_imp<CFBookmarkTOC *>::clear(void *result)
{
  if (result[2])
  {
    BOOL v1 = result;
    uint64_t result = (void *)result[1];
    uint64_t v2 = *v1;
    uint64_t v3 = *result;
    *(void *)(v3 + 8) = *(void *)(*v1 + 8LL);
    **(void **)(v2 + 8) = v3;
    v1[2] = 0LL;
    if (result != v1)
    {
      do
      {
        int v4 = (void *)result[1];
        operator delete(result);
        uint64_t result = v4;
      }

      while (v4 != v1);
    }
  }

  return result;
}

void std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::destroy( uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::destroy( a1,  *a2);
    std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::destroy( a1,  a2[1]);
    operator delete(a2);
  }

uint64_t *std::__tree<CFBookmarkDataItem const*>::__emplace_unique_key_args<CFBookmarkDataItem const*,CFBookmarkDataItem const* const&>( uint64_t **a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = a1 + 1;
  uint64_t v5 = a1[1];
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
        uint64_t v5 = *v8;
        uint64_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }

      if (v9 >= v7) {
        break;
      }
      uint64_t v5 = v8[1];
      if (!v5)
      {
        uint64_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    uint64_t v8 = a1 + 1;
LABEL_10:
    int v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    std::__tree<CFBookmarkDataItem const*>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }

  return (uint64_t *)v8;
}

uint64_t *std::__tree<CFBookmarkDataItem const*>::__insert_node_at( uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0LL;
  a4[1] = 0LL;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }

  uint64_t result = std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

uint64_t *std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>( uint64_t *result, uint64_t *a2)
{
  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      int v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            unint64_t v9 = (uint64_t **)a2[2];
          }

          else
          {
            unint64_t v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }

            v9[2] = v3;
            *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = v9;
            _DWORD *v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }

          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
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
            uint64_t v3 = (uint64_t *)v2[2];
          }

          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }

        else
        {
          a2 = (uint64_t *)a2[2];
        }

        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
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

void *std::__allocate_at_least[abi:nn180100]<std::allocator<void const*>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(8 * a2);
}

uint64_t std::__tree<CFBookmarkDataItem const*>::__erase_unique<CFBookmarkDataItem const*>( uint64_t a1, unint64_t *a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (!v2) {
    return 0LL;
  }
  unint64_t v3 = *a2;
  int v4 = (uint64_t *)(a1 + 8);
  do
  {
    unint64_t v5 = v2[4];
    BOOL v6 = v5 >= v3;
    if (v5 >= v3) {
      uint64_t v7 = v2;
    }
    else {
      uint64_t v7 = v2 + 1;
    }
    if (v6) {
      int v4 = v2;
    }
    uint64_t v2 = (void *)*v7;
  }

  while (*v7);
  std::__tree<CFBookmarkDataItem const*>::__remove_node_pointer((uint64_t **)a1, v4);
  operator delete(v4);
  return 1LL;
}

uint64_t *std::__tree<CFBookmarkDataItem const*>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      unint64_t v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }

    while (v2);
  }

  else
  {
    int v4 = a2;
    do
    {
      unint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      int v4 = v3;
    }

    while (!v5);
  }

  if (*a1 == a2) {
    *a1 = v3;
  }
  BOOL v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  unint64_t v3 = a2;
  if (*a2)
  {
    int v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      unint64_t v3 = a2;
      goto LABEL_7;
    }

    do
    {
      unint64_t v3 = v4;
      int v4 = (uint64_t *)*v4;
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
  BOOL v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    *BOOL v6 = (uint64_t *)v2;
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
    uint64_t *v3 = v11;
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
      uint64_t *v13 = v12;
      *(void *)(v12 + 16) = v13;
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
    }

    unsigned int v15 = (void *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      uint64_t v16 = (uint64_t *)v7[1];
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
        unsigned int v7[2] = (uint64_t)v15;
        uint64_t v16 = v7;
      }

      else
      {
        unsigned int v15 = v7;
      }

      uint64_t v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      uint64_t v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8LL * (**(void **)(v23 + 16) != v23)) = v24;
      *uint64_t v24 = v23;
      goto LABEL_72;
    }

    uint64_t v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24)) {
      goto LABEL_55;
    }
    *((_BYTE *)v7 + 24) = 0;
    unint64_t v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      unint64_t v17 = result;
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
    unsigned int v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8LL * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    uint64_t v7 = *(uint64_t **)v12;
  }

  int v19 = (void *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24)) {
    goto LABEL_68;
  }
  int v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    unint64_t v17 = (uint64_t *)v7[2];
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
    int v20 = v7;
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
    uint64_t *v20 = (uint64_t)v7;
    unsigned int v7[2] = (uint64_t)v20;
    int v19 = v7;
  }

  uint64_t v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  uint64_t v24 = *(uint64_t **)v23;
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

uint64_t *std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::find<std::pair<unsigned int,unsigned int>>( uint64_t a1, unsigned int *a2)
{
  int v4 = *(uint64_t **)(a1 + 8);
  uint64_t v2 = (uint64_t *)(a1 + 8);
  unint64_t v3 = v4;
  if (!v4) {
    return v2;
  }
  unsigned int v6 = *a2;
  unsigned int v5 = a2[1];
  uint64_t v7 = v2;
  do
  {
    unsigned int v8 = *((_DWORD *)v3 + 8);
    if (v8 >= v6)
    {
      if (v6 >= v8)
      {
        if (*((_DWORD *)v3 + 9) < v5) {
          ++v3;
        }
        else {
          uint64_t v7 = v3;
        }
      }

      else
      {
        uint64_t v7 = v3;
      }
    }

    else
    {
      ++v3;
    }

    unint64_t v3 = (uint64_t *)*v3;
  }

  while (v3);
  if (v7 == v2) {
    return v2;
  }
  unsigned int v9 = *((_DWORD *)v7 + 8);
  if (v6 < v9 || v9 >= v6 && v5 < *((_DWORD *)v7 + 9)) {
    return v2;
  }
  return v7;
}

uint64_t *std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::__emplace_unique_key_args<std::pair<unsigned int,unsigned int>,std::pair<std::pair<unsigned int,unsigned int> const,void const*> const&>( uint64_t **a1, unsigned int *a2, _OWORD *a3)
{
  unsigned int v5 = std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::__find_equal<std::pair<unsigned int,unsigned int>>( (uint64_t)a1,  &v9,  a2);
  unsigned int v6 = (uint64_t *)*v5;
  if (!*v5)
  {
    uint64_t v7 = (uint64_t **)v5;
    unsigned int v6 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v6 + 2) = *a3;
    std::__tree<CFBookmarkDataItem const*>::__insert_node_at(a1, v9, v7, v6);
  }

  return v6;
}

uint64_t *std::__tree<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::__map_value_compare<std::pair<unsigned int,unsigned int>,std::__value_type<std::pair<unsigned int,unsigned int>,void const*>,std::less<std::pair<unsigned int,unsigned int>>,true>,std::allocator<std::__value_type<std::pair<unsigned int,unsigned int>,void const*>>>::__find_equal<std::pair<unsigned int,unsigned int>>( uint64_t a1, void *a2, unsigned int *a3)
{
  unsigned int v5 = *(uint64_t **)(a1 + 8);
  uint64_t result = (uint64_t *)(a1 + 8);
  int v4 = v5;
  if (v5)
  {
    unsigned int v6 = *a3;
    unsigned int v7 = a3[1];
    while (1)
    {
      while (1)
      {
        unsigned int v8 = v4;
        unsigned int v9 = *((_DWORD *)v4 + 8);
        if (v6 >= v9) {
          break;
        }
LABEL_4:
        int v4 = (uint64_t *)*v8;
        uint64_t result = v8;
        if (!*v8) {
          goto LABEL_12;
        }
      }

      if (v9 >= v6)
      {
        unsigned int v10 = *((_DWORD *)v8 + 9);
        if (v7 < v10) {
          goto LABEL_4;
        }
        if (v10 >= v7) {
          goto LABEL_12;
        }
      }

      uint64_t result = v8 + 1;
      int v4 = (uint64_t *)v8[1];
      if (!v4) {
        goto LABEL_12;
      }
    }
  }

  unsigned int v8 = result;
LABEL_12:
  *a2 = v8;
  return result;
}

uint64_t _CFURLCreateBookmarkDataFromAliasRecord()
{
  return 0LL;
}

uint64_t _CFURLBookmarkToAliasHandle()
{
  return 4294967253LL;
}

CFDataRef __CFURLCreateBookmarkData( const __CFAllocator *a1, const __CFURL *a2, unint64_t a3, const __CFArray *a4, const __CFURL *a5, __CFError **a6)
{
  if (a2)
  {
    CFRetain(a2);
    int IsReachable = CFURLResourceIsReachable(a2, 0LL);
    int v13 = _CFURLIsFileURL();
    if ((a3 & 0x10000400) == 0x10000000 || !v13 || IsReachable)
    {
      createBookmarkWithURLAtDepth(a1, a2, a3, a5, a4, (BookmarkMutableData *)v17, 1, IsReachable != 0, a6);
      CFDataRef v14 = BookmarkMutableData::Finalize(v17, 0LL, 0LL);
      if (!a6) {
        goto LABEL_15;
      }
    }

    else
    {
      if (!a6)
      {
        CFDataRef v14 = 0LL;
        goto LABEL_16;
      }

      CFDataRef v14 = 0LL;
      *a6 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 260LL, 0LL);
    }
  }

  else
  {
    CFDataRef v14 = 0LL;
    if (!a6) {
      goto LABEL_15;
    }
  }

  if (!v14 && !*a6)
  {
    unsigned int v15 = (os_log_s *)bmarkLog;
    if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_ERROR)) {
      __CFURLCreateBookmarkData(v15);
    }
    *a6 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 256LL, 0LL);
  }

LABEL_15:
  if (a2) {
LABEL_16:
  }
    CFRelease(a2);
  BookmarkMutableData::~BookmarkMutableData((BookmarkMutableData *)v17);
  return v14;
}

        uint64_t v11 = 0LL;
LABEL_46:
        CFRelease(v9);
        goto LABEL_47;
      }

      numChars = 0LL;
      theString = CFStringCreateMutable(v2, 0LL);
      size_t Length = CFStringGetLength(@"file://");
      if (Length < 1025)
      {
        int v13 = Length;
        if (numChars + Length >= 1025)
        {
          CFStringAppendCharacters(theString, chars, 0LL);
          numChars = 0LL;
        }

        v33.CFIndex location = 0LL;
        v33.CFIndex length = v13;
        CFStringGetCharacters(@"file://", v33, chars);
        numChars += v13;
      }

      else
      {
        CFStringAppend(theString, @"file://");
      }

      CFDataRef v14 = CFStringGetLength(v9);
      CharacterAtIndex = CFStringGetCharacterAtIndex(v9, v14 - 1);
      uint64_t v16 = CharacterAtIndex;
      if (v3)
      {
        unint64_t v17 = CFStringGetLength(v9);
        uint64_t v18 = numChars;
        if (v17 < 1025)
        {
          uint64_t v24 = v17;
          if (numChars + v17 >= 1025)
          {
            CFStringAppendCharacters(theString, chars, numChars);
            uint64_t v18 = 0LL;
            numChars = 0LL;
          }

          uint64_t v25 = &chars[v18];
          v34.CFIndex location = 0LL;
          v34.CFIndex length = v24;
          CFStringGetCharacters(v9, v34, v25);
          int v19 = numChars + v24;
          numChars += v24;
        }

        else
        {
          if (numChars)
          {
            CFStringAppendCharacters(theString, chars, numChars);
            numChars = 0LL;
          }

          CFStringAppend(theString, v9);
          int v19 = numChars;
        }

        if (v16 != 47)
        {
          if (v19 >= 1024)
          {
            CFStringAppendCharacters(theString, chars, v19);
            int v19 = 0LL;
            numChars = 0LL;
          }

          chars[v19] = 47;
          int v19 = numChars + 1;
LABEL_41:
          numChars = v19;
        }
      }

      else
      {
        if (CharacterAtIndex == 47)
        {
          v36.CFIndex length = CFStringGetLength(v9) - 1;
          v36.CFIndex location = 0LL;
          int v20 = CFStringCreateWithSubstring(v2, v9, v36);
          if (v20)
          {
            BOOL v21 = v20;
            CFRelease(v9);
            unsigned int v9 = v21;
          }
        }

        uint64_t v22 = CFStringGetLength(v9);
        uint64_t v23 = numChars;
        if (v22 < 1025)
        {
          uint64_t v26 = v22;
          if (numChars + v22 >= 1025)
          {
            CFStringAppendCharacters(theString, chars, numChars);
            uint64_t v23 = 0LL;
            numChars = 0LL;
          }

          uint64_t v27 = &chars[v23];
          v35.CFIndex location = 0LL;
          v35.CFIndex length = v26;
          CFStringGetCharacters(v9, v35, v27);
          int v19 = numChars + v26;
          goto LABEL_41;
        }

        if (numChars)
        {
          CFStringAppendCharacters(theString, chars, numChars);
          numChars = 0LL;
        }

        CFStringAppend(theString, v9);
        int v19 = numChars;
      }

      if (v19) {
        CFStringAppendCharacters(theString, chars, v19);
      }
      uint64_t v12 = theString;
      if (theString) {
        goto LABEL_45;
      }
      goto LABEL_15;
    }
  }

  return 0LL;
}

void createBookmarkWithURLAtDepth( const __CFAllocator *a1, const __CFURL *cf, unint64_t a3, const __CFURL *a4, const __CFArray *a5, BookmarkMutableData *this, int a7, char a8, __CFError **a9)
{
  unsigned int v15 = cf;
  cfa[128] = *(CFTypeRef *)MEMORY[0x1895F89C0];
  CFTypeRef v135 = 0LL;
  if (cf) {
    CFRetain(cf);
  }
  v128 = a4;
  int TOC = BookmarkMutableData::createTOC(this, a7);
  int v18 = TOC;
  if (a3 && TOC) {
    BookmarkMutableData::encodeValue((void **)this, 0xD010u, a3, 0);
  }
  int v19 = a9;
  if ((a3 & 0x1000000) != 0) {
    a3 = a3 & 0xFBFFFFFF;
  }
  int v20 = CFURLCopyAbsoluteURL(v15);
  if (!v18) {
    goto LABEL_204;
  }
  unint64_t v131 = a3;
  if (!_CFURLIsFileURL())
  {
    uint64_t v24 = CFURLGetString(v20);
    BookmarkMutableData::encodeItem((uint64_t **)this, 0x1003u, v24, 0);
    if ((a3 & 0x400) == 0) {
      goto LABEL_189;
    }
    goto LABEL_187;
  }

  v127 = a5;
  v124 = v20;
  char v123 = v18;
  if ((a8 & 1) != 0)
  {
    String = CFURLCopyQueryString(v20, 0LL);
    if (String) {
      BookmarkMutableData::encodeItem((uint64_t **)this, 0x1102u, String, 0);
    }
    uint64_t v22 = CFURLCopyFragment(v20, 0LL);
    if (v22)
    {
      uint64_t v23 = v22;
      BookmarkMutableData::encodeItem((uint64_t **)this, 0x1101u, v22, 0);
      CFRelease(v23);
    }

    if (String) {
      CFRelease(String);
    }
  }

  else
  {
    uint64_t v25 = CFURLGetString(v20);
    BookmarkMutableData::encodeItem((uint64_t **)this, 0x1003u, v25, 0);
  }

  NormalizedFileURL = createNormalizedFileURL(v15);
  URLParentageArray = createURLParentageArray(a1, NormalizedFileURL);
  uint64_t Count = CFArrayGetCount(URLParentageArray);
  int v28 = (const CFArrayCallBacks *)MEMORY[0x189605228];
  Mutable = CFArrayCreateMutable(a1, Count, MEMORY[0x189605228]);
  uint64_t v29 = (const __CFString *)CFArrayCreateMutable(a1, 0LL, v28);
  v133 = CFArrayCreateMutable(a1, 0LL, v28);
  theArray = (__CFArray *)v29;
  int v125 = a7;
  v130 = this;
  v126 = a1;
  int v30 = 0;
  if (Count < 1)
  {
    char allocator = 0;
  }

  else
  {
    CFIndex v31 = 0LL;
    CFURLRef v32 = (const __CFString *)*MEMORY[0x189605670];
    CFStringRef v33 = (const __CFString *)*MEMORY[0x189605018];
    do
    {
      cfa[0] = 0LL;
      ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(URLParentageArray, v31);
      if (cfa[0])
      {
        CFRelease(cfa[0]);
        cfa[0] = 0LL;
      }

      if (CFURLCopyResourcePropertyForKey(ValueAtIndex, v32, cfa, 0LL)
        && cfa[0]
        && sameFileURL(ValueAtIndex, cfa[0]))
      {
        CFArrayAppendValue(Mutable, cfa[0]);
        LOBYTE(v30) = v30 | (v31 != 0);
      }

      else
      {
        CFArrayAppendValue(Mutable, v33);
      }

      if (cfa[0]) {
        CFRelease(cfa[0]);
      }
      ++v31;
    }

    while (Count != v31);
    char allocator = v30;
    if (Count >= 2)
    {
      uint64_t v35 = v15;
      uint64_t v36 = (const __CFString *)*MEMORY[0x189605438];
      CFIndex v37 = 1LL;
      while (1)
      {
        uint64_t v38 = (const __CFURL *)CFArrayGetValueAtIndex(URLParentageArray, v37);
        cfa[0] = 0LL;
        if (v135)
        {
          CFRelease(v135);
          CFTypeRef v135 = 0LL;
        }

        if (CFURLCopyResourcePropertyForKey(v38, v36, cfa, (CFErrorRef *)&v135))
        {
          CFStringRef PathComponent = (CFStringRef)cfa[0];
        }

        else
        {
          if ((v131 & 0x10000000) == 0)
          {
            if (cfa[0]) {
              CFRelease(cfa[0]);
            }
            cfa[0] = 0LL;
LABEL_44:
            CFStringRef PathComponent = v33;
            goto LABEL_45;
          }

          CFStringRef PathComponent = CFURLCopyLastPathComponent(v38);
          if (cfa[0] != PathComponent)
          {
            if (cfa[0]) {
              CFRelease(cfa[0]);
            }
            cfa[0] = PathComponent;
          }
        }

        if (!PathComponent) {
          goto LABEL_44;
        }
LABEL_45:
        CFArrayAppendValue(theArray, PathComponent);
        CFTypeRef propertyValueTypeRefPtr = 0LL;
        _CFURLGetVolumePropertyFlags();
        if (propertyValueTypeRefPtr) {
          CFTypeRef v40 = propertyValueTypeRefPtr;
        }
        else {
          CFTypeRef v40 = v33;
        }
        CFArrayAppendValue(v133, v40);
        if (propertyValueTypeRefPtr) {
          CFRelease(propertyValueTypeRefPtr);
        }
        if (cfa[0]) {
          CFRelease(cfa[0]);
        }
        if (Count == ++v37)
        {
          int v30 = 1;
          unsigned int v15 = v35;
          goto LABEL_60;
        }
      }
    }

    int v30 = 0;
LABEL_60:
    uint64_t v29 = (const __CFString *)theArray;
  }

  BookmarkMutableData::encodeItem((uint64_t **)this, 0x1004u, v29, 0);
  if (!CFArrayGetCount((CFArrayRef)v29)
    && CFURLCopyResourcePropertyForKey(v15, (CFStringRef)*MEMORY[0x189605438], cfa, 0LL)
    && cfa[0])
  {
    BookmarkMutableData::encodeItem((uint64_t **)this, 0x1020u, (const __CFString *)cfa[0], 0);
    CFRelease(cfa[0]);
  }

  if (v135) {
    v41 = 0LL;
  }
  else {
    v41 = &v135;
  }
  encodeResourcePropertyIntoBookmark( (uint64_t **)this,  v15,  (CFStringRef)*MEMORY[0x1896052B0],  0x1040u,  (CFErrorRef *)v41);
  if (v127)
  {
    CFIndex v42 = CFArrayGetCount(v127);
    v138.CFIndex location = 0LL;
    v138.CFIndex length = v42;
    BOOL v43 = CFArrayContainsValue(v127, v138, (const void *)*MEMORY[0x1896053B8]) != 0;
    v139.CFIndex location = 0LL;
    v139.CFIndex length = v42;
    uint64_t v44 = v43 | (2LL * (CFArrayContainsValue(v127, v139, (const void *)*MEMORY[0x189605378]) != 0));
    v140.CFIndex location = 0LL;
    v140.CFIndex length = v42;
    uint64_t v45 = v44 | (4LL * (CFArrayContainsValue(v127, v140, (const void *)*MEMORY[0x1896053C8]) != 0));
    v141.CFIndex location = 0LL;
    v141.CFIndex length = v42;
    uint64_t v46 = v45 | (8LL * (CFArrayContainsValue(v127, v141, (const void *)*MEMORY[0x1896053E8]) != 0));
    v142.CFIndex location = 0LL;
    v142.CFIndex length = v42;
    uint64_t v47 = v46 | (16LL * (CFArrayContainsValue(v127, v142, (const void *)*MEMORY[0x1896053A0]) != 0));
    v143.CFIndex location = 0LL;
    v143.CFIndex length = v42;
    uint64_t v48 = v47 | (32LL * (CFArrayContainsValue(v127, v143, (const void *)*MEMORY[0x1896053D0]) != 0));
    v144.CFIndex location = 0LL;
    v144.CFIndex length = v42;
    unint64_t v49 = v48 | ((unint64_t)(CFArrayContainsValue(v127, v144, (const void *)*MEMORY[0x1896053E0]) != 0) << 6);
    v145.CFIndex location = 0LL;
    v145.CFIndex length = v42;
    unint64_t v50 = v49 | ((unint64_t)(CFArrayContainsValue(v127, v145, (const void *)*MEMORY[0x189605390]) != 0) << 7);
    v146.CFIndex location = 0LL;
    v146.CFIndex length = v42;
    unint64_t v51 = v50 | ((unint64_t)(CFArrayContainsValue(v127, v146, (const void *)*MEMORY[0x189605360]) != 0) << 8);
    v147.CFIndex location = 0LL;
    v147.CFIndex length = v42;
    unint64_t v52 = v51 | ((unint64_t)(CFArrayContainsValue(v127, v147, (const void *)*MEMORY[0x189605370]) != 0) << 9);
  }

  else
  {
    unint64_t v52 = 0LL;
  }

  uint64_t v53 = v126;
  if (v135)
  {
    CFRelease(v135);
    CFTypeRef v135 = 0LL;
  }

  if ((v131 & 0x400) != 0) {
    uint64_t v54 = v52 | 0x21F;
  }
  else {
    uint64_t v54 = v52;
  }
  CFTypeRef propertyValueTypeRefPtr = 0LL;
  if (_CFURLGetResourcePropertyFlags())
  {
    cfa[0] = propertyValueTypeRefPtr;
    cfa[1] = (CFTypeRef)(v54 | 0xF);
    cfa[2] = (CFTypeRef)v54;
    BookmarkMutableData::encodeRawData((uint64_t **)this, 0x1010u, (UInt8 *)cfa, 24LL);
  }

  if (CFURLIsFileReferenceURL(v15)) {
    BookmarkMutableData::encodeItem((uint64_t **)this, 0xD001u, (const __CFString *)*MEMORY[0x189604DE8], 0);
  }
  if (CFURLGetBaseURL(v15))
  {
    uint64_t v55 = CFURLGetBaseURL(v15);
    unint64_t v56 = CFArrayCreateMutable(v126, 0LL, MEMORY[0x189605228]);
    unint64_t v57 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    if (v30)
    {
      int v30 = 0;
      uint64_t v58 = Count + 1;
      do
      {
        v59 = CFArrayGetValueAtIndex(URLParentageArray, v58 - 2);
        if (v55 && sameFileURL(v59, v55))
        {
          LODWORD(propertyValueTypeRefPtr) = v30;
          CFNumberRef v60 = CFNumberCreate(v57, kCFNumberSInt32Type, &propertyValueTypeRefPtr);
          CFArrayInsertValueAtIndex(v56, 0LL, v60);
          if (v60) {
            CFRelease(v60);
          }
          uint64_t v55 = CFURLGetBaseURL(v55);
          int v30 = 0;
        }

        ++v30;
        --v58;
      }

      while (v58 > 2);
    }

    LODWORD(propertyValueTypeRefPtr) = v30;
    CFNumberRef v61 = CFNumberCreate(v57, kCFNumberSInt32Type, &propertyValueTypeRefPtr);
    CFArrayInsertValueAtIndex(v56, 0LL, v61);
    if (v61) {
      CFRelease(v61);
    }
    BookmarkMutableData::encodeItem((uint64_t **)this, 0xE003u, (const __CFString *)v56, 0);
    uint64_t v53 = v126;
    if (v56) {
      CFRelease(v56);
    }
  }

  if (v128)
  {
    CFTypeID v62 = CFGetTypeID(v128);
    if (v62 == CFURLGetTypeID() && !sameFileURL(v128, v15))
    {
      v63 = createNormalizedFileURL(v128);
      uint64_t v64 = createURLParentageArray(v53, v63);
      CFIndex v65 = CFArrayGetCount(URLParentageArray);
      CFIndex v66 = CFArrayGetCount(v64);
      if (v66 >= v65) {
        uint64_t v67 = v65;
      }
      else {
        uint64_t v67 = v66;
      }
      if (v67 >= 1)
      {
        CFIndex v68 = 0LL;
        while (1)
        {
          v69 = CFArrayGetValueAtIndex(URLParentageArray, v68);
          v70 = CFArrayGetValueAtIndex(v64, v68);
          if (v67 == ++v68)
          {
            CFIndex v68 = v67;
            break;
          }
        }

        if ((unint64_t)v68 > 1)
        {
          BookmarkMutableData::encodeItem((uint64_t **)this, 0x1056u, (const __CFString *)*MEMORY[0x189604DE8], 0);
          if (CFArrayGetCount(v64) > v68)
          {
            CFIndex v71 = CFArrayGetCount(v64);
            if (v71 - v68 <= 2147483646) {
              BookmarkMutableData::encodeValue((void **)this, 0x1054u, v71 - v68, 0);
            }
          }

          if (CFArrayGetCount(URLParentageArray) > v68)
          {
            CFIndex v72 = CFArrayGetCount(URLParentageArray);
            if (v72 - v68 <= 2147483646) {
              BookmarkMutableData::encodeValue((void **)this, 0x1055u, v72 - v68, 0);
            }
          }
        }
      }

      if (v64) {
        CFRelease(v64);
      }
      uint64_t v53 = v126;
      if (v63) {
        CFRelease(v63);
      }
    }
  }

  CFURLRef v73 = copyUserHomeFolderURL(v53);
  unint64_t v74 = v131;
  if (v73)
  {
    CFURLRef v75 = v73;
    if (sameFileURL(v15, v73))
    {
      CFRelease(v75);
      goto LABEL_118;
    }

    CFIndex v85 = CFArrayGetCount(URLParentageArray);
    if (v85 < 1)
    {
LABEL_137:
      CFRelease(v75);
      unint64_t v74 = v131;
      goto LABEL_138;
    }

    unint64_t v86 = v85;
    BOOL v87 = 0;
    do
    {
      v88 = CFArrayGetValueAtIndex(URLParentageArray, v86 - 1);
      if (v88) {
        BOOL v87 = sameFileURL(v88, v75) != 0;
      }
      if (v86 < 2) {
        break;
      }
      --v86;
    }

    while (!v87);
    CFRelease(v75);
    unint64_t v74 = v131;
    uint64_t v53 = v126;
    if (v87)
    {
LABEL_118:
      CFURLRef v76 = copyUserHomeFolderURL(v53);
      if (!v76) {
        goto LABEL_138;
      }
      CFURLRef v75 = v76;
      CFIndex v77 = CFArrayGetCount(URLParentageArray);
      while (v77-- >= 1)
      {
        uint64_t v79 = CFArrayGetValueAtIndex(URLParentageArray, v77);
        if (sameFileURL(v79, v75))
        {
          unsigned __int8 v80 = (const void *)(~v77 + CFArrayGetCount(URLParentageArray));
          uint64_t v81 = (const __CFAllocator *)*MEMORY[0x189604DB0];
          CFTypeRef propertyValueTypeRefPtr = v80;
          CFRange v82 = (const __CFString *)CFNumberCreate(v81, kCFNumberLongType, &propertyValueTypeRefPtr);
          BookmarkMutableData::encodeItem((uint64_t **)this, 0xC001u, v82, 0);
          if (v82) {
            CFRelease(v82);
          }
          v83 = (const __CFString *)CFCopyUserName();
          BookmarkMutableData::encodeItem((uint64_t **)this, 0xC011u, v83, 0);
          if (v83) {
            CFRelease(v83);
          }
          LODWORD(propertyValueTypeRefPtr) = _CFGetEUID();
          v84 = (const __CFString *)CFNumberCreate(v81, kCFNumberSInt32Type, &propertyValueTypeRefPtr);
          BookmarkMutableData::encodeItem((uint64_t **)this, 0xC012u, v84, 0);
          if (v84) {
            CFRelease(v84);
          }
          uint64_t v53 = v126;
          goto LABEL_137;
        }
      }

      goto LABEL_137;
    }
  }

LABEL_138:
  if ((allocator & 1) != 0)
  {
    v129 = v15;
    v89 = CFArrayCreateMutable(v53, Count, MEMORY[0x189605228]);
    v90 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    LODWORD(propertyValueTypeRefPtr) = 0;
    allocatora = v90;
    CFNumberRef v91 = CFNumberCreate(v90, kCFNumberSInt32Type, &propertyValueTypeRefPtr);
    if (Count >= 1)
    {
      for (CFIndex i = 0LL; i != Count; ++i)
        CFArrayInsertValueAtIndex(v89, i, v91);
      CFIndex v93 = Count;
      int v94 = v125;
      do
      {
        CFIndex v95 = v93--;
        v96 = CFArrayGetValueAtIndex(Mutable, v93);
        if (v96)
        {
          v97 = v96;
          CFTypeID v98 = CFGetTypeID(v96);
          if (v98 == CFURLGetTypeID())
          {
            v148.CFIndex length = Count - v95;
            v148.CFIndex location = v95;
            CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(Mutable, v148, v97);
            this = v130;
            if (FirstIndexOfValue == -1)
            {
              if (v135)
              {
                CFRelease(v135);
                CFTypeRef v135 = 0LL;
              }

              if (addVolumeInfoForURLToBookmark(v126, v130, v97, v131, v94, v127, (__CFError **)&v135))
              {
                LODWORD(propertyValueTypeRefPtr) = v94;
                CFNumberRef v101 = CFNumberCreate(allocatora, kCFNumberSInt32Type, &propertyValueTypeRefPtr);
                CFArraySetValueAtIndex(v89, v93, v101);
                if (v101) {
                  CFRelease(v101);
                }
              }
            }

            else
            {
              v100 = CFArrayGetValueAtIndex(v89, FirstIndexOfValue);
              CFArraySetValueAtIndex(v89, v93, v100);
            }

            if (BookmarkMutableData::tocExists(v130, v94))
            {
              do
              {
                else {
                  int v94 = 61440;
                }
              }

              while ((BookmarkMutableData::tocExists(v130, v94) & 1) != 0);
            }
          }

          else
          {
            this = v130;
          }
        }
      }

      while (v95 > 1);
    }

    BookmarkMutableData::encodeItem((uint64_t **)this, 0x2000u, (const __CFString *)v89, 0);
    if (v91) {
      CFRelease(v91);
    }
    unsigned int v15 = v129;
    a7 = v125;
  }

  else
  {
    a7 = v125;
    if (CFArrayGetCount(Mutable) < 1) {
      goto LABEL_171;
    }
    v89 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x189604DB0], @"/", kCFURLPOSIXPathStyle, 1u);
    v102 = CFArrayGetValueAtIndex(Mutable, 0LL);
    if (v135)
    {
      CFRelease(v135);
      CFTypeRef v135 = 0LL;
    }

    addVolumeInfoForURLToBookmark(v53, this, v102, v74, v125, v127, (__CFError **)&v135);
  }

  if (v89) {
    CFRelease(v89);
  }
LABEL_171:
  CFTypeRef propertyValueTypeRefPtr = 0LL;
  v103 = (const __CFString *)*MEMORY[0x1896052B8];
  if (CFURLCopyResourcePropertyForKey(v15, (CFStringRef)*MEMORY[0x1896052B8], &propertyValueTypeRefPtr, 0LL)) {
    BOOL v104 = propertyValueTypeRefPtr == 0LL;
  }
  else {
    BOOL v104 = 1;
  }
  if (!v104)
  {
    BookmarkMutableData::encodeItem((void **)this, v103, (const __CFString *)propertyValueTypeRefPtr, 0);
    CFRelease(propertyValueTypeRefPtr);
  }

  if (v133) {
    CFRelease(v133);
  }
  if (theArray) {
    CFRelease(theArray);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (URLParentageArray) {
    CFRelease(URLParentageArray);
  }
  if (NormalizedFileURL) {
    CFRelease(NormalizedFileURL);
  }
  int v20 = v124;
  int v19 = a9;
  LOBYTE(v18) = v123;
  a5 = v127;
  if ((v131 & 0x400) != 0)
  {
LABEL_187:
    if (a7 == 1)
    {
      encodeResourcePropertyIntoBookmark((uint64_t **)this, v15, (CFStringRef)*MEMORY[0x189605418], 0xF017u, 0LL);
      encodeResourcePropertyIntoBookmark((uint64_t **)this, v15, (CFStringRef)*MEMORY[0x189604D18], 0xF022u, 0LL);
    }
  }

LABEL_189:
  if (a5)
  {
    CFTypeID v105 = CFGetTypeID(a5);
    if (v105 == CFArrayGetTypeID() && CFArrayGetCount(a5) >= 1)
    {
      CFIndex v106 = 0LL;
      do
      {
        v107 = (const __CFString *)CFArrayGetValueAtIndex(a5, v106);
        if (v107)
        {
          v108 = v107;
          CFTypeID v109 = CFGetTypeID(v107);
          if (v109 == CFStringGetTypeID())
          {
            cfa[0] = 0LL;
            if (v135)
            {
              CFRelease(v135);
              CFTypeRef v135 = 0LL;
            }

            int v110 = CFURLCopyResourcePropertyForKey(v15, v108, cfa, (CFErrorRef *)&v135);
            CFTypeRef v111 = cfa[0];
            if (v110 && cfa[0])
            {
              BookmarkMutableData::encodeItem((void **)this, v108, (const __CFString *)cfa[0], 0);
              CFTypeRef v111 = cfa[0];
            }

            if (v111) {
              CFRelease(v111);
            }
          }
        }

        ++v106;
      }

      while (v106 < CFArrayGetCount(a5));
    }
  }

  if ((v131 & 0x20000400) == 0 && CFURLGetFileSystemRepresentation(v15, 1u, (UInt8 *)cfa, 1024LL))
  {
    if ((v131 & 0x40000000) != 0
      || (getpid(), sandbox_check())
      || (v114 = (const char *)sandbox_extension_issue_file()) == 0LL)
    {
      getpid();
      v119 = (const char *)sandbox_extension_issue_file();
      if (!v119) {
        goto LABEL_204;
      }
      v115 = (UInt8 *)v119;
      CFIndex v116 = strlen(v119) + 1;
      v117 = (uint64_t **)this;
      unsigned int v118 = 61569;
    }

    else
    {
      v115 = (UInt8 *)v114;
      CFIndex v116 = strlen(v114) + 1;
      v117 = (uint64_t **)this;
      unsigned int v118 = 61568;
    }

    BookmarkMutableData::encodeRawData(v117, v118, v115, v116);
    free(v115);
  }

      uint64_t v26 = 4294967260LL;
    }

LABEL_204:
  BookmarkMutableData::finalizeTOC(this, a7);
  if (v19) {
    char v112 = v18;
  }
  else {
    char v112 = 1;
  }
  if ((v112 & 1) == 0)
  {
    v113 = (__CFError *)v135;
    if (v135) {
      CFTypeRef v135 = 0LL;
    }
    else {
      v113 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 256LL, 0LL);
    }
    *int v19 = v113;
  }

  if (v20) {
    CFRelease(v20);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (v135) {
    CFRelease(v135);
  }
}

CFDataRef _CFURLCreateBookmarkData( const __CFAllocator *a1, const __CFURL *a2, unint64_t a3, const __CFArray *a4, const __CFURL *a5, __CFError **a6)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  uint64_t v12 = _os_activity_create( &dword_182E77000,  "CFURLCreateBookmarkData",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v12, &v17);
  int v13 = (os_log_s *)bmarkLog;
  if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    int v19 = "_CFURLCreateBookmarkData";
    __int16 v20 = 2048;
    BOOL v21 = a2;
    __int16 v22 = 2112;
    uint64_t v23 = a2;
    __int16 v24 = 2048;
    unint64_t v25 = a3;
    __int16 v26 = 2112;
    uint64_t v27 = a4;
    __int16 v28 = 2112;
    uint64_t v29 = a5;
    _os_log_debug_impl( &dword_182E77000,  v13,  OS_LOG_TYPE_DEBUG,  "%s: <%p: %@> options=%#lx propertiesToInclude=%@ relativeToURL=%@",  buf,  0x3Eu);
  }

  CFDataRef v14 = __CFURLCreateBookmarkData(a1, a2, a3, a4, a5, a6);
  unsigned int v15 = (os_log_s *)bmarkLog;
  if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_DEBUG)) {
    _CFURLCreateBookmarkData_cold_1((uint64_t)v14, v15);
  }
  os_release(v12);
  os_activity_scope_leave(&v17);
  return v14;
}

CFURLRef createNormalizedFileURL(const __CFURL *a1)
{
  if (_CFURLIsFileURL())
  {
    uint64_t v2 = CFGetAllocator(a1);
    uint64_t v32 = 0LL;
    int v3 = _CFURLGetResourcePropertyFlags() ? (v32 >> 1) & 1 : CFURLHasDirectoryPath(a1);
    int v4 = CFURLCopyAbsoluteURL(a1);
    if (v4)
    {
      unsigned int v5 = v4;
      unsigned int v6 = CFURLCopyPath(v4);
      if (!v6)
      {
        CFURLRef v11 = 0LL;
LABEL_48:
        CFRelease(v5);
        return v11;
      }

      unsigned int v7 = v6;
      CleanPath = CreateCleanPath(v2, v6);
      if (!CleanPath)
      {
        CFURLRef v11 = 0LL;
LABEL_47:
        CFRelease(v7);
        goto LABEL_48;
      }

      unsigned int v9 = CleanPath;
      if (CFStringCompare(CleanPath, @"/", 0LL) == kCFCompareEqualTo)
      {
        uint64_t v12 = (const __CFString *)CFRetain(@"file:///");
        if (v12)
        {
LABEL_45:
          CFURLRef v11 = CFURLCreateWithString(v2, v12, 0LL);
          CFRelease(v12);
          goto LABEL_46;
        }

void encodeResourcePropertyIntoBookmark( uint64_t **a1, CFURLRef url, CFStringRef key, unsigned int a4, CFErrorRef *error)
{
  CFTypeRef propertyValueTypeRefPtr = 0LL;
  int v7 = CFURLCopyResourcePropertyForKey(url, key, &propertyValueTypeRefPtr, error);
  unsigned int v8 = propertyValueTypeRefPtr;
  if (v7 && propertyValueTypeRefPtr)
  {
    BookmarkMutableData::encodeItem(a1, a4, propertyValueTypeRefPtr, 0);
    unsigned int v8 = propertyValueTypeRefPtr;
  }

  if (v8) {
    CFRelease(v8);
  }
}

CFURLRef copyUserHomeFolderURL(const __CFAllocator *a1)
{
  uint64_t v2 = (const __CFURL *)CFCopyHomeDirectoryURLForUser();
  if (v2)
  {
    int v3 = v2;
    int v4 = CFURLGetString(v2);
    CFURLRef v5 = CFURLCreateWithString(a1, v4, 0LL);
    CFRelease(v3);
  }

  else
  {
    CFURLRef v5 = 0LL;
  }

  pthread_mutex_unlock(&copyUserHomeFolderURL(__CFAllocator const*,unsigned long)::sCopyHomeFolderLock);
  return v5;
}

uint64_t addVolumeInfoForURLToBookmark( const __CFAllocator *a1, BookmarkMutableData *a2, CFTypeRef cf, unint64_t a4, int a5, const __CFArray *a6, __CFError **a7)
{
  CFTypeRef propertyValueTypeRefPtr = 0LL;
  if (!cf) {
    return 0LL;
  }
  CFTypeID v14 = CFGetTypeID(cf);
  if (v14 != CFURLGetTypeID()) {
    return 0LL;
  }
  int v15 = CFURLCopyResourcePropertyForKey((CFURLRef)cf, (CFStringRef)*MEMORY[0x189605670], &propertyValueTypeRefPtr, a7);
  int v16 = propertyValueTypeRefPtr;
  if (!v15)
  {
    uint64_t v22 = 0LL;
    if (!propertyValueTypeRefPtr) {
      return v22;
    }
    goto LABEL_51;
  }

  if (!propertyValueTypeRefPtr) {
    return 0LL;
  }
  char v17 = BookmarkMutableData::tocExists(a2, a5);
  BookmarkMutableData::createTOC(a2, a5);
  encodeResourcePropertyIntoBookmark( (uint64_t **)a2,  (CFURLRef)propertyValueTypeRefPtr,  (CFStringRef)*MEMORY[0x1896055A0],  0x2010u,  a7);
  encodeResourcePropertyIntoBookmark( (uint64_t **)a2,  (CFURLRef)propertyValueTypeRefPtr,  (CFStringRef)*MEMORY[0x189605658],  0x2012u,  a7);
  encodeResourcePropertyIntoBookmark( (uint64_t **)a2,  (CFURLRef)propertyValueTypeRefPtr,  (CFStringRef)*MEMORY[0x1896052B0],  0x2013u,  a7);
  encodeResourcePropertyIntoBookmark( (uint64_t **)a2,  (CFURLRef)propertyValueTypeRefPtr,  (CFStringRef)*MEMORY[0x189605678],  0x2011u,  a7);
  if (a6)
  {
    CFIndex Count = CFArrayGetCount(a6);
    v36.CFIndex location = 0LL;
    v36.CFIndex length = Count;
    uint64_t v19 = CFArrayContainsValue(a6, v36, (const void *)*MEMORY[0x189605618]) != 0;
    v37.CFIndex location = 0LL;
    v37.CFIndex length = Count;
    else {
      uint64_t v20 = v19 << 32;
    }
    v38.CFIndex location = 0LL;
    v38.CFIndex length = Count;
    v39.CFIndex location = 0LL;
    v39.CFIndex length = Count;
    v40.CFIndex location = 0LL;
    v40.CFIndex length = Count;
    v41.CFIndex location = 0LL;
    v41.CFIndex length = Count;
    v42.CFIndex location = 0LL;
    v42.CFIndex length = Count;
    v43.CFIndex location = 0LL;
    v43.CFIndex length = Count;
    v44.CFIndex location = 0LL;
    v44.CFIndex length = Count;
    else {
      uint64_t v21 = v20;
    }
  }

  else
  {
    uint64_t v21 = 0LL;
  }

  *(void *)bytes = 0LL;
  uint64_t v32 = 0LL;
  uint64_t v33 = 0LL;
  CFTypeRef cfa = 0LL;
  if (_CFURLGetVolumePropertyFlags())
  {
    uint64_t v24 = (a4 & 0x400) != 0 ? v21 | 0x1000013EFLL : v21;
    *(void *)bytes = cfa;
    uint64_t v32 = v21 | 0x1000013EFLL;
    uint64_t v33 = v24;
    BookmarkMutableData::encodeRawData((uint64_t **)a2, 0x2020u, bytes, 24LL);
    if ((bytes[1] & 2) != 0)
    {
      CFTypeRef cfa = 0LL;
      int v25 = CFURLCopyResourcePropertyForKey( (CFURLRef)propertyValueTypeRefPtr,  (CFStringRef)*MEMORY[0x189604BD8],  &cfa,  0LL);
      CFTypeRef v26 = cfa;
      if (v25 && cfa)
      {
        CFTypeID v27 = CFGetTypeID(cfa);
        if (v27 == CFURLGetTypeID())
        {
          int UnusedDepth = BookmarkMutableData::findUnusedDepth(a2, 4000LL, 0xFFFFFFFF);
          if (UnusedDepth)
          {
            unsigned int v29 = UnusedDepth;
            BookmarkMutableData::encodeValue((void **)a2, 0x2040u, UnusedDepth, 0);
            createBookmarkWithURLAtDepth(a1, cfa, a4, 0LL, 0LL, a2, v29, 1, a7);
          }
        }

        CFTypeRef v26 = cfa;
      }

      if (v26) {
        CFRelease(v26);
      }
    }
  }

  uint64_t v30 = CFURLCopyFileSystemPath((CFURLRef)propertyValueTypeRefPtr, kCFURLPOSIXPathStyle);
  if (v30) {
    BookmarkMutableData::encodeItem((uint64_t **)a2, 0x2002u, v30, 0);
  }
  if ((v17 & 1) == 0) {
    BookmarkMutableData::finalizeTOC(a2, a5);
  }
  if (v30) {
    CFRelease(v30);
  }
  uint64_t v22 = 1LL;
  int v16 = propertyValueTypeRefPtr;
  if (propertyValueTypeRefPtr) {
LABEL_51:
  }
    CFRelease(v16);
  return v22;
}

CFStringRef CreateCleanPath(const __CFAllocator *a1, CFStringRef theString)
{
  v17[1] = *MEMORY[0x1895F89C0];
  CFIndex Length = CFStringGetLength(theString);
  if (!Length) {
    return CFStringCreateCopy(a1, theString);
  }
  CFIndex v5 = Length;
  if (Length > 1024)
  {
    CFIndex v13 = (UniChar *)MEMORY[0x186E19944](a1, 2 * Length, 0LL);
    uint64_t v14 = MEMORY[0x186E19944](a1, 2 * v5 + 2, 0LL);
    int v15 = (UniChar *)v14;
    if (v13 && v14)
    {
      v19.CFIndex location = 0LL;
      v19.CFIndex length = v5;
      CFStringGetCharacters(theString, v19, v13);
      CFStringRef CleanPathInternal = CreateCleanPathInternal(a1, v5, v13, v15);
    }

    else
    {
      CFStringRef CleanPathInternal = 0LL;
      CFStringRef v11 = 0LL;
      if (!v13) {
        goto LABEL_10;
      }
    }

    CFAllocatorDeallocate(a1, v13);
    CFStringRef v11 = CleanPathInternal;
LABEL_10:
    if (v15) {
      CFAllocatorDeallocate(a1, v15);
    }
    return v11;
  }

  uint64_t v6 = MEMORY[0x1895F8858](Length);
  unsigned int v8 = (UniChar *)((char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  MEMORY[0x1895F8858](v6);
  unsigned int v10 = (UniChar *)((char *)v17 - ((v9 + 17) & 0xFFFFFFFFFFFFFFF0LL));
  v18.CFIndex location = 0LL;
  v18.CFIndex length = v5;
  CFStringGetCharacters(theString, v18, v8);
  return CreateCleanPathInternal(a1, v5, v8, v10);
}

CFStringRef CreateCleanPathInternal(CFAllocatorRef alloc, uint64_t a2, unsigned __int16 *a3, UniChar *chars)
{
  if (*a3 == 47)
  {
    *chars = 47;
    uint64_t v8 = 1LL;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  if (v8 < a2)
  {
    uint64_t v9 = v8;
    while (1)
    {
      int v10 = 0;
      int v11 = 0;
      if (a2 <= v9 + 1) {
        uint64_t v12 = v9 + 1;
      }
      else {
        uint64_t v12 = a2;
      }
      uint64_t v13 = v9;
      while (a3[v13] != 47)
      {
        if (v10) {
          int v14 = v10;
        }
        else {
          int v14 = a3[v13];
        }
        if (v11) {
          int v10 = v14;
        }
        else {
          int v11 = a3[v13];
        }
        if (v12 == ++v13)
        {
          uint64_t v13 = v12;
          break;
        }
      }

      uint64_t v15 = v13 - v9;
      if (v11 == 46)
      {
        if (v13 != v9 && v15 != 1)
        {
          if (v10 != 46 || v15 != 2)
          {
LABEL_30:
            memcpy(&chars[v8], &a3[v9], 2 * v15);
            chars[v15 + v8] = 47;
            uint64_t v16 = v15 + v8 + 1;
            goto LABEL_31;
          }

          if (v8 >= 2)
          {
            do
            {
              uint64_t v16 = v8 - 1;
              if (v8 == 1) {
                break;
              }
              int v17 = chars[v8-- - 2];
            }

            while (v17 != 47);
            goto LABEL_31;
          }
        }
      }

      else if (v13 != v9)
      {
        goto LABEL_30;
      }

      uint64_t v16 = v8;
LABEL_31:
      uint64_t v9 = v13 + 1;
      uint64_t v8 = v16;
      if (v13 + 1 >= a2) {
        return CFStringCreateWithCharacters(alloc, chars, v16 - (v16 > 1));
      }
    }
  }

  uint64_t v16 = v8;
  return CFStringCreateWithCharacters(alloc, chars, v16 - (v16 > 1));
}

void _FileCacheReleaseContents(uint64_t a1, int a2, int a3, int a4, int a5)
{
  if (!a5)
  {
    _FileCacheLock(a1);
    _FileCacheLockTransitionToPreparer(a1);
  }

  int v10 = *(const void **)(a1 + 56);
  if (v10)
  {
    CFRelease(v10);
    *(void *)(a1 + 56) = 0LL;
  }

  int v11 = *(const void **)(a1 + 272);
  if (v11)
  {
    CFRelease(v11);
    *(void *)(a1 + 272) = 0LL;
  }

  uint64_t v12 = *(const void **)(a1 + 280);
  if (v12)
  {
    CFRelease(v12);
    *(void *)(a1 + 280) = 0LL;
  }

  uint64_t v13 = *(const void **)(a1 + 288);
  if (v13)
  {
    *(void *)(a1 + 288) = 0LL;
    CFRelease(v13);
  }

  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  if (a3)
  {
LABEL_12:
    if (a4) {
      goto LABEL_25;
    }
    if (a5)
    {
      int v14 = *(const void **)(a1 + 304);
      if (v14)
      {
        *(void *)(a1 + 304) = 0LL;
        CFRelease(v14);
      }

      goto LABEL_25;
    }

    goto LABEL_22;
  }

  if (a5)
  {
    uint64_t v15 = *(const void **)(a1 + 296);
    if (v15)
    {
      *(void *)(a1 + 296) = 0LL;
      CFRelease(v15);
    }

    goto LABEL_12;
  }

  os_unfair_lock_lock((os_unfair_lock_t)&sTempPermDictionaryLock);
  uint64_t v16 = *(const void **)(a1 + 296);
  if (v16)
  {
    *(void *)(a1 + 296) = 0LL;
    CFRelease(v16);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&sTempPermDictionaryLock);
  if (!a4)
  {
LABEL_22:
    os_unfair_lock_lock((os_unfair_lock_t)&sTempPermDictionaryLock);
    int v17 = *(const void **)(a1 + 304);
    if (v17)
    {
      *(void *)(a1 + 304) = 0LL;
      CFRelease(v17);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)&sTempPermDictionaryLock);
  }

LABEL_25:
  CFRange v18 = *(const void **)(a1 + 312);
  if (v18)
  {
    CFRelease(v18);
    *(void *)(a1 + 312) = 0LL;
  }

  if (a2) {
    atomic_store(0xFFFFFFFF, (unsigned int *)(a1 + 16));
  }
  if (!a5)
  {
    _FileCacheLockTransitionFromPreparer(a1);
    int v19 = *(_DWORD *)(a1 + 32) - 1;
    *(_DWORD *)(a1 + 32) = v19;
    if (!v19)
    {
      *(void *)(a1 + 24) = 0LL;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 36));
    }
  }

    uint64_t v9 = (const void *)*MEMORY[0x189604F58];
    goto LABEL_40;
  }

pthread_t _FileCacheLock(uint64_t a1)
{
  uint64_t v2 = *(_opaque_pthread_t **)(a1 + 24);
  pthread_t result = pthread_self();
  if (v2 == result)
  {
    int v4 = *(_DWORD *)(a1 + 32) + 1;
  }

  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 36));
    pthread_t result = pthread_self();
    *(void *)(a1 + 24) = result;
    int v4 = 1;
  }

  *(_DWORD *)(a1 + 32) = v4;
  return result;
}

uint64_t _FileCacheLockTransitionToPreparer(uint64_t a1)
{
  uint64_t v2 = (os_unfair_lock_s *)(a1 + 36);
  os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 36));
  uint64_t v3 = os_unfair_recursive_lock_trylock();
  int v4 = *(_DWORD *)(a1 + 32);
  *(void *)(a1 + 24) = 0LL;
  os_unfair_lock_unlock(v2);
  if ((v3 & 1) == 0) {
    os_unfair_recursive_lock_lock_with_options();
  }
  if (v4 >= 2)
  {
    os_unfair_lock_lock(v2);
    *(_DWORD *)(a1 + 32) = v4 - 1;
    *(void *)(a1 + 24) = pthread_self();
  }

  return v3;
}

void _FileCacheLockTempPermProperties(void)
{
}

void _FileCacheUnlockTempPermProperties(void)
{
}

uint64_t _FileCacheLockTransitionFromPreparer(uint64_t a1)
{
  uint64_t v2 = *(_opaque_pthread_t **)(a1 + 24);
  if (v2 == pthread_self())
  {
    ++*(_DWORD *)(a1 + 32);
  }

  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 36));
    *(_DWORD *)(a1 + 32) = 1;
    *(void *)(a1 + 24) = pthread_self();
  }

  return os_unfair_recursive_lock_unlock();
}

void _FileCacheUnlock(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 32) - 1;
  *(_DWORD *)(a1 + 32) = v1;
  if (!v1)
  {
    *(void *)(a1 + 24) = 0LL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 36));
  }

uint64_t _FileCacheInitClass(void)
{
  return sFileCacheTypeID;
}

uint64_t ___Z19_FileCacheInitClassv_block_invoke()
{
  uint64_t result = _CFRuntimeRegisterClass();
  sFileCacheCFTypeID TypeID = result;
  return result;
}

double _FileCacheInit(const void *a1)
{
  *((void *)a1 + 3) = 0LL;
  *((void *)a1 + 4) = 0LL;
  *((void *)a1 + 5) = 0LL;
  atomic_store(0xFFFFFFFF, (unsigned int *)a1 + 4);
  atomic_store(0, (unsigned int *)a1 + 5);
  atomic_store(0xFFFFFFFF, (unsigned int *)a1 + 4);
  double result = 0.0;
  *((_OWORD *)a1 + 18) = 0u;
  *((_OWORD *)a1 + 19) = 0u;
  *((_OWORD *)a1 + 16) = 0u;
  *((_OWORD *)a1 + 17) = 0u;
  *((_OWORD *)a1 + 14) = 0u;
  *((_OWORD *)a1 + 15) = 0u;
  *((_OWORD *)a1 + 12) = 0u;
  *((_OWORD *)a1 + 13) = 0u;
  *((_OWORD *)a1 + 10) = 0u;
  *((_OWORD *)a1 + 11) = 0u;
  *((_OWORD *)a1 + 8) = 0u;
  *((_OWORD *)a1 + 9) = 0u;
  *((_OWORD *)a1 + 6) = 0u;
  *((_OWORD *)a1 + 7) = 0u;
  *((_OWORD *)a1 + 4) = 0u;
  *((_OWORD *)a1 + 5) = 0u;
  *((_OWORD *)a1 + 3) = 0u;
  return result;
}

uint64_t _FileCacheFinalize(os_unfair_lock_s *a1)
{
  return os_unfair_recursive_lock_unlock();
}

__CFString *_FileCacheCopyDebugDesc(unsigned int *a1)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  uint64_t v2 = CFGetAllocator(a1);
  _FileCacheLock((uint64_t)a1);
  uint64_t v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  System = CFLocaleGetSystem();
  CFIndex v5 = CFDateFormatterCreate(v3, System, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  if (!v5) {
    _FileCacheCopyDebugDesc();
  }
  uint64_t v6 = v5;
  CFDateFormatterSetFormat(v5, @"MM/dd/yyyy HH:mm:ss.SSS");
  Mutable = CFStringCreateMutable(v2, 0LL);
  if (!Mutable) {
    _FileCacheCopyDebugDesc();
  }
  uint64_t v8 = Mutable;
  uint64_t v9 = atomic_load(a1 + 4);
  CFStringAppendFormat(Mutable, 0LL, @"<_FileCacheRef %p>{\n\tvalidSeed = %d\n\tattributes = (\n"), a1, v9;
  unsigned int v10 = a1[12];
  if ((v10 & 1) != 0)
  {
    int v11 = @"NameIsHidden";
    if ((v10 & 0x800) == 0) {
      int v11 = @"!NameIsHidden";
    }
    uint64_t v12 = @"FaultLogicalFileIsHidden";
    if ((v10 & 0x1000) == 0) {
      uint64_t v12 = @"!FaultLogicalFileIsHidden";
    }
    uint64_t v13 = @"IsMountPoint";
    if ((v10 & 0x2000) == 0) {
      uint64_t v13 = @"!IsMountPoint";
    }
    int v14 = @"IsTrigger";
    if ((v10 & 0x4000) == 0) {
      int v14 = @"!IsTrigger";
    }
    uint64_t v15 = @"HasPathFromID";
    if ((v10 & 0x8000) == 0) {
      uint64_t v15 = @"!HasPathFromID";
    }
    uint64_t v16 = @"Has64BitObjectIDs";
    if ((v10 & 0x10000) == 0) {
      uint64_t v16 = @"!Has64BitObjectIDs";
    }
    int v17 = @"HasExtendedSecurity";
    if ((v10 & 0x20000) == 0) {
      int v17 = @"!HasExtendedSecurity";
    }
    CFRange v18 = @"IsHFSStandard";
    if ((v10 & 0x40000) == 0) {
      CFRange v18 = @"!IsHFSStandard";
    }
    int v19 = @"HasDecmpFSCompression";
    if ((v10 & 0x80000) == 0) {
      int v19 = @"!HasDecmpFSCompression";
    }
    uint64_t v20 = @"SupportsHardLinks";
    if ((v10 & 0x100000) == 0) {
      uint64_t v20 = @"!SupportsHardLinks";
    }
    if ((v10 & 0x200000) != 0) {
      uint64_t v21 = @"SupportsHiddenFiles";
    }
    else {
      uint64_t v21 = @"!SupportsHiddenFiles";
    }
    CFStringAppendFormat( v8,  0LL,  @"\t\thasBase\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n\t\t\t",  v11,  v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21);
    CFStringAppendFormat( v8,  0LL,  @"Name = <CFString %p> %@\n\t\t\tAccessMask = 0%.4lo\n\t\t\tFlags = %lu\n\t\t\tDirFileLinkCFIndex Count = %lu\n\t\t\tGenCFIndex Count = %lu\n\t\t\tDocumentID = %lu\n\t\t\tOwnerID = %d\n\t\t\tGrpID = %d\n\t\t\t",  *((void *)a1 + 7),  *((void *)a1 + 7),  a1[16],  a1[17],  a1[18],  a1[20],  a1[21],  a1[22],  a1[23]);
    if ((*((_BYTE *)a1 + 51) & 8) != 0) {
      CFStringAppendFormat(v8, 0LL, @"extensionCFIndex Length = %hu\n\t\t\t", *((unsigned __int16 *)a1 + 26));
    }
    CFStringAppendFormat(v8, 0LL, @"DataProtectFlags = %lu\n\t\t\t", a1[24]);
    CFStringRef StringWithAbsoluteTime = CFDateFormatterCreateStringWithAbsoluteTime(v3, v6, *((CFAbsoluteTime *)a1 + 13));
    CFStringAppendFormat(v8, 0LL, @"AccTime = %@\n\t\t\t", StringWithAbsoluteTime);
    if (StringWithAbsoluteTime) {
      CFRelease(StringWithAbsoluteTime);
    }
    CFStringRef v23 = CFDateFormatterCreateStringWithAbsoluteTime(v3, v6, *((CFAbsoluteTime *)a1 + 14));
    CFStringAppendFormat(v8, 0LL, @"ModTime = %@\n\t\t\t", v23);
    if (v23) {
      CFRelease(v23);
    }
    CFStringRef v24 = CFDateFormatterCreateStringWithAbsoluteTime(v3, v6, *((CFAbsoluteTime *)a1 + 15));
    CFStringAppendFormat(v8, 0LL, @"ChgTime = %@\n\t\t\t", v24);
    if (v24) {
      CFRelease(v24);
    }
    double v25 = *((double *)a1 + 16);
    double v26 = -1.0 - *MEMORY[0x189604DA0];
    if (v25 == v26)
    {
      CFStringAppend(v8, @"CrTime  = <n/a>\n\t\t\t");
    }

    else
    {
      CFStringRef v27 = CFDateFormatterCreateStringWithAbsoluteTime(v3, v6, v25);
      CFStringAppendFormat(v8, 0LL, @"CrTime  = %@\n\t\t\t", v27);
      if (v27) {
        CFRelease(v27);
      }
    }

    double v28 = *((double *)a1 + 17);
    if (v28 == v26)
    {
      CFStringAppend(v8, @"AddedTime = <n/a>\n\t\t\t");
    }

    else
    {
      CFStringRef v29 = CFDateFormatterCreateStringWithAbsoluteTime(v3, v6, v28);
      CFStringAppendFormat(v8, 0LL, @"AddedTime = %@\n\t\t\t", v29);
      if (v29) {
        CFRelease(v29);
      }
    }

    CFStringAppendFormat(v8, 0LL, @"IOBlockSize = %lu", a1[36]);
    CFStringAppend(v8, @"\n");
    CFStringAppendFormat( v8,  0LL,  @"\t\thasDevice\n\t\t\tFSID = {0x%.8x 0x%.8x}\n\t\t\tVolumeID = %lu\n",  a1[38],  a1[39],  a1[40]);
    unsigned int v30 = a1[12];
    if ((v30 & 4) != 0)
    {
      CFStringAppendFormat( v8,  0LL,  @"\t\thasFileIDs\n\t\t\tInodeNumber = %llu\n\t\t\tFileID = %llu\n\t\t\tParentID = %llu\n",  *((void *)a1 + 21),  *((void *)a1 + 22),  *((void *)a1 + 23));
      unsigned int v30 = a1[12];
      if ((v30 & 8) == 0)
      {
LABEL_47:
        if ((v30 & 0x10) == 0) {
          goto LABEL_48;
        }
        goto LABEL_62;
      }
    }

    else if ((v30 & 8) == 0)
    {
      goto LABEL_47;
    }

    CFIndex v31 = @"userAccessExecuteOK";
    if ((v30 & 0x800000) == 0) {
      CFIndex v31 = @"!userAccessExecuteOK";
    }
    uint64_t v32 = @"userAccessWriteOK";
    if ((v30 & 0x1000000) == 0) {
      uint64_t v32 = @"!userAccessWriteOK";
    }
    if ((v30 & 0x2000000) != 0) {
      uint64_t v33 = @"userAccessReadOK";
    }
    else {
      uint64_t v33 = @"!userAccessReadOK";
    }
    CFStringAppendFormat(v8, 0LL, @"\t\thasUserAccess\n\t\t\t%@\n\t\t\t%@\n\t\t\t%@\n", v31, v32, v33);
    unsigned int v30 = a1[12];
    if ((v30 & 0x10) == 0)
    {
LABEL_48:
      if ((v30 & 0x20) == 0) {
        goto LABEL_49;
      }
      goto LABEL_66;
    }

LABEL_62:
    if ((v30 & 0x4000000) != 0) {
      CFRange v34 = @"finderInfoZeros";
    }
    else {
      CFRange v34 = @"!finderInfoZeros";
    }
    CFStringAppendFormat( v8,  0LL,  @"\t\thasFinderInfo\n\t\t\t%@\n\t\t\tfinderInfo    = %.2x %.2x %.2x %.2x  %.2x %.2x %.2x %.2x  %.2x %.2x %.2x %.2x  %.2x %.2x %.2x %.2x\n\t\t\textFinderInfo = %.2x %.2x %.2x %.2x  %.2x %.2x %.2x %.2x  %.2x %.2x %.2x %.2x  %.2x %.2x %.2x %.2x\n",  v34,  *((unsigned __int8 *)a1 + 208),  *((unsigned __int8 *)a1 + 209),  *((unsigned __int8 *)a1 + 210),  *((unsigned __int8 *)a1 + 211),  *((unsigned __int8 *)a1 + 212),  *((unsigned __int8 *)a1 + 213),  *((unsigned __int8 *)a1 + 214),  *((unsigned __int8 *)a1 + 215),  *((unsigned __int8 *)a1 + 216),  *((unsigned __int8 *)a1 + 217),  *((unsigned __int8 *)a1 + 218),  *((unsigned __int8 *)a1 + 219),  *((unsigned __int8 *)a1 + 220),  *((unsigned __int8 *)a1 + 221),  *((unsigned __int8 *)a1 + 222),  *((unsigned __int8 *)a1 + 223),  *((unsigned __int8 *)a1 + 224),  *((unsigned __int8 *)a1 + 225),  *((unsigned __int8 *)a1 + 226),  *((unsigned __int8 *)a1 + 227),  *((unsigned __int8 *)a1 + 228),  *((unsigned __int8 *)a1 + 229),  *((unsigned __int8 *)a1 + 230),  *((unsigned __int8 *)a1 + 231),  *((unsigned __int8 *)a1 + 232),  *((unsigned __int8 *)a1 + 233),  *((unsigned __int8 *)a1 + 234),  *((unsigned __int8 *)a1 + 235),  *((unsigned __int8 *)a1 + 236),  *((unsigned __int8 *)a1 + 237),  *((unsigned __int8 *)a1 + 238),  *((unsigned __int8 *)a1 + 239));
    unsigned int v30 = a1[12];
    if ((v30 & 0x20) == 0)
    {
LABEL_49:
      if ((v30 & 0x40) == 0) {
        goto LABEL_50;
      }
      goto LABEL_67;
    }

    CFStringRef v24 = 0LL;
    goto LABEL_89;
  }

  uint64_t v33 = URLVolumeProperties;
  if (!v11)
  {
    CFStringRef v24 = 0LL;
    if (!v17 || !v19) {
      goto LABEL_88;
    }
    if (Count >= 1)
    {
      unint64_t v52 = v19;
      uint64_t v46 = 0;
      CFStringRef v38 = 0LL;
      int v39 = (const __CFString *)*MEMORY[0x189605658];
      unint64_t v49 = (__CFString *)*MEMORY[0x1896052B0];
      do
      {
        uint64_t v54 = 0LL;
        CFRange v40 = CFArrayGetValueAtIndex(theArray, v38);
        uint64_t v41 = CFRetain(v40);
        if (v54 != v41)
        {
          if (v54) {
            CFRelease(v54);
          }
          uint64_t v54 = v41;
        }

        if (matchURLProperty((const __CFURL *)v41, v39, v17) && matchURLProperty((const __CFURL *)v54, v49, v52) && v33)
        {
          if (_CFURLGetVolumePropertyFlags())
          {
            if ((v56 & 1) != 0 && (v55 & 1) == 0)
            {
              CFReleaser<__CFData const*>::operator=(&cf, &v54);
              ++v46;
              CFRange v42 = (os_log_s *)resolveLog;
              if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                v59 = cf;
                CFNumberRef v60 = 2112;
                CFNumberRef v61 = v17;
                CFTypeID v62 = 2112;
                v63 = v52;
                _os_log_debug_impl( &dword_182E77000,  v42,  OS_LOG_TYPE_DEBUG,  "(possible) matched volume %@ by capacity=%@ and creationDate=%@ (renamed volume case)",  buf,  0x20u);
              }
            }
          }
        }

        if (v54) {
          CFRelease(v54);
        }
        ++v38;
      }

      while (Count != v38);
      int v19 = v52;
      if (v46 > 1)
      {
        if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
          matchVolumeURLForBookmark();
        }
        if (cf) {
          CFRelease(cf);
        }
        CFStringRef v24 = 0LL;
        goto LABEL_88;
      }
    }

    unint64_t v50 = v17;
    CFIndex v31 = 1;
    CFStringRef v24 = cf;
LABEL_32:
    uint64_t v32 = a4;
    if (!a4) {
      goto LABEL_87;
    }
    goto LABEL_36;
  }

  if (Count < 1) {
    goto LABEL_62;
  }
  CFRange v34 = v19;
  CFRange v35 = 0LL;
  unint64_t v51 = (__CFString *)*MEMORY[0x189605658];
  uint64_t v48 = (__CFString *)*MEMORY[0x1896052B0];
  uint64_t v45 = (const __CFString *)*MEMORY[0x1896055A0];
  do
  {
    CFStringRef v24 = cf;
    if (cf)
    {
      unint64_t v50 = v17;
      CFIndex v31 = 0;
      int v19 = v34;
      goto LABEL_32;
    }

    CFRange v36 = (const __CFURL *)CFArrayGetValueAtIndex(theArray, v35);
    CFStringRef v37 = v36;
    if ((!v17 || matchURLProperty(v36, v51, v17)) && (!v34 || matchURLProperty(v37, v48, v34)))
    {
      uint64_t v54 = 0LL;
      if (v33
        && (v56 & 1) != 0
        && _CFURLGetVolumePropertyFlags()
        && ((v55 ^ v54) & 1) == 0
        && matchURLProperty(v37, v45, v11))
      {
        if (v37) {
          CFRetain(v37);
        }
        if (cf != v37)
        {
          if (cf) {
            CFRelease(cf);
          }
          cf = v37;
        }

        log = (os_log_s *)resolveLog;
        if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          v59 = v37;
          CFNumberRef v60 = 2112;
          CFNumberRef v61 = v11;
          CFTypeID v62 = 2112;
          v63 = v17;
          uint64_t v64 = 2112;
          CFIndex v65 = v34;
          _os_log_debug_impl( &dword_182E77000,  log,  OS_LOG_TYPE_DEBUG,  "matched volume %@ by name=%@ and capacity=%@ and creationDate=%@",  buf,  0x2Au);
        }
      }
    }

    ++v35;
  }

  while (Count != v35);
  CFStringRef v24 = cf;
  int v19 = v34;
  uint64_t v32 = a4;
  if (cf)
  {
    unint64_t v50 = v17;
    CFIndex v31 = 0;
    if (!a4)
    {
LABEL_87:
      int v17 = v50;
LABEL_88:
      cf = 0LL;
      goto LABEL_89;
    }

LABEL_66:
    CFStringAppendFormat( v8,  0LL,  @"\t\thasRsrcInfo\n\t\t\trsrcCFIndex Length = %llu\n\t\t\trsrcAllocSize = %llu\n",  *((void *)a1 + 30),  *((void *)a1 + 31));
    unsigned int v30 = a1[12];
    if ((v30 & 0x40) == 0)
    {
LABEL_50:
      if ((v30 & 0x80) == 0) {
        goto LABEL_51;
      }
      goto LABEL_68;
    }

  BookmarkData::~BookmarkData((BookmarkData *)v36);
  return v11;
}

LABEL_67:
    CFStringAppendFormat( v8,  0LL,  @"\t\thasFileDataLength\n\t\t\tFileDataCFIndex Length = %llu\n\t\t\tFileDataAllocSize = %llu\n",  *((void *)a1 + 32),  *((void *)a1 + 33));
    unsigned int v30 = a1[12];
    if ((v30 & 0x80) == 0)
    {
LABEL_51:
      if ((v30 & 0x100) == 0) {
        goto LABEL_70;
      }
LABEL_69:
      CFStringAppendFormat( v8,  0LL,  @"\t\thasFullPath\n\t\t\t<CFString %p> %@\n",  *((void *)a1 + 35),  *((void *)a1 + 35),  v41);
      goto LABEL_70;
    }

LABEL_68:
    CFStringAppendFormat(v8, 0LL, @"\t\thasFileSecurity\n\t\t\t%@\n", *((void *)a1 + 34));
    if ((a1[12] & 0x100) == 0) {
      goto LABEL_70;
    }
    goto LABEL_69;
  }

  if ((v10 & 2) != 0) {
    CFStringAppendFormat( v8,  0LL,  @"\t\thasDevice\n\t\t\tFSID = {0x%.8x 0x%.8x}\n\t\t\tVolumeID = %lu\n",  a1[38],  a1[39],  a1[40]);
  }
LABEL_70:
  CFStringAppend(v8, @"\t\n"));
  CFStringAppendFormat( v8,  0LL,  @"\tpropertyValues = %@\n\ttemporaryPropertyValues = %@\n\tpermanentPropertyValues = %@\n\tvolumeInfo = %@\n",  *((void *)a1 + 36),  *((void *)a1 + 37),  *((void *)a1 + 38),  *((void *)a1 + 39));
  if (*((void *)a1 + 39))
  {
    CFStringAppend(v8, @"\tvolumeInfo = (\n");
    BytePtr = CFDataGetBytePtr(*((CFDataRef *)a1 + 39));
    CFIndex Length = CFDataGetLength(*((CFDataRef *)a1 + 39));
    if (*(void *)BytePtr != -1LL) {
      CFStringAppendFormat( v8,  0LL,  @"\t\tvolFileCFIndex Count = %llu\n\t\tvolDirCFIndex Count = %llu\n\t\tvolSize = %llu\n\t\tvolSpaceAvail = %llu\n",  *(void *)BytePtr,  *((void *)BytePtr + 1),  *((void *)BytePtr + 2),  *((void *)BytePtr + 3));
    }
    CFStringAppendFormat(v8, 0LL, @"\t\tflags = 0x%llx\n", *((void *)BytePtr + 4));
    CFStringRef v37 = CFDateFormatterCreateStringWithAbsoluteTime(v3, v6, *((CFAbsoluteTime *)BytePtr + 5));
    CFStringAppendFormat(v8, 0LL, @"\t\tcreationDate = %@\n", v37);
    if (v37) {
      CFRelease(v37);
    }
    CFStringAppendFormat(v8, 0LL, @"\t\tmaxFileSize = %llu\n", *((void *)BytePtr + 6));
    if (Length == 72)
    {
      uuid_unparse_upper(BytePtr + 56, out);
      CFStringRef v38 = CFStringCreateWithCString(v2, out, 0x8000100u);
      CFStringAppendFormat(v8, 0LL, @"\t\tuuid = %@\n", v38);
      if (v38) {
        CFRelease(v38);
      }
    }

    CFStringAppend(v8, @"\t\n"));
  }

  CFStringAppend(v8, @"}");
  CFRelease(v6);
  int v39 = a1[8] - 1;
  a1[8] = v39;
  if (!v39)
  {
    *((void *)a1 + 3) = 0LL;
    os_unfair_lock_unlock((os_unfair_lock_t)a1 + 9);
  }

  return v8;
}

      CFNumberRef v61 = v113;
      v78 = v62;
      _FileCacheUnlock((uint64_t)v113);
      uint64_t v48 = v78;
      a4 = v102;
      uint64_t v16 = v106;
      uint64_t v58 = v104;
    }

    CFNumberRef v60 = v108;
  }

  if (!v58 || v48)
  {
    LODWORD(v105) = v48;
    unsigned int v10 = v107;
    if (!v60) {
      goto LABEL_83;
    }
    goto LABEL_82;
  }

  v117 = 0u;
  memset(v118, 0, sizeof(v118));
  *(_OWORD *)value = 0u;
  getPropertyBitmapForKeys(v115, v114, (uint64_t)value);
  uint64_t v79 = prepareValuesForBitmap((uint64_t)v110, (uint64_t)v61, (uint64_t)value, (uint64_t)a4);
  unsigned int v10 = v107;
  LODWORD(v105) = v79;
  if (v79)
  {
    _FileCacheLock((uint64_t)v61);
    if (v10 >= 1)
    {
      unsigned __int8 v80 = v112;
      uint64_t v81 = v113;
      CFRange v82 = v103;
      v83 = v16;
      v84 = v107;
      CFIndex v85 = &qword_18C4638F0;
      do
      {
        BOOL v87 = *(void *)v80;
        unsigned __int8 v80 = (const __CFArray *)((char *)v80 + 8);
        unint64_t v86 = v87;
        v88 = v111;
        if (v87 >= 1)
        {
          v114 = *v85;
          v115 = v80;
          CFTypeID v109 = (uint64_t (*)(CFTypeRef, void *, char *, CFTypeRef *, uint64_t, uint64_t, uint64_t))*(v85 - 3);
          v89 = v86;
          _FileCacheIncrementInProvider((uint64_t)v81);
          v90 = v89;
          uint64_t v16 = v106;
          ((void (*)(CFTypeRef, void *, uint64_t *, uint64_t *, uint64_t *, uint64_t, uint64_t (*)(CFTypeRef, void *, char *, CFTypeRef *, uint64_t, uint64_t, uint64_t)))v114)( v110,  v81,  v82,  v83,  v88,  v90,  v109);
          _FileCacheDecrementInProvider((uint64_t)v81);
          unsigned __int8 v80 = v115;
        }

        CFTypeRef v111 = v88 + 96;
        v83 += 96;
        v82 += 96;
        v85 += 7;
        --v84;
      }

      while (v84);
    }

    CFNumberRef v61 = v113;
    _FileCacheUnlock((uint64_t)v113);
    a4 = v102;
    unsigned int v10 = v107;
    uint64_t v13 = v103;
    uint64_t v22 = v112;
  }

  if ((v108 & 1) != 0) {
LABEL_82:
  }
    _FileCacheLockTransitionFromPreparer((uint64_t)v61);
LABEL_83:
  _FileCacheUnlock((uint64_t)v61);
  if ((_DWORD)v105)
  {
LABEL_84:
    if (v10 >= 1)
    {
      for (CFIndex i = 0LL; i != v10; ++i)
      {
        v92 = *((void *)v22 + i);
        CFIndex v93 = (const void **)v16;
        int v94 = (const void **)v13;
        if (v92 >= 1)
        {
          do
          {
            CFIndex v95 = *v93;
            if (*v93)
            {
              v25[v30] = *v94;
              v28[v30++] = v95;
            }

            ++v94;
            ++v93;
            --v92;
          }

          while (v92);
        }

        v13 += 96;
        v16 += 96;
      }
    }

    goto LABEL_91;
  }

  v97 = 0LL;
LABEL_92:
  if (v30 >= 1)
  {
    do
    {
      CFTypeID v98 = *v28++;
      CFRelease(v98);
      --v30;
    }

    while (v30);
  }

  if (a4 && !v97 && !*a4)
  {
    if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
      _FSURLCopyResourcePropertiesForKeysInternal();
    }
    *a4 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 256LL, 0LL);
  }

  return v97;
}

                a2 = 512LL;
                goto LABEL_2;
              }

              a2 = 640LL;
              goto LABEL_2;
            }

            switch(a2)
            {
              case 1LL:
                goto LABEL_58;
              case 2LL:
                a2 = 4LL;
                goto LABEL_2;
              case 13LL:
LABEL_58:
                a2 = 513LL;
                goto LABEL_2;
            }

            goto LABEL_68;
          }

          if (a2 <= 12)
          {
            if (a2 != 1)
            {
              if (a2 == 2)
              {
                a2 = 260LL;
                goto LABEL_2;
              }

              goto LABEL_70;
            }
          }

          else if (a2 != 13)
          {
            if (a2 == 27)
            {
              a2 = 263LL;
              goto LABEL_2;
            }

            if (a2 == 63)
            {
              a2 = 258LL;
              goto LABEL_2;
            }

uint64_t _FileCacheGetTypeID()
{
  return sFileCacheTypeID;
}

uint64_t _FileCacheGetGlobalSeed(void)
{
  return seedGlobals;
}

void _FileCacheScheduleGlobalSeedIncrement(CFRunLoopRef rl)
{
  uint64_t v2 = (__CFRunLoopObserver *)seedGlobals;
  if (!seedGlobals)
  {
    memset(&v3, 0, sizeof(v3));
    uint64_t v2 = CFRunLoopObserverCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  0x40uLL,  1u,  0LL,  (CFRunLoopObserverCallBack)observerCall,  &v3);
    seedGlobals = (uint64_t)v2;
  }

  if ((seedGlobals & 1) == 0)
  {
    if (v2)
    {
      CFRunLoopAddObserver(rl, v2, (CFRunLoopMode)*MEMORY[0x1896051A8]);
      seedGlobals = 1;
    }
  }

void observerCall(__CFRunLoopObserver *a1, unint64_t a2, void *a3)
{
  int v4 = seedGlobals;
  if (seedGlobals < 0) {
    int v4 = -1;
  }
  seedGlobals = v4 + 1;
  Current = CFRunLoopGetCurrent();
  CFRunLoopRemoveObserver(Current, a1, (CFRunLoopMode)*MEMORY[0x1896051A8]);
  seedGlobals = 0;
}

BOOL _FileCacheIsValid(uint64_t a1, int a2)
{
  unsigned int v2 = atomic_load((unsigned int *)(a1 + 16));
  if ((v2 & 0x80000000) != 0) {
    return 1LL;
  }
  unsigned int v3 = atomic_load((unsigned int *)(a1 + 16));
  return v3 == a2;
}

BOOL _FileCacheNeedsValidSeed(uint64_t a1)
{
  unsigned int v1 = atomic_load((unsigned int *)(a1 + 16));
  return v1 == -1;
}

uint64_t _FileCacheSetValidSeed(uint64_t result, unsigned int a2)
{
  int v2 = atomic_load((unsigned int *)(result + 16));
  if (v2 >= -1) {
    atomic_store(a2, (unsigned int *)(result + 16));
  }
  return result;
}

uint64_t _FileCacheSetAutoFlushingEnabled(uint64_t result, int a2)
{
  int v2 = (unsigned int *)(result + 16);
  int v3 = atomic_load((unsigned int *)(result + 16));
  if (a2)
  {
    if (v3 <= -2)
    {
      do
        unsigned int v4 = __ldaxr(v2);
      while (__stlxr(v4 + 1, v2));
    }
  }

  else if (v3 < 0)
  {
    unsigned int v5 = atomic_load(v2);
    if (v5 != 0x80000000)
    {
      do
        unsigned int v6 = __ldaxr(v2);
      while (__stlxr(v6 - 1, v2));
    }
  }

  else
  {
    atomic_store(0xFFFFFFFE, v2);
  }

  return result;
}

BOOL _FileCacheGetAutoFlushingEnabled(uint64_t a1)
{
  unsigned int v1 = atomic_load((unsigned int *)(a1 + 16));
  return v1 != -2;
}

uint64_t _FileCacheIncrementInProvider(uint64_t result)
{
  unsigned int v1 = (unsigned int *)(result + 20);
  do
    unsigned int v2 = __ldaxr(v1);
  while (__stlxr(v2 + 1, v1));
  return result;
}

uint64_t _FileCacheDecrementInProvider(uint64_t result)
{
  unsigned int v1 = (unsigned int *)(result + 20);
  do
    unsigned int v2 = __ldaxr(v1);
  while (__stlxr(v2 - 1, v1));
  return result;
}

uint64_t _FileCacheGetInProvider(uint64_t a1)
{
  return atomic_load((unsigned int *)(a1 + 20));
}

uint64_t _FileCachePreparerLock(os_unfair_lock_s *a1)
{
  return os_unfair_recursive_lock_lock_with_options();
}

uint64_t _FileCachePreparerUnlock()
{
  return os_unfair_recursive_lock_unlock();
}

uint64_t _FileCacheGetName(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

uint64_t _FileCacheGetFinderInfo(uint64_t result)
{
  if (result)
  {
    if ((*(_BYTE *)(result + 48) & 0x10) != 0) {
      result += 208LL;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t _FileCacheGetFlags(uint64_t result, unint64_t *a2, uint64_t *a3, void *a4, uint64_t *a5)
{
  if (!result) {
    return result;
  }
  uint64_t v9 = result;
  _FileCacheLock(result);
  if (a2 && a3)
  {
    unint64_t v10 = *(unsigned int *)(v9 + 48);
    if ((v10 & 1) == 0)
    {
      uint64_t v11 = 0LL;
      unint64_t v12 = 0LL;
LABEL_31:
      *a3 = v11;
      *a2 = v12;
      goto LABEL_32;
    }

    int v13 = *(_DWORD *)(v9 + 64) & 0xF000;
    if (v13 == 0x4000)
    {
      uint64_t v14 = 2LL;
    }

    else if (v13 == 40960)
    {
      uint64_t v14 = 4LL;
    }

    else
    {
      uint64_t v14 = v13 == 0x8000;
    }

    unint64_t v15 = *(unsigned int *)(v9 + 68);
    uint64_t v16 = v14 | (v10 >> 10) & 8 | (v15 >> 12) & 0x20;
    __int16 v17 = 32 * v15;
    uint64_t v18 = v16 | (32 * (_WORD)v15) & 0x40;
    if (*(_DWORD *)(v9 + 48) & 0x800 | *(_DWORD *)(v9 + 68) & 0x8000)
    {
      v18 |= 0x80uLL;
      if ((v10 & 0x10) == 0)
      {
        char v19 = 1;
LABEL_19:
        uint64_t v20 = 239LL;
        goto LABEL_23;
      }
    }

    else
    {
      if ((v10 & 0x10) == 0)
      {
        char v19 = 1;
        uint64_t v20 = 111LL;
LABEL_23:
        uint64_t v21 = v18 | v17 & 0x400;
        uint64_t v22 = v20 | 0x7400;
        if ((v10 & 8) != 0) {
          v21 |= (v10 >> 13) & 0x1000 | (v10 >> 11) & 0x2000 | (v10 >> 9) & 0x4000;
        }
        else {
          uint64_t v22 = v20 | 0x400;
        }
        if ((v21 & 4) != 0)
        {
          v22 |= 0x8000uLL;
          v21 |= 0x8000uLL;
        }

        else if ((v21 & 1) != 0)
        {
          if ((v19 & 1) == 0)
          {
            v22 |= 0x8000uLL;
          }
        }

        else
        {
          v22 |= 0x8000uLL;
        }

        uint64_t v11 = v22 | 0x10000;
        unint64_t v12 = v21 & 0xFFFFFFFFFFFEFFFFLL | (((v10 >> 14) & 1) << 16);
        goto LABEL_31;
      }

      v18 |= ((unint64_t)*(unsigned __int16 *)(v9 + 216) >> 7) & 0x80;
    }

    if ((*(_WORD *)(v9 + 216) & 0x10) != 0)
    {
      char v19 = 0;
      v18 |= 0x100uLL;
      uint64_t v20 = 495LL;
      goto LABEL_23;
    }

    char v19 = 0;
    if ((v10 & 0x8000000) != 0)
    {
      uint64_t v20 = 495LL;
      if (*(_WORD *)(v9 + 52) == 3) {
        uint64_t v20 = 239LL;
      }
      goto LABEL_23;
    }

    goto LABEL_19;
  }

LABEL_32:
  if (a4 && a5)
  {
    CFStringRef v23 = *(const __CFData **)(v9 + 312);
    if (v23)
    {
      uint64_t v24 = *((void *)CFDataGetBytePtr(v23) + 4);
      uint64_t v25 = -1LL;
    }

    else
    {
      uint64_t v24 = 0LL;
      uint64_t v25 = 0LL;
    }

    *a4 = v24;
    *a5 = v25;
  }

  int v26 = *(_DWORD *)(v9 + 32) - 1;
  *(_DWORD *)(v9 + 32) = v26;
  if (!v26)
  {
    *(void *)(v9 + 24) = 0LL;
    os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 36));
  }

  return 1LL;
}

    *((void *)&v21 + 1) |= 4uLL;
    if ((v18.f_flags & 1) == 0)
    {
LABEL_11:
      if ((v18.f_flags & 0x400) == 0) {
        goto LABEL_12;
      }
      goto LABEL_34;
    }

uint64_t _FileCacheGetAttributes(uint64_t a1)
{
  return a1 + 48;
}

uint64_t _FileCacheGetVolumeInfo(uint64_t a1)
{
  return *(void *)(a1 + 312);
}

void _FileCacheSetVolumeInfo(uint64_t a1, CFTypeRef cf)
{
  int v3 = *(const void **)(a1 + 312);
  if (cf) {
    CFTypeRef v4 = CFRetain(cf);
  }
  else {
    CFTypeRef v4 = 0LL;
  }
  *(void *)(a1 + 312) = v4;
  if (v3) {
    CFRelease(v3);
  }
}

uint64_t _FileCacheGetPropertyValueForKey(uint64_t a1, const void *a2, void **a3)
{
  unsigned int v6 = *(const __CFDictionary **)(a1 + 288);
  if (v6 && CFDictionaryGetValueIfPresent(v6, a2, (const void **)&value))
  {
    *a3 = value;
    uint64_t v7 = 1LL;
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  int v8 = *(_DWORD *)(a1 + 32) - 1;
  *(_DWORD *)(a1 + 32) = v8;
  if (!v8)
  {
    *(void *)(a1 + 24) = 0LL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 36));
  }

  return v7;
}

void _FileCacheSetPropertyValueForKey(uint64_t a1, const void *a2, const void *a3)
{
  unsigned int v6 = *(__CFDictionary **)(a1 + 288);
  if (!v6)
  {
    *(_OWORD *)&v9.version = xmmword_189C5B360;
    *(_OWORD *)&v9.release = *(_OWORD *)&off_189C5B370;
    v9.equal = (CFDictionaryEqualCallBack)FileCachePropertyValueEqualCallBack;
    uint64_t v7 = CFGetAllocator((CFTypeRef)a1);
    unsigned int v6 = CFDictionaryCreateMutable(v7, 0LL, MEMORY[0x189605240], &v9);
    *(void *)(a1 + 288) = v6;
  }

  CFDictionarySetValue(v6, a2, a3);
  int v8 = *(_DWORD *)(a1 + 32) - 1;
  *(_DWORD *)(a1 + 32) = v8;
  if (!v8)
  {
    *(void *)(a1 + 24) = 0LL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 36));
  }

CFTypeRef FileCachePropertyValueRetainCallBack(const __CFAllocator *a1, CFTypeRef cf)
{
  if (cf) {
    return CFRetain(cf);
  }
  else {
    return 0LL;
  }
}

void FileCachePropertyValueReleaseCallBack(const __CFAllocator *a1, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

uint64_t FileCachePropertyValueEqualCallBack(unint64_t cf1, unint64_t a2)
{
  if (!(cf1 | a2)) {
    return 1LL;
  }
  uint64_t result = 0LL;
  if (cf1)
  {
    if (a2) {
      return CFEqual((CFTypeRef)cf1, (CFTypeRef)a2);
    }
  }

  return result;
}

void _FileCacheClearPropertyValueForKey(uint64_t a1, const void *a2)
{
  CFTypeRef v4 = *(__CFDictionary **)(a1 + 288);
  if (v4) {
    CFDictionaryRemoveValue(v4, a2);
  }
  int v5 = *(_DWORD *)(a1 + 32) - 1;
  *(_DWORD *)(a1 + 32) = v5;
  if (!v5)
  {
    *(void *)(a1 + 24) = 0LL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 36));
  }

uint64_t FileCacheCreate(const __CFAllocator *a1)
{
  return _CFRuntimeCreateInstance();
}

CFTypeRef _FileCacheGetForURL(const __CFURL *a1, CFTypeRef cf)
{
  if (cf) {
    return cf;
  }
  CFGetAllocator(a1);
  initGlobalsOnce();
  uint64_t Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    CFTypeRef v4 = (const void *)Instance;
    __CFURLSetResourceInfoPtr();
    CFRelease(v4);
  }

  return (CFTypeRef)__CFURLResourceInfoPtr();
}

void *_FileCacheCreateShallowCopy(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  _FileCacheLock(a1);
  unsigned int v2 = CFGetAllocator((CFTypeRef)a1);
  initGlobalsOnce();
  uint64_t Instance = (_OWORD *)_CFRuntimeCreateInstance();
  CFTypeRef v4 = Instance;
  if (Instance)
  {
    __int128 v5 = *(_OWORD *)(a1 + 48);
    __int128 v6 = *(_OWORD *)(a1 + 80);
    Instance[4] = *(_OWORD *)(a1 + 64);
    Instance[5] = v6;
    Instance[3] = v5;
    __int128 v7 = *(_OWORD *)(a1 + 96);
    __int128 v8 = *(_OWORD *)(a1 + 112);
    __int128 v9 = *(_OWORD *)(a1 + 144);
    Instance[8] = *(_OWORD *)(a1 + 128);
    Instance[9] = v9;
    Instance[6] = v7;
    Instance[7] = v8;
    __int128 v10 = *(_OWORD *)(a1 + 160);
    __int128 v11 = *(_OWORD *)(a1 + 176);
    __int128 v12 = *(_OWORD *)(a1 + 208);
    Instance[12] = *(_OWORD *)(a1 + 192);
    Instance[13] = v12;
    Instance[10] = v10;
    Instance[11] = v11;
    __int128 v13 = *(_OWORD *)(a1 + 224);
    __int128 v14 = *(_OWORD *)(a1 + 240);
    __int128 v15 = *(_OWORD *)(a1 + 272);
    Instance[16] = *(_OWORD *)(a1 + 256);
    Instance[17] = v15;
    Instance[14] = v13;
    Instance[15] = v14;
    uint64_t v16 = *(const void **)(a1 + 56);
    if (v16) {
      v4[7] = CFRetain(v16);
    }
    __int16 v17 = (_BYTE *)(a1 + 48);
    uint64_t v18 = *(const void **)(a1 + 280);
    if (v18) {
      v4[35] = CFRetain(v18);
    }
    if ((*v17 & 0x80) == 0) {
      goto LABEL_11;
    }
    char v19 = *(__CFFileSecurity **)(a1 + 272);
    if (v19)
    {
      CFFileSecurityRef Copy = CFFileSecurityCreateCopy(v2, v19);
      v4[34] = Copy;
      if (Copy) {
        goto LABEL_11;
      }
    }

    else if (v4[34])
    {
LABEL_11:
      uint64_t v21 = *(const __CFDictionary **)(a1 + 288);
      if (v21)
      {
        CFIndex Count = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 288));
        MutableCFFileSecurityRef Copy = CFDictionaryCreateMutableCopy(v2, Count, v21);
      }

      else
      {
        MutableCFFileSecurityRef Copy = 0LL;
      }

      v4[36] = MutableCopy;
      uint64_t v24 = *(const __CFDictionary **)(a1 + 296);
      if (v24)
      {
        CFIndex v25 = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 296));
        CFMutableDictionaryRef v26 = CFDictionaryCreateMutableCopy(v2, v25, v24);
      }

      else
      {
        CFMutableDictionaryRef v26 = 0LL;
      }

      v4[37] = v26;
      CFStringRef v27 = *(const __CFDictionary **)(a1 + 304);
      if (v27)
      {
        CFIndex v28 = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 304));
        CFMutableDictionaryRef v29 = CFDictionaryCreateMutableCopy(v2, v28, v27);
      }

      else
      {
        CFMutableDictionaryRef v29 = 0LL;
      }

      v4[38] = v29;
      unsigned int v30 = *(const __CFData **)(a1 + 312);
      if (v30) {
        v4[39] = CFDataCreateMutableCopy(v2, 0LL, v30);
      }
      goto LABEL_23;
    }

    *(_DWORD *)v17 &= ~0x80u;
    goto LABEL_11;
  }

LABEL_23:
  int v31 = *(_DWORD *)(a1 + 32) - 1;
  *(_DWORD *)(a1 + 32) = v31;
  if (!v31)
  {
    *(void *)(a1 + 24) = 0LL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 36));
  }

  return v4;
}

          uint64_t v21 = CharactersPtr[v51 + v20];
          goto LABEL_41;
        }
      }

      else if (Length >= 5)
      {
        __int128 v7 = Length - 4;
        CFMutableStringRef theString = v5;
        unint64_t v51 = Length - 4;
        unint64_t v52 = 4LL;
        __int128 v8 = CFStringGetCharactersPtr(v5);
        unint64_t v49 = v8;
        if (v8)
        {
          uint64_t v53 = 0LL;
          uint64_t v54 = 0LL;
          unint64_t v50 = 0LL;
          __int128 v9 = v8[v7];
        }

        else
        {
          char v19 = CFStringGetCStringPtr(v5, 0x600u);
          uint64_t v53 = 0LL;
          uint64_t v54 = 0LL;
          unint64_t v50 = v19;
          if (v19)
          {
            __int128 v9 = v19[v7];
          }

          else
          {
            uint64_t v54 = 4LL;
            v55.CFIndex location = v7;
            v55.CFIndex length = 4LL;
            CFStringGetCharacters(v5, v55, buffer);
            __int128 v9 = buffer[-v53];
          }
        }

        if (v9 == 46)
        {
          CharactersPtr = v49;
          uint64_t v20 = 1LL;
          if (!v49) {
            goto LABEL_32;
          }
          goto LABEL_23;
        }
      }
    }

    return 0LL;
  }

  if ((*(_WORD *)(a2 + 168) & 0x10) == 0)
  {
    __int128 v10 = *(const __CFString **)(a2 + 8);
    if (!v10) {
      goto LABEL_106;
    }
    __int128 v11 = CFStringGetLength(*(CFStringRef *)(a2 + 8));
    if ((*(_BYTE *)(a2 + 3) & 8) != 0)
    {
      if (*(_WORD *)(a2 + 4) != 3) {
        goto LABEL_106;
      }
      CFMutableStringRef theString = v10;
      unint64_t v51 = v11 - 3;
      unint64_t v52 = 3LL;
      __int16 v17 = CFStringGetCharactersPtr(v10);
      unint64_t v49 = v17;
      if (v17) {
        uint64_t v18 = 0LL;
      }
      else {
        uint64_t v18 = CFStringGetCStringPtr(v10, 0x600u);
      }
      CFStringRef v23 = 0LL;
      uint64_t v53 = 0LL;
      uint64_t v54 = 0LL;
      unint64_t v50 = v18;
      if (!v17) {
        goto LABEL_61;
      }
    }

    else
    {
      if (v11 < 5) {
        goto LABEL_106;
      }
      __int128 v12 = v11 - 4;
      CFMutableStringRef theString = v10;
      unint64_t v51 = v11 - 4;
      unint64_t v52 = 4LL;
      __int128 v13 = CFStringGetCharactersPtr(v10);
      unint64_t v49 = v13;
      if (v13)
      {
        uint64_t v53 = 0LL;
        uint64_t v54 = 0LL;
        unint64_t v50 = 0LL;
        __int128 v14 = v13[v12];
      }

      else
      {
        uint64_t v22 = CFStringGetCStringPtr(v10, 0x600u);
        uint64_t v53 = 0LL;
        uint64_t v54 = 0LL;
        unint64_t v50 = v22;
        if (v22)
        {
          __int128 v14 = v22[v12];
        }

        else
        {
          uint64_t v54 = 4LL;
          v56.CFIndex location = v12;
          v56.CFIndex length = 4LL;
          CFStringGetCharacters(v10, v56, buffer);
          __int128 v14 = buffer[-v53];
        }
      }

      if (v14 != 46) {
        goto LABEL_106;
      }
      __int16 v17 = v49;
      CFStringRef v23 = 1LL;
      if (!v49)
      {
LABEL_61:
        if (v50)
        {
          uint64_t v24 = v50[v51 + v23];
        }

        else
        {
          if (v54 <= v23 || (uint64_t v33 = v53, v53 > v23))
          {
            v34.CFIndex location = v51;
            if (v52 >= 64) {
              v34.CFIndex length = 64LL;
            }
            else {
              v34.CFIndex length = v52;
            }
            uint64_t v53 = 0LL;
            uint64_t v54 = v34.length;
            CFStringGetCharacters(theString, v34, buffer);
            uint64_t v33 = v53;
          }

          uint64_t v24 = buffer[v23 - v33];
        }

      ++a4;
      ++a3;
      if (!--v22) {
        goto LABEL_75;
      }
    }
  }

  v212 = 0LL;
  v213 = 0LL;
  v206 = 0LL;
  v207 = 0LL;
  v196 = 0LL;
  v197 = 0LL;
  v199 = 0LL;
  v201 = 0LL;
  v202 = 0LL;
  v203 = 0LL;
  v204 = 0LL;
  v205 = 0LL;
  v214 = 0LL;
  v215 = 0LL;
  v193 = 0LL;
  v194 = 0LL;
  v195 = 0LL;
  v208 = 0LL;
  v209 = 0LL;
  v210 = 0LL;
  v182 = 0;
  v185 = 0;
  v192 = 0LL;
  v190 = 0LL;
  char v19 = 0LL;
  uint64_t v18 = 0LL;
LABEL_75:
  if (!v18 && !v213 && !v215 && !v210 && !v208 && !v206 && !(_DWORD)v212)
  {
    LODWORD(v211) = 0;
    uint64_t v32 = 0;
    LODWORD(v180) = 0;
    uint64_t v33 = (unint64_t)v207;
    CFRange v34 = v201;
    CFRange v35 = v202;
    CFRange v36 = v203;
    CFStringRef v37 = v204;
    goto LABEL_102;
  }

  CFRange v34 = v201;
  CFStringRef v38 = *(_DWORD *)v200;
  CFRange v35 = v202;
  CFRange v36 = v203;
  CFStringRef v37 = v204;
  if ((*(_DWORD *)v200 & 1) != 0)
  {
    LODWORD(v180) = *(_DWORD *)(v200 + 112);
    uint64_t v32 = *(_DWORD *)(v200 + 104);
    LODWORD(v211) = objectTypeFromAccessMask(*(_DWORD *)(v200 + 16));
  }

  else
  {
    LODWORD(v211) = 0;
    uint64_t v32 = 0;
    LODWORD(v180) = 0;
    v221.commonattr |= 0x8000000C;
  }

  if (v213 || v215 || v210 || v208 || v206)
  {
    if (v213)
    {
      int v39 = v213;
      if (CFDataGetLength(v213) == 32)
      {
        v226.CFIndex location = 0LL;
        v226.CFIndex length = 32LL;
        CFDataGetBytes(v39, v226, (UInt8 *)&v218);
        goto LABEL_99;
      }

      CFStringRef v38 = *(_DWORD *)v200;
    }

    if ((v38 & 0x10) != 0)
    {
      CFRange v40 = *(_OWORD *)(v200 + 176);
      v218 = *(_OWORD *)(v200 + 160);
      v219 = v40;
    }

    else
    {
      v221.commonattr |= 0x8004400C;
    }
  }

CFMutableDictionaryRef _FileCacheGetTemporaryPropertyDictionary(void *cf, int a2)
{
  CFMutableDictionaryRef result = (CFMutableDictionaryRef)cf[37];
  if (a2)
  {
    if (!result)
    {
      CFTypeRef v4 = CFGetAllocator(cf);
      CFMutableDictionaryRef result = CFDictionaryCreateMutable(v4, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
      cf[37] = result;
    }
  }

  return result;
}

CFMutableDictionaryRef _FileCacheGetPermanentPropertyDictionary(void *cf, int a2)
{
  CFMutableDictionaryRef result = (CFMutableDictionaryRef)cf[38];
  if (a2)
  {
    if (!result)
    {
      CFTypeRef v4 = CFGetAllocator(cf);
      CFMutableDictionaryRef result = CFDictionaryCreateMutable(v4, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
      cf[38] = result;
    }
  }

  return result;
}

CFDataRef _CFURLCreateBookmarkDataFromFile( CFAllocatorRef allocator, const __CFURL *a2, CFErrorRef *a3)
{
  CFRange v36 = 0LL;
  CFDataRef v37 = 0LL;
  if (!a2)
  {
    if (!a3) {
      return 0LL;
    }
    goto LABEL_29;
  }

  __int128 v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  __int128 v7 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
  if (!v7)
  {
    CFErrorRef v13 = 0LL;
    Mutable = 0LL;
    goto LABEL_26;
  }

  __int128 v8 = v7;
  if (CFReadStreamOpen(v7))
  {
    BOOL v11 = CFReadStreamRead(v8, buffer, 56LL) == 56 && *(_DWORD *)buffer == 1802465122 && v32 == 1802658157 && v31 == 0;
    if (v11 && !v33 && v35[0] <= 0xFFFFFFE && bookmarkVersionOK(v35[1]))
    {
      Mutable = CFDataCreateMutable(allocator, v35[0] + 16LL);
      unsigned int v21 = v35[0];
      unsigned int v20 = v35[1];
      if (!CFDataIncreaseLengthSafe(Mutable, 16LL)
        || (MutableBytePtr = CFDataGetMutableBytePtr(Mutable),
            *(_DWORD *)MutableBytePtr = 1802465122,
            *((_DWORD *)MutableBytePtr + 1) = v21 + 16,
            *((_DWORD *)MutableBytePtr + 2) = v20,
            *((_DWORD *)MutableBytePtr + 3) = 16,
            !CFDataIncreaseLengthSafe(Mutable, v35[0])))
      {
        if (a3) {
          CFErrorRef v13 = CFErrorCreate(allocator, (CFErrorDomain)*MEMORY[0x189604F40], 263LL, 0LL);
        }
        else {
          CFErrorRef v13 = 0LL;
        }
LABEL_68:
        if (Mutable)
        {
          BookmarkData::BookmarkData((BookmarkData *)v28, allocator, Mutable);
          if (v29)
          {
            CFDataRef Copy = CFDataCreateCopy(allocator, Mutable);
            if (v37 != Copy)
            {
              if (v37) {
                CFRelease(v37);
              }
              CFDataRef v37 = Copy;
            }
          }

          else if (a3 && !v13)
          {
            CFErrorRef v13 = CFErrorCreate(allocator, (CFErrorDomain)*MEMORY[0x189604F40], 259LL, 0LL);
          }

          BookmarkData::~BookmarkData((BookmarkData *)v28);
          CFRelease(Mutable);
          __int128 v15 = v36;
          Mutable = v37;
        }

        else
        {
          __int128 v15 = 0LL;
        }

        CFReadStreamClose(v8);
        goto LABEL_23;
      }

      v28[0] = v34;
      CFNumberRef v23 = CFNumberCreate(v6, kCFNumberSInt32Type, v28);
      CFReadStreamSetProperty(v8, (CFStreamPropertyKey)*MEMORY[0x1896051D8], v23);
      if (v35[0])
      {
        unsigned int v24 = 0;
        while (1)
        {
          CFIndex v25 = CFDataGetMutableBytePtr(Mutable);
          CFIndex v26 = CFReadStreamRead(v8, &v25[v24 + 16], v35[0] - v24);
          if (v26 <= 0) {
            break;
          }
          v24 += v26;
          if (v24 >= v35[0]) {
            goto LABEL_65;
          }
        }

        if (Mutable) {
          CFRelease(Mutable);
        }
        if (a3)
        {
          CFErrorRef v13 = CFErrorCreate(allocator, (CFErrorDomain)*MEMORY[0x189604F40], 259LL, 0LL);
          Mutable = 0LL;
          goto LABEL_66;
        }

        Mutable = 0LL;
      }

LABEL_65:
      CFErrorRef v13 = 0LL;
LABEL_66:
      if (v23) {
        CFRelease(v23);
      }
      goto LABEL_68;
    }

    CFReadStreamClose(v8);
    goto LABEL_21;
  }

  if (!a3)
  {
LABEL_21:
    __int128 v15 = 0LL;
    goto LABEL_22;
  }

  __int128 v14 = CFReadStreamCopyError(v8);
  __int128 v15 = v14;
  if (!v14)
  {
LABEL_22:
    Mutable = 0LL;
    CFErrorRef v13 = 0LL;
    goto LABEL_23;
  }

  Domain = CFErrorGetDomain(v14);
  CFIndex Code = CFErrorGetCode(v15);
  CFErrorRef v13 = _FSURLCreateStandardError(v6, Domain, Code, 1, (const __CFString *)a2, 0LL);
  CFRelease(v15);
  __int128 v15 = 0LL;
  Mutable = 0LL;
LABEL_23:
  CFRelease(v8);
  if (!Mutable && v15)
  {
    CFReleaser<__CFData const*>::operator=((const void **)&v37, (CFTypeRef *)&v36);
    Mutable = v37;
  }

      *a4 = CFErrorCreate(v6, v14, 512LL, 0LL);
      goto LABEL_66;
    }

    if (v8) {
      goto LABEL_24;
    }
    goto LABEL_66;
  }

LABEL_26:
  BOOL v18 = a3 != 0LL;
  if (a3 && !Mutable && !v13)
  {
LABEL_29:
    CFErrorRef v13 = CFErrorCreate(allocator, (CFErrorDomain)*MEMORY[0x189604F40], 256LL, 0LL);
    BOOL v18 = 1;
    Mutable = v37;
  }

  if (v18 && !Mutable)
  {
    if (v13)
    {
      Mutable = 0LL;
      *a3 = v13;
    }

    else
    {
      if (!*a3)
      {
        if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
          _CFURLCreateBookmarkDataFromFile_cold_1();
        }
        CFErrorRef v13 = 0LL;
        *a3 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 256LL, 0LL);
        Mutable = v37;
        goto LABEL_37;
      }

      Mutable = 0LL;
    }

    CFErrorRef v13 = 0LL;
  }

LABEL_37:
  CFDataRef v37 = 0LL;
  if (v36) {
    CFRelease(v36);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v37) {
    CFRelease(v37);
  }
  return Mutable;
}

BOOL CFDataIncreaseLengthSafe(__CFData *a1, CFIndex a2)
{
  CFIndex Length = CFDataGetLength(a1);
  CFDataIncreaseLength(a1, a2);
  CFIndex v5 = CFDataGetLength(a1);
  return v5 >= Length && v5 >= Length + a2 && a2 >= 0;
}

const void **CFReleaser<__CFData const*>::operator=(const void **a1, CFTypeRef *a2)
{
  CFTypeRef v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  if (*a2)
  {
    CFRetain(*a2);
    CFTypeRef v5 = *a2;
  }

  else
  {
    CFTypeRef v5 = 0LL;
  }

  *a1 = v5;
  return a1;
}

uint64_t _CFURLWriteBookmarkDataToFile(__CFData *a1, const __CFString *a2, uint64_t a3, void *a4)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  __int128 v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  BookmarkData::BookmarkData((BookmarkData *)v36, (const __CFAllocator *)*MEMORY[0x189604DB0], a1);
  unsigned int v35 = 0;
  if (!a2 || !v37 || !BookmarkData::getItemAs((BookmarkData *)v36, 0xD010u, 1, &v35) || (v35 & 0x400) == 0 || v40 >> 28)
  {
    __int128 v8 = 0LL;
    goto LABEL_12;
  }

  int v7 = _CFURLGetResourcePropertyFlags();
  if (v7 && ((v7 != 0) & v34) == 0)
  {
    __int128 v8 = _FSURLCreateStandardError(v6, (const __CFString *)*MEMORY[0x189604F40], 512LL, 1, a2, 0LL);
    __int128 v9 = (os_log_s *)bmarkLog;
    if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_ERROR)) {
      _CFURLWriteBookmarkDataToFile_cold_2((uint64_t)a2, (uint64_t)v8, v9);
    }
    CFURLClearResourcePropertyCache((CFURLRef)a2);
    goto LABEL_12;
  }

  char v19 = CFWriteStreamCreateWithFile(v6, (CFURLRef)a2);
  if (v19)
  {
    unsigned int v20 = v19;
    if (CFWriteStreamOpen(v19))
    {
      *(_OWORD *)buffer = xmmword_182EA5110;
      uint64_t v42 = 0x3800000038LL;
      unsigned int v43 = v40;
      int v21 = v37;
      if (v37) {
        int v21 = *(_DWORD *)(v37 + 8);
      }
      int v44 = v21;
      int v45 = 0;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      int v47 = 0;
      BOOL v22 = 0;
      if (CFWriteStreamWrite(v20, buffer, 56LL) == 56)
      {
        CFIndex v23 = CFWriteStreamWrite(v20, (const UInt8 *)(v38 + v39), v40);
        BOOL v22 = v23 >= 0 && v40 == (_DWORD)v23;
      }

      __int128 v8 = 0LL;
      if (a4)
      {
        if (!v22)
        {
          __int128 v8 = CFWriteStreamCopyError(v20);
          if (!v8) {
            __int128 v8 = CFErrorCreate(v6, (CFErrorDomain)*MEMORY[0x189604F40], 640LL, 0LL);
          }
        }
      }

      int v25 = !v22;
    }

    else
    {
      if (a4)
      {
        __int128 v8 = CFWriteStreamCopyError(v20);
        int v25 = 0;
      }

      else
      {
        int v25 = 0;
        __int128 v8 = 0LL;
      }

      BOOL v22 = 0;
    }

    CFWriteStreamClose(v20);
    CFRelease(v20);
  }

  else
  {
    BOOL v22 = 0;
    __int128 v8 = 0LL;
    int v25 = 0;
  }

  if (!CFURLGetFileSystemRepresentation((CFURLRef)a2, 1u, buffer, 1024LL)) {
    buffer[0] = 0;
  }
  if (v22)
  {
    if (v7 && buffer[0]) {
      removexattr((const char *)buffer, "com.apple.ResourceFork", 1);
    }
    Mutable = CFDataCreateMutable(v6, 32LL);
    if (Mutable)
    {
      CFStringRef v27 = Mutable;
      *(void *)bytes = 0LL;
      *(void *)unsigned int v30 = 0LL;
      uint64_t v31 = 0LL;
      uint64_t v33 = 0x8000LL;
      CFDataAppendBytes(Mutable, bytes, 16LL);
      CFDataAppendBytes(v27, v30, 16LL);
      CFURLSetResourcePropertyForKey((CFURLRef)a2, (CFStringRef)*MEMORY[0x189604C20], v27, 0LL);
      CFRelease(v27);
    }
  }

  if (v25 && !v7 && buffer[0]) {
    removefile((const char *)buffer, 0LL, 0);
  }
  CFURLClearResourcePropertyCache((CFURLRef)a2);
  if (!v22)
  {
LABEL_12:
    __int128 v10 = (os_log_s *)bmarkLog;
    if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_ERROR)) {
      _CFURLWriteBookmarkDataToFile_cold_1((uint64_t)a2, (uint64_t)v8, v10);
    }
    uint64_t v11 = 0LL;
    char v12 = 1;
    if (v8) {
      goto LABEL_15;
    }
    goto LABEL_61;
  }

  char v12 = 0;
  uint64_t v11 = 1LL;
  if (v8)
  {
LABEL_15:
    CFErrorDomain Domain = CFErrorGetDomain(v8);
    __int128 v14 = (const __CFString *)*MEMORY[0x189604F40];
    if (!CFEqual(Domain, (CFTypeRef)*MEMORY[0x189604F40]))
    {
      __int128 v15 = CFErrorGetDomain(v8);
      CFIndex Code = CFErrorGetCode(v8);
      CFErrorRef v17 = _FSURLCreateStandardError(v6, v15, Code, 1, a2, 0LL);
      CFRelease(v8);
      __int128 v8 = v17;
    }

    if (a4) {
      char v18 = v12;
    }
    else {
      char v18 = 0;
    }
    if ((v18 & 1) != 0)
    {
      if (v8)
      {
        *a4 = CFRetain(v8);
LABEL_24:
        CFRelease(v8);
        goto LABEL_66;
      }

LABEL_61:
  char v28 = v12 ^ 1;
  if (!a4) {
    char v28 = 1;
  }
  if ((v28 & 1) == 0)
  {
    __int128 v14 = (const __CFString *)*MEMORY[0x189604F40];
    goto LABEL_65;
  }

uint64_t CFBookmarkPropertyKeyToKnownType(CFTypeRef cf2)
{
  else {
    return 0LL;
  }
}

uint64_t GetBookmarkResourcePropertyToInfo(CFTypeRef cf2, _OWORD *a2)
{
  if (sResourcePropertiesInfoCount != 1) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  unint64_t v5 = 0LL;
  while (1)
  {
    uint64_t result = CFEqual(*(CFTypeRef *)(sResourcePropertiesInfoPtr + v4), cf2);
    if ((_DWORD)result) {
      break;
    }
    if (sResourcePropertiesInfoCount == 1)
    {
      v4 += 32LL;
      if (v5++ <= 0x44) {
        continue;
      }
    }

    return result;
  }

  if (a2)
  {
    __int128 v8 = *(_OWORD *)(sResourcePropertiesInfoPtr + v4 + 16);
    *a2 = *(_OWORD *)(sResourcePropertiesInfoPtr + v4);
    a2[1] = v8;
  }

  return 1LL;
}

uint64_t CFBookmarkPropertyEnumToStringKey(int a1)
{
  if (sResourcePropertiesInfoCount != 1) {
    return 0LL;
  }
  unsigned int v2 = (_DWORD *)(sResourcePropertiesInfoPtr + 8);
  uint64_t v3 = -1LL;
  while (*v2 != a1)
  {
    v2 += 8;
  }

  return *((void *)v2 - 1);
}

BOOL bookmarkHasPathComponents(BookmarkData *a1, int a2)
{
  return BookmarkData::findItemInTOC(a1, 0x1004u, a2) != 0;
}

_DWORD *countPathComponents(BookmarkData *a1, int a2)
{
  uint64_t result = (_DWORD *)BookmarkData::findItemInTOC(a1, 0x1004u, a2);
  if (result)
  {
    uint64_t result = BookmarkData::getDataItemForTOCItem(a1, (uint64_t)result);
    if (result)
    {
      if (result[1] == 1537) {
        return (_DWORD *)(*result >> 2);
      }
      else {
        return 0LL;
      }
    }
  }

  return result;
}

CFNumberRef copyIndexedPathComponent(BookmarkData *a1, int a2, unsigned int a3)
{
  uint64_t ItemInTOC = BookmarkData::findItemInTOC(a1, 0x1004u, a2);
  if (!ItemInTOC) {
    return 0LL;
  }
  DataItemForTOCItem = BookmarkData::getDataItemForTOCItem(a1, ItemInTOC);
  if (!DataItemForTOCItem) {
    return 0LL;
  }
  if (DataItemForTOCItem[1] != 1537) {
    return 0LL;
  }
  if (a3 >= *DataItemForTOCItem >> 2) {
    return 0LL;
  }
  DataItemAtOffset = BookmarkData::getDataItemAtOffset(a1, DataItemForTOCItem[a3 + 2]);
  if (!DataItemAtOffset) {
    return 0LL;
  }
  __int128 v8 = DataItemAtOffset;
  CFTypeID TypeID = CFStringGetTypeID();
  return BookmarkData::copyItem((CFAllocatorRef *)a1, v8, TypeID);
}

CFStringRef copyPathComponentsAsString(BookmarkData *a1, int a2, int a3, char a4)
{
  unsigned int v8 = countPathComponents(a1, a2);
  if (v8)
  {
    unsigned int v9 = v8;
    __int128 v10 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFIndex numChars = 0LL;
    CFMutableStringRef theString = CFStringCreateMutable(v10, 0LL);
    int v11 = v9 & (a3 >> 31);
    if (v11 + a3 >= v9)
    {
      BOOL v13 = 1;
    }

    else
    {
      CFNumberRef v12 = copyIndexedPathComponent(a1, a2, v11 + a3);
      BOOL v13 = v12 == 0LL;
      if (v12)
      {
        __int128 v14 = (const __CFString *)v12;
        char v15 = a4 ^ 1;
        if (v11 + a3) {
          char v15 = 1;
        }
        unsigned int v16 = v11 + a3 + 1;
        do
        {
          if ((v15 & 1) == 0)
          {
            CFIndex v17 = numChars;
            if (numChars >= 1024)
            {
              CFStringAppendCharacters(theString, chars, numChars);
              CFIndex v17 = 0LL;
              CFIndex numChars = 0LL;
            }

            chars[v17] = 47;
            ++numChars;
          }

          CFIndex Length = CFStringGetLength(v14);
          CFIndex v19 = numChars;
          if (Length < 1025)
          {
            CFIndex v20 = Length;
            if (numChars + Length >= 1025)
            {
              CFStringAppendCharacters(theString, chars, numChars);
              CFIndex v19 = 0LL;
              CFIndex numChars = 0LL;
            }

            int v21 = &chars[v19];
            v29.CFIndex location = 0LL;
            v29.CFIndex length = v20;
            CFStringGetCharacters(v14, v29, v21);
            numChars += v20;
          }

          else
          {
            if (numChars)
            {
              CFStringAppendCharacters(theString, chars, numChars);
              CFIndex numChars = 0LL;
            }

            CFStringAppend(theString, v14);
          }

          CFRelease(v14);
          if (v16 >= v9) {
            break;
          }
          __int128 v14 = (const __CFString *)copyIndexedPathComponent(a1, a2, v16);
          char v15 = 0;
          ++v16;
        }

        while (v14);
      }
    }

    if (BookmarkData::getURLResourceProperties(a1, a2, (uint64_t)v25) && (v25[8] & 2) != 0 && (v25[0] & 2) != 0)
    {
      CFIndex v24 = numChars;
      if (numChars >= 1024)
      {
        CFStringAppendCharacters(theString, chars, numChars);
        CFIndex v24 = 0LL;
        CFIndex numChars = 0LL;
      }

      chars[v24] = 47;
      CFIndex v23 = numChars + 1;
      CFIndex numChars = v23;
      if (!v23) {
        return theString;
      }
    }

    else
    {
      if (v13)
      {
        uint64_t result = theString;
        if (theString)
        {
          CFRelease(theString);
          return 0LL;
        }

        return result;
      }

      CFIndex v23 = numChars;
      if (!numChars) {
        return theString;
      }
    }

    CFStringAppendCharacters(theString, chars, v23);
    return theString;
  }

  if (a3) {
    return &stru_189C5C0D0;
  }
  else {
    return @"/";
  }
}

CFArrayRef copyPathComponentsAsArray(BookmarkData *a1, int a2, unsigned int a3)
{
  unsigned int v6 = countPathComponents(a1, a2);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(*(CFAllocatorRef *)a1, 0LL, MEMORY[0x189605228]);
  unsigned int v8 = Mutable;
  if (Mutable) {
    BOOL v9 = v6 > a3;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    while (1)
    {
      CFNumberRef v11 = copyIndexedPathComponent(a1, a2, a3);
      if (!v11) {
        break;
      }
      CFNumberRef v12 = v11;
      CFArrayAppendValue(v8, v11);
      CFRelease(v12);
      if (++a3 >= v6) {
        goto LABEL_9;
      }
    }

    CFArrayRef Copy = 0LL;
    goto LABEL_11;
  }

  if (Mutable)
  {
LABEL_9:
    CFArrayRef Copy = CFArrayCreateCopy(*(CFAllocatorRef *)a1, v8);
LABEL_11:
    CFRelease(v8);
    return Copy;
  }

  return 0LL;
}

CFArrayRef copyVolumePathComponentsAsArray(BookmarkData *a1, unsigned int a2)
{
  BOOL v10 = 0;
  if (!BookmarkData::getItemAs(a1, 0x2030u, a2, &v10)
    || !v10
    || (BOOL v9 = @"/",
        (ArrayOfPathComponentsFromString = CFArrayCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  (const void **)&v9,  1LL,  MEMORY[0x189605228])) == 0LL))
  {
    CFTypeID TypeID = CFStringGetTypeID();
    unsigned int v6 = (const __CFString *)BookmarkData::copyItem(a1, 0x2002u, a2, TypeID);
    ArrayOfPathComponentsFromString = createArrayOfPathComponentsFromString(*(const __CFAllocator **)a1, v6, 0);
    if (v6) {
      CFRelease(v6);
    }
    if (!ArrayOfPathComponentsFromString)
    {
      CFTypeID v7 = CFArrayGetTypeID();
      return (const __CFArray *)BookmarkData::copyItem(a1, 0x2004u, a2, v7);
    }
  }

  return ArrayOfPathComponentsFromString;
}

CFDictionaryRef _CFURLCreateResourcePropertiesForKeysFromBookmarkData( const __CFAllocator *a1, CFTypeRef cf, const void *a3)
{
  if (!cf) {
    return 0LL;
  }
  CFTypeID v6 = CFGetTypeID(cf);
  CFTypeID TypeID = CFArrayGetTypeID();
  CFDictionaryRef Copy = 0LL;
  if (!a3 || v6 != TypeID) {
    return Copy;
  }
  CFTypeID v9 = CFGetTypeID(a3);
  if (v9 != CFDataGetTypeID()) {
    return 0LL;
  }
  BookmarkData::BookmarkData((BookmarkData *)v20, a1, (const __CFData *)a3);
  if (v21)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)cf);
    CFMutableArrayRef Mutable = CFDictionaryCreateMutable(a1, Count, MEMORY[0x189605240], MEMORY[0x189605250]);
    CFIndex v12 = CFArrayGetCount((CFArrayRef)cf);
    if (v12 >= 1)
    {
      unint64_t v13 = v12 + 1;
      do
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)cf, v13 - 2);
        if (ValueAtIndex)
        {
          char v15 = ValueAtIndex;
          CFTypeID v16 = CFGetTypeID(ValueAtIndex);
          if (v16 == CFStringGetTypeID() && !CFDictionaryContainsKey(Mutable, v15))
          {
            CFNumberRef v17 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v20, v15, 0LL);
            if (v17)
            {
              CFNumberRef v18 = v17;
              CFDictionaryAddValue(Mutable, v15, v17);
              CFRelease(v18);
            }
          }
        }

        --v13;
      }

      while (v13 > 1);
    }

    CFDictionaryRef Copy = CFDictionaryCreateCopy(a1, Mutable);
    if (Mutable) {
      CFRelease(Mutable);
    }
  }

  else
  {
    CFDictionaryRef Copy = 0LL;
  }

  BookmarkData::~BookmarkData((BookmarkData *)v20);
  return Copy;
}

CFNumberRef BookmarkCopyPropertyFromBookmarkData(BookmarkData *a1, const __CFString *cf2, uint64_t a3)
{
  if (!cf2) {
    return 0LL;
  }
  if (!GetBookmarkResourcePropertyToInfo(cf2, &v10))
  {
    uint64_t ItemInTOC = BookmarkData::findItemInTOC(a1, cf2, 1);
    if (!ItemInTOC) {
      return 0LL;
    }
LABEL_8:
    CFNumberRef v6 = BookmarkData::copyItem(a1, ItemInTOC, 0LL);
    goto LABEL_9;
  }

  if (!v11)
  {
    uint64_t ItemInTOC = BookmarkData::findItemInTOC(a1, DWORD2(v10), 1);
    if (!ItemInTOC) {
      return 0LL;
    }
    goto LABEL_8;
  }

  CFNumberRef v6 = (CFNumberRef)v11(a1, 1LL, v12);
LABEL_9:
  CFNumberRef v8 = v6;
  if (a3 && v6 && CFGetTypeID(v6) != a3)
  {
    CFRelease(v8);
    return 0LL;
  }

  return v8;
}

CFNumberRef _CFURLCreateResourcePropertyForKeyFromBookmarkData( const __CFAllocator *a1, const __CFString *a2, CFTypeRef cf)
{
  if (!cf) {
    return 0LL;
  }
  CFTypeID v6 = CFGetTypeID(cf);
  CFTypeID TypeID = CFDataGetTypeID();
  CFNumberRef v8 = 0LL;
  if (a2 && v6 == TypeID)
  {
    CFTypeID v9 = CFGetTypeID(a2);
    if (v9 == CFStringGetTypeID())
    {
      BookmarkData::BookmarkData((BookmarkData *)v11, a1, (const __CFData *)cf);
      CFNumberRef v8 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v11, a2, 0LL);
      BookmarkData::~BookmarkData((BookmarkData *)v11);
      return v8;
    }

    return 0LL;
  }

  return v8;
}

__CFString *_CFURLBookmarkDataCopyDescription(const void *a1)
{
  uint64_t v115 = *MEMORY[0x1895F89C0];
  CFMutableArrayRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  if (a1)
  {
    CFTypeID v3 = CFGetTypeID(a1);
    if (v3 == CFDataGetTypeID())
    {
      uint64_t v4 = CFGetAllocator(a1);
      BookmarkData::BookmarkData((BookmarkData *)v103, v4, (const __CFData *)a1);
      unint64_t v5 = v104;
      BytePtr = CFDataGetBytePtr((CFDataRef)a1);
      CFIndex Length = CFDataGetLength((CFDataRef)a1);
      CFStringAppendFormat(Mutable, 0LL, @"Bookmark: dataRef=%p len=%d\n", BytePtr, Length);
      if (v5)
      {
        CFStringAppendFormat(Mutable, 0LL, @"  signature = 0x%x\n", *v5);
        CFStringAppendFormat(Mutable, 0LL, @"  CFIndex length = 0x%x\n", v5[1]);
        CFStringAppendFormat(Mutable, 0LL, @"  version = 0x%x\n", v5[2]);
        CFStringAppendFormat(Mutable, 0LL, @"  bookmarkDataSectionOffset = 0x%x\n", v106);
        uint64_t v8 = v105;
        CFNumberRef v101 = v5;
        if (v105) {
          uint64_t v8 = *(unsigned int *)(v105 + v106);
        }
        CFStringAppendFormat(Mutable, 0LL, @"  bookmarkDataSectionFirstTOCOffset = 0x%x\n", v8);
        CFTypeID v9 = CFDataGetBytePtr((CFDataRef)a1);
        if (CFDataGetLength((CFDataRef)a1) >= 1)
        {
          CFIndex v10 = 0LL;
          uint64_t v11 = MEMORY[0x1895F8770];
          do
          {
            CFStringAppendFormat(Mutable, 0LL, @" 0x%5.5lx:", v10);
            for (uint64_t i = 0LL; i != 16; ++i)
            {
              if (v10 + i >= CFDataGetLength((CFDataRef)a1)) {
                CFStringAppendFormat(Mutable, 0LL, @"  ", usedBufLen);
              }
              else {
                CFStringAppendFormat(Mutable, 0LL, @"%2.2x", v9[i]);
              }
              if ((~(_DWORD)i & 3LL) == 0) {
                CFStringAppend(Mutable, @" ");
              }
            }

            CFStringAppendFormat(Mutable, 0LL, @"  | ");
            for (uint64_t j = 0LL; j != 16; ++j)
            {
              uint64_t v14 = v9[j];
              if ((char)v9[j] < 0)
              {
                if (__maskrune(v14, 0x40000uLL))
                {
LABEL_18:
                  uint64_t v15 = v9[j];
                  goto LABEL_21;
                }
              }

              else if ((*(_DWORD *)(v11 + 4 * v14 + 60) & 0x40000) != 0)
              {
                goto LABEL_18;
              }

              uint64_t v15 = 46LL;
LABEL_21:
              CFStringAppendFormat(Mutable, 0LL, @"%c", v15);
              if ((~(_DWORD)j & 3LL) == 0) {
                CFStringAppendFormat(Mutable, 0LL, @" ");
              }
            }

            CFStringAppendFormat(Mutable, 0LL, @" \n");
            v10 += 16LL;
            v9 += 16;
          }

          while (v10 < CFDataGetLength((CFDataRef)a1));
        }

        uint64_t FirstTOC = BookmarkData::getFirstTOC((BookmarkData *)v103, 1);
        if (FirstTOC)
        {
          uint64_t TOCAtOffset = (unsigned int *)FirstTOC;
          while (1)
          {
            CFNumberRef v18 = CFDataGetBytePtr((CFDataRef)a1);
            CFStringAppendFormat( Mutable,  0LL,  @" toc @ offset:0x%x(0x%p) level=%d count=%d next=0x%d\n",  (char *)TOCAtOffset - (char *)v18,  TOCAtOffset,  TOCAtOffset[2],  TOCAtOffset[4],  TOCAtOffset[3]);
            if (TOCAtOffset[4]) {
              break;
            }
LABEL_341:
            uint64_t TOCAtOffset = (unsigned int *)BookmarkData::getTOCAtOffset((BookmarkData *)v103, TOCAtOffset[3]);
            if (!TOCAtOffset) {
              goto LABEL_342;
            }
          }

          unint64_t v19 = 0LL;
          CFIndex v20 = TOCAtOffset + 5;
          while (1)
          {
            __int128 v113 = 0u;
            __int128 v114 = 0u;
            __int128 v111 = 0u;
            __int128 v112 = 0u;
            __int128 v109 = 0u;
            __int128 v110 = 0u;
            *(_OWORD *)buffer = 0u;
            __int128 v108 = 0u;
            int v21 = *v20;
            if ((int)*v20 > 8223)
            {
              if (v21 > 61461)
              {
                if (v21 > 61568)
                {
                  if (v21 <= 983060)
                  {
                    switch(v21)
                    {
                      case 61569:
                        BOOL v22 = "sandboxROExtension:";
                        goto LABEL_143;
                      case 61570:
                        BOOL v22 = "securityScopeCookie:";
                        goto LABEL_143;
                      case 65024:
                        BOOL v22 = "aliasData:";
                        goto LABEL_143;
                    }
                  }

                  else if (v21 > 1048577)
                  {
                    if (v21 == 1048578)
                    {
                      BOOL v22 = "testKey2";
                      goto LABEL_143;
                    }

                    if (v21 == 251658516)
                    {
                      BOOL v22 = "version:";
                      goto LABEL_143;
                    }
                  }

                  else
                  {
                    if (v21 == 983061)
                    {
                      BOOL v22 = "shortVersion:";
                      goto LABEL_143;
                    }

                    if (v21 == 1048561)
                    {
                      BOOL v22 = "testKey1";
                      goto LABEL_143;
                    }
                  }
                }

                else if (v21 <= 61472)
                {
                  switch(v21)
                  {
                    case 61462:
                      BOOL v22 = "displayNamesDict:";
                      goto LABEL_143;
                    case 61463:
                      BOOL v22 = "displayName:";
                      goto LABEL_143;
                    case 61472:
                      BOOL v22 = "effectiveIconData:";
                      goto LABEL_143;
                  }
                }

                else if (v21 > 61487)
                {
                  if (v21 == 61488)
                  {
                    BOOL v22 = "bookmarkCreationTime:";
                    goto LABEL_143;
                  }

                  if (v21 == 61568)
                  {
                    BOOL v22 = "sandboxRWExtension:";
                    goto LABEL_143;
                  }
                }

                else
                {
                  if (v21 == 61473)
                  {
                    BOOL v22 = "effectiveFlattenedIconRef:";
                    goto LABEL_143;
                  }

                  if (v21 == 61474)
                  {
                    BOOL v22 = "typeBindingData:";
                    goto LABEL_143;
                  }
                }
              }

              else if (v21 > 49152)
              {
                if (v21 <= 53248)
                {
                  switch(v21)
                  {
                    case 49153:
                      BOOL v22 = "volHomeDirRelativePathComponentCount:";
                      goto LABEL_143;
                    case 49169:
                      BOOL v22 = "userName:";
                      goto LABEL_143;
                    case 49170:
                      BOOL v22 = "userUID:";
                      goto LABEL_143;
                  }
                }

                else if (v21 > 57345)
                {
                  if (v21 == 57346)
                  {
                    BOOL v22 = "haseBaseURL:";
                    goto LABEL_143;
                  }

                  if (v21 == 57347)
                  {
                    BOOL v22 = "baseURLComponentCount:";
                    goto LABEL_143;
                  }
                }

                else
                {
                  if (v21 == 53249)
                  {
                    BOOL v22 = "wasFileIDFormat:";
                    goto LABEL_143;
                  }

                  if (v21 == 53264)
                  {
                    BOOL v22 = "creationOptions:";
                    goto LABEL_143;
                  }
                }
              }

              else if (v21 <= 8255)
              {
                switch(v21)
                {
                  case 8224:
                    BOOL v22 = "volProps:";
                    goto LABEL_143;
                  case 8240:
                    BOOL v22 = "volWasBoot:";
                    goto LABEL_143;
                  case 8242:
                    BOOL v22 = "volIDiskUserName:";
                    goto LABEL_143;
                }
              }

              else if (v21 > 8287)
              {
                if (v21 == 8288)
                {
                  BOOL v22 = "volAutomountPath:";
                  goto LABEL_143;
                }

                if (v21 == 8304)
                {
                  BOOL v22 = "bookmarkFileProviderString:";
                  goto LABEL_143;
                }
              }

              else
              {
                if (v21 == 8256)
                {
                  BOOL v22 = "diskImageDepth:";
                  goto LABEL_143;
                }

                if (v21 == 8272)
                {
                  BOOL v22 = "volMountURL:";
                  goto LABEL_143;
                }
              }

LABEL_136:
              if (v21 < 0)
              {
                unsigned int v24 = v21 & 0x7FFFFFFF;
                CFTypeID TypeID = CFStringGetTypeID();
                CFIndex v23 = (const __CFString *)BookmarkData::copyDataItemAtOffset((BookmarkData *)v103, v24, TypeID);
              }

              else
              {
                CFIndex v23 = (const __CFString *)CFBookmarkPropertyEnumToStringKey(v21);
              }

              CFIndex v26 = v23;
              BOOL v22 = (const char *)buffer;
              if (v23)
              {
                CFIndex v102 = 0LL;
                v116.CFIndex length = CFStringGetLength(v23);
                v116.CFIndex location = 0LL;
                CFIndex Bytes = CFStringGetBytes(v26, v116, 0x8000100u, 0, 0, buffer, 128LL, &v102);
                CFIndex v28 = v102;
                if (!Bytes) {
                  CFIndex v28 = 0LL;
                }
                buffer[v28] = 0;
              }
            }

            else if (v21 <= 4176)
            {
              if (v21 > 4127)
              {
                switch(v21)
                {
                  case 4160:
                    BOOL v22 = "creationDate:";
                    break;
                  case 4161:
                    BOOL v22 = "accessDate:";
                    break;
                  case 4162:
                    BOOL v22 = "modificationDate:";
                    break;
                  case 4163:
                    BOOL v22 = "attrModificationDate:";
                    break;
                  default:
                    if (v21 == 4128)
                    {
                      BOOL v22 = "fileName:";
                    }

                    else
                    {
                      if (v21 != 4144) {
                        goto LABEL_136;
                      }
                      BOOL v22 = "fileID:";
                    }

                    break;
                }
              }

              else
              {
                BOOL v22 = "pathComponents:";
                switch(v21)
                {
                  case 4099:
                    BOOL v22 = "urlString:";
                    break;
                  case 4100:
                    break;
                  case 4101:
                    BOOL v22 = "fileIDs:";
                    break;
                  case 4102:
                    BOOL v22 = "pathComponentProps:";
                    break;
                  case 4103:
                  case 4105:
                  case 4106:
                  case 4107:
                  case 4108:
                  case 4109:
                  case 4110:
                  case 4111:
                    goto LABEL_136;
                  case 4104:
                    BOOL v22 = "tagStyle:";
                    break;
                  case 4112:
                    BOOL v22 = "resourceProps:";
                    break;
                  default:
                    if (v21 != -2) {
                      goto LABEL_136;
                    }
                    BOOL v22 = "toc:";
                    break;
                }
              }
            }

            else if (v21 < 0x2000)
            {
              switch(v21)
              {
                case 4177:
                  BOOL v22 = "relativeDirsUpMinusOne:";
                  break;
                case 4178:
                  goto LABEL_136;
                case 4179:
                  BOOL v22 = "relativeDirsDownMinusOne:";
                  break;
                case 4180:
                  BOOL v22 = "relativeDirsUp:";
                  break;
                case 4181:
                  BOOL v22 = "relativeDirsDown:";
                  break;
                case 4182:
                  BOOL v22 = "createdWithRelativeURL";
                  break;
                default:
                  if (v21 == 4353)
                  {
                    BOOL v22 = "fragmentString:";
                  }

                  else
                  {
                    if (v21 != 4354) {
                      goto LABEL_136;
                    }
                    BOOL v22 = "queryString:";
                  }

                  break;
              }
            }

            else
            {
              switch(v21)
              {
                case 8192:
                  BOOL v22 = "volInfoDepths:";
                  break;
                case 8194:
                  BOOL v22 = "volPath:";
                  break;
                case 8196:
                  BOOL v22 = "volPathComponents:";
                  break;
                case 8197:
                  BOOL v22 = "volURL:";
                  break;
                case 8208:
                  BOOL v22 = "volName:";
                  break;
                case 8209:
                  BOOL v22 = "volUUID:";
                  break;
                case 8210:
                  BOOL v22 = "volCapacity:";
                  break;
                case 8211:
                  BOOL v22 = "volCreationDate:";
                  break;
                default:
                  goto LABEL_136;
              }
            }

LABEL_143:
            CFStringAppendFormat( Mutable,  0LL,  @" %3d itemType=0x%x flags=0x%x dataOffset=0x%x %s"),  v19,  *v20,  v20[2],  v101[3] + v20[1],  v22);
            unsigned int v29 = *v20;
            if (*v20 == 53264)
            {
              DataItemAtOffset = BookmarkData::getDataItemAtOffset((BookmarkData *)v103, v20[1]);
              if (!DataItemAtOffset || *DataItemAtOffset < 4) {
                goto LABEL_335;
              }
              unsigned int v39 = DataItemAtOffset[2];
              if ((v39 & 0x10000000) != 0)
              {
                CFStringAppendFormat( Mutable,  0LL,  @"%s ",  "kCFURLBookmarkCreationAllowCreationIfResourceDoesNotExistMask");
                if ((v39 & 0x20000000) == 0) {
                  goto LABEL_185;
                }
              }

              else if ((v39 & 0x20000000) == 0)
              {
LABEL_185:
                if ((v39 & 0x200) == 0) {
                  goto LABEL_186;
                }
LABEL_339:
                CFStringAppendFormat(Mutable, 0LL, @"%s ", "kCFURLBookmarkCreationMinimalBookmarkMask");
                if ((v39 & 0x400) != 0)
                {
LABEL_340:
                  CFStringAppendFormat(Mutable, 0LL, @"%s ", "kCFURLBookmarkCreationSuitableForBookmarkFile");
                  goto LABEL_335;
                }

                goto LABEL_335;
              }

              CFStringAppendFormat( Mutable,  0LL,  @"%s ",  "kCFURLBookmarkCreationDoNotIncludeSandboxExtensionsMask");
              if ((v39 & 0x200) == 0)
              {
LABEL_186:
                if ((v39 & 0x400) != 0) {
                  goto LABEL_340;
                }
                goto LABEL_335;
              }

              goto LABEL_339;
            }

            if (v29 == 8224)
            {
              unsigned __int8 v34 = BookmarkData::getDataItemAtOffset((BookmarkData *)v103, v20[1]);
              if (!v34 || *v34 < 0x18) {
                goto LABEL_335;
              }
              uint64_t v35 = *((void *)v34 + 1);
              uint64_t v36 = *((void *)v34 + 2);
              uint64_t v37 = *((void *)v34 + 3);
              CFStringAppendFormat(Mutable, 0LL, @"Props:[");
              if ((v36 & 1) != 0)
              {
                uint64_t v42 = "local";
                if ((v35 & 1) == 0) {
                  uint64_t v42 = "!local";
                }
                unsigned int v43 = "**";
                if ((v37 & 1) == 0) {
                  unsigned int v43 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v42, v43);
                if ((v36 & 2) != 0) {
                  goto LABEL_195;
                }
LABEL_163:
                if ((v36 & 4) == 0) {
                  goto LABEL_164;
                }
LABEL_200:
                uint64_t v46 = "browse";
                if ((v35 & 4) == 0) {
                  uint64_t v46 = "!browse";
                }
                int v47 = "**";
                if ((v37 & 4) == 0) {
                  int v47 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v46, v47);
                if ((v36 & 8) != 0) {
                  goto LABEL_205;
                }
LABEL_165:
                if ((v36 & 0x20) == 0) {
                  goto LABEL_166;
                }
LABEL_210:
                unint64_t v50 = "eject";
                if ((v35 & 0x20) == 0) {
                  unint64_t v50 = "!eject";
                }
                unint64_t v51 = "**";
                if ((v37 & 0x20) == 0) {
                  unint64_t v51 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v50, v51);
                if ((v36 & 0x40) != 0) {
                  goto LABEL_215;
                }
LABEL_167:
                if ((v36 & 0x80) == 0) {
                  goto LABEL_168;
                }
LABEL_220:
                uint64_t v54 = "internal";
                if ((v35 & 0x80) == 0) {
                  uint64_t v54 = "!internal";
                }
                uint64_t v55 = "**";
                if ((v37 & 0x80) == 0) {
                  uint64_t v55 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v54, v55);
                if ((v36 & 0x100) != 0) {
                  goto LABEL_225;
                }
LABEL_169:
                if ((v36 & 0x200) == 0) {
                  goto LABEL_170;
                }
LABEL_230:
                uint64_t v58 = "diskimage";
                if ((v35 & 0x200) == 0) {
                  uint64_t v58 = "!diskimage";
                }
                v59 = "**";
                if ((v37 & 0x200) == 0) {
                  v59 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v58, v59);
                if ((v36 & 0x1000) != 0) {
                  goto LABEL_235;
                }
LABEL_171:
                if ((v36 & 0x100000000LL) == 0) {
                  goto LABEL_172;
                }
LABEL_240:
                CFTypeID v62 = "file-ids";
                if ((v35 & 0x100000000LL) == 0) {
                  CFTypeID v62 = "!file-ids";
                }
                v63 = "**";
                if ((v37 & 0x100000000LL) == 0) {
                  v63 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v62, v63);
                if ((v36 & 0x1000000000LL) != 0) {
                  goto LABEL_245;
                }
LABEL_173:
                if ((v36 & 0x2000000000000LL) == 0) {
                  goto LABEL_174;
                }
LABEL_250:
                CFIndex v66 = "hard-links";
                if ((v35 & 0x2000000000000LL) == 0) {
                  CFIndex v66 = "!hard-links";
                }
                uint64_t v67 = "**";
                if ((v37 & 0x2000000000000LL) == 0) {
                  uint64_t v67 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v66, v67);
                if ((v36 & 0x10000000000LL) != 0) {
                  goto LABEL_255;
                }
LABEL_175:
                if ((v36 & 0x20000000000000LL) == 0) {
                  goto LABEL_176;
                }
LABEL_260:
                v70 = "isJournaling";
                if ((v35 & 0x20000000000000LL) == 0) {
                  v70 = "!isJournaling";
                }
                CFIndex v71 = "**";
                if ((v37 & 0x20000000000000LL) == 0) {
                  CFIndex v71 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v70, v71);
                if ((v36 & 0x40000000000000LL) != 0) {
                  goto LABEL_265;
                }
LABEL_177:
                if ((v36 & 0x80000000000000LL) == 0) {
                  goto LABEL_178;
                }
LABEL_270:
                unint64_t v74 = "zeroRuns";
                if ((v35 & 0x80000000000000LL) == 0) {
                  unint64_t v74 = "!zeroRuns";
                }
                CFURLRef v75 = "**";
                if ((v37 & 0x80000000000000LL) == 0) {
                  CFURLRef v75 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v74, v75);
                if ((v36 & 0x80000000000LL) != 0) {
                  goto LABEL_275;
                }
LABEL_179:
                if ((v36 & 0x100000000000LL) == 0) {
                  goto LABEL_334;
                }
              }

              else
              {
                if ((v36 & 2) == 0) {
                  goto LABEL_163;
                }
LABEL_195:
                int v44 = "auto";
                if ((v35 & 2) == 0) {
                  int v44 = "!auto";
                }
                int v45 = "**";
                if ((v37 & 2) == 0) {
                  int v45 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v44, v45);
                if ((v36 & 4) != 0) {
                  goto LABEL_200;
                }
LABEL_164:
                if ((v36 & 8) == 0) {
                  goto LABEL_165;
                }
LABEL_205:
                uint64_t v48 = "ro";
                if ((v35 & 8) == 0) {
                  uint64_t v48 = "rw";
                }
                unint64_t v49 = "**";
                if ((v37 & 8) == 0) {
                  unint64_t v49 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v48, v49);
                if ((v36 & 0x20) != 0) {
                  goto LABEL_210;
                }
LABEL_166:
                if ((v36 & 0x40) == 0) {
                  goto LABEL_167;
                }
LABEL_215:
                unint64_t v52 = "rmvbl";
                if ((v35 & 0x40) == 0) {
                  unint64_t v52 = "!rmvbl";
                }
                uint64_t v53 = "**";
                if ((v37 & 0x40) == 0) {
                  uint64_t v53 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v52, v53);
                if ((v36 & 0x80) != 0) {
                  goto LABEL_220;
                }
LABEL_168:
                if ((v36 & 0x100) == 0) {
                  goto LABEL_169;
                }
LABEL_225:
                unint64_t v56 = "external";
                if ((v35 & 0x100) == 0) {
                  unint64_t v56 = "!external";
                }
                unint64_t v57 = "**";
                if ((v37 & 0x100) == 0) {
                  unint64_t v57 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v56, v57);
                if ((v36 & 0x200) != 0) {
                  goto LABEL_230;
                }
LABEL_170:
                if ((v36 & 0x1000) == 0) {
                  goto LABEL_171;
                }
LABEL_235:
                CFNumberRef v60 = "ipod";
                if ((v35 & 0x1000) == 0) {
                  CFNumberRef v60 = "!ipod";
                }
                CFNumberRef v61 = "**";
                if ((v37 & 0x1000) == 0) {
                  CFNumberRef v61 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v60, v61);
                if ((v36 & 0x100000000LL) != 0) {
                  goto LABEL_240;
                }
LABEL_172:
                if ((v36 & 0x1000000000LL) == 0) {
                  goto LABEL_173;
                }
LABEL_245:
                uint64_t v64 = "symlinks";
                if ((v35 & 0x1000000000LL) == 0) {
                  uint64_t v64 = "!symlinks";
                }
                CFIndex v65 = "**";
                if ((v37 & 0x1000000000LL) == 0) {
                  CFIndex v65 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v64, v65);
                if ((v36 & 0x2000000000000LL) != 0) {
                  goto LABEL_250;
                }
LABEL_174:
                if ((v36 & 0x10000000000LL) == 0) {
                  goto LABEL_175;
                }
LABEL_255:
                CFIndex v68 = "journal";
                if ((v35 & 0x10000000000LL) == 0) {
                  CFIndex v68 = "!journal";
                }
                v69 = "**";
                if ((v37 & 0x10000000000LL) == 0) {
                  v69 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v68, v69);
                if ((v36 & 0x20000000000000LL) != 0) {
                  goto LABEL_260;
                }
LABEL_176:
                if ((v36 & 0x40000000000000LL) == 0) {
                  goto LABEL_177;
                }
LABEL_265:
                CFIndex v72 = "sparseFiles";
                if ((v35 & 0x40000000000000LL) == 0) {
                  CFIndex v72 = "!sparseFiles";
                }
                CFURLRef v73 = "**";
                if ((v37 & 0x40000000000000LL) == 0) {
                  CFURLRef v73 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v72, v73);
                if ((v36 & 0x80000000000000LL) != 0) {
                  goto LABEL_270;
                }
LABEL_178:
                if ((v36 & 0x80000000000LL) == 0) {
                  goto LABEL_179;
                }
LABEL_275:
                CFURLRef v76 = "case-sens";
                if ((v35 & 0x80000000000LL) == 0) {
                  CFURLRef v76 = "!case-sens";
                }
                CFIndex v77 = "**";
                if ((v37 & 0x80000000000LL) == 0) {
                  CFIndex v77 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v76, v77);
                if ((v36 & 0x100000000000LL) == 0) {
                  goto LABEL_334;
                }
              }

              v78 = "case-presrv";
              if ((v35 & 0x100000000000LL) == 0) {
                v78 = "!case-presrv";
              }
              BOOL v79 = (v37 & 0x100000000000LL) == 0;
              goto LABEL_331;
            }

            if (v29 != 4112)
            {
              unsigned int v40 = (const __CFString *)BookmarkData::copyDataItemAtOffset((BookmarkData *)v103, v20[1], 0LL);
              if (v40)
              {
                uint64_t v41 = v40;
                describeURLType(v40, Mutable);
                CFRelease(v41);
              }

              goto LABEL_335;
            }

            unsigned int v30 = BookmarkData::getDataItemAtOffset((BookmarkData *)v103, v20[1]);
            if (v30 && *v30 >= 0x18)
            {
              uint64_t v31 = *((void *)v30 + 1);
              uint64_t v32 = *((void *)v30 + 2);
              uint64_t v33 = *((void *)v30 + 3);
              CFStringAppendFormat(Mutable, 0LL, @"Props:[");
              if ((v32 & 1) != 0)
              {
                unsigned __int8 v80 = "file";
                if ((v31 & 1) == 0) {
                  unsigned __int8 v80 = "!file";
                }
                uint64_t v81 = "**";
                if ((v33 & 1) == 0) {
                  uint64_t v81 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v80, v81);
                if ((v32 & 2) != 0) {
                  goto LABEL_288;
                }
LABEL_150:
                if ((v32 & 4) == 0) {
                  goto LABEL_151;
                }
LABEL_293:
                v84 = "sym";
                if ((v31 & 4) == 0) {
                  v84 = "!sym";
                }
                CFIndex v85 = "**";
                if ((v33 & 4) == 0) {
                  CFIndex v85 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v84, v85);
                if ((v32 & 8) != 0) {
                  goto LABEL_298;
                }
LABEL_152:
                if ((v32 & 0x10) == 0) {
                  goto LABEL_153;
                }
LABEL_303:
                v88 = "pkg";
                if ((v31 & 0x10) == 0) {
                  v88 = "!pkg";
                }
                v89 = "**";
                if ((v33 & 0x10) == 0) {
                  v89 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v88, v89);
                if ((v32 & 0x20) != 0) {
                  goto LABEL_308;
                }
LABEL_154:
                if ((v32 & 0x40) == 0) {
                  goto LABEL_155;
                }
LABEL_313:
                v92 = "user-immut";
                if ((v31 & 0x40) == 0) {
                  v92 = "user-mut";
                }
                CFIndex v93 = "**";
                if ((v33 & 0x40) == 0) {
                  CFIndex v93 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v92, v93);
                if ((v32 & 0x80) != 0) {
                  goto LABEL_318;
                }
LABEL_156:
                if ((v32 & 0x100) == 0) {
                  goto LABEL_157;
                }
LABEL_323:
                v96 = "ext-hid";
                if ((v31 & 0x100) == 0) {
                  v96 = "ext-vis";
                }
                v97 = "**";
                if ((v33 & 0x100) == 0) {
                  v97 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v96, v97);
                if ((v32 & 0x200) == 0)
                {
LABEL_334:
                  CFStringAppendFormat(Mutable, 0LL, @"]");
                  goto LABEL_335;
                }
              }

              else
              {
                if ((v32 & 2) == 0) {
                  goto LABEL_150;
                }
LABEL_288:
                CFRange v82 = "dir";
                if ((v31 & 2) == 0) {
                  CFRange v82 = "!dir";
                }
                v83 = "**";
                if ((v33 & 2) == 0) {
                  v83 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v82, v83);
                if ((v32 & 4) != 0) {
                  goto LABEL_293;
                }
LABEL_151:
                if ((v32 & 8) == 0) {
                  goto LABEL_152;
                }
LABEL_298:
                unint64_t v86 = "vol";
                if ((v31 & 8) == 0) {
                  unint64_t v86 = "!vol";
                }
                BOOL v87 = "**";
                if ((v33 & 8) == 0) {
                  BOOL v87 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v86, v87);
                if ((v32 & 0x10) != 0) {
                  goto LABEL_303;
                }
LABEL_153:
                if ((v32 & 0x20) == 0) {
                  goto LABEL_154;
                }
LABEL_308:
                v90 = "sys-immut";
                if ((v31 & 0x20) == 0) {
                  v90 = "sys-mut";
                }
                CFNumberRef v91 = "**";
                if ((v33 & 0x20) == 0) {
                  CFNumberRef v91 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v90, v91);
                if ((v32 & 0x40) != 0) {
                  goto LABEL_313;
                }
LABEL_155:
                if ((v32 & 0x80) == 0) {
                  goto LABEL_156;
                }
LABEL_318:
                int v94 = "hid";
                if ((v31 & 0x80) == 0) {
                  int v94 = "vis";
                }
                CFIndex v95 = "**";
                if ((v33 & 0x80) == 0) {
                  CFIndex v95 = "";
                }
                CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v94, v95);
                if ((v32 & 0x100) != 0) {
                  goto LABEL_323;
                }
LABEL_157:
                if ((v32 & 0x200) == 0) {
                  goto LABEL_334;
                }
              }

              v78 = "app";
              if ((v31 & 0x200) == 0) {
                v78 = "!app";
              }
              BOOL v79 = (v33 & 0x200) == 0;
LABEL_331:
              CFTypeID v98 = "**";
              if (v79) {
                CFTypeID v98 = "";
              }
              CFStringAppendFormat(Mutable, 0LL, @"%s%s ", v78, v98);
              goto LABEL_334;
            }

LABEL_335:
            CFStringAppendFormat(Mutable, 0LL, @" \n");
            ++v19;
            v20 += 3;
            if (v19 >= TOCAtOffset[4]) {
              goto LABEL_341;
            }
          }
        }
      }

LABEL_342:
      BookmarkData::~BookmarkData((BookmarkData *)v103);
    }
  }

  return Mutable;
}

void describeURLType(const __CFString *a1, __CFString *a2)
{
  if (a1)
  {
    CFTypeID v4 = CFGetTypeID(a1);
    if (v4 == CFStringGetTypeID())
    {
      CFStringAppend(a2, @"");
      CFStringAppend(a2, a1);
      CFStringAppend(a2, @"");
    }

    else
    {
      CFTypeID v5 = CFGetTypeID(a1);
      if (v5 == CFNumberGetTypeID())
      {
        uint64_t v22 = 0LL;
        uint64_t valuePtr = 0LL;
        if (CFNumberGetValue((CFNumberRef)a1, kCFNumberLongLongType, &valuePtr))
        {
          CFStringAppendFormat(a2, 0LL, @" %ld/0x%x ", valuePtr, valuePtr);
        }

        else if (CFNumberGetValue((CFNumberRef)a1, kCFNumberDoubleType, &v22))
        {
          CFStringAppendFormat(a2, 0LL, @" %lg ", v22);
        }

        else
        {
          CFStringAppendFormat(a2, 0LL, @" <number> ");
        }
      }

      else
      {
        CFTypeID v6 = CFGetTypeID(a1);
        if (v6 == CFDataGetTypeID())
        {
          BytePtr = CFDataGetBytePtr((CFDataRef)a1);
          CFIndex Length = CFDataGetLength((CFDataRef)a1);
          CFIndex v9 = Length;
          if (Length >= 32)
          {
            for (uint64_t i = 0LL; i != 16; ++i)
            {
              CFStringAppendFormat(a2, 0LL, @" %2.2x", BytePtr[i]);
              if ((~(_BYTE)i & 3) == 0) {
                CFStringAppend(a2, @" ");
              }
            }

            CFStringAppend(a2, @"...");
            CFIndex v15 = v9 - 16;
            do
            {
              CFStringAppendFormat(a2, 0LL, @" %2.2x", BytePtr[v15]);
              if ((v15 & 0x8000000000000003LL) == 3) {
                CFStringAppend(a2, @" ");
              }
              ++v15;
            }

            while (v15 < v9);
          }

          else if (Length >= 1)
          {
            uint64_t v10 = 0LL;
            do
            {
              CFStringAppendFormat(a2, 0LL, @" %2.2x", BytePtr[v10]);
              if ((~(_BYTE)v10 & 3) == 0) {
                CFStringAppend(a2, @" ");
              }
              ++v10;
            }

            while (v9 != v10);
          }
        }

        else
        {
          CFTypeID v11 = CFGetTypeID(a1);
          if (v11 == CFDateGetTypeID())
          {
            CFAbsoluteTime v12 = MEMORY[0x186E19B18](a1);
            CFGregorianDate GregorianDate = CFAbsoluteTimeGetGregorianDate(v12, 0LL);
            CFStringAppendFormat( a2,  0LL,  @" %4.4d/%2.2d/%2.2d %2.2d:%2.2d:%-6.4f ",  *(void *)&GregorianDate.year,  ((int)(*(void *)&GregorianDate.year >> 8) >> 24),  ((int)(*(void *)&GregorianDate.year >> 16) >> 24),  ((int)(*(void *)&GregorianDate.year >> 24) >> 24),  (*(int *)&GregorianDate.month >> 24),  *(void *)&GregorianDate.second);
          }

          else if ((const __CFString *)*MEMORY[0x189604DE8] == a1)
          {
            CFStringAppendFormat(a2, 0LL, @" true  ");
          }

          else if ((const __CFString *)*MEMORY[0x189604DE0] == a1)
          {
            CFStringAppendFormat(a2, 0LL, @" false ");
          }

          else
          {
            CFTypeID v16 = CFGetTypeID(a1);
            if (v16 == CFArrayGetTypeID())
            {
              CFStringAppendFormat(a2, 0LL, @"[ ");
              if (CFArrayGetCount((CFArrayRef)a1) >= 1)
              {
                CFIndex v17 = 0LL;
                do
                {
                  if (v17) {
                    CFStringAppendFormat(a2, 0LL, @", ");
                  }
                  ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v17);
                  describeURLType(ValueAtIndex, a2);
                  ++v17;
                }

                while (v17 < CFArrayGetCount((CFArrayRef)a1));
              }

              CFStringAppendFormat(a2, 0LL, @"] ");
            }

            else
            {
              CFStringRef v19 = CFCopyDescription(a1);
              if (v19)
              {
                CFIndex v20 = v19;
                CFStringAppend(a2, @"");
                CFStringAppend(a2, v20);
                CFStringAppend(a2, @"");
                CFRelease(v20);
              }

              else
              {
                CFTypeID v21 = CFGetTypeID(a1);
                CFStringAppendFormat(a2, 0LL, @" Unknown encoded type, typeID=%d", v21);
              }
            }
          }
        }
      }
    }
  }

  else
  {
    CFStringAppendFormat(a2, 0LL, @"NULL");
  }

uint64_t _CFURLCompareBookmarkData(CFTypeRef cf, const void *a2, uint64_t a3, void *a4)
{
  if (a4) {
    *a4 = 0LL;
  }
  if (!cf) {
    return 0LL;
  }
  CFTypeID v6 = CFGetTypeID(cf);
  CFTypeID TypeID = CFDataGetTypeID();
  uint64_t v8 = 0LL;
  if (a2 && v6 == TypeID)
  {
    CFTypeID v9 = CFGetTypeID(a2);
    if (v9 == CFDataGetTypeID())
    {
      uint64_t v10 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      BookmarkData::BookmarkData( (BookmarkData *)v123,  (const __CFAllocator *)*MEMORY[0x189604DB0],  (const __CFData *)cf);
      BookmarkData::BookmarkData((BookmarkData *)v121, v10, (const __CFData *)a2);
      if (v124 && v122)
      {
        CFIndex Length = CFDataGetLength((CFDataRef)cf);
        if (Length != CFDataGetLength((CFDataRef)a2)
          || (BytePtr = CFDataGetBytePtr((CFDataRef)cf),
              unint64_t v13 = CFDataGetBytePtr((CFDataRef)a2),
              size_t v14 = CFDataGetLength((CFDataRef)cf),
              memcmp(BytePtr, v13, v14)))
        {
          uint64_t ItemInTOC = BookmarkData::findItemInTOC((BookmarkData *)v123, 0x1003u, 1);
          uint64_t v16 = BookmarkData::findItemInTOC((BookmarkData *)v121, 0x1003u, 1);
          if (ItemInTOC | v16)
          {
            uint64_t v8 = 4096LL;
            if (!ItemInTOC) {
              goto LABEL_51;
            }
            uint64_t v17 = v16;
            if (!v16) {
              goto LABEL_51;
            }
            CFTypeID v18 = CFStringGetTypeID();
            CFStringRef v19 = (const __CFString *)BookmarkData::copyItem((BookmarkData *)v123, ItemInTOC, v18);
            CFTypeID v20 = CFStringGetTypeID();
            CFTypeID v21 = (const __CFString *)BookmarkData::copyItem((BookmarkData *)v121, v17, v20);
            CFNumberRef v22 = (CFNumberRef)v21;
            if (v19)
            {
              if (v21)
              {
                if (CFStringCompare(v19, v21, 0LL)) {
                  uint64_t v8 = 4096LL;
                }
                else {
                  uint64_t v8 = 0x8000LL;
                }
                CFRelease(v22);
              }

              else
              {
                uint64_t v8 = 4096LL;
              }

              CFNumberRef v22 = (CFNumberRef)v19;
LABEL_50:
              CFRelease(v22);
              goto LABEL_51;
            }

            uint64_t v8 = 4096LL;
LABEL_46:
            if (!v22) {
              goto LABEL_51;
            }
            goto LABEL_50;
          }

          BOOL v23 = compareBookmarkProperties( (BookmarkData *)v123,  (BookmarkData *)v121,  (const __CFString *)*MEMORY[0x189605560])
             && compareBookmarkProperties( (BookmarkData *)v123,  (BookmarkData *)v121,  (const __CFString *)*MEMORY[0x189605618])
             && compareBookmarkProperties( (BookmarkData *)v123,  (BookmarkData *)v121,  (const __CFString *)*MEMORY[0x189605530]);
          unsigned int v24 = (const __CFString *)*MEMORY[0x1896053E8];
          CFTypeID v25 = CFBooleanGetTypeID();
          CFNumberRef v22 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v24, v25);
          CFTypeID v26 = CFBooleanGetTypeID();
          CFStringRef v27 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v24, v26);
          if (v22 && CFBooleanGetValue(v22) && v27 && CFBooleanGetValue(v27) && !v23)
          {
            uint64_t v8 = 4096LL;
            goto LABEL_45;
          }

          if (!compareBookmarkProperties( (BookmarkData *)v123,  (BookmarkData *)v121,  (const __CFString *)*MEMORY[0x1896053B8])
            || !compareBookmarkProperties( (BookmarkData *)v123,  (BookmarkData *)v121,  (const __CFString *)*MEMORY[0x189605378])
            || !compareBookmarkProperties( (BookmarkData *)v123,  (BookmarkData *)v121,  (const __CFString *)*MEMORY[0x1896053C8])
            || !compareBookmarkProperties((BookmarkData *)v123, (BookmarkData *)v121, v24))
          {
            uint64_t v8 = 4096LL;
            goto LABEL_40;
          }

          if (v124) {
            int v29 = *v124;
          }
          else {
            int v29 = 0;
          }
          if (v122) {
            int v31 = *v122;
          }
          else {
            int v31 = 0;
          }
          *(_WORD *)v120 = 0;
          if (v29 != 1936288865) {
            BookmarkData::getItemAs((BookmarkData *)v123, 0x2030u, 1, &v120[1]);
          }
          if (v31 != 1936288865) {
            BookmarkData::getItemAs((BookmarkData *)v121, 0x2030u, 1, v120);
          }
          BOOL v33 = v120[1] && v120[0];
          BOOL v109 = v33;
          CFTypeID v34 = CFNumberGetTypeID();
          uint64_t v35 = BookmarkData::copyItem((BookmarkData *)v123, 0xC001u, 1u, v34);
          CFTypeID v36 = CFNumberGetTypeID();
          uint64_t v37 = BookmarkData::copyItem((BookmarkData *)v121, 0xC001u, 1u, v36);
          CFTypeRef cfa = v35;
          CFTypeRef v110 = v37;
          if (v35) {
            BOOL v38 = v37 == 0LL;
          }
          else {
            BOOL v38 = 1;
          }
          int v39 = !v38;
          unsigned int v40 = (const __CFString *)*MEMORY[0x189605678];
          CFTypeID v41 = CFStringGetTypeID();
          uint64_t v42 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v40, v41);
          CFTypeID v43 = CFStringGetTypeID();
          int v44 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v40, v43);
          int v45 = (const __CFString *)*MEMORY[0x189605520];
          CFTypeID v46 = CFDateGetTypeID();
          CFNumberRef cf1 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v45, v46);
          CFTypeID v47 = CFDateGetTypeID();
          CFNumberRef cf2 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v45, v47);
          CFTypeID v48 = CFURLGetTypeID();
          CFTypeRef v118 = BookmarkData::copyItem((BookmarkData *)v123, 0x2050u, 1u, v48);
          CFTypeID v49 = CFURLGetTypeID();
          CFTypeRef v114 = BookmarkData::copyItem((BookmarkData *)v121, 0x2050u, 1u, v49);
          unint64_t v50 = (const __CFString *)*MEMORY[0x189605290];
          CFTypeID v51 = CFStringGetTypeID();
          theString1 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v50, v51);
          CFTypeID v52 = CFStringGetTypeID();
          CFRange v116 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v50, v52);
          BOOL v53 = 0;
          CFStringRef theString2 = v44;
          if (v42 && v44) {
            BOOL v53 = CFStringCompare(v42, v44, 1uLL) == kCFCompareEqualTo;
          }
          __int128 v108 = v42;
          BOOL v54 = 0;
          if (cf1)
          {
            uint64_t v55 = v114;
            if (cf2)
            {
              if (v29 == 1936288865)
              {
                double v56 = floor(MEMORY[0x186E19B18](cf1));
                BOOL v54 = v56 == floor(MEMORY[0x186E19B18](cf2));
              }

              else
              {
                BOOL v54 = CFEqual(cf1, cf2) != 0;
              }
            }
          }

          else
          {
            uint64_t v55 = v114;
          }

          BOOL v57 = 0;
          if (v118 && v55) {
            BOOL v57 = CFEqual(v118, v55) != 0;
          }
          BOOL v58 = 0;
          if (theString1 && v116) {
            BOOL v58 = CFStringCompare(theString1, v116, 1uLL) == kCFCompareEqualTo;
          }
          if ((v109 | v39) == 1)
          {
            if (v58 || v53 || v54 || v57) {
              uint64_t v8 = 0x8000LL;
            }
            else {
              uint64_t v8 = 0x4000LL;
            }
          }

          else if (!v23 {
                 || ((v79 = v53 || v54 || v57, (v79 & v58) == 0) ? (uint64_t v8 = 0x4000LL) : (uint64_t v8 = 0x8000LL), (v79 | v58) != 1))
          }
          {
            uint64_t v8 = 4096LL;
            unsigned __int8 v80 = cfa;
LABEL_138:
            v96 = v110;
            CFStringRef v97 = theString2;
            CFTypeID v98 = v108;
            CFNumberRef v99 = cf1;
            v100 = v118;
            CFNumberRef v101 = cf2;
LABEL_153:
            if (v116) {
              CFRelease(v116);
            }
            if (theString1) {
              CFRelease(theString1);
            }
            if (v114) {
              CFRelease(v114);
            }
            if (v100) {
              CFRelease(v100);
            }
            if (v101) {
              CFRelease(v101);
            }
            if (v99) {
              CFRelease(v99);
            }
            if (v97) {
              CFRelease(v97);
            }
            if (v98) {
              CFRelease(v98);
            }
            if (v96) {
              CFRelease(v96);
            }
            if (v80) {
              CFRelease(v80);
            }
LABEL_40:
            if (!v27) {
              goto LABEL_46;
            }
LABEL_45:
            CFRelease(v27);
            goto LABEL_46;
          }

          unsigned int valuePtr = 0;
          if (v39)
          {
            if (CFEqual(cfa, v110))
            {
              CFRetain(cfa);
              int Value = CFNumberGetValue((CFNumberRef)cfa, kCFNumberSInt32Type, &valuePtr);
              CFRelease(cfa);
              if (Value)
              {
                if (!valuePtr)
                {
                  BOOL v72 = 1;
                  goto LABEL_126;
                }

                CFNumberRef v60 = copyPathComponentsAsArray((BookmarkData *)v123, 1, 0);
                CFNumberRef v61 = v60;
                if (v60) {
                  LODWORD(v60) = CFArrayGetCount(v60);
                }
                v62.CFIndex length = valuePtr;
                if (v60 >= valuePtr)
                {
                  v62.CFIndex location = v60 - valuePtr;
                  CFIndex v102 = copyOfArray(v10, v61, v62);
                  v63 = CFStringCreateByCombiningStrings(v10, v102, @"/");
                  if (v102) {
                    CFRelease(v102);
                  }
                }

                else
                {
                  v63 = 0LL;
                }

                CFArrayRef v103 = copyPathComponentsAsArray((BookmarkData *)v121, 1, 0);
                uint64_t v64 = v103;
                if (v61 && v61 != v103) {
                  CFRelease(v61);
                }
                if (v64) {
                  unsigned int Count = CFArrayGetCount(v64);
                }
                else {
                  unsigned int Count = 0;
                }
                v105.CFIndex length = valuePtr;
                if (Count >= valuePtr)
                {
                  v105.CFIndex location = Count - valuePtr;
                  unsigned int v106 = copyOfArray(v10, v64, v105);
                  v107 = CFStringCreateByCombiningStrings(v10, v106, @"/");
                  if (v106) {
                    CFRelease(v106);
                  }
                  if (v63)
                  {
                    if (v107)
                    {
                      BOOL v72 = CFStringCompare(v63, v107, 1uLL) == kCFCompareEqualTo;
                      CFRelease(v107);
                    }

                    else
                    {
                      BOOL v72 = 0;
                    }
                  }

                  else
                  {
                    BOOL v72 = 0;
                    v63 = v107;
                    if (!v107)
                    {
LABEL_124:
                      if (v64) {
                        CFRelease(v64);
                      }
LABEL_126:
                      CFRange v82 = (const __CFString *)*MEMORY[0x189604C10];
                      CFTypeID v83 = CFNumberGetTypeID();
                      CFNumberRef v84 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v82, v83);
                      CFTypeID v85 = CFNumberGetTypeID();
                      CFNumberRef v86 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v82, v85);
                      CFNumberRef v87 = v86;
                      BOOL v88 = 0;
                      if (v84 && v86) {
                        BOOL v88 = CFEqual(v84, v86) != 0;
                      }
                      v89 = (const __CFString *)*MEMORY[0x1896052B8];
                      CFTypeID v90 = CFNumberGetTypeID();
                      CFNumberRef v91 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v89, v90);
                      CFTypeID v92 = CFNumberGetTypeID();
                      CFNumberRef v93 = BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v89, v92);
                      CFNumberRef v94 = v93;
                      BOOL v95 = 0;
                      if (v91)
                      {
                        unsigned __int8 v80 = cfa;
                        if (v93) {
                          BOOL v95 = CFEqual(v91, v93) != 0;
                        }
                      }

                      else
                      {
                        unsigned __int8 v80 = cfa;
                      }

                      if (v72)
                      {
                        if (!v84 && !v87 && !v91 && !v94) {
                          goto LABEL_138;
                        }
                        if (!v88) {
                          uint64_t v8 = 0x4000LL;
                        }
                      }

                      else if (v88 || v95)
                      {
                        uint64_t v8 = 0x4000LL;
                      }

                      else
                      {
                        uint64_t v8 = 0x2000LL;
                      }

                      if (v94) {
                        CFRelease(v94);
                      }
                      if (v91) {
                        CFRelease(v91);
                      }
                      CFTypeID v98 = v108;
                      CFNumberRef v101 = cf2;
                      v100 = v118;
                      if (v87) {
                        CFRelease(v87);
                      }
                      v96 = v110;
                      if (v84) {
                        CFRelease(v84);
                      }
                      CFStringRef v97 = theString2;
                      CFNumberRef v99 = cf1;
                      goto LABEL_153;
                    }
                  }
                }

                else
                {
                  BOOL v72 = 0;
                  if (!v63) {
                    goto LABEL_124;
                  }
                }

                uint64_t v81 = v63;
LABEL_123:
                CFRelease(v81);
                goto LABEL_124;
              }
            }
          }

          uint64_t v64 = copyVolumePathComponentsAsArray((BookmarkData *)v123, 1u);
          CFIndex v65 = (const __CFString *)*MEMORY[0x189605288];
          CFTypeID v66 = CFStringGetTypeID();
          uint64_t v67 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v65, v66);
          CFIndex v68 = copyVolumePathComponentsAsArray((BookmarkData *)v121, 1u);
          CFTypeID v69 = CFStringGetTypeID();
          v70 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v65, v69);
          CFIndex v71 = v70;
          if (v67)
          {
            if (v70)
            {
              BOOL v72 = 1;
              if (CFStringCompare(v67, v70, 1uLL) == kCFCompareEqualTo) {
                goto LABEL_118;
              }
            }
          }

          CFURLRef v73 = (const __CFString *)*MEMORY[0x189605278];
          CFTypeID v74 = CFStringGetTypeID();
          CFURLRef v75 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v123, v73, v74);
          CFTypeID v76 = CFStringGetTypeID();
          CFIndex v77 = (const __CFString *)BookmarkCopyPropertyFromBookmarkData((BookmarkData *)v121, v73, v76);
          v78 = v77;
          if (v75)
          {
            if (v77)
            {
              BOOL v72 = CFStringCompare(v75, v77, 1uLL) == kCFCompareEqualTo;
              CFRelease(v78);
            }

            else
            {
              BOOL v72 = 0;
            }

            v78 = v75;
          }

          else
          {
            BOOL v72 = 0;
            if (!v77)
            {
LABEL_117:
              if (!v71)
              {
LABEL_119:
                if (v68) {
                  CFRelease(v68);
                }
                if (!v67) {
                  goto LABEL_124;
                }
                uint64_t v81 = v67;
                goto LABEL_123;
              }

LABEL_118:
              CFRelease(v71);
              goto LABEL_119;
            }
          }

          CFRelease(v78);
          goto LABEL_117;
        }

        uint64_t v8 = 61440LL;
      }

      else
      {
        uint64_t v8 = 0LL;
      }

LABEL_51:
      BookmarkData::~BookmarkData((BookmarkData *)v121);
      BookmarkData::~BookmarkData((BookmarkData *)v123);
      return v8;
    }

    return 0LL;
  }

  return v8;
}

      *(_DWORD *)(v9 + 40) = v26;
      goto LABEL_35;
    }

BOOL compareBookmarkProperties(BookmarkData *a1, BookmarkData *a2, const __CFString *cf2)
{
  CFNumberRef v5 = BookmarkCopyPropertyFromBookmarkData(a1, cf2, 0LL);
  CFNumberRef v6 = BookmarkCopyPropertyFromBookmarkData(a2, cf2, 0LL);
  CFNumberRef v7 = v6;
  if (v5)
  {
    if (v6)
    {
      BOOL v8 = CFEqual(v5, v6) != 0;
      CFRelease(v7);
    }

    else
    {
      BOOL v8 = 1LL;
    }

    CFNumberRef v7 = v5;
  }

  else
  {
    BOOL v8 = 1LL;
    if (!v6) {
      return v8;
    }
  }

  CFRelease(v7);
  return v8;
}

double ___ZL43BookmarkResourcePropertyKeyToInfoStructInitv_block_invoke()
{
  uint64_t v39 = *MEMORY[0x1896053B8];
  uint64_t v38 = *MEMORY[0x189605378];
  uint64_t v37 = *MEMORY[0x1896053C8];
  uint64_t v36 = *MEMORY[0x1896053E8];
  uint64_t v35 = *MEMORY[0x1896053A0];
  uint64_t v34 = *MEMORY[0x1896053D0];
  uint64_t v33 = *MEMORY[0x1896053E0];
  uint64_t v32 = *MEMORY[0x189605390];
  uint64_t v31 = *MEMORY[0x189605360];
  uint64_t v67 = *MEMORY[0x189605370];
  uint64_t v30 = *MEMORY[0x189605560];
  uint64_t v29 = *MEMORY[0x189605530];
  uint64_t v28 = *MEMORY[0x189605568];
  uint64_t v27 = *MEMORY[0x189605540];
  uint64_t v26 = *MEMORY[0x189605570];
  uint64_t v25 = *MEMORY[0x189605550];
  uint64_t v24 = *MEMORY[0x189604D58];
  uint64_t v23 = *MEMORY[0x189604D80];
  uint64_t v22 = *MEMORY[0x189605618];
  uint64_t v21 = *MEMORY[0x189605640];
  uint64_t v20 = *MEMORY[0x189605600];
  uint64_t v19 = *MEMORY[0x189605610];
  uint64_t v18 = *MEMORY[0x189605558];
  uint64_t v17 = *MEMORY[0x189605630];
  uint64_t v16 = *MEMORY[0x189605650];
  uint64_t v15 = *MEMORY[0x1896055D0];
  uint64_t v14 = *MEMORY[0x1896055C8];
  uint64_t v13 = *MEMORY[0x189605438];
  uint64_t v12 = *MEMORY[0x189604C10];
  sResourcePropertiesInfounsigned int Count = 1;
  sResourcePropertiesInfoCountIncludedInAll = 1;
  uint64_t v0 = *MEMORY[0x189605418];
  uint64_t v1 = *MEMORY[0x189604BE8];
  uint64_t v2 = *MEMORY[0x189604BF0];
  uint64_t v3 = *MEMORY[0x1896052B0];
  uint64_t v4 = *MEMORY[0x1896052A0];
  uint64_t v5 = *MEMORY[0x1896052A8];
  uint64_t v6 = *MEMORY[0x189605268];
  uint64_t v7 = *MEMORY[0x189605408];
  uint64_t v8 = *MEMORY[0x189605478];
  uint64_t v9 = *MEMORY[0x189605420];
  uint64_t v40 = *MEMORY[0x189605400];
  uint64_t v41 = *MEMORY[0x189605410];
  uint64_t v42 = *MEMORY[0x189604D18];
  uint64_t v43 = *MEMORY[0x189605340];
  uint64_t v44 = *MEMORY[0x1896052C0];
  uint64_t v45 = *MEMORY[0x189604BB8];
  uint64_t v46 = *MEMORY[0x1896053B0];
  uint64_t v47 = *MEMORY[0x1896053F0];
  uint64_t v48 = *MEMORY[0x189605388];
  uint64_t v49 = *MEMORY[0x189604C18];
  uint64_t v50 = *MEMORY[0x189604C00];
  uint64_t v51 = *MEMORY[0x189604BB0];
  uint64_t v52 = *MEMORY[0x189604D28];
  uint64_t v53 = *MEMORY[0x189604D08];
  uint64_t v54 = *MEMORY[0x189605278];
  uint64_t v55 = *MEMORY[0x189605288];
  uint64_t v56 = *MEMORY[0x189605280];
  uint64_t v57 = *MEMORY[0x189605290];
  uint64_t v58 = *MEMORY[0x1896055A0];
  uint64_t v59 = *MEMORY[0x189605448];
  uint64_t v60 = *MEMORY[0x189605538];
  uint64_t v61 = *MEMORY[0x189605678];
  uint64_t v62 = *MEMORY[0x189605670];
  uint64_t v63 = *MEMORY[0x189604BA8];
  uint64_t v64 = *MEMORY[0x189605658];
  uint64_t v65 = *MEMORY[0x189605520];
  uint64_t v66 = *MEMORY[0x189605270];
  uint64_t v10 = malloc(0x8C0uLL);
  *uint64_t v10 = v39;
  v10[4] = v38;
  v10[8] = v37;
  v10[12] = v36;
  v10[16] = v35;
  v10[20] = v34;
  v10[24] = v33;
  v10[28] = v32;
  v10[32] = v31;
  v10[40] = v30;
  v10[44] = v29;
  v10[48] = v28;
  v10[52] = v27;
  v10[56] = v26;
  v10[60] = v25;
  v10[64] = v24;
  v10[68] = v23;
  v10[72] = v22;
  v10[76] = v21;
  v10[80] = v20;
  v10[84] = v19;
  v10[88] = v18;
  v10[92] = v17;
  v10[96] = v16;
  v10[100] = v15;
  v10[104] = v14;
  v10[108] = v13;
  v10[112] = v12;
  v10[116] = v0;
  v10[120] = v1;
  v10[124] = v2;
  v10[128] = v3;
  v10[132] = v4;
  v10[136] = v5;
  v10[140] = v6;
  v10[144] = v7;
  v10[148] = v8;
  v10[152] = v9;
  sResourcePropertiesInfoPtr = (uint64_t)v10;
  v10[19] = 16LL;
  v10[35] = 256LL;
  *((_DWORD *)v10 + 2) = 4112;
  *((_DWORD *)v10 + 10) = 4112;
  *((_DWORD *)v10 + 18) = 4112;
  *((_DWORD *)v10 + 26) = 4112;
  *((_DWORD *)v10 + 34) = 4112;
  *((_DWORD *)v10 + 42) = 4112;
  *((_DWORD *)v10 + 50) = 4112;
  *((_DWORD *)v10 + 58) = 4112;
  *((_DWORD *)v10 + 66) = 4112;
  *((_DWORD *)v10 + 74) = 4112;
  v10[7] = 2LL;
  v10[47] = 2LL;
  v10[15] = 8LL;
  v10[51] = 8LL;
  v10[23] = 32LL;
  v10[55] = 32LL;
  v10[27] = 64LL;
  v10[59] = 64LL;
  v10[31] = 128LL;
  v10[63] = 128LL;
  v10[39] = 512LL;
  v10[67] = 512LL;
  v10[71] = 4096LL;
  v10[75] = 0x100000000LL;
  v10[79] = 0x1000000000LL;
  v10[83] = 0x2000000000000LL;
  v10[87] = 0x10000000000LL;
  v10[91] = 0x20000000000000LL;
  v10[95] = 0x40000000000000LL;
  v10[99] = 0x80000000000000LL;
  v10[103] = 0x80000000000LL;
  *((_DWORD *)v10 + 82) = 8224;
  *((_DWORD *)v10 + 90) = 8224;
  *((_DWORD *)v10 + 98) = 8224;
  *((_DWORD *)v10 + 106) = 8224;
  *((_DWORD *)v10 + 114) = 8224;
  *((_DWORD *)v10 + 122) = 8224;
  *((_DWORD *)v10 + 130) = 8224;
  *((_DWORD *)v10 + 138) = 8224;
  *((_DWORD *)v10 + 146) = 8224;
  *((_DWORD *)v10 + 154) = 8224;
  *((_DWORD *)v10 + 162) = 8224;
  *((_DWORD *)v10 + 170) = 8224;
  *((_DWORD *)v10 + 178) = 8224;
  *((_DWORD *)v10 + 186) = 8224;
  *((_DWORD *)v10 + 194) = 8224;
  *((_DWORD *)v10 + 202) = 8224;
  *((_DWORD *)v10 + 210) = 8224;
  v10[46] = extractVPFlags;
  v10[50] = extractVPFlags;
  v10[54] = extractVPFlags;
  v10[58] = extractVPFlags;
  v10[62] = extractVPFlags;
  v10[42] = extractVPFlags;
  v10[66] = extractVPFlags;
  v10[70] = extractVPFlags;
  v10[74] = extractVPFlags;
  v10[78] = extractVPFlags;
  v10[82] = extractVPFlags;
  v10[86] = extractVPFlags;
  v10[90] = extractVPFlags;
  v10[94] = extractVPFlags;
  v10[98] = extractVPFlags;
  v10[102] = extractVPFlags;
  v10[106] = extractVPFlags;
  v10[107] = 0x100000000000LL;
  *((_DWORD *)v10 + 218) = 4128;
  v10[110] = extractNameKey;
  *((_DWORD *)v10 + 226) = 4144;
  v10[114] = extractFileIDKey;
  *((_DWORD *)v10 + 234) = 61463;
  *((_DWORD *)v10 + 242) = 61473;
  *((_DWORD *)v10 + 250) = 61472;
  *((_DWORD *)v10 + 258) = 4160;
  *((_DWORD *)v10 + 266) = 4161;
  *((_DWORD *)v10 + 274) = 4162;
  *((_DWORD *)v10 + 282) = 4163;
  *((_DWORD *)v10 + 298) = 983044;
  *((_DWORD *)v10 + 306) = 983045;
  v10[156] = v40;
  *((_DWORD *)v10 + 314) = 983046;
  v10[6] = extractRPFlags;
  v10[14] = extractRPFlags;
  v10[18] = extractRPFlags;
  v10[22] = extractRPFlags;
  v10[26] = extractRPFlags;
  v10[30] = extractRPFlags;
  v10[34] = extractRPFlags;
  v10[38] = extractRPFlags;
  v10[10] = extractRPFlags;
  v10[11] = 4LL;
  v10[2] = extractRPFlags;
  v10[3] = 1LL;
  v10[36] = v67;
  v10[43] = 1LL;
  v10[111] = 0LL;
  v10[115] = 0LL;
  double result = 0.0;
  *((_OWORD *)v10 + 59) = 0u;
  *((_OWORD *)v10 + 61) = 0u;
  *((_OWORD *)v10 + 63) = 0u;
  *((_OWORD *)v10 + 65) = 0u;
  *((_OWORD *)v10 + 67) = 0u;
  *((_OWORD *)v10 + 69) = 0u;
  *((_OWORD *)v10 + 71) = 0u;
  *((_DWORD *)v10 + 290) = 983041;
  *((_OWORD *)v10 + 73) = 0u;
  *((_OWORD *)v10 + 75) = 0u;
  *((_OWORD *)v10 + 77) = 0u;
  *((_OWORD *)v10 + 79) = 0u;
  v10[160] = v41;
  *((_DWORD *)v10 + 322) = 983048;
  *((_OWORD *)v10 + 81) = 0u;
  v10[164] = v42;
  *((_DWORD *)v10 + 330) = 61474;
  *((_OWORD *)v10 + 83) = 0u;
  v10[168] = v43;
  *((_DWORD *)v10 + 338) = 983049;
  *((_OWORD *)v10 + 85) = 0u;
  v10[172] = v44;
  *((_DWORD *)v10 + 346) = 61450;
  *((_OWORD *)v10 + 87) = 0u;
  v10[176] = v67;
  *((_DWORD *)v10 + 354) = 983051;
  *((_OWORD *)v10 + 89) = 0u;
  v10[180] = v45;
  *((_DWORD *)v10 + 362) = 983052;
  *((_OWORD *)v10 + 91) = 0u;
  v10[184] = v46;
  *((_DWORD *)v10 + 370) = 983053;
  *((_OWORD *)v10 + 93) = 0u;
  v10[188] = v47;
  *((_DWORD *)v10 + 378) = 983054;
  *((_OWORD *)v10 + 95) = 0u;
  v10[192] = v48;
  *((_DWORD *)v10 + 386) = 983055;
  *((_OWORD *)v10 + 97) = 0u;
  v10[196] = v49;
  *((_DWORD *)v10 + 394) = 983057;
  *((_OWORD *)v10 + 99) = 0u;
  v10[200] = v50;
  *((_DWORD *)v10 + 402) = 983058;
  *((_OWORD *)v10 + 101) = 0u;
  v10[204] = v51;
  *((_DWORD *)v10 + 410) = 983059;
  *((_OWORD *)v10 + 103) = 0u;
  v10[208] = v52;
  *((_DWORD *)v10 + 418) = 251658516;
  *((_OWORD *)v10 + 105) = 0u;
  v10[212] = v53;
  *((_DWORD *)v10 + 426) = 983061;
  *((_OWORD *)v10 + 107) = 0u;
  v10[216] = v54;
  *((_DWORD *)v10 + 434) = 65280;
  v10[218] = returnPathComponentsAsString;
  v10[219] = 0LL;
  v10[220] = v55;
  *((_DWORD *)v10 + 442) = 65281;
  v10[222] = returnRelativePathComponentsAsStringForVolume;
  v10[223] = 1LL;
  v10[224] = v56;
  *((_DWORD *)v10 + 450) = 65283;
  v10[226] = returnPathComponentsArray;
  v10[227] = 0LL;
  v10[228] = v57;
  *((_DWORD *)v10 + 458) = 65282;
  v10[230] = returnVolumeNameAsString;
  v10[231] = 0LL;
  v10[232] = v58;
  *((_DWORD *)v10 + 466) = 0;
  v10[234] = returnVolumeNameAsString;
  v10[235] = 0LL;
  v10[236] = v59;
  *((_DWORD *)v10 + 474) = 0;
  v10[238] = returnPathComponentsAsString;
  v10[239] = 0LL;
  v10[240] = v60;
  *((_DWORD *)v10 + 482) = 0;
  v10[242] = extractVPFlagsAndNegate;
  v10[243] = 4LL;
  v10[244] = v61;
  *((_DWORD *)v10 + 490) = 8209;
  *((_OWORD *)v10 + 123) = 0u;
  v10[248] = v62;
  *((_DWORD *)v10 + 498) = 0;
  v10[250] = returnVolumeURL;
  v10[251] = 0LL;
  v10[252] = v63;
  *((_DWORD *)v10 + 506) = 0;
  v10[254] = returnURLString;
  v10[255] = 0LL;
  v10[256] = v64;
  *((_DWORD *)v10 + 514) = 8210;
  *((_OWORD *)v10 + 129) = 0u;
  v10[260] = v65;
  *((_DWORD *)v10 + 522) = 8211;
  *((_OWORD *)v10 + 131) = 0u;
  v10[264] = v66;
  *((_DWORD *)v10 + 530) = 8304;
  *((_OWORD *)v10 + 133) = 0u;
  v10[268] = @"NSURLBookmarkAllPropertiesKey";
  *((_DWORD *)v10 + 538) = 0;
  v10[270] = returnAllPropertiesInBookmark;
  v10[271] = 0LL;
  v10[272] = @"NSURLBookmarkAllPropertyKeysKey";
  *((_DWORD *)v10 + 546) = 0;
  v10[274] = returnAllPropertyKeysInBookmark;
  v10[275] = 0LL;
  v10[276] = @"NSURLBookmarkDetailedDescription";
  *((_DWORD *)v10 + 554) = 0;
  v10[278] = returnDetailedDump;
  v10[279] = 0LL;
  return result;
}

CFTypeRef extractRPFlags(BookmarkData *a1, int a2, uint64_t a3)
{
  uint64_t v4 = (CFTypeRef *)MEMORY[0x189604DE0];
  if ((v7[0] & a3) != 0) {
    uint64_t v4 = (CFTypeRef *)MEMORY[0x189604DE8];
  }
  CFTypeRef v5 = *v4;
  CFRetain(*v4);
  return v5;
}

CFTypeRef extractVPFlags(BookmarkData *a1, int a2, uint64_t a3)
{
  uint64_t v4 = (CFTypeRef *)MEMORY[0x189604DE0];
  if ((v7[0] & a3) != 0) {
    uint64_t v4 = (CFTypeRef *)MEMORY[0x189604DE8];
  }
  CFTypeRef v5 = *v4;
  CFRetain(*v4);
  return v5;
}

CFNumberRef extractNameKey(BookmarkData *a1, unsigned int a2)
{
  CFTypeID TypeID = CFStringGetTypeID();
  CFNumberRef result = (CFNumberRef)BookmarkData::copyItem(a1, 0x1020u, a2, TypeID);
  if (!result)
  {
    unsigned int v6 = countPathComponents(a1, a2);
    if (v6) {
      return copyIndexedPathComponent(a1, a2, v6 - 1);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

const void *extractFileIDKey(BookmarkData *a1, unsigned int a2)
{
  CFTypeID TypeID = CFNumberGetTypeID();
  CFTypeRef v5 = BookmarkData::copyItem(a1, 0x1030u, 1u, TypeID);
  if (!v5)
  {
    CFTypeID v6 = CFArrayGetTypeID();
    uint64_t v7 = (const __CFArray *)BookmarkData::copyItem(a1, 0x1005u, a2, v6);
    if (v7)
    {
      uint64_t v8 = v7;
      CFIndex Count = CFArrayGetCount(v7);
      if (Count >= 1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v8, Count - 1);
        CFTypeRef v5 = ValueAtIndex;
        if (!ValueAtIndex)
        {
LABEL_9:
          CFRelease(v8);
          return v5;
        }

        if (CFGetTypeID(ValueAtIndex) == TypeID)
        {
          CFRetain(v5);
          goto LABEL_9;
        }
      }

      CFTypeRef v5 = 0LL;
      goto LABEL_9;
    }

    return 0LL;
  }

  return v5;
}

CFStringRef returnPathComponentsAsString(BookmarkData *a1, int a2, unint64_t a3)
{
  if (HIDWORD(a3)) {
    return 0LL;
  }
  uint64_t v3 = copyPathComponentsAsString(a1, a2, a3, 1);
  uint64_t v4 = v3;
  if (v3)
  {
    CFIndex Length = CFStringGetLength(v3);
    if (Length >= 2)
    {
      CFIndex v6 = Length - 1;
      if (CFStringGetCharacterAtIndex(v4, Length - 1) == 47)
      {
        v9.CFIndex location = 0LL;
        v9.CFIndex length = v6;
        CFStringRef v7 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x189604DB0], v4, v9);
        CFRelease(v4);
        return v7;
      }
    }
  }

  return v4;
}

CFStringRef returnRelativePathComponentsAsStringForVolume(BookmarkData *a1, int a2, uint64_t a3)
{
  if (a3)
  {
    CFTypeID TypeID = CFArrayGetTypeID();
    CFStringRef v7 = (const __CFArray *)BookmarkData::copyItem(a1, 0x2000u, 1u, TypeID);
    if (v7)
    {
      uint64_t v8 = v7;
      if (CFArrayGetCount(v7) < 1)
      {
        uint64_t v12 = copyPathComponentsAsString(a1, a2, 0, 0);
        goto LABEL_14;
      }

      CFRange v9 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      uint64_t valuePtr = a3;
      CFNumberRef v10 = CFNumberCreate(v9, kCFNumberSInt64Type, &valuePtr);
      v19.CFIndex length = CFArrayGetCount(v8);
      v19.CFIndex location = 0LL;
      LastIndexOfint Value = CFArrayGetLastIndexOfValue(v8, v19, v10);
      if (LastIndexOfValue == -1)
      {
        uint64_t v12 = 0LL;
        if (!v10) {
          goto LABEL_14;
        }
      }

      else
      {
        uint64_t v12 = copyPathComponentsAsString(a1, a2, LastIndexOfValue, 0);
        if (!v10)
        {
LABEL_14:
          CFRelease(v8);
          if (!v12) {
            return v12;
          }
          goto LABEL_15;
        }
      }

      CFRelease(v10);
      goto LABEL_14;
    }

    uint64_t v13 = copyPathComponentsAsString(a1, a2, 0, 0);
  }

  else
  {
    uint64_t v13 = returnPathComponentsAsString(a1, a2, 0LL);
  }

  uint64_t v12 = v13;
  if (!v13) {
    return v12;
  }
LABEL_15:
  CFIndex Length = CFStringGetLength(v12);
  if (Length >= 2)
  {
    CFIndex v15 = Length - 1;
    if (CFStringGetCharacterAtIndex(v12, Length - 1) == 47)
    {
      v20.CFIndex location = 0LL;
      v20.CFIndex length = v15;
      CFStringRef v16 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x189604DB0], v12, v20);
      CFRelease(v12);
      return v16;
    }
  }

  return v12;
}

CFArrayRef returnPathComponentsArray(BookmarkData *a1, int a2)
{
  return copyPathComponentsAsArray(a1, a2, 0);
}

const void *returnVolumeNameAsString(BookmarkData *a1, unsigned int a2)
{
  CFTypeID TypeID = CFStringGetTypeID();
  return BookmarkData::copyItem(a1, 0x2010u, a2, TypeID);
}

CFTypeRef extractVPFlagsAndNegate(BookmarkData *a1, int a2, uint64_t a3)
{
  uint64_t v4 = (CFTypeRef *)MEMORY[0x189604DE8];
  if ((v7[0] & a3) != 0) {
    uint64_t v4 = (CFTypeRef *)MEMORY[0x189604DE0];
  }
  CFTypeRef v5 = *v4;
  CFRetain(*v4);
  return v5;
}

CFURLRef returnVolumeURL(BookmarkData *a1, unsigned int a2)
{
  BOOL v9 = 0;
  if (!BookmarkData::getItemAs(a1, 0x2030u, a2, &v9)
    || !v9
    || (CFURLRef v4 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x189604DB0], @"/", kCFURLPOSIXPathStyle, 1u)) == 0LL)
  {
    CFTypeID TypeID = CFStringGetTypeID();
    CFIndex v6 = (const __CFString *)BookmarkData::copyItem(a1, 0x2002u, a2, TypeID);
    if (v6)
    {
      CFStringRef v7 = v6;
      CFURLRef v4 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x189604DB0], v6, kCFURLPOSIXPathStyle, 1u);
      CFRelease(v7);
    }

    else
    {
      return 0LL;
    }
  }

  return v4;
}

void *returnURLString(BookmarkData *a1, unsigned int a2)
{
  CFTypeID TypeID = CFStringGetTypeID();
  CFTypeRef v5 = (void *)BookmarkData::copyItem(a1, 0x1003u, a2, TypeID);
  if (!v5)
  {
    CFIndex v6 = returnPathComponentsAsString(a1, a2, 0LL);
    if (v6)
    {
      CFStringRef v7 = v6;
      uint64_t v8 = (const __CFString *)*MEMORY[0x189605378];
      CFTypeID v9 = CFBooleanGetTypeID();
      CFNumberRef v10 = BookmarkCopyPropertyFromBookmarkData(a1, v8, v9);
      CFTypeID v11 = v10;
      if (v10) {
        Boolean Value = CFBooleanGetValue(v10);
      }
      else {
        Boolean Value = 0;
      }
      uint64_t v13 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x189604DB0], v7, kCFURLPOSIXPathStyle, Value);
      if (v13)
      {
        uint64_t v14 = v13;
        CFStringRef v15 = CFURLGetString(v13);
        CFTypeRef v5 = (void *)v15;
        if (v15) {
          CFRetain(v15);
        }
        CFRelease(v14);
        if (!v11) {
          goto LABEL_12;
        }
      }

      else
      {
        CFTypeRef v5 = 0LL;
        if (!v11) {
          goto LABEL_12;
        }
      }

      CFRelease(v11);
LABEL_12:
      CFRelease(v7);
      return v5;
    }

    return 0LL;
  }

  return v5;
}

CFArrayRef returnAllPropertyKeysInBookmark(BookmarkData *a1, uint64_t a2)
{
  v12[1] = *MEMORY[0x1895F89C0];
  uint64_t v3 = copyAllPropertiesInBookmark(a1, a2);
  if (!v3) {
    return 0LL;
  }
  CFURLRef v4 = v3;
  if (CFDictionaryGetCount(v3) < 1)
  {
    CFArrayRef v10 = 0LL;
  }

  else
  {
    CFIndex Count = CFDictionaryGetCount(v4);
    MEMORY[0x1895F8858](Count);
    CFStringRef v7 = (const void **)((char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    CFDictionaryGetKeysAndValues(v4, v7, 0LL);
    uint64_t v8 = *(const __CFAllocator **)a1;
    CFIndex v9 = CFDictionaryGetCount(v4);
    CFArrayRef v10 = CFArrayCreate(v8, v7, v9, MEMORY[0x189605228]);
  }

  CFRelease(v4);
  return v10;
}

__CFString *returnDetailedDump(const void **a1)
{
  return _CFURLBookmarkDataCopyDescription(a1[1]);
}

__CFDictionary *copyAllPropertiesInBookmark(BookmarkData *a1, uint64_t a2)
{
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  Indexeduint64_t ItemInTOC = BookmarkData::getIndexedItemInTOC(a1, 0, 1);
  if (IndexedItemInTOC)
  {
    uint64_t v6 = IndexedItemInTOC;
    unsigned int v7 = 1;
    while ((*v6 & 0x80000000) == 0)
    {
LABEL_16:
      uint64_t v6 = BookmarkData::getIndexedItemInTOC(a1, v7++, 1);
      if (!v6) {
        goto LABEL_17;
      }
    }

    DataItemAtOffset = BookmarkData::getDataItemAtOffset(a1, *v6 & 0x7FFFFFFF);
    CFNumberRef v9 = BookmarkData::copyItem((CFAllocatorRef *)a1, DataItemAtOffset, 0LL);
    CFNumberRef v10 = BookmarkData::copyItem(a1, (uint64_t)v6, 0LL);
    CFNumberRef v11 = v10;
    if (!Mutable || (v9 ? (BOOL v12 = v10 == 0LL) : (BOOL v12 = 1), v12))
    {
      if (!v10) {
        goto LABEL_14;
      }
    }

    else
    {
      CFDictionaryAddValue(Mutable, v9, v10);
    }

    CFRelease(v11);
LABEL_14:
    if (v9) {
      CFRelease(v9);
    }
    goto LABEL_16;
  }

LABEL_17:
  if (sResourcePropertiesInfoCountIncludedInAll == 1)
  {
    uint64_t v13 = 0LL;
    unint64_t v14 = 0LL;
    while (1)
    {
      CFStringRef v15 = *(const void **)(sResourcePropertiesInfoPtr + v13);
      if (!v15 || CFDictionaryContainsKey(Mutable, v15)) {
        goto LABEL_36;
      }
      uint64_t v16 = sResourcePropertiesInfoPtr + v13;
      uint64_t v17 = *(uint64_t (**)(BookmarkData *, uint64_t, void))(sResourcePropertiesInfoPtr + v13 + 16);
      if (v17) {
        break;
      }
      unsigned int v19 = *(_DWORD *)(v16 + 8);
      if (v19 >> 8 <= 0xFE)
      {
        uint64_t v18 = BookmarkData::copyItem(a1, v19, a2, 0LL);
        goto LABEL_25;
      }

      CFRange v20 = 0LL;
LABEL_26:
      uint64_t v21 = *(const void **)(sResourcePropertiesInfoPtr + v13);
      if (v20) {
        BOOL v22 = Mutable == 0LL;
      }
      else {
        BOOL v22 = 1;
      }
      if (v22 || v21 == 0LL)
      {
        if (!v20) {
          goto LABEL_36;
        }
      }

      else
      {
        CFDictionaryAddValue(Mutable, v21, v20);
      }

      CFRelease(v20);
LABEL_36:
      if (sResourcePropertiesInfoCountIncludedInAll == 1)
      {
        v13 += 32LL;
        BOOL v24 = v14++ >= 0x42;
        if (!v24) {
          continue;
        }
      }

      goto LABEL_41;
    }

    uint64_t v18 = (const void *)v17(a1, a2, *(void *)(v16 + 24));
LABEL_25:
    CFRange v20 = v18;
    goto LABEL_26;
  }

  if ((v10 & 0xFFFDFFFF) != 0)
  {
    BOOL v12 = (const void *)__CFURLResourceInfoPtr();
    uint64_t v13 = _FileCacheGetForURL(a1, v12);
    _FileCacheLock((uint64_t)v13);
    Attributes = (_DWORD *)_FileCacheGetAttributes((uint64_t)v13);
    CFStringRef v15 = Attributes;
    uint64_t v16 = *Attributes;
    if ((*Attributes & 1) != 0
      && ((v10 & 0x18) == 0 || (v16 & 4) != 0)
      && ((v10 & 0x80000) == 0 || (v16 & 8) != 0)
      && ((v10 & 0x41800) == 0 || (v16 & 0x10) != 0)
      && ((v10 & 0x8000) == 0 || (v16 & 0x20) != 0 || (Attributes[4] & 0xF000) == 0x4000)
      && ((v10 & 0x400000) == 0 || (v16 & 0x80) != 0))
    {
      goto LABEL_40;
    }

    _FileCacheLockTransitionToPreparer((uint64_t)v13);
    if ((a2 & 0x40000000) != 0)
    {
      unint64_t v26 = 4294956641LL;
      goto LABEL_202;
    }

    if (_FSURLGetCatalogInfo::sOnce != -1) {
      dispatch_once(&_FSURLGetCatalogInfo::sOnce, &__block_literal_global_8);
    }
    uint64_t v17 = _ZZZ20_FSURLGetCatalogInfoEUb1_E8theTable;
    uint64_t v18 = (int *)(_FSURLGetCatalogInfo::maskToPropertyTable + 24);
    do
    {
      unsigned int v19 = *v18;
      v18 += 6;
    }

    while (v19);
    memset(v75, 0, sizeof(v75));
    CFRange v20 = (_DWORD *)(_FSURLGetCatalogInfo::maskToPropertyTable + 24);
    do
    {
      if ((v17 & v10 & 0xFFFDFFFF) != 0) {
        addPropertyAndDependenciesToBitmap(*((void *)v20 - 1), (uint64_t)v75);
      }
      uint64_t v21 = *v20;
      v20 += 6;
      uint64_t v17 = v21;
    }

    while (v21);
    CFTypeID v74 = 0LL;
    BOOL v22 = prepareValuesForBitmap((uint64_t)a1, (uint64_t)v13, (uint64_t)v75, (uint64_t)&v74);
    _FileCacheLockTransitionFromPreparer((uint64_t)v13);
    if (v22)
    {
LABEL_40:
      if ((v10 & 2) != 0)
      {
        uint64_t v23 = (v15[5] & 0x20002) != 0;
        CFAllocatorRef v9 = v23;
        if ((v15[4] & 0xF000) == 0x4000)
        {
          v23 |= 0x10u;
          CFAllocatorRef v9 = v23;
        }

        if (v15[6] >= 2u)
        {
          v23 |= 0x100u;
          CFAllocatorRef v9 = v23;
        }

        if ((*((_BYTE *)v15 + 1) & 0x40) != 0) {
          CFAllocatorRef v9 = v23 | 0x100;
        }
      }

      if ((v10 & 4) != 0)
      {
        uint64_t v30 = v76;
        if (a3) {
          uint64_t v30 = (_BYTE *)a3;
        }
        *((_WORD *)v30 + 1) = -100;
        if ((v10 & 0x10) == 0)
        {
LABEL_49:
          if ((v10 & 8) == 0) {
            goto LABEL_50;
          }
          goto LABEL_72;
        }
      }

      else if ((v10 & 0x10) == 0)
      {
        goto LABEL_49;
      }

      uint64_t v31 = v76;
      if (a3) {
        uint64_t v31 = (_BYTE *)a3;
      }
      *((_DWORD *)v31 + 2) = *((void *)v15 + 16);
      if ((v10 & 8) == 0)
      {
LABEL_50:
        if ((v10 & 0x20) == 0) {
          goto LABEL_84;
        }
LABEL_78:
        uint64_t v34 = *((double *)v15 + 10);
        if (v34 == -1.0 - *MEMORY[0x189604DA0] || v34 == -*MEMORY[0x189604DA8])
        {
          uint64_t v37 = v76;
          if (a3) {
            uint64_t v37 = (_BYTE *)a3;
          }
          *((void *)v37 + 2) = 0LL;
          if ((v10 & 0x40) == 0) {
            goto LABEL_94;
          }
          goto LABEL_89;
        }

        if (a3) {
          uint64_t v35 = (int *)(a3 + 16);
        }
        else {
          uint64_t v35 = &v77;
        }
        uint64_t v36 = ConvertCFAbsoluteTimeToUTCDateTime((uint64_t)v35, v34);
        if ((_DWORD)v36) {
          goto LABEL_109;
        }
LABEL_84:
        if ((v10 & 0x40) == 0) {
          goto LABEL_94;
        }
LABEL_89:
        uint64_t v38 = *((double *)v15 + 8);
        uint64_t v39 = v76;
        if (a3)
        {
          uint64_t v39 = (_BYTE *)a3;
          uint64_t v40 = (int *)(a3 + 24);
        }

        else
        {
          uint64_t v40 = &v78;
        }

        if (v38 == -*MEMORY[0x189604DA8])
        {
          *((void *)v39 + 3) = 0LL;
          if ((v10 & 0x80) == 0) {
            goto LABEL_103;
          }
          goto LABEL_95;
        }

        uint64_t v36 = ConvertCFAbsoluteTimeToUTCDateTime((uint64_t)v40, v38);
        if ((_DWORD)v36)
        {
LABEL_109:
          unint64_t v26 = v36;
          goto LABEL_202;
        }

      ++a5;
      ++a4;
      ++a3;
      if (!--v6) {
        return v11;
      }
    }
  }

  return 0;
}

  uint64_t v16 = *(_DWORD **)(v10 + 32);
  *(void *)(v10 + 32) = (char *)v16 + *v16;
  ++*(_DWORD *)(v10 + 44);
  *a4 = 0;
  *(void *)(v9 + 56) = v16;
  uint64_t v17 = (_DWORD **)(v9 + 56);
  uint64_t v18 = (void *)(v9 + 32);
  if ((ParseAttributes( v16,  &v31,  (void *)(v9 + 24),  (void *)(v9 + 32),  (_DWORD *)(v9 + 64),  &v30,  &v29,  &v28,  &v27) & 1) == 0)
  {
    *(_DWORD *)(v9 + 48) = 5;
    uint64_t v25 = v31;
    goto LABEL_46;
  }

  unsigned int v19 = v31;
  if (v31)
  {
    *(_DWORD *)(v9 + 48) = 5;
    *(_DWORD *)(v9 + 40) = v19;
    *(_BYTE *)(v9 + 52) &= ~1u;
    goto LABEL_35;
  }

  if (v29 | v27)
  {
    CFRange v20 = *(void *)(a2 + 16);
    if (*(_BYTE *)(v20 + a1 - 1) != 47)
    {
      *(_BYTE *)(a1 + v20++) = 47;
    }

    *(_BYTE *)(a1 + v20) = 0;
    if ((unint64_t)(*v18 + v20) < 0x6FD)
    {
      memcpy((void *)(a1 + v20), *(const void **)(v9 + 24), *v18 + 1LL);
      uint64_t v21 = malloc(*(void *)(a1 + 1824));
      _BYTE *v17 = v21;
      if (v21)
      {
        *(_BYTE *)(v9 + 52) |= 1u;
        if (GetattrlistRetry( (char *)a1,  (_DWORD *)(a1 + 1796),  (void **)(v9 + 56),  *(void *)(a1 + 1824)))
        {
          *(_DWORD *)(v9 + 48) = 5;
          unint64_t v26 = *__error();
        }

        else
        {
          if ((ParseAttributes( *v17,  &v31,  (void *)(v9 + 24),  (void *)(v9 + 32),  (_DWORD *)(v9 + 64),  &v30,  &v29,  &v28,  &v27) & 1) != 0) {
            goto LABEL_29;
          }
          *(_DWORD *)(v9 + 48) = 5;
          unint64_t v26 = v31;
        }
      }

      else
      {
        *(_DWORD *)(v9 + 48) = 5;
        unint64_t v26 = 12;
      }

LABEL_41:
  if (sResourcePropertiesInfoCount == 1)
  {
    uint64_t v25 = 0LL;
    unint64_t v26 = 0LL;
    do
    {
      if (*(_DWORD *)(sResourcePropertiesInfoPtr + v25 + 8) >= 0xF000u)
      {
        if (*(void *)(sResourcePropertiesInfoPtr + v25))
        {
          uint64_t v27 = *(uint64_t (**)(BookmarkData *, uint64_t, void))(sResourcePropertiesInfoPtr + v25 + 16);
          if (v27)
          {
            uint64_t v28 = (const void *)v27(a1, a2, *(void *)(sResourcePropertiesInfoPtr + v25 + 24));
            if (v28)
            {
              uint64_t v29 = v28;
              if (Mutable)
              {
                uint64_t v30 = *(const void **)(sResourcePropertiesInfoPtr + v25);
                if (v30) {
                  CFDictionaryAddValue(Mutable, v30, v28);
                }
              }

              CFRelease(v29);
            }
          }
        }
      }

      if (sResourcePropertiesInfoCount != 1) {
        break;
      }
      v25 += 32LL;
      BOOL v24 = v26++ >= 0x45;
    }

    while (!v24);
  }

  if (!Mutable) {
    return 0LL;
  }
  if (CFDictionaryGetCount(Mutable) < 1)
  {
    uint64_t v31 = 0LL;
  }

  else
  {
    CFRetain(Mutable);
    uint64_t v31 = Mutable;
  }

  CFRelease(Mutable);
  return v31;
}

            if ((v21 & 0xFFDF) != 0x41) {
              return 0LL;
            }
            uint64_t v27 = v20 + 1;
            if (v49)
            {
              uint64_t v28 = v49[v51 + v27];
            }

            else if (v50)
            {
              uint64_t v28 = v50[v51 + v27];
            }

            else
            {
              if (v54 <= v27 || (uint64_t v29 = v53, v53 > v27))
              {
                v30.CFIndex location = v51;
                if (v52 >= 64) {
                  v30.CFIndex length = 64LL;
                }
                else {
                  v30.CFIndex length = v52;
                }
                uint64_t v53 = 0LL;
                uint64_t v54 = v30.length;
                CFStringGetCharacters(theString, v30, buffer);
                uint64_t v29 = v53;
              }

              uint64_t v28 = buffer[v27 - v29];
            }

            if ((v28 & 0xFFDF) != 0x50) {
              return 0LL;
            }
            uint64_t v31 = v20 | 2;
            if (v49)
            {
              uint64_t v32 = v49[v51 + v31];
            }

            else if (v50)
            {
              uint64_t v32 = v50[v51 + v31];
            }

            else
            {
              if (v54 <= v31 || (uint64_t v37 = v53, v53 > v31))
              {
                v38.CFIndex location = v51;
                if (v52 >= 64) {
                  v38.CFIndex length = 64LL;
                }
                else {
                  v38.CFIndex length = v52;
                }
                uint64_t v53 = 0LL;
                uint64_t v54 = v38.length;
                CFStringGetCharacters(theString, v38, buffer);
                uint64_t v37 = v53;
              }

              uint64_t v32 = buffer[v31 - v37];
            }

            if ((v32 & 0xFFDF) != 0x50) {
              return 0LL;
            }
            goto LABEL_104;
          }

void *_CFURLCreateByResolvingBookmarkData( const __CFAllocator *a1, const __CFData *a2, unint64_t a3, const __CFURL *a4, const __CFArray *a5, BOOL *a6, CFErrorRef *a7)
{
  unint64_t v14 = _os_activity_create( &dword_182E77000,  "CFURLResolveBookmarkData",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v14, &state);
  CFTypeRef cf = 0LL;
  CFTypeRef v35 = 0LL;
  CFStringRef v15 = createByResolvingBookmarkDataInternal(a1, a2, a3, a4, a5, a6, (__CFError **)&v35, (const __CFURL **)&cf);
  if (v15)
  {
LABEL_2:
    uint64_t v16 = (os_log_s *)resolveLog;
    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
      _CFURLCreateByResolvingBookmarkData_cold_2((uint64_t)v15, v16);
    }
    goto LABEL_4;
  }

  uint64_t v18 = (const __CFURL *)cf;
  if (!cf) {
    goto LABEL_30;
  }
  if (!a2) {
    goto LABEL_30;
  }
  if ((a3 & 0x4000) != 0) {
    goto LABEL_30;
  }
  CFTypeID v19 = CFGetTypeID(a2);
  if (v19 != CFDataGetTypeID()) {
    goto LABEL_30;
  }
  BookmarkData::BookmarkData((BookmarkData *)v39, a1, a2);
  if (!v40) {
    goto LABEL_29;
  }
  if ((v38 & v37 & 8) != 0)
  {
LABEL_29:
    BookmarkData::~BookmarkData((BookmarkData *)v39);
    goto LABEL_30;
  }

  if ((v38 & 0x10) != 0 && (v38 & v37 & 2) != 0)
  {
    int IsReachable = v37 & 0x10;
    goto LABEL_21;
  }

LABEL_19:
  CFStringRef PathComponent = CFURLCreateCopyDeletingLastPathComponent(a1, v18);
  if (!PathComponent) {
    goto LABEL_29;
  }
  BOOL v22 = PathComponent;
  int IsReachable = CFURLResourceIsReachable(PathComponent, 0LL);
  CFRelease(v22);
LABEL_21:
  BookmarkData::~BookmarkData((BookmarkData *)v39);
  if (IsReachable)
  {
    if ((a3 & 0x1000) != 0)
    {
      uint64_t v32 = (const __CFURL *)_CFURLCopyPromiseURLOfLogicalURL();
      if (!v32) {
        goto LABEL_30;
      }
      uint64_t v33 = v32;
      if (CFURLResourceIsReachable(v32, 0LL))
      {
        _CFURLPromiseSetPhysicalURL();
        CFStringRef v15 = (void *)cf;
        CFTypeRef cf = 0LL;
      }

      else
      {
        CFStringRef v15 = 0LL;
      }

      CFRelease(v33);
    }

    else
    {
      if (v35)
      {
        CFRelease(v35);
        CFTypeRef v35 = 0LL;
      }

      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0LL;
      }

      CFStringRef v15 = createByResolvingBookmarkDataInternal(a1, a2, a3, a4, a5, a6, (__CFError **)&v35, (const __CFURL **)&cf);
    }

    if (v15) {
      goto LABEL_2;
    }
  }

    _SetHashCode(v7);
  }

  return v7;
}

  free(v9);
  return 1LL;
}

LABEL_30:
  CFStringRef v15 = 0LL;
  if (a7)
  {
    uint64_t v23 = (__CFError *)v35;
    CFTypeRef v35 = 0LL;
    *a7 = v23;
    if (!v23)
    {
      BOOL v24 = (os_log_s *)resolveLog;
      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_ERROR)) {
        _CFURLCreateByResolvingBookmarkData_cold_1(v24, v25, v26, v27, v28, v29, v30, v31);
      }
      CFStringRef v15 = 0LL;
      *a7 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 256LL, 0LL);
    }
  }

LABEL_4:
  os_release(v14);
  if (cf) {
    CFRelease(cf);
  }
  if (v35) {
    CFRelease(v35);
  }
  os_activity_scope_leave(&state);
  return v15;
}

  LODWORD(v3) = -1;
  LOWORD(v4) = -1;
  LOWORD(v5) = -1;
LABEL_10:
  uint64_t v6 = 0LL;
  *(_WORD *)a1 = v5;
  *(_DWORD *)(a1 + 2) = v3;
  *(_WORD *)(a1 + 6) = v4;
  return v6;
}

CFURLRef createByResolvingBookmarkDataInternal( const __CFAllocator *a1, const __CFData *a2, unint64_t a3, CFURLRef relativeURL, const __CFArray *a5, BOOL *a6, __CFError **a7, const __CFURL **a8)
{
  uint64_t v99 = *MEMORY[0x1895F89C0];
  CFTypeRef cf = 0LL;
  if (relativeURL) {
    CFURLRef v14 = CFURLCopyAbsoluteURL(relativeURL);
  }
  else {
    CFURLRef v14 = 0LL;
  }
  CFStringRef v15 = (os_log_s *)resolveLog;
  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)CFNumberRef v87 = 134219522;
    *(void *)BOOL v88 = a2;
    *(_WORD *)&v88[8] = 2112;
    *(void *)&v88[10] = a2;
    *(_WORD *)&v88[18] = 2048;
    unint64_t v89 = a3;
    __int16 v90 = 2112;
    CFURLRef v91 = v14;
    __int16 v92 = 2112;
    CFNumberRef v93 = a5;
    __int16 v94 = 2048;
    BOOL v95 = a6;
    __int16 v96 = 2048;
    CFStringRef v97 = a7;
    _os_log_debug_impl( &dword_182E77000,  v15,  OS_LOG_TYPE_DEBUG,  "bookmarkRef=<%p %@>  options=%#lx relativeToURL=%@ propertiesToInclude=%@ repIsStaleP=%p errorRefP=%p",  v87,  0x48u);
    if (!a6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }

  if (a6) {
LABEL_6:
  }
    *a6 = 0;
LABEL_7:
  if (a2)
  {
    CFTypeID v16 = CFGetTypeID(a2);
    if (v16 == CFDataGetTypeID())
    {
      BookmarkData::BookmarkData((BookmarkData *)v87, a1, a2);
      if (!*(void *)&v88[12])
      {
        CFErrorRef v24 = CFErrorCreate(a1, (CFErrorDomain)*MEMORY[0x189604F40], 259LL, 0LL);
        if (cf == v24)
        {
          uint64_t v23 = 0LL;
        }

        else
        {
          if (cf) {
            CFRelease(cf);
          }
          uint64_t v23 = 0LL;
          CFTypeRef cf = v24;
        }

        goto LABEL_173;
      }

      CFTypeID TypeID = CFBooleanGetTypeID();
      uint64_t v18 = BookmarkData::copyItem( (BookmarkData *)v87,  @"NSURLBookmarkQuarantineMountedNetworkVolumesKey",  1,  TypeID);
      CFIndex v77 = v18;
      if (v18 && CFBooleanGetValue(v18)) {
        a3 |= 0x2000uLL;
      }
      LODWORD(length) = 0;
      BookmarkSandboxExtensionForTag = getBookmarkSandboxExtensionForTag( (BookmarkData *)v87,  0xF080u,  (unsigned int *)&length);
      CFTypeID v76 = a5;
      if (!BookmarkSandboxExtensionForTag)
      {
        BookmarkSandboxExtensionForTag = getBookmarkSandboxExtensionForTag( (BookmarkData *)v87,  0xF081u,  (unsigned int *)&length);
        if (!BookmarkSandboxExtensionForTag) {
          goto LABEL_33;
        }
      }

      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG)) {
        createByResolvingBookmarkDataInternal();
      }
      uint64_t v20 = sandbox_extension_consume();
      if (v20 >= 1)
      {
        uint64_t v75 = v20;
        uint64_t v21 = CFDataCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  (const UInt8 *)BookmarkSandboxExtensionForTag,  length);
LABEL_35:
        CFTypeID v27 = CFStringGetTypeID();
        uint64_t v29 = BookmarkData::copyItem((BookmarkData *)v87, 0x2070u, 1u, v27);
        if (!v14
          || (BOOL v86 = 0, !_CFURLIsFileURL())
          || !BookmarkData::getItemAs((BookmarkData *)v87, 0x1056u, 1, &v86)
          || !v86)
        {
LABEL_153:
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0LL;
          }

          uint64_t v23 = (const __CFURL *)CFURLCreateByResolvingDataInBookmark( a1,  (BookmarkData *)v87,  1LL,  a3,  (const __CFArray *)a6,  (unsigned __int8 *)&cf,  a8,  v28);
LABEL_156:
          if (v29) {
            CFRelease(v29);
          }
          if (!v21) {
            goto LABEL_164;
          }
          if (!v23) {
            goto LABEL_162;
          }
          uint64_t v66 = (const void *)MEMORY[0x186E1A148](v23);
          if (!v66)
          {
            releaseBookmarkExtension(v75);
            _URLAttachSecurityScopeToFileURL(v23, v21);
            if ((a3 & 0x8000) == 0) {
              _CFURLStartAccessingSecurityScopedResource(v23);
            }
            goto LABEL_163;
          }

          CFRelease(v66);
          if ((a3 & 0x8000) != 0) {
LABEL_162:
          }
            releaseBookmarkExtension(v75);
LABEL_163:
          CFRelease(v21);
LABEL_164:
          if (v77) {
            CFRelease(v77);
          }
          if (v23)
          {
            if (!a6 || !*a6)
            {
              CFURLSetTemporaryResourcePropertyForKey(v23, @"CFURLCreatedFromBookmark", a2);
              BookmarkData::getItemAs((BookmarkData *)v87, 0xD010u, 1, (unsigned int *)buf);
            }

            if (v76)
            {
              CFTypeID v67 = CFGetTypeID(v76);
              if (v67 == CFArrayGetTypeID())
              {
                CFIndex v68 = (const void *)__CFURLResourceInfoPtr();
                _FSURLCacheResourcePropertiesForKeys(v23, v76, v68, 0LL);
              }
            }
          }

LABEL_173:
          BookmarkData::~BookmarkData((BookmarkData *)v87);
          goto LABEL_174;
        }

        CFURLRef v73 = v29;
        CFTypeID v74 = v21;
        CFRetain(v14);
        CFIndex length = v14;
        unsigned int v84 = 0;
        if (BookmarkData::getItemAs((BookmarkData *)v87, 0x1054u, 1, &v84) && (unsigned int v30 = v84) != 0
          || BookmarkData::getItemAs((BookmarkData *)v87, 0x1051u, 1, &v84)
          && (v31 = __CFADD__(v84, 1), unsigned int v30 = v84 + 1, ++v84, !v31))
        {
          uint64_t v40 = (os_log_s *)resolveLog;
          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&uint8_t buf[4] = v30;
            *(_WORD *)&buf[8] = 2112;
            *(void *)&buf[10] = length;
            _os_log_debug_impl(&dword_182E77000, v40, OS_LOG_TYPE_DEBUG, "REMOVING %u from relative url=%@", buf, 0x12u);
            if (!v84--) {
              goto LABEL_44;
            }
          }

          else
          {
            unsigned int v84 = v30 - 1;
          }

          uint64_t v41 = (const __CFString *)*MEMORY[0x189605440];
          do
          {
            if (!length) {
              break;
            }
            CFTypeRef propertyValueTypeRefPtr = 0LL;
            int v42 = CFURLCopyResourcePropertyForKey(length, v41, &propertyValueTypeRefPtr, 0LL);
            uint64_t v43 = (const __CFURL *)propertyValueTypeRefPtr;
            if (!v42 && propertyValueTypeRefPtr)
            {
              CFRelease(propertyValueTypeRefPtr);
              uint64_t v43 = 0LL;
              CFTypeRef propertyValueTypeRefPtr = 0LL;
            }

            uint64_t v44 = (os_log_s *)resolveLog;
            if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v43;
              _os_log_debug_impl(&dword_182E77000, v44, OS_LOG_TYPE_DEBUG, " provisionalURL=%@", buf, 0xCu);
              uint64_t v43 = (const __CFURL *)propertyValueTypeRefPtr;
            }

            CFTypeRef propertyValueTypeRefPtr = 0LL;
            if (length != v43)
            {
              if (length)
              {
                CFRelease(length);
                CFIndex length = v43;
                if (propertyValueTypeRefPtr) {
                  CFRelease(propertyValueTypeRefPtr);
                }
              }

              else
              {
                CFIndex length = v43;
              }
            }
          }

          while (v84--);
        }

LABEL_44:
        if ((BookmarkData::getItemAs((BookmarkData *)v87, 0x1055u, 1, &v82) && v82
           || BookmarkData::getItemAs((BookmarkData *)v87, 0x1053u, 1, &v82) && (BOOL v31 = __CFADD__(v82, 1), ++v82, !v31))
          && (unsigned int v32 = countPathComponents((BookmarkData *)v87, 1), (v33 = v82) != 0)
          && (unsigned int v34 = v32, v82 < v32))
        {
          CFTypeRef v35 = (os_log_s *)resolveLog;
          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v33;
            _os_log_debug_impl( &dword_182E77000,  v35,  OS_LOG_TYPE_DEBUG,  "Adding %u from path components to relative URL",  buf,  8u);
            unsigned int v33 = v82;
          }

          uint64_t v36 = length;
          if (length)
          {
            for (unsigned int i = v34 - v33; i < v34; ++i)
            {
              uint64_t v38 = (const __CFString *)copyIndexedPathComponent((BookmarkData *)v87, 1, i);
              CFTypeRef propertyValueTypeRefPtr = CFURLCreateCopyAppendingPathComponent(a1, length, v38, 1u);
              CFReleaser<__CFData const*>::operator=((const void **)&length, &propertyValueTypeRefPtr);
              uint64_t v39 = (os_log_s *)resolveLog;
              if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = length;
                _os_log_debug_impl(&dword_182E77000, v39, OS_LOG_TYPE_DEBUG, " - provisionalURL=%@", buf, 0xCu);
              }

              if (length && !CFURLResourceIsReachable(length, 0LL) && length)
              {
                CFRelease(length);
                CFIndex length = 0LL;
              }

              if (propertyValueTypeRefPtr) {
                CFRelease(propertyValueTypeRefPtr);
              }
              if (v38) {
                CFRelease(v38);
              }
              uint64_t v36 = length;
              if (!length) {
                break;
              }
            }
          }
        }

        else
        {
          uint64_t v36 = length;
        }

        if (!v36)
        {
LABEL_121:
          uint64_t v55 = (const __CFString *)*MEMORY[0x1896052B8];
          CFTypeID v56 = CFNumberGetTypeID();
          CFNumberRef v57 = BookmarkData::copyItem((BookmarkData *)v87, v55, 1, v56);
          *(void *)buf = 0LL;
          if (!length)
          {
            uint64_t v23 = 0LL;
            uint64_t v29 = v73;
            uint64_t v21 = v74;
            goto LABEL_148;
          }

          int v58 = CFURLCopyResourcePropertyForKey(length, v55, buf, 0LL);
          if (a6 && v58)
          {
            if (!v57)
            {
              if (!*(void *)buf) {
                goto LABEL_131;
              }
              goto LABEL_130;
            }

            if (!*(void *)buf || !CFEqual(v57, *(CFTypeRef *)buf)) {
LABEL_130:
            }
              *a6 = 1;
          }

      CFTypeID v74 = v98;
      _FileCacheLockTransitionFromPreparer(v98);
      _FileCacheUnlock(v74);
      if (!v34) {
        goto LABEL_53;
      }
    }

    os_log_s *v44 = 0LL;
    if (v45 < 1) {
      return v34;
    }
    uint64_t v75 = 0LL;
    CFTypeID v76 = 0LL;
    CFIndex v77 = *MEMORY[0x189604DE8];
    v78 = v87;
    int v79 = v94;
    do
    {
      unsigned __int8 v80 = *(void *)&v78[8 * v76];
      if (v80 >= 1)
      {
        uint64_t v81 = v15;
        unsigned int v82 = v46;
        do
        {
          if (*v81 == v77)
          {
            v75 |= *v82;
            os_log_s *v44 = v75;
          }

          ++v82;
          ++v81;
          --v80;
        }

        while (v80);
      }

      ++v76;
      Boolean v46 = (uint64_t *)((char *)v46 + v79);
      CFStringRef v15 = (uint64_t *)((char *)v15 + v79);
    }

    while (v76 != v45);
  }

  else
  {
    unsigned int v34 = 0;
  }

  uint64_t v43 = (int *)((char *)v30 + ((v16 >> 9) & 0x10));
  if ((v10 & 0x4000) != 0)
  {
    if ((v16 & 0x4000) != 0)
    {
      uint64_t v45 = 0LL;
      Boolean v46 = *(_DWORD *)a6 | 0x10;
      *(_DWORD *)a6 = v46;
      do
      {
        if (*((_BYTE *)v43 + v45)) {
          break;
        }
        ++v45;
      }

      while (v45 != 32);
      *(_DWORD *)a6 = v46 & 0xFBFFFFFF | ((v45 == 32) << 26);
      uint64_t v47 = *(_OWORD *)v43;
      uint64_t v48 = *((_OWORD *)v43 + 1);
      v43 += 8;
      *(_OWORD *)(a6 + 160) = v47;
      *(_OWORD *)(a6 + 176) = v48;
      if (v45 != 32)
      {
        uint64_t v49 = (int8x8_t *)(a6 + 160);
        if (v27 == 2) {
          uint64_t v50 = vrev16_s8(*v49);
        }
        else {
          uint64_t v50 = vrev32_s8(*v49);
        }
        uint64_t v51 = vrev16_s8(*(int8x8_t *)(a6 + 168));
        *(int8x8_t *)(a6 + 160) = v50;
        *(int8x8_t *)(a6 + 168) = v51;
        if (v27 == 2)
        {
          *(_WORD *)(a6 + 178) = bswap32(*(unsigned __int16 *)(a6 + 178)) >> 16;
          *(_WORD *)(a6 + 176) = bswap32(*(unsigned __int16 *)(a6 + 176)) >> 16;
          *(_DWORD *)(a6 + 180) = bswap32(*(_DWORD *)(a6 + 180));
        }

        else
        {
          *(int8x8_t *)(a6 + 176) = vrev16_s8(*(int8x8_t *)(a6 + 176));
        }

        *(_WORD *)(a6 + 184) = bswap32(*(unsigned __int16 *)(a6 + 184)) >> 16;
        *(_WORD *)(a6 + 186) = bswap32(*(unsigned __int16 *)(a6 + 186)) >> 16;
        *(_DWORD *)(a6 + 188) = bswap32(*(_DWORD *)(a6 + 188));
      }
    }

    else
    {
      if (v7) {
        uint64_t v44 = 67108880;
      }
      else {
        uint64_t v44 = 0x4000000;
      }
      *(_DWORD *)a6 = v44 | *(_DWORD *)a6 & 0xFBFFFFEF;
      *(_OWORD *)(a6 + 160) = 0u;
      *(_OWORD *)(a6 + 176) = 0u;
    }
  }

  if ((v10 & 0x8000) != 0)
  {
    if ((v16 & 0x8000) != 0)
    {
      uint64_t v52 = *v43++;
      *(_DWORD *)(a6 + 40) = v52;
      if ((v10 & 0x10000) != 0) {
        goto LABEL_69;
      }
    }

    else
    {
      *(_DWORD *)(a6 + 40) = 0;
      if ((v10 & 0x10000) != 0) {
        goto LABEL_69;
      }
    }

LABEL_131:
          uint64_t v29 = v73;
          uint64_t v21 = v74;
          if (length)
          {
            CFRetain(length);
            uint64_t v23 = length;
            if (a6)
            {
              if (!*a6)
              {
                int v59 = fileIDsMatch((BookmarkData *)v87, 1u, length);
                *a6 = v59 == 0;
                if (v59)
                {
                  CFTypeRef propertyValueTypeRefPtr = 0LL;
                  if (!CFURLCopyResourcePropertyForKey( v23,  (CFStringRef)*MEMORY[0x189605298],  &propertyValueTypeRefPtr,  0LL))
                  {
LABEL_143:
                    uint64_t v29 = v73;
                    uint64_t v21 = v74;
                    if (propertyValueTypeRefPtr) {
                      CFRelease(propertyValueTypeRefPtr);
                    }
                    goto LABEL_146;
                  }

                  uint64_t v29 = v73;
                  uint64_t v21 = v74;
                  if (propertyValueTypeRefPtr)
                  {
                    uint64_t v60 = *MEMORY[0x189604DB0];
                    CFArrayRef v61 = CFArrayCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  MEMORY[0x189605448],  1LL,  MEMORY[0x189605228]);
                    if (v61)
                    {
                      CFArrayRef v62 = v61;
                      BOOL v72 = v57;
                      uint64_t v63 = (const __CFDictionary *)MEMORY[0x186E19FB0](v60, v61, *(void *)&v88[4]);
                      if (v63)
                      {
                        uint64_t v64 = v63;
                        Boolean Value = (const __CFString *)CFDictionaryGetValue(v63, (const void *)*MEMORY[0x189605448]);
                        if (Value) {
                          *a6 = CFStringCompare((CFStringRef)propertyValueTypeRefPtr, Value, 0LL) != kCFCompareEqualTo;
                        }
                        CFRelease(v64);
                      }

                      CFRelease(v62);
                      CFNumberRef v57 = v72;
                    }

                    goto LABEL_143;
                  }
                }
              }
            }
          }

          else
          {
            uint64_t v23 = 0LL;
          }

LABEL_146:
          if (*(void *)buf) {
            CFRelease(*(CFTypeRef *)buf);
          }
LABEL_148:
          if (v57) {
            CFRelease(v57);
          }
          if (length) {
            CFRelease(length);
          }
          if (v23) {
            goto LABEL_156;
          }
          goto LABEL_153;
        }

        if (sameFileURL(v36, v14))
        {
          if (length)
          {
            CFRelease(length);
            CFIndex length = 0LL;
          }

          goto LABEL_121;
        }

        *(void *)buf = 0LL;
        if (!CFURLCopyResourcePropertyForKey(length, (CFStringRef)*MEMORY[0x189605378], buf, 0LL))
        {
          if (length)
          {
            CFRelease(length);
            CFIndex length = 0LL;
          }

          goto LABEL_119;
        }

        if (*(void *)buf && CFBooleanGetValue(*(CFBooleanRef *)buf))
        {
          if (!CFURLHasDirectoryPath(length))
          {
            Boolean v46 = 1;
            goto LABEL_96;
          }
        }

        else if (CFURLHasDirectoryPath(length))
        {
          Boolean v46 = 0;
LABEL_96:
          uint64_t v47 = CFURLCopyFileSystemPath(length, kCFURLPOSIXPathStyle);
          if (v47)
          {
            uint64_t v48 = v47;
            CFTypeRef propertyValueTypeRefPtr = CFURLCreateWithFileSystemPath(a1, v47, kCFURLPOSIXPathStyle, v46);
            if (propertyValueTypeRefPtr)
            {
              CFReleaser<__CFData const*>::operator=((const void **)&length, &propertyValueTypeRefPtr);
              if (propertyValueTypeRefPtr) {
                CFRelease(propertyValueTypeRefPtr);
              }
            }

            CFRelease(v48);
          }
        }

        CFTypeRef propertyValueTypeRefPtr = 0LL;
        CFTypeRef cf2 = 0LL;
        uint64_t v49 = (const __CFString *)*MEMORY[0x189605528];
        if (CFURLCopyResourcePropertyForKey(length, (CFStringRef)*MEMORY[0x189605528], &propertyValueTypeRefPtr, 0LL)
          && CFURLCopyResourcePropertyForKey(v14, v49, &cf2, 0LL)
          && propertyValueTypeRefPtr
          && cf2)
        {
          if (!CFEqual(propertyValueTypeRefPtr, cf2))
          {
            values = 0LL;
            if (CFURLCopyResourcePropertyForKey(length, (CFStringRef)*MEMORY[0x189605670], &values, 0LL)
              && values
              && (uint64_t v50 = CFArrayCreate(a1, (const void **)&values, 1LL, MEMORY[0x189605228])) != 0LL)
            {
              uint64_t v53 = v50;
              CFTypeRef matched = matchVolumeURLForBookmark((BookmarkData *)v87, 1u, v50, (char *)a6, v51, v52);
              if (matched)
              {
                CFRelease(matched);
              }

              else if (length)
              {
                CFRelease(length);
                CFIndex length = 0LL;
              }

              CFRelease(v53);
            }

            else if (length)
            {
              CFRelease(length);
              CFIndex length = 0LL;
            }

            if (values) {
              CFRelease(values);
            }
          }
        }

        else if (length)
        {
          CFRelease(length);
          CFIndex length = 0LL;
        }

        if (cf2) {
          CFRelease(cf2);
        }
        if (propertyValueTypeRefPtr) {
          CFRelease(propertyValueTypeRefPtr);
        }
LABEL_119:
        if (*(void *)buf) {
          CFRelease(*(CFTypeRef *)buf);
        }
        goto LABEL_121;
      }

      if (v20)
      {
        uint64_t v75 = v20;
        uint64_t v25 = (os_log_s *)resolveLog;
        if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_INFO))
        {
          int v26 = *__error();
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v26;
          _os_log_impl( &dword_182E77000,  v25,  OS_LOG_TYPE_INFO,  "failed to consume sandbox extension: %{errno}d",  buf,  8u);
        }
      }

      else
      {
LABEL_33:
        uint64_t v75 = 0LL;
      }

      uint64_t v21 = 0LL;
      goto LABEL_35;
    }
  }

  CFErrorRef v22 = CFErrorCreate(a1, (CFErrorDomain)*MEMORY[0x189604F40], 259LL, 0LL);
  if (cf == v22)
  {
    uint64_t v23 = 0LL;
  }

  else
  {
    if (cf) {
      CFRelease(cf);
    }
    uint64_t v23 = 0LL;
    CFTypeRef cf = v22;
  }

LABEL_181:
  if (v14) {
    CFRelease(v14);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v23;
}

uint64_t DownloadCloudDocumentSync(const __CFURL *a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  dispatch_group_t v2 = dispatch_group_create();
  if (v2)
  {
    uint64_t v3 = v2;
    CFURLRef v4 = (os_log_s *)bmarkLog;
    if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      CFNumberRef v11 = "DownloadCloudDocumentSync";
      __int16 v12 = 2112;
      uint64_t v13 = a1;
      _os_log_impl(&dword_182E77000, v4, OS_LOG_TYPE_INFO, "%s: downloading %@", buf, 0x16u);
    }

    dispatch_group_enter(v3);
    _CFFileCoordinateReadingItemAtURL2();
    dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v3);
    uint64_t v5 = *((unsigned __int8 *)v8 + 24);
  }

  else
  {
    uint64_t v5 = 0LL;
    *((_BYTE *)v8 + 24) = 0;
  }

  _Block_object_dispose(&v7, 8);
  return v5;
}

CFURLRef _URLCreateByResolvingAliasFile( const __CFAllocator *a1, const void *a2, unint64_t a3, const void *a4, __CFError **a5)
{
  CFNumberRef v10 = _os_activity_create( &dword_182E77000,  "CFURLResolveBookmarkData",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  os_activity_scope_enter(v10, &state);
  CFNumberRef v11 = _CreateByResolvingAliasFile(a1, a2, a3, &v27, a5);
  if (v11)
  {
    if (v27)
    {
      CFMutableArrayRef Mutable = CFSetCreateMutable(a1, 0LL, MEMORY[0x189605258]);
      if (Mutable)
      {
        uint64_t v13 = Mutable;
        CFSetAddValue(Mutable, v11);
        uint64_t v14 = _CreateByResolvingAliasFile(a1, v11, a3, &v27, a5);
        CFRelease(v11);
        if (v14)
        {
          CFNumberRef v11 = v14;
          while (v27)
          {
            if (CFSetContainsValue(v13, v11) || CFSetGetCount(v13) >= 32)
            {
              if (a5) {
                *a5 = CFErrorCreate(a1, (CFErrorDomain)*MEMORY[0x189604F40], 260LL, 0LL);
              }
              CFRelease(v11);
              goto LABEL_14;
            }

            CFSetAddValue(v13, v11);
            CFStringRef v15 = _CreateByResolvingAliasFile(a1, v11, a3, &v27, a5);
            CFRelease(v11);
            CFNumberRef v11 = v15;
            if (!v15) {
              break;
            }
          }
        }

        else
        {
LABEL_14:
          CFNumberRef v11 = 0LL;
        }

        CFRelease(v13);
      }
    }
  }

  if (a4 && v11)
  {
    CFTypeID v16 = CFGetTypeID(a4);
    if (v16 == CFArrayGetTypeID())
    {
      uint64_t v17 = (const void *)__CFURLResourceInfoPtr();
      _FSURLCacheResourcePropertiesForKeys(v11, (CFArrayRef)a4, v17, 0LL);
    }
  }

  else if (a5 && !v11 && !*a5)
  {
    uint64_t v18 = (os_log_s *)aliasLog;
    if (os_log_type_enabled((os_log_t)aliasLog, OS_LOG_TYPE_ERROR)) {
      _URLCreateByResolvingAliasFile_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    *a5 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 256LL, 0LL);
  }

  os_release(v10);
  os_activity_scope_leave(&state);
  return v11;
}

CFURLRef _CreateByResolvingAliasFile( const __CFAllocator *a1, CFTypeRef cf, unint64_t a3, unsigned __int8 *a4, __CFError **a5)
{
  cf1[128] = *(CFTypeRef *)MEMORY[0x1895F89C0];
  uint64_t v9 = (const __CFURL *)CFRetain(cf);
  *a4 = 0;
  if (CFURLCopyResourcePropertyForKey(v9, (CFStringRef)*MEMORY[0x189605368], &propertyValueTypeRefPtr, 0LL)) {
    BOOL v10 = propertyValueTypeRefPtr == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10) {
    goto LABEL_12;
  }
  if (!CFBooleanGetValue(propertyValueTypeRefPtr)
    || (CFURLCopyResourcePropertyForKey(v9, (CFStringRef)*MEMORY[0x189605318], cf1, 0LL)
      ? (BOOL v11 = cf1[0] == 0LL)
      : (BOOL v11 = 1),
        v11))
  {
    CFRelease(propertyValueTypeRefPtr);
    goto LABEL_12;
  }

  int v14 = CFEqual(cf1[0], (CFTypeRef)*MEMORY[0x189605328]);
  int v15 = v14;
  if (v14)
  {
    *a4 = 1;
  }

  else if (CFEqual(cf1[0], (CFTypeRef)*MEMORY[0x189605320]))
  {
    *a4 = 1;
    CFRelease(cf1[0]);
    CFRelease(propertyValueTypeRefPtr);
    uint64_t v25 = (const __CFData *)MEMORY[0x186E19F5C](a1, v9, a5);
    if (v25)
    {
      int v26 = v25;
      __int16 v12 = (const __CFURL *)_CFURLCreateByResolvingBookmarkData(a1, v25, a3, v9, 0LL, 0LL, a5);
      CFRelease(v26);
      if (v12 && CFURLIsFileReferenceURL(v12))
      {
        CFURLRef v27 = CFURLCreateFilePathURL(a1, v12, a5);
        CFRelease(v12);
        __int16 v12 = v27;
      }

      goto LABEL_13;
    }

LABEL_39:
    __int16 v12 = 0LL;
    goto LABEL_13;
  }

  CFRelease(cf1[0]);
  CFRelease(propertyValueTypeRefPtr);
  if (!v15)
  {
LABEL_12:
    __int16 v12 = (const __CFURL *)CFRetain(v9);
    goto LABEL_13;
  }

  if (!CFURLGetFileSystemRepresentation(v9, 1u, (UInt8 *)cf1, 1024LL))
  {
    if (a5)
    {
LABEL_45:
      uint64_t v29 = (const __CFString *)*MEMORY[0x189604F40];
      unsigned int v30 = a1;
      uint64_t v28 = 260LL;
      goto LABEL_46;
    }

    goto LABEL_39;
  }

  ssize_t v16 = readlink((const char *)cf1, v33, 0x400uLL);
  if (v16 < 0)
  {
    if (a5)
    {
      uint64_t v28 = *__error();
      uint64_t v29 = (const __CFString *)*MEMORY[0x189604F58];
      unsigned int v30 = a1;
LABEL_46:
      __int16 v12 = 0LL;
      *a5 = _FSURLCreateStandardError(v30, v29, v28, 0, (const __CFString *)v9, 0LL);
      goto LABEL_13;
    }

    goto LABEL_39;
  }

  ssize_t v17 = v16;
  if (CFURLHasDirectoryPath(v9))
  {
    size_t v18 = strlen((const char *)cf1);
    CFURLRef v19 = CFURLCreateFromFileSystemRepresentation(a1, (const UInt8 *)cf1, v18, 0);
    CFRelease(v9);
    uint64_t v9 = v19;
  }

  uint64_t v20 = (const __CFURL *)MEMORY[0x186E19FA4](a1, v33, v17, 0LL, v9);
  if (v20)
  {
    uint64_t v21 = v20;
    if (CFURLGetFileSystemRepresentation(v20, 1u, (UInt8 *)cf1, 1024LL))
    {
      size_t v22 = strlen((const char *)cf1);
      else {
        BOOL v23 = (v31.st_mode & 0xF000) == 0x4000;
      }
      Boolean v24 = v23;
      __int16 v12 = CFURLCreateFromFileSystemRepresentation(a1, (const UInt8 *)cf1, v22, v24);
    }

    else
    {
      __int16 v12 = 0LL;
    }

    CFRelease(v21);
  }

  else
  {
    __int16 v12 = 0LL;
  }

  if (a5 && !v12) {
    goto LABEL_45;
  }
LABEL_13:
  CFRelease(v9);
  return v12;
}

    uint64_t v28 = 0LL;
    goto LABEL_50;
  }

CFTypeRef CFURLCreateByResolvingDataInBookmark( const __CFAllocator *a1, BookmarkData *a2, uint64_t a3, unint64_t a4, const __CFArray *a5, unsigned __int8 *a6, __CFError **a7, const __CFURL **a8)
{
  uint64_t v10 = a3;
  BOOL v11 = a2;
  uint64_t v333 = *MEMORY[0x1895F89C0];
  CFTypeRef v323 = 0LL;
  CFTypeRef v324 = 0LL;
  unsigned __int8 v322 = 0;
  if (BookmarkData::getMisalignedItemDataPtr(a2, 0x1010u, 0, a3))
  {
    uint64_t v13 = (os_log_s *)resolveLog;
    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v32 = copyPathComponentsAsString(v11, v10, 0, 0);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = a4;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v32;
      _os_log_debug_impl( &dword_182E77000,  v13,  OS_LOG_TYPE_DEBUG,  "STARTING RESOLUTION of a bookmark to a filesystem item. options=%#lx, originalItemPath=%@",  buf,  0x16u);
      if (v32) {
        CFRelease(v32);
      }
      uint64_t v13 = (os_log_s *)resolveLog;
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      CFURLCreateByResolvingDataInBookmark();
    }
    CFMutableArrayRef Mutable = CFArrayCreateMutable(a1, 0LL, MEMORY[0x189605228]);
    BOOL URLVolumeProperties = BookmarkData::getURLVolumeProperties(v11, v10, (uint64_t)&userInfoValues);
    if (URLVolumeProperties) {
      unsigned int v16 = v332 & userInfoValues & 1;
    }
    else {
      unsigned int v16 = 0;
    }
    v308 = a6;
    CFTypeID TypeID = CFStringGetTypeID();
    CFTypeRef cf = BookmarkData::copyItem(v11, 0x2011u, v10, TypeID);
    CFURLRef v19 = (os_log_s *)resolveLog;
    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "copyVolumesArrayForBookmark";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v10;
      *(_WORD *)&_BYTE buf[18] = 1024;
      *(_DWORD *)&buf[20] = v16;
      *(_WORD *)&buf[24] = 2112;
      *(void *)&buf[26] = cf;
      _os_log_debug_impl( &dword_182E77000,  v19,  OS_LOG_TYPE_DEBUG,  "%s: (depth=%u bookmarkItemWasLocal=%{BOOL}d volumeUUID=%@",  buf,  0x22u);
    }

    uint64_t v20 = (const __CFString **)MEMORY[0x189605678];
    v312 = a1;
    unsigned int v313 = v10;
    v314 = v11;
    theArray = Mutable;
    if (!v16) {
      goto LABEL_31;
    }
    CFTypeID v21 = CFBooleanGetTypeID();
    size_t v22 = BookmarkData::copyItem(v11, 0x2030u, v10, v21);
    if (!v22) {
      goto LABEL_31;
    }
    BOOL v23 = v22;
    if (CFEqual(v22, (CFTypeRef)*MEMORY[0x189604DE8]))
    {
      CFTypeID v24 = CFStringGetTypeID();
      uint64_t v25 = BookmarkData::copyItem(v11, 0x2002u, v10, v24);
      int v26 = (os_log_s *)resolveLog;
      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
      {
        CFURLCreateByResolvingDataInBookmark((uint64_t)v25, v26);
        if (v25)
        {
LABEL_16:
          if (CFEqual(v25, @"/"))
          {
            CFURLRef v27 = CFURLCreateWithFileSystemPath(a1, @"/", kCFURLPOSIXPathStyle, 1u);
            if (v27)
            {
              uint64_t v28 = v27;
              v315 = *v20;
              BOOL matched = matchURLProperty(v27, *v20, cf);
              BOOL v30 = os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG);
              if (matched)
              {
                uint64_t v10 = v313;
                if (v30) {
                  CFURLCreateByResolvingDataInBookmark();
                }
                CFArrayAppendValue(theArray, v28);
                CFRelease(v28);
                stat v31 = v25;
                CFMutableArrayRef Mutable = theArray;
                CFRelease(v31);
                CFRelease(v23);
                if (CFArrayGetCount(theArray)) {
                  goto LABEL_74;
                }
                goto LABEL_31;
              }

              if (v30) {
                CFURLCreateByResolvingDataInBookmark();
              }
              CFRelease(v28);
              uint64_t v10 = v313;
            }
          }

          CFRelease(v25);
        }
      }

      else if (v25)
      {
        goto LABEL_16;
      }
    }

    CFRelease(v23);
    CFMutableArrayRef Mutable = theArray;
LABEL_31:
    v307 = a7;
    if (URLVolumeProperties)
    {
      int v33 = v332 & ~(_DWORD)userInfoValues & 1;
      BOOL v34 = (*(void *)&v332 & 0x10000LL & (unint64_t)userInfoValues) != 0;
      BOOL v35 = (*(void *)&v332 & 0x10000LL & ~(unint64_t)userInfoValues) != 0;
    }

    else
    {
      BOOL v34 = 0;
      int v33 = 0;
      BOOL v35 = 0;
    }

    uint64_t v36 = (os_log_s *)resolveLog;
    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&uint8_t buf[4] = v16;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v33;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v34;
      *(_WORD *)&buf[20] = 1024;
      *(_DWORD *)&buf[22] = v35;
      _os_log_debug_impl( &dword_182E77000,  v36,  OS_LOG_TYPE_DEBUG,  "Necessary matching props for volume from bookmark: wasLocal=%{BOOL}d wasNetwork=%{BOOL}d wasDevFS=%{BOOL}d/%{BOOL}d",  buf,  0x1Au);
    }

    if (copyVolumesArrayForBookmark(__CFAllocator const*,BookmarkData &,unsigned int)::onceToken != -1) {
      dispatch_once( &copyVolumesArrayForBookmark(__CFAllocator const*,BookmarkData &,unsigned int)::onceToken,  &__block_literal_global_2);
    }
    uint64_t v37 = (const void *)MEMORY[0x186E19FE0]( *MEMORY[0x189604DB0],  0LL,  copyVolumesArrayForBookmark(__CFAllocator const*,BookmarkData &,unsigned int)::sPropertyKeys);
    v315 = *v20;
    while (1)
    {
      while (1)
      {
        CFURLRef anURL = 0LL;
        uint64_t v38 = MEMORY[0x186E19FEC](v37, &anURL, 0LL);
        CFURLRef v39 = anURL;
        if (anURL && v38 == 1) {
          break;
        }
        if (v38 == 2) {
          goto LABEL_72;
        }
      }

      uint64_t inited = 0LL;
      uint64_t v41 = (os_log_s *)resolveLog;
      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
        break;
      }
      if (v16)
      {
LABEL_47:
      }

      else
      {
LABEL_48:
        if (v33) {
          _CFURLGetVolumePropertyFlags();
        }
        if (v35) {
          _CFURLGetVolumePropertyFlags();
        }
        if (!v34 || !_CFURLGetVolumePropertyFlags())
        {
          if (cf && matchURLProperty(anURL, v315, cf))
          {
            int v42 = CFURLCopyFileSystemPath(anURL, kCFURLPOSIXPathStyle);
            uint64_t v43 = copyPathComponentsAsString(v314, v10, 0, 1);
            uint64_t v44 = v43;
            if (v42)
            {
              if (!v43)
              {
                uint64_t v44 = v42;
                goto LABEL_69;
              }

              CFIndex Length = CFStringGetLength(v42);
              CFIndex v46 = CFStringGetLength(v44);
              if (v46 >= 2 && CFStringGetCharacterAtIndex(v44, v46 - 1) == 47) {
                --v46;
              }
              if (Length != v46
                || (v337.location = 0LL, v337.CFIndex length = Length, CFStringCompareWithOptions(v44, v42, v337, 0LL)))
              {
                CFRelease(v44);
                uint64_t v44 = v42;
                uint64_t v10 = v313;
LABEL_69:
                CFRelease(v44);
                goto LABEL_70;
              }

              CFArrayRemoveAllValues(theArray);
              CFArrayAppendValue(theArray, anURL);
              uint64_t v47 = v44;
              CFMutableArrayRef Mutable = theArray;
              CFRelease(v47);
              CFRelease(v42);
              uint64_t v10 = v313;
LABEL_72:
              a7 = v307;
              a1 = v312;
              BOOL v11 = v314;
              if (v37) {
                CFRelease(v37);
              }
LABEL_74:
              if (cf) {
                CFRelease(cf);
              }
              if (!os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
              {
                if (Mutable) {
                  goto LABEL_78;
                }
                goto LABEL_103;
              }

              CFURLCreateByResolvingDataInBookmark();
              if (!Mutable) {
                goto LABEL_103;
              }
LABEL_78:
              if (CFArrayGetCount(Mutable) >= 2 && BookmarkData::getMisalignedItemDataPtr(v11, 0x2011u, 0, v10))
              {
                CFTypeID v48 = CFStringGetTypeID();
                uint64_t v49 = BookmarkData::copyItem(v11, 0x2011u, v10, v48);
                if (CFArrayGetCount(Mutable) >= 1)
                {
                  char v50 = 0;
                  CFIndex v51 = 0LL;
                  uint64_t v52 = 0LL;
                  uint64_t v53 = theArray;
                  while (1)
                  {
                    ValueAtIndex = CFArrayGetValueAtIndex(v53, v51);
                    if (matchURLProperty((const __CFURL *)ValueAtIndex, v315, v49))
                    {
                      if (v52 && !CFEqual(v52, ValueAtIndex))
                      {
                        __int16 v96 = (os_log_s *)resolveLog;
                        if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138412802;
                          *(void *)&uint8_t buf[4] = v52;
                          *(_WORD *)&buf[12] = 2112;
                          *(void *)&buf[14] = ValueAtIndex;
                          *(_WORD *)&buf[22] = 2112;
                          *(void *)&buf[24] = v49;
                          _os_log_debug_impl( &dword_182E77000,  v96,  OS_LOG_TYPE_DEBUG,  "ERROR-- two mounted volumes (%@,%@) have the same UUID %@",  buf,  0x20u);
                        }

                        CFRelease(v52);
                        uint64_t v52 = 0LL;
                        if (!v49) {
                          goto LABEL_100;
                        }
LABEL_99:
                        CFRelease(v49);
                        goto LABEL_100;
                      }

                      if (ValueAtIndex) {
                        CFRetain(ValueAtIndex);
                      }
                      if (v52 && v52 != ValueAtIndex) {
                        CFRelease(v52);
                      }
                      uint64_t v52 = ValueAtIndex;
                    }

                    if (v52)
                    {
                      uint64_t v55 = (os_log_s *)resolveLog;
                      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        *(void *)&uint8_t buf[4] = v52;
                        _os_log_debug_impl( &dword_182E77000,  v55,  OS_LOG_TYPE_DEBUG,  "Pruning volume list to %@ because its UUID matches the one in the bookmark data.",  buf,  0xCu);
                      }

                      CFArrayRemoveAllValues(theArray);
                      CFArrayAppendValue(theArray, v52);
                      char v50 = 1;
                    }

                    ++v51;
                    uint64_t v53 = theArray;
                    if (v51 >= CFArrayGetCount(theArray)) {
                      goto LABEL_98;
                    }
                  }
                }

                char v50 = 0;
                uint64_t v52 = 0LL;
LABEL_98:
                if (v49) {
                  goto LABEL_99;
                }
LABEL_100:
                BOOL v11 = v314;
                CFMutableArrayRef Mutable = theArray;
                if (v52) {
                  CFRelease(v52);
                }
                if ((v50 & 1) != 0)
                {
                  BOOL v74 = 0;
                  goto LABEL_193;
                }
              }

LABEL_103:
              if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                CFURLCreateByResolvingDataInBookmark();
              }
              BOOL v56 = BookmarkData::getURLVolumeProperties(v11, v10, (uint64_t)&userInfoValues);
              if ((a4 & 0x200) != 0)
              {
                CFURLRef v73 = (void *)v323;
              }

              else
              {
                if (!v56) {
                  goto LABEL_111;
                }
                if ((v332 & 0x200) != 0 && (BYTE1(userInfoValues) & 2) != 0)
                {
                  *(_DWORD *)buf = 0;
                  if (BookmarkData::getItemAs(v11, 0x2040u, v10, (unsigned int *)buf))
                  {
                    uint64_t v75 = (os_log_s *)resolveLog;
                    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                      CFURLCreateByResolvingDataInBookmark(v10, v75, v76, v77, v78, v79, v80, (uint64_t)v81);
                    }
                    unsigned int v82 = (const void *)CFURLCreateByResolvingDataInBookmark( a1,  v11,  *(unsigned int *)buf,  a4,  (const __CFArray *)&v322,  (unsigned __int8 *)&v323,  0LL,  v81);
                    if (v82) {
                      CFRelease(v82);
                    }
                  }

                  CFURLRef v57 = 0LL;
                  unsigned __int8 v322 = 1;
                }

                else
                {
                  if ((v332 & 2) == 0 || (userInfoValues & 2) == 0)
                  {
LABEL_111:
                    CFURLRef v57 = 0LL;
                    goto LABEL_112;
                  }

                  CFTypeID v83 = CFStringGetTypeID();
                  unsigned int v84 = (const __CFString *)BookmarkData::copyItem(v11, 0x2002u, v10, v83);
                  CFTypeID v85 = v84;
                  if (!v84) {
                    goto LABEL_263;
                  }
                  CStringPtr = CFStringGetCStringPtr(v84, 0x8000100u);
                  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                  {
                    CFURLCreateByResolvingDataInBookmark();
                    if (CStringPtr) {
                      goto LABEL_150;
                    }
LABEL_149:
                    CStringPtr = buf;
                    if (CFStringGetCString(v85, buf, 1024LL, 0x8000100u)) {
                      goto LABEL_150;
                    }
                    goto LABEL_263;
                  }

                  if (!CStringPtr) {
                    goto LABEL_149;
                  }
LABEL_150:
                  size_t v87 = strlen(CStringPtr);
                  int v88 = getmntinfo_r_np((statfs **)&anURL, 2);
                  if (!v88) {
                    goto LABEL_263;
                  }
                  if (!v87 || v87 > 0x400uLL || v88 <= 0)
                  {
                    free(anURL);
                    goto LABEL_263;
                  }

                  CFURLRef v57 = 0LL;
                  unint64_t v89 = v88 + 1LL;
                  do
                  {
                    __int16 v90 = (const UInt8 *)anURL + 2168 * (v89 - 2) + 88;
                    if (!v90[v87] && !strcmp(CStringPtr, (const char *)anURL + 2168 * (v89 - 2) + 88))
                    {
                      CFURLRef v91 = CFURLCreateFromFileSystemRepresentation(a1, v90, v87, 1u);
                      if (v57 != v91)
                      {
                        CFURLRef v92 = v91;
                        if (v57) {
                          CFRelease(v57);
                        }
                        CFURLRef v57 = v92;
                      }
                    }

                    --v89;
                  }

                  while (v89 > 1);
                  free(anURL);
                  LODWORD(v10) = v313;
                  CFMutableArrayRef Mutable = theArray;
                  if (!v57)
                  {
LABEL_263:
                    CFURLRef v57 = 0LL;
                    unsigned __int8 v322 = 1;
                  }

                  if (v85) {
                    CFRelease(v85);
                  }
                }

                  LODWORD(MutableCopy) = 0;
                  LODWORD(v18) = 0;
                  BOOL v35 = 0;
                  uint64_t v36 = 0LL;
                  goto LABEL_39;
                }

                CFRange v152 = 13LL;
                uint64_t v36 = CFRetain(cfa);
                LODWORD(v18) = 0;
                BOOL v35 = 0;
                goto LABEL_175;
              }

              LODWORD(v18) = 0;
              BOOL v35 = 0;
LABEL_173:
              uint64_t v36 = 0LL;
LABEL_175:
              uint64_t v37 = 0LL;
              uint64_t v38 = 0LL;
              goto LABEL_176;
            }

            CFRange v152 = 2LL;
            uint64_t v36 = CFRetain(cfa);
          }

          else
          {
            uint64_t v36 = 0LL;
          }

          int v14 = v145;
          LODWORD(v18) = 0;
          BOOL v35 = 0;
          uint64_t v37 = 0LL;
          uint64_t v38 = 0LL;
          LODWORD(MutableCopy) = 1;
          goto LABEL_43;
        }

        LODWORD(MutableCopy) = 0;
        LODWORD(v18) = 0;
        uint64_t v36 = 0LL;
        uint64_t v37 = 0LL;
        uint64_t v38 = 0LL;
      }

      else
      {
        LODWORD(v18) = 0;
        BOOL v35 = 0;
        uint64_t v36 = 0LL;
        uint64_t v37 = 0LL;
        uint64_t v38 = 0LL;
        error = CFErrorCreate(allocator, domain, 12LL, 0LL);
      }

      a3 = v143;
      a8 = v144;
      goto LABEL_40;
    }

    LODWORD(MutableCopy) = 0;
LABEL_167:
    BOOL v35 = 0;
    uint64_t v36 = 0LL;
    uint64_t v37 = 0LL;
    uint64_t v38 = 0LL;
    goto LABEL_45;
  }

  if (a4)
  {
LABEL_14:
    value = (void *)v16;
    BOOL v34 = CFErrorCreate(MutableCopy, (CFErrorDomain)*MEMORY[0x189604F50], -50LL, 0LL);
    LODWORD(MutableCopy) = 0;
    LODWORD(v18) = 0;
    BOOL v35 = 0;
    uint64_t v36 = 0LL;
    uint64_t v37 = 0LL;
    uint64_t v38 = 0LL;
    error = v34;
LABEL_45:
    uint64_t v53 = 0;
    if (!a8 || (_DWORD)v38)
    {
      unsigned int v16 = value;
      goto LABEL_81;
    }

    uint64_t v54 = error;
    if (!error)
    {
      if (v36)
      {
        *(void *)&values.ad_name_offset = @"NSURL";
        userInfoValues[0] = v36;
        uint64_t v54 = CFErrorCreateWithUserInfoKeysAndValues( allocator,  domain,  v152,  (const void *const *)&values,  (const void *const *)userInfoValues,  1LL);
      }

      else
      {
        uint64_t v54 = CFErrorCreate(allocator, domain, v152, 0LL);
      }

      error = v54;
    }

    if (v18 | MutableCopy)
    {
      CFRange v152 = 512LL;
      CFTypeID v58 = allocator;
    }

    else
    {
      CFTypeID v58 = allocator;
      if (v54)
      {
        int v59 = CFErrorGetDomain(v54);
        CFIndex Code = CFErrorGetCode(error);
        CFArrayRef v61 = v59;
      }

      else
      {
        CFIndex Code = v152;
        CFArrayRef v61 = domain;
      }

      _FSURLTranslateDomainAndCodeToCocoaError(v61, Code, 1, &v152);
    }

    CFTypeID v62 = (const __CFString *)*MEMORY[0x189604F40];
    CFMutableArrayRef Mutable = CFDictionaryCreateMutable(v58, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
    BOOL v56 = Mutable;
    if (Mutable)
    {
      CFDictionarySetValue(Mutable, @"NSURL", v14);
      if (value) {
        CFDictionarySetValue(v56, @"NSFileOriginalItemLocationKey", value);
      }
      CFDictionarySetValue(v56, @"NSFileNewItemLocationKey", v149);
      if (v35 && v37) {
        CFDictionarySetValue(v56, @"NSFileBackupItemLeftBehindLocationKey", v37);
      }
      if (error) {
        CFDictionarySetValue(v56, (const void *)*MEMORY[0x189604F88], error);
      }
      if ((_DWORD)v18) {
        CFDictionarySetValue(v56, @"NSUserStringVariant", @"Backup");
      }
    }

    uint64_t v64 = CFErrorCreate(allocator, v62, v152, v56);
    *a8 = v64;
    if (!v64) {
      *a8 = CFErrorCreate(allocator, v62, 512LL, 0LL);
    }
    CFURLRef v57 = 0LL;
    uint64_t v38 = 0LL;
    uint64_t v53 = 1;
    unsigned int v16 = value;
    if (v56) {
      goto LABEL_80;
    }
    goto LABEL_81;
  }

  if (!_RenameURL(MutableCopy, (CFURLRef)a3, v14, &error))
  {
    value = (void *)v16;
    LODWORD(MutableCopy) = 0;
    LODWORD(v18) = 0;
    goto LABEL_167;
  }

  if (a7) {
    *a7 = CFRetain(v14);
  }
  uint64_t v55 = (const __CFURL *)_CFURLPromiseCopyPhysicalURL();
  if (v55)
  {
    BOOL v56 = v55;
    TransferDocumentIdentifier(v55, v14);
    uint64_t v53 = 0;
    uint64_t v37 = 0LL;
    uint64_t v36 = 0LL;
    CFURLRef v57 = 1LL;
LABEL_80:
    CFRelease(v56);
    uint64_t v38 = v57;
    goto LABEL_81;
  }

  uint64_t v53 = 0;
  uint64_t v37 = 0LL;
  uint64_t v36 = 0LL;
  uint64_t v38 = 1LL;
LABEL_81:
  if (error) {
    CFRelease(error);
  }
  if (v36) {
    CFRelease(v36);
  }
  if (v16) {
    CFRelease(v16);
  }
  CFRelease(v149);
  if (v37) {
    CFRelease(v37);
  }
  CFURLClearResourcePropertyCache(v14);
  CFURLClearResourcePropertyCache((CFURLRef)a3);
  if (v53 && !*a8)
  {
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      _URLReplaceObject_cold_1();
    }
    *a8 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 256LL, 0LL);
  }

  return v38;
}

LABEL_112:
                if (BookmarkData::getMisalignedItemDataPtr(v11, 0x2050u, 0, v10))
                {
                  CFTypeID v58 = CFURLGetTypeID();
                  int v59 = BookmarkData::copyItem(v11, 0x2050u, v10, v58);
                  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                  {
                    CFURLCreateByResolvingDataInBookmark();
                    if (v59)
                    {
LABEL_115:
                      uint64_t v60 = *MEMORY[0x189604DB0];
                      CFArrayRef v61 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
                      if (!v57)
                      {
                        CFTypeID v62 = CFStringGetTypeID();
                        uint64_t v63 = (const __CFString *)BookmarkData::copyItem(v11, 0x2010u, v10, v62);
                        uint64_t v64 = MEMORY[0x186E19FE0](v60, 0LL, 0LL);
                        uint64_t v65 = (const __CFString **)MEMORY[0x189605668];
                        if (!v64) {
                          goto LABEL_165;
                        }
                        uint64_t v66 = (const void *)v64;
                        CFURLRef v57 = 0LL;
                        CFTypeID v67 = (const __CFString *)*MEMORY[0x1896055A0];
                        CFTypeRef cfa = (const __CFString *)*MEMORY[0x189605668];
                        do
                        {
                          while (1)
                          {
                            *(void *)buf = 0LL;
                            uint64_t v68 = MEMORY[0x186E19FEC](v66, buf, 0LL);
                            if (!*(void *)buf || v68 != 1) {
                              break;
                            }
                            CFArrayAppendValue(v61, *(const void **)buf);
                            if (v63)
                            {
                              CFStringRef PathComponent = CFURLCopyLastPathComponent(*(CFURLRef *)buf);
                              if (PathComponent)
                              {
                                CFIndex v71 = PathComponent;
                                if (CFStringCompare(PathComponent, v63, 0LL)
                                  || !matchURLProperty(*(const __CFURL **)buf, v67, v63)
                                  || !matchURLProperty(*(const __CFURL **)buf, cfa, v59))
                                {
                                  goto LABEL_134;
                                }

                                BOOL v72 = *(const __CFURL **)buf;
                                if (*(void *)buf) {
                                  CFRetain(*(CFTypeRef *)buf);
                                }
                                if (v57 == v72)
                                {
LABEL_134:
                                  BOOL v72 = v57;
                                }

                                else if (v57)
                                {
                                  CFRelease(v57);
                                }

                                CFRelease(v71);
                                CFURLRef v57 = v72;
                                BOOL v11 = v314;
                              }
                            }
                          }
                        }

                        while (v68 != 2);
                        CFRelease(v66);
                        CFMutableArrayRef Mutable = theArray;
                        if (!v57)
                        {
LABEL_165:
                          if (CFArrayGetCount(v61) < 1)
                          {
                            CFURLRef v57 = 0LL;
                          }

                          else
                          {
                            CFIndex v93 = 0LL;
                            __int16 v94 = *v65;
                            while (1)
                            {
                              CFURLRef v57 = (CFURLRef)CFArrayGetValueAtIndex(v61, v93);
                              BOOL v95 = matchURLProperty(v57, v94, v59);
                              if (v57)
                              {
                                if (v95) {
                                  break;
                                }
                              }

                              if (++v93 >= CFArrayGetCount(v61))
                              {
                                CFURLRef v57 = 0LL;
                                goto LABEL_179;
                              }
                            }

                            CFRetain(v57);
LABEL_179:
                            CFMutableArrayRef Mutable = theArray;
                          }
                        }

                        if (v63) {
                          CFRelease(v63);
                        }
                        a1 = v312;
                        LODWORD(v10) = v313;
                      }

                      if (v61) {
                        CFRelease(v61);
                      }
                    }
                  }

                  else if (v59)
                  {
                    goto LABEL_115;
                  }

                  if (!v57) {
                    unsigned __int8 v322 = 1;
                  }
                  if (v59) {
                    CFRelease(v59);
                  }
                }

                if (v57)
                {
                  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                    CFURLCreateByResolvingDataInBookmark();
                  }
                  BOOL v74 = v322 == 0;
                  CFArrayInsertValueAtIndex(Mutable, 0LL, v57);
                  CFRelease(v57);
LABEL_193:
                  a6 = v308;
LABEL_203:
                  uint64_t v99 = (os_log_s *)resolveLog;
                  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                    CFURLCreateByResolvingDataInBookmark(v313, v99, v100, v101, v102, v103, v104, v105);
                  }
                  if (v324)
                  {
                    ssize_t v17 = 0LL;
                    goto LABEL_324;
                  }

                  CFTypeID v106 = CFNumberGetTypeID();
                  v107 = BookmarkData::copyItem(v11, 0xC001u, v313, v106);
                  if (v107)
                  {
                    __int128 v108 = v107;
                    *(_DWORD *)buf = 0;
                    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                      CFURLCreateByResolvingDataInBookmark();
                    }
                    CFRetain(v108);
                    int Value = CFNumberGetValue((CFNumberRef)v108, kCFNumberSInt32Type, buf);
                    CFRelease(v108);
                    if (Value)
                    {
                      CFURLRef v112 = (CFURLRef)copyHomeFolderURLForUser(0LL, v110, v111);
                      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                        CFURLCreateByResolvingDataInBookmark();
                      }
                      if (*(_DWORD *)buf)
                      {
                        __int128 v113 = copyPathComponentsAsArray(v11, v313, 0);
                        CFTypeRef v114 = v113;
                        if (v113) {
                          unsigned int Count = CFArrayGetCount(v113);
                        }
                        else {
                          unsigned int Count = 0;
                        }
                        v117 = (os_log_s *)resolveLog;
                        if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                          CFURLCreateByResolvingDataInBookmark((uint64_t)buf, v117, v118, v119, v120, v121, v122, v123);
                        }
                        v124.CFIndex length = *(unsigned int *)buf;
                        if (Count >= *(_DWORD *)buf)
                        {
                          v124.CFIndex location = Count - *(_DWORD *)buf;
                          int v125 = copyOfArray(v312, v114, v124);
                          CFStringRef v126 = CFStringCreateByCombiningStrings(v312, v125, @"/");
                          BOOL v127 = isDirectory(v11, v313);
                          v128 = (const __CFURL *)MEMORY[0x186E19FC8](v312, v126, 0LL, v127, v112);
                          if (v128)
                          {
                            v129 = v128;
                            CFURLRef v116 = CFURLCopyAbsoluteURL(v128);
                            CFRelease(v129);
                          }

                          else
                          {
                            CFURLRef v116 = 0LL;
                          }

                          a6 = v308;
                          if (v126) {
                            CFRelease(v126);
                          }
                          if (v125) {
                            CFRelease(v125);
                          }
                        }

                        else
                        {
                          CFURLRef v116 = 0LL;
                        }

                        if (v114) {
                          CFRelease(v114);
                        }
                      }

                      else
                      {
                        if (v112) {
                          CFRetain(v112);
                        }
                        CFURLRef v116 = v112;
                        if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                        {
                          CFURLCreateByResolvingDataInBookmark();
                          CFURLRef v116 = v112;
                        }
                      }

                      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                        CFURLCreateByResolvingDataInBookmark();
                      }
                      if (matchURLToBookmark(v314, v313, v116, (BOOL *)&v322, v130))
                      {
                        if (v116)
                        {
                          CFRetain(v116);
                          CFTypeRef v131 = v116;
                        }

                        else
                        {
                          CFTypeRef v131 = 0LL;
                        }

                        if (v324 == v131)
                        {
                          ssize_t v17 = 0LL;
                        }

                        else
                        {
                          if (v324) {
                            CFRelease(v324);
                          }
                          ssize_t v17 = 0LL;
                          CFTypeRef v324 = v131;
                        }
                      }

                      else
                      {
                        ssize_t v17 = 0LL;
                        if (a7 && v116)
                        {
                          CFRetain(v116);
                          ssize_t v17 = v116;
                        }

                        CFTypeRef v131 = v324;
                      }

                      if (!v131)
                      {
                        CFTypeID v132 = CFStringGetTypeID();
                        v133 = (const __CFAllocator *)BookmarkData::copyItem(v314, 0xC011u, v313, v132);
                        if (v133)
                        {
                          v134 = v133;
                          CFTypeRef v135 = (const void *)CFCopyUserName();
                          cfb = v134;
                          int v136 = CFEqual(v134, v135);
                          int v139 = v136;
                          if (v135)
                          {
                            CFRelease(v135);
                            if (v139) {
                              goto LABEL_255;
                            }
LABEL_259:
                            CFRange v141 = cfb;
                            CFURLRef v316 = (CFURLRef)copyHomeFolderURLForUser(cfb, v137, v138);
                            if (v112 == v316)
                            {
                              CFURLRef v316 = v112;
                            }

                            else if (v112)
                            {
                              CFRelease(v112);
                            }

                            if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                              CFURLCreateByResolvingDataInBookmark();
                            }
                            if (*(_DWORD *)buf)
                            {
                              CFRange v142 = copyPathComponentsAsArray(v314, v313, 0);
                              CFRange v143 = v142;
                              if (v142) {
                                unsigned int v144 = CFArrayGetCount(v142);
                              }
                              else {
                                unsigned int v144 = 0;
                              }
                              CFRange v145 = (os_log_s *)resolveLog;
                              if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                                CFURLCreateByResolvingDataInBookmark( (uint64_t)buf,  v145,  v146,  v147,  v148,  v149,  v150,  v151);
                              }
                              v152.CFIndex length = *(unsigned int *)buf;
                              if (v144 >= *(_DWORD *)buf)
                              {
                                v152.CFIndex location = v144 - *(_DWORD *)buf;
                                v310 = copyOfArray(v312, v143, v152);
                                CFStringRef v154 = CFStringCreateByCombiningStrings(v312, v310, @"/");
                                BOOL v155 = isDirectory(v314, v313);
                                v156 = (const __CFURL *)MEMORY[0x186E19FC8](v312, v154, 0LL, v155, v316);
                                v157 = v156;
                                if (v156) {
                                  CFURLRef v140 = CFURLCopyAbsoluteURL(v156);
                                }
                                else {
                                  CFURLRef v140 = 0LL;
                                }
                                if (v116 == v140)
                                {
                                  CFURLRef v140 = v116;
                                }

                                else if (v116)
                                {
                                  CFRelease(v116);
                                }

                                v153 = v314;
                                if (v157) {
                                  CFRelease(v157);
                                }
                                if (v154) {
                                  CFRelease(v154);
                                }
                                CFMutableArrayRef Mutable = theArray;
                                if (v310) {
                                  CFRelease(v310);
                                }
                              }

                              else
                              {
                                CFURLRef v140 = v116;
                                v153 = v314;
                              }

                              CFRange v141 = cfb;
                              if (v143) {
                                CFRelease(v143);
                              }
                            }

                            else
                            {
                              if (v316) {
                                CFRetain(v316);
                              }
                              if (v116 == v316)
                              {
                                CFURLRef v140 = v116;
                              }

                              else
                              {
                                CFURLRef v140 = v316;
                                if (v116)
                                {
                                  CFRelease(v116);
                                  CFURLRef v140 = v316;
                                }
                              }

                              if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                                CFURLCreateByResolvingDataInBookmark();
                              }
                              v153 = v314;
                            }

                            if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                              CFURLCreateByResolvingDataInBookmark();
                            }
                            if (matchURLToBookmark(v153, v313, v140, (BOOL *)&v322, v158))
                            {
                              if (v140)
                              {
                                CFRetain(v140);
                                CFURLRef v159 = v140;
                              }

                              else
                              {
                                CFURLRef v159 = 0LL;
                              }

                              if (v324 != v159)
                              {
                                if (v324) {
                                  CFRelease(v324);
                                }
                                CFTypeRef v324 = v159;
                              }
                            }

                            CFURLRef v112 = v316;
                          }

                          else
                          {
                            if (!v136) {
                              goto LABEL_259;
                            }
LABEL_255:
                            CFURLRef v140 = v116;
                            CFRange v141 = cfb;
                          }

                          CFRelease(v141);
                          CFURLRef v116 = v140;
                        }
                      }

                      if (v112) {
                        CFRelease(v112);
                      }
                      if (v116) {
                        CFRelease(v116);
                      }
                      BOOL v11 = v314;
                    }

                    else
                    {
                      ssize_t v17 = 0LL;
                    }

                    if (!v324) {
                      unsigned __int8 v322 = 1;
                    }
                    CFRelease(v108);
                  }

                  else
                  {
                    ssize_t v17 = 0LL;
                  }

                  a1 = v312;
                  if (v324)
                  {
LABEL_324:
                    LODWORD(v10) = v313;
                    goto LABEL_325;
                  }

                  if (!BookmarkData::getURLResourceProperties(v11, v313, (uint64_t)buf)
                    || (buf[8] & 8) == 0
                    || (buf[0] & 8) == 0)
                  {
                    goto LABEL_608;
                  }

                  CFTypeID v163 = CFBooleanGetTypeID();
                  v164 = BookmarkData::copyItem(v11, 0x2030u, v313, v163);
                  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                  {
                    CFURLCreateByResolvingDataInBookmark();
                    if (!v164) {
                      goto LABEL_595;
                    }
LABEL_335:
                    if (!CFEqual(v164, (CFTypeRef)*MEMORY[0x189604DE8])) {
                      goto LABEL_595;
                    }
                    CFTypeRef v167 = CFURLCreateWithFileSystemPath(v312, @"/", kCFURLPOSIXPathStyle, 1u);
                    if (v324 != v167)
                    {
                      if (v324) {
                        CFRelease(v324);
                      }
                      CFTypeRef v324 = v167;
                    }

                    CFRelease(v164);
                  }

                  else
                  {
                    if (v164) {
                      goto LABEL_335;
                    }
LABEL_595:
                    if (v74)
                    {
                      v279 = CFArrayGetValueAtIndex(Mutable, 0LL);
                      CFTypeRef v167 = v279;
                      if (v279) {
                        CFRetain(v279);
                      }
                    }

                    else
                    {
                      CFTypeRef v167 = matchVolumeURLForBookmark(v11, v313, Mutable, (char *)&v322, v165, v166);
                    }

                    if (v324 != v167)
                    {
                      if (v324) {
                        CFRelease(v324);
                      }
                      CFTypeRef v324 = v167;
                    }

                    if (v164)
                    {
                      CFRelease(v164);
                      if (!v167) {
                        goto LABEL_605;
                      }
LABEL_608:
                      if (v324) {
                        goto LABEL_630;
                      }
                      CFTypeID v280 = CFBooleanGetTypeID();
                      v281 = BookmarkData::copyItem(v11, 0x2030u, v313, v280);
                      if (v281)
                      {
                        v284 = v281;
                        if (CFEqual(v281, (CFTypeRef)*MEMORY[0x189604DE8]))
                        {
                          v285 = copyPathComponentsAsString(v11, v313, 0, 1);
                          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                          {
                            CFURLCreateByResolvingDataInBookmark();
                            if (v285)
                            {
LABEL_613:
                              Boolean v286 = isDirectory(v11, v313);
                              CFURLRef v287 = CFURLCreateWithFileSystemPath(v312, v285, kCFURLPOSIXPathStyle, v286);
                              if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                                CFURLCreateByResolvingDataInBookmark();
                              }
                              a6 = v308;
                              CFMutableArrayRef Mutable = theArray;
                              if (matchURLToBookmark(v11, v313, v287, (BOOL *)&v322, v288))
                              {
                                if (v287) {
                                  CFRetain(v287);
                                }
                                if (v324 != v287)
                                {
                                  if (v324) {
                                    CFRelease(v324);
                                  }
                                  CFTypeRef v324 = v287;
                                }
                              }

                              if (v287) {
                                CFRelease(v287);
                              }
                            }
                          }

                          else if (v285)
                          {
                            goto LABEL_613;
                          }

                          if (!v324) {
                            unsigned __int8 v322 = 1;
                          }
                          if (v285) {
                            CFRelease(v285);
                          }
                        }

                        CFRelease(v284);
                      }

                      if (v324)
                      {
LABEL_630:
                        LODWORD(v10) = v313;
                        goto LABEL_325;
                      }

                      if (v74)
                      {
                        v289 = CFArrayGetValueAtIndex(Mutable, 0LL);
                        LODWORD(v10) = v313;
                        if (v289)
                        {
                          CFTypeRef v290 = v289;
                          CFRetain(v289);
                          goto LABEL_655;
                        }

LABEL_636:
                        CFTypeID v291 = CFStringGetTypeID();
                        cfc = (const __CFString *)BookmarkData::copyItem(v11, 0x2010u, v10, v291);
                        if (cfc)
                        {
                          unsigned __int8 v322 = 1;
                          v292 = (const void *)MEMORY[0x186E19FE0](*MEMORY[0x189604DB0], 0LL, 0LL);
                          *(void *)buf = 0LL;
                          uint64_t v293 = MEMORY[0x186E19FEC](v292, buf, 0LL);
                          CFTypeRef v290 = 0LL;
                          if (v293 != 2)
                          {
                            CFTypeRef v290 = 0LL;
                            v294 = (const __CFString *)*MEMORY[0x1896055A0];
                            do
                            {
                              if (v293 != 1 || !*(void *)buf) {
                                goto LABEL_650;
                              }
                              userInfoValues = 0LL;
                              if (!CFURLCopyResourcePropertyForKey(*(CFURLRef *)buf, v294, &userInfoValues, 0LL)) {
                                goto LABEL_646;
                              }
                              if (!userInfoValues) {
                                goto LABEL_650;
                              }
                              CFTypeID v295 = CFGetTypeID(userInfoValues);
                              if (v295 == CFStringGetTypeID())
                              {
                                int v296 = 1;
                                if (CFStringCompare(cfc, (CFStringRef)userInfoValues, 1uLL) == kCFCompareEqualTo)
                                {
                                  CFTypeRef v290 = *(CFTypeRef *)buf;
                                  CFRetain(*(CFTypeRef *)buf);
                                  int v296 = 0;
                                }
                              }

                              else
                              {
LABEL_646:
                                int v296 = 1;
                              }

                              if (userInfoValues) {
                                CFRelease(userInfoValues);
                              }
                              if (!v296) {
                                break;
                              }
LABEL_650:
                              uint64_t v293 = MEMORY[0x186E19FEC](v292, buf, 0LL);
                            }

                            while (v293 != 2);
                          }

                          if (v292) {
                            CFRelease(v292);
                          }
                          CFRelease(cfc);
                          BOOL v11 = v314;
                        }

                        else
                        {
                          CFTypeRef v290 = 0LL;
                        }
                      }

                      else
                      {
                        LODWORD(v10) = v313;
                        CFTypeRef v290 = matchVolumeURLForBookmark(v11, v313, Mutable, (char *)&v322, v282, v283);
                        if (!v290) {
                          goto LABEL_636;
                        }
                      }

LABEL_655:
                      v297 = copyVolumePathComponentsAsArray(v11, v10);
                      v298 = v297;
                      if (v297) {
                        int v299 = CFArrayGetCount(v297);
                      }
                      else {
                        int v299 = 0;
                      }
                      v300 = copyPathComponentsAsString(v11, v10, v299, 0);
                      v301 = v300;
                      if (v290)
                      {
                        if (v300)
                        {
                          BOOL v302 = isDirectory(v314, v10);
                          v303 = (const __CFURL *)MEMORY[0x186E19FC8](v312, v301, 0LL, v302, v290);
                          v304 = (os_log_s *)resolveLog;
                          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138413058;
                            *(void *)&uint8_t buf[4] = v303;
                            *(_WORD *)&buf[12] = 2112;
                            *(void *)&buf[14] = v298;
                            *(_WORD *)&buf[22] = 2112;
                            *(void *)&buf[24] = v301;
                            *(_WORD *)&buf[32] = 2112;
                            *(void *)&buf[34] = v290;
                            _os_log_debug_impl( &dword_182E77000,  v304,  OS_LOG_TYPE_DEBUG,  "4. Trying to match by volume name + path components, maybeURL=%@ volumePathElements=%@ pat hComponents=%@ volumeURL=%@",  buf,  0x2Au);
                            if (!v303) {
                              goto LABEL_672;
                            }
LABEL_662:
                            if (!matchURLToBookmark(v314, v10, v303, (BOOL *)&v322, v305)) {
                              goto LABEL_672;
                            }
                            CFTypeRef v306 = CFURLCopyAbsoluteURL(v303);
                            if (v324 != v306)
                            {
                              if (v324) {
                                CFRelease(v324);
                              }
                              CFTypeRef v324 = v306;
                            }
                          }

                          else
                          {
                            if (v303) {
                              goto LABEL_662;
                            }
LABEL_672:
                            CFTypeRef v306 = v324;
                          }

                          if (!v306) {
                            unsigned __int8 v322 = 1;
                          }
                          if (v303) {
                            CFRelease(v303);
                          }
LABEL_677:
                          CFRelease(v301);
                        }
                      }

                      else if (v300)
                      {
                        goto LABEL_677;
                      }

                      if (v298) {
                        CFRelease(v298);
                      }
                      BOOL v11 = v314;
                      if (v290) {
                        CFRelease(v290);
                      }
LABEL_325:
                      CFTypeRef v160 = v324;
                      int v161 = 1;
                      if ((a4 & 0x200) != 0 && !v324)
                      {
                        else {
                          int v162 = 0;
                        }
                        int v161 = v162 ^ 1;
                        CFTypeRef v160 = v324;
                      }

                      if (v160 || !v161)
                      {
                        *(void *)buf = *MEMORY[0x189604F30];
                        userInfoValues = @"kCFBookmarkResolutionWithoutMountingMask was passed and the volume needed wasn't available";
                        CFErrorRef v185 = CFErrorCreateWithUserInfoKeysAndValues( a1,  (CFErrorDomain)*MEMORY[0x189604F40],  260LL,  (const void *const *)buf,  (const void *const *)&userInfoValues,  1LL);
                        if (v323 != v185)
                        {
                          if (v323) {
                            CFRelease(v323);
                          }
                          CFTypeRef v323 = v185;
                        }

                        CFTypeRef v186 = v324;
                        goto LABEL_382;
                      }

                      unsigned __int8 v322 = 1;
                      if (bookmarkHasPathComponents(v11, v10))
                      {
                        CFTypeID v168 = CFArrayGetTypeID();
                        v169 = (const __CFArray *)BookmarkData::copyItem(v314, 0x2000u, v10, v168);
                        if (!os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                        {
                          if (v169) {
                            goto LABEL_348;
                          }
                          goto LABEL_385;
                        }

                        CFURLCreateByResolvingDataInBookmark();
                        if (!v169) {
                          goto LABEL_385;
                        }
LABEL_348:
                        CFIndex v170 = countPathComponents(v314, v313);
                        CFIndex v171 = CFArrayGetCount(v169);
                        if (v171 >= v170) {
                          uint64_t v172 = v170;
                        }
                        else {
                          uint64_t v172 = v171;
                        }
                        if (v172 >= 1)
                        {
                          while (2)
                          {
                            if (v324) {
                              goto LABEL_397;
                            }
                            uint64_t v173 = v172 - 1;
                            *(void *)buf = CFArrayGetValueAtIndex(v169, v172 - 1);
                            CFNumber::CFNumber((CFNumber *)&userInfoValues, (CFTypeRef *)buf);
                            if (userInfoValues)
                            {
                              if (CFNumberGetValue((CFNumberRef)userInfoValues, kCFNumberSInt32Type, &anURL))
                              {
                                if ((_DWORD)anURL)
                                {
                                  CFTypeRef v176 = matchVolumeURLForBookmark(v314, anURL, theArray, 0LL, v174, v175);
                                  if (v176)
                                  {
                                    v177 = v176;
                                    else {
                                      v178 = copyPathComponentsAsString(v314, v313, (int)v172 - 1, 0);
                                    }
                                    v179 = (os_log_s *)resolveLog;
                                    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                                    {
                                      *(_DWORD *)buf = 138412802;
                                      *(void *)&uint8_t buf[4] = v177;
                                      *(_WORD *)&buf[12] = 2112;
                                      *(void *)&buf[14] = v178;
                                      *(_WORD *)&buf[22] = 1024;
                                      *(_DWORD *)&buf[24] = (_DWORD)anURL;
                                      _os_log_debug_impl( &dword_182E77000,  v179,  OS_LOG_TYPE_DEBUG,  "5a.  Trying volume url=%@ with partial path %@ volumeDepth=%u",  buf,  0x1Cu);
                                      if (v178)
                                      {
LABEL_362:
                                        v180 = (const __CFURL *)MEMORY[0x186E19FC8](v312, v178, 0LL, 0LL, v177);
                                        if (v180)
                                        {
                                          v182 = v180;
                                          if (matchURLToBookmark(v314, v313, v180, (BOOL *)&v322, v181))
                                          {
                                            CFURLRef v183 = CFURLCopyAbsoluteURL(v182);
                                            if (v324 != v183)
                                            {
                                              if (v324) {
                                                CFRelease(v324);
                                              }
                                              CFTypeRef v324 = v183;
                                            }
                                          }

                                          CFRelease(v182);
                                          a6 = v308;
                                        }

                                        CFRelease(v178);
                                      }
                                    }

                                    else if (v178)
                                    {
                                      goto LABEL_362;
                                    }

                                    CFRelease(v177);
                                  }
                                }
                              }

                              if (userInfoValues) {
                                CFRelease(userInfoValues);
                              }
                            }

                            uint64_t v172 = v173;
                            BOOL v184 = (unint64_t)(v173 + 1) > 1;
                            a1 = v312;
                            if (!v184) {
                              break;
                            }
                            continue;
                          }
                        }

LABEL_385:
                        if (!v324)
                        {
                          v187 = copyPathComponentsAsString(v314, v313, 0, 0);
                          if (v187)
                          {
                            v188 = v187;
                            v189 = CFURLCreateWithFileSystemPath(a1, v187, kCFURLPOSIXPathStyle, 0);
                            if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                              CFURLCreateByResolvingDataInBookmark();
                            }
                            if (v189)
                            {
                              if (matchURLToBookmark(v314, v313, v189, (BOOL *)&v322, v190))
                              {
                                CFURLRef v191 = CFURLCopyAbsoluteURL(v189);
                                if (v324 != v191)
                                {
                                  if (v324) {
                                    CFRelease(v324);
                                  }
                                  CFTypeRef v324 = v191;
                                }
                              }

                              CFRelease(v189);
                            }

                            CFRelease(v188);
                            a6 = v308;
                          }
                        }

LABEL_397:
                        LODWORD(v10) = v313;
                        if (v169) {
                          CFRelease(v169);
                        }
                      }

                      if (v324) {
                        goto LABEL_426;
                      }
                      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                        CFURLCreateByResolvingDataInBookmark();
                      }
                      v194 = (const __CFURL *)matchVolumeURLForBookmark(v314, v10, theArray, (char *)&v322, v192, v193);
                      if (v194)
                      {
                        v195 = v194;
                        CFTypeID v196 = CFNumberGetTypeID();
                        v197 = (const __CFArray *)BookmarkData::copyItem(v314, 0x1030u, v10, v196);
                        if (v197) {
                          goto LABEL_405;
                        }
                        CFTypeID v201 = CFArrayGetTypeID();
                        v202 = (const __CFArray *)BookmarkData::copyItem(v314, 0x1005u, v10, v201);
                        if (v202)
                        {
                          v197 = v202;
                          if (CFArrayGetCount(v202) < 1) {
                            goto LABEL_418;
                          }
                          CFIndex v203 = CFArrayGetCount(v197);
                          v204 = CFArrayGetValueAtIndex(v197, v203 - 1);
                          if (!v204) {
                            goto LABEL_418;
                          }
                          v205 = v204;
                          CFTypeID v206 = CFGetTypeID(v204);
                          if (v206 != CFNumberGetTypeID())
                          {
                            CFURLRef v198 = 0LL;
                            a6 = v308;
                            goto LABEL_419;
                          }

                          v207 = (const __CFArray *)CFRetain(v205);
                          a6 = v308;
                          if (!v207)
                          {
LABEL_418:
                            CFURLRef v198 = 0LL;
                            goto LABEL_419;
                          }

                          v208 = v207;
                          CFRelease(v197);
                          v197 = v208;
LABEL_405:
                          CFURLRef v198 = _CFURLCreateWithVolumeURLAndResourceID(a1, v195, v197);
                          v199 = (os_log_s *)resolveLog;
                          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 67109890;
                            *(_DWORD *)&uint8_t buf[4] = v10;
                            *(_WORD *)&buf[8] = 2048;
                            *(void *)&buf[10] = a4;
                            *(_WORD *)&_BYTE buf[18] = 2112;
                            *(void *)&buf[20] = v197;
                            *(_WORD *)&buf[28] = 2112;
                            *(void *)&buf[30] = v195;
                            _os_log_debug_impl( &dword_182E77000,  v199,  OS_LOG_TYPE_DEBUG,  " -- Trying to match by targetFileID, depth=%u  options=%#lx fileID=%@ on volume %@",  buf,  0x26u);
                          }

                          if (!matchURLToBookmark(v314, v10, v198, (BOOL *)&v322, v200) && v198)
                          {
                            CFRelease(v198);
                            goto LABEL_418;
                          }

LABEL_419:
                          CFRelease(v197);
                        }

                        else
                        {
LABEL_417:
                          CFURLRef v198 = 0LL;
                        }

                        CFRelease(v195);
                      }

                      else
                      {
                        CFURLRef v198 = 0LL;
                      }

                      if (v324 != v198)
                      {
                        if (v324) {
                          CFRelease(v324);
                        }
                        CFTypeRef v324 = v198;
                      }

                      if (v198)
                      {
LABEL_426:
                        v209 = (const __CFString *)*MEMORY[0x1896052B8];
                        CFTypeID v210 = CFNumberGetTypeID();
                        CFNumberRef v211 = BookmarkData::copyItem(v314, v209, v10, v210);
                        *(void *)buf = 0LL;
                        CFURLCopyResourcePropertyForKey((CFURLRef)v324, v209, buf, 0LL);
                        if (v211)
                        {
                          if (!*(void *)buf || !CFEqual(v211, *(CFTypeRef *)buf)) {
LABEL_431:
                          }
                            unsigned __int8 v322 = 1;
                          if (*(void *)buf) {
                            CFRelease(*(CFTypeRef *)buf);
                          }
                          if (v211) {
                            CFRelease(v211);
                          }
                        }

                        else if (*(void *)buf)
                        {
                          goto LABEL_431;
                        }

LABEL_436:
                        BOOL v11 = v314;
                        if (v324
                          && (BookmarkData::getMisalignedItemDataPtr(v314, 0x1101u, 0, v10)
                           || BookmarkData::getMisalignedItemDataPtr(v314, 0x1102u, 0, v10)))
                        {
                          CFTypeID v212 = CFStringGetTypeID();
                          v213 = (const __CFString *)BookmarkData::copyItem(v314, 0x1102u, v10, v212);
                          CFTypeID v214 = CFStringGetTypeID();
                          v215 = (const __CFString *)BookmarkData::copyItem(v314, 0x1101u, v10, v214);
                          CFIndex v329 = 0LL;
                          CFMutableStringRef v330 = CFStringCreateMutable(a1, 0LL);
                          v216 = CFURLGetString((CFURLRef)v324);
                          CFIndex v217 = CFStringGetLength(v216);
                          CFIndex v218 = v329;
                          if (v217 < 1025)
                          {
                            CFIndex v220 = v217;
                            if (v329 + v217 >= 1025)
                            {
                              CFStringAppendCharacters(v330, (const UniChar *)buf, v329);
                              CFIndex v218 = 0LL;
                              CFIndex v329 = 0LL;
                            }

                            v221 = (UniChar *)&buf[2 * v218];
                            v334.CFIndex location = 0LL;
                            v334.CFIndex length = v220;
                            CFStringGetCharacters(v216, v334, v221);
                            CFIndex v219 = v329 + v220;
                            v329 += v220;
                            if (v213) {
                              goto LABEL_447;
                            }
LABEL_453:
                            if (!v215) {
                              goto LABEL_464;
                            }
LABEL_458:
                            if (v219 >= 1024)
                            {
                              CFStringAppendCharacters(v330, (const UniChar *)buf, v219);
                              CFIndex v219 = 0LL;
                              CFIndex v329 = 0LL;
                            }

                            *(_WORD *)&buf[2 * v219] = 35;
                            ++v329;
                            CFIndex v226 = CFStringGetLength(v215);
                            CFIndex v227 = v329;
                            if (v226 > 1024)
                            {
                              if (v329)
                              {
                                CFStringAppendCharacters(v330, (const UniChar *)buf, v329);
                                CFIndex v329 = 0LL;
                              }

                              CFStringAppend(v330, v215);
                              CFIndex v219 = v329;
                              goto LABEL_464;
                            }

                            CFIndex v243 = v226;
                            if (v329 + v226 >= 1025)
                            {
                              CFStringAppendCharacters(v330, (const UniChar *)buf, v329);
                              CFIndex v227 = 0LL;
                              CFIndex v329 = 0LL;
                            }

                            v244 = (UniChar *)&buf[2 * v227];
                            v336.CFIndex location = 0LL;
                            v336.CFIndex length = v243;
                            CFStringGetCharacters(v215, v336, v244);
                            CFIndex v219 = v329 + v243;
                            CFIndex v329 = v219;
                            if (v219)
                            {
LABEL_465:
                              CFStringAppendCharacters(v330, (const UniChar *)buf, v219);
                              CFIndex v329 = 0LL;
                            }
                          }

                          else
                          {
                            if (v329)
                            {
                              CFStringAppendCharacters(v330, (const UniChar *)buf, v329);
                              CFIndex v329 = 0LL;
                            }

                            CFStringAppend(v330, v216);
                            CFIndex v219 = v329;
                            if (!v213) {
                              goto LABEL_453;
                            }
LABEL_447:
                            if (v219 >= 1024)
                            {
                              CFStringAppendCharacters(v330, (const UniChar *)buf, v219);
                              CFIndex v219 = 0LL;
                              CFIndex v329 = 0LL;
                            }

                            *(_WORD *)&buf[2 * v219] = 63;
                            ++v329;
                            CFIndex v222 = CFStringGetLength(v213);
                            CFIndex v223 = v329;
                            if (v222 > 1024)
                            {
                              if (v329)
                              {
                                CFStringAppendCharacters(v330, (const UniChar *)buf, v329);
                                CFIndex v329 = 0LL;
                              }

                              CFStringAppend(v330, v213);
                              CFIndex v219 = v329;
                              goto LABEL_453;
                            }

                            CFIndex v224 = v222;
                            if (v329 + v222 >= 1025)
                            {
                              CFStringAppendCharacters(v330, (const UniChar *)buf, v329);
                              CFIndex v223 = 0LL;
                              CFIndex v329 = 0LL;
                            }

                            v225 = (UniChar *)&buf[2 * v223];
                            v335.CFIndex location = 0LL;
                            v335.CFIndex length = v224;
                            CFStringGetCharacters(v213, v335, v225);
                            CFIndex v219 = v329 + v224;
                            v329 += v224;
                            if (v215) {
                              goto LABEL_458;
                            }
LABEL_464:
                            if (v219) {
                              goto LABEL_465;
                            }
                          }

                          v228 = v330;
                          CFMutableStringRef v330 = 0LL;
                          v229 = CFURLGetBaseURL((CFURLRef)v324);
                          userInfoValues = CFURLCreateWithString(a1, v228, v229);
                          CFReleaser<__CFData const*>::operator=(&v324, (CFTypeRef *)&userInfoValues);
                          if (userInfoValues) {
                            CFRelease(userInfoValues);
                          }
                          if (v228) {
                            CFRelease(v228);
                          }
                          if (v215) {
                            CFRelease(v215);
                          }
                          BOOL v11 = v314;
                          if (v213) {
                            CFRelease(v213);
                          }
                        }

                        CFMutableArrayRef Mutable = theArray;
                        if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                          CFURLCreateByResolvingDataInBookmark();
                        }
                        int v98 = 1;
                        if (theArray) {
LABEL_477:
                        }
                          CFRelease(Mutable);
LABEL_478:
                        if (v98)
                        {
                          if (!v324) {
                            goto LABEL_480;
                          }
                          goto LABEL_488;
                        }

                        goto LABEL_495;
                      }

                      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                        CFURLCreateByResolvingDataInBookmark();
                      }
                      CFTypeID v245 = CFArrayGetTypeID();
                      v246 = (const __CFArray *)BookmarkData::copyItem(v314, 0x1005u, v10, v245);
                      unsigned int v247 = countPathComponents(v314, v10);
                      if (v246)
                      {
                        LODWORD(v248) = v247;
                        CFTypeID v249 = CFArrayGetTypeID();
                        v250 = (const __CFArray *)BookmarkData::copyItem(v314, 0x2000u, v10, v249);
                        if (v250)
                        {
                          v253 = v250;
                          uint64_t v254 = v248;
                          CFIndex v255 = CFArrayGetCount(v250);
                          else {
                            uint64_t v248 = v255;
                          }
                          if (v248 >= 1)
                          {
                            uint64_t v256 = v254;
                            while (1)
                            {
                              *(void *)buf = CFArrayGetValueAtIndex(v253, (v248 - 1));
                              CFNumber::CFNumber((CFNumber *)&userInfoValues, (CFTypeRef *)buf);
                              if (!userInfoValues)
                              {
                                CFTypeRef v186 = 0LL;
                                goto LABEL_543;
                              }

                              if (!CFNumberGetValue((CFNumberRef)userInfoValues, kCFNumberSInt32Type, &anURL)
                                || (_DWORD)anURL == 0)
                              {
                                break;
                              }

                              LOBYTE(inited) = 0;
                              v260 = (const __CFURL *)matchVolumeURLForBookmark( v314,  anURL,  theArray,  (char *)&inited,  v257,  v258);
                              v261 = v260;
                              if (v260)
                              {
                                v262 = (os_log_s *)resolveLog;
                                if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                                {
                                  *(_DWORD *)buf = 138412546;
                                  *(void *)&uint8_t buf[4] = v261;
                                  *(_WORD *)&buf[12] = 2112;
                                  *(void *)&buf[14] = v246;
                                  _os_log_debug_impl( &dword_182E77000,  v262,  OS_LOG_TYPE_DEBUG,  " --  on volume=%@ fileIDRefs=%@",  buf,  0x16u);
                                }

                                uint64_t v263 = resolveBookmarkByRelativePathFromFileIDOnGivenVolume( v312,  v314,  v313,  a4,  v261,  v246,  v248,  v256,  &v322);
                                CFTypeRef v186 = (CFTypeRef)v263;
                                a6 = v308;
                                if (!v322 && v263) {
                                  unsigned __int8 v322 = inited;
                                }
                                CFRelease(v261);
                                goto LABEL_539;
                              }

                              CFTypeRef v186 = 0LL;
LABEL_540:
                              if (userInfoValues) {
                                CFRelease(userInfoValues);
                              }
                              if (!(_DWORD)v261)
                              {
LABEL_548:
                                LODWORD(v10) = v313;
                                goto LABEL_554;
                              }

LABEL_543:
                              if (v248 >= 2)
                              {
                                --v248;
                                if (!v186) {
                                  continue;
                                }
                              }

                              goto LABEL_548;
                            }

                            CFTypeRef v186 = 0LL;
LABEL_539:
                            LODWORD(v261) = 1;
                            goto LABEL_540;
                          }

                          CFTypeRef v186 = 0LL;
LABEL_554:
                          CFRelease(v253);
                        }

                        else
                        {
                          v253 = (const __CFArray *)matchVolumeURLForBookmark( v314,  v10,  theArray,  (char *)&v322,  v251,  v252);
                          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                            CFURLCreateByResolvingDataInBookmark();
                          }
                          CFTypeRef v186 = (CFTypeRef)resolveBookmarkByRelativePathFromFileIDOnGivenVolume( v312,  v314,  v10,  a4,  v253,  v246,  0LL,  v248,  &v322);
                          a6 = v308;
                          if (v253) {
                            goto LABEL_554;
                          }
                        }

                        CFRelease(v246);
                        a1 = v312;
                      }

                      else
                      {
                        CFTypeRef v186 = 0LL;
                      }

                      if (v324 != v186)
                      {
                        if (v324) {
                          CFRelease(v324);
                        }
                        CFTypeRef v324 = v186;
                      }

                      if ((_DWORD)v10 != 1 || v186)
                      {
LABEL_382:
                        if (v186) {
                          goto LABEL_426;
                        }
                        goto LABEL_436;
                      }

                      if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                        CFURLCreateByResolvingDataInBookmark();
                      }
                      gotLoadHelper_x8__GSLibraryResolveDocumentId2(v264);
                      if (!*(void *)(v265 + 968))
                      {
                        CFTypeRef v186 = 0LL;
                        goto LABEL_590;
                      }

                      v266 = (const __CFString *)*MEMORY[0x1896052B8];
                      CFTypeID v267 = CFNumberGetTypeID();
                      CFNumberRef v268 = BookmarkData::copyItem(v314, v266, 1, v267);
                      if (!v268)
                      {
                        CFTypeRef v186 = 0LL;
                        goto LABEL_590;
                      }

                      CFNumberRef v271 = v268;
                      v272 = (const __CFURL *)matchVolumeURLForBookmark(v314, 1u, theArray, (char *)&v322, v269, v270);
                      if (!v272)
                      {
                        CFTypeRef v186 = 0LL;
                        goto LABEL_589;
                      }

                      v273 = v272;
                      if (volumeSupportsPathFromID((uint64_t)v272))
                      {
                        userInfoValues = 0LL;
                        if (!CFURLCopyResourcePropertyForKey( v273,  (CFStringRef)*MEMORY[0x189604D30],  &userInfoValues,  0LL)) {
                          goto LABEL_585;
                        }
                        if (userInfoValues)
                        {
                          if (CFNumberGetValue((CFNumberRef)userInfoValues, kCFNumberSInt32Type, &valuePtr))
                          {
                            if (CFNumberGetValue(v271, kCFNumberSInt64Type, &anURL))
                            {
                              uint64_t inited = GSLibraryResolveDocumentId2_delayInitStub(v274);
                              if (inited)
                              {
                                v275 = CFNumberCreate(a1, kCFNumberSInt64Type, &inited);
                                if (v275)
                                {
                                  v276 = v275;
                                  CFTypeRef v186 = _CFURLCreateWithVolumeURLAndResourceID(a1, v273, v275);
                                  v277 = (os_log_s *)resolveLog;
                                  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
                                  {
                                    *(_DWORD *)buf = 134218498;
                                    *(void *)&uint8_t buf[4] = a4;
                                    *(_WORD *)&buf[12] = 2112;
                                    *(void *)&buf[14] = v276;
                                    *(_WORD *)&buf[22] = 2112;
                                    *(void *)&buf[24] = v273;
                                    _os_log_debug_impl( &dword_182E77000,  v277,  OS_LOG_TYPE_DEBUG,  " -- Trying to match by targetFileID from documentID, options=%#lx fileID=%@ on volume %@",  buf,  0x20u);
                                  }

                                  if (!matchURLToBookmark(v314, 1u, (const __CFURL *)v186, (BOOL *)&v322, v278) && v186)
                                  {
                                    CFRelease(v186);
                                    CFTypeRef v186 = 0LL;
                                  }

                                  CFRelease(v276);
                                  a6 = v308;
                                  a1 = v312;
                                  LODWORD(v10) = v313;
LABEL_586:
                                  if (userInfoValues) {
                                    CFRelease(userInfoValues);
                                  }
LABEL_588:
                                  CFRelease(v273);
LABEL_589:
                                  CFRelease(v271);
LABEL_590:
                                  if (v324 != v186)
                                  {
                                    if (v324) {
                                      CFRelease(v324);
                                    }
                                    CFTypeRef v324 = v186;
                                  }

                                  goto LABEL_382;
                                }
                              }
                            }
                          }

LABEL_585:
                          CFTypeRef v186 = 0LL;
                          goto LABEL_586;
                        }
                      }

                      CFTypeRef v186 = 0LL;
                      goto LABEL_588;
                    }
                  }

                  if (v167) {
                    goto LABEL_608;
                  }
LABEL_605:
                  int v98 = 0;
                  LODWORD(v10) = v313;
                  if (Mutable) {
                    goto LABEL_477;
                  }
                  goto LABEL_478;
                }

                CFURLRef v73 = CFErrorCreate(a1, (CFErrorDomain)*MEMORY[0x189604F40], 4LL, 0LL);
                CFTypeRef v323 = v73;
              }

              a6 = v308;
              if (!v73
                || (CFErrorDomain Domain = CFErrorGetDomain((CFErrorRef)v73), !CFEqual(Domain, (CFTypeRef)*MEMORY[0x189604F50]))
                || CFErrorGetCode((CFErrorRef)v323) != -128)
              {
                BOOL v74 = 0;
                goto LABEL_203;
              }

              if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
                CFURLCreateByResolvingDataInBookmark();
              }
              ssize_t v17 = 0LL;
              int v98 = 0;
              if (Mutable) {
                goto LABEL_477;
              }
              goto LABEL_478;
            }

            if (v43) {
              goto LABEL_69;
            }
          }

LABEL_70:
          CFMutableArrayRef Mutable = theArray;
          CFArrayAppendValue(theArray, anURL);
        }
      }
    }

    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v39;
    _os_log_debug_impl( &dword_182E77000,  v41,  OS_LOG_TYPE_DEBUG,  "Checking volume for match to bookmark, volumeURL=%@",  buf,  0xCu);
    if (!v16) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }

  ssize_t v17 = 0LL;
LABEL_480:
  uint64_t ItemInTOC = BookmarkData::findItemInTOC(v11, 0x1003u, v10);
  if (ItemInTOC)
  {
    uint64_t v231 = ItemInTOC;
    CFTypeID v232 = CFStringGetTypeID();
    v233 = (const __CFString *)BookmarkData::copyItem(v11, v231, v232);
    if (v233)
    {
      v234 = v233;
      CFURLRef v235 = CFURLCreateWithString(a1, v233, 0LL);
      if (v324 != v235)
      {
        if (v324) {
          CFRelease(v324);
        }
        CFTypeRef v324 = v235;
      }

      CFRelease(v234);
    }
  }

  if (v324)
  {
LABEL_488:
    CFTypeID v236 = CFBooleanGetTypeID();
    v237 = BookmarkData::copyItem(v11, 0xD001u, v10, v236);
    if (v237)
    {
      v238 = v237;
      if (CFEqual(v237, (CFTypeRef)*MEMORY[0x189604DE8]))
      {
        v239 = (const __CFURL *)v324;
        if (v323)
        {
          CFRelease(v323);
          CFTypeRef v323 = 0LL;
        }

        *(void *)buf = CFURLCreateFileReferenceURL(a1, v239, (CFErrorRef *)&v323);
        CFReleaser<__CFData const*>::operator=(&v324, (CFTypeRef *)buf);
        if (*(void *)buf) {
          CFRelease(*(CFTypeRef *)buf);
        }
      }

      CFRelease(v238);
    }
  }

            a2 = 256LL;
            goto LABEL_2;
          }

          a2 = 257LL;
          goto LABEL_2;
        }
      }
    }

        if ((v24 & 0xFFDF) == 0x41)
        {
          BOOL v35 = v23 + 1;
          if (v49)
          {
            uint64_t v36 = v49[v51 + v35];
          }

          else if (v50)
          {
            uint64_t v36 = v50[v51 + v35];
          }

          else
          {
            if (v54 <= v35 || (uint64_t v40 = v53, v53 > v35))
            {
              v41.CFIndex location = v51;
              if (v52 >= 64) {
                v41.CFIndex length = 64LL;
              }
              else {
                v41.CFIndex length = v52;
              }
              uint64_t v53 = 0LL;
              uint64_t v54 = v41.length;
              CFStringGetCharacters(theString, v41, buffer);
              uint64_t v40 = v53;
            }

            uint64_t v36 = buffer[v35 - v40];
          }

          if ((v36 & 0xFFDF) == 0x50)
          {
            int v42 = v23 | 2;
            if (v49)
            {
              uint64_t v43 = v49[v51 + v42];
            }

            else if (v50)
            {
              uint64_t v43 = v50[v51 + v42];
            }

            else
            {
              if (v54 <= v42 || (uint64_t v44 = v53, v53 > v42))
              {
                v45.CFIndex location = v51;
                if (v52 >= 64) {
                  v45.CFIndex length = 64LL;
                }
                else {
                  v45.CFIndex length = v52;
                }
                uint64_t v53 = 0LL;
                uint64_t v54 = v45.length;
                CFStringGetCharacters(theString, v45, buffer);
                uint64_t v44 = v53;
              }

              uint64_t v43 = buffer[v42 - v44];
            }

            if ((v43 & 0xFFDF) == 0x50)
            {
LABEL_104:
              *(_WORD *)(a2 + 4) = 3;
              *(_DWORD *)a2 |= 0x8000000u;
              goto LABEL_105;
            }
          }
        }

        uint64_t v25 = v30;
        goto LABEL_35;
      }

      uint64_t v45 = v82;
      if (CFEqual(*v29, v82))
      {
        if (v88)
        {
          CFIndex v46 = MountInfoPrepare(&v96, v88, v83, v89, 0LL, v92, v84);
          a2 = v90;
          if (!v46) {
            goto LABEL_115;
          }
          MountPoint = (char *)MountInfoGetMountPoint((uint64_t)v96);
          if (MountPoint)
          {
LABEL_65:
            CFStringRef v97 = xmmword_182EA5350;
            int v98 = 0LL;
            CFTypeID v48 = filtered_getattrlist(MountPoint, &v97, &v99, 0x24uLL, 0x21u);
            uint64_t v43 = 0LL;
            uint64_t v36 = v82;
            if (v48) {
              goto LABEL_105;
            }
            if ((v99.f_bfree & 0x20000000000000LL) != 0)
            {
              uint64_t v49 = (v99.f_iosize & 0x200000) == 0;
LABEL_102:
              if (v49) {
                uint64_t v43 = v75;
              }
              else {
                uint64_t v43 = v76;
              }
LABEL_105:
              BOOL v35 = a2;
              goto LABEL_55;
            }

LABEL_495:
  CFTypeRef v240 = v324;
  if (!a6 || v324)
  {
    if (a5 && v324)
    {
      *(_BYTE *)a5 = v322;
      goto LABEL_504;
    }
  }

  else
  {
    CFTypeRef v241 = v323;
    CFTypeRef v323 = 0LL;
    *(void *)a6 = v241;
  }

  if (a7 && !v240)
  {
    *a7 = v17;
    ssize_t v17 = 0LL;
  }

LABEL_504:
  CFTypeRef v324 = 0LL;
  if (v323) {
    CFRelease(v323);
  }
  if (v17) {
    CFRelease(v17);
  }
  if (v324) {
    CFRelease(v324);
  }
  return v240;
}

void releaseBookmarkExtension(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (a1 >= 1 && sandbox_extension_release())
  {
    dispatch_group_t v2 = (os_log_s *)resolveLog;
    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_INFO))
    {
      int v3 = *__error();
      int v4 = 134218240;
      uint64_t v5 = a1;
      __int16 v6 = 1024;
      int v7 = v3;
      _os_log_impl( &dword_182E77000,  v2,  OS_LOG_TYPE_INFO,  "failed to release sandbox extension handle %lld, error=%{errno}d",  (uint8_t *)&v4,  0x12u);
    }
  }

unsigned int *getBookmarkSandboxExtensionForTag(BookmarkData *a1, unsigned int a2, unsigned int *a3)
{
  CFNumberRef result = BookmarkData::getMisalignedItemDataPtr(a1, a2, 0, 1, a3);
  if (result)
  {
    if (*a3 && (v5 = result, uint64_t v6 = *a3 - 1, !*((_BYTE *)result + v6)))
    {
      else {
        return 0LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

CFTypeRef matchVolumeURLForBookmark( BookmarkData *a1, unsigned int a2, CFArrayRef theArray, char *a4, const __CFArray *a5, unsigned __int8 *a6)
{
  uint64_t v66 = *MEMORY[0x1895F89C0];
  CFTypeRef cf = 0LL;
  CFIndex Count = CFArrayGetCount(theArray);
  CFTypeID TypeID = CFStringGetTypeID();
  BOOL v11 = (__CFString *)BookmarkData::copyItem(a1, 0x2010u, a2, TypeID);
  CFTypeID v12 = CFURLGetTypeID();
  uint64_t v13 = (__CFString *)BookmarkData::copyItem(a1, 0x2050u, a2, v12);
  CFTypeID v14 = CFStringGetTypeID();
  int v15 = (__CFString *)BookmarkData::copyItem(a1, 0x2011u, a2, v14);
  CFTypeID v16 = CFNumberGetTypeID();
  ssize_t v17 = (__CFString *)BookmarkData::copyItem(a1, 0x2012u, a2, v16);
  CFTypeID v18 = CFDateGetTypeID();
  CFURLRef v19 = (__CFString *)BookmarkData::copyItem(a1, 0x2013u, a2, v18);
  BOOL URLVolumeProperties = BookmarkData::getURLVolumeProperties(a1, a2, (uint64_t)&v55);
  if (v15)
  {
    if (Count >= 1)
    {
      uint64_t v47 = v11;
      char v50 = v17;
      CFTypeID v21 = v19;
      CFIndex v22 = 0LL;
      BOOL v23 = (const __CFString *)*MEMORY[0x189605678];
      while (1)
      {
        CFTypeRef v24 = cf;
        if (cf) {
          break;
        }
        CFTypeRef ValueAtIndex = CFArrayGetValueAtIndex(theArray, v22);
        if (matchURLProperty((const __CFURL *)ValueAtIndex, v23, v15))
        {
          if (ValueAtIndex) {
            CFRetain(ValueAtIndex);
          }
          if (cf != ValueAtIndex)
          {
            if (cf) {
              CFRelease(cf);
            }
            CFTypeRef cf = ValueAtIndex;
          }

          int v26 = (os_log_s *)resolveLog;
          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            CFTypeRef v59 = ValueAtIndex;
            __int16 v60 = 2112;
            CFArrayRef v61 = v15;
            _os_log_debug_impl(&dword_182E77000, v26, OS_LOG_TYPE_DEBUG, "matched volume %@ by uuid %@", buf, 0x16u);
          }
        }

        if (Count == ++v22) {
          goto LABEL_34;
        }
      }

LABEL_31:
      char v31 = 0;
      BOOL v11 = v47;
      CFURLRef v19 = v21;
      goto LABEL_32;
    }

    goto LABEL_62;
  }

  if (v13)
  {
    if (Count >= 1)
    {
      uint64_t v47 = v11;
      char v50 = v17;
      CFTypeID v21 = v19;
      CFIndex v27 = 0LL;
      uint64_t v28 = (const __CFString *)*MEMORY[0x189605668];
      while (1)
      {
        CFTypeRef v24 = cf;
        if (cf) {
          goto LABEL_31;
        }
        CFTypeRef v29 = CFArrayGetValueAtIndex(theArray, v27);
        if (matchURLProperty((const __CFURL *)v29, v28, v13))
        {
          if (v29) {
            CFRetain(v29);
          }
          if (cf != v29)
          {
            if (cf) {
              CFRelease(cf);
            }
            CFTypeRef cf = v29;
          }

          BOOL v30 = (os_log_s *)resolveLog;
          if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            CFTypeRef v59 = v29;
            __int16 v60 = 2112;
            CFArrayRef v61 = v13;
            _os_log_debug_impl( &dword_182E77000,  v30,  OS_LOG_TYPE_DEBUG,  "matched volume %@ by VolumeMountURL %@",  buf,  0x16u);
          }
        }

        if (Count == ++v27)
        {
LABEL_34:
          CFTypeRef v24 = cf;
          CFURLRef v19 = v21;
          unsigned int v32 = a4;
          if (!cf)
          {
            BOOL v11 = v47;
            ssize_t v17 = v50;
            goto LABEL_89;
          }

          char v31 = 0;
          BOOL v11 = v47;
          if (!a4) {
            goto LABEL_87;
          }
          goto LABEL_36;
        }
      }
    }

      ++v15;
      MountInfoDestroy(v39);
      a2 += 1024;
      p_forkattr = v23;
    }

    while (v15 < a3);
  }

  if (v14) {
    free(v14);
  }
  *(void *)(a1 + 88) = 0LL;
}

LABEL_36:
    if (v24)
    {
      ssize_t v17 = v50;
      if (!*v32) {
        char *v32 = v31;
      }
      goto LABEL_88;
    }

    goto LABEL_87;
  }

  unsigned int v46 = 0LL;
LABEL_37:
  CFRelease(v26);
  if (v53 && !v37)
  {
    uint64_t v47 = __n;
    CFTypeID v48 = (CFErrorRef *)v53;
    uint64_t v49 = (const __CFString *)CFURLCreateFromFileSystemRepresentation(v24, v54, v47, 0);
    __CFString *v48 = _FSURLCreateStandardError(v24, (const __CFString *)*MEMORY[0x189604F58], v46, 0, v49, 0LL);
    if (v49) {
      CFRelease(v49);
    }
    return 0LL;
  }

  return v37;
}

  if ((v16 & 0x800) != 0)
  {
    CFIndex v38 = *v30;
    CFURLRef v39 = v30[1];
    v30 += 2;
    uint64_t v37 = (double)v38 - *MEMORY[0x189604DA8] + (double)v39 * 0.000000001;
  }

  else
  {
    uint64_t v37 = -*MEMORY[0x189604DA8];
  }

  *(double *)(a6 + 72) = v37;
  if ((v10 & 0x1000) != 0)
  {
LABEL_40:
    if ((v16 & 0x1000) != 0)
    {
      CFTypeRef v41 = *v30;
      int v42 = v30[1];
      v30 += 2;
      uint64_t v40 = (double)v41 - *MEMORY[0x189604DA8] + (double)v42 * 0.000000001;
    }

    else
    {
      uint64_t v40 = -*MEMORY[0x189604DA8];
    }

    *(double *)(a6 + 56) = v40;
  }

LABEL_89:
  if (v19) {
    CFRelease(v19);
  }
  if (v17) {
    CFRelease(v17);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v24;
}

uint64_t fileIDsMatch(BookmarkData *a1, unsigned int a2, const __CFURL *a3)
{
  CFTypeID TypeID = CFNumberGetTypeID();
  int v7 = BookmarkData::copyItem(a1, 0x1030u, a2, TypeID);
  if (v7)
  {
LABEL_2:
    if (volumeSupportsPersistentIDs((uint64_t)a3))
    {
      CFTypeRef propertyValueTypeRefPtr = 0LL;
      if (!CFURLCopyResourcePropertyForKey(a3, (CFStringRef)*MEMORY[0x189604C10], &propertyValueTypeRefPtr, 0LL))
      {
        uint64_t v8 = 0LL;
LABEL_16:
        if (propertyValueTypeRefPtr) {
          CFRelease(propertyValueTypeRefPtr);
        }
        goto LABEL_18;
      }

      if (propertyValueTypeRefPtr)
      {
        uint64_t v8 = CFEqual(v7, propertyValueTypeRefPtr);
        goto LABEL_16;
      }
    }

    uint64_t v8 = 0LL;
LABEL_18:
    CFRelease(v7);
    return v8;
  }

  CFTypeID v9 = CFArrayGetTypeID();
  uint64_t v10 = (const __CFArray *)BookmarkData::copyItem(a1, 0x1005u, a2, v9);
  if (v10)
  {
    BOOL v11 = v10;
    if (CFArrayGetCount(v10) >= 1)
    {
      CFIndex Count = CFArrayGetCount(v11);
      CFTypeRef ValueAtIndex = CFArrayGetValueAtIndex(v11, Count - 1);
      if (ValueAtIndex)
      {
        CFTypeID v14 = ValueAtIndex;
        CFTypeID v15 = CFGetTypeID(ValueAtIndex);
        if (v15 == CFNumberGetTypeID())
        {
          CFTypeRef v16 = CFRetain(v14);
          if (v16)
          {
            int v7 = v16;
            CFRelease(v11);
            goto LABEL_2;
          }
        }
      }
    }

    CFRelease(v11);
  }

  return volumeSupportsPersistentIDs((uint64_t)a3) ^ 1;
}

BOOL matchURLProperty(const __CFURL *a1, const __CFString *a2, CFTypeRef a3)
{
  CFTypeRef propertyValueTypeRefPtr = 0LL;
  if (!CFURLCopyResourcePropertyForKey(a1, a2, &propertyValueTypeRefPtr, 0LL)) {
    goto LABEL_8;
  }
  if (propertyValueTypeRefPtr == a3)
  {
    BOOL v4 = 1LL;
    if (!a3) {
      return v4;
    }
    goto LABEL_10;
  }

  BOOL v4 = 0LL;
  if (a3 && propertyValueTypeRefPtr)
  {
    CFTypeID v5 = CFGetTypeID(a3);
    if (v5 == CFGetTypeID(propertyValueTypeRefPtr))
    {
      if (v5 == CFURLGetTypeID()) {
        int v6 = sameFileURL(a3, propertyValueTypeRefPtr);
      }
      else {
        int v6 = CFEqual(a3, propertyValueTypeRefPtr);
      }
      BOOL v4 = v6 != 0;
      goto LABEL_9;
    }

LABEL_8:
    BOOL v4 = 0LL;
  }

        MutableCFDictionaryRef Copy = CFArrayCreateMutable(a1, 0LL, MEMORY[0x189605228]);
        v7[5] = MutableCopy;
        if ((v7[4] & 2) == 0) {
          goto LABEL_12;
        }
        goto LABEL_9;
      }
    }

    else
    {
      v6[5] = 0LL;
      v6[6] = 0LL;
      CFTypeID v9 = (CFArrayRef *)(v6 + 5);
      if ((a2 & 6) != 0) {
        goto LABEL_8;
      }
    }

LABEL_9:
  a3 = propertyValueTypeRefPtr;
  if (propertyValueTypeRefPtr) {
LABEL_10:
  }
    CFRelease(a3);
  return v4;
}

  _FSURLTranslateDomainAndCodeToCocoaError(a2, a3, a4, &code);
  CFTypeID v18 = (const __CFString *)*MEMORY[0x189604F40];
  if ((const __CFString *)*MEMORY[0x189604F40] == a2)
  {
    CFURLRef v19 = 0LL;
    if (v13)
    {
LABEL_11:
      userInfoKeys[0] = *(void **)MEMORY[0x189604F80];
      userInfoValues[0] = v13;
      uint64_t v20 = 1LL;
      if (!v7) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }

  else
  {
    CFURLRef v19 = CFErrorCreate(a1, a2, a3, 0LL);
    if (v13) {
      goto LABEL_11;
    }
  }

  uint64_t v20 = 0LL;
  if (v7)
  {
LABEL_12:
    userInfoKeys[v20] = (void *)*MEMORY[0x189604F60];
    userInfoValues[v20++] = (void *)v7;
  }

    ++a5;
    ++a4;
    ++a3;
    --v8;
  }

  while (v8);
  if (!v12) {
    return 1LL;
  }
  if (!a8) {
    return 0LL;
  }
  CFIndex v22 = CFGetAllocator(a1);
  BOOL v23 = _FSURLCreateStandardError(v22, (const __CFString *)*MEMORY[0x189604F58], 45LL, 1, a1, 0LL);
  CFNumberRef result = 0LL;
  *a8 = v23;
  return result;
}

          BOOL v11 = CFArrayGetCount(MutableCopy);
          CFTypeID v12 = (const void *)*MEMORY[0x189605390];
          if (!v11
            || (v18.CFIndex length = v11 - 1,
                v18.CFIndex location = 0LL,
                !CFArrayContainsValue(*v9, v18, (const void *)*MEMORY[0x189605390])))
          {
            CFArrayAppendValue(*v9, v12);
          }

          goto LABEL_12;
        }

uint64_t volumeSupportsPersistentIDs(uint64_t result)
{
  if (result)
  {
    CFNumberRef result = _CFURLGetVolumePropertyFlags();
    if ((_DWORD)result) {
      return 0LL;
    }
  }

  return result;
}

const void *copyHomeFolderURLForUser(const __CFAllocator *a1, unint64_t a2, const __CFString *a3)
{
  if (a1
    || (BOOL v4 = (const void *)copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sUserHomeFolderURL) == 0LL)
  {
    uint64_t v5 = CFCopyHomeDirectoryURLForUser();
    BOOL v4 = (const void *)v5;
    if (!a1 && v5)
    {
      if (copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sUserHomeFolderURL)
      {
        CFRelease((CFTypeRef)copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sUserHomeFolderURL);
        copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sUserHomeFolderURL = 0LL;
      }

      CFRetain(v4);
      copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sUserHomeFolderURL = (uint64_t)v4;
    }
  }

  else
  {
    CFRetain((CFTypeRef)copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sUserHomeFolderURL);
  }

  pthread_mutex_unlock(&copyHomeFolderURLForUser(__CFAllocator const*,unsigned long,__CFString const*)::sCopyHomeFolderLock);
  return v4;
}

BOOL isDirectory(BookmarkData *a1, int a2)
{
  BOOL result = BookmarkData::getURLResourceProperties(a1, a2, (uint64_t)v3);
  if (result)
  {
    if ((v3[8] & 2) != 0) {
      return (v3[0] >> 1) & 1;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

BOOL matchURLToBookmark(BookmarkData *a1, unsigned int a2, const __CFURL *a3, BOOL *a4, const __CFURL **a5)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  BOOL URLResourceProperties = BookmarkData::getURLResourceProperties(a1, a2, (uint64_t)&v17);
  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
  {
    matchURLToBookmark();
    if (!a3) {
      return 0LL;
    }
  }

  else if (!a3)
  {
    return 0LL;
  }

  propertyValueTypeRefPtr[1] = 0LL;
  uint64_t v16 = 0LL;
  int v10 = v18 & 0xF;
  if (URLResourceProperties)
  {
    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
      matchURLToBookmark();
    }
  }

  else if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG))
  {
    matchURLToBookmark();
  }

  CFStringRef string = 0LL;
  propertyValueTypeRefPtr[0] = 0LL;
  if (!CFURLCopyResourcePropertyForKey(a3, (CFStringRef)*MEMORY[0x189605448], propertyValueTypeRefPtr, 0LL)
    || !CFURLCopyResourcePropertyForKey(a3, (CFStringRef)*MEMORY[0x189605298], &string, 0LL))
  {
    goto LABEL_23;
  }

  CFStringRef v12 = propertyValueTypeRefPtr[0];
  if (!propertyValueTypeRefPtr[0] || !string)
  {
    if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
      matchURLToBookmark();
    }
LABEL_23:
    int v13 = 1;
    goto LABEL_24;
  }

  if (propertyValueTypeRefPtr[0] == string)
  {
    int v13 = 1;
    goto LABEL_25;
  }

  CFStringGetFileSystemRepresentation(propertyValueTypeRefPtr[0], buffer, 1024LL);
  CFStringGetFileSystemRepresentation(string, __s2, 1024LL);
  if (!strcmp(buffer, __s2)) {
    goto LABEL_23;
  }
  if (os_log_type_enabled((os_log_t)resolveLog, OS_LOG_TYPE_DEBUG)) {
    matchURLToBookmark();
  }
  int v13 = 0;
LABEL_24:
  CFStringRef v12 = string;
  if (string) {
LABEL_25:
  }
    CFRelease(v12);
  if (propertyValueTypeRefPtr[0]) {
    CFRelease(propertyValueTypeRefPtr[0]);
  }
  BOOL result = v13 != 0;
  if (a4 && v13)
  {
    if (!*a4) {
      *a4 = fileIDsMatch(a1, a2, a3) == 0;
    }
    return 1LL;
  }

  return result;
}

CFArrayRef ___ZL27copyVolumesArrayForBookmarkPK13__CFAllocatorR12BookmarkDataj_block_invoke()
{
  values[2] = *(void **)MEMORY[0x1895F89C0];
  uint64_t v0 = (void *)*MEMORY[0x189605678];
  values[0] = *(void **)MEMORY[0x189605560];
  values[1] = v0;
  CFArrayRef result = CFArrayCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (const void **)values, 2LL, MEMORY[0x189605228]);
  copyVolumesArrayForBookmark(__CFAllocator const*,BookmarkData &,unsigned int)::sPropertyKeys = (uint64_t)result;
  return result;
}

void CFNumber::CFNumber(CFNumber *this, CFTypeRef *a2)
{
  if (*a2 && (CFTypeID v4 = CFGetTypeID(*a2), v4 == CFNumberGetTypeID()))
  {
    CFTypeRef v5 = *a2;
    if (v5) {
      CFRetain(v5);
    }
  }

  else
  {
    CFTypeRef v5 = 0LL;
  }

  *(void *)this = v5;
}

uint64_t volumeSupportsPathFromID(uint64_t result)
{
  if (result)
  {
    CFArrayRef result = _CFURLGetVolumePropertyFlags();
    if ((_DWORD)result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t resolveBookmarkByRelativePathFromFileIDOnGivenVolume( const __CFAllocator *a1, BookmarkData *a2, unsigned int a3, unint64_t a4, const __CFURL *a5, const __CFArray *a6, uint64_t a7, uint64_t a8, unsigned __int8 *a9)
{
  if (a5) {
    _CFURLGetResourcePropertyFlags();
  }
  return 0LL;
}

void ___ZL25DownloadCloudDocumentSyncPK7__CFURL_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  int v7 = (os_log_s *)bmarkLog;
  if (os_log_type_enabled((os_log_t)bmarkLog, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 136315650;
    int v10 = "DownloadCloudDocumentSync";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = a3;
    _os_log_impl(&dword_182E77000, v7, OS_LOG_TYPE_INFO, "%s: finished %@, error=%@", (uint8_t *)&v9, 0x20u);
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a3 == 0;
  (*(void (**)(uint64_t))(a4 + 16))(a4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_5( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void OUTLINED_FUNCTION_10( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void initGlobalsOnce(void)
{
}

void ___Z15initGlobalsOncev_block_invoke()
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  init_logging();
  size_t v10 = 16LL;
  if (sysctlbyname("kern.osproductversion", buf, &v10, 0LL, 0LL)
    || bswap32(*(unsigned int *)buf) == 825241137 && 53 == v12)
  {
    int v0 = 252;
  }

  else
  {
    int v0 = 8188;
  }

  v1.i64[0] = 0x3FF0BFFFFFLL;
  v1.i32[2] = 14335;
  v1.i32[3] = v0;
  uint64_t v2 = 8u;
  do
  {
    *(int8x16_t *)((char *)&corePropertyAttrListTable + v2) = vandq_s8( *(int8x16_t *)((char *)&corePropertyAttrListTable + v2),  v1);
    v2 += 24LL;
  }

  while (v2 != 224);
  sFileProviderGlobals[0] = _FileCacheInitClass();
  int v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  qword_18C4639F8 = (uint64_t)CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  0LL);
  qword_18C463A08 = (uint64_t)CFArrayCreateMutable(v3, 0LL, MEMORY[0x189605228]);
  CFTypeID v4 = (os_log_s *)defaultLog;
  BOOL v5 = os_signpost_enabled((os_log_t)defaultLog);
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( &dword_182E77000,  v4,  OS_SIGNPOST_INTERVAL_BEGIN,  0xEEEEB0B5B2B2EEEELL,  "Register Property Providers",  "",  buf,  2u);
  }

  registerCoreProperties(v5);
  registerPathURLProperties(v6);
  registerVolumeProperties(v7);
  uint64_t v8 = _LSRegisterFilePropertyProvider();
  registerExternalProviderProperties(v8);
  int v9 = (os_log_s *)defaultLog;
  if (os_signpost_enabled((os_log_t)defaultLog))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( &dword_182E77000,  v9,  OS_SIGNPOST_INTERVAL_END,  0xEEEEB0B5B2B2EEEELL,  "Register Property Providers",  "",  buf,  2u);
  }

void registerCoreProperties(uint64_t a1)
{
  v22[69] = *(const __CFString **)MEMORY[0x1895F89C0];
  {
    registerCoreProperties(void)::corePropertyTable = *MEMORY[0x189605378];
    *(_OWORD *)&qword_18C4640B8 = xmmword_182EA5200;
    uint64_t v6 = *MEMORY[0x189605438];
    qword_18C4640C8 = (uint64_t)createIsDirectoryValue;
    qword_18C4640D0[0] = v6;
    *(_OWORD *)&qword_18C4640D0[1] = xmmword_182EA5200;
    uint64_t v7 = *MEMORY[0x189605390];
    qword_18C4640E8 = (uint64_t)createNameValue;
    unk_18C4640F0 = v7;
    unk_18C4640F8 = xmmword_182EA5210;
    uint64_t v8 = *MEMORY[0x1896053E0];
    qword_18C464108 = (uint64_t)createIsHiddenValue;
    unk_18C464110 = v8;
    unk_18C464118 = xmmword_182EA5200;
    uint64_t v9 = *MEMORY[0x1896053D0];
    qword_18C464128 = (uint64_t)createIsUserImmutableValue;
    unk_18C464130 = v9;
    unk_18C464138 = xmmword_182EA5200;
    uint64_t v10 = *MEMORY[0x189605408];
    qword_18C464148 = (uint64_t)createIsSystemImmutableValue;
    unk_18C464150 = v10;
    unk_18C464158 = xmmword_182EA5200;
    uint64_t v11 = *MEMORY[0x189604C90];
    qword_18C464168 = (uint64_t)createLinkCountValue;
    unk_18C464170 = v11;
    qword_18C464178 = 0LL;
    unk_18C464180 = 0LL;
    uint64_t v12 = *MEMORY[0x189604C68];
    qword_18C464188 = (uint64_t)createIsSystemNoUnlinkValue;
    unk_18C464190 = v12;
    qword_18C464198 = 0LL;
    unk_18C4641A0 = 0LL;
    uint64_t v13 = *MEMORY[0x189604C70];
    qword_18C4641A8 = (uint64_t)createIsRestrictedValue;
    unk_18C4641B0 = v13;
    qword_18C4641B8 = 0LL;
    unk_18C4641C0 = 0LL;
    uint64_t v14 = *MEMORY[0x189604C98];
    qword_18C4641C8 = (uint64_t)createIsSystemAppendValue;
    unk_18C4641D0 = v14;
    qword_18C4641D8 = 0LL;
    unk_18C4641E0 = 0LL;
    uint64_t v15 = *MEMORY[0x189605260];
    qword_18C4641E8 = (uint64_t)createIsUserAppendValue;
    unk_18C4641F0 = v15;
    unk_18C4641F8 = xmmword_182EA5200;
    uint64_t v16 = *MEMORY[0x189605340];
    qword_18C464208 = (uint64_t)createAddedToDirectoryDateValue;
    unk_18C464210 = v16;
    unk_18C464218 = xmmword_182EA5220;
    uint64_t v17 = *MEMORY[0x1896053B8];
    qword_18C464228 = (uint64_t)createFileSizeValue;
    unk_18C464230 = v17;
    unk_18C464238 = xmmword_182EA5200;
    uint64_t v18 = *MEMORY[0x1896053C8];
    qword_18C464248 = (uint64_t)createIsRegularFileValue;
    unk_18C464250 = v18;
    unk_18C464258 = xmmword_182EA5200;
    uint64_t v19 = *MEMORY[0x189605368];
    qword_18C464268 = (uint64_t)createIsSymbolicLinkValue;
    unk_18C464270 = v19;
    unk_18C464278 = xmmword_182EA5210;
    uint64_t v20 = *MEMORY[0x1896053E8];
    qword_18C464288 = (uint64_t)createIsAliasFileValue;
    unk_18C464290 = v20;
    unk_18C464298 = xmmword_182EA5200;
    uint64_t v21 = *MEMORY[0x1896052C0];
    qword_18C4642A8 = (uint64_t)createIsVolumeValue;
    unk_18C4642B0 = v21;
    unk_18C4642B8 = xmmword_182EA5220;
    qword_18C4642C8 = (uint64_t)createFileAllocatedSizeValue;
    qword_18C4642D0 = *MEMORY[0x189604C20];
    unk_18C4642D8 = vdupq_n_s64(2uLL);
    qword_18C4642E8 = (uint64_t)createFinderInfoValue;
    qword_18C4642F0 = *MEMORY[0x189604C18];
    unk_18C4642F8 = xmmword_182EA5230;
    qword_18C464308 = (uint64_t)createFileSizeOfResourceForkValue;
    qword_18C464310 = *MEMORY[0x189604C00];
    unk_18C464318 = xmmword_182EA5230;
    qword_18C464328 = (uint64_t)createFileAllocatedSizeOfResourceForkValue;
    qword_18C464330 = *MEMORY[0x189604C48];
    qword_18C464338 = 0LL;
    qword_18C464340 = 0LL;
    qword_18C464348 = (uint64_t)createIsCompressedValue;
    qword_18C464350 = *MEMORY[0x189604CF8];
    unk_18C464358 = xmmword_182EA5240;
    qword_18C464368 = (uint64_t)createParentDirectoryIsVolumeRoot;
    qword_18C464370 = *MEMORY[0x189604C10];
    unk_18C464378 = xmmword_182EA5240;
    qword_18C464388 = (uint64_t)createFileIDValue;
    qword_18C464390 = *MEMORY[0x1896052A8];
    unk_18C464398 = xmmword_182EA5200;
    qword_18C4643A8 = (uint64_t)createContentModificationDateValue;
    qword_18C4643B0 = *MEMORY[0x189605268];
    unk_18C4643B8 = xmmword_182EA5200;
    qword_18C4643C8 = (uint64_t)createAttributeModificationDateValue;
    qword_18C4643D0 = *MEMORY[0x1896052B0];
    unk_18C4643D8 = xmmword_182EA5200;
    qword_18C4643E8 = (uint64_t)createCreationDateValue;
    qword_18C4643F0 = *MEMORY[0x189605360];
    unk_18C4643F8 = xmmword_182EA5210;
    qword_18C464408 = (uint64_t)createHasHiddenExtensionValue;
    qword_18C464410 = *MEMORY[0x1896053B0];
    unk_18C464418 = vdupq_n_s64(1uLL);
    qword_18C464428 = (uint64_t)createIsReadableValue;
    qword_18C464430 = *MEMORY[0x1896053F0];
    unk_18C464438 = unk_18C464418;
    qword_18C464448 = (uint64_t)createIsWriteableValue;
    qword_18C464450 = *MEMORY[0x189605388];
    unk_18C464458 = unk_18C464418;
    qword_18C464468 = (uint64_t)createIsExecutableValue;
    qword_18C464470 = *MEMORY[0x189605400];
    unk_18C464478 = xmmword_182EA5210;
    qword_18C464488 = (uint64_t)createLabelNumberValue;
    qword_18C464490 = *MEMORY[0x189605338];
    unk_18C464498 = xmmword_182EA5250;
    qword_18C4644A8 = (uint64_t)createFileSecurityValue;
    qword_18C4644B0 = *MEMORY[0x189605300];
    unk_18C4644B8 = xmmword_182EA5200;
    qword_18C4644C8 = (uint64_t)createFileProtectionValue;
    qword_18C4644D0 = *MEMORY[0x1896052A0];
    unk_18C4644D8 = xmmword_182EA5200;
    qword_18C4644E8 = (uint64_t)createContentAccessDateValue;
    qword_18C4644F0 = *MEMORY[0x189605470];
    unk_18C4644F8 = xmmword_182EA5260;
    qword_18C464508 = (uint64_t)createTotalFileSizeValue;
    qword_18C464510 = *MEMORY[0x189605468];
    unk_18C464518 = xmmword_182EA5260;
    qword_18C464528 = (uint64_t)createTotalFileAllocatedSizeValue;
    qword_18C464530 = *MEMORY[0x189605310];
    unk_18C464538 = xmmword_182EA5270;
    qword_18C464548 = (uint64_t)createFileResourceIdentifierValue;
    qword_18C464550 = *MEMORY[0x189605348];
    unk_18C464558 = xmmword_182EA5270;
    qword_18C464568 = (uint64_t)createGenerationIdentifierValue;
    qword_18C464570 = *MEMORY[0x1896052B8];
    unk_18C464578 = xmmword_182EA5200;
    qword_18C464588 = (uint64_t)createDocumentIdentifierValue;
    qword_18C464590 = *MEMORY[0x189605318];
    unk_18C464598 = xmmword_182EA5200;
    qword_18C4645A8 = (uint64_t)createFileResourceTypeValue;
    qword_18C4645B0 = *MEMORY[0x189605450];
    unk_18C4645B8 = xmmword_182EA5200;
    qword_18C4645C8 = (uint64_t)createPreferredIOBlockSizeValue;
    qword_18C4645D0 = *MEMORY[0x189605398];
    unk_18C4645D8 = xmmword_182EA5200;
    qword_18C4645E8 = (uint64_t)createIsMountTriggerValue;
    qword_18C4645F0 = *MEMORY[0x189605298];
    unk_18C4645F8 = xmmword_182EA5280;
    qword_18C464608 = (uint64_t)createCanonicalPathValue;
    qword_18C464610 = *MEMORY[0x1896052E0];
    unk_18C464618 = xmmword_182EA5240;
    qword_18C464628 = (uint64_t)createInodeNumberValue;
    qword_18C464630 = *MEMORY[0x1896052C8];
    unk_18C464638 = xmmword_182EA5240;
    qword_18C464648 = (uint64_t)createFileContentIdentifierValue;
    qword_18C464650 = *MEMORY[0x189605430];
    qword_18C464660 = 0LL;
    qword_18C464658 = 0LL;
    qword_18C464668 = (uint64_t)createMayShareFileContentValue;
    qword_18C464670 = *MEMORY[0x189605428];
    qword_18C464680 = 0LL;
    qword_18C464678 = 0LL;
    qword_18C464688 = (uint64_t)createMayHaveExtendedAttributesValue;
    qword_18C464690 = *MEMORY[0x1896053A8];
    qword_18C464698 = 0LL;
    qword_18C4646A0 = 0LL;
    qword_18C4646A8 = (uint64_t)createIsPurgeableValue;
    qword_18C4646B0 = *MEMORY[0x1896053C0];
    qword_18C4646B8 = 0LL;
    qword_18C4646C0 = 0LL;
    qword_18C4646C8 = (uint64_t)createIsSparseValue;
    qword_18C4646D0 = (uint64_t)@"NSURLDirectoryEntryCountKey";
    unk_18C4646D8 = xmmword_182EA5290;
    qword_18C4646E8 = (uint64_t)createDirectoryEntryCountValue;
    qword_18C4646F0 = *MEMORY[0x189604BF8];
    unk_18C4646F8 = xmmword_182EA52A0;
    qword_18C464708 = (uint64_t)createFaultLogicalFileIsHiddenValue;
    qword_18C464710 = *MEMORY[0x189604CE0];
    qword_18C464718 = 0LL;
    qword_18C464720 = 0LL;
    qword_18C464728 = (uint64_t)createNameExtensionValue;
    qword_18C464730 = *MEMORY[0x189604D68];
    qword_18C464740 = 0LL;
    qword_18C464738 = 0LL;
    qword_18C464748 = (uint64_t)createVolumeIsHFSStandardValue;
    qword_18C464750 = *MEMORY[0x189604CA8];
    qword_18C464758 = 0LL;
    qword_18C464760 = 0LL;
    qword_18C464768 = (uint64_t)createIsUserNoDumpValue;
    qword_18C464770 = *MEMORY[0x189604CB0];
    qword_18C464778 = 0LL;
    qword_18C464780 = 0LL;
    qword_18C464788 = (uint64_t)createIsUserOpaqueValue;
    qword_18C464790 = *MEMORY[0x189604CB8];
    qword_18C464798 = 0LL;
    qword_18C4647A0 = 0LL;
    qword_18C4647A8 = (uint64_t)createIsUserTrackedValue;
    qword_18C4647B0 = *MEMORY[0x189604CA0];
    qword_18C4647B8 = 0LL;
    qword_18C4647C0 = 0LL;
    qword_18C4647C8 = (uint64_t)createIsUserDataVaultValue;
    qword_18C4647D0 = *MEMORY[0x189604C78];
    qword_18C4647E0 = 0LL;
    qword_18C4647D8 = 0LL;
    qword_18C4647E8 = (uint64_t)createIsSystemArchivedValue;
    qword_18C4647F0 = *MEMORY[0x189604D38];
    qword_18C464800 = 0LL;
    qword_18C4647F8 = 0LL;
    qword_18C464808 = (uint64_t)createVolumeIDValue;
    qword_18C464810 = *MEMORY[0x189604C40];
    unk_18C464818 = xmmword_182EA5240;
    qword_18C464828 = (uint64_t)createInodeNumberValue;
    qword_18C464830 = *MEMORY[0x189604CF0];
    unk_18C464838 = xmmword_182EA5240;
    qword_18C464848 = (uint64_t)createParentDirectoryIDValue;
    qword_18C464850 = *MEMORY[0x189604CE8];
    qword_18C464860 = 0LL;
    qword_18C464858 = 0LL;
    qword_18C464868 = (uint64_t)createOwnerIDValue;
    qword_18C464870 = *MEMORY[0x189604C30];
    qword_18C464880 = 0LL;
    qword_18C464878 = 0LL;
    qword_18C464888 = (uint64_t)createGroupIDValue;
    qword_18C464890 = *MEMORY[0x189604D10];
    qword_18C4648A0 = 0LL;
    qword_18C464898 = 0LL;
    qword_18C4648A8 = (uint64_t)createStatModeValue;
    qword_18C4648B0 = *MEMORY[0x189604C88];
    qword_18C4648C0 = 0LL;
    qword_18C4648B8 = 0LL;
    qword_18C4648C8 = (uint64_t)createIsSystemFirmlinkValue;
    qword_18C4648D0 = *MEMORY[0x189604C80];
    qword_18C4648E0 = 0LL;
    qword_18C4648D8 = 0LL;
    qword_18C4648E8 = (uint64_t)createIsSystemDatalessValue;
    qword_18C4648F0 = *MEMORY[0x189604C08];
    qword_18C464900 = 0LL;
    qword_18C4648F8 = 0LL;
    qword_18C464908 = (uint64_t)createFileFlagsValue;
    qword_18C464910 = *MEMORY[0x189604C28];
    qword_18C464920 = 0LL;
    qword_18C464918 = 0LL;
    qword_18C464928 = (uint64_t)createGenerationCountValue;
  }

  MEMORY[0x1895F8858](a1);
  uint64_t v1 = 0LL;
  uint64_t v2 = qword_18C4640D0;
  do
  {
    *(void *)&__int128 v3 = *(v2 - 4);
    *((void *)&v3 + 1) = *v2;
    *(_OWORD *)&v22[v1] = v3;
    v2 += 8;
    v1 += 2LL;
  }

  while (v1 != 68);
  uint64_t v4 = 0LL;
  qword_18C4639E8 = _RegisterFilePropertyProvider(off_189C5B550, 0LL, v22, 0x44uLL);
  BOOL v5 = &registerCoreProperties(void)::corePropertyTable;
  do
  {
    _RegisterFilePropertyWithOptions((void *)v22[v4++], v5[1], 0LL, 0LL, (uint64_t)v5);
    v5 += 4;
  }

  while (v4 != 68);
}

void registerPathURLProperties(uint64_t a1)
{
  v7[7] = *(const __CFString **)MEMORY[0x1895F89C0];
  {
    uint64_t v6 = *MEMORY[0x189604CF0];
    registerPathURLProperties(void)::parentDependencyKeys = *MEMORY[0x1896053E8];
    *(void *)algn_18C4649F8 = v6;
  }

  {
    registerPathURLProperties(void)::propertyTable = *MEMORY[0x189605670];
    qword_18C464938 = 1LL;
    qword_18C464940 = MEMORY[0x1896053E8];
    qword_18C464948 = 1LL;
    qword_18C464950 = *MEMORY[0x189605440];
    unk_18C464958 = 1LL;
    qword_18C464960 = (uint64_t)&registerPathURLProperties(void)::parentDependencyKeys;
    unk_18C464968 = 2LL;
    qword_18C464970 = *MEMORY[0x189605380];
    unk_18C464978 = 1LL;
    qword_18C464980 = 0LL;
    unk_18C464988 = 0LL;
    qword_18C464990 = *MEMORY[0x189605448];
    unk_18C464998 = 1LL;
    qword_18C4649A0 = 0LL;
    unk_18C4649A8 = 0LL;
    qword_18C4649B0 = *MEMORY[0x189604C50];
    unk_18C4649B8 = 0LL;
    qword_18C4649C0 = 0LL;
    unk_18C4649C8 = 0LL;
    qword_18C4649D0 = *MEMORY[0x189604C58];
    unk_18C4649D8 = 0LL;
    qword_18C4649E0 = 0LL;
    unk_18C4649E8 = 0LL;
  }

  MEMORY[0x1895F8858](a1);
  uint64_t v1 = 0LL;
  uint64_t v2 = &qword_18C464950;
  do
  {
    *(void *)&__int128 v3 = *(v2 - 4);
    *((void *)&v3 + 1) = *v2;
    *(_OWORD *)&v7[v1] = v3;
    v2 += 8;
    v1 += 2LL;
  }

  while (v1 != 6);
  _RegisterFilePropertyProvider(off_189C5B5B0, 0LL, v7, 6uLL);
  uint64_t v4 = 0LL;
  BOOL v5 = &registerPathURLProperties(void)::propertyTable;
  do
  {
    _RegisterFilePropertyWithOptions((void *)v7[v4++], v5[1], (const void **)v5[2], v5[3], (uint64_t)v5);
    v5 += 4;
  }

  while (v4 != 6);
}

void registerVolumeProperties(uint64_t a1)
{
  v10[57] = *(const __CFString **)MEMORY[0x1895F89C0];
  {
    registerVolumeProperties(void)::propertyTable = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464A08 = (uint64_t)@"__kCFURLNoDependsVolumeInformationKey";
    qword_18C464A10 = 0LL;
    unk_18C464A18 = 0LL;
    qword_18C464A20 = (uint64_t)@"__kCFURLExpensiveVolumeInformationKey";
    unk_18C464A28 = @"__kCFURLNoDependsVolumeInformationKey";
    qword_18C464A30 = 0LL;
    unk_18C464A38 = 0LL;
    qword_18C464A40 = *MEMORY[0x1896055A0];
    unk_18C464A48 = @"__kCFURLNoDependsVolumeInformationKey";
    qword_18C464A50 = 0LL;
    unk_18C464A58 = 0LL;
    qword_18C464A60 = *MEMORY[0x189605580];
    unk_18C464A68 = @"__kCFURLNoDependsVolumeInformationKey";
    qword_18C464A70 = 0LL;
    unk_18C464A78 = 0LL;
    qword_18C464A80 = *MEMORY[0x189605668];
    unk_18C464A88 = @"__kCFURLNoDependsVolumeInformationKey";
    qword_18C464A90 = 0LL;
    unk_18C464A98 = 0LL;
    qword_18C464AA0 = *MEMORY[0x189605560];
    unk_18C464AA8 = @"__kCFURLCheapVolumeInformationKey";
    qword_18C464AB0 = 1LL;
    unk_18C464AB8 = createVolumeFlagValue;
    qword_18C464AC0 = *MEMORY[0x189605530];
    unk_18C464AC8 = @"__kCFURLCheapVolumeInformationKey";
    qword_18C464AD0 = 2LL;
    unk_18C464AD8 = createVolumeFlagValue;
    qword_18C464AE0 = *MEMORY[0x189605538];
    unk_18C464AE8 = @"__kCFURLCheapVolumeInformationKey";
    qword_18C464AF0 = 4LL;
    unk_18C464AF8 = createNegatedVolumeFlagValue;
    qword_18C464B00 = *MEMORY[0x189605568];
    unk_18C464B08 = @"__kCFURLCheapVolumeInformationKey";
    qword_18C464B10 = 8LL;
    unk_18C464B18 = createVolumeFlagValue;
    qword_18C464B20 = *MEMORY[0x189605540];
    unk_18C464B28 = @"__kCFURLCheapVolumeInformationKey";
    qword_18C464B30 = 32LL;
    unk_18C464B38 = createVolumeFlagValue;
    qword_18C464B40 = *MEMORY[0x189605570];
    unk_18C464B48 = @"__kCFURLCheapVolumeInformationKey";
    qword_18C464B50 = 64LL;
    unk_18C464B58 = createVolumeFlagValue;
    qword_18C464B60 = *MEMORY[0x189605548];
    unk_18C464B68 = @"__kCFURLCheapVolumeInformationKey";
    qword_18C464B70 = 0x8000000LL;
    unk_18C464B78 = createVolumeFlagValue;
    qword_18C464B80 = *MEMORY[0x1896055F8];
    unk_18C464B88 = @"__kCFURLCheapVolumeInformationKey";
    qword_18C464B90 = 0x10000000LL;
    unk_18C464B98 = createVolumeFlagValue;
    qword_18C464BA0 = *MEMORY[0x189605578];
    unk_18C464BA8 = @"__kCFURLCheapVolumeInformationKey";
    qword_18C464BB0 = 0x4000000LL;
    unk_18C464BB8 = createVolumeFlagValue;
    qword_18C464BC0 = *MEMORY[0x1896055D8];
    unk_18C464BC8 = @"__kCFURLCheapVolumeInformationKey";
    qword_18C464BD0 = 0x800000000000000LL;
    unk_18C464BD8 = createVolumeFlagValue;
    qword_18C464BE0 = *MEMORY[0x189605618];
    unk_18C464BE8 = @"__kCFURLCheapVolumeInformationKey";
    qword_18C464BF0 = 0x100000000LL;
    unk_18C464BF8 = createVolumeFlagValue;
    qword_18C464C00 = *MEMORY[0x189605640];
    qword_18C464C08 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464C10 = 0x1000000000LL;
    qword_18C464C18 = (uint64_t)createVolumeFlagValue;
    qword_18C464C20 = *MEMORY[0x189605610];
    qword_18C464C28 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464C30 = 0x10000000000LL;
    qword_18C464C38 = (uint64_t)createVolumeFlagValue;
    qword_18C464C40 = *MEMORY[0x189605620];
    qword_18C464C48 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464C50 = 0x20000000000LL;
    qword_18C464C58 = (uint64_t)createVolumeFlagValue;
    qword_18C464C60 = *MEMORY[0x1896055D0];
    qword_18C464C68 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464C70 = 0x80000000000LL;
    qword_18C464C78 = (uint64_t)createVolumeFlagValue;
    qword_18C464C80 = *MEMORY[0x1896055C8];
    qword_18C464C88 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464C90 = 0x100000000000LL;
    qword_18C464C98 = (uint64_t)createVolumeFlagValue;
    qword_18C464CA0 = *MEMORY[0x1896055C0];
    qword_18C464CA8 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464CB0 = 0x200000000000LL;
    qword_18C464CB8 = (uint64_t)createVolumeFlagValue;
    qword_18C464CC0 = *MEMORY[0x189605628];
    qword_18C464CC8 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464CD0 = 0x400000000000LL;
    qword_18C464CD8 = (uint64_t)createNegatedVolumeFlagValue;
    qword_18C464CE0 = *MEMORY[0x1896055E8];
    qword_18C464CE8 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464CF0 = 0x800000000000LL;
    qword_18C464CF8 = (uint64_t)createVolumeFlagValue;
    qword_18C464D00 = *MEMORY[0x189605600];
    qword_18C464D08 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464D10 = 0x2000000000000LL;
    qword_18C464D18 = (uint64_t)createVolumeFlagValue;
    qword_18C464D20 = *MEMORY[0x189605558];
    qword_18C464D28 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464D30 = 0x20000000000000LL;
    qword_18C464D38 = (uint64_t)createVolumeFlagValue;
    qword_18C464D40 = *MEMORY[0x189605630];
    qword_18C464D48 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464D50 = 0x40000000000000LL;
    qword_18C464D58 = (uint64_t)createVolumeFlagValue;
    qword_18C464D60 = *MEMORY[0x189605650];
    qword_18C464D68 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464D70 = 0x80000000000000LL;
    qword_18C464D78 = (uint64_t)createVolumeFlagValue;
    qword_18C464D80 = *MEMORY[0x189605648];
    qword_18C464D88 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464D90 = 0x100000000000000LL;
    qword_18C464D98 = (uint64_t)createVolumeFlagValue;
    qword_18C464DA0 = *MEMORY[0x1896055F0];
    qword_18C464DA8 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464DB0 = 0x2000000000000000LL;
    qword_18C464DB8 = (uint64_t)createVolumeFlagValue;
    qword_18C464DC0 = *MEMORY[0x189605638];
    qword_18C464DC8 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464DD0 = 0x4000000000000000LL;
    qword_18C464DD8 = (uint64_t)createVolumeFlagValue;
    qword_18C464DE0 = *MEMORY[0x1896055E0];
    qword_18C464DE8 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464DF0 = 0x8000000000000000LL;
    qword_18C464DF8 = (uint64_t)createVolumeFlagValue;
    qword_18C464E00 = *MEMORY[0x189605608];
    qword_18C464E08 = (uint64_t)@"__kCFURLNoDependsVolumeInformationKey";
    qword_18C464E18 = 0LL;
    qword_18C464E10 = 0LL;
    qword_18C464E20 = *MEMORY[0x1896055B8];
    qword_18C464E28 = (uint64_t)@"__kCFURLNoDependsVolumeInformationKey";
    qword_18C464E38 = 0LL;
    qword_18C464E30 = 0LL;
    qword_18C464E40 = *MEMORY[0x189605550];
    qword_18C464E48 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464E50 = 0LL;
    qword_18C464E58 = (uint64_t)createVolumeIsInternalValue;
    qword_18C464E60 = *MEMORY[0x189605590];
    qword_18C464E68 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464E70 = 0LL;
    qword_18C464E78 = (uint64_t)createVolumeMaximumFileSizeValue;
    qword_18C464E80 = *MEMORY[0x189605520];
    qword_18C464E88 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464E90 = 0LL;
    qword_18C464E98 = (uint64_t)createVolumeCreationDateValue;
    qword_18C464EA0 = *MEMORY[0x189605678];
    qword_18C464EA8 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464EB0 = 0LL;
    qword_18C464EB8 = (uint64_t)createVolumeUUIDStringValue;
    qword_18C464EC0 = *MEMORY[0x189605528];
    qword_18C464EC8 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464ED0 = 0LL;
    qword_18C464ED8 = (uint64_t)createVolumeIdentifierValue;
    qword_18C464EE0 = *MEMORY[0x189605658];
    qword_18C464EE8 = (uint64_t)@"__kCFURLExpensiveVolumeInformationKey";
    qword_18C464EF0 = 0LL;
    qword_18C464EF8 = (uint64_t)createVolumeTotalCapacityValue;
    qword_18C464F00 = *MEMORY[0x189605518];
    qword_18C464F08 = (uint64_t)@"__kCFURLExpensiveVolumeInformationKey";
    qword_18C464F10 = 0LL;
    qword_18C464F18 = (uint64_t)createVolumeAvailableCapacityValue;
    qword_18C464F20 = *MEMORY[0x1896055A8];
    qword_18C464F28 = (uint64_t)@"__kCFURLExpensiveVolumeInformationKey";
    qword_18C464F30 = 0LL;
    qword_18C464F38 = (uint64_t)createVolumeResourceCountValue;
    qword_18C464F40 = *MEMORY[0x189604BD8];
    qword_18C464F48 = (uint64_t)@"__kCFURLNoDependsVolumeInformationKey";
    qword_18C464F50 = 0LL;
    qword_18C464F58 = 0LL;
    qword_18C464F60 = *MEMORY[0x189604D88];
    qword_18C464F68 = (uint64_t)@"__kCFURLNoDependsVolumeInformationKey";
    qword_18C464F78 = 0LL;
    qword_18C464F70 = 0LL;
    qword_18C464F80 = *MEMORY[0x189605660];
    qword_18C464F88 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464F90 = 0LL;
    qword_18C464F98 = 0LL;
    qword_18C464FA0 = *MEMORY[0x1896055B0];
    qword_18C464FA8 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464FB0 = 0LL;
    qword_18C464FB8 = 0LL;
    qword_18C464FC0 = *MEMORY[0x189605598];
    qword_18C464FC8 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464FD0 = 0LL;
    qword_18C464FD8 = 0LL;
    qword_18C464FE0 = *MEMORY[0x189604D78];
    qword_18C464FE8 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C464FF0 = 16LL;
    qword_18C464FF8 = (uint64_t)createVolumeFlagValue;
    qword_18C465000 = *MEMORY[0x189604D58];
    qword_18C465008 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C465010 = 512LL;
    qword_18C465018 = (uint64_t)createVolumeFlagValue;
    qword_18C465020 = *MEMORY[0x189604D60];
    qword_18C465028 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C465030 = 1024LL;
    qword_18C465038 = (uint64_t)createVolumeFlagValue;
    qword_18C465040 = *MEMORY[0x189604D80];
    qword_18C465048 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C465050 = 4096LL;
    qword_18C465058 = (uint64_t)createVolumeFlagValue;
    qword_18C465060 = *MEMORY[0x189604D40];
    qword_18C465068 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C465070 = 0x4000LL;
    qword_18C465078 = (uint64_t)createVolumeFlagValue;
    qword_18C465080 = *MEMORY[0x189604D48];
    qword_18C465088 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C465090 = 0x8000LL;
    qword_18C465098 = (uint64_t)createVolumeFlagValue;
    qword_18C4650A0 = *MEMORY[0x189604D50];
    qword_18C4650A8 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C4650B0 = 0x10000LL;
    qword_18C4650B8 = (uint64_t)createVolumeFlagValue;
    qword_18C4650C0 = *MEMORY[0x189604D30];
    qword_18C4650C8 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C4650D0 = 0LL;
    qword_18C4650D8 = (uint64_t)createVolumeDeviceIDValue;
    qword_18C4650E0 = *MEMORY[0x189604D70];
    qword_18C4650E8 = (uint64_t)@"__kCFURLCheapVolumeInformationKey";
    qword_18C4650F0 = 0x20000000LL;
    qword_18C4650F8 = (uint64_t)createVolumeFlagValue;
  }

  MEMORY[0x1895F8858](a1);
  uint64_t v1 = 0LL;
  uint64_t v2 = &qword_18C464A20;
  do
  {
    *(void *)&__int128 v3 = *(v2 - 4);
    *((void *)&v3 + 1) = *v2;
    *(_OWORD *)&v10[v1] = v3;
    v2 += 8;
    v1 += 2LL;
  }

  while (v1 != 56);
  uint64_t v4 = 0LL;
  qword_18C4639F0 = _RegisterFilePropertyProvider(off_189C5B5D0, 0LL, v10, 0x38uLL);
  BOOL v5 = (const void **)&qword_18C464A08;
  uint64_t v6 = (const void **)&qword_18C464A08;
  do
  {
    uint64_t v7 = (__CFString *)v10[v4];
    uint64_t v8 = *v6;
    v6 += 4;
    BOOL v9 = CFEqual(v8, @"__kCFURLNoDependsVolumeInformationKey") == 0;
    _RegisterFilePropertyWithOptions(v7, 0, v5, v9, (uint64_t)(v5 - 1));
    ++v4;
    BOOL v5 = v6;
  }

  while (v4 != 56);
}

uint64_t _RegisterFilePropertyProvider(_OWORD *a1, uint64_t a2, const __CFString **a3, size_t __count)
{
  uint64_t v4 = __count;
  uint64_t v6 = qword_18C4638C8++;
  uint64_t v7 = &sFileProviderGlobals[7 * v6];
  *((_DWORD *)v7 + 4) = v6;
  uint64_t v8 = v7 + 2;
  void v7[3] = a2;
  *((_OWORD *)v7 + 2) = *a1;
  *((_OWORD *)v7 + 3) = a1[1];
  *((_DWORD *)v7 + 5) = 0;
  BOOL v9 = (_DWORD *)v7 + 5;
  v7[8] = (uint64_t)calloc(__count, 0x94uLL);
  uint64_t v10 = v7 + 8;
  if (v4 >= 1)
  {
    uint64_t v11 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    do
    {
      uint64_t v12 = *a3++;
      int v13 = (*v9)++;
      uint64_t v14 = *v10 + 148LL * v13;
      *(_DWORD *)(v14 + 136) = v13;
      CFStringRef Copy = CFStringCreateCopy(v11, v12);
      *(void *)(v14 + 8) = Copy;
      *(void *)(v14 + 140) = v8;
      CFDictionaryAddValue((CFMutableDictionaryRef)qword_18C4639F8, Copy, (const void *)v14);
      --v4;
    }

    while (v4);
  }

  return v6;
}

void _RegisterFilePropertyWithOptions(void *key, char a2, const void **a3, uint64_t a4, uint64_t a5)
{
  int Value = (char *)CFDictionaryGetValue((CFDictionaryRef)qword_18C4639F8, key);
  if ((a2 & 1) != 0) {
    CFArrayAppendValue((CFMutableArrayRef)qword_18C463A08, key);
  }
  if (a4)
  {
    if (a4 >= 1)
    {
      do
      {
        uint64_t v11 = CFDictionaryGetValue((CFDictionaryRef)qword_18C4639F8, *a3);
        if (v11) {
          addPropertyAndDependenciesToBitmap((uint64_t)v11, (uint64_t)(Value + 16));
        }
        ++a3;
        --a4;
      }

      while (a4);
    }

    if (qword_18C4638C8 >= 1)
    {
      uint64_t v12 = 0LL;
      do
      {
        uint64_t v13 = (uint64_t)&Value[12 * v12 + 16];
        uint64_t v30 = *(void *)v13;
        int v31 = *(_DWORD *)(v13 + 8);
        if (PropertyMaskIsNotZero((uint64_t)&v30, (unint64_t *)&v29, &v28) && v29 <= v28)
        {
          uint64_t v14 = v30;
          int v15 = v31;
          unint64_t v16 = v28 - v29 + 1;
          unint64_t v17 = sFileProviderGlobals[7 * v12 + 8] + 148 * v29;
          do
          {
            int v18 = *(_DWORD *)(v17 + 136);
            uint64_t v19 = 1LL << v18;
            if (v18 >= 64) {
              uint64_t v19 = 0LL;
            }
            if ((v19 & v14) != 0 || (v18 >= 64 ? (int v20 = 1 << v18) : (int v20 = 0), (v15 & v20) != 0))
            {
              int v21 = *((_DWORD *)Value + 34);
              int v22 = 1 << v21;
              BOOL v23 = v21 < 64;
              if (v21 >= 64) {
                uint64_t v24 = 0LL;
              }
              else {
                uint64_t v24 = 1LL << v21;
              }
              if (v23) {
                int v25 = 0;
              }
              else {
                int v25 = v22;
              }
              unint64_t v26 = v17 + 12LL * **(int **)(Value + 140);
              int v27 = *(_DWORD *)(v26 + 84) | v25;
              *(void *)(v26 + 76) |= v24;
              *(_DWORD *)(v26 + 84) = v27;
            }

            v17 += 148LL;
            --v16;
          }

          while (v16);
        }

        ++v12;
      }

      while (v12 < qword_18C4638C8);
    }
  }

  *(void *)int Value = a5;
}

uint64_t addPropertyAndDependenciesToBitmap(uint64_t result, uint64_t a2)
{
  int v2 = *(_DWORD *)(result + 136);
  int v3 = 1 << v2;
  BOOL v4 = v2 < 64;
  if (v2 >= 64) {
    uint64_t v5 = 0LL;
  }
  else {
    uint64_t v5 = 1LL << v2;
  }
  if (v4) {
    int v3 = 0;
  }
  uint64_t v6 = a2 + 12LL * **(int **)(result + 140);
  int v7 = *(_DWORD *)(v6 + 8) | v3;
  *(void *)v6 |= v5;
  *(_DWORD *)(v6 + 8) = v7;
  uint64_t v8 = qword_18C4638C8;
  if (qword_18C4638C8 >= 1)
  {
    BOOL v9 = (_DWORD *)(result + 24);
    uint64_t v10 = (int *)(a2 + 8);
    do
    {
      uint64_t v11 = *((void *)v9 - 1) | *((void *)v10 - 1);
      int v12 = *v9;
      v9 += 3;
      int v13 = v12 | *v10;
      *((void *)v10 - 1) = v11;
      *uint64_t v10 = v13;
      v10 += 3;
      --v8;
    }

    while (v8);
  }

  return result;
}

uint64_t PropertyMaskIsNotZero(uint64_t a1, unint64_t *a2, void *a3)
{
  unint64_t v6 = *(void *)a1;
  uint64_t result = *(unsigned int *)(a1 + 8);
  if (v6)
  {
    unint64_t v8 = __clz(__rbit64(v6));
    int v9 = flsll(result);
    if (v9) {
      uint64_t v10 = v9 + 64LL;
    }
    else {
      uint64_t v10 = flsll(*(void *)a1);
    }
  }

  else
  {
    if (!(_DWORD)result) {
      return result;
    }
    unsigned int v11 = __clz(__rbit32(result));
    uint64_t v10 = flsll(result) + 64;
    unint64_t v8 = v11 | 0x40;
  }

  *a2 = v8;
  *a3 = v10 - 1;
  return 1LL;
}

__CFDictionary *_FSURLCopyTemporaryPropertiesForKeys(const __CFURL *a1, const __CFArray *a2)
{
  BOOL v4 = (const void *)__CFURLResourceInfoPtr();
  uint64_t v5 = _FileCacheGetForURL(a1, v4);
  _FileCacheLockTempPermProperties();
  CFMutableDictionaryRef TemporaryPropertyDictionary = _FileCacheGetTemporaryPropertyDictionary(v5, 0);
  if (TemporaryPropertyDictionary && (int v7 = TemporaryPropertyDictionary, Count = CFArrayGetCount(a2), Count >= 1))
  {
    CFIndex v9 = Count;
    CFMutableArrayRef Mutable = 0LL;
    CFIndex v11 = 0LL;
    int v12 = (const CFDictionaryKeyCallBacks *)MEMORY[0x189605240];
    int v13 = (const CFDictionaryValueCallBacks *)MEMORY[0x189605250];
    do
    {
      CFTypeRef ValueAtIndex = CFArrayGetValueAtIndex(a2, v11);
      if (CFDictionaryGetValueIfPresent(v7, ValueAtIndex, (const void **)&value))
      {
        if (!Mutable)
        {
          int v15 = CFGetAllocator(a1);
          CFMutableArrayRef Mutable = CFDictionaryCreateMutable(v15, 0LL, v12, v13);
        }

        CFDictionaryAddValue(Mutable, ValueAtIndex, value);
      }

      ++v11;
    }

    while (v9 != v11);
  }

  else
  {
    CFMutableArrayRef Mutable = 0LL;
  }

  CFMutableDictionaryRef PermanentPropertyDictionary = _FileCacheGetPermanentPropertyDictionary(v5, 0);
  if (PermanentPropertyDictionary)
  {
    unint64_t v17 = PermanentPropertyDictionary;
    CFIndex v18 = CFArrayGetCount(a2);
    if (v18 >= 1)
    {
      CFIndex v19 = v18;
      CFIndex v20 = 0LL;
      int v21 = (const CFDictionaryKeyCallBacks *)MEMORY[0x189605240];
      int v22 = (const CFDictionaryValueCallBacks *)MEMORY[0x189605250];
      do
      {
        BOOL v23 = CFArrayGetValueAtIndex(a2, v20);
        if (CFDictionaryGetValueIfPresent(v17, v23, (const void **)&value))
        {
          if (!Mutable)
          {
            uint64_t v24 = CFGetAllocator(a1);
            CFMutableArrayRef Mutable = CFDictionaryCreateMutable(v24, 0LL, v21, v22);
          }

          CFDictionaryAddValue(Mutable, v23, value);
        }

        ++v20;
      }

      while (v19 != v20);
    }
  }

  _FileCacheUnlockTempPermProperties();
  return Mutable;
}

uint64_t _FSURLCopyResourcePropertyForKey( const __CFURL *a1, const __CFString *a2, void **a3, const void *a4, __CFError **a5)
{
  return _FSURLCopyResourcePropertyForKeyInternal(a1, a2, a3, a4, a5, 1);
}

uint64_t _FSURLCopyResourcePropertyForKeyInternal( const __CFURL *a1, const __CFString *a2, void **a3, CFTypeRef cf, __CFError **a5, int a6)
{
  int v31 = a2;
  value = 0LL;
  CFIndex v11 = _FileCacheGetForURL(a1, cf);
  int v12 = (uint64_t *)CFDictionaryGetValue((CFDictionaryRef)qword_18C4639F8, a2);
  if (!v12)
  {
    _FileCacheLockTempPermProperties();
    CFMutableDictionaryRef TemporaryPropertyDictionary = _FileCacheGetTemporaryPropertyDictionary(v11, 0);
    if (TemporaryPropertyDictionary
      && CFDictionaryGetValueIfPresent(TemporaryPropertyDictionary, a2, (const void **)&value)
      || (CFMutableDictionaryRef PermanentPropertyDictionary = _FileCacheGetPermanentPropertyDictionary(v11, 0)) != 0LL
      && CFDictionaryGetValueIfPresent(PermanentPropertyDictionary, a2, (const void **)&value))
    {
      BOOL v23 = value;
      if (value) {
        BOOL v23 = (void *)CFRetain(value);
      }
      value = v23;
    }

    _FileCacheUnlockTempPermProperties();
    uint64_t v17 = 1LL;
    goto LABEL_18;
  }

  int v13 = v12;
  _FileCacheLock((uint64_t)v11);
  uint64_t v29 = *v13;
  uint64_t v14 = *(uint64_t *)((char *)v13 + 140);
  uint64_t v15 = *(void *)(v14 + 8);
  unint64_t v16 = *(uint64_t (**)(const __CFURL *, void *, const __CFString **, void **, uint64_t *, uint64_t, uint64_t))(v14 + 16);
  _FileCacheIncrementInProvider((uint64_t)v11);
  uint64_t v17 = v16(a1, v11, &v31, &value, &v29, 1LL, v15);
  _FileCacheDecrementInProvider((uint64_t)v11);
  if (a6 && !(_DWORD)v17)
  {
    _FileCacheLock((uint64_t)v11);
    uint64_t v24 = *(uint64_t *)((char *)v13 + 140);
    uint64_t v25 = *(void *)(v24 + 8);
    unint64_t v26 = *(uint64_t (**)(const __CFURL *, void *, const __CFString **, void **, uint64_t *, uint64_t, uint64_t))(v24 + 16);
    _FileCacheIncrementInProvider((uint64_t)v11);
    uint64_t v17 = v26(a1, v11, &v31, &value, &v29, 1LL, v25);
    _FileCacheDecrementInProvider((uint64_t)v11);
    _FileCacheUnlock((uint64_t)v11);
    if (!(_DWORD)v17)
    {
LABEL_28:
      memset(v28, 0, 60);
      addPropertyAndDependenciesToBitmap((uint64_t)v13, (uint64_t)v28);
      uint64_t v17 = prepareValuesForBitmap((uint64_t)a1, (uint64_t)v11, (uint64_t)v28, (uint64_t)a5);
      if ((_DWORD)v17)
      {
        _FileCacheLock((uint64_t)v11);
        uint64_t v18 = *(uint64_t *)((char *)v13 + 140);
        CFIndex v19 = *(void (**)(const __CFURL *, void *, const __CFString **, void **, uint64_t *, uint64_t, uint64_t))(v18 + 32);
        uint64_t v20 = *(void *)(v18 + 8);
        _FileCacheIncrementInProvider((uint64_t)v11);
        v19(a1, v11, &v31, &value, &v29, 1LL, v20);
        _FileCacheDecrementInProvider((uint64_t)v11);
        _FileCacheUnlock((uint64_t)v11);
      }
    }

    _FileCacheLockTransitionFromPreparer((uint64_t)v11);
  }

  _FileCacheUnlock((uint64_t)v11);
  if ((_DWORD)v17)
  {
LABEL_18:
    *a3 = value;
    return v17;
  }

  if (!a5 || *a5) {
    return 0LL;
  }
  if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
    _FSURLCopyResourcePropertyForKeyInternal();
  }
  uint64_t v17 = 0LL;
  *a5 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 256LL, 0LL);
  return v17;
}

uint64_t _FSURLCopyResourcePropertyForKeyFromCache( const __CFURL *a1, const __CFString *a2, void **a3, const void *a4)
{
  return _FSURLCopyResourcePropertyForKeyInternal(a1, a2, a3, a4, 0LL, 0);
}

CFDictionaryRef _FSURLCopyResourcePropertiesForKeys( const __CFURL *a1, const __CFArray *a2, const void *a3, __CFError **a4)
{
  return _FSURLCopyResourcePropertiesForKeysInternal(a1, a2, a3, a4, 1);
}

CFDictionaryRef _FSURLCopyResourcePropertiesForKeysInternal( const __CFURL *a1, const __CFArray *a2, CFTypeRef cf, __CFError **a4, int a5)
{
  int v104 = a5;
  uint64_t v119 = *MEMORY[0x1895F89C0];
  CFTypeRef v110 = a1;
  int v7 = _FileCacheGetForURL(a1, cf);
  if (a2) {
    unint64_t v8 = a2;
  }
  else {
    unint64_t v8 = (const __CFArray *)qword_18C463A08;
  }
  uint64_t v115 = v8;
  CFIndex Count = CFArrayGetCount(v8);
  uint64_t v10 = qword_18C4638C8;
  uint64_t v11 = MEMORY[0x1895F8858](Count);
  int v13 = &v100 - 32 * v12;
  uint64_t v14 = MEMORY[0x1895F8858](v11);
  unint64_t v16 = &v100 - 32 * v15;
  uint64_t v17 = MEMORY[0x1895F8858](v14);
  CFIndex v19 = &v100 - 32 * v18;
  uint64_t v20 = MEMORY[0x1895F8858](v17);
  int v22 = (const __CFArray *)((char *)&v100 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v23 = MEMORY[0x1895F8858](v20);
  uint64_t v25 = (const void **)((char *)&v100 - ((v24 + 15) & 0xFF0LL));
  MEMORY[0x1895F8858](v23);
  int64_t v28 = (const void **)((char *)&v100 - v27);
  if (v10 >= 1) {
    bzero(v22, v26);
  }
  LOBYTE(v114) = CFArrayGetCount(v115);
  uint64_t v114 = v114;
  if (!(_BYTE)v114)
  {
    CFIndex v30 = 0LL;
    goto LABEL_84;
  }

  __int128 v111 = v19;
  CFURLRef v112 = v22;
  __int128 v113 = v7;
  uint64_t v107 = v10;
  CFIndex v29 = 0LL;
  CFIndex v30 = 0LL;
  int v31 = 0;
  do
  {
    CFTypeRef ValueAtIndex = CFArrayGetValueAtIndex(v115, v29);
    BOOL v33 = (char *)CFDictionaryGetValue((CFDictionaryRef)qword_18C4639F8, ValueAtIndex);
    if (v33)
    {
      uint64_t v34 = **(int **)(v33 + 140);
      CFIndex v35 = v112;
      uint64_t v36 = *((void *)v112 + v34);
      if (v36 <= 95)
      {
        v13[96 * v34 + v36] = *((void *)v33 + 1);
        v16[96 * v34 + v36] = 0LL;
        v111[96 * v34 + v36] = *(void *)v33;
        *((void *)v35 + v34) = v36 + 1;
      }

      int v31 = 1;
    }

    else
    {
      _FileCacheLockTempPermProperties();
      CFMutableDictionaryRef TemporaryPropertyDictionary = _FileCacheGetTemporaryPropertyDictionary(v113, 0);
      if (TemporaryPropertyDictionary)
      {
        if (CFDictionaryGetValueIfPresent(TemporaryPropertyDictionary, ValueAtIndex, (const void **)value))
        {
          CFIndex v38 = value[0];
          if (value[0])
          {
            v25[v30] = ValueAtIndex;
            v28[v30++] = CFRetain(v38);
          }
        }
      }

      CFMutableDictionaryRef PermanentPropertyDictionary = _FileCacheGetPermanentPropertyDictionary(v113, 0);
      if (PermanentPropertyDictionary)
      {
        if (CFDictionaryGetValueIfPresent(PermanentPropertyDictionary, ValueAtIndex, (const void **)value))
        {
          uint64_t v40 = value[0];
          if (value[0])
          {
            v25[v30] = ValueAtIndex;
            v28[v30++] = CFRetain(v40);
          }
        }
      }

      _FileCacheUnlockTempPermProperties();
    }

    ++v29;
  }

  while (v114 != v29);
  CFTypeRef v41 = v111;
  if (!v31)
  {
    uint64_t v10 = v107;
    int v22 = v112;
    goto LABEL_84;
  }

  int v42 = v113;
  _FileCacheLock((uint64_t)v113);
  if (v107 < 1)
  {
    _FileCacheUnlock((uint64_t)v42);
LABEL_91:
    __int16 v96 = CFGetAllocator(v110);
    CFDictionaryRef v97 = CFDictionaryCreate(v96, v25, v28, v30, MEMORY[0x189605240], MEMORY[0x189605250]);
    goto LABEL_92;
  }

  uint64_t v102 = a4;
  uint64_t v101 = -768LL;
  uint64_t v43 = 768 * v107 - 768;
  CFTypeID v106 = v16;
  uint64_t v44 = (CFTypeRef *)((char *)v16 + v43);
  uint64_t v45 = (uint64_t)v41 + v43;
  uint64_t v103 = v13;
  unsigned int v46 = (char *)v13 + v43;
  uint64_t v47 = &sFileProviderGlobals[7 * v107 - 4];
  int v48 = 1;
  uint64_t v105 = v107 - 1;
  uint64_t v49 = v107 - 1;
  int v22 = v112;
  char v50 = v113;
  while (1)
  {
    uint64_t v51 = *((void *)v22 + v49);
    if (v51 >= 1)
    {
      uint64_t v52 = (uint64_t (*)(CFTypeRef, void *, char *, CFTypeRef *, uint64_t, uint64_t, uint64_t))v47[1];
      uint64_t v108 = *v47;
      BOOL v109 = v52;
      _FileCacheIncrementInProvider((uint64_t)v50);
      int v53 = v109(v110, v50, v46, v44, v45, v51, v108);
      _FileCacheDecrementInProvider((uint64_t)v50);
      int v48 = v53;
      if (!v53) {
        break;
      }
    }

    v44 -= 96;
    v45 -= 768LL;
    v46 -= 768;
    v47 -= 7;
    BOOL v54 = v49-- <= 0;
    int v22 = v112;
    if (v54) {
      goto LABEL_42;
    }
  }

  uint64_t v55 = v107;
  if (v49 >= v107)
  {
    int v48 = 0;
    int v22 = v112;
  }

  else
  {
    int v22 = v112;
    do
    {
      uint64_t v56 = *((void *)v22 + v49);
      CFURLRef v57 = v44;
      if (v56 >= 1)
      {
        do
        {
          if (*v57)
          {
            CFRelease(*v57);
            *CFURLRef v57 = 0LL;
          }

          ++v57;
          --v56;
        }

        while (v56);
      }

      ++v49;
      v44 += 96;
    }

    while (v49 != v55);
    int v48 = 0;
  }

LABEL_42:
  int v58 = v104;
  if (v104) {
    BOOL v59 = v48 == 0;
  }
  else {
    BOOL v59 = 0;
  }
  int v60 = v59;
  a4 = v102;
  int v13 = v103;
  unint64_t v16 = v106;
  CFArrayRef v61 = v113;
  LODWORD(v108) = v60;
  if (v59)
  {
    if (_FileCacheLockTransitionToPreparer((uint64_t)v113))
    {
      int v48 = 0;
    }

    else
    {
      _FileCacheLock((uint64_t)v61);
      if (v107 < 1)
      {
        int v62 = 0;
      }

      else
      {
        int v62 = 0;
        uint64_t v63 = v101 + 768 * v107;
        __int16 v64 = (CFTypeRef *)((char *)v16 + v63);
        uint64_t v65 = (char *)v111 + v63;
        uint64_t v66 = (char *)v13 + v63;
        CFTypeID v67 = &sFileProviderGlobals[7 * v107 - 4];
        uint64_t v68 = v105;
        CFTypeID v69 = v113;
        while (1)
        {
          uint64_t v105 = v68;
          uint64_t v70 = *((void *)v22 + v68);
          if (v70 >= 1)
          {
            uint64_t v71 = *v67;
            BOOL v109 = (uint64_t (*)(CFTypeRef, void *, char *, CFTypeRef *, uint64_t, uint64_t, uint64_t))v67[1];
            _FileCacheIncrementInProvider((uint64_t)v69);
            int v72 = v109(v110, v69, v66, v64, (uint64_t)v65, v70, v71);
            int v13 = v103;
            int v73 = v72;
            _FileCacheDecrementInProvider((uint64_t)v69);
            int v62 = v73;
            if (!v73) {
              break;
            }
          }

          uint64_t v68 = v105 - 1;
          v64 -= 96;
          v65 -= 768;
          v66 -= 768;
          v67 -= 7;
          int v22 = v112;
          if (v105 <= 0) {
            goto LABEL_68;
          }
        }

        uint64_t v74 = v107;
        uint64_t v75 = v105;
        if (v105 >= v107)
        {
          int v62 = 0;
          int v13 = v103;
          int v22 = v112;
        }

        else
        {
          int v22 = v112;
          do
          {
            uint64_t v76 = *((void *)v22 + v75);
            uint64_t v77 = v64;
            if (v76 >= 1)
            {
              do
              {
                if (*v77)
                {
                  CFRelease(*v77);
                  *uint64_t v77 = 0LL;
                }

                ++v77;
                --v76;
              }

              while (v76);
            }

            ++v75;
            v64 += 96;
          }

          while (v75 != v74);
          int v62 = 0;
          int v13 = v103;
        }
      }

CFDictionaryRef _FSURLCopyResourcePropertiesForKeysFromCache( const __CFURL *a1, const __CFArray *a2, const void *a3)
{
  return _FSURLCopyResourcePropertiesForKeysInternal(a1, a2, a3, 0LL, 0);
}

uint64_t _FSURLSetResourcePropertyForKey( const __CFURL *a1, const void *a2, const void *a3, int a4, CFTypeRef cf, CFErrorRef *a6)
{
  unint64_t v8 = a3;
  int v22 = a3;
  uint64_t v23 = a2;
  uint64_t v11 = _FileCacheGetForURL(a1, cf);
  int Value = (uint64_t *)CFDictionaryGetValue((CFDictionaryRef)qword_18C4639F8, a2);
  uint64_t v13 = (uint64_t)Value;
  if (v8)
  {
    if (!a4) {
      goto LABEL_9;
    }
  }

  else
  {
    unint64_t v8 = (const void *)*MEMORY[0x189605018];
    int v22 = (const void *)*MEMORY[0x189605018];
    if (!a4)
    {
LABEL_9:
      uint64_t v17 = 1LL;
      if (!a4 && !Value)
      {
        _FileCacheLockTempPermProperties();
        CFMutableDictionaryRef PermanentPropertyDictionary = _FileCacheGetPermanentPropertyDictionary(v11, 0);
        if (PermanentPropertyDictionary) {
          CFDictionaryRemoveValue(PermanentPropertyDictionary, a2);
        }
        CFMutableDictionaryRef TemporaryPropertyDictionary = _FileCacheGetTemporaryPropertyDictionary(v11, 1);
        if (TemporaryPropertyDictionary) {
          CFDictionarySetValue(TemporaryPropertyDictionary, a2, v8);
        }
        _FileCacheUnlockTempPermProperties();
      }

      return v17;
    }
  }

  if (!Value) {
    goto LABEL_9;
  }
  uint64_t v21 = *Value;
  _FileCacheLock((uint64_t)v11);
  uint64_t v14 = *(void *)(v13 + 140);
  uint64_t v15 = *(uint64_t (**)(const __CFURL *, void *, const void **, const void **, uint64_t *, uint64_t, uint64_t, CFErrorRef *))(v14 + 40);
  uint64_t v16 = *(void *)(v14 + 8);
  _FileCacheIncrementInProvider((uint64_t)v11);
  uint64_t v17 = v15(a1, v11, &v23, &v22, &v21, 1LL, v16, a6);
  _FileCacheDecrementInProvider((uint64_t)v11);
  if ((_DWORD)v17)
  {
    clearPropertyAndDependentValues((uint64_t)a1, (uint64_t)v11, v13);
    _FileCacheUnlock((uint64_t)v11);
  }

  else
  {
    _FileCacheUnlock((uint64_t)v11);
    if (a6 && !*a6)
    {
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
        _FSURLSetResourcePropertyForKey_cold_1();
      }
      uint64_t v17 = 0LL;
      *a6 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 256LL, 0LL);
    }

    else
    {
      return 0LL;
    }
  }

  return v17;
}

void clearPropertyAndDependentValues(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_18C4639E8 == **(_DWORD **)(a3 + 140))
  {
    if ((*(_BYTE *)_FileCacheGetAttributes(a2) & 1) != 0) {
      _FileCacheReleaseContents(a2, 1, 1, 1, 0);
    }
  }

  else
  {
    clearPropertyValue(a1, a2, (uint64_t *)a3);
    if (qword_18C4638C8 >= 1)
    {
      uint64_t v6 = 0LL;
      uint64_t v7 = a3 + 76;
      do
      {
        unint64_t v8 = (uint64_t *)(v7 + 12 * v6);
        uint64_t v19 = *v8;
        int v20 = *((_DWORD *)v8 + 2);
        if (PropertyMaskIsNotZero((uint64_t)&v19, (unint64_t *)&v18, &v17) && v18 <= v17)
        {
          uint64_t v9 = v19;
          int v10 = v20;
          unint64_t v11 = v17 - v18 + 1;
          unint64_t v12 = 148 * v18;
          do
          {
            unint64_t v13 = sFileProviderGlobals[7 * v6 + 8] + v12;
            int v14 = *(_DWORD *)(v13 + 136);
            uint64_t v15 = 1LL << v14;
            if (v14 >= 64) {
              uint64_t v15 = 0LL;
            }
            if ((v15 & v9) != 0 || (v14 >= 64 ? (int v16 = 1 << v14) : (int v16 = 0), (v16 & v10) != 0)) {
              clearPropertyValue(a1, a2, (uint64_t *)v13);
            }
            v12 += 148LL;
            --v11;
          }

          while (v11);
        }

        ++v6;
      }

      while (v6 < qword_18C4638C8);
    }
  }

void _FSURLSetPermanentResourcePropertyForKey(const __CFURL *a1, const void *a2, const void *a3)
{
  uint64_t v6 = (const void *)__CFURLResourceInfoPtr();
  uint64_t v7 = _FileCacheGetForURL(a1, v6);
  _FileCacheLockTempPermProperties();
  CFMutableDictionaryRef TemporaryPropertyDictionary = _FileCacheGetTemporaryPropertyDictionary(v7, 0);
  if (TemporaryPropertyDictionary) {
    CFDictionaryRemoveValue(TemporaryPropertyDictionary, a2);
  }
  CFMutableDictionaryRef PermanentPropertyDictionary = _FileCacheGetPermanentPropertyDictionary(v7, 1);
  if (PermanentPropertyDictionary)
  {
    if (a3) {
      CFDictionarySetValue(PermanentPropertyDictionary, a2, a3);
    }
    else {
      CFDictionaryRemoveValue(PermanentPropertyDictionary, a2);
    }
  }

  _FileCacheUnlockTempPermProperties();
}

uint64_t _FSURLSetResourcePropertiesForKeys( const __CFURL *a1, const __CFDictionary *a2, CFTypeRef cf, CFErrorRef *a4)
{
  v107[1] = *MEMORY[0x1895F89C0];
  CFTypeRef v7 = _FileCacheGetForURL(a1, cf);
  CFIndex Count = CFDictionaryGetCount(a2);
  uint64_t v9 = qword_18C4638C8;
  uint64_t v10 = MEMORY[0x1895F8858](Count);
  int v104 = (const void **)(&v95 - 32 * v11);
  uint64_t v12 = MEMORY[0x1895F8858](v10);
  int v14 = &v95 - 32 * v13;
  uint64_t v15 = MEMORY[0x1895F8858](v12);
  MEMORY[0x1895F8858](v15);
  int64_t v18 = (char *)&v95 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v107[0] = 0LL;
  if (Count < 1)
  {
    LOBYTE(v32) = 1;
    return v32;
  }

  int v98 = a1;
  uint64_t v99 = v9;
  uint64_t v101 = v17;
  uint64_t v102 = (uint64_t *)((char *)&v95 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  if (v9 >= 1)
  {
    bzero(v18, v16);
    if ((unint64_t)Count >= 0x100)
    {
      uint64_t v103 = v14;
      CFTypeRef v96 = v7;
      CFDictionaryRef v97 = a4;
      uint64_t v19 = 0LL;
      uint64_t v20 = 0LL;
      uint64_t v100 = (uint64_t *)*MEMORY[0x189605018];
      uint64_t v21 = (const void *)*MEMORY[0x189605438];
      while (1)
      {
        int v22 = &sFileProviderGlobals[7 * v20];
        int v24 = *((_DWORD *)v22 + 5);
        uint64_t v23 = (int *)v22 + 5;
        if (v24 >= 1) {
          break;
        }
        int64_t v28 = v19;
LABEL_17:
        ++v20;
        uint64_t v19 = v28;
        uint64_t v9 = v99;
        if (v20 == v99) {
          goto LABEL_34;
        }
      }

      uint64_t v25 = 0LL;
      uint64_t v26 = 0LL;
      while (1)
      {
        uint64_t v27 = sFileProviderGlobals[7 * v20 + 8] + v25;
        if (CFDictionaryGetValueIfPresent(a2, *(const void **)(v27 + 8), (const void **)&value))
        {
          int64_t v28 = value;
          if (!value)
          {
            int64_t v28 = v100;
            value = v100;
          }

          CFIndex v29 = *(const void **)(v27 + 8);
          if (v29 == v21)
          {
            v107[0] = v28;
            goto LABEL_14;
          }

          CFIndex v30 = (char *)v102;
          uint64_t v31 = v102[v20];
          *(&v104[96 * v20] + v31) = v29;
          v103[96 * v20 + v31] = (uint64_t)v28;
          *(void *)(v101 + 768 * v20 + 8 * v31) = *(void *)v27;
          *(void *)&v30[8 * v20] = v31 + 1;
        }

        int64_t v28 = v19;
LABEL_14:
        ++v26;
        v25 += 148LL;
        uint64_t v19 = v28;
        if (v26 >= *v23) {
          goto LABEL_17;
        }
      }
    }

LABEL_21:
    CFDictionaryRef v97 = a4;
    uint64_t v100 = &v95;
    uint64_t v33 = MEMORY[0x1895F8858](v18);
    CFIndex v35 = (const void **)((char *)&v95 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    MEMORY[0x1895F8858](v33);
    uint64_t v37 = (void **)((char *)&v95 - v36);
    CFDictionaryGetKeysAndValues(a2, v35, (const void **)((char *)&v95 - v36));
    int64_t v28 = 0LL;
    CFIndex v38 = (const void *)*MEMORY[0x189605438];
    CFURLRef v39 = (void *)*MEMORY[0x189605018];
    do
    {
      uint64_t v40 = (char *)CFDictionaryGetValue((CFDictionaryRef)qword_18C4639F8, *v35);
      if (v40)
      {
        CFTypeRef v41 = (const void *)*((void *)v40 + 1);
        if (v41 == v38)
        {
          if (*v37) {
            int64_t v28 = *v37;
          }
          else {
            int64_t v28 = v39;
          }
          v107[0] = v28;
        }

        else
        {
          uint64_t v42 = **(int **)(v40 + 140);
          uint64_t v43 = (char *)v102;
          uint64_t v44 = v102[v42];
          if (v44 <= 95)
          {
            *(&v104[96 * v42] + v44) = v41;
            uint64_t v45 = *v37;
            if (!*v37) {
              uint64_t v45 = v39;
            }
            v14[96 * v42 + v44] = (uint64_t)v45;
            *(void *)(v101 + 768 * v42 + 8 * v44) = *(void *)v40;
            *(void *)&v43[8 * v42] = v44 + 1;
          }
        }
      }

      ++v37;
      ++v35;
      --Count;
    }

    while (Count);
    uint64_t v103 = v14;
    CFTypeRef v96 = v7;
LABEL_34:
    CFTypeRef v7 = v96;
    _FileCacheLock((uint64_t)v96);
    if (v9 < 1)
    {
      uint64_t v56 = 0LL;
      int v32 = 1;
LABEL_41:
      a4 = v97;
      if (v28)
      {
        uint64_t v57 = (uint64_t)v7;
        uint64_t v58 = MEMORY[0x189605438];
        unint64_t v59 = 0x18C463000uLL;
        int v60 = (char *)CFDictionaryGetValue((CFDictionaryRef)qword_18C4639F8, (const void *)*MEMORY[0x189605438]);
        value = *(void **)v60;
        uint64_t v61 = *(void *)(v60 + 140);
        int v62 = *(uint64_t (**)(const __CFURL *, uint64_t, uint64_t, void *, void **, uint64_t, uint64_t, CFErrorRef *))(v61 + 40);
        uint64_t v63 = *(void *)(v61 + 8);
        _FileCacheIncrementInProvider(v57);
        uint64_t v64 = (uint64_t)v98;
        uint64_t v65 = v58;
        CFTypeRef v7 = (CFTypeRef)v57;
        int v32 = v62(v98, v57, v65, v107, &value, 1LL, v63, a4);
        _FileCacheDecrementInProvider(v57);
        uint64_t v66 = (char *)v102;
        if (v32) {
          clearPropertyAndDependentValues(v64, v57, (uint64_t)v60);
        }
        goto LABEL_64;
      }

      uint64_t v66 = (char *)v102;
    }

    else
    {
      uint64_t v100 = 0LL;
      int v32 = 1;
      uint64_t v46 = v101;
      uint64_t v47 = v102;
      int v48 = v104;
      uint64_t v49 = &qword_18C4638F8;
      while (1)
      {
        uint64_t v50 = *v47;
        uint64_t v51 = v103;
        if (*v47 >= 1)
        {
          uint64_t v52 = (uint64_t (*)(const __CFURL *, CFTypeRef, const void **, uint64_t *, uint64_t, uint64_t, uint64_t, CFErrorRef *))*v49;
          uint64_t v53 = *(v49 - 4);
          _FileCacheIncrementInProvider((uint64_t)v7);
          int v54 = v52(v98, v7, v48, v51, v46, v50, v53, v97);
          uint64_t v9 = v99;
          int v32 = v54;
          uint64_t v55 = _FileCacheDecrementInProvider((uint64_t)v7);
          if (!v32) {
            break;
          }
        }

        v48 += 96;
        ++v47;
        v46 += 768LL;
        uint64_t v103 = v51 + 96;
        v49 += 7;
        uint64_t v100 = (uint64_t *)((char *)v100 + 1);
        if ((uint64_t *)v9 == v100)
        {
          uint64_t v56 = (void *)v9;
          goto LABEL_41;
        }
      }

      if (!v97)
      {
        int v32 = 0;
        uint64_t v66 = (char *)v102;
        unint64_t v59 = 0x18C463000LL;
        uint64_t v56 = v100;
        a4 = 0LL;
        goto LABEL_64;
      }

      if (!*v97)
      {
        BOOL v75 = os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR);
        uint64_t v66 = (char *)v102;
        if (v75) {
          _FSURLSetResourcePropertiesForKeys_cold_2();
        }
        int v32 = 0;
        unint64_t v59 = 0x18C463000LL;
        uint64_t v56 = v100;
        a4 = v97;
        goto LABEL_64;
      }

      CFTypeRef v96 = v7;
      CFTypeID v67 = v97;
      MEMORY[0x1895F8858](v55);
      uint64_t v70 = (const void **)(&v95 - 32 * v69);
      if (v68 <= (uint64_t)v100)
      {
        CFIndex v71 = 0LL;
      }

      else
      {
        CFIndex v71 = 0LL;
        uint64_t v72 = v68 - (void)v100;
        do
        {
          uint64_t v74 = *v47++;
          uint64_t v73 = v74;
          if (v74 >= 1)
          {
            memcpy(&v70[v71], v48, 8 * v73);
            v71 += v73;
          }

          v48 += 96;
          --v72;
        }

        while (v72);
      }

      uint64_t v76 = v98;
      uint64_t v77 = CFGetAllocator(v98);
      CFArrayRef v78 = CFArrayCreate(v77, v70, v71, MEMORY[0x189605228]);
      value = v78;
      CFDictionaryRef v79 = CFErrorCopyUserInfo(*v67);
      if (v79)
      {
        uint64_t v80 = v79;
        uint64_t v81 = CFGetAllocator(v76);
        MutableCFStringRef Copy = CFDictionaryCreateMutableCopy(v81, 0LL, v80);
        CFDictionaryAddValue(MutableCopy, (const void *)*MEMORY[0x1896053F8], v78);
        CFRelease(v80);
      }

      else
      {
        keys = (void *)*MEMORY[0x1896053F8];
        CFTypeID v83 = CFGetAllocator(v76);
        MutableCFStringRef Copy = CFDictionaryCreate( v83,  (const void **)&keys,  (const void **)&value,  1LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
      }

      uint64_t v66 = (char *)v102;
      uint64_t v56 = v100;
      uint64_t v84 = CFGetAllocator(v76);
      a4 = v67;
      CFErrorDomain Domain = CFErrorGetDomain(*v67);
      CFIndex Code = CFErrorGetCode(*v67);
      CFErrorRef v87 = CFErrorCreate(v84, Domain, Code, MutableCopy);
      CFRelease(*v67);
      CFRelease(value);
      CFRelease(MutableCopy);
      *CFTypeID v67 = v87;
      int v32 = 0;
      CFTypeRef v7 = v96;
    }

    unint64_t v59 = 0x18C463000uLL;
LABEL_64:
    if (v56)
    {
      int v88 = 0LL;
      uint64_t v89 = (uint64_t)v98;
      do
      {
        uint64_t v90 = *(void *)&v66[8 * (void)v88];
        if (v90 >= 1)
        {
          CFURLRef v91 = v104;
          do
          {
            uint64_t v92 = *v91++;
            CFIndex v93 = CFDictionaryGetValue(*(CFDictionaryRef *)(v59 + 2552), v92);
            clearPropertyAndDependentValues(v89, (uint64_t)v7, (uint64_t)v93);
            --v90;
          }

          while (v90);
        }

        int v88 = (void *)((char *)v88 + 1);
        v104 += 96;
      }

      while (v88 != v56);
    }

    goto LABEL_70;
  }

  _FileCacheLock((uint64_t)v7);
  int v32 = 1;
LABEL_70:
  _FileCacheUnlock((uint64_t)v7);
  if (a4 && !v32)
  {
    if (*a4)
    {
      LOBYTE(v32) = 0;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
        _FSURLSetResourcePropertiesForKeys_cold_1();
      }
      LOBYTE(v32) = 0;
      *a4 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 256LL, 0LL);
    }
  }

  return v32;
}

BOOL _FSURLResourceIsReachable(const __CFString *a1, CFErrorRef *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (!a1)
  {
    if (!a2) {
      return 0LL;
    }
    CFErrorRef v7 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 4LL, 0LL);
    goto LABEL_11;
  }

  if (!CFURLGetFileSystemRepresentation((CFURLRef)a1, 1u, buffer, 1024LL))
  {
    if (!a2) {
      return 0LL;
    }
    unint64_t v8 = CFGetAllocator(a1);
    CFErrorRef v7 = _FSURLCreateStandardError(v8, (const __CFString *)*MEMORY[0x189604F40], 4LL, 0, a1, 0LL);
LABEL_11:
    BOOL v6 = 0LL;
    goto LABEL_17;
  }

  if (faccessat(-2, (const char *)buffer, 0, 48))
  {
    if (*__error() == 22)
    {
      int v4 = lstat((const char *)buffer, &v12);
      BOOL v5 = v4 != 0;
      BOOL v6 = v4 == 0;
      if (!a2)
      {
LABEL_18:
        if (!a2) {
          return v6;
        }
        goto LABEL_19;
      }
    }

    else
    {
      BOOL v6 = 0LL;
      BOOL v5 = 1;
      if (!a2) {
        goto LABEL_18;
      }
    }

    if (!v5) {
      goto LABEL_18;
    }
    uint64_t v9 = *__error();
    uint64_t v10 = CFGetAllocator(a1);
    CFErrorRef v7 = _FSURLCreateStandardError(v10, (const __CFString *)*MEMORY[0x189604F58], v9, 0, a1, 0LL);
LABEL_17:
    *a2 = v7;
    goto LABEL_18;
  }

  BOOL v6 = 1LL;
  if (!a2) {
    return v6;
  }
LABEL_19:
  if (!v6)
  {
    if (*a2) {
      return 0LL;
    }
    if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
      _FSURLResourceIsReachable_cold_1();
    }
    BOOL v6 = 0LL;
    *a2 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 256LL, 0LL);
  }

  return v6;
}

CFErrorRef _FSURLCreateStandardError( const __CFAllocator *a1, const __CFString *a2, uint64_t a3, int a4, const __CFString *cf, void *a6)
{
  CFErrorRef v7 = cf;
  userInfoKeys[6] = *(void **)MEMORY[0x1895F89C0];
  if (!cf)
  {
LABEL_8:
    uint64_t v13 = 0LL;
    goto LABEL_9;
  }

  CFTypeID v12 = CFGetTypeID(cf);
  if (v12 != CFURLGetTypeID())
  {
    if (v12 == CFStringGetTypeID())
    {
      CFErrorRef v7 = (const __CFString *)CFRetain(v7);
      size_t v16 = CFGetAllocator(v7);
      Boolean HasSuffix = CFStringHasSuffix(v7, @"/");
      uint64_t v13 = CFURLCreateWithFileSystemPath(v16, v7, kCFURLPOSIXPathStyle, HasSuffix);
      goto LABEL_9;
    }

    CFErrorRef v7 = 0LL;
    goto LABEL_8;
  }

  uint64_t v13 = (const __CFURL *)CFRetain(v7);
  uint64_t v14 = CFURLCopyAbsoluteURL(v13);
  if (v14)
  {
    uint64_t v15 = v14;
    CFErrorRef v7 = CFURLCopyFileSystemPath(v14, kCFURLPOSIXPathStyle);
    CFRelease(v15);
  }

  else
  {
    CFErrorRef v7 = 0LL;
  }

LABEL_13:
  if (a6)
  {
    userInfoKeys[v20] = @"NSURLKeys";
    userInfoValues[v20++] = a6;
  }

  if (v19)
  {
    userInfoKeys[v20] = (void *)*MEMORY[0x189604F88];
    userInfoValues[v20++] = v19;
  }

  CFErrorRef v21 = CFErrorCreateWithUserInfoKeysAndValues( a1,  v18,  code,  (const void *const *)userInfoKeys,  (const void *const *)userInfoValues,  v20);
  if (v13) {
    CFRelease(v13);
  }
  if (v7) {
    CFRelease(v7);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (!v21)
  {
    if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
      _FSURLCreateStandardError_cold_1();
    }
    return CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v18, 256LL, 0LL);
  }

  return v21;
}

uint64_t _FSURLCopyResourcePropertyValuesAndFlags( const void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6, CFTypeRef cf, CFErrorRef *a8)
{
  uint64_t v89 = a2;
  uint64_t v97 = *MEMORY[0x1895F89C0];
  CFTypeRef v92 = a1;
  CFTypeRef v13 = _FileCacheGetForURL((const __CFURL *)a1, cf);
  uint64_t v93 = (uint64_t)v13;
  uint64_t v14 = qword_18C4638C8;
  if (_FSURLCopyResourcePropertyValuesAndFlags::sOnce != -1) {
    dispatch_once(&_FSURLCopyResourcePropertyValuesAndFlags::sOnce, &__block_literal_global_2);
  }
  if (_FSURLCopyResourcePropertyValuesAndFlags::maskToPropertyTableCount) {
    uint64_t v15 = 31LL;
  }
  else {
    uint64_t v15 = 0LL;
  }
  uint64_t v16 = MEMORY[0x1895F8858](v13);
  uint64_t v17 = MEMORY[0x1895F8858](v16);
  CFErrorRef v19 = (char *)&v80 - v18;
  uint64_t v20 = MEMORY[0x1895F8858](v17);
  uint64_t v21 = MEMORY[0x1895F8858](v20);
  MEMORY[0x1895F8858](v21);
  uint64_t v26 = (char *)&v80 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int v27 = 0;
  if (a3 && a4 && a6)
  {
    CFTypeID v85 = a3;
    uint64_t v86 = a4;
    CFErrorRef v87 = (uint64_t *)((char *)&v80 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL));
    if (v14 >= 1)
    {
      int64_t v28 = v23;
      uint64_t v29 = v24;
      uint64_t v30 = v25;
      bzero(v26, v22);
      uint64_t v25 = v30;
      uint64_t v24 = v29;
      uint64_t v26 = (char *)v87;
      uint64_t v23 = v28;
    }

    uint64_t v31 = _ZZZ40_FSURLCopyResourcePropertyValuesAndFlagsEUb_E8theTable;
    int v32 = (void *)(_FSURLCopyResourcePropertyValuesAndFlags::maskToPropertyTable + 32);
    uint64_t v33 = v89;
    do
    {
      int v34 = *((_DWORD *)v32 - 6);
      if (v34) {
        uint64_t v35 = a5;
      }
      else {
        uint64_t v35 = v33;
      }
      if ((v35 & v31) != 0)
      {
        uint64_t v36 = *(v32 - 1);
        uint64_t v37 = **(int **)(v36 + 140);
        uint64_t v38 = *(void *)&v26[8 * v37];
        if (v38 <= 95)
        {
          uint64_t v39 = (int)v15 * (uint64_t)(int)v37;
          *(void *)(v24 + 8 * v39 + 8 * v38) = *(void *)(v36 + 8);
          *(void *)&v19[8 * v39 + 8 * v38] = 0LL;
          *(void *)(v25 + 8 * v39 + 8 * v38) = *(void *)v36;
          if (v34 == 1)
          {
            v23[v39 + v38] = v31;
            *(void *)&v26[8 * v37] = v38 + 1;
          }
        }
      }

      uint64_t v40 = *v32;
      v32 += 4;
      uint64_t v31 = v40;
    }

    while (v40);
    uint64_t v90 = v25;
    uint64_t v91 = v24;
    uint64_t v84 = v23;
    _FileCacheLock(v93);
    memset(v96, 0, 60);
    uint64_t v41 = _ZZZ40_FSURLCopyResourcePropertyValuesAndFlagsEUb_E8theTable;
    uint64_t v42 = (void *)(_FSURLCopyResourcePropertyValuesAndFlags::maskToPropertyTable + 32);
    uint64_t v44 = v85;
    uint64_t v43 = v86;
    do
    {
      if (*((_DWORD *)v42 - 6)) {
        uint64_t v45 = a5;
      }
      else {
        uint64_t v45 = v33;
      }
      if ((v45 & v41) != 0) {
        addPropertyAndDependenciesToBitmap(*(v42 - 1), (uint64_t)v96);
      }
      uint64_t v46 = *v42;
      v42 += 4;
      uint64_t v41 = v46;
    }

    while (v46);
    uint64_t v47 = v93;
    _FileCacheLockTransitionToPreparer(v93);
    int v27 = prepareValuesForBitmap((uint64_t)v92, v47, (uint64_t)v96, (uint64_t)a8);
    _FileCacheLockTransitionFromPreparer(v47);
    if (v27)
    {
      CFTypeID v83 = a6;
      uint64_t v48 = 8 * v15;
      if (v14 < 1) {
        goto LABEL_34;
      }
      unsigned int v82 = a8;
      uint64_t v49 = 0LL;
      uint64_t v50 = v87;
      uint64_t v81 = v14;
      uint64_t v51 = &qword_18C4638E0;
      uint64_t v88 = 8 * v15;
      do
      {
        uint64_t v53 = *v50++;
        uint64_t v52 = v53;
        if (v53 >= 1)
        {
          __int16 v94 = (uint64_t (*)(CFTypeRef, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t))*v51;
          uint64_t v95 = v50;
          uint64_t v54 = v91 + v49;
          uint64_t v55 = &v19[v49];
          uint64_t v56 = v90 + v49;
          uint64_t v57 = v19;
          uint64_t v58 = *(v51 - 1);
          uint64_t v59 = v93;
          _FileCacheIncrementInProvider(v93);
          uint64_t v60 = v58;
          CFErrorRef v19 = v57;
          int v27 = v94(v92, v59, v54, v55, v56, v52, v60);
          uint64_t v61 = v59;
          uint64_t v48 = v88;
          _FileCacheDecrementInProvider(v61);
          uint64_t v50 = v95;
        }

        v49 += v48;
        v51 += 7;
        --v14;
      }

      while (v14);
      a8 = v82;
      uint64_t v14 = v81;
      uint64_t v44 = v85;
      uint64_t v43 = v86;
      if (v27)
      {
LABEL_34:
        int v62 = v83;
        void *v83 = 0LL;
        void *v44 = 0LL;
        uint64_t Attributes = _FileCacheGetAttributes(v93);
        uint64_t v64 = Attributes;
        if ((v89 & 1) != 0)
        {
          uint64_t v65 = *(const void **)(Attributes + 8);
          if (v65)
          {
            *(void *)uint64_t v43 = CFRetain(v65);
            *v44 |= 1uLL;
          }

          else
          {
            *(void *)uint64_t v43 = 0LL;
          }
        }

        if ((v89 & 2) != 0)
        {
          *v44 |= 2uLL;
          *(_DWORD *)(v43 + 8) = *(_DWORD *)(v64 + 24);
        }

        uint64_t v66 = v84;
        CFTypeID v67 = (char *)v87;
        if ((v89 & 4) != 0)
        {
          *v44 |= 4uLL;
          unsigned int v68 = *(_DWORD *)(v64 + 112);
          if (v68)
          {
            uint64_t v69 = 0LL;
          }

          else
          {
            unsigned int v68 = *(_DWORD *)(v64 + 104);
            uint64_t v69 = *(unsigned int *)(v64 + 108);
          }

          *(void *)(v43 + 16) = v68 | (unint64_t)(v69 << 32);
        }

        if ((v89 & 8) != 0)
        {
          *v44 |= 8uLL;
          *(void *)(v43 + 24) = *(void *)(v64 + 120);
        }

        if ((v89 & 0x10) != 0)
        {
          double v70 = *(double *)(v64 + 80);
          if (v70 == -1.0 - *MEMORY[0x189604DA0]) {
            double v70 = -*MEMORY[0x189604DA8];
          }
          else {
            *v44 |= 0x10uLL;
          }
          *(double *)(v43 + 32) = v70;
        }

        if ((v89 & 0x20) != 0)
        {
          *v44 |= 0x20uLL;
          *(void *)(v43 + 40) = *(void *)(v64 + 64);
        }

        if ((v89 & 0x40) != 0)
        {
          *v44 |= 0x40uLL;
          *(void *)(v43 + 48) = *(void *)(v64 + 72);
        }

        if ((v89 & 0x80) != 0)
        {
          *v44 |= 0x80uLL;
          *(void *)(v43 + 56) = *(void *)(v64 + 208);
        }

        if ((v89 & 0x100) != 0)
        {
          *v44 |= 0x100uLL;
          *(void *)(v43 + 64) = *(void *)(v64 + 216);
        }

        if ((v89 & 0x200) != 0)
        {
          *v44 |= 0x200uLL;
          *(void *)(v43 + 72) = *(void *)(v64 + 192);
        }

        if ((v89 & 0x400) != 0)
        {
          *v44 |= 0x400uLL;
          *(void *)(v43 + 80) = *(void *)(v64 + 200);
        }

        if ((v89 & 0x800) != 0)
        {
          CFIndex v71 = (_OWORD *)(v43 + 88);
          *v44 |= 0x800uLL;
          if ((*(_DWORD *)v64 & 0x4000010) == 0x10)
          {
            *CFIndex v71 = *(_OWORD *)(v64 + 160);
            *(_OWORD *)(v43 + 104) = *(_OWORD *)(v64 + 176);
          }

          else
          {
            *CFIndex v71 = 0u;
            *(_OWORD *)(v43 + 104) = 0u;
          }

          if ((*(_DWORD *)(v64 + 16) & 0xF000) == 0xA000)
          {
            *(void *)(v43 + 88) = 0x72686170736C6E6BLL;
            *(_WORD *)(v43 + 96) = *(_WORD *)(v43 + 96) & 0x4000 | 0x8000;
            *(void *)(v43 + 104) = 0LL;
            *(void *)(v43 + 112) = 0LL;
          }
        }

        if ((v89 & 0x1000) != 0)
        {
          if ((*(_BYTE *)v64 & 0x80) != 0)
          {
            *v44 |= 0x1000uLL;
            uint64_t v73 = CFGetAllocator(v92);
            CFFileSecurityRef Copy = CFFileSecurityCreateCopy(v73, *(CFFileSecurityRef *)(v64 + 224));
            CFTypeID v67 = (char *)v87;
          }

          else
          {
            CFFileSecurityRef Copy = 0LL;
          }

          *(void *)(v43 + 120) = Copy;
          uint64_t v66 = v84;
        }

        if (v14 >= 1)
        {
          uint64_t v74 = 0LL;
          uint64_t v75 = *MEMORY[0x189604DE8];
          do
          {
            uint64_t v76 = *(void *)&v67[8 * v74];
            if (v76 >= 1)
            {
              uint64_t v77 = v19;
              CFArrayRef v78 = v66;
              do
              {
                if (*v77 == v75) {
                  *v62 |= *v78;
                }
                ++v78;
                ++v77;
                --v76;
              }

              while (v76);
            }

            ++v74;
            uint64_t v66 = (void *)((char *)v66 + v48);
            v19 += v48;
          }

          while (v74 != v14);
        }
      }
    }

    _FileCacheUnlock(v93);
  }

  if (a8 && !v27 && !*a8)
  {
    if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
      _FSURLCopyResourcePropertyValuesAndFlags_cold_1();
    }
    *a8 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 256LL, 0LL);
  }

  return v27;
}

uint64_t prepareValuesForBitmap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = a4;
  uint64_t v28 = a3;
  uint64_t v26 = a1;
  uint64_t v33 = *MEMORY[0x1895F89C0];
  if (qword_18C4638C8 < 1)
  {
    LOBYTE(v6) = 1;
  }

  else
  {
    uint64_t v5 = 0LL;
    LOBYTE(v6) = 1;
    do
    {
      CFErrorRef v7 = (uint64_t *)(v28 + 12 * v5);
      uint64_t v31 = *v7;
      int v32 = *((_DWORD *)v7 + 2);
      uint64_t IsNotZero = PropertyMaskIsNotZero((uint64_t)&v31, (unint64_t *)&v30, &v29);
      if ((_DWORD)IsNotZero)
      {
        uint64_t v9 = MEMORY[0x1895F8858](IsNotZero);
        uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        MEMORY[0x1895F8858](v9);
        CFTypeRef v13 = (char *)&v26 - v12;
        if (v30 <= v29)
        {
          uint64_t v14 = 0LL;
          uint64_t v15 = v31;
          int v16 = v32;
          unint64_t v17 = v29 - v30 + 1;
          unint64_t v18 = sFileProviderGlobals[7 * v5 + 8] + 148 * v30;
          do
          {
            int v19 = *(_DWORD *)(v18 + 136);
            uint64_t v20 = 1LL << v19;
            if (v19 >= 64) {
              uint64_t v20 = 0LL;
            }
            if ((v20 & v15) != 0 || (v19 >= 64 ? (int v21 = 1 << v19) : (int v21 = 0), (v16 & v21) != 0))
            {
              *(void *)&v11[8 * v14] = *(void *)(v18 + 8);
              *(void *)&v13[8 * v14++] = *(void *)v18;
            }

            v18 += 148LL;
            --v17;
          }

          while (v17);
        }

        else
        {
          uint64_t v14 = 0LL;
        }

        size_t v22 = &sFileProviderGlobals[7 * v5];
        uint64_t v23 = (uint64_t (*)(uint64_t, uint64_t, char *, char *, uint64_t, uint64_t, uint64_t))v22[5];
        uint64_t v24 = v22[3];
        _FileCacheIncrementInProvider(a2);
        int v6 = v23(v26, a2, v11, v13, v14, v24, v27);
        _FileCacheDecrementInProvider(a2);
        if (!v6) {
          break;
        }
      }

      ++v5;
    }

    while (v5 < qword_18C4638C8);
  }

  return v6;
}

uint64_t _FSURLGetResourcePropertyFlags( const __CFURL *a1, uint64_t a2, void *a3, CFTypeRef cf, CFErrorRef *a5)
{
  uint64_t v100 = *MEMORY[0x1895F89C0];
  uint64_t v93 = a1;
  CFTypeRef v8 = _FileCacheGetForURL(a1, cf);
  uint64_t v98 = (uint64_t)v8;
  uint64_t v9 = qword_18C4638C8;
  uint64_t v88 = a5;
  if (_FSURLGetResourcePropertyFlags::sOnce != -1) {
    dispatch_once(&_FSURLGetResourcePropertyFlags::sOnce, &__block_literal_global_4);
  }
  if (_FSURLGetResourcePropertyFlags::maskToPropertyTableCount) {
    uint64_t v10 = 18LL;
  }
  else {
    uint64_t v10 = 0LL;
  }
  uint64_t v11 = MEMORY[0x1895F8858](v8);
  uint64_t v97 = &v85 - v12;
  uint64_t v13 = MEMORY[0x1895F8858](v11);
  uint64_t v15 = &v85 - v14;
  uint64_t v16 = MEMORY[0x1895F8858](v13);
  CFTypeRef v96 = &v85 - v17;
  uint64_t v18 = MEMORY[0x1895F8858](v16);
  uint64_t v20 = &v85 - v19;
  MEMORY[0x1895F8858](v18);
  size_t v22 = (char *)&v85 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3)
  {
    if (v9 >= 1) {
      bzero((char *)&v85 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL), v21);
    }
    uint64_t v23 = _ZZZ30_FSURLGetResourcePropertyFlagsEUb0_E8theTable;
    uint64_t v24 = (uint64_t *)(_FSURLGetResourcePropertyFlags::maskToPropertyTable + 24);
    do
    {
      if ((v23 & a2) != 0)
      {
        uint64_t v25 = *(v24 - 1);
        uint64_t v26 = **(int **)(v25 + 140);
        uint64_t v27 = *(void *)&v22[8 * v26];
        if (v27 <= 95)
        {
          uint64_t v28 = (int)v10 * (uint64_t)(int)v26;
          v97[v28 + v27] = *(void *)(v25 + 8);
          v15[v28 + v27] = 0LL;
          v96[v28 + v27] = *(void *)v25;
          v20[v28 + v27] = v23;
          *(void *)&v22[8 * v26] = v27 + 1;
        }
      }

      uint64_t v29 = *v24;
      v24 += 3;
      uint64_t v23 = v29;
    }

    while (v29);
    uint64_t v89 = v20;
    uint64_t v90 = a3;
    uint64_t v30 = v98;
    _FileCacheLock(v98);
    uint64_t v31 = 8 * v10;
    uint64_t v94 = 8 * v10;
    uint64_t v91 = v9;
    CFErrorRef v87 = v22;
    if (v9 < 1)
    {
      int v34 = 1;
LABEL_31:
      _FileCacheUnlock(v30);
      uint64_t v44 = v90;
      uint64_t v45 = v91;
      uint64_t v46 = v89;
    }

    else
    {
      uint64_t v86 = a2;
      uint64_t v95 = v22 - 8;
      uint64_t v32 = v9;
      uint64_t v33 = &sFileProviderGlobals[7 * v9 - 4];
      int v34 = 1;
      uint64_t v92 = 8 * v10 * (v9 - 1);
      uint64_t v35 = v92;
      while (1)
      {
        uint64_t v36 = *(void *)&v95[8 * v32];
        if (v36 >= 1)
        {
          uint64_t v37 = (char *)v97 + v35;
          uint64_t v38 = (char *)v96 + v35;
          uint64_t v39 = *v33;
          uint64_t v40 = (uint64_t (*)(const __CFURL *, uint64_t, char *, char *, char *, uint64_t, uint64_t))v33[1];
          _FileCacheIncrementInProvider(v98);
          int v41 = v40(v93, v98, v37, (char *)v15 + v35, v38, v36, v39);
          uint64_t v30 = v98;
          int v34 = v41;
          _FileCacheDecrementInProvider(v98);
          uint64_t v31 = v94;
          if (!v34) {
            break;
          }
        }

        v35 -= v31;
        v33 -= 7;
        BOOL v42 = v32-- <= 1;
        if (v42) {
          goto LABEL_31;
        }
      }

      int v43 = _FileCacheLockTransitionToPreparer(v30);
      uint64_t v44 = v90;
      uint64_t v45 = v91;
      uint64_t v46 = v89;
      if (!v43)
      {
        _FileCacheLock(v98);
        BOOL v42 = v45 < 1;
        uint64_t v47 = v94;
        uint64_t v48 = v92;
        if (!v42)
        {
          int v34 = 0;
          uint64_t v49 = v91;
          uint64_t v50 = &sFileProviderGlobals[7 * v91 - 4];
          uint64_t v51 = v98;
          while (1)
          {
            uint64_t v52 = *(void *)&v95[8 * v49];
            if (v52 >= 1)
            {
              uint64_t v53 = (char *)v97 + v48;
              uint64_t v54 = (char *)v15 + v48;
              uint64_t v55 = (char *)v96 + v48;
              uint64_t v92 = v48;
              uint64_t v57 = *v50;
              uint64_t v56 = (uint64_t (*)(const __CFURL *, uint64_t, char *, char *, char *, uint64_t, uint64_t))v50[1];
              _FileCacheIncrementInProvider(v51);
              int v58 = v56(v93, v51, v53, v54, v55, v52, v57);
              uint64_t v48 = v92;
              int v34 = v58;
              _FileCacheDecrementInProvider(v51);
              uint64_t v47 = v94;
              if (!v34) {
                break;
              }
            }

            v48 -= v47;
            v50 -= 7;
            BOOL v42 = v49-- <= 1;
            if (v42)
            {
              _FileCacheUnlock(v98);
              uint64_t v44 = v90;
              uint64_t v45 = v91;
              uint64_t v46 = v89;
              if (v34) {
                goto LABEL_44;
              }
              goto LABEL_33;
            }
          }
        }

        _FileCacheUnlock(v98);
        uint64_t v44 = v90;
        uint64_t v45 = v91;
        uint64_t v46 = v89;
      }

LABEL_33:
      memset(v99, 0, 60);
      uint64_t v59 = _ZZZ30_FSURLGetResourcePropertyFlagsEUb0_E8theTable;
      uint64_t v60 = (uint64_t *)(_FSURLGetResourcePropertyFlags::maskToPropertyTable + 24);
      uint64_t v61 = (uint64_t *)v87;
      uint64_t v62 = v86;
      do
      {
        if ((v59 & v62) != 0) {
          addPropertyAndDependenciesToBitmap(*(v60 - 1), (uint64_t)v99);
        }
        uint64_t v63 = *v60;
        v60 += 3;
        uint64_t v59 = v63;
      }

      while (v63);
      uint64_t v64 = v98;
      int v34 = prepareValuesForBitmap((uint64_t)v93, v98, (uint64_t)v99, (uint64_t)v88);
      if (v34)
      {
        _FileCacheLock(v64);
        if (v45 >= 1)
        {
          uint64_t v65 = 0LL;
          uint64_t v66 = v61;
          CFTypeID v67 = &qword_18C4638E0;
          uint64_t v68 = v94;
          uint64_t v69 = v98;
          do
          {
            uint64_t v71 = *v66++;
            uint64_t v70 = v71;
            if (v71 >= 1)
            {
              uint64_t v95 = (char *)*v67;
              uint64_t v72 = (char *)v97 + v65;
              uint64_t v73 = (char *)v96 + v65;
              uint64_t v92 = *(v67 - 1);
              _FileCacheIncrementInProvider(v69);
              int v34 = ((uint64_t (*)(const __CFURL *, uint64_t, char *, char *, char *, uint64_t, uint64_t))v95)( v93,  v69,  v72,  (char *)v15 + v65,  v73,  v70,  v92);
              _FileCacheDecrementInProvider(v69);
              uint64_t v68 = v94;
            }

            v65 += v68;
            v67 += 7;
            --v45;
          }

          while (v45);
        }

        _FileCacheUnlock(v98);
        uint64_t v44 = v90;
        uint64_t v45 = v91;
        uint64_t v46 = v89;
      }

    *((void *)&v21 + 1) |= 8uLL;
    if ((v18.f_flags & 0x400) == 0)
    {
LABEL_12:
      if ((v18.f_flags & 0x4000) == 0) {
        goto LABEL_13;
      }
      goto LABEL_35;
    }

  uint64_t v23 = __error();
  if (!a7) {
    goto LABEL_39;
  }
  uint64_t v24 = *v23;
  uint64_t v25 = CFGetAllocator(a1);
  uint64_t v26 = (const __CFString *)*MEMORY[0x189604F58];
  uint64_t v27 = v24;
LABEL_35:
  uint64_t v28 = 0LL;
  *a7 = _FSURLCreateStandardError(v25, v26, v27, 0, a1, 0LL);
LABEL_50:
  _FileCacheUnlock(a2);
  return v28;
}

LABEL_53:
  CFTypeID v83 = v88;
  if (v88 && !v34)
  {
    if (*v88)
    {
      LOBYTE(v34) = 0;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
        _FSURLGetResourcePropertyFlags_cold_1();
      }
      LOBYTE(v34) = 0;
      CFErrorRef *v83 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 256LL, 0LL);
    }
  }

  return v34;
}

uint64_t _FSURLGetVolumePropertyFlags( const __CFURL *a1, uint64_t a2, uint64_t *a3, CFTypeRef cf, CFErrorRef *a5)
{
  CFTypeRef v9 = _FileCacheGetForURL(a1, cf);
  _FileCacheLock((uint64_t)v9);
  int Value = CFDictionaryGetValue((CFDictionaryRef)qword_18C4639F8, @"__kCFURLCheapVolumeInformationKey");
  memset(v15, 0, 60);
  addPropertyAndDependenciesToBitmap((uint64_t)Value, (uint64_t)v15);
  _FileCacheLockTransitionToPreparer((uint64_t)v9);
  uint64_t v11 = prepareValuesForBitmap((uint64_t)a1, (uint64_t)v9, (uint64_t)v15, (uint64_t)a5);
  _FileCacheLockTransitionFromPreparer((uint64_t)v9);
  if ((_DWORD)v11)
  {
    VolumeInfo = (const __CFData *)_FileCacheGetVolumeInfo((uint64_t)v9);
    if (VolumeInfo)
    {
      *a3 = *((void *)CFDataGetBytePtr(VolumeInfo) + 4) & a2;
    }

    else if (a5)
    {
      uint64_t v13 = CFGetAllocator(a1);
      uint64_t v11 = 0LL;
      *a5 = _FSURLCreateStandardError( v13,  (const __CFString *)*MEMORY[0x189604F40],  256LL,  0,  (const __CFString *)a1,  0LL);
    }

    else
    {
      uint64_t v11 = 0LL;
    }
  }

  _FileCacheUnlock((uint64_t)v9);
  if (a5 && !(_DWORD)v11 && !*a5)
  {
    if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
      _FSURLGetVolumePropertyFlags_cold_1();
    }
    *a5 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 256LL, 0LL);
  }

  return v11;
}

void _FSURLClearResourcePropertyCacheForKey(const __CFURL *a1, const void *a2, CFTypeRef cf)
{
  if (!cf) {
    return;
  }
  int v6 = _FileCacheGetForURL(a1, cf);
  CFErrorRef v7 = v6;
  if (a2)
  {
    int Value = CFDictionaryGetValue((CFDictionaryRef)qword_18C4639F8, a2);
    if (Value)
    {
      uint64_t v9 = (uint64_t)Value;
      _FileCacheLock((uint64_t)v7);
      clearPropertyAndDependentValues((uint64_t)a1, (uint64_t)v7, v9);
      _FileCacheUnlock((uint64_t)v7);
      goto LABEL_10;
    }

    _FileCacheLockTempPermProperties();
    CFMutableDictionaryRef TemporaryPropertyDictionary = _FileCacheGetTemporaryPropertyDictionary(v7, 0);
    if (TemporaryPropertyDictionary) {
      CFDictionaryRemoveValue(TemporaryPropertyDictionary, a2);
    }
    _FileCacheUnlockTempPermProperties();
  }

  else
  {
    _FileCacheLock((uint64_t)v6);
    _FileCacheReleaseContents((uint64_t)v7, 1, 0, 1, 0);
    _FileCacheUnlock((uint64_t)v7);
  }

  uint64_t v9 = 0LL;
LABEL_10:
  CFTypeRef cfa = 0LL;
  int v11 = _FSURLCopyResourcePropertyForKeyInternal( a1,  (const __CFString *)*MEMORY[0x189604D00],  (void **)&cfa,  cf,  0LL,  1);
  uint64_t v12 = (const __CFURL *)cfa;
  if (v11) {
    BOOL v13 = cfa == 0LL;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    if (cfa != (CFTypeRef)*MEMORY[0x189605018])
    {
      uint64_t v14 = (const void *)__CFURLResourceInfoPtr();
      if (v14)
      {
        uint64_t v15 = _FileCacheGetForURL(v12, v14);
        uint64_t v16 = v15;
        if (a2)
        {
          if (!v9)
          {
            _FileCacheLockTempPermProperties();
            uint64_t v17 = _FileCacheGetTemporaryPropertyDictionary(v16, 0);
            if (v17) {
              CFDictionaryRemoveValue(v17, a2);
            }
            _FileCacheUnlockTempPermProperties();
            goto LABEL_24;
          }

          _FileCacheLock((uint64_t)v15);
          clearPropertyAndDependentValues((uint64_t)v12, (uint64_t)v16, v9);
        }

        else
        {
          _FileCacheLock((uint64_t)v15);
          _FileCacheReleaseContents((uint64_t)v16, 1, 0, 1, 0);
        }

        _FileCacheUnlock((uint64_t)v16);
      }
    }

LABEL_24:
    CFRelease(v12);
  }

void _FSURLBeginResourcePropertyCacheAccess(const __CFURL *a1, const void *a2)
{
  if (a2 && _CFRunLoopCurrentIsMain())
  {
    CFTypeRef v4 = _FileCacheGetForURL(a1, a2);
    _FileCacheLock((uint64_t)v4);
    if (!_FileCacheGetAutoFlushingEnabled((uint64_t)v4)
      || _FileCacheGetInProvider((uint64_t)v4)
      || (int GlobalSeed = _FileCacheGetGlobalSeed(), _FileCacheIsValid((uint64_t)v4, GlobalSeed)))
    {
      _FileCacheUnlock((uint64_t)v4);
    }

    else
    {
      _FileCacheReleaseContents((uint64_t)v4, 1, 1, 1, 0);
      _FileCacheUnlock((uint64_t)v4);
      CFTypeRef cf = 0LL;
      if (_FSURLCopyResourcePropertyForKeyInternal( a1,  (const __CFString *)*MEMORY[0x189604D00],  (void **)&cf,  a2,  0LL,  1))
      {
        int v6 = (const __CFURL *)cf;
        if (cf)
        {
          if (cf != (CFTypeRef)*MEMORY[0x189605018])
          {
            CFErrorRef v7 = (const void *)__CFURLResourceInfoPtr();
            if (v7)
            {
              CFTypeRef v8 = _FileCacheGetForURL(v6, v7);
              _FileCacheLock((uint64_t)v8);
              _FileCacheReleaseContents((uint64_t)v8, 1, 1, 1, 0);
              _FileCacheUnlock((uint64_t)v8);
            }
          }

          CFRelease(v6);
        }
      }
    }
  }

void _FSURLEndResourcePropertyCacheAccess(const __CFURL *a1, const void *a2)
{
  if (a2)
  {
    CFTypeRef v2 = _FileCacheGetForURL(a1, a2);
    _FileCacheLock((uint64_t)v2);
    if (!_FileCacheGetInProvider((uint64_t)v2) && _FileCacheNeedsValidSeed((uint64_t)v2))
    {
      if (_CFRunLoopCurrentIsMain())
      {
        unsigned int GlobalSeed = _FileCacheGetGlobalSeed();
        _FileCacheSetValidSeed((uint64_t)v2, GlobalSeed);
        Main = CFRunLoopGetMain();
        _FileCacheScheduleGlobalSeedIncrement(Main);
      }
    }

    _FileCacheUnlock((uint64_t)v2);
  }

void _FSURLSetCacheAutoFlushingEnabled(const __CFURL *a1, const void *a2, int a3)
{
  CFTypeRef v4 = _FileCacheGetForURL(a1, a2);
  _FileCacheLock((uint64_t)v4);
  _FileCacheSetAutoFlushingEnabled((uint64_t)v4, a3);
  _FileCacheUnlock((uint64_t)v4);
}

BOOL _FSURLGetCacheAutoFlushingEnabled(const __CFURL *a1, const void *a2)
{
  CFTypeRef v2 = _FileCacheGetForURL(a1, a2);
  _FileCacheLock((uint64_t)v2);
  BOOL AutoFlushingEnabled = _FileCacheGetAutoFlushingEnabled((uint64_t)v2);
  _FileCacheUnlock((uint64_t)v2);
  return AutoFlushingEnabled;
}

uint64_t _FSURLCreateFileReferenceURLFromFSRef()
{
  return 0LL;
}

uint64_t _FSURLGetFSRef()
{
  return 0LL;
}

uint64_t _FSURLGetObjectInformationNoIO(const __CFURL *a1, unint64_t *a2, uint64_t *a3, _DWORD *a4)
{
  __endptr[1] = *(char **)MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  CFTypeRef v8 = (const void *)__CFURLResourceInfoPtr();
  if (!v8)
  {
    uint64_t v11 = 0LL;
    if (a4) {
      return v11;
    }
LABEL_18:
    if ((_DWORD)v11) {
      return v11;
    }
    if (CFURLIsFileReferenceURL(a1))
    {
      CFStringRef v14 = CFURLCopyPath(a1);
      if (v14)
      {
        CFStringRef v15 = v14;
        uint64_t v16 = (const __CFString *)MEMORY[0x1895F8858](v14);
        if (v23 != 0x692F656C69662E2FLL || v24 != 15716) {
          goto LABEL_31;
        }
        uint64_t v18 = strtoll(&v25, __endptr, 10);
        if (*__endptr[0] != 46) {
          goto LABEL_31;
        }
        uint64_t v19 = v18;
        uint64_t v20 = strtoll(__endptr[0] + 1, __endptr, 10);
        size_t v21 = __endptr[0];
        if (*__endptr[0] == 47) {
          size_t v21 = __endptr[0] + 1;
        }
        if (!*v21)
        {
          if (a2) {
            *a2 = v19;
          }
          if (a3) {
            *a3 = v20;
          }
          uint64_t v11 = 1LL;
        }

        else
        {
LABEL_31:
          uint64_t v11 = 0LL;
        }

        CFRelease(v15);
        return v11;
      }
    }

    return 0LL;
  }

  CFTypeRef v9 = _FileCacheGetForURL(a1, v8);
  _FileCacheLock((uint64_t)v9);
  uint64_t Attributes = _FileCacheGetAttributes((uint64_t)v9);
  if ((*(_BYTE *)Attributes & 4) != 0)
  {
    if (a2)
    {
      unsigned int v12 = *(_DWORD *)(Attributes + 112);
      if (v12)
      {
        unint64_t v13 = 0LL;
      }

      else
      {
        unsigned int v12 = *(_DWORD *)(Attributes + 104);
        unint64_t v13 = (unint64_t)*(unsigned int *)(Attributes + 108) << 32;
      }

      *a2 = v13 | v12;
    }

    if (a3) {
      *a3 = *(void *)(Attributes + 120);
    }
    if (a4) {
      *a4 = *(_DWORD *)(Attributes + 16);
    }
    uint64_t v11 = 1LL;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  _FileCacheUnlock((uint64_t)v9);
  if (!a4) {
    goto LABEL_18;
  }
  return v11;
}

uint64_t _FSURLGetCatalogInfo(const __CFURL *a1, int a2, uint64_t a3, unsigned __int16 *a4)
{
  v82[7] = *MEMORY[0x1895F89C0];
  if (!a1 || (a2 & 0xBFFFFFFF) != 0 && !a3) {
    return 4294967246LL;
  }
  CFTypeRef v8 = v76;
  if (a3) {
    CFTypeRef v9 = (_WORD *)a3;
  }
  else {
    CFTypeRef v9 = v76;
  }
  if (a4) {
    unsigned int v10 = a2 & 0x3FFFFFFF | 0x80000000;
  }
  else {
    unsigned int v10 = a2 & 0x3FFFFFFF;
  }
  if ((v10 & 1) != 0)
  {
    v10 &= 0xBFFFFFFE;
    if (a3) {
      CFTypeRef v8 = (_BYTE *)a3;
    }
    *((_DWORD *)v8 + 36) = 0;
    if ((v10 & 0x2000) == 0)
    {
LABEL_12:
      if ((v10 & 0x200) == 0) {
        goto LABEL_13;
      }
      goto LABEL_58;
    }
  }

  else if ((v10 & 0x2000) == 0)
  {
    goto LABEL_12;
  }

  v10 &= ~0x2000u;
  __int16 v24 = v76;
  if (a3) {
    __int16 v24 = (_BYTE *)a3;
  }
  *((_DWORD *)v24 + 35) = 0;
  if ((v10 & 0x200) == 0)
  {
LABEL_13:
    if ((v10 & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_14;
  }

LABEL_58:
  v10 &= ~0x200u;
  char v25 = v76;
  if (a3) {
    char v25 = (_BYTE *)a3;
  }
  *((void *)v25 + 6) = 0LL;
  if ((v10 & 0x10000) != 0)
  {
LABEL_14:
    v10 &= ~0x10000u;
    uint64_t v11 = v76;
    if (a3) {
      uint64_t v11 = (_BYTE *)a3;
    }
    v11[12] = 0;
  }

LABEL_94:
        if ((v10 & 0x80) == 0) {
          goto LABEL_103;
        }
LABEL_95:
        double v41 = *((double *)v15 + 9);
        BOOL v42 = v76;
        if (a3)
        {
          BOOL v42 = (_BYTE *)a3;
          int v43 = (int *)(a3 + 32);
        }

        else
        {
          int v43 = &v79;
        }

        if (v41 == -*MEMORY[0x189604DA8])
        {
          *((void *)v42 + 4) = 0LL;
          if ((v10 & 0x100) == 0) {
            goto LABEL_113;
          }
          goto LABEL_104;
        }

        uint64_t v36 = ConvertCFAbsoluteTimeToUTCDateTime((uint64_t)v43, v41);
        if ((_DWORD)v36) {
          goto LABEL_109;
        }
LABEL_103:
        if ((v10 & 0x100) == 0) {
          goto LABEL_113;
        }
LABEL_104:
        double v44 = *((double *)v15 + 7);
        uint64_t v45 = v76;
        if (a3)
        {
          uint64_t v45 = (_BYTE *)a3;
          uint64_t v46 = (int *)(a3 + 40);
        }

        else
        {
          uint64_t v46 = &v80;
        }

        if (v44 == -*MEMORY[0x189604DA8])
        {
          *((void *)v45 + 5) = 0LL;
        }

        else
        {
          uint64_t v36 = ConvertCFAbsoluteTimeToUTCDateTime((uint64_t)v46, v44);
          if ((_DWORD)v36) {
            goto LABEL_109;
          }
        }

LABEL_113:
        if ((v10 & 0x400) != 0)
        {
          uint64_t v47 = v76;
          if (a3) {
            uint64_t v47 = (_BYTE *)a3;
          }
          *((_DWORD *)v47 + 14) = v15[10];
          *((_DWORD *)v47 + 15) = v15[11];
          *((_WORD *)v47 + 33) = v15[4];
        }

        if ((v10 & 0x400000) != 0)
        {
          if ((*(_BYTE *)v15 & 0x80) != 0)
          {
            uint64_t v49 = CFGetAllocator(a1);
            CFFileSecurityRef Copy = CFFileSecurityCreateCopy(v49, *((CFFileSecurityRef *)v15 + 28));
          }

          else
          {
            CFFileSecurityRef Copy = 0LL;
          }

          uint64_t v50 = v76;
          if (a3) {
            uint64_t v50 = (_BYTE *)a3;
          }
          *(void *)(v50 + 68) = Copy;
        }

        if ((v10 & 0x41800) != 0)
        {
          if ((*v15 & 0x4000010) == 0x10)
          {
            uint64_t v51 = v81;
            if (a3) {
              uint64_t v51 = (_OWORD *)(a3 + 76);
            }
            *uint64_t v51 = *((_OWORD *)v15 + 10);
            uint64_t v52 = v82;
            if (a3) {
              uint64_t v52 = (_OWORD *)(a3 + 92);
            }
            *uint64_t v52 = *((_OWORD *)v15 + 11);
          }

          else
          {
            uint64_t v53 = v81;
            if (a3) {
              uint64_t v53 = (void *)(a3 + 76);
            }
            *uint64_t v53 = 0LL;
            v53[1] = 0LL;
            uint64_t v54 = v82;
            if (a3) {
              uint64_t v54 = (void *)(a3 + 92);
            }
            void *v54 = 0LL;
            v54[1] = 0LL;
          }

          if ((v15[4] & 0xF000) == 0xA000)
          {
            if (a3) {
              uint64_t v55 = (_BYTE *)a3;
            }
            else {
              uint64_t v55 = v76;
            }
            *(void *)(v55 + 76) = 0x72686170736C6E6BLL;
            *((_WORD *)v55 + 42) = *((_WORD *)v55 + 42) & 0x4000 | 0x8000;
            uint64_t v56 = v82;
            if (a3) {
              uint64_t v56 = (void *)(a3 + 92);
            }
            *uint64_t v56 = 0LL;
            v56[1] = 0LL;
          }
        }

        if ((v15[4] & 0xF000) == 0x4000)
        {
          uint64_t v57 = v76;
          if (a3) {
            uint64_t v57 = (_BYTE *)a3;
          }
          *(void *)(v57 + 132) = 0LL;
          *(void *)(v57 + 124) = 0LL;
          *(void *)(v57 + 116) = 0LL;
          *(void *)(v57 + 108) = 0LL;
          if ((v10 & 0x80000) == 0) {
            goto LABEL_163;
          }
          goto LABEL_151;
        }

        if ((v10 & 0x4000) != 0)
        {
          uint64_t v61 = v76;
          if (a3) {
            uint64_t v61 = (_BYTE *)a3;
          }
          *(void *)(v61 + 108) = *((void *)v15 + 26);
          *(void *)(v61 + 116) = *((void *)v15 + 27);
          if ((v10 & 0x8000) == 0)
          {
LABEL_150:
            if ((v10 & 0x80000) == 0) {
              goto LABEL_163;
            }
            goto LABEL_151;
          }
        }

        else if ((v10 & 0x8000) == 0)
        {
          goto LABEL_150;
        }

        uint64_t v62 = v76;
        if (a3) {
          uint64_t v62 = (_BYTE *)a3;
        }
        *(void *)(v62 + 124) = *((void *)v15 + 24);
        *(void *)(v62 + 132) = *((void *)v15 + 25);
        if ((v10 & 0x80000) == 0)
        {
LABEL_163:
          uint64_t v26 = 0LL;
          if (a4 && (v10 & 0x80000000) != 0)
          {
            if ((*((_BYTE *)v15 + 1) & 0x20) != 0)
            {
              *(void *)uint64_t v75 = 0LL;
              uint64_t v63 = MountInfoStorageSize();
              uint64_t v64 = MEMORY[0x1895F8858](v63);
              if (MountInfoPrepare( v75,  v15[28],  0,  (char *)&v73 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0LL),  0LL,  0LL,  0LL))
              {
                uint64_t VolumeName = MountInfoGetVolumeName(*(uint64_t *)v75);
                if (VolumeName)
                {
                  uint64_t v66 = (const char *)VolumeName;
                  CFTypeID v67 = CFGetAllocator(a1);
                  uint64_t v68 = CFStringCreateWithCString(v67, v66, 0x8000100u);
                }

                else
                {
                  uint64_t v68 = 0LL;
                }

                MountInfoDestroy(*(void *)v75);
                if (v68) {
                  goto LABEL_175;
                }
              }
            }

            uint64_t v68 = (const __CFString *)*((void *)v15 + 1);
            if (v68)
            {
LABEL_175:
              uint64_t Length = CFStringGetLength(v68);
              if (Length < 256)
              {
                v83.CFIndex length = Length;
                *a4 = Length;
                v83.CFIndex location = 0LL;
                CFStringGetCharacters(v68, v83, a4 + 1);
                if (v68 != *((const __CFString **)v15 + 1)) {
                  CFRelease(v68);
                }
                uint64_t v70 = *a4;
                if (*a4)
                {
                  uint64_t v71 = a4 + 1;
                  do
                  {
                    if (*v71 == 58) {
                      *uint64_t v71 = 47;
                    }
                    ++v71;
                    --v70;
                  }

                  while (v70);
                }

                uint64_t v26 = 0LL;
                goto LABEL_202;
              }

              if (v68 != *((const __CFString **)v15 + 1)) {
                CFRelease(v68);
              }
            }

            uint64_t v26 = 4294967259LL;
          }

LABEL_202:
          _FileCacheUnlock((uint64_t)v13);
          return v26;
        }

LABEL_151:
        int v58 = v76;
        if (a3) {
          int v58 = (_BYTE *)a3;
        }
        v58[65] = 0;
        int v59 = (*v15 >> 23) & 1;
        v58[65] = (*v15 & 0x800000) != 0;
        int v60 = *v15;
        if ((*v15 & 0x1000000) != 0)
        {
          LOBYTE(v59) = v59 | 2;
          v58[65] = v59;
          int v60 = *v15;
        }

        if ((v60 & 0x2000000) != 0) {
          v58[65] = v59 | 4;
        }
        goto LABEL_163;
      }

LABEL_72:
      if (*((void *)v15 + 16) == 2LL) {
        int v32 = 1;
      }
      else {
        int v32 = v15[34];
      }
      uint64_t v33 = v76;
      if (a3) {
        uint64_t v33 = (_BYTE *)a3;
      }
      *((_DWORD *)v33 + 1) = v32;
      if ((v10 & 0x20) == 0) {
        goto LABEL_84;
      }
      goto LABEL_78;
    }

    uint64_t v27 = v74;
    if (!v74)
    {
      uint64_t v26 = 4294967260LL;
      goto LABEL_202;
    }

    CFErrorDomain Domain = CFErrorGetDomain(v74);
    CFIndex Code = CFErrorGetCode(v27);
    if (CFEqual(Domain, (CFTypeRef)*MEMORY[0x189604F50]))
    {
      uint64_t v26 = Code;
    }

    else if (CFEqual(Domain, (CFTypeRef)*MEMORY[0x189604F58]))
    {
      uint64_t v26 = PosixToOSStatusTranslate(Code);
    }

    else
    {
      if (CFEqual(Domain, (CFTypeRef)*MEMORY[0x189604F40]))
      {
        if (Code <= 512)
        {
          uint64_t v26 = 4294967253LL;
          switch(Code)
          {
            case 257LL:
              goto LABEL_197;
            case 258LL:
              goto LABEL_193;
            case 259LL:
            case 261LL:
            case 262LL:
              goto LABEL_189;
            case 260LL:
              goto LABEL_201;
            case 263LL:
              uint64_t v26 = 4294965987LL;
              break;
            default:
              if (Code != 4) {
                goto LABEL_189;
              }
              break;
          }

          goto LABEL_201;
        }

        if (Code > 639)
        {
          if (Code == 640)
          {
            uint64_t v26 = 4294967262LL;
            goto LABEL_201;
          }

          if (Code == 642)
          {
            uint64_t v26 = 4294967235LL;
            goto LABEL_201;
          }
        }

        else
        {
          if (Code == 513)
          {
LABEL_197:
            uint64_t v26 = 4294962296LL;
            goto LABEL_201;
          }

          if (Code == 514)
          {
LABEL_193:
            uint64_t v26 = 4294967259LL;
            goto LABEL_201;
          }
        }
      }

      else
      {
        CFEqual(Domain, (CFTypeRef)*MEMORY[0x189604F48]);
      }

LABEL_201:
    CFRelease(v74);
    goto LABEL_202;
  }

  return 0LL;
}

CFStringRef _FSCreatePathForFileID(const __CFAllocator *a1, int a2, uint64_t a3, CFErrorRef *a4)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (getFileSystemPathForFileID(a2, a3, cStr, (char *)0x400))
  {
    CFStringRef result = CFStringCreateWithCString(a1, cStr, 0x8000100u);
    if (!a4) {
      return result;
    }
  }

  else
  {
    if (!a4) {
      return 0LL;
    }
    CFErrorRef v7 = _FSURLCreateStandardError(a1, (const __CFString *)*MEMORY[0x189604F40], 4LL, 0, 0LL, 0LL);
    CFStringRef result = 0LL;
    *a4 = v7;
  }

  if (result) {
    return result;
  }
  if (*a4) {
    return 0LL;
  }
  if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
    _FSCreatePathForFileID_cold_1();
  }
  CFErrorRef v8 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 256LL, 0LL);
  CFStringRef result = 0LL;
  *a4 = v8;
  return result;
}

BOOL getFileSystemPathForFileID(int a1, uint64_t a2, char *a3, char *a4)
{
  v15[1] = *MEMORY[0x1895F89C0];
  v15[0] = 0LL;
  uint64_t v8 = MountInfoStorageSize();
  uint64_t v9 = MEMORY[0x1895F8858](v8);
  if (a2)
  {
    if ((MountInfoGetCapabilities(v15[0]) & 0x8000000000000LL) != 0)
    {
      fsid_t FSID = (fsid_t)MountInfoGetFSID(v15[0]);
      BOOL v10 = fsgetpath(a3, (size_t)a4, &FSID, a2) >= 0;
    }

    else
    {
      BOOL v10 = 0LL;
    }
  }

  else
  {
    MountPoint = (const char *)MountInfoGetMountPoint(v15[0]);
    BOOL v10 = strlcpy(a3, MountPoint, (size_t)a4) < (unint64_t)a4;
  }

  MountInfoDestroy(v15[0]);
  return v10;
}

BOOL _FSGetFileSystemRepresentationForFileID( const __CFAllocator *a1, int a2, uint64_t a3, char *a4, char *a5, CFErrorRef *a6)
{
  BOOL FileSystemPathForFileID = getFileSystemPathForFileID(a2, a3, a4, a5);
  BOOL v9 = FileSystemPathForFileID;
  if (a6)
  {
    if (!FileSystemPathForFileID)
    {
      BOOL v10 = (const __CFString *)*MEMORY[0x189604F40];
      CFErrorRef v11 = _FSURLCreateStandardError(a1, (const __CFString *)*MEMORY[0x189604F40], 4LL, 0, 0LL, 0LL);
      *a6 = v11;
      if (!v11)
      {
        if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
          _FSGetFileSystemRepresentationForFileID_cold_1();
        }
        *a6 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v10, 256LL, 0LL);
      }
    }
  }

  return v9;
}

CFURLRef _FSCreateFileReferenceURLFromIDs(const __CFAllocator *a1, int a2, uint64_t a3)
{
  v11[1] = *MEMORY[0x1895F89C0];
  v11[0] = 0LL;
  uint64_t v6 = MountInfoStorageSize();
  uint64_t v7 = MEMORY[0x1895F8858](v6);
  if ((MountInfoGetCapabilities(v11[0]) & 0x8000000000000LL) != 0)
  {
    unsigned int MountID = MountInfoGetMountID(v11[0]);
    CFURLRef FileReferenceURLRef = createFileReferenceURLRef(a1, MountID, 0LL, a3, 0LL, 0);
  }

  else
  {
    CFURLRef FileReferenceURLRef = 0LL;
  }

  MountInfoDestroy(v11[0]);
  return FileReferenceURLRef;
}

CFURLRef createFileReferenceURLRef( const __CFAllocator *a1, uint64_t a2, uint64_t a3, uint64_t a4, CFStringRef theString, Boolean a6)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (!a2) {
    return 0LL;
  }
  if (!theString)
  {
    if (snprintf(v23, 0x400uLL, "/.file/id=%lld.%lld", a2, a4) <= 0x3FF)
    {
      size_t v20 = strlen(v23);
      return CFURLCreateFromFileSystemRepresentation(a1, (const UInt8 *)v23, v20, a6);
    }

    return 0LL;
  }

  if (!CFStringGetCString(theString, v22, 1024LL, 0x8000100u)) {
    return 0LL;
  }
  size_t v10 = strlen(v22);
  uint64_t v11 = MEMORY[0x1895F8858](v10);
  uint64_t v13 = &v22[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  CFStringRef v14 = (char *)v13;
  if (v11 >= 1)
  {
    CFStringRef v15 = v22;
    CFStringRef v14 = (char *)v13;
    do
    {
      unint64_t v16 = *v15;
      BOOL v17 = (v16 - 34) > 0x3E || ((1LL << (v16 - 34)) & 0x5A0000003600000BLL) == 0;
      if (v17 && (v16 - 123) >= 3 && (v16 - 127) > 0xFFFFFFA1)
      {
        *v14++ = v16;
      }

      else
      {
        *CFStringRef v14 = 37;
        v14[1] = createFileReferenceURLRef(__CFAllocator const*,unsigned long long,unsigned long long,unsigned long long,__CFString const*,unsigned char)::hexchars[v16 >> 4];
        v14[2] = createFileReferenceURLRef(__CFAllocator const*,unsigned long long,unsigned long long,unsigned long long,__CFString const*,unsigned char)::hexchars[v16 & 0xF];
        v14 += 3;
      }

      ++v15;
      --v11;
    }

    while (v11);
  }

  *CFStringRef v14 = 0;
  size_t v18 = strlen(v23);
  return CFURLCreateFromFileSystemRepresentation(a1, (const UInt8 *)v23, v18, a6);
}

CFURLRef _CFURLCreateWithVolumeURLAndResourceID(const __CFAllocator *a1, CFURLRef url, const __CFNumber *a3)
{
  CFURLRef v3 = 0LL;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (url && a3)
  {
    CFURLRef v3 = 0LL;
    if (CFURLCopyResourcePropertyForKey(url, (CFStringRef)*MEMORY[0x189604D38], &propertyValueTypeRefPtr, 0LL)
      && propertyValueTypeRefPtr != 0LL)
    {
      CFURLRef v3 = 0LL;
      if (CFNumberGetValue(propertyValueTypeRefPtr, kCFNumberSInt64Type, &valuePtr))
      {
        if (valuePtr)
        {
          CFURLRef v3 = 0LL;
          if (CFNumberGetValue(a3, kCFNumberSInt64Type, &v11))
          {
            if (v11)
            {
              if (getFileSystemPathForFileID(valuePtr, v11, cStr, (char *)0x400)
                && !lstat(cStr, &v10)
                && (uint64_t v8 = CFStringCreateWithCString(a1, cStr, 0x8000100u)) != 0LL)
              {
                BOOL v9 = v8;
                CFURLRef v3 = CFURLCreateWithFileSystemPath(a1, v8, kCFURLPOSIXPathStyle, (v10.st_mode & 0xF000) == 0x4000);
                CFRelease(v9);
              }

              else
              {
                CFURLRef v3 = 0LL;
              }
            }
          }
        }
      }

      CFRelease(propertyValueTypeRefPtr);
    }
  }

  return v3;
}

CFURLRef _FSURLCreateWithPathAndAttributes( const __CFAllocator *a1, unsigned __int8 *a2, size_t a3, uint64_t a4, const __CFURL *a5, attrlist *a6, attrlist *a7, unsigned __int8 a8, char a9, char a10, char a11, int a12, void **a13, __CFError **a14)
{
  return __FSURLCreateWithPathAndAttributes(a1, a2, a3, a4, a5, a6, a7, (void *)1, a8, a9, a10, a12, a13, a14);
}

CFURLRef __FSURLCreateWithPathAndAttributes( CFAllocatorRef allocator, unsigned __int8 *a2, size_t __n, uint64_t a4, const __CFURL *a5, attrlist *a6, attrlist *a7, void *a8, unsigned __int8 a9, unsigned __int8 a10, unsigned __int8 a11, int a12, void **a13, __CFError **a14)
{
  size_t v20 = allocator;
  int v21 = (void **)a14;
  LODWORD(v55) = a11;
  HIDWORD(v55) = a10;
  uint64_t v57 = *MEMORY[0x1895F89C0];
  if (initGlobalsOnce(void)::onceToken != -1)
  {
    uint64_t v54 = a2;
    CFAllocatorRef v52 = allocator;
    dispatch_once(&initGlobalsOnce(void)::onceToken, &__block_literal_global_3);
    int v21 = (void **)a14;
    a2 = (unsigned __int8 *)v54;
    size_t v20 = v52;
  }

  if (a9) {
    BOOL v22 = 0;
  }
  else {
    BOOL v22 = a7 == 0LL;
  }
  if (v22 && a12 != -1) {
    JUMPOUT(0x186E19FA4LL);
  }
  uint64_t v53 = v21;
  uint64_t v24 = v20;
  uint64_t v54 = a2;
  BaseCacheWithPathAnduint64_t Attributes = createBaseCacheWithPathAndAttributes( v20,  (char *)a2,  __n,  a9,  a6,  a7,  a8,  (uint64_t)a13,  v21,  v51);
  if (!BaseCacheWithPathAndAttributes) {
    return 0LL;
  }
  uint64_t v26 = BaseCacheWithPathAndAttributes;
  uint64_t Attributes = _FileCacheGetAttributes((uint64_t)BaseCacheWithPathAndAttributes);
  uint64_t v28 = Attributes;
  if (a9 && (*(_DWORD *)Attributes & 4) != 0)
  {
    int v29 = *(_DWORD *)(Attributes + 16) & 0xF000;
    if ((*(_DWORD *)Attributes & 0x40000) != 0 && v29 != 0x4000)
    {
      uint64_t v30 = *(unsigned int *)(Attributes + 112);
      uint64_t v34 = *(void *)(Attributes + 136);
      uint64_t v35 = *(const __CFString **)(Attributes + 8);
      uint64_t v33 = v24;
      uint64_t v31 = 0LL;
      Boolean v32 = 0;
    }

    else
    {
      uint64_t v30 = *(unsigned int *)(Attributes + 112);
      uint64_t v31 = *(void *)(Attributes + 128);
      Boolean v32 = v29 == 0x4000;
      uint64_t v33 = v24;
      uint64_t v34 = 0LL;
      uint64_t v35 = 0LL;
    }

    CFURLRef FileReferenceURLRef = createFileReferenceURLRef(v33, v30, v34, v31, v35, v32);
    CFURLRef v37 = FileReferenceURLRef;
    if (FileReferenceURLRef) {
      goto LABEL_21;
    }
  }

  if (v54)
  {
    BOOL v38 = objectTypeFromAccessMask(*(_DWORD *)(v28 + 16)) == 2;
    CFURLRef FileReferenceURLRef = (CFURLRef)MEMORY[0x186E19FA4](v24, &v54[a4], __n - a4, v38, a5);
    CFURLRef v37 = FileReferenceURLRef;
    if (FileReferenceURLRef)
    {
LABEL_21:
      int v39 = v55;
      if (v55)
      {
        MEMORY[0x1895F8858](FileReferenceURLRef);
        memcpy((char *)&v52 - ((__n + 16) & 0xFFFFFFFFFFFFFFF0LL), v54, __n);
        *((_BYTE *)&v52 + __n - ((__n + 16) & 0xFFFFFFFFFFFFFFF0LL)) = 0;
        CFStringRef v40 = CFStringCreateWithFileSystemRepresentation(v24, (const char *)&v52 - ((__n + 16) & 0xFFFFFFFFFFFFFFF0LL));
        if (v40)
        {
          CFStringRef v41 = v40;
          if (HIDWORD(v55)) {
            _FileCacheSetPropertyValueForKey((uint64_t)v26, (const void *)*MEMORY[0x189605448], v40);
          }
          if (v39)
          {
            BOOL v42 = *(const void **)(v28 + 232);
            if (v42) {
              CFRelease(v42);
            }
            *(void *)(v28 + 232) = CFRetain(v41);
            *(_DWORD *)v28 |= 0x100u;
          }

          CFRelease(v41);
        }
      }

      __CFURLSetResourceInfoPtr();
      goto LABEL_36;
    }

    syslog(3, "_FSURLCreateWithPathAndAttributes: CFURLCreateFromFileSystemRepresentation failed; pathLen = %ld", __n);
  }

  else
  {
    if ((~*(_DWORD *)v28 & 0x8004) != 0)
    {
      uint64_t v46 = 0LL;
      CFURLRef v37 = 0LL;
      goto LABEL_37;
    }

    ssize_t v43 = fsgetpath(v56, 0x400uLL, (fsid_t *)(v28 + 104), *(void *)(v28 + 128));
    CFIndex v44 = v43;
    if (v43 < 0)
    {
      CFURLRef v37 = 0LL;
      uint64_t v46 = (int)v43;
      goto LABEL_37;
    }

    Boolean v45 = objectTypeFromAccessMask(*(_DWORD *)(v28 + 16)) == 2;
    CFURLRef FileReferenceURLRef = CFURLCreateFromFileSystemRepresentation(v24, (const UInt8 *)v56, v44, v45);
    CFURLRef v37 = FileReferenceURLRef;
    if (FileReferenceURLRef) {
      goto LABEL_21;
    }
  }

CFURLRef _FSURLCreateWithPathAndExtendedAttributes( CFAllocatorRef allocator, unsigned __int8 *a2, size_t __n, uint64_t a4, const __CFURL *a5, attrlist *a6, attrlist *a7, void *a8, unsigned __int8 a9, unsigned __int8 a10, unsigned __int8 a11, int a12, void **a13, __CFError **a14)
{
  return __FSURLCreateWithPathAndAttributes(allocator, a2, __n, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

uint64_t _FSURLGetAttrListForPropertyKeys( int a1, CFArrayRef theArray, uint64_t a3, __CFArray **a4, Boolean *a5)
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  if (initGlobalsOnce(void)::onceToken == -1)
  {
    if (theArray) {
      goto LABEL_3;
    }
    return 0;
  }

  dispatch_once(&initGlobalsOnce(void)::onceToken, &__block_literal_global_3);
  if (!theArray) {
    return 0;
  }
LABEL_3:
  if (a5) {
    *a5 = 0;
  }
  CFIndex Count = CFArrayGetCount(theArray);
  if (!Count) {
    return 0;
  }
  CFIndex v9 = Count;
  memset(v43, 0, 60);
  memset(v42, 0, 60);
  if (Count >= 1)
  {
    for (CFIndex i = 0LL; i != v9; ++i)
    {
      CFTypeRef ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
      int Value = CFDictionaryGetValue((CFDictionaryRef)qword_18C4639F8, ValueAtIndex);
      if (Value)
      {
        uint64_t v13 = (uint64_t)Value;
        addPropertyAndDependenciesToBitmap((uint64_t)Value, (uint64_t)v43);
        if (a4 && qword_18C4639E8 != **(_DWORD **)(v13 + 140)) {
          addPropertyAndDependenciesToBitmap(v13, (uint64_t)v42);
        }
        if (a5 && !*a5 && qword_18C4639F0 == **(_DWORD **)(v13 + 140)) {
          *a5 = CFEqual(*(CFTypeRef *)(*(void *)v13 + 8LL), @"__kCFURLCheapVolumeInformationKey");
        }
      }
    }
  }

  uint64_t v14 = qword_18C4639E8;
  if (a4)
  {
    uint64_t v15 = (char *)v42 + 12 * qword_18C4639E8;
    *((_DWORD *)v15 + 2) = 0;
    *(void *)uint64_t v15 = 0LL;
    if (qword_18C4638C8 < 1)
    {
      CFMutableArrayRef Mutable = 0LL;
    }

    else
    {
      CFMutableArrayRef Mutable = 0LL;
      uint64_t v17 = 0LL;
      do
      {
        size_t v18 = (char *)v42 + 12 * v17;
        uint64_t v46 = *(void *)v18;
        int v47 = *((_DWORD *)v18 + 2);
        if (PropertyMaskIsNotZero((uint64_t)&v46, (unint64_t *)&v45, &v44) && v45 <= v44)
        {
          int v19 = &sFileProviderGlobals[7 * v17 + 8];
          uint64_t v20 = v46;
          int v21 = v47;
          unint64_t v22 = 148 * v45;
          unint64_t v23 = v44 - v45 + 1;
          do
          {
            uint64_t v24 = *v19;
            int v25 = *(_DWORD *)(*v19 + v22 + 136);
            uint64_t v26 = 1LL << v25;
            if (v25 >= 64) {
              uint64_t v26 = 0LL;
            }
            if ((v26 & v20) != 0 || (v25 >= 64 ? (int v27 = 1 << v25) : (int v27 = 0), (v27 & v21) != 0))
            {
              if (Mutable
                || (uint64_t v28 = CFGetAllocator(*(CFTypeRef *)(v24 + v22 + 8)),
                    (CFMutableArrayRef Mutable = CFArrayCreateMutable(v28, 0LL, MEMORY[0x189605228])) != 0LL))
              {
                CFArrayAppendValue(Mutable, *(const void **)(v24 + v22 + 8));
              }
            }

            v22 += 148LL;
            --v23;
          }

          while (v23);
        }

        ++v17;
      }

      while (v17 < qword_18C4638C8);
      uint64_t v14 = qword_18C4639E8;
    }

    *a4 = Mutable;
  }

  LOBYTE(v47) = 0;
  uint64_t v46 = 0LL;
  uint64_t v29 = SHIDWORD(sFileProviderGlobals[7 * v14 + 2]);
  if ((int)v29 >= 1)
  {
    uint64_t v30 = (char *)v43 + 12 * v14;
    uint64_t v31 = *(void *)v30;
    int v32 = *((_DWORD *)v30 + 2);
    uint64_t v33 = (_DWORD *)sFileProviderGlobals[7 * v14 + 8];
    do
    {
      int v34 = v33[34];
      uint64_t v35 = 1LL << v34;
      if (v34 >= 64) {
        uint64_t v35 = 0LL;
      }
      if ((v35 & v31) != 0 || (v34 >= 64 ? (int v36 = 1 << v34) : (int v36 = 0), (v36 & v32) != 0))
      {
        *((_BYTE *)&v46 + *(void *)(*(void *)v33 + 16LL)) = 1;
        LOBYTE(v46) = 1;
      }

      v33 += 37;
      --v29;
    }

    while (v29);
  }

  unsigned __int8 v37 = 0;
  uint64_t v38 = 0LL;
  int v39 = &corePropertyAttrListTable[20];
  do
  {
    if (*((_BYTE *)&v46 + v38))
    {
      *(int8x16_t *)(a3 + 4) = vorrq_s8(*(int8x16_t *)(a3 + 4), *((int8x16_t *)v39 - 1));
      *(_DWORD *)(a3 + 20) |= *(_DWORD *)v39;
      unsigned __int8 v37 = 1;
    }

    ++v38;
    v39 += 24;
  }

  while (v38 != 9);
  return v37;
}

const attrlist *_FSURLCalculateAttributeBufferSize(const attrlist *result)
{
  if (result) {
    return (const attrlist *)calculateAttributeBufferSize(result, 0LL);
  }
  return result;
}

unint64_t calculateAttributeBufferSize(const attrlist *a1, uint64_t a2)
{
  attrgroup_t commonattr = a1->commonattr;
  if (a2 <= 0) {
    uint64_t v3 = (commonattr >> 17) & 0x400 | (commonattr >> 14) & 0x100 | ((int)(commonattr << 31) >> 31) & 0x2FE;
  }
  else {
    uint64_t v3 = a2;
  }
  uint64_t v4 = v3 + 4;
  if (commonattr)
  {
    uint64_t v5 = v3 + 12;
    if ((commonattr & 1) != 0) {
      uint64_t v4 = v5;
    }
    if ((commonattr & 2) != 0) {
      v4 += 4LL;
    }
    if ((commonattr & 4) != 0) {
      v4 += 8LL;
    }
    if ((commonattr & 8) != 0) {
      v4 += 4LL;
    }
    if ((commonattr & 0x10) != 0) {
      v4 += 4LL;
    }
    if ((commonattr & 0x20) != 0) {
      v4 += 8LL;
    }
    if ((commonattr & 0x40) != 0) {
      v4 += 8LL;
    }
    if ((commonattr & 0x80) != 0) {
      v4 += 8LL;
    }
    if ((commonattr & 0x100) != 0) {
      v4 += 4LL;
    }
    if ((commonattr & 0x200) != 0) {
      v4 += 16LL;
    }
    if ((commonattr & 0x400) != 0) {
      v4 += 16LL;
    }
    if ((commonattr & 0x800) != 0) {
      v4 += 16LL;
    }
    if ((commonattr & 0x1000) != 0) {
      v4 += 16LL;
    }
    if ((commonattr & 0x2000) != 0) {
      v4 += 16LL;
    }
    if ((commonattr & 0x4000) != 0) {
      v4 += 32LL;
    }
    if ((commonattr & 0x8000) != 0) {
      v4 += 4LL;
    }
    if ((commonattr & 0x10000) != 0) {
      v4 += 4LL;
    }
    if ((commonattr & 0x20000) != 0) {
      v4 += 4LL;
    }
    if ((commonattr & 0x40000) != 0) {
      v4 += 4LL;
    }
    if ((commonattr & 0x80000) != 0) {
      v4 += 4LL;
    }
    if ((commonattr & 0x100000) != 0) {
      v4 += 4LL;
    }
    if ((commonattr & 0x200000) != 0) {
      v4 += 4LL;
    }
    if ((commonattr & 0x400000) != 0) {
      v4 += 8LL;
    }
    if ((commonattr & 0x800000) != 0) {
      v4 += 16LL;
    }
    if ((commonattr & 0x1000000) != 0) {
      v4 += 16LL;
    }
    if ((commonattr & 0x2000000) != 0) {
      v4 += 8LL;
    }
    if ((commonattr & 0x4000000) != 0) {
      v4 += 8LL;
    }
    if ((commonattr & 0x8000000) != 0) {
      v4 += 8LL;
    }
    if ((commonattr & 0x10000000) != 0) {
      v4 += 16LL;
    }
    if ((commonattr & 0x20000000) != 0) {
      v4 += 4LL;
    }
    if ((commonattr & 0x40000000) != 0) {
      v4 += 4LL;
    }
    if ((commonattr & 0x80000000) != 0) {
      v4 += 20LL;
    }
  }

  attrgroup_t dirattr = a1->dirattr;
  if (dirattr)
  {
    uint64_t v7 = 4LL * (dirattr & 1);
    if ((dirattr & 2) != 0) {
      v7 += 4LL;
    }
    if ((dirattr & 4) != 0) {
      v7 += 4LL;
    }
    if ((dirattr & 8) != 0) {
      v7 += 8LL;
    }
    if ((dirattr & 0x10) != 0) {
      v7 += 4LL;
    }
    if ((dirattr & 0x20) != 0) {
      unint64_t v8 = v7 + 8;
    }
    else {
      unint64_t v8 = v7;
    }
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  attrgroup_t fileattr = a1->fileattr;
  if (fileattr)
  {
    uint64_t v10 = 4LL * (fileattr & 3);
    if ((fileattr & 4) != 0) {
      v10 += 8LL;
    }
    if ((fileattr & 8) != 0) {
      v10 += 4LL;
    }
    if ((fileattr & 0x20) != 0) {
      v10 += 4LL;
    }
    if ((fileattr & 0x200) != 0) {
      v10 += 8LL;
    }
    if ((fileattr & 0x400) != 0) {
      v10 += 8LL;
    }
    if ((fileattr & 0x1000) != 0) {
      v10 += 8LL;
    }
    if ((fileattr & 0x2000) != 0) {
      unint64_t v11 = v10 + 8;
    }
    else {
      unint64_t v11 = v10;
    }
  }

  else
  {
    unint64_t v11 = 0LL;
  }

  attrgroup_t forkattr = a1->forkattr;
  if (forkattr)
  {
    uint64_t v13 = (2 * forkattr) & 8LL;
    if ((forkattr & 8) != 0) {
      v13 += 8LL;
    }
    if ((forkattr & 0x10) != 0) {
      v13 += 8LL;
    }
    if ((forkattr & 0x20) != 0) {
      v13 += 8LL;
    }
    if ((forkattr & 0x40) != 0) {
      v13 += 4LL;
    }
    if ((forkattr & 0x80) != 0) {
      uint64_t v14 = v13 + 8;
    }
    else {
      uint64_t v14 = v13;
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  if (v8 <= v11) {
    unint64_t v8 = v11;
  }
  return v8 + v4 + v14;
}

void _FSURLCacheCheapVolumeInformation(const __CFURL *a1, int a2, uint64_t a3)
{
  uint64_t v6 = (const void *)__CFURLResourceInfoPtr();
  if (v6)
  {
    CFTypeRef v7 = _FileCacheGetForURL(a1, v6);
    _FileCacheLock((uint64_t)v7);
    uint64_t Attributes = _FileCacheGetAttributes((uint64_t)v7);
    if ((*(_BYTE *)Attributes & 2) != 0 && *(_DWORD *)(Attributes + 104) == a2 && !_FileCacheGetVolumeInfo((uint64_t)v7))
    {
      _FileCacheLockTransitionToPreparer((uint64_t)v7);
      prepareCheapVolumeInformation(a1, (uint64_t)v7, a3);
      _FileCacheLockTransitionFromPreparer((uint64_t)v7);
    }

    _FileCacheUnlock((uint64_t)v7);
  }

void prepareCheapVolumeInformation(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  __int128 v23 = 0u;
  __int128 v22 = 0u;
  __int128 v21 = 0u;
  __int128 v20 = 0u;
  *(void *)bytes = -1LL;
  if (!a3)
  {
    fsid v11 = *(fsid *)(_FileCacheGetAttributes(a2) + 104);
    if (GetStatfsByFSID(v11, &v18))
    {
LABEL_21:
      *(double *)&__int128 v22 = -1.0 - *MEMORY[0x189604DA0];
      *((void *)&v22 + 1) = -1LL;
      CFIndex v14 = 56LL;
      goto LABEL_27;
    }

    if ((v18.f_flags & 0x1000) != 0)
    {
      *((void *)&v21 + 1) |= 1uLL;
      if ((v18.f_flags & 0x400000) == 0)
      {
LABEL_9:
        if ((v18.f_flags & 0x100000) == 0) {
          goto LABEL_10;
        }
        goto LABEL_32;
      }
    }

    else if ((v18.f_flags & 0x400000) == 0)
    {
      goto LABEL_9;
    }

    *((void *)&v21 + 1) |= 2uLL;
    if ((v18.f_flags & 0x100000) == 0)
    {
LABEL_10:
      if ((v18.f_flags & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_33;
    }

LABEL_34:
    *((void *)&v21 + 1) |= 0x10uLL;
    if ((v18.f_flags & 0x4000) == 0)
    {
LABEL_13:
      if ((v18.f_flags & 0x80) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }

  statfs v18 = (os_log_s *)securityScopedLog;
  if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR)) {
    SandboxExtensionCache::move(v18, v19, v20);
  }
  uint64_t v17 = 0LL;
LABEL_37:
  if (propertyValueTypeRefPtr) {
    CFRelease(propertyValueTypeRefPtr);
  }
  return v17;
}

LABEL_35:
    *((void *)&v21 + 1) |= 0x4000000uLL;
    if ((v18.f_flags & 0x80) == 0)
    {
LABEL_15:
      unint64_t v12 = *((void *)&v21 + 1) & 0xFEFFFFFFFFFFFFFFLL | (v18.f_flags << 8) & 0x20000000;
      *((void *)&v21 + 1) = v12;
      goto LABEL_21;
    }

void _FSURLCacheCheapVolumeInformationForVolume(const __CFURL *a1, uint64_t a2)
{
  uint64_t v4 = (const void *)__CFURLResourceInfoPtr();
  CFTypeRef v5 = _FileCacheGetForURL(a1, v4);
  _FileCacheLock((uint64_t)v5);
  uint64_t Attributes = _FileCacheGetAttributes((uint64_t)v5);
  if ((*(_BYTE *)Attributes & 2) == 0)
  {
    uint64_t v7 = (_DWORD *)Attributes;
    *(void *)(Attributes + 104) = MountInfoGetFSID(a2);
    v7[28] = MountInfoGetMountID(a2);
    *v7 |= 2u;
  }

  if (!_FileCacheGetVolumeInfo((uint64_t)v5))
  {
    _FileCacheLockTransitionToPreparer((uint64_t)v5);
    prepareCheapVolumeInformation(a1, (uint64_t)v5, a2);
    _FileCacheLockTransitionFromPreparer((uint64_t)v5);
  }

  _FileCacheUnlock((uint64_t)v5);
}

uint64_t _FSURLCacheResourcePropertyForKey(const __CFURL *a1, const void *a2, CFTypeRef cf, CFErrorRef *a4)
{
  CFTypeRef v7 = _FileCacheGetForURL(a1, cf);
  _FileCacheLock((uint64_t)v7);
  int Value = CFDictionaryGetValue((CFDictionaryRef)qword_18C4639F8, a2);
  if (Value)
  {
    memset(v11, 0, 60);
    addPropertyAndDependenciesToBitmap((uint64_t)Value, (uint64_t)v11);
    _FileCacheLockTransitionToPreparer((uint64_t)v7);
    uint64_t v9 = prepareValuesForBitmap((uint64_t)a1, (uint64_t)v7, (uint64_t)v11, (uint64_t)a4);
    _FileCacheLockTransitionFromPreparer((uint64_t)v7);
  }

  else
  {
    uint64_t v9 = 1LL;
  }

  _FileCacheUnlock((uint64_t)v7);
  if (a4 && !(_DWORD)v9 && !*a4)
  {
    if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
      _FSURLCacheResourcePropertyForKey_cold_1();
    }
    *a4 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 256LL, 0LL);
  }

  return v9;
}

uint64_t _FSURLCacheResourcePropertiesForKeys( const __CFURL *a1, CFArrayRef theArray, const void *a3, CFErrorRef *a4)
{
  uint64_t Count = CFArrayGetCount(theArray);
  if (!Count) {
    return 1LL;
  }
  CFTypeRef v9 = _FileCacheGetForURL(a1, a3);
  _FileCacheLock((uint64_t)v9);
  memset(v12, 0, 60);
  getPropertyBitmapForKeys(theArray, Count, (uint64_t)v12);
  _FileCacheLockTransitionToPreparer((uint64_t)v9);
  uint64_t v10 = prepareValuesForBitmap((uint64_t)a1, (uint64_t)v9, (uint64_t)v12, (uint64_t)a4);
  _FileCacheLockTransitionFromPreparer((uint64_t)v9);
  _FileCacheUnlock((uint64_t)v9);
  if (a4 && !(_DWORD)v10)
  {
    if (*a4)
    {
      return 0LL;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
        _FSURLCacheResourcePropertiesForKeys_cold_1();
      }
      uint64_t v10 = 0LL;
      *a4 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 256LL, 0LL);
    }
  }

  return v10;
}

CFArrayRef getPropertyBitmapForKeys(const __CFArray *theArray, uint64_t a2, uint64_t a3)
{
  if (a2 >= 1)
  {
    CFTypeRef v5 = theArray;
    for (CFIndex i = 0LL; i != a2; ++i)
    {
      CFTypeRef ValueAtIndex = CFArrayGetValueAtIndex(v5, i);
      theArray = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)qword_18C4639F8, ValueAtIndex);
      if (theArray) {
        theArray = (const __CFArray *)addPropertyAndDependenciesToBitmap((uint64_t)theArray, a3);
      }
    }
  }

  return theArray;
}

uint64_t _FSURLTranslateDomainAndCodeToCocoaError(const void *a1, uint64_t a2, int a3, uint64_t *a4)
{
  CFTypeRef v7 = a1;
  uint64_t result = CFEqual(a1, (CFTypeRef)*MEMORY[0x189604F40]);
  if (!(_DWORD)result)
  {
    if (CFEqual(v7, (CFTypeRef)*MEMORY[0x189604F50]))
    {
      if ((int)a2 > -62)
      {
        switch((int)a2)
        {
          case -54:
            a2 = 1LL;
            goto LABEL_39;
          case -53:
          case -52:
          case -49:
          case -47:
          case -46:
          case -45:
          case -44:
          case -41:
          case -40:
          case -39:
          case -38:
            goto LABEL_25;
          case -51:
            a2 = 9LL;
            goto LABEL_39;
          case -50:
            a2 = 22LL;
            goto LABEL_39;
          case -48:
            a2 = 17LL;
            goto LABEL_39;
          case -43:
            goto LABEL_21;
          case -42:
            a2 = 24LL;
            goto LABEL_39;
          case -37:
            a2 = 63LL;
            goto LABEL_39;
          case -36:
            a2 = 5LL;
            goto LABEL_39;
          case -35:
            a2 = 6LL;
            goto LABEL_39;
          case -34:
            a2 = 28LL;
            goto LABEL_39;
          default:
            if ((_DWORD)a2 == -61)
            {
              a2 = 30LL;
            }

            else
            {
              if ((_DWORD)a2) {
                goto LABEL_25;
              }
              a2 = 0LL;
            }

            break;
        }

        goto LABEL_39;
      }

      if ((int)a2 > -1310)
      {
        if ((int)a2 > -129)
        {
          if ((_DWORD)a2 == -128)
          {
            a2 = 89LL;
            goto LABEL_39;
          }

          if ((_DWORD)a2 == -120)
          {
LABEL_21:
            a2 = 2LL;
            goto LABEL_39;
          }
        }

        else
        {
          if ((_DWORD)a2 == -1309)
          {
            a2 = 27LL;
            goto LABEL_39;
          }

          if ((_DWORD)a2 == -1303)
          {
            a2 = 18LL;
            goto LABEL_39;
          }
        }
      }

      else if ((int)a2 > -1426)
      {
        if ((_DWORD)a2 == -1425)
        {
          a2 = 69LL;
          goto LABEL_39;
        }

        if ((_DWORD)a2 == -1407)
        {
          a2 = 20LL;
          goto LABEL_39;
        }
      }

      else
      {
        if ((_DWORD)a2 == -5023)
        {
          a2 = 80LL;
          goto LABEL_39;
        }

        if ((_DWORD)a2 == -5000)
        {
          a2 = 13LL;
LABEL_39:
          CFTypeRef v9 = (const void *)*MEMORY[0x189604F58];
          CFTypeRef v7 = (const void *)*MEMORY[0x189604F58];
LABEL_40:
          uint64_t result = CFEqual(v7, v9);
          if (!(_DWORD)result)
          {
            if (a3) {
              a2 = 512LL;
            }
            else {
              a2 = 256LL;
            }
            goto LABEL_2;
          }

          if (a3)
          {
            if (a2 > 27)
            {
              if (a2 > 62)
              {
                if (a2 == 63)
                {
                  a2 = 514LL;
                  goto LABEL_2;
                }

                if (a2 != 69) {
                  goto LABEL_68;
                }
              }

              else if (a2 != 28)
              {
                if (a2 == 30)
                {
                  a2 = 642LL;
                  goto LABEL_2;
                }

LABEL_2:
  *a4 = a2;
  return result;
}

  *(void *)(a1 + 56) = 0LL;
  return 2LL;
}

__CFArray *_FileURLCreateDisplayPathComponentsArray(const void *a1, __CFError **a2)
{
  uint64_t v4 = CFGetAllocator(a1);
  CFTypeRef v5 = CFRetain(a1);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(v4, 0LL, MEMORY[0x189605228]);
  if (Mutable)
  {
    CFTypeRef v7 = (const __CFString *)*MEMORY[0x1896053E8];
    unint64_t v8 = (const __CFString *)*MEMORY[0x189605530];
    CFTypeRef v9 = (const __CFString *)*MEMORY[0x189605440];
    while (1)
    {
      CFArrayAppendValue(Mutable, v5);
      if (v12)
      {
        if (!v11) {
          goto LABEL_13;
        }
      }

      if (!CFURLCopyResourcePropertyForKey((CFURLRef)v5, v9, &propertyValueTypeRefPtr, a2)) {
        break;
      }
      if (!propertyValueTypeRefPtr) {
        goto LABEL_13;
      }
      CFRelease(v5);
      CFTypeRef v5 = propertyValueTypeRefPtr;
    }

    if (v5) {
      CFRelease(v5);
    }
    CFRelease(Mutable);
    if (a2 && !*a2)
    {
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
        _FileURLCreateDisplayPathComponentsArray_cold_2();
      }
      goto LABEL_21;
    }

    return 0LL;
  }

  if (a2) {
    *a2 = _FSURLCreateStandardError(v4, (const __CFString *)*MEMORY[0x189604F58], 12LL, 0, 0LL, 0LL);
  }
LABEL_13:
  if (v5) {
    CFRelease(v5);
  }
  if (a2 && !Mutable)
  {
    if (!*a2)
    {
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_ERROR)) {
        _FileURLCreateDisplayPathComponentsArray_cold_1();
      }
LABEL_21:
      CFMutableArrayRef Mutable = 0LL;
      *a2 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 256LL, 0LL);
      return Mutable;
    }

    return 0LL;
  }

  return Mutable;
}

uint64_t GetBooleanPropertyValue( const __CFURL *a1, const __CFString *a2, unsigned __int8 *a3, __CFError **a4)
{
  uint64_t result = CFURLCopyResourcePropertyForKey(a1, a2, &propertyValueTypeRefPtr, a4);
  if ((_DWORD)result)
  {
    if (propertyValueTypeRefPtr)
    {
      *a3 = valueOfBoolean(propertyValueTypeRefPtr);
      CFRelease(propertyValueTypeRefPtr);
    }

    else
    {
      *a3 = 0;
    }

    return 1LL;
  }

  return result;
}

BOOL _FSURLStartAccessingSecurityScopedResource(const __CFURL *a1)
{
  CFNumberRef propertyValueTypeRefPtr = 0LL;
  CFTypeRef v2 = (SandboxExtensionCache *)CFURLCopyResourcePropertyForKey( a1,  @"_NSURLSecuritySandboxExtensionKey",  &propertyValueTypeRefPtr,  0LL);
  uint64_t v3 = (os_unfair_lock_s *)SandboxExtensionCache::shared(v2);
  uint64_t v4 = SandboxExtensionCache::consume(v3, a1, propertyValueTypeRefPtr);
  if (v4)
  {
    if (v4 == propertyValueTypeRefPtr)
    {
      CFRelease(v4);
      BOOL v6 = 1LL;
LABEL_14:
      int v9 = CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x189604D00], &cf, 0LL);
      CFTypeRef v10 = cf;
      if (v9) {
        BOOL v11 = cf == 0LL;
      }
      else {
        BOOL v11 = 1;
      }
      if (!v11)
      {
        if (cf != (CFTypeRef)*MEMORY[0x189605018])
        {
          _FSURLStartAccessingSecurityScopedResource();
          CFTypeRef v10 = cf;
        }

        CFRelease(v10);
      }

      return v6;
    }

    _FSURLSetPermanentResourcePropertyForKey(a1, @"_NSURLSecuritySandboxExtensionKey", v4);
    BOOL v5 = 0;
    BOOL v6 = 1LL;
  }

  else
  {
    getpid();
    int v8 = sandbox_check();
    BOOL v5 = v8 != 0;
    BOOL v6 = v8 == 0;
  }

  if (propertyValueTypeRefPtr) {
    CFRelease(propertyValueTypeRefPtr);
  }
  if (!v5) {
    goto LABEL_14;
  }
  return v6;
}

BOOL _FSURLStopAccessingSecurityScopedResource(const __CFURL *a1)
{
  CFNumberRef propertyValueTypeRefPtr = 0LL;
  CFTypeRef v2 = (SandboxExtensionCache *)CFURLCopyResourcePropertyForKey( a1,  @"_NSURLSecuritySandboxExtensionKey",  &propertyValueTypeRefPtr,  0LL);
  uint64_t v3 = (os_unfair_lock_s *)SandboxExtensionCache::shared(v2);
  BOOL v4 = SandboxExtensionCache::release(v3, a1, propertyValueTypeRefPtr);
  if (propertyValueTypeRefPtr) {
    CFRelease(propertyValueTypeRefPtr);
  }
  int v5 = CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x189604D00], &cf, 0LL);
  CFTypeRef v6 = cf;
  if (v5) {
    BOOL v7 = cf == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (cf != (CFTypeRef)*MEMORY[0x189605018])
    {
      _FSURLStopAccessingSecurityScopedResource();
      CFTypeRef v6 = cf;
    }

    CFRelease(v6);
  }

  return v4;
}

CFDataRef _FSURLNoteSecurityScopedResourceMoved(SandboxExtensionCache *a1, const __CFURL *a2)
{
  BOOL v4 = (os_unfair_lock_s *)SandboxExtensionCache::shared(a1);
  CFDataRef result = SandboxExtensionCache::move(v4, a1, a2, 0LL, 0LL);
  if (result)
  {
    CFTypeRef v6 = result;
    _FSURLSetPermanentResourcePropertyForKey(a2, @"_NSURLSecuritySandboxExtensionKey", result);
    CFRelease(v6);
    return (CFDataRef)1;
  }

  return result;
}

CFDataRef _FSURLNoteSecurityScopedResourceMovedWithFileIdentifier( SandboxExtensionCache *a1, const __CFURL *a2, fsid a3, uint64_t a4)
{
  fsid v10 = a3;
  BOOL v7 = (os_unfair_lock_s *)SandboxExtensionCache::shared(a1);
  CFDataRef result = SandboxExtensionCache::move(v7, a1, a2, &v10, a4);
  if (result)
  {
    int v9 = result;
    _FSURLSetPermanentResourcePropertyForKey(a2, @"_NSURLSecuritySandboxExtensionKey", result);
    CFRelease(v9);
    return (CFDataRef)1;
  }

  return result;
}

uint64_t createIsDirectoryValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0x4000) {
    uint64_t v3 = (void *)MEMORY[0x189604DE8];
  }
  else {
    uint64_t v3 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v3;
  return 1LL;
}

uint64_t createNameValue(uint64_t a1, uint64_t a2, void *a3)
{
  CFTypeRef v4 = *(CFTypeRef *)(a2 + 8);
  if (v4) {
    CFTypeRef v4 = CFRetain(v4);
  }
  *a3 = v4;
  return 1LL;
}

uint64_t createIsHiddenValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)a2 & 0x800) != 0 || (*(_BYTE *)(a2 + 21) & 0x80) != 0)
  {
    CFTypeRef v4 = (void *)MEMORY[0x189604DE8];
  }

  else
  {
    if ((*(_DWORD *)a2 & 0x10) == 0) {
      return 0LL;
    }
    CFTypeRef v4 = (void *)MEMORY[0x189604DE8];
    if ((*(_WORD *)(a2 + 168) & 0x4000) == 0) {
      CFTypeRef v4 = (void *)MEMORY[0x189604DE0];
    }
  }

  *a3 = *v4;
  return 1LL;
}

uint64_t createIsUserImmutableValue(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (void *)MEMORY[0x189604DE8];
  if ((*(_DWORD *)(a2 + 20) & 2) == 0) {
    uint64_t v3 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v3;
  return 1LL;
}

uint64_t createIsSystemImmutableValue(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (void *)MEMORY[0x189604DE8];
  if ((*(_DWORD *)(a2 + 20) & 0x20000) == 0) {
    uint64_t v3 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v3;
  return 1LL;
}

uint64_t createLinkCountValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  int v5 = CFGetAllocator(a1);
  *a3 = CFNumberCreate(v5, kCFNumberSInt32Type, (const void *)(a2 + 24));
  return 1LL;
}

uint64_t createIsSystemNoUnlinkValue(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (void *)MEMORY[0x189604DE8];
  if ((*(_DWORD *)(a2 + 20) & 0x100000) == 0) {
    uint64_t v3 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v3;
  return 1LL;
}

uint64_t createIsRestrictedValue(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (void *)MEMORY[0x189604DE8];
  if ((*(_DWORD *)(a2 + 20) & 0x80000) == 0) {
    uint64_t v3 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v3;
  return 1LL;
}

uint64_t createIsSystemAppendValue(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (void *)MEMORY[0x189604DE8];
  if ((*(_DWORD *)(a2 + 20) & 0x40000) == 0) {
    uint64_t v3 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v3;
  return 1LL;
}

uint64_t createIsUserAppendValue(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (void *)MEMORY[0x189604DE8];
  if ((*(_DWORD *)(a2 + 20) & 4) == 0) {
    uint64_t v3 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v3;
  return 1LL;
}

uint64_t createAddedToDirectoryDateValue(const void *a1, uint64_t a2, CFDateRef *a3)
{
  if (*(double *)(a2 + 88) == -1.0 - *MEMORY[0x189604DA0])
  {
    CFDateRef v4 = 0LL;
  }

  else
  {
    CFTypeRef v6 = CFGetAllocator(a1);
    CFDateRef v4 = CFDateCreate(v6, *(CFAbsoluteTime *)(a2 + 88));
  }

  *a3 = v4;
  return 1LL;
}

uint64_t createFileSizeValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  if ((*(_BYTE *)a2 & 0x40) == 0) {
    return 0LL;
  }
  if ((*(_DWORD *)(a2 + 16) & 0xD000 | 0x2000) == 0xA000)
  {
    CFTypeRef v6 = CFGetAllocator(a1);
    CFNumberRef v7 = CFNumberCreate(v6, kCFNumberSInt64Type, (const void *)(a2 + 208));
  }

  else
  {
    CFNumberRef v7 = 0LL;
  }

  *a3 = v7;
  return 1LL;
}

uint64_t createIsRegularFileValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0x8000) {
    uint64_t v3 = (void *)MEMORY[0x189604DE8];
  }
  else {
    uint64_t v3 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v3;
  return 1LL;
}

uint64_t createIsSymbolicLinkValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0xA000) {
    uint64_t v3 = (void *)MEMORY[0x189604DE8];
  }
  else {
    uint64_t v3 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v3;
  return 1LL;
}

uint64_t createIsAliasFileValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0x8000)
  {
    if ((*(_BYTE *)a2 & 0x10) == 0) {
      return 0LL;
    }
    uint64_t v3 = (void *)MEMORY[0x189604DE8];
  }

  else if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0xA000)
  {
    uint64_t v3 = (void *)MEMORY[0x189604DE8];
  }

  else
  {
    uint64_t v3 = (void *)MEMORY[0x189604DE0];
  }

  *a3 = *v3;
  return 1LL;
}

uint64_t createIsVolumeValue(uint64_t a1, _DWORD *a2, void *a3)
{
  uint64_t v3 = (void *)MEMORY[0x189604DE8];
  if ((*a2 & 0x2000) == 0) {
    uint64_t v3 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v3;
  return 1LL;
}

uint64_t createFileAllocatedSizeValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  if ((*(_BYTE *)a2 & 0x40) == 0) {
    return 0LL;
  }
  if ((*(_DWORD *)(a2 + 16) & 0xD000 | 0x2000) == 0xA000)
  {
    CFTypeRef v6 = CFGetAllocator(a1);
    uint64_t valuePtr = *(void *)(a2 + 216);
    CFNumberRef v7 = CFNumberCreate(v6, kCFNumberSInt64Type, &valuePtr);
  }

  else
  {
    CFNumberRef v7 = 0LL;
  }

  *a3 = v7;
  return 1LL;
}

uint64_t createFinderInfoValue(const void *a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)a2 & 0x10) == 0) {
    return 0LL;
  }
  if ((*(_DWORD *)a2 & 0x4000000) != 0)
  {
    if (createFinderInfoValue(__CFURL const*,_FileAttributes const*,void *)::onceToken != -1) {
      dispatch_once( &createFinderInfoValue(__CFURL const*,_FileAttributes const*,void *)::onceToken,  &__block_literal_global_20);
    }
    CFNumberRef v7 = (void *)CFRetain((CFTypeRef)createFinderInfoValue(__CFURL const*,_FileAttributes const*,void *)::zeroFinderInfoData);
    uint64_t result = 1LL;
  }

  else
  {
    CFTypeRef v6 = CFGetAllocator(a1);
    CFNumberRef v7 = CFDataCreate(v6, (const UInt8 *)(a2 + 160), 32LL);
    uint64_t result = 2LL;
  }

  *a3 = v7;
  return result;
}

uint64_t createFileSizeOfResourceForkValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0x8000)
  {
    if ((*(_BYTE *)a2 & 0x20) == 0) {
      return 0LL;
    }
    CFNumberRef v7 = CFGetAllocator(a1);
    CFNumberRef v6 = CFNumberCreate(v7, kCFNumberSInt64Type, (const void *)(a2 + 192));
  }

  else
  {
    CFNumberRef v6 = 0LL;
  }

  *a3 = v6;
  return 1LL;
}

uint64_t createFileAllocatedSizeOfResourceForkValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0x8000)
  {
    if ((*(_BYTE *)a2 & 0x20) == 0) {
      return 0LL;
    }
    CFNumberRef v7 = CFGetAllocator(a1);
    uint64_t valuePtr = *(void *)(a2 + 200);
    CFNumberRef v6 = CFNumberCreate(v7, kCFNumberSInt64Type, &valuePtr);
  }

  else
  {
    CFNumberRef v6 = 0LL;
  }

  *a3 = v6;
  return 1LL;
}

uint64_t createIsCompressedValue(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (void *)MEMORY[0x189604DE8];
  if ((*(_DWORD *)(a2 + 20) & 0x20) == 0) {
    uint64_t v3 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v3;
  return 1LL;
}

uint64_t createParentDirectoryIsVolumeRoot(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_BYTE *)a2 & 4) == 0) {
    return 0LL;
  }
  CFDateRef v4 = (void *)MEMORY[0x189604DE8];
  if (*(void *)(a2 + 136) != 2LL) {
    CFDateRef v4 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v4;
  return 1LL;
}

uint64_t createFileIDValue(const void *a1, _BYTE *a2, CFNumberRef *a3)
{
  if ((*a2 & 4) == 0) {
    return 0LL;
  }
  int v5 = a2 + 128;
  if (*((void *)a2 + 16))
  {
    CFNumberRef v6 = CFGetAllocator(a1);
    CFNumberRef v7 = CFNumberCreate(v6, kCFNumberSInt64Type, v5);
  }

  else
  {
    CFNumberRef v7 = 0LL;
  }

  *a3 = v7;
  return 1LL;
}

uint64_t createContentModificationDateValue(const void *a1, uint64_t a2, CFDateRef *a3)
{
  int v5 = CFGetAllocator(a1);
  *a3 = CFDateCreate(v5, *(CFAbsoluteTime *)(a2 + 64));
  return 1LL;
}

uint64_t createAttributeModificationDateValue(const void *a1, uint64_t a2, CFDateRef *a3)
{
  int v5 = CFGetAllocator(a1);
  *a3 = CFDateCreate(v5, *(CFAbsoluteTime *)(a2 + 72));
  return 1LL;
}

uint64_t createCreationDateValue(const void *a1, uint64_t a2, CFDateRef *a3)
{
  if (*(double *)(a2 + 80) == -1.0 - *MEMORY[0x189604DA0])
  {
    CFDateRef v4 = 0LL;
  }

  else
  {
    CFNumberRef v6 = CFGetAllocator(a1);
    CFDateRef v4 = CFDateCreate(v6, *(CFAbsoluteTime *)(a2 + 80));
  }

  *a3 = v4;
  return 1LL;
}

uint64_t createHasHiddenExtensionValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_BYTE *)a2 & 0x10) == 0)
  {
    int v5 = *(const __CFString **)(a2 + 8);
    if (v5)
    {
      CFIndex Length = CFStringGetLength(*(CFStringRef *)(a2 + 8));
      if ((*(_BYTE *)(a2 + 3) & 8) != 0)
      {
        if (*(_WORD *)(a2 + 4) == 3)
        {
          CFStringRef theString = v5;
          CFIndex v51 = Length - 3;
          CFIndex v52 = 3LL;
          CharactersPtr = CFStringGetCharactersPtr(v5);
          uint64_t v49 = CharactersPtr;
          if (CharactersPtr) {
            CStringPtr = 0LL;
          }
          else {
            CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
          }
          uint64_t v20 = 0LL;
          uint64_t v53 = 0LL;
          CFIndex v54 = 0LL;
          uint64_t v50 = CStringPtr;
          if (!CharactersPtr)
          {
LABEL_32:
            if (v50)
            {
              UniChar v21 = v50[v51 + v20];
            }

            else
            {
              if (v54 <= v20 || (uint64_t v25 = v53, v53 > v20))
              {
                v26.CFIndex location = v51;
                if (v52 >= 64) {
                  v26.CFIndex length = 64LL;
                }
                else {
                  v26.CFIndex length = v52;
                }
                uint64_t v53 = 0LL;
                CFIndex v54 = v26.length;
                CFStringGetCharacters(theString, v26, buffer);
                uint64_t v25 = v53;
              }

              UniChar v21 = buffer[v20 - v25];
            }

LABEL_106:
        uint64_t v46 = (void *)MEMORY[0x189604DE0];
        goto LABEL_107;
      }
    }

    UniChar v24 = v17[v51 + v23];
    goto LABEL_70;
  }

  uint64_t v65 = *(_OWORD *)v62;
  v62 += 4;
  unsigned int v144 = v65;
  CFTypeID v132 = (const unsigned __int8 *)&v144;
  if ((v10 & 0x2000000) == 0)
  {
LABEL_113:
    if ((v10 & 0x4000000) == 0) {
      goto LABEL_114;
    }
LABEL_119:
    if ((v16 & 0x4000000) != 0)
    {
      uint64_t v68 = *(void *)v62;
      v62 += 2;
      *(void *)(a6 + 136) = v68;
      if ((v10 & 0x8000000) != 0) {
        goto LABEL_123;
      }
    }

    else
    {
      *(void *)(a6 + 136) = 0LL;
      if ((v10 & 0x8000000) != 0) {
        goto LABEL_123;
      }
    }

          if (*v47 == 47) {
            int v58 = "/";
          }
          else {
            int v58 = ".";
          }
          strlcpy((char *)__s, v58, 0x400uLL);
          CFRange v55 = v47;
LABEL_110:
          int v59 = v55 - v47 + 1;
          if (v59 >= 0x400) {
            *__error() = 63;
          }
          memcpy(__s, v47, v59);
          __s[v59] = 0;
        }

        else
        {
          strncpy((char *)__s, ".", 0x400uLL);
        }

        int v60 = CFGetAllocator(a1);
        uint64_t v61 = strlen((const char *)__s);
        uint64_t v62 = CFURLCreateFromFileSystemRepresentation(v60, __s, v61, 1u);
        unsigned int v82 = v62;
        UniChar v14 = v79;
        if (!v62)
        {
          if (v74)
          {
            uint64_t v64 = CFGetAllocator(a1);
            uint64_t v27 = 0LL;
            *uint64_t v74 = _FSURLCreateStandardError(v64, v71, 4LL, 0, (const __CFString *)a1, 0LL);
          }

          else
          {
            uint64_t v27 = 0LL;
          }

          UniChar v14 = v79;
          goto LABEL_120;
        }

        uint64_t v63 = v62;
        _FileCacheSetPropertyValueForKey(a2, v16, v62);
        CFRelease(v63);
      }

      uint64_t v27 = 1LL;
      goto LABEL_120;
    }

    if (CFEqual(v17, cf2))
    {
      if (!_FileCacheGetPropertyValueForKey(a2, cf2, (void **)&cf))
      {
        uint64_t v29 = v14;
        if (CFURLGetBaseURL(a1))
        {
          CFRange v30 = CFURLCopyAbsoluteURL(a1);
          if (!v30) {
            goto LABEL_123;
          }
        }

        else
        {
          CFRetain(a1);
          CFRange v30 = a1;
          if (!a1) {
            goto LABEL_123;
          }
        }

        UniChar v43 = CFURLCopyFileSystemPath(v30, kCFURLPOSIXPathStyle);
        CFRelease(v30);
        if (!v43)
        {
LABEL_123:
          if (v74)
          {
            uint64_t v65 = CFGetAllocator(a1);
            *uint64_t v74 = _FSURLCreateStandardError(v65, v71, 4LL, 0, (const __CFString *)a1, 0LL);
          }

          goto LABEL_125;
        }

        _FileCacheSetPropertyValueForKey(a2, cf2, v43);
        CFRelease(v43);
        UniChar v14 = v29;
        unint64_t v16 = v77;
      }

      goto LABEL_54;
    }

    if (CFEqual(v17, v76))
    {
      if (!_FileCacheGetPropertyValueForKey(a2, v76, (void **)&cf))
      {
        if (!v75 && !CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024LL)) {
          goto LABEL_123;
        }
        uint64_t v44 = getxattr((const char *)buffer, "com.apple.metadata:com_apple_backup_excludeItem", 0LL, 0LL, 0, 1);
        CFRange v45 = v73;
        if (v44 <= 0)
        {
          else {
            CFRange v45 = v70;
          }
        }

        _FileCacheSetPropertyValueForKey(a2, v76, v45);
        uint64_t v75 = 1;
      }

      uint64_t v27 = 1LL;
      goto LABEL_55;
    }

    if (CFEqual(v17, v72))
    {
      if (!_FileCacheGetPropertyValueForKey(a2, v72, (void **)&cf))
      {
        if (!v75 && !CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024LL)) {
          goto LABEL_123;
        }
        uint64_t v75 = 1;
        else {
          CFRange v56 = v70;
        }
        _FileCacheSetPropertyValueForKey(a2, v72, v56);
      }

      uint64_t v27 = 1LL;
      goto LABEL_55;
    }

    if (!CFEqual(v17, v69)) {
      break;
    }
    if (!_FileCacheGetPropertyValueForKey(a2, v69, (void **)&cf))
    {
      if (!v75 && !CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024LL)) {
        goto LABEL_123;
      }
      uint64_t v75 = 1;
      else {
        uint64_t v57 = v70;
      }
      _FileCacheSetPropertyValueForKey(a2, v69, v57);
    }

    uint64_t v27 = 1LL;
LABEL_55:
    if (++v12 == a5) {
      goto LABEL_126;
    }
  }

  if (!v74)
  {
LABEL_125:
    uint64_t v27 = 0LL;
    goto LABEL_126;
  }

  CFTypeID v67 = CFGetAllocator(a1);
  uint64_t v27 = 0LL;
  *uint64_t v74 = _FSURLCreateStandardError(v67, v71, 256LL, 1, (const __CFString *)a1, 0LL);
LABEL_126:
  _FileCacheUnlock(a2);
  return v27;
}

LABEL_105:
  uint64_t v46 = (void *)MEMORY[0x189604DE8];
LABEL_107:
  *a3 = *v46;
  return 1LL;
}

uint64_t createIsReadableValue(uint64_t a1, _DWORD *a2, void *a3)
{
  if ((*a2 & 8) == 0) {
    return 0LL;
  }
  if ((*a2 & 0x2000000) != 0) {
    CFDateRef v4 = (void *)MEMORY[0x189604DE8];
  }
  else {
    CFDateRef v4 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v4;
  return 1LL;
}

uint64_t createIsWriteableValue(uint64_t a1, _DWORD *a2, void *a3)
{
  if ((*a2 & 8) == 0) {
    return 0LL;
  }
  if ((*a2 & 0x1000000) != 0) {
    CFDateRef v4 = (void *)MEMORY[0x189604DE8];
  }
  else {
    CFDateRef v4 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v4;
  return 1LL;
}

uint64_t createIsExecutableValue(uint64_t a1, _DWORD *a2, void *a3)
{
  if ((*a2 & 8) == 0) {
    return 0LL;
  }
  if ((*a2 & 0x800000) != 0) {
    CFDateRef v4 = (void *)MEMORY[0x189604DE8];
  }
  else {
    CFDateRef v4 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v4;
  return 1LL;
}

uint64_t createLabelNumberValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  if ((*(_BYTE *)a2 & 0x10) == 0) {
    return 0LL;
  }
  int valuePtr = (*(unsigned __int16 *)(a2 + 168) >> 1) & 7;
  int v5 = CFGetAllocator(a1);
  *a3 = CFNumberCreate(v5, kCFNumberSInt32Type, &valuePtr);
  return 1LL;
}

uint64_t createFileSecurityValue(uint64_t a1, uint64_t a2, CFFileSecurityRef *a3)
{
  if ((*(_BYTE *)a2 & 0x80) == 0) {
    return 0LL;
  }
  CFNumberRef v6 = CFGetAllocator(*(CFTypeRef *)(a2 + 224));
  *a3 = CFFileSecurityCreateCopy(v6, *(CFFileSecurityRef *)(a2 + 224));
  return 1LL;
}

uint64_t createFileProtectionValue(uint64_t a1, uint64_t a2, const void **a3)
{
  int v3 = *(_DWORD *)(a2 + 48) - 1;
  if (v3 >= 4)
  {
    *a3 = 0LL;
  }

  else
  {
    CFDateRef v4 = (const void **)qword_189C5B5F0[v3];
    int v5 = *v4;
    *a3 = *v4;
    if (v5) {
      CFRetain(v5);
    }
  }

  return 1LL;
}

uint64_t createContentAccessDateValue(const void *a1, uint64_t a2, CFDateRef *a3)
{
  int v5 = CFGetAllocator(a1);
  *a3 = CFDateCreate(v5, *(CFAbsoluteTime *)(a2 + 56));
  return 1LL;
}

uint64_t createTotalFileSizeValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0xA000)
  {
    if ((*(_BYTE *)a2 & 0x40) != 0)
    {
      int v5 = CFGetAllocator(a1);
      CFNumberRef v6 = (uint64_t *)(a2 + 208);
      goto LABEL_9;
    }

    return 0LL;
  }

  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0x8000)
  {
    if ((~*(_DWORD *)a2 & 0x60) == 0)
    {
      uint64_t v8 = *(void *)(a2 + 192) + *(void *)(a2 + 208);
      int v5 = CFGetAllocator(a1);
      CFNumberRef v6 = &v8;
LABEL_9:
      *a3 = CFNumberCreate(v5, kCFNumberSInt64Type, v6);
      return 1LL;
    }

    return 0LL;
  }

  *a3 = 0LL;
  return 1LL;
}

uint64_t createTotalFileAllocatedSizeValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0xA000)
  {
    if ((*(_BYTE *)a2 & 0x40) != 0)
    {
      CFNumberRef v6 = CFGetAllocator(a1);
      uint64_t valuePtr = *(void *)(a2 + 216);
      goto LABEL_9;
    }

    return 0LL;
  }

  if ((*(_DWORD *)(a2 + 16) & 0xF000) == 0x8000)
  {
    if ((~*(_DWORD *)a2 & 0x60) == 0)
    {
      uint64_t v5 = *(void *)(a2 + 200) + *(void *)(a2 + 216);
      CFNumberRef v6 = CFGetAllocator(a1);
      uint64_t valuePtr = v5;
LABEL_9:
      CFNumberRef v8 = CFNumberCreate(v6, kCFNumberSInt64Type, &valuePtr);
      goto LABEL_10;
    }

    return 0LL;
  }

  CFNumberRef v8 = 0LL;
LABEL_10:
  *a3 = v8;
  return 1LL;
}

uint64_t createFileResourceIdentifierValue(const void *a1, uint64_t a2, CFDataRef *a3)
{
  if ((*(_BYTE *)a2 & 4) == 0) {
    return 0LL;
  }
  if (*(_DWORD *)(a2 + 112)) {
    uint64_t v5 = *(unsigned int *)(a2 + 112);
  }
  else {
    uint64_t v5 = *(void *)(a2 + 104);
  }
  v7[0] = *(void *)(a2 + 120);
  v7[1] = v5;
  CFNumberRef v6 = CFGetAllocator(a1);
  *a3 = CFDataCreate(v6, (const UInt8 *)v7, 16LL);
  return 1LL;
}

uint64_t createGenerationIdentifierValue(const void *a1, uint64_t a2, CFDataRef *a3)
{
  int v4 = *(_DWORD *)(a2 + 32);
  if (v4)
  {
    if ((*(_BYTE *)a2 & 4) == 0) {
      return 0LL;
    }
    uint64_t v7 = *(void *)(a2 + 120);
    int v8 = v4;
    CFNumberRef v6 = CFGetAllocator(a1);
    *a3 = CFDataCreate(v6, (const UInt8 *)&v7, 12LL);
  }

  else
  {
    *a3 = 0LL;
  }

  return 1LL;
}

uint64_t createDocumentIdentifierValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  int v4 = (const void *)(a2 + 36);
  if (*(_DWORD *)(a2 + 36))
  {
    uint64_t v5 = CFGetAllocator(a1);
    CFNumberRef v6 = CFNumberCreate(v5, kCFNumberSInt32Type, v4);
  }

  else
  {
    CFNumberRef v6 = 0LL;
  }

  *a3 = v6;
  return 1LL;
}

uint64_t createFileResourceTypeValue(uint64_t a1, uint64_t a2, const void **a3)
{
  unsigned int v3 = (*(_DWORD *)(a2 + 16) & 0xF000) - 4096;
  if (v3 >> 14 > 2) {
    int v4 = (const void **)MEMORY[0x189605330];
  }
  else {
    int v4 = (const void **)qword_189C5B610[v3 >> 12];
  }
  uint64_t v5 = *v4;
  *a3 = *v4;
  CFRetain(v5);
  return 1LL;
}

uint64_t createPreferredIOBlockSizeValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  if (*(_DWORD *)(a2 + 96))
  {
    uint64_t v5 = CFGetAllocator(a1);
    uint64_t valuePtr = *(unsigned int *)(a2 + 96);
    CFNumberRef v6 = CFNumberCreate(v5, kCFNumberSInt64Type, &valuePtr);
  }

  else
  {
    CFNumberRef v6 = 0LL;
  }

  *a3 = v6;
  return 1LL;
}

uint64_t createIsMountTriggerValue(uint64_t a1, _DWORD *a2, void *a3)
{
  unsigned int v3 = (void *)MEMORY[0x189604DE8];
  if ((*a2 & 0x4000) == 0) {
    unsigned int v3 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v3;
  return 1LL;
}

uint64_t createCanonicalPathValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_BYTE *)(a2 + 1) & 1) == 0) {
    return 0LL;
  }
  CFTypeRef v5 = *(CFTypeRef *)(a2 + 232);
  if (v5) {
    CFTypeRef v5 = CFRetain(v5);
  }
  *a3 = v5;
  return 1LL;
}

uint64_t createInodeNumberValue(const void *a1, _BYTE *a2, CFNumberRef *a3)
{
  if ((*a2 & 4) == 0) {
    return 0LL;
  }
  CFTypeRef v5 = a2 + 120;
  if (*((void *)a2 + 15))
  {
    CFNumberRef v6 = CFGetAllocator(a1);
    CFNumberRef v7 = CFNumberCreate(v6, kCFNumberSInt64Type, v5);
  }

  else
  {
    CFNumberRef v7 = 0LL;
  }

  *a3 = v7;
  return 1LL;
}

uint64_t createFileContentIdentifierValue(uint64_t a1, _BYTE *a2, CFNumberRef *a3)
{
  if ((*a2 & 4) == 0) {
    return 0LL;
  }
  if (*((void *)a2 + 18)) {
    CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt64Type, a2 + 144);
  }
  else {
    CFNumberRef v5 = 0LL;
  }
  *a3 = v5;
  return 1LL;
}

uint64_t createMayShareFileContentValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)a2 & 1) == 0) {
    return 0LL;
  }
  if ((*(_DWORD *)a2 & 0x200) != 0)
  {
    CFNumberRef v5 = (uint64_t *)MEMORY[0x189604DE8];
    if ((*(_BYTE *)(a2 + 152) & 1) == 0) {
      CFNumberRef v5 = (uint64_t *)MEMORY[0x189604DE0];
    }
    uint64_t v4 = *v5;
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  *a3 = v4;
  return 1LL;
}

uint64_t createMayHaveExtendedAttributesValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)a2 & 1) == 0) {
    return 0LL;
  }
  if ((*(_DWORD *)a2 & 0x200) != 0)
  {
    CFNumberRef v5 = (uint64_t *)MEMORY[0x189604DE0];
    if ((*(_BYTE *)(a2 + 152) & 2) == 0) {
      CFNumberRef v5 = (uint64_t *)MEMORY[0x189604DE8];
    }
    uint64_t v4 = *v5;
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  *a3 = v4;
  return 1LL;
}

uint64_t createIsPurgeableValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)a2 & 1) == 0) {
    return 0LL;
  }
  if ((*(_DWORD *)a2 & 0x200) != 0)
  {
    CFNumberRef v5 = (uint64_t *)MEMORY[0x189604DE8];
    if ((*(_BYTE *)(a2 + 152) & 8) == 0) {
      CFNumberRef v5 = (uint64_t *)MEMORY[0x189604DE0];
    }
    uint64_t v4 = *v5;
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  *a3 = v4;
  return 1LL;
}

uint64_t createIsSparseValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)a2 & 1) == 0) {
    return 0LL;
  }
  if ((*(_DWORD *)a2 & 0x200) != 0)
  {
    CFNumberRef v5 = (uint64_t *)MEMORY[0x189604DE8];
    if ((*(_BYTE *)(a2 + 152) & 0x10) == 0) {
      CFNumberRef v5 = (uint64_t *)MEMORY[0x189604DE0];
    }
    uint64_t v4 = *v5;
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  *a3 = v4;
  return 1LL;
}

uint64_t createDirectoryEntryCountValue(uint64_t a1, uint64_t a2, CFNumberRef *a3)
{
  if ((*(_BYTE *)(a2 + 1) & 4) == 0) {
    return 0LL;
  }
  uint64_t valuePtr = *(unsigned int *)(a2 + 28);
  *a3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberSInt64Type, &valuePtr);
  return 2LL;
}

uint64_t createFaultLogicalFileIsHiddenValue(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(_DWORD *)a2 & 0x1000) != 0 || (*(_BYTE *)(a2 + 21) & 0x80) != 0)
  {
    uint64_t v4 = (void *)MEMORY[0x189604DE8];
  }

  else
  {
    if ((*(_DWORD *)a2 & 0x10) == 0) {
      return 0LL;
    }
    uint64_t v4 = (void *)MEMORY[0x189604DE8];
    if ((*(_WORD *)(a2 + 168) & 0x4000) == 0) {
      uint64_t v4 = (void *)MEMORY[0x189604DE0];
    }
  }

  *a3 = *v4;
  return 1LL;
}

uint64_t createNameExtensionValue(CFTypeRef cf, uint64_t a2, CFStringRef *a3)
{
  if ((*(_BYTE *)(a2 + 3) & 8) == 0 && *(void *)(a2 + 8))
  {
    _CFGetPathExtensionRangesFromPathComponent();
    if (v12 == -1) {
      __int16 v6 = 0;
    }
    else {
      __int16 v6 = v13;
    }
    *(_WORD *)(a2 + 4) = v6;
    *(_DWORD *)a2 |= 0x8000000u;
  }

  if (*(void *)(a2 + 8) && *(_WORD *)(a2 + 4))
  {
    CFNumberRef v7 = CFGetAllocator(cf);
    int v8 = *(const __CFString **)(a2 + 8);
    CFIndex Length = CFStringGetLength(v8);
    v14.CFIndex length = *(unsigned __int16 *)(a2 + 4);
    v14.CFIndex location = Length - v14.length;
    CFStringRef v10 = CFStringCreateWithSubstring(v7, v8, v14);
  }

  else
  {
    CFStringRef v10 = 0LL;
  }

  *a3 = v10;
  return 1LL;
}

uint64_t createVolumeIsHFSStandardValue(uint64_t a1, _DWORD *a2, void *a3)
{
  unsigned int v3 = (void *)MEMORY[0x189604DE8];
  if ((*a2 & 0x40000) == 0) {
    unsigned int v3 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v3;
  return 1LL;
}

uint64_t createIsUserNoDumpValue(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v3 = (void *)MEMORY[0x189604DE8];
  if ((*(_DWORD *)(a2 + 20) & 1) == 0) {
    unsigned int v3 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v3;
  return 1LL;
}

uint64_t createIsUserOpaqueValue(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v3 = (void *)MEMORY[0x189604DE8];
  if ((*(_DWORD *)(a2 + 20) & 8) == 0) {
    unsigned int v3 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v3;
  return 1LL;
}

uint64_t createIsUserTrackedValue(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v3 = (void *)MEMORY[0x189604DE8];
  if ((*(_DWORD *)(a2 + 20) & 0x40) == 0) {
    unsigned int v3 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v3;
  return 1LL;
}

uint64_t createIsUserDataVaultValue(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v3 = (void *)MEMORY[0x189604DE8];
  if ((*(_DWORD *)(a2 + 20) & 0x80) == 0) {
    unsigned int v3 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v3;
  return 1LL;
}

uint64_t createIsSystemArchivedValue(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v3 = (void *)MEMORY[0x189604DE8];
  if ((*(_DWORD *)(a2 + 20) & 0x10000) == 0) {
    unsigned int v3 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v3;
  return 1LL;
}

uint64_t createVolumeIDValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  uint64_t v4 = (const void *)(a2 + 112);
  if (*(_DWORD *)(a2 + 112))
  {
    CFNumberRef v5 = CFGetAllocator(a1);
    CFNumberRef v6 = CFNumberCreate(v5, kCFNumberSInt32Type, v4);
  }

  else
  {
    CFNumberRef v6 = 0LL;
  }

  *a3 = v6;
  return 1LL;
}

uint64_t createParentDirectoryIDValue(const void *a1, _BYTE *a2, CFNumberRef *a3)
{
  if ((*a2 & 4) == 0) {
    return 0LL;
  }
  CFNumberRef v5 = a2 + 136;
  if (*((void *)a2 + 17))
  {
    CFNumberRef v6 = CFGetAllocator(a1);
    CFNumberRef v7 = CFNumberCreate(v6, kCFNumberSInt64Type, v5);
  }

  else
  {
    CFNumberRef v7 = 0LL;
  }

  *a3 = v7;
  return 1LL;
}

uint64_t createOwnerIDValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  CFNumberRef v5 = CFGetAllocator(a1);
  *a3 = CFNumberCreate(v5, kCFNumberSInt32Type, (const void *)(a2 + 40));
  return 1LL;
}

uint64_t createGroupIDValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  CFNumberRef v5 = CFGetAllocator(a1);
  *a3 = CFNumberCreate(v5, kCFNumberSInt32Type, (const void *)(a2 + 44));
  return 1LL;
}

uint64_t createStatModeValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  CFNumberRef v5 = CFGetAllocator(a1);
  *a3 = CFNumberCreate(v5, kCFNumberSInt32Type, (const void *)(a2 + 16));
  return 1LL;
}

uint64_t createIsSystemFirmlinkValue(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v3 = (void *)MEMORY[0x189604DE8];
  if ((*(_DWORD *)(a2 + 20) & 0x800000) == 0) {
    unsigned int v3 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v3;
  return 1LL;
}

uint64_t createIsSystemDatalessValue(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int v3 = (void *)MEMORY[0x189604DE8];
  if ((*(_DWORD *)(a2 + 20) & 0x40000000) == 0) {
    unsigned int v3 = (void *)MEMORY[0x189604DE0];
  }
  *a3 = *v3;
  return 1LL;
}

uint64_t createFileFlagsValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  CFNumberRef v5 = CFGetAllocator(a1);
  *a3 = CFNumberCreate(v5, kCFNumberSInt32Type, (const void *)(a2 + 20));
  return 1LL;
}

uint64_t createGenerationCountValue(const void *a1, uint64_t a2, CFNumberRef *a3)
{
  uint64_t v4 = (const void *)(a2 + 32);
  if (*(_DWORD *)(a2 + 32))
  {
    CFNumberRef v5 = CFGetAllocator(a1);
    CFNumberRef v6 = CFNumberCreate(v5, kCFNumberSInt32Type, v4);
  }

  else
  {
    CFNumberRef v6 = 0LL;
  }

  *a3 = v6;
  return 1LL;
}

uint64_t corePropertyProviderCopyValues( uint64_t a1, uint64_t a2, uint64_t a3, CFTypeRef *a4, uint64_t *a5, uint64_t a6)
{
  if (!a6) {
    return 1LL;
  }
  uint64_t v6 = a6;
  if ((*(_BYTE *)_FileCacheGetAttributes(a2) & 1) == 0) {
    return 0LL;
  }
  if (v6 < 1) {
    return 1LL;
  }
  while (1)
  {
    CFTypeRef cf = 0LL;
    uint64_t v12 = *a5;
    if ((*(_BYTE *)(*a5 + 8) & 2) == 0
      || !_FileCacheGetPropertyValueForKey(a2, *(const void **)v12, (void **)&cf))
    {
      break;
    }

    if (cf) {
      CFRetain(cf);
    }
LABEL_12:
    *a4++ = cf;
    ++a5;
    if (!--v6) {
      return 1LL;
    }
  }

  __int16 v13 = *(unsigned int (**)(uint64_t, uint64_t, CFTypeRef *))(v12 + 24);
  if (v13)
  {
    uint64_t Attributes = _FileCacheGetAttributes(a2);
    if (v13(a1, Attributes, &cf)) {
      goto LABEL_12;
    }
  }

  uint64_t result = 0LL;
  *a4 = 0LL;
  return result;
}

uint64_t corePropertyProviderPrepareValues( const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, CFErrorRef *a7)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  *(_OWORD *)&v37.bitmapcount = xmmword_182EA5308;
  *(void *)&v37.attrgroup_t fileattr = 0LL;
  _FileCacheLock(a2);
  uint64_t v39 = 0LL;
  if (a5 < 1) {
    goto LABEL_6;
  }
  do
  {
    uint64_t v12 = *a4++;
    *(&v38 + *(void *)(v12 + 16)) = 1;
    --a5;
  }

  while (a5);
  if (!HIBYTE(v39) || (*(_BYTE *)(_FileCacheGetAttributes(a2) + 1) & 4) != 0)
  {
LABEL_6:
    attrgroup_t v17 = 0;
    attrgroup_t v15 = 0;
    attrgroup_t v16 = 0;
    attrgroup_t v13 = 0;
    attrgroup_t v14 = 0;
    int v18 = 0;
  }

  else
  {
    attrgroup_t v14 = dword_18C463AFC;
    attrgroup_t v13 = qword_18C463B00;
    v37.attrgroup_t commonattr = dword_18C463AFC;
    *(void *)&v37.volattr = qword_18C463B00;
    attrgroup_t v16 = HIDWORD(qword_18C463B00);
    attrgroup_t v15 = qword_18C463B08;
    *(void *)&v37.attrgroup_t fileattr = qword_18C463B08;
    attrgroup_t v17 = HIDWORD(qword_18C463B08);
    int v18 = 1;
  }

  if (BYTE4(v39) && (*(_BYTE *)_FileCacheGetAttributes(a2) & 4) == 0)
  {
    v14 |= dword_18C463AB4;
    v13 |= unk_18C463AB8;
    v16 |= dword_18C463ABC;
    v37.attrgroup_t commonattr = v14;
    v37.volattr = v13;
    v15 |= unk_18C463AC0;
    v37.attrgroup_t dirattr = v16;
    v37.attrgroup_t fileattr = v15;
    v17 |= dword_18C463AC4;
    v37.attrgroup_t forkattr = v17;
    int v18 = 1;
  }

  if (BYTE6(v39) && (*(_BYTE *)(_FileCacheGetAttributes(a2) + 1) & 1) == 0)
  {
    v14 |= dword_18C463AE4;
    v13 |= unk_18C463AE8;
    v16 |= dword_18C463AEC;
    v37.attrgroup_t commonattr = v14;
    v37.volattr = v13;
    v15 |= unk_18C463AF0;
    v37.attrgroup_t dirattr = v16;
    v37.attrgroup_t fileattr = v15;
    v17 |= dword_18C463AF4;
    v37.attrgroup_t forkattr = v17;
    int v18 = 1;
  }

  if (BYTE5(v39) && (*(_BYTE *)_FileCacheGetAttributes(a2) & 0x40) == 0)
  {
    v14 |= dword_18C463ACC;
    v13 |= unk_18C463AD0;
    v16 |= dword_18C463AD4;
    v37.attrgroup_t commonattr = v14;
    v37.volattr = v13;
    v15 |= dword_18C463AD8;
    v37.attrgroup_t dirattr = v16;
    v37.attrgroup_t fileattr = v15;
    v17 |= dword_18C463ADC;
    v37.attrgroup_t forkattr = v17;
    int v18 = 1;
  }

  if (BYTE3(v39) && (*(_BYTE *)_FileCacheGetAttributes(a2) & 0x80) == 0)
  {
    v14 |= dword_18C463A9C;
    v13 |= unk_18C463AA0;
    v16 |= dword_18C463AA4;
    v37.attrgroup_t commonattr = v14;
    v37.volattr = v13;
    v15 |= unk_18C463AA8;
    v37.attrgroup_t dirattr = v16;
    v37.attrgroup_t fileattr = v15;
    v17 |= dword_18C463AAC;
    v37.attrgroup_t forkattr = v17;
    int v18 = 1;
  }

  if (BYTE2(v39)
    && (*(_DWORD *)(_FileCacheGetAttributes(a2) + 16) & 0xF000) != 0x4000
    && (*(_BYTE *)_FileCacheGetAttributes(a2) & 0x20) == 0)
  {
    v14 |= dword_18C463A84;
    v13 |= unk_18C463A88;
    v16 |= dword_18C463A8C;
    v37.attrgroup_t commonattr = v14;
    v37.volattr = v13;
    v15 |= unk_18C463A90;
    v37.attrgroup_t dirattr = v16;
    v37.attrgroup_t fileattr = v15;
    v17 |= dword_18C463A94;
    v37.attrgroup_t forkattr = v17;
    int v18 = 1;
  }

  if (BYTE1(v39) && (*(_BYTE *)_FileCacheGetAttributes(a2) & 0x10) == 0)
  {
    v14 |= dword_18C463A6C;
    v13 |= unk_18C463A70;
    v16 |= dword_18C463A74;
    v37.attrgroup_t commonattr = v14;
    v37.volattr = v13;
    v15 |= unk_18C463A78;
    v37.attrgroup_t dirattr = v16;
    v37.attrgroup_t fileattr = v15;
    v17 |= dword_18C463A7C;
    v37.attrgroup_t forkattr = v17;
    int v18 = 1;
  }

  if (!(_BYTE)v39 || (*(_BYTE *)_FileCacheGetAttributes(a2) & 8) != 0)
  {
    if (!v18 && (!v38 || (*(_BYTE *)_FileCacheGetAttributes(a2) & 1) != 0))
    {
      uint64_t v28 = 1LL;
      goto LABEL_50;
    }
  }

  else
  {
    v14 |= dword_18C463A54;
    v13 |= unk_18C463A58;
    v16 |= dword_18C463A5C;
    v15 |= unk_18C463A60;
    v17 |= dword_18C463A64;
  }

  v37.attrgroup_t commonattr = v14 | dword_18C463A3C;
  v37.volattr = v13 | xmmword_18C463A40;
  v37.attrgroup_t dirattr = v16 | DWORD1(xmmword_18C463A40);
  v37.attrgroup_t fileattr = v15 | DWORD2(xmmword_18C463A40);
  v37.attrgroup_t forkattr = v17 | HIDWORD(xmmword_18C463A40);
  _FileCacheUnlock(a2);
  if (!CFURLGetFileSystemRepresentation((CFURLRef)a1, 1u, (UInt8 *)&v38, 1024LL))
  {
    if (a7)
    {
      uint64_t v29 = CFGetAllocator(a1);
      *a7 = _FSURLCreateStandardError(v29, (const __CFString *)*MEMORY[0x189604F40], 258LL, 0, a1, 0LL);
    }

    _FileCacheLock(a2);
    goto LABEL_39;
  }

  v37.commonattr |= 0x80000000;
  size_t v19 = calculateAttributeBufferSize(&v37, 0LL);
  MEMORY[0x1895F8858](v19);
  UniChar v21 = (char *)&v37 - v20;
  uint64_t v22 = filtered_getattrlist(&v38, &v37, (char *)&v37 - v20, v19, 0x25u);
  if ((_DWORD)v22)
  {
    _FileCacheLock(a2);
    goto LABEL_33;
  }

  if (v19 >= *(unsigned int *)v21)
  {
    _FileCacheLock(a2);
    goto LABEL_47;
  }

  MEMORY[0x1895F8858](v22);
  UniChar v21 = (char *)&v37 - ((v30 + 15) & 0x1FFFFFFF0LL);
  int v31 = filtered_getattrlist(&v38, &v37, v21, v30, 0x21u);
  _FileCacheLock(a2);
  if (!v31)
  {
LABEL_47:
    UniChar v32 = CFGetAllocator(a1);
    uint64_t Attributes = _FileCacheGetAttributes(a2);
    uint64_t v28 = 1LL;
    unsigned int v34 = parseAttributeBuffer(v32, &v38, &v37, v21, 0LL, Attributes, 1);
    if (!v34) {
      goto LABEL_50;
    }
    if (a7)
    {
      unsigned int v35 = v34;
      uint64_t v25 = CFGetAllocator(a1);
      CFRange v26 = (const __CFString *)*MEMORY[0x189604F50];
      uint64_t v27 = v35;
      goto LABEL_35;
    }

uint64_t corePropertyProviderCopyAndCacheValues( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6 < 1)
  {
LABEL_19:
    _FileCacheUnlock(a2);
    return 1LL;
  }

  uint64_t v11 = 0LL;
  uint64_t v12 = (const void *)*MEMORY[0x189605298];
  attrgroup_t v13 = (const void *)*MEMORY[0x189605448];
  while (1)
  {
    CFTypeRef cf = 0LL;
    uint64_t v14 = *(void *)(a5 + 8 * v11);
    if ((*(_BYTE *)(v14 + 8) & 2) == 0
      || !_FileCacheGetPropertyValueForKey(a2, *(const void **)v14, (void **)&cf))
    {
      break;
    }

    if (cf) {
      CFRetain(cf);
    }
LABEL_18:
    *(void *)(a4 + 8 * v11++) = cf;
    if (a6 == v11) {
      goto LABEL_19;
    }
  }

  attrgroup_t v15 = *(uint64_t (**)(uint64_t, uint64_t, CFTypeRef *))(v14 + 24);
  if (v15)
  {
    uint64_t Attributes = _FileCacheGetAttributes(a2);
    int v17 = v15(a1, Attributes, &cf);
    if (v17 == 2) {
      _FileCacheSetPropertyValueForKey(a2, *(const void **)v14, cf);
    }
    if (cf
      && *(void *)(v14 + 16) == 7LL
      && CFEqual(*(CFTypeRef *)v14, v12)
      && _FileCacheGetPropertyValueForKey(a2, v13, (void **)&v22)
      && cf != v22
      && CFEqual(cf, v22))
    {
      uint64_t v18 = _FileCacheGetAttributes(a2);
      _FileCacheSetPropertyValueForKey(a2, v13, *(const void **)(v18 + 232));
    }

    if (v17) {
      goto LABEL_18;
    }
  }

  _FileCacheUnlock(a2);
  uint64_t v20 = 0LL;
  do
  {
    UniChar v21 = *(const void **)(a4 + 8 * v20);
    if (v21)
    {
      CFRelease(v21);
      *(void *)(a4 + 8 * v20) = 0LL;
    }

    ++v20;
  }

  while (v11 + 1 != v20);
  return 0LL;
}

BOOL corePropertyProviderSetValues( const __CFString *a1, uint64_t a2, CFTypeRef *a3, const void **a4, uint64_t a5, uint64_t a6, uint64_t a7, CFErrorRef *a8)
{
  uint64_t v225 = *MEMORY[0x1895F89C0];
  uint64_t Attributes = _FileCacheGetAttributes(a2);
  *(_OWORD *)&v222.bitmapcount = xmmword_182EA5308;
  *(void *)&v222.attrgroup_t fileattr = 0LL;
  *(_OWORD *)&v221.bitmapcount = xmmword_182EA5308;
  *(void *)&v221.attrgroup_t fileattr = 0LL;
  acl_t v220 = 0LL;
  __int128 v218 = 0u;
  __int128 v219 = 0u;
  uint64_t v217 = 0LL;
  uint64_t v15 = MountInfoStorageSize();
  attrgroup_t v16 = (char *)&v157 - ((MEMORY[0x1895F8858](v15) + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!CFURLGetFileSystemRepresentation((CFURLRef)a1, 1u, (UInt8 *)v224, 1024LL))
  {
    if (!a8) {
      return 0LL;
    }
    uint64_t v29 = CFGetAllocator(a1);
    CFErrorRef v30 = _FSURLCreateStandardError(v29, (const __CFString *)*MEMORY[0x189604F40], 4LL, 1, a1, 0LL);
    BOOL v31 = 0LL;
    *a8 = v30;
    return v31;
  }

  uint64_t v200 = Attributes;
  v181 = v16;
  uint64_t v179 = a2;
  CFURLRef v191 = a1;
  CFURLRef v198 = a8;
  v189 = &v157;
  uint64_t v184 = a6;
  if (a6 >= 1)
  {
    uint64_t v18 = 0LL;
    size_t v19 = 0LL;
    v209 = 0LL;
    CFTypeID v210 = 0LL;
    v190 = 0LL;
    v192 = 0LL;
    v193 = 0LL;
    CFDataRef v213 = 0LL;
    CFTypeID v214 = 0LL;
    v215 = 0LL;
    int v185 = 0;
    BOOL v182 = 0;
    CFFileSecurityRef v207 = 0LL;
    v208 = 0LL;
    v205 = 0LL;
    CFNumberRef v206 = 0LL;
    v194 = 0LL;
    v195 = 0LL;
    CFTypeID v196 = 0LL;
    v197 = 0LL;
    CFIndex v203 = 0LL;
    v204 = 0LL;
    CFTypeID v201 = 0LL;
    v202 = 0LL;
    v199 = 0LL;
    uint64_t v212 = 0LL;
    uint64_t v20 = (const void *)*MEMORY[0x189605438];
    UniChar v21 = (const void *)*MEMORY[0x1896052B0];
    CFTypeRef v211 = (CFTypeRef)*MEMORY[0x1896052A8];
    CFTypeRef v188 = (CFTypeRef)*MEMORY[0x1896052A0];
    *(void *)&__int128 v17 = 138412546LL;
    __int128 v165 = v17;
    CFTypeRef v187 = (CFTypeRef)*MEMORY[0x189605260];
    CFTypeRef v186 = (CFTypeRef)*MEMORY[0x189604C20];
    CFTypeRef v183 = (CFTypeRef)*MEMORY[0x189605390];
    CFTypeRef v180 = (CFTypeRef)*MEMORY[0x189605368];
    CFTypeRef v178 = (CFTypeRef)*MEMORY[0x189605360];
    CFTypeRef v177 = (CFTypeRef)*MEMORY[0x189605400];
    CFTypeRef v176 = (CFTypeRef)*MEMORY[0x189604CA8];
    CFTypeRef v175 = (CFTypeRef)*MEMORY[0x1896053E0];
    CFTypeRef v174 = (CFTypeRef)*MEMORY[0x189604C98];
    CFTypeRef v173 = (CFTypeRef)*MEMORY[0x189604CB0];
    CFTypeRef v172 = (CFTypeRef)*MEMORY[0x189604C48];
    CFTypeRef v171 = (CFTypeRef)*MEMORY[0x189604CB8];
    CFTypeRef v170 = (CFTypeRef)*MEMORY[0x189604CA0];
    CFTypeRef v169 = (CFTypeRef)*MEMORY[0x189604C78];
    CFTypeRef v168 = (CFTypeRef)*MEMORY[0x1896053D0];
    CFTypeRef v167 = (CFTypeRef)*MEMORY[0x189604C70];
    CFTypeRef v166 = (CFTypeRef)*MEMORY[0x189604C68];
    CFTypeRef v164 = (CFTypeRef)*MEMORY[0x189604C90];
    CFTypeRef v163 = (CFTypeRef)*MEMORY[0x189605338];
    CFTypeRef v162 = (CFTypeRef)*MEMORY[0x189605300];
    CFTypeRef v161 = (CFTypeRef)*MEMORY[0x189605308];
    CFTypeRef v160 = (CFTypeRef)*MEMORY[0x1896052E8];
    CFTypeRef v159 = (CFTypeRef)*MEMORY[0x1896052F0];
    CFTypeRef v158 = (CFTypeRef)*MEMORY[0x1896052F8];
    uint64_t v22 = a6;
    while (1)
    {
      CFTypeRef v23 = *a3;
      uint64_t v24 = (const __CFString *)*a4;
      if (CFEqual(*a3, v20))
      {
        uint64_t v18 = v24;
      }

      else if (CFEqual(v23, v21))
      {
        v222.commonattr |= 0x200u;
        size_t v19 = v24;
      }

      else if (CFEqual(v23, v211))
      {
        v222.commonattr |= 0x400u;
        v209 = v24;
      }

      else if (CFEqual(v23, v188))
      {
        v222.commonattr |= 0x1000u;
        v190 = v24;
      }

      else if (CFEqual(v23, v187))
      {
        v222.commonattr |= 0x10000000u;
        v192 = v24;
      }

      else if (CFEqual(v23, v186))
      {
        v222.commonattr |= 0x4000u;
        CFDataRef v213 = (CFDataRef)v24;
      }

      else if (CFEqual(v23, v183))
      {
        int v185 = valueOfBoolean((const __CFBoolean *)v24);
        if (v185) {
          BOOL v25 = (~*(_DWORD *)v200 & 0x801) != 0;
        }
        else {
          BOOL v25 = 1;
        }
        BOOL v182 = v25;
        v222.commonattr |= 0x44000u;
        v215 = v24;
      }

      else if (CFEqual(v23, v180))
      {
        v222.commonattr |= 0x4000u;
        CFTypeID v210 = (const __CFBoolean *)v24;
      }

      else if (CFEqual(v23, v178))
      {
        v222.commonattr |= 0x4000u;
        v208 = (const __CFBoolean *)v24;
      }

      else if (CFEqual(v23, v177))
      {
        v222.commonattr |= 0x4000u;
        CFNumberRef v206 = (CFNumberRef)v24;
      }

      else if (CFEqual(v23, v176))
      {
        v222.commonattr |= 0x40000u;
        v195 = (const __CFBoolean *)v24;
      }

      else if (CFEqual(v23, v175))
      {
        v222.commonattr |= 0x40000u;
        v197 = (const __CFBoolean *)v24;
      }

      else if (CFEqual(v23, v174))
      {
        v222.commonattr |= 0x40000u;
        v194 = (const __CFBoolean *)v24;
      }

      else if (CFEqual(v23, v173))
      {
        v222.commonattr |= 0x40000u;
        v193 = (const __CFBoolean *)v24;
      }

      else if (CFEqual(v23, v172))
      {
        v222.commonattr |= 0x40000u;
        CFTypeID v214 = (const __CFBoolean *)v24;
      }

      else if (CFEqual(v23, v171))
      {
        v222.commonattr |= 0x40000u;
        v205 = (const __CFBoolean *)v24;
      }

      else if (CFEqual(v23, v170))
      {
        v222.commonattr |= 0x40000u;
        v204 = (const __CFBoolean *)v24;
      }

      else if (CFEqual(v23, v169))
      {
        if (!_CFGetEUID())
        {
          v222.commonattr |= 0x40000u;
          CFIndex v203 = (const __CFBoolean *)v24;
        }
      }

      else if (CFEqual(v23, v168))
      {
        if (!_CFGetEUID())
        {
          v222.commonattr |= 0x40000u;
          v202 = (const __CFBoolean *)v24;
        }
      }

      else if (CFEqual(v23, v167))
      {
        if (!_CFGetEUID())
        {
          v222.commonattr |= 0x40000u;
          CFTypeID v201 = (const __CFBoolean *)v24;
        }
      }

      else if (CFEqual(v23, v166))
      {
        if (!_CFGetEUID())
        {
          v222.commonattr |= 0x40000u;
          v199 = (const __CFBoolean *)v24;
        }
      }

      else if (CFEqual(v23, v164))
      {
        if (!_CFGetEUID())
        {
          v222.commonattr |= 0x40000u;
          CFTypeID v196 = (const __CFBoolean *)v24;
        }
      }

      else if (CFEqual(v23, v163))
      {
        v222.commonattr |= 0x1C38000u;
        CFFileSecurityRef v207 = (CFFileSecurityRef)v24;
      }

      else if (CFEqual(v23, v162))
      {
        if (CFEqual(v24, v161))
        {
          uint64_t v26 = 4LL;
        }

        else if (CFEqual(v24, v160))
        {
          uint64_t v26 = 1LL;
        }

        else if (CFEqual(v24, v159))
        {
          uint64_t v26 = 2LL;
        }

        else
        {
          if (!CFEqual(v24, v158))
          {
            uint64_t v27 = (os_log_s *)defaultLog;
            BOOL v28 = os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT);
            uint64_t v212 = 0LL;
            if (v28)
            {
              *(_DWORD *)CFIndex v223 = v165;
              *(void *)&v223[4] = v24;
              *(_WORD *)&v223[12] = 2112;
              *(void *)&v223[14] = v191;
              _os_log_impl( &dword_182E77000,  v27,  OS_LOG_TYPE_DEFAULT,  "ignoring unsupported value: kCFURLFileProtectionKey=%@ for %@",  v223,  0x16u);
              uint64_t v212 = 0LL;
            }

            goto LABEL_23;
          }

          uint64_t v26 = 3LL;
        }

        uint64_t v212 = v26;
      }

LABEL_99:
  if ((_DWORD)v212) {
    v221.commonattr |= 0xC0000008;
  }
  unint64_t v33 = (unint64_t)v207;
LABEL_102:
  unint64_t v41 = (unint64_t)v215 | (unint64_t)v195 | (unint64_t)v197 | (unint64_t)v194 | (unint64_t)v193;
  LODWORD(v186) = v41 != 0;
  if (v41 || v214 || v205 || v37 || v36 || v35 || v34 || v199 || v196)
  {
    v221.commonattr |= 0x8004000C;
    if (v18)
    {
LABEL_112:
      uint64_t v42 = (unsigned int *)v200;
      if ((*(_DWORD *)v200 & 1) != 0)
      {
        LODWORD(v187) = (*(_DWORD *)v200 >> 13) & 1;
      }

      else
      {
        LODWORD(v187) = 0;
        v221.dirattr |= 4u;
      }

      goto LABEL_117;
    }
  }

  else if (v18)
  {
    goto LABEL_112;
  }

  LODWORD(v187) = 0;
  uint64_t v42 = (unsigned int *)v200;
LABEL_117:
  unint64_t v43 = (unint64_t)v215 | (unint64_t)v214 | v33;
  BOOL v44 = v43 != 0;
  if (v43)
  {
    unsigned int v45 = *v42;
    if ((*v42 & 1) != 0)
    {
      uint64_t v200 = (v45 >> 17) & 1;
      LODWORD(v47) = (v45 >> 19) & 1;
      uint64_t v46 = (const void *)((v45 >> 21) & 1);
    }

    else
    {
      uint64_t v46 = 0LL;
      LODWORD(v47) = 0;
      uint64_t v200 = 0LL;
      v221.commonattr |= 0x80000004;
    }
  }

  else
  {
    uint64_t v46 = 0LL;
    LODWORD(v47) = 0;
    uint64_t v200 = 0LL;
  }

  CFTypeRef v183 = v46;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32(vtstq_s32(*(int32x4_t *)&v221.commonattr, *(int32x4_t *)&v221.commonattr))) & 1) == 0
    && !v221.forkattr)
  {
    LODWORD(v188) = 0;
    int v48 = 0;
    BOOL v31 = 1LL;
    uint64_t v49 = v198;
    goto LABEL_149;
  }

  unint64_t v50 = calculateAttributeBufferSize(&v221, 0LL);
  MEMORY[0x1895F8858](v50);
  CFIndex v52 = (char *)&v157 - v51;
  int v54 = filtered_getattrlist(v224, &v221, (char *)&v157 - v51, v53, 0x21u);
  BOOL v31 = v54 == 0;
  if (v54)
  {
    uint64_t v49 = v198;
    if (v198)
    {
      CFRange v56 = v191;
      uint64_t v57 = CFGetAllocator(v191);
      int v58 = (const __CFString *)*MEMORY[0x189604F58];
      int v59 = __error();
      CFErrorRef v60 = _FSURLCreateStandardError(v57, v58, *v59, 1, v56, 0LL);
      LODWORD(v188) = 0;
      int v48 = 0;
      CFErrorRef *v49 = v60;
    }

    else
    {
      LODWORD(v188) = 0;
      int v48 = 0;
    }

    goto LABEL_149;
  }

  int v61 = *((_DWORD *)v52 + 1);
  if ((v61 & 4) != 0)
  {
    int v32 = *((_DWORD *)v52 + 6);
    uint64_t v62 = v52 + 32;
    if ((v61 & 8) == 0) {
      goto LABEL_134;
    }
    goto LABEL_133;
  }

  uint64_t v62 = v52 + 24;
  if ((v61 & 8) != 0)
  {
LABEL_133:
    int v63 = *(_DWORD *)v62;
    v62 += 4;
    LODWORD(v211) = v63;
  }

LABEL_134:
  if ((v61 & 0x4000) == 0)
  {
    if ((v61 & 0x40000) == 0) {
      goto LABEL_136;
    }
LABEL_142:
    int v67 = *(_DWORD *)v62;
    v62 += 4;
    LODWORD(v188) = v67;
    if ((v61 & 0x40000000) != 0) {
      goto LABEL_137;
    }
LABEL_143:
    int v48 = 0;
    goto LABEL_144;
  }

  __int128 v65 = *((_OWORD *)v62 + 1);
  __int128 v218 = *(_OWORD *)v62;
  v66.i32[1] = DWORD1(v218);
  __int128 v219 = v65;
  v66.i32[0] = 2;
  v55.i32[0] = (int)v211;
  *(int8x8_t *)&__int128 v218 = vbsl_s8( (int8x8_t)vdup_lane_s32(vceq_s32(v55, v66), 0),  vrev16_s8(*(int8x8_t *)&v218),  vrev32_s8(*(int8x8_t *)&v218));
  *((int8x8_t *)&v218 + 1) = vrev16_s8(*(int8x8_t *)((char *)&v218 + 8));
  if ((_DWORD)v211 == 2)
  {
    WORD1(v219) = bswap32(WORD1(v219)) >> 16;
    LOWORD(v219) = bswap32((unsigned __int16)v219) >> 16;
    DWORD1(v219) = bswap32(DWORD1(v219));
  }

  else
  {
    *(int8x8_t *)&__int128 v219 = vrev16_s8(*(int8x8_t *)&v219);
  }

  WORD4(v219) = bswap32(WORD4(v219)) >> 16;
  WORD5(v219) = bswap32(WORD5(v219)) >> 16;
  HIDWORD(v219) = bswap32(HIDWORD(v219));
  v62 += 32;
  if ((v61 & 0x40000) != 0) {
    goto LABEL_142;
  }
LABEL_136:
  LODWORD(v188) = 0;
  if ((v61 & 0x40000000) == 0) {
    goto LABEL_143;
  }
LABEL_137:
  int v64 = *(_DWORD *)v62;
  v62 += 4;
  int v48 = v64;
LABEL_144:
  if ((v52[12] & 4) != 0) {
    LODWORD(v187) = *(_DWORD *)v62 & 1;
  }
  uint64_t v49 = v198;
  if (v44 && MountInfoPrepare(&v217, (int)v180, v32, v181, 0LL, 0LL, 0LL))
  {
    unint64_t Capabilities = MountInfoGetCapabilities(v217);
    uint64_t v200 = (Capabilities >> 47) & 1;
    uint64_t v47 = (Capabilities >> 59) & 1;
    CFTypeRef v183 = (CFTypeRef)((Capabilities >> 58) & 1);
  }

LABEL_149:
  uint64_t v69 = v191;
  uint64_t v70 = v192;
  uint64_t v71 = 0LL;
  if (v214 && (_DWORD)v47)
  {
    v222.commonattr |= 0x40000u;
    uint64_t v71 = v214;
  }

  uint64_t v72 = v207;
  if (v207 && (_DWORD)v200 && !CFFileSecurityCopyAccessControlList(v207, &v220)) {
    acl_t v220 = 0LL;
  }
  if (v31 && v222.commonattr)
  {
    LODWORD(v192) = v48;
    if (v220) {
      ssize_t v73 = acl_size(v220);
    }
    else {
      ssize_t v73 = 0LL;
    }
    unint64_t v74 = calculateAttributeBufferSize(&v222, v73);
    CFTypeID v214 = (const __CFBoolean *)&v157;
    MEMORY[0x1895F8858](v74);
    uint64_t v76 = (int8x8_t *)((char *)&v157 - v75);
    v222.attrgroup_t commonattr = 0;
    int v77 = (int8x8_t *)((char *)&v157 - v75);
    if (v19)
    {
      if (CFEqual(v19, (CFTypeRef)*MEMORY[0x189605018]))
      {
        *uint64_t v76 = 0LL;
        v76[1] = 0LL;
      }

      else
      {
        double v78 = MEMORY[0x186E19B18](v19);
        *(void *)CFIndex v223 = 0LL;
        double v79 = modf(v78, (double *)v223);
        double v80 = *(double *)v223;
        if (v79 < 0.0)
        {
          double v80 = *(double *)v223 + -1.0;
          double v79 = v79 + 1.0;
        }

        *uint64_t v76 = (int8x8_t)(uint64_t)(v80 + *MEMORY[0x189604DA8]);
        v76[1] = (int8x8_t)(uint64_t)(v79 * 1000000000.0 + 0.5);
      }

      int v77 = v76 + 2;
      v222.commonattr |= 0x200u;
    }

    size_t v81 = v74;
    if (v209)
    {
      unsigned int v82 = v70;
      CFRange v83 = v69;
      uint64_t v84 = v209;
      if (CFEqual(v209, (CFTypeRef)*MEMORY[0x189605018]))
      {
        *int v77 = 0LL;
        v77[1] = 0LL;
      }

      else
      {
        double v86 = MEMORY[0x186E19B18](v84);
        *(void *)CFIndex v223 = 0LL;
        double v87 = modf(v86, (double *)v223);
        double v88 = *(double *)v223;
        if (v87 < 0.0)
        {
          double v88 = *(double *)v223 + -1.0;
          double v87 = v87 + 1.0;
        }

        *int v77 = (int8x8_t)(uint64_t)(v88 + *MEMORY[0x189604DA8]);
        v77[1] = (int8x8_t)(uint64_t)(v87 * 1000000000.0 + 0.5);
      }

      uint64_t v85 = v190;
      v77 += 2;
      v222.commonattr |= 0x400u;
      uint64_t v69 = v83;
      if (!v190)
      {
LABEL_183:
        uint64_t v94 = v82;
        if (v213 || v215 || v210 || v208 || v206)
        {
          *(_OWORD *)CFIndex v223 = v218;
          *(_OWORD *)&v223[16] = v219;
          size_t v95 = v81;
          if (v215 && v182) {
            WORD4(v218) = WORD4(v218) & 0xBFFF | ((v185 != 0) << 14);
          }
          char v96 = (char)v186;
          if (v210 && (_DWORD)v211 == 1)
          {
            BOOL v97 = valueOfBoolean(v210) != 0;
            WORD4(v218) = WORD4(v218) & 0x7FFF | (v97 << 15);
          }

          if (v208)
          {
            __int16 v98 = valueOfBoolean(v208) != 0;
            WORD4(v218) = WORD4(v218) & 0xFFEF | (16 * v98);
          }

          if (v206
            && CFNumberGetValue(v206, kCFNumberSInt32Type, &v216)
            && (v216 & 0x80000000) == 0
            && (int)v216 <= 7)
          {
            WORD4(v218) = WORD4(v218) & 0xFFF1 | (2 * (_WORD)v216);
          }

          if (v213
            || (*(void *)v223 == (void)v218 ? (BOOL v99 = *(void *)&v223[8] == *((void *)&v218 + 1)) : (BOOL v99 = 0),
                v99 ? (BOOL v100 = *(void *)&v223[16] == (void)v219) : (BOOL v100 = 0),
                v100 ? (BOOL v101 = *(void *)&v223[24] == *((void *)&v219 + 1)) : (BOOL v101 = 0),
                !v101))
          {
            __int128 v102 = v219;
            *(_OWORD *)v77->i8 = v218;
            *(_OWORD *)v77[2].i8 = v102;
            if ((_DWORD)v211 == 2) {
              int8x8_t v103 = vrev16_s8(*v77);
            }
            else {
              int8x8_t v103 = vrev32_s8(*v77);
            }
            int8x8_t v104 = vrev16_s8(v77[1]);
            *int v77 = v103;
            v77[1] = v104;
            if ((_DWORD)v211 == 2)
            {
              v77[2].i16[1] = bswap32(v77[2].u16[1]) >> 16;
              v77[2].i16[0] = bswap32(v77[2].u16[0]) >> 16;
              v77[2].i32[1] = bswap32(v77[2].u32[1]);
            }

            else
            {
              v77[2] = vrev16_s8(v77[2]);
            }

            v77[3].i16[0] = bswap32(v77[3].u16[0]) >> 16;
            v77[3].i16[1] = bswap32(v77[3].u16[1]) >> 16;
            v77[3].i32[1] = bswap32(v77[3].u32[1]);
            v77 += 4;
            v222.commonattr |= 0x4000u;
          }
        }

        else
        {
          size_t v95 = v81;
          char v96 = (char)v186;
        }

        if (v72)
        {
          if (CFFileSecurityGetOwner(v72, (uid_t *)v77))
          {
            int v77 = (int8x8_t *)((char *)v77 + 4);
            v222.commonattr |= 0x8000u;
          }

          if (CFFileSecurityGetGroup(v72, (gid_t *)v77))
          {
            int v77 = (int8x8_t *)((char *)v77 + 4);
            v222.commonattr |= 0x10000u;
          }

          if (CFFileSecurityGetMode(v72, (mode_t *)v223))
          {
            v77->i32[0] = *(unsigned __int16 *)v223;
            int v77 = (int8x8_t *)((char *)v77 + 4);
            v222.commonattr |= 0x20000u;
          }
        }

        if (v71) {
          char v105 = 1;
        }
        else {
          char v105 = v96;
        }
        if ((v105 & 1) == 0 && !v205 && !v204 && !v203 && !v202 && !v201 && !v199 && !v196)
        {
LABEL_295:
          if (v72)
          {
            if (v220)
            {
              BOOL v109 = (CFUUIDBytes *)&v77[1];
              v222.commonattr |= 0x400000u;
            }

            else
            {
              BOOL v109 = (CFUUIDBytes *)v77;
              int v77 = 0LL;
            }

            if ((_DWORD)v200)
            {
              if (CFFileSecurityCopyOwnerUUID(v72, (CFUUIDRef *)v223))
              {
                *v109++ = CFUUIDGetUUIDBytes(*(CFUUIDRef *)v223);
                CFRelease(*(CFTypeRef *)v223);
                v222.commonattr |= 0x800000u;
              }

              if (CFFileSecurityCopyGroupUUID(v72, (CFUUIDRef *)v223))
              {
                *v109++ = CFUUIDGetUUIDBytes(*(CFUUIDRef *)v223);
                CFRelease(*(CFTypeRef *)v223);
                v222.commonattr |= 0x1000000u;
              }
            }

            if (v77)
            {
              ssize_t v110 = acl_size(v220);
              bzero(v109, v110);
              v77->i32[0] = (_DWORD)v109 - (_DWORD)v77;
              __int128 v111 = v220;
              ssize_t v112 = acl_size(v220);
              ssize_t v113 = acl_copy_ext_native(v109, v111, v112);
              v77->i32[1] = v113;
              int v77 = (int8x8_t *)(&v109->byte0 + v113);
              if (!v94)
              {
LABEL_316:
                int v117 = setattrlist(v224, &v222, v76, v95, 1u);
                BOOL v31 = v117 == 0;
                uint64_t v49 = v198;
                if (v198 && v117)
                {
                  uint64_t v118 = CFGetAllocator(v69);
                  uint64_t v119 = (const __CFString *)*MEMORY[0x189604F58];
                  uint64_t v120 = __error();
                  CFErrorRef *v49 = _FSURLCreateStandardError(v118, v119, *v120, 1, v69, 0LL);
                }

                int v48 = (int)v192;
                goto LABEL_320;
              }
            }

            else
            {
              int v77 = (int8x8_t *)v109;
              if (!v94) {
                goto LABEL_316;
              }
            }
          }

          else if (!v94)
          {
            goto LABEL_316;
          }

          if (CFEqual(v94, (CFTypeRef)*MEMORY[0x189605018]))
          {
            *int v77 = 0LL;
            v77[1] = 0LL;
          }

          else
          {
            double v114 = MEMORY[0x186E19B18](v94);
            *(void *)CFIndex v223 = 0LL;
            double v115 = modf(v114, (double *)v223);
            double v116 = *(double *)v223;
            if (v115 < 0.0)
            {
              double v116 = *(double *)v223 + -1.0;
              double v115 = v115 + 1.0;
            }

            *int v77 = (int8x8_t)(uint64_t)(v116 + *MEMORY[0x189604DA8]);
            v77[1] = (int8x8_t)(uint64_t)(v115 * 1000000000.0 + 0.5);
          }

          v222.commonattr |= 0x10000000u;
          goto LABEL_316;
        }

        unsigned int v106 = v188;
        uint64_t v107 = v197;
        if (v215)
        {
          unsigned int v106 = v188;
          if ((_DWORD)v183)
          {
            if (!v185)
            {
              unsigned int v106 = v188 & 0xFFFF7FFF;
              if (!v195) {
                goto LABEL_247;
              }
              goto LABEL_243;
            }

            unsigned int v106 = v188 | 0x8000;
          }
        }

        if (!v195) {
          goto LABEL_247;
        }
LABEL_243:
        else {
          v106 &= ~1u;
        }
        uint64_t v107 = v197;
LABEL_247:
        if (v107)
        {
          else {
            v106 &= ~2u;
          }
        }

        if (v194)
        {
          else {
            v106 &= ~4u;
          }
        }

        if (v193)
        {
          if (!valueOfBoolean(v193))
          {
            v106 &= ~8u;
            if (!v71) {
              goto LABEL_264;
            }
            goto LABEL_259;
          }

          v106 |= 8u;
        }

        if (!v71) {
          goto LABEL_264;
        }
LABEL_259:
        else {
          v106 &= ~0x20u;
        }
LABEL_264:
        uint64_t v108 = v196;
        if (v205)
        {
          else {
            v106 &= ~0x40u;
          }
        }

        if (v204)
        {
          else {
            v106 &= ~0x80u;
          }
        }

        if (v203)
        {
          else {
            v106 &= ~0x10000u;
          }
        }

        if (v202)
        {
          else {
            v106 &= ~0x20000u;
          }
        }

        if (v201)
        {
          else {
            v106 &= ~0x40000u;
          }
        }

        if (v199)
        {
          if (!valueOfBoolean(v199))
          {
            v106 &= ~0x80000u;
            if (!v108) {
              goto LABEL_293;
            }
            goto LABEL_288;
          }

          v106 |= 0x80000u;
        }

        if (!v108) {
          goto LABEL_293;
        }
LABEL_288:
        else {
          v106 &= ~0x100000u;
        }
LABEL_293:
        if (v106 != (_DWORD)v188)
        {
          v77->i32[0] = v106;
          int v77 = (int8x8_t *)((char *)v77 + 4);
          v222.commonattr |= 0x40000u;
        }

        goto LABEL_295;
      }
    }

    else
    {
      unsigned int v82 = v70;
      uint64_t v85 = v190;
      if (!v190) {
        goto LABEL_183;
      }
    }

    uint64_t v89 = v69;
    uint64_t v90 = v85;
    if (CFEqual(v85, (CFTypeRef)*MEMORY[0x189605018]))
    {
      *int v77 = 0LL;
      v77[1] = 0LL;
    }

    else
    {
      double v91 = MEMORY[0x186E19B18](v90);
      *(void *)CFIndex v223 = 0LL;
      double v92 = modf(v91, (double *)v223);
      double v93 = *(double *)v223;
      if (v92 < 0.0)
      {
        double v93 = *(double *)v223 + -1.0;
        double v92 = v92 + 1.0;
      }

      *int v77 = (int8x8_t)(uint64_t)(v93 + *MEMORY[0x189604DA8]);
      v77[1] = (int8x8_t)(uint64_t)(v92 * 1000000000.0 + 0.5);
    }

    v77 += 2;
    v222.commonattr |= 0x1000u;
    uint64_t v69 = v89;
    goto LABEL_183;
  }

LABEL_320:
  if (v31 && (_DWORD)v212 && (_DWORD)v212 != v48 && ((_DWORD)v211 - 1) <= 1)
  {
    if ((_DWORD)v211 == 1)
    {
      int v121 = open(v224, 1);
      uint64_t v122 = 0LL;
      if (v121 < 0)
      {
LABEL_334:
        int v127 = 0;
        goto LABEL_340;
      }
    }

    else
    {
      uint64_t v123 = opendir(v224);
      if (!v123) {
        goto LABEL_334;
      }
      uint64_t v122 = v123;
      int v121 = dirfd(v123);
      if (v121 < 0) {
        goto LABEL_334;
      }
    }

    CFRange v124 = (const __CFString *)*MEMORY[0x1896055F8];
    int v125 = (const void *)__CFURLResourceInfoPtr();
    if (_FSURLCopyResourcePropertyForKeyInternal( (const __CFURL *)v69,  v124,  (void **)&v216,  v125,  0LL,  1))
    {
      if (v216 == (_BYTE *)*MEMORY[0x189604DE8] && fcntl(v121, 64, v212) == -1)
      {
        CFStringRef v126 = (os_log_s *)defaultLog;
        int v127 = 0;
        if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT))
        {
          int v128 = *__error();
          *(_DWORD *)CFIndex v223 = 138412546;
          *(void *)&v223[4] = v69;
          *(_WORD *)&v223[12] = 1024;
          *(_DWORD *)&v223[14] = v128;
          _os_log_impl( &dword_182E77000,  v126,  OS_LOG_TYPE_DEFAULT,  "%@: error setting protection class: %{errno}d",  v223,  0x12u);
          int v127 = 0;
        }

        goto LABEL_337;
      }
    }

    else
    {
      fcntl(v121, 64, v212);
    }

    int v127 = 1;
LABEL_337:
    if (v122) {
      closedir(v122);
    }
    else {
      close(v121);
    }
LABEL_340:
    if (v184 == 1 && !v127)
    {
      if (v49)
      {
        v129 = CFGetAllocator(v69);
        BOOL v31 = 0LL;
        CFErrorRef *v49 = _FSURLCreateStandardError(v129, (const __CFString *)*MEMORY[0x189604F40], 513LL, 1, v69, 0LL);
      }

      else
      {
        BOOL v31 = 0LL;
      }

      goto LABEL_384;
    }
  }

  if (!v18 || !v31) {
    goto LABEL_384;
  }
  if ((_DWORD)v187)
  {
    if (v49)
    {
      v130 = CFGetAllocator(v69);
      BOOL v31 = 0LL;
      CFErrorRef *v49 = _FSURLCreateStandardError(v130, (const __CFString *)*MEMORY[0x189604F58], 45LL, 1, v69, 0LL);
      goto LABEL_384;
    }

    goto LABEL_380;
  }

  size_t v131 = strlcpy(v223, v224, 0x400uLL);
  if (!v131)
  {
LABEL_377:
    if (v49)
    {
      CFURLRef v140 = CFGetAllocator(v69);
      CFRange v141 = (const __CFString *)*MEMORY[0x189604F40];
      uint64_t v142 = 4LL;
      int v143 = 0;
LABEL_379:
      CFErrorRef *v49 = _FSURLCreateStandardError(v140, v141, v142, v143, v69, 0LL);
    }

LABEL_380:
    BOOL v31 = 0LL;
    goto LABEL_384;
  }

  int v132 = 0;
  v133 = &v223[v131];
  do
  {
    if (v133 - 1 <= v223) {
      goto LABEL_377;
    }
    v134 = &v133[-(*(v133 - 1) == 0) - 1];
    if (v134 > v223)
    {
      while (*v134 == 47)
      {
        if (--v134 <= v223)
        {
          v134 = v223;
          break;
        }
      }
    }

    if (v134 == v223) {
      goto LABEL_377;
    }
    CFTypeRef v135 = v134;
    if (v134 > v223)
    {
      CFTypeRef v135 = v134;
      while (*v135 != 47)
      {
        if (--v135 <= v223)
        {
          CFTypeRef v135 = v223;
          break;
        }
      }
    }

    int v136 = v134 + 1;
    if (*v135 == 47) {
      v133 = v135 + 1;
    }
    else {
      v133 = v135;
    }
    uint64_t v137 = v136 - v133;
    if (v137 == 1)
    {
      if (*v133 == 46) {
        continue;
      }
    }

    else if (v137 == 2 && *v133 == 46 && v133[1] == 46)
    {
      ++v132;
      continue;
    }

    --v132;
  }

  while (v132 != -1);
  v227.CFIndex length = CFStringGetLength(v18);
  v227.CFIndex location = 0LL;
  CFIndex Bytes = CFStringGetBytes( v18,  v227,  0x8000100u,  0,  0,  v133,  (CFIndex)&v223[~(unint64_t)v133 + 1024],  (CFIndex *)&v216);
  if (Bytes != CFStringGetLength(v18)) {
    goto LABEL_391;
  }
  if (v216 != (_BYTE *)2)
  {
    if (v216 == (_BYTE *)1)
    {
      int v139 = *v133;
      goto LABEL_390;
    }

    goto LABEL_393;
  }

  if (*v133 == 46)
  {
    int v139 = v133[1];
LABEL_390:
    if (v139 == 46)
    {
LABEL_391:
      if (!v49) {
        goto LABEL_380;
      }
      CFURLRef v140 = CFGetAllocator(v69);
      CFRange v141 = (const __CFString *)*MEMORY[0x189604F40];
      uint64_t v142 = 514LL;
      goto LABEL_396;
    }
  }

LABEL_393:
  v216[(void)v133] = 0;
  int v145 = rename(v224, v223);
  if (v49 && v145)
  {
    CFAllocatorRef v146 = CFGetAllocator(v69);
    uint64_t v147 = (const __CFString *)*MEMORY[0x189604F58];
    uint64_t v142 = *__error();
    CFURLRef v140 = v146;
    CFRange v141 = v147;
LABEL_396:
    int v143 = 1;
    goto LABEL_379;
  }

  if (v145) {
    goto LABEL_380;
  }
  uint64_t v148 = v179;
  if ((*(_BYTE *)_FileCacheGetAttributes(v179) & 1) != 0)
  {
    uint64_t v149 = _FileCacheGetAttributes(v148);
    uint64_t v150 = CFGetAllocator(v69);
    CFFileSecurityRef Copy = CFStringCreateCopy(v150, v18);
    CFRange v152 = *(const void **)(v149 + 8);
    if (v152) {
      CFRelease(v152);
    }
    *(void *)(v149 + 8) = Copy;
    CFIndex Length = CFStringGetLength(Copy);
    if (Length < 1) {
      int v154 = 0;
    }
    else {
      int v154 = (CFStringGetCharacterAtIndex(Copy, 0LL) == 46) << 11;
    }
    int v155 = 0;
    unsigned int v156 = *(_DWORD *)v149 & 0xFFFFF7FF | v154;
    *(_DWORD *)uint64_t v149 = v156;
    if (Length > 1 && v154)
    {
      int v155 = (CFStringGetCharacterAtIndex(Copy, 1LL) == 46) << 12;
      unsigned int v156 = *(_DWORD *)v149;
    }

    *(_DWORD *)uint64_t v149 = v156 & 0xFFFFEFFF | v155;
  }

  BOOL v31 = 1LL;
LABEL_384:
  if (v220) {
    acl_free(v220);
  }
  MountInfoDestroy(v217);
  return v31;
}

CFDataRef ___ZL21createFinderInfoValuePK7__CFURLPK15_FileAttributesPv_block_invoke()
{
  CFDataRef result = CFDataCreateWithBytesNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  zeroFinderInfoBytes,  32LL,  (CFAllocatorRef)*MEMORY[0x189604DC8]);
  createFinderInfoValue(__CFURL const*,_FileAttributes const*,void *)::zeroFinderInfoData = (uint64_t)result;
  return result;
}

uint64_t parseAttributeBuffer( CFAllocatorRef alloc, const char *a2, _DWORD *a3, _DWORD *a4, uint64_t a5, uint64_t a6, int a7)
{
  int v7 = a7;
  uint64_t v136 = a5;
  size_t v131 = a2;
  uint64_t v146 = *MEMORY[0x1895F89C0];
  uint64_t v139 = a5;
  unsigned int v10 = a3[1];
  int v11 = a3[3];
  int v12 = a3[4];
  unsigned int v13 = a3[5];
  int v135 = v11;
  if ((v10 & 0x80000000) != 0)
  {
    unsigned int v16 = a4[1];
    int v133 = a4[3];
    unsigned int v15 = a4[5];
    int v137 = a4[4];
    uint64_t v14 = 6LL;
  }

  else
  {
    uint64_t v14 = 1LL;
    unsigned int v15 = v13;
    int v137 = v12;
    int v133 = v11;
    unsigned int v16 = v10;
  }

  __int128 v17 = &a4[v14];
  if (*(_DWORD *)a6 & 1 | ((~v16 & 0x79C0D) == 0)) {
    int v18 = 3;
  }
  else {
    int v18 = 0;
  }
  unsigned int v19 = v18 | *(_DWORD *)a6 & 0xFFFFFFFC;
  *(_DWORD *)a6 = v19;
  int v20 = dword_18C463AB4 & ~v10 | dword_18C463AC4 & ~v13;
  BOOL v21 = v20 != 0;
  if (!v20)
  {
    v19 |= 4u;
    *(_DWORD *)a6 = v19;
  }

  uint64_t v22 = (UInt8 *)v17 + ((v16 >> 27) & 4);
  if ((dword_18C463AD8 & ~v12) == 0) {
    *(_DWORD *)a6 = v19 | 0x40;
  }
  if ((v10 & 1) != 0)
  {
    if ((v16 & 1) != 0)
    {
      int v23 = *((_DWORD *)v22 + 1);
      if (!v23)
      {
        syslog(3, "parseAttributeBuffer: ATTR_CMN_NAME was returned with 0 attr_length");
        return 22LL;
      }

      int v130 = v12;
      BOOL v24 = v20 != 0;
      SetNameAndHiddenFlagsFromCString(alloc, &v22[*(int *)v22], (v23 - 1), a6);
      v22 += 8;
      int v7 = a7;
      BOOL v21 = v24;
      int v12 = v130;
    }

    else
    {
      SetNameAndHiddenFlagsFromCString(alloc, (UInt8 *)"", 0LL, a6);
    }
  }

  uint64_t v26 = &v22[(2 * v16) & 4];
  if ((v10 & 4) != 0)
  {
    if ((v16 & 4) != 0)
    {
      uint64_t v28 = *(void *)v26;
      v26 += 8;
      *(void *)(a6 + 104) = v28;
      if ((v16 & 8) == 0) {
        goto LABEL_20;
      }
      goto LABEL_22;
    }

    *(void *)(a6 + 104) = 0LL;
  }

  if ((v16 & 8) == 0)
  {
LABEL_20:
    int v27 = 0;
    goto LABEL_23;
  }

LABEL_22:
  int v29 = *(_DWORD *)v26;
  v26 += 4;
  int v27 = v29;
LABEL_23:
  CFErrorRef v30 = (uint64_t *)&v26[((v16 >> 4) & 8)
                      + ((v16 >> 2) & 4)
                      + (unint64_t)((v16 >> 2) & 8)
                      + ((v16 >> 3) & 8)
                      + ((v16 >> 6) & 4)];
  if ((v10 & 0x200) != 0)
  {
    if ((v16 & 0x200) != 0)
    {
      uint64_t v32 = *v30;
      uint64_t v33 = v30[1];
      v30 += 2;
      double v31 = (double)v32 - *MEMORY[0x189604DA8] + (double)v33 * 0.000000001;
    }

    else
    {
      double v31 = -1.0 - *MEMORY[0x189604DA0];
    }

    *(double *)(a6 + 80) = v31;
    if ((v10 & 0x400) == 0)
    {
LABEL_25:
      if ((v10 & 0x800) == 0) {
        goto LABEL_26;
      }
      goto LABEL_36;
    }
  }

  else if ((v10 & 0x400) == 0)
  {
    goto LABEL_25;
  }

  if ((v16 & 0x400) != 0)
  {
    uint64_t v35 = *v30;
    uint64_t v36 = v30[1];
    v30 += 2;
    double v34 = (double)v35 - *MEMORY[0x189604DA8] + (double)v36 * 0.000000001;
  }

  else
  {
    double v34 = -*MEMORY[0x189604DA8];
  }

  *(double *)(a6 + 64) = v34;
  if ((v10 & 0x800) == 0)
  {
LABEL_26:
    if ((v10 & 0x1000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_40;
  }

      unsigned int v15 = (__CFError *)CFRetain(v13);
      *a5 = v15;
      if (!v15) {
        goto LABEL_25;
      }
    }

    return 3LL;
  }

  *a3 = 0LL;
  *(void *)(a1 + 104) = 0LL;
  uint64_t v14 = *(const void **)(a1 + 112);
  if (v14)
  {
    CFRelease(v14);
    *(void *)(a1 + 112) = 0LL;
  }

  if (!*(void *)(a1 + 72)) {
    _InitalizeVolumeEnumerator(a1);
  }
  if (*(_BYTE *)(a1 + 120) || !*(void *)(a1 + 72)) {
    goto LABEL_20;
  }
  BOOL v25 = *(void *)(a1 + 88);
  if (v25 < *(void *)(a1 + 80))
  {
    *(void *)(a1 + 56) = *(void *)(a1 + 8 * v25 + 168);
    for (CFIndex i = 1LL; a2; --a2)
    {
      if (v25 >= *(void *)(a1 + 80)) {
        break;
      }
      uint64_t v26 = *(void *)(*(void *)(a1 + 72) + 8 * v25);
      *(void *)(a1 + 104) = v26;
      *a4++ = v26;
      ++*a3;
      BOOL v25 = *(void *)(a1 + 88) + 1LL;
      *(void *)(a1 + 88) = v25;
    }

    return i;
  }

    CFRelease(string);
    return v6;
  }

  return 0LL;
}

LABEL_63:
    if ((v10 & 0x20000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_73;
  }

  if ((v10 & 0x10000) == 0) {
    goto LABEL_63;
  }
LABEL_69:
  if ((v16 & 0x10000) != 0)
  {
    int v53 = *v43++;
    *(_DWORD *)(a6 + 44) = v53;
    if ((v10 & 0x20000) == 0) {
      goto LABEL_78;
    }
  }

  else
  {
    *(_DWORD *)(a6 + 44) = 0;
    if ((v10 & 0x20000) == 0) {
      goto LABEL_78;
    }
  }

LABEL_73:
  if ((v16 & 0x20000) != 0)
  {
    int v55 = *v43++;
    int v54 = v55;
  }

  else
  {
    int v54 = 0;
  }

  *(_DWORD *)(a6 + 16) = v54;
LABEL_78:
  if ((v10 & 0x40000) == 0)
  {
    if ((v10 & 0x80000) == 0) {
      goto LABEL_80;
    }
LABEL_87:
    if ((v16 & 0x80000) != 0)
    {
      int v57 = *v43++;
      *(_DWORD *)(a6 + 32) = v57;
      if ((v10 & 0x100000) != 0) {
        goto LABEL_91;
      }
    }

    else
    {
      *(_DWORD *)(a6 + 32) = 0;
      if ((v10 & 0x100000) != 0) {
        goto LABEL_91;
      }
    }

LABEL_81:
    if ((v10 & 0x200000) == 0) {
      goto LABEL_99;
    }
    goto LABEL_95;
  }

  if ((v16 & 0x40000) != 0)
  {
    int v56 = *v43++;
    *(_DWORD *)(a6 + 20) = v56;
    if ((v10 & 0x80000) != 0) {
      goto LABEL_87;
    }
  }

  else
  {
    *(_DWORD *)(a6 + 20) = 0;
    if ((v10 & 0x80000) != 0) {
      goto LABEL_87;
    }
  }

LABEL_80:
  if ((v10 & 0x100000) == 0) {
    goto LABEL_81;
  }
LABEL_91:
  if ((v16 & 0x100000) != 0)
  {
    int v58 = *v43++;
    *(_DWORD *)(a6 + 36) = v58;
    if ((v10 & 0x200000) == 0) {
      goto LABEL_99;
    }
  }

  else
  {
    *(_DWORD *)(a6 + 36) = 0;
    if ((v10 & 0x200000) == 0) {
      goto LABEL_99;
    }
  }

LABEL_111:
  if ((v16 & 0x2000000) == 0)
  {
    *(void *)(a6 + 120) = 0LL;
    goto LABEL_113;
  }

  uint64_t v67 = *(void *)v62;
  v62 += 2;
  *(void *)(a6 + 120) = v67;
  if ((v10 & 0x4000000) != 0) {
    goto LABEL_119;
  }
LABEL_114:
  if ((v10 & 0x8000000) == 0) {
    goto LABEL_115;
  }
LABEL_123:
  if ((v16 & 0x8000000) != 0)
  {
    BOOL v129 = v21;
    int v130 = v12;
    HIDWORD(v128) = v13;
    unsigned int v71 = v15;
    uint64_t v72 = *v62;
    CFIndex v73 = (v62[1] - 1);
    unint64_t v74 = *(const void **)(a6 + 232);
    if (v74)
    {
      int v75 = v27;
      CFRelease(v74);
      int v27 = v75;
    }

    uint64_t v76 = v62 + 2;
    if ((_DWORD)v73)
    {
      int v77 = (const UInt8 *)v62 + v72;
      int v78 = v27;
      CFStringRef v79 = CFStringCreateWithBytes(alloc, v77, v73, 0x8000100u, 0);
      int v27 = v78;
    }

    else
    {
      CFStringRef v79 = 0LL;
    }

    *(void *)(a6 + 232) = v79;
    uint64_t v62 = v76;
    unsigned int v15 = v71;
    LOWORD(v13) = WORD2(v128);
    LOBYTE(v21) = v129;
    int v12 = v130;
  }

  else
  {
    uint64_t v69 = *(const void **)(a6 + 232);
    if (v69)
    {
      int v70 = v27;
      CFRelease(v69);
      int v27 = v70;
      *(void *)(a6 + 232) = 0LL;
    }
  }

  *(_DWORD *)a6 |= 0x100u;
  if ((v10 & 0x10000000) == 0)
  {
LABEL_116:
    if ((v10 & 0x40000000) == 0) {
      goto LABEL_140;
    }
    goto LABEL_137;
  }

                          LODWORD(MutableCopy) = 0;
                          LODWORD(v18) = 0;
                          uint64_t v35 = 0;
                          uint64_t v36 = 0LL;
LABEL_116:
                          double v37 = 0LL;
                          uint64_t v38 = 0LL;
                          goto LABEL_43;
                        }
                      }

                      else
                      {
                        CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                      }
                    }

                    uint64_t v67 = 18LL;
                    goto LABEL_114;
                  }

LABEL_133:
  if ((v16 & 0x10000000) != 0)
  {
    uint64_t v81 = *(void *)v62;
    uint64_t v82 = *((void *)v62 + 1);
    v62 += 4;
    double v80 = (double)v81 - *MEMORY[0x189604DA8] + (double)v82 * 0.000000001;
  }

  else
  {
    double v80 = -1.0 - *MEMORY[0x189604DA0];
  }

  *(double *)(a6 + 88) = v80;
  if ((v10 & 0x40000000) != 0)
  {
LABEL_137:
    if ((v16 & 0x40000000) != 0)
    {
      int v83 = *v62++;
      *(_DWORD *)(a6 + 48) = v83;
    }

    else
    {
      *(_DWORD *)(a6 + 48) = 0;
    }
  }

LABEL_140:
  BOOL v84 = v27 == 2;
  unsigned int v85 = v137;
  if (!v84)
  {
    unsigned int v86 = *(_DWORD *)a6 & 0xFFFFDFFF;
    *(_DWORD *)a6 = v86;
    if (!v12) {
      goto LABEL_185;
    }
    if ((v12 & 1) != 0)
    {
      if ((v85 & 1) != 0)
      {
        int v91 = *v62++;
        int v89 = v91;
      }

      else
      {
        int v89 = 1;
      }

      *(_DWORD *)(a6 + 24) = v89;
    }

    uint64_t v62 = (int *)((char *)v62 + ((4 * v85) & 8)
                              + ((2 * v85) & 8)
    if ((v12 & 0x200) == 0)
    {
      if ((v12 & 0x400) == 0) {
        goto LABEL_156;
      }
LABEL_169:
      if ((v85 & 0x400) != 0)
      {
        uint64_t v97 = *(void *)v62;
        v62 += 2;
        *(void *)(a6 + 216) = v97;
        if ((v12 & 0x1000) != 0) {
          goto LABEL_178;
        }
      }

      else
      {
        *(void *)(a6 + 216) = 0LL;
        if ((v12 & 0x1000) != 0) {
          goto LABEL_178;
        }
      }

LABEL_157:
      if ((v12 & 0x2000) == 0) {
        goto LABEL_185;
      }
LABEL_182:
      if ((v85 & 0x2000) != 0)
      {
        uint64_t v99 = *(void *)v62;
        v62 += 2;
        *(void *)(a6 + 200) = v99;
      }

      else
      {
        *(void *)(a6 + 200) = 0LL;
      }

      goto LABEL_185;
    }

    if ((v85 & 0x200) != 0)
    {
      uint64_t v94 = *(void *)v62;
      v62 += 2;
      *(void *)(a6 + 208) = v94;
      if ((v12 & 0x400) != 0) {
        goto LABEL_169;
      }
    }

    else
    {
      *(void *)(a6 + 208) = 0LL;
      if ((v12 & 0x400) != 0) {
        goto LABEL_169;
      }
    }

LABEL_156:
    if ((v12 & 0x1000) == 0) {
      goto LABEL_157;
    }
LABEL_178:
    v86 |= 0x20u;
    *(_DWORD *)a6 = v86;
    if ((v85 & 0x1000) != 0)
    {
      uint64_t v98 = *(void *)v62;
      v62 += 2;
      *(void *)(a6 + 192) = v98;
      if ((v12 & 0x2000) == 0) {
        goto LABEL_185;
      }
    }

    else
    {
      *(void *)(a6 + 192) = 0LL;
      if ((v12 & 0x2000) == 0) {
        goto LABEL_185;
      }
    }

    goto LABEL_182;
  }

  *(_OWORD *)(a6 + 192) = 0u;
  *(_OWORD *)(a6 + 208) = 0u;
  unsigned int v86 = *(_DWORD *)a6 & 0xFFFFFFDF;
  *(_DWORD *)a6 = v86;
  char v87 = v135;
  if (!v135) {
    goto LABEL_185;
  }
  if ((v135 & 1) == 0)
  {
    char v88 = v133;
    if ((v133 & 2) == 0) {
      goto LABEL_165;
    }
LABEL_164:
    int v93 = *v62++;
    *(_DWORD *)(a6 + 28) = v93;
    v86 |= 0x400u;
    *(_DWORD *)a6 = v86;
    goto LABEL_165;
  }

  char v88 = v133;
  if ((v133 & 1) != 0)
  {
    int v92 = *v62++;
    int v90 = v92;
  }

  else
  {
    int v90 = 1;
  }

  *(_DWORD *)(a6 + 24) = v90;
  if ((v88 & 2) != 0) {
    goto LABEL_164;
  }
LABEL_165:
  if ((v87 & 4) != 0)
  {
    if ((v88 & 4) != 0)
    {
      int v95 = *v62++;
      unsigned int v86 = v86 & 0xFFFF9FFF | ((v95 & 3) << 13);
      *(_DWORD *)a6 = v86;
      char v96 = (v95 & 3) == 0 || v21;
      if ((v96 & 1) == 0)
      {
        *(int64x2_t *)(a6 + 120) = vdupq_n_s64(2uLL);
        *(void *)(a6 + 136) = 1LL;
      }
    }

    else
    {
      v86 &= 0xFFFF9FFF;
      *(_DWORD *)a6 = v86;
    }
  }

LABEL_185:
  uint64_t v100 = 0LL;
  if ((v13 & 0x10) != 0 && (v15 & 0x10) != 0)
  {
    uint64_t v101 = *(void *)v62;
    v62 += 2;
    uint64_t v100 = v101;
  }

  __int128 v102 = (int *)((char *)v62 + ((v15 >> 2) & 8));
  if ((v13 & 0x40) != 0 && (v15 & 0x40) != 0)
  {
    int v103 = *v102++;
    *(_DWORD *)(a6 + 100) = v103;
  }

  if ((v13 & 0x100) != 0 && (v15 & 0x100) != 0)
  {
    uint64_t v104 = *(void *)v102;
    v102 += 2;
    *(void *)(a6 + 144) = v104;
  }

  if ((v13 & 0x200) != 0 && (v15 & 0x200) != 0)
  {
    v86 |= 0x200u;
    *(_DWORD *)a6 = v86;
    *(void *)(a6 + 152) = *(void *)v102;
  }

  BOOL v105 = (dword_18C463A9C & ~v10) == 0;
  if ((v86 & 0x4000) != 0)
  {
    *(_DWORD *)a6 = v86 & 0xFF817FFF | 0x400000;
    *(_DWORD *)(a6 + 112) = 0;
    if (!v21)
    {
      *(int64x2_t *)(a6 + 120) = vdupq_n_s64(2uLL);
      *(_OWORD *)(a6 + 136) = xmmword_182EA5200;
    }

    acl_t v113 = v138;
    if (!v105) {
      goto LABEL_244;
    }
    goto LABEL_226;
  }

  BOOL v106 = v21;
  uint64_t v107 = MountInfoStorageSize();
  uint64_t v108 = (char *)&v128 - ((MEMORY[0x1895F8858](v107) + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (v136)
  {
    int FSID = MountInfoGetFSID(v136);
    int v110 = *(_DWORD *)(a6 + 104);
    if (v110 == FSID)
    {
      char v111 = v15;
      int v137 = 1;
      uint64_t v112 = v136;
      goto LABEL_208;
    }
  }

  else
  {
    int v110 = *(_DWORD *)(a6 + 104);
  }

  uint64_t v139 = 0LL;
  if (!MountInfoPrepare(&v139, 0, v110, v108, 0LL, 0LL, 0LL))
  {
    *(void *)(a6 + 128) = *(void *)(a6 + 120);
    acl_t v113 = v138;
    goto LABEL_225;
  }

  char v111 = v15;
  int v137 = 0;
  uint64_t v112 = v139;
LABEL_208:
  unint64_t Capabilities = MountInfoGetCapabilities(v112);
  *(_DWORD *)(a6 + 112) = MountInfoGetMountID(v139);
  *(_DWORD *)a6 = (Capabilities >> 44) & 0x10000 | (Capabilities >> 36) & 0x8000 | ((Capabilities & 0x800000000000LL) >> 30) | (Capabilities >> 40) & 0x80000 | (Capabilities >> 29) & 0x100000 | (Capabilities >> 37) & 0x200000 | *(_DWORD *)a6 & 0xFFC47FFF;
  *(_DWORD *)a6 = *(_DWORD *)a6 & 0xFFBFFFFF | (((MountInfoGetVolumeFlags(v139) >> 1) & 1) << 22);
  *(_DWORD *)(a6 + 96) = MountInfoGetIOBlockSize(v139);
  if ((Capabilities & 0x800000000000LL) == 0 && (dword_18C463A9C & ~v10 & 0xFE3FFFFF) == 0) {
    BOOL v105 = 1;
  }
  int v115 = *(_DWORD *)a6;
  char v116 = (*(_DWORD *)a6 & 0x8000) == 0 || v106;
  if ((v116 & 1) == 0)
  {
    if ((v111 & 0x10) == 0) {
      uint64_t v100 = *(void *)(a6 + 120);
    }
    *(void *)(a6 + 128) = v100;
  }

  if ((v115 & 0x2000) != 0 && !strcmp(v131, "/"))
  {
    uint64_t VolumeName = (const char *)MountInfoGetVolumeName(v139);
    if (VolumeName)
    {
      uint64_t v118 = (UInt8 *)VolumeName;
      size_t v119 = strlen(VolumeName);
      SetNameAndHiddenFlagsFromCString(alloc, v118, v119, a6);
    }
  }

  acl_t v113 = v138;
  if ((v137 & 1) == 0) {
    MountInfoDestroy(v139);
  }
LABEL_225:
  if (v105)
  {
LABEL_226:
    *(_DWORD *)a6 |= 0x80u;
    uint64_t v120 = *(const void **)(a6 + 224);
    if (v120)
    {
      CFRelease(v120);
      *(void *)(a6 + 224) = 0LL;
    }

    int v121 = *(_DWORD *)(a6 + 40);
    int v122 = *(_DWORD *)(a6 + 44);
    int v123 = *(_DWORD *)(a6 + 16);
    acl_t v143 = v113;
    int v141 = v122;
    int v142 = v121;
    __int16 v140 = v123;
    CFRange v124 = filesec_init();
    if (!v124) {
      goto LABEL_244;
    }
    int v125 = v124;
    if (!v113) {
      goto LABEL_252;
    }
    if (filesec_set_property(v124, FILESEC_ACL, &v143)) {
      goto LABEL_243;
    }
    if (!v143)
    {
LABEL_252:
      if (!v134 || uuid_is_null(v134))
      {
LABEL_235:
        if ((!v143 && (!v132 || uuid_is_null(v132)) || !filesec_set_property(v125, FILESEC_GRPUUID, v132))
          && !filesec_set_property(v125, FILESEC_OWNER, &v142)
          && !filesec_set_property(v125, FILESEC_GROUP, &v141)
          && !filesec_set_property(v125, FILESEC_MODE, &v140))
        {
          uint64_t v127 = _CFFileSecurityCreateFromFilesec();
          *(void *)(a6 + 224) = v127;
          if (v127) {
            goto LABEL_244;
          }
        }

        goto LABEL_243;
      }
    }

    if (!filesec_set_property(v125, FILESEC_UUID, v134)) {
      goto LABEL_235;
    }
LABEL_243:
    filesec_free(v125);
  }

LABEL_244:
  if (v113) {
    acl_free(v113);
  }
  return 0LL;
}

void SetNameAndHiddenFlagsFromCString(CFAllocatorRef alloc, UInt8 *bytes, CFIndex numBytes, uint64_t a4)
{
  int v8 = *(const void **)(a4 + 8);
  if (v8) {
    CFRelease(v8);
  }
  CFStringRef v9 = CFStringCreateWithBytes(alloc, bytes, numBytes, 0x8000100u, 0);
  *(void *)(a4 + 8) = v9;
  if (!v9)
  {
    syslog( 3,  "SetNameAndExtensionLengthFromCString: CFStringCreateWithBytes failed with kCFStringEncodingUTF8; retrying with kCF"
      "StringEncodingISOLatin1");
    CFStringRef v10 = CFStringCreateWithBytes(alloc, bytes, numBytes, 0x201u, 0);
    *(void *)(a4 + 8) = v10;
    if (!v10)
    {
      syslog( 3,  "SetNameAndExtensionLengthFromCString: CFStringCreateWithBytes failed with kCFStringEncodingISOLatin1; setting na"
        "me to empty string");
      *(void *)(a4 + 8) = &stru_189C5C0D0;
    }
  }

  BOOL v11 = *bytes == 46;
  unsigned int v12 = *(_DWORD *)a4 & 0xFFFFF7FF | (v11 << 11);
  *(_DWORD *)a4 = v12;
  if (v11) {
    int v13 = (bytes[1] == 46) << 12;
  }
  else {
    int v13 = 0;
  }
  *(_DWORD *)a4 = v13 | v12 & 0xFFFFEFFF;
}

uint64_t valueOfBoolean(const __CFBoolean *a1)
{
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFNumberGetTypeID()) {
    return CFBooleanGetValue(a1);
  }
  if (CFNumberGetValue(a1, kCFNumberSInt32Type, &valuePtr)) {
    BOOL v3 = valuePtr == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

uint64_t objectTypeFromAccessMask(__int16 a1)
{
  unsigned int v1 = (a1 & 0xF000) - 4096;
  if (v1 >> 14 > 2) {
    return 0LL;
  }
  else {
    return dword_182EA5384[v1 >> 12];
  }
}

uint64_t pathURLPropertyProviderCopyValues( const __CFURL *a1, uint64_t a2, CFTypeRef *a3, void **a4, uint64_t a5, uint64_t a6)
{
  if (a6 < 1) {
    return 1LL;
  }
  uint64_t v6 = a6;
  BOOL v11 = (const void *)*MEMORY[0x189605670];
  unsigned int v12 = (const void *)*MEMORY[0x189605440];
  int v13 = (const void *)*MEMORY[0x189605448];
  CFTypeRef v17 = (CFTypeRef)*MEMORY[0x189604C50];
  CFTypeRef cf2 = (CFTypeRef)*MEMORY[0x189605380];
  CFTypeRef v16 = (CFTypeRef)*MEMORY[0x189604C58];
  while (1)
  {
    CFTypeRef v14 = *a3;
    if (!CFEqual(*a3, v11))
    {
      if (!CFEqual(v14, v12) && !CFEqual(v14, v13) && !CFEqual(v14, cf2) && !CFEqual(v14, v17))
      {
        uint64_t result = CFEqual(v14, v16);
        if (!(_DWORD)result) {
          return result;
        }
      }

      uint64_t result = _FileCacheGetPropertyValueForKey(a2, v14, a4);
      if (!(_DWORD)result) {
        return result;
      }
      goto LABEL_14;
    }

uint64_t pathURLPropertyProviderPrepareValues( const __CFURL *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, CFErrorRef *a7)
{
  uint64_t v88 = *MEMORY[0x1895F89C0];
  _FileCacheLock(a2);
  if (a5 < 1)
  {
    uint64_t v27 = 1LL;
    goto LABEL_126;
  }

  unint64_t v74 = a7;
  uint64_t v12 = 0LL;
  int v13 = 0;
  uint64_t v14 = 0LL;
  int v75 = 0;
  unsigned int v15 = (const void *)*MEMORY[0x189605670];
  CFTypeRef v16 = (const void *)*MEMORY[0x189605440];
  *(void *)uint64_t v68 = *MEMORY[0x189604F58];
  unsigned int v71 = (const __CFString *)*MEMORY[0x189604F40];
  CFTypeRef cf2 = (CFTypeRef)*MEMORY[0x189605448];
  CFTypeRef v76 = (CFTypeRef)*MEMORY[0x189605380];
  CFIndex v73 = (const void *)*MEMORY[0x189604DE8];
  int v70 = (const void *)*MEMORY[0x189604DE0];
  CFTypeRef v72 = (CFTypeRef)*MEMORY[0x189604C50];
  CFTypeRef v69 = (CFTypeRef)*MEMORY[0x189604C58];
  int v77 = (const void *)*MEMORY[0x189605440];
  while (1)
  {
    CFTypeRef v17 = *(const void **)(a3 + 8 * v12);
    if (CFEqual(v17, v15))
    {
      uint64_t Attributes = _FileCacheGetAttributes(a2);
      if (((*(_BYTE *)(Attributes + 1) & 0x20) == 0 || !CFURLHasDirectoryPath(a1))
        && !_FileCacheGetPropertyValueForKey(a2, v15, (void **)&cf))
      {
        if (!v13) {
          uint64_t v14 = CFURLIsFileReferenceURL(a1);
        }
        unsigned int v19 = CFGetAllocator(a1);
        _FileCacheSetPropertyValueForKey(a2, v15, cf);
        if (cf) {
          CFRelease(cf);
        }
        int v13 = 1;
      }

      goto LABEL_54;
    }

    if (CFEqual(v17, v16))
    {
      if (_FileCacheGetPropertyValueForKey(a2, v16, &v83))
      {
LABEL_54:
        uint64_t v27 = 1LL;
        goto LABEL_55;
      }

      uint64_t v20 = _FileCacheGetAttributes(a2);
      CFURLRef v82 = 0LL;
      if (!v13) {
        uint64_t v14 = CFURLIsFileReferenceURL(a1);
      }
      if ((*(_DWORD *)v20 & 0x2000) != 0)
      {
        double v31 = CFGetAllocator(a1);
        CFURLRef v32 = v82;
        _FileCacheSetPropertyValueForKey(a2, v16, v82);
        if (!v32) {
          goto LABEL_45;
        }
        goto LABEL_44;
      }

      int v21 = *(_DWORD *)(v20 + 112);
      if ((_DWORD)v14)
      {
        if (!v21) {
          goto LABEL_46;
        }
        if (*(void *)(v20 + 136))
        {
          uint64_t v22 = v16;
          uint64_t v23 = v14;
          BOOL v24 = CFGetAllocator(a1);
          uint64_t v25 = *(unsigned int *)(v20 + 112);
          uint64_t v26 = *(void *)(v20 + 136);
          uint64_t v27 = 1LL;
          CFURLRef FileReferenceURLRef = createFileReferenceURLRef(v24, v25, 0LL, v26, 0LL, 1u);
          _FileCacheSetPropertyValueForKey(a2, v22, FileReferenceURLRef);
          if (FileReferenceURLRef) {
            CFRelease(FileReferenceURLRef);
          }
          goto LABEL_91;
        }
      }

      else if (!v21)
      {
        goto LABEL_46;
      }

      if ((*(_DWORD *)v20 & 0x8000) != 0)
      {
        uint64_t v33 = v14;
        CFAllocatorRef v34 = CFGetAllocator(a1);
        size_t v35 = strlen((const char *)__s);
        uint64_t v36 = (const __CFURL *)MEMORY[0x186E19FA4](v34, __s, v35, 1LL, 0LL);
        CFURLRef v82 = v36;
        uint64_t v14 = v33;
        CFTypeRef v16 = v77;
        if (!v36) {
          goto LABEL_123;
        }
        CFURLRef v32 = v36;
        _FileCacheSetPropertyValueForKey(a2, v77, v36);
LABEL_44:
        CFRelease(v32);
LABEL_45:
        uint64_t v27 = 1LL;
LABEL_121:
        int v13 = 1;
        goto LABEL_55;
      }

LABEL_46:
      if (!CFURLGetFileSystemRepresentation(a1, 1u, __s, 1024LL))
      {
        uint64_t v23 = v14;
        if (v74)
        {
          int v46 = CFGetAllocator(a1);
          uint64_t v27 = 0LL;
          *unint64_t v74 = _FSURLCreateStandardError(v46, v71, 4LL, 0, (const __CFString *)a1, 0LL);
        }

        else
        {
          uint64_t v27 = 0LL;
        }

    uint64_t v28 = *(void *)(a1 + 80);
    *(void *)(*(void *)(a1 + 72) + 8 * v28) = v21;
    *(void *)(a1 + 8 * v28 + 168) = *(unsigned int *)(v9 + 44);
    if (*(_DWORD *)(v9 + 48) == 2) {
      *(_BYTE *)(a1 + *(void *)(a1 + 80) + 488) = 1;
    }
    uint64_t v29 = *v5 + 1;
    CFAllocatorRef v5 = v29;
    if (v29 == 40) {
      goto LABEL_84;
    }
    CFStringRef v10 = 1;
LABEL_79:
    CFAllocatorRef v39 = 0LL;
    CFStringRef v9 = DirEnumRead(*(void *)(a1 + 160));
    if (!v9) {
      goto LABEL_85;
    }
  }

  HasExtendeduint64_t Attributes = (void *)DirEnumHasExtendedAttributes(*(void *)(a1 + 160));
  uint64_t v20 = _FSURLCreateWithPathAndExtendedAttributes( *(CFAllocatorRef *)(a1 + 16),  *(unsigned __int8 **)(v9 + 8),  *(void *)(v9 + 16),  *(void *)(a1 + 544),  *(const __CFURL **)(a1 + 536),  (attrlist *)(*(void *)(a1 + 160) + 1796LL),  *(attrlist **)(v9 + 56),  HasExtendedAttributes,  (*(_BYTE *)(a1 + 32) & 4) != 0,  *(_WORD *)(a1 + 123),  HIBYTE(*(_WORD *)(a1 + 123)),  -1,  v40[0],  &v39);
  if (!v20) {
    goto LABEL_76;
  }
  int v21 = v20;
  if ((*(_BYTE *)(a1 + 32) & 2) == 0) {
    goto LABEL_32;
  }
  double v31 = __CFURLResourceInfoPtr();
  if (!v31 || !_FileCacheGetFlags(v31, (unint64_t *)&v38, &v37, 0LL, 0LL) || (v37 & 0x80) == 0)
  {
    if (CFURLCopyResourcePropertyForKey(v21, v11, &propertyValueTypeRefPtr, 0LL) && propertyValueTypeRefPtr)
    {
      if (CFBooleanGetValue(propertyValueTypeRefPtr))
      {
        if (*(_DWORD *)(v9 + 48) == 1) {
          DirEnumSkipDescendents(*(void *)(a1 + 160));
        }
        CFRelease(v21);
        CFURLRef v32 = propertyValueTypeRefPtr;
        goto LABEL_75;
      }

      CFRelease(propertyValueTypeRefPtr);
    }

    goto LABEL_32;
  }

  if ((v38 & 0x80) == 0)
  {
LABEL_32:
    if (*(_BYTE *)(a1 + 122)) {
      _FSURLCacheCheapVolumeInformation(v21, *(_DWORD *)(*(void *)(a1 + 160) + 1792LL), (uint64_t)v40[0]);
    }
    uint64_t v22 = *(const __CFArray **)(a1 + 64);
    if (v22)
    {
      uint64_t v23 = (const void *)__CFURLResourceInfoPtr();
      _FSURLCacheResourcePropertiesForKeys(v21, v22, v23, 0LL);
    }

    if ((*(_BYTE *)(a1 + 32) & 8) != 0 && *(_DWORD *)(v9 + 48) == 1)
    {
      BOOL v24 = __CFURLResourceInfoPtr();
      if (v24 && _FileCacheGetPropertyValueForKey(v24, v35, (void **)&v38) && v38)
      {
        if (CFBooleanGetValue(v38)) {
          DirEnumSkipDescendents(*(void *)(a1 + 160));
        }
      }

      else if (CFURLCopyResourcePropertyForKey(v21, v35, &v38, 0LL) && v38)
      {
        if (CFBooleanGetValue(v38)) {
          DirEnumSkipDescendents(*(void *)(a1 + 160));
        }
        CFRelease(v38);
      }
    }

    goto LABEL_46;
  }

  if (*(_DWORD *)(v9 + 48) == 1) {
    DirEnumSkipDescendents(*(void *)(a1 + 160));
  }
  CFURLRef v32 = v21;
LABEL_75:
  CFRelease(v32);
LABEL_76:
  CFErrorRef v30 = v39;
  if (!v39)
  {
LABEL_77:
    goto LABEL_79;
  }

LABEL_91:
        uint64_t v14 = v23;
        CFTypeRef v16 = v77;
        goto LABEL_121;
      }

      uint64_t v81 = 0LL;
      __int128 v80 = xmmword_182EA5320;
      _FileCacheUnlock(a2);
      if (filtered_getattrlist((char *)__s, &v80, &cf, 0x40CuLL, 0x21u))
      {
        uint64_t v37 = v14;
        uint64_t v38 = v74;
        if (v74)
        {
          CFAllocatorRef v39 = CFGetAllocator(a1);
          uint64_t v40 = *__error();
          uint64_t v41 = v39;
          uint64_t v42 = *(const __CFString **)v68;
LABEL_50:
          uint64_t v27 = 0LL;
          CFErrorRef *v38 = _FSURLCreateStandardError(v41, v42, v40, 0, (const __CFString *)a1, 0LL);
LABEL_103:
          uint64_t v14 = v37;
          CFTypeRef v16 = v77;
LABEL_120:
          _FileCacheLock(a2);
          goto LABEL_121;
        }

        goto LABEL_102;
      }

      __int128 v47 = (char *)&cf + SHIDWORD(cf) + 4;
      if (v85 < 3)
      {
        if (strcmp("/", (const char *)&cf + SHIDWORD(cf) + 4))
        {
          uint64_t v37 = v14;
          uint64_t v38 = v74;
          if (v74)
          {
            uint64_t v41 = CFGetAllocator(a1);
            uint64_t v42 = v71;
            uint64_t v40 = 4LL;
            goto LABEL_50;
          }

LABEL_102:
          uint64_t v27 = 0LL;
          goto LABEL_103;
        }

        _FileCacheSetPropertyValueForKey(a2, v16, 0LL);
      }

      else
      {
        unsigned int v79 = v14;
        if (*v47)
        {
          size_t v48 = strlen((const char *)&cf + SHIDWORD(cf) + 4);
          uint64_t v49 = (unsigned __int8 *)&cf + v48 + SHIDWORD(cf) + 3;
          int8x8_t v50 = (char *)&cf + v48 + SHIDWORD(cf) + 2;
          while (v49 > (unsigned __int8 *)v47)
          {
            int8x8_t v51 = v50;
            int v52 = *v49--;
            --v50;
            if (v52 != 47)
            {
              while (v51 > v47)
              {
                int v53 = *v51--;
                if (v53 == 47)
                {
                  uint64_t v49 = (unsigned __int8 *)(v51 + 1);
                  goto LABEL_78;
                }
              }

              goto LABEL_106;
            }
          }

LABEL_78:
          if (v49 != (unsigned __int8 *)v47)
          {
            int v54 = (char *)(v49 - 1);
            do
            {
              int v55 = v54;
              if (v54 <= v47) {
                break;
              }
              --v54;
            }

            while (*v55 == 47);
            goto LABEL_110;
          }

uint64_t pathURLPropertyProviderCopyAndCacheValues( const __CFURL *a1, uint64_t a2, CFTypeRef *a3, void **a4, uint64_t a5, uint64_t a6)
{
  if (a6 < 1) {
    return 1LL;
  }
  uint64_t v6 = a6;
  BOOL v11 = (const void *)*MEMORY[0x189605670];
  uint64_t v12 = (const void *)*MEMORY[0x189605448];
  int v13 = (const void *)*MEMORY[0x189605440];
  uint64_t v14 = (const void *)*MEMORY[0x189605380];
  CFTypeRef cf2 = (CFTypeRef)*MEMORY[0x189604C50];
  CFTypeRef v21 = (CFTypeRef)*MEMORY[0x189604C58];
  while (1)
  {
    CFTypeRef v15 = *a3;
    if (CFEqual(*a3, v11)) {
      break;
    }
    if (CFEqual(v15, v12))
    {
      uint64_t result = _FileCacheGetPropertyValueForKey(a2, v15, a4);
      if (!(_DWORD)result) {
        return result;
      }
      if (!*a4) {
        goto LABEL_24;
      }
      uint64_t Attributes = _FileCacheGetAttributes(a2);
      if ((*(_BYTE *)(Attributes + 1) & 1) != 0)
      {
        uint64_t v18 = Attributes;
        unsigned int v19 = *(void **)(Attributes + 232);
        if (v19)
        {
          if (v19 != *a4)
          {
            if (CFEqual(v19, *a4))
            {
              _FileCacheSetPropertyValueForKey(a2, v12, *(const void **)(v18 + 232));
              *a4 = *(void **)(v18 + 232);
            }
          }
        }
      }

      uint64_t v20 = *a4;
LABEL_23:
      CFRetain(v20);
      goto LABEL_24;
    }

    if (!CFEqual(v15, v13) && !CFEqual(v15, v14) && !CFEqual(v15, cf2))
    {
      uint64_t result = CFEqual(v15, v21);
      if (!(_DWORD)result) {
        return result;
      }
    }

    uint64_t result = _FileCacheGetPropertyValueForKey(a2, v15, a4);
    if (!(_DWORD)result) {
      return result;
    }
LABEL_22:
    uint64_t v20 = *a4;
    if (*a4) {
      goto LABEL_23;
    }
LABEL_24:
    ++a4;
    ++a3;
    if (!--v6) {
      return 1LL;
    }
  }

  if ((*(_BYTE *)(_FileCacheGetAttributes(a2) + 1) & 0x20) != 0)
  {
    uint64_t result = CFURLHasDirectoryPath(a1);
    if (!(_DWORD)result) {
      return result;
    }
    *a4 = (void *)CFRetain(a1);
    goto LABEL_24;
  }

  return 0LL;
}

uint64_t pathURLPropertyProviderSetValues( const __CFURL *a1, uint64_t a2, CFTypeRef *a3, const __CFBoolean **a4, uint64_t a5, uint64_t a6, uint64_t a7, CFErrorRef *a8)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  if (a6 < 1) {
    return 1LL;
  }
  uint64_t v8 = a6;
  int v12 = 0;
  int v13 = (const void *)*MEMORY[0x189605380];
  uint64_t v14 = (const __CFBoolean *)*MEMORY[0x189605018];
  CFTypeRef v15 = (const void *)*MEMORY[0x189604C50];
  CFTypeRef cf2 = (CFTypeRef)*MEMORY[0x189604C58];
  while (1)
  {
    CFTypeRef v16 = *a4;
    if (*a4) {
      break;
    }
LABEL_50:
    ++a4;
    ++a3;
    if (!--v8) {
      return 1LL;
    }
  }

  CFTypeRef v17 = *a3;
  if (CFEqual(*a3, v13))
  {
    if (!v12 && !CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024LL)) {
      goto LABEL_60;
    }
    if (v16 != v14 && valueOfBoolean(v16))
    {
      if (!setxattr( (const char *)buffer,  "com.apple.metadata:com_apple_backup_excludeItem",  "com.apple.MobileBackup",  0x16uLL,  0,  1))
      {
        uint64_t v18 = defaultLog;
        if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136380675;
          uint64_t v40 = buffer;
          unsigned int v19 = (os_log_s *)v18;
          uint64_t v20 = "kExcludedFromBackupXattrName set on path: %{private}s";
LABEL_56:
          _os_log_impl(&dword_182E77000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
          goto LABEL_49;
        }

        goto LABEL_49;
      }

      goto LABEL_45;
    }

    if (removexattr((const char *)buffer, "com.apple.MobileBackup", 1))
    {
      int v21 = *__error();
      if (v21 == 93) {
        int v22 = 0;
      }
      else {
        int v22 = v21;
      }
    }

    else
    {
      int v22 = 0;
    }

    if (removexattr((const char *)buffer, "com.apple.metadata:com_apple_backup_excludeItem", 1))
    {
      int v24 = *__error();
      if (v24 == 93) {
        int v24 = 0;
      }
    }

    else
    {
      uint64_t v26 = (os_log_s *)defaultLog;
      BOOL v27 = os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT);
      int v24 = 0;
      if (v27)
      {
        *(_DWORD *)buf = 136380675;
        uint64_t v40 = buffer;
        _os_log_impl( &dword_182E77000,  v26,  OS_LOG_TYPE_DEFAULT,  "kExcludedFromBackupXattrName removed from path: %{private}s",  buf,  0xCu);
        int v24 = 0;
      }
    }

    if (v22) {
      BOOL v28 = v24 == 0;
    }
    else {
      BOOL v28 = 0;
    }
    if (!v28) {
      int v22 = v24;
    }
LABEL_48:
    if (v22)
    {
      CFURLRef v32 = a8;
      if (a8)
      {
        uint64_t v33 = CFGetAllocator(a1);
        CFAllocatorRef v34 = (const __CFString *)*MEMORY[0x189604F58];
        uint64_t v35 = v22;
LABEL_64:
        CFErrorRef v36 = _FSURLCreateStandardError(v33, v34, v35, 1, (const __CFString *)a1, 0LL);
        uint64_t result = 0LL;
        CFErrorRef *v32 = v36;
        return result;
      }

      return 0LL;
    }

    goto LABEL_49;
  }

  if (CFEqual(v17, v15))
  {
    if (!v12 && !CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024LL)) {
      goto LABEL_60;
    }
    if (v16 != v14 && valueOfBoolean(v16))
    {
      if (!setxattr( (const char *)buffer,  "com.apple.metadata:com_apple_cloudBackup_excludeItem",  "com.apple.MobileBackup",  0x16uLL,  0,  1))
      {
        uint64_t v23 = defaultLog;
        if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136380675;
          uint64_t v40 = buffer;
          unsigned int v19 = (os_log_s *)v23;
          uint64_t v20 = "kExcludedFromCloudBackupName set on path: %{private}s";
          goto LABEL_56;
        }

LABEL_49:
        int v12 = 1;
        goto LABEL_50;
      }

      goto LABEL_45;
    }

    if (!removexattr((const char *)buffer, "com.apple.metadata:com_apple_cloudBackup_excludeItem", 1))
    {
      uint64_t v25 = defaultLog;
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136380675;
        uint64_t v40 = buffer;
        unsigned int v19 = (os_log_s *)v25;
        uint64_t v20 = "kExcludedFromCloudBackupName removed from path: %{private}s";
        goto LABEL_56;
      }

      goto LABEL_49;
    }

LABEL_47:
    int v22 = *__error();
    if (v22 == 93) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }

  if (!CFEqual(v17, cf2))
  {
    CFURLRef v32 = a8;
    if (a8)
    {
      uint64_t v33 = CFGetAllocator(a1);
      CFAllocatorRef v34 = (const __CFString *)*MEMORY[0x189604F40];
      uint64_t v35 = 512LL;
      goto LABEL_64;
    }

    return 0LL;
  }

  if (v12 || CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024LL))
  {
    if (v16 != v14 && valueOfBoolean(v16))
    {
      if (!setxattr( (const char *)buffer,  "com.apple.metadata:com_apple_unencryptedBackup_excludeItem",  "com.apple.MobileBackup",  0x16uLL,  0,  1))
      {
        uint64_t v30 = defaultLog;
        if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136380675;
          uint64_t v40 = buffer;
          unsigned int v19 = (os_log_s *)v30;
          uint64_t v20 = "kExcludedFromUnencryptedBackupName set on path: %{private}s";
          goto LABEL_56;
        }

        goto LABEL_49;
      }

    *(_DWORD *)(v9 + 48) = 5;
    uint64_t v26 = 63;
    goto LABEL_51;
  }

  *(_BYTE *)(v9 + 52) &= ~1u;
LABEL_29:
  *(_DWORD *)(v9 + 40) = 0;
  if (v30 == 2)
  {
    int v22 = 1;
  }

  else if (v30 == 1)
  {
    int v22 = 3;
  }

  else
  {
    int v22 = 4;
  }

  *(_DWORD *)(v9 + 48) = v22;
LABEL_35:
  *(void *)CFStringRef v9 = a2;
  *(void *)(v9 + 8) = a1;
  uint64_t v23 = *(void *)(a2 + 16);
  if (*(_BYTE *)(v23 + a1 - 1) != 47)
  {
    if ((unint64_t)(v23 + 1) >= 0x6FD)
    {
LABEL_44:
      *(_DWORD *)(v9 + 48) = 5;
      uint64_t v25 = 63;
LABEL_46:
      *(_DWORD *)(v9 + 40) = v25;
      return 1LL;
    }

    *(_BYTE *)(a1 + v23++) = 47;
  }

  *(_BYTE *)(a1 + v23) = 0;
  memcpy((void *)(a1 + v23), *(const void **)(v9 + 24), *v18 + 1LL);
  *(_DWORD *)(v9 + 44) = *(_DWORD *)(a2 + 44) + 1;
  int v24 = *(void *)(v9 + 32) + v23;
  *(void *)(v9 + 16) = v24;
  if (v24 >= 0x400) {
    goto LABEL_44;
  }
  *(_BYTE *)(v9 + 52) = *(_BYTE *)(v9 + 52) & 0xFD | (2 * ((v28 | v29) != 0));
  *(void *)(v9 + 72) = 0LL;
  return 1LL;
}

LABEL_45:
      int v22 = *__error();
      goto LABEL_48;
    }

    if (!removexattr((const char *)buffer, "com.apple.metadata:com_apple_unencryptedBackup_excludeItem", 1))
    {
      uint64_t v29 = defaultLog;
      if (os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136380675;
        uint64_t v40 = buffer;
        unsigned int v19 = (os_log_s *)v29;
        uint64_t v20 = "kExcludedFromUnencryptedBackupName removed from path: %{private}s";
        goto LABEL_56;
      }

      goto LABEL_49;
    }

    goto LABEL_47;
  }

LABEL_60:
  CFURLRef v32 = a8;
  if (a8)
  {
    uint64_t v33 = CFGetAllocator(a1);
    CFAllocatorRef v34 = (const __CFString *)*MEMORY[0x189604F40];
    uint64_t v35 = 4LL;
    goto LABEL_64;
  }

  return 0LL;
}

uint64_t createVolumeURL(__CFAllocator *a1, int a2, fsid *a3, CFURLRef *a4)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    uint64_t v7 = 1LL;
    *a4 = createFileReferenceURLRef(a1, a3[14].val[0], 0LL, 2LL, 0LL, 1u);
    return v7;
  }

  uint64_t v19 = 0LL;
  uint64_t v8 = MountInfoStorageSize();
  uint64_t v9 = MEMORY[0x1895F8858](v8);
  if (MountInfoPrepare( &v19,  a3[14].val[0],  0,  (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL),  0LL,  0LL,  0LL))
  {
    MountPoint = (const char *)MountInfoGetMountPoint(v19);
LABEL_10:
    size_t v14 = strlen(MountPoint);
    if (v14)
    {
      size_t v15 = v14;
      if (v19)
      {
        CFURLRef v16 = (CFURLRef)MEMORY[0x186E19FA4](a1, MountPoint, v15, 1LL, 0LL);
      }

      else
      {
        CFURLRef v16 = CFURLCreateFromFileSystemRepresentation(a1, (const UInt8 *)MountPoint, v14, 1u);
      }

      *a4 = v16;
      uint64_t v7 = 1LL;
      goto LABEL_18;
    }

    goto LABEL_15;
  }

  fsid v11 = a3[13];
  if (!GetStatfsByFSID(v11, &v24))
  {
    MountPoint = v24.f_mntonname;
    goto LABEL_10;
  }

LABEL_7:
  int v12 = (os_log_s *)defaultLog;
  uint64_t v7 = 0LL;
  if (!os_log_type_enabled((os_log_t)defaultLog, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_18;
  }
  fsid v13 = a3[29];
  int v20 = 136315394;
  int v21 = "createVolumeURL";
  __int16 v22 = 2112;
  fsid v23 = v13;
  _os_log_impl(&dword_182E77000, v12, OS_LOG_TYPE_DEFAULT, "%s: no mountpoint for path: %@", (uint8_t *)&v20, 0x16u);
LABEL_15:
  uint64_t v7 = 0LL;
LABEL_18:
  if (v19) {
    MountInfoDestroy(v19);
  }
  return v7;
}

uint64_t createVolumeParentURL(const __CFAllocator *a1, unsigned __int8 a2, fsid *a3, size_t *a4)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  int v20 = 0LL;
  uint64_t v8 = MountInfoStorageSize();
  uint64_t v9 = MEMORY[0x1895F8858](v8);
  if (MountInfoPrepare( &v20,  a3[14].val[0],  0,  (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL),  0LL,  0LL,  0LL))
  {
    MountPoint = (char *)MountInfoGetMountPoint((uint64_t)v20);
  }

  else
  {
    fsid v11 = a3[13];
    MountPoint = v21.f_mntonname;
  }

  size_t v12 = strlen(MountPoint);
  do
  {
    if (!v12)
    {
LABEL_16:
      *a4 = v12;
      uint64_t v16 = 1LL;
      goto LABEL_17;
    }

    size_t v13 = v12 - 1;
    int v14 = MountPoint[--v12];
  }

  while (v14 == 47);
  while (v13 != -1LL)
  {
    int v15 = MountPoint[v13--];
    if (v15 == 47)
    {
      size_t v17 = v13 + 2;
      if (v20) {
        size_t v12 = (size_t)__FSURLCreateWithPathAndAttributes( a1,  (unsigned __int8 *)MountPoint,  v17,  0LL,  0LL,  0LL,  0LL,  (void *)1,  a2,  0,  0,  1,  v20,  0LL);
      }
      else {
        size_t v12 = (size_t)CFURLCreateFromFileSystemRepresentation(a1, (const UInt8 *)MountPoint, v17, 1u);
      }
      goto LABEL_16;
    }
  }

LABEL_12:
  uint64_t v16 = 0LL;
LABEL_17:
  if (v20) {
    MountInfoDestroy(v20);
  }
  return v16;
}

uint64_t GetStatfsByFSID(fsid a1, statfs *a2)
{
  int v4 = getmntinfo_r_np(&v10, 2);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  CFNumberRef v5 = v10;
  if (v4 < 1)
  {
LABEL_7:
    uint64_t v8 = 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v6 = (char *)&v10->f_fsid + 4;
    uint64_t v7 = v4;
    while (*(void *)(v6 - 4) != a1)
    {
      v6 += 2168;
      if (!--v7) {
        goto LABEL_7;
      }
    }

    memmove(a2, v6 - 52, 0x878uLL);
    uint64_t v8 = 0LL;
  }

  free(v5);
  return v8;
}

uint64_t createVolumeFlagValue( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  if ((*(void *)(a5 + 16) & *(void *)(a3 + 32)) != 0LL) {
    uint64_t v7 = (void *)MEMORY[0x189604DE8];
  }
  else {
    uint64_t v7 = (void *)MEMORY[0x189604DE0];
  }
  *a7 = *v7;
  return 1LL;
}

uint64_t createNegatedVolumeFlagValue( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  if ((*(void *)(a5 + 16) & *(void *)(a3 + 32)) != 0LL) {
    uint64_t v7 = (void *)MEMORY[0x189604DE0];
  }
  else {
    uint64_t v7 = (void *)MEMORY[0x189604DE8];
  }
  *a7 = *v7;
  return 1LL;
}

uint64_t createVolumeIsInternalValue( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v7 = *(void *)(a3 + 32) & 0x180LL;
  if (v7 == 256)
  {
    uint64_t v8 = (uint64_t *)MEMORY[0x189604DE0];
  }

  else
  {
    if (v7 != 128)
    {
      uint64_t v9 = 0LL;
      goto LABEL_7;
    }

    uint64_t v8 = (uint64_t *)MEMORY[0x189604DE8];
  }

  uint64_t v9 = *v8;
LABEL_7:
  *a7 = v9;
  return 1LL;
}

uint64_t createVolumeMaximumFileSizeValue( const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, CFNumberRef *a7)
{
  uint64_t v8 = (const void *)(a3 + 48);
  if ((*(void *)(a3 + 48) & 0x8000000000000000LL) != 0)
  {
    CFNumberRef v10 = 0LL;
    uint64_t result = 1LL;
    goto LABEL_5;
  }

  if (a6)
  {
    uint64_t v9 = CFGetAllocator(a1);
    CFNumberRef v10 = CFNumberCreate(v9, kCFNumberSInt64Type, v8);
    uint64_t result = 2LL;
LABEL_5:
    *a7 = v10;
    return result;
  }

  return 0LL;
}

uint64_t createVolumeCreationDateValue( const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, CFDateRef *a7)
{
  if (*(double *)(a3 + 40) == -1.0 - *MEMORY[0x189604DA0])
  {
    CFDateRef v8 = 0LL;
    uint64_t result = 1LL;
LABEL_5:
    *a7 = v8;
    return result;
  }

  if (a6)
  {
    fsid v11 = CFGetAllocator(a1);
    CFDateRef v8 = CFDateCreate(v11, *(CFAbsoluteTime *)(a3 + 40));
    uint64_t result = 2LL;
    goto LABEL_5;
  }

  return 0LL;
}

uint64_t createVolumeUUIDStringValue( const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, CFStringRef *a7)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (a4 == 72)
  {
    if (a6)
    {
      uuid_unparse_upper((const unsigned __int8 *)(a3 + 56), out);
      uint64_t v9 = CFGetAllocator(a1);
      *a7 = CFStringCreateWithCString(v9, out, 0x8000100u);
      return 2LL;
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    *a7 = 0LL;
    return 1LL;
  }

uint64_t createVolumeIdentifierValue( const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, CFDataRef *a7)
{
  v13[1] = *MEMORY[0x1895F89C0];
  uint64_t Attributes = _FileCacheGetAttributes(a2);
  if (*(_DWORD *)(Attributes + 112)) {
    uint64_t v10 = *(unsigned int *)(Attributes + 112);
  }
  else {
    uint64_t v10 = *(void *)(Attributes + 104);
  }
  v13[0] = v10;
  fsid v11 = CFGetAllocator(a1);
  *a7 = CFDataCreate(v11, (const UInt8 *)v13, 8LL);
  return 1LL;
}

uint64_t createVolumeTotalCapacityValue( const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, CFNumberRef *a7)
{
  if (!a6) {
    return 0LL;
  }
  if ((*(_BYTE *)(a3 + 39) & 1) != 0)
  {
    fsid v11 = CFGetAllocator(a1);
    CFNumberRef v9 = CFNumberCreate(v11, kCFNumberSInt64Type, (const void *)(a3 + 16));
  }

  else
  {
    CFNumberRef v9 = 0LL;
  }

  *a7 = v9;
  return 2LL;
}

uint64_t createVolumeAvailableCapacityValue( const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, CFNumberRef *a7)
{
  if (!a6) {
    return 0LL;
  }
  if ((*(_BYTE *)(a3 + 39) & 1) != 0)
  {
    fsid v11 = CFGetAllocator(a1);
    CFNumberRef v9 = CFNumberCreate(v11, kCFNumberSInt64Type, (const void *)(a3 + 24));
  }

  else
  {
    CFNumberRef v9 = 0LL;
  }

  *a7 = v9;
  return 2LL;
}

uint64_t createVolumeResourceCountValue( const void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, int a6, CFNumberRef *a7)
{
  if (!a6) {
    return 0LL;
  }
  uint64_t valuePtr = a3[1] + *a3;
  CFDateRef v8 = CFGetAllocator(a1);
  *a7 = CFNumberCreate(v8, kCFNumberSInt64Type, &valuePtr);
  return 2LL;
}

uint64_t createVolumeDeviceIDValue( const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, CFNumberRef *a7)
{
  if (!a6) {
    return 0LL;
  }
  uint64_t Attributes = _FileCacheGetAttributes(a2);
  uint64_t v10 = CFGetAllocator(a1);
  *a7 = CFNumberCreate(v10, kCFNumberSInt32Type, (const void *)(Attributes + 104));
  return 2LL;
}

uint64_t volumePropertyProviderCopyValues( uint64_t a1, uint64_t a2, const void **a3, void **a4, uint64_t *a5, uint64_t a6)
{
  if ((*(_BYTE *)_FileCacheGetAttributes(a2) & 2) == 0) {
    return 0LL;
  }
  if (a6 >= 1)
  {
    BytePtr = 0LL;
    CFIndex Length = 0LL;
    do
    {
      uint64_t v15 = *a5;
      if (!*(void *)(*a5 + 24)) {
        goto LABEL_17;
      }
      if (CFEqual(*(CFTypeRef *)(v15 + 8), @"__kCFURLNoDependsVolumeInformationKey")) {
        BOOL v16 = 0;
      }
      else {
        BOOL v16 = BytePtr == 0LL;
      }
      if (v16)
      {
        uint64_t result = _FileCacheGetVolumeInfo(a2);
        if (!result) {
          return result;
        }
        size_t v17 = (const __CFData *)result;
        BytePtr = CFDataGetBytePtr((CFDataRef)result);
        CFIndex Length = CFDataGetLength(v17);
      }

      if (CFEqual(*(CFTypeRef *)(v15 + 8), @"__kCFURLExpensiveVolumeInformationKey")
        && (!BytePtr || *(void *)BytePtr == -1LL))
      {
        return 0LL;
      }

      if (!(*(unsigned int (**)(uint64_t, uint64_t, const UInt8 *, CFIndex, uint64_t, void, void **))(v15 + 24))( a1,  a2,  BytePtr,  Length,  v15,  0LL,  a4))
      {
LABEL_17:
        uint64_t result = _FileCacheGetPropertyValueForKey(a2, *a3, a4);
        if (!(_DWORD)result) {
          return result;
        }
        if (*a4) {
          CFRetain(*a4);
        }
      }

      ++a4;
      ++a3;
      ++a5;
      --a6;
    }

    while (a6);
  }

  return 1LL;
}

BOOL volumePropertyProviderPrepareValues( const __CFString *a1, uint64_t a2, uint64_t a3, CFTypeRef **a4, uint64_t a5, uint64_t a6, CFErrorRef *a7)
{
  int v92 = a1;
  uint64_t v100 = *MEMORY[0x1895F89C0];
  char v96 = 0LL;
  uint64_t v11 = MountInfoStorageSize();
  int v89 = (char *)&v72 - ((MEMORY[0x1895F8858](v11) + 15) & 0xFFFFFFFFFFFFFFF0LL);
  _FileCacheLock(a2);
  uint64_t Attributes = (fsid *)_FileCacheGetAttributes(a2);
  if ((Attributes->val[0] & 2) == 0)
  {
    _FileCacheUnlock(a2);
    if (CFURLGetFileSystemRepresentation((CFURLRef)v92, 1u, (UInt8 *)&v99, 1024LL))
    {
      __int128 v97 = xmmword_182EA5338;
      uint64_t v98 = 0LL;
      int v12 = filtered_getattrlist((char *)&v99, &v97, v94, 0xCuLL, 0x21u);
      _FileCacheLock(a2);
      if (v12)
      {
        if (a7)
        {
          size_t v13 = v92;
          int v14 = CFGetAllocator(v92);
          uint64_t v15 = (const __CFString *)*MEMORY[0x189604F58];
          BOOL v16 = __error();
          *a7 = _FSURLCreateStandardError(v14, v15, *v16, 0, v13, 0LL);
        }
      }

      else
      {
        int v19 = v95.val[0];
        int v20 = v92;
        Attributes[13] = v95;
        int32_t MountID = MountInfoPrepare(&v96, 0, v19, v89, 0LL, v20, 0LL);
        if (MountID) {
          int32_t MountID = MountInfoGetMountID((uint64_t)v96);
        }
        uint64_t v22 = Attributes;
        Attributes[14].val[0] = MountID;
        v22->val[0] |= 2u;
      }
    }

    else
    {
      if (a7)
      {
        size_t v17 = v92;
        uint64_t v18 = CFGetAllocator(v92);
        *a7 = _FSURLCreateStandardError(v18, (const __CFString *)*MEMORY[0x189604F40], 4LL, 0, v17, 0LL);
      }

      _FileCacheLock(a2);
    }

    if ((Attributes->val[0] & 2) == 0)
    {
      BOOL v23 = 0;
      goto LABEL_114;
    }
  }

  unsigned int v86 = &v72;
  if (a5 < 1)
  {
    BOOL v87 = 1;
    goto LABEL_113;
  }

  BOOL v84 = a7;
  int v24 = 0;
  int v88 = Attributes[14].val[0];
  int v83 = Attributes[13].val[0];
  uint64_t v25 = (const void *)*MEMORY[0x1896055A0];
  uint64_t v26 = (const void *)*MEMORY[0x189605580];
  unsigned int v85 = (const void *)*MEMORY[0x189604D88];
  f_mntonname = v99.f_mntonname;
  CFTypeRef v82 = (CFTypeRef)*MEMORY[0x189605608];
  CFTypeRef v76 = (const void *)*MEMORY[0x189604DE0];
  int v75 = (const void *)*MEMORY[0x189604DE8];
  CFTypeRef v81 = (CFTypeRef)*MEMORY[0x1896055B8];
  BOOL v27 = (const void *)*MEMORY[0x189605660];
  BOOL v87 = 1;
  unsigned int v79 = (const void *)*MEMORY[0x1896055B0];
  CFAllocatorRef v77 = (CFAllocatorRef)*MEMORY[0x189604DB0];
  BOOL v28 = (const void *)*MEMORY[0x189605598];
  uint64_t v90 = a2;
  CFTypeRef v78 = v27;
  while (1)
  {
    uint64_t v29 = *a4;
    if ((*a4)[3]) {
      goto LABEL_41;
    }
    uint64_t v30 = v25;
    if (CFEqual(*v29, @"__kCFURLCheapVolumeInformationKey"))
    {
      if (!v24 && !_FileCacheGetVolumeInfo(a2))
      {
        prepareCheapVolumeInformation(v92, a2, (uint64_t)v96);
      }

      goto LABEL_39;
    }

    if (!CFEqual(*v29, @"__kCFURLExpensiveVolumeInformationKey"))
    {
      CFAllocatorRef v34 = v85;
      if (CFEqual(*v29, v30))
      {
        if (_FileCacheGetPropertyValueForKey(v90, v30, (void **)v94))
        {
          uint64_t v25 = v30;
LABEL_35:
          a2 = v90;
          goto LABEL_41;
        }

        a2 = v90;
        if (v88)
        {
          uint64_t VolumeName = MountInfoGetVolumeName((uint64_t)v96);
          if (VolumeName)
          {
            uint64_t v38 = (const char *)VolumeName;
            CFAllocatorRef v39 = CFGetAllocator(v92);
            CFStringRef v40 = CFStringCreateWithCString(v39, v38, 0x8000100u);
            uint64_t v41 = a2;
            uint64_t v42 = v30;
            goto LABEL_50;
          }
        }

        uint64_t v35 = a2;
        CFTypeRef v36 = v30;
        goto LABEL_54;
      }

      if (CFEqual(*v29, v26))
      {
        a2 = v90;
        uint64_t v35 = a2;
        CFTypeRef v36 = v26;
        goto LABEL_54;
      }

      if (CFEqual(*v29, v34))
      {
        if (!_FileCacheGetPropertyValueForKey(v90, v34, (void **)v94))
        {
          fsid v44 = Attributes[13];
          if (!GetStatfsByFSID(v44, &v99))
          {
            int8x8_t v51 = CFGetAllocator(v92);
            CFStringRef v40 = CFStringCreateWithCString(v51, f_mntonname, 0x8000100u);
            a2 = v90;
            uint64_t v41 = v90;
            uint64_t v42 = v85;
LABEL_50:
            _FileCacheSetPropertyValueForKey(v41, v42, v40);
            if (v40) {
              CFRelease(v40);
            }
            goto LABEL_40;
          }

          a2 = v90;
          uint64_t v35 = v90;
          CFTypeRef v36 = v85;
LABEL_54:
          CFStringRef v43 = 0LL;
LABEL_55:
          _FileCacheSetPropertyValueForKey(v35, v36, v43);
          goto LABEL_40;
        }

LABEL_86:
            CFStringRef v43 = 0LL;
            goto LABEL_105;
          }
        }

        else
        {
          fsid v55 = Attributes[13];
          StatfsByint FSID = GetStatfsByFSID(v55, &v99);
          MountPoint = f_mntonname;
          a2 = v90;
          if (!StatfsByFSID) {
            goto LABEL_65;
          }
        }

        CFStringRef v43 = 0LL;
        CFTypeRef v36 = v82;
        goto LABEL_105;
      }

      CFTypeRef v50 = v81;
      if (CFEqual(*v29, v81))
      {
        if (v88)
        {
          int v57 = MountInfoPrepare(&v96, v88, v83, v89, 0LL, v92, v84);
          a2 = v90;
          if (!v57) {
            goto LABEL_115;
          }
          int v58 = (char *)MountInfoGetMountPoint((uint64_t)v96);
          if (v58) {
            goto LABEL_84;
          }
        }

        else
        {
          fsid v60 = Attributes[13];
          int v61 = GetStatfsByFSID(v60, &v99);
          int v58 = f_mntonname;
          a2 = v90;
          if (!v61)
          {
LABEL_84:
            __int128 v97 = xmmword_182EA5350;
            uint64_t v98 = 0LL;
            int v59 = filtered_getattrlist(v58, &v97, &v99, 0x24uLL, 0x21u);
            CFStringRef v43 = 0LL;
            CFTypeRef v36 = v81;
            if (v59) {
              goto LABEL_105;
            }
            if ((v99.f_bfree & 0x40000000000000LL) != 0)
            {
              BOOL v49 = (v99.f_iosize & 0x400000) == 0;
              goto LABEL_102;
            }

            goto LABEL_86;
          }
        }

        CFStringRef v43 = 0LL;
        CFTypeRef v36 = v81;
        goto LABEL_105;
      }

      CFTypeRef v52 = v78;
      if (CFEqual(*v29, v78) || CFEqual(*v29, v79))
      {
        a2 = v90;
        if (_FileCacheGetPropertyValueForKey(v90, v52, (void **)v94)
          && _FileCacheGetPropertyValueForKey(a2, v79, (void **)v94))
        {
          goto LABEL_40;
        }

        __int128 v97 = 0uLL;
        unsigned int v93 = 0;
        if (v88)
        {
          if (MountInfoPrepare(&v96, v88, v83, v89, 0LL, v92, v84))
          {
            int v53 = (const char *)MountInfoGetMountPoint((uint64_t)v96);
            int v54 = _FSGetTypeInfoForPath(v53, (char *)&v97, 0x10uLL, &v93);
            goto LABEL_91;
          }
        }

        else
        {
          fsid v62 = Attributes[13];
          if (!GetStatfsByFSID(v62, &v99))
          {
            int v54 = _FSGetTypeInfoFromStatfs((uint64_t)&v99, (char *)&v97, 0x10uLL, &v93);
LABEL_91:
            BOOL v87 = v54 == 0;
          }
        }

        if (!v87) {
          goto LABEL_115;
        }
        *(void *)&v99.f_bsize = v93;
        size_t v63 = strlen((const char *)&v97);
        acl_t v64 = v77;
        CFStringRef v73 = CFStringCreateWithBytes(v77, (const UInt8 *)&v97, v63, 0x8000100u, 0);
        CFNumberRef v74 = CFNumberCreate(v64, kCFNumberSInt64Type, &v99);
        CFStringRef v65 = v73;
        _FileCacheSetPropertyValueForKey(a2, v52, v73);
        if (v65) {
          CFRelease(v65);
        }
        uint64_t v41 = a2;
        uint64_t v42 = v79;
        CFStringRef v40 = (CFStringRef)v74;
        goto LABEL_50;
      }

      int v66 = CFEqual(*v29, v28);
      a2 = v90;
      if (!v66)
      {
        uint64_t v25 = v30;
        goto LABEL_41;
      }

      bzero(&v97, 0x400uLL);
      if (v88)
      {
        if (MountInfoPrepare(&v96, v88, v83, v89, 0LL, v92, v84))
        {
          uint64_t v67 = (const char *)MountInfoGetMountPoint((uint64_t)v96);
          int v68 = _FSGetLocationForPath(v67, (char *)&v97, 0x400uLL);
          goto LABEL_109;
        }
      }

      else
      {
        fsid v69 = Attributes[13];
        if (!GetStatfsByFSID(v69, &v99))
        {
          int v68 = _FSGetLocationFromStatfs((uint64_t)&v99, (char *)&v97, 0x400uLL);
LABEL_109:
          BOOL v87 = v68 == 0;
        }
      }

      if (!v87) {
        goto LABEL_115;
      }
      size_t v70 = strlen((const char *)&v97);
      CFStringRef v40 = CFStringCreateWithBytes(v77, (const UInt8 *)&v97, v70, 0x8000100u, 0);
      uint64_t v41 = a2;
      uint64_t v42 = v28;
      goto LABEL_50;
    }

    if (!v24 && !_FileCacheGetVolumeInfo(a2)) {
      break;
    }
LABEL_29:
    VolumeInfo = (__CFData *)_FileCacheGetVolumeInfo(a2);
    MutableBytePtr = CFDataGetMutableBytePtr(VolumeInfo);
    if (!MutableBytePtr) {
      goto LABEL_39;
    }
    uint64_t v33 = MutableBytePtr;
    uint64_t v25 = v30;
    if (*(void *)MutableBytePtr == -1LL)
    {
      if (v88)
      {
        MountInfoGetMutableVolumeInfo(v96, v33, (void *)v33 + 1, (void *)v33 + 2, (uint64_t *)v33 + 3);
LABEL_39:
        int v24 = 1;
LABEL_40:
        uint64_t v25 = v30;
        goto LABEL_41;
      }

      *(_OWORD *)MutableBytePtr = 0u;
      *((_OWORD *)MutableBytePtr + 1) = 0u;
    }

    int v24 = 1;
LABEL_41:
    ++a4;
    if (!--a5) {
      goto LABEL_113;
    }
  }

  if (!v88 || MountInfoPrepare(&v96, v88, v83, v89, 0LL, v92, v84))
  {
    prepareCheapVolumeInformation(v92, a2, (uint64_t)v96);
    goto LABEL_29;
  }

uint64_t volumePropertyProviderCopyAndCacheValues( uint64_t a1, uint64_t a2, const void **a3, CFTypeRef *a4, uint64_t *a5, uint64_t a6)
{
  if (a6 >= 1)
  {
    uint64_t v6 = a6;
    unsigned __int8 v11 = 0;
    BytePtr = 0LL;
    CFIndex Length = 0LL;
    while (1)
    {
      if (_FileCacheGetPropertyValueForKey(a2, *a3, (void **)a4))
      {
        if (*a4) {
          CFRetain(*a4);
        }
        unsigned __int8 v11 = 1;
      }

      else
      {
        uint64_t v13 = *a5;
        if (*(void *)(*a5 + 24))
        {
          if (CFEqual(*(CFTypeRef *)(v13 + 8), @"__kCFURLNoDependsVolumeInformationKey")) {
            BOOL v14 = 0;
          }
          else {
            BOOL v14 = BytePtr == 0LL;
          }
          if (!v14) {
            goto LABEL_15;
          }
          VolumeInfo = (const __CFData *)_FileCacheGetVolumeInfo(a2);
          if (VolumeInfo)
          {
            BOOL v16 = VolumeInfo;
            BytePtr = CFDataGetBytePtr(VolumeInfo);
            CFIndex Length = CFDataGetLength(v16);
LABEL_15:
            unsigned __int8 v11 = 1;
            if ((*(unsigned int (**)(uint64_t, uint64_t, const UInt8 *, CFIndex, uint64_t, uint64_t, CFTypeRef *))(v13 + 24))( a1,  a2,  BytePtr,  Length,  v13,  1LL,  a4) == 2) {
              _FileCacheSetPropertyValueForKey(a2, *a3, *a4);
            }
            goto LABEL_17;
          }

          BytePtr = 0LL;
          *a4 = 0LL;
        }
      }

uint64_t VolumePropertyProviderSetValues( const __CFString *a1, uint64_t a2, CFTypeRef *a3, uint64_t *a4, uint64_t *a5, uint64_t a6, uint64_t a7, CFErrorRef *a8)
{
  if (a6 < 1) {
    return 1LL;
  }
  uint64_t v8 = a6;
  char v12 = 0;
  uint64_t v13 = (const void *)*MEMORY[0x1896055A0];
  uint64_t v14 = *MEMORY[0x189605018];
  int v15 = 1;
  int v16 = 1;
  do
  {
    uint64_t v17 = *a4;
    if (*a4)
    {
      int v18 = CFEqual(*a3, v13);
      if (v17 != v14 && v18 != 0) {
        char v12 = 1;
      }
    }

    else
    {
      if (!v15) {
        goto LABEL_9;
      }
      uint64_t v20 = *a5;
      if (CFEqual(*(CFTypeRef *)(*a5 + 8), @"__kCFURLCheapVolumeInformationKey"))
      {
        _FileCacheSetVolumeInfo(a2, 0LL);
        int v15 = 0;
        goto LABEL_9;
      }

      if (!v16) {
        goto LABEL_19;
      }
      if (!CFEqual(*(CFTypeRef *)(v20 + 8), @"__kCFURLExpensiveVolumeInformationKey"))
      {
        int v16 = 1;
        goto LABEL_19;
      }

      VolumeInfo = (__CFData *)_FileCacheGetVolumeInfo(a2);
      if (VolumeInfo)
      {
        int v16 = 0;
        *(void *)CFDataGetMutableBytePtr(VolumeInfo) = -1LL;
LABEL_19:
        int v15 = 1;
        goto LABEL_9;
      }

      int v15 = 0;
      int v16 = 1;
    }

void clearPropertyValue(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *(uint64_t *)((char *)a3 + 140);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t *, uint64_t, uint64_t, void))(v5 + 40);
  if (v6)
  {
    uint64_t v8 = *a3;
    uint64_t v10 = 0LL;
    uint64_t v11 = v8;
    uint64_t v9 = *(void *)(v5 + 8);
    _FileCacheIncrementInProvider(a2);
    v6(a1, a2, (uint64_t)(a3 + 1), &v10, &v11, 1LL, v9, 0LL);
    _FileCacheDecrementInProvider(a2);
  }

  _FileCacheClearPropertyValueForKey(a2, (const void *)a3[1]);
}

const void *createBaseCacheWithPathAndAttributes( CFAllocatorRef allocator, char *__src, size_t __n, int a4, _DWORD *a5, attrlist *a6, const void *a7, uint64_t a8, void **a9, __CFError **a10)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  CFIndex v12 = __n;
  if (__n <= 0x3FF)
  {
    int v16 = (int)a7;
    strncpy(v30, __src, __n);
    v30[v12] = 0;
    uint64_t v13 = (const void *)FileCacheCreate(allocator);
    uint64_t Attributes = _FileCacheGetAttributes((uint64_t)v13);
    if (a6)
    {
      int v14 = parseAttributeBuffer(allocator, v30, a5, a6, a8, Attributes, v16);
      if (!v14) {
        return v13;
      }
    }

    else
    {
      attrlist v29 = *(attrlist *)corePropertyAttrListTable;
      if (a4)
      {
        uint64_t v21 = Attributes;
        attrgroup_t commonattr = v29.commonattr | dword_18C463AB4;
        *(int8x16_t *)&v29.volattr = vorrq_s8(*(int8x16_t *)&v29.volattr, unk_18C463AB8);
      }

      else
      {
        uint64_t v21 = Attributes;
        attrgroup_t commonattr = v29.commonattr;
      }

      v29.attrgroup_t commonattr = commonattr | 0x80000000;
      unint64_t v23 = calculateAttributeBufferSize(&v29, 0LL);
      MEMORY[0x1895F8858](v23);
      uint64_t v25 = (_DWORD *)((char *)&v29.bitmapcount - v24);
      else {
        int v14 = parseAttributeBuffer(allocator, __src, &v29, v25, a8, v21, v16);
      }
      if (!v14) {
        return v13;
      }
    }
  }

  else
  {
    uint64_t v13 = 0LL;
    int v14 = 63;
  }

  if (a9)
  {
    BOOL v27 = (const __CFString *)CFURLCreateFromFileSystemRepresentation(allocator, (const UInt8 *)__src, v12, 0);
    *a9 = _FSURLCreateStandardError(allocator, (const __CFString *)*MEMORY[0x189604F58], v14, 0, v27, 0LL);
    if (v27) {
      CFRelease(v27);
    }
  }

  if (v13)
  {
    CFRelease(v13);
    return 0LL;
  }

  return v13;
}

void OUTLINED_FUNCTION_0_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t _URLEnumeratorGetTypeID()
{
  if (_URLEnumeratorGetTypeID::onceToken != -1) {
    dispatch_once(&_URLEnumeratorGetTypeID::onceToken, &__block_literal_global_4);
  }
  return _kCFURLEnumeratorTypeID;
}

uint64_t _URLEnumeratorCreateForDirectoryURL( const __CFAllocator *a1, const void *a2, uint64_t a3, const __CFArray *a4)
{
  uint64_t v8 = _URLEnumeratorCreate(a1);
  uint64_t v9 = v8;
  if (v8)
  {
    *(void *)(v8 + 16) = a1;
    *(void *)(v8 + 32) = a3;
    if (a4)
    {
      MutableCFFileSecurityRef Copy = CFArrayCreateMutableCopy(a1, 0LL, a4);
      a3 = *(void *)(v9 + 32);
    }

    else
    {
      MutableCFFileSecurityRef Copy = 0LL;
    }

    *(void *)(v9 + 40) = MutableCopy;
    if ((a3 & 0x40) == 0)
    {
      if (CFURLIsFileReferenceURL((CFURLRef)a2))
      {
        else {
          unint64_t v11 = *(void *)(v9 + 32) & 0xFFFFFFFFFFFFFFFBLL;
        }
LABEL_11:
        *(void *)(v9 + 32) = v11;
        if ((v11 & 0xE) == 0)
        {
LABEL_30:
          *(void *)(v9 + 48) = CFRetain(a2);
          _SetHashCode((void *)v9);
          return v9;
        }

        CFMutableArrayRef Mutable = *(const __CFArray **)(v9 + 40);
        if (Mutable)
        {
          if ((v11 & 2) == 0) {
            goto LABEL_19;
          }
        }

        else
        {
          CFMutableArrayRef Mutable = CFArrayCreateMutable(a1, 0LL, MEMORY[0x189605228]);
          *(void *)(v9 + 40) = Mutable;
          if ((*(void *)(v9 + 32) & 2) == 0)
          {
LABEL_19:
            if ((*(_BYTE *)(v9 + 32) & 4) != 0)
            {
              CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(v9 + 40));
              int v16 = (const void *)*MEMORY[0x189604D38];
              if (!Count
                || (v23.CFIndex length = Count - 1,
                    v23.CFIndex location = 0LL,
                    !CFArrayContainsValue(*(CFArrayRef *)(v9 + 40), v23, (const void *)*MEMORY[0x189604D38])))
              {
                CFArrayAppendValue(*(CFMutableArrayRef *)(v9 + 40), v16);
              }

              CFIndex v17 = CFArrayGetCount(*(CFArrayRef *)(v9 + 40));
              int v18 = (const void *)*MEMORY[0x189604C10];
              if (!v17
                || (v24.CFIndex length = v17 - 1,
                    v24.CFIndex location = 0LL,
                    !CFArrayContainsValue(*(CFArrayRef *)(v9 + 40), v24, (const void *)*MEMORY[0x189604C10])))
              {
                CFArrayAppendValue(*(CFMutableArrayRef *)(v9 + 40), v18);
              }
            }

            if ((*(_BYTE *)(v9 + 32) & 8) != 0)
            {
              CFIndex v19 = CFArrayGetCount(*(CFArrayRef *)(v9 + 40));
              uint64_t v20 = (const void *)*MEMORY[0x1896053A0];
              if (!v19
                || (v25.CFIndex length = v19 - 1,
                    v25.CFIndex location = 0LL,
                    !CFArrayContainsValue(*(CFArrayRef *)(v9 + 40), v25, (const void *)*MEMORY[0x1896053A0])))
              {
                CFArrayAppendValue(*(CFMutableArrayRef *)(v9 + 40), v20);
              }
            }

            goto LABEL_30;
          }
        }

        CFIndex v13 = CFArrayGetCount(Mutable);
        int v14 = (const void *)*MEMORY[0x189605390];
        if (!v13
          || (v22.CFIndex length = v13 - 1,
              v22.CFIndex location = 0LL,
              !CFArrayContainsValue(*(CFArrayRef *)(v9 + 40), v22, (const void *)*MEMORY[0x189605390])))
        {
          CFArrayAppendValue(*(CFMutableArrayRef *)(v9 + 40), v14);
        }

        goto LABEL_19;
      }

      a3 = *(void *)(v9 + 32);
    }

    unint64_t v11 = a3 & 0xFFFFFFFFFFFFFFFBLL;
    goto LABEL_11;
  }

  return v9;
}

uint64_t _URLEnumeratorCreate(const __CFAllocator *a1)
{
  if (_URLEnumeratorGetTypeID::onceToken != -1) {
    dispatch_once(&_URLEnumeratorGetTypeID::onceToken, &__block_literal_global_4);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v2 = Instance;
  if (Instance) {
    bzero((void *)(Instance + 16), 0x218uLL);
  }
  return v2;
}

CFHashCode _SetHashCode(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v2 = (const void *)a1[5];
  if (v2) {
    v3 ^= CFHash(v2);
  }
  CFHashCode result = a1[6];
  if (result)
  {
    CFHashCode result = CFHash((CFTypeRef)result);
    v3 ^= result;
  }

  a1[3] = v3;
  return result;
}

void *_URLEnumeratorCreateForMountedVolumes(const __CFAllocator *a1, uint64_t a2, const __CFArray *a3)
{
  uint64_t v6 = (void *)_URLEnumeratorCreate(a1);
  uint64_t v7 = v6;
  if (v6)
  {
    v6[2] = a1;
    v6[4] = a2;
    if (a3)
    {
      MutableCFFileSecurityRef Copy = CFArrayCreateMutableCopy(a1, 0LL, a3);
      v7[5] = MutableCopy;
      v7[6] = 0LL;
      uint64_t v9 = (CFArrayRef *)(v7 + 5);
      uint64_t v10 = v7[4];
      if ((v10 & 6) != 0)
      {
        if (MutableCopy)
        {
          if ((v10 & 2) == 0)
          {
LABEL_12:
            if ((v7[4] & 4) != 0)
            {
              CFIndex Count = CFArrayGetCount(*v9);
              int v14 = (const void *)*MEMORY[0x189604D38];
              if (!Count
                || (v19.CFIndex length = Count - 1,
                    v19.CFIndex location = 0LL,
                    !CFArrayContainsValue(*v9, v19, (const void *)*MEMORY[0x189604D38])))
              {
                CFArrayAppendValue(*v9, v14);
              }

              CFIndex v15 = CFArrayGetCount(*v9);
              int v16 = (const void *)*MEMORY[0x189604C10];
              if (!v15
                || (v20.CFIndex length = v15 - 1,
                    v20.CFIndex location = 0LL,
                    !CFArrayContainsValue(*v9, v20, (const void *)*MEMORY[0x189604C10])))
              {
                CFArrayAppendValue(*v9, v16);
              }
            }

            goto LABEL_19;
          }

uint64_t _URLEnumeratorGetNextURL(uint64_t a1, void *a2, CFErrorRef *a3)
{
  if (*(_BYTE *)(a1 + 120)) {
    goto LABEL_2;
  }
  uint64_t v7 = *(void *)(a1 + 48);
  *(void *)(a1 + 104) = 0LL;
  uint64_t v8 = *(const void **)(a1 + 112);
  if (v7)
  {
    if (v8)
    {
      CFRelease(v8);
      *(void *)(a1 + 112) = 0LL;
    }

    if (!*(void *)(a1 + 160)) {
      _InitalizeDirectoryEnumerator(a1);
    }
    if (*(_BYTE *)(a1 + 120))
    {
      *(void *)(a1 + 56) = 0LL;
      if (!a3) {
        return 3LL;
      }
      uint64_t v9 = *(__CFError **)(a1 + 112);
      if (!v9)
      {
LABEL_38:
        *a3 = v9;
        if (!v9)
        {
LABEL_39:
          BOOL v16 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
          if (v16) {
            _URLEnumeratorGetNextURL_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
          }
          *a3 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 256LL, 0LL);
        }

        return 3LL;
      }
    }

    else
    {
      while (1)
      {
        uint64_t v10 = *(void *)(a1 + 88);
        if (v10 < *(void *)(a1 + 80))
        {
          if (*(_BYTE *)(a1 + v10 + 488)) {
            uint64_t result = 4LL;
          }
          else {
            uint64_t result = 1LL;
          }
          if (a2)
          {
            uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8 * v10);
            *(void *)(a1 + 104) = v11;
            *a2 = v11;
            *(void *)(a1 + 56) = *(void *)(a1 + 8 * v10 + 168);
          }

          *(void *)(a1 + 88) = v10 + 1;
          return result;
        }

        uint64_t v9 = *(__CFError **)(a1 + 96);
        if (v9) {
          break;
        }
      }

      *(void *)(a1 + 112) = v9;
      *(void *)(a1 + 56) = *(void *)(a1 + 528);
      *(void *)(a1 + 96) = 0LL;
      if (!a3) {
        return 3LL;
      }
    }

    uint64_t v9 = (__CFError *)CFRetain(v9);
    goto LABEL_38;
  }

  if (v8)
  {
    CFRelease(v8);
    *(void *)(a1 + 112) = 0LL;
  }

  if (!*(void *)(a1 + 72)) {
    _InitalizeVolumeEnumerator(a1);
  }
  if (*(_BYTE *)(a1 + 120) || (uint64_t v13 = *(void *)(a1 + 72)) == 0)
  {
    if (!a3) {
      return 3LL;
    }
    CFIndex v12 = *(void **)(a1 + 112);
    if (v12) {
      CFIndex v12 = (void *)CFRetain(v12);
    }
    *a3 = (CFErrorRef)v12;
    *(void *)(a1 + 56) = 0LL;
    if (v12) {
      return 3LL;
    }
    goto LABEL_39;
  }

  uint64_t v14 = *(void *)(a1 + 88);
  if (v14 >= *(void *)(a1 + 80))
  {
LABEL_2:
    *(void *)(a1 + 56) = 0LL;
    return 2LL;
  }

  *(void *)(a1 + 56) = 1LL;
  if (a2)
  {
    uint64_t v15 = *(void *)(v13 + 8 * v14);
    *(void *)(a1 + 104) = v15;
    *a2 = v15;
  }

  *(void *)(a1 + 88) = v14 + 1;
  return 1LL;
}

uint64_t _URLEnumeratorGetURLsBulk(uint64_t a1, uint64_t a2, void *a3, void *a4, CFErrorRef *a5)
{
  if (*(_BYTE *)(a1 + 120)) {
    goto LABEL_2;
  }
  if (*(void *)(a1 + 48))
  {
    *(void *)(a1 + 56) = 0LL;
    *a3 = 0LL;
    *(void *)(a1 + 104) = 0LL;
    uint64_t v11 = *(const void **)(a1 + 112);
    if (v11)
    {
      CFRelease(v11);
      *(void *)(a1 + 112) = 0LL;
    }

    if (!*(void *)(a1 + 160)) {
      _InitalizeDirectoryEnumerator(a1);
    }
    if (!*(_BYTE *)(a1 + 120))
    {
      uint64_t i = 2LL;
      while (1)
      {
        uint64_t v12 = *(void *)(a1 + 88);
        if (v12 < *(void *)(a1 + 80))
        {
          *(void *)(a1 + 56) = *(void *)(a1 + 8 * v12 + 168);
          if (!a2) {
            return 2LL;
          }
          uint64_t v27 = a2 - 1;
          do
          {
            int v28 = *(unsigned __int8 *)(a1 + v12 + 488);
            ++*a3;
            uint64_t v29 = *(void *)(a1 + 80);
            uint64_t v30 = *(void *)(*(void *)(a1 + 72) + 8 * v12);
            *(void *)(a1 + 104) = v30;
            *a4 = v30;
            uint64_t v12 = *(void *)(a1 + 88) + 1LL;
            *(void *)(a1 + 88) = v12;
            if (v12 >= v29) {
              break;
            }
            ++a4;
          }

          while (v28 == *(unsigned __int8 *)(a1 + v12 + 488) && v27-- != 0);
          if (v28) {
            return 4LL;
          }
          else {
            return 1LL;
          }
        }

        uint64_t v13 = *(const void **)(a1 + 96);
        if (v13) {
          break;
        }
      }

      *(void *)(a1 + 112) = v13;
      *(void *)(a1 + 96) = 0LL;
      if (a5) {
        goto LABEL_22;
      }
      return 3LL;
    }

LABEL_20:
    *(void *)(a1 + 56) = 0LL;
    if (a5)
    {
      uint64_t v13 = *(const void **)(a1 + 112);
      if (!v13)
      {
        *a5 = 0LL;
LABEL_25:
        BOOL v16 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
        if (v16) {
          _URLEnumeratorGetURLsBulk_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
        }
        *a5 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x189604DB0], (CFErrorDomain)*MEMORY[0x189604F40], 256LL, 0LL);
        return 3LL;
      }

uint64_t _URLEnumeratorSkipDescendents(uint64_t result)
{
  if (*(void *)(result + 48))
  {
    if ((*(_BYTE *)(result + 32) & 1) != 0)
    {
      uint64_t result = *(void *)(result + 160);
      if (result)
      {
        uint64_t v1 = *(void *)(result + 1840);
        if (v1)
        {
          if (*(_DWORD *)(v1 + 48) == 1) {
            return DirEnumSkipDescendents(result);
          }
        }
      }
    }
  }

  return result;
}

uint64_t _URLEnumeratorGetDescendentLevel(uint64_t a1)
{
  return *(void *)(a1 + 56);
}

uint64_t _URLEnumeratorGetSourceDidChange()
{
  return 0LL;
}

void _URLEnumeratorFinalize(const void *a1)
{
  uint64_t v2 = (const void *)*((void *)a1 + 5);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)*((void *)a1 + 6);
  if (v3) {
    CFRelease(v3);
  }
  int v4 = (void *)*((void *)a1 + 9);
  if (v4)
  {
    if (*((uint64_t *)a1 + 10) >= 1)
    {
      uint64_t v5 = 0LL;
      do
        CFRelease(*(CFTypeRef *)(*((void *)a1 + 9) + 8 * v5++));
      while (v5 < *((void *)a1 + 10));
      int v4 = (void *)*((void *)a1 + 9);
    }

    CFAllocatorDeallocate(*((CFAllocatorRef *)a1 + 2), v4);
  }

  uint64_t v6 = (const void *)*((void *)a1 + 8);
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = (const void *)*((void *)a1 + 12);
  if (v7) {
    CFRelease(v7);
  }
  uint64_t v8 = (const void *)*((void *)a1 + 14);
  if (v8) {
    CFRelease(v8);
  }
  uint64_t v9 = (void *)*((void *)a1 + 20);
  if (v9) {
    DirEnumClose(v9);
  }
  uint64_t v10 = (const void *)*((void *)a1 + 67);
  if (v10) {
    CFRelease(v10);
  }
}

uint64_t _URLEnumeratorEqual(void *a1, void *a2)
{
  uint64_t v5 = a1[4] == a2[4] && a1[3] == a2[3];
  uint64_t v6 = (const void *)a1[5];
  uint64_t v7 = (const void *)a2[5];
  if (v6)
  {
    if (!v7 || !CFEqual(v6, v7)) {
      uint64_t v5 = 0LL;
    }
  }

  else if (v7)
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    uint64_t v5 = v5;
  }

  uint64_t v8 = (const void *)a1[6];
  uint64_t v9 = (const void *)a2[6];
  if (v8)
  {
    if (!v9 || !CFEqual(v8, v9)) {
      return 0LL;
    }
  }

  else if (v9)
  {
    return 0LL;
  }

  else
  {
    return v5;
  }

  return v5;
}

uint64_t _URLEnumeratorHash(void *a1)
{
  return a1[3];
}

__CFString *_URLEnumeratorCopyDebugDesc(const void *a1)
{
  uint64_t v2 = CFGetAllocator(a1);
  CFMutableArrayRef Mutable = CFStringCreateMutable(v2, 0LL);
  CFStringAppendFormat( Mutable,  0LL,  @"<CFURLEnumerator %p>{enumeratorOptions = %ld, propertyKeys = %@",  a1,  *((void *)a1 + 4),  *((void *)a1 + 5));
  if (*((void *)a1 + 6)) {
    CFStringAppendFormat( Mutable,  0LL,  @", directoryURL = %@, currentLevel = %ld",  *((void *)a1 + 6),  *((void *)a1 + 7));
  }
  if (*((void *)a1 + 14))
  {
    CFStringAppendFormat(Mutable, 0LL, @", currentError = %@", *((void *)a1 + 14));
  }

  else if (*((void *)a1 + 13))
  {
    CFStringAppendFormat(Mutable, 0LL, @", currentURL = %@", *((void *)a1 + 13));
  }

  CFStringAppend(Mutable, @"}");
  return Mutable;
}

CFErrorRef _InitalizeDirectoryEnumerator(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1895F8858](a1);
  uint64_t v48 = *MEMORY[0x1895F89C0];
  *(_DWORD *)(v1 + 152) = _CFGetEUID();
  uint64_t v2 = (_OWORD *)MEMORY[0x186E19944](*(void *)(v1 + 16), 320LL, 0LL);
  *(void *)(v1 + 72) = v2;
  if (!v2)
  {
    int v4 = *(const __CFAllocator **)(v1 + 16);
    uint64_t v5 = (const __CFString *)*MEMORY[0x189604F58];
    uint64_t v7 = 12LL;
    uint64_t v6 = 0LL;
    goto LABEL_11;
  }

  v2[18] = 0u;
  v2[19] = 0u;
  v2[16] = 0u;
  v2[17] = 0u;
  v2[14] = 0u;
  v2[15] = 0u;
  v2[12] = 0u;
  v2[13] = 0u;
  v2[10] = 0u;
  v2[11] = 0u;
  v2[8] = 0u;
  v2[9] = 0u;
  v2[6] = 0u;
  v2[7] = 0u;
  v2[4] = 0u;
  v2[5] = 0u;
  v2[2] = 0u;
  v2[3] = 0u;
  _OWORD *v2 = 0u;
  v2[1] = 0u;
  if (!CFURLGetFileSystemRepresentation(*(CFURLRef *)(v1 + 48), 1u, buffer, 1024LL))
  {
    int v4 = *(const __CFAllocator **)(v1 + 16);
    uint64_t v5 = (const __CFString *)*MEMORY[0x189604F58];
    uint64_t v6 = *(const __CFString **)(v1 + 48);
    uint64_t v7 = 63LL;
    goto LABEL_11;
  }

  __int128 v41 = xmmword_182EA53B4;
  uint64_t v42 = 0LL;
  if (filtered_getattrlist((char *)buffer, &v41, v43, 0x428uLL, 0x29u))
  {
    __dst[0] = 0;
    int v3 = *__error();
    if (!v3)
    {
LABEL_5:
      int v4 = *(const __CFAllocator **)(v1 + 16);
      uint64_t v5 = (const __CFString *)*MEMORY[0x189604F58];
      uint64_t v6 = *(const __CFString **)(v1 + 48);
      uint64_t v7 = 20LL;
LABEL_11:
      CFErrorRef result = _FSURLCreateStandardError(v4, v5, v7, 0, v6, 0LL);
      goto LABEL_12;
    }

LABEL_10:
    int v4 = *(const __CFAllocator **)(v1 + 16);
    uint64_t v5 = (const __CFString *)*MEMORY[0x189604F58];
    uint64_t v7 = v3;
    uint64_t v6 = *(const __CFString **)(v1 + 48);
    goto LABEL_11;
  }

  if ((v44 & 8) == 0)
  {
    __dst[0] = 0;
    int v3 = 22;
    goto LABEL_10;
  }

  int v9 = v46;
  int v10 = v45;
  BOOL v11 = v46 == 2;
  strlcpy((char *)__dst, (const char *)v47 + v47[0], 0x400uLL);
  if (v9 == 5)
  {
    uint64_t v12 = *(const __CFAllocator **)(v1 + 16);
    uint64_t v13 = *(const __CFURL **)(v1 + 48);
    uint64_t v14 = CFURLCreateWithFileSystemPath(v12, @"/private/", kCFURLPOSIXPathStyle, 1u);
    if (!v14) {
      goto LABEL_5;
    }
    uint64_t v15 = v14;
    BOOL v16 = (const __CFString *)*MEMORY[0x189605310];
    if (CFURLCopyResourcePropertyForKey(v14, (CFStringRef)*MEMORY[0x189605310], &propertyValueTypeRefPtr, 0LL)
      && propertyValueTypeRefPtr)
    {
      if (CFURLGetFileSystemRepresentation(v13, 1u, v43, 1024LL)
        && (size_t v17 = strlen((const char *)v43), (v18 = CFURLCreateFromFileSystemRepresentation(v12, v43, v17, 0)) != 0LL))
      {
        CFURLRef v19 = v18;
        ssize_t v20 = readlink((const char *)v43, (char *)&v41, 0x400uLL);
        if (v20 < 0 || (uint64_t v21 = (const __CFURL *)MEMORY[0x186E19FA4](v12, &v41, v20, 0LL, v19)) == 0LL)
        {
          uint64_t v23 = 0LL;
        }

        else
        {
          uint64_t v22 = v21;
          uint64_t v23 = 0LL;
          if (CFURLCopyResourcePropertyForKey(v21, (CFStringRef)*MEMORY[0x189605440], &url, 0LL) && url)
          {
            uint64_t v23 = 0LL;
            if (CFURLCopyResourcePropertyForKey(url, v16, &cf1, 0LL) && cf1)
            {
              if (CFEqual(cf1, propertyValueTypeRefPtr)) {
                uint64_t v23 = CFURLCopyAbsoluteURL(v22);
              }
              else {
                uint64_t v23 = 0LL;
              }
              CFRelease(cf1);
            }

            CFRelease(url);
          }

          CFRelease(v22);
        }

        CFRelease(v19);
      }

      else
      {
        uint64_t v23 = 0LL;
      }

      CFRelease(propertyValueTypeRefPtr);
      CFRelease(v15);
      if (!v23) {
        goto LABEL_5;
      }
      if (CFURLGetFileSystemRepresentation(v23, 1u, buffer, 1024LL))
      {
        __int128 v41 = xmmword_182EA53B4;
        uint64_t v42 = 0LL;
        if (filtered_getattrlist((char *)buffer, &v41, v43, 0x428uLL, 0x29u))
        {
          __dst[0] = 0;
          if (!*__error())
          {
            BOOL v11 = 0;
            int v10 = 0;
LABEL_47:
            CFRelease(*(CFTypeRef *)(v1 + 48));
            *(void *)(v1 + 48) = v23;
            goto LABEL_48;
          }
        }

        else
        {
          if ((v44 & 8) != 0)
          {
            int v10 = v45;
            BOOL v11 = v46 == 2;
            strlcpy((char *)__dst, (const char *)v47 + v47[0], 0x400uLL);
            goto LABEL_47;
          }

          __dst[0] = 0;
        }
      }

      CFRange v24 = v23;
    }

    else
    {
      CFRange v24 = v15;
    }

    CFRelease(v24);
    goto LABEL_5;
  }

LABEL_48:
  if (!v11) {
    goto LABEL_5;
  }
  if (!v10)
  {
    int v4 = *(const __CFAllocator **)(v1 + 16);
    uint64_t v5 = (const __CFString *)*MEMORY[0x189604F58];
    uint64_t v6 = *(const __CFString **)(v1 + 48);
    uint64_t v7 = 2LL;
    goto LABEL_11;
  }

  *(_WORD *)(v1 + 128) = 5;
  *(void *)(v1 + 138) = 0LL;
  *(void *)(v1 + 130) = 0LL;
  *(void *)(v1 + 144) = 0LL;
  *(_BYTE *)(v1 + 121) = _FSURLGetAttrListForPropertyKeys( 0,  *(CFArrayRef *)(v1 + 40),  v1 + 128,  (__CFArray **)(v1 + 64),  (Boolean *)(v1 + 122));
  int v25 = *(_DWORD *)(v1 + 132);
  *(_DWORD *)(v1 + 132) = v25 & 0xF7FFFFFF;
  uint64_t v26 = *(const __CFArray **)(v1 + 64);
  if (v26)
  {
    v49.CFIndex length = CFArrayGetCount(*(CFArrayRef *)(v1 + 64));
    v49.CFIndex location = 0LL;
    BOOL v27 = CFArrayContainsValue(v26, v49, (const void *)*MEMORY[0x189605448]) != 0;
  }

  else
  {
    BOOL v27 = 0;
  }

  *(_BYTE *)(v1 + 123) = v27;
  if ((v25 & 0x8000000) != 0)
  {
    BOOL v29 = 1;
  }

  else
  {
    int v28 = *(const __CFArray **)(v1 + 40);
    if (v28)
    {
      v50.CFIndex length = CFArrayGetCount(*(CFArrayRef *)(v1 + 40));
      v50.CFIndex location = 0LL;
      BOOL v29 = CFArrayContainsValue(v28, v50, (const void *)*MEMORY[0x189605298]) != 0;
    }

    else
    {
      BOOL v29 = 0;
    }
  }

  *(_BYTE *)(v1 + 124) = v29;
  if ((*(_BYTE *)(v1 + 32) & 0x40) != 0)
  {
    size_t v30 = strlen((const char *)__dst);
    *(void *)(v1 + 544) = v30;
    *(void *)(v1 + 536) = CFURLCreateFromFileSystemRepresentation(*(CFAllocatorRef *)(v1 + 16), __dst, v30, 1u);
    uint64_t v31 = *(void *)(v1 + 544);
    if (__dst[v31 - 1] != 47) {
      *(void *)(v1 + 544) = v31 + 1;
    }
  }

  if (*(_BYTE *)(v1 + 121)) {
    CFURLRef v32 = (__int128 *)(v1 + 128);
  }
  else {
    CFURLRef v32 = 0LL;
  }
  uint64_t v33 = DirEnumOpen((const char *)__dst, v32);
  *(void *)(v1 + 160) = v33;
  if (!v33)
  {
    CFAllocatorRef v34 = *(const __CFAllocator **)(v1 + 16);
    uint64_t v35 = __error();
    CFErrorRef result = _CFErrorWithPOSIXPathAndErrno(v34, *v35, (const char *)__dst);
LABEL_12:
    *(void *)(v1 + 112) = result;
    if (!result) {
      return result;
    }
    goto LABEL_13;
  }

  CFErrorRef result = *(CFErrorRef *)(v1 + 112);
  if (result) {
LABEL_13:
  }
    *(_BYTE *)(v1 + 120) = 1;
  return result;
}

uint64_t _GetDirectoryURLs(uint64_t a1)
{
  v40[1] = *(void ***)MEMORY[0x1895F89C0];
  v40[0] = 0LL;
  uint64_t v2 = MountInfoStorageSize();
  int v3 = (char *)&v34 - ((MEMORY[0x1895F8858](v2) + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int v4 = *(_OWORD **)(a1 + 72);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = (uint64_t *)(a1 + 80);
  if (*(uint64_t *)(a1 + 80) >= 1)
  {
    uint64_t v6 = 0LL;
    do
      CFRelease(*(CFTypeRef *)(*(void *)(a1 + 72) + 8 * v6++));
    while (v6 < *(void *)(a1 + 80));
    int v4 = *(_OWORD **)(a1 + 72);
  }

  v4[18] = 0u;
  v4[19] = 0u;
  v4[16] = 0u;
  v4[17] = 0u;
  v4[14] = 0u;
  v4[15] = 0u;
  v4[12] = 0u;
  v4[13] = 0u;
  v4[10] = 0u;
  v4[11] = 0u;
  v4[8] = 0u;
  v4[9] = 0u;
  v4[6] = 0u;
  v4[7] = 0u;
  v4[4] = 0u;
  v4[5] = 0u;
  v4[2] = 0u;
  v4[3] = 0u;
  *int v4 = 0u;
  v4[1] = 0u;
  *(void *)(a1 + 520) = 0LL;
  *(_OWORD *)(a1 + 488) = 0u;
  *(_OWORD *)(a1 + 504) = 0u;
  uint64_t *v5 = 0LL;
  *(void *)(a1 + 88) = 0LL;
  if (*(_BYTE *)(a1 + 121))
  {
    int v7 = *(_DWORD *)(*(void *)(a1 + 160) + 1792LL);
    if (v7)
    {
    }
  }

  CFAllocatorRef v39 = 0LL;
  uint64_t v8 = DirEnumRead(*(void *)(a1 + 160));
  if (!v8)
  {
    unsigned __int8 v10 = 0;
    goto LABEL_85;
  }

  uint64_t v9 = v8;
  unsigned __int8 v10 = 0;
  BOOL v11 = (const __CFString *)*MEMORY[0x189605390];
  uint64_t v35 = (const __CFString *)*MEMORY[0x1896053A0];
  while (1)
  {
    unsigned int v12 = *(_DWORD *)(v9 + 48);
    if (v12 > 6) {
      goto LABEL_76;
    }
    int v13 = 1 << v12;
    if (((1 << v12) & 6) != 0)
    {
      if (!*(_DWORD *)(v9 + 44)) {
        goto LABEL_76;
      }
      if (v12 != 1) {
        goto LABEL_52;
      }
      if ((*(_BYTE *)(a1 + 32) & 1) != 0) {
        goto LABEL_22;
      }
      DirEnumSkipDescendents(*(void *)(a1 + 160));
      unsigned int v12 = *(_DWORD *)(v9 + 48);
      if (v12 == 2)
      {
LABEL_52:
        if ((*(_BYTE *)(a1 + 32) & 0x20) == 0) {
          goto LABEL_76;
        }
        int v18 = 0;
        int v17 = 1;
        goto LABEL_28;
      }

      if (v12 == 1)
      {
LABEL_22:
        if ((*(void *)(a1 + 32) & 0x30LL) == 0x20) {
          goto LABEL_76;
        }
        int v17 = 0;
        int v18 = 1;
        goto LABEL_28;
      }
    }

    else if ((v13 & 0x18) == 0)
    {
      if ((v13 & 0x60) == 0) {
        goto LABEL_76;
      }
      uint64_t v14 = *(const __CFAllocator **)(a1 + 16);
      int v15 = *(_DWORD *)(v9 + 40);
      BOOL v16 = *(const char **)(v9 + 8);
      goto LABEL_55;
    }

    int v18 = 0;
    int v17 = 0;
LABEL_28:
    if (*(_BYTE *)(a1 + 121) && *(void *)(v9 + 56)) {
      break;
    }
    uint64_t v25 = MEMORY[0x186E19FA4]( *(void *)(a1 + 16),  *(void *)(v9 + 8) + *(void *)(a1 + 544),  *(void *)(v9 + 16) - *(void *)(a1 + 544),  v18 | v17,  *(void *)(a1 + 536));
    if (!v25)
    {
      uint64_t v14 = *(const __CFAllocator **)(a1 + 16);
      BOOL v16 = *(const char **)(v9 + 8);
      int v15 = 63;
LABEL_55:
      CFErrorRef v30 = _CFErrorWithPOSIXPathAndErrno(v14, v15, v16);
      if (v30) {
        goto LABEL_83;
      }
      goto LABEL_77;
    }

    uint64_t v21 = (const __CFURL *)v25;
    uint64_t v26 = *(const __CFArray **)(a1 + 64);
    if (v26)
    {
      BOOL v27 = (const void *)__CFURLResourceInfoPtr();
      _FSURLCacheResourcePropertiesForKeys(v21, v26, v27, 0LL);
    }

LABEL_83:
  *(void *)(a1 + 96) = v30;
  *(void *)(a1 + 528) = *(unsigned int *)(v9 + 44);
LABEL_84:
  unsigned __int8 v10 = 1;
LABEL_85:
  MountInfoDestroy(v40[0]);
  return v10;
}

CFErrorRef _CFErrorWithPOSIXPathAndErrno(CFAllocatorRef alloc, int a2, const char *cStr)
{
  if (cStr)
  {
    uint64_t v6 = CFStringCreateWithCString(alloc, cStr, 0x8000100u);
    if (!v6) {
      uint64_t v6 = CFStringCreateWithCString(alloc, cStr, 0);
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  CFErrorRef v7 = _FSURLCreateStandardError(alloc, (const __CFString *)*MEMORY[0x189604F58], a2, 0, v6, 0LL);
  if (v6) {
    CFRelease(v6);
  }
  return v7;
}

CFErrorRef _InitalizeVolumeEnumerator(uint64_t a1)
{
  *(_DWORD *)(a1 + 152) = _CFGetEUID();
  int v2 = CreateMountPointArray(*(void *)(a1 + 16), *(void *)(a1 + 32), (uint64_t *)&ptr, &v4);
  if (v2)
  {
    CFErrorRef result = _FSURLCreateStandardError( *(const __CFAllocator **)(a1 + 16),  (const __CFString *)*MEMORY[0x189604F58],  v2,  0,  0LL,  0LL);
    *(void *)(a1 + 112) = result;
    if (!result) {
      return result;
    }
  }

  else
  {
    _CreateVolumeURLsArray(a1, (char *)ptr, v4);
    CFAllocatorDeallocate(*(CFAllocatorRef *)(a1 + 16), ptr);
    CFErrorRef result = *(CFErrorRef *)(a1 + 112);
    if (!result) {
      return result;
    }
  }

  *(_BYTE *)(a1 + 120) = 1;
  return result;
}

void _CreateVolumeURLsArray(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  size_t v5 = 8 * a3;
  uint64_t v6 = (void *)MEMORY[0x186E19944](*(void *)(a1 + 16), 8 * a3, 0LL);
  *(void *)(a1 + 72) = v6;
  if (!v6) {
    goto LABEL_12;
  }
  bzero(v6, v5);
  *(_WORD *)(a1 + 128) = 5;
  *(void *)(a1 + 138) = 0LL;
  *(void *)(a1 + 130) = 0LL;
  *(void *)(a1 + 144) = 0LL;
  uint64_t v35 = (const __CFArray **)(a1 + 64);
  *(_BYTE *)(a1 + 121) = _FSURLGetAttrListForPropertyKeys( 0,  *(CFArrayRef *)(a1 + 40),  a1 + 128,  (__CFArray **)(a1 + 64),  (Boolean *)(a1 + 122));
  *(_DWORD *)(a1 + 132) &= ~0x8000000u;
  CFErrorRef v7 = *(const __CFArray **)(a1 + 64);
  if (v7)
  {
    v41.CFIndex length = CFArrayGetCount(*(CFArrayRef *)(a1 + 64));
    v41.CFIndex location = 0LL;
    BOOL v8 = CFArrayContainsValue(v7, v41, (const void *)*MEMORY[0x189605448]) != 0;
  }

  else
  {
    BOOL v8 = 0;
  }

  *(_BYTE *)(a1 + 123) = v8;
  uint64_t v9 = *(const __CFArray **)(a1 + 40);
  if (v9)
  {
    v42.CFIndex length = CFArrayGetCount(*(CFArrayRef *)(a1 + 40));
    v42.CFIndex location = 0LL;
    BOOL v10 = CFArrayContainsValue(v9, v42, (const void *)*MEMORY[0x189605298]) != 0;
  }

  else
  {
    BOOL v10 = 0;
  }

  *(_BYTE *)(a1 + 124) = v10;
  if (!*(_BYTE *)(a1 + 121)
    || (BOOL v11 = _FSURLCalculateAttributeBufferSize((const attrlist *)(a1 + 128)), !*(_BYTE *)(a1 + 121)))
  {
    uint64_t v14 = 0LL;
    p_attrgroup_t forkattr = 0LL;
    char v36 = 1;
    goto LABEL_14;
  }

  *(_DWORD *)(a1 + 132) |= 0x80000000;
  p_attrgroup_t forkattr = (size_t)&v11->forkattr;
  int v13 = (attrlist *)malloc((size_t)&v11->forkattr);
  if (!v13)
  {
LABEL_12:
    *(void *)(a1 + 112) = _FSURLCreateStandardError( *(const __CFAllocator **)(a1 + 16),  (const __CFString *)*MEMORY[0x189604F58],  12LL,  0,  0LL,  0LL);
    return;
  }

  uint64_t v14 = v13;
  char v36 = 0;
LABEL_14:
  *(void *)(a1 + 80) = 0LL;
  if (a3 >= 1)
  {
    uint64_t v15 = 0LL;
    uint64_t v34 = (const __CFString *)*MEMORY[0x189605390];
    do
    {
      CFAllocatorRef v39 = 0LL;
      uint64_t v16 = MountInfoStorageSize();
      MEMORY[0x1895F8858](v16);
      if ((v36 & 1) != 0)
      {
        size_t v17 = strlen(a2);
        int v18 = CFURLCreateFromFileSystemRepresentation(*(CFAllocatorRef *)(a1 + 16), (const UInt8 *)a2, v17, 1u);
        if (v18)
        {
          CFURLRef v19 = v18;
          if (v39) {
            _FSURLCacheCheapVolumeInformationForVolume(v18, (uint64_t)v39);
          }
          CFURLRef v20 = *v35;
          if (*v35)
          {
            uint64_t v21 = (const void *)__CFURLResourceInfoPtr();
            _FSURLCacheResourcePropertiesForKeys(v19, v20, v21, 0LL);
          }

          uint64_t v22 = *(void *)(a1 + 80);
          *(void *)(*(void *)(a1 + 72) + 8 * v22) = v19;
          *(void *)(a1 + 80) = v22 + 1;
        }

        size_t v23 = p_forkattr;
        goto LABEL_31;
      }

      if (filtered_getattrlist(a2, (_DWORD *)(a1 + 128), v14, p_forkattr, 0x25u))
      {
        size_t v23 = p_forkattr;
        goto LABEL_28;
      }

      size_t v23 = *(unsigned int *)&v14->bitmapcount;
      if (p_forkattr >= v23)
      {
        size_t v23 = p_forkattr;
      }

      else
      {
        BOOL v27 = (attrlist *)realloc(v14, *(unsigned int *)&v14->bitmapcount);
        if (!v27) {
          goto LABEL_28;
        }
        uint64_t v14 = v27;
      }

      size_t v28 = strlen(a2);
      uint64_t v29 = _FSURLCreateWithPathAndAttributes( *(const __CFAllocator **)(a1 + 16),  (unsigned __int8 *)a2,  v28,  0LL,  0LL,  (attrlist *)(a1 + 128),  v14,  (*(_BYTE *)(a1 + 32) & 4) != 0,  *(_WORD *)(a1 + 123),  HIBYTE(*(_WORD *)(a1 + 123)),  v33,  1,  v39,  0LL);
      if (v29)
      {
        CFErrorRef v30 = v29;
        if ((*(_BYTE *)(a1 + 32) & 2) != 0
          && CFURLCopyResourcePropertyForKey(v29, v34, &propertyValueTypeRefPtr, 0LL)
          && propertyValueTypeRefPtr)
        {
          if (CFBooleanGetValue(propertyValueTypeRefPtr))
          {
            CFRelease(v30);
            CFRelease(propertyValueTypeRefPtr);
            goto LABEL_31;
          }

          CFRelease(propertyValueTypeRefPtr);
        }

        if (v39) {
          _FSURLCacheCheapVolumeInformationForVolume(v30, (uint64_t)v39);
        }
        uint64_t v31 = *v35;
        if (*v35)
        {
          CFBooleanRef v32 = (const void *)__CFURLResourceInfoPtr();
          _FSURLCacheResourcePropertiesForKeys(v30, v31, v32, 0LL);
        }

        uint64_t v26 = *(void *)(a1 + 80);
        *(void *)(*(void *)(a1 + 72) + 8 * v26) = v30;
        goto LABEL_30;
      }

LABEL_28:
      size_t v24 = strlen(a2);
      CFURLRef v25 = CFURLCreateFromFileSystemRepresentation(*(CFAllocatorRef *)(a1 + 16), (const UInt8 *)a2, v24, 1u);
      if (v25)
      {
        uint64_t v26 = *(void *)(a1 + 80);
        *(void *)(*(void *)(a1 + 72) + 8 * v26) = v25;
LABEL_30:
        *(void *)(a1 + 80) = v26 + 1;
      }

void CacheItem::CacheItem(CacheItem *this, const __CFData *a2)
{
  *((void *)this + 3) = 0LL;
  *(void *)this = 0LL;
  *((void *)this + 1) = 0LL;
  if (a2) {
    CFDataRef Copy = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
  }
  else {
    CFDataRef Copy = 0LL;
  }
  *((void *)this + 2) = Copy;
}

void CacheItem::~CacheItem(CacheItem *this)
{
  uint64_t v1 = (const void *)*((void *)this + 2);
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t append(uint64_t result, CacheItem *a2)
{
  if (!result) {
    append();
  }
  if (!a2) {
    append();
  }
  do
  {
    uint64_t v2 = result;
    CFErrorRef result = *(void *)(result + 24);
  }

  while (result);
  *(void *)(v2 + 24) = a2;
  return result;
}

void remove(CacheItem *a1, CacheItem *a2)
{
  if (!a1) {
    remove();
  }
  if (!a2) {
    remove();
  }
  while (a1)
  {
    int v3 = a1;
    a1 = (CacheItem *)*((void *)a1 + 3);
    if (a1 == a2)
    {
      *((void *)v3 + 3) = *((void *)a2 + 3);
      *((void *)a2 + 3) = 0LL;
      return;
    }
  }

  uint64_t v4 = (os_log_s *)securityScopedLog;
  if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR)) {
    remove((uint64_t)a2, v4);
  }
}

uint64_t SandboxExtensionCache::shared(SandboxExtensionCache *this)
{
  return SandboxExtensionCache::shared(void)::shared;
}

CFMutableDictionaryRef ___ZN21SandboxExtensionCache6sharedEv_block_invoke()
{
  int v0 = operator new(0x10uLL);
  *(_DWORD *)int v0 = 0;
  CFMutableDictionaryRef result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605240], 0LL);
  v0[1] = result;
  SandboxExtensionCache::shared(void)::shared = (uint64_t)v0;
  return result;
}

void SandboxExtensionCache::SandboxExtensionCache(SandboxExtensionCache *this)
{
  *(_DWORD *)this = 0;
  *((void *)this + 1) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605240], 0LL);
}

void SandboxExtensionCache::~SandboxExtensionCache(SandboxExtensionCache *this)
{
  uint64_t v1 = (const void *)*((void *)this + 1);
  if (v1) {
    CFRelease(v1);
  }
}

BOOL SandboxExtensionCache::insert(os_unfair_lock_s *this, CFURLRef url, const __CFData *a3)
{
  if (!url) {
    SandboxExtensionCache::insert();
  }
  if (!a3) {
    SandboxExtensionCache::insert();
  }
  CFBooleanRef propertyValueTypeRefPtr = 0LL;
  if (CFURLCopyResourcePropertyForKey(url, (CFStringRef)*MEMORY[0x189605448], &propertyValueTypeRefPtr, 0LL)) {
    BOOL v5 = propertyValueTypeRefPtr == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return 0LL;
  }
  os_unfair_lock_lock(this);
  BOOL v6 = SandboxExtensionCache::_insert((CFDictionaryRef *)this, propertyValueTypeRefPtr, a3) != 0LL;
  os_unfair_lock_unlock(this);
  CFRelease(propertyValueTypeRefPtr);
  return v6;
}

void *SandboxExtensionCache::_insert(CFDictionaryRef *this, const __CFString *a2, const __CFData *a3)
{
  if (!a2) {
    SandboxExtensionCache::_insert();
  }
  if (!a3) {
    SandboxExtensionCache::_insert();
  }
  Item = (CFTypeRef *)SandboxExtensionCache::_findItem(this, a2, a3);
  if (Item)
  {
    CFErrorRef v7 = Item;
    if (CFEqual(a3, Item[2]))
    {
      BOOL v8 = v7;
    }

    else
    {
      BOOL v8 = operator new(0x20uLL);
      v8[3] = 0LL;
      *BOOL v8 = 0LL;
      v8[1] = 0LL;
      v8[2] = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], a3);
      do
      {
        uint64_t v9 = v7;
        CFErrorRef v7 = (CFTypeRef *)v7[3];
      }

      while (v7);
      v9[3] = v8;
    }
  }

  else
  {
    BOOL v8 = operator new(0x20uLL);
    v8[3] = 0LL;
    *BOOL v8 = 0LL;
    v8[1] = 0LL;
    v8[2] = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], a3);
    CFDictionarySetValue(this[1], a2, v8);
  }

  BOOL v10 = (os_log_s *)securityScopedLog;
  if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG)) {
    SandboxExtensionCache::_insert((uint64_t)this, v10);
  }
  return v8;
}

CFDataRef SandboxExtensionCache::move( os_unfair_lock_s *this, const __CFURL *a2, CFURLRef url, fsid *a4, uint64_t a5)
{
  uint64_t v5 = a5;
  BOOL v6 = a4;
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (!url)
  {
    if (!a4 || !a5) {
      SandboxExtensionCache::move();
    }
    CFBooleanRef propertyValueTypeRefPtr = 0LL;
LABEL_25:
    if (!v6) {
      goto LABEL_34;
    }
    goto LABEL_32;
  }

  CFBooleanRef propertyValueTypeRefPtr = 0LL;
  if (a4) {
    BOOL v9 = a5 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  char v10 = v9;
  if (v9)
  {
    uint64_t v5 = 0LL;
    BOOL v6 = 0LL;
  }

  if (!CFURLCopyResourcePropertyForKey(url, (CFStringRef)*MEMORY[0x189605448], &propertyValueTypeRefPtr, &v22))
  {
    BOOL v11 = (os_log_s *)securityScopedLog;
    if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR)) {
      SandboxExtensionCache::move((uint64_t)url, (uint64_t *)&v22, v11);
    }
  }

  char v12 = v10 ^ 1;
  if (!propertyValueTypeRefPtr) {
    char v12 = 1;
  }
  if ((v12 & 1) != 0) {
    goto LABEL_25;
  }
  if (!CFStringGetFileSystemRepresentation(propertyValueTypeRefPtr, buffer, 1024LL))
  {
    uint64_t v14 = (os_log_s *)securityScopedLog;
    if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR)) {
      SandboxExtensionCache::move(v14, v15, v16);
    }
    goto LABEL_34;
  }

  *(void *)&v30[16] = 0LL;
  *(_OWORD *)CFErrorRef v30 = xmmword_182EA53D8;
  if (getattrlist(buffer, v30, v25, 0x28uLL, 1u) || *(_OWORD *)&v30[4] != v26 || *(_DWORD *)&v30[20] != v27)
  {
    int v13 = (os_log_s *)securityScopedLog;
    if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR)) {
      SandboxExtensionCache::move((uint64_t)buffer, v13);
    }
    goto LABEL_34;
  }

  uint64_t v5 = v29;
  uint64_t v23 = v28;
  BOOL v6 = (fsid *)&v23;
  if (&v22 != (CFErrorRef *)-8LL)
  {
LABEL_32:
    if (v5)
    {
      os_unfair_lock_lock(this);
      CFDataRef v17 = SandboxExtensionCache::_move((CFDictionaryRef *)this, propertyValueTypeRefPtr, v6, v5);
      os_unfair_lock_unlock(this);
      goto LABEL_37;
    }
  }

CFDataRef SandboxExtensionCache::_move(CFDictionaryRef *this, const __CFString *a2, fsid *a3, uint64_t a4)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  int updated = sandbox_extension_update_file_by_fileid();
  if (updated)
  {
    int v9 = updated;
    char v10 = (os_log_s *)securityScopedLog;
    if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR))
    {
      int32_t v18 = a3->val[0];
      int32_t v19 = a3->val[1];
      v20[0] = 67109888;
      v20[1] = v18;
      __int16 v21 = 1024;
      int32_t v22 = v19;
      __int16 v23 = 2048;
      uint64_t v24 = a4;
      __int16 v25 = 1024;
      int v26 = v9;
      _os_log_error_impl( &dword_182E77000,  v10,  OS_LOG_TYPE_ERROR,  "sandbox_extension_update_file_by_fileid error for fsid={%#x, %#x}, id=%#llx: %{errno}d",  (uint8_t *)v20,  0x1Eu);
    }

    return 0LL;
  }

  if (a2 && CFStringGetFileSystemRepresentation(a2, (char *)v20, 1024LL))
  {
    int v13 = (const __CFString *)CFRetain(a2);
  }

  else
  {
    int v13 = CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x189604DB0], (const char *)v20);
  }

  uint64_t v14 = v13;
  if (!v13) {
    return 0LL;
  }
  access((const char *)v20, 2);
  uint64_t v15 = (const char *)sandbox_extension_issue_file();
  if (v15)
  {
    uint64_t v16 = (UInt8 *)v15;
    size_t v17 = strlen(v15);
    CFDataRef v11 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v16, v17 + 1);
    if (v11 && !SandboxExtensionCache::_insert(this, v14, v11))
    {
      CFRelease(v11);
      CFDataRef v11 = 0LL;
    }

    free(v16);
  }

  else
  {
    CFDataRef v11 = 0LL;
  }

  CFRelease(v14);
  return v11;
}

__CFData *SandboxExtensionCache::consume(os_unfair_lock_s *this, CFURLRef url, const __CFData *a3)
{
  CFTypeRef cf = 0LL;
  char v10 = 0LL;
  int v5 = CFURLCopyResourcePropertyForKey(url, (CFStringRef)*MEMORY[0x189605448], &cf, 0LL);
  CFMutableDictionaryRef result = 0LL;
  if (v5) {
    BOOL v7 = cf == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    os_unfair_lock_lock(this);
    int v8 = SandboxExtensionCache::_consume((CFDictionaryRef *)this, (const __CFString *)cf, a3, &v10);
    os_unfair_lock_unlock(this);
    CFRelease(cf);
    if ((v8 & 5) != 0)
    {
      if (v8 == 3)
      {
        if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG)) {
          SandboxExtensionCache::consume();
        }
      }

      else if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR))
      {
        SandboxExtensionCache::consume();
      }

      return 0LL;
    }

    else
    {
      return v10;
    }
  }

  return result;
}

uint64_t SandboxExtensionCache::_consume( CFDictionaryRef *this, const __CFString *a2, const __CFData *a3, const __CFData **a4)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if (!a2) {
    SandboxExtensionCache::_consume();
  }
  *a4 = 0LL;
  Item = (uint64_t *)SandboxExtensionCache::_findItem(this, a2, a3);
  int v9 = Item;
  if (a3 && !Item) {
    int v9 = SandboxExtensionCache::_insert(this, a2, a3);
  }
  if (v9)
  {
    uint64_t v10 = *v9;
    if (*v9)
    {
      uint64_t v11 = v10 + 1;
      uint64_t *v9 = v10 + 1;
      char v12 = (os_log_s *)securityScopedLog;
      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = v9[1];
        int v18 = 134218498;
        uint64_t v19 = v17;
        __int16 v20 = 2048;
        uint64_t v21 = v11;
        __int16 v22 = 2112;
        __int16 v23 = a2;
        _os_log_debug_impl( &dword_182E77000,  v12,  OS_LOG_TYPE_DEBUG,  "handle %lld: incrementing ref count to %lld for path %@",  (uint8_t *)&v18,  0x20u);
      }

      uint64_t result = 0LL;
LABEL_17:
      *a4 = (const __CFData *)v9[2];
      return result;
    }

    CFDataGetBytePtr((CFDataRef)v9[2]);
    uint64_t v14 = sandbox_extension_consume();
    v9[1] = v14;
    if ((v14 & 0x8000000000000000LL) == 0)
    {
      uint64_t v15 = (os_log_s *)securityScopedLog;
      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG)) {
        SandboxExtensionCache::_consume((uint64_t)a2, v14, v15);
      }
      uint64_t result = 0LL;
      uint64_t *v9 = 1LL;
      goto LABEL_17;
    }

    BOOL v16 = os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR);
    if (v14 == -1)
    {
      if (v16) {
        SandboxExtensionCache::_consume();
      }
    }

    else if (v16)
    {
      SandboxExtensionCache::_consume();
    }

    return 4LL;
  }

  else
  {
    getpid();
    else {
      return 2LL;
    }
  }

BOOL SandboxExtensionCache::release(os_unfair_lock_s *this, CFURLRef url, const __CFData *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  CFStringRef string = 0LL;
  if (CFURLCopyResourcePropertyForKey(url, (CFStringRef)*MEMORY[0x189605448], &string, 0LL)) {
    BOOL v5 = string == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    os_unfair_lock_lock(this);
    int v7 = SandboxExtensionCache::_release((CFDictionaryRef *)this, string, a3);
    os_unfair_lock_unlock(this);
    if ((v7 & 5) != 0)
    {
      if (v7 == 3)
      {
        if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG)) {
          SandboxExtensionCache::release();
        }
        bzero(buffer, 0x400uLL);
        if (CFStringGetFileSystemRepresentation(string, buffer, 1024LL))
        {
          if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG)) {
            SandboxExtensionCache::release();
          }
          int v8 = sandbox_extension_release_file();
          BOOL v6 = v8 == 0;
          if (v8) {
            int v9 = -2;
          }
          else {
            int v9 = 2;
          }
          *__error() = v9;
          goto LABEL_22;
        }
      }

      else if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR))
      {
        SandboxExtensionCache::release();
      }

      BOOL v6 = 0LL;
    }

    else
    {
      BOOL v6 = 1LL;
    }

uint64_t SandboxExtensionCache::_release(CFDictionaryRef *this, const __CFString *a2, const __CFData *a3)
{
  Item = (CacheItem *)SandboxExtensionCache::_findItem(this, a2, a3);
  if (!Item) {
    return 3LL;
  }
  BOOL v6 = Item;
  uint64_t v7 = *(void *)Item;
  if (*(uint64_t *)Item < 2)
  {
    int Value = (CacheItem *)CFDictionaryGetValue(this[1], a2);
    if (Value) {
      BOOL v12 = v6 == Value;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12)
    {
      uint64_t v13 = (const void *)*((void *)v6 + 3);
      uint64_t v14 = this[1];
      if (v13)
      {
        CFDictionarySetValue(v14, a2, v13);
        *((void *)v6 + 3) = 0LL;
      }

      else
      {
        CFDictionaryRemoveValue(v14, a2);
      }
    }

    else
    {
      remove(Value, v6);
    }

    int v15 = sandbox_extension_release();
    BOOL v16 = (os_log_s *)securityScopedLog;
    if (v15)
    {
      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR)) {
        SandboxExtensionCache::_release();
      }
      uint64_t v10 = 4LL;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG)) {
        SandboxExtensionCache::_release((void *)v6 + 1, (uint64_t)a2, v16);
      }
      uint64_t v10 = 0LL;
      *__error() = 1;
    }

    uint64_t v17 = (const void *)*((void *)v6 + 2);
    if (v17) {
      CFRelease(v17);
    }
    operator delete(v6);
  }

  else
  {
    uint64_t v8 = v7 - 1;
    *(void *)Item = v7 - 1;
    int v9 = (os_log_s *)securityScopedLog;
    if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG)) {
      SandboxExtensionCache::_release((uint64_t)v6, v8, v9);
    }
    uint64_t v10 = 0LL;
    *__error() = 3;
  }

  return v10;
}

CFDataRef SandboxExtensionCache::copyExtensionForURL(SandboxExtensionCache *this, CFURLRef url)
{
  CFBooleanRef propertyValueTypeRefPtr = 0LL;
  CFDataRef Copy = 0LL;
  if (CFURLCopyResourcePropertyForKey(url, (CFStringRef)*MEMORY[0x189605448], &propertyValueTypeRefPtr, 0LL)) {
    BOOL v4 = propertyValueTypeRefPtr == 0LL;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    os_unfair_lock_lock((os_unfair_lock_t)this);
    int Value = (CFDataRef *)CFDictionaryGetValue(*((CFDictionaryRef *)this + 1), propertyValueTypeRefPtr);
    if (Value) {
      CFDataRef Copy = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], Value[2]);
    }
    else {
      CFDataRef Copy = 0LL;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)this);
    CFRelease(propertyValueTypeRefPtr);
  }

  return Copy;
}

const void *SandboxExtensionCache::_findItem( CFDictionaryRef *this, const __CFString *a2, const __CFData *a3)
{
  int Value = CFDictionaryGetValue(this[1], a2);
  BOOL v5 = Value;
  if (Value && a3)
  {
    BOOL v6 = Value;
    while (!CFEqual(a3, *((CFTypeRef *)v6 + 2)))
    {
      BOOL v6 = (const void *)*((void *)v6 + 3);
      if (!v6) {
        return v5;
      }
    }

    return v6;
  }

  return v5;
}

BOOL SandboxExtensionCache::containsPath(SandboxExtensionCache *this, const __CFString *a2)
{
  BOOL v4 = CFDictionaryContainsKey(*((CFDictionaryRef *)this + 1), a2) != 0;
  os_unfair_lock_unlock((os_unfair_lock_t)this);
  return v4;
}

BOOL SandboxExtensionCache::_containsPath(CFDictionaryRef *this, const __CFString *a2)
{
  return CFDictionaryContainsKey(this[1], a2) != 0;
}

BOOL SandboxExtensionCache::containsURL(SandboxExtensionCache *this, CFURLRef url)
{
  if (CFURLCopyResourcePropertyForKey(url, (CFStringRef)*MEMORY[0x189605448], &propertyValueTypeRefPtr, 0LL)) {
    BOOL v3 = propertyValueTypeRefPtr == 0LL;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    return 0LL;
  }
  os_unfair_lock_lock((os_unfair_lock_t)this);
  BOOL v4 = CFDictionaryContainsKey(*((CFDictionaryRef *)this + 1), propertyValueTypeRefPtr) != 0;
  os_unfair_lock_unlock((os_unfair_lock_t)this);
  CFRelease(propertyValueTypeRefPtr);
  return v4;
}

  ;
}

void OUTLINED_FUNCTION_2_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void OUTLINED_FUNCTION_5_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_6_0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_7_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t _URLReplaceObject( const __CFAllocator *MutableCopy, const __CFURL *cf, const void *a3, const __CFString *a4, const __CFString *a5, unint64_t a6, CFTypeRef *a7, CFErrorRef *a8)
{
  uint64_t v14 = cf;
  userInfoValues[128] = *(void **)MEMORY[0x1895F89C0];
  CFTypeRef cf2 = 0LL;
  CFBooleanRef propertyValueTypeRefPtr = 0LL;
  CFTypeRef v16 = CFRetain(cf);
  CFTypeRef v149 = CFRetain(a3);
  CFIndex v152 = 22LL;
  CFErrorRef error = 0LL;
  domain = (const __CFString *)*MEMORY[0x189604F58];
  if (a5) {
    int v17 = (a6 >> 4) & 1;
  }
  else {
    int v17 = 0;
  }
  char allocator = MutableCopy;
  if (a4 && CFStringFind(a4, @"/", 0LL).location != -1 || a5 && CFStringFind(a5, @"/", 0LL).location != -1) {
    goto LABEL_14;
  }
  if (CFURLResourceIsReachable(v14, 0LL))
  {
    pathComponent = a4;
    CFURLRef v18 = CFURLCreateFilePathURL(MutableCopy, v14, &error);
    value = (void *)v16;
    if (v18)
    {
      CFURLRef v19 = CFURLCreateFilePathURL(MutableCopy, (CFURLRef)a3, &error);
      uint64_t v150 = v18;
      if (!v19)
      {
        LODWORD(v18) = 0;
        int v35 = 0;
        char v36 = 0LL;
        uint64_t v37 = 0LL;
        uint64_t v38 = 0LL;
        LODWORD(MutableCopy) = 1;
        goto LABEL_44;
      }

      uint64_t v139 = a5;
      int v138 = v17;
      int v135 = a7;
      CFTypeRef cfa = v19;
      __int128 v144 = a8;
      __int128 v145 = v14;
      acl_t v143 = a3;
      uint64_t v20 = *MEMORY[0x1896053B8];
      uint64_t v21 = *MEMORY[0x189605378];
      *(void *)&values.ad_name_offset = *MEMORY[0x1896053B8];
      *(void *)values.ad_pad = v21;
      uint64_t v22 = *MEMORY[0x1896053E0];
      uint64_t v23 = *MEMORY[0x1896053D0];
      uint64_t v168 = *MEMORY[0x1896053E0];
      uint64_t v169 = v23;
      uint64_t v24 = (const __CFString *)*MEMORY[0x189605440];
      v134 = (const __CFString *)*MEMORY[0x189605438];
      CFTypeRef v170 = (const __CFString *)*MEMORY[0x189605438];
      CFTypeRef v171 = v24;
      uint64_t v136 = v24;
      __int16 v25 = (const __CFString *)*MEMORY[0x189605528];
      int v26 = (const __CFString *)*MEMORY[0x189605310];
      uint64_t v172 = *MEMORY[0x189605528];
      CFTypeRef v173 = v26;
      if ((a6 & 2) != 0)
      {
        uint64_t v29 = (const __CFString *)*MEMORY[0x189605638];
        CFAllocatorRef v39 = (const __CFString *)*MEMORY[0x189605600];
        uint64_t v174 = *MEMORY[0x189605638];
        CFTypeRef v175 = v39;
        key = v39;
        uint64_t v31 = (const CFArrayCallBacks *)MEMORY[0x189605228];
        uint64_t v32 = MutableCopy;
        CFIndex v33 = 10LL;
      }

      else
      {
        uint64_t v27 = (const __CFString *)*MEMORY[0x189604C18];
        uint64_t v174 = *MEMORY[0x1896052B0];
        CFTypeRef v175 = v27;
        uint64_t v28 = *MEMORY[0x189605338];
        uint64_t v176 = *MEMORY[0x189604C20];
        uint64_t v177 = v28;
        uint64_t v29 = (const __CFString *)*MEMORY[0x189605638];
        CFErrorRef v30 = (const __CFString *)*MEMORY[0x189605600];
        uint64_t v178 = *MEMORY[0x189605638];
        uint64_t v179 = v30;
        key = v30;
        uint64_t v31 = (const CFArrayCallBacks *)MEMORY[0x189605228];
        uint64_t v32 = MutableCopy;
        CFIndex v33 = 14LL;
      }

      MutableCFDataRef Copy = CFArrayCreate(v32, (const void **)&values, v33, v31);
      if (MutableCopy)
      {
        uint64_t v40 = (const void *)__CFURLResourceInfoPtr();
        int v35 = _FSURLCacheResourcePropertiesForKeys(v150, MutableCopy, v40, &error);
        CFRelease(MutableCopy);
        if (v35)
        {
          *(void *)&values.ad_name_offset = v20;
          *(void *)values.ad_pad = v21;
          uint64_t v168 = v22;
          uint64_t v169 = v23;
          CFTypeRef v170 = v25;
          CFTypeRef v171 = v26;
          if ((a6 & 2) != 0)
          {
            CFRange v42 = (const CFArrayCallBacks *)MEMORY[0x189605228];
            CFIndex v43 = 6LL;
          }

          else
          {
            CFRange v41 = (const __CFString *)*MEMORY[0x189605338];
            uint64_t v172 = *MEMORY[0x189604C20];
            CFTypeRef v173 = v41;
            CFRange v42 = (const CFArrayCallBacks *)MEMORY[0x189605228];
            CFIndex v43 = 8LL;
          }

          char v44 = CFArrayCreate(allocator, (const void **)&values, v43, v42);
          a3 = v143;
          a8 = v144;
          int v45 = v150;
          if (!v44)
          {
            LODWORD(v18) = 0;
            int v35 = 0;
            char v36 = 0LL;
            uint64_t v37 = 0LL;
            uint64_t v38 = 0LL;
            CFErrorRef error = CFErrorCreate(allocator, domain, 12LL, 0LL);
LABEL_176:
            LODWORD(MutableCopy) = 1;
            goto LABEL_40;
          }

          int v46 = (const void *)__CFURLResourceInfoPtr();
          int v35 = _FSURLCacheResourcePropertiesForKeys(cfa, v44, v46, &error);
          CFRelease(v44);
          if (!v35)
          {
            LODWORD(v18) = 0;
            goto LABEL_173;
          }

          int v47 = v158;
          if (!v158)
          {
            if (_URLIsFile(v150, (BOOL *)&values, &error))
            {
              if (LOBYTE(values.ad_name_offset)) {
                goto LABEL_27;
              }
              CFIndex v152 = 2LL;
              char v36 = CFRetain(v150);
            }

            else
            {
              char v36 = 0LL;
            }

            uint64_t v14 = v145;
            goto LABEL_115;
          }

LABEL_27:
          int v48 = v157;
          if (v157) {
            goto LABEL_31;
          }
          if (_URLIsFile(cfa, (BOOL *)&values, &error))
          {
            if (LOBYTE(values.ad_name_offset))
            {
LABEL_31:
              if (v154)
              {
LABEL_38:
                CFIndex v152 = 13LL;
                char v36 = CFRetain(v150);
                LODWORD(MutableCopy) = 0;
                LODWORD(v18) = 0;
                int v35 = 0;
LABEL_39:
                uint64_t v37 = 0LL;
                uint64_t v38 = 0LL;
LABEL_40:
                uint64_t v14 = v145;
LABEL_43:
                CFRelease(cfa);
LABEL_44:
                CFRelease(v150);
                goto LABEL_45;
              }

              if (_URLIsLocked(cfa, (BOOL *)&v154, &error))
              {
                if (!v154)
                {
                  *(void *)&values.ad_name_offset = 0x40000000010LL;
                  if (!CFURLGetFileSystemRepresentation(v150, 1u, (UInt8 *)&v168, 1024LL))
                  {
                    int v50 = 2;
                    uint64_t v14 = v145;
                    goto LABEL_42;
                  }

                  uid_t v49 = _CFGetEUID();
                  if (accessx_np(&values, 0x410uLL, (int *)userInfoValues, v49))
                  {
                    int v50 = *__error();
                    uint64_t v14 = v145;
                    if (!v50) {
                      goto LABEL_38;
                    }
LABEL_42:
                    int8x8_t v51 = CFGetAllocator(v150);
                    CFTypeRef v52 = _FSURLCreateStandardError(v51, domain, v50, 1, (const __CFString *)v150, 0LL);
                    LODWORD(MutableCopy) = 0;
                    LODWORD(v18) = 0;
                    int v35 = 0;
                    char v36 = 0LL;
                    uint64_t v37 = 0LL;
                    uint64_t v38 = 0LL;
                    CFErrorRef error = v52;
                    goto LABEL_43;
                  }

                  if (LODWORD(userInfoValues[0])) {
                    goto LABEL_38;
                  }
                  if (pathComponent)
                  {
                    int v133 = 0;
                    goto LABEL_97;
                  }

                  if (CFURLCopyResourcePropertyForKey(v150, v29, &values, &error))
                  {
                    int v133 = CFBooleanGetValue(*(CFBooleanRef *)&values.ad_name_offset);
                    CFRelease(*(CFTypeRef *)&values.ad_name_offset);
LABEL_97:
                    uint64_t v14 = v145;
                    if (!CFURLCopyResourcePropertyForKey(v150, key, &values, &error)) {
                      goto LABEL_111;
                    }
                    int v132 = CFBooleanGetValue(*(CFBooleanRef *)&values.ad_name_offset);
                    CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                    if (CFURLCopyResourcePropertyForKey(v150, v26, &values, 0LL))
                    {
                      if (CFURLCopyResourcePropertyForKey(cfa, v26, userInfoValues, 0LL))
                      {
                        int v66 = CFEqual(*(CFTypeRef *)&values.ad_name_offset, userInfoValues[0]);
                        CFRelease(userInfoValues[0]);
                        CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                        if (v66)
                        {
                          CFIndex v67 = 22LL;
LABEL_114:
                          CFIndex v152 = v67;
                          char v36 = CFRetain(v150);
LABEL_115:
                          LODWORD(MutableCopy) = 0;
                          LODWORD(v18) = 0;
                          int v35 = 0;
                          goto LABEL_116;
                        }
                      }

                      else
                      {
                        CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                      }
                    }

                    if (CFURLCopyResourcePropertyForKey(v150, v25, &values, 0LL))
                    {
                      if (CFURLCopyResourcePropertyForKey(cfa, v25, userInfoValues, 0LL))
                      {
                        int v68 = CFEqual(*(CFTypeRef *)&values.ad_name_offset, userInfoValues[0]);
                        CFRelease(userInfoValues[0]);
                        CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                        if (v68)
                        {
                          if (CFURLCopyResourcePropertyForKey(v150, v136, &propertyValueTypeRefPtr, &error))
                          {
                            fsid v69 = pathComponent;
                            if (pathComponent) {
                              size_t v70 = CFURLCreateCopyAppendingPathComponent( allocator,  propertyValueTypeRefPtr,  pathComponent,  v48);
                            }
                            else {
                              size_t v70 = (const __CFURL *)CFRetain(v150);
                            }
                            unsigned int v71 = v70;
                            if (!v70)
                            {
                              CFIndex v152 = 2LL;
                              char v36 = CFRetain(v150);
                              LODWORD(MutableCopy) = 0;
                              LODWORD(v18) = 0;
                              int v35 = 0;
                              uint64_t v37 = 0LL;
                              uint64_t v38 = 0LL;
LABEL_320:
                              CFRelease(propertyValueTypeRefPtr);
                              goto LABEL_43;
                            }

                            if (v133)
                            {
                              if ((v138 & 1) == 0)
                              {
LABEL_131:
                                uint64_t v37 = 0LL;
                                goto LABEL_135;
                              }

LABEL_126:
                              uint64_t v37 = CFURLCreateCopyAppendingPathComponent(allocator, propertyValueTypeRefPtr, v139, v47);
                              if (v37)
                              {
LABEL_127:
                                CFStringRef v73 = CFURLCopyLastPathComponent(v71);
                                if (v73)
                                {
                                  CFStringRef v74 = v73;
                                  int v130 = v71;
                                  CFStringRef v75 = CFURLCopyLastPathComponent(v37);
                                  if (v75)
                                  {
                                    CFStringRef v76 = v75;
                                    int v77 = CFEqual(v74, v75);
                                    CFRelease(v76);
                                    CFRelease(v74);
                                    if (v77)
                                    {
                                      CFIndex v152 = 22LL;
                                      unsigned int v71 = v130;
                                      char v36 = CFRetain(v130);
                                      LODWORD(MutableCopy) = 0;
                                      LODWORD(v18) = 0;
                                      int v35 = 0;
                                      uint64_t v38 = 0LL;
                                      uint64_t v14 = v145;
                                      goto LABEL_316;
                                    }

                                    uint64_t v14 = v145;
                                  }

                                  else
                                  {
                                    CFRelease(v74);
                                  }

                                  unsigned int v71 = v130;
                                }

                                fsid v69 = pathComponent;
LABEL_135:
                                if ((a6 & 2) != 0)
                                {
                                  CFStringRef v137 = 0LL;
                                  keya = 0LL;
                                  CFTypeRef v82 = value;
                                  MutableCFDataRef Copy = allocator;
                                  goto LABEL_266;
                                }

                                keya = CFDictionaryCreateMutable( allocator,  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
                                if (keya)
                                {
                                  CFTypeRef v78 = (const __CFString *)*MEMORY[0x189605338];
                                  if (CFURLCopyResourcePropertyForKey( v150,  (CFStringRef)*MEMORY[0x189605338],  &fileSec,  &error)
                                    && fileSec)
                                  {
                                    BOOL v129 = v78;
                                    if (CFURLCopyResourcePropertyForKey(cfa, v78, &v164, &error) && v164)
                                    {
                                      CFFileSecurityRef v79 = CFFileSecurityCreate(allocator);
                                      if (!v79)
                                      {
                                        CFStringRef v137 = 0LL;
                                        int v93 = 0;
                                        CFTypeRef v82 = value;
LABEL_241:
                                        CFRelease(v164);
                                        CFRelease(fileSec);
                                        if (v93)
                                        {
                                          if (TransferExtendedAttributes(allocator, v45, cfa, &error)
                                            && (uint64_t v112 = (const __CFString *)*MEMORY[0x189604C20],
                                                CFURLCopyResourcePropertyForKey( v45,  (CFStringRef)*MEMORY[0x189604C20],  &values,  &error))
                                            && *(void *)&values.ad_name_offset
                                            && CFDataGetLength(*(CFDataRef *)&values.ad_name_offset) == 32)
                                          {
                                            BytePtr = CFDataGetBytePtr(*(CFDataRef *)&values.ad_name_offset);
                                            LODWORD(MutableCopy) = 1;
                                            if (CFURLCopyResourcePropertyForKey(cfa, v112, userInfoValues, &error))
                                            {
                                              if (userInfoValues[0])
                                              {
                                                if (CFDataGetLength((CFDataRef)userInfoValues[0]) == 32)
                                                {
                                                  MutableCFDataRef Copy = CFDataCreateMutableCopy( allocator,  0LL,  (CFDataRef)userInfoValues[0]);
                                                  CFRelease(userInfoValues[0]);
                                                  if (MutableCopy)
                                                  {
                                                    MutableBytePtr = CFDataGetMutableBytePtr(MutableCopy);
                                                    __int16 v115 = *((_WORD *)BytePtr + 4);
                                                    if ((v115 & 0xE) != 0
                                                      && (__int16 v116 = *((_WORD *)MutableBytePtr + 4), (v116 & 0xE) == 0))
                                                    {
                                                      char v117 = 0;
                                                      *((_WORD *)MutableBytePtr + 4) = v116 | *((_WORD *)BytePtr + 4) & 0xE;
                                                      __int16 v115 = *((_WORD *)BytePtr + 4);
                                                    }

                                                    else
                                                    {
                                                      char v117 = 1;
                                                    }

                                                    fsid v69 = pathComponent;
                                                    if ((v115 & 0x10) == 0
                                                      || (__int16 v118 = *((_WORD *)MutableBytePtr + 4), (v118 & 0x10) != 0))
                                                    {
                                                      if ((v117 & 1) != 0) {
                                                        goto LABEL_259;
                                                      }
                                                    }

                                                    else
                                                    {
                                                      *((_WORD *)MutableBytePtr + 4) = v118 | 0x10;
                                                    }

                                                    CFDictionaryAddValue(keya, v112, MutableCopy);
LABEL_259:
                                                    CFRelease(MutableCopy);
                                                    CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                                                    size_t v119 = (const void *)*MEMORY[0x1896052B0];
                                                    if (CFURLCopyResourcePropertyForKey( v45,  (CFStringRef)*MEMORY[0x1896052B0],  &cf2,  0LL)
                                                      && cf2)
                                                    {
                                                      CFDictionaryAddValue(keya, v119, cf2);
                                                      CFRelease(cf2);
                                                    }

                                                    MutableCFDataRef Copy = allocator;
                                                    if (!CFURLSetResourcePropertiesForKeys(cfa, keya, &error))
                                                    {
                                                      LODWORD(v18) = 0;
                                                      int v35 = 0;
                                                      char v36 = 0LL;
                                                      uint64_t v38 = 0LL;
                                                      LODWORD(MutableCopy) = 1;
                                                      goto LABEL_312;
                                                    }

                                                    if (v137) {
                                                      CFURLSetResourcePropertyForKey(cfa, v129, v137, 0LL);
                                                    }
                                                    else {
                                                      CFStringRef v137 = 0LL;
                                                    }
LABEL_266:
                                                    if (!v139 || !v37 || !CFURLResourceIsReachable(v37, 0LL))
                                                    {
LABEL_272:
                                                      if (v133)
                                                      {
                                                        if (CFURLGetFileSystemRepresentation( cfa,  1u,  (UInt8 *)&values,  1024LL))
                                                        {
                                                          if (CFURLGetFileSystemRepresentation( v71,  1u,  (UInt8 *)userInfoValues,  1024LL))
                                                          {
                                                            if (!renamex_np( (const char *)&values,  (const char *)userInfoValues,  2u)
                                                              || (int v120 = *__error(),
                                                                  int v121 = (const __CFString *)cfa,
                                                                  !v120))
                                                            {
                                                              CFRelease(v149);
                                                              CFTypeRef v149 = CFRetain(v71);
                                                              CFRelease(v82);
                                                              CFTypeRef v122 = CFRetain(cfa);
                                                              if (v138)
                                                              {
                                                                char v36 = v135;
                                                                if (_RenameURL( MutableCopy,  cfa,  v37,  &error))
                                                                {
                                                                  CFRelease(v122);
                                                                  CFTypeRef v82 = CFRetain(v37);
LABEL_308:
                                                                  value = (void *)v82;
                                                                  if (v36)
                                                                  {
                                                                    CFTypeRef v126 = CFRetain(v71);
                                                                    LODWORD(MutableCopy) = 0;
                                                                    LODWORD(v18) = 0;
                                                                    int v35 = 0;
                                                                    uint64_t v127 = v36;
                                                                    char v36 = 0LL;
                                                                    void *v127 = v126;
                                                                  }

                                                                  else
                                                                  {
                                                                    LODWORD(MutableCopy) = 0;
                                                                    LODWORD(v18) = 0;
                                                                    int v35 = 0;
                                                                  }

                                                                  uint64_t v38 = 1LL;
                                                                  goto LABEL_312;
                                                                }

                                                                value = (void *)v122;
                                                                goto LABEL_347;
                                                              }

                                                              char v36 = v135;
                                                              if (_RemoveObjectAtURL( MutableCopy,  cfa,  &error))
                                                              {
                                                                CFRange v124 = v122;
                                                                goto LABEL_307;
                                                              }

                                                              value = (void *)v122;
                                                              uint64_t v128 = cfa;
                                                              goto LABEL_353;
                                                            }
                                                          }

                                                          else
                                                          {
                                                            int v120 = 2;
                                                            int v121 = (const __CFString *)v71;
                                                          }
                                                        }

                                                        else
                                                        {
                                                          int v120 = 2;
                                                          int v121 = (const __CFString *)cfa;
                                                        }

                                                        int v125 = _FSURLCreateStandardError( MutableCopy,  domain,  v120,  1,  v121,  0LL);
                                                        LODWORD(MutableCopy) = 0;
                                                        LODWORD(v18) = 0;
                                                        int v35 = 0;
                                                        char v36 = 0LL;
                                                        uint64_t v38 = 0LL;
                                                        CFErrorRef error = v125;
LABEL_312:
                                                        if (keya) {
                                                          CFRelease(keya);
                                                        }
                                                        if (v137) {
                                                          CFRelease(v137);
                                                        }
                                                        goto LABEL_316;
                                                      }

                                                      if (v37)
                                                      {
                                                        if ((v158
                                                           || v157
                                                           || !v132
                                                           || !_HardLinkURL(MutableCopy, v45, v37, &error))
                                                          && !_RenameURL(MutableCopy, v45, v37, &error))
                                                        {
                                                          goto LABEL_347;
                                                        }

                                                        CFRelease(v82);
                                                        CFTypeRef v82 = CFRetain(v37);
                                                      }

                                                      if (_RenameURL(MutableCopy, cfa, v71, &error))
                                                      {
                                                        if (v69)
                                                        {
                                                          int v123 = v37 ? v37 : v45;
                                                          if (CFURLCopyResourcePropertyForKey(v123, v134, &cf2, 0LL)
                                                            && cf2)
                                                          {
                                                            if (!CFEqual(v69, cf2)) {
                                                              TransferDocumentIdentifier(v123, v71);
                                                            }
                                                            CFRelease(cf2);
                                                          }
                                                        }

                                                        CFRelease(v149);
                                                        CFTypeRef v149 = CFRetain(v71);
                                                        if ((v138 & 1) == 0)
                                                        {
                                                          if (v37)
                                                          {
                                                            char v36 = v135;
                                                            if (_RemoveObjectAtURL( MutableCopy,  v37,  &error))
                                                            {
                                                              CFRange v124 = v82;
LABEL_307:
                                                              CFRelease(v124);
                                                              CFTypeRef v82 = 0LL;
                                                              goto LABEL_308;
                                                            }

                                                            value = (void *)v82;
LABEL_354:
                                                            LODWORD(MutableCopy) = 0;
                                                            LODWORD(v18) = 0;
                                                            char v36 = 0LL;
                                                            uint64_t v38 = 0LL;
                                                            int v35 = 1;
                                                            goto LABEL_312;
                                                          }

                                                          if (v69
                                                            && CFURLCopyResourcePropertyForKey(v45, v134, &cf2, 0LL)
                                                            && cf2)
                                                          {
                                                            if (!CFEqual(v69, cf2))
                                                            {
                                                              if (!_RemoveObjectAtURL( MutableCopy,  v45,  &error))
                                                              {
                                                                value = (void *)v82;
                                                                uint64_t v128 = v45;
LABEL_353:
                                                                uint64_t v37 = (const __CFURL *)CFRetain(v128);
                                                                goto LABEL_354;
                                                              }

                                                              CFRelease(v82);
                                                              CFTypeRef v82 = 0LL;
                                                            }

                                                            CFRelease(cf2);
                                                          }
                                                        }

                                                        char v36 = v135;
                                                        goto LABEL_308;
                                                      }

                                                      value = (void *)v82;
LABEL_347:
                                                      LODWORD(MutableCopy) = 0;
                                                      LODWORD(v18) = 0;
                                                      int v35 = 0;
                                                      char v36 = 0LL;
                                                      uint64_t v38 = 0LL;
                                                      goto LABEL_312;
                                                    }

                                                    if (_URLIsLocked(v37, (BOOL *)&v154, &error))
                                                    {
                                                      if (v154)
                                                      {
                                                        CFIndex v152 = 13LL;
                                                        char v36 = CFRetain(v37);
                                                        LODWORD(MutableCopy) = 0;
                                                        int v35 = 0;
                                                        goto LABEL_349;
                                                      }
                                                    }

                                                    LODWORD(MutableCopy) = 0;
                                                    int v35 = 0;
                                                    char v36 = 0LL;
LABEL_349:
                                                    uint64_t v38 = 0LL;
                                                    LODWORD(v18) = 1;
                                                    goto LABEL_312;
                                                  }
                                                }
                                              }
                                            }

                                            CFRelease(*(CFTypeRef *)&values.ad_name_offset);
                                          }

                                          else
                                          {
                                            LODWORD(MutableCopy) = 0;
                                          }

                                          if (!error)
                                          {
                                            CFIndex v152 = 512LL;
                                            domain = (const __CFString *)*MEMORY[0x189604F40];
                                            char v36 = CFRetain(v150);
LABEL_344:
                                            LODWORD(v18) = 0;
                                            int v35 = 0;
                                            goto LABEL_345;
                                          }

                                          goto LABEL_339;
                                        }

LABEL_337:
                                        if (!error)
                                        {
                                          CFIndex v152 = 512LL;
                                          domain = (const __CFString *)*MEMORY[0x189604F40];
                                          char v36 = CFRetain(v150);
                                          LODWORD(MutableCopy) = 0;
                                          goto LABEL_344;
                                        }

                                        LODWORD(MutableCopy) = 0;
LABEL_339:
                                        LODWORD(v18) = 0;
                                        int v35 = 0;
                                        char v36 = 0LL;
LABEL_345:
                                        uint64_t v38 = 0LL;
                                        a3 = v143;
                                        a8 = v144;
                                        uint64_t v14 = v145;
                                        goto LABEL_312;
                                      }

                                      __int128 v80 = v79;
                                      if (!CFFileSecurityGetMode(fileSec, &mode)) {
                                        goto LABEL_184;
                                      }
                                      if (!v47 || v48)
                                      {
                                        if (v47 || !v48)
                                        {
LABEL_157:
                                          if (CFFileSecurityGetGroup(fileSec, &group)
                                            && CFFileSecurityGetGroup(v164, &v161))
                                          {
                                            gid_t v87 = group;
                                            size_t v131 = v71;
                                            if (v161 == group)
                                            {
                                              int v88 = 0;
                                              mode_t v89 = 0;
                                              mode_t v90 = mode;
                                              goto LABEL_189;
                                            }

                                            int ismember = 0;
                                            uid_t v91 = _CFGetEUID();
                                            if (mbr_uid_to_uuid(v91, (unsigned __int8 *)&values)
                                              || mbr_gid_to_uuid(v87, (unsigned __int8 *)userInfoValues)
                                              || mbr_check_membership( (const unsigned __int8 *)&values,  (const unsigned __int8 *)userInfoValues,  &ismember))
                                            {
                                              mode_t v92 = mode;
                                            }

                                            else
                                            {
                                              mode_t v92 = mode;
                                              int v88 = ismember;
                                              if ((_BYTE)ismember)
                                              {
                                                mode_t v89 = mode;
LABEL_188:
                                                mode_t v90 = (8 * (v92 & 7)) | v92 & 0xFFC7;
                                                mode_t mode = v90;
LABEL_189:
                                                if (CFFileSecuritySetMode(v80, v90))
                                                {
                                                  if (CFFileSecurityCopyAccessControlList(fileSec, &accessControlList))
                                                  {
                                                    if (v47 != v48)
                                                    {
                                                      uint64_t v94 = accessControlList;
                                                      int v95 = 0;
                                                      if (v47)
                                                      {
                                                        while (1)
                                                        {
                                                          int entry = acl_get_entry(v94, v95, (acl_entry_t *)&values);
                                                          if (entry) {
                                                            break;
                                                          }
                                                          int permset = acl_get_permset( *(acl_entry_t *)&values.ad_name_offset,  (acl_permset_t *)userInfoValues);
                                                          int v95 = -1;
                                                          if (!permset)
                                                          {
                                                            int v98 = acl_delete_perm( (acl_permset_t)userInfoValues[0],  ACL_DELETE_CHILD|ACL_SEARCH);
                                                            int v95 = -1;
                                                            if (!v98)
                                                            {
                                                              acl_set_permset( *(acl_entry_t *)&values.ad_name_offset,  (acl_permset_t)userInfoValues[0]);
                                                              int v95 = -1;
                                                            }
                                                          }
                                                        }
                                                      }

                                                      else
                                                      {
                                                        while (1)
                                                        {
                                                          int entry = acl_get_entry(v94, v95, (acl_entry_t *)&values);
                                                          if (entry) {
                                                            break;
                                                          }
                                                          int v99 = acl_get_permset( *(acl_entry_t *)&values.ad_name_offset,  (acl_permset_t *)userInfoValues);
                                                          int v95 = -1;
                                                          if (!v99)
                                                          {
                                                            int v100 = acl_add_perm( (acl_permset_t)userInfoValues[0],  ACL_EXECUTE);
                                                            int v95 = -1;
                                                            if (!v100)
                                                            {
                                                              acl_set_permset( *(acl_entry_t *)&values.ad_name_offset,  (acl_permset_t)userInfoValues[0]);
                                                              int v95 = -1;
                                                            }
                                                          }
                                                        }
                                                      }

                                                      if (entry == -1)
                                                      {
                                                        if (*__error() == 22) {
                                                          int entry = 0;
                                                        }
                                                        else {
                                                          int entry = -1;
                                                        }
                                                      }

                                                      if (entry) {
                                                        goto LABEL_206;
                                                      }
                                                    }

                                                    int v93 = CFFileSecuritySetAccessControlList(v80, accessControlList);
                                                    acl_free(accessControlList);
                                                    if (!v93)
                                                    {
                                                      CFStringRef v137 = 0LL;
                                                      goto LABEL_207;
                                                    }

LABEL_211:
                                                    if (v88)
                                                    {
                                                      CFDataRef Copy = CFFileSecurityCreateCopy(allocator, v80);
                                                      CFTypeRef v82 = value;
                                                      if (Copy)
                                                      {
                                                        __int128 v102 = Copy;
                                                        unsigned int v71 = v131;
                                                        if (CFFileSecuritySetMode(Copy, v89)
                                                          && CFFileSecuritySetGroup(v102, group))
                                                        {
                                                          CFStringRef v137 = (CFStringRef)v102;
                                                        }

                                                        else
                                                        {
                                                          CFRelease(v102);
                                                          CFStringRef v137 = 0LL;
                                                        }

LABEL_220:
                                                        if (!CFFileSecurityGetMode(v164, &v159) || v159 != mode) {
                                                          goto LABEL_238;
                                                        }
                                                        int v103 = CFFileSecurityCopyAccessControlList( v164,  (acl_t *)&values);
                                                        int v104 = CFFileSecurityCopyAccessControlList( v80,  (acl_t *)userInfoValues);
                                                        if (v103 | v104)
                                                        {
                                                          int v105 = v104;
                                                          if (!v103) {
                                                            *(void *)&values.ad_name_offset = acl_init(0);
                                                          }
                                                          if (!v105) {
                                                            userInfoValues[0] = acl_init(0);
                                                          }
                                                          ssize_t v106 = acl_size(*(acl_t *)&values.ad_name_offset);
                                                          if (v106 >= 1
                                                            && (size_t v107 = v106, v106 == acl_size((acl_t)userInfoValues[0])))
                                                          {
                                                            uint64_t v108 = malloc(v107);
                                                            BOOL v109 = malloc(v107);
                                                            int v110 = v109;
                                                            BOOL v111 = 0;
                                                            if (v108 && v109) {
                                                              BOOL v111 = acl_copy_ext( v108,  *(acl_t *)&values.ad_name_offset,  v107) >= 1 && acl_copy_ext(v110, (acl_t)userInfoValues[0], v107) >= 1 && memcmp(v108, v110, v107) == 0;
                                                            }
                                                            free(v108);
                                                            free(v110);
                                                          }

                                                          else
                                                          {
                                                            BOOL v111 = 0;
                                                          }

                                                          acl_free(*(void **)&values.ad_name_offset);
                                                          acl_free(userInfoValues[0]);
                                                          CFTypeRef v82 = value;
                                                          if (!v111) {
LABEL_238:
                                                          }
                                                            CFDictionaryAddValue(keya, v129, v80);
                                                        }

                                                        int v93 = 1;
                                                        int v45 = v150;
                                                        goto LABEL_240;
                                                      }

                                                      CFStringRef v137 = 0LL;
                                                    }

                                                    else
                                                    {
                                                      CFStringRef v137 = 0LL;
                                                      CFTypeRef v82 = value;
                                                    }

                                                    unsigned int v71 = v131;
                                                    goto LABEL_220;
                                                  }

                                                  if (CFFileSecuritySetAccessControlList(v80, (acl_t)1)) {
                                                    goto LABEL_211;
                                                  }
                                                }

LABEL_206:
                                                CFStringRef v137 = 0LL;
                                                int v93 = 0;
LABEL_207:
                                                CFTypeRef v82 = value;
                                                unsigned int v71 = v131;
                                                goto LABEL_240;
                                              }
                                            }

                                            int v88 = 0;
                                            mode_t v89 = 0;
                                            goto LABEL_188;
                                          }

LABEL_184:
                                          CFStringRef v137 = 0LL;
                                          int v93 = 0;
                                          CFTypeRef v82 = value;
LABEL_240:
                                          CFRelease(v80);
                                          goto LABEL_241;
                                        }

                                        if ((mode & 6) != 0) {
                                          mode_t v81 = mode & 0xFFB7 | (8 * ((mode & 0x30) != 0)) | (((mode & 0x180) != 0) << 6) | 1;
                                        }
                                        else {
                                          mode_t v81 = mode & 0xFFB6 | (8 * ((mode & 0x30) != 0)) | (((mode & 0x180) != 0) << 6);
                                        }
                                      }

                                      else
                                      {
                                        mode_t v81 = mode & 0xFFB6;
                                      }

                                      mode_t mode = v81;
                                      goto LABEL_157;
                                    }

                                    CFRelease(fileSec);
                                  }

                                  CFStringRef v137 = 0LL;
                                  goto LABEL_337;
                                }

                                LODWORD(MutableCopy) = 0;
                                LODWORD(v18) = 0;
                                int v35 = 0;
                                char v36 = 0LL;
                                uint64_t v38 = 0LL;
                                CFIndex v152 = 12LL;
LABEL_316:
                                if (!v35 && v37)
                                {
                                  CFRelease(v37);
                                  int v35 = 0;
                                  uint64_t v37 = 0LL;
                                }

                                goto LABEL_319;
                              }

                              CFIndex v152 = 2LL;
                              char v36 = CFRetain(propertyValueTypeRefPtr);
                              LODWORD(MutableCopy) = 0;
                              LODWORD(v18) = 0;
                              int v35 = 0;
                              uint64_t v38 = 0LL;
LABEL_319:
                              CFRelease(v71);
                              goto LABEL_320;
                            }

                            char v72 = v138;
                            if (v47 | v48) {
                              char v72 = 1;
                            }
                            if ((v72 & 1) == 0) {
                              goto LABEL_131;
                            }
                            if (v139) {
                              goto LABEL_126;
                            }
                            if (CFURLGetFileSystemRepresentation(v150, 1u, (UInt8 *)&values, 1024LL))
                            {
                              int v83 = (const char *)_amkrtemp();
                              if (!v83)
                              {
                                int v86 = *__error();
                                goto LABEL_356;
                              }

                              BOOL v84 = (UInt8 *)v83;
                              size_t v85 = strlen(v83);
                              uint64_t v37 = CFURLCreateFromFileSystemRepresentation(allocator, v84, v85, v47);
                              free(v84);
                              if (v37) {
                                goto LABEL_127;
                              }
                            }

                            int v86 = 2;
LABEL_356:
                            CFIndex v152 = v86;
                            char v36 = CFRetain(propertyValueTypeRefPtr);
                            LODWORD(MutableCopy) = 0;
                            LODWORD(v18) = 0;
                            int v35 = 0;
                            uint64_t v37 = 0LL;
                            uint64_t v38 = 0LL;
                            a3 = v143;
                            a8 = v144;
                            uint64_t v14 = v145;
                            goto LABEL_319;
                          }

uint64_t _RenameURL(const __CFAllocator *a1, CFURLRef url, const __CFURL *a3, __CFError **a4)
{
  BOOL v6 = url;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (CFURLGetFileSystemRepresentation(url, 1u, buffer, 1024LL))
  {
    if (!CFURLGetFileSystemRepresentation(a3, 1u, v11, 1024LL))
    {
      int v8 = 2;
      BOOL v6 = a3;
      if (a4) {
        goto LABEL_8;
      }
      return 0LL;
    }

    int v8 = *__error();
    if (!v8) {
      return 1LL;
    }
  }

  else
  {
    int v8 = 2;
  }

  if (a4)
  {
LABEL_8:
    uint64_t v10 = _FSURLCreateStandardError(a1, (const __CFString *)*MEMORY[0x189604F58], v8, 1, (const __CFString *)v6, 0LL);
    uint64_t result = 0LL;
    *a4 = v10;
    return result;
  }

  return 0LL;
}

void TransferDocumentIdentifier(const __CFURL *a1, const __CFURL *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x1896052B8], &propertyValueTypeRefPtr, 0LL)) {
    BOOL v4 = propertyValueTypeRefPtr == 0LL;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    if (CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024LL)
      && CFURLGetFileSystemRepresentation(a2, 1u, v7, 1024LL))
    {
      int v5 = open((const char *)v7, 0);
      if ((v5 & 0x80000000) == 0)
      {
        fsctl((const char *)buffer, 0x80046820uLL, &v5, 0);
        close(v5);
      }
    }

    CFRelease(propertyValueTypeRefPtr);
  }

uint64_t _URLIsDirectory(const __CFURL *a1, BOOL *a2, CFErrorRef *error)
{
  uint64_t v4 = CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x189605378], &propertyValueTypeRefPtr, error);
  if ((_DWORD)v4)
  {
    int v5 = propertyValueTypeRefPtr;
    *a2 = propertyValueTypeRefPtr == (const void *)*MEMORY[0x189604DE8];
    CFRelease(v5);
  }

  else
  {
    *a2 = 0;
  }

  return v4;
}

uint64_t _URLIsFile(const __CFURL *a1, BOOL *a2, CFErrorRef *error)
{
  uint64_t v4 = CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x1896053B8], &propertyValueTypeRefPtr, error);
  if ((_DWORD)v4)
  {
    int v5 = propertyValueTypeRefPtr;
    *a2 = propertyValueTypeRefPtr == (const void *)*MEMORY[0x189604DE8];
    CFRelease(v5);
  }

  else
  {
    *a2 = 0;
  }

  return v4;
}

uint64_t _URLIsLocked(const __CFURL *a1, BOOL *a2, CFErrorRef *error)
{
  *a2 = 0;
  uint64_t v6 = CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x1896053D0], &cf, error);
  if ((_DWORD)v6)
  {
    uint64_t v7 = (const void *)*MEMORY[0x189604DE8];
    if (cf == (CFTypeRef)*MEMORY[0x189604DE8])
    {
      *a2 = 1;
    }

    else if (_CFGetEUID())
    {
      uint64_t v6 = CFURLCopyResourcePropertyForKey(a1, (CFStringRef)*MEMORY[0x1896053E0], &propertyValueTypeRefPtr, error);
      if ((_DWORD)v6)
      {
        int v8 = propertyValueTypeRefPtr;
        *a2 = propertyValueTypeRefPtr == v7;
        CFRelease(v8);
      }
    }

    CFRelease(cf);
  }

  return v6;
}

uint64_t _RemoveObjectAtURL(const __CFAllocator *a1, CFURLRef url, __CFError **a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (!CFURLGetFileSystemRepresentation(url, 1u, buffer, 1024LL))
  {
    int v7 = 2;
    if (a3) {
      goto LABEL_5;
    }
    return 0LL;
  }

  uint64_t v6 = 1LL;
  if (removefile((const char *)buffer, 0LL, 1u))
  {
    int v7 = *__error();
    if (v7)
    {
      if (a3)
      {
LABEL_5:
        uint64_t v6 = 0LL;
        *a3 = _FSURLCreateStandardError( a1,  (const __CFString *)*MEMORY[0x189604F58],  v7,  1,  (const __CFString *)url,  0LL);
        return v6;
      }

      return 0LL;
    }
  }

  return v6;
}

uint64_t _HardLinkURL(const __CFAllocator *a1, CFURLRef url, const __CFURL *a3, __CFError **a4)
{
  uint64_t v6 = url;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (CFURLGetFileSystemRepresentation(url, 1u, buffer, 1024LL))
  {
    if (!CFURLGetFileSystemRepresentation(a3, 1u, v11, 1024LL))
    {
      int v8 = 2;
      uint64_t v6 = a3;
      if (a4) {
        goto LABEL_8;
      }
      return 0LL;
    }

    int v8 = *__error();
    if (!v8) {
      return 1LL;
    }
  }

  else
  {
    int v8 = 2;
  }

  if (a4)
  {
LABEL_8:
    uint64_t v10 = _FSURLCreateStandardError(a1, (const __CFString *)*MEMORY[0x189604F58], v8, 1, (const __CFString *)v6, 0LL);
    uint64_t result = 0LL;
    *a4 = v10;
    return result;
  }

  return 0LL;
}

uint64_t TransferExtendedAttributes(const __CFAllocator *a1, CFURLRef url, const __CFURL *a3, __CFError **a4)
{
  uint64_t v6 = url;
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (!CFURLGetFileSystemRepresentation(url, 1u, v26, 1024LL))
  {
    int v22 = 2;
    goto LABEL_26;
  }

  uint64_t v8 = CFURLGetFileSystemRepresentation(a3, 1u, v25, 1024LL);
  if (!(_DWORD)v8)
  {
    int v22 = 2;
LABEL_25:
    uint64_t v6 = a3;
    goto LABEL_26;
  }

  MEMORY[0x1895F8858](v8);
  uint64_t v9 = v24;
  uint64_t v10 = 1LL;
  ssize_t v11 = listxattr((const char *)v26, v24, 0x200uLL, 1);
  if (!v11) {
    return v10;
  }
  ssize_t v12 = v11;
  if ((v11 & 0x8000000000000000LL) == 0)
  {
    int v13 = 0;
    uint64_t v14 = &v24[v11];
    goto LABEL_6;
  }

  if (*__error() != 34)
  {
    int v13 = 0;
LABEL_23:
    a3 = 0LL;
    int v22 = *__error();
    if (v13) {
LABEL_24:
    }
      free(v9);
    goto LABEL_25;
  }

  ssize_t v17 = listxattr((const char *)v26, 0LL, 0LL, 1);
  if (!v17) {
    return v10;
  }
  if (v17 <= 0 || (size_t v18 = v17 + 4096, (v19 = (char *)malloc(v17 + 4096)) == 0LL))
  {
    int v22 = *__error();
LABEL_26:
    if (!a4) {
      return 0LL;
    }
    uint64_t v23 = _FSURLCreateStandardError(a1, (const __CFString *)*MEMORY[0x189604F58], v22, 1, (const __CFString *)v6, 0LL);
    uint64_t v10 = 0LL;
    *a4 = v23;
    return v10;
  }

  uint64_t v9 = v19;
  int v13 = 1;
  ssize_t v20 = listxattr((const char *)v26, v19, v18, 1);
  if (v20 < 0) {
    goto LABEL_23;
  }
  if (v20)
  {
    uint64_t v14 = &v9[v20];
LABEL_6:
    int v15 = v9;
    while (1)
    {
      if (xattr_preserve_for_intent(v15, 2u))
      {
        int v16 = copyExtendedAttribute((const char *)v26, (const char *)v25, v15);
        if (v16) {
          break;
        }
      }

      v15 += strlen(v15) + 1;
      if (v15 >= v14)
      {
        if ((v12 & 0x8000000000000000LL) == 0) {
          return 1LL;
        }
        goto LABEL_19;
      }
    }

    int v22 = v16;
    if (v13) {
      goto LABEL_24;
    }
    goto LABEL_25;
  }

uint64_t copyExtendedAttribute(const char *a1, const char *path, const char *name)
{
  v16[65] = *MEMORY[0x1895F89C0];
  ssize_t v6 = getxattr(path, name, 0LL, 0LL, 0, 1);
  uint64_t v7 = 0LL;
  if ((v6 & 0x8000000000000000LL) == 0) {
    return v7;
  }
  MEMORY[0x1895F8858](v6);
  uint64_t v8 = v16;
  ssize_t v9 = getxattr(a1, name, v16, 0x200uLL, 0, 1);
  if (v9 < 0)
  {
    if (*__error() != 34)
    {
      int v11 = 0;
LABEL_13:
      uint64_t v7 = *__error();
      if (!v11) {
        return v7;
      }
      goto LABEL_10;
    }

    ssize_t v12 = getxattr(a1, name, 0LL, 0LL, 0, 1);
    if (v12 < 0) {
      return *__error();
    }
    size_t v13 = v12 + 4096;
    uint64_t v14 = malloc(v12 + 4096);
    if (!v14) {
      return 4294967188LL;
    }
    uint64_t v8 = v14;
    int v11 = 1;
    ssize_t v10 = getxattr(a1, name, v14, v13, 0, 1);
    if (v10 < 0) {
      goto LABEL_13;
    }
  }

  else
  {
    ssize_t v10 = v9;
    int v11 = 0;
  }

  uint64_t v7 = 0LL;
  if (setxattr(path, name, v8, v10, 0, 1)) {
    goto LABEL_13;
  }
  if (v11) {
LABEL_10:
  }
    free(v8);
  return v7;
}

uint64_t DirEnumOpen(const char *a1, __int128 *a2)
{
  size_t v3 = strlen(a1);
  uint64_t v4 = calloc(1uLL, 0x748uLL);
  if (!v4)
  {
    int v31 = *__error();
LABEL_124:
    uint64_t v5 = 0LL;
    *__error() = v31;
    return v5;
  }

  uint64_t v5 = (uint64_t)v4;
  if ((unint64_t)__strlcpy_chk() > 0x6FC)
  {
    int v31 = 63;
LABEL_123:
    free((void *)v5);
    goto LABEL_124;
  }

  unsigned int v6 = -1610350579;
  if (a2)
  {
    __int128 v7 = *a2;
    *(void *)(v5 + 1812) = *((void *)a2 + 2);
    *(_OWORD *)(v5 + 1796) = v7;
    unsigned int v6 = *(_DWORD *)(v5 + 1800) | 0xA004000D;
    *(_DWORD *)(v5 + 1800) = v6;
    *(_DWORD *)(v5 + 1808) |= 4u;
  }

  else
  {
    *(_DWORD *)(v5 + 1796) = 5;
    *(_OWORD *)(v5 + 1800) = xmmword_182EA5400;
    *(_DWORD *)(v5 + 1816) = 0;
  }

  uint64_t v8 = 794LL;
  if ((v6 & 2) == 0) {
    uint64_t v8 = 790LL;
  }
  if ((v6 & 0x10) != 0) {
    v8 += 4LL;
  }
  if ((v6 & 0x20) != 0) {
    v8 += 8LL;
  }
  if ((v6 & 0x40) != 0) {
    v8 += 8LL;
  }
  if ((v6 & 0x80) != 0) {
    v8 += 8LL;
  }
  if ((v6 & 0x100) != 0) {
    v8 += 4LL;
  }
  if ((v6 & 0x200) != 0) {
    v8 += 16LL;
  }
  if ((v6 & 0x400) != 0) {
    v8 += 16LL;
  }
  if ((v6 & 0x800) != 0) {
    v8 += 16LL;
  }
  if ((v6 & 0x1000) != 0) {
    v8 += 16LL;
  }
  if ((v6 & 0x2000) != 0) {
    v8 += 16LL;
  }
  if ((v6 & 0x4000) != 0) {
    v8 += 32LL;
  }
  if ((v6 & 0x8000) != 0) {
    v8 += 4LL;
  }
  if ((v6 & 0x10000) != 0) {
    v8 += 4LL;
  }
  if ((v6 & 0x20000) != 0) {
    v8 += 4LL;
  }
  uint64_t v9 = 8LL;
  if ((v6 & 0x80000) != 0) {
    uint64_t v10 = 8LL;
  }
  else {
    uint64_t v10 = 4LL;
  }
  uint64_t v11 = v8 + v10;
  if ((v6 & 0x100000) != 0) {
    v11 += 4LL;
  }
  if ((v6 & 0x200000) != 0) {
    v11 += 4LL;
  }
  if ((v6 & 0x400000) != 0) {
    v11 += 264LL;
  }
  if ((v6 & 0x800000) != 0) {
    v11 += 16LL;
  }
  if ((v6 & 0x1000000) != 0) {
    v11 += 16LL;
  }
  if ((v6 & 0x2000000) != 0) {
    v11 += 8LL;
  }
  if ((v6 & 0x4000000) != 0) {
    v11 += 8LL;
  }
  if ((v6 & 0x8000000) != 0) {
    v11 += 1032LL;
  }
  if ((v6 & 0x10000000) != 0) {
    v11 += 16LL;
  }
  if ((v6 & 0x40000000) == 0) {
    uint64_t v9 = 4LL;
  }
  int v12 = *(_DWORD *)(v5 + 1808);
  if (v12)
  {
    uint64_t v13 = 4LL * (v12 & 1);
    if ((v12 & 2) != 0) {
      v13 += 4LL;
    }
    if ((v12 & 4) != 0) {
      v13 += 4LL;
    }
    if ((v12 & 8) != 0) {
      v13 += 8LL;
    }
    if ((v12 & 0x10) != 0) {
      v13 += 4LL;
    }
    if ((v12 & 0x20) != 0) {
      unint64_t v14 = v13 + 8;
    }
    else {
      unint64_t v14 = v13;
    }
  }

  else
  {
    unint64_t v14 = 0LL;
  }

  uint64_t v15 = v11 + v9;
  int v16 = *(_DWORD *)(v5 + 1812);
  if (v16)
  {
    uint64_t v17 = 4LL * (v16 & 3);
    if ((v16 & 4) != 0) {
      v17 += 8LL;
    }
    if ((v16 & 8) != 0) {
      v17 += 4LL;
    }
    if ((v16 & 0x20) != 0) {
      v17 += 4LL;
    }
    if ((v16 & 0x80) != 0) {
      v17 += 4LL;
    }
    if ((v16 & 0x100) != 0) {
      v17 += 8LL;
    }
    if ((v16 & 0x200) != 0) {
      v17 += 8LL;
    }
    if ((v16 & 0x400) != 0) {
      v17 += 8LL;
    }
    if ((v16 & 0x1000) != 0) {
      v17 += 8LL;
    }
    if ((v16 & 0x2000) != 0) {
      unint64_t v18 = v17 + 8;
    }
    else {
      unint64_t v18 = v17;
    }
  }

  else
  {
    unint64_t v18 = 0LL;
  }

  uint64_t v19 = v15 + 20;
  int v20 = *(_DWORD *)(v5 + 1816);
  if (v20)
  {
    uint64_t v21 = (2 * v20) & 8LL;
    if ((v20 & 8) != 0) {
      v21 += 8LL;
    }
    if ((v20 & 0x10) != 0) {
      uint64_t v22 = v21 + 8;
    }
    else {
      uint64_t v22 = v21;
    }
  }

  else
  {
    uint64_t v22 = 0LL;
  }

  if (v14 <= v18) {
    unint64_t v14 = v18;
  }
  *(void *)(v5 + 1824) = v14 + v19 + v22;
  *(_BYTE *)(v5 + 1833) = 0;
  *(_OWORD *)(v5 + 1848) = 0u;
  uint64_t v23 = DirEnumEntryAllocate(v5);
  if (!v23)
  {
    int v31 = *__error();
    goto LABEL_123;
  }

  uint64_t v24 = v23;
  *(void *)(v5 + 1840) = v23;
  *((_DWORD *)v23 + 12) = 0;
  *((_BYTE *)v23 + 52) &= ~1u;
  __int16 v25 = DirEnumEntryAllocate(v5);
  if (!v25)
  {
    int v31 = *__error();
LABEL_122:
    free(*(void **)(v5 + 1840));
    goto LABEL_123;
  }

  int v26 = v25;
  *uint64_t v24 = v25;
  *(void *)__int16 v25 = 0LL;
  *((void *)v25 + 1) = v5;
  *((void *)v25 + 4) = v3;
  uint64_t v27 = v25 + 2;
  *((void *)v25 + 2) = v3;
  *((void *)v25 + 5) = 0LL;
  *((_DWORD *)v25 + 12) = 1;
  *((_BYTE *)v25 + 52) = *((_BYTE *)v25 + 52) & 0xFC | 1;
  size_t v28 = *(void *)(v5 + 1824);
  uint64_t v29 = malloc(v28);
  *((void *)v26 + 7) = v29;
  if (!v29)
  {
    int v31 = *__error();
LABEL_121:
    free(**(void ***)(v5 + 1840));
    goto LABEL_122;
  }

  if (GetattrlistRetry((char *)v5, (_DWORD *)(v5 + 1796), (void **)v26 + 7, v28))
  {
    int v31 = *__error();
LABEL_120:
    free(*((void **)v26 + 7));
    goto LABEL_121;
  }

  if (!ParseAttributes( *((_DWORD **)v26 + 7),  &v40,  (void *)v26 + 3,  v27,  (_DWORD *)v26 + 16,  &v39,  &v38,  &v37,  &v36))
  {
    int v31 = 22;
    goto LABEL_120;
  }

  if (v39 != 2)
  {
    int v31 = 20;
    goto LABEL_120;
  }

  *(_DWORD *)(v5 + 1792) = *((_DWORD *)v26 + 16);
  uint64_t v35 = 0LL;
  __int128 v34 = xmmword_182EA5410;
  *((void *)v26 + 9) = 0LL;
  return v5;
}

_OWORD *DirEnumEntryAllocate(uint64_t a1)
{
  uint64_t result = *(_OWORD **)(a1 + 1848);
  if (!result) {
    return calloc(1uLL, 0x50uLL);
  }
  *(void *)(a1 + 1848) = *(void *)result;
  result[2] = 0u;
  result[3] = 0u;
  result[4] = 0u;
  *uint64_t result = 0u;
  result[1] = 0u;
  return result;
}

uint64_t GetattrlistRetry(char *a1, _DWORD *a2, void **a3, size_t a4)
{
  uint64_t result = filtered_getattrlist(a1, a2, *a3, a4, 0x25u);
  if (!(_DWORD)result)
  {
    size_t v9 = *(unsigned int *)*a3;
    if (v9 <= a4)
    {
      return 0LL;
    }

    else
    {
      if (v9 > 0x10000)
      {
        syslog(3, "GetattrlistRetry: realloc request too large (%d)", *(_DWORD *)*a3);
        *__error() = 12;
      }

      else
      {
        uint64_t v10 = realloc(*a3, *(unsigned int *)*a3);
        if (v10)
        {
          *a3 = v10;
          return filtered_getattrlist(a1, a2, v10, v9, 0x21u);
        }
      }

      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

uint64_t ParseAttributes( _DWORD *a1, _DWORD *a2, void *a3, void *a4, _DWORD *a5, _DWORD *a6, _BYTE *a7, _BYTE *a8, _BYTE *a9)
{
  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  *a8 = 0;
  *a9 = 0;
  unint64_t v9 = a1[1];
  if ((v9 & 1) != 0)
  {
    if ((v9 & 0x20000000) != 0)
    {
      *a2 = a1[6];
      uint64_t v19 = (int)a1[7];
      unint64_t v18 = a1 + 7;
      *a3 = (char *)v18 + v19;
      *a4 = (v18[1] - 1);
    }

    else
    {
      int v10 = a1[3];
      *a2 = 0;
      int v11 = a1[7];
      *a3 = (char *)a1 + a1[6] + 24;
      *a4 = (v11 - 1);
      uint64_t v12 = 9LL;
      if ((v9 & 2) == 0) {
        uint64_t v12 = 8LL;
      }
      uint64_t v13 = &a1[v12];
      if ((v9 & 4) != 0)
      {
        int v14 = *v13;
        v13 += 2;
        *a5 = v14;
      }

      if ((v9 & 8) != 0)
      {
        int v15 = *v13++;
        *a6 = v15;
      }

      int v16 = (int *)((char *)v13
                  + ((v9 >> 2) & 4)
                  + ((v9 >> 2) & 8)
                  + ((v9 >> 3) & 8)
                  + ((v9 >> 4) & 8)
                  + ((v9 >> 6) & 4)
                  + ((v9 >> 5) & 0x10)
                  + ((v9 >> 6) & 0x10)
                  + ((v9 >> 7) & 0x10)
                  + ((v9 >> 8) & 0x10)
                  + ((v9 >> 9) & 0x30)
                  + ((v9 >> 13) & 4)
                  + ((v9 >> 14) & 4)
                  + ((v9 >> 15) & 4));
      if ((v9 & 0x40000) != 0)
      {
        int v20 = *v16++;
        int v17 = v20 & 0x800000;
      }

      else
      {
        int v17 = 0;
      }

      if (*a6 == 2)
      {
        if (v17) {
          *a9 = 1;
        }
        if ((v10 & 4) != 0)
        {
          int v21 = *(int *)((char *)&v16[v10 & 1]
                       + ((v9 >> 22) & 8)
                       + ((v9 >> 17) & 4)
                       + (unint64_t)((v9 >> 18) & 4)
                       + ((v9 >> 19) & 4)
                       + ((v9 >> 19) & 8)
                       + ((v9 >> 19) & 0x10)
                       + ((v9 >> 20) & 0x10)
                       + ((v9 >> 23) & 8)
                       + (BYTE3(v9) & 0x18)
          if ((v21 & 1) != 0) {
            *a7 = 1;
          }
          if ((v21 & 2) != 0) {
            *a8 = 1;
          }
        }
      }
    }
  }

  else
  {
    *a2 = 22;
  }

  return v9 & 1;
}

uint64_t DirEnumRead(uint64_t a1)
{
  for (uint64_t i = *(void *)(a1 + 1840); ; uint64_t i = 0LL)
  {
    if (!i || *(_BYTE *)(a1 + 1833))
    {
      uint64_t i = 0LL;
      *(_BYTE *)(a1 + 1833) = 1;
      goto LABEL_43;
    }

    int v16 = 0;
    int v3 = *(_DWORD *)(i + 48);
    if (v3 == 1) {
      break;
    }
    if (!v3)
    {
      uint64_t v4 = *(void *)i;
LABEL_7:
      DirEnumEntryFree(a1, i);
      goto LABEL_31;
    }

    if (*(void *)i)
    {
      int v11 = NextEntryFromParent(a1, *(void *)i, &v17, &v16);
      if (v11 == 2)
      {
        uint64_t v4 = *(void *)i;
      }

      else
      {
        if (v11 == 1)
        {
          uint64_t v4 = *(void *)&v17.st_dev;
          goto LABEL_7;
        }

        uint64_t v4 = *(void *)i;
        *(_DWORD *)(v4 + 40) = v16;
        *(_DWORD *)(v4 + 48) = 6;
      }

      DirEnumEntryFree(a1, i);
      *(_BYTE *)(a1 + *(void *)(v4 + 16)) = 0;
      goto LABEL_31;
    }

    DirEnumEntryFree(a1, i);
LABEL_21:
    *(void *)(a1 + 1840) = 0LL;
LABEL_32:
    uint64_t v4 = 0LL;
    if (*(_BYTE *)(a1 + 1833)) {
      return v4;
    }
  }

  *(_DWORD *)(i + 48) = 2;
  if ((*(_BYTE *)(i + 52) & 2) != 0 || *(_DWORD *)(i + 64) != *(_DWORD *)(a1 + 1792)) {
    goto LABEL_43;
  }
  *(_BYTE *)(a1 + *(void *)(i + 16)) = 0;
  uint64_t v5 = malloc(0x30uLL);
  if (!v5)
  {
    int v14 = *__error();
    goto LABEL_40;
  }

  unsigned int v6 = v5;
  int v7 = open((const char *)a1, 17825792);
  *(_DWORD *)unsigned int v6 = v7;
  if ((v7 & 0x80000000) == 0)
  {
    int v8 = v7;
    if (!fstat(v7, &v17))
    {
      if (v17.st_dev != *(_DWORD *)(a1 + 1792))
      {
        int v14 = 18;
        goto LABEL_38;
      }

      v6[4] = 0;
      size_t v9 = 20LL * *(void *)(a1 + 1824);
      *((void *)v6 + 1) = a1;
      *((void *)v6 + 2) = v9;
      uint64_t v10 = *(void *)(a1 + 1856);
      if (v10)
      {
        *(void *)(a1 + 1856) = 0LL;
        *((void *)v6 + 3) = v10;
LABEL_23:
        *((void *)v6 + 4) = 0LL;
        *((void *)v6 + 5) = 0LL;
        *(void *)(i + 72) = v6;
        int v13 = NextEntryFromParent(a1, i, &v17, &v16);
        if (v13 != 2)
        {
          if (v13 == 1)
          {
            uint64_t v4 = *(void *)&v17.st_dev;
            goto LABEL_31;
          }

          *(_DWORD *)(i + 40) = v16;
          *(_DWORD *)(i + 48) = 6;
        }

        *(_BYTE *)(a1 + *(void *)(i + 16)) = 0;
        uint64_t v4 = i;
LABEL_31:
        *(void *)(a1 + 1840) = v4;
        if (v4) {
          return v4;
        }
        goto LABEL_32;
      }

      uint64_t v12 = malloc(v9);
      *((void *)v6 + 3) = v12;
      if (v12) {
        goto LABEL_23;
      }
    }

    int v14 = *__error();
LABEL_38:
    int v16 = v14;
    close(v8);
    goto LABEL_39;
  }

  int v14 = *__error();
  int v16 = v14;
LABEL_39:
  free(v6);
LABEL_40:
  *(void *)(i + 72) = 0LL;
  *(_DWORD *)(i + 40) = v14;
  if (v14 == 12)
  {
    DirEnumEntryFree(a1, i);
    *(_BYTE *)(a1 + 1833) = 1;
    goto LABEL_21;
  }

  if (v14 == 18) {
    *(_DWORD *)(i + 40) = 0;
  }
  else {
    *(_DWORD *)(i + 48) = 6;
  }
LABEL_43:
  *(void *)(a1 + 1840) = i;
  return i;
}

void DirEnumEntryFree(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(a2 + 52) & 1) != 0)
  {
    uint64_t v4 = *(void **)(a2 + 56);
    if (v4) {
      free(v4);
    }
  }

  uint64_t v5 = *(int **)(a2 + 72);
  if (v5)
  {
    int v6 = *v5;
    uint64_t v7 = *((void *)v5 + 1);
    int v8 = (void *)*((void *)v5 + 3);
    if (*(void *)(v7 + 1856)) {
      free(v8);
    }
    else {
      *(void *)(v7 + 1856) = v8;
    }
    free(v5);
    close(v6);
    *(void *)(a2 + 72) = 0LL;
  }

  *(void *)a2 = *(void *)(a1 + 1848);
  *(void *)(a1 + 1848) = a2;
}

uint64_t NextEntryFromParent(uint64_t a1, uint64_t a2, void *a3, int *a4)
{
  *a3 = 0LL;
  *a4 = 0;
  int v8 = DirEnumEntryAllocate(a1);
  *a3 = v8;
  if (!v8)
  {
    *a4 = *__error();
    return 3LL;
  }

  uint64_t v9 = (uint64_t)v8;
  uint64_t v10 = *(void *)(a2 + 72);
  if (*(_BYTE *)(v10 + 4))
  {
LABEL_3:
    DirEnumEntryFree(a1, v9);
    *a3 = 0LL;
    return 2LL;
  }

  int v13 = *(_DWORD *)(v10 + 40);
  LODWORD(v12) = *(_DWORD *)(v10 + 44);
  if ((int)v12 >= v13)
  {
    *(_DWORD *)(v10 + 44) = 0;
LABEL_11:
    int v14 = getattrlistbulk( *(_DWORD *)v10,  (void *)(*(void *)(v10 + 8) + 1796LL),  *(void **)(v10 + 24),  *(void *)(v10 + 16),  0x20uLL);
    if (v14 < 1)
    {
      *(_DWORD *)(v10 + 40) = 0;
      *(_BYTE *)(v10 + 4) = 1;
      if (v14)
      {
        int v15 = *__error();
        LODWORD(v12) = 3;
      }

      else
      {
        int v15 = 0;
        LODWORD(v12) = 2;
      }
    }

    else
    {
      int v15 = 0;
      *(_DWORD *)(v10 + 40) = v14;
      uint64_t v12 = *(void *)(v10 + 24);
      *(void *)(v10 + 32) = v12;
    }

    *a4 = v15;
    if (!*(_DWORD *)(v10 + 40)) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }

  if (!(_DWORD)v12) {
    goto LABEL_11;
  }
  if (!v13)
  {
LABEL_7:
    if ((_DWORD)v12 == 2) {
      goto LABEL_3;
    }
    DirEnumEntryFree(a1, v9);
    *a3 = 0LL;
    return 3LL;
  }

uint64_t DirEnumSkipDescendents(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 1840);
  if (*(_DWORD *)(v1 + 48) == 1)
  {
    uint64_t result = 0LL;
    *(_BYTE *)(v1 + 52) |= 2u;
  }

  else
  {
    *__error() = 20;
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t DirEnumClose(void *a1)
{
  uint64_t v2 = (void *)a1[230];
  if (v2)
  {
    do
    {
      int v3 = (void *)*v2;
      DirEnumEntryFree((uint64_t)a1, (uint64_t)v2);
      uint64_t v2 = v3;
    }

    while (v3);
  }

  uint64_t v4 = (void *)a1[231];
  if (v4)
  {
    do
    {
      uint64_t v5 = (void *)*v4;
      free(v4);
      uint64_t v4 = v5;
    }

    while (v5);
  }

  int v6 = (void *)a1[232];
  if (v6) {
    free(v6);
  }
  free(a1);
  return 0LL;
}

uint64_t DirEnumHasExtendedAttributes(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 1832);
}

uint64_t filtered_getattrlist(char *a1, _DWORD *a2, void *a3, size_t a4, unsigned int a5)
{
  if (filtered_getattrlist::onceToken != -1) {
    dispatch_once(&filtered_getattrlist::onceToken, &__block_literal_global_6);
  }
  if (filtered_getattrlist::isJazz) {
    a2[5] &= 0xFCu;
  }
  return getattrlist(a1, a2, a3, a4, a5);
}

uint64_t __filtered_getattrlist_block_invoke()
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  size_t v3 = 16LL;
  uint64_t result = sysctlbyname("kern.osproductversion", &v4, &v3, 0LL, 0LL);
  if (!(_DWORD)result)
  {
    BOOL v2 = v4 == 825110577 && v5 == 53;
    filtered_getattrlist::isJazz = v2;
  }

  return result;
}

uint64_t MountInfoStorageSize()
{
  return 3024LL;
}

uint64_t MountInfoPrepare( void *a1, int a2, int a3, char *a4, uint64_t a5, const __CFString *a6, CFErrorRef *a7)
{
  uint64_t v106 = *MEMORY[0x1895F89C0];
  if (*a1) {
    return 1LL;
  }
  if (a2) {
    a3 = a2;
  }
  bzero(a4, 0xBD0uLL);
  os_unfair_lock_lock(&sMountEntrysSpinLock);
  while (1)
  {
    int v12 = __ldaxr(sEntriesChanged);
    if (v12 != 1) {
      break;
    }
    if (!__stlxr(0, sEntriesChanged))
    {
      int v13 = 1;
      goto LABEL_12;
    }
  }

  int v13 = 0;
  __clrex();
LABEL_12:
  if (v13)
  {
    while (1)
    {
      int v14 = (void *)sMountEntrys;
      if (!sMountEntrys) {
        break;
      }
      sMountEntrys = *(void *)sMountEntrys;
      free(v14);
    }
  }

  int v15 = &sMountEntrys;
  while (1)
  {
    int v15 = (uint64_t *)*v15;
    if (!v15) {
      break;
    }
    if (*((_DWORD *)v15 + 14) == a3)
    {
      memcpy(a4, v15 + 1, 0xBD0uLL);
LABEL_19:
      os_unfair_lock_unlock(&sMountEntrysSpinLock);
      *a1 = a4;
      return 1LL;
    }
  }

  int v17 = getmntinfo_r_np(&v96, 2);
  if (v17)
  {
    unint64_t v18 = v96;
    if (v17 < 1)
    {
LABEL_27:
      int v21 = 2;
    }

    else
    {
      uint64_t v19 = v17;
      uint64_t v20 = v96;
      while (v20->f_fsid.val[0] != a3)
      {
        ++v20;
        if (!--v19) {
          goto LABEL_27;
        }
      }

      memcpy(a4, v20, 0x878uLL);
      int v21 = 0;
    }

    free(v18);
    if (!v21)
    {
LABEL_32:
      __int128 v93 = xmmword_182EA5558;
      uint64_t v94 = 0LL;
      bzero(&v96, 0x388uLL);
      int v21 = filtered_getattrlist(a4 + 88, &v93, &v96, 0x388uLL, 9u);
      if (!v21)
      {
        __int16 v24 = v97;
        if ((v97 & 0x20000) != 0)
        {
          *(int32x2_t *)v22.i8 = v100;
          *(int32x2_t *)v23.i8 = v101;
          int8x16_t v27 = (int8x16_t)vdupq_lane_s32(v100, 0);
          int8x16_t v28 = (int8x16_t)vdupq_lane_s32(v101, 0);
          int8x16_t v29 = (int8x16_t)vdupq_lane_s32(v100, 1);
          int32x4_t v30 = (int32x4_t)vandq_s8(v29, (int8x16_t)xmmword_182EA5430);
          int32x4_t v31 = vceqzq_s32((int32x4_t)vandq_s8(v29, (int8x16_t)xmmword_182EA5440));
          v32.i64[0] = v31.i32[2];
          v32.i64[1] = v31.i32[3];
          int8x16_t v33 = (int8x16_t)v32;
          int32x4_t v34 = vceqzq_s32(v30);
          v32.i64[0] = v34.i32[2];
          v32.i64[1] = v34.i32[3];
          int8x16_t v35 = (int8x16_t)v32;
          v32.i64[0] = v31.i32[0];
          v32.i64[1] = v31.i32[1];
          int8x16_t v36 = (int8x16_t)v32;
          v32.i64[0] = v34.i32[0];
          v32.i64[1] = v34.i32[1];
          int8x16_t v37 = (int8x16_t)v32;
          int8x16_t v38 = (int8x16_t)vdupq_lane_s32(v101, 1);
          int8x16_t v39 = vandq_s8(v38, (int8x16_t)xmmword_182EA5440);
          int8x16_t v40 = vandq_s8(v38, (int8x16_t)xmmword_182EA5430);
          v32.i64[0] = v40.u32[0];
          v32.i64[1] = v40.u32[1];
          uint64x2_t v41 = v32;
          v32.i64[0] = v39.u32[0];
          v32.i64[1] = v39.u32[1];
          uint64x2_t v42 = v32;
          v32.i64[0] = v40.u32[2];
          v32.i64[1] = v40.u32[3];
          int64x2_t v43 = (int64x2_t)v32;
          v32.i64[0] = v39.u32[2];
          v32.i64[1] = v39.u32[3];
          int8x16_t v44 = (int8x16_t)vshlq_n_s64(v43, 0x2CuLL);
          int8x16_t v45 = vbicq_s8((int8x16_t)vshlq_u64(v41, (uint64x2_t)xmmword_182EA5470), v37);
          int8x16_t v46 = vbicq_s8((int8x16_t)vshlq_u64(v42, (uint64x2_t)xmmword_182EA5460), v36);
          int8x16_t v47 = vbicq_s8(v44, v35);
          int8x16_t v48 = vbicq_s8((int8x16_t)vshlq_u64(v32, (uint64x2_t)xmmword_182EA5450), v33);
          int32x4_t v49 = (int32x4_t)vandq_s8(v27, (int8x16_t)xmmword_182EA5480);
          int32x4_t v50 = (int32x4_t)vandq_s8(v27, (int8x16_t)xmmword_182EA5490);
          int32x4_t v51 = vceqzq_s32((int32x4_t)vandq_s8(v27, (int8x16_t)xmmword_182EA54B0));
          v32.i64[0] = v51.i32[2];
          v32.i64[1] = v51.i32[3];
          int8x16_t v52 = (int8x16_t)v32;
          int32x4_t v53 = vceqzq_s32((int32x4_t)vandq_s8((int8x16_t)vzip1q_s32(v22, v22), (int8x16_t)xmmword_182EA54A0));
          v32.i64[0] = v53.i32[2];
          v32.i64[1] = v53.i32[3];
          int8x16_t v54 = (int8x16_t)v32;
          int32x4_t v55 = vceqzq_s32(v50);
          v32.i64[0] = v55.i32[2];
          v32.i64[1] = v55.i32[3];
          int8x16_t v56 = (int8x16_t)v32;
          int32x4_t v57 = vceqzq_s32(v49);
          v32.i64[0] = v57.i32[2];
          v32.i64[1] = v57.i32[3];
          int8x16_t v58 = (int8x16_t)v32;
          v32.i64[0] = v51.i32[0];
          v32.i64[1] = v51.i32[1];
          int8x16_t v59 = (int8x16_t)v32;
          v32.i64[0] = v53.i32[0];
          v32.i64[1] = v53.i32[1];
          int8x16_t v60 = (int8x16_t)v32;
          v32.i64[0] = v55.i32[0];
          v32.i64[1] = v55.i32[1];
          int8x16_t v61 = (int8x16_t)v32;
          v32.i64[0] = v57.i32[0];
          v32.i64[1] = v57.i32[1];
          int8x16_t v62 = (int8x16_t)v32;
          int8x16_t v63 = vandq_s8(v28, (int8x16_t)xmmword_182EA54B0);
          int8x16_t v64 = vandq_s8((int8x16_t)vzip1q_s32(v23, v23), (int8x16_t)xmmword_182EA54A0);
          int8x16_t v65 = vandq_s8(v28, (int8x16_t)xmmword_182EA5490);
          int8x16_t v66 = vandq_s8(v28, (int8x16_t)xmmword_182EA5480);
          v32.i64[0] = v66.u32[0];
          v32.i64[1] = v66.u32[1];
          uint64x2_t v67 = v32;
          v32.i64[0] = v65.u32[0];
          v32.i64[1] = v65.u32[1];
          uint64x2_t v68 = v32;
          v32.i64[0] = v64.u32[0];
          v32.i64[1] = v64.u32[1];
          int64x2_t v69 = (int64x2_t)v32;
          v32.i64[0] = v63.u32[0];
          v32.i64[1] = v63.u32[1];
          uint64x2_t v70 = v32;
          v32.i64[0] = v66.u32[2];
          v32.i64[1] = v66.u32[3];
          uint64x2_t v71 = v32;
          v32.i64[0] = v65.u32[2];
          v32.i64[1] = v65.u32[3];
          uint64x2_t v72 = v32;
          v32.i64[0] = v64.u32[2];
          v32.i64[1] = v64.u32[3];
          uint64x2_t v73 = v32;
          v32.i64[0] = v63.u32[2];
          v32.i64[1] = v63.u32[3];
          int8x16_t v74 = vorrq_s8( vorrq_s8( vorrq_s8( vorrq_s8( vbicq_s8((int8x16_t)vshlq_u64(v68, (uint64x2_t)xmmword_182EA5500), v61),  vbicq_s8((int8x16_t)vshlq_u64(v67, (uint64x2_t)xmmword_182EA5510), v62)),  vorrq_s8( vbicq_s8((int8x16_t)vshlq_u64(v70, (uint64x2_t)xmmword_182EA5500), v59),  vbicq_s8((int8x16_t)vshlq_n_s64(v69, 0x30uLL), v60))),  vorrq_s8( vorrq_s8( vbicq_s8((int8x16_t)vshlq_u64(v72, (uint64x2_t)xmmword_182EA54E0), v56),  vbicq_s8((int8x16_t)vshlq_u64(v71, (uint64x2_t)xmmword_182EA54F0), v58)),  vorrq_s8( vbicq_s8((int8x16_t)vshlq_u64(v32, (uint64x2_t)xmmword_182EA54C0), v52),  vbicq_s8((int8x16_t)vshlq_u64(v73, (uint64x2_t)xmmword_182EA54D0), v54)))),  vorrq_s8(vorrq_s8(v46, v45), vorrq_s8(v48, v47)));
          int8x8_t v75 = vorr_s8(*(int8x8_t *)v74.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v74, v74, 8uLL));
          uint64_t v76 = (uint64_t)v75;
          if ((v101.i16[0] & 0x8000) == 0 || (v100.i16[0] & 0x8000) == 0) {
            uint64_t v76 = *(void *)&v75 | 0x100000000000000LL;
          }
          if (v100.i16[2] < 0) {
            unint64_t v78 = (unint64_t)(v101.i16[2] & 0x8000) << 42;
          }
          else {
            unint64_t v78 = 0LL;
          }
          unint64_t v79 = (unint64_t)(v101.i16[0] & 0x2000) << 45;
          if ((v100.i16[0] & 0x2000) == 0) {
            unint64_t v79 = 0LL;
          }
          unint64_t v80 = (unint64_t)(v101.i32[0] & 0x10000) << 43;
          if ((v100.i32[0] & 0x10000) == 0) {
            unint64_t v80 = 0LL;
          }
          if ((v100.i32[0] & 0x20000) != 0) {
            unint64_t v81 = (unint64_t)(v101.i32[0] & 0x20000) << 43;
          }
          else {
            unint64_t v81 = 0LL;
          }
          *((void *)a4 + 369) = v80 | v79 | v81 | v78 | v45.i64[1] | v47.i64[0] | v47.i64[1] | v76;
          if ((BYTE5(v96) & 2) != 0) {
            *(_OWORD *)(a4 + 2168) = v98;
          }
          if ((v24 & 0x2000) != 0)
          {
            int v86 = a4 + 2184;
            gid_t v87 = (char *)v99 + v99[0];
          }

          else
          {
            if ((a4[65] & 0x10) != 0) {
              goto LABEL_61;
            }
            CFTypeRef v82 = a4 + 1112;
            size_t v83 = strlen(a4 + 1112);
            if (v83)
            {
              size_t v84 = v83 - 1;
              if (v82[v83 - 1] == 47)
              {
                strncpy(__dst, a4 + 1112, v84);
                __dst[v84] = 0;
                CFTypeRef v82 = __dst;
              }

              size_t v83 = (size_t)strrchr(v82, 47);
              if (!v83) {
LABEL_61:
              }
                size_t v83 = (size_t)strrchr(a4 + 88, 47);
            }

            if (v83) {
              size_t v85 = (const char *)v83;
            }
            else {
              size_t v85 = a4 + 88;
            }
            if (strlen(v85) != 1 && *v85 == 47) {
              ++v85;
            }
            int v86 = a4 + 2184;
            gid_t v87 = v85;
          }

          strlcpy(v86, v87, 0x2FEuLL);
          int v88 = v97;
          if ((v97 & 0x40000) != 0)
          {
            uuid_copy((unsigned __int8 *)a4 + 3000, v102);
            int v88 = v97;
          }

          if ((v88 & 0x40000000) != 0)
          {
            __int128 v89 = v104;
            *((_OWORD *)a4 + 185) = v103;
            *((_OWORD *)a4 + 186) = v89;
            *((void *)a4 + 374) = v105;
          }

          uint64_t v90 = pathconf(a4 + 88, 18);
          if (v90 == -1)
          {
            if ((a4[2958] & 1) != 0) {
              unint64_t v91 = 0x20000000000LL;
            }
            else {
              unint64_t v91 = -1LL;
            }
          }

          else if (v90 < 65)
          {
            if (v90 > 31) {
              unint64_t v91 = 0xFFFFFFFFFFFFFFFFLL >> (65 - v90);
            }
            else {
              unint64_t v91 = 0x7FFFFFFFLL;
            }
          }

          else
          {
            unint64_t v91 = 0x7FFFFFFFFFFFFFFFLL;
          }

          *((void *)a4 + 377) = v91;
          mode_t v92 = malloc(0xBD8uLL);
          memcpy(v92 + 1, a4, 0xBD0uLL);
          void *v92 = sMountEntrys;
          sMountEntrys = (uint64_t)v92;
          goto LABEL_19;
        }

        int v21 = 2;
      }
    }
  }

  else
  {
    int v21 = *__error();
    if (!v21) {
      goto LABEL_32;
    }
  }

  os_unfair_lock_unlock(&sMountEntrysSpinLock);
  uint64_t result = 0LL;
  if (a6)
  {
    if (a7)
    {
      int v25 = CFGetAllocator(a6);
      CFErrorRef v26 = _FSURLCreateStandardError(v25, (const __CFString *)*MEMORY[0x189604F58], v21, 0, a6, 0LL);
      uint64_t result = 0LL;
      *a7 = v26;
    }
  }

  return result;
}

uint64_t MountInfoPrepareWithMountPointString()
{
  return 1LL;
}

uint64_t MountInfoGetMountID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

uint64_t MountInfoGetMountPoint(uint64_t a1)
{
  return a1 + 88;
}

uint64_t MountInfoGetCapabilities(uint64_t a1)
{
  return *(void *)(a1 + 2952);
}

uint64_t MountInfoGetFSID(uint64_t a1)
{
  return *(void *)(a1 + 48);
}

uint64_t MountInfoGetIOBlockSize(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4);
}

uint64_t MountInfoGetVolumeName(uint64_t a1)
{
  return a1 + 2184;
}

uint64_t MountInfoGetVolumeFlags(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 64);
  if ((*(_BYTE *)(a1 + 2136) & 2) != 0)
  {
    uint64_t v3 = 64LL;
  }

  else
  {
    int v2 = strcmp((const char *)(a1 + 72), "lifs");
    uint64_t v3 = 128LL;
    if (!v2) {
      uint64_t v3 = 64LL;
    }
  }

  uint64_t v4 = v3 | (v1 << 9) & 0x800000 | ((v1 >> 21) & 2 | (v1 >> 12) & 1 | (v1 >> 18) & 4 | (8 * (v1 & 1)) | (v1 >> 6) & 0x10) ^ 1;
  if ((v1 & 0x80) != 0) {
    v4 |= 0x3000000uLL;
  }
  return v4 | (32 * v1) & 0x4000000;
}

uint64_t MountInfoGetVolumeCreationDate(uint64_t a1)
{
  return *(void *)(a1 + 2168);
}

uint64_t MountInfoGetVolumeUUID(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v3 = (const unsigned __int8 *)(a1 + 3000);
  uuid_copy(a2, v3);
  return 1LL;
}

uint64_t MountInfoGetMaxFileSize(uint64_t a1)
{
  return *(void *)(a1 + 3016);
}

uint64_t MountInfoGetMutableVolumeInfo(const char *a1, void *a2, void *a3, void *a4, uint64_t *a5)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if ((~*((_DWORD *)a1 + 741) & 0x614) != 0)
  {
    uint64_t result = statfs(a1 + 88, &v17);
    if (!(_DWORD)result)
    {
      *a2 = v17.f_files - v17.f_ffree;
      *a3 = 0LL;
      uint64_t f_bsize = v17.f_bsize;
      uint64_t f_bavail = v17.f_bavail;
      *a4 = v17.f_blocks * v17.f_bsize;
      uint64_t v12 = f_bavail * f_bsize;
      goto LABEL_8;
    }
  }

  else
  {
    v16[2] = 0LL;
    v16[0] = 5LL;
    v16[1] = 2147485204LL;
    uint64_t result = filtered_getattrlist((char *)a1 + 88, v16, &v17, 0x1CuLL, 0);
    if (!(_DWORD)result)
    {
      uint64_t f_bavail_low = LODWORD(v17.f_bavail);
      *a2 = HIDWORD(v17.f_bfree);
      *a3 = f_bavail_low;
      *a4 = *(void *)&v17.f_iosize;
      uint64_t v12 = *(uint64_t *)((char *)&v17.f_blocks + 4);
LABEL_8:
      *a5 = v12;
      return result;
    }
  }

  *a2 = *((void *)a1 + 4) - *((void *)a1 + 5);
  *a3 = 0LL;
  uint64_t v13 = *(unsigned int *)a1;
  *a4 = *((void *)a1 + 1) * v13;
  *a5 = *((void *)a1 + 3) * v13;
  return result;
}

uint64_t PosixToOSStatusTranslate(int a1)
{
  if (a1 >= -1)
  {
    while (2)
    {
      if (a1 <= 62)
      {
        int v2 = a1 + 1;
        LOWORD(a1) = 0;
        switch(v2)
        {
          case 0:
            if (*__error() == -1) {
              goto LABEL_18;
            }
            a1 = *__error();
            if (a1 < -1) {
              return (__int16)a1;
            }
            continue;
          case 1:
            return (__int16)a1;
          case 2:
          case 14:
            LOWORD(a1) = -5000;
            return (__int16)a1;
          case 3:
            LOWORD(a1) = -43;
            return (__int16)a1;
          case 10:
            LOWORD(a1) = -51;
            return (__int16)a1;
          case 13:
          case 24:
            LOWORD(a1) = -41;
            return (__int16)a1;
          case 17:
            goto LABEL_15;
          case 18:
            LOWORD(a1) = -48;
            return (__int16)a1;
          case 19:
            LOWORD(a1) = -1303;
            return (__int16)a1;
          case 21:
            LOWORD(a1) = -1407;
            return (__int16)a1;
          case 23:
            LOWORD(a1) = -50;
            return (__int16)a1;
          case 25:
            LOWORD(a1) = -42;
            return (__int16)a1;
          case 28:
            LOWORD(a1) = -1309;
            return (__int16)a1;
          case 29:
            LOWORD(a1) = -34;
            return (__int16)a1;
          case 31:
            LOWORD(a1) = -61;
            return (__int16)a1;
          default:
            goto LABEL_18;
        }
      }

      break;
    }

    if (a1 <= 68)
    {
      if (a1 == 63)
      {
        LOWORD(a1) = -37;
        return (__int16)a1;
      }

      if (a1 == 66)
      {
LABEL_15:
        LOWORD(a1) = -47;
        return (__int16)a1;
      }
    }

    else
    {
      switch(a1)
      {
        case 'E':
          LOWORD(a1) = -1425;
          return (__int16)a1;
        case 'P':
          LOWORD(a1) = -5023;
          return (__int16)a1;
        case 'Y':
          LOWORD(a1) = -128;
          return (__int16)a1;
      }
    }

LABEL_18:
    LOWORD(a1) = -36;
  }

  return (__int16)a1;
}

uint64_t CreateMountPointArray(uint64_t a1, char a2, uint64_t *a3, void *a4)
{
  *a4 = 0LL;
  uint64_t v19 = 0LL;
  int v8 = getmntinfo_r_np(&v19, 2);
  if (v8 < 1)
  {
    uint64_t v10 = 0LL;
    uint64_t v13 = *__error();
  }

  else
  {
    unsigned int v9 = v8;
    uint64_t v10 = MEMORY[0x186E19944](a1, (unint64_t)v8 << 10, 0LL);
    if (v10)
    {
      unint64_t v11 = 0LL;
      uint64_t v12 = 2168LL * v9;
      do
      {
        if ((a2 & 2) == 0 || (v19[v11 / 0x878].f_flags & 0x500000) == 0)
        {
          __int128 v15 = xmmword_182EA5540;
          uint64_t v16 = 0LL;
          memset(v17, 0, sizeof(v17));
          int v18 = 0;
          if (!filtered_getattrlist(v19[v11 / 0x878].f_mntonname, &v15, v17, 0x24uLL, 1u)
            && strlcpy((char *)(v10 + (*a4 << 10)), v19[v11 / 0x878].f_mntonname, 0x400uLL) <= 0x3FF)
          {
            ++*a4;
          }
        }

        v11 += 2168LL;
      }

      while (v12 != v11);
      uint64_t v13 = 0LL;
    }

    else
    {
      uint64_t v13 = 12LL;
    }

    free(v19);
  }

  *a3 = v10;
  return v13;
}

uint64_t ConvertCFAbsoluteTimeToUTCDateTime(uint64_t a1, double a2)
{
  if (!a1) {
    return 4294967246LL;
  }
  double v2 = a2 + 3061152000.0;
  if (v2 <= 9.22337204e18)
  {
    if (v2 >= -9.22337204e18)
    {
      if (v2 < 0.0) {
        goto LABEL_9;
      }
      if (v2 > -0.5 && v2 < 0.5) {
        unint64_t v3 = 0LL;
      }
      else {
        unint64_t v3 = (unint64_t)v2;
      }
      if (v3 > 0xFFFFFFFFFFFELL) {
        goto LABEL_4;
      }
    }

    else
    {
      if (v2 < 0.0) {
        goto LABEL_9;
      }
      unint64_t v3 = 0LL;
    }

    unint64_t v5 = HIDWORD(v3);
    double v9 = v2 * 65536.0 + 0.5;
    if (v9 <= 9.22337204e18)
    {
      if (v9 >= -9.22337204e18 && (v9 < 0.5 ? (BOOL v10 = v9 <= -0.5) : (BOOL v10 = 1), v10)) {
        unint64_t v4 = (unint64_t)v9;
      }
      else {
        LOWORD(v4) = 0;
      }
    }

    else
    {
      LOWORD(v4) = -1;
    }

    goto LABEL_10;
  }

  if (v2 < 0.0)
  {
LABEL_9:
    LOWORD(v4) = 0;
    LODWORD(v3) = 0;
    LOWORD(v5) = 0;
    goto LABEL_10;
  }

void ___ZL15CreateMountInfoiP12MountInfoBuf_block_invoke()
{
  int v0 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_UTILITY, 0);
  unsigned int v1 = dispatch_queue_create("com.apple.coreservicesinternal.vfs_notifications", v0);
  if (v1)
  {
    CreateMountInfo(int,MountInfoBuf *)::source = (uint64_t)dispatch_source_create( MEMORY[0x1895F8B80],  0LL,  0x118uLL,  v1);
    dispatch_source_set_event_handler( (dispatch_source_t)CreateMountInfo(int,MountInfoBuf *)::source,  &__block_literal_global_8_0);
    dispatch_resume((dispatch_object_t)CreateMountInfo(int,MountInfoBuf *)::source);
  }

void ___ZL15CreateMountInfoiP12MountInfoBuf_block_invoke_2()
{
}

void registerExternalProviderProperties(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  {
    registerExternalProviderProperties::thumbnailsDependencyKeys = *MEMORY[0x1896052B8];
  }

  {
    registerExternalProviderProperties::propertyTable[0] = *MEMORY[0x1896053D8];
    unk_18C463BD0 = 0LL;
    qword_18C463BD8 = (uint64_t)CopyFromFileProvider;
    unk_18C463BE0 = 0LL;
    qword_18C463BE8 = 0LL;
    unk_18C463BF0 = 0LL;
    qword_18C463BF8 = *MEMORY[0x1896054A0];
    unk_18C463C00 = 0LL;
    qword_18C463C08 = (uint64_t)CopyFromFileProvider;
    unk_18C463C10 = 0LL;
    qword_18C463C18 = 0LL;
    unk_18C463C20 = 0LL;
    qword_18C463C28 = *MEMORY[0x1896054B0];
    unk_18C463C30 = 0LL;
    qword_18C463C38 = (uint64_t)CopyFromFileProvider;
    unk_18C463C40 = 0LL;
    qword_18C463C48 = 0LL;
    unk_18C463C50 = 0LL;
    qword_18C463C58 = *MEMORY[0x189604D20];
    unk_18C463C60 = 0LL;
    qword_18C463C68 = (uint64_t)CopyFromFileProvider;
    unk_18C463C70 = 0LL;
    qword_18C463C78 = 0LL;
    unk_18C463C80 = 0LL;
    qword_18C463C88 = *MEMORY[0x189605498];
    unk_18C463C90 = 0LL;
    qword_18C463C98 = (uint64_t)CopyFromFileProvider;
    unk_18C463CA0 = 0LL;
    qword_18C463CA8 = 0LL;
    unk_18C463CB0 = 0LL;
    qword_18C463CB8 = *MEMORY[0x189605490];
    unk_18C463CC0 = 0LL;
    qword_18C463CC8 = (uint64_t)CopyFromFileProvider;
    unk_18C463CD0 = 0LL;
    qword_18C463CD8 = 0LL;
    unk_18C463CE0 = 0LL;
    qword_18C463CE8 = *MEMORY[0x1896054E0];
    unk_18C463CF0 = 0LL;
    qword_18C463CF8 = (uint64_t)CopyFromFileProvider;
    unk_18C463D00 = 0LL;
    qword_18C463D08 = 0LL;
    unk_18C463D10 = 0LL;
    qword_18C463D18 = *MEMORY[0x1896054C0];
    unk_18C463D20 = 0LL;
    qword_18C463D28 = (uint64_t)CopyFromFileProvider;
    unk_18C463D30 = 0LL;
    qword_18C463D38 = 0LL;
    unk_18C463D40 = 0LL;
    qword_18C463D48 = *MEMORY[0x1896054C8];
    unk_18C463D50 = 0LL;
    qword_18C463D58 = (uint64_t)CopyFromFileProvider;
    unk_18C463D60 = 0LL;
    qword_18C463D68 = 0LL;
    unk_18C463D70 = 0LL;
    qword_18C463D78 = *MEMORY[0x189605488];
    unk_18C463D80 = 0LL;
    qword_18C463D88 = (uint64_t)CopyFromFileProvider;
    unk_18C463D90 = 0LL;
    qword_18C463D98 = 0LL;
    unk_18C463DA0 = 0LL;
    qword_18C463DA8 = *MEMORY[0x189605480];
    unk_18C463DB0 = 0LL;
    qword_18C463DC0 = 0LL;
    unk_18C463DC8 = 0LL;
    qword_18C463DB8 = (uint64_t)CopyFromFileProvider;
    qword_18C463DD0 = 0LL;
    qword_18C463DD8 = *MEMORY[0x1896054B8];
    qword_18C463DE0 = 0LL;
    qword_18C463DE8 = (uint64_t)CopyFromFileProvider;
    qword_18C463DF8 = 0LL;
    qword_18C463DF0 = 0LL;
    qword_18C463E00 = 0LL;
    qword_18C463E08 = *MEMORY[0x189605500];
    qword_18C463E10 = 0LL;
    qword_18C463E18 = (uint64_t)CopyFromFileProvider;
    qword_18C463E28 = 0LL;
    qword_18C463E20 = 0LL;
    qword_18C463E30 = 0LL;
    qword_18C463E38 = *MEMORY[0x189605508];
    qword_18C463E40 = 0LL;
    qword_18C463E48 = (uint64_t)CopyFromFileProvider;
    qword_18C463E58 = 0LL;
    qword_18C463E50 = 0LL;
    qword_18C463E60 = 0LL;
    qword_18C463E68 = *MEMORY[0x189605510];
    qword_18C463E70 = 0LL;
    qword_18C463E78 = (uint64_t)CopyFromFileProvider;
    qword_18C463E88 = 0LL;
    qword_18C463E80 = 0LL;
    qword_18C463E90 = 0LL;
    qword_18C463E98 = *MEMORY[0x1896054F0];
    qword_18C463EA0 = 0LL;
    qword_18C463EA8 = (uint64_t)CopyFromFileProvider;
    qword_18C463EB8 = 0LL;
    qword_18C463EB0 = 0LL;
    qword_18C463EC0 = 0LL;
    qword_18C463EC8 = *MEMORY[0x1896054E8];
    qword_18C463ED0 = 0LL;
    qword_18C463ED8 = (uint64_t)CopyFromFileProvider;
    qword_18C463EE8 = 0LL;
    qword_18C463EE0 = 0LL;
    qword_18C463EF0 = 0LL;
    qword_18C463EF8 = *MEMORY[0x1896054F8];
    qword_18C463F00 = 0LL;
    qword_18C463F08 = (uint64_t)CopyFromFileProvider;
    qword_18C463F18 = 0LL;
    qword_18C463F10 = 0LL;
    qword_18C463F20 = 0LL;
    qword_18C463F28 = (uint64_t)@"NSURLUbiquitousItemIsExcludedFromSyncKey";
    qword_18C463F30 = 0LL;
    qword_18C463F38 = (uint64_t)CopyFromFileProvider;
    qword_18C463F40 = (uint64_t)SetWithFileProvider;
    qword_18C463F50 = 0LL;
    qword_18C463F48 = 0LL;
    qword_18C463F58 = *MEMORY[0x1896054D0];
    qword_18C463F60 = 0LL;
    qword_18C463F68 = (uint64_t)CopyFromFileProvider;
    qword_18C463F78 = 0LL;
    qword_18C463F70 = 0LL;
    qword_18C463F80 = 0LL;
    qword_18C463F88 = *MEMORY[0x1896054D8];
    qword_18C463F90 = 0LL;
    qword_18C463F98 = (uint64_t)CopyFromFileProvider;
    qword_18C463FA8 = 0LL;
    qword_18C463FA0 = 0LL;
    qword_18C463FB0 = 0LL;
    qword_18C463FB8 = *MEMORY[0x1896054A8];
    qword_18C463FC0 = 0LL;
    qword_18C463FC8 = (uint64_t)CopyFromFileProvider;
    qword_18C463FD8 = 0LL;
    qword_18C463FD0 = 0LL;
    qword_18C463FE0 = 0LL;
    qword_18C463FE8 = *MEMORY[0x189604BC0];
    qword_18C463FF0 = 0LL;
    qword_18C463FF8 = (uint64_t)GetFromCFURLPromises;
    qword_18C464000 = (uint64_t)SetWithCFURLPromises;
    qword_18C464010 = 0LL;
    qword_18C464008 = 0LL;
    qword_18C464018 = *MEMORY[0x189604BC8];
    qword_18C464020 = 0LL;
    qword_18C464028 = (uint64_t)GetFromCFURLPromises;
    qword_18C464030 = (uint64_t)SetWithCFURLPromises;
    qword_18C464040 = 0LL;
    qword_18C464038 = 0LL;
    qword_18C464048 = *MEMORY[0x189605458];
    qword_18C464050 = 2LL;
    qword_18C464058 = (uint64_t)GetFromQuickLook;
    qword_18C464060 = (uint64_t)SetWithQuickLook;
    qword_18C464068 = (uint64_t)&registerExternalProviderProperties::thumbnailsDependencyKeys;
    qword_18C464070 = 1LL;
    qword_18C464078 = *MEMORY[0x189605460];
    qword_18C464080 = 2LL;
    qword_18C464088 = (uint64_t)GetFromQuickLook;
    qword_18C464090 = (uint64_t)SetWithQuickLook;
    qword_18C464098 = (uint64_t)&registerExternalProviderProperties::thumbnailsDependencyKeys;
    qword_18C4640A0 = 1LL;
  }

  v8[0] = xmmword_189C5B810;
  v8[1] = *(_OWORD *)&off_189C5B820;
  MEMORY[0x1895F8858](a1);
  uint64_t v1 = 0LL;
  double v2 = registerExternalProviderProperties::propertyTable;
  do
  {
    unint64_t v3 = v2 + 6;
    uint64_t v4 = *v2;
    v2 += 12;
    *(void *)&__int128 v5 = v4;
    *((void *)&v5 + 1) = *v3;
    *(_OWORD *)&v7[v1] = v5;
    v1 += 2LL;
  }

  while (v1 != 26);
  _RegisterFilePropertyProvider(v8, 0LL, v7, 0x1AuLL);
  for (uint64_t i = 0LL; i != 156; i += 6LL)
    _RegisterFilePropertyWithOptions( (void *)registerExternalProviderProperties::propertyTable[i],  registerExternalProviderProperties::propertyTable[i + 1],  (const void **)registerExternalProviderProperties::propertyTable[i + 4],  registerExternalProviderProperties::propertyTable[i + 5],  (uint64_t)&registerExternalProviderProperties::propertyTable[i]);
}

uint64_t CopyFromFileProvider(const __CFURL *a1, const void *a2, const void **a3, __CFError **a4)
{
  *a3 = 0LL;
  return 1LL;
}

uint64_t SetWithFileProvider(const __CFURL *a1, const __CFString *a2, const void *a3, __CFError **a4)
{
  return 1LL;
}

uint64_t GetFromCFURLPromises(const __CFURL *a1, const void *a2, const void **a3, __CFError **a4)
{
  return _CFURLPromiseCopyResourcePropertyForKey();
}

uint64_t SetWithCFURLPromises(const __CFURL *a1, const __CFString *a2, const void *a3, __CFError **a4)
{
  return _CFURLPromiseSetResourcePropertyForKey();
}

uint64_t GetFromQuickLook(const __CFURL *a1, const void *a2, const void **a3, __CFError **a4, double a5)
{
  double Helper_x8___QLCopyResourcePropertyForKey = gotLoadHelper_x8___QLCopyResourcePropertyForKey(a5);
  if (*(void *)(v6 + 3472))
  {
    return _QLCopyResourcePropertyForKey_delayInitStub(Helper_x8___QLCopyResourcePropertyForKey);
  }

  else
  {
    *a3 = 0LL;
    return 1;
  }

uint64_t SetWithQuickLook(const __CFURL *a1, const __CFString *a2, const void *a3, __CFError **a4, double a5)
{
  double Helper_x8___QLSetResourcePropertyForKey = gotLoadHelper_x8___QLSetResourcePropertyForKey(a5);
  if (*(void *)(v6 + 3480)) {
    return _QLSetResourcePropertyForKey_delayInitStub(Helper_x8___QLSetResourcePropertyForKey);
  }
  else {
    return 1;
  }
}

uint64_t ExternalProviderCopyValues( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, const void ***a5, uint64_t a6)
{
  if (a6 < 1) {
    return 1LL;
  }
  cf[5] = v6;
  cf[6] = v7;
  uint64_t v8 = a6;
  while (1)
  {
    uint64_t result = _FileCacheGetPropertyValueForKey(a2, **a5, (void **)cf);
    if (!(_DWORD)result) {
      break;
    }
    if (cf[0])
    {
      CFRetain(cf[0]);
      CFTypeRef v13 = cf[0];
    }

    else
    {
      CFTypeRef v13 = 0LL;
    }

    *a4++ = v13;
    ++a5;
    if (!--v8) {
      return 1LL;
    }
  }

  *a4 = 0LL;
  return result;
}

uint64_t ExternalProviderPrepareValues( const __CFURL *a1, uint64_t a2, const void **a3, uint64_t *a4, uint64_t a5, uint64_t a6, __CFError **a7)
{
  if (a5 < 1) {
    return 1LL;
  }
  uint64_t v8 = a5;
  CFMutableArrayRef Mutable = 0LL;
  CFTypeRef cf2 = (CFTypeRef)*MEMORY[0x1896054D0];
  char allocator = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFTypeRef v25 = (CFTypeRef)*MEMORY[0x1896054D8];
  while (1)
  {
    int v14 = *a3;
    uint64_t v15 = *a4;
LABEL_4:
    ++a4;
    ++a3;
    if (!--v8)
    {
      uint64_t v17 = 1LL;
      if (!Mutable) {
        return v17;
      }
      goto LABEL_17;
    }
  }

  uint64_t v16 = *(uint64_t (**)(const __CFURL *, const void *, const void **, __CFError **))(v15 + 16);
  if (v16 == CopyFromFileProvider)
  {
    if (CFEqual(v14, cf2) || CFEqual(v14, v25))
    {
      _FileCacheSetPropertyValueForKey(a2, v14, 0LL);
    }

    else
    {
      if (!Mutable) {
        CFMutableArrayRef Mutable = CFArrayCreateMutable(allocator, 0LL, MEMORY[0x189605228]);
      }
      CFArrayAppendValue(Mutable, v14);
    }

    goto LABEL_4;
  }

  if (v16(a1, v14, &cf, a7))
  {
    _FileCacheSetPropertyValueForKey(a2, v14, cf);
    if (cf) {
      CFRelease(cf);
    }
    goto LABEL_4;
  }

  uint64_t v17 = 0LL;
  if (!Mutable) {
    return v17;
  }
LABEL_17:
  CFTypeRef cf = 0LL;
  if (CopyFromFileProvider(a1, Mutable, &cf, a7))
  {
    if (cf)
    {
      CFIndex Count = CFArrayGetCount(Mutable);
      if (Count >= 1)
      {
        CFIndex v19 = Count;
        for (CFIndex i = 0LL; i != v19; ++i)
        {
          CFTypeRef ValueAtIndex = CFArrayGetValueAtIndex(Mutable, i);
          int Value = CFDictionaryGetValue((CFDictionaryRef)cf, ValueAtIndex);
          _FileCacheSetPropertyValueForKey(a2, ValueAtIndex, Value);
        }
      }

      CFRelease(cf);
    }
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  CFRelease(Mutable);
  return v17;
}

uint64_t ExternalProviderSetValues( uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a6 < 1) {
    return 1LL;
  }
  uint64_t v9 = a6;
  while (1)
  {
    int v14 = *(uint64_t (**)(uint64_t, void, void, uint64_t))(*(void *)a5 + 24LL);
    if (v14)
    {
      uint64_t result = v14(a1, *a3, *a4, a8);
      if (!(_DWORD)result) {
        break;
      }
    }

    a5 += 8LL;
    ++a4;
    ++a3;
    if (!--v9) {
      return 1LL;
    }
  }

  return result;
}

uint64_t _CFURLCopySecurityEAs()
{
  return 0LL;
}

void _URLAttachSecurityScopeToFileURL(const __CFURL *a1, CFDataRef a2)
{
  if (a1 && _CFURLIsFileURL())
  {
    if (a2)
    {
      CFTypeID v4 = CFGetTypeID(a2);
      if (v4 == CFDataGetTypeID())
      {
        CFIndex Length = CFDataGetLength(a2);
        if (Length && !CFDataGetBytePtr(a2)[Length - 1])
        {
          CFDataRef Copy = 0LL;
        }

        else
        {
          uint64_t v6 = CFGetAllocator(a2);
          MutableCFDataRef Copy = CFDataCreateMutableCopy(v6, 0LL, a2);
          if (!MutableCopy) {
            return;
          }
          uint64_t v8 = MutableCopy;
          CFDataAppendBytes(MutableCopy, (const UInt8 *)&_URLAttachSecurityScopeToFileURL::zero, 1LL);
          uint64_t v9 = CFGetAllocator(a2);
          CFDataRef Copy = CFDataCreateCopy(v9, v8);
          CFRelease(v8);
          a2 = Copy;
          if (!Copy) {
            return;
          }
        }

        int v14 = (os_log_s *)securityScopedLog;
        if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG)) {
          _URLAttachSecurityScopeToFileURL_cold_3((uint64_t)a1, a2, v14);
        }
        _FSURLSetPermanentResourcePropertyForKey(a1, @"_NSURLSecuritySandboxExtensionKey", a2);
        uint64_t v16 = (os_unfair_lock_s *)SandboxExtensionCache::shared(v15);
        SandboxExtensionCache::insert(v16, a1, a2);
        if (Copy) {
          CFRelease(Copy);
        }
      }

      else
      {
        CFTypeRef v13 = (os_log_s *)securityScopedLog;
        if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR)) {
          _URLAttachSecurityScopeToFileURL_cold_4(v13);
        }
      }
    }

    else
    {
      uint64_t v12 = (os_log_s *)securityScopedLog;
      if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_DEBUG)) {
        _URLAttachSecurityScopeToFileURL_cold_2((uint64_t)a1, v12);
      }
      _FSURLSetPermanentResourcePropertyForKey(a1, @"_NSURLSecuritySandboxExtensionKey", 0LL);
    }
  }

  else
  {
    unint64_t v11 = (os_log_s *)securityScopedLog;
    if (os_log_type_enabled((os_log_t)securityScopedLog, OS_LOG_TYPE_ERROR)) {
      _URLAttachSecurityScopeToFileURL_cold_1((uint64_t)a1, v11);
    }
  }

CFDataRef _URLCopySecurityScopeFromFileURL(CFDataRef result)
{
  CFTypeRef propertyValueTypeRefPtr = 0LL;
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = (CFDataRef)CFURLCopyResourcePropertyForKey( v1,  @"_NSURLSecuritySandboxExtensionKey",  &propertyValueTypeRefPtr,  0LL);
    if ((_DWORD)result && (uint64_t result = propertyValueTypeRefPtr) != 0LL
      || (double v2 = (SandboxExtensionCache *)SandboxExtensionCache::shared(result),
          uint64_t result = SandboxExtensionCache::copyExtensionForURL(v2, v1),
          (CFTypeRef propertyValueTypeRefPtr = result) != 0LL))
    {
      CFTypeID v3 = CFGetTypeID(result);
      CFTypeID TypeID = CFDataGetTypeID();
      uint64_t result = propertyValueTypeRefPtr;
      if (v3 != TypeID)
      {
        CFRelease(propertyValueTypeRefPtr);
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t _FSGetTypeInfoFromStatfs(uint64_t a1, char *a2, size_t a3, _DWORD *a4)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (!check_mntfromname((const char *)(a1 + 72)))
  {
    __strlcpy_chk();
    if (!a2) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  uint64_t v8 = a1 + 1112;
  uint64_t v9 = strstr((const char *)(a1 + 1112), "://");
  if (!v9) {
    return 22LL;
  }
  else {
    uint64_t v10 = (uint64_t)&v9[-v8];
  }
  __memcpy_chk();
  __source[v10] = 0;
  if (a2) {
LABEL_9:
  }
    strlcpy(a2, __source, a3);
LABEL_10:
  uint64_t result = 0LL;
  if (a4) {
    *a4 = *(_DWORD *)(a1 + 68);
  }
  return result;
}

BOOL check_mntfromname(const char *a1)
{
  return !strcmp(a1, "lifs") || strcmp(a1, "fskit") == 0;
}

uint64_t _FSGetTypeInfoForPath(const char *a1, char *a2, size_t a3, _DWORD *a4)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (statfs(a1, &v8) == -1) {
    return *__error();
  }
  else {
    return _FSGetTypeInfoFromStatfs((uint64_t)&v8, a2, a3, a4);
  }
}

uint64_t _FSGetTypeInfoForFileDescriptor(int a1, char *a2, size_t a3, _DWORD *a4)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (fstatfs(a1, &v8) == -1) {
    return *__error();
  }
  else {
    return _FSGetTypeInfoFromStatfs((uint64_t)&v8, a2, a3, a4);
  }
}

uint64_t _FSGetLocationFromStatfs(uint64_t a1, char *a2, size_t a3)
{
  uint64_t v6 = calloc(1uLL, 0x400uLL);
  if (v6)
  {
    uint64_t v7 = v6;
    if (check_mntfromname((const char *)(a1 + 72)))
    {
      statfs v8 = strstr((const char *)(a1 + 1112), "://");
      if (!v8 || (v9 = v8 + 3, (uint64_t v10 = strchr(v8 + 3, 47)) == 0LL))
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

uint64_t _FSGetLocationForPath(const char *a1, char *a2, size_t a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (statfs(a1, &v6) == -1) {
    return *__error();
  }
  else {
    return _FSGetLocationFromStatfs((uint64_t)&v6, a2, a3);
  }
}

uint64_t _FSGetLocationForFileDescriptor(int a1, char *a2, size_t a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (fstatfs(a1, &v6) == -1) {
    return *__error();
  }
  else {
    return _FSGetLocationFromStatfs((uint64_t)&v6, a2, a3);
  }
}

void BookmarkData::BookmarkData(uint64_t a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = 136315394;
  CFTypeID v3 = "BookmarkData";
  __int16 v4 = 2080;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_182E77000, a2, OS_LOG_TYPE_ERROR, "%s: %s", (uint8_t *)&v2, 0x16u);
}

void BookmarkData::copyItem(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 134349056;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_182E77000,  a2,  OS_LOG_TYPE_ERROR,  "BookmarkData: Corrupt bookmark file; container dataItemPtr %{public}p already used",
    (uint8_t *)&v2,
    0xCu);
}

void BookmarkMutableData::Finalize()
{
  __assert_rtn("Finalize", "BookmarkData.cpp", 1672, "scopeKeyLength == kBookmarkSecurityScopeCookieSize");
}

void __CFURLCreateBookmarkData(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 136315138;
  int v2 = "__CFURLCreateBookmarkData";
  _os_log_error_impl( &dword_182E77000,  log,  OS_LOG_TYPE_ERROR,  "%s: NULL result with no real error",  (uint8_t *)&v1,  0xCu);
}

void _CFURLCreateBookmarkData_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = 134218242;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_182E77000, a2, OS_LOG_TYPE_DEBUG, "result=<%p %@>", (uint8_t *)&v2, 0x16u);
}

void _FileCacheCopyDebugDesc()
{
  __assert_rtn("_FileCacheCopyDebugDesc", "FileCache.cp", 219, "formatter != NULL");
}

{
  __assert_rtn("_FileCacheCopyDebugDesc", "FileCache.cp", 223, "result != NULL");
}

void _CFURLCreateBookmarkDataFromFile_cold_1()
{
  *(_WORD *)int v0 = 0;
  _os_log_error_impl( &dword_182E77000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "_URLCreateByResolvingAliasFile: NULL result with no real error",  v0,  2u);
}

void _CFURLWriteBookmarkDataToFile_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_182E77000,  log,  OS_LOG_TYPE_ERROR,  "FAILED creating bookmark file at %@, error=%@",  (uint8_t *)&v3,  0x16u);
}

void _CFURLWriteBookmarkDataToFile_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v3 = 136315650;
  uint64_t v4 = "_CFURLWriteBookmarkDataToFile";
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl( &dword_182E77000,  log,  OS_LOG_TYPE_ERROR,  "%s: destination URL %{public}@ exists but does not point to a valid file, so exiting with an error %{public}@",  (uint8_t *)&v3,  0x20u);
}

void _CFURLCreateByResolvingBookmarkData_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _CFURLCreateByResolvingBookmarkData_cold_2(uint64_t a1, os_log_s *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  int v2 = 136315650;
  int v3 = "_CFURLCreateByResolvingBookmarkData";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_debug_impl(&dword_182E77000, a2, OS_LOG_TYPE_DEBUG, "%s: returning <%p %@>", (uint8_t *)&v2, 0x20u);
}

void createByResolvingBookmarkDataInternal()
{
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_182E77000, v0, v1, "Consuming sandbox extension in bookmark: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void _URLCreateByResolvingAliasFile_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void CFURLCreateByResolvingDataInBookmark()
{
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0( &dword_182E77000,  v0,  v1,  "8. Trying to find target at depth 1 solely by documentID on matched volumes.",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_3();
}

{
  uint64_t v0;
  os_log_t v1;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9(&dword_182E77000, v0, v1, " -- trying to match by relative path from fileIDsRef=%@ volumeURL=%@");
  OUTLINED_FUNCTION_2();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0( &dword_182E77000,  v0,  v1,  "7. Trying to find target by fileID and partial paths, to deal with renamed parent items.",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_3();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0( &dword_182E77000,  v0,  v1,  "6. Trying to find target solely by fileID on matched volumes.",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_3();
}

{
  uint64_t v0;
  os_log_t v1;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_9( &dword_182E77000,  v0,  v1,  "5b. Trying to find by partial paths on volume by mount path, partialPath=%@ maybeURL=%@");
  OUTLINED_FUNCTION_2();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0( &dword_182E77000,  v0,  v1,  "5. Trying to match by partial path across all of the volumes(in case the volume it was on got renamed.)",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_3();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0( &dword_182E77000,  v0,  v1,  "3. - Trying to match by relative path on current boot volume.",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_3();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1( &dword_182E77000,  v0,  v1,  "3. Original item was on the boot drive, so looking for an item by relative path on the current boot drive.  path=%@",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_2();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0( &dword_182E77000,  v0,  v1,  "2. Bookmark was to a volume, so try to just find a matching volume.",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_3();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0( &dword_182E77000,  v0,  v1,  "Checking for home-directory relative match by relative path",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_3();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_182E77000, v0, v1, "Bookmark was to home directory, so trying %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1( &dword_182E77000,  v0,  v1,  "Trying relative to bookmark user's home directory: %@",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_2();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0( &dword_182E77000,  v0,  v1,  "Checking for home-directory match by relative path for current user ",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_3();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_182E77000, v0, v1, "Trying relative to current home directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0( &dword_182E77000,  v0,  v1,  "1. Original item was in a home folder, so look for an item in the home directory.",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_3();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0( &dword_182E77000,  v0,  v1,  " -- got userCanceledErr from mount attempt, making further resolution for this bookmark fail.",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_3();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1(&dword_182E77000, v0, v1, " -- Returning volumeURLRef=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1( &dword_182E77000,  v0,  v1,  " -- Attempting to find already mounted URLMount volume item, at url %@ which is needed for bookmark resolution.",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_2();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1( &dword_182E77000,  v0,  v1,  " -- Attempting to mount(or find already mounted) possible network filesystem item, at path %@ which is needed for bookmark resolution.",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_2();
}

{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;
  OUTLINED_FUNCTION_11();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xCu);
  OUTLINED_FUNCTION_2();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0( &dword_182E77000,  v0,  v1,  "-. Pruning array of potential volumes based on information in the bookmark.",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_3();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1( &dword_182E77000,  v0,  v1,  "Bookmark was to an item on the boot drive, which appears to match the current boot drive by UUID, so using that volume. uuid=%@",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_2();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1( &dword_182E77000,  v0,  v1,  "Bookmark was to an item on the boot drive, which does not appear to match the current boot drive by UUID.  Saved uuid=%@",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_2();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0( &dword_182E77000,  v0,  v1,  "-. Constructing array of potential volumes to be considered for items in this bookmark.",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_3();
}

void CFURLCreateByResolvingDataInBookmark( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5( &dword_182E77000,  a2,  a3,  "Bookmark was homeDirectoryRelative, depth inside homeDirectory=%u",  a5,  a6,  a7,  a8,  0);
  OUTLINED_FUNCTION_3();
}

{
  OUTLINED_FUNCTION_5( &dword_182E77000,  a2,  a3,  "VOLUME(S) IDENTIFIED; starting the attempt to find this item represented by this bookmark item at depth %u on one of these volumes.",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_3();
}

{
  OUTLINED_FUNCTION_5( &dword_182E77000,  a2,  a3,  "-. Resolving url to disk image for volume at depth %u to determine image file to be mounted.",  a5,  a6,  a7,  a8,  0);
  OUTLINED_FUNCTION_3();
}

void CFURLCreateByResolvingDataInBookmark(uint64_t a1, os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v2[0] = 67109378;
  v2[1] = 1;
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_debug_impl( &dword_182E77000,  a2,  OS_LOG_TYPE_DEBUG,  "Bookmark was to an item on a local drive; checking if it's the boot drive and if the uuid matches.  onBoot=%{BOOL}d volMountPath=%@",
    (uint8_t *)v2,
    0x12u);
  OUTLINED_FUNCTION_2();
}

void matchVolumeURLForBookmark()
{
}

void matchURLToBookmark()
{
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0( &dword_182E77000,  v0,  v1,  " -- REJECTED: canonical path does not match the path under test.",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_3();
}

{
  uint64_t v0;
  os_log_t v1;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7( &dword_182E77000,  v0,  v1,  " -- SUCCESS, bookmark, depth=%u is a matchToURL=%@ because the item properties matched those of the original item, a nd the item exists.");
  OUTLINED_FUNCTION_2();
}

{
  uint64_t v0;
  os_log_t v1;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7( &dword_182E77000,  v0,  v1,  " -- SUCCESS, bookmark, depth=%u is a matchToURL=%@ because the bookmark doesn't contain any properties to match, and the item exists.");
  OUTLINED_FUNCTION_2();
}

{
  uint64_t v0;
  os_log_t v1;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_182E77000, v0, v1, "match bookmark, depth=%u matchToURL=%@");
  OUTLINED_FUNCTION_2();
}

void _FSURLCopyResourcePropertyForKeyInternal()
{
}

void _FSURLCopyResourcePropertiesForKeysInternal()
{
}

void _FSURLSetResourcePropertyForKey_cold_1()
{
}

void _FSURLSetResourcePropertiesForKeys_cold_1()
{
}

void _FSURLSetResourcePropertiesForKeys_cold_2()
{
  OUTLINED_FUNCTION_0_0( &dword_182E77000,  v0,  v1,  "_FSURLSetResourcePropertiesForKeys: returning false without an error",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_3();
}

void _FSURLResourceIsReachable_cold_1()
{
}

void _FSURLCreateStandardError_cold_1()
{
}

void _FSURLCopyResourcePropertyValuesAndFlags_cold_1()
{
}

void _FSURLGetResourcePropertyFlags_cold_1()
{
}

void _FSURLGetVolumePropertyFlags_cold_1()
{
}

void _FSCreatePathForFileID_cold_1()
{
}

void _FSGetFileSystemRepresentationForFileID_cold_1()
{
}

void _FSURLCacheResourcePropertyForKey_cold_1()
{
}

void _FSURLCacheResourcePropertiesForKeys_cold_1()
{
}

void _FileURLCreateDisplayPathComponentsArray_cold_1()
{
}

void _FileURLCreateDisplayPathComponentsArray_cold_2()
{
}

void _URLEnumeratorGetNextURL_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _URLEnumeratorGetURLsBulk_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void append()
{
}

{
  __assert_rtn("append", "SandboxExtensionCache.cpp", 106, "newItem");
}

void remove()
{
}

{
  __assert_rtn("remove", "SandboxExtensionCache.cpp", 118, "oldItem");
}

void remove(uint64_t a1, os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  CFDataGetBytePtr(*(CFDataRef *)(a1 + 16));
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5_0(&dword_182E77000, a2, v3, "CacheItem list corrupted for extension %s", v4);
  OUTLINED_FUNCTION_4_0();
}

void SandboxExtensionCache::insert()
{
}

{
  __assert_rtn("insert", "SandboxExtensionCache.cpp", 171, "extension");
}

void SandboxExtensionCache::_insert()
{
}

{
  __assert_rtn("_insert", "SandboxExtensionCache.cpp", 369, "extension");
}

void SandboxExtensionCache::_insert(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 8));
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_182E77000, a2, OS_LOG_TYPE_DEBUG, "sandbox extension cache path count: %ld", v3, 0xCu);
  OUTLINED_FUNCTION_4_0();
}

void SandboxExtensionCache::move()
{
}

void SandboxExtensionCache::move(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 136315138;
  uint64_t v4 = "move";
  OUTLINED_FUNCTION_5_0( &dword_182E77000,  a1,  a3,  "%s: fatal error: no fsid and file id provided or fetched",  (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

{
  int v3;
  const char *v4;
  uint64_t v5;
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 136315138;
  uint64_t v4 = "move";
  OUTLINED_FUNCTION_5_0( &dword_182E77000,  a1,  a3,  "%s: failed to get file system representation for the dst path.",  (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void SandboxExtensionCache::move(uint64_t a1, os_log_s *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  int v4 = *__error();
  int v5 = 136315650;
  uint8_t v6 = "move";
  __int16 v7 = 2082;
  uint64_t v8 = a1;
  __int16 v9 = 1024;
  int v10 = v4;
  _os_log_error_impl( &dword_182E77000,  a2,  OS_LOG_TYPE_ERROR,  "%s: get_fsid_and_file_id error for path=%{public}s: %{errno}d",  (uint8_t *)&v5,  0x1Cu);
}

void SandboxExtensionCache::move(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a2;
  int v4 = 136315650;
  int v5 = "move";
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v3;
  _os_log_error_impl( &dword_182E77000,  log,  OS_LOG_TYPE_ERROR,  "%s: error getting path for url=%{public}@: %{public}@",  (uint8_t *)&v4,  0x20u);
}

void SandboxExtensionCache::consume()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0( &dword_182E77000,  v0,  v1,  "<%p %@>: called <StartAccessing> on a URL that is not security-scoped",  v2);
  OUTLINED_FUNCTION_2();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_0( &dword_182E77000,  v0,  v1,  "<%p %@>: internal sandbox error for <StartAccessing>",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_2();
}

void SandboxExtensionCache::_consume()
{
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __error();
  OUTLINED_FUNCTION_6_0( &dword_182E77000,  v0,  v1,  "sandbox_extension_consume error=%{errno}d for path %@",  v2,  v3,  v4,  v5,  2u);
  OUTLINED_FUNCTION_4_0();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5_0(&dword_182E77000, v0, v1, "unexpected return value from sandbox_extension_consume: %lld", v2);
  OUTLINED_FUNCTION_2();
}

void SandboxExtensionCache::_consume(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_9( &dword_182E77000,  a2,  a3,  "handle %lld: new handle for path %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

void SandboxExtensionCache::release()
{
  WORD2(v3) = 2080;
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_9(&dword_182E77000, v0, v1, "%p: releasing extension by path for %s", v2, v3);
  OUTLINED_FUNCTION_2();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0( &dword_182E77000,  v0,  v1,  "<%p %@>: called <StopAccessing> too many times or URL isn't security-scoped",  v2);
  OUTLINED_FUNCTION_2();
}

{
  os_log_s *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_7_0( &dword_182E77000,  v0,  v1,  "<%p %@>: internal sandbox error for <StopAccessing>",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_2();
}

void SandboxExtensionCache::_release(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  LODWORD(v3) = 134218240;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 8);
  WORD6(v3) = 2048;
  HIWORD(v3) = a2;
  OUTLINED_FUNCTION_9( &dword_182E77000,  a2,  a3,  "handle %lld: decrementing ref count to %lld",  (void)v3,  *((void *)&v3 + 1));
  OUTLINED_FUNCTION_2();
}

void SandboxExtensionCache::_release(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)__int128 v3 = 134218242;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_9( &dword_182E77000,  a2,  a3,  "handle %lld: released extension for path %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

void SandboxExtensionCache::_release()
{
}

void _URLReplaceObject_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl( &dword_182E77000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "_URLReplaceObject: false result with no real error",  v0,  2u);
}

void _URLAttachSecurityScopeToFileURL_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = 134218242;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl( &dword_182E77000,  a2,  OS_LOG_TYPE_ERROR,  "cannot attach security scope to a URL that is not a file URL: <%p %@>",  (uint8_t *)&v2,  0x16u);
}

void _URLAttachSecurityScopeToFileURL_cold_2(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_182E77000, a2, OS_LOG_TYPE_DEBUG, "%p: removing sandbox extension", (uint8_t *)&v2, 0xCu);
}

void _URLAttachSecurityScopeToFileURL_cold_3(uint64_t a1, CFDataRef theData, os_log_s *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  int v4 = 134218243;
  uint64_t v5 = a1;
  __int16 v6 = 2081;
  BytePtr = CFDataGetBytePtr(theData);
  _os_log_debug_impl( &dword_182E77000,  a3,  OS_LOG_TYPE_DEBUG,  "%p: attaching sandbox extension %{private}s",  (uint8_t *)&v4,  0x16u);
}

void _URLAttachSecurityScopeToFileURL_cold_4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( &dword_182E77000,  log,  OS_LOG_TYPE_ERROR,  "sandboxExtension to attach was not a CFData object",  v1,  2u);
}

void CCHmac( CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return result;
}

CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  uint64_t v2 = MEMORY[0x1896025D0](tz, at);
  result.second = v3;
  result.year = v2;
  result.month = BYTE4(v2);
  result.day = BYTE5(v2);
  result.hour = BYTE6(v2);
  result.minute = HIBYTE(v2);
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1896025D8](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602630](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate( CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x189602638](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x189602640](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x189602648](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x189602658](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602678](theArray, range.location, range.length, value);
}

CFIndex CFArrayGetLastIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602680](theArray, range.location, range.length, value);
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

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
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

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x189602A10](cf);
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x189602A20]();
}

uint64_t CFCopyUserName()
{
  return MEMORY[0x189602A40]();
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x189602A60](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x189602A68](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x189602A78](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy( CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x189602A80](allocator, bytes, length, bytesDeallocator);
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

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x189602AC0](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x189602AF0](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate( CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x189602B00](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime( CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x189602B20](allocator, formatter, at);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x189602B78]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x189602B90](theDict, key);
}

CFDictionaryRef CFDictionaryCreate( CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x189602BA8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x189602BB0](allocator, theDict);
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

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x189602C08](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x189602C38](cf1, cf2);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x189602C58](err);
}

CFErrorRef CFErrorCreate( CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x189602C60](allocator, domain, code, userInfo);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues( CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x189602C68](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x189602C70](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x189602C78](err);
}

Boolean CFFileSecurityCopyAccessControlList(CFFileSecurityRef fileSec, acl_t *accessControlList)
{
  return MEMORY[0x189602CC0](fileSec, accessControlList);
}

Boolean CFFileSecurityCopyGroupUUID(CFFileSecurityRef fileSec, CFUUIDRef *groupUUID)
{
  return MEMORY[0x189602CC8](fileSec, groupUUID);
}

Boolean CFFileSecurityCopyOwnerUUID(CFFileSecurityRef fileSec, CFUUIDRef *ownerUUID)
{
  return MEMORY[0x189602CD0](fileSec, ownerUUID);
}

CFFileSecurityRef CFFileSecurityCreate(CFAllocatorRef allocator)
{
  return (CFFileSecurityRef)MEMORY[0x189602CD8](allocator);
}

CFFileSecurityRef CFFileSecurityCreateCopy(CFAllocatorRef allocator, CFFileSecurityRef fileSec)
{
  return (CFFileSecurityRef)MEMORY[0x189602CE0](allocator, fileSec);
}

Boolean CFFileSecurityGetGroup(CFFileSecurityRef fileSec, gid_t *group)
{
  return MEMORY[0x189602CE8](fileSec, group);
}

Boolean CFFileSecurityGetMode(CFFileSecurityRef fileSec, mode_t *mode)
{
  return MEMORY[0x189602CF0](fileSec, mode);
}

Boolean CFFileSecurityGetOwner(CFFileSecurityRef fileSec, uid_t *owner)
{
  return MEMORY[0x189602CF8](fileSec, owner);
}

Boolean CFFileSecuritySetAccessControlList(CFFileSecurityRef fileSec, acl_t accessControlList)
{
  return MEMORY[0x189602D00](fileSec, accessControlList);
}

Boolean CFFileSecuritySetGroup(CFFileSecurityRef fileSec, gid_t group)
{
  return MEMORY[0x189602D08](fileSec, *(void *)&group);
}

Boolean CFFileSecuritySetMode(CFFileSecurityRef fileSec, mode_t mode)
{
  return MEMORY[0x189602D10](fileSec, mode);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x189602D18](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x189602D50](cf);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x189602D98]();
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x189602E88]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x189602EA0](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x189602EF8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x189602F08]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x189602F10](number, theType, valuePtr);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFErrorRef CFReadStreamCopyError(CFReadStreamRef stream)
{
  return (CFErrorRef)MEMORY[0x189603038](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x189603060](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x189603098](stream);
}

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1896030A0](stream, buffer, bufferLength);
}

Boolean CFReadStreamSetProperty( CFReadStreamRef stream, CFStreamPropertyKey propertyName, CFTypeRef propertyValue)
{
  return MEMORY[0x1896030C0](stream, propertyName, propertyValue);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x189603138]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x189603140]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate( CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x189603158](allocator, activities, repeats, order, callout, context);
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x189603248](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x189603260](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x189603270](theSet);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions( CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C8](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings( CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x189603400](alloc, theString, separatorString);
}

CFStringRef CFStringCreateByCombiningStrings( CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x189603410](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x189603418](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x189603430](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x189603450](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x189603478](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return (CFStringRef)MEMORY[0x189603488](alloc, buffer);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1896034A8](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1896034C0](theString, stringToFind, compareOptions);
  result.CFIndex length = v4;
  result.CFIndex location = v3;
  return result;
}

CFIndex CFStringGetBytes( CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1896034F0]( theString,  range.location,  range.length,  *(void *)&encoding,  lossByte,  isExternalRepresentation,  buffer,  maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1896034F8](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x189603500](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x189603510](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x189603520](theString);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x189603538](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1896035A8](theString, suffix);
}

void CFURLClearResourcePropertyCache(CFURLRef url)
{
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1896036B0](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1896036B8](anURL, pathStyle);
}

CFStringRef CFURLCopyFragment(CFURLRef anURL, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1896036C0](anURL, charactersToLeaveEscaped);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1896036D0](url);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1896036F0](anURL);
}

CFStringRef CFURLCopyQueryString(CFURLRef anURL, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x189603700](anURL, charactersToLeaveEscaped);
}

Boolean CFURLCopyResourcePropertyForKey( CFURLRef url, CFStringRef key, void *propertyValueTypeRefPtr, CFErrorRef *error)
{
  return MEMORY[0x189603708](url, key, propertyValueTypeRefPtr, error);
}

CFDataRef CFURLCreateBookmarkDataFromFile(CFAllocatorRef allocator, CFURLRef fileURL, CFErrorRef *errorRef)
{
  return (CFDataRef)MEMORY[0x189603738](allocator, fileURL, errorRef);
}

CFURLRef CFURLCreateCopyAppendingPathComponent( CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x189603748](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x189603758](allocator, url);
}

CFURLRef CFURLCreateFilePathURL(CFAllocatorRef allocator, CFURLRef url, CFErrorRef *error)
{
  return (CFURLRef)MEMORY[0x189603770](allocator, url, error);
}

CFURLRef CFURLCreateFileReferenceURL(CFAllocatorRef allocator, CFURLRef url, CFErrorRef *error)
{
  return (CFURLRef)MEMORY[0x189603778](allocator, url, error);
}

CFURLRef CFURLCreateFromFileSystemRepresentation( CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x189603780](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateFromFileSystemRepresentationRelativeToBase( CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x189603788](allocator, buffer, bufLen, isDirectory, baseURL);
}

CFDictionaryRef CFURLCreateResourcePropertiesForKeysFromBookmarkData( CFAllocatorRef allocator, CFArrayRef resourcePropertiesToReturn, CFDataRef bookmark)
{
  return (CFDictionaryRef)MEMORY[0x189603798](allocator, resourcePropertiesToReturn, bookmark);
}

CFURLRef CFURLCreateWithFileSystemPath( CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1896037C0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPathRelativeToBase( CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1896037C8](allocator, filePath, pathStyle, isDirectory, baseURL);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1896037D0](allocator, URLString, baseURL);
}

CFURLEnumeratorRef CFURLEnumeratorCreateForMountedVolumes( CFAllocatorRef alloc, CFURLEnumeratorOptions option, CFArrayRef propertyKeys)
{
  return (CFURLEnumeratorRef)MEMORY[0x1896037E0](alloc, option, propertyKeys);
}

CFURLEnumeratorResult CFURLEnumeratorGetNextURL( CFURLEnumeratorRef enumerator, CFURLRef *url, CFErrorRef *error)
{
  return MEMORY[0x1896037F0](enumerator, url, error);
}

CFURLRef CFURLGetBaseURL(CFURLRef anURL)
{
  return (CFURLRef)MEMORY[0x189603800](anURL);
}

Boolean CFURLGetFileSystemRepresentation( CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x189603818](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x189603828](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x189603830]();
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x189603838](anURL);
}

Boolean CFURLIsFileReferenceURL(CFURLRef url)
{
  return MEMORY[0x189603840](url);
}

Boolean CFURLResourceIsReachable(CFURLRef url, CFErrorRef *error)
{
  return MEMORY[0x189603848](url, error);
}

Boolean CFURLSetResourcePropertiesForKeys(CFURLRef url, CFDictionaryRef keyedPropertyValues, CFErrorRef *error)
{
  return MEMORY[0x189603850](url, keyedPropertyValues, error);
}

Boolean CFURLSetResourcePropertyForKey( CFURLRef url, CFStringRef key, CFTypeRef propertyValue, CFErrorRef *error)
{
  return MEMORY[0x189603858](url, key, propertyValue, error);
}

void CFURLSetTemporaryResourcePropertyForKey(CFURLRef url, CFStringRef key, CFTypeRef propertyValue)
{
}

CFUUIDRef CFUUIDCreateWithBytes( CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x189603890](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFTypeID CFUUIDGetTypeID(void)
{
  return MEMORY[0x1896038A0]();
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

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFErrorRef CFWriteStreamCopyError(CFWriteStreamRef stream)
{
  return (CFErrorRef)MEMORY[0x189603918](stream);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x189603940](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x189603960](stream);
}

CFIndex CFWriteStreamWrite(CFWriteStreamRef stream, const UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x189603998](stream, buffer, bufferLength);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFFileCoordinateReadingItemAtURL2()
{
  return MEMORY[0x1896042E8]();
}

uint64_t _CFFileSecurityCreateFromFilesec()
{
  return MEMORY[0x1896042F0]();
}

uint64_t _CFGetEUID()
{
  return MEMORY[0x1896042F8]();
}

uint64_t _CFGetPathExtensionRangesFromPathComponent()
{
  return MEMORY[0x189604300]();
}

uint64_t _CFRunLoopCurrentIsMain()
{
  return MEMORY[0x189604520]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x189604550]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x189604568]();
}

uint64_t _CFURLCopyPromiseURLOfLogicalURL()
{
  return MEMORY[0x189604690]();
}

uint64_t _CFURLCopyResourcePropertyValuesAndFlags()
{
  return MEMORY[0x1896046B8]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x1896046C0]();
}

uint64_t _CFURLGetResourcePropertyFlags()
{
  return MEMORY[0x189604748]();
}

uint64_t _CFURLGetVolumePropertyFlags()
{
  return MEMORY[0x189604750]();
}

uint64_t _CFURLIsFileURL()
{
  return MEMORY[0x189604758]();
}

uint64_t _CFURLPromiseCopyPhysicalURL()
{
  return MEMORY[0x189604770]();
}

uint64_t _CFURLPromiseCopyResourcePropertyForKey()
{
  return MEMORY[0x189604778]();
}

uint64_t _CFURLPromiseSetPhysicalURL()
{
  return MEMORY[0x189604780]();
}

uint64_t _CFURLPromiseSetResourcePropertyForKey()
{
  return MEMORY[0x189604788]();
}

uint64_t _LSRegisterFilePropertyProvider()
{
  return MEMORY[0x189605798]();
}

std::stringbuf::string_type *__cdecl std::stringbuf::str( std::stringbuf::string_type *__return_ptr retstr, const std::stringbuf *this)
{
  return (std::stringbuf::string_type *)MEMORY[0x189614198](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1896141C8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1896141D0](this);
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
  return MEMORY[0x189614400]();
}

{
  return MEMORY[0x189614430]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x189614470]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x189614478]();
}

void std::locale::~locale(std::locale *this)
{
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

void operator delete(void *__p)
{
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_189C5A828(__sz);
}

uint64_t __CFURLResourceInfoPtr()
{
  return MEMORY[0x189604A38]();
}

uint64_t __CFURLSetResourceInfoPtr()
{
  return MEMORY[0x189604A48]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
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

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

uint64_t _amkrtemp()
{
  return MEMORY[0x1895F8A68]();
}

os_activity_t _os_activity_create( void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1895F8D40](dso, description, activity, *(void *)&flags);
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

void _os_signpost_emit_with_name_impl( void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1895F9328](a1, *(void *)&a2);
}

int accessx_np(const accessx_descriptor *a1, size_t a2, int *a3, uid_t a4)
{
  return MEMORY[0x1895F9330](a1, a2, a3, *(void *)&a4);
}

int acl_add_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1895F9340](permset_d, *(void *)&perm);
}

ssize_t acl_copy_ext(void *buf_p, acl_t acl, ssize_t size)
{
  return MEMORY[0x1895F9360](buf_p, acl, size);
}

ssize_t acl_copy_ext_native(void *buf_p, acl_t acl, ssize_t size)
{
  return MEMORY[0x1895F9368](buf_p, acl, size);
}

acl_t acl_copy_int_native(const void *buf_p)
{
  return (acl_t)MEMORY[0x1895F9370](buf_p);
}

int acl_delete_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1895F9380](permset_d, *(void *)&perm);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x1895F9390](obj_p);
}

int acl_get_entry(acl_t acl, int entry_id, acl_entry_t *entry_p)
{
  return MEMORY[0x1895F93A0](acl, *(void *)&entry_id, entry_p);
}

int acl_get_permset(acl_entry_t entry_d, acl_permset_t *permset_p)
{
  return MEMORY[0x1895F93E0](entry_d, permset_p);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x1895F9400](*(void *)&count);
}

int acl_set_permset(acl_entry_t entry_d, acl_permset_t permset_d)
{
  return MEMORY[0x1895F9430](entry_d, permset_d);
}

ssize_t acl_size(acl_t acl)
{
  return MEMORY[0x1895F9450](acl);
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

int dirfd(DIR *dirp)
{
  return MEMORY[0x1895FAAD8](dirp);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1895FAC60]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

uint64_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAC80](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class( dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD78](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

int faccessat(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x1895FB1C8](*(void *)&a1, a2, *(void *)&a3, *(void *)&a4);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

void filesec_free(filesec_t a1)
{
}

filesec_t filesec_init(void)
{
  return (filesec_t)MEMORY[0x1895FB2D0]();
}

int filesec_set_property(filesec_t a1, filesec_property_t a2, const void *a3)
{
  return MEMORY[0x1895FB2D8](a1, *(void *)&a2, a3);
}

int flsll(uint64_t a1)
{
  return MEMORY[0x1895FB310](a1);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1895FB418](a1, a2, a3, *(void *)&a4);
}

ssize_t fsgetpath(char *a1, size_t a2, fsid_t *a3, uint64_t a4)
{
  return MEMORY[0x1895FB440](a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1895FB460](*(void *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FB4F8](a1, a2, a3, a4, *(void *)&a5);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return MEMORY[0x1895FB500](*(void *)&a1, a2, a3, a4, a5);
}

int getmntinfo_r_np(statfs **a1, int a2)
{
  return MEMORY[0x1895FB5D0](a1, *(void *)&a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FB708](path, name, value, size, *(void *)&position, *(void *)&options);
}

int link(const char *a1, const char *a2)
{
  return MEMORY[0x1895FB9E8](a1, a2);
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1895FBA00](path, namebuff, size, *(void *)&options);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FBA88](a1, a2);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

int mbr_check_membership(const uuid_t user, const uuid_t group, int *ismember)
{
  return MEMORY[0x1895FBD78](user, group, ismember);
}

int mbr_gid_to_uuid(gid_t gid, uuid_t uu)
{
  return MEMORY[0x1895FBD80](*(void *)&gid, uu);
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return MEMORY[0x1895FBDA8](*(void *)&uid, uu);
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

double modf(double a1, double *a2)
{
  return result;
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FC278](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void os_release(void *object)
{
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1895FC600](log);
}

void os_unfair_lock_assert_not_owner(os_unfair_lock_t lock)
{
}

void os_unfair_lock_assert_owner(os_unfair_lock_t lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1895FC688]();
}

uint64_t os_unfair_recursive_lock_trylock()
{
  return MEMORY[0x1895FC690]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1895FC6A0]();
}

uint64_t pathconf(const char *a1, int a2)
{
  return MEMORY[0x1895FC768](a1, *(void *)&a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1895FCB20]();
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1895FCC50](a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1895FCD10](path, state, *(void *)&flags);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x1895FCD38](path, name, *(void *)&options);
}

int rename(const char *__old, const char *__new)
{
  return MEMORY[0x1895FCD50](__old, __new);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x1895FCD68](a1, a2, *(void *)&a3);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1895FCD90]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1895FCDB0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1895FCDB8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1895FCDD0]();
}

uint64_t sandbox_extension_release_file()
{
  return MEMORY[0x1895FCDD8]();
}

uint64_t sandbox_extension_update_file_by_fileid()
{
  return MEMORY[0x1895FCDE0]();
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FCE50](a1, a2, a3, a4, *(void *)&a5);
}

int setxattr( const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1895FCEE0](path, name, value, size, *(void *)&position, *(void *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1895FD018](a1, a2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F0](__dst, __src, __n);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1A0](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1895FD4E0](uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

int xattr_preserve_for_intent(const char *a1, xattr_operation_intent_t a2)
{
  return MEMORY[0x1895FD768](a1, *(void *)&a2);
}

uint64_t GSLibraryResolveDocumentId2_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_GenerationalStorage)) {
    dlopenHelper_GenerationalStorage(a1);
  }
  return MEMORY[0x18960F3C8]();
}

uint64_t _QLCopyResourcePropertyForKey_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_QuickLookThumbnailing)) {
    dlopenHelper_QuickLookThumbnailing(a1);
  }
  return MEMORY[0x189611D90]();
}

uint64_t _QLSetResourcePropertyForKey_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_QuickLookThumbnailing)) {
    dlopenHelper_QuickLookThumbnailing(a1);
  }
  return MEMORY[0x189611D98]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_QuickLookThumbnailing( double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_GenerationalStorage( double a1)
{
  return a1;
}

double gotLoadHelper_x8__GSLibraryResolveDocumentId2(double result)
{
  if (!atomic_load(&dlopenHelperFlag_GenerationalStorage)) {
    return dlopenHelper_GenerationalStorage(result);
  }
  return result;
}

double gotLoadHelper_x8___QLCopyResourcePropertyForKey(double result)
{
  if (!atomic_load(&dlopenHelperFlag_QuickLookThumbnailing)) {
    return dlopenHelper_QuickLookThumbnailing(result);
  }
  return result;
}

double gotLoadHelper_x8___QLSetResourcePropertyForKey(double result)
{
  if (!atomic_load(&dlopenHelperFlag_QuickLookThumbnailing)) {
    return dlopenHelper_QuickLookThumbnailing(result);
  }
  return result;
}