@interface CFGetProductName
@end

@implementation CFGetProductName

void ___CFGetProductName_block_invoke()
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  v0 = getenv("CLASSIC_SUFFIX");
  if (v0)
  {
    v1 = v0;
    if (!strncmp(v0, "iphone", 6uLL))
    {
      v4 = (os_log_s *)_CFBundleResourceLogger();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        ___CFGetProductName_block_invoke_cold_2(v4, v5, v6, v7, v8, v9, v10, v11);
      }
      goto LABEL_16;
    }

    if (!strncmp(v1, "ipad", 4uLL))
    {
      v16 = (os_log_s *)_CFBundleResourceLogger();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        ___CFGetProductName_block_invoke_cold_3(v16, v17, v18, v19, v20, v21, v22, v23);
      }
LABEL_39:
      v12 = @"ipad";
      goto LABEL_41;
    }
  }

  memset(v26, 0, sizeof(v26));
  size_t v25 = 256LL;
  int v2 = sysctlbyname("hw.machine", v26, &v25, 0LL, 0LL);
  if (v2 && (v2 != -1 || *__error() != 12)) {
    goto LABEL_42;
  }
  if (v25 >= 6)
  {
    if (LODWORD(v26[0]) != 1869107305 || WORD2(v26[0]) != 25966) {
      goto LABEL_18;
    }
LABEL_16:
    v12 = @"iphone";
LABEL_41:
    _CFGetProductName__cfBundlePlatform = (uint64_t)v12;
    goto LABEL_42;
  }

  if (v25 < 4) {
    goto LABEL_42;
  }
LABEL_18:
  if (LODWORD(v26[0]) == 1685016681)
  {
    v12 = @"ipod";
    goto LABEL_41;
  }

  if (LODWORD(v26[0]) == 1684099177) {
    goto LABEL_39;
  }
  if (v25 < 5) {
    goto LABEL_42;
  }
  if (LODWORD(v26[0]) == 1668571479 && BYTE4(v26[0]) == 104)
  {
    v12 = @"applewatch";
    goto LABEL_41;
  }

  if (v25 < 7) {
    goto LABEL_42;
  }
  if (LODWORD(v26[0]) == 1819308097 && *(_DWORD *)((char *)v26 + 3) == 1448371564)
  {
    v12 = @"appletv";
    goto LABEL_41;
  }

  if (v25 >= 0xD && *(void *)&v26[0] == 0x447974696C616552LL && *(void *)((char *)v26 + 5) == 0x6563697665447974LL)
  {
    v12 = @"applevision";
    goto LABEL_41;
  }

void ___CFGetProductName_block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  int v1 = 138412290;
  uint64_t v2 = _CFGetProductName__cfBundlePlatform;
  _os_log_debug_impl(&dword_180A4C000, log, OS_LOG_TYPE_DEBUG, "Using ~%@ resources", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_2_17();
}

void ___CFGetProductName_block_invoke_cold_2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void ___CFGetProductName_block_invoke_cold_3( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end