@interface MRTiledSprite
- (BOOL)getVerticesCoordinates:(CGPoint *)(a3 withMatrix:;
- (BOOL)hitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (BOOL)hitIsActive;
- (BOOL)needsInSpriteCoordinates;
- (BOOL)preservesImageAspectRatio;
- (CGPoint)position;
- (CGRect)innerRect;
- (CGRect)outerRect;
- (CGSize)halfSize;
- (MRTiledSprite)initWithPosition:(CGPoint)a3 size:(CGSize)a4 zRotation:(float)a5 innerRect:(CGRect)a6 context:(id)a7;
- (double)initWithPosition:(double)a3 size:(double)a4 zRotation:(double)a5 innerRect:(float)a6 outerRect:(uint64_t)a7 context:(void *)a8;
- (float)rotation;
- (void)dealloc;
- (void)getOpaquePosition:(CGPoint *)a3 andHalfSize:(CGSize *)a4;
- (void)renderDumbImage:(id)a3 inContext:(id)a4;
- (void)renderImage:(id)a3 inContext:(id)a4;
- (void)renderImageInner:(id)a3 inContext:(id)a4;
- (void)renderImageMiddle:(id)a3 inContext:(id)a4;
- (void)renderImageOuter:(id)a3 inContext:(id)a4;
- (void)seal;
- (void)setHitIsActive:(BOOL)a3;
- (void)setNeedsInSpriteCoordinates:(BOOL)a3;
- (void)setNeedsTextureCoordinates:(BOOL)a3 onTextureUnit:(unint64_t)a4;
- (void)setPreservesImageAspectRatio:(BOOL)a3;
- (void)setSpriteCoordinatesFactor:(CGSize)a3 andOffset:(CGPoint)a4;
- (void)setTextureCoordinatesFactor:(CGSize)a3 andOffset:(CGPoint)a4 onTextureUnit:(unint64_t)a5;
- (void)subtractOpaqueSpriteWithPosition:(CGPoint)a3 halfSize:(CGSize)a4 andRotation:(float)a5;
- (void)subtractSprite:(id)a3;
- (void)subtractSpriteAtPosition:(CGPoint)a3 withSize:(CGSize)a4 zRotation:(float)a5 andOpaqueRect:(CGRect)a6 inContext:(id)a7;
- (void)subtractTriangle:(double)a3[6] fromTriangle:(double)a4[6] addTrianglesTo:(id)a5;
- (void)updateInSpriteCoordinates;
@end

@implementation MRTiledSprite

- (MRTiledSprite)initWithPosition:(CGPoint)a3 size:(CGSize)a4 zRotation:(float)a5 innerRect:(CGRect)a6 context:(id)a7
{
  return -[MRTiledSprite initWithPosition:size:zRotation:innerRect:outerRect:context:]( self,  "initWithPosition:size:zRotation:innerRect:outerRect:context:",  a7,  a3.x,  a3.y,  a4.width,  a4.height,  *(void *)&a6.origin.x,  *(void *)&a6.origin.y,  *(void *)&a6.size.width,  *(void *)&a6.size.height,  *(void *)&a6.origin.x,  *(void *)&a6.origin.y,  *(void *)&a6.size.width,  *(void *)&a6.size.height);
}

- (double)initWithPosition:(double)a3 size:(double)a4 zRotation:(double)a5 innerRect:(float)a6 outerRect:(uint64_t)a7 context:(void *)a8
{
  v27 = (double *)[a1 init];
  v28 = v27;
  if (v27)
  {
    v27[1] = a2;
    [a8 localAspectRatio];
    v28[2] = a3 / v29;
    v28[3] = a4 * 0.5;
    [a8 localAspectRatio];
    uint64_t v30 = 0LL;
    v28[4] = a5 * 0.5 / v31;
    *((float *)v28 + 10) = a6;
    *((void *)v28 + 6) = a14;
    *((void *)v28 + 7) = a15;
    *((void *)v28 + 8) = a16;
    *((void *)v28 + 9) = a17;
    *((void *)v28 + 10) = a18;
    *((void *)v28 + 11) = a19;
    *((void *)v28 + 12) = a20;
    *((void *)v28 + 13) = a21;
    v28[39] = 1.0;
    v28[40] = 1.0;
    do
    {
      *(_OWORD *)&v28[v30 + 43] = *(_OWORD *)(v28 + 39);
      v30 += 2LL;
    }

    while (v30 != 8);
    *((_BYTE *)v28 + 472) = 1;
    *((_WORD *)v28 + 56) = 1;
    *((_BYTE *)v28 + 478) = 1;
    v32 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    *((void *)v28 + 15) = v32;
    __float2 v33 = __sincosf_stret(*((float *)v28 + 10));
    double cosval = v33.__cosval;
    double sinval = v33.__sinval;
    double v37 = v28[3];
    double v36 = v28[4];
    double v38 = v37 * v33.__cosval;
    double v39 = v37 * v33.__sinval;
    double v40 = -(v36 * v33.__sinval);
    double v41 = v36 * v33.__cosval;
    double v42 = v28[6];
    if (v42 == 0.0)
    {
      double v43 = v28[7];
      double v44 = 1.0;
      if (v43 == 0.0 && v28[8] == 1.0)
      {
        if (v28[9] == 1.0)
        {
          double v104 = v28[1];
          double v105 = v28[2];
          double v147 = v104 - v38 - v40;
          double v148 = v105 - v39 - v41;
          double v106 = v38 + v104;
          double v107 = v39 + v105;
          double v149 = v106 - v40;
          double v150 = v107 - v41;
          double v151 = v106 - v36 * v33.__sinval;
          double v152 = v41 + v107;
          -[NSMutableArray addObject:]( v32,  "addObject:",  +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v147, 48LL));
          double v108 = v28[1];
          double v109 = v28[2];
          *(double *)&__int128 v123 = v40 + v38 + v108;
          *((double *)&v123 + 1) = v41 + v39 + v109;
          double v110 = v108 - v38;
          double v111 = v109 - v39;
          *(double *)&__int128 v124 = v40 + v110;
          *((double *)&v124 + 1) = v41 + v111;
          *(double *)&__int128 v125 = v110 - v40;
          *((double *)&v125 + 1) = v111 - v41;
          objc_msgSend( *((id *)v28 + 15),  "addObject:",  +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v123, 48));
          return v28;
        }
      }

      else
      {
        double v44 = v28[8];
      }
    }

    else
    {
      double v43 = v28[7];
      double v44 = v28[8];
    }

    double v46 = v37 * (v42 * 2.0 + -1.0);
    double v47 = v37 * ((v42 + v44) * 2.0 + -1.0);
    double v49 = v28[9];
    double v48 = v28[10];
    double v50 = v36 * (v43 * 2.0 + -1.0);
    double v51 = v36 * ((v43 + v49) * 2.0 + -1.0);
    if (v42 == v48)
    {
      double v52 = v28[11];
      double v53 = v28[12];
      if (v43 == v52 && v44 == v53 && v49 == v28[13])
      {
        double v54 = v28[1];
        double v55 = v28[2];
        double v56 = v54 - v38;
        double v57 = v55 - v39;
        double v147 = v54 - v38 - v40;
        double v148 = v55 - v39 - v41;
        double v58 = v54 + v46 * cosval;
        double v59 = v58 - v50 * sinval;
        double v60 = v55 + v46 * sinval;
        double v61 = v60 + v50 * cosval;
        double v149 = v59;
        double v150 = v61;
        double v62 = v38 + v54;
        double v151 = v38 + v54 - v40;
        double v152 = v39 + v55 - v41;
        double v63 = v54 + v47 * cosval;
        double v64 = v55 + v47 * sinval;
        *(double *)&__int128 v153 = v63 - v50 * sinval;
        *((double *)&v153 + 1) = v64 + v50 * cosval;
        double v154 = v40 + v62;
        double v155 = v41 + v39 + v55;
        double v65 = v63 - v51 * sinval;
        double v66 = v64 + v51 * cosval;
        double v156 = v65;
        double v157 = v66;
        double v158 = v40 + v56;
        double v159 = v41 + v57;
        double v67 = v58 - v51 * sinval;
        double v68 = v60 + v51 * cosval;
        double v160 = v67;
        double v161 = v68;
        double v162 = v147;
        double v163 = v148;
        double v164 = v59;
        double v165 = v61;
        *(double *)&__int128 v123 = v59;
        *((double *)&v123 + 1) = v61;
        __int128 v124 = v153;
        *(double *)&__int128 v125 = v65;
        *((double *)&v125 + 1) = v66;
        -[NSMutableArray addObject:]( v32,  "addObject:",  +[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &v123, 48LL));
        double v142 = v65;
        double v143 = v66;
        *(double *)&__int128 v144 = v67;
        *((double *)&v144 + 1) = v68;
        double v145 = v59;
        double v146 = v61;
        objc_msgSend( *((id *)v28 + 15),  "addObject:",  +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v142, 48));
        uint64_t v69 = 0LL;
        *((void *)v28 + 31) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        do
        {
          __int128 v70 = *(_OWORD *)((char *)&v149 + v69);
          __int128 v139 = *(_OWORD *)((char *)&v147 + v69);
          __int128 v140 = v70;
          __int128 v141 = *(_OWORD *)((char *)&v151 + v69);
          objc_msgSend( *((id *)v28 + 31),  "addObject:",  +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v139, 48));
          v69 += 16LL;
        }

        while (v69 != 128);
        return v28;
      }
    }

    else
    {
      double v52 = v28[11];
      double v53 = v28[12];
    }

    double v118 = v37 * cosval;
    double v119 = v37 * sinval;
    double v120 = -(v36 * sinval);
    double v121 = v36 * cosval;
    double v71 = v37 * (v48 * 2.0 + -1.0);
    double v72 = v37 * ((v48 + v53) * 2.0 + -1.0);
    double v73 = v36 * (v52 * 2.0 + -1.0);
    double v74 = v36 * ((v52 + v28[13]) * 2.0 + -1.0);
    double v75 = v28[1];
    double v76 = v28[2];
    double v77 = v75 + v71 * cosval;
    double v78 = v77 - v73 * sinval;
    double v79 = v76 + v71 * sinval;
    double v80 = v79 + v73 * cosval;
    double v147 = v78;
    double v148 = v80;
    double v81 = v75 + v46 * cosval;
    double v82 = v81 - v50 * sinval;
    double v83 = v76 + v46 * sinval;
    double v84 = v83 + v50 * cosval;
    double v149 = v82;
    double v150 = v84;
    double v85 = v75 + v72 * cosval;
    double v86 = v76 + v72 * sinval;
    double v117 = v85 - v73 * sinval;
    double v151 = v117;
    double v152 = v86 + v73 * cosval;
    double v87 = v75 + v47 * cosval;
    double v88 = v76 + v47 * sinval;
    *(double *)&__int128 v153 = v87 - v50 * sinval;
    *((double *)&v153 + 1) = v88 + v50 * cosval;
    double v154 = v85 - v74 * sinval;
    double v155 = v86 + v74 * cosval;
    double v89 = v87 - v51 * sinval;
    double v90 = v88 + v51 * cosval;
    double v156 = v89;
    double v157 = v90;
    double v158 = v77 - v74 * sinval;
    double v159 = v79 + v74 * cosval;
    double v91 = v81 - v51 * sinval;
    double v92 = v83 + v51 * cosval;
    double v160 = v91;
    double v161 = v92;
    double v162 = v78;
    double v163 = v80;
    double v164 = v82;
    double v165 = v84;
    double v142 = v82;
    double v143 = v84;
    __int128 v144 = v153;
    double v145 = v89;
    double v146 = v90;
    -[NSMutableArray addObject:]( v32,  "addObject:",  +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  &v142,  48LL,  *(void *)&v159,  *(void *)&v158,  *(void *)&v155,  *(void *)&v154,  *(void *)&v152));
    *(double *)&__int128 v139 = v89;
    *((double *)&v139 + 1) = v90;
    *(double *)&__int128 v140 = v91;
    *((double *)&v140 + 1) = v92;
    *(double *)&__int128 v141 = v82;
    *((double *)&v141 + 1) = v84;
    objc_msgSend( *((id *)v28 + 15),  "addObject:",  +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v139, 48));
    uint64_t v93 = 0LL;
    *((void *)v28 + 23) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    do
    {
      __int128 v94 = *(_OWORD *)((char *)&v149 + v93);
      __int128 v123 = *(_OWORD *)((char *)&v147 + v93);
      __int128 v124 = v94;
      __int128 v125 = *(_OWORD *)((char *)&v151 + v93);
      objc_msgSend( *((id *)v28 + 23),  "addObject:",  +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v123, 48));
      v93 += 16LL;
    }

    while (v93 != 128);
    double v95 = v28[1];
    double v96 = v28[2];
    double v97 = v95 - v118;
    double v98 = v96 - v119;
    *(double *)&__int128 v123 = v95 - v118 - v120;
    *((double *)&v123 + 1) = v96 - v119 - v121;
    *(double *)&__int128 v124 = v78;
    *((double *)&v124 + 1) = v148;
    double v99 = v118 + v95;
    double v100 = v119 + v96;
    *(double *)&__int128 v125 = v99 - v120;
    *((double *)&v125 + 1) = v100 - v121;
    double v126 = v117;
    uint64_t v127 = v116;
    double v128 = v120 + v99;
    double v129 = v121 + v100;
    uint64_t v130 = v115;
    uint64_t v131 = v114;
    double v132 = v120 + v97;
    double v133 = v121 + v98;
    uint64_t v134 = v113;
    uint64_t v135 = v112;
    __int128 v136 = v123;
    double v137 = v78;
    double v138 = v80;
    uint64_t v101 = 0LL;
    *((void *)v28 + 31) = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    do
    {
      __int128 v102 = *(__int128 *)((char *)&v123 + v101 + 16);
      v122[0] = *(__int128 *)((char *)&v123 + v101);
      v122[1] = v102;
      v122[2] = *(__int128 *)((char *)&v125 + v101);
      objc_msgSend( *((id *)v28 + 31),  "addObject:",  +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v122, 48));
      v101 += 16LL;
    }

    while (v101 != 128);
  }

  return v28;
}

- (void)dealloc
{
  self->mTriangles = 0LL;
  self->mMiddleTriangles = 0LL;

  self->mOuterTriangles = 0LL;
  mVertices = self->mVertices;
  if (mVertices)
  {
    free(mVertices);
    self->mVertices = 0LL;
  }

  mMiddleVertices = self->mMiddleVertices;
  if (mMiddleVertices)
  {
    free(mMiddleVertices);
    self->mMiddleVertices = 0LL;
  }

  mOuterVertices = self->mOuterVertices;
  if (mOuterVertices)
  {
    free(mOuterVertices);
    self->mOuterVertices = 0LL;
  }

  mBasicTextureCoordinates = self->mBasicTextureCoordinates;
  if (mBasicTextureCoordinates)
  {
    free(mBasicTextureCoordinates);
    self->mBasicTextureCoordinates = 0LL;
  }

  mMiddleBasicTextureCoordinates = self->mMiddleBasicTextureCoordinates;
  if (mMiddleBasicTextureCoordinates)
  {
    free(mMiddleBasicTextureCoordinates);
    self->mMiddleBasicTextureCoordinates = 0LL;
  }

  mOuterBasicTextureCoordinates = self->mOuterBasicTextureCoordinates;
  if (mOuterBasicTextureCoordinates)
  {
    free(mOuterBasicTextureCoordinates);
    self->mOuterBasicTextureCoordinates = 0LL;
  }

  mInSpriteCoordinates = self->mInSpriteCoordinates;
  if (mInSpriteCoordinates)
  {
    free(mInSpriteCoordinates);
    self->mInSpriteCoordinates = 0LL;
  }

  mMiddleInSpriteCoordinates = self->mMiddleInSpriteCoordinates;
  if (mMiddleInSpriteCoordinates)
  {
    free(mMiddleInSpriteCoordinates);
    self->mMiddleInSpriteCoordinates = 0LL;
  }

  mOuterInSpriteCoordinates = self->mOuterInSpriteCoordinates;
  if (mOuterInSpriteCoordinates)
  {
    free(mOuterInSpriteCoordinates);
    self->mOuterInSpriteCoordinates = 0LL;
  }

  for (uint64_t i = 0LL; i != 4; ++i)
  {
    v13 = (char *)self + i * 8;
    v14 = self->mTextureCoordinates[i];
    if (v14)
    {
      free(v14);
      *((void *)v13 + 19) = 0LL;
    }

    v15 = (void *)*((void *)v13 + 27);
    if (v15)
    {
      free(v15);
      *((void *)v13 + 27) = 0LL;
    }

    v16 = self->mOuterTextureCoordinates[i];
    if (v16)
    {
      free(v16);
      self->mOuterTextureCoordinates[i] = 0LL;
    }
  }

  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MRTiledSprite;
  -[MRTiledSprite dealloc](&v17, "dealloc");
}

- (void)subtractTriangle:(double)a3[6] fromTriangle:(double)a4[6] addTrianglesTo:(id)a5
{
  double v8 = *a3;
  double v9 = a3[1];
  double v10 = a3[2] - *a3;
  double v11 = a3[3] - v9;
  double v12 = a3[4] - *a3;
  double v13 = a3[5] - v9;
  double v14 = v10 * v13 - v12 * v11;
  double v15 = fabs(v14);
  if (v15 < 0.00001)
  {
LABEL_130:
    objc_msgSend( a5,  "addObject:",  +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a4, 48));
    return;
  }

  uint64_t v16 = 0LL;
  char v17 = 0;
  int v18 = 0;
  int v19 = 0;
  unsigned int v20 = 0;
  LODWORD(v21) = 0;
  int v22 = 0;
  double v23 = *a4;
  double v24 = a4[1];
  double v182 = a4[3];
  double v184 = a4[2];
  double v25 = v184 - *a4;
  double v26 = v182 - v24;
  double v186 = a4[5];
  double v188 = a4[4];
  double v27 = v188 - *a4;
  double v28 = v186 - v24;
  double v29 = v25 * (v186 - v24) - v27 * (v182 - v24);
  double v30 = v15 * 0.00001;
  double v31 = fabs(v29) * 0.00001;
  double v32 = 0.0;
  LOBYTE(v33) = -1;
  double v34 = 0.0;
  unsigned int v35 = 1;
  do
  {
    uint64_t v36 = v21;
    double v37 = a4[2 * v16];
    uint64_t v38 = (2 * v16) | 1;
    double v39 = a4[v38];
    double v40 = v37 - v8;
    double v41 = v39 - v9;
    if (v37 - v8 == v10 && v41 == v11)
    {
      int v44 = 24;
      goto LABEL_17;
    }

    if (v40 == v12 && v41 == v13)
    {
      int v44 = 48;
      goto LABEL_17;
    }

    if (v40 == 0.0 && v41 == 0.0)
    {
      int v44 = 40;
LABEL_17:
      double v32 = v32 + v37;
      double v34 = v34 + v39;
      ++v20;
      ++v19;
      goto LABEL_18;
    }

    BOOL v61 = v14 > 0.0;
    double v62 = v40 * v13 - v41 * v12;
    double v63 = v41 * v10 - v40 * v11;
    double v64 = fabs(v62);
    BOOL v65 = v62 <= 0.0;
    double v67 = v63 + v62;
    unsigned int v48 = v67 - v14 >= 0.0;
    int v68 = v61 ^ v65;
    if (v64 >= v30) {
      int v69 = v68;
    }
    else {
      int v69 = 0;
    }
    double v70 = fabs(v63);
    if (v64 < v30) {
      int v71 = 1;
    }
    else {
      int v71 = v68;
    }
    BOOL v66 = v63 <= 0.0;
    int v72 = v61 ^ v66;
    if (v70 >= v30) {
      int v73 = v61 ^ v66;
    }
    else {
      int v73 = 0;
    }
    double v74 = vabdd_f64(v67, v14);
    if (v70 < v30) {
      int v75 = 1;
    }
    else {
      int v75 = v72;
    }
    int v76 = v61 ^ v48;
    if (v74 >= v30) {
      int v77 = v76;
    }
    else {
      int v77 = 0;
    }
    if (v74 < v30) {
      LOBYTE(v76) = 1;
    }
    int v78 = v69 & v73 & v77;
    BOOL v79 = v71 != 1 || v75 == 0;
    if (v79 || (v76 & 1) == 0)
    {
      int v44 = 0;
      if (v78) {
        goto LABEL_26;
      }
    }

    else
    {
      unsigned int v48 = v64 < v30;
      int v44 = (8 * (v70 < v30)) | (32 * v48) | (16 * (v74 < v30));
      double v32 = v32 + v37;
      double v34 = v34 + v39;
      ++v20;
      ++v19;
      if (v78) {
        goto LABEL_26;
      }
    }

- (void)subtractSprite:(id)a3
{
  LODWORD(v6) = v5;
  -[MRTiledSprite subtractOpaqueSpriteWithPosition:halfSize:andRotation:]( self,  "subtractOpaqueSpriteWithPosition:halfSize:andRotation:",  v8[0],  v8[1],  v7[0],  v7[1],  v6);
}

- (void)subtractSpriteAtPosition:(CGPoint)a3 withSize:(CGSize)a4 zRotation:(float)a5 andOpaqueRect:(CGRect)a6 inContext:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  double y = a3.y;
  double x = a3.x;
  [a7 localAspectRatio];
  double v13 = width * 0.5;
  double v14 = y / v12;
  [a7 localAspectRatio];
  double v16 = height * 0.5 / v15;
  double v17 = v13 * (a6.origin.x * 2.0 + -1.0);
  double v18 = v13 * ((a6.origin.x + a6.size.width) * 2.0 + -1.0);
  CGFloat v19 = (a6.origin.y * 2.0 + -1.0) * v16;
  CGFloat v20 = ((a6.origin.y + a6.size.height) * 2.0 + -1.0) * v16;
  double v21 = x + (v17 + v18) * 0.5;
  double v22 = (v18 - v17) * 0.5;
  *(float *)&double v18 = a5;
  -[MRTiledSprite subtractOpaqueSpriteWithPosition:halfSize:andRotation:]( self,  "subtractOpaqueSpriteWithPosition:halfSize:andRotation:",  v21,  v14 + (v20 + v19) * 0.5,  v22,  (v20 - v19) * 0.5,  v18);
}

- (void)subtractOpaqueSpriteWithPosition:(CGPoint)a3 halfSize:(CGSize)a4 andRotation:(float)a5
{
  if (!self->mIsSealed)
  {
    double height = a4.height;
    double width = a4.width;
    double y = a3.y;
    double x = a3.x;
    __float2 v10 = __sincosf_stret(a5);
    double v11 = width * v10.__cosval;
    double v12 = width * v10.__sinval;
    double v13 = -(height * v10.__sinval);
    double v14 = height * v10.__cosval;
    double v15 = x - v11;
    double v16 = y - v12;
    double v80 = x - v11 - v13;
    double v81 = y - v12 - v14;
    double v17 = x + v11;
    double v18 = y + v12;
    double v82 = v17 - v13;
    double v83 = v18 - v14;
    double v84 = v17 - height * v10.__sinval;
    double v85 = v14 + v18;
    *(double *)BOOL v79 = v80;
    *(double *)&v79[1] = v81;
    *(double *)&v79[2] = v15 - height * v10.__sinval;
    *(double *)&v79[3] = v14 + v16;
    *(double *)&v79[4] = v84;
    *(double *)&v79[5] = v14 + v18;
    CGFloat v19 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v72 = 0u;
    mTriangles = self->mTriangles;
    id v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mTriangles,  "countByEnumeratingWithState:objects:count:",  &v69,  v78,  16LL);
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v70;
      do
      {
        for (uint64_t i = 0LL; i != v22; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v70 != v23) {
            objc_enumerationMutation(mTriangles);
          }
          -[MRTiledSprite subtractTriangle:fromTriangle:addTrianglesTo:]( self,  "subtractTriangle:fromTriangle:addTrianglesTo:",  &v80,  [*(id *)(*((void *)&v69 + 1) + 8 * (void)i) bytes],  v19);
        }

        id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mTriangles,  "countByEnumeratingWithState:objects:count:",  &v69,  v78,  16LL);
      }

      while (v22);
    }

    -[NSMutableArray removeAllObjects](self->mTriangles, "removeAllObjects");
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v65 = 0u;
    __int128 v66 = 0u;
    id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v65,  v77,  16LL);
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v66;
      do
      {
        for (j = 0LL; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v66 != v27) {
            objc_enumerationMutation(v19);
          }
          -[MRTiledSprite subtractTriangle:fromTriangle:addTrianglesTo:]( self,  "subtractTriangle:fromTriangle:addTrianglesTo:",  v79,  [*(id *)(*((void *)&v65 + 1) + 8 * (void)j) bytes],  self->mTriangles);
        }

        id v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v65,  v77,  16LL);
      }

      while (v26);
    }

    if (self->mMiddleTriangles)
    {
      double v29 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      mMiddleTriangles = self->mMiddleTriangles;
      id v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mMiddleTriangles,  "countByEnumeratingWithState:objects:count:",  &v61,  v76,  16LL);
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v62;
        do
        {
          for (k = 0LL; k != v32; k = (char *)k + 1)
          {
            if (*(void *)v62 != v33) {
              objc_enumerationMutation(mMiddleTriangles);
            }
            -[MRTiledSprite subtractTriangle:fromTriangle:addTrianglesTo:]( self,  "subtractTriangle:fromTriangle:addTrianglesTo:",  &v80,  [*(id *)(*((void *)&v61 + 1) + 8 * (void)k) bytes],  v29);
          }

          id v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mMiddleTriangles,  "countByEnumeratingWithState:objects:count:",  &v61,  v76,  16LL);
        }

        while (v32);
      }

      -[NSMutableArray removeAllObjects](self->mMiddleTriangles, "removeAllObjects");
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      id v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v57,  v75,  16LL);
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v58;
        do
        {
          for (m = 0LL; m != v36; m = (char *)m + 1)
          {
            if (*(void *)v58 != v37) {
              objc_enumerationMutation(v29);
            }
            -[MRTiledSprite subtractTriangle:fromTriangle:addTrianglesTo:]( self,  "subtractTriangle:fromTriangle:addTrianglesTo:",  v79,  [*(id *)(*((void *)&v57 + 1) + 8 * (void)m) bytes],  self->mMiddleTriangles);
          }

          id v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v29,  "countByEnumeratingWithState:objects:count:",  &v57,  v75,  16LL);
        }

        while (v36);
      }
    }

    if (self->mOuterTriangles)
    {
      double v39 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      __int128 v53 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      __int128 v56 = 0u;
      mOuterTriangles = self->mOuterTriangles;
      id v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mOuterTriangles,  "countByEnumeratingWithState:objects:count:",  &v53,  v74,  16LL);
      if (v41)
      {
        id v42 = v41;
        uint64_t v43 = *(void *)v54;
        do
        {
          for (n = 0LL; n != v42; n = (char *)n + 1)
          {
            if (*(void *)v54 != v43) {
              objc_enumerationMutation(mOuterTriangles);
            }
            -[MRTiledSprite subtractTriangle:fromTriangle:addTrianglesTo:]( self,  "subtractTriangle:fromTriangle:addTrianglesTo:",  &v80,  [*(id *)(*((void *)&v53 + 1) + 8 * (void)n) bytes],  v39);
          }

          id v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mOuterTriangles,  "countByEnumeratingWithState:objects:count:",  &v53,  v74,  16LL);
        }

        while (v42);
      }

      -[NSMutableArray removeAllObjects](self->mOuterTriangles, "removeAllObjects");
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      id v45 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v49,  v73,  16LL);
      if (v45)
      {
        id v46 = v45;
        uint64_t v47 = *(void *)v50;
        do
        {
          for (iuint64_t i = 0LL; ii != v46; iuint64_t i = (char *)ii + 1)
          {
            if (*(void *)v50 != v47) {
              objc_enumerationMutation(v39);
            }
            -[MRTiledSprite subtractTriangle:fromTriangle:addTrianglesTo:]( self,  "subtractTriangle:fromTriangle:addTrianglesTo:",  v79,  [*(id *)(*((void *)&v49 + 1) + 8 * (void)ii) bytes],  self->mOuterTriangles);
          }

          id v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v39,  "countByEnumeratingWithState:objects:count:",  &v49,  v73,  16LL);
        }

        while (v46);
      }
    }
  }

- (void)seal
{
  if (!self->mIsSealed)
  {
    double width = self->mHalfSize.width;
    double height = self->mHalfSize.height;
    __float2 v5 = __sincosf_stret(self->mRotation);
    size_t v6 = 24LL * (void)-[NSMutableArray count](self->mTriangles, "count");
    self->mVertices = (float *)malloc(v6);
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    self->mBasicTextureCoordinates = (float *)malloc(v6);
    mNeedsTextureCoordinates = self->mNeedsTextureCoordinates;
    double y = CGPointZero.y;
    do
    {
      if (mNeedsTextureCoordinates[v8])
      {
        double v11 = &mNeedsTextureCoordinates[v7];
        BOOL v12 = *(double *)&mNeedsTextureCoordinates[v7 - 128] == 1.0
           && *(double *)&mNeedsTextureCoordinates[v7 - 120] == 1.0;
      }

      ++v8;
      v7 += 16LL;
    }

    while (v8 != 4);
    double v14 = 1.0 / width;
    double cosval = v5.__cosval;
    double sinval = v5.__sinval;
    double v17 = 1.0 / height;
    self->mInSpriteCoordinates = (float *)malloc(v6);
    __int128 v152 = 0u;
    __int128 v153 = 0u;
    __int128 v154 = 0u;
    __int128 v155 = 0u;
    mTriangles = self->mTriangles;
    id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mTriangles,  "countByEnumeratingWithState:objects:count:",  &v152,  v158,  16LL);
    if (v19)
    {
      id v20 = v19;
      int v21 = 0;
      uint64_t v22 = *(void *)v153;
      do
      {
        for (uint64_t i = 0LL; i != v20; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v153 != v22) {
            objc_enumerationMutation(mTriangles);
          }
          double v24 = (char *)[*(id *)(*((void *)&v152 + 1) + 8 * (void)i) bytes];
          uint64_t v25 = 0LL;
          double x = self->mPosition.x;
          double v27 = self->mPosition.y;
          mVertices = self->mVertices;
          mBasicTextureCoordinates = self->mBasicTextureCoordinates;
          mInSpriteCoordinates = self->mInSpriteCoordinates;
          double v31 = self->mInSpriteCoordinatesFactor.width;
          double v32 = self->mInSpriteCoordinatesFactor.height;
          double v33 = self->mInSpriteCoordinatesOffset.x;
          double v34 = self->mInSpriteCoordinatesOffset.y;
          do
          {
            uint64_t v35 = 0LL;
            uint64_t v36 = (6 * v21 + 2 * v25);
            uint64_t v37 = v36 | 1;
            uint64_t v38 = (double *)&v24[16 * v25];
            double v39 = *v38;
            double v40 = v38[1];
            float v41 = *v38;
            mVertices[v36] = v41;
            float v42 = v40;
            mVertices[v37] = v42;
            double v43 = v39 - x;
            double v44 = v40 - v27;
            float v45 = v14 * (v44 * sinval + v43 * cosval);
            mBasicTextureCoordinates[v36] = v45;
            *(float *)&double v43 = v17 * (v44 * cosval - v43 * sinval);
            mBasicTextureCoordinates[v37] = *(float *)&v43;
            double v46 = v45;
            double v47 = *(float *)&v43;
            p_double y = &self->mTextureCoordinatesOffset[0].y;
            do
            {
              __int128 v49 = self->mTextureCoordinates[v35];
              if (v49)
              {
                double v50 = *(p_y - 8);
                float v51 = *(p_y - 1) + v46 * *(p_y - 9);
                v49[v36] = v51;
                float v52 = *p_y + v47 * v50;
                v49[v37] = v52;
              }

              ++v35;
              p_y += 2;
            }

            while (v35 != 4);
            float v53 = v33 + (v46 + 1.0) * 0.5 * v31;
            mInSpriteCoordinates[v36] = v53;
            float v54 = v34 + (v47 + 1.0) * 0.5 * v32;
            mInSpriteCoordinates[v37] = v54;
            ++v25;
          }

          while (v25 != 3);
          ++v21;
        }

        id v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mTriangles,  "countByEnumeratingWithState:objects:count:",  &v152,  v158,  16LL);
      }

      while (v20);
    }

    mMiddleTriangles = self->mMiddleTriangles;
    if (mMiddleTriangles)
    {
      size_t v56 = 24LL * (void)-[NSMutableArray count](mMiddleTriangles, "count");
      self->mMiddleVertices = (float *)malloc(v56);
      uint64_t v57 = 0LL;
      uint64_t v58 = 0LL;
      self->mMiddleBasicTextureCoordinates = (float *)malloc(v56);
      do
      {
        if (mNeedsTextureCoordinates[v58])
        {
          __int128 v59 = &mNeedsTextureCoordinates[v57];
          BOOL v60 = *(double *)&mNeedsTextureCoordinates[v57 - 128] == 1.0
             && *(double *)&mNeedsTextureCoordinates[v57 - 120] == 1.0;
        }

        ++v58;
        v57 += 16LL;
      }

      while (v58 != 4);
      self->mMiddleInSpriteCoordinates = (float *)malloc(v56);
      __int128 v148 = 0u;
      __int128 v149 = 0u;
      __int128 v150 = 0u;
      __int128 v151 = 0u;
      __int128 v62 = self->mMiddleTriangles;
      id v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v62,  "countByEnumeratingWithState:objects:count:",  &v148,  v157,  16LL);
      if (v63)
      {
        id v64 = v63;
        int v65 = 0;
        uint64_t v66 = *(void *)v149;
        do
        {
          for (j = 0LL; j != v64; j = (char *)j + 1)
          {
            if (*(void *)v149 != v66) {
              objc_enumerationMutation(v62);
            }
            __int128 v68 = (char *)[*(id *)(*((void *)&v148 + 1) + 8 * (void)j) bytes];
            uint64_t v69 = 0LL;
            double v70 = self->mPosition.x;
            double v71 = self->mPosition.y;
            mMiddleVertices = self->mMiddleVertices;
            mMiddleBasicTextureCoordinates = self->mMiddleBasicTextureCoordinates;
            mMiddleInSpriteCoordinates = self->mMiddleInSpriteCoordinates;
            double v75 = self->mInSpriteCoordinatesFactor.width;
            double v76 = self->mInSpriteCoordinatesFactor.height;
            double v77 = self->mInSpriteCoordinatesOffset.x;
            double v78 = self->mInSpriteCoordinatesOffset.y;
            do
            {
              uint64_t v79 = 0LL;
              uint64_t v80 = (6 * v65 + 2 * v69);
              uint64_t v81 = v80 | 1;
              double v82 = (double *)&v68[16 * v69];
              double v83 = *v82;
              double v84 = v82[1];
              float v85 = *v82;
              mMiddleVertices[v80] = v85;
              float v86 = v84;
              mMiddleVertices[v81] = v86;
              double v87 = v83 - v70;
              double v88 = v84 - v71;
              float v89 = v14 * (v88 * sinval + v87 * cosval);
              mMiddleBasicTextureCoordinates[v80] = v89;
              *(float *)&double v87 = v17 * (v88 * cosval - v87 * sinval);
              mMiddleBasicTextureCoordinates[v81] = *(float *)&v87;
              double v90 = v89;
              double v91 = *(float *)&v87;
              int v92 = &self->mTextureCoordinatesOffset[0].y;
              do
              {
                int v93 = self->mMiddleTextureCoordinates[v79];
                if (v93)
                {
                  double v94 = *(v92 - 8);
                  float v95 = *(v92 - 1) + v90 * *(v92 - 9);
                  v93[v80] = v95;
                  float v96 = *v92 + v91 * v94;
                  v93[v81] = v96;
                }

                ++v79;
                v92 += 2;
              }

              while (v79 != 4);
              float v97 = v77 + (v90 + 1.0) * 0.5 * v75;
              mMiddleInSpriteCoordinates[v80] = v97;
              float v98 = v78 + (v91 + 1.0) * 0.5 * v76;
              mMiddleInSpriteCoordinates[v81] = v98;
              ++v69;
            }

            while (v69 != 3);
            ++v65;
          }

          id v64 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v62,  "countByEnumeratingWithState:objects:count:",  &v148,  v157,  16LL);
        }

        while (v64);
      }
    }

    mOuterTriangles = self->mOuterTriangles;
    if (mOuterTriangles)
    {
      size_t v100 = 24LL * (void)-[NSMutableArray count](mOuterTriangles, "count");
      self->mOuterVertices = (float *)malloc(v100);
      uint64_t v101 = 0LL;
      uint64_t v102 = 0LL;
      self->mOuterBasicTextureCoordinates = (float *)malloc(v100);
      mOuterTextureCoordinates = self->mOuterTextureCoordinates;
      do
      {
        if (*((_BYTE *)mOuterTextureCoordinates + v102 + 192))
        {
          double v104 = &mOuterTextureCoordinates[v101];
          BOOL v105 = *(double *)&mOuterTextureCoordinates[v101 + 8] == 1.0
              && *(double *)&mOuterTextureCoordinates[v101 + 9] == 1.0;
          if (!v105
            || (*((double *)v104 + 16) == CGPointZero.x ? (BOOL v106 = *((double *)v104 + 17) == y) : (BOOL v106 = 0), !v106))
          {
            mOuterTextureCoordinates[v102] = (float *)malloc(v100);
          }
        }

        ++v102;
        v101 += 2LL;
      }

      while (v102 != 4);
      self->mOuterInSpriteCoordinates = (float *)malloc(v100);
      __int128 v144 = 0u;
      __int128 v145 = 0u;
      __int128 v146 = 0u;
      __int128 v147 = 0u;
      double v107 = self->mOuterTriangles;
      id v108 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v107,  "countByEnumeratingWithState:objects:count:",  &v144,  v156,  16LL);
      if (v108)
      {
        id v109 = v108;
        int v110 = 0;
        uint64_t v111 = *(void *)v145;
        do
        {
          for (k = 0LL; k != v109; k = (char *)k + 1)
          {
            if (*(void *)v145 != v111) {
              objc_enumerationMutation(v107);
            }
            double v113 = (char *)[*(id *)(*((void *)&v144 + 1) + 8 * (void)k) bytes];
            uint64_t v114 = 0LL;
            double v115 = self->mPosition.x;
            double v116 = self->mPosition.y;
            mOuterVertices = self->mOuterVertices;
            mOuterBasicTextureCoordinates = self->mOuterBasicTextureCoordinates;
            mOuterInSpriteCoordinates = self->mOuterInSpriteCoordinates;
            double v120 = self->mInSpriteCoordinatesFactor.width;
            double v121 = self->mInSpriteCoordinatesFactor.height;
            double v122 = self->mInSpriteCoordinatesOffset.x;
            double v123 = self->mInSpriteCoordinatesOffset.y;
            do
            {
              uint64_t v124 = 0LL;
              uint64_t v125 = (6 * v110 + 2 * v114);
              uint64_t v126 = v125 | 1;
              int v127 = (double *)&v113[16 * v114];
              double v128 = *v127;
              double v129 = v127[1];
              float v130 = *v127;
              mOuterVertices[v125] = v130;
              float v131 = v129;
              mOuterVertices[v126] = v131;
              double v132 = v128 - v115;
              double v133 = v129 - v116;
              float v134 = v14 * (v133 * sinval + v132 * cosval);
              mOuterBasicTextureCoordinates[v125] = v134;
              *(float *)&double v132 = v17 * (v133 * cosval - v132 * sinval);
              mOuterBasicTextureCoordinates[v126] = *(float *)&v132;
              double v135 = v134;
              double v136 = *(float *)&v132;
              float v137 = &self->mTextureCoordinatesOffset[0].y;
              do
              {
                unsigned int v138 = self->mOuterTextureCoordinates[v124];
                if (v138)
                {
                  double v139 = *(v137 - 8);
                  float v140 = *(v137 - 1) + v135 * *(v137 - 9);
                  v138[v125] = v140;
                  float v141 = *v137 + v136 * v139;
                  v138[v126] = v141;
                }

                ++v124;
                v137 += 2;
              }

              while (v124 != 4);
              float v142 = v122 + (v135 + 1.0) * 0.5 * v120;
              mOuterInSpriteCoordinates[v125] = v142;
              float v143 = v123 + (v136 + 1.0) * 0.5 * v121;
              mOuterInSpriteCoordinates[v126] = v143;
              ++v114;
            }

            while (v114 != 3);
            ++v110;
          }

          id v109 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v107,  "countByEnumeratingWithState:objects:count:",  &v144,  v156,  16LL);
        }

        while (v109);
      }
    }

    self->mIsSealed = 1;
    self->mNeedsToUpdateInSpriteCoordinates = 0;
  }

- (void)updateInSpriteCoordinates
{
  v3 = (char *)-[NSMutableArray count](self->mTriangles, "count");
  if ((uint64_t)v3 >= 1)
  {
    v4 = 0LL;
    mBasicTextureCoordinates = self->mBasicTextureCoordinates;
    mInSpriteCoordinates = self->mInSpriteCoordinates;
    double width = self->mInSpriteCoordinatesFactor.width;
    double height = self->mInSpriteCoordinatesFactor.height;
    double x = self->mInSpriteCoordinatesOffset.x;
    double y = self->mInSpriteCoordinatesOffset.y;
    do
    {
      for (uint64_t i = 0LL; i != 6; i += 2LL)
      {
        float v12 = x + (mBasicTextureCoordinates[i] + 1.0) * 0.5 * width;
        BOOL v13 = &mInSpriteCoordinates[i];
        float *v13 = v12;
        float v14 = y + (mBasicTextureCoordinates[i + 1] + 1.0) * 0.5 * height;
        v13[1] = v14;
      }

      ++v4;
      mInSpriteCoordinates += 6;
      mBasicTextureCoordinates += 6;
    }

    while (v4 != v3);
  }

  mMiddleTriangles = self->mMiddleTriangles;
  if (mMiddleTriangles)
  {
    double v16 = (char *)-[NSMutableArray count](mMiddleTriangles, "count");
    if ((uint64_t)v16 >= 1)
    {
      double v17 = 0LL;
      mMiddleBasicTextureCoordinates = self->mMiddleBasicTextureCoordinates;
      mMiddleInSpriteCoordinates = self->mMiddleInSpriteCoordinates;
      double v20 = self->mInSpriteCoordinatesFactor.width;
      double v21 = self->mInSpriteCoordinatesFactor.height;
      double v22 = self->mInSpriteCoordinatesOffset.x;
      double v23 = self->mInSpriteCoordinatesOffset.y;
      do
      {
        for (uint64_t j = 0LL; j != 6; j += 2LL)
        {
          float v25 = v22 + (mMiddleBasicTextureCoordinates[j] + 1.0) * 0.5 * v20;
          id v26 = &mMiddleInSpriteCoordinates[j];
          *id v26 = v25;
          float v27 = v23 + (mMiddleBasicTextureCoordinates[j + 1] + 1.0) * 0.5 * v21;
          v26[1] = v27;
        }

        ++v17;
        mMiddleInSpriteCoordinates += 6;
        mMiddleBasicTextureCoordinates += 6;
      }

      while (v17 != v16);
    }
  }

  mOuterTriangles = self->mOuterTriangles;
  if (mOuterTriangles)
  {
    double v29 = (char *)-[NSMutableArray count](mOuterTriangles, "count");
    if ((uint64_t)v29 >= 1)
    {
      double v30 = 0LL;
      mOuterBasicTextureCoordinates = self->mOuterBasicTextureCoordinates;
      mOuterInSpriteCoordinates = self->mOuterInSpriteCoordinates;
      double v33 = self->mInSpriteCoordinatesFactor.width;
      double v34 = self->mInSpriteCoordinatesFactor.height;
      double v35 = self->mInSpriteCoordinatesOffset.x;
      double v36 = self->mInSpriteCoordinatesOffset.y;
      do
      {
        for (uint64_t k = 0LL; k != 6; k += 2LL)
        {
          float v38 = v35 + (mOuterBasicTextureCoordinates[k] + 1.0) * 0.5 * v33;
          double v39 = &mOuterInSpriteCoordinates[k];
          *double v39 = v38;
          float v40 = v36 + (mOuterBasicTextureCoordinates[k + 1] + 1.0) * 0.5 * v34;
          v39[1] = v40;
        }

        ++v30;
        mOuterInSpriteCoordinates += 6;
        mOuterBasicTextureCoordinates += 6;
      }

      while (v30 != v29);
    }
  }

  self->mNeedsToUpdateInSpriteCoordinates = 0;
}

- (void)renderDumbImage:(id)a3 inContext:(id)a4
{
  if (!self->mIsSealed)
  {
    -[MRTiledSprite seal](self, "seal");
    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  if (self->mNeedsToUpdateInSpriteCoordinates) {
    -[MRTiledSprite updateInSpriteCoordinates](self, "updateInSpriteCoordinates");
  }
  if (a3)
  {
LABEL_5:
    LODWORD(v4) = 0;
    [a3 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v10 state:v4];
  }

- (void)renderImageInner:(id)a3 inContext:(id)a4
{
  if (!self->mIsSealed)
  {
    -[MRTiledSprite seal](self, "seal");
    if (!a3) {
      goto LABEL_11;
    }
LABEL_7:
    if (self->mPreservesImageAspectRatio) {
      CGFloat v7 = self->mHalfSize.width / self->mHalfSize.height;
    }
    else {
      [a3 aspectRatio];
    }
    *(float *)&CGFloat v7 = v7;
    [a3 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v11 state:v7];
    goto LABEL_11;
  }

  if (self->mNeedsToUpdateInSpriteCoordinates) {
    -[MRTiledSprite updateInSpriteCoordinates](self, "updateInSpriteCoordinates");
  }
  if (a3) {
    goto LABEL_7;
  }
LABEL_11:
  for (uint64_t i = 0LL; i != 4; ++i)
  {
    if (a3 && !i || [a4 imageSetOnTextureUnit:i])
    {
      mBasicTextureCoordinates = self->mTextureCoordinates[i];
      if (!mBasicTextureCoordinates) {
        mBasicTextureCoordinates = self->mBasicTextureCoordinates;
      }
      [a4 setTextureCoordinatesPointer:mBasicTextureCoordinates onTextureUnit:i];
    }
  }

  if (self->mNeedsInSpriteCoordinates) {
    [a4 setInSpriteCoordinatesPointer:self->mInSpriteCoordinates];
  }
  [a4 setVertex2DPointer:self->mVertices];
  objc_msgSend( a4,  "drawTrianglesFromOffset:count:",  0,  3 * (void)-[NSMutableArray count](self->mTriangles, "count"));
  [a4 unsetVertexPointer];
  if (self->mNeedsInSpriteCoordinates) {
    [a4 unsetInSpriteCoordinatesPointer];
  }
  for (uint64_t j = 0LL; j != 4; ++j)
  {
    if (a3 && !j || [a4 imageSetOnTextureUnit:j]) {
      [a4 unsetTextureCoordinatesPointerOnTextureUnit:j];
    }
  }

  if (a3) {
    [a3 unsetOnContext:a4 onTextureUnit:0 state:&v11];
  }
}

- (void)renderImageMiddle:(id)a3 inContext:(id)a4
{
  if (!self->mMiddleTriangles) {
    return;
  }
  if (self->mIsSealed)
  {
    if (self->mNeedsToUpdateInSpriteCoordinates) {
      -[MRTiledSprite updateInSpriteCoordinates](self, "updateInSpriteCoordinates");
    }
    if (!a3) {
      goto LABEL_12;
    }
  }

  else
  {
    -[MRTiledSprite seal](self, "seal");
    if (!a3) {
      goto LABEL_12;
    }
  }

  if (self->mPreservesImageAspectRatio) {
    CGFloat v7 = self->mHalfSize.width / self->mHalfSize.height;
  }
  else {
    [a3 aspectRatio];
  }
  *(float *)&CGFloat v7 = v7;
  [a3 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v11 state:v7];
LABEL_12:
  for (uint64_t i = 0LL; i != 4; ++i)
  {
    if (a3 && !i || [a4 imageSetOnTextureUnit:i])
    {
      mMiddleBasicTextureCoordinates = self->mMiddleTextureCoordinates[i];
      if (!mMiddleBasicTextureCoordinates) {
        mMiddleBasicTextureCoordinates = self->mMiddleBasicTextureCoordinates;
      }
      [a4 setTextureCoordinatesPointer:mMiddleBasicTextureCoordinates onTextureUnit:i];
    }
  }

  if (self->mNeedsInSpriteCoordinates) {
    [a4 setInSpriteCoordinatesPointer:self->mMiddleInSpriteCoordinates];
  }
  [a4 setVertex2DPointer:self->mMiddleVertices];
  objc_msgSend( a4,  "drawTrianglesFromOffset:count:",  0,  3 * (void)-[NSMutableArray count](self->mMiddleTriangles, "count"));
  [a4 unsetVertexPointer];
  if (self->mNeedsInSpriteCoordinates) {
    [a4 unsetInSpriteCoordinatesPointer];
  }
  for (uint64_t j = 0LL; j != 4; ++j)
  {
    if (a3 && !j || [a4 imageSetOnTextureUnit:j]) {
      [a4 unsetTextureCoordinatesPointerOnTextureUnit:j];
    }
  }

  if (a3) {
    [a3 unsetOnContext:a4 onTextureUnit:0 state:&v11];
  }
}

- (void)renderImageOuter:(id)a3 inContext:(id)a4
{
  if (!self->mOuterTriangles) {
    return;
  }
  if (self->mIsSealed)
  {
    if (self->mNeedsToUpdateInSpriteCoordinates) {
      -[MRTiledSprite updateInSpriteCoordinates](self, "updateInSpriteCoordinates");
    }
    if (!a3) {
      goto LABEL_12;
    }
  }

  else
  {
    -[MRTiledSprite seal](self, "seal");
    if (!a3) {
      goto LABEL_12;
    }
  }

  if (self->mPreservesImageAspectRatio) {
    CGFloat v7 = self->mHalfSize.width / self->mHalfSize.height;
  }
  else {
    [a3 aspectRatio];
  }
  *(float *)&CGFloat v7 = v7;
  [a3 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v11 state:v7];
LABEL_12:
  for (uint64_t i = 0LL; i != 4; ++i)
  {
    if (a3 && !i || [a4 imageSetOnTextureUnit:i])
    {
      mOuterBasicTextureCoordinates = self->mOuterTextureCoordinates[i];
      if (!mOuterBasicTextureCoordinates) {
        mOuterBasicTextureCoordinates = self->mOuterBasicTextureCoordinates;
      }
      [a4 setTextureCoordinatesPointer:mOuterBasicTextureCoordinates onTextureUnit:i];
    }
  }

  if (self->mNeedsInSpriteCoordinates) {
    [a4 setInSpriteCoordinatesPointer:self->mOuterInSpriteCoordinates];
  }
  [a4 setVertex2DPointer:self->mOuterVertices];
  objc_msgSend( a4,  "drawTrianglesFromOffset:count:",  0,  3 * (void)-[NSMutableArray count](self->mOuterTriangles, "count"));
  [a4 unsetVertexPointer];
  if (self->mNeedsInSpriteCoordinates) {
    [a4 unsetInSpriteCoordinatesPointer];
  }
  for (uint64_t j = 0LL; j != 4; ++j)
  {
    if (a3 && !j || [a4 imageSetOnTextureUnit:j]) {
      [a4 unsetTextureCoordinatesPointerOnTextureUnit:j];
    }
  }

  if (a3) {
    [a3 unsetOnContext:a4 onTextureUnit:0 state:&v11];
  }
}

- (void)renderImage:(id)a3 inContext:(id)a4
{
  if (!self->mIsSealed)
  {
    -[MRTiledSprite seal](self, "seal");
    if (!a3) {
      goto LABEL_11;
    }
LABEL_7:
    if (self->mPreservesImageAspectRatio) {
      CGFloat v7 = self->mHalfSize.width / self->mHalfSize.height;
    }
    else {
      [a3 aspectRatio];
    }
    *(float *)&CGFloat v7 = v7;
    [a3 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v15 state:v7];
    goto LABEL_11;
  }

  if (self->mNeedsToUpdateInSpriteCoordinates) {
    -[MRTiledSprite updateInSpriteCoordinates](self, "updateInSpriteCoordinates");
  }
  if (a3) {
    goto LABEL_7;
  }
LABEL_11:
  for (uint64_t i = 0LL; i != 4; ++i)
  {
    if (a3 && !i || [a4 imageSetOnTextureUnit:i])
    {
      mBasicTextureCoordinates = self->mTextureCoordinates[i];
      if (!mBasicTextureCoordinates) {
        mBasicTextureCoordinates = self->mBasicTextureCoordinates;
      }
      [a4 setTextureCoordinatesPointer:mBasicTextureCoordinates onTextureUnit:i];
    }
  }

  if (self->mNeedsInSpriteCoordinates) {
    [a4 setInSpriteCoordinatesPointer:self->mInSpriteCoordinates];
  }
  [a4 setVertex2DPointer:self->mVertices];
  objc_msgSend( a4,  "drawTrianglesFromOffset:count:",  0,  3 * (void)-[NSMutableArray count](self->mTriangles, "count"));
  if (self->mMiddleVertices)
  {
    for (uint64_t j = 0LL; j != 4; ++j)
    {
      if (a3 && !j || [a4 imageSetOnTextureUnit:j])
      {
        mMiddleBasicTextureCoordinates = self->mMiddleTextureCoordinates[j];
        if (!mMiddleBasicTextureCoordinates) {
          mMiddleBasicTextureCoordinates = self->mMiddleBasicTextureCoordinates;
        }
        [a4 setTextureCoordinatesPointer:mMiddleBasicTextureCoordinates onTextureUnit:j];
      }
    }

    if (self->mNeedsInSpriteCoordinates) {
      [a4 setInSpriteCoordinatesPointer:self->mMiddleInSpriteCoordinates];
    }
    [a4 setVertex2DPointer:self->mMiddleVertices];
    objc_msgSend( a4,  "drawTrianglesFromOffset:count:",  0,  3 * (void)-[NSMutableArray count](self->mMiddleTriangles, "count"));
  }

  if (self->mOuterVertices)
  {
    for (uint64_t k = 0LL; k != 4; ++k)
    {
      if (a3 && !k || [a4 imageSetOnTextureUnit:k])
      {
        mOuterBasicTextureCoordinates = self->mOuterTextureCoordinates[k];
        if (!mOuterBasicTextureCoordinates) {
          mOuterBasicTextureCoordinates = self->mOuterBasicTextureCoordinates;
        }
        [a4 setTextureCoordinatesPointer:mOuterBasicTextureCoordinates onTextureUnit:k];
      }
    }

    if (self->mNeedsInSpriteCoordinates) {
      [a4 setInSpriteCoordinatesPointer:self->mOuterInSpriteCoordinates];
    }
    [a4 setVertex2DPointer:self->mOuterVertices];
    objc_msgSend( a4,  "drawTrianglesFromOffset:count:",  0,  3 * (void)-[NSMutableArray count](self->mOuterTriangles, "count"));
  }

  [a4 unsetVertexPointer];
  if (self->mNeedsInSpriteCoordinates) {
    [a4 unsetInSpriteCoordinatesPointer];
  }
  for (uint64_t m = 0LL; m != 4; ++m)
  {
    if (a3 && !m || [a4 imageSetOnTextureUnit:m]) {
      [a4 unsetTextureCoordinatesPointerOnTextureUnit:m];
    }
  }

  if (a3) {
    [a3 unsetOnContext:a4 onTextureUnit:0 state:&v15];
  }
}

- (void)setNeedsTextureCoordinates:(BOOL)a3 onTextureUnit:(unint64_t)a4
{
  self->mNeedsTextureCoordinates[a4] = a3;
}

- (void)setTextureCoordinatesFactor:(CGSize)a3 andOffset:(CGPoint)a4 onTextureUnit:(unint64_t)a5
{
  __float2 v5 = (char *)self + 16 * a5;
  *(CGSize *)(v5 + 344) = a3;
  *(CGPoint *)(v5 + 408) = a4;
}

- (void)setSpriteCoordinatesFactor:(CGSize)a3 andOffset:(CGPoint)a4
{
  BOOL v4 = a3.width == self->mInSpriteCoordinatesFactor.width && a3.height == self->mInSpriteCoordinatesFactor.height;
  if (!v4
    || (a4.x == self->mInSpriteCoordinatesOffset.x ? (BOOL v5 = a4.y == self->mInSpriteCoordinatesOffset.y) : (BOOL v5 = 0), !v5))
  {
    self->mInSpriteCoordinatesFactor = a3;
    self->mInSpriteCoordinatesOffset = a4;
    self->mNeedsToUpdateInSpriteCoordinates = 1;
  }

- (BOOL)hitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5
{
  if (!self->mHitIsActive) {
    return 0;
  }
  double v7 = MRMatrix_UnprojectPoint(a4, a3.x, a3.y) - self->mPosition.x;
  double v9 = v8 - self->mPosition.y;
  __float2 v10 = __sincosf_stret(self->mRotation);
  double v11 = ((v9 * v10.__sinval + v7 * v10.__cosval) / self->mHalfSize.width + 1.0) * 0.5;
  double v12 = ((v9 * v10.__cosval - v7 * v10.__sinval) / self->mHalfSize.height + 1.0) * 0.5;
  if (a5)
  {
    a5->double x = v11;
    a5->double y = v12;
  }

  BOOL v13 = v11 >= 0.0;
  if (v11 > 1.0) {
    BOOL v13 = 0;
  }
  if (v12 < 0.0) {
    BOOL v13 = 0;
  }
  return v12 <= 1.0 && v13;
}

- (BOOL)getVerticesCoordinates:(CGPoint *)(a3 withMatrix:
{
  double width = self->mHalfSize.width;
  __float2 v8 = __sincosf_stret(self->mRotation);
  float v9 = width * v8.__cosval;
  double height = self->mHalfSize.height;
  float v11 = height * v8.__sinval;
  float v12 = width * v8.__sinval;
  float v13 = height * v8.__cosval;
  double v14 = v9;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  (*a3)[0].double x = MRMatrix_ProjectPoint(a4, self->mPosition.x - v9 + v11, self->mPosition.y - v12 - v13);
  (*a3)[0].double y = v18;
  (*a3)[1].double x = MRMatrix_ProjectPoint(a4, self->mPosition.x + v14 + v15, self->mPosition.y + v16 - v17);
  (*a3)[1].double y = v19;
  (*a3)[2].double x = MRMatrix_ProjectPoint(a4, self->mPosition.x + v14 - v15, self->mPosition.y + v16 + v17);
  (*a3)[2].double y = v20;
  (*a3)[3].double x = MRMatrix_ProjectPoint(a4, self->mPosition.x - v14 - v15, self->mPosition.y - v16 + v17);
  (*a3)[3].double y = v21;
  return 1;
}

- (void)getOpaquePosition:(CGPoint *)a3 andHalfSize:(CGSize *)a4
{
  double x = self->mOuterRect.origin.x;
  double y = self->mOuterRect.origin.y;
  double width = self->mHalfSize.width;
  double height = self->mHalfSize.height;
  double v11 = width * (x * 2.0 + -1.0);
  double v12 = width * ((x + self->mOuterRect.size.width) * 2.0 + -1.0);
  double v13 = height * (y * 2.0 + -1.0);
  double v14 = height * ((y + self->mOuterRect.size.height) * 2.0 + -1.0);
  double v15 = self->mPosition.x;
  __float2 v16 = __sincosf_stret(self->mRotation);
  double v17 = self->mPosition.y;
  a3->double x = v15 + ((v11 + v12) * v16.__cosval - (v13 + v14) * v16.__sinval) * 0.5;
  a3->double y = v17 + ((v11 + v12) * v16.__sinval + (v13 + v14) * v16.__cosval) * 0.5;
  a4->double width = (v12 - v11) * 0.5;
  a4->double height = (v14 - v13) * 0.5;
}

- (CGPoint)position
{
  double x = self->mPosition.x;
  double y = self->mPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGSize)halfSize
{
  double width = self->mHalfSize.width;
  double height = self->mHalfSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (float)rotation
{
  return self->mRotation;
}

- (CGRect)innerRect
{
  double x = self->mInnerRect.origin.x;
  double y = self->mInnerRect.origin.y;
  double width = self->mInnerRect.size.width;
  double height = self->mInnerRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)outerRect
{
  double x = self->mOuterRect.origin.x;
  double y = self->mOuterRect.origin.y;
  double width = self->mOuterRect.size.width;
  double height = self->mOuterRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)hitIsActive
{
  return self->mHitIsActive;
}

- (void)setHitIsActive:(BOOL)a3
{
  self->mHitIsActive = a3;
}

- (BOOL)needsInSpriteCoordinates
{
  return self->mNeedsInSpriteCoordinates;
}

- (void)setNeedsInSpriteCoordinates:(BOOL)a3
{
  self->mNeedsInSpriteCoordinates = a3;
}

- (BOOL)preservesImageAspectRatio
{
  return self->mPreservesImageAspectRatio;
}

- (void)setPreservesImageAspectRatio:(BOOL)a3
{
  self->mPreservesImageAspectRatio = a3;
}

@end