uint64_t start(int a1, uint64_t a2)
{
  kern_return_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  int v11;
  unsigned __int8 v12;
  unsigned __int8 *v13;
  char *v14;
  kern_return_t CFProperties;
  const char *v16;
  const char *v17;
  int v18;
  int v19;
  uint64_t v20;
  size_t st_size;
  UInt8 *v22;
  UInt8 *v23;
  ssize_t v24;
  __CFReadStream *v25;
  __CFReadStream *v26;
  uint64_t v27;
  CFDictionaryRef v28;
  CFDictionaryRef v29;
  kern_return_t v30;
  CFDataRef Data;
  CFDataRef v32;
  const UInt8 *BytePtr;
  size_t Length;
  const char *v35;
  mach_error_t v36;
  FILE *v37;
  FILE *v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  mach_error_t v44;
  int v45;
  FILE *v46;
  FILE *v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t v50;
  __uint32_t v51;
  const char *v52;
  const char *v53;
  char *v54;
  CFStringRef v55;
  __CFString *v56;
  __CFData *MutableCopy;
  int v58;
  int v59;
  CFStringRef v60;
  __CFString *CFProperty;
  CFTypeID v62;
  size_t v63;
  CFIndex v64;
  CFIndex v65;
  uint64_t v66;
  size_t v67;
  CFTypeID v68;
  CFTypeID v69;
  CFIndex v70;
  size_t v71;
  size_t v72;
  const UInt8 *v73;
  CFTypeID v74;
  CFIndex v75;
  CFIndex MaximumSizeForEncoding;
  uint64_t CString;
  CFTypeID v78;
  CFTypeID TypeID;
  char *v80;
  char *v81;
  const char *v82;
  size_t v83;
  mach_error_t v84;
  uint64_t v85;
  uint64_t result;
  FILE *v87;
  char *v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  int v92;
  uint64_t v93;
  mach_port_t mainPort;
  stat properties[14];
  CFPropertyListFormat context[32];
  byte_100008000 = os_variant_allows_internal_security_policies(0LL);
  v4 = IOMainPort(bootstrap_port, &mainPort);
  if (v4) {
    sub_100003120(v4);
  }
  v5 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  v6 = &byte_100008000;
  dword_100008004 = v5;
  if (!(_DWORD)v5) {
    sub_100002F1C(v5);
  }
  dword_100008008 = IORegistryEntryFromPath(mainPort, "IOService:/options/options-system");
  dword_10000800C = dword_100008004;
  if (a1 >= 2)
  {
    v92 = 0;
    v93 = 0LL;
    v7 = a1;
    v8 = &byte_100008000;
    v89 = a1;
    v9 = 1LL;
    v90 = a2;
    v91 = a1;
    while (1)
    {
      v10 = *(char **)(a2 + 8 * v9);
      v11 = *v10;
      if (v11 == 45)
      {
        v13 = (unsigned __int8 *)(v10 + 1);
        v12 = v10[1];
        if (v12)
        {
          while (1)
          {
            switch(v12)
            {
              case 'b':
                if (a1 != 4) {
                  sub_1000020EC("missing arguments");
                }
                if (v9 + 1 >= v7 || (v14 = *(char **)(a2 + 8 * (v9 + 1)), *v14 == 45))
                {
                  ++v9;
                }

                else
                {
                  v9 += 2LL;
                  v46 = fopen(*(const char **)(a2 + 8 * v9), "r");
                  if (!v46) {
                    err(1, "Couldn't open binary file - '%s'");
                  }
                  v47 = v46;
                  v48 = getc(v46);
                  if ((_DWORD)v48 == -1) {
                    goto LABEL_200;
                  }
                  v49 = v48;
                  v50 = 0LL;
                  do
                  {
                    if (v50 >= 2048) {
                      sub_100002FF0(v48);
                    }
                    if (v49 > 0x7F) {
                      v51 = __maskrune(v49, 0x40000uLL);
                    }
                    else {
                      v51 = _DefaultRuneLocale.__runetype[v49] & 0x40000;
                    }
                    if (v49 == 37 || !v51) {
                      v50 += sprintf((char *)properties + v50, "%%%02x", v49);
                    }
                    else {
                      *((_BYTE *)&properties[0].st_dev + v50++) = v49;
                    }
                    v48 = getc(v47);
                    v49 = v48;
                  }

                  while ((_DWORD)v48 != -1);
                  if (v50 <= 0) {
LABEL_200:
                  }
                    sub_100002FD0();
                  *((_BYTE *)&properties[0].st_dev + v50) = 0;
                  v44 = sub_100002200(v14, (const char *)properties);
                  if (v44)
                  {
LABEL_176:
                    mach_error_string(v44);
                    errx(1, "Error setting variable - '%s': %s");
                  }

                  v7 = v91;
                }

                goto LABEL_95;
              case 'c':
                CFProperties = IORegistryEntryCreateCFProperties( dword_10000800C,  (CFMutableDictionaryRef *)properties,  0LL,  0);
                LODWORD(context[0]) = CFProperties;
                if (CFProperties) {
                  sub_100002FB0(CFProperties);
                }
                CFDictionaryApplyFunction( *(CFDictionaryRef *)&properties[0].st_dev,  (CFDictionaryApplierFunction)sub_100002DD8,  context);
                CFRelease(*(CFTypeRef *)&properties[0].st_dev);
                v93 = LODWORD(context[0]);
                goto LABEL_95;
              case 'd':
                if (++v9 >= v7) {
                  goto LABEL_175;
                }
                v16 = *(const char **)(a2 + 8 * v9);
                if (*v16 == 45) {
                  goto LABEL_175;
                }
                sub_100002200("IONVRAM-DELETE-PROPERTY", v16);
                goto LABEL_95;
              case 'e':
              case 'g':
              case 'i':
              case 'j':
              case 'k':
              case 'l':
              case 'm':
              case 'n':
              case 'o':
              case 'q':
              case 't':
              case 'u':
              case 'v':
              case 'w':
              case 'y':
                goto LABEL_178;
              case 'f':
                if (v8[17] == 1)
                {
                  context[0] = kCFPropertyListBinaryFormat_v1_0;
                  v18 = open(v17, 256, 0x8000LL);
                  if (v18 == -1) {
                    sub_100003010();
                  }
                  v19 = v18;
                  v20 = fstat(v18, properties);
                  if ((_DWORD)v20 == -1) {
                    sub_100003038();
                  }
                  st_size = properties[0].st_size;
                  v22 = (UInt8 *)malloc(properties[0].st_size);
                  if (!v22) {
                    sub_100003074(0LL);
                  }
                  v23 = v22;
                  v24 = read(v19, v22, st_size);
                  if (v24 != properties[0].st_size) {
                    sub_1000030C4();
                  }
                  close(v19);
                  v25 = CFReadStreamCreateWithBytesNoCopy( kCFAllocatorDefault,  v23,  properties[0].st_size,  kCFAllocatorNull);
                  if (!v25) {
                    sub_100003088(0LL);
                  }
                  v26 = v25;
                  v27 = CFReadStreamOpen(v25);
                  if (!(_DWORD)v27) {
                    sub_10000309C(v27);
                  }
                  v28 = (const __CFDictionary *)CFPropertyListCreateWithStream( kCFAllocatorDefault,  v26,  properties[0].st_size,  0LL,  context,  0LL);
                  if (!v28) {
                    sub_1000030B0(0LL);
                  }
                  v29 = v28;
                  CFReadStreamClose(v26);
                  CFRelease(v26);
                  free(v23);
                  CFDictionaryApplyFunction(v29, (CFDictionaryApplierFunction)sub_10000267C, 0LL);
                  CFRelease(v29);
                }

                else
                {
                  v37 = fopen(*(const char **)(a2 + 8 * v9), "r");
                  if (!v37) {
                    err(1, "Couldn't open patch file - '%s'");
                  }
                  v38 = v37;
                  v39 = getc(v37);
                  if ((_DWORD)v39 != -1)
                  {
                    v40 = v39;
                    v41 = 0LL;
                    v42 = 0LL;
                    v43 = 0LL;
                    while (2)
                    {
                      if (v42 == 255) {
                        sub_1000030EC(v39);
                      }
                      if (v43 == 2047) {
                        sub_100002FF0(v39);
                      }
                      switch(v41)
                      {
                        case 0LL:
                          if (v40 == 10)
                          {
                            v42 = 0LL;
                            v43 = 0LL;
                            goto LABEL_56;
                          }

                          if (v40 == 35)
                          {
                            v42 = 0LL;
                            v43 = 0LL;
                            v41 = 1LL;
                            goto LABEL_87;
                          }

                          if (v40 > 0x7F)
                          {
                            if (__maskrune(v40, 0x4000uLL))
                            {
LABEL_82:
                              v42 = 0LL;
                              v43 = 0LL;
                              goto LABEL_84;
                            }
                          }

                          else if ((_DefaultRuneLocale.__runetype[v40] & 0x4000) != 0)
                          {
                            goto LABEL_82;
                          }

                          v43 = 0LL;
                          LOBYTE(context[0]) = v40;
                          v42 = 1LL;
LABEL_86:
                          v41 = 3LL;
LABEL_87:
                          v39 = getc(v38);
                          v40 = v39;
                          if ((_DWORD)v39 != -1) {
                            continue;
                          }
                          v7 = v91;
                          if (v41) {
                            sub_10000310C(v39);
                          }
                          return result;
                        case 1LL:
                          v41 = v40 != 10;
                          goto LABEL_87;
                        case 2LL:
                          if (v40 == 10) {
                            goto LABEL_56;
                          }
                          if (v40 > 0x7F)
                          {
                            if (!__maskrune(v40, 0x4000uLL)) {
                              goto LABEL_85;
                            }
                          }

                          else if ((_DefaultRuneLocale.__runetype[v40] & 0x4000) == 0)
                          {
                            goto LABEL_85;
                          }

LABEL_84:
                          v41 = 2LL;
                          goto LABEL_87;
                        case 3LL:
                          if (v40 == 10)
                          {
                            *((_BYTE *)context + v42) = 0;
                            warnx("Name must be followed by white space - '%s'", (const char *)context);
LABEL_56:
                            v41 = 0LL;
                            goto LABEL_87;
                          }

                          if (v40 > 0x7F)
                          {
                            if (__maskrune(v40, 0x4000uLL))
                            {
LABEL_78:
                              v41 = 4LL;
                              goto LABEL_87;
                            }
                          }

                          else if ((_DefaultRuneLocale.__runetype[v40] & 0x4000) != 0)
                          {
                            goto LABEL_78;
                          }

LABEL_85:
                          *((_BYTE *)context + v42++) = v40;
                          goto LABEL_86;
                        case 4LL:
                        case 6LL:
                          if (v40 == 10) {
                            goto LABEL_55;
                          }
                          if (v40 > 0x7F)
                          {
                            if (__maskrune(v40, 0x4000uLL)) {
                              goto LABEL_87;
                            }
                          }

                          else if ((_DefaultRuneLocale.__runetype[v40] & 0x4000) != 0)
                          {
                            goto LABEL_87;
                          }

LABEL_76:
                          *((_BYTE *)&properties[0].st_dev + v43++) = v40;
                          v41 = 5LL;
                          goto LABEL_87;
                        case 5LL:
                          if (v40 != 10) {
                            goto LABEL_76;
                          }
                          if (*((_BYTE *)properties + v43 - 1) == 92)
                          {
                            *((_BYTE *)properties + v43 - 1) = 13;
                            v41 = 6LL;
                            goto LABEL_87;
                          }

LABEL_55:
                          *((_BYTE *)context + v42) = 0;
                          *((_BYTE *)&properties[0].st_dev + v43) = 0;
                          v44 = sub_100002200((char *)context, (const char *)properties);
                          if (v44) {
                            goto LABEL_176;
                          }
                          goto LABEL_56;
                        case 7LL:
                          goto LABEL_55;
                        default:
                          goto LABEL_87;
                      }
                    }
                  }
                }

                v8 = &byte_100008000;
                goto LABEL_95;
              case 'h':
                sub_1000020EC((const char *)&unk_1000035FF);
              case 'p':
                v30 = IORegistryEntryCreateCFProperties(dword_10000800C, (CFMutableDictionaryRef *)properties, 0LL, 0);
                if (v30) {
                  sub_100002FB0(v30);
                }
                if (v8[17] == 1)
                {
                  Data = CFPropertyListCreateData( kCFAllocatorDefault,  *(CFPropertyListRef *)&properties[0].st_dev,  kCFPropertyListXMLFormat_v1_0,  0LL,  0LL);
                  if (!Data) {
                    sub_100002F9C(0LL);
                  }
                  v32 = Data;
                  BytePtr = CFDataGetBytePtr(Data);
                  Length = CFDataGetLength(v32);
                  fwrite(BytePtr, 1uLL, Length, __stdoutp);
                  CFRelease(v32);
                  v7 = v91;
                }

                else
                {
                  CFDictionaryApplyFunction( *(CFDictionaryRef *)&properties[0].st_dev,  (CFDictionaryApplierFunction)sub_100002900,  0LL);
                }

                CFRelease(*(CFTypeRef *)&properties[0].st_dev);
                goto LABEL_95;
              case 'r':
                if (++v9 >= v7 || (v35 = *(const char **)(a2 + 8 * v9), *v35 == 45)) {
LABEL_175:
                }
                  sub_1000020EC("missing name");
                v36 = sub_100002200("IONVRAM-DELETEWRET-PROPERTY", v35);
                if (v36)
                {
                  mach_error_string(v36);
                  errx(1, "Error deleting variable - '%s': %s (0x%08x)");
                }

                v93 = 0LL;
                goto LABEL_95;
              case 's':
                byte_100008012 = 1;
                goto LABEL_95;
              case 'x':
                if (byte_100008010 == 1)
                {
                  v85 = 1LL;
                  fwrite("-x not supported with -X hex mode.\n", 0x23uLL, 1uLL, __stderrp);
                  return v85;
                }

                v8[17] = 1;
LABEL_95:
                v45 = *++v13;
                v12 = v45;
                if (!v45) {
                  goto LABEL_160;
                }
                break;
              case 'z':
                if (!byte_100008000) {
                  sub_1000020EC("unsupported option -z");
                }
                if (dword_100008008)
                {
                  fwrite("Selecting options-system node.\n", 0x1FuLL, 1uLL, __stderrp);
                  dword_10000800C = dword_100008008;
                }

                else
                {
                  fwrite("No options-system node, using options.\n", 0x27uLL, 1uLL, __stderrp);
                }

                goto LABEL_95;
              default:
                if (v12 != 88)
                {
LABEL_178:
                  strcpy((char *)properties, "no such option as --");
                  *((_BYTE *)properties + strlen((const char *)properties) - 1) = v12;
                  sub_1000020EC((const char *)properties);
                }

                if (v8[17] == 1)
                {
                  fwrite("-X hex mode not supported with -x XMLmode.\n", 0x2BuLL, 1uLL, __stderrp);
                  return 1LL;
                }

                byte_100008010 = 1;
                goto LABEL_95;
            }
          }
        }
      }

      v52 = v10 + 1;
      ++v92;
      while (v11 <= 44)
      {
        if (v11 != 43)
        {
          if (!v11)
          {
            v58 = 0;
            v59 = 0;
            v53 = v52 - 1;
            goto LABEL_127;
          }

          goto LABEL_123;
        }

        v11 = *(unsigned __int8 *)v52;
        if (v11 == 61)
        {
          v58 = 0;
          v59 = 1;
          goto LABEL_126;
        }

LABEL_124:
        ++v52;
      }

      if (v11 != 45) {
        break;
      }
      v11 = *(unsigned __int8 *)v52;
      if (v11 != 61) {
        goto LABEL_124;
      }
      v59 = 0;
      v58 = 1;
LABEL_126:
      *(_WORD *)(v52 - 1) = 0;
      v53 = v52 + 1;
LABEL_127:
      v60 = CFStringCreateWithCString(kCFAllocatorDefault, v10, 0x8000100u);
      if (!v60) {
        errx(1, "Error creating CFString for key %s");
      }
      v56 = (__CFString *)v60;
      CFProperty = (__CFString *)IORegistryEntryCreateCFProperty(dword_10000800C, v60, 0LL, 0);
      if (!CFProperty) {
        sub_100002F30();
      }
      v55 = CFProperty;
      if (!v59)
      {
        if (!v58)
        {
          sub_100002900(v56, CFProperty);
          MutableCopy = 0LL;
          v54 = 0LL;
          a1 = v89;
          v7 = v91;
          goto LABEL_152;
        }

        MutableCopy = 0LL;
        v54 = 0LL;
LABEL_139:
        v74 = CFGetTypeID(v55);
        if (v74 == CFStringGetTypeID())
        {
          v75 = CFStringGetLength(v55);
          MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(v75, 0x8000100u);
          CString = (uint64_t)calloc(MaximumSizeForEncoding + 1, 1uLL);
          if (!CString
            || (v52 = (const char *)CString,
                CString = CFStringGetCString(v55, (char *)CString, MaximumSizeForEncoding, 0x8000100u),
                v54 = (char *)v52,
                !(_DWORD)CString))
          {
            sub_100002F74(CString);
          }
        }

        else
        {
          v78 = CFGetTypeID(v55);
          TypeID = CFDataGetTypeID();
          if (v78 != TypeID) {
            sub_100002F88(TypeID);
          }
          v52 = (const char *)CFDataGetBytePtr((CFDataRef)v55);
        }

        v80 = strstr(v52, v53);
        if (!v80) {
          errx(1, "substring %s not found in %s\n");
        }
        v81 = v80;
        v82 = &v80[strlen(v53)];
        v83 = strlen(v82);
        memmove(v81, v82, v83 + 1);
        goto LABEL_149;
      }

      v62 = CFGetTypeID(CFProperty);
      if (v62 != CFStringGetTypeID())
      {
        v68 = CFGetTypeID(v55);
        v69 = CFDataGetTypeID();
        if (v68 != v69) {
          sub_100002F88(v69);
        }
        v70 = CFDataGetLength((CFDataRef)v55);
        v71 = strlen(v53);
        MutableCopy = CFDataCreateMutableCopy(kCFAllocatorDefault, v70 + v71 + 1, (CFDataRef)v55);
        v72 = strlen(v53);
        CFDataAppendBytes(MutableCopy, (const UInt8 *)v53, v72 + 1);
        v73 = CFDataGetBytePtr(MutableCopy);
        v54 = 0LL;
        if ((v58 & 1) == 0)
        {
          v52 = (const char *)v73;
          goto LABEL_149;
        }

        goto LABEL_139;
      }

      v63 = strlen(v53);
      v64 = CFStringGetLength(v55);
      v65 = CFStringGetMaximumSizeForEncoding(v64, 0x8000100u) + v63;
      v66 = (uint64_t)calloc(v65 + 1, 1uLL);
      v67 = strlen(v54);
      strcpy(&v54[v67], v53);
      MutableCopy = 0LL;
      if ((v58 & 1) != 0) {
        goto LABEL_139;
      }
      v52 = v54;
LABEL_149:
      a1 = v89;
      v7 = v91;
LABEL_150:
      v84 = sub_100002200(v10, v52);
      sub_1000021D4();
      if (v84)
      {
        v87 = __stderrp;
        v88 = mach_error_string(v84);
        fprintf(v87, "Error setting variable - '%s': %s.\n", v10, v88);
        if (v84 == -536870211) {
          sub_100002738();
        }
        exit(1);
      }

      if (v56) {
LABEL_152:
      }
        CFRelease(v56);
      if (v55) {
        CFRelease(v55);
      }
      if (v54) {
        free(v54);
      }
      a2 = v90;
      if (MutableCopy) {
        CFRelease(MutableCopy);
      }
      v8 = &byte_100008000;
LABEL_160:
      if (++v9 >= v7)
      {
        v6 = &byte_100008000;
        v85 = v93;
        if (!v92) {
          goto LABEL_164;
        }
        goto LABEL_166;
      }
    }

    if (v11 == 61)
    {
      v54 = 0LL;
      v55 = 0LL;
      v56 = 0LL;
      MutableCopy = 0LL;
      *((_BYTE *)v52 - 1) = 0;
      goto LABEL_150;
    }

LABEL_123:
    v11 = *(unsigned __int8 *)v52;
    goto LABEL_124;
  }

  v85 = 0LL;
LABEL_164:
  if (byte_100008012 == 1) {
    sub_1000021D4();
  }
LABEL_166:
  if (a1 == 1) {
    sub_1000020EC("no arguments specified");
  }
  IOObjectRelease(*((_DWORD *)v6 + 1));
  if (dword_100008008) {
    IOObjectRelease(dword_100008008);
  }
  return v85;
}

void sub_1000020EC(const char *a1)
{
  puts("nvram [-x|-X] [-p] [-f filename] [-d name] [-c] name[=value] ...");
  puts("\t-x         use XML format for printing or reading variables");
  puts("\t           (must appear before -p or -f)");
  puts("\t-X         use HEX format for printing or reading variables");
  puts("\t           (must appear before -p or -f)");
  puts("\t-p         print all firmware variables");
  puts("\t-f         set firmware variables from a text file");
  puts("\t-d         delete the named variable(does not return error code)");
  puts("\t-r         delete the named variable(returns error code if any)");
  puts("\t-c         delete all variables");
  puts( "\t-b         set variable using binary file. invoked with the following format: nvram -b <variable name> <binary file>");
  if (byte_100008000) {
    puts("\t-z         use system-options node if available (internal builds only)");
  }
  puts("\tname=value set named variable");
  puts("\tname       print variable");
  puts("Note that arguments and options are executed in order.");
  exit(1);
}

uint64_t sub_1000021D4()
{
  if ((byte_100008012 & 1) != 0) {
    return sub_100002200("IONVRAM-FORCESYNCNOW-PROPERTY", "IONVRAM-FORCESYNCNOW-PROPERTY");
  }
  else {
    return sub_100002200("IONVRAM-SYNCNOW-PROPERTY", "IONVRAM-SYNCNOW-PROPERTY");
  }
}

uint64_t sub_100002200(char *cStr, const char *a2)
{
  v4 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  if (!v4) {
    errx(1, "Error creating CFString for key %s");
  }
  v5 = v4;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(dword_10000800C, v4, 0LL, 0);
  if (CFProperty)
  {
    v7 = CFProperty;
    CFTypeID v8 = CFGetTypeID(CFProperty);
    CFRelease(v7);
    CFDataRef v9 = sub_1000023DC(v8, a2);
    if (!v9) {
      errx(1, "Error creating CFTypeRef for value %s");
    }
LABEL_4:
    uint64_t v10 = IORegistryEntrySetCFProperty(dword_10000800C, v5, v9);
    goto LABEL_5;
  }

  if (!strncmp(cStr, "IONVRAM-DELETEWRET-PROPERTY", 0x1BuLL) || !strncmp(cStr, "IONVRAM-DELETE-PROPERTY", 0x17uLL))
  {
    CFTypeID TypeID = CFStringGetTypeID();
    CFDataRef v9 = sub_1000023DC(TypeID, a2);
    if (!v9)
    {
      uint64_t v10 = 0LL;
      goto LABEL_5;
    }

    goto LABEL_4;
  }

  v18[0] = CFDataGetTypeID();
  v18[1] = CFStringGetTypeID();
  v18[2] = CFNumberGetTypeID();
  uint64_t v12 = 0LL;
  uint64_t v10 = 0LL;
  v18[3] = CFBooleanGetTypeID();
  do
  {
    CFDataRef v13 = sub_1000023DC(v18[v12], a2);
    if (v13)
    {
      uint64_t v14 = IORegistryEntrySetCFProperty(dword_10000800C, v5, v13);
      uint64_t v10 = v14;
      BOOL v15 = (_DWORD)v14 == -536870211 || (_DWORD)v14 == -536870181;
      if (v15 || (_DWORD)v14 == 0) {
        break;
      }
    }

    ++v12;
  }

  while (v12 != 4);
LABEL_5:
  CFRelease(v5);
  return v10;
}

CFDataRef sub_1000023DC(uint64_t a1, const char *a2)
{
  if (CFBooleanGetTypeID() == a1)
  {
    if (!strcmp("true", a2))
    {
      return kCFBooleanTrue;
    }

    else if (!strcmp("false", a2))
    {
      return kCFBooleanFalse;
    }

    else
    {
      return 0LL;
    }
  }

  else if (CFNumberGetTypeID() == a1)
  {
    uint64_t valuePtr = strtol(a2, 0LL, 0);
    return CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  }

  else if (CFStringGetTypeID() == a1)
  {
    return (CFDataRef)CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  }

  else if (CFDataGetTypeID() == a1)
  {
    int64_t v5 = strlen(a2);
    uint64_t v6 = __chkstk_darwin();
    v7 = (const UInt8 *)&valuePtr - ((v6 + 16) & 0xFFFFFFFFFFFFFFF0LL);
    if (v6 < 1)
    {
      CFIndex v9 = 0LL;
    }

    else
    {
      uint64_t v8 = 0LL;
      CFIndex v9 = 0LL;
      do
      {
        int v10 = a2[v8];
        if (v10 == 37)
        {
          uint64_t v11 = v8 + 2;
          if (v8 + 2 > v5) {
            return 0LL;
          }
          uint64_t v12 = v8 + 1;
          __darwin_ct_rune_t v13 = a2[v8 + 1];
          if (v13 < 0)
          {
            if (!__maskrune(v13, 0x10000uLL)) {
              return 0LL;
            }
          }

          else if ((_DefaultRuneLocale.__runetype[v13] & 0x10000) == 0)
          {
            return 0LL;
          }

          __darwin_ct_rune_t v14 = a2[v11];
          if (v14 < 0)
          {
            if (!__maskrune(v14, 0x10000uLL)) {
              return 0LL;
            }
          }

          else if ((_DefaultRuneLocale.__runetype[v14] & 0x10000) == 0)
          {
            return 0LL;
          }

          unsigned int v15 = __toupper(a2[v12]) - 48;
          __darwin_ct_rune_t v16 = __toupper(a2[v11]);
          unsigned int v17 = v16 - 48;
          char v18 = 16 * v15;
          if (v15 > 9) {
            char v18 = 16 * v15 - 112;
          }
          if (v17 > 9) {
            LOBYTE(v17) = v16 - 55;
          }
          LOBYTE(v10) = v17 + v18;
        }

        else
        {
          uint64_t v11 = v8;
        }

        v7[v9] = v10;
        uint64_t v8 = v11 + 1;
        ++v9;
      }

      while (v11 + 1 < v5);
    }

    return CFDataCreate(kCFAllocatorDefault, v7, v9);
  }

  else
  {
    return 0LL;
  }
}

uint64_t sub_10000267C(CFStringRef propertyName, CFTypeRef property)
{
  uint64_t result = IORegistryEntrySetCFProperty(dword_10000800C, propertyName, property);
  if ((_DWORD)result)
  {
    mach_error_t error_value = result;
    CFIndex Length = CFStringGetLength(propertyName);
    CFIndex v5 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    uint64_t v6 = (char *)malloc(v5);
    if (!v6 || (v7 = v6, !CFStringGetCString(propertyName, v6, v5, 0x8000100u)))
    {
      warnx("Unable to convert property name to C string");
      v7 = "<UNPRINTABLE>";
    }

    uint64_t v8 = mach_error_string(error_value);
    errx(1, "Error setting variable - '%s': %s", v7, v8);
  }

  return result;
}

void sub_100002738()
{
  kern_return_t v0;
  int64_t Count;
  const void **v2;
  const void **v3;
  const void **v4;
  const void **v5;
  void *v6;
  void *v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  FILE *v14;
  const char *CStringPtr;
  void __compar[5];
  CFMutableDictionaryRef properties;
  v0 = IORegistryEntryCreateCFProperties(dword_100008004, &properties, 0LL, 0);
  if (v0) {
    sub_100002FB0(v0);
  }
  Count = CFDictionaryGetCount(properties);
  v2 = (const void **)calloc(Count, 8uLL);
  if (!v2) {
    sub_100003140();
  }
  v3 = v2;
  v4 = (const void **)calloc(Count, 8uLL);
  if (!v4) {
    sub_100003140();
  }
  CFIndex v5 = v4;
  uint64_t v6 = calloc(Count, 8uLL);
  if (!v6) {
    sub_100003140();
  }
  v7 = v6;
  if (Count)
  {
    for (i = 0LL; i != Count; ++i)
      *((void *)v6 + i) = i;
  }

  CFDictionaryGetKeysAndValues(properties, v3, v5);
  __compar[0] = _NSConcreteStackBlock;
  __compar[1] = 0x40000000LL;
  __compar[2] = sub_100002D1C;
  __compar[3] = &unk_1000042A0;
  __compar[4] = v5;
  qsort_b(v7, Count, 8uLL, __compar);
  fwrite("key\tbytes\n", 0xAuLL, 1uLL, __stderrp);
  CFIndex v9 = Count - 1;
  if (Count >= 1)
  {
    if (v9 >= 4) {
      CFIndex v9 = 4LL;
    }
    int v10 = v9 + 1;
    uint64_t v11 = v7;
    do
    {
      uint64_t v12 = sub_100002D6C((const __CFString *)v5[*v11]);
      if (v12)
      {
        __darwin_ct_rune_t v13 = v12;
        __darwin_ct_rune_t v14 = __stderrp;
        CStringPtr = CFStringGetCStringPtr((CFStringRef)v3[*v11], 0x8000100u);
        fprintf(v14, "%s\t%zu\n", CStringPtr, v13);
      }

      ++v11;
      --v10;
    }

    while (v10);
  }

  free(v3);
  free(v5);
  free(v7);
  CFRelease(properties);
}

void sub_100002900(__CFString *a1, __CFString *a2)
{
  values = a2;
  keys = a1;
  if (byte_100008011 == 1)
  {
    CFDictionaryRef v2 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&keys,  (const void **)&values,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    if (!v2) {
      sub_100003154(0LL);
    }
    CFDictionaryRef v3 = v2;
    Data = CFPropertyListCreateData(kCFAllocatorDefault, v2, kCFPropertyListXMLFormat_v1_0, 0LL, 0LL);
    if (!Data) {
      sub_100003168(0LL);
    }
    CFIndex v5 = Data;
    BytePtr = CFDataGetBytePtr(Data);
    size_t Length = CFDataGetLength(v5);
    fwrite(BytePtr, 1uLL, Length, __stdoutp);
    CFRelease(v3);
    CFRelease(v5);
    return;
  }

  CFIndex v10 = CFStringGetLength(a1);
  CFIndex v11 = CFStringGetMaximumSizeForEncoding(v10, 0x8000100u) + 1;
  uint64_t v12 = (char *)malloc(v11);
  if (!v12 || (__darwin_ct_rune_t v13 = v12, !CFStringGetCString(a1, v12, v11, 0x8000100u)))
  {
    warnx("Unable to convert property name to C string");
    __darwin_ct_rune_t v13 = "<UNPRINTABLE>";
  }

  CFTypeID v14 = CFGetTypeID(a2);
  if (v14 == CFBooleanGetTypeID())
  {
    unsigned int v15 = 0LL;
    if (CFBooleanGetValue((CFBooleanRef)a2)) {
      __darwin_ct_rune_t v16 = "true";
    }
    else {
      __darwin_ct_rune_t v16 = "false";
    }
    goto LABEL_33;
  }

  if (v14 == CFNumberGetTypeID())
  {
    CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt32Type, &valuePtr);
    if (valuePtr == -1)
    {
      unsigned int v17 = "-1";
    }

    else
    {
      if (valuePtr > 0x3E7 || (byte_100008010 & 1) != 0) {
        unsigned int v17 = "0x%x";
      }
      else {
        unsigned int v17 = "%d";
      }
      uint64_t v30 = valuePtr;
    }

    __darwin_ct_rune_t v16 = v34;
    __sprintf_chk(v34, 0, 0xAuLL, v17, v30);
    unsigned int v15 = 0LL;
    goto LABEL_33;
  }

  if (v14 == CFStringGetTypeID())
  {
    CFIndex v18 = CFStringGetLength(a2);
    CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(v18, 0x8000100u);
    unsigned int v15 = (char *)malloc(MaximumSizeForEncoding + 2);
    if (v15 && CFStringGetCString(a2, v15, MaximumSizeForEncoding + 1, 0x8000100u))
    {
      __darwin_ct_rune_t v16 = v15;
    }

    else
    {
      warnx("Unable to convert value to C string");
      __darwin_ct_rune_t v16 = "<UNPRINTABLE>";
    }

    goto LABEL_33;
  }

  if (v14 != CFDataGetTypeID())
  {
    unsigned int v15 = 0LL;
    __darwin_ct_rune_t v16 = "<INVALID>";
LABEL_33:
    printf("%s\t%s\n", v13, v16);
LABEL_34:
    if (!v12) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }

  CFIndex v20 = CFDataGetLength((CFDataRef)a2);
  if (!v20)
  {
    unsigned int v15 = 0LL;
    __darwin_ct_rune_t v16 = (char *)&unk_1000035FF;
    goto LABEL_33;
  }

  uint64_t v21 = v20;
  unsigned int v15 = (char *)malloc(3 * v20 + 3);
  if (!v15) {
    goto LABEL_34;
  }
  v22 = CFDataGetBytePtr((CFDataRef)a2);
  if (byte_100008010 == 1)
  {
    strcpy(v15, "0x");
    uint64_t v23 = 2LL;
  }

  else
  {
    uint64_t v23 = 0LL;
  }

  if (v21 >= 1)
  {
    while (1)
    {
      unsigned int v25 = *v22++;
      uint64_t v24 = v25;
      if (byte_100008010 == 1) {
        break;
      }
      else {
        __uint32_t v27 = _DefaultRuneLocale.__runetype[v24] & 0x40000;
      }
      v28 = &v15[v23];
      if (!v27 || (char)v24 == 37)
      {
        int v26 = sprintf(v28, "%%%02x");
        goto LABEL_50;
      }

      char *v28 = v24;
      uint64_t v29 = 1LL;
LABEL_51:
      v23 += v29;
      if (!--v21) {
        goto LABEL_52;
      }
    }

    int v26 = sprintf(&v15[v23], "%02x");
LABEL_50:
    uint64_t v29 = v26;
    goto LABEL_51;
  }

LABEL_52:
  v15[v23] = 0;
  printf("%s\t%s\n", v13, v15);
  free(v15);
  unsigned int v15 = 0LL;
  if (v12) {
LABEL_35:
  }
    free(v12);
LABEL_36:
  if (v15) {
    free(v15);
  }
}

uint64_t sub_100002D1C(uint64_t a1, void *a2, void *a3)
{
  int v5 = sub_100002D6C(*(const __CFString **)(*(void *)(a1 + 32) + 8LL * *a3));
  return v5 - sub_100002D6C(*(const __CFString **)(*(void *)(a1 + 32) + 8LL * *a2));
}

uint64_t sub_100002D6C(const __CFString *a1)
{
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 == CFStringGetTypeID()) {
    return CFStringGetLength(a1);
  }
  if (v2 == CFDataGetTypeID()) {
    return CFDataGetLength((CFDataRef)a1);
  }
  return 8LL * (v2 == CFNumberGetTypeID());
}

void sub_100002DD8(const __CFString *property, uint64_t a2, mach_error_t *a3)
{
  kern_return_t v5;
  mach_error_t v6;
  CFTypeID v7;
  const char *CStringPtr;
  CFIndex Length;
  CFIndex v10;
  char *v11;
  const char *v12;
  char *v13;
  int v5 = IORegistryEntrySetCFProperty(dword_10000800C, @"IONVRAM-DELETE-PROPERTY", property);
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = CFGetTypeID(property);
    if (v7 != CFStringGetTypeID()) {
      sub_10000317C();
    }
    CStringPtr = CFStringGetCStringPtr(property, 0x8000100u);
    if (CStringPtr)
    {
      uint64_t v12 = CStringPtr;
      CFIndex v11 = 0LL;
    }

    else
    {
      size_t Length = CFStringGetLength(property);
      CFIndex v10 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
      CFIndex v11 = (char *)malloc(v10);
      if (v11 && CFStringGetCString(property, v11, v10, 0x8000100u))
      {
        uint64_t v12 = v11;
      }

      else
      {
        warnx("Unable to convert property name to C string");
        uint64_t v12 = "<UNPRINTABLE>";
      }
    }

    __darwin_ct_rune_t v13 = mach_error_string(v6);
    warnx("Error clearing firmware variable %s: %s", v12, v13);
    if (v11) {
      free(v11);
    }
    if (a3) {
      *a3 = v6;
    }
  }

void sub_100002EFC(uint64_t a1, const char *a2)
{
}

uint64_t sub_100002F04()
{
  return _os_assert_log(0LL);
}

int *sub_100002F0C()
{
  return __error();
}

char *sub_100002F14(int *a1)
{
  return strerror(*a1);
}

void sub_100002F1C(uint64_t a1)
{
}

void sub_100002F30()
{
  v0 = mach_error_string(-536870160);
  sub_100002EFC((uint64_t)v0, "Error getting variable - '%s': %s");
}

void sub_100002F60(uint64_t a1)
{
}

void sub_100002F74(uint64_t a1)
{
}

void sub_100002F88(uint64_t a1)
{
}

void sub_100002F9C(uint64_t a1)
{
}

void sub_100002FB0(mach_error_t a1)
{
  v1 = mach_error_string(a1);
  sub_100002EFC((uint64_t)v1, "Error getting the firmware variables: %s");
}

void sub_100002FD0()
{
}

void sub_100002FF0(uint64_t a1)
{
}

void sub_100003010()
{
  v0 = sub_100002F0C();
  v1 = sub_100002F14(v0);
  sub_100002EFC((uint64_t)v1, "Could not open %s: %s");
}

void sub_100003038()
{
  v0 = sub_100002F0C();
  v1 = sub_100002F14(v0);
  sub_100002EFC((uint64_t)v1, "Could not fstat %s: %s");
}

void sub_100003060(uint64_t a1)
{
}

void sub_100003074(uint64_t a1)
{
}

void sub_100003088(uint64_t a1)
{
}

void sub_10000309C(uint64_t a1)
{
}

void sub_1000030B0(uint64_t a1)
{
}

void sub_1000030C4()
{
  v0 = sub_100002F0C();
  v1 = sub_100002F14(v0);
  sub_100002EFC((uint64_t)v1, "Could not read %s: %s");
}

void sub_1000030EC(uint64_t a1)
{
}

void sub_10000310C(uint64_t a1)
{
}

void sub_100003120(mach_error_t a1)
{
  v1 = mach_error_string(a1);
  sub_100002EFC((uint64_t)v1, "Error getting the IOMainPort: %s");
}

void sub_100003140()
{
  uint64_t v0 = sub_100002F04();
  _os_crash(v0);
  __break(1u);
}

void sub_100003154(uint64_t a1)
{
}

void sub_100003168(uint64_t a1)
{
}

void sub_10000317C()
{
  __assert_rtn("ClearOFVariable", "nvram.c", 1158, "CFGetTypeID(key) == CFStringGetTypeID()");
}