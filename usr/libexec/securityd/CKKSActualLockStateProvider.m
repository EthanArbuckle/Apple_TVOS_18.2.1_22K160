@interface CKKSActualLockStateProvider
- (BOOL)queryAKSLocked;
- (CKKSActualLockStateProvider)init;
@end

@implementation CKKSActualLockStateProvider

- (CKKSActualLockStateProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CKKSActualLockStateProvider;
  return -[CKKSActualLockStateProvider init](&v3, "init");
}

- (BOOL)queryAKSLocked
{
  CFTypeRef cf = 0LL;
  *(_DWORD *)buf = -1431655766;
  uint64_t v2 = sub_1000053C4(0, buf);
  if (sub_1000190E4(v2, &cf, @"aks_get_lock_state failed: %x", v2)) {
    return buf[0] & 1;
  }
  id v3 = sub_1000AA6AC(@"ckks", 0LL);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    CFTypeRef v9 = cf;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "error querying lock state: %@", buf, 0xCu);
  }

  CFTypeRef v5 = cf;
  if (cf)
  {
    CFTypeRef cf = 0LL;
    CFRelease(v5);
  }

  return 1;
}

@end