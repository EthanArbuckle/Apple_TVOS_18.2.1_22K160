@interface NANDTelemetry_NandGBBSweepDaily
+ (BOOL)shouldRegisterActivity;
+ (void)setGBBXpcCritiria:(id)a3;
- ($426A05A3E2C7351E65A2A915B10A9485)sweepInfo;
- (BOOL)_createDirectoryAt:(id)a3;
- (BOOL)_isGBBSweepEnabled;
- (BOOL)wasSigtermReceived;
- (NANDTelemetry_NandGBBSweepDaily)initWithXpcActivityMgr:(id)a3 persistentStateMgr:(id)a4 privacyMgr:(id)a5;
- (NSString)blockPath;
- (NSString)compressedPath;
- (id)_getBlockStr:(unsigned int)a3;
- (id)_getReasonString:(unsigned int)a3;
- (int)sweepError;
- (int)uploadFile:(id)a3 description:(id)a4;
- (unint64_t)sweepBufSize;
- (unsigned)currBlock;
- (void)_checkTestHook;
- (void)_cleanItemAt:(id)a3;
- (void)_compressRange:(unsigned int)a3 startWL:(unsigned int)a4 endWL:(unsigned int)a5 content:(id)a6;
- (void)_doCleanup:(id)a3;
- (void)_fillSweepParams;
- (void)_gatherRadarInfo;
- (void)_sweepBlock:(id *)a3;
- (void)_writeCounters:(id)a3 counters:(id)a4;
- (void)cleanUpForTelemetryDisable;
- (void)ctl;
- (void)getDefects:(unint64_t *)a3;
- (void)markGBBAsSwept;
- (void)runActivity;
- (void)setBlockPath:(id)a3;
- (void)setCompressedPath:(id)a3;
- (void)setCtl:(void *)a3;
- (void)setCurrBlock:(unsigned int)a3;
- (void)setSweepBuf:(void *)a3;
- (void)setSweepBufSize:(unint64_t)a3;
- (void)setSweepError:(int)a3;
- (void)setSweepInfo:(id *)a3;
- (void)setWasSigtermReceived:(BOOL)a3;
- (void)sweepBuf;
@end

@implementation NANDTelemetry_NandGBBSweepDaily

- (NANDTelemetry_NandGBBSweepDaily)initWithXpcActivityMgr:(id)a3 persistentStateMgr:(id)a4 privacyMgr:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NANDTelemetry_NandGBBSweepDaily;
  v5 = -[NANDTelemetry_Base initWithXpcActivityMgr:persistentStateMgr:privacyMgr:]( &v9,  "initWithXpcActivityMgr:persistentStateMgr:privacyMgr:",  a3,  a4,  a5);
  v6 = v5;
  if (v5)
  {
    v5->_ctl = 0LL;
    v5->_sweepBuf = 0LL;
    v5->_sweepInfo = 0LL;
    v5->_sweepBufSize = 3145728LL;
    v5->_sweepError = 0;
    v7 = v5;
  }

  return v6;
}

- (BOOL)_isGBBSweepEnabled
{
  uint64_t v4 = 0LL;
  int v2 = os_parse_boot_arg_int("automatic_gbb_sweep_disable", &v4) ^ 1;
  if (v4) {
    return v2;
  }
  else {
    return 1;
  }
}

- (BOOL)_createDirectoryAt:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:0];

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    NSFileAttributeKey v10 = NSFilePosixPermissions;
    v11 = &off_1000AC220;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    [v6 setAttributes:v7 ofItemAtPath:v3 error:0];
  }

  else
  {
    v8 = (void *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100042A7C(v3, v8);
    }
  }

  return v5;
}

- (void)_doCleanup:(id)a3
{
  id v4 = a3;
  if (-[NANDTelemetry_NandGBBSweepDaily sweepError](self, "sweepError") == 8) {
    goto LABEL_5;
  }
  if (-[NANDTelemetry_NandGBBSweepDaily sweepError](self, "sweepError") && (unsigned __int16)word_1000C42D2 < 4u)
  {
    ++word_1000C42D2;
LABEL_5:
    byte_1000C42D0 = 1;
    goto LABEL_9;
  }

  dword_1000C42D4 = 0;
  byte_1000C42D0 = 0;
  if ((byte_1000C42D8 & 1) == 0) {
    -[NANDTelemetry_NandGBBSweepDaily _cleanItemAt:](self, "_cleanItemAt:", v4);
  }
  word_1000C42D2 = 0;
LABEL_9:
}

- (void)_cleanItemAt:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v4 removeItemAtPath:v3 error:0];
}

- (void)_writeCounters:(id)a3 counters:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    id v9 = 0LL;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v6,  1LL,  &v9));
    id v6 = v9;
    if (!v6)
    {
      [v8 writeToFile:v5 atomically:1];
      id v6 = 0LL;
    }
  }

  else
  {
    v8 = 0LL;
  }
}

- (void)_compressRange:(unsigned int)a3 startWL:(unsigned int)a4 endWL:(unsigned int)a5 content:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v22 = a6;
  if (v7 < a5)
  {
    do
    {
      NSFileAttributeKey v10 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
      v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/Sweep_Wordline_%d.bin",  v10,  v7));
      [v22 addObject:v11];

      uint64_t v7 = (v7 + 1);
    }

    while (a5 != (_DWORD)v7);
  }

  if (a5 == a3)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/FTLCounters.json",  v12));
    [v22 addObject:v13];

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/MSPCounters.json",  v14));
    [v22 addObject:v15];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/description.txt",  v16));
    [v22 addObject:v17];

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/Defects.txt",  v18));
    [v22 addObject:v19];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/ErrorLog.txt",  v20));
    [v22 addObject:v21];
  }
}

- (void)_fillSweepParams
{
  id v3 = -[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
  LODWORD(xmmword_1000C42DC) = v3->var1[-[NANDTelemetry_NandGBBSweepDaily currBlock](self, "currBlock")].var0;
  id v4 = -[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
  DWORD1(xmmword_1000C42DC) = v4->var1[-[NANDTelemetry_NandGBBSweepDaily currBlock](self, "currBlock")].var1;
  id v5 = -[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
  DWORD2(xmmword_1000C42DC) = v5->var1[-[NANDTelemetry_NandGBBSweepDaily currBlock](self, "currBlock")].var2;
  id v6 = -[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
  HIDWORD(xmmword_1000C42DC) = v6->var1[-[NANDTelemetry_NandGBBSweepDaily currBlock](self, "currBlock")].var3;
  uint64_t v7 = -[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
  dword_1000C42EC = v7->var1[-[NANDTelemetry_NandGBBSweepDaily currBlock](self, "currBlock")].var4;
  v8 = -[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
  BOOL v9 = (v8->var1[-[NANDTelemetry_NandGBBSweepDaily currBlock](self, "currBlock")].var5 & 0xFFFFFFFE) == 2;
  dword_1000C42F0 = 0;
  dword_1000C42F4 = v9;
  unk_1000C42F8 = xmmword_100085190;
  NSFileAttributeKey v10 = -[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
  dword_1000C4308 = v10->var1[-[NANDTelemetry_NandGBBSweepDaily currBlock](self, "currBlock")].var6;
}

- (void)_gatherRadarInfo
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
  id v4 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@/description.txt", v3));
  __strcpy_chk(__filename, [v4 UTF8String], 1024);

  id v5 = fopen(__filename, "a");
  if (v5)
  {
    id v6 = v5;
    fprintf( v5,  "Build Version: %.*s\n",  8,  (const char *)-[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo") + 144);
    fprintf( v6,  "Build Number : %.*s\n",  16,  (const char *)-[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo") + 152);
    fprintf( v6,  "Long Version : %.*s\n",  128,  (const char *)-[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo") + 168);
    fprintf( v6,  "MSP Version  : %.*s\n",  16,  (const char *)-[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo") + 296);
    fprintf( v6,  "NAND Vendor  : %.*s\n",  16,  (const char *)-[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo") + 344);
    fprintf( v6,  "Build Type   : %.*s\n",  32,  (const char *)-[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo") + 312);
    fprintf( v6,  "Capacity     : %d GB\n\n",  *((unsigned __int16 *)-[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo") + 213));
    fclose(v6);
  }

  if (!-[NANDTelemetry_NandGBBSweepDaily wasSigtermReceived](self, "wasSigtermReceived"))
  {
    v14 = CopyWhitelistedNANDFTLInfo(1LL, v7, v8, v9, v10, v11, v12, v13);
    v15 = CopyWhitelistedNANDMSPInfo();
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/FTLCounters.json",  v16));
    -[NANDTelemetry_NandGBBSweepDaily _writeCounters:counters:](self, "_writeCounters:counters:", v17, v14);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/MSPCounters.json",  v18));
    -[NANDTelemetry_NandGBBSweepDaily _writeCounters:counters:](self, "_writeCounters:counters:", v19, v15);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    id v21 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@/Defects.txt", v20));
    print_grown_defects_ext((char *)[v21 UTF8String]);

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    id v23 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"%@/ErrorLog.txt", v22));
    sub_100037240((const char *)[v23 UTF8String]);

    print_geometry(__filename);
  }

- (id)_getReasonString:(unsigned int)a3
{
  if (a3 - 1 > 0x13) {
    return @"UNKNOWN_REASON";
  }
  else {
    return off_10008C878[a3 - 1];
  }
}

- (id)_getBlockStr:(unsigned int)a3
{
  if (byte_1000C42D0 == 1)
  {
    uint64_t v5 = dword_1000C430C;
  }

  else
  {
    id v6 = -[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
    uint64_t v5 = v6->var11[-[NANDTelemetry_NandGBBSweepDaily currBlock](self, "currBlock")];
  }

  uint64_t v7 = DWORD1(xmmword_1000C42DC);
  uint64_t v16 = xmmword_1000C42DC;
  uint64_t v8 = DWORD2(xmmword_1000C42DC);
  uint64_t v9 = HIDWORD(xmmword_1000C42DC);
  uint64_t v10 = dword_1000C42EC;
  unsigned int v17 = a3;
  else {
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%d", v5));
  }
  uint64_t v12 = dword_1000C42F4;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[NANDTelemetry_NandGBBSweepDaily _getReasonString:]( self,  "_getReasonString:",  dword_1000C4308));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MSP%d_Channel%d_Die%d_Plane%d_Block%d_Page%@_Mode%d_Reason%@",  v16,  v7,  v8,  v9,  v10,  v11,  v12,  v13));

  return v14;
}

- (void)_sweepBlock:(id *)a3
{
  uint64_t var10 = a3->var10;
  v28 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if ((byte_1000C42D0 & 1) == 0)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    unsigned __int8 v6 = -[NANDTelemetry_NandGBBSweepDaily _createDirectoryAt:](self, "_createDirectoryAt:", v5);

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = (void *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
        sub_100042BA4(v7, self);
      }
      -[NANDTelemetry_NandGBBSweepDaily setSweepError:](self, "setSweepError:", 7LL);
    }

    byte_1000C42D0 = 1;
  }

  if (dword_1000C42F0 < var10)
  {
    id v8 = 0LL;
    uint64_t v9 = 0LL;
    double v10 = 0.0;
    while (1)
    {
      uint64_t v11 = v9;
      if (-[NANDTelemetry_NandGBBSweepDaily wasSigtermReceived](self, "wasSigtermReceived")
        || v10 > 4.5 && -[NANDTelemetry_Base tryDeferXpcActivity](self, "tryDeferXpcActivity"))
      {
        -[NANDTelemetry_NandGBBSweepDaily setSweepError:](self, "setSweepError:", 8LL);
        goto LABEL_23;
      }

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/Sweep_Wordline_%d.bin",  v12,  dword_1000C42F0));

      v14 = (void *)oslog;
      if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = dword_1000C42F0;
        id v16 = v13;
        unsigned int v17 = v14;
        id v18 = [v16 UTF8String];
        *(_DWORD *)buf = 67109378;
        int v30 = v15;
        __int16 v31 = 2080;
        id v32 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Sweeping WL %d, into %s", buf, 0x12u);
      }

      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));

      v19 = -[NANDTelemetry_NandGBBSweepDaily ctl](self, "ctl");
      v20 = -[NANDTelemetry_NandGBBSweepDaily sweepBuf](self, "sweepBuf");
      uint64_t v21 = -[NANDTelemetry_NandGBBSweepDaily sweepBufSize](self, "sweepBufSize");
      id v8 = v13;
      -[NANDTelemetry_NandGBBSweepDaily setSweepError:]( self,  "setSweepError:",  Do_NVMeCTL_WL_Sweep((uint64_t)v19, &xmmword_1000C42DC, v20, v21, (const char *)[v8 UTF8String]));
      id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v22 timeIntervalSinceDate:v9];
      double v24 = v23;

      if (-[NANDTelemetry_NandGBBSweepDaily sweepError](self, "sweepError")) {
        break;
      }
      int v25 = dword_1000C42F0;
      if (dword_1000C42F0 != dword_1000C42D4 && !(dword_1000C42F0 % 0x64u))
      {
        -[NANDTelemetry_NandGBBSweepDaily _compressRange:startWL:endWL:content:]( self,  "_compressRange:startWL:endWL:content:",  var10);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily compressedPath](self, "compressedPath"));
        CompressFiles(v28, v26, dword_1000C42D4 == 0);

        int v25 = dword_1000C42F0;
        dword_1000C42D4 = dword_1000C42F0;
      }

      double v10 = v10 + v24;
      dword_1000C42F0 = v25 + 1;
    }

    v27 = (void *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100042B0C(v27, self);
    }
LABEL_23:
  }
}

- (void)_checkTestHook
{
  if (os_variant_has_internal_content("com.apple.ASPCarryLog", a2)
    && (id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_Base stateMgr](self, "stateMgr")),
        unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v3 getValueForKey:@"gbb_test_mode"]),
        v3,
        v6))
  {
    unsigned int v4 = [v6 isEqualToString:@"yes"];
    uint64_t v5 = v6;
    if (v4) {
      byte_1000C42D8 = 1;
    }
  }

  else
  {
    uint64_t v5 = 0LL;
  }
}

- (void)cleanUpForTelemetryDisable
{
}

- (void)runActivity
{
  unint64_t v39 = 0LL;
  v36 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id DeviceSerialNumber = getDeviceSerialNumber();
  v37 = (void *)objc_claimAutoreleasedReturnValue(DeviceSerialNumber);
  char v4 = byte_1000C42D0;
  -[NANDTelemetry_NandGBBSweepDaily setWasSigtermReceived:](self, "setWasSigtermReceived:", 0LL);
  uint64_t v5 = (os_log_s *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "GBB Activity Start.", buf, 2u);
  }

  signal(15, (void (__cdecl *)(int))1);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  id v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0LL, v7);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10000C0C4;
  handler[3] = &unk_10008C858;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_activate(v8);
  if ((byte_1000C42D0 & 1) == 0)
  {
    -[NANDTelemetry_NandGBBSweepDaily _checkTestHook](self, "_checkTestHook");
    if ((byte_1000C42D8 & 1) == 0) {
      -[NANDTelemetry_NandGBBSweepDaily _cleanItemAt:]( self,  "_cleanItemAt:",  @"/private/var/db/NANDTelemetryServices/GBBCollection");
    }
    -[NANDTelemetry_NandGBBSweepDaily _createDirectoryAt:]( self,  "_createDirectoryAt:",  @"/private/var/db/NANDTelemetryServices/GBBCollection");
  }

  if (!-[NANDTelemetry_NandGBBSweepDaily _isGBBSweepEnabled](self, "_isGBBSweepEnabled"))
  {
    __int16 v31 = (os_log_s *)oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "GBB Collection Disabled via boot-args",  buf,  2u);
    }

    goto LABEL_41;
  }

  if (-[NANDTelemetry_NandGBBSweepDaily wasSigtermReceived](self, "wasSigtermReceived")
    || !sub_100036C6C(0LL, (uint64_t)buf))
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100042C40();
    }
    goto LABEL_41;
  }

  uint64_t inited = Init_NVMeCTL();
  -[NANDTelemetry_NandGBBSweepDaily setCtl:](self, "setCtl:", inited);
  if (!inited)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100042C6C();
    }
    goto LABEL_41;
  }

  double v10 = valloc(-[NANDTelemetry_NandGBBSweepDaily sweepBufSize](self, "sweepBufSize"));
  -[NANDTelemetry_NandGBBSweepDaily setSweepBuf:](self, "setSweepBuf:", v10);
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100042C98();
    }
LABEL_41:
    id v18 = 0LL;
    double v23 = 0LL;
    uint64_t v11 = 0LL;
    goto LABEL_42;
  }

  uint64_t v11 = -[NANDTelemetry_NandGBBSweepDaily getDefects:](self, "getDefects:", &v39);
  if (!v11 || v39 <= 3)
  {
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
      sub_100042CC4();
    }
    goto LABEL_60;
  }

  -[NANDTelemetry_NandGBBSweepDaily setSweepInfo:](self, "setSweepInfo:", v11);
  unsigned int v12 = *(_DWORD *)-[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
  if (byte_1000C42D0) {
    unsigned int v13 = dword_1000C4310;
  }
  else {
    unsigned int v13 = 2;
  }
  if (v12 >= v13) {
    unsigned int v12 = v13;
  }
  dword_1000C4310 = v12;
  -[NANDTelemetry_NandGBBSweepDaily setCurrBlock:](self, "setCurrBlock:", 0LL);
  -[NANDTelemetry_NandGBBSweepDaily setSweepError:](self, "setSweepError:", 0LL);
  v14 = (os_log_s *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v40 = 67109120;
    int v41 = dword_1000C4310;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sweeping %d bad blocks", v40, 8u);
  }

  if (!dword_1000C4310)
  {
LABEL_60:
    id v18 = 0LL;
    double v23 = 0LL;
    goto LABEL_42;
  }

  int v15 = 0LL;
  id v16 = 0LL;
  v35 = v7;
  while (1)
  {
    if ((v4 & 1) == 0)
    {
      -[NANDTelemetry_NandGBBSweepDaily _fillSweepParams](self, "_fillSweepParams");
      unsigned int v17 = -[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
      dword_1000C430C = v17->var11[-[NANDTelemetry_NandGBBSweepDaily currBlock](self, "currBlock")];
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily _getBlockStr:](self, "_getBlockStr:", v43));

    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  @"/private/var/db/NANDTelemetryServices/GBBCollection",  v18));
    -[NANDTelemetry_NandGBBSweepDaily setBlockPath:](self, "setBlockPath:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@_%@.tar",  v20,  v18,  v37));
    -[NANDTelemetry_NandGBBSweepDaily setCompressedPath:](self, "setCompressedPath:", v21);

    id v22 = (void *)objc_claimAutoreleasedReturnValue( -[NANDTelemetry_NandGBBSweepDaily _getReasonString:]( self,  "_getReasonString:",  dword_1000C4308));
    double v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@][New GBB Detected: %@][%@]",  v37,  v18,  v22));

    if ((v4 & 1) == 0)
    {
      double v24 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
      unsigned __int8 v25 = -[NANDTelemetry_NandGBBSweepDaily _createDirectoryAt:](self, "_createDirectoryAt:", v24);

      if ((v25 & 1) == 0) {
        break;
      }
    }

    -[NANDTelemetry_NandGBBSweepDaily _sweepBlock:](self, "_sweepBlock:", buf);
    uint64_t v7 = v35;
    if (-[NANDTelemetry_NandGBBSweepDaily sweepError](self, "sweepError"))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
      -[NANDTelemetry_NandGBBSweepDaily _doCleanup:](self, "_doCleanup:", v33);

      goto LABEL_42;
    }

    -[NANDTelemetry_NandGBBSweepDaily _gatherRadarInfo](self, "_gatherRadarInfo");
    -[NANDTelemetry_NandGBBSweepDaily _compressRange:startWL:endWL:content:]( self,  "_compressRange:startWL:endWL:content:",  v44,  dword_1000C42D4,  v44,  v36);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily compressedPath](self, "compressedPath"));
    CompressFiles(v36, v26, 0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily compressedPath](self, "compressedPath"));
    -[NANDTelemetry_NandGBBSweepDaily uploadFile:description:](self, "uploadFile:description:", v27, v23);

    -[NANDTelemetry_NandGBBSweepDaily markGBBAsSwept](self, "markGBBAsSwept");
    --dword_1000C4310;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NANDTelemetry_NandGBBSweepDaily blockPath](self, "blockPath"));
    -[NANDTelemetry_NandGBBSweepDaily _doCleanup:](self, "_doCleanup:", v28);

    if ((v4 & 1) != 0)
    {
      uint64_t v11 = -[NANDTelemetry_NandGBBSweepDaily getDefects:](self, "getDefects:", &v39);
      if (!v11 || v39 <= 3)
      {
        if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
          sub_100042CF0();
        }
        goto LABEL_42;
      }

      -[NANDTelemetry_NandGBBSweepDaily setCurrBlock:](self, "setCurrBlock:", 0LL);
      -[NANDTelemetry_NandGBBSweepDaily setSweepInfo:](self, "setSweepInfo:", v11);
      unsigned int v29 = dword_1000C4310;
      unsigned int v30 = *(_DWORD *)-[NANDTelemetry_NandGBBSweepDaily sweepInfo](self, "sweepInfo");
      if (v29 < v30) {
        unsigned int v30 = v29;
      }
      dword_1000C4310 = v30;
    }

    else
    {
      -[NANDTelemetry_NandGBBSweepDaily setCurrBlock:]( self,  "setCurrBlock:",  -[NANDTelemetry_NandGBBSweepDaily currBlock](self, "currBlock") + 1);
      unsigned int v30 = dword_1000C4310;
    }

    char v4 = 0;
    int v15 = v23;
    id v16 = v18;
    if (!v30) {
      goto LABEL_42;
    }
  }

  v34 = (void *)oslog;
  uint64_t v7 = v35;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR)) {
    sub_100042BA4(v34, self);
  }
LABEL_42:
  id v32 = (os_log_s *)oslog;
  if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v40 = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "GBB Activity Exit.", v40, 2u);
  }

  if ((byte_1000C42D0 & 1) == 0 && (byte_1000C42D8 & 1) == 0) {
    -[NANDTelemetry_NandGBBSweepDaily _cleanItemAt:]( self,  "_cleanItemAt:",  @"/private/var/db/NANDTelemetryServices/GBBCollection");
  }
  if (-[NANDTelemetry_NandGBBSweepDaily ctl](self, "ctl"))
  {
    -[NANDTelemetry_NandGBBSweepDaily ctl](self, "ctl");
    Free_NVMeCTL();
    -[NANDTelemetry_NandGBBSweepDaily setCtl:](self, "setCtl:", 0LL);
  }

  if (v11) {
    free(v11);
  }
  if (-[NANDTelemetry_NandGBBSweepDaily sweepBuf](self, "sweepBuf"))
  {
    free(-[NANDTelemetry_NandGBBSweepDaily sweepBuf](self, "sweepBuf"));
    -[NANDTelemetry_NandGBBSweepDaily setSweepBuf:](self, "setSweepBuf:", 0LL);
  }
}

- (int)uploadFile:(id)a3 description:(id)a4
{
  if ((byte_1000C42D8 & 1) != 0) {
    return 1;
  }
  ASPCarryLog_UploadFileToDP( a3,  @"com.apple.nand.autoGBBCollection",  @"AutomaticGBBSweep",  a4,  0LL,  @"tar");
  return 0;
}

- (void)getDefects:(unint64_t *)a3
{
  if (-[NANDTelemetry_NandGBBSweepDaily wasSigtermReceived](self, "wasSigtermReceived")) {
    return 0LL;
  }
  else {
    return sub_100037AEC(269, a3);
  }
}

- (void)markGBBAsSwept
{
  id v3 = (char *)valloc(0x50uLL);
  unsigned __int8 v4 = -[NANDTelemetry_NandGBBSweepDaily wasSigtermReceived](self, "wasSigtermReceived");
  if (!v3 || (v4 & 1) != 0)
  {
    if (!v3) {
      return;
    }
  }

  else
  {
    *(_OWORD *)(v3 + 8) = xmmword_1000C42DC;
    *((_DWORD *)v3 + 6) = dword_1000C42EC;
    Send_ASF_Tunnel((uint64_t)-[NANDTelemetry_NandGBBSweepDaily ctl](self, "ctl"), 270LL, (uint64_t)v3, 0LL, 0LL);
  }

  free(v3);
}

+ (void)setGBBXpcCritiria:(id)a3
{
  xpc_object_t xdict = a3;
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REPEATING, 1);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
  xpc_dictionary_set_string(xdict, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_HOUR);
  xpc_dictionary_set_int64(xdict, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_1_HOUR);
}

+ (BOOL)shouldRegisterActivity
{
  int has_internal_content = os_variant_has_internal_content("com.apple.ASPCarryLog", a2);
  if (has_internal_content)
  {
    if ((os_variant_has_factory_content("com.apple.ASPCarryLog", v3) & 1) != 0) {
      LOBYTE(has_internal_content) = 0;
    }
    else {
      LOBYTE(has_internal_content) = os_variant_is_darwinos("com.apple.ASPCarryLog") ^ 1;
    }
  }

  return has_internal_content;
}

- (NSString)blockPath
{
  return self->_blockPath;
}

- (void)setBlockPath:(id)a3
{
}

- (NSString)compressedPath
{
  return self->_compressedPath;
}

- (void)setCompressedPath:(id)a3
{
}

- (void)ctl
{
  return self->_ctl;
}

- (void)setCtl:(void *)a3
{
  self->_ctl = a3;
}

- (void)sweepBuf
{
  return self->_sweepBuf;
}

- (void)setSweepBuf:(void *)a3
{
  self->_sweepBuf = a3;
}

- ($426A05A3E2C7351E65A2A915B10A9485)sweepInfo
{
  return self->_sweepInfo;
}

- (void)setSweepInfo:(id *)a3
{
  self->_sweepInfo = a3;
}

- (unint64_t)sweepBufSize
{
  return self->_sweepBufSize;
}

- (void)setSweepBufSize:(unint64_t)a3
{
  self->_sweepBufSize = a3;
}

- (int)sweepError
{
  return self->_sweepError;
}

- (void)setSweepError:(int)a3
{
  self->_sweepError = a3;
}

- (unsigned)currBlock
{
  return self->_currBlock;
}

- (void)setCurrBlock:(unsigned int)a3
{
  self->_currBlock = a3;
}

- (BOOL)wasSigtermReceived
{
  return self->_wasSigtermReceived;
}

- (void)setWasSigtermReceived:(BOOL)a3
{
  self->_wasSigtermReceived = a3;
}

- (void).cxx_destruct
{
}

@end