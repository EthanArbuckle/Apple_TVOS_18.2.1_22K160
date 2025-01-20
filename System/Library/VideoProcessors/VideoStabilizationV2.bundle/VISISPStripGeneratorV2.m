@interface VISISPStripGeneratorV2
- (NSData)ISPStripParams;
- (VISISPStripGeneratorV2)init;
- (__n128)gridSize;
- (__n128)inputSize;
- (__n128)outputSize;
- (int)_configureISPStripTileCount;
- (int)_generateMultipleStripsWithTransforms:(VISISPStripGeneratorV2 *)self transforms3x3:(SEL)a2 validBufferRect:(float *)(a3;
- (int)_generateSingleStripWithTransforms:(VISISPStripGeneratorV2 *)self transforms3x3:(SEL)a2 validBufferRect:(float *)(a3;
- (int)_limitMultipleStripsTransforms:(CGRect)a3 transforms3x3:(float *)(a4;
- (int)generateStripsWithTransforms:(VISISPStripGeneratorV2 *)self transforms3x3:(SEL)a2 validBufferRect:(float *)(a3;
- (int)setup;
- (unsigned)extendedOutputRowsToFill;
- (unsigned)type;
- (void)dealloc;
- (void)setExtendedOutputRowsToFill:(unsigned int)a3;
- (void)setGridSize:(VISISPStripGeneratorV2 *)self;
- (void)setInputSize:(VISISPStripGeneratorV2 *)self;
- (void)setOutputSize:(VISISPStripGeneratorV2 *)self;
- (void)setType:(unsigned int)a3;
@end

@implementation VISISPStripGeneratorV2

- (VISISPStripGeneratorV2)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VISISPStripGeneratorV2;
  result = -[VISISPStripGeneratorV2 init](&v3, "init");
  if (result) {
    result->_isUsing1kLineBuffers = 1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VISISPStripGeneratorV2;
  -[VISISPStripGeneratorV2 dealloc](&v3, "dealloc");
}

- (int)setup
{
  unsigned int v3 = *(unsigned __int16 *)self->_inputSize;
  unsigned int v5 = *(unsigned __int16 *)&self->_inputSize[2];
  int v6 = *(unsigned __int16 *)self->_outputSize;
  signed int v7 = *(unsigned __int16 *)&self->_outputSize[2];
  BOOL v8 = __OFSUB__(v3, v6);
  int v9 = v3 - v6;
  if (v9 < 0 != v8) {
    ++v9;
  }
  int v10 = v9 >> 1;
  int v11 = v5 - v7;
  int v12 = v11 >> 1;
  *(void *)self->_overscanSize = __PAIR64__(v12, v10);
  *(void *)&self->_ispStripOffset[7] = __PAIR64__(v12, v10);
  int result = -[VISISPStripGeneratorV2 _configureISPStripTileCount](self, "_configureISPStripTileCount");
  if (!result)
  {
    int32x2_t v14 = *(int32x2_t *)self->_tileCount;
    int result = -12780;
    if (v14.i32[0] >= 1)
    {
      __int32 v15 = HIDWORD(*(void *)self->_tileCount);
      if (v14.i32[1] >= 1)
      {
        unsigned __int32 v16 = 0;
        int v17 = 0;
        __int16 v18 = 0;
        v19 = &v36[8];
        unsigned int v20 = ((v14.i32[0] + *(unsigned __int16 *)self->_outputSize - 1) / v14.i32[0]) & 0xFFFFFFFE;
        int v21 = (v14.i32[1] + *(unsigned __int16 *)&self->_outputSize[2] - 1) / v14.i32[1];
        do
        {
          unsigned __int32 v22 = v15 - 1;
          unsigned int v23 = v21;
          if (v16 >= v22) {
            unsigned int v23 = self->_extendedOutputRowsToFill - v22 * v21 + *(unsigned __int16 *)&self->_outputSize[2];
          }
          int v24 = *(unsigned __int16 *)&self->_gridSize[2];
          int v25 = (int)(v23 + v24 - 1) / v24;
          if (v25 > 48)
          {
            fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
            FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v2,  v35,  *(const char **)v36,  *(_DWORD *)&v36[8],  *(const char **)&v36[16],  *(const char **)&v36[24],  *(_DWORD *)&v36[32]);
            return FigSignalErrorAt(4294954514LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
          }

          if (v14.i32[0])
          {
            unsigned int v26 = 0;
            __int16 v27 = 0;
            do
            {
              v19[4] = v27;
              v19[5] = v18;
              v19[7] = v23;
              v19[9] = v24;
              v19[8] = v25;
              unsigned int v28 = *(void *)self->_tileCount - 1;
              __int16 v29 = v20;
              if (v26 >= v28) {
                __int16 v29 = *(_WORD *)self->_outputSize - v28 * v20;
              }
              v17 += v25;
              v19[6] = v29;
              v19 += 10;
              v27 += v20;
              ++v26;
              int32x2_t v14 = *(int32x2_t *)self->_tileCount;
            }

            while (v26 < v14.i32[0]);
          }

          __int32 v15 = v14.i32[1];
          v18 += v21;
          ++v16;
        }

        while (v16 < v14.i32[1]);
        *(_WORD *)&v36[4] = vmul_lane_s32(v14, v14, 1).u16[0];
        *(_WORD *)&v36[6] = 0;
        size_t v30 = (36 * v17 + 644);
        self->_ispStripParamsSize = v30;
        v31 = ($B58BB21729F9E7C136B32C123DB0A130 *)malloc(v30);
        self->_ispStripParams = v31;
        if (v31)
        {
          v32 = v31;
          memcpy(v31, &v36[4], sizeof($B58BB21729F9E7C136B32C123DB0A130));
          v33 = (NSData *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  v32,  v30,  0LL));
          ISPStripParams = self->_ISPStripParams;
          self->_ISPStripParams = v33;

          return 0;
        }

        else
        {
          return -12786;
        }
      }
    }
  }

  return result;
}

- (int)generateStripsWithTransforms:(VISISPStripGeneratorV2 *)self transforms3x3:(SEL)a2 validBufferRect:(float *)(a3
{
  if (self->_type == 1) {
    return -[VISISPStripGeneratorV2 _generateSingleStripWithTransforms:transforms3x3:validBufferRect:]( self,  "_generateSingleStripWithTransforms:transforms3x3:validBufferRect:",  a3,  a4.origin.x,  a4.origin.y,  a4.size.width,  a4.size.height);
  }
  else {
    return -[VISISPStripGeneratorV2 _generateMultipleStripsWithTransforms:transforms3x3:validBufferRect:]( self,  "_generateMultipleStripsWithTransforms:transforms3x3:validBufferRect:",  a3,  a4.origin.x,  a4.origin.y,  a4.size.width,  a4.size.height);
  }
}

- (int)_configureISPStripTileCount
{
  *(void *)self->_tileCount = 0x100000001LL;
  if (self->_type != 2) {
    return 0;
  }
  unsigned int v3 = *(unsigned __int16 *)self->_inputSize;
  unsigned int v4 = *(unsigned __int16 *)&self->_inputSize[2];
  signed int v5 = *(unsigned __int16 *)self->_outputSize;
  BOOL isUsing1kLineBuffers = self->_isUsing1kLineBuffers;
  double v7 = sqrt((double)(int)(v4 * v4 + v3 * v3));
  double v8 = (double)v4;
  double v9 = dbl_37900[v5 < 0x781];
  double v10 = asin(v9 * (double)v4 / v7);
  double v11 = asin(v8 / v7);
  double v12 = sin(v10 - v11);
  uint64_t v13 = 0LL;
  double v14 = (double)v3 / v9 * v12;
  double v15 = 42.0;
  if (!isUsing1kLineBuffers) {
    double v15 = 21.0;
  }
  double v16 = v14 / v15;
  double v17 = 1024.0;
  if (!isUsing1kLineBuffers) {
    double v17 = 2048.0;
  }
  signed int v18 = vcvtpd_s64_f64(fmax((double)v3 * 1.8 / v17, v16));
  LODWORD(v16) = 0;
  *(void *)self->_tileCount = 0x100000000LL;
  while (1)
  {
    int v19 = dword_3793C[v13];
    if (v19 >= v18 && !((v5 % v19) | (v5 / v19) & 0xF)) {
      break;
    }
    if (++v13 == 5) {
      goto LABEL_13;
    }
  }

  *(_DWORD *)self->_tileCount = v19;
  double v16 = *(double *)self->_tileCount;
LABEL_13:
  if (LODWORD(v16)) {
    return 0;
  }
  else {
    return -12782;
  }
}

- (int)_generateSingleStripWithTransforms:(VISISPStripGeneratorV2 *)self transforms3x3:(SEL)a2 validBufferRect:(float *)(a3
{
  ispStripParams = self->_ispStripParams;
  if (!ispStripParams || ispStripParams->var0 != 1) {
    return -12780;
  }
  *(_DWORD *)&ispStripParams->var3[0].var0 = 0;
  *(_DWORD *)&ispStripParams->var3[0].var2 = *(_DWORD *)self->_inputSize;
  if (ispStripParams->var3[0].var8)
  {
    unint64_t v7 = 0LL;
    unint64_t v8 = 0LL;
    do
    {
      _mapTransform2TileCoordinates( (__int128 *)&(*a3)[v7 / 4],  (__int16)ispStripParams->var3[0].var0,  (__int16)ispStripParams->var3[0].var1,  (__int16)(*(void *)&self->_ispStripOffset[7] + ispStripParams->var3[0].var4),  (__int16)(HIDWORD(*(void *)&self->_ispStripOffset[7]) + ispStripParams->var3[0].var5),  (uint64_t)self->_ispStripParams->var4[v7 / 0x24]);
      ++v8;
      v7 += 36LL;
    }

    while (v8 < ispStripParams->var3[0].var8);
  }

  return 0;
}

- (int)_generateMultipleStripsWithTransforms:(VISISPStripGeneratorV2 *)self transforms3x3:(SEL)a2 validBufferRect:(float *)(a3
{
  int v5 = 0;
  if (a3)
  {
    double y = a4.origin.y;
    int32x2_t v7 = vceqz_s32(*(int32x2_t *)&a4.origin.x);
    if ((vorr_s8((int8x8_t)v7, (int8x8_t)vdup_lane_s32(v7, 1)).u8[0] & 1) == 0)
    {
      double v8 = v4;
      double height = a4.size.height;
      double width = a4.size.width;
      ispStripParams = self->_ispStripParams;
      if (LOBYTE(ispStripParams->var0))
      {
        int v13 = 0;
        int v39 = 0;
        var3 = ispStripParams->var3;
        while (1)
        {
          v38 = ispStripParams;
          unsigned int var5 = var3->var5;
          unsigned int var9 = var3->var9;
          if (var3->var5) {
            int v17 = var5 / var9;
          }
          else {
            int v17 = 0;
          }
          signed int v18 = (__int128 *)&(*a3)[9 * v17];
          a4.origin.x = *(CGFloat *)&self->_ispStripOffset[7];
          int v40 = *(unsigned __int16 *)self->_inputSize;
          int v41 = *(unsigned __int16 *)&self->_inputSize[2];
          if (self->_isUsing1kLineBuffers) {
            int v19 = 1024;
          }
          else {
            int v19 = 2048;
          }
          unsigned int v42 = v19;
          LOWORD(v44) = var3->var4 + LOWORD(a4.origin.x);
          int v20 = WORD2(a4.origin.x) + var5;
          WORD2(v44) = v20;
          WORD1(v44) = v44 + var3->var6 - 1;
          __int16 v21 = v20 - 1;
          unsigned int v22 = var9 + v20 - 1;
          HIWORD(v44) = var9 + v20 - 1;
          unint64_t v43 = 0x80007FFF80007FFFLL;
          unsigned int var8 = var3->var8;
          uint64_t v24 = var8 - 1;
          if (var8 != 1)
          {
            int v25 = (float *)v18;
            do
            {
              _updateTileBoundingBox(v25, &v44, &v43, (int8x16_t)a4.origin);
              WORD2(v44) = v22 + 1;
              v22 += var9;
              HIWORD(v44) = v22;
              v25 += 9;
              --v24;
            }

            while (v24);
          }

          HIWORD(v44) = var3->var7 + v21;
          _updateTileBoundingBox((float *)v18 + 9 * var8 - 9, &v44, &v43, (int8x16_t)a4.origin);
          __int16 v26 = v40 - 1;
          int v27 = (WORD2(v43) - 5) & ~((__int16)(WORD2(v43) - 5) >> 15);
          __int16 v28 = v41 - 1;
          unsigned __int16 v29 = (v43 - 5) & ~((__int16)(v43 - 5) >> 15) & 0x7FE0;
          var3->var0 = v29;
          __int16 v30 = v27 & 0x7FFE;
          var3->var1 = v30;
          unsigned int v31 = (v26 - v29 + 31) & 0xFFE0;
          var3->var2 = v31;
          var3->var3 = (v28 - v30 + 1) & 0xFFFE;
          if (v42 < v31) {
            break;
          }
          if (var3->var8)
          {
            unint64_t v32 = 0LL;
            uint64_t v33 = 36LL * v39 + 644;
            do
            {
              _mapTransform2TileCoordinates( v18,  (__int16)var3->var0,  (__int16)var3->var1,  (__int16)(*(void *)&self->_ispStripOffset[7] + var3->var4),  (__int16)(HIDWORD(*(void *)&self->_ispStripOffset[7]) + var3->var5),  (uint64_t)self->_ispStripParams + v33);
              ++v32;
              v33 += 36LL;
              signed int v18 = (__int128 *)((char *)v18 + 36);
            }

            while (v32 < var3->var8);
            v39 += v32;
            ispStripParams = self->_ispStripParams;
          }

          else
          {
            ispStripParams = v38;
          }

          ++var3;
        }

        uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        int v5 = -12782;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< VISISPStripGeneratorV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "VISISPStripGeneratorV2.m",  392LL,  -12782);
      }

      else
      {
LABEL_25:
        int v5 = -[VISISPStripGeneratorV2 _limitMultipleStripsTransforms:transforms3x3:]( self,  "_limitMultipleStripsTransforms:transforms3x3:",  a3,  y,  width,  height,  v8);
        if (v5)
        {
          uint64_t v36 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v36,  "<<<< VISISPStripGeneratorV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "VISISPStripGeneratorV2.m",  412LL,  v5);
        }
      }
    }
  }

  return v5;
}

- (int)_limitMultipleStripsTransforms:(CGRect)a3 transforms3x3:(float *)(a4
{
  ispStripParams = self->_ispStripParams;
  unsigned int var0 = ispStripParams->var0;
  if (ispStripParams->var0)
  {
    int v7 = 0;
    int result = 0;
    p_unsigned int var0 = &ispStripParams->var3[0].var0;
    float y = a3.origin.y;
    float v11 = a3.origin.y + a3.size.height + -1.0;
    double v12 = &(*a4)[4];
    float v13 = 21.0;
    while (1)
    {
      uint64_t v14 = *(void *)&self->_ispStripOffset[7];
      int v15 = HIDWORD(v14) + p_var0[5];
      int v16 = *(_DWORD *)&self->_overscanSize[4];
      BOOL v17 = __OFSUB__(v15, v16);
      int v18 = v15 - v16;
      int v19 = (v18 < 0) ^ v17 | (v18 == 0) ? 0 : v18 / p_var0[9];
      if (p_var0[8]) {
        break;
      }
LABEL_42:
      p_var0 += 10;
      if (++v7 >= var0) {
        return result;
      }
    }

    unsigned int v20 = 0;
    int v21 = v14 + p_var0[4];
    int v22 = p_var0[6] + v21 - 1;
    float v23 = (float)v21;
    float v24 = (float)v22;
    float v25 = (float)(v22 + v21) * 0.5;
    __int16 v26 = &v12[9 * v19];
    while (1)
    {
      if (y >= v11)
      {
        uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v57) = 0;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< VISISPStripGeneratorV2 >>>> Fig",  "yMinBound < yMaxBound",  "bail",  0LL,  "VISISPStripGeneratorV2.m",  687LL,  v57);
LABEL_36:
        float v13 = 21.0;
        int result = -12780;
        goto LABEL_40;
      }

      if (v21 >= v22)
      {
        uint64_t v55 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v57) = 0;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v55,  "<<<< VISISPStripGeneratorV2 >>>> Fig",  "xLeft < xRight",  "bail",  0LL,  "VISISPStripGeneratorV2.m",  688LL,  v57);
        goto LABEL_36;
      }

      if (self->_isUsing1kLineBuffers) {
        float v27 = 42.0;
      }
      else {
        float v27 = v13;
      }
      float v28 = (float)v15;
      float v29 = v26[2];
      float v30 = v26[4] + (float)(v26[3] * (float)v15);
      float v31 = v30 + (float)(v29 * v23);
      float v32 = v30 + (float)(v29 * v24);
      float v33 = fabsf(v32);
      if (fabsf(v31) <= 0.00000011921 || v33 <= 0.00000011921)
      {
        uint64_t v53 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v57) = 0;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v53,  "<<<< VISISPStripGeneratorV2 >>>> Fig",  "fabsf( zLeft) > 1.19209290e-7F && __tg_fabs((__typeof__(__tg_promote(zRight)))(zRight)) > 1.19209290e-7F",  "bail",  0LL,  "VISISPStripGeneratorV2.m",  697LL,  v57);
LABEL_38:
        float v13 = 21.0;
LABEL_39:
        int result = 0;
        goto LABEL_40;
      }

      float v35 = *v26;
      float v36 = v26[1];
      float v37 = v36 + (float)(*v26 * v28);
      float v38 = *(v26 - 1);
      float v39 = (float)(v37 + (float)(v38 * v23)) / v31;
      float v40 = (float)(v37 + (float)(v38 * v24)) / v32;
      if (vabds_f32(v40, v39) <= v27) {
        goto LABEL_39;
      }
      float v41 = (float)(v31 * (float)((float)v22 - v25)) - (float)(v32 * (float)((float)v21 - v25));
      if (fabsf(v41) <= 0.00000011921)
      {
        uint64_t v56 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v57) = 0;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v56,  "<<<< VISISPStripGeneratorV2 >>>> Fig",  "fabsf( denom) > 1.19209290e-7F",  "bail",  0LL,  "VISISPStripGeneratorV2.m",  736LL,  v57);
        goto LABEL_38;
      }

      float v42 = v27 + -0.001;
      if (v40 <= v39) {
        float v42 = -v42;
      }
      *(v26 - 1) = v43;
      float v44 = v36 + (float)((float)(v38 - v43) * v25);
      v26[1] = v44;
      float v45 = v44 + (float)(v35 * v28);
      float v46 = (float)(v45 + (float)(v43 * v23)) / v31;
      float v47 = (float)(v45 + (float)(v43 * v24)) / v32;
      if (v46 >= v47)
      {
        if (v47 >= y)
        {
          if (v46 <= v11) {
            goto LABEL_39;
          }
          int result = 0;
          float v48 = -(float)(v43 * v23);
          float v49 = v11 + -0.5;
          goto LABEL_31;
        }

        int result = 0;
        float v50 = -(float)(v43 * v24);
        float v51 = y + 0.5;
      }

      else
      {
        if (v46 < y)
        {
          int result = 0;
          float v48 = -(float)(v43 * v23);
          float v49 = y + 0.5;
LABEL_31:
          float v52 = v48 + (float)(v49 * v31);
          goto LABEL_32;
        }

        if (v47 <= v11) {
          goto LABEL_39;
        }
        int result = 0;
        float v50 = -(float)(v43 * v24);
        float v51 = v11 + -0.5;
      }

      float v52 = v50 + (float)(v51 * v32);
LABEL_32:
      v26[1] = v52 - (float)(v35 * v28);
LABEL_40:
      v15 += p_var0[9];
      ++v20;
      v26 += 9;
      if (v20 >= p_var0[8])
      {
        unsigned int var0 = self->_ispStripParams->var0;
        goto LABEL_42;
      }
    }
  }

  return 0;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (__n128)inputSize
{
  LOWORD(v1) = *(_WORD *)(a1 + 56);
  WORD2(v1) = *(_WORD *)(a1 + 58);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (void)setInputSize:(VISISPStripGeneratorV2 *)self
{
  *(_DWORD *)self->_inputSize = v2;
}

- (__n128)outputSize
{
  LOWORD(v1) = *(_WORD *)(a1 + 60);
  WORD2(v1) = *(_WORD *)(a1 + 62);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (void)setOutputSize:(VISISPStripGeneratorV2 *)self
{
  *(_DWORD *)self->_outputSize = v2;
}

- (__n128)gridSize
{
  LOWORD(v1) = *(_WORD *)(a1 + 64);
  WORD2(v1) = *(_WORD *)(a1 + 66);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (void)setGridSize:(VISISPStripGeneratorV2 *)self
{
  *(_DWORD *)self->_gridSize = v2;
}

- (unsigned)extendedOutputRowsToFill
{
  return self->_extendedOutputRowsToFill;
}

- (void)setExtendedOutputRowsToFill:(unsigned int)a3
{
  self->_extendedOutputRowsToFill = a3;
}

- (NSData)ISPStripParams
{
  return self->_ISPStripParams;
}

- (void).cxx_destruct
{
}

@end