@interface STRemoteExtractor(STAEAExtractor)
@end

@implementation STRemoteExtractor(STAEAExtractor)

+ (void)STAEAExtractorWithOptions:()STAEAExtractor .cold.1()
{
}

+ (void)STAEAExtractorWithOptions:()STAEAExtractor .cold.2()
{
}

+ (void)fullReplacementSTAEAExtractor:()STAEAExtractor .cold.1()
{
}

+ (void)incrementalPatchSTAEAExtractor:()STAEAExtractor srcDirectory:.cold.1()
{
}

+ (void)incrementalPatchSTAEAExtractor:()STAEAExtractor srcDirectory:.cold.2()
{
}

- (void)setSourceDirectory:()STAEAExtractor sandboxExtension:.cold.1()
{
}

- (void)setSourceDirectory:()STAEAExtractor sandboxExtension:.cold.2( uint64_t a1,  os_log_s *a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v4 = __error();
  strerror(*v4);
  int v7 = 136448002;
  v8 = "-[STRemoteExtractor(STAEAExtractor) setSourceDirectory:sandboxExtension:]";
  __int16 v9 = 2080;
  v10 = "-[STRemoteExtractor(STAEAExtractor) setSourceDirectory:sandboxExtension:]";
  __int16 v11 = 2080;
  OUTLINED_FUNCTION_3();
  uint64_t v12 = a1;
  __int16 v13 = v5;
  uint64_t v14 = v6;
  __int16 v15 = v5;
  v16 = "";
  __int16 v17 = v5;
  v18 = "/Library/Caches/com.apple.xbs/Sources/StreamingExtractor/StreamingExtractor_Framework/STAEAExtractor.m";
  __int16 v19 = 1024;
  int v20 = 183;
  _os_log_error_impl( &dword_1884F9000,  a2,  OS_LOG_TYPE_ERROR,  "%{public}s: %s: AssertMacros: %s - Failed to get sandbox extension for %s : %s, %s file: %s, line: %d\n",  (uint8_t *)&v7,  0x4Eu);
}

@end