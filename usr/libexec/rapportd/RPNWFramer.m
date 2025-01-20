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
    return (&off_1001127A8)[a3];
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
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10003AAC0;
    v11[3] = &unk_100112580;
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
    if (dword_100131550 <= 30
      && (dword_100131550 != -1 || _LogCategory_Initialize(&dword_100131550, 30LL)))
    {
      LogPrintF( &dword_100131550,  "+[RPNWFramer writeDataOnFramer:data:]",  30LL,  "Received data from Rapport peer, writing to agent client framer=%@",  v5);
    }

    async_block[0] = _NSConcreteStackBlock;
    async_block[1] = 3221225472LL;
    async_block[2] = sub_10003ACD8;
    async_block[3] = &unk_100111968;
    id v12 = v7;
    char v13 = (nw_framer *)v5;
    nw_framer_async(v13, async_block);
  }

  return v9;
}

+ (void)startConnection:(id)a3
{
  id v3 = a3;
  +[RPNWFramer writeControlOnFramer:type:error:]( &OBJC_CLASS___RPNWFramer,  "writeControlOnFramer:type:error:",  v3,  1LL,  0LL);
}

+ (void)writeErrorOnFramer:(id)a3 error:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v5 = a3;
  if (dword_100131550 <= 30 && (dword_100131550 != -1 || _LogCategory_Initialize(&dword_100131550, 30LL))) {
    LogPrintF( &dword_100131550,  "+[RPNWFramer writeErrorOnFramer:error:]",  30LL,  "Sending error (%d) to client app connection\n",  v4);
  }
  +[RPNWFramer writeControlOnFramer:type:error:]( &OBJC_CLASS___RPNWFramer,  "writeControlOnFramer:type:error:",  v5,  2LL,  v4);
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
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10003B090;
  v13[3] = &unk_1001125F8;
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
  nw_framer_set_output_handler((nw_framer_t)v12, &stru_100112638);
  nw_framer_set_cleanup_handler((nw_framer_t)v12, &stru_100112678);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
}

@end