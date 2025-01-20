@interface DYEAGLFunctionPlayer
- (BOOL)_linkProgram:(GLSLObject)a3 dispatcher:(Dispatcher *)a4;
- (BOOL)isFrameBoundary;
- (BOOL)shouldExecuteGraphicsFunction;
- (DYLayerManager)layerManager;
- (DYLayerManager)strongLayerManager;
- (id).cxx_construct;
- (id)currentRenderbufferDrawableMap;
- (unint64_t)_generateDrawableId;
- (unsigned)_loadShaderWithType:(unsigned int)a3 source:(const char *)a4 dispatcher:(Dispatcher *)a5;
- (unsigned)_loadSimpleProgramWithVertexSource:(const char *)a3 fragmentSource:(const char *)a4 link:(BOOL)a5 dispatcher:(Dispatcher *)a6;
- (void)_createIOSurfaceReplacementForFramebuffer:(FramebufferInfo *)a3;
- (void)_destroyDrawableId:(unint64_t)a3;
- (void)_transformCoreAnimationLayer:(id)a3 rotated:(BOOL)a4;
- (void)createEAGLContextWithAPI:(unint64_t)a3 sharegroupID:(unint64_t)a4 contextID:(unint64_t)a5;
- (void)drawTexture:(unsigned int)a3 target:(unsigned int)a4 framebuffer:(unsigned int)a5 bounds:(IntegerRect)a6 clearBits:(unsigned int)a7 modulateColor:(unsigned int)a8 enableBlend:(BOOL)a9 rotated:(BOOL)a10 texBlitProgram:(unsigned int)a11;
- (void)executePlatformFunction;
- (void)initializeNewSharegroupInfoDictionary;
- (void)newContextInfo;
- (void)setLayerManager:(id)a3;
@end

@implementation DYEAGLFunctionPlayer

- (DYLayerManager)strongLayerManager
{
  return (DYLayerManager *)objc_loadWeakRetained((id *)&self->_layerManager);
}

- (void)newContextInfo
{
  result = operator new(0xF8uLL);
  *(_OWORD *)((char *)result + 8) = 0u;
  *(_OWORD *)((char *)result + 24) = 0u;
  *(_OWORD *)((char *)result + 40) = 0u;
  *(_OWORD *)((char *)result + 56) = 0u;
  *(_OWORD *)((char *)result + 72) = 0u;
  *(_OWORD *)((char *)result + 81) = 0u;
  *(void *)result = off_24788;
  *((void *)result + 13) = 0LL;
  *((_DWORD *)result + 28) = 0;
  *(_OWORD *)((char *)result + 120) = 0u;
  *(_OWORD *)((char *)result + 136) = 0u;
  *((_DWORD *)result + 38) = 1065353216;
  *((_OWORD *)result + 10) = 0u;
  *((_OWORD *)result + 11) = 0u;
  *((_DWORD *)result + 48) = 1065353216;
  *(_OWORD *)((char *)result + 200) = 0u;
  *(_OWORD *)((char *)result + 216) = 0u;
  *((_DWORD *)result + 58) = 1065353216;
  *((_BYTE *)result + 240) = 0;
  return result;
}

- (void)initializeNewSharegroupInfoDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DYEAGLFunctionPlayer;
  -[DYEAGLFunctionPlayer initializeNewSharegroupInfoDictionary](&v8, "initializeNewSharegroupInfoDictionary");
  uint64_t v3 = OBJC_IVAR___DYGLFunctionPlayer__sharegroup_dict;
  v4 = *(void **)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__sharegroup_dict];
  v5 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx] sharegroup]);
  [v4 setObject:v5 forKey:@"sharegroup"];

  v6 = *(void **)&self->DYGLFunctionPlayer_opaque[v3];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  [v6 setObject:v7 forKey:@"renderbuffer_drawable_map"];
}

- (id)currentRenderbufferDrawableMap
{
  if (*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx]) {
    v2 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__sharegroup_dict] objectForKey:@"renderbuffer_drawable_map"]);
  }
  else {
    v2 = 0LL;
  }
  return v2;
}

- (void)createEAGLContextWithAPI:(unint64_t)a3 sharegroupID:(unint64_t)a4 contextID:(unint64_t)a5
{
  unint64_t v12 = a5;
  if (sub_56B8(&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__contextInfoMap], &v12))
  {
    -[DYEAGLFunctionPlayer setCurrentContext:](self, "setCurrentContext:", v12);
    if (!self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__recreateContexts]) {
      return;
    }
    -[DYEAGLFunctionPlayer deleteCurrentContext](self, "deleteCurrentContext");
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__sharegroupMap] objectForIntKey:a4]);
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"sharegroup"]);
    v11 = -[EAGLContext initWithAPI:sharegroup:]( objc_alloc(&OBJC_CLASS___EAGLContext),  "initWithAPI:sharegroup:",  a3,  v10);
  }

  else
  {
    v11 = -[EAGLContext initWithAPI:](objc_alloc(&OBJC_CLASS___EAGLContext), "initWithAPI:", a3);
  }

  -[DYEAGLFunctionPlayer updateCurrentStateWithNewContext:contextID:sharegroupID:]( self,  "updateCurrentStateWithNewContext:contextID:sharegroupID:",  v11,  v12,  a4);
  *(void *)(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo] + 104LL) = a3;
}

- (BOOL)isFrameBoundary
{
  unsigned int v2 = **(_DWORD **)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function] + 8190;
  return (v2 < 0xD) & (0x1811u >> v2);
}

- (void)executePlatformFunction
{
  uint64_t v3 = OBJC_IVAR___DYFunctionPlayer__function;
  v4 = *(int **)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function];
  v5 = (unint64_t ***)(v4 + 12);
  int v6 = *v4;
  uint64_t v7 = OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo;
  uint64_t v8 = *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo];
  switch(*v4)
  {
    case -8192:
    case -8191:
      -[DYEAGLFunctionPlayer createEAGLContextWithAPI:sharegroupID:contextID:]( self,  "createEAGLContextWithAPI:sharegroupID:contextID:",  **((void **)v4 + 9),  **((void **)v4 + 12),  **((void **)v4 + 6));
      return;
    case -8190:
    case -8179:
    case -8178:
      v9 = (GPUTools::GL *)**((unsigned int **)v4 + 9);
      uint64_t renderbuffer_binding_enum = GPUTools::GL::dy_get_renderbuffer_binding_enum(v9, a2);
      LODWORD(v74[0]) = 0;
      (*(void (**)(void, uint64_t, _OWORD *))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                        + 832LL))( *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx],  renderbuffer_binding_enum,  v74);
      if (LODWORD(v74[0]))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer currentRenderbufferDrawableMap](self, "currentRenderbufferDrawableMap"));
        unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  LODWORD(v74[0])));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v12]);
        id v14 = [v13 unsignedLongLongValue];

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 layerForID:v14]);

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
        [v17 prepareLayerForPresent:v16];
      }

      switch(v6)
      {
        case -8178:
          objc_msgSend( *(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx],  "presentRenderbuffer:afterMinimumDuration:",  v9,  sub_B748((uint64_t)(v4 + 24), 0).n64_f64[0]);
          break;
        case -8179:
          objc_msgSend( *(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx],  "presentRenderbuffer:atTime:",  v9,  sub_B748((uint64_t)(v4 + 24), 0).n64_f64[0]);
          break;
        case -8190:
          [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx] presentRenderbuffer:v9];
          break;
      }

      return;
    case -8189:
      uint64_t v36 = **((void **)v4 + 12);
      if (v36)
      {
        v37 = (GPUTools::GL *)**((unsigned int **)v4 + 9);
        uint64_t v38 = GPUTools::GL::dy_get_renderbuffer_binding_enum(v37, a2);
        LODWORD(v74[0]) = 0;
        uint64_t v39 = (*(uint64_t (**)(void, uint64_t, _OWORD *))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                                   + 832LL))( *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx],  v38,  v74);
        uint64_t v40 = DYGetGLGuestAppClient(v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        unsigned int v42 = [v41 traceMode];

        if (v42 != 6)
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
          id v44 = (id)objc_claimAutoreleasedReturnValue([v43 layerForID:v36]);

          [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx] renderbufferStorage:v37 fromDrawable:v44];
          +[CATransaction flush](&OBJC_CLASS___CATransaction, "flush");
          v45 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer currentRenderbufferDrawableMap](self, "currentRenderbufferDrawableMap"));
          v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v36));
          v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  LODWORD(v74[0])));
          [v45 setObject:v46 forKey:v47];

          goto LABEL_76;
        }
      }

      return;
    case -8188:
      -[DYEAGLFunctionPlayer createEAGLContextWithAPI:sharegroupID:contextID:]( self,  "createEAGLContextWithAPI:sharegroupID:contextID:",  **((void **)v4 + 9),  **((void **)v4 + 15),  **((void **)v4 + 6));
      uint64_t v52 = *(void *)&self->DYGLFunctionPlayer_opaque[v7];
      BOOL v54 = 1;
      if (v4[27] == 14)
      {
        v53 = (const char *)*((void *)v4 + 12);
        if (!strstr(v53, "EAGLContextPropertyClientRetainRelease:true")
          || strstr(v53, "EAGLContextPropertyVisibleInDebugTools:true"))
        {
          BOOL v54 = 0;
        }
      }

      *(_BYTE *)(v52 + 240) = v54;
      return;
    case -8187:
      v28 = (unsigned int *)*((void *)v4 + 9);
      goto LABEL_40;
    case -8186:
      if (!*(_DWORD *)(v8 + 112)) {
        return;
      }
      uint64_t v29 = DYGetGLGuestAppClient(self);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      unsigned int v31 = [v30 traceMode];

      if (v31 == 6)
      {
        [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx] presentRenderbuffer:36161];
        return;
      }

      v55 = sub_66E4((void *)(v8 + 120), (unsigned int *)(v8 + 112));
      if ((*(_BYTE *)(*(void *)&self->DYGLFunctionPlayer_opaque[v3] + 4LL) & 4) != 0)
      {
        if (!v55) {
          return;
        }
      }

      else if (!v55)
      {
        __assert_rtn( "-[DYEAGLFunctionPlayer executePlatformFunction]",  (const char *)&unk_224DD,  0,  "iter != ctx_info->fb_info_map.end()");
      }

      uint64_t v56 = *((unsigned int *)v55 + 5);
      id v44 = (id)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer currentRenderbufferDrawableMap](self, "currentRenderbufferDrawableMap"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v56));
      v58 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKeyedSubscript:v57]);

      if (!v58) {
        __assert_rtn("-[DYEAGLFunctionPlayer executePlatformFunction]", (const char *)&unk_224DD, 0, "drawable_obj");
      }
      id v59 = [v58 unsignedLongLongValue];
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
      v61 = (void *)objc_claimAutoreleasedReturnValue([v60 layerForID:v59]);

      if (!v61) {
        __assert_rtn("-[DYEAGLFunctionPlayer executePlatformFunction]", (const char *)&unk_224DD, 0, "layer");
      }
      LODWORD(v74[0]) = 0;
      uint64_t v62 = OBJC_IVAR___DYGLFunctionPlayer__disp;
      uint64_t v63 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
      (*(void (**)(void, uint64_t, _OWORD *))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                        + 832LL))( *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx],  36007LL,  v74);
      (*(void (**)(void, uint64_t, uint64_t))(*(void *)&self->DYGLFunctionPlayer_opaque[v62] + 5328LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v63],  36161LL,  v56);
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
      [v64 prepareLayerForPresent:v61];

      [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx] presentRenderbuffer:36161];
      (*(void (**)(void, uint64_t, void))(*(void *)&self->DYGLFunctionPlayer_opaque[v62] + 5328LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v63],  36161LL,  LODWORD(v74[0]));
      goto LABEL_75;
    case -8185:
      v78 = **v5;
      v32 = *(void **)(v8 + 216);
      if (!v32) {
        goto LABEL_32;
      }
      do
      {
        while (1)
        {
          v33 = sub_56B8(v32 + 3, (unint64_t *)&v78);
          if (v33)
          {
            sub_6798(v32 + 3, v33);
            if (!v32[6]) {
              break;
            }
          }

          v32 = (void *)*v32;
          if (!v32) {
            goto LABEL_32;
          }
        }

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
        [v34 deleteLayer:v32[2]];

        v35 = (void *)*v32;
        sub_67D8((void *)(v8 + 200), v32, (uint64_t)v74);
        sub_502C((uint64_t)v74, 0LL);
        v32 = v35;
      }

      while (v35);
LABEL_32:
      -[DYEAGLFunctionPlayer deleteCurrentContext](self, "deleteCurrentContext");
      return;
    case -8184:
      goto LABEL_20;
    case -8183:
      unint64_t v48 = 1.0;
      unint64_t v49 = 1.0;
      if (*((unsigned __int16 *)v4 + 5) >= 4u)
      {
        unint64_t v48 = sub_B748((uint64_t)(v4 + 24), 0LL).n64_u64[0];
        unint64_t v49 = sub_B748((uint64_t)(v4 + 30), 0LL).n64_u64[0];
      }

      *(void *)&v74[0] = v48;
      *((void *)&v74[0] + 1) = v49;
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
      objc_msgSend(v50, "setTransform:forLayerID:withScreenToLayerScale:", v4 + 18, sub_DA48((uint64_t)v5, 0), v74);

      return;
    case -8182:
      id v72 = (id)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
      objc_msgSend(v72, "setPosition:forLayerID:", v4 + 18, sub_DA48((uint64_t)v5, 0));
      goto LABEL_46;
    case -8181:
      id v72 = (id)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
      objc_msgSend(v72, "setAnchorPoint:forLayerID:", v4 + 18, sub_DA48((uint64_t)v5, 0));
LABEL_46:

      return;
    case -8180:
      v28 = (unsigned int *)*((void *)v4 + 12);
LABEL_40:
      uint64_t v51 = *v28;
      *(void *)((char *)v74 + 7) = 0LL;
      *(void *)&v74[0] = 0LL;
      GPUTools::GL::DYGetTextureTargetInfo(v51, v74);
      LODWORD(v78) = 0;
      (*(void (**)(void, void, unint64_t **))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                                  + 832LL))( *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx],  DWORD1(v74[0]),  &v78);
      sub_D2A4(v8 + 160, (unsigned int *)&v78, &v78);
      return;
    default:
      if (v6 != -12287)
      {
LABEL_20:
        v73.receiver = self;
        v73.super_class = (Class)&OBJC_CLASS___DYEAGLFunctionPlayer;
        -[DYEAGLFunctionPlayer executePlatformFunction](&v73, "executePlatformFunction");
        return;
      }

      unint64_t v77 = **((void **)v4 + 6);
      unint64_t v18 = **((void **)v4 + 12);
      unint64_t v76 = v18;
      if (!v18) {
        return;
      }
      int v19 = **((unsigned __int8 **)v4 + 15);
      int v20 = **((_DWORD **)v4 + 18);
      double v21 = 1.0;
      if (*((unsigned __int16 *)v4 + 5) >= 6u)
      {
        v22.n64_u64[0] = sub_B748((uint64_t)(v4 + 42), 0LL).n64_u64[0];
        if (v22.n64_f64[0] == 0.0) {
          return;
        }
        double v21 = v22.n64_f64[0];
      }

      v23.n64_u64[0] = sub_B748((uint64_t)(v4 + 18), 0LL).n64_u64[0];
      v24.n64_u64[0] = sub_B748((uint64_t)(v4 + 18), 1uLL).n64_u64[0];
      v25.n64_u64[0] = sub_B748((uint64_t)(v4 + 18), 2uLL).n64_u64[0];
      v26.n64_u64[0] = sub_B748((uint64_t)(v4 + 18), 3uLL).n64_u64[0];
      if (v20 <= 35906)
      {
        switch(v20)
        {
          case 32856:
            v27 = (id *)&kEAGLColorFormatRGBA8;
            break;
          case 35446:
            v27 = (id *)&kEAGLColorFormatRGBA_XR10_64BPP;
            break;
          case 35447:
            v27 = (id *)&kEAGLColorFormatSRGBA_XR10_64BPP;
            break;
          default:
            goto LABEL_81;
        }
      }

      else if (v20 > 37873)
      {
        if (v20 == 37874)
        {
          v27 = (id *)&kEAGLColorFormatSRGB_XR10;
        }

        else
        {
          if (v20 != 37881) {
            goto LABEL_81;
          }
          v27 = (id *)&kEAGLColorFormatSRGB_XR10_A8_2P;
        }
      }

      else
      {
        if (v20 != 35907)
        {
          if (v20 == 36194)
          {
            v27 = (id *)&kEAGLColorFormatRGB565;
            goto LABEL_69;
          }

- (BOOL)shouldExecuteGraphicsFunction
{
  uint64_t v3 = *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function];
  int v4 = *(_DWORD *)v3;
  uint64_t v5 = *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo];
  if (*(int *)v3 > 839)
  {
    if (v4 > 889)
    {
      if (v4 == 890)
      {
        uint64_t v6 = *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx];
        uint64_t v7 = *(void *)(v3 + 96);
        uint64_t v8 = **(unsigned int **)(v3 + 72);
        uint64_t v9 = 1610LL;
      }

      else
      {
        if (v4 != 987) {
          goto LABEL_35;
        }
        uint64_t v6 = *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx];
        uint64_t v7 = *(void *)(v3 + 96);
        uint64_t v8 = **(unsigned int **)(v3 + 72);
        uint64_t v9 = 1617LL;
      }
    }

    else
    {
      if (v4 == 840)
      {
        DYReserveGLVAOs( *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx],  *(void *)(v3 + 96),  **(unsigned int **)(v3 + 72));
        return 0;
      }

      if (v4 != 858) {
        goto LABEL_35;
      }
      uint64_t v6 = *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx];
      uint64_t v7 = *(void *)(v3 + 96);
      uint64_t v8 = **(unsigned int **)(v3 + 72);
      uint64_t v9 = 1611LL;
    }

- (unint64_t)_generateDrawableId
{
  p_ioSurfaceDrawableIdSet = &self->_ioSurfaceDrawableIdSet;
  for (i = &self->_nextIOSurfaceDrawableId;
        sub_56B8(p_ioSurfaceDrawableIdSet, i);
    ;
  }

  unint64_t v5 = *i;
  sub_DD6C((uint64_t)p_ioSurfaceDrawableIdSet, &v5, &v5);
  unint64_t *i = ((unsigned __int16)*(_DWORD *)i + 1) & 0xFFF;
  return v5;
}

- (void)_destroyDrawableId:(unint64_t)a3
{
  unint64_t v3 = a3;
  sub_DF84(&self->_ioSurfaceDrawableIdSet.__table_.__bucket_list_.__ptr_.__value_, &v3);
}

- (void)_createIOSurfaceReplacementForFramebuffer:(FramebufferInfo *)a3
{
  unint64_t v5 = *(_DWORD ***)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function];
  unsigned int v6 = *v5[9];
  uint64_t v7 = *v5[15];
  uint64_t v8 = *v5[18];
  uint64_t v9 = (v8 + 1000000);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer currentRenderbufferDrawableMap](self, "currentRenderbufferDrawableMap"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v9));
  unsigned int v31 = v6;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);

  uint64_t v13 = OBJC_IVAR___DYGLFunctionPlayer__disp;
  uint64_t v14 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
  if (v12)
  {
    uint64_t v15 = 0LL;
  }

  else
  {
    uint64_t v37 = 0LL;
    int v36 = 0;
    v30 = v10;
    (*(void (**)(void, uint64_t, char *))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                    + 832LL))( *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx],  32873LL,  (char *)&v37 + 4);
    (*(void (**)(void, uint64_t, uint64_t))(*(void *)&self->DYGLFunctionPlayer_opaque[v13] + 40LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v14],  3553LL,  v8);
    (*(void (**)(void, uint64_t, void, uint64_t, uint64_t *))(*(void *)&self->DYGLFunctionPlayer_opaque[v13]
                                                                        + 1000LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v14],  v7,  0LL,  4096LL,  &v37);
    (*(void (**)(void, uint64_t, void, uint64_t, int *))(*(void *)&self->DYGLFunctionPlayer_opaque[v13]
                                                                    + 1000LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v14],  v7,  0LL,  4097LL,  &v36);
    (*(void (**)(void, uint64_t, void))(*(void *)&self->DYGLFunctionPlayer_opaque[v13] + 40LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v14],  3553LL,  HIDWORD(v37));
    unint64_t v16 = -[DYEAGLFunctionPlayer _generateDrawableId](self, "_generateDrawableId");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", v16));
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v9));
    [v10 setObject:v17 forKeyedSubscript:v18];

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__captureSessionInfo] deviceInfo]);
    int v27 = a3;
    v28 = v19;
    if (v19)
    {
      [v19 mainScreenDescriptor];
      unsigned int v20 = HIDWORD(v34);
      unsigned int v21 = v35;
      unsigned int v22 = v34;
    }

    else
    {
      unsigned int v20 = 0;
      unsigned int v21 = 0;
      unsigned int v22 = 0;
      uint64_t v33 = 0LL;
      uint64_t v34 = 0LL;
      uint64_t v35 = 0LL;
    }

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v23 layerForID:v16]);

    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    __n64 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v24,  kEAGLDrawablePropertyRetainedBacking,  kEAGLColorFormatRGBA8,  kEAGLDrawablePropertyColorFormat,  0LL));

    __n64 v26 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayer strongLayerManager](self, "strongLayerManager"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v26,  "createLayerWithID:contentRect:contentsScale:properties:isCoreAnimationSurface:",  v16,  v25,  1,  0.0,  0.0,  (double)(v22 / v21),  (double)(v20 / v21),  (float)v21));

    a3 = v27;
    uint64_t v12 = 0LL;
    uint64_t v10 = v30;
    -[DYEAGLFunctionPlayer _transformCoreAnimationLayer:rotated:]( self,  "_transformCoreAnimationLayer:rotated:",  v15,  v27->var1 == 35453);
    unsigned int v32 = 0;
    (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->DYGLFunctionPlayer_opaque[v13] + 832LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v14],  36007LL,  &v32);
    (*(void (**)(void, uint64_t, uint64_t))(*(void *)&self->DYGLFunctionPlayer_opaque[v13] + 5328LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v14],  36161LL,  v9);
    [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx] renderbufferStorage:36161 fromDrawable:v15];
    +[CATransaction flush](&OBJC_CLASS___CATransaction, "flush");
    (*(void (**)(void, uint64_t, void))(*(void *)&self->DYGLFunctionPlayer_opaque[v13] + 5328LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v14],  36161LL,  v32);
  }

  (*(void (**)(void, void, uint64_t, uint64_t, uint64_t))(*(void *)&self->DYGLFunctionPlayer_opaque[v13]
                                                                    + 5432LL))( *(void *)&self->DYGLFunctionPlayer_opaque[v14],  v31,  36064LL,  36161LL,  v9);
  a3->var0 = v9;
}

- (unsigned)_loadShaderWithType:(unsigned int)a3 source:(const char *)a4 dispatcher:(Dispatcher *)a5
{
  uint64_t v12 = a4;
  uint64_t v6 = DYCreatePrivateGLShader(*(void *)a5->var0);
  if ((_DWORD)v6)
  {
    ((void (*)(void, void, uint64_t, const char **, void))a5->var1->shader_source_ARB)( *((void *)a5->var0 + 2),  v6,  1LL,  &v12,  0LL);
    ((void (*)(void, void))a5->var1->compile_shader_ARB)(*((void *)a5->var0 + 2), v6);
    ((void (*)(void, uint64_t, uint64_t, int *))a5->var1->get_shaderiv)( *((void *)a5->var0 + 2),  v6,  35713LL,  &__size_4);
    if (!__size_4)
    {
      int __size = 0;
      ((void (*)(void, uint64_t, uint64_t, int *))a5->var1->get_shaderiv)( *((void *)a5->var0 + 2),  v6,  35716LL,  &__size);
      uint64_t v7 = __size;
      if (__size >= 2)
      {
        uint64_t v8 = malloc(__size);
        ((void (*)(void, uint64_t, uint64_t, void, void *))a5->var1->get_shader_info_log)( *((void *)a5->var0 + 2),  v6,  v7,  0LL,  v8);
        free(v8);
      }

      ((void (*)(void, void))a5->var1->delete_object_ARB)(*((void *)a5->var0 + 2), v6);
      LODWORD(v6) = 0;
    }
  }

  return v6;
}

- (BOOL)_linkProgram:(GLSLObject)a3 dispatcher:(Dispatcher *)a4
{
  uint64_t v5 = *(void *)&a3.var0;
  ((void (*)(void, void))a4->var1->link_program_ARB)(*((void *)a4->var0 + 2), a3.var0);
  ((void (*)(void, uint64_t, uint64_t, int *))a4->var1->get_programiv)( *((void *)a4->var0 + 2),  v5,  35714LL,  &__size_4);
  if (!__size_4)
  {
    int __size = 0;
    ((void (*)(void, uint64_t, uint64_t, int *))a4->var1->get_programiv)( *((void *)a4->var0 + 2),  v5,  35716LL,  &__size);
    uint64_t v6 = __size;
    if (__size >= 2)
    {
      uint64_t v7 = malloc(__size);
      ((void (*)(void, uint64_t, uint64_t, void, void *))a4->var1->get_program_info_log)( *((void *)a4->var0 + 2),  v5,  v6,  0LL,  v7);
      free(v7);
    }
  }

  return __size_4 != 0;
}

- (unsigned)_loadSimpleProgramWithVertexSource:(const char *)a3 fragmentSource:(const char *)a4 link:(BOOL)a5 dispatcher:(Dispatcher *)a6
{
  BOOL v7 = a5;
  unsigned int v10 = -[DYEAGLFunctionPlayer _loadShaderWithType:source:dispatcher:]( self,  "_loadShaderWithType:source:dispatcher:",  35633LL,  a3,  a6);
  if (!v10) {
    return 0;
  }
  unsigned int v11 = v10;
  unsigned int v12 = -[DYEAGLFunctionPlayer _loadShaderWithType:source:dispatcher:]( self,  "_loadShaderWithType:source:dispatcher:",  35632LL,  a4,  a6);
  if (!v12)
  {
    ((void (*)(void, void))a6->var1->delete_object_ARB)(*((void *)a6->var0 + 2), v11);
    return 0;
  }

  unsigned int v13 = v12;
  unsigned int v14 = DYCreatePrivateGLProgram(*(void *)a6->var0);
  var1 = a6->var1;
  uint64_t v16 = *((void *)a6->var0 + 2);
  if (!v14)
  {
    ((void (*)(uint64_t, void))var1->delete_object_ARB)(v16, v11);
    ((void (*)(void, void))a6->var1->delete_object_ARB)(*((void *)a6->var0 + 2), v13);
    return v14;
  }

  ((void (*)(uint64_t, void, void))var1->attach_object_ARB)(v16, v14, v11);
  ((void (*)(void, void, void))a6->var1->attach_object_ARB)(*((void *)a6->var0 + 2), v14, v13);
  ((void (*)(void, void))a6->var1->delete_object_ARB)(*((void *)a6->var0 + 2), v11);
  ((void (*)(void, void))a6->var1->delete_object_ARB)(*((void *)a6->var0 + 2), v13);
  if (v7 && !-[DYEAGLFunctionPlayer _linkProgram:dispatcher:](self, "_linkProgram:dispatcher:", v14, a6))
  {
    ((void (*)(void, void))a6->var1->delete_object_ARB)(*((void *)a6->var0 + 2), v14);
    return 0;
  }

  return v14;
}

- (void)drawTexture:(unsigned int)a3 target:(unsigned int)a4 framebuffer:(unsigned int)a5 bounds:(IntegerRect)a6 clearBits:(unsigned int)a7 modulateColor:(unsigned int)a8 enableBlend:(BOOL)a9 rotated:(BOOL)a10 texBlitProgram:(unsigned int)a11
{
  if ((byte_2AC50 & 1) == 0)
  {
    qword_2ABF0 = 2LL;
    qword_2ABF8 = (uint64_t)"attribute highp vec2 inVertex;                             \n"
                           "attribute highp vec2 inTexCoord;                           \n"
                           "attribute highp vec4 inColor;                              \n"
                           "                                                           \n"
                           "varying highp vec2 vTexCoord;                              \n"
                           "varying highp vec4 vColor;                                 \n"
                           "                                                           \n"
                           "void main() {                                              \n"
                           "    vTexCoord = inTexCoord;                                \n"
                           "    vColor = inColor;                                      \n"
                           "    gl_Position = vec4(inVertex, 0.0, 1.0);                \n"
                           "}                                                          \n";
    qword_2AC00 = (uint64_t)"uniform sampler2D tex2D;                                   \n"
                           "varying lowp vec2 vTexCoord;                               \n"
                           "varying lowp vec4 vColor;                                  \n"
                           "                                                           \n"
                           "void main() {                                              \n"
                           "    gl_FragColor = texture2D(tex2D, vTexCoord) * vColor;   \n"
                           "}                                                          \n";
    unk_2AC08 = 2LL;
    qword_2AC10 = (uint64_t)"attribute highp vec2 inVertex;                             \n"
                           "attribute highp vec2 inTexCoord;                           \n"
                           "attribute highp vec4 inColor;                              \n"
                           "                                                           \n"
                           "varying highp vec2 vTexCoord;                              \n"
                           "varying highp vec4 vColor;                                 \n"
                           "                                                           \n"
                           "void main() {                                              \n"
                           "    vTexCoord = inTexCoord;                                \n"
                           "    vColor = inColor;                                      \n"
                           "    gl_Position = vec4(inVertex, 0.0, 1.0);                \n"
                           "}                                                          \n";
    unk_2AC18 = "uniform sampler2D tex2D;                                   \n"
                "varying lowp vec2 vTexCoord;                               \n"
                "varying lowp vec4 vColor;                                  \n"
                "                                                           \n"
                "void main() {                                              \n"
                "    gl_FragColor = texture2D(tex2D, vTexCoord).rrrr * vColor;  \n"
                "}                                                          \n";
    qword_2AC20 = 3LL;
    unk_2AC28 = "#version 300 es                                            \n"
                "in vec2 inVertex;                                          \n"
                "in vec2 inTexCoord;                                        \n"
                "in vec4 inColor;                                           \n"
                "                                                           \n"
                "out vec2 vTexCoord;                                        \n"
                "out vec4 vColor;                                           \n"
                "                                                           \n"
                "void main() {                                              \n"
                "    vTexCoord = inTexCoord;                                \n"
                "    vColor = inColor;                                      \n"
                "    gl_Position = vec4(inVertex, 0.0, 1.0);                \n"
                "}                                                          \n";
    qword_2AC30 = (uint64_t)"#version 300 es                                            \n"
                           "uniform highp isampler2D tex2D;                            \n"
                           "uniform highp vec2 range;                                  \n"
                           "in lowp vec2 vTexCoord;                                    \n"
                           "in lowp vec4 vColor;                                       \n"
                           "                                                           \n"
                           "out highp vec4 fragData;                                   \n"
                           "                                                           \n"
                           "void main() {                                              \n"
                           "   highp vec4 texel = vec4(texture(tex2D, vTexCoord));           \n"
                           "   fragData = (texel - range.x) / range.y;                 \n"
                           "   fragData = clamp(fragData, 0.0, 1.0);                   \n"
                           "   fragData *= vColor;                                     \n"
                           "}                                                          \n";
    unk_2AC38 = 3LL;
    qword_2AC40 = (uint64_t)"#version 300 es                                            \n"
                           "in vec2 inVertex;                                          \n"
                           "in vec2 inTexCoord;                                        \n"
                           "in vec4 inColor;                                           \n"
                           "                                                           \n"
                           "out vec2 vTexCoord;                                        \n"
                           "out vec4 vColor;                                           \n"
                           "                                                           \n"
                           "void main() {                                              \n"
                           "    vTexCoord = inTexCoord;                                \n"
                           "    vColor = inColor;                                      \n"
                           "    gl_Position = vec4(inVertex, 0.0, 1.0);                \n"
                           "}                                                          \n";
    unk_2AC48 = "#version 300 es                                            \n"
                "uniform highp usampler2D tex2D;                            \n"
                "uniform highp vec2 range;                                  \n"
                "in lowp vec2 vTexCoord;                                    \n"
                "in lowp vec4 vColor;                                       \n"
                "                                                           \n"
                "out highp vec4 fragData;                                   \n"
                "                                                           \n"
                "void main() {                                              \n"
                "   highp vec4 texel = vec4(texture(tex2D, vTexCoord));     \n"
                "   fragData = (texel - range.x) / range.y;                 \n"
                "   fragData = clamp(fragData, 0.0, 1.0);                   \n"
                "   fragData *= vColor;                                     \n"
                "}                                                          \n";
    byte_2AC50 = 1;
  }

  uint64_t v12 = OBJC_IVAR___DYGLFunctionPlayer__sharegroup_dict;
  unsigned int v13 = (EAGLContext *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__sharegroup_dict],  "objectForKey:",  @"tex_blit_ctx",  *(void *)&a4));
  if (!v13)
  {
    id v14 = *(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx];
    uint64_t v15 = objc_alloc(&OBJC_CLASS___EAGLContext);
    id v16 = [v14 API];
    v17 = (void *)objc_claimAutoreleasedReturnValue([v14 sharegroup]);
    unint64_t v18 = -[EAGLContext initWithAPI:sharegroup:](v15, "initWithAPI:sharegroup:", v16, v17);

    [*(id *)&self->DYGLFunctionPlayer_opaque[v12] setObject:v18 forKey:@"tex_blit_ctx"];
    uint64_t v35 = v18;
    sub_4948(&v41, v18);
    uint64_t v51 = &v41;
    objc_super v52 = *(void (***)(void, void))&v45[4];
    uint64_t v19 = (char *)[v14 API];
    id v20 = v51[2];
    if (v19 == (_BYTE *)&dword_0 + 1)
    {
      ((void (**)(id, uint64_t))v52)[72](v20, 3553LL);
      ((void (**)(id, uint64_t))v52)[73](v51[2], 32884LL);
      ((void (*)(id, uint64_t, uint64_t, void, void *))v52[334])(v51[2], 2LL, 5126LL, 0LL, &unk_23850);
    }

    else
    {
      ((void (**)(id, void))v52)[512](v20, 0LL);
      ((void (*)(id, void, uint64_t, uint64_t, void, void, void *))v52[511])( v51[2],  0LL,  2LL,  5126LL,  0LL,  0LL,  &unk_23850);
      uint64_t v21 = 0LL;
      unsigned int v22 = &qword_2AC00;
      do
      {
        if ((unint64_t)objc_msgSend(v14, "API", v35) >= *(v22 - 2))
        {
          unsigned int v23 = -[DYEAGLFunctionPlayer _loadSimpleProgramWithVertexSource:fragmentSource:link:dispatcher:]( self,  "_loadSimpleProgramWithVertexSource:fragmentSource:link:dispatcher:",  *(v22 - 1),  *v22,  0LL,  &v51);
          ((void (*)(id, void, void, const char *))v52[630])(v51[2], v23, 0LL, "inVertex");
          ((void (*)(id, void, uint64_t, const char *))v52[630])(v51[2], v23, 1LL, "inTexCoord");
          ((void (*)(id, void, uint64_t, const char *))v52[630])(v51[2], v23, 2LL, "inColor");
          -[DYEAGLFunctionPlayer _linkProgram:dispatcher:](self, "_linkProgram:dispatcher:", v23, &v51);
          dword_2AC64[v21] = ((uint64_t (*)(id, void, const char *))v52[625])(v51[2], v23, "range");
          dword_2AC54[v21] = v23;
        }

        ++v21;
        v22 += 3;
      }

      while (v21 != 4);
    }

    ((void (*)(id, uint64_t, uint64_t))v52[7])(v51[2], 1LL, 771LL);

    unsigned int v13 = v35;
  }

  sub_4948(&v51, v13);
  uint64_t v24 = v54;
  objc_super v49 = &v51;
  uint64_t v50 = v54;
  (*(void (**)(uint64_t, uint64_t, void))(v54 + 40))(v53, 3553LL, 0LL);
  (*(void (**)(uint64_t, uint64_t, void))(v24 + 40))(v53, 3553LL, a3);
  (*(void (**)(uint64_t, uint64_t, void))(v24 + 5376))(v53, 36160LL, 0LL);
  (*(void (**)(uint64_t, uint64_t, void))(v24 + 5376))(v53, 36160LL, a5);
  if (a7) {
    (*(void (**)(uint64_t, void))(v24 + 80))(v53, a7);
  }
  if (a10) {
    uint64_t var1 = a6.var1;
  }
  else {
    uint64_t var1 = a6.var0;
  }
  if (a10) {
    uint64_t var0 = a6.var0;
  }
  else {
    uint64_t var0 = a6.var1;
  }
  if (a10) {
    uint64_t var3 = a6.var3;
  }
  else {
    uint64_t var3 = a6.var2;
  }
  if (a10) {
    uint64_t var2 = a6.var2;
  }
  else {
    uint64_t var2 = a6.var3;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 2680))(v53, var1, var0, var3, var2);
  if (a9) {
    __n128 v29 = ((__n128 (*)(uint64_t, uint64_t))*(void *)(v24 + 576))(v53, 3042LL);
  }
  float v55 = (float)HIBYTE(a8) / 255.0;
  v29.n128_u64[0] = (unint64_t)vdiv_f32( vcvt_f32_u32((uint32x2_t)vand_s8( (int8x8_t)vshl_u32( (uint32x2_t)vdup_n_s32(a8),  (uint32x2_t)0xFFFFFFF8FFFFFFF0LL),  (int8x8_t)0xFF000000FFLL)),  (float32x2_t)vdup_n_s32(0x437F0000u));
  __n128 v40 = v29;
  unint64_t v56 = v29.n128_u64[0];
  float v57 = (float)a8 / 255.0;
  if (a10) {
    v30 = &unk_23890;
  }
  else {
    v30 = &unk_23870;
  }
  unsigned int v31 = &v53;
  if ((char *)-[EAGLContext API](v13, "API", v35) == (char *)&dword_0 + 1)
  {
    (*(void (**)(uint64_t, float, __n128, float, float))(v24 + 296))( v53,  (float)HIBYTE(a8) / 255.0,  v40,  v40.n128_f32[1],  (float)a8 / 255.0);
    (*(void (**)(uint64_t, uint64_t))(v24 + 584))(v53, 32888LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t, void, void *))(v24 + 2312))(v53, 2LL, 5126LL, 0LL, v30);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t, float *))(v24 + 4024))(v53, 2LL, &v55);
    (*(void (**)(uint64_t, uint64_t))(v24 + 4096))(v53, 1LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, void *))(v24 + 4088))( v53,  1LL,  2LL,  5126LL,  0LL,  0LL,  v30);
    (*(void (**)(uint64_t, void))(v24 + 4800))(v53, dword_2AC54[a11]);
    if ((a11 & 0xFFFFFFFE) == 2)
    {
      (*(void (**)(uint64_t, uint64_t, void, uint64_t, char *))(v24 + 1000))(v53, 3553LL, 0LL, 4099LL, v46);
      id v41 = 0LL;
      id v42 = 0LL;
      int v44 = 0;
      v43 = 0LL;
      *(_OWORD *)int v45 = 0x100000001uLL;
      *(void *)&v45[13] = 0LL;
      GPUTools::GL::GetImageInfo(&v49, 4LL, 3553LL, 0LL, &v41);
      GPUTools::GL::RangeForUnpackedType((GPUTools::GL *)HIDWORD(v43), &v48, &v47, v32);
      float v33 = v48;
      float v34 = v47 - v48;
      (*(void (**)(id *, void, float, float))(v50 + 4824))( v49[2],  dword_2AC64[a11],  v33,  v34);
      uint64_t v24 = v50;
      unsigned int v31 = (uint64_t *)(v49 + 2);
    }
  }

  (*(void (**)(uint64_t, uint64_t, void, uint64_t))(v24 + 520))(*v31, 5LL, 0LL, 4LL);
  if (a9) {
    (*(void (**)(id *, uint64_t))(v50 + 504))(v49[2], 3042LL);
  }
  (*(void (**)(id *))(v50 + 712))(v49[2]);
}

- (void)_transformCoreAnimationLayer:(id)a3 rotated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__captureSessionInfo] deviceInfo]);
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 mainScreenDescriptor];
    CGFloat v9 = v19;
  }

  else
  {
    double v19 = 0.0;
    uint64_t v20 = 0LL;
    CGFloat v9 = 0.0;
    uint64_t v21 = 0LL;
  }

  __int128 v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v18.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v18.c = v10;
  *(_OWORD *)&v18.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&v17.a = *(_OWORD *)&v18.a;
  *(_OWORD *)&v17.c = v10;
  *(_OWORD *)&v17.tx = *(_OWORD *)&v18.tx;
  CGAffineTransformRotate(&v18, &v17, v9);
  CGAffineTransform v16 = v18;
  CGAffineTransformScale(&v22, &v16, 1.0, -1.0);
  CGAffineTransform v18 = v22;
  if (v4)
  {
    CGAffineTransform v15 = v18;
    CGAffineTransformScale(&v22, &v15, -1.0, -1.0);
    CGAffineTransform v18 = v22;
  }

  unsigned int v12 = HIDWORD(v20);
  unsigned int v11 = v21;
  unsigned int v13 = v20;
  sub_A58C((uint64_t)&v22, 1, 1);
  CGAffineTransform v14 = v18;
  [v6 setAffineTransform:&v14];
  objc_msgSend(v6, "setFrame:", 0.0, 0.0, (double)(v13 / v11), (double)(v12 / v11));
  sub_A654((uint64_t)&v22);
}

- (DYLayerManager)layerManager
{
  return (DYLayerManager *)objc_loadWeakRetained((id *)&self->_layerManager);
}

- (void)setLayerManager:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 1112) = 0u;
  *(_OWORD *)((char *)self + 1128) = 0u;
  *((_DWORD *)self + 286) = 1065353216;
  return self;
}

@end