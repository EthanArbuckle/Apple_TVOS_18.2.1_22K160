@interface CFPDObserverOnlyTombstone
+ (BOOL)replaceObserved:(uint64_t)a3 withObserved:(_xpc_connection_s *)a4 forConnection:;
- (BOOL)isEqual:(id)a3;
- (BOOL)managed;
- (id)description;
- (id)initMatchingSource:(id)a3;
- (unint64_t)hash;
- (void)_operateOnObservingConnectionsAsMultiple:(uint64_t)a3 asSingle:;
- (void)_sendNotificationToConnection:(uint64_t)a1;
- (void)alreadyLocked_transferObservingConnectionsFromSource:(id)a3;
- (void)dealloc;
- (void)notifyObservers;
- (void)removeObservingConnection:(id)a3 daemon:(id)a4;
- (void)transferObservingConnectionsToSource:(id)a3;
@end

@implementation CFPDObserverOnlyTombstone

- (id)initMatchingSource:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CFPDObserverOnlyTombstone;
  v4 = -[CFPDObserverOnlyTombstone init](&v8, sel_init);
  if (v4)
  {
    v5 = (const void *)[a3 domain];
    if (v5) {
      v4->_domain = (__CFString *)CFRetain(v5);
    }
    v6 = (const void *)[a3 container];
    v4->_shmemIndex = [a3 shmemIndex];
    v4->_lock._os_unfair_lock_opaque = 0;
    *((_BYTE *)v4 + 38) = *((_BYTE *)v4 + 38) & 0xFE | [a3 managed];
  }

  return v4;
}

- (void)alreadyLocked_transferObservingConnectionsFromSource:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner((os_unfair_lock_t)a3 + 25);
  v5 = (void *)*((void *)a3 + 9);
  if (v5)
  {
    uint64_t v12 = 0LL;
    v13 = &v12;
    uint64_t v14 = 0x3052000000LL;
    v15 = __Block_byref_object_copy__4;
    v16 = __Block_byref_object_dispose__4;
    uint64_t v17 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000LL;
    uint64_t v11 = 0LL;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __82__CFPDObserverOnlyTombstone_alreadyLocked_transferObservingConnectionsFromSource___block_invoke;
    v7[3] = &unk_1899ED738;
    v7[4] = a3;
    v7[5] = self;
    v7[6] = &v12;
    v7[7] = &v8;
    CFSetApply(v5, (uint64_t)v7);
    v6 = (OS_xpc_object *)v13[5];
    if (!v6) {
      v6 = (OS_xpc_object *)v9[3];
    }
    self->_observers._single = v6;
    CFRelease(v5);
    *((void *)a3 + 9) = 0LL;
    _Block_object_dispose(&v8, 8);
    _Block_object_dispose(&v12, 8);
  }

void __82__CFPDObserverOnlyTombstone_alreadyLocked_transferObservingConnectionsFromSource___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  __int128 v5 = *(_OWORD *)(a1 + 32);
  objc_opt_self();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __72__CFPDObserverOnlyTombstone_replaceObserved_withObserved_forConnection___block_invoke;
  v6[3] = &unk_1899ED8D0;
  __int128 v7 = v5;
  if (withClientContext((_xpc_connection_s *)a2, (uint64_t)v6))
  {
    v4 = *(__CFSet **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
    {
      if (v4) {
        __82__CFPDObserverOnlyTombstone_alreadyLocked_transferObservingConnectionsFromSource___block_invoke_cold_1();
      }
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = CFSetCreateMutable( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  &kCFTypeSetCallBacks);
      CFSetAddValue( *(CFMutableSetRef *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL),  *(const void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
      xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = 0LL;
      v4 = *(__CFSet **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    }

    else if (!v4)
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = xpc_retain(a2);
      return;
    }

    CFSetAddValue(v4, a2);
  }

+ (BOOL)replaceObserved:(uint64_t)a3 withObserved:(_xpc_connection_s *)a4 forConnection:
{
  v8[6] = *MEMORY[0x1895F89C0];
  objc_opt_self();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __72__CFPDObserverOnlyTombstone_replaceObserved_withObserved_forConnection___block_invoke;
  v8[3] = &unk_1899ED8D0;
  v8[4] = a2;
  v8[5] = a3;
  return withClientContext(a4, (uint64_t)v8);
}

- (void)_operateOnObservingConnectionsAsMultiple:(uint64_t)a3 asSingle:
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v6 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    uint64_t v9 = *(const void **)(a1 + 24);
    uint64_t v8 = (CFSetRef *)(a1 + 24);
    __int128 v7 = v9;
    if (v9)
    {
      CFTypeID v10 = CFGetTypeID(v7);
      if (v10 == CFSetGetTypeID())
      {
        (*(void (**)(uint64_t, CFSetRef))(a2 + 16))(a2, *v8);
        CFIndex Count = CFSetGetCount(*v8);
        if (Count)
        {
          if (Count == 1)
          {
            uint64_t v14 = 0LL;
            v15 = &v14;
            uint64_t v16 = 0x3052000000LL;
            uint64_t v17 = __Block_byref_object_copy__4;
            uint64_t v18 = __Block_byref_object_dispose__4;
            uint64_t v19 = 0LL;
            CFSetRef v12 = *v8;
            v13[0] = MEMORY[0x1895F87A8];
            v13[1] = 3221225472LL;
            v13[2] = __79__CFPDObserverOnlyTombstone__operateOnObservingConnectionsAsMultiple_asSingle___block_invoke;
            v13[3] = &unk_189995A70;
            v13[4] = &v14;
            CFSetApply(v12, (uint64_t)v13);
            CFRelease(*v8);
            *uint64_t v8 = (CFSetRef)v15[5];
            _Block_object_dispose(&v14, 8);
          }
        }

        else
        {
          CFRelease(*v8);
          *uint64_t v8 = 0LL;
        }
      }

      else if (*v8)
      {
        (*(void (**)(uint64_t, CFSetRef *))(a3 + 16))(a3, v8);
      }
    }

    os_unfair_lock_unlock(v6);
  }

xpc_object_t __79__CFPDObserverOnlyTombstone__operateOnObservingConnectionsAsMultiple_asSingle___block_invoke( uint64_t a1,  xpc_object_t object,  _BYTE *a3)
{
  xpc_object_t result = xpc_retain(object);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) = result;
  *a3 = 1;
  return result;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  domain = self->_domain;
  if (domain) {
    CFRelease(domain);
  }
  userOrContainer = self->_userOrContainer;
  if (userOrContainer) {
    CFRelease(userOrContainer);
  }
  -[CFPDObserverOnlyTombstone _operateOnObservingConnectionsAsMultiple:asSingle:]( (uint64_t)self,  (uint64_t)&__block_literal_global_258,  (uint64_t)&__block_literal_global_260);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CFPDObserverOnlyTombstone;
  -[CFPDObserverOnlyTombstone dealloc](&v5, sel_dealloc);
}

void __36__CFPDObserverOnlyTombstone_dealloc__block_invoke(int a1, CFTypeRef cf)
{
}

void __36__CFPDObserverOnlyTombstone_dealloc__block_invoke_2(uint64_t a1, xpc_object_t *a2)
{
}

- (BOOL)isEqual:(id)a3
{
  if (!a3)
  {
    LOBYTE(v7) = 0;
    return v7;
  }

  if (self == a3) {
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_shmemIndex != *((unsigned __int16 *)a3 + 18))
  {
    LOBYTE(v7) = 0;
    return v7;
  }

  domain = self->_domain;
  uint64_t v6 = (__CFString *)*((void *)a3 + 1);
  if (domain == v6 || (LOBYTE(v7) = 0, domain) && v6 && (int v7 = CFEqual(self->_domain, v6)) != 0)
  {
    userOrContainer = self->_userOrContainer;
    uint64_t v9 = (__CFString *)*((void *)a3 + 2);
    if (userOrContainer != v9)
    {
      LOBYTE(v7) = 0;
      if (userOrContainer && v9) {
        LOBYTE(v7) = CFEqual(self->_userOrContainer, v9) != 0;
      }
      return v7;
    }

- (unint64_t)hash
{
  domain = self->_domain;
  if (domain) {
    CFHashCode v4 = CFHash(domain);
  }
  else {
    CFHashCode v4 = 0LL;
  }
  CFHashCode userOrContainer = (CFHashCode)self->_userOrContainer;
  if (userOrContainer) {
    CFHashCode userOrContainer = CFHash((CFTypeRef)userOrContainer);
  }
  return userOrContainer ^ v4 ^ self->_shmemIndex;
}

- (void)removeObservingConnection:(id)a3 daemon:(id)a4
{
  v5[6] = *MEMORY[0x1895F89C0];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __62__CFPDObserverOnlyTombstone_removeObservingConnection_daemon___block_invoke;
  v5[3] = &unk_1899ED830;
  v5[4] = self;
  v5[5] = a3;
  os_unfair_lock_lock((os_unfair_lock_t)a4 + 12);
  __62__CFPDObserverOnlyTombstone_removeObservingConnection_daemon___block_invoke((uint64_t)v5, *((__CFSet **)a4 + 4));
  os_unfair_lock_unlock((os_unfair_lock_t)a4 + 12);
}

void __62__CFPDObserverOnlyTombstone_removeObservingConnection_daemon___block_invoke( uint64_t a1,  __CFSet *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v9 = 0LL;
  CFTypeID v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 0;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __62__CFPDObserverOnlyTombstone_removeObservingConnection_daemon___block_invoke_2;
  v7[3] = &unk_1899ED7E0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __62__CFPDObserverOnlyTombstone_removeObservingConnection_daemon___block_invoke_3;
  v6[3] = &unk_1899ED808;
  void v6[4] = v8;
  v6[5] = &v9;
  -[CFPDObserverOnlyTombstone _operateOnObservingConnectionsAsMultiple:asSingle:](v4, (uint64_t)v7, (uint64_t)v6);
  if (*((_BYTE *)v10 + 24))
  {
    id v5 = *(id *)(a1 + 32);
    CFSetRemoveValue(a2, *(const void **)(a1 + 32));
  }

  _Block_object_dispose(&v9, 8);
}

void __62__CFPDObserverOnlyTombstone_removeObservingConnection_daemon___block_invoke_2( uint64_t a1,  CFMutableSetRef theSet)
{
}

void __62__CFPDObserverOnlyTombstone_removeObservingConnection_daemon___block_invoke_3( uint64_t a1,  xpc_object_t *a2)
{
  if (*a2 == *(xpc_object_t *)(a1 + 32))
  {
    xpc_release(*a2);
    *a2 = 0LL;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

- (void)transferObservingConnectionsToSource:(id)a3
{
  v8[6] = *MEMORY[0x1895F89C0];
  id v5 = (os_unfair_lock_s *)((char *)a3 + 108);
  os_unfair_lock_lock((os_unfair_lock_t)a3 + 27);
  os_unfair_lock_lock((os_unfair_lock_t)a3 + 25);
  if (*((void *)a3 + 9)) {
    -[CFPDObserverOnlyTombstone transferObservingConnectionsToSource:].cold.1();
  }
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __66__CFPDObserverOnlyTombstone_transferObservingConnectionsToSource___block_invoke;
  v8[3] = &unk_1899ED858;
  v8[4] = self;
  v8[5] = a3;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __66__CFPDObserverOnlyTombstone_transferObservingConnectionsToSource___block_invoke_2;
  v7[3] = &unk_1899ED880;
  void v7[4] = v8;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __66__CFPDObserverOnlyTombstone_transferObservingConnectionsToSource___block_invoke_3;
  v6[3] = &unk_1899ED8A8;
  void v6[4] = v8;
  -[CFPDObserverOnlyTombstone _operateOnObservingConnectionsAsMultiple:asSingle:]( (uint64_t)self,  (uint64_t)v7,  (uint64_t)v6);
  os_unfair_lock_unlock((os_unfair_lock_t)a3 + 25);
  os_unfair_lock_unlock(v5);
}

void __66__CFPDObserverOnlyTombstone_transferObservingConnectionsToSource___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  __int128 v5 = *(_OWORD *)(a1 + 32);
  objc_opt_self();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __72__CFPDObserverOnlyTombstone_replaceObserved_withObserved_forConnection___block_invoke;
  v6[3] = &unk_1899ED8D0;
  __int128 v7 = v5;
  if (withClientContext((_xpc_connection_s *)a2, (uint64_t)v6))
  {
    uint64_t v4 = *(__CFSet **)(*(void *)(a1 + 40) + 72LL);
    if (!v4)
    {
      *(void *)(*(void *)(a1 + 40) + 72LL) = CFSetCreateMutable(0LL, 0LL, &kCFTypeSetCallBacks);
      uint64_t v4 = *(__CFSet **)(*(void *)(a1 + 40) + 72LL);
    }

    CFSetAddValue(v4, a2);
  }

void __66__CFPDObserverOnlyTombstone_transferObservingConnectionsToSource___block_invoke_2( uint64_t a1,  void *a2)
{
}

void __66__CFPDObserverOnlyTombstone_transferObservingConnectionsToSource___block_invoke_3( uint64_t a1,  xpc_object_t *a2)
{
  *a2 = 0LL;
}

void __72__CFPDObserverOnlyTombstone_replaceObserved_withObserved_forConnection___block_invoke( uint64_t a1,  uint64_t a2)
{
  v3 = *(__CFSet **)(a2 + 24);
  if (v3)
  {
    __int128 v5 = *(const void **)(a1 + 32);
    if (v5 != *(const void **)(a1 + 40))
    {
      CFSetRemoveValue(v3, v5);
      CFSetAddValue(*(CFMutableSetRef *)(a2 + 24), *(const void **)(a1 + 40));
    }
  }

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &off_18C549128,  "stringWithFormat:",  @"Tombstone for CFPDSource (domain: %@, "),  self->_domain;
  if (CFStringHasPrefix(self->_userOrContainer, @"/")) {
    uint64_t v4 = @"container: %@, ";
  }
  else {
    uint64_t v4 = @"user: %@, ";
  }
  -[NSMutableString appendFormat:](v3, "appendFormat:", v4, self->_userOrContainer);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"shmemIndex: %d"), self->_shmemIndex);
  return v3;
}

- (BOOL)managed
{
  return *((_BYTE *)self + 38) & 1;
}

- (void)_sendNotificationToConnection:(uint64_t)a1
{
  location[1] = *(id *)MEMORY[0x1895F89C0];
  if (a1)
  {
    os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 32));
    char v4 = *(_BYTE *)(a1 + 38);
    if ((v4 & 2) != 0)
    {
      *(_BYTE *)(a1 + 38) = v4 | 4;
    }

    else
    {
      *(_BYTE *)(a1 + 38) = v4 & 0xF9 | 2;
      objc_initWeak(location, (id)a1);
      keys = "CFPreferencesDomain";
      xpc_object_t values = _CFXPCCreateXPCObjectFromCFObject(*(__CFString **)(a1 + 8));
      xpc_object_t v5 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = __59__CFPDObserverOnlyTombstone__sendNotificationToConnection___block_invoke;
      handler[3] = &unk_1899ED8F8;
      objc_copyWeak(&v7, location);
      handler[4] = a1;
      handler[5] = a2;
      xpc_connection_send_message_with_reply(a2, v5, 0LL, handler);
      xpc_release(values);
      xpc_release(v5);
      objc_destroyWeak(&v7);
      objc_destroyWeak(location);
    }
  }

void __59__CFPDObserverOnlyTombstone__sendNotificationToConnection___block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    char v4 = WeakRetained;
    v3 = WeakRetained + 8;
    os_unfair_lock_lock(WeakRetained + 8);
    *(_BYTE *)(*(void *)(a1 + 32) + 38LL) &= ~2u;
    if ((*(_BYTE *)(*(void *)(a1 + 32) + 38LL) & 4) != 0) {
      -[CFPDObserverOnlyTombstone _sendNotificationToConnection:]();
    }
    os_unfair_lock_unlock(v3);
  }

- (void)notifyObservers
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = *(_BYTE *)(a1 + 38) & 1;
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  OUTLINED_FUNCTION_13(&dword_180A4C000, a2, a3, "Notifying observers of { %{public}@, managed: %d }", (uint8_t *)&v5);
  OUTLINED_FUNCTION_1_21();
}

void __44__CFPDObserverOnlyTombstone_notifyObservers__block_invoke(uint64_t a1, _xpc_connection_s *a2)
{
}

uint64_t __44__CFPDObserverOnlyTombstone_notifyObservers__block_invoke_2(uint64_t a1, void *a2)
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __44__CFPDObserverOnlyTombstone_notifyObservers__block_invoke_3;
  v3[3] = &unk_1899ED948;
  v3[4] = *(void *)(a1 + 32);
  return CFSetApply(a2, (uint64_t)v3);
}

uint64_t __44__CFPDObserverOnlyTombstone_notifyObservers__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __44__CFPDObserverOnlyTombstone_notifyObservers__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __82__CFPDObserverOnlyTombstone_alreadyLocked_transferObservingConnectionsFromSource___block_invoke_cold_1()
{
}

- (void)transferObservingConnectionsToSource:.cold.1()
{
  __assert_rtn( "-[CFPDObserverOnlyTombstone transferObservingConnectionsToSource:]",  "CFPDSource.m",  3180,  "source->_observingConnections == NULL");
}

@end