@interface MRTransitionTileFlip
- (BOOL)supportsDirectionOverride;
- (MRTransitionTileFlip)initWithTransitionID:(id)a3;
- (double)pzrCancel:(id)a3;
- (double)pzrEnd:(id)a3;
- (double)pzrStart:(id)a3;
- (double)pzrUpdate:(id)a3;
- (void)buildTiles;
- (void)cleanup;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
- (void)unload;
@end

@implementation MRTransitionTileFlip

- (MRTransitionTileFlip)initWithTransitionID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRTransitionTileFlip;
  result = -[MRTransition initWithTransitionID:](&v4, "initWithTransitionID:", a3);
  if (result)
  {
    result->mSortedTiles = 0LL;
    result->mNumberOfTilesX = 8;
    result->mNumberOfTilesY = 6;
    result->mUseLighting = 1;
    result->mFlipOverlap = 0.8;
    result->super._direction = 2;
  }

  return result;
}

- (void)cleanup
{
  mSortedTiles = self->mSortedTiles;
  if (mSortedTiles)
  {

    self->mSortedTiles = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRTransitionTileFlip;
  -[MRTransition cleanup](&v4, "cleanup");
}

- (void)unload
{
  mSortedTiles = self->mSortedTiles;
  if (mSortedTiles)
  {

    self->mSortedTiles = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRTransitionTileFlip;
  -[MRTransition unload](&v4, "unload");
}

- (BOOL)supportsDirectionOverride
{
  return 1;
}

- (void)buildTiles
{
  self->mSortedTiles = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  switch(self->super._direction)
  {
    case 1:
      signed int v3 = self->mNumberOfTilesX - 1;
      if (v3 >= 0)
      {
        unsigned int mNumberOfTilesY = self->mNumberOfTilesY;
        do
        {
          if (mNumberOfTilesY)
          {
            for (unsigned int i = 0; i < mNumberOfTilesY; ++i)
            {
              -[NSMutableArray addObject:]( v25,  "addObject:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", i + v3 * mNumberOfTilesY));
              unsigned int mNumberOfTilesY = self->mNumberOfTilesY;
            }
          }

          BOOL v6 = __OFSUB__(v3--, 1);
        }

        while (v3 < 0 == v6);
      }

      break;
    case 2:
      unsigned int mNumberOfTilesX = self->mNumberOfTilesX;
      if (mNumberOfTilesX)
      {
        unsigned int v8 = 0;
        unsigned int v9 = self->mNumberOfTilesY;
        do
        {
          if (v9)
          {
            for (unsigned int j = 0; j < v9; ++j)
            {
              -[NSMutableArray addObject:]( v25,  "addObject:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", j + v8 * v9));
              unsigned int v9 = self->mNumberOfTilesY;
            }

            unsigned int mNumberOfTilesX = self->mNumberOfTilesX;
          }

          ++v8;
        }

        while (v8 < mNumberOfTilesX);
      }

      break;
    case 4:
      unsigned int v11 = self->mNumberOfTilesY;
      if (v11)
      {
        unsigned int v12 = 0;
        unsigned int v13 = self->mNumberOfTilesX;
        do
        {
          if (v13)
          {
            for (unsigned int k = 0; k < v13; ++k)
            {
              -[NSMutableArray addObject:]( v25,  "addObject:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", k + v12 * v13));
              unsigned int v13 = self->mNumberOfTilesX;
            }

            unsigned int v11 = self->mNumberOfTilesY;
          }

          ++v12;
        }

        while (v12 < v11);
      }

      break;
    case 8:
      signed int v15 = self->mNumberOfTilesY - 1;
      if (v15 >= 0)
      {
        unsigned int v16 = self->mNumberOfTilesX;
        do
        {
          if (v16)
          {
            for (unsigned int m = 0; m < v16; ++m)
            {
              -[NSMutableArray addObject:]( v25,  "addObject:",  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", m + v15 * v16));
              unsigned int v16 = self->mNumberOfTilesX;
            }
          }

          BOOL v6 = __OFSUB__(v15--, 1);
        }

        while (v15 < 0 == v6);
      }

      break;
    default:
      NSLog(@"direction %d unsupported by TileFlip", self->super._direction);
      break;
  }

  id v18 = +[MURandom randomGeneratorWithSeed:]( MURandom,  "randomGeneratorWithSeed:",  objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"RandomSeed"),  "unsignedIntegerValue"));
  signed int v19 = self->mNumberOfTilesY * self->mNumberOfTilesX;
  if (v19 >= 1)
  {
    v20 = v18;
    do
    {
      unint64_t v21 = (unint64_t)[v20 randomInt];
      id v22 = -[NSMutableArray count](v25, "count");
      else {
        unint64_t v23 = (unint64_t)v22;
      }
      unint64_t v24 = v21 % v23;
      -[NSMutableArray addObject:]( self->mSortedTiles,  "addObject:",  -[NSMutableArray objectAtIndex:](v25, "objectAtIndex:", v24));
      -[NSMutableArray removeObjectAtIndex:](v25, "removeObjectAtIndex:", v24);
      --v19;
    }

    while (v19);
  }
}

- (void)setAttributes:(id)a3
{
  if (!a3 || self->super.mAttributes != a3)
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___MRTransitionTileFlip;
    -[MRTransition setAttributes:](&v12, "setAttributes:");
    if (-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"numOfColumns"))
    {
      unsigned int v4 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"numOfColumns"),  "unsignedIntegerValue");
      if (v4 <= 1) {
        unsigned int v5 = 1;
      }
      else {
        unsigned int v5 = v4;
      }
    }

    else
    {
      unsigned int v5 = 8;
    }

    self->unsigned int mNumberOfTilesX = v5;
    if (-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"numOfRows"))
    {
      unsigned int v6 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"numOfRows"),  "unsignedIntegerValue");
      if (v6 <= 1) {
        unsigned int v7 = 1;
      }
      else {
        unsigned int v7 = v6;
      }
    }

    else
    {
      unsigned int v7 = 6;
    }

    self->unsigned int mNumberOfTilesY = v7;
    if (-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"direction")) {
      uint64_t v8 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"direction"),  "unsignedIntegerValue");
    }
    else {
      uint64_t v8 = &dword_0 + 1;
    }
    self->super._direction = *((_BYTE *)&unk_1F5F90 + v8);
    if (-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"overlap")) {
      objc_msgSend( -[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"overlap"),  "floatValue");
    }
    else {
      float v9 = 0.8;
    }
    self->mFlipOverlap = v9;
    if (-[NSDictionary objectForKey:](self->super.mFlattenedAttributes, "objectForKey:", @"lighting")) {
      unsigned __int8 v10 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"lighting"),  "BOOLValue");
    }
    else {
      unsigned __int8 v10 = 1;
    }
    self->mUseLighting = v10;
    mSortedTiles = self->mSortedTiles;
    if (mSortedTiles)
    {

      self->mSortedTiles = 0LL;
    }
  }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  double v100 = a3;
  if (self->mNumberOfTilesX)
  {
    uint64_t v96 = 148LL;
    if (self->mNumberOfTilesY)
    {
      id v7 = a4;
      [a4 localAspectRatio];
      float v9 = v8;
      unint64_t v99 = 136LL;
      if (!self->mSortedTiles) {
        -[MRTransitionTileFlip buildTiles](self, "buildTiles");
      }
      float v10 = 1.0 / v9;
      p_mSourceLayer = &self->super.mSourceLayer;
      if (-[MRLayer isOpaque](self->super.mSourceLayer, "isOpaque")
        && -[MRLayer isOpaque](self->super.mTargetLayer, "isOpaque"))
      {
        int v83 = 0;
      }

      else
      {
        [v7 blend:3];
        int v83 = 1;
      }

      v84 = v82;
      unint64_t v110 = 120LL;
      int direction = self->super._direction;
      _ZF = (direction & 0xF3) != 0 || direction == 0;
      unsigned int v14 = self->mNumberOfTilesX * *(_DWORD *)((char *)&self->super.super.isa + v96);
      int v15 = !_ZF;
      int v111 = v15;
      v109 = &v82[-((72LL * v14 + 15) & 0x7FFFFFFF0LL)];
      unsigned int v16 = 3 * *(_DWORD *)((char *)&self->super.super.isa + v96) * self->mNumberOfTilesX;
      v108 = &v82[-48 * *(_DWORD *)((char *)&self->super.super.isa + v96) * self->mNumberOfTilesX];
      v97 = &v82[-32 * v16];
      uint64_t v17 = 0LL;
      double v85 = v10 + v10;
      double v92 = -v10;
      float v98 = 3.1416;
      int v18 = 1;
      id v89 = v7;
      id v88 = a5;
      float v87 = v9;
      v86 = &self->super.mSourceLayer;
      while (1)
      {
        int v19 = v18;
        if ((v18 & 1) != 0) {
          uint64_t v20 = 1LL;
        }
        else {
          uint64_t v20 = 2LL;
        }
        [v7 cull:v20];
        p_mTargetLayer = (id *)p_mSourceLayer;
        if ((v19 & 1) != 0) {
          p_mTargetLayer = (id *)&self->super.mTargetLayer;
        }
        id v22 = *p_mTargetLayer;
        objc_msgSend(objc_msgSend(*p_mTargetLayer, "clock"), "externalTime");
        id v23 = objc_msgSend(v22, "retainedByUserRenderedImageAtTime:inContext:withArguments:", v7, a5);
        if (!v23) {
          goto LABEL_67;
        }
        unint64_t v24 = v23;
        [v24 releaseByUser];
LABEL_67:
        int v18 = 0;
        uint64_t v17 = 1LL;
        if ((v19 & 1) == 0)
        {
          [v7 cull:0];
          if ((v83 & 1) != 0) {
            [v7 blend:0];
          }
          return;
        }
      }

      [v7 setShader:@"ColoredTexture"];
      id v25 = [v24 usesBackgroundColorAsBorderColor];
      [v24 setUsesBackgroundColorAsBorderColor:0];
      *(float *)&double v26 = v9;
      [v24 setOnContext:v7 onTextureUnit:0 withReferenceAspectRatio:&v113 state:v26];
      [v24 setUsesBackgroundColorAsBorderColor:v25];
      LODWORD(mNumberOfTilesX) = self->mNumberOfTilesX;
      *(float *)&double v28 = 2.0 / (float)mNumberOfTilesX;
      unsigned int v29 = *(_DWORD *)((char *)&self->super.super.isa + v96);
      float v30 = v85 / (float)v29;
      int v31 = LOBYTE((&self->super.super.isa)[v110 / 8]);
      double v32 = v30;
      int v91 = v19;
      v90 = v24;
      if (v111)
      {
        double v33 = -0.5;
        if (v31 == 4) {
          double v33 = 0.5;
        }
        float v34 = v33 * v32;
        float v106 = v34;
        float v107 = v34;
        if (!v29) {
          goto LABEL_62;
        }
      }

      else
      {
        double v35 = -0.5;
        if (v31 == 2) {
          double v35 = 0.5;
        }
        float v36 = v35 * *(float *)&v28;
        float v106 = v36;
        float v107 = -v36;
        if (!v29) {
          goto LABEL_62;
        }
      }

      uint64_t v37 = 0LL;
      uint64_t v38 = 0LL;
      uint64_t v39 = 0LL;
      unint64_t v40 = 0LL;
      float v41 = 1.0 / (self->mFlipOverlap + (double)(v29 * mNumberOfTilesX) * (1.0 - self->mFlipOverlap));
      if (v111) {
        uint64_t v42 = v17 ^ 1;
      }
      else {
        uint64_t v42 = 0LL;
      }
      uint64_t v94 = v42;
      if (v111) {
        uint64_t v43 = v17;
      }
      else {
        uint64_t v43 = 1LL;
      }
      uint64_t v93 = v43;
      float v105 = v41;
      double v103 = *(float *)&v28;
      double v104 = v41;
      *(float *)&double v28 = *(float *)&v28 * 0.5;
      float v44 = v30 * 0.5;
      if (v111) {
        uint64_t v45 = 0LL;
      }
      else {
        uint64_t v45 = v17 ^ 1;
      }
      if (v111) {
        uint64_t v17 = 1LL;
      }
      double v95 = v32;
      float v101 = v44;
      float v102 = *(float *)&v28;
      do
      {
        if ((_DWORD)mNumberOfTilesX)
        {
          unint64_t v46 = 0LL;
          float v47 = v92 + ((double)v40 + 0.5) * v32;
          float v112 = v47;
          float v48 = ((double)(v40 + v94) + (double)(v40 + v94)) / (double)v29 + -1.0;
          float v49 = ((double)(v40 + v93) + (double)(v40 + v93)) / (double)v29 + -1.0;
          unint64_t mNumberOfTilesX = mNumberOfTilesX;
          do
          {
            if (v111) {
              unint64_t v50 = v46 + mNumberOfTilesX * v40;
            }
            else {
              unint64_t v50 = v40 + v46 * *(unsigned int *)((char *)&self->super.super.isa + v96);
            }
            float v52 = v101;
            float v51 = v102;
            signed int v53 = objc_msgSend( -[objc_class objectAtIndex:]((&self->super.super.isa)[v99 / 8], "objectAtIndex:", v50),  "intValue");
            double v54 = (1.0 - self->mFlipOverlap) * (float)(v105 * (float)(unint64_t)v53);
            float v55 = (v100 - v54) / (v54 + v104 - v54);
            if (v55 < 0.0) {
              float v55 = 0.0;
            }
            if (v55 > 1.0) {
              float v55 = 1.0;
            }
            if (self->mUseLighting)
            {
              uint64_t v56 = 0LL;
              float v57 = fabs(v55 + -0.5) + 0.5;
              __asm { FMOV            V1.4S, #1.0 }

              *(float *)_Q1.i32 = v57;
              int32x4_t v62 = vzip1q_s32(_Q1, _Q1);
              *(float *)&v62.i32[2] = v57;
              v63 = &v97[4 * v39];
              v39 += 24LL;
              do
              {
                *(int32x4_t *)&v63[v56] = v62;
                v56 += 16LL;
              }

              while ((_DWORD)v56 != 96);
            }

            float v64 = v55 * v98;
            float v65 = v51;
            float v66 = v52;
            switch(LOBYTE((&self->super.super.isa)[v110 / 8]))
            {
              case 1:
              case 2:
                float v65 = v51 * cosf(v64);
                float v66 = v52;
                break;
              case 4:
              case 8:
                float v66 = v52 * cosf(v64);
                float v65 = v51;
                break;
              default:
                break;
            }

            float v67 = ((double)v46 + 0.5) * v103 + -1.0;
            float v68 = v67 - v65;
            float v69 = v65 + v67;
            float v70 = v66 + v112;
            float v71 = v112 - v66;
            *(float *)&double v28 = sinf(v64);
            float v72 = v106 * *(float *)&v28;
            LODWORD(v73) = self->mNumberOfTilesX;
            double v74 = (double)v73;
            float v75 = ((double)(v46 + v45) + (double)(v46 + v45)) / v74 + -1.0;
            v76 = v109;
            v77 = (float *)&v108[4 * v38];
            float *v77 = v75;
            v77[1] = v48;
            v78 = (float *)&v76[4 * v37];
            float *v78 = v68;
            v78[1] = v71;
            v77[2] = v75;
            v77[3] = v49;
            v78[2] = v72;
            v78[3] = v68;
            float v79 = v107;
            float v80 = -(float)(v107 * *(float *)&v28);
            v78[4] = v70;
            v78[5] = v80;
            *(float *)&double v74 = ((double)(v46 + v17) + (double)(v46 + v17)) / v74 + -1.0;
            v77[4] = *(float *)&v74;
            v77[5] = v49;
            v78[6] = v69;
            v78[7] = v70;
            v77[6] = *(float *)&v74;
            v77[7] = v49;
            v78[8] = -v72;
            v78[9] = v69;
            *(float *)&double v28 = v79 * *(float *)&v28;
            v78[10] = v70;
            v78[11] = -v72;
            v77[8] = *(float *)&v74;
            v77[9] = v48;
            v78[12] = v69;
            v78[13] = v71;
            v38 += 12LL;
            v77[10] = v75;
            v77[11] = v48;
            v78[14] = *(float *)&v28;
            v78[15] = v68;
            v37 += 18LL;
            v78[16] = v71;
            v78[17] = v72;
            ++v46;
            unint64_t mNumberOfTilesX = self->mNumberOfTilesX;
          }

          while (v46 < mNumberOfTilesX);
          unsigned int v29 = *(_DWORD *)((char *)&self->super.super.isa + v96);
          double v32 = v95;
        }

        ++v40;
      }

      while (v40 < v29);
LABEL_62:
      id v7 = v89;
      objc_msgSend(v89, "setTextureCoordinatesPointer:onTextureUnit:", v108, 0, v28);
      if (self->mUseLighting) {
        [v7 setColorsPointer:v97];
      }
      [v7 setVertex3DPointer:v109];
      [v7 drawTrianglesFromOffset:0 count:6 * self->mNumberOfTilesX * *(_DWORD *)((char *)&self->super.super.isa + v96)];
      [v7 unsetVertexPointer];
      float v9 = v87;
      p_mSourceLayer = v86;
      LOBYTE(v19) = v91;
      v81 = v90;
      if (self->mUseLighting) {
        [v7 unsetColorsPointer];
      }
      [v7 unsetTextureCoordinatesPointerOnTextureUnit:0];
      [v81 unsetOnContext:v7 onTextureUnit:0 state:&v113];
      [v81 releaseByUser];
      [v7 unsetShader];
      a5 = v88;
      goto LABEL_67;
    }
  }

- (double)pzrStart:(id)a3
{
  double v3 = *((double *)a3 + 2);
  self->_x = v3;
  self->_x0 = v3;
  double v4 = *((double *)a3 + 3);
  self->_y = v4;
  self->_y0 = v4;
  return 0.0;
}

- (double)pzrUpdate:(id)a3
{
  self->_x = *((double *)a3 + 2);
  self->_y = *((double *)a3 + 3);
  return 0.0;
}

- (double)pzrEnd:(id)a3
{
  return 0.0;
}

- (double)pzrCancel:(id)a3
{
  return 0.0;
}

@end