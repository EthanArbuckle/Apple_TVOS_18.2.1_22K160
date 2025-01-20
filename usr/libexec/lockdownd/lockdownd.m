void sub_100002D80( const __CFData *a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  if (a2)
  {
    CFRelease(a2);
  }

  else
  {
    sub_1000188F8(0, "send_response", @"No response to send", a4, a5, a6, a7, a8, a9);
  }
}

void sub_100002DEC(const __CFDictionary *a1)
{
  if (sub_10000EFD8(a1))
  {
    Value = CFDictionaryGetValue(a1, @"Error");
    v3 = sub_10000F040(Value);
    if (v3)
    {
      v4 = v3;
      v5 = (CFTypeRef *)off_100176138[0];
      if (!off_100176138[0]) {
        goto LABEL_9;
      }
      v6 = off_100176140;
      while (!CFEqual(v4, *v5))
      {
        v7 = (CFTypeRef *)*v6++;
        v5 = v7;
        if (!v7) {
          goto LABEL_9;
        }
      }

      if (!*(v6 - 1))
      {
LABEL_9:
        int v8 = CFEqual(v4, @"ServiceProhibited");
        v9 = off_10014B520;
        if (v8) {
          v9 = off_10014B5C8;
        }
        if (*v9) {
          CFDictionarySetValue(a1, @"Error", *v9);
        }
      }
    }
  }

__CFDictionary *sub_100002EBC(const void *a1)
{
  v2 = sub_100023A08();
  int v8 = v2;
  if (v2) {
    CFDictionarySetValue(v2, @"Request", a1);
  }
  else {
    sub_1000188F8(0, "create_response", @"Could not create response dict", v3, v4, v5, v6, v7, v10);
  }
  return v8;
}

void sub_100002F14(int a1, uint64_t a2, CFMutableDictionaryRef theDict, void *value)
{
  if (a1)
  {
    if (a2) {
      LOBYTE(v6) = a2;
    }
    else {
      uint64_t v6 = " ";
    }
    sub_10000F040(value);
    sub_1000188F8(0, "set_response_error", @"%s %@", v7, v8, v9, v10, v11, (char)v6);
  }

  CFDictionarySetValue(theDict, @"Error", value);
}

CFTypeRef sub_100002F9C(const void *a1)
{
  v2 = CFWriteStreamCreateWithAllocatedBuffers(kCFAllocatorDefault, kCFAllocatorDefault);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  if (CFWriteStreamOpen(v2))
  {
    if (CFPropertyListWrite(a1, v3, kCFPropertyListBinaryFormat_v1_0, 0LL, 0LL) < 1) {
      CFTypeRef v4 = 0LL;
    }
    else {
      CFTypeRef v4 = CFWriteStreamCopyProperty(v3, kCFStreamPropertyDataWritten);
    }
    CFWriteStreamClose(v3);
  }

  else
  {
    CFTypeRef v4 = 0LL;
  }

  CFRelease(v3);
  return v4;
}

BOOL sub_100003040()
{
  return !stat("/System/Library/CoreServices/Carousel.app", &v1) || *__error() != 2;
}

BOOL sub_1000030A0()
{
  return !stat("/System/Library/CoreServices/SurfBoard.app", &v1) || *__error() != 2;
}

uint64_t sub_100003100()
{
  return 0LL;
}

CFBooleanRef sub_100003108(const __CFString *a1)
{
  if (sub_10000F040(a1))
  {
    if (CFEqual(@"ShouldSubmit", a1))
    {
      int v13 = DiagnosticLogSubmissionEnabled();
      v14 = &kCFBooleanTrue;
      if (!v13) {
        v14 = &kCFBooleanFalse;
      }
      return *v14;
    }

    else
    {
      return (CFBooleanRef)sub_100018F28(a1, @"com.apple.MobileDeviceCrashCopy", v7, v8, v9, v10, v11, v12);
    }
  }

  else
  {
    sub_1000188F8( 0,  "copy_crashcopier_value",  @"Invalid key for domain %@.",  v2,  v3,  v4,  v5,  v6,  (char)@"com.apple.MobileDeviceCrashCopy");
    return 0LL;
  }

BOOL sub_1000031B8(const __CFString *a1, void *a2)
{
  if (!sub_10000F040(a1) || !sub_10000F0A8(a2))
  {
    sub_1000188F8(0, "set_crashcopier_value", @"Invalid key '%@' or value '%@'.", v4, v5, v6, v7, v8, (char)a1);
    return 0LL;
  }

  if (!CFEqual(a1, @"ShouldSubmit")) {
    return !sub_100018E20(a1, a2, @"com.apple.MobileDeviceCrashCopy", v9, v10, v11, v12, v13);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  id v15 = [a2 BOOLValue];
  [v14 setBoolValue:v15 forSetting:MCFeatureDiagnosticsSubmissionAllowed];

  return 1LL;
}

void *sub_10000328C()
{
  return calloc(1uLL, 0x30uLL);
}

void sub_100003298(void *a1)
{
  if (a1) {
    free(a1);
  }
}

double sub_1000032A4(uint64_t a1, int a2, int a3)
{
  if (a1)
  {
    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_DWORD *)a1 = a2;
    *(void *)(a1 + 8) = 0LL;
    *(_DWORD *)(a1 + 16) = a3;
    *(_DWORD *)(a1 + 32) = 0;
  }

  return result;
}

unint64_t sub_1000032C8(unint64_t result)
{
  if (result)
  {
    stat v1 = (unsigned int *)result;
    uint64_t v2 = *(dispatch_source_s **)(result + 40);
    if (v2)
    {
      dispatch_source_cancel(v2);
      dispatch_release(*((dispatch_object_t *)v1 + 5));
      *((void *)v1 + 5) = 0LL;
    }

    double result = *v1;
    if ((_DWORD)result != -1) {
      double result = close(result);
    }
    *stat v1 = -1;
  }

  return result;
}

uint64_t sub_100003318(unsigned int *a1)
{
  if (a1) {
    return *a1;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_10000332C(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 16);
  }
  else {
    return 4LL;
  }
}

uint64_t sub_100003340(uint64_t a1)
{
  if (!a1) {
    return 1LL;
  }
  unsigned int v1 = *(_DWORD *)(a1 + 32);
  if (v1 <= 1) {
    return 1LL;
  }
  else {
    return v1;
  }
}

uint64_t sub_10000335C(uint64_t a1, const __CFData *a2, const __CFData *a3, const __CFData *a4, int a5)
{
  uint64_t v6 = sub_10002607C(*(_DWORD *)a1, a2, a3, a4, a5);
  *(void *)(a1 + 24) = v6;
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0LL;
  *(_BYTE *)(a1 + 20) = 1;
  return result;
}

uint64_t sub_10000339C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 20))
  {
    OSStatus v2 = SSLClose(*(SSLContextRef *)(a1 + 24));
    if (v2) {
      sub_1000188F8(0, "lockconn_disable_ssl", @"Could not shutdown SSL connection: %d\n", v3, v4, v5, v6, v7, v2);
    }
    *(_BYTE *)(a1 + 20) = 0;
  }

  uint64_t v8 = *(SSLContext **)(a1 + 24);
  if (v8)
  {
    _SSLDisposeContext(v8);
    *(void *)(a1 + 24) = 0LL;
  }

  return 0LL;
}

uint64_t sub_100003408(uint64_t result)
{
  if (result) {
    return *(unsigned __int8 *)(result + 20);
  }
  return result;
}

ssize_t sub_100003414(uint64_t a1, const void *a2, size_t a3)
{
  size_t processed = -1LL;
  if (!*(_BYTE *)(a1 + 20)) {
    return send(*(_DWORD *)a1, a2, a3, 0);
  }
  OSStatus v3 = SSLWrite(*(SSLContextRef *)(a1 + 24), a2, a3, &processed);
  if (v3)
  {
    OSStatus v4 = v3;
    *__error() = 5;
    if (!processed) {
      size_t processed = -1LL;
    }
    if (v4 == -9806)
    {
      uint64_t v5 = __error();
      int v6 = 32;
      goto LABEL_10;
    }

    if (v4 == -9803)
    {
      uint64_t v5 = __error();
      int v6 = 35;
LABEL_10:
      int *v5 = v6;
    }
  }

  return processed;
}

ssize_t sub_1000034BC( uint64_t a1, void *data, size_t dataLength, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t processed = -1LL;
  if (!*(_BYTE *)(a1 + 20))
  {
    *__error() = 54;
    sub_1000188F8(0, "lockconn_recv", @"walk away", v13, v14, v15, v16, v17, v21);
    return processed;
  }

  OSStatus v11 = SSLRead(*(SSLContextRef *)(a1 + 24), data, dataLength, &processed);
  if (!v11) {
    return processed;
  }
  OSStatus v12 = v11;
  *__error() = 5;
  if (!processed) {
    size_t processed = -1LL;
  }
  switch(v12)
  {
    case -9806:
      v18 = __error();
      int v19 = 54;
LABEL_14:
      int *v18 = v19;
      return processed;
    case -9803:
      v18 = __error();
      int v19 = 2;
      goto LABEL_14;
    case -9805:
      return 0LL;
  }

  return processed;
}

uint64_t sub_1000035D0( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)&v23.tv_usec = 0LL;
  memset(&v24, 0, sizeof(v24));
  if (a1 >= 1024)
  {
    sub_1000188F8(0, "_select_socket", @"Invalid socket (received %d, max is %d).", a4, a5, a6, a7, a8, a1);
    return 0xFFFFFFFFLL;
  }

  if (a1 == -1)
  {
    v18 = @"Invalid socket";
LABEL_20:
    sub_1000188F8(0, "_select_socket", v18, a4, a5, a6, a7, a8, v21);
    return 0xFFFFFFFFLL;
  }

  if (__darwin_check_fd_set_overflow(a1, &v24, 0)) {
    *(__int32_t *)((char *)v24.fds_bits + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << a1;
  }
  v23.tv_usec = 0;
  v23.tv_sec = 60LL;
  char v9 = fcntl(a1, 3, 4LL);
  uint64_t result = 0LL;
  if ((v9 & 4) == 0)
  {
    int v11 = 0;
    while (1)
    {
      int v12 = select(a1 + 1, &v24, 0LL, 0LL, &v23);
      memset(&v24, 0, sizeof(v24));
      if (__darwin_check_fd_set_overflow(a1, &v24, 0)) {
        v24.fds_bits[(unint64_t)a1 >> 5] |= 1 << a1;
      }
      if (v12 != -1) {
        break;
      }
      if (*__error() != 4)
      {
        v20 = __error();
        char v22 = strerror(*v20);
        int v19 = @"select error receiving message: %s";
        goto LABEL_18;
      }

      if (++v11 == 20)
      {
        LOBYTE(v11) = 20;
LABEL_19:
        char v21 = v11;
        v18 = @"Failed to select socket after %d attempts.";
        goto LABEL_20;
      }
    }

    if (!v12)
    {
      int v19 = @"receive secure message timeout!";
LABEL_18:
      sub_1000188F8(0, "_select_socket", v19, v13, v14, v15, v16, v17, v22);
      goto LABEL_19;
    }

    return 0LL;
  }

  return result;
}

uint64_t sub_1000037D0( const __CFData *a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1000037D8(a1, a2, kCFPropertyListXMLFormat_v1_0, a4, a5, a6, a7, a8);
}

uint64_t sub_1000037D8( CFDataRef Data, const void *a2, CFPropertyListFormat a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!Data)
  {
    uint64_t v10 = @"no connection";
LABEL_22:
    sub_1000188F8((int)Data, "_send_message", v10, a4, a5, a6, a7, a8, v25);
    return 0xFFFFFFFFLL;
  }

  uint64_t v8 = (uint64_t)Data;
  if (*(_DWORD *)Data == -1)
  {
    uint64_t v10 = @"no socket";
LABEL_9:
    LODWORD(Data) = 0;
    goto LABEL_22;
  }

  if (!*((_BYTE *)Data + 20))
  {
    if (!a2) {
      return 0xFFFFFFFFLL;
    }
    goto LABEL_11;
  }

  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && *(void *)(v8 + 24))
  {
LABEL_11:
    Data = CFPropertyListCreateData(kCFAllocatorDefault, a2, a3, 0LL, 0LL);
    if (!Data)
    {
      uint64_t v10 = @"Could not encode message as XML";
      goto LABEL_22;
    }

    CFDataRef v11 = Data;
    CFIndex Length = CFDataGetLength(Data);
    if (Length < 0)
    {
      sub_1000188F8(0, "_send_message", @"message length too small", v13, v14, v15, v16, v17, v25);
      CFRelease(v11);
      return 0xFFFFFFFFLL;
    }

    unint64_t v18 = Length;
    BytePtr = CFDataGetBytePtr(v11);
    uint64_t v20 = 0LL;
    unsigned int v26 = bswap32(v18);
    do
    {
      ssize_t v21 = sub_100003414(v8, (char *)&v26 + v20, 4 - v20);
      if (v21 == -1)
      {
        CFRelease(v11);
        fd_set v24 = __error();
        strerror(*v24);
        char v25 = v18;
        uint64_t v10 = @"Could not send message size %ld: %s\n";
        goto LABEL_9;
      }

      v20 += v21;
    }

    while (v20 != 4);
    if (!v18)
    {
LABEL_20:
      CFRelease(v11);
      return 0LL;
    }

    unint64_t v22 = 0LL;
    while (1)
    {
      ssize_t v23 = sub_100003414(v8, BytePtr, v18 - v22);
      if (v23 == -1) {
        break;
      }
      v22 += v23;
      BytePtr += v23;
      if (v22 >= v18) {
        goto LABEL_20;
      }
    }

    CFRelease(v11);
    uint64_t v10 = @"Could not send secure message.\n";
    goto LABEL_9;
  }

  return result;
}

CFDictionaryRef sub_1000039A4( int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v18 = (const __CFDictionary *)sub_100003A88((uint64_t)a1, v9, v10, v11, v12, v13, v14, v15);
  uint64_t v16 = v18;
  if (!v18)
  {
LABEL_8:
    sub_100003D18(v16);
    return v16;
  }

  CFTypeID v19 = CFGetTypeID(v18);
  if (v19 == CFDictionaryGetTypeID())
  {
    if (!a1[8])
    {
      Value = (const __CFString *)CFDictionaryGetValue(v16, @"ProtocolVersion");
      if (Value)
      {
        unsigned int v26 = Value;
        CFTypeID v27 = CFGetTypeID(Value);
        if (v27 == CFStringGetTypeID())
        {
          SInt32 IntValue = CFStringGetIntValue(v26);
          if (IntValue >= 1) {
            a1[8] = IntValue;
          }
        }
      }
    }

    goto LABEL_8;
  }

  sub_1000188F8( 0,  "lockconn_receive_message",  @"Ignoring message that is not the right type.\n",  v20,  v21,  v22,  v23,  v24,  v29);
  CFRelease(v16);
  return 0LL;
}

CFPropertyListRef sub_100003A88( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int data = 0;
  CFErrorRef error = 0LL;
  int v9 = *(_DWORD *)a1;
  if (v9 == -1) {
    return 0LL;
  }
  if (!*(_BYTE *)(a1 + 20))
  {
    if (sub_1000035D0(v9, a2, a3, a4, a5, a6, a7, a8))
    {
      uint64_t v23 = @"walk away - non-SSL 2";
      goto LABEL_16;
    }

    goto LABEL_9;
  }

  uint64_t v10 = *(SSLContext **)(a1 + 24);
  if (!v10) {
    return 0LL;
  }
  if (SSLRead(v10, &data, 4uLL, &processed) == -9805)
  {
    *(_BYTE *)(a1 + 20) = 0;
    sub_10000339C(a1);
    if (sub_1000035D0(*(_DWORD *)a1, v16, v17, v18, v19, v20, v21, v22))
    {
      uint64_t v23 = @"walk away - non-SSL 1";
LABEL_16:
      sub_1000188F8(0, "_receive_message", v23, v11, v12, v13, v14, v15, v52);
      return 0LL;
    }

LABEL_9:
    size_t v24 = recv(*(_DWORD *)a1, &data, 4uLL, 0);
    size_t processed = v24;
    if (!v24) {
      return 0LL;
    }
    goto LABEL_12;
  }

  size_t v24 = processed;
  if (!processed) {
    return 0LL;
  }
LABEL_12:
  if (v24 != 4)
  {
    __error();
    unsigned int v26 = __error();
    strerror(*v26);
    char v52 = 4;
    uint64_t v23 = @"Could not receive size of message, expected %d bytes, got %ld bytes: (%d, %s)";
    goto LABEL_16;
  }

  size_t v25 = bswap32(data);
  if (v25 > 0x300000)
  {
    char v52 = data;
    uint64_t v23 = @"swapped %d message size %d exceeds %d limit";
    goto LABEL_16;
  }

  if (!data)
  {
    uint64_t v23 = @"msize is zero";
    goto LABEL_16;
  }

  char v29 = (char *)malloc(v25);
  if (!v29)
  {
    sub_1000188F8(0, "_receive_message", @"can't alloc message size %d", v30, v31, v32, v33, v34, v25);
    return 0LL;
  }

  v35 = v29;
  size_t v36 = 0LL;
  v37 = v29;
  do
  {
    ssize_t v38 = sub_1000034BC(a1, v37, v25 - v36, v30, v31, v32, v33, v34);
    size_t processed = v38;
    if (v38 <= 0)
    {
      sub_1000188F8(0, "_receive_message", @"Could not receive message: %ld.\n", v30, v31, v32, v33, v34, v38);
LABEL_36:
      free(v35);
      return 0LL;
    }

    v36 += v38;
    v37 += v38;
  }

  while (v36 < v25);
  v39 = CFDataCreateWithBytesNoCopy(0LL, (const UInt8 *)v35, v25, kCFAllocatorMalloc);
  if (!v39)
  {
    sub_1000188F8(0, "_receive_message", @"Could not create CFData for message.\n", v40, v41, v42, v43, v44, v52);
    goto LABEL_36;
  }

  v45 = v39;
  CFPropertyListRef v27 = CFPropertyListCreateWithData(0LL, v39, 0LL, 0LL, &error);
  if (v27) {
    BOOL v51 = error == 0LL;
  }
  else {
    BOOL v51 = 0;
  }
  if (!v51)
  {
    sub_1000188F8(0, "_receive_message", @"there was an err.", v46, v47, v48, v49, v50, v52);
    if (error) {
      CFRelease(error);
    }
  }

  CFRelease(v45);
  return v27;
}

void sub_100003D18(const __CFDictionary *a1)
{
  if (a1)
  {
    Value = (const __CFString *)CFDictionaryGetValue(a1, @"Warning");
    if (Value)
    {
      OSStatus v2 = Value;
      memcpy(__dst, "Error creating CFString", sizeof(__dst));
      LODWORD(v2) = CFStringGetCString(v2, __dst, 1024LL, 0x8000100u);
      BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (!(_DWORD)v2)
      {
        if (!v3) {
          return;
        }
        LOWORD(v5) = 0;
        OSStatus v4 = "CFStringGetCString failure in lockdown_warning_break";
        goto LABEL_10;
      }

      if (v3)
      {
        int v5 = 136315138;
        int v6 = __dst;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%s",  (uint8_t *)&v5,  0xCu);
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v5) = 0;
        OSStatus v4 = "*** this is a CLIENT bug, NOT a lockdown bug; set a breakpoint in lockdown_warning_break to debug";
LABEL_10:
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  v4,  (uint8_t *)&v5,  2u);
      }
    }
  }

void sub_100003E64()
{
  uint64_t valuePtr = 0LL;
  v28[0] = 0LL;
  v28[1] = v28;
  v28[2] = 0x2020000000LL;
  char v29 = 0;
  uint64_t v24 = 0LL;
  size_t v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  uint64_t v27 = 0LL;
  v0 = sub_100003FDC();
  if (sub_10000EFD8(v0))
  {
    if (CFDictionaryGetCount(v0)) {
      goto LABEL_10;
    }
    int v6 = sub_1000074B4();
    v25[3] = (uint64_t)v6;
    if (v6)
    {
      if (CFNumberGetValue(v6, kCFNumberDoubleType, &valuePtr))
      {
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_100004068;
        v23[3] = &unk_100149AD8;
        v23[4] = v28;
        v23[5] = &v24;
        sub_1000131E0(v23);
        goto LABEL_10;
      }

      uint64_t v19 = @"Failed to query number.";
    }

    else
    {
      uint64_t v19 = @"Failed to query time.";
    }

    sub_1000188F8(0, "initialize_pairing_expirations", v19, v7, v8, v9, v10, v11, v22);
  }

  else
  {
    sub_1000188F8( 0,  "initialize_pairing_expirations",  @"hinky input from the dictionary",  v1,  v2,  v3,  v4,  v5,  v22);
    sub_10001907C(@"com.apple.mobile.ldpair", v12, v13, v14, v15, v16, v17, v18);
  }

LABEL_10:
  uint64_t v20 = v25;
  uint64_t v21 = (const void *)v25[3];
  if (v21)
  {
    CFRelease(v21);
    uint64_t v20 = v25;
  }

  v20[3] = 0LL;
  if (v0) {
    CFRelease(v0);
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(v28, 8);
}

      CFRelease(v15);
      goto LABEL_11;
    }

    v28 = @"Failed to create array.";
  }

  else
  {
    v28 = @"Invalid input.";
    LODWORD(Mutable) = 0;
  }

  sub_1000188F8((int)Mutable, "set_keyboard", v28, a4, a5, a6, a7, a8, a9);
}

void sub_100003FB8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

CFDictionaryRef sub_100003FDC()
{
  v0 = sub_1000191BC(@"com.apple.mobile.ldpair");
  if (sub_10000EFD8(v0))
  {
    CFDictionaryApplyFunction(v0, (CFDictionaryApplierFunction)sub_10000460C, 0LL);
    if (v0) {
      CFRelease(v0);
    }
    return sub_1000191BC(@"com.apple.mobile.ldpair");
  }

  else
  {
    sub_1000188F8(0, "copy_paired_hosts_and_dates", @"Invalid paired hosts records.", v1, v2, v3, v4, v5, v7);
    if (v0) {
      CFRelease(v0);
    }
    return 0LL;
  }

uint64_t sub_100004068(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = v3;
  if (v3)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"HostID"]);
    id v11 = sub_10001933C(v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    if (v12)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = sub_100004154( v10,  *(const void **)(*(void *)(*(void *)(a1 + 40)
                                                                                                + 8LL)
                                                                                    + 24LL),
                                                                     v13,
                                                                     v14,
                                                                     v15,
                                                                     v16,
                                                                     v17,
                                                                     v18);
      if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
        sub_1000188F8( 0,  "initialize_pairing_expirations_block_invoke",  @"Failed to set last paired date for %@.",  v19,  v20,  v21,  v22,  v23,  (char)v10);
      }
    }

    else
    {
      sub_1000188F8( 0,  "initialize_pairing_expirations_block_invoke",  @"Pair record doesn't contain host id.",  v14,  v15,  v16,  v17,  v18,  v25);
    }
  }

  else
  {
    sub_1000188F8( 0,  "initialize_pairing_expirations_block_invoke",  @"Invalid pair record.",  v4,  v5,  v6,  v7,  v8,  v25);
    uint64_t v10 = 0LL;
  }

  return 1LL;
}

uint64_t sub_100004154( const void *a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    CFDictionaryRef v10 = sub_1000191BC(@"com.apple.mobile.ldpair");
    if (sub_10000EFD8(v10))
    {
      id v11 = v10;
      if ((unint64_t)-[__CFDictionary count](v11, "count") < 0x201)
      {
        uint64_t v17 = 0LL;
      }

      else
      {
        sub_1000188F8( 0,  "set_last_paired_date",  @"Detected greater than %d hosts in domain '%@', trimming list.",  v12,  v13,  v14,  v15,  v16,  0);
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary keysSortedByValueUsingComparator:]( v11,  "keysSortedByValueUsingComparator:",  &stru_100149B18));
        uint64_t v18 = (char *)[v17 count];
        uint64_t v19 = v18 - 256;
        if (v18 != (char *)256)
        {
          for (i = 0LL; v19 != i; ++i)
          {
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:i]);
            id v22 = sub_10001933C(v21);
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

            if (v23)
            {
              uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:i]);
              sub_100004574(v24, v25, v26, v27, v28, v29, v30, v31, v61);
            }

            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
              {
                v45 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:i]);
                uint64_t v46 = (void *)objc_opt_class(v45);
                *(_DWORD *)buf = 138412546;
                v63 = @"com.apple.mobile.ldpair";
                __int16 v64 = 2112;
                v65 = v46;
                id v47 = v46;
                _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Unexpected format in preferences for domain %@: %@",  buf,  0x16u);
              }

              uint64_t v32 = (__CFString *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:i]);
              int v39 = sub_100018FC0(v32, @"com.apple.mobile.ldpair", v33, v34, v35, v36, v37, v38);

              if (!v39) {
                continue;
              }
              uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:i]);
              sub_1000188F8( 0,  "set_last_paired_date",  @"Failed to remove pairing pairing info for %@.",  v40,  v41,  v42,  v43,  v44,  (char)v24);
            }
          }
        }
      }

      uint64_t v49 = (const __CFString *)sub_10000F040(a1);
      if (!sub_100018E20(v49, a2, @"com.apple.mobile.ldpair", v50, v51, v52, v53, v54))
      {
        uint64_t v48 = 1LL;
        if (!v10) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }

      sub_1000188F8(0, "set_last_paired_date", @"Failed to set pairing date.", v55, v56, v57, v58, v59, v61);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_1000D3468((uint64_t)@"com.apple.mobile.ldpair");
      }
      uint64_t v17 = 0LL;
      id v11 = 0LL;
    }

    uint64_t v48 = 0LL;
    if (v10) {
LABEL_23:
    }
      CFRelease(v10);
  }

  else
  {
    sub_1000188F8(0, "set_last_paired_date", @"Invalid input", a4, a5, a6, a7, a8, v61);
    uint64_t v48 = 0LL;
    id v11 = 0LL;
    uint64_t v17 = 0LL;
  }

LABEL_24:
  return v48;
}

      sub_1000188F8( 0,  "sanitize_device_name",  @"Failed to create posix name, using default.",  v10,  v11,  v12,  v13,  v14,  v29);
      uint64_t v20 = (const __CFString *)MGCopyAnswer(@"MarketingDeviceFamilyName", 0LL);
      if (!v20) {
        sub_1000188F8( 0,  "sanitize_device_name",  @"Failed to query %@.",  v24,  v25,  v26,  v27,  v28,  (char)@"MarketingDeviceFamilyName");
      }
      goto LABEL_26;
    }

    sub_1000188F8(0, "sanitize_device_name", @"Failed to copy string.", v3, v4, v5, v6, v7, v29);
  }

  return 0LL;
}

uint64_t sub_100004434( const __CFString *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 && a2)
  {
    uint64_t v9 = (const __CFNumber *)sub_100018F28(a1, @"com.apple.mobile.ldpair", a3, a4, a5, a6, a7, a8);
    if (sub_10000EFA4(v9))
    {
      if (CFNumberGetValue(v9, kCFNumberDoubleType, a2))
      {
        uint64_t v15 = 1LL;
        if (!v9) {
          return v15;
        }
        goto LABEL_11;
      }

      uint64_t v16 = @"Failed to retrieve number.";
    }

    else
    {
      uint64_t v16 = @"No last paired date for this host.";
    }

    sub_1000188F8(0, "get_last_paired_date", v16, v10, v11, v12, v13, v14, v18);
    uint64_t v15 = 0LL;
    if (v9) {
LABEL_11:
    }
      CFRelease(v9);
  }

  else
  {
    sub_1000188F8(0, "get_last_paired_date", @"Invalid input", a4, a5, a6, a7, a8, v18);
    return 0LL;
  }

  return v15;
}

int64_t sub_1000044EC(id a1, id a2, id a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 doubleValue];
  double v7 = v6;
  [v5 doubleValue];
  if (v7 <= v8)
  {
    [v4 doubleValue];
    double v11 = v10;
    [v5 doubleValue];
    if (v11 >= v12) {
      int64_t v9 = 0LL;
    }
    else {
      int64_t v9 = -1LL;
    }
  }

  else
  {
    int64_t v9 = 1LL;
  }

  return v9;
}

void sub_100004574( const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1)
  {
    sub_1000140B0((uint64_t)a1, 0);
    sub_1000266A0(a1);
    sub_100013524((uint64_t)a1, 0, v10, v11, v12, v13, v14, v15);
    if (sub_100018FC0(a1, @"com.apple.mobile.ldpair", v16, v17, v18, v19, v20, v21)) {
      sub_1000188F8( 0,  "remove_pairing_info_for_host",  @"Failed to remove pairing pairing info for %@.",  v22,  v23,  v24,  v25,  v26,  (char)a1);
    }
  }

  else
  {
    sub_1000188F8(0, "remove_pairing_info_for_host", @"Invalid input.", a4, a5, a6, a7, a8, a9);
  }

void sub_10000460C(const __CFString *a1, const void *a2)
{
  double v24 = 0.0;
  double valuePtr = 0.0;
  if (!sub_10000F040(a1) || !sub_10000EFA4(a2))
  {
    sub_1000188F8(0, "expire_old_hosts", @"Invalid input.", v4, v5, v6, v7, v8, SLOBYTE(v24));
    uint64_t v15 = 0LL;
    goto LABEL_13;
  }

  int64_t v9 = sub_1000074B4();
  uint64_t v15 = v9;
  if (!v9)
  {
    uint64_t v16 = @"Failed to query time.";
LABEL_12:
    sub_1000188F8((int)v9, "expire_old_hosts", v16, v10, v11, v12, v13, v14, SLOBYTE(v24));
    goto LABEL_13;
  }

  LODWORD(v9) = CFNumberGetValue(v9, kCFNumberDoubleType, &v24);
  if (!(_DWORD)v9)
  {
    uint64_t v16 = @"Failed to query number.";
    goto LABEL_12;
  }

  LODWORD(v9) = CFNumberGetValue((CFNumberRef)a2, kCFNumberDoubleType, &valuePtr);
  if (!(_DWORD)v9)
  {
    uint64_t v16 = @"Failed to get double value.";
    goto LABEL_12;
  }

  if (v24 <= valuePtr + 2592000.0)
  {
    sub_10000F040(a1);
LABEL_16:
    CFRelease(v15);
    return;
  }

LABEL_13:
  if (sub_10000F040(a1)) {
    sub_100004574(a1, v17, v18, v19, v20, v21, v22, v23, SLOBYTE(v24));
  }
  if (v15) {
    goto LABEL_16;
  }
}

uint64_t sub_10000472C()
{
  return 2592000LL;
}

uint64_t sub_100004738( unsigned int *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v32 = 0;
  int v33 = 1;
  *(void *)&v34.sa_len = 0LL;
  *(void *)&v34.sa_data[6] = 0LL;
  uint64_t v30 = 0LL;
  in6_addr v31 = (in6_addr)0LL;
  socklen_t v29 = 0;
  if (!a1)
  {
    uint64_t v13 = @"Invalid input.";
LABEL_7:
    sub_1000188F8((int)a1, "create_inet_sock", v13, a4, a5, a6, a7, a8, v27);
    return 0xFFFFFFFFLL;
  }

  int64_t v9 = a1;
  uint64_t v10 = socket(a2, 1, 0);
  if ((_DWORD)v10 == -1)
  {
    int v14 = *__error();
    uint64_t v15 = __error();
    strerror(*v15);
    char v27 = v14;
    uint64_t v13 = @"Failed to create socket: %d (%s)";
    LODWORD(a1) = 0;
    goto LABEL_7;
  }

  uint64_t v11 = v10;
  if (setsockopt(v10, 0xFFFF, 4354, &v33, 4u))
  {
    uint64_t v12 = @"Failed to set socket option (SO_OPPORTUNISTIC): %d (%s)";
LABEL_10:
    int v16 = *__error();
    uint64_t v17 = __error();
    strerror(*v17);
    sub_1000188F8(0, "create_inet_sock", v12, v18, v19, v20, v21, v22, v16);
    close(v11);
    return 0xFFFFFFFFLL;
  }

  int v28 = 4;
  if (setsockopt(v11, 0xFFFF, 4225, &v28, 4u))
  {
    uint64_t v12 = @"Failed to set socket option (SO_RESTRICTIONS): %d (%s)";
    goto LABEL_10;
  }

  if (*v9)
  {
    if (setsockopt(v11, 0xFFFF, 4, &v33, 4u))
    {
      uint64_t v12 = @"Failed to set socket option (SO_REUSEADDR): %d (%s)";
      goto LABEL_10;
    }

    if (setsockopt(v11, 0xFFFF, 512, &v33, 4u))
    {
      uint64_t v12 = @"Failed to set socket option (SO_REUSEPORT): %d (%s)";
      goto LABEL_10;
    }
  }

  if (a2 == 30)
  {
    LOWORD(v30) = 7708;
    in6_addr v31 = in6addr_any;
    WORD1(v30) = bswap32(*(unsigned __int16 *)v9) >> 16;
    socklen_t v24 = 28;
    socklen_t v29 = 28;
    if (setsockopt(v11, 41, 27, &v33, 4u))
    {
      uint64_t v12 = @"Failed to set socket option (IPV6_V6ONLY): %d (%s)";
      goto LABEL_10;
    }

    uint64_t v25 = (sockaddr *)&v30;
  }

  else
  {
    *(_WORD *)&v34.sa_len = 528;
    *(_DWORD *)&v34.sa_data[2] = 0;
    *(_WORD *)v34.sa_unsigned int data = bswap32(*(unsigned __int16 *)v9) >> 16;
    socklen_t v24 = 16;
    socklen_t v29 = 16;
    uint64_t v25 = &v34;
  }

  if (bind(v11, v25, v24) == -1)
  {
    uint64_t v12 = @"Failed to bind socket: %d (%s)";
    goto LABEL_10;
  }

  if (getsockname(v11, v25, &v29) == -1)
  {
    uint64_t v12 = @"Failed to get socket name: %d (%s)";
    goto LABEL_10;
  }

  if (listen(v11, 128) == -1)
  {
    uint64_t v12 = @"Failed to listen on socket: %d (%s)";
    goto LABEL_10;
  }

  sa_unsigned int data = v34.sa_data;
  if (a2 == 30) {
    sa_unsigned int data = (char *)&v30 + 2;
  }
  *int64_t v9 = bswap32(*(unsigned __int16 *)sa_data) >> 16;
  return v11;
}

BOOL sub_100004A24( void *a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v9 = a4;
  uint64_t v23 = 0LL;
  socklen_t v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  if (a1 && *a1 && (uint64_t v12 = (dispatch_queue_s *)a1[2]) != 0LL)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100004B50;
    v19[3] = &unk_100149B40;
    char v20 = a4;
    char v21 = a3;
    v19[5] = a1;
    v19[6] = a2;
    char v22 = a5;
    v19[4] = &v23;
    dispatch_sync(v12, v19);
  }

  else
  {
    sub_1000188F8(0, "dns_register", @"Invalid input.", a4, a5, a6, a7, a8, v19[0]);
  }

  if (*((_BYTE *)v24 + 24))
  {
    BOOL v17 = 1LL;
  }

  else
  {
    sub_1000058E4(a1, a3, v9, a5, v13, v14, v15, v16, v19[0]);
    BOOL v17 = *((_BYTE *)v24 + 24) != 0;
  }

  _Block_object_dispose(&v23, 8);
  return v17;
}

void sub_100004B38( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100004B50( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  *(_OWORD *)buffer = 0u;
  __int128 v58 = 0u;
  if (!*(_BYTE *)(a1 + 56) && !*(_BYTE *)(a1 + 57))
  {
    sub_1000188F8( 0,  "dns_register_block_invoke",  @"Invalid input. No DNS registration requested.",  a4,  a5,  a6,  a7,  a8,  v56);
    xpc_object_t v34 = 0LL;
    socklen_t v24 = 0LL;
    goto LABEL_26;
  }

  char v9 = (const __CFString *)sub_10000D238( **(void **)(a1 + 40),  (uint64_t)@"com.apple.mobile.wireless_lockdown",  (uint64_t)@"InstanceName");
  uint64_t v10 = sub_10000F040(v9);
  if (!v10)
  {
    int v33 = @"Invalid wireless instance name.";
LABEL_22:
    sub_1000188F8((int)v10, "dns_register_block_invoke", v33, v11, v12, v13, v14, v15, v56);
    socklen_t v24 = 0LL;
LABEL_23:
    xpc_object_t v34 = 0LL;
    goto LABEL_24;
  }

  LODWORD(v10) = CFStringGetCString(v9, buffer, 64LL, 0x8000100u);
  if (!(_DWORD)v10)
  {
    int v33 = @"Failed to create string.";
    goto LABEL_22;
  }

  if (!*(_BYTE *)(a1 + 57))
  {
LABEL_16:
    socklen_t v24 = 0LL;
    goto LABEL_17;
  }

  uint64_t v16 = *(const char **)(a1 + 48);
  if (!v16)
  {
    int v33 = @"Invalid service string name.";
    LODWORD(v10) = 0;
    goto LABEL_22;
  }

  uint64_t v17 = *(void *)(a1 + 40);
  if (*(_BYTE *)(v17 + 32))
  {
    uint64_t v18 = *(const char **)(v17 + 24);
    if (!v18 || !strcmp(v18, v16)) {
      goto LABEL_16;
    }
  }

  xpc_set_event("com.apple.bonjour.registration", "LOCKDOWN.BONJOUR", 0LL);
  socklen_t v24 = strdup(*(const char **)(a1 + 48));
  if (!v24)
  {
    sub_1000188F8(0, "dns_register_block_invoke", @"Failed to copy service string.", v19, v20, v21, v22, v23, v56);
    goto LABEL_23;
  }

  uint64_t v25 = *(void *)(a1 + 40);
  char v26 = *(void **)(v25 + 24);
  if (v26)
  {
    free(v26);
    uint64_t v25 = *(void *)(a1 + 40);
  }

  *(void *)(v25 + 24) = 0LL;
  *(void *)(*(void *)(a1 + 40) + 24LL) = v24;
  socklen_t v24 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_int64(v24, "Flags", 0LL);
  xpc_dictionary_set_string(v24, "Name", buffer);
  xpc_dictionary_set_string(v24, "RegistrationType", *(const char **)(*(void *)(a1 + 40) + 24LL));
  xpc_dictionary_set_int64(v24, "InterfaceIndex", 0LL);
  xpc_dictionary_set_int64(v24, "Port", 32498LL);
  xpc_set_event("com.apple.bonjour.registration", "LOCKDOWN.BONJOUR", v24);
  uint64_t v27 = *(void *)(a1 + 40);
  *(_BYTE *)(v27 + 32) = 1;
  sub_1000188F8( 0,  "dns_register_block_invoke",  @"Registered DNS (syncing): %s",  v28,  v29,  v30,  v31,  v32,  *(void *)(v27 + 24));
LABEL_17:
  if (*(_BYTE *)(a1 + 56) && !*(_BYTE *)(*(void *)(a1 + 40) + 33LL))
  {
    xpc_set_event("com.apple.bonjour.registration", "LOCKDOWN.PAIRING.BONJOUR", 0LL);
    xpc_object_t v34 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v34, "Flags", 0LL);
    xpc_dictionary_set_string(v34, "Name", buffer);
    xpc_dictionary_set_string(v34, "RegistrationType", "_apple-pairable._tcp");
    xpc_dictionary_set_int64(v34, "InterfaceIndex", 0LL);
    xpc_dictionary_set_int64(v34, "Port", 32498LL);
    xpc_set_event("com.apple.bonjour.registration", "LOCKDOWN.PAIRING.BONJOUR", v34);
    *(_BYTE *)(*(void *)(a1 + 40) + 33LL) = 1;
    sub_1000188F8( 0,  "dns_register_block_invoke",  @"Registered DNS (pairing): %s ",  v35,  v36,  v37,  v38,  v39,  (char)"_apple-pairable._tcp");
  }

  else
  {
    xpc_object_t v34 = 0LL;
  }

  if (!*(_BYTE *)(a1 + 58)) {
    goto LABEL_41;
  }
  uint64_t v40 = *(void *)(a1 + 40);
  if (*(void *)(v40 + 40))
  {
    if (*(_DWORD *)(v40 + 52) && *(void *)(v40 + 56)) {
      goto LABEL_41;
    }
    IONotificationPortDestroy(*(IONotificationPortRef *)(v40 + 40));
    *(void *)(*(void *)(a1 + 40) + 40LL) = 0LL;
    uint64_t v40 = *(void *)(a1 + 40);
  }

  if (*(_DWORD *)(v40 + 52))
  {
    IOServiceClose(*(_DWORD *)(v40 + 52));
    uint64_t v40 = *(void *)(a1 + 40);
    *(_DWORD *)(v40 + 52) = 0;
  }

  if (*(void *)(v40 + 56))
  {
    CFRelease(*(CFTypeRef *)(v40 + 56));
    *(void *)(*(void *)(a1 + 40) + 56LL) = 0LL;
    uint64_t v40 = *(void *)(a1 + 40);
  }

  LODWORD(RunLoopSource) = IORegisterForSystemPower( (void *)v40,  (IONotificationPortRef *)(v40 + 40),  (IOServiceInterestCallback)sub_100005030,  (io_object_t *)(v40 + 48));
  uint64_t v47 = *(void *)(a1 + 40);
  *(_DWORD *)(v47 + 52) = (_DWORD)RunLoopSource;
  if ((_DWORD)RunLoopSource)
  {
    CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource(*(IONotificationPortRef *)(v47 + 40));
    if (RunLoopSource)
    {
      uint64_t v48 = RunLoopSource;
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v48, kCFRunLoopDefaultMode);
      *(void *)(*(void *)(a1 + 40) + 56LL) = WiFiManagerClientCreate(kCFAllocatorDefault, 1LL);
      CFRunLoopSourceRef RunLoopSource = *(CFRunLoopSourceRef *)(*(void *)(a1 + 40) + 56LL);
      if (RunLoopSource)
      {
        WiFiManagerClientSetWoWState(RunLoopSource, 1LL);
        sub_1000188F8(0, "dns_register_block_invoke", @"Registered WOL.", v50, v51, v52, v53, v54, v56);
LABEL_41:
        *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
        goto LABEL_24;
      }

      uint64_t v55 = @"WiFiManagerClientCreate failed.";
    }

    else
    {
      uint64_t v55 = @"IONotificationPortGetRunLoopSource failed for power notifications.";
    }
  }

  else
  {
    uint64_t v55 = @"IORegisterForSystemPower failed.";
  }

  sub_1000188F8((int)RunLoopSource, "dns_register_block_invoke", v55, v42, v43, v44, v45, v46, v56);
LABEL_24:
  if (v9) {
    CFRelease(v9);
  }
LABEL_26:
}

void sub_100005030( uint64_t a1, int a2, int a3, intptr_t notificationID, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  size_t v103 = 128LL;
  HIDWORD(v9) = a3;
  LODWORD(v9) = a3 + 536870288;
  switch((v9 >> 4))
  {
    case 0u:
      if (dword_100176128) {
        sub_1000188F8( 0,  "_sleep_wake_notification_callback",  @"Power notification: kIOMessageCanSystemSleep",  notificationID,  a5,  a6,  a7,  a8,  v102);
      }
      goto LABEL_8;
    case 1u:
      if (dword_100176128) {
        sub_1000188F8( 0,  "_sleep_wake_notification_callback",  @"Power notification: kIOMessageSystemWillSleep",  notificationID,  a5,  a6,  a7,  a8,  v102);
      }
      sub_1000058E4((void *)a1, 1, 1, 0LL, a5, a6, a7, a8, v102);
LABEL_8:
      IOReturn v12 = IOAllowPowerChange(*(_DWORD *)(a1 + 52), notificationID);
      if (v12) {
        sub_1000188F8( 0,  "_sleep_wake_notification_callback",  @"IOAllowPowerChange failed: 0x%08x",  v13,  v14,  v15,  v16,  v17,  v12);
      }
      return;
    case 2u:
      if (dword_100176128) {
        sub_1000188F8( 0,  "_sleep_wake_notification_callback",  @"Power notification: kIOMessageCanSystemSleep",  notificationID,  a5,  a6,  a7,  a8,  a9);
      }
      return;
    case 9u:
      sysctlbyname("kern.wakereason", v114, &v103, 0LL, 0LL);
      if (dword_100176128) {
        sub_1000188F8( 0,  "_sleep_wake_notification_callback",  @"Power notification: kIOMessageSystemHasPoweredOn (Wake Reason - %s)",  v18,  v19,  v20,  v21,  v22,  (char)v114);
      }
      BOOL v28 = (sub_10000D8A4( *(void *)a1,  @"com.apple.mobile.wireless_lockdown",  @"EnableWifiDebugging",  v18,  v19,  v20,  v21,  v22)
          || sub_10000D8A4( *(void *)a1,  @"com.apple.mobile.wireless_lockdown",  @"EnableWifiConnections",  v23,  v24,  v25,  v26,  v27))
         && *(void *)(a1 + 24) != 0LL;
      unsigned int v29 = sub_10000D8A4( *(void *)a1,  @"com.apple.mobile.wireless_lockdown",  @"EnableWifiPairing",  v23,  v24,  v25,  v26,  v27);
      if (v29 != 0 || !~v28) {
        sub_100004A24(a1, *(void *)(a1 + 24), v28, v29 != 0, 0LL);
      }
      clock_serv_t clock_serv = 0;
      mach_timespec_t cur_time = 0LL;
      uint64_t valuePtr = 0LL;
      mach_port_t v30 = mach_host_self();
      if (host_get_clock_service(v30, 0, &clock_serv))
      {
        uint64_t v36 = @"Failed to query clock service.";
LABEL_24:
        sub_1000188F8(0, "_did_wake_for_wifi_wake_packet", v36, v31, v32, v33, v34, v35, v102);
        return;
      }

      if (clock_get_time(clock_serv, &cur_time))
      {
        uint64_t v36 = @"Failed to get clock time.";
        goto LABEL_24;
      }

      uint64_t v37 = 1000 * cur_time.tv_sec;
      if (dword_100176128) {
        sub_1000188F8( 0,  "_did_wake_for_wifi_wake_packet",  @"Current time since boot: %lld.",  v31,  v32,  v33,  v34,  v35,  -24 * LOBYTE(cur_time.tv_sec));
      }
      uint64_t v38 = IOServiceMatching("AppleBCMWLANCore");
      if (!v38)
      {
        uint64_t v36 = @"Failed to query AppleBCMWLANCore service.";
        goto LABEL_24;
      }

      io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v38);
      io_object_t v40 = MatchingService;
      if (!MatchingService)
      {
        uint64_t v36 = @"Failed to get matching service.";
        goto LABEL_24;
      }

      CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty( MatchingService,  @"IO80211InterfaceWoWWakeUpParams",  kCFAllocatorDefault,  0);
      uint64_t v47 = CFProperty;
      if (!CFProperty)
      {
        sub_1000188F8( 0,  "_did_wake_for_wifi_wake_packet",  @"IORegistryEntryCreateCFProperty failed for %s.",  v42,  v43,  v44,  v45,  v46,  (char)"IO80211InterfaceWoWWakeUpParams");
        IOObjectRelease(v40);
        return;
      }

      if (dword_100176128) {
        sub_1000188F8( 0,  "_did_wake_for_wifi_wake_packet",  @"APPLE80211_REGKEY_WOW_WAKEUP_PARAMS: %@",  v42,  v43,  v44,  v45,  v46,  (char)CFProperty);
      }
      Value = (const __CFData *)CFDictionaryGetValue(v47, @"IO80211InterfaceWoWWakeUpData");
      uint64_t v54 = Value;
      if (!Value)
      {
        sub_1000188F8( 0,  "_did_wake_for_wifi_wake_packet",  @"Failed to query %s.",  v49,  v50,  v51,  v52,  v53,  (char)"IO80211InterfaceWoWWakeUpData");
        goto LABEL_41;
      }

      BytePtr = CFDataGetBytePtr(Value);
      CFIndex Length = CFDataGetLength(v54);
      if (Length <= 115)
      {
        sub_1000188F8(0, "_did_wake_for_wifi_wake_packet", @"Packet is too short.", v57, v58, v59, v60, v61, v102);
LABEL_41:
        CFRelease(v47);
        IOObjectRelease(v40);
        return;
      }

      unsigned int v62 = __rev16(*((unsigned __int16 *)BytePtr + 6));
      switch(v62)
      {
        case 0x86DDu:
          if (BytePtr[20] != 17)
          {
            sub_1000188F8( 0,  "_did_wake_for_wifi_wake_packet",  @"Unrecognized IPv6 protocol 0x%02X",  v57,  v58,  v59,  v60,  v61,  BytePtr[20]);
            goto LABEL_41;
          }

          v63 = BytePtr + 68;
          break;
        case 0x842u:
          v63 = BytePtr + 20;
          break;
        case 0x800u:
          if (BytePtr[23] != 17)
          {
            sub_1000188F8( 0,  "_did_wake_for_wifi_wake_packet",  @"Unrecognized IPv4 protocol 0x%02X",  v57,  v58,  v59,  v60,  v61,  BytePtr[23]);
            goto LABEL_41;
          }

          v63 = &BytePtr[4 * (BytePtr[14] & 0xF) + 28];
          break;
        default:
          sub_1000188F8( 0,  "_did_wake_for_wifi_wake_packet",  @"Unrecognized etherType 0x%04X",  v57,  v58,  v59,  v60,  v61,  v62);
          goto LABEL_41;
      }

      if (v63 + 96 > &BytePtr[Length])
      {
        sub_1000188F8(0, "_did_wake_for_wifi_wake_packet", @"Payload underrun.", v57, v58, v59, v60, v61, v102);
        goto LABEL_41;
      }

      if (qword_1001773B8 != -1)
      {
        v101 = v63;
        dispatch_once(&qword_1001773B8, &stru_100149F68);
        v63 = v101;
      }

      if (memcmp(v63, (const void *)qword_1001773B0, 0x60uLL))
      {
        sub_1000188F8(0, "_did_wake_for_wifi_wake_packet", @"Not a WOL packet.", v64, v65, v66, v67, v68, v102);
        goto LABEL_41;
      }

      v69 = CFDictionaryGetValue(v47, @"IO80211InterfaceWoWWakeUpTimeStamp");
      if (!sub_10000EFA4(v69))
      {
        sub_1000188F8( 0,  "_did_wake_for_wifi_wake_packet",  @"Failed to query %s.",  v70,  v71,  v72,  v73,  v74,  (char)"IO80211InterfaceWoWWakeUpTimeStamp");
        goto LABEL_41;
      }

      if (!CFNumberGetValue((CFNumberRef)v69, kCFNumberLongLongType, &valuePtr))
      {
        sub_1000188F8( 0,  "_did_wake_for_wifi_wake_packet",  @"Failed to convert to integer.",  v75,  v76,  v77,  v78,  v79,  v102);
        goto LABEL_41;
      }

      if (qword_1001773A8)
      {
        if (valuePtr == qword_1001773A8)
        {
          sub_1000188F8( 0,  "_did_wake_for_wifi_wake_packet",  @"Wake time did not change: %lld",  v75,  v76,  v77,  v78,  v79,  qword_1001773A8);
          goto LABEL_41;
        }

        v80 = @"New Wake time: %lld";
      }

      else
      {
        v80 = @"note the time for future reference: %lld";
      }

      sub_1000188F8(0, "_did_wake_for_wifi_wake_packet", v80, v75, v76, v77, v78, v79, valuePtr);
      uint64_t v86 = valuePtr;
      qword_1001773A8 = valuePtr;
      if (dword_100176128)
      {
        sub_1000188F8( 0,  "_did_wake_for_wifi_wake_packet",  @"Wake time since boot: %lld.",  v81,  v82,  v83,  v84,  v85,  valuePtr);
        uint64_t v86 = valuePtr;
      }

      uint64_t v87 = v86 - v37;
      if (v87 >= 0) {
        unint64_t v88 = v87;
      }
      else {
        unint64_t v88 = -v87;
      }
      sub_1000188F8( 0,  "_did_wake_for_wifi_wake_packet",  @"Wake time difference: %lld.",  v81,  v82,  v83,  v84,  v85,  v88);
      if (v88 > 0x7CF) {
        goto LABEL_41;
      }
      sub_1000188F8( 0,  "_did_wake_for_wifi_wake_packet",  @"waker was: %02x:%02x:%02x:%02x:%02x:%02x",  v89,  v90,  v91,  v92,  v93,  BytePtr[6]);
      CFRelease(v47);
      IOObjectRelease(v40);
      uint64_t valuePtr = 0LL;
      p_uint64_t valuePtr = &valuePtr;
      uint64_t v112 = 0x2020000000LL;
      int v113 = 0;
      if (qword_1001773C8 != -1) {
        dispatch_once(&qword_1001773C8, &stru_100149F88);
      }
      IOReturn v94 = IOPMAssertionCreateWithDescription( @"PreventUserIdleSystemSleep",  @"com.apple.mobile.lockdownd.wake-on-wlan",  @"The 411 on sync.",  0LL,  0LL,  0.0,  0LL,  (IOPMAssertionID *)p_valuePtr + 6);
      if (v94)
      {
        sub_1000188F8( 0,  "_takePowerAssertionForInterval",  @"IOPMAssertionCreateWithDescription failed with %d",  v95,  v96,  v97,  v98,  v99,  v94);
      }

      else
      {
        if (dword_100176128) {
          sub_1000188F8( 0,  "_takePowerAssertionForInterval",  @"Aquired %ld second power assertion.",  v95,  v96,  v97,  v98,  v99,  30);
        }
        dispatch_time_t v100 = dispatch_time(0LL, 30000000000LL);
        mach_timespec_t cur_time = (mach_timespec_t)_NSConcreteStackBlock;
        uint64_t v106 = 3221225472LL;
        v107 = sub_10000C2A0;
        v108 = &unk_100149ED8;
        v109 = &valuePtr;
        dispatch_after(v100, (dispatch_queue_t)qword_1001773C0, &cur_time);
      }

      _Block_object_dispose(&valuePtr, 8);
      return;
    case 0xBu:
      return;
    default:
      sub_1000188F8( 0,  "_sleep_wake_notification_callback",  @"Unknown power notification: %d",  notificationID,  a5,  a6,  a7,  a8,  a3);
      return;
  }

void sub_100005894( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_1000058E4( void *a1, char a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1 && *a1 && (unint64_t v9 = (dispatch_queue_s *)a1[2]) != 0LL)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100005978;
    v10[3] = &unk_100149B60;
    char v11 = a2;
    char v12 = a3;
    v10[4] = a1;
    char v13 = a4;
    dispatch_sync(v9, v10);
  }

  else
  {
    sub_1000188F8(0, "dns_unregister", @"Invalid input.", a4, a5, a6, a7, a8, a9);
  }

void sub_100005978( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (*(_BYTE *)(a1 + 40))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (*(_BYTE *)(v10 + 32))
    {
      *(_BYTE *)(v10 + 32) = 0;
      xpc_set_event("com.apple.bonjour.registration", "LOCKDOWN.BONJOUR", 0LL);
      sub_1000188F8( 0,  "dns_unregister_block_invoke",  @"Unregistered DNS (syncing).",  v11,  v12,  v13,  v14,  v15,  v27);
    }
  }

  else if (!*(_BYTE *)(a1 + 41))
  {
    goto LABEL_8;
  }

  if (*(_BYTE *)(a1 + 41))
  {
    uint64_t v16 = *(void *)(a1 + 32);
    if (*(_BYTE *)(v16 + 33))
    {
      *(_BYTE *)(v16 + 33) = 0;
      xpc_set_event("com.apple.bonjour.registration", "LOCKDOWN.PAIRING.BONJOUR", 0LL);
      sub_1000188F8( 0,  "dns_unregister_block_invoke",  @"Unregistered DNS (pairing).",  v17,  v18,  v19,  v20,  v21,  v27);
    }
  }

LABEL_8:
  if (*(_BYTE *)(a1 + 42))
  {
    uint64_t v22 = *(void *)(a1 + 32);
    if (*(_DWORD *)(v22 + 48))
    {
      IOReturn v23 = IODeregisterForSystemPower((io_object_t *)(v22 + 48));
      if (v23) {
        sub_1000188F8( 0,  "dns_unregister_block_invoke",  @"IODeregisterForSystemPower failed: %d",  a4,  a5,  a6,  a7,  a8,  v23);
      }
      uint64_t v22 = *(void *)(a1 + 32);
      *(_DWORD *)(v22 + 4_Block_object_dispose(va, 8) = 0;
    }

    uint64_t v24 = *(IONotificationPort **)(v22 + 40);
    if (v24)
    {
      IONotificationPortDestroy(v24);
      *(void *)(*(void *)(a1 + 32) + 40LL) = 0LL;
      uint64_t v22 = *(void *)(a1 + 32);
    }

    io_connect_t v25 = *(_DWORD *)(v22 + 52);
    if (v25)
    {
      IOServiceClose(v25);
      uint64_t v22 = *(void *)(a1 + 32);
      *(_DWORD *)(v22 + 52) = 0;
    }

    uint64_t v26 = *(const void **)(v22 + 56);
    if (v26)
    {
      CFRelease(v26);
      uint64_t v22 = *(void *)(a1 + 32);
    }

    *(void *)(v22 + 56) = 0LL;
    sub_1000188F8(0, "dns_unregister_block_invoke", @"Unregistered WOL.", a4, a5, a6, a7, a8, a9);
  }

    sub_100005E10( @"LockdownSetLanguage",  kCFBooleanTrue,  @"com.apple.purplebuddy",  v16,  v17,  v18,  v19,  v20,  v29);
    sub_100005E10(@"AppleLanguages", Mutable, kCFPreferencesAnyApplication, v23, v24, v25, v26, v27, v30);
    sub_10000F56C(@"com.apple.language.changed");
    sub_10000F56C(@"AppleLanguagePreferencesChangedNotification");
    if (!v10) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  sub_1000188F8( 0,  "set_language",  @"Failed to copy language list, creating new one.",  v11,  v12,  v13,  v14,  v15,  v28);
  Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  if (Mutable)
  {
    sub_1000188F8(0, "set_language", @"Creating a language with with %@", v16, v17, v18, v19, v20, (char)a2);
    CFArrayAppendValue(Mutable, a2);
    goto LABEL_8;
  }

  uint64_t v22 = @"Failed to create array.";
LABEL_14:
  sub_1000188F8(0, "set_language", v22, v16, v17, v18, v19, v20, v29);
  if (v10) {
LABEL_9:
  }
    CFRelease(v10);
LABEL_10:
  if (Mutable) {
    CFRelease(Mutable);
  }
}

uint64_t sub_100005AE0()
{
  CFPropertyListRef v6 = sub_100018F28(@"LastSystemVersion", @"com.apple.migration", v0, v1, v2, v3, v4, v5);
  if (!v6) {
    return 0LL;
  }
  uint64_t v7 = v6;
  uint64_t v8 = (const void *)MGCopyAnswer(@"BuildVersion", 0LL);
  if (!sub_10000F040(v8))
  {
    BOOL v9 = 0LL;
    if (!v8) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  BOOL v9 = CFEqual(v7, v8) != 0;
  if (v8) {
LABEL_5:
  }
    CFRelease(v8);
LABEL_6:
  CFRelease(v7);
  return v9;
}

uint64_t sub_100005B98( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || !a2)
  {
    uint64_t v10 = @"Invalid input(s).";
    int v9 = 0;
LABEL_9:
    sub_1000188F8(v9, "notify_configd", v10, a4, a5, a6, a7, a8, v12);
    return byte_100177358;
  }

  if (qword_100177360 != -1) {
    dispatch_once(&qword_100177360, &stru_100149BA0);
  }
  int v9 = qword_100177350;
  if (!qword_100177350)
  {
    uint64_t v10 = @"Failed to create queue.";
    goto LABEL_9;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005C94;
  block[3] = &unk_100149BC0;
  block[4] = a2;
  dispatch_sync((dispatch_queue_t)qword_100177350, block);
  return byte_100177358;
}

void sub_100005C68(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.lockdownd.configd", 0LL);
  uint64_t v2 = (void *)qword_100177350;
  qword_100177350 = (uint64_t)v1;
}

void sub_100005C94( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int out_token = -1;
  if (*(void *)(a1 + 32))
  {
    if ((byte_100177358 & 1) == 0)
    {
      if (notify_register_check("com.apple.mobile.lockdown", &out_token))
      {
        sub_1000188F8( 0,  "notify_configd_block_invoke_2",  @"Failed to register notification (%s): %d",  v9,  v10,  v11,  v12,  v13,  (char)"com.apple.mobile.lockdown");
      }

      else
      {
        notify_set_state(out_token, 1uLL);
        notify_post("com.apple.mobile.lockdown");
        CFTypeRef cf = 0LL;
        IOUSBDeviceControllerCreate(0LL, &cf);
        if (cf)
        {
          int v14 = IOUSBDeviceControllerForceOffBus(cf, 0LL);
          if (v14) {
            sub_1000188F8( 0,  "allow_usb_on_bus",  @"IOUSBDeviceControllerForceOffBus returned: %d",  v15,  v16,  v17,  v18,  v19,  v14);
          }
          CFRelease(cf);
        }

        else
        {
          NSLog(@"we failed to create an IOUSBDeviceController");
        }

        sub_1000188F8( 0,  "notify_configd_block_invoke_2",  @"Pinged configd, USB is now enabled.",  v20,  v21,  v22,  v23,  v24,  v25);
        byte_100177358 = 1;
      }
    }
  }

  else
  {
    sub_1000188F8(0, "notify_configd_block_invoke_2", @"Invalid input.", a4, a5, a6, a7, a8, a9);
  }

void sub_100005DBC( const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1)
  {
    sub_100005E10(@"DiagnosticsAllowed", a1, @"com.apple.iqagent", a4, a5, a6, a7, a8, vars0);
    sub_10000F56C(@"com.apple.iqagent.IQAllowedChangeNotification");
  }

  else
  {
    sub_1000188F8(0, "set_iqagent", @"Invalid input.", a4, a5, a6, a7, a8, a9);
  }

void sub_100005E10( const void *a1, const void *a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11 = (const __CFString *)sub_10000F040(a1);
  uint64_t v12 = (const __CFString *)sub_10000F040(a3);
  uint64_t v18 = @"bogus request";
  if (v11 && v12)
  {
    uint64_t v18 = @"Could not set preference via lockbot";
  }

  sub_1000188F8(0, "_set_mobile_preference", v18, v13, v14, v15, v16, v17, a9);
}

uint64_t sub_100005E94()
{
  if (IOMasterPort(bootstrap_port, &mainPort))
  {
    uint64_t v5 = @"Could not get master port";
LABEL_3:
    sub_1000188F8(0, "disable_auto_boot", v5, v0, v1, v2, v3, v4, v22);
    return 0xFFFFFFFFLL;
  }

  io_registry_entry_t v7 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  if (!v7)
  {
    uint64_t v5 = @"Could not get options entry from the device tree";
    goto LABEL_3;
  }

  io_registry_entry_t v8 = v7;
  CFDataRef v9 = CFDataCreate(0LL, (const UInt8 *)"false", 5LL);
  if (v9)
  {
    CFDataRef v15 = v9;
    if (IORegistryEntrySetCFProperty(v8, @"auto-boot", v9))
    {
      sub_1000188F8(0, "disable_auto_boot", @"Could not set auto-boot setting", v16, v17, v18, v19, v20, v22);
      uint64_t v6 = 0xFFFFFFFFLL;
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    CFRelease(v15);
  }

  else
  {
    sub_1000188F8(0, "disable_auto_boot", @"Could not create CFData", v10, v11, v12, v13, v14, v22);
    uint64_t v6 = 0xFFFFFFFFLL;
  }

  IOObjectRelease(v8);
  return v6;
}

__CFDictionary *sub_100005FA8(uint64_t a1, const void *a2, const void *a3)
{
  uint64_t v46 = 0LL;
  uint64_t v47 = 0LL;
  uint64_t v43 = 0LL;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x2020000000LL;
  if ((sub_100006500(a3, @"NANDInfo", &v47, &stru_100149C00) & 1) == 0)
  {
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_1000066A8;
    v42[3] = &unk_100149C20;
    v42[4] = a1;
    if ((sub_100006500(a3, @"CalculateDiskUsage", &v47, v42) & 1) == 0)
    {
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_1000068AC;
      v41[3] = &unk_100149C48;
      v41[4] = &v43;
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472LL;
      v39[2] = sub_10000692C;
      v39[3] = &unk_100149C70;
      uint64_t v6 = objc_retainBlock(v41);
      id v40 = v6;
      char v7 = sub_100006500(a3, @"TotalSystemCapacity", &v47, v39);

      if ((v7 & 1) == 0)
      {
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472LL;
        v37[2] = sub_100006944;
        v37[3] = &unk_100149C70;
        io_registry_entry_t v8 = v6;
        id v38 = v8;
        char v9 = sub_100006500(a3, @"TotalSystemAvailable", &v47, v37);

        if ((v9 & 1) == 0)
        {
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472LL;
          v35[2] = sub_10000695C;
          v35[3] = &unk_100149C70;
          uint64_t v10 = v8;
          id v36 = v10;
          char v11 = sub_100006500(a3, @"TotalDataCapacity", &v47, v35);

          if ((v11 & 1) == 0)
          {
            v33[0] = _NSConcreteStackBlock;
            v33[1] = 3221225472LL;
            v33[2] = sub_100006974;
            v33[3] = &unk_100149C70;
            uint64_t v12 = v10;
            id v34 = v12;
            char v13 = sub_100006500(a3, @"TotalDataAvailable", &v47, v33);

            if ((v13 & 1) == 0)
            {
              v31[0] = _NSConcreteStackBlock;
              v31[1] = 3221225472LL;
              v31[2] = sub_10000698C;
              v31[3] = &unk_100149C70;
              uint64_t v14 = v12;
              id v32 = v14;
              char v15 = sub_100006500(a3, @"TotalDiskCapacity", &v47, v31);

              if ((v15 & 1) == 0)
              {
                v29[0] = _NSConcreteStackBlock;
                v29[1] = 3221225472LL;
                v29[2] = sub_1000069A4;
                v29[3] = &unk_100149C70;
                uint64_t v16 = v14;
                id v30 = v16;
                char v17 = sub_100006500(a3, @"AmountDataReserved", &v47, v29);

                if ((v17 & 1) == 0)
                {
                  v27[0] = _NSConcreteStackBlock;
                  v27[1] = 3221225472LL;
                  v27[2] = sub_1000069BC;
                  v27[3] = &unk_100149C70;
                  uint64_t v18 = v16;
                  id v28 = v18;
                  char v19 = sub_100006500(a3, @"AmountDataAvailable", &v47, v27);

                  if ((v19 & 1) == 0)
                  {
                    v25[0] = _NSConcreteStackBlock;
                    v25[1] = 3221225472LL;
                    v25[2] = sub_1000069D4;
                    v25[3] = &unk_100149C70;
                    uint64_t v26 = v18;
                    char v20 = sub_100006500(a3, @"AmountRestoreAvailable", &v47, v25);

                    if ((v20 & 1) == 0)
                    {
                      if (CFEqual(a2, @"com.apple.disk_usage.factory"))
                      {
                        if ((sub_100006500(a3, @"PhotoUsage", &v47, &stru_100149C90) & 1) == 0
                          && (sub_100006500(a3, @"CameraUsage", &v47, &stru_100149CB0) & 1) == 0)
                        {
                          uint64_t v48 = _NSConcreteStackBlock;
                          uint64_t v49 = 3221225472LL;
                          uint64_t v50 = sub_10000BD7C;
                          uint64_t v51 = &unk_100149C20;
                          uint64_t v52 = "/var/mobile/Library/Calendar";
                          if ((sub_100006500(a3, @"CalendarUsage", &v47, &v48) & 1) == 0)
                          {
                            uint64_t v48 = _NSConcreteStackBlock;
                            uint64_t v49 = 3221225472LL;
                            uint64_t v50 = sub_10000BD7C;
                            uint64_t v51 = &unk_100149C20;
                            uint64_t v52 = "/var/mobile/Library/Voicemail";
                            if ((sub_100006500(a3, @"VoicemailUsage", &v47, &v48) & 1) == 0)
                            {
                              uint64_t v48 = _NSConcreteStackBlock;
                              uint64_t v49 = 3221225472LL;
                              uint64_t v50 = sub_10000BD7C;
                              uint64_t v51 = &unk_100149C20;
                              uint64_t v52 = "/var/mobile/Library/Notes";
                              if ((sub_100006500(a3, @"NotesUsage", &v47, &v48) & 1) == 0)
                              {
                                uint64_t v48 = _NSConcreteStackBlock;
                                uint64_t v49 = 3221225472LL;
                                uint64_t v50 = sub_10000BD7C;
                                uint64_t v51 = &unk_100149C20;
                                uint64_t v52 = "/var/mobile/tmp/com.apple.mediaplaybackd/MediaCache";
                                if ((sub_100006500(a3, @"MediaCacheUsage", &v47, &v48) & 1) == 0)
                                {
                                  uint64_t v48 = _NSConcreteStackBlock;
                                  uint64_t v49 = 3221225472LL;
                                  uint64_t v50 = sub_10000BD7C;
                                  uint64_t v51 = &unk_100149C20;
                                  uint64_t v52 = "/var/mobile/Library/Caches/com.apple.WebAppCache";
                                  sub_100006500(a3, @"WebAppCacheUsage", &v47, &v48);
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  uint64_t v21 = v44;
  char v22 = (const void *)v44[3];
  if (v22)
  {
    CFRelease(v22);
    uint64_t v21 = v44;
  }

  v21[3] = 0LL;
  uint64_t v23 = v47;
  _Block_object_dispose(&v43, 8);
  return v23;
}

void sub_1000064E4(_Unwind_Exception *a1)
{
}

uint64_t sub_100006500(const void *a1, const void *a2, __CFDictionary **a3, void *a4)
{
  char v7 = a4;
  io_registry_entry_t v8 = v7;
  if (!a1)
  {
    uint64_t v16 = v7[2](v7);
    if (v16)
    {
      char v22 = (const void *)v16;
      uint64_t v23 = *a3;
      if (*a3 || (uint64_t v23 = sub_100023A08(), (*a3 = v23) != 0LL)) {
        CFDictionarySetValue(v23, a2, v22);
      }
      CFRelease(v22);
    }

    else
    {
      sub_1000188F8(0, "set_stat_if_wanted", @"Could not get value for %@", v17, v18, v19, v20, v21, (char)a2);
    }

    goto LABEL_12;
  }

  if (!CFEqual(a1, a2))
  {
LABEL_12:
    uint64_t v15 = 0LL;
    goto LABEL_13;
  }

  uint64_t v14 = v8[2](v8);
  if (!v14) {
    sub_1000188F8(0, "set_stat_if_wanted", @"Could not get value for %@", v9, v10, v11, v12, v13, (char)a2);
  }
  *a3 = (__CFDictionary *)v14;
  uint64_t v15 = 1LL;
LABEL_13:

  return v15;
}

void *__cdecl sub_1000065EC(id a1)
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v7 = 0LL;
  if (qword_100177390 != -1) {
    dispatch_once(&qword_100177390, &stru_100149EB0);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000BD50;
  block[3] = &unk_100149ED8;
  block[4] = &v4;
  dispatch_sync((dispatch_queue_t)qword_100177388, block);
  uint64_t v1 = (void *)v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

CFTypeRef sub_1000066A8(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  io_registry_entry_t v8 = v2;
  if (!v2)
  {
    uint64_t v10 = @"Failed to create dictionary.";
LABEL_6:
    sub_1000188F8((int)v2, "copy_disk_usage_block_invoke_2", v10, v3, v4, v5, v6, v7, v12);
    CFTypeRef v9 = 0LL;
    goto LABEL_7;
  }

  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v8, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_BOOL(v8, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v8, XPC_ACTIVITY_REQUIRES_CLASS_C, 0);
  xpc_dictionary_set_int64(v8, XPC_ACTIVITY_DELAY, 0LL);
  xpc_dictionary_set_int64(v8, XPC_ACTIVITY_GRACE_PERIOD, 10LL);
  if ((sub_1000067D4(*(void *)(a1 + 32), v8, 0) & 1) == 0)
  {
    uint64_t v10 = @"Failed to schedule application disk usage XPC activity.";
    LODWORD(v2) = 0;
    goto LABEL_6;
  }

  CFTypeRef v9 = CFRetain(@"OkilyDokily");
LABEL_7:

  return v9;
}

uint64_t sub_1000067D4(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  id v6 = sub_100006A40();
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100006A8C;
  v11[3] = &unk_100149D38;
  uint64_t v13 = &v16;
  uint64_t v14 = a1;
  id v12 = v5;
  char v15 = a3;
  id v8 = v5;
  dispatch_sync(v7, v11);

  uint64_t v9 = *((unsigned __int8 *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v9;
}

const void *sub_1000068AC(uint64_t a1, void *key)
{
  uint64_t v4 = *(const __CFDictionary **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (!v4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = MGCopyAnswer(@"DiskUsage", 0LL);
    uint64_t v4 = *(const __CFDictionary **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
    if (!v4) {
      return 0LL;
    }
  }

  Value = CFDictionaryGetValue(v4, key);
  id v6 = Value;
  if (Value) {
    CFRetain(Value);
  }
  return v6;
}

uint64_t sub_10000692C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100006944(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10000695C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100006974(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10000698C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_1000069A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_1000069BC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_1000069D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void *__cdecl sub_1000069EC(id a1)
{
  return (void *)sub_10000B468();
}

void *__cdecl sub_1000069FC(id a1)
{
  return (void *)sub_10000B468();
}

void sub_100006A0C()
{
  id v0 = sub_100006A40();
  uint64_t v1 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v0);
  dispatch_async(v1, &stru_100149CD0);
}

id sub_100006A40()
{
  if (qword_1001773A0 != -1) {
    dispatch_once(&qword_1001773A0, &stru_100149EF8);
  }
  return (id)qword_100177398;
}

void sub_100006A80(id a1)
{
  byte_100177368 = 0;
}

void sub_100006A8C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (byte_100177368 == 1)
  {
    uint64_t v3 = sub_10000D980(v2, @"com.apple.disk_usage", @"MobileApplicationUsage");
    sub_100006B20(*(void *)(a1 + 48), v3);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

  else
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = sub_100021064( v2,  "com.apple.lockdownd.usage",  *(void **)(a1 + 32),  *(_BYTE *)(a1 + 56),  &stru_100149D10);
  }

void sub_100006B20(uint64_t a1, uint64_t a2)
{
  id v4 = sub_100006A40();
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  dispatch_assert_queue_V2(v5);

  sub_10000CF4C(a1, (uint64_t)@"com.apple.disk_usage", (uint64_t)@"MobileApplicationUsage", a2);
  sub_10000CF4C(a1, (uint64_t)@"com.apple.disk_usage.factory", (uint64_t)@"MobileApplicationUsage", a2);
  byte_100177368 = 1;
}

void sub_100006BAC(id a1, _data_ark *a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = sub_10000BF50;
  id v12 = sub_10000BF60;
  id v13 = 0LL;
  uint64_t v3 = os_transaction_create("com.apple.lockdownd.usage");
  id v4 = (void *)v9[5];
  v9[5] = v3;

  id v5 = sub_100006A40();
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000BF68;
  v7[3] = &unk_100149F48;
  v7[4] = &v8;
  v7[5] = a2;
  dispatch_async(v6, v7);

  _Block_object_dispose(&v8, 8);
}

void sub_100006C7C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

char *sub_100006C94(char *result)
{
  return result;
}

CFStringRef sub_100006CB0(const __CFString *a1)
{
  if (sub_10000F040(a1) && CFStringGetLength(a1) <= 63 && CFStringGetLength(a1) >= 1)
  {
    MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0LL, a1);
    if (MutableCopy)
    {
      uint64_t v8 = (__CFString *)MutableCopy;
      v32.length = CFStringGetLength(MutableCopy);
      v32.location = 0LL;
      CFStringFindAndReplace(v8, @" ", @"-", v32, 0LL);
      v33.length = CFStringGetLength(v8);
      v33.location = 0LL;
      CFStringFindAndReplace(v8, @"_", @"-", v33, 0LL);
      v34.length = CFStringGetLength(v8);
      v34.location = 0LL;
      CFStringFindAndReplace(v8, @"--", @"-", v34, 0LL);
      CFStringTrim(v8, @"-");
      uint64_t Length = CFStringGetLength(v8);
      if (Length < 1) {
        goto LABEL_24;
      }
      v31.length = Length;
      v31.location = 0LL;
      CFStringTokenizerRef v15 = CFStringTokenizerCreate(0LL, v8, v31, 0x10004uLL, 0LL);
      if (v15)
      {
        uint64_t v16 = v15;
        CFMutableStringRef Mutable = CFStringCreateMutable(0LL, 0LL);
        while (CFStringTokenizerAdvanceToNextToken(v16))
        {
          uint64_t v18 = (const __CFString *)CFStringTokenizerCopyCurrentTokenAttribute(v16, 0x10000uLL);
          if (v18)
          {
            char v19 = v18;
            CFStringAppend(Mutable, v18);
            CFRelease(v19);
          }
        }

        CFRelease(v16);
        if (!Mutable) {
          goto LABEL_24;
        }
      }

      else
      {
        CFMutableStringRef Mutable = CFStringCreateMutableCopy(0LL, 0LL, v8);
        if (!Mutable) {
          goto LABEL_24;
        }
      }

      range.location = 0LL;
      range.length = CFStringGetLength(Mutable);
      CFStringTransform(Mutable, &range, @"Latin; NFD; [^-_a-zA-Z0-9] Remove", 0);
      uint64_t v22 = CFStringGetLength(Mutable);
      if (v22 >= 255) {
        v23.length = 255LL;
      }
      else {
        v23.length = v22;
      }
      range.location = 0LL;
      range.length = v23.length;
      v23.location = 0LL;
      uint64_t v20 = CFStringCreateWithSubstring(0LL, Mutable, v23);
      CFRelease(Mutable);
      if (v20)
      {
        if (CFStringGetLength(v20) && CFStringGetLength(v20) < 64)
        {
LABEL_26:
          CFRelease(v8);
          return v20;
        }

        CFRelease(v20);
      }

CFStringRef sub_100006F44( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_100177378 != -1) {
    dispatch_once(&qword_100177378, &stru_100149D58);
  }
  if (qword_100177370)
  {
    CFStringRef result = SCDynamicStoreCopyComputerName((SCDynamicStoreRef)qword_100177370, 0LL);
    if (result) {
      return result;
    }
    int v9 = SCError();
    char v10 = SCErrorString(v9);
    sub_1000188F8( 0,  "copy_device_name",  @"SCDynamicStoreCopyComputerName failed: %s",  v11,  v12,  v13,  v14,  v15,  v10);
  }

  else
  {
    sub_1000188F8(0, "copy_device_name", @"Failed to create dynamic store.", a4, a5, a6, a7, a8, v16);
  }

  return 0LL;
}

void sub_100006FD8(id a1)
{
  qword_100177370 = (uint64_t)SCDynamicStoreCreate(0LL, @"lockdownd", 0LL, 0LL);
}

uint64_t sub_100007008( const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v8 = a1;
    int v9 = SCPreferencesCreate(0LL, @"com.apple.mobile.lockdown", 0LL);
    if (v9)
    {
      char v10 = v9;
      if (SCPreferencesLock(v9, 1u))
      {
        if (!SCPreferencesSetComputerName(v10, v8, 0x8000100u))
        {
          int v11 = SCError();
          SCErrorString(v11);
          sub_1000188F8( 0,  "set_device_name",  @"SCPreferencesSetComputerName failed (%@): %s",  v12,  v13,  v14,  v15,  v16,  (char)v8);
        }

        uint64_t v17 = sub_100006CB0(v8);
        if (v17)
        {
          CFRange v23 = v17;
          if (!SCPreferencesSetHostName(v10, v17))
          {
            int v24 = SCError();
            SCErrorString(v24);
            sub_1000188F8( 0,  "set_device_name",  @"SCPreferencesSetHostName failed (%@): %s",  v25,  v26,  v27,  v28,  v29,  (char)v23);
          }

          if (!SCPreferencesSetLocalHostName(v10, v23))
          {
            int v30 = SCError();
            SCErrorString(v30);
            sub_1000188F8( 0,  "set_device_name",  @"SCPreferencesSetLocalHostName failed (%@): %s",  v31,  v32,  v33,  v34,  v35,  (char)v23);
          }

          if (SCPreferencesCommitChanges(v10))
          {
            if (SCPreferencesApplyChanges(v10))
            {
              uint64_t v36 = 1LL;
LABEL_23:
              SCPreferencesUnlock(v10);
              CFRelease(v23);
              goto LABEL_24;
            }

            uint64_t v46 = @"SCPreferencesApplyChanges failed: %s";
          }

          else
          {
            uint64_t v46 = @"SCPreferencesCommitChanges failed: %s";
          }

          int v47 = SCError();
          char v48 = SCErrorString(v47);
          sub_1000188F8(0, "set_device_name", v46, v49, v50, v51, v52, v53, v48);
          uint64_t v36 = 0LL;
          goto LABEL_23;
        }

        sub_1000188F8(0, "set_device_name", @"Failed to sanitize device name.", v18, v19, v20, v21, v22, v55);
        SCPreferencesUnlock(v10);
      }

      else
      {
        int v39 = SCError();
        char v40 = SCErrorString(v39);
        sub_1000188F8(0, "set_device_name", @"SCPreferencesLock failed: %s", v41, v42, v43, v44, v45, v40);
      }

      uint64_t v36 = 0LL;
LABEL_24:
      CFRelease(v10);
      return v36;
    }

    int v38 = SCError();
    char v55 = SCErrorString(v38);
    uint64_t v37 = @"SCPreferencesCreate failed: %s";
    LODWORD(a1) = 0;
  }

  else
  {
    uint64_t v37 = @"Invalid input.";
  }

  sub_1000188F8((int)a1, "set_device_name", v37, a4, a5, a6, a7, a8, v55);
  return 0LL;
}

CFDataRef sub_100007214(dispatch_queue_s **a1)
{
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  int v19 = 4096;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100007498;
  v15[3] = &unk_100149D80;
  v15[4] = &v16;
  v15[5] = bytes;
  int v1 = sub_10000735C(a1, v15);
  if (v1)
  {
    sub_1000188F8( 0,  "extract_cesm_certificate",  @"Could not get certificate chain from vault: %ld",  v2,  v3,  v4,  v5,  v6,  v1);
    goto LABEL_4;
  }

  CFDataRef v12 = CFDataCreate(0LL, bytes, *((unsigned int *)v17 + 6));
  if (!v12)
  {
    sub_1000188F8( 0,  "extract_cesm_certificate",  @"Could not create CFData from cert chain",  v7,  v8,  v9,  v10,  v11,  v14);
LABEL_4:
    CFDataRef v12 = 0LL;
  }

  _Block_object_dispose(&v16, 8);
  return v12;
}

void sub_100007340( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

uint64_t sub_10000735C(dispatch_queue_s **a1, void *a2)
{
  uint64_t v3 = a2;
  unsigned int valuePtr = 0;
  uint64_t v4 = @"Could not find context in ark";
  char v5 = 1;
  while (1)
  {
    char v6 = v5;
    uint64_t v7 = (const void *)sub_10000D238( (uint64_t)a1,  (uint64_t)@"com.apple.fairplay",  (uint64_t)@"FairPlayContextID");
    if (!sub_10000EFA4(v7)) {
      goto LABEL_10;
    }
    if (!CFNumberGetValue((CFNumberRef)v7, kCFNumberIntType, &valuePtr))
    {
      uint64_t v4 = @"Could not convert context";
LABEL_10:
      sub_1000188F8(0, "retryFairplay", v4, v8, v9, v10, v11, v12, v28);
      if (v7) {
        CFRelease(v7);
      }
LABEL_6:
      uint64_t v26 = 4294925264LL;
      goto LABEL_8;
    }

    CFRelease(v7);
    uint64_t v13 = v3[2](v3, valuePtr);
    if ((_DWORD)v13 != -42032) {
      break;
    }
    sub_1000188F8(0, "retryFairplay", @"Context died", v14, v15, v16, v17, v18, v28);
    sub_100010E74(a1, v19, v20, v21, v22, v23, v24, v25, v29);
    char v5 = 0;
    if ((v6 & 1) == 0) {
      goto LABEL_6;
    }
  }

  uint64_t v26 = v13;
LABEL_8:

  return v26;
}

void sub_100007498(uint64_t a1, uint64_t a2)
{
}

CFNumberRef sub_1000074B4()
{
  if (gettimeofday(&v9, 0LL))
  {
    char v5 = @"Could not get current time";
    LODWORD(result) = 0;
LABEL_3:
    sub_1000188F8((int)result, "copy_time_since_bowie", v5, v0, v1, v2, v3, v4, v7);
    return 0LL;
  }

  double valuePtr = (double)v9.tv_usec / 1000000.0 + (double)v9.tv_sec;
  CFNumberRef result = CFNumberCreate(0LL, kCFNumberDoubleType, &valuePtr);
  if (!result)
  {
    char v5 = @"Could not create CFNumber";
    goto LABEL_3;
  }

  return result;
}

uint64_t sub_100007548( int a1, CFNumberRef number, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  double valuePtr = 0.0;
  if (number && CFNumberGetValue(number, kCFNumberDoubleType, &valuePtr))
  {
    TMSetSourceTime(type metadata for __ObjC, valuePtr - kCFAbsoluteTimeIntervalSince1970, 60.0);
    sub_10000F56C(@"SignificantTimeChangeNotification");
    return 0LL;
  }

  else
  {
    sub_1000188F8(0, "set_time_since_bowie", @"Failed to get number.", a4, a5, a6, a7, a8, v9);
    return 0xFFFFFFFFLL;
  }

CFStringRef sub_1000075D8()
{
  uint64_t v0 = CFTimeZoneCopySystem();
  if (v0)
  {
    char v6 = v0;
    CFStringRef Name = CFTimeZoneGetName(v0);
    CFStringRef v13 = Name;
    if (Name) {
      CFRetain(Name);
    }
    else {
      sub_1000188F8(0, "copy_timezone", @"Could not get time zone name", v8, v9, v10, v11, v12, v15);
    }
    CFRelease(v6);
  }

  else
  {
    sub_1000188F8(0, "copy_timezone", @"Could not copy system time zone", v1, v2, v3, v4, v5, v15);
    return 0LL;
  }

  return v13;
}

uint64_t sub_100007654( int a1, CFStringRef theString, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!theString)
  {
    uint64_t v9 = @"Invalid input.";
    goto LABEL_5;
  }

  if (CFStringFind(theString, @".", 0LL).location != -1)
  {
    uint64_t v9 = @"Timezone shenanigans.";
LABEL_5:
    sub_1000188F8(0, "set_timezone", v9, a4, a5, a6, a7, a8, v11);
    return 0xFFFFFFFFLL;
  }

  TMSetSourceTimeZone(type metadata for __ObjC, theString);
  return 0LL;
}

CFBooleanRef sub_1000076DC()
{
  CFPropertyListRef v0 = sub_10000772C(@"AppleICUForce24HourTime", 0LL);
  if (!sub_10000F0A8(v0))
  {
    if (v0) {
      CFRelease(v0);
    }
    return kCFBooleanFalse;
  }

  return (CFBooleanRef)v0;
}

CFPropertyListRef sub_10000772C(const void *a1, const void *a2)
{
  uint64_t v3 = (const __CFString *)sub_10000F040(a1);
  uint64_t v4 = (const __CFString *)sub_10000F040(a2);
  if (v3) {
    return sub_100018F28(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  sub_1000188F8(0, "_copy_mobile_preference", @"bogus request", v6, v7, v8, v9, v10, v12);
  return 0LL;
}

uint64_t sub_10000778C( const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    sub_100005E10(@"AppleICUForce24HourTime", a1, kCFPreferencesAnyApplication, a4, a5, a6, a7, a8, vars0);
    sub_10000F56C(@"AppleTimePreferencesChangedNotification");
    sub_10000F56C(@"SignificantTimeChangeNotification");
    return 0LL;
  }

  else
  {
    sub_1000188F8(0, "set_military_time", @"Invalid input.", a4, a5, a6, a7, a8, vars0);
    return 0xFFFFFFFFLL;
  }

CFPropertyListRef sub_1000077F4()
{
  return sub_10000772C(@"EnableTetheredDisplayPortMode", 0LL);
}

CFBooleanRef sub_100007808()
{
  int v0 = MKBGetDeviceLockState(0LL);
  BOOL v1 = (v0 - 1) < 2 || v0 == -1;
  uint64_t v2 = &kCFBooleanFalse;
  if (v1) {
    uint64_t v2 = &kCFBooleanTrue;
  }
  return *v2;
}

void sub_100007848(const __CFBoolean *a1)
{
  if (sub_10000F0A8(a1))
  {
    if (CFEqual(a1, kCFBooleanTrue)) {
      CFBooleanRef v7 = a1;
    }
    else {
      CFBooleanRef v7 = kCFBooleanFalse;
    }
    sub_100005E10(@"EnableTetheredDisplayPortMode", v7, kCFPreferencesAnyApplication, v2, v3, v4, v5, v6, v8);
    sub_10000F56C(@"com.apple.mobile.demo_mode_changed");
  }

CFNumberRef sub_1000078C8()
{
  CFTimeInterval valuePtr = 0.0;
  CFTimeZoneResetSystem();
  CFTimeZoneRef v0 = CFTimeZoneCopySystem();
  if (v0)
  {
    BOOL v1 = v0;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFTimeInterval valuePtr = CFTimeZoneGetSecondsFromGMT(v1, Current);
    CFRelease(v1);
  }

  return CFNumberCreate(kCFAllocatorDefault, kCFNumberDoubleType, &valuePtr);
}

void sub_10000792C( uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!a2)
  {
    sub_1000188F8(0, "set_language", @"Invalid input.", a4, a5, a6, a7, a8, a9);
    return;
  }

  uint64_t v10 = (const __CFArray *)sub_10000772C(@"AppleLanguages", 0LL);
  if (sub_10000F00C(v10))
  {
    sub_1000188F8(0, "set_language", @"Pre-pending the language list with %@.", v11, v12, v13, v14, v15, (char)a2);
    CFMutableStringRef Mutable = sub_100007AC8(v10, a2);
    if (!Mutable)
    {
      uint64_t v22 = @"Failed to create languages list.";
      goto LABEL_14;
    }

CFArrayRef sub_100007AC8(const __CFArray *a1, const void *a2)
{
  if (sub_10000F00C(a1))
  {
    MutableCopy = CFArrayCreateMutableCopy(0LL, 0LL, a1);
    uint64_t v15 = MutableCopy;
    if (MutableCopy)
    {
      CFIndex Count = CFArrayGetCount(MutableCopy);
      if (Count >= 1)
      {
        CFIndex v17 = Count;
        CFIndex v18 = 0LL;
        CFIndex v19 = Count;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v15, v18);
          int v21 = CFEqual(ValueAtIndex, a2);
          if (v21) {
            CFIndex v22 = v17;
          }
          else {
            CFIndex v22 = v18;
          }
          if (v21) {
            CFIndex v19 = v18;
          }
          CFIndex v18 = v22 + 1;
        }

        while (v22 + 1 < v17);
        if (v19 != v17) {
          CFArrayRemoveValueAtIndex(v15, v19);
        }
      }

      CFArrayInsertValueAtIndex(v15, 0LL, a2);
    }

    else
    {
      sub_1000188F8(0, "_move_to_front", @"Could not copy array", v10, v11, v12, v13, v14, v24);
    }
  }

  else
  {
    sub_1000188F8(0, "_move_to_front", @"bad input", v4, v5, v6, v7, v8, v24);
    return 0LL;
  }

  return v15;
}

void sub_100007BBC( const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int valuePtr = 0;
  if (a1)
  {
    if (CFEqual(a1, @"th"))
    {
      CFNumberRef v9 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
      if (v9)
      {
        CFNumberRef v15 = v9;
        sub_100005E10(@"contactsSortOrder", v9, @"com.apple.PeoplePicker", v10, v11, v12, v13, v14, v16);
        sub_10000F56C(@"com.apple.AddressBook.PreferenceChanged");
        CFRelease(v15);
      }

      else
      {
        sub_1000188F8(0, "set_contact_sort_order", @"Failed to create number.", v10, v11, v12, v13, v14, v16);
      }
    }
  }

  else
  {
    sub_1000188F8(0, "set_contact_sort_order", @"Invalid input.", a4, a5, a6, a7, a8, a9);
  }

void sub_100007C78( const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (sub_10000F040(a1))
  {
    if (CFEqual(a1, @"ja")
      || CFEqual(a1, @"zh-Hans")
      || CFEqual(a1, @"zh-Hant")
      || CFEqual(a1, @"ko"))
    {
      sub_100005E10( @"personNameOrdering",  &__kCFBooleanTrue,  @"com.apple.PeoplePicker",  v15,  v16,  v17,  v18,  v19,  v20);
      sub_10000F56C(@"com.apple.AddressBook.PreferenceChanged");
    }
  }

  else
  {
    sub_1000188F8(0, "set_name_order", @"Invalid input.", v10, v11, v12, v13, v14, a9);
  }

CFTypeRef sub_100007D38()
{
  CFTimeZoneRef v0 = (const __CFArray *)sub_10000772C(@"AppleLanguages", 0LL);
  if (v0)
  {
    uint64_t v6 = v0;
    ValueAtIndex = CFArrayGetValueAtIndex(v0, 0LL);
    if (sub_10000F040(ValueAtIndex))
    {
      CFTypeRef v13 = CFRetain(ValueAtIndex);
    }

    else
    {
      sub_1000188F8(0, "copy_language", @"Failed to retrieve first language in list.", v8, v9, v10, v11, v12, v15);
      CFTypeRef v13 = 0LL;
    }

    CFRelease(v6);
  }

  else
  {
    sub_1000188F8(0, "copy_language", @"Failed to lookup %@.", v1, v2, v3, v4, v5, (char)@"AppleLanguages");
    return 0LL;
  }

  return v13;
}

CFStringRef sub_100007DDC( const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (CFStringHasPrefix(a1, @"th_TH@")) {
      return @"th_TH";
    }
    else {
      return a1;
    }
  }

  else
  {
    sub_1000188F8(0, "transform_locale", @"Invalid input", a4, a5, a6, a7, a8, v10);
    return 0LL;
  }

void sub_100007E34( uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a2)
  {
    sub_100005E10(@"AppleLocale", a2, kCFPreferencesAnyApplication, a4, a5, a6, a7, a8, vars0);
    sub_100005E10( @"LockdownSetLocale",  kCFBooleanTrue,  @"com.apple.purplebuddy",  v9,  v10,  v11,  v12,  v13,  vars0a);
    sub_10000F56C(@"com.apple.mobile.lockdown.phone_number_changed");
    sub_10000F56C(@"AppleDatePreferencesChangedNotification");
    sub_10000F56C(@"AppleTimePreferencesChangedNotification");
  }

  else
  {
    sub_1000188F8(0, "set_locale", @"Invalid input.", a4, a5, a6, a7, a8, a9);
  }

CFTypeRef sub_100007EC0()
{
  CFPropertyListRef v0 = sub_10000772C(@"AppleLocale", 0LL);
  uint64_t v6 = v0;
  if (v0)
  {
    if (!sub_10000F040(v0))
    {
      CFRelease(v6);
      return CFRetain(@"en_US");
    }
  }

  else
  {
    sub_1000188F8(0, "copy_locale", @"Failed to copy %@.", v1, v2, v3, v4, v5, (char)@"AppleLocale");
  }

  return v6;
}

CFStringRef sub_100007F44(const __CFString *a1)
{
  uint64_t v1 = a1;
  if (sub_10000F040(a1) && CFStringHasPrefix(v1, @"th_TH@")) {
    return @"th_TH";
  }
  return v1;
}

void sub_100007F8C( uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a2)
  {
    char v15 = (const __CFArray *)sub_10000772C(@"AppleKeyboards", 0LL);
    if (v15)
    {
      sub_1000188F8( 0,  "set_keyboard",  @"Prepending the keyboard list with %@.",  v10,  v11,  v12,  v13,  v14,  (char)a2);
      uint64_t v16 = sub_100007AC8(v15, a2);
      if (!v16)
      {
        sub_1000188F8(0, "set_keyboard", @"Failed to re-arrange keyboard list.", v17, v18, v19, v20, v21, v31);
        char v30 = v15;
        goto LABEL_13;
      }

      CFIndex v22 = v16;
      if (CFEqual(v16, v15)) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }

    sub_1000188F8( 0,  "set_keyboard",  @"Failed to copy %@.",  v10,  v11,  v12,  v13,  v14,  (char)@"AppleKeyboards");
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      CFIndex v22 = Mutable;
      sub_1000188F8(0, "set_keyboard", @"Creating the keyboard list with %@.", a4, a5, a6, a7, a8, (char)a2);
      CFArrayAppendValue(v22, a2);
LABEL_9:
      sub_100005E10(@"AppleKeyboards", v22, kCFPreferencesAnyApplication, v23, v24, v25, v26, v27, v31);
      sub_10000F56C(@"AppleKeyboardsPreferencesChangedNotification");
      if (!v15)
      {
LABEL_11:
        char v30 = v22;
LABEL_13:
        CFRelease(v30);
        return;
      }

const void *sub_1000080FC()
{
  CFPropertyListRef v0 = (const __CFArray *)sub_10000772C(@"AppleKeyboards", 0LL);
  if (v0)
  {
    uint64_t v6 = v0;
    ValueAtIndex = CFArrayGetValueAtIndex(v0, 0LL);
    uint64_t v13 = ValueAtIndex;
    if (ValueAtIndex) {
      CFRetain(ValueAtIndex);
    }
    else {
      sub_1000188F8(0, "copy_keyboard", @"Failed to get first keyboard in the list.", v8, v9, v10, v11, v12, v15);
    }
    CFRelease(v6);
  }

  else
  {
    sub_1000188F8(0, "copy_keyboard", @"Failed to copy %@.", v1, v2, v3, v4, v5, (char)@"AppleKeyboards");
    return 0LL;
  }

  return v13;
}

uint64_t sub_100008194()
{
  CFPropertyListRef v0 = CFURLCreateWithFileSystemPath( kCFAllocatorDefault,  @"/System/Library/PrivateFrameworks/MusicLibrary.framework",  kCFURLPOSIXPathStyle,  0);
  if (!v0)
  {
    sub_1000188F8( 0,  "copy_sort_sections",  @"Failed to create bundle URL for %s.",  v1,  v2,  v3,  v4,  v5,  (char)"/System/Library/PrivateFrameworks/MusicLibrary.framework");
    return 0LL;
  }

  uint64_t v6 = v0;
  CFBundleRef v7 = CFBundleCreate(kCFAllocatorDefault, v0);
  if (!v7)
  {
    sub_1000188F8( 0,  "copy_sort_sections",  @"Failed to create bundle for %s.",  v8,  v9,  v10,  v11,  v12,  (char)"/System/Library/PrivateFrameworks/MusicLibrary.framework");
    uint64_t v41 = (const __CFString *)v6;
LABEL_26:
    CFRelease(v41);
    return 0LL;
  }

  uint64_t v13 = v7;
  CFPropertyListRef v14 = sub_10000772C(@"AppleLanguages", 0LL);
  if (!v14)
  {
    sub_1000188F8( 0,  "_copy_localization_name",  @"Could not load languages list or bundle was NULL",  v15,  v16,  v17,  v18,  v19,  v74);
LABEL_21:
    sub_1000188F8( 0,  "copy_sort_sections",  @"Failed to get localization for %s.",  v42,  v43,  v44,  v45,  v46,  (char)"/System/Library/PrivateFrameworks/MusicLibrary.framework");
    ValueAtIndex = 0LL;
    uint64_t v53 = 0LL;
    goto LABEL_22;
  }

  uint64_t v20 = v14;
  uint64_t v21 = CFBundleCopyBundleLocalizations(v13);
  if (!v21)
  {
    sub_1000188F8( 0,  "_copy_localization_name",  @"Could not load localizations from bundle",  v22,  v23,  v24,  v25,  v26,  v74);
    CFRelease(v20);
    goto LABEL_21;
  }

  uint64_t v27 = v21;
  char v28 = CFBundleCopyLocalizationsForPreferences(v21, (CFArrayRef)v20);
  if (v28)
  {
    uint64_t v34 = v28;
    if (CFArrayGetCount(v28) <= 0)
    {
      sub_1000188F8( 0,  "_copy_localization_name",  @"No preferred localizations found",  v35,  v36,  v37,  v38,  v39,  v74);
      ValueAtIndex = 0LL;
    }

    else
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v34, 0LL);
      CFRetain(ValueAtIndex);
    }

    CFRelease(v34);
  }

  else
  {
    sub_1000188F8( 0,  "_copy_localization_name",  @"Could not load preferred localizations from bundle",  v29,  v30,  v31,  v32,  v33,  v74);
    ValueAtIndex = 0LL;
  }

  CFRelease(v27);
  CFRelease(v20);
  if (!ValueAtIndex) {
    goto LABEL_21;
  }
  int v47 = CFBundleCopyResourceURLForLocalization(v13, @"MLSections", @"plist", 0LL, ValueAtIndex);
  uint64_t v53 = v47;
  if (!v47)
  {
    sub_1000188F8( 0,  "copy_sort_sections",  @"Failed to copy bundle resource URL (%s / %s).",  v48,  v49,  v50,  v51,  v52,  (char)"MLSections");
    goto LABEL_22;
  }

  uint64_t v54 = CFReadStreamCreateWithFile(kCFAllocatorDefault, v47);
  if (!v54)
  {
    sub_1000188F8( 0,  "copy_sort_sections",  @"Failed to create read stream (%s / %s).",  v55,  v56,  v57,  v58,  v59,  (char)"MLSections");
LABEL_22:
    CFRelease(v6);
    CFRelease(v13);
    if (!v53) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }

  uint64_t v60 = v54;
  CFReadStreamOpen(v54);
  CFPropertyListRef v61 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v60, 0LL, 0LL, 0LL, 0LL);
  CFReadStreamClose(v60);
  if (v61)
  {
    CFTypeID v67 = CFGetTypeID(v61);
    if (v67 == CFDictionaryGetTypeID())
    {
      CFRelease(v6);
      uint64_t v6 = (const __CFURL *)v61;
    }

    else
    {
      sub_1000188F8( 0,  "copy_sort_sections",  @"Invalid property list (%s / %s).",  v68,  v69,  v70,  v71,  v72,  (char)"MLSections");
      CFRelease(v61);
    }
  }

  else
  {
    sub_1000188F8( 0,  "copy_sort_sections",  @"Failed to load property list (%s / %s).",  v62,  v63,  v64,  v65,  v66,  (char)"MLSections");
  }

  CFRelease(v6);
  CFRelease(v60);
  CFRelease(v13);
LABEL_23:
  CFRelease(v53);
LABEL_24:
  if (ValueAtIndex)
  {
    uint64_t v41 = ValueAtIndex;
    goto LABEL_26;
  }

  return 0LL;
}

__CFDictionary *sub_100008500(dispatch_queue_s **a1)
{
  uint64_t v46 = 0LL;
  int v47 = &v46;
  uint64_t v48 = 0x2020000000LL;
  uint64_t v49 = 0LL;
  uint64_t v42 = 0LL;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x2020000000LL;
  int v45 = 0;
  memset(valuePtr, 0, sizeof(valuePtr));
  uint64_t v38 = 0LL;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000LL;
  int v41 = 20;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_1000087EC;
  v37[3] = &unk_100149DA8;
  void v37[4] = &v46;
  v37[5] = &v42;
  v37[6] = &v38;
  v37[7] = valuePtr;
  int v1 = sub_10000735C(a1, v37);
  if (v1)
  {
    sub_1000188F8( 0,  "load_rental_bag_request",  @"Could not generate rental bag request: %ld",  v2,  v3,  v4,  v5,  v6,  v1);
    goto LABEL_13;
  }

  uint64_t v12 = sub_100023A08();
  if (!v12)
  {
    sub_1000188F8(0, "load_rental_bag_request", @"Failed to create dictionary.", v7, v8, v9, v10, v11, v36);
LABEL_13:
    uint64_t v12 = 0LL;
    goto LABEL_18;
  }

  CFDataRef v18 = CFDataCreate(0LL, (const UInt8 *)v47[3], *((unsigned int *)v43 + 6));
  if (v18)
  {
    CFDictionarySetValue(v12, @"Message", v18);
    uint64_t v24 = sub_100023A5C();
    if (v24)
    {
      if (*((_DWORD *)v39 + 6))
      {
        unint64_t v25 = 0LL;
        uint64_t v26 = valuePtr;
        do
        {
          CFNumberRef v32 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, v26);
          if (v32)
          {
            CFArrayAppendValue(v24, v32);
            CFRelease(v32);
          }

          else
          {
            sub_1000188F8(0, "load_rental_bag_request", @"Failed to create number.", v27, v28, v29, v30, v31, v36);
          }

          ++v25;
          uint64_t v26 = (_OWORD *)((char *)v26 + 4);
        }

        while (v25 < *((unsigned int *)v39 + 6));
      }

      CFDictionarySetValue(v12, @"DiversityElements", v24);
    }

    else
    {
      sub_1000188F8(0, "load_rental_bag_request", @"Failed to create array.", v19, v20, v21, v22, v23, v36);
    }

    CFRelease(v18);
    if (v24) {
      CFRelease(v24);
    }
  }

  else
  {
    sub_1000188F8(0, "load_rental_bag_request", @"Failed to create data.", v13, v14, v15, v16, v17, v36);
  }

LABEL_18:
  uint64_t v33 = v47;
  uint64_t v34 = (void *)v47[3];
  if (v34)
  {
    free(v34);
    uint64_t v33 = v47;
  }

  v33[3] = 0LL;
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
  return v12;
}

void sub_1000087B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, char a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

void sub_1000087EC(void *a1, uint64_t a2)
{
}

void sub_100008820(dispatch_queue_s **a1)
{
  CFNumberRef v1 = sub_100008840(a1);
  if (v1) {
    CFRelease(v1);
  }
}

CFNumberRef sub_100008840(dispatch_queue_s **a1)
{
  int v1 = sub_10000735C(a1, &stru_100149E10);
  int valuePtr = v1;
  if (v1)
  {
    sub_1000188F8(0, "copy_rental_bag_verification", @"Response processing failed: %ld\n", v2, v3, v4, v5, v6, v1);
    return CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  }

  uint64_t v7 = "/var/mobile/Media/iTunes_Control/iTunes/IC-Info.sidr";
  int v8 = sub_100024100("/var/mobile/Media/iTunes_Control/iTunes/IC-Info.sidr", 256, 0x8000, v2, v3, v4, v5, v6);
  if (v8 == -1) {
    goto LABEL_12;
  }
  int v9 = v8;
  uint64_t v10 = getpwnam("mobile");
  if (v10)
  {
    uid_t pw_uid = v10->pw_uid;
    gid_t pw_gid = v10->pw_gid;
  }

  else
  {
    gid_t pw_gid = 501;
    uid_t pw_uid = 501;
  }

  if (fchown(v9, pw_uid, pw_gid) == -1) {
    goto LABEL_9;
  }
  close(v9);
  uint64_t v7 = "/var/mobile/Library/FairPlay/vdpf";
  int v18 = sub_100024100("/var/mobile/Library/FairPlay/vdpf", 256, 0x8000, v13, v14, v15, v16, v17);
  if (v18 == -1)
  {
LABEL_12:
    uint64_t v26 = __error();
    strerror(*v26);
    sub_1000188F8( 0,  "copy_rental_bag_verification",  @"hmm, symlink - that isn't right, path: %s, %s",  v27,  v28,  v29,  v30,  v31,  (char)v7);
    return CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  }

  int v9 = v18;
  if (fchown(v18, pw_uid, pw_gid) == -1)
  {
LABEL_9:
    uint64_t v19 = __error();
    strerror(*v19);
    sub_1000188F8(0, "copy_rental_bag_verification", @"Could not chown %s: %s", v20, v21, v22, v23, v24, (char)v7);
  }

  close(v9);
  return CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
}

CFNumberRef sub_1000089A8()
{
  int valuePtr = 3;
  CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (!v5) {
    sub_1000188F8(0, "copy_rental_request_version", @"Could not create number", v0, v1, v2, v3, v4, v7);
  }
  return v5;
}

void sub_100008A08(dispatch_queue_s **a1, const void *a2)
{
  uint64_t v38 = 0LL;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000LL;
  uint64_t v41 = 0LL;
  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  int v37 = 0;
  if (!sub_10000F074(a2))
  {
    uint64_t v31 = @"value is not CFData";
LABEL_14:
    sub_1000188F8(0, "trigger_rental_checkin_request", v31, v4, v5, v6, v7, v8, v32);
    goto LABEL_10;
  }

  size_t Length = CFDataGetLength((CFDataRef)a2);
  uint64_t v10 = malloc(Length);
  if (!v10)
  {
    uint64_t v31 = @"Could not allocate a buffer for the a copy of the original message";
    goto LABEL_14;
  }

  uint64_t v11 = v10;
  BytePtr = CFDataGetBytePtr((CFDataRef)a2);
  memcpy(v11, BytePtr, Length);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100008C38;
  v33[3] = &unk_100149DD0;
  v33[6] = v11;
  v33[7] = Length;
  void v33[4] = &v38;
  v33[5] = &v34;
  int v13 = sub_10000735C(a1, v33);
  if (v13)
  {
    sub_1000188F8( 0,  "trigger_rental_checkin_request",  @"Could not get response ack: %ld",  v14,  v15,  v16,  v17,  v18,  v13);
  }

  else
  {
    uint64_t v19 = (const UInt8 *)v39[3];
    if (v19 && (CFIndex v20 = *((unsigned int *)v35 + 6), (_DWORD)v20))
    {
      CFDataRef v26 = CFDataCreate(kCFAllocatorDefault, v19, v20);
      if (v26)
      {
        sub_10000D59C( a1,  (uint64_t)@"com.apple.fairplay",  (uint64_t)@"RentalCheckinAckResponse",  1LL,  v22,  v23,  v24,  v25);
        sub_10000C924( (uint64_t)a1,  (uint64_t)@"com.apple.fairplay",  (uint64_t)@"RentalCheckinAckResponse",  (uint64_t)v26,  v27,  v28,  v29,  v30);
        CFRelease(v26);
      }

      else
      {
        sub_1000188F8( 0,  "trigger_rental_checkin_request",  @"Could not create data from ack.",  v21,  v22,  v23,  v24,  v25,  v32);
      }
    }

    else
    {
      sub_1000188F8( 0,  "trigger_rental_checkin_request",  @"Invalid ack! Ack. Ack. Ack.",  v14,  v15,  v16,  v17,  v18,  v32);
    }
  }

  free(v11);
LABEL_10:
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
}

void sub_100008C0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_100008C38(uint64_t a1, uint64_t a2)
{
}

int sub_100008C60(id a1, unsigned int a2)
{
  return result;
}

CFNumberRef sub_100008C68()
{
  if (v0)
  {
    char v8 = v0;
    uint64_t v6 = @"Could not get necessary rental clock bias: %ld";
    LODWORD(result) = 0;
LABEL_3:
    sub_1000188F8((int)result, "copy_rental_clock_bias", v6, v1, v2, v3, v4, v5, v8);
    return 0LL;
  }

  CFNumberRef result = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, valuePtr);
  if (!result)
  {
    uint64_t v6 = @"Could not create bias number";
    goto LABEL_3;
  }

  return result;
}

NSMutableArray *sub_100008CE4()
{
  uint64_t v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v5)
  {
    uint64_t v6 = (void *)MobileStorageCopyDevicesWithError(0LL, 0LL);
    id v7 = v6;
    if (v6 && [v6 count])
    {
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      id v7 = v7;
      id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v21;
        uint64_t v11 = kMobileStorageDeviceTypeKey;
        uint64_t v12 = kMobileStorageDeviceTypeDiskImage;
        uint64_t v13 = kMobileStorageMountPathKey;
        do
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v11, (void)v20));
            if ([v16 isEqualToString:v12])
            {
              uint64_t v17 = objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v13]);
              if (v17)
              {
                uint64_t v18 = (void *)v17;
                -[NSMutableArray addObject:](v5, "addObject:", v17);
              }
            }
          }

          id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }

        while (v9);
      }
    }
  }

  else
  {
    sub_1000188F8(0, "copy_disk_image_mount_points", @"Failed to allocate array.", v0, v1, v2, v3, v4, v20);
    id v7 = 0LL;
  }

  return v5;
}

void sub_100008E9C(uint64_t a1, dispatch_queue_t *a2, void *a3, _BYTE *a4)
{
  uint64_t v64 = 0LL;
  uint64_t v63 = 0LL;
  id v7 = a3;
  bzero(__str, 0x400uLL);
  char v60 = 0;
  sub_1000188F8(0, "load_agents_for_mount", @"Loading images for mount %@.", v8, v9, v10, v11, v12, (char)v7);
  if (a4) {
    *a4 = 0;
  }
  id v13 = v7;
  if (snprintf( __str,  0x400uLL,  "%s%s",  (const char *)[v13 UTF8String],  "/Library/Lockdown/ServiceAgents") >= 0x400)
  {
    char v14 = [v13 UTF8String];
    sub_1000188F8(0, "load_agents_for_mount", @"Path too long: %s%s", v15, v16, v17, v18, v19, v14);
LABEL_30:
    uint64_t v29 = 0LL;
    uint64_t v28 = 0LL;
    uint64_t v27 = 0LL;
    goto LABEL_31;
  }

  if (lstat(__str, &v61) == -1)
  {
    if (*__error() != 2)
    {
      __error();
      int v47 = __error();
      strerror(*v47);
      sub_1000188F8( 0,  "load_agents_for_mount",  @"Failed to stat %s: %d (%s)",  v48,  v49,  v50,  v51,  v52,  (char)__str);
    }

    goto LABEL_30;
  }

  if ((v61.st_mode & 0xF000) != 0x4000)
  {
    sub_1000188F8( 0,  "load_agents_for_mount",  @"%s is not a directory, ignoring",  v20,  v21,  v22,  v23,  v24,  (char)__str);
    goto LABEL_30;
  }

  uint64_t v63 = __str;
  uint64_t v64 = 0LL;
  uint64_t v25 = fts_open(&v63, 21, 0LL);
  if (!v25)
  {
    int v53 = *__error();
    uint64_t v54 = __error();
    strerror(*v54);
    sub_1000188F8(0, "load_agents_for_mount", @"fts_open failed: %d (%s)", v55, v56, v57, v58, v59, v53);
    goto LABEL_30;
  }

  CFDataRef v26 = v25;
  uint64_t v27 = 0LL;
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  while (1)
  {
    uint64_t v30 = fts_read(v26);
    if (!v30) {
      break;
    }
    uint64_t v31 = v30;
    if (v30->fts_info == 8 && !strncmp(&v30->fts_name[v30->fts_namelen - 6], ".plist", 6uLL))
    {
      char v32 = (void *)sub_100023804(v31->fts_path);

      if (v32)
      {
        uint64_t v38 = objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"Label"]);

        uint64_t v29 = (void *)v38;
        if (v38)
        {
          uint64_t fixed = MobileStorageCopyAndFixPlist(v32, v13);
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(fixed);

          if (!v27)
          {
            char v32 = 0LL;
            int v45 = @"Failed to copy/fix %s.";
            goto LABEL_18;
          }

          id v46 = [v27 mutableCopy];

          if (([v13 isEqualToString:@"/Developer"] & 1) != 0
            || [v13 isEqualToString:@"/System/Developer"])
          {
            [v46 setObject:&__kCFBooleanTrue forKeyedSubscript:@"DeveloperModeRequired"];
          }

          sub_1000185D8(a2, a1, v29, (uint64_t)v46, &v60);
          uint64_t v28 = v46;
          if (a4)
          {
            uint64_t v28 = v46;
            if (v60)
            {
              *a4 = 1;
              uint64_t v28 = v46;
            }
          }
        }

        else
        {
          int v45 = @"%s did not contain a label.";
LABEL_18:
          sub_1000188F8(0, "load_agents_for_mount", v45, v39, v40, v41, v42, v43, (char)v31->fts_path);
          uint64_t v27 = v32;
        }
      }

      else
      {
        sub_1000188F8( 0,  "load_agents_for_mount",  @"Failed to load %s.",  v33,  v34,  v35,  v36,  v37,  (char)v31->fts_path);
        uint64_t v27 = 0LL;
      }
    }
  }

  fts_close(v26);
LABEL_31:
}

CFStringRef sub_100009264(const __CFString *a1)
{
  char v1 = (char)a1;
  uint64_t v28 = 0LL;
  *(_OWORD *)cStr = 0u;
  memset(v37, 0, sizeof(v37));
  if (!CFStringGetCString(a1, buffer, 20LL, 0x8000100u))
  {
    sub_1000188F8(0, "createV6Address", @"Failed to query C string for %@.", v2, v3, v4, v5, v6, v1);
    return @"0.0.0.0";
  }

  id v7 = ether_aton(buffer);
  if (!v7)
  {
    sub_1000188F8(0, "createV6Address", @"ether_aton failed for %@.", v8, v9, v10, v11, v12, v1);
    return @"0.0.0.0";
  }

  LOWORD(v2_Block_object_dispose((const void *)(v11 - 80), 8) = -32514;
  char v29 = v7->octet[0] ^ 2;
  u_char v30 = v7->octet[1];
  u_char v31 = v7->octet[2];
  __int16 v32 = -257;
  u_char v33 = v7->octet[3];
  u_char v34 = v7->octet[4];
  u_char v35 = v7->octet[5];
  if (!inet_ntop(30, &v28, cStr, 0x2Eu))
  {
    __error();
    uint64_t v21 = __error();
    strerror(*v21);
    sub_1000188F8(0, "createV6Address", @"inet_ntop failed for %@: %d (%s)", v22, v23, v24, v25, v26, v1);
    return @"0.0.0.0";
  }

  CFStringRef v13 = CFStringCreateWithCString(0LL, cStr, 0x8000100u);
  if (!v13)
  {
    sub_1000188F8(0, "createV6Address", @"Failed to create string for %s.", v14, v15, v16, v17, v18, (char)cStr);
    return @"0.0.0.0";
  }

  CFStringRef v19 = v13;
  CFTypeRef v20 = CFRetain(v13);
  CFRelease(v19);
  return (const __CFString *)v20;
}

void sub_100009400(dispatch_queue_s **a1)
{
  *(_OWORD *)domain = *(_OWORD *)"local";
  LODWORD(v73) = 0;
  uint64_t v2 = (const void *)sub_10000D238( (uint64_t)a1,  (uint64_t)@"com.apple.mobile.wireless_lockdown",  (uint64_t)@"SupportsWifi");
  sub_10000D59C( a1,  (uint64_t)@"com.apple.mobile.wireless_lockdown",  (uint64_t)@"SupportsWifiSyncing",  1LL,  v3,  v4,  v5,  v6);
  if (!sub_10000F0A8(v2) || !CFEqual(v2, kCFBooleanTrue))
  {
    sub_10000C924( (uint64_t)a1,  (uint64_t)@"com.apple.mobile.wireless_lockdown",  (uint64_t)@"SupportsWifiSyncing",  (uint64_t)kCFBooleanFalse,  v7,  v8,  v9,  v10);
    uint64_t v11 = 0LL;
LABEL_11:
    uint64_t v28 = 0LL;
    char v29 = 0LL;
    u_char v30 = 0LL;
    goto LABEL_12;
  }

  sub_10000C924( (uint64_t)a1,  (uint64_t)@"com.apple.mobile.wireless_lockdown",  (uint64_t)@"SupportsWifiSyncing",  (uint64_t)kCFBooleanTrue,  v7,  v8,  v9,  v10);
  uint64_t v11 = (const __CFString *)sub_10000D238((uint64_t)a1, 0LL, (uint64_t)@"WiFiAddress");
  uint64_t v12 = sub_10000F040(v11);
  if (!v12)
  {
    uint64_t v27 = @"Missing Wifi MAC Address.";
LABEL_10:
    sub_1000188F8((int)v12, "intialize_wifi_syncing", v27, v13, v14, v15, v16, v17, v68);
    goto LABEL_11;
  }

  uint64_t CurrentWireProtocolVersion = RemotePairingGetCurrentWireProtocolVersion();
  if (CurrentWireProtocolVersion < 0)
  {
    uint64_t v27 = @"Failed to read RemotePairing protocol version.";
    LODWORD(v12) = 0;
    goto LABEL_10;
  }

  uint64_t v19 = CurrentWireProtocolVersion;
  CFTypeRef v20 = sub_100009264(v11);
  if (remotePairingIsEnabled()) {
    uint64_t v21 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%@@%@-%@-%ld",  v11,  v20,  @"supportsRP",  v19,  *(void *)domain,  *(void *)&domain[8],  v73);
  }
  else {
    uint64_t v21 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"%@@%@",  v11,  v20,  v70,  v71,  *(void *)domain,  *(void *)&domain[8],  v73);
  }
  u_char v30 = v21;
  if (!v21)
  {
    uint64_t v39 = @"Failed to create v6 address string.";
    goto LABEL_30;
  }

  if (!CFStringGetCString(v21, buffer, 64LL, 0x8000100u))
  {
    uint64_t v39 = @"Failed to create v6 address C string.";
    goto LABEL_30;
  }

  sub_10000D59C( a1,  (uint64_t)@"com.apple.mobile.wireless_lockdown",  (uint64_t)@"InstanceName",  1LL,  v23,  v24,  v25,  v26);
  sub_10000D59C( a1,  (uint64_t)@"com.apple.mobile.wireless_lockdown",  (uint64_t)@"InstanceName",  2LL,  v31,  v32,  v33,  v34);
  sub_10000C924( (uint64_t)a1,  (uint64_t)@"com.apple.mobile.wireless_lockdown",  (uint64_t)@"InstanceName",  (uint64_t)v30,  v35,  v36,  v37,  v38);
  if (DNSServiceConstructFullName(fullName, buffer, regtype, domain))
  {
    uint64_t v39 = @"Failed to construct DNS full service name.";
LABEL_30:
    sub_1000188F8(0, "intialize_wifi_syncing", v39, v22, v23, v24, v25, v26, v69);
    char v29 = 0LL;
    goto LABEL_31;
  }

  char v29 = CFStringCreateWithCString(kCFAllocatorDefault, fullName, 0x8000100u);
  if (v29)
  {
    MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0LL, v29);
    uint64_t v28 = (__CFString *)MutableCopy;
    if (MutableCopy)
    {
      v77.length = CFStringGetLength(MutableCopy);
      v77.location = 0LL;
      CFStringFindAndReplace(v28, @"\\"", &stru_100154398, v77, 0LL);
      sub_10000D59C( a1,  (uint64_t)@"com.apple.mobile.wireless_lockdown",  (uint64_t)@"BonjourFullServiceName",  1LL,  v51,  v52,  v53,  v54);
      sub_10000D59C( a1,  (uint64_t)@"com.apple.mobile.wireless_lockdown",  (uint64_t)@"BonjourFullServiceName",  0LL,  v55,  v56,  v57,  v58);
      sub_10000C924( (uint64_t)a1,  (uint64_t)@"com.apple.mobile.wireless_lockdown",  (uint64_t)@"BonjourFullServiceName",  (uint64_t)v28,  v59,  v60,  v61,  v62);
      if (dword_100176128) {
        sub_1000188F8( 0,  "intialize_wifi_syncing",  @"Full service name is '%@'.",  v63,  v64,  v65,  v66,  v67,  (char)v28);
      }
    }

    else
    {
      sub_1000188F8( 0,  "intialize_wifi_syncing",  @"Failed to copy DNS full service name string.",  v46,  v47,  v48,  v49,  v50,  v69);
    }

    goto LABEL_32;
  }

  sub_1000188F8( 0,  "intialize_wifi_syncing",  @"Failed to create DNS full service name string.",  v40,  v41,  v42,  v43,  v44,  v69);
LABEL_31:
  uint64_t v28 = 0LL;
LABEL_32:
  if (v20) {
    CFRelease(v20);
  }
LABEL_12:
  if (v2) {
    CFRelease(v2);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v30) {
    CFRelease(v30);
  }
  if (v29) {
    CFRelease(v29);
  }
  if (v28) {
    CFRelease(v28);
  }
}

CFBooleanRef sub_10000981C()
{
  CFBooleanRef v0 = kCFBooleanFalse;
  char v1 = SCPreferencesCreate(0LL, @"racoon", @"com.apple.ipsec.plist");
  if (v1)
  {
    uint64_t v7 = v1;
    Value = (const __CFDictionary *)SCPreferencesGetValue(v1, @"Global");
    if (sub_10000EFD8(Value))
    {
      uint64_t v9 = (const __CFNumber *)CFDictionaryGetValue(Value, @"DebugLevel");
      if (sub_10000EFA4(v9))
      {
        CFNumberGetValue(v9, kCFNumberIntType, &valuePtr);
        if (valuePtr) {
          CFBooleanRef v0 = kCFBooleanTrue;
        }
      }
    }

    CFRelease(v7);
  }

  else
  {
    sub_1000188F8(0, "copy_vpn_logging", @"Could not create configd prefs", v2, v3, v4, v5, v6, v11);
  }

  return v0;
}

void sub_1000098F0( const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int valuePtr = 0;
  if (!sub_10000F0A8(a1))
  {
    uint64_t v33 = @"Invalid input";
LABEL_12:
    sub_1000188F8(0, "enable_vpn_logging", v33, v10, v11, v12, v13, v14, a9);
    return;
  }

  uint64_t v15 = SCPreferencesCreate(0LL, @"racoon", @"com.apple.ipsec.plist");
  if (!v15)
  {
    uint64_t v33 = @"SCPreferencesCreate failed.";
    goto LABEL_12;
  }

  uint64_t v16 = v15;
  CFPropertyListRef Value = SCPreferencesGetValue(v15, @"Global");
  uint64_t v18 = (const __CFDictionary *)sub_10000EFD8(Value);
  if (v18 && (CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0LL, 0LL, v18)) != 0LL
    || (CFMutableDictionaryRef MutableCopy = sub_100023A08()) != 0LL)
  {
    int valuePtr = 2 * (CFEqual(a1, kCFBooleanTrue) != 0);
    CFNumberRef v25 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (!v25)
    {
      sub_1000188F8(0, "enable_vpn_logging", @"Could not create debug level number", v26, v27, v28, v29, v30, v41);
LABEL_18:
      CFRelease(MutableCopy);
      goto LABEL_19;
    }

    CFNumberRef v31 = v25;
    CFDictionarySetValue(MutableCopy, @"DebugLevel", v25);
    CFDictionarySetValue(MutableCopy, @"DebugLogfile", @"/var/log/racoon.log");
    SCPreferencesSetValue(v16, @"Global", MutableCopy);
    if (SCPreferencesCommitChanges(v16))
    {
      if (SCPreferencesApplyChanges(v16))
      {
LABEL_17:
        CFRelease(v31);
        goto LABEL_18;
      }

      uint64_t v32 = @"SCPreferencesApplyChanges: %s";
    }

    else
    {
      uint64_t v32 = @"SCPreferencesCommitChanges: %s";
    }

    int v34 = SCError();
    char v35 = SCErrorString(v34);
    sub_1000188F8(0, "enable_vpn_logging", v32, v36, v37, v38, v39, v40, v35);
    goto LABEL_17;
  }

  sub_1000188F8(0, "enable_vpn_logging", @"Failed to create dictionary.", v20, v21, v22, v23, v24, v41);
LABEL_19:
  CFRelease(v16);
}

void sub_100009AD0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_100176128) {
    sub_1000188F8(0, "remove_vpn_logs", @"Removing %s", a4, a5, a6, a7, a8, (char)"/var/log/racoon.log");
  }
  if (unlink("/var/log/racoon.log") == -1)
  {
    uint64_t v8 = __error();
    strerror(*v8);
    sub_1000188F8( 0,  "remove_vpn_logs",  @"Could not unlink %s: %s",  v9,  v10,  v11,  v12,  v13,  (char)"/var/log/racoon.log");
  }

CFBooleanRef sub_100009B64()
{
  CFBooleanRef v0 = kCFBooleanFalse;
  char v1 = SCPreferencesCreate(0LL, @"eapolclient", @"com.apple.eapolclient.plist");
  if (v1)
  {
    uint64_t v7 = v1;
    CFPropertyListRef Value = SCPreferencesGetValue(v1, @"LogFlags");
    if (sub_10000EFA4(Value)) {
      CFBooleanRef v0 = kCFBooleanTrue;
    }
    CFRelease(v7);
  }

  else
  {
    sub_1000188F8(0, "copy_8021X_logging", @"Could not create configd prefs", v2, v3, v4, v5, v6, v10);
  }

  return v0;
}

void sub_100009BF0( const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!sub_10000F0A8(a1))
  {
    uint64_t v24 = @"tried to enable logging without a BOOLean";
LABEL_8:
    sub_1000188F8(0, "enable_8021X_logging", v24, v10, v11, v12, v13, v14, a9);
    return;
  }

  SCPreferencesRef v15 = SCPreferencesCreate(0LL, @"eapolclient", @"com.apple.eapolclient.plist");
  if (!v15)
  {
    uint64_t v24 = @"Could not create configd prefs";
    goto LABEL_8;
  }

  uint64_t v16 = v15;
  if (CFEqual(a1, kCFBooleanTrue))
  {
    int valuePtr = -1;
    CFNumberRef v17 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v17)
    {
      CFNumberRef v23 = v17;
      SCPreferencesSetValue(v16, @"LogFlags", v17);
      CFRelease(v23);
    }

    else
    {
      sub_1000188F8(0, "enable_8021X_logging", @"Could not create dflags number", v18, v19, v20, v21, v22, v39);
    }
  }

  else
  {
    SCPreferencesRemoveValue(v16, @"LogFlags");
  }

  if (!SCPreferencesCommitChanges(v16))
  {
    int v25 = SCError();
    char v26 = SCErrorString(v25);
    sub_1000188F8(0, "enable_8021X_logging", @"SCPreferencesCommitChanges: %s", v27, v28, v29, v30, v31, v26);
  }

  if (!SCPreferencesApplyChanges(v16))
  {
    int v32 = SCError();
    char v33 = SCErrorString(v32);
    sub_1000188F8(0, "enable_8021X_logging", @"SCPreferencesApplyChanges: %s", v34, v35, v36, v37, v38, v33);
  }

  CFRelease(v16);
}

void sub_100009D60( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_100176128) {
    sub_1000188F8( 0,  "remove_8021X_logs",  @"Removing %s",  a4,  a5,  a6,  a7,  a8,  (char)"/var/log/eapolclient.en0.log");
  }
  if (unlink("/var/log/eapolclient.en0.log") == -1)
  {
    uint64_t v8 = __error();
    strerror(*v8);
    sub_1000188F8( 0,  "remove_8021X_logs",  @"Could not unlink %s: %s",  v9,  v10,  v11,  v12,  v13,  (char)"/var/log/eapolclient.en0.log");
  }

CFTypeRef sub_100009DF4()
{
  CFBooleanRef v0 = kCFBooleanFalse;
  char v1 = SCPreferencesCreate(0LL, @"OSThermalStatus", @"OSThermalStatus.plist");
  if (v1)
  {
    uint64_t v7 = v1;
    CFPropertyListRef Value = (const __CFBoolean *)SCPreferencesGetValue(v1, @"OSThermalNotificationLoggingEnabled");
    if (Value) {
      CFBooleanRef v0 = Value;
    }
    CFRelease(v7);
  }

  else
  {
    sub_1000188F8(0, "copy_CLTM_logging", @"Could not create configd prefs", v2, v3, v4, v5, v6, v10);
  }

  return CFRetain(v0);
}

void sub_100009E70( const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!sub_10000F0A8(a1))
  {
    uint64_t v31 = @"Bad value";
LABEL_10:
    sub_1000188F8(0, "enable_CLTM_logging", v31, v10, v11, v12, v13, v14, a9);
    return;
  }

  SCPreferencesRef v15 = SCPreferencesCreate(0LL, @"OSThermalStatus", @"OSThermalStatus.plist");
  if (!v15)
  {
    uint64_t v31 = @"Could not create configd prefs";
    goto LABEL_10;
  }

  uint64_t v16 = v15;
  SCPreferencesSetValue(v15, @"logFile", @"/var/logs/cltm.log");
  SCPreferencesSetValue(v16, @"OSThermalNotificationLoggingEnabled", a1);
  if (!SCPreferencesCommitChanges(v16))
  {
    int v17 = SCError();
    char v18 = SCErrorString(v17);
    sub_1000188F8(0, "enable_CLTM_logging", @"SCPreferencesCommitChanges: %s", v19, v20, v21, v22, v23, v18);
  }

  if (!SCPreferencesApplyChanges(v16))
  {
    int v24 = SCError();
    char v25 = SCErrorString(v24);
    sub_1000188F8(0, "enable_CLTM_logging", @"SCPreferencesApplyChanges: %s", v26, v27, v28, v29, v30, v25);
  }

  CFRelease(v16);
}

void sub_100009F7C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_100176128) {
    sub_1000188F8(0, "remove_CLTM_logs", @"Removing %s", a4, a5, a6, a7, a8, (char)"/var/logs/cltm.log");
  }
  if (unlink("/var/logs/cltm.log") == -1)
  {
    uint64_t v8 = __error();
    strerror(*v8);
    sub_1000188F8( 0,  "remove_CLTM_logs",  @"Could not unlink %s: %s",  v9,  v10,  v11,  v12,  v13,  (char)"/var/logs/cltm.log");
  }

void sub_10000A010( const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!sub_10000F0A8(a1))
  {
    uint64_t v31 = @"Bad value";
LABEL_10:
    sub_1000188F8(0, "enable_CLTM_TGraph_logging", v31, v10, v11, v12, v13, v14, a9);
    return;
  }

  SCPreferencesRef v15 = SCPreferencesCreate(0LL, @"OSThermalStatus", @"OSThermalStatus.plist");
  if (!v15)
  {
    uint64_t v31 = @"Could not create configd prefs";
    goto LABEL_10;
  }

  uint64_t v16 = v15;
  SCPreferencesSetValue(v15, @"tGraphLogFile", @"/var/logs/tGraph.csv");
  SCPreferencesSetValue(v16, @"OSThermalNotificationLoggingEnabled", a1);
  if (!SCPreferencesCommitChanges(v16))
  {
    int v17 = SCError();
    char v18 = SCErrorString(v17);
    sub_1000188F8( 0,  "enable_CLTM_TGraph_logging",  @"SCPreferencesCommitChanges: %s",  v19,  v20,  v21,  v22,  v23,  v18);
  }

  if (!SCPreferencesApplyChanges(v16))
  {
    int v24 = SCError();
    char v25 = SCErrorString(v24);
    sub_1000188F8(0, "enable_CLTM_TGraph_logging", @"SCPreferencesApplyChanges: %s", v26, v27, v28, v29, v30, v25);
  }

  CFRelease(v16);
}

void sub_10000A11C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_100176128) {
    sub_1000188F8(0, "remove_CLTM_TGraph_logs", @"Removing %s", a4, a5, a6, a7, a8, (char)"/var/logs/tGraph.csv");
  }
  if (unlink("/var/logs/tGraph.csv") == -1)
  {
    uint64_t v8 = __error();
    strerror(*v8);
    sub_1000188F8( 0,  "remove_CLTM_TGraph_logs",  @"Could not unlink %s: %s",  v9,  v10,  v11,  v12,  v13,  (char)"/var/logs/tGraph.csv");
  }

void sub_10000A1B0( const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!sub_10000F0A8(a1))
  {
    uint64_t v31 = @"Bad value";
LABEL_10:
    sub_1000188F8(0, "enable_CLTM_Thermstat_logging", v31, v10, v11, v12, v13, v14, a9);
    return;
  }

  SCPreferencesRef v15 = SCPreferencesCreate(0LL, @"OSThermalStatus", @"OSThermalStatus.plist");
  if (!v15)
  {
    uint64_t v31 = @"Could not create configd prefs";
    goto LABEL_10;
  }

  uint64_t v16 = v15;
  SCPreferencesSetValue(v15, @"ThermStatsEnabled", a1);
  if (!SCPreferencesCommitChanges(v16))
  {
    int v17 = SCError();
    char v18 = SCErrorString(v17);
    sub_1000188F8( 0,  "enable_CLTM_Thermstat_logging",  @"SCPreferencesCommitChanges: %s",  v19,  v20,  v21,  v22,  v23,  v18);
  }

  if (!SCPreferencesApplyChanges(v16))
  {
    int v24 = SCError();
    char v25 = SCErrorString(v24);
    sub_1000188F8( 0,  "enable_CLTM_Thermstat_logging",  @"SCPreferencesApplyChanges: %s",  v26,  v27,  v28,  v29,  v30,  v25);
  }

  CFRelease(v16);
}

void sub_10000A2A4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_100176128) {
    sub_1000188F8( 0,  "remove_CLTM_Thermstat_logs",  @"Removing %s",  a4,  a5,  a6,  a7,  a8,  (char)"/Library/Logs/CrashReporter/*.thermstats");
  }