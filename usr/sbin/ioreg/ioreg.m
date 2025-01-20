void start(int a1, char *const *a2)
{
  int v4;
  int v5;
  int v6;
  int v7;
  CFStringRef v8;
  char *v9;
  int v10;
  int v11;
  char *v12;
  uint64_t RootEntry;
  io_object_t v14;
  __CFArray *v15;
  __CFArray *v16;
  CFURLRef v17;
  CFURLRef v18;
  __CFWriteStream *v19;
  __CFWriteStream *v20;
  FILE *v21;
  const char *v22;
  char *v23;
  char *v24;
  char *v25;
  __int128 error;
  CFStringRef v27;
  int v28;
  char *v29;
  char *v30;
  char *v31;
  int v32;
  _BYTE v33[2];
  unsigned __int16 v34;
  __int128 v35;
  CFStringRef v36;
  int v37;
  char *v38;
  char *v39;
  char *v40;
  int v41;
  v4 = fileno(__stdoutp);
  if (!isatty(v4) || (v5 = fileno(__stdoutp), ioctl(v5, 0x40087468uLL, v33))) {
    v6 = 0;
  }
  else {
    v6 = v34;
  }
  v25 = 0LL;
  v23 = 0LL;
  v7 = 0;
  v8 = 0LL;
  v9 = 0LL;
  v10 = 0;
  v24 = "IOService";
  while (2)
  {
    v11 = getopt(a1, a2, ":abc:d:fik:ln:p:rsStw:xy");
    switch(v11)
    {
      case 'S':
      case 's':
        continue;
      case 'T':
      case 'U':
      case 'V':
      case 'W':
      case 'X':
      case 'Y':
      case 'Z':
      case '[':
      case '\\':
      case ']':
      case '^':
      case '_':
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'm':
      case 'o':
      case 'q':
      case 'u':
      case 'v':
        goto LABEL_37;
      case 'a':
        v10 |= 1u;
        continue;
      case 'b':
        v10 |= 2u;
        continue;
      case 'c':
        v9 = optarg;
        v8 = CFStringCreateWithCString(kCFAllocatorDefault, optarg, 0x8000100u);
        continue;
      case 'd':
        v7 = atoi(optarg);
        continue;
      case 'f':
        v10 |= 4u;
        continue;
      case 'i':
        v10 |= 0x10u;
        continue;
      case 'k':
        v23 = optarg;
        continue;
      case 'l':
        v10 |= 0x20u;
        continue;
      case 'n':
        v25 = optarg;
        continue;
      case 'p':
        v24 = optarg;
        continue;
      case 'r':
        v10 |= 0x40u;
        continue;
      case 't':
        v10 |= 0x80u;
        continue;
      case 'w':
        v6 = atoi(optarg);
        continue;
      case 'x':
        v10 |= 8u;
        continue;
      case 'y':
        v10 |= 0x100u;
        continue;
      default:
        if (v11 != -1)
        {
LABEL_37:
          fwrite( "usage: ioreg [-abfilrtxy] [-c class] [-d depth] [-k key] [-n name] [-p plane] [-w width]\n where options are:\n \t-a archive output\n \t-b show object name in bold\n \t-c list properties of objects with the given class\n \t-d limit tree to the given depth\n \t-f enable smart formatting\n \t-i show object inheritance\n \t-k list properties of objects with the given key\n \t-l list properties of all objects\n \t-n list properties of objects with the given name\n \t-p traverse registry over the given plane (IOService is default)\n \t-r show subtrees rooted by the given criteria\n \t-t show location of each subtree\n \t-w clip output to the given line width (0 is unlimited)\n \t-x show data and numbers as hexadecimal\n \t-y do not consider DriverKit classes with -c\n",  0x2D5uLL,  1uLL,  __stderrp);
          goto LABEL_38;
        }

        byte_10000C028 = (v10 & 8) != 0;
        if (v6 && (qword_10000C010 = (uint64_t)malloc(v6), dword_10000C018 = v6, dword_10000C008 = v6, !qword_10000C010))
        {
          v21 = __stderrp;
          v22 = "can't allocate buffer";
        }

        else
        {
          if ((v10 & 2) == 0) {
            goto LABEL_33;
          }
          *(void *)&v35 = &unk_10000C029;
          v12 = getenv("TERM");
          if (!v12
            || tgetent(0LL, v12) < 1
            || (qword_10000C000 = (uint64_t)tgetstr("md", (char **)&v35),
                qword_10000C020 = (uint64_t)tgetstr("me", (char **)&v35),
                (void)v35 - (void)&unk_10000C029 < 0x41uLL))
          {
            if (!qword_10000C000) {
              qword_10000C000 = (uint64_t)&unk_100007846;
            }
            if (!qword_10000C020) {
              qword_10000C020 = (uint64_t)&unk_100007846;
            }
LABEL_33:
            RootEntry = IORegistryGetRootEntry(kIOMainPortDefault);
            if ((_DWORD)RootEntry)
            {
              v14 = RootEntry;
              if ((v10 & 1) == 0)
              {
                if ((v10 & 0x40) != 0)
                {
                  LOWORD(error) = v10;
                  *((void *)&error + 1) = v9;
                  v27 = v8;
                  v28 = v7;
                  v29 = v23;
                  v30 = v25;
                  v31 = v24;
                  v32 = v6;
                  sub_1000040D8(RootEntry, 0LL, 0LL, (uint64_t)&v35, &error);
                }

                else
                {
                  LOWORD(v35) = v10;
                  *((void *)&v35 + 1) = v9;
                  v36 = v8;
                  v37 = v7;
                  v38 = v23;
                  v39 = v25;
                  v40 = v24;
                  v41 = v6;
                  sub_1000042AC(RootEntry, 0, 0LL, 0LL, (const char **)&v35);
                }

                goto LABEL_49;
              }

              if ((v10 & 0x40) != 0)
              {
                LOWORD(error) = v10;
                *((void *)&error + 1) = v9;
                v27 = v8;
                v28 = v7;
                v29 = v23;
                v30 = v25;
                v31 = v24;
                v32 = v6;
                v15 = sub_100003CAC(RootEntry, 0LL, 0, (uint64_t)&v35, (uint64_t)&error);
              }

              else
              {
                LOWORD(v35) = v10;
                *((void *)&v35 + 1) = v9;
                v36 = v8;
                v37 = v7;
                v38 = v23;
                v39 = v25;
                v40 = v24;
                v41 = v6;
                v15 = sub_100003F48(RootEntry, 0, &v35);
              }

              v16 = v15;
              if (!v15)
              {
LABEL_49:
                IOObjectRelease(v14);
                exit(0);
              }

              *(void *)&error = 0LL;
              v17 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, @"/dev/stdout", kCFURLPOSIXPathStyle, 0);
              if (v17)
              {
                v18 = v17;
                v19 = CFWriteStreamCreateWithFile(kCFAllocatorDefault, v17);
                if (v19)
                {
                  v20 = v19;
                  if (CFWriteStreamOpen(v19))
                  {
                    CFPropertyListWrite(v16, v20, kCFPropertyListXMLFormat_v1_0, 0LL, (CFErrorRef *)&error);
                    if (!(void)error)
                    {
                      CFWriteStreamClose(v20);
                      CFRelease(v20);
                      CFRelease(v18);
                      CFRelease(v16);
                      goto LABEL_49;
                    }

                    v21 = __stderrp;
                    v22 = "CFPropertyListWrite(): error";
                  }

                  else
                  {
                    v21 = __stderrp;
                    v22 = "can't open file";
                  }
                }

                else
                {
                  v21 = __stderrp;
                  v22 = "can't create file";
                }
              }

              else
              {
                v21 = __stderrp;
                v22 = "can't create path";
              }
            }

            else
            {
              v21 = __stderrp;
              v22 = "can't obtain I/O Kit's root service";
            }

            goto LABEL_57;
          }

          v21 = __stderrp;
          v22 = "can't obtain terminfo";
        }

LABEL_57:
        fprintf(v21, "ioreg: error: %s.\n", v22);
LABEL_38:
        exit(1);
    }
  }
}

__CFArray *sub_100003CAC(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = a2;
  uint64_t v9 = a1;
  io_iterator_t iterator = 0;
  uint64_t v10 = a3 + 1;
  if (v10 <= a2
    || (__int128 v11 = *(_OWORD *)(a5 + 16),
        __int128 v42 = *(_OWORD *)a5,
        __int128 v43 = v11,
        __int128 v12 = *(_OWORD *)(a5 + 48),
        __int128 v44 = *(_OWORD *)(a5 + 32),
        __int128 v45 = v12,
        !sub_1000049E0(a1, (uint64_t)&v42)))
  {
    v18 = 0LL;
    goto LABEL_21;
  }

  int v13 = *(_DWORD *)(a5 + 24);
  unsigned int v14 = v13 + a3;
  if (v13) {
    uint64_t v8 = v14;
  }
  else {
    uint64_t v8 = 0xFFFFFFFFLL;
  }
  int v41 = v9;
  if ((*(_WORD *)a5 & 0x80) != 0)
  {
    if (v13) {
      *(_DWORD *)(a5 + 24) = v14;
    }
    __int128 v19 = *(_OWORD *)(a5 + 16);
    __int128 v42 = *(_OWORD *)a5;
    __int128 v43 = v19;
    __int128 v20 = *(_OWORD *)(a5 + 48);
    __int128 v44 = *(_OWORD *)(a5 + 32);
    __int128 v45 = v20;
    v21 = sub_100003F48(v9, a3, &v42);
    v22 = v21;
    int v23 = *(_DWORD *)(a5 + 24);
    if (v23) {
      *(_DWORD *)(a5 + 24) = v23 - a3;
    }
    if (a3)
    {
      unsigned int v24 = a3 - 1;
      while (1)
      {
        uint64_t v25 = *(unsigned int *)(a4 + 4LL * v24);
        __int128 v26 = *(_OWORD *)(a5 + 16);
        __int128 v42 = *(_OWORD *)a5;
        __int128 v43 = v26;
        __int128 v27 = *(_OWORD *)(a5 + 48);
        __int128 v44 = *(_OWORD *)(a5 + 32);
        __int128 v45 = v27;
        v28 = sub_1000043F4(v25, (uint64_t)&v42);
        if (!v28) {
          break;
        }
        v17 = v28;
        uint64_t v29 = v24;
        CFDictionarySetValue(v28, @"IORegistryEntryChildren", v22);
        CFRelease(v22);
        --v24;
        v22 = v17;
        if (!v29) {
          goto LABEL_19;
        }
      }

      v39 = __stderrp;
      v40 = "can't obtain parent";
LABEL_32:
      fprintf(v39, "ioreg: error: %s.\n", v40);
      exit(1);
    }

    v17 = v21;
  }

  else
  {
    __int128 v15 = *(_OWORD *)(a5 + 16);
    __int128 v42 = *(_OWORD *)a5;
    __int128 v43 = v15;
    __int128 v16 = *(_OWORD *)(a5 + 48);
    __int128 v44 = *(_OWORD *)(a5 + 32);
    __int128 v45 = v16;
    v17 = sub_100003F48(v9, 0, &v42);
  }

LABEL_19:
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (!Mutable)
  {
    v39 = __stderrp;
    v40 = "can't create array";
    goto LABEL_32;
  }

  v18 = Mutable;
  CFArrayAppendValue(Mutable, v17);
  CFRelease(v17);
  LODWORD(v9) = v41;
LABEL_21:
  *(_DWORD *)(a4 + 4LL * a3) = v9;
  if (!IORegistryEntryGetChildIterator(v9, *(const char **)(a5 + 48), &iterator))
  {
    uint64_t v31 = IOIteratorNext(iterator);
    if ((_DWORD)v31)
    {
      uint64_t v32 = v31;
      do
      {
        uint64_t v33 = IOIteratorNext(iterator);
        __int128 v34 = *(_OWORD *)(a5 + 16);
        __int128 v42 = *(_OWORD *)a5;
        __int128 v43 = v34;
        __int128 v35 = *(_OWORD *)(a5 + 48);
        __int128 v44 = *(_OWORD *)(a5 + 32);
        __int128 v45 = v35;
        v36 = (const __CFArray *)sub_100003CAC(v32, v8, v10, a4, &v42);
        if (v36)
        {
          v37 = v36;
          if (v18)
          {
            v47.length = CFArrayGetCount(v36);
            v47.location = 0LL;
            CFArrayAppendArray(v18, v37, v47);
            CFRelease(v37);
          }

          else
          {
            v18 = v36;
          }
        }

        IOObjectRelease(v32);
        uint64_t v32 = v33;
      }

      while ((_DWORD)v33);
    }

    IOObjectRelease(iterator);
  }

  return v18;
}

__CFDictionary *sub_100003F48(uint64_t a1, int a2, __int128 *a3)
{
  io_iterator_t iterator = 0;
  uint64_t v7 = IOIteratorNext(iterator);
  __int128 v8 = a3[1];
  __int128 v22 = *a3;
  __int128 v23 = v8;
  __int128 v9 = a3[3];
  __int128 v24 = a3[2];
  __int128 v25 = v9;
  v6 = sub_1000043F4(a1, (uint64_t)&v22);
  unsigned int v10 = *((_DWORD *)a3 + 6);
  if ((!v10 || v10 > a2 + 1) && (_DWORD)v7)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      __int128 v12 = Mutable;
      uint64_t v13 = (a2 + 1);
      while (1)
      {
        uint64_t v14 = IOIteratorNext(iterator);
        __int128 v15 = a3[1];
        __int128 v22 = *a3;
        __int128 v23 = v15;
        __int128 v16 = a3[3];
        __int128 v24 = a3[2];
        __int128 v25 = v16;
        v17 = (const void *)sub_100003F48(v7, v13, &v22);
        if (!v17) {
          break;
        }
        v18 = v17;
        CFArrayAppendValue(v12, v17);
        CFRelease(v18);
        IOObjectRelease(v7);
        uint64_t v7 = v14;
        if (!(_DWORD)v14)
        {
          CFDictionarySetValue(v6, @"IORegistryEntryChildren", v12);
          CFRelease(v12);
          goto LABEL_11;
        }
      }

      __int128 v20 = __stderrp;
      v21 = "can't obtain child";
    }

    else
    {
      __int128 v20 = __stderrp;
      v21 = "can't create array";
    }

    fprintf(v20, "ioreg: error: %s.\n", v21);
    exit(1);
  }

LABEL_11:
  IOObjectRelease(iterator);
  return v6;
}

  __int128 v9 = *(const char **)(a2 + 32);
  if (v9)
  {
    unsigned int v10 = CFStringCreateWithCString(kCFAllocatorDefault, v9, 0x8000100u);
    if (!v10)
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't create key");
      exit(1);
    }

    __int128 v11 = v10;
    __int128 v8 = (uint64_t)IORegistryEntryCreateCFProperty(object, v10, kCFAllocatorDefault, 0);
    CFRelease(v11);
    if (!v8) {
      return v8;
    }
    CFRelease((CFTypeRef)v8);
    __int128 v8 = 1LL;
  }

  if (*(void *)(a2 + 40))
  {
    if (IORegistryEntryGetNameInPlane(object, *(const char **)(a2 + 48), name))
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain name");
      strcpy(name, "<name error>");
    }

    if (strchr(*(const char **)(a2 + 40), 64))
    {
      __strlcat_chk(name, "@", 128LL, 128LL);
    }

    return !strcmp(*(const char **)(a2 + 40), name);
  }

  return v8;
}

uint64_t sub_1000040D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5)
{
  uint64_t v8 = a2;
  io_iterator_t iterator = 0;
  uint64_t v10 = (a3 + 1);
  if (v10 > a2)
  {
    __int128 v11 = a5[1];
    __int128 v36 = *a5;
    __int128 v37 = v11;
    __int128 v12 = a5[3];
    __int128 v38 = a5[2];
    __int128 v39 = v12;
    if (sub_1000049E0(a1, (uint64_t)&v36))
    {
      int v13 = *((_DWORD *)a5 + 6);
      if (v13) {
        uint64_t v8 = (v13 + a3);
      }
      else {
        uint64_t v8 = 0xFFFFFFFFLL;
      }
      if ((*(_WORD *)a5 & 0x80) != 0)
      {
        if ((_DWORD)a3)
        {
          uint64_t v23 = 0LL;
          do
          {
            uint64_t v24 = *(unsigned int *)(a4 + 4 * v23);
            __int128 v25 = a5[1];
            __int128 v36 = *a5;
            __int128 v37 = v25;
            __int128 v26 = a5[3];
            __int128 v38 = a5[2];
            __int128 v39 = v26;
            sub_100004EE0(v24, v23, 2 << v23, (const char **)&v36);
            ++v23;
          }

          while (a3 != v23);
          int v13 = *((_DWORD *)a5 + 6);
        }

        if (v13) {
          *((_DWORD *)a5 + 6) = v13 + a3;
        }
        __int128 v27 = a5[1];
        __int128 v36 = *a5;
        __int128 v37 = v27;
        __int128 v28 = a5[3];
        __int128 v38 = a5[2];
        __int128 v39 = v28;
        sub_1000042AC(a1, 0, a3, 0LL, (const char **)&v36);
        int v29 = *((_DWORD *)a5 + 6);
        if (v29) {
          *((_DWORD *)a5 + 6) = v29 - a3;
        }
      }

      else
      {
        __int128 v14 = a5[1];
        __int128 v36 = *a5;
        __int128 v37 = v14;
        __int128 v15 = a5[3];
        __int128 v38 = a5[2];
        __int128 v39 = v15;
        sub_1000042AC(a1, 0, 0LL, 0LL, (const char **)&v36);
      }

      sub_1000055A4((char *)&unk_100007846, v16, v17, v18, v19, v20, v21, v22, v36);
    }
  }

  *(_DWORD *)(a4 + 4LL * a3) = a1;
  uint64_t result = IORegistryEntryGetChildIterator(a1, *((const char **)a5 + 6), &iterator);
  if (!(_DWORD)result)
  {
    uint64_t v31 = IOIteratorNext(iterator);
    if ((_DWORD)v31)
    {
      uint64_t v32 = v31;
      do
      {
        uint64_t v33 = IOIteratorNext(iterator);
        __int128 v34 = a5[1];
        __int128 v36 = *a5;
        __int128 v37 = v34;
        __int128 v35 = a5[3];
        __int128 v38 = a5[2];
        __int128 v39 = v35;
        sub_1000040D8(v32, v8, v10, a4, &v36);
        IOObjectRelease(v32);
        uint64_t v32 = v33;
      }

      while ((_DWORD)v33);
    }

    return IOObjectRelease(iterator);
  }

  return result;
}

uint64_t sub_1000042AC(uint64_t a1, int a2, uint64_t a3, unint64_t a4, const char **a5)
{
  io_iterator_t iterator = 0;
  uint64_t result = IORegistryEntryGetChildIterator(a1, a5[6], &iterator);
  if (!(_DWORD)result)
  {
    uint64_t v11 = IOIteratorNext(iterator);
    uint64_t v12 = v11;
    uint64_t v13 = (1 << a3) | a4;
    if (!a2) {
      uint64_t v13 = ~(1 << a3) & a4;
    }
    uint64_t v14 = (a3 + 1);
    unsigned int v15 = *((_DWORD *)a5 + 6) - 1;
    uint64_t v16 = v13 | (2 << a3);
    if (!(_DWORD)v11) {
      uint64_t v16 = v13 & ~(2 << a3);
    }
    __int128 v17 = *((_OWORD *)a5 + 1);
    __int128 v23 = *(_OWORD *)a5;
    __int128 v24 = v17;
    __int128 v18 = *((_OWORD *)a5 + 3);
    else {
      uint64_t v19 = v13;
    }
    __int128 v25 = *((_OWORD *)a5 + 2);
    __int128 v26 = v18;
    sub_100004EE0(a1, a3, v19, (const char **)&v23);
    if (*((_DWORD *)a5 + 6) - 1 >= v14 && (_DWORD)v12)
    {
      do
      {
        uint64_t v20 = IOIteratorNext(iterator);
        __int128 v21 = *((_OWORD *)a5 + 1);
        __int128 v23 = *(_OWORD *)a5;
        __int128 v24 = v21;
        __int128 v22 = *((_OWORD *)a5 + 3);
        __int128 v25 = *((_OWORD *)a5 + 2);
        __int128 v26 = v22;
        sub_1000042AC(v12, (_DWORD)v20 != 0, v14, v19, &v23);
        IOObjectRelease(v12);
        uint64_t v12 = v20;
      }

      while ((_DWORD)v20);
    }

    return IOObjectRelease(iterator);
  }

  return result;
}

CFMutableDictionaryRef sub_1000043F4(uint64_t object, uint64_t a2)
{
  uint32_t valuePtr = 0;
  uint64_t entryID = 0LL;
  CFMutableDictionaryRef properties = 0LL;
  uint64_t v29 = 0LL;
  uint64_t v30 = 0LL;
  if ((*(_WORD *)a2 & 0x20) != 0
    || (__int128 v4 = *(_OWORD *)(a2 + 16),
        cStr[0] = *(_OWORD *)a2,
        cStr[1] = v4,
        __int128 v5 = *(_OWORD *)(a2 + 48),
        cStr[2] = *(_OWORD *)(a2 + 32),
        cStr[3] = v5,
        sub_1000049E0(object, (uint64_t)cStr)))
  {
    if (IORegistryEntryCreateCFProperties(object, &properties, kCFAllocatorDefault, 0))
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain properties");
      CFMutableDictionaryRef v6 = 0LL;
      CFMutableDictionaryRef properties = 0LL;
    }

    else
    {
      CFMutableDictionaryRef v6 = properties;
    }

    sub_100004C4C(v6);
  }

  if (!properties)
  {
    CFMutableDictionaryRef properties = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (!properties)
    {
      __int128 v27 = __stderrp;
      __int128 v28 = "can't create dictionary";
      goto LABEL_47;
    }
  }

  if (IORegistryEntryGetNameInPlane(object, *(const char **)(a2 + 48), name))
  {
    fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain name");
    strcpy(name, "<name error>");
  }

  CFStringRef v7 = CFStringCreateWithCString(kCFAllocatorDefault, name, 0x8000100u);
  if (!v7)
  {
    __int128 v27 = __stderrp;
    __int128 v28 = "can't create name";
    goto LABEL_47;
  }

  CFStringRef v8 = v7;
  CFDictionarySetValue(properties, @"IORegistryEntryName", v7);
  CFRelease(v8);
  if (!IORegistryEntryGetLocationInPlane(object, *(const char **)(a2 + 48), location))
  {
    CFStringRef v9 = CFStringCreateWithCString(kCFAllocatorDefault, location, 0x8000100u);
    if (!v9)
    {
      __int128 v27 = __stderrp;
      __int128 v28 = "can't create location";
      goto LABEL_47;
    }

    CFStringRef v10 = v9;
    CFDictionarySetValue(properties, @"IORegistryEntryLocation", v9);
    CFRelease(v10);
  }

  if (IORegistryEntryGetRegistryEntryID(object, &entryID))
  {
    fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain identifier");
    uint64_t entryID = -1LL;
  }

  CFNumberRef v11 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &entryID);
  if (!v11)
  {
    __int128 v27 = __stderrp;
    __int128 v28 = "can't create identifier";
    goto LABEL_47;
  }

  CFNumberRef v12 = v11;
  CFDictionarySetValue(properties, @"IORegistryEntryID", v11);
  CFRelease(v12);
  if (_IOObjectGetClass(object, (char *)1))
  {
    fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain class");
    strcpy((char *)cStr, "<class error>");
  }

  CFStringRef v13 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)cStr, 0x8000100u);
  if (!v13)
  {
    __int128 v27 = __stderrp;
    __int128 v28 = "can't create class";
    goto LABEL_47;
  }

  CFStringRef v14 = v13;
  CFDictionarySetValue(properties, @"IOObjectClass", v13);
  if ((*(_WORD *)a2 & 0x10) != 0)
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1LL, &kCFTypeArrayCallBacks);
    if (!Mutable)
    {
      __int128 v27 = __stderrp;
      __int128 v28 = "can't create array";
      goto LABEL_47;
    }

    uint64_t v16 = Mutable;
    while (1)
    {
      CFStringRef v17 = v14;
      CFArrayInsertValueAtIndex(v16, 0LL, v14);
      CFStringRef v14 = IOObjectCopySuperclassForClass(v14);
      CFRelease(v17);
      if (!v14) {
        break;
      }
      if (CFEqual(v14, @"OSObject"))
      {
        CFDictionarySetValue(properties, @"IOObjectInheritance", v16);
        CFRelease(v16);
        goto LABEL_27;
      }
    }

    CFDictionarySetValue(properties, @"IOObjectInheritance", v16);
    CFStringRef v14 = (CFStringRef)v16;
  }

LABEL_27:
  CFRelease(v14);
  uint32_t valuePtr = IOObjectGetKernelRetainCount(object);
  CFNumberRef v18 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  if (!v18)
  {
    __int128 v27 = __stderrp;
    __int128 v28 = "can't create retain count";
    goto LABEL_47;
  }

  CFNumberRef v19 = v18;
  CFDictionarySetValue(properties, @"IOObjectRetainCount", v18);
  CFRelease(v19);
  if (_IOObjectConformsTo(object, "IOService"))
  {
    if (IOServiceGetBusyStateAndTime(object, &v30, &valuePtr, &v29))
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain state");
      uint32_t valuePtr = 0;
      uint64_t v29 = 0LL;
      uint64_t v30 = 0LL;
    }

    CFNumberRef v20 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &v30);
    if (v20)
    {
      CFNumberRef v21 = v20;
      CFDictionarySetValue(properties, @"IOServiceState", v20);
      CFRelease(v21);
      CFNumberRef v22 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
      if (v22)
      {
        CFNumberRef v23 = v22;
        CFDictionarySetValue(properties, @"IOServiceBusyState", v22);
        CFRelease(v23);
        CFNumberRef v24 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &v29);
        if (v24)
        {
          CFNumberRef v25 = v24;
          CFDictionarySetValue(properties, @"IOServiceBusyTime", v24);
          CFRelease(v25);
          return properties;
        }

        __int128 v27 = __stderrp;
        __int128 v28 = "can't create busy time";
      }

      else
      {
        __int128 v27 = __stderrp;
        __int128 v28 = "can't create busy state";
      }
    }

    else
    {
      __int128 v27 = __stderrp;
      __int128 v28 = "can't create state";
    }

      v76 = CFGetTypeID(a2);
      if (v76 == CFDataGetTypeID())
      {
        v84 = CFDataGetLength((CFDataRef)a2);
        v92 = (char *)CFDataGetBytePtr((CFDataRef)a2);
        v370 = v84;
        if (v84 < 1)
        {
          v95 = 0LL;
          v94 = 0;
          v93 = 0;
          goto LABEL_147;
        }

        v93 = 0;
        v94 = 0;
        v95 = 0LL;
LABEL_30:
        if (v92[v95])
        {
          if (v95 >= v84) {
            goto LABEL_147;
          }
          while (1)
          {
            v96 = v92[v95];
            if (v92[v95] < 0)
            {
              if (__maskrune(v92[v95], 0x40000uLL))
              {
LABEL_34:
                ++v93;
                goto LABEL_38;
              }
            }

            else if ((_DefaultRuneLocale.__runetype[v96] & 0x40000) != 0)
            {
              goto LABEL_34;
            }

            if ((char)v96 > -2)
            {
              v84 = v370;
              if (v92[v95]) {
                goto LABEL_147;
              }
              if (++v95 >= v370) {
                goto LABEL_147;
              }
              goto LABEL_30;
            }

            ++v94;
LABEL_38:
            v84 = v370;
            if (v370 == ++v95) {
              goto LABEL_146;
            }
          }
        }

        if (v95 < v84)
        {
          while (!v92[v95])
          {
            if (v84 == ++v95)
            {
LABEL_146:
              v95 = v84;
              break;
            }
          }
        }

LABEL_47:
    fprintf(v27, "ioreg: error: %s.\n", v28);
    exit(1);
  }

  return properties;
}

BOOL sub_1000049E0(io_object_t object, uint64_t a2)
{
  if (*(void *)(a2 + 8))
  {
    if (*(void *)(a2 + 16))
    {
      if ((*(_WORD *)a2 & 0x100) == 0)
      {
        CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty( object,  @"IOUserClasses",  kCFAllocatorDefault,  0);
        if (CFProperty)
        {
          __int128 v5 = CFProperty;
          CFTypeID TypeID = CFArrayGetTypeID();
          if (TypeID == CFGetTypeID(v5))
          {
            v15.length = CFArrayGetCount(v5);
            v15.io_name_t location = 0LL;
            int v7 = CFArrayContainsValue(v5, v15, *(const void **)(a2 + 16));
            CFRelease(v5);
            if (v7)
            {
              uint64_t v8 = 1LL;
              goto LABEL_11;
            }

            return 0LL;
          }

          CFRelease(v5);
        }
      }
    }

    uint64_t v8 = 1LL;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

void sub_100004C4C(void *a1)
{
  if (a1)
  {
    CFTypeID v2 = CFGetTypeID(a1);
    if (v2 == CFSetGetTypeID())
    {
      CFNumberRef v22 = __stderrp;
      CFNumberRef v23 = "Root object cannot be a CFSet";
LABEL_20:
      fprintf(v22, "ioreg: error: %s.\n", v23);
      exit(1);
    }

    if (v2 == CFDictionaryGetTypeID())
    {
      CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)a1);
      __int128 v4 = (const void **)malloc(8 * Count);
      __int128 v5 = (const void **)malloc(8 * Count);
      CFDictionaryGetKeysAndValues((CFDictionaryRef)a1, v4, v5);
      if (Count >= 1)
      {
        CFMutableDictionaryRef v6 = v5;
        int v7 = v4;
        do
        {
          CFTypeID v8 = CFGetTypeID(*v6);
          if (v8 == CFSetGetTypeID())
          {
            CFIndex v9 = CFSetGetCount((CFSetRef)*v6);
            CFStringRef v10 = (const void **)malloc(8 * v9);
            CFSetGetValues((CFSetRef)*v6, v10);
            CFArrayRef v11 = CFArrayCreate(kCFAllocatorDefault, v10, v9, &kCFTypeArrayCallBacks);
            if (!v11) {
              goto LABEL_19;
            }
            CFArrayRef v12 = v11;
            CFDictionaryReplaceValue((CFMutableDictionaryRef)a1, *v7, v11);
            CFTypeRef *v6 = v12;
            CFRelease(v12);
            free(v10);
          }

          CFTypeRef v13 = *v6++;
          sub_100004C4C(v13);
          ++v7;
          --Count;
        }

        while (Count);
      }

      free(v4);
      free(v5);
    }

    else if (v2 == CFArrayGetTypeID())
    {
      CFIndex v14 = CFArrayGetCount((CFArrayRef)a1);
      if (v14 >= 1)
      {
        CFIndex v15 = v14;
        for (CFIndex i = 0LL; v15 != i; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, i);
          CFTypeID v18 = CFGetTypeID(ValueAtIndex);
          if (v18 == CFSetGetTypeID())
          {
            CFIndex v19 = CFSetGetCount((CFSetRef)ValueAtIndex);
            CFNumberRef v20 = (const void **)malloc(8 * v19);
            CFSetGetValues((CFSetRef)ValueAtIndex, v20);
            CFArrayRef v21 = CFArrayCreate(kCFAllocatorDefault, v20, v19, &kCFTypeArrayCallBacks);
            if (!v21)
            {
LABEL_19:
              CFNumberRef v22 = __stderrp;
              CFNumberRef v23 = "can't create array for set replacement";
              goto LABEL_20;
            }

            ValueAtIndex = v21;
            CFArraySetValueAtIndex((CFMutableArrayRef)a1, i, v21);
            CFRelease(ValueAtIndex);
            free(v20);
          }

          sub_100004C4C(ValueAtIndex);
        }
      }
    }
  }

void sub_100004EE0(uint64_t a1, uint64_t a2, uint64_t a3, const char **a4)
{
  __int128 v8 = *((_OWORD *)a4 + 1);
  __int128 v142 = *(_OWORD *)a4;
  __int128 v9 = *((_OWORD *)a4 + 2);
  __int128 v10 = *((_OWORD *)a4 + 3);
  __int128 v143 = v8;
  __int128 v144 = v9;
  context[0] = a1;
  context[1] = a2;
  uint64_t v141 = a3;
  __int128 v145 = v10;
  KernelRetainCFIndex Count = 0;
  uint64_t v138 = 0LL;
  CFMutableDictionaryRef properties = 0LL;
  if (IORegistryEntryGetNameInPlane(a1, a4[6], name))
  {
    fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain name");
    strcpy(name, "<name error>");
  }

  sub_1000054B4(1, a2, a3, v11, v12, v13, v14, v15, v128);
  if ((*(_WORD *)a4 & 2) != 0) {
    tputs((const char *)qword_10000C000, 1, j__putchar);
  }
  sub_10000557C("%s", v16, v17, v18, v19, v20, v21, v22, (char)name);
  if ((*(_WORD *)a4 & 2) != 0) {
    tputs((const char *)qword_10000C020, 1, j__putchar);
  }
  if (!IORegistryEntryGetLocationInPlane(a1, a4[6], location)) {
    sub_10000557C("@%s", v23, v24, v25, v26, v27, v28, v29, (char)location);
  }
  sub_10000557C("  <class ", v23, v24, v25, v26, v27, v28, v29, v129);
  if ((*(_WORD *)a4 & 0x10) != 0)
  {
    CFStringRef v37 = _IOObjectCopyClass(a1);
    if (v37)
    {
      __int128 v38 = v37;
      CFMutableArrayRef Mutable = CFStringCreateMutable(0LL, 512LL);
      if (Mutable)
      {
        v40 = Mutable;
        CFStringInsert(Mutable, 0LL, v38);
        Copy = CFStringCreateCopy(0LL, v38);
        if (Copy)
        {
          __int128 v42 = Copy;
          __int128 v43 = IOObjectCopySuperclassForClass(Copy);
          CFRelease(v42);
          if (v43)
          {
            while (!CFEqual(v43, @"OSObject"))
            {
              CFStringInsert(v40, 0LL, @":");
              CFStringInsert(v40, 0LL, v43);
              CFStringRef v44 = IOObjectCopySuperclassForClass(v43);
              CFRelease(v43);
              __int128 v43 = v44;
              if (!v44) {
                goto LABEL_21;
              }
            }

            CFRelease(v43);
          }
        }

LABEL_21:
        CStringPtr = CFStringGetCStringPtr(v40, 0x8000100u);
        if (CStringPtr) {
          sub_10000557C("%s", v46, v47, v48, v49, v50, v51, v52, (char)CStringPtr);
        }
        CFRelease(v40);
      }

      CFRelease(v38);
    }
  }

  else
  {
    if (_IOObjectGetClass(a1, (char *)1))
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain class");
      strcpy(v148, "<class error>");
    }

    sub_10000557C("%s", v30, v31, v32, v33, v34, v35, v36, (char)v148);
  }

  if (!IORegistryEntryGetRegistryEntryID(a1, &entryID)) {
    sub_10000557C(", id 0x%llx", v53, v54, v55, v56, v57, v58, v59, entryID);
  }
  if (_IOObjectConformsTo(a1, "IOService"))
  {
    if (IOServiceGetBusyStateAndTime(a1, &v138, &KernelRetainCount, &v137))
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain state");
      char v67 = 0;
      unint64_t v137 = 0LL;
      uint64_t v138 = 0LL;
      KernelRetainCFIndex Count = 0;
    }

    else
    {
      char v67 = v138;
    }

    v68 = (v67 & 2) != 0 ? &unk_100007846 : "!";
    sub_10000557C(", %sregistered, %smatched, %sactive", v60, v61, v62, v63, v64, v65, v66, (char)v68);
    sub_10000557C(", busy %ld", v69, v70, v71, v72, v73, v74, v75, KernelRetainCount);
    if (v137) {
      sub_10000557C(" (%lld ms)", v76, v77, v78, v79, v80, v81, v82, v137 / 0xF4240);
    }
  }

  KernelRetainCFIndex Count = IOObjectGetKernelRetainCount(a1);
  sub_10000557C(", retain %ld", v83, v84, v85, v86, v87, v88, v89, KernelRetainCount);
  sub_1000055A4(">", v90, v91, v92, v93, v94, v95, v96, v130);
  if ((*(_WORD *)a4 & 0x20) != 0
    || (__int128 v104 = *((_OWORD *)a4 + 1),
        v134[0] = *(_OWORD *)a4,
        v134[1] = v104,
        __int128 v105 = *((_OWORD *)a4 + 3),
        v134[2] = *((_OWORD *)a4 + 2),
        v134[3] = v105,
        sub_1000049E0(a1, (uint64_t)v134)))
  {
    unsigned int v106 = 0;
    unsigned int v107 = a2 + 1;
    do
    {
      else {
        v108 = "  ";
      }
      sub_10000557C(v108, v97, v98, v99, v100, v101, v102, v103, v131);
      ++v106;
    }

    while (v106 <= v107);
    sub_1000055A4("{", v97, v98, v99, v100, v101, v102, v103, v131);
    if (IORegistryEntryCreateCFProperties(a1, &properties, kCFAllocatorDefault, 0))
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't obtain properties");
      CFMutableDictionaryRef properties = 0LL;
    }

    else
    {
      v109 = properties;
      if (properties)
      {
LABEL_45:
        CFDictionaryApplyFunction(v109, (CFDictionaryApplierFunction)sub_100005608, context);
        unsigned int v117 = 0;
        do
        {
          else {
            v118 = "  ";
          }
          sub_10000557C(v118, v110, v111, v112, v113, v114, v115, v116, v132);
          ++v117;
        }

        while (v117 <= v107);
        sub_1000055A4("}", v110, v111, v112, v113, v114, v115, v116, v132);
        unsigned int v126 = 0;
        do
        {
          else {
            v127 = "  ";
          }
          sub_10000557C(v127, v119, v120, v121, v122, v123, v124, v125, v133);
          ++v126;
        }

        while (v126 <= v107);
        sub_1000055A4((char *)&unk_100007846, v119, v120, v121, v122, v123, v124, v125, v133);
        CFRelease(properties);
        return;
      }
    }

    v109 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    CFMutableDictionaryRef properties = v109;
    if (!v109)
    {
      fprintf(__stderrp, "ioreg: error: %s.\n", "can't create dictionary");
      exit(1);
    }

    goto LABEL_45;
  }

uint64_t sub_1000054B4( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10 = a2;
  if (a1)
  {
    if ((_DWORD)a2)
    {
      int v11 = 0;
      do
      {
        else {
          uint64_t v12 = "  ";
        }
        sub_10000557C(v12, a2, a3, a4, a5, a6, a7, a8, v17);
        ++v11;
      }

      while (v10 != v11);
    }

    return sub_10000557C("+-o ", a2, a3, a4, a5, a6, a7, a8, a9);
  }

  else
  {
    unsigned int v14 = 0;
    unsigned int v15 = a2 + 1;
    do
    {
      else {
        uint64_t v16 = "  ";
      }
      uint64_t result = sub_10000557C(v16, a2, a3, a4, a5, a6, a7, a8, v17);
      ++v14;
    }

    while (v14 <= v15);
  }

  return result;
}

uint64_t sub_10000557C( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return sub_1000064D0(a1, &a9);
}

uint64_t sub_1000055A4( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (byte_10000C01C == 1) {
    putchar(36);
  }
  uint64_t result = putchar(10);
  byte_10000C01C = 0;
  dword_10000C018 = dword_10000C008;
  return result;
}

uint64_t sub_100005608( const __CFString *a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9 = a3;
  unsigned int v12 = 0;
  uint64_t v13 = *(void *)(a3 + 8);
  unsigned int v14 = *(_DWORD *)(a3 + 4) + 1;
  do
  {
    if ((v13 & (1 << v12)) != 0) {
      unsigned int v15 = "| ";
    }
    else {
      unsigned int v15 = "  ";
    }
    sub_10000557C(v15, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v344);
    ++v12;
  }

  while (v12 <= v14);
  sub_10000557C("  ", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v344);
  sub_1000065A0(a1, v16, v17, v18, v19, v20, v21, v22, v345);
  sub_10000557C(" = ", v23, v24, v25, v26, v27, v28, v29, v346);
  if ((*(_WORD *)(v9 + 16) & 4) == 0)
  {
    sub_1000065A0(a2, v30, v31, v32, v33, v34, v35, v36, v347);
    CFStringRef v44 = (char *)&unk_100007846;
    return sub_1000055A4(v44, v37, v38, v39, v40, v41, v42, v43, a9);
  }

  io_registry_entry_t v46 = *(_DWORD *)v9;
  uint64_t v374 = v9;
  if (CFStringCompare(a1, @"reg", 0LL) == kCFCompareEqualTo)
  {
    if (!IORegistryEntryGetParentEntry(v46, "IODeviceTree", &parent))
    {
      if (IORegistryEntryGetNameInPlane(parent, "IODeviceTree", name))
      {
        fprintf(__stderrp, "ioreg: error: %s.\n", "could not get name of parent");
        strcpy(name, "<name error>");
      }

      IOObjectRelease(parent);
      BOOL v75 = *(unsigned __int16 *)name == 25456 && name[2] == 105;
      if (v75) {
        return sub_100006B20(a2, v9, v69, v70, v71, v72, v73, v74, v347);
      }
    }

    goto LABEL_27;
  }

  if (CFStringCompare(a1, @"assigned-addresses", 0LL) == kCFCompareEqualTo) {
    return sub_100006B20(a2, v9, v47, v48, v49, v50, v51, v52, a9);
  }
  if (CFStringCompare(a1, @"slot-names", 0LL) == kCFCompareEqualTo)
  {
    CFTypeID v97 = CFGetTypeID(a2);
    if (v97 == CFDataGetTypeID())
    {
      if (!CFDataGetLength((CFDataRef)a2) || (BytePtr = CFDataGetBytePtr((CFDataRef)a2), !*(_DWORD *)BytePtr))
      {
        CFStringRef v44 = "<>";
        return sub_1000055A4(v44, v37, v38, v39, v40, v41, v42, v43, a9);
      }

      uint64_t v99 = BytePtr;
      uint64_t v100 = (const char *)(BytePtr + 4);
      uint64_t result = sub_1000055A4((char *)&unk_100007846, v37, v38, v39, v40, v41, v42, v43, v347);
      for (uint64_t i = 0LL; i != 32; ++i)
      {
        if (((*(_DWORD *)v99 >> i) & 1) != 0)
        {
          unsigned int v109 = 0;
          uint64_t v110 = *(void *)(v374 + 8);
          unsigned int v111 = *(_DWORD *)(v374 + 4) + 1;
          do
          {
            if ((v110 & (1 << v109)) != 0) {
              uint64_t v112 = "| ";
            }
            else {
              uint64_t v112 = "  ";
            }
            sub_10000557C(v112, v101, v102, v103, v104, v105, v106, v107, v349);
            ++v109;
          }

          while (v109 <= v111);
          sub_1000055A4("    %02lu: %s", v101, v102, v103, v104, v105, v106, v107, i);
          uint64_t result = strlen(v100);
          v100 += result + 1;
        }
      }

      return result;
    }

    v342 = __stderrp;
    v343 = "invalid phys addr";
    goto LABEL_218;
  }

  if (CFStringCompare(a1, @"ranges", 0LL) == kCFCompareEqualTo)
  {
    CFTypeID v113 = CFGetTypeID(a2);
    if (v113 == CFDataGetTypeID())
    {
      CFIndex Length = CFDataGetLength((CFDataRef)a2);
      if (!Length)
      {
        v294 = "<>";
        return sub_1000055A4(v294, v85, v86, v87, v88, v89, v90, v91, v347);
      }

      CFIndex v115 = Length;
      uint64_t v116 = CFDataGetBytePtr((CFDataRef)a2);
      unint64_t v366 = v115;
      if (IORegistryEntryGetParentEntry(*(_DWORD *)v9, "IODeviceTree", &parent))
      {
        fprintf(__stderrp, "ioreg: error: %s.\n", "unable to get device tree parent");
        io_registry_entry_t v117 = 0;
        io_registry_entry_t parent = 0;
      }

      else
      {
        io_registry_entry_t v117 = parent;
      }

      int v118 = sub_100006E0C(v117, @"#address-cells");
      IOObjectRelease(parent);
      int v119 = sub_100006E0C(*(_DWORD *)v9, @"#address-cells");
      int v371 = sub_100006E0C(*(_DWORD *)v9, @"#size-cells");
      sub_1000055A4((char *)&unk_100007846, v120, v121, v122, v123, v124, v125, v126, v347);
      unsigned int v134 = 0;
      uint64_t v135 = *(void *)(v9 + 8);
      unsigned int v136 = *(_DWORD *)(v9 + 4) + 1;
      do
      {
        if ((v135 & (1 << v134)) != 0) {
          unint64_t v137 = "| ";
        }
        else {
          unint64_t v137 = "  ";
        }
        sub_10000557C(v137, v127, v128, v129, v130, v131, v132, v133, v350);
        ++v134;
      }

      while (v134 <= v136);
      sub_10000557C("    ", v127, v128, v129, v130, v131, v132, v133, v350);
      uint64_t v145 = 0LL;
      *(_DWORD *)io_name_t name = v119;
      *(_DWORD *)&name[4] = v118;
      *(_DWORD *)&name[8] = v371;
      do
      {
        sub_10000557C("%s", v138, v139, v140, v141, v142, v143, v144, (char)(&off_100008348)[v145]);
        uint64_t v153 = *(unsigned int *)&name[4 * v145];
        if ((int)v153 < 2)
        {
          sub_10000557C(" ", v146, v147, v148, v149, v150, v151, v152, v351);
        }

        else
        {
          sub_10000557C("-", v146, v147, v148, v149, v150, v151, v152, v351);
          uint64_t v154 = v153 - 1;
          do
          {
            if (--v154) {
              v155 = "---------";
            }
            else {
              v155 = "-------- ";
            }
            sub_10000557C(v155, v138, v139, v140, v141, v142, v143, v144, v352);
          }

          while (v154);
        }

        ++v145;
      }

      while (v145 != 3);
      int v156 = v119 + v118 + v371;
      uint64_t result = sub_1000055A4((char *)&unk_100007846, v138, v139, v140, v141, v142, v143, v144, v352);
      unint64_t v164 = 4LL * v156;
      if (v164 <= v366)
      {
        uint64_t v165 = 0LL;
        unint64_t v166 = v366 / v164;
        else {
          uint64_t v167 = v156;
        }
        uint64_t v367 = v167;
        if (v166 <= 1) {
          uint64_t v168 = 1LL;
        }
        else {
          uint64_t v168 = v166;
        }
        do
        {
          unsigned int v169 = 0;
          uint64_t v170 = *(void *)(v374 + 8);
          unsigned int v171 = *(_DWORD *)(v374 + 4) + 1;
          do
          {
            if ((v170 & (1 << v169)) != 0) {
              v172 = "| ";
            }
            else {
              v172 = "  ";
            }
            sub_10000557C(v172, v157, v158, v159, v160, v161, v162, v163, v353);
            ++v169;
          }

          while (v169 <= v171);
          sub_10000557C("    ", v157, v158, v159, v160, v161, v162, v163, v353);
          if (v156)
          {
            uint64_t v180 = v367;
            do
            {
              int v181 = *(_DWORD *)v116;
              v116 += 4;
              sub_10000557C("%08lx ", v173, v174, v175, v176, v177, v178, v179, v181);
              --v180;
            }

            while (v180);
          }

          uint64_t result = sub_1000055A4((char *)&unk_100007846, v173, v174, v175, v176, v177, v178, v179, v354);
          ++v165;
        }

        while (v165 != v168);
      }

      return result;
    }

    v342 = __stderrp;
    v343 = "invalid ranges";
LABEL_218:
    fprintf(v342, "ioreg: error: %s.\n", v343);
    exit(1);
  }

  if (CFStringCompare(a1, @"interrupt-map", 0LL))
  {
    if (CFStringCompare(a1, @"interrupts", 0LL))
    {
      if (CFStringCompare(a1, @"interrupt-parent", 0LL) == kCFCompareEqualTo)
      {
        uint64_t v53 = (int *)CFDataGetBytePtr((CFDataRef)a2);
        uint64_t result = sub_100006E94(*v53, &parent);
        if ((_DWORD)result)
        {
          name[0] = 0;
          io_registry_entry_t v54 = parent;
          sub_100006F6C(parent, name);
          sub_10000557C("<%08lx>", v55, v56, v57, v58, v59, v60, v61, *v53);
          if (name[0]) {
            sub_10000557C(" (%s)", v62, v63, v64, v65, v66, v67, v68, (char)name);
          }
          sub_1000055A4((char *)&unk_100007846, v62, v63, v64, v65, v66, v67, v68, v348);
          return IOObjectRelease(v54);
        }

        return result;
      }

LABEL_147:
        if (byte_10000C028) {
          CFIndex v295 = 0LL;
        }
        else {
          CFIndex v295 = v95;
        }
        BOOL v296 = v84 != 1 && v93 >> 2 >= v94;
        if (v296) {
          CFIndex v297 = v295;
        }
        else {
          CFIndex v297 = 0LL;
        }
        if (v93 && v297 >= v84)
        {
          sub_10000557C("<", v85, v86, v87, v88, v89, v90, v91, v347);
          if (v84 >= 1)
          {
            int v305 = 0;
            for (uint64_t j = 0LL; j != v84; ++j)
            {
              while (1)
              {
                char v307 = v92[j];
                if (v307) {
                  break;
                }
                if (v305 == 1)
                {
                  sub_10000557C("", v298, v299, v300, v301, v302, v303, v304, v362);
                  int v305 = 0;
                  if (++j != v84) {
                    continue;
                  }
                }

                goto LABEL_212;
              }

              if (!v305)
              {
                if (j) {
                  v308 = ",";
                }
                else {
                  v308 = "";
                }
                sub_10000557C(v308, v298, v299, v300, v301, v302, v303, v304, v362);
                char v307 = v92[j];
                int v305 = 1;
              }

              sub_10000557C("%c", v298, v299, v300, v301, v302, v303, v304, v307);
            }

            sub_10000557C("", v298, v299, v300, v301, v302, v303, v304, v362);
          }
        }

        else
        {
          if (v84 >= 9)
          {
            CFIndex v309 = 0LL;
            unsigned int v310 = 0;
            unsigned int v311 = (*(_DWORD *)(v9 + 72) - 2 * *(_DWORD *)(v9 + 4) - 20) >> 2;
            if (v311 >= 0x20) {
              uint64_t v312 = 32LL;
            }
            else {
              uint64_t v312 = v311;
            }
            uint64_t v365 = v312;
            do
            {
              sub_1000055A4((char *)&unk_100007846, v85, v86, v87, v88, v89, v90, v91, v347);
              CFIndex v369 = v310 + v312;
              if (v84 >= v369) {
                uint64_t v320 = v312;
              }
              else {
                uint64_t v320 = v84 - v309;
              }
              name[8] = 58;
              v321 = &name[7];
              unsigned int v322 = v310;
              if (!v310) {
                goto LABEL_185;
              }
              do
              {
                if ((v322 & 0xF) >= 0xA) {
                  char v323 = (v322 & 0xF) + 55;
                }
                else {
                  char v323 = v322 & 0xF | 0x30;
                }
                *v321-- = v323;
                BOOL v296 = v322 >= 0x10;
                v322 >>= 4;
              }

              while (v296);
              if (v321 >= name) {
LABEL_185:
              }
                memset(name, 48, v321 - name + 1);
              if (v320 < 1)
              {
                LODWORD(v324) = 0;
                v331 = &name[9];
              }

              else
              {
                LODWORD(v324) = 0;
                v325 = &name[9];
                do
                {
                  unsigned int v326 = v92[v310 + v324];
                  char *v325 = 32;
                  int v327 = (v326 >> 4) + 55;
                  if (v326 < 0xA0) {
                    LOBYTE(v327) = (v326 >> 4) | 0x30;
                  }
                  v325[1] = v327;
                  unsigned int v328 = v326 & 0xF;
                  char v329 = v326 & 0xF | 0x30;
                  char v330 = (v326 & 0xF) + 55;
                  if (v328 < 0xA) {
                    char v330 = v329;
                  }
                  v331 = v325 + 3;
                  v325[2] = v330;
                  uint64_t v324 = (v324 + 1);
                  v325 += 3;
                }

                while (v320 > v324);
              }

              if (v324 < v312)
              {
                size_t v332 = 3LL * (v312 + ~(_DWORD)v324) + 3;
                memset(v331, 32, v332);
                v331 += v332;
              }

              char *v331 = 32;
              v333 = v331 + 1;
              if (v320 >= 1)
              {
                unsigned int v334 = 1;
                do
                {
                  int v335 = v92[v310 - 1 + v334];
                  *v333++ = v335;
                }

                while (v320 > v334++);
              }

              unsigned int v337 = 0;
              _BYTE *v333 = 0;
              uint64_t v338 = *(void *)(v9 + 8);
              unsigned int v339 = *(_DWORD *)(v9 + 4) + 1;
              do
              {
                if ((v338 & (1 << v337)) != 0) {
                  v340 = "| ";
                }
                else {
                  v340 = "  ";
                }
                sub_10000557C(v340, v313, v314, v315, v316, v317, v318, v319, v363);
                ++v337;
              }

              while (v337 <= v339);
              sub_10000557C("    %s", v313, v314, v315, v316, v317, v318, v319, (char)name);
              CFIndex v309 = v369;
              CFIndex v84 = v370;
              unsigned int v310 = v369;
              uint64_t v312 = v365;
            }

            while (v370 > v369);
            goto LABEL_213;
          }

          sub_10000557C("<", v85, v86, v87, v88, v89, v90, v91, v347);
          if (v84 >= 1)
          {
            do
            {
              char v341 = *v92++;
              sub_10000557C("%02x", v298, v299, v300, v301, v302, v303, v304, v341);
              --v84;
            }

            while (v84);
          }
        }

LABEL_212:
        sub_10000557C(">", v298, v299, v300, v301, v302, v303, v304, v362);
      }

      else
      {
        sub_1000065A0(a2, v77, v78, v79, v80, v81, v82, v83, v347);
      }

LABEL_213:
      v294 = (char *)&unk_100007846;
      return sub_1000055A4(v294, v85, v86, v87, v88, v89, v90, v91, v347);
    }

    v254 = CFDataGetBytePtr((CFDataRef)a2);
    unint64_t v255 = CFDataGetLength((CFDataRef)a2);
    uint64_t result = sub_1000055A4((char *)&unk_100007846, v256, v257, v258, v259, v260, v261, v262, v347);
    if ((uint64_t)(v255 & 0xFFFFFFFFFFFFFFFCLL) >= 1)
    {
      char v270 = 0;
      uint64_t v271 = 0LL;
      v373 = &v254[4 * (v255 >> 2)];
      uint64_t v272 = (v255 >> 2) - 1;
      do
      {
        unsigned int v273 = 0;
        uint64_t v274 = *(void *)(v374 + 8);
        unsigned int v275 = *(_DWORD *)(v374 + 4) + 1;
        do
        {
          if ((v274 & (1 << v273)) != 0) {
            v276 = "| ";
          }
          else {
            v276 = "  ";
          }
          sub_10000557C(v276, v263, v264, v265, v266, v267, v268, v269, v361);
          ++v273;
        }

        while (v273 <= v275);
        sub_10000557C("    %02ld: ", v263, v264, v265, v266, v267, v268, v269, v270);
        int v284 = *(_DWORD *)v254;
        if (v271 >= v272)
        {
          uint64_t result = sub_1000055A4( "parent interrupt-map entry: %08lx",  v277,  v278,  v279,  v280,  v281,  v282,  v283,  *(_DWORD *)v254);
        }

        else
        {
          v254 += 4;
          sub_10000557C( "specifier: %08lx (vector: %02lx) sense: %08lx (",  v277,  v278,  v279,  v280,  v281,  v282,  v283,  v284);
          int v292 = *(_DWORD *)v254;
          if ((*(_DWORD *)v254 & 2) != 0)
          {
            sub_10000557C("HyperTransport vector: %04lx, ", v285, v286, v287, v288, v289, v290, v291, SBYTE2(v292));
            int v292 = *(_DWORD *)v254;
          }

          ++v271;
          BOOL v75 = (v292 & 1) == 0;
          v293 = "level";
          if (v75) {
            v293 = "edge";
          }
          uint64_t result = sub_1000055A4("%s)", v285, v286, v287, v288, v289, v290, v291, (char)v293);
        }

        v254 += 4;
        ++v271;
        ++v270;
      }

      while (v254 < v373);
    }
  }

  else
  {
    int v182 = sub_100006E0C(*(_DWORD *)v9, @"#address-cells");
    int v183 = sub_100006E0C(*(_DWORD *)v9, @"#interrupt-cells");
    v184 = (int *)CFDataGetBytePtr((CFDataRef)a2);
    int64_t v185 = CFDataGetLength((CFDataRef)a2) & 0xFFFFFFFFFFFFFFFCLL;
    uint64_t result = sub_1000055A4((char *)&unk_100007846, v186, v187, v188, v189, v190, v191, v192, v347);
    if (v185 >= 1)
    {
      char v200 = 0;
      v368 = (int *)((char *)v184 + v185);
      uint64_t v364 = v183 + v182;
      do
      {
        unsigned int v201 = 0;
        uint64_t v202 = *(void *)(v9 + 8);
        unsigned int v203 = *(_DWORD *)(v9 + 4) + 1;
        do
        {
          if ((v202 & (1 << v201)) != 0) {
            v204 = "| ";
          }
          else {
            v204 = "  ";
          }
          sub_10000557C(v204, v193, v194, v195, v196, v197, v198, v199, v355);
          ++v201;
        }

        while (v201 <= v203);
        sub_10000557C("    %02ld: ", v193, v194, v195, v196, v197, v198, v199, v200);
        sub_10000557C("  child: ", v205, v206, v207, v208, v209, v210, v211, v356);
        uint64_t v219 = v364;
        if ((int)v364 >= 1)
        {
          do
          {
            int v220 = *v184++;
            sub_10000557C("%08lx ", v212, v213, v214, v215, v216, v217, v218, v220);
            --v219;
          }

          while (v219);
        }

        sub_1000055A4((char *)&unk_100007846, v212, v213, v214, v215, v216, v217, v218, v357);
        if (sub_100006E94(*v184, &parent))
        {
          io_registry_entry_t v221 = parent;
        }

        else
        {
          fprintf(__stderrp, "ioreg: error: %s.\n", "error looking up phandle");
          io_registry_entry_t v221 = 0;
          io_registry_entry_t parent = 0;
        }

        int v372 = sub_100006E0C(v221, @"#address-cells");
        int v222 = sub_100006E0C(v221, @"#interrupt-cells");
        name[0] = 0;
        sub_100006F6C(v221, name);
        IOObjectRelease(v221);
        unsigned int v230 = 0;
        uint64_t v231 = *(void *)(v374 + 8);
        unsigned int v232 = *(_DWORD *)(v374 + 4) + 1;
        do
        {
          if ((v231 & (1 << v230)) != 0) {
            v233 = "| ";
          }
          else {
            v233 = "  ";
          }
          sub_10000557C(v233, v223, v224, v225, v226, v227, v228, v229, v358);
          ++v230;
        }

        while (v230 <= v232);
        sub_1000055A4("        phandle: %08lx (%s)", v223, v224, v225, v226, v227, v228, v229, *v184);
        unsigned int v241 = 0;
        uint64_t v242 = *(void *)(v374 + 8);
        unsigned int v243 = *(_DWORD *)(v374 + 4) + 1;
        do
        {
          if ((v242 & (1 << v241)) != 0) {
            v244 = "| ";
          }
          else {
            v244 = "  ";
          }
          sub_10000557C(v244, v234, v235, v236, v237, v238, v239, v240, v359);
          ++v241;
        }

        while (v241 <= v243);
        sub_10000557C("         parent: ", v234, v235, v236, v237, v238, v239, v240, v359);
        ++v184;
        if (v222 + v372 < 1)
        {
          uint64_t v9 = v374;
        }

        else
        {
          uint64_t v252 = v222 + v372;
          uint64_t v9 = v374;
          do
          {
            int v253 = *v184++;
            sub_10000557C("%08lx ", v245, v246, v247, v248, v249, v250, v251, v253);
            --v252;
          }

          while (v252);
        }

        uint64_t result = sub_1000055A4((char *)&unk_100007846, v245, v246, v247, v248, v249, v250, v251, v360);
        ++v200;
      }

      while (v184 < v368);
    }
  }

  return result;
}

uint64_t sub_1000064D0(char *__format, va_list a2)
{
  if (!dword_10000C008) {
    return vprintf(__format, a2);
  }
  int v2 = vsnprintf((char *)qword_10000C010, dword_10000C018, __format, a2);
  v3 = (const char *)qword_10000C010;
  uint64_t result = printf("%s", v3);
  if (v2 >= dword_10000C018)
  {
    int v2 = dword_10000C018 - 1;
    byte_10000C01C = 1;
  }

  dword_10000C018 -= v2;
  return result;
}

void sub_1000065A0( const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFTypeID v10 = CFGetTypeID(a1);
  if (v10 == CFArrayGetTypeID())
  {
    char context = 1;
    CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
    sub_10000557C("(", v12, v13, v14, v15, v16, v17, v18, v79);
    v85.io_name_t location = 0LL;
    v85.length = Count;
    CFArrayApplyFunction((CFArrayRef)a1, v85, (CFArrayApplierFunction)sub_100006A54, &context);
    uint64_t v26 = ")";
LABEL_3:
    sub_10000557C(v26, v19, v20, v21, v22, v23, v24, v25, v80);
    return;
  }

  if (v10 == CFBooleanGetTypeID())
  {
    if (CFBooleanGetValue((CFBooleanRef)a1)) {
      uint64_t v34 = "Yes";
    }
    else {
      uint64_t v34 = "No";
    }
    goto LABEL_64;
  }

  if (v10 == CFDataGetTypeID())
  {
    sub_10000557C("<", v35, v36, v37, v38, v39, v40, v41, v79);
    CFIndex Length = CFDataGetLength((CFDataRef)a1);
    BytePtr = (char *)CFDataGetBytePtr((CFDataRef)a1);
    if (Length < 1)
    {
      unsigned int v46 = 0;
      CFIndex v45 = 0LL;
      unsigned int v44 = 0;
LABEL_37:
      if (byte_10000C028) {
        CFIndex v64 = 0LL;
      }
      else {
        CFIndex v64 = v45;
      }
      if (Length != 1 && v44 >> 2 >= v46) {
        CFIndex v66 = v64;
      }
      else {
        CFIndex v66 = 0LL;
      }
      if (v44 && v66 >= Length)
      {
        if (Length >= 1)
        {
          int v67 = 0;
          for (uint64_t i = 0LL; i != Length; ++i)
          {
            while (1)
            {
              char v69 = BytePtr[i];
              if (v69) {
                break;
              }
              if (v67 == 1)
              {
                sub_10000557C("", v27, v28, v29, v30, v31, v32, v33, v81);
                int v67 = 0;
                if (++i != Length) {
                  continue;
                }
              }

              goto LABEL_63;
            }

            if (!v67)
            {
              if (i) {
                uint64_t v70 = ",";
              }
              else {
                uint64_t v70 = "";
              }
              sub_10000557C(v70, v27, v28, v29, v30, v31, v32, v33, v81);
              char v69 = BytePtr[i];
              int v67 = 1;
            }

            sub_10000557C("%c", v27, v28, v29, v30, v31, v32, v33, v69);
          }

          sub_10000557C("", v27, v28, v29, v30, v31, v32, v33, v81);
        }
      }

      else if (Length >= 1)
      {
        do
        {
          char v71 = *BytePtr++;
          sub_10000557C("%02x", v27, v28, v29, v30, v31, v32, v33, v71);
          --Length;
        }

        while (Length);
      }

LABEL_63:
      uint64_t v34 = ">";
      goto LABEL_64;
    }

    unsigned int v44 = 0;
    CFIndex v45 = 0LL;
    unsigned int v46 = 0;
LABEL_12:
    if (BytePtr[v45]) {
      BOOL v47 = v45 < Length;
    }
    else {
      BOOL v47 = 0;
    }
    if (!v47) {
      goto LABEL_37;
    }
    while (1)
    {
      uint64_t v48 = BytePtr[v45];
      if (BytePtr[v45] < 0)
      {
        if (__maskrune(BytePtr[v45], 0x40000uLL))
        {
LABEL_19:
          ++v44;
          goto LABEL_23;
        }
      }

      else if ((_DefaultRuneLocale.__runetype[v48] & 0x40000) != 0)
      {
        goto LABEL_19;
      }

      if ((char)v48 > -2)
      {
        if (BytePtr[v45]) {
          goto LABEL_37;
        }
        if (++v45 >= Length) {
          goto LABEL_37;
        }
        goto LABEL_12;
      }

      ++v46;
LABEL_23:
      if (Length == ++v45)
      {
        CFIndex v45 = Length;
        goto LABEL_37;
      }
    }
  }

  if (v10 == CFDictionaryGetTypeID())
  {
    char v83 = 1;
    sub_10000557C("{", v49, v50, v51, v52, v53, v54, v55, v79);
    CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)sub_100006A90, &v83);
    uint64_t v26 = "}";
    goto LABEL_3;
  }

  if (v10 != CFNumberGetTypeID())
  {
    if (v10 == CFSetGetTypeID())
    {
      sub_100006950((const __CFSet *)a1, v72, v73, v74, v75, v76, v77, v78);
      return;
    }

    if (v10 == CFStringGetTypeID())
    {
      sub_1000069A8(a1);
      return;
    }

    uint64_t v34 = "<unknown object>";
LABEL_64:
    sub_10000557C(v34, v27, v28, v29, v30, v31, v32, v33, a9);
    return;
  }

  if (CFNumberGetValue((CFNumberRef)a1, kCFNumberLongLongType, &valuePtr))
  {
    if (byte_10000C028) {
      uint64_t v63 = "0x%qx";
    }
    else {
      uint64_t v63 = "%qu";
    }
    sub_10000557C(v63, v56, v57, v58, v59, v60, v61, v62, valuePtr);
  }

uint64_t sub_100006950( const __CFSet *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char context = 1;
  sub_10000557C("[", a2, a3, a4, a5, a6, a7, a8, v17);
  CFSetApplyFunction(a1, (CFSetApplierFunction)sub_100006AE4, &context);
  return sub_10000557C("]", v9, v10, v11, v12, v13, v14, v15, v18);
}

void sub_1000069A8(const __CFString *a1)
{
  CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr)
  {
    sub_10000557C("%s", v3, v4, v5, v6, v7, v8, v9, (char)CStringPtr);
  }

  else
  {
    CFIndex v10 = CFStringGetLength(a1) + 1;
    uint64_t v11 = (char *)malloc(v10);
    if (v11)
    {
      uint64_t v12 = v11;
      if (CFStringGetCString(a1, v11, v10, 0x8000100u)) {
        sub_10000557C("%s", v13, v14, v15, v16, v17, v18, v19, (char)v12);
      }
      free(v12);
    }
  }

uint64_t sub_100006A54( uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*a2) {
    *a2 = 0;
  }
  else {
    sub_10000557C(",", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v10);
  }
  return sub_1000065A0(a1);
}

uint64_t sub_100006A90( uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*a3) {
    *a3 = 0;
  }
  else {
    sub_10000557C(",", a2, (uint64_t)a3, a4, a5, a6, a7, a8, v18);
  }
  sub_1000065A0(a1);
  sub_10000557C("=", v10, v11, v12, v13, v14, v15, v16, v18);
  return sub_1000065A0(a2);
}

uint64_t sub_100006AE4( uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*a2) {
    *a2 = 0;
  }
  else {
    sub_10000557C(",", (uint64_t)a2, a3, a4, a5, a6, a7, a8, v10);
  }
  return sub_1000065A0(a1);
}

uint64_t sub_100006B20( const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFTypeID v11 = CFGetTypeID(a1);
  if (v11 != CFDataGetTypeID())
  {
    fprintf(__stderrp, "ioreg: error: %s.\n", "invalid phys addr");
    exit(1);
  }

  CFIndex Length = CFDataGetLength((CFDataRef)a1);
  if (!Length) {
    return sub_1000055A4("<>", v13, v14, v15, v16, v17, v18, v19, a9);
  }
  unint64_t v20 = Length;
  BytePtr = CFDataGetBytePtr((CFDataRef)a1);
  uint64_t result = sub_1000055A4((char *)&unk_100007846, v22, v23, v24, v25, v26, v27, v28, v77);
  if (v20 >= 0x14)
  {
    uint64_t v37 = 0LL;
    do
    {
      unsigned int v38 = 0;
      uint64_t v39 = BytePtr;
      uint64_t v40 = &BytePtr[20 * v37];
      char v82 = BYTE2(*(_DWORD *)v40);
      char v83 = (&off_100008360)[((unint64_t)*(unsigned int *)v40 >> 24) & 3];
      uint64_t v41 = *(void *)(a2 + 8);
      unsigned int v42 = *(_DWORD *)(a2 + 4) + 1;
      do
      {
        if ((v41 & (1 << v38)) != 0) {
          uint64_t v43 = "| ";
        }
        else {
          uint64_t v43 = "  ";
        }
        sub_10000557C(v43, v30, v31, v32, v33, v34, v35, v36, v78);
        ++v38;
      }

      while (v38 <= v42);
      BytePtr = v39;
      sub_1000055A4("    %02lu: phys.hi: %08lx phys.mid: %08lx phys.lo: %08lx", v30, v31, v32, v33, v34, v35, v36, v37);
      unsigned int v51 = 0;
      uint64_t v52 = *(void *)(a2 + 8);
      unsigned int v53 = *(_DWORD *)(a2 + 4) + 1;
      do
      {
        if ((v52 & (1 << v51)) != 0) {
          uint64_t v54 = "| ";
        }
        else {
          uint64_t v54 = "  ";
        }
        sub_10000557C(v54, v44, v45, v46, v47, v48, v49, v50, v79);
        ++v51;
      }

      while (v51 <= v53);
      sub_1000055A4( "        size.hi: %08lx size.lo: %08lx",  v44,  v45,  v46,  v47,  v48,  v49,  v50,  *(_DWORD *)&v39[20 * v37 + 12]);
      unsigned int v62 = 0;
      uint64_t v63 = *(void *)(a2 + 8);
      unsigned int v64 = *(_DWORD *)(a2 + 4) + 1;
      do
      {
        if ((v63 & (1 << v62)) != 0) {
          uint64_t v65 = "| ";
        }
        else {
          uint64_t v65 = "  ";
        }
        sub_10000557C(v65, v55, v56, v57, v58, v59, v60, v61, v80);
        ++v62;
      }

      while (v62 <= v64);
      sub_1000055A4("        bus: %lu dev: %lu func: %lu reg: %lu", v55, v56, v57, v58, v59, v60, v61, v82);
      unsigned int v73 = 0;
      uint64_t v74 = *(void *)(a2 + 8);
      unsigned int v75 = *(_DWORD *)(a2 + 4) + 1;
      do
      {
        if ((v74 & (1 << v73)) != 0) {
          uint64_t v76 = "| ";
        }
        else {
          uint64_t v76 = "  ";
        }
        sub_10000557C(v76, v66, v67, v68, v69, v70, v71, v72, v81);
        ++v73;
      }

      while (v73 <= v75);
      uint64_t result = sub_1000055A4("        type: %s flags: %s%s%s", v66, v67, v68, v69, v70, v71, v72, (char)v83);
      ++v37;
    }

    while (v37 != v20 / 0x14);
  }

  return result;
}

uint64_t sub_100006E0C(io_registry_entry_t a1, CFStringRef key)
{
  int v2 = (const __CFData *)IORegistryEntrySearchCFProperty(a1, "IODeviceTree", key, kCFAllocatorDefault, 3u);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(unsigned int *)CFDataGetBytePtr(v2);
    CFRelease(v3);
  }

  else
  {
    fprintf(__stderrp, "ioreg: error: %s.\n", "unable to get properties");
    return 0LL;
  }

  return v4;
}

BOOL sub_100006E94(int a1, io_service_t *a2)
{
  *(_DWORD *)bytes = a1;
  keys = @"AAPL,phandle";
  uint64_t v9 = @"IOPropertyMatch";
  values = CFDataCreate(0LL, bytes, 4LL);
  CFTypeRef cf = CFDictionaryCreate( 0LL,  (const void **)&keys,  (const void **)&values,  1LL,  &kCFCopyStringDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  uint64_t v3 = CFDictionaryCreate( 0LL,  (const void **)&v9,  &cf,  1LL,  &kCFCopyStringDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  *a2 = MatchingService;
  BOOL v5 = MatchingService != 0;
  CFRelease(cf);
  CFRelease(values);
  return v5;
}

void *sub_100006F6C(io_registry_entry_t a1, io_string_t path)
{
  if (IORegistryEntryGetPath(a1, "IODeviceTree", path))
  {
    fprintf(__stderrp, "ioreg: error: %s.\n", "unable to get path");
    strcpy(path, "<path error");
  }

  uint64_t v3 = strchr(path, 58) + 1;
  size_t v4 = strlen(v3) + 1;
  return memmove(path, v3, v4);
}