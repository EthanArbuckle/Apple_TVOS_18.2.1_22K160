@interface AppleTypeCRetimerIIC
- (AppleTypeCRetimerIICDelegate)delegate;
- (BOOL)startPacketDumperWithFileName:(id)a3;
- (BOOL)transferFirmware:(const char *)a3 length:(unsigned int)a4;
- (id)sendCommand:(id)a3;
- (unsigned)sfwfBlockCount:(const char *)a3 length:(unsigned int)a4;
- (unsigned)sleepTimeForCommandResultPollIteration:(unsigned int)a3;
- (void)performReset;
- (void)setDelegate:(id)a3;
@end

@implementation AppleTypeCRetimerIIC

- (unsigned)sleepTimeForCommandResultPollIteration:(unsigned int)a3
{
  if (a3 >= 0x69) {
    int v3 = 1000000;
  }
  else {
    int v3 = 250000;
  }
  if (a3 >= 0x63) {
    int v4 = v3;
  }
  else {
    int v4 = 100000;
  }
  if (a3 >= 0x5F) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = 2000;
  }
  if (a3 >= 0x32) {
    return v5;
  }
  else {
    return 200;
  }
}

- (id)sendCommand:(id)a3
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 inputData];
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    if (-[AppleTypeCRetimerIICBase writeRegister:buffer:length:]( self,  "writeRegister:buffer:length:",  9,  [v7 bytes],  objc_msgSend(v7, "length")))
    {
      -[AppleTypeCRetimerIICBase log](self, "log");
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[AppleTypeCRetimerIIC sendCommand:].cold.7(v4);
      }
LABEL_8:

LABEL_9:
      v9 = 0LL;
      goto LABEL_10;
    }
  }

  unsigned int v25 = bswap32([v4 code]);
  if (-[AppleTypeCRetimerIICBase writeRegister:buffer:length:](self, "writeRegister:buffer:length:", 8LL, &v25, 4LL))
  {
    -[AppleTypeCRetimerIICBase log](self, "log");
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[AppleTypeCRetimerIIC sendCommand:].cold.6(v4);
    }
    goto LABEL_8;
  }

  -[AppleTypeCPacketDumper dumpCommand:](self->_dumper, "dumpCommand:", v4);
  int v24 = 0;
  int v11 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 8LL, &v24, 4LL);
  if (v11)
  {
    int v12 = v11;
    LODWORD(v13) = 0;
LABEL_14:
    -[AppleTypeCRetimerIICBase log](self, "log");
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [v4 codeString];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v27 = "-[AppleTypeCRetimerIIC sendCommand:]";
      __int16 v28 = 2112;
      v29 = v14;
      __int16 v30 = 1024;
      int v31 = v13;
      __int16 v32 = 1024;
      int v33 = v12;
      _os_log_error_impl( &dword_189540000,  v8,  OS_LOG_TYPE_ERROR,  "%s: Command response read for %@ failed on iteration %u (0x%08x)",  buf,  0x22u);
    }

    goto LABEL_8;
  }

  unsigned int v15 = 0;
  uint64_t v13 = 0LL;
  while (v24)
  {
    if (v24 == 1145914145)
    {
      -[AppleTypeCRetimerIICBase log](self, "log");
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[AppleTypeCRetimerIIC sendCommand:].cold.5(v4);
      }
      goto LABEL_8;
    }

    if (v24 != v25)
    {
      -[AppleTypeCRetimerIICBase log](self, "log");
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[AppleTypeCRetimerIIC sendCommand:].cold.2();
      }
      goto LABEL_8;
    }

    useconds_t v16 = -[AppleTypeCRetimerIIC sleepTimeForCommandResultPollIteration:]( self,  "sleepTimeForCommandResultPollIteration:",  v13);
    usleep(v16);
    v15 += v16;
    if (v15 >= 0x989681)
    {
      -[AppleTypeCRetimerIICBase log](self, "log");
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[AppleTypeCRetimerIIC sendCommand:].cold.1(v4);
      }
      goto LABEL_8;
    }

    uint64_t v13 = (v13 + 1);
    int v24 = 0;
    int v17 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 8LL, &v24, 4LL);
    if (v17)
    {
      int v12 = v17;
      goto LABEL_14;
    }
  }

  if ([v4 code] != 1397118825)
  {
    if ([v4 code] == 1397118820)
    {
      *(_DWORD *)buf = 0;
      int v18 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:](self, "readRegister:buffer:length:", 9LL, buf, 4LL);
      if (v18) {
        goto LABEL_43;
      }
      v22 = &OBJC_CLASS___ATCRTResponseSFWd;
    }

    else
    {
      if ([v4 code] != 1397118822)
      {
        if ([v4 code] != 1397118835)
        {
          if ([v4 code] == 1195460932
            || [v4 code] == 1197566308)
          {
            goto LABEL_9;
          }

          -[AppleTypeCRetimerIICBase log](self, "log");
          v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            -[AppleTypeCRetimerIIC sendCommand:].cold.4(v4);
          }
          goto LABEL_8;
        }

        int v18 = -[AppleTypeCRetimerIICBase readRegister:buffer:length:]( self,  "readRegister:buffer:length:",  9LL,  buf,  1LL);
        if (!v18)
        {
          v19 = &OBJC_CLASS___ATCRTResponseSFWs;
          goto LABEL_26;
        }

- (unsigned)sfwfBlockCount:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  unsigned int v4 = a4 - 64;
  if (a4 >= 0x40)
  {
    id v7 = a3;
    int v5 = 0;
    int8x16_t v8 = vld1q_dup_s8(a3);
    v10[0] = v8;
    v10[1] = v8;
    v10[2] = v8;
    v10[3] = v8;
    do
    {
      if (memcmp(v7, v10, 0x40uLL)) {
        break;
      }
      ++v5;
      BOOL v9 = v4 >= 0x40;
      v4 -= 64;
      if (!v9) {
        break;
      }
      v7 += 64;
    }

    while (v5 != 255);
  }

  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)transferFirmware:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v34 = *MEMORY[0x1895F89C0];
  memset(v33, 0, sizeof(v33));
  -[AppleTypeCRetimerIICBase writeRegister:buffer:length:](self, "writeRegister:buffer:length:", 9LL, v33, 64LL);
  +[ATCRTCommandSFWi command](&OBJC_CLASS___ATCRTCommandSFWi, "command");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATCRTCommandSFWi command](&OBJC_CLASS___ATCRTCommandSFWi, "command");
  int8x16_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppleTypeCRetimerIIC sendCommand:](self, "sendCommand:", v8);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();

  __int16 v30 = v9;
  if ([v9 success])
  {
    v29 = v7;
    unsigned int v31 = (v4 + 63) & 0xFFFFFFC0;
    if (!v31)
    {
LABEL_17:
      +[ATCRTCommandSFWs command](&OBJC_CLASS___ATCRTCommandSFWs, "command");
      uint64_t v13 = (ATCRTCommandSFWf *)objc_claimAutoreleasedReturnValue();
      v23 = -[AppleTypeCRetimerIIC sendCommand:](self, "sendCommand:", v13);
      char v24 = [v23 success];
      id v7 = v29;
      if ((v24 & 1) == 0)
      {
        -[AppleTypeCRetimerIICBase log](self, "log");
        unsigned int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[AppleTypeCRetimerIIC transferFirmware:length:].cold.1();
        }
      }

      goto LABEL_24;
    }

    int v10 = 0;
    while (1)
    {
      uint64_t v11 = -[AppleTypeCRetimerIIC sfwfBlockCount:length:](self, "sfwfBlockCount:length:", a3, v4);
      if ((_DWORD)v11)
      {
        int v12 = v11;
        uint64_t v13 = -[ATCRTCommandSFWf initWithBlockCount:value:]( objc_alloc(&OBJC_CLASS___ATCRTCommandSFWf),  "initWithBlockCount:value:",  v11,  *(unsigned __int8 *)a3);
        -[AppleTypeCRetimerIIC sendCommand:](self, "sendCommand:", v13);
        v14 = (ATCRTCommandSFWd *)objc_claimAutoreleasedReturnValue();
        if ((-[ATCRTCommandSFWd success](v14, "success") & 1) == 0)
        {
          -[AppleTypeCRetimerIICBase log](self, "log");
          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[AppleTypeCRetimerIIC transferFirmware:length:].cold.1();
          }
LABEL_33:

          char v24 = 0;
          id v7 = v29;
          goto LABEL_24;
        }

        uint64_t v15 = -[ATCRTCommandSFWd bytesWritten](v14, "bytesWritten");
        int v16 = v12 << 6;
        unsigned int v17 = v12 << 6;
      }

      else
      {
        else {
          int v16 = v4;
        }
        if (v4 >= 0x40)
        {
          int v18 = (void *)MEMORY[0x189603F48];
          v19 = a3;
        }

        else
        {
          memset(v32, 0, sizeof(v32));
          __memcpy_chk();
          int v18 = (void *)MEMORY[0x189603F48];
          v19 = (const char *)v32;
        }

        [v18 dataWithBytes:v19 length:64];
        uint64_t v13 = (ATCRTCommandSFWf *)objc_claimAutoreleasedReturnValue();
        v14 = -[ATCRTCommandSFWd initWithWriteData:]( objc_alloc(&OBJC_CLASS___ATCRTCommandSFWd),  "initWithWriteData:",  v13);
        -[AppleTypeCRetimerIIC sendCommand:](self, "sendCommand:", v14);
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if ((-[os_log_s success](v20, "success") & 1) == 0)
        {
          -[AppleTypeCRetimerIICBase log](self, "log");
          __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            -[AppleTypeCRetimerIIC transferFirmware:length:].cold.1();
          }

          goto LABEL_33;
        }

        uint64_t v15 = -[os_log_s bytesWritten](v20, "bytesWritten");

        unsigned int v17 = 64;
      }

      int v21 = v17 + v10;
      if (v17 + v10 != (_DWORD)v15) {
        break;
      }
      uint64_t v4 = (v4 - v16);
      a3 += v17;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained bytesSent:v15 bytesTotal:v31];

      int v10 = v15;
      if ((_DWORD)v15 == v31) {
        goto LABEL_17;
      }
    }

    -[AppleTypeCRetimerIICBase log](self, "log");
    uint64_t v13 = (ATCRTCommandSFWf *)objc_claimAutoreleasedReturnValue();
    id v7 = v29;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      -[AppleTypeCRetimerIIC transferFirmware:length:].cold.2(v21, v15, (os_log_t)v13);
    }
  }

  else
  {
    -[AppleTypeCRetimerIICBase log](self, "log");
    uint64_t v13 = (ATCRTCommandSFWf *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      v26 = v30;
      -[AppleTypeCRetimerIIC transferFirmware:length:].cold.1();
      char v24 = 0;
      goto LABEL_25;
    }
  }

  char v24 = 0;
LABEL_24:
  v26 = v30;
LABEL_25:

  return v24;
}

- (void)performReset
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = -[AppleTypeCRetimerIIC sendCommand:](self, "sendCommand:", v4);
}

- (BOOL)startPacketDumperWithFileName:(id)a3
{
  if (self->_dumper) {
    return 0;
  }
  id v5 = a3;
  v6 = -[AppleTypeCPacketDumper initWithFileName:]( objc_alloc(&OBJC_CLASS___AppleTypeCPacketDumper),  "initWithFileName:",  v5);

  dumper = self->_dumper;
  self->_dumper = v6;

  return self->_dumper != 0LL;
}

- (AppleTypeCRetimerIICDelegate)delegate
{
  return (AppleTypeCRetimerIICDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

- (void)sendCommand:(void *)a1 .cold.1(void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_1(&dword_189540000, v2, v3, "%s: Task %@ timed out", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_9_0();
}

- (void)sendCommand:.cold.2()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  stringForFourCharCode(*v0);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_189540000, v3, v4, "%s: Task %@, unexpected command response %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)sendCommand:(void *)a1 .cold.3(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5_1(&dword_189540000, v2, v3, "%s: Failed to read output for %@ (0x%08x)", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)sendCommand:(void *)a1 .cold.4(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_1(&dword_189540000, v2, v3, "%s: Parsing command output not supported for %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_9_0();
}

- (void)sendCommand:(void *)a1 .cold.5(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_1(&dword_189540000, v2, v3, "%s: Task %@ unrecognized", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_9_0();
}

- (void)sendCommand:(void *)a1 .cold.6(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5_1(&dword_189540000, v2, v3, "%s: Code write for %@ failed (0x%08x).", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)sendCommand:(void *)a1 .cold.7(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_5_1(&dword_189540000, v2, v3, "%s: Data write for %@ failed (0x%08x).", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)transferFirmware:length:.cold.1()
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_1(&dword_189540000, v2, v3, "%s: %@ Command failed\n%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0_1();
}

- (void)transferFirmware:(os_log_t)log length:.cold.2(int a1, int a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v3 = 136315650;
  uint64_t v4 = "-[AppleTypeCRetimerIIC transferFirmware:length:]";
  __int16 v5 = 1024;
  int v6 = a1;
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl( &dword_189540000,  log,  OS_LOG_TYPE_ERROR,  "%s: Local transfer count did not match chip transfer count (local=%u, chip=%u)",  (uint8_t *)&v3,  0x18u);
}

@end