@interface CFXNotificationCenterCopyDebugInfo
@end

@implementation CFXNotificationCenterCopyDebugInfo

void ___CFXNotificationCenterCopyDebugInfo_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  CFStringAppend(*(CFMutableStringRef *)(a1 + 32), @"{\n");
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0LL, @"    token = %llx\n", *(void *)(a2 + 48));
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0LL, @"    name = %@\n", *(void *)a2);
  v4 = @"    object = %@\n";
  if ((*(_BYTE *)(a2 + 25) & 4) == 0
    && (CFXNotificationRegistrarGetOptions(*(void *)(*(void *)(a1 + 40) + 16LL)) & 2) == 0)
  {
    v4 = @"    object = %p\n";
  }

  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0LL, v4, *(void *)(a2 + 8));
  if ((*(void *)(a2 + 24) & 0x400LL) != 0) {
    CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0LL, @"    observer = %@\n", *(void *)(a2 + 16));
  }
  else {
    CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0LL, @"    observer = %p\n", *(void *)(a2 + 16));
  }
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0LL, @"    options = 0x%lx\n", *(void *)(a2 + 24));
  uint64_t v5 = *(void *)(a2 + 24);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *(void *)(a2 + 32);
    dladdr(*(const void **)(v8 + 16), &v12);
    v9 = *(__CFString **)(a1 + 32);
    if (v12.dli_sname) {
      CFStringAppendFormat(v9, 0LL, @"    block = %s (%p)\n", v12.dli_sname, v8);
    }
    else {
      CFStringAppendFormat(v9, 0LL, @"    block = %p\n", v8);
    }
  }

  else if ((v5 & 0x40000) != 0)
  {
    v10 = *(__CFString **)(a1 + 32);
    Name = sel_getName(*(SEL *)(a2 + 32));
    CFStringAppendFormat(v10, 0LL, @"    selector = %s\n", Name);
  }

  else if ((v5 & 0x80000) != 0)
  {
    dladdr(*(const void **)(a2 + 32), &v12);
    v6 = *(__CFString **)(a1 + 32);
    uint64_t v7 = *(void *)(a2 + 32);
    if (v12.dli_sname) {
      CFStringAppendFormat(v6, 0LL, @"    callback = %s (%p)\n", v12.dli_sname, v7);
    }
    else {
      CFStringAppendFormat(v6, 0LL, @"    callback = %p\n", v7);
    }
  }

  CFStringAppend(*(CFMutableStringRef *)(a1 + 32), @"}\n");
}

@end