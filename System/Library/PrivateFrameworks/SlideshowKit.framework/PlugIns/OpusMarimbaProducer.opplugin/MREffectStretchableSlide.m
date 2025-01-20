@interface MREffectStretchableSlide
- (BOOL)isNative3D;
- (BOOL)isOpaque;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
@end

@implementation MREffectStretchableSlide

- (void)setAttributes:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MREffectStretchableSlide;
  -[MREffect setAttributes:](&v12, "setAttributes:", a3);
  __asm
  {
    FMOV            V0.2D, #0.25
    FMOV            V1.2D, #0.5
  }

  *(_OWORD *)(&self->super._isInInteractiveMode + 1) = _Q0;
  *(_OWORD *)((char *)&self->mSpriteInnerRect.origin.y + 1) = _Q1;
  *(_OWORD *)((char *)&self->mSpriteInnerRect.size.height + 1) = _Q0;
  *(_OWORD *)((char *)&self->mImageInnerRect.origin.y + 1) = _Q1;
  v10 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"spriteInnerRect");
  if (v10) {
    *(CGRect *)(&self->super._isInInteractiveMode + 1) = CGRectFromString(v10);
  }
  v11 = -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"imageInnerRect");
  if (v11) {
    *(CGRect *)((char *)&self->mSpriteInnerRect.size.height + 1) = CGRectFromString(v11);
  }
  BYTE1(self->mImageInnerRect.size.height) = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"dontDrawInner"),  "BOOLValue");
}

- (BOOL)isNative3D
{
  return 1;
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v7 = objc_msgSend( -[NSDictionary objectForKey:]( -[MRLayerEffect slideProvidersForElementIDs](self->super.mEffectLayer, "slideProvidersForElementIDs"),  "objectForKey:",  @"image0"),  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5,  a3);
  float v8 = *(double *)(&self->super._isInInteractiveMode + 1) * 2.0 + -1.0;
  float v9 = *(double *)((char *)&self->mSpriteInnerRect.origin.x + 1) * 2.0 + -1.0;
  float v10 = v8 + *(double *)((char *)&self->mSpriteInnerRect.origin.y + 1) * 2.0;
  float v11 = v9 + *(double *)((char *)&self->mSpriteInnerRect.size.width + 1) * 2.0;
  int32x2_t v20 = (int32x2_t)vcvt_f32_f64(*(float64x2_t *)((char *)&self->mSpriteInnerRect.size.height + 1));
  float64x2_t v22 = vaddq_f64(*(float64x2_t *)((char *)&self->mImageInnerRect.origin.y + 1), vcvtq_f64_f32((float32x2_t)v20));
  int32x2_t v21 = (int32x2_t)vcvt_f32_f64(v22);
  [a4 localAspectRatio];
  float v55 = -(float)(1.0 / v12);
  float v56 = v8;
  float v57 = (float)(1.0 / v12) * v9;
  int v58 = -1082130432;
  float v59 = v57;
  float v60 = v8;
  float v61 = (float)(1.0 / v12) * v11;
  int v62 = -1082130432;
  float v63 = v61;
  int v64 = -1082130432;
  float v65 = 1.0 / v12;
  int v66 = -1082130432;
  float v67 = 1.0 / v12;
  float v68 = v8;
  float v69 = v61;
  float v70 = v8;
  float v71 = 1.0 / v12;
  float v72 = v10;
  float v73 = v61;
  float v74 = v10;
  float v75 = 1.0 / v12;
  int v76 = 1065353216;
  float v77 = 1.0 / v12;
  int v78 = 1065353216;
  float v79 = 1.0 / v12;
  float v80 = v10;
  float v81 = v61;
  int v82 = 1065353216;
  float v83 = v61;
  float v84 = v10;
  float v85 = v57;
  int v86 = 1065353216;
  float v87 = v57;
  int v88 = 1065353216;
  float v89 = v55;
  int v90 = 1065353216;
  float v91 = v55;
  float v92 = v10;
  float v93 = v57;
  float v94 = v10;
  float v95 = v55;
  float v96 = v8;
  float v97 = v57;
  float v98 = v8;
  float v99 = v55;
  int v100 = -1082130432;
  float v101 = v55;
  *(int32x2_t *)&__int128 v13 = v20;
  v26[0] = 0LL;
  v26[1] = v20;
  int v27 = 0;
  int32x2_t v28 = vrev64_s32(v20);
  __int32 v29 = v21.i32[1];
  int v30 = 0;
  __int32 v31 = v21.i32[1];
  __int128 v32 = xmmword_1F5FA0;
  unint64_t v33 = __PAIR64__(v21.u32[1], v20.u32[0]);
  __int32 v34 = v20.i32[0];
  int v35 = 1065353216;
  int32x2_t v36 = v21;
  __int32 v37 = v21.i32[0];
  __asm { FMOV            V4.4S, #1.0 }

  __int128 v38 = _Q4;
  int v39 = 1065353216;
  int32x2_t v40 = v21;
  int v41 = 1065353216;
  int32x2_t v42 = vrev64_s32(v21);
  __int32 v43 = v20.i32[1];
  int v44 = 1065353216;
  __int32 v45 = v20.i32[1];
  __int128 v46 = xmmword_1F6120;
  unint64_t v47 = __PAIR64__(v20.u32[1], v21.u32[0]);
  __int32 v48 = v21.i32[0];
  int v49 = 0;
  int32x2_t v50 = v20;
  __int32 v51 = v20.i32[0];
  uint64_t v52 = 0LL;
  int v53 = 0;
  int v54 = -1082130432;
  *(float *)v25 = v8;
  *(float *)&v25[1] = v57;
  *(float *)&v25[2] = v8;
  *(float *)&v25[3] = v61;
  *(float *)&v25[4] = v10;
  *(float *)&v25[5] = v57;
  *(float *)&v25[6] = v10;
  *(float *)&v25[7] = v61;
  *((void *)&v13 + 1) = __PAIR64__(v21.u32[1], v20.u32[0]);
  HIDWORD(v19) = HIDWORD(v22.f64[0]);
  v24[0] = v13;
  v24[1] = vcvt_hight_f32_f64((int32x2_t)__PAIR64__(v20.u32[1], v21.u32[0]), v22);
  LODWORD(v19) = 0;
  [a4 setImage:v7 onTextureUnit:0 withReferenceAspectRatio:&v23 state:v19];
  [a4 setShader:@"PlainTexture"];
  [a4 blend:2];
  [a4 setVertex2DPointer:&v54];
  [a4 setTextureCoordinatesPointer:v26 onTextureUnit:0];
  [a4 drawTriangleStripFromOffset:0 count:24];
  [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a4 unsetVertexPointer];
  [a4 blend:0];
  if (!BYTE1(self->mImageInnerRect.size.height))
  {
    [a4 setVertex2DPointer:v25];
    [a4 setTextureCoordinatesPointer:v24 onTextureUnit:0];
    [a4 drawTriangleStripFromOffset:0 count:4];
    [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [a4 unsetVertexPointer];
  }

  [a4 unsetShader];
  [a4 unsetImage:v7 onTextureUnit:0 state:&v23];
  [v7 releaseByUser];
}

@end