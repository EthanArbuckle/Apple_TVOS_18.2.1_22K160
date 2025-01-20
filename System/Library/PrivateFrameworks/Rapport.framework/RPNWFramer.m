@interface RPNWFramer
+ (BOOL)writeControlOnFramer:(id)a3 type:(int)a4 error:(unsigned __int8)a5;
+ (BOOL)writeDataOnFramer:(id)a3 data:(id)a4;
+ (const)controlCodeToString:(int)a3;
+ (void)setupDaemonFramer:(id)a3 receiveHandler:(id)a4 closeHandler:(id)a5;
+ (void)startConnection:(id)a3;
+ (void)writeErrorOnFramer:(id)a3 error:(unsigned __int8)a4;
@end

@implementation RPNWFramer

+ (const)controlCodeToString:(int)a3
{
  else {
    return off_18A031F58[a3];
  }
}

+ (BOOL)writeControlOnFramer:(id)a3 type:(int)a4 error:(unsigned __int8)a5
{
  id v7 = a3;
  v8 = v7;
  if (v7)
  {
    if (a4 == 1) {
      int v9 = 320017171;
    }
    else {
      int v9 = 0;
    }
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __46__RPNWFramer_writeControlOnFramer_type_error___block_invoke;
    v11[3] = &unk_18A031D30;
    v12 = (nw_framer *)v7;
    char v13 = a4;
    unsigned __int8 v14 = a5;
    __int16 v15 = 0;
    int v16 = v9;
    uint64_t v17 = 0LL;
    unsigned __int8 v19 = a5;
    int v18 = a4;
    nw_framer_async(v12, v11);
  }

  return v8 != 0LL;
}

void __46__RPNWFramer_writeControlOnFramer_type_error___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 60))
  {
    if (gLogCategory_RPNWFramer <= 30 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
    {
      +[RPNWFramer controlCodeToString:](&OBJC_CLASS___RPNWFramer, "controlCodeToString:", *(unsigned int *)(a1 + 56));
      strerror(*(unsigned __int8 *)(a1 + 60));
LABEL_8:
      LogPrintF();
    }
  }

  else if (gLogCategory_RPNWFramer <= 30 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
  {
    +[RPNWFramer controlCodeToString:](&OBJC_CLASS___RPNWFramer, "controlCodeToString:", *(unsigned int *)(a1 + 56));
    goto LABEL_8;
  }

+ (BOOL)writeDataOnFramer:(id)a3 data:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0LL;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8;
  if (!v8)
  {
    async_block[0] = MEMORY[0x1895F87A8];
    async_block[1] = 3221225472LL;
    async_block[2] = __37__RPNWFramer_writeDataOnFramer_data___block_invoke;
    async_block[3] = &unk_18A031AE8;
    id v12 = v7;
    char v13 = (nw_framer *)v5;
    nw_framer_async(v13, async_block);
  }

  return v9;
}

void __37__RPNWFramer_writeDataOnFramer_data___block_invoke(uint64_t a1)
{
  size_t v2 = [*(id *)(a1 + 32) length];
  v3 = (const uint8_t *)[*(id *)(a1 + 32) bytes];
  *(void *)output_buffer = 0LL;
  size_t v5 = v2;
  nw_framer_write_output(*(nw_framer_t *)(a1 + 40), output_buffer, 0x10uLL);
  nw_framer_write_output(*(nw_framer_t *)(a1 + 40), v3, v2);
}

+ (void)startConnection:(id)a3
{
  id v3 = a3;
  +[RPNWFramer writeControlOnFramer:type:error:]( &OBJC_CLASS___RPNWFramer,  "writeControlOnFramer:type:error:",  v3,  1LL,  0LL);
}

+ (void)writeErrorOnFramer:(id)a3 error:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if (gLogCategory_RPNWFramer <= 30 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = v4;
    LogPrintF();
  }

  +[RPNWFramer writeControlOnFramer:type:error:]( &OBJC_CLASS___RPNWFramer,  "writeControlOnFramer:type:error:",  v6,  2LL,  v4,  v5);
}

+ (void)setupDaemonFramer:(id)a3 receiveHandler:(id)a4 closeHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  char v24 = 0;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x2020000000LL;
  v22[3] = 0LL;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  char v21 = 0;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke;
  v13[3] = &unk_18A031DA8;
  uint64_t v17 = v23;
  int v18 = v20;
  unsigned __int8 v19 = v22;
  id v10 = v8;
  id v15 = v10;
  id v11 = v9;
  id v16 = v11;
  id v12 = v7;
  id v14 = v12;
  nw_framer_set_input_handler((nw_framer_t)v12, v13);
  nw_framer_set_output_handler((nw_framer_t)v12, &__block_literal_global_1);
  nw_framer_set_cleanup_handler((nw_framer_t)v12, &__block_literal_global_29);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
}

uint64_t __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v7 = MEMORY[0x1895F87A8];
  while (1)
  {
    do
    {
      uint64_t v8 = *(void *)(a1 + 56);
      if (*(_BYTE *)(*(void *)(v8 + 8) + 24LL)) {
        break;
      }
      uint64_t v28 = 0LL;
      v29 = &v28;
      uint64_t v30 = 0x3010000000LL;
      v31 = "";
      uint64_t v32 = 0LL;
      uint64_t v33 = 0LL;
      parse[0] = v7;
      parse[1] = 3221225472LL;
      parse[2] = __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke_2;
      parse[3] = &unk_18A031D58;
      uint64_t v27 = 16LL;
      parse[4] = &v28;
      parse[5] = v8;
      __int128 v26 = *(_OWORD *)(a1 + 64);
      if (!nw_framer_parse_input(v6, 0x10uLL, 0x10uLL, 0LL, parse))
      {
        _Block_object_dispose(&v28, 8);
        uint64_t v15 = 16LL;
        goto LABEL_41;
      }

      if (gLogCategory_RPNWFramer <= 40 && (gLogCategory_RPNWFramer != -1 || _LogCategory_Initialize()))
      {
        id v9 = +[RPNWFramer controlCodeToString:]( &OBJC_CLASS___RPNWFramer,  "controlCodeToString:",  *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL),  v17,  v18,  v19,  v20);
        uint64_t v10 = *((unsigned __int8 *)v29 + 33);
        unsigned __int8 v19 = strerror(*((unsigned __int8 *)v29 + 33));
        uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL);
        uint64_t v17 = v9;
        uint64_t v18 = v10;
        LogPrintF();
      }

      _Block_object_dispose(&v28, 8);
    }

    while (!*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL));
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL))
    {
      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) == 3)
      {
      }

      else
      {
        nw_framer_mark_failed_with_error(*(nw_framer_t *)(a1 + 32), 57);
      }

      (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16LL))( *(void *)(a1 + 48),  v3,  v4,  v5);
      goto LABEL_40;
    }

    if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8LL) + 24LL)) {
      break;
    }
    uint64_t v11 = *(void *)(a1 + 72);
    size_t v12 = *(void *)(*(void *)(v11 + 8) + 24LL);
    v21[0] = v7;
    v21[1] = 3221225472LL;
    v21[2] = __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke_3;
    v21[3] = &unk_18A031D80;
    uint64_t v23 = v11;
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 56);
    id v22 = v13;
    uint64_t v24 = v14;
    if (!nw_framer_parse_input(v6, 1uLL, v12, 0LL, v21))
    {

LABEL_40:
      uint64_t v15 = 0LL;
      goto LABEL_41;
    }
  }

  uint64_t v15 = 0LL;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0;
LABEL_41:

  return v15;
}

uint64_t __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke_2( void *a1,  _OWORD *a2,  unint64_t a3)
{
  if (!a2 || a1[8] > a3) {
    return 0LL;
  }
  *(_OWORD *)(*(void *)(a1[4] + 8LL) + 32LL) = *a2;
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = *(_BYTE *)(*(void *)(a1[4] + 8LL) + 32LL);
  *(void *)(*(void *)(a1[7] + 8LL) + 24LL) = *(void *)(*(void *)(a1[4] + 8LL) + 40LL);
  return a1[8];
}

unint64_t __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke_3( void *a1,  uint64_t a2,  unint64_t a3)
{
  if (!a2) {
    return 0LL;
  }
  unint64_t v3 = a3;
  if (*(void *)(*(void *)(a1[5] + 8LL) + 24LL) <= a3)
  {
    (*(void (**)(void))(a1[4] + 16LL))(a1[4]);
    *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = 0LL;
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 0;
  }

  else
  {
    (*(void (**)(void))(a1[4] + 16LL))(a1[4]);
    *(void *)(*(void *)(a1[5] + 8LL) + 24LL) -= v3;
  }

  return v3;
}

void __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke_4( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v4 = a3;
}

void __60__RPNWFramer_setupDaemonFramer_receiveHandler_closeHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = v2;
  if (gLogCategory_RPNWFramer <= 30
    && ((id v5 = v2, gLogCategory_RPNWFramer != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();
  }

  else
  {
  }

@end