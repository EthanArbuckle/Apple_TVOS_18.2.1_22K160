@interface MKBMigrator
- (BOOL)performMigration;
- (float)estimatedDuration;
- (float)migrationProgress;
- (id)dataClassName;
@end

@implementation MKBMigrator

- (id)dataClassName
{
  return @"MKBMigrator";
}

- (BOOL)performMigration
{
  time_t v13 = time(0LL);
  v2 = ctime(&v13);
  snprintf(__str, 0x400uLL, "%s/tmp/.mkb_marker", "/private/var");
  int v3 = open_dprotected_np(__str, 1793, 1, 0, 384LL);
  if (v3 == -1)
  {
    v9 = __error();
    v10 = strerror(*v9);
    NSLog(@"aks: failed to create aks marker (%s)", v10);
  }

  else
  {
    int v4 = v3;
    snprintf(__s, 0x400uLL, "Done: %s\n", v2);
    size_t v5 = strlen(__s);
    if (write(v4, __s, v5 + 1) == -1)
    {
      v6 = __error();
      v7 = strerror(*v6);
      NSLog(@"aks: failed to write aks marker (%s)", v7);
    }

    uint64_t v8 = close(v4);
  }

  uint64_t v11 = MKBKeyBagMigrateFS(v8);
  if ((_DWORD)v11) {
    NSLog(@"aks: error during migration of %s %i", "/private/var", v11);
  }
  return 1;
}

- (float)estimatedDuration
{
  return 5.0;
}

- (float)migrationProgress
{
  return 0.0;
}
@end