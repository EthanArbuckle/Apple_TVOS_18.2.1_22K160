@interface IOHIDEventSystemConnectionSetQueue
@end

@implementation IOHIDEventSystemConnectionSetQueue

void ___IOHIDEventSystemConnectionSetQueue_block_invoke(uint64_t a1)
{
  mach_msg_return_t v5;
  mach_msg_return_t v6;
  os_log_s *v7;
  uint64_t v8;
  char *v9;
  mach_msg_size_t v10;
  mach_port_name_t v11;
  uint64_t v12;
  mach_msg_id_t msgh_id;
  uint64_t v14;
  int IsActive;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  char *v19;
  uint64_t v20;
  v20 = *MEMORY[0x1895F89C0];
  CFRetain(*(CFTypeRef *)(a1 + 32));
  v2 = CFGetAllocator(*(CFTypeRef *)(a1 + 32));
  v3 = (mach_msg_header_t *)MEMORY[0x186E17B58](v2, 92LL, 0LL);
  *(void *)&v3->msgh_bits = 0x5C00000000LL;
  mach_port_name_t v4 = *(_DWORD *)(*(void *)(a1 + 32) + 104LL);
  v3->msgh_remote_port = 0;
  v3->msgh_local_port = v4;
  v3->msgh_id = 0;
  v5 = mach_msg(v3, 117440518, 0, 0x5Cu, v4, 0, 0);
  if (v5)
  {
    v6 = v5;
    while (1)
    {
      v7 = (os_log_s *)_IOHIDLogCategory(9u);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = *(void *)(*(void *)(a1 + 32) + 168LL);
        v9 = mach_error_string(v6);
        *(_DWORD *)buf = 136315394;
        v17 = v8;
        v18 = 2080;
        v19 = v9;
        _os_log_impl(&dword_182DAF000, v7, OS_LOG_TYPE_INFO, "%s: mach_msg(sendPossiblePort):%s", buf, 0x16u);
      }

      if (v6 != 268451844) {
        break;
      }
      v10 = (v3->msgh_size + 71) & 0xFFFFFFFC;
      v3 = (mach_msg_header_t *)MEMORY[0x186E17B94](v2, v3, v10, 0LL);
      v3->msgh_bits = 0;
      v3->msgh_size = v10;
      v11 = *(_DWORD *)(*(void *)(a1 + 32) + 104LL);
      v3->msgh_remote_port = 0;
      v3->msgh_local_port = v11;
      v3->msgh_id = 0;
      v6 = mach_msg(v3, 117440518, 0, v10, v11, 0, 0);
      if (!v6) {
        goto LABEL_7;
      }
    }
  }

  else
  {
LABEL_7:
    v12 = *(void *)(a1 + 32);
    msgh_id = v3->msgh_id;
    if (msgh_id == 72)
    {
      os_unfair_recursive_lock_lock_with_options();
      *(_DWORD *)(v12 + 128) = 0;
      os_unfair_recursive_lock_unlock();
      v14 = *(void *)(v12 + 8);
      if (v14) {
        _IOHIDEventSystemSetPropertyForConnection( v14,  @"IOHIDEventSystemClientIsUnresponsive",  (const void *)*MEMORY[0x189604DE8],  (const void *)v12);
      }
    }

    else if (msgh_id == 66)
    {
      os_unfair_recursive_lock_lock_with_options();
      if (*(_DWORD *)(v12 + 128))
      {
        os_unfair_recursive_lock_unlock();
      }

      else
      {
        IsActive = IOHIDEventQueueIsActive(*(void *)(v12 + 24));
        os_unfair_recursive_lock_unlock();
        if (IsActive) {
          _IOHIDEventSystemConnectionQueueStart(v12);
        }
      }
    }
  }

  CFAllocatorDeallocate(v2, v3);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void ___IOHIDEventSystemConnectionSetQueue_block_invoke_20(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 112LL) = 0LL;
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end