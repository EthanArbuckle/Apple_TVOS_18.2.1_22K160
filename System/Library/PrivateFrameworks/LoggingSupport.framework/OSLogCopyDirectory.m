@interface OSLogCopyDirectory
@end

@implementation OSLogCopyDirectory

BOOL ___OSLogCopyDirectory_block_invoke(uint64_t a1, int a2, const char *a3)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  int v5 = fstat(a2, &v18);
  BOOL result = 1LL;
  if (!v5 && v18.st_size)
  {
    if (!*(_BYTE *)(a1 + 84) || strcmp(a3, "version.plist"))
    {
      v7 = *(const char **)(a1 + 64);
      v8 = strrchr(a3, 47);
      if (v8) {
        v9 = v8 + 1;
      }
      else {
        v9 = a3;
      }
      snprintf(__str, 0x400uLL, "%s/%s", v7, v9);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
      {
        if (fcntl(*(_DWORD *)(a1 + 80), 50, v19) == -1)
        {
          __error();
          _os_assumes_log();
        }

        v10 = *(void **)(a1 + 40);
        strerror(*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
        _OSLogWarningMessage(v10, "copy handler failed: '%s' to '%s': %s (%d)", v11, v12, v13, v14, v15, v16, (char)v19);
      }

      else
      {
        *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) += v18.st_size;
        unint64_t v17 = *(void *)(a1 + 72);
        if (v17) {
          return *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) < v17;
        }
      }
    }

    return 1LL;
  }

  return result;
}

@end