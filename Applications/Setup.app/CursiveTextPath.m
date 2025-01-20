@interface CursiveTextPath
- (CGAffineTransform)transformForRect:(SEL)a3 pointSize:(CGRect)a4 flipped:(double)a5;
- (CGPath)pathForFraction:(float)a3 calculateLength:(BOOL)a4;
- (CGPath)pathForTime:(float)a3;
- (CursiveTextPath)initWithURL:(id)a3;
- (CursiveTextPath)initWithURL:(id)a3 resolution:(int)a4;
- (float)duration;
@end

@implementation CursiveTextPath

- (CursiveTextPath)initWithURL:(id)a3
{
  return -[CursiveTextPath initWithURL:resolution:](self, "initWithURL:resolution:", a3, 40LL);
}

- (CursiveTextPath)initWithURL:(id)a3 resolution:(int)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CursiveTextPath;
  v7 = -[CursiveTextPath init](&v15, "init");
  v8 = (CGRect *)v7;
  if (!v7)
  {
LABEL_5:
    v9 = v8;
    goto LABEL_7;
  }

  *(void *)&v7->_initialWeight = 0x3F8000003F266666LL;
  v7->_rampTime = 0.25;
  v9 = (CursiveTextPath *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v6));
  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v9,  0LL,  0LL,  0LL));
    if (!v10)
    {

      v9 = 0LL;
      goto LABEL_7;
    }

    CGFloat x = v8[2].origin.x;
    *(void *)&v8[2].origin.CGFloat x = v10;

    LODWORD(v8[2].origin.y) = a4;
    LODWORD(v12) = 0;
    v13 = (const CGPath *)-[CGRect pathForFraction:calculateLength:](v8, "pathForFraction:calculateLength:", 1LL, v12);
    v8[1] = CGPathGetPathBoundingBox(v13);
    CGPathRelease(v13);
    *(float *)&v8->size.height = (float)(powf( (float)(fminf(fmaxf(*((float *)&v8->size.width + 1) / 3000.0, 0.0), 10.0)
                                                 / 10.0)
                                         + -1.0,
                                           3.0)
                                       + 1.0)
                               * 4.0;

    goto LABEL_5;
  }

- (CGAffineTransform)transformForRect:(SEL)a3 pointSize:(CGRect)a4 flipped:(double)a5
{
  result = (CGAffineTransform *)self->_pathDefinition;
  if (result)
  {
    BOOL v9 = a6;
    double height = a4.size.height;
    double width = a4.size.width;
    v13 = (void *)objc_claimAutoreleasedReturnValue( -[CGAffineTransform objectForKeyedSubscript:]( result,  "objectForKeyedSubscript:",  @"unitsPerEm",  a4.origin.x,  a4.origin.y));
    [v13 floatValue];
    double v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_pathDefinition,  "objectForKeyedSubscript:",  @"ascender"));
    [v16 floatValue];
    double v18 = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_pathDefinition,  "objectForKeyedSubscript:",  @"descender"));
    [v19 floatValue];
    double v21 = v20;

    double v22 = v18 - v21;
    double v23 = -v21 / (v18 - v21);
    double v24 = v22 / v15 * a5;
    double v25 = (height - v24) * 0.5;
    CGAffineTransformMakeTranslation( retstr,  -(self->_boundingBoxOfPath.origin.x + self->_boundingBoxOfPath.size.width * 0.5),  0.0);
    if (v9) {
      double v26 = 1.0 - v23;
    }
    else {
      double v26 = v23;
    }
    double v27 = v25 + v26 * v24;
    double v28 = -(a5 / v15);
    if (!v9) {
      double v28 = a5 / v15;
    }
    CGAffineTransformMakeScale(&t2, a5 / v15, v28);
    __int128 v29 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v29;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&v38, &t1, &t2);
    __int128 v30 = *(_OWORD *)&v38.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v38.a;
    *(_OWORD *)&retstr->c = v30;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v38.tx;
    CGAffineTransformMakeTranslation(&v35, width * 0.5, v27);
    __int128 v31 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v31;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformConcat(&v38, &t1, &v35);
    __int128 v32 = *(_OWORD *)&v38.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v38.a;
    *(_OWORD *)&retstr->c = v32;
    __int128 v33 = *(_OWORD *)&v38.tx;
  }

  else
  {
    __int128 v34 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v34;
    __int128 v33 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }

  *(_OWORD *)&retstr->tCGFloat x = v33;
  return result;
}

- (float)duration
{
  return self->_duration;
}

- (CGPath)pathForTime:(float)a3
{
  *(float *)&double v3 = a3 / self->_duration;
  return -[CursiveTextPath pathForFraction:calculateLength:](self, "pathForFraction:calculateLength:", 0LL, v3);
}

- (CGPath)pathForFraction:(float)a3 calculateLength:(BOOL)a4
{
  BOOL v4 = a4;
  float rampTime = self->_rampTime;
  float duration = self->_duration;
  BOOL v9 = &ACAccountTypeIdentifierGameCenter_ptr;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_pathDefinition,  "objectForKeyedSubscript:",  @"scale"));
  double v12 = v11;
  __asm { FMOV            V0.4S, #1.0 }

  double v124 = *(double *)&_Q0;
  if (v11 && [v11 count] == (id)4)
  {
    double v18 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:0]);
    [v18 floatValue];
    unsigned int v125 = v19;

    float v20 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:1]);
    [v20 floatValue];
    unsigned int v130 = v21;

    double v22 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:2]);
    [v22 floatValue];

    double v23 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:3]);
    [v23 floatValue];
    double v124 = COERCE_DOUBLE(__PAIR64__(v130, v125));
  }

  double v24 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_pathDefinition,  "objectForKeyedSubscript:",  @"strokes"));
  __int128 v151 = 0u;
  __int128 v152 = 0u;
  __int128 v153 = 0u;
  __int128 v154 = 0u;
  id v25 = v24;
  id v26 = [v25 countByEnumeratingWithState:&v151 objects:v159 count:16];
  v119 = v12;
  v122 = v25;
  if (v26)
  {
    char v27 = 0;
    char v28 = 0;
    float v29 = rampTime / duration;
    float v30 = -(float)((float)(rampTime / duration) - (float)((float)((float)(rampTime / duration) + 1.0) * a3));
    uint64_t v31 = *(void *)v152;
    float32x4_t v131 = 0u;
    float v33 = 0.0;
    v117 = v10;
    uint64_t v115 = *(void *)v152;
    do
    {
      uint64_t v34 = 0LL;
      id v116 = v26;
      do
      {
        if (*(void *)v152 != v31) {
          objc_enumerationMutation(v25);
        }
        uint64_t v118 = v34;
        CGAffineTransform v35 = *(void **)(*((void *)&v151 + 1) + 8 * v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue([v9[196] array]);
        __int128 v147 = 0u;
        __int128 v148 = 0u;
        __int128 v149 = 0u;
        __int128 v150 = 0u;
        id obj = v35;
        id v120 = [obj countByEnumeratingWithState:&v147 objects:v158 count:16];
        if (v120)
        {
          uint64_t v121 = *(void *)v148;
          while (2)
          {
            for (i = 0LL; i != v120; i = (char *)i + 1)
            {
              if (*(void *)v148 != v121) {
                objc_enumerationMutation(obj);
              }
              CGAffineTransform v38 = -[BezierCurve initWithDictionary:]( objc_alloc(&OBJC_CLASS___BezierCurve),  "initWithDictionary:",  *(void *)(*((void *)&v147 + 1) + 8LL * (void)i));
              -[BezierCurve scaleBy:](v38, "scaleBy:", v124);
              -[BezierCurve p0](v38, "p0");
              *(_OWORD *)path1b = v39;
              -[BezierCurve p3](v38, "p3");
              if ((vminvq_u32((uint32x4_t)vceqq_f32(*(float32x4_t *)path1b, v40)) & 0x80000000) != 0)
              {
                int resolution = 0;
                float32x4_t v42 = v131;
LABEL_18:
                int v43 = 0;
                int v44 = resolution + 1;
                float32x4_t v45 = v42;
                while (1)
                {
                  *(float32x4_t *)path1 = v45;
                  float32_t v46 = (float)(1.0 / (float)self->_resolution) * (float)v43;
                  v42.f32[0] = v46;
                  -[BezierCurve pointAt:](v38, "pointAt:", *(double *)v42.i64);
                  float32x4_t v132 = v47;
                  v47.f32[0] = v46;
                  -[BezierCurve derivativeAt:](v38, "derivativeAt:", *(double *)v47.i64);
                  *(float *)&__int32 v49 = -*(float *)v48.i32;
                  v48.i32[0] = vdup_lane_s32(v48, 1).u32[0];
                  v48.i32[1] = v49;
                  float32x2_t v50 = vmul_f32((float32x2_t)v48, (float32x2_t)v48);
                  float32x2_t v51 = vadd_f32(v50, (float32x2_t)vdup_lane_s32((int32x2_t)v50, 1));
                  float32x2_t v52 = vrsqrte_f32(v51);
                  float32x2_t v53 = vmul_f32(v52, vrsqrts_f32(v51, vmul_f32(v52, v52)));
                  int8x8_t v54 = (int8x8_t)vmul_n_f32( (float32x2_t)v48,  vmul_f32(v53, vrsqrts_f32(v51, vmul_f32(v53, v53))).f32[0]);
                  if ((v28 & 1) != 0)
                  {
                    float32x4_t v55 = vsubq_f32(v132, *(float32x4_t *)path1);
                    float32x4_t v56 = vmulq_f32(v55, v55);
                    float v57 = sqrtf(vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v56, 2),  vaddq_f32(v56, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v56.f32, 1))).f32[0]);
                    float v58 = 0.5;
                    if ((v27 & 1) == 0) {
                      float v58 = 1.0;
                    }
                    float v33 = v33 + (float)(v57 * v58);
                    char v27 = 0;
                  }

                  float v59 = v33 / self->_length;
                  if (!v4 && v59 > v32) {
                    break;
                  }
                  double v60 = COERCE_DOUBLE(vbsl_s8((int8x8_t)vdup_n_s32(0xFFFFFFFF), v54, (int8x8_t)0x3F80000000000000LL));
                  float v61 = vmuls_lane_f32( self->_initialWeight + (float)((float)(powf( (float)(1.0 - fminf(fmaxf((float)(v59 - v30) / v29, 0.0), 1.0)) + -1.0,  3.0)
                                        + 1.0)
                                * (float)(self->_finalWeight - self->_initialWeight)),
                          v132,
                          3);
                  v62 = objc_alloc(&OBJC_CLASS___PathPoint);
                  *(float *)&double v63 = v61;
                  *(float *)&double v64 = v33;
                  v65 = -[PathPoint initWithP:n:r:l:](v62, "initWithP:n:r:l:", *(double *)v132.i64, v60, v63, v64);
                  [v36 addObject:v65];

                  float32x4_t v42 = v132;
                  ++v43;
                  char v28 = 1;
                  float32x4_t v45 = v132;
                  if (v44 == v43) {
                    goto LABEL_26;
                  }
                }

                uint64_t v10 = v117;
                objc_msgSend(v117, "addObject:", v36, *(double *)&v54);

                id v25 = v122;
                goto LABEL_33;
              }

              int resolution = self->_resolution;
              float32x4_t v42 = v131;
              if ((resolution & 0x80000000) == 0) {
                goto LABEL_18;
              }
LABEL_26:
              float32x4_t v131 = v42;

              char v27 = 1;
            }

            id v25 = v122;
            uint64_t v10 = v117;
            BOOL v9 = &ACAccountTypeIdentifierGameCenter_ptr;
            id v120 = [obj countByEnumeratingWithState:&v147 objects:v158 count:16];
            if (v120) {
              continue;
            }
            break;
          }
        }

        [v10 addObject:v36];
        uint64_t v34 = v118 + 1;
        uint64_t v31 = v115;
      }

      while ((id)(v118 + 1) != v116);
      id v26 = [v25 countByEnumeratingWithState:&v151 objects:v159 count:16];
    }

    while (v26);
  }

  else
  {
    float v33 = 0.0;
  }

- (void).cxx_destruct
{
}

@end