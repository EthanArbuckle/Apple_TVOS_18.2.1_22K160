@interface GTMTLTextureRenderer
- (GTMTLTextureRenderer)initWithDevice:(id)a3;
- (id)getPipelineStateFromCache:(id)a3 withDescriptor:(id)a4 withFormat:(unint64_t)a5;
- (id)wrapLinear:(id)a3;
- (void)render:(id)a3 withEncoder:(id)a4 withFormat:(unint64_t)a5 renderTargetSize:(CGSize)a6 viewContentsScale:(double)a7;
- (void)renderOverlay:(id)a3 color:(unsigned int)a4 shrinkToFit:(BOOL)a5 withEncoder:(id)a6 withFormat:(unint64_t)a7 transform:(CATransform3D *)a8 anchor:(CGPoint)a9 bounds:(CGRect)a10 renderTargetSize:(CGSize)a11 viewContentsScale:(double)a12;
- (void)renderTexture:(id)a3 isDepthStencil:(BOOL)a4 shrinkToFit:(BOOL)a5 withEncoder:(id)a6 withFormat:(unint64_t)a7 transform:(CATransform3D *)a8 anchor:(CGPoint)a9 bounds:(CGRect)a10 renderTargetSize:(CGSize)a11 viewContentsScale:(double)a12;
@end

@implementation GTMTLTextureRenderer

- (GTMTLTextureRenderer)initWithDevice:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___GTMTLTextureRenderer;
  v6 = -[GTMTLTextureRenderer init](&v29, "init");
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    overlayPipelines = v6->_overlayPipelines;
    v6->_overlayPipelines = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    texturePipelines = v6->_texturePipelines;
    v6->_texturePipelines = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    depthStencilPipelines = v6->_depthStencilPipelines;
    v6->_depthStencilPipelines = v11;

    objc_storeStrong((id *)&v6->_device, a3);
    id v13 = GTMTLReplayController_defaultLibrary(v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    id v15 = [v14 newFunctionWithName:@"FullscreenVertex"];
    id v16 = [v14 newFunctionWithName:@"FullscreenFragmentOverlay"];
    id v17 = [v14 newFunctionWithName:@"FullscreenFragmentTexture"];
    id v18 = [v14 newFunctionWithName:@"FullscreenFragmentDepthStencil"];
    v19 = objc_alloc_init(&OBJC_CLASS___MTLRenderPipelineDescriptor);
    overlayPipelineDescriptor = v6->_overlayPipelineDescriptor;
    v6->_overlayPipelineDescriptor = v19;

    -[MTLRenderPipelineDescriptor setVertexFunction:](v6->_overlayPipelineDescriptor, "setVertexFunction:", v15);
    -[MTLRenderPipelineDescriptor setFragmentFunction:](v6->_overlayPipelineDescriptor, "setFragmentFunction:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTLRenderPipelineDescriptor colorAttachments](v6->_overlayPipelineDescriptor, "colorAttachments"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:0]);

    [v22 setBlendingEnabled:1];
    [v22 setSourceRGBBlendFactor:1];
    [v22 setRgbBlendOperation:0];
    [v22 setDestinationRGBBlendFactor:5];

    v23 = objc_alloc_init(&OBJC_CLASS___MTLRenderPipelineDescriptor);
    texturePipelineDescriptor = v6->_texturePipelineDescriptor;
    v6->_texturePipelineDescriptor = v23;

    -[MTLRenderPipelineDescriptor setVertexFunction:](v6->_texturePipelineDescriptor, "setVertexFunction:", v15);
    -[MTLRenderPipelineDescriptor setFragmentFunction:](v6->_texturePipelineDescriptor, "setFragmentFunction:", v17);
    v25 = objc_alloc_init(&OBJC_CLASS___MTLRenderPipelineDescriptor);
    depthStencilPipelineDescriptor = v6->_depthStencilPipelineDescriptor;
    v6->_depthStencilPipelineDescriptor = v25;

    -[MTLRenderPipelineDescriptor setVertexFunction:](v6->_depthStencilPipelineDescriptor, "setVertexFunction:", v15);
    -[MTLRenderPipelineDescriptor setFragmentFunction:]( v6->_depthStencilPipelineDescriptor,  "setFragmentFunction:",  v18);
    v27 = v6;
  }

  return v6;
}

- (id)getPipelineStateFromCache:(id)a3 withDescriptor:(id)a4 withFormat:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
  id v11 = (id)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v10]);

  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v9 colorAttachments]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:0]);
    [v13 setPixelFormat:a5];

    device = self->_device;
    uint64_t v17 = 0LL;
    id v11 = -[MTLDevice newRenderPipelineStateWithDescriptor:error:]( device,  "newRenderPipelineStateWithDescriptor:error:",  v9,  &v17);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a5));
    [v8 setObject:v11 forKeyedSubscript:v15];
  }

  return v11;
}

- (id)wrapLinear:(id)a3
{
  id v3 = a3;
  v4 = (char *)[v3 pixelFormat];
  if ((uint64_t)v4 > 551)
  {
    if (v4 == (char *)&stru_1F8.offset)
    {
      uint64_t v6 = 553LL;
      goto LABEL_10;
    }

    id v5 = v3;
    if (v4 == (_BYTE *)&stru_1F8.offset + 2)
    {
      uint64_t v6 = 555LL;
      goto LABEL_10;
    }
  }

  else
  {
    if (v4 == (_BYTE *)&stru_20.vmsize + 6)
    {
      uint64_t v6 = 71LL;
      goto LABEL_10;
    }

    id v5 = v3;
    if (v4 == (char *)&stru_20.filesize)
    {
      uint64_t v6 = 81LL;
LABEL_10:
      id v5 = [v3 newTextureViewWithPixelFormat:v6];
    }
  }

  return v5;
}

- (void)renderOverlay:(id)a3 color:(unsigned int)a4 shrinkToFit:(BOOL)a5 withEncoder:(id)a6 withFormat:(unint64_t)a7 transform:(CATransform3D *)a8 anchor:(CGPoint)a9 bounds:(CGRect)a10 renderTargetSize:(CGSize)a11 viewContentsScale:(double)a12
{
  if (a3)
  {
    BOOL v14 = a5;
    double height = a11.height;
    double width = a11.width;
    CGFloat v17 = a10.size.height;
    CGFloat v18 = a10.size.width;
    CGFloat y = a10.origin.y;
    CGFloat x = a10.origin.x;
    CGFloat v21 = a9.y;
    CGFloat v22 = a9.x;
    float32x4_t v50 = vdivq_f32( vcvtq_f32_u32((uint32x4_t)vandq_s8((int8x16_t)vdupq_n_s32(a4), (int8x16_t)xmmword_318320)),  (float32x4_t)xmmword_318330);
    overlayPipelines = self->_overlayPipelines;
    overlayPipelineDescriptor = self->_overlayPipelineDescriptor;
    id v27 = a6;
    id v28 = a3;
    objc_super v29 = (void *)objc_claimAutoreleasedReturnValue( -[GTMTLTextureRenderer getPipelineStateFromCache:withDescriptor:withFormat:]( self,  "getPipelineStateFromCache:withDescriptor:withFormat:",  overlayPipelines,  overlayPipelineDescriptor,  a7));
    id v30 = [v28 width];
    id v31 = [v28 height];
    __int128 v32 = *(_OWORD *)&a8->m33;
    __int128 v45 = *(_OWORD *)&a8->m31;
    __int128 v46 = v32;
    __int128 v33 = *(_OWORD *)&a8->m43;
    __int128 v47 = *(_OWORD *)&a8->m41;
    __int128 v48 = v33;
    __int128 v34 = *(_OWORD *)&a8->m13;
    v42[0] = *(_OWORD *)&a8->m11;
    v42[1] = v34;
    __int128 v36 = *(_OWORD *)&a8->m23;
    __int128 v43 = *(_OWORD *)&a8->m21;
    v35.f64[1] = *((float64_t *)&v43 + 1);
    __int128 v44 = v36;
    v35.f64[0] = v22;
    v37.f64[0] = x;
    v38.f64[0] = v18;
    id v40 = -[GTMTLTextureRenderer wrapLinear:]( self,  "wrapLinear:",  v28,  GetTextureRendererUniform( (uint64_t)v49,  (float64_t *)v42,  v14,  (uint64_t)v30,  (uint64_t)v31,  v35,  v21,  v37,  y,  v38,  v17,  a12,  v39,  width,  height));
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

    [v27 setVertexBytes:v49 length:112 atIndex:0];
    [v27 setRenderPipelineState:v29];
    [v27 setFragmentTexture:v41 atIndex:0];
    [v27 setFragmentBytes:&v50 length:16 atIndex:0];
    [v27 drawPrimitives:4 vertexStart:0 vertexCount:4];
  }

- (void)renderTexture:(id)a3 isDepthStencil:(BOOL)a4 shrinkToFit:(BOOL)a5 withEncoder:(id)a6 withFormat:(unint64_t)a7 transform:(CATransform3D *)a8 anchor:(CGPoint)a9 bounds:(CGRect)a10 renderTargetSize:(CGSize)a11 viewContentsScale:(double)a12
{
  BOOL v15 = a5;
  BOOL v16 = a4;
  double height = a11.height;
  double width = a11.width;
  CGFloat v19 = a10.size.height;
  CGFloat v20 = a10.size.width;
  CGFloat y = a10.origin.y;
  CGFloat x = a10.origin.x;
  CGFloat v23 = a9.y;
  CGFloat v24 = a9.x;
  id v26 = a3;
  id v27 = a6;
  if (v26)
  {
    uint64_t v28 = 6LL;
    if (v16) {
      uint64_t v28 = 7LL;
    }
    uint64_t v29 = 3LL;
    if (v16) {
      uint64_t v29 = 4LL;
    }
    id v30 = (void *)objc_claimAutoreleasedReturnValue( -[GTMTLTextureRenderer getPipelineStateFromCache:withDescriptor:withFormat:]( self,  "getPipelineStateFromCache:withDescriptor:withFormat:",  (&self->super.isa)[v28],  (&self->super.isa)[v29],  a7));
    id v31 = [v26 width];
    id v32 = [v26 height];
    __int128 v33 = *(_OWORD *)&a8->m33;
    __int128 v46 = *(_OWORD *)&a8->m31;
    __int128 v47 = v33;
    __int128 v34 = *(_OWORD *)&a8->m43;
    __int128 v48 = *(_OWORD *)&a8->m41;
    __int128 v49 = v34;
    __int128 v35 = *(_OWORD *)&a8->m13;
    v43[0] = *(_OWORD *)&a8->m11;
    v43[1] = v35;
    __int128 v37 = *(_OWORD *)&a8->m23;
    __int128 v44 = *(_OWORD *)&a8->m21;
    v36.f64[1] = *((float64_t *)&v44 + 1);
    __int128 v45 = v37;
    v36.f64[0] = v24;
    v38.f64[0] = x;
    v39.f64[0] = v20;
    id v41 = -[GTMTLTextureRenderer wrapLinear:]( self,  "wrapLinear:",  v26,  GetTextureRendererUniform( (uint64_t)v50,  (float64_t *)v43,  v15,  (uint64_t)v31,  (uint64_t)v32,  v36,  v23,  v38,  y,  v39,  v19,  a12,  v40,  width,  height));
    v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
    [v27 setVertexBytes:v50 length:112 atIndex:0];
    [v27 setRenderPipelineState:v30];
    [v27 setFragmentTexture:v42 atIndex:0];
    [v27 drawPrimitives:4 vertexStart:0 vertexCount:4];
  }
}

- (void)render:(id)a3 withEncoder:(id)a4 withFormat:(unint64_t)a5 renderTargetSize:(CGSize)a6 viewContentsScale:(double)a7
{
  double height = a6.height;
  double width = a6.width;
  id v13 = a3;
  id v14 = a4;
  unsigned int v15 = [v13 overlay];
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v13 texture]);
  if (v15)
  {
    id v17 = [v13 rgb];
    id v18 = [v13 shrinkToFit];
    if (v13) {
      [v13 transform];
    }
    else {
      memset(v38, 0, sizeof(v38));
    }
    [v13 anchor];
    double v22 = v21;
    double v24 = v23;
    [v13 bounds];
    -[GTMTLTextureRenderer renderOverlay:color:shrinkToFit:withEncoder:withFormat:transform:anchor:bounds:renderTargetSize:viewContentsScale:]( self,  "renderOverlay:color:shrinkToFit:withEncoder:withFormat:transform:anchor:bounds:renderTargetSize:viewContentsScale:",  v16,  v17,  v18,  v14,  a5,  v38,  v22,  v24,  v25,  v26,  v27,  v28,  width,  height,  *(void *)&a7);
  }

  else
  {
    id v19 = [v13 depthStencil];
    id v20 = [v13 shrinkToFit];
    if (v13) {
      [v13 transform];
    }
    else {
      memset(v37, 0, sizeof(v37));
    }
    [v13 anchor];
    double v30 = v29;
    double v32 = v31;
    [v13 bounds];
    -[GTMTLTextureRenderer renderTexture:isDepthStencil:shrinkToFit:withEncoder:withFormat:transform:anchor:bounds:renderTargetSize:viewContentsScale:]( self,  "renderTexture:isDepthStencil:shrinkToFit:withEncoder:withFormat:transform:anchor:bounds:renderTargetSize:viewContentsScale:",  v16,  v19,  v20,  v14,  a5,  v37,  v30,  v32,  v33,  v34,  v35,  v36,  width,  height,  *(void *)&a7);
  }
}

- (void).cxx_destruct
{
}

@end