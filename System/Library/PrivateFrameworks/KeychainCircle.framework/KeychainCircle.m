uint64_t get_aks_client_connection()
{
  uint64_t result;
  if (get_aks_client_dispatch_queue_onceToken != -1) {
    dispatch_once(&get_aks_client_dispatch_queue_onceToken, &__block_literal_global_168);
  }
  dispatch_sync((dispatch_queue_t)get_aks_client_dispatch_queue_connection_queue, &__block_literal_global_150);
  result = get_aks_client_connection_connection;
  if (!get_aks_client_connection_connection)
  {
    syslog(3, "failed to open connection to %s\n", "AppleKeyStore");
    return get_aks_client_connection_connection;
  }

  return result;
}

void __get_aks_client_connection_block_invoke()
{
  if (!get_aks_client_connection_connection) {
    get_aks_client_connection_connection = _copy_aks_client_connection( "IOService:/IOResources/AppleKeyStore",  "AppleKeyStore");
  }
}

dispatch_queue_t __get_aks_client_dispatch_queue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("aks-client-queue", 0LL);
  get_aks_client_dispatch_queue_connection_queue = (uint64_t)result;
  return result;
}

uint64_t _copy_aks_client_connection(char *path, const char *a2)
{
  kern_return_t v7;
  CFDictionaryRef v8;
  io_service_t MatchingService;
  io_object_t v10;
  uint64_t result;
  kern_return_t v12;
  io_connect_t connect;
  connect = 0;
  mach_port_t v3 = *MEMORY[0x1896086B0];
  io_service_t v4 = IORegistryEntryFromPath(*MEMORY[0x1896086B0], path);
  v5 = (task_port_t *)MEMORY[0x1895FBBE0];
  if (!v4 || (io_object_t v6 = v4, v7 = IOServiceOpen(v4, *MEMORY[0x1895FBBE0], 0, &connect), IOObjectRelease(v6), v7))
  {
    v8 = IOServiceMatching(a2);
    MatchingService = IOServiceGetMatchingService(v3, v8);
    if (MatchingService)
    {
      v10 = MatchingService;
      IOServiceOpen(MatchingService, *v5, 0, &connect);
      IOObjectRelease(v10);
    }
  }

  dispatch_queue_t result = connect;
  if (connect)
  {
    v12 = IOConnectCallMethod(connect, 0, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    dispatch_queue_t result = connect;
    if (v12)
    {
      IOServiceClose(connect);
      return 0LL;
    }
  }

  return result;
}

uint64_t aks_create_bag(uint64_t a1, int a2, unsigned int a3, _DWORD *a4)
{
  return _create_bag(a1, a2, 0LL, 0, a3, -1, a4);
}

uint64_t _create_bag(uint64_t a1, int a2, uint64_t a3, int a4, unsigned int a5, int a6, _DWORD *a7)
{
  input[6] = *MEMORY[0x1895F89C0];
  uint64_t v14 = 3758097084LL;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    if (a7)
    {
      input[0] = a5;
      input[1] = a6;
      input[2] = a1;
      input[3] = a2;
      input[4] = a3;
      input[5] = a4;
      uint64_t output = 0LL;
      uint32_t outputCnt = 1;
      uint64_t v14 = IOConnectCallMethod(aks_client_connection, 2u, input, 6u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
      if (!(_DWORD)v14) {
        *a7 = output;
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "_create_bag",  ":",  187,  "",  0,  "",  "");
  }

  return v14;
}

uint64_t aks_unload_bag(int a1)
{
  input[1] = *MEMORY[0x1895F89C0];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    input[0] = a1;
    return IOConnectCallMethod(aks_client_connection, 4u, input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_unload_bag",  ":",  612,  "",  0,  "",  "");
    return 3758097084LL;
  }
}

uint64_t aks_save_bag()
{
  int v0 = MEMORY[0x1895F8858]();
  v2 = v1;
  io_service_t v4 = v3;
  int v5 = v0;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection)
  {
    mach_port_t v7 = aks_client_connection;
    uint64_t result = 3758097090LL;
    if (v4)
    {
      if (v2)
      {
        bzero(__src, 0x8000uLL);
        size_t __count = 0x8000LL;
        uint64_t input = v5;
        uint64_t result = IOConnectCallMethod(v7, 3u, &input, 1u, 0LL, 0LL, 0LL, 0LL, __src, &__count);
        if (!(_DWORD)result)
        {
          v9 = calloc(__count, 1uLL);
          *io_service_t v4 = v9;
          if (v9)
          {
            memcpy(v9, __src, __count);
            uint64_t result = 0LL;
            _DWORD *v2 = __count;
          }

          else
          {
            return 3758097085LL;
          }
        }
      }
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_save_bag",  ":",  646,  "",  0,  "",  "");
    return 3758097084LL;
  }

  return result;
}

uint64_t aks_assert_hold(int a1, unsigned int a2, uint64_t a3)
{
  input[3] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a3;
  uint64_t input[2] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x1Au, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_assert_hold",  ":",  1654,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t aks_assert_drop(int a1, unsigned int a2)
{
  uint64_t input[2] = *MEMORY[0x1895F89C0];
  input[0] = a2;
  input[1] = a1;
  mach_port_t aks_client_connection = get_aks_client_connection();
  if (aks_client_connection) {
    return IOConnectCallMethod(aks_client_connection, 0x1Bu, input, 2u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( (FILE *)*MEMORY[0x1895F89E0],  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_assert_drop",  ":",  1672,  "",  0,  "",  "");
  return 3758097084LL;
}

void sub_187D5BA3C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id location)
{
}

void sub_187D5BC68( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_187D5CBB4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, id location)
{
}

void sub_187D5D428(_Unwind_Exception *a1)
{
}

void sub_187D5D800( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

void sub_187D5DA48( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

void sub_187D5E148( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, id location, char a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, char a32)
{
}

LABEL_62:
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
}

void sub_187D5EF04(_Unwind_Exception *a1)
{
}

void sub_187D5F770(_Unwind_Exception *a1)
{
}

void sub_187D60740( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,id location)
{
}

LABEL_83:
  _Block_object_dispose(&v112, 8);
  objc_destroyWeak(&location);
}

void sub_187D616B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
}

void sub_187D61924( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
}

LABEL_18:
    [MEMORY[0x189607870] errorWithDomain:kKCPairingChannelErrorDomain code:4 userInfo:0];
    uint64_t v14 = (id)objc_claimAutoreleasedReturnValue();
    -[KCPairingChannel setNextStateError:complete:](self, "setNextStateError:complete:", v14, v9);
    goto LABEL_24;
  }

  [v10 objectForKeyedSubscript:@"v"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = [v11 isEqualToString:@"O"];

  if (!v12)
  {
    secLogObjForScope((const char *)pairingScope);
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v23 = "acceptorFirstOctagonPacket 'v' contents wrong";
      goto LABEL_17;
    }

    goto LABEL_18;
  }

  uint64_t v13 = 0;
  uint64_t v14 = 0LL;
  while (1)
  {
    secLogObjForScope((const char *)pairingScope);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = v13 + 1;
      _os_log_impl(&dword_187D59000, v15, OS_LOG_TYPE_DEFAULT, "Attempt %d fetching epoch", buf, 8u);
    }

    v24 = 0LL;
    v16 = -[KCPairingChannel fetchEpoch:error:](self, "fetchEpoch:error:", v8, &v24);
    uint64_t v14 = v24;
    if (v16)
    {
      (*((void (**)(id, void, id, void))v9 + 2))(v9, 0LL, v8, 0LL);
      goto LABEL_24;
    }

    if (!+[KCPairingChannel retryable:](&OBJC_CLASS___KCPairingChannel, "retryable:", v14)) {
      break;
    }
    secLogObjForScope((const char *)pairingScope);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = v13 + 2;
      _os_log_impl(&dword_187D59000, v17, OS_LOG_TYPE_DEFAULT, "Attempt %d retrying fetching epoch", buf, 8u);
    }

    ++v13;

    if (v13 >= epochMaxRetry)
    {
      secLogObjForScope("SecError");
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = epochMaxRetry;
      v19 = "pairing: failed to fetch epoch %d times, bailing.";
      uint64_t v20 = v18;
      v21 = 8;
      goto LABEL_22;
    }
  }

  secLogObjForScope("SecError");
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_23;
  }
  *(_DWORD *)buf = 136315650;
  v26 = pairingScope;
  uint64_t v27 = 1024;
  v28 = v13 + 1;
  v29 = 2112;
  v30 = v14;
  v19 = "%s: Attempt %d failed fetching epoch: %@";
  uint64_t v20 = v18;
  v21 = 28;
LABEL_22:
  _os_log_impl(&dword_187D59000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_23:

  (*((void (**)(id, uint64_t, void, id))v9 + 2))(v9, 1LL, 0LL, v14);
LABEL_24:
}

void sub_187D623E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
}

void sub_187D62704(_Unwind_Exception *a1)
{
}

void sub_187D63158(_Unwind_Exception *a1)
{
}

LABEL_30:
        v11 = v23;
        [v23 setObject:MEMORY[0x189604A80] forKeyedSubscript:@"e"];
LABEL_32:

        objc_autoreleasePoolPop(v19);
        v43 = v17;
        goto LABEL_33;
      }

      if ([v13 count])
      {
        secLogObjForScope("SecError");
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v31 = "pairing: temp packet size is too large for the channel. will not add anymore items";
          uint64_t v32 = v30;
          uint64_t v33 = 2;
          goto LABEL_29;
        }

        goto LABEL_30;
      }

      secLogObjForScope("pairing");
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v50 = (uint64_t)v22;
        _os_log_impl( &dword_187D59000,  v28,  OS_LOG_TYPE_DEFAULT,  "item by itself is too large for the pairing channel: %@",  buf,  0xCu);
      }

      if ((unint64_t)[obj count] < 2)
      {
        v17 = v43 + i;
        v11 = v23;
        goto LABEL_32;
      }

      secLogObjForScope("pairing");
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_187D59000,  v29,  OS_LOG_TYPE_DEFAULT,  "will attempt to add more items to the packet",  buf,  2u);
      }

LABEL_21:
      objc_autoreleasePoolPop(v19);
      v11 = v23;
    }

    v43 += i;
    v15 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v15) {
      continue;
    }
    break;
  }

LABEL_33:
  secLogObjForScope("pairing");
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = [v13 count];
    *(_DWORD *)buf = 134218242;
    v50 = v35;
    v51 = 2112;
    v52 = v13;
    _os_log_impl(&dword_187D59000, v34, OS_LOG_TYPE_DEFAULT, "acceptor will send initiator (%lu) items: %@", buf, 0x16u);
  }

  -[KCPairingChannel setItemIndex:](v42, "setItemIndex:", -[KCPairingChannel itemIndex](v42, "itemIndex") + v43);
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCPairingChannel setCountOfSentItems:](v42, "setCountOfSentItems:", v36);

  [v11 setObject:v13 forKeyedSubscript:@"a"];
  [v38 setObject:v11 forKeyedSubscript:@"o"];

  return v38;
}

void sub_187D63E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
}

void sub_187D641B4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id a21)
{
}

void sub_187D6482C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

LABEL_15:
}

LABEL_16:
  secLogObjForScope("pairing");
  v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    LODWORD(v23[0]) = v8 != 0LL;
    WORD2(v23[0]) = 2112;
    *(void *)((char *)v23 + 6) = v7;
    _os_log_impl(&dword_187D59000, v19, OS_LOG_TYPE_DEFAULT, "Exchange packet complete data: %{BOOL}d: %@", buf, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

  -[KCJoiningAcceptSession setPiggy_uuid:](self, "setPiggy_uuid:", v8);
  -[KCJoiningAcceptSession setPiggy_version:](self, "setPiggy_version:", v11);
  v18 = -[KCJoiningAcceptSession copyChallengeMessage:](self, "copyChallengeMessage:", a4);
  if (v18)
  {
    self->_state = 1;
    v19 = objc_alloc(NSString);
    -[KCJoiningAcceptSession octagon](self, "octagon");
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)[v19 initWithData:v20 encoding:4];

    *(void *)&buf = 0LL;
    *((void *)&buf + 1) = &buf;
    v56 = 0x3032000000LL;
    v57 = __Block_byref_object_copy__870;
    v58 = __Block_byref_object_dispose__871;
    uint64_t v59 = 0LL;
    if (v11 == 2 && v21 && [v21 isEqualToString:@"o"])
    {
      v46 = 0LL;
      v47 = &v46;
      v48 = 0x3032000000LL;
      v49 = __Block_byref_object_copy__870;
      v50 = __Block_byref_object_dispose__871;
      v51 = 0LL;
      v22 = -[KCJoiningAcceptSession otControl](self, "otControl");
      v23 = -[KCJoiningAcceptSession controlArguments](self, "controlArguments");
      v24 = -[KCJoiningAcceptSession joiningConfiguration](self, "joiningConfiguration");
      v45[0] = MEMORY[0x1895F87A8];
      v45[1] = 3221225472LL;
      v45[2] = __54__KCJoiningAcceptSession_processInitialMessage_error___block_invoke;
      v45[3] = &unk_18A1352C0;
      v45[4] = &buf;
      v45[5] = &v46;
      [v22 rpcEpochWithArguments:v23 configuration:v24 reply:v45];

      v25 = *(void **)(*((void *)&buf + 1) + 40LL);
      if (v25)
      {
        v26 = 0LL;
        if (a4) {
          *a4 = v25;
        }
      }

      else
      {
        v42 = +[KCJoiningMessage messageWithType:data:payload:error:]( &OBJC_CLASS___KCJoiningMessage,  "messageWithType:data:payload:error:",  1LL,  v18,  v47[5],  a4);
        [v42 der];
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }

      _Block_object_dispose(&v46, 8);
    }

    else if ((SOSCCIsSOSTrustAndSyncingEnabled() & 1) != 0 {
           || (-[KCJoiningAcceptSession joiningConfiguration](self, "joiningConfiguration"),
    }
               uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(),
               v28 = [v27 testsEnabled],
               v27,
               v28))
    {
      v34 = +[KCJoiningMessage messageWithType:data:error:]( &OBJC_CLASS___KCJoiningMessage,  "messageWithType:data:error:",  1LL,  v18,  a4);
      [v34 der];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      KCJoiningErrorCreate( 20LL,  a4,  @"Unable to piggyback with device due to lack of trust system support",  v29,  v30,  v31,  v32,  v33,  v44);
      v26 = 0LL;
    }

    _Block_object_dispose(&buf, 8);
  }

  else
  {
    secLogObjForScope("SecError");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        v35 = *a4;
      }
      else {
        v35 = 0LL;
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v35;
      _os_log_impl( &dword_187D59000,  (os_log_t)v21,  OS_LOG_TYPE_DEFAULT,  "joining: failed to copy srpMessage: %@",  (uint8_t *)&buf,  0xCu);
    }

    v26 = 0LL;
  }

LABEL_43:
  return v26;
}

void sub_187D64E74( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

Class __getACAccountStoreClass_block_invoke(uint64_t a1)
{
  if (!AppleAccountLibraryCore_frameworkLibrary)
  {
    AppleAccountLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AppleAccountLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }

  while (1)
  {
    Class result = objc_getClass("ACAccountStore");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
      break;
    }
LABEL_6:
    mach_port_t v3 = (void *)abort_report_np();
    free(v3);
  }

  getACAccountStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_187D667B4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

uint64_t getSecureBackupIsGuitarfishEnabledSymbolLoc()
{
  uint64_t v3 = 0LL;
  io_service_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v0 = getSecureBackupIsGuitarfishEnabledSymbolLoc_ptr;
  uint64_t v6 = getSecureBackupIsGuitarfishEnabledSymbolLoc_ptr;
  if (!getSecureBackupIsGuitarfishEnabledSymbolLoc_ptr)
  {
    v2[0] = MEMORY[0x1895F87A8];
    v2[1] = 3221225472LL;
    v2[2] = __getSecureBackupIsGuitarfishEnabledSymbolLoc_block_invoke;
    v2[3] = &unk_18A135408;
    v2[4] = &v3;
    __getSecureBackupIsGuitarfishEnabledSymbolLoc_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[3];
  }

  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_187D66878( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t soft_SecureBackupIsGuitarfishEnabled()
{
  IsGuitarfishEnabledSymbolLoc = (uint64_t (*)(void))getSecureBackupIsGuitarfishEnabledSymbolLoc();
  if (IsGuitarfishEnabledSymbolLoc) {
    return IsGuitarfishEnabledSymbolLoc();
  }
  dlerror();
  uint64_t v2 = abort_report_np();
  return __49__KCPairingChannel_acceptorThirdPacket_complete___block_invoke_234(v2);
}

void *__getSecureBackupIsGuitarfishEnabledSymbolLoc_block_invoke(uint64_t a1)
{
  if (CloudServicesLibraryCore_frameworkLibrary)
  {
    uint64_t v2 = (void *)CloudServicesLibraryCore_frameworkLibrary;
  }

  else
  {
    CloudServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)CloudServicesLibraryCore_frameworkLibrary;
    if (!CloudServicesLibraryCore_frameworkLibrary)
    {
      io_service_t v4 = (void *)abort_report_np();
      free(v4);
    }
  }

  Class result = dlsym(v2, "SecureBackupIsGuitarfishEnabled");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  getSecureBackupIsGuitarfishEnabledSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

LABEL_6:
}

    uint64_t v5 = 0;
  }

    uint64_t v6 = 0LL;
  }

    uint64_t v5 = 0;
  }

    uint64_t v5 = 0;
  }

void sub_187D66F38(_Unwind_Exception *a1)
{
}

void sub_187D67964(_Unwind_Exception *a1)
{
}

void sub_187D68130(_Unwind_Exception *a1)
{
}

void sub_187D68BD4(_Unwind_Exception *a1)
{
}

void sub_187D699B4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_187D6A740(_Unwind_Exception *a1)
{
}

void sub_187D6B0A4(_Unwind_Exception *a1)
{
}

void sub_187D6B5CC(_Unwind_Exception *a1)
{
}

void sub_187D6BB08(_Unwind_Exception *a1)
{
}

LABEL_39:
        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_36;
    }
  }

LABEL_7:
  return v5;
}

  return v6;
}

  return v5;
}

  return v5;
}

uint64_t OTSupportOctagonMessageReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x189611CF0];
  io_service_t v4 = (int *)MEMORY[0x189611CE8];
  uint64_t v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    mach_port_t v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0LL;
        *(_BYTE *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1LL || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(_BYTE *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }

        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_31:
        *(_DWORD *)(a1 + _Block_object_dispose(va, 8) = v19;
      }

      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
      }
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL OTSponsorToApplicantRound2M2ReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x189611CF0];
  io_service_t v4 = (int *)MEMORY[0x189611CE8];
  uint64_t v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    mach_port_t v7 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadData();
        uint64_t v18 = 8LL;
LABEL_22:
        uint64_t v19 = *(void **)(a1 + v18);
        *(void *)(a1 + v1_Block_object_dispose(va, 8) = v17;

        goto LABEL_24;
      }

      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0LL;
      }
LABEL_24:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
    }

    uint64_t v17 = PBReaderReadData();
    uint64_t v18 = 16LL;
    goto LABEL_22;
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_187D700FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

Class __getAAFAnalyticsTransportRTCClass_block_invoke(uint64_t a1)
{
  Class result = objc_getClass("AAFAnalyticsTransportRTC");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    getAAFAnalyticsTransportRTCClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)__getAAFAnalyticsReporterClass_block_invoke(v3);
  }

  return result;
}

void __getAAFAnalyticsReporterClass_block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("AAFAnalyticsReporter");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    getAAFAnalyticsReporterClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    abort_report_np();
    AAAFoundationLibrary();
  }

void AAAFoundationLibrary()
{
  if (!AAAFoundationLibraryCore_frameworkLibrary)
  {
    AAAFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AAAFoundationLibraryCore_frameworkLibrary)
    {
      uint64_t v0 = (void *)abort_report_np();
      free(v0);
    }
  }

void derive_and_init(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a4;
  id v6 = a3;
  [MEMORY[0x189603FB8] dataWithLength:*(void *)ccsha256_di()];
  mach_port_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 length];
  id v8 = v6;
  [v8 bytes];

  [v5 length];
  id v9 = v5;
  [v9 bytes];

  [v7 length];
  id v12 = v7;
  uint64_t v11 = [v12 mutableBytes];
  if (!cchkdf())
  {
    id v10 = v12;
    objc_msgSend(v10, "bytes", v11);
    ccgcm_init();
    [v10 length];
    [v10 mutableBytes];
    cc_clear();
  }
}

LABEL_17:
      id v12 = 0LL;
      goto LABEL_27;
    }

    if (SOSCCIsSOSTrustAndSyncingEnabled())
    {
      v28 = -[KCJoiningRequestCircleSession encryptPeerInfo:](self, "encryptPeerInfo:", a3);
      if (!v28) {
        goto LABEL_17;
      }
    }

    else
    {
      secLogObjForScope("joining");
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v33 = 0;
        _os_log_impl( &dword_187D59000,  v29,  OS_LOG_TYPE_DEFAULT,  "SOS not enabled, skipping peer info encryption",  v33,  2u);
      }

      v28 = 0LL;
    }

    self->_state = 0;
    v30 = -[KCJoiningRequestCircleSession encryptedInitialMessage:error:]( self,  "encryptedInitialMessage:error:",  *((void *)v41 + 5),  a3);
    v31 = +[KCJoiningMessage messageWithType:data:payload:error:]( &OBJC_CLASS___KCJoiningMessage,  "messageWithType:data:payload:error:",  4LL,  v30,  v28,  a3);
    [v31 der];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_27;
  }

  if (SOSCCIsSOSTrustAndSyncingEnabled())
  {
    -[KCJoiningRequestCircleSession encryptPeerInfo:](self, "encryptPeerInfo:", a3);
    char v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      self->_state = 0;
      +[KCJoiningMessage messageWithType:data:error:]( &OBJC_CLASS___KCJoiningMessage,  "messageWithType:data:error:",  4LL,  v13,  a3);
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 der];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v12 = 0LL;
    }

    return v12;
  }

  secLogObjForScope("SecError");
  int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_187D59000,  v15,  OS_LOG_TYPE_DEFAULT,  "joining: device does not support SOS nor piggybacking version 2",  buf,  2u);
  }

  KCJoiningErrorCreate( 14LL,  a3,  @"device does not support SOS nor piggybacking version 2",  v16,  v17,  v18,  v19,  v20,  v32[0]);
  return 0LL;
}

    return 0LL;
  }

  if (v11 != a7)
  {
    id v12 = kcder_decode_data_internal(a3, 1, a5, v11, a7);
    if (v12)
    {
      a7 = v12;
      if (*a3 && [*a3 length])
      {
        *a4 = 2LL;
        return a7;
      }

      secLogObjForScope("SecError");
      char v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = 0;
        BOOL v14 = "no octagon version set";
        int v15 = (uint8_t *)&v18;
        goto LABEL_16;
      }
    }

    else
    {
      secLogObjForScope("SecError");
      char v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v19 = 0;
        BOOL v14 = "failed to decode v2";
        int v15 = v19;
        goto LABEL_16;
      }
    }

    goto LABEL_17;
  }

  secLogObjForScope("octagon");
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_187D59000, v16, OS_LOG_TYPE_DEFAULT, "first message is piggybacking v1, no more data", buf, 2u);
  }

  return a7;
}

void sub_187D7190C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

LABEL_13:
    char v13 = 0;
    goto LABEL_14;
  }

  [v5 secondData];
  mach_port_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    secLogObjForScope("joining");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v11 = "message does not contain SOS data";
      id v12 = buf;
      goto LABEL_12;
    }

    goto LABEL_13;
  }

  if ([v6 hasSupportsSOS])
  {
    [v6 supportsSOS];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 supported];

    if (v9 == 2)
    {
      secLogObjForScope("joining");
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 0;
        uint64_t v11 = "acceptor explicitly does not support SOS";
        id v12 = (uint8_t *)&v15;
LABEL_12:
        _os_log_impl(&dword_187D59000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
        goto LABEL_13;
      }

      goto LABEL_13;
    }
  }

  char v13 = 1;
LABEL_14:

  return v13;
}

    char v13 = 0;
    goto LABEL_14;
  }

  [v5 secondData];
  mach_port_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    secLogObjForScope("joining");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v11 = "message does not contain SOS data";
      id v12 = buf;
      goto LABEL_12;
    }

    goto LABEL_13;
  }

  if ([v6 hasSupportsSOS])
  {
    [v6 supportsSOS];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 supported];

    if (v9 == 2)
    {
      secLogObjForScope("joining");
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 0;
        uint64_t v11 = "requester explicitly does not support SOS";
        id v12 = (uint8_t *)&v15;
LABEL_12:
        _os_log_impl(&dword_187D59000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
        goto LABEL_13;
      }

      goto LABEL_13;
    }
  }

  char v13 = 1;
LABEL_14:

  return v13;
}

void sub_187D721E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__388(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__389(uint64_t a1)
{
}

uint64_t MetricsEnable()
{
  metricsAreEnabled = 0;
  return 1LL;
}

uint64_t MetricsDisable()
{
  metricsAreEnabled = 1;
  return 0LL;
}

uint64_t MetricsOverrideTestsAreEnabled()
{
  return metricsAreEnabled;
}

unint64_t decode_seq_string_data(uint64_t *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a4) {
    return 0LL;
  }
  uint64_t v9 = ccder_decode_constructed_tl();
  if (!v9 || a5)
  {
    KCJoiningErrorCreate(1LL, a3, @"decode failed", v10, v11, v12, v13, v14, v17);
    return 0LL;
  }

  else
  {
    unint64_t v15 = kcder_decode_string(a1, a3, v9, 0LL);
    return kcder_decode_data_internal(a2, 1, a3, v15, 0LL);
  }

unint64_t decode_seq_data_data(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  if (!a4) {
    return 0LL;
  }
  uint64_t v9 = ccder_decode_constructed_tl();
  if (!v9 || a5)
  {
    KCJoiningErrorCreate(1LL, a3, @"decode failed", v10, v11, v12, v13, v14, v17);
    return 0LL;
  }

  else
  {
    unint64_t v15 = kcder_decode_data_internal(a1, 1, a3, v9, 0LL);
    return kcder_decode_data_internal(a2, 1, a3, v15, 0LL);
  }

uint64_t sizeof_seq_string_data(void *a1, void *a2)
{
  id v3 = a2;
  [a1 lengthOfBytesUsingEncoding:4];
  uint64_t v4 = ccder_sizeof();
  if (v4)
  {
    [v3 length];
    if (ccder_sizeof_raw_octet_string()) {
      uint64_t v4 = ccder_sizeof();
    }
    else {
      uint64_t v4 = 0LL;
    }
  }

  return v4;
}

uint64_t encode_seq_string_data(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a1;
  uint64_t v8 = kcder_encode_data(a2);
  kcder_encode_string(v7, a3, a4, v8);

  return ccder_encode_constructed_tl();
}

uint64_t sizeof_seq_data_data(void *a1, void *a2)
{
  id v3 = a2;
  [a1 length];
  uint64_t v4 = ccder_sizeof_raw_octet_string();
  if (v4)
  {
    [v3 length];
    if (ccder_sizeof_raw_octet_string()) {
      uint64_t v4 = ccder_sizeof();
    }
    else {
      uint64_t v4 = 0LL;
    }
  }

  return v4;
}

uint64_t encode_seq_data_data(void *a1, void *a2)
{
  id v3 = a1;
  kcder_encode_data(a2);
  kcder_encode_data(v3);

  return ccder_encode_constructed_tl();
}

id extractStartFromInitialMessage(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v9 = a1;
  uint64_t v10 = [v9 bytes];
  uint64_t v11 = [v9 length];

  unint64_t v12 = v10 + v11;
  id v31 = 0LL;
  unint64_t v13 = decode_initialmessage(&v31, a5, v10, v12);
  id v14 = v31;
  unint64_t v15 = v14;
  if (v13)
  {
    if (v13 == v12)
    {
LABEL_16:
      id v22 = v15;
      goto LABEL_17;
    }

    id v29 = 0LL;
    uint64_t v30 = 0LL;
    id v28 = 0LL;
    unint64_t v16 = decode_version2((uint64_t)v14, (uint64_t)&v29, &v28, &v30, a5, v13, v12);
    id v17 = v29;
    id v18 = v28;
    uint64_t v19 = v18;
    if (v16)
    {
      uint64_t v20 = v30;
      switch(v30)
      {
        case 0LL:
          *a2 = 0LL;
          goto LABEL_15;
        case 1LL:
LABEL_8:
          unint64_t v21 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607AB8]), "initWithUUIDBytes:", objc_msgSend(v17, "bytes"));
          [v21 UUIDString];
          *a3 = (id)objc_claimAutoreleasedReturnValue();
          *a2 = v20;

LABEL_15:
          goto LABEL_16;
        case 2LL:
          *a4 = v18;
          goto LABEL_8;
      }

      secLogObjForScope("SecError");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

        goto LABEL_15;
      }

      *(_WORD *)buf = 0;
      v24 = "unsupported version";
      v25 = (os_log_s *)v23;
      uint32_t v26 = 2;
    }

    else
    {
      secLogObjForScope("SecError");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 134217984;
      uint64_t v33 = v30;
      v24 = "decoding piggybacking message failed for version (%llu)";
      v25 = (os_log_s *)v23;
      uint32_t v26 = 12;
    }

    _os_log_impl(&dword_187D59000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
    goto LABEL_14;
  }

  id v22 = 0LL;
LABEL_17:

  return v22;
}

unint64_t decode_initialmessage(void *a1, void *a2, uint64_t a3, unint64_t a4)
{
  if (!a3) {
    return 0LL;
  }
  if (!ccder_decode_constructed_tl() || a4)
  {
    unint64_t v13 = @"Decoding failed";
  }

  else
  {
    uint64_t v12 = ccder_decode_uint64();
    if (v12) {
      return kcder_decode_data_internal(a1, 1, a2, v12, a4);
    }
    unint64_t v13 = @"Version mising";
  }

  KCJoiningErrorCreate(1LL, a2, v13, v7, v8, v9, v10, v11, v15);
  return 0LL;
}

unint64_t decode_version2( uint64_t a1, uint64_t a2, id *a3, void *a4, void *a5, uint64_t a6, unint64_t a7)
{
  uint64_t v11 = decode_version1(a1, a2, (uint64_t)a4, a5, a6);
  if (!v11)
  {
    secLogObjForScope("SecError");
    unint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = 0;
      id v14 = "error parsing version 1";
      uint64_t v15 = (uint8_t *)&v21;
LABEL_16:
      _os_log_impl(&dword_187D59000, v13, OS_LOG_TYPE_DEFAULT, v14, v15, 2u);
    }

uint64_t decode_version1(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  if (!a5) {
    return 0LL;
  }
  if (ccder_decode_uint64())
  {
    uint64_t v14 = 0LL;
    unint64_t v12 = @"Bad version: %llu";
    uint64_t v13 = 8LL;
  }

  else
  {
    unint64_t v12 = @"Version mising";
    uint64_t v13 = 1LL;
  }

  KCJoiningErrorCreate(v13, a4, v12, v6, v7, v8, v9, v10, v14);
  return 0LL;
}

uint64_t sizeof_initialmessage(void *a1)
{
  id v1 = a1;
  uint64_t v2 = ccder_sizeof_uint64();
  if (v2)
  {
    [v1 length];
    if (ccder_sizeof_raw_octet_string()) {
      uint64_t v2 = ccder_sizeof();
    }
    else {
      uint64_t v2 = 0LL;
    }
  }

  return v2;
}

uint64_t encode_initialmessage(void *a1)
{
  return ccder_encode_constructed_tl();
}

uint64_t sizeof_initialmessage_version2(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a1;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = ccder_sizeof_uint64();
  if (v9)
  {
    [v6 length];
    if (ccder_sizeof_raw_octet_string()
      && ccder_sizeof_uint64()
      && ([v7 length], ccder_sizeof_raw_octet_string())
      && ([v8 length], ccder_sizeof_raw_octet_string()))
    {
      uint64_t v9 = ccder_sizeof();
    }

    else
    {
      uint64_t v9 = 0LL;
    }
  }

  return v9;
}

uint64_t sizeof_initialmessage_version1(void *a1, uint64_t a2, void *a3)
{
  id v4 = a1;
  id v5 = a3;
  [v4 length];
  if (!ccder_sizeof_raw_octet_string()) {
    goto LABEL_6;
  }
  uint64_t v6 = ccder_sizeof_uint64();
  if (v6)
  {
    [v5 length];
    if (ccder_sizeof_raw_octet_string())
    {
      uint64_t v6 = ccder_sizeof();
      goto LABEL_7;
    }

uint64_t encode_initialmessage_version1(void *a1, void *a2)
{
  id v3 = a1;
  kcder_encode_data(a2);
  ccder_encode_uint64();
  kcder_encode_data(v3);

  ccder_encode_uint64();
  return ccder_encode_constructed_tl();
}

uint64_t encode_initialmessage_version2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a1;
  kcder_encode_data(a3);
  kcder_encode_data(v5);

  ccder_encode_uint64();
  kcder_encode_data(v6);

  ccder_encode_uint64();
  return ccder_encode_constructed_tl();
}

uint64_t KCInitialMessageDataReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  id v4 = (int *)MEMORY[0x189611CE8];
  id v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    id v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadData();
        __int16 v18 = *(void **)(a1 + 8);
        *(void *)(a1 + _Block_object_dispose(va, 8) = v17;
      }

      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
      }
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t OTSponsorToApplicantRound1M2ReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x189611CF0];
  id v4 = (int *)MEMORY[0x189611CE8];
  id v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    id v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0LL;
        *(_BYTE *)(a1 + 16) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1LL || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(_BYTE *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0LL;
            goto LABEL_31;
          }
        }

        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5)) {
          uint64_t v19 = 0LL;
        }
LABEL_31:
        *(void *)(a1 + _Block_object_dispose(va, 8) = v19;
      }

      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
      }
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

unint64_t kcder_decode_data_nocopy(void *a1, void *a2, uint64_t a3, unint64_t a4)
{
  return kcder_decode_data_internal(a1, 0, a2, a3, a4);
}

unint64_t kcder_decode_data_internal( void *a1, char a2, void *a3, uint64_t a4, unint64_t a5)
{
  if (!a4) {
    return 0LL;
  }
  unint64_t v9 = ccder_decode_tl();
  uint64_t v14 = 0LL;
  unint64_t v16 = v9;
  if (!v9 || v9 > a5)
  {
    char v17 = @"Unknown data encoding";
    uint64_t v18 = 1LL;
LABEL_9:
    KCJoiningErrorCreate(v18, a3, v17, v14, v10, v11, v12, v13, v20);
    return 0LL;
  }

  if ((a2 & 1) != 0) {
    objc_msgSend(MEMORY[0x189603F48], "dataWithBytes:length:", v9);
  }
  else {
  id v19 = objc_msgSend(MEMORY[0x189603F48], "dataWithBytesNoCopy:length:freeWhenDone:", v9);
  }
  *a1 = v19;

  if (!*a1)
  {
    char v17 = @"Allocation failure!";
    uint64_t v18 = 0LL;
    goto LABEL_9;
  }

  return v16;
}

unint64_t kcder_decode_data(void *a1, void *a2, uint64_t a3, unint64_t a4)
{
  return kcder_decode_data_internal(a1, 1, a2, a3, a4);
}

uint64_t kcder_sizeof_data(void *a1)
{
  return ccder_sizeof_raw_octet_string();
}

uint64_t kcder_encode_data_optional(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1) {
    return kcder_encode_data(a1);
  }
  else {
    return a4;
  }
}

uint64_t kcder_encode_data(void *a1)
{
  id v1 = a1;
  [v1 length];
  [v1 length];
  id v2 = v1;
  [v2 bytes];

  ccder_encode_body();
  return ccder_encode_tl();
}

unint64_t kcder_decode_string(uint64_t *a1, void *a2, uint64_t a3, unint64_t a4)
{
  if (!a3) {
    return 0LL;
  }
  unint64_t v7 = ccder_decode_tl();
  unint64_t v14 = v7;
  if (v7 && v7 <= a4)
  {
    uint64_t v15 = (uint64_t)(id)[objc_alloc(NSString) initWithBytes:v7 length:0 encoding:4];
    *a1 = v15;
    if (v15) {
      return v14;
    }
    unint64_t v16 = @"Allocation failure!";
  }

  else
  {
    unint64_t v16 = @"Unknown string encoding";
    uint64_t v15 = 1LL;
  }

  KCJoiningErrorCreate(v15, a2, v16, v8, v9, v10, v11, v12, v17);
  return 0LL;
}

uint64_t kcder_sizeof_string(void *a1)
{
  return ccder_sizeof();
}

uint64_t kcder_encode_string(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (!a4) {
    return 0LL;
  }
  uint64_t v6 = a4 - a3;
  uint64_t v14 = 0LL;
  id v7 = a1;
  [v7 length];
  LOBYTE(v6) = objc_msgSend( v7,  "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:",  a3,  v6,  &v14,  4,  0);

  if ((v6 & 1) != 0)
  {
    ccder_encode_body();
    return ccder_encode_tl();
  }

  else
  {
    KCJoiningErrorCreate(2LL, a2, @"String encoding failed", v8, v9, v10, v11, v12, 0LL);
    return 0LL;
  }

uint64_t kcder_encode_raw_octet_space(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = ccder_encode_body_nocopy();
  if (a2 && v3) {
    *a2 = v3;
  }
  return ccder_encode_tl();
}

void sub_187D758A8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_187D75E44( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

LABEL_22:
    char v22 = 0LL;
    goto LABEL_23;
  }

  KCJoiningErrorCreate(6LL, a4, @"Expected response!", v7, v8, v9, v10, v11, v37);
  char v22 = 0LL;
LABEL_24:

  return v22;
}

LABEL_42:
        goto LABEL_43;
      }

      secLogObjForScope("SecError");
      uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_187D59000,  v33,  OS_LOG_TYPE_DEFAULT,  "octagon, message does not contain prepare message",  buf,  2u);
      }

      uint64_t v34 = @"Expected prepare message!";
    }

    else
    {
      secLogObjForScope("SecError");
      uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_187D59000,  v33,  OS_LOG_TYPE_DEFAULT,  "octagon, failed to create pairing message from JoiningMessage",  buf,  2u);
      }

      uint64_t v34 = @"Failed to create pairing message from JoiningMessage";
    }

    KCJoiningErrorCreate(6LL, a4, v34, v35, v36, v37, v38, v39, v48);
    id v7 = 0LL;
LABEL_43:

    _Block_object_dispose(&v54, 8);
    _Block_object_dispose(&v62, 8);

    goto LABEL_44;
  }

  if ((SOSCCIsSOSTrustAndSyncingEnabled() & 1) == 0)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"cannot join piggyback version %d with SOS disabled",  -[KCJoiningAcceptSession piggy_version](self, "piggy_version"));
    id v31 = (void *)objc_claimAutoreleasedReturnValue();
    secLogObjForScope("SecError");
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v62) = 136315138;
      *(void *)((char *)&v62 + 4) = [v31 UTF8String];
      _os_log_impl(&dword_187D59000, v32, OS_LOG_TYPE_DEFAULT, "joining: %s", (uint8_t *)&v62, 0xCu);
    }

    if (a4)
    {
      [MEMORY[0x189607870] errorWithJoiningError:7, @"%@", v31 format];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_16;
  }

  [v6 firstData];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCJoiningAcceptSession processSOSApplication:error:](self, "processSOSApplication:error:", v27, a4);
  id v28 = (void *)objc_claimAutoreleasedReturnValue();

  self->_state = 3;
  secLogObjForScope("joining");
  id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v62) = 0;
    _os_log_impl( &dword_187D59000,  v29,  OS_LOG_TYPE_DEFAULT,  "posting kSOSCCCircleOctagonKeysChangedNotification",  (uint8_t *)&v62,  2u);
  }

  notify_post((const char *)*MEMORY[0x18960B7B8]);
  +[KCJoiningMessage messageWithType:data:error:]( &OBJC_CLASS___KCJoiningMessage,  "messageWithType:data:error:",  5LL,  v28,  a4);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v30 der];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_44:
  return v7;
}

void sub_187D7716C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

uint64_t __Block_byref_object_copy__870(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__871(uint64_t a1)
{
}

void KCJoiningErrorCreate( uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = a3;
  if (a2 && !*a2)
  {
    [MEMORY[0x189607870] errorWithJoiningError:a1 format:v11 arguments:&a9];
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
}

uint64_t OTSupportSOSMessageReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x189611CF0];
  id v4 = (int *)MEMORY[0x189611CE8];
  id v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    id v7 = (int *)MEMORY[0x189611CD8];
    do
    {
      if (*(_BYTE *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0LL;
        *(_BYTE *)(a1 + 12) |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1LL || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(_BYTE *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_29;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }

        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5)) {
          LODWORD(v19) = 0;
        }
LABEL_31:
        *(_DWORD *)(a1 + _Block_object_dispose((const void *)(v15 - 144), 8) = v19;
      }

      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result) {
          return result;
        }
      }
    }

    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_187D78814( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28)
{
}

Class __getAAFAnalyticsEventClass_block_invoke(uint64_t a1)
{
  Class result = objc_getClass("AAFAnalyticsEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    getAAFAnalyticsEventClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    abort_report_np();
    return (Class)AAAFoundationLibrary_1106();
  }

  return result;
}

uint64_t AAAFoundationLibrary_1106()
{
  if (AAAFoundationLibraryCore_frameworkLibrary_1109) {
    return AAAFoundationLibraryCore_frameworkLibrary_1109;
  }
  AAAFoundationLibraryCore_frameworkLibrary_1109 = _sl_dlopen();
  uint64_t v0 = AAAFoundationLibraryCore_frameworkLibrary_1109;
  if (!AAAFoundationLibraryCore_frameworkLibrary_1109)
  {
    id v2 = (void *)abort_report_np();
    free(v2);
  }

  return v0;
}

id getkAAFDeviceSessionId()
{
  uint64_t v4 = 0LL;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000LL;
  uint64_t v0 = (id *)getkAAFDeviceSessionIdSymbolLoc_ptr;
  uint64_t v7 = getkAAFDeviceSessionIdSymbolLoc_ptr;
  if (!getkAAFDeviceSessionIdSymbolLoc_ptr)
  {
    id v1 = (void *)AAAFoundationLibrary_1106();
    uint64_t v0 = (id *)dlsym(v1, "kAAFDeviceSessionId");
    v5[3] = (uint64_t)v0;
    getkAAFDeviceSessionIdSymbolLoc_ptr = (uint64_t)v0;
  }

  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    dlerror();
    uint64_t v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }

  return *v0;
}

void sub_187D7903C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

Class __getAKAccountManagerClass_block_invoke(uint64_t a1)
{
  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    AuthKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AuthKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }

  while (1)
  {
    Class result = objc_getClass("AKAccountManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
      break;
    }
LABEL_6:
    uint64_t v3 = (void *)abort_report_np();
    free(v3);
  }

  getAKAccountManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

BOOL OTApplicantToSponsorRound2M1ReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x189611CF0];
  uint64_t v4 = (int *)MEMORY[0x189611CE8];
  id v5 = (int *)MEMORY[0x189611CE0];
  if (*(void *)(a2 + (int)*MEMORY[0x189611CF0]) < *(void *)(a2 + (int)*MEMORY[0x189611CE8]))
  {
    uint64_t v7 = (int *)MEMORY[0x189611CD8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5)) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0LL;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1LL || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(_BYTE *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0LL;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }

      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5)) {
        unint64_t v10 = 0LL;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(_BYTE *)(a2 + *v5) == 0;
      }
      switch((v10 >> 3))
      {
        case 1u:
          uint64_t v17 = PBReaderReadString();
          uint64_t v18 = 8LL;
          goto LABEL_24;
        case 2u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 16LL;
          goto LABEL_24;
        case 3u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 24LL;
          goto LABEL_24;
        case 4u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 32LL;
          goto LABEL_24;
        case 5u:
          uint64_t v17 = PBReaderReadData();
          uint64_t v18 = 40LL;
LABEL_24:
          uint64_t v19 = *(void **)(a1 + v18);
          *(void *)(a1 + v1_Block_object_dispose(va, 8) = v17;

          goto LABEL_25;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            return 0LL;
          }
LABEL_25:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(_BYTE *)(a2 + *v5) == 0;
          }
          break;
      }
    }
  }

  return *(_BYTE *)(a2 + *v5) == 0;
}

id UserInfoFromVA(void *a1, uint64_t a2)
{
  v9[1] = *MEMORY[0x1895F89C0];
  uint64_t v8 = *MEMORY[0x1896075E0];
  uint64_t v3 = (objc_class *)NSString;
  id v4 = a1;
  id v5 = (void *)[[v3 alloc] initWithFormat:v4 arguments:a2];

  v9[0] = v5;
  [MEMORY[0x189603F68] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL CoreCryptoError( uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = a3;
  if ((_DWORD)a1 && a2 && !*a2)
  {
    [MEMORY[0x189607870] errorWithCoreCryptoStatus:a1 description:v11 args:&a9];
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (_DWORD)a1 == 0;
}

BOOL OSStatusError( uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = a3;
  if ((_DWORD)a1 && a2 && !*a2)
  {
    [MEMORY[0x189607870] errorWithOSStatus:a1 description:v11 args:&a9];
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return (_DWORD)a1 == 0;
}

uint64_t RequirementError( uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = a3;
  if (a2 && (a1 & 1) == 0 && !*a2)
  {
    [MEMORY[0x189607870] errorWithOSStatus:4294967246 description:v11 args:&a9];
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }

  return a1;
}

BOOL ExactDataSizeRequirement(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a1;
  BOOL v9 = [v8 length] == a2;
  [v8 length];

  RequirementError(v9, a3, @"%@ incorrect size, Expected %ld, got %ld", v10, v11, v12, v13, v14, (uint64_t)v7);
  return v9;
}

CFURLRef SecCopyHomeURL()
{
  uint64_t v0 = sCustomHomeURL;
  if (!sCustomHomeURL) {
    return CFCopyHomeDirectoryURL();
  }
  CFRetain((CFTypeRef)sCustomHomeURL);
  return (CFURLRef)v0;
}

CFURLRef SecCopyBaseFilesURL(int a1)
{
  uint64_t v1 = sCustomHomeURL;
  if (sCustomHomeURL)
  {
    CFRetain((CFTypeRef)sCustomHomeURL);
    return (CFURLRef)v1;
  }

  else if (a1)
  {
    return CFURLCreateWithFileSystemPath(0LL, @"/", kCFURLPOSIXPathStyle, 1u);
  }

  else
  {
    return SecCopyHomeURL();
  }

CFTypeRef SecSetCustomHomeURL(CFTypeRef cf)
{
  uint64_t v1 = (uint64_t)cf;
  if (cf) {
    cf = CFRetain(cf);
  }
  sCustomHomeURL = v1;
  return cf;
}

void SecSetCustomHomeURLString(CFStringRef filePath)
{
  id v2 = (const void *)sCustomHomeURL;
  if (sCustomHomeURL)
  {
    sCustomHomeURL = 0LL;
    CFRelease(v2);
  }

  if (filePath) {
    sCustomHomeURL = (uint64_t)CFURLCreateWithFileSystemPath(0LL, filePath, kCFURLPOSIXPathStyle, 1u);
  }
}

uint64_t IsScopeActive(int a1, uint64_t a2)
{
  int valuePtr = a1;
  if (!a2) {
    return 1LL;
  }
  CFNumberRef v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  char v10 = 0;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 0x40000000LL;
  v6[2] = __IsScopeActive_block_invoke;
  v6[3] = &unk_18A135470;
  v6[4] = &v7;
  v6[5] = v3;
  v6[6] = a2;
  with_scopes_read(v6);
  if (v3) {
    CFRelease(v3);
  }
  BOOL v4 = *((_BYTE *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __IsScopeActive_block_invoke(uint64_t a1)
{
  uint64_t v1 = (const __CFArray *)sLogSettings;
  if (sLogSettings)
  {
    context[0] = MEMORY[0x1895F87A8];
    context[1] = 0x40000000LL;
    context[2] = __IsScopeActive_block_invoke_2;
    context[3] = &unk_18A135448;
    __int128 v3 = *(_OWORD *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    v5.length = CFArrayGetCount((CFArrayRef)sLogSettings);
    v5.location = 0LL;
    CFArrayApplyFunction(v1, v5, (CFArrayApplierFunction)apply_block_1, context);
  }

void with_scopes_read(dispatch_block_t block)
{
  if (GetDispatchControlQueue_onceToken != -1) {
    dispatch_once(&GetDispatchControlQueue_onceToken, &__block_literal_global_28);
  }
  dispatch_sync((dispatch_queue_t)GetDispatchControlQueue_sLoggingScopeControlQueue, block);
}

dispatch_queue_t __GetDispatchControlQueue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("security scope control", MEMORY[0x1895F8AF8]);
  GetDispatchControlQueue_sLoggingScopeControlQueue = (uint64_t)result;
  return result;
}

uint64_t __IsScopeActive_block_invoke_2(uint64_t result, const __CFSet *cf)
{
  if (cf)
  {
    id v2 = cf;
    uint64_t v3 = result;
    CFTypeID v4 = CFGetTypeID(cf);
    dispatch_queue_t result = CFSetGetTypeID();
    if (v4 == result
      || (v6 = CFGetTypeID(v2), dispatch_queue_t result = CFDictionaryGetTypeID(), v6 == result)
      && (dispatch_queue_t result = (uint64_t)CFDictionaryGetValue(v2, *(const void **)(v3 + 40))) != 0
      && (v2 = (const __CFSet *)result, v7 = CFGetTypeID((CFTypeRef)result), dispatch_queue_t result = CFSetGetTypeID(), v7 == result))
    {
      if (!*(_BYTE *)(*(void *)(*(void *)(v3 + 32) + 8LL) + 24LL))
      {
        BOOL v5 = CFSetContainsValue(v2, @"-") != 0;
        dispatch_queue_t result = CFSetContainsValue(v2, *(const void **)(v3 + 48));
        *(_BYTE *)(*(void *)(*(void *)(v3 + 32) + 8LL) + 24LL) = v5 ^ ((_DWORD)result != 0);
      }
    }
  }

  return result;
}

uint64_t apply_block_1(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t IsScopeActiveC(int a1, char *__s)
{
  size_t v4 = strlen(__s);
  CFStringRef v5 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x189604DB0], (const UInt8 *)__s, v4, 0x8000100u, 0);
  uint64_t v6 = IsScopeActive(a1, (uint64_t)v5);
  if (v5) {
    CFRelease(v5);
  }
  return v6;
}

CFMutableArrayRef CopyCurrentScopePlist()
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  CFMutableArrayRef v1 = Mutable;
  if (sLogSettings)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 0x40000000LL;
    block[2] = __CopyCurrentScopePlist_block_invoke;
    block[3] = &__block_descriptor_tmp_12;
    block[4] = Mutable;
    with_scopes_read(block);
  }

  return v1;
}

void __CopyCurrentScopePlist_block_invoke(uint64_t a1)
{
  CFMutableArrayRef v1 = (const __CFArray *)sLogSettings;
  context[0] = MEMORY[0x1895F87A8];
  context[1] = 0x40000000LL;
  context[2] = __CopyCurrentScopePlist_block_invoke_2;
  context[3] = &__block_descriptor_tmp_11;
  void context[4] = *(void *)(a1 + 32);
  v3.length = CFArrayGetCount((CFArrayRef)sLogSettings);
  v3.location = 0LL;
  CFArrayApplyFunction(v1, v3, (CFArrayApplierFunction)apply_block_1, context);
}

void __CopyCurrentScopePlist_block_invoke_2(uint64_t a1, CFTypeRef cf)
{
  if (!cf) {
    goto LABEL_8;
  }
  CFTypeID v4 = CFGetTypeID(cf);
  if (v4 != CFSetGetTypeID())
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFDictionaryGetTypeID())
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
      context[0] = MEMORY[0x1895F87A8];
      context[1] = 0x40000000LL;
      context[2] = __CopyCurrentScopePlist_block_invoke_3;
      context[3] = &__block_descriptor_tmp_10;
      void context[4] = Mutable;
      CFDictionaryApplyFunction((CFDictionaryRef)cf, (CFDictionaryApplierFunction)apply_block_2, context);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), Mutable);
      return;
    }

LABEL_8:
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), (const void *)*MEMORY[0x189605018]);
    return;
  }

  CFMutableArrayRef v5 = CFSetOfCFObjectsCopyValues((const __CFSet *)cf);
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v5);
  if (v5) {
    CFRelease(v5);
  }
}

CFMutableArrayRef CFSetOfCFObjectsCopyValues(const __CFSet *a1)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605228]);
  context[0] = MEMORY[0x1895F87A8];
  context[1] = 0x40000000LL;
  context[2] = __CFSetOfCFObjectsCopyValues_block_invoke;
  context[3] = &__block_descriptor_tmp_30;
  void context[4] = Mutable;
  CFSetApplyFunction(a1, (CFSetApplierFunction)apply_block_1, context);
  return Mutable;
}

void __CopyCurrentScopePlist_block_invoke_3(uint64_t a1, const void *a2, CFTypeRef cf)
{
  if (cf)
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFSetGetTypeID())
    {
      CFMutableArrayRef v7 = CFSetOfCFObjectsCopyValues((const __CFSet *)cf);
      CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), a2, v7);
      if (v7) {
        CFRelease(v7);
      }
    }
  }

uint64_t apply_block_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

void __CFSetOfCFObjectsCopyValues_block_invoke(uint64_t a1, const void *a2)
{
}

void ApplyScopeDictionaryForID(const __CFDictionary *a1, int a2)
{
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable( (CFAllocatorRef)*MEMORY[0x189604DB0],  0LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  context[0] = MEMORY[0x1895F87A8];
  context[1] = 0x40000000LL;
  context[2] = __ApplyScopeDictionaryForID_block_invoke;
  context[3] = &__block_descriptor_tmp_13;
  void context[4] = Mutable;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)apply_block_2, context);
  if (CFDictionaryGetCount(Mutable) >= 1) {
    SetNthScopeSet(a2, (uint64_t)Mutable);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
}

void __ApplyScopeDictionaryForID_block_invoke(uint64_t a1, const __CFNumber *cf, const __CFString *a3)
{
  CFNumberRef v4 = cf;
  if (cf)
  {
    CFTypeID v6 = CFGetTypeID(cf);
    if (v6 == CFStringGetTypeID())
    {
      if (CFEqual(v4, @"Emergency"))
      {
        int v7 = 0;
LABEL_22:
        int valuePtr = v7;
        CFNumberRef v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberIntType, &valuePtr);
        goto LABEL_23;
      }

      if (CFEqual(v4, @"Alert"))
      {
        int v7 = 1;
        goto LABEL_22;
      }

      if (CFEqual(v4, @"Critical"))
      {
        int v7 = 2;
        goto LABEL_22;
      }

      if (CFEqual(v4, @"Error"))
      {
        int v7 = 3;
        goto LABEL_22;
      }

      if (CFEqual(v4, @"Warning"))
      {
        int v7 = 4;
        goto LABEL_22;
      }

      if (CFEqual(v4, @"Notice"))
      {
        int v7 = 5;
        goto LABEL_22;
      }

      if (CFEqual(v4, @"Info"))
      {
        int v7 = 6;
        goto LABEL_22;
      }

      if (CFEqual(v4, @"Debug"))
      {
        int v7 = 7;
        goto LABEL_22;
      }
    }

    else
    {
      CFTypeID v8 = CFGetTypeID(v4);
      if (v8 == CFNumberGetTypeID())
      {
        CFRetain(v4);
        if (a3) {
          goto LABEL_24;
        }
        goto LABEL_29;
      }
    }

    CFNumberRef v4 = 0LL;
    if (a3) {
      goto LABEL_24;
    }
LABEL_29:
    if (!v4) {
      return;
    }
    goto LABEL_30;
  }

LABEL_23:
  if (!a3) {
    goto LABEL_29;
  }
LABEL_24:
  CFTypeID v9 = CFGetTypeID(a3);
  if (v9 != CFStringGetTypeID()) {
    goto LABEL_29;
  }
  char v10 = CopyScopesFromScopeList(a3);
  uint64_t v11 = v10;
  if (v4 && v10)
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), v4, v10);
    CFRelease(v4);
    CFNumberRef v4 = v11;
LABEL_30:
    CFRelease(v4);
    return;
  }

  if (v4) {
    CFRelease(v4);
  }
  CFNumberRef v4 = v11;
  if (v11) {
    goto LABEL_30;
  }
}

void SetNthScopeSet(int a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 0x40000000LL;
  v2[2] = __SetNthScopeSet_block_invoke;
  v2[3] = &__block_descriptor_tmp_54;
  int v3 = a1;
  v2[4] = a2;
  if (GetDispatchControlQueue_onceToken != -1) {
    dispatch_once(&GetDispatchControlQueue_onceToken, &__block_literal_global_28);
  }
  dispatch_barrier_sync((dispatch_queue_t)GetDispatchControlQueue_sLoggingScopeControlQueue, v2);
}

void __SetNthScopeSet_block_invoke(uint64_t a1)
{
  CFMutableArrayRef Mutable = (__CFArray *)sLogSettings;
  if (sLogSettings)
  {
    int v3 = (const void *)*MEMORY[0x189605018];
  }

  else
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 4LL, MEMORY[0x189605228]);
    int v3 = (const void *)*MEMORY[0x189605018];
    int v4 = 5;
    do
    {
      CFArrayAppendValue(Mutable, v3);
      --v4;
    }

    while (v4);
    sLogSettings = (uint64_t)Mutable;
  }

  CFArraySetValueAtIndex(Mutable, *(int *)(a1 + 40), *(const void **)(a1 + 32));
  CFMutableArrayRef v5 = (const __CFArray *)sLogSettings;
  v8.length = CFArrayGetCount((CFArrayRef)sLogSettings);
  v8.location = 0LL;
  CFIndex CountOfValue = CFArrayGetCountOfValue(v5, v8, v3);
  if (CountOfValue == CFArrayGetCount(v5))
  {
    int v7 = (const void *)sLogSettings;
    if (sLogSettings)
    {
      sLogSettings = 0LL;
      CFRelease(v7);
    }
  }

__CFSet *CopyScopesFromScopeList(const __CFString *a1)
{
  id v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableArrayRef Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189605258]);
  int HasPrefix = CFStringHasPrefix(a1, @"-");
  if (HasPrefix)
  {
    CFIndex Length = CFStringGetLength(@"-");
    v12.length = CFStringGetLength(a1) - 1;
    v12.location = Length;
    CFStringRef v6 = CFStringCreateWithSubstring(v2, a1, v12);
    a1 = v6;
  }

  else
  {
    CFStringRef v6 = 0LL;
  }

  ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(v2, a1, @",");
  CFRange v8 = ArrayBySeparatingStrings;
  if (ArrayBySeparatingStrings)
  {
    context[0] = MEMORY[0x1895F87A8];
    context[1] = 0x40000000LL;
    context[2] = __CopyScopesFromScopeList_block_invoke;
    context[3] = &__block_descriptor_tmp_49;
    void context[4] = Mutable;
    v11.length = CFArrayGetCount(ArrayBySeparatingStrings);
    v11.location = 0LL;
    CFArrayApplyFunction(v8, v11, (CFArrayApplierFunction)apply_block_1, context);
  }

  CFSetRemoveValue(Mutable, @"none");
  CFSetRemoveValue(Mutable, &stru_18A137758);
  if (CFSetContainsValue(Mutable, @"all"))
  {
    CFSetRemoveAllValues(Mutable);
    if (HasPrefix) {
      goto LABEL_11;
    }
  }

  else if (!HasPrefix)
  {
    goto LABEL_11;
  }

  CFSetSetValue(Mutable, @"-");
LABEL_11:
  if (v8) {
    CFRelease(v8);
  }
  if (v6) {
    CFRelease(v6);
  }
  return Mutable;
}

void __CopyScopesFromScopeList_block_invoke(uint64_t a1, const __CFString *cf)
{
  if (cf)
  {
    CFTypeID v4 = CFGetTypeID(cf);
    if (v4 == CFStringGetTypeID())
    {
      MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, cf);
      CFStringTrimWhitespace(MutableCopy);
      CFSetSetValue(*(CFMutableSetRef *)(a1 + 32), MutableCopy);
      if (MutableCopy) {
        CFRelease(MutableCopy);
      }
    }
  }

void ApplyScopeListForID(const __CFString *a1, int a2)
{
  int v3 = CopyScopesFromScopeList(a1);
  SetNthScopeSet(a2, (uint64_t)v3);
  if (v3) {
    CFRelease(v3);
  }
}

void ApplyScopeListForIDC(char *cStr, int a2)
{
  int v3 = CFStringCreateWithCStringNoCopy( (CFAllocatorRef)*MEMORY[0x189604DB0],  cStr,  0x8000100u,  (CFAllocatorRef)*MEMORY[0x189604DC8]);
  ApplyScopeListForID(v3, a2);
  if (v3) {
    CFRelease(v3);
  }
}

void __security_debug_init()
{
  if (__security_debug_init_sdOnceToken != -1) {
    dispatch_once(&__security_debug_init_sdOnceToken, &__block_literal_global_1335);
  }
}

void ____security_debug_init_block_invoke()
{
  uint64_t v0 = getenv("DEBUGSCOPE");
  if (!v0) {
    uint64_t v0 = "";
  }
  ApplyScopeListForIDC(v0, 0);
  CFMutableArrayRef v1 = SecCopyURLForFileInManagedPreferencesDirectory((uint64_t)@".GlobalPreferences.plist");
  if (v1)
  {
    id v2 = v1;
    int v3 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    CFTypeID v4 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x189604DB0], v1);
    if (v4)
    {
      CFMutableArrayRef v5 = v4;
      if (!CFReadStreamOpen(v4))
      {
LABEL_8:
        CFRelease(v5);
        goto LABEL_9;
      }

      CFStringRef v6 = (const __CFDictionary *)CFPropertyListCreateWithStream(v3, v5, 0LL, 0LL, 0LL, 0LL);
      CFRelease(v5);
      if (v6)
      {
        Value = (const __CFString *)CFDictionaryGetValue(v6, @"SecLogging");
        ApplyScopeByTypeForID(Value, 2);
        CFMutableArrayRef v5 = v6;
        goto LABEL_8;
      }
    }

LABEL_9:
    CFRelease(v2);
  }

  CFRange v8 = (const __CFString *)*MEMORY[0x189605180];
  CFTypeID v9 = (const __CFString *)*MEMORY[0x189605190];
  char v10 = (const __CFString *)CFPreferencesCopyValue( @"Logging",  @"com.apple.security",  (CFStringRef)*MEMORY[0x189605180],  (CFStringRef)*MEMORY[0x189605190]);
  ApplyScopeByTypeForID(v10, 1);
  if (v10) {
    CFRelease(v10);
  }
  CFRange v11 = (const __CFString *)CFPreferencesCopyValue(@"Circle-Logging", @"com.apple.security", v8, v9);
  ApplyScopeByTypeForID(v11, 1);
  if (v11) {
    CFRelease(v11);
  }
}

void ApplyScopeByTypeForID(const __CFString *a1, int a2)
{
  if (a1)
  {
    CFTypeID v4 = CFGetTypeID(a1);
    if (v4 == CFDictionaryGetTypeID())
    {
      ApplyScopeDictionaryForID((const __CFDictionary *)a1, a2);
    }

    else
    {
      CFTypeID v5 = CFGetTypeID(a1);
      if (v5 == CFStringGetTypeID()) {
        ApplyScopeListForID(a1, a2);
      }
    }
  }

const void *secLogObjForCFScope(const __CFString *a1)
{
  if (a1) {
    CFMutableArrayRef v1 = a1;
  }
  else {
    CFMutableArrayRef v1 = @"logging";
  }
  os_unfair_lock_lock_with_options();
  CFMutableArrayRef Mutable = (const __CFDictionary *)secLogObjForCFScope_scopeMap;
  if (!secLogObjForCFScope_scopeMap)
  {
    CFMutableArrayRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, MEMORY[0x189604E40], 0LL);
    secLogObjForCFScope_scopeMap = (uint64_t)Mutable;
  }

  Value = CFDictionaryGetValue(Mutable, v1);
  if (!Value)
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 0x40000000LL;
    v5[2] = __secLogObjForCFScope_block_invoke;
    v5[3] = &__block_descriptor_tmp_19;
    v5[4] = v1;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 0x40000000LL;
    v6[2] = __CFStringPerformWithCString_block_invoke;
    v6[3] = &unk_18A135668;
    v6[4] = v5;
    CFStringPerformWithCStringAndLength(v1, (uint64_t)v6);
    Value = CFDictionaryGetValue((CFDictionaryRef)secLogObjForCFScope_scopeMap, v1);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&secLogObjForCFScope_lock);
  return Value;
}

void __secLogObjForCFScope_block_invoke(uint64_t a1, const char *a2)
{
  id v2 = (__CFDictionary *)secLogObjForCFScope_scopeMap;
  int v3 = *(const void **)(a1 + 32);
  os_log_t v4 = os_log_create("com.apple.securityd", a2);
  CFDictionaryAddValue(v2, v3, v4);
}

BOOL secLogEnabled()
{
  char v0 = loggingEnabled;
  pthread_mutex_unlock(&loggingMutex);
  return (v0 & 1) == 0;
}

uint64_t secLogDisable()
{
  loggingEnabled = 1;
  return pthread_mutex_unlock(&loggingMutex);
}

uint64_t secLogEnable()
{
  loggingEnabled = 0;
  return pthread_mutex_unlock(&loggingMutex);
}

const void *secLogObjForScope(const char *a1)
{
  char v2 = loggingEnabled;
  pthread_mutex_unlock(&loggingMutex);
  if ((v2 & 1) != 0) {
    return (const void *)MEMORY[0x1895F8DA8];
  }
  if (a1)
  {
    os_log_t v4 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], a1, 0x600u);
    int v3 = secLogObjForCFScope(v4);
    if (v4) {
      CFRelease(v4);
    }
    return v3;
  }

  return secLogObjForCFScope(0LL);
}

__CFString *SecLogAPICreate( int a1, const char *a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  CFRange v12 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFMutableArrayRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  uint64_t v14 = Mutable;
  if (a1) {
    int v15 = "ENTER";
  }
  else {
    int v15 = "RETURN";
  }
  CFStringAppend(Mutable, @"SecAPITrace ");
  CFStringAppendCString(v14, a2, 0x600u);
  CFStringAppendCString(v14, v15, 0x600u);
  if (a3)
  {
    uint64_t v16 = CFStringCreateWithFormatAndArguments(v12, 0LL, a3, &a9);
    CFStringAppend(v14, v16);
    if (v16) {
      CFRelease(v16);
    }
  }

  if (a1)
  {
    *(void *)&__int128 v17 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __int128 v22 = v17;
    __int128 v23 = v17;
    __int128 v20 = v17;
    __int128 v21 = v17;
    *(_OWORD *)__str = v17;
    snprintf(__str, 0x50uLL, "C%p F%p", vars0[1], *vars0);
    CFStringAppend(v14, @"CALLER ");
    CFStringAppendCString(v14, __str, 0x600u);
  }

  return v14;
}

uint64_t SecGetDebugDescriptionFormatOptions()
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __SecGetDebugDescriptionFormatOptions_block_invoke;
  block[3] = &__block_descriptor_tmp_1363;
  block[4] = &SecGetDebugDescriptionFormatOptions_sSecGetDebugDescriptionFormatOptionsSingleton;
  if (SecGetDebugDescriptionFormatOptions_sSecGetDebugDescriptionFormatOptionsOnce != -1) {
    dispatch_once(&SecGetDebugDescriptionFormatOptions_sSecGetDebugDescriptionFormatOptionsOnce, block);
  }
  return SecGetDebugDescriptionFormatOptions_sSecGetDebugDescriptionFormatOptionsSingleton;
}

CFDictionaryRef __SecGetDebugDescriptionFormatOptions_block_invoke(uint64_t a1)
{
  keys[1] = *(void **)MEMORY[0x1895F89C0];
  values = (void *)*MEMORY[0x189604DE8];
  keys[0] = (void *)kSecDebugFormatOption;
  CFDictionaryRef result = CFDictionaryCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  (const void **)keys,  (const void **)&values,  1LL,  MEMORY[0x189605240],  MEMORY[0x189605250]);
  **(void **)(a1 + 32) = result;
  return result;
}

void CFStringArrayPerformWithDescription(const __CFArray *a1, uint64_t a2)
{
}

void CFStringArrayPerformWithDelimiterWithDescription( const __CFArray *a1, CFStringRef theString, const __CFString *a3, uint64_t a4)
{
  if (a1)
  {
    uint64_t v10 = 0LL;
    CFRange v11 = &v10;
    uint64_t v12 = 0x2000000000LL;
    CFMutableStringRef MutableCopy = (CFMutableStringRef)0xAAAAAAAAAAAAAAAALL;
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, theString);
    v9[0] = 0LL;
    v9[1] = v9;
    void v9[2] = 0x2000000000LL;
    v9[3] = &stru_18A137758;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 0x40000000LL;
    v8[2] = __CFStringArrayPerformWithDelimiterWithDescription_block_invoke;
    v8[3] = &unk_18A135770;
    v8[4] = &v10;
    v8[5] = v9;
    v14.length = CFArrayGetCount(a1);
    v14.location = 0LL;
    CFArrayApplyFunction(a1, v14, (CFArrayApplierFunction)apply_block_1_1369, v8);
    CFStringAppend((CFMutableStringRef)v11[3], a3);
    (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, v11[3]);
    int v7 = (const void *)v11[3];
    if (v7)
    {
      v11[3] = 0LL;
      CFRelease(v7);
    }

    _Block_object_dispose(v9, 8);
    _Block_object_dispose(&v10, 8);
  }

  else
  {
    (*(void (**)(uint64_t, const __CFString *))(a4 + 16))(a4, @"null");
  }

void __CFStringArrayPerformWithDelimiterWithDescription_block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = @", ";
}

uint64_t apply_block_1_1369(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

void CFStringSetPerformWithDescription(const __CFSet *a1, uint64_t a2)
{
  if (a1)
  {
    CFIndex Count = CFSetGetCount(a1);
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, Count, MEMORY[0x189605228]);
    CFSetApplyFunction(a1, (CFSetApplierFunction)appendDescriptionToArray, Mutable);
    v6.length = CFArrayGetCount(Mutable);
    v6.location = 0LL;
    CFArraySortValues(Mutable, v6, (CFComparatorFunction)MEMORY[0x1896033C0], 0LL);
    CFStringArrayPerformWithDelimiterWithDescription(Mutable, @"{("), @"}", a2);
    if (Mutable) {
      CFRelease(Mutable);
    }
  }

  else
  {
    (*(void (**)(uint64_t, const __CFString *))(a2 + 16))(a2, @"null");
  }

void appendDescriptionToArray(const __CFString *a1, __CFArray *a2)
{
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 == CFStringGetTypeID())
  {
    CFTypeID v5 = a2;
    CFRange v6 = a1;
  }

  else
  {
    CFStringRef v7 = CFCopyDescription(a1);
    if (v7)
    {
      CFStringRef v8 = v7;
      CFArrayAppendValue(a2, v7);
      CFRelease(v8);
      return;
    }

    CFRange v6 = @"null";
    CFTypeID v5 = a2;
  }

  CFArrayAppendValue(v5, v6);
}

void SecCFCalendarDoWithZuluCalendar(uint64_t a1)
{
  if (SecCFCalendarGetZuluQueue_onceToken != -1) {
    dispatch_once(&SecCFCalendarGetZuluQueue_onceToken, &__block_literal_global_1382);
  }
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __SecCFCalendarDoWithZuluCalendar_block_invoke;
  block[3] = &unk_18A135618;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)fqueue_cf, block);
}

uint64_t __SecCFCalendarDoWithZuluCalendar_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (SecCFCalendarGetZulu_onceToken != -1) {
    dispatch_once(&SecCFCalendarGetZulu_onceToken, &__block_literal_global_51);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, sZuluCalendar);
}

void __SecCFCalendarGetZulu_block_invoke()
{
  char v0 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  sZuluCalendar = (uint64_t)CFCalendarCreateWithIdentifier( (CFAllocatorRef)*MEMORY[0x189604DB0],  (CFCalendarIdentifier)*MEMORY[0x189604F90]);
  uint64_t v1 = CFTimeZoneCreateWithTimeIntervalFromGMT(v0, 0.0);
  CFCalendarSetTimeZone((CFCalendarRef)sZuluCalendar, v1);
  if (v1) {
    CFRelease(v1);
  }
}

dispatch_queue_t __SecCFCalendarGetZuluQueue_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("ZuluCalendar", 0LL);
  fqueue_cf = (uint64_t)result;
  return result;
}

void CFStringPerformWithCStringAndLength(const __CFString *a1, uint64_t a2)
{
  CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr)
  {
    CFTypeID v5 = CStringPtr;
    size_t v6 = strlen(CStringPtr);
    (*(void (**)(uint64_t, const char *, size_t))(a2 + 16))(a2, v5, v6);
  }

  else
  {
    CFIndex usedBufLen = 0LL;
    CFIndex Length = CFStringGetLength(a1);
    v10.location = 0LL;
    v10.length = Length;
    CFStringGetBytes(a1, v10, 0x8000100u, 0, 0, 0LL, 0LL, &usedBufLen);
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 0x40000000LL;
    v8[2] = __CFStringPerformWithCStringAndLength_block_invoke;
    v8[3] = &unk_18A135640;
    void v8[6] = 0LL;
    v8[7] = Length;
    v8[8] = usedBufLen;
    v8[4] = a2;
    v8[5] = a1;
    PerformWithBuffer(usedBufLen + 1, (uint64_t)v8);
  }

uint64_t __CFStringPerformWithCStringAndLength_block_invoke(uint64_t result, int a2, UInt8 *buffer)
{
  if (buffer)
  {
    uint64_t v4 = result;
    CFTypeID v5 = *(const __CFString **)(result + 40);
    CFRange v8 = *(CFRange *)(v4 + 48);
    CFIndex v6 = *(void *)(v4 + 64);
    CFIndex usedBufLen = 0xAAAAAAAAAAAAAAAALL;
    CFStringGetBytes(v5, v8, 0x8000100u, 0, 0, buffer, v6, &usedBufLen);
    buffer[usedBufLen] = 0;
    return (*(uint64_t (**)(void))(*(void *)(v4 + 32) + 16LL))();
  }

  return result;
}

void CFStringPerformWithCString(const __CFString *a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 0x40000000LL;
  v2[2] = __CFStringPerformWithCString_block_invoke;
  v2[3] = &unk_18A135668;
  v2[4] = a2;
  CFStringPerformWithCStringAndLength(a1, (uint64_t)v2);
}

uint64_t __CFStringPerformWithCString_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void CFStringPerformWithUTF8CFData(const __CFString *a1, uint64_t a2)
{
  CFIndex maxBufLen = 0LL;
  CFIndex Length = CFStringGetLength(a1);
  v10.location = 0LL;
  v10.length = Length;
  CFStringGetBytes(a1, v10, 0x8000100u, 0, 0, 0LL, 0LL, &maxBufLen);
  CFIndex v5 = maxBufLen;
  CFMutableArrayRef Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL);
  CFDataSetLength(Mutable, v5);
  CFIndex usedBufLen = 0xAAAAAAAAAAAAAAAALL;
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  v11.location = 0LL;
  v11.length = Length;
  CFStringGetBytes(a1, v11, 0x8000100u, 0, 0, MutableBytePtr, maxBufLen, &usedBufLen);
  (*(void (**)(uint64_t, __CFData *))(a2 + 16))(a2, Mutable);
  if (Mutable) {
    CFRelease(Mutable);
  }
}

CFStringRef CFStringCreateByTrimmingCharactersInSet(const __CFString *a1, const __CFCharacterSet *a2)
{
  CFIndex Length = CFStringGetLength(a1);
  CFStringRef theString = a1;
  uint64_t v37 = 0LL;
  CFIndex v38 = Length;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  CStringPtr = 0LL;
  v35 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  }
  CFIndex v39 = 0LL;
  CFIndex v40 = 0LL;
  v36 = CStringPtr;
  if (Length < 1) {
    return &stru_18A137758;
  }
  uint64_t v7 = 0LL;
  CFIndex v8 = 0LL;
  *(void *)&__int128 v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v33[6] = v9;
  v33[7] = v9;
  v33[4] = v9;
  v33[5] = v9;
  v33[2] = v9;
  v33[3] = v9;
  uint64_t v10 = 64LL;
  CFRange v11 = &stru_18A137758;
  v33[0] = v9;
  v33[1] = v9;
  while (1)
  {
    uint64_t v12 = (unint64_t)v8 >= 4 ? 4LL : v8;
    CFIndex v13 = v38;
    if (v38 <= v8)
    {
      UniChar v14 = 0;
    }

    else if (v35)
    {
      UniChar v14 = v35[v8 + v37];
    }

    else if (v36)
    {
      UniChar v14 = v36[v37 + v8];
    }

    else
    {
      CFIndex v15 = v39;
      if (v40 <= v8 || v39 > v8)
      {
        uint64_t v17 = v12 + v7;
        uint64_t v18 = v10 - v12;
        CFIndex v19 = v8 - v12;
        CFIndex v20 = v19 + 64;
        if (v19 + 64 >= v38) {
          CFIndex v20 = v38;
        }
        CFIndex v39 = v19;
        CFIndex v40 = v20;
        if (v38 >= v18) {
          CFIndex v13 = v18;
        }
        v41.length = v13 + v17;
        v41.location = v19 + v37;
        CFStringGetCharacters(theString, v41, (UniChar *)v33);
        CFIndex v15 = v39;
      }

      UniChar v14 = *((_WORD *)v33 + v8 - v15);
    }

    if (!CFCharacterSetIsCharacterMember(a2, v14)) {
      break;
    }
    ++v8;
    --v7;
    ++v10;
    if (Length == v8) {
      return v11;
    }
  }

  CFIndex v21 = -Length;
  CFIndex v22 = Length + 64;
  uint64_t v23 = 1LL;
  while (1)
  {
    uint64_t v24 = (unint64_t)Length >= 5 ? 5LL : Length;
    if (Length < 2) {
      break;
    }
    CFIndex v25 = v38;
    if (v38 >= Length)
    {
      if (v35)
      {
        UniChar v26 = v35[Length - 1 + v37];
      }

      else if (v36)
      {
        UniChar v26 = v36[v37 - 1 + Length];
      }

      else
      {
        if (v40 < Length || (CFIndex v27 = v39, v39 >= Length))
        {
          uint64_t v28 = v24 + v21;
          CFIndex v29 = v22 - v24;
          CFIndex v30 = Length - v24;
          CFIndex v31 = v30 + 64;
          if (v30 + 64 >= v38) {
            CFIndex v31 = v38;
          }
          CFIndex v39 = v30;
          CFIndex v40 = v31;
          if (v38 >= v29) {
            CFIndex v25 = v29;
          }
          v42.length = v25 + v28;
          v42.location = v30 + v37;
          CFStringGetCharacters(theString, v42, (UniChar *)v33);
          CFIndex v27 = v39;
        }

        UniChar v26 = *((_WORD *)&v33[-1] + Length - v27 + 7);
      }
    }

    else
    {
      UniChar v26 = 0;
    }

    ++v21;
    --v22;
    --Length;
    if (!CFCharacterSetIsCharacterMember(a2, v26))
    {
      uint64_t v23 = Length + 1;
      break;
    }
  }

  v43.length = v23 - v8;
  v43.location = v8;
  return CFStringCreateWithSubstring(0LL, a1, v43);
}

CFStringRef CFDictionaryCopyCompactDescription(const __CFDictionary *a1)
{
  if (!a1) {
    return CFCopyDescription((CFTypeRef)*MEMORY[0x189605018]);
  }
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, @"{");
  v5[0] = 0LL;
  v5[1] = v5;
  v5[2] = 0x2000000000LL;
  v5[3] = &stru_18A137758;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 0x40000000LL;
  v4[2] = __CFDictionaryCopyCompactDescription_block_invoke;
  v4[3] = &unk_18A135690;
  v4[4] = v5;
  v4[5] = MutableCopy;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)apply_block_2_1391, v4);
  CFStringAppendFormat(MutableCopy, 0LL, @"}");
  _Block_object_dispose(v5, 8);
  return MutableCopy;
}

void __CFDictionaryCopyCompactDescription_block_invoke(uint64_t a1, uint64_t a2, const __CFData *cf)
{
  if (cf && (CFTypeID v6 = CFGetTypeID(cf), v6 == CFDataGetTypeID()))
  {
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, @"0x");
    BytePtr = CFDataGetBytePtr(cf);
    CFIndex Length = CFDataGetLength(cf);
    if (Length >= 1)
    {
      CFIndex v10 = Length;
      do
      {
        unsigned int v11 = *BytePtr++;
        CFStringAppendFormat(MutableCopy, 0LL, @"%02X", v11);
        --v10;
      }

      while (v10);
    }
  }

  else
  {
    CFMutableStringRef MutableCopy = 0LL;
  }

  if (MutableCopy) {
    uint64_t v12 = (const __CFData *)MutableCopy;
  }
  else {
    uint64_t v12 = cf;
  }
  CFStringAppendFormat( *(CFMutableStringRef *)(a1 + 40),  0LL,  @"%@%@:%@",  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL),  a2,  v12);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = @", ";
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
}

uint64_t apply_block_2_1391(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

CFStringRef CFDictionaryCopySuperCompactDescription(const __CFDictionary *a1)
{
  if (!a1) {
    return CFCopyDescription((CFTypeRef)*MEMORY[0x189605018]);
  }
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, @"{");
  v5[0] = 0LL;
  v5[1] = v5;
  v5[2] = 0x2000000000LL;
  v5[3] = &stru_18A137758;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 0x40000000LL;
  v4[2] = __CFDictionaryCopySuperCompactDescription_block_invoke;
  v4[3] = &unk_18A1356B8;
  v4[4] = v5;
  v4[5] = MutableCopy;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)apply_block_2_1391, v4);
  CFStringAppendFormat(MutableCopy, 0LL, @"}");
  _Block_object_dispose(v5, 8);
  return MutableCopy;
}

void __CFDictionaryCopySuperCompactDescription_block_invoke( uint64_t a1, const __CFString *a2, const __CFString *cf)
{
  if (!cf) {
    goto LABEL_12;
  }
  CFTypeID v6 = CFGetTypeID(cf);
  if (v6 == CFDataGetTypeID())
  {
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, @"0x");
    BytePtr = CFDataGetBytePtr((CFDataRef)cf);
    CFIndex Length = CFDataGetLength((CFDataRef)cf);
    if (Length >= 1)
    {
      CFIndex v10 = Length;
      do
      {
        unsigned int v11 = *BytePtr++;
        CFStringAppendFormat(MutableCopy, 0LL, @"%02X", v11);
        --v10;
      }

      while (v10);
    }

    v20.location = 0LL;
    v20.length = 5LL;
    CFStringDelete(MutableCopy, v20);
    goto LABEL_16;
  }

  CFTypeID v12 = CFGetTypeID(cf);
  if (v12 != CFStringGetTypeID())
  {
    CFTypeID v16 = CFGetTypeID(cf);
    if (v16 == CFNumberGetTypeID())
    {
      UniChar v14 = (const __CFAllocator *)*MEMORY[0x189604DB0];
      Copy = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, @"%@", cf);
      goto LABEL_14;
    }

LABEL_12:
    CFMutableStringRef MutableCopy = 0LL;
    goto LABEL_16;
  }

  CFIndex v13 = CFStringGetLength(cf);
  UniChar v14 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  if (v13 > 5)
  {
    v21.location = 0LL;
    v21.length = 6LL;
    Copy = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x189604DB0], cf, v21);
  }

  else
  {
    Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], cf);
  }

LABEL_14:
  uint64_t v17 = Copy;
  CFIndex v18 = CFStringGetLength(Copy);
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(v14, v18, v17);
  if (v17) {
    CFRelease(v17);
  }
LABEL_16:
  unsigned int CharacterAtIndex = CFStringGetCharacterAtIndex(a2, 0LL);
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 40), 0LL, @"%c:%@ ", CharacterAtIndex, MutableCopy);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = @", ";
  if (MutableCopy) {
    CFRelease(MutableCopy);
  }
}

uint64_t CFDataCreateWithRandomBytes(size_t a1)
{
  uint64_t v4 = 0LL;
  CFIndex v5 = &v4;
  uint64_t v6 = 0x2000000000LL;
  uint64_t v7 = 0LL;
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 0x40000000LL;
  v3[2] = __CFDataCreateWithRandomBytes_block_invoke;
  v3[3] = &unk_18A1356E0;
  v3[4] = &v4;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 0x40000000LL;
  v8[2] = __PerformWithBufferAndClear_block_invoke;
  v8[3] = &unk_18A1358B8;
  v8[4] = v3;
  PerformWithBuffer(a1, (uint64_t)v8);
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

CFDataRef __CFDataCreateWithRandomBytes_block_invoke(uint64_t a1, size_t a2, void *bytes)
{
  CFDataRef result = CFDataCreate(0LL, (const UInt8 *)bytes, a2);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t GetShortDateFormatter()
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __GetShortDateFormatter_block_invoke;
  block[3] = &__block_descriptor_tmp_39;
  block[4] = &GetShortDateFormatter_sGetShortDateFormatterSingleton;
  if (GetShortDateFormatter_sGetShortDateFormatterOnce != -1) {
    dispatch_once(&GetShortDateFormatter_sGetShortDateFormatterOnce, block);
  }
  return GetShortDateFormatter_sGetShortDateFormatterSingleton;
}

void __GetShortDateFormatter_block_invoke(uint64_t a1)
{
  char v2 = CFLocaleCopyCurrent();
  **(void **)(a1 + 32) = CFDateFormatterCreate( (CFAllocatorRef)*MEMORY[0x189604DB0],  v2,  kCFDateFormatterNoStyle,  kCFDateFormatterNoStyle);
  CFDateFormatterSetFormat(**(CFDateFormatterRef **)(a1 + 32), @"yyyy-MM-dd HH:mm");
  if (v2) {
    CFRelease(v2);
  }
}

uint64_t GetShortDateFormatterQueue()
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __GetShortDateFormatterQueue_block_invoke;
  block[3] = &__block_descriptor_tmp_41;
  block[4] = &GetShortDateFormatterQueue_sGetShortDateFormatterQueueSingleton;
  if (GetShortDateFormatterQueue_sGetShortDateFormatterQueueOnce != -1) {
    dispatch_once(&GetShortDateFormatterQueue_sGetShortDateFormatterQueueOnce, block);
  }
  return GetShortDateFormatterQueue_sGetShortDateFormatterQueueSingleton;
}

dispatch_queue_t __GetShortDateFormatterQueue_block_invoke(uint64_t a1)
{
  dispatch_queue_t result = dispatch_queue_create("Date Formatting", 0LL);
  **(void **)(a1 + 32) = result;
  return result;
}

void withStringOfAbsoluteTime(uint64_t a1, double a2)
{
  uint64_t v7 = 0LL;
  CFIndex v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  uint64_t v10 = 0LL;
  uint64_t v3 = MEMORY[0x1895F87A8];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 0x40000000LL;
  v6[2] = __withStringOfAbsoluteTime_block_invoke;
  v6[3] = &unk_18A135748;
  v6[4] = &v7;
  *(double *)&void v6[5] = a2;
  ShortDateFormatterQueue = (dispatch_queue_s *)GetShortDateFormatterQueue();
  block[0] = v3;
  block[1] = 0x40000000LL;
  block[2] = __withShortDateFormatter_block_invoke;
  block[3] = &unk_18A135818;
  block[4] = v6;
  dispatch_sync(ShortDateFormatterQueue, block);
  (*(void (**)(uint64_t, uint64_t))(a1 + 16))(a1, v8[3]);
  CFIndex v5 = (const void *)v8[3];
  if (v5)
  {
    v8[3] = 0LL;
    CFRelease(v5);
  }

  _Block_object_dispose(&v7, 8);
}

CFStringRef __withStringOfAbsoluteTime_block_invoke(uint64_t a1, __CFDateFormatter *a2)
{
  CFStringRef result = CFDateFormatterCreateStringWithAbsoluteTime( (CFAllocatorRef)*MEMORY[0x189604DB0],  a2,  *(CFAbsoluteTime *)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t __withShortDateFormatter_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t ShortDateFormatter = GetShortDateFormatter();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, ShortDateFormatter);
}

BOOL SecKernError(int a1, CFTypeRef *a2, CFStringRef format, ...)
{
  if (a1 && a2)
  {
    CFIndex v5 = (__CFError *)*a2;
    *a2 = 0LL;
    SecCFCreateErrorWithFormatAndArguments(a1, (const __CFString *)*MEMORY[0x189604F48], v5, a2, 0LL, format, va);
  }

  return a1 == 0;
}

uint64_t SecCFCreateErrorWithFormatAndArguments( CFIndex a1, const __CFString *a2, __CFError *cf, CFTypeRef *a4, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  if (!a4) {
    return 0LL;
  }
  if (*a4)
  {
    if (!cf || *a4 == cf) {
      return 0LL;
    }
    goto LABEL_41;
  }

  unsigned int v11 = CFStringCreateWithFormatAndArguments(0LL, formatOptions, format, arguments);
  uint64_t v32 = 0LL;
  CFTypeID v12 = (const void **)MEMORY[0x189604F38];
  if (cf)
  {
    CFIndex v13 = CFErrorCopyUserInfo(cf);
    Value = (const __CFString *)CFDictionaryGetValue(v13, *v12);
    if (Value)
    {
      BOOL v15 = CFStringCompare(v11, Value, 0LL) == kCFCompareEqualTo;
      if (!v13) {
        goto LABEL_10;
      }
    }

    else
    {
      BOOL v15 = 0;
      if (!v13)
      {
LABEL_10:
        CFIndex Code = CFErrorGetCode(cf);
        Domain = CFErrorGetDomain(cf);
        CFComparisonResult v18 = CFStringCompare(a2, Domain, 0LL);
        BOOL v20 = Code == a1 && v18 == kCFCompareEqualTo && v15;
        CFRange v21 = cf;
        if (v20) {
          goto LABEL_17;
        }
        uint64_t v23 = CFErrorCopyUserInfo(cf);
        if (v23)
        {
          uint64_t v24 = v23;
          CFIndex v25 = (const void *)*MEMORY[0x18960B7C0];
          if (CFDictionaryContainsKey(v23, (const void *)*MEMORY[0x18960B7C0]) == 1)
          {
            UniChar v26 = (const __CFNumber *)CFDictionaryGetValue(v24, v25);
            if (v26)
            {
              uint64_t valuePtr = 0LL;
              CFNumberGetValue(v26, kCFNumberLongType, &valuePtr);
              if (valuePtr > 199)
              {
                CFRelease(v24);
                CFRange v21 = cf;
LABEL_17:
                CFRetain(v21);
                *a4 = cf;
                CFRelease(cf);
                if (!v11) {
                  return 0LL;
                }
                CFIndex v22 = (__CFError *)v11;
LABEL_42:
                CFRelease(v22);
                return 0LL;
              }

              uint64_t v32 = valuePtr + 1;
            }
          }

          CFRelease(v24);
        }

        goto LABEL_28;
      }
    }

    CFRelease(v13);
    goto LABEL_10;
  }

LABEL_28:
  CFIndex v27 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFNumberRef v28 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x189604DB0], kCFNumberLongType, &v32);
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(v27, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  CFIndex v30 = Mutable;
  if (cf) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x189604F88], cf);
  }
  if (v28) {
    CFDictionaryAddValue(v30, (const void *)*MEMORY[0x18960B7C0], v28);
  }
  if (v11) {
    CFDictionaryAddValue(v30, *v12, v11);
  }
  *a4 = CFErrorCreate(v27, a2, a1, v30);
  if (v28) {
    CFRelease(v28);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v30) {
    CFRelease(v30);
  }
  if (cf)
  {
LABEL_41:
    CFIndex v22 = cf;
    goto LABEL_42;
  }

  return 0LL;
}

BOOL SecCheckErrno( int a1, CFTypeRef *a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1)
  {
    if (a2)
    {
      CFIndex v12 = *__error();
      CFIndex v13 = (__CFError *)*a2;
      *a2 = 0LL;
      CFStringRef v14 = CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, a3, &a9);
      BOOL v15 = (const __CFString *)*MEMORY[0x189604F58];
      strerror(v12);
      SecCFCreateErrorWithFormat(v12, v15, v13, a2, 0LL, @"%@: [%d] %s", v16, v17, (char)v14);
      if (v14) {
        CFRelease(v14);
      }
    }
  }

  return a1 == 0;
}

uint64_t SecCFCreateErrorWithFormat( CFIndex a1, const __CFString *a2, __CFError *a3, CFTypeRef *a4, const __CFDictionary *a5, const __CFString *a6, uint64_t a7, uint64_t a8, char a9)
{
  return 0LL;
}

BOOL SecError(int a1, __CFError **a2, CFStringRef format, ...)
{
  if (a1)
  {
    CFTypeRef cf = 0LL;
    CFIndex v5 = (const __CFString *)*MEMORY[0x189604F50];
    if (a2)
    {
      SecCFCreateErrorWithFormatAndArguments(a1, v5, *a2, &cf, 0LL, format, va);
      *a2 = (__CFError *)cf;
    }

    else
    {
      SecCFCreateErrorWithFormatAndArguments(a1, v5, 0LL, &cf, 0LL, format, va);
      CFTypeRef v6 = cf;
      if (cf)
      {
        CFTypeRef cf = 0LL;
        CFRelease(v6);
      }
    }
  }

  return a1 == 0;
}

uint64_t SecRequirementError(uint64_t a1, CFTypeRef *a2, CFStringRef format, ...)
{
  if (a2 && (a1 & 1) == 0)
  {
    CFIndex v5 = (__CFError *)*a2;
    *a2 = 0LL;
    SecCFCreateErrorWithFormatAndArguments(-50LL, (const __CFString *)*MEMORY[0x189604F50], v5, a2, 0LL, format, va);
  }

  return a1;
}

BOOL SecAllocationError(uint64_t a1, CFTypeRef *a2, CFStringRef format, ...)
{
  if (!a1 && a2)
  {
    CFIndex v5 = (__CFError *)*a2;
    *a2 = 0LL;
    SecCFCreateErrorWithFormatAndArguments(-108LL, (const __CFString *)*MEMORY[0x189604F50], v5, a2, 0LL, format, va);
  }

  return a1 != 0;
}

uint64_t GetKeybagAssertionQueue()
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __GetKeybagAssertionQueue_block_invoke;
  block[3] = &__block_descriptor_tmp_1413;
  block[4] = &GetKeybagAssertionQueue_sGetKeybagAssertionQueueSingleton;
  if (GetKeybagAssertionQueue_sGetKeybagAssertionQueueOnce != -1) {
    dispatch_once(&GetKeybagAssertionQueue_sGetKeybagAssertionQueueOnce, block);
  }
  return GetKeybagAssertionQueue_sGetKeybagAssertionQueueSingleton;
}

dispatch_queue_t __GetKeybagAssertionQueue_block_invoke(uint64_t a1)
{
  dispatch_queue_t result = dispatch_queue_create("AKS Lock Assertion Queue", 0LL);
  **(void **)(a1 + 32) = result;
  return result;
}

BOOL SecAKSKeybagHoldLockAssertion(int a1, uint64_t a2, CFTypeRef *a3)
{
  uint64_t v11 = 0LL;
  CFIndex v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  int v14 = 0;
  KeybagAssertionQueue = (dispatch_queue_s *)GetKeybagAssertionQueue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 0x40000000LL;
  block[2] = __SecAKSKeybagHoldLockAssertion_block_invoke;
  block[3] = &unk_18A135868;
  block[4] = &v11;
  void block[5] = a2;
  int v10 = a1;
  dispatch_sync(KeybagAssertionQueue, block);
  BOOL v7 = SecKernError(*((_DWORD *)v12 + 6), a3, @"Kern return error");
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __SecAKSKeybagHoldLockAssertion_block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (!count)
  {
    char v2 = (os_log_s *)secLogObjForScope("lockassertions");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(v1 + 40);
      int v4 = 134217984;
      uint64_t v5 = v3;
      _os_log_impl( &dword_187D59000,  v2,  OS_LOG_TYPE_DEFAULT,  "Requesting lock assertion for %lld seconds",  (uint8_t *)&v4,  0xCu);
    }

    dispatch_queue_t result = aks_assert_hold(*(_DWORD *)(v1 + 48), 0, *(void *)(v1 + 40));
    *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8LL) + 24LL) = result;
  }

  if (!*(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8LL) + 24LL)) {
    ++count;
  }
  return result;
}

BOOL SecAKSKeybagDropLockAssertion(int a1, CFTypeRef *a2)
{
  uint64_t v9 = 0LL;
  int v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  int v12 = 0;
  KeybagAssertionQueue = (dispatch_queue_s *)GetKeybagAssertionQueue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 0x40000000LL;
  v7[2] = __SecAKSKeybagDropLockAssertion_block_invoke;
  v7[3] = &unk_18A135890;
  v7[4] = &v9;
  int v8 = a1;
  dispatch_sync(KeybagAssertionQueue, v7);
  BOOL v5 = SecKernError(*((_DWORD *)v10 + 6), a2, @"Kern return error");
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __SecAKSKeybagDropLockAssertion_block_invoke(uint64_t result)
{
  int v1 = count;
  if (count)
  {
    --count;
    if (v1 == 1)
    {
      uint64_t v2 = result;
      uint64_t v3 = (os_log_s *)secLogObjForScope("lockassertions");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v4 = 0;
        _os_log_impl(&dword_187D59000, v3, OS_LOG_TYPE_DEFAULT, "Dropping lock assertion", v4, 2u);
      }

      dispatch_queue_t result = aks_assert_drop(*(_DWORD *)(v2 + 40), 0);
      *(_DWORD *)(*(void *)(*(void *)(v2 + 32) + 8LL) + 24LL) = result;
    }
  }

  return result;
}

BOOL SecAKSDoWithKeybagLockAssertion(int a1, CFTypeRef *a2, uint64_t a3)
{
  BOOL result = SecAKSKeybagHoldLockAssertion(a1, 60LL, a2);
  if (result)
  {
    (*(void (**)(uint64_t))(a3 + 16))(a3);
    return SecAKSKeybagDropLockAssertion(a1, a2);
  }

  return result;
}

uint64_t SecAKSDoWithKeybagLockAssertionSoftly(int a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  CFTypeRef cf = 0LL;
  if (SecAKSKeybagHoldLockAssertion(a1, 60LL, &cf))
  {
    (*(void (**)(uint64_t))(a2 + 16))(a2);
    SecAKSKeybagDropLockAssertion(a1, &cf);
    CFTypeRef v4 = cf;
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v4);
    }
  }

  else
  {
    BOOL v5 = (os_log_s *)secLogObjForScope("secaks");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v10 = a1;
      __int16 v11 = 2112;
      CFTypeRef v12 = cf;
      _os_log_impl( &dword_187D59000,  v5,  OS_LOG_TYPE_DEFAULT,  "SecAKSDoWithKeybagLockAssertionSoftly: failed to get assertion for %d proceeding bravely: %@",  buf,  0x12u);
    }

    CFTypeRef v6 = cf;
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v6);
    }

    (*(void (**)(uint64_t))(a2 + 16))(a2);
  }

  return 1LL;
}

CFDataRef SecAKSCopyBackupBagWithSecret(unint64_t a1, uint64_t a2, CFTypeRef *a3)
{
  int v5 = a1;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  LODWORD(v14[0]) = -1;
  memset((char *)v14 + 4, 0, 12);
  unint64_t v6 = a1 >> 31;
  SecRequirementError(a1 >> 31 == 0, a3, @"Invalid size: %zu", a1);
  if (!v6
    && (uint64_t bag = aks_create_bag(a2, v5, 4u, v14), SecKernError(bag, a3, @"bag allocation failed: %d", bag))
    && (uint64_t v8 = aks_save_bag(), SecKernError(v8, a3, @"save bag failed: %d", v8)))
  {
    int v9 = aks_unload_bag((int)v14[0]);
    if (v9)
    {
      int v10 = v9;
      __int16 v11 = (os_log_s *)secLogObjForScope("SecError");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v16 = v10;
        _os_log_impl(&dword_187D59000, v11, OS_LOG_TYPE_DEFAULT, "unload bag failed: %d", buf, 8u);
      }
    }

    CFDataRef v12 = CFDataCreate((CFAllocatorRef)*MEMORY[0x189604DB0], v14[1], SHIDWORD(v14[0]));
    SecAllocationError((uint64_t)v12, a3, @"Bag CFData Allocation Failed");
  }

  else
  {
    CFDataRef v12 = 0LL;
  }

  if (v14[1]) {
    free((void *)v14[1]);
  }
  return v12;
}

uint64_t SecAKSSanitizedKeyclass(uint64_t a1)
{
  int v1 = a1;
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v2 = a1 & 0x1F;
  uint64_t v3 = (os_log_s *)secLogObjForScope("SanitizeKeyclass");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 67109376;
    v5[1] = v1;
    __int16 v6 = 1024;
    int v7 = v2;
    _os_log_debug_impl( &dword_187D59000,  v3,  OS_LOG_TYPE_DEBUG,  "sanitizing request for keyclass %d to keyclass %d",  (uint8_t *)v5,  0xEu);
  }

  return v2;
}

uint64_t SecIsEduMode()
{
  return 0LL;
}

uint64_t SecSeparateUserKeychain()
{
  return 0LL;
}

CFURLRef SecCopyURLForFileInBaseDirectory(int a1, const __CFString *a2, uint64_t a3)
{
  int v5 = SecCopyBaseFilesURL(a1);
  if (a3)
  {
    __int16 v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    Copy = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, @"%@/%@", a2, a3);
  }

  else
  {
    if (!a2) {
      goto LABEL_10;
    }
    __int16 v6 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    Copy = CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x189604DB0], a2);
  }

  uint64_t v8 = Copy;
  if (v5 && Copy)
  {
    CFURLRef v9 = CFURLCreateCopyAppendingPathComponent(v6, v5, Copy, a3 == 0);
    CFRelease(v8);
LABEL_11:
    CFRelease(v5);
    return v9;
  }

  if (Copy) {
    CFRelease(Copy);
  }
LABEL_10:
  CFURLRef v9 = 0LL;
  if (v5) {
    goto LABEL_11;
  }
  return v9;
}

CFURLRef SecCopyURLForFileInUserScopedKeychainDirectory(uint64_t a1)
{
  return SecCopyURLForFileInBaseDirectory(1, @"Library/Keychains", a1);
}

CFURLRef SecCopyURLForFileInKeychainDirectory(uint64_t a1)
{
  return SecCopyURLForFileInBaseDirectory(1, @"Library/Keychains", a1);
}

CFURLRef SecCopyURLForFileInSystemKeychainDirectory(uint64_t a1)
{
  return SecCopyURLForFileInBaseDirectory(1, @"Library/Keychains", a1);
}

CFURLRef SecCopyURLForFileInUserCacheDirectory(uint64_t a1)
{
  return SecCopyURLForFileInBaseDirectory(1, @"Library/Caches", a1);
}

CFURLRef SecCopyURLForFileInPreferencesDirectory(uint64_t a1)
{
  return SecCopyURLForFileInBaseDirectory(0, @"Library/Preferences", a1);
}

CFURLRef SecCopyURLForFileInManagedPreferencesDirectory(uint64_t a1)
{
  uint64_t v2 = (const __CFAllocator *)*MEMORY[0x189604DB0];
  CFStringRef v3 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x189604DB0], "mobile", 0x600u);
  if (!v3) {
    return 0LL;
  }
  CFStringRef v4 = v3;
  int v5 = CFStringCreateWithFormat(v2, 0LL, @"/Library/Managed Preferences/%@/%@", v3, a1);
  if (v5)
  {
    __int16 v6 = v5;
    CFURLRef v7 = CFURLCreateWithFileSystemPath(v2, v5, kCFURLPOSIXPathStyle, 0);
    CFRelease(v6);
  }

  else
  {
    CFURLRef v7 = 0LL;
  }

  CFRelease(v4);
  return v7;
}

CFURLRef SecCopyURLForFileInProtectedDirectory(uint64_t a1)
{
  return SecCopyURLForFileInBaseDirectory(1, @"private/var/protected/", a1);
}

void WithPathInDirectory(const __CFURL *a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    memset(__b, 170, sizeof(__b));
    CFURLGetFileSystemRepresentation(a1, 0, __b, 1024LL);
    (*(void (**)(uint64_t, UInt8 *))(a2 + 16))(a2, __b);
    CFRelease(a1);
  }

void WithPathInKeychainDirectory(uint64_t a1, uint64_t a2)
{
  CFStringRef v4 = SecCopyURLForFileInBaseDirectory(1, @"Library/Keychains", a1);
  WithPathInDirectory(v4, a2);
}

void WithPathInUserCacheDirectory(uint64_t a1, uint64_t a2)
{
  CFStringRef v3 = SecCopyURLForFileInBaseDirectory(1, @"Library/Caches", a1);
  WithPathInDirectory(v3, a2);
}

void WithPathInProtectedDirectory(uint64_t a1, uint64_t a2)
{
  CFStringRef v3 = SecCopyURLForFileInBaseDirectory(1, @"private/var/protected/", a1);
  WithPathInDirectory(v3, a2);
}

void SetCustomHomePath(char *cStr)
{
  if (!cStr)
  {
    int v1 = (const __CFString *)sCustomHomeURL;
    if (!sCustomHomeURL) {
      return;
    }
    sCustomHomeURL = 0LL;
    goto LABEL_6;
  }

  int v1 = CFStringCreateWithCStringNoCopy(0LL, cStr, 0x8000100u, (CFAllocatorRef)*MEMORY[0x189604DC8]);
  SecSetCustomHomeURLString(v1);
  if (v1) {
LABEL_6:
  }
    CFRelease(v1);
}

void PerformWithBuffer(size_t __size, uint64_t a2)
{
  v5[1] = *MEMORY[0x1895F89C0];
  if (__size)
  {
    if (__size > 0x800)
    {
      CFStringRef v4 = malloc(__size);
      (*(void (**)(uint64_t, size_t, void *))(a2 + 16))(a2, __size, v4);
      if (v4) {
        free(v4);
      }
    }

    else
    {
      MEMORY[0x1895F8858]();
      memset((char *)v5 - ((__size + 15) & 0xFFFFFFFFFFFFFFF0LL), 170, __size);
      (*(void (**)(uint64_t, size_t, char *))(a2 + 16))( a2,  __size,  (char *)v5 - ((__size + 15) & 0xFFFFFFFFFFFFFFF0LL));
    }
  }

  else
  {
    (*(void (**)(uint64_t, void, void))(a2 + 16))(a2, 0LL, 0LL);
  }

void PerformWithBufferAndClear(size_t a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 0x40000000LL;
  v2[2] = __PerformWithBufferAndClear_block_invoke;
  v2[3] = &unk_18A1358B8;
  v2[4] = a2;
  PerformWithBuffer(a1, (uint64_t)v2);
}

void __PerformWithBufferAndClear_block_invoke(uint64_t a1, size_t a2, void *a3)
{
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x1895F8228](bytes, count);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
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

CFIndex CFArrayGetCountOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x189602670](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArraySortValues( CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x189602950](allocator, identifier);
}

void CFCalendarSetTimeZone(CFCalendarRef calendar, CFTimeZoneRef tz)
{
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1896029E0](theSet, theChar);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x189602A10](cf);
}

CFURLRef CFCopyHomeDirectoryURL(void)
{
  return (CFURLRef)MEMORY[0x189602A18]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x189602A58](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x189602A68](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
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

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
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

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
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

CFMutableDictionaryRef CFDictionaryCreateMutable( CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x189602BB8](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x189602BD0](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x189602C00](theDict, key);
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

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x189602C70](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x189602C78](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x189602D60]();
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

CFPropertyListRef CFPreferencesCopyValue( CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x189602F88](key, applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateWithStream( CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x189603000](allocator, stream, streamLength, options, format, error);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x189603060](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x189603098](stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1896030F0](cf);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
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

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x189603278]();
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare( CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1896033C0](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings( CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x189603400](alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x189603418](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x189603430](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x189603438](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes( CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x189603450](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x189603468](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy( CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x189603470](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments( CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x189603498](alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1896034A8](alloc, str, range.location, range.length);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
}

CFIndex CFStringGetBytes( CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1896034F0]( theString,  range.location,  range.length,  *(void *)&encoding,  lossByte,  isExternalRepresentation,  buffer,  maxBufLen);
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

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x189603548](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1896035A0](theString, prefix);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

CFTimeZoneRef CFTimeZoneCreateWithTimeIntervalFromGMT(CFAllocatorRef allocator, CFTimeInterval ti)
{
  return (CFTimeZoneRef)MEMORY[0x189603688](allocator, ti);
}

CFURLRef CFURLCreateCopyAppendingPathComponent( CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x189603748](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath( CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1896037C0](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation( CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x189603818](url, resolveAgainstBase, buffer, maxBufLen);
}

kern_return_t IOConnectCallMethod( mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x189607CB8]( *(void *)&connection,  *(void *)&selector,  input,  *(void *)&inputCnt,  inputStruct,  inputStructCnt,  output,  outputCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x189608488](*(void *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x189608550](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x189608580](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x189608598](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x189611D00]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x189611D10]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x189611D20]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x189611D28]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x189611D38]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x189611D40]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x189611D48]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x189611D50]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x189611D58]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x189611D60]();
}

uint64_t SOSCCCopyApplication()
{
  return MEMORY[0x18960AFE8]();
}

uint64_t SOSCCCopyCircleJoiningBlob()
{
  return MEMORY[0x18960AFF0]();
}

uint64_t SOSCCCopyInitialSyncData()
{
  return MEMORY[0x18960AFF8]();
}

uint64_t SOSCCIsSOSTrustAndSyncingEnabled()
{
  return MEMORY[0x18960B010]();
}

uint64_t SOSCCJoinWithCircleJoiningBlob()
{
  return MEMORY[0x18960B018]();
}

uint64_t SOSPeerInfoCopyEncodedData()
{
  return MEMORY[0x18960B048]();
}

uint64_t SOSPeerInfoCreateFromData()
{
  return MEMORY[0x18960B058]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x18960B3F8](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x18960B400](query, result);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x18960B418](query, attributesToUpdate);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x18960B5F8](rnd, count, bytes);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _OctagonSignpostCreate()
{
  return MEMORY[0x18960B768]();
}

uint64_t _OctagonSignpostGetNanoseconds()
{
  return MEMORY[0x18960B770]();
}

uint64_t _OctagonSignpostLogSystem()
{
  return MEMORY[0x18960B778]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895F8D88]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl( void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x189612738]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1895F9308]();
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

uint64_t cc_clear()
{
  return MEMORY[0x1895F9748]();
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x1895F9790]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x1895F9798]();
}

uint64_t ccder_decode_constructed_tl()
{
  return MEMORY[0x1895F9928]();
}

uint64_t ccder_decode_tl()
{
  return MEMORY[0x1895F9970]();
}

uint64_t ccder_decode_uint64()
{
  return MEMORY[0x1895F9978]();
}

uint64_t ccder_encode_body()
{
  return MEMORY[0x1895F9980]();
}

uint64_t ccder_encode_body_nocopy()
{
  return MEMORY[0x1895F9988]();
}

uint64_t ccder_encode_constructed_tl()
{
  return MEMORY[0x1895F9990]();
}

uint64_t ccder_encode_tl()
{
  return MEMORY[0x1895F99C0]();
}

uint64_t ccder_encode_uint64()
{
  return MEMORY[0x1895F99C8]();
}

uint64_t ccder_sizeof()
{
  return MEMORY[0x1895F99D0]();
}

uint64_t ccder_sizeof_raw_octet_string()
{
  return MEMORY[0x1895F9A00]();
}

uint64_t ccder_sizeof_uint64()
{
  return MEMORY[0x1895F9A10]();
}

uint64_t ccdh_ccn_size()
{
  return MEMORY[0x1895F9A28]();
}

uint64_t ccdh_gp_n()
{
  return MEMORY[0x1895F9A60]();
}

uint64_t ccgcm_context_size()
{
  return MEMORY[0x1895F9D40]();
}

uint64_t ccgcm_finalize()
{
  return MEMORY[0x1895F9D48]();
}

uint64_t ccgcm_init()
{
  return MEMORY[0x1895F9D60]();
}

uint64_t ccgcm_reset()
{
  return MEMORY[0x1895F9D78]();
}

uint64_t ccgcm_set_iv()
{
  return MEMORY[0x1895F9D80]();
}

uint64_t ccgcm_update()
{
  return MEMORY[0x1895F9D88]();
}

uint64_t cchkdf()
{
  return MEMORY[0x1895F9F08]();
}

uint64_t ccrng()
{
  return MEMORY[0x1895FA118]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1895FA278]();
}

uint64_t ccsrp_client_process_challenge()
{
  return MEMORY[0x1895FA328]();
}

uint64_t ccsrp_client_start_authentication()
{
  return MEMORY[0x1895FA330]();
}

uint64_t ccsrp_client_verify_session()
{
  return MEMORY[0x1895FA338]();
}

uint64_t ccsrp_ctx_init()
{
  return MEMORY[0x1895FA340]();
}

uint64_t ccsrp_exchange_size()
{
  return MEMORY[0x1895FA350]();
}

uint64_t ccsrp_generate_salt_and_verification()
{
  return MEMORY[0x1895FA358]();
}

uint64_t ccsrp_get_session_key()
{
  return MEMORY[0x1895FA368]();
}

uint64_t ccsrp_gp_rfc5054_3072()
{
  return MEMORY[0x1895FA388]();
}

uint64_t ccsrp_is_authenticated()
{
  return MEMORY[0x1895FA3A0]();
}

uint64_t ccsrp_server_start_authentication()
{
  return MEMORY[0x1895FA3B8]();
}

uint64_t ccsrp_server_verify_session()
{
  return MEMORY[0x1895FA3C0]();
}

uint64_t ccsrp_session_size()
{
  return MEMORY[0x1895FA3C8]();
}

size_t compression_decode_buffer( uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x189614998](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_decode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x1896149A0](*(void *)&algorithm);
}

size_t compression_encode_buffer( uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1896149A8](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x1896149B0](*(void *)&algorithm);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1895FAF58]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1895FC1B0](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1896166B8](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1896166C8](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1895FC600](log);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1895FC668]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

void syslog(int a1, const char *a2, ...)
{
}

uint64_t objc_msgSend_circleJoiningBlob_flowID_deviceSessionID_canSendMetrics_applicant_complete_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_circleJoiningBlob_flowID_deviceSessionID_canSendMetrics_applicant_complete_);
}

uint64_t objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_);
}

uint64_t objc_msgSend_initWithKeychainCircleMetrics_altDSID_flowID_deviceSessionID_eventName_testsAreEnabled_canSendMetrics_category_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_initWithKeychainCircleMetrics_altDSID_flowID_deviceSessionID_eventName_testsAreEnabled_canSendMetrics_category_);
}

uint64_t objc_msgSend_initWithProtocolType_uniqueDeviceID_uniqueClientID_pairingUUID_epoch_isInitiator_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithProtocolType_uniqueDeviceID_uniqueClientID_pairingUUID_epoch_isInitiator_);
}

uint64_t objc_msgSend_initWithSecret_context_as_altDSID_pairingUUID_piggybackingVersion_epoch_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithSecret_context_as_altDSID_pairingUUID_piggybackingVersion_epoch_);
}

uint64_t objc_msgSend_initialSyncCredentials_altDSID_flowID_deviceSessionID_canSendMetrics_complete_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initialSyncCredentials_altDSID_flowID_deviceSessionID_canSendMetrics_complete_);
}

uint64_t objc_msgSend_join_voucher_eventS_setupPairingChannelSignPost_finishPairing_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_join_voucher_eventS_setupPairingChannelSignPost_finishPairing_error_);
}

uint64_t objc_msgSend_joinCircleWithBlob_altDSID_flowID_deviceSessionID_canSendMetrics_version_complete_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_joinCircleWithBlob_altDSID_flowID_deviceSessionID_canSendMetrics_version_complete_);
}

uint64_t objc_msgSend_rpcVoucherWithArguments_configuration_peerID_permanentInfo_permanentInfoSig_stableInfo_stableInfoSig_maxCapability_reply_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_rpcVoucherWithArguments_configuration_peerID_permanentInfo_permanentInfoSig_stableInfo_stableInfoSig_maxCapability_reply_);
}

uint64_t objc_msgSend_stashAccountCredential_altDSID_flowID_deviceSessionID_canSendMetrics_complete_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_stashAccountCredential_altDSID_flowID_deviceSessionID_canSendMetrics_complete_);
}

uint64_t objc_msgSend_validatedStashedAccountCredential_flowID_deviceSessionID_canSendMetrics_complete_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_validatedStashedAccountCredential_flowID_deviceSessionID_canSendMetrics_complete_);
}