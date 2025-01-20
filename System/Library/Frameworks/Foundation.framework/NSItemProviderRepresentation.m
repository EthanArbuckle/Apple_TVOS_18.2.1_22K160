@interface NSItemProviderRepresentation
- (NSItemProviderRepresentation)initWithType:(id)a3 preferredRepresentation:(int64_t)a4 loader:(id)a5;
- (NSItemProviderRepresentation)initWithType_v2:(id)a3 preferredRepresentation:(int64_t)a4 loader:(id)a5;
- (NSString)typeIdentifier;
- (id)_loadWithOptions:(id)a3 completionBlock:(id)a4;
- (id)copyWithDoNothingLoaderBlock;
- (id)loadDataWithOptions:(id)a3 completionHandler:(id)a4;
- (id)loadDataWithOptions_v2:(id)a3 completionHandler:(id)a4;
- (id)loadFileCopyWithOptions:(id)a3 completionHandler:(id)a4;
- (id)loadFileCopyWithOptions_v2:(id)a3 completionHandler:(id)a4;
- (id)loadOpenInPlaceWithOptions:(id)a3 completionHandler:(id)a4;
- (id)loadOpenInPlaceWithOptions_v2:(id)a3 completionHandler:(id)a4;
- (id)loadWithOptions:(id)a3 completionHandler:(id)a4;
- (id)loadWithOptions_v2:(id)a3 completionHandler:(id)a4;
- (id)performProgressTrackingWithLoaderBlock:(id)a3 onCancelCallback:(id)a4;
- (int64_t)preferredRepresentation;
- (int64_t)visibility;
- (void)dealloc;
- (void)setLoaderBlock:(id)a3;
- (void)setLoaderBlock_v2:(id)a3;
- (void)setPreferredRepresentation:(int64_t)a3;
- (void)setVisibility:(int64_t)a3;
@end

@implementation NSItemProviderRepresentation

- (NSItemProviderRepresentation)initWithType_v2:(id)a3 preferredRepresentation:(int64_t)a4 loader:(id)a5
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSItemProviderRepresentation;
  v8 = -[NSItemProviderRepresentation init](&v10, sel_init);
  if (v8)
  {
    v8->_typeIdentifier = (NSString *)[a3 copy];
    v8->_loader = (id)[a5 copy];
    v8->_visibility = 0LL;
    v8->_preferredRepresentation = a4;
  }

  return v8;
}

- (NSItemProviderRepresentation)initWithType:(id)a3 preferredRepresentation:(int64_t)a4 loader:(id)a5
{
  v6[5] = *MEMORY[0x1895F89C0];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __76__NSItemProviderRepresentation_initWithType_preferredRepresentation_loader___block_invoke;
  v6[3] = &unk_189C9FFE0;
  v6[4] = a5;
  return -[NSItemProviderRepresentation initWithType_v2:preferredRepresentation:loader:]( self,  "initWithType_v2:preferredRepresentation:loader:",  a3,  a4,  v6);
}

uint64_t __76__NSItemProviderRepresentation_initWithType_preferredRepresentation_loader___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6)
{
  v8[5] = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __76__NSItemProviderRepresentation_initWithType_preferredRepresentation_loader___block_invoke_2;
  v8[3] = &unk_189C9FFB8;
  v8[4] = a3;
  return (*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t))(v6 + 16))( v6,  a2,  v8,  a4,  a5,  a6);
}

uint64_t __76__NSItemProviderRepresentation_initWithType_preferredRepresentation_loader___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSItemProviderRepresentation;
  -[NSItemProviderRepresentation dealloc](&v3, sel_dealloc);
}

- (id)copyWithDoNothingLoaderBlock
{
  v7[5] = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc((Class)objc_opt_class());
  typeIdentifier = self->_typeIdentifier;
  int64_t preferredRepresentation = self->_preferredRepresentation;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __60__NSItemProviderRepresentation_copyWithDoNothingLoaderBlock__block_invoke;
  v7[3] = &unk_189CA3260;
  v7[4] = self;
  return (id)objc_msgSend( v3,  "initWithType_v2:preferredRepresentation:loader:",  typeIdentifier,  preferredRepresentation,  v7);
}

uint64_t __60__NSItemProviderRepresentation_copyWithDoNothingLoaderBlock__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  block[6] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __60__NSItemProviderRepresentation_copyWithDoNothingLoaderBlock__block_invoke_2;
    block[3] = &unk_189C9E898;
    block[4] = *(void *)(a1 + 32);
    block[5] = a3;
    _NSIPDispatchAsyncCallback(block);
  }

  return 0LL;
}

uint64_t __60__NSItemProviderRepresentation_copyWithDoNothingLoaderBlock__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = +[NSItemRepresentationLoadResult resultWithError:]( &OBJC_CLASS___NSItemRepresentationLoadResult,  "resultWithError:",  _NSIPCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 16LL), 0LL));
  return (*(uint64_t (**)(uint64_t, NSItemRepresentationLoadResult *))(v1 + 16))(v1, v2);
}

- (id)performProgressTrackingWithLoaderBlock:(id)a3 onCancelCallback:(id)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v6 = +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  100LL);
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x2020000000LL;
  char v14 = 0;
  uint64_t v7 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke;
  v12[3] = &unk_189CA3288;
  v12[4] = a4;
  v12[5] = v13;
  -[NSProgress setCancellationHandler:](v6, "setCancellationHandler:", v12);
  v8 = +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  100LL);
  v11[0] = v7;
  v11[1] = 3221225472LL;
  v11[2] = __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_3;
  v11[3] = &unk_189CA32D8;
  v11[4] = v8;
  v11[5] = v13;
  uint64_t v9 = (*((uint64_t (**)(id, void *))a3 + 2))(a3, v11);
  if (v9) {
    -[NSProgress addChild:withPendingUnitCount:](v6, "addChild:withPendingUnitCount:", v9, 100LL);
  }
  else {
    -[NSProgress addChild:withPendingUnitCount:](v6, "addChild:withPendingUnitCount:", v8, 100LL);
  }
  _Block_object_dispose(v13, 8);
  return v6;
}

void __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke( uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_2;
  block[3] = &unk_189CA3288;
  __int128 v2 = *(_OWORD *)(a1 + 32);
  _NSIPDispatchAsyncCallback(block);
}

uint64_t __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_2( uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8LL);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }

  return result;
}

void __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  v4[7] = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_4;
  v4[3] = &unk_189CA32B0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[5] = a2;
  v4[6] = v3;
  v4[4] = v2;
  _NSIPDispatchAsyncCallback(v4);
}

uint64_t __88__NSItemProviderRepresentation_performProgressTrackingWithLoaderBlock_onCancelCallback___block_invoke_4( uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }

  return result;
}

- (id)_loadWithOptions:(id)a3 completionBlock:(id)a4
{
  v9[6] = *MEMORY[0x1895F89C0];
  v9[0] = 0LL;
  v9[1] = v9;
  v9[2] = 0x3052000000LL;
  v9[3] = __Block_byref_object_copy__25;
  v9[4] = __Block_byref_object_dispose__25;
  v9[5] = 0LL;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke;
  v8[3] = &unk_189CA3300;
  v8[4] = v9;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_2;
  v7[3] = &unk_189CA33C8;
  v7[4] = self;
  v7[5] = a3;
  void v7[6] = a4;
  v7[7] = v8;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_4_68;
  v6[3] = &unk_189CA3328;
  v6[4] = a4;
  v6[5] = v8;
  id v4 = -[NSItemProviderRepresentation performProgressTrackingWithLoaderBlock:onCancelCallback:]( self,  "performProgressTrackingWithLoaderBlock:onCancelCallback:",  v7,  v6);
  _Block_object_dispose(v9, 8);
  return v4;
}

void __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2) {
    (*(void (**)(uint64_t))(a2 + 16))(a2);
  }
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 8LL) + 16LL))();
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_3( uint64_t a1,  void *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v4 = [a2 cleanupHandler];
  uint64_t v5 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_4;
  v7[3] = &unk_189CA3350;
  v7[4] = a2;
  __int128 v8 = *(_OWORD *)(a1 + 40);
  uint64_t v9 = v4;
  return (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v7);
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (!*(void *)(a1 + 40)) {
    return (*(uint64_t (**)(void, void))(*(void *)(a1 + 48) + 16LL))(*(void *)(a1 + 48), 0LL);
  }
  id v2 = (id)[*(id *)(a1 + 32) copy];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_5;
  v4[3] = &unk_189CA3328;
  __int128 v5 = *(_OWORD *)(a1 + 48);
  [v2 setCleanupHandler:v4];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_5(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_6;
  block[3] = &unk_189CA3328;
  __int128 v2 = *(_OWORD *)(a1 + 32);
  _NSIPDispatchAsyncCallback(block);
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_64(void *a1)
{
  v4[5] = *MEMORY[0x1895F89C0];
  if (!a1[5]) {
    return (*(uint64_t (**)(void, void))(a1[6] + 16LL))(a1[6], 0LL);
  }
  __int128 v2 = +[NSItemRepresentationLoadResult resultWithError:]( &OBJC_CLASS___NSItemRepresentationLoadResult,  "resultWithError:",  _NSIPCannotLoadRepresentationError(*(void *)(a1[4] + 16LL), 0LL));
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_2_65;
  v4[3] = &unk_189C9DCE8;
  void v4[4] = a1[6];
  -[NSItemRepresentationLoadResult setCleanupHandler:](v2, "setCleanupHandler:", v4);
  return (*(uint64_t (**)(void))(a1[5] + 16LL))();
}

void __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_2_65(uint64_t a1)
{
  v1[5] = *MEMORY[0x1895F89C0];
  v1[0] = MEMORY[0x1895F87A8];
  v1[1] = 3221225472LL;
  v1[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_3_66;
  v1[3] = &unk_189C9DCE8;
  v1[4] = *(void *)(a1 + 32);
  _NSIPDispatchAsyncCallback(v1);
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_3_66(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_4_68(uint64_t a1)
{
  v4[5] = *MEMORY[0x1895F89C0];
  if (!*(void *)(a1 + 32)) {
    return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), 0LL);
  }
  __int128 v2 = +[NSItemRepresentationLoadResult resultWithError:]( &OBJC_CLASS___NSItemRepresentationLoadResult,  "resultWithError:",  _NSIPDataTransferCancelledError(0LL));
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_5_69;
  v4[3] = &unk_189C9DCE8;
  void v4[4] = *(void *)(a1 + 40);
  -[NSItemRepresentationLoadResult setCleanupHandler:](v2, "setCleanupHandler:", v4);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_5_69(uint64_t a1)
{
  v1[5] = *MEMORY[0x1895F89C0];
  v1[0] = MEMORY[0x1895F87A8];
  v1[1] = 3221225472LL;
  v1[2] = __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_6_70;
  v1[3] = &unk_189C9DCE8;
  v1[4] = *(void *)(a1 + 32);
  _NSIPDispatchAsyncCallback(v1);
}

uint64_t __65__NSItemProviderRepresentation__loadWithOptions_completionBlock___block_invoke_6_70(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (id)loadWithOptions_v2:(id)a3 completionHandler:(id)a4
{
  v5[5] = *MEMORY[0x1895F89C0];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __69__NSItemProviderRepresentation_loadWithOptions_v2_completionHandler___block_invoke;
  v5[3] = &unk_189CA33F0;
  v5[4] = a4;
  return -[NSItemProviderRepresentation _loadWithOptions:completionBlock:]( self,  "_loadWithOptions:completionBlock:",  a3,  v5);
}

void __69__NSItemProviderRepresentation_loadWithOptions_v2_completionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  block[6] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __69__NSItemProviderRepresentation_loadWithOptions_v2_completionHandler___block_invoke_2;
    block[3] = &unk_189C9E898;
    void block[4] = a2;
    block[5] = v2;
    _NSIPDispatchAsyncCallback(block);
  }

uint64_t __69__NSItemProviderRepresentation_loadWithOptions_v2_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (id)loadWithOptions:(id)a3 completionHandler:(id)a4
{
  v5[5] = *MEMORY[0x1895F89C0];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __66__NSItemProviderRepresentation_loadWithOptions_completionHandler___block_invoke;
  v5[3] = &unk_189CA33F0;
  v5[4] = a4;
  return -[NSItemProviderRepresentation loadWithOptions_v2:completionHandler:]( self,  "loadWithOptions_v2:completionHandler:",  a3,  v5);
}

uint64_t __66__NSItemProviderRepresentation_loadWithOptions_completionHandler___block_invoke( uint64_t result,  void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 16))( v2,  [a2 data],  objc_msgSend(a2, "urlWrapper"),  objc_msgSend(a2, "error"),  objc_msgSend(a2, "cleanupHandler"));
  }
  return result;
}

- (void)setLoaderBlock_v2:(id)a3
{
  self->_loader = (id)[a3 copy];
}

- (void)setLoaderBlock:(id)a3
{
  v3[5] = *MEMORY[0x1895F89C0];
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __47__NSItemProviderRepresentation_setLoaderBlock___block_invoke;
  v3[3] = &unk_189C9FFE0;
  v3[4] = a3;
  -[NSItemProviderRepresentation setLoaderBlock_v2:](self, "setLoaderBlock_v2:", v3);
}

uint64_t __47__NSItemProviderRepresentation_setLoaderBlock___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6)
{
  void v8[5] = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __47__NSItemProviderRepresentation_setLoaderBlock___block_invoke_2;
  v8[3] = &unk_189CA3418;
  v8[4] = a3;
  return (*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t))(v6 + 16))( v6,  a2,  v8,  a4,  a5,  a6);
}

uint64_t __47__NSItemProviderRepresentation_setLoaderBlock___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6)
{
  return (*(uint64_t (**)(void, NSItemRepresentationLoadResult *))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  +[NSItemRepresentationLoadResult resultWithData:urlWrapper:cleanupHandler:error:]( &OBJC_CLASS___NSItemRepresentationLoadResult,  "resultWithData:urlWrapper:cleanupHandler:error:",  a2,  a3,  a6,  a5));
}

- (id)loadDataWithOptions_v2:(id)a3 completionHandler:(id)a4
{
  v14[7] = *MEMORY[0x1895F89C0];
  uint64_t v7 = +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  100LL);
  if (-[NSItemProviderRepresentation preferredRepresentation](self, "preferredRepresentation")) {
    __int128 v8 = +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  100LL);
  }
  else {
    __int128 v8 = 0LL;
  }
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke;
  v14[3] = &unk_189CA0538;
  v14[5] = v8;
  v14[6] = a4;
  v14[4] = self;
  uint64_t v9 = -[NSItemProviderRepresentation _loadWithOptions:completionBlock:]( self,  "_loadWithOptions:completionBlock:",  a3,  v14);
  if (v8)
  {
    if (-[NSItemProviderRepresentation preferredRepresentation](self, "preferredRepresentation") == 2)
    {
      -[NSProgress addChild:withPendingUnitCount:](v7, "addChild:withPendingUnitCount:", v9, 10LL);
      uint64_t v10 = v7;
      uint64_t v11 = v8;
      uint64_t v12 = 90LL;
    }

    else
    {
      -[NSProgress addChild:withPendingUnitCount:](v7, "addChild:withPendingUnitCount:", v9, 50LL);
      uint64_t v10 = v7;
      uint64_t v11 = v8;
      uint64_t v12 = 50LL;
    }
  }

  else
  {
    uint64_t v10 = v7;
    uint64_t v11 = v9;
    uint64_t v12 = 100LL;
  }

  -[NSProgress addChild:withPendingUnitCount:](v10, "addChild:withPendingUnitCount:", v11, v12);
  return v7;
}

void __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v4 = [a2 error];
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3052000000LL;
  v24 = __Block_byref_object_copy__25;
  v25 = __Block_byref_object_dispose__25;
  uint64_t v26 = 0LL;
  uint64_t v15 = 0LL;
  v16 = &v15;
  uint64_t v17 = 0x3052000000LL;
  v18 = __Block_byref_object_copy__25;
  v19 = __Block_byref_object_dispose__25;
  id v20 = (id)[a2 error];
  if (v4) {
    goto LABEL_5;
  }
  if ([a2 data])
  {
    __int128 v5 = (NSError *)(id)[a2 data];
    uint64_t v6 = v22;
LABEL_4:
    v6[5] = (uint64_t)v5;
    goto LABEL_5;
  }

  if ([a2 urlWrapper])
  {
    uint64_t v11 = objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke_2;
    v14[3] = &unk_189CA3468;
    v14[4] = *(void *)(a1 + 32);
    v14[5] = a2;
    v14[6] = *(void *)(a1 + 48);
    objc_msgSend( *(id *)(a1 + 40),  "addChild:withPendingUnitCount:",  _NSIPCoordinatedReadForUploading(v11, (uint64_t)v14),  100);
    goto LABEL_6;
  }

  uint64_t v12 = _NSIPNoLoaderAvailableError(*(void *)(*(void *)(a1 + 32) + 16LL), 0LL);
  if (v12)
  {

    __int128 v5 = _NSIPCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 16LL), (uint64_t)v12);
    uint64_t v6 = v16;
    goto LABEL_4;
  }

void __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke_2( uint64_t a1,  void *a2,  NSError *a3)
{
  RepresentationError = a3;
  uint64_t v5 = 0LL;
  v14[1] = *(NSError **)MEMORY[0x1895F89C0];
  v14[0] = a3;
  uint64_t v6 = a3;
  if (a2 && !a3)
  {
    v13 = 0LL;
    id v7 = _NSIPCloneURLToTemporaryFolder(a2, *(void *)(*(void *)(a1 + 32) + 16LL), 0LL, &v13, v14);
    uint64_t v5 = 0LL;
    id v8 = v13;
    if (v13 && !v14[0])
    {
      uint64_t v5 = [MEMORY[0x189603F48] dataWithContentsOfURL:v7 options:1 error:v14];
      id v8 = v13;
    }

    if (v8)
    {
      uint64_t v9 = +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager");
      -[NSFileManager removeItemAtURL:error:](v9, "removeItemAtURL:error:", v13, 0LL);
    }

    uint64_t v6 = v14[0];
  }

  if (v6) {
    RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 16LL), (uint64_t)v6);
  }
  uint64_t v10 = [*(id *)(a1 + 40) cleanupHandler];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke_3;
  v12[3] = &unk_189CA3440;
  uint64_t v11 = *(void *)(a1 + 48);
  v12[4] = *(void *)(a1 + 40);
  v12[5] = v5;
  void v12[6] = RepresentationError;
  v12[7] = v11;
  v12[8] = v10;
  _NSIPDispatchAsyncCallback(v12);
}

uint64_t __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke_3( uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    id v2 = (id)[*(id *)(a1 + 32) copyWithData:*(void *)(a1 + 40) urlWrapper:0 cleanupHandler:0 error:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __73__NSItemProviderRepresentation_loadDataWithOptions_v2_completionHandler___block_invoke_4( uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id v2 = (void *)[*(id *)(a1 + 32) copyWithData:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) urlWrapper:0 cleanupHandler:0 error:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)loadDataWithOptions:(id)a3 completionHandler:(id)a4
{
  v5[5] = *MEMORY[0x1895F89C0];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __70__NSItemProviderRepresentation_loadDataWithOptions_completionHandler___block_invoke;
  v5[3] = &unk_189CA33F0;
  v5[4] = a4;
  return -[NSItemProviderRepresentation loadDataWithOptions_v2:completionHandler:]( self,  "loadDataWithOptions_v2:completionHandler:",  a3,  v5);
}

uint64_t __70__NSItemProviderRepresentation_loadDataWithOptions_completionHandler___block_invoke( uint64_t result,  void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))( v2,  [a2 data],  objc_msgSend(a2, "error"));
  }
  return result;
}

- (id)loadFileCopyWithOptions_v2:(id)a3 completionHandler:(id)a4
{
  void v14[7] = *MEMORY[0x1895F89C0];
  id v7 = +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  100LL);
  if (-[NSItemProviderRepresentation preferredRepresentation](self, "preferredRepresentation")) {
    id v8 = +[NSProgress progressWithTotalUnitCount:](&OBJC_CLASS___NSProgress, "progressWithTotalUnitCount:", 100LL);
  }
  else {
    id v8 = 0LL;
  }
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke;
  v14[3] = &unk_189CA3508;
  v14[5] = v8;
  v14[6] = a4;
  v14[4] = self;
  uint64_t v9 = -[NSItemProviderRepresentation _loadWithOptions:completionBlock:]( self,  "_loadWithOptions:completionBlock:",  a3,  v14);
  if (v8)
  {
    if (-[NSItemProviderRepresentation preferredRepresentation](self, "preferredRepresentation") == 2)
    {
      -[NSProgress addChild:withPendingUnitCount:](v7, "addChild:withPendingUnitCount:", v9, 10LL);
      uint64_t v10 = v7;
      uint64_t v11 = v8;
      uint64_t v12 = 90LL;
    }

    else
    {
      -[NSProgress addChild:withPendingUnitCount:](v7, "addChild:withPendingUnitCount:", v9, 50LL);
      uint64_t v10 = v7;
      uint64_t v11 = v8;
      uint64_t v12 = 50LL;
    }
  }

  else
  {
    uint64_t v10 = v7;
    uint64_t v11 = v9;
    uint64_t v12 = 100LL;
  }

  -[NSProgress addChild:withPendingUnitCount:](v10, "addChild:withPendingUnitCount:", v11, v12);
  return v7;
}

uint64_t __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (NSError *)[a2 error];
  uint64_t v5 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v19 = __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke_2;
  id v20 = &unk_189CA34E0;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v21 = a2;
  uint64_t v22 = v6;
  if (v4) {
    goto LABEL_2;
  }
  if ([a2 data])
  {
    uint64_t v10 = _NSIPCreateTemporaryFolder();
    if (v10)
    {
      id v8 = v10;
      id v11 = (id)softLinkUTTypeCopyDescription_0(*(void *)(*(void *)(a1 + 32) + 16LL));
      if (![v11 length]) {
        id v11 = (id)[(id)_NSFoundationBundle() localizedStringForKey:@"Document" value:&stru_189CA6A28 table:@"Extension"];
      }
      uint64_t v9 = objc_msgSend( v8,  "URLByAppendingPathComponent:",  _NSIPFilenameWithProperExtension(v11, *(void *)(*(void *)(a1 + 32) + 16)));
      objc_msgSend((id)objc_msgSend(a2, "data"), "writeToURL:atomically:", v9, 1);
      goto LABEL_17;
    }

    uint64_t v15 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_182EB1000, v15, OS_LOG_TYPE_ERROR, "Cannot create temporary file.", buf, 2u);
    }

    RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 16LL), 0LL);
  }

  else
  {
    if ([a2 urlWrapper])
    {
      uint64_t v12 = objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
      v17[0] = v5;
      v17[1] = 3221225472LL;
      v17[2] = __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke_82;
      v17[3] = &unk_189CA3468;
      v17[4] = *(void *)(a1 + 32);
      v17[5] = a2;
      v17[6] = v18;
      v13 = _NSIPCoordinatedRead(v12, (uint64_t)v17);
      [*(id *)(a1 + 40) setCompletedUnitCount:50];
      return [*(id *)(a1 + 40) addChild:v13 withPendingUnitCount:50];
    }

    RepresentationError = _NSIPNoLoaderAvailableError(*(void *)(*(void *)(a1 + 32) + 16LL), 0LL);
  }

  if (!RepresentationError)
  {
    id v8 = 0LL;
    uint64_t v9 = 0LL;
LABEL_17:
    id v7 = 0LL;
    goto LABEL_18;
  }

  uint64_t v4 = _NSIPCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 16LL), (uint64_t)RepresentationError);
LABEL_2:
  id v7 = v4;
  id v8 = 0LL;
  uint64_t v9 = 0LL;
LABEL_18:
  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
  return ((uint64_t (*)(void *, uint64_t, NSError *, char *, uint64_t))v19)( v18,  v9,  v7,  v8,  [a2 cleanupHandler]);
}

void __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  block[10] = *MEMORY[0x1895F89C0];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke_3;
  block[3] = &unk_189CA34B8;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  void block[4] = a2;
  block[5] = v6;
  block[6] = a3;
  void block[7] = a4;
  block[8] = v5;
  void block[9] = a5;
  _NSIPDispatchAsyncCallback(block);
}

uint64_t __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke_3( uint64_t a1)
{
  if (*(void *)(a1 + 64))
  {
    if (*(void *)(a1 + 32)) {
      uint64_t v2 =  -[NSSecurityScopedURLWrapper initWithURL:]( objc_alloc(&OBJC_CLASS___NSSecurityScopedURLWrapper),  "initWithURL:",  *(void *)(a1 + 32));
    }
    else {
      uint64_t v2 = 0LL;
    }
    uint64_t v3 = (void *)[*(id *)(a1 + 40) copyWithData:0 urlWrapper:v2 cleanupHandler:0 error:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  }

  if (*(void *)(a1 + 56)) {
    -[NSFileManager removeItemAtURL:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtURL:error:",  *(void *)(a1 + 56),  0LL);
  }
  uint64_t result = *(void *)(a1 + 72);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __77__NSItemProviderRepresentation_loadFileCopyWithOptions_v2_completionHandler___block_invoke_82( uint64_t a1,  void *a2,  NSError *a3)
{
  RepresentationError = a3;
  uint64_t v5 = 0LL;
  v12[1] = *(NSError **)MEMORY[0x1895F89C0];
  id v11 = 0LL;
  v12[0] = a3;
  if (a2 && !a3)
  {
    uint64_t v6 = _NSIPCloneURLToTemporaryFolder(a2, *(void *)(*(void *)(a1 + 32) + 16LL), 0LL, &v11, v12);
    if (v6) {
      BOOL v7 = v12[0] == 0LL;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      uint64_t v5 = v6;
      RepresentationError = 0LL;
    }

    else
    {
      uint64_t v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "urlWrapper"), "url");
      uint64_t v9 = _NSIPCannotCopyFileError(v8, 0LL, (uint64_t)v12[0]);
      v12[0] = v9;
      if (v9) {
        RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 16LL), (uint64_t)v9);
      }
      else {
        RepresentationError = 0LL;
      }
      uint64_t v5 = 0LL;
    }
  }

  return (*(uint64_t (**)(void, void *, NSError *, char *, uint64_t))(*(void *)(a1 + 48) + 16))( *(void *)(a1 + 48),  v5,  RepresentationError,  v11,  [*(id *)(a1 + 40) cleanupHandler]);
}

- (id)loadFileCopyWithOptions:(id)a3 completionHandler:(id)a4
{
  v5[5] = *MEMORY[0x1895F89C0];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __74__NSItemProviderRepresentation_loadFileCopyWithOptions_completionHandler___block_invoke;
  v5[3] = &unk_189CA33F0;
  v5[4] = a4;
  return -[NSItemProviderRepresentation loadFileCopyWithOptions_v2:completionHandler:]( self,  "loadFileCopyWithOptions_v2:completionHandler:",  a3,  v5);
}

uint64_t __74__NSItemProviderRepresentation_loadFileCopyWithOptions_completionHandler___block_invoke( uint64_t result,  void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))( v2,  objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url"),  objc_msgSend(a2, "error"));
  }
  return result;
}

- (id)loadOpenInPlaceWithOptions_v2:(id)a3 completionHandler:(id)a4
{
  void v5[6] = *MEMORY[0x1895F89C0];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke;
  v5[3] = &unk_189CA35A0;
  v5[4] = self;
  v5[5] = a4;
  return -[NSItemProviderRepresentation _loadWithOptions:completionBlock:]( self,  "_loadWithOptions:completionBlock:",  a3,  v5);
}

void __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  v17[1] = *(NSError **)MEMORY[0x1895F89C0];
  RepresentationError = (NSError *)[a2 error];
  uint64_t v5 = [a2 cleanupHandler];
  if (RepresentationError)
  {
    uint64_t v6 = 0LL;
LABEL_18:
    char v12 = 0;
    goto LABEL_19;
  }

  v17[0] = 0LL;
  if ([a2 data])
  {
    uint64_t v6 = _NSIPTemporaryFileName(*(const __CFString **)(*(void *)(a1 + 32) + 16LL), v17);
    if (!v6)
    {
      TemporaryFileError = _NSIPCannotCreateTemporaryFileError(0LL, (uint64_t)v17[0]);
      uint64_t v8 = TemporaryFileError;
LABEL_14:
      v17[0] = TemporaryFileError;
LABEL_15:
      if (v8) {
        RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(*(void *)(a1 + 32) + 16LL), (uint64_t)v8);
      }
      else {
        RepresentationError = 0LL;
      }
      goto LABEL_18;
    }

    char v7 = objc_msgSend((id)objc_msgSend(a2, "data"), "writeToURL:options:error:", v6, 1, v17);
    uint64_t v8 = v17[0];
    if ((v7 & 1) != 0) {
      goto LABEL_15;
    }
    TemporaryFileError = _NSIPCannotCopyFileError(0LL, 0LL, (uint64_t)v17[0]);
LABEL_13:
    uint64_t v8 = TemporaryFileError;
    uint64_t v6 = 0LL;
    goto LABEL_14;
  }

  if (![a2 urlWrapper])
  {
    TemporaryFileError = _NSIPNoLoaderAvailableError(*(void *)(*(void *)(a1 + 32) + 16LL), 0LL);
    goto LABEL_13;
  }

  if ((objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "isReadonly") & 1) != 0
    || *(void *)(*(void *)(a1 + 32) + 32LL) == 1LL)
  {
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_2;
    v16[3] = &unk_189CA3530;
    uint64_t v11 = *(void *)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    v16[5] = a2;
    v16[6] = v11;
    v16[7] = v5;
    _NSIPCoordinatedRead(v10, (uint64_t)v16);
    return;
  }

  uint64_t v6 = objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
  RepresentationError = 0LL;
  char v12 = 1;
LABEL_19:
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_5;
  v14[3] = &unk_189CA3578;
  uint64_t v13 = *(void *)(a1 + 40);
  v14[4] = v6;
  v14[5] = a2;
  v14[6] = RepresentationError;
  void v14[7] = v13;
  char v15 = v12;
  void v14[8] = v5;
  _NSIPDispatchAsyncCallback(v14);
}

void __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3)
{
  v13[1] = *(char **)MEMORY[0x1895F89C0];
  v13[0] = 0LL;
  if (a2 && !a3)
  {
    char v12 = 0LL;
    uint64_t v4 = _NSIPCloneURLToTemporaryFolder(a2, *(void *)(*(void *)(a1 + 32) + 16LL), 0LL, v13, &v12);
    if (v4) {
      BOOL v5 = v12 == 0LL;
    }
    else {
      BOOL v5 = 0;
    }
    int v6 = !v5;
    if (v5) {
      char v7 = v4;
    }
    else {
      char v7 = 0LL;
    }
    if (v6 == 1 && v12 == 0LL) {
      char v12 = _NSIPCannotCopyFileError(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "urlWrapper"), "url"), 0, 0);
    }
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_3;
    v10[3] = &unk_189CA3440;
    uint64_t v9 = *(void *)(a1 + 40);
    v10[4] = v7;
    v10[5] = v9;
    v10[6] = 0LL;
    __int128 v11 = *(_OWORD *)(a1 + 48);
    _NSIPDispatchAsyncCallback(v10);
  }

uint64_t __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_3( uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 56))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2)
    {
      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 3221225472LL;
      v7[2] = __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_4;
      v7[3] = &unk_189C9A030;
      v7[4] = v2;
      uint64_t v3 =  -[NSSecurityScopedURLWrapper initWithURL:]( objc_alloc(&OBJC_CLASS___NSSecurityScopedURLWrapper),  "initWithURL:",  *(void *)(a1 + 32),  MEMORY[0x1895F87A8],  3221225472LL,  __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_4,  &unk_189C9A030,  v2,  v8);
      uint64_t v4 = v7;
    }

    else
    {
      uint64_t v4 = 0LL;
      uint64_t v3 = 0LL;
    }

    BOOL v5 = (void *)[*(id *)(a1 + 40) copyWithData:0 urlWrapper:v3 cleanupHandler:v4 error:*(void *)(a1 + 48)];
    [v5 setWasOpenedInPlace:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

BOOL __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_4( uint64_t a1)
{
  return -[NSFileManager removeItemAtURL:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtURL:error:",  *(void *)(a1 + 32),  0LL);
}

NSProgress *__80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_5( uint64_t a1)
{
  if (*(void *)(a1 + 56))
  {
    if (*(void *)(a1 + 32)) {
      uint64_t v2 =  -[NSSecurityScopedURLWrapper initWithURL:]( objc_alloc(&OBJC_CLASS___NSSecurityScopedURLWrapper),  "initWithURL:",  *(void *)(a1 + 32));
    }
    else {
      uint64_t v2 = 0LL;
    }
    uint64_t v3 = (void *)[*(id *)(a1 + 40) copyWithData:0 urlWrapper:v2 cleanupHandler:0 error:*(void *)(a1 + 48)];
    [v3 setWasOpenedInPlace:*(unsigned __int8 *)(a1 + 72)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  uint64_t result = *(NSProgress **)(a1 + 64);
  if (result) {
    uint64_t result = (NSProgress *)((uint64_t (*)(void))result->_values)();
  }
  if (!*(void *)(a1 + 48) && !*(_BYTE *)(a1 + 72)) {
    return _NSIPCoordinatedDelete(*(void *)(a1 + 32), (uint64_t)&__block_literal_global_74);
  }
  return result;
}

void __80__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_v2_completionHandler___block_invoke_6( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (a2)
  {
    if (!a3) {
      -[NSFileManager removeItemAtURL:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtURL:error:",  a2,  0LL);
    }
  }

- (id)loadOpenInPlaceWithOptions:(id)a3 completionHandler:(id)a4
{
  v5[5] = *MEMORY[0x1895F89C0];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __77__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_completionHandler___block_invoke;
  v5[3] = &unk_189CA33F0;
  v5[4] = a4;
  return -[NSItemProviderRepresentation loadOpenInPlaceWithOptions_v2:completionHandler:]( self,  "loadOpenInPlaceWithOptions_v2:completionHandler:",  a3,  v5);
}

uint64_t __77__NSItemProviderRepresentation_loadOpenInPlaceWithOptions_completionHandler___block_invoke( uint64_t result,  void *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 16))( v2,  objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url"),  objc_msgSend(a2, "wasOpenedInPlace"),  objc_msgSend(a2, "error"));
  }
  return result;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (int64_t)visibility
{
  return self->_visibility;
}

- (void)setVisibility:(int64_t)a3
{
  self->_visibility = a3;
}

- (int64_t)preferredRepresentation
{
  return self->_preferredRepresentation;
}

- (void)setPreferredRepresentation:(int64_t)a3
{
  self->_int64_t preferredRepresentation = a3;
}

@end