@interface MRTransitionRevolutionsFlip
- (MRTransitionRevolutionsFlip)initWithTransitionID:(id)a3;
- (void)cleanup;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
- (void)setFlipDirection:(int)a3;
- (void)setupCubesWithLocalAspectRatio:(float)a3;
- (void)unload;
@end

@implementation MRTransitionRevolutionsFlip

- (MRTransitionRevolutionsFlip)initWithTransitionID:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MRTransitionRevolutionsFlip;
  v3 = -[MRTransition initWithTransitionID:](&v7, "initWithTransitionID:", a3);
  v5 = v3;
  if (v3)
  {
    v3->_numberOfTilesX = 8;
    v3->_numberOfTilesY = 6;
    v3->_viewBaseWidth = 8.0;
    v3->_viewBaseHeight = 6.0;
    v3->super._direction = 2;
    v3->_cubes = 0LL;
    v3->_flipDirection = 0;
    objc_opt_class(&OBJC_CLASS___MRTransitionSimple3D, v4);
  }

  return v5;
}

- (void)cleanup
{
  self->_cubes = 0LL;
  self->_cubeRows = 0LL;

  self->_cubeColumns = 0LL;
  sourceImage = self->_sourceImage;
  if (sourceImage)
  {
    -[MRImage releaseByUser](sourceImage, "releaseByUser");
    self->_sourceImage = 0LL;
  }

  destinationImage = self->_destinationImage;
  if (destinationImage)
  {
    -[MRImage releaseByUser](destinationImage, "releaseByUser");
    self->_destinationImage = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRTransitionRevolutionsFlip;
  -[MRTransition cleanup](&v5, "cleanup");
}

- (void)unload
{
  self->_cubes = 0LL;
  self->_cubeRows = 0LL;

  self->_cubeColumns = 0LL;
  sourceImage = self->_sourceImage;
  if (sourceImage)
  {
    -[MRImage releaseByUser](sourceImage, "releaseByUser");
    self->_sourceImage = 0LL;
  }

  destinationImage = self->_destinationImage;
  if (destinationImage)
  {
    -[MRImage releaseByUser](destinationImage, "releaseByUser");
    self->_destinationImage = 0LL;
  }

  self->_flipDirection = 0;
  self->_numberOfTilesX = 8;
  self->_numberOfTilesY = 6;
  self->_viewBaseWidth = 8.0;
  self->_viewBaseHeight = 6.0;
  self->super._direction = 2;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRTransitionRevolutionsFlip;
  -[MRTransition unload](&v5, "unload");
}

- (void)setFlipDirection:(int)a3
{
  if (self->_flipDirection != a3)
  {
    self->_flipDirection = a3;

    self->_cubeRows = 0LL;
    self->_cubeColumns = 0LL;
    unsigned int v4 = self->_flipDirection - 3;
    BOOL v5 = v4 >= 2;
    if (v4 >= 2) {
      v6 = &OBJC_IVAR___MRTransitionRevolutionsFlip__numberOfTilesY;
    }
    else {
      v6 = &OBJC_IVAR___MRTransitionRevolutionsFlip__numberOfTilesX;
    }
    if (v5) {
      uint64_t v7 = 20LL;
    }
    else {
      uint64_t v7 = 19LL;
    }
    uint64_t v8 = *v6;
    (&self->super.super.isa)[v7] = (Class) +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  *(unsigned int *)((char *)&self->super.super.isa + v8));
    -[objc_class addObject:]( (&self->super.super.isa)[v7],  "addObject:",  +[NSMutableIndexSet indexSetWithIndexesInRange:]( &OBJC_CLASS___NSMutableIndexSet,  "indexSetWithIndexesInRange:",  0LL,  *(unsigned int *)((char *)&self->super.super.isa + v8)));
  }

- (void)setupCubesWithLocalAspectRatio:(float)a3
{
  self->_cubes = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  int64_t numberOfTilesX = self->_numberOfTilesX;
  double v6 = (double)numberOfTilesX;
  uint64_t numberOfTilesY = self->_numberOfTilesY;
  float v8 = 1.0 / (double)numberOfTilesY;
  int v9 = 0;
  int v10 = 0;
  int v11 = -1028390912;
  switch(self->_flipDirection)
  {
    case 1:
      int v12 = -1028390912;
      goto LABEL_4;
    case 2:
      int v12 = 1119092736;
LABEL_4:
      int v10 = v12;
      goto LABEL_5;
    case 3:
      goto LABEL_7;
    case 4:
      int v11 = 1119092736;
LABEL_7:
      int v14 = 0;
      double viewBaseWidth = self->_viewBaseWidth;
      double viewBaseHeight = self->_viewBaseHeight;
      self->_int64_t horizontalCubeCount = numberOfTilesX;
      uint64_t numberOfTilesY = 1LL;
      self->_verticalCubeCount = 1LL;
      int64_t horizontalCubeCount = self->_horizontalCubeCount;
      double v13 = viewBaseHeight + viewBaseHeight;
      double v38 = viewBaseWidth / v6 + viewBaseWidth / v6;
      double v37 = -(v38 * (double)(horizontalCubeCount - 1)) * 0.5;
      double v15 = 0.0 / ((viewBaseHeight + viewBaseHeight) * 0.5 * v8);
      int v9 = v11;
      break;
    default:
LABEL_5:
      double v38 = self->_viewBaseWidth + self->_viewBaseWidth;
      double v13 = self->_viewBaseHeight / (double)numberOfTilesY
          + self->_viewBaseHeight / (double)numberOfTilesY;
      int v14 = 1;
      self->_int64_t horizontalCubeCount = 1LL;
      self->_verticalCubeCount = numberOfTilesY;
      double v15 = (double)(numberOfTilesY - 1) * v13 * -0.5;
      int64_t horizontalCubeCount = self->_horizontalCubeCount;
      double v37 = 0.0;
      break;
  }

  if (horizontalCubeCount >= 1)
  {
    uint64_t v19 = 0LL;
    float v20 = 1.0 / v6;
    float v21 = v38 * 0.5 * v20;
    double v22 = a3;
    double v23 = v13 * 0.5 * v8 / a3;
    float v24 = v23;
    if (v14) {
      float v25 = v23;
    }
    else {
      float v25 = v38 * 0.5 * v20;
    }
    double v39 = v13;
    do
    {
      if (numberOfTilesY >= 1)
      {
        uint64_t v26 = 0LL;
        float v27 = v37 + (double)v19 * v38;
        float v40 = v27;
        int64_t v41 = v19;
        do
        {
          float v28 = v24;
          double v29 = v22;
          float v30 = v21;
          int v31 = v10;
          int v32 = v9;
          double v33 = v15 + (double)v26 * v13;
          double v34 = v15;
          v35 = objc_alloc_init(&OBJC_CLASS___Cube);
          v35->_position[0] = v40;
          float v36 = v33;
          int v9 = v32;
          int v10 = v31;
          float v21 = v30;
          double v22 = v29;
          float v24 = v28;
          v35->_position[1] = v36;
          v35->_scale[0] = v21;
          v35->_scale[1] = v28;
          v35->_scale[2] = v25;
          *(_OWORD *)&v35->_position[2] = 0u;
          LODWORD(v35->_rps[0]) = v10;
          LODWORD(v35->_rps[1]) = v9;
          v35->_rps[2] = 0.0;
          v35->_xIndex = v41;
          v35->_yIndex = v26;
          v35->_matrixWidth = self->_horizontalCubeCount;
          v35->_matrixHeight = self->_verticalCubeCount;
          -[Cube setupTextureInformation:](v35, "setupTextureInformation:", self->_flipDirection);
          v35->_localAspectRatio = v22;
          -[Cube setSourceImage:](v35, "setSourceImage:", self->_sourceImage);
          -[Cube setDestinationImage:](v35, "setDestinationImage:", self->_destinationImage);
          -[NSMutableArray addObject:](self->_cubes, "addObject:", v35);

          double v15 = v34;
          double v13 = v39;
          ++v26;
          uint64_t numberOfTilesY = self->_verticalCubeCount;
        }

        while (v26 < numberOfTilesY);
        int64_t horizontalCubeCount = self->_horizontalCubeCount;
        uint64_t v19 = v41;
      }

      ++v19;
    }

    while (v19 < horizontalCubeCount);
  }

- (void)setAttributes:(id)a3
{
  if (!a3 || self->super.mAttributes != a3)
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___MRTransitionRevolutionsFlip;
    -[MRTransition setAttributes:](&v9, "setAttributes:");
    if (-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"direction")) {
      uint64_t v4 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"direction"),  "unsignedIntegerValue");
    }
    else {
      uint64_t v4 = &dword_0 + 1;
    }
    self->super._direction = *((_BYTE *)&unk_1F5F90 + v4);
    if (-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"numOfColumns"))
    {
      unsigned int v5 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"numOfColumns"),  "unsignedIntegerValue");
      if (v5 <= 1) {
        unsigned int v6 = 1;
      }
      else {
        unsigned int v6 = v5;
      }
    }

    else
    {
      unsigned int v6 = 8;
    }

    self->_int64_t numberOfTilesX = v6;
    if (-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"numOfRows"))
    {
      unsigned int v7 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"numOfRows"),  "unsignedIntegerValue");
      if (v7 <= 1) {
        unsigned int v8 = 1;
      }
      else {
        unsigned int v8 = v7;
      }
    }

    else
    {
      unsigned int v8 = 6;
    }

    self->_uint64_t numberOfTilesY = v8;
  }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (!self->_numberOfTilesX || !self->_numberOfTilesY) {
    return;
  }
  [a4 depthTest:1];
  [a4 localAspectRatio];
  float v10 = v9;
  if (v9 <= 0.0)
  {
    unsigned int numberOfTilesY = self->_numberOfTilesY;
  }

  else
  {
    unsigned int numberOfTilesY = self->_numberOfTilesX;
    unsigned int v12 = self->_numberOfTilesY;
    if (v9 >= 1.0)
    {
      if (numberOfTilesY >= v12) {
        goto LABEL_6;
      }
    }

    else if (numberOfTilesY <= v12)
    {
LABEL_6:
      unsigned int numberOfTilesY = self->_numberOfTilesY;
      goto LABEL_10;
    }

    self->_int64_t numberOfTilesX = v12;
    self->_unsigned int numberOfTilesY = numberOfTilesY;
    double viewBaseWidth = self->_viewBaseWidth;
    self->_double viewBaseWidth = self->_viewBaseHeight;
    self->_double viewBaseHeight = viewBaseWidth;
  }

@end