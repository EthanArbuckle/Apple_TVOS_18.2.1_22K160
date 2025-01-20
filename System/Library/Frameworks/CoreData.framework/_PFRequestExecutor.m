@interface _PFRequestExecutor
- (BOOL)executeRequest:(id)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)executeRequest:(id)a3 onMirroringDelegate:(id)a4 error:(id *)a5;
- (BOOL)wait;
- (_PFRequestExecutor)init;
- (void)dealloc;
- (void)requestFinished;
@end

@implementation _PFRequestExecutor

- (_PFRequestExecutor)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____PFRequestExecutor;
  v2 = -[_PFRequestExecutor init](&v4, sel_init);
  if (v2) {
    v2->_requestGroup = (OS_dispatch_group *)dispatch_group_create();
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____PFRequestExecutor;
  -[_PFRequestExecutor dealloc](&v3, sel_dealloc);
}

- (BOOL)executeRequest:(id)a3 inContext:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 1;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3052000000LL;
  v21 = __Block_byref_object_copy__19;
  v22 = __Block_byref_object_dispose__19;
  uint64_t v23 = 0LL;
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __53___PFRequestExecutor_executeRequest_inContext_error___block_invoke;
  v17[3] = &unk_189EA7960;
  v17[4] = a4;
  v17[5] = self;
  v17[6] = a3;
  v17[7] = &v18;
  v17[8] = &v24;
  [a4 performBlockAndWait:v17];
  if (!*((_BYTE *)v25 + 24))
  {
    id v8 = (id)v19[5];
    if (v8)
    {
      if (a5) {
        *a5 = v8;
      }
    }

    else
    {
      uint64_t v9 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m");
      v16 = (os_log_s *)__pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentCloudKitContainer.m";
        __int16 v30 = 1024;
        int v31 = 1851;
        _os_log_fault_impl( &dword_186681000,  v16,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
      }
    }
  }

  v19[5] = 0LL;
  char v6 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v6;
}

- (BOOL)executeRequest:(id)a3 onMirroringDelegate:(id)a4 error:(id *)a5
{
  id v8 = self;
  if (self) {
    self = (_PFRequestExecutor *)self->_requestGroup;
  }
  dispatch_group_enter((dispatch_group_t)self);
  uint64_t v9 = -[NSCloudKitMirroringDelegate executeMirroringRequest:error:]((NSPersistentStoreResult *)a4, a3, (uint64_t *)a5);
  if (!v9)
  {
    if (v8) {
      requestGroup = (dispatch_group_s *)v8->_requestGroup;
    }
    else {
      requestGroup = 0LL;
    }
    dispatch_group_leave(requestGroup);
  }

  return v9 != 0LL;
}

- (BOOL)wait
{
  requestGroup = self->_requestGroup;
  dispatch_time_t v3 = dispatch_time(0LL, 600000000000LL);
  return dispatch_group_wait((dispatch_group_t)requestGroup, v3) == 0;
}

- (void)requestFinished
{
  if (self) {
    self = (_PFRequestExecutor *)self->_requestGroup;
  }
  dispatch_group_leave((dispatch_group_t)self);
}

@end