@interface CFNotificationCenterInitializeDependentNotificationIfNecessary
@end

@implementation CFNotificationCenterInitializeDependentNotificationIfNecessary

void ___CFNotificationCenterInitializeDependentNotificationIfNecessary_block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v1 = *(uint64_t **)(a1 + 32);
  v2 = (void (*)(void))v1[2];
  if (v2)
  {
    v2();
    v1 = *(uint64_t **)(a1 + 32);
  }

  if (*((_BYTE *)v1 + 40))
  {
    uint64_t v4 = 0LL;
    unint64_t v5 = 0LL;
    do
    {
      uint64_t v6 = v1[6] + v4;
      v7 = *(const __CFString **)v6;
      int v8 = *(char *)(v6 + 8);
      v16[0] = *(_DWORD *)(v6 + 9);
      *(_DWORD *)((char *)v16 + 3) = *(_DWORD *)(v6 + 12);
      switch(v8)
      {
        case 0:
          if (CFNotificationCenterGetLocalCenter_static_init != -1) {
            dispatch_once(&CFNotificationCenterGetLocalCenter_static_init, &__block_literal_global_7);
          }
          DistributedCenter = (__CFNotificationCenter *)__taskCenter;
          goto LABEL_11;
        case 1:
          DistributedCenter = CFNotificationCenterGetDistributedCenter();
          goto LABEL_11;
        case 2:
          DistributedCenter = CFNotificationCenterGetDarwinNotifyCenter();
LABEL_11:
          CFNotificationCenterAddObserver( DistributedCenter,  (const void *)0x7B,  (CFNotificationCallback)v1[3],  v7,  0LL,  (CFNotificationSuspensionBehavior)v1[4]);
          break;
        case 3:
          CStringPtr = CFStringGetCStringPtr(v7, 0x8000100u);
          if (CStringPtr || (CStringPtr = buffer, CFStringGetCString(v7, buffer, 1024LL, 0x8000100u)))
          {
            handler[0] = MEMORY[0x1895F87A8];
            handler[1] = 3221225472LL;
            handler[2] = ___registerSubNotifications_block_invoke;
            handler[3] = &__block_descriptor_56_e8_v12__0i8l;
            handler[4] = v1;
            handler[5] = v7;
            char v14 = v8;
            *(_DWORD *)v15 = v16[0];
            *(_DWORD *)&v15[3] = *(_DWORD *)((char *)v16 + 3);
            notify_register_dispatch(CStringPtr, &out_token, MEMORY[0x1895F8AE0], handler);
          }

          else
          {
            v11 = (os_log_s *)_CFOSLog();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              uint64_t v12 = *v1;
              int out_token = 138543618;
              uint64_t v18 = v12;
              __int16 v19 = 2114;
              v20 = v7;
              _os_log_error_impl( &dword_180A4C000,  v11,  OS_LOG_TYPE_ERROR,  "Failed to register dependent notification %{public}@ -> %{public}@",  (uint8_t *)&out_token,  0x16u);
            }
          }

          break;
        default:
          break;
      }

      ++v5;
      v4 += 16LL;
    }

    while (v5 < *((unsigned __int8 *)v1 + 40));
  }

@end