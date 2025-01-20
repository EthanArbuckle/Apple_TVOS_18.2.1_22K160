@interface Cube
+ (void)initialize;
- (Cube)init;
- (MRImage)destinationImage;
- (MRImage)sourceImage;
- (void)dealloc;
- (void)draw:(id)a3 withArguments:(id)a4;
- (void)setDestinationImage:(id)a3;
- (void)setSourceImage:(id)a3;
- (void)setupTextureInformation:(int)a3;
- (void)updateRotations:(double)a3 rotateHorizontally:(BOOL)a4;
@end

@implementation Cube

+ (void)initialize
{
  if ((byte_2B06C0 & 1) == 0)
  {
    uint64_t v2 = 0LL;
    xmmword_2B06D0 = xmmword_1FBD20;
    unk_2B06E0 = xmmword_1FB9D0;
    xmmword_2B06F0 = xmmword_1FA180;
    unk_2B0700 = xmmword_1FA170;
    xmmword_2B0710 = xmmword_1FBD20;
    unk_2B0720 = xmmword_1FBD30;
    v3 = &dword_2B0738;
    do
    {
      v4 = (char *)&xmmword_2B06D0 + 12 * dword_1FBD4C[v2];
      *((void *)v3 - 1) = *(void *)v4;
      int *v3 = *((_DWORD *)v4 + 2);
      v3 += 3;
      ++v2;
    }

    while (v2 != 12);
    uint64_t v5 = 0LL;
    v6 = &dword_2B08E8;
    do
    {
      v7 = (char *)&xmmword_2B06D0 + 12 * destinationVertexIndices[v5];
      *((void *)v6 - 1) = *(void *)v7;
      int *v6 = *((_DWORD *)v7 + 2);
      v6 += 3;
      ++v5;
    }

    while (v5 != 24);
    byte_2B06C0 = 1;
  }

- (Cube)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___Cube;
  result = -[Cube init](&v8, "init");
  if (result)
  {
    result->_scale[0] = 1.0;
    __asm { FMOV            V0.2S, #1.0 }

    *(void *)&result->_scale[1] = _D0;
    *(_WORD *)&result->_animateCube = 0;
    *(_OWORD *)&result->_xIndex = 0u;
    *(_OWORD *)&result->_matrixWidth = 0u;
  }

  return result;
}

- (void)dealloc
{
  self->_sourceImage = 0LL;
  -[MRImage releaseByUser](self->_destinationImage, "releaseByUser");
  self->_destinationImage = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___Cube;
  -[Cube dealloc](&v3, "dealloc");
}

- (void)setSourceImage:(id)a3
{
  sourceImage = self->_sourceImage;
  if (sourceImage != a3)
  {
    -[MRImage releaseByUser](sourceImage, "releaseByUser");
    self->_sourceImage = (MRImage *)[a3 retainByUser];
  }

- (void)setDestinationImage:(id)a3
{
  destinationImage = self->_destinationImage;
  if (destinationImage != a3)
  {
    -[MRImage releaseByUser](destinationImage, "releaseByUser");
    self->_destinationImage = (MRImage *)[a3 retainByUser];
  }

- (void)setupTextureInformation:(int)a3
{
  self->_flipDirection = a3;
  if ((a3 - 5) >= 0xFFFFFFFE)
  {
    double matrixWidth = (double)self->_matrixWidth;
    double v6 = 2.0;
    double matrixHeight = (double)self->_matrixHeight;
    double v4 = 2.0 / matrixWidth;
  }

  else
  {
    double matrixHeight = (double)self->_matrixHeight;
    double v4 = 2.0;
    double matrixWidth = (double)self->_matrixWidth;
    double v6 = 2.0 / matrixHeight;
  }

  double v7 = v4 * ((double)self->_xIndex - matrixWidth * 0.5);
  float v8 = v7;
  self->_textureCoords[0][0] = v8;
  textureCoords = self->_textureCoords;
  double v10 = v6 * ((double)self->_yIndex - matrixHeight * 0.5);
  float v11 = v10;
  float v12 = v4 + v7;
  self->_textureCoords[0][1] = v11;
  self->_textureCoords[1][0] = v12;
  self->_textureCoords[1][1] = v11;
  self->_textureCoords[2][0] = v12;
  float v13 = v6 + v10;
  self->_textureCoords[2][1] = v13;
  self->_textureCoords[3][0] = v8;
  self->_textureCoords[3][1] = v13;
  self->_textureCoords[4][0] = v8;
  self->_textureCoords[4][1] = v11;
  self->_textureCoords[5][0] = v12;
  self->_textureCoords[5][1] = v11;
  self->_textureCoords[6][0] = v12;
  self->_textureCoords[6][1] = v13;
  self->_textureCoords[7][0] = v8;
  self->_textureCoords[7][1] = v13;
  sourceTriangleTextures = self->_sourceTriangleTextures;
  if ((a3 - 3) >= 2)
  {
    for (uint64_t i = 0LL; i != 12; ++i)
      *(void *)&sourceTriangleTextures[i][0] = *(void *)&textureCoords[sourceTextureIndices[i + 12]][0];
  }

  else
  {
    for (uint64_t j = 0LL; j != 12; ++j)
      *(void *)&sourceTriangleTextures[j][0] = *(void *)&textureCoords[sourceTextureIndices[j]][0];
  }

  for (unint64_t k = 0LL; k != 24; ++k)
  {
    int v18 = k - 12;
    if (k < 0xC) {
      int v18 = k;
    }
    *(void *)&self->_destinationTriangleTextures[k][0] = *(void *)&textureCoords[destinationTextureIndices[v18]][0];
  }

- (void)updateRotations:(double)a3 rotateHorizontally:(BOOL)a4
{
  switch(self->_flipDirection)
  {
    case 1:
      double matrixHeight = (double)self->_matrixHeight;
      int64_t yIndex = self->_yIndex;
      goto LABEL_8;
    case 2:
      int64_t matrixWidth = self->_matrixHeight;
      double matrixHeight = (double)matrixWidth;
      int64_t xIndex = self->_yIndex;
      goto LABEL_6;
    case 3:
      int64_t matrixWidth = self->_matrixWidth;
      double matrixHeight = (double)matrixWidth;
      int64_t xIndex = self->_xIndex;
LABEL_6:
      double v6 = (double)(matrixWidth + ~xIndex);
      break;
    case 4:
      double matrixHeight = (double)self->_matrixWidth;
      int64_t yIndex = self->_xIndex;
LABEL_8:
      double v6 = (double)yIndex;
      break;
    default:
      double matrixHeight = 0.0;
      double v6 = 0.0;
      break;
  }

  double v9 = a3 - v6 * (0.5 / matrixHeight);
  BOOL v10 = v9 > 0.0;
  if (v9 >= 0.5) {
    BOOL v10 = 0;
  }
  self->_animateCube = v10;
  double v11 = v9 + v9;
  double v12 = 1.0;
  if (v11 <= 1.0)
  {
    double v12 = v11;
    if (v11 < 0.0) {
      double v12 = 0.0;
    }
  }

  *(float32x2_t *)self->_rotation = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)self->_rps), v12));
  float v13 = v12 * self->_rps[2];
  self->_rotation[2] = v13;
  self->_cubeReadyForAnimation = v12 > 0.0;
}

- (void)draw:(id)a3 withArguments:(id)a4
{
  v6.i32[0] = LODWORD(self->_scale[0]);
  *(float *)&double v7 = MRMatrix_Scale(v22, v6, self->_scale[1], self->_scale[2]);
  objc_msgSend(a3, "composeModelViewMatrix:saveTo:", v22, v21, v7);
  uint64_t v8 = 0LL;
  char v9 = 1;
  do
  {
    char v10 = v9;
    int v11 = *((_DWORD *)&qword_1F6BB8 + v8);
    if (v11 == 1)
    {
      if (!self->_cubeReadyForAnimation) {
        goto LABEL_15;
      }
      BOOL v16 = -[MRImage usesBackgroundColorAsBorderColor](self->_destinationImage, "usesBackgroundColorAsBorderColor");
      -[MRImage setUsesBackgroundColorAsBorderColor:]( self->_destinationImage,  "setUsesBackgroundColorAsBorderColor:",  0LL);
      double localAspectRatio = self->_localAspectRatio;
      *(float *)&double localAspectRatio = localAspectRatio;
      -[MRImage setOnContext:onTextureUnit:withReferenceAspectRatio:state:]( self->_destinationImage,  "setOnContext:onTextureUnit:withReferenceAspectRatio:state:",  a3,  0LL,  &v20,  localAspectRatio);
      -[MRImage setUsesBackgroundColorAsBorderColor:]( self->_destinationImage,  "setUsesBackgroundColorAsBorderColor:",  v16);
      [a3 cull:1];
      [a3 setVertex3DPointer:&unk_2B08E0];
      [a3 setTextureCoordinatesPointer:self->_destinationTriangleTextures onTextureUnit:0];
      int flipDirection = self->_flipDirection;
      uint64_t v19 = 6LL;
      if (flipDirection != 1) {
        uint64_t v19 = 0LL;
      }
      if (flipDirection == 3) {
        uint64_t v19 = 12LL;
      }
      if (flipDirection == 4) {
        uint64_t v14 = 18LL;
      }
      else {
        uint64_t v14 = v19;
      }
      p_destinationImage = &self->_destinationImage;
    }

    else
    {
      if (v11) {
        goto LABEL_15;
      }
      BOOL v12 = -[MRImage usesBackgroundColorAsBorderColor](self->_sourceImage, "usesBackgroundColorAsBorderColor");
      -[MRImage setUsesBackgroundColorAsBorderColor:](self->_sourceImage, "setUsesBackgroundColorAsBorderColor:", 0LL);
      double v13 = self->_localAspectRatio;
      *(float *)&double v13 = v13;
      -[MRImage setOnContext:onTextureUnit:withReferenceAspectRatio:state:]( self->_sourceImage,  "setOnContext:onTextureUnit:withReferenceAspectRatio:state:",  a3,  0LL,  &v20,  v13);
      -[MRImage setUsesBackgroundColorAsBorderColor:](self->_sourceImage, "setUsesBackgroundColorAsBorderColor:", v12);
      [a3 cull:1];
      [a3 setVertex3DPointer:&unk_2B0730];
      [a3 setTextureCoordinatesPointer:self->_sourceTriangleTextures onTextureUnit:0];
      uint64_t v14 = 0LL;
      p_destinationImage = &self->_sourceImage;
    }

    [a3 drawTrianglesFromOffset:v14 count:6];
    [a3 unsetVertexPointer];
    [a3 unsetTextureCoordinatesPointerOnTextureUnit:0];
    -[MRImage unsetOnContext:onTextureUnit:state:]( *p_destinationImage,  "unsetOnContext:onTextureUnit:state:",  a3,  0LL,  &v20);
LABEL_15:
    char v9 = 0;
    uint64_t v8 = 1LL;
  }

  while ((v10 & 1) != 0);
  [a3 restoreModelViewMatrix:v21];
}

- (MRImage)sourceImage
{
  return self->_sourceImage;
}

- (MRImage)destinationImage
{
  return self->_destinationImage;
}

@end