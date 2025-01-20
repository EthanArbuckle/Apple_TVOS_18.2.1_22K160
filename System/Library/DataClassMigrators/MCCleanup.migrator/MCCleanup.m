}

void sub_3AE8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_3B00(uint64_t result, uint64_t a2)
{
  if (a2) {
    return _DMLogFunc(v2, 3LL, @"MCCleanupMigrator: migrateCleanupMigratorWithContext failed. Error: %@");
  }
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  return result;
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}