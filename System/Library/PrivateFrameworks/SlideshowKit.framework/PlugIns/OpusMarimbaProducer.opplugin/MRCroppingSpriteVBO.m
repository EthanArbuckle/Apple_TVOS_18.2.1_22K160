@interface MRCroppingSpriteVBO
- (BOOL)getVerticesCoordinates:(CGPoint *)(a3 withMatrix:;
- (BOOL)hitAtPoint:(CGPoint)a3 withInverseMatrix:(float)a4[16] localPoint:(CGPoint *)a5;
- (BOOL)hitIsActive;
- (BOOL)needsInSpriteCoordinates;
- (BOOL)preservesImageAspectRatio;
- (CGPoint)position;
- (CGPoint)spriteCoordinatesOffset;
- (CGRect)innerRect;
- (CGRect)outerRect;
- (CGSize)halfSize;
- (CGSize)spriteCoordinatesFactor;
- (MRCroppingSpriteVBO)init;
- (MRCroppingSpriteVBO)initWithPosition:(CGPoint)a3 size:(CGSize)a4 zRotation:(float)a5 context:(id)a6;
- (MRCroppingSpriteVBO)initWithPosition:(CGPoint)a3 size:(CGSize)a4 zRotation:(float)a5 innerRect:(CGRect)a6 context:(id)a7;
- (float)rotation;
- (unsigned)meshType;
- (void)fakeRenderInContext:(id)a3 atPosition:(CGPoint)a4 andSize:(CGSize)a5 zRotation:(float)a6;
- (void)getOpaquePosition:(CGPoint *)a3 andHalfSize:(CGSize *)a4;
- (void)initWithPosition:(double)a3 size:(double)a4 zRotation:(double)a5 innerRect:(float)a6 outerRect:(uint64_t)a7 context:(uint64_t)a8;
- (void)renderImageInner:(id)a3 inContext:(id)a4;
- (void)renderImageMiddle:(id)a3 inContext:(id)a4;
- (void)renderImageOuter:(id)a3 inContext:(id)a4;
- (void)reset;
- (void)setHitIsActive:(BOOL)a3;
- (void)setInnerRect:(CGRect)a3;
- (void)setMeshType:(unsigned __int8)a3;
- (void)setNeedsInSpriteCoordinates:(BOOL)a3;
- (void)setOuterRect:(CGRect)a3;
- (void)setPreservesImageAspectRatio:(BOOL)a3;
- (void)setSpriteCoordinatesFactor:(CGSize)a3;
- (void)setSpriteCoordinatesOffset:(CGPoint)a3;
- (void)updateVBOsInContext:(id)a3;
@end

@implementation MRCroppingSpriteVBO

- (MRCroppingSpriteVBO)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MRCroppingSpriteVBO;
  result = -[MRCroppingSpriteVBO init](&v8, "init");
  if (result)
  {
    result->mInnerRect.origin.x = 0.0;
    result->mInnerRect.origin.y = 0.0;
    __asm { FMOV            V0.2D, #1.0 }

    result->mInnerRect.size = _Q0;
    result->mOuterRect.origin.x = 0.0;
    result->mOuterRect.origin.y = 0.0;
    result->mOuterRect.size = _Q0;
    *(_WORD *)&result->mPreservesImageAspectRatio = 257;
    result->mSpriteCoordinatesFactor = _Q0;
    *(_WORD *)&result->mPositionWasUpdated = 257;
  }

  return result;
}

- (MRCroppingSpriteVBO)initWithPosition:(CGPoint)a3 size:(CGSize)a4 zRotation:(float)a5 context:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  double y = a3.y;
  double x = a3.x;
  v12 = -[MRCroppingSpriteVBO init](self, "init");
  v14 = v12;
  if (v12)
  {
    *(float *)&double v13 = a5;
    -[MRCroppingSpriteVBO fakeRenderInContext:atPosition:andSize:zRotation:]( v12,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a6,  x,  y,  width,  height,  v13);
  }

  return v14;
}

- (MRCroppingSpriteVBO)initWithPosition:(CGPoint)a3 size:(CGSize)a4 zRotation:(float)a5 innerRect:(CGRect)a6 context:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  double y = a3.y;
  double x = a3.x;
  double v13 = -[MRCroppingSpriteVBO init](self, "init");
  v15 = v13;
  if (v13)
  {
    *(float *)&double v14 = a5;
    -[MRCroppingSpriteVBO fakeRenderInContext:atPosition:andSize:zRotation:]( v13,  "fakeRenderInContext:atPosition:andSize:zRotation:",  a7,  x,  y,  width,  height,  v14);
    -[MRCroppingSpriteVBO setInnerRect:](v15, "setInnerRect:", a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  }

  return v15;
}

- (void)initWithPosition:(double)a3 size:(double)a4 zRotation:(double)a5 innerRect:(float)a6 outerRect:(uint64_t)a7 context:(uint64_t)a8
{
  id v27 = [a1 init];
  v29 = v27;
  if (v27)
  {
    *(float *)&double v28 = a6;
    objc_msgSend(v27, "fakeRenderInContext:atPosition:andSize:zRotation:", a8, a2, a3, a4, a5, v28);
    objc_msgSend(v29, "setInnerRect:", a12, a13, a14, a15);
    objc_msgSend(v29, "setOuterRect:", a16, a17, a18, a19);
  }

  return v29;
}

- (void)reset
{
  self->mPosition = CGPointZero;
  self->mHalfSize = CGSizeZero;
  self->mRotation = 0.0;
  self->mPositionWasUpdated = 1;
}

- (void)fakeRenderInContext:(id)a3 atPosition:(CGPoint)a4 andSize:(CGSize)a5 zRotation:(float)a6
{
  double height = a5.height;
  double width = a5.width;
  CGFloat y = a4.y;
  float x = a4.x;
  [a3 localAspectRatio];
  *(float *)&CGFloat y = y / v13;
  float v14 = width * 0.5;
  [a3 localAspectRatio];
  float v16 = height * 0.5 / v15;
  double v17 = *(float *)&y;
  BOOL v18 = self->mPosition.x != x
     || self->mPosition.y != v17
     || self->mHalfSize.width != v14
     || self->mHalfSize.height != v16
     || self->mRotation != a6;
  self->mPositionWasUpdated |= v18;
  self->mPosition.float x = x;
  self->mPosition.CGFloat y = v17;
  self->mHalfSize.double width = v14;
  self->mHalfSize.double height = v16;
  self->mRotation = a6;
}

- (void)setInnerRect:(CGRect)a3
{
  double y = 0.0;
  if (a3.origin.x >= 0.0) {
    double x = a3.origin.x;
  }
  else {
    double x = 0.0;
  }
  if (a3.origin.y >= 0.0) {
    double y = a3.origin.y;
  }
  double v5 = fmin(a3.origin.x + a3.size.width, 1.0) - x;
  double v6 = fmin(a3.origin.y + a3.size.height, 1.0) - y;
  BOOL v7 = self->mInnerRect.origin.x != x
    || self->mInnerRect.origin.y != y
    || self->mInnerRect.size.width != v5
    || self->mInnerRect.size.height != v6;
  self->mRectsWereUpdated |= v7;
  self->mInnerRect.origin.double x = x;
  self->mInnerRect.origin.double y = y;
  self->mInnerRect.size.double width = v5;
  self->mInnerRect.size.double height = v6;
}

- (void)setOuterRect:(CGRect)a3
{
  double y = 0.0;
  if (a3.origin.x >= 0.0) {
    double x = a3.origin.x;
  }
  else {
    double x = 0.0;
  }
  if (a3.origin.y >= 0.0) {
    double y = a3.origin.y;
  }
  double v5 = fmin(a3.origin.x + a3.size.width, 1.0) - x;
  double v6 = fmin(a3.origin.y + a3.size.height, 1.0) - y;
  BOOL v7 = self->mInnerRect.origin.x != x
    || self->mInnerRect.origin.y != y
    || self->mInnerRect.size.width != v5
    || self->mInnerRect.size.height != v6;
  self->mRectsWereUpdated |= v7;
  self->mOuterRect.origin.double x = x;
  self->mOuterRect.origin.double y = y;
  self->mOuterRect.size.double width = v5;
  self->mOuterRect.size.double height = v6;
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

- (void)updateVBOsInContext:(id)a3
{
  double width = self->mHalfSize.width;
  if (width != 0.0)
  {
    double height = self->mHalfSize.height;
    if (height != 0.0)
    {
      if (*(_WORD *)&self->mPositionWasUpdated)
      {
        double x = self->mOuterRect.origin.x;
        if (x == 0.0
          && self->mOuterRect.origin.y == 0.0
          && self->mOuterRect.size.width == 1.0
          && self->mOuterRect.size.height == 1.0)
        {
          p_double y = &self->mInnerRect.origin.y;
          p_size = &self->mInnerRect.size;
          p_double height = &self->mInnerRect.size.height;
          double v11 = self->mInnerRect.origin.x;
          double x = v11;
        }

        else
        {
          p_double y = &self->mOuterRect.origin.y;
          p_size = &self->mOuterRect.size;
          p_double height = &self->mOuterRect.size.height;
          double v11 = self->mInnerRect.origin.x;
        }

        double v12 = (p_size->width + x) * 2.0 + -1.0;
        double v133 = *p_y * 2.0 + -1.0;
        double v134 = x * 2.0 + -1.0;
        double v13 = (*p_height + *p_y) * 2.0 + -1.0;
        double v132 = v11 * 2.0 + -1.0;
        double y = self->mInnerRect.origin.y;
        double v136 = (v11 + self->mInnerRect.size.width) * 2.0 + -1.0;
        double v15 = y * 2.0 + -1.0;
        double v16 = (y + self->mInnerRect.size.height) * 2.0 + -1.0;
        *(_WORD *)&self->mMiddleOffset = 3588;
        int mMeshType = self->mMeshType;
        if (mMeshType == 1) {
          int v18 = 38;
        }
        else {
          int v18 = 24;
        }
        self->uint64_t mNumberOfVertices = v18;
        v19 = (float32x2_t *)malloc(16LL * (2 * v18));
        float v20 = self->mPosition.x;
        float v21 = self->mPosition.y;
        float v22 = width;
        float v23 = height;
        __float2 v24 = __sincosf_stret(self->mRotation);
        uint64_t v25 = 0LL;
        double v26 = v134 * v22;
        double v27 = v12 * v22;
        double v28 = v133 * v23;
        double v29 = v13 * v23;
        double v30 = v132 * v22;
        double v31 = v15 * v23;
        double v32 = v16 * v23;
        float v138 = v20;
        float v139 = v21;
        double cosval = v24.__cosval;
        double v34 = v20 + v30 * v24.__cosval;
        double sinval = v24.__sinval;
        float v36 = v34 - v31 * v24.__sinval;
        double v37 = v21;
        double v38 = v21 + v30 * v24.__sinval;
        float v39 = v38 + v31 * v24.__cosval;
        *(float *)v223 = v36;
        *(float *)&v223[1] = v39;
        double v40 = v20 + v27 * v24.__cosval;
        float v41 = v40 - v28 * v24.__sinval;
        double v42 = v21 + v27 * v24.__sinval;
        float v43 = v42 + v28 * v24.__cosval;
        *(float *)&v223[12] = v41;
        *(float *)&v223[13] = v43;
        double v131 = v34;
        float v44 = v34 - v32 * v24.__sinval;
        float v45 = v38 + v32 * v24.__cosval;
        *(float *)&v223[2] = v44;
        *(float *)&v223[3] = v45;
        *(float *)&double v40 = v40 - v29 * v24.__sinval;
        *(float *)&double v42 = v42 + v29 * v24.__cosval;
        v223[16] = LODWORD(v40);
        v223[17] = LODWORD(v42);
        double v46 = v20 + v26 * v24.__cosval;
        double v47 = v37 + v26 * v24.__sinval;
        *(float *)&double v42 = v46 - v29 * v24.__sinval;
        *(float *)&double v29 = v47 + v29 * v24.__cosval;
        v223[20] = LODWORD(v42);
        v223[21] = LODWORD(v29);
        double v48 = v136 * v22;
        double v49 = v20 + v48 * v24.__cosval;
        float v50 = v49 - v31 * v24.__sinval;
        double v51 = v37 + v48 * v24.__sinval;
        float v52 = v51 + v31 * v24.__cosval;
        *(float *)&v223[4] = v50;
        *(float *)&v223[5] = v52;
        float v53 = v49 - v32 * v24.__sinval;
        double v54 = v46 - v28 * v24.__sinval;
        float v55 = v51 + v32 * v24.__cosval;
        *(float *)&v223[6] = v53;
        *(float *)&v223[7] = v55;
        *(float *)&double v54 = v54;
        *(float *)&double v28 = v47 + v28 * v24.__cosval;
        v223[8] = LODWORD(v54);
        v223[9] = LODWORD(v28);
        *(float *)&v223[10] = v36;
        *(float *)&v223[11] = v39;
        *(float *)&v223[14] = v50;
        *(float *)&v223[15] = v52;
        *(float *)&v223[18] = v53;
        *(float *)&v223[19] = v55;
        *(float *)&v223[22] = v44;
        *(float *)&v223[23] = v45;
        v223[24] = LODWORD(v54);
        v223[25] = LODWORD(v28);
        *(float *)&v223[26] = v36;
        *(float *)&v223[27] = v39;
        *(float *)&double v28 = v132;
        float v56 = v15;
        v222[0] = LODWORD(v28);
        *(float *)&v222[1] = v56;
        float v57 = v16;
        v222[2] = LODWORD(v28);
        *(float *)&v222[3] = v57;
        float v58 = v136;
        *(float *)&v222[4] = v58;
        *(float *)&v222[5] = v56;
        *(float *)&v222[6] = v58;
        *(float *)&v222[7] = v57;
        float v59 = v134;
        float v60 = v133;
        *(float *)&v222[8] = v59;
        *(float *)&v222[9] = v60;
        v222[10] = LODWORD(v28);
        *(float *)&v222[11] = v56;
        double v137 = -v31;
        double v135 = -v32;
        float v61 = v12;
        *(float *)&v222[12] = v61;
        *(float *)&v222[13] = v60;
        float v62 = v24.__cosval * v22;
        float v63 = v24.__cosval * v23;
        *(float *)&v222[14] = v58;
        *(float *)&v222[15] = v56;
        float v64 = v13;
        *(float *)&v222[16] = v61;
        *(float *)&v222[17] = v64;
        *(float *)&v222[18] = v58;
        *(float *)&v222[19] = v57;
        *(float *)&v222[20] = v59;
        *(float *)&v222[21] = v64;
        v222[22] = LODWORD(v28);
        *(float *)&v222[23] = v57;
        *(float *)&v222[24] = v59;
        *(float *)&v222[25] = v60;
        v222[26] = LODWORD(v28);
        *(float *)&v222[27] = v56;
        double v65 = self->mSpriteCoordinatesFactor.width;
        _D29 = self->mSpriteCoordinatesFactor.height;
        double v68 = self->mSpriteCoordinatesOffset.x;
        double v67 = self->mSpriteCoordinatesOffset.y;
        v69 = v19;
        do
        {
          float32x2_t *v69 = *(float32x2_t *)&v223[v25];
          v70 = v69 + 4;
          float32x2_t v71 = *(float32x2_t *)&v222[v25];
          __asm { FMOV            V14.2D, #1.0 }

          float64x2_t v77 = vaddq_f64(vcvtq_f64_f32(v71), _Q14);
          __asm { FMOV            V14.2D, #0.5 }

          _Q9 = vmulq_f64(v77, _Q14);
          *(float *)_Q14.f64 = vmlad_n_f64(v68, v65, _Q9.f64[0]);
          __asm { FMLA            D12, D29, V9.D[1] }

          *(float *)&_D12 = _D12;
          v69[1].i32[0] = LODWORD(_Q14.f64[0]);
          v69[1].i32[1] = LODWORD(_D12);
          v69[2] = v71;
          v69[3] = vcvt_f32_f64(_Q9);
          v25 += 2LL;
          v69 += 4;
        }

        while (v25 != 28);
        float v81 = v24.__sinval * v22;
        float v82 = v24.__sinval * v23;
        float v83 = v138 - v62;
        float v84 = v139 - v81;
        float v85 = (float)(v139 - v81) - v63;
        if (mMeshType == 1)
        {
          float v86 = v83 + v137 * sinval;
          float v87 = v84 + v31 * cosval;
          float v178 = v86;
          float v179 = v87;
          float v88 = v83 + v135 * sinval;
          float v89 = v84 + v32 * cosval;
          float v182 = v88;
          float v183 = v89;
          float v180 = v44;
          float v181 = v38 + v32 * v24.__cosval;
          float v184 = v83 - v82;
          float v185 = v63 + v84;
          float v186 = v83 - v82;
          float v187 = v63 + v84;
          float v188 = v44;
          float v189 = v181;
          float v90 = v131 - v82;
          double v91 = v63;
          float v92 = v38 + v63;
          float v190 = v90;
          float v191 = v92;
          double v93 = (float)(v62 + v138);
          double v94 = v93 + v135 * sinval;
          double v95 = v93 + v137 * sinval;
          *(float *)&double v93 = v49 - v82;
          float v96 = v51 + v63;
          int v194 = LODWORD(v93);
          float v195 = v96;
          *(float *)&double v93 = v81 + v139;
          double v97 = (float)(v81 + v139);
          double v98 = v97 + v32 * cosval;
          double v99 = v97 + v31 * cosval;
          float v198 = (float)(v62 + v138) - v82;
          float v196 = v198;
          float v197 = v63 + *(float *)&v93;
          float v199 = v63 + *(float *)&v93;
          float v200 = v53;
          float v192 = v53;
          float v193 = v55;
          float v201 = v55;
          float v100 = v94;
          *(float *)&double v98 = v98;
          float v202 = v100;
          int v203 = LODWORD(v98);
          *(float *)&double v98 = v95;
          *(float *)&double v99 = v99;
          int v206 = LODWORD(v98);
          int v207 = LODWORD(v99);
          float v210 = v82 + (float)(v62 + v138);
          float v208 = v210;
          float v209 = *(float *)&v93 - v63;
          float v211 = *(float *)&v93 - v63;
          float v212 = v50;
          float v204 = v50;
          float v205 = v52;
          float v213 = v52;
          float v101 = v49 + v82;
          *(float *)&double v99 = v51 - v91;
          float v214 = v101;
          int v215 = LODWORD(v99);
          float v216 = v36;
          float v176 = v36;
          float v177 = v39;
          float v217 = v39;
          float v102 = v131 + v82;
          float v103 = v38 - v91;
          float v218 = v102;
          float v219 = v103;
          float v220 = v24.__sinval;
          float v174 = v24.__sinval;
          float v175 = v85;
          float v221 = v85;
          __int128 v147 = xmmword_1FBBE0;
          __asm { FMOV            V0.4S, #1.0 }

          __int128 v154 = _Q0;
          __int128 v164 = xmmword_1FBBF0;
          float v145 = v57;
          *((float *)&v146 + 1) = v57;
          float v148 = v132;
          float v149 = v57;
          float v151 = v58;
          float v152 = v57;
          float v156 = v58;
          float v157 = v57;
          float v159 = v57;
          float v160 = v58;
          float v153 = v58;
          float v165 = v58;
          float v166 = v56;
          float v167 = v58;
          float v163 = v56;
          float v141 = v132;
          float v142 = v56;
          float v161 = v56;
          float v169 = v132;
          float v170 = v56;
          *((float *)&v143 + 1) = v56;
          float v144 = v132;
          *(float *)&uint64_t v150 = v132;
          float v171 = v132;
          __asm { FMOV            V0.2S, #-1.0 }

          uint64_t v140 = _Q0;
          uint64_t v172 = _Q0;
          LODWORD(v143) = -1082130432;
          LODWORD(v146) = -1082130432;
          HIDWORD(v150) = 1065353216;
          int v155 = 1065353216;
          int v158 = 1065353216;
          int v162 = 1065353216;
          int v168 = -1082130432;
          int v173 = -1082130432;
          LODWORD(mNumberOfVertices) = self->mNumberOfVertices;
          if ((_DWORD)mNumberOfVertices != self->mOuterOffset)
          {
            unint64_t v106 = 0LL;
            double v107 = self->mSpriteCoordinatesFactor.width;
            double v108 = self->mSpriteCoordinatesFactor.height;
            double v109 = self->mSpriteCoordinatesOffset.x;
            double v110 = self->mSpriteCoordinatesOffset.y;
            v111 = (float *)&v140 + 1;
            do
            {
              float32x2_t *v70 = *(float32x2_t *)(&v174 + 2 * v106);
              float v112 = *(v111 - 1);
              float v113 = *v111;
              double v114 = (v112 + 1.0) * 0.5;
              float32_t v115 = v109 + v114 * v107;
              double v116 = (*v111 + 1.0) * 0.5;
              float32_t v117 = v110 + v116 * v108;
              v70[1].f32[0] = v115;
              v70[1].f32[1] = v117;
              v70[2].f32[0] = v112;
              v70[2].f32[1] = v113;
              float32_t v118 = v114;
              *(float *)&double v114 = v116;
              v70[3].f32[0] = v118;
              v70[3].i32[1] = LODWORD(v114);
              ++v106;
              uint64_t mNumberOfVertices = self->mNumberOfVertices;
              v111 += 2;
              v70 += 4;
            }

            while (v106 < mNumberOfVertices - (unint64_t)self->mOuterOffset);
          }
        }

        else
        {
          float v174 = v24.__sinval;
          float v175 = (float)(v139 - v81) - v63;
          float v176 = v36;
          float v177 = v38 + v31 * v24.__cosval;
          float v178 = v82 + (float)(v62 + v138);
          float v179 = (float)(v81 + v139) - v63;
          float v180 = v49 - v31 * v24.__sinval;
          float v181 = v51 + v31 * v24.__cosval;
          float v182 = (float)(v62 + v138) - v82;
          float v183 = v63 + (float)(v81 + v139);
          float v184 = v49 - v32 * v24.__sinval;
          float v185 = v51 + v32 * v24.__cosval;
          float v186 = v83 - v82;
          float v187 = v63 + v84;
          float v188 = v44;
          float v189 = v38 + v32 * v24.__cosval;
          float v190 = v24.__sinval;
          float v191 = v175;
          float v192 = v36;
          float v193 = v177;
          __asm { FMOV            V0.2S, #-1.0 }

          uint64_t v140 = _D0;
          float v141 = v132;
          float v142 = v56;
          unint64_t v143 = 0xBF8000003F800000LL;
          float v144 = v58;
          float v145 = v56;
          __asm { FMOV            V1.2S, #1.0 }

          uint64_t v146 = _D1;
          *(void *)&__int128 v147 = __PAIR64__(LODWORD(v57), LODWORD(v58));
          *((void *)&v147 + 1) = 0x3F800000BF800000LL;
          float v148 = v132;
          float v149 = v57;
          uint64_t v150 = _D0;
          float v151 = v132;
          float v152 = v56;
          LODWORD(mNumberOfVertices) = self->mNumberOfVertices;
          if ((_DWORD)mNumberOfVertices != self->mOuterOffset)
          {
            unint64_t v121 = 0LL;
            v122 = (float *)&v140 + 1;
            do
            {
              float32x2_t *v70 = *(float32x2_t *)(&v174 + 2 * v121);
              float v123 = *(v122 - 1);
              float v124 = *v122;
              double v125 = (v123 + 1.0) * 0.5;
              float32_t v126 = v68 + v125 * v65;
              double v127 = (*v122 + 1.0) * 0.5;
              float32_t v128 = v67 + v127 * _D29;
              v70[1].f32[0] = v126;
              v70[1].f32[1] = v128;
              v70[2].f32[0] = v123;
              v70[2].f32[1] = v124;
              float32_t v129 = v125;
              *(float *)&double v125 = v127;
              v70[3].f32[0] = v129;
              v70[3].i32[1] = LODWORD(v125);
              ++v121;
              v122 += 2;
              v70 += 4;
            }

            while (v121 < self->mNumberOfVertices - (unint64_t)self->mOuterOffset);
            LODWORD(mNumberOfVertices) = self->mNumberOfVertices;
          }
        }

        uint64_t mVBO = self->mVBO;
        if (!(_DWORD)mVBO)
        {
          glGenBuffers(1, &self->mVBO);
          LODWORD(mNumberOfVertices) = self->mNumberOfVertices;
          uint64_t mVBO = self->mVBO;
        }

        [a3 uploadBuffer:v19 withSize:(32 * mNumberOfVertices) toVertexBuffer2D:mVBO usage:35044];
        free(v19);
        *(_WORD *)&self->mPositionWasUpdated = 0;
      }
    }
  }

- (void)renderImageInner:(id)a3 inContext:(id)a4
{
  if (a3)
  {
    if (self->mPreservesImageAspectRatio) {
      CGFloat v7 = self->mHalfSize.width / self->mHalfSize.height;
    }
    else {
      [a3 aspectRatio];
    }
    *(float *)&CGFloat v7 = v7;
    [a3 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v12 state:v7];
  }

  -[MRCroppingSpriteVBO updateVBOsInContext:](self, "updateVBOsInContext:", a4);
  if (a3) {
    uint64_t mNeedsInSpriteCoordinates = self->mNeedsInSpriteCoordinates | 2LL;
  }
  else {
    uint64_t mNeedsInSpriteCoordinates = self->mNeedsInSpriteCoordinates;
  }
  for (uint64_t i = 1LL; i != 4; ++i)
  {
    id v10 = [a4 imageSetOnTextureUnit:i];
    uint64_t v11 = (1 << i);
    if (!v10) {
      uint64_t v11 = 0LL;
    }
    mNeedsInSpriteCoordinates |= v11;
  }

  [a4 setVertexBuffer2D:self->mVBO withFeatures:mNeedsInSpriteCoordinates];
  [a4 drawTriangleStripFromOffset:0 count:self->mMiddleOffset];
  [a4 unsetVertexPointer];
  if (a3) {
    [a3 unsetOnContext:a4 onTextureUnit:0 state:&v12];
  }
}

- (void)renderImageMiddle:(id)a3 inContext:(id)a4
{
  if (self->mInnerRect.origin.x != self->mOuterRect.origin.x
    || self->mInnerRect.origin.y != self->mOuterRect.origin.y
    || self->mInnerRect.size.width != self->mOuterRect.size.width
    || self->mInnerRect.size.height != self->mOuterRect.size.height)
  {
    if (a3)
    {
      if (self->mPreservesImageAspectRatio) {
        CGFloat v7 = self->mHalfSize.width / self->mHalfSize.height;
      }
      else {
        [a3 aspectRatio];
      }
      *(float *)&CGFloat v7 = v7;
      [a3 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v12 state:v7];
    }

    -[MRCroppingSpriteVBO updateVBOsInContext:](self, "updateVBOsInContext:", a4);
    if (a3) {
      uint64_t mNeedsInSpriteCoordinates = self->mNeedsInSpriteCoordinates | 2LL;
    }
    else {
      uint64_t mNeedsInSpriteCoordinates = self->mNeedsInSpriteCoordinates;
    }
    for (uint64_t i = 1LL; i != 4; ++i)
    {
      id v10 = [a4 imageSetOnTextureUnit:i];
      uint64_t v11 = (1 << i);
      if (!v10) {
        uint64_t v11 = 0LL;
      }
      mNeedsInSpriteCoordinates |= v11;
    }

    [a4 setVertexBuffer2D:self->mVBO withFeatures:mNeedsInSpriteCoordinates];
    [a4 drawTriangleStripFromOffset:self->mMiddleOffset count:self->mOuterOffset - (unint64_t)self->mMiddleOffset];
    [a4 unsetVertexPointer];
    if (a3) {
      [a3 unsetOnContext:a4 onTextureUnit:0 state:&v12];
    }
  }

- (void)renderImageOuter:(id)a3 inContext:(id)a4
{
  if (self->mInnerRect.origin.x != 0.0
    || self->mInnerRect.origin.y != 0.0
    || self->mInnerRect.size.width != 1.0
    || self->mInnerRect.size.height != 1.0)
  {
    if (a3)
    {
      if (self->mPreservesImageAspectRatio) {
        CGFloat v7 = self->mHalfSize.width / self->mHalfSize.height;
      }
      else {
        [a3 aspectRatio];
      }
      *(float *)&CGFloat v7 = v7;
      [a3 setOnContext:a4 onTextureUnit:0 withReferenceAspectRatio:&v12 state:v7];
    }

    -[MRCroppingSpriteVBO updateVBOsInContext:](self, "updateVBOsInContext:", a4);
    if (a3) {
      uint64_t mNeedsInSpriteCoordinates = self->mNeedsInSpriteCoordinates | 2LL;
    }
    else {
      uint64_t mNeedsInSpriteCoordinates = self->mNeedsInSpriteCoordinates;
    }
    for (uint64_t i = 1LL; i != 4; ++i)
    {
      id v10 = [a4 imageSetOnTextureUnit:i];
      uint64_t v11 = (1 << i);
      if (!v10) {
        uint64_t v11 = 0LL;
      }
      mNeedsInSpriteCoordinates |= v11;
    }

    [a4 setVertexBuffer2D:self->mVBO withFeatures:mNeedsInSpriteCoordinates];
    [a4 drawTriangleStripFromOffset:self->mOuterOffset count:self->mNumberOfVertices - (unint64_t)self->mOuterOffset];
    [a4 unsetVertexPointer];
    if (a3) {
      [a3 unsetOnContext:a4 onTextureUnit:0 state:&v12];
    }
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

- (BOOL)preservesImageAspectRatio
{
  return self->mPreservesImageAspectRatio;
}

- (void)setPreservesImageAspectRatio:(BOOL)a3
{
  self->mPreservesImageAspectRatio = a3;
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
  self->uint64_t mNeedsInSpriteCoordinates = a3;
}

- (CGSize)spriteCoordinatesFactor
{
  double width = self->mSpriteCoordinatesFactor.width;
  double height = self->mSpriteCoordinatesFactor.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSpriteCoordinatesFactor:(CGSize)a3
{
  self->mSpriteCoordinatesFactor = a3;
}

- (CGPoint)spriteCoordinatesOffset
{
  double x = self->mSpriteCoordinatesOffset.x;
  double y = self->mSpriteCoordinatesOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSpriteCoordinatesOffset:(CGPoint)a3
{
  self->mSpriteCoordinatesOffset = a3;
}

- (unsigned)meshType
{
  return self->mMeshType;
}

- (void)setMeshType:(unsigned __int8)a3
{
  self->int mMeshType = a3;
}

@end