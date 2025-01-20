@interface RequestDeviceChallengeResponse
@end

@implementation RequestDeviceChallengeResponse

void __iap2_deviceAuthentication_RequestDeviceChallengeResponse_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = v2 + 120;
  v4 = *(const __CFData **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v4)
  {
    BytePtr = CFDataGetBytePtr(v4);
    CFIndex Length = CFDataGetLength(*(CFDataRef *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
    uint64_t v2 = *(void *)(a1 + 48);
  }

  else
  {
    BytePtr = 0LL;
    CFIndex Length = 0LL;
  }

  iAP2MsgInit(v3, 43539, *(void *)(v2 + 192), 0xFFFF, 0LL, 0LL);
  if (BytePtr && Length)
  {
    iAP2MsgAddDataParam(v3, 0LL, 0, BytePtr, (unsigned __int16)Length);
  }

  else
  {
    if (gLogObjects && gNumLogObjects >= 49)
    {
      v7 = *(os_log_s **)(gLogObjects + 384);
    }

    else
    {
      v7 = (os_log_s *)&_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
    }

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = *(unsigned __int16 *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      v11[0] = 67109632;
      v11[1] = v10;
      __int16 v12 = 1024;
      int v13 = (unsigned __int16)BytePtr;
      __int16 v14 = 2048;
      CFIndex v15 = Length;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "No device signature parameter due to pCFDataChallenge:%04X, pSignatureBytes:%04X, signatureLength:%02lX",  (uint8_t *)v11,  0x18u);
    }
  }

  iap2_sessionControl_sendOutgoingMessage(*(uint64_t **)(a1 + 48), v3);
  v8 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if (v8)
  {
    CFRelease(v8);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0LL;
  }

  v9 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v9)
  {
    CFRelease(v9);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0LL;
  }

@end