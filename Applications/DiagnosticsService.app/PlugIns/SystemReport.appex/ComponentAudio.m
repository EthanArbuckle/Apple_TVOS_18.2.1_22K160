@interface ComponentAudio
- (BOOL)isPresent;
@end

@implementation ComponentAudio

- (BOOL)isPresent
{
  v2 = IOServiceMatching("AppleEmbeddedAudio");
  CFDictionarySetValue(v2, @"CodecUID", @"Codec");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (MatchingService)
  {
    io_object_t v4 = MatchingService;
    CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty( MatchingService,  @"Ping",  kCFAllocatorDefault,  0);
    IOObjectRelease(v4);
    BOOL v6 = CFProperty == kCFBooleanTrue;
    if (CFProperty != kCFBooleanTrue)
    {
      uint64_t v7 = DiagnosticLogHandleForCategory(6LL);
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Audio NOT found. Codec ping failed.",  buf,  2u);
      }
    }

    if (CFProperty) {
      CFRelease(CFProperty);
    }
  }

  else
  {
    uint64_t v9 = DiagnosticLogHandleForCategory(6LL);
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Audio NOT found. Cannot find AppleEmbeddedAudio service.",  v12,  2u);
    }

    return 0;
  }

  return v6;
}

@end