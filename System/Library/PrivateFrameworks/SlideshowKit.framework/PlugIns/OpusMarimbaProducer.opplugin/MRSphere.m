@interface MRSphere
- (MRSphere)init;
- (float)halfLatitudeAngle;
- (float)halfLongitudeAngle;
- (float)radius;
- (unsigned)latitudeResolution;
- (unsigned)longitudeResolution;
- (void)dealloc;
- (void)renderDumbImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6;
- (void)setHalfLatitudeAngle:(float)a3;
- (void)setHalfLongitudeAngle:(float)a3;
- (void)setLatitudeResolution:(unsigned int)a3;
- (void)setLongitudeResolution:(unsigned int)a3;
- (void)setRadius:(float)a3;
@end

@implementation MRSphere

- (MRSphere)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRSphere;
  result = -[MRSphere init](&v3, "init");
  if (result)
  {
    *(void *)&result->mLongitudeResolution = 0x3200000064LL;
    *(void *)&result->mHalfLongitudeAngle = 0x3FC90FDB40490FDBLL;
    result->mRadius = 1.0;
  }

  return result;
}

- (void)dealloc
{
  mVertices = self->mVertices;
  if (mVertices)
  {
    free(mVertices);
    self->mVertices = 0LL;
    free(self->mTextureCoordinates);
    self->mTextureCoordinates = 0LL;
    free(self->mNormals);
    self->mNormals = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRSphere;
  -[MRSphere dealloc](&v4, "dealloc");
}

- (void)renderDumbImage:(id)a3 inContext:(id)a4 atPosition:(CGPoint)a5 andSize:(CGSize)a6
{
  unsigned int mLongitudeResolution = self->mLongitudeResolution;
  unsigned int mLatitudeResolution = self->mLatitudeResolution;
  uint64_t v55 = 2 * mLatitudeResolution * (mLongitudeResolution + 2) - 2;
  if (!self->mVertices)
  {
    v9 = (float *)malloc(4LL * (3 * v55));
    self->mVertices = v9;
    v10 = (float *)malloc(4LL * (2 * v55));
    self->mTextureCoordinates = v10;
    v11 = (float *)malloc(4LL * (3 * v55));
    self->mNormals = v11;
    if (mLatitudeResolution)
    {
      v12 = v11;
      unsigned int v13 = 0;
      double v58 = (double)mLatitudeResolution;
      double v14 = (double)mLongitudeResolution;
      double v7 = 0.0;
      do
      {
        double v15 = v7;
        double mHalfLatitudeAngle = self->mHalfLatitudeAngle;
        float v17 = (v7 + v7) * mHalfLatitudeAngle / v58 - mHalfLatitudeAngle;
        __float2 v18 = __sincosf_stret(v17);
        double cosval = v18.__cosval;
        unsigned int v60 = v13 + 1;
        double v57 = (double)v60 + (double)v60;
        float v19 = v57 * mHalfLatitudeAngle / v58 - mHalfLatitudeAngle;
        __float2 v22 = __sincosf_stret(v19);
        float v20 = v22.__cosval;
        LODWORD(v21) = *(void *)&v22;
        uint64_t v23 = 0LL;
        unsigned int v24 = 0;
        double v25 = v20;
        float v26 = v15 / v58;
        double v59 = v15 + 1.0;
        float v27 = (v15 + 1.0) / v58;
        v28 = v10;
        do
        {
          v29 = &v12[v23];
          v30 = &v9[v23];
          float v31 = self->mHalfLongitudeAngle + 1.57079633 - ((double)v24 + (double)v24) * self->mHalfLongitudeAngle / v14;
          double v32 = v25;
          float v33 = v20;
          float v34 = v21;
          float v35 = v26;
          __float2 v36 = __sincosf_stret(v31);
          float v26 = v35;
          float v21 = v34;
          float v20 = v33;
          double v25 = v32;
          float v37 = self->mRadius * v36.__cosval * cosval;
          float *v30 = v37;
          v30[1] = v18.__sinval * self->mRadius;
          float v38 = self->mRadius * v36.__sinval * cosval + -2.0;
          v30[2] = v38;
          float v39 = (double)v24 / v14;
          float *v28 = v39;
          v28[1] = v26;
          float *v29 = v18.__cosval * v36.__cosval;
          v29[1] = v18.__sinval;
          v29[2] = v18.__cosval * v36.__sinval;
          float v40 = v36.__cosval * self->mRadius * v32;
          v30[3] = v40;
          v30[4] = v21 * self->mRadius;
          float v41 = v36.__sinval * self->mRadius * v32 + -2.0;
          v30[5] = v41;
          v10 = v28 + 4;
          v28[2] = v39;
          v28[3] = v27;
          v29[3] = v20 * v36.__cosval;
          v29[4] = v21;
          v29[5] = v20 * v36.__sinval;
          ++v24;
          v23 += 6LL;
          v28 += 4;
        }

        while (v24 <= mLongitudeResolution);
        v12 = (float *)((char *)v12 + v23 * 4);
        v9 = (float *)((char *)v9 + v23 * 4);
        if (v13 < mLatitudeResolution - 1)
        {
          float v42 = self->mHalfLongitudeAngle + 1.57079633 - (v14 + v14) * self->mHalfLongitudeAngle / v14;
          float v43 = v26;
          __float2 v44 = __sincosf_stret(v42);
          float v45 = self->mRadius * v44.__cosval * v32;
          float *v9 = v45;
          v9[1] = v21 * self->mRadius;
          float v46 = self->mRadius * v44.__sinval * v32 + -2.0;
          v9[2] = v46;
          float *v10 = 1.0;
          v10[1] = v27;
          float *v12 = v20 * v44.__cosval;
          v12[1] = v21;
          v12[2] = v20 * v44.__sinval;
          float v47 = v57 * self->mHalfLatitudeAngle / v58 - self->mHalfLatitudeAngle;
          __float2 v48 = __sincosf_stret(v47);
          float v49 = self->mHalfLongitudeAngle + 1.57079633;
          __float2 v50 = __sincosf_stret(v49);
          float v51 = self->mRadius * v50.__cosval * v48.__cosval;
          v9[3] = v51;
          v9[4] = self->mRadius * v48.__sinval;
          float v52 = v50.__sinval * self->mRadius * v48.__cosval + -2.0;
          v9[5] = v52;
          v9 += 6;
          v10[2] = 0.0;
          v10[3] = v43;
          v10 += 4;
          v12[3] = v50.__cosval * v48.__cosval;
          v12[4] = v48.__sinval;
          v12[5] = v50.__sinval * v48.__cosval;
          v12 += 6;
        }

        ++v13;
        double v7 = v59;
      }

      while (v60 != mLatitudeResolution);
    }
  }

  LODWORD(v7) = 0;
  [a3 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:v62 state:v7];
  [a4 setTextureCoordinatesPointer:self->mTextureCoordinates onTextureUnit:0];
  [a4 setVertex3DPointer:self->mVertices];
  [a4 setNormalsPointer:self->mNormals];
  [a4 drawTriangleStripFromOffset:0 count:v55];
  [a4 unsetNormalsPointer];
  [a4 unsetVertexPointer];
  [a4 unsetTextureCoordinatesPointerOnTextureUnit:0];
  [a3 unsetOnContext:a4 onTextureUnit:0 state:v62];
  [a4 cull:0];
}

- (unsigned)longitudeResolution
{
  return self->mLongitudeResolution;
}

- (void)setLongitudeResolution:(unsigned int)a3
{
  self->unsigned int mLongitudeResolution = a3;
}

- (unsigned)latitudeResolution
{
  return self->mLatitudeResolution;
}

- (void)setLatitudeResolution:(unsigned int)a3
{
  self->unsigned int mLatitudeResolution = a3;
}

- (float)halfLongitudeAngle
{
  return self->mHalfLongitudeAngle;
}

- (void)setHalfLongitudeAngle:(float)a3
{
  self->mHalfLongitudeAngle = a3;
}

- (float)halfLatitudeAngle
{
  return self->mHalfLatitudeAngle;
}

- (void)setHalfLatitudeAngle:(float)a3
{
  self->double mHalfLatitudeAngle = a3;
}

- (float)radius
{
  return self->mRadius;
}

- (void)setRadius:(float)a3
{
  self->mRadius = a3;
}

@end