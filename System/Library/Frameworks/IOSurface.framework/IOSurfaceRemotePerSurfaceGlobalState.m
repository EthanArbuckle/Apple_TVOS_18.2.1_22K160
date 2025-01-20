@interface IOSurfaceRemotePerSurfaceGlobalState
+ (id)globalStateForSurface:(__IOSurfaceClient *)a3 mappedAddress:(void *)a4 mappedSize:(unint64_t)a5 extraData:(id)a6;
- (IOSurfaceRemotePerSurfaceGlobalState)initWithSurfaceID:(unsigned int)a3 mappedAddress:(void *)a4 mappedSize:(unint64_t)a5 extraData:(id)a6;
- (id)mergeExtraData:(id)a3;
- (void)dealloc;
@end

@implementation IOSurfaceRemotePerSurfaceGlobalState

+ (id)globalStateForSurface:(__IOSurfaceClient *)a3 mappedAddress:(void *)a4 mappedSize:(unint64_t)a5 extraData:(id)a6
{
  id v9 = a6;
  if (globalStateForSurface_mappedAddress_mappedSize_extraData__onceToken != -1) {
    dispatch_once(&globalStateForSurface_mappedAddress_mappedSize_extraData__onceToken, &__block_literal_global_1);
  }
  uint64_t ID = IOSurfaceClientGetID((uint64_t)a3);
  [MEMORY[0x189607968] numberWithUnsignedInt:ID];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)globalStateForSurface_mappedAddress_mappedSize_extraData__lock);
  [(id)globalStateForSurface_mappedAddress_mappedSize_extraData__table objectForKey:v11];
  v12 = (IOSurfaceRemotePerSurfaceGlobalState *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = -[IOSurfaceRemotePerSurfaceGlobalState initWithSurfaceID:mappedAddress:mappedSize:extraData:]( objc_alloc(&OBJC_CLASS___IOSurfaceRemotePerSurfaceGlobalState),  "initWithSurfaceID:mappedAddress:mappedSize:extraData:",  ID,  a4,  a5,  v9);
    [(id)globalStateForSurface_mappedAddress_mappedSize_extraData__table setObject:v12 forKey:v11];
  }

  os_unfair_lock_unlock((os_unfair_lock_t)globalStateForSurface_mappedAddress_mappedSize_extraData__lock);

  return v12;
}

void __97__IOSurfaceRemotePerSurfaceGlobalState_globalStateForSurface_mappedAddress_mappedSize_extraData___block_invoke()
{
  globalStateForSurface_mappedAddress_mappedSize_extraData__lock = (uint64_t)calloc(1uLL, 4uLL);
  uint64_t v0 = [MEMORY[0x189607920] strongToWeakObjectsMapTable];
  v1 = (void *)globalStateForSurface_mappedAddress_mappedSize_extraData__table;
  globalStateForSurface_mappedAddress_mappedSize_extraData__table = v0;
}

- (IOSurfaceRemotePerSurfaceGlobalState)initWithSurfaceID:(unsigned int)a3 mappedAddress:(void *)a4 mappedSize:(unint64_t)a5 extraData:(id)a6
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IOSurfaceRemotePerSurfaceGlobalState;
  result = -[IOSurfaceRemotePerSurfaceGlobalState init](&v10, sel_init, *(void *)&a3, a4, a5, a6);
  result->_csid = a3;
  result->_mapped_address = a4;
  result->_mapped_size = a5;
  return result;
}

- (id)mergeExtraData:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_extraData;
  if (!v5)
  {
    v6 = (OS_xpc_object *)v4;
    extraData = self->_extraData;
    self->_extraData = v6;
    goto LABEL_5;
  }

  v6 = v5;
  if (v4)
  {
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __55__IOSurfaceRemotePerSurfaceGlobalState_mergeExtraData___block_invoke;
    v9[3] = &unk_189B5D578;
    v6 = v5;
    objc_super v10 = v6;
    xpc_dictionary_apply(v4, v9);
    extraData = v10;
LABEL_5:
  }

  os_unfair_lock_unlock(&self->_lock);

  return v6;
}

uint64_t __55__IOSurfaceRemotePerSurfaceGlobalState_mergeExtraData___block_invoke( uint64_t a1,  const char *a2,  void *a3)
{
  return 1LL;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  mapped_address = self->_mapped_address;
  if (mapped_address) {
    munmap(mapped_address, self->_mapped_size);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IOSurfaceRemotePerSurfaceGlobalState;
  -[IOSurfaceRemotePerSurfaceGlobalState dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
}

@end