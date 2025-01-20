}

  ;
}

Class initSFService()
{
  if (SharingLibrary_sOnce != -1) {
    dispatch_once(&SharingLibrary_sOnce, &__block_literal_global);
  }
  Class result = objc_getClass("SFService");
  classSFService = (uint64_t)result;
  getSFServiceClass[0] = (uint64_t (*)())SFServiceFunction;
  return result;
}

id SFServiceFunction()
{
  return (id)classSFService;
}

void *__SharingLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
  SharingLibrary_sLib = (uint64_t)result;
  return result;
}

LABEL_10:
}
}
}
}
}
}

void sub_187370184( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_1873705A8(_Unwind_Exception *a1)
{
}

nw_protocol_definition_t nwrapport_copy_protocol_definition()
{
  nw_protocol_definition_t definition = nw_framer_create_definition("rapport-client-peer", 0, &__block_literal_global_44);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_18736A000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO, "registering rapport peer protocol", v2, 2u);
  }

  return definition;
}

uint64_t __nwrapport_copy_protocol_definition_block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x2020000000LL;
  char v14 = 0;
  v12[0] = 0LL;
  v12[1] = v12;
  v12[2] = 0x3010000000LL;
  v12[4] = 0LL;
  v12[5] = 0LL;
  v12[3] = "";
  nw_framer_message_t v3 = nw_framer_message_create(v2);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __nwrapport_copy_protocol_definition_block_invoke_2;
  v7[3] = &unk_18A031EB8;
  v10 = v13;
  uint64_t v11 = v12;
  v4 = v2;
  v8 = v4;
  v5 = v3;
  v9 = v5;
  nw_framer_set_input_handler(v4, v7);
  nw_framer_set_output_handler(v4, &__block_literal_global_50);
  nw_framer_set_stop_handler(v4, &__block_literal_global_53);
  nw_framer_set_cleanup_handler(v4, &__block_literal_global_55);

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v13, 8);

  return 2LL;
}

void sub_187370A40( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __nwrapport_copy_protocol_definition_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  nw_framer_message_t v3 = a2;
  uint64_t v4 = a1 + 56;
  uint64_t v5 = *(void *)(a1 + 48);
  BOOL v6 = *(_BYTE *)(*(void *)(v5 + 8) + 24LL) == 0;
  uint64_t v7 = MEMORY[0x1895F87A8];
  uint64_t v8 = 16LL;
  uint64_t v9 = (os_log_s *)MEMORY[0x1895F8DA0];
  unint64_t v10 = 0x18C4BF000uLL;
  do
  {
    if (!v6) {
      break;
    }
    parse[0] = v7;
    parse[1] = 3221225472LL;
    parse[2] = __nwrapport_copy_protocol_definition_block_invoke_3;
    parse[3] = &unk_18A031E90;
    parse[5] = v5;
    parse[6] = 16LL;
    parse[4] = *(void *)v4;
    if (!nw_framer_parse_input(v3, 0x10uLL, 0x10uLL, 0LL, parse)) {
      goto LABEL_31;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = [(id)(v10 + 2984) controlCodeToString:*(unsigned __int8 *)(*(void *)(*(void *)v4 + 8) + 32)];
      int v12 = *(unsigned __int8 *)(*(void *)(*(void *)v4 + 8LL) + 33LL);
      v13 = strerror(v12);
      uint64_t v14 = *(void *)(*(void *)(*(void *)v4 + 8LL) + 40LL);
      *(_DWORD *)buf = 136315906;
      uint64_t v38 = v11;
      unint64_t v10 = 0x18C4BF000LL;
      __int16 v39 = 1024;
      int v40 = v12;
      __int16 v41 = 2080;
      v42 = v13;
      __int16 v43 = 2048;
      uint64_t v44 = v14;
      _os_log_debug_impl( &dword_18736A000,  v9,  OS_LOG_TYPE_DEBUG,  "Client RX framer msg header={%s error: %d (%s), length: %zu}",  buf,  0x26u);
    }

    uint64_t v5 = *(void *)(a1 + 48);
    BOOL v6 = 1;
  }

  while (!*(_BYTE *)(*(void *)(v5 + 8) + 24LL));
  v15 = (void *)nw_framer_connection_state_copy_object_value();
  BOOL v16 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
  if (v15)
  {
    if (v16) {
      __nwrapport_copy_protocol_definition_block_invoke_2_cold_6(a1 + 56);
    }
    uint64_t v17 = *(void *)(*(void *)v4 + 8LL);
    if (!*(_BYTE *)(v17 + 32) && *(void *)(v17 + 40))
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
        __nwrapport_copy_protocol_definition_block_invoke_2_cold_5(a1 + 56, v27, v28, v29, v30, v31, v32, v33);
      }
      nw_framer_deliver_input_no_copy( v3,  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL),  *(nw_framer_message_t *)(a1 + 40),  0);
      goto LABEL_30;
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
      __nwrapport_copy_protocol_definition_block_invoke_2_cold_4(a1 + 56, v18, v19, v20, v21, v22, v23, v24);
    }
    v25 = *(nw_framer **)(a1 + 32);
    int v26 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 33LL);
  }

  else
  {
    if (v16) {
      __nwrapport_copy_protocol_definition_block_invoke_2_cold_3();
    }
    if (*(_DWORD *)(*(void *)(*(void *)v4 + 8LL) + 36LL) == 320017171)
    {
      if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
        __nwrapport_copy_protocol_definition_block_invoke_2_cold_1();
      }
      nw_framer_connection_state_set_object_value();
      nw_framer_mark_ready(*(nw_framer_t *)(a1 + 32));
      goto LABEL_30;
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
      __nwrapport_copy_protocol_definition_block_invoke_2_cold_2();
    }
    uint64_t v34 = *(void *)(*(void *)v4 + 8LL);
    int v26 = *(unsigned __int8 *)(v34 + 33);
    if (!*(_BYTE *)(v34 + 33))
    {
      *(_BYTE *)(v34 + 33) = 53;
      int v26 = *(unsigned __int8 *)(*(void *)(*(void *)v4 + 8LL) + 33LL);
    }

    v25 = *(nw_framer **)(a1 + 32);
  }

  nw_framer_mark_failed_with_error(v25, v26);
LABEL_30:
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;

  uint64_t v8 = 0LL;
LABEL_31:

  return v8;
}

uint64_t __nwrapport_copy_protocol_definition_block_invoke_3(void *a1, _OWORD *a2, unint64_t a3)
{
  if (!a2 || a1[6] > a3) {
    return 0LL;
  }
  *(_OWORD *)(*(void *)(a1[4] + 8LL) + 32LL) = *a2;
  uint64_t v4 = a1[5];
  uint64_t result = a1[6];
  *(_BYTE *)(*(void *)(v4 + 8) + 24LL) = 1;
  return result;
}

void __nwrapport_copy_protocol_definition_block_invoke_49(uint64_t a1, void *a2, uint64_t a3, size_t a4)
{
  uint64_t v5 = a2;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    __nwrapport_copy_protocol_definition_block_invoke_49_cold_1(a4, v6, v7, v8, v9, v10, v11, v12);
  }
  v13[0] = 0LL;
  v13[1] = a4;
  nw_framer_write_output(v5, (const uint8_t *)v13, 0x10uLL);
  nw_framer_write_output_no_copy(v5, a4);
}

uint64_t __nwrapport_copy_protocol_definition_block_invoke_51(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
    __nwrapport_copy_protocol_definition_block_invoke_51_cold_1((uint64_t)v2);
  }
  +[RPNWFramer writeControlOnFramer:type:error:]( &OBJC_CLASS___RPNWFramer,  "writeControlOnFramer:type:error:",  v2,  3LL,  0LL);

  return 1LL;
}

void __nwrapport_copy_protocol_definition_block_invoke_54(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_INFO))
  {
    int v3 = 138412290;
    uint64_t v4 = a2;
    _os_log_impl( &dword_18736A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_INFO,  "Cleanup handler called for framer=%@",  (uint8_t *)&v3,  0xCu);
  }

void OUTLINED_FUNCTION_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_2( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

unint64_t *RPBonjourFlagsUpdateWithRPCompanionLinkFlags(unint64_t *result, unsigned int a2)
{
  *uint64_t result = *result & 0xFFFFFFFFFFFFF803LL | (a2 >> 1) & 4 | (2 * a2) & 0x68 | (16 * ((a2 >> 1) & 1)) | (a2 >> 1) & 0x80 | (a2 >> 2) & 0x700;
  return result;
}

uint64_t RPCompanionLinkFlagsToShortString(__int16 a1, uint64_t a2)
{
  int8x16_t v2 = (int8x16_t)vdupq_n_s32(a1);
  int16x8_t v3 = (int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v2, (int8x16_t)xmmword_1873E6240));
  *(int8x8_t *)v3.i8 = vbsl_s8( (int8x8_t)vmovn_s32((int32x4_t)v3),  (int8x8_t)0x68007000730075LL,  (int8x8_t)0x48005000530055LL);
  *(_DWORD *)a2 = vmovn_s16(v3).u32[0];
  if ((a1 & 0x10) != 0) {
    char v4 = 65;
  }
  else {
    char v4 = 97;
  }
  *(_BYTE *)(a2 + 4) = v4;
  *(_BYTE *)(a2 + 5) = a1 & 0x20 ^ 0x77;
  int16x8_t v5 = (int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v2, (int8x16_t)xmmword_1873E6250));
  *(int8x8_t *)v5.i8 = vbsl_s8( (int8x8_t)vmovn_s32((int32x4_t)v5),  (int8x8_t)0x750063006D006CLL,  (int8x8_t)0x550043004D004CLL);
  *(_DWORD *)(a2 + 6) = vmovn_s16(v5).u32[0];
  if ((a1 & 0x400) != 0) {
    char v6 = 72;
  }
  else {
    char v6 = 104;
  }
  *(_BYTE *)(a2 + 10) = v6;
  if ((a1 & 0x800) != 0) {
    char v7 = 83;
  }
  else {
    char v7 = 115;
  }
  *(_BYTE *)(a2 + 11) = v7;
  if ((a1 & 0x1000) != 0) {
    char v8 = 84;
  }
  else {
    char v8 = 116;
  }
  *(_BYTE *)(a2 + 12) = v8;
  *(_BYTE *)(a2 + 13) = 0;
  return a2;
}

unsigned int *RPCompanionLinkFlagsWithUpdateBonjourFlags(unsigned int *result, unsigned int a2)
{
  *uint64_t result = (a2 >> 1) & 0x34 | (a2 >> 3) & 2 | (((a2 >> 7) & 1) << 8) & 0xFFFFE3FF | (((a2 >> 8) & 7) << 10) | *result & 0xFFFFE2C1 | (8 * ((a2 >> 2) & 1));
  return result;
}

CFStringRef RPDeviceClassToString(int a1)
{
  uint64_t result = @"Unknown";
  switch(a1)
  {
    case 1:
      uint64_t result = @"iPhone";
      break;
    case 2:
      uint64_t result = @"iPod";
      break;
    case 3:
      uint64_t result = @"iPad";
      break;
    case 4:
      uint64_t result = @"AppleTV";
      break;
    case 5:
      uint64_t result = @"FPGA";
      break;
    case 6:
      uint64_t result = @"Watch";
      break;
    case 7:
      uint64_t result = @"AudioAccessory";
      break;
    case 8:
    case 9:
    case 10:
      return result;
    case 11:
      uint64_t result = @"RealityDevice";
      break;
    default:
      if (a1 == 100) {
        uint64_t result = @"Mac";
      }
      break;
  }

  return result;
}

void RPEncodeNSError(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    uint64_t v5 = *MEMORY[0x189607670];
    int v6 = 3;
    id v17 = v4;
    while (1)
    {
      char v7 = (void *)MEMORY[0x189607968];
      uint64_t v8 = [v3 code];
      if (v8) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = -6700LL;
      }
      [v7 numberWithInteger:v9];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 setObject:v10 forKeyedSubscript:@"_ec"];

      [v3 domain];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = v11;
      if (v11 && ([v11 isEqual:v5] & 1) == 0) {
        [v17 setObject:v12 forKeyedSubscript:@"_ed"];
      }
      [v3 userInfo];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v14 length]) {
        [v17 setObject:v14 forKeyedSubscript:@"_em"];
      }
      if (!v6) {
        break;
      }
      CFErrorGetTypeID();
      uint64_t v15 = CFDictionaryGetTypedValue();

      if (!v15)
      {
        id v3 = 0LL;
        break;
      }

      id v16 = objc_alloc_init(MEMORY[0x189603FC8]);
      [v17 setObject:v16 forKeyedSubscript:@"_eu"];

      --v6;
      id v17 = v16;
      id v3 = (id)v15;
    }

    id v4 = v17;
  }
}

id RPDecodeNSError(void *a1)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  CFDictionaryGetInt64Ranged();
  if (v24)
  {
    int8x16_t v2 = 0LL;
    goto LABEL_27;
  }

  id v32 = 0LL;
  id v33 = 0LL;
  id v22 = v1;
  id v31 = v1;
  if (v31)
  {
    CFDictionaryGetTypeID();
    id v32 = (id)CFDictionaryGetTypedValue();
    if (v32)
    {
      CFDictionaryGetTypeID();
      id TypedValue = (id)CFDictionaryGetTypedValue();
      id v33 = TypedValue;
      if (TypedValue)
      {
        CFDictionaryGetTypeID();
        id TypedValue = (id)CFDictionaryGetTypedValue();
      }

      goto LABEL_9;
    }
  }

  else
  {
    id v32 = 0LL;
  }

  id TypedValue = 0LL;
  id v33 = 0LL;
LABEL_9:
  int8x16_t v2 = 0LL;
  id v34 = TypedValue;
  id v4 = (void *)*MEMORY[0x189607670];
  uint64_t v5 = 24LL;
  uint64_t v23 = *MEMORY[0x189607798];
  do
  {
    id v6 = *(id *)((char *)&v31 + v5);
    if (v6)
    {
      int Int64Ranged = CFDictionaryGetInt64Ranged();
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      id v10 = objc_alloc(MEMORY[0x189607870]);
      if (v8) {
        uint64_t v11 = v8;
      }
      else {
        uint64_t v11 = v4;
      }
      uint64_t v12 = objc_msgSend(v9, "length", v22);
      if (v2)
      {
        if (v12)
        {
          v29[0] = v23;
          v29[1] = @"cuErrorMsg";
          v30[0] = v2;
          v30[1] = v9;
          v13 = (void *)MEMORY[0x189603F68];
          uint64_t v14 = (void **)v30;
          uint64_t v15 = v29;
          uint64_t v16 = 2LL;
        }

        else
        {
          uint64_t v27 = v23;
          uint64_t v28 = v2;
          v13 = (void *)MEMORY[0x189603F68];
          uint64_t v14 = &v28;
          uint64_t v15 = &v27;
          uint64_t v16 = 1LL;
        }

        [v13 dictionaryWithObjects:v14 forKeys:v15 count:v16];
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = [v10 initWithDomain:v11 code:Int64Ranged userInfo:v18];

        int8x16_t v2 = (void *)v19;
      }

      else if (v12)
      {
        v25 = @"cuErrorMsg";
        int v26 = v9;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        int8x16_t v2 = (void *)[v10 initWithDomain:v11 code:Int64Ranged userInfo:v17];
      }

      else
      {
        int8x16_t v2 = (void *)[v10 initWithDomain:v11 code:Int64Ranged userInfo:0];
      }
    }

    v5 -= 8LL;
  }

  while (v5 != -8);
  for (uint64_t i = 24LL; i != -8; i -= 8LL)

  id v1 = v22;
LABEL_27:

  return v2;
}

id RPErrorF()
{
  return (id)objc_claimAutoreleasedReturnValue();
}

id RPNestedErrorF()
{
  return (id)objc_claimAutoreleasedReturnValue();
}

id RPVersionToSourceVersionString()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  char v1 = 0;
  SourceVersionToCString();
  return 0LL;
}

id RPModelOSVersionToSourceVersionString()
{
  if ((DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLaterEx() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || DeviceOSVersionAtOrLater()
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || (DeviceOSVersionAtOrLater() & 1) != 0
    || NADyFF4UGjtVGBmEW6h()
    || (TN6sBSnEP2() & 1) != 0
    || wInTP56r94EFs9NAAi())
  {
    RPVersionToSourceVersionString();
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v0 = 0LL;
  }

  return v0;
}

id RPNSOperatingSystemVersionToString(uint64_t *a1)
{
  if (*a1 < 1) {
    return 0LL;
  }
  NSAppendPrintF();
  return 0LL;
}

id RPProcessIDToNameString(uint64_t a1)
{
  id v1 = 0LL;
  uint64_t v2 = objc_msgSend(v1, "rangeOfString:", @":", a1);
  id v3 = 0LL;
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v1, "substringWithRange:", 0, v2);
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = v1;
  }
  id v5 = v4;

  return v5;
}

void RPStringToOperatingSystemVersion(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = 0LL;
  a2[1] = 0LL;
  a2[2] = 0LL;
  [a1 componentsSeparatedByString:@"."];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v8 count];
  if (v3)
  {
    unint64_t v4 = v3;
    [v8 objectAtIndexedSubscript:0];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    *a2 = [v5 integerValue];

    if (v4 != 1)
    {
      [v8 objectAtIndexedSubscript:1];
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      a2[1] = [v6 integerValue];

      if (v4 >= 3)
      {
        [v8 objectAtIndexedSubscript:2];
        char v7 = (void *)objc_claimAutoreleasedReturnValue();
        a2[2] = [v7 integerValue];
      }
    }
  }
}

BOOL RPDeviceIsCommunal(int a1)
{
  return a1 == 4 || a1 == 7;
}

BOOL shouldPrintSensitiveData()
{
  return (shouldPrintSensitiveData_sensitive & 1) == 0;
}

uint64_t __shouldPrintSensitiveData_block_invoke()
{
  uint64_t result = CFPrefs_GetInt64();
  if (result) {
    shouldPrintSensitiveData_sensitive = 0;
  }
  return result;
}

uint64_t formatSensitiveData(uint64_t a1, int a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v4 = v3;
  if (a2) {
    id v5 = @"'%@'";
  }
  else {
    id v5 = @"'%~@'";
  }
  [v3 appendString:v5];
  id v6 = v4;
  uint64_t v7 = [v6 UTF8String];

  return v7;
}

LABEL_37:
  uint64_t v16 = *(void *)(a1 + 40);
  if (v16) {
    (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v5);
  }
}

  if (!self->_contactID)
  {
    [v7 contactIdentifier];
    id v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_storeStrong((id *)&self->_contactID, v34);
      v9 |= 2u;
    }
  }

  uint64_t v35 = objc_msgSend(v7, "deviceActionType", v68);
  if (v35 != self->_deviceActionType)
  {
    self->_deviceActionType = v35;
    v9 |= 2u;
  }

  flags = self->_flags;
  v37 = [v7 deviceFlags];
  uint64_t v38 = (2 * (v37 & 1)) | (v37 >> 3) & 1;
  if ((v37 & 0x10) != 0) {
    __int16 v39 = 36;
  }
  else {
    __int16 v39 = 4;
  }
  if ((v37 & 0x10) != 0) {
    int v40 = 1536;
  }
  else {
    int v40 = 512;
  }
  if ((v37 & 0x10) != 0) {
    __int16 v41 = 192;
  }
  else {
    __int16 v41 = 64;
  }
  if ((v37 & 0x10) != 0) {
    v42 = 24576;
  }
  else {
    v42 = 0x2000;
  }
  if ((v37 & 0x10) != 0) {
    __int16 v43 = 98304;
  }
  else {
    __int16 v43 = 0x8000;
  }
  if ((v37 & 2) != 0) {
    v38 |= v37 & 0x10 | 8;
  }
  uint64_t v44 = v38 | v39 & ((int)(v37 << 29) >> 31) | v40 & ((int)(v37 << 21) >> 31) | v41 & ((int)(v37 << 25) >> 31);
  uint64_t v45 = (16 * v37) & 0x800 | (((v37 >> 5) & 1) << 8) | v42 & ((int)(v37 << 17) >> 31) | v43 & ((__int16)v37 >> 15) | v44;
  if ((v44 & 0x24D) == 0) {
    v45 |= 0x1000u;
  }
  if (v45 != flags)
  {
    self->_flags = v45;
    v9 |= 2u;
  }

  if (!self->_idsDeviceIdentifier)
  {
    [v7 idsIdentifier];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      objc_storeStrong((id *)&self->_idsDeviceIdentifier, v46);
      v9 |= 2u;
    }
  }

  v47 = [v7 idsIdentifierConflict];
  if (self->_idsDeviceIdentifierConflict != v47)
  {
    self->_idsDeviceIdentifierConflict = v47;
    v9 |= 2u;
  }

  if (CFDictionaryGetInt64()) {
    v48 = 20;
  }
  else {
    v48 = 10;
  }
  if (v48 != self->_blePairState)
  {
    self->_blePairState = v48;
    v9 |= 2u;
  }

  v49 = [v7 needsSetup];
  if (self->_needsSetup != v49)
  {
    self->_needsSetup = v49;
    v9 |= 2u;
  }

  [v7 model];
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    model = self->_model;
    v52 = v50;
    v53 = model;
    if (v52 == v53)
    {

      goto LABEL_85;
    }

    v54 = v53;
    if (v53)
    {
      v55 = -[NSString isEqual:](v52, "isEqual:", v53);

      if ((v55 & 1) != 0) {
        goto LABEL_85;
      }
    }

    else
    {
    }

    objc_storeStrong((id *)&self->_model, v50);
    v9 |= 2u;
  }

  GestaltGetDeviceClass();
  uint64_t v29 = v12;
  uint64_t v30 = 3221225472LL;
  id v31 = __38__RPConnection__clientPairVerifyStart__block_invoke;
  id v32 = &unk_18A032938;
  id v34 = pairVerifyAuthType;
  id v33 = self;
  -[CUPairingSession setSendDataHandler:](self->_pairVerifySession, "setSendDataHandler:", &v29);
  if (pairVerifyAuthType > 7 || ((1 << pairVerifyAuthType) & 0x98) == 0)
  {
LABEL_44:
    v28[0] = v12;
    v28[1] = 3221225472LL;
    v28[2] = __38__RPConnection__clientPairVerifyStart__block_invoke_2;
    v28[3] = &unk_18A032960;
    v28[4] = self;
    -[CUPairingSession setSignDataHandler:](self->_pairVerifySession, "setSignDataHandler:", v28);
    v27[0] = v12;
    v27[1] = 3221225472LL;
    v27[2] = __38__RPConnection__clientPairVerifyStart__block_invoke_3;
    v27[3] = &unk_18A032988;
    v27[4] = self;
    -[CUPairingSession setVerifySignatureHandler:](self->_pairVerifySession, "setVerifySignatureHandler:", v27);
  }

  v26[0] = v12;
  v26[1] = 3221225472LL;
  v26[2] = __38__RPConnection__clientPairVerifyStart__block_invoke_4;
  v26[3] = &unk_18A031AC0;
  v26[4] = self;
  -[CUPairingSession setCompletionHandler:](self->_pairVerifySession, "setCompletionHandler:", v26);
  id v17 = self->_ucat->var0;
  if (v17 <= 30 && (v17 != -1 || _LogCategory_Initialize()))
  {
    if (pairVerifyAuthType > 0xA) {
      uint64_t v18 = "?";
    }
    else {
      uint64_t v18 = off_18A032F60[pairVerifyAuthType];
    }
    else {
      uint64_t v19 = off_18A032F00[passwordType];
    }
    int v24 = &unk_1873E71DF;
    v25 = v19;
    id v22 = &unk_1873E6D77;
    flags = self->_flags;
    uint64_t v20 = v18;
    uint64_t v21 = (const char *)self->_controlFlags;
    LogPrintF();
  }

  -[CUPairingSession activate](self->_pairVerifySession, "activate", v20, v21, v22, flags, v24, v25);
}

      [v15 setObject:v30 forKeyedSubscript:@"accountID"];
      uint64_t v16 = v16 | 0x2000;
      goto LABEL_38;
    }

    id v33 = [v30 isEqual:v31];

    if ((v33 & 1) == 0)
    {
      if (!v15) {
        goto LABEL_33;
      }
      goto LABEL_37;
    }
  }

void sub_187375818( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_187375FAC(_Unwind_Exception *a1)
{
}

LABEL_20:
}

  uint64_t v7 = v10;
  if (v10)
  {
    RPErrorF();
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v8);

    uint64_t v7 = v10;
  }
}

void sub_187376C20(_Unwind_Exception *a1)
{
}

void sub_187376CFC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_187376EFC(_Unwind_Exception *a1)
{
}

void sub_187376FC4(_Unwind_Exception *a1)
{
}

void sub_1873770C0(_Unwind_Exception *a1)
{
}

void sub_187377320( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

LABEL_51:
  return v10 & 1;
}

  [v15 setObject:v38 forKeyedSubscript:@"contactID"];
  uint64_t v16 = v16 | 0x8000;
LABEL_52:
  [v8 dateAcknowledged];
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
  CFDateGetTypeID();
  CFDictionaryGetTypedValue();
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v44;
  v47 = v45;
  v244 = v47;
  if (v46 == v47)
  {

    goto LABEL_64;
  }

  v48 = v47;
  if ((v46 == 0LL) != (v47 != 0LL))
  {
    v49 = [v46 isEqual:v47];

    if ((v49 & 1) != 0) {
      goto LABEL_64;
    }
    if (v15) {
      goto LABEL_63;
    }
    goto LABEL_59;
  }

  if (!v15)
  {
LABEL_59:
    v50 = (void *)[v9 mutableCopy];
    v51 = v50;
    if (v50)
    {
      uint64_t v15 = v50;
    }

    else
    {
      uint64_t v15 = objc_alloc_init(MEMORY[0x189603FC8]);
    }
  }

void sub_1873777A8(_Unwind_Exception *a1)
{
}

LABEL_15:
}
}

        uint64_t v18 = v17;
        uint64_t v27 = v17;
        -[RPIdentity signData:error:](v8, "signData:error:", v7, &v27);
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        id v17 = v27;

        if (v19)
        {
          self->_pairVerifyUsedIdentity = 1;
          uint64_t v20 = self->_ucat->var0;
          id v22 = v19;
        }

        else
        {
          uint64_t v21 = self->_ucat->var0;
          if (a5) {
            *a5 = v17;
          }
        }

LABEL_33:
        goto LABEL_38;
      }
    }

    else
    {
      -[CUPairingSession setSelfAppFlags:]( self->_pairVerifySession,  "setSelfAppFlags:",  -[CUPairingSession selfAppFlags](self->_pairVerifySession, "selfAppFlags") | 1);
      if (!v8) {
        goto LABEL_11;
      }
    }
}

  int v40 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
  patchVersion = self->_operatingSystemVersion.patchVersion;
  RPNSOperatingSystemVersionToString((uint64_t *)&v40);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[IDSDevice operatingSystemVersion](v9, "operatingSystemVersion");
    if (v39[3] >= 1)
    {
      -[IDSDevice operatingSystemVersion](v9, "operatingSystemVersion");
      RPNSOperatingSystemVersionToString(v39);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      id v22 = v20;
      uint64_t v23 = v21;
      if (v22 == v23)
      {

        goto LABEL_24;
      }

      int v24 = v23;
      if ((v22 == 0LL) == (v23 != 0LL))
      {
      }

      else
      {
        v25 = [v22 isEqual:v23];

        if ((v25 & 1) != 0) {
          goto LABEL_24;
        }
      }

      -[IDSDevice operatingSystemVersion](v9, "operatingSystemVersion");
      *(_OWORD *)&self->_operatingSystemVersion.majorVersion = v40;
      self->_operatingSystemVersion.patchVersion = patchVersion;
      v12 |= 2u;
    }
  }

  id v10 = 1;
LABEL_25:

  return v10;
}

    id v8 = MEMORY[0x1895F87A8];
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __36__RPLegacyDeviceDiscovery__bleStart__block_invoke;
    v15[3] = &unk_18A033780;
    v15[4] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_bleDiscovery, "setDeviceFoundHandler:", v15);
    v14[0] = v8;
    v14[1] = 3221225472LL;
    v14[2] = __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_2;
    v14[3] = &unk_18A033780;
    v14[4] = self;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_bleDiscovery, "setDeviceLostHandler:", v14);
    v13[0] = v8;
    v13[1] = 3221225472LL;
    void v13[2] = __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_3;
    void v13[3] = &unk_18A0337A8;
    v13[4] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_bleDiscovery, "setDeviceChangedHandler:", v13);
    v12[0] = v8;
    v12[1] = 3221225472LL;
    v12[2] = __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_4;
    v12[3] = &unk_18A031A30;
    v12[4] = self;
    -[SFDeviceDiscovery setInterruptionHandler:](self->_bleDiscovery, "setInterruptionHandler:", v12);
    v11[0] = v8;
    v11[1] = 3221225472LL;
    v11[2] = __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_5;
    v11[3] = &unk_18A031A30;
    v11[4] = self;
    -[SFDeviceDiscovery setInvalidationHandler:](self->_bleDiscovery, "setInvalidationHandler:", v11);
    v10[0] = v8;
    v10[1] = 3221225472LL;
    v10[2] = __36__RPLegacyDeviceDiscovery__bleStart__block_invoke_6;
    v10[3] = &unk_18A031A30;
    v10[4] = self;
    -[SFDeviceDiscovery setTimeoutHandler:](self->_bleDiscovery, "setTimeoutHandler:", v10);
    -[SFDeviceDiscovery activateWithCompletion:]( self->_bleDiscovery,  "activateWithCompletion:",  &__block_literal_global_66);
    return 0;
  }

  if ((-[NSString isEqual:](self->_serviceType, "isEqual:", @"RPLegacyServiceTypeSystem") & 1) != 0)
  {
LABEL_17:
    id v6 = 1LL;
    goto LABEL_6;
  }

  if (gLogCategory_RPLegacySupport <= 60
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return -6762;
}
}

  if (self->_deviceActionType)
  {
    v13 = SNPrintF();
    if (v13 <= 255)
    {
      uint64_t v14 = TXTRecordSetValue(&txtRecord, "rpFl", v13, value);
      if (!v14) {
        goto LABEL_18;
      }
      goto LABEL_49;
    }

void sub_187378590( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, char a32)
{
}

LABEL_9:
}

  if (v13)
  {
    uint64_t v19 = self->_ucat->var0;
  }
}

    __int16 v43 = objc_alloc_init(MEMORY[0x189603FA8]);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v42 = v10;
    v13 = -[RPFileTransferSmallFilesTask countByEnumeratingWithState:objects:count:]( v42,  "countByEnumeratingWithState:objects:count:",  &v47,  v63,  16LL);
    if (v13)
    {
      uint64_t v14 = *(void *)v48;
      while (2)
      {
        for (uint64_t i = 0LL; i != v13; ++i)
        {
          if (*(void *)v48 != v14) {
            objc_enumerationMutation(v42);
          }
          uint64_t v16 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            int v26 = RPErrorF();
            uint64_t v27 = (void *)v58[5];
            v58[5] = v26;

            uint64_t v28 = v42;
            goto LABEL_35;
          }

          id v17 = objc_alloc_init(&OBJC_CLASS___RPFileTransferItem);
          CFDataGetTypeID();
          CFDictionaryGetTypedValue();
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18) {
            -[RPFileTransferItem setFileData:](v17, "setFileData:", v18);
          }
          CFStringGetTypeID();
          CFDictionaryGetTypedValue();
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19) {
            -[RPFileTransferItem setFilename:](v17, "setFilename:", v19);
          }
          uint64_t v20 = CFDictionaryGetInt64();
          if (!v52) {
            -[RPFileTransferItem setFileSize:](v17, "setFileSize:", v20);
          }
          CFDictionaryGetTypeID();
          CFDictionaryGetTypedValue();
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21) {
            -[RPFileTransferItem setMetadata:](v17, "setMetadata:", v21);
          }
          CFDictionaryGetCFDataOfLength();
          id v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22) {
            -[RPFileTransferItem setSha256HashData:](v17, "setSha256HashData:", v22);
          }
          [v43 addObject:v17];
          if (-[RPFileTransferSession isResumable](self, "isResumable"))
          {
            -[RPFileTransferSession resumeState](self, "resumeState");
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
            int v24 = -[RPFileTransferResumeStateItem initWithFileTransferRequestDict:]( objc_alloc(&OBJC_CLASS___RPFileTransferResumeStateItem),  "initWithFileTransferRequestDict:",  v16);
            [v23 addActiveFile:v24];
            [v23 scheduleStateFileFlush];
          }
        }

        v13 = -[RPFileTransferSmallFilesTask countByEnumeratingWithState:objects:count:]( v42,  "countByEnumeratingWithState:objects:count:",  &v47,  v63,  16LL);
        if (v13) {
          continue;
        }
        break;
      }
    }

    var0 = self->_ucat->var0;
    if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
    {
      [v43 count];
      LogPrintF();
    }

    uint64_t v28 = objc_alloc_init(&OBJC_CLASS___RPFileTransferSmallFilesTask);
    -[RPFileTransferSmallFilesTask setFileItems:](v28, "setFileItems:", v43);
    -[RPFileTransferSession _ioQueueDequeue](self, "_ioQueueDequeue");
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferSmallFilesTask setQueue:](v28, "setQueue:", v29);

    -[RPFileTransferSmallFilesTask setTaskID:](v28, "setTaskID:", v36);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_smallFilesReceiveTasks,  "setObject:forKeyedSubscript:",  v28,  v40);
    ++self->_fileWritesOutstanding;
    -[RPFileTransferSmallFilesTask queue](v28, "queue");
    uint64_t v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __67__RPFileTransferSession__smallFilesReceiveRequest_responseHandler___block_invoke_2;
    block[3] = &unk_18A0323B8;
    block[4] = self;
    block[5] = v28;
    v46 = v37;
    dispatch_async(v30, block);

LABEL_35:
  }

void sub_187379778( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

LABEL_16:
  if (v10)
  {
    v90 = v11;
    formatSensitiveData((uint64_t)"%sPI ", v6);
    [v11 length];
    NSAppendPrintF();
    v13 = v11;

    uint64_t v11 = v13;
  }

  uint64_t v14 = self->super._name;
  if (v14)
  {
    v89 = v11;
    formatSensitiveData((uint64_t)", Nm ", v6);
    NSAppendPrintF();
    uint64_t v15 = v11;

    uint64_t v11 = v15;
  }

  uint64_t v16 = self->super._model;
  if (v16)
  {
    v88 = v11;
    formatSensitiveData((uint64_t)", Md ", v6);
    NSAppendPrintF();
    id v17 = v11;

    uint64_t v11 = v17;
  }

  v87.receiver = self;
  v87.super_class = (Class)&OBJC_CLASS___RPCompanionLinkDevice;
  if (-[RPEndpoint activityLevel](&v87, sel_activityLevel))
  {
    v86 = v11;
    NSAppendPrintF();
    uint64_t v18 = v11;

    uint64_t v11 = v18;
  }

  if (a3 <= 20)
  {
    uint64_t v19 = self->super._accountID;
    if (v19)
    {
      v85 = v11;
      formatSensitiveData((uint64_t)", AID ", v6);
      NSAppendPrintF();
      uint64_t v20 = v11;

      uint64_t v11 = v20;
    }

    uint64_t v21 = self->super._idsCorrelationIdentifier;
    if (v21)
    {
      v84 = v11;
      formatSensitiveData((uint64_t)", CID ", v6);
      NSAppendPrintF();
      id v22 = v11;

      uint64_t v11 = v22;
    }

    uint64_t v23 = self->_deviceColor;
    if (v23)
    {
      v83 = v11;
      formatSensitiveData((uint64_t)", Cl ", v6);
      NSAppendPrintF();
      int v24 = v11;

      uint64_t v11 = v24;
    }

    v25 = self->_roomName;
    if (v25)
    {
      v82 = v11;
      formatSensitiveData((uint64_t)", Rm ", v6);
      NSAppendPrintF();
      int v26 = v11;

      uint64_t v11 = v26;
    }

    uint64_t v27 = self->_homeKitIdentifier;
    if (v27)
    {
      v81 = v11;
      formatSensitiveData((uint64_t)", HKI ", v6);
      NSAppendPrintF();
      uint64_t v28 = v11;

      uint64_t v11 = v28;
    }

    if (self->super._hotspotInfo)
    {
      v80 = v11;
      NSAppendPrintF();
      uint64_t v29 = v11;

      uint64_t v11 = v29;
    }

    uint64_t v30 = self->_idsPersonalDeviceIdentifier;
    if (v30)
    {
      v79 = v11;
      formatSensitiveData((uint64_t)", IDP ", v6);
      NSAppendPrintF();
      id v31 = v11;

      uint64_t v11 = v31;
    }
  }

  uint64_t v32 = self->_activeUserAltDSID;
  if (v32)
  {
    v78 = v11;
    formatSensitiveData((uint64_t)", ADSID ", v6);
    NSAppendPrintF();
    id v33 = v11;

    uint64_t v11 = v33;
  }

  id v34 = self->super._sourceVersion;
  if (v34)
  {
    v77 = v11;
    formatSensitiveData((uint64_t)", SV ", v6);
    NSAppendPrintF();
    uint64_t v35 = v11;

    uint64_t v11 = v35;
  }

  v76.receiver = self;
  v76.super_class = (Class)&OBJC_CLASS___RPCompanionLinkDevice;
  -[RPEndpoint operatingSystemVersion](&v76, sel_operatingSystemVersion);
  if (v75)
  {
    v74 = v11;
    formatSensitiveData((uint64_t)", OSV ", v6);
    v72.receiver = self;
    v72.super_class = (Class)&OBJC_CLASS___RPCompanionLinkDevice;
    -[RPEndpoint operatingSystemVersion](&v72, sel_operatingSystemVersion);
    RPNSOperatingSystemVersionToString(v73);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    v36 = v74;

    uint64_t v11 = v36;
  }

  if (self->super._linkType)
  {
    NSAppendPrintF();
    v37 = v11;

    uint64_t v11 = v37;
  }

  if (self->_uiTriggered)
  {
    NSAppendPrintF();
    uint64_t v38 = v11;

    uint64_t v11 = v38;
  }

  if (self->super._statusFlags)
  {
    NSAppendPrintF();
    __int16 v39 = v11;

    uint64_t v11 = v39;
  }

  if (self->_deviceFlags)
  {
    NSAppendPrintF();
    int v40 = v11;

    uint64_t v11 = v40;
  }

  if (a3 <= 20)
  {
    if (self->super._hotspotInfo)
    {
      NSAppendPrintF();
      __int16 v41 = v11;

      uint64_t v11 = v41;
    }

    if (self->_listeningPort)
    {
      NSAppendPrintF();
      v42 = v11;

      uint64_t v11 = v42;
    }

    __int16 v43 = self->_launchInstanceID;
    uint64_t v44 = v43;
    if (v43)
    {
      v69 = -[NSUUID UUIDString](v43, "UUIDString");
      NSAppendPrintF();
      uint64_t v45 = v11;

      uint64_t v11 = v45;
    }

    if (self->_mediaAccessControlSetting)
    {
      NSAppendPrintF();
      v46 = v11;

      uint64_t v11 = v46;
    }

    v47 = self->super._mediaRemoteIdentifier;
    if (v47)
    {
      NSAppendPrintF();
      v48 = v11;

      uint64_t v11 = v48;
    }

    v49 = self->super._mediaRouteIdentifier;
    if (v49)
    {
      NSAppendPrintF();
      v50 = v11;

      uint64_t v11 = v50;
    }

    if (self->_mediaSystemIdentifier)
    {
      mediaSystemIdentifier = self->_mediaSystemIdentifier;
      NSAppendPrintF();
      v51 = v11;

      if (self->_daemon)
      {
        -[NSUUID isEqual:]( self->_mediaSystemIdentifierEffective,  "isEqual:",  self->_mediaSystemIdentifier,  v71,  mediaSystemIdentifier);
        NSAppendPrintF();
        uint64_t v11 = v51;
      }

      else
      {
        uint64_t v11 = v51;
      }
    }

    if (self->_mediaSystemName)
    {
      NSAppendPrintF();
      v52 = v11;

      uint64_t v11 = v52;
    }

    if (self->_mediaSystemRole)
    {
      NSAppendPrintF();
      v53 = v11;

      if (self->_daemon)
      {
        NSAppendPrintF();
        uint64_t v11 = v53;
      }

      else
      {
        uint64_t v11 = v53;
      }
    }

    if (self->_mediaSystemState >= 2u)
    {
      NSAppendPrintF();
      v54 = v11;

      uint64_t v11 = v54;
    }

    if ((self->_flags & 0x40) != 0)
    {
      NSAppendPrintF();
      v55 = v11;

      NSAppendPrintF();
      uint64_t v11 = v55;
    }

    v56 = self->_siriInfo;
    v57 = v56;
    if (v56)
    {
      -[NSDictionary count](v56, "count");
      NSAppendPrintF();
      v58 = v11;

      uint64_t v11 = v58;
    }

    v59 = v11;

    RPCompanionLinkFlagsToShortString(self->_flags, (uint64_t)v93);
    NSAppendPrintF();
    uint64_t v11 = v11;

    v60 = self->super._serviceTypes;
    if (v60)
    {
      NSAppendPrintF();
      v61 = v11;

      uint64_t v11 = v61;
    }

    v62 = self->_activeUserAltDSID;
    if (v62)
    {
      NSAppendPrintF();
      v63 = v11;

      uint64_t v11 = v63;
    }

    standaloneWatch = self->_standaloneWatch;
    if ((standaloneWatch & 0x80000000) == 0)
    {
      NSAppendPrintF();
      v65 = v11;

      uint64_t v11 = v65;
    }
  }

  v66 = v11;

  return v66;
}

  if (self->_passwordType) {
    -[CUPairingSession setFlags:]( self->_pairSetupSession,  "setFlags:",  -[CUPairingSession flags](self->_pairSetupSession, "flags") & 0xFFFFFFEFLL);
  }
  uint64_t v11 = self->_pairSetupACL;
  if (v11)
  {
    uint64_t v12 = objc_alloc_init(MEMORY[0x189603FC8]);
    v25 = 0u;
    int v26 = 0u;
    uint64_t v27 = 0u;
    uint64_t v28 = 0u;
    v13 = v11;
    uint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v26;
      id v17 = MEMORY[0x189604A88];
      do
      {
        uint64_t v18 = 0LL;
        do
        {
          if (*(void *)v26 != v16) {
            objc_enumerationMutation(v13);
          }
          [v12 setObject:v17 forKeyedSubscript:*(void *)(*((void *)&v25 + 1) + 8 * v18++)];
        }

        while (v15 != v18);
        uint64_t v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
      }

      while (v15);
    }

    -[CUPairingSession setAcl:](self->_pairSetupSession, "setAcl:", v12);
  }

  uint64_t v19 = MEMORY[0x1895A4770](self->_promptForPasswordHandler);
  uint64_t v20 = (void *)v19;
  uint64_t v21 = MEMORY[0x1895F87A8];
  if (v19)
  {
    v24[0] = MEMORY[0x1895F87A8];
    v24[1] = 3221225472LL;
    v24[2] = __37__RPConnection__clientPairSetupStart__block_invoke;
    v24[3] = &unk_18A0328E8;
    v24[4] = self;
    v24[5] = v19;
    -[CUPairingSession setPromptForPINHandler:](self->_pairSetupSession, "setPromptForPINHandler:", v24);
  }

  if (self->_pairSetupAuthType == 8)
  {
    if ((self->_controlFlags & 0x800000000000LL) != 0) {
      -[CUPairingSession setFlags:]( self->_pairSetupSession,  "setFlags:",  -[CUPairingSession flags](self->_pairSetupSession, "flags") & 0xFFBFFFE3LL);
    }
    -[RPConnection _configureForSessionPairing:](self, "_configureForSessionPairing:", self->_pairSetupSession);
  }

  v23[0] = v21;
  v23[1] = 3221225472LL;
  v23[2] = __37__RPConnection__clientPairSetupStart__block_invoke_2;
  v23[3] = &unk_18A032910;
  v23[4] = self;
  -[CUPairingSession setSendDataHandler:](self->_pairSetupSession, "setSendDataHandler:", v23);
  v22[0] = v21;
  v22[1] = 3221225472LL;
  v22[2] = __37__RPConnection__clientPairSetupStart__block_invoke_3;
  v22[3] = &unk_18A031AC0;
  v22[4] = self;
  -[CUPairingSession setCompletionHandler:](self->_pairSetupSession, "setCompletionHandler:", v22);
  -[CUPairingSession activate](self->_pairSetupSession, "activate");
}

      objc_autoreleasePoolPop(v7);
      uint64_t v7 = (void *)MEMORY[0x1895A45CC]();
      if (*((_DWORD *)v6 + 35) != (_DWORD)v4) {
        goto LABEL_21;
      }
    }

    uint64_t v18 = *((void *)v6 + 3);
LABEL_15:
    -[RPFileTransferSession _largeFileSendTaskSend:data:end:xid:]( self,  "_largeFileSendTaskSend:data:end:xid:",  v6,  v13,  v18 == 0,  v4);
    goto LABEL_16;
  }

    if (fcntl(v6, 45, 1LL, v11) && (!*__error() || *__error()))
    {
      uint64_t v9 = self->_ucat->var0;
    }

    return v6;
  }

  if (a4)
  {
    RPErrorF();
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return -1;
}

  if (gLogCategory_RPLegacySupport <= 60
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

LABEL_11:
  int Int64Ranged = CFDictionaryGetInt64Ranged();
  if (self->_mediaAccessControlSetting != Int64Ranged)
  {
    self->_mediaAccessControlSetting = Int64Ranged;
    v5 |= 2u;
  }

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_storeStrong((id *)&self->super._mediaRouteIdentifier, v16);
    v5 |= 2u;
  }

  return v5;
}
}

    objc_msgSend(v19, "fileItem", v17);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPFileTransferSession _processReceivedItem:responseHandler:]( self,  "_processReceivedItem:responseHandler:",  v16,  v12);

LABEL_14:
    -[RPFileTransferSession _largeFileReceiveTaskInvalidate:](self, "_largeFileReceiveTaskInvalidate:", v19, v17, v18);
    goto LABEL_15;
  }

  if (v10)
  {
    uint64_t v15 = self->_ucat->var0;
    if (v15 <= 90 && (v15 != -1 || _LogCategory_Initialize()))
    {
      id v17 = [v19 taskID];
      uint64_t v18 = v10;
      LogPrintF();
    }

    ((void (**)(void, void, void, id))v12)[2](v12, 0LL, 0LL, v10);
    goto LABEL_14;
  }

  (*((void (**)(id, void, void, void))v11 + 2))(v11, MEMORY[0x189604A60], 0LL, 0LL);
LABEL_15:
  --self->_fileWritesOutstanding;
}

    uint64_t v12 = 0LL;
    goto LABEL_6;
  }

  *a4 = v10;
  -[RPFileTransferSession _compressData:error:](self, "_compressData:error:", v9, a5);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
  if (v11) {
    v13 = v11;
  }

LABEL_6:
  return v12;
}

    [v13 UTF8String];
    goto LABEL_5;
  }

  if (gLogCategory_RPFileTransferSession <= 30
    && (gLogCategory_RPFileTransferSession != -1 || _LogCategory_Initialize()))
  {
    [v13 UTF8String];
    LogPrintF();
  }

  uint64_t v14 = 1;
LABEL_35:

  return v14;
}

    uint64_t v14 = 0LL;
    goto LABEL_12;
  }

  v13 = a4 - 1;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:v16 length:qword_1873E7670[v13]];
LABEL_12:

  return v14;
}

    LogPrintF();
LABEL_15:
    uint64_t v7 = 0LL;
    id v8 = 0LL;
    goto LABEL_5;
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (gLogCategory_RPLegacySupport > 90
      || gLogCategory_RPLegacySupport == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_15;
    }

    goto LABEL_11;
  }

  uint64_t v7 = v6;
  [v6 device];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 updateWithMobileDevice:v13];
  deviceChangedHandler = (void (**)(id, void *, void))self->_deviceChangedHandler;
  if (deviceChangedHandler)
  {
    uint64_t v11 = v9;
    [v7 device];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    deviceChangedHandler[2](deviceChangedHandler, v12, v11);
  }

    LogPrintF();
LABEL_15:
    id v8 = 0LL;
    uint64_t v9 = 0LL;
    goto LABEL_5;
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v6);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (gLogCategory_RPLegacySupport > 90
      || gLogCategory_RPLegacySupport == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_15;
    }

    goto LABEL_11;
  }

  id v8 = v7;
  [v7 device];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 updateWithWiFiDevice:v12 changes:v4];
  deviceChangedHandler = (void (**)(id, void *, void))self->_deviceChangedHandler;
  if (deviceChangedHandler)
  {
    [v8 device];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    deviceChangedHandler[2]( deviceChangedHandler,  v11,  ((int)((_DWORD)v4 << 31) >> 31) & ((2 * (v4 & 1)) | 8) & 0xFFFFFF9F | (32 * ((v4 >> 1) & 3)));
  }

    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
LABEL_15:
    v13 = self->_nwListener;
    uint64_t v14 = v13;
    if (v13) {
      nw_listener_cancel(v13);
    }

    uint64_t v15 = nw_listener_create(secure_udp);
    objc_storeStrong((id *)&self->_nwListener, v15);
    if (v15)
    {
      nw_listener_set_queue(v15, (dispatch_queue_t)self->_dispatchQueue);
      v24[0] = 0LL;
      v24[1] = v24;
      v24[2] = 0x3032000000LL;
      v24[3] = __Block_byref_object_copy__71;
      v24[4] = __Block_byref_object_dispose__72;
      v25 = (id)MEMORY[0x1895A4770](v6);
      v20[0] = v5;
      v20[1] = 3221225472LL;
      v20[2] = __55__RPStreamSession__clientUDPNWPathStartWithCompletion___block_invoke_73;
      v20[3] = &unk_18A0340F8;
      v20[4] = v15;
      v20[5] = self;
      uint64_t v23 = v24;
      uint64_t v11 = v11;
      uint64_t v21 = v11;
      id v22 = v26;
      MEMORY[0x1895A44C4](v15, v20);
      nw_listener_set_new_connection_handler(v15, &__block_literal_global_16);
      if (gLogCategory_RPStreamSession <= 30
        && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      nw_listener_start(v15);

      _Block_object_dispose(v24, 8);
    }

    else
    {
      id v17 = RPErrorF();
      uint64_t v18 = (void *)v31[5];
      v31[5] = v17;
    }

    goto LABEL_23;
  }

  uint64_t v11 = (id)nw_interface_create_with_name();
  if (v11)
  {
    nw_parameters_require_interface(secure_udp, (nw_interface_t)v11);
    goto LABEL_15;
  }

  uint64_t v19 = RPErrorF();
  uint64_t v11 = 0LL;
  uint64_t v15 = (nw_listener_t)v31[5];
  v31[5] = v19;
LABEL_23:

LABEL_24:
  v7[2](v7);

  _Block_object_dispose(&v30, 8);
}

LABEL_13:
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = v14;
  if (v14)
  {
    uint64_t v16 = self->_name;
    id v17 = v14;
    uint64_t v18 = v16;
    if (v17 == v18)
    {
    }

    else
    {
      uint64_t v19 = v18;
      if (v18)
      {
        uint64_t v20 = -[NSString isEqual:](v17, "isEqual:", v18);

        if ((v20 & 1) != 0) {
          goto LABEL_21;
        }
      }

      else
      {
      }

      objc_storeStrong((id *)&self->_txtData, v15);
      -[RPDevice _updateTXTDictionary:](self, "_updateTXTDictionary:", v17);
      id v6 = 2;
    }
  }

    objc_msgSend(v15, "responseHandler", v13, v14);
    uint64_t v9 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    RPErrorF();
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, void, void *))v9)[2](v9, 0LL, 0LL, v12);

    goto LABEL_14;
  }

  id v8 = self->_ucat->var0;
  if (v8 <= 90 && (v8 != -1 || _LogCategory_Initialize()))
  {
    [v15 requestID];
    uint64_t v9 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    LogPrintF();
LABEL_14:
  }
      }

      id v8 = [v6 countByEnumeratingWithState:&v63 objects:v71 count:16];
    }

    while (v8);
  }

  id v17 = v5;
  uint64_t v18 = [v5 count];
  uint64_t v19 = (dispatch_queue_s *)self->_dispatchQueue;
  if (v18)
  {
    v57[0] = MEMORY[0x1895F87A8];
    v57[1] = 3221225472LL;
    v57[2] = __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_3;
    v57[3] = &unk_18A031AE8;
    v57[4] = v5;
    v57[5] = self;
    dispatch_async(v19, v57);
    uint64_t v20 = 0x189603000LL;
    uint64_t v21 = v50;
    if (self->_compressionEnabled)
    {
      v55 = 0LL;
      v56 = 0LL;
      -[RPFileTransferSession _encodeAndCompressObject:originalSize:error:]( self,  "_encodeAndCompressObject:originalSize:error:",  v5,  &v56,  &v55);
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = v55;
      int v24 = v23;
      p_metricCompressedBytes = &self->_metricCompressedBytes;
      p_metricUncompressedBytes = &self->_metricUncompressedBytes;
      if (v22)
      {
        uint64_t v27 = [v22 length];
        do
          uint64_t v28 = __ldaxr(p_metricCompressedBytes);
        while (__stlxr(v28 + v27, p_metricCompressedBytes));
        uint64_t v29 = v56;
        do
          uint64_t v30 = __ldaxr(p_metricUncompressedBytes);
        while (__stlxr(v30 + v29, p_metricUncompressedBytes));
        v70[0] = v22;
        v69[0] = &unk_18A04DF48;
        v69[1] = @"_i";
        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v50, "taskID"));
        id v31 = (void *)objc_claimAutoreleasedReturnValue();
        v70[1] = v31;
        v69[2] = &unk_18A04DF60;
        [MEMORY[0x189607968] numberWithUnsignedLong:v56];
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
        v70[2] = v32;
        uint64_t v20 = 0x189603000uLL;
        [MEMORY[0x189603F68] dictionaryWithObjects:v70 forKeys:v69 count:3];
        id v33 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v21 = v50;
        id v17 = v5;
        if (v33) {
          goto LABEL_40;
        }
      }

      else
      {
        uint64_t v35 = v56;
        do
          v36 = __ldaxr(p_metricCompressedBytes);
        while (__stlxr(v36 + v35, p_metricCompressedBytes));
        v37 = v56;
        do
          uint64_t v38 = __ldaxr(p_metricUncompressedBytes);
        while (__stlxr(v38 + v37, p_metricUncompressedBytes));
        p_metricUncompressibleChunks = &self->_metricUncompressibleChunks;
        uint64_t v20 = 0x189603000uLL;
        do
          int v40 = __ldaxr(p_metricUncompressibleChunks);
        while (__stlxr(v40 + 1, p_metricUncompressibleChunks));
        if (v23)
        {
          p_metricCompressionErrors = &self->_metricCompressionErrors;
          do
            v42 = __ldaxr(p_metricCompressionErrors);
          while (__stlxr(v42 + 1, p_metricCompressionErrors));
          var0 = self->_ucat->var0;
          if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
          {
            v48 = (void *)objc_msgSend(v50, "taskID", v48);
            v49 = v24;
            LogPrintF();
          }
        }
      }
    }

    v67[0] = @"_i";
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v21, "taskID", v48, v49));
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
    v67[1] = &unk_18A04DF78;
    v68[0] = v44;
    v68[1] = v17;
    [*(id *)(v20 + 3944) dictionaryWithObjects:v68 forKeys:v67 count:2];
    id v33 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_40:
    uint64_t v45 = (dispatch_queue_s *)self->_dispatchQueue;
    v51[0] = MEMORY[0x1895F87A8];
    v51[1] = 3221225472LL;
    v51[2] = __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_350;
    v51[3] = &unk_18A033388;
    v51[4] = self;
    v52 = v21;
    v53 = v33;
    v54 = v17;
    v46 = v33;
    v47 = v21;
    dispatch_async(v45, v51);

    goto LABEL_41;
  }

  v58[0] = MEMORY[0x1895F87A8];
  v58[1] = 3221225472LL;
  v58[2] = __48__RPFileTransferSession__smallFilesSendTaskRun___block_invoke_2;
  v58[3] = &unk_18A031AE8;
  uint64_t v21 = v50;
  v58[4] = self;
  v59 = v50;
  id v34 = v50;
  dispatch_async(v19, v58);

LABEL_41:
}
}
}

LABEL_21:
  return v6;
}

  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  id v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22) {
    goto LABEL_29;
  }
  bleDeviceAddress = self->_bleDeviceAddress;
  int v24 = v22;
  v25 = bleDeviceAddress;
  if (v24 == v25)
  {

    goto LABEL_29;
  }

  int v26 = v25;
  if (!v25)
  {

    goto LABEL_28;
  }

  uint64_t v27 = -[NSData isEqual:](v24, "isEqual:", v25);

  if ((v27 & 1) == 0)
  {
LABEL_28:
    objc_storeStrong((id *)&self->_bleDeviceAddress, v22);
    v9 |= 2u;
  }

    RPErrorF();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }

  objc_autoreleasePoolPop(v7);
LABEL_22:
}

LABEL_29:
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28) {
    goto LABEL_37;
  }
  bleAuthTag = self->_bleAuthTag;
  uint64_t v30 = v28;
  id v31 = bleAuthTag;
  if (v30 == v31)
  {

    goto LABEL_37;
  }

  uint64_t v32 = v31;
  if (!v31)
  {

    goto LABEL_36;
  }

  id v33 = -[NSData isEqual:](v30, "isEqual:", v31);

  if ((v33 & 1) == 0)
  {
LABEL_36:
    objc_storeStrong((id *)&self->_bleAuthTag, v28);
    v9 |= 2u;
  }

    self->_pairVerifyAuthType = 4;
    -[CUPairingSession setFlags:]( self->_pairVerifySession,  "setFlags:",  -[CUPairingSession flags](self->_pairVerifySession, "flags") & 0xFFBFFFFFLL);
    uint64_t v14 = self->_pairVerifySession;
    uint64_t v15 = -[CUPairingSession flags](v14, "flags") | 0xC;
    goto LABEL_31;
  }

  if ((controlFlags & 0x40) != 0 || !self->_pairVerifyFailed) {
    goto LABEL_9;
  }
LABEL_32:
  pairVerifyAuthType = self->_pairVerifyAuthType;
  if (pairVerifyAuthType == 8)
  {
    -[RPConnection _configureForSessionPairing:](self, "_configureForSessionPairing:", self->_pairVerifySession);
    if (GestaltGetDeviceClass() == 4)
    {
      var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v20 = "SessionPaired";
        uint64_t v21 = "RPIdentity";
        LogPrintF();
      }

      pairVerifyAuthType = 1;
    }

    else
    {
      pairVerifyAuthType = 8;
    }

    uint64_t v29 = v12;
    uint64_t v30 = 3221225472LL;
    id v31 = __38__RPConnection__clientPairVerifyStart__block_invoke;
    uint64_t v32 = &unk_18A032938;
    id v34 = pairVerifyAuthType;
    id v33 = self;
    -[CUPairingSession setSendDataHandler:](self->_pairVerifySession, "setSendDataHandler:", &v29, v20, v21);
    goto LABEL_44;
  }
}

  if (fcntl(v14, 76, 1LL, v26))
  {
    if (*__error())
    {
      id v22 = *__error();
      if (!(_DWORD)v22) {
        goto LABEL_38;
      }
    }

    else
    {
      id v22 = 4294960596LL;
    }

    uint64_t v23 = self->_ucat->var0;
    if (v23 <= 90 && (v23 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v27 = v22;
      LogPrintF();
    }
  }

LABEL_85:
  [v7 name];
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v56) {
    goto LABEL_93;
  }
  name = self->_name;
  v58 = v56;
  v59 = name;
  if (v58 == v59)
  {

    goto LABEL_93;
  }

  v60 = v59;
  if (!v59)
  {

    goto LABEL_92;
  }

  v61 = -[NSString isEqual:](v58, "isEqual:", v59);

  if ((v61 & 1) == 0)
  {
LABEL_92:
    objc_storeStrong((id *)&self->_name, v56);
    v9 |= 0x10u;
  }

LABEL_93:
  if ((v4 & 2) == 0) {
    goto LABEL_104;
  }
LABEL_94:
  v62 = [v7 distance];
  else {
    v63 = 20;
  }
  if (v62 >= 11) {
    v64 = v63;
  }
  else {
    v64 = 10;
  }
  if (!v62) {
    v64 = 0;
  }
  if (v64 != self->_proximity)
  {
    self->_proximity = v64;
    v9 |= 0x80u;
  }

LABEL_104:
  if ((v4 & 4) != 0)
  {
    v65 = [v8 rssi];
    if (self->_rawRSSI != v65)
    {
      self->_rawRSSI = v65;
      v9 |= 0x20u;
    }

    v66 = [v8 smoothedRSSI];
    if (self->_smoothedRSSI != v66)
    {
      self->_smoothedRSSI = v66;
      v9 |= 0x20u;
    }
  }

  return v9;
}

void sub_187380D74(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

LABEL_50:
}

    if (!v10) {
      goto LABEL_62;
    }
    goto LABEL_51;
  }

  id v10 = v4;
LABEL_51:
  v55 = self->_ucat->var0;
  if (v55 <= 60 && (v55 != -1 || _LogCategory_Initialize()))
  {
    v56 = self->_pairVerifyAuthType;
    else {
      v57 = off_18A032F60[v56];
    }
    v60 = v57;
    flags = v10;
    LogPrintF();
  }

  -[RPConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate", v60, flags, v62, statusFlags, v64, v65);
  v58 = MEMORY[0x1895A4770](self->_pairVerifyCompletion);
  v59 = (void *)v58;
  if (v58) {
    (*(void (**)(uint64_t, id))(v58 + 16))(v58, v10);
  }

LABEL_62:
}

void sub_187381748(_Unwind_Exception *a1)
{
}

void sub_187381EBC(_Unwind_Exception *a1)
{
}

void sub_187382064(_Unwind_Exception *a1)
{
}

void sub_18738214C(_Unwind_Exception *a1)
{
}

void sub_187382204(_Unwind_Exception *a1)
{
}

void sub_1873822BC(_Unwind_Exception *a1)
{
}

const char *_StateToString(unsigned int a1)
{
  if (a1 > 0x1D) {
    return "?";
  }
  else {
    return off_18A032D88[a1];
  }
}

const char *RPDataLinkTypeToString(unsigned int a1)
{
  if (a1 > 0xB) {
    return "?";
  }
  else {
    return off_18A032FB8[a1];
  }
}

LABEL_22:
  }

      -[RPConnection _updateExternalState](self, "_updateExternalState", v7, v8);
    }

    id v5 = self->_internalState;
LABEL_20:
    uint64_t v7 = _StateToString(internalState);
    id v8 = _StateToString(v5);
    LogPrintF();
    goto LABEL_22;
  }

  [v5 bleDevice];
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  int v24 = [v126 decryptedActivityLevel];
  if (v24 != 16 && self->_activityLevel != v24)
  {
    self->_activityLevel = v24;
    [MEMORY[0x189603F50] date];
    v25 = (NSDate *)objc_claimAutoreleasedReturnValue();
    activityLevelTimeStamp = self->_activityLevelTimeStamp;
    self->_activityLevelTimeStamp = v25;

    id v8 = 2;
  }

  [v5 bleDevice];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 advertisementData];
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDevice bleDevice](v6, "bleDevice");
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v29 advertisementData];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  id v31 = v28;
  uint64_t v32 = v30;
  id v33 = v32;
  if (v31 == v32)
  {
    id v34 = 1;
  }

  else if ((v31 == 0LL) == (v32 != 0LL))
  {
    id v34 = 0;
  }

  else
  {
    id v34 = [v31 isEqual:v32];
  }

  uint64_t v35 = v8 | 1;
  if (v34) {
    v36 = v8;
  }
  else {
    v36 = v8 | 1;
  }
  [v5 bleDevice];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  [v37 advertisementFields];
  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
  __int16 v39 = (void *)[v38 mutableCopy];

  -[SFDevice bleDevice](v6, "bleDevice");
  int v40 = (void *)objc_claimAutoreleasedReturnValue();
  [v40 advertisementFields];
  __int16 v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)[v41 mutableCopy];

  [v39 setObject:0 forKeyedSubscript:@"ch"];
  [v42 setObject:0 forKeyedSubscript:@"ch"];
  __int16 v43 = v39;
  uint64_t v44 = v42;
  v124 = v44;
  v125 = v43;
  if (v43 == v44)
  {

    goto LABEL_38;
  }

  uint64_t v45 = v44;
  if ((v43 == 0LL) == (v44 != 0LL))
  {

    goto LABEL_40;
  }

  v46 = [v43 isEqual:v44];

  if (v46) {
LABEL_38:
  }
    uint64_t v35 = v36;
LABEL_40:
  [v5 bleDevice];
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  [v47 advertisementFields];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  int Int64Ranged = CFDictionaryGetInt64Ranged();

  if (self->_cameraState != Int64Ranged)
  {
    self->_cameraState = Int64Ranged;
    v35 |= 2u;
  }

  hotspotInfo = self->_hotspotInfo;
  if (hotspotInfo != [v5 hotspotInfo])
  {
    self->_hotspotInfo = [v5 hotspotInfo];
    v35 |= 1u;
  }

  [v5 idsIdentifier];
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (v51)
  {
    idsDeviceIdentifier = self->_idsDeviceIdentifier;
    v54 = v51;
    v55 = idsDeviceIdentifier;
    if (v54 == v55)
    {

      goto LABEL_52;
    }

    v56 = v55;
    if (v55)
    {
      v57 = -[NSString isEqual:](v54, "isEqual:", v55);

      if ((v57 & 1) != 0) {
        goto LABEL_52;
      }
    }

    else
    {
    }

    objc_storeStrong((id *)&self->_idsDeviceIdentifier, v52);
    v35 |= 2u;
  }

  if (v2->_controlCnx && (v2->_flags & 1) != 0)
  {
    if (v8) {
      uint64_t v11 = 4LL;
    }
    else {
      uint64_t v11 = 0LL;
    }
    uint64_t v19 = @"_ftFl";
    [MEMORY[0x189607968] numberWithUnsignedInt:v11];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[RPConnection sendEncryptedEventID:event:options:completion:]( v2->_controlCnx,  "sendEncryptedEventID:event:options:completion:",  @"_ftPU",  v13,  0LL,  0LL);
  }

LABEL_14:
    id v17 = 0LL;
    goto LABEL_15;
  }

  id v10 = self->_ucat->var0;
  if (a5)
  {
    v25 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:-6714 userInfo:0];
    *a5 = v25;
  }

  uint64_t v19 = 0LL;
LABEL_38:

  return v19;
}

  v128 = v7;
  [v5 accountID];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = v17;
  if (v17)
  {
    accountID = self->_accountID;
    uint64_t v20 = v17;
    uint64_t v21 = accountID;
    if (v20 == v21)
    {
    }

    else
    {
      id v22 = v21;
      if (v21)
      {
        uint64_t v23 = -[NSString isEqual:](v20, "isEqual:", v21);

        if ((v23 & 1) != 0) {
          goto LABEL_22;
        }
      }

      else
      {
      }

      objc_storeStrong((id *)&self->_accountID, v18);
      id v8 = 2;
    }
  }

        LogPrintF();
        goto LABEL_11;
      }

      uint64_t v9 = _LogCategory_Initialize();
      uint64_t v7 = v12;
      if (v9)
      {
        if (v12) {
          goto LABEL_7;
        }
        goto LABEL_14;
      }
    }

    if (!v7)
    {
LABEL_12:

      return;
    }

    objc_msgSend(*(id *)(a1 + 40), "_controlCnxStartIfNeeded", v10);
LABEL_11:
    uint64_t v7 = v12;
    goto LABEL_12;
  }
}

    uint64_t v12 = 0;
    uint64_t v11 = 0LL;
    goto LABEL_15;
  }

  discoveredPeople = v4->_discoveredPeople;
  if (!discoveredPeople)
  {
    uint64_t v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    uint64_t v15 = v4->_discoveredPeople;
    v4->_discoveredPeople = v14;

    discoveredPeople = v4->_discoveredPeople;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredPeople, "setObject:forKeyedSubscript:", v11, v9);
  uint64_t v12 = 1;
LABEL_15:

  objc_sync_exit(v4);
  if (v11)
  {
    if ((v12 & 1) != 0) {
      personFoundHandler = v4->_personFoundHandler;
    }
    else {
      personFoundHandler = v4->_personChangedHandler;
    }
    id v17 = MEMORY[0x1895A4770](personFoundHandler);
    uint64_t v18 = (void *)v17;
    if (v17) {
      (*(void (**)(uint64_t, id))(v17 + 16))(v17, v11);
    }
  }

  deviceFoundHandler = (void (**)(id, id))v4->_deviceFoundHandler;
  if (deviceFoundHandler) {
    deviceFoundHandler[2](deviceFoundHandler, v20);
  }
}

LABEL_12:
          if (!self->_pskData) {
            goto LABEL_62;
          }
          unint64_t v4 = 18;
          goto LABEL_63;
        case 0xCu:
          self->_internalState = 13;
          -[RPConnection _clientPreAuthStart](self, "_clientPreAuthStart");
          goto LABEL_64;
        case 0xDu:
          if (self->_stepError) {
            goto LABEL_31;
          }
          if (self->_stepDone) {
            goto LABEL_12;
          }
          goto LABEL_64;
        case 0xEu:
          self->_internalState = 15;
          -[RPConnection _clientPairSetupStart](self, "_clientPairSetupStart");
          goto LABEL_64;
        case 0xFu:
          if (!self->_stepError) {
            goto LABEL_39;
          }
          goto LABEL_31;
        case 0x10u:
          self->_internalState = 17;
          -[RPConnection _clientPairVerifyStart](self, "_clientPairVerifyStart");
          goto LABEL_64;
        case 0x11u:
          stepError = self->_stepError;
          if (stepError)
          {
            self->_pairVerifyFailed = 1;
            if (self->_pairVerifySession)
            {
              var0 = self->_ucat->var0;
              if (var0 <= 60)
              {
                if (var0 != -1) {
                  goto LABEL_22;
                }
                if (_LogCategory_Initialize())
                {
                  stepError = self->_stepError;
LABEL_22:
                  uint64_t v19 = (const char *)stepError;
                  LogPrintF();
                }
              }

              uint64_t v12 = MEMORY[0x1895A4770](self->_pairVerifyCompletion);
              v13 = (void *)v12;
              if (v12) {
                (*(void (**)(uint64_t, NSError *))(v12 + 16))(v12, self->_stepError);
              }
            }

            controlFlags = self->_controlFlags;
            if ((controlFlags & 0x400) != 0 || (controlFlags & 0x8000000000LL) != 0 || (self->_flags & 1) != 0)
            {
              uint64_t v16 = self->_ucat->var0;
              unint64_t v4 = 14;
            }

            else
            {
              if ((self->_controlFlags & 0x240) != 0x200 || !self->_pairVerifyUsedIdentity)
              {
LABEL_31:
                self->_internalState = 22;
                goto LABEL_64;
              }

              uint64_t v15 = self->_ucat->var0;
LABEL_62:
              unint64_t v4 = 16;
            }

            goto LABEL_63;
          }

  uint64_t v9 = self->_ucat->var0;
LABEL_16:
  int Int64Ranged = CFDictionaryGetInt64Ranged();
  uint64_t v11 = Int64Ranged;
  if (Int64Ranged <= 0xA
    && ((1 << Int64Ranged) & 0x426) != 0
    && !-[RPConnection _serverPairingAllowed](self, "_serverPairingAllowed"))
  {
    uint64_t v21 = self->_ucat->var0;
    v64[0] = @"_ec";
    v64[1] = @"_em";
    v65[0] = &unk_18A04DEA0;
    v65[1] = @"Pairing not allowed";
    id v22 = (void *)MEMORY[0x189603F68];
    uint64_t v23 = v65;
    int v24 = v64;
    goto LABEL_39;
  }

  if (!a4 && self->_pairSetupSession) {
    goto LABEL_90;
  }
  -[RPConnection _pairSetupInvalidate](self, "_pairSetupInvalidate");
  uint64_t v12 = (CUPairingSession *)objc_alloc_init(MEMORY[0x18960ED80]);
  pairSetupSession = self->_pairSetupSession;
  self->_pairSetupSession = v12;

  -[CUPairingSession setDispatchQueue:](self->_pairSetupSession, "setDispatchQueue:", self->_dispatchQueue);
  -[CUPairingSession setFlags:](self->_pairSetupSession, "setFlags:", self->_pairSetupFlags);
  if (self->_label) {
    label = (const __CFString *)self->_label;
  }
  else {
    label = @"RPCnx";
  }
  -[CUPairingSession setLabel:](self->_pairSetupSession, "setLabel:", label);
  -[CUPairingSession setSessionType:](self->_pairSetupSession, "setSessionType:", 2LL);
  getMCFeatureTVRemoteAllowedRemotes();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPConnection _allowedMACAddressesForMCFeature:](self, "_allowedMACAddressesForMCFeature:", v15);
  uint64_t v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  allowedMACAddresses = self->_allowedMACAddresses;
  self->_allowedMACAddresses = v16;

  if (-[NSArray count](self->_allowedMACAddresses, "count")) {
    -[CUPairingSession setAllowedMACAddresses:]( self->_pairSetupSession,  "setAllowedMACAddresses:",  self->_allowedMACAddresses);
  }
  uint64_t v18 = CFDictionaryGetInt64Ranged();
  DeviceClass = GestaltGetDeviceClass();
  if (v11 == 10 && DeviceClass == 4 && !v18)
  {
    uint64_t v20 = self->_ucat->var0;
    if (v20 <= 30 && (v20 != -1 || _LogCategory_Initialize()))
    {
      v52 = "Invalid";
      v54 = "SessionPaired";
      LogPrintF();
    }

    uint64_t v18 = 8;
  }

  int v26 = self->_ucat->var0;
  if (v26 <= 30 && (v26 != -1 || _LogCategory_Initialize()))
  {
    if (v11 > 0xB) {
      uint64_t v27 = "?";
    }
    else {
      uint64_t v27 = off_18A032F00[v11];
    }
    if (v18 > 0xA) {
      uint64_t v28 = "?";
    }
    else {
      uint64_t v28 = off_18A032F60[v18];
    }
    v52 = v27;
    v54 = v28;
    LogPrintF();
  }

  if (v18 == 8)
  {
    self->_pairSetupAuthType = 8;
    self->_pairVerifyAuthType = 8;
    if (v11 == 1) {
      uint64_t v29 = 1LL;
    }
    else {
      uint64_t v29 = 8LL;
    }
    -[CUPairingSession setPinType:](self->_pairSetupSession, "setPinType:", v29, v52, v54);
    -[CUPairingSession setFlags:]( self->_pairSetupSession,  "setFlags:",  -[CUPairingSession flags](self->_pairSetupSession, "flags") & 0xFFBFFFE3LL);
    -[RPConnection _configureForSessionPairing:](self, "_configureForSessionPairing:", self->_pairSetupSession);
  }

  uint64_t v30 = self->_passwordType;
  if (v30 == 2)
  {
    self->_pairSetupAuthType = 5;
    id v31 = self->_pairSetupSession;
    uint64_t v32 = 2LL;
    goto LABEL_62;
  }

  if (v30 != 1)
  {
    id v33 = self->_password;
    if (!-[NSString length](v33, "length"))
    {
      id v34 = -[RPCompanionLinkDevice password](self->_localDeviceInfo, "password");

      id v33 = (NSString *)v34;
    }

    if (-[NSString length](v33, "length", v52))
    {
      self->_pairSetupAuthType = 5;
      -[CUPairingSession setFixedPIN:](self->_pairSetupSession, "setFixedPIN:", v33);
      -[CUPairingSession setFlags:]( self->_pairSetupSession,  "setFlags:",  -[CUPairingSession flags](self->_pairSetupSession, "flags") & 0xFFFFFFEFLL);
      -[CUPairingSession setPinType:](self->_pairSetupSession, "setPinType:", 5LL);
LABEL_74:

      goto LABEL_75;
    }

    switch(v11)
    {
      case 1u:
        self->_pairSetupAuthType = 5;
        uint64_t v35 = self->_pairSetupSession;
        v36 = 1LL;
        break;
      case 0xAu:
        goto LABEL_74;
      case 2u:
        self->_pairSetupAuthType = 5;
        uint64_t v35 = self->_pairSetupSession;
        v36 = 2LL;
        break;
      default:
        self->_pairSetupAuthType = 6;
        -[CUPairingSession setFixedPIN:](self->_pairSetupSession, "setFixedPIN:", @"public");
        goto LABEL_74;
    }

    -[CUPairingSession setPinType:](v35, "setPinType:", v36);
    -[CUPairingSession setFlags:]( self->_pairSetupSession,  "setFlags:",  -[CUPairingSession flags](self->_pairSetupSession, "flags") & 0xFFFFFFEFLL);
    goto LABEL_74;
  }

  self->_pairSetupAuthType = 5;
  id v31 = self->_pairSetupSession;
  uint64_t v32 = 1LL;
LABEL_62:
  -[CUPairingSession setPinType:](v31, "setPinType:", v32, v52);
  -[CUPairingSession setFlags:]( self->_pairSetupSession,  "setFlags:",  -[CUPairingSession flags](self->_pairSetupSession, "flags") & 0xFFFFFFEFLL);
LABEL_75:
  v37 = self->_pairSetupACL;
  if (v37)
  {
    uint64_t v38 = objc_alloc_init(MEMORY[0x189603FC8]);
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    __int16 v39 = v37;
    int v40 = -[NSArray countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v59,  v63,  16LL);
    if (v40)
    {
      __int16 v41 = v40;
      v42 = *(void *)v60;
      __int16 v43 = MEMORY[0x189604A88];
      do
      {
        for (uint64_t i = 0LL; i != v41; ++i)
        {
          if (*(void *)v60 != v42) {
            objc_enumerationMutation(v39);
          }
          [v38 setObject:v43 forKeyedSubscript:*(void *)(*((void *)&v59 + 1) + 8 * i)];
        }

        __int16 v41 = -[NSArray countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v59,  v63,  16LL);
      }

      while (v41);
    }

    -[CUPairingSession setAcl:](self->_pairSetupSession, "setAcl:", v38);
  }

  uint64_t v45 = MEMORY[0x1895F87A8];
  if (self->_showPasswordHandler)
  {
    v58[0] = MEMORY[0x1895F87A8];
    v58[1] = 3221225472LL;
    v58[2] = __47__RPConnection__serverPairSetupWithData_start___block_invoke;
    v58[3] = &unk_18A0329D8;
    v58[4] = self;
    -[CUPairingSession setShowPINHandlerEx:](self->_pairSetupSession, "setShowPINHandlerEx:", v58);
  }

  else
  {
    -[CUPairingSession setFlags:]( self->_pairSetupSession,  "setFlags:",  -[CUPairingSession flags](self->_pairSetupSession, "flags") | 0x80);
  }

  if (self->_hidePasswordHandler)
  {
    v57[0] = v45;
    v57[1] = 3221225472LL;
    v57[2] = __47__RPConnection__serverPairSetupWithData_start___block_invoke_2;
    v57[3] = &unk_18A031A30;
    v57[4] = self;
    -[CUPairingSession setHidePINHandler:](self->_pairSetupSession, "setHidePINHandler:", v57);
  }

  v56[0] = v45;
  v56[1] = 3221225472LL;
  v56[2] = __47__RPConnection__serverPairSetupWithData_start___block_invoke_3;
  v56[3] = &unk_18A032910;
  v56[4] = self;
  -[CUPairingSession setSendDataHandler:](self->_pairSetupSession, "setSendDataHandler:", v56);
  v55[0] = v45;
  v55[1] = 3221225472LL;
  v55[2] = __47__RPConnection__serverPairSetupWithData_start___block_invoke_4;
  v55[3] = &unk_18A031AC0;
  v55[4] = self;
  -[CUPairingSession setCompletionHandler:](self->_pairSetupSession, "setCompletionHandler:", v55);
  -[CUPairingSession activate](self->_pairSetupSession, "activate");
LABEL_90:
  configurePairingHandler = (void (**)(id, CUPairingSession *))self->_configurePairingHandler;
  if (configurePairingHandler) {
    configurePairingHandler[2](configurePairingHandler, self->_pairSetupSession);
  }
  CFDataGetTypeID();
  v47 = CFDictionaryGetTypedValue();
  if (v47)
  {
    v25 = (void *)v47;
    -[CUPairingSession receivedData:](self->_pairSetupSession, "receivedData:", v47);
    goto LABEL_94;
  }

  RPErrorF();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_100:
  if (v48)
  {
    v51 = self->_ucat->var0;
  }

  uint64_t v23 = 1LL;
LABEL_13:
  int v24 = *((_DWORD *)v10 + 2);
  if ((v24 & 0x80000000) == 0)
  {
    if (close(v24) && *__error()) {
      __error();
    }
    *((_DWORD *)v10 + 2) = -1;
  }

  [v10 fileItem];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0LL;
  int v26 = -[RPFileTransferSession _openWriteFileItem:size:truncate:error:]( self,  "_openWriteFileItem:size:truncate:error:",  v25,  [v11 length],  v23,  &v103);
  uint64_t v27 = v103;

  if ((v26 & 0x80000000) != 0)
  {
    queue = (dispatch_queue_s *)self->_dispatchQueue;
    v97[0] = MEMORY[0x1895F87A8];
    v97[1] = 3221225472LL;
    v97[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_2;
    v97[3] = &unk_18A031C78;
    v97[4] = self;
    v62 = (id *)&v98;
    v98 = v10;
    v60 = &v99;
    uint64_t v30 = v27;
    v99 = v30;
    id v31 = &v101;
    uint64_t v32 = v12;
    v101 = v12;
    id v33 = &v100;
    v100 = v11;
    v102 = a5;
    id v34 = v97;
LABEL_29:
    dispatch_async(queue, v34);

    uint64_t v12 = v32;
    goto LABEL_53;
  }

  [v10 setFileFD:v26];
  if ((v23 & 1) == 0)
  {
    v96 = v27;
    uint64_t v28 = -[RPFileTransferSession _truncateFD:size:error:](self, "_truncateFD:size:error:", v26, v19, &v96);
    uint64_t v29 = v96;

    if (v28 && lseek(v26, v19, 0) == -1)
    {
      if (*__error()) {
        __error();
      }
      uint64_t v38 = RPErrorF();

      uint64_t v29 = (id)v38;
    }

    if (v29)
    {
      queue = (dispatch_queue_s *)self->_dispatchQueue;
      v90[0] = MEMORY[0x1895F87A8];
      v90[1] = 3221225472LL;
      v90[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_3;
      v90[3] = &unk_18A031C78;
      v90[4] = self;
      v62 = (id *)&v91;
      v91 = v10;
      v60 = &v92;
      uint64_t v30 = v29;
      v92 = v30;
      id v31 = &v94;
      uint64_t v32 = v12;
      v94 = v12;
      id v33 = &v93;
      v93 = v11;
      v95 = a5;
      id v34 = v90;
      goto LABEL_29;
    }

    uint64_t v27 = 0LL;
  }

  __int16 v39 = (dispatch_queue_s *)self->_dispatchQueue;
  v89[0] = MEMORY[0x1895F87A8];
  v89[1] = 3221225472LL;
  v89[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_4;
  v89[3] = &unk_18A033420;
  v89[4] = self;
  v89[5] = v19;
  v89[6] = v61;
  dispatch_async(v39, v89);

LABEL_32:
  if ((*((_DWORD *)v10 + 2) & 0x80000000) != 0)
  {
    RPErrorF();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (dispatch_queue_s *)self->_dispatchQueue;
    v83[0] = MEMORY[0x1895F87A8];
    v83[1] = 3221225472LL;
    v83[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_5;
    v83[3] = &unk_18A031C78;
    v83[4] = self;
    v84 = v10;
    v85 = v47;
    v87 = v12;
    v86 = v11;
    v88 = a5;
    dispatch_async(v48, v83);

    goto LABEL_53;
  }

  int v40 = [v11 length];
  if (!v40) {
    goto LABEL_36;
  }
  __int16 v41 = [v10 fileFD];
  v42 = v11;
  v82 = 0LL;
  __int16 v43 = -[RPFileTransferSession _writeFD:buffer:size:error:]( self,  "_writeFD:buffer:size:error:",  v41,  [v42 bytes],  v40,  &v82);
  uint64_t v44 = v82;
  if (!v43)
  {
    v58 = (dispatch_queue_s *)self->_dispatchQueue;
    v76[0] = MEMORY[0x1895F87A8];
    v76[1] = 3221225472LL;
    v76[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_6;
    v76[3] = &unk_18A031C78;
    v76[4] = self;
    v77 = v10;
    v78 = v44;
    v80 = v12;
    v79 = v42;
    v81 = a5;
    v36 = v44;
    dispatch_async(v58, v76);

    v37 = v77;
    goto LABEL_52;
  }

  uint64_t v45 = v42;
  CC_SHA256_Update((CC_SHA256_CTX *)(v10 + 12), (const void *)[v45 bytes], objc_msgSend(v45, "length"));

LABEL_36:
  if ((a5 & 2) != 0)
  {
    CC_SHA256_Final(md, (CC_SHA256_CTX *)(v10 + 12));
    [v10 fileItem];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    [v49 sha256HashData];
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if ([v50 length] != 32
      || ((v51 = v50, v52 = (void *)[v51 bytes], *(void *)md == *v52)
        ? (v53 = v112 == v52[1])
        : (v53 = 0),
          v53 ? (v54 = v113 == v52[2]) : (v54 = 0),
          v54 ? (v55 = v114 == v52[3]) : (v55 = 0),
          !v55))
    {
      RPErrorF();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = (dispatch_queue_s *)self->_dispatchQueue;
      v70[0] = MEMORY[0x1895F87A8];
      v70[1] = 3221225472LL;
      v70[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_7;
      v70[3] = &unk_18A031C78;
      v70[4] = self;
      v71 = v10;
      v72 = v56;
      v74 = v12;
      v73 = v11;
      v75 = a5;
      dispatch_async(v57, v70);

      goto LABEL_53;
    }
  }

  v46 = (dispatch_queue_s *)self->_dispatchQueue;
  v63[0] = MEMORY[0x1895F87A8];
  v63[1] = 3221225472LL;
  v63[2] = __81__RPFileTransferSession__largeFileReceiveTaskRun_data_sendFlags_responseHandler___block_invoke_8;
  v63[3] = &unk_18A033538;
  v63[4] = self;
  v67 = v40;
  v68 = a5;
  v69 = (a5 & 2) >> 1;
  v64 = v10;
  v66 = v12;
  v65 = v11;
  dispatch_async(v46, v63);

LABEL_53:
}

  [v11 queue];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPFileTransferSession _ioQueueEnqueue:](self, "_ioQueueEnqueue:", v7);
}

    RPErrorF();
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }

    [v4 UTF8String];
    LogPrintF();
    goto LABEL_25;
  }

  id v8 = v4;
  if (stat((const char *)[v8 UTF8String], &v13))
  {
    if (gLogCategory_RPFileTransferSession > 30)
    {
LABEL_25:
      uint64_t v9 = 0;
      goto LABEL_26;
    }

    if (gLogCategory_RPFileTransferSession == -1)
    {
      uint64_t v9 = 0;
    }

    else
    {
      uint64_t v9 = 0;
    }
  }

  else
  {
    tv_sec = v13.st_mtimespec.tv_sec;
    tv_nsec = v13.st_mtimespec.tv_nsec;
    if (tv_sec == -[RPFileTransferResumeStateItem fileModTime](self, "fileModTime")
      && tv_nsec == -[RPFileTransferResumeStateItem fileModTimeNsec](self, "fileModTimeNsec"))
    {
      if (gLogCategory_RPFileTransferSession > 30)
      {
        uint64_t v9 = 1;
        goto LABEL_26;
      }

      if (gLogCategory_RPFileTransferSession == -1)
      {
        uint64_t v9 = 1;
      }

      else
      {
        uint64_t v9 = 1;
      }
    }

    else
    {
      if (gLogCategory_RPFileTransferSession > 30) {
        goto LABEL_25;
      }
      if (gLogCategory_RPFileTransferSession == -1)
      {
        uint64_t v9 = 0;
      }

      else
      {
        uint64_t v9 = 0;
      }
    }
  }

  [v8 UTF8String];
  LogPrintF();
LABEL_26:

  return v9;
}

    goto LABEL_13;
  }

  if (gLogCategory_RPNearFieldController <= 90
    && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
  {
    -[RPNearFieldController currentTransaction](self, "currentTransaction");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
    goto LABEL_12;
  }

  int v24 = [v15 bytes];
  v25 = *(_DWORD *)v24;
  v70 = *(_WORD *)(v24 + 4);
  v69 = v25;
  address_with_ethernet = nw_endpoint_create_address_with_ethernet();
LABEL_13:
  int v26 = (void *)address_with_ethernet;
  if (!address_with_ethernet) {
    goto LABEL_40;
  }
  if (!v9)
  {
    secure_udp = nw_parameters_create_secure_udp( (nw_parameters_configure_protocol_block_t)*MEMORY[0x189608EB0],  &__block_literal_global_144);
    if (secure_udp)
    {
LABEL_19:
      nw_parameters_set_delegated_unique_pid();
      nw_parameters_set_reuse_local_address(secure_udp, 1);
      nw_parameters_set_local_endpoint(secure_udp, v14);
      evaluator_for_endpoint = (OS_nw_path_evaluator *)nw_path_create_evaluator_for_endpoint();
      nwPathEvaluator = self->_nwPathEvaluator;
      self->_nwPathEvaluator = evaluator_for_endpoint;

      if (self->_nwPathEvaluator)
      {
        nw_path_evaluator_get_client_id();
        id v33 = (NSUUID *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:&v69];
        nwClientID = self->_nwClientID;
        self->_nwClientID = v33;

        NSRandomData();
        uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)&self->_streamKey, v35);
        if (gLogCategory_RPStreamSession <= 30
          && (gLogCategory_RPStreamSession != -1 || _LogCategory_Initialize()))
        {
          streamType = self->_streamType;
          else {
            v37 = off_18A0342D8[streamType];
          }
          v54 = a6;
          v55 = v15;
          v52 = v14;
          v53 = v22;
          v51 = self->_nwClientID;
          trafficFlags = self->_trafficFlags;
          v50 = &unk_1873E83BF;
          streamFlags = self->_streamFlags;
          v48 = &unk_1873E8432;
          streamID = self->_streamID;
          v46 = v37;
          LogPrintF();
        }

        uint64_t v38 = objc_alloc_init(MEMORY[0x189603FC8]);
        __int16 v39 = v38;
        if (v22) {
          [v38 setObject:v22 forKeyedSubscript:@"_streamAddr"];
        }
        if (v58) {
          [v39 setObject:v58 forKeyedSubscript:@"_streamMACAddr"];
        }
        objc_msgSend( v39,  "setObject:forKeyedSubscript:",  v35,  @"_streamKey",  streamID,  v46,  streamFlags,  v48,  trafficFlags,  v50,  v51,  v52,  v53,  v54,  v55);
        [MEMORY[0x189607968] numberWithInt:v56];
        int v40 = (void *)objc_claimAutoreleasedReturnValue();
        [v39 setObject:v40 forKeyedSubscript:@"_streamPort"];

        (*((void (**)(id, void *, void, void))v17 + 2))(v17, v39, 0LL, 0LL);
        goto LABEL_35;
      }

      goto LABEL_39;
    }

LABEL_39:
          if (!self->_stepDone) {
            goto LABEL_64;
          }
          unint64_t v4 = 19;
LABEL_63:
          self->_internalState = v4;
LABEL_64:
          id v17 = self->_internalState;
          uint64_t v18 = self->_ucat->var0;
          if (v18 > 30) {
            goto LABEL_69;
          }
          if (v18 != -1) {
            goto LABEL_67;
          }
          if (_LogCategory_Initialize())
          {
            id v17 = self->_internalState;
LABEL_67:
            uint64_t v19 = _StateToString(internalState);
            uint64_t v20 = _StateToString(v17);
            LogPrintF();
          }

  v42 = RPErrorF();
  __int16 v43 = (void *)v64[5];
  v64[5] = v42;

LABEL_35:
LABEL_36:

  v18[2](v18);
  _Block_object_dispose(&v63, 8);
}

LABEL_69:
          -[RPConnection _updateExternalState](self, "_updateExternalState", v19, v20);
          break;
        case 0x12u:
          -[RPConnection _pskPrepare:](self, "_pskPrepare:", 1LL);
          startTimer = self->_startTimer;
          if (startTimer)
          {
            id v8 = startTimer;
            dispatch_source_cancel(v8);
            uint64_t v9 = self->_startTimer;
            self->_startTimer = 0LL;
          }

          unint64_t v4 = 21;
          goto LABEL_63;
        case 0x13u:
          self->_internalState = 20;
          -[RPConnection _clientStartSession](self, "_clientStartSession");
          goto LABEL_64;
        case 0x14u:
          if (self->_stepError) {
            goto LABEL_31;
          }
          if (!self->_stepDone) {
            goto LABEL_64;
          }
          -[RPConnection _clientStarted](self, "_clientStarted");
          unint64_t v4 = self->_internalState + 1;
          goto LABEL_63;
        case 0x15u:
          if (self->_stepError) {
            goto LABEL_31;
          }
          -[RPConnection _processSends](self, "_processSends");
          goto LABEL_64;
        case 0x16u:
          if (self->_stepError)
          {
            if (!-[RPConnection _clientError:](self, "_clientError:")) {
              goto LABEL_64;
            }
          }

          else
          {
            RPErrorF();
            id v10 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v11 = -[RPConnection _clientError:](self, "_clientError:", v10);

            if (!v11) {
              goto LABEL_64;
            }
          }

          unint64_t v4 = 23;
          goto LABEL_63;
        case 0x17u:
          self->_internalState = 24;
          ++self->_retryCount;
          -[RPConnection _clientRetryStart](self, "_clientRetryStart");
          goto LABEL_64;
        case 0x18u:
          if (self->_retryFired)
          {
            self->_retryFired = 0;
LABEL_38:
            self->_internalState = 10;
          }

          goto LABEL_64;
        default:
          goto LABEL_64;
      }
    }
  }

LABEL_5:
  -[RPConnection _sendFrameType:unencryptedObject:](self, "_sendFrameType:unencryptedObject:", 10LL, v7, v6);
}
}

  if (v5)
  {
    -[RPLegacyDeviceDiscovery _wifiHandleDeviceLost:](self, "_wifiHandleDeviceLost:", v13);
LABEL_14:
  }
}

  id v22 = 0LL;
  if (!v15)
  {
LABEL_6:
    address_with_ethernet = (uint64_t)nw_endpoint_create_address(&a6->var0);
    goto LABEL_13;
  }

LABEL_52:
    self->_pairVerifyFailed = v11 != 0LL;
    if (!v11) {
      goto LABEL_60;
    }
    goto LABEL_53;
  }

  uint64_t v11 = v5;
  self->_pairVerifyFailed = 1;
LABEL_53:
  v58 = self->_ucat->var0;
  if (v58 <= 60 && (v58 != -1 || _LogCategory_Initialize()))
  {
    v61 = (const char *)v11;
    LogPrintF();
  }

  if (!self->_stepError) {
    objc_storeStrong((id *)&self->_stepError, a3);
  }
  -[RPConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate", v61, flags, v63, statusFlags, v65, v66);
LABEL_60:
  v59 = MEMORY[0x1895A4770](self->_pairVerifyCompletion);
  v60 = (void *)v59;
  if (v59) {
    (*(void (**)(uint64_t, id))(v59 + 16))(v59, v11);
  }

  -[RPConnection _run](self, "_run");
}

  v58 = [v5 inDiscoverySession];
  if (self->_inDiscoverySession != v58)
  {
    self->_inDiscoverySession = v58;
    v35 |= 0x400u;
  }

  [v5 contactIdentifier];
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v59;
  if (v59)
  {
    contactID = self->_contactID;
    v62 = v59;
    v63 = contactID;
    if (v62 == v63)
    {

      goto LABEL_62;
    }

    v64 = v63;
    if (v63)
    {
      v65 = -[NSString isEqual:](v62, "isEqual:", v63);

      if ((v65 & 1) != 0) {
        goto LABEL_62;
      }
    }

    else
    {
    }

    objc_storeStrong((id *)&self->_contactID, v60);
    v35 |= 2u;
  }

  CFDictionaryGetCFDataOfLength();
  __int16 v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    btAddress = self->_btAddress;
    p_btAddress = &self->_btAddress;
    v42 = btAddress;
    __int16 v43 = v39;
    uint64_t v44 = v43;
    if (v42 == v43)
    {
    }

    else
    {
      if (v42)
      {
        uint64_t v45 = -[NSData isEqual:](v42, "isEqual:", v43);

        if ((v45 & 1) != 0) {
          goto LABEL_60;
        }
      }

      else
      {
      }

      objc_storeStrong((id *)p_btAddress, v39);
      v11 |= 0x800000u;
    }
  }

LABEL_7:
  if ((self->_flags & 0x4000) == 0)
  {
    var0 = self->_ucat->var0;
    v66[0] = @"_ec";
    v66[1] = @"_em";
    v67[0] = &unk_18A04DEA0;
    v67[1] = @"Non-home access not allowed";
    id v22 = (void *)MEMORY[0x189603F68];
    uint64_t v23 = v67;
    int v24 = v66;
LABEL_39:
    [v22 dictionaryWithObjects:v23 forKeys:v24 count:2];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPConnection _sendFrameType:unencryptedObject:](self, "_sendFrameType:unencryptedObject:", 4LL, v25);
LABEL_94:

LABEL_95:
    v48 = 0LL;
    goto LABEL_96;
  }
}

    objc_msgSend(*(id *)(v2[4] + 112), "invalidate", v5);
    uint64_t v3 = v2[4];
    unint64_t v4 = *(void **)(v3 + 112);
    *(void *)(v3 + 112) = 0LL;

    return (*(uint64_t (**)(void))(v2[5] + 16LL))();
  }

  return result;
}

LABEL_96:
}

LABEL_25:
          if (!v13) {
            goto LABEL_35;
          }
          goto LABEL_26;
        }

        uint64_t v20 = self->_statusFlags & 0xFFFFFFFFFFFF6FFFLL | 0x8000;
      }

      self->_statusFlags = v20;
      goto LABEL_21;
    }

    v13 = v8;
    if (!v8) {
      goto LABEL_35;
    }
  }
}

  *(_DWORD *)(*(void *)(a1[7] + 8LL) + 24LL) |= 0x20u;
  if ((v7 & 1) == 0)
  {
LABEL_12:
    if ((v7 & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
}
}

LABEL_26:
  uint64_t v23 = self->_ucat->var0;
  if (v23 <= 60 && (v23 != -1 || _LogCategory_Initialize()))
  {
    int v24 = self->_pairSetupAuthType;
    else {
      v25 = off_18A032F60[v24];
    }
    int v26 = v25;
    uint64_t v27 = v13;
    LogPrintF();
  }

  -[RPConnection _pairSetupInvalidate](self, "_pairSetupInvalidate", v26, v27);

LABEL_35:
}

  [v4 productVersion];
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  RPStringToOperatingSystemVersion(v29, v38);
  RPModelOSVersionToSourceVersionString();
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    sourceVersion = self->_sourceVersion;
    p_sourceVersion = &self->_sourceVersion;
    id v33 = v30;
    id v34 = sourceVersion;
    if (v33 == v34)
    {
    }

    else
    {
      uint64_t v35 = v34;
      if (v34)
      {
        v36 = -[NSString isEqual:](v33, "isEqual:", v34);

        if ((v36 & 1) != 0) {
          goto LABEL_34;
        }
      }

      else
      {
      }

      objc_storeStrong((id *)p_sourceVersion, v30);
      v12 |= 2u;
    }
  }

  v47 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
  patchVersion = self->_operatingSystemVersion.patchVersion;
  RPNSOperatingSystemVersionToString((uint64_t *)&v47);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    uint64_t v44 = 0LL;
    uint64_t v45 = 0LL;
    v46 = 0LL;
    p_sourceVersion = &self->_sourceVersion;
    if (self->_sourceVersion || !v16) {
      goto LABEL_43;
    }
    goto LABEL_41;
  }

  [v5 operatingSystemVersion];
  if (v44 >= 1)
  {
    [v5 operatingSystemVersion];
    RPNSOperatingSystemVersionToString(v43);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    id v31 = v29;
    uint64_t v32 = v30;
    if (v31 == v32)
    {

      goto LABEL_38;
    }

    id v33 = v32;
    if ((v31 == 0LL) == (v32 != 0LL))
    {
    }

    else
    {
      id v34 = [v31 isEqual:v32];

      if ((v34 & 1) != 0) {
        goto LABEL_38;
      }
    }

    [v5 operatingSystemVersion];
    *(_OWORD *)&self->_operatingSystemVersion.majorVersion = v47;
    self->_operatingSystemVersion.patchVersion = patchVersion;
    v13 |= 2u;
  }

  [v4 model];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = v27;
  if (!v27) {
    goto LABEL_34;
  }
  uint64_t v29 = v14;
  uint64_t v30 = v6;
  model = self->_model;
  uint64_t v32 = v27;
  id v33 = model;
  if (v32 == v33)
  {

    uint64_t v14 = v29;
    goto LABEL_34;
  }

  id v34 = v33;
  if (!v33)
  {

    id v6 = v30;
    uint64_t v14 = v29;
    goto LABEL_33;
  }

  uint64_t v35 = -[NSString isEqual:](v32, "isEqual:", v33);

  id v6 = v30;
  uint64_t v14 = v29;
  if ((v35 & 1) == 0)
  {
LABEL_33:
    objc_storeStrong((id *)&self->_model, v28);
    v48 = 2;
  }

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = v22;
  if (v22 && [v22 length])
  {
    int v24 = self->_model;
    v25 = v23;
    int v26 = v25;
    if (v24 == v25)
    {
    }

    else
    {
      if (v24)
      {
        uint64_t v27 = -[NSString isEqual:](v24, "isEqual:", v25);

        if ((v27 & 1) != 0) {
          goto LABEL_35;
        }
      }

      else
      {
      }

      objc_storeStrong((id *)&self->_model, v23);
      v11 |= 0x80u;
    }
  }

  *(_DWORD *)(*(void *)(a1[7] + 8LL) + 24LL) |= 1u;
  if ((v7 & 2) == 0)
  {
LABEL_13:
    if ((v7 & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }

LABEL_24:
  CFDataGetTypeID();
  uint64_t v19 = CFDictionaryGetTypedValue();
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    -[CUPairingSession receivedData:](self->_pairVerifySession, "receivedData:", v19);

LABEL_26:
    uint64_t v21 = 0LL;
    goto LABEL_27;
  }

  RPErrorF();
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:
  if (v21)
  {
    var0 = self->_ucat->var0;
  }

  int v26 = self->_sourceVersion;
  if (v26)
  {
    uint64_t v27 = v26;
  }

  else
  {
    CFStringGetTypeID();
    uint64_t v28 = CFDictionaryGetTypedValue();
    uint64_t v27 = (void *)v28;
    if (v9 && !v28)
    {
      -[IDSDevice operatingSystemVersion](v9, "operatingSystemVersion");
      RPModelOSVersionToSourceVersionString();
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v27)
    {
      objc_storeStrong((id *)&self->_sourceVersion, v27);
      v12 |= 2u;
    }
  }

  Int64 = CFDictionaryGetInt64();
  statusFlags = self->_statusFlags;
  id v31 = -[IDSDevice supportsApplePay](v9, "supportsApplePay");
  uint64_t v32 = 4LL;
  if (v31) {
    uint64_t v32 = 8388612LL;
  }
  id v33 = (uint64x2_t)vdupq_n_s64(Int64);
  id v34 = vorrq_s8( vandq_s8((int8x16_t)vshlq_u64(v33, (uint64x2_t)xmmword_1873E72C0), (int8x16_t)xmmword_1873E72F0),  vandq_s8((int8x16_t)vshlq_u64(v33, (uint64x2_t)xmmword_1873E72D0), (int8x16_t)xmmword_1873E72E0));
  uint64_t v35 = *(void *)&vorr_s8(*(int8x8_t *)v34.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v34, v34, 8uLL)) | statusFlags & 0xFFFFFFF27EBAF7FBLL | (Int64 >> 2) & 0x800 | (4 * (_DWORD)Int64) & 0x50000 | (Int64 << 11) & 0x400000000LL | ((unint64_t)((v37 & 0x18) != 0LL) << 24) | v32;
  if (v35 != statusFlags)
  {
    self->_statusFlags = v35;
    v12 |= 2u;
  }

  return v12;
}

  [v15 setObject:v21 forKeyedSubscript:@"accountAltDSID"];
  uint64_t v16 = v16 | 0x2000000;
LABEL_25:
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 accountID];
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  v248 = v27;
  if (![v28 length]) {
    goto LABEL_39;
  }
  uint64_t v29 = v28;
  uint64_t v30 = v28;
  id v31 = v27;
  uint64_t v32 = v31;
  if (v30 == v31)
  {
  }

  else
  {
    if ((v31 != 0LL) == (v30 == 0LL))
    {

      if (!v15)
      {
LABEL_33:
        id v34 = (void *)[v9 mutableCopy];
        uint64_t v35 = v34;
        if (v34)
        {
          uint64_t v15 = v34;
        }

        else
        {
          uint64_t v15 = objc_alloc_init(MEMORY[0x189603FC8]);
        }
      }

  if (v8) {
    v13[2](v13, v7);
  }
}

  *(_DWORD *)(*(void *)(a1[7] + 8LL) + 24LL) |= 4u;
  if ((v7 & 0x20) == 0)
  {
LABEL_11:
    if ((v7 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }

LABEL_27:
}

  *(_DWORD *)(*(void *)(a1[7] + 8LL) + 24LL) |= 2u;
  if ((v7 & 0x40) == 0)
  {
LABEL_14:
    if ((v7 & 0x80) == 0) {
      goto LABEL_15;
    }
LABEL_29:
    *(_DWORD *)(*(void *)(a1[7] + 8LL) + 24LL) |= 0x80u;
    if ((v7 & 0x1000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

LABEL_42:
  if (v15)
  {
    uint64_t v45 = self->_ucat->var0;
    ((void (**)(void, id))v13)[2](v13, v15);
  }

LABEL_49:
  _Block_object_dispose(&v71, 8);
}

void sub_18738C158(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

LABEL_66:
  if (v79)
  {
    v64 = self->_ucat->var0;
    (*((void (**)(id, void, void, id))v76 + 2))(v76, 0LL, 0LL, v79);
  }

LABEL_73:
  _Block_object_dispose(&v96, 8);
}

void sub_18738D090( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
}

id RPConnectionLog()
{
  if (RPConnectionLog_onceToken != -1) {
    dispatch_once(&RPConnectionLog_onceToken, &__block_literal_global_1250);
  }
  return (id)RPConnectionLog___logger;
}

LABEL_56:
  if (v70)
  {
    v58 = self->_ucat->var0;
  }

  _Block_object_dispose(&v86, 8);
}

void sub_18738DA5C(_Unwind_Exception *a1)
{
}

LABEL_35:
    uint64_t v11 = "?";
    goto LABEL_36;
  }

  RPErrorF();
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    uint64_t v18 = self->_ucat->var0;
  }

  p_controlCnx = (id *)&v2->_controlCnx;
  if (!-[RPConnection trafficFlags](v2->_controlCnx, "trafficFlags")) {
    return;
  }
  id v17 = v2->_ucat->var0;
  uint64_t v18 = 0LL;
LABEL_43:
  [*p_controlCnx setTrafficFlags:v18];
}

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = v28;
  if (v28 && [v28 length])
  {
    uint64_t v30 = self->_name;
    id v31 = v29;
    uint64_t v32 = v31;
    if (v30 == v31)
    {

      goto LABEL_44;
    }

    if (v30)
    {
      id v33 = -[NSString isEqual:](v30, "isEqual:", v31);

      if ((v33 & 1) != 0) {
        goto LABEL_44;
      }
    }

    else
    {
    }

    objc_storeStrong((id *)&self->_name, v29);
    v11 |= 0x100u;
  }

LABEL_41:
}

  v48 = (unsigned int *)(v10 + 16);
  do
    v49 = __ldaxr(v48);
  while (__stlxr(v49 + 1, v48));
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __61__RPFileTransferSession__largeFileSendTaskSend_data_end_xid___block_invoke;
  block[3] = &unk_18A033498;
  block[4] = self;
  v57 = v10;
  v58 = v12;
  v59 = v11;
  v61 = v7;
  v60 = a6;
  v51 = v11;
  v52 = v10;
  dispatch_async(dispatchQueue, block);
}

const char *RPFrameTypeToString(int a1)
{
  if (a1 > 47)
  {
    if (a1 <= 63)
    {
      if (a1 == 48) {
        return "WatchIdentityRequest";
      }
      if (a1 == 49) {
        return "WatchIdentityResponse";
      }
    }

    else
    {
      switch(a1)
      {
        case '@':
          return "FriendIdentityRequest";
        case 'A':
          return "FriendIdentityResponse";
        case 'B':
          return "FriendIdentityUpdate";
      }
    }

    return "?";
  }

  else
  {
    uint64_t result = "Invalid";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = "NoOp";
        break;
      case 3:
        uint64_t result = "PS_Start";
        break;
      case 4:
        uint64_t result = "PS_Next";
        break;
      case 5:
        uint64_t result = "PV_Start";
        break;
      case 6:
        uint64_t result = "PV_Next";
        break;
      case 7:
        uint64_t result = "U_OPACK";
        break;
      case 8:
        uint64_t result = "E_OPACK";
        break;
      case 9:
        uint64_t result = "P_OPACK";
        break;
      case 10:
        uint64_t result = "PA_Req";
        break;
      case 11:
        uint64_t result = "PA_Rsp";
        break;
      case 16:
        uint64_t result = "SessionStartRequest";
        break;
      case 17:
        uint64_t result = "SessionStartResponse";
        break;
      case 18:
        uint64_t result = "SessionData";
        break;
      case 32:
        uint64_t result = "FamilyIdentityRequest";
        break;
      case 33:
        uint64_t result = "FamilyIdentityResponse";
        break;
      case 34:
        uint64_t result = "FamilyIdentityUpdate";
        break;
      default:
        return "?";
    }
  }

  return result;
}

LABEL_34:
    uint64_t v11 = "?";
    goto LABEL_35;
  }

  if ((_DWORD)var0 == 64)
  {
    uint64_t v11 = "FriendIdentityRequest";
    goto LABEL_35;
  }

  if ((_DWORD)var0 == 65)
  {
    uint64_t v11 = "FriendIdentityResponse";
    goto LABEL_35;
  }

  if ((_DWORD)var0 != 66) {
    goto LABEL_34;
  }
  uint64_t v11 = "FriendIdentityUpdate";
LABEL_35:
  uint64_t v32 = [v8 length];
  uint64_t v30 = v11;
  id v31 = v33;
  uint64_t v29 = var0;
  LogPrintF();
  id v8 = v33;
LABEL_36:
  switch((int)var0)
  {
    case 1:
      goto LABEL_82;
    case 3:
      if (!self->_clientMode)
      {
        id v17 = self;
        uint64_t v18 = v8;
        uint64_t v19 = 1LL;
        goto LABEL_61;
      }

      uint64_t v14 = self->_ucat->var0;
      if (v14 <= 60)
      {
        if (v14 != -1) {
          goto LABEL_80;
        }
        v25 = _LogCategory_Initialize();
        id v8 = v33;
        if (v25) {
          goto LABEL_80;
        }
      }

      goto LABEL_82;
    case 4:
      if (self->_clientMode)
      {
        -[RPConnection _clientPairSetupWithData:](self, "_clientPairSetupWithData:", v8);
      }

      else
      {
        id v17 = self;
        uint64_t v18 = v8;
        uint64_t v19 = 0LL;
LABEL_61:
        -[RPConnection _serverPairSetupWithData:start:]( v17,  "_serverPairSetupWithData:start:",  v18,  v19,  v29,  v30,  v31,  v32);
      }

      goto LABEL_81;
    case 5:
      if (!self->_clientMode)
      {
        uint64_t v20 = self;
        uint64_t v21 = v8;
        id v22 = 1LL;
        goto LABEL_64;
      }

      uint64_t v15 = self->_ucat->var0;
      if (v15 <= 60)
      {
        if (v15 != -1) {
          goto LABEL_80;
        }
        int v26 = _LogCategory_Initialize();
        id v8 = v33;
        if (v26) {
          goto LABEL_80;
        }
      }

      goto LABEL_82;
    case 6:
      if (self->_clientMode)
      {
        -[RPConnection _clientPairVerifyWithData:](self, "_clientPairVerifyWithData:", v8);
      }

      else
      {
        uint64_t v20 = self;
        uint64_t v21 = v8;
        id v22 = 0LL;
LABEL_64:
        -[RPConnection _serverPairVerifyWithData:start:]( v20,  "_serverPairVerifyWithData:start:",  v21,  v22,  v29,  v30,  v31,  v32);
      }

      goto LABEL_81;
    case 8:
    case 12:
      -[RPConnection _receivedHeader:encryptedObjectData:ctx:]( self,  "_receivedHeader:encryptedObjectData:ctx:",  a3,  v33,  a5);
      goto LABEL_81;
    case 10:
      if (!self->_clientMode)
      {
        -[RPConnection _serverPreAuthRequestWithData:](self, "_serverPreAuthRequestWithData:", v8);
        goto LABEL_81;
      }

      uint64_t v16 = self->_ucat->var0;
      if (v16 <= 60)
      {
        if (v16 != -1) {
          goto LABEL_80;
        }
        uint64_t v27 = _LogCategory_Initialize();
        id v8 = v33;
        if (v27) {
          goto LABEL_80;
        }
      }

      goto LABEL_82;
    case 11:
      if (self->_clientMode)
      {
        -[RPConnection _clientPreAuthResponseWithData:](self, "_clientPreAuthResponseWithData:", v8);
LABEL_81:
        id v8 = v33;
        goto LABEL_82;
      }

      uint64_t v23 = self->_ucat->var0;
      if (v23 <= 60)
      {
        if (v23 != -1 || (v28 = _LogCategory_Initialize(), id v8 = v33, v28))
        {
LABEL_80:
          LogPrintF();
          goto LABEL_81;
        }
      }

  return v12;
}

  [v4 name];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (!v36)
  {
LABEL_40:
    uint64_t v44 = v48;
    goto LABEL_43;
  }

  uint64_t v38 = v6;
  name = self->_name;
  int v40 = v36;
  __int16 v41 = name;
  if (v40 == v41)
  {

    id v6 = v38;
    goto LABEL_40;
  }

  v42 = v41;
  v47 = v14;
  if (v41)
  {
    __int16 v43 = -[NSString isEqual:](v40, "isEqual:", v41);

    if ((v43 & 1) != 0)
    {
      id v6 = v38;
      uint64_t v14 = v47;
      goto LABEL_40;
    }
  }

  else
  {
  }

  objc_storeStrong((id *)&self->_name, v37);
  uint64_t v44 = v48 | 0x10;
  id v6 = v38;
  uint64_t v14 = v47;
LABEL_43:
  uint64_t v45 = objc_msgSend(v4, "statusFlags", v47);
  if (v45 != self->_statusFlags)
  {
    self->_statusFlags = v45;
    v44 |= 2u;
  }

  if (v4)
  {
    [v4 operatingSystemVersion];
    if (v51 >= 1)
    {
      [v4 operatingSystemVersion];
      *(_OWORD *)&self->_operatingSystemVersion.majorVersion = v49;
      self->_operatingSystemVersion.patchVersion = v50;
      v44 |= 2u;
    }
  }

  return v44;
}

LABEL_82:
      return;
    default:
      v13 = self->_ucat->var0;
      if (v13 > 60) {
        goto LABEL_82;
      }
      if (v13 == -1)
      {
        int v24 = _LogCategory_Initialize();
        id v8 = v33;
        if (!v24) {
          goto LABEL_82;
        }
      }

      objc_msgSend(v8, "length", v29, v30, v31, v32);
      goto LABEL_80;
  }

LABEL_45:
  v100 = statusFlags;
  if (v102)
  {
    NSDictionaryGetNSUUID();
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      -[RPCompanionLinkDevice setHomeKitIdentifier:](self->_peerDeviceInfo, "setHomeKitIdentifier:", v23);
      -[RPCompanionLinkDevice homeKitIdentifier](self->_peerDeviceInfo, "homeKitIdentifier");
      int v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[RPConnection _identityProofsAddWithHomeKitUUID:](self, "_identityProofsAddWithHomeKitUUID:", v24);
    }

    objc_opt_class();
    NSDictionaryGetNSArrayOfClass();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 && self->_homeKitUserIdentifierHandler)
    {
      -[RPEndpoint setHomeKitUserIdentifiers:](self->_peerDeviceInfo, "setHomeKitUserIdentifiers:", v25);
      int v26 = MEMORY[0x1895A4770](self->_homeKitUserIdentifierHandler);
      statusFlags = v26;
      if (v26) {
        (*(void (**)(uint64_t))(v26 + 16))(v26);
      }

      LODWORD(statusFlags) = v100;
    }

    uint64_t v16 = v102;
  }

  else
  {
    uint64_t v23 = 0LL;
  }

  if (self->_identifierOverride)
  {
    if (v16) {
      goto LABEL_57;
    }
LABEL_66:
    uint64_t v28 = 0;
    uint64_t v27 = 0LL;
    goto LABEL_67;
  }

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[RPEndpoint setIdentifier:](self->_peerDeviceInfo, "setIdentifier:", v29);
    objc_storeStrong((id *)&self->_peerIdentifier, v29);
    id v17 = v29;
  }

  else
  {
    id v17 = 0LL;
  }

  uint64_t v16 = v102;
  if (!v102) {
    goto LABEL_66;
  }
LABEL_57:
  CFStringGetTypeID();
  uint64_t v27 = (id)CFDictionaryGetTypedValue();
  uint64_t v28 = v27 != 0LL;
  if ((statusFlags & 0x80000) == 0 || !v27)
  {
LABEL_67:
    v101 = v27;
    if ((self->_statusFlags & 0x2000) != 0)
    {
      DeviceClass = GestaltGetDeviceClass();
      if (RPDeviceIsCommunal(DeviceClass))
      {
        id v31 = self->_ucat->var0;
        if (v31 <= 30 && (v31 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
          -[RPIdentityDaemon addSharedHomeIdentityWithRPMessage:]( self->_identityDaemon,  "addSharedHomeIdentityWithRPMessage:",  v6,  v101);
        }

        else
        {
          -[RPIdentityDaemon addSharedHomeIdentityWithRPMessage:]( self->_identityDaemon,  "addSharedHomeIdentityWithRPMessage:",  v6,  v94);
        }
      }
    }

    if (v16) {
      goto LABEL_80;
    }
LABEL_92:
    if (!v16) {
      goto LABEL_116;
    }
    goto LABEL_93;
  }

  if (!self->_pairVerifyCompleted || self->_pairVerifyIdentityType == 2)
  {
    uint64_t v28 = 1;
    goto LABEL_67;
  }

  v101 = v27;
  [v6 objectForKeyedSubscript:@"_dIRK"];
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32
    || ([v6 objectForKeyedSubscript:@"_edPK"],
        id v33 = (void *)objc_claimAutoreleasedReturnValue(),
        v33,
        v33))
  {
    id v34 = self->_ucat->var0;
    if (v34 <= 30 && (v34 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[RPIdentityDaemon saveIdentityWithIDSDeviceID:message:error:]( self->_identityDaemon,  "saveIdentityWithIDSDeviceID:message:error:",  v101,  v6,  0LL,  v101);
    }

    else
    {
      -[RPIdentityDaemon saveIdentityWithIDSDeviceID:message:error:]( self->_identityDaemon,  "saveIdentityWithIDSDeviceID:message:error:",  v101,  v6,  0LL,  v94);
    }
  }

  uint64_t v28 = 1;
  if (!v16) {
    goto LABEL_92;
  }
LABEL_80:
  if (!v28) {
    goto LABEL_92;
  }
  if (self->_clientMode)
  {
    -[RPCloudDaemon idsDeviceIDSelf](self->_cloudDaemon, "idsDeviceIDSelf");
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = [v35 isEqual:v101];

    if (v36)
    {
      v37 = self->_ucat->var0;
      -[CUBonjourDevice reconfirm](self->_bonjourPeerDevice, "reconfirm", v94);
      uint64_t v38 = 0;
      goto LABEL_201;
    }
  }

  -[RPEndpoint setIdsDeviceIdentifier:](self->_peerDeviceInfo, "setIdsDeviceIdentifier:", v101, v94);
LABEL_93:
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  __int16 v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39 || v136 == -6756)
  {
    -[RPEndpoint setIdsCorrelationIdentifier:](self->_peerDeviceInfo, "setIdsCorrelationIdentifier:", v39, v94);
  }

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  int v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40 || v136 == -6756)
  {
    -[RPEndpoint setMediaRemoteIdentifier:](self->_peerDeviceInfo, "setMediaRemoteIdentifier:", v40, v94);
  }

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  __int16 v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41 || v136 == -6756)
  {
    -[RPEndpoint setMediaRouteIdentifier:](self->_peerDeviceInfo, "setMediaRouteIdentifier:", v41, v94);
  }

  v42 = NSDictionaryGetNSUUID();

  if (v42 || v136 == -6756)
  {
    -[RPCompanionLinkDevice setMediaSystemIdentifier:](self->_peerDeviceInfo, "setMediaSystemIdentifier:", v42, v94);
    uint64_t v23 = (void *)v42;
  }

  else
  {
    uint64_t v23 = 0LL;
  }

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 || v136 == -6756) {
    -[RPCompanionLinkDevice setMediaSystemName:](self->_peerDeviceInfo, "setMediaSystemName:", v17, v94);
  }
  else {
    id v17 = 0LL;
  }
  __int16 v43 = CFDictionaryGetInt64Ranged();
  if (!v136) {
    -[RPCompanionLinkDevice setMediaSystemRole:](self->_peerDeviceInfo, "setMediaSystemRole:", v43);
  }
  uint64_t v44 = CFDictionaryGetInt64Ranged();
  if (!v136) {
    -[RPCompanionLinkDevice setMediaSystemState:](self->_peerDeviceInfo, "setMediaSystemState:", v44);
  }
LABEL_116:
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45) {
    -[RPEndpoint setModel:](self->_peerDeviceInfo, "setModel:", v45);
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46) {
    -[RPEndpoint setName:](self->_peerDeviceInfo, "setName:", v46);
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v47) {
    goto LABEL_123;
  }
  peerDeviceInfo = self->_peerDeviceInfo;
  if (!peerDeviceInfo)
  {
    v132 = 0LL;
    v133 = 0LL;
    v134 = 0LL;
    goto LABEL_128;
  }

  -[RPEndpoint operatingSystemVersion](peerDeviceInfo, "operatingSystemVersion");
  if (!v132)
  {
LABEL_128:
    RPStringToOperatingSystemVersion(v47, &v130);
    v50 = self->_peerDeviceInfo;
    v128 = v130;
    v129 = v131;
    v51 = &v128;
    goto LABEL_134;
  }

  return v14;
}

  return v7;
}

LABEL_123:
  if (!v28) {
    goto LABEL_135;
  }
  v49 = self->_peerDeviceInfo;
  if (v49)
  {
    -[RPEndpoint operatingSystemVersion](v49, "operatingSystemVersion");
    if (v125) {
      goto LABEL_135;
    }
  }

  else
  {
    v125 = 0LL;
    v126 = 0LL;
    v127 = 0LL;
  }

  cloudDaemon = self->_cloudDaemon;
  if (cloudDaemon)
  {
    -[RPCloudDaemon operatingSystemVersionForID:](cloudDaemon, "operatingSystemVersionForID:", v101);
  }

  else
  {
    v123 = 0uLL;
    v124 = 0LL;
  }

  v50 = self->_peerDeviceInfo;
  v121 = v123;
  v122 = v124;
  v51 = &v121;
LABEL_134:
  -[RPEndpoint setOperatingSystemVersion:](v50, "setOperatingSystemVersion:", v51, v94);
LABEL_135:
  v53 = -[RPEndpoint model](self->_peerDeviceInfo, "model", v94);
  if (v53)
  {
    v54 = (void *)v53;
    v55 = self->_peerDeviceInfo;
    if (v55)
    {
      -[RPEndpoint operatingSystemVersion](v55, "operatingSystemVersion");

      if (v118 >= 1)
      {
        v56 = -[RPEndpoint model](self->_peerDeviceInfo, "model");
        GestaltProductTypeStringToDeviceClass();

        v57 = self->_peerDeviceInfo;
        if (v57)
        {
          -[RPEndpoint operatingSystemVersion](v57, "operatingSystemVersion");
          v58 = self->_peerDeviceInfo;
          if (v58)
          {
            -[RPEndpoint operatingSystemVersion](v58, "operatingSystemVersion");
            v59 = self->_peerDeviceInfo;
            if (v59)
            {
              -[RPEndpoint operatingSystemVersion](v59, "operatingSystemVersion");
LABEL_146:
              LODWORD(v95) = 20200;
              self->_canDecode128bit = DeviceOSVersionAtOrLaterEx();
              goto LABEL_147;
            }

LABEL_145:
            v109 = 0LL;
            v110 = 0LL;
            v111 = 0LL;
            goto LABEL_146;
          }
        }

        else
        {
          v115 = 0LL;
          v116 = 0LL;
          v117 = 0LL;
        }

        v112 = 0LL;
        v113 = 0LL;
        v114 = 0LL;
        goto LABEL_145;
      }
    }

    else
    {
      v118 = 0LL;
      v119 = 0LL;
      v120 = 0LL;
    }
  }

LABEL_147:
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60) {
    -[RPCompanionLinkDevice setPublicIdentifier:](self->_peerDeviceInfo, "setPublicIdentifier:", v60);
  }
  if (v16)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (v61) {
      -[RPCompanionLinkDevice setRoomName:](self->_peerDeviceInfo, "setRoomName:", v61);
    }
    CFArrayGetTypeID();
    CFDictionaryGetTypedValue();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v62;
    if (v62)
    {
      v99 = v23;
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v64 = v62;
      v65 = [v64 countByEnumeratingWithState:&v105 objects:v137 count:16];
      if (v65)
      {
        v66 = v65;
        v67 = *(void *)v106;
        v98 = v7;
        while (2)
        {
          for (uint64_t i = 0LL; i != v66; ++i)
          {
            if (*(void *)v106 != v67) {
              objc_enumerationMutation(v64);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              uint64_t v7 = v98;
              goto LABEL_164;
            }
          }

          v66 = [v64 countByEnumeratingWithState:&v105 objects:v137 count:16];
          uint64_t v7 = v98;
          if (v66) {
            continue;
          }
          break;
        }
      }

      -[RPEndpoint setServiceTypes:](self->_peerDeviceInfo, "setServiceTypes:", v64);
LABEL_164:
      uint64_t v16 = v102;
      uint64_t v23 = v99;
    }

    CFDictionaryGetTypeID();
    CFDictionaryGetTypedValue();
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (v69) {
      -[RPCompanionLinkDevice setSiriInfo:](self->_peerDeviceInfo, "setSiriInfo:", v69);
    }
  }

  else
  {
    v61 = v60;
  }

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  id v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17) {
    -[RPEndpoint setSourceVersion:](self->_peerDeviceInfo, "setSourceVersion:", v17);
  }
  if (v16)
  {
    v70 = CFDictionaryGetInt64();
    if (!v136)
    {
      v71 = v70;
      v72 = v23;
      v73 = v7;
      if ((*(void *)&v100 & 0x80000LL) != 0) {
        v74 = (v70 >> 33) & 0x80;
      }
      else {
        v74 = 0LL;
      }
      v75 = -[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags", v95);
      v76 = v74 | v71 & 0x10000010180LL;
      uint64_t v7 = v73;
      uint64_t v23 = v72;
      -[RPEndpoint setStatusFlags:](self->_peerDeviceInfo, "setStatusFlags:", v76 | v75 & 0xFFFFFEFFFFFEFE7FLL);
    }

    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (v77) {
      -[RPCompanionLinkDevice setActiveUserAltDSID:](self->_peerDeviceInfo, "setActiveUserAltDSID:", v77);
    }
    v78 = CFDictionaryGetInt64Ranged();
    if (!v136) {
      -[RPCompanionLinkDevice setDeviceCapabilityFlags:]( self->_peerDeviceInfo,  "setDeviceCapabilityFlags:",  -[RPCompanionLinkDevice deviceCapabilityFlags](self->_peerDeviceInfo, "deviceCapabilityFlags") & 0xFFFFFFFE | v78 & 1);
    }
  }

  if ((-[RPEndpoint statusFlags](self->_peerDeviceInfo, "statusFlags", v95) & 0x2000000000LL) != 0)
  {
    v79 = objc_alloc_init(&OBJC_CLASS___RPIdentity);
    v80 = -[RPEndpoint verifiedIdentity](self->_peerDeviceInfo, "verifiedIdentity");
    -[RPIdentity setIdentifier:](v79, "setIdentifier:", v80);
    v81 = -[RPEndpoint model](self->_peerDeviceInfo, "model");
    -[RPIdentity setModel:](v79, "setModel:", v81);
    v82 = -[RPEndpoint name](self->_peerDeviceInfo, "name");
    -[RPIdentity setName:](v79, "setName:", v82);

    -[RPIdentityDaemon updateSessionPairedIdentity:](self->_identityDaemon, "updateSessionPairedIdentity:", v79);
    v83 = -[RPEndpoint verifiedIdentity](self->_peerDeviceInfo, "verifiedIdentity");
    -[RPEndpoint setIdsDeviceIdentifier:](self->_peerDeviceInfo, "setIdsDeviceIdentifier:", v83);
    v84 = -[RPEndpoint verifiedIdentity](self->_peerDeviceInfo, "verifiedIdentity");
    -[RPEndpoint setIdentifier:](self->_peerDeviceInfo, "setIdentifier:", v84);
  }

  if (v7)
  {
    if (self->_internalState == 27)
    {
      v103[0] = MEMORY[0x1895F87A8];
      v103[1] = 3221225472LL;
      v103[2] = __40__RPConnection__receivedSystemInfo_xid___block_invoke;
      v103[3] = &unk_18A031A58;
      v103[4] = self;
      v104 = v7;
      v85 = (void (**)(void, void))MEMORY[0x1895A4770](v103);
      sessionStartHandler = (void (**)(id, void))self->_sessionStartHandler;
      if (sessionStartHandler)
      {
        sessionStartHandler[2](sessionStartHandler, v85);
        v87 = self->_sessionStartHandler;
        self->_sessionStartHandler = 0LL;
      }

      else
      {
        v85[2](v85, 0LL);
      }
    }

    else
    {
      v89 = -[RPConnection _systeminfo](self, "_systeminfo");
      LOBYTE(v96) = 0;
      -[RPConnection _sendEncryptedResponse:options:error:xid:requestID:highPriority:isChatty:replyStartTime:]( self,  "_sendEncryptedResponse:options:error:xid:requestID:highPriority:isChatty:replyStartTime:",  v89,  0LL,  0LL,  v7,  @"_systemInfo",  0LL,  v96,  0LL);
    }
  }

  else if (self->_state == 1)
  {
    peerUpdatedHandler = (void (**)(void))self->_peerUpdatedHandler;
    if (peerUpdatedHandler) {
      peerUpdatedHandler[2]();
    }
  }

  v90 = -[RPConnection proxyDeviceUpdateHandler](self, "proxyDeviceUpdateHandler");
  v91 = (void *)v90;
  if (v16 && v90) {
    (*(void (**)(uint64_t))(v90 + 16))(v90);
  }
  v92 = self->_ucat->var0;
  if (v92 <= 10 && (v92 != -1 || _LogCategory_Initialize()))
  {
    v97 = -[RPConnection descriptionWithLevel:](self, "descriptionWithLevel:", 10LL);
    LogPrintF();
  }

  uint64_t v38 = 1;
LABEL_201:

  return v38;
}

LABEL_38:
  if (v5)
  {
    -[RPCompanionLinkDevice homeKitIdentifier](self->_localDeviceInfo, "homeKitIdentifier", v14);
    id v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22) {
      [v3 setObject:v22 forKeyedSubscript:@"_hkID"];
    }
    -[RPEndpoint homeKitUserIdentifiers](self->_localDeviceInfo, "homeKitUserIdentifiers", serviceType);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[RPEndpoint homeKitUserIdentifiers](self->_localDeviceInfo, "homeKitUserIdentifiers");
      int v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setObject:v24 forKeyedSubscript:@"_hkUID"];
    }

    if (self->_btPipe)
    {
      DeviceClass = GestaltGetDeviceClass();
      int v26 = @"BTPipe-Phone";
      if (DeviceClass == 6) {
        int v26 = @"BTPipe-Watch";
      }
      p_isa = v26;

      goto LABEL_48;
    }

    -[RPEndpoint identifier](self->_localDeviceInfo, "identifier");
    p_isa = (NSString *)objc_claimAutoreleasedReturnValue();

    if (p_isa) {
LABEL_48:
    }
      [v3 setObject:p_isa forKeyedSubscript:@"_i"];
  }

  if ((statusFlags & 0x80000) != 0 && self->_pairVerifyCompleted && self->_pairVerifyIdentityType != 2)
  {
    uint64_t v29 = self->_ucat->var0;
LABEL_59:
    LogPrintF();
LABEL_63:
    -[RPIdentityDaemon addSelfIdentityInfoToMessage:flags:]( self->_identityDaemon,  "addSelfIdentityInfoToMessage:flags:",  v3,  0LL,  serviceType);
    goto LABEL_64;
  }

  if ((self->_statusFlags & 0x2000) != 0)
  {
    uint64_t v27 = GestaltGetDeviceClass();
    if (!RPDeviceIsCommunal(v27))
    {
      uint64_t v28 = self->_ucat->var0;
      goto LABEL_59;
    }
  }

  p_sourceVersion = &self->_sourceVersion;
  if (self->_sourceVersion || !v16) {
    goto LABEL_43;
  }
  [v5 operatingSystemVersion];
LABEL_41:
  v36 = RPModelOSVersionToSourceVersionString();
  v37 = *p_sourceVersion;
  *p_sourceVersion = (NSString *)v36;

  if (*p_sourceVersion) {
    v13 |= 2u;
  }
LABEL_43:
  statusFlags = self->_statusFlags;
  __int16 v39 = [v5 supportsApplePay];
  int v40 = 1572864LL;
  if (v39) {
    int v40 = 9961472LL;
  }
  __int16 v41 = v40 | statusFlags;
  if (v41 != statusFlags)
  {
    self->_statusFlags = v41;
    v13 |= 2u;
  }

  return v13;
}

      objc_msgSend(*(id *)(v25 + 168), "addObject:", v22, v33, v34, v35, v36, v37, v38);
      objc_msgSend(*(id *)(a1 + 32), "_metricAddFileSize:", objc_msgSend(v22, "fileSize"));
LABEL_39:

      if (v18 == ++v21)
      {
        uint64_t v32 = [v16 countByEnumeratingWithState:&v43 objects:v51 count:16];
        uint64_t v18 = v32;
        if (!v32) {
          goto LABEL_44;
        }
        goto LABEL_22;
      }
    }
  }

  RPErrorF();
  uint64_t v3 = (char *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  unint64_t v4 = *(id *)(a1 + 40);
  id v5 = [v4 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v48;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v48 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v47 + 1) + 8 * v8);
        id v10 = **(_DWORD **)(*(void *)(a1 + 32) + 152LL);
        if (v10 <= 90 && (v10 != -1 || _LogCategory_Initialize()))
        {
          [v9 itemURL];
          id v33 = (void *)objc_claimAutoreleasedReturnValue();
          id v34 = v3;
          LogPrintF();
        }

        objc_msgSend(v9, "completionHandler", v33, v34);
        uint64_t v11 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          [v9 setCompletionHandler:0];
          ((void (**)(void, char *))v11)[2](v11, v3);
        }

        ++v8;
      }

      while (v6 != v8);
      uint64_t v12 = [v4 countByEnumeratingWithState:&v47 objects:v52 count:16];
      id v6 = v12;
    }

    while (v12);
  }
}

  v28[2] = a4;
  v28[3] = 0LL;
  v28[0] = 0x300000002LL;
  v28[1] = 0LL;
  if (fcntl(v14, 42, v28, v27) && (!*__error() || *__error()))
  {
    int v24 = self->_ucat->var0;
  }

  uint64_t v28 = v29;
LABEL_39:
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 contactID];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v246 = v37;
  v247 = v28;
  v251 = v36;
  if (![v37 length]) {
    goto LABEL_52;
  }
  uint64_t v38 = v37;
  __int16 v39 = v36;
  int v40 = v39;
  if (v38 == v39)
  {

    goto LABEL_52;
  }

  if ((v39 != 0LL) != (v38 == 0LL))
  {
    __int16 v41 = [v38 isEqual:v39];

    if ((v41 & 1) != 0) {
      goto LABEL_52;
    }
    if (v15) {
      goto LABEL_51;
    }
    goto LABEL_47;
  }

  if (!v15)
  {
LABEL_47:
    v42 = (void *)[v9 mutableCopy];
    __int16 v43 = v42;
    if (v42)
    {
      uint64_t v15 = v42;
    }

    else
    {
      uint64_t v15 = objc_alloc_init(MEMORY[0x189603FC8]);
    }
  }

        return v7;
      }
    }

    -[AVVoiceController setRecordDelegate:](voiceController, "setRecordDelegate:", self, v22);
    uint64_t v12 = (void *)[objc_alloc(getAVVCContextSettingsClass()) initWithMode:1969840752 deviceUID:0];
    int v26 = v9;
    uint64_t v27 = 0LL;
    v13 = -[AVVoiceController setContext:streamType:error:]( self->_voiceController,  "setContext:streamType:error:",  v12,  &v27,  &v26);
    uint64_t v14 = v26;

    if (v13)
    {
      self->_streamId = v13;
      if (gLogCategory_RPSiriSession <= 30
        && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
      {
        uint64_t v23 = v13;
        LogPrintF();
      }

      -[AVAudioFormat settings](self->_audioFormat, "settings", v23);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        uint64_t v16 = self->_voiceController;
        streamId = self->_streamId;
        v25 = v14;
        -[AVVoiceController activateAudioSessionForStream:isPrewarm:recordMode:error:]( v16,  "activateAudioSessionForStream:isPrewarm:recordMode:error:",  streamId,  1LL,  1LL,  &v25);
        uint64_t v18 = v25;

        if (gLogCategory_RPSiriSession <= 30
          && (gLogCategory_RPSiriSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }

        uint64_t v19 = (void *)[objc_alloc(getAVVCPrepareRecordSettingsClass()) initWithStreamID:self->_streamId settings:v15 bufferDuration:0.1];
        [v19 setMeteringEnabled:1];
        uint64_t v20 = self->_voiceController;
        int v24 = v18;
        uint64_t v7 = -[AVVoiceController prepareRecordForStream:error:](v20, "prepareRecordForStream:error:", v19, &v24);
        uint64_t v14 = v24;

        if (v14) {
          uint64_t v7 = 0;
        }
        if (a3 && (v7 & 1) == 0)
        {
          RPNestedErrorF();
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
      }

      else if (a3)
      {
        RPErrorF();
        uint64_t v7 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v7 = 0;
      }
    }

    else if (a3)
    {
      RPNestedErrorF();
      uint64_t v7 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v7 = 0;
    }

    uint64_t v9 = v14;
    goto LABEL_38;
  }

  if (!a3) {
    return 0;
  }
  RPErrorF();
  uint64_t v7 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v7;
}

LABEL_64:
  if (v5)
  {
    -[RPEndpoint idsDeviceIdentifier](self->_localDeviceInfo, "idsDeviceIdentifier", v14);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30) {
      [v3 setObject:v30 forKeyedSubscript:@"_idsID"];
    }
    -[RPEndpoint idsCorrelationIdentifier](self->_localDeviceInfo, "idsCorrelationIdentifier", serviceType);
    id v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31) {
      [v3 setObject:v31 forKeyedSubscript:@"_idsCID"];
    }
    uint64_t v32 = -[RPCompanionLinkDevice listeningPort](self->_localDeviceInfo, "listeningPort");
    if ((_DWORD)v32)
    {
      [MEMORY[0x189607968] numberWithInt:v32];
      id v33 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setObject:v33 forKeyedSubscript:@"_lP"];
    }

    -[RPEndpoint mediaRemoteIdentifier](self->_localDeviceInfo, "mediaRemoteIdentifier");
    id v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34) {
      [v3 setObject:v34 forKeyedSubscript:@"_mrID"];
    }
    -[RPEndpoint mediaRouteIdentifier](self->_localDeviceInfo, "mediaRouteIdentifier");
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35) {
      [v3 setObject:v35 forKeyedSubscript:@"_mRtID"];
    }
    v36 = -[RPCompanionLinkDevice mediaSystemIdentifier](self->_localDeviceInfo, "mediaSystemIdentifier");
    if (v36) {
      [v3 setObject:v36 forKeyedSubscript:@"_msId"];
    }
    v37 = -[RPCompanionLinkDevice mediaSystemName](self->_localDeviceInfo, "mediaSystemName");
    if (v37) {
      [v3 setObject:v37 forKeyedSubscript:@"_msNm"];
    }
    uint64_t v38 = -[RPCompanionLinkDevice mediaSystemRole](self->_localDeviceInfo, "mediaSystemRole");
    if ((_DWORD)v38)
    {
      [MEMORY[0x189607968] numberWithInt:v38];
      __int16 v39 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setObject:v39 forKeyedSubscript:@"_msRo"];
    }

    int v40 = -[RPCompanionLinkDevice mediaSystemState](self->_localDeviceInfo, "mediaSystemState");
    if ((_DWORD)v40)
    {
      [MEMORY[0x189607968] numberWithInt:v40];
      __int16 v41 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setObject:v41 forKeyedSubscript:@"_msSt"];
    }

    -[RPCompanionLinkDevice activeUserAltDSID](self->_localDeviceInfo, "activeUserAltDSID");
    p_isa = (NSString *)objc_claimAutoreleasedReturnValue();

    if (p_isa) {
      [v3 setObject:p_isa forKeyedSubscript:@"_aaltDSID"];
    }
    v42 = -[RPCompanionLinkDevice deviceCapabilityFlags](self->_localDeviceInfo, "deviceCapabilityFlags");
    if ((_DWORD)v42)
    {
      [MEMORY[0x189607968] numberWithUnsignedInt:v42];
      __int16 v43 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setObject:v43 forKeyedSubscript:@"_dCapF"];
    }
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", @"model", serviceType);
  uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v44)
  {
    uint64_t v45 = -[RPEndpoint model](self->_localDeviceInfo, "model");

    if (v45)
    {
      [v3 setObject:v45 forKeyedSubscript:@"model"];
      p_isa = (NSString *)v45;
    }

    else
    {
      p_isa = 0LL;
    }
  }

  [v3 objectForKeyedSubscript:@"name"];
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v46)
  {
    v47 = GestaltCopyAnswer();

    if (v47)
    {
      [v3 setObject:v47 forKeyedSubscript:@"name"];
      p_isa = (NSString *)v47;
    }

    else
    {
      p_isa = 0LL;
    }
  }

  localDeviceInfo = self->_localDeviceInfo;
  if (v5)
  {
    if (localDeviceInfo)
    {
      -[RPEndpoint operatingSystemVersion](localDeviceInfo, "operatingSystemVersion");
      localDeviceInfo = self->_localDeviceInfo;
      if (v60 >= 1)
      {
        if (localDeviceInfo) {
          -[RPEndpoint operatingSystemVersion](localDeviceInfo, "operatingSystemVersion");
        }
        else {
          memset(v59, 0, sizeof(v59));
        }
        RPNSOperatingSystemVersionToString(v59);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49) {
          [v3 setObject:v49 forKeyedSubscript:@"_osV"];
        }

        localDeviceInfo = self->_localDeviceInfo;
      }
    }

    else
    {
      v60 = 0LL;
      v61 = 0LL;
      v62 = 0LL;
    }
  }
  v50 = -[RPCompanionLinkDevice publicIdentifier](localDeviceInfo, "publicIdentifier");
  if (v50) {
    [v3 setObject:v50 forKeyedSubscript:@"_pubID"];
  }
  if (v5)
  {
    v51 = -[RPCompanionLinkDevice roomName](self->_localDeviceInfo, "roomName");
    if (v51) {
      [v3 setObject:v51 forKeyedSubscript:@"_roomName"];
    }
    v52 = -[RPEndpoint serviceTypes](self->_localDeviceInfo, "serviceTypes");
    if (v52) {
      [v3 setObject:v52 forKeyedSubscript:@"_stA"];
    }
    v50 = -[RPCompanionLinkDevice siriInfo](self->_localDeviceInfo, "siriInfo");
    if (v50) {
      [v3 setObject:v50 forKeyedSubscript:@"_siriInfo"];
    }
  }

  [v3 setObject:@"630.42.2" forKeyedSubscript:@"_sv"];
  if (self->_pairVerifyIdentityType == 2)
  {
    objc_msgSend( MEMORY[0x189607968],  "numberWithInt:",  -[RPEndpoint activityLevel](self->_localDeviceInfo, "activityLevel"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v53 forKeyedSubscript:@"_actLvl"];
  }

  if (v5)
  {
    v54 = -[RPEndpoint statusFlags](self->_localDeviceInfo, "statusFlags") & 0x10000010100LL;
    if (v54)
    {
      [MEMORY[0x189607968] numberWithUnsignedLongLong:v54];
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 setObject:v55 forKeyedSubscript:@"_sf"];
    }
  }

  if (self->_pairVerifyCompleted && (self->_controlFlags & 0x200) == 0) {
    -[RPConnection _identityProofsAdd:update:](self, "_identityProofsAdd:update:", v3, 0LL);
  }
  v56 = v3;

  return v56;
}

LABEL_18:
      id v10 = v28;
      uint64_t v7 = v29;
    }

    if (!a4 || v16)
    {
      [v16 name];
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      [0 setName:v22];

      [v16 model];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      [0 setModel:v23];

      [v16 edPKData];
      int v24 = (void *)objc_claimAutoreleasedReturnValue();
      [0 setPublicKey:v24];
    }

    else
    {
      RPErrorF();
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return 0LL;
}

  __int16 v39 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
  patchVersion = self->_operatingSystemVersion.patchVersion;
  RPNSOperatingSystemVersionToString((uint64_t *)&v39);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = [v4 productVersion];
  if (!v21) {
    goto LABEL_26;
  }
  id v22 = (void *)v21;
  [v4 productVersion];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  int v24 = v20;
  v25 = v23;
  if (v24 == v25)
  {

    goto LABEL_26;
  }

  int v26 = v25;
  if ((v24 == 0LL) == (v25 != 0LL))
  {

    goto LABEL_25;
  }

  uint64_t v27 = [v24 isEqual:v25];

  if ((v27 & 1) == 0)
  {
LABEL_25:
    [v4 productVersion];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    RPStringToOperatingSystemVersion(v28, &v39);
    *(_OWORD *)&self->_operatingSystemVersion.majorVersion = v39;
    self->_operatingSystemVersion.patchVersion = patchVersion;

    v12 |= 2u;
  }

  [v5 name];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = v22;
  if (!v22) {
    goto LABEL_26;
  }
  name = self->_name;
  v25 = v22;
  int v26 = name;
  if (v25 == v26)
  {

    goto LABEL_26;
  }

  uint64_t v27 = v26;
  if (!v26)
  {

    goto LABEL_25;
  }

  uint64_t v28 = -[NSString isEqual:](v25, "isEqual:", v26);

  if ((v28 & 1) == 0)
  {
LABEL_25:
    objc_storeStrong((id *)&self->_name, v23);
    v13 |= 0x10u;
  }

  [v4 idsDeviceIdentifier];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = v20;
  if (!v20) {
    goto LABEL_26;
  }
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  uint64_t v23 = v20;
  int v24 = idsDeviceIdentifier;
  if (v23 == v24)
  {

    goto LABEL_26;
  }

  v25 = v24;
  if (!v24)
  {

    goto LABEL_25;
  }

  int v26 = -[NSString isEqual:](v23, "isEqual:", v24);

  if ((v26 & 1) == 0)
  {
LABEL_25:
    objc_storeStrong((id *)&self->_idsDeviceIdentifier, v21);
    v48 = 2;
  }

    uint64_t v16 = 0LL;
    goto LABEL_7;
  }

  uint64_t v14 = [objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:v6];
  stateInfo = v8->_stateInfo;
  v8->_stateInfo = (NSMutableDictionary *)v14;

  uint64_t v16 = v8;
LABEL_7:

LABEL_9:
  return v16;
}

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    uint64_t v18 = self->_idsDeviceID;
    uint64_t v19 = v17;
    uint64_t v20 = v19;
    if (v18 == v19)
    {
    }

    else
    {
      if (v18)
      {
        uint64_t v21 = -[NSString isEqual:](v18, "isEqual:", v19);

        if ((v21 & 1) != 0) {
          goto LABEL_26;
        }
      }

      else
      {
      }

      objc_storeStrong((id *)&self->_idsDeviceID, v17);
      v11 |= 0x40u;
    }
  }

  if (self->_needsSetup)
  {
    uint64_t v15 = SNPrintF();
    if (v15 > 255) {
      goto LABEL_54;
    }
    uint64_t v14 = TXTRecordSetValue(&txtRecord, "rpDA", v15, value);
    if (v14) {
      goto LABEL_49;
    }
  }

  if (!self->_bonjourAdvertiser)
  {
    uint64_t v14 = -6762;
    goto LABEL_49;
  }

  TXTRecordGetBytesPtr(&txtRecord);
  TXTRecordGetLength(&txtRecord);
  if (gLogCategory_RPLegacySupport <= 20
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  uint64_t v14 = BonjourAdvertiserSetTXTRecord();
  if (v14)
  {
LABEL_49:
    if (gLogCategory_RPLegacySupport <= 60
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

  TXTRecordDeallocate(&txtRecord);
  return v14;
}

Class initMCProfileConnection()
{
  if (ManagedConfigurationLibrary_sOnce != -1) {
    dispatch_once(&ManagedConfigurationLibrary_sOnce, &__block_literal_global_4);
  }
  Class result = objc_getClass("MCProfileConnection");
  classMCProfileConnection = (uint64_t)result;
  getMCProfileConnectionClass = (uint64_t (*)())MCProfileConnectionFunction;
  return result;
}

id MCProfileConnectionFunction()
{
  return (id)classMCProfileConnection;
}

void *__ManagedConfigurationLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 2);
  ManagedConfigurationLibrary_sLib = (uint64_t)result;
  return result;
}

id initValMCFeatureRemoteAppPairingAllowed()
{
  if (ManagedConfigurationLibrary_sOnce != -1) {
    dispatch_once(&ManagedConfigurationLibrary_sOnce, &__block_literal_global_4);
  }
  v0 = (id *)dlsym((void *)ManagedConfigurationLibrary_sLib, "MCFeatureRemoteAppPairingAllowed");
  if (v0) {
    objc_storeStrong((id *)&constantValMCFeatureRemoteAppPairingAllowed, *v0);
  }
  getMCFeatureRemoteAppPairingAllowed[0] = (uint64_t (*)())MCFeatureRemoteAppPairingAllowedFunction;
  return (id)constantValMCFeatureRemoteAppPairingAllowed;
}

id MCFeatureRemoteAppPairingAllowedFunction()
{
  return (id)constantValMCFeatureRemoteAppPairingAllowed;
}

id initValMCFeatureTVRemoteAllowedRemotes()
{
  if (ManagedConfigurationLibrary_sOnce != -1) {
    dispatch_once(&ManagedConfigurationLibrary_sOnce, &__block_literal_global_4);
  }
  v0 = (id *)dlsym((void *)ManagedConfigurationLibrary_sLib, "MCFeatureTVRemoteAllowedRemotes");
  if (v0) {
    objc_storeStrong((id *)&constantValMCFeatureTVRemoteAllowedRemotes, *v0);
  }
  getMCFeatureTVRemoteAllowedRemotes = (uint64_t (*)())MCFeatureTVRemoteAllowedRemotesFunction;
  return (id)constantValMCFeatureTVRemoteAllowedRemotes;
}

id MCFeatureTVRemoteAllowedRemotesFunction()
{
  return (id)constantValMCFeatureTVRemoteAllowedRemotes;
}

void __RPConnectionLog_block_invoke()
{
  uint64_t v0 = LogCategoryCopyOSLogHandle();
  uint64_t v1 = (void *)RPConnectionLog___logger;
  RPConnectionLog___logger = v0;
}

void sub_1873960F0(_Unwind_Exception *a1)
{
}

void sub_1873961C0(_Unwind_Exception *a1)
{
}

void sub_187396270(_Unwind_Exception *a1)
{
}

void sub_187396330(_Unwind_Exception *a1)
{
}

LABEL_62:
  if (self->_mediaRemoteIdentifier)
  {
    v66 = v129;
  }

  else
  {
    [v5 mediaRemoteID];
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (v67)
    {
      objc_storeStrong((id *)&self->_mediaRemoteIdentifier, v67);
      v35 |= 2u;
    }

    v66 = v129;
  }

  if (self->_mediaRouteIdentifier)
  {
    v122 = (v128 & 0x400) == 0;
  }

  else
  {
    [v5 mediaRouteID];
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (v68)
    {
      objc_storeStrong((id *)&self->_mediaRouteIdentifier, v68);
      v35 |= 2u;
    }

    if (self->_mediaRouteIdentifier || (v128 & 0x400) == 0)
    {
      v122 = (v128 & 0x400) == 0;
    }

    else
    {
      [v5 rapportIdentifier];
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (v69)
      {
        objc_storeStrong((id *)&self->_mediaRouteIdentifier, v69);
        v35 |= 2u;
      }

      v122 = 0;
    }
  }

  v70 = self->_model;
  if (v70)
  {
    v71 = (__CFString *)v70;
    goto LABEL_82;
  }

  [v5 model];
  v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v71) {
    goto LABEL_81;
  }
  -[IDSDevice modelIdentifier](v66, "modelIdentifier");
  v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v71) {
    goto LABEL_81;
  }
  if ([v5 deviceClassCode] == 4)
  {
    if ([v5 deviceModelCode] == 5)
    {
      v71 = @"AudioAccessory5,1";
    }

    else if ([v5 deviceModelCode] == 6)
    {
      v71 = @"AudioAccessory6,1";
    }

    else
    {
      v71 = @"AudioAccessory1,1";
    }

LABEL_81:
    objc_storeStrong((id *)&self->_model, v71);
    v35 |= 2u;
    goto LABEL_82;
  }

  v71 = 0LL;
LABEL_82:
  [v5 name];
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v72;
  if (!v72) {
    goto LABEL_90;
  }
  name = self->_name;
  v75 = v72;
  v76 = name;
  if (v75 == v76)
  {

    v66 = v129;
    goto LABEL_90;
  }

  v77 = v76;
  if (!v76)
  {

    v66 = v129;
    goto LABEL_89;
  }

  v78 = -[NSString isEqual:](v75, "isEqual:", v76);

  v66 = v129;
  if ((v78 & 1) == 0)
  {
LABEL_89:
    objc_storeStrong((id *)&self->_name, v73);
    v35 |= 0x10u;
  }

LABEL_90:
  v131 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
  patchVersion = self->_operatingSystemVersion.patchVersion;
  v79 = RPNSOperatingSystemVersionToString((uint64_t *)&v131);
  v127 = v6;
  v123 = (void *)v79;
  if (!v66) {
    goto LABEL_102;
  }
  v80 = (void *)v79;
  -[IDSDevice operatingSystemVersion](v66, "operatingSystemVersion");
  if (v130[3] >= 1)
  {
    -[IDSDevice operatingSystemVersion](v66, "operatingSystemVersion");
    RPNSOperatingSystemVersionToString(v130);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v80;
    v83 = v81;
    if (v82 == v83)
    {

      goto LABEL_99;
    }

    v84 = v83;
    if ((v82 == 0LL) == (v83 != 0LL))
    {
    }

    else
    {
      v85 = [v82 isEqual:v83];

      if ((v85 & 1) != 0)
      {
        v66 = v129;
        goto LABEL_99;
      }
    }

    v66 = v129;
    -[IDSDevice operatingSystemVersion](v129, "operatingSystemVersion");
    *(_OWORD *)&self->_operatingSystemVersion.majorVersion = v131;
    self->_operatingSystemVersion.patchVersion = patchVersion;
    v35 |= 2u;
  }

LABEL_99:
  if (!self->_sourceVersion)
  {
    -[IDSDevice operatingSystemVersion](v66, "operatingSystemVersion");
    RPModelOSVersionToSourceVersionString();
    v86 = (NSString *)objc_claimAutoreleasedReturnValue();
    sourceVersion = self->_sourceVersion;
    self->_sourceVersion = v86;

    if (self->_sourceVersion) {
      v35 |= 2u;
    }
  }

LABEL_102:
  statusFlags = self->_statusFlags;
  v89 = [v5 deviceActionType];
  v90 = -[IDSDevice supportsApplePay](v66, "supportsApplePay");
  v91 = 2LL;
  if (v90) {
    v91 = 8388610LL;
  }
  v92 = statusFlags & 0xFFFFFF7FF7DFFEFDLL | v91 & 0xFFFFFF7FFFFFFFFFLL | ((((unint64_t)(v128 & 0x80) >> 7) & 1) << 39);
  if ((v128 & 8) != 0 && v89 == 28) {
    v94 = 0x200000LL;
  }
  else {
    v94 = 0LL;
  }
  v95 = [v5 duetSync];
  v96 = 256LL;
  if (!v95) {
    v96 = 0LL;
  }
  v97 = v92 | v94 | v96 | ((unint64_t)(v89 == 29) << 27);
  [v5 bleDevice];
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  [v98 advertisementFields];
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = CFDictionaryGetInt64Ranged();

  if (!v133) {
    v97 = v97 & 0xFFFFFFFFFFFFFDFFLL | ((unint64_t)(v100 != 0LL) << 9);
  }
  v101 = v97 & 0xFFFFFFFFBFFFFFFFLL | ((unint64_t)(v89 == 34) << 30);
  v102 = v71;
  v103 = -[__CFString hasPrefix:](v102, "hasPrefix:", @"AppleTV");

  v104 = v101 | 0x50800;
  if (!v103) {
    v104 = v101;
  }
  if ((v128 & 8) != 0) {
    v104 |= 0x80000uLL;
  }
  v105 = v104 | (v128 << 13) & 0x4000 | (((v128 >> 2) & 1) << 17);
  if (!v122) {
    v105 |= 0x8000uLL;
  }
  v106 = (v128 << 7) & 0x2000LL | ((unint64_t)(((unsigned __int16)(v128 & 0xC000) >> 8) >> 6) << 36) | v105;
  [v5 bleDevice];
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  [v107 advertisementFields];
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  Int64 = CFDictionaryGetInt64();

  v110 = v106 | 0x80;
  if (!Int64) {
    v110 = v106;
  }
  if (v110 == statusFlags)
  {
    v111 = v127;
    v112 = v35;
  }

  else
  {
    self->_statusFlags = v110;
    v112 = v35 | 2;
    v111 = v127;
  }

  v113 = [v5 distance];
  if (v113 >= 21) {
    v114 = 30;
  }
  else {
    v114 = 20;
  }
  if (v113 < 11) {
    v114 = 10;
  }
  if (v114 != self->_proximity)
  {
    self->_proximity = v114;
    v112 |= 0x80u;
  }

  [v5 bleDevice];
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = [v115 rssi];
  v117 = -[SFDevice bleDevice](v111, "bleDevice");
  v118 = [v117 rssi];

  if (v116 == v118 || v116 == 0) {
    v120 = v112;
  }
  else {
    v120 = v112 | 0x20;
  }

  return v120;
}

LABEL_61:
  return v6;
}

LABEL_23:
  return v31;
}

    uint64_t v15 = 0;
    goto LABEL_21;
  }

  st_size = v20.st_size;
  [v6 setFileSize:v20.st_size];
  [v6 metadata];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12) {
    v13 = OPACKEstimateEncodedSize();
  }
  else {
    v13 = 0LL;
  }
  [v6 setMetadataSize:v13];
  uint64_t v14 = st_size + v13;
  if (__CFADD__(st_size, v13)
    || (uint64_t v16 = v14 + 200, v17 = v14 >= 0xFFFFFFFFFFFFFF38LL, (v18 = v17 << 63 >> 63, v18 ^ v17) || v18 < 0))
  {
    if (a4)
    {
      RPErrorF();
      uint64_t v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v15 = 0;
    }
  }

  else
  {
    [v6 setEstimatedSize:v16];
    uint64_t v15 = 1;
  }

LABEL_21:
  return v15;
}

  [v10 fileItem];
  id v33 = (void *)objc_claimAutoreleasedReturnValue();
  id v34 = v33;
  if ((v10[32] & 1) == 0)
  {
    [v33 filename];
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35) {
      [v12 setObject:v35 forKeyedSubscript:&unk_18A04DFA8];
    }

    v36 = [v34 fileSize];
    if (v36)
    {
      [MEMORY[0x189607968] numberWithLongLong:v36];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 setObject:v37 forKeyedSubscript:&unk_18A04DFC0];
    }

    [v34 metadata];
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38) {
      [v12 setObject:v38 forKeyedSubscript:&unk_18A04DFD8];
    }

    __int16 v39 = [v10 fileOffset];
    if (v39)
    {
      [MEMORY[0x189607968] numberWithUnsignedLongLong:v39];
      int v40 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 setObject:v40 forKeyedSubscript:@"_fOff"];
    }

    __int16 v41 = [v34 itemURL];
    v42 = [v41 fileSystemRepresentation];

    v62 = 0LL;
    -[RPFileTransferSession _modTimeForFileWithPath:error:](self, "_modTimeForFileWithPath:error:", v42, &v62);
    __int16 v43 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v44 = v62;
    if (v43) {
      [v12 addEntriesFromDictionary:v43];
    }
    *((_DWORD *)v10 + 8) |= 1u;

    if (!v7)
    {
      uint64_t v45 = 1LL;
      goto LABEL_40;
    }

    uint64_t v45 = 3LL;
LABEL_38:
    CC_SHA256_Final(md, (CC_SHA256_CTX *)(v10 + 36));
    v46 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytes:md length:32];
    [v34 setSha256HashData:v46];
    [v12 setObject:v46 forKeyedSubscript:@"_s2"];
    *((_DWORD *)v10 + 8) |= 2u;

LABEL_40:
    [MEMORY[0x189607968] numberWithUnsignedInt:v45];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setObject:v47 forKeyedSubscript:&unk_18A04DFF0];

    goto LABEL_41;
  }

  if (v7)
  {
    uint64_t v45 = 2LL;
    goto LABEL_38;
  }

  uint64_t v7 = v9;
  if (v9)
  {
    RPErrorF();
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v8);

    uint64_t v7 = v9;
  }
}

LABEL_58:
    self->_prefLargeFileMaxOutstanding = v20;
  }

  uint64_t v23 = CFPrefs_GetInt64();
  if (v23 <= 0x989680 && v23 != 0 && v47 == 0) {
    int v26 = v23;
  }
  else {
    int v26 = 0x100000LL;
  }
  prefSmallFilesMaxBytes = self->_prefSmallFilesMaxBytes;
  if (v26 != prefSmallFilesMaxBytes)
  {
    uint64_t v28 = self->_ucat->var0;
    if (v28 <= 30)
    {
      if (v28 == -1)
      {
        prefSmallFilesMaxBytes = self->_prefSmallFilesMaxBytes;
      }

      uint64_t v44 = prefSmallFilesMaxBytes;
      v46 = v26;
      LogPrintF();
    }

LABEL_73:
    self->_prefSmallFilesMaxBytes = v26;
  }

  uint64_t v29 = CFPrefs_GetInt64();
  if (!-[RPFileTransferSession maxSmallFileTasks](self, "maxSmallFileTasks"))
  {
    if (v29 <= 0x3E8 && v29 != 0 && v47 == 0) {
      uint64_t v32 = v29;
    }
    else {
      uint64_t v32 = 3LL;
    }
    -[RPFileTransferSession setMaxSmallFileTasks:](self, "setMaxSmallFileTasks:", v32, v44, v46);
  }

  id v33 = CFPrefs_GetInt64();
  if (v47) {
    id v34 = 1;
  }
  else {
    id v34 = v33 == 0;
  }
  uint64_t v35 = !v34;
  if (self->_resumable != v35)
  {
    v36 = self->_ucat->var0;
    self->_resumable = v35;
    if (v35) {
      v37 = 512;
    }
    else {
      v37 = 0;
    }
    self->_flags = self->_flags & 0xFFFFFDFF | v37;
  }

  CFPrefs_GetDouble();
  if (v38 <= 60.0 && v38 > 0.001 && v47 == 0) {
    __int16 v41 = v38;
  }
  else {
    __int16 v41 = 1.0;
  }
  if (v41 != self->_resumeStateFlushInterval)
  {
    v42 = self->_ucat->var0;
    self->_resumeStateFlushInterval = v41;
  }

void sub_18739D49C(_Unwind_Exception *a1)
{
}

LABEL_28:
  if (v8)
  {
    uint64_t v14 = v2->_flags;
    if ((v14 & 1) == 0 && v2->_peerInfraWiFiDisabled)
    {
      if ((v14 & 2) == 0) {
        return;
      }
      uint64_t v15 = v2->_ucat->var0;
      p_controlCnx = (id *)&v2->_controlCnx;
      uint64_t v18 = 1024LL;
      goto LABEL_43;
    }
  }

  *(_DWORD *)(*(void *)(a1[7] + 8LL) + 24LL) |= 0x40u;
  if ((v7 & 0x80) != 0) {
    goto LABEL_29;
  }
LABEL_15:
  if ((v7 & 0x1000) != 0) {
LABEL_16:
  }
    *(_DWORD *)(*(void *)(a1[7] + 8LL) + 24LL) |= 0x100u;
LABEL_17:
  id v8 = [v11 proximity];
  if (v8)
  {
    uint64_t v9 = *(void *)(a1[8] + 8LL);
    id v10 = *(_DWORD *)(v9 + 24);
    if (!v10 || v8 < v10) {
      *(_DWORD *)(v9 + 24) = v8;
    }
  }
}

void sub_18739D7EC(_Unwind_Exception *a1)
{
}

LABEL_8:
  uint64_t v14 = objc_alloc_init(MEMORY[0x18960EDB0]);
  objc_storeStrong((id *)&self->_tcpServer, v14);
  [v14 setDispatchQueue:self->_dispatchQueue];
  [v14 setFlags:9];
  [v14 setLabel:@"RPFile"];
  -[CUTCPServer setConnectionPrepareHandler:]( self->_tcpServer,  "setConnectionPrepareHandler:",  &__block_literal_global_7);
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __55__RPFileTransferSession__activateTargetAndReturnError___block_invoke_2;
  v23[3] = &unk_18A033270;
  v23[4] = v14;
  v23[5] = self;
  -[CUTCPServer setConnectionStartedHandler:](self->_tcpServer, "setConnectionStartedHandler:", v23);
  tcpServer = self->_tcpServer;
  id v22 = 0LL;
  -[CUTCPServer activateDirectAndReturnError:](tcpServer, "activateDirectAndReturnError:", &v22);
  uint64_t v16 = v22;
  id v17 = v16 == 0LL;
  if (v16)
  {
    if (a3)
    {
      RPNestedErrorF();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    uint64_t v18 = objc_alloc_init(MEMORY[0x18960ED18]);
    objc_storeStrong((id *)&self->_bonjourAdvertiser, v18);
    if ((self->_flags & 0x10) == 0) {
      [v18 setAdvertiseFlags:0x100000];
    }
    objc_msgSend(v18, "setDispatchQueue:", self->_dispatchQueue, v21);
    [v18 setDomain:@"local."];
    [v18 setLabel:@"RPFile"];
    [v18 setName:self->_targetID];
    objc_msgSend(v18, "setPort:", -[CUTCPServer tcpListeningPort](self->_tcpServer, "tcpListeningPort"));
    [v18 setServiceType:@"_rpft._tcp"];
    int v24 = @"rpBA";
    v25[0] = self->_targetID;
    [MEMORY[0x189603F68] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setTxtDictionary:v19];

    [v18 activate];
  }

  return v17;
}

  uint64_t v15 = 1;
LABEL_202:

  return v15;
}
}

    id v6 = "?";
    goto LABEL_11;
  }

  if (!discoveryMode)
  {
    id v6 = "~";
    goto LABEL_11;
  }

  if (discoveryMode != 1) {
    goto LABEL_8;
  }
  id v6 = "PTS";
LABEL_11:
  changeFlags = self->_changeFlags;
  discoveryFlags = self->_discoveryFlags;
  uint64_t v16 = v6;
  NSAppendPrintF();
  objc_storeStrong(&v31, v25);
  if (a3 <= 30)
  {
    uint64_t v7 = v27 + 5;
    obj = v27[5];
    id v8 = -[NSMutableDictionary count]( self->_discoveredPeople,  "count",  v16,  discoveryFlags,  &unk_1873E7758,  changeFlags,  &unk_1873E77C7);
    peopleDensity = self->_peopleDensity;
    if (peopleDensity < 1)
    {
      id v10 = "None";
    }

    else if (peopleDensity >= 0xB)
    {
      id v10 = peopleDensity >= 0x33 ? "High" : "Med";
    }

    else
    {
      id v10 = "Low";
    }

    id v17 = v8;
    uint64_t v19 = v10;
    NSAppendPrintF();
    objc_storeStrong(v7, obj);
    if (a3 <= 20)
    {
      uint64_t v11 = v27;
      uint64_t v23 = v27[5];
      NSAppendPrintF();
      objc_storeStrong(v11 + 5, v23);
      if (a3 >= 11) {
        uint64_t v12 = 50;
      }
      else {
        uint64_t v12 = 30;
      }
      discoveredPeople = self->_discoveredPeople;
      v21[0] = MEMORY[0x1895F87A8];
      v21[1] = 3221225472LL;
      v21[2] = __42__RPPeopleDiscovery_descriptionWithLevel___block_invoke;
      v21[3] = &unk_18A033A60;
      v21[4] = &v26;
      id v22 = v12;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( discoveredPeople,  "enumerateKeysAndObjectsUsingBlock:",  v21,  v17,  v19);
    }
  }

  uint64_t v14 = v27[5];
  _Block_object_dispose(&v26, 8);

  return v14;
}

  return v5;
}

void sub_18739FBD0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1873A15BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35)
{
}

LABEL_31:
}

LABEL_36:
LABEL_37:
  v35[2](v35);

  _Block_object_dispose(&v57, 8);
}

        LogPrintF();
        goto LABEL_47;
      }

      uint64_t v9 = (const char *)[v8 UTF8String];
      id v10 = strlen(v9);
      if (v10 >= 0x100)
      {
        if (gLogCategory_RPLegacySupport <= 90
          && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }

        uint64_t v14 = -6743;
        goto LABEL_48;
      }

      uint64_t v11 = v10;
LABEL_12:
      uint64_t v12 = TXTRecordSetValue(&txtRecord, (const char *)[v7 UTF8String], v11, v9);
      if (v12)
      {
        uint64_t v14 = v12;
        if (gLogCategory_RPLegacySupport <= 90
          && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }

        goto LABEL_48;
      }
    }

    unint64_t v4 = -[NSDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v18,  v22,  16LL);
    if (v4) {
      continue;
    }
    break;
  }

void sub_1873A3050( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, char a45)
{
}

LABEL_19:
  return v18;
}

  if (a4 < 1) {
    goto LABEL_45;
  }
  if (fcntl(v14, 48, 1LL))
  {
    if (*__error())
    {
      uint64_t v20 = *__error();
      if (!(_DWORD)v20) {
        goto LABEL_29;
      }
    }

    else
    {
      uint64_t v20 = 4294960596LL;
    }

    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      int v26 = v20;
      LogPrintF();
    }
  }

void sub_1873A35BC(_Unwind_Exception *a1)
{
}

LABEL_17:
  v8[2](v8);
  _Block_object_dispose(&v41, 8);
}

void sub_1873A4228(_Unwind_Exception *a1)
{
}

void sub_1873A596C(_Unwind_Exception *a1)
{
}

void sub_1873A6908( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
}

void sub_1873A6EDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1873A710C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_1873A7E0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

LABEL_4:
    [v6 UTF8String];
LABEL_5:
    LogPrintF();
LABEL_34:
    uint64_t v14 = 0;
    goto LABEL_35;
  }

  [MEMORY[0x1896078A8] defaultManager];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 fileExistsAtPath:v6];

  if ((v12 & 1) == 0)
  {
    if (gLogCategory_RPFileTransferSession > 30
      || gLogCategory_RPFileTransferSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_34;
    }

    goto LABEL_4;
  }

  v13 = v6;
  if (stat((const char *)[v13 UTF8String], &v16))
  {
    if (gLogCategory_RPFileTransferSession > 30
      || gLogCategory_RPFileTransferSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_34;
    }

    goto LABEL_11;
  }

  if (v16.st_size < v10)
  {
    if (gLogCategory_RPFileTransferSession > 30
      || gLogCategory_RPFileTransferSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_34;
    }

CFStringRef RPNearFieldTransactionStateDescription(uint64_t a1)
{
  uint64_t v1 = @"Connected";
  if (a1 == 1) {
    uint64_t v1 = @"Interrupted";
  }
  if (a1 == 2) {
    return @"Exchange Completed";
  }
  else {
    return v1;
  }
}

LABEL_44:
  CFDictionaryGetCFDataOfLength();
  id v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v34) {
    goto LABEL_52;
  }
  uint64_t v35 = self->_btIRKData;
  v36 = v34;
  v37 = v36;
  if (v35 == v36)
  {

    goto LABEL_52;
  }

  if (!v35)
  {

    goto LABEL_51;
  }

  uint64_t v38 = -[NSData isEqual:](v35, "isEqual:", v36);

  if ((v38 & 1) == 0)
  {
LABEL_51:
    objc_storeStrong((id *)&self->_btIRKData, v34);
    v11 |= 0x400000u;
  }

LABEL_60:
  return v11;
}

LABEL_63:
  [v15 setObject:v46 forKeyedSubscript:@"dateAck"];
  uint64_t v16 = v16 | 2;
LABEL_64:
  v52 = [v8 dateAdded];
  v237 = (void *)v52;
  if (!v52) {
    goto LABEL_79;
  }
  v53 = (void *)v52;
  CFDateGetTypeID();
  CFDictionaryGetTypedValue();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v53;
  v56 = v54;
  v57 = v56;
  if (v55 != v56)
  {
    v58 = v46;
    if (v56)
    {
      v59 = [v55 isEqual:v56];

      if ((v59 & 1) != 0)
      {
LABEL_77:
        v46 = v58;
        goto LABEL_78;
      }

      if (!v15) {
        goto LABEL_72;
      }
    }

    else
    {

      if (!v15)
      {
LABEL_72:
        v60 = (void *)[v9 mutableCopy];
        v61 = v60;
        if (v60)
        {
          uint64_t v15 = v60;
        }

        else
        {
          uint64_t v15 = objc_alloc_init(MEMORY[0x189603FC8]);
        }
      }
    }

    [v15 setObject:v55 forKeyedSubscript:@"dateAdded"];
    uint64_t v16 = v16 | 2;
    goto LABEL_77;
  }

LABEL_78:
LABEL_79:
  [v8 dateRemoved];
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  CFDateGetTypeID();
  CFDictionaryGetTypedValue();
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v62;
  v65 = v63;
  v66 = v64;
  v245 = v46;
  v242 = v65;
  v243 = v64;
  if (v64 == v65)
  {

    if (v64) {
      goto LABEL_83;
    }
LABEL_85:
    v253 = objc_alloc_init(MEMORY[0x189603FA8]);
    [v253 addObject:@"dateRemoved"];
    goto LABEL_96;
  }

  v67 = v65;
  if ((v64 == 0LL) != (v65 != 0LL))
  {
    v68 = [v64 isEqual:v65];

    if ((v68 & 1) != 0)
    {
      if (v66)
      {
LABEL_83:
        v253 = 0LL;
        goto LABEL_96;
      }

      goto LABEL_85;
    }
  }

  else
  {
  }

  if (v66)
  {
    if (!v15)
    {
      v69 = (void *)[v9 mutableCopy];
      v70 = v69;
      if (v69)
      {
        uint64_t v15 = v69;
      }

      else
      {
        uint64_t v15 = objc_alloc_init(MEMORY[0x189603FC8]);
      }
    }

    [v15 setObject:v66 forKeyedSubscript:@"dateRemoved"];
    v253 = 0LL;
  }

  else
  {
    v253 = objc_alloc_init(MEMORY[0x189603FA8]);
    [v253 addObject:@"dateRemoved"];
  }

  uint64_t v16 = v16 | 2;
LABEL_96:
  [v8 dateRequested];
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  CFDateGetTypeID();
  CFDictionaryGetTypedValue();
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v71;
  v74 = v72;
  v241 = v74;
  if (v73 == v74)
  {

    if (v73) {
      goto LABEL_117;
    }
    goto LABEL_102;
  }

  v75 = v74;
  if ((v73 == 0LL) != (v74 != 0LL))
  {
    v76 = [v73 isEqual:v74];

    if ((v76 & 1) != 0)
    {
      if (v73) {
        goto LABEL_117;
      }
LABEL_102:
      v77 = v253;
      if (!v253) {
        v77 = objc_alloc_init(MEMORY[0x189603FA8]);
      }
      v253 = v77;
      [v77 addObject:@"dateReq"];
      goto LABEL_117;
    }
  }

  else
  {
  }

  if (v73)
  {
    if (!v15)
    {
      v78 = (void *)[v9 mutableCopy];
      v79 = v78;
      if (v78)
      {
        uint64_t v15 = v78;
      }

      else
      {
        uint64_t v15 = objc_alloc_init(MEMORY[0x189603FC8]);
      }
    }

    [v15 setObject:v73 forKeyedSubscript:@"dateReq"];
  }

  else
  {
    v80 = v253;
    if (!v253) {
      v80 = objc_alloc_init(MEMORY[0x189603FA8]);
    }
    v253 = v80;
    [v80 addObject:@"dateReq"];
  }

  uint64_t v16 = v16 | 2;
LABEL_117:
  [v8 deviceIRKData];
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v240 = v81;
  if ([v81 length] != 16)
  {
    v255 = 0LL;
    goto LABEL_131;
  }

  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v81;
  v84 = v82;
  v85 = v84;
  if (v83 == v84)
  {
  }

  else
  {
    if ((v83 == 0LL) == (v84 != 0LL))
    {

LABEL_126:
      v87 = (void *)[v258 mutableCopy];
      v88 = v87;
      if (v87)
      {
        v89 = v87;
      }

      else
      {
        v89 = objc_alloc_init(MEMORY[0x189603FC8]);
      }

      v255 = v89;
      [v89 setObject:v83 forKeyedSubscript:@"dIRK"];
      uint64_t v16 = v16 | 4;
      goto LABEL_130;
    }

    v86 = [v83 isEqual:v84];

    if ((v86 & 1) == 0) {
      goto LABEL_126;
    }
  }

  v255 = 0LL;
LABEL_130:

LABEL_131:
  [v8 edPKData];
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v239 = v90;
  if ([v90 length] != 32) {
    goto LABEL_145;
  }
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v90;
  v93 = v91;
  v94 = v93;
  if (v92 != v93)
  {
    if ((v92 == 0LL) != (v93 != 0LL))
    {
      v95 = [v92 isEqual:v93];

      if ((v95 & 1) != 0) {
        goto LABEL_144;
      }
    }

    else
    {
    }

    v96 = v255;
    if (!v255)
    {
      v97 = (void *)[v258 mutableCopy];
      v98 = v97;
      if (v97)
      {
        v99 = v97;
      }

      else
      {
        v99 = objc_alloc_init(MEMORY[0x189603FC8]);
      }

      v96 = v99;
    }

    v255 = v96;
    [v96 setObject:v92 forKeyedSubscript:@"edPK"];
    uint64_t v16 = v16 | 8;
    goto LABEL_144;
  }

LABEL_144:
LABEL_145:
  [v8 edSKData];
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v238 = v100;
  if ([v100 length] == 32)
  {
    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = v100;
    v103 = v101;
    v104 = v103;
    if (v102 != v103)
    {
      if ((v102 == 0LL) != (v103 != 0LL))
      {
        v105 = [v102 isEqual:v103];

        if ((v105 & 1) != 0) {
          goto LABEL_158;
        }
      }

      else
      {
      }

      v106 = v255;
      if (!v255)
      {
        v107 = (void *)[v258 mutableCopy];
        v108 = v107;
        if (v107)
        {
          v109 = v107;
        }

        else
        {
          v109 = objc_alloc_init(MEMORY[0x189603FC8]);
        }

        v106 = v109;
      }

      v255 = v106;
      [v106 setObject:v102 forKeyedSubscript:@"edSK"];
      uint64_t v16 = v16 | 0x10;
      goto LABEL_158;
    }

LABEL_158:
  }

  Int64 = CFDictionaryGetInt64();
  v111 = [v8 featureFlags];
  if (v111)
  {
    v112 = v111;
    if (v111 != Int64)
    {
      if (!v15)
      {
        v113 = (void *)[v9 mutableCopy];
        v114 = v113;
        if (v113)
        {
          uint64_t v15 = v113;
        }

        else
        {
          uint64_t v15 = objc_alloc_init(MEMORY[0x189603FC8]);
        }
      }

      [MEMORY[0x189607968] numberWithUnsignedLongLong:v112];
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 setObject:v115 forKeyedSubscript:@"ff"];

      uint64_t v16 = v16 | 0x400;
    }
  }

  v117 = v251;
  v116 = v252;
  [v8 identifier];
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  if (v118)
  {
    v119 = v118;
    [v254 identifier];
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v232 = v119;
    v121 = v119;
    v122 = v120;
    if (v121 == v122)
    {

      goto LABEL_178;
    }

    v123 = v122;
    if (v122)
    {
      v124 = [v121 isEqual:v122];

      if ((v124 & 1) != 0)
      {
LABEL_178:
        [v8 idsDeviceID];
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = v126;
        if (!v126) {
          goto LABEL_195;
        }
        v128 = v126;
        v129 = v121;
        v130 = v129;
        if (v128 == v129)
        {
        }

        else
        {
          v131 = [v128 isEqual:v129];

          if ((v131 & 1) != 0) {
            goto LABEL_195;
          }
          CFStringGetTypeID();
          CFDictionaryGetTypedValue();
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = v128;
          v134 = v132;
          v130 = v134;
          if (v133 != v134)
          {
            if (v134)
            {
              v135 = [v133 isEqual:v134];

              if ((v135 & 1) != 0) {
                goto LABEL_194;
              }
            }

            else
            {
            }

            if (!v15)
            {
              v136 = (void *)[v9 mutableCopy];
              v137 = v136;
              if (v136)
              {
                uint64_t v15 = v136;
              }

              else
              {
                uint64_t v15 = objc_alloc_init(MEMORY[0x189603FC8]);
              }
            }

            [v15 setObject:v133 forKeyedSubscript:@"idsDeviceID"];
            uint64_t v16 = v16 | 0x40;
            goto LABEL_194;
          }
        }

LABEL_194:
LABEL_195:
        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 mediaRemoteID];
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        v234 = v138;
        v231 = v139;
        if (![v139 length]) {
          goto LABEL_208;
        }
        v140 = v139;
        v141 = v138;
        v142 = v141;
        if (v140 == v141)
        {
        }

        else
        {
          if ((v141 != 0LL) != (v140 == 0LL))
          {
            v143 = [v140 isEqual:v141];

            if ((v143 & 1) != 0)
            {
              v138 = v234;
              goto LABEL_208;
            }
          }

          else
          {
          }

          v138 = v234;
          if (!v15)
          {
            v144 = (void *)[v9 mutableCopy];
            v145 = v144;
            if (v144)
            {
              uint64_t v15 = v144;
            }

            else
            {
              uint64_t v15 = objc_alloc_init(MEMORY[0x189603FC8]);
            }
          }

          [v15 setObject:v140 forKeyedSubscript:@"mediaRemoteID"];
          uint64_t v16 = v16 | 0x10000;
        }

LABEL_208:
        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 mediaRouteID];
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        v229 = v147;
        v230 = v146;
        if (![v147 length]) {
          goto LABEL_221;
        }
        v148 = v147;
        v149 = v146;
        v150 = v149;
        if (v148 == v149)
        {
        }

        else
        {
          if ((v149 != 0LL) != (v148 == 0LL))
          {
            v151 = [v148 isEqual:v149];

            if ((v151 & 1) != 0)
            {
              v138 = v234;
              goto LABEL_221;
            }
          }

          else
          {
          }

          v138 = v234;
          if (!v15)
          {
            v152 = (void *)[v9 mutableCopy];
            v153 = v152;
            if (v152)
            {
              uint64_t v15 = v152;
            }

            else
            {
              uint64_t v15 = objc_alloc_init(MEMORY[0x189603FC8]);
            }
          }

          [v15 setObject:v148 forKeyedSubscript:@"mediaRouteID"];
          uint64_t v16 = v16 | 0x20000;
        }

LABEL_221:
        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 model];
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        v227 = v155;
        v228 = v154;
        if (![v155 length]) {
          goto LABEL_234;
        }
        v156 = v155;
        v157 = v154;
        v158 = v157;
        if (v156 == v157)
        {
        }

        else
        {
          if ((v157 != 0LL) != (v156 == 0LL))
          {
            v159 = [v156 isEqual:v157];

            if ((v159 & 1) != 0)
            {
              v138 = v234;
              goto LABEL_234;
            }
          }

          else
          {
          }

          v138 = v234;
          if (!v15)
          {
            v160 = (void *)[v9 mutableCopy];
            v161 = v160;
            if (v160)
            {
              uint64_t v15 = v160;
            }

            else
            {
              uint64_t v15 = objc_alloc_init(MEMORY[0x189603FC8]);
            }
          }

          [v15 setObject:v156 forKeyedSubscript:@"model"];
          uint64_t v16 = v16 | 0x80;
        }

LABEL_234:
        [v254 name];
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 name];
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        v225 = v163;
        v226 = v162;
        if (![v163 length]) {
          goto LABEL_243;
        }
        v164 = v163;
        v165 = v162;
        v166 = v165;
        if (v164 == v165)
        {

          goto LABEL_243;
        }

        if ((v165 != 0LL) != (v164 == 0LL))
        {
          v167 = [v164 isEqual:v165];

          if ((v167 & 1) != 0) {
            goto LABEL_242;
          }
        }

        else
        {
        }

        [v254 setName:v164];
        uint64_t v16 = v16 | 0x100;
LABEL_242:
        v138 = v234;
LABEL_243:
        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 sendersKnownAlias];
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        v233 = v11;
        v223 = v169;
        v224 = v168;
        if (![v169 length]) {
          goto LABEL_256;
        }
        v170 = v169;
        v171 = v168;
        v172 = v171;
        if (v170 == v171)
        {
        }

        else
        {
          if ((v171 != 0LL) != (v170 == 0LL))
          {
            v173 = [v170 isEqual:v171];

            if ((v173 & 1) != 0)
            {
              uint64_t v11 = v233;
              goto LABEL_256;
            }
          }

          else
          {
          }

          uint64_t v11 = v233;
          if (!v15)
          {
            v174 = (void *)[v9 mutableCopy];
            v175 = v174;
            if (v174)
            {
              uint64_t v15 = v174;
            }

            else
            {
              uint64_t v15 = objc_alloc_init(MEMORY[0x189603FC8]);
            }
          }

          [v15 setObject:v170 forKeyedSubscript:@"ska"];
          uint64_t v16 = v16 | 0x40000;
        }

LABEL_256:
        objc_opt_class();
        NSDictionaryGetNSArrayOfClass();
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 allUsedSendersKnownAliases];
        v177 = (id)objc_claimAutoreleasedReturnValue();
        v178 = v176;
        v179 = v178;
        if (v177 == v178)
        {

LABEL_269:
          v183 = [v8 type] - 1;
          if (v183 >= 0xC || ((0x8FFu >> v183) & 1) == 0)
          {
            if (v235)
            {
              [v8 type];
              RPErrorF();
              *v235 = (id)objc_claimAutoreleasedReturnValue();
            }

            uint64_t v16 = 1LL;
LABEL_330:

            v117 = v251;
            v116 = v252;
            v125 = v237;
            v118 = v232;
            goto LABEL_331;
          }

          v236 = v127;
          v184 = off_18A0336A0[v183];
          [v254 type];
          v185 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          if (v184 != v185)
          {
            v186 = v185;
            if (!v185
              || (v187 = -[__CFString isEqual:](v184, "isEqual:", v185),
                  v186,
                  v186,
                  (v187 & 1) == 0))
            {
              [v254 setType:v184];
              uint64_t v16 = v16 | 0x200;
            }
          }

          v188 = CFDictionaryGetInt64() == 0;
          v189 = [v8 userAdded];
          v190 = v253;
          if (((v188 ^ v189) & 1) == 0)
          {
            v191 = v189;
            if (!v15)
            {
              v192 = (void *)[v9 mutableCopy];
              v193 = v192;
              if (v192)
              {
                uint64_t v15 = v192;
              }

              else
              {
                uint64_t v15 = objc_alloc_init(MEMORY[0x189603FC8]);
              }

              v190 = v253;
            }

            [MEMORY[0x189607968] numberWithBool:v191];
            v194 = (void *)objc_claimAutoreleasedReturnValue();
            [v15 setObject:v194 forKeyedSubscript:@"userAdded"];

            uint64_t v16 = v16 | 0x4000;
          }

          [v8 btIRKData];
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          v221 = v195;
          if ([v195 length] != 16)
          {
LABEL_299:
            [v8 btAddress];
            v204 = (void *)objc_claimAutoreleasedReturnValue();
            v220 = v204;
            if ([v204 length] != 7) {
              goto LABEL_313;
            }
            CFDataGetTypeID();
            CFDictionaryGetTypedValue();
            v205 = (void *)objc_claimAutoreleasedReturnValue();
            v206 = v204;
            v207 = v205;
            v208 = v207;
            if (v206 != v207)
            {
              if ((v206 == 0LL) != (v207 != 0LL))
              {
                v209 = [v206 isEqual:v207];

                if ((v209 & 1) != 0) {
                  goto LABEL_312;
                }
              }

              else
              {
              }

              v210 = v255;
              if (!v255)
              {
                v211 = (void *)[v258 mutableCopy];
                v257 = v211;
                if (v211)
                {
                  v212 = v211;
                }

                else
                {
                  v212 = objc_alloc_init(MEMORY[0x189603FC8]);
                }

                v210 = v212;
              }

              v255 = v210;
              [v210 setObject:v206 forKeyedSubscript:@"bAdd"];
              uint64_t v16 = v16 | 0x800000;
              goto LABEL_312;
            }

LABEL_312:
            v190 = v253;

LABEL_313:
            if (v222 && (_DWORD)v16) {
              objc_msgSend(v8, "setRevisionID:", objc_msgSend(v8, "revisionID") + 1);
            }
            int Int64Ranged = CFDictionaryGetInt64Ranged();
            v214 = [v8 revisionID];
            if ((_DWORD)v214 != Int64Ranged)
            {
              v215 = v214;
              if (!v15)
              {
                v216 = (void *)[v9 mutableCopy];
                v217 = v216;
                if (v216)
                {
                  uint64_t v15 = v216;
                }

                else
                {
                  uint64_t v15 = objc_alloc_init(MEMORY[0x189603FC8]);
                }

                v190 = v253;
              }

              [MEMORY[0x189607968] numberWithUnsignedInt:v215];
              v218 = (void *)objc_claimAutoreleasedReturnValue();
              [v15 setObject:v218 forKeyedSubscript:@"revisionID"];
            }

            uint64_t v11 = v233;
            v138 = v234;
            if (v15) {
              [v254 setMetadata:v15];
            }
            if (v190) {
              [v254 setRemovedMetadata:v190];
            }
            if (v255) {
              objc_msgSend(v254, "setSecrets:");
            }

            v127 = v236;
            goto LABEL_330;
          }

          CFDataGetTypeID();
          CFDictionaryGetTypedValue();
          v196 = (void *)objc_claimAutoreleasedReturnValue();
          v197 = v195;
          v198 = v196;
          v199 = v198;
          if (v197 != v198)
          {
            if ((v197 == 0LL) != (v198 != 0LL))
            {
              v200 = [v197 isEqual:v198];

              if ((v200 & 1) != 0) {
                goto LABEL_298;
              }
            }

            else
            {
            }

            v201 = v255;
            if (!v255)
            {
              v202 = (void *)[v258 mutableCopy];
              v256 = v202;
              if (v202)
              {
                v203 = v202;
              }

              else
              {
                v203 = objc_alloc_init(MEMORY[0x189603FC8]);
              }

              v201 = v203;
            }

            v255 = v201;
            [v201 setObject:v197 forKeyedSubscript:@"bIRK"];
            uint64_t v16 = v16 | 0x400000;
            goto LABEL_298;
          }

LABEL_298:
          v190 = v253;

          goto LABEL_299;
        }

        if ((v178 != 0LL) != (v177 == 0LL))
        {
          v180 = [v177 isEqual:v178];

          if ((v180 & 1) != 0)
          {
LABEL_268:
            uint64_t v11 = v233;
            goto LABEL_269;
          }

          if (!v15) {
            goto LABEL_263;
          }
        }

        else
        {

          if (!v15)
          {
LABEL_263:
            v181 = (void *)[v9 mutableCopy];
            v182 = v181;
            if (v181)
            {
              uint64_t v15 = v181;
            }

            else
            {
              uint64_t v15 = objc_alloc_init(MEMORY[0x189603FC8]);
            }
          }
        }

        [v15 setObject:v177 forKeyedSubscript:@"allUsedSKAs"];
        uint64_t v16 = v16 | 0x1000000;
        goto LABEL_268;
      }
    }

    else
    {
    }

    [v254 setIdentifier:v121];
    uint64_t v16 = v16 | 0x20;
    goto LABEL_178;
  }

  if (v235)
  {
    RPErrorF();
    *v235 = (id)objc_claimAutoreleasedReturnValue();
    v118 = 0LL;
  }

  uint64_t v16 = 1LL;
  v125 = v237;
LABEL_331:

  return v16;
}

LABEL_54:
    uint64_t v14 = -6743;
    goto LABEL_49;
  }

Class initSFDeviceDiscovery()
{
  if (SharingLibrary_sOnce_0 != -1) {
    dispatch_once(&SharingLibrary_sOnce_0, &__block_literal_global_461);
  }
  Class result = objc_getClass("SFDeviceDiscovery");
  classSFDeviceDiscovery = (uint64_t)result;
  getSFDeviceDiscoveryClass = (uint64_t (*)())SFDeviceDiscoveryFunction;
  return result;
}

id SFDeviceDiscoveryFunction()
{
  return (id)classSFDeviceDiscovery;
}

void *__SharingLibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 2);
  SharingLibrary_sLib_0 = (uint64_t)result;
  return result;
}

void sub_1873B8E64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_1873B8F98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1873B91B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1873B92D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1873B93F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1873B950C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1873B97FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1873B9918( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1873B9A3C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1873B9BA8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1873B9D40( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1873BA578(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

LABEL_49:
}

void sub_1873BAE08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_1873BB1C4(_Unwind_Exception *a1)
{
}

void sub_1873BB6C8(_Unwind_Exception *a1)
{
}

void sub_1873BB8A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1873BBB90(_Unwind_Exception *a1)
{
}

void sub_1873BBC50(_Unwind_Exception *a1)
{
}

void sub_1873BBD00(_Unwind_Exception *a1)
{
}

void sub_1873BCDCC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Block_object_dispose((const void *)(v11 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1873BE2FC(_Unwind_Exception *a1)
{
}

void sub_1873BF678(_Unwind_Exception *a1)
{
}

void sub_1873C1A74(_Unwind_Exception *a1)
{
}

void sub_1873C1ADC(_Unwind_Exception *a1)
{
}

void sub_1873C1E74(_Unwind_Exception *a1)
{
}

void sub_1873C1FE4(_Unwind_Exception *a1)
{
}

void sub_1873C215C(_Unwind_Exception *a1)
{
}

void sub_1873C2520( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1873C26DC(_Unwind_Exception *a1)
{
}

void sub_1873C2AC0(_Unwind_Exception *a1)
{
}

const char *RPDataLinkTypeToString_0(unsigned int a1)
{
  if (a1 > 0xB) {
    return "?";
  }
  else {
    return off_18A033D70[a1];
  }
}

void sub_1873C6DA0(_Unwind_Exception *a1)
{
}

void sub_1873C88DC(_Unwind_Exception *a1)
{
}

Class initAVVCStartRecordSettings()
{
  if (AVFAudioLibrary_sOnce != -1) {
    dispatch_once(&AVFAudioLibrary_sOnce, &__block_literal_global_262);
  }
  Class result = objc_getClass("AVVCStartRecordSettings");
  classAVVCStartRecordSettings = (uint64_t)result;
  getAVVCStartRecordSettingsClass = (uint64_t (*)())AVVCStartRecordSettingsFunction;
  return result;
}

id AVVCStartRecordSettingsFunction()
{
  return (id)classAVVCStartRecordSettings;
}

void *__AVFAudioLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/Frameworks/AVFAudio.framework/AVFAudio", 2);
  AVFAudioLibrary_sLib = (uint64_t)result;
  return result;
}

Class initAVAudioFormat()
{
  if (AVFAudioLibrary_sOnce != -1) {
    dispatch_once(&AVFAudioLibrary_sOnce, &__block_literal_global_262);
  }
  Class result = objc_getClass("AVAudioFormat");
  classAVAudioFormat = (uint64_t)result;
  getAVAudioFormatClass = (uint64_t (*)())AVAudioFormatFunction;
  return result;
}

id AVAudioFormatFunction()
{
  return (id)classAVAudioFormat;
}

Class initAVVoiceController()
{
  if (AVFAudioLibrary_sOnce != -1) {
    dispatch_once(&AVFAudioLibrary_sOnce, &__block_literal_global_262);
  }
  Class result = objc_getClass("AVVoiceController");
  classAVVoiceController = (uint64_t)result;
  getAVVoiceControllerClass = (uint64_t (*)())AVVoiceControllerFunction;
  return result;
}

id AVVoiceControllerFunction()
{
  return (id)classAVVoiceController;
}

Class initAVVCContextSettings()
{
  if (AVFAudioLibrary_sOnce != -1) {
    dispatch_once(&AVFAudioLibrary_sOnce, &__block_literal_global_262);
  }
  Class result = objc_getClass("AVVCContextSettings");
  classAVVCContextSettings = (uint64_t)result;
  getAVVCContextSettingsClass = (uint64_t (*)())AVVCContextSettingsFunction;
  return result;
}

id AVVCContextSettingsFunction()
{
  return (id)classAVVCContextSettings;
}

Class initAVVCPrepareRecordSettings()
{
  if (AVFAudioLibrary_sOnce != -1) {
    dispatch_once(&AVFAudioLibrary_sOnce, &__block_literal_global_262);
  }
  Class result = objc_getClass("AVVCPrepareRecordSettings");
  classAVVCPrepareRecordSettings = (uint64_t)result;
  getAVVCPrepareRecordSettingsClass = (uint64_t (*)())AVVCPrepareRecordSettingsFunction;
  return result;
}

id AVVCPrepareRecordSettingsFunction()
{
  return (id)classAVVCPrepareRecordSettings;
}

LABEL_32:
}
}

void sub_1873CE21C(_Unwind_Exception *a1)
{
}

void sub_1873CF4E8(_Unwind_Exception *a1)
{
}

void sub_1873CFE9C(_Unwind_Exception *a1)
{
}

LABEL_6:
}

void sub_1873D27F0(_Unwind_Exception *a1)
{
}

void sub_1873D2964(_Unwind_Exception *a1)
{
}

void sub_1873D3510( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1873D6118(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__71(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1895A4770](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__72(uint64_t a1)
{
}

void sub_1873D7138(_Unwind_Exception *a1)
{
}

void sub_1873D7A58(_Unwind_Exception *a1)
{
}

LABEL_40:
    uint64_t v44 = RPErrorF();
    secure_udp = (nw_parameters *)v64[5];
    v64[5] = v44;
    goto LABEL_35;
  }

  legacy_tcp_socket = (nw_parameters *)nw_parameters_create_legacy_tcp_socket();
  secure_udp = legacy_tcp_socket;
  if (!legacy_tcp_socket) {
    goto LABEL_40;
  }
  uint64_t v29 = nw_parameters_copy_default_protocol_stack(legacy_tcp_socket);
  if (v29)
  {
    options = nw_udp_create_options();
    nw_udp_options_set_no_metadata();
    nw_protocol_stack_set_transport_protocol(v29, options);

    goto LABEL_19;
  }

void sub_1873D83D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31)
{
}

id RPStreamSessionLog()
{
  if (RPStreamSessionLog_onceToken != -1) {
    dispatch_once(&RPStreamSessionLog_onceToken, &__block_literal_global_435);
  }
  return (id)RPStreamSessionLog___logger;
}

void sub_1873D9A00( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

void sub_1873DA770( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, char a43)
{
}

void __RPStreamSessionLog_block_invoke()
{
  uint64_t v0 = LogCategoryCopyOSLogHandle();
  uint64_t v1 = (void *)RPStreamSessionLog___logger;
  RPStreamSessionLog___logger = v0;
}

LABEL_33:
  return v12;
}

Class initRTIDataPayload()
{
  if (RemoteTextInputLibrary_sOnce != -1) {
    dispatch_once(&RemoteTextInputLibrary_sOnce, &__block_literal_global_128);
  }
  Class result = objc_getClass("RTIDataPayload");
  classRTIDataPayload = (uint64_t)result;
  getRTIDataPayloadClass = (uint64_t (*)())RTIDataPayloadFunction;
  return result;
}

id RTIDataPayloadFunction()
{
  return (id)classRTIDataPayload;
}

void *__RemoteTextInputLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/RemoteTextInput.framework/RemoteTextInput", 2);
  RemoteTextInputLibrary_sLib = (uint64_t)result;
  return result;
}

Class initRTIInputSystemSourceSession()
{
  if (RemoteTextInputLibrary_sOnce != -1) {
    dispatch_once(&RemoteTextInputLibrary_sOnce, &__block_literal_global_128);
  }
  Class result = objc_getClass("RTIInputSystemSourceSession");
  classRTIInputSystemSourceSession = (uint64_t)result;
  getRTIInputSystemSourceSessionClass = (uint64_t (*)())RTIInputSystemSourceSessionFunction;
  return result;
}

id RTIInputSystemSourceSessionFunction()
{
  return (id)classRTIInputSystemSourceSession;
}

void __nwrapport_copy_protocol_definition_block_invoke_2_cold_1()
{
}

void __nwrapport_copy_protocol_definition_block_invoke_2_cold_2()
{
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl( &dword_18736A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Magic value does not match: 0x%x",  (uint8_t *)v1,  8u);
  OUTLINED_FUNCTION_3();
}

void __nwrapport_copy_protocol_definition_block_invoke_2_cold_3()
{
  *(_WORD *)int v0 = 0;
  _os_log_debug_impl(&dword_18736A000, MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG, "Connection not validated yet", v0, 2u);
  OUTLINED_FUNCTION_3();
}

void __nwrapport_copy_protocol_definition_block_invoke_2_cold_4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_18736A000, MEMORY[0x1895F8DA0], a3, "Received error code=%u", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __nwrapport_copy_protocol_definition_block_invoke_2_cold_5( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2( &dword_18736A000,  MEMORY[0x1895F8DA0],  a3,  "Received data, length=%zu, passing through",  a5,  a6,  a7,  a8,  0);
  OUTLINED_FUNCTION_0();
}

void __nwrapport_copy_protocol_definition_block_invoke_2_cold_6(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(*(void *)a1 + 8LL);
  int v2 = *(unsigned __int8 *)(v1 + 32);
  uint64_t v3 = *(void *)(v1 + 40);
  v4[0] = 67109376;
  v4[1] = v2;
  __int16 v5 = 2048;
  uint64_t v6 = v3;
  _os_log_debug_impl( &dword_18736A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "Got a message header, type=%d, length=%zu",  (uint8_t *)v4,  0x12u);
  OUTLINED_FUNCTION_0();
}

void __nwrapport_copy_protocol_definition_block_invoke_49_cold_1( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __nwrapport_copy_protocol_definition_block_invoke_51_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl( &dword_18736A000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_ERROR,  "Stop handler called for framer=%@, sending CLOSE to daemon",  (uint8_t *)&v1,  0xCu);
  OUTLINED_FUNCTION_0();
}

uint64_t BonjourAdvertiserCreate()
{
  return MEMORY[0x18960E7E8]();
}

uint64_t BonjourAdvertiserSetDispatchQueue()
{
  return MEMORY[0x18960E7F0]();
}

uint64_t BonjourAdvertiserSetPort()
{
  return MEMORY[0x18960E7F8]();
}

uint64_t BonjourAdvertiserSetServiceType()
{
  return MEMORY[0x18960E800]();
}

uint64_t BonjourAdvertiserSetTXTRecord()
{
  return MEMORY[0x18960E808]();
}

uint64_t BonjourAdvertiserStart()
{
  return MEMORY[0x18960E810]();
}

uint64_t BonjourAdvertiserStop()
{
  return MEMORY[0x18960E818]();
}

uint64_t BonjourAdvertiserUpdate()
{
  return MEMORY[0x18960E820]();
}

uint64_t BonjourBrowser_Create()
{
  return MEMORY[0x18960E828]();
}

uint64_t BonjourBrowser_SetDispatchQueue()
{
  return MEMORY[0x18960E830]();
}

uint64_t BonjourBrowser_SetEventHandlerBlock()
{
  return MEMORY[0x18960E838]();
}

uint64_t BonjourBrowser_Start()
{
  return MEMORY[0x18960E840]();
}

uint64_t BonjourBrowser_Stop()
{
  return MEMORY[0x18960E848]();
}

uint64_t BonjourDevice_GetDeviceID()
{
  return MEMORY[0x18960E858]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1895F82D0](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82D8](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82E0](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82E8](c, data, *(void *)&len);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x189602690]();
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x189602B78]();
}

uint64_t CFDictionaryGetCFDataOfLength()
{
  return MEMORY[0x18960E880]();
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x18960E890]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x18960E8A0]();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return MEMORY[0x18960E8B0]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x189602BF0]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x18960E8C0]();
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x189602C80]();
}

uint64_t CFGetHardwareAddress()
{
  return MEMORY[0x18960E8D8]();
}

uint64_t CFPrefs_GetDouble()
{
  return MEMORY[0x18960E8F0]();
}

uint64_t CFPrefs_GetInt64()
{
  return MEMORY[0x18960E8F8]();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x189603590]();
}

uint64_t CUDescriptionWithLevel()
{
  return MEMORY[0x18960E920]();
}

uint64_t CUDispatchTimerSet()
{
  return MEMORY[0x18960E930]();
}

uint64_t CUGetInterfaceAddresses()
{
  return MEMORY[0x18960E950]();
}

uint64_t CUMetricsLog()
{
  return MEMORY[0x18960E960]();
}

uint64_t CUMetricsLogEx()
{
  return MEMORY[0x18960E968]();
}

uint64_t CryptoHKDF()
{
  return MEMORY[0x18960EAB8]();
}

uint64_t Curve25519MakeKeyPair()
{
  return MEMORY[0x18960EAC0]();
}

uint64_t DeviceOSVersionAtOrLater()
{
  return MEMORY[0x18960EAF0]();
}

uint64_t DeviceOSVersionAtOrLaterEx()
{
  return MEMORY[0x18960EAF8]();
}

uint64_t FPrintF()
{
  return MEMORY[0x18960EB00]();
}

uint64_t FatalErrorF()
{
  return MEMORY[0x18960EB08]();
}

uint64_t GestaltCopyAnswer()
{
  return MEMORY[0x18960EB10]();
}

uint64_t GestaltGetDeviceClass()
{
  return MEMORY[0x18960EB18]();
}

uint64_t GestaltProductTypeStringToDeviceClass()
{
  return MEMORY[0x18960EB20]();
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x18960EBB8]();
}

uint64_t LogCategoryCopyOSLogHandle()
{
  return MEMORY[0x18960EBC0]();
}

uint64_t LogCategoryReplaceF()
{
  return MEMORY[0x18960EBC8]();
}

uint64_t LogCategory_Remove()
{
  return MEMORY[0x18960EBD8]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x18960EBF0]();
}

uint64_t NADyFF4UGjtVGBmEW6h()
{
  return MEMORY[0x18960EC38]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x18960EC40]();
}

uint64_t NSDecodeNSArrayOfClassIfPresent()
{
  return MEMORY[0x18960EC58]();
}

uint64_t NSDecodeNSDictionaryOfClassesIfPresent()
{
  return MEMORY[0x18960EC60]();
}

uint64_t NSDecodeObjectIfPresent()
{
  return MEMORY[0x18960EC70]();
}

uint64_t NSDecodeSInt64RangedIfPresent()
{
  return MEMORY[0x18960EC78]();
}

uint64_t NSDecodeStandardContainerIfPresent()
{
  return MEMORY[0x18960EC80]();
}

uint64_t NSDictionaryGetNSArrayOfClass()
{
  return MEMORY[0x18960EC88]();
}

uint64_t NSDictionaryGetNSNumber()
{
  return MEMORY[0x18960EC90]();
}

uint64_t NSDictionaryGetNSUUID()
{
  return MEMORY[0x18960EC98]();
}

uint64_t NSErrorNestedV()
{
  return MEMORY[0x18960ECC8]();
}

uint64_t NSErrorV()
{
  return MEMORY[0x18960ECD8]();
}

uint64_t NSErrorWithOSStatusF()
{
  return MEMORY[0x18960ECE0]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x18960ECE8]();
}

uint64_t NSRandomData()
{
  return MEMORY[0x18960ED00]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

uint64_t OPACKDecodeData()
{
  return MEMORY[0x18960EDF8]();
}

uint64_t OPACKEncoderCreateData()
{
  return MEMORY[0x18960EE00]();
}

uint64_t OPACKEstimateEncodedSize()
{
  return MEMORY[0x18960EE08]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x18960EE48]();
}

uint64_t SNPrintF()
{
  return MEMORY[0x18960EE60]();
}

uint64_t SecondsToUpTicks()
{
  return MEMORY[0x18960EE68]();
}

uint64_t ServerSocketOpenEx2()
{
  return MEMORY[0x18960EE70]();
}

uint64_t ServerSocketPairOpen()
{
  return MEMORY[0x18960EE78]();
}

uint64_t SipHash()
{
  return MEMORY[0x18960EE80]();
}

uint64_t SockAddrCompareAddr()
{
  return MEMORY[0x18960EE88]();
}

uint64_t SockAddrConvertToIPv6()
{
  return MEMORY[0x18960EE90]();
}

uint64_t SockAddrGetPort()
{
  return MEMORY[0x18960EE98]();
}

uint64_t SockAddrGetSize()
{
  return MEMORY[0x18960EEA0]();
}

uint64_t SockAddrSetPort()
{
  return MEMORY[0x18960EEA8]();
}

uint64_t SockAddrSimplify()
{
  return MEMORY[0x18960EEB0]();
}

uint64_t SockAddrToString()
{
  return MEMORY[0x18960EEB8]();
}

uint64_t SocketGetInterfaceInfo()
{
  return MEMORY[0x18960EEC0]();
}

uint64_t SocketSetQoS()
{
  return MEMORY[0x18960EED8]();
}

uint64_t SourceVersionToCString()
{
  return MEMORY[0x18960EEE8]();
}

uint64_t StringToSockAddr()
{
  return MEMORY[0x18960EEF0]();
}

uint64_t TN6sBSnEP2()
{
  return MEMORY[0x18960EF10]();
}

void TXTRecordCreate(TXTRecordRef *txtRecord, uint16_t bufferLen, void *buffer)
{
}

void TXTRecordDeallocate(TXTRecordRef *txtRecord)
{
}

const void *__cdecl TXTRecordGetBytesPtr(const TXTRecordRef *txtRecord)
{
  return (const void *)MEMORY[0x1895F8640](txtRecord);
}

uint16_t TXTRecordGetLength(const TXTRecordRef *txtRecord)
{
  return MEMORY[0x1895F8658](txtRecord);
}

uint64_t TXTRecordGetNextItem()
{
  return MEMORY[0x18960EF18]();
}

DNSServiceErrorType TXTRecordSetValue( TXTRecordRef *txtRecord, const char *key, uint8_t valueSize, const void *value)
{
  return MEMORY[0x1895F8668](txtRecord, key, valueSize, value);
}

uint64_t TextToHardwareAddress()
{
  return MEMORY[0x18960EF28]();
}

uint64_t TextToHardwareAddressScalar()
{
  return MEMORY[0x18960EF30]();
}

uint64_t UpTicksToMilliseconds()
{
  return MEMORY[0x18960EF40]();
}

uint64_t UpTicksToSeconds()
{
  return MEMORY[0x18960EF48]();
}

uint64_t UpTicksToSecondsF()
{
  return MEMORY[0x18960EF50]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x189604838]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x18960EF70]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

float __exp10f(float a1)
{
  return result;
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1895F8D88]();
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

uint64_t cccurve25519()
{
  return MEMORY[0x1895F9868]();
}

uint64_t cccurve25519_make_pub()
{
  return MEMORY[0x1895F9880]();
}

uint64_t cced25519_make_key_pair_compat()
{
  return MEMORY[0x18960EF80]();
}

uint64_t cced25519_sign_compat()
{
  return MEMORY[0x18960EF88]();
}

uint64_t cced25519_verify_compat()
{
  return MEMORY[0x18960EF90]();
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

size_t compression_decode_buffer( uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x189614998](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_encode_buffer( uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1896149A8](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1895FA5F0](*(void *)&a1, a2, *(void *)&a3);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class( dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD78](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
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

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1895FB480](*(void *)&a1, a2);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1895FB5A0](a1);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1895FB610](*(void *)&a1, a2, a3);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1895FB6D0](*(void *)&a1, a2, a3);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1895FB7D8](a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FBA80](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1895FBE68](__s, __smax, *(void *)&__c, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1895FC188](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1895FC198](*(void *)&token, state64);
}

uint32_t notify_register_dispatch( const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1895FC1C0](name, out_token, queue, handler);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x189608FE8]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x189608FF0]();
}

uint64_t nw_activity_complete_with_reason_and_underlying_error_string()
{
  return MEMORY[0x189609000]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x189609008]();
}

uint64_t nw_activity_create_from_token()
{
  return MEMORY[0x189609010]();
}

uint64_t nw_activity_get_token()
{
  return MEMORY[0x189609028]();
}

uint64_t nw_activity_is_activated()
{
  return MEMORY[0x189609030]();
}

uint64_t nw_activity_set_parent_activity()
{
  return MEMORY[0x189609040]();
}

uint64_t nw_activity_submit_metrics()
{
  return MEMORY[0x189609050]();
}

void nw_connection_cancel(nw_connection_t connection)
{
}

nw_endpoint_t nw_endpoint_create_address(const sockaddr *address)
{
  return (nw_endpoint_t)MEMORY[0x189609510](address);
}

uint64_t nw_endpoint_create_address_with_ethernet()
{
  return MEMORY[0x189609518]();
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x189609538](endpoint);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x189609598](error);
}

void nw_framer_async(nw_framer_t framer, nw_framer_block_t async_block)
{
}

uint64_t nw_framer_connection_state_copy_object_value()
{
  return MEMORY[0x189609778]();
}

uint64_t nw_framer_connection_state_set_object_value()
{
  return MEMORY[0x189609780]();
}

nw_protocol_definition_t nw_framer_create_definition( const char *identifier, uint32_t flags, nw_framer_start_handler_t start_handler)
{
  return (nw_protocol_definition_t)MEMORY[0x189609788](identifier, *(void *)&flags, start_handler);
}

BOOL nw_framer_deliver_input_no_copy( nw_framer_t framer, size_t input_length, nw_framer_message_t message, BOOL is_complete)
{
  return MEMORY[0x189609798](framer, input_length, message, is_complete);
}

void nw_framer_mark_failed_with_error(nw_framer_t framer, int error_code)
{
}

void nw_framer_mark_ready(nw_framer_t framer)
{
}

nw_framer_message_t nw_framer_message_create(nw_framer_t framer)
{
  return (nw_framer_message_t)MEMORY[0x1896097B0](framer);
}

BOOL nw_framer_parse_input( nw_framer_t framer, size_t minimum_incomplete_length, size_t maximum_length, uint8_t *temp_buffer, nw_framer_parse_completion_t parse)
{
  return MEMORY[0x1896097B8](framer, minimum_incomplete_length, maximum_length, temp_buffer, parse);
}

void nw_framer_set_cleanup_handler(nw_framer_t framer, nw_framer_cleanup_handler_t cleanup_handler)
{
}

void nw_framer_set_input_handler(nw_framer_t framer, nw_framer_input_handler_t input_handler)
{
}

void nw_framer_set_output_handler(nw_framer_t framer, nw_framer_output_handler_t output_handler)
{
}

void nw_framer_set_stop_handler(nw_framer_t framer, nw_framer_stop_handler_t stop_handler)
{
}

void nw_framer_write_output(nw_framer_t framer, const uint8_t *output_buffer, size_t output_length)
{
}

BOOL nw_framer_write_output_no_copy(nw_framer_t framer, size_t output_length)
{
  return MEMORY[0x1896097E8](framer, output_length);
}

uint64_t nw_interface_create_with_name()
{
  return MEMORY[0x1896097F8]();
}

void nw_listener_cancel(nw_listener_t listener)
{
}

uint64_t nw_listener_copy_local_endpoint()
{
  return MEMORY[0x1896098A8]();
}

nw_listener_t nw_listener_create(nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x1896098B0](parameters);
}

uint64_t nw_listener_set_event_handler()
{
  return MEMORY[0x1896098D8]();
}

void nw_listener_set_new_connection_handler( nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
}

void nw_listener_start(nw_listener_t listener)
{
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x1896099A0](parameters);
}

uint64_t nw_parameters_create_legacy_tcp_socket()
{
  return MEMORY[0x1896099F0]();
}

nw_parameters_t nw_parameters_create_secure_udp( nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return (nw_parameters_t)MEMORY[0x189609A18](configure_dtls, configure_udp);
}

void nw_parameters_require_interface(nw_parameters_t parameters, nw_interface_t interface)
{
}

uint64_t nw_parameters_set_allow_duplicate_state_updates()
{
  return MEMORY[0x189609AE0]();
}

uint64_t nw_parameters_set_delegated_unique_pid()
{
  return MEMORY[0x189609B20]();
}

void nw_parameters_set_local_endpoint(nw_parameters_t parameters, nw_endpoint_t local_endpoint)
{
}

void nw_parameters_set_reuse_local_address(nw_parameters_t parameters, BOOL reuse_local_address)
{
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x189609D50]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x189609D60]();
}

uint64_t nw_path_evaluator_get_client_id()
{
  return MEMORY[0x189609D78]();
}

void nw_protocol_stack_set_transport_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
}

nw_protocol_options_t nw_udp_create_options(void)
{
  return (nw_protocol_options_t)MEMORY[0x18960ABA8]();
}

uint64_t nw_udp_options_set_no_metadata()
{
  return MEMORY[0x18960ABB0]();
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

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x189616978](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x189616980](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1895FC600](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1895FC610](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1895FC6C0]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

uint64_t stristr()
{
  return MEMORY[0x18960EFE0]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1895FD4E0](uu);
}

uint64_t wInTP56r94EFs9NAAi()
{
  return MEMORY[0x18960EFE8]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}

xpc_object_t xpc_fd_create(int fd)
{
  return (xpc_object_t)MEMORY[0x1895FDDF8](*(void *)&fd);
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x1895FDE00](xfd);
}

uint64_t objc_msgSend__clientUDPNWPathNextWithEndpoint_nwInterface_selfMACData_usb_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__clientUDPNWPathNextWithEndpoint_nwInterface_selfMACData_usb_completion_);
}

uint64_t objc_msgSend__clientUDPNWPathStartResponse_options_localEndpoint_nwInterface_selfIPString_usb_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__clientUDPNWPathStartResponse_options_localEndpoint_nwInterface_selfIPString_usb_completion_);
}

uint64_t objc_msgSend__connectionWithClient_queue_userProvider_interruptionHandler_invalidationHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__connectionWithClient_queue_userProvider_interruptionHandler_invalidationHandler_);
}

uint64_t objc_msgSend__sendEncryptedRequestID_request_xpcID_options_sendEntry_responseHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel__sendEncryptedRequestID_request_xpcID_options_sendEntry_responseHandler_);
}

uint64_t objc_msgSend__sendEncryptedResponse_options_error_xid_requestID_highPriority_isChatty_replyStartTime_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__sendEncryptedResponse_options_error_xid_requestID_highPriority_isChatty_replyStartTime_);
}

uint64_t objc_msgSend__serverUDPNWPathNextWithEndpoint_nwInterface_selfMACData_peerIP_peerMACData_usb_responseHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel__serverUDPNWPathNextWithEndpoint_nwInterface_selfMACData_peerIP_peerMACData_usb_responseHandler_);
}

uint64_t objc_msgSend_clientCreateDeviceMappingInternal_applicationService_deviceID_endpointID_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_clientCreateDeviceMappingInternal_applicationService_deviceID_endpointID_completion_);
}

uint64_t objc_msgSend_companionLinkSendEventID_event_destinationID_options_nwActivityToken_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_companionLinkSendEventID_event_destinationID_options_nwActivityToken_completion_);
}

uint64_t objc_msgSend_companionLinkSendRequestID_request_destinationID_options_nwActivityToken_responseHandler_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_companionLinkSendRequestID_request_destinationID_options_nwActivityToken_responseHandler_);
}

uint64_t objc_msgSend_initWithApplicationLabel_supportedApplicationLabels_pkData_bonjourListenerUUID_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithApplicationLabel_supportedApplicationLabels_pkData_bonjourListenerUUID_);
}

uint64_t objc_msgSend_logConnectionWithDeviceModelFrom_deviceModelTo_error_initiator_isOnDemand_isStereoPair_lifetime_linkType_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_logConnectionWithDeviceModelFrom_deviceModelTo_error_initiator_isOnDemand_isStereoPair_lifetime_linkType_);
}

uint64_t objc_msgSend_nearbyInvitationReceivedRequestID_request_options_responseHandler_sessionID_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_nearbyInvitationReceivedRequestID_request_options_responseHandler_sessionID_);
}

uint64_t objc_msgSend_serverCreateDeviceMappingInternal_applicationService_deviceID_endpointID_completion_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718]( a1,  sel_serverCreateDeviceMappingInternal_applicationService_deviceID_endpointID_completion_);
}