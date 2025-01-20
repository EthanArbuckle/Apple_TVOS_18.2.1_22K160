@interface DYEAGLDebugFunctionPlayer
+ (void)_resolveDepthWithWidth:(int)a3 height:(int)a4 numSamples:(int)a5 buffer:(float *)a6;
+ (void)_resolveStencilWithWidth:(int)a3 height:(int)a4 numSamples:(int)a5 buffer:(char *)a6;
- (BOOL)_isBoundObjectAlive:(unsigned int)a3 isObjectFunc:(void *)a4;
- (BOOL)_isContextModifiable;
- (BOOL)_switchToWireframeFramebuffer;
- (BOOL)isFunctionEnabled;
- (BOOL)shouldExecuteGraphicsFunction;
- (DYEAGLDebugFunctionPlayer)initWithCaptureStore:(id)a3;
- (DYLayerManager)strongLayerManager;
- (id).cxx_construct;
- (void)_changeTextureToWidth:(int)a3 height:(int)a4 imageFormatInfo:(ImageFormatInfo *)a5 texels:(char *)a6;
- (void)_copyColorAttachmentToPresentTexture:(unsigned int)a3 imageInfo:(ImageInfo *)a4;
- (void)_copyDepthOrStencilAttachmentToPresent:(unsigned int)a3 type:(unsigned int)a4;
- (void)_copyRenderbufferColorAttachmentToPresent:(unsigned int)a3 color:(unsigned int)a4 isWireframe:(BOOL)a5;
- (void)_copyTextureColorAttachmentToPresent:(unsigned int)a3;
- (void)_imageInfoForAttachment:(unsigned int)a3 outImageInfo:(ImageInfo *)a4;
- (void)_onResourceUpdated:(unsigned int)a3 target:(unsigned int)a4 dispatcher:(Dispatcher *)a5;
- (void)_presentFramebufferWithWireframe:(BOOL)a3 wireframeLineColor:(unsigned int)a4;
- (void)_renderPresentTextureWithColor:(unsigned int)a3 enableBlend:(BOOL)a4 texBlitProgram:(unsigned int)a5;
- (void)_switchToOriginalFramebuffer;
- (void)dealloc;
- (void)executePlatformFunction;
- (void)performPostGraphicsFunctionDispatchActions:(BOOL)a3;
- (void)prepareForCaptureExecution;
- (void)setEngine:(id)a3;
@end

@implementation DYEAGLDebugFunctionPlayer

- (DYLayerManager)strongLayerManager
{
  return (DYLayerManager *)objc_loadWeakRetained((id *)&self->super._layerManager);
}

+ (void)_resolveDepthWithWidth:(int)a3 height:(int)a4 numSamples:(int)a5 buffer:(float *)a6
{
  if (a5 >= 2 && a4 >= 1)
  {
    int v6 = 0;
    v7 = a6;
    do
    {
      if (a3 >= 1)
      {
        for (int i = 0; i != a3; ++i)
        {
          uint64_t v9 = 0LL;
          float v10 = 0.0;
          do
            float v10 = v10 + v7[v9++];
          while (a5 != (_DWORD)v9);
          v7 += (a5 - 1) + 1;
          *a6++ = (float)(1.0 / (float)a5) * v10;
        }
      }

      ++v6;
    }

    while (v6 != a4);
  }

+ (void)_resolveStencilWithWidth:(int)a3 height:(int)a4 numSamples:(int)a5 buffer:(char *)a6
{
  if (a5 >= 2 && a4 >= 1)
  {
    int v6 = 0;
    v7 = a6;
    do
    {
      if (a3 >= 1)
      {
        for (int i = 0; i != a3; ++i)
        {
          uint64_t v9 = 0LL;
          int v10 = 0;
          do
            v10 += v7[v9++];
          while (a5 != (_DWORD)v9);
          v7 += a5;
          *a6++ = v10 / a5;
        }
      }

      ++v6;
    }

    while (v6 != a4);
  }

- (DYEAGLDebugFunctionPlayer)initWithCaptureStore:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___DYEAGLDebugFunctionPlayer;
  int v6 = -[DYEAGLDebugFunctionPlayer initWithCaptureStore:](&v16, "initWithCaptureStore:", v4);
  if (v6)
  {
    uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableSet, v5);
    sharegroupSet = v6->_sharegroupSet;
    v6->_sharegroupSet = (NSMutableSet *)v7;

    v6->_wireframeRenderbuffer = kDYReservedGLNameWireframeRenderbuffer;
    v6->_wireframeFramebuffer = kDYReservedGLNameWireframeFramebuffer;
    v6->_wireframeRenderbufferFormat = 0;
    v6->_presentRenderbuffer = kDYReservedGLNamePresentRenderbuffer;
    v6->_presentFramebuffer = kDYReservedGLNamePresentFramebuffer;
    v6->_presentTexture = kDYReservedGLNamePresentTexture;
    v14[0] = 0LL;
    v14[1] = v14;
    v14[2] = 0x3032000000LL;
    v14[3] = sub_7358;
    v14[4] = sub_7368;
    uint64_t v9 = v6;
    v15 = v9;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_7370;
    v13[3] = &unk_24708;
    v13[4] = v14;
    DYSetResourceUpdateCallbackBlock(v13, v10);
    v11 = v9;
    _Block_object_dispose(v14, 8);
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DYEAGLDebugFunctionPlayer;
  -[DYEAGLDebugFunctionPlayer dealloc](&v3, "dealloc");
}

- (void)setEngine:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DYEAGLDebugFunctionPlayer;
  -[DYEAGLDebugFunctionPlayer setEngine:](&v7, "setEngine:", v4);
  uint64_t v5 = (NSMutableIndexSet *)objc_claimAutoreleasedReturnValue( [*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__engine] disabledFunctions]);
  disabledFunctions = self->_disabledFunctions;
  self->_disabledFunctions = v5;
}

- (BOOL)isFunctionEnabled
{
  if (self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__mainExecutionMode]) {
    return -[NSMutableIndexSet containsIndex:]( self->_disabledFunctions,  "containsIndex:",  *(unsigned int *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__currentExecutionModeFunctionIndex]) ^ 1;
  }
  else {
    return 1;
  }
}

- (BOOL)shouldExecuteGraphicsFunction
{
  uint64_t v3 = OBJC_IVAR___DYFunctionPlayer__engine;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__engine] delegate]);
  char v5 = objc_opt_respondsToSelector(v4, "shouldExecuteGraphicsFunction");

  if ((v5 & 1) == 0) {
    goto LABEL_28;
  }
  int v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super.DYGLFunctionPlayer_opaque[v3] delegate]);
  unsigned __int8 v7 = [v6 shouldExecuteGraphicsFunction];

  v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super.DYGLFunctionPlayer_opaque[v3] delegate]);
  unsigned int v9 = [v8 shouldCallSuper];

  if (v9)
  {
    v22 = self;
    uint64_t v10 = &v22;
LABEL_23:
    v10[1] = (DYEAGLDebugFunctionPlayer *)&OBJC_CLASS___DYEAGLDebugFunctionPlayer;
    return objc_msgSendSuper2((objc_super *)v10, "shouldExecuteGraphicsFunction", v21);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super.DYGLFunctionPlayer_opaque[v3] delegate]);
  int v12 = [v11 shouldReturn];

  if ((v12 & 1) == 0)
  {
LABEL_28:
    if (-[DYEAGLDebugFunctionPlayer isFunctionEnabled](self, "isFunctionEnabled"))
    {
      if (!self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__mainExecutionMode]) {
        goto LABEL_22;
      }
      int v13 = **(_DWORD **)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function];
      if (v13 <= 822)
      {
        BOOL v18 = (v13 - 139) > 7 || ((1 << (v13 + 117)) & 0x91) == 0;
        if (v18 && v13 != 382 && v13 != 384) {
          goto LABEL_22;
        }
      }

      else
      {
        unsigned int v14 = v13 - 823;
        BOOL v15 = v14 > 0x16;
        int v16 = (1 << v14) & 0x780003;
        if (v15 || v16 == 0) {
          goto LABEL_22;
        }
      }

      unsigned int v19 = *(_DWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__currentExecutionModeFunctionIndex];
      if (v19 < [*(id *)&self->super.DYGLFunctionPlayer_opaque[v3] targetFunctionIndex])
      {
LABEL_22:
        v21 = self;
        uint64_t v10 = &v21;
        goto LABEL_23;
      }
    }

    return 0;
  }

  return v7;
}

- (void)performPostGraphicsFunctionDispatchActions:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = OBJC_IVAR___DYFunctionPlayer__engine;
  int v6 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__engine] delegate]);
  char v7 = objc_opt_respondsToSelector(v6, "performPostGraphicsFunctionDispatchActions:");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super.DYGLFunctionPlayer_opaque[v5] delegate]);
    [v8 performPostGraphicsFunctionDispatchActions:v3];

    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super.DYGLFunctionPlayer_opaque[v5] delegate]);
    unsigned int v10 = [v9 shouldCallSuper];

    if (v10)
    {
      v53.receiver = self;
      v53.super_class = (Class)&OBJC_CLASS___DYEAGLDebugFunctionPlayer;
      -[DYEAGLDebugFunctionPlayer performPostGraphicsFunctionDispatchActions:]( &v53,  "performPostGraphicsFunctionDispatchActions:",  v3);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super.DYGLFunctionPlayer_opaque[v5] delegate]);
    unsigned __int8 v12 = [v11 shouldReturn];

    if ((v12 & 1) != 0) {
      return;
    }
  }

  uint64_t v13 = OBJC_IVAR___DYFunctionPlayer__function;
  uint64_t v14 = *(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function];
  int v15 = *(_DWORD *)v14;
  if (*(int *)v14 <= 381)
  {
    BOOL v18 = (v15 - 139) <= 7 && ((1 << (v15 + 117)) & 0x91) != 0 || v15 == 28;
    if (!v18 && v15 != 36) {
      goto LABEL_39;
    }
LABEL_22:
    id v19 = *(id *)&self->super.DYGLFunctionPlayer_opaque[v5];
    unsigned int v20 = -[DYEAGLDebugFunctionPlayer _isContextModifiable](self, "_isContextModifiable");
    int v21 = *(_DWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__currentExecutionModeFunctionIndex];
    else {
      unsigned int v22 = 0;
    }
    if (v22 != 1)
    {
LABEL_64:

      return;
    }

    int v23 = 0;
    LOBYTE(v52[0]) = 0;
    LOBYTE(v50) = 0;
    uint64_t v24 = OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo;
    if (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                   + 104LL) >= 3uLL)
    {
      uint64_t v25 = OBJC_IVAR___DYGLFunctionPlayer__disp;
      uint64_t v26 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
      int v23 = (*(uint64_t (**)(void, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                       + 1144LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx],  35977LL);
      (*(void (**)(void, uint64_t, id *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v25] + 792LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v26],  36388LL,  v52);
      (*(void (**)(void, uint64_t, id **))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v25] + 792LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v26],  36387LL,  &v50);
      if (LOBYTE(v52[0]) == 1 && !(_BYTE)v50) {
        (*(void (**)(void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v25] + 7256LL))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v26]);
      }
    }

    if (!-[DYEAGLDebugFunctionPlayer _switchToWireframeFramebuffer](self, "_switchToWireframeFramebuffer"))
    {
LABEL_59:
      if ([v19 enableDrawCallPresent]) {
        -[DYEAGLDebugFunctionPlayer _presentFramebufferWithWireframe:wireframeLineColor:]( self,  "_presentFramebufferWithWireframe:wireframeLineColor:",  [v19 enableWireframePresent],  objc_msgSend(v19, "wireframeLineColor"));
      }
      if (LOBYTE(v52[0]) == 1 && !(_BYTE)v50) {
        (*(void (**)(void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
      }
                                       + 7264LL))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx]);
      goto LABEL_64;
    }

    uint64_t v27 = *(void *)&self->super.DYGLFunctionPlayer_opaque[v13];
    int v28 = *(_DWORD *)v27;
    if (*(int *)v27 <= 145)
    {
      if (v28 == 139)
      {
        uint64_t v32 = 0LL;
        uint64_t v33 = 0LL;
        v30 = (unsigned int **)(v27 + 120);
        uint64_t v29 = **(unsigned int **)(v27 + 96);
        goto LABEL_47;
      }

      if (v28 != 143) {
        goto LABEL_58;
      }
      uint64_t v29 = 0LL;
      v30 = (unsigned int **)(v27 + 96);
      uint64_t v32 = **(unsigned int **)(v27 + 120);
      v34 = *(uint64_t **)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__argumentPointers + 32];
    }

    else
    {
      if (v28 != 146)
      {
        if (v28 == 823)
        {
          uint64_t v32 = 0LL;
          uint64_t v33 = 0LL;
          v30 = (unsigned int **)(v27 + 120);
          v31 = *(unsigned int **)(v27 + 144);
          uint64_t v29 = **(unsigned int **)(v27 + 96);
          goto LABEL_45;
        }

        if (v28 == 824)
        {
          uint64_t v29 = 0LL;
          v30 = (unsigned int **)(v27 + 96);
          v31 = *(unsigned int **)(v27 + 168);
          uint64_t v32 = **(unsigned int **)(v27 + 120);
          uint64_t v33 = **(void **)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__argumentPointers + 32];
LABEL_45:
          uint64_t v37 = *v31;
LABEL_48:
          if (!v3)
          {
            uint64_t v38 = **v30;
            if ((int)v38 >= 1 && v23 == 0)
            {
              uint64_t v40 = **(unsigned int **)(v27 + 72);
              if (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v24] + 104LL) == 1LL) {
                v41 = &OBJC_IVAR___DYEAGLDebugFunctionPlayer__fixedWireframeRenderer;
              }
              else {
                v41 = &OBJC_IVAR___DYEAGLDebugFunctionPlayer__shaderWireframeRenderer;
              }
              uint64_t v42 = *v41;
              [v19 wireframeLineWidth];
              (*(void (**)(unsigned __int8 *, DYEAGLDebugFunctionPlayer *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v42] + 16LL))( &self->super.DYGLFunctionPlayer_opaque[v42],  self,  v40,  v29,  v38,  v32,  v33,  v37);
            }
          }
        }

- (void)executePlatformFunction
{
  uint64_t v3 = OBJC_IVAR___DYFunctionPlayer__engine;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__engine] delegate]);
  char v5 = objc_opt_respondsToSelector(v4, "executePlatformFunction");

  if ((v5 & 1) == 0) {
    goto LABEL_20;
  }
  int v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super.DYGLFunctionPlayer_opaque[v3] delegate]);
  [v6 executePlatformFunction];

  char v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super.DYGLFunctionPlayer_opaque[v3] delegate]);
  unsigned int v8 = [v7 shouldCallSuper];

  if (v8)
  {
    v24.receiver = self;
    v24.super_class = (Class)&OBJC_CLASS___DYEAGLDebugFunctionPlayer;
    -[DYEAGLFunctionPlayer executePlatformFunction](&v24, "executePlatformFunction");
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super.DYGLFunctionPlayer_opaque[v3] delegate]);
  unsigned __int8 v10 = [v9 shouldReturn];

  if ((v10 & 1) == 0)
  {
LABEL_20:
    uint64_t v11 = *(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function];
    int v12 = *(_DWORD *)v11;
    if (-[DYEAGLDebugFunctionPlayer isFunctionEnabled](self, "isFunctionEnabled"))
    {
      if (v12 > -8180)
      {
      }

      else
      {
        switch(v12)
        {
          case -12287:
            v22.receiver = self;
            v22.super_class = (Class)&OBJC_CLASS___DYEAGLDebugFunctionPlayer;
            -[DYEAGLFunctionPlayer executePlatformFunction](&v22, "executePlatformFunction");
            uint64_t v15 = **(void **)(v11 + 96);
            BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer strongLayerManager](self, "strongLayerManager"));
            v17 = (void *)objc_claimAutoreleasedReturnValue([v16 layerForID:v15]);

            BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v17 drawableProperties]);
            id v19 = [v18 mutableCopy];

            unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
            [v19 setObject:v20 forKey:kEAGLDrawablePropertyRetainedBacking];

            [v17 setDrawableProperties:v19];
            return;
          case -8190:
            return;
          case -8188:
            v23.receiver = self;
            v23.super_class = (Class)&OBJC_CLASS___DYEAGLDebugFunctionPlayer;
            -[DYEAGLFunctionPlayer executePlatformFunction](&v23, "executePlatformFunction");
            uint64_t v13 = -[NSNumber initWithUnsignedLongLong:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedLongLong:",  **(void **)(v11 + 120));
            if ((-[NSMutableSet containsObject:](self->_sharegroupSet, "containsObject:", v13) & 1) == 0)
            {
              -[NSMutableSet addObject:](self->_sharegroupSet, "addObject:", v13);
              uint64_t v14 = OBJC_IVAR___DYGLFunctionPlayer__ctx;
              DYReserveGLObjects( *(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx],  1609LL,  &self->_wireframeRenderbuffer,  1LL);
              DYReserveGLObjects( *(void *)&self->super.DYGLFunctionPlayer_opaque[v14],  1608LL,  &self->_wireframeFramebuffer,  1LL);
              DYReserveGLObjects( *(void *)&self->super.DYGLFunctionPlayer_opaque[v14],  1609LL,  &self->_presentRenderbuffer,  1LL);
              DYReserveGLObjects( *(void *)&self->super.DYGLFunctionPlayer_opaque[v14],  1608LL,  &self->_presentFramebuffer,  1LL);
              DYReserveGLObjects( *(void *)&self->super.DYGLFunctionPlayer_opaque[v14],  1600LL,  &self->_presentTexture,  1LL);
            }

            if (**(_DWORD **)(v11 + 72) >= 2u) {
              [*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx] setParameter:610 to:&unk_2AAC8];
            }

            return;
        }
      }

      v21.receiver = self;
      v21.super_class = (Class)&OBJC_CLASS___DYEAGLDebugFunctionPlayer;
      -[DYEAGLFunctionPlayer executePlatformFunction](&v21, "executePlatformFunction");
    }
  }

- (void)_onResourceUpdated:(unsigned int)a3 target:(unsigned int)a4 dispatcher:(Dispatcher *)a5
{
  if (a4 == 35648)
  {
    sub_43EC((uint64_t)&self->_shaderWireframeRenderer, a5, *(uint64_t *)&a3);
  }

  else if (a4 == 35656)
  {
    sub_3D6C((uint64_t)&self->_shaderWireframeRenderer, (id **)a5, *(uint64_t *)&a3);
  }

- (BOOL)_switchToWireframeFramebuffer
{
  uint64_t v3 = OBJC_IVAR___DYGLFunctionPlayer__disp;
  uint64_t v4 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
  (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                          + 832LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx],  36006LL,  &self->_origFramebuffer);
  if (!self->_origFramebuffer) {
    return 0;
  }
  (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 832LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  36007LL,  &v21);
  uint64_t v5 = 36064LL;
  (*(void (**)(void, uint64_t, uint64_t, uint64_t, _BYTE *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                     + 5440LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  36009LL,  36064LL,  36049LL,  v20);
  (*(void (**)(void, uint64_t, uint64_t, uint64_t, int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                   + 5440LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  36009LL,  36064LL,  36048LL,  &v19);
  if (!v19)
  {
    uint64_t v5 = 36096LL;
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, _BYTE *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                       + 5440LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  36009LL,  36096LL,  36049LL,  v20);
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                     + 5440LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  36009LL,  36096LL,  36048LL,  &v19);
    if (!v19)
    {
      uint64_t v5 = 36128LL;
      (*(void (**)(void, uint64_t, uint64_t, uint64_t, _BYTE *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                         + 5440LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  36009LL,  36128LL,  36049LL,  v20);
      (*(void (**)(void, uint64_t, uint64_t, uint64_t, int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                       + 5440LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  36009LL,  36128LL,  36048LL,  &v19);
      if (!v19) {
        return 0;
      }
    }
  }

  memset(v15, 0, sizeof(v15));
  int v16 = 0;
  uint64_t v17 = 0x100000001LL;
  v18[0] = 0LL;
  *(void *)((char *)v18 + 5) = 0LL;
  -[DYEAGLDebugFunctionPlayer _imageInfoForAttachment:outImageInfo:]( self,  "_imageInfoForAttachment:outImageInfo:",  v5,  v15);
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5376LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  36009LL,  self->_wireframeFramebuffer);
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5328LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  36161LL,  self->_wireframeRenderbuffer);
  (*(void (**)(void, uint64_t, uint64_t, int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                          + 5360LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  36161LL,  36162LL,  &v14);
  (*(void (**)(void, uint64_t, uint64_t, int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                          + 5360LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  36161LL,  36163LL,  &v13);
  if (self->_wireframeRenderbufferFormat)
  {
    int v6 = v16;
    int v7 = v14;
    goto LABEL_15;
  }

  self->_wireframeRenderbufferFormat = 32856;
  unint64_t v9 = *(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                 + 104LL);
  if (v9 == 2)
  {
    unsigned __int8 v10 = (const char *)(*(uint64_t (**)(void, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                   + 936LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  7939LL);
    if (!v10 || !strstr(v10, "GL_EXT_texture_rg")) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  if (v9 >= 3) {
LABEL_13:
  }
    self->_wireframeRenderbufferFormat = 33321;
LABEL_14:
  int v6 = v16;
  int v7 = ~v16;
  int v14 = ~v16;
LABEL_15:
  if (v6 != v7 || (_DWORD)v17 != v13)
  {
    (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5352LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  36161LL,  self->_wireframeRenderbufferFormat);
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                      + 5432LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  36009LL,  36064LL,  36161LL,  self->_wireframeRenderbuffer);
  }

  (*(void (**)(void, uint64_t, float *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 824LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  3106LL,  v22);
  (*(void (**)(void, uint64_t, _BYTE *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 792LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  3107LL,  v12);
  BOOL v8 = 1;
  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                     + 392LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  1LL,  1LL,  1LL,  1LL);
  (*(void (**)(void, float, float, float, float))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                             + 96LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  0.0,  0.0,  0.0,  0.0);
  (*(void (**)(void, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 80LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  0x4000LL);
  (*(void (**)(void, float, float, float, float))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                             + 96LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  v22[0],  v22[1],  v22[2],  v22[3]);
  (*(void (**)(void, void, void, void, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                 + 392LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  v12[0],  v12[1],  v12[2],  v12[3]);
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5328LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v4],  36161LL,  v21);
  return v8;
}

- (void)_switchToOriginalFramebuffer
{
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                  + 5376LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx],  36009LL,  self->_origFramebuffer);
}

- (void)_presentFramebufferWithWireframe:(BOOL)a3 wireframeLineColor:(unsigned int)a4
{
  BOOL v4 = a3;
  uint64_t v6 = OBJC_IVAR___DYGLFunctionPlayer__disp;
  uint64_t v7 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
  (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                          + 832LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx],  36006LL,  &v69);
  if (v69)
  {
    (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                            + 832LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v7],  36007LL,  &v68);
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                                              + 5440LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v7],  36009LL,  36064LL,  36049LL,  &v67);
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                                     + 5440LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v7],  36009LL,  36064LL,  36048LL,  &v66);
    if (v66)
    {
      uint64_t v72 = 0LL;
      uint64_t v73 = 0LL;
      int v75 = 0;
      uint64_t v74 = 0LL;
      uint64_t v76 = 0x100000001LL;
      v77[0] = 0LL;
      *(void *)((char *)v77 + 5) = 0LL;
      -[DYEAGLDebugFunctionPlayer _imageInfoForAttachment:outImageInfo:]( self,  "_imageInfoForAttachment:outImageInfo:",  36064LL,  &v72);
      BOOL v8 = kEAGLColorFormatRGBA8;
      if ((HIDWORD(v73) & 0xFFFFFFFD) == 0x8C41) {
        unint64_t v9 = kEAGLColorFormatSRGBA8;
      }
      else {
        unint64_t v9 = kEAGLColorFormatRGBA8;
      }
      v60 = v9;
      if (v66 == 36161)
      {
        unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer currentRenderbufferDrawableMap](self, "currentRenderbufferDrawableMap"));
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v67));
        int v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v11]);

        if (v12)
        {
          int v13 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer strongLayerManager](self, "strongLayerManager"));
          int v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layerForID:", objc_msgSend(v12, "unsignedLongLongValue")));

          if (v14) {
            goto LABEL_14;
          }
        }

        else
        {
        }
      }
    }

    else
    {
      v60 = 0LL;
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer strongLayerManager](self, "strongLayerManager"));
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v15 currentTopLayer]);

    if (!v14)
    {
LABEL_40:

      return;
    }

    BOOL v8 = kEAGLColorFormatRGBA8;
LABEL_14:
    int v16 = v60;
    if (v60) {
      uint64_t v17 = v60;
    }
    else {
      uint64_t v17 = v8;
    }
    v60 = v17;

    uint64_t v58 = OBJC_IVAR___DYGLFunctionPlayer__ctx;
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx] sharegroup]);

    int v19 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer strongLayerManager](self, "strongLayerManager"));
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 layerForID:v18]);

    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 drawableProperties]);
    v57 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:kEAGLDrawablePropertyColorFormat]);

    if (v20 != v14) {
      goto LABEL_21;
    }
    [v14 bounds];
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    [v14 bounds];
    v79.origin.x = v30;
    v79.origin.y = v31;
    v79.size.width = v32;
    v79.size.height = v33;
    v78.origin.x = v23;
    v78.origin.y = v25;
    v78.size.width = v27;
    v78.size.height = v29;
    if (!CGRectEqualToRect(v78, v79)
      || ([v14 contentsScale], double v35 = v34, objc_msgSend(v14, "contentsScale"), v35 != v36)
      || (uint64_t v37 = v14, ([v57 isEqualToString:v60] & 1) == 0))
    {
LABEL_21:
      v70 = kEAGLDrawablePropertyColorFormat;
      v71 = v60;
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v71,  &v70,  1LL));
      if (v20)
      {
        sub_A58C((uint64_t)&v72, 1, 1);
        [v14 transform];
        v62[4] = v62[12];
        v62[5] = v62[13];
        v62[6] = v62[14];
        v62[7] = v62[15];
        v62[0] = v62[8];
        v62[1] = v62[9];
        v62[2] = v62[10];
        v62[3] = v62[11];
        [v20 setTransform:v62];
        [v14 anchorPoint];
        objc_msgSend(v20, "setAnchorPoint:");
        [v14 bounds];
        objc_msgSend(v20, "setBounds:");
        [v14 contentsScale];
        objc_msgSend(v20, "setContentsScale:");
        [v20 setDrawableProperties:v38];
      }

      else
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer strongLayerManager](self, "strongLayerManager"));
        [v14 bounds];
        double v41 = v40;
        double v43 = v42;
        double v45 = v44;
        double v47 = v46;
        [v14 contentsScale];
        unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v39,  "createLayerWithID:contentRect:contentsScale:properties:isCoreAnimationSurface:",  v18,  v38,  0,  v41,  v43,  v45,  v47,  v48));

        sub_A58C((uint64_t)&v72, 1, 1);
        [v14 transform];
        *(_OWORD *)&v63[8] = *(_OWORD *)&v63[25];
        *(_OWORD *)&v63[10] = *(_OWORD *)&v63[27];
        *(_OWORD *)&v63[12] = *(_OWORD *)&v63[29];
        *(_OWORD *)&v63[14] = *(_OWORD *)&v63[31];
        *(_OWORD *)v63 = *(_OWORD *)&v63[17];
        *(_OWORD *)&v63[2] = *(_OWORD *)&v63[19];
        *(_OWORD *)&v63[4] = *(_OWORD *)&v63[21];
        *(_OWORD *)&v63[6] = *(_OWORD *)&v63[23];
        [v20 setTransform:v63];
        [v14 anchorPoint];
        objc_msgSend(v20, "setAnchorPoint:");
      }

      sub_A654((uint64_t)&v72);
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6] + 5328LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v7],  36161LL,  self->_presentRenderbuffer);
      [*(id *)&self->super.DYGLFunctionPlayer_opaque[v58] renderbufferStorage:36161 fromDrawable:v20];
      +[CATransaction flush](&OBJC_CLASS___CATransaction, "flush");
      (*(void (**)(void, uint64_t, uint64_t, uint64_t *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                                  + 5360LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v7],  36161LL,  36164LL,  &v72);
      InternalFormatInfo = (__int128 *)GPUTools::GL::GetInternalFormatInfo((GPUTools::GL *)v72, v49);
      __int128 v52 = InternalFormatInfo[1];
      __int128 v51 = InternalFormatInfo[2];
      __int128 v53 = *InternalFormatInfo;
      *(_OWORD *)&self->_presentRenderbufferInternalFormatInfo.rBits = *(__int128 *)((char *)InternalFormatInfo + 44);
      *(_OWORD *)&self->_presentRenderbufferInternalFormatInfo.bComponentType = v52;
      *(_OWORD *)&self->_presentRenderbufferInternalFormatInfo.sComponentType = v51;
      *(_OWORD *)&self->_presentRenderbufferInternalFormatInfo.internalFormat = v53;
      (*(void (**)(void, uint64_t, uint64_t, int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                              + 5360LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v7],  36161LL,  36162LL,  self->_presentRenderbufferResolution);
      (*(void (**)(void, uint64_t, uint64_t, int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                              + 5360LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v7],  36161LL,  36163LL,  &self->_presentRenderbufferResolution[1]);
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6] + 5376LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v7],  36009LL,  self->_presentFramebuffer);
      (*(void (**)(void, uint64_t, uint64_t, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                                        + 5432LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v7],  36009LL,  36064LL,  36161LL,  self->_presentRenderbuffer);
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6] + 5376LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v7],  36009LL,  v69);

      uint64_t v37 = v20;
    }

    (*(void (**)(void, uint64_t, uint64_t, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                                              + 5440LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v7],  36009LL,  36096LL,  36048LL,  &v65);
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                                              + 5440LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v7],  36009LL,  36128LL,  36048LL,  &v64);
    if (v66 || v65 || v64)
    {
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472LL;
      v61[2] = sub_8E48;
      v61[3] = &unk_24730;
      v61[4] = self;
      v54 = objc_retainBlock(v61);
      if (v66)
      {
        int v55 = GPUTools::GL::DYIsAttachmentWritable(36064LL, v54);
        if (v66 == 36161) {
          -[DYEAGLDebugFunctionPlayer _copyRenderbufferColorAttachmentToPresent:color:isWireframe:]( self,  "_copyRenderbufferColorAttachmentToPresent:color:isWireframe:",  36064LL,  0xFFFFFFFFLL,  0LL);
        }
        else {
          -[DYEAGLDebugFunctionPlayer _copyTextureColorAttachmentToPresent:]( self,  "_copyTextureColorAttachmentToPresent:",  36064LL);
        }
      }

      else if (v65)
      {
        int v55 = GPUTools::GL::DYIsAttachmentWritable(36096LL, v54);
        -[DYEAGLDebugFunctionPlayer _copyDepthOrStencilAttachmentToPresent:type:]( self,  "_copyDepthOrStencilAttachmentToPresent:type:",  36096LL,  v65);
      }

      else
      {
        int v55 = GPUTools::GL::DYIsAttachmentWritable(36128LL, v54);
        -[DYEAGLDebugFunctionPlayer _copyDepthOrStencilAttachmentToPresent:type:]( self,  "_copyDepthOrStencilAttachmentToPresent:type:",  36128LL,  v64);
      }

      if (v55)
      {
        if (v4)
        {
          (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                          + 5376LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v7],  36009LL,  self->_wireframeFramebuffer);
          -[DYEAGLDebugFunctionPlayer _copyRenderbufferColorAttachmentToPresent:color:isWireframe:]( self,  "_copyRenderbufferColorAttachmentToPresent:color:isWireframe:",  36064LL,  a4,  1LL);
        }
      }

      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6] + 5328LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v7],  36161LL,  self->_presentRenderbuffer);
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer strongLayerManager](self, "strongLayerManager"));
      [v56 prepareLayerForPresent:v37];

      [*(id *)&self->super.DYGLFunctionPlayer_opaque[v58] presentRenderbuffer:36161];
    }

    (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6] + 5328LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v7],  36161LL,  v68);
    (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6] + 5376LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v7],  36009LL,  v69);

    goto LABEL_40;
  }

- (void)_copyRenderbufferColorAttachmentToPresent:(unsigned int)a3 color:(unsigned int)a4 isWireframe:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v9 = OBJC_IVAR___DYGLFunctionPlayer__disp;
  uint64_t v10 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
  (*(void (**)(void, uint64_t, void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                                           + 5440LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx],  36009LL,  *(void *)&a3,  36049LL,  &v27);
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9] + 5328LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v10],  36161LL,  v27);
  unsigned int v21 = 0LL;
  double v22 = 0LL;
  unsigned int v24 = 0;
  uint64_t v23 = 0LL;
  uint64_t v25 = 0x100000001LL;
  v26[0] = 0LL;
  *(void *)((char *)v26 + 5) = 0LL;
  -[DYEAGLDebugFunctionPlayer _imageInfoForAttachment:outImageInfo:]( self,  "_imageInfoForAttachment:outImageInfo:",  v7,  &v21);
  if (v5)
  {
    uint64_t v12 = 1LL;
  }

  else if (GPUTools::GL::IsIntegerFormat((GPUTools::GL *)HIDWORD(v21), v11))
  {
    else {
      uint64_t v12 = 3LL;
    }
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  if (SHIDWORD(v26[0]) < 1)
  {
    -[DYEAGLDebugFunctionPlayer _copyColorAttachmentToPresentTexture:imageInfo:]( self,  "_copyColorAttachmentToPresentTexture:imageInfo:",  v7,  &v21);
    -[DYEAGLDebugFunctionPlayer _renderPresentTextureWithColor:enableBlend:texBlitProgram:]( self,  "_renderPresentTextureWithColor:enableBlend:texBlitProgram:",  v6,  v5,  v12);
  }

  else
  {
    (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9]
                                                            + 832LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v10],  36006LL,  &v20);
    (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9]
                                                            + 832LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v10],  36010LL,  &v19);
    (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9] + 5376LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v10],  36008LL,  v20);
    (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9] + 5376LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v10],  36009LL,  self->_presentFramebuffer);
    if (self->_presentRenderbufferResolution[0] == v24
      && self->_presentRenderbufferResolution[1] == (_DWORD)v25
      && self->_presentRenderbufferInternalFormatInfo.internalFormat == HIDWORD(v22))
    {
      uint64_t v14 = *(void *)&self->super.DYGLFunctionPlayer_opaque[v9];
      uint64_t v15 = *(void *)&self->super.DYGLFunctionPlayer_opaque[v10];
      if (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                     + 104LL) < 3uLL)
        (*(void (**)(uint64_t))(v14 + 8208))(v15);
      else {
        (*(void (**)(uint64_t, void, void))(v14 + 6040))(v15, 0LL, 0LL);
      }
    }

    else
    {
      (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9]
                                                              + 832LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v10],  32873LL,  &v18);
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9] + 40LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v10],  3553LL,  self->_presentTexture);
      -[DYEAGLDebugFunctionPlayer _changeTextureToWidth:height:imageFormatInfo:texels:]( self,  "_changeTextureToWidth:height:imageFormatInfo:texels:",  v24,  v25,  &v21,  0LL);
      (*(void (**)(void, uint64_t, uint64_t, uint64_t, void, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9]
                                                                                + 5416LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v10],  36009LL,  v7,  3553LL,  self->_presentTexture,  0LL);
      uint64_t v16 = *(void *)&self->super.DYGLFunctionPlayer_opaque[v9];
      uint64_t v17 = *(void *)&self->super.DYGLFunctionPlayer_opaque[v10];
      if (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                     + 104LL) < 3uLL)
        (*(void (**)(uint64_t))(v16 + 8208))(v17);
      else {
        (*(void (**)(uint64_t, void, void))(v16 + 6040))(v17, 0LL, 0LL);
      }
      (*(void (**)(void, uint64_t, uint64_t, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9]
                                                                        + 5432LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v10],  36009LL,  v7,  36161LL,  self->_presentRenderbuffer);
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9] + 40LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v10],  3553LL,  v18);
      -[DYEAGLDebugFunctionPlayer _renderPresentTextureWithColor:enableBlend:texBlitProgram:]( self,  "_renderPresentTextureWithColor:enableBlend:texBlitProgram:",  v6,  v5,  v12);
    }

    (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9] + 5376LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v10],  36008LL,  v19);
  }

- (void)_copyTextureColorAttachmentToPresent:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  int v12 = 0;
  uint64_t v11 = 0LL;
  uint64_t v13 = 0x100000001LL;
  v14[0] = 0LL;
  *(void *)((char *)v14 + 5) = 0LL;
  -[DYEAGLDebugFunctionPlayer _imageInfoForAttachment:outImageInfo:]( self,  "_imageInfoForAttachment:outImageInfo:",  *(void *)&a3,  &v9);
  -[DYEAGLDebugFunctionPlayer _copyColorAttachmentToPresentTexture:imageInfo:]( self,  "_copyColorAttachmentToPresentTexture:imageInfo:",  v3,  &v9);
  int IsIntegerFormat = GPUTools::GL::IsIntegerFormat((GPUTools::GL *)HIDWORD(v9), v5);
  uint64_t v8 = 0LL;
  if (IsIntegerFormat)
  {
    else {
      uint64_t v8 = 3LL;
    }
  }

  -[DYEAGLDebugFunctionPlayer _renderPresentTextureWithColor:enableBlend:texBlitProgram:]( self,  "_renderPresentTextureWithColor:enableBlend:texBlitProgram:",  0xFFFFFFFFLL,  0LL,  v8);
}

- (void)_copyColorAttachmentToPresentTexture:(unsigned int)a3 imageInfo:(ImageInfo *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = OBJC_IVAR___DYGLFunctionPlayer__disp;
  uint64_t v8 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
  (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                          + 832LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx],  36006LL,  &v12);
  (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7] + 832LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v8],  36010LL,  &v11);
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7] + 5376LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v8],  36008LL,  v12);
  (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7] + 832LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v8],  32873LL,  &v10);
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7] + 40LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v8],  3553LL,  self->_presentTexture);
  -[DYEAGLDebugFunctionPlayer _changeTextureToWidth:height:imageFormatInfo:texels:]( self,  "_changeTextureToWidth:height:imageFormatInfo:texels:",  a4->var2,  a4->var3,  a4,  0LL);
  if (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                 + 104LL) < 3uLL)
  {
    (*(void (**)(void, uint64_t, void, void, void, void, void, void, int))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7]
                                                                                                 + 448LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v8],  3553LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a4->var2,  a4->var3);
  }

  else
  {
    (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7]
                                                            + 832LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v8],  3074LL,  &v9);
    (*(void (**)(void, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7] + 1888LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v8],  v5);
    (*(void (**)(void, uint64_t, void, void, void, void, void, void, int))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7]
                                                                                                 + 448LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v8],  3553LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a4->var2,  a4->var3);
    (*(void (**)(void, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7] + 1888LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v8],  v9);
  }

  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7] + 40LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v8],  3553LL,  v10);
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7] + 5376LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v8],  36008LL,  v11);
}

- (void)_copyDepthOrStencilAttachmentToPresent:(unsigned int)a3 type:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer context](self, "context", *(void *)&a3, *(void *)&a4));
  sub_4948(v43, v6);

  v42[0] = v43;
  v42[1] = -[DYEAGLDebugFunctionPlayer gliDispatch](self, "gliDispatch");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer captureSessionInfo](self, "captureSessionInfo"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contextInfoForContext:", -[DYEAGLDebugFunctionPlayer ctxID](self, "ctxID")));
  id v9 = [v8 api];

  GPUTools::GL::GetFramebufferAttachmentInfo(v42, v9, 36009LL, v4, v36);
  memset(v32, 0, sizeof(v32));
  unsigned int v33 = 0;
  uint64_t v34 = 0x100000001LL;
  memset(v35, 0, 13);
  GPUTools::GL::GetImageInfo(v42, v9, v37, v38, v40, v32);
  if (v35[1] <= 1) {
    uint64_t v10 = 1LL;
  }
  else {
    uint64_t v10 = v35[1];
  }
  size_t v11 = (v10 << (2 * ((_DWORD)v4 == 36096))) * (int)v34 * (uint64_t)(int)v33;
  posix_memalign(&__memptr, 8uLL, v11);
  if (__memptr)
  {
    if (v38 == 36161)
    {
      uint64_t v12 = OBJC_IVAR___DYGLFunctionPlayer__disp;
      uint64_t v13 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
      (*(void (**)(void, uint64_t, _DWORD *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                        + 832LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx],  36007LL,  v44);
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v12] + 5328LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v13],  36161LL,  v37);
    }

    else
    {
      *(void *)((char *)&v27 + 7) = 0LL;
      *(void *)&__int128 v27 = 0LL;
      GPUTools::GL::DYGetTextureTargetInfo();
      uint64_t v12 = OBJC_IVAR___DYGLFunctionPlayer__disp;
      uint64_t v13 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
      (*(void (**)(void, void, _DWORD *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                       + 832LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx],  0LL,  v44);
      (*(void (**)(void, void, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v12] + 40LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v13],  v38,  v37);
    }

    if (v38 == 34067) {
      unint64_t v14 = v39;
    }
    else {
      unint64_t v14 = v38;
    }
    if ((_DWORD)v4 == 36096) {
      int v15 = 6402;
    }
    else {
      int v15 = 6401;
    }
    if ((_DWORD)v4 == 36096) {
      unsigned int v16 = 5126;
    }
    else {
      unsigned int v16 = 5121;
    }
    __int128 v27 = xmmword_23800;
    uint64_t v28 = 0LL;
    uint64_t v29 = 0LL;
    __int16 v30 = 0;
    unsigned int v26 = 0;
    uint64_t v17 = (const char *)(*(uint64_t (**)(void, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v12]
                                                                   + 936LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v13],  7939LL);
    unsigned int v18 = strstr(v17, "GL_APPLE_row_bytes");
    GPUTools::GL::SavePixelStorePackState(v42, v9, v18 != 0LL, &v27);
    memset(v24, 0, sizeof(v24));
    HIDWORD(v24[0]) = 1;
    int v25 = 0;
    GPUTools::GL::ApplyPixelStorePackState(v42, v9, v18 != 0LL, v24);
    uint64_t v20 = OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo;
    if (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                   + 104LL) >= 3uLL)
    {
      (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v12]
                                                              + 832LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v13],  35053LL,  &v26);
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v12] + 5136LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v13],  35051LL,  0LL);
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v12] + 1560LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v13],  32875LL,  v41);
    }

    unsigned int ShouldUseGLIReadTextureData = GPUTools::GL::ShouldUseGLIReadTextureData((GPUTools::GL *)v42, v19);
    GPUTools::GL::GetImageData( (GPUTools::GL *)v42,  (const Dispatcher *)v14,  v40,  v15,  v16,  ShouldUseGLIReadTextureData,  (BOOL)__memptr,  v22);
    if (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v20] + 104LL) >= 3uLL) {
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v12] + 5136LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v13],  35051LL,  v26);
    }
    GPUTools::GL::ApplyPixelStorePackState(v42, v9, v18 != 0LL, &v27);
    if ((_DWORD)v4 == 36096) {
      +[DYEAGLDebugFunctionPlayer _resolveDepthWithWidth:height:numSamples:buffer:]( &OBJC_CLASS___DYEAGLDebugFunctionPlayer,  "_resolveDepthWithWidth:height:numSamples:buffer:",  v33,  v34,  v35[1],  __memptr);
    }
    else {
      +[DYEAGLDebugFunctionPlayer _resolveStencilWithWidth:height:numSamples:buffer:]( &OBJC_CLASS___DYEAGLDebugFunctionPlayer,  "_resolveStencilWithWidth:height:numSamples:buffer:",  v33,  v34,  v35[1],  __memptr);
    }
    uint64_t v23 = 40LL;
    if (v38 == 36161) {
      uint64_t v23 = 5328LL;
    }
    (*(void (**)(void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v12] + v23))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v13]);
    (*(void (**)(void, uint64_t, _OWORD *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v12] + 832LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v13],  32873LL,  v24);
    (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v12] + 40LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v13],  3553LL,  self->_presentTexture);
    *(int32x2_t *)&__int128 v27 = vdup_n_s32(0x1909u);
    DWORD2(v27) = v16;
    -[DYEAGLDebugFunctionPlayer _changeTextureToWidth:height:imageFormatInfo:texels:]( self,  "_changeTextureToWidth:height:imageFormatInfo:texels:",  v33,  v34,  &v27,  __memptr);
    free(__memptr);
    (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v12] + 40LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v13],  3553LL,  LODWORD(v24[0]));
    -[DYEAGLDebugFunctionPlayer _renderPresentTextureWithColor:enableBlend:texBlitProgram:]( self,  "_renderPresentTextureWithColor:enableBlend:texBlitProgram:",  0xFFFFFFFFLL,  0LL,  0LL);
  }

  else
  {
    dy_abort("Unable to allocate %lu bytes for depth buffer\n", v11);
    __break(1u);
  }

- (void)_renderPresentTextureWithColor:(unsigned int)a3 enableBlend:(BOOL)a4 texBlitProgram:(unsigned int)a5
{
  uint64_t v26 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx] sharegroup]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer strongLayerManager](self, "strongLayerManager"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 layerForID:v8]);

  uint64_t v11 = OBJC_IVAR___DYGLFunctionPlayer__disp;
  uint64_t v12 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
  double v35 = v10;
  (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                          + 832LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx],  32873LL,  &v38);
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v11] + 40LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v12],  3553LL,  self->_presentTexture);
  (*(void (**)(void, uint64_t, void, uint64_t, int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v11]
                                                                  + 1000LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v12],  3553LL,  0LL,  4096LL,  &v37);
  (*(void (**)(void, uint64_t, void, uint64_t, int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v11]
                                                                  + 1000LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v12],  3553LL,  0LL,  4097LL,  &v36);
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v11] + 40LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v12],  3553LL,  v38);
  int v14 = v36;
  int v13 = v37;
  [v10 bounds];
  double v16 = v15;
  double v18 = v17;
  [v10 contentsScale];
  double v20 = v19;
  [v10 contentsScale];
  int v21 = v26;
  double v22 = v16 * v20;
  double v24 = v18 * v23;
  +[DYEAGLDebugFunctionPlayer shrinkSourceSize:toDestSize:]( &OBJC_CLASS___DYEAGLDebugFunctionPlayer,  "shrinkSourceSize:toDestSize:",  (double)v13,  (double)v14,  v22,  v18 * v23);
  LODWORD(v26) = vcvtpd_s64_f64(v25);
  uint64_t v28 = vcvtpd_s64_f64(v27);
  int v29 = (int)v24;
  else {
    int v30 = (int)v22 - v26 + 1;
  }
  else {
    int v31 = v29 - v28 + 1;
  }
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v11] + 5376LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v12],  36009LL,  self->_presentFramebuffer);
  (*(void (**)(void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v11] + 720LL))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v12]);
  if (v21) {
    uint64_t v32 = 0LL;
  }
  else {
    uint64_t v32 = 0x4000LL;
  }
  LODWORD(v34) = a5;
  BYTE5(v33) = 0;
  BYTE4(v33) = v21;
  LODWORD(v33) = a3;
  -[DYEAGLFunctionPlayer drawTexture:target:framebuffer:bounds:clearBits:modulateColor:enableBlend:rotated:texBlitProgram:]( self,  "drawTexture:target:framebuffer:bounds:clearBits:modulateColor:enableBlend:rotated:texBlitProgram:",  self->_presentTexture,  3553LL,  self->_presentFramebuffer,  (v30 >> 1) | ((unint64_t)(v31 >> 1) << 32),  v26 | (v28 << 32),  v32,  v33,  v34);
}

- (void)_changeTextureToWidth:(int)a3 height:(int)a4 imageFormatInfo:(ImageFormatInfo *)a5 texels:(char *)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  memset(v29, 0, sizeof(v29));
  *(_DWORD *)int v30 = 0;
  *(void *)&v30[4] = 0x100000001LL;
  v31[0] = 0LL;
  *(void *)((char *)v31 + 5) = 0LL;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer context](self, "context"));
  sub_4948(v28, v11);

  v27[0] = v28;
  v27[1] = -[DYEAGLDebugFunctionPlayer gliDispatch](self, "gliDispatch");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer captureSessionInfo](self, "captureSessionInfo"));
  int v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contextInfoForContext:", -[DYEAGLDebugFunctionPlayer ctxID](self, "ctxID")));
  id v14 = [v13 api];

  GPUTools::GL::GetImageInfo(v27, v14, 3553LL, 0LL, v29);
  if (*(void *)v30 != __PAIR64__(v8, v9) || a6 || LODWORD(v29[0]) != a5->var0)
  {
    unsigned int v26 = 0;
    __int128 v22 = xmmword_23800;
    uint64_t v23 = 0LL;
    uint64_t v24 = 0LL;
    __int16 v25 = 0;
    uint64_t v15 = OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo;
    uint64_t v16 = OBJC_IVAR___DYGLFunctionPlayer__disp;
    uint64_t v17 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
    if (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                   + 104LL) > 2uLL)
    {
      (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                              + 832LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx],  35055LL,  &v26);
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v16] + 5136LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v17],  35052LL,  0LL);
    }

    double v18 = (const char *)(*(uint64_t (**)(void, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v16]
                                                                   + 936LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v17],  7939LL);
    double v19 = strstr(v18, "GL_APPLE_row_bytes");
    GPUTools::GL::SavePixelStoreUnpackState(v27, v14, v19 != 0LL, &v22);
    memset(v20, 0, sizeof(v20));
    HIDWORD(v20[0]) = 1;
    int v21 = 0;
    GPUTools::GL::ApplyPixelStoreUnpackState(v27, v14, v19 != 0LL, v20);
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v16]
                                                              + 2432LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v17],  3553LL,  10241LL,  9728LL);
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v16]
                                                              + 2432LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v17],  3553LL,  10240LL,  9728LL);
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v16]
                                                              + 2432LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v17],  3553LL,  10242LL,  33071LL);
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v16]
                                                              + 2432LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v17],  3553LL,  10243LL,  33071LL);
    (*(void (**)(void, uint64_t, void, void, uint64_t, uint64_t, void, void, unsigned int, char *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v16] + 2408LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v17],  3553LL,  0LL,  *(&a5->var0 + (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v15] + 104LL) < 3uLL)),  v9,  v8,  0LL,  a5->var1,  a5->var2,  a6);
    GPUTools::GL::ApplyPixelStoreUnpackState(v27, v14, v19 != 0LL, &v22);
    if (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v15] + 104LL) >= 3uLL) {
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v16] + 5136LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[v17],  35052LL,  v26);
    }
  }
}

- (void)_imageInfoForAttachment:(unsigned int)a3 outImageInfo:(ImageInfo *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer context](self, "context"));
  sub_4948(v16, v7);

  v15[0] = v16;
  v15[1] = -[DYEAGLDebugFunctionPlayer gliDispatch](self, "gliDispatch");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer captureSessionInfo](self, "captureSessionInfo"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contextInfoForContext:", -[DYEAGLDebugFunctionPlayer ctxID](self, "ctxID")));
  id v10 = [v9 api];

  GPUTools::GL::GetFramebufferAttachmentInfo(v15, v10, 36009LL, v5, v11);
  GPUTools::GL::GetImageInfo(v15, v10, v12, v13, v14, a4);
}

- (BOOL)_isBoundObjectAlive:(unsigned int)a3 isObjectFunc:(void *)a4
{
  uint64_t v6 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
  (*(void (**)(void, void, int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                + 832LL))( *(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx],  *(void *)&a3,  &v8);
  return !v8 || ((unsigned int (*)(void))a4)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6]) == 1;
}

- (BOOL)_isContextModifiable
{
  uint64_t v3 = OBJC_IVAR___DYGLFunctionPlayer__disp;
  if (!-[DYEAGLDebugFunctionPlayer _isBoundObjectAlive:isObjectFunc:]( self,  "_isBoundObjectAlive:isObjectFunc:",  34965LL,  *(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp] + 5160LL))
    || !-[DYEAGLDebugFunctionPlayer _isBoundObjectAlive:isObjectFunc:]( self,  "_isBoundObjectAlive:isObjectFunc:",  36006LL,  *(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5368LL))
    || !-[DYEAGLDebugFunctionPlayer _isBoundObjectAlive:isObjectFunc:]( self,  "_isBoundObjectAlive:isObjectFunc:",  36010LL,  *(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5368LL))
    || !-[DYEAGLDebugFunctionPlayer _isBoundObjectAlive:isObjectFunc:]( self,  "_isBoundObjectAlive:isObjectFunc:",  36007LL,  *(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5320LL)))
  {
    return 0;
  }

  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer context](self, "context"));
  sub_4948(v13, v4);

  v12[0] = v13;
  v12[1] = -[DYEAGLDebugFunctionPlayer gliDispatch](self, "gliDispatch");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLDebugFunctionPlayer captureSessionInfo](self, "captureSessionInfo"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contextInfoForContext:", -[DYEAGLDebugFunctionPlayer ctxID](self, "ctxID")));
  id v7 = [v6 api];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_A320;
  v11[3] = &unk_24758;
  _BYTE v11[4] = self;
  v11[5] = &v14;
  GPUTools::GL::EnumerateTextureTargets(v12, v7, v11);
  BOOL v9 = 0;
  if (*((_BYTE *)v15 + 24))
  {
    uint64_t v8 = OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo;
    if (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                   + 104LL) < 2uLL
      || -[DYEAGLDebugFunctionPlayer _isBoundObjectAlive:isObjectFunc:]( self,  "_isBoundObjectAlive:isObjectFunc:",  33370LL,  *(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 6600LL))
      && (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v8] + 104LL) < 3uLL
       || -[DYEAGLDebugFunctionPlayer _isBoundObjectAlive:isObjectFunc:]( self,  "_isBoundObjectAlive:isObjectFunc:",  35053LL,  *(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5160LL))
       && -[DYEAGLDebugFunctionPlayer _isBoundObjectAlive:isObjectFunc:]( self,  "_isBoundObjectAlive:isObjectFunc:",  35055LL,  *(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5160LL))))
    {
      BOOL v9 = 1;
    }
  }

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)prepareForCaptureExecution
{
  uint64_t v3 = OBJC_IVAR___DYFunctionPlayer__engine;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__engine] delegate]);
  char v5 = objc_opt_respondsToSelector(v4, "prepareForCaptureExecution");

  if ((v5 & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super.DYGLFunctionPlayer_opaque[v3] delegate]);
  [v6 prepareForCaptureExecution];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super.DYGLFunctionPlayer_opaque[v3] delegate]);
  unsigned int v8 = [v7 shouldCallSuper];

  if (v8)
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___DYEAGLDebugFunctionPlayer;
    -[DYEAGLDebugFunctionPlayer prepareForCaptureExecution](&v12, "prepareForCaptureExecution");
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&self->super.DYGLFunctionPlayer_opaque[v3] delegate]);
  unsigned __int8 v10 = [v9 shouldReturn];

  if ((v10 & 1) == 0)
  {
LABEL_5:
    v11.receiver = self;
    v11.super_class = (Class)&OBJC_CLASS___DYEAGLDebugFunctionPlayer;
    -[DYEAGLDebugFunctionPlayer prepareForCaptureExecution](&v11, "prepareForCaptureExecution");
  }

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 148) = &off_24650;
  *((void *)self + 149) = 0LL;
  *((void *)self + 150) = 0LL;
  *((void *)self + 151) = 0LL;
  *((void *)self + 152) = off_246B8;
  *((void *)self + 159) = 0LL;
  *(_OWORD *)((char *)self + 1256) = 0u;
  *(_OWORD *)((char *)self + 1240) = 0u;
  *(_OWORD *)((char *)self + 1224) = 0u;
  *((_DWORD *)self + 320) = 1065353216;
  *(_OWORD *)((char *)self + 1304) = 0u;
  *(_OWORD *)((char *)self + 1288) = 0u;
  *((_DWORD *)self + 330) = 1065353216;
  *((_OWORD *)self + 83) = 0u;
  *((_OWORD *)self + 84) = 0u;
  *((_DWORD *)self + 340) = 1065353216;
  *(_OWORD *)((char *)self + 1384) = 0u;
  *(_OWORD *)((char *)self + 1368) = 0u;
  *((_DWORD *)self + 350) = 1065353216;
  *((_OWORD *)self + 88) = 0u;
  *((_OWORD *)self + 89) = 0u;
  *((_DWORD *)self + 360) = 1065353216;
  *(_OWORD *)((char *)self + 1448) = 0u;
  *(_OWORD *)((char *)self + 1464) = 0u;
  *((_DWORD *)self + 370) = 1065353216;
  return self;
}

@end