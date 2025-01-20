@interface MRTransitionWipe
+ (void)initialize;
- (BOOL)dependsOnFingerPosition;
- (BOOL)isTransitioning;
- (BOOL)supportsDirectionOverride;
- (double)pzrCancel:(id)a3;
- (double)pzrEnd:(id)a3;
- (double)pzrStart:(id)a3;
- (double)pzrUpdate:(id)a3;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
- (void)unload;
@end

@implementation MRTransitionWipe

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MRTransitionWipe;
  objc_msgSendSuper2(&v2, "initialize");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerVertexShaderWithVertexShaderSource:forShaderID:",  @" \n\t\tDeclareVertex; \n\t\tDeclareTextureCoordinates0; \n\t\tDeclareTextureCoordinates1; \n\t\tattribute lowp float\taParameter; \n\t\tvarying lowp float\t\tvParameter; \n\t\tvoid main() \n\t\t{ \n\t\t\tComputeVertex; \n\t\t\tComputeTextureCoordinates0; \n\t\t\tComputeTextureCoordinates1; \n\t\t\tvParameter = aParameter; \n\t\t} \n\t\t",
    @"VertexColoredTextureMix");
  objc_msgSend( +[MRShaderManager sharedManager](MRShaderManager, "sharedManager"),  "registerShaderWithFragmentShaderSource:andVertexShaderName:forShaderID:",  @" \n\t\tDeclareTexture0; \n\t\tDeclareTexture1; \n\t\tvarying lowp float\tvParameter; \n\t\tvoid main() \n\t\t{ \n\t\t\tlowp vec4 color0 = SampleTexture0; \n            DoFilter0(color0); \n\t\t\tlowp vec4 color1 = SampleTexture1; \n            DoFilter1(color1); \n\t\t\tgl_FragColor = mix(color0, color1, vParameter); \n\t\t} \n\t\t",
    @"VertexColoredTextureMix",
    @"ColoredTextureMix");
}

- (void)unload
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRTransitionWipe;
  -[MRTransition unload](&v3, "unload");
  self->_isCanceling = 0;
  self->_isFinishing = 0;
  self->_isManuallyTransitioning = 0;
}

- (BOOL)supportsDirectionOverride
{
  return 1;
}

- (void)setAttributes:(id)a3
{
  if (!a3 || self->super.mAttributes != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___MRTransitionWipe;
    -[MRTransition setAttributes:](&v5, "setAttributes:");
    if (-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"direction")) {
      uint64_t v4 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"direction"),  "unsignedIntegerValue");
    }
    else {
      uint64_t v4 = &dword_0 + 1;
    }
    self->super._direction = *((_BYTE *)&unk_1F5F90 + v4);
  }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  double v99 = v9;
  mSourceLayer = self->super.mSourceLayer;
  -[MRLayerClock externalTime](-[MRLayer clock](mSourceLayer, "clock"), "externalTime");
  id v11 = -[MRLayer retainedByUserRenderedImageAtTime:inContext:withArguments:]( mSourceLayer,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5);
  if (!v11) {
    goto LABEL_4;
  }
  id v12 = v11;
  if ([v11 isEmpty])
  {
    [v12 releaseByUser];
LABEL_4:
    id v12 = [a4 retainedByUserBlackImage];
    int v13 = 1;
    goto LABEL_6;
  }

  int v13 = 0;
LABEL_6:
  mTargetLayer = self->super.mTargetLayer;
  -[MRLayerClock externalTime](-[MRLayer clock](mTargetLayer, "clock"), "externalTime");
  id v15 = -[MRLayer retainedByUserRenderedImageAtTime:inContext:withArguments:]( mTargetLayer,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  a4,  a5);
  if (v15)
  {
    id v16 = v15;
    if (![v15 isEmpty])
    {
      int v17 = 0;
      goto LABEL_11;
    }

    [v16 releaseByUser];
  }

  id v16 = [a4 retainedByUserBlackImage];
  int v17 = 1;
LABEL_11:
  if (!-[MRLayer isOpaque](self->super.mSourceLayer, "isOpaque")
    || !-[MRLayer isOpaque](self->super.mTargetLayer, "isOpaque"))
  {
    [a4 blend:3];
  }

  objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"width"),  "floatValue");
  float v19 = v18 + v18;
  double v20 = (float)(v18 + v18);
  id v21 = [v12 usesBackgroundColorAsBorderColor];
  [v12 setUsesBackgroundColorAsBorderColor:0];
  id v22 = [v16 usesBackgroundColorAsBorderColor];
  [v16 setUsesBackgroundColorAsBorderColor:0];
  if (!self->_isManuallyTransitioning)
  {
    float v37 = 2.0;
    int direction = self->super._direction;
    double v39 = (float)(v19 + 2.0);
    float v41 = 1.0 - a3 * v39;
    if (direction == 4) {
      float v42 = a3 * v39 + -1.0;
    }
    else {
      float v42 = -1.0;
    }
    float v43 = v20 + 1.0 - a3 * v39;
    if (direction == 8) {
      float v44 = v20 + 1.0 - a3 * v39;
    }
    else {
      float v44 = -1.0;
    }
    if (direction == 8) {
      float v45 = 1.0 - a3 * v39;
    }
    else {
      float v45 = v42;
    }
    float v46 = -1.0 - v20 + a3 * v39;
    if (direction == 4) {
      float v47 = -1.0 - v20 + a3 * v39;
    }
    else {
      float v47 = 1.0;
    }
    if (direction == 4) {
      float v45 = -1.0 - v20 + a3 * v39;
    }
    if (direction == 2)
    {
      float v40 = a3 * v39 + -1.0;
      float v48 = v40;
    }

    else
    {
      float v48 = -1.0;
    }

    if (direction == 1) {
      float v49 = v43;
    }
    else {
      float v49 = -1.0;
    }
    if (direction == 1) {
      float v50 = v41;
    }
    else {
      float v50 = v48;
    }
    if (direction == 2) {
      float v51 = v46;
    }
    else {
      float v51 = 1.0;
    }
    if (direction != 2) {
      float v46 = v50;
    }
    float v97 = v46;
    float v98 = v45;
    else {
      float v52 = v19;
    }
    if (direction != 0 && (direction & 0xF3) == 0) {
      float v37 = v19;
    }
    unint64_t v96 = __PAIR64__(LODWORD(v52), LODWORD(v37));
    if (v13)
    {
      if ((v17 & 1) != 0)
      {
LABEL_93:
        if (v17 == 1) {
          goto LABEL_106;
        }
LABEL_94:
        objc_msgSend(a4, "setShader:", @"ColoredTextureMix", v96);
        [v12 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v101 state:v99];
        [v16 setOnContext:a4 onTextureUnit:1 withReferenceAspectRatio:&v100 state:v99];
        float v89 = v98 + *(float *)&v96;
        float v111 = v97;
        float v112 = v98 + *(float *)&v96;
        float v113 = v97;
        float v114 = v98;
        float v115 = *((float *)&v96 + 1) + v97;
        float v116 = v98 + *(float *)&v96;
        float v117 = *((float *)&v96 + 1) + v97;
        float v118 = v98;
        [a4 setTextureCoordinatesPointer:&v111 onTextureUnit:0];
        [a4 setTextureCoordinatesPointer:&v111 onTextureUnit:1];
        int v90 = self->super._direction;
        BOOL v91 = v90 == 8 || v90 == 2;
        float v92 = 0.0;
        if (v91) {
          float v92 = 1.0;
        }
        unsigned int v93 = v90 - 1;
        float v94 = 1.0 - v92;
        if (v93 >= 3) {
          float v95 = 1.0 - v92;
        }
        else {
          float v95 = v92;
        }
        *(void *)&__int128 v102 = __PAIR64__(LODWORD(v95), LODWORD(v92));
        if (v93 < 3) {
          float v92 = 1.0 - v92;
        }
        *((void *)&v102 + 1) = __PAIR64__(LODWORD(v94), LODWORD(v92));
        [a4 setVertexAttributePointer:&v102 ofSize:1 forKey:@"aParameter"];
        float v103 = v97;
        float v104 = v89 / *(float *)&v99;
        float v105 = v97;
        float v106 = v98 / *(float *)&v99;
        float v107 = *((float *)&v96 + 1) + v97;
        float v108 = v89 / *(float *)&v99;
        float v109 = *((float *)&v96 + 1) + v97;
        float v110 = v98 / *(float *)&v99;
        goto LABEL_105;
      }

      else {
        v88 = @"PlainTexture";
      }
      objc_msgSend(a4, "setShader:", v88, v96);
    }

    else
    {
      if (direction == 8) {
        float v64 = v41;
      }
      else {
        float v64 = 1.0;
      }
      if (direction == 1) {
        float v65 = v41;
      }
      else {
        float v65 = 1.0;
      }
      else {
        v66 = @"PlainTexture";
      }
      [a4 setShader:v66];
      [v12 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v102 state:v99];
      float v111 = v48;
      float v112 = v64;
      float v113 = v48;
      float v114 = v42;
      float v115 = v65;
      float v116 = v64;
      float v117 = v65;
      float v118 = v42;
      [a4 setTextureCoordinatesPointer:&v111 onTextureUnit:0];
      float v103 = v48;
      float v104 = v64 / *(float *)&v99;
      float v105 = v48;
      float v106 = v42 / *(float *)&v99;
      float v107 = v65;
      float v108 = v64 / *(float *)&v99;
      float v109 = v65;
      float v110 = v42 / *(float *)&v99;
      [a4 setVertex2DPointer:&v103];
      [a4 drawTriangleStripFromOffset:0 count:4];
      [a4 unsetVertexPointer];
      [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [v12 unsetOnContext:a4 onTextureUnit:0 state:&v102];
      if ((v17 & 1) != 0)
      {
        char v67 = 1;
        goto LABEL_92;
      }
    }

    char v67 = v13 ^ 1;
    [v16 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v102 state:v99];
    float v111 = v49;
    float v112 = v47;
    float v113 = v49;
    float v114 = v44;
    float v115 = v51;
    float v116 = v47;
    float v117 = v51;
    float v118 = v44;
    [a4 setTextureCoordinatesPointer:&v111 onTextureUnit:0];
    float v103 = v49;
    float v104 = v47 / *(float *)&v99;
    float v105 = v49;
    float v106 = v44 / *(float *)&v99;
    float v107 = v51;
    float v108 = v47 / *(float *)&v99;
    float v109 = v51;
    float v110 = v44 / *(float *)&v99;
    [a4 setVertex2DPointer:&v103];
    [a4 drawTriangleStripFromOffset:0 count:4];
    [a4 unsetVertexPointer];
    [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [v16 unsetOnContext:a4 onTextureUnit:0 state:&v102];
LABEL_92:
    [a4 unsetShader];
    if ((v67 & 1) != 0) {
      goto LABEL_94;
    }
    goto LABEL_93;
  }

  double angle = self->_angle;
  double v24 = (self->_angleAim + 3.14159265 - angle) * 0.25;
  double v25 = -0.1;
  if (v24 >= -0.1)
  {
    double v25 = (self->_angleAim + 3.14159265 - angle) * 0.25;
    if (v24 > 0.1) {
      double v25 = 0.1;
    }
  }

  double v26 = angle + v25;
  self->_double angle = v26;
  *(float *)&double v26 = v26;
  __float2 v27 = __sincosf_stret(*(float *)&v26);
  double cosval = v27.__cosval;
  double sinval = v27.__sinval;
  if (self->_isFinishing || self->_isCanceling)
  {
    self->_progressAim = a3;
  }

  else
  {
    a3 = (self->_x * cosval + self->_y * sinval + 1.0) * 0.5;
    self->_progressAim = a3;
    if (a3 <= 1.0)
    {
      if (a3 < 0.0)
      {
        self->_progressAim = 0.0;
        a3 = 0.0;
      }
    }

    else
    {
      self->_progressAim = 1.0;
      a3 = 1.0;
    }
  }

  double progressInternal = self->_progressInternal;
  double v31 = (a3 - progressInternal) * 0.25;
  double v32 = -0.1;
  if (v31 >= -0.1)
  {
    double v32 = (a3 - progressInternal) * 0.25;
    if (v31 > 0.1) {
      double v32 = 0.1;
    }
  }

  double v33 = progressInternal + v32;
  self->_double progressInternal = v33;
  double v34 = v33 * 2.0 + -1.0;
  double v35 = v34 * cosval;
  double v36 = v34 * sinval;
  if ((v13 & 1) == 0)
  {
    else {
      v53 = @"PlainTexture";
    }
    [a4 setShader:v53];
    [v12 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v102 state:v99];
    double v54 = v35 + cosval * 10.0;
    float v55 = v54 + sinval * 2.0;
    double v56 = v36 + sinval * 10.0;
    float v57 = v56 + cosval * -2.0;
    float v111 = v55;
    float v112 = v57;
    double v58 = v35 + v20 * cosval;
    float v59 = v58 + sinval * 2.0;
    double v60 = v36 + v20 * sinval;
    float v61 = v60 + cosval * -2.0;
    float v113 = v59;
    float v114 = v61;
    *(float *)&double v54 = v54 + sinval * -2.0;
    *(float *)&double v56 = v56 + cosval * 2.0;
    float v115 = *(float *)&v54;
    float v116 = *(float *)&v56;
    *(float *)&double v56 = v58 + sinval * -2.0;
    *(float *)&double v54 = v60 + cosval * 2.0;
    float v117 = *(float *)&v56;
    float v118 = *(float *)&v54;
    [a4 setTextureCoordinatesPointer:&v111 onTextureUnit:0];
    float32x4x2_t v119 = vld2q_f32(&v111);
    v119.val[1] = vdivq_f32(v119.val[1], (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v99, 0));
    v62 = &v103;
    vst2q_f32(v62, v119);
    [a4 setVertex2DPointer:&v103];
    [a4 drawTriangleStripFromOffset:0 count:4];
    [a4 unsetVertexPointer];
    [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [v12 unsetOnContext:a4 onTextureUnit:0 state:&v102];
    if ((v17 & 1) != 0)
    {
      char v63 = 1;
      goto LABEL_84;
    }

- (BOOL)isTransitioning
{
  return self->_isManuallyTransitioning;
}

- (BOOL)dependsOnFingerPosition
{
  return 1;
}

- (double)pzrStart:(id)a3
{
  self->_isManuallyTransitioning = 1;
  self->_isCanceling = 0;
  self->_isFinishing = 0;
  double v5 = *((double *)a3 + 8);
  double v6 = *((double *)a3 + 9);
  if (v5 <= 0.0)
  {
    double v6 = -v6;
    double v5 = -v5;
  }

  self->_angleAim = atan2(v6, v5);
  if (self->super._progress == 0.0)
  {
    double v7 = 0.0;
    self->_double progressInternal = v7;
    self->_double angle = self->_angleAim + 3.14159265;
  }

  self->_x = *((double *)a3 + 2);
  self->_y = *((double *)a3 + 3);
  return 0.0;
}

- (double)pzrUpdate:(id)a3
{
  double v5 = *((double *)a3 + 8);
  double v6 = *((double *)a3 + 9);
  double v7 = v6 * v6 + v5 * v5;
  if (v7 > 0.05)
  {
    if (v5 <= 0.0)
    {
      double v6 = -v6;
      double v5 = -v5;
    }

    double v8 = self->_angleAim + (atan2(v6, v5) - self->_angleAim) * fmin(v7 * 0.1, 1.0);
    self->_angleAim = v8;
    double v9 = 0.785398163;
    if (v8 > 0.785398163 || (double v9 = -0.785398163, v8 < -0.785398163)) {
      self->_angleAim = v9;
    }
  }

  self->_x = *((double *)a3 + 2);
  self->_y = *((double *)a3 + 3);
  return 0.0;
}

- (double)pzrEnd:(id)a3
{
  self->_isFinishing = 1;
  return 0.0;
}

- (double)pzrCancel:(id)a3
{
  self->_isCanceling = 1;
  return 0.0;
}

@end