@interface _PFManagedObjectReferenceQueue
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (_PFManagedObjectReferenceQueue)retain;
- (uint64_t)_queueForDealloc:(uint64_t)a1;
- (unint64_t)retainCount;
- (void)_processReferenceQueue:(uint64_t)a1;
- (void)_unregisterRunloopObservers;
- (void)dealloc;
- (void)release;
@end

@implementation _PFManagedObjectReferenceQueue

- (void)_processReferenceQueue:(uint64_t)a1
{
  int v43 = a2;
  uint64_t v56 = *MEMORY[0x1895F89C0];
  uint64_t v50 = a1;
  if (a1)
  {
    if ((v43 & 1) != 0)
    {
      int v2 = 9999;
LABEL_6:
      int v42 = v2;
      v39 = (os_unfair_lock_s *)(v50 + 12);
      v4 = (unsigned int *)(v50 + 8);
      while (1)
      {
        v5 = v39;
        os_unfair_lock_lock_with_options();
        v6 = *(const void **)(v50 + 32);
        *(void *)(v50 + 32) = 0LL;
        os_unfair_lock_unlock(v5);
        if (!v6) {
          return;
        }
        CFTypeRef v45 = v6;
        uint64_t Count = CFArrayGetCount((CFArrayRef)v6);
        if (!Count)
        {
          CFRelease(v45);
          return;
        }

        uint64_t v7 = *(void *)(v50 + 24);
        if ((v43 & 1) == 0 && v7)
        {
          if (!*(_DWORD *)(v7 + 16))
          {
            int v35 = [*(id *)(v50 + 24) _isDeallocating];
            if ((v35 & 1) == 0) {
              id v36 = (id)v7;
            }
            id v37 = objc_alloc(MEMORY[0x189603FA8]);
            v8 = (void *)[v37 initWithCapacity:Count];
            char v9 = 0;
            int v41 = v35 ^ 1;
            goto LABEL_16;
          }

          uint64_t v7 = 0LL;
        }

        int v41 = 0;
        v8 = 0LL;
        if (v7) {
          char v9 = v43;
        }
        else {
          char v9 = 1;
        }
LABEL_16:
        id v49 = v8;
        v40 = &v38;
        MEMORY[0x1895F8858]();
        v12 = (char *)&v38 - v10;
        if (v11 > 0x200) {
          v12 = (char *)NSAllocateScannedUncollectable();
        }
        else {
          bzero((char *)&v38 - v10, 8 * v11);
        }
        v57.location = 0LL;
        v57.length = Count;
        v47 = v12;
        CFArrayGetValues((CFArrayRef)v45, v57, (const void **)v12);
        v44 = (void *)MEMORY[0x186E3E5D8]();
        *(_DWORD *)(v50 + 48) = 1;
        if (Count >= 1)
        {
          for (uint64_t i = 0LL; i < Count; ++i)
          {
            uint64_t v14 = v47[i];
            if (v14 == 1)
            {
              uint64_t v46 = i + 1;
              v19 = (void *)v47[i + 1];
              __int128 v53 = 0u;
              __int128 v54 = 0u;
              __int128 v52 = 0u;
              __int128 v51 = 0u;
              uint64_t v20 = [v19 countByEnumeratingWithState:&v51 objects:v55 count:16];
              if (v20)
              {
                uint64_t v21 = *(void *)v52;
                do
                {
                  for (uint64_t j = 0LL; j != v20; ++j)
                  {
                    if (*(void *)v52 != v21) {
                      objc_enumerationMutation(v19);
                    }
                    uint64_t v23 = *(void *)(*((void *)&v51 + 1) + 8 * j);
                    v24 = (unsigned int *)(v23 + 8);
                    while (!__ldaxr(v24))
                    {
                      if (!__stlxr(1u, v24))
                      {
                        if ((v9 & 1) == 0)
                        {
                          v26 = (void *)[(id)v23 objectID];
                          if (v23)
                          {
                            if ((*(_BYTE *)(v23 + 17) & 2) != 0)
                            {
                              v27 = v26;
                              if (([v26 isTemporaryID] & 1) == 0) {
                                [v49 addObject:v27];
                              }
                            }
                          }

                          [(id)v7 _forgetObject:v23 propagateToObjectStore:0 removeFromRegistry:1];
                        }

                        if (*MEMORY[0x1896049A0]) {
                          NSRecordAllocationEvent();
                        }
                        [(id)v23 dealloc];
                        goto LABEL_55;
                      }
                    }

                    __clrex();
                    if (!*(void *)(v23 + 56))
                    {
                      do
                        unsigned int v28 = __ldaxr(v4);
                      while (__stlxr(v28 + 1, v4));
                      *(void *)(v23 + 56) = v50;
                    }

LABEL_55:
                    ;
                  }

                  uint64_t v20 = [v19 countByEnumeratingWithState:&v51 objects:v55 count:16];
                }

                while (v20);
              }

              if (v19) {
                CFRelease(v19);
              }
              uint64_t i = v46;
            }

            else
            {
              v15 = (unsigned int *)(v14 + 8);
              while (!__ldaxr(v15))
              {
                if (!__stlxr(1u, v15))
                {
                  v17 = (void *)[(id)v14 objectID];
                  if ((v9 & 1) == 0)
                  {
                    if (v14)
                    {
                      if ((*(_BYTE *)(v14 + 17) & 2) != 0)
                      {
                        v18 = v17;
                        if (([v17 isTemporaryID] & 1) == 0) {
                          [v49 addObject:v18];
                        }
                      }
                    }

                    [(id)v7 _forgetObject:v14 propagateToObjectStore:0 removeFromRegistry:1];
                  }

                  if (*MEMORY[0x1896049A0]) {
                    NSRecordAllocationEvent();
                  }
                  [(id)v14 dealloc];
                  goto LABEL_65;
                }
              }

              __clrex();
              if (!*(void *)(v14 + 56))
              {
                do
                  unsigned int v29 = __ldaxr(v4);
                while (__stlxr(v29 + 1, v4));
                *(void *)(v14 + 56) = v50;
              }
            }

- (_PFManagedObjectReferenceQueue)retain
{
  p_cd_rc = &self->_cd_rc;
  do
    unsigned int v3 = __ldaxr((unsigned int *)p_cd_rc);
  while (__stlxr(v3 + 1, (unsigned int *)p_cd_rc));
  return self;
}

- (uint64_t)_queueForDealloc:(uint64_t)a1
{
  if (!a1) {
    return 0LL;
  }
  v4 = (os_unfair_lock_s *)(a1 + 12);
  os_unfair_lock_lock_with_options();
  uint64_t v6 = *(void *)(a1 + 24);
  Mutable = *(__CFArray **)(a1 + 32);
  if (v6)
  {
    if (!Mutable)
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x189604DB0], 0LL, 0LL);
      *(void *)(a1 + 32) = Mutable;
    }

    CFArrayAppendValue(Mutable, a2);
    BOOL v7 = 0;
  }

  else
  {
    BOOL v7 = Mutable != 0LL;
  }

  if (*(void *)(a1 + 40) && !*(_DWORD *)(a1 + 20) && *(void *)(a1 + 24)) {
    *(_DWORD *)(a1 + 20) = 1;
  }
  os_unfair_lock_unlock(v4);
  if (v6) {
    return 0LL;
  }
  if (*MEMORY[0x1896049A0]) {
    NSRecordAllocationEvent();
  }
  char v9 = a2 + 2;
  while (!__ldaxr(v9))
  {
    if (!__stlxr(1u, v9))
    {
      [a2 dealloc];
      goto LABEL_20;
    }
  }

  __clrex();
LABEL_20:
  uint64_t v8 = 1LL;
  if (v7) {
    -[_PFManagedObjectReferenceQueue _processReferenceQueue:](a1, 1);
  }
  return v8;
}

- (void)release
{
  if (self)
  {
    p_cd_rc = &self->_cd_rc;
    do
      int v3 = __ldaxr((unsigned int *)p_cd_rc);
    while (__stlxr(v3 - 1, (unsigned int *)p_cd_rc));
    if (v3 <= 0)
    {
      self->_cd_rc += 0x20000000;
      -[_PFManagedObjectReferenceQueue dealloc](self, "dealloc");
    }
  }

- (void)_unregisterRunloopObservers
{
  if (a1)
  {
    *(_DWORD *)(a1 + 20) = -1;
    int v2 = (os_unfair_lock_s *)(a1 + 12);
    os_unfair_lock_lock_with_options();
    int v3 = *(__CFRunLoopObserver **)(a1 + 40);
    *(void *)(a1 + 40) = 0LL;
    os_unfair_lock_unlock(v2);
    if (v3)
    {
      Main = CFRunLoopGetMain();
      CFRunLoopObserverInvalidate(v3);
      CFRunLoopRemoveObserver(Main, v3, (CFRunLoopMode)*MEMORY[0x1896051A8]);
      v5[0] = MEMORY[0x1895F87A8];
      v5[1] = 3221225472LL;
      v5[2] = __61___PFManagedObjectReferenceQueue__unregisterRunloopObservers__block_invoke;
      v5[3] = &unk_189EA86D8;
      v5[4] = a1;
      v5[5] = v3;
      dispatch_async(MEMORY[0x1895F8AE0], v5);
    }
  }

- (unint64_t)retainCount
{
  return self->_cd_rc + 1LL;
}

- (BOOL)_tryRetain
{
  return 0;
}

- (BOOL)_isDeallocating
{
  return 1;
}

- (void)dealloc
{
  if (!self->_context)
  {
    -[_PFManagedObjectReferenceQueue _unregisterRunloopObservers]((uint64_t)self);
    -[_PFManagedObjectReferenceQueue _processReferenceQueue:]((uint64_t)self, 1);
    v3.receiver = self;
    v3.super_class = (Class)&OBJC_CLASS____PFManagedObjectReferenceQueue;
    -[_PFManagedObjectReferenceQueue dealloc](&v3, sel_dealloc);
  }

@end