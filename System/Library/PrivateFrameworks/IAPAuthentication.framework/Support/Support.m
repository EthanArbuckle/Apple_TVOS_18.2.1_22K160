uint64_t start()
{
  _xpc_connection_s *mach_service;
  _xpc_connection_s *v2;
  mach_service = xpc_connection_create_mach_service("com.apple.iapauthd.xpc", 0LL, 1uLL);
  if (mach_service)
  {
    v2 = mach_service;
    xpc_connection_set_event_handler(mach_service, &stru_100018100);
    xpc_connection_resume(v2);
    dispatch_main();
  }

  NSLog(@"listener is not valid!\n");
  return 1LL;
}

void sub_100003CC0(id a1, OS_xpc_object *a2)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100003D40;
  handler[3] = &unk_100018128;
  handler[4] = a2;
  xpc_connection_set_event_handler(a2, handler);
  if (xpc_get_type(a2) != (xpc_type_t)&_xpc_type_error) {
    xpc_connection_resume(a2);
  }
}

void sub_100003D40(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_dictionary) {
    return;
  }
  string = xpc_dictionary_get_string(object, "requestType");
  if (string) {
    v5 = string;
  }
  else {
    v5 = "<nil>";
  }
  if (!strcmp(v5, "cert"))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(object);
    if (!reply)
    {
      NSLog(@"ERROR: Client sent kXPCCertStr xpc message without a reply context");
      return;
    }

    v7 = reply;
    uint64_t uint64 = xpc_dictionary_get_uint64(object, "application");
    if (uint64 >= 3)
    {
      NSLog(@"Unknown app ID %d\n", uint64);
      xpc_dictionary_set_BOOL(v7, "isValid", 0);
    }

    else
    {
      uint64_t v11 = 318767107LL - uint64;
      xpc_dictionary_set_BOOL(v7, "isValid", 0);
      sub_100009808((uint64_t)kCFAllocatorDefault, v11);
      if (v12)
      {
        v13 = v12;
        v14 = SecCertificateCopyData(v12);
        BytePtr = CFDataGetBytePtr(v14);
        size_t v16 = CFDataGetLength(v14);
        xpc_dictionary_set_data(v7, "certData", BytePtr, v16);
        xpc_dictionary_set_BOOL(v7, "isValid", 1);
        CFRelease(v13);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v7);
        if (v14) {
          CFRelease(v14);
        }
        goto LABEL_32;
      }

      NSLog(@"cert: cert %ld not found\n", v11);
    }

LABEL_31:
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v7);
LABEL_32:
    xpc_release(v7);
    return;
  }

  if (strcmp(v5, "key"))
  {
    if (strcmp(v5, "test")) {
      return;
    }
    xpc_object_t v6 = xpc_dictionary_create_reply(object);
    if (!v6)
    {
      NSLog(@"ERROR: Client sent kXPCTestStr xpc message without a reply context");
      return;
    }

    v7 = v6;
    uint64_t v8 = xpc_dictionary_get_uint64(object, "testCounter");
    NSLog( @"%s:%s-%d testCounter=%llu\n",  "/Library/Caches/com.apple.xbs/Sources/iapd/iapauthd/iapauthd.m",  "_xpc_auth_handle_connection_block_invoke",  247LL,  v8);
    xpc_dictionary_set_uint64(v7, "testCounterReply", v8);
    goto LABEL_31;
  }

  xpc_object_t v17 = xpc_dictionary_create_reply(object);
  if (v17)
  {
    v18 = v17;
    v19 = (__SecKey *)sub_10000C62C((uint64_t)kCFAllocatorDefault, 318767105LL);
    if (!v19) {
      NSLog(@"key: key %d not found\n", 318767105LL);
    }
    *(void *)&__int128 v20 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v40 = v20;
    __int128 v41 = v20;
    __int128 v38 = v20;
    __int128 v39 = v20;
    __int128 v36 = v20;
    __int128 v37 = v20;
    __int128 v34 = v20;
    __int128 v35 = v20;
    __int128 v32 = v20;
    __int128 v33 = v20;
    __int128 v30 = v20;
    __int128 v31 = v20;
    __int128 v28 = v20;
    __int128 v29 = v20;
    *(_OWORD *)sig = v20;
    __int128 v27 = v20;
    size_t length = 0LL;
    size_t sigLen = 256LL;
    data = (const uint8_t *)xpc_dictionary_get_data(object, "inData", &length);
    uint64_t v22 = SecKeyRawSign(v19, 0x8002u, data, length, sig, &sigLen);
    int v23 = v22;
    if ((_DWORD)v22) {
      NSLog(@"key: SecKeyRawSign failed, status=%d\n", v22);
    }
    else {
      xpc_dictionary_set_data(v18, "outData", sig, sigLen);
    }
    xpc_dictionary_set_BOOL(v18, "isValid", v23 == 0);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v18);
    if (v19) {
      CFRelease(v19);
    }
    xpc_release(v18);
  }

  else
  {
    NSLog(@"ERROR: Client sent kXPCKeyStr xpc message without a reply context");
  }
}

void sub_100004100(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 ^ (940831517 * (a1 ^ 0xA299CC3C));
  int v2 = *(_DWORD *)(*(void *)(a1 + 24) + 4LL);
  if (v2 + 2103497250 < 0) {
    int v3 = *(_DWORD *)(*(void *)(a1 + 24) + 4LL);
  }
  else {
    int v3 = 87972796 - v2;
  }
  __asm { BR              X13 }

uint64_t sub_100004218@<X0>( uint64_t a1@<X3>, uint64_t a2@<X4>, int a3@<W8>, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  BOOL v16 = v15 < v12;
  if (v16 == v13 + 393703043 < v12) {
    BOOL v16 = v13 + 393703043 < v15;
  }
  *((_DWORD *)&a12 + v13 + a3) = *(_DWORD *)(*(void *)(a2 + 8) + 4LL * (v13 + a3));
  return ((uint64_t (*)(void))((char *)&loc_10000422C + *(int *)(a1 + 4LL * (v14 + v16 + 25))))();
}

void sub_100004288()
{
}

uint64_t sub_100004294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  if (a6 + 15597856 < -2087899394 != v6 - 303821947 < -2087899394) {
    BOOL v8 = a6 + 15597856 < -2087899394;
  }
  else {
    BOOL v8 = v6 - 303821947 < a6 + 15597856;
  }
  return ((uint64_t (*)())((char *)sub_100004294 + *(int *)(a4 + 4LL * (v8 + v7))))();
}

uint64_t sub_100004308@<X0>( uint64_t a1@<X3>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  BOOL v16 = v14 < v12;
  *(_DWORD *)(a10 + 4LL * (v11 + a2)) = v15;
  int v17 = v10 + v11 + 1;
  int v18 = v16 ^ (v17 < v12);
  BOOL v19 = v17 < v14;
  if (!v18) {
    BOOL v16 = v19;
  }
  return ((uint64_t (*)(void))((char *)sub_100004308 + *(int *)(a1 + 4LL * (v16 + v13))))();
}

uint64_t sub_100004368(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  else {
    int v7 = v6 + 1;
  }
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)sub_100004368 + *(int *)(a4 + 4LL * v7)))(a1, a2);
}

uint64_t sub_1000043B4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, _DWORD *a17)
{
  int v19 = (*(_DWORD *)(*(void *)(a12 + 32) + 16LL) - 2131292695) * (*a17 - 154173337);
  int v20 = 704005591 * ((v18 - 128) ^ 0xF7D78CF0);
  *(_DWORD *)(v18 - 112) = (v17 - 21) ^ v20;
  *(_DWORD *)(v18 - 108) = (v19 ^ 0x55FD3FFA) - v20 + ((2 * v19) & 0xABFA7FF4) - 1074081808;
  *(void *)(v18 - 120) = &a16;
  *(_DWORD *)(v18 - 128) = 43986398 - v20;
  *(void *)(v18 - 104) = a13;
  uint64_t v21 = ((uint64_t (*)(uint64_t))((char *)*(&off_100018BB0 + v17 - 23) - 15))(v18 - 128);
  BOOL v22 = a11 + 1983530591 > 2027516990;
  if (a11 + 1983530591 < -119966659) {
    BOOL v22 = 1;
  }
  return ((uint64_t (*)(uint64_t))((char *)sub_10000450C + dword_1000126C0[v22 + 5 + v17]))(v21);
}

uint64_t sub_10000483C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, char a15)
{
  int v23 = 520147679 * ((v22 - 128) ^ 0xD061A127);
  *(_DWORD *)(v22 - 112) = v17 - v23 - 26;
  *(void *)(v22 - 120) = &a13;
  *(_DWORD *)(v22 - 128) = ((v19 ^ 0xFCF9FFE3) + ((2 * v19) & 0xF9F3FFC6) + 1607390976) ^ v23;
  sub_1000064BC((_DWORD *)(v22 - 128));
  *(_DWORD *)(v22 - 112) = v17 - 9 - ((v22 - 128) ^ v21) * v20 - 8;
  *(void *)(v22 - 128) = a12;
  *(void *)(v22 - 120) = &a15;
  uint64_t v24 = v15(v22 - 128);
  return ((uint64_t (*)(uint64_t))((char *)&sub_100004AA4
                                          + *(int *)(v18
                                                   + 4LL
                                                   * (int)(((*(_DWORD *)(v22 - 108) + v16) >> 31) + v17 - 9))))(v24);
}

uint64_t sub_100004AB0(uint64_t a1)
{
  int v1 = 1638185881 * (a1 ^ 0x11FD620);
  int v2 = *(_DWORD *)(a1 + 12) + v1;
  int v3 = *(_DWORD *)(a1 + 16) ^ v1;
  int v4 = *(_DWORD *)(*(void *)(a1 + 24) + 4LL);
  if (v4 + 2103497250 >= 0) {
    int v4 = 87972796 - v4;
  }
  else {
    int v5 = v2 + 1;
  }
  return ((uint64_t (*)(void))((char *)&loc_100004B1C + dword_1000129C0[v5]))();
}

uint64_t sub_100004B4C()
{
  int v4 = v2 - 4 * v3;
  if (v0 == 1963474407) {
    int v5 = v4 + 1;
  }
  else {
    int v5 = v4;
  }
  return ((uint64_t (*)())((char *)sub_100004B4C + *(int *)(v1 + 4LL * v5)))();
}

uint64_t sub_100004B84(uint64_t result)
{
  *(_DWORD *)(result + 8) = v1;
  return result;
}

uint64_t sub_100004B8C(uint64_t a1)
{
  return ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))((char *)sub_100004C2C
                                                                    + *(int *)(v2 + 4LL * (10 * v5 + 4 * v4 + v3 - 7))))( a1,  (10 * v5 + 4 * v4 + v3 - 2),  154173337LL,  v1);
}

uint64_t sub_100004BE8@<X0>(void *a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, int a5@<W8>)
{
  *(_BYTE *)(*a1 + (a4 + a5)) = (a3 - 154173337) >> v7;
  if (a4 - 1 == v6) {
    int v8 = a2 + 1;
  }
  else {
    int v8 = a2;
  }
  return ((uint64_t (*)())((char *)sub_100004BE8 + *(int *)(v5 + 4LL * v8)))();
}

uint64_t sub_100004CE8@<X0>(void *a1@<X0>, int a2@<W4>, int a3@<W8>)
{
  return sub_100004BE8(a1, a2 - 5, *(_DWORD *)(*(void *)(v3 + 8) + 4LL * (v5 - 164297778)), v4, a3);
}

uint64_t sub_100004D10(uint64_t a1)
{
  int v1 = *(_DWORD *)(*(void *)(a1 + 8) + 4LL);
  if (v1 + 2103497250 >= 0) {
    int v1 = 87972796 - v1;
  }
  int v2 = *(_DWORD *)(a1 + 4) + 520147679 * (a1 ^ 0xD061A127) - 5;
  return ((uint64_t (*)())((char *)sub_100004DF0 + dword_100012890[v2]))();
}

uint64_t sub_100004DA4@<X0>(int a1@<W8>)
{
  if (*(_DWORD *)(*(void *)(v2 + 8) + 4LL * (a1 - 43986399)) == 154173337) {
    int v4 = v3 + 1;
  }
  else {
    int v4 = v3;
  }
  return ((uint64_t (*)())((char *)sub_100004DA4 + *(int *)(v1 + 4LL * v4)))();
}

_DWORD *sub_100004E30(_DWORD *result)
{
  *result = 193169492;
  return result;
}

uint64_t sub_100004E40()
{
  if (v2 - 154173337 < 0) {
    int v3 = v1 + 7;
  }
  else {
    int v3 = v1 + 8;
  }
  return ((uint64_t (*)())((char *)sub_100004E88 + *(int *)(v0 + 4LL * v3)))();
}

_DWORD *sub_100004EB0@<X0>(_DWORD *result@<X0>, int a2@<W8>)
{
  *result = v2 + 32 * a2 - 1214395275;
  return result;
}

void sub_100004EC8(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) ^ (601157143 * (a1 ^ 0x5103A544));
  if (*(_DWORD *)(*(void *)(a1 + 32) + 4LL) == 43986398) {
    ++v1;
  }
  __asm { BR              X10 }

uint64_t sub_100004FEC()
{
  *(_DWORD *)(v2 + 4) = v0;
  *(void *)(v5 - 144) = &v7;
  *(void *)(v5 - 136) = v2;
  *(_DWORD *)(v5 - 128) = v4 - 37 + ((v5 - 144) ^ v3) * v1;
  return sub_100009EC0(v5 - 144);
}

void sub_100005FA0(_DWORD *a1)
{
  unsigned int v1 = a1[2] ^ (2145031067 * (a1 ^ 0x1E282685));
  uint64_t v2 = *(void *)a1;
  int v3 = *(_DWORD *)(*(void *)a1 + 4LL);
  if (v3 + 2103497250 < 0) {
    int v4 = *(_DWORD *)(*(void *)a1 + 4LL);
  }
  else {
    int v4 = 87972796 - v3;
  }
  unsigned int v7 = v1 - 1748787863 * (&v6 ^ 0x81BAC106) - 4;
  uint64_t v6 = v2;
  sub_100009FF0((uint64_t)&v6);
  else {
    unsigned int v5 = v1 + 1;
  }
  __asm { BR              X11 }

uint64_t sub_1000060D4@<X0>(uint64_t a1@<X8>)
{
  int v4 = v2 + 4 * v1;
  if (v3) {
    int v5 = v4;
  }
  else {
    int v5 = v4 + 1;
  }
  return ((uint64_t (*)())((char *)sub_1000060D4 + *(int *)(a1 + 4LL * v5)))();
}

uint64_t sub_100006108@<X0>(uint64_t a1@<X8>)
{
  int v7 = v1 + 1;
  *(_DWORD *)(*(void *)(v2 + 8) + 4LL * (v3 + v5 + v4 + 499540002)) = *(_DWORD *)(*(void *)(v2 + 8)
                                                                                  + 4LL * (v3 - 43986399));
  return ((uint64_t (*)())((char *)sub_100006174 + *(int *)(a1 + 4LL * v7)))();
}

void sub_100006174()
{
}

uint64_t sub_100006188@<X0>(uint64_t a1@<X8>)
{
  return ((uint64_t (*)(void))((char *)sub_100006188
                                         + *(int *)(a1 + 4LL * (int)(v1 + ((v3 + v2 - 1) >> 31)))))( (((v3 + v2 - 1) >> 31) | (8 * ((v3 + v2 - 1) >> 31)))
}

void sub_1000064BC(_DWORD *a1)
{
  unsigned int v1 = 520147679 * (a1 ^ 0xD061A127);
  unsigned int v2 = a1[4] + v1;
  if ((*a1 ^ v1) + 590817565 > 0x80000000) {
    ++v2;
  }
  __asm { BR              X14 }

uint64_t sub_100006568@<X0>(uint64_t a1@<X8>)
{
  unsigned int v4 = 2145031067 * (&v6 ^ 0x1E282685);
  int v7 = (v2 + 3) ^ v4;
  unsigned int v8 = v1 - v4 - ((v3 + 1181635130) & 0x828CF85A) - 461527734;
  uint64_t v6 = a1;
  return ((uint64_t (*)(uint64_t *))((char *)*(&off_100018BB0 + v2 + 34) - 10))(&v6);
}

void sub_100006664(uint64_t a1)
{
  if (*(void *)(a1 + 24)) {
    int v1 = *(_DWORD *)(a1 + 56) ^ (1685429429 * (a1 ^ 0x377F83D5));
  }
  else {
    int v1 = (*(_DWORD *)(a1 + 56) ^ (1685429429 * (a1 ^ 0x377F83D5))) + 1;
  }
  __asm { BR              X12 }

uint64_t sub_100006734@<X0>(int a1@<W8>)
{
  return ((uint64_t (*)())((char *)sub_100006734
                                   + *(int *)(v3
                                            + 4LL
                                            * (((*(_DWORD *)(v4 + 40) + a1 == 1378624176) | (*(void *)(v4 + 32) == 0x5F40CF076E63375DLL) & (*(void *)(v4 + 8) == 0x78AECEE7BAC7D299LL))
                                             + v1
                                             + 2 * v2))))();
}

uint64_t sub_1000067A8()
{
  return ((uint64_t (*)())((char *)sub_1000067A8
                                   + *(int *)(v2
                                            + 4LL
                                            * ((v3[6] == 0LL || v3[2] == 0LL && v3[8] == 0x33B0908EC5FFAF74LL)
                                             + v0
                                             + 2 * ((v1 ^ 1) - v1)))))();
}

uint64_t sub_100006808@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  if (a9 == 0x78AECEE7BAC7D299LL) {
    int v12 = v9 - 6 * (v10 ^ 1) - 4 * v10 + 1;
  }
  else {
    int v12 = v9 - 6 * (v10 ^ 1) - 4 * v10;
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)sub_100006808 + *(int *)(v11 + 4LL * v12)))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a1);
}

uint64_t sub_1000068A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char *a18, char *a19, uint64_t a20, char a21, uint64_t a22, char a23, uint64_t a24, char a25, uint64_t a26, char a27, uint64_t a28, char a29)
{
  int v36 = v30 - 2;
  int v37 = 1836812333 * ((v35 - 144) ^ 0x4065F266);
  *(_DWORD *)(v35 - 128) = v37 + v31 + 401354436;
  *(void *)(v35 - 136) = v29;
  *(_DWORD *)(v35 - 112) = v37 + v30 - 8;
  *(void *)(v35 - 120) = &a21;
  ((void (*)(uint64_t))(*(void *)(v32 + 8LL * (v30 + 46)) - 7LL))(v35 - 144);
  a18 = &a29;
  a19 = &a23;
  HIDWORD(v55) = v36 - 8;
  *(void *)(v35 - 128) = v34;
  *(void *)(v35 - 144) = &a18;
  int v38 = v36 - 8 + 520147679 * ((v35 - 144) ^ 0xD061A127);
  *(_DWORD *)(v35 - 136) = v38;
  v56 = (void (*)(uint64_t))(*(void *)(v32 + 8LL * (v36 + 41)) - 10LL);
  v56(v35 - 144);
  LODWORD(v55) = (v36 - 3) ^ (940831517 * ((v35 - 144) ^ 0xA299CC3C));
  *(_DWORD *)(v35 - 144) = v55;
  *(void *)(v35 - 136) = v34;
  *(void *)(v35 - 128) = &a25;
  *(void *)(v35 - 120) = &a21;
  *(void *)(v35 - 112) = &a18;
  __int128 v39 = (void (*)(uint64_t))(*(void *)(v32 + 8LL * (v36 + 32)) - 7LL);
  v39(v35 - 144);
  __int128 v40 = a19;
  *(void *)(v35 - 120) = v34;
  *(void *)(v35 - 112) = v40;
  *(void *)(v35 - 136) = &a25;
  *(void *)(v35 - 128) = &a25;
  int v41 = v36 - 704005591 * ((v35 - 144) ^ 0xF7D78CF0);
  *(_DWORD *)(v35 - 104) = v41;
  *(void *)(v35 - 144) = &a18;
  v42 = (void (*)(uint64_t))(*(void *)(v32 + 8LL * (v36 + 10)) - 3LL);
  v42(v35 - 144);
  *(void *)(v35 - 128) = &a25;
  *(void *)(v35 - 120) = a14;
  *(void *)(v35 - 144) = v34;
  *(void *)(v35 - 112) = &a25;
  *(void *)(v35 - 104) = &a18;
  int v43 = (v36 - 9) ^ (601157143 * ((v35 - 144) ^ 0x5103A544));
  *(_DWORD *)(v35 - 136) = v43;
  v44 = (void (*)(uint64_t))(*(void *)(v32 + 8LL * (v36 + 36)) - 11LL);
  v44(v35 - 144);
  *(void *)(v35 - 128) = v33;
  *(_DWORD *)(v35 - 136) = v38;
  *(void *)(v35 - 144) = &a18;
  v56(v35 - 144);
  *(void *)(v35 - 136) = v33;
  *(void *)(v35 - 128) = &a27;
  *(_DWORD *)(v35 - 144) = v55;
  *(void *)(v35 - 120) = &a21;
  *(void *)(v35 - 112) = &a18;
  v39(v35 - 144);
  v45 = a19;
  *(void *)(v35 - 144) = &a18;
  *(void *)(v35 - 136) = &a27;
  *(_DWORD *)(v35 - 104) = v41;
  *(void *)(v35 - 120) = v33;
  *(void *)(v35 - 112) = v45;
  *(void *)(v35 - 128) = &a27;
  v42(v35 - 144);
  *(void *)(v35 - 128) = &a27;
  *(void *)(v35 - 120) = a12;
  *(void *)(v35 - 144) = v33;
  *(void *)(v35 - 112) = &a27;
  *(void *)(v35 - 104) = &a18;
  *(_DWORD *)(v35 - 136) = v43;
  v44(v35 - 144);
  *(void *)(v35 - 136) = &a25;
  *(void *)(v35 - 128) = &a27;
  *(_DWORD *)(v35 - 144) = (v36 - 5) ^ (56516261 * ((v35 - 144) ^ 0x15EBF17D));
  ((void (*)(uint64_t))((char *)*(&off_100018BB0 + v36 + 26) - 3))(v35 - 144);
  *(_DWORD *)(v35 - 132) = v36 - 8 - 1748787863 * ((v35 - 144) ^ 0x81BAC106);
  *(void *)(v35 - 144) = &a27;
  sub_100009FF0(v35 - 144);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(uint64_t)))((char *)&loc_100006954 + dword_100012960[(*(_DWORD *)(v35 - 136) + 860424136 >= 0) + v36]))( v46,  v47,  v48,  v49,  v50,  v51,  v52,  v53,  a9,  v55,  v42);
}

uint64_t sub_100006BD8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void (*a11)(uint64_t), uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, char a27)
{
  *(void *)(v31 - 136) = v28;
  *(void *)(v31 - 128) = v29;
  *(_DWORD *)(v31 - 144) = (v27 + 1) ^ (191237807 * ((v31 - 144) ^ 0xDBC9B6B1));
  v30(v31 - 144);
  uint64_t v32 = a19;
  int v33 = v27 - 704005591 * ((v31 - 144) ^ 0xF7D78CF0) + 7;
  *(_DWORD *)(v31 - 104) = v33;
  *(void *)(v31 - 120) = v28;
  *(void *)(v31 - 112) = v32;
  *(void *)(v31 - 136) = &a27;
  *(void *)(v31 - 128) = &a27;
  *(void *)(v31 - 144) = &a18;
  a11(v31 - 144);
  *(void *)(v31 - 128) = a13;
  *(void *)(v31 - 120) = v28;
  *(_DWORD *)(v31 - 104) = v33;
  *(void *)(v31 - 144) = &a18;
  *(void *)(v31 - 136) = &a27;
  *(void *)(v31 - 112) = &a27;
  a11(v31 - 144);
  *(void *)(v31 - 144) = a14;
  *(void *)(v31 - 128) = &a27;
  *(_DWORD *)(v31 - 136) = (v27 - 191875500) ^ (520147679 * ((v31 - 144) ^ 0xD061A127));
  sub_10000C570(v31 - 144);
  *(_DWORD *)(v31 - 144) = (v27 + 1) ^ (191237807 * ((v31 - 144) ^ 0xDBC9B6B1));
  *(void *)(v31 - 136) = &a25;
  *(void *)(v31 - 128) = &a27;
  v30(v31 - 144);
  *(void *)(v31 - 144) = &a27;
  *(void *)(v31 - 136) = &a25;
  *(_DWORD *)(v31 - 128) = v27 + 523995289 * ((v31 - 144) ^ 0x98567068) - 2;
  uint64_t v34 = sub_100009EC0(v31 - 144);
  if (a15 == 0x33B0908EC5FFAF74LL) {
    int v35 = v27 + 1;
  }
  else {
    int v35 = v27;
  }
  return ((uint64_t (*)(uint64_t))((char *)&loc_100006C18 + dword_100012960[v35 + 10]))(v34);
}

uint64_t sub_100006DA0@<X0>(int a1@<W8>)
{
  int v4 = 1638185881 * ((v3 - 144) ^ 0x11FD620);
  *(void *)(v3 - 144) = v6;
  *(void *)(v3 - 120) = v2;
  *(_DWORD *)(v3 - 132) = a1 - v4 - 12;
  *(_DWORD *)(v3 - 128) = (v8 + 584850231) ^ v4;
  uint64_t result = ((uint64_t (*)(uint64_t))((char *)*(&off_100018BB0 + a1 - 1) - 15))(v3 - 144);
  _DWORD *v7 = v8;
  *int v1 = 55259370;
  return result;
}

void sub_100006EB0(_DWORD *a1)
{
  unsigned int v1 = 523995289 * (a1 ^ 0x98567068);
  int v2 = a1[4] ^ v1;
  if (*a1 - v1 + 855302443 > 0x80000000) {
    ++v2;
  }
  __asm { BR              X12 }

uint64_t sub_100006F4C@<X0>(uint64_t a1@<X8>)
{
  unsigned int v4 = 520147679 * (&v7 ^ 0xD061A127);
  int v5 = v2 + 2;
  int v9 = v5 + v4;
  int v7 = v1 + v4 - ((v3 + 1710604886) & 0x5050D09A) - 618444424;
  uint64_t v8 = a1;
  return ((uint64_t (*)(int *))((char *)*(&off_100018BB0 + v5) - 3))(&v7);
}

void sub_100007058(void *a1)
{
  int v1 = *(_DWORD *)(a1[2] + 4LL);
  int v2 = 87972796 - v1;
  if (v1 + 2103497250 < 0) {
    int v2 = *(_DWORD *)(a1[2] + 4LL);
  }
  int v3 = *(_DWORD *)(*a1 + 4LL);
  if (v3 + 2103497250 < 0) {
    int v4 = *(_DWORD *)(*a1 + 4LL);
  }
  else {
    int v4 = 87972796 - v3;
  }
  __asm { BR              X15 }

void sub_100007144(uint64_t a1, int a2)
{
  *(_DWORD *)(v2 + 4) = a2;
}

void sub_100007748(void *a1)
{
  int v1 = *(_DWORD *)(a1[1] + 4LL) + 551755899;
  int v2 = *(_DWORD *)(*a1 + 4LL) + 551755899;
  int v3 = (v1 < -1551741351) ^ (v2 < -1551741351);
  BOOL v4 = v1 > v2;
  if (v3) {
    BOOL v5 = v1 < -1551741351;
  }
  else {
    BOOL v5 = v4;
  }
  __asm { BR              X15 }

uint64_t sub_1000077DC(uint64_t a1, int a2)
{
  int v6 = v3 - ((v5 ^ 1) & 0xFFFFFFFB | (4 * ((v5 ^ 1) & 1)));
  int v7 = v4 + 674204201;
  BOOL v8 = v7 < -1429293049;
  BOOL v9 = a2 + 674204201 < v7;
  if (a2 + 674204201 < -1429293049 != v8) {
    BOOL v9 = v8;
  }
  return ((uint64_t (*)())((char *)sub_1000077DC + *(int *)(v2 + 4LL * (v6 + v9))))();
}

uint64_t sub_100007844(uint64_t a1, int a2)
{
  if (a2 + 2103497250 < 0) {
    int v5 = a2;
  }
  else {
    int v5 = 87972796 - a2;
  }
  return ((uint64_t (*)(uint64_t, void))((char *)sub_1000079A8
                                                  + *(int *)(v2
                                                           + 4LL
                                                           * (int)(((v5 + 2103497249) >> 31)
                                                                 + (v4 & 0xFFFFFFF9 | (4 * (v4 & 1)) | (2 * ((v4 ^ 1) & 1)))
                                                                 + v3
                                                                 + 1))))( a1,  (v5 - 1));
}

uint64_t sub_1000078E4@<X0>(int a1@<W3>, int a2@<W4>, uint64_t a3@<X8>)
{
  uint64_t v7 = 4LL * (a2 - 43986399);
  int v8 = *(_DWORD *)(*(void *)(a3 + 8) + v7);
  LODWORD(v7) = *(_DWORD *)(*(void *)(v3 + 8) + v7) + v6;
  BOOL v9 = v7 < v5;
  BOOL v10 = v7 > v8 + v6;
  if (v9 != v8 + v6 < v5) {
    BOOL v11 = v9;
  }
  else {
    BOOL v11 = v10;
  }
  return ((uint64_t (*)())((char *)sub_1000078E4 + *(int *)(v4 + 4LL * (v11 + a1))))();
}

uint64_t sub_10000794C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, uint64_t a7, int a8)
{
  int v11 = a4 - 2 * (a8 ^ 1) + 7 * a8;
  unsigned int v12 = a5 + v10;
  unsigned int v13 = a6 + v10;
  int v14 = (v12 < v9) ^ (v13 < v9);
  BOOL v15 = v12 < v13;
  if (v14) {
    BOOL v15 = v13 < v9;
  }
  return ((uint64_t (*)())((char *)sub_10000794C + *(int *)(v8 + 4LL * (v11 + v15))))();
}

uint64_t sub_100007A14(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 8);
  **(_DWORD **)(v1 + 8) = 154173338;
  *(_DWORD *)(v1 + 4) = 43986399;
  return result;
}

uint64_t sub_100007A38()
{
  return 1LL;
}

uint64_t sub_100007A40(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return ((uint64_t (*)(void))((char *)&loc_100007A60 + dword_1000129A8[(a2 != 0 && a3 == 8 && a4 == 100) + 1]))();
}

uint64_t sub_100007A80(uint64_t a1, _DWORD *a2)
{
  uint64_t result = 0LL;
  **(_DWORD **)(a1 + 24) = *a2 - ((2 * *a2) & 0x1B7B7214) + 230537482;
  return result;
}

uint64_t sub_100007AB4()
{
  return 4294967246LL;
}

uint64_t sub_100007ABC(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 ^ (523995289 * (a1 ^ 0x98567068));
  int v2 = *(_DWORD *)(*(void *)(a1 + 8) + 4LL);
  if (v2 + 2103497250 < 0) {
    int v3 = *(_DWORD *)(*(void *)(a1 + 8) + 4LL);
  }
  else {
    int v3 = 87972796 - v2;
  }
  int v4 = v1 + 3;
  return ((uint64_t (*)())((char *)sub_100007BA4 + dword_100012820[v4]))();
}

uint64_t sub_100007B68@<X0>(uint64_t a1@<X8>)
{
  if (*(_DWORD *)(*(void *)(a1 + 8) + 4LL * v1) == 154173337) {
    int v4 = v3 + 1;
  }
  else {
    int v4 = v3;
  }
  return ((uint64_t (*)())((char *)sub_100007B68 + *(int *)(v2 + 4LL * v4)))();
}

uint64_t sub_100007BEC(uint64_t result)
{
  *(_DWORD *)(result + 4) = v1;
  return result;
}

void sub_100007BF4(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(a1 + 8) + 4LL) == 43986398) {
    int v1 = (*(_DWORD *)a1 ^ (191237807 * (a1 ^ 0xDBC9B6B1))) + 1;
  }
  else {
    int v1 = *(_DWORD *)a1 ^ (191237807 * (a1 ^ 0xDBC9B6B1));
  }
  __asm { BR              X14 }

uint64_t sub_100007C68(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(a1 + 16) + 4LL) == v3) {
    int v5 = v1 + 2 * v4 + 1;
  }
  else {
    int v5 = v1 + 2 * v4;
  }
  return ((uint64_t (*)())((char *)sub_100007C68 + *(int *)(v2 + 4LL * v5)))();
}

uint64_t sub_100007CA4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = a1;
  uint64_t v5 = v1;
  unsigned int v6 = v2 + 523995289 * (&v4 ^ 0x98567068) - 2;
  return sub_100009EC0((uint64_t)&v4);
}

uint64_t sub_100007DDC(_DWORD *a1)
{
  unsigned int v1 = 1748787863 * (a1 ^ 0x81BAC106);
  unsigned int v2 = a1[2] - v1;
  int v3 = a1[3] ^ v1;
  if (v3 + 2010670055 >= 0) {
    int v3 = 273627186 - v3;
  }
  int v4 = *(_DWORD *)(*(void *)a1 + 4LL);
  if (v4 + 2103497250 >= 0) {
    int v4 = 87972796 - v4;
  }
  return ((uint64_t (*)(void))((char *)&loc_100007E8C
                            + dword_100012880[v2
                                            + (v4 + 1412415966 < -691081284
                                            || (int)(((v3 - 136813593) >> 5) + 1456402364) < v4 + 1412415966)]))();
}

uint64_t sub_100007EAC@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  return result;
}

uint64_t sub_100007EE8(uint64_t result)
{
  *(_DWORD *)(result + 16) = 754149948;
  return result;
}

void sub_100007EF8(uint64_t a1)
{
  if ((*(_DWORD *)(*(void *)(a1 + 32) + 4LL) - 43986398) * (*(_DWORD *)(*(void *)(a1 + 16) + 4LL) - 43986398)) {
    int v1 = *(_DWORD *)(a1 + 40) + 704005591 * (a1 ^ 0xF7D78CF0);
  }
  else {
    int v1 = *(_DWORD *)(a1 + 40) + 704005591 * (a1 ^ 0xF7D78CF0) + 1;
  }
  __asm { BR              X17 }

void sub_100007FE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(a3 + 4) = v3;
}

uint64_t sub_100008DF8(uint64_t result)
{
  **(_DWORD **)(result + 24) = 230537482;
  return result;
}

int *sub_100008E0C(int *result)
{
  else {
    int v1 = 1632539680;
  }
  *uint64_t result = v1;
  return result;
}

void sub_100008E44(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 24) + 56516261 * (a1 ^ 0x15EBF17D);
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = *(_DWORD *)(v2 + 4);
  if (v3 + 2103497250 < 0) {
    int v4 = *(_DWORD *)(v2 + 4);
  }
  else {
    int v4 = 87972796 - v3;
  }
  int v5 = *(_DWORD *)(*(void *)(a1 + 16) + 4LL);
  if (v5 + 2103497250 < 0) {
    int v6 = *(_DWORD *)(*(void *)(a1 + 16) + 4LL);
  }
  else {
    int v6 = 87972796 - v5;
  }
  unsigned int v11 = v1 - 1748787863 * (&v10 ^ 0x81BAC106) - 7;
  uint64_t v10 = v2;
  sub_100009FF0((uint64_t)&v10);
  BOOL v7 = v4 + 1776303881 < v6 + 1776303881;
  if (v4 + 1776303881 < -327193369 != v6 + 1776303881 < -327193369) {
    BOOL v7 = v6 + 1776303881 < -327193369;
  }
  if (v7) {
    int v8 = v4;
  }
  else {
    int v8 = v6;
  }
  else {
    int v9 = v1 + 1;
  }
  __asm { BR              X0 }

uint64_t sub_100008FF0()
{
  int v11 = v7 + 1;
  BOOL v12 = v6 < v10;
  uint64_t v13 = 4LL * (v5 + v1);
  int v14 = v2 - 1103106517 + *(_DWORD *)(*(void *)(v9 + 8) + v13) + v3 + *(_DWORD *)(*(void *)(v8 + 8) + v13) + v3;
  *(_DWORD *)(*(void *)(v0 + 8) + v13) = (v14 ^ 0x6BB07FDF) + ((2 * v14) & 0xD760FFBE) - 1652555846;
  if (v12 == v5 - 1303012281 < v10) {
    BOOL v12 = v5 - 1303012281 < v6;
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))((char *)&sub_1000090F4 + *(int *)(v4 + 4LL * (v12 + v11))))( 1806729183LL,  3613458366LL,  2642411450LL,  0xFFF7F2FEFE7FFFEFLL,  0x1FCFFFFDELL,  0x3CFFBD53BFBFEE3CLL,  2991955015LL);
}

uint64_t sub_1000090F8()
{
  int v4 = v3 + 984662679;
  if (v3 + 984662679 < -1118834571 != v1 - 1082083370 < -1118834571) {
    BOOL v5 = v4 < -1118834571;
  }
  else {
    BOOL v5 = v1 - 1082083370 < v4;
  }
  return ((uint64_t (*)())((char *)sub_1000090F8 + *(int *)(v0 + 4LL * (v5 + v2))))();
}

uint64_t sub_100009160(int a1, int a2, int a3)
{
  BOOL v12 = a3 < a2;
  int v13 = a1 + v8 + 1;
  int v14 = v12 ^ (v13 < a2);
  BOOL v15 = v13 < a3;
  if (!v14) {
    BOOL v12 = v15;
  }
  uint64_t v16 = 4LL * (v8 + v4);
  int v17 = v9 + v5 + *(_DWORD *)(*(void *)(v11 + 8) + v16) + v6;
  *(_DWORD *)(*(void *)(v3 + 8) + v16) = (v17 ^ 0xEB75FFBF) + ((2 * v17) & 0xD6EBFF7E) + 498761690;
  return ((uint64_t (*)(void))((char *)&sub_10000923C + *(int *)(v7 + 4LL * (v10 + v12 + 2))))();
}

uint64_t sub_100009240()
{
  BOOL v4 = v1 - 1201591223 < v3 + 865154826;
  if (v3 + 865154826 < -1238342424 != v1 - 1201591223 < -1238342424) {
    BOOL v4 = v3 + 865154826 < -1238342424;
  }
  return ((uint64_t (*)())((char *)sub_100009240 + *(int *)(v0 + 4LL * (v4 + v2))))();
}

uint64_t sub_1000092AC(int a1, int a2, int a3)
{
  int v12 = v11 + 9;
  BOOL v13 = a3 < a2;
  uint64_t v14 = 4LL * (v8 + v4);
  int v15 = v9 + v5 + *(_DWORD *)(*(void *)(v10 + 8) + v14) + v6;
  *(_DWORD *)(*(void *)(v3 + 8) + v14) = (v15 ^ 0x4B757FFD) + ((2 * v15) & 0x96EAFFFA) - 1111818340;
  int v16 = a1 + v8 + 1;
  LODWORD(v14) = v13 ^ (v16 < a2);
  BOOL v17 = v16 < a3;
  if (!(_DWORD)v14) {
    BOOL v13 = v17;
  }
  return ((uint64_t (*)(void))((char *)&sub_100009388 + *(int *)(v7 + 4LL * (v13 + v12))))();
}

uint64_t sub_10000938C()
{
  if (v2 == v0) {
    int v4 = v3 + 1;
  }
  else {
    int v4 = v3;
  }
  return ((uint64_t (*)())((char *)sub_10000938C + *(int *)(v1 + 4LL * v4)))();
}

void sub_1000093A8(int a1@<W8>)
{
  *(_DWORD *)(v1 + 4) = (((v3 + v2) * (a1 - 1287059512)) ^ 0x179FFDDE)
                      + ((2 * (v3 + v2) * (a1 - 1287059512)) & 0x2F3FFBBC)
                      - 352374784;
}

void sub_100009468(uint64_t a1)
{
  int v1 = 2145031067 * (a1 ^ 0x1E282685);
  else {
    int v2 = (*(_DWORD *)(a1 + 28) ^ v1) + 1;
  }
  __asm { BR              X11 }

_DWORD *sub_1000094D4(_DWORD *result)
{
  *uint64_t result = -26763466;
  return result;
}

void sub_100009808(uint64_t a1, int a2)
{
  if ((a2 & 0x3F000000) == 0x13000000LL) {
    int v2 = 6;
  }
  else {
    int v2 = 5;
  }
  __asm { BR              X9 }

uint64_t sub_10000987C@<X0>(int a1@<W1>, int a2@<W8>, uint64_t a3)
{
  int v4 = a1 & 0xFFFFFF | 0x1000000;
  HIDWORD(a3) = (-1936509886 * a2 + 1166996055) ^ (704005591 * (&a3 ^ 0xF7D78CF0));
  uint64_t v5 = nullsub_1(&a3);
  if (v4 <= 16781312)
  {
    switch(v4)
    {
      case 16777217:
        uint64_t v6 = 5LL;
        goto LABEL_17;
      case 16777218:
        uint64_t v6 = 7LL;
        goto LABEL_17;
      case 16777219:
        uint64_t v6 = 9LL;
        goto LABEL_17;
    }

    return ((uint64_t (*)(uint64_t))((char *)&loc_100009B40 + *(int *)(v3 + 36)))(v5);
  }

  if (v4 > 16785409)
  {
    if (v4 == 16785410)
    {
      uint64_t v6 = 2LL;
      goto LABEL_17;
    }

    if (v4 == 16785411)
    {
      uint64_t v6 = 3LL;
      goto LABEL_17;
    }

    return ((uint64_t (*)(uint64_t))((char *)&loc_100009B40 + *(int *)(v3 + 36)))(v5);
  }

  uint64_t v6 = 0LL;
  if (v4 != 16781313)
  {
    if (v4 == 16781314)
    {
      uint64_t v6 = 1LL;
      goto LABEL_17;
    }

    return ((uint64_t (*)(void))((char *)&loc_100009B40 + *(int *)(v3 + 36)))(v5);
  }

LABEL_17:
  if (v7) {
    int v8 = 7;
  }
  else {
    int v8 = 8;
  }
  return ((uint64_t (*)(uint64_t))((char *)&loc_1000099D4 + *(int *)(v3 + 4LL * v8)))(v7);
}

uint64_t sub_100009B7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W8>)
{
  int v11 = a3 + v4 * (v9 + 6);
  unsigned int v12 = v10 - 1377164863;
  if (!v3) {
    unsigned int v12 = -4;
  }
  if (v5 == v8) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 4294967292LL;
  }
  if (v6 + 4 <= v6) {
    int v14 = v11;
  }
  else {
    int v14 = v11 + 1;
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)sub_100009B7C + *(int *)(v7 + 4LL * v14)))( a1,  a2,  v13);
}

uint64_t sub_100009BF8()
{
  if (v2 != v1) {
    int v4 = v0;
  }
  else {
    int v4 = v0 + 1;
  }
  return ((uint64_t (*)())((char *)sub_100009BF8 + *(int *)(v3 + 4LL * v4)))();
}

uint64_t sub_100009C28()
{
  if (v0 >= 0x20) {
    int v3 = v2;
  }
  else {
    int v3 = v2 + 1;
  }
  return ((uint64_t (*)())((char *)sub_100009C28 + *(int *)(v1 + 4LL * v3)))();
}

uint64_t sub_100009C6C()
{
  int v4 = v1 + 9;
  __int128 v5 = *(_OWORD *)((char *)v2 + 20);
  *int v2 = *(_OWORD *)((char *)v2 + 4);
  v2[1] = v5;
  if ((v0 & 0xFFFFFFE0) == 0x20LL) {
    int v6 = v4 + 1;
  }
  else {
    int v6 = v4;
  }
  return ((uint64_t (*)())((char *)sub_100009CB0 + *(int *)(v3 + 4LL * v6)))();
}

uint64_t sub_100009CB0()
{
  __int128 v5 = *v2;
  *(__int128 *)((char *)v2 - 20) = *(v2 - 1);
  *(__int128 *)((char *)v2 - 4) = v5;
  if (v3) {
    int v6 = v0;
  }
  else {
    int v6 = v0 + 1;
  }
  return ((uint64_t (*)(void))(*(int *)(v4 + 4LL * v6) + v1))();
}

uint64_t sub_100009CE0()
{
  if (v1 == v0) {
    int v4 = v2 + 1;
  }
  else {
    int v4 = v2;
  }
  return ((uint64_t (*)())((char *)sub_100009CE0 + *(int *)(v3 + 4LL * v4)))();
}

uint64_t sub_100009D14@<X0>(uint64_t a1@<X8>)
{
  *(_BYTE *)(v3 + v2) = *(_BYTE *)(a1 + v2);
  if (v2 + 1 == v1) {
    int v6 = v5 + 6;
  }
  else {
    int v6 = v5 + 5;
  }
  return ((uint64_t (*)())((char *)sub_100009D48 + *(int *)(v4 + 4LL * v6)))();
}

uint64_t sub_100009D48@<X0>(uint64_t a1@<X8>)
{
  *(_BYTE *)(v4 + v2) = *(_BYTE *)(a1 + v2);
  if (v2 + 1 == v1) {
    int v7 = v6 + 1;
  }
  else {
    int v7 = v6;
  }
  return ((uint64_t (*)(void))(*(int *)(v5 + 4LL * v7) + v3))();
}

uint64_t sub_100009EC0(uint64_t a1)
{
  if (*(void *)a1 == *(void *)(a1 + 8)) {
    int v1 = *(_DWORD *)(a1 + 16) - 523995289 * (a1 ^ 0x98567068) + 1;
  }
  else {
    int v1 = *(_DWORD *)(a1 + 16) - 523995289 * (a1 ^ 0x98567068);
  }
  return ((uint64_t (*)(void))((char *)&loc_100009EE0 + *(int *)&asc_1000124C0[4 * v1]))();
}

uint64_t sub_100009F08@<X0>(uint64_t a1@<X8>)
{
  int v5 = v3 + 2 * v4;
  int v6 = *(_DWORD *)(a1 + 4);
  if (v6 + 2103497250 < 0) {
    int v7 = *(_DWORD *)(a1 + 4);
  }
  else {
    int v7 = 87972796 - v6;
  }
  *(_DWORD *)(v1 + 4) = v6;
  if (v7 == 43986398) {
    int v8 = v5 + 1;
  }
  else {
    int v8 = v5;
  }
  return ((uint64_t (*)())((char *)sub_100009F08 + *(int *)(v2 + 4LL * v8)))();
}

uint64_t sub_100009F60@<X0>(uint64_t a1@<X8>)
{
  int v8 = v4 + 4 * v7 - 2 * v5 - 2;
  *(_DWORD *)(*(void *)(v1 + 8) + 4LL * (v6 - 43986399)) = *(_DWORD *)(*(void *)(a1 + 8) + 4LL * (v6 - 43986399));
  if (v6 - 1 == v3) {
    int v9 = v8 + 1;
  }
  else {
    int v9 = v8;
  }
  return ((uint64_t (*)())((char *)sub_100009FB4 + *(int *)(v2 + 4LL * v9)))();
}

uint64_t sub_100009FB4@<X0>(uint64_t a1@<X8>)
{
  *(_DWORD *)(*(void *)(v1 + 8) + 4LL * (v5 + v4)) = *(_DWORD *)(*(void *)(a1 + 8) + 4LL * (v5 + v4));
  if (v5 - 1 == v3) {
    int v8 = v6 + 1;
  }
  else {
    int v8 = v6;
  }
  return ((uint64_t (*)(void))(*(int *)(v2 + 4LL * v8) + v7))();
}

void sub_100009FF0(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 12) + 1748787863 * (a1 ^ 0x81BAC106);
  uint64_t v4 = *(void *)a1;
  v3[0] = (523995289 * (v3 ^ 0x98567068)) ^ (v1 - 1);
  sub_100007ABC((uint64_t)v3);
  if (v3[1] == 1171369712) {
    int v2 = v1 + 1;
  }
  else {
    int v2 = v1;
  }
  __asm { BR              X9 }

void sub_10000A0A4(int a1@<W8>)
{
  *(_DWORD *)(v1 + 8) = a1;
}

void sub_10000A100(uint64_t a1)
{
  int v1 = 1836812333 * (a1 ^ 0x4065F266);
  else {
    int v2 = *(_DWORD *)(a1 + 32) - v1 + 1;
  }
  __asm { BR              X11 }

_DWORD *sub_10000A170(_DWORD *result)
{
  *uint64_t result = 2052067711;
  return result;
}

void sub_10000A4A0(_DWORD *a1)
{
  if (*(_DWORD *)(*(void *)a1 + 4LL) == 43986398) {
    unsigned int v1 = a1[4] - 1836812333 * (a1 ^ 0x4065F266) + 1;
  }
  else {
    unsigned int v1 = a1[4] - 1836812333 * (a1 ^ 0x4065F266);
  }
  __asm { BR              X14 }

uint64_t sub_10000B0F4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, char a20)
{
  int v29 = 520147679 * ((v28 - 120) ^ 0xD061A127);
  *(void *)(v28 - 112) = &a18;
  *(_DWORD *)(v28 - 120) = ((v23 ^ 0xDDEAD7E7) + ((2 * v23) & 0xBBD5AFCE) + 2128477948) ^ v29;
  *(_DWORD *)(v28 - 104) = v27 - v29 - 22;
  sub_1000064BC((_DWORD *)(v28 - 120));
  *(void *)(v28 - 120) = v20;
  *(void *)(v28 - 112) = &a20;
  *(_DWORD *)(v28 - 104) = v27 + 2 - ((v28 - 120) ^ v24) * v25 - 15;
  uint64_t v30 = v21(v28 - 120);
  return ((uint64_t (*)(uint64_t))((char *)&sub_10000B340
                                          + *(int *)(v22
                                                   + 4LL
                                                   * (int)(((*(_DWORD *)(v28 - 100) + v26) >> 31) + v27 + 2))))(v30);
}

uint64_t sub_10000B1C4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  *(void *)(v25 - 120) = &a18;
  *(void *)(v25 - 112) = v24;
  *(_DWORD *)(v25 - 104) = v23 - ((v25 - 120) ^ v20) * v21 - 9;
  uint64_t v26 = v18(v25 - 120);
  return ((uint64_t (*)(uint64_t))((char *)sub_10000B1C4
                                          + *(int *)(v19
                                                   + 4LL
                                                   * (int)(((*(_DWORD *)(v25 - 100) + v22) >> 31) + v23))))(v26);
}

uint64_t sub_10000B224@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
  int v16 = a1 + 5;
  *(void *)(v15 - 112) = &a11;
  *(void *)(v15 - 104) = &a13;
  *(_DWORD *)(v15 - 120) = (a1 - 19) ^ (56516261 * ((v15 - 120) ^ 0x15EBF17D));
  uint64_t v17 = ((uint64_t (*)(uint64_t))((char *)*(&off_100018BB0 + a1 + 12) - 3))(v15 - 120);
  if (v14 == 1) {
    int v18 = v16 + 1;
  }
  else {
    int v18 = v16;
  }
  return ((uint64_t (*)(uint64_t))((char *)sub_10000B2A8 + *(int *)(v13 + 4LL * v18)))(v17);
}

uint64_t sub_10000B2A8@<X0>(int a1@<W8>)
{
  return ((uint64_t (*)())((char *)sub_10000B2A8 + *(int *)(v1 + 4LL * a1)))();
}

uint64_t sub_10000B2DC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  *(_DWORD *)(v25 - 104) = v24 - ((v25 - 120) ^ v21) * v22 - 17;
  *(void *)(v25 - 120) = v18;
  *(void *)(v25 - 112) = &a18;
  uint64_t v26 = v19(v25 - 120);
  else {
    int v27 = v24 + 1;
  }
  return ((uint64_t (*)(uint64_t))((char *)sub_10000B2DC + *(int *)(v20 + 4LL * v27)))(v26);
}

void sub_10000B348(uint64_t a1)
{
  int v1 = *(_DWORD *)(*(void *)(a1 + 24) + 4LL);
  if (v1 + 2103497250 >= 0) {
    int v1 = 87972796 - v1;
  }
  else {
    int v2 = (*(_DWORD *)(a1 + 16) ^ (704005591 * (a1 ^ 0xF7D78CF0))) + 1;
  }
  __asm { BR              X12 }

uint64_t sub_10000B448( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  int v14 = v13 - 5;
  int v15 = a11 + 2010700264;
  if (a11 + 2010700264 < -92796986 != v11 + 2010700264 < -92796986) {
    BOOL v16 = v15 < -92796986;
  }
  else {
    BOOL v16 = v11 + 2010700264 < v15;
  }
  return ((uint64_t (*)())((char *)sub_10000B60C + *(int *)(v12 + 4LL * (v16 + v14))))();
}

uint64_t sub_10000B568(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, int a8)
{
  int v22 = v21 - 2;
  int v23 = v12 + v10 + *(_DWORD *)(v13 + 4 * v9) + v11 + (*(_DWORD *)(*(void *)(v14 + 8) + 4LL * v19) + v11) * a5;
  *(_DWORD *)(v13 + 4 * v9) = (v23 ^ a8) + (v15 & (2 * v23)) + v16;
  BOOL v24 = v19 + v17 < a2;
  if (a2 < a7 != v19 + 1 > v18) {
    BOOL v24 = a2 < a7;
  }
  return ((uint64_t (*)(void))(*(int *)(v8 + 4LL * (v22 + v24)) + v20))();
}

uint64_t sub_10000B6D0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  int v14 = v13 + 1;
  BOOL v15 = a11 + 604374080 < -1499123170;
  if (v15 == v11 + 604374080 < -1499123170) {
    BOOL v15 = v11 + 604374080 < a11 + 604374080;
  }
  return ((uint64_t (*)(void))((char *)&sub_10000B818 + *(int *)(v12 + 4LL * (v15 + v14))))();
}

uint64_t sub_10000B79C(uint64_t a1, uint64_t a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v16 = v14 - 4;
  unint64_t v17 = v12 - 0x13F8CA6A4C4C33DBLL + (*(_DWORD *)(v9 + 4 * v15) + v11);
  *(_DWORD *)(v9 + 4 * v15) = (v17 ^ a3) + (a4 & (2 * v17)) + a5;
  if ((a6 ^ HIDWORD(v17)) + (a7 & (v17 >> 31)) + a8 == v10) {
    int v18 = v16 + 1;
  }
  else {
    int v18 = v16;
  }
  return ((uint64_t (*)(void))(*(int *)(v8 + 4LL * v18) + v13))();
}

void sub_10000B81C(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 + 1638185881 * (a1 ^ 0x11FD620);
  int v2 = *(_DWORD *)(*(void *)(a1 + 24) + 4LL);
  if (v2 + 2103497250 < 0) {
    int v3 = *(_DWORD *)(*(void *)(a1 + 24) + 4LL);
  }
  else {
    int v3 = 87972796 - v2;
  }
  int v4 = *(_DWORD *)(*(void *)(a1 + 8) + 4LL);
  if (v4 + 2103497250 < 0) {
    int v5 = *(_DWORD *)(*(void *)(a1 + 8) + 4LL);
  }
  else {
    int v5 = 87972796 - v4;
  }
  uint64_t v9 = *(void *)(a1 + 24);
  unsigned int v10 = v1 - 1748787863 * (&v9 ^ 0x81BAC106) - 6;
  sub_100009FF0((uint64_t)&v9);
  BOOL v6 = v3 + 284898161 < v5 + 284898161;
  if (v3 + 284898161 < -1818599089 != v5 + 284898161 < -1818599089) {
    BOOL v6 = v5 + 284898161 < -1818599089;
  }
  if (v6) {
    int v7 = v3;
  }
  else {
    int v7 = v5;
  }
  else {
    int v8 = v1 + 1;
  }
  __asm { BR              X16 }

uint64_t sub_10000C0AC()
{
  return 128LL;
}

void sub_10000C0B4(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) - 520147679 * (a1 ^ 0xD061A127);
  uint64_t v2 = *(void *)(a1 + 8);
  v4[0] = (523995289 * (v4 ^ 0x98567068)) ^ (v1 - 5);
  uint64_t v5 = v2;
  sub_100007ABC((uint64_t)v4);
  if (v4[1] == 1171369712) {
    int v3 = v1 + 1;
  }
  else {
    int v3 = v1;
  }
  __asm { BR              X10 }

uint64_t sub_10000C1E4@<X0>(uint64_t a1@<X8>)
{
  int v5 = v4 - 2 * v1;
  BOOL v6 = v3 + 547817196 > v2 - 1516561325;
  if (v3 + 547817196 < -1555680054 != v2 - 1516561325 < -1555680054) {
    BOOL v6 = v3 + 547817196 < -1555680054;
  }
  return ((uint64_t (*)())((char *)sub_10000C1E4 + *(int *)(a1 + 4LL * (v5 + v6))))();
}

uint64_t sub_10000C244@<X0>(uint64_t a1@<X8>)
{
  int v4 = ((-3 * v2) & 0xFFFFFFFD | (2 * ((v2 ^ 1) & 1))) + v1;
  if (!v3) {
    ++v4;
  }
  return ((uint64_t (*)())((char *)sub_10000C244 + *(int *)(a1 + 4LL * v4)))();
}

uint64_t sub_10000C570(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8) ^ (520147679 * (a1 ^ 0xD061A127));
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)a1;
  uint64_t v4 = v2;
  v1 += 191875502;
  unsigned int v5 = v1 - 191237807 * (&v4 ^ 0xDBC9B6B1) + 3;
  return ((uint64_t (*)(uint64_t *))((char *)*(&off_100018BB0 + v1) - 10))(&v4);
}

uint64_t sub_10000C62C(uint64_t a1, uint64_t a2)
{
  int v2 = (int)(((((char)(((char)a2 % 47) % 0x85u + 20) >> 5) | 3) - 89) << 24) >> 25;
  uint64_t v3 = (uint64_t)*(&off_100018BB0 + (((v2 % 0xB2u) & v2) - 44) - 189);
  uint64_t v6 = a2;
  return ((uint64_t (*)(uint64_t, char *, uint64_t *, uint64_t, uint64_t))(v3 - 2))( a1,  (char *)*(&off_100018BB0 + ((((((((((char)((v4 >> 5) + (v4 < 0) + 13) % 104) & v2) | 0x38u)
                         % 0xE1) >> 1) & 0x3F)
                      + 23) >> 4) | 0xDA)
                   - 170)
         - 7,
           &v6,
           8LL,
           100LL);
}

void sub_10000C780(uint64_t a1)
{
  if (*(_DWORD *)(*(void *)(a1 + 8) + 4LL) == 43986398) {
    int v1 = (*(_DWORD *)a1 ^ (56516261 * (a1 ^ 0x15EBF17D))) + 1;
  }
  else {
    int v1 = *(_DWORD *)a1 ^ (56516261 * (a1 ^ 0x15EBF17D));
  }
  __asm { BR              X16 }

uint64_t sub_10000C980(uint64_t a1)
{
  int v1 = 523995289 * (a1 ^ 0x98567068);
  int v2 = *(_DWORD *)(a1 + 8) - v1;
  int v3 = *(_DWORD *)(a1 + 12) ^ v1;
  int v4 = *(_DWORD *)(*(void *)(a1 + 24) + 4LL);
  if (v4 + 2103497250 >= 0) {
    int v4 = 87972796 - v4;
  }
  else {
    int v5 = v2 + 1;
  }
  return ((uint64_t (*)(void))((char *)&loc_10000C9EC + dword_1000176E0[v5]))();
}

uint64_t sub_10000CA1C()
{
  int v4 = v2 - 2 * v3;
  if (v0 == 495746625) {
    int v5 = v4 + 1;
  }
  else {
    int v5 = v4;
  }
  return ((uint64_t (*)())((char *)sub_10000CA1C + *(int *)(v1 + 4LL * v5)))();
}

uint64_t sub_10000CA54(uint64_t result)
{
  *(_DWORD *)(result + 16) = v1;
  return result;
}

uint64_t sub_10000CA5C(uint64_t a1)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_10000CB20 + *(int *)(v1 + 4LL * (6 * v4 + 2 * v3 + v2 + 4))))(a1);
}

uint64_t sub_10000CAD0@<X0>(int a1@<W2>, int a2@<W3>, int a3@<W4>, int a4@<W8>)
{
  *(_BYTE *)(v6 + (a3 + a4)) = ((a2 - 154173337) >> v7)
  if (a3 - 1 == v5) {
    int v8 = a1 + 1;
  }
  else {
    int v8 = a1;
  }
  return ((uint64_t (*)())((char *)sub_10000CAD0 + *(int *)(v4 + 4LL * v8)))();
}

uint64_t sub_10000CBDC@<X0>(int a1@<W5>, int a2@<W8>)
{
  return sub_10000CAD0(a1 - 7, *(_DWORD *)(*(void *)(v2 + 8) + 4LL * (v4 - 1391774980)), v3, a2);
}

void sub_10000CC04(uint64_t a1)
{
  __asm { BR              X3 }

void sub_10000CD24()
{
}

uint64_t sub_10000CD4C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  int v21 = 32 * v15 - 1407564736;
  *(_DWORD *)(a11 + 16) = -467127413 - v16;
  int v22 = 1638185881 * ((v20 - 136) ^ 0x11FD620);
  *(_DWORD *)(v20 - 136) = (v19 - 21985946) ^ v22;
  *(_DWORD *)(v20 - 132) = v22 + 474351149;
  *(void *)(v20 - 128) = v17;
  sub_100007A14(v20 - 136);
  int v23 = 520147679 * ((v20 - 136) ^ 0xD061A127);
  *(_DWORD *)(v20 - 120) = v19 - 4 - v23;
  *(_DWORD *)(v20 - 136) = ((v21 ^ 0xDFCDDFF7) + ((2 * v21) & 0xBF9BBFC0) + 2096821996) ^ v23;
  *(void *)(v20 - 128) = v17;
  sub_1000064BC((_DWORD *)(v20 - 136));
  *(void *)(v20 - 136) = a14;
  *(void *)(v20 - 128) = &a15;
  *(_DWORD *)(v20 - 120) = v19 - 4 + 523995289 * ((v20 - 136) ^ 0x98567068);
  sub_100009EC0(v20 - 136);
  *(_DWORD *)(v20 - 120) = v19 - v22 + 5;
  *(void *)(v20 - 136) = a14;
  *(void *)(v20 - 128) = v17;
  uint64_t v24 = ((uint64_t (*)(uint64_t))((char *)*(&off_100018BB0 + v19 + 33) - 3))(v20 - 136);
  return ((uint64_t (*)(uint64_t))((char *)sub_10000CD4C
                                          + *(int *)(v18
                                                   + 4LL
}

uint64_t sub_10000CEEC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11)
{
  *(_DWORD *)(v15 - 120) = v14 + 523995289 * ((v15 - 136) ^ 0x98567068);
  *(void *)(v15 - 136) = v11;
  *(void *)(v15 - 128) = v12;
  uint64_t v16 = sub_100009EC0(v15 - 136);
  if (a11 >= 1) {
    int v17 = v14 + 8;
  }
  else {
    int v17 = v14 + 9;
  }
  return ((uint64_t (*)(uint64_t))((char *)sub_10000CF58 + *(int *)(v13 + 4LL * v17)))(v16);
}

uint64_t sub_10000CF58()
{
  if (v0 <= v2) {
    int v5 = v4;
  }
  else {
    int v5 = v4 + 1;
  }
  return ((uint64_t (*)(void))(*(int *)(v3 + 4LL * v5) + v1))();
}

uint64_t sub_10000CF7C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  *(void *)(v19 - 136) = a14;
  *(void *)(v19 - 128) = &a15;
  *(_DWORD *)(v19 - 120) = v17 - 2 + 523995289 * ((v19 - 136) ^ 0x98567068);
  sub_100009EC0(v19 - 136);
  int v20 = 520147679 * ((v19 - 136) ^ 0xD061A127);
  *(_DWORD *)(v19 - 120) = v17 - 2 - v20;
  *(_DWORD *)(v19 - 136) = v20 ^ 0x5CC8D6E4;
  *(void *)(v19 - 128) = v15;
  sub_1000064BC((_DWORD *)(v19 - 136));
  *(_DWORD *)(v19 - 120) = v17 - 1638185881 * ((v19 - 136) ^ 0x11FD620) + 7;
  *(void *)(v19 - 136) = a14;
  *(void *)(v19 - 128) = v15;
  uint64_t v21 = v18(v19 - 136);
  return ((uint64_t (*)(uint64_t))((char *)sub_10000CF7C
                                          + *(int *)(v16
                                                   + 4LL
}

uint64_t sub_10000D14C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12)
{
  else {
    int v14 = v13 + 1;
  }
  return ((uint64_t (*)(void))((char *)sub_10000D14C + *(int *)(v12 + 4LL * v14)))();
}

uint64_t sub_10000D1A4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  *(void *)(v19 - 112) = a14;
  *(void *)(v19 - 104) = v17;
  *(_DWORD *)(v19 - 120) = v14 + 1836812333 * ((v19 - 136) ^ 0x4065F266) - 10;
  *(void *)(v19 - 136) = v17;
  *(void *)(v19 - 128) = a11;
  uint64_t v20 = ((uint64_t (*)(uint64_t))((char *)*(&off_100018BB0 + v14 + 49) - 11))(v19 - 136);
  int v21 = v15 - 1487239123;
  if (v15 - 1487239123 < 0) {
    int v21 = v15 - 1487239122;
  }
  if ((((v21 & 0xBB4BFFA6) + ((v21 >> 1) ^ 0xDDA5FFD3) + 576323629) & v16) != 0) {
    int v22 = v14;
  }
  else {
    int v22 = v14 + 1;
  }
  return ((uint64_t (*)(uint64_t))((char *)sub_10000D1A4 + *(int *)(v18 + 4LL * v22)))(v20);
}

uint64_t sub_10000D280( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  int v21 = 520147679 * ((v20 - 136) ^ 0xD061A127);
  *(_DWORD *)(v20 - 120) = v18 - 14 - v21;
  *(_DWORD *)(v20 - 136) = v21 ^ 0x5CC8D6E4;
  *(void *)(v20 - 128) = v16;
  sub_1000064BC((_DWORD *)(v20 - 136));
  *(void *)(v20 - 136) = a14;
  *(void *)(v20 - 128) = &a15;
  *(_DWORD *)(v20 - 120) = v18 - 14 + 523995289 * ((v20 - 136) ^ 0x98567068);
  sub_100009EC0(v20 - 136);
  *(void *)(v20 - 136) = a14;
  *(void *)(v20 - 128) = v16;
  *(_DWORD *)(v20 - 120) = v18 - 1638185881 * ((v20 - 136) ^ 0x11FD620) - 5;
  uint64_t v22 = v19(v20 - 136);
  return ((uint64_t (*)(uint64_t))((char *)sub_10000D280
                                          + *(int *)(v17
                                                   + 4LL
                                                   * (int)(((*(_DWORD *)(v20 - 116) + v15) >> 31) + v18))))(v22);
}

uint64_t sub_10000D384( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  int v21 = 520147679 * ((v20 - 136) ^ 0xD061A127);
  *(_DWORD *)(v20 - 120) = v19 - v21 - 27;
  *(_DWORD *)(v20 - 136) = ((v15 ^ 0xFFCCFFF7) + ((2 * v15) & 0xFF99FFEE) + 1560008428) ^ v21;
  *(void *)(v20 - 128) = &a15;
  sub_1000064BC((_DWORD *)(v20 - 136));
  int v22 = v19 + 3;
  *(_DWORD *)(v20 - 120) = v22 - 1638185881 * ((v20 - 136) ^ 0x11FD620) - 21;
  *(void *)(v20 - 136) = a14;
  *(void *)(v20 - 128) = v16;
  uint64_t v23 = v18(v20 - 136);
  return ((uint64_t (*)(uint64_t))((char *)&sub_10000D648
                                          + *(int *)(v17
                                                   + 4LL
}

uint64_t sub_10000D490()
{
  *(_DWORD *)(v6 - 120) = v3 - 1638185881 * ((v6 - 136) ^ v5) - 3;
  *(void *)(v6 - 136) = v2;
  *(void *)(v6 - 128) = v0;
  uint64_t v7 = v4(v6 - 136);
  return ((uint64_t (*)(uint64_t))((char *)sub_10000D490
                                          + *(int *)(v1
                                                   + 4LL
}

uint64_t sub_10000D51C@<X0>( int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t), uint64_t a7, char a8)
{
  int v12 = a1 - 6;
  *(void *)(v11 - 128) = &a8;
  *(void *)(v11 - 120) = v9;
  *(_DWORD *)(v11 - 136) = (a1 - 18) ^ (56516261 * ((v11 - 136) ^ 0x15EBF17D));
  uint64_t v13 = a6(v11 - 136);
  if (v8 == 1) {
    int v14 = v12 + 1;
  }
  else {
    int v14 = v12;
  }
  return ((uint64_t (*)(uint64_t))((char *)sub_10000D5A0 + *(int *)(v10 + 4LL * v14)))(v13);
}

void sub_10000DB8C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v10[40] = a5;
  uint64_t v5 = (((unint64_t)&v10[0xFE0588DFA92FB4DFLL] + 6) * (unsigned __int128)0x2492492492492493uLL) >> 64;
  uint64_t v14 = 16LL
      * (void)((char *)&v10[0xFE0588DFA92FB4DFLL]
  int v6 = **(_DWORD **)(a1 + 24);
  v10[39] = a4;
  int v11 = a2;
  if ((v6 & 0x3E000000 ^ 0xC000000 | 0x1000000) != 0x13000000) {
    JUMPOUT(0x100012020LL);
  }
  v10[38] = 0x78AECEE7BAC7D299LL;
  LODWORD(v13) = 1377164859;
  v15[1] = (704005591 * (v15 ^ 0xF7D78CF0)) ^ 0xD2222699;
  nullsub_1(v15);
  int v7 = v6 ^ 0xDBDB90A;
  int v12 = (uint64_t (*)(void))((char *)&malloc - 2);
  if ((v6 ^ 0xDBDB90A) > 16785409)
  {
    if (v7 <= 318767104)
    {
      if (v7 == 16785410)
      {
        uint64_t v8 = 2LL;
      }

      else
      {
        if (v7 != 16785411) {
          goto LABEL_24;
        }
        uint64_t v8 = 3LL;
      }
    }

    else
    {
      switch(v7)
      {
        case 318767105:
          uint64_t v8 = 4LL;
          break;
        case 318767106:
          uint64_t v8 = 6LL;
          break;
        case 318767107:
          uint64_t v8 = 8LL;
          break;
        default:
          goto LABEL_24;
      }
    }
  }

  else if (v7 <= 16777218)
  {
    if (v7 == 16777217)
    {
      uint64_t v8 = 5LL;
    }

    else
    {
      if (v7 != 16777218) {
        goto LABEL_24;
      }
      uint64_t v8 = 7LL;
    }
  }

  else
  {
    switch(v7)
    {
      case 16777219:
        uint64_t v8 = 9LL;
        break;
      case 16781313:
        uint64_t v8 = 0LL;
        break;
      case 16781314:
        uint64_t v8 = 1LL;
        break;
      default:
LABEL_24:
        JUMPOUT(0x100011AD0LL);
    }
  }

  else {
    int v9 = 11;
  }
  __asm { BR              X10 }

uint64_t sub_100011B00( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,int a55)
{
  int v60 = v56 + v55 * (v57 + 116);
  if (*v58 < (unint64_t)(((2 * (8 * a55 - 351891184)) & 0xA4596D60)
                               + ((8 * a55 - 351891184) ^ 0x522CB6B3)
                               - 1378662067))
    ++v60;
  return ((uint64_t (*)(void))((char *)sub_100011B00 + *(int *)(v59 + 4LL * v60)))();
}

uint64_t sub_100011B6C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, int a50,int a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  int v62 = v55 - 37891;
  if (a51 == 1)
  {
    LOWORD(STACK[0x6D0]) = 8739;
    else {
      int v65 = v59 + 1;
    }
    return ((uint64_t (*)(void))((char *)&loc_100011DA0 + *(int *)(v60 + 4LL * (v65 + v58 + 130))))();
  }

  else if (a51)
  {
    LODWORD(STACK[0x6C4]) = v62;
    int v66 = 1685429429 * ((v61 - 168) ^ 0x377F83D5);
    *(void *)(v61 - 104) = 0x33B0908EC5FFAF74LL;
    *(void *)(v61 - 120) = &STACK[0x6C4];
    *(void *)(v61 - 144) = &a55;
    *(void *)(v61 - 136) = 0x5F40CF076E63375DLL;
    *(_DWORD *)(v61 - 128) = v62 - v66;
    *(_DWORD *)(v61 - 112) = (v59 + 1227424107) ^ v66;
    *(void *)(v61 - 160) = &STACK[0x78AECEE7BAC7D969];
    *(void *)(v61 - 152) = a49;
    uint64_t v67 = ((uint64_t (*)(uint64_t))((char *)*(&off_100018BB0 + v59 + 1227424159) - 14))(v61 - 168);
    if (*(_DWORD *)(v61 - 168) == v57) {
      int v68 = v59 + 1227424116;
    }
    else {
      int v68 = v59 + 1227424115;
    }
    return ((uint64_t (*)(uint64_t))((char *)&loc_100011F3C + *(int *)(v60 + 4LL * (v68 + 145))))(v67);
  }

  else
  {
    if (v56 == a48) {
      int v63 = v59 + 1;
    }
    else {
      int v63 = v59;
    }
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&loc_100011B90
                                                              + *(int *)(v60 + 4LL * (v63 + v58 + 109))))( a48,  a2,  1227424115LL);
  }

uint64_t sub_100012004()
{
  *uint64_t v0 = (v2 - 1378624176);
  return 0LL;
}