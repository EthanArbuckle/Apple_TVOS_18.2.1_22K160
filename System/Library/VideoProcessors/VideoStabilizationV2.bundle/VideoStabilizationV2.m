#error "1C94: call analysis failed (funcsize=43)"
int __cdecl -[VISProcessorV2 enqueueBufferForProcessing:](VISProcessorV2 *self, SEL a2, opaqueCMSampleBuffer *a3)
{
  const char *v3;
  id WeakRetained;
  int v7;
  const char *v9;
  const char *v10;
  int v11;
  const char *v12;
  const char *v13;
  int v14;
  if (!self->_visWrapper) {
    return -12780;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v7 = -12780;
  if (a3 && WeakRetained)
  {
    -[VISWrapper setLongPressModeEnabled:](self->_visWrapper, "setLongPressModeEnabled:", self->_longPressModeEnabled);
    -[VISWrapper setFlipHorizontalOrientationEnabled:]( self->_visWrapper,  "setFlipHorizontalOrientationEnabled:",  self->_flipHorizontalOrientationEnabled);
    v7 = -[VISWrapper enqueueBufferForProcessing:](self->_visWrapper, "enqueueBufferForProcessing:", a3);
    if (v7)
    {
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", v7, v3, v9, v10, v11, v12, v13, v14);
    }

    else
    {
      self->_buffersEnqueued = 1;
    }
  }

  return v7;
}

#error "1EBC: call analysis failed (funcsize=29)"
int __cdecl -[VISProcessorV2 process](VISProcessorV2 *self, SEL a2)
{
  return 0;
}
}

LABEL_30:
    result = -12786;
  }

  else
  {
LABEL_26:
    result = 0;
  }

  self->_size = a3;
  return result;
}

    *a8 = -1;
    return -12780;
  }

  if ((uint64_t)a3 <= 59)
  {
    if (a3 == 30)
    {
      result = 0;
      v11 = 3;
      goto LABEL_52;
    }

    if (a3 == 55)
    {
      result = 0;
      v11 = 45;
LABEL_52:
      *a8 = v11;
      v12 = 1;
      goto LABEL_53;
    }

    goto LABEL_30;
  }

  if (a3 == 60)
  {
    result = 0;
    if (!a4)
    {
      v11 = 6;
      goto LABEL_52;
    }

    v15 = 5;
    goto LABEL_55;
  }

  if (a3 != 80) {
    goto LABEL_30;
  }
  if (!a4 || a5)
  {
    result = 0;
    if (a5)
    {
      v11 = 9;
      goto LABEL_52;
    }

    v15 = 1;
LABEL_55:
    *a8 = v15;
    v12 = 2;
    goto LABEL_53;
  }

  result = 0;
  *a8 = 0;
  v12 = 4;
LABEL_53:
  *a7 = v12;
  return result;
}

uint64_t GVSExtractGDCPolynomialFromCameraInfoByPortType(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  v7 = v6;
  if (!v5 || !v6)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "Fig",  "cameraInfoByPortType && metadataDict",  "bail",  0LL,  "GVSDistortionUtilities.m",  124LL,  0);
LABEL_16:
    uint64_t v22 = FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    goto LABEL_13;
  }

  if (!a3)
  {
    uint64_t v25 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v25,  "Fig",  "gdcPolynomial",  "bail",  0LL,  "GVSDistortionUtilities.m",  125LL,  0);
    goto LABEL_16;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:kFigCaptureStreamMetadata_PortType]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kFigCaptureCameraInfoKey_GeometricDistortionCoefficients]);
  v11 = v10;
  if (!v9)
  {
    uint64_t v26 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v26,  "Fig",  "cameraInfoDict",  "bail",  0LL,  "GVSDistortionUtilities.m",  133LL,  0);
LABEL_19:
    uint64_t v22 = FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);

    goto LABEL_13;
  }

  if (!v10)
  {
    uint64_t v27 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v27,  "Fig",  "gdcDict",  "bail",  0LL,  "GVSDistortionUtilities.m",  134LL,  0);
    goto LABEL_19;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:kFigCaptureStreamGDCCoefficientsKey_BasePolynomial]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kFigCaptureStreamGDCCoefficientsKey_DynamicPolynomial]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:kFigCaptureStreamMetadata_DynamicDistortionFactor]);

  if ([v12 length] != &stru_20.vmsize)
  {
    uint64_t v28 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v28,  "Fig",  "basePolynomialData.length == sizeof( FigCaptureGDCPolynomial)",  "bail",  0LL,  "GVSDistortionUtilities.m",  147LL,  0);
LABEL_22:
    uint64_t v22 = FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);

    goto LABEL_13;
  }

  if ([v13 length] != &stru_20.vmsize)
  {
    uint64_t v29 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v29,  "Fig",  "dynamicPolynomialData.length == sizeof( FigCaptureGDCPolynomial)",  "bail",  0LL,  "GVSDistortionUtilities.m",  148LL,  0);
    goto LABEL_22;
  }

  id v15 = v12;
  v16 = (char *)[v15 bytes];
  id v17 = v13;
  v18 = (char *)[v17 bytes];
  [v14 floatValue];
  for (uint64_t i = 0LL; i != 32; i += 4LL)
  {
    v21 = (float *)(a3 + 32 + i);
    *(v21 - 8) = *(float *)&v16[i] + (float)(v19 * *(float *)&v18[i]);
    float *v21 = *(float *)&v16[i + 32] + (float)(v19 * *(float *)&v18[i + 32]);
  }

  uint64_t v22 = 0LL;
LABEL_13:

  return v22;
}

uint64_t GVSApplyDistortionToTransforms(int32x2_t *a1, id *a2, uint64_t a3)
{
  if (!a1)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "Fig",  "transformContext",  "bail",  0LL,  "GVSDistortionUtilities.m",  169LL,  0);
LABEL_26:
    uint64_t v34 = FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    v7 = 0LL;
    id v5 = 0LL;
    goto LABEL_22;
  }

  if (!a2)
  {
    uint64_t v37 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v37,  "Fig",  "distortionData",  "bail",  0LL,  "GVSDistortionUtilities.m",  170LL,  0);
    goto LABEL_26;
  }

  if (!a3)
  {
    uint64_t v38 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v38,  "Fig",  "outVectors",  "bail",  0LL,  "GVSDistortionUtilities.m",  171LL,  0);
    goto LABEL_26;
  }

  id v5 = *a2;
  id v6 = a2[1];
  v7 = v6;
  if (v6)
  {
    unsigned int v8 = [v6 isValid];
    if (v5)
    {
LABEL_6:
      unsigned int v9 = [v5 isValid];
      goto LABEL_9;
    }
  }

  else
  {
    unsigned int v8 = 0;
    if (v5) {
      goto LABEL_6;
    }
  }

  unsigned int v9 = 0;
LABEL_9:
  if ((v8 | v9) == 1)
  {
    [v7 distortionCenter];
    float v43 = v10;
    [v7 distortionCenter];
    float v39 = v11;
    [v5 distortionCenter];
    __int128 v40 = v12;
    [v5 distortionCenter];
    int v14 = a1[7].i32[0];
    if (v14 >= 1)
    {
      int v15 = 0;
      int v16 = 0;
      int32x2_t v17 = vadd_s32(vadd_s32(a1[1], a1[2]), (int32x2_t)-1LL);
      double v18 = v43;
      *((void *)&v19 + 1) = *((void *)&v40 + 1);
      double v20 = v13;
      int v21 = a1[6].i32[1];
      unsigned int v41 = HIDWORD(*(void *)&a1[1]);
      unsigned int v22 = a1[1];
      do
      {
        if (v21 >= 1)
        {
          int v23 = 0;
          int32x2_t v24 = (int32x2_t)__PAIR64__(v41, v22);
          uint64_t v25 = (float *)(a3 + 36LL * v15);
          do
          {
            *(int32x2_t *)&__int128 v19 = vmin_s32(v24, v17);
            __int128 v44 = v19;
            if (v8)
            {
              [v7 computeInverseScalingAtPoint:COERCE_DOUBLE(vcvt_f32_s32(*(int32x2_t *)&v19))];
              *(double *)v26.i64 = v18;
              FigMotionApplyDigitalZoomToTransform(1, v25, v27, v26, v39, v28, v29);
              __int128 v19 = v44;
            }

            if (v9)
            {
              float v45 = (float)SDWORD1(v19);
              float v46 = (float)(int)v19;
              GVSComputePerspectiveProjectedPoint(v25, &v46, &v45, (float)(int)v19, (float)SDWORD1(v19));
              objc_msgSend(v5, "computeScalingAtPoint:", COERCE_DOUBLE(__PAIR64__(LODWORD(v45), LODWORD(v46))));
              *(double *)v30.i64 = *(float *)&v40;
              FigMotionApplyDigitalZoomToTransform(0, v25, v31, v30, v20, v32, v33);
              __int128 v19 = v44;
            }

            ++v23;
            int v21 = a1[6].i32[1];
            v24.i32[0] = v19;
            v24.i32[1] = a1[7].i32[1] + DWORD1(v19);
            v25 += 9;
          }

          while (v23 < v21);
          v15 += v23;
          int v14 = a1[7].i32[0];
          unsigned int v22 = v19;
        }

        ++v16;
        v22 += a1[8].u32[0];
      }

      while (v16 < v14);
    }
  }

  uint64_t v34 = 0LL;
LABEL_22:

  return v34;
}

uint64_t GVSCheckDistortedTransformFits(float *a1, double *a2, int *a3, uint64_t a4, char a5, BOOL *a6)
{
  if (a1 && a2 && a3 && a4 && a6)
  {
    __asm { FMOV            V0.4S, #1.0 }

    float32x4_t v73 = _Q0;
    if (!*(_BYTE *)(a4 + 208))
    {
      uint64_t v16 = 0LL;
      float v17 = (float)*a3;
      float v18 = (float)a3[1];
      float v19 = (float)(v17 + (float)a3[2]) + -1.0;
      float v20 = (float)(v18 + (float)a3[3]) + -1.0;
      float v21 = (float)(v19 - v17) / 6.0;
      float v22 = (float)(v20 - v18) / 6.0;
      int v23 = (_OWORD *)(a4 + 32);
      do
      {
        *(float *)&__int128 v24 = v17 + (float)(v21 * (float)(int)v16);
        *((float *)&v24 + 1) = v19;
        *((float *)&v24 + 2) = v17;
        *(float *)&__int128 v25 = v18;
        *((float *)&v24 + 3) = v19 + (float)((float)-v21 * (float)(int)v16);
        *((float *)&v25 + 1) = v18 + (float)(v22 * (float)(int)v16);
        *((float *)&v25 + 2) = v20 + (float)((float)-v22 * (float)(int)v16);
        *((float *)&v25 + 3) = v20;
        *(v23 - 1) = v24;
        *int v23 = v25;
        ++v16;
        v23 += 2;
      }

      while (v16 != 6);
      if ([*(id *)(a4 + 8) isValid])
      {
        for (uint64_t i = 0LL; i != 192; i += 32LL)
        {
          int8x16_t v27 = (float32x4_t *)(a4 + i);
          objc_msgSend( *(id *)(a4 + 8),  "computeScalingAtPointsQuad:",  *(double *)(a4 + i + 16),  *(double *)(a4 + i + 32));
          float32x4_t v77 = v28;
          float32x4_t v79 = vsubq_f32(v73, v28);
          [*(id *)(a4 + 8) distortionCenter];
          float32x4_t v75 = vmulq_n_f32(v79, v29);
          [*(id *)(a4 + 8) distortionCenter];
          float32x4_t v31 = *(float32x4_t *)(a4 + i + 32);
          v27[1] = vmlaq_f32(v75, v77, v27[1]);
          v27[2] = vmlaq_f32(vmulq_lane_f32(v79, v30, 1), v77, v31);
        }
      }

      *(_BYTE *)(a4 + 208) = 1;
    }

    v32.i64[0] = 0x3F0000003F000000LL;
    v32.i64[1] = 0x3F0000003F000000LL;
    float32x4_t v33 = vaddq_f32(*(float32x4_t *)(a4 + 224), v32);
    double v34 = a2[1];
    float v35 = *a2;
    float v36 = v33.f32[3] + v35;
    v32.f32[0] = *a2 + a2[2];
    float v37 = (float)(v32.f32[0] + -1.0) - v33.f32[1];
    v32.f32[0] = v34;
    float v38 = v33.f32[0] + v32.f32[0];
    v32.f32[0] = v34 + a2[3];
    float v39 = (float)(v32.f32[0] + -1.0) - v33.f32[2];
    [*(id *)a4 distortionCenter];
    float v70 = v40;
    [*(id *)a4 distortionCenter];
    float32x2_t v67 = v41;
    unint64_t v42 = 0LL;
    float v43 = (float32x4_t *)(a4 + 32);
    float32x4_t v76 = (float32x4_t)vdupq_n_s32(0x322BCC77u);
    while (1)
    {
      float32x4_t v44 = v43[-1];
      float v45 = a1 + 8;
      float32x4_t v46 = vld1q_dup_f32(v45);
      float32x4_t v47 = vmlaq_n_f32(vmlaq_n_f32(v46, *v43, a1[7]), v44, a1[6]);
      v48.i64[0] = 0x8000000080000000LL;
      v48.i64[1] = 0x8000000080000000LL;
      float32x4_t v49 = (float32x4_t)vbslq_s8(v48, (int8x16_t)v47, (int8x16_t)vmaxnmq_f32(vabsq_f32(v47), v76));
      float32x4_t v50 = vrecpeq_f32(v49);
      float32x4_t v51 = vmulq_f32(v50, vrecpsq_f32(v49, v50));
      float32x4_t v52 = vmulq_f32(v51, vrecpsq_f32(v49, v51));
      v53 = a1 + 2;
      float32x4_t v54 = vld1q_dup_f32(v53);
      float32x4_t v55 = vmulq_f32(v52, vmlaq_n_f32(vmlaq_n_f32(v54, *v43, a1[1]), v44, *a1));
      v56 = a1 + 5;
      float32x4_t v57 = vld1q_dup_f32(v56);
      float32x4_t v78 = vmulq_f32(v52, vmlaq_n_f32(vmlaq_n_f32(v57, *v43, a1[4]), v44, a1[3]));
      float32x4_t v80 = v55;
      if ([*(id *)a4 isValid])
      {
        objc_msgSend(*(id *)a4, "computeScalingAtPointsQuad:", *(double *)v80.i64, *(double *)v78.i64);
        float32x4_t v59 = vsubq_f32(v73, v58);
        float32x4_t v60 = vmlaq_f32(vmulq_n_f32(v59, v70), v58, v80);
        float32x4_t v61 = vmlaq_f32(vmulq_lane_f32(v59, v67, 1), v58, v78);
      }

      else
      {
        float32x4_t v61 = v78;
        float32x4_t v60 = v80;
      }

      float v62 = vmaxvq_f32(v60);
      if (v36 >= vminvq_f32(v60) || v62 >= v37) {
        break;
      }
      BOOL v64 = v38 < vminvq_f32(v61);
      if (vmaxvq_f32(v61) >= v39) {
        BOOL v64 = 0;
      }
      *a6 = v64;
      if (v64 && v42 <= 4)
      {
        ++v42;
        v43 += 2;
        if ((a5 & 1) == 0) {
          continue;
        }
      }

      return 0LL;
    }

    *a6 = 0;
    return 0LL;
  }

  else
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v6, v66, v68, v69, v71, v72, v74);
    return FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

uint64_t GVSEstimatePaddingForDistortedTransformFits(void *a1, double *a2, float32x4_t *a3)
{
  id v5 = a1;
  id v6 = v5;
  if (!v5 || !a2 || !a3)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "Fig",  "forwardModel && boundingRect && paddingOut",  "bail",  0LL,  "GVSDistortionUtilities.m",  367LL,  0);
LABEL_13:
    uint64_t v33 = FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    goto LABEL_10;
  }

  if (([v5 isValid] & 1) == 0)
  {
    uint64_t v36 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v36,  "Fig",  "forwardModel.isValid",  "bail",  0LL,  "GVSDistortionUtilities.m",  368LL,  0);
    goto LABEL_13;
  }

  uint64_t v7 = 0LL;
  double v8 = a2[2];
  double v9 = a2[3];
  *(float *)&unsigned int v10 = (v8 + -1.0) / 36.0;
  double v11 = (v9 + -1.0) / 36.0;
  double v12 = a2[1];
  *(float *)&unsigned int v13 = *a2;
  *(float *)&double v12 = v12;
  *(float *)&double v8 = v8 + *(float *)&v13 + -1.0;
  double v14 = v9 + *(float *)&v12 + -1.0;
  *(float *)&double v14 = v14;
  v15.i64[0] = __PAIR64__(LODWORD(v8), v13);
  v15.i64[1] = __PAIR64__(v13, LODWORD(v8));
  float32x4_t v40 = v15;
  *(int32x2_t *)v15.f32 = vdup_lane_s32(*(int32x2_t *)&v12, 0);
  *(float *)&double v8 = v11;
  *(int32x2_t *)&v15.u32[2] = vdup_lane_s32(*(int32x2_t *)&v14, 0);
  float32x4_t v39 = v15;
  v15.i32[0] = 0;
  v15.i32[2] = 0;
  v16.i32[3] = 0;
  v16.i64[0] = v10;
  v16.f32[2] = -*(float *)&v10;
  v15.i32[1] = LODWORD(v8);
  v15.f32[3] = -*(float *)&v8;
  float32x4_t v37 = v16;
  float32x4_t v38 = v15;
  float v17 = (float32x4_t *)&v44;
  do
  {
    objc_msgSend(v6, "computeScalingAtPointsQuad:");
    float32x4_t v41 = (float32x4_t)v18;
    v42[v7] = v18;
    [v6 distortionCenter];
    v17[-1] = vmulq_f32( v41,  vsubq_f32(vaddq_f32(v40, vmulq_n_f32(v37, (float)(int)v7)), (float32x4_t)vdupq_lane_s32(v19, 0)));
    [v6 distortionCenter];
    *float v17 = vmulq_f32( v41,  vsubq_f32(vaddq_f32(v39, vmulq_n_f32(v38, (float)(int)v7)), (float32x4_t)vdupq_lane_s32(v20, 1)));
    v17 += 2;
    ++v7;
  }

  while (v7 != 36);
  uint64_t v21 = 0LL;
  v42[36] = vextq_s8(v42[0], v42[0], 4uLL);
  v45[65] = vextq_s8(v43, v43, 4uLL);
  v45[66] = vextq_s8(v44, v44, 4uLL);
  float v22 = (float32x4_t *)v45;
  float32x4_t v23 = 0uLL;
  do
  {
    float32x4_t v24 = v22[-7];
    float32x4_t v25 = v22[-6];
    float32x4_t v26 = vsubq_f32(v22[5], v24);
    float32x4_t v27 = vsubq_f32(v22[6], v25);
    float32x4_t v28 = vmlaq_f32(vmulq_f32(v27, v27), v26, v26);
    float32x4_t v29 = vmlaq_f32(vmulq_f32(vsubq_f32(v22[-1], v24), vnegq_f32(v27)), vsubq_f32(*v22, v25), v26);
    float32x4_t v30 = vrsqrteq_f32(v28);
    float32x4_t v31 = (float32x4_t)v42[v21 + 3];
    float32x4_t v32 = vrecpeq_f32(v31);
    float32x4_t v23 = vmaxnmq_f32( v23,  vmulq_f32( vmulq_f32(v29, vmulq_f32(v30, vrsqrtsq_f32(v28, vmulq_f32(v30, v30)))),  vmulq_f32(v32, vrecpsq_f32(v31, v32))));
    ++v21;
    v22 += 2;
  }

  while (v21 != 31);
  uint64_t v33 = 0LL;
  *a3 = v23;
LABEL_10:

  return v33;
}

LABEL_10:
  return v17;
}

  unsigned int v10 = v32;
  a4 = v29;
  a5 = v30;
  if (v11)
  {
    float32x4_t v23 = kCFAllocatorDefault;
    goto LABEL_18;
  }

double GVSComputeGaussianAverageQuaternion( uint64_t a1, int a2, int a3, int a4, unint64_t a5, unint64_t a6, float a7, float a8)
{
  double v8 = (void *)a6;
  double v9 = (void *)a5;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(*(void *)a1 + 8LL * a2);
  uint64_t v13 = *(int *)(a1 + 68);
  int v14 = *(_DWORD *)(a1 + 64) + a3;
  int v15 = *(_DWORD *)(a1 + 76);
  uint64_t v16 = *(int *)(a1 + 72);
  uint64_t v17 = v14;
  int8x16_t v18 = (__int128 *)(v12 + 32LL * v14);
  __int128 v19 = v18[1];
  __int128 v96 = *v18;
  __int128 v97 = v19;
  v20.i64[0] = *(void *)(*(void *)(a1 + 16) + 8LL * v14);
  v20.i64[1] = *(void *)(v11 + 8LL * v14);
  float32x4_t v93 = v20;
  BOOL v88 = (a5 | a6) != 0;
  if (v15 <= 1)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "Fig",  "qsArrays->count >= 2",  "bail",  0LL,  "GVSFilteringUtilities.m",  579LL,  0);
  }

  else
  {
    float v21 = a7 * 3.0;
    if ((float)(a7 * 3.0) > 0.01)
    {
      uint64_t v89 = v12;
      int v24 = *(_DWORD *)(a1 + 84);
      if (v24 >= v14) {
        int v25 = v14;
      }
      else {
        int v25 = *(_DWORD *)(a1 + 84);
      }
      else {
        int v26 = v16 - v14;
      }
      uint64_t v27 = *(void *)(a1 + 40);
      double v94 = *(double *)(v27 + 8LL * v14);
      float v28 = 0.0;
      float v29 = 0.0;
      float v30 = a7;
      if (v24 > v14 && v25 + 1 <= v24)
      {
        float v31 = *(float *)(*(void *)(a1 + 48) + 4 * v13);
        float v32 = v94 - *(double *)(v27 + 8 * v13);
        int v33 = v24 - v25;
        do
        {
          float v32 = v31 + v32;
          float v34 = expf((float)((float)(v32 * 30.0) / a7) * (float)((float)((float)(v32 * 30.0) / a7) * -0.5));
          a7 = v30;
          float v35 = v31 * v34;
          if (v35 < 0.0000001) {
            float v35 = -0.0;
          }
          float v29 = v29 + v35;
          --v33;
        }

        while (v33);
      }

      int v36 = -v25;
      int v37 = v26;
      double v8 = (void *)a6;
      if ((int)v16 - (int)v17 < v24)
      {
        float v38 = *(double *)(v27 + 8 * v16) - v94;
        float v39 = *(float *)(*(void *)(a1 + 48) + 4 * v16);
        int v40 = v24 - v37;
        float v28 = 0.0;
        do
        {
          float v38 = v39 + v38;
          float v41 = expf((float)((float)(v38 * 30.0) / a7) * (float)((float)((float)(v38 * 30.0) / a7) * -0.5));
          a7 = v30;
          float v42 = v39 * v41;
          if (v42 < 0.0000001) {
            float v42 = -0.0;
          }
          float v28 = v28 + v42;
          --v40;
        }

        while (v40);
      }

      uint64_t v43 = *(void *)(a1 + 56);
      int8x16_t v44 = (float *)(v43 + 80LL * (int)v17);
      if (a7 == a8) {
        int v45 = a4;
      }
      else {
        int v45 = 0;
      }
      float v46 = 0.0;
      if (v45 == 1)
      {
        float v47 = *v44;
        if (*v44 > 0.0)
        {
          uint64_t v48 = v43 + 80LL * (int)v17;
          int v36 = *(_DWORD *)(v48 + 64) + 1;
          __int128 v49 = *(_OWORD *)(v48 + 24);
          __int128 v96 = *(_OWORD *)(v48 + 8);
          __int128 v97 = v49;
          float32x4_t v93 = *(float32x4_t *)(v48 + 48);
          float v29 = 0.0;
          float v46 = v47;
        }
      }

      char v95 = 0;
      if (v36 <= v37)
      {
        v87 = (float *)(v43 + 80LL * (int)v17);
        uint64_t v50 = 0LL;
        if (v46 >= 0.0) {
          float v51 = v46;
        }
        else {
          float v51 = 0.0;
        }
        int v52 = v37 - 2;
        uint64_t v53 = v43 + 80LL * (int)v17;
        int v54 = v37;
        float32x4_t v55 = (_OWORD *)(v53 + 8);
        v84 = (_DWORD *)(v53 + 64);
        v85 = (float32x4_t *)(v53 + 48);
        int v86 = v52;
        uint64_t v56 = v54 - (uint64_t)v36;
        uint64_t v57 = v52 - (uint64_t)v36;
        uint64_t v58 = 8 * v17 + 8LL * v36;
        uint64_t v59 = v17 + v36;
        uint64_t v60 = 4 * v17;
        int v61 = v54 - v36 + 1;
        float v62 = -0.5;
        uint64_t v91 = v60 + 4LL * v36;
        v63 = (__int128 *)(v89 + 32 * v59);
        float v64 = 30.0 / a7;
        do
        {
          float v65 = *(double *)(*(void *)(a1 + 40) + v58 + 8 * v50) - v94;
          if (fabsf(v64 * v65) < 3.0)
          {
            float v66 = expf((float)(v64 * v65) * (float)((float)(v64 * v65) * v62));
            if (*(_BYTE *)(*(void *)(a1 + 24) + v59 + v50)) {
              float v66 = v66
            }
                  * (float)((float)(expf( (float)((float)(v65 * 30.0) / (float)(a8 * 0.5))
                                    * (float)((float)((float)(v65 * 30.0) / (float)(a8 * 0.5)) * -0.5))
                                  * 7.0)
                          + 1.0);
            if (v50) {
              float v67 = -0.0;
            }
            else {
              float v67 = v29;
            }
            if (v56 == v50) {
              float v68 = v28;
            }
            else {
              float v68 = -0.0;
            }
            if (*(_BYTE *)(*(void *)(a1 + 32) + v59 + v50))
            {
              float v69 = v68 + (float)(v67 + (float)(v66 * *(float *)(*(void *)(a1 + 48) + v91 + 4 * v50)));
              if (v69 >= 0.0000001)
              {
                float v70 = v51 + v69;
                float v71 = v51 / (float)(v51 + v69);
                float v90 = v71;
                if (v71 <= 0.0)
                {
                  __int128 v75 = v63[1];
                  __int128 v96 = *v63;
                  __int128 v97 = v75;
                }

                else
                {
                  *(void *)&__int128 v96 = GVSInterpolateQuaternionsLERP((uint64_t)v63, (uint64_t)&v96, 0, &v95, v71);
                  *((void *)&v96 + 1) = v72;
                  *(void *)&__int128 v97 = v73;
                  *((void *)&v97 + 1) = v74;
                }

                if (v88)
                {
                  v76.i64[0] = *(void *)(*(void *)(a1 + 16) + v58 + 8 * v50);
                  v76.i64[1] = *(void *)(*(void *)(a1 + 8) + v58 + 8 * v50);
                  float32x4_t v93 = vmlaq_n_f32(vmulq_n_f32(v93, v90), v76, 1.0 - v90);
                }

                float v51 = v70;
              }
            }

            float v62 = -0.5;
          }

          if (v57 == v50) {
            int v77 = v45;
          }
          else {
            int v77 = 0;
          }
          if (v77 == 1 && *(_DWORD *)(a1 + 80) == *(_DWORD *)(a1 + 76))
          {
            __int128 v78 = v97;
            *float32x4_t v55 = v96;
            v55[1] = v78;
            float32x4_t *v85 = v93;
            float *v87 = v51;
            _DWORD *v84 = v86;
          }

          ++v50;
          v63 += 2;
        }

        while (v61 != (_DWORD)v50);
        double v9 = (void *)a5;
        double v8 = (void *)a6;
        if (v95)
        {
LABEL_65:
          if (!v9) {
            goto LABEL_67;
          }
          goto LABEL_66;
        }
      }

      else
      {
        double v9 = (void *)a5;
      }

      FigMotionNormalizeQuaternion(&v96);
      goto LABEL_65;
    }

    uint64_t v81 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v81,  "Fig",  "sigma * kGaussianSigmaLimit > 0.01f",  "bail",  0LL,  "GVSFilteringUtilities.m",  582LL,  0);
  }

  if (v9) {
LABEL_66:
  }
    void *v9 = vextq_s8((int8x16_t)v93, (int8x16_t)v93, 8uLL).u64[0];
LABEL_67:
  if (v8) {
    void *v8 = v93.i64[0];
  }
  return *(double *)&v96;
}

double GVSComputeSmoothedHorizonQuaternion(uint64_t a1, int a2, float a3)
{
  int v3 = *(_DWORD *)(a1 + 60);
  if (*(_DWORD *)(a1 + 56) + a2 <= v3) {
    int v4 = *(_DWORD *)(a1 + 60);
  }
  else {
    int v4 = *(_DWORD *)(a1 + 56) + a2;
  }
  int v5 = *(_DWORD *)(a1 + 64);
  if (v4 >= v5) {
    int v4 = *(_DWORD *)(a1 + 64);
  }
  float32x4_t v6 = *(float32x4_t *)(*(void *)a1 + 16LL * v4);
  if (*(int *)(a1 + 68) <= 1)
  {
    float32x4_t v46 = *(float32x4_t *)(*(void *)a1 + 16LL * v4);
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "Fig",  "rsArrays->count >= 2",  "bail",  0LL,  "GVSFilteringUtilities.m",  753LL,  0);
LABEL_28:
    float32x4_t v6 = v46;
    goto LABEL_25;
  }

  if (a3 <= 0.001)
  {
    float32x4_t v46 = *(float32x4_t *)(*(void *)a1 + 16LL * v4);
    uint64_t v43 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v43,  "Fig",  "kernelRadius > 0.001f",  "bail",  0LL,  "GVSFilteringUtilities.m",  756LL,  0);
    goto LABEL_28;
  }

  int v8 = v4;
  uint64_t v9 = *(void *)(a1 + 40);
  double v10 = *(double *)(v9 + 8LL * v4);
  int v11 = *(_DWORD *)(a1 + 72);
  int v12 = v4 - v11;
  int v13 = v11 + v8;
  float v44 = 0.0;
  float v45 = 0.0;
  int v14 = v12;
  if (v12 < v3)
  {
    float v15 = v10 - *(double *)(v9 + 8LL * v3);
    float v16 = fminf(fmaxf((float)(v15 + (float)(*(float *)(*(void *)(a1 + 48) + 4LL * v3) * 0.5)) / a3, 0.0), 1.0);
    float v44 = (float)(0.6
                - (float)((float)(v16 - (float)((float)(v16 * v16) * (float)(v16 * v16)))
    int v14 = *(_DWORD *)(a1 + 60);
  }

  if (v13 > v5)
  {
    float v17 = *(double *)(v9 + 8LL * v5) - v10;
    float v18 = fminf(fmaxf((float)(v17 + (float)(*(float *)(*(void *)(a1 + 48) + 4LL * v5) * 0.5)) / a3, 0.0), 1.0);
    float v45 = (float)(0.6
                - (float)((float)(v18 - (float)((float)(v18 * v18) * (float)(v18 * v18)))
    int v13 = *(_DWORD *)(a1 + 64);
  }

  if (v14 <= v13)
  {
    uint64_t v19 = 0LL;
    if (v3 <= v12) {
      int v3 = v12;
    }
    uint64_t v20 = v3;
    int v21 = v13 - v3;
    uint64_t v22 = 8LL * v3;
    uint64_t v23 = 4LL * v3;
    uint64_t v24 = 16LL * v3;
    int v25 = v13 - v3 + 1;
    float v26 = 0.0;
    float v27 = 1.0 / a3;
    do
    {
      float v28 = *(double *)(*(void *)(a1 + 40) + v22 + 8 * v19) - v10;
      float v29 = v27 * v28;
      float v30 = fabsf(v29);
      if (v30 < 1.0)
      {
        if (v31 >= 0.0000001)
        {
          if (*(_BYTE *)(*(void *)(a1 + 32) + v20 + v19))
          {
            float v32 = v31 * *(float *)(*(void *)(a1 + 48) + v23 + 4 * v19);
            float v33 = v44;
            if ((_DWORD)v19) {
              float v33 = -0.0;
            }
            float v34 = v33 + v32;
            float v35 = v45;
            if (v21 != (_DWORD)v19) {
              float v35 = -0.0;
            }
            float v36 = v26 + (float)(v35 + v34);
            *(double *)v37.i64 = GVSInterpolateQuatfNLERP( *(float32x4_t *)(*(void *)a1 + v24 + 16 * v19),  v6,  v26 / v36);
            float32x4_t v6 = v37;
            float v26 = v36;
          }
        }
      }

      ++v19;
    }

    while (v25 != (_DWORD)v19);
  }

LABEL_25:
  int8x16_t v38 = (int8x16_t)vmulq_f32(v6, v6);
  *(float32x2_t *)v38.i8 = vadd_f32(*(float32x2_t *)v38.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v38, v38, 8uLL));
  *(float32x2_t *)v38.i8 = vadd_f32(*(float32x2_t *)v38.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v38.i8, 1));
  float32x2_t v39 = vrsqrte_f32(*(float32x2_t *)v38.i8);
  float32x2_t v40 = vmul_f32(v39, vrsqrts_f32(*(float32x2_t *)v38.i8, vmul_f32(v39, v39)));
  *(void *)&double result = vmulq_n_f32(v6, vmul_f32(v40, vrsqrts_f32(*(float32x2_t *)v38.i8, vmul_f32(v40, v40))).f32[0]).u64[0];
  return result;
}

void GVSComputeSmoothRamp(float a1, float a2, float a3)
{
  if (a3 < a2)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    int v4 = 0;
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", v4, v3, v5, v6, v7, v8, v9, v10);
  }

  else if (a3 > a2)
  {
    powf(fminf(fmaxf(a1, 0.0), a3) / a3, a3 / (float)(a3 - a2));
  }

float GVSComputeSmoothedDigitalZoomFactor(uint64_t a1, int a2, float a3)
{
  int v3 = *(_DWORD *)(a1 + 28);
  int v4 = *(_DWORD *)(a1 + 24) + a2;
  if (v4 <= v3) {
    int v4 = *(_DWORD *)(a1 + 28);
  }
  int v5 = *(_DWORD *)(a1 + 32);
  if (v4 >= v5) {
    int v6 = *(_DWORD *)(a1 + 32);
  }
  else {
    int v6 = v4;
  }
  int v7 = (float *)(*(void *)a1 + 20LL * v6);
  float v8 = v7[1];
  if (*(int *)(a1 + 36) <= 1)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "Fig",  "zsArrays->count >= 2",  "bail",  0LL,  "GVSFilteringUtilities.m",  877LL,  0);
  }

  else if ((float)(a3 * 3.0) <= 0.01)
  {
    uint64_t v28 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v28,  "Fig",  "sigma * kGaussianSigmaLimit > 0.01f",  "bail",  0LL,  "GVSFilteringUtilities.m",  880LL,  0);
  }

  else
  {
    float v29 = v7[1];
    float v9 = *v7;
    int v10 = *(_DWORD *)(a1 + 40);
    if (v6 - v10 > v3) {
      int v3 = v6 - v10;
    }
    int v11 = v10 + v6;
    if (v11 < v5) {
      int v5 = v11;
    }
    float v12 = 0.0;
    float v13 = v9;
    if (v3 <= v5)
    {
      uint64_t v14 = *(void *)(a1 + 8);
      double v15 = *(double *)(v14 + 8LL * v6);
      float v16 = (double *)(v14 + 8LL * v3);
      float v17 = (float *)(*(void *)a1 + 20LL * v3);
      int v18 = v5 - v3 + 1;
      float v19 = 30.0 / a3;
      float v13 = v9;
      do
      {
        float v20 = *v16 - v15;
        float v21 = v19 * v20;
        if (fabsf(v21) < 3.0)
        {
          float v22 = expf(v21 * (float)(v21 * -0.5));
          if (v22 >= 0.0000001)
          {
            BOOL v23 = v12 <= 0.0;
            float v24 = -0.0;
            if (v12 > 0.0) {
              float v24 = v12;
            }
            float v12 = v24 + v22;
            if (v23) {
              float v13 = v22 * *v17;
            }
            else {
              float v13 = v13 + (float)(*v17 * v22);
            }
          }
        }

        ++v16;
        v17 += 5;
        --v18;
      }

      while (v18);
    }

    float v25 = 1.0;
    if (v12 >= 0.0000001) {
      float v25 = v12;
    }
    return v29 * expf((float)(v13 / v25) - v9);
  }

  return v8;
}

float GVSComputeDilatedTotalZoomFactor(uint64_t a1, int a2, int a3)
{
  int v3 = *(_DWORD *)(a1 + 28);
  if (*(_DWORD *)(a1 + 24) + a3 <= v3) {
    int v4 = *(_DWORD *)(a1 + 28);
  }
  else {
    int v4 = *(_DWORD *)(a1 + 24) + a3;
  }
  int v5 = *(_DWORD *)(a1 + 32);
  if (v4 >= v5) {
    int v6 = *(_DWORD *)(a1 + 32);
  }
  else {
    int v6 = v4;
  }
  float v7 = *(float *)(*(void *)a1 + 20LL * v6 + 12);
  if (*(int *)(a1 + 36) <= 1)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "Fig",  "zsArrays->count >= 2",  "bail",  0LL,  "GVSFilteringUtilities.m",  958LL,  0);
  }

  else if (a2 < 1)
  {
    uint64_t v14 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v14,  "Fig",  "dilationKernelHalfSize >= 1",  "bail",  0LL,  "GVSFilteringUtilities.m",  961LL,  0);
  }

  else
  {
    int v8 = v6 - a2;
    if (v6 - a2 <= v3) {
      int v8 = *(_DWORD *)(a1 + 28);
    }
    if (v6 + a2 < v5) {
      int v5 = v6 + a2;
    }
    if (v8 <= v5)
    {
      float v9 = (float *)(*(void *)a1 + 20LL * v8 + 12);
      int v10 = v5 - v8 + 1;
      do
      {
        float v11 = *v9;
        v9 += 5;
        float v7 = fmaxf(v7, v11);
        --v10;
      }

      while (v10);
    }
  }

  return v7;
}

float GVSComputeSmoothedDilatedDigitalZoomFactor(uint64_t a1, int a2, int a3)
{
  int v5 = *(_DWORD *)(a1 + 28);
  int v4 = *(_DWORD *)(a1 + 32);
  int v6 = *(_DWORD *)(a1 + 24) + a3;
  if (v6 <= v5) {
    int v6 = *(_DWORD *)(a1 + 28);
  }
  if (v6 >= v4) {
    int v7 = *(_DWORD *)(a1 + 32);
  }
  else {
    int v7 = v6;
  }
  int v8 = v7;
  uint64_t v9 = *(void *)a1 + 20LL * v7;
  float v10 = *(float *)(v9 + 4);
  float v11 = *(float *)(v9 + 16);
  if (a2 < 1)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "Fig",  "dilationKernelHalfSize >= 1",  "bail",  0LL,  "GVSFilteringUtilities.m",  994LL,  0);
  }

  else if (*(int *)(a1 + 36) <= 1)
  {
    uint64_t v23 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v23,  "Fig",  "zsArrays->count >= 2",  "bail",  0LL,  "GVSFilteringUtilities.m",  997LL,  0);
  }

  else
  {
    if (v8 - a2 > v5) {
      int v5 = v8 - a2;
    }
    if (v8 + a2 < v4) {
      int v4 = v8 + a2;
    }
    float v12 = 0.0;
    if (v5 <= v4)
    {
      float v13 = 1.0 / (float)((float)a2 / 3.0);
      int v14 = v5 - v8;
      double v15 = (float *)(*(void *)a1 + 20LL * v5 + 16);
      int v16 = v4 - v5 + 1;
      do
      {
        float v17 = expf((float)(v13 * (float)v14) * (float)((float)(v13 * (float)v14) * -0.5));
        if (v17 >= 0.0000001)
        {
          BOOL v18 = v12 <= 0.0;
          if (v12 <= 0.0) {
            float v19 = -0.0;
          }
          else {
            float v19 = v12;
          }
          float v12 = v19 + v17;
          if (v18) {
            float v11 = v17 * *v15;
          }
          else {
            float v11 = v11 + (float)(*v15 * v17);
          }
        }

        ++v14;
        v15 += 5;
        --v16;
      }

      while (v16);
    }

    if (v12 >= 0.0000001) {
      float v20 = v12;
    }
    else {
      float v20 = 1.0;
    }
    float v11 = v11 / v20;
  }

  return v10 * expf(v11 - *(float *)(*(void *)a1 + 20LL * v8));
}

LABEL_27:
  return v54;
}

uint64_t sbp_gvs_invalidate()
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!*(_BYTE *)(DerivedStorage + 24))
  {
    uint64_t v1 = DerivedStorage;
    *(_BYTE *)(DerivedStorage + 24) = 1;
    *(void *)uint64_t DerivedStorage = 0LL;
    *(void *)(DerivedStorage + 8) = 0LL;
    v2 = *(void **)(DerivedStorage + 88);
    if (v2)
    {
      AffineTransformFinish(v2);
      AffineTransformContextRelease(*(CFTypeRef *)(v1 + 88));
      *(void *)(v1 + 88) = 0LL;
      unint64_t v3 = *(unsigned int *)(v1 + 228);
      if ((_DWORD)v3)
      {
        unint64_t v4 = 0LL;
        uint64_t v5 = v1 + 256;
        do
        {
          int v6 = *(const void **)(v5 + 8 * v4);
          if (v6)
          {
            CFRelease(v6);
            *(void *)(v5 + 8 * v4) = 0LL;
            unint64_t v3 = *(unsigned int *)(v1 + 228);
          }

          ++v4;
        }

        while (v4 < v3);
      }
    }

    int v7 = *(void **)(v1 + 112);
    if (v7)
    {
      [v7 finishProcessing];
      [*(id *)(v1 + 112) purgeResources];
      int v8 = *(void **)(v1 + 112);
      *(void *)(v1 + 112) = 0LL;
    }

    uint64_t v9 = *(void **)(v1 + 29680);
    if (v9)
    {
      *(void *)(v1 + 29680) = 0LL;
      free(v9);
    }

    float v10 = *(void **)(v1 + 96);
    *(void *)(v1 + 96) = 0LL;

    float v11 = *(void **)(v1 + 368);
    *(void *)(v1 + 368) = 0LL;

    float v12 = *(void **)(v1 + 27096);
    *(void *)(v1 + 27096) = 0LL;

    float v13 = *(void **)(v1 + 29520);
    *(void *)(v1 + 29520) = 0LL;

    int v14 = *(void **)(v1 + 28848);
    *(void *)(v1 + 28848) = 0LL;

    double v15 = *(void **)(v1 + 28856);
    *(void *)(v1 + 28856) = 0LL;

    int v16 = *(void **)(v1 + 29088);
    *(void *)(v1 + 29088) = 0LL;

    float v17 = *(void **)(v1 + 29696);
    *(void *)(v1 + 29696) = 0LL;

    BOOL v18 = *(void **)(v1 + 29704);
    *(void *)(v1 + 29704) = 0LL;

    [*(id *)(v1 + 48) removeAllObjects];
    [*(id *)(v1 + 64) removeAllObjects];
    [*(id *)(v1 + 56) removeAllObjects];
    float v19 = *(void **)(v1 + 48);
    *(void *)(v1 + 48) = 0LL;

    float v20 = *(void **)(v1 + 64);
    *(void *)(v1 + 64) = 0LL;

    float v21 = *(void **)(v1 + 56);
    *(void *)(v1 + 56) = 0LL;

    float v22 = *(const void **)(v1 + 72);
    if (v22)
    {
      CFRelease(v22);
      uint64_t v23 = *(void **)(v1 + 72);
      *(void *)(v1 + 72) = 0LL;
    }

    float v24 = *(const void **)(v1 + 384);
    if (v24)
    {
      CFRelease(v24);
      *(void *)(v1 + 384) = 0LL;
    }

    float v25 = *(const void **)(v1 + 28824);
    if (v25)
    {
      CFRelease(v25);
      *(void *)(v1 + 28824) = 0LL;
    }

    sbp_gvs_freeDerivedVectorsAndSphereLensMovements(v1);
    if (*(_DWORD *)(v1 + 29564))
    {
      sbp_ltm_deallocateLtcCorrectionTexture(v1);
      [*(id *)(v1 + 29600) purgeResources];
      float v26 = *(void **)(v1 + 29600);
      *(void *)(v1 + 29600) = 0LL;
    }

    float v27 = *(void **)(v1 + 30008);
    *(void *)(v1 + 30008) = 0LL;

    uint64_t v28 = *(void **)(v1 + 30024);
    *(void *)(v1 + 30024) = 0LL;

    float v29 = *(void **)(v1 + 30016);
    *(void *)(v1 + 30016) = 0LL;
  }

  return 0LL;
}

uint64_t FigSampleBufferProcessorCreateForGyroVideoStabilization(const __CFDictionary *a1, const char *a2)
{
  unint64_t v3 = v2;
  uint64_t v322 = 0LL;
  unsigned int valuePtr = 0;
  CFTypeRef cf = 0LL;
  if (!a2)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v2, v296, v297, (_DWORD)v298, v299, v301, v303);
    uint64_t v256 = 4294954516LL;
    goto LABEL_344;
  }

  uint64_t ClassID = FigSampleBufferProcessorGetClassID();
  uint64_t v6 = CMDerivedObjectCreate(kCFAllocatorDefault, &kFigSampleBufferProcessor_GyroVideoStabilizationVTable, ClassID, &cf);
  if ((_DWORD)v6)
  {
    uint64_t v106 = v6;
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v106,  v2,  v296,  v297,  (_DWORD)v298,  v299,  v301,  v303);
    goto LABEL_111;
  }

  v300 = a2;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(cf);
  int v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v9 = *(void **)(DerivedStorage + 48);
  *(void *)(DerivedStorage + 48) = v8;

  if (!*(void *)(DerivedStorage + 48))
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->outputPixelBufferPools",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  9373LL,  0);
LABEL_343:
    uint64_t v256 = 4294954510LL;
    goto LABEL_344;
  }

  float v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  float v11 = *(void **)(DerivedStorage + 56);
  *(void *)(DerivedStorage + 56) = v10;

  if (!*(void *)(DerivedStorage + 56))
  {
    uint64_t v258 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v258,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->outputAuxAttributes",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  9376LL,  0);
    goto LABEL_343;
  }

  float v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  float v13 = *(void **)(DerivedStorage + 64);
  *(void *)(DerivedStorage + 64) = v12;

  if (!*(void *)(DerivedStorage + 64))
  {
    uint64_t v259 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v259,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->cachedOutputVideoFormatDescriptions",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  9379LL,  0);
    goto LABEL_343;
  }

  int v14 = (BOOL *)(DerivedStorage + 10648);
  *(_DWORD *)(DerivedStorage + 44) = 0;
  *(_DWORD *)(DerivedStorage + 28) = 1028443341;
  *(_DWORD *)(DerivedStorage + 212) = 1;
  *(_BYTE *)(DerivedStorage + 28105) = 0;
  *(_BYTE *)(DerivedStorage + 10652) = 0;
  double v15 = objc_alloc_init(&OBJC_CLASS___GVSGravityDataContext);
  int v16 = *(void **)(DerivedStorage + 27096);
  *(void *)(DerivedStorage + 27096) = v15;

  float v17 = *(void **)(DerivedStorage + 27096);
  if (v17)
  {
    v302 = (const char *)(DerivedStorage + 10652);
    uint64_t v304 = DerivedStorage + 44;
    uint64_t v18 = DerivedStorage + 29496;
    uint64_t v19 = DerivedStorage + 28832;
    float v20 = (unsigned __int8 *)(DerivedStorage + 28248);
    v310 = (_BYTE *)(DerivedStorage + 28105);
    [v17 setExtractGravityData:0];
    LODWORD(v21) = 10.0;
    [*(id *)(DerivedStorage + 27096) setGravityFilterTimescale:v21];
    *(_DWORD *)(DerivedStorage + 40) = 0;
    *(_DWORD *)(DerivedStorage + 29108) = 1061675650;
    *(_BYTE *)(DerivedStorage + 84) = 0;
    *(void *)(DerivedStorage + 27384) = 0x3FEFAE147AE147AELL;
    *(_DWORD *)(DerivedStorage + 28100) = -1;
    *(_BYTE *)(DerivedStorage + 289) = 0;
    v306 = (_BYTE *)(DerivedStorage + 360);
    *(_WORD *)(DerivedStorage + 360) = 256;
    *(void *)(DerivedStorage + 168) = 3LL;
    *(_BYTE *)(DerivedStorage + 200) = 1;
    *(_BYTE *)(DerivedStorage + 203) = 0;
    *(_DWORD *)(DerivedStorage + 176) = 6;
    *(_DWORD *)(DerivedStorage + 188) = 32;
    *(_DWORD *)(DerivedStorage + 196) = 1065353216;
    *(_DWORD *)(DerivedStorage + 28772) = -1082130432;
    *(_DWORD *)(DerivedStorage + 27116) = 0;
    v312 = (int *)(DerivedStorage + 27116);
    v308 = (float *)(DerivedStorage + 29412);
    *(void *)(DerivedStorage + 29412) = 0xF3F000000LL;
    v305 = (int *)(DerivedStorage + 29416);
    v311 = (int *)(DerivedStorage + 29488);
    *(void *)(DerivedStorage + 29488) = 0x4000000000000000LL;
    +[GVSMotionBlurFilter defaultSettings](&OBJC_CLASS___GVSMotionBlurFilter, "defaultSettings");
    CGPoint origin = rect.origin;
    *(CGFloat *)(DerivedStorage + 29512) = rect.size.width;
    *(CGPoint *)(DerivedStorage + 29496) = origin;
    *(_DWORD *)(DerivedStorage + 29124) = 1053609165;
    *(void *)(DerivedStorage + 29136) = 0x3F36B3CC4EE655AALL;
    *(_BYTE *)(DerivedStorage + 216) = 0;
    *(_DWORD *)(DerivedStorage + 27076) = 1065252553;
    *(_WORD *)(DerivedStorage + 29728) = 0;
    *(_BYTE *)(DerivedStorage + 28764) = 1;
    uint64_t v319 = 0LL;
    char v318 = 0;
    v313 = (_BYTE *)(DerivedStorage + 29496);
    v309 = (int *)(DerivedStorage + 28248);
    uint64_t v23 = a1;
    if (!a1) {
      goto LABEL_103;
    }
    Value = CFDictionaryGetValue(a1, kFigCaptureSampleBufferProcessorOption_SensorIDDictionary);
    if (Value) {
      Value = CFRetain(Value);
    }
    *(void *)(DerivedStorage + 384) = Value;
    float v25 = (void *)CFDictionaryGetValue( a1,  kFigVideoStabilizationSampleBufferProcessorOption_DistortionCompensationEnabledPortTypes);
    float v26 = (void *)CFDictionaryGetValue( a1,  kFigVideoStabilizationSampleBufferProcessorOption_DistortionCorrectionEnabledPortTypes);
    float v27 = v25;
    id v307 = v26;
    uint64_t v28 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    if (v28)
    {
      v297 = v27;
      LODWORD(v298) = (_DWORD)v2;
      __int128 v336 = 0u;
      __int128 v337 = 0u;
      __int128 v334 = 0u;
      __int128 v335 = 0u;
      float v29 = v27;
      id v30 = [v29 countByEnumeratingWithState:&v334 objects:&rect count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v335;
        do
        {
          for (uint64_t i = 0LL; i != v31; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v335 != v32) {
              objc_enumerationMutation(v29);
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v28,  "setObject:forKeyedSubscript:",  &off_39690,  *(void *)(*((void *)&v334 + 1) + 8LL * (void)i));
          }

          id v31 = [v29 countByEnumeratingWithState:&v334 objects:&rect count:16];
        }

        while (v31);
      }

      __int128 v332 = 0u;
      __int128 v333 = 0u;
      __int128 v330 = 0u;
      __int128 v331 = 0u;
      id v34 = v307;
      id v35 = [v34 countByEnumeratingWithState:&v330 objects:&v326 count:16];
      if (v35)
      {
        id v36 = v35;
        uint64_t v37 = *(void *)v331;
        while (2)
        {
          for (j = 0LL; j != v36; j = (char *)j + 1)
          {
            if (*(void *)v331 != v37) {
              objc_enumerationMutation(v34);
            }
            uint64_t v39 = *(void *)(*((void *)&v330 + 1) + 8LL * (void)j);
            float32x2_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v28, "allKeys"));
            unsigned __int8 v41 = [v40 containsObject:v39];

            if ((v41 & 1) != 0)
            {
              fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
              unint64_t v3 = v2;
              FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v2,  v296,  v297,  (_DWORD)v2,  v300,  v302,  v304);

              float v42 = 0LL;
              goto LABEL_28;
            }

            -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", &off_396A8, v39);
          }

          id v36 = [v34 countByEnumeratingWithState:&v330 objects:&v326 count:16];
          if (v36) {
            continue;
          }
          break;
        }
      }

      float v42 = v28;
      unint64_t v3 = v2;
LABEL_28:
      int v14 = (BOOL *)(DerivedStorage + 10648);
      uint64_t v19 = DerivedStorage + 28832;
      float v27 = (char *)v297;
    }

    else
    {
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v2,  v296,  v297,  (_DWORD)v298,  v300,  v302,  v304);
      float v42 = 0LL;
    }

    uint64_t v43 = *(void **)(DerivedStorage + 29088);
    *(void *)(DerivedStorage + 29088) = v42;

    if (*(void *)(DerivedStorage + 29088))
    {
      float v44 = a1;
      FigCFDictionaryGetInt32IfPresent(a1, kFigCaptureSampleBufferProcessorOption_GpuPriority, DerivedStorage + 104);
      float v45 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( a1,  "objectForKeyedSubscript:",  kFigCaptureSampleBufferProcessorOption_MetalCommandQueue));
      FigCFDictionaryGetInt32IfPresent( a1,  kFigCaptureSampleBufferProcessorOption_MetalSubmissionAndCompletionQueuePriority,  DerivedStorage + 108);
      float32x4_t v46 = -[FigMetalContext initWithoutLibraryUsingOptionalCommandQueue:]( objc_alloc(&OBJC_CLASS___FigMetalContext),  "initWithoutLibraryUsingOptionalCommandQueue:",  v45);
      float v47 = *(void **)(DerivedStorage + 96);
      *(void *)(DerivedStorage + 96) = v46;

      uint64_t v48 = *(void **)(DerivedStorage + 96);
      if (v48)
      {
        if (*(_DWORD *)(DerivedStorage + 108))
        {
          uint64_t v49 = FigDispatchQueueCreateWithPriority( "com.apple.coremedia.vis-metal-queue",  &_dispatch_queue_attr_concurrent);
          uint64_t v18 = DerivedStorage + 29496;
          if (!v49)
          {
            uint64_t v273 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
            LODWORD(v295) = 0;
            FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v273,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "visQueue",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  9505LL,  v295);
            goto LABEL_349;
          }

          uint64_t v50 = (void *)v49;
          float v51 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(DerivedStorage + 96) commandQueue]);
          [v51 setSubmissionQueue:v50];
          [v51 setCompletionQueue:v50];

          float v44 = a1;
          uint64_t v48 = *(void **)(DerivedStorage + 96);
        }

        else
        {
          uint64_t v18 = DerivedStorage + 29496;
        }

        [v48 setQueuePriority:*(unsigned int *)(DerivedStorage + 104)];
        FigCFDictionaryGetFloatIfPresent( v44,  kFigVideoStabilizationSampleBufferProcessorOption_MinDistanceForBravoParallaxShift,  DerivedStorage + 28768);
        FigCFDictionaryGetInt32IfPresent( v44,  kFigVideoStabilizationSampleBufferProcessorOption_NumberOfExtendedRowsOfOutputBufferToFill,  v304);
        FigCFDictionaryGetInt32IfPresent(v44, kFigVideoStabilizationSampleBufferProcessorOption_SmoothingMethod, v312);
        FigCFDictionaryGetInt32IfPresent( v44,  kFigVideoStabilizationSampleBufferProcessorOption_CinematicLookAheadFrameCount,  v305);
        FigCFDictionaryGetFloatIfPresent( v44,  kFigVideoStabilizationSampleBufferProcessorOption_CinematicLookAheadTime,  v308);
        FigCFDictionaryGetBooleanIfPresent( v44,  kFigVideoStabilizationSampleBufferProcessorOption_AttachStabilizedOutputCameraTrajectory,  DerivedStorage + 28096);
        FigCFDictionaryGetBooleanIfPresent( v44,  kFigVideoStabilizationSampleBufferProcessorOption_OnlyGenerateTransformsParameters,  DerivedStorage + 29672);
        FigCFDictionaryGetBooleanIfPresent( v44,  kFigVideoStabilizationSampleBufferProcessorOption_AttachEstimatedMotionVector,  DerivedStorage + 28777);
        FigCFDictionaryGetBooleanIfPresent( v44,  kFigVideoStabilizationSampleBufferProcessorOption_AttachStabilizedTrajectoryHomography,  DerivedStorage + 28778);
        FigCFDictionaryGetBooleanIfPresent( v44,  kFigVideoStabilizationSampleBufferProcessorOption_BlurBorderPixels,  DerivedStorage + 224);
        *(_BYTE *)(DerivedStorage + 288) = *(_BYTE *)(DerivedStorage + 224);
        FigCFDictionaryGetBooleanIfPresent( v44,  kFigVideoStabilizationSampleBufferProcessorOption_EnableRollingShutterCorrectionOnly,  DerivedStorage + 27112);
        LOBYTE(rect.origin.x) = 0;
        if (!FigCFDictionaryGetBooleanIfPresent( v44,  kFigVideoStabilizationSampleBufferProcessorOption_DisableTransformLimitsForPredeterminedTrajectory,  &rect)
          || !LOBYTE(rect.origin.x))
        {
          goto LABEL_39;
        }

        if (*v312 == 4)
        {
          *(_BYTE *)(DerivedStorage + 200) = 0;
LABEL_39:
          FigCFDictionaryGetBooleanIfPresent( v44,  kFigVideoStabilizationSampleBufferProcessorOption_UseCameraGeometry,  v306);
          int v52 = (const __CFDictionary *)CFDictionaryGetValue( v44,  kFigVideoStabilizationSampleBufferProcessorOption_LivePhotoCleanOutputRect);
          if (!v52) {
            goto LABEL_42;
          }
          CGSize size = CGRectZero.size;
          rect.CGPoint origin = CGRectZero.origin;
          rect.CGSize size = size;
          if (CGRectMakeWithDictionaryRepresentation(v52, &rect))
          {
            CGSize v54 = rect.size;
            *(CGPoint *)(DerivedStorage + 29440) = rect.origin;
            *(CGSize *)(DerivedStorage + 29456) = v54;
            *(_BYTE *)(v19 + 600) = 1;
LABEL_42:
            FigCFDictionaryGetBooleanIfPresent( v44,  kFigVideoStabilizationSampleBufferProcessorOption_EnableSphereCorrection,  v310);
            FigCFDictionaryGetBooleanIfPresent( v44,  kFigVideoStabilizationSampleBufferProcessorOption_UseISPMotionData,  v302);
            float32x4_t v55 = CFDictionaryGetValue(v44, kFigCaptureSampleBufferProcessorOption_CameraInfoByPortType);
            uint64_t v56 = *(const void **)(DerivedStorage + 28824);
            *(void *)(DerivedStorage + 28824) = v55;
            if (v55) {
              CFRetain(v55);
            }
            if (v56) {
              CFRelease(v56);
            }
            FigCFDictionaryGetFloatIfPresent( v44,  kFigVideoStabilizationSampleBufferProcessorOption_HorizonCorrectionThreshold,  (char *)&v319 + 4);
            FigCFDictionaryGetInt32IfPresent( v44,  kFigVideoStabilizationSampleBufferProcessorOption_HorizonCorrectionMode,  &v319);
            FigCFDictionaryGetInt32IfPresent( v44,  kFigVideoStabilizationSampleBufferProcessorOption_MotionBlurShimmerMitigationMethod,  v311);
            FigCFDictionaryGetBooleanIfPresent( v44,  kFigVideoStabilizationSampleBufferProcessorOption_ApplyFrameCropOffset,  DerivedStorage + 204);
            *(void *)(DerivedStorage + 29560) = 0LL;
            uint64_t v57 = CFDictionaryGetValue(v44, kFigVideoStabilizationSampleBufferProcessorOption_VideoSTFParameters);
            uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
            uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"Version"]);
            *(_DWORD *)(v18 + 64) = [v59 intValue];

            if (*(int *)(v18 + 64) < 1)
            {
LABEL_81:
              FigCFDictionaryGetBooleanIfPresent( a1,  kFigVideoStabilizationSampleBufferProcessorOption_ZoomSmoothingEnabled,  &v318);
              *(_BYTE *)(v18 + 260) = v318 != 0;
              *(void *)(v18 + 272) = 1066192077LL;
              *(void *)(DerivedStorage + 29760) = 0x3F00000040200000LL;
              v87 = (const __CFDictionary *)CFDictionaryGetValue( a1,  kFigVideoStabilizationSampleBufferProcessorOption_InputPixelBufferAttributes);
              if (v87)
              {
                BOOL v88 = v87;
                CFStringRef v89 = kCVPixelBufferWidthKey;
                if (FigCFDictionaryGetInt32IfPresent(v87, kCVPixelBufferWidthKey, (char *)&v322 + 4))
                {
                  CFStringRef v90 = kCVPixelBufferHeightKey;
                  if (FigCFDictionaryGetInt32IfPresent(v88, kCVPixelBufferHeightKey, &v322))
                  {
                    uint64_t v91 = (const __CFNumber *)CFDictionaryGetValue(v88, kCVPixelBufferPixelFormatTypeKey);
                    if (v91)
                    {
                      v92 = v91;
                      CFTypeID v93 = CFGetTypeID(v91);
                      if (v93 == CFNumberGetTypeID())
                      {
                        ValueAtIndex = v92;
                      }

                      else
                      {
                        CFTypeID v95 = CFGetTypeID(v92);
                        if (v95 != CFArrayGetTypeID())
                        {
LABEL_108:
                          uint64_t v106 = 4294954516LL;
LABEL_109:

LABEL_110:
                          goto LABEL_111;
                        }

                        if (CFArrayGetCount(v92) < 1)
                        {
                          uint64_t v281 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                          LODWORD(v295) = 0;
                          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v281,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "CFArrayGetCount( pixelFormatArray) > 0",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  9716LL,  v295);
                          goto LABEL_357;
                        }

                        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v92, 0LL);
                      }

                      CFNumberGetValue(ValueAtIndex, kCFNumberSInt32Type, &valuePtr);
                      __int128 v96 = CFDictionaryGetValue( a1,  kFigVideoStabilizationSampleBufferProcessorOption_OutputPixelBufferAttributes);
                      if (v96)
                      {
                        __int128 v97 = v96;
                        if (FigCFDictionaryGetInt32IfPresent(v96, v89, v18 + 144))
                        {
                          if (FigCFDictionaryGetInt32IfPresent(v97, v90, v18 + 148))
                          {
                            uint64_t v19 = DerivedStorage + 28832;
                            v98 = CFDictionaryGetValue( a1,  kFigCaptureSampleBufferProcessorProperty_PixelBufferPoolAllocationSemaphore);
                            uint64_t v99 = objc_claimAutoreleasedReturnValue(v98);
                            v100 = *(void **)(DerivedStorage + 72);
                            *(void *)(DerivedStorage + 72) = v99;

                            v101 = *(const void **)(DerivedStorage + 72);
                            float v20 = (unsigned __int8 *)(DerivedStorage + 28248);
                            if (v101) {
                              CFRetain(v101);
                            }
                            v102 = (const __CFNumber *)CFDictionaryGetValue( a1,  kFigVideoStabilizationSampleBufferProcessorOption_TransformPlatform);
                            if (!v102) {
                              goto LABEL_102;
                            }
                            v103 = v102;
                            LODWORD(rect.origin.x) = -1;
                            CFNumberType Type = CFNumberGetType(v102);
                            CFNumberGetValue(v103, Type, &rect);
                            if (LODWORD(rect.origin.x) <= 3)
                            {
                              *(_DWORD *)(DerivedStorage + 172) = LODWORD(rect.origin.x);
LABEL_102:

                              uint64_t v23 = a1;
LABEL_103:
                              if ((*(_DWORD *)(DerivedStorage + 172) - 1) <= 2) {
                                *(void *)(DerivedStorage + 120) = CFDictionaryGetValue( v23,  kFigVideoStabilizationSampleBufferProcessorOption_IspProcessingSession);
                              }
                              int v105 = *v311;
                              if (*v311)
                              {
                                if (v105 == 1)
                                {
                                  *(_DWORD *)(v19 + 660) = 1148846080;
                                  *(_BYTE *)uint64_t v18 = 1;
                                  *(_DWORD *)(v18 + 16) = 0;
LABEL_118:
                                  BOOL *v14 = FigMotionHardwareAvailable() == 0;
                                  *(_DWORD *)(DerivedStorage + 27108) = -1;
                                  *(_DWORD *)float v20 = *v20;
                                  float v110 = *((float *)&v319 + 1) * 0.0174532925;
                                  *(float *)(v18 + 192) = v110;
                                  if (v110 <= 0.0 || (int)v319 < 1)
                                  {
LABEL_124:
                                    if (*(int *)(v18 + 64) >= 1 && *(_DWORD *)(v18 + 68))
                                    {
                                      *(_BYTE *)(v18 + 97) = 1;
                                      *(_DWORD *)(v18 + 100) = 0;
                                    }

                                    v20[529] = v20[529] == 1;
                                    v20[530] = v20[530] == 1;
                                    *(_BYTE *)(DerivedStorage + 203) = *(_BYTE *)(DerivedStorage + 203) == 1;
                                    *(_DWORD *)uint64_t v19 = -1;
                                    if ([*(id *)(DerivedStorage + 29088) count]) {
                                      BOOL v122 = 1;
                                    }
                                    else {
                                      BOOL v122 = *(_DWORD *)v19 > 0;
                                    }
                                    v123 = (_BYTE *)(DerivedStorage + 30000);
                                    *(_BYTE *)(v19 + 272) = v122;
                                    if (*v14) {
                                      *(_BYTE *)(DerivedStorage + 84) = 1;
                                    }
                                    *(_DWORD *)(DerivedStorage + 29744) = 0;
                                    v124 = CFDictionaryGetValue( v23,  kFigVideoStabilizationSampleBufferProcessorOption_VideoGreenGhostMitigationParameters);
                                    v125 = (void *)objc_claimAutoreleasedReturnValue(v124);
                                    v107 = v125;
                                    if (!v125)
                                    {
                                      _BYTE *v123 = 0;
                                      v128 = *(void **)(DerivedStorage + 30008);
                                      *(void *)(DerivedStorage + 30008) = 0LL;
                                      goto LABEL_143;
                                    }

                                    uint64_t v127 = v322;
                                    uint64_t v126 = HIDWORD(v322);
                                    v128 = (void *)objc_claimAutoreleasedReturnValue( [v125 objectForKeyedSubscript:@"BrightLightMitigationParameters"]);
                                    v129 = (void *)objc_claimAutoreleasedReturnValue( [v107 objectForKeyedSubscript:@"LowLightMitigationParameters"]);
                                    _BYTE *v123 = 1;
                                    *(_DWORD *)(DerivedStorage + 30004) = 0;
                                    uint64_t v130 = v126 | (v127 << 32);
                                    if (!v128) {
                                      goto LABEL_135;
                                    }
                                    v131 = *(void **)(DerivedStorage + 28824);
                                    v132 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(DerivedStorage + 96) commandQueue]);
                                    id v133 = _loadAndConfigureVideoDeghosting(v131, v132, v128, v130);
                                    uint64_t v134 = objc_claimAutoreleasedReturnValue(v133);
                                    v135 = *(void **)(DerivedStorage + 30016);
                                    *(void *)(DerivedStorage + 30016) = v134;

                                    uint64_t v19 = DerivedStorage + 28832;
                                    if (!*(void *)(DerivedStorage + 30016))
                                    {
                                      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                      LODWORD(v295) = 0;
                                      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v295,  v3,  v296,  v297,  (_DWORD)v298,  v300,  v302,  v304);
                                      FigSignalErrorAt(4294954510LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
                                      if (v129)
                                      {
LABEL_136:
                                        v136 = (void *)objc_claimAutoreleasedReturnValue( [v129 objectForKeyedSubscript:@"LuxLevelThresholdOFF"]);
                                        [v136 floatValue];
                                        *(_DWORD *)(DerivedStorage + 30004) = v137;

                                        v138 = *(void **)(DerivedStorage + 28824);
                                        v139 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(DerivedStorage + 96) commandQueue]);
                                        id v140 = _loadAndConfigureVideoDeghosting(v138, v139, v129, v130);
                                        uint64_t v141 = objc_claimAutoreleasedReturnValue(v140);
                                        v142 = *(void **)(DerivedStorage + 30024);
                                        *(void *)(DerivedStorage + 30024) = v141;

                                        uint64_t v19 = DerivedStorage + 28832;
                                        if (!*(void *)(DerivedStorage + 30024))
                                        {
                                          fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                          LODWORD(v295) = 0;
                                          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v295,  v3,  v296,  v297,  (_DWORD)v298,  v300,  v302,  v304);
                                          FigSignalErrorAt(4294954510LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
                                        }
                                      }
                                    }

                                    else
                                    {
LABEL_135:
                                      if (v129) {
                                        goto LABEL_136;
                                      }
                                    }

                                    if (FigCFDictionaryGetIntIfPresent( a1,  kFigCaptureSampleBufferProcessorOption_SensorBinningFactorHorizontal,  &rect)
                                      && FigCFDictionaryGetIntIfPresent( a1,  kFigCaptureSampleBufferProcessorOption_SensorBinningFactorVertical,  &v326))
                                    {
                                      [*(id *)(DerivedStorage + 30024) setSensorBinningFactorHorizontal:LODWORD(rect.origin.x)];
                                      [*(id *)(DerivedStorage + 30024) setSensorBinningFactorVertical:v326];
                                      [*(id *)(DerivedStorage + 30016) setSensorBinningFactorHorizontal:LODWORD(rect.origin.x)];
                                      [*(id *)(DerivedStorage + 30016) setSensorBinningFactorVertical:v326];
                                    }

                                    float v20 = (unsigned __int8 *)(DerivedStorage + 28248);
LABEL_143:

                                    _resetFirstFrameParameters(DerivedStorage);
                                    int v144 = v322;
                                    int v143 = HIDWORD(v322);
                                    uint64_t v145 = valuePtr;
                                    int v146 = *v312;
                                    if (*v312 == 5)
                                    {
                                      if (*(_DWORD *)(DerivedStorage + 172))
                                      {
                                        uint64_t v276 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                        LODWORD(v295) = 0;
                                        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v276,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "( (ctx->platform) == kTransformGPU)",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2801LL,  v295);
                                        goto LABEL_163;
                                      }

                                      if (*(_BYTE *)(DerivedStorage + 29672))
                                      {
                                        uint64_t v277 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                        LODWORD(v295) = 0;
                                        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v277,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "! storage->onlyGenerateTransformsParameters",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2802LL,  v295);
                                        goto LABEL_163;
                                      }

                                      if (v20[529]) {
                                        v20[529] = 0;
                                      }
                                      if (v20[530]) {
                                        v20[530] = 0;
                                      }
                                    }

                                    if (v146 != 4 && *(_BYTE *)(DerivedStorage + 27112))
                                    {
                                      uint64_t v278 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                      LODWORD(v295) = 0;
                                      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v278,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "( (storage->smoothingMethod) == kFigVideoStabilizationSmoothingMethod_PredeterminedTrajectory)",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2816LL,  v295);
                                    }

                                    else if ((*(_BYTE *)(v19 + 600) || *(_BYTE *)(DerivedStorage + 224)) {
                                           && *(_DWORD *)(DerivedStorage + 172))
                                    }
                                    {
                                      uint64_t v267 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                      LODWORD(v295) = 0;
                                      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v267,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "( (ctx->platform) == kTransformGPU)",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2820LL,  v295);
                                    }

                                    else
                                    {
                                      if ((v146 - 1) >= 3 && *(_BYTE *)(DerivedStorage + 28096))
                                      {
                                        fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                        LODWORD(v295) = 0;
                                        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v295,  v3,  v296,  v297,  (_DWORD)v298,  v300,  v302,  v304);
                                        uint64_t v147 = 4294954514LL;
LABEL_164:
                                        uint64_t v106 = FigSignalErrorAt(v147, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
                                        goto LABEL_165;
                                      }

                                      __int128 v325 = 0uLL;
                                      __int128 v324 = 0uLL;
                                      sbp_configureOverscanParameters( DerivedStorage,  v143,  v144,  (uint64_t)&v324,  (uint64_t *)&v325);
                                      if (DWORD2(v325) + 2 * (_DWORD)v325 == v143
                                        && HIDWORD(v325) + 2 * DWORD1(v325) == v144)
                                      {
                                        *(_DWORD *)(DerivedStorage + 128) = v143;
                                        *(_DWORD *)(DerivedStorage + 132) = v144;
                                        *(_OWORD *)(DerivedStorage + 136) = v325;
                                        *(_OWORD *)(DerivedStorage + 152) = v324;
                                        int v148 = *(_DWORD *)(DerivedStorage + 168);
                                        if ((v148 - 1) > 1)
                                        {
                                          if (v148 == 4) {
                                            *(_DWORD *)(DerivedStorage + 188) = 1;
                                          }
                                        }

                                        else
                                        {
                                          *(_DWORD *)(DerivedStorage + 176) = 1;
                                          *(_BYTE *)(DerivedStorage + 27104) = 0;
                                        }

                                        int v151 = *(_DWORD *)(DerivedStorage + 172);
                                        if (v151 != 3 && v151)
                                        {
                                          int v152 = *(_DWORD *)(DerivedStorage + 176);
                                          if (v152 != 1)
                                          {
                                            int v153 = *(_DWORD *)(DerivedStorage + 148);
                                            int v154 = *(_DWORD *)(DerivedStorage + 188);
                                            goto LABEL_177;
                                          }
                                        }

                                        else
                                        {
                                          int v152 = *(_DWORD *)(DerivedStorage + 176);
                                          if (v152 != 1)
                                          {
                                            int v153 = *(_DWORD *)(DerivedStorage + 148);
                                            int v154 = *(_DWORD *)(DerivedStorage + 188);
                                            if (v152 >= 2)
                                            {
                                              int v155 = (v153 - 2) / v154 + 2;
                                              goto LABEL_178;
                                            }

LABEL_177:
                                            int v155 = (v153 + v154 - 1) / v154;
LABEL_178:
                                            *(_DWORD *)(DerivedStorage + 180) = v155;
                                            if (*(_BYTE *)(v19 + 272))
                                            {
                                              int v156 = (*(_DWORD *)(DerivedStorage + 144) - 2) / v154 + 2;
                                            }

                                            else
                                            {
                                              int v154 = 0;
                                              int v156 = 1;
                                            }

                                            *(_DWORD *)(DerivedStorage + 192) = v154;
                                            *(_DWORD *)(DerivedStorage + 184) = v156;
                                            if (v152 > 6)
                                            {
                                              uint64_t v106 = 4294954514LL;
LABEL_305:
                                              fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                              LODWORD(v295) = v106;
                                              FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v295,  v3,  v296,  v297,  (_DWORD)v298,  v300,  v302,  v304);
                                              goto LABEL_306;
                                            }

  return v153;
}

LABEL_183:
                                            int v157 = *(unsigned __int8 *)(DerivedStorage + 29672);
                                            if (!*(_BYTE *)(DerivedStorage + 29672) && *v312 != 5) {
                                              goto LABEL_187;
                                            }
                                            v158 = malloc(36LL * v156 * v155 + 36);
                                            *(void *)(DerivedStorage + 29680) = v158;
                                            if (!v158)
                                            {
                                              fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                              LODWORD(v295) = 0;
                                              FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v295,  v3,  v296,  v297,  (_DWORD)v298,  v300,  v302,  v304);
                                              uint64_t v106 = 4294954510LL;
                                              goto LABEL_305;
                                            }

                                            if (!v157)
                                            {
LABEL_187:
                                              if ((v151 - 1) < 3)
                                              {
                                                *(void *)&__int128 v330 = &off_396C0;
                                                *((void *)&v330 + 1) = &off_396F0;
                                                *(void *)&__int128 v334 = &off_396D8;
                                                *((void *)&v334 + 1) = &off_39708;
                                                *(void *)&__int128 v331 = &off_39720;
                                                *(void *)&__int128 v335 = &off_39738;
                                                v159 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v334,  &v330,  3LL));
                                                v160 = objc_alloc(&OBJC_CLASS___VISISPRendererV2);
                                                uint64_t v161 = *(void *)(DerivedStorage + 120);
                                                v162 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(DerivedStorage + 96) commandQueue]);
                                                v163 = -[VISISPRendererV2 initWithISPProcessingSession:metalContext:metalCommandQueue:]( v160,  "initWithISPProcessingSession:metalContext:metalCommandQueue:",  v161,  0LL,  v162);
                                                v164 = *(void **)(DerivedStorage + 112);
                                                *(void *)(DerivedStorage + 112) = v163;

                                                v165 = *(void **)(DerivedStorage + 112);
                                                if (v165)
                                                {
                                                  HIWORD(v317) = v144;
                                                  LOWORD(v317) = v143;
                                                  [v165 setInputSize:v317];
                                                  HIWORD(v316) = WORD2(*(void *)(DerivedStorage + 29640));
                                                  LOWORD(v316) = *(void *)(DerivedStorage + 29640);
                                                  [*(id *)(DerivedStorage + 112) setOutputSize:v316];
                                                  int32x2_t v166 = vrev64_s32(*(int32x2_t *)(DerivedStorage + 188));
                                                  HIWORD(v315) = v166.i16[2];
                                                  LOWORD(v315) = v166.i16[0];
                                                  [*(id *)(DerivedStorage + 112) setGridSize:v315];
                                                  [*(id *)(DerivedStorage + 112) setExtendedOutputRowsToFill:*(unsigned int *)(DerivedStorage + 44)];
                                                  v167 = *(void **)(DerivedStorage + 112);
                                                  v168 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *(unsigned int *)(DerivedStorage + 172)));
                                                  v169 = (void *)objc_claimAutoreleasedReturnValue([v159 objectForKeyedSubscript:v168]);
                                                  uint64_t v106 = (uint64_t)objc_msgSend( v167,  "prepareToProcess:",  objc_msgSend(v169, "unsignedIntValue"));

                                                  if (!(_DWORD)v106)
                                                  {

                                                    uint64_t v19 = DerivedStorage + 28832;
                                                    goto LABEL_200;
                                                  }

                                                  fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                                  v289 = v3;
                                                  LODWORD(v295) = v106;
                                                  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v295,  v3,  v296,  v297,  (_DWORD)v298,  v300,  v302,  v304);
                                                }

                                                else
                                                {
                                                  fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                                  v289 = v3;
                                                  LODWORD(v295) = 0;
                                                  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v295,  v3,  v296,  v297,  (_DWORD)v298,  v300,  v302,  v304);
                                                  uint64_t v106 = FigSignalErrorAt( 4294954510LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
                                                }

                                                unint64_t v3 = v289;
LABEL_165:
                                                v150 = v300;
                                                if (!(_DWORD)v106)
                                                {
LABEL_166:
                                                  uint64_t v106 = 0LL;
                                                  void *v150 = cf;
                                                  CFTypeRef cf = 0LL;
                                                  goto LABEL_308;
                                                }

                                                goto LABEL_305;
                                              }

                                              if (!v151)
                                              {
                                                v170 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(DerivedStorage + 96) commandQueue]);
                                                *(void *)(DerivedStorage + 88) = AffineTransformContextAlloc(v170);

                                                v171 = *(void **)(DerivedStorage + 88);
                                                if (!v171)
                                                {
                                                  uint64_t v292 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                                  LODWORD(v295) = 0;
                                                  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v292,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->GPUtransformContext",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2927LL,  v295);
                                                  goto LABEL_361;
                                                }

                                                AffineTransformSetOptions( v171,  (const char *)(*(_DWORD *)(DerivedStorage + 44) > 0));
                                                sbp_initializeGPUWithRenderMethod(DerivedStorage);
                                                uint64_t v172 = DerivedStorage + 10648;
                                                if (*(_BYTE *)(DerivedStorage + 224))
                                                {
                                                  AffineTransformGetBlurBuffersDimensions( *(void **)(DerivedStorage + 88),  *(_DWORD *)(DerivedStorage + 29640),  *(_DWORD *)(DerivedStorage + 29644),  (int *)&rect,  (int *)&v326);
                                                  uint64_t v173 = 0LL;
                                                  *(_DWORD *)(DerivedStorage + 228) = 4;
                                                  while (1)
                                                  {
                                                    uint64_t PixelBuffer = CreatePixelBuffer( LODWORD(rect.origin.x),  v326,  v145);
                                                    *(void *)(DerivedStorage + 256 + 8 * v173) = PixelBuffer;
                                                    if (!PixelBuffer) {
                                                      break;
                                                    }
                                                    if (++v173 >= *(int *)(DerivedStorage + 228))
                                                    {
                                                      *(int32x2_t *)(DerivedStorage + 232) = vmovn_s64(vcvtq_s64_f64(*(float64x2_t *)(DerivedStorage + 29440)));
                                                      *(void *)&__int128 v175 = *(void *)(DerivedStorage + 152);
                                                      *((void *)&v175 + 1) = *(void *)(DerivedStorage + 29640);
                                                      *(_OWORD *)(DerivedStorage + 240) = v175;
                                                      goto LABEL_198;
                                                    }
                                                  }

                                                  uint64_t v280 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                                  LODWORD(v295) = 0;
                                                  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v280,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->blurBorderConfig.workPixelBuffer[bufferIdx]",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2951LL,  v295);
                                                  goto LABEL_361;
                                                }

LABEL_198:
                                                AffineTransformConfigureBlurBorderPixels( *(void **)(DerivedStorage + 88),  (const char *)(DerivedStorage + 224));
                                                if (*v312 == 3) {
                                                  goto LABEL_201;
                                                }
                                                AffineTransformSetOverscanFill( *(void **)(DerivedStorage + 88),  (const char *)*(unsigned int *)(DerivedStorage + 136),  *(unsigned int *)(DerivedStorage + 140));
                                              }
                                            }

  if (!*v88) {
    goto LABEL_201;
  }
  int v153 = *(unsigned __int8 *)(v59 + 84);
  *(_BYTE *)(v59 + 202) = *(_BYTE *)(v59 + 84) != 0;
  if (v153)
  {
LABEL_202:
    int v154 = &time[2 * ((uint64_t)(*(_DWORD *)(v59 + 176) + (*(int *)(v59 + 176) < 0)) >> 1)];
    int v155 = v154[1];
    *(_OWORD *)(v59 + 28064) = *v154;
    *(_OWORD *)(v59 + 28080) = v155;
  }

  if (v60[993]) {
    sbp_gvs_computeBaseSphereLensMovements( *(unsigned int *)(v59 + 176),  *(_DWORD *)(v59 + 180),  *(void **)(v59 + 28112),  (void *)(v59 + 28120));
  }
  v339 = DerivedStorage;
  int v156 = *(void **)(v59 + 28848);
  if (v156 || *(void *)(v59 + 28856))
  {
    [v156 reset];
    [*(id *)(v59 + 28856) reset];
    sbp_gvs_extractDistortionData( *(void **)(v59 + 28824),  v91,  (uint64_t)v361,  *(void **)(v59 + 29088),  v59 + 28848,  vsubq_f64( *(float64x2_t *)(v59 + 304),  vcvtq_f64_f32(vmul_n_f32(*(float32x2_t *)(v59 + 28200), *(float *)&v361[4]))));
  }

  if (*v88
    && (cf[0] = (CFTypeRef)vmul_n_f32(*(float32x2_t *)(v59 + 28200), *(float *)&v361[4]),
        *(_DWORD *)(v59 + 196) = 1065353216,
        (int)v61 >= 1))
  {
    int v157 = v61;
    v158 = (float *)(v59 + 27120);
    v159 = v59 + 28120;
    v160 = v59 + 27840;
    uint64_t v161 = (uint64_t *)time;
    while (1)
    {
      *(double *)v160 = FigMotionMultiplyByInverseOfQuaternion((double *)(v59 + 28064), v161);
      *(void *)(v160 + 8) = v162;
      *(void *)(v160 + 16) = v163;
      *(void *)(v160 + 24) = v164;
      v165 = v60[993] ? (float32x2_t *)v159 : 0LL;
      int32x2_t v166 = GVSComputeTransformFromCameraMotion((double *)v160, v356, (uint64_t)v361, v165, (float32x2_t *)cf, v158);
      if ((_DWORD)v166) {
        break;
      }
      if (*(_BYTE *)(v59 + 200)) {
        limitTransformToOverscan((uint64_t)v353, (double *)&v366 + 1, (uint64_t)v158, *(float *)&v361[20]);
      }
      v158 += 9;
      v159 += 8LL;
      v161 += 4;
      v160 += 32LL;
      if (!--v157) {
        goto LABEL_218;
      }
    }

    StabilizedSampleBuffer = v166;
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v329) = StabilizedSampleBuffer;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
  }

  else
  {
LABEL_218:
    StabilizedSampleBuffer = sbp_gvs_createStabilizedSampleBuffer(v59, target, (uint64_t)v361, (const char *)&v370);
    if (!(_DWORD)StabilizedSampleBuffer)
    {
      uint64_t v57 = v370;
      goto LABEL_220;
    }

    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v329) = StabilizedSampleBuffer;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
    if (v370) {
      CFRelease(v370);
    }
  }

  uint64_t v57 = 0LL;
LABEL_220:
  uint64_t DerivedStorage = v339;
  unint64_t v4 = v340;
  if (!(_DWORD)StabilizedSampleBuffer) {
    goto LABEL_392;
  }
LABEL_436:
  fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
  LODWORD(v329) = StabilizedSampleBuffer;
  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
LABEL_393:
  if (*(void *)(DerivedStorage + 8))
  {
    sbp_emitPendingFrames(v4, StabilizedSampleBuffer, (uint64_t)v57);
    StabilizedSampleBuffer = 0LL;
  }

  if (v57) {
    CFRelease(v57);
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace(822152386LL, 10LL, (int)StabilizedSampleBuffer, 0LL, 0LL);
  }
  return StabilizedSampleBuffer;
}

LABEL_200:
                                            uint64_t v172 = DerivedStorage + 10648;
                                            if (*v312 != 3)
                                            {
                                              v178 = *(const __CFDictionary **)(DerivedStorage + 28824);
                                              uint64_t v176 = DerivedStorage + 28248;
                                              if (v178
                                                && (CFDictionaryGetValue( v178,  kFigCapturePortType_BackFacingTelephotoCamera)
                                                 || CFDictionaryGetValue( *(CFDictionaryRef *)(DerivedStorage + 28824),  kFigCapturePortType_BackFacingSuperWideCamera))
                                                && !FigMotionGetBravoDataFromDictionary( *(const __CFDictionary **)(DerivedStorage + 28824),  (uint64_t)v309))
                                              {
                                                if (!*v309) {
                                                  int *v309 = 6;
                                                }
                                                FigMotionAdjustBravoDataForReferenceCamera((uint64_t)v309);
                                              }

                                              int v177 = *v309;
                                              if (*v309) {
                                                _BYTE *v310 = 1;
                                              }
LABEL_212:
                                              if (*(_BYTE *)(v176 + 516)
                                                && ((v177 & 4) == 0 || (*v312 - 4) <= 0xFFFFFFFC))
                                              {
                                                *(_BYTE *)(v176 + 516) = 0;
                                              }

                                              if (*v306)
                                              {
                                                if ((*v312 - 1) > 3)
                                                {
                                                  _BYTE *v306 = 0;
                                                }

                                                else
                                                {
                                                  v179 = *(void **)(DerivedStorage + 28824);
                                                  id v323 = 0LL;
                                                  uint64_t v106 = GVSExtractCameraGeometryFromCameraInfoByPortType( v179,  (char *)&v323);
                                                  id v180 = v323;
                                                  id v181 = v323;
                                                  if ((_DWORD)v106)
                                                  {
                                                    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                                    LODWORD(v295) = v106;
                                                    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v295,  v3,  v296,  v297,  (_DWORD)v298,  v300,  v302,  v304);

                                                    goto LABEL_305;
                                                  }

                                                  objc_storeStrong((id *)(DerivedStorage + 368), v180);
                                                  if ((*(_DWORD *)v176 & 2) != 0) {
                                                    *(_DWORD *)v176 &= ~2u;
                                                  }
                                                  _BYTE *v310 = 1;
                                                }
                                              }

                                              if (*(float *)(DerivedStorage + 29688) > 0.0)
                                              {
                                                [*(id *)(DerivedStorage + 27096) setExtractGravityData:1];
                                                if (!*v310) {
                                                  _BYTE *v310 = 1;
                                                }
                                              }

                                              if (*(_BYTE *)(DerivedStorage + 29756))
                                              {
                                                *(float *)(DerivedStorage + 29764) = fminf( fmaxf( *(float *)(DerivedStorage + 29764),  0.0),  1.0);
                                                *(float *)(DerivedStorage + 29768) = fmaxf( *(float *)(DerivedStorage + 29768),  1.0);
                                                float v182 = (float)*v305;
                                                float v183 = (float)(v182 / *v308) / 30.0;
                                                int v184 = vcvtms_s32_f32(v183 * (float)*(int *)(DerivedStorage + 29772));
                                                int v185 = v184 & ~(v184 >> 31);
                                                if (v185 >= (int)(float)(v182
                                                                        + (float)((float)(v183 * -3.0)
                                                                                * *(float *)(DerivedStorage + 29760))))
                                                  int v185 = (int)(float)(v182
                                                *(_DWORD *)(DerivedStorage + 29772) = v185;
                                              }

                                              int v186 = *(_DWORD *)v19;
                                              if (*(int *)v19 < 1)
                                              {
                                                if (v186)
                                                {
LABEL_237:
                                                  __int128 v329 = 0u;
                                                  __int128 v327 = 0u;
                                                  __int128 v328 = 0u;
                                                  __int128 v326 = 0u;
                                                  id v194 = *(id *)(DerivedStorage + 29088);
                                                  id v195 = [v194 countByEnumeratingWithState:&v326 objects:&rect count:16];
                                                  if (v195)
                                                  {
                                                    id v196 = v195;
                                                    int v197 = 0;
                                                    uint64_t v198 = *(void *)v327;
                                                    do
                                                    {
                                                      for (k = 0LL; k != v196; k = (char *)k + 1)
                                                      {
                                                        if (*(void *)v327 != v198) {
                                                          objc_enumerationMutation(v194);
                                                        }
                                                        v200 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(DerivedStorage + 29088),  "objectForKeyedSubscript:",  *(void *)(*((void *)&v326 + 1)
                                                                                     + 8LL * (void)k)));
                                                        v197 |= [v200 unsignedIntValue];
                                                      }

                                                      id v196 = [v194 countByEnumeratingWithState:&v326 objects:&rect count:16];
                                                    }

                                                    while (v196);

                                                    if ((v197 & 1) != 0)
                                                    {
                                                      v201 = objc_alloc_init(&OBJC_CLASS___GVSDistortionModelEven14);
                                                      v202 = *(void **)(DerivedStorage + 28848);
                                                      *(void *)(DerivedStorage + 28848) = v201;
                                                    }

                                                    uint64_t v172 = DerivedStorage + 10648;
                                                    uint64_t v19 = DerivedStorage + 28832;
                                                    if ((v197 & 2) == 0) {
                                                      goto LABEL_249;
                                                    }
                                                    v203 = objc_alloc_init(&OBJC_CLASS___GVSDistortionModelEven14);
                                                    id v194 = *(id *)(DerivedStorage + 28856);
                                                    *(void *)(DerivedStorage + 28856) = v203;
                                                  }

LABEL_249:
                                                  if (!*v310
                                                    && (*(void *)(DerivedStorage + 28848)
                                                     || *(void *)(DerivedStorage + 28856)))
                                                  {
                                                    _BYTE *v310 = 1;
                                                  }

                                                  if (!*v313)
                                                  {
LABEL_257:
                                                    size_t v209 = *(unsigned int *)(DerivedStorage + 180);
                                                    if ((int)v209 < 1
                                                      || (int v210 = *(_DWORD *)(DerivedStorage + 184), v210 < 1))
                                                    {
                                                      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                                      LODWORD(v295) = 0;
                                                      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v295,  v3,  v296,  v297,  (_DWORD)v298,  v300,  v302,  v304);
                                                      uint64_t v106 = FigSignalErrorAt( 4294954516LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
                                                      if (!(_DWORD)v106)
                                                      {
LABEL_263:
                                                        int v213 = *(_DWORD *)(DerivedStorage + 152);
                                                        if (v213 <= *(_DWORD *)(DerivedStorage + 156)) {
                                                          int v213 = *(_DWORD *)(DerivedStorage + 156);
                                                        }
                                                        *(float *)(v19 + 296) = (float)((float)v213 * 0.5) / 10.0;
                                                        v298 = v3;
                                                        if (*v312 == 2) {
                                                          uint64_t v214 = 1LL;
                                                        }
                                                        else {
                                                          uint64_t v214 = (*v305 + 1);
                                                        }
                                                        *(_DWORD *)(v19 + 516) = v214;
                                                        if (*(_DWORD *)(DerivedStorage + 29564))
                                                        {
                                                          float v215 = (float)*v305 / *v308;
                                                          uint64_t v216 = 80LL;
                                                          if (v215 < 50.0) {
                                                            uint64_t v216 = 76LL;
                                                          }
                                                          uint64_t v217 = (float)((float)(*(float *)&v313[v216]
                                                                                             * v215)
                                                                                     * 0.5);
                                                          uint64_t v218 = *(unsigned int *)(DerivedStorage + 29560);
                                                          v219 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(DerivedStorage + 96) commandQueue]);
                                                          uint64_t v220 = objc_claimAutoreleasedReturnValue( +[STFIBPProvider STFVideoProcessorForVersion:ringBufferSize:historySize:cmdQueue:]( &OBJC_CLASS___STFIBPProvider,  "STFVideoProcessorForVersion:ringBufferSize:historySize:cmdQueue:",  v218,  v214,  v217,  v219));
                                                          v221 = *(void **)(DerivedStorage + 29600);
                                                          *(void *)(DerivedStorage + 29600) = v220;

                                                          uint64_t v19 = DerivedStorage + 28832;
                                                          v222 = *(void **)(DerivedStorage + 29600);
                                                          if (v222
                                                            || (fig_log_get_emitter( "com.apple.cameracapture",  &unk_337EA),  LODWORD(v295) = 0,  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v295,  v3,  v296,  v297,  (_DWORD)v3,  v300,  v302,  v304),  (v222 = *(void **)(DerivedStorage + 29600)) != 0LL))
                                                          {
                                                            [v222 setLtmStabilizationMode:*(unsigned int *)(DerivedStorage + 29564)];
                                                            [*(id *)(DerivedStorage + 29600) setTcrMode:*(unsigned int *)(DerivedStorage + 29568)];
                                                            LODWORD(v223) = *(_DWORD *)(DerivedStorage + 29584);
                                                            [*(id *)(DerivedStorage + 29600) setTcrSkyMaskStrength:v223];
                                                            LODWORD(v224) = *(_DWORD *)(DerivedStorage + 29580);
                                                            [*(id *)(DerivedStorage + 29600) setTcrGlobalStrength:v224];
                                                            LODWORD(v225) = *(_DWORD *)(DerivedStorage + 29588);
                                                            [*(id *)(DerivedStorage + 29600) setTcrExtraMaskStrength:v225];
                                                            LODWORD(v226) = *(_DWORD *)(DerivedStorage + 29572);
                                                            [*(id *)(DerivedStorage + 29600) setTemporalWindowTimeDefault:v226];
                                                          }
                                                        }

                                                        int v227 = *(_DWORD *)(v19 + 516);
                                                        if (!*(_DWORD *)(DerivedStorage + 29744)) {
                                                          *(_DWORD *)(DerivedStorage + 29744) = v227;
                                                        }
                                                        uint64_t v228 = *(int *)(v19 + 584);
                                                        *(_DWORD *)(v19 + 572) = v228 + 1;
                                                        v229 = calloc(v227, 8uLL);
                                                        *(void *)(DerivedStorage + 29320) = v229;
                                                        if (v229)
                                                        {
                                                          unint64_t v3 = v298;
                                                          if (*v123)
                                                          {
                                                            v230 = calloc(*(int *)(v19 + 516), 0x18uLL);
                                                            *(void *)(DerivedStorage + 29328) = v230;
                                                            if (!v230)
                                                            {
                                                              id v249 = (id)FigSignalErrorAt( 4294954510LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
                                                              goto LABEL_303;
                                                            }
                                                          }

                                                          v231 = (void *)(DerivedStorage + 29360);
                                                          *(void *)(DerivedStorage + 29360) = 0LL;
                                                          *(void *)(DerivedStorage + 29368) = 0LL;
                                                          if (!*v310)
                                                          {
LABEL_302:
                                                            v247 = objc_alloc_init(&OBJC_CLASS___GVSSmoothingBuffers);
                                                            v248 = *(void **)(DerivedStorage + 29352);
                                                            *(void *)(DerivedStorage + 29352) = v247;

                                                            id v249 = [*(id *)(DerivedStorage + 29352) allocateBufferWithSize:(2 * v228) | 1 allocateForRollSmoothing:*(float *)(DerivedStorage + 29688) > 0.0];
LABEL_303:
                                                            uint64_t v106 = (uint64_t)v249;
                                                            if ((_DWORD)v249)
                                                            {
LABEL_304:
                                                              _cinematic_freeRingBuffers((void *)DerivedStorage);
                                                              uint64_t v250 = fig_log_get_emitter( "com.apple.cameracapture",  &unk_337EA);
                                                              LODWORD(v295) = v106;
                                                              FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v250,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  3073LL,  v295);
                                                              goto LABEL_305;
                                                            }

                                                            if ((*v312 & 0xFFFFFFFE) == 2) {
                                                              *(_BYTE *)(v172 + 1) = 1;
                                                            }
                                                            if (*v123)
                                                            {
                                                              v252 = *(void **)(DerivedStorage + 30016);
                                                              if (v252)
                                                              {
                                                                id v253 = [v252 initGhostInformationLookAheadForSize:*(unsigned int *)(v19 + 516)];
                                                                if ((_DWORD)v253)
                                                                {
                                                                  uint64_t v106 = (uint64_t)v253;
                                                                  uint64_t v293 = fig_log_get_emitter( "com.apple.cameracapture",  &unk_337EA);
                                                                  LODWORD(v295) = v106;
                                                                  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v293,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  "failed initializing bright light video deghosting look-ahead",  "GVSGyroStabilizationV2.m",  3089LL,  v295);
                                                                  goto LABEL_305;
                                                                }
                                                              }

                                                              v254 = *(void **)(DerivedStorage + 30024);
                                                              if (v254)
                                                              {
                                                                id v255 = [v254 initGhostInformationLookAheadForSize:*(unsigned int *)(v19 + 516)];
                                                                if ((_DWORD)v255)
                                                                {
                                                                  uint64_t v106 = (uint64_t)v255;
                                                                  uint64_t v294 = fig_log_get_emitter( "com.apple.cameracapture",  &unk_337EA);
                                                                  LODWORD(v295) = v106;
                                                                  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v294,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  "failed initializing low light video deghosting look-ahead",  "GVSGyroStabilizationV2.m",  3093LL,  v295);
                                                                  goto LABEL_305;
                                                                }
                                                              }
                                                            }

LABEL_316:
                                                            v150 = v300;
                                                            goto LABEL_166;
                                                          }

                                                          v232 = calloc(*(int *)(v19 + 572), 8uLL);
                                                          void *v231 = v232;
                                                          if (v232)
                                                          {
                                                            v233 = calloc(*(int *)(v19 + 572), 8uLL);
                                                            *(void *)(DerivedStorage + 29368) = v233;
                                                            if (v233)
                                                            {
                                                              uint64_t v234 = *(unsigned int *)(v19 + 572);
                                                              if ((int)v234 >= 1)
                                                              {
                                                                uint64_t v235 = 0LL;
                                                                size_t v236 = 8LL * *(int *)(DerivedStorage + 180);
                                                                while (1)
                                                                {
                                                                  *(void *)(*v231 + v235) = malloc(v236);
                                                                  if (!*(void *)(*v231 + v235))
                                                                  {
                                                                    uint64_t v260 = fig_log_get_emitter( "com.apple.cameracapture",  &unk_337EA);
                                                                    LODWORD(v295) = 0;
                                                                    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v260,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->sphereRing.derivedSphereLensMovements[ringIdx]",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2422LL,  v295);
                                                                    goto LABEL_339;
                                                                  }

                                                                  *(void *)(*(void *)(DerivedStorage + 29368) + v235) = malloc(0x38uLL);
                                                                  if (!*(void *)(*(void *)(DerivedStorage + 29368)
                                                                                  + v235))
                                                                    break;
                                                                  v235 += 8LL;
                                                                  if (8 * v234 == v235) {
                                                                    goto LABEL_287;
                                                                  }
                                                                }

                                                                uint64_t v261 = fig_log_get_emitter( "com.apple.cameracapture",  &unk_337EA);
                                                                LODWORD(v295) = 0;
                                                                FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v261,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->sphereRing.baseSphereLensMovements[ringIdx]",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2425LL,  v295);
                                                                goto LABEL_339;
                                                              }

LABEL_287:
                                                              if (*(void *)(DerivedStorage + 28848)
                                                                || *(void *)(DerivedStorage + 28856))
                                                              {
                                                                v237 = calloc((int)v234, 0xF0uLL);
                                                                *(void *)(DerivedStorage + 29376) = v237;
                                                                uint64_t v172 = DerivedStorage + 10648;
                                                                if (!v237)
                                                                {
                                                                  uint64_t v290 = fig_log_get_emitter( "com.apple.cameracapture",  &unk_337EA);
                                                                  LODWORD(v295) = 0;
                                                                  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v290,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->sphereRing.distortionData",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2433LL,  v295);
                                                                  goto LABEL_339;
                                                                }

                                                                uint64_t v19 = DerivedStorage + 28832;
                                                                LODWORD(v234) = *(_DWORD *)(DerivedStorage + 29404);
                                                                if ((int)v234 >= 1)
                                                                {
                                                                  uint64_t v238 = 0LL;
                                                                  uint64_t v239 = 0LL;
                                                                  while (1)
                                                                  {
                                                                    if (*(void *)(DerivedStorage + 28848))
                                                                    {
                                                                      v240 = objc_alloc_init(&OBJC_CLASS___GVSDistortionModelEven14);
                                                                      uint64_t v241 = *(void *)(DerivedStorage + 29376);
                                                                      v242 = *(void **)(v241 + v238);
                                                                      *(void *)(v241 + v238) = v240;

                                                                      if (!*(void *)(*(void *)(DerivedStorage
                                                                                                  + 29376)
                                                                                      + v238))
                                                                      {
                                                                        uint64_t v271 = fig_log_get_emitter( "com.apple.cameracapture",  &unk_337EA);
                                                                        LODWORD(v295) = 0;
                                                                        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v271,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->sphereRing.distortionData[ringIdx].inputModel",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2437LL,  v295);
                                                                        goto LABEL_339;
                                                                      }
                                                                    }

                                                                    if (*(void *)(DerivedStorage + 28856))
                                                                    {
                                                                      v243 = objc_alloc_init(&OBJC_CLASS___GVSDistortionModelEven14);
                                                                      uint64_t v244 = *(void *)(DerivedStorage + 29376) + v238;
                                                                      v245 = *(void **)(v244 + 8);
                                                                      *(void *)(v244 + 8) = v243;

                                                                      if (!*(void *)(*(void *)(DerivedStorage
                                                                                                  + 29376)
                                                                                      + v238
                                                                                      + 8))
                                                                        break;
                                                                    }

                                                                    ++v239;
                                                                    v238 += 240LL;
                                                                    if (v239 >= *(int *)(DerivedStorage + 29404))
                                                                    {
                                                                      LODWORD(v234) = *(_DWORD *)(DerivedStorage + 29404);
                                                                      goto LABEL_300;
                                                                    }
                                                                  }

                                                                  uint64_t v272 = fig_log_get_emitter( "com.apple.cameracapture",  &unk_337EA);
                                                                  LODWORD(v295) = 0;
                                                                  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v272,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->sphereRing.distortionData[ringIdx].outputModel",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2441LL,  v295);
                                                                  goto LABEL_339;
                                                                }
                                                              }

                                                              else
                                                              {
                                                                uint64_t v172 = DerivedStorage + 10648;
                                                                uint64_t v19 = DerivedStorage + 28832;
                                                              }

LABEL_300:
                                                              v246 = calloc((int)v234, 0xCuLL);
                                                              *(void *)(DerivedStorage + 29384) = v246;
                                                              if (v246) {
                                                                goto LABEL_302;
                                                              }
                                                              uint64_t v291 = fig_log_get_emitter( "com.apple.cameracapture",  &unk_337EA);
                                                              LODWORD(v295) = 0;
                                                              FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v291,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->sphereRing.referencePoseGravity",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2448LL,  v295);
                                                            }

                                                            else
                                                            {
                                                              uint64_t v288 = fig_log_get_emitter( "com.apple.cameracapture",  &unk_337EA);
                                                              LODWORD(v295) = 0;
                                                              FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v288,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->sphereRing.baseSphereLensMovements",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2417LL,  v295);
                                                            }
                                                          }

                                                          else
                                                          {
                                                            uint64_t v287 = fig_log_get_emitter( "com.apple.cameracapture",  &unk_337EA);
                                                            LODWORD(v295) = 0;
                                                            FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v287,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->sphereRing.derivedSphereLensMovements",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2414LL,  v295);
                                                          }
                                                        }

                                                        else
                                                        {
                                                          uint64_t v286 = fig_log_get_emitter( "com.apple.cameracapture",  &unk_337EA);
                                                          unint64_t v3 = v298;
                                                          LODWORD(v295) = 0;
                                                          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v286,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->framesRing.sampleBuffer",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2400LL,  v295);
                                                        }

LABEL_339:
                                                        uint64_t v106 = 4294954510LL;
                                                        goto LABEL_304;
                                                      }

LABEL_364:
                                                      sbp_gvs_freeDerivedVectorsAndSphereLensMovements(DerivedStorage);
                                                      uint64_t v285 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                                      LODWORD(v295) = v106;
                                                      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v285,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  3064LL,  v295);
                                                      goto LABEL_305;
                                                    }

                                                    if (*v310)
                                                    {
                                                      v211 = calloc(v209, 8uLL);
                                                      *(void *)(DerivedStorage + 28112) = v211;
                                                      if (!v211)
                                                      {
                                                        uint64_t v284 = fig_log_get_emitter( "com.apple.cameracapture",  &unk_337EA);
                                                        LODWORD(v295) = 0;
                                                        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v284,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->derivedSphereLensMovements",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  1313LL,  v295);
LABEL_363:
                                                        uint64_t v106 = 4294954510LL;
                                                        goto LABEL_364;
                                                      }

                                                      LODWORD(v209) = *(_DWORD *)(DerivedStorage + 180);
                                                      int v210 = *(_DWORD *)(DerivedStorage + 184);
                                                    }

                                                    v212 = calloc((int)v209 * (uint64_t)v210, 0x24uLL);
                                                    *(void *)(DerivedStorage + 27376) = v212;
                                                    if (v212) {
                                                      goto LABEL_263;
                                                    }
                                                    uint64_t v282 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                                    LODWORD(v295) = 0;
                                                    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v282,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->derivedVectors",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  1318LL,  v295);
                                                    goto LABEL_363;
                                                  }

                                                  v204 = objc_alloc(&OBJC_CLASS___GVSMotionBlurFilter);
                                                  CGPoint v205 = *(CGPoint *)v313;
                                                  rect.size.width = *(CGFloat *)(DerivedStorage + 29512);
                                                  rect.CGPoint origin = v205;
                                                  v206 = -[GVSMotionBlurFilter initWithSettings:]( v204,  "initWithSettings:",  &rect);
                                                  v207 = *(void **)(DerivedStorage + 29520);
                                                  *(void *)(DerivedStorage + 29520) = v206;

                                                  v208 = *(void **)(DerivedStorage + 29520);
                                                  if (v208)
                                                  {
                                                    if (*v311 == 11) {
                                                      [v208 suspend];
                                                    }
                                                    goto LABEL_257;
                                                  }

                                                  uint64_t v283 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                                  LODWORD(v295) = 0;
                                                  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v283,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->shimmerFilter",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  3056LL,  v295);
LABEL_361:
                                                  uint64_t v147 = 4294954510LL;
                                                  goto LABEL_164;
                                                }

                                                v188 = objc_alloc_init(&OBJC_CLASS___NSDictionary);
                                              }

                                              else
                                              {
                                                uint64_t v187 = v186 & 3;
                                                v188 = -[NSMutableDictionary initWithDictionary:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithDictionary:",  *(void *)(DerivedStorage + 29088));
                                                v189 = -[NSNumber initWithUnsignedInt:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedInt:",  v187);
                                                -[NSMutableDictionary setObject:forKeyedSubscript:]( v188,  "setObject:forKeyedSubscript:",  v189,  kFigCapturePortType_BackFacingCamera);

                                                int v190 = *(_DWORD *)v19;
                                                if ((*(_DWORD *)v19 & 4) != 0)
                                                {
                                                  v191 = -[NSNumber initWithUnsignedInt:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedInt:",  v187);
                                                  -[NSMutableDictionary setObject:forKeyedSubscript:]( v188,  "setObject:forKeyedSubscript:",  v191,  kFigCapturePortType_BackFacingTelephotoCamera);

                                                  int v190 = *(_DWORD *)v19;
                                                }

                                                if ((v190 & 8) != 0)
                                                {
                                                  v192 = -[NSNumber initWithUnsignedInt:]( objc_alloc(&OBJC_CLASS___NSNumber),  "initWithUnsignedInt:",  v187);
                                                  -[NSMutableDictionary setObject:forKeyedSubscript:]( v188,  "setObject:forKeyedSubscript:",  v192,  kFigCapturePortType_BackFacingSuperWideCamera);
                                                }
                                              }

                                              v193 = *(void **)(DerivedStorage + 29088);
                                              *(void *)(DerivedStorage + 29088) = v188;

                                              goto LABEL_237;
                                            }

LABEL_201:
                                            uint64_t v176 = DerivedStorage + 28248;
                                            int v177 = *v309;
                                            if (*v309)
                                            {
                                              LOBYTE(v177) = 0;
                                              int *v309 = 0;
                                            }

                                            goto LABEL_212;
                                          }
                                        }

                                        *(_OWORD *)(DerivedStorage + 180) = xmmword_375D0;
                                        int v155 = 1;
                                        int v156 = 1;
                                        goto LABEL_183;
                                      }

                                      uint64_t v149 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                      LODWORD(v295) = 0;
                                      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v149,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "isOutputRectCentered",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2837LL,  v295);
                                    }

LABEL_163:
                                    uint64_t v147 = 4294954516LL;
                                    goto LABEL_164;
                                  }

                                  v111 = objc_alloc_init(&OBJC_CLASS___GVSIIR2FilterFloat);
                                  v112 = *(void **)(DerivedStorage + 29704);
                                  *(void *)(DerivedStorage + 29704) = v111;

                                  if (*(void *)(DerivedStorage + 29704))
                                  {
                                    v113 = objc_alloc(&OBJC_CLASS___GVSRollAnalyzer);
                                    LODWORD(v114) = 1058642330;
                                    LODWORD(v115) = 958220626;
                                    v116 = -[GVSRollAnalyzer initWithTimeConstant:initialVariance:]( v113,  "initWithTimeConstant:initialVariance:",  v114,  v115);
                                    v117 = objc_alloc(&OBJC_CLASS___GVSRollSmoothingAdaptiveFilter);
                                    rect.CGPoint origin = (CGPoint)xmmword_376B0;
                                    LODWORD(rect.size.width) = 1003170143;
                                    LODWORD(v118) = 0.5;
                                    LODWORD(v119) = 0.5;
                                    v120 = -[GVSRollSmoothingAdaptiveFilter initWithMaxTimescale:minTimescale:transitionTime:analyzer:rampingSettings:]( v117,  "initWithMaxTimescale:minTimescale:transitionTime:analyzer:rampingSettings:",  v116,  &rect,  COERCE_DOUBLE(COERCE_UNSIGNED_INT(15.0) | 0x3F80000000000000LL),  v118,  v119);
                                    v121 = *(void **)(DerivedStorage + 29696);
                                    *(void *)(DerivedStorage + 29696) = v120;

                                    if (v116 && *(void *)(DerivedStorage + 29696))
                                    {

                                      goto LABEL_124;
                                    }

                                    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                    LODWORD(v295) = 0;
                                    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v295,  v3,  v296,  v297,  (_DWORD)v298,  v300,  v302,  v304);
                                    uint64_t v106 = FigSignalErrorAt(4294954510LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);

LABEL_111:
                                    v107 = 0LL;
                                    goto LABEL_306;
                                  }

                                  uint64_t v275 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                  LODWORD(v295) = 0;
                                  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v275,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->reverseRollFilter",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  9886LL,  v295);
                                  goto LABEL_343;
                                }

                                BOOL v108 = v105 <= 9;
                              }

                              else
                              {
                                BOOL v108 = *v308 <= 0.999;
                              }

                              char v109 = !v108;
                              *(_BYTE *)uint64_t v18 = v109;
                              goto LABEL_118;
                            }

                            goto LABEL_108;
                          }

                          uint64_t v270 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                          LODWORD(v295) = 0;
                          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v270,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "FigCFDictionaryGetInt32IfPresent( outputPixelBufferAttributes, kCVPixelBufferHeightKey, &sto rage->outputHeight)",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  9739LL,  v295);
                        }

                        else
                        {
                          uint64_t v269 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                          LODWORD(v295) = 0;
                          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v269,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "FigCFDictionaryGetInt32IfPresent( outputPixelBufferAttributes, kCVPixelBufferWidthKey, &stor age->outputWidth)",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  9736LL,  v295);
                        }
                      }

                      else
                      {
                        uint64_t v268 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                        LODWORD(v295) = 0;
                        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v268,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "outputPixelBufferAttributes",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  9731LL,  v295);
                      }
                    }

                    else
                    {
                      uint64_t v266 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                      LODWORD(v295) = 0;
                      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v266,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "pixelFormatNum",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  9708LL,  v295);
                    }
                  }

                  else
                  {
                    uint64_t v265 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                    LODWORD(v295) = 0;
                    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v265,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "FigCFDictionaryGetInt32IfPresent( inputPixelBufferAttributes, kCVPixelBufferHeightKey, &inputHeight)",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  9704LL,  v295);
                  }
                }

                else
                {
                  uint64_t v264 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                  LODWORD(v295) = 0;
                  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v264,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "FigCFDictionaryGetInt32IfPresent( inputPixelBufferAttributes, kCVPixelBufferWidthKey, &inputWidth)",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  9701LL,  v295);
                }
              }

              else
              {
                uint64_t v263 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                LODWORD(v295) = 0;
                FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v263,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "inputPixelBufferAttributes",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  9696LL,  v295);
              }

LABEL_357:
              uint64_t v106 = FigSignalErrorAt(4294954513LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
              goto LABEL_109;
            }

            uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"LTMStabilizationMode"]);
            if (v60)
            {
              int v61 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"LTMStabilizationMode"]);
              *(_DWORD *)(v18 + 68) = [v61 unsignedIntValue];
            }

            else
            {
              *(_DWORD *)(v18 + 68) = 3;
            }

            float v62 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"TCRMode"]);
            if (v62)
            {
              v63 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"TCRMode"]);
              *(_DWORD *)(v18 + 72) = [v63 unsignedIntValue];
            }

            else
            {
              *(_DWORD *)(v18 + 72) = 1;
            }

            if ((v319 - 1) > 1)
            {
              float v67 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"TCRGlobalStrength"]);
              if (v67)
              {
                float v68 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"TCRGlobalStrength"]);
                [v68 floatValue];
                *(_DWORD *)(v18 + 84) = v69;
              }

              else
              {
                *(_DWORD *)(v18 + 84) = 1050253722;
              }

              float v70 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"TCRSkyMaskStrength"]);
              if (v70)
              {
                float v71 = @"TCRSkyMaskStrength";
                goto LABEL_64;
              }

              int v74 = 1058642330;
            }

            else
            {
              float v64 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"TCRGlobalStrengthActionCam"]);
              if (v64)
              {
                float v65 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"TCRGlobalStrengthActionCam"]);
                [v65 floatValue];
                *(_DWORD *)(v18 + 84) = v66;
              }

              else
              {
                *(_DWORD *)(v18 + 84) = 1063675494;
              }

              float v70 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"TCRSkyMaskStrengthActionCam"]);
              if (v70)
              {
                float v71 = @"TCRSkyMaskStrengthActionCam";
LABEL_64:
                uint64_t v72 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:v71]);
                [v72 floatValue];
                *(_DWORD *)(v18 + 88) = v73;

LABEL_68:
                __int128 v75 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"TCRExtraMaskStrength"]);
                if (v75)
                {
                  float32x4_t v76 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"TCRExtraMaskStrength"]);
                  [v76 floatValue];
                  *(_DWORD *)(v18 + 92) = v77;
                }

                else
                {
                  *(_DWORD *)(v18 + 92) = 1058642330;
                }

                __int128 v78 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"TemporalFilterWindowTime"]);
                if (v78)
                {
                  float32x4_t v79 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"TemporalFilterWindowTime"]);
                  [v79 floatValue];
                  *(_DWORD *)(v18 + 76) = v80;
                }

                else
                {
                  *(_DWORD *)(v18 + 76) = 1065353216;
                }

                uint64_t v81 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"TemporalFilterWindowTime60Fps"]);
                if (v81)
                {
                  v82 = (void *)objc_claimAutoreleasedReturnValue([v58 objectForKeyedSubscript:@"TemporalFilterWindowTime60Fps"]);
                  [v82 floatValue];
                  *(_DWORD *)(v18 + 80) = v83;
                }

                else
                {
                  *(_DWORD *)(v18 + 80) = 1061997773;
                }

                v84 = (void *)objc_claimAutoreleasedReturnValue( [v58 objectForKeyedSubscript:@"EnableCvisLtcCorrectionLutCompression"]);
                *(_BYTE *)(v18 + 96) = [v84 BOOLValue];

                v85 = (void *)objc_claimAutoreleasedReturnValue( [v58 objectForKeyedSubscript:@"EnableCvisLtmWithGlobalToneMapping"]);
                if (v85)
                {
                  int v86 = (void *)objc_claimAutoreleasedReturnValue( [v58 objectForKeyedSubscript:@"EnableCvisLtmWithGlobalToneMapping"]);
                  *(_BYTE *)(v18 + 128) = [v86 BOOLValue];
                }

                else
                {
                  *(_BYTE *)(v18 + 128) = 0;
                }

                goto LABEL_81;
              }

              int v74 = 1063675494;
            }

            *(_DWORD *)(v18 + 88) = v74;
            goto LABEL_68;
          }

          fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          LODWORD(v295) = 0;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v295,  v3,  v296,  v297,  (_DWORD)v298,  v300,  v302,  v304);
          uint64_t v274 = 4294954516LL;
LABEL_350:
          uint64_t v106 = FigSignalErrorAt(v274, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
          goto LABEL_110;
        }

        uint64_t v279 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v295) = 0;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v279,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "( (storage->smoothingMethod) == kFigVideoStabilizationSmoothingMethod_PredeterminedTrajectory)",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  9563LL,  v295);
      }

      else
      {
        uint64_t v262 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v295) = 0;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v262,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->metalContext",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  9493LL,  v295);
      }

LABEL_349:
      uint64_t v274 = 4294954514LL;
      goto LABEL_350;
    }

    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v295) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v295,  v3,  v296,  v297,  (_DWORD)v298,  v300,  v302,  v304);
    uint64_t v256 = 4294954514LL;
LABEL_344:
    uint64_t v106 = FigSignalErrorAt(v256, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    goto LABEL_111;
  }

  fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
  FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v2, v296, v297, (_DWORD)v298, a2, v301, v303);
  v107 = 0LL;
  uint64_t v106 = 4294954510LL;
LABEL_306:
  if (cf) {
    CFRelease(cf);
  }
LABEL_308:

  return v106;
}

void _sampleBufferImagePreStabilizationCallback(void *a1, uint64_t a2, opaqueCMSampleBuffer *a3)
{
  uint64_t v5 = a1;
  int v7 = v5;
  if (a3)
  {
    CMSampleBufferGetImageBuffer(a3);
LABEL_4:
    id WeakRetained = objc_loadWeakRetained(v7 + 9);
    [WeakRetained willStartProcessingBuffer:a3 withStatus:a2];

    uint64_t v5 = v7;
    goto LABEL_5;
  }

  if ((_DWORD)a2) {
    goto LABEL_4;
  }
LABEL_5:
}

uint64_t sbp_gvs_setPostOutputCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (*(_BYTE *)(DerivedStorage + 24)) {
    return FigSignalErrorAt(4294954511LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  *(void *)(DerivedStorage + 8) = a2;
  *(void *)(DerivedStorage + 16) = a3;
  [*(id *)(DerivedStorage + 112) setDelegate:a3];
  return 0LL;
}

void _sampleBufferImageReadyCallback(void *a1, uint64_t a2, opaqueCMSampleBuffer *a3)
{
  uint64_t v5 = a1;
  float v17 = v5;
  if (a3)
  {
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    uint64_t v5 = v17;
  }

  else
  {
    CVImageBufferRef ImageBuffer = 0LL;
  }

  if ([v5[8] transformPlatform] == 1
    || [v17[8] transformPlatform] == 2)
  {
    BOOL v7 = 1;
    if ((_DWORD)a2) {
      goto LABEL_28;
    }
  }

  else
  {
    BOOL v7 = [v17[8] transformPlatform] == 3;
    if ((_DWORD)a2) {
      goto LABEL_28;
    }
  }

  if (v7)
  {
    if (a3)
    {
      FigSimpleMutexLock(v17[3]);
      if ([v17[4] containsObject:ImageBuffer])
      {
        [v17[4] removeObject:ImageBuffer];
        FigSimpleMutexUnlock(v17[3]);
        id WeakRetained = objc_loadWeakRetained(v17 + 9);
        [WeakRetained didCompleteProcessingOfBuffer:a3 withStatus:0];
      }

      else
      {
        [v17[5] addObject:ImageBuffer];
        [v17[6] addObject:a3];
        FigSimpleMutexUnlock(v17[3]);
      }

      goto LABEL_32;
    }

    if (*((_BYTE *)v17 + 17))
    {
      FigSimpleMutexLock(v17[3]);
      unsigned int v9 = [v17[5] count];
      FigSimpleMutexUnlock(v17[3]);
      if (!v9) {
        goto LABEL_32;
      }
      unsigned int v10 = 0;
      unsigned int v11 = v9;
      while (1)
      {
        unsigned int v12 = v11;
        unsigned int v11 = v9;
        usleep(0x3E8u);
        if (v12 == v9) {
          v10 += 1000;
        }
        else {
          unsigned int v10 = 0;
        }
        float v13 = v17;
        if (v10 < 0x493E0) {
          goto LABEL_26;
        }
        FigSimpleMutexLock(v17[3]);
        if (![v17[5] count]) {
          goto LABEL_24;
        }
        int v14 = (void *)objc_claimAutoreleasedReturnValue([v17[6] objectAtIndexedSubscript:0]);

        if (!v14) {
          break;
        }
        CFRetain(v14);
        [v17[6] removeObjectAtIndex:0];
        [v17[5] removeObjectAtIndex:0];
        FigSimpleMutexUnlock(v17[3]);
        id v15 = objc_loadWeakRetained(v17 + 9);
        [v15 didCompleteProcessingOfBuffer:v14 withStatus:4294954514];

        CFRelease(v14);
LABEL_25:
        float v13 = v17;
LABEL_26:
        FigSimpleMutexLock(v13[3]);
        unsigned int v9 = [v17[5] count];
        FigSimpleMutexUnlock(v17[3]);
        if (!v9) {
          goto LABEL_32;
        }
      }

      [v17[6] removeObjectAtIndex:0];
      [v17[5] removeObjectAtIndex:0];
LABEL_24:
      FigSimpleMutexUnlock(v17[3]);
      goto LABEL_25;
    }
  }

LABEL_28:
  if ((_DWORD)a2 || a3)
  {
    id v16 = objc_loadWeakRetained(v17 + 9);
    [v16 didCompleteProcessingOfBuffer:a3 withStatus:a2];
  }

LABEL_32:
}

    a6 = v185;
    a7 = v186;
    a1 = v191;
    a2 = (uint64_t)v198;
  }

  if (a4)
  {
    uint64_t v49 = (const __CFArray *)CFDictionaryGetValue( a1,  kFigMotionAttachmentsSampleBufferProcessorMetadata_MotionAttachmentsISPHallData);
    if (v49)
    {
      uint64_t v50 = v49;
      float v51 = (_BYTE *)(a4 + 16418);
      v193 = *(float *)(a4 + 16420);
      int v52 = CFArrayGetCount(v49);
      if (v52 > 2)
      {
        __int128 v175 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v175,  "Fig",  "arrayCount <=(kFigHallPositionIndex_BackFacingTelephotoCamera + 1)",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  982LL,  0);
LABEL_179:
        int v153 = FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
        if ((_DWORD)v153)
        {
          v164 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          LODWORD(v180) = v153;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v164,  "Fig",  "err == 0 ",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  1949LL,  v180);
LABEL_190:

          goto LABEL_191;
        }
      }

      else if (v52 >= 1)
      {
        uint64_t v53 = 0LL;
        id v195 = v52;
        v192 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(1.0 - v193), 0);
        CGSize v54 = a4 + 16416;
        v188 = v50;
        do
        {
          float32x4_t v55 = (const __CFArray *)CFArrayGetValueAtIndex(v50, v53);
          if (v55)
          {
            uint64_t v56 = v55;
            v211[0] = 0;
            uint64_t v57 = (const __CFNumber *)CFArrayGetValueAtIndex(v55, 0LL);
            if (v57) {
              CFNumberGetValue(v57, kCFNumberIntType, v211);
            }
            uint64_t v58 = v211[0];
            if ((int)v211[0] > 1)
            {
              v163 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
              FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v163,  "Fig",  "(int)currentPort <(kFigHallPositionIndex_BackFacingTelephotoCamera + 1)",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  995LL,  0);
              goto LABEL_179;
            }

            uint64_t v59 = (const __CFArray *)CFArrayGetValueAtIndex(v56, 1LL);
            if (v59)
            {
              uint64_t v60 = v59;
              int v61 = CFArrayGetCount(v59);
              if (v61 >= 1)
              {
                float v62 = 0LL;
                v63 = a4 + (v58 << 12) + 8;
                float v64 = v61;
                do
                {
                  *(void *)buffer = 0LL;
                  *(void *)v200 = 0LL;
                  float v65 = (const __CFArray *)CFArrayGetValueAtIndex(v60, v62);
                  int v66 = (const __CFNumber *)CFArrayGetValueAtIndex(v65, 0LL);
                  float v67 = (const __CFData *)CFArrayGetValueAtIndex(v65, 1LL);
                  if (v66)
                  {
                    float v68 = v67;
                    if (v67)
                    {
                      if (CFDataGetLength(v67) == 8)
                      {
                        CFNumberGetValue(v66, kCFNumberDoubleType, buffer);
                        v214.location = 0LL;
                        v214.length = 8LL;
                        CFDataGetBytes(v68, v214, v200);
                        int v69 = v211[0];
                        float v70 = *(int *)(a4 + 4LL * v211[0]);
                        *(_DWORD *)(a4 + 4LL * v211[0]) = ((_WORD)v70 + 1) & 0x1FF;
                        *(double *)(v63 + 8 * v70) = *(double *)buffer + *(double *)(a4 + 16408);
                        if (*(_BYTE *)(v54 + v69))
                        {
                          if (!*v51) {
                            *(void *)(a4 + 8 * v69 + 16424) = *(void *)v200;
                          }
                          *(_BYTE *)(v54 + v69) = 0;
                        }

                        float v71 = (void *)(a4 + (v69 << 12) + 8 * v70 + 8200);
                        if (*v51)
                        {
                          CFStringRef v71 = *(void *)v200;
                        }

                        else
                        {
                          uint64_t v72 = (float32x2_t *)(a4 + 8 * v69);
                          int v73 = *(float32x2_t *)v200;
                          CFStringRef v71 = vsub_f32(*(float32x2_t *)v200, v72[2053]);
                          v72[2053] = vcvt_f32_f64(vmlaq_f64(vcvtq_f64_f32(vmul_n_f32(v72[2053], v193)), v192, vcvtq_f64_f32(v73)));
                        }
                      }
                    }
                  }

                  ++v62;
                }

                while (v64 != v62);
              }

              a1 = v191;
              a2 = (uint64_t)v198;
              uint64_t v50 = v188;
            }
          }

          ++v53;
        }

        while (v53 != v195);
      }
    }

    int v74 = (const __CFNumber *)CFDictionaryGetValue( a1,  kFigMotionAttachmentsSampleBufferProcessorMetadata_SphereScalingFactor);
    if (v74)
    {
      a7 = v186;
      CFNumberGetValue(v74, kCFNumberFloatType, (void *)(v186 + 16));
      a6 = v185;
    }

    else
    {
      __int128 v75 = (const __CFNumber *)CFDictionaryGetValue( a1,  kFigMotionAttachmentsSampleBufferProcessorMetadata_ScalingFactor);
      a6 = v185;
      a7 = v186;
      if (v75)
      {
        *(_DWORD *)buffer = 0;
        CFNumberGetValue(v75, kCFNumberFloatType, buffer);
        *(float *)(v186 + 16) = *(float *)buffer / 1.5;
      }

      else
      {
        *(_DWORD *)(v186 + 16) = 1065353216;
      }
    }
  }

  float32x4_t v76 = CFDictionaryGetValue(a1, kFigCaptureStreamMetadata_PortType);
  if (v76)
  {
    int v77 = portIndexFromPortType(v76, (int *)(a7 + 136));
    if ((_DWORD)v77)
    {
      int v153 = v77;
      uint64_t v173 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v180) = v153;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v173,  "Fig",  "err == 0 ",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  1985LL,  v180);
      goto LABEL_190;
    }
  }

  __int128 v78 = (int *)(a7 + 140);
  else {
    float32x4_t v79 = 1;
  }
  if (v79 <= 1) {
    float32x4_t v79 = 1;
  }
  *__int128 v78 = v79;

LABEL_71:
  v203 = 0LL;
  v204 = 0LL;
  if (*(_OWORD *)(a7 + 88) == 0LL)
  {
    int v80 = a6->i32[0];
    uint64_t v81 = a6->i32[1];
    *(_DWORD *)(a7 + 96) = a6->i32[0];
    *(_DWORD *)(a7 + 100) = v81;
  }

  else
  {
    int v80 = *(_DWORD *)(a7 + 96);
    uint64_t v81 = *(_DWORD *)(a7 + 100);
  }

  v82 = (float64x2_t *)v187;
  int v83 = (double)*(int *)(a7 + 88);
  v84 = (double)*(int *)(a7 + 92);
  v85 = (double)v80;
  int v86 = (double)v81;
  if (CGRectIsEmpty(*(CGRect *)(a7 + 104))
    || (v217.origin.x = v83,
        v217.origin.y = v84,
        v217.size.width = v85,
        v217.size.height = v86,
        float v215 = CGRectIntersection(*(CGRect *)(a7 + 104), v217),
        *(CGRect *)(a7 + 104) = v215,
        CGRectIsNull(v215)))
  {
    *(double *)(a7 + 104) = v83;
    *(double *)(a7 + 112) = v84;
    *(double *)(a7 + 120) = v85;
    *(double *)(a7 + 128) = v86;
  }

  else
  {
    int v83 = *(double *)(a7 + 104);
    v84 = *(double *)(a7 + 112);
    v85 = *(double *)(a7 + 120);
    int v86 = *(double *)(a7 + 128);
  }

  v216.origin.x = v83;
  v216.origin.y = v84;
  v216.size.width = v85;
  v216.size.height = v86;
  if (CGRectIsEmpty(v216))
  {
    v88.i64[0] = a6->i32[0];
    v88.i64[1] = (int)HIDWORD(*(unint64_t *)a6);
    v87 = vcvtq_f64_s64(v88);
    *id v181 = 0LL;
    v181[1] = 0LL;
    *(float64x2_t *)(a7 + 120) = v87;
  }

  if (a6[9].i8[4])
  {
    CFStringRef v89 = (const __CFDictionary *)CFDictionaryGetValue( a1,  kFigVideoStabilizationSampleBufferProcessorMetadata_InputFrameCropOffset);
    if (v89)
    {
      CGPointMakeWithDictionaryRepresentation(v89, (CGPoint *)buffer);
      v90.i64[0] = a6->i32[0];
      v90.i64[1] = (int)HIDWORD(*(unint64_t *)a6);
      *(float32x2_t *)&v87.f64[0] = vcvt_f32_f64(vmulq_f64(*(float64x2_t *)buffer, vcvtq_f64_s64(v90)));
      *(float64_t *)(a7 + 24) = v87.f64[0];
    }
  }

  LODWORD(v87.f64[0]) = *v183;
  if (a6[9].i8[0])
  {
    uint64_t v91 = vcvt_f32_s32(a6[4]);
    v92 = vcvt_f32_f64(*(float64x2_t *)(a7 + 120));
    __asm { FMOV            V3.2S, #-1.0 }

    v98 = vadd_f32(v91, _D3);
    uint64_t v99 = vadd_f32(v92, _D3);
    v100 = vdiv_f32(v98, vadd_f32(v99, (float32x2_t)vdup_n_s32(0xBF804189)));
    if (v100.f32[0] <= v100.f32[1]) {
      v100.f32[0] = v100.f32[1];
    }
    if (*(float *)v87.f64 < v100.f32[0])
    {
      *float v183 = v100.i32[0];
      LODWORD(v87.f64[0]) = v100.i32[0];
    }

    v101 = vsub_f32( vmla_f32(vcvt_f32_f64(*(float64x2_t *)(a7 + 104)), (float32x2_t)0x3F0000003F000000LL, v99),  vmla_f32(vcvt_f32_s32(a6[3]), (float32x2_t)0x3F0000003F000000LL, v98));
    v102 = vmul_f32( vsub_f32(v92, vdiv_f32(v91, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v87.f64[0], 0))),  (float32x2_t)0x3F0000003F000000LL);
    __asm { FMOV            V2.2S, #0.75 }

    v104 = vmaxnm_f32(vmla_f32((float32x2_t)0xBF000000BF000000LL, _D2, v102), 0LL);
    int v105 = vminnm_f32(vmaxnm_f32(*(float32x2_t *)(a7 + 24), vsub_f32(v101, v104)), vadd_f32(v104, v101));
    *(float32x2_t *)(a7 + 24) = v105;
    uint64_t v106 = v105.f32[1];
  }

  else
  {
    uint64_t v106 = *(float *)(a7 + 28);
  }

  v107 = a6[2].i32[1];
  BOOL v108 = (float)v107;
  char v109 = v108 / *(float *)v87.f64;
  float v110 = *(double *)(a7 + 48);
  v111 = *(double *)(a7 + 56) / (double)*(int *)(a7 + 100);
  v112 = *(double *)(a7 + 32)
       + v111
  *(double *)(a7 + 40) = v112;
  v113 = v111 * v109;
  double v114 = v112 - v110 * 0.5;
  double v115 = v114 + v113 * (((double)v107 + -1.0) / (double)v107 * 0.5);
  *(double *)(a7 + 64) = v113;
  *(double *)(a7 + 72) = v115;
  v116 = *(_OWORD *)(v187 + 40);
  v201 = *(_OWORD *)(v187 + 24);
  v202 = v116;
  if (*(_BYTE *)(v187 + 56))
  {
    v117 = CFDictionaryGetValue(a1, kFigCaptureStreamMetadata_PortType);
    double v118 = (void *)objc_claimAutoreleasedReturnValue(v117);
    double v119 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v187 + 64) objectForKeyedSubscript:v118]);
    v120 = v119;
    v121 = 0LL;
    if (v119 && [v119 length] == stru_20.segname)
    {
      BOOL v122 = (char *)[v120 bytes];
      *(void *)&v201 = FigMotionMultiplyQuaternions((double *)&v201, (double *)v122);
      *((void *)&v201 + 1) = v123;
      *(void *)&v202 = v124;
      *((void *)&v202 + 1) = v125;
      LODWORD(v207) = 1065353216;
      FigCFDictionaryGetFloatIfPresent(a1, kFigMotionAttachmentsSampleBufferProcessorMetadata_ScalingFactor, &v207);
      uint64_t v126 = *(unsigned int *)(a7 + 140);
      uint64_t v127 = (uint64_t)*a6;
      id v196 = CGPointZero;
      *(CGPoint *)buffer = CGPointZero;
      if (FigMotionComputeRawSensorCenterInBuffer( a1,  v127,  v126,  v126,  (float64x2_t *)buffer,  *(float *)&v207))
      {
        v128 = *(float *)(a7 + 16);
        v121 = vmul_n_f32(*(float32x2_t *)(v122 + 32), v128);
        v129 = v187;
      }

      else
      {
        v128 = *(float *)(a7 + 16);
        v129 = v187;
        v121 = vsub_f32( vmla_n_f32(vcvt_f32_f64(*(float64x2_t *)buffer), *(float32x2_t *)(v122 + 32), v128),  vcvt_f32_f64(*(float64x2_t *)v187));
      }

      if (!*(_BYTE *)(v129 + 57))
      {
        uint64_t v130 = (unint64_t)*a6;
        *(CGPoint *)v200 = v196;
        if (!FigMotionComputeOpticalCenterInBuffer( a1,  v130,  v126,  v126,  0LL,  (float64x2_t *)v200,  v128 / *(float *)&v207,  *(double *)(a7 + 32))) {
          v121 = vcvt_f32_f64(vsubq_f64(*(float64x2_t *)v200, *(float64x2_t *)v187));
        }
      }

      a2 = (uint64_t)v198;
    }

    v82 = (float64x2_t *)v187;
  }

  else
  {
    v121 = 0LL;
  }

  if (a10) {
    *a10 = v121;
  }
  v131 = v113 + v114;
  GVSComputeMotionBlur(a2, a4, a7, (double *)&v201, (void *)(a7 + 80));
  if (a8)
  {
    if (a13 == 1)
    {
      FigMotionComputeQuaternionForTimeStamp(a2, a8, v182, v115);
      if (*v182)
      {
        v132 = 1;
        goto LABEL_115;
      }

      int v177 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v180) = 0;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v177,  "Fig",  "motionData->didHaveMotionData",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  1489LL,  v180);
LABEL_197:
      int v153 = FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
      goto LABEL_177;
    }

    *float v182 = 1;
    if (a13 >= 1)
    {
      id v133 = 0LL;
      uint64_t v134 = a8;
      do
      {
        FigMotionComputeQuaternionForTimeStamp( a2,  v134,  (char *)buffer,  v114 + (double)(int)v133 * ((v131 - v114) / ((double)a13 + -1.0)));
        *v182 &= buffer[0];
        ++v133;
        v134 += 4;
      }

      while (a13 != v133);
    }

    FigMotionComputeQuaternionForTimeStamp(a2, &a8[4 * a13], (char *)buffer, v115);
    *v182 &= buffer[0];
    if ((a13 & 0x80000000) == 0)
    {
      v132 = a13 + 1;
LABEL_115:
      v135 = v132;
      v136 = (double *)a8;
      do
      {
        void *v136 = FigMotionMultiplyQuaternions(v136, (double *)&v201);
        *((void *)v136 + 1) = v137;
        *((void *)v136 + 2) = v138;
        *((void *)v136 + 3) = v139;
        v136 += 4;
        --v135;
      }

      while (v135);
    }
  }

  id v140 = a11;
  if (a9)
  {
    if (v189 && (uint64_t v141 = [v189 extractGravityData], a8) && v141)
    {
      [v189 computeGravity:a9 forTimestamp:v115];
    }

    else
    {
      *(void *)a9 = 0LL;
      *(_DWORD *)(a9 + 8) = 0;
    }
  }

  v199 = 0LL;
  if (a12)
  {
    v142 = *(_DWORD *)a12;
    int v143 = *(unsigned int *)(a7 + 136);
    FigMotionStashQuadraBinningFactor(a1, a12, v143);
    FigMotionUpdateBaseZoomFactorAdjustment(a1, a12, v143);
    if ((v142 & 2) != 0 && (_DWORD)v143 != *(_DWORD *)(a12 + 440))
    {
      if (!FigCFDictionaryGetFloat32IfPresent( a1,  kFigMotionAttachmentsSampleBufferProcessorMetadata_ScalingFactor,  v200)
        || !FigCFDictionaryGetFloat32IfPresent( a1,  kFigMotionAttachmentsSampleBufferProcessorMetadata_SphereScalingFactor,  &v207))
      {
        UpTime = FigGetUpTime();
        v160 = FigHostTimeToNanoseconds(UpTime);
        if (!low_freq_error_logging_last_log
          || (unint64_t)(v160 - low_freq_error_logging_last_log) >= 0x3B9ACA00)
        {
          if (low_freq_error_logging_filtered) {
            low_freq_error_logging_filtered = 0;
          }
          low_freq_error_logging_last_log = v160;
          if ((v142 & 4) == 0) {
            goto LABEL_145;
          }
          goto LABEL_130;
        }

        ++low_freq_error_logging_filtered;
        if ((v142 & 4) != 0)
        {
LABEL_130:
          int v146 = *(_DWORD *)(a12 + 440);
          if ((_DWORD)v143 != v146)
          {
            uint64_t v147 = *(_DWORD *)(a12 + 444);
            if ((_DWORD)v143 != v147)
            {
              int v148 = 0;
              uint64_t v149 = BravoCurrentToReferenceMapping[3 * v146 + v143];
              if (v146 == 2 && v147 != 2)
              {
                *(_DWORD *)buffer = 4;
                FigCFDictionaryGetInt32IfPresent(a1, kFigCaptureStreamMetadata_AFStatus, buffer);
                int v148 = *(_DWORD *)buffer != 4;
              }

              v150 = (_DWORD)v143 == 2 || v148;
              FigMotionComputeParallaxShift( (uint64_t)a1,  a12,  *(float *)(a12 + 48LL * v149 + 116),  *(float *)(a12 + 48LL * v149 + 132),  *(float *)(v186 + 16),  v143,  v150,  a12 + 448);
              *(_DWORD *)(a12 + 524) = *(_DWORD *)(v186 + 16);
            }

            if (!*(_BYTE *)(a12 + 516))
            {
              LODWORD(v144) = *(_DWORD *)(a12 + 452);
              int v151 = FigMotionAdjustParallaxShiftForScalingFactor( *(float *)(a12 + 448),  v144,  *(float *)(a12 + 524),  *(float *)(v186 + 16));
              v199.f32[0] = v199.f32[0] + v151;
              v199.f32[1] = v152 + v199.f32[1];
            }
          }

          if ((_DWORD)v143 != *(_DWORD *)(a12 + 444))
          {
            FigMotionClearFocalLengthData(a12);
            if ((_DWORD)v143 == *(_DWORD *)(a12 + 440)) {
              *(void *)(a12 + 448) = 0LL;
            }
          }

          FigMotionStashFocalLengthData(a1, a12, v143);
        }

uint64_t sbp_gvs_setProperty(uint64_t a1, const void *a2, const __CFBoolean *a3)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (!*(_BYTE *)(DerivedStorage + 24))
  {
    uint64_t v7 = DerivedStorage;
    if (CFEqual(a2, kFigVideoStabilizationSampleBufferProcessorProperty_VideoStabilizationDisabled))
    {
      if (a3)
      {
        CFTypeID TypeID = CFBooleanGetTypeID();
        if (TypeID == CFGetTypeID(a3))
        {
          Boolean Value = CFBooleanGetValue(a3);
          a3 = 0LL;
          *(_BYTE *)(v7 + 84) = Value;
          return (uint64_t)a3;
        }
      }

      goto LABEL_62;
    }

    if (CFEqual(a2, kFigVideoStabilizationSampleBufferProcessorProperty_SphereVideoEnabled))
    {
      if (!a3) {
        goto LABEL_62;
      }
      CFTypeID v10 = CFBooleanGetTypeID();
      if (v10 != CFGetTypeID(a3)) {
        goto LABEL_62;
      }
      int v11 = CFBooleanGetValue(a3);
      if (*(_BYTE *)(v7 + 32))
      {
        if (!v11 || *(_BYTE *)(v7 + 28105))
        {
          a3 = 0LL;
          *(_BYTE *)(v7 + 28104) = v11;
          return (uint64_t)a3;
        }

        uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->sphereCorrection",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  8343LL,  0);
LABEL_62:
        uint64_t v6 = 4294954516LL;
        return FigSignalErrorAt(v6, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
      }

      uint64_t v25 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v25,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->isFirstFrame",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  8340LL,  0);
    }

    else
    {
      if (CFEqual(a2, kFigVideoStabilizationSampleBufferProcessorProperty_FrameRateConversionEnabled))
      {
        if (a3)
        {
          CFTypeID v12 = CFBooleanGetTypeID();
          if (v12 == CFGetTypeID(a3) && (int v13 = CFBooleanGetValue(a3)) != 0 && *(_DWORD *)(v7 + 27116) == 1)
          {
            a3 = 0LL;
            *(_BYTE *)(v7 + 29730) = v13;
            *(_DWORD *)(v7 + 29740) = 0;
            *(void *)(v7 + 29732) = 0xFFFFFFFFLL;
            *(_WORD *)(v7 + 29748) = 1;
          }

          else
          {
            return 0LL;
          }
        }

        return (uint64_t)a3;
      }

      if (CFEqual(a2, kFigVideoStabilizationSampleBufferProcessorProperty_LongPressModeEnabled))
      {
        if (!a3 || (CFTypeID v14 = CFBooleanGetTypeID(), v14 != CFGetTypeID(a3)))
        {
          uint64_t v26 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v26,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "propertyValue && CFBooleanGetTypeID() == CFGetTypeID( propertyValue)",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  8375LL,  0);
          goto LABEL_62;
        }

        if (*(_BYTE *)(v7 + 32))
        {
          if (*(_BYTE *)(v7 + 288))
          {
            if (*(double *)(v7 + 29456) > 0.0 && *(double *)(v7 + 29464) > 0.0)
            {
              BOOL v15 = CFBooleanGetValue(a3) != 0;
              a3 = (const __CFBoolean *)sbp_enableLongPressMode(v7, v15);
              if ((_DWORD)a3)
              {
                uint64_t v16 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v16,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  8385LL,  (_DWORD)a3);
              }

              return (uint64_t)a3;
            }

            uint64_t v27 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
            FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v27,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->cinematicLivePhotoCleanOutputRect.size.width > 0 && storage->cinematicLivePhotoCleanOutputRect.size.height > 0",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  8381LL,  0);
          }

          else
          {
            uint64_t v30 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
            FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v30,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->blurBorderRequestedAtCreation",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  8379LL,  0);
          }
        }

        else
        {
          uint64_t v29 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v29,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->isFirstFrame",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  8377LL,  0);
        }
      }

      else if (CFEqual(a2, kFigVideoStabilizationSampleBufferProcessorProperty_P3ToBT2020ConversionEnabled) {
             && !*(_DWORD *)(v7 + 172))
      }
      {
        if (!a3 || (CFTypeID v22 = CFBooleanGetTypeID(), v22 != CFGetTypeID(a3)))
        {
          uint64_t v32 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v32,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "propertyValue && CFBooleanGetTypeID() == CFGetTypeID( propertyValue)",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  8390LL,  0);
          goto LABEL_62;
        }

        if (*(_BYTE *)(v7 + 32))
        {
          BOOL v23 = CFBooleanGetValue(a3) != 0;
          a3 = (const __CFBoolean *)sbp_enableP3ToBT2020Conversion(v7, (const char *)v23);
          if ((_DWORD)a3)
          {
            uint64_t v24 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
            FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v24,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  8396LL,  (_DWORD)a3);
          }

          return (uint64_t)a3;
        }

        uint64_t v35 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v35,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->isFirstFrame",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  8392LL,  0);
      }

      else if (CFEqual(a2, kFigVideoStabilizationSampleBufferProcessorProperty_FlipHorizontalOrientation))
      {
        if (!a3 || (CFTypeID v18 = CFBooleanGetTypeID(), v18 != CFGetTypeID(a3)))
        {
          uint64_t v31 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v31,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "propertyValue && CFBooleanGetTypeID() == CFGetTypeID( propertyValue)",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  8401LL,  0);
          goto LABEL_62;
        }

        int v19 = CFBooleanGetValue(a3);
        if (!v19 || !*(_DWORD *)(v7 + 172))
        {
          a3 = 0LL;
          *(_BYTE *)(v7 + 203) = v19;
          return (uint64_t)a3;
        }

        uint64_t v34 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v34,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "! flipHorizontal ||((storage->transformContext.platform) == kTransformGPU)",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  8403LL,  0);
      }

      else
      {
        if (!CFEqual(a2, kFigVideoStabilizationSampleBufferProcessorProperty_IMUToCameraExtrinsic)) {
          return 4294954512LL;
        }
        if (!a3 || (CFTypeID v20 = CFDataGetTypeID(), v20 != CFGetTypeID(a3)))
        {
          uint64_t v33 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v33,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "propertyValue && CFDataGetTypeID() == CFGetTypeID( propertyValue)",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  8409LL,  0);
          goto LABEL_62;
        }

        if (*(_BYTE *)(v7 + 32))
        {
          a3 = (const __CFBoolean *)sbp_setCameraExtrinsicAlignment(v7, a3);
          if ((_DWORD)a3)
          {
            uint64_t v21 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
            FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v21,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  8414LL,  (_DWORD)a3);
          }

          return (uint64_t)a3;
        }

        uint64_t v36 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v36,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->isFirstFrame",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  8411LL,  0);
      }
    }

    uint64_t v6 = 4294954514LL;
    return FigSignalErrorAt(v6, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  uint64_t v6 = 4294954511LL;
  return FigSignalErrorAt(v6, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t sbp_gvs_processSampleBuffer(uint64_t a1, opaqueCMSampleBuffer *a2)
{
  uint64_t v4 = a1;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a2);
  if (*(_BYTE *)(DerivedStorage + 24))
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
    uint64_t v304 = 4294954511LL;
LABEL_408:
    uint64_t StabilizedSampleBuffer = FigSignalErrorAt(v304, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    CFTypeRef v57 = 0LL;
    goto LABEL_393;
  }

  uint64_t v7 = ImageBuffer;
  uint64_t v8 = DerivedStorage + 29496;
  if (!ImageBuffer)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
  }

  if (!*(_BYTE *)(DerivedStorage + 29672) && !sbp_gvs_verifyInputBuffer(v7))
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v329) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "( storage->onlyGenerateTransformsParameters || sbp_gvs_verifyInputBuffer( pixelBuffer))",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  8958LL,  v329);
    goto LABEL_416;
  }

  unsigned int v9 = (_DWORD *)(DerivedStorage + 28248);
  if (gGMFigKTraceEnabled == 1)
  {
    _getPresentationTimeStampForSampleBuffer(a2, (uint64_t)&v359);
    time[0] = v359;
    *(void *)&time[1] = v360;
    Float64 Seconds = CMTimeGetSeconds((CMTime *)time);
    kdebug_trace(822152385LL, 10LL, *(void *)&Seconds, 0LL, 0LL);
  }

  if (CMGetAttachment(a2, kFigVideoStabilizationSampleBufferAttachmentKey_DepthSampleBuffer, 0LL))
  {
    int v11 = CMSampleBufferGetImageBuffer(a2);
    if (sbp_gvs_verifyInputBuffer(v11))
    {
      if (*(_BYTE *)(DerivedStorage + 32) && !*(_DWORD *)(DerivedStorage + 29488))
      {
        *(_BYTE *)uint64_t v8 = 0;
        CFTypeID v12 = *(void **)(DerivedStorage + 29520);
        *(void *)(DerivedStorage + 29520) = 0LL;
      }

      goto LABEL_13;
    }

    uint64_t v307 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v329) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v307,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "sbp_gvs_verifyInputBuffer( depthPixelBuffer)",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  8966LL,  v329);
LABEL_416:
    CFTypeRef v57 = 0LL;
    uint64_t StabilizedSampleBuffer = 4294954514LL;
    goto LABEL_393;
  }

LABEL_13:
  MetadataDictionary = (const __CFDictionary *)_getMetadataDictionary(a2);
  if (!MetadataDictionary)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v329) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
    uint64_t v304 = 4294954514LL;
    goto LABEL_408;
  }

  CFTypeID v14 = MetadataDictionary;
  uint64_t v15 = DerivedStorage + 27074;
  if (*(_DWORD *)(DerivedStorage + 27116) != 2) {
    goto LABEL_22;
  }
  Boolean Value = (const __CFArray *)CFDictionaryGetValue( MetadataDictionary,  kFigCaptureVideoStabilizationMetadata_CinematicFutureMetadataInitializationArray);
  float v17 = Value;
  if (!*(_BYTE *)(DerivedStorage + 32))
  {
    if (!Value)
    {
      unsigned int v18 = [*(id *)(DerivedStorage + 29352) centerIndex];
      if (v18 == [*(id *)(DerivedStorage + 29352) inputIndex])
      {
        uint64_t v314 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v329) = 0;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v314,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage->smoothingBuffer.centerIndex != storage->smoothingBuffer.inputIndex",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  9024LL,  v329);
        goto LABEL_410;
      }

      goto LABEL_21;
    }

    uint64_t v313 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v329) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v313,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "! metadataInitArray",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  9021LL,  v329);
LABEL_427:
    uint64_t v304 = 4294954516LL;
    goto LABEL_408;
  }

  if (!Value)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v329) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
    uint64_t v304 = 4294954513LL;
    goto LABEL_408;
  }

  if ((int)CFArrayGetCount(Value) <= 0)
  {
    uint64_t v311 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v329) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v311,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "(int)CFArrayGetCount( metadataInitArray) > 0",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  9016LL,  v329);
    goto LABEL_427;
  }

  *(void *)(DerivedStorage + 29424) = CFRetain(v17);
LABEL_21:
  CFTypeID v14 = (const __CFDictionary *)CFDictionaryGetValue(v14, kFigCaptureVideoStabilizationMetadata_CinematicFutureMetadata);
LABEL_22:
  if (*(_BYTE *)(DerivedStorage + 32))
  {
    ValueAtIndex = v14;
    if (*(void *)(DerivedStorage + 29424)) {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(DerivedStorage + 29424), 0LL);
    }
    CFTypeID v20 = CFDictionaryGetValue(ValueAtIndex, kFigCaptureStreamMetadata_PortType);
    uint64_t v21 = v20;
    if (*v9)
    {
      uint64_t v22 = bravoTransitionCameraIndexFromPortType(v20, (int *)(DerivedStorage + 28688));
      if ((_DWORD)v22)
      {
        uint64_t StabilizedSampleBuffer = v22;
        fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v329) = StabilizedSampleBuffer;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
        CFTypeRef v57 = 0LL;
        goto LABEL_393;
      }
    }

    uint64_t v23 = *(void *)(DerivedStorage + 128);
    v24.i64[0] = (int)v23;
    v24.i64[1] = SHIDWORD(v23);
    __asm { FMOV            V1.2D, #-1.0 }

    float64x2_t v29 = vaddq_f64(vcvtq_f64_s64(v24), _Q1);
    __asm { FMOV            V1.2D, #0.5 }

    *(float64x2_t *)(DerivedStorage + 304) = vmulq_f64(v29, _Q1);
    else {
      int v31 = FigCFEqual(v21, kFigCapturePortType_FrontFacingSuperWideCamera) != 0;
    }
    *(_BYTE *)(DerivedStorage + 320) = v31;
    if (!*(_BYTE *)(DerivedStorage + 289))
    {
      *(double *)(DerivedStorage + 328) = GVSGetDefaultExtrinsicToIMU(v31);
      *(void *)(DerivedStorage + 336) = v32;
      *(void *)(DerivedStorage + 344) = v33;
      *(void *)(DerivedStorage + 352) = v34;
      int v31 = *(unsigned __int8 *)(DerivedStorage + 320);
    }

    int v35 = *(_DWORD *)(DerivedStorage + 27116);
    BOOL v37 = (v35 - 1) < 3 && v31 == 0;
    *(_BYTE *)(DerivedStorage + 27104) = v37;
    unsigned int v38 = *(_DWORD *)(DerivedStorage + 27108);
    if (v38 <= 1) {
      *(_BYTE *)(DerivedStorage + 27104) = v38 == 1;
    }
    if (*(_BYTE *)(DerivedStorage + 28104)) {
      BOOL v39 = 1;
    }
    else {
      BOOL v39 = v35 == 3;
    }
    char v40 = v39;
    *(_BYTE *)uint64_t v15 = v40;
  }

  *(void *)&time[0] = 0LL;
  uint64_t v41 = _getMetadataDictionary(a2);
  if (!v41)
  {
    uint64_t v305 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v329) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v305,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "sbufMetadata",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  9079LL,  v329);
LABEL_410:
    uint64_t v304 = 4294954514LL;
    goto LABEL_408;
  }

  FigCFDictionaryGetInt64IfPresent(v41, kFigCaptureVideoStabilizationMetadata_CinematicFutureMetadataSerialNumber, time);
  CMSampleBufferGetPresentationTimeStamp(&v358, a2);
  *(Float64 *)(DerivedStorage + 29712) = CMTimeGetSeconds(&v358);
  *(void *)(DerivedStorage + 29720) = *(void *)&time[0];
  target = a2;
  if (!*(_BYTE *)(DerivedStorage + 29730)) {
    goto LABEL_56;
  }
  uint64_t FrameRateConversionStatus = _getFrameRateConversionStatus();
  if (!(_DWORD)FrameRateConversionStatus) {
    goto LABEL_56;
  }
  uint64_t v43 = FrameRateConversionStatus;
  if (!*(_BYTE *)(DerivedStorage + 32))
  {
    int v72 = *(_DWORD *)(DerivedStorage + 29736);
    if ((_DWORD)FrameRateConversionStatus != *(_DWORD *)(DerivedStorage + 29752))
    {
      if (!v72) {
        *(_DWORD *)(DerivedStorage + 29732) = *(_DWORD *)(DerivedStorage + 29340);
      }
      *(_DWORD *)(DerivedStorage + 29736) = ++v72;
    }

    if (v72 == 2)
    {
      v349 = v14;
      uint64_t v114 = DerivedStorage;
      int v115 = *(_DWORD *)(DerivedStorage + 29732);
      if (v115 == v9[273])
      {
        char v44 = 0;
        uint64_t DerivedStorage = v114;
      }

      else
      {
        uint64_t v129 = kFigVideoStabilizationSampleBufferProcessorMetadata_FrameRateConversionStatus;
        uint64_t v130 = (const __CFString *)kFigCaptureSampleBufferAttachmentKey_MetadataDictionary;
        do
        {
          v131 = *(const void **)(*(void *)(v114 + 29320) + 8LL * v115);
          if (v131)
          {
            CFTypeRef v132 = CMGetAttachment(v131, v130, 0LL);
            if (v132)
            {
              FigCFDictionarySetInt32(v132, v129, v43);
            }

            else
            {
              fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
              LODWORD(v329) = 0;
              FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
            }
          }

          int v133 = v9[275];
          v115 += v133 + 1;
          do
            v115 -= v133;
          while (v115 >= v133);
        }

        while (v9[273] != v115);
        char v44 = 0;
        uint64_t DerivedStorage = v114;
      }

      CFTypeID v14 = v349;
      goto LABEL_52;
    }

    if (v72 == 1) {
      ++*(_DWORD *)(DerivedStorage + 29740);
    }
  }

  char v44 = 1;
LABEL_52:
  if (*(_DWORD *)(v8 + 236) == v9[272] || *(_DWORD *)(v8 + 244) == *(_DWORD *)(v8 + 248))
  {
    *(_DWORD *)(v8 + 256) = v43;
LABEL_55:
    *(_DWORD *)(v8 + 244) = 0;
    *(void *)(v8 + 236) = 0xFFFFFFFFLL;
    goto LABEL_56;
  }

  *(_DWORD *)(v8 + 256) = v43;
  if ((v44 & 1) == 0) {
    goto LABEL_55;
  }
LABEL_56:
  int v45 = *(_DWORD *)(v15 + 42);
  if ((v45 - 1) < 3)
  {
    uint64_t v46 = CMBaseObjectGetDerivedStorage(v4);
    uint64_t v47 = v46;
    uint64_t v48 = v46 + 27116;
    CFTypeRef v370 = 0LL;
    int v49 = *(_DWORD *)(v46 + 29348);
    if (!*(_BYTE *)(v46 + 32)) {
      goto LABEL_175;
    }
    int v50 = *(_DWORD *)v48;
    if (*(_DWORD *)v48 == 3)
    {
      int v51 = 1071644672;
LABEL_107:
      *(_DWORD *)(v46 + 29480) = v51;
      float v84 = 1.0;
LABEL_169:
      float v134 = *(float *)(v48 + 2364);
      float v135 = *(float *)(v48 + 2296);
      float v136 = 16.0;
      if (v135 < 1.0)
      {
        float v136 = 20.0;
        if (v135 > 0.5) {
          float v136 = (float)((float)(v135 + -0.5) * -8.0) + 20.0;
        }
      }

      float v137 = fmaxf(v134, v135 * v136);
      if (v84 > 30.0) {
        float v137 = fmaxf(v134, v137 + (float)((float)((float)(v137 - v134) / -190.0) * (float)(v84 + -30.0)));
      }
      *(float *)(v48 + 2360) = v137;
      *(float *)(v48 + 2292) = v137;
LABEL_175:
      if (*(_DWORD *)v48 != 1) {
        goto LABEL_181;
      }
      if (target)
      {
        CFTypeRef v138 = CMGetAttachment( target,  kFigVideoStabilizationSampleBufferAttachmentKey_OutputBiasRotationQuaternion,  0LL);
        v139 = (void *)objc_claimAutoreleasedReturnValue(v138);
        if (v139)
        {
          id v140 = v139;
          if ([v139 length] == &dword_10)
          {
            id v141 = v140;
            v142 = (float *)[v141 bytes];
            *(double *)(v47 + 28224) = *v142;
            *(double *)(v47 + 28232) = v142[1];
            *(double *)(v47 + 28240) = v142[2];
            *(double *)(v47 + 28216) = v142[3];

            char v143 = 1;
LABEL_180:
            *(_BYTE *)(v48 + 1092) = v143;
LABEL_181:
            if (v14)
            {
              uint64_t v144 = sbp_gvs_cinematicAddMetadataToQuaternionAndSphereRingBuffers(v47, v14);
              if ((_DWORD)v144)
              {
                uint64_t StabilizedSampleBuffer = v144;
                uint64_t v312 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                LODWORD(v329) = StabilizedSampleBuffer;
                FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v312,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  7694LL,  v329);
                goto LABEL_109;
              }

              if (!*(_DWORD *)(v48 + 2448))
              {
LABEL_236:
                uint64_t v171 = v47 + 29320;
                id v172 = kFigCaptureStreamMetadataOutputKey_PreLTMThumbnail;
                uint64_t v173 = v172;
                if (target)
                {
                  if (v172)
                  {
                    v350 = v14;
                    uint64_t v342 = v4;
                    v174 = (const __CFString *)kFigSampleBufferAttachmentKey_AttachedMedia;
                    CFTypeRef v175 = CMGetAttachment(target, kFigSampleBufferAttachmentKey_AttachedMedia, 0LL);
                    uint64_t v176 = (void *)objc_claimAutoreleasedReturnValue(v175);
                    int v177 = (NSMutableDictionary *)[v176 mutableCopy];
                    if (!v177) {
                      int v177 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  1LL);
                    }
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v177, "setObject:forKeyedSubscript:", 0LL, v173);
                    if (-[NSMutableDictionary count](v177, "count"))
                    {
                      uint64_t v178 = v48;
                      id v179 = -[NSMutableDictionary copy](v177, "copy");
                      id v180 = target;
                      CMSetAttachment(target, v174, v179, 1u);

                      uint64_t v48 = v178;
                      uint64_t v171 = v47 + 29320;
                    }

                    else
                    {
                      id v180 = target;
                      CMRemoveAttachment(target, v174);
                    }

                    uint64_t v4 = v342;
                    CFTypeID v14 = v350;
                    goto LABEL_244;
                  }

                  uint64_t v310 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                  LODWORD(v329) = 0;
                  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v310,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "attachedMediaKey",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  1648LL,  v329);
                }

                else
                {
                  uint64_t v309 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                  LODWORD(v329) = 0;
                  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v309,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "sampleBuffer",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  1647LL,  v329);
                }

                id v180 = target;
LABEL_244:

                CFTypeRef v181 = CFRetain(v180);
                uint64_t v182 = *(int *)(v48 + 2224);
                *(void *)(*(void *)(v47 + 29320) + 8 * v182) = v181;
                do
                {
                  int v183 = v182 - v49;
                  int v184 = v182 + 1;
                  LODWORD(v182) = v182 - v49;
                }

                while (v184 >= v49);
                *(_DWORD *)(v48 + 2224) = v49 + v183 + 1;
                int v185 = *(_DWORD *)(v48 + 2228);
                if (v185 < v49) {
                  *(_DWORD *)(v48 + 2228) = ++v185;
                }
                if (*(_BYTE *)(v47 + 30000))
                {
                  int v186 = (v49 + v183 + *(_DWORD *)(v48 + 2232)) % v49;
                  if (*(_BYTE *)(v47 + 32))
                  {
                    *(void *)v361 = 0LL;
                    FigCFDictionaryGetDoubleIfPresent(v14, kFigCaptureStreamMetadata_LuxLevel, v361);
                    if (*(double *)v361 > *(float *)(v47 + 30004) && (uint64_t v187 = *(void **)(v47 + 30016)) != 0LL
                      || (uint64_t v187 = *(void **)(v47 + 30024)) != 0LL)
                    {
                      id v188 = v187;
                      v189 = *(void **)(v47 + 30008);
                      *(void *)(v47 + 30008) = v188;
                    }

                    int v185 = *(_DWORD *)(v48 + 2228);
                  }

                  *(_BYTE *)(*(void *)(v47 + 29328) + 24LL * v186 + 16) = 0;
                  if (v185 >= 3)
                  {
                    _runVideoDeghostingDetection(*(void **)(v47 + 30008), v171);
                    int v185 = *(_DWORD *)(v48 + 2228);
                  }
                }

                if (v185 < v49)
                {
                  int v190 = *(void **)(v47 + 88);
                  if (v190)
                  {
                    v191 = (const char *)CMSampleBufferGetImageBuffer(target);
                    AffineTransformCacheSourcePixelBuffer(v190, v191);
                  }

                  goto LABEL_260;
                }

                uint64_t StabilizedSampleBuffer = sbp_gvs_gaussianAverageGetStabilizedSampleBuffer(v47, &v370);
                if (!(_DWORD)StabilizedSampleBuffer)
                {
                  CFTypeRef v57 = v370;
                  goto LABEL_263;
                }

                fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                LODWORD(v329) = StabilizedSampleBuffer;
                FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
                if (v370) {
                  CFRelease(v370);
                }
LABEL_109:
                CFTypeRef v57 = 0LL;
                goto LABEL_263;
              }

              if (*(_BYTE *)(v48 + 2477) && !*(_BYTE *)(v48 + 2510))
              {
                CFTypeRef v145 = CMGetAttachment(target, kFigVideoStabilizationSampleBufferProcessorOption_SystemPressure, 0LL);
                int v146 = (void *)objc_claimAutoreleasedReturnValue(v145);
                signed int v147 = [v146 intValue];
                *(_DWORD *)(v48 + 2480) = v147;
                *(_BYTE *)(v48 + 2510) |= v147 > 2;
              }

              if (*(_BYTE *)(v48 + 2511)) {
                goto LABEL_223;
              }
              if (CFDictionaryContainsKey(v14, kFigCaptureStreamMetadata_LTMLookUpTables))
              {
                unsigned int v148 = [*(id *)(v47 + 29600) prepareToProcessWithMetadata:v14];
                if (v148)
                {
                  unsigned int v323 = v148;
                  fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                  LODWORD(v329) = v323;
                  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
                }

                *(_BYTE *)(v48 + 2511) = 1;
                goto LABEL_223;
              }

              int v167 = *(_DWORD *)(v48 + 2516);
              *(_DWORD *)(v48 + 2516) = v167 + 1;
              if (v167 < 3)
              {
LABEL_223:
                if (!*(void *)(v47 + 29608) && !*(_DWORD *)(v48 + 2516) && *(_BYTE *)(v48 + 2511))
                {
                  uint64_t v168 = objc_claimAutoreleasedReturnValue( [*(id *)(v47 + 29600) allocateLTCsCorrectionTex:*(unsigned __int8 *)(v48 + 2476) forISPProcessing:*(_DWORD *)(v47 + 172) == 3]);
                  v169 = *(void **)(v47 + 29608);
                  *(void *)(v47 + 29608) = v168;

                  if (!*(void *)(v47 + 29608))
                  {
                    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                    LODWORD(v329) = 0;
                    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
                    FigSignalErrorAt(4294954510LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
                  }

                  int v170 = sbp_ltm_checkPerVideoDisablement(v47, v14);
                  if (v170)
                  {
                    int v328 = v170;
                    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                    LODWORD(v329) = v328;
                    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
                  }
                }

                if (*(_BYTE *)(v48 + 2510) || !*(_BYTE *)(v48 + 2511))
                {
                  if (*(_BYTE *)(v48 + 2509)) {
                    *(_DWORD *)(v48 + 2520) = 1;
                  }
                  *(_BYTE *)(v48 + 2512) = 0;
                }

                else
                {
                  if (!*(void *)(v47 + 29600))
                  {
                    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                    LODWORD(v329) = 0;
                    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
                    sbp_ltm_deallocateLtcCorrectionTexture(v47);
                  }

                  if (gGMFigKTraceEnabled == 1)
                  {
                    _getPresentationTimeStampForSampleBuffer(target, (uint64_t)cf);
                    *(_OWORD *)v361 = *(_OWORD *)cf;
                    *(void *)&v361[16] = v372;
                    Float64 v192 = CMTimeGetSeconds((CMTime *)v361);
                    kdebug_trace(822152385LL, 20LL, *(void *)&v192, 0LL, 0LL);
                  }

                  signed int v193 = [*(id *)(v47 + 29600) bufferFrame:target];
                  uint64_t v194 = v193;
                  if (v193)
                  {
                    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                    LODWORD(v329) = v194;
                    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
                    sbp_ltm_deallocateLtcCorrectionTexture(v47);
                  }

                  if (gGMFigKTraceEnabled == 1) {
                    kdebug_trace(822152386LL, 20LL, v194, 0LL, 0LL);
                  }
                }

                goto LABEL_236;
              }
            }

            else if (!*(_DWORD *)(v48 + 2448))
            {
              goto LABEL_236;
            }

            sbp_ltm_deallocateLtcCorrectionTexture(v47);
LABEL_260:
            CFTypeRef v57 = 0LL;
            uint64_t StabilizedSampleBuffer = 0LL;
            goto LABEL_263;
          }

          fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          LODWORD(v329) = 0;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
        }
      }

      else
      {
        fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v329) = 0;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
      }

      char v143 = 0;
      goto LABEL_180;
    }

    if (v50 != 2)
    {
      if (v50 != 1)
      {
        uint64_t v86 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        uint64_t StabilizedSampleBuffer = 4294954515LL;
        LODWORD(v329) = -12781;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v86,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  7665LL,  v329);
        goto LABEL_109;
      }

      int v51 = 1050253722;
      goto LABEL_107;
    }

    *(_DWORD *)(v46 + 29480) = 1050253722;
    int v73 = *(const __CFArray **)(v46 + 29424);
    v347 = v14;
    uint64_t v74 = v46 + 27116;
    if (v73)
    {
      int Count = CFArrayGetCount(v73);
      if (Count > 0)
      {
        uint64_t v76 = DerivedStorage;
        uint64_t v77 = v4;
        if (*(_DWORD *)(v74 + 2300) < Count)
        {
          uint64_t v322 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          LODWORD(v329) = 0;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v322,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "metadataCount <= storage->cinematicLookAheadFrameCount",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2070LL,  v329);
LABEL_401:
          uint64_t StabilizedSampleBuffer = FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
        }

        else
        {
          CFIndex v78 = 0LL;
          uint64_t v79 = Count;
          while (1)
          {
            int v80 = (const __CFDictionary *)CFArrayGetValueAtIndex(v73, v78);
            if (!v80)
            {
              uint64_t v303 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
              LODWORD(v329) = 0;
              FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v303,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "curFutureFrameDict",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2075LL,  v329);
              goto LABEL_401;
            }

            uint64_t v81 = sbp_gvs_cinematicAddMetadataToQuaternionAndSphereRingBuffers(v47, v80);
            if ((_DWORD)v81) {
              break;
            }
            if (v79 == ++v78)
            {
              uint64_t StabilizedSampleBuffer = 0LL;
              goto LABEL_98;
            }
          }

          uint64_t StabilizedSampleBuffer = v81;
          fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          LODWORD(v329) = StabilizedSampleBuffer;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
        }

LABEL_98:
        uint64_t v4 = v77;
        uint64_t DerivedStorage = v76;
        goto LABEL_99;
      }

      uint64_t v321 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v329) = 0;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v321,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "metadataCount > 0",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2069LL,  v329);
    }

    else
    {
      uint64_t v319 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v329) = 0;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v319,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "metadataArray",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2062LL,  v329);
    }

    uint64_t StabilizedSampleBuffer = FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
LABEL_99:
    v82 = *(const void **)(v47 + 29424);
    uint64_t v48 = v74;
    if (v82)
    {
      CFRelease(v82);
      *(void *)(v47 + 29424) = 0LL;
    }

    if ((_DWORD)StabilizedSampleBuffer)
    {
      uint64_t v320 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v329) = StabilizedSampleBuffer;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v320,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  7624LL,  v329);
      goto LABEL_109;
    }

    int v83 = *(void **)(v47 + 29352);
    if (v83)
    {
      [v83 getSmoothingAnalysisArrays];
      float v84 = 1.0;
      CFTypeID v14 = v347;
      if (SHIDWORD(v376) < (int)v377)
      {
        double v85 = *(double *)(v374 + 8LL * (int)v377) - *(double *)(v374 + 8LL * SHIDWORD(v376));
        if (v85 <= 0.0)
        {
          fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          LODWORD(v329) = 0;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
        }

        else
        {
          float v84 = (*(double *)(*((void *)&time[1] + 1) + 144LL * (int)v377 + 72)
        }
      }
    }

    else
    {
      __int128 v376 = 0u;
      __int128 v377 = 0u;
      __int128 v374 = 0u;
      __int128 v375 = 0u;
      memset(time, 0, sizeof(time));
      float v84 = 1.0;
      CFTypeID v14 = v347;
    }

    int v126 = v84 > 2.0;
    *(_BYTE *)(v74 + 2356) = v126;
    if (*(void *)(v47 + 88))
    {
      uint64_t v127 = *(void **)(v47 + 96);
      if (v84 <= 2.0)
      {
        [v127 setQueuePriority:*(unsigned int *)(v47 + 104)];
        uint64_t v128 = *(unsigned int *)(v47 + 104);
      }

      else
      {
        [v127 setQueuePriority:0];
        uint64_t v128 = 0LL;
      }

      AffineTransformContextSetPriority(*(void **)(v47 + 88), v128);
      int v126 = *(unsigned __int8 *)(v74 + 2356);
    }

    if (!v126 && !*(void *)(v47 + 384))
    {
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v329) = 0;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
    }

    goto LABEL_169;
  }

  if (v45 != 4)
  {
    if (v45 == 5)
    {
      cf[0] = 0LL;
      if (a2)
      {
        if (v4)
        {
          uint64_t v52 = CMBaseObjectGetDerivedStorage(v4);
          __int128 v379 = 0u;
          __int128 v380 = 0u;
          memset(time, 0, sizeof(time));
          __int128 v374 = 0u;
          __int128 v375 = 0u;
          __int128 v376 = 0u;
          __int128 v377 = 0u;
          __int128 v378 = 0u;
          *(void *)&__int128 v378 = *(void *)(v52 + 128);
          if (*(_BYTE *)(v52 + 224))
          {
            CFTypeRef v53 = CMGetAttachment(a2, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0LL);
            CGSize size = CGRectZero.size;
            *(CGPoint *)v361 = CGRectZero.origin;
            *(CGSize *)&v361[16] = size;
            FigCFDictionaryGetCGRectIfPresent(v53, kFigCaptureStreamMetadata_ValidBufferRect, v361);
            if (v55)
            {
              DWORD2(v377) = llround(*(double *)v361);
              HIDWORD(v377) = llround(*(double *)&v361[8]);
              LODWORD(v378) = llround(*(double *)&v361[16]);
              DWORD1(v378) = llround(*(double *)&v361[24]);
            }
          }

          uint64_t StabilizedSampleBuffer = sbp_gvs_createStabilizedSampleBuffer(v52, a2, (uint64_t)time, (const char *)cf);
          if (!(_DWORD)StabilizedSampleBuffer)
          {
            CFTypeRef v57 = cf[0];
            goto LABEL_392;
          }

          fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          LODWORD(v329) = StabilizedSampleBuffer;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
          goto LABEL_435;
        }

        uint64_t v316 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v329) = 0;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v316,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "sampleBufferProcessor",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  7250LL,  v329);
      }

      else
      {
        uint64_t v315 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v329) = 0;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v315,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "sampleBuffer",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  7248LL,  v329);
      }

      uint64_t StabilizedSampleBuffer = FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
LABEL_435:
      CFTypeRef v57 = 0LL;
      if (!(_DWORD)StabilizedSampleBuffer) {
        goto LABEL_392;
      }
      goto LABEL_436;
    }

    uint64_t v65 = CMBaseObjectGetDerivedStorage(v4);
    uint64_t v66 = v65;
    uint64_t v337 = v65 + 28248;
    float v67 = (_BYTE *)(v65 + 27104);
    float v68 = (unsigned __int8 *)(v65 + 10650);
    CFTypeRef v369 = 0LL;
    v344 = (int32x2_t *)(v65 + 128);
    uint64_t v69 = *(int *)(v65 + 176);
    memset(v361, 0, sizeof(v361));
    __int128 v362 = 0u;
    __int128 v363 = 0u;
    __int128 v364 = 0u;
    __int128 v365 = 0u;
    __int128 v366 = 0u;
    __int128 v367 = 0u;
    __int128 v368 = 0u;
    if (*(_BYTE *)(v65 + 28105)) {
      uint64_t v70 = v65 + 10656;
    }
    else {
      uint64_t v70 = 0LL;
    }
    v351 = (float64x2_t *)(v65 + 304);
    if (*(_BYTE *)(v65 + 28105)) {
      float v71 = *(float32x2_t **)(v65 + 28112);
    }
    else {
      float v71 = 0LL;
    }
    if (*(_DWORD *)v337) {
      uint64_t v93 = v65 + 28248;
    }
    else {
      uint64_t v93 = 0LL;
    }
    uint64_t v94 = GVSExtractMetadataFromTopToBottomRows( v14,  v65 + 392,  *(void **)(v65 + 27096),  v70,  (uint64_t)v351,  v344,  (uint64_t)v361,  time,  0LL,  0LL,  v71,  v93,  v69);
    if ((_DWORD)v94)
    {
      uint64_t StabilizedSampleBuffer = v94;
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v329) = StabilizedSampleBuffer;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
      CFTypeRef v57 = 0LL;
      goto LABEL_391;
    }

    int v95 = *v68;
    if (*v68)
    {
      *(_BYTE *)(v66 + 202) = *(_BYTE *)(v66 + 84) != 0;
      __int128 v334 = (const char *)(v66 + 202);
      __int128 v96 = (_BYTE *)(v66 + 32);
      if (!*(_BYTE *)(v66 + 32) && v68[1]) {
        goto LABEL_137;
      }
    }

    else
    {
      __int128 v96 = (_BYTE *)(v66 + 32);
      int v104 = *(unsigned __int8 *)(v66 + 32);
      *(_BYTE *)(v66 + 202) = 1;
      __int128 v334 = (const char *)(v66 + 202);
      if (!v104) {
        goto LABEL_137;
      }
    }

    int v105 = &time[2 * v69];
    __int128 v106 = *v105;
    *(_OWORD *)(v66 + 28080) = v105[1];
    *(_OWORD *)(v66 + 28064) = v106;
    if ((int)v69 >= 1)
    {
      uint64_t v107 = v69;
      BOOL v108 = (_OWORD *)(v66 + 27616);
      char v109 = time;
      do
      {
        __int128 v110 = v109[1];
        *(v108 - 14) = *v109;
        *(v108 - 13) = v110;
        __int128 v111 = *v109;
        __int128 v112 = v109[1];
        v109 += 2;
        *BOOL v108 = v111;
        v108[1] = v112;
        v108 += 2;
        --v107;
      }

      while (v107);
    }

LABEL_137:
    v348 = v67;
    uint64_t v338 = DerivedStorage;
    uint64_t v341 = v4;
    __int128 v335 = v68;
    if (v67[1001])
    {
      sbp_gvs_computeBaseSphereLensMovements( *(unsigned int *)(v66 + 176),  *(_DWORD *)(v66 + 180),  *(void **)(v66 + 28112),  (void *)(v66 + 28120));
      int v95 = *v68;
    }

    if (!v95) {
      goto LABEL_387;
    }
    uint64_t v357 = v66;
    if (*v96)
    {
      float v113 = *(float *)(v337 + 860);
      goto LABEL_376;
    }

    uint64_t v116 = v69;
    uint64_t v117 = v66 + 29112;
    double v118 = *((double *)&v364 + 1) - *(double *)(v66 + 29312);
    if (v118 <= 0.0) {
      double v119 = 1.0;
    }
    else {
      double v119 = 0.0333333333 / v118;
    }
    *(double *)(v66 + 29304) = v119;
    uint64_t v120 = *(unsigned int *)(v66 + 176);
    double v121 = v119 * 0.0192 + 0.7808;
    float v122 = v121;
    if (v361[12])
    {
      v123 = v348;
      float v124 = v119 * 0.005 + 0.945;
      if (v348[1000])
      {
        float v124 = v124 + 0.02;
        float v122 = v122 + 0.1;
        int v125 = 1;
      }

      else
      {
        int v125 = 0;
      }
    }

    else
    {
      int v125 = 0;
      float v124 = v119 * 0.005 + 0.945;
      v123 = v348;
    }

    float v195 = fminf(v122, 0.999);
    float v345 = fminf(v124, 0.999);
    double v196 = (float)(v345 - v195);
    float v197 = v195;
    if (*(_DWORD *)(v66 + 29208)) {
      float v197 = *(float *)(v337 + 860);
    }
    float v354 = v197;
    double v198 = fmin(v121, 0.999);
    double v199 = v196 / (v119 * 30.0);
    double v200 = v196 / (v119 * 10.0);
    if ((int)v120 < 1)
    {
      double v202 = 0.0;
      double v206 = 2.0;
      double v203 = 2.0;
    }

    else
    {
      v201 = (uint64_t *)(v66 + 27616);
      double v202 = 0.0;
      double v203 = 2.0;
      v204 = (double *)time;
      uint64_t v205 = v120;
      double v206 = 2.0;
      do
      {
        cf[0] = COERCE_CFTYPEREF(FigMotionMultiplyByInverseOfQuaternion(v204, v201 - 28));
        cf[1] = v207;
        *(void *)&__int128 v372 = v208;
        *((void *)&v372 + 1) = v209;
        double v210 = fabs(*(double *)cf);
        if (v210 < v203) {
          double v203 = v210;
        }
        cf[0] = COERCE_CFTYPEREF(FigMotionMultiplyByInverseOfQuaternion(v204, v201));
        cf[1] = v211;
        *(void *)&__int128 v372 = v212;
        *((void *)&v372 + 1) = v213;
        double v214 = fabs(*(double *)cf);
        if (v214 < v206) {
          double v206 = v214;
        }
        CFTypeRef v370 = 0LL;
        GVSComputeTranslationFromCameraMotion((double *)cf, (float32x2_t *)&v370, *(float *)&v361[4]);
        HIDWORD(v121) = HIDWORD(v370);
        double v202 = COERCE_DOUBLE(vadd_f32(*(float32x2_t *)&v202, (float32x2_t)v370));
        v201 += 4;
        v204 += 4;
        --v205;
      }

      while (v205);
    }

    float v215 = v198;
    *(float *)&double v121 = v199;
    float v343 = *(float *)&v121;
    float v216 = v200;
    *(float *)&double v121 = (float)(int)v120;
    uint64_t v217 = (_BYTE *)(v117 + 32);
    double v218 = COERCE_DOUBLE(vdiv_f32(*(float32x2_t *)&v202, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v121, 0)));
    if ((_DWORD)v120) {
      double v219 = v218;
    }
    else {
      double v219 = v202;
    }
    double v220 = acos(v206);
    uint64_t v66 = v357;
    double v221 = *(double *)(v357 + 29304);
    double v222 = acos(v203);
    double v223 = sqrt(v221);
    uint64_t v224 = *(int *)(v117 + 180);
    *(double *)(v357 + 29212 + 8 * v224) = v219;
    int v225 = *(_DWORD *)(v117 + 184);
    if (v225 <= 9) {
      *(_DWORD *)(v117 + 184) = ++v225;
    }
    double v226 = v220 * v221;
    double v227 = v222 * v223;
    LOWORD(cf[0]) = 0;
    if (v225 == 10)
    {
      uint64_t v228 = 0LL;
      float v229 = 0.0;
      char v230 = 1;
      do
      {
        int v231 = 0;
        char v232 = v230;
        int v233 = 10;
        float v234 = 0.0;
        int v235 = v224;
        do
        {
          float v236 = *(float *)(v357 + 29212 + 8LL * v235 + 4 * v228);
          float v234 = v234 + v236;
          if (v236 >= 0.0) {
            ++v231;
          }
          else {
            --v231;
          }
          int v235 = (v235 + 9) % 10;
          --v233;
        }

        while (v233);
        if (v231 < 0) {
          int v231 = -v231;
        }
        if (v231 == 10)
        {
          float v237 = fabsf(v234) / 10.0;
          if (v237 >= 0.75)
          {
            *((_BYTE *)cf + v228) = 1;
            float v229 = fmaxf(v229, v237);
          }
        }

        char v230 = 0;
        uint64_t v228 = 1LL;
      }

      while ((v232 & 1) != 0);
      int v238 = LOBYTE(cf[0]);
      int v239 = BYTE1(cf[0]);
    }

    else
    {
      int v239 = 0;
      int v238 = 0;
      float v229 = 0.0;
    }

    *(_BYTE *)(v117 + 2) = (v238 | v239) != 0;
    BOOL v240 = v226 <= 0.00447213968;
    *(_BYTE *)(v117 + 1) = v226 <= 0.00447213968;
    *(_BYTE *)uint64_t v117 = v227 <= 0.0109545059;
    uint64_t v241 = *(int *)(v117 + 92);
    if (v227 > 0.0109545059) {
      BOOL v240 = 0;
    }
    v217[v241] = v240;
    int v242 = *(_DWORD *)(v117 + 96);
    if (v242 > 59)
    {
      unsigned int v243 = *(_DWORD *)(v117 + 96);
      float v244 = v345;
    }

    else
    {
      unsigned int v243 = v242 + 1;
      *(_DWORD *)(v117 + 96) = v242 + 1;
      float v244 = v345;
      if (v242 < 0) {
        goto LABEL_311;
      }
    }

    if (!*v217)
    {
      *(_BYTE *)(v117 + 3) = 0;
LABEL_321:
      if (v125)
      {
        if (*(_BYTE *)(v117 + 2) && *(_BYTE *)(v357 + 201))
        {
          float v249 = v354 - v216;
        }

        else
        {
          float v249 = fminf(v195, v354 + v343);
          float v250 = fmaxf(v195, v354 - v216);
          if (v354 > v195) {
            float v249 = v250;
          }
        }

        goto LABEL_330;
      }

      float v248 = v354 - v216;
      goto LABEL_326;
    }

    unint64_t v245 = 0LL;
    while (v243 - 1LL != v245)
    {
      if (!*(unsigned __int8 *)(v357 + 29145 + v245++))
      {
        *(_BYTE *)(v117 + 3) = v245 >= v243;
        if (v245 < v243) {
          goto LABEL_321;
        }
        goto LABEL_318;
      }
    }

LABEL_311:
    *(_BYTE *)(v117 + 3) = 1;
LABEL_318:
    if (!*(_BYTE *)(v117 + 2))
    {
      float v249 = v354 + v343;
      goto LABEL_330;
    }

    float v247 = fminf(v229 / *(float *)(v117 + 16), 1.0);
    float v248 = v354 - (float)((float)(v247 * (float)(v247 * v247)) * v216);
LABEL_326:
    float v249 = fmaxf(v195, v248);
LABEL_330:
    float v251 = fminf(v244, fmaxf(v215, v249));
    *(_DWORD *)(v117 + 180) = ((int)v224 + 1) % 10;
    *(_DWORD *)(v117 + 92) = ((int)v241 + 1) % 60;
    if (v226 >= *(double *)(v357 + 29136))
    {
      float v256 = 0.08 / v119 + v354;
      *(float *)&double v222 = fminf(v251, v256);
      *(_DWORD *)(v117 + 4) = 0;
      float v257 = 0.005 / v119;
      *(float *)(v117 + 8) = v257;
    }

    else
    {
      int v252 = *(_DWORD *)(v117 + 4);
      int v253 = llround(v119);
      if (v253 <= 1) {
        int v253 = 1;
      }
      if (v252 < v253 || v226 >= 0.00019999999)
      {
        *(float *)&double v222 = fminf(v251, v354);
      }

      else
      {
        float v254 = *(float *)(v117 + 12);
        float v255 = fminf(*(float *)(v117 + 8) * 1.3, 1.0);
        *(float *)(v117 + 8) = v255;
        double v222 = v354 - v255 / v119;
        *(float *)&double v222 = v222;
        *(float *)&double v222 = fmaxf(v254, *(float *)&v222);
      }

      *(_DWORD *)(v117 + 4) = v252 + 1;
    }

    if (*v123)
    {
      sbp_gvs_UpdateSmoothParameter( (uint64_t *)&time[2 * (int)v120],  (double *)(v357 + 28064),  v222,  *(double *)(v357 + 27384));
      float v113 = v258;
      uint64_t v69 = v116;
    }

    else
    {
      uint64_t v69 = v116;
      if ((int)v120 < 1)
      {
        float v113 = 1.0;
      }

      else
      {
        uint64_t v259 = (double *)(v357 + 27392);
        float v113 = 1.0;
        uint64_t v260 = (uint64_t *)time;
        do
        {
          sbp_gvs_UpdateSmoothParameter(v260, v259, v222, *(double *)(v357 + 27384));
          v259 += 4;
          v260 += 4;
          --v120;
        }

        while (v120);
      }

      char v261 = v125 ^ 1;
      if (!*(_BYTE *)(v357 + 200)) {
        char v261 = 1;
      }
      if ((v261 & 1) == 0 && v113 > 0.7808)
      {
        LOBYTE(v370) = 1;
        uint64_t v262 = *(unsigned int *)(v357 + 176);
        *(_BYTE *)(v357 + 201) = 0;
        if ((int)v262 < 1)
        {
          float v269 = v113;
LABEL_373:
          float v113 = v269;
        }

        else
        {
          uint64_t v263 = v262;
          uint64_t v264 = 0LL;
          uint64_t v265 = v357 + 27392;
          float v266 = v113;
          while (1)
          {
            uint64_t v267 = v348[1001] ? (float32x2_t *)(v357 + 28120 + 8 * v264) : 0LL;
            int v268 = sbp_gvs_iir_ComputeCorrection( v357,  (uint64_t *)&time[2 * v264],  (double *)(v265 + 32 * v264),  (uint64_t)v361,  v267,  (BOOL *)&v370,  v266);
            if (v268) {
              break;
            }
            if ((_BYTE)v370)
            {
              float v269 = v266;
            }

            else
            {
              *(_BYTE *)(v357 + 201) = 1;
              if (v266 < 0.7808)
              {
                fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                LODWORD(v329) = 0;
                FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
                int v271 = FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
                float v269 = 0.7808;
                if (v271)
                {
                  int v272 = v271;
LABEL_412:
                  uint64_t v306 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                  LODWORD(v329) = v272;
                  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v306,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  7210LL,  v329);
                  goto LABEL_374;
                }
              }

              else
              {
                float v269 = 0.7808;
                if ((float)(v266 + -0.7808) > 0.01)
                {
                  float v269 = 0.7808;
                  while (1)
                  {
                    int v270 = sbp_gvs_iir_ComputeCorrection( v357,  (uint64_t *)&time[2 * v264],  (double *)(v265 + 32 * v264),  (uint64_t)v361,  v267,  (BOOL *)cf,  (float)(v269 + v266) * 0.5);
                    if (v270) {
                      break;
                    }
                    if (LOBYTE(cf[0])) {
                      float v269 = (float)(v269 + v266) * 0.5;
                    }
                    else {
                      float v266 = (float)(v269 + v266) * 0.5;
                    }
                  }

                  int v272 = v270;
                  fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                  LODWORD(v329) = v272;
                  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
                  goto LABEL_412;
                }
              }
            }

LABEL_368:
            ++v264;
            float v266 = v269;
            if (v264 == v263) {
              goto LABEL_373;
            }
          }

          int v317 = v268;
          uint64_t v318 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          LODWORD(v329) = v317;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v318,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  7196LL,  v329);
        }

LABEL_374:
        uint64_t v66 = v357;
      }
    }

    *(float *)(v337 + 860) = v113;
LABEL_376:
    uint64_t v346 = v66 + 28064;
    FigMotionInterpolateQuaternionsByAngle((uint64_t)&time[2 * v69], (double *)(v66 + 28064), v113);
    *(void *)(v66 + 28064) = v273;
    *(void *)(v66 + 28072) = v274;
    *(void *)(v66 + 28080) = v275;
    *(void *)(v66 + 28088) = v276;
    *(_DWORD *)(v66 + 196) = 1065353216;
    if ((int)v69 >= 1)
    {
      uint64_t v277 = v69;
      uint64_t v278 = (uint64_t *)time;
      uint64_t v279 = 27840LL;
      uint64_t v280 = 28120LL;
      uint64_t v281 = 27120LL;
      uint64_t v282 = 27616LL;
      uint64_t v283 = 27392LL;
      while (1)
      {
        uint64_t v355 = v277;
        uint64_t v284 = v346;
        if (!*v348)
        {
          uint64_t v284 = v66 + v283;
          FigMotionInterpolateQuaternionsByAngle((uint64_t)v278, (double *)(v66 + v283), *(float *)(v337 + 860));
          *(void *)uint64_t v284 = v285;
          *(void *)(v284 + 8) = v286;
          *(void *)(v284 + 16) = v287;
          *(void *)(v284 + 24) = v288;
          FigMotionInterpolateQuaternionsByAngle((uint64_t)v278, (double *)(v66 + v282), 0.05);
          *(void *)(v284 + 224) = v289;
          *(void *)(v284 + 232) = v290;
          *(void *)(v284 + 240) = v291;
          *(void *)(v284 + 248) = v292;
        }

        uint64_t v293 = (double *)(v66 + v279);
        uint64_t v294 = v357 + v283;
        *(double *)(v294 + 448) = FigMotionMultiplyByInverseOfQuaternion((double *)v284, v278);
        *(void *)(v294 + 456) = v295;
        *(void *)(v294 + 464) = v296;
        *(void *)(v294 + 472) = v297;
        uint64_t v66 = v357;
        v298 = v348[1001] ? (float32x2_t *)(v357 + v280) : 0LL;
        uint64_t v299 = GVSComputeTransformFromCameraMotion(v293, v351, (uint64_t)v361, v298, 0LL, (float *)(v357 + v281));
        if ((_DWORD)v299) {
          break;
        }
        if (*(_BYTE *)(v357 + 200)) {
          limitTransformToOverscan((uint64_t)v344, (double *)&v366 + 1, v357 + v281, *(float *)&v361[20]);
        }
        v278 += 4;
        v279 += 32LL;
        v280 += 8LL;
        v281 += 36LL;
        v282 += 32LL;
        v283 += 32LL;
        uint64_t v277 = v355 - 1;
        if (v355 == 1) {
          goto LABEL_387;
        }
      }

      uint64_t StabilizedSampleBuffer = v299;
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v329) = StabilizedSampleBuffer;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
      CFTypeRef v57 = 0LL;
      uint64_t DerivedStorage = v338;
      uint64_t v4 = v341;
      float v68 = v335;
LABEL_391:
      v68[1] = *v68;
      *(void *)(v66 + 29312) = *((void *)&v364 + 1);
      if (!(_DWORD)StabilizedSampleBuffer) {
        goto LABEL_392;
      }
      goto LABEL_436;
    }

LABEL_387:
    if (*v334)
    {
      v300 = &time[2 * ((uint64_t)(*(_DWORD *)(v66 + 176) + (*(int *)(v66 + 176) < 0)) >> 1)];
      __int128 v301 = v300[1];
      *(_OWORD *)(v66 + 28064) = *v300;
      *(_OWORD *)(v66 + 28080) = v301;
    }

    uint64_t StabilizedSampleBuffer = sbp_gvs_createStabilizedSampleBuffer(v66, target, (uint64_t)v361, (const char *)&v369);
    uint64_t DerivedStorage = v338;
    uint64_t v4 = v341;
    float v68 = v335;
    if ((_DWORD)StabilizedSampleBuffer)
    {
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v329) = StabilizedSampleBuffer;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
      if (v369) {
        CFRelease(v369);
      }
      CFTypeRef v57 = 0LL;
    }

    else
    {
      CFTypeRef v57 = v369;
    }

    goto LABEL_391;
  }

  uint64_t v340 = v4;
  uint64_t v58 = CMBaseObjectGetDerivedStorage(v4);
  uint64_t v59 = v58;
  uint64_t v60 = (_BYTE *)(v58 + 27112);
  CFTypeRef v369 = 0LL;
  CFTypeRef v370 = 0LL;
  uint64_t v61 = *(int *)(v58 + 176);
  memset(v361, 0, sizeof(v361));
  __int128 v362 = 0u;
  __int128 v363 = 0u;
  __int128 v364 = 0u;
  __int128 v365 = 0u;
  __int128 v366 = 0u;
  __int128 v367 = 0u;
  __int128 v368 = 0u;
  uint64_t v62 = v58 + 10656;
  if (*(_BYTE *)(v58 + 28105)) {
    uint64_t v63 = v58 + 10656;
  }
  else {
    uint64_t v63 = 0LL;
  }
  v353 = (int32x2_t *)(v58 + 128);
  v356 = (float64x2_t *)(v58 + 304);
  if (*(_BYTE *)(v58 + 28105)) {
    float v64 = *(float32x2_t **)(v58 + 28112);
  }
  else {
    float v64 = 0LL;
  }
  uint64_t v87 = GVSExtractMetadataFromTopToBottomRows( v14,  v58 + 392,  *(void **)(v58 + 27096),  v63,  (uint64_t)v356,  v353,  (uint64_t)v361,  time,  0LL,  (float32x2_t *)&v369,  v64,  0LL,  v61);
  if ((_DWORD)v87)
  {
    uint64_t StabilizedSampleBuffer = v87;
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v329) = StabilizedSampleBuffer;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
    CFTypeRef v57 = 0LL;
    uint64_t v4 = v340;
LABEL_263:
    if ((_DWORD)StabilizedSampleBuffer) {
      goto LABEL_436;
    }
LABEL_392:
    ++*(_DWORD *)(DerivedStorage + 36);
    *(_BYTE *)(DerivedStorage + 32) = 0;
    goto LABEL_393;
  }

  BOOL v88 = (_BYTE *)(v59 + 10650);
  *(float32x2_t *)(v59 + 28200) = vdiv_f32( vneg_f32((float32x2_t)v369),  (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v361[4], 0));
  if (!*v60)
  {
    uint64_t v91 = v14;
    if (*(_BYTE *)(v59 + 360))
    {
      if (target)
      {
        CFTypeRef v97 = CMGetAttachment( target,  kFigVideoStabilizationSampleBufferAttachmentKey_StabilizedOutputCameraGeometry,  0LL);
        v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
        uint64_t v99 = v98;
        if (v98 && [v98 length] == &stru_20.segname[8])
        {
          id v100 = v99;
          v101 = (char *)[v100 bytes];
          *(_OWORD *)CFTypeRef cf = *(_OWORD *)v101;
          __int128 v372 = *((_OWORD *)v101 + 1);
          float32x2_t v2 = *(float32x2_t *)(v101 + 32);

          int v102 = 0;
        }

        else
        {
          fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          LODWORD(v329) = 0;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
          int v102 = FigSignalErrorAt(4294954513LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
        }
      }

      else
      {
        fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v329) = 0;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
        int v102 = 0;
      }

      __int128 v103 = v372;
      *(_OWORD *)(v59 + 28064) = *(_OWORD *)cf;
      *(_OWORD *)(v59 + 28080) = v103;
      *(float32x2_t *)(v59 + 28200) = vneg_f32(v2);
      if (!v102) {
        goto LABEL_198;
      }
LABEL_132:
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v329) = v102;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
LABEL_201:
      *(_BYTE *)(v59 + 202) = 1;
      goto LABEL_202;
    }

    if (target)
    {
      uint64_t v149 = (const __CFData *)CMGetAttachment( target,  kFigVideoStabilizationSampleBufferAttachmentKey_StabilizedOutputCenterQuaternion,  0LL);
      if (!v149)
      {
        fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v329) = 0;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v329,  v336,  v330,  v331,  v332,  v333,  v334,  (_DWORD)v335);
        uint64_t v325 = 4294954513LL;
        goto LABEL_458;
      }

      v150 = v149;
      BytePtr = CFDataGetBytePtr(v149);
      if (CFDataGetLength(v150) == 32)
      {
        __int128 v152 = *((_OWORD *)BytePtr + 1);
        *(_OWORD *)(v59 + 28064) = *(_OWORD *)BytePtr;
        *(_OWORD *)(v59 + 28080) = v152;
        uint64_t v327 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v329) = 0;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v327,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "length > 1e-8",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6158LL,  v329);
      }

      else
      {
        uint64_t v326 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v329) = 0;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v326,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "(size_t)CFDataGetLength( data) == sizeof( CLMotionTypeQuaternion)",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6153LL,  v329);
      }
    }

    else
    {
      uint64_t v324 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v329) = 0;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v324,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "sampleBuffer",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6146LL,  v329);
    }

    uint64_t v325 = 4294954516LL;
LABEL_458:
    int v102 = FigSignalErrorAt(v325, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v91 = v14;
    if (!v102) {
      goto LABEL_198;
    }
    goto LABEL_132;
  }

  CFStringRef v89 = &time[2 * v61];
  __int128 v90 = *v89;
  *(_OWORD *)(v59 + 28080) = v89[1];
  *(_OWORD *)(v59 + 28064) = v90;
  uint64_t v91 = v14;
  if (v60[993])
  {
    if (v361[12])
    {
      cf[0] = 0LL;
      int v92 = FigMotionComputeLensMovementForTimeStamp(v62, (uint64_t)cf, DWORD2(v368));
      *(float32x2_t *)(v59 + 28200) = vsub_f32( *(float32x2_t *)(v59 + 28200),  vdiv_f32( (float32x2_t)cf[0],  (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v361[4], 0)));
      if (v92) {
        goto LABEL_201;
      }
    }
  }

uint64_t sbp_gvs_finishPendingProcessing(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(a1);
  if (*(_BYTE *)(DerivedStorage + 24)) {
    return 0LL;
  }
  uint64_t v3 = DerivedStorage;
  uint64_t v4 = DerivedStorage + 29344;
  *(_BYTE *)(DerivedStorage + 25) = 1;
  int v5 = *(_DWORD *)(DerivedStorage + 29344);
  int v6 = v5 - 1;
  if (v5 < 1)
  {
    uint64_t StabilizedSampleBuffer = 0LL;
  }

  else
  {
    int v7 = 0;
    uint64_t v53 = DerivedStorage + 29776;
    uint64_t v8 = DerivedStorage + 29944;
    uint64_t v48 = kFigCaptureVideoStabilizationOverscanAnalyticsKey_AverageLuxValue;
    uint64_t v56 = kFigCaptureVideoStabilizationOverscanAnalyticsKey_PortIndex;
    uint64_t v55 = kFigCaptureVideoStabilizationOverscanAnalyticsKey_QuadraBinningFactor;
    uint64_t v54 = kFigCaptureVideoStabilizationOverscanAnalyticsKey_OverscanHistogram;
    uint64_t v43 = kFigCaptureVideoStabilizationOverscanAnalyticsKey_OverscanArray;
    uint64_t v57 = DerivedStorage + 29976;
    key = (const __CFString *)kFigVideoStabilizationSampleBufferAttachmentKey_OverscanAnalytics;
    uint64_t v46 = v1;
    uint64_t v47 = DerivedStorage + 29344;
    int v44 = v5 - 1;
    int v45 = *(_DWORD *)(DerivedStorage + 29344);
    do
    {
      CFTypeRef v58 = 0LL;
      uint64_t StabilizedSampleBuffer = sbp_gvs_gaussianAverageGetStabilizedSampleBuffer(v3, &v58);
      if (v7 == v6)
      {
        uint64_t v10 = 0LL;
        int v11 = 0;
        uint64_t v12 = v53;
        do
        {
          if (*(_DWORD *)(v3 + 4 * v10 + 29976))
          {
            uint64_t v13 = 0LL;
            int v14 = 0;
            do
            {
              int v14 = (int)(float)(*(float *)(v12 + v13) + (float)v14);
              v13 += 4LL;
            }

            while (v13 != 28);
            if (v14 >= 1)
            {
              for (uint64_t i = 0LL; i != 28; i += 4LL)
                *(float *)(v12 + i) = *(float *)(v12 + i) / (float)v14;
              v11 += v14;
            }
          }

          ++v10;
          v12 += 28LL;
        }

        while (v10 != 6);
        if (v11 >= 1)
        {
          uint64_t v16 = 0LL;
          float v17 = (float)v11;
          do
          {
            *(float *)(v8 + v16) = *(float *)(v8 + v16) / v17;
            v16 += 4LL;
          }

          while (v16 != 28);
          *(float *)(v4 + 628) = *(float *)(v4 + 628) / v17;
        }

        CFTypeRef v18 = v58;
        int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary", key));
        if (v19)
        {
          CMAttachmentBearerRef target = v18;
          int v52 = v7;
          CFTypeID v20 = v19;
          id NSArray = _createNSArray(v3 + 29944);
          int v51 = (void *)objc_claimAutoreleasedReturnValue(NSArray);
          objc_msgSend(v20, "setObject:forKeyedSubscript:");
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  *(float *)(v4 + 628)));
          [v20 setObject:v22 forKeyedSubscript:v48];

          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
          if (v23)
          {
            unsigned int v49 = StabilizedSampleBuffer;
            uint64_t v24 = 0LL;
            uint64_t v25 = v53;
            uint64_t v26 = v57;
            do
            {
              int v27 = *(_DWORD *)(v26 + v24);
              if (v27)
              {
                uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
                if (v28)
                {
                  uint64_t v29 = (v27 >> 16);
                  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  (unsigned __int16)v27));
                  [v28 setObject:v30 forKeyedSubscript:v56];

                  int v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v29));
                  [v28 setObject:v31 forKeyedSubscript:v55];

                  id v32 = _createNSArray(v25);
                  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
                  [v28 setObject:v33 forKeyedSubscript:v54];
                  [v23 addObject:v28];

                  uint64_t v26 = v57;
                }
              }

              v24 += 4LL;
              v25 += 28LL;
            }

            while (v24 != 24);
            uint64_t v1 = v46;
            uint64_t v4 = v47;
            uint64_t StabilizedSampleBuffer = v49;
            int v6 = v44;
            int v5 = v45;
            if ([v23 count])
            {
              [v20 setObject:v23 forKeyedSubscript:v43];
              CMSetAttachment(target, key, v20, 1u);
            }
          }

          int v7 = v52;
          int v19 = v20;
        }
      }

      if (*(void *)(v3 + 8))
      {
        sbp_emitPendingFrames(v1, StabilizedSampleBuffer, (uint64_t)v58);
        uint64_t StabilizedSampleBuffer = 0LL;
      }

      if (v58) {
        CFRelease(v58);
      }
      ++*(_DWORD *)(v3 + 36);
      ++v7;
    }

    while (v7 != v5);
  }

  uint64_t v34 = *(void **)(v3 + 88);
  if (v34) {
    AffineTransformFinish(v34);
  }
  int v35 = *(void **)(v3 + 112);
  if (v35) {
    [v35 finishProcessing];
  }
  uint64_t v36 = *(void **)(v3 + 30008);
  if (v36) {
    [v36 finishProcessing];
  }
  if (*(void *)(v3 + 8)) {
    sbp_emitPendingFrames(v1, 0LL, 0LL);
  }
  if (*(_DWORD *)v4)
  {
    int v37 = *(_DWORD *)(v4 + 4);
    if (v37 >= 1)
    {
      for (uint64_t j = 0LL; j < v37; ++j)
      {
        BOOL v39 = *(const void **)(*(void *)(v3 + 29320) + 8 * j);
        if (v39)
        {
          CFRelease(v39);
          *(void *)(*(void *)(v3 + 29320) + 8 * j) = 0LL;
          int v37 = *(_DWORD *)(v4 + 4);
        }
      }
    }
  }

  _resetFirstFrameParameters(v3);
  *(_BYTE *)(v3 + 25) = 0;
  char v40 = *(FILE **)(v3 + 29648);
  if (v40)
  {
    fclose(v40);
    *(void *)(v3 + 29648) = 0LL;
  }

  return StabilizedSampleBuffer;
}

uint64_t sbp_enableLongPressMode(uint64_t a1, int a2)
{
  uint64_t v5 = a1 + 29432;
  *(_BYTE *)(a1 + 29472) = 0;
  char v6 = a2 ^ 1;
  *(_BYTE *)(a1 + 29432) = a2 ^ 1;
  uint64_t v7 = sbp_configureOverscanParameters(a1, *(_DWORD *)(a1 + 128), *(_DWORD *)(a1 + 132), (uint64_t)&v17, (uint64_t *)&v18);
  if ((_DWORD)v7)
  {
    uint64_t v13 = v7;
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v13,  v2,  (const char *)v17,  *((const char **)&v17 + 1),  v18,  *(const char **)&v19[4],  v20,  v21);
    return v13;
  }

  if (*(_DWORD *)(a1 + 136) == v18
    && *(void *)(a1 + 140) == *(void *)v19
    && *(_DWORD *)(a1 + 148) == *(_DWORD *)&v19[8])
  {
    *(_OWORD *)(a1 + 152) = v17;
    if (*(_BYTE *)(v5 + 240)) {
      return 0LL;
    }
    uint64_t v8 = *(unsigned int *)(a1 + 228);
    if ((int)v8 >= 1)
    {
      unsigned int v9 = (void *)(a1 + 256);
      BOOL v10 = 1;
      do
      {
        BOOL v10 = v10 && *v9++ != 0LL;
        --v8;
      }

      while (v8);
      if (v10)
      {
        *(_BYTE *)(a1 + 224) = v6;
        AffineTransformConfigureBlurBorderPixels(*(void **)(a1 + 88), (const char *)(a1 + 224));
        if (a2)
        {
          int v11 = (const char *)*(unsigned int *)(a1 + 136);
          uint64_t v12 = *(unsigned int *)(a1 + 140);
        }

        else
        {
          int v11 = 0LL;
          uint64_t v12 = 0LL;
        }

        AffineTransformSetOverscanFill(*(void **)(a1 + 88), v11, v12);
        return 0LL;
      }
    }

    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "buffersAllocated",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  3170LL,  0);
  }

  else
  {
    uint64_t v15 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v15,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "ctx->croppedOutputRect.origin.x == croppedOutputRect.origin.x && ctx->croppedOutputRect.origin.y == croppedOutputR ect.origin.y && ctx->croppedOutputRect.size.width == croppedOutputRect.size.width && ctx->croppedOutputRect.size.h eight == croppedOutputRect.size.height",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  3153LL,  0);
  }

  return FigSignalErrorAt(4294954510LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t sbp_enableP3ToBT2020Conversion(uint64_t a1, const char *a2)
{
  if (*(_DWORD *)(a1 + 172))
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    int v6 = 0;
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", v6, v2, v7, v8, v9, v10, vars0, vars8);
    return FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    char v3 = (char)a2;
    AffineTransformConfigureP3ToBT2020conversion(*(void **)(a1 + 88), a2);
    *(_BYTE *)(a1 + 29728) = v3;
    return 0LL;
  }

void _cinematic_freeRingBuffers(void *a1)
{
  float32x2_t v2 = a1 + 3750;
  char v3 = (int *)a1 + 7337;
  uint64_t v4 = (void *)a1[3665];
  if (v4)
  {
    a1[3665] = 0LL;
    free(v4);
  }

  if (*v2)
  {
    uint64_t v5 = (char *)a1[3666];
    if (*v3 >= 1)
    {
      uint64_t v6 = 0LL;
      uint64_t v7 = 0LL;
      do
      {
        uint64_t v8 = *(void **)&v5[v6 + 8];
        *(void *)&v5[v6 + 8] = 0LL;

        uint64_t v5 = (char *)a1[3666];
        *(void *)&v5[v6] = 0LL;
        ++v7;
        v6 += 24LL;
      }

      while (v7 < *v3);
      goto LABEL_9;
    }

    if (v5)
    {
LABEL_9:
      a1[3666] = 0LL;
      free(v5);
    }
  }

  int v9 = (void *)a1[3670];
  if (v9)
  {
    int v10 = v3[14];
    if (v10 < 1) {
      goto LABEL_17;
    }
    for (uint64_t i = 0LL; i < v10; ++i)
    {
      uint64_t v12 = a1[3670];
      uint64_t v13 = *(void **)(v12 + 8 * i);
      if (v13)
      {
        *(void *)(v12 + 8 * i) = 0LL;
        free(v13);
        int v10 = v3[14];
      }
    }

    int v9 = (void *)a1[3670];
    if (v9)
    {
LABEL_17:
      a1[3670] = 0LL;
      free(v9);
    }
  }

  int v14 = (void *)a1[3671];
  if (v14)
  {
    int v15 = v3[14];
    if (v15 < 1) {
      goto LABEL_25;
    }
    for (uint64_t j = 0LL; j < v15; ++j)
    {
      uint64_t v17 = a1[3671];
      int v18 = *(void **)(v17 + 8 * j);
      if (v18)
      {
        *(void *)(v17 + 8 * j) = 0LL;
        free(v18);
        int v15 = v3[14];
      }
    }

    int v14 = (void *)a1[3671];
    if (v14)
    {
LABEL_25:
      a1[3671] = 0LL;
      free(v14);
    }
  }

  int v19 = (void *)a1[3672];
  if (v19)
  {
    if (v3[14] < 1) {
      goto LABEL_31;
    }
    uint64_t v20 = 0LL;
    uint64_t v21 = 0LL;
    do
    {
      uint64_t v22 = a1[3672];
      uint64_t v23 = *(void **)(v22 + v20);
      *(void *)(v22 + v20) = 0LL;

      uint64_t v24 = a1[3672] + v20;
      uint64_t v25 = *(void **)(v24 + 8);
      *(void *)(v24 + 8) = 0LL;

      ++v21;
      v20 += 240LL;
    }

    while (v21 < v3[14]);
    int v19 = (void *)a1[3672];
    if (v19)
    {
LABEL_31:
      a1[3672] = 0LL;
      free(v19);
    }
  }

  uint64_t v26 = (void *)a1[3673];
  if (v26)
  {
    a1[3673] = 0LL;
    free(v26);
  }

  int v27 = (void *)a1[3669];
  a1[3669] = 0LL;
}

void sbp_gvs_freeDerivedVectorsAndSphereLensMovements(uint64_t a1)
{
  float32x2_t v2 = *(void **)(a1 + 28112);
  if (v2)
  {
    *(void *)(a1 + 28112) = 0LL;
    free(v2);
  }

  char v3 = *(void **)(a1 + 27376);
  if (v3)
  {
    *(void *)(a1 + 27376) = 0LL;
    free(v3);
  }

void sbp_ltm_deallocateLtcCorrectionTexture(uint64_t a1)
{
  uint64_t v2 = a1 + 29596;
  FigMetalDecRef(a1 + 29608);
  char v3 = *(void **)(a1 + 29608);
  *(void *)(a1 + 29608) = 0LL;

  *(_BYTE *)(v2 + 30) = 1;
  else {
    int v4 = 3;
  }
  *(_DWORD *)(v2 + 40) = v4;
  *(_BYTE *)(v2 + 32) = 0;
}

id _loadAndConfigureVideoDeghosting(void *a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v28 = a1;
  id v8 = a2;
  id v9 = a3;
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"Version"]);
  id v11 = [v10 intValue];

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@V%d",  @"VideoDeghosting",  v11));
  if ((int)a4 < 1 || a4 <= 0)
  {
    FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v13 = 0LL;
    int v14 = 0LL;
LABEL_17:
    int v15 = 0LL;
    uint64_t v21 = 0LL;
    int v19 = 0LL;
    goto LABEL_18;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@.bundle",  @"/System/Library/VideoProcessors",  v12));
  int v14 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CMI%@V%d",  @"VideoDeghosting",  v11));
  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v13));
  if (v15) {
    goto LABEL_6;
  }
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"./%@.bundle", v12));
  uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v16));
  if (!v17)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v26) = 0;
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", v26, v4, v28, v30, v31, v32, v33, v34);

    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v27) = 0;
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", v27, v4, v29, v30, v31, v32, v33, v34);
    FigSignalErrorAt(4294954510LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    goto LABEL_17;
  }

  int v15 = (void *)v17;

LABEL_6:
  uint64_t v30 = 0LL;
  unsigned int v18 = [v15 loadAndReturnError:&v30];
  int v19 = v30;
  if (!v18)
  {
    uint64_t v21 = 0LL;
LABEL_18:
    uint64_t v22 = (char *)v28;
    goto LABEL_10;
  }

  id v20 = [objc_alloc(NSClassFromString(v14)) initWithCommandQueue:v8 imageDimensions:a4 tuningParameters:v9];
  uint64_t v21 = v20;
  uint64_t v22 = (char *)v28;
  if (!v20)
  {
    uint64_t v25 = 4294954510LL;
LABEL_15:
    FigSignalErrorAt(v25, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    goto LABEL_10;
  }

  if ([v20 prepareToProcess:0])
  {
    uint64_t v25 = 4294954516LL;
    goto LABEL_15;
  }

  [v21 setCameraInfoByPortType:v28];
LABEL_10:
  id v23 = v21;

  return v23;
}

double _resetFirstFrameParameters(uint64_t a1)
{
  uint64_t v2 = a1 + 29732;
  uint64_t v3 = a1 + 28776;
  uint64_t v4 = a1 + 27072;
  *(_BYTE *)(a1 + 32) = 1;
  *(_DWORD *)(a1 + 36) = 0;
  uint64_t v5 = *(void **)(a1 + 27096);
  *(_WORD *)(a1 + 10650) = 257;
  [v5 reset];
  *(_WORD *)uint64_t v4 = 257;
  *(void *)(a1 + 29304) = 0x3FF0000000000000LL;
  FigMotionInitializeQuaternion((void *)(a1 + 28064));
  FigMotionInitializeQuaternion((void *)(a1 + 28216));
  *(_BYTE *)(v4 + 1136) = 0;
  *(void *)(a1 + 29116) = 0x3BA3D70A00000000LL;
  *(void *)(a1 + 29292) = 0LL;
  *(void *)(a1 + 29204) = 0LL;
  uint64_t v6 = (void *)(a1 + 27392);
  uint64_t v7 = 7LL;
  do
  {
    FigMotionInitializeQuaternion(v6);
    FigMotionInitializeQuaternion(v6 + 28);
    FigMotionInitializeQuaternion(v6 + 56);
    v6 += 4;
    --v7;
  }

  while (v7);
  int v8 = *(_DWORD *)(v4 + 44);
  if ((v8 - 1) < 3)
  {
    *(_BYTE *)(v3 + 696) = v8 == 2;
    if (*(_DWORD *)(v3 + 788)) {
      [*(id *)(a1 + 29600) reset];
    }
    FigMetalDecRef(a1 + 29608);
    id v9 = *(void **)(a1 + 29608);
    *(void *)(a1 + 29608) = 0LL;

    *(_DWORD *)(v3 + 849) = 0x1000000;
    *(void *)(a1 + 29632) = 0x300000000LL;
    *(_DWORD *)(v3 + 820) = 0;
    *(_DWORD *)(v3 + 568) = 0;
    *(void *)(a1 + 29336) = 0LL;
    if (*(_BYTE *)(v3 + 954))
    {
      *(_DWORD *)(v2 + 8) = 0;
      *(void *)uint64_t v2 = 0xFFFFFFFFLL;
      *(_WORD *)(v2 + 16) = 1;
    }

    *(_DWORD *)(v3 + 624) = 0;
    *(void *)(a1 + 29392) = 0LL;
    [*(id *)(a1 + 29352) reset];
    int v10 = *(void **)(a1 + 29352);
    if (v10)
    {
      [v10 getQuaternionSmoothingArrays];
      uint64_t v11 = v19;
      if (v19 >= 1)
      {
        uint64_t v12 = v18;
        do
        {
          _DWORD *v12 = 0;
          v12 += 20;
          --v11;
        }

        while (v11);
      }
    }
  }

  uint64_t v13 = *(void **)(a1 + 29520);
  if (v13) {
    [v13 reset];
  }
  int v14 = *(void **)(a1 + 29696);
  if (v14) {
    [v14 reset];
  }
  int v15 = *(void **)(a1 + 30008);
  if (v15)
  {
    [v15 resetState];
    uint64_t v16 = *(void **)(a1 + 30008);
    *(void *)(a1 + 30008) = 0LL;
  }

  *(_BYTE *)uint64_t v3 = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 29712) = 0u;
  *(void *)(a1 + 28696) = 0LL;
  *(_DWORD *)(v4 + 1700) = -1082130432;
  *(_OWORD *)(a1 + 29776) = 0u;
  *(_OWORD *)(a1 + 29792) = 0u;
  *(_OWORD *)(a1 + 29808) = 0u;
  *(_OWORD *)(a1 + 29824) = 0u;
  *(_OWORD *)(a1 + 29840) = 0u;
  *(_OWORD *)(a1 + 29856) = 0u;
  *(_OWORD *)(a1 + 29872) = 0u;
  *(_OWORD *)(a1 + 29888) = 0u;
  *(_OWORD *)(a1 + 29904) = 0u;
  *(_OWORD *)(a1 + 29920) = 0u;
  *(_OWORD *)(a1 + 29936) = 0u;
  *(_OWORD *)(a1 + 29952) = 0u;
  *(_OWORD *)(a1 + 29968) = 0u;
  *(_OWORD *)(a1 + 29984) = 0u;
  return result;
}

__CFString *sbp_gvs_copyDebugDescription(uint64_t a1)
{
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  CFStringAppendFormat(Mutable, 0LL, @"<FigSampleBufferProcessor_GyroVideoStabilization %p>", a1);
  return Mutable;
}

uint64_t sbp_gvs_copyProperty(uint64_t a1, const void *a2, uint64_t a3, __CFDictionary **a4)
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_BYTE *)(DerivedStorage + 24))
  {
    uint64_t v7 = 4294954511LL;
    return FigSignalErrorAt(v7, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  if (!a4)
  {
    uint64_t v7 = 4294954516LL;
    return FigSignalErrorAt(v7, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  uint64_t v9 = DerivedStorage;
  if (CFEqual(a2, kFigSampleBufferProcessorProperty_SourcePixelBufferAttributes))
  {
    Mutable = CFDictionaryCreateMutable(0LL, 1LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    qmemcpy( v22,  "v024f024024x02fx024p02fp0v8&0f8&0vx&0fx&0v8-0f8-0v8/0f8/0v8|0f8|0vx-0fx-0vx/0fx/0vx|0fx|",  sizeof(v22));
    IOSurfacePropertiesDictionary = (const void *)FigCreateIOSurfacePropertiesDictionary();
    uint64_t v12 = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
    for (uint64_t i = 0LL; i != 88; i += 4LL)
    {
      int v14 = *(_DWORD *)(v9 + 40);
      if (!v14 || v14 == *(_DWORD *)&v22[i])
      {
        CFNumberRef v15 = CFNumberCreate(0LL, kCFNumberSInt32Type, &v22[i]);
        CFArrayAppendValue(v12, v15);
        CFRelease(v15);
      }
    }

    CFDictionaryAddValue(Mutable, kCVPixelBufferPixelFormatTypeKey, v12);
    CFRelease(v12);
    CFDictionaryAddValue(Mutable, kCVPixelBufferIOSurfacePropertiesKey, IOSurfacePropertiesDictionary);
    Boolean Value = (const __CFNumber *)CFDictionaryGetValue( (CFDictionaryRef)IOSurfacePropertiesDictionary,  kIOSurfaceCacheMode);
    if (Value)
    {
      CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
      PixelBufferCacheModeArray = (const void *)FigCreatePixelBufferCacheModeArray(valuePtr);
      CFDictionaryAddValue(Mutable, kCVPixelBufferCacheModeKey, PixelBufferCacheModeArray);
      CFRelease(PixelBufferCacheModeArray);
    }

    CFRelease(IOSurfacePropertiesDictionary);
    uint64_t result = 0LL;
    *a4 = Mutable;
  }

  else
  {
    if (CFEqual(a2, kFigVideoStabilizationSampleBufferProcessorProperty_VideoStabilizationDisabled))
    {
      unsigned int v18 = (CFTypeRef *)&kCFBooleanTrue;
      int v19 = *(unsigned __int8 *)(v9 + 84);
    }

    else
    {
      if (!CFEqual(a2, kFigVideoStabilizationSampleBufferProcessorProperty_FlipHorizontalOrientation)) {
        return 4294954512LL;
      }
      unsigned int v18 = (CFTypeRef *)&kCFBooleanTrue;
      int v19 = *(unsigned __int8 *)(v9 + 203);
    }

    if (!v19) {
      unsigned int v18 = (CFTypeRef *)&kCFBooleanFalse;
    }
    id v20 = (__CFDictionary *)CFRetain(*v18);
    uint64_t result = 0LL;
    *a4 = v20;
  }

  return result;
}

uint64_t sbp_configureOverscanParameters(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t *a5)
{
  int v6 = a2 - *(_DWORD *)(a1 + 29640);
  if ((v6 & 0x80000000) == 0)
  {
    int v8 = a3 - *(_DWORD *)(a1 + 29644);
    if ((v8 & 0x80000000) == 0)
    {
      uint64_t v11 = (v6 >> 1);
      uint64_t v12 = (v8 >> 1);
      uint64_t v13 = a2 - (v6 & 0xFFFFFFFE);
      uint64_t v14 = v11 | (v12 << 32);
      *a5 = v14;
      a5[1] = v13 | ((unint64_t)(a3 - (v8 & 0xFFFFFFFE)) << 32);
      *(_OWORD *)a4 = *(_OWORD *)a5;
      if (!*(_BYTE *)(a1 + 29432))
      {
LABEL_14:
        uint64_t v26 = 0LL;
        *(void *)a4 = v14;
        *(void *)(a4 + 8) = (a2 - 2 * v11) | ((unint64_t)(a3 - 2 * v12) << 32);
        return v26;
      }

      int v17 = *(_DWORD *)(a1 + 29640);
      int v16 = *(_DWORD *)(a1 + 29644);
      double v18 = *(double *)(a1 + 29440);
      double v19 = *(double *)(a1 + 29448);
      double v20 = *(double *)(a1 + 29456);
      double v21 = *(double *)(a1 + 29464);
      v45.origin.x = v18;
      v45.origin.y = v19;
      v45.size.width = v20;
      v45.size.height = v21;
      if (CGRectIsEmpty(v45))
      {
        uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "!CGRectIsEmpty( rect)",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2614LL,  0);
      }

      else
      {
        int v22 = (int)v20;
        if (v17 < (int)v20)
        {
          uint64_t v29 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v29,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "width <= imageWidth",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2616LL,  0);
        }

        else
        {
          int v23 = (int)v21;
          if (v16 < (int)v21)
          {
            uint64_t v30 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
            FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v30,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "height <= imageHeight",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2617LL,  0);
          }

          else
          {
            int v24 = (int)v18;
            if (((int)v18 & 1) != 0)
            {
              uint64_t v31 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
              FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v31,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "( x & 0x01) == 0",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2619LL,  0);
            }

            else
            {
              int v25 = (int)v19;
              if (((int)v19 & 1) != 0)
              {
                uint64_t v32 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v32,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "( y & 0x01) == 0",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2620LL,  0);
              }

              else if (((v22 + v24) & 1) != 0)
              {
                uint64_t v33 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v33,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "((x + width) & 0x01) == 0",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2622LL,  0);
              }

              else if (((v23 + v25) & 1) != 0)
              {
                uint64_t v34 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v34,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "((y + height) & 0x01) == 0",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2623LL,  0);
              }

              else if (v22 + 2 * v24 == v17)
              {
                if (v23 + 2 * v25 == v16)
                {
LABEL_13:
                  uint64_t v11 = (v11 + (int)*(double *)(a1 + 29440));
                  uint64_t v12 = (v12 + (int)*(double *)(a1 + 29448));
                  uint64_t v14 = v11 | (v12 << 32);
                  goto LABEL_14;
                }

                uint64_t v36 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v36,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "( height + 2 * y) == imageHeight",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2626LL,  0);
              }

              else
              {
                uint64_t v35 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v35,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "( width + 2 * x) == imageWidth",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  2625LL,  0);
              }
            }
          }
        }
      }

      uint64_t v37 = FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
      if ((_DWORD)v37)
      {
        uint64_t v26 = v37;
        fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v38) = v26;
        FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", v38, v5, v39, v40, v41, v42, v43, v44);
        return v26;
      }

      goto LABEL_13;
    }
  }

  fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
  FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v5, v39, v40, v41, v42, v43, v44);
  return FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

id sbp_initializeGPUWithRenderMethod(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 216))
  {
    uint64_t v2 = *(void *)(a1 + 384);
    if (v2)
    {
      FigCFDictionaryGetIntIfPresent(v2, kFigCaptureSensorIDDictionaryKey_VideoStabilizationRenderMethod, a1 + 212);
    }

    else if (*(_DWORD *)(a1 + 27116) == 2)
    {
      *(_DWORD *)(a1 + 212) = 1;
    }
  }

  return AffineTransformSetRenderMethod(*(void **)(a1 + 88), (const char *)*(unsigned int *)(a1 + 212));
}

uint64_t sbp_setCameraExtrinsicAlignment(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 length] == &stru_20.fileoff)
  {
    id v4 = [v3 bytes];
    uint64_t v12 = GVSQuaternionFromRotationMatrix((uint64_t)v4, (double *)v15, v5, v6, v7, v8, v9, v10, v11);
    if (!(_DWORD)v12)
    {
      __int128 v13 = v15[1];
      *(_OWORD *)(a1 + 328) = v15[0];
      *(_OWORD *)(a1 + 344) = v13;
      *(_BYTE *)(a1 + 289) = 1;
    }
  }

  else
  {
    uint64_t v12 = FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  return v12;
}

BOOL sbp_gvs_verifyInputBuffer(__CVBuffer *a1)
{
  PixelFormatCFNumberType Type = CVPixelBufferGetPixelFormatType(a1);
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a1);
  size_t Width = CVPixelBufferGetWidth(a1);
  if ((Width & 3) != 0) {
    return 0LL;
  }
  size_t v6 = Width;
  BOOL result = 0LL;
  if (PixelFormatType > 1534621231)
  {
    if (PixelFormatType <= 2033463855)
    {
      if (PixelFormatType > 1885745711)
      {
        if (PixelFormatType > 2016686641)
        {
          if (PixelFormatType == 2016686642 || PixelFormatType == 2019963440) {
            goto LABEL_69;
          }
          int v7 = 2019963442;
        }

        else
        {
          if (PixelFormatType == 1885745712 || PixelFormatType == 1885745714) {
            goto LABEL_69;
          }
          int v7 = 2016686640;
        }

        goto LABEL_68;
      }

      if (PixelFormatType > 1751411058)
      {
        if (PixelFormatType != 1751411059)
        {
          if (PixelFormatType == 1882468912) {
            goto LABEL_69;
          }
          int v7 = 1882468914;
          goto LABEL_68;
        }

        return IOSurface || CVPixelBufferGetBytesPerRowOfPlane(a1, 0LL) == v6;
      }

      if (PixelFormatType == 1534621232) {
        goto LABEL_69;
      }
      if (PixelFormatType != 1714696752) {
        return result;
      }
    }

    else
    {
      if (PixelFormatType > 2088269359)
      {
        if (PixelFormatType > 2100852271)
        {
          if (PixelFormatType == 2100852272 || PixelFormatType == 2105046576) {
            goto LABEL_69;
          }
          int v7 = 2105042480;
        }

        else
        {
          if (PixelFormatType == 2088269360 || PixelFormatType == 2088269362) {
            goto LABEL_69;
          }
          int v7 = 2100848176;
        }

        goto LABEL_68;
      }

      if (PixelFormatType > 2084075055)
      {
        if (PixelFormatType == 2084075056 || PixelFormatType == 2088265264) {
          goto LABEL_69;
        }
        int v7 = 2088265266;
        goto LABEL_68;
      }

      if (PixelFormatType != 2033463856 && PixelFormatType != 2037741171)
      {
        int v7 = 2084070960;
        goto LABEL_68;
      }
    }

    if (IOSurface) {
      return 1LL;
    }
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a1, 0LL);
    size_t v9 = CVPixelBufferGetBytesPerRowOfPlane(a1, 1uLL);
    size_t v10 = CVPixelBufferGetBytesPerRowOfPlane(a1, 2uLL);
    if (BytesPerRowOfPlane == v6)
    {
      size_t v11 = v10;
      BOOL result = 0LL;
      if (v9 == v6 >> 1 && v11 == v6 >> 1) {
        return 1LL;
      }
      return result;
    }

    return 0LL;
  }

  if (PixelFormatType > 762869297)
  {
    if (PixelFormatType <= 796423727)
    {
      if (PixelFormatType <= 792229423)
      {
        if (PixelFormatType == 762869298) {
          goto LABEL_69;
        }
        int v7 = 792225328;
      }

      else
      {
        if (PixelFormatType == 792229424 || PixelFormatType == 796419632) {
          goto LABEL_69;
        }
        int v7 = 796419634;
      }
    }

    else if (PixelFormatType > 875704437)
    {
      if (PixelFormatType == 875704438 || PixelFormatType == 1530422832) {
        goto LABEL_69;
      }
      int v7 = 1530426928;
    }

    else
    {
      if (PixelFormatType == 796423728 || PixelFormatType == 796423730) {
        goto LABEL_69;
      }
      int v7 = 875704422;
    }
  }

  else if (PixelFormatType <= 645428785)
  {
    if (PixelFormatType <= 645424687)
    {
      if (PixelFormatType == 641230384) {
        goto LABEL_69;
      }
      int v7 = 641234480;
    }

    else
    {
      if (PixelFormatType == 645424688 || PixelFormatType == 645424690) {
        goto LABEL_69;
      }
      int v7 = 645428784;
    }
  }

  else if (PixelFormatType > 762865199)
  {
    if (PixelFormatType == 762865200 || PixelFormatType == 762865202) {
      goto LABEL_69;
    }
    int v7 = 762869296;
  }

  else
  {
    if (PixelFormatType == 645428786 || PixelFormatType == 758670896) {
      goto LABEL_69;
    }
    int v7 = 758674992;
  }

LABEL_68:
  if (PixelFormatType != v7) {
    return result;
  }
LABEL_69:
  if (IOSurface) {
    return 1LL;
  }
  size_t v12 = CVPixelBufferGetBytesPerRowOfPlane(a1, 0LL);
  size_t v13 = CVPixelBufferGetBytesPerRowOfPlane(a1, 1uLL);
  BOOL result = 0LL;
  if (v12 == v6 && v13 == v6) {
    return 1LL;
  }
  return result;
}

void _getPresentationTimeStampForSampleBuffer(void *a1@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)a2 = *(_OWORD *)&kCMTimeInvalid.value;
  *(void *)(a2 + 16) = kCMTimeInvalid.epoch;
  if (a1)
  {
    uint64_t v4 = kFigCaptureSampleBufferAttachmentKey_OriginalPresentationTimeStamp;
    float64x2_t v5 = (const __CFDictionary *)CMGetAttachment( a1,  kFigCaptureSampleBufferAttachmentKey_OriginalPresentationTimeStamp,  0LL);
    size_t v6 = (id)CMGetAttachment(a1, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0LL);
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

    if (v7)
    {
      double v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);
      CMTimeMakeFromDictionary(&v9, v8);
      *(CMTime *)a2 = v9;
    }

    else
    {
      if (v5) {
        CMTimeMakeFromDictionary(&v9, v5);
      }
      else {
        CMSampleBufferGetPresentationTimeStamp(&v9, (CMSampleBufferRef)a1);
      }
      *(CMTime *)a2 = v9;
    }
  }

#error "10BD0: call analysis failed (funcsize=33)"
uint64_t sbp_emitPendingFrames(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  BOOL v6;
  char v8;
  BOOL result = CMBaseObjectGetDerivedStorage();
  if (*(_BYTE *)(result + 29672))
  {
    if ((_DWORD)a2 || a3) {
      return (*(uint64_t (**)(void, uint64_t, uint64_t))(result + 8))(*(void *)(result + 16), a2, a3);
    }
  }

  else
  {
    if ((_DWORD)a2) {
      size_t v6 = 1;
    }
    else {
      size_t v6 = *(_BYTE *)(result + 29730) == 0;
    }
    double v8 = !v6 && a3 == 0;
    if ((_DWORD)a2 || a3 || (v8 & 1) != 0 || *(_BYTE *)(result + 25)) {
      return (*(uint64_t (**)(void, uint64_t, uint64_t))(result + 8))(*(void *)(result + 16), a2, a3);
    }
  }

  return result;
}

uint64_t _getFrameRateConversionStatus()
{
  HIDWORD(v5) = 0;
  uint64_t MetadataDictionary = _getMetadataDictionary();
  if (MetadataDictionary)
  {
    FigCFDictionaryGetInt32IfPresent( MetadataDictionary,  kFigVideoStabilizationSampleBufferProcessorMetadata_FrameRateConversionStatus,  (char *)&v5 + 4);
    return HIDWORD(v5);
  }

  else
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    int v3 = 0;
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", v3, v0, v4, v5, v6, v7, vars0, vars8);
    return 0LL;
  }

uint64_t sbp_gvs_cinematicAddMetadataToQuaternionAndSphereRingBuffers(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v5 = a1 + 28248;
  uint64_t v6 = a1 + 27116;
  uint64_t v7 = *(unsigned int *)(a1 + 176);
  id v8 = *(id *)(a1 + 29352);
  int v194 = 0;
  uint64_t v193 = 0LL;
  float32x2_t v192 = 0LL;
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace(822152385LL, 15LL, 0LL, 0LL, 0LL);
  }
  CMTime v9 = (void *)(a1 + 128);
  __int128 v202 = 0u;
  __int128 v203 = 0u;
  __int128 v200 = 0u;
  __int128 v201 = 0u;
  __int128 v198 = 0u;
  __int128 v199 = 0u;
  __int128 v196 = 0u;
  __int128 v197 = 0u;
  __int128 v195 = 0u;
  uint64_t v10 = a1 + 392;
  if (*(_BYTE *)(v6 + 989)) {
    uint64_t v11 = a1 + 10656;
  }
  else {
    uint64_t v11 = 0LL;
  }
  if (*(_BYTE *)(v6 + 989)) {
    size_t v12 = *(float32x2_t **)(*(void *)(a1 + 29360) + 8LL * *(int *)(v5 + 1148));
  }
  else {
    size_t v12 = 0LL;
  }
  if (*(_DWORD *)v5) {
    uint64_t v13 = v5;
  }
  else {
    uint64_t v13 = 0LL;
  }
  int v14 = GVSExtractMetadataFromTopToBottomRows( a2,  a1 + 392,  *(void **)(a1 + 27096),  v11,  a1 + 304,  (int32x2_t *)(a1 + 128),  (uint64_t)&v195,  v212,  (uint64_t)&v193,  &v192,  v12,  v13,  v7);
  uint64_t v170 = v14;
  if (v14)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    uint64_t v157 = v170;
    LODWORD(v159) = v170;
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", v159, v2, v160, v161, v162, v163, v165, v167);
    goto LABEL_128;
  }

  double v16 = 0.0;
  if (*(_DWORD *)v5 && *(_BYTE *)(v5 + 516))
  {
    LODWORD(v15) = *(_DWORD *)(v5 + 452);
    v17.f32[0] = FigMotionAdjustParallaxShiftForScalingFactor( *(float *)(v5 + 448),  v15,  *(float *)(v5 + 524),  *(float *)&v196);
    v17.i32[1] = v18;
    double v16 = COERCE_DOUBLE(vdiv_f32(v17, (float32x2_t)vdup_lane_s32(*(int32x2_t *)((char *)&v195 + 4), 0)));
  }

  uint64_t v19 = (int)v7;
  float32x2_t v20 = v192;
  if (!*(_BYTE *)(v5 + 1508)) {
    goto LABEL_22;
  }
  LODWORD(point[0].x) = 1065353216;
  if (!FigCFDictionaryGetFloatIfPresent( a2,  kFigVideoStabilizationSampleBufferProcessorMetadata_TotalZoomFactor,  point))
  {
    *(_BYTE *)(v5 + 1508) = 0;
LABEL_22:
    float v26 = 0.0;
    float v21 = 0.0;
    float v169 = 0.0;
    goto LABEL_23;
  }

  *(_DWORD *)uint64_t v205 = DWORD1(v196);
  FigCFDictionaryGetFloatIfPresent( a2,  kFigMotionAttachmentsSampleBufferProcessorMetadata_VideoStabilizationDigitalZoomFactor,  v205);
  float v21 = *((float *)&v196 + 1);
  float v22 = *(float *)&point[0].x;
  if (*((float *)&v196 + 1) != *(float *)v205)
  {
    float v22 = (float)(*((float *)&v196 + 1) / *(float *)v205) * *(float *)&point[0].x;
    *(float *)&point[0].double x = v22;
  }

  float v169 = logf(v22);
  float v23 = *(float *)(v5 + 1516);
  float v24 = *(float *)(v5 + 1520);
  float v25 = GVSComputeMinimumZoomFactor((float64x2_t *)((char *)&v202 + 8), (int32x2_t *)(a1 + 152));
  float v26 = fminf(fmaxf(v25 * powf(v21 / v25, 1.0 - fminf(fmaxf(v23, 0.0), 1.0)), v25), v24 * v25);
LABEL_23:
  if (*(_BYTE *)(v6 + 989))
  {
    sbp_gvs_computeBaseSphereLensMovements( v7,  *(_DWORD *)(a1 + 180),  *(void **)(*(void *)(a1 + 29360) + 8LL * *(int *)(v5 + 1148)),  *(void **)(*(void *)(a1 + 29368) + 8LL * *(int *)(v5 + 1148)));
    uint64_t v168 = v6;
    if (*(_BYTE *)(v6 + 988) || *(_DWORD *)v6 == 3 || *(_DWORD *)v5)
    {
      uint64_t v28 = a1 + 392;
      if ((int)v7 < 1)
      {
        float32x2_t v30 = 0LL;
      }

      else
      {
        uint64_t v29 = *(float32x2_t **)(*(void *)(a1 + 29368) + 8LL * *(int *)(v5 + 1148));
        float32x2_t v30 = 0LL;
        do
        {
          float32x2_t v31 = *v29++;
          v27.i32[1] = v31.i32[1];
          float32x2_t v30 = vadd_f32(v30, v31);
          --v7;
        }

        while (v7);
      }

      uint64_t v34 = v19;
      *(float *)v27.i32 = (float)(int)v19;
      float32x2_t v33 = vsub_f32(vdiv_f32(v30, (float32x2_t)vdup_lane_s32(v27, 0)), v20);
      int v32 = 1;
    }

    else
    {
      uint64_t v28 = a1 + 392;
      uint64_t v34 = (int)v7;
      int v32 = 0;
      float32x2_t v33 = 0LL;
    }

    uint64_t v35 = a2;
    uint64_t v36 = *(void *)(a1 + 29376);
    int v37 = *(_DWORD *)(v5 + 1148);
    if (v36)
    {
      int v38 = *(_DWORD *)(v5 + 1148);
      BOOL v39 = (id *)(v36 + 240LL * v37);
      if (*v39 || *(void *)(v36 + 240LL * v37 + 8))
      {
        float32x2_t v171 = v33;
        [*v39 reset];
        [*(id *)(v36 + 240 * v38 + 8) reset];
        sbp_gvs_extractDistortionData( *(void **)(a1 + 28824),  v35,  (uint64_t)&v195,  *(void **)(a1 + 29088),  (uint64_t)v39,  *(float64x2_t *)(a1 + 304));
        float32x2_t v33 = v171;
        int v37 = *(_DWORD *)(v5 + 1148);
      }
    }

    uint64_t v40 = *(void *)(a1 + 29384);
    if (v40)
    {
      uint64_t v41 = v40 + 12LL * v37;
      uint64_t v42 = v193;
      *(_DWORD *)(v41 + 8) = v194;
      *(void *)uint64_t v41 = v42;
      int v37 = *(_DWORD *)(v5 + 1148);
    }

    a2 = v35;
    uint64_t v10 = v28;
    int v43 = *(_DWORD *)(v5 + 1156);
    int v44 = v37 + v43 + 1;
    uint64_t v19 = v34;
    uint64_t v6 = v168;
    do
      v44 -= v43;
    while (v44 >= v43);
    *(_DWORD *)(v5 + 1148) = v44;
    int v45 = *(_DWORD *)(v5 + 1152);
    CMTime v9 = (void *)(a1 + 128);
    if (v45 < v43) {
      *(_DWORD *)(v5 + 1152) = v45 + 1;
    }
  }

  else
  {
    int v32 = 0;
    float32x2_t v33 = 0LL;
  }

  if (*(_DWORD *)v6 == 3
    && (float32x2_t v172 = v33,
        Value = (const __CFDictionary *)CFDictionaryGetValue( a2,  kFigVideoStabilizationSampleBufferProcessorMetadata_InputFrameCropOffset),  float32x2_t v33 = v172,  Value))
  {
    CGPointMakeWithDictionaryRepresentation(Value, point);
    v47.i64[0] = (int)*v9;
    v47.i64[1] = (int)HIDWORD(*v9);
    float32x2_t v33 = vsub_f32(v172, vcvt_f32_f64(vmulq_f64((float64x2_t)point[0], vcvtq_f64_s64(v47))));
    *((void *)&v196 + 1) = 0LL;
  }

  else
  {
    float32x2_t v20 = vsub_f32(v20, *(float32x2_t *)((char *)&v196 + 8));
    if (!v32)
    {
      FigMotionInitializeQuaternion(&v188);
      goto LABEL_50;
    }
  }

  float v173 = v33.f32[0];
  float v48 = *((float *)&v195 + 1);
  LODWORD(point[0].x) = atanf(v33.f32[1] / *((float *)&v195 + 1));
  *((float *)&point[0].x + 1) = -atanf(v173 / v48);
  LODWORD(point[0].y) = 0;
  FigMotionQuaternionFromDeltaRotation((float *)point);
  double v188 = v49;
  double v189 = v50;
  double v190 = v51;
  double v191 = v52;
LABEL_50:
  if (*(_BYTE *)(v6 + 1092))
  {
    double v188 = FigMotionMultiplyQuaternions(&v188, (double *)(a1 + 28216));
    double v189 = v53;
    double v190 = v54;
    double v191 = v55;
  }

  if (*(float *)(v5 + 1440) <= 0.0)
  {
    float v73 = 0.0;
    float v66 = INFINITY;
    float v74 = NAN;
    float v64 = NAN;
  }

  else
  {
    uint64_t v56 = &v212[4 * v19];
    __int128 v57 = v56[1];
    *(_OWORD *)uint64_t v205 = *v56;
    *(_OWORD *)&v205[16] = v57;
    point[0].double x = FigMotionInverseOfQuaternion((uint64_t)v205);
    point[0].y = v58;
    point[1].double x = v59;
    point[1].y = v60;
    LODWORD(v204[0]) = GVSRotateVectorByQuaternion((float *)&v193, (uint64_t)point).u32[0];
    *(void *)((char *)v204 + 4) = __PAIR64__(v62, v61);
    GVSComputeRollPitchFromGravity((float *)v204);
    float v64 = v63;
    float v66 = v65;
    float v67 = *(void **)(a1 + 29696);
    if (v67)
    {
      double v68 = *((double *)&v199 + 1);
      id v69 = v67;
      *(float *)&double v70 = v64;
      *(float *)&double v71 = v66;
      [v69 updateRoll:v70 pitch:v71 atTime:v68];
      [v69 filteredRoll];
      float v73 = v72;
    }

    else
    {
      float v73 = (float)(fmodf(roundf(v63 / 1.5708) + -2.0, 4.0) + 2.0) * 1.5708;
    }

    float v74 = _computeAdjustedRollForHorizonCorrection(v64, v66, v73, *(float *)(v5 + 1440));
  }

  char v187 = 0;
  if (*(_DWORD *)v6 == 3)
  {
    FigCFDictionaryGetBooleanIfPresent(a2, kFigVideoStabilizationSampleBufferProcessorMetadata_LivePhotoKeyFrame, &v187);
    if (!v187) {
      FigCFDictionaryGetBooleanIfPresent(a2, @"IrisPhotoKeyFrame", &v187);
    }
  }

  __int128 v75 = *(void **)(a1 + 29520);
  if (v75)
  {
    int v76 = *(_DWORD *)(v5 + 1240);
    if (v76 == 11)
    {
      if (*(double *)&v198 <= 0.00435000006)
      {
        objc_msgSend(v75, "suspend", *(double *)&v198);
      }

      else if (*(double *)&v198 >= 0.00499999989)
      {
        objc_msgSend(v75, "resume", *(double *)&v198);
      }

      int v76 = *(_DWORD *)(v5 + 1240);
    }

    float v164 = v74;
    float v166 = v64;
    float32x2_t v77 = v20;
    float v78 = v66;
    float v79 = v73;
    float v80 = v21;
    float v81 = v26;
    double v82 = v16;
    if (v76 == 12)
    {
      GVSComputeMotionBlur(v10, 0LL, (uint64_t)&v195, (double *)(a1 + 328), point);
      double x = point[0].x;
    }

    else
    {
      double x = *(double *)&v200;
    }

    [*(id *)(a1 + 29520) updateBlurVector:x atTime:*((double *)&v199 + 1)];
    float32x2_t v174 = v84;
    [*(id *)(a1 + 29520) accumulationFilterPole];
    float v86 = v85;
    float v87 = (float)(v85 + 1.0) / (float)((float)(v86 + v86) * *((float *)&v195 + 1));
    v206[0] = -atanf(vmuls_lane_f32(v87, v174, 1));
    v206[1] = atanf(v87 * v174.f32[0]);
    v206[2] = 0.0;
    FigMotionQuaternionFromDeltaRotation(v206);
    *(void *)uint64_t v205 = v88;
    *(void *)&v205[8] = v89;
    *(void *)&v205[16] = v90;
    *(void *)&v205[24] = v91;
    FigMotionInitializeQuaternion(v204);
    if (*(_BYTE *)(a1 + 32))
    {
      __int128 v92 = v204[1];
      *(_OWORD *)(a1 + 29528) = v204[0];
      *(_OWORD *)(a1 + 29544) = v92;
    }

    point[0].double x = FigMotionMultiplyQuaternions((double *)(a1 + 29528), (double *)v205);
    point[0].y = v93;
    point[1].double x = v94;
    point[1].y = v95;
    FigMotionInterpolateQuaternionsByAngle((uint64_t)v204, &point[0].x, v86);
    point[0].double x = v96;
    point[0].y = v97;
    point[1].double x = v98;
    point[1].y = v99;
    CGPoint v100 = point[1];
    *(CGPoint *)(a1 + 29528) = point[0];
    *(CGPoint *)(a1 + 29544) = v100;
    *(CGFloat *)int v186 = v96;
    *(CGFloat *)&v186[1] = v97;
    *(CGFloat *)&v186[2] = v98;
    *(CGFloat *)&v186[3] = v99;
    v101 = &v212[4 * *(int *)(a1 + 176)];
    CGPoint v102 = (CGPoint)*((_OWORD *)v101 + 1);
    point[0] = *(CGPoint *)v101;
    point[1] = v102;
    *(float64x2_t *)&v205[8] = vnegq_f64(*(float64x2_t *)&point[0].y);
    *(CGFloat *)uint64_t v205 = point[0].x;
    *(double *)&v205[24] = -v102.y;
    double v182 = FigMotionMultiplyQuaternions(&point[0].x, (double *)v186);
    double v183 = v103;
    double v184 = v104;
    double v185 = v105;
    double v182 = FigMotionMultiplyQuaternions(&v182, (double *)v205);
    double v183 = v106;
    double v184 = v107;
    double v185 = v108;
    double v16 = v82;
    float v21 = v80;
    float v26 = v81;
    float v73 = v79;
    float v66 = v78;
    float32x2_t v20 = v77;
    float v74 = v164;
    float v64 = v166;
  }

  else
  {
    FigMotionInitializeQuaternion(v186);
    FigMotionInitializeQuaternion(&v182);
  }

  uint64_t v181 = 0LL;
  CFTypeRef v175 = a2;
  FigCFDictionaryGetInt64IfPresent(a2, kFigCaptureVideoStabilizationMetadata_CinematicFutureMetadataSerialNumber, &v181);
  [v8 openForNewData];
  *(float *)id v179 = v169;
  *(float *)&v179[1] = v21;
  *(float *)&v179[2] = v26;
  uint64_t v180 = 0LL;
  [v8 setZoomSmoothingMetadataInput:v179];
  v178[6] = v201;
  v178[7] = v202;
  v178[8] = v203;
  v178[2] = v197;
  v178[3] = v198;
  v178[4] = v199;
  v178[5] = v200;
  v178[0] = v195;
  v178[1] = v196;
  [v8 setCameraMetadataInput:v178];
  [v8 setDidHaveMotionDataInput:*(_BYTE *)(a1 + 10650) != 0];
  objc_msgSend(v8, "setAppliedCenterAdjustmentInput:", v188, v189, v190, v191);
  objc_msgSend(v8, "setMotionBlurAdjustmentInput:", v182, v183, v184, v185);
  [v8 setIsLivePhotoKeyFrameInput:v187 != 0];
  [v8 setSerialNumberInput:v181];
  objc_msgSend( v8,  "setNormalizedOutputShiftInput:",  COERCE_DOUBLE(vdiv_f32(vneg_f32(v20), (float32x2_t)vdup_lane_s32(*(int32x2_t *)((char *)&v195 + 4), 0))));
  [v8 setNormalizedInputShiftInput:v16];
  if ((v19 & 0x80000000) == 0)
  {
    uint64_t v111 = 0LL;
    do
    {
      __int128 v112 = (char *)[v8 originalQuaternionsInput] + v111 * 8;
      __int128 v113 = *(_OWORD *)&v212[v111 + 2];
      _OWORD *v112 = *(_OWORD *)&v212[v111];
      v112[1] = v113;
      point[0].double x = FigMotionMultiplyByInverseOfQuaternion(&v188, v186);
      point[0].y = v114;
      point[1].double x = v115;
      point[1].y = v116;
      uint64_t v117 = (double *)((char *)[v8 quaternionsInput] + v111 * 8);
      double v109 = FigMotionMultiplyQuaternions((double *)&v212[v111], &point[0].x);
      double *v117 = v109;
      v117[1] = v110;
      *((void *)v117 + 2) = v118;
      *((void *)v117 + 3) = v119;
      v111 += 4LL;
    }

    while (4LL * (v19 + 1) != v111);
  }

  if (*(float *)(v5 + 1440) > 0.0)
  {
    *(float *)&double v109 = v64;
    *(float *)&double v110 = v66;
    objc_msgSend(v8, "setRollPitchInput:", v109, v110);
    *(float *)&double v120 = v73;
    [v8 setRollHorizonTargetInput:v120];
    double v121 = (double *)[v8 quaternionsInput];
    objc_msgSend( v8,  "setHorizonQuaternionsInput:",  _adjustQuaternionForRollCorrection(&v121[4 * v19], v74 - v64, v122, v123, v124, v125));
  }

  double v126 = *((double *)&v199 + 1);
  double v177 = *((double *)&v199 + 1);
  if (*(_DWORD *)v6 == 2)
  {
    FigCFDictionaryGetDoubleIfPresent( v175,  kFigVideoStabilizationSampleBufferProcessorMetadata_CinematicFutureOutputFramePTS,  &v177);
    double v126 = v177;
  }

  [v8 setOutputFrameTimeInput:v126];
  if (v8)
  {
    [v8 getSmoothingAnalysisArrays];
  }

  else
  {
    __int128 v210 = 0u;
    __int128 v211 = 0u;
    __int128 v208 = 0u;
    __int128 v209 = 0u;
    memset(point, 0, sizeof(point));
  }

  [v8 outputFrameTimeInput];
  double v128 = v127 - *(double *)(v208 + 8LL * (int)v211);
  float v129 = v128;
  *(float *)&double v128 = v129;
  [v8 setFrameDurationInput:v128];
  if ((int)[v8 count] >= 2)
  {
    [v8 frameDurationPrevious];
    float v129 = (float)(*(float *)&v130 + v129) * 0.5;
  }

  if (((*(float *)&double v130 = v129, [v8 setFrameDurationPrevious:v130], *(_DWORD *)v5)
     || *(_BYTE *)(a1 + 360))
    && ((int v131 = *(_DWORD *)(*(void *)&point[1].y + 144LL * (int)v211 + 136), !v8)
      ? (int v132 = 0)
      : ([v8 cameraMetadataInput], int v132 = v176),
        v132 != v131))
  {
    BOOL v137 = 0LL;
  }

  else
  {
LABEL_94:
    double v133 = *(double *)&v199;
    id v134 = *(id *)(a1 + 29352);
    if ((int)[v134 count] <= 1)
    {
      int v136 = 1;
    }

    else
    {
      if (v134)
      {
        [v134 getSmoothingAnalysisArrays];
        uint64_t v135 = (int)v211;
      }

      else
      {
        uint64_t v135 = 0LL;
        __int128 v210 = 0u;
        __int128 v211 = 0u;
        __int128 v208 = 0u;
        __int128 v209 = 0u;
        memset(point, 0, sizeof(point));
      }

      [v134 outputFrameTimeInput];
      double v139 = v138 - *(double *)(v208 + 8 * v135);
      double v140 = 1.0;
      if (v139 > 0.0 && !*(_BYTE *)(v5 + 1224)) {
        double v140 = 0.0333333333 / v139;
      }
      *(double *)(a1 + 29304) = v140;
      double v141 = cos(0.000246 / v140);
      if (*(int *)(a1 + 176) < 1)
      {
        BOOL v147 = 1;
LABEL_109:
        int v136 = 1;
      }

      else
      {
        double v142 = v141;
        uint64_t v143 = 0LL;
        uint64_t v144 = 0LL;
        while (1)
        {
          CFTypeRef v145 = (char *)[v134 originalQuaternionsInput];
          double v146 = fabs( FigMotionMultiplyByInverseOfQuaternion( (double *)&v145[v143],  (uint64_t *)(*(void *)(*(void *)&point[0].x + 8 * v144) + 32 * v135)));
          BOOL v147 = v146 >= v142;
          if (v146 < v142) {
            break;
          }
          ++v144;
          v143 += 32LL;
        }

        int v136 = 0;
      }

      if (*(_BYTE *)(v5 + 1224))
      {
        *(_DWORD *)uint64_t v205 = 0;
        if (FigCFDictionaryGetFloat32IfPresent( v175,  kFigCaptureStreamMetadata_ISPMotionDataBiasErrorEstimate,  v205)) {
          BOOL v148 = fabsf(*(float *)v205) > 0.6;
        }
        else {
          BOOL v148 = 0;
        }
        if (v133 <= 0.0) {
          double v149 = 0.00006324555;
        }
        else {
          double v149 = 0.00006324555 / (0.023223 / v133);
        }
        double v150 = cos(v149);
        if (*(int *)(a1 + 176) >= 2)
        {
          double v152 = v150;
          uint64_t v153 = 1LL;
          uint64_t v154 = 32LL;
          do
          {
            double v155 = fabs( FigMotionMultiplyByInverseOfQuaternion( (double *)((char *)[v134 originalQuaternionsInput] + v154 - 32),  (uint64_t *)((char *)objc_msgSend(v134, "originalQuaternionsInput") + v154)));
            BOOL v151 = v155 >= v152;
            if (v155 < v152) {
              break;
            }
            ++v153;
            v154 += 32LL;
          }

          while (v153 < *(int *)(a1 + 176));
        }

        else
        {
          BOOL v151 = 1;
        }

        int v156 = v147 || v151;
        if (v148) {
          int v136 = 1;
        }
        else {
          int v136 = v156;
        }
      }
    }

    BOOL v137 = v136 != 0;
  }

  [v8 setIsPhysicalTripodInput:v137];
  [*(id *)(a1 + 29352) commitData];
  uint64_t v157 = v170;
LABEL_128:
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace(822152386LL, 15LL, v157, 0LL, 0LL);
  }

  return v157;
}

uint64_t sbp_ltm_checkPerVideoDisablement(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t v4 = (unsigned __int8 *)(a1 + 29592);
  *(_BYTE *)(a1 + 29625) = 0;
  if (theDict)
  {
    uint64_t v6 = (const void *)kFigCaptureStreamMetadata_LTMCurve;
    if (CFDictionaryContainsKey(theDict, kFigCaptureStreamMetadata_LTMCurve))
    {
      Boolean Value = CFDictionaryGetValue(theDict, v6);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(Value);
      v4[33] = [v8 intValue] == 2;
    }

    int v9 = v4[33];
    if (v4[33]) {
      int v9 = v4[32] ^ 1;
    }
  }

  else
  {
    int v9 = 0;
  }

  int v10 = v9 | v4[34];
  v4[34] = v10 != 0;
  uint64_t v11 = *(void *)(a1 + 29608);
  if (v11) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = v10 == 0;
  }
  if (!v12)
  {
    if (!v11 || !v10) {
      return 0LL;
    }
LABEL_13:
    sbp_ltm_deallocateLtcCorrectionTexture(a1);
    return 0LL;
  }

  uint64_t v14 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 29600) allocateLTCsCorrectionTex:*v4 forISPProcessing:*(_DWORD *)(a1 + 172) == 3]);
  double v15 = *(void **)(a1 + 29608);
  *(void *)(a1 + 29608) = v14;

  if (*(void *)(a1 + 29608))
  {
    if (!v4[34]) {
      return 0LL;
    }
    goto LABEL_13;
  }

  fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
  FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v2, v16, v17, v18, v19, v20, v21);
  return FigSignalErrorAt(4294954511LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

void _runVideoDeghostingDetection(void *a1, uint64_t a2)
{
  id v4 = a1;
  if (v4)
  {
    int v5 = *(_DWORD *)(a2 + 16);
    while (1)
    {
      uint64_t v6 = v5;
      if (!*(_BYTE *)(*(void *)(a2 + 8) + 24LL * v5 + 16)) {
        break;
      }
      int v7 = *(_DWORD *)(a2 + 28);
      v5 += v7 + 1;
      do
        v5 -= v7;
      while (v5 >= v7);
      if (*(_DWORD *)(a2 + 20) == v5) {
        goto LABEL_11;
      }
    }

    id v19 = v4;
    _updateVideoDeghostingGhostInformationLookAhead( (uint64_t)[v4 ghostInformationLookAheadPointer],  a2,  v5,  *(_DWORD *)(a2 + 20));
    uint64_t v8 = *(void *)(*(void *)a2 + 8 * v6);
    [v19 setSampleBuffer:v8];
    unsigned int v9 = [v19 detectAndTrack];
    if (v9)
    {
      unsigned int v17 = v9;
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v17,  v2,  v18,  (const char *)v19,  v20,  v21,  v22,  v23);
    }

    uint64_t v10 = 3 * v6;
    uint64_t v11 = *(void *)(a2 + 8) + 24 * v6;
    *(_BYTE *)(v11 + 16) = 1;
    *(void *)uint64_t v11 = v8;
    BOOL v12 = objc_alloc(&OBJC_CLASS___NSDictionary);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v19 detectionResult]);
    uint64_t v14 = -[NSDictionary initWithDictionary:](v12, "initWithDictionary:", v13);
    uint64_t v15 = *(void *)(a2 + 8) + 8 * v10;
    double v16 = *(void **)(v15 + 8);
    *(void *)(v15 + 8) = v14;

    id v4 = v19;
  }

LABEL_11:
}

uint64_t sbp_gvs_gaussianAverageGetStabilizedSampleBuffer(uint64_t a1, void *a2)
{
  uint64_t v6 = v2;
  uint64_t v8 = a1 + 27116;
  CFTypeRef cf = 0LL;
  unsigned int v9 = (const char *)(a1 + 29320);
  uint64_t v10 = *(void **)(a1 + 29352);
  if (v10)
  {
    [v10 getQuaternionSmoothingArrays];
    uint64_t v11 = *(void **)(a1 + 29352);
    if (v11)
    {
      [v11 getSmoothingAnalysisArrays];
      goto LABEL_6;
    }
  }

  else
  {
    __int128 v258 = 0u;
    int v259 = 0;
    uint64_t v256 = 0LL;
    uint64_t v257 = 0LL;
    __int128 v255 = 0u;
  }

  __int128 v254 = 0u;
  __int128 v253 = 0u;
  uint64_t v251 = 0LL;
  __int128 v252 = 0u;
LABEL_6:
  if (!a2)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v2,  v230,  (const char *)v231,  LODWORD(v232),  v234,  v236,  v238);
    BOOL v117 = 0;
    uint64_t StabilizedSampleBuffer = 4294954516LL;
    goto LABEL_255;
  }

  if (*(void *)a1) {
    (*(void (**)(void, void, void))a1)( *(void *)(a1 + 16),  0LL,  *(void *)(*(void *)(a1 + 29320) + 8LL * *(int *)(v8 + 2220)));
  }
  sbuf = *(opaqueCMSampleBuffer **)(*(void *)(a1 + 29320) + 8LL * *(int *)(v8 + 2220));
  int v239 = DWORD2(v254);
  int v242 = *(unsigned __int8 *)(v257 + v259);
  if (*(_BYTE *)(v8 + 989))
  {
    memcpy( *(void **)(a1 + 28112),  *(const void **)(*(void *)(a1 + 29360) + 8LL * *(int *)(v8 + 2276)),  8LL * *(int *)(a1 + 180));
    memcpy( (void *)(a1 + 28120),  *(const void **)(*(void *)(a1 + 29368) + 8LL * *(int *)(v8 + 2276)),  8LL * *(int *)(a1 + 176));
    *(void *)(a1 + 28176) = *(void *)(*((void *)&v255 + 1) + 8LL * v259);
    *(void *)(a1 + 28184) = *(void *)(v256 + 8LL * v259);
    uint64_t v12 = *(void *)(a1 + 29376);
    if (v12) {
      __copy_assignment_16_16_s0_s8_t16w224(a1 + 28848, v12 + 240LL * *(int *)(v8 + 2276));
    }
  }

  uint64_t v13 = *(void **)(a1 + 29352);
  if (!v13)
  {
    uint64_t v280 = 0LL;
    __int128 v278 = 0u;
    __int128 v279 = 0u;
    __int128 v276 = 0u;
    __int128 v277 = 0u;
    __int128 v275 = 0u;
    goto LABEL_17;
  }

  [v13 getQuaternionSmoothingArrays];
  uint64_t v14 = *(void **)(a1 + 29352);
  if (!v14)
  {
LABEL_17:
    __int128 v273 = 0u;
    __int128 v274 = 0u;
    __int128 v271 = 0u;
    __int128 v272 = 0u;
    __int128 v270 = 0u;
    goto LABEL_18;
  }

  [v14 getRollSmoothingArraysForBaseTransform:*(unsigned int *)(a1 + 176)];
  uint64_t v15 = *(void **)(a1 + 29352);
  if (v15)
  {
    [v15 getSmoothingAnalysisArrays];
    goto LABEL_19;
  }

LABEL_18:
  __int128 v268 = 0u;
  __int128 v269 = 0u;
  __int128 v266 = 0u;
  __int128 v267 = 0u;
  __int128 v264 = 0u;
  __int128 v265 = 0u;
LABEL_19:
  int v235 = v9;
  char v263 = 1;
  float v16 = *(float *)(v8 + 2292);
  float v17 = *(float *)(v8 + 2364);
  float v237 = (const char *)__PAIR64__(v279, DWORD1(v279));
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace(822152385LL, 25LL, 0LL, 0LL, 0LL);
  }
  if (*(_BYTE *)(v8 + 2640))
  {
    int v18 = *(void **)(a1 + 29352);
    if (v18)
    {
      [v18 getSmoothingAnalysisArrays];
      int v19 = llroundf((float)(v294 - DWORD2(v293) + 1) * 0.8);
      if (v19 <= 1) {
        uint64_t v20 = 1LL;
      }
      else {
        uint64_t v20 = v19;
      }
      int v21 = v20 - 1;
      double v22 = *(double *)(v291 + 8LL * SDWORD2(v293));
      if (v22 <= v22 + 1.01)
      {
        int v23 = (double *)(v291 + 8LL * SDWORD2(v293) + 8);
        uint64_t v24 = v20 - 1;
        int v25 = -1;
        while (v24)
        {
          double v26 = *v23++;
          ++v25;
          --v24;
          if (v26 > v22 + 1.01) {
            goto LABEL_32;
          }
        }
      }

      int v25 = v21;
LABEL_32:
      else {
        int v27 = v294 - DWORD2(v293);
      }
      uint64_t v28 = *((void *)&v290 + 1);
      uint64_t v29 = *(void **)(a1 + 29352);
      if (v29)
      {
        [v29 getZoomSmoothingArrays];
        if ((v27 & 0x80000000) == 0)
        {
LABEL_37:
          for (int i = 0; ; ++i)
          {
            int v31 = i + DWORD2(v305);
            float v32 = GVSComputeSmoothedDigitalZoomFactor((uint64_t)&v304, i, *(float *)(v8 + 2644));
            float v33 = *(float *)(v304 + 20LL * v31 + 4);
            if (v32 < v33) {
              GVSComputeSmoothRamp(v32, *(float *)(v304 + 20LL * v31 + 8), v33);
            }
            if (*(int *)(v8 + 2656) < 1)
            {
              *(float *)(v28 + 144LL * v31 + 20) = v32;
              if (v27 == i) {
                goto LABEL_54;
              }
            }

            else
            {
              uint64_t v34 = v304 + 20LL * v31;
              LODWORD(v3) = *(_DWORD *)v34;
              *(float *)(v34 + 12) = *(float *)&v3 + logf(v32 / *(float *)(v34 + 4));
              if (v27 == i)
              {
                int v35 = 0;
                do
                {
                  int v36 = v35 + DWORD2(v305);
                  float v37 = GVSComputeDilatedTotalZoomFactor((uint64_t)&v304, *(_DWORD *)(v8 + 2656), v35);
                  *(float *)(v304 + 20LL * v36 + 16) = v37;
                  ++v35;
                }

                while (v27 + 1 != v35);
                goto LABEL_49;
              }
            }
          }
        }
      }

      else
      {
        __int128 v306 = 0u;
        __int128 v305 = 0u;
        __int128 v304 = 0u;
        if ((v27 & 0x80000000) == 0) {
          goto LABEL_37;
        }
      }

      if (*(int *)(v8 + 2656) >= 1)
      {
LABEL_49:
        if ((v25 & 0x80000000) == 0)
        {
          int v38 = 0;
          do
          {
            int v39 = v38 + DWORD2(v305);
            float v40 = GVSComputeSmoothedDilatedDigitalZoomFactor((uint64_t)&v304, *(_DWORD *)(v8 + 2656), v38);
            uint64_t v41 = v304 + 20LL * v39;
            *(float *)(v28 + 144LL * v39 + 20) = v40;
            ++v38;
          }

          while (v25 + 1 != v38);
        }
      }

  int v25 = CMSampleBufferCreateForImageBuffer(v23, a1, 1u, 0LL, 0LL, v11, a4, a5);
  if ((_DWORD)v25)
  {
    int v27 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v27,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  8750LL,  v25);
  }

  id WeakRetained = objc_loadWeakRetained((id *)v16 + 21);

  if (WeakRetained)
  {
    uint64_t v15 = objc_loadWeakRetained((id *)v16 + 21);
    [v15 didCompleteRenderingOfBuffer:v10 withStatus:a2];
  }

  else
  {
    dispatch_semaphore_signal(*((dispatch_semaphore_t *)v16 + 11));
  }
}

LABEL_54:
      uint64_t v6 = v2;
    }

    else
    {
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v2,  v230,  (const char *)v231,  LODWORD(v232),  v9,  (const char *)__PAIR64__(v279, DWORD1(v279)),  DWORD2(v254));
      int v119 = FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
      if (v119)
      {
        int v120 = v119;
        uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v229) = v120;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  3925LL,  v229);
        goto LABEL_228;
      }
    }
  }

  int v42 = HIDWORD(v268);
  int v43 = v269;
  if (SHIDWORD(v268) > (int)v269)
  {
LABEL_59:
    if (SDWORD1(v269) >= 2)
    {
      if (SHIDWORD(v268) <= DWORD2(v268) - DWORD2(v269)) {
        int v42 = DWORD2(v268) - DWORD2(v269);
      }
      uint64_t v47 = v42;
      float v48 = (uint64_t *)(*((void *)&v264 + 1) + 32LL * v42);
      uint64_t v49 = v43;
      uint64_t v50 = 32LL * v42 + 32;
      uint64_t v51 = v47 - 1;
      uint64_t v3 = 0x3FEFFFFE69E25117LL;
      while (++v51 < v49)
      {
        uint64_t v52 = v50 + 32;
        double v53 = (uint64_t *)(*((void *)&v264 + 1) + v50);
        double v54 = FigMotionMultiplyByInverseOfQuaternion((double *)(*((void *)&v264 + 1) + v50), v48);
        uint64_t v50 = v52;
        float v48 = v53;
        if (fabs(v54) < 0.999999244)
        {
          goto LABEL_69;
        }
      }
    }

    *(_DWORD *)(v8 + 2292) = 1050253722;
    int v55 = *(_DWORD *)(v8 + 2000);
    if (v55 < 255) {
      int v56 = v55 + 1;
    }
    else {
      int v56 = 255;
    }
    *(_DWORD *)(v8 + 2000) = v56;
    float v17 = 0.3;
  }

  else
  {
    int v44 = v269 - HIDWORD(v268) + 1;
    int v45 = (unsigned __int8 *)(*((void *)&v266 + 1) + SHIDWORD(v268));
    while (*v45++)
    {
      if (!--v44) {
        goto LABEL_59;
      }
    }

LABEL_69:
    *(_DWORD *)(v8 + 2000) = 0;
  }

  float v248 = *(float *)(v8 + 2572);
  float v250 = v17;
  if (v248 > 0.0)
  {
    if (*(void *)(a1 + 29696))
    {
      __int128 v57 = *(void **)(a1 + 29704);
      if (v57)
      {
        id v58 = v57;
        [v58 reset];
        uint64_t v59 = (int)v274;
        uint64_t v60 = SHIDWORD(v273);
        if ((int)v274 >= SHIDWORD(v273))
        {
          float k = *(float *)(*((void *)&v271 + 1) + 4LL * (int)v274);
          double v62 = *(double *)(*((void *)&v272 + 1) + 8LL * (int)v274);
          LODWORD(v3) = 1050253722;
          LODWORD(v5) = -1060565029;
          HIDWORD(v63) = -1073143301;
          LODWORD(v4) = 1086918619;
          do
          {
            for (float j = *(float *)(*((void *)&v271 + 1) + 4 * v59); ; float j = j + -6.2832)
            {
              float v65 = k + 3.14159265;
              if (j <= v65) {
                break;
              }
            }

            float v66 = v16;
            float v67 = k + -3.14159265;
            for (float k = j; k < v67; float k = k + 6.2832)
              ;
            double v68 = *(double *)(*((void *)&v272 + 1) + 8 * v59);
            double v69 = v62 - v68;
            *(float *)&double v69 = v69;
            *(float *)&double v63 = 0.3 / (float)(*(float *)&v69 + 0.3);
            *(float *)&double v69 = k;
            [v58 updateValue:v69 withPole:v63];
            float v71 = v70;
            uint64_t v72 = v271;
            if (*(float *)(v271 + 8 * v59 + 4) >= 1.0472)
            {
              [v58 reset];
              uint64_t v72 = v271;
            }

            float v73 = (float *)(v72 + 8 * v59);
            float v74 = *v73;
            float v75 = _computeAdjustedRollForHorizonCorrection(*v73, v73[1], v71, v248);
            *(double *)&__int128 v80 = _adjustQuaternionForRollCorrection( (double *)(*((void *)&v270 + 1) + 32 * v59),  v75 - v74,  v76,  v77,  v78,  v79);
            *(_OWORD *)(v270 + 16 * v59) = v80;
            double v62 = v68;
            BOOL v107 = v59-- <= v60;
            float v16 = v66;
          }

          while (!v107);
        }

        float v17 = v250;
      }
    }
  }

  if (!*(void *)(a1 + 29520))
  {
    if ((uint64_t)v269 <= 0)
    {
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v229) = 0;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v229,  v6,  v230,  (const char *)v231,  LODWORD(v232),  v235,  v237,  v239);
    }

    else
    {
      int v81 = v269;
      uint64_t v82 = SHIDWORD(v268);
      int v83 = v269 - 4;
      if (DWORD2(v268) == HIDWORD(v268)) {
        LODWORD(v84) = HIDWORD(v268);
      }
      else {
        LODWORD(v84) = v83;
      }
      if ((int)v84 <= (int)v269)
      {
        int v85 = v84 - 4;
        uint64_t v86 = *((void *)&v265 + 1);
        uint64_t v87 = v268;
        uint64_t v84 = (int)v84;
        int v88 = v269 + 1;
        uint64_t v89 = *((void *)&v265 + 1) + 84LL;
        do
        {
          if (v82 <= v85) {
            uint64_t v90 = v85;
          }
          else {
            uint64_t v90 = v82;
          }
          int v91 = v84 - 4;
          else {
            int v92 = v84 + 4;
          }
          float v93 = 0.0;
          float v94 = 0.0;
          BOOL v95 = __OFSUB__(v92, v91);
          int v96 = v92 - v91;
          if (v96 < 0 == v95)
          {
            uint64_t v97 = v90 - 1;
            CGFloat v98 = (float *)(v89 + 144 * v90);
            do
            {
              float v93 = v93 + *(v98 - 1);
              float v99 = *v98;
              v98 += 36;
              float v94 = v94 + v99;
              ++v97;
            }

            while (v97 < v92);
          }

          float v100 = (float)(v96 + 1);
          *(float *)(v87 + 4 * v84) = sqrtf( (float)((float)(*(float *)(v86 + 144 * v84 + 84) - (float)(v94 / v100))
                                              * (float)(*(float *)(v86 + 144 * v84 + 84) - (float)(v94 / v100)))
          ++v84;
          ++v85;
        }

        while (v88 != (_DWORD)v84);
      }
    }
  }

  if (SDWORD1(v269) < 1) {
    goto LABEL_147;
  }
  double v101 = *(double *)(v266 + 8LL * SDWORD2(v268)) + 0.75;
  else {
    int v102 = v269 - DWORD2(v268);
  }
  if (*(double *)(v266 + 8 * (SDWORD2(v268) + (uint64_t)v102)) <= v101)
  {
    int v103 = v102;
    double v104 = (double *)(v266 + 8 * (v102 + (uint64_t)SDWORD2(v268)) + 8);
    while ((_DWORD)v269 - DWORD2(v268) != v103)
    {
      double v105 = *v104++;
      ++v103;
      if (v105 > v101)
      {
        int v102 = v103 - 1;
        goto LABEL_120;
      }
    }

    int v102 = v269 - DWORD2(v268);
  }

LABEL_120:
  LODWORD(v3) = *(_DWORD *)(v8 + 2292);
  float v106 = 1.0;
  if (*(_BYTE *)(a1 + 320)) {
    BOOL v107 = (int)v269 <= SHIDWORD(v268);
  }
  else {
    BOOL v107 = 1;
  }
  if (v107)
  {
LABEL_126:
    float v110 = (float)(1920.0 / (float)*(int *)(a1 + 144)) * v106;
    if ((v102 & 0x80000000) == 0) {
      goto LABEL_127;
    }
    goto LABEL_144;
  }

  double v108 = *(double *)(v266 + 8LL * (int)v269) - *(double *)(v266 + 8LL * SHIDWORD(v268));
  if (v108 > 0.0)
  {
    float v109 = v108;
    float v106 = fminf(fmaxf((float)((float)((float)(v269 - HIDWORD(v268)) / v109) * 0.042088) + -1.5505, 1.0), 3.5);
    goto LABEL_126;
  }

  fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
  LODWORD(v229) = 0;
  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v229,  v6,  v230,  (const char *)v231,  LODWORD(v232),  v235,  v237,  v239);
  float v110 = 1.0;
  if ((v102 & 0x80000000) == 0)
  {
LABEL_127:
    uint64_t v111 = 0LL;
    __int128 v112 = (_BYTE *)(*((void *)&v265 + 1) + 144LL * SDWORD2(v268) + 12);
    float v113 = 0.0;
    float v114 = *(float *)&v3;
    do
    {
      float v115 = (float)(*(float *)(v268 + 4LL * SDWORD2(v268) + 4 * v111) * v110) - *(float *)(v8 + 2376);
      if (v115 <= 0.0
        || (!*(_BYTE *)(v8 + 988) ? (float v116 = 2.0) : *v112 ? (float v116 = 0.5) : (float v116 = 2.0),
            *(float *)&uint64_t v3 = fmaxf(fminf(*(float *)(v8 + 2360), 10.0) - (float)(v116 * v115), 1.75),
            *(float *)&v3 >= v114))
      {
        *(float *)&uint64_t v3 = v114;
      }

      else
      {
        float v113 = fmaxf(v113, vabds_f32(*(float *)(v8 + 2292), *(float *)&v3) / (float)(v111 + 1));
      }

      v112 += 144;
      ++v111;
      float v114 = *(float *)&v3;
    }

    while (v102 + 1 != (_DWORD)v111);
    goto LABEL_145;
  }

LABEL_144:
  float v113 = 0.0;
LABEL_145:
  if (HIDWORD(v237) != (_DWORD)v237) {
    goto LABEL_148;
  }
  *(float *)(v8 + 2292) = fmaxf(v17, fminf(*(float *)(v8 + 2292), *(float *)&v3));
LABEL_147:
  float v113 = 0.0;
LABEL_148:
  int v122 = llroundf((float)(v269 - DWORD2(v268) + 1) * 0.8);
  if (v122 <= 1) {
    uint64_t v123 = 1LL;
  }
  else {
    uint64_t v123 = v122;
  }
  unsigned int v124 = v123 - 1;
  double v125 = *(double *)(v266 + 8LL * SDWORD2(v268));
  if (v125 <= v125 + 1.01)
  {
    double v126 = (double *)(v266 + 8LL * SDWORD2(v268) + 8);
    uint64_t v127 = v123 - 1;
    int v128 = -1;
    while (v127)
    {
      double v129 = *v126++;
      ++v128;
      --v127;
      if (v129 > v125 + 1.01)
      {
        if ((v128 & 0x80000000) == 0) {
          goto LABEL_156;
        }
LABEL_194:
        float v133 = 1.0;
        goto LABEL_195;
      }
    }

    int v128 = v124;
    if ((v124 & 0x80000000) != 0) {
      goto LABEL_194;
    }
LABEL_156:
    unsigned int v124 = v128;
  }

  unsigned int v246 = 0;
  unsigned int v130 = 0;
  char v131 = 0;
  float v232 = 0.035;
  uint64_t v231 = 0x3DCCCCCD3ECCCCCDLL;
  float v132 = v16;
  float v133 = 1.0;
  char v134 = 1;
  unsigned int v233 = v124;
LABEL_158:
  char v240 = v134;
  char v244 = v131;
  float v247 = v132;
  float v249 = v113;
  float v135 = -v113;
  if (v130 <= v124) {
    unsigned int v136 = v124;
  }
  else {
    unsigned int v136 = v130;
  }
  unsigned int v137 = v136 + 1;
  do
  {
    LOBYTE(v281[0]) = 1;
    int v138 = v130 + 1;
    float v139 = fmaxf(v250, fminf(*(float *)(v8 + 2360), *(float *)(v8 + 2292) + (float)(v135 * (float)(int)(v130 + 1))));
    int v140 = sbp_gvs_gaussianAverageComputeCorrection(a1, v130, 1, v281, v139);
    if (v140)
    {
      int v120 = v140;
      uint64_t v223 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      uint64_t v6 = v2;
      LODWORD(v229) = v120;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v223,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  4064LL,  v229);
      goto LABEL_228;
    }

    if (!LOBYTE(v281[0]))
    {
      float v245 = v16;
      if (v139 < v250)
      {
        fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v229) = 0;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v229,  v2,  v230,  (const char *)v231,  LODWORD(v232),  v235,  v237,  v239);
        int v160 = FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
        if (v160)
        {
          int v120 = v160;
          uint64_t v6 = v2;
LABEL_279:
          uint64_t v224 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          LODWORD(v229) = v120;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v224,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  4086LL,  v229);
          goto LABEL_228;
        }
      }

      else
      {
        *(float *)&uint64_t v4 = v250;
        if ((float)(v139 - v250) > v156)
        {
          while (1)
          {
            int v157 = sbp_gvs_gaussianAverageComputeCorrection(a1, v130, 1, &v283, (float)(*(float *)&v4 + v139) * 0.5);
            if (v157) {
              break;
            }
            if ((_BYTE)v283) {
              *(float *)&uint64_t v4 = (float)(*(float *)&v4 + v139) * 0.5;
            }
            else {
              float v139 = (float)(*(float *)&v4 + v139) * 0.5;
            }
          }

          int v120 = v157;
          fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          uint64_t v6 = v2;
          LODWORD(v229) = v120;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v229,  v2,  v230,  (const char *)v231,  LODWORD(v232),  v235,  v237,  v239);
          goto LABEL_279;
        }
      }

LABEL_175:
      float v158 = *(float *)(v8 + 2292);
      float v113 = fmaxf(v249, vabds_f32(v158, *(float *)&v4) / (float)v138);
      float v132 = fminf(v247, *(float *)&v4);
      unsigned int v124 = v233;
      float v16 = v245;
      if (v130 >= v233 || (char v134 = 0, ++v130, v131 = 1, v159 = v246 >= 4, ++v246, v159))
      {
        char v263 = 0;
        uint64_t v6 = v2;
LABEL_183:
        float v161 = fmaxf(v250, fminf(*(float *)(v8 + 2360), v158 - v113));
        float v162 = fminf(v161, fmaxf(v132, 1.75));
        if (HIDWORD(v237) == (_DWORD)v237) {
          float v16 = v162;
        }
        else {
          float v16 = v161;
        }
        int v163 = sbp_gvs_gaussianAverageComputeCorrection(a1, 0, 0, &v263, v16);
        if (v163)
        {
          int v120 = v163;
          uint64_t v227 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          LODWORD(v229) = v120;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v227,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  4158LL,  v229);
          goto LABEL_228;
        }

        if (!v263)
        {
          uint64_t v164 = *(void *)(a1 + 29376);
          if (!v164) {
            goto LABEL_283;
          }
          [*(id *)(v164 + 240 * *(int *)(v8 + 2276)) reset];
          [*(id *)(*(void *)(a1 + 29376) + 240 * *(int *)(v8 + 2276) + 8) reset];
          int v165 = sbp_gvs_gaussianAverageComputeCorrection(a1, 0, 0, &v263, v16);
          if (v165)
          {
            int v120 = v165;
            uint64_t v228 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
            LODWORD(v229) = v120;
            FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v228,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  4167LL,  v229);
            goto LABEL_228;
          }

          if (!v263)
          {
LABEL_283:
            fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
            LODWORD(v229) = 0;
            FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v229,  v6,  v230,  (const char *)v231,  LODWORD(v232),  v235,  v237,  v239);
          }
        }

        float v166 = fmaxf(*(float *)(v8 + 2364), v16);
        goto LABEL_227;
      }

      goto LABEL_158;
    }

    if (!v130)
    {
      float v133 = *(float *)(a1 + 196);
      __int128 v141 = *(_OWORD *)(a1 + 28080);
      __int128 v261 = *(_OWORD *)(a1 + 28064);
      __int128 v262 = v141;
      uint64_t v3 = *(void *)(a1 + 28192);
      uint64_t v5 = *(void *)(a1 + 28200);
      __int128 v142 = *(_OWORD *)(a1 + 27328);
      __int128 v301 = *(_OWORD *)(a1 + 27312);
      __int128 v302 = v142;
      v303[0] = *(_OWORD *)(a1 + 27344);
      *(_OWORD *)((char *)v303 + 12) = *(_OWORD *)(a1 + 27356);
      __int128 v143 = *(_OWORD *)(a1 + 27264);
      __int128 v297 = *(_OWORD *)(a1 + 27248);
      __int128 v298 = v143;
      __int128 v144 = *(_OWORD *)(a1 + 27296);
      __int128 v299 = *(_OWORD *)(a1 + 27280);
      __int128 v300 = v144;
      __int128 v145 = *(_OWORD *)(a1 + 27200);
      __int128 v293 = *(_OWORD *)(a1 + 27184);
      __int128 v294 = v145;
      __int128 v146 = *(_OWORD *)(a1 + 27232);
      __int128 v295 = *(_OWORD *)(a1 + 27216);
      __int128 v296 = v146;
      __int128 v147 = *(_OWORD *)(a1 + 27136);
      __int128 v289 = *(_OWORD *)(a1 + 27120);
      __int128 v290 = v147;
      __int128 v148 = *(_OWORD *)(a1 + 27168);
      __int128 v291 = *(_OWORD *)(a1 + 27152);
      __int128 v292 = v148;
      __int128 v149 = *(_OWORD *)(a1 + 28016);
      __int128 v314 = *(_OWORD *)(a1 + 28000);
      __int128 v315 = v149;
      __int128 v150 = *(_OWORD *)(a1 + 28048);
      __int128 v316 = *(_OWORD *)(a1 + 28032);
      __int128 v317 = v150;
      __int128 v151 = *(_OWORD *)(a1 + 27952);
      __int128 v310 = *(_OWORD *)(a1 + 27936);
      __int128 v311 = v151;
      __int128 v152 = *(_OWORD *)(a1 + 27984);
      __int128 v312 = *(_OWORD *)(a1 + 27968);
      __int128 v313 = v152;
      __int128 v153 = *(_OWORD *)(a1 + 27888);
      __int128 v306 = *(_OWORD *)(a1 + 27872);
      __int128 v307 = v153;
      __int128 v154 = *(_OWORD *)(a1 + 27920);
      __int128 v308 = *(_OWORD *)(a1 + 27904);
      __int128 v309 = v154;
      __int128 v155 = *(_OWORD *)(a1 + 27856);
      float v16 = v139;
      __int128 v304 = *(_OWORD *)(a1 + 27840);
      __int128 v305 = v155;
    }

    ++v130;
  }

  while (v137 != v138);
  char v263 = v240;
  if ((v244 & 1) != 0)
  {
    float v158 = *(float *)(v8 + 2292);
    uint64_t v6 = v2;
    float v113 = v249;
    float v132 = v247;
    goto LABEL_183;
  }

  int v128 = v233;
  uint64_t v6 = v2;
  uint64_t v4 = v3;
  float v113 = v249;
LABEL_195:
  float v166 = v16;
  if (v113 == 0.0)
  {
    signed int v167 = 10 * llroundf((float)((float)*(int *)(v8 + 2300) / *(float *)(v8 + 2296)) / 30.0);
    if (v167 >= v128) {
      int v168 = v128;
    }
    else {
      int v168 = v167;
    }
    float v169 = *(void **)(a1 + 29352);
    if (v169)
    {
      [v169 getSmoothingAnalysisArrays];
      int v170 = DWORD2(v287);
      if (SDWORD2(v287) < (int)v288)
      {
        float v171 = *(double *)(v285 + 8LL * (DWORD2(v287) + 1)) - *(double *)(v285 + 8LL * SDWORD2(v287));
        goto LABEL_204;
      }
    }

    else
    {
      int v170 = 0;
      __int128 v287 = 0u;
      __int128 v288 = 0u;
      __int128 v285 = 0u;
      __int128 v286 = 0u;
      __int128 v283 = 0u;
      __int128 v284 = 0u;
    }

    float v171 = 0.03337;
LABEL_204:
    float v172 = fmaxf(*(float *)(v8 + 2364), v16);
    if (*(_DWORD *)v8 == 3)
    {
      float v173 = 1.81;
      if ((v170 & 0x80000000) == 0)
      {
        uint64_t v174 = v170;
        double v175 = *(double *)(*((void *)&v284 + 1) + 144LL * v170 + 72) + -0.5;
        uint64_t v176 = (v170 + 1);
        double v177 = (_BYTE *)(v286 + v174);
        uint64_t v178 = (double *)(*((void *)&v284 + 1) + 144LL * (int)v174 + 72);
        while (*v178 >= v175)
        {
          if (*v177)
          {
            float v173 = 28.4;
            break;
          }

          --v177;
          v178 -= 18;
          if (!--v176) {
            break;
          }
        }
      }

      float v166 = fminf(*(float *)(v8 + 2360), fmaxf(v172 * powf(v173, v171), v172 + 0.05));
    }

    else
    {
      float v166 = fminf(*(float *)(v8 + 2360), v172 + (float)(v171 * 6.0));
      if (v166 <= v16)
      {
LABEL_265:
        if (v168 >= 1 && v166 > v16)
        {
          float v220 = v166 * 1.1;
          int v221 = 1;
          do
          {
            LOBYTE(v281[0]) = 1;
            int v222 = sbp_gvs_gaussianAverageComputeCorrection(a1, v221, 1, v281, v220);
            if (v222)
            {
              fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
              LODWORD(v229) = v222;
              FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v229,  v2,  v230,  (const char *)v231,  LODWORD(v232),  v235,  v237,  v239);
            }

            if (!(v222 | LOBYTE(v281[0]))) {
              float v166 = v16;
            }
            if (v168 == v221) {
              break;
            }
            if (v222) {
              break;
            }
            ++v221;
          }

          while (LOBYTE(v281[0]));
        }
      }

      else
      {
        unsigned int v179 = 0;
        double v180 = 10.0 / v16 * (v171 * 30.0) * 0.000436332313;
        while (1)
        {
          char v282 = 0;
          int v181 = sbp_gvs_gaussianAverageComputeCorrection(a1, 0, 1, &v282, v166);
          if (v181) {
            break;
          }
          __int128 v182 = *(_OWORD *)(a1 + 28080);
          v281[0] = *(_OWORD *)(a1 + 28064);
          v281[1] = v182;
          double v183 = FigMotionMultiplyByInverseOfQuaternion((double *)&v261, (uint64_t *)v281);
          double v184 = acos(v183);
          if (fabs(v184 + v184) <= v180 && v282 != 0) {
            goto LABEL_265;
          }
          if (v179 > 3 || (float)(v166 - v16) < 0.01)
          {
            float v166 = v16;
            goto LABEL_265;
          }

          float v166 = (float)(v16 + v166) * 0.5;
          ++v179;
          if (v166 <= v16) {
            goto LABEL_265;
          }
        }

        int v225 = v181;
        fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v229) = v225;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v229,  v6,  v230,  (const char *)v231,  LODWORD(v232),  v235,  v237,  v239);
      }
    }

    uint64_t v6 = v2;
  }

  *(float *)(a1 + 196) = v133;
  __int128 v186 = v262;
  *(_OWORD *)(a1 + 28064) = v261;
  *(_OWORD *)(a1 + 28080) = v186;
  *(void *)(a1 + 28192) = v4;
  *(void *)(a1 + 28200) = v5;
  __int128 v187 = v302;
  *(_OWORD *)(a1 + 27312) = v301;
  *(_OWORD *)(a1 + 27328) = v187;
  *(_OWORD *)(a1 + 27344) = v303[0];
  __int128 v188 = v298;
  *(_OWORD *)(a1 + 27248) = v297;
  *(_OWORD *)(a1 + 27264) = v188;
  __int128 v189 = v300;
  *(_OWORD *)(a1 + 27280) = v299;
  *(_OWORD *)(a1 + 27296) = v189;
  __int128 v190 = v294;
  *(_OWORD *)(a1 + 27184) = v293;
  *(_OWORD *)(a1 + 27200) = v190;
  __int128 v191 = v296;
  *(_OWORD *)(a1 + 27216) = v295;
  *(_OWORD *)(a1 + 27232) = v191;
  __int128 v192 = v290;
  *(_OWORD *)(a1 + 27120) = v289;
  *(_OWORD *)(a1 + 27136) = v192;
  __int128 v193 = v292;
  *(_OWORD *)(a1 + 27152) = v291;
  *(_OWORD *)(a1 + 27168) = v193;
  *(_OWORD *)(a1 + 27356) = *(_OWORD *)((char *)v303 + 12);
  __int128 v194 = v315;
  *(_OWORD *)(a1 + 28000) = v314;
  *(_OWORD *)(a1 + 28016) = v194;
  __int128 v195 = v317;
  *(_OWORD *)(a1 + 28032) = v316;
  *(_OWORD *)(a1 + 28048) = v195;
  __int128 v196 = v311;
  *(_OWORD *)(a1 + 27936) = v310;
  *(_OWORD *)(a1 + 27952) = v196;
  __int128 v197 = v313;
  *(_OWORD *)(a1 + 27968) = v312;
  *(_OWORD *)(a1 + 27984) = v197;
  __int128 v198 = v307;
  *(_OWORD *)(a1 + 27872) = v306;
  *(_OWORD *)(a1 + 27888) = v198;
  __int128 v199 = v309;
  *(_OWORD *)(a1 + 27904) = v308;
  *(_OWORD *)(a1 + 27920) = v199;
  __int128 v200 = v305;
  *(_OWORD *)(a1 + 27840) = v304;
  *(_OWORD *)(a1 + 27856) = v200;
LABEL_227:
  int v120 = 0;
  *(float *)(v8 + 2292) = v166;
  *(float *)(v8 + 2368) = v16;
LABEL_228:
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace(822152386LL, 25LL, v120, 0LL, 0LL);
  }
  if (v120)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v229) = v120;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v229,  v6,  v230,  (const char *)v231,  LODWORD(v232),  v235,  v237,  v239);
  }

  if (*(_DWORD *)v8 == 2 && *(void *)(*((void *)&v253 + 1) + 8LL * SDWORD2(v254)) != *(void *)(a1 + 29720))
  {
    uint64_t v202 = *((void *)&v252 + 1) + 144LL * v239;
    *(_DWORD *)(v202 + 20) = 1065353216;
    uint64_t v203 = v202 + 20;
    uint64_t MetadataDictionary = _getMetadataDictionary(sbuf);
    if (MetadataDictionary) {
      FigCFDictionaryGetFloatIfPresent( MetadataDictionary,  kFigMotionAttachmentsSampleBufferProcessorMetadata_VideoStabilizationDigitalZoomFactor,  v203);
    }
    char v201 = 1;
  }

  else
  {
    char v201 = 0;
  }

  uint64_t v205 = *((void *)&v252 + 1) + 144LL * v239;
  if (!v242 || v120)
  {
    *(_BYTE *)(a1 + 202) = 1;
LABEL_245:
    double v206 = (_OWORD *)(*(void *)(v251 + 8LL * (*(_DWORD *)(a1 + 176) / 2)) + 32LL * SDWORD2(v254));
    __int128 v207 = v206[1];
    *(_OWORD *)(a1 + 28064) = *v206;
    *(_OWORD *)(a1 + 28080) = v207;
    goto LABEL_246;
  }

  if (*(_BYTE *)(a1 + 84)) {
    char v201 = 1;
  }
  *(_BYTE *)(a1 + 202) = v201;
  if ((v201 & 1) != 0) {
    goto LABEL_245;
  }
LABEL_246:
  __int128 v208 = *(void **)(a1 + 30008);
  unsigned int v9 = v235;
  if (v208)
  {
    id v209 = v208;
    __int128 v210 = v209;
    if (*(_BYTE *)(a1 + 25)) {
      _runVideoDeghostingDetection(v209, (uint64_t)v235);
    }
    _updateVideoDeghostingGhostInformationLookAhead( (uint64_t)[v210 ghostInformationLookAheadPointer],  (uint64_t)v235,  *(_DWORD *)(v8 + 2220),  *(_DWORD *)(v8 + 2224));
    [v210 setRepairInputSampleBuffer:sbuf];
    [v210 setRepairInputDetectionResult:*(void *)(*(void *)(a1 + 29328) + 24 * *(int *)(v8 + 2220) + 8)];
    unsigned int v211 = [v210 repair];
    if (v211)
    {
      unsigned int v226 = v211;
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v229) = v226;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v229,  v6,  v230,  (const char *)v231,  LODWORD(v232),  v235,  v237,  v239);
    }
  }

  uint64_t StabilizedSampleBuffer = sbp_gvs_createStabilizedSampleBuffer(a1, sbuf, v205, (const char *)&cf);
  if ((_DWORD)StabilizedSampleBuffer)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v229) = StabilizedSampleBuffer;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v229,  v6,  v230,  (const char *)v231,  LODWORD(v232),  v235,  v237,  v239);
    CFTypeRef v212 = cf;
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef v212 = 0LL;
    }
  }

  else
  {
    CFTypeRef v212 = cf;
  }

  BOOL v117 = v242 != 0;
  *a2 = v212;
LABEL_255:
  uint64_t v213 = *(int *)(v8 + 2220);
  double v214 = *(const void **)(*(void *)(a1 + 29320) + 8 * v213);
  if (v214)
  {
    CFRelease(v214);
    uint64_t v213 = *(int *)(v8 + 2220);
    *(void *)(*(void *)v9 + 8 * v213) = 0LL;
  }

  int v215 = *(_DWORD *)(v8 + 2232);
  int v216 = v213 + v215 + 1;
  do
    v216 -= v215;
  while (v216 >= v215);
  *(_DWORD *)(v8 + 2220) = v216;
  --*(_DWORD *)(v8 + 2228);
  if (*(_BYTE *)(v8 + 989))
  {
    int v217 = *(_DWORD *)(v8 + 2288);
    int v218 = *(_DWORD *)(v8 + 2276) + v217 + 1;
    do
      v218 -= v217;
    while (v218 >= v217);
    *(_DWORD *)(v8 + 2276) = v218;
    --*(_DWORD *)(v8 + 2284);
  }

  **((_DWORD **)&v258 + 1) = 0;
  [*(id *)(a1 + 29352) incrementCenter];
  *(_BYTE *)(a1 + 10651) = v117;
  return StabilizedSampleBuffer;
}

  return v13;
}

uint64_t sbp_gvs_computeBaseSphereLensMovements(uint64_t result, int a2, void *a3, void *a4)
{
  if ((_DWORD)result == 1)
  {
    *a4 = *a3;
  }

  else if ((int)result >= 1)
  {
    uint64_t v4 = 0LL;
    do
    {
      a4[v4] = a3[(float)((float)((float)(a2 - 1) * (float)(int)v4) / (float)(result - 1))];
      ++v4;
    }

    while (result != v4);
  }

  return result;
}

void sbp_gvs_extractDistortionData(void *a1, void *a2, uint64_t a3, void *a4, uint64_t a5, float64x2_t a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a4;
  uint64_t v14 = v13;
  if (!a5)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "distortionData",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  5567LL,  0);
LABEL_41:
    FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v24 = 0LL;
    int v21 = 0LL;
    uint64_t v15 = 0LL;
    goto LABEL_37;
  }

  if (!v11 || !v12 || !a3)
  {
    uint64_t v46 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v46,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "cameraInfoByPortType && metadataDict && cameraMetadata",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  5568LL,  0);
    goto LABEL_41;
  }

  if (!v13)
  {
    uint64_t v47 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v47,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "compensationModeByPortType",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  5569LL,  0);
    goto LABEL_41;
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:kFigCaptureStreamMetadata_PortType]);
  *(_BYTE *)(a5 + 208) = 0;
  *(void *)(a5 + 224) = 0LL;
  *(void *)(a5 + 232) = 0LL;
  float v16 = (void *)objc_claimAutoreleasedReturnValue([v14 allKeys]);
  unsigned int v17 = [v16 containsObject:v15];

  if (!v17 || !*(void *)a5 && !*(void *)(a5 + 8)) {
    goto LABEL_43;
  }
  if (([v15 isEqualToString:kFigCapturePortType_BackFacingSuperWideCamera] & 1) != 0
    || [v15 isEqualToString:kFigCapturePortType_FrontFacingSuperWideCamera])
  {
    *(float *)v18.i32 = (float)((float)*(int *)(a3 + 96) * 12.0) / 2464.0;
    *(int32x4_t *)(a5 + 224) = vdupq_lane_s32(v18, 0);
    int v19 = 1;
  }

  else
  {
    int v19 = 0;
  }

  int v20 = GVSExtractGDCPolynomialFromCameraInfoByPortType(v11, v12, (uint64_t)v58);
  if (v20)
  {
    int v48 = v20;
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v48,  v6,  v49,  v50,  LODWORD(a6.f64[0]),  *(const char **)&a6.f64[1],  v53,  v54);
LABEL_43:
    uint64_t v24 = 0LL;
    int v21 = 0LL;
    goto LABEL_37;
  }

  int v21 = (void *)objc_claimAutoreleasedReturnValue( [v12 objectForKeyedSubscript:kFigMotionAttachmentsSampleBufferProcessorMetadata_SphereScalingFactor]);
  [v21 floatValue];
  if (v21 && (float v23 = v22, v22 > 0.0))
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( [v12 objectForKeyedSubscript:kFigMotionAttachmentsSampleBufferProcessorMetadata_ScalingFactor]);
    [v24 floatValue];
    if (v24 && (float v26 = v25, v25 > 0.0))
    {
      int v55 = v21;
      int v27 = v14;
      id v28 = v11;
      float v29 = 0.001 / v23;
      float32x2_t v30 = v15;
      int v31 = v27;
      float v32 = v30;
      float v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:"));
      unsigned __int8 v34 = [v33 unsignedIntValue];

      int v36 = *(void **)(a5 + 8);
      if (v36 && (v34 & 2) != 0)
      {
        LODWORD(v35) = *(_DWORD *)(a3 + 20);
        *(float *)&double v35 = v29 / *(float *)&v35;
        [v36 updateWithCoefficients:v58 pixelSizeMm:v35 center:COERCE_DOUBLE(vcvt_f32_f64(a6))];
      }

      id v11 = v28;
      if (*(void *)a5 && (v34 & 1) != 0)
      {
        uint64_t v51 = v24;
        float64x2_t v57 = 0uLL;
        float v37 = v23 / v26;
        int v38 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:kFigCaptureStreamMetadata_QuadraBinningFactor]);
        int v39 = [v38 intValue];

        if (v39 <= 1) {
          uint64_t v40 = 1LL;
        }
        else {
          uint64_t v40 = v39;
        }
        if (FigMotionComputeOpticalCenterInBuffer( (const __CFDictionary *)v12,  *(void *)(a3 + 96),  v40,  v40,  1LL,  &v57,  v37,  *(double *)(a3 + 32)))
        {
          float64x2_t v41 = a6;
          float64x2_t v57 = a6;
        }

        else
        {
          float64x2_t v41 = v57;
        }

        double v42 = COERCE_DOUBLE(vcvt_f32_f64(v41));
        *(float *)v41.f64 = v29;
        [*(id *)a5 updateWithCoefficients:&v59 pixelSizeMm:v41.f64[0] center:v42];
        int v43 = v28;
        uint64_t v14 = v31;
        uint64_t v15 = v32;
        int v21 = v55;
        if (v19)
        {
          int v44 = objc_alloc_init(&OBJC_CLASS___GVSDistortionModelEven14);
          -[GVSDistortionModelEven14 updateWithCoefficients:pixelSizeMm:center:]( v44,  "updateWithCoefficients:pixelSizeMm:center:",  v58,  COERCE_DOUBLE(__PAIR64__(HIDWORD(v57.f64[0]), LODWORD(v29))),  COERCE_DOUBLE(vcvt_f32_f64(v57)));
        }

        id v11 = v43;
        uint64_t v24 = v51;
      }

      else
      {
        uint64_t v14 = v31;
        uint64_t v15 = v32;
        int v21 = v55;
      }
    }

    else
    {
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v6,  v49,  v50,  LODWORD(a6.f64[0]),  *(const char **)&a6.f64[1],  v53,  v54);
      FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    }
  }

  else
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v6,  v49,  v50,  LODWORD(a6.f64[0]),  *(const char **)&a6.f64[1],  v53,  v54);
    FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v24 = 0LL;
  }

LABEL_37:
}

float _computeAdjustedRollForHorizonCorrection(float result, float a2, float a3, float a4)
{
  if (a4 > 0.0 && a2 < 1.0472)
  {
    for (float i = result - a3; i > 3.1416; float i = i + -6.2832)
      ;
    for (; i < -3.1416; float i = i + 6.2832)
      ;
    if (i < 0.0) {
      a4 = -a4;
    }
    float v5 = i / a4;
    float v6 = 0.0;
    if (v5 > 0.0)
    {
      if (v5 >= 1.0)
      {
        float v6 = v5;
      }

      else
      {
        float v7 = fminf(fmaxf((float)(1.0472 - a2) / 0.2618, 0.0), 1.0);
        float v6 = (float)((float)((float)((float)(v5 * v5) * 0.0) + (float)((float)(1.0 - v7) * v5))
                   + (float)((float)((float)((float)(1.0 - v7) * -3.0) + 3.0) * (float)(v5 * (float)(v5 * v5))))
      }
    }

    return (float)(a4 * v6) + a3;
  }

  return result;
}

double _adjustQuaternionForRollCorrection(double *a1, float a2, double a3, double a4, double a5, __n128 a6)
{
  a6.n128_f32[0] = a1[1];
  float v6 = a1[2];
  float v7 = a1[3];
  float32_t v8 = *a1;
  __n128 v9 = a6;
  v9.n128_f32[1] = v6;
  __n128 v10 = v9;
  v10.n128_f32[2] = v7;
  float32x4_t v11 = (float32x4_t)v10;
  v11.f32[3] = v8;
  if (a2 != 0.0)
  {
    float32x4_t v21 = (float32x4_t)v10;
    float v19 = a1[1];
    float32x4_t v20 = v11;
    float32x2_t v18 = (float32x2_t)v9.n128_u64[0];
    __float2 v12 = __sincosf_stret(a2 * 0.5);
    float32x4_t v13 = vmulq_n_f32((float32x4_t)xmmword_375E0, v12.__sinval);
    v13.i32[3] = LODWORD(v12.__cosval);
    int32x4_t v14 = (int32x4_t)vnegq_f32(v13);
    int8x16_t v15 = (int8x16_t)vtrn2q_s32((int32x4_t)v13, vtrn1q_s32((int32x4_t)v13, v14));
    float32x4_t v16 = (float32x4_t)vrev64q_s32((int32x4_t)v13);
    v16.i32[0] = v14.i32[1];
    v16.i32[3] = v14.i32[2];
    v11.i64[0] = vaddq_f32( vmlaq_n_f32( vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v13, (int8x16_t)v14, 8uLL), v18, 1),  (float32x4_t)vextq_s8(v15, v15, 8uLL),  v19),  vmlaq_laneq_f32(vmulq_laneq_f32(v13, v20, 3), v16, v21, 2)).u64[0];
  }

  return *(double *)v11.i64;
}

int *_updateVideoDeghostingGhostInformationLookAhead(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (a2)
  {
    if (a1)
    {
      if (*(void *)a1)
      {
        if (*(_DWORD *)(a1 + 8) < *(_DWORD *)(a2 + 24))
        {
          fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v4, v20, v21, v22, v23, v24, v25);
        }

        int v9 = 0;
        HIDWORD(v21) = a3;
        *(_DWORD *)(a1 + 12) = 0;
        do
        {
          if (v9 < *(_DWORD *)(a1 + 8))
          {
            uint64_t v10 = *(void *)(a2 + 8);
            if (*(_BYTE *)(v10 + 24LL * a3 + 16))
            {
              uint64_t v11 = v10 + 24LL * a3;
              uint64_t v12 = *(void *)a1 + 24LL * v9;
              *(void *)uint64_t v12 = *(void *)v11;
              objc_storeStrong((id *)(v12 + 8), *(id *)(v11 + 8));
              *(_BYTE *)(v12 + 16) = *(_BYTE *)(v11 + 16);
            }

            else
            {
              uint64_t v13 = *(void *)(*(void *)a2 + 8LL * a3);
              uint64_t v14 = *(void *)a1 + 24LL * v9;
              *(_BYTE *)(v14 + 16) = 0;
              int8x16_t v15 = *(void **)(v14 + 8);
              *(void *)uint64_t v14 = v13;
              *(void *)(v14 + 8) = 0LL;
            }
          }

          BOOL result = FigMotionIncreaseRingIndex((int *)&v21 + 1, *(_DWORD *)(a2 + 28));
          int v9 = *(_DWORD *)(a1 + 12) + 1;
          *(_DWORD *)(a1 + 12) = v9;
          a3 = HIDWORD(v21);
        }

        while (HIDWORD(v21) != a4);
      }

      else
      {
        uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        return (int *)FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "ghostInfoLookAhead->info",  "bail",  "NULL ghostInfoLookAhead->info",  "GVSGyroStabilizationV2.m",  10645LL,  0);
      }
    }

    else
    {
      uint64_t v18 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      return (int *)FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v18,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "ghostInfoLookAhead",  "bail",  "NULL ghostInfoLookAhead",  "GVSGyroStabilizationV2.m",  10644LL,  0);
    }
  }

  else
  {
    uint64_t v17 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    return (int *)FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v17,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "frameRing",  "bail",  "NULL frameRing",  "GVSGyroStabilizationV2.m",  10643LL,  0);
  }

  return result;
}

__n128 __copy_assignment_16_16_s0_s8_t16w224(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  __int128 v5 = *(_OWORD *)(a2 + 48);
  __int128 v6 = *(_OWORD *)(a2 + 64);
  __int128 v7 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v7;
  *(_OWORD *)(a1 + 48) = v5;
  *(_OWORD *)(a1 + 64) = v6;
  __int128 v8 = *(_OWORD *)(a2 + 112);
  __int128 v9 = *(_OWORD *)(a2 + 128);
  __int128 v10 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v10;
  *(_OWORD *)(a1 + 112) = v8;
  *(_OWORD *)(a1 + 128) = v9;
  __n128 result = *(__n128 *)(a2 + 176);
  __int128 v12 = *(_OWORD *)(a2 + 192);
  __int128 v13 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 208) = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 224) = v13;
  *(__n128 *)(a1 + 176) = result;
  *(_OWORD *)(a1 + 192) = v12;
  return result;
}

uint64_t sbp_gvs_createStabilizedSampleBuffer(uint64_t a1, CMSampleBufferRef sbuf, uint64_t a3, const char *a4)
{
  char v240 = a4;
  CMSampleBufferRef v5 = sbuf;
  uint64_t v7 = a1 + 28776;
  sourceBuffer = CMSampleBufferGetImageBuffer(sbuf);
  CMAttachmentBearerRef destination = 0LL;
  CVBufferRef destinationBuffer = 0LL;
  int FrameRateConversionStatus = _getFrameRateConversionStatus();
  if (gGMFigKTraceEnabled == 1)
  {
    _getPresentationTimeStampForSampleBuffer(v5, (uint64_t)&v247);
    *(_OWORD *)&time.duration.value = v247;
    time.duration.epoch = v248;
    Float64 Seconds = CMTimeGetSeconds(&time.duration);
    kdebug_trace(822152385LL, 30LL, *(void *)&Seconds, 0LL, 0LL);
  }

  if (*(_BYTE *)(v7 + 954))
  {
    if (FrameRateConversionStatus == 1 && !*(_BYTE *)(v7 + 972))
    {
      uint64_t PixelBufferFromPool = 0LL;
      BOOL v130 = 1;
      *(_BYTE *)(v7 + 972) = 1;
      char v131 = (char *)v240;
LABEL_220:
      *(_BYTE *)(v7 + 973) = v130;
      goto LABEL_221;
    }

    *(_BYTE *)(v7 + 972) = 0;
  }

  uint64_t v241 = a1 + 28072;
  CMAttachmentBearerRef target = v5;
  float v245 = (int *)(a1 + 27116);
  HIDWORD(v238) = FrameRateConversionStatus;
  int v239 = (_DWORD *)(a1 + 128);
  if (*(_DWORD *)(a1 + 27116) == 5)
  {
    if (v5)
    {
      uint64_t v11 = *(_DWORD **)(a1 + 29680);
      if (v11)
      {
        __int128 v12 = *(void **)(a1 + 27376);
        __int128 v13 = (const __CFString *)kFigVideoStabilizationSampleBufferAttachmentKey_GPUTransformsParameters;
        uint64_t v14 = (const __CFData *)CMGetAttachment( v5,  kFigVideoStabilizationSampleBufferAttachmentKey_GPUTransformsParameters,  0LL);
        if (v14)
        {
          int8x16_t v15 = v14;
          CFIndex Length = CFDataGetLength(v14);
          size_t v17 = 36 * *(int *)(a1 + 180) * (uint64_t)*(int *)(a1 + 184);
          if (Length == v17 + 36)
          {
            size_t v18 = Length;
            BytePtr = CFDataGetBytePtr(v15);
            memcpy(v11, BytePtr, v18);
            if (*v239 == *v11)
            {
              if (*(_DWORD *)(a1 + 132) == v11[1])
              {
                if (*(_DWORD *)(a1 + 152) == v11[2])
                {
                  if (*(_DWORD *)(a1 + 156) == v11[3])
                  {
                    if (*(_DWORD *)(a1 + 144) == v11[4])
                    {
                      if (*(_DWORD *)(a1 + 148) == v11[5])
                      {
                        if (*(_DWORD *)(a1 + 180) == v11[7])
                        {
                          if (*(_DWORD *)(a1 + 184) == v11[8])
                          {
                            if (*(_DWORD *)(a1 + 188) == v11[6])
                            {
                              memcpy(v12, v11 + 9, v17);
                              CMSampleBufferRef v5 = target;
                              CMRemoveAttachment(target, v13);
                              goto LABEL_46;
                            }

                            uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                            FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "ctx->derivedTransformStepY == tmpParameters->derivedTransformStep",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6291LL,  0);
                          }

                          else
                          {
                            uint64_t v214 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                            FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v214,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "ctx->derivedTransformCols == tmpParameters->derivedTransformCols",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6290LL,  0);
                          }
                        }

                        else
                        {
                          uint64_t v213 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v213,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "ctx->derivedTransformRows == tmpParameters->derivedTransformRows",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6289LL,  0);
                        }
                      }

                      else
                      {
                        uint64_t v212 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v212,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "ctx->croppedOutputRect.size.height == tmpParameters->croppedOutputHeight",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6288LL,  0);
                      }
                    }

                    else
                    {
                      uint64_t v211 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v211,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "ctx->croppedOutputRect.size.width == tmpParameters->croppedOutputWidth",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6287LL,  0);
                    }
                  }

                  else
                  {
                    uint64_t v210 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v210,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "ctx->overscanRect.origin.y == tmpParameters->overscanHeight",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6286LL,  0);
                  }
                }

                else
                {
                  uint64_t v209 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v209,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "ctx->overscanRect.origin.x == tmpParameters->overscanWidth",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6285LL,  0);
                }
              }

              else
              {
                uint64_t v208 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v208,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "ctx->height == tmpParameters->inputHeight",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6284LL,  0);
              }
            }

            else
            {
              uint64_t v207 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
              FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v207,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "ctx->width == tmpParameters->inputWidth",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6283LL,  0);
            }
          }

          else
          {
            uint64_t v206 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
            FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v206,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "dataSize == expectedSize",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6277LL,  0);
          }

          uint64_t v204 = 4294954516LL;
          CMSampleBufferRef v5 = target;
        }

        else
        {
          fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v236,  v236,  v238,  (_DWORD)v239,  v240,  (const char *)v241,  (_DWORD)sourceBuffer);
          uint64_t v204 = 4294954513LL;
        }

        goto LABEL_263;
      }

      uint64_t v203 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v203,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "tmpParameters",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6268LL,  0);
    }

    else
    {
      uint64_t v200 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v200,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "sampleBuffer",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6266LL,  0);
    }

    uint64_t v204 = 4294954516LL;
LABEL_263:
    uint64_t v216 = FigSignalErrorAt(v204, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    if ((_DWORD)v216)
    {
      uint64_t PixelBufferFromPool = v216;
      uint64_t v217 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v235) = PixelBufferFromPool;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v217,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  5098LL,  v235);
      goto LABEL_207;
    }

    goto LABEL_46;
  }

  uint64_t v20 = *(void *)(a1 + 27376);
  unsigned int v21 = *(_DWORD *)(a1 + 172);
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace(822152385LL, 35LL, 0LL, 0LL, 0LL);
  }
  if (v21 <= 3 && *(_DWORD *)(a1 + 176) == 1)
  {
    __int128 v22 = *(_OWORD *)(a1 + 27120);
    __int128 v23 = *(_OWORD *)(a1 + 27136);
    *(_DWORD *)(v20 + 32) = *(_DWORD *)(a1 + 27152);
    *(_OWORD *)uint64_t v20 = v22;
    *(_OWORD *)(v20 + 16) = v23;
  }

  float v24 = *(float *)(a3 + 4);
  float32x2_t v25 = vmul_n_f32(vsub_f32(*(float32x2_t *)(a1 + 28176), *(float32x2_t *)(a1 + 28192)), v24);
  double v27 = *(double *)(a1 + 28200);
  float32x2_t v26 = vmul_n_f32(*(float32x2_t *)&v27, v24);
  LODWORD(v27) = v26.i32[1];
  if (*(_BYTE *)(a1 + 28105)) {
    uint64_t v28 = *(void *)(a1 + 28112);
  }
  else {
    uint64_t v28 = 0LL;
  }
  uint64_t v29 = GVSComputeTransforms( a1 + 128,  a1 + 304,  a3,  a1 + 27840,  v28,  (_OWORD *)v20,  v25.f32[0],  v25.f32[1],  v26.f32[0],  v27,  v9);
  if ((_DWORD)v29)
  {
    uint64_t PixelBufferFromPool = v29;
    uint64_t v201 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v201,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  4494LL,  PixelBufferFromPool);
  }

  else
  {
    uint64_t v30 = GVSApplyDistortionToTransforms((int32x2_t *)(a1 + 128), (id *)(a1 + 28848), v20);
    if ((_DWORD)v30)
    {
      uint64_t PixelBufferFromPool = v30;
      uint64_t v205 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v205,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  4498LL,  PixelBufferFromPool);
    }

    else
    {
      if (!*(_BYTE *)(v7 + 880))
      {
LABEL_42:
        uint64_t PixelBufferFromPool = 0LL;
        goto LABEL_43;
      }

      int v31 = *(FILE **)(a1 + 29648);
      if (v31)
      {
LABEL_36:
        int v33 = *(_DWORD *)(v7 + 572);
        if (v33 > 0) {
          int v34 = *(_DWORD *)(a1 + 36) - v33 + 1;
        }
        else {
          int v34 = *(_DWORD *)(a1 + 36);
        }
        if (!v34)
        {
          fprintf(v31, "gvsLogVersion         = %d\n", 1);
          fprintf(*(FILE **)(a1 + 29648), "inputWidth            = %d\n", *(_DWORD *)(a1 + 128));
          fprintf(*(FILE **)(a1 + 29648), "inputHeight           = %d\n", *(_DWORD *)(a1 + 132));
          fprintf(*(FILE **)(a1 + 29648), "overscanWidth         = %d\n", *(_DWORD *)(a1 + 152));
          fprintf(*(FILE **)(a1 + 29648), "overscanHeight        = %d\n", *(_DWORD *)(a1 + 156));
          fprintf(*(FILE **)(a1 + 29648), "croppedOutputWidth    = %d\n", *(_DWORD *)(a1 + 144));
          fprintf(*(FILE **)(a1 + 29648), "croppedOutputHeight   = %d\n", *(_DWORD *)(a1 + 148));
          fprintf(*(FILE **)(a1 + 29648), "derivedTransformStepX = %d\n", *(_DWORD *)(a1 + 192));
          fprintf(*(FILE **)(a1 + 29648), "derivedTransformStepY = %d\n", *(_DWORD *)(a1 + 188));
          fprintf(*(FILE **)(a1 + 29648), "derivedTransformRows  = %d\n", *(_DWORD *)(a1 + 180));
          fprintf(*(FILE **)(a1 + 29648), "derivedTransformCols  = %d\n", *(_DWORD *)(a1 + 184));
          int v31 = *(FILE **)(a1 + 29648);
        }

        GVSLogTransform(v31, v34, v20, *(_DWORD *)(a1 + 180), *(_DWORD *)(a1 + 184));
        goto LABEL_42;
      }

      float v32 = *(void **)(a1 + 29664);
      if (v32)
      {
        int v31 = fopen((const char *)[v32 UTF8String], "w");
        *(void *)(a1 + 29648) = v31;
        if (v31) {
          goto LABEL_36;
        }
      }

      else
      {
        id v180 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"/var/mobile/Media/DCIM/transformLog_0x%p.txt", a1));
        *(void *)(a1 + 29648) = fopen((const char *)[v180 UTF8String], "w");

        int v31 = *(FILE **)(a1 + 29648);
        if (v31) {
          goto LABEL_36;
        }
      }

      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v235) = 0;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v235,  v236,  v236,  v238,  (_DWORD)v239,  v240,  (const char *)v241,  (_DWORD)sourceBuffer);
      uint64_t PixelBufferFromPool = 4294954514LL;
    }
  }

LABEL_43:
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace(822152386LL, 35LL, (int)PixelBufferFromPool, 0LL, 0LL);
  }
  if ((_DWORD)PixelBufferFromPool)
  {
    uint64_t v202 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v235) = PixelBufferFromPool;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v202,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  5103LL,  v235);
    goto LABEL_207;
  }

        if (!(_DWORD)v9) {
          return (int)v9;
        }
        goto LABEL_44;
      }

      dispatch_semaphore_wait((dispatch_semaphore_t)self->_ispWait, 0xFFFFFFFFFFFFFFFFLL);
      if (!v28->_ispStatus)
      {
        LODWORD(v9) = 0;
        int v31 = 1;
        goto LABEL_51;
      }

      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v3,  v53,  (const char *)v54,  v55,  (const char *)v56,  v57,  (_DWORD)v58);
    }

    else
    {
    }

    int v31 = 0;
    LODWORD(v9) = -12782;
    goto LABEL_51;
  }

LABEL_46:
  if (!*(_BYTE *)(v7 + 896))
  {
    if (*(_BYTE *)(a1 + 25) && (*v245 - 1) <= 2)
    {
      if (*(void *)(a1 + 72)) {
        unsigned int v47 = 0;
      }
      else {
        unsigned int v47 = 66000;
      }
    }

    else
    {
      unsigned int v47 = 0;
    }

    int v48 = (__CVPixelBufferPool *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 48) objectForKeyedSubscript:@"OutputBufferPrimary"]);
    uint64_t v49 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 56) objectForKeyedSubscript:@"OutputBufferPrimary"]);
    uint64_t PixelBufferFromPool = sbp_gvs_getPixelBufferFromPool( v48,  v49,  *(void **)(a1 + 72),  v47,  (_DWORD *)(a1 + 80),  1,  &destinationBuffer);

    if ((_DWORD)PixelBufferFromPool)
    {
      uint64_t v222 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v235) = PixelBufferFromPool;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v222,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  5124LL,  v235);
    }

    else
    {
      if (!*(_BYTE *)(v7 + 952)) {
        CVBufferPropagateAttachments(sourceBuffer, destinationBuffer);
      }
      uint64_t SampleTimingInfoArray = CMSampleBufferGetSampleTimingInfoArray(v5, 1LL, &time, 0LL);
      if ((_DWORD)SampleTimingInfoArray)
      {
        uint64_t PixelBufferFromPool = SampleTimingInfoArray;
        uint64_t v223 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v235) = PixelBufferFromPool;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v223,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  5136LL,  v235);
      }

      else
      {
        uint64_t v51 = sbp_internalCreateSampleBufferWithNewPixelBuffer( destinationBuffer,  *(void **)(a1 + 64),  @"OutputBufferPrimary",  &time,  (CMSampleBufferRef *)&destination);
        if ((_DWORD)v51)
        {
          uint64_t PixelBufferFromPool = v51;
          uint64_t v224 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          LODWORD(v235) = PixelBufferFromPool;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v224,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  5139LL,  v235);
        }

        else
        {
          CMPropagateAttachments(v5, destination);
          uint64_t v52 = (const __CFString *)kFigVideoStabilizationSampleBufferAttachmentKey_DepthSampleBuffer;
          double v53 = (opaqueCMSampleBuffer *)CMGetAttachment( v5,  kFigVideoStabilizationSampleBufferAttachmentKey_DepthSampleBuffer,  0LL);
          int v54 = v53;
          if (v53)
          {
            CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v53);
            CMSetAttachment(sourceBuffer, @"InputDepthPixelBuffer", ImageBuffer, 0);
          }

          CMSampleBufferGetPresentationTimeStamp(&v246, v5);
          *(Float64 *)(a1 + 29616) = CMTimeGetSeconds(&v246);
          Stabilizeduint64_t PixelBuffer = sbp_gvs_createStabilizedPixelBuffer(a1, v5, (int *)(a3 + 88), destinationBuffer);
          if (!(_DWORD)StabilizedPixelBuffer)
          {
            CMAttachmentBearerRef v57 = destination;
            CMSampleBufferRef v58 = v5;
            uint64_t v59 = (const __CFString *)kFigVideoStabilizationSampleBufferAttachmentKey_VideoSTFAnalytics;
            CFTypeRef v60 = CMGetAttachment(v58, kFigVideoStabilizationSampleBufferAttachmentKey_VideoSTFAnalytics, 0LL);
            CMSetAttachment(v57, v59, v60, 1u);
            if (v54)
            {
              unsigned int v61 = (__CVBuffer *)CMGetAttachment(sourceBuffer, @"OutputDepthPixelBuffer", 0LL);
              if (v61)
              {
                double v62 = v61;
                uint64_t v63 = CMSampleBufferGetSampleTimingInfoArray(v54, 1LL, &timingArrayOut, 0LL);
                if ((_DWORD)v63)
                {
                  uint64_t PixelBufferFromPool = v63;
                  uint64_t v231 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                  LODWORD(v235) = PixelBufferFromPool;
                  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v231,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  5262LL,  v235);
                  goto LABEL_207;
                }

                *(void *)bytes = 0LL;
                uint64_t v64 = sbp_internalCreateSampleBufferWithNewPixelBuffer( v62,  *(void **)(a1 + 64),  @"OutputBufferDepth",  &timingArrayOut,  (CMSampleBufferRef *)bytes);
                if ((_DWORD)v64)
                {
                  uint64_t PixelBufferFromPool = v64;
                  uint64_t v232 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                  LODWORD(v235) = PixelBufferFromPool;
                  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v232,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  5266LL,  v235);
                  goto LABEL_207;
                }

                CMPropagateAttachments(v54, *(CMAttachmentBearerRef *)bytes);
                CMSetAttachment(destination, v52, *(CFTypeRef *)bytes, 1u);
                CMRemoveAttachment(sourceBuffer, @"InputDepthPixelBuffer");
                CMRemoveAttachment(sourceBuffer, @"OutputDepthPixelBuffer");
                if (*(void *)bytes) {
                  CFRelease(*(CFTypeRef *)bytes);
                }
              }
            }

            CMSampleBufferRef v5 = target;
            goto LABEL_79;
          }

          uint64_t PixelBufferFromPool = StabilizedPixelBuffer;
          uint64_t v225 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          LODWORD(v235) = PixelBufferFromPool;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v225,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  5241LL,  v235);
        }
      }
    }

LABEL_207:
    char v131 = (char *)v240;
    goto LABEL_215;
  }

  if (!v5)
  {
    CMAttachmentBearerRef destination = 0LL;
    if (*(_DWORD *)(a1 + 172)) {
      goto LABEL_79;
    }
    goto LABEL_76;
  }

  CFTypeRef v36 = CFRetain(v5);
  CMAttachmentBearerRef destination = v36;
  if (*(_DWORD *)(a1 + 172)) {
    goto LABEL_79;
  }
  float v37 = v36;
  if (!v36)
  {
LABEL_76:
    uint64_t v65 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v235) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v65,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "sampleBuffer",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6215LL,  v235);
LABEL_77:
    uint64_t v66 = 4294954516LL;
    goto LABEL_78;
  }

  int v38 = *(const void **)(a1 + 27376);
  if (!v38)
  {
    uint64_t v229 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v235) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v229,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "derivedVectors",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6217LL,  v235);
    goto LABEL_77;
  }

  uint64_t v39 = *(void *)(a1 + 29680);
  if (!v39)
  {
    uint64_t v230 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v235) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v230,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "tmpParameters",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6218LL,  v235);
    goto LABEL_77;
  }

  *(void *)&__int128 v40 = *(void *)(a1 + 128);
  *((void *)&v40 + 1) = *(void *)(a1 + 152);
  *(_OWORD *)uint64_t v39 = v40;
  *(void *)(v39 + 16) = *(void *)(a1 + 144);
  *(_DWORD *)(v39 + 24) = *(_DWORD *)(a1 + 188);
  int v41 = *(_DWORD *)(a1 + 180);
  *(_DWORD *)(v39 + 28) = v41;
  int v42 = *(_DWORD *)(a1 + 184);
  *(_DWORD *)(v39 + 32) = v42;
  size_t v43 = 36 * v41 * (uint64_t)v42;
  CFIndex v44 = v43 + 36;
  memcpy((void *)(v39 + 36), v38, v43);
  CFDataRef v45 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v39, v44);
  if (v45)
  {
    CFDataRef v46 = v45;
    CMSetAttachment(v37, kFigVideoStabilizationSampleBufferAttachmentKey_GPUTransformsParameters, v45, 1u);
    CFRelease(v46);
    goto LABEL_79;
  }

  fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
  LODWORD(v235) = 0;
  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v235,  v236,  v236,  v238,  (_DWORD)v239,  v240,  (const char *)v241,  (_DWORD)sourceBuffer);
  uint64_t v66 = 4294954510LL;
LABEL_78:
  uint64_t v67 = FigSignalErrorAt(v66, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if ((_DWORD)v67)
  {
    uint64_t PixelBufferFromPool = v67;
    uint64_t v181 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v235) = PixelBufferFromPool;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v181,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  5114LL,  v235);
    goto LABEL_207;
  }

LABEL_79:
  uint64_t v68 = 0LL;
  CMAttachmentBearerRef v69 = destination;
  int v70 = *(_DWORD *)(a1 + 180);
  int v71 = *(_DWORD *)(a1 + 184);
  int v72 = (v71 >> 1) * v70;
  int v73 = v70 + (v70 < 0);
  if (v71 <= 1) {
    int v74 = 0;
  }
  else {
    int v74 = v72;
  }
  uint64_t v75 = *(void *)(a1 + 27376) + 36LL * (v74 + (v73 >> 1));
  do
  {
    *(_DWORD *)((char *)&time.duration.value + v68) = *(_DWORD *)(v75 + v68);
    v68 += 4LL;
  }

  while (v68 != 36);
  double v76 = (const __CFNumber *)CMGetAttachment( v69,  kFigVideoStabilizationSampleBufferAttachmentKey_RemainingDigitalZoomAfterVIS,  0LL);
  if (v76)
  {
    LODWORD(timingArrayOut.duration.value) = 1065353216;
    CFNumberGetValue(v76, kCFNumberFloatType, &timingArrayOut);
    v77.i32[0] = timingArrayOut.duration.value;
    FigMotionApplyDigitalZoomToTransform( 1,  (float *)&time,  v77,  *(int32x4_t *)(a1 + 304),  *(double *)(a1 + 312),  v78,  v79);
  }

  invert3x3Matrix((uint64_t)&time, (float *)&timingArrayOut);
  *(_OWORD *)bytes = *(_OWORD *)&timingArrayOut.duration.value;
  *(_OWORD *)&bytes[16] = *(_OWORD *)&timingArrayOut.duration.epoch;
  CMTimeScale timescale = timingArrayOut.presentationTimeStamp.timescale;
  CFDataRef v80 = CFDataCreate(kCFAllocatorDefault, bytes, 36LL);
  CMSetAttachment(v69, kFigVideoStabilizationSampleBufferAttachmentKey_CenterStabilizationInvertedTransform, v80, 1u);
  if (v80) {
    CFRelease(v80);
  }
  if (!a1)
  {
    uint64_t v187 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v235) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v187,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6011LL,  v235);
    goto LABEL_117;
  }

  CMAttachmentBearerRef v81 = destination;
  if (!destination)
  {
    uint64_t v188 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v235) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v188,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "sampleBuffer",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6012LL,  v235);
    goto LABEL_117;
  }

  if (!a3)
  {
    uint64_t v189 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v235) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v189,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "cameraMetadata",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6013LL,  v235);
    goto LABEL_117;
  }

  if (*(_BYTE *)(v7 + 1) || *(_BYTE *)(v7 + 2))
  {
    if (*(float *)(a3 + 4) <= 0.0)
    {
      uint64_t v190 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v235) = 0;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v190,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "cameraMetadata->lensPosition > 0.0f",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6021LL,  v235);
      goto LABEL_117;
    }

    if (*(float *)(a3 + 20) <= 0.0)
    {
      uint64_t v191 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v235) = 0;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v191,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "cameraMetadata->digitalZoomFactor > 0.0f",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6022LL,  v235);
      goto LABEL_117;
    }

    uint64_t v82 = (_OWORD *)(a1 + 28064);
    if (FigMotionGetQuaternionLength((double *)(a1 + 28064)) <= 0.00000001)
    {
      uint64_t v192 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v235) = 0;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v192,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "length > 1e-8",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6025LL,  v235);
      goto LABEL_117;
    }

    if (!*(_BYTE *)v7)
    {
      __int128 v83 = *(_OWORD *)(a1 + 28080);
      *(_OWORD *)(a1 + 28784) = *v82;
      *(_OWORD *)(a1 + 28800) = v83;
      *(void *)(a1 + 28816) = 0LL;
      *(_BYTE *)uint64_t v7 = 1;
    }

    if (*(_BYTE *)(v7 + 1))
    {
      uint64_t v84 = (__CFDictionary *)CMGetAttachment(v81, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0LL);
      if (v84)
      {
        int v85 = v84;
        time.duration.value = FigMotionMultiplyByInverseOfQuaternion((double *)(a1 + 28064), (uint64_t *)(a1 + 28784));
        *(void *)&time.duration.CMTimeScale timescale = v86;
        time.duration.epoch = v87;
        time.presentationTimeStamp.value = v88;
        timingArrayOut.duration.value = 0LL;
        int v89 = GVSComputeTranslationFromCameraMotion( (double *)&time.duration.value,  (float32x2_t *)&timingArrayOut,  *(float *)(a3 + 4));
        if (!v89)
        {
          v90.f32[0] = -*(float *)(a3 + 20);
          if (!*(_BYTE *)(a1 + 203)) {
            v90.i32[0] = *(_DWORD *)(a3 + 20);
          }
          v90.i32[1] = *(_DWORD *)(a3 + 20);
          *(float32x2_t *)(a1 + 28816) = vmla_f32( *(float32x2_t *)(a1 + 28816),  v90,  (float32x2_t)timingArrayOut.duration.value);
          *(float32x2_t *)bytes = vmul_f32(v90, *(float32x2_t *)(a3 + 80));
          CFDataRef v91 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)(a1 + 28816), 8LL);
          if (v91)
          {
            CFDataRef v92 = CFDataCreate(kCFAllocatorDefault, bytes, 8LL);
            if (v92)
            {
              CFDataRef v93 = v92;
              CFDictionarySetValue( v85,  kFigVideoStabilizationSampleBufferAttachmentKey_EstimatedCenterMotionVector,  v91);
              CFDictionarySetValue(v85, kFigVideoStabilizationSampleBufferAttachmentKey_EstimatedMotionBlurVector, v93);
              CMSampleBufferRef v5 = target;
LABEL_107:
              if (!*(_BYTE *)(v7 + 2)) {
                goto LABEL_113;
              }
              time.duration.flags = 0;
              *(CMTimeValue *)((char *)&time.duration.value + 4) = 0LL;
              *(CMTimeEpoch *)((char *)&time.duration.epoch + 4) = 0LL;
              *(CMTimeValue *)((char *)&time.presentationTimeStamp.value + 4) = 0x3F80000000000000LL;
              LODWORD(time.duration.value) = 1065353216;
              LODWORD(time.duration.epoch) = 1065353216;
              uint64_t v94 = *(void *)(a1 + 28064);
              *(float64x2_t *)&bytes[8] = vnegq_f64(*(float64x2_t *)v241);
              double v95 = -*(double *)(a1 + 28088);
              *(void *)bytes = v94;
              *(double *)&bytes[24] = v95;
              *(float *)&uint64_t v94 = (float)*(int *)(v7 + 864) * 0.75;
              float64x2_t v96 = *(float64x2_t *)(a1 + 304);
              float v258 = *(float *)(a3 + 4) * *(float *)(a3 + 20);
              uint64_t v97 = *(void *)(a1 + 136);
              v98.i64[0] = (int)v97;
              v98.i64[1] = SHIDWORD(v97);
              float64x2_t v260 = vsubq_f64(v96, vcvtq_f64_s64(v98));
              BOOL v252 = v94;
              float64x2_t v253 = v260;
              GVSInverseRotationMatrixFromQuaternion((double *)bytes, (uint64_t)&timingArrayOut);
              *(double *)v99.i64 = FigMotionComputeTransformFromRotation( (uint64_t)&v258,  (uint64_t)&v252,  (__int128 *)&timingArrayOut.duration.value,  (uint64_t)&time);
              if (*(_BYTE *)(a1 + 203))
              {
                *(float *)v100.i32 = (float)*(int *)(a1 + 144);
                v99.i32[0] = -1.0;
                FigMotionPreMultiplyScalingTranslationToTransform((uint64_t)&time, v99, v100, 1.0, 0.0, v101);
              }

              unint64_t valuePtr = (unint64_t)(*(double *)(a3 + 72) * 1000000000.0);
              CFDataRef v102 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)&time, 36LL);
              if (v102)
              {
                CFDataRef v103 = v102;
                CMSetAttachment( v81,  kFigVideoStabilizationSampleBufferAttachmentKey_StabilizedTrajectoryHomography,  v102,  1u);
                CFRelease(v103);
                CFNumberRef v104 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
                if (v104)
                {
                  CFNumberRef v105 = v104;
                  CMSetAttachment( v81,  kFigVideoStabilizationSampleBufferAttachmentKey_StabilizedTrajectoryHomographyTimestamp,  v104,  1u);
                  CFRelease(v105);
                  CMSampleBufferRef v5 = target;
LABEL_113:
                  __int128 v106 = *(_OWORD *)(a1 + 28080);
                  *(_OWORD *)(a1 + 28784) = *v82;
                  *(_OWORD *)(a1 + 28800) = v106;
                  if (!v93) {
                    goto LABEL_115;
                  }
                  goto LABEL_114;
                }

                uint64_t v199 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                LODWORD(v235) = 0;
                FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v199,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "timestamp",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6116LL,  v235);
              }

              else
              {
                uint64_t v197 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                LODWORD(v235) = 0;
                FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v197,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "data",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6109LL,  v235);
              }

              CMSampleBufferRef v5 = target;
              if (v93) {
LABEL_114:
              }
                CFRelease(v93);
LABEL_115:
              if (v91) {
                CFRelease(v91);
              }
              goto LABEL_117;
            }

            uint64_t v198 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
            LODWORD(v235) = 0;
            FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v198,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "motionBlurData",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6067LL,  v235);
          }

          else
          {
            uint64_t v196 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
            LODWORD(v235) = 0;
            FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v196,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "accumulatedCenterMotionVecData",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6063LL,  v235);
          }

          CMSampleBufferRef v5 = target;
          goto LABEL_115;
        }

        int v194 = v89;
        uint64_t v195 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v235) = v194;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v195,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6047LL,  v235);
      }

      else
      {
        uint64_t v193 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v235) = 0;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v193,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "metadataDict",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6041LL,  v235);
      }

      CMSampleBufferRef v5 = target;
      goto LABEL_117;
    }

    CFDataRef v91 = 0LL;
    CFDataRef v93 = 0LL;
    goto LABEL_107;
  }

LABEL_117:
  if (*v245 != 3 && *v245 != 5)
  {
    BOOL v107 = (__CFDictionary *)CMGetAttachment(destination, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0LL);
    if (v107)
    {
      double v108 = v107;
      LOBYTE(timingArrayOut.duration.value) = 0;
      FigCFDictionaryGetBooleanIfPresent( v107,  kFigVideoStabilizationSampleBufferProcessorMetadata_LivePhotoKeyFrame,  &timingArrayOut);
      if (LOBYTE(timingArrayOut.duration.value))
      {
        int v111 = *(_DWORD *)(a1 + 180);
        int v112 = *(_DWORD *)(a1 + 184);
        if (v111 >= 0) {
          int v113 = *(_DWORD *)(a1 + 180);
        }
        else {
          int v113 = v111 + 1;
        }
        int v114 = (v112 >> 1) * v111;
        if (v112 <= 1) {
          int v114 = 0;
        }
        uint64_t v115 = *(void *)(a1 + 27376) + 36LL * (v114 + (v113 >> 1));
        CMTimeScale v116 = *(_DWORD *)(v115 + 32);
        int8x16_t v117 = *(int8x16_t *)(v115 + 16);
        *(_OWORD *)&time.duration.value = *(_OWORD *)v115;
        *(int8x16_t *)&time.duration.epoch = v117;
        time.presentationTimeStamp.CMTimeScale timescale = v116;
        v117.i32[0] = *(_DWORD *)(a3 + 20);
        if (*(float *)v117.i32 > 0.0) {
          FigMotionApplyDigitalZoomToTransform( 0,  (float *)&time,  v117,  *(int32x4_t *)(a1 + 304),  *(double *)(a1 + 312),  v109,  v110);
        }
        float v118 = (float)(*(_DWORD *)(a1 + 128) - *(_DWORD *)(v7 + 864));
        float v119 = (float)((float)(*(_DWORD *)(a1 + 132) - *(_DWORD *)(v7 + 868)) * 0.5) + (float)*(int *)(v7 + 868);
        FigMotionPostMultiplyScalingTranslationToTransform((float *)&time, 1.0, v118 * 0.5, -1.0, v119);
        *(float *)v120.i32 = -(float)(v118 * 0.5);
        v121.i32[0] = 1.0;
        FigMotionPreMultiplyScalingTranslationToTransform((uint64_t)&time, v121, v120, -1.0, v119, v122);
        CFDataRef v123 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)&time, 36LL);
        if (v123)
        {
          CFDataRef v124 = v123;
          CFDictionarySetValue(v108, kFigVideoStabilizationSampleBufferProcessorMetadata_VitalityTransformMatrix, v123);
          CFRelease(v124);
        }

        else
        {
          fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          LODWORD(v235) = 0;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v235,  v236,  v236,  v238,  (_DWORD)v239,  v240,  (const char *)v241,  (_DWORD)sourceBuffer);
        }
      }
    }
  }

  int v125 = *v245;
  if ((*v245 - 1) <= 2)
  {
    if (*(_BYTE *)(v241 + 24))
    {
      CMAttachmentBearerRef v126 = destination;
      if (*(_BYTE *)(a1 + 360))
      {
        if (a1 && a3 && destination)
        {
          __int128 v127 = *(_OWORD *)(a1 + 28080);
          *(_OWORD *)&time.duration.value = *(_OWORD *)(a1 + 28064);
          *(_OWORD *)&time.duration.epoch = v127;
          *(float32x2_t *)&time.presentationTimeStamp.CMTimeScale timescale = vneg_f32(*(float32x2_t *)(a1 + 28200));
          *(float *)&time.presentationTimeStamp.epoch = *(float *)(a3 + 4) * *(float *)(a3 + 20);
          int v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", &time, 48LL));
          if (v128)
          {
            double v129 = v128;
            CMSetAttachment( v126,  kFigVideoStabilizationSampleBufferAttachmentKey_StabilizedOutputCameraGeometry,  v128,  1u);
          }

          else
          {
            uint64_t v227 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
            LODWORD(v235) = 0;
            FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v227,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "data",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6175LL,  v235);
          }
        }

        else
        {
          uint64_t v226 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          LODWORD(v235) = 0;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v226,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "sampleBuffer && storage && cameraMetadata",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6167LL,  v235);
        }
      }

      else if (destination)
      {
        CFDataRef v132 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)(a1 + 28064), 32LL);
        if (v132)
        {
          CFDataRef v133 = v132;
          CMSetAttachment( v126,  kFigVideoStabilizationSampleBufferAttachmentKey_StabilizedOutputCenterQuaternion,  v132,  1u);
          CFRelease(v133);
        }

        else
        {
          uint64_t v234 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          LODWORD(v235) = 0;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v234,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "data",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6134LL,  v235);
        }
      }

      else
      {
        uint64_t v233 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v235) = 0;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v233,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "sampleBuffer && centerQuaternion",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  6131LL,  v235);
      }
    }

    int v125 = *v245;
  }

  if (v125 != 5) {
    goto LABEL_179;
  }
  uint64_t v134 = *(void *)(a1 + 27376);
  float v135 = (const __CFDictionary *)CMGetAttachment( destination,  kFigCaptureSampleBufferAttachmentKey_MetadataDictionary,  0LL);
  if (!v135)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v235) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v235,  v236,  v236,  v238,  (_DWORD)v239,  v240,  (const char *)v241,  (_DWORD)sourceBuffer);
    uint64_t v218 = 4294954516LL;
LABEL_268:
    uint64_t PixelBufferFromPool = FigSignalErrorAt(v218, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    goto LABEL_281;
  }

  unsigned int v136 = v135;
  LOBYTE(v252) = 1;
  uint64_t v137 = kFigMotionAttachmentsSampleBufferProcessorMetadata_StereoStitchingNarrowBufferRect;
  int v138 = CFDictionaryContainsKey( v135,  kFigMotionAttachmentsSampleBufferProcessorMetadata_StereoStitchingNarrowBufferRect);
  int BooleanIfPresent = FigCFDictionaryGetBooleanIfPresent( v136,  kFigStereoStitchingBundleMetadata_StereoStitchingSucceeded,  &v252);
  BOOL v140 = v252;
  if (!BooleanIfPresent) {
    BOOL v140 = v138 == 0;
  }
  double v141 = (double)*(int *)(a1 + 144);
  double v142 = (double)*(int *)(a1 + 148);
  double v143 = 0.0;
  if (v140)
  {
    double v144 = 0.0;
    goto LABEL_177;
  }

  if (*(int *)(a1 + 180) <= 0)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v235) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v235,  v236,  v236,  v238,  (_DWORD)v239,  v240,  (const char *)v241,  (_DWORD)sourceBuffer);
    uint64_t v228 = 4294954514LL;
LABEL_280:
    uint64_t PixelBufferFromPool = FigSignalErrorAt(v228, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    CMSampleBufferRef v5 = target;
LABEL_281:
    if ((_DWORD)PixelBufferFromPool)
    {
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v235) = PixelBufferFromPool;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v235,  v237,  v237,  v238,  (_DWORD)v239,  v240,  v242,  (_DWORD)sourceBuffer);
      goto LABEL_181;
    }

    goto LABEL_179;
  }

  if (!v138)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v235) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v235,  v236,  v236,  v238,  (_DWORD)v239,  v240,  (const char *)v241,  (_DWORD)sourceBuffer);
    uint64_t v228 = 4294954513LL;
    goto LABEL_280;
  }

  CGSize size = CGRectNull.size;
  *(CGPoint *)&timingArrayOut.duration.value = CGRectNull.origin;
  *(CGSize *)&timingArrayOut.duration.epoch = size;
  FigCFDictionaryGetCGRectIfPresent(v136, v137, &timingArrayOut);
  if (*(double *)&timingArrayOut.presentationTimeStamp.value <= 0.0)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v235) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v235,  v236,  v236,  v238,  (_DWORD)v239,  v240,  (const char *)v241,  (_DWORD)sourceBuffer);
    uint64_t v228 = 4294954511LL;
    goto LABEL_280;
  }

  int v146 = *(_DWORD *)(a1 + 180);
  float v147 = *(double *)&timingArrayOut.duration.value;
  int v148 = (int)(*(double *)&timingArrayOut.presentationTimeStamp.value + *(double *)&timingArrayOut.duration.timescale);
  float v149 = *(double *)&timingArrayOut.duration.value + *(double *)&timingArrayOut.duration.epoch + -1.0;
  float v258 = v147;
  *(float *)v260.f64 = v149;
  int v150 = (int)*(double *)&timingArrayOut.duration.timescale;
  if ((int)*(double *)&timingArrayOut.duration.timescale >= v148)
  {
    double v154 = 3.40282347e38;
    double v155 = 0.0;
    double v153 = 0.0;
  }

  else
  {
    uint64_t v151 = 0LL;
    int v152 = (int)(*(double *)&timingArrayOut.presentationTimeStamp.value / (double)v146);
    double v153 = 0.0;
    double v154 = 3.40282347e38;
    double v155 = 0.0;
    do
    {
      *((float *)v260.f64 + 1) = (float)v150;
      float v259 = (float)v150;
      invert3x3Matrix(v134, (float *)&time);
      _computeProjectedPoints((float *)&time, (uint64_t)&v258, (uint64_t)bytes);
      double v156 = *(double *)&bytes[8];
      if (!v151) {
        double v155 = v156;
      }
      v150 += v152;
      --v151;
      v134 += 36LL;
    }

    while (v150 < v148);
  }

  *((float *)v260.f64 + 1) = (float)(v148 - 1);
  float v259 = *((float *)v260.f64 + 1);
  _computeProjectedPoints((float *)&time, (uint64_t)&v258, (uint64_t)bytes);
  double v157 = (double)*(int *)(a1 + 136);
  double v158 = *(double *)&bytes[24];
  double v159 = *(double *)&bytes[16];
  else {
    double v160 = v153;
  }
  double v161 = (double)*(int *)(a1 + 140);
  double v144 = fmax(v155 - v161, 0.0);
  double v143 = fmax(v160 - v157, 0.0);
  double v162 = v159 - v157;
  if (v162 >= v141 + -1.0) {
    double v162 = v141 + -1.0;
  }
  double v163 = v158 - v161;
  if (v163 >= v142 + -1.0) {
    double v163 = v142 + -1.0;
  }
  double v141 = v162 - v143 + 1.0;
  double v142 = v163 - v144 + 1.0;
LABEL_177:
  double v164 = v141;
  double v165 = v142;
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)&v143);
  CMSampleBufferRef v5 = target;
  if (!DictionaryRepresentation)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v235) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v235,  v236,  v236,  v238,  (_DWORD)v239,  v240,  (const char *)v241,  (_DWORD)sourceBuffer);
    uint64_t v218 = 4294954510LL;
    goto LABEL_268;
  }

  CFDictionaryRef v167 = DictionaryRepresentation;
  CFDictionarySetValue( v136,  kFigVideoStabilizationSampleBufferProcessorMetadata_StitchingCleanApertureRect,  DictionaryRepresentation);
  CFRelease(v167);
LABEL_179:
  if (*v245 == 5)
  {
    uint64_t PixelBufferFromPool = 0LL;
LABEL_181:
    char v131 = (char *)v240;
    goto LABEL_215;
  }

  if (a1 && v5 && a3)
  {
    LODWORD(v168) = GVSComputeOverscanUsage(v239, (float64x2_t *)(a3 + 104), *(void *)(a1 + 27376)).u32[0];
    uint64_t v170 = *(unsigned int *)(a3 + 136);
    int v171 = *(_DWORD *)(a3 + 140);
    unsigned int v172 = v171 - 1;
    if (v171 <= 0) {
      unsigned int v172 = 0;
    }
    uint64_t v173 = OverscanHistogramIndexMapping[2 * v170 + v172];
    if ((v173 & 0x80000000) != 0)
    {
      uint64_t v220 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v235) = 0;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v220,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "posIndex >= 0",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  5856LL,  v235);
    }

    else
    {
      float v174 = (float)*(int *)(a3 + 100);
      if (v169 >= v174) {
        float v175 = 1.0;
      }
      else {
        float v175 = v169 / v174;
      }
      float v176 = (float)*(int *)(a3 + 96);
      if (v168 >= v176) {
        float v177 = 1.0;
      }
      else {
        float v177 = v168 / v176;
      }
      double v178 = fminf(v177, v175);
      if (v178 >= 0.02)
      {
        if (v178 >= 0.04)
        {
          if (v178 >= 0.06)
          {
            if (v178 >= 0.11)
            {
              if (v178 >= 0.16)
              {
                uint64_t v179 = 6LL;
                if (v178 < 0.21) {
                  uint64_t v179 = 5LL;
                }
              }

              else
              {
                uint64_t v179 = 4LL;
              }
            }

            else
            {
              uint64_t v179 = 3LL;
            }
          }

          else
          {
            uint64_t v179 = 2LL;
          }
        }

        else
        {
          uint64_t v179 = 1LL;
        }
      }

      else
      {
        uint64_t v179 = 0LL;
      }

      *(_DWORD *)(a1 + 29776 + 4 * v173 + 200) = v170 | (v171 << 16);
      *(float *)(a1 + 29776 + 28LL * v173 + 4 * v179) = *(float *)(a1
                                                                               + 29776
                                                                               + 28LL * v173
                                                                               + 4 * v179)
                                                                    + 1.0;
      float v182 = *(float *)(v7 + 700);
      if (v182 > 0.0)
      {
        uint64_t v183 = a1 + 4LL * (int)vcvtms_s32_f32((float)(*(float *)(v7 + 708) / v182) * 6.0);
        *(float *)(v183 + 29944) = *(float *)(v183 + 29944) + 1.0;
      }

      LODWORD(time.duration.value) = 0;
      CFTypeRef v184 = CMGetAttachment(v5, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0LL);
      if (v184)
      {
        FigCFDictionaryGetInt32IfPresent(v184, kFigCaptureStreamMetadata_LuxLevel, &time);
        *(float *)(v7 + 1196) = *(float *)(v7 + 1196) + (float)SLODWORD(time.duration.value);
      }

      else
      {
        uint64_t v221 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v235) = 0;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v221,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "metadataDict",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  5869LL,  v235);
      }
    }
  }

  else
  {
    uint64_t v219 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v235) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v219,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage && cameraMetadata && sampleBuffer",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  5848LL,  v235);
  }

  char v131 = (char *)v240;
  uint64_t PixelBufferFromPool = 0LL;
LABEL_215:
  if (*(_BYTE *)(v7 + 954))
  {
    BOOL v130 = HIDWORD(v238) == 1 && *(_BYTE *)(v7 + 972);
    goto LABEL_220;
  }

LABEL_221:
  CMRemoveAttachment(sourceBuffer, @"InputDepthPixelBuffer");
  CMRemoveAttachment(sourceBuffer, @"OutputDepthPixelBuffer");
  CMAttachmentBearerRef v185 = destination;
  if ((_DWORD)PixelBufferFromPool && destination)
  {
    CFRelease(destination);
    CMAttachmentBearerRef v185 = 0LL;
    CMAttachmentBearerRef destination = 0LL;
  }

  *(void *)char v131 = v185;
  if (destinationBuffer) {
    CFRelease(destinationBuffer);
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace(822152386LL, 30LL, (int)PixelBufferFromPool, 0LL, 0LL);
  }
  return PixelBufferFromPool;
}

uint64_t sbp_gvs_gaussianAverageComputeCorrection(uint64_t a1, int a2, int a3, _BYTE *a4, float a5)
{
  __int128 v8 = (unsigned __int8 *)(a1 + 27104);
  float64x2_t v267 = 0u;
  float64x2_t v268 = 0u;
  float32x2_t v266 = 0LL;
  float32x2_t v265 = 0LL;
  BOOL v264 = 1;
  [*(id *)(a1 + 29352) getSmoothingAnalysisArrays];
  uint64_t v9 = v263 + (uint64_t)a2;
  if (v8[1001])
  {
    int v10 = *((_DWORD *)v8 + 575);
    int v11 = *((_DWORD *)v8 + 572) + v10 + a2;
    do
      v11 -= v10;
    while (v11 >= v10);
    uint64_t v12 = a1;
    __int128 v13 = (void *)(a1 + 29360);
  }

  else
  {
    int v11 = 0;
    __int128 v13 = 0LL;
    uint64_t v12 = a1;
  }

  double v14 = *(double *)(v262 + 8 * v9);
  double v15 = *(double *)(v262 + 8LL * v263);
  float32x4_t v16 = (__int128 *)(v261 + 144 * v9);
  __int128 v251 = *v16;
  __int128 v17 = v16[4];
  __int128 v19 = v16[1];
  __int128 v18 = v16[2];
  __int128 v254 = v16[3];
  __int128 v255 = v17;
  __int128 v252 = v19;
  __int128 v253 = v18;
  __int128 v20 = v16[8];
  __int128 v22 = v16[5];
  __int128 v21 = v16[6];
  v257[1] = v16[7];
  v257[2] = v20;
  __int128 v256 = v22;
  v257[0] = v21;
  int v23 = *v8;
  float v24 = *(void **)(v12 + 29352);
  uint64_t v228 = a4;
  if (v24)
  {
    [v24 getQuaternionSmoothingArrays];
    uint64_t v12 = a1;
    int v25 = *v8;
  }

  else
  {
    uint64_t v250 = 0LL;
    __int128 v248 = 0u;
    __int128 v249 = 0u;
    __int128 v246 = 0u;
    __int128 v247 = 0u;
    __int128 v245 = 0u;
    int v25 = v23;
  }

  *(_DWORD *)(v12 + 196) = 1065353216;
  if (v25)
  {
    if (*(_BYTE *)(v12 + 204)) {
      BOOL v26 = 1;
    }
    else {
      BOOL v26 = *(_BYTE *)(v12 + 360) != 0;
    }
    if (v8[1660]) {
      double v27 = &v266;
    }
    else {
      double v27 = 0LL;
    }
    if (v26) {
      uint64_t v28 = &v265;
    }
    else {
      uint64_t v28 = 0LL;
    }
    double v29 = GVSComputeGaussianAverageQuaternion( (uint64_t)&v245,  *(_DWORD *)(v12 + 176),  a2,  v23 != 0,  (unint64_t)v27,  (unint64_t)v28,  a5,  *((float *)v8 + 593));
    uint64_t v12 = a1;
    v267.f64[0] = v29;
    v267.f64[1] = v30;
    v268.f64[0] = v31;
    v268.f64[1] = v32;
    if (*(void *)(a1 + 29520))
    {
      double v33 = FigMotionMultiplyQuaternions((double *)(v260 + 32 * v9), v267.f64);
      uint64_t v12 = a1;
      v267.f64[0] = v33;
      v267.f64[1] = v34;
      v268.f64[0] = v35;
      v268.f64[1] = v36;
    }

    if (*((float *)v8 + 646) > 0.0)
    {
      float v37 = *(void **)(v12 + 29352);
      if (v37)
      {
        [v37 getRollSmoothingArraysForBaseTransform:*(unsigned int *)(v12 + 176)];
        uint64_t v12 = a1;
        if (!v13) {
          goto LABEL_52;
        }
      }

      else
      {
        __int128 v243 = 0u;
        __int128 v244 = 0u;
        float64x2_t v241 = 0u;
        __int128 v242 = 0u;
        float64x2_t v240 = 0u;
        if (!v13) {
          goto LABEL_52;
        }
      }

      uint64_t v38 = v13[3];
      if (v38)
      {
        uint64_t v39 = (float *)(v38 + 12LL * v11);
        *(double *)v40.i64 = GVSComputeSmoothedHorizonQuaternion( (uint64_t)&v240,  a2,  fminf((float)(a5 / 30.0) * 4.0, *((float *)v8 + 577)));
        float32x4_t v223 = v40;
        double v271 = FigMotionInverseOfQuaternion((uint64_t)&v267);
        uint64_t v272 = v41;
        uint64_t v273 = v42;
        uint64_t v274 = v43;
        v44.i32[0] = GVSRotateVectorByQuaternion(v39, (uint64_t)&v271).u32[0];
        v270[0] = v44.f32[0];
        v270[1] = v45;
        float v229 = v46;
        v270[2] = v46;
        float v235 = v44.f32[0];
        v44.f32[1] = v45;
        float32x2_t v226 = *(float32x2_t *)v44.f32;
        float v47 = sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v44, v44)));
        float v48 = 0.0;
        if (v47 > 0.0000001) {
          float v48 = atan2f(v235, v45) * 0.5;
        }
        __float2 v49 = __sincosf_stret(v48);
        float32x4_t v50 = vmulq_n_f32((float32x4_t)xmmword_375E0, v49.__sinval);
        float32x4_t v51 = v50;
        v51.i32[3] = LODWORD(v49.__cosval);
        float32x4_t v52 = vmulq_f32(v51, (float32x4_t)xmmword_375F0);
        int32x4_t v53 = (int32x4_t)vnegq_f32(v52);
        int8x16_t v54 = (int8x16_t)vtrn2q_s32((int32x4_t)v52, vtrn1q_s32((int32x4_t)v52, v53));
        float32x4_t v55 = vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v52, (int8x16_t)v53, 8uLL), v226, 1);
        float32x4_t v56 = (float32x4_t)vrev64q_s32((int32x4_t)v52);
        v56.i32[0] = v53.i32[1];
        v56.i32[3] = v53.i32[2];
        float32x4_t v57 = vmlaq_n_f32(vmlaq_n_f32(v55, (float32x4_t)vextq_s8(v54, v54, 8uLL), v235), v56, v229);
        int32x4_t v58 = (int32x4_t)vnegq_f32(v57);
        int8x16_t v59 = (int8x16_t)vtrn2q_s32((int32x4_t)v57, vtrn1q_s32((int32x4_t)v57, v58));
        float32x4_t v60 = vmlaq_n_f32( vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v57, (int8x16_t)v58, 8uLL), *(float32x2_t *)v50.f32, 1),  (float32x4_t)vextq_s8(v59, v59, 8uLL),  v50.f32[0]);
        float32x4_t v61 = (float32x4_t)vrev64q_s32((int32x4_t)v57);
        v61.i32[0] = v58.i32[1];
        v61.i32[3] = v58.i32[2];
        float32x4_t v62 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v57, v51, 3), v61, v50, 2), v60);
        float32x4_t v63 = vmulq_f32(v62, (float32x4_t)xmmword_37600);
        float32x4_t v232 = v51;
        if (vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v63, 2),  vaddq_f32(v63, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v63.f32, 1))).f32[0] >= 0.0)
        {
          float32x4_t v100 = vaddq_f32(v62, (float32x4_t)xmmword_37600);
          int32x4_t v101 = (int32x4_t)vmulq_f32(v100, v100);
          *(float32x2_t *)v101.i8 = vadd_f32( (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v101, 2),  vadd_f32( *(float32x2_t *)v101.i8,  (float32x2_t)vdup_lane_s32(*(int32x2_t *)v101.i8, 1)));
          float32x2_t v102 = vrsqrte_f32(*(float32x2_t *)v101.i8);
          float32x2_t v103 = vmul_f32(v102, vrsqrts_f32(*(float32x2_t *)v101.i8, vmul_f32(v102, v102)));
          float32x4_t v104 = vmulq_n_f32(v100, vmul_f32(v103, vrsqrts_f32(*(float32x2_t *)v101.i8, vmul_f32(v103, v103))).f32[0]);
          int32x4_t v105 = (int32x4_t)vmlaq_f32( vmulq_f32( (float32x4_t)vextq_s8( (int8x16_t)vuzp1q_s32((int32x4_t)v104, (int32x4_t)v104),  (int8x16_t)v104,  0xCuLL),  vnegq_f32(v62)),  v104,  (float32x4_t)vextq_s8( (int8x16_t)vuzp1q_s32((int32x4_t)v62, (int32x4_t)v62),  (int8x16_t)v62,  0xCuLL));
          int8x16_t v106 = vextq_s8((int8x16_t)vuzp1q_s32(v105, v105), (int8x16_t)v105, 0xCuLL);
          float32x4_t v107 = vmulq_f32(v62, v104);
          v106.i32[3] = vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v107, 2),  vaddq_f32(v107, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v107.f32, 1))).u32[0];
          float32x4_t v227 = (float32x4_t)v106;
        }

        else
        {
          int32x4_t v64 = (int32x4_t)vmulq_f32(v62, v62);
          *(float32x2_t *)v64.i8 = vadd_f32( (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v64, 2),  vadd_f32( *(float32x2_t *)v64.i8,  (float32x2_t)vdup_lane_s32(*(int32x2_t *)v64.i8, 1)));
          float32x2_t v65 = vrsqrte_f32(*(float32x2_t *)v64.i8);
          float32x2_t v66 = vmul_f32(v65, vrsqrts_f32(*(float32x2_t *)v64.i8, vmul_f32(v65, v65)));
          float32x4_t v67 = vmulq_n_f32(v62, vmul_f32(v66, vrsqrts_f32(*(float32x2_t *)v64.i8, vmul_f32(v66, v66))).f32[0]);
          __asm { FMOV            V4.2S, #1.0 }

          float32x2_t v73 = vrsqrte_f32(_D4);
          float32x2_t v74 = vmul_f32(v73, vrsqrts_f32(_D4, vmul_f32(v73, v73)));
          float32x4_t v75 = vaddq_f32( v67,  vmulq_n_f32((float32x4_t)xmmword_37600, vmul_f32(v74, vrsqrts_f32(_D4, vmul_f32(v74, v74))).f32[0]));
          float32x4_t v76 = vmulq_f32(v75, v75);
          float32x2_t v77 = (float32x2_t)vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v76, 2),  vaddq_f32(v76, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v76.f32, 1))).u64[0];
          if (v77.f32[0] <= 1.4211e-14)
          {
            float32x4_t v108 = vabsq_f32(v62);
            float v109 = v108.f32[1];
            float v110 = v108.f32[2];
            if (v108.f32[0] > v108.f32[1] || v108.f32[0] > v108.f32[2])
            {
              float32x4_t v112 = (float32x4_t)vextq_s8( (int8x16_t)vuzp1q_s32((int32x4_t)v62, (int32x4_t)v62),  (int8x16_t)v62,  0xCuLL);
              if (v109 <= v110) {
                float32x4_t v113 = vmlaq_f32(vmulq_f32(v62, (float32x4_t)xmmword_37630), (float32x4_t)xmmword_37600, v112);
              }
              else {
                float32x4_t v113 = vmlaq_f32(vmulq_f32(v62, (float32x4_t)xmmword_37640), (float32x4_t)xmmword_375E0, v112);
              }
            }

            else
            {
              float32x4_t v113 = vmlaq_f32( vmulq_f32(v62, (float32x4_t)xmmword_37610),  (float32x4_t)xmmword_37620,  (float32x4_t)vextq_s8( (int8x16_t)vuzp1q_s32((int32x4_t)v62, (int32x4_t)v62),  (int8x16_t)v62,  0xCuLL));
            }

            float32x4_t v114 = (float32x4_t)vextq_s8( (int8x16_t)vuzp1q_s32((int32x4_t)v113, (int32x4_t)v113),  (int8x16_t)v113,  0xCuLL);
            int32x4_t v115 = (int32x4_t)vmulq_f32(v113, v113);
            *(float32x2_t *)v115.i8 = vadd_f32( (float32x2_t)vdup_lane_s32(*(int32x2_t *)v115.i8, 1),  vadd_f32( (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v115, 2),  *(float32x2_t *)v115.i8));
            float32x2_t v116 = vrsqrte_f32(*(float32x2_t *)v115.i8);
            float32x2_t v117 = vmul_f32(v116, vrsqrts_f32(*(float32x2_t *)v115.i8, vmul_f32(v116, v116)));
            float32x4_t v99 = vmulq_n_f32(v114, vmul_f32(v117, vrsqrts_f32(*(float32x2_t *)v115.i8, vmul_f32(v117, v117))).f32[0]);
            v99.i32[3] = 0;
          }

          else
          {
            float32x2_t v78 = vrsqrte_f32(v77);
            float32x2_t v79 = vmul_f32(v78, vrsqrts_f32(v77, vmul_f32(v78, v78)));
            float32x4_t v80 = vmulq_n_f32(v75, vmul_f32(v79, vrsqrts_f32(v77, vmul_f32(v79, v79))).f32[0]);
            float32x4_t v81 = vaddq_f32(v62, v80);
            int32x4_t v82 = (int32x4_t)vmulq_f32(v81, v81);
            *(float32x2_t *)v82.i8 = vadd_f32( (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v82, 2),  vadd_f32( *(float32x2_t *)v82.i8,  (float32x2_t)vdup_lane_s32(*(int32x2_t *)v82.i8, 1)));
            float32x2_t v83 = vrsqrte_f32(*(float32x2_t *)v82.i8);
            float32x2_t v84 = vmul_f32(v83, vrsqrts_f32(*(float32x2_t *)v82.i8, vmul_f32(v83, v83)));
            float32x4_t v85 = vmulq_n_f32(v81, vmul_f32(v84, vrsqrts_f32(*(float32x2_t *)v82.i8, vmul_f32(v84, v84))).f32[0]);
            float32x4_t v86 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v62, (int32x4_t)v62), (int8x16_t)v62, 0xCuLL);
            float32x4_t v87 = vmulq_f32( (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v85, (int32x4_t)v85), (int8x16_t)v85, 0xCuLL),  vnegq_f32(v62));
            float32x4_t v88 = vmulq_f32(v62, v85);
            float32x4_t v89 = vmlaq_f32(v87, v85, v86);
            float32x4_t v90 = vaddq_f32(v80, (float32x4_t)xmmword_37600);
            int32x4_t v91 = (int32x4_t)vmulq_f32(v90, v90);
            *(float32x2_t *)v91.i8 = vadd_f32( (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v91, 2),  vadd_f32( *(float32x2_t *)v91.i8,  (float32x2_t)vdup_lane_s32(*(int32x2_t *)v91.i8, 1)));
            *(float32x2_t *)v86.f32 = vrsqrte_f32(*(float32x2_t *)v91.i8);
            *(float32x2_t *)v86.f32 = vmul_f32( *(float32x2_t *)v86.f32,  vrsqrts_f32( *(float32x2_t *)v91.i8,  vmul_f32(*(float32x2_t *)v86.f32, *(float32x2_t *)v86.f32)));
            float32x4_t v92 = vmulq_n_f32( v90,  vmul_f32( *(float32x2_t *)v86.f32,  vrsqrts_f32(*(float32x2_t *)v91.i8, vmul_f32(*(float32x2_t *)v86.f32, *(float32x2_t *)v86.f32))).f32[0]);
            int32x4_t v93 = (int32x4_t)vmlaq_f32( vmulq_f32( (float32x4_t)vextq_s8( (int8x16_t)vuzp1q_s32((int32x4_t)v92, (int32x4_t)v92),  (int8x16_t)v92,  0xCuLL),  vnegq_f32(v80)),  v92,  (float32x4_t)vextq_s8( (int8x16_t)vuzp1q_s32((int32x4_t)v80, (int32x4_t)v80),  (int8x16_t)v80,  0xCuLL));
            float32x4_t v94 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v93, v93), (int8x16_t)v93, 0xCuLL);
            float32x4_t v95 = vmulq_f32(v80, v92);
            v94.i32[3] = vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v95, 2),  vaddq_f32(v95, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v95.f32, 1))).u32[0];
            int32x4_t v96 = (int32x4_t)vnegq_f32(v94);
            int8x16_t v97 = (int8x16_t)vtrn2q_s32((int32x4_t)v94, vtrn1q_s32((int32x4_t)v94, v96));
            float32x4_t v98 = (float32x4_t)vrev64q_s32((int32x4_t)v94);
            v98.i32[0] = v96.i32[1];
            v98.i32[3] = v96.i32[2];
            float32x4_t v99 = vaddq_f32( vmlaq_lane_f32( vmulq_n_f32( v94,  vaddq_f32( (float32x4_t)vdupq_laneq_s32((int32x4_t)v88, 2),  vaddq_f32(v88, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v88.f32, 1))).f32[0]),  v98,  *(float32x2_t *)v89.f32,  1),  vmlaq_laneq_f32( vmulq_n_f32((float32x4_t)vextq_s8((int8x16_t)v94, (int8x16_t)v96, 8uLL), v89.f32[0]),  (float32x4_t)vextq_s8(v97, v97, 8uLL),  v89,  2));
          }

          float32x4_t v227 = v99;
        }

        float32x4_t v118 = vmulq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v267), v268), (float32x4_t)xmmword_37650);
        int32x4_t v119 = (int32x4_t)vnegq_f32(v223);
        int8x16_t v120 = (int8x16_t)vtrn2q_s32((int32x4_t)v223, vtrn1q_s32((int32x4_t)v223, v119));
        float32x4_t v121 = (float32x4_t)vrev64q_s32((int32x4_t)v223);
        v121.i32[0] = v119.i32[1];
        v121.i32[3] = v119.i32[2];
        float32x4_t v236 = vaddq_f32( vmlaq_lane_f32( vmulq_laneq_f32((float32x4_t)vextq_s8((int8x16_t)v223, (int8x16_t)v119, 8uLL), v118, 2),  (float32x4_t)vextq_s8(v120, v120, 8uLL),  *(float32x2_t *)v118.f32,  1),  vmlaq_laneq_f32(vmulq_n_f32(v223, v118.f32[0]), v121, v118, 3));
        GVSComputeRollPitchFromGravity(v270);
        float v123 = (float)(1.5533 - v122) / 0.50615;
        v124.i32[0] = 0;
        float v125 = 1.0;
        float v126 = fminf(fmaxf(v123, 0.0), 1.0);
        float32x4_t v127 = vmulq_f32(v236, (float32x4_t)xmmword_37660);
        *(float32x2_t *)v127.f32 = vadd_f32( *(float32x2_t *)v127.f32,  (float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v127, (int8x16_t)v127, 8uLL));
        v127.f32[0] = vaddv_f32(*(float32x2_t *)v127.f32);
        float32x4_t v128 = (float32x4_t)vbslq_s8( (int8x16_t)vdupq_lane_s32( (int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v127, v124)),  0),  (int8x16_t)vnegq_f32(v236),  (int8x16_t)v236);
        float v129 = 1.0 - v126;
        float32x4_t v130 = vsubq_f32((float32x4_t)xmmword_37660, v128);
        int8x16_t v131 = (int8x16_t)vmulq_f32(v130, v130);
        float32x4_t v230 = v128;
        float32x4_t v132 = vaddq_f32(v128, (float32x4_t)xmmword_37660);
        int8x16_t v133 = (int8x16_t)vmulq_f32(v132, v132);
        v135.f32[0] = atan2f( sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v131.i8, (float32x2_t)*(_OWORD *)&vextq_s8( v131,  v131,  8uLL)))),  sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v133.i8, (float32x2_t)*(_OWORD *)&vextq_s8( v133,  v133,  8uLL)))));
        float v134 = v135.f32[0] + v135.f32[0];
        _ZF = (float)(v135.f32[0] + v135.f32[0]) == 0.0;
        v135.i32[0] = 1.0;
        if (!_ZF) {
          v135.f32[0] = sinf(v134) / v134;
        }
        float32x2_t v136 = vrecpe_f32(v135);
        float32x2_t v137 = vmul_f32(v136, vrecps_f32(v135, v136));
        float32x2_t v138 = vrecps_f32(v135, v137);
        LODWORD(v139) = vmul_f32(v137, v138).u32[0];
        if ((float)(v134 * v129) != 0.0)
        {
          float v224 = v139;
          v138.f32[0] = sinf(v134 * v129);
          float v139 = v224;
          float v125 = v138.f32[0] / (float)(v134 * v129);
        }

        v138.f32[0] = v129 * (float)(v139 * v125);
        float32x4_t v140 = (float32x4_t)vdupq_lane_s32((int32x2_t)v138, 0);
        float v141 = v134 * v126;
        float v142 = 1.0;
        if (v141 != 0.0)
        {
          float32x4_t v222 = v140;
          float v225 = v139;
          float v143 = sinf(v141);
          float32x4_t v140 = v222;
          float v139 = v225;
          float v142 = v143 / v141;
        }

        float32x4_t v144 = (float32x4_t)xmmword_37660;
        float32x4_t v145 = vmlaq_f32(vmulq_n_f32(v230, v126 * (float)(v139 * v142)), (float32x4_t)xmmword_37660, v140);
        int8x16_t v146 = (int8x16_t)vmulq_f32(v145, v145);
        float32x2_t v147 = vadd_f32(*(float32x2_t *)v146.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v146, v146, 8uLL));
        if (vaddv_f32(v147) != 0.0)
        {
          float32x2_t v148 = vadd_f32(v147, (float32x2_t)vdup_lane_s32((int32x2_t)v147, 1));
          float32x2_t v149 = vrsqrte_f32(v148);
          float32x2_t v150 = vmul_f32(v149, vrsqrts_f32(v148, vmul_f32(v149, v149)));
          float32x4_t v144 = vmulq_n_f32(v145, vmul_f32(v150, vrsqrts_f32(v148, vmul_f32(v150, v150))).f32[0]);
        }

        int32x4_t v151 = (int32x4_t)vnegq_f32(v232);
        int8x16_t v152 = (int8x16_t)vtrn2q_s32((int32x4_t)v232, vtrn1q_s32((int32x4_t)v232, v151));
        float32x4_t v153 = (float32x4_t)vrev64q_s32((int32x4_t)v232);
        v153.i32[0] = v151.i32[1];
        v153.i32[3] = v151.i32[2];
        float32x4_t v154 = vaddq_f32( vmlaq_n_f32( vmulq_lane_f32( (float32x4_t)vextq_s8((int8x16_t)v232, (int8x16_t)v151, 8uLL),  *(float32x2_t *)v227.f32,  1),  (float32x4_t)vextq_s8(v152, v152, 8uLL),  v227.f32[0]),  vmlaq_laneq_f32(vmulq_laneq_f32(v232, v227, 3), v153, v227, 2));
        float32x4_t v155 = vmulq_f32(v154, (float32x4_t)xmmword_375F0);
        int32x4_t v156 = (int32x4_t)vnegq_f32(v155);
        int8x16_t v157 = (int8x16_t)vtrn2q_s32((int32x4_t)v155, vtrn1q_s32((int32x4_t)v155, v156));
        float32x4_t v158 = (float32x4_t)vrev64q_s32((int32x4_t)v155);
        v158.i32[0] = v156.i32[1];
        v158.i32[3] = v156.i32[2];
        _Q1 = vaddq_f32( vmlaq_n_f32( vmulq_lane_f32( (float32x4_t)vextq_s8((int8x16_t)v155, (int8x16_t)v156, 8uLL),  *(float32x2_t *)v144.f32,  1),  (float32x4_t)vextq_s8(v157, v157, 8uLL),  v144.f32[0]),  vmlaq_laneq_f32(vmulq_laneq_f32(v155, v144, 3), v158, v144, 2));
        int32x4_t v160 = (int32x4_t)vnegq_f32(_Q1);
        int8x16_t v161 = (int8x16_t)vtrn2q_s32((int32x4_t)_Q1, vtrn1q_s32((int32x4_t)_Q1, v160));
        _Q4 = vmlaq_n_f32( vmulq_lane_f32( (float32x4_t)vextq_s8((int8x16_t)_Q1, (int8x16_t)v160, 8uLL),  *(float32x2_t *)v154.f32,  1),  (float32x4_t)vextq_s8(v161, v161, 8uLL),  v154.f32[0]);
        _Q3 = (float32x4_t)vrev64q_s32((int32x4_t)_Q1);
        _Q3.i32[0] = v160.i32[1];
        _Q3.i32[3] = v160.i32[2];
        _Q2 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(_Q1, v154, 3), _Q3, v154, 2), _Q4);
        _Q3.i32[0] = _Q2.i32[1];
        _Q4.i32[0] = _Q2.i32[3];
        v154.f32[0] = vmlas_n_f32(vmuls_lane_f32(_Q2.f32[2], _Q2, 3), _Q2.f32[1], _Q2.f32[0]);
        __asm
        {
          FMLA            S1, S3, V2.S[1]
          FMLA            S1, S4, V2.S[3]
          FMLS            S1, S2, V2.S[0]; float
        }

        float v165 = atan2f(v154.f32[0] + v154.f32[0], _Q1.f32[0]);
        __double2 v166 = __sincos_stret(v165 * 0.5);
        v269[3] = *(float32x2_t *)&v166.__sinval;
        v269[0] = *(float32x2_t *)&v166.__cosval;
        v267.f64[0] = FigMotionMultiplyQuaternions(v267.f64, (double *)v269);
        v267.f64[1] = v167;
        v268.f64[0] = v168;
        v268.f64[1] = v169;
        uint64_t v12 = a1;
      }
    }
  }

LABEL_52:
  int v231 = v23;
  int v233 = a2;
  float32x2_t v170 = *(float32x2_t *)(*((void *)&v245 + 1) + 8 * v9);
  v269[0] = vmul_n_f32(v265, *((float *)&v251 + 1));
  if (*(int *)(v12 + 176) >= 1)
  {
    uint64_t v171 = 0LL;
    uint64_t v237 = v12 + 128;
    float v172 = v14 - v15;
    float32x2_t v173 = vmul_n_f32(vsub_f32(v170, v266), *((float *)&v251 + 1));
    uint64_t v174 = v11;
    float v175 = (float64x2_t *)(v12 + 304);
    double v176 = v172;
    uint64_t v234 = (int *)(v12 + 136);
    uint64_t v177 = v12 + 27840;
    double v178 = (float *)(v12 + 27120);
    uint64_t v179 = v8;
    while (1)
    {
      if (*((int *)v8 + 503) < 1)
      {
        if (*v8)
        {
          float v182 = (uint64_t *)(*(void *)(v258 + 8 * v171) + 32 * v9);
          uint64_t v183 = &v267;
        }

        else
        {
          float v184 = *((float *)v8 + 593);
          uint64_t v185 = v12;
          v240.f64[0] = GVSComputeGaussianAverageQuaternion((uint64_t)&v245, v171, v233, v231 != 0, 0LL, 0LL, a5, v184);
          v240.f64[1] = v186;
          v241.f64[0] = v187;
          v241.f64[1] = v188;
          if (*(void *)(v185 + 29520))
          {
            v240.f64[0] = FigMotionMultiplyQuaternions((double *)(v260 + 32 * v9), v240.f64);
            v240.f64[1] = v189;
            v241.f64[0] = v190;
            v241.f64[1] = v191;
          }

          float v182 = (uint64_t *)(*(void *)(v258 + 8 * v171) + 32 * v9);
          uint64_t v183 = &v240;
        }

        *(double *)uint64_t v177 = FigMotionMultiplyByInverseOfQuaternion(v183->f64, v182);
        *(void *)(v177 + 8) = v192;
        *(void *)(v177 + 16) = v193;
        *(void *)(v177 + 24) = v194;
      }

      else
      {
        id v180 = (_OWORD *)(v259 + 32 * v9);
        __int128 v181 = v180[1];
        *(_OWORD *)uint64_t v177 = *v180;
        *(_OWORD *)(v177 + 16) = v181;
      }

      *(float32x2_t *)&v240.f64[0] = v173;
      if (v13) {
        *(float32x2_t *)&v240.f64[0] = vadd_f32(v173, *(float32x2_t *)(*(void *)(v13[1] + 8 * v174) + 8 * v171));
      }
      uint64_t v195 = GVSComputeTransformFromCameraMotion((double *)v177, v175, (uint64_t)&v251, (float32x2_t *)&v240, v269, v178);
      if ((_DWORD)v195)
      {
        uint64_t v217 = v195;
        uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  3365LL,  v217);
        return v217;
      }

      if (v13
        && (uint64_t v196 = v13[2]) != 0
        && (([*(id *)(v196 + 240 * (int)v174) isValid] & 1) != 0
         || [*(id *)(v13[2] + 240 * (int)v174 + 8) isValid]))
      {
        uint64_t v197 = GVSCheckDistortedTransformFits( v178,  (double *)v257 + 1,  v234,  v13[2] + 240LL * (int)v174,  v176 > 0.2468,  &v264);
        if ((_DWORD)v197)
        {
          uint64_t v217 = v197;
          uint64_t v221 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v221,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  3370LL,  v217);
          return v217;
        }

        BOOL v198 = v264;
        uint64_t v12 = a1;
      }

      else
      {
        uint64_t v199 = limitTransformToOverscan(v237, (double *)v257 + 1, (uint64_t)v178, *((float *)&v252 + 1));
        if ((_DWORD)v199)
        {
          uint64_t v217 = v199;
          uint64_t v220 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v220,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  3374LL,  v217);
          return v217;
        }

        uint64_t v12 = a1;
        BOOL v198 = *(float *)(a1 + 196) >= 1.0;
        BOOL v264 = *(float *)(a1 + 196) >= 1.0;
      }

      __int128 v8 = v179;
      if (!a3 || v198)
      {
        ++v171;
        v177 += 32LL;
        v178 += 9;
      }

      break;
    }
  }

  if (!*v8)
  {
    int v200 = *(_DWORD *)(v12 + 176);
    if (v200 >= 1) {
      int v201 = v200 - 1;
    }
    else {
      int v201 = *(_DWORD *)(v12 + 176);
    }
    int v202 = v200 / 2;
    uint64_t v203 = v12;
    v240.f64[0] = FigMotionMultiplyQuaternions( (double *)(*(void *)(v258 + 8LL * (v201 >> 1)) + 32 * v9),  (double *)(v12 + 32 * ((uint64_t)v201 >> 1) + 27840));
    v240.f64[1] = v204;
    v241.f64[0] = v205;
    v241.f64[1] = v206;
    if (v202 == v201 >> 1)
    {
      float64x2_t v267 = v240;
      float64x2_t v268 = v241;
    }

    else
    {
      double v271 = FigMotionMultiplyQuaternions( (double *)(*(void *)(v258 + 8LL * v202) + 32 * v9),  (double *)(v203 + 32LL * v202 + 27840));
      uint64_t v272 = v207;
      uint64_t v273 = v208;
      uint64_t v274 = v209;
      v267.f64[0] = GVSInterpolateQuaternionsLERP((uint64_t)&v271, (uint64_t)&v240, 1, 0LL, 0.5);
      v267.f64[1] = v210;
      v268.f64[0] = v211;
      v268.f64[1] = v212;
    }

    uint64_t v12 = a1;
  }

  float64x2_t v213 = v268;
  *(float64x2_t *)(v12 + 28064) = v267;
  *(float64x2_t *)(v12 + 28080) = v213;
  *(float32x2_t *)(v12 + 28192) = v266;
  *(float32x2_t *)(v12 + 28200) = v265;
  if (*(_BYTE *)(*((void *)&v246 + 1) + v9))
  {
    v240.f64[0] = FigMotionMultiplyByInverseOfQuaternion( v267.f64,  (uint64_t *)(*(void *)(v245 + 8LL * *(int *)(v12 + 176)) + 32 * v9));
    v240.f64[1] = v214;
    v241.f64[0] = v215;
    v241.f64[1] = v216;
    double v271 = 0.0;
    GVSComputeTranslationFromCameraMotion(v240.f64, (float32x2_t *)&v271, *((float *)&v251 + 1));
  }

  uint64_t v217 = 0LL;
  *uint64_t v228 = v264;
  return v217;
}

uint64_t limitTransformToOverscan(uint64_t a1, double *a2, uint64_t a3, float a4)
{
  float v6 = 1.0;
  if (*(_DWORD *)(a1 + 40) <= 2u)
  {
    *(void *)(a3 + 24) = 0LL;
    *(_DWORD *)(a3 + 32) = 1065353216;
  }

  uint64_t result = GVSFindBestPerspectiveTransform((float *)a3, a2, (int *)(a1 + 24), &v6, a4);
  if ((_DWORD)result)
  {
    *(_BYTE *)(a1 + 74) = 1;
  }

  else if (v6 < *(float *)(a1 + 68))
  {
    *(float *)(a1 + 68) = v6;
  }

  return result;
}

uint64_t sbp_gvs_getPixelBufferFromPool( __CVPixelBufferPool *a1, const __CFDictionary *a2, void *a3, unsigned int a4, _DWORD *a5, int a6, CVPixelBufferRef *a7)
{
  double v14 = a3;
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace(822152385LL, 40LL, 0LL, 0LL, 0LL);
  }
  if (v14 && a6)
  {
    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    ++*a5;
  }

  CVReturn PixelBufferWithAuxAttributes = CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(kCFAllocatorDefault, a1, a2, a7);
  if (a4 && PixelBufferWithAuxAttributes == -6689)
  {
    unsigned int v16 = 1000;
    do
    {
      usleep(0x3E8u);
      CVReturn PixelBufferWithAuxAttributes = CVPixelBufferPoolCreatePixelBufferWithAuxAttributes( kCFAllocatorDefault,  a1,  a2,  a7);
      if (PixelBufferWithAuxAttributes != -6689) {
        break;
      }
      BOOL v17 = v16 > a4;
      v16 += 1000;
    }

    while (!v17);
  }

  uint64_t v18 = PixelBufferWithAuxAttributes;
  if (PixelBufferWithAuxAttributes)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", v18, v7, v20, v21, v22, v23, v24, v25);
    if (*a7)
    {
      CFRelease(*a7);
      *a7 = 0LL;
    }
  }

  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace(822152386LL, 40LL, v18, 0LL, 0LL);
  }

  return v18;
}

uint64_t sbp_internalCreateSampleBufferWithNewPixelBuffer( __CVBuffer *a1, void *a2, void *a3, const CMSampleTimingInfo *a4, CMSampleBufferRef *a5)
{
  id v9 = a2;
  id v10 = a3;
  CMVideoFormatDescriptionRef v11 = (CMVideoFormatDescriptionRef)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v10]);

  CMVideoFormatDescriptionRef formatDescriptionOut = v11;
  if (!v11) {
    goto LABEL_12;
  }
  double v29 = a4;
  float64_t v30 = a5;
  float64_t v31 = v9;
  id v32 = v10;
  CFDictionaryRef Extensions = CMFormatDescriptionGetExtensions(v11);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(Extensions);
  double v14 = kCVImageBufferColorPrimariesKey;
  double v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:kCVImageBufferColorPrimariesKey]);
  unsigned int v16 = kCVImageBufferTransferFunctionKey;
  double v33 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:kCVImageBufferTransferFunctionKey]);
  BOOL v17 = kCVImageBufferYCbCrMatrixKey;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:kCVImageBufferYCbCrMatrixKey]);
  __int128 v19 = (void *)CVBufferCopyAttachment(a1, v14, 0LL);
  __int128 v20 = (void *)CVBufferCopyAttachment(a1, v16, 0LL);
  __int128 v21 = (void *)CVBufferCopyAttachment(a1, v17, 0LL);
  if (v15 == v19) {
    unsigned int v22 = 1;
  }
  else {
    unsigned int v22 = [v15 isEqual:v19];
  }
  id v9 = v31;
  if (v33 != v20) {
    v22 &= [v33 isEqual:v20];
  }
  if (v18 != v21)
  {
    goto LABEL_9;
  }

  if ((v22 & 1) == 0)
  {
LABEL_9:
    CMVideoFormatDescriptionRef formatDescriptionOut = 0LL;
    [v31 setObject:0 forKeyedSubscript:v32];
    CMVideoFormatDescriptionRef v11 = 0LL;
  }

LABEL_12:
  int v23 = kCFAllocatorDefault;
  uint64_t v24 = CMVideoFormatDescriptionCreateForImageBuffer(kCFAllocatorDefault, a1, &formatDescriptionOut);
  if ((_DWORD)v24)
  {
    uint64_t v25 = v24;
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  8741LL,  v25);
    goto LABEL_20;
  }

  [v9 setObject:formatDescriptionOut forKeyedSubscript:v10];
  if (formatDescriptionOut)
  {
    CFRelease(formatDescriptionOut);
    CMVideoFormatDescriptionRef v11 = formatDescriptionOut;
  }

  else
  {
    CMVideoFormatDescriptionRef v11 = 0LL;
  }

LABEL_20:
  return v25;
}

uint64_t sbp_gvs_createStabilizedPixelBuffer(uint64_t a1, CMSampleBufferRef sbuf, int *a3, __CVBuffer *a4)
{
  if (!a1)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "storage",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  4762LL,  0);
    return 4294954516LL;
  }

  if (!sbuf)
  {
    uint64_t v71 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v71,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "sourceSampleBuffer",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  4763LL,  0);
    return 4294954516LL;
  }

  if (!a4)
  {
    uint64_t v72 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v72,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "destPixelBuffer",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  4764LL,  0);
    return 4294954516LL;
  }

  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  if (!ImageBuffer)
  {
    uint64_t v73 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v73,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "sourcePixelBuffer",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  4767LL,  0);
    return 4294954516LL;
  }

  CVImageBufferRef v10 = ImageBuffer;
  float32x2_t v79 = v4;
  uint64_t v11 = a1 + 27116;
  if (CMGetAttachment(ImageBuffer, @"InputDepthPixelBuffer", 0LL))
  {
    *(double *)&CFTypeRef value = 0.0;
    if (*(_BYTE *)(a1 + 25))
    {
      if (*(_DWORD *)v11 == 2) {
        int v12 = 66000;
      }
      else {
        int v12 = 0;
      }
      if ((*(_DWORD *)v11 | 2) == 3) {
        unsigned int v13 = 66000;
      }
      else {
        unsigned int v13 = v12;
      }
    }

    else
    {
      unsigned int v13 = 0;
    }

    double v14 = (__CVPixelBufferPool *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 48) objectForKeyedSubscript:@"OutputBufferDepth"]);
    double v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 56) objectForKeyedSubscript:@"OutputBufferDepth"]);
    uint64_t PixelBufferFromPool = sbp_gvs_getPixelBufferFromPool(v14, v15, 0LL, v13, 0LL, 0, (CVPixelBufferRef *)&value);

    if ((_DWORD)PixelBufferFromPool)
    {
      uint64_t v74 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v74,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  4776LL,  PixelBufferFromPool);
      return PixelBufferFromPool;
    }

    CMSetAttachment(v10, @"OutputDepthPixelBuffer", value, 0);
  }

  uint64_t v17 = kFigCaptureSampleBufferAttachmentKey_LowResImageUsedByVideoEncoder;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 48) objectForKeyedSubscript:kFigCaptureSampleBufferAttachmentKey_LowResImageUsedByVideoEncoder]);

  if (v18)
  {
    *(double *)&CFTypeRef value = 0.0;
    if (*(_BYTE *)(a1 + 25))
    {
      if (*(_DWORD *)v11 == 2) {
        int v19 = 66000;
      }
      else {
        int v19 = 0;
      }
      if ((*(_DWORD *)v11 | 2) == 3) {
        unsigned int v20 = 66000;
      }
      else {
        unsigned int v20 = v19;
      }
    }

    else
    {
      unsigned int v20 = 0;
    }

    __int128 v21 = (__CVPixelBufferPool *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) objectForKeyedSubscript:v17]);
    unsigned int v22 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectForKeyedSubscript:v17]);
    uint64_t PixelBufferFromPool = sbp_gvs_getPixelBufferFromPool(v21, v22, 0LL, v20, 0LL, 0, (CVPixelBufferRef *)&value);

    if ((_DWORD)PixelBufferFromPool)
    {
      uint64_t v75 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v75,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  4816LL,  PixelBufferFromPool);
      return PixelBufferFromPool;
    }

    CMSetAttachment(v10, @"LowResolutionImageUsedByVideoEncoder", value, 0);
  }

  int v23 = *(_DWORD *)(a1 + 172);
  uint64_t v24 = *(void *)(a1 + 27376);
  if ((v23 - 1) >= 2)
  {
    if (v23 != 3 && v23)
    {
      uint64_t PixelBufferFromPool = 4294954516LL;
    }

    else
    {
      int v26 = *(_DWORD *)(a1 + 128);
      int v25 = *(_DWORD *)(a1 + 132);
      *(double *)&CFTypeRef value = 0.0;
      double v81 = 0.0;
      *(double *)&int32x4_t v82 = (double)v26;
      *(double *)&float32x2_t v83 = (double)v25;
      if (*(_BYTE *)(a1 + 224))
      {
        int v27 = 0;
        int v28 = a3[3];
        if (v28 < 1
          || v28 > v25
          || (int v29 = a3[2], v29 < 1)
          || v29 > v26
          || (int v30 = a3[1], v31 = v28 + v30, v28 + v30 < 1)
          || v31 > v25
          || v30 < 0
          || v30 >= v25
          || (int v32 = *a3, *a3 < 0)
          || v32 >= v26
          || v29 + v32 < 1)
        {
          int v33 = 0;
        }

        else
        {
          int v33 = 0;
          if (v29 + v32 <= v26)
          {
            if ((v30 & 1) != 0)
            {
              int v34 = v30 - 1;
              if (v30 != v25 - 1) {
                int v34 = v30 + 1;
              }
              if (v34 >= v25) {
                int v30 = v25 - 1;
              }
              else {
                int v30 = v34;
              }
              int v28 = v31 - v30;
            }

            if ((v28 & 1) != 0)
            {
              int v25 = v28 - 1;
              if (v28 <= 0) {
                int v25 = 0;
              }
            }

            else
            {
              int v25 = v28;
            }

            int v26 = a3[2];
            int v27 = v30;
            int v33 = *a3;
          }
        }

        *(double *)&CFTypeRef value = (double)v33;
        double v81 = (double)v27;
        *(double *)&int32x4_t v82 = (double)v26;
        *(double *)&float32x2_t v83 = (double)v25;
      }

      if (*(_DWORD *)(a1 + 29564) && (uint64_t v38 = *(void *)(a1 + 29608)) != 0 && *(_BYTE *)(a1 + 29627))
      {
        if (gGMFigKTraceEnabled == 1)
        {
          _getPresentationTimeStampForSampleBuffer(sbuf, (uint64_t)&time);
          Float64 Seconds = CMTimeGetSeconds(&time);
          kdebug_trace(822152385LL, 45LL, *(void *)&Seconds, 0LL, 0LL);
          uint64_t v38 = *(void *)(a1 + 29608);
        }

        unsigned int v40 = [*(id *)(a1 + 29600) computeLTCsCorrection:v38 forPTS:*(_DWORD *)(a1 + 29596) > 2 shouldShutdown:*(_BYTE *)(a1 + 29749) != 0 skipFrame:*(double *)(a1 + 29616)];
        if (v40)
        {
          unsigned int v77 = v40;
          fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v77,  v4,  v4,  (const char *)value,  LODWORD(v81),  v82,  v83,  LODWORD(time.value));
          sbp_ltm_deallocateLtcCorrectionTexture(a1);
        }

        if (gGMFigKTraceEnabled == 1) {
          kdebug_trace(822152386LL, 45LL, 0LL, 0LL, 0LL);
        }
      }

      else
      {
        int v41 = *(_DWORD *)(a1 + 29632);
        BOOL v42 = __OFSUB__(v41, 1);
        int v43 = v41 - 1;
        if (v43 < 0 == v42) {
          *(_DWORD *)(a1 + 29632) = v43;
        }
      }

      id v44 = sbp_gvs_transformImageRender(a1, sbuf, a4, (uint64_t)&value, a1 + 128, v24, *(void **)(a1 + 29608));
      if (!(_DWORD)v44)
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        if (Mutable)
        {
          float v46 = Mutable;
          float v47 = (const void *)kFigCaptureVideoSTFAnalyticsKey_VideoSTFLTMApplied;
          float v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  *(unsigned __int8 *)(a1 + 29628)));
          CFDictionarySetValue(v46, v47, v48);

          __float2 v49 = (const void *)kFigCaptureVideoSTFAnalyticsKey_CancellationReason;
          float32x4_t v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  *(unsigned int *)(a1 + 29636)));
          CFDictionarySetValue(v46, v49, v50);

          float32x4_t v51 = (const void *)kFigCaptureVideoSTFAnalyticsKey_AnalyticsVersion;
          float32x4_t v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(a1 + 29600) videoSTFAnalyticsVersion]));
          CFDictionarySetValue(v46, v51, v52);

          if (*(_BYTE *)(a1 + 29628))
          {
            unint64_t v54 = (unint64_t)[*(id *)(a1 + 29600) getAnalyticsData:*(double *)(a1 + 29616)];
            if ((_DWORD)v54)
            {
              fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
              LODWORD(v78) = v54;
              FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v78,  v79,  v79,  (const char *)value,  LODWORD(v81),  v82,  v83,  LODWORD(time.value));
            }

            else
            {
              int v55 = v53;
              float32x4_t v56 = (const void *)kFigCaptureVideoSTFAnalyticsKey_MeanCorrectionLevel;
              float32x4_t v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", HIDWORD(v54)));
              CFDictionarySetValue(v46, v56, v57);

              int32x4_t v58 = (const void *)kFigCaptureVideoSTFAnalyticsKey_MaxCorrectionLevel;
              LODWORD(v59) = v55;
              float32x4_t v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v59));
              CFDictionarySetValue(v46, v58, v60);
            }
          }

          CMSetAttachment(sbuf, kFigVideoStabilizationSampleBufferAttachmentKey_VideoSTFAnalytics, v46, 1u);
          CFRelease(v46);
        }

        else
        {
          fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          LODWORD(v78) = 0;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v78,  v79,  v79,  (const char *)value,  LODWORD(v81),  v82,  v83,  LODWORD(time.value));
        }

        goto LABEL_80;
      }

      uint64_t PixelBufferFromPool = (uint64_t)v44;
      uint64_t v76 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v78) = PixelBufferFromPool;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v76,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  4652LL,  v78);
    }

LABEL_57:
    uint64_t v37 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v78) = PixelBufferFromPool;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v37,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  4881LL,  v78);
    return PixelBufferFromPool;
  }

  id v35 = sbp_gvs_transformImageRender(a1, sbuf, a4, 0LL, a1 + 128, *(void *)(a1 + 27376), 0LL);
  if ((_DWORD)v35)
  {
    uint64_t PixelBufferFromPool = (uint64_t)v35;
    uint64_t v36 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v36,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  4682LL,  PixelBufferFromPool);
    goto LABEL_57;
  }

LABEL_80:
  if (*(_BYTE *)(v11 + 2612))
  {
    CFDictionaryRef v61 = CVBufferCopyAttachments(a4, kCVAttachmentMode_ShouldPropagate);
    if (v61) {
      float32x4_t v62 = (const __CFDictionary *)CFAutorelease(v61);
    }
    else {
      float32x4_t v62 = 0LL;
    }
    float32x4_t v63 = kCVImageBufferColorPrimariesKey;
    int32x4_t v64 = CFDictionaryGetValue(v62, kCVImageBufferColorPrimariesKey);
    float32x2_t v65 = kCVImageBufferTransferFunctionKey;
    float32x2_t v66 = CFDictionaryGetValue(v62, kCVImageBufferTransferFunctionKey);
    float32x4_t v67 = kCVImageBufferYCbCrMatrixKey;
    uint64_t v68 = CFDictionaryGetValue(v62, kCVImageBufferYCbCrMatrixKey);
    CVBufferPropagateAttachments(v10, a4);
    CVBufferSetAttachment(a4, v63, v64, kCVAttachmentMode_ShouldPropagate);
    CVBufferSetAttachment(a4, v65, v66, kCVAttachmentMode_ShouldPropagate);
    CVBufferSetAttachment(a4, v67, v68, kCVAttachmentMode_ShouldPropagate);
  }

  return 0LL;
}

id sbp_gvs_transformImageRender( uint64_t a1, opaqueCMSampleBuffer *a2, __CVBuffer *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13 = a7;
  double v14 = COERCE_DOUBLE(vrev64_s32(*(int32x2_t *)(a5 + 60)));
  int v15 = *(_DWORD *)(a1 + 172);
  if ((v15 - 1) >= 3)
  {
    if (v15) {
      id v18 = 0LL;
    }
    else {
      id v18 = (id)AffineTransformArrayApply( *(void **)(a1 + 88),  a2,  a3,  a6,  a4,  v13,  COERCE_DOUBLE(vrev64_s32(*(int32x2_t *)(a5 + 52))),  v14);
    }
  }

  else
  {
    id v16 = *(id *)(a1 + 112);
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a2);
    id v18 = objc_msgSend( v16,  "enqueuePixelBufferForRendering:inputValidBufferRect:metadata:ltmLUT:outputPixelBuffer:transformCounts:transf orms3x3:transformStrides:",  ImageBuffer,  a4,  CMGetAttachment(a2, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0),  v13,  a3,  a6,  COERCE_DOUBLE(vrev64_s32(*(int32x2_t *)(a5 + 52))),  v14);
  }

  return v18;
}

void invert3x3Matrix(uint64_t a1, float *a2)
{
  uint64_t v4 = 0LL;
  float v5 = 1.0;
  float v6 = 0.0;
  do
  {
    uint64_t v7 = 0LL;
    int v8 = 0;
    int v9 = 0;
    CVImageBufferRef v10 = &v29;
    uint64_t v11 = a1;
    do
    {
      for (uint64_t i = 0LL; i != 3; ++i)
      {
        v10[i] = 0.0;
        if (v7 && v4 != i)
        {
          *(&v29 + 3 * v9 + v8) = *(float *)(v11 + 4 * i);
          if (v8 > 0) {
            ++v9;
          }
          int v8 = v8 < 1;
        }
      }

      ++v7;
      v11 += 12LL;
      v10 += 3;
    }

    while (v7 != 3);
    float v6 = v6 + (float)(v5 * (float)(*(float *)(a1 + 4 * v4) * (float)((float)(v29 * v32) - (float)(v30 * v31))));
    float v5 = -v5;
    ++v4;
  }

  while (v4 != 3);
  if (v6 == 0.0)
  {
    puts("\nMATRIX IS NOT INVERSIBLE");
  }

  else
  {
    for (uint64_t j = 0LL; j != 3; ++j)
    {
      for (uint64_t k = 0LL; k != 3; ++k)
      {
        uint64_t v15 = 0LL;
        int v16 = 0;
        int v17 = 0;
        id v18 = &v29;
        uint64_t v19 = a1;
        do
        {
          for (uint64_t m = 0LL; m != 3; ++m)
          {
            v18[m] = 0.0;
            if (v15 != j && k != m)
            {
              *(&v29 + 3 * v17 + v16) = *(float *)(v19 + 4 * m);
              if (v16 > 0) {
                ++v17;
              }
              int v16 = v16 < 1;
            }
          }

          ++v15;
          v19 += 12LL;
          v18 += 3;
        }

        while (v15 != 3);
        float v21 = powf(-1.0, (float)(k + j));
        float v22 = v21 * (float)((float)(v29 * v32) - (float)(v30 * v31));
        if (v22 == 0.0) {
          float v22 = 0.0;
        }
        v28[3 * j + k] = v22;
      }
    }

    float v23 = v28[1];
    float v24 = v28[2];
    float v25 = v28[3] / v6;
    *a2 = v28[0] / v6;
    a2[1] = v25;
    float v26 = v28[7];
    a2[2] = v28[6] / v6;
    a2[3] = v23 / v6;
    float v27 = v28[5];
    a2[4] = v28[4] / v6;
    a2[5] = v26 / v6;
    a2[6] = v24 / v6;
    a2[7] = v27 / v6;
    a2[8] = v28[8] / v6;
  }

float64x2_t _computeProjectedPoints(float *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0LL;
  char v7 = 1;
  do
  {
    char v8 = v7;
    GVSComputePerspectiveProjectedPoint( a1,  (float *)&v11,  (float *)&v10,  *(float *)(a2 + 8 * v6),  *(float *)(a2 + 8 * v6 + 4));
    char v7 = 0;
    float64x2_t result = vcvtq_f64_f32((float32x2_t)__PAIR64__(v10, v11));
    *(float64x2_t *)(a3 + 16 * v6) = result;
    uint64_t v6 = 1LL;
  }

  while ((v8 & 1) != 0);
  return result;
}

void sbp_gvs_UpdateSmoothParameter(uint64_t *a1, double *a2, double a3, double a4)
{
  double v5 = fabs(FigMotionMultiplyByInverseOfQuaternion(a2, a1));
  if (v5 < a4)
  {
    acos(a4);
    acos(v5);
  }

uint64_t sbp_gvs_iir_ComputeCorrection( uint64_t a1, uint64_t *a2, double *a3, uint64_t a4, float32x2_t *a5, BOOL *a6, float a7)
{
  v26[0] = v12;
  v26[1] = v13;
  v26[2] = v14;
  v26[3] = v15;
  v25[0] = FigMotionMultiplyByInverseOfQuaternion(v26, a2);
  v25[1] = v16;
  v25[2] = v17;
  v25[3] = v18;
  uint64_t v19 = GVSComputeTransformFromCameraMotion(v25, (float64x2_t *)(a1 + 304), a4, a5, 0LL, v27);
  if ((_DWORD)v19)
  {
    uint64_t v20 = v19;
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  7110LL,  v20);
LABEL_7:
    BOOL v21 = 1;
    goto LABEL_4;
  }

  *(_DWORD *)(a1 + 196) = 1065353216;
  uint64_t v20 = limitTransformToOverscan(a1 + 128, (double *)(a4 + 104), (uint64_t)v27, *(float *)(a4 + 20));
  if ((_DWORD)v20)
  {
    uint64_t v24 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v24,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  7115LL,  v20);
    goto LABEL_7;
  }

  BOOL v21 = *(float *)(a1 + 196) >= 1.0;
LABEL_4:
  *a6 = v21;
  return v20;
}

id _createNSArray(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  for (uint64_t i = 0LL; i != 28; i += 4LL)
  {
    LODWORD(v3) = *(_DWORD *)(a1 + i);
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v3));
    [v2 addObject:v5];
  }

  return v2;
}

uint64_t GVSComputeTransforms( uint64_t a1, uint64_t a2, uint64_t __n, uint64_t a4, uint64_t a5, _OWORD *__src, float a7, float a8, float a9, double a10, int8x16_t a11)
{
  unsigned int v11 = __src;
  unint64_t v42 = __PAIR64__(LODWORD(a10), LODWORD(a9));
  unsigned int v16 = *(_DWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 74))
  {
    int8x16_t v17 = (int8x16_t)xmmword_37620;
    *__src = xmmword_37620;
    __src[1] = xmmword_37620;
    *((_DWORD *)__src + 8) = 1065353216;
    v17.i32[0] = *(_DWORD *)(__n + 20);
    FigMotionApplyDigitalZoomToTransform(1, (float *)__src, v17, *(int32x4_t *)a2, *(double *)(a2 + 8), a10, a11);
  }

  if (*(int *)(a1 + 60) < 1)
  {
    GVSApplyTransformLimit(a1, (double *)(__n + 104), v16 < 3, (uint64_t)v11, *(float *)(__n + 20));
  }

  else
  {
    uint64_t v18 = *(int *)(a1 + 52);
    if ((int)v18 > 0)
    {
      uint64_t v37 = (float64x2_t *)a2;
      uint64_t v19 = 0LL;
      int v20 = *(_DWORD *)(a1 + 12);
      int v21 = v20 + *(_DWORD *)(a1 + 20) - 1;
      uint64_t v22 = (uint64_t)v11;
      int v36 = v20;
      do
      {
        if (*(_BYTE *)(a1 + 74))
        {
          if (v19)
          {
            __int128 v23 = *v11;
            __int128 v24 = v11[1];
            *(_DWORD *)(v22 + 32) = *((_DWORD *)v11 + 8);
            *(_OWORD *)uint64_t v22 = v23;
            *(_OWORD *)(v22 + 16) = v24;
          }
        }

        else
        {
          if (v20 >= v21) {
            int v20 = v21;
          }
          unint64_t v41 = __PAIR64__(LODWORD(a8), LODWORD(a7));
          if (a5) {
            unint64_t v41 = (unint64_t)vadd_f32( (float32x2_t)__PAIR64__(LODWORD(a8), LODWORD(a7)),  *(float32x2_t *)(a5 + 8 * v19));
          }
          float v25 = (float)((*(_DWORD *)(a1 + 48) - 1) * (v20 - v36)) / (float)((float)*(int *)(a1 + 20) + -1.0);
          uint64_t v26 = a4 + 32LL * (int)vcvtms_s32_f32(v25);
          FigMotionInterpolateQuaternionsByAngle(v26, (double *)(v26 + 32), v25 - (float)(int)floorf(v25));
          v43[0] = v27;
          v43[1] = v28;
          v43[2] = v29;
          v43[3] = v30;
          GVSComputeTransformFromCameraMotion(v43, v37, __n, (float32x2_t *)&v41, (float32x2_t *)&v42, (float *)v22);
        }

        GVSApplyTransformLimit(a1, (double *)(__n + 104), v16 < 3, v22, *(float *)(__n + 20));
        ++v19;
        v20 += *(_DWORD *)(a1 + 60);
        uint64_t v18 = *(int *)(a1 + 52);
        v22 += 36LL;
      }

      while (v19 < v18);
    }

    if (*(int *)(a1 + 56) >= 2)
    {
      size_t v31 = 36 * v18;
      int v32 = 1;
      do
        memcpy((char *)v11 + 36 * *(_DWORD *)(a1 + 52) * v32++, v11, v31);
      while (v32 < *(_DWORD *)(a1 + 56));
    }
  }

  if (*(_BYTE *)(a1 + 75) && *(_DWORD *)(a1 + 56) * *(_DWORD *)(a1 + 52) >= 1)
  {
    uint64_t v33 = 0LL;
    float v34 = (float)(*(_DWORD *)(a1 + 16) + 2 * *(_DWORD *)(a1 + 8));
    do
    {
      FigMotionPostMultiplyScalingTranslationToTransform((float *)v11, -1.0, v34, 1.0, 0.0);
      ++v33;
      unsigned int v11 = (_OWORD *)((char *)v11 + 36);
    }

    while (v33 < *(int *)(a1 + 56) * (uint64_t)*(int *)(a1 + 52));
  }

  return 0LL;
}

float GVSApplyTransformLimit(uint64_t a1, double *a2, int a3, uint64_t a4, float result)
{
  int v6 = *(_DWORD *)(a1 + 24);
  int v5 = *(_DWORD *)(a1 + 28);
  int v8 = *(_DWORD *)(a1 + 32);
  int v7 = *(_DWORD *)(a1 + 36);
  if (a3)
  {
    *(void *)(a4 + 24) = 0LL;
    *(_DWORD *)(a4 + 32) = 1065353216;
  }

  if (*(_DWORD *)(a1 + 40) == 4)
  {
    *(void *)a4 = 1065353216LL;
    *(void *)(a4 + 12) = 0x3F80000000000000LL;
    *(void *)(a4 + 24) = 0LL;
    *(_DWORD *)(a4 + 32) = 1065353216;
  }

  if (*(_BYTE *)(a1 + 72) && *(float *)(a1 + 68) < 1.0)
  {
    double v9 = *a2 + (a2[2] + -1.0) * 0.5;
    if (result <= 0.0) {
      float v10 = 1.0;
    }
    else {
      float v10 = 1.0 / result;
    }
    float v13 = a2[1] + (a2[3] + -1.0) * 0.5;
    float v14 = (double)v5 + ((double)v7 + -1.0) * 0.5;
    if ((a3 & 1) != 0)
    {
      *(void *)(a4 + 24) = 0LL;
      *(_DWORD *)(a4 + 32) = 1065353216;
    }

    uint64_t v15 = 0LL;
    float v11 = v9;
    float v12 = (double)v6 + ((double)v8 + -1.0) * 0.5;
    float v16 = v11 - (float)(v10 * v12);
    do
    {
      *(float *)(a4 + v15) = *(float *)(a1 + 68) * *(float *)(a4 + v15);
      v15 += 4LL;
    }

    while (v15 != 36);
    *(float *)a4 = *(float *)a4 + (float)((float)(1.0 - *(float *)(a1 + 68)) * v10);
    *(float *)(a4 + 8) = *(float *)(a4 + 8) + (float)((float)(1.0 - *(float *)(a1 + 68)) * v16);
    float v17 = *(float *)(a4 + 20);
    *(float *)(a4 + 16) = *(float *)(a4 + 16) + (float)((float)(1.0 - *(float *)(a1 + 68)) * v10);
    *(float *)(a4 + 20) = v17 + (float)((float)(1.0 - *(float *)(a1 + 68)) * (float)(v13 - (float)(v10 * v14)));
    float64x2_t result = *(float *)(a4 + 32) + (float)(1.0 - *(float *)(a1 + 68));
    *(float *)(a4 + 32) = result;
  }

  return result;
}

uint64_t GVSComputeTransformFromCameraMotion( double *a1, float64x2_t *a2, uint64_t a3, float32x2_t *a4, float32x2_t *a5, float *a6)
{
  float64x2_t v8 = 0uLL;
  float64x2_t v9 = 0uLL;
  if (a4) {
    float64x2_t v9 = vcvtq_f64_f32(*a4);
  }
  int v10 = *(_DWORD *)(a3 + 4);
  float64x2_t v11 = *a2;
  if (a5) {
    float64x2_t v8 = vcvtq_f64_f32(*a5);
  }
  int v19 = *(_DWORD *)(a3 + 4);
  float64x2_t v20 = vaddq_f64(v11, v9);
  int v17 = v10;
  float64x2_t v18 = vsubq_f64(v11, v8);
  int32x4_t v16 = (int32x4_t)v11;
  GVSInverseRotationMatrixFromQuaternion(a1, (uint64_t)v21);
  *(double *)v12.i64 = FigMotionComputeTransformFromRotation((uint64_t)&v19, (uint64_t)&v17, v21, (uint64_t)a6);
  v12.i32[0] = *(_DWORD *)(a3 + 20);
  FigMotionApplyDigitalZoomToTransform(1, a6, v12, v16, *(double *)&v16.i64[1], v13, v14);
  return 0LL;
}

float GVSInverseRotationMatrixFromQuaternion(double *a1, uint64_t a2)
{
  double v3 = *a1;
  double v2 = a1[1];
  float v4 = v2 + v2;
  double v5 = a1[2];
  double v6 = a1[3];
  float v7 = v5 + v5;
  float v8 = v6 + v6;
  *(float *)&double v2 = v2;
  *(float *)&double v5 = v5;
  *(float *)&double v6 = v6;
  *(float *)&double v6 = *(float *)&v6 * v8;
  float v9 = 1.0 - (float)(*(float *)&v2 * v4);
  float v10 = (float)(1.0 - (float)(*(float *)&v5 * v7)) - *(float *)&v6;
  *(float *)(a2 + 32) = v9 - (float)(*(float *)&v5 * v7);
  *(float *)&double v5 = *(float *)&v5 * v8;
  *(float *)&double v3 = v3;
  float v11 = v4 * *(float *)&v3;
  *(float *)(a2 + 16) = v9 - *(float *)&v6;
  *(float *)(a2 + 20) = *(float *)&v5 - v11;
  *(float *)&double v6 = (float)(*(float *)&v2 * v7) + (float)(v8 * *(float *)&v3);
  *(float *)a2 = v10;
  *(float *)(a2 + 4) = (float)(*(float *)&v2 * v7) - (float)(v8 * *(float *)&v3);
  *(float *)&double v2 = *(float *)&v2 * v8;
  *(float *)&double v3 = v7 * *(float *)&v3;
  *(float *)(a2 + 8) = *(float *)&v2 + *(float *)&v3;
  *(_DWORD *)(a2 + 12) = LODWORD(v6);
  float result = *(float *)&v2 - *(float *)&v3;
  *(float *)(a2 + 24) = result;
  *(float *)(a2 + 28) = *(float *)&v5 + v11;
  return result;
}

uint64_t GVSComputeTranslationFromCameraMotion(double *a1, float32x2_t *a2, float a3)
{
  if (fabsf(*((float *)&v12 + 1)) <= 0.00000001)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    int v7 = 0;
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", v7, v3, v8, v9, v10, v11, v12, v13);
    return 4294967291LL;
  }

  else
  {
    uint64_t result = 0LL;
    *a2 = vmul_n_f32((float32x2_t)__PAIR64__(v11, HIDWORD(v9)), a3 / *((float *)&v12 + 1));
  }

  return result;
}

float GVSComputePerspectiveProjectedPoint(float *a1, float *a2, float *a3, float a4, float a5)
{
  float v5 = (float)(a1[8] + (float)(a1[7] * a5)) + (float)(a1[6] * a4);
  if (fabsf(v5) > 0.00000001) {
    float v5 = 1.0 / v5;
  }
  *a2 = (float)((float)(a1[2] + (float)(a1[1] * a5)) + (float)(*a1 * a4)) * v5;
  float result = v5 * (float)((float)(a1[5] + (float)(a1[4] * a5)) + (float)(a1[3] * a4));
  *a3 = result;
  return result;
}

float32_t GVSComputeMinimumZoomFactor(float64x2_t *a1, int32x2_t *a2)
{
  __asm { FMOV            V1.2S, #-1.0 }

  float32x2_t v7 = vdiv_f32( vadd_f32(vcvt_f32_s32(a2[1]), _D1),  vadd_f32(vadd_f32(vcvt_f32_f64(*a1), _D1), (float32x2_t)vdup_n_s32(0xBF804189)));
  if (v7.f32[0] <= v7.f32[1]) {
    v7.f32[0] = v7.f32[1];
  }
  return v7.f32[0];
}

uint64_t GVSFindBestPerspectiveTransform(float *a1, double *a2, int *a3, float *a4, float a5)
{
  uint64_t v6 = 0LL;
  int v7 = *a3;
  int v8 = a3[1];
  int v9 = a3[2];
  int v10 = a3[3];
  if (a5 <= 0.0) {
    float v11 = 1.0;
  }
  else {
    float v11 = 1.0 / a5;
  }
  float v12 = *a2;
  float v13 = a2[2];
  float v14 = a2[1];
  float v15 = a2[3];
  float v16 = (double)v7 + ((double)v9 + -1.0) * 0.5;
  float v17 = (float)(v12 + (float)((float)(v13 + -1.0) * 0.5)) - (float)(v11 * v16);
  float v18 = (double)v8 + ((double)v10 + -1.0) * 0.5;
  float v19 = (float)(v14 + (float)((float)(v15 + -1.0) * 0.5)) - (float)(v11 * v18);
  float v66 = (float)v7;
  float v67 = (float)v8;
  float v68 = (float)(v7 + v9 - 1);
  float v69 = (float)v8;
  float v70 = (float)v7;
  float v71 = (float)(v8 + v10 - 1);
  float v72 = v68;
  float v73 = v71;
  float v20 = (float)(v14 + v15) + -1.0;
  float v21 = a1[6];
  float v22 = a1[7];
  float v23 = a1[8];
  float v24 = a1[1];
  float v25 = a1[2];
  float v26 = a1[3];
  float v27 = a1[4];
  float v28 = a1[5];
  float v29 = v12 + 0.5;
  float v30 = v14 + 0.5;
  float v65 = (float)(v12 + v13) + -1.0;
  float v31 = v65 + -0.5;
  float v32 = *a1 - v11;
  float v33 = v23 + -1.0;
  float v34 = v20 + -0.5;
  float v35 = v27 - v11;
  float v36 = 3.4028e38;
  do
  {
    float v38 = *(float *)((char *)&v66 + v6);
    float v37 = *(float *)((char *)&v66 + v6 + 4);
    float v39 = (float)(v23 + (float)(v22 * v37)) + (float)(v21 * v38);
    if (fabsf(v39) <= 0.00000001) {
      float v40 = (float)(v23 + (float)(v22 * v37)) + (float)(v21 * v38);
    }
    else {
      float v40 = 1.0 / v39;
    }
    float v41 = (float)((float)(v25 + (float)(v24 * v37)) + (float)(*a1 * v38)) * v40;
    if (v41 < v29)
    {
      float v43 = -1.0;
      if (fabsf(v42) < 0.00000001) {
        goto LABEL_15;
      }
      float v44 = v29 - (float)(v38 * v11);
      goto LABEL_14;
    }

    float v43 = 1.0;
    if (v41 > v31)
    {
      float v43 = -1.0;
      if (fabsf(v42) >= 0.00000001)
      {
        float v44 = v31 - (float)(v38 * v11);
LABEL_14:
        float v43 = (float)(v44 - v17) / v42;
      }
    }

LABEL_15:
    float v45 = v40 * (float)((float)(v28 + (float)(v27 * v37)) + (float)(v26 * v38));
    if (v45 >= v30)
    {
      float v47 = 1.0;
      if (v45 <= v34) {
        goto LABEL_22;
      }
      float v47 = -2.0;
      if (fabsf(v46) < 0.00000001) {
        goto LABEL_22;
      }
      float v48 = v34 - (float)(v37 * v11);
    }

    else
    {
      float v47 = -2.0;
      if (fabsf(v46) < 0.00000001) {
        goto LABEL_22;
      }
      float v48 = v30 - (float)(v37 * v11);
    }

    float v47 = (float)(v48 - v19) / v46;
LABEL_22:
    if (v43 >= v47) {
      float v49 = v47;
    }
    else {
      float v49 = v43;
    }
    if (v36 >= v49) {
      float v36 = v49;
    }
    v6 += 8LL;
  }

  while (v6 != 32);
  if (v36 >= 0.0 && v36 <= 1.0)
  {
    if (a4) {
      *a4 = v36;
    }
    if (v36 < 1.0)
    {
      for (uint64_t i = 0LL; i != 9; ++i)
        a1[i] = v36 * a1[i];
      uint64_t v53 = 0LL;
      *a1 = *a1 + (float)((float)(1.0 - v36) * v11);
      a1[2] = a1[2] + (float)((float)(1.0 - v36) * v17);
      float v54 = a1[5] + (float)((float)(1.0 - v36) * v19);
      a1[4] = a1[4] + (float)((float)(1.0 - v36) * v11);
      a1[5] = v54;
      a1[8] = (float)(1.0 - v36) + a1[8];
      int v55 = &v67;
      do
      {
        float v56 = *(v55 - 1);
        float v57 = *v55;
        float v58 = (float)(a1[8] + (float)(a1[7] * *v55)) + (float)(a1[6] * v56);
        if (fabsf(v58) <= 0.00000001) {
          float v59 = (float)(a1[8] + (float)(a1[7] * *v55)) + (float)(a1[6] * v56);
        }
        else {
          float v59 = 1.0 / v58;
        }
        float v60 = (float)((float)(a1[2] + (float)(a1[1] * v57)) + (float)(*a1 * v56)) * v59;
        float v61 = v59 * (float)((float)(a1[5] + (float)(a1[4] * v57)) + (float)(a1[3] * v56));
        if (v60 < v12 || v60 > v65 || v61 < v14 || v61 > v20) {
          fprintf( __stderrp,  "Warning! Corner[%d] =(%f ; %f) is still outside of boundary: output position =(%f ; %f)\n",
        }
            v53,
            v56,
            v57,
            v60,
            v61);
        ++v53;
        v55 += 2;
      }

      while (v53 != 4);
    }

    return 0LL;
  }

  else
  {
    fprintf(__stderrp, "Error in LimitPerspectiveTransform, minLimitFactor %f\n", v36);
    return 0xFFFFFFFFLL;
  }

float32x2_t GVSRotateVectorByQuaternion(float *a1, uint64_t a2)
{
  v2.f64[0] = *(float64_t *)(a2 + 24);
  v2.f64[1] = *(float64_t *)a2;
  float64x2_t v3 = *(float64x2_t *)(a2 + 8);
  double v4 = *a1;
  double v5 = a1[1];
  double v6 = a1[2];
  int8x16_t v7 = (int8x16_t)vnegq_f64(v3);
  float64x2_t v8 = vmulq_f64(v2, (float64x2_t)xmmword_37750);
  float64x2_t v9 = (float64x2_t)vextq_s8((int8x16_t)v8, (int8x16_t)vnegq_f64(v8), 8uLL);
  float64x2_t v10 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(v8, v5), v9, v4), (float64x2_t)vextq_s8((int8x16_t)v3, v7, 8uLL), v6);
  float64x2_t v11 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(v3, v5), (float64x2_t)vextq_s8(v7, (int8x16_t)v3, 8uLL), v4), v9, v6);
  return vcvt_f32_f64( vaddq_f64( vmlaq_n_f64( vmulq_n_f64(v10, *(double *)a2),  (float64x2_t)vextq_s8((int8x16_t)vnegq_f64(v10), (int8x16_t)v10, 8uLL),  *(double *)(a2 + 24)),  vmlaq_n_f64( vmulq_n_f64(v11, v3.f64[1]),  (float64x2_t)vextq_s8((int8x16_t)v11, (int8x16_t)vnegq_f64(v11), 8uLL),  v3.f64[0])));
}

double GVSInterpolateQuaternionsLERP(uint64_t a1, uint64_t a2, int a3, char *a4, float a5)
{
  double v27 = 1.0 - a5;
  double v28 = a5;
  double v10 = FigMotionQuaternionDotProduct((double *)a1, (double *)a2);
  double v11 = *(double *)a1;
  double v12 = *(double *)a2;
  if (v10 >= 0.0)
  {
    double v13 = v12 * v28 + v11 * v27;
    float64x2_t v14 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a2 + 8), v28), *(float64x2_t *)(a1 + 8), v27);
    double v15 = *(double *)(a1 + 24);
    double v16 = *(double *)(a2 + 24) * v28;
  }

  else
  {
    double v13 = v11 * v27 - v12 * v28;
    float64x2_t v14 = vmlaq_n_f64(vmulq_n_f64(vnegq_f64(*(float64x2_t *)(a2 + 8)), v28), *(float64x2_t *)(a1 + 8), v27);
    double v15 = *(double *)(a1 + 24);
    double v16 = -(*(double *)(a2 + 24) * v28);
  }

  *(double *)float v31 = v13;
  *(float64x2_t *)&v31[8] = v14;
  *(double *)&v31[24] = v16 + v15 * v27;
  double v17 = FigMotionQuaternionDotProduct((double *)v31, (double *)v31);
  if (!a3 && v17 >= 0.5)
  {
    char v18 = 0;
    if (!a4) {
      return *(double *)v31;
    }
    goto LABEL_12;
  }

  if (v17 >= 0.04)
  {
    double v25 = 1.0 / sqrt(v17);
    *(float64x2_t *)float v31 = vmulq_n_f64(*(float64x2_t *)v31, v25);
    *(float64x2_t *)&v31[16] = vmulq_n_f64(*(float64x2_t *)&v31[16], v25);
  }

  else
  {
    __int128 v19 = *(_OWORD *)(a1 + 16);
    v30[0] = *(_OWORD *)a1;
    v30[1] = v19;
    __int128 v20 = *(_OWORD *)(a2 + 16);
    v29[0] = *(_OWORD *)a2;
    v29[1] = v20;
    FigMotionNormalizeQuaternion(v30);
    FigMotionNormalizeQuaternion(v29);
    FigMotionInterpolateQuaternionsByAngle((uint64_t)v30, (double *)v29, a5);
    *(void *)float v31 = v21;
    *(void *)&v31[8] = v22;
    *(void *)&v31[16] = v23;
    *(void *)&v31[24] = v24;
  }

  char v18 = 1;
  if (a4) {
LABEL_12:
  }
    *a4 = v18;
  return *(double *)v31;
}

double GVSInterpolateQuatfNLERP(float32x4_t a1, float32x4_t a2, float a3)
{
  float32x4_t v3 = vmulq_f32(a1, a2);
  float32x4_t v4 = (float32x4_t)vextq_s8((int8x16_t)v3, (int8x16_t)v3, 8uLL);
  *(float32x2_t *)v3.f32 = vadd_f32(*(float32x2_t *)v3.f32, *(float32x2_t *)v4.f32);
  v3.f32[0] = vaddv_f32(*(float32x2_t *)v3.f32);
  v4.i32[0] = 0;
  float32x4_t v5 = vmlaq_n_f32( a1,  vsubq_f32( (float32x4_t)vbslq_s8( (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_f32(v4, v3), 0),  (int8x16_t)vnegq_f32(a2),  (int8x16_t)a2),  a1),  a3);
  int8x16_t v6 = (int8x16_t)vmulq_f32(v5, v5);
  float32x2_t v7 = vadd_f32(*(float32x2_t *)v6.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL));
  if (vaddv_f32(v7) == 0.0) {
    return *(double *)&_PromotedConst;
  }
  float32x2_t v9 = vadd_f32(v7, (float32x2_t)vdup_lane_s32((int32x2_t)v7, 1));
  float32x2_t v10 = vrsqrte_f32(v9);
  float32x2_t v11 = vmul_f32(v10, vrsqrts_f32(v9, vmul_f32(v10, v10)));
  *(void *)&double result = vmulq_n_f32(v5, vmul_f32(v11, vrsqrts_f32(v9, vmul_f32(v11, v11))).f32[0]).u64[0];
  return result;
}

double GVSGetDefaultExtrinsicToIMU(int a1)
{
  double result = 0.707106781;
  if (!a1) {
    return 0.0;
  }
  return result;
}

uint64_t GVSQuaternionFromRotationMatrix( uint64_t a1, double *a2, float64x2_t a3, __n128 a4, double a5, double a6, float64x2_t a7, double a8, float64x2_t a9)
{
  if (!a1 || !a2)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "Fig",  "matrix && quaternionOut",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  844LL,  0);
    return FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  uint64_t v9 = 0LL;
  int64x2_t v10 = *(int64x2_t *)a1;
  a3.f64[0] = *(float64_t *)(a1 + 16);
  float64x2_t v11 = *(float64x2_t *)(a1 + 24);
  a7.f64[0] = *(float64_t *)(a1 + 40);
  a4.n128_u64[0] = *(void *)(a1 + 48);
  uint64_t v12 = *(uint64_t *)(a1 + 56);
  a9.f64[0] = *(float64_t *)(a1 + 64);
  int64x2_t v13 = vzip2q_s64(*(int64x2_t *)a1, (int64x2_t)v11);
  *(float64_t *)&__int128 v14 = a3.f64[0];
  *((void *)&v14 + 1) = *(void *)&a7.f64[0];
  v55[0] = vzip1q_s64(*(int64x2_t *)a1, (int64x2_t)v11);
  v55[1] = a4;
  v55[2] = v13;
  v55[3] = vdupq_lane_s64(v12, 0);
  v55[4] = v14;
  v55[5] = a9;
  *(void *)&v15.f64[0] = v10.i64[0];
  *(void *)&v15.f64[1] = vextq_s8((int8x16_t)v10, (int8x16_t)v10, 8uLL).u64[0];
  v16.f64[0] = v11.f64[0];
  *(void *)&v16.f64[1] = vextq_s8((int8x16_t)v11, (int8x16_t)v11, 8uLL).u64[0];
  *(void *)&v17.f64[0] = a4.n128_u64[0];
  *(void *)&v17.f64[1] = v12;
  do
  {
    float64x2_t v19 = (float64x2_t)v55[v9];
    float64x2_t v18 = (float64x2_t)v55[v9 + 1];
    __int128 v20 = &v56[v9];
    *__int128 v20 = vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v15, v19.f64[0]), v16, v19, 1), v17, v18.f64[0]);
    v20[1] = vmlaq_f64(vmlaq_laneq_f64(vmulq_f64(a3, v19), a7, v19, 1), v18, a9);
    v9 += 2LL;
  }

  while (v9 != 6);
  float64x2_t v21 = *(float64x2_t *)&matrix_identity_double3x3.columns[0].f64[2];
  float64x2_t v22 = vabdq_f64(v56[1], v21);
  v21.f64[0] = 0.000001;
  float64x2_t v23 = (float64x2_t)vdupq_n_s64(0x3EB0C6F7A0B5ED8DuLL);
  int64x2_t v24 = (int64x2_t)vandq_s8( vandq_s8( (int8x16_t)vcgeq_f64( v23,  vabdq_f64(v56[2], *(float64x2_t *)matrix_identity_double3x3.columns[1].f64)),  (int8x16_t)vcgeq_f64( v23,  vabdq_f64(v56[0], *(float64x2_t *)matrix_identity_double3x3.columns[0].f64))),  (int8x16_t)vcgeq_f64( v23,  vabdq_f64(v56[4], *(float64x2_t *)matrix_identity_double3x3.columns[2].f64)));
  if ((vandq_s8( (int8x16_t)vdupq_laneq_s64(v24, 1),  vandq_s8( vandq_s8( vandq_s8( (int8x16_t)vcgeq_f64( v21,  vabdq_f64(v56[3], *(float64x2_t *)&matrix_identity_double3x3.columns[1].f64[2])),  (int8x16_t)vcgeq_f64(v21, v22)),  (int8x16_t)vcgeq_f64(v21, vabdq_f64(v56[5], *(float64x2_t *)&matrix_identity_double3x3.columns[2].f64[2]))),  (int8x16_t)v24)).u64[0] & 0x8000000000000000LL) == 0)
  {
    uint64_t v54 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v54,  "Fig",  "isOrthogonal",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  859LL,  0);
    return FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  double v25 = *(double *)v10.i64 + v11.f64[1] + a9.f64[0];
  if (v25 >= 0.0)
  {
    double v33 = sqrt(v25 + 1.0);
    double v34 = v33 + v33;
    double v35 = 1.0 / (v33 + v33);
    double v29 = (a7.f64[0] - *(double *)&v12) * v35;
    double v30 = (a4.n128_f64[0] - a3.f64[0]) * v35;
    double v31 = v35 * vsubq_f64((float64x2_t)vdupq_laneq_s64(v10, 1), v11).f64[0];
    double v32 = v34 * 0.25;
  }

  else if (*(double *)v10.i64 < v11.f64[1] || *(double *)v10.i64 < a9.f64[0])
  {
    double v36 = 1.0 - *(double *)v10.i64;
    BOOL v37 = v11.f64[1] < a9.f64[0];
    double v38 = sqrt(1.0 - *(double *)v10.i64 - v11.f64[1] + a9.f64[0]);
    double v39 = v38 + v38;
    double v40 = 1.0 / v39;
    double v41 = (a3.f64[0] + a4.n128_f64[0]) * (1.0 / v39);
    float64_t v42 = a7.f64[0] + *(double *)&v12;
    double v43 = v42 * (1.0 / v39);
    float64x2_t v44 = (float64x2_t)vdupq_laneq_s64(v10, 1);
    double v45 = v39 * 0.25;
    double v46 = v40 * vsubq_f64(v44, v11).f64[0];
    double v47 = sqrt(v11.f64[1] + v36 - a9.f64[0]);
    double v48 = v47 + v47;
    double v49 = 1.0 / v48 * vaddq_f64(v44, v11).f64[0];
    double v50 = v48 * 0.25;
    double v51 = v42 * (1.0 / v48);
    double v32 = (a4.n128_f64[0] - a3.f64[0]) * (1.0 / v48);
    if (v37) {
      double v29 = v41;
    }
    else {
      double v29 = v49;
    }
    if (v37) {
      double v30 = v43;
    }
    else {
      double v30 = v50;
    }
    if (v37) {
      double v31 = v45;
    }
    else {
      double v31 = v51;
    }
    if (v37) {
      double v32 = v46;
    }
  }

  else
  {
    double v26 = sqrt(*(double *)v10.i64 + 1.0 - v11.f64[1] - a9.f64[0]);
    double v27 = v26 + v26;
    double v28 = 1.0 / v27;
    double v29 = v27 * 0.25;
    double v30 = v28 * vaddq_f64((float64x2_t)vdupq_laneq_s64(v10, 1), v11).f64[0];
    double v31 = (a3.f64[0] + a4.n128_f64[0]) * v28;
    double v32 = (a7.f64[0] - *(double *)&v12) * v28;
  }

  a2[2] = v30;
  a2[3] = v31;
  *a2 = v32;
  a2[1] = v29;
  return 0LL;
}

void GVSComputeRollPitchFromGravity(float *a1)
{
  if (a1)
  {
    float v1 = *a1;
    float v2 = a1[1];
    float v3 = a1[2];
    float v4 = sqrtf((float)((float)(v2 * v2) + (float)(v1 * v1)) + (float)(v3 * v3));
    if (v4 > 0.99 && asinf(fabsf(v3 / v4)) < 1.5533) {
      atan2f(v1, v2);
    }
  }

uint64_t GVSExtractMetadataFromTopToBottomRows( const __CFDictionary *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, int32x2_t *a6, uint64_t a7, void *a8, uint64_t a9, float32x2_t *a10, float32x2_t *a11, uint64_t a12, int a13)
{
  id v19 = a3;
  float v184 = v19;
  if (!a6)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "Fig",  "transformContext",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  1320LL,  0);
    goto LABEL_197;
  }

  if (!a2)
  {
    uint64_t v166 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v166,  "Fig",  "motionData",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  1321LL,  0);
    goto LABEL_197;
  }

  if (!a1)
  {
    uint64_t v167 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v167,  "Fig",  "metadataDict",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  1322LL,  0);
    goto LABEL_197;
  }

  if (!a7)
  {
    uint64_t v168 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v168,  "Fig",  "cameraMetadata",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  1323LL,  0);
    goto LABEL_197;
  }

  id v189 = v19;
  int valuePtr = 0;
  uint64_t v207 = 0LL;
  int v206 = 0;
  uint64_t v205 = 0LL;
  *(_OWORD *)a7 = 0u;
  *(_OWORD *)(a7 + 16) = 0u;
  *(_OWORD *)(a7 + 32) = 0u;
  *(_OWORD *)(a7 + 48) = 0u;
  *(_OWORD *)(a7 + 64) = 0u;
  *(_OWORD *)(a7 + 80) = 0u;
  *(_OWORD *)(a7 + 96) = 0u;
  *(_OWORD *)(a7 + 112) = 0u;
  *(_OWORD *)(a7 + 128) = 0u;
  *(void *)(a7 + 88) = 0LL;
  *(void *)(a7 + 96) = 0LL;
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  *(CGPoint *)buffer = CGRectZero.origin;
  CGSize v210 = size;
  FigCFDictionaryGetCGRectIfPresent(a1, kFigCaptureStreamMetadata_ValidBufferRect, buffer);
  if (v20)
  {
    int v21 = llround(*(double *)&buffer[8]);
    *(_DWORD *)(a7 + 88) = llround(*(double *)buffer);
    *(_DWORD *)(a7 + 92) = v21;
    int v22 = llround(v210.height);
    *(_DWORD *)(a7 + 96) = llround(v210.width);
    *(_DWORD *)(a7 + 100) = v22;
  }

  *(CGPoint *)(a7 + 104) = origin;
  *(CGSize *)(a7 + 120) = size;
  FigCFDictionaryGetCGRectIfPresent( a1,  kFigVideoStabilizationSampleBufferProcessorMetadata_OverscanLimitingRect,  a7 + 104);
  *(_DWORD *)(a7 + 20) = 1065353216;
  FigCFDictionaryGetFloatIfPresent( a1,  kFigMotionAttachmentsSampleBufferProcessorMetadata_VideoStabilizationDigitalZoomFactor,  a7 + 20);
  uint64_t v183 = (_DWORD *)(a7 + 20);
  *(_BYTE *)(a7 + 12) = CFDictionaryContainsKey(a1, kFigCaptureStreamMetadata_SphereMode);
  Boolean Value = (const __CFNumber *)CFDictionaryGetValue(a1, kFigCaptureStreamMetadata_CurrentFocusPosition);
  uint64_t v185 = a6;
  uint64_t v186 = a7;
  uint64_t v187 = a5;
  BOOL v198 = (int *)a2;
  __int128 v181 = (void *)(a7 + 104);
  float v182 = (char *)(a2 + 10258);
  if (!Value)
  {
    uint64_t v169 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v169,  "Fig",  "val",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  1873LL,  0);
    goto LABEL_194;
  }

  CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
  *(_DWORD *)a7 = valuePtr;
  FigCFDictionaryGetFloatIfPresent(a1, kFigMotionAttachmentsSampleBufferProcessorMetadata_LensPosition, a7 + 4);
  int64x2_t v24 = (const __CFNumber *)CFDictionaryGetValue(a1, kFigCaptureStreamMetadata_ExposureTime);
  if (!v24)
  {
    uint64_t v170 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v170,  "Fig",  "val",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  1880LL,  0);
    goto LABEL_194;
  }

  CFNumberGetValue(v24, kCFNumberFloat64Type, &v207);
  *(void *)(a7 + 48) = v207;
  double v25 = (const __CFNumber *)CFDictionaryGetValue(a1, kFigCaptureStreamMetadata_FrameRollingShutterSkew);
  if (!v25)
  {
    double v25 = (const __CFNumber *)CFDictionaryGetValue(a1, kFigCaptureStreamMetadata_RollingShutterSkew);
    if (!v25)
    {
      uint64_t v176 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v176,  "Fig",  "val",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  1896LL,  0);
LABEL_194:
      uint64_t v153 = FigSignalErrorAt(4294954513LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);

      if (!(_DWORD)v153) {
        goto LABEL_71;
      }
LABEL_191:
      uint64_t v174 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v180) = v153;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v174,  "Fig",  "err == 0 ",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  1336LL,  v180);
      goto LABEL_177;
    }
  }

  CFNumberGetValue(v25, kCFNumberSInt32Type, &v206);
  *(double *)(a7 + 56) = (double)v206 / 1000000.0;
  double v26 = (const __CFNumber *)CFDictionaryGetValue(a1, kFigMotionAttachmentsSampleBufferProcessorMetadata_FramePTSSeconds);
  if (!v26)
  {
    uint64_t v171 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v171,  "Fig",  "val",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  1904LL,  0);
    goto LABEL_194;
  }

  CFNumberGetValue(v26, kCFNumberDoubleType, &v205);
  *(void *)(a7 + 32) = v205;
  double v27 = (const void **)&kFigMotionAttachmentsSampleBufferProcessorMetadata_MotionData;
  if (*(_BYTE *)(a2 + 10260)) {
    double v27 = (const void **)&kFigMotionAttachmentsSampleBufferProcessorMetadata_MotionAttachmentsISPMotionData;
  }
  double v28 = (const __CFDictionary *)CFDictionaryGetValue(a1, *v27);
  if (!v28)
  {
    uint64_t v172 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v172,  "Fig",  "motionDataDict",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  1919LL,  0);
    goto LABEL_194;
  }

  double v29 = v28;
  double v30 = (const __CFArray *)CFDictionaryGetValue(v28, kFigMotionAttachmentsSampleBufferProcessorMetadata_FusedMotion);
  float64_t v191 = a1;
  if (v30)
  {
    double v31 = v30;
    int v32 = CFDictionaryContainsKey(v29, kFigMotionAttachmentsSampleBufferProcessorMetadata_GroupDelayCompensationApplied);
    id v33 = v189;
    int Count = CFArrayGetCount(v31);
    if (v32) {
      double v35 = *(double *)(a2 + 10248);
    }
    else {
      double v35 = *(double *)(a2 + 10248) + -0.005;
    }
    if (Count >= 1)
    {
      CFIndex v36 = 0LL;
      uint64_t v37 = Count;
      while (1)
      {
        ValueAtIndedouble x = (const __CFArray *)CFArrayGetValueAtIndex(v31, v36);
        if (!ValueAtIndex) {
          goto LABEL_31;
        }
        double v39 = ValueAtIndex;
        int v40 = CFArrayGetCount(ValueAtIndex);
        if (v40 < 1) {
          goto LABEL_31;
        }
        uint64_t v41 = *v198;
        float64_t v42 = (double *)&v198[2 * v41 + 2];
        *float64_t v42 = v35 + *v42;
        double v43 = (const __CFData *)CFArrayGetValueAtIndex(v39, 2LL);
        if (!v43) {
          goto LABEL_31;
        }
        float64x2_t v44 = v43;
        v212.length = CFDataGetLength(v43);
        double v45 = (UInt8 *)&v198[8 * v41 + 514];
        v212.location = 0LL;
        CFDataGetBytes(v44, v212, v45);
        if (!v33) {
          goto LABEL_30;
        }
        unsigned int v46 = [v33 extractGravityData];
        double v47 = (const __CFData *)CFArrayGetValueAtIndex(v39, 3LL);
        if (v47) {
          break;
        }
LABEL_31:
        if (v37 == ++v36) {
          goto LABEL_32;
        }
      }

      double v48 = v47;
      v213.length = CFDataGetLength(v47);
      v213.location = 0LL;
      CFDataGetBytes(v48, v213, buffer);
      [v33 pushSample:buffer withPose:v45 atTime:*v42];
LABEL_30:
      *BOOL v198 = (*v198 + 1);
      goto LABEL_31;
    }

LABEL_145:
        uint64_t v153 = 0LL;
        *(_DWORD *)(a12 + 444) = v143;
        if (!a4) {
          goto LABEL_177;
        }
        a7 = v186;
        if (!a11) {
          goto LABEL_177;
        }
        float32x2_t v154 = vadd_f32(v121, v199);
        float32x4_t v155 = v185;
        if (!*(_BYTE *)(v186 + 12)) {
          goto LABEL_168;
        }
        goto LABEL_153;
      }

      *(float32x2_t *)buffer = vcvt_f32_f64(*v82);
      uint64_t v145 = FigMotionComputeBravoTranslation( (uint64_t)a1,  a12,  v143,  (float *)buffer,  (float *)&v199,  *(float *)v200,  *(float *)&v207);
      if ((_DWORD)v145)
      {
        uint64_t v153 = v145;
        uint64_t v179 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v180) = v153;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v179,  "Fig",  "err == 0 ",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  1567LL,  v180);
        goto LABEL_177;
      }
    }

    if ((v142 & 4) != 0) {
      goto LABEL_130;
    }
    goto LABEL_145;
  }

  uint64_t v153 = 0LL;
  if (!a4 || !a11) {
    goto LABEL_177;
  }
  float32x2_t v154 = vadd_f32(v121, 0LL);
  if (!*(_BYTE *)(a7 + 12))
  {
    float32x4_t v155 = v185;
    if (!*(_BYTE *)(v187 + 56))
    {
      bzero(a11, 8LL * v185[6].i32[1]);
LABEL_176:
      uint64_t v153 = 0LL;
      goto LABEL_177;
    }

LABEL_168:
    uint64_t v161 = v155[6].u32[1];
    if ((int)v161 >= 1)
    {
      do
      {
        *v140++ = v154;
        --v161;
      }

      while (v161);
    }

    goto LABEL_176;
  }

  float32x4_t v155 = v185;
LABEL_153:
  if (a13 != 1)
  {
    if (v155[6].i32[1] >= 1)
    {
      uint64_t v156 = 0LL;
      int v157 = 0;
      do
      {
        if (v157 >= v107 - 1) {
          int v158 = v107 - 1;
        }
        else {
          int v158 = v157;
        }
        FigMotionComputeLensMovementForTimeStamp(a4, (uint64_t)v140, *(unsigned int *)(a7 + 136));
        *float32x4_t v140 = vadd_f32(v154, *v140);
        ++v140;
        ++v156;
        int v157 = v155[7].i32[1] + v158;
      }

      while (v156 < v155[6].i32[1]);
    }

    goto LABEL_176;
  }

  uint64_t v153 = FigMotionComputeLensMovementForTimeStamp(a4, (uint64_t)a11, *(unsigned int *)(a7 + 136));
  if ((_DWORD)v153)
  {
    uint64_t v178 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v180) = v153;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v178,  "Fig",  "err == 0 ",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  1655LL,  v180);
  }

  else
  {
    *a11 = vadd_f32(v154, *a11);
  }

uint64_t GVSComputeMotionBlur(uint64_t a1, uint64_t a2, uint64_t a3, double *a4, void *a5)
{
  if (!a5)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "Fig",  "motionBlurVector",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  2011LL,  0);
    return FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  if (!a1)
  {
    uint64_t v27 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v27,  "Fig",  "motionData",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  2012LL,  0);
    return FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  if (!a3)
  {
    uint64_t v28 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v28,  "Fig",  "cameraMetadata",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  2013LL,  0);
    return FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  if (!a4)
  {
    uint64_t v29 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v29,  "Fig",  "extrinsicAlignment",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  2014LL,  0);
    return FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  *a5 = 0LL;
  double v11 = *(double *)(a3 + 72);
  double v12 = *(double *)(a3 + 48) * 0.5;
  double v13 = v11 + v12;
  char v40 = 1;
  char v39 = 1;
  FigMotionComputeQuaternionForTimeStamp(a1, v38, &v40, v11 - v12);
  FigMotionComputeQuaternionForTimeStamp(a1, v37, &v39, v13);
  if (v40 && v39)
  {
    v38[0] = FigMotionMultiplyQuaternions((double *)v38, a4);
    v38[1] = v14;
    v38[2] = v15;
    v38[3] = v16;
    v37[0] = FigMotionMultiplyQuaternions(v37, a4);
    v37[1] = v17;
    v37[2] = v18;
    v37[3] = v19;
    float32x2_t v36 = 0LL;
    double v32 = FigMotionMultiplyByInverseOfQuaternion(v37, v38);
    id v33 = v20;
    double v34 = v21;
    uint64_t v35 = v22;
    uint64_t v23 = GVSComputeTranslationFromCameraMotion(&v32, &v36, *(float *)(a3 + 4));
    if ((_DWORD)v23)
    {
      uint64_t v24 = v23;
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v24,  v5,  *(void *)&v30,  *(void *)&v31,  LODWORD(v32),  v33,  v34,  v35);
    }

    else
    {
      if (a2)
      {
        if (*(_BYTE *)(a3 + 12))
        {
          float32x2_t v30 = 0LL;
          float32x2_t v31 = 0LL;
          FigMotionComputeLensMovementForTimeStamp(a2, (uint64_t)&v31, *(unsigned int *)(a3 + 136));
          FigMotionComputeLensMovementForTimeStamp(a2, (uint64_t)&v30, *(unsigned int *)(a3 + 136));
          float32x2_t v36 = vsub_f32(v36, vsub_f32(v30, v31));
        }
      }

      uint64_t v24 = 0LL;
      *a5 = v36;
    }
  }

  else
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v5,  *(void *)&v30,  *(void *)&v31,  LODWORD(v32),  v33,  v34,  v35);
    return 0xFFFFFFFFLL;
  }

  return v24;
}

#error "1BE70: call analysis failed (funcsize=115)"
#error "1C054: call analysis failed (funcsize=114)"
BOOL __cdecl -[GVSGravityDataContext extractGravityData](GVSGravityDataContext *self, SEL a2)
{
  return self->_extractGravityData;
}

uint64_t GVSExtractCameraGeometryFromCameraInfoByPortType(void *a1, char *a2)
{
  id v4 = a1;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  int8x16_t v6 = (void *)v5;
  double v48 = v4;
  if (!v4)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "Fig",  "cameraInfoByPortType",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  2068LL,  0);
LABEL_37:
    uint64_t v30 = FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    goto LABEL_34;
  }

  if (!a2)
  {
    uint64_t v38 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v38,  "Fig",  "cameraGeometryByPortTypeOut",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  2069LL,  0);
    goto LABEL_37;
  }

  uint64_t v41 = a2;
  id v47 = (id)v5;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  id v7 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (!v7)
  {
    uint64_t v30 = 0LL;
    goto LABEL_31;
  }

  id v8 = v7;
  char v40 = v2;
  uint64_t v45 = kFigCaptureCameraInfoKey_PixelSize;
  uint64_t v46 = *(void *)v54;
  float64x2_t v44 = (const char *)kFigCaptureCameraInfoKey_OpticalCenterOffsetInPhysicalSensorDimensions;
  uint64_t v42 = kFigCaptureCameraInfoKey_OpticalCenterOffset;
  uint64_t v9 = kFigCaptureCameraInfoKey_CameraPoseMatrix;
  do
  {
    int64x2_t v10 = 0LL;
    do
    {
      if (*(void *)v54 != v46) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void *)(*((void *)&v53 + 1) + 8LL * (void)v10);
      double v12 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKeyedSubscript:v11]);
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v45]);
      if (!v13)
      {
        fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        LODWORD(v39) = 0;
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v39,  v40,  v40,  v41,  v42,  (const char *)obj,  v44,  v45);

        uint64_t v30 = 4294954516LL;
LABEL_33:

        int8x16_t v6 = v47;
        goto LABEL_34;
      }

      uint64_t v14 = (void *)v13;
      uint64_t v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v44]);
      if (v15
        || (uint64_t v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v42])) != 0)
      {
        point.double x = 0.0;
        point.y = 0.0;
        CGPointMakeWithDictionaryRepresentation(v15, &point);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v9]);
        double v17 = v16;
        if (v16)
        {
          if ([v16 length] == &stru_20.segname[8])
          {
            double v18 = (float *)[v17 bytes];
            float32x2_t v19 = vcvt_f32_f64((float64x2_t)point);
            [v14 floatValue];
            uint64_t v27 = 0LL;
            float32x2_t v51 = vmul_n_f32(v19, *(float *)v20.f64);
            uint64_t v28 = v57;
            do
            {
              for (uint64_t i = 0LL; i != 3; ++i)
              {
                v20.f64[0] = v18[i];
                *(float64_t *)&v28[8 * i] = v20.f64[0];
              }

              ++v27;
              v28 += 24;
              v18 += 4;
            }

            while (v27 != 3);
            uint64_t v30 = GVSQuaternionFromRotationMatrix((uint64_t)v57, v49, v20, v21, v22, v23, v24, v25, v26);
            if ((_DWORD)v30)
            {
              int v32 = 4;
            }

            else
            {
              double v50 = -v50;
              float32x2_t v31 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  v49,  40LL);
              [v47 setObject:v31 forKeyedSubscript:v11];

              int v32 = 0;
            }

            goto LABEL_19;
          }

          uint64_t v34 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          LODWORD(v39) = 0;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v34,  "Fig",  "cameraPoseData.length == 12 * sizeof(float)",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  2093LL,  v39);
        }

        else
        {
          uint64_t v33 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          LODWORD(v39) = 0;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v33,  "Fig",  "cameraPoseData",  "bail",  0LL,  "GVSMotionProcessingUtilities.m",  2092LL,  v39);
        }

        int v32 = 4;
        uint64_t v30 = 4294954516LL;
LABEL_19:

        goto LABEL_20;
      }

      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(v39) = 0;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v39,  v40,  v40,  v41,  v42,  (const char *)obj,  v44,  v45);
      int v32 = 4;
      uint64_t v30 = 4294954516LL;
LABEL_20:

      if (v32) {
        goto LABEL_33;
      }
      int64x2_t v10 = (char *)v10 + 1;
    }

    while (v10 != v8);
    id v35 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    id v8 = v35;
  }

  while (v35);
LABEL_31:

  int8x16_t v6 = v47;
  *(void *)uint64_t v41 = v47;
LABEL_34:

  return v30;
}

float32x2_t GVSComputeOverscanUsage(_DWORD *a1, float64x2_t *a2, uint64_t a3)
{
  uint64_t v3 = 0LL;
  int v4 = a1[6];
  int v5 = a1[7];
  float v6 = (float)v4;
  int v7 = a1[9];
  float v8 = (float)(v4 + a1[8] - 1);
  uint64_t v9 = v30;
  *(float *)&v29[4] = v6;
  v30[0] = (float)v5;
  v30[1] = v8;
  _OWORD v30[2] = (float)v5;
  v30[3] = v6;
  float v31 = (float)(v5 + v7 - 1);
  float v32 = v8;
  float v33 = v31;
  int v10 = a1[13];
  int v11 = (a1[14] - 1) * v10;
  v29[0] = 0;
  v29[1] = v11;
  _OWORD v29[2] = v10 - 1;
  v29[3] = v10 - 1 + v11;
  float32x2_t v12 = vcvt_f32_f64(*a2);
  __asm { FMOV            V2.2S, #-1.0 }

  float32x2_t v18 = vadd_f32(vadd_f32(v12, vcvt_f32_f64(a2[1])), _D2);
  float32x2_t result = (float32x2_t)vdup_n_s32(0x7F7FFFFFu);
  do
  {
    uint64_t v20 = a3 + 36LL * (int)v29[v3];
    float v21 = *(v9 - 1);
    float v22 = (float)(*(float *)(v20 + 32) + (float)(*(float *)(v20 + 28) * *v9)) + (float)(*(float *)(v20 + 24) * v21);
    v23.i32[0] = *(_DWORD *)v20;
    v26.i32[0] = *(_DWORD *)(v20 + 4);
    v24.i32[0] = *(_DWORD *)(v20 + 8);
    double v25 = (__int32 *)(v20 + 12);
    v26.i32[1] = *(_DWORD *)(v20 + 16);
    uint64_t v27 = (__int32 *)(v20 + 20);
    if (fabsf(v22) > 0.00000001) {
      float v22 = 1.0 / v22;
    }
    v24.i32[1] = *v27;
    v23.i32[1] = *v25;
    float32x2_t v28 = vmul_n_f32(vmla_n_f32(vmla_n_f32(v24, v26, *v9), v23, v21), v22);
    float32x2_t result = vminnm_f32(result, vminnm_f32(vmaxnm_f32(vsub_f32(v28, v12), 0LL), vmaxnm_f32(vsub_f32(v18, v28), 0LL)));
    v9 += 2;
    ++v3;
  }

  while (v3 != 4);
  return result;
}

uint64_t GVSLogTransform(FILE *a1, int a2, uint64_t a3, int a4, int a5)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (a4 >= 1)
  {
    uint64_t v15 = 0LL;
    uint64_t v13 = a4;
    uint64_t v7 = 36LL * a4;
    do
    {
      if (a5 >= 1)
      {
        uint64_t v8 = 0LL;
        uint64_t v9 = a3;
        do
        {
          fprintf(a1, "%d\t%d\t%d", a2, v8, v15);
          for (uint64_t i = 0LL; i != 36; i += 4LL)
            fprintf(a1, "\t%E", *(float *)(v9 + i));
          for (uint64_t j = 0LL; j != 36; j += 4LL)
            fprintf(a1, "\t0x%x", *(_DWORD *)(v9 + j));
          fputc(10, a1);
          ++v8;
          v9 += v7;
        }

        while (v8 != a5);
      }

      ++v15;
      a3 += 36LL;
    }

    while (v15 != v13);
  }

  return 0LL;
}

affineGPUMetal *AffineTransformContextAlloc(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/VideoProcessors/VideoStabilizationV2.bundle"));
  if (!v3)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v1, v9, v10, v11, v12, v13, v14);
LABEL_8:
    uint64_t v7 = 0LL;
    goto LABEL_5;
  }

  int v4 = -[FigMetalContext initWithbundle:andOptionalCommandQueue:]( objc_alloc(&OBJC_CLASS___FigMetalContext),  "initWithbundle:andOptionalCommandQueue:",  v3,  v2);
  if (!v4)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v1, v9, v10, v11, v12, v13, v14);
    FigSignalErrorAt(4294893831LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    goto LABEL_8;
  }

  int v5 = v4;
  float v6 = -[affineGPUMetal initWithMetalContext:](objc_alloc(&OBJC_CLASS___affineGPUMetal), "initWithMetalContext:", v4);
  uint64_t v7 = v6;
  if (v6)
  {
    CFRetain(v6);
  }

  else
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v1, v9, v10, v11, v12, v13, v14);
    FigSignalErrorAt(4294893831LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

LABEL_5:
  return v7;
}

uint64_t AffineTransformContextSetPriority(void *a1, uint64_t a2)
{
  return 0LL;
}

id AffineTransformSetOptions(void *a1, const char *a2)
{
  return [a1 setFillExtendedRowsInOutputBuffer:a2];
}

id AffineTransformSetOverscanFill(void *a1, const char *a2, uint64_t a3)
{
  return [a1 setOverscan:a2 height:a3];
}

uint64_t AffineTransformArrayApply( void *a1, opaqueCMSampleBuffer *a2, __CVBuffer *a3, uint64_t a4, uint64_t a5, void *a6, double a7, double a8)
{
  id v15 = a6;
  id v16 = a1;
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a2);
  CFTypeRef v18 = CMGetAttachment(a2, @"MetadataDictionary", 0LL);
  float32x2_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  uint64_t v20 = v19;
  if (v19)
  {
    float v21 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"QuadraBinningFactor"]);
    BOOL v22 = v21 != 0LL;

    unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(ImageBuffer, 0LL);
    *(void *)&__int128 v24 = __PAIR64__(CVPixelBufferGetHeightOfPlane(ImageBuffer, 0LL), WidthOfPlane);
    __int128 v33 = v24;
    unsigned int v25 = CVPixelBufferGetWidthOfPlane(a3, 0LL);
    uint64_t v26 = (uint64_t)objc_msgSend( v16,  "setTransformsArray:transforms3x3:transformStrides:inputSize:outputSize:pixelBufferValidRect:isQuadraSensor:",  a4,  a5,  v22,  a7,  a8,  *(double *)&v33,  COERCE_DOUBLE(__PAIR64__(CVPixelBufferGetHeightOfPlane(a3, 0), v25)));
    if ((_DWORD)v26)
    {
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v26,  v31,  v30,  v31,  (_DWORD)v33,  *((const char **)&v33 + 1),  v35,  v36);
    }

    else
    {
      id v27 = [v16 renderWithSampleBuffer:a2 pixelBufferValidRect:a5 ltmLUT:v15 outputPixelBuffer:a3 isAttachmentRendering:0];
      if ((_DWORD)v27)
      {
        uint64_t v29 = (uint64_t)v27;
        fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v29,  v31,  v30,  v31,  (_DWORD)v33,  *((const char **)&v33 + 1),  v35,  v36);
        uint64_t v26 = v29;
      }
    }
  }

  else
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v31, v30, v31, v32, v34, v35, v36);
    uint64_t v26 = 4294954516LL;
  }

  return v26;
}

uint64_t AffineTransformArrayApplyOnAttachmentPixelBuffer( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, double a7, double a8, double a9, double a10)
{
  id v20 = a6;
  id v21 = a1;
  if (v20)
  {
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v20 objectForKeyedSubscript:@"QuadraBinningFactor"]);
    BOOL v23 = v22 != 0LL;

    id v24 = [v21 setTransformsArray:a4 transforms3x3:a5 transformStrides:v23 inputSize:a9 outputSize:a10 pixelBufferValidRect:a7 isQuadraSensor:a8];
    if ((_DWORD)v24)
    {
      uint64_t v25 = (uint64_t)v24;
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", v25, v10, v27, v28, v29, v30, v31, v32);
    }

    else
    {
      uint64_t v25 = (uint64_t)[v21 renderWithPixelBuffer:a2 metadata:v20 pixelBufferValidRect:a5 ltmLUT:0 outputPixelBuffer:a3 isAttachmentRendering:1];
    }
  }

  else
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v10, v27, v28, v29, v30, v31, v32);
    uint64_t v25 = 4294954516LL;
  }

  return v25;
}

void AffineTransformFinish(void *a1)
{
  id v1 = a1;
  [v1 finish];
  [v1 resetFirstFrameParameters];
}

void AffineTransformContextRelease(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

id AffineTransformSetRenderMethod(void *a1, const char *a2)
{
  return [a1 setRenderMethod:a2];
}

id AffineTransformConfigureBlurBorderPixels(void *a1, const char *a2)
{
  return [a1 configureBlurWith:a2];
}

id AffineTransformGetBlurBuffersDimensions(void *a1, int a2, int a3, int *a4, int *a5)
{
  id result = [a1 getBlurBuffersDecimationFactor];
  *a4 = a2 / (int)result;
  *a5 = a3 / (int)result;
  return result;
}

id AffineTransformConfigureP3ToBT2020conversion(void *a1, const char *a2)
{
  return [a1 configureP3ToBT2020conversion:a2];
}

id AffineTransformCacheSourcePixelBuffer(void *a1, const char *a2)
{
  return [a1 cacheSourcePixelBuffer:a2];
}

void sub_1E228( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
}

void __destructor_8_AB8s8n2_s8_AE(uint64_t a1)
{
}

LABEL_41:
  uint64_t v46 = 0;
LABEL_42:

  return v46;
}

void __117__affineGPUMetal_renderWithPixelBuffer_metadata_pixelBufferValidRect_ltmLUT_outputPixelBuffer_isAttachmentRendering___block_invoke( id a1, MTLCommandBuffer *a2)
{
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace(822152385LL, 60LL, 0LL, 0LL, 0LL);
  }
}

void __117__affineGPUMetal_renderWithPixelBuffer_metadata_pixelBufferValidRect_ltmLUT_outputPixelBuffer_isAttachmentRendering___block_invoke_2( id a1, MTLCommandBuffer *a2)
{
  float v6 = a2;
  if (-[MTLCommandBuffer status](v6, "status") == &dword_4)
  {
    -[MTLCommandBuffer GPUEndTime](v6, "GPUEndTime");
    double v3 = v2;
    -[MTLCommandBuffer GPUStartTime](v6, "GPUStartTime");
    double v5 = (v3 - v4) * 1000.0;
  }

  else
  {
    double v5 = (double)(unint64_t)-(uint64_t)-[MTLCommandBuffer status](v6, "status");
  }

  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace(822152386LL, 60LL, 0LL, 0LL, *(void *)&v5);
  }
}

LABEL_36:
  return v14;
}

void sub_1F84C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __77__affineGPUMetal__renderBlurInputTextures_inputTexturesCount_outputTextures___block_invoke( id a1, MTLCommandBuffer *a2)
{
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace(822152385LL, 65LL, 0LL, 0LL, 0LL);
  }
}

void __77__affineGPUMetal__renderBlurInputTextures_inputTexturesCount_outputTextures___block_invoke_2( id a1, MTLCommandBuffer *a2)
{
  float v6 = a2;
  if (-[MTLCommandBuffer status](v6, "status") == &dword_4)
  {
    -[MTLCommandBuffer GPUEndTime](v6, "GPUEndTime");
    double v3 = v2;
    -[MTLCommandBuffer GPUStartTime](v6, "GPUStartTime");
    double v5 = (v3 - v4) * 1000.0;
  }

  else
  {
    double v5 = (double)(unint64_t)-(uint64_t)-[MTLCommandBuffer status](v6, "status");
  }

  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace(822152386LL, 65LL, 0LL, 0LL, *(void *)&v5);
  }
}

void sub_20DD4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, void *a45, void *a46, uint64_t a47, void *a48, void *a49, char a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
  for (uint64_t i = 24LL; i != -24; i -= 24LL)
    __destructor_8_AB8s8n2_s8_AE((uint64_t)(&a50 + i));

  for (uint64_t j = 48LL; j != -24; j -= 24LL)
    __destructor_8_AB8s8n2_s8_AE((uint64_t)(&a56 + j));

  _Unwind_Resume(a1);
}

void __copy_assignment_8_8_t0w4_AB8s8n2_s8_AE(_DWORD *a1, _DWORD *a2)
{
  uint64_t v2 = 0LL;
  double v3 = a2 + 2;
  *a1 = *a2;
  double v4 = a1 + 2;
  do
  {
    objc_storeStrong((id *)&v4[v2], *(id *)&v3[v2]);
    v2 += 2LL;
  }

  while (v2 != 4);
}

#error "213D4: call analysis failed (funcsize=29)"
#error "2146C: call analysis failed (funcsize=29)"
#error "21528: call analysis failed (funcsize=50)"
int __cdecl -[affineGPUMetal _createRenderPipelinesForShaders:](affineGPUMetal *self, SEL a2, id a3)
{
  const char *v3;
  const char *v5;
  const char *v6;
  MTLFunctionConstantValues *v7;
  uint64_t v8;
  const char *v9;
  MTLFunctionConstantValues *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unsigned int v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  unsigned int v26;
  int v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  uint64_t v33;
  MTLRenderPipelineState *v34;
  int v35;
  const char *v37;
  uint64_t v38;
  MTLRenderPipelineState **pipelineRenderStates;
  const char *v40;
  id obj;
  unsigned int v42;
  unsigned int v43;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  int v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  double v48 = 0u;
  double v49 = 0u;
  double v50 = 0u;
  float32x2_t v51 = 0u;
  obuint64_t j = a3;
  double v5 = (const char *)[obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v5)
  {
    float v6 = v5;
    uint64_t v7 = 0LL;
    pipelineRenderStates = self->_pipelineRenderStates;
    uint64_t v8 = *(void *)v49;
    uint64_t v38 = *(void *)v49;
    while (2)
    {
      uint64_t v9 = 0LL;
      int v10 = v7;
      char v40 = v6;
      do
      {
        if (*(void *)v49 != v8) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)v9);
        float32x2_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"functionConstants"]);
        uint64_t v7 = objc_alloc_init(&OBJC_CLASS___MTLFunctionConstantValues);

        if (!v7)
        {
          fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v3,  v37,  v3,  v38,  (const char *)pipelineRenderStates,  v40,  (_DWORD)obj);
          id v35 = FigSignalErrorAt(4294893831LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
LABEL_20:

          goto LABEL_21;
        }

        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"index"]);
        uint64_t v45 = [v13 unsignedIntValue];

        int v14 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"pixelFormat"]);
        id v15 = [v14 unsignedIntValue];

        id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"deltaMapPixelFormat"]);
        double v43 = [v16 unsignedIntValue];

        double v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"unstyledPixelFormat"]);
        uint64_t v42 = [v17 unsignedIntValue];

        CFTypeRef v18 = (void *)objc_claimAutoreleasedReturnValue(-[FigMetalContext device](self->_metalContext, "device"));
        float64x2_t v44 = v15;
        MTLPixelFormatGetInfoForDevice(&v46, v18, v15);
        LOBYTE(v15) = v47;

        if ((v15 & 0x10) != 0)
        {
          if ([v12 count])
          {
            float32x2_t v19 = 0LL;
            id v20 = 1;
            do
            {
              id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:v19]);
              BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:1]);
              BOOL v23 = [v22 BOOLValue];

              LOBYTE(v46) = v23;
              id v24 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:v19]);
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectAtIndexedSubscript:0]);
              uint64_t v26 = [v25 unsignedIntValue];
              id v27 = v46;
              if (!v26) {
                id v27 = self->_useBicubic & v46;
              }
              LOBYTE(v46) = v27 != 0;

              float32x2_t v28 = (void *)objc_claimAutoreleasedReturnValue([v12 objectAtIndexedSubscript:v19]);
              int v29 = (void *)objc_claimAutoreleasedReturnValue([v28 objectAtIndexedSubscript:0]);
              -[MTLFunctionConstantValues setConstantValue:type:atIndex:]( v7,  "setConstantValue:type:atIndex:",  &v46,  53,  [v29 unsignedIntValue]);

              float32x2_t v19 = v20;
            }

            while ((unint64_t)[v12 count] > v20++);
          }

          float v31 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"vertName"]);
          int v32 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"fragName"]);
          __int128 v33 = objc_claimAutoreleasedReturnValue( -[affineGPUMetal _compileShader:fragment:pixelFormat:deltaMapPixelFormat:unstyledPixelFormat:constants:]( self,  "_compileShader:fragment:pixelFormat:deltaMapPixelFormat:unstyledPixelFormat:constants:",  v31,  v32,  v44,  v43,  v42,  v7));
          uint64_t v34 = pipelineRenderStates[v45];
          pipelineRenderStates[v45] = (MTLRenderPipelineState *)v33;

          float v6 = v40;
          uint64_t v8 = v38;
          if (!pipelineRenderStates[v45])
          {
            fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
            FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v3,  v37,  v3,  v38,  (const char *)pipelineRenderStates,  v40,  (_DWORD)obj);
            id v35 = -12786;
            goto LABEL_20;
          }
        }

        ++v9;
        int v10 = v7;
      }

      while (v9 != v6);
      float v6 = (const char *)[obj countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v6) {
        continue;
      }
      break;
    }

    id v35 = 0;
LABEL_21:
  }

  else
  {
    id v35 = 0;
  }

  return v35;
}

LABEL_58:
            uint64_t v26 = !v8;
            id v27 = 547LL;
LABEL_75:
            float32x2_t v28 = 588LL;
LABEL_77:
            if (v26) {
              CFTypeRef v18 = v27;
            }
            else {
              CFTypeRef v18 = v28;
            }
            double v17 = 1;
            goto LABEL_81;
          }

          goto LABEL_74;
        }

        if (PixelFormatType != 641230384)
        {
          id v20 = 641234480;
LABEL_64:
          if (PixelFormatType != v20) {
            goto LABEL_175;
          }
        }

LABEL_76:
        uint64_t v26 = !v8;
        id v27 = 540LL;
        float32x2_t v28 = 10LL;
        goto LABEL_77;
      }

      if (PixelFormatType <= 758674991)
      {
        if (PixelFormatType == 645428786) {
          goto LABEL_58;
        }
        id v20 = 758670896;
        goto LABEL_64;
      }

      if (PixelFormatType == 758674992) {
        goto LABEL_76;
      }
      if (PixelFormatType == 762865200) {
        goto LABEL_74;
      }
      id v21 = 26162;
      goto LABEL_56;
    }

    if (PixelFormatType <= 796419633)
    {
      if (PixelFormatType <= 792225327)
      {
        if (PixelFormatType == 762869296) {
          goto LABEL_74;
        }
        id v21 = 30258;
LABEL_56:
        BOOL v22 = v21 | 0x2D780000;
        goto LABEL_57;
      }

      if (PixelFormatType == 792225328 || PixelFormatType == 792229424) {
        goto LABEL_76;
      }
      float32x2_t v19 = 26160;
      goto LABEL_70;
    }

    if (PixelFormatType <= 796423729)
    {
      if (PixelFormatType == 796419634) {
        goto LABEL_58;
      }
      float32x2_t v19 = 30256;
LABEL_70:
      id v16 = v19 | 0x2F780000;
      goto LABEL_73;
    }

    if (PixelFormatType == 796423730) {
      goto LABEL_58;
    }
    if (PixelFormatType != 875704422 && PixelFormatType != 875704438) {
      goto LABEL_175;
    }
    BOOL v23 = 540LL;
    id v24 = 10LL;
    if (v7)
    {
      id v24 = 80LL;
      uint64_t v25 = 4;
    }

    else
    {
      uint64_t v25 = 1;
    }

LABEL_140:
    if (v8) {
      CFTypeRef v18 = v24;
    }
    else {
      CFTypeRef v18 = v23;
    }
    if (v8) {
      double v17 = v25;
    }
    else {
      double v17 = 1;
    }
    goto LABEL_81;
  }

  if (PixelFormatType > 2016686639)
  {
    if (PixelFormatType > 2084075055)
    {
      if (PixelFormatType <= 2088265265)
      {
        if (PixelFormatType == 2084075056) {
          goto LABEL_76;
        }
        id v16 = 2088265264;
LABEL_73:
        if (PixelFormatType != v16) {
          goto LABEL_175;
        }
        goto LABEL_74;
      }

      if (PixelFormatType == 2088265266) {
        goto LABEL_58;
      }
      if (PixelFormatType == 2088269360) {
        goto LABEL_74;
      }
      BOOL v22 = 2088269362;
LABEL_57:
      if (PixelFormatType != v22) {
        goto LABEL_175;
      }
      goto LABEL_58;
    }

    if (PixelFormatType <= 2019963439)
    {
      if (PixelFormatType != 2016686640)
      {
        if (PixelFormatType != 2016686642) {
          goto LABEL_175;
        }
LABEL_61:
        BOOL v23 = 544LL;
        goto LABEL_137;
      }
    }

    else if (PixelFormatType != 2019963440)
    {
      if (PixelFormatType != 2019963442)
      {
        id v20 = 2084070960;
        goto LABEL_64;
      }

      goto LABEL_61;
    }

    BOOL v23 = 543LL;
LABEL_137:
    id v24 = 20LL;
    if (v7)
    {
      id v24 = 60LL;
      uint64_t v25 = 2;
    }

    else
    {
      uint64_t v25 = 1;
    }

    goto LABEL_140;
  }

  if (PixelFormatType <= 1815491697)
  {
    if (PixelFormatType <= 1278226533)
    {
      if (PixelFormatType == 1111970369)
      {
        double v17 = 1;
        CFTypeRef v18 = MTLPixelFormatBGRA8Unorm;
      }

      else
      {
        if (PixelFormatType != 1278226488) {
          goto LABEL_175;
        }
        double v17 = 1;
        CFTypeRef v18 = MTLPixelFormatR8Unorm;
      }
    }

    else
    {
      double v17 = 1;
      if (PixelFormatType == 1278226534)
      {
        CFTypeRef v18 = MTLPixelFormatR32Float;
      }

      else
      {
        CFTypeRef v18 = MTLPixelFormatR16Float;
        if (PixelFormatType != 1278226536 && PixelFormatType != 1751411059) {
          goto LABEL_175;
        }
      }
    }

    goto LABEL_81;
  }

  if (PixelFormatType > 1882468913)
  {
    if (PixelFormatType == 1882468914) {
      goto LABEL_58;
    }
    if (PixelFormatType == 1885745712)
    {
LABEL_74:
      uint64_t v26 = !v8;
      id v27 = 546LL;
      goto LABEL_75;
    }

    BOOL v22 = 1885745714;
    goto LABEL_57;
  }

  if (PixelFormatType != 1815491698)
  {
    id v16 = 1882468912;
    goto LABEL_73;
  }

  double v17 = 1;
  CFTypeRef v18 = MTLPixelFormatRGBA16Unorm;
LABEL_81:
  int v29 = v8;
  unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffera, 0LL);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffera, 0LL);
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(pixelBuffera);
  if (IOSurfaceGetCompressionTypeOfPlane(IOSurface, 0LL) == 3
    || IOSurfaceGetCompressionTypeOfPlane(IOSurface, 0LL) == 4)
  {
    __int128 v33 = v7;
    uint64_t v34 = 16391LL;
  }

  else
  {
    __int128 v33 = v7;
    uint64_t v34 = 7LL;
  }

  uint64_t v70 = kCVMetalTextureUsage;
  id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v34));
  float v71 = v35;
  id v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v71,  &v70,  1LL));

  if (CVMetalTextureCacheCreateTextureFromImage( kCFAllocatorDefault,  *cacheOut,  pixelBuffera,  v15,  v18,  WidthOfPlane / v17,  HeightOfPlane,  0LL,  &image))
  {
    uint64_t v58 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(textureOut) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v58,  "<<<< affineGPUMetalV2 >>>> Fig",  "cvReturn == kCVReturnSuccess",  "bail",  "Unable to cache pixel buffer luma texture",  "affineGPUMetalV2.m",  3334LL,  textureOut);
    goto LABEL_187;
  }

  Texture = CVMetalTextureGetTexture(image);
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(Texture);
  uint64_t v38 = a6->var1[0];
  a6->var1[0] = v37;

  if (!a6->var1[0])
  {
    float v59 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(textureOut) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v59,  "<<<< affineGPUMetalV2 >>>> Fig",  "textures->texture[0]",  "bail",  "Unable to get metal luma texture address",  "affineGPUMetalV2.m",  3338LL,  textureOut);
    goto LABEL_187;
  }

  ++a6->var0;
  if (image) {
    CFRelease(image);
  }
  if (!v29) {
    goto LABEL_174;
  }
  char v39 = CVPixelBufferGetPixelFormatType(pixelBuffera);
  char v40 = 1;
  uint64_t v13 = -12782;
  uint64_t v41 = MTLPixelFormatRG8Unorm;
  if (v39 <= 1111970368)
  {
    uint64_t v42 = v15;
    if (v39 <= 762869295)
    {
      if (v39 <= 645428785)
      {
        if (v39 > 645424687)
        {
          if (v39 == 645424688 || v39 == 645424690) {
            goto LABEL_169;
          }
          double v43 = 645428784;
LABEL_168:
          if (v39 == v43) {
            goto LABEL_169;
          }
LABEL_179:
          id v15 = v42;
          goto LABEL_175;
        }

        if (v39 == 641230384) {
          goto LABEL_170;
        }
        uint64_t v45 = 641234480;
LABEL_156:
        if (v39 == v45) {
          goto LABEL_170;
        }
        goto LABEL_179;
      }

      if (v39 > 758674991)
      {
        if (v39 == 758674992) {
          goto LABEL_170;
        }
        if (v39 == 762865200) {
          goto LABEL_169;
        }
        uint64_t v46 = 26162;
        goto LABEL_150;
      }

      if (v39 != 645428786)
      {
        uint64_t v45 = 758670896;
        goto LABEL_156;
      }

      goto LABEL_169;
    }

    if (v39 > 796419633)
    {
      if (v39 <= 796423729)
      {
        if (v39 == 796419634) {
          goto LABEL_169;
        }
        float64x2_t v44 = 30256;
LABEL_164:
        double v43 = v44 | 0x2F780000;
        goto LABEL_168;
      }

      if (v39 == 796423730) {
        goto LABEL_169;
      }
      if (v39 != 875704422 && v39 != 875704438) {
        goto LABEL_179;
      }
      if (v33) {
        uint64_t v41 = MTLPixelFormatBGRA8Unorm;
      }
      else {
        uint64_t v41 = MTLPixelFormatRG8Unorm;
      }
      if (v33) {
        char v40 = 2;
      }
      else {
        char v40 = 1;
      }
    }

    else
    {
      if (v39 <= 792225327)
      {
        if (v39 != 762869296)
        {
          uint64_t v46 = 30258;
LABEL_150:
          double v43 = v46 | 0x2D780000;
          goto LABEL_168;
        }

LABEL_169:
        uint64_t v41 = MTLPixelFormatRGBA8Uint|0x204LL;
        goto LABEL_170;
      }

      if (v39 != 792225328 && v39 != 792229424)
      {
        float64x2_t v44 = 26160;
        goto LABEL_164;
      }
    }

LABEL_170:
    double v49 = CVPixelBufferGetWidthOfPlane(pixelBuffera, 1uLL);
    double v50 = CVPixelBufferGetHeightOfPlane(pixelBuffera, 1uLL);
    float32x2_t v51 = v49 / v40;
    id v15 = v42;
    if (CVMetalTextureCacheCreateTextureFromImage( kCFAllocatorDefault,  *cacheOut,  pixelBuffera,  v42,  v41,  v51,  v50,  1uLL,  &image))
    {
      float v60 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(textureOuta) = 0;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v60,  "<<<< affineGPUMetalV2 >>>> Fig",  "cvReturn == kCVReturnSuccess",  "bail",  "Unable to cache pixel buffer chroma texture",  "affineGPUMetalV2.m",  3460LL,  textureOuta);
    }

    else
    {
      int v52 = CVMetalTextureGetTexture(image);
      __int128 v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
      __int128 v54 = a6->var1[1];
      a6->var1[1] = v53;

      if (a6->var1[1])
      {
        ++a6->var0;
        if (image) {
          CFRelease(image);
        }
        goto LABEL_174;
      }

      int v61 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      LODWORD(textureOuta) = 0;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v61,  "<<<< affineGPUMetalV2 >>>> Fig",  "textures->texture[1]",  "bail",  "Unable to get chroma texture address",  "affineGPUMetalV2.m",  3464LL,  textureOuta);
    }

LABEL_187:
    uint64_t v13 = -12786;
    goto LABEL_175;
  }

  if (v39 > 2016686639)
  {
    uint64_t v42 = v15;
    if (v39 > 2084075055)
    {
      if (v39 <= 2088265265)
      {
        if (v39 == 2084075056) {
          goto LABEL_170;
        }
        double v48 = 26160;
      }

      else
      {
        if (v39 == 2088265266 || v39 == 2088269360) {
          goto LABEL_169;
        }
        double v48 = 30258;
      }

      double v43 = v48 | 0x7C780000;
      goto LABEL_168;
    }

    if (v39 <= 2019963439)
    {
      if (v39 != 2016686640 && v39 != 2016686642) {
        goto LABEL_179;
      }
    }

    else if (v39 != 2019963440 && v39 != 2019963442)
    {
      uint64_t v45 = 2084070960;
      goto LABEL_156;
    }

    uint64_t v41 = MTLPixelFormatRG16Unorm;
    goto LABEL_170;
  }

  if (v39 > 1815491697)
  {
    if (v39 <= 1882468913)
    {
      if (v39 == 1815491698)
      {
LABEL_174:
        uint64_t v13 = 0;
        goto LABEL_175;
      }

      id v47 = 1882468912;
    }

    else
    {
      if (v39 == 1882468914 || v39 == 1885745712) {
        goto LABEL_161;
      }
      id v47 = 1885745714;
    }

    if (v39 != v47) {
      goto LABEL_175;
    }
LABEL_161:
    uint64_t v42 = v15;
    goto LABEL_169;
  }

  if ((v39 - 1278226488) <= 0x30 && ((1LL << (v39 - 56)) & 0x1400000000001LL) != 0
    || v39 == 1111970369
    || v39 == 1751411059)
  {
    goto LABEL_174;
  }

#error "230C4: call analysis failed (funcsize=80)"
#error "23194: call analysis failed (funcsize=44)"
void __cdecl -[affineGPUMetal _addCommandBufferHandler:](affineGPUMetal *self, SEL a2, id a3)
{
  id v4;
  void v5[4];
  id v6;
  id location;
  double v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __43__affineGPUMetal__addCommandBufferHandler___block_invoke;
  v5[3] = &unk_38D78;
  objc_copyWeak(&v6, &location);
  [v4 addCompletedHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void sub_23234(_Unwind_Exception *a1)
{
}

void __43__affineGPUMetal__addCommandBufferHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[537] |= [v4 status] != &dword_4;
  }
}

LABEL_44:
  if (*p_ispProcessingSession)
  {
    CFRelease(*p_ispProcessingSession);
    *p_ispProcessingSession = 0LL;
  }

  ispCaptureDevice = self->_ispCaptureDevice;
  if (ispCaptureDevice)
  {
    CFRelease(ispCaptureDevice);
    self->_ispCaptureDevice = 0LL;
  }

  return (int)v9;
}

void sub_23ECC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void _ispCallbackHandler(void *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  id v7 = a1;
  *((_DWORD *)v7 + 26) = a2;
  id v16 = v7;
  if (gGMFigKTraceEnabled == 1)
  {
    kdebug_trace(822152386LL, 55LL, 0LL, 0LL, 0LL);
    id v7 = v16;
  }

  if (!(_DWORD)a2 && (int)a3 >= 1 && a4)
  {
    uint64_t v8 = a3;
    uint64_t v9 = (CFTypeRef *)(a4 + 8);
    do
    {
      if ([*((id *)v7 + 4) containsObject:*(v9 - 1)])
      {
        CVPixelBufferGetTypeID();
        CFGetTypeID(*v9);
      }

      v9 += 2;
      --v8;
      id v7 = v16;
    }

    while (v8);
  }

  dispatch_semaphore_wait(*((dispatch_semaphore_t *)v7 + 12), 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_signal(*((dispatch_semaphore_t *)v16 + 10));
  --*((_DWORD *)v16 + 28);
  dispatch_semaphore_signal(*((dispatch_semaphore_t *)v16 + 12));
  if (a4)
  {
    int v10 = *(const void **)(a4 + 8);
    if (a3 >= 2)
    {
      uint64_t v11 = kFigCaptureISPProcessingSessionOutputID_PrimaryScalerLowRes;
      float32x2_t v12 = (CFTypeRef *)(a4 + 24);
      uint64_t v13 = a3 - 1LL;
      while (![(id)*(v12 - 1) isEqual:v11])
      {
        v12 += 2;
        if (!--v13) {
          goto LABEL_18;
        }
      }

      CMSetAttachment(v10, @"LowResolutionImageUsedByVideoEncoder", *v12, 0);
    }
  }

  else
  {
    int v10 = 0LL;
  }

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

LABEL_38:
    id v20 = v27;
    id v21 = 0LL;
    float32x2_t v51 = 0LL;
    goto LABEL_33;
  }

  id v27 = -[VISISPStripGeneratorV2 generateStripsWithTransforms:transforms3x3:validBufferRect:]( self->_ispStripGenerator,  "generateStripsWithTransforms:transforms3x3:validBufferRect:",  a8,  v12,  origin,  v53);
  if (v27) {
    goto LABEL_38;
  }
  float32x2_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[VISISPStripGeneratorV2 ISPStripParams](self->_ispStripGenerator, "ISPStripParams"));
  if (!v28)
  {
LABEL_39:
    id v21 = 0LL;
    float32x2_t v51 = 0LL;
LABEL_43:
    id v20 = -12782;
    goto LABEL_33;
  }

  float32x2_t v51 = v28;
  int v29 = [v51 bytes];
  if (!v29)
  {
    id v21 = 0LL;
    goto LABEL_43;
  }

  uint64_t v30 = v29;
  _OWORD v29[2] = -[VISISPRendererV2 _isPixelBuffer422:](self, "_isPixelBuffer422:", a3);
  v30[3] = -[VISISPRendererV2 _isPixelBuffer422:](self, "_isPixelBuffer422:", v24);
LABEL_20:
  float v31 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v21 = v31;
  if (!v31)
  {
    id v20 = 0;
    goto LABEL_33;
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v31,  "setObject:forKeyedSubscript:",  v51,  kFigCaptureISPProcessingSessionParameterKey_SessionTypeSpecificParameters);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_ispBackPressure, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_frameCounterMutex, 0xFFFFFFFFFFFFFFFFLL);
  ++self->_numberOfFramesEnqueued;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_frameCounterMutex);
  int v32 = CMGetAttachment(a3, @"InputDepthPixelBuffer", 0LL);
  __int128 v33 = CMGetAttachment(a3, @"OutputDepthPixelBuffer", 0LL);
  if (v32)
  {
    uint64_t v34 = (uint64_t)v33;
    if (v33)
    {
      double v49 = a8;
      id v35 = v22;
      int v36 = v19;
      uint64_t v37 = v18;
      size_t Width = CVPixelBufferGetWidth(a3);
      double v48 = COERCE_DOUBLE(__PAIR64__(CVPixelBufferGetHeight(a3), Width));
      char v39 = CVPixelBufferGetWidth(a7);
      char v40 = COERCE_DOUBLE(__PAIR64__(CVPixelBufferGetHeight(a7), v39));
      CFTypeRef v18 = v37;
      float32x2_t v19 = v36;
      BOOL v22 = v35;
      uint64_t v41 = AffineTransformArrayApplyOnAttachmentPixelBuffer( self->_gpuRenderer,  (uint64_t)v32,  v34,  (uint64_t)v49,  (uint64_t)&origin,  v18,  v48,  v40,  v12,  v10);
      if (v41)
      {
        id v20 = v41;
        goto LABEL_33;
      }
    }
  }

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_ispRendererLock, 0xFFFFFFFFFFFFFFFFLL);
  ispProcessingSession = self->_ispProcessingSession;
  double v43 = *(uint64_t (**)(OpaqueFigCaptureISPProcessingSession *, VISISPRendererV2 *, __CVBuffer *, void, void *, NSMutableDictionary *))(*(void *)(CMBaseObjectGetVTable(ispProcessingSession) + 16) + 16LL);
  if (!v43)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_ispRendererLock);
    id v20 = -12782;
    goto LABEL_32;
  }

  id v20 = v43(ispProcessingSession, self, a3, v50, v54, v21);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_ispRendererLock);
  if (v20)
  {
LABEL_32:
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_frameCounterMutex, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_ispBackPressure);
    --self->_numberOfFramesEnqueued;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_frameCounterMutex);
    goto LABEL_33;
  }

  float64x2_t v44 = v22;
  uint64_t v45 = v18;
  self->_finishProcessingCompleted = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (!WeakRetained)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_ispWait, 0xFFFFFFFFFFFFFFFFLL);
    if (self->_ispStatus) {
      id v20 = -12782;
    }
    else {
      id v20 = 0;
    }
  }

  CFTypeRef v18 = v45;
  BOOL v22 = v44;
LABEL_33:
  if (v22) {
LABEL_34:
  }
    CMRemoveAttachment(a3, @"LowResolutionImageUsedByVideoEncoder");
LABEL_35:

  return v20;
}

LABEL_21:
      if (PixelFormatType == v5) {
        return result;
      }
      return 0;
    }

    if (PixelFormatType != 1885745714 && PixelFormatType != 2016686642)
    {
      double v5 = 2019963442;
      goto LABEL_21;
    }
  }

  else
  {
    if (PixelFormatType > 762869297)
    {
      if (PixelFormatType > 796423729)
      {
        if (PixelFormatType == 796423730) {
          return result;
        }
        double v5 = 1882468914;
      }

      else
      {
        if (PixelFormatType == 762869298) {
          return result;
        }
        double v5 = 796419634;
      }

      goto LABEL_21;
    }

    if (PixelFormatType != 645424690 && PixelFormatType != 645428786)
    {
      double v5 = 762865202;
      goto LABEL_21;
    }
  }

  return result;
}

LABEL_16:
    int v29 = 0;
    uint64_t v30 = 0;
    float v31 = v24 - v25;
    int v32 = v17 + 23787;
    __asm { FMOV            V0.4S, #1.0 }

    _Q0.f32[0] = (float)v31 * 0.5;
    _Q0.f32[1] = (float)(v26 - v22) * 0.5;
    uint64_t v37 = v21.u32[0];
    uint64_t v38 = v21.i32[1];
    float32x2_t v12 = v75;
    do
    {
      char v39 = 0;
      char v40 = v37;
      uint64_t v41 = v30;
      uint64_t v42 = v29;
      do
      {
        double v43 = &(*a3)[9 * v41];
        v44.i64[0] = *(void *)v43;
        v14.f32[0] = v43[2];
        *(float *)&uint64_t v45 = (float)v39;
        v15.i64[0] = *((void *)v43 + 3);
        uint64_t v46 = vzip1_s32(*(int32x2_t *)v43, *(int32x2_t *)v15.i8);
        *((float *)&v45 + 1) = (float)(v30 * v23);
        *(int32x2_t *)v47.f32 = vzip1_s32(v46, *(int32x2_t *)(v43 + 3));
        *(int32x2_t *)&v47.u32[2] = vdup_lane_s32(v46, 1);
        double v48 = vaddq_f32(_Q0, (float32x4_t)v45);
        v44.i64[1] = *(void *)(v43 + 3);
        v14.f32[1] = v43[5];
        v14.f32[2] = v43[8];
        *(float32x4_t *)(*(void *)self->_inputPoints + 16LL * v42++) = vmlaq_laneq_f32( vmlaq_lane_f32( vmulq_n_f32(v47, v48.f32[0]),  (float32x4_t)vuzp2q_s32(v44, v15),  *(float32x2_t *)v48.f32,  1),  v14,  v48,  2);
        v41 += v20;
        v39 += v18;
        --v40;
      }

      while (v40);
      ++v30;
      v29 += v37;
    }

    while (v30 != v38);
    double v49 = 0;
    double v50 = 0;
    int v52 = (*(unsigned __int16 *)&self->_outputSize[2] + 31) >> 5;
    __int128 v53 = ((*(unsigned __int16 *)self->_outputSize + 31) >> 5) + 1;
    do
    {
      __int128 v54 = 0;
      __int128 v55 = 4 * v50;
      do
      {
        v56.f32[0] = (float)v54 * 32.0;
        v56.f32[1] = (float)v49 * 32.0;
        v57.i32[0] = *(unsigned __int16 *)self->_inputPointsCount;
        v57.i32[1] = *(unsigned __int16 *)&self->_inputPointsCount[2];
        v51.f32[1] = (float)v23;
        v51.f32[0] = (float)v18;
        uint64_t v58 = vdiv_f32(v56, v51);
        float v59 = vrndm_f32(v58);
        float v60 = vcvt_f32_s32(vadd_s32(v57, (int32x2_t)0x100000001LL));
        int v61 = (uint32x2_t)vcvt_s32_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v60, v59), (int8x8_t)v59, (int8x8_t)v60));
        CFIndex v62 = vsub_f32(v58, vcvt_f32_u32(v61));
        uint64_t v63 = *(void *)self->_inputPoints;
        uint64_t v64 = vmlaq_n_f32( vmlaq_n_f32( vmlaq_n_f32( vmulq_n_f32( *(float32x4_t *)(v63 + 16LL * ((_DWORD)v37 * v61.i32[1] + (unsigned __int16)(v61.i16[0] + 1))),  (float)(1.0 - v62.f32[1]) * v62.f32[0]),  *(float32x4_t *)(v63 + 16LL * (v37 * v61.i32[1] + v61.i32[0])),  (float)(1.0 - v62.f32[0]) * (float)(1.0 - v62.f32[1])),  *(float32x4_t *)(v63 + 16LL * (v37 * (unsigned __int16)(v61.i16[2] + 1) + v61.i32[0])),  vmuls_lane_f32(1.0 - v62.f32[0], v62, 1)),  *(float32x4_t *)(v63 + 16LL * ((_DWORD)v37 * (unsigned __int16)(v61.i16[2] + 1)
                                + (unsigned __int16)(v61.i16[0] + 1))),
                vmuls_lane_f32(v62.f32[0], v62, 1));
        float v65 = v50 + 1;
        v17[v50 + 7] = (float)((float)(256.0 * v64.f32[0]) / v64.f32[2]);
        v50 += 2;
        v17[v65 + 7] = (float)(vmuls_lane_f32(256.0, *(float32x2_t *)v64.f32, 1) / v64.f32[2]);
        ++v54;
        v55 += 8;
      }

      while (v53 != v54);
    }

    while (v49++ != v52);
    v17[6] = v55;
    *int v32 = 1;
    *((_BYTE *)v17 + 95174) = 0;
    if (v75)
    {
      float v66 = (unint64_t)[v75 width] / 0x41;
      float v67 = [v75 height];
      v17[23788] = 0;
      v17[23789] = 0;
      v17[23790] = (v66 + *(unsigned __int16 *)self->_inputSize - 1) / v66;
      v17[23791] = (v67 + *(unsigned __int16 *)&self->_inputSize[2] - 1) / v67;
      *((_WORD *)v17 + 47584) = v66;
      *((_WORD *)v17 + 47585) = v67;
      float v68 = (unsigned __int16)[v75 width];
      *((_WORD *)v17 + 47586) = 2 * v68;
      v17[23794] = (unsigned __int16)(2 * v68) * [v75 height];
      if ((v17[23793] & 0x3F) != 0)
      {
        float32x2_t v73 = 0LL;
      }

      else
      {
        uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue(-[FigMetalContext commandQueue](self->_metalContext, "commandQueue"));
        float32x2_t v73 = (void *)objc_claimAutoreleasedReturnValue([v69 commandBuffer]);

        if (v73)
        {
          uint64_t v70 = objc_claimAutoreleasedReturnValue([v73 blitCommandEncoder]);
          if (v70)
          {
            float v71 = (void *)v70;
            memset(v79, 0, sizeof(v79));
            v78[0] = [v75 width];
            v78[1] = [v75 height];
            v78[2] = 1LL;
            [v71 copyFromTexture:v75 sourceSlice:0 sourceLevel:0 sourceOrigin:v79 sourceSize:v78 toBuffer:self->_meshParamsBuffer destinationOffset:95180 destinationByte sPerRow:*((unsigned __int16 *)v32 + 12) destinationBytesPerImage:0];
            [v71 endEncoding];
            [v73 commit];
            [v73 waitUntilCompleted];
            *((_BYTE *)v32 + 26) = 1;

LABEL_31:
            uint64_t v74 = 0;
            goto LABEL_32;
          }
        }
      }

      uint64_t v74 = -12782;
      goto LABEL_32;
    }

    float32x2_t v73 = 0LL;
    goto LABEL_31;
  }

  float32x2_t v73 = 0LL;
  uint64_t v74 = -12780;
LABEL_32:

  return v74;
}

__int128 *_mapTransform2TileCoordinates(__int128 *result, int a2, int a3, int a4, int a5, uint64_t a6)
{
  unint64_t v6 = 0LL;
  __int128 v7 = *result;
  __int128 v8 = result[1];
  *(_DWORD *)(a6 + 32) = *((_DWORD *)result + 8);
  *(_OWORD *)a6 = v7;
  *(_OWORD *)(a6 + 16) = v8;
  do
  {
    *(float *)(a6 + 8 + 4 * v6) = *((float *)result + v6 + 2)
    BOOL v9 = v6 >= 6;
    v6 += 3LL;
  }

  while (!v9);
  for (uint64_t i = 0LL; i != 12; i += 4LL)
    *(float *)(a6 + i) = *(float *)(a6 + i) - (float)(*(float *)(a6 + i + 24) * (float)a2);
  for (uint64_t j = 0LL; j != 12; j += 4LL)
    *(float *)(a6 + j + 12) = *(float *)(a6 + j + 12) - (float)(*(float *)(a6 + j + 24) * (float)a3);
  return result;
}

float *_updateTileBoundingBox(float *result, unint64_t *a2, _WORD *a3, int8x16_t a4)
{
  uint64_t v4 = 0LL;
  a4.i64[0] = *a2;
  int8x16_t v23 = vqtbl1q_s8(a4, (int8x16_t)xmmword_37910);
  float v5 = result[6];
  float v6 = result[7];
  float v7 = result[8];
  float v8 = *result;
  float v9 = result[1];
  float v10 = result[2];
  float v11 = result[3];
  float v12 = result[4];
  float v13 = result[5];
  LOWORD(v14) = *a3;
  LOWORD(v15) = a3[1];
  LOWORD(v16) = a3[2];
  LOWORD(v17) = a3[3];
  do
  {
    float v18 = (float)v23.i16[v4];
    float v19 = (float)v23.i16[v4 + 1];
    double v20 = (float)(v7 + (float)((float)(v6 * v19) + (float)(v5 * v18)));
    if (fabs(v20) > 0.00000001) {
      double v20 = 1.0 / v20;
    }
    float v21 = v20 * (float)(v10 + (float)((float)(v9 * v19) + (float)(v8 * v18)));
    if (v21 < (float)(__int16)v14)
    {
      int v14 = (int)v21;
      *a3 = (int)v21;
    }

    if (v21 > (float)(__int16)v15)
    {
      int v15 = (int)(v21 + 1.0);
      a3[1] = v15;
    }

    float v22 = v20 * (float)(v13 + (float)((float)(v12 * v19) + (float)(v11 * v18)));
    if (v22 < (float)(__int16)v16)
    {
      int v16 = (int)v22;
      a3[2] = (int)v22;
    }

    if (v22 > (float)(__int16)v17)
    {
      int v17 = (int)(v22 + 1.0);
      a3[3] = v17;
    }

    v4 += 2LL;
  }

  while (v4 != 8);
  return result;
}

uint64_t portIndexFromPortType(const void *a1, int *a2)
{
  if (!a1)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "Fig",  "portType",  "bail",  0LL,  "FigMotionProcessingUtilities.c",  68LL,  0);
LABEL_22:
    uint64_t v6 = 4294954516LL;
    return FigSignalErrorAt(v6, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  if (!a2)
  {
    uint64_t v8 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v8,  "Fig",  "portIndex",  "bail",  0LL,  "FigMotionProcessingUtilities.c",  69LL,  0);
    goto LABEL_22;
  }

  if (CFEqual(a1, kFigCapturePortType_BackFacingCamera))
  {
    *a2 = 0;
    return 0LL;
  }

  if (CFEqual(a1, kFigCapturePortType_BackFacingTelephotoCamera))
  {
    int v4 = 1;
LABEL_17:
    *a2 = v4;
    return 0LL;
  }

  if (CFEqual(a1, kFigCapturePortType_BackFacingSuperWideCamera))
  {
    int v4 = 2;
    goto LABEL_17;
  }

  if (CFEqual(a1, kFigCapturePortType_FrontFacingCamera))
  {
    int v4 = 3;
    goto LABEL_17;
  }

  if (CFEqual(a1, kFigCapturePortType_FrontFacingSuperWideCamera))
  {
    int v4 = 4;
    goto LABEL_17;
  }

  if (CFEqual(a1, kFigCapturePortType_FrontFacingInfraredCamera))
  {
    int v4 = 5;
    goto LABEL_17;
  }

  if (CFEqual(a1, kFigCapturePortType_BackFacingSparseTimeOfFlightCamera))
  {
    int v4 = 6;
    goto LABEL_17;
  }

  uint64_t v6 = 4294954513LL;
  return FigSignalErrorAt(v6, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t bravoTransitionCameraIndexFromPortType(const void *a1, int *a2)
{
  if (!a1)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "Fig",  "portType",  "bail",  0LL,  "FigMotionProcessingUtilities.c",  127LL,  0);
LABEL_15:
    uint64_t v6 = 4294954516LL;
    return FigSignalErrorAt(v6, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  if (!a2)
  {
    uint64_t v8 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v8,  "Fig",  "portIndex",  "bail",  0LL,  "FigMotionProcessingUtilities.c",  128LL,  0);
    goto LABEL_15;
  }

  if (CFEqual(a1, kFigCapturePortType_BackFacingCamera))
  {
    *a2 = 0;
    return 0LL;
  }

  if (CFEqual(a1, kFigCapturePortType_BackFacingTelephotoCamera))
  {
    int v4 = 1;
LABEL_9:
    *a2 = v4;
    return 0LL;
  }

  if (CFEqual(a1, kFigCapturePortType_BackFacingSuperWideCamera))
  {
    int v4 = 2;
    goto LABEL_9;
  }

  uint64_t v6 = 4294954513LL;
  return FigSignalErrorAt(v6, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

void FigMotionQuaternionFromDeltaRotation(float *a1)
{
  double v1 = sqrtf((float)((float)(a1[1] * a1[1]) + (float)(*a1 * *a1)) + (float)(a1[2] * a1[2]));
  if (v1 > 1.0e-10) {
    __sincos_stret(v1 * 0.5);
  }
}

int *FigMotionIncreaseRingIndex(int *result, int a2)
{
  *id result = (*result + 1) % a2;
  return result;
}

uint64_t FigMotionComputeLensPositionScalingFactor( const __CFDictionary *a1, int width, uint64_t a3, int a4, uint64_t a5, float *a6)
{
  if (a1)
  {
    if (a6)
    {
      CGSize size = CGRectZero.size;
      CGPoint origin = CGRectZero.origin;
      CGPoint v25 = CGRectZero.origin;
      CGSize v26 = size;
      uint64_t SensorValidCropRect = FigMotionGetSensorValidCropRect(a1, (uint64_t)&v25);
      if (!(_DWORD)SensorValidCropRect)
      {
        uint64_t v12 = kFigCaptureStreamMetadata_ValidBufferRect;
        if (CFDictionaryContainsKey(a1, kFigCaptureStreamMetadata_ValidBufferRect))
        {
          CGPoint v23 = origin;
          CGSize v24 = size;
          FigCFDictionaryGetCGRectIfPresent(a1, v12, &v23);
          if (v24.height > 0.0 && v24.width > 0.0) {
            width = (int)v24.width;
          }
        }

        float v14 = v26.width;
        if (v14 <= 0.0)
        {
          uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "Fig",  "sensorCropRectWidth > 0.0f",  "bail",  0LL,  "FigMotionProcessingUtilities.c",  425LL,  0);
        }

        else
        {
          if (a4 > 0)
          {
            uint64_t v15 = 0LL;
            *a6 = (float)width / (float)((float)a4 * v14);
            return v15;
          }

          uint64_t v20 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v20,  "Fig",  "binningFactorHorizontal > 0",  "bail",  0LL,  "FigMotionProcessingUtilities.c",  426LL,  0);
        }

        return FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
      }

      uint64_t v15 = SensorValidCropRect;
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v15,  v6,  *(const char **)&size.width,  *(const char **)&size.height,  LODWORD(origin.x),  *(const char **)&origin.y,  *(const char **)&v23.x,  LODWORD(v23.y));
      return v15;
    }

    uint64_t v18 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v18,  "Fig",  "lensPositionScalingFactorOut",  "bail",  0LL,  "FigMotionProcessingUtilities.c",  403LL,  0);
  }

  else
  {
    uint64_t v17 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v17,  "Fig",  "metadataDict",  "bail",  0LL,  "FigMotionProcessingUtilities.c",  402LL,  0);
  }

  return FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t FigMotionGetSensorValidCropRect(const __CFDictionary *a1, uint64_t a2)
{
  uint64_t v4 = kFigCaptureStreamMetadata_SensorRawValidBufferRect;
  if ((CFDictionaryContainsKey(a1, kFigCaptureStreamMetadata_SensorRawValidBufferRect)
     || (uint64_t v4 = kFigCaptureStreamMetadata_TotalSensorCropRect,
         CFDictionaryContainsKey(a1, kFigCaptureStreamMetadata_TotalSensorCropRect))
     || (uint64_t v4 = kFigCaptureStreamMetadata_RawCropRect, CFDictionaryContainsKey(a1, kFigCaptureStreamMetadata_RawCropRect)))
    && FigCFDictionaryGetCGRectIfPresent(a1, v4, a2))
  {
    return 0LL;
  }

  else
  {
    return FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

uint64_t FigMotionGetISPHallData(const __CFData *a1, uint64_t a2, int *a3, int a4)
{
  unint64_t Length = CFDataGetLength(a1);
  if (Length <= 7)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v4,  (const char *)time.value,  *(const char **)&time.timescale,  LODWORD(time.epoch),  (const char *)v29.value,  *(const char **)&v29.timescale,  LODWORD(v29.epoch));
    uint64_t v26 = 4294954513LL;
  }

  else
  {
    unint64_t v10 = Length;
    BytePtr = CFDataGetBytePtr(a1);
    if (*(_DWORD *)BytePtr >= 2u)
    {
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v4,  (const char *)time.value,  *(const char **)&time.timescale,  LODWORD(time.epoch),  (const char *)v29.value,  *(const char **)&v29.timescale,  LODWORD(v29.epoch));
      uint64_t v26 = 4294954515LL;
    }

    else
    {
      int v12 = 16;
      if (*(_DWORD *)BytePtr == 1) {
        int v12 = 24;
      }
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v4,  (const char *)time.value,  *(const char **)&time.timescale,  LODWORD(time.epoch),  (const char *)v29.value,  *(const char **)&v29.timescale,  LODWORD(v29.epoch));
      uint64_t v26 = 4294954516LL;
    }
  }

  uint64_t v24 = FigSignalErrorAt(v26, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  BytePtr = 0LL;
  if ((_DWORD)v24)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v27) = v24;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v27,  v4,  (const char *)time.value,  *(const char **)&time.timescale,  LODWORD(time.epoch),  (const char *)v29.value,  *(const char **)&v29.timescale,  LODWORD(v29.epoch));
    return v24;
  }

LABEL_6:
  if (a3)
  {
    int v13 = *((_DWORD *)BytePtr + 1);
    if (v13 >= a4) {
      int v13 = a4;
    }
    *a3 = v13;
    if (*(_DWORD *)BytePtr == 1)
    {
      if (v13 >= 1)
      {
        uint64_t v19 = 0LL;
        uint64_t v20 = (float *)(a2 + 12);
        float v21 = (int *)(BytePtr + 28);
        do
        {
          int64_t v22 = FigHostTimeToNanoseconds(*(void *)(v21 - 5));
          CMTimeMake(&v29, v22, 1000000000);
          *(Float64 *)(v20 - 3) = CMTimeGetSeconds(&v29);
          *(v20 - 1) = (float)*(v21 - 3) * 0.0039062;
          *uint64_t v20 = (float)*(v21 - 2) * 0.0039062;
          v20[1] = (float)*(v21 - 1) * 0.0039062;
          int v23 = *v21;
          v21 += 6;
          v20[2] = (float)v23 * 0.0039062;
          ++v19;
          v20 += 6;
        }

        while (v19 < *a3);
      }
    }

    else
    {
      if (*(_DWORD *)BytePtr) {
        return 4294954515LL;
      }
      if (v13 >= 1)
      {
        uint64_t v14 = 0LL;
        uint64_t v15 = (Float64 *)(a2 + 16);
        int v16 = (int *)(BytePtr + 20);
        do
        {
          int64_t v17 = FigHostTimeToNanoseconds(*(void *)(v16 - 3));
          CMTimeMake(&time, v17, 1000000000);
          *(v15 - 2) = CMTimeGetSeconds(&time);
          *((float *)v15 - 2) = (float)*(v16 - 1) * 0.0039062;
          int v18 = *v16;
          v16 += 4;
          *((float *)v15 - 1) = (float)v18 * 0.0039062;
          *uint64_t v15 = 0.0;
          v15 += 3;
          ++v14;
        }

        while (v14 < *a3);
      }
    }

    return 0LL;
  }

  fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
  LODWORD(v27) = 0;
  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v27,  v4,  (const char *)time.value,  *(const char **)&time.timescale,  LODWORD(time.epoch),  (const char *)v29.value,  *(const char **)&v29.timescale,  LODWORD(v29.epoch));
  return FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

  Boolean Value = (const __CFData *)CFDictionaryGetValue(a1, kFigCaptureCameraInfoKey_CameraViewMatrix);
  if (Value)
  {
    float v11 = Value;
    if (CFDataGetLength(Value) == 48)
    {
      v38.location = 0LL;
      v38.length = 48LL;
      CFDataGetBytes(v11, v38, (UInt8 *)(a2 + 48LL * a4 + 104));
      goto LABEL_9;
    }

    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v32) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v32,  v4,  *(const char **)&point.x,  *(const char **)&point.y,  v34,  v35,  v36,  v37);
    CGPoint v25 = 4294954516LL;
  }

  else
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v32) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v32,  v4,  *(const char **)&point.x,  *(const char **)&point.y,  v34,  v35,  v36,  v37);
    CGPoint v25 = 4294954513LL;
  }

  uint64_t v26 = FigSignalErrorAt(v25, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if ((_DWORD)v26)
  {
    uint64_t v15 = v26;
    id v27 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v32) = v15;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v27,  "Fig",  "err == 0 ",  "bail",  0LL,  "FigMotionProcessingUtilities.c",  2405LL,  v32);
    return v15;
  }

#error "26E60: call analysis failed (funcsize=51)"
#error "26F30: call analysis failed (funcsize=45)"
#error "27034: call analysis failed (funcsize=58)"
#error "27104: call analysis failed (funcsize=45)"
uint64_t FigMotionComputeBravoTranslation( uint64_t a1,  uint64_t a2,  unsigned int a3,  float *a4,  float *a5,  float a6,  float a7)
{
  const char *v7;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  float v19;
  uint64_t v20;
  float v21;
  char v22;
  float v23;
  float v24;
  char v25;
  float *v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float *v32;
  float v33;
  float v34;
  uint64_t result;
  const char *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  HIDWORD(v37) = 0;
  if (!FigCFDictionaryGetFloatIfPresent( a1,  kFigMotionAttachmentsSampleBufferProcessorMetadata_LensPosition,  (char *)&v37 + 4))
  {
    if (!FigCFDictionaryGetFloatIfPresent( a1,  kFigCaptureStreamMetadata_PinholeCameraFocalLength,  (char *)&v37 + 4)
      && !FigCFDictionaryGetFloatIfPresent( a1,  kFigCaptureStreamMetadata_PracticalFocalLength,  (char *)&v37 + 4))
    {
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v7, v36, v37, v38, v39, v40, v41);
      return FigSignalErrorAt(4294954513LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    }

    *((float *)&v37 + 1) = *((float *)&v37 + 1) * a7;
  }

  uint64_t v15 = 0LL;
  int v16 = *(unsigned int *)(a2 + 440);
  int64_t v17 = *(void *)(a2 + 4 + 8 * v16);
  uint64_t v41 = *(void *)(a2 + 4 + 8LL * a3);
  uint64_t v42 = v17;
  char v40 = 0LL;
  uint64_t v19 = *a4;
  int v18 = a4[1];
  *(float *)&char v39 = *a4;
  *((float *)&v39 + 1) = v18;
  uint64_t v38 = 0LL;
  uint64_t v20 = BravoCurrentToReferenceMapping_0[3 * v16 + a3];
  float v21 = (float)(*(float *)(a2 + 4 * v20 + 76) * *(float *)(a2 + 40 + 4LL * a3)) / *(float *)(a2 + 40 + 4 * v16);
  int64_t v22 = 1;
  int v23 = (float)((float)*(int *)(a2 + 64 + 4LL * a3) * a6) / (float)*(int *)(a2 + 64 + 4 * v16);
  do
  {
    uint64_t v24 = *((float *)&v39 + v15);
    CGPoint v25 = v22;
    *((float *)&v40 + v15) = v24 + (float)(a6 * *((float *)&v41 + v15));
    *((float *)&v38 + v15) = v24 + (float)(v21 * (float)(v23 * *((float *)&v42 + v15)));
    uint64_t v15 = 1LL;
    int64_t v22 = 0;
  }

  while ((v25 & 1) != 0);
  uint64_t v26 = (float *)(a2 + 48LL * (int)v20);
  id v27 = v19 - *(float *)&v38;
  float32x2_t v28 = v18 - *((float *)&v38 + 1);
  uint64_t v30 = 0.0;
  if (fabsf(v29) <= 0.00000001)
  {
    float v31 = 0.0;
  }

  else
  {
    float v31 = 0.0;
    if (*((float *)&v37 + 1) > 0.00000001)
    {
      __int128 v33 = v26[26];
      uint64_t v34 = v26[27];
      int v32 = v26 + 26;
      float v31 = (float)(*(float *)&v40
                  + (float)((float)(*((float *)&v37 + 1)
                                  * (float)((float)((float)(v28 * v34) + (float)(v33 * v27))
                                          + (float)(v32[2] * *((float *)&v37 + 1))))
                          / v29))
          - v19;
      uint64_t v30 = (float)(*((float *)&v40 + 1)
                  + (float)((float)(*((float *)&v37 + 1)
                                  * (float)((float)((float)(v28 * v32[5]) + (float)(v32[4] * v27))
                                          + (float)(v32[6] * *((float *)&v37 + 1))))
                          / v29))
          - v18;
    }
  }

  id result = 0LL;
  *a5 = v31;
  a5[1] = v30;
  return result;
}

void FigMotionComputeQuaternionForTimeStamp(uint64_t a1, void *a2, char *a3, double a4)
{
  uint64_t v8 = (_BYTE *)(a1 + 10256);
  BOOL v9 = *(_BYTE *)(a1 + 10257) == 0;
  if (a2)
  {
    *a2 = 0x3FF0000000000000LL;
    a2[1] = 0LL;
    a2[2] = 0LL;
    a2[3] = 0LL;
  }

  uint64_t v10 = 0LL;
  float v11 = flt_37958[v9];
  float v12 = 1.0;
  int v13 = -1;
  do
  {
    float v14 = *(double *)(a1 + 8 + 8 * v10) - a4;
    float v15 = fabsf(v14);
    if (v12 > v15)
    {
      float v12 = v15;
      int v13 = v10;
    }

    ++v10;
  }

  while (v10 != 256);
  if (v12 > v11 && !*v8) {
    low_freq_error_logging();
  }
  if (v13 != -1)
  {
    double v16 = *(double *)(a1 + 8LL * v13 + 8);
    if (v16 >= a4)
    {
      int v22 = (v13 - 1);
      if (v13 + 255 <= 0) {
        int v22 = -(1 - v13);
      }
      uint64_t v20 = v22;
      double v19 = *(double *)(a1 + 8LL * v13 + 8);
      double v16 = *(double *)(a1 + 8LL * v22 + 8);
      uint64_t v18 = v13;
    }

    else
    {
      if (v13 + 1 <= 0) {
        int v17 = --(char)(v13 + 1);
      }
      else {
        int v17 = (v13 + 1);
      }
      uint64_t v18 = v17;
      double v19 = *(double *)(a1 + 8LL * v17 + 8);
      uint64_t v20 = v13;
    }

    double v23 = vabdd_f64(v19, a4);
    double v24 = v11;
    BOOL v26 = v19 >= a4 && v23 <= v24 && v16 <= a4;
    double v27 = vabdd_f64(v16, a4);
    if (v26 && v27 <= v24)
    {
      if (vabdd_f64(v19, v16) > 0.000001)
      {
        float v32 = (a4 - v16) / (v19 - v16);
        FigMotionInterpolateQuaternionsByAngle(a1 + 2056 + 32 * v20, (double *)(a1 + 2056 + 32 * v18), v32);
        *a2 = v33;
        a2[1] = v34;
        a2[2] = v35;
        a2[3] = v36;
        goto LABEL_34;
      }

      uint64_t v29 = a1 + 32 * v20;
    }

    else
    {
      uint64_t v29 = a1 + 32LL * v13;
    }

    uint64_t v30 = (_OWORD *)(v29 + 2056);
    __int128 v31 = v30[1];
    *(_OWORD *)a2 = *v30;
    *((_OWORD *)a2 + 1) = v31;
LABEL_34:
    char v21 = 1;
    goto LABEL_35;
  }

  if (!*v8) {
    low_freq_error_logging();
  }
  char v21 = 0;
LABEL_35:
  *a3 = v21;
}

double FigMotionMultiplyByInverseOfQuaternion(double *a1, uint64_t *a2)
{
  double v3 = *(double *)a2;
  float64x2_t v4 = vnegq_f64(*(float64x2_t *)(a2 + 1));
  double v5 = -*((double *)a2 + 3);
  return FigMotionMultiplyQuaternions(&v3, a1);
}

uint64_t FigMotionComputeLensMovementForTimeStamp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return FigMotionComputeLensMovementAndSagForTimeStamp(a1, a2, 0LL, a3);
}

uint64_t FigMotionInitializeQuaternion(void *a1)
{
  if (!a1) {
    return 4294954516LL;
  }
  uint64_t result = 0LL;
  *a1 = 0x3FF0000000000000LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  a1[3] = 0LL;
  return result;
}

uint64_t low_freq_error_logging()
{
  uint64_t UpTime = FigGetUpTime();
  uint64_t result = FigHostTimeToNanoseconds(UpTime);
  if (low_freq_error_logging_last_log_0) {
    BOOL v2 = (unint64_t)(result - low_freq_error_logging_last_log_0) >= 0x3B9ACA00;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (low_freq_error_logging_filtered_0) {
      low_freq_error_logging_filtered_0 = 0;
    }
    low_freq_error_logging_last_log_0 = result;
  }

  else
  {
    ++low_freq_error_logging_filtered_0;
  }

  return result;
}

void FigMotionInterpolateQuaternionsByAngle(uint64_t a1, double *a2, float a3)
{
  double cosval = *(double *)a1;
  float64x2_t v19 = vnegq_f64(*(float64x2_t *)(a1 + 8));
  double v20 = -*(double *)(a1 + 24);
  double v5 = FigMotionMultiplyQuaternions(&cosval, a2);
  double v8 = v7;
  double v10 = v9;
  if (fabs(v5) <= 1.0)
  {
    double v11 = v6;
    double v12 = acos(v5);
    double v13 = sin(v12);
    double v14 = a3;
    double v15 = v12 * v14;
    if (v13 <= 0.00000001)
    {
      double cosval = cos(v15);
      v19.f64[0] = v8 * v14;
      v19.f64[1] = v10 * v14;
      double v17 = v11 * v14;
    }

    else
    {
      __double2 v16 = __sincos_stret(v15);
      double cosval = v16.__cosval;
      v19.f64[0] = v16.__sinval / v13 * v8;
      v19.f64[1] = v16.__sinval / v13 * v10;
      double v17 = v16.__sinval / v13 * v11;
    }

    double v20 = v17;
    FigMotionMultiplyQuaternions((double *)a1, &cosval);
  }

#error "279BC: call analysis failed (funcsize=144)"
double FigMotionPreMultiplyScalingTranslationToTransform( uint64_t a1,  int8x16_t a2,  int32x4_t a3,  float a4,  float a5,  int8x16_t a6)
{
  int32x4_t v6;
  float32x4_t v7;
  int32x4_t v8;
  float32x4_t v9;
  float32x4_t v10;
  a6.i32[0] = *(_DWORD *)(a1 + 24);
  double v6 = a3;
  *(float *)&v6.i32[1] = a5;
  double v7 = (float32x4_t)vzip1q_s32(v6, v6);
  v7.i32[2] = a3.i32[0];
  double v8 = (int32x4_t)a2;
  *(float *)&v8.i32[1] = a4;
  double v9 = (float32x4_t)vzip1q_s32(v8, v8);
  v9.i32[2] = a2.i32[0];
  a2.i64[0] = *(void *)(a1 + 28);
  double v10 = (float32x4_t)vextq_s8(vextq_s8(a6, a6, 4uLL), a2, 0xCuLL);
  v10.i32[3] = v10.i32[0];
  *(float32x4_t *)a1 = vmlaq_f32(vmulq_f32(v10, v7), *(float32x4_t *)a1, v9);
  *(float32x2_t *)a2.i8 = vmla_n_f32(vmul_n_f32(*(float32x2_t *)a2.i8, a5), *(float32x2_t *)(a1 + 16), a4);
  *(void *)(a1 + 16) = a2.i64[0];
  return *(double *)a2.i64;
}

float FigMotionPostMultiplyScalingTranslationToTransform(float *a1, float a2, float a3, float a4, float a5)
{
  float v5 = *a1;
  float v6 = a1[1];
  float v7 = a1[3];
  float v8 = a1[4];
  float v9 = a1[6];
  float v10 = a1[7];
  float v11 = (float)(a1[2] + (float)(a5 * v6)) + (float)(a3 * *a1);
  float v12 = (float)(a1[5] + (float)(a5 * v8)) + (float)(a3 * v7);
  a1[8] = (float)(a1[8] + (float)(a5 * v10)) + (float)(a3 * v9);
  float v13 = v5 * a2;
  a1[2] = v11;
  a1[3] = v7 * a2;
  float result = v9 * a2;
  *a1 = v13;
  a1[1] = v6 * a4;
  a1[4] = v8 * a4;
  a1[5] = v12;
  a1[6] = result;
  a1[7] = v10 * a4;
  return result;
}

double FigMotionApplyDigitalZoomToTransform( int a1, float *a2, int8x16_t a3, int32x4_t a4, double a5, double a6, int8x16_t a7)
{
  if (*(float *)a3.i32 > 0.0)
  {
    *(float *)a7.i32 = 1.0 / *(float *)a3.i32;
    if (a1) {
      float v7 = 1.0 / *(float *)a3.i32;
    }
    else {
      float v7 = *(float *)a3.i32;
    }
    float v8 = *(double *)a4.i64;
    *(float *)a4.i32 = (float)(1.0 - v7) * v8;
    float v9 = a5;
    float v10 = (float)(1.0 - v7) * v9;
    if (a1) {
      *(float *)a3.i32 = FigMotionPostMultiplyScalingTranslationToTransform( a2,  1.0 / *(float *)a3.i32,  *(float *)a4.i32,  *(float *)a7.i32,  v10);
    }
    else {
      *(double *)a3.i64 = FigMotionPreMultiplyScalingTranslationToTransform( (uint64_t)a2,  a3,  a4,  *(float *)a3.i32,  v10,  a7);
    }
  }

  return *(double *)a3.i64;
}

double FigMotionComputeTransformFromRotation(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4)
{
  __int128 v6 = *a3;
  __int128 v7 = a3[1];
  *(_DWORD *)(a4 + 32) = *((_DWORD *)a3 + 8);
  *(_OWORD *)a4 = v6;
  *(_OWORD *)(a4 + 16) = v7;
  *(float *)&__int128 v7 = *(double *)(a2 + 8);
  float v8 = *(double *)(a2 + 16);
  FigMotionPostMultiplyScalingTranslationToTransform( (float *)a4,  1.0 / *(float *)a2,  (float)-*(float *)&v7 / *(float *)a2,  1.0 / *(float *)a2,  (float)-v8 / *(float *)a2);
  v9.i32[0] = *(_DWORD *)a1;
  v10.i64[0] = *(void *)(a1 + 8);
  *(float *)v10.i32 = *(double *)v10.i64;
  float v11 = *(double *)(a1 + 16);
  return FigMotionPreMultiplyScalingTranslationToTransform(a4, v9, v10, *(float *)a1, v11, v12);
}

double FigMotionAdjustBravoDataForReferenceCamera(uint64_t a1)
{
  if (a1)
  {
    if ((*(_BYTE *)a1 & 6) != 0)
    {
      _computeExtrinsicMatrixBetweenCamera(a1, 0, 6, 2);
      _computeExtrinsicMatrixBetweenCamera(a1, 5, 4, 2);
      _invertExtrinsicMatrixStoredInBravoData(a1, 2, 1);
      _computeExtrinsicMatrixBetweenCamera(a1, 1, 6, 4);
      _invertExtrinsicMatrixStoredInBravoData(a1, 0, 1);
      _invertExtrinsicMatrixStoredInBravoData(a1, 0, 2);
      double result = 0.0;
      *(_OWORD *)(a1 + 392) = 0u;
      *(_OWORD *)(a1 + 40_Block_object_dispose(va, 8) = 0u;
      *(_OWORD *)(a1 + 424) = 0u;
      *(_DWORD *)(a1 + 392) = 1065353216;
      *(_DWORD *)(a1 + 412) = 1065353216;
      *(_DWORD *)(a1 + 432) = 1065353216;
    }
  }

  return result;
}

float *_computeExtrinsicMatrixBetweenCamera(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v4 = 0LL;
  float v5 = (float *)(a1 + 104 + 48LL * a3);
  __int128 v6 = (float *)(a1 + 104 + 48LL * a4);
  __int128 v7 = v33;
  float v8 = (double *)v32;
  int8x16_t v9 = v5;
  int32x4_t v10 = v6;
  do
  {
    uint64_t v11 = 0LL;
    int8x16_t v12 = v8;
    do
    {
      *(double *)&v7[8 * v11] = v9[v11];
      double *v12 = v10[v11];
      v12 += 3;
      ++v11;
    }

    while (v11 != 3);
    ++v4;
    v10 += 4;
    v9 += 4;
    v7 += 24;
    ++v8;
  }

  while (v4 != 3);
  uint64_t v13 = 0LL;
  double v14 = v32;
  do
  {
    uint64_t v15 = 0LL;
    __double2 v16 = (double *)v33;
    do
    {
      uint64_t v17 = 0LL;
      double v18 = 0.0;
      float64x2_t v19 = v16;
      do
      {
        double v20 = *v19;
        v19 += 3;
        double v18 = v18 + *(double *)&v14[v17] * v20;
        v17 += 8LL;
      }

      while (v17 != 24);
      *(double *)&v31[6 * v13 + 3 + 2 * v15++] = v18;
      ++v16;
    }

    while (v15 != 3);
    ++v13;
    v14 += 24;
  }

  while (v13 != 3);
  uint64_t v21 = 0LL;
  uint64_t v22 = 0LL;
  float v23 = v5[7] - v6[7];
  uint64_t v24 = a1 + 48LL * a2 + 104;
  v31[0] = v5[3] - v6[3];
  v31[1] = v23;
  v31[2] = v5[11] - v6[11];
  uint64_t v25 = v24;
  do
  {
    uint64_t v26 = 0LL;
    uint64_t v27 = (4 * v22) | 3;
    *(_DWORD *)(v24 + 4 * v27) = 0;
    double result = &v31[v21 + 3];
    do
    {
      float v29 = *(double *)&result[2 * v26];
      *(float *)(v25 + 4 * v26) = v29;
      float v30 = *(float *)(v24 + 4 * v27) + *(double *)&v32[8 * v26 + v21 * 4] * v31[v26];
      *(float *)(v24 + 4 * v27) = v30;
      ++v26;
    }

    while (v26 != 3);
    ++v22;
    v25 += 16LL;
    v21 += 6LL;
  }

  while (v22 != 3);
  return result;
}

float _invertExtrinsicMatrixStoredInBravoData(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = 0LL;
  uint64_t v4 = (float *)(a1 + 104 + 48LL * BravoCurrentToReferenceMapping_0[3 * a2 + a3]);
  uint64_t v5 = a1 + 104 + 48LL * BravoCurrentToReferenceMapping_0[3 * a3 + a2];
  do
  {
    *(float *)(v5 + v3 * 4) = v4[dword_37994[v3]];
    ++v3;
  }

  while (v3 != 12);
  for (uint64_t i = 0LL; i != 48; i += 16LL)
  {
    *(float *)(v5 + i + 12) = result;
  }

  return result;
}

uint64_t FigMotionGetBravoDataFromDictionary(const __CFDictionary *a1, uint64_t a2)
{
  if (!a1 || !a2)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "Fig",  "cameraInfoByPortType && bravoData",  "bail",  0LL,  "FigMotionProcessingUtilities.c",  2432LL,  0);
    return FigSignalErrorAt(4294954513LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  Boolean Value = (const __CFDictionary *)CFDictionaryGetValue(a1, kFigCapturePortType_BackFacingCamera);
  if (!Value)
  {
    uint64_t v20 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v20,  "Fig",  "wideCameraInfo",  "bail",  0LL,  "FigMotionProcessingUtilities.c",  2436LL,  0);
    return FigSignalErrorAt(4294954513LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  uint64_t v5 = Value;
  __int128 v6 = (const __CFDictionary *)CFDictionaryGetValue(a1, kFigCapturePortType_BackFacingTelephotoCamera);
  __int128 v7 = (const __CFDictionary *)CFDictionaryGetValue(a1, kFigCapturePortType_BackFacingSuperWideCamera);
  if (!((unint64_t)v6 | (unint64_t)v7))
  {
    uint64_t v21 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v21,  "Fig",  "teleCameraInfo || superWideCameraInfo",  "bail",  0LL,  "FigMotionProcessingUtilities.c",  2440LL,  0);
    return FigSignalErrorAt(4294954513LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  float v8 = v7;
  memset_pattern16((void *)(a2 + 28), &unk_379D0, 0xCuLL);
  memset_pattern16((void *)(a2 + 40), &unk_379D0, 0xCuLL);
  memset_pattern16((void *)(a2 + 64), &unk_379E0, 0xCuLL);
  uint64_t v9 = a2 + 104;
  uint64_t v10 = 76LL;
  do
  {
    *(_DWORD *)(a2 + v10) = 1065353216;
    *(_OWORD *)uint64_t v9 = 0uLL;
    *(_OWORD *)(v9 + 16) = 0uLL;
    *(_OWORD *)(v9 + 32) = 0uLL;
    *(_DWORD *)uint64_t v9 = 1065353216;
    v10 += 4LL;
    *(_DWORD *)(v9 + 20) = 1065353216;
    *(_DWORD *)(v9 + 40) = 1065353216;
    v9 += 48LL;
  }

  while (v10 != 104);
  if (v6 && (uint64_t v11 = FigMotionExtractCameraInfo(v6, a2, 1u, 2), (_DWORD)v11))
  {
    uint64_t v17 = v11;
    uint64_t v23 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v23,  "Fig",  "err == 0 ",  "bail",  0LL,  "FigMotionProcessingUtilities.c",  2449LL,  v17);
  }

  else if (v8 && (uint64_t v12 = FigMotionExtractCameraInfo(v8, a2, 2u, 4), (_DWORD)v12))
  {
    uint64_t v17 = v12;
    uint64_t v24 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v24,  "Fig",  "err == 0 ",  "bail",  0LL,  "FigMotionProcessingUtilities.c",  2455LL,  v17);
  }

  else
  {
    uint64_t CameraInfo = FigMotionExtractCameraInfo(v5, a2, 0, 6);
    if ((_DWORD)CameraInfo)
    {
      uint64_t v17 = CameraInfo;
      uint64_t v22 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v22,  "Fig",  "err == 0 ",  "bail",  0LL,  "FigMotionProcessingUtilities.c",  2460LL,  v17);
    }

    else
    {
      for (uint64_t i = 0LL; i != 3; ++i)
      {
        uint64_t v15 = 0LL;
        uint64_t v16 = dword_379C4[i];
        do
        {
          *(float *)(a2 + 76 + 4LL * BravoCurrentToReferenceMapping_0[3 * v16 + dword_379C4[v15]]) = *(float *)(a2 + 28 + 4LL * dword_379C4[v15]) / *(float *)(a2 + 28 + 4 * v16);
          ++v15;
        }

        while (v15 != 3);
      }

      return 0LL;
    }
  }

  return v17;
}

uint64_t FigMotionExtractCameraInfo(const __CFDictionary *a1, uint64_t a2, unsigned int a3, int a4)
{
  if (a1)
  {
    if (FigCFDictionaryGetFloatIfPresent(a1, kFigCaptureCameraInfoKey_BaseZoomFactor, &point))
    {
      float v9 = *(float *)&point.x;
      *(float *)(a2 + 4LL * a3 + 2_Block_object_dispose(va, 8) = v9;
      goto LABEL_6;
    }

    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v4,  *(const char **)&point.x,  *(const char **)&point.y,  v34,  v35,  v36,  v37);
    uint64_t v23 = 4294954513LL;
  }

  else
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  0,  v4,  *(const char **)&point.x,  *(const char **)&point.y,  v34,  v35,  v36,  v37);
    uint64_t v23 = 4294954516LL;
  }

  uint64_t v15 = FigSignalErrorAt(v23, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  if ((_DWORD)v15)
  {
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v32) = v15;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "Fig",  "err == 0 ",  "bail",  0LL,  "FigMotionProcessingUtilities.c",  2402LL,  v32);
    return v15;
  }

LABEL_9:
  uint64_t v12 = a3;
  uint64_t v13 = a2 + 4LL * a3;
  double v14 = (int *)(v13 + 64);
  if (a1)
  {
    if (FigCFDictionaryGetFloatIfPresent(a1, kFigCaptureCameraInfoKey_PixelSize, &point))
    {
      uint64_t v15 = 0LL;
      *(_DWORD *)(v13 + 52) = LODWORD(point.x);
      int *v14 = 1;
      goto LABEL_12;
    }

    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v32) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v32,  v4,  *(const char **)&point.x,  *(const char **)&point.y,  v34,  v35,  v36,  v37);
    uint64_t v28 = 4294954513LL;
  }

  else
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v32) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v32,  v4,  *(const char **)&point.x,  *(const char **)&point.y,  v34,  v35,  v36,  v37);
    uint64_t v28 = 4294954516LL;
  }

  uint64_t v15 = FigSignalErrorAt(v28, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
LABEL_12:
  uint64_t v16 = (const void *)kFigCaptureCameraInfoKey_OpticalCenterOffsetInPhysicalSensorDimensions;
  if (CFDictionaryContainsKey(a1, kFigCaptureCameraInfoKey_OpticalCenterOffsetInPhysicalSensorDimensions))
  {
    uint64_t v17 = (const __CFDictionary *)CFDictionaryGetValue(a1, v16);
    if (v17)
    {
      uint64_t v18 = a2 + 8 * v12;
      CGPoint point = CGPointZero;
      CGPointMakeWithDictionaryRepresentation(v17, &point);
      CGPoint v19 = point;
      goto LABEL_17;
    }

    uint64_t v29 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v32) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v29,  "Fig",  "opticalCenterOffsetInfo",  "bail",  0LL,  "FigMotionProcessingUtilities.c",  2474LL,  v32);
LABEL_32:
    FigSignalErrorAt(4294954513LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    if (!(_DWORD)v15) {
      return v15;
    }
LABEL_33:
    uint64_t v31 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v32) = v15;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v31,  "Fig",  "err == 0 ",  "bail",  0LL,  "FigMotionProcessingUtilities.c",  2419LL,  v32);
    return v15;
  }

  int v20 = *v14;
  uint64_t v21 = (const __CFDictionary *)CFDictionaryGetValue(a1, kFigCaptureCameraInfoKey_OpticalCenterOffset);
  if (!v21)
  {
    uint64_t v30 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    LODWORD(v32) = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v30,  "Fig",  "opticalCenterOffsetInfo",  "bail",  0LL,  "FigMotionProcessingUtilities.c",  2494LL,  v32);
    goto LABEL_32;
  }

  uint64_t v18 = a2 + 8 * v12;
  CGPoint point = CGPointZero;
  CGPointMakeWithDictionaryRepresentation(v21, &point);
  CGPoint v19 = (CGPoint)vmulq_n_f64((float64x2_t)point, (double)v20);
LABEL_17:
  *(float32x2_t *)(v18 + 4) = vcvt_f32_f64((float64x2_t)v19);
  if ((_DWORD)v15) {
    goto LABEL_33;
  }
  return v15;
}

double FigMotionInverseOfQuaternion(uint64_t a1)
{
  return *(double *)a1;
}

double FigMotionQuaternionDotProduct(double *a1, double *a2)
{
  return a1[1] * a2[1] + *a1 * *a2 + a1[2] * a2[2] + a1[3] * a2[3];
}

double FigMotionGetQuaternionLength(double *a1)
{
  return sqrt(a1[1] * a1[1] + *a1 * *a1 + a1[2] * a1[2] + a1[3] * a1[3]);
}

double FigMotionMultiplyQuaternions(double *a1, double *a2)
{
  double v2 = *a1;
  double v3 = a1[1];
  double v5 = *a2;
  double v4 = a2[1];
  double v6 = a1[2];
  double v7 = a1[3];
  double v9 = a2[2];
  double v8 = a2[3];
  double v10 = *a2 * v7 + *a1 * v8 + v3 * v9 - v6 * v4;
  v12[2] = *a2 * v6 + *a1 * v9 + v7 * v4 - v3 * v8;
  v12[3] = v10;
  v12[0] = v2 * v5 - v3 * v4 - v6 * v9 - v7 * v8;
  v12[1] = v3 * v5 + v2 * v4 + v6 * v8 - v7 * v9;
  FigMotionNormalizeQuaternion(v12);
  return v12[0];
}

#error "28A58: call analysis failed (funcsize=72)"
uint64_t FigMotionComputeAverageSpherePosition(const __CFDictionary *a1, float32x2_t *a2, double a3)
{
  const char *v3;
  CFNumberRef Value;
  CFNumberRef v8;
  int v9;
  const char *v10;
  CFDataRef v11;
  uint64_t ISPHallData;
  unsigned int v13;
  unint64_t v14;
  int v15;
  double v16;
  double v17;
  uint64_t v18;
  const char *v19;
  unsigned int v21;
  uint64_t v22;
  const char *v24;
  const char *v25;
  const char *v26;
  const char *valuePtr;
  int v28;
  unsigned int v29;
  const char *v30;
  const char *v31;
  int v32;
  uint64_t v28 = 0;
  int valuePtr = 0LL;
  Boolean Value = (const __CFNumber *)CFDictionaryGetValue(a1, kFigCaptureStreamMetadata_ExposureTime);
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberFloat64Type, &valuePtr);
    double v8 = (const __CFNumber *)CFDictionaryGetValue(a1, kFigCaptureStreamMetadata_FrameRollingShutterSkew);
    if (v8)
    {
      CFNumberGetValue(v8, kCFNumberSInt32Type, &v28);
      double v9 = v28;
      double v10 = valuePtr;
      *a2 = 0LL;
      uint64_t v29 = 0;
      *a2 = 0LL;
      uint64_t v11 = (const __CFData *)CFDictionaryGetValue(a1, kFigCaptureStreamMetadata_ISPHallData);
      if (v11)
      {
        ISPHallData = FigMotionGetISPHallData(v11, (uint64_t)&v30, (int *)&v29, 510);
        if ((_DWORD)ISPHallData)
        {
          uint64_t v22 = ISPHallData;
          fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", v22, v3, v25, valuePtr, v28, v30, v31, v32);
          fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          LODWORD(v24) = v22;
          FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", v24, v3, v26, valuePtr, v28, v30, v31, v32);
          return v22;
        }

        uint64_t v13 = v29;
        if ((int)v29 >= 1)
        {
          double v14 = 0LL;
          uint64_t v15 = 0;
          uint64_t v16 = a3 + *(double *)&v10 * -0.5;
          uint64_t v17 = (double)v9 / 1000000.0 + v16;
          uint64_t v18 = 24LL * v29;
          do
          {
            CGPoint v19 = (&v30)[v14 / 8];
            if (*(double *)&v19 >= v16 && *(double *)&v19 <= v17)
            {
              *a2 = vadd_f32((float32x2_t)(&v30)[v14 / 8 + 1], *a2);
              ++v15;
            }

            v14 += 24LL;
          }

          while (v18 != v14);
          if (v15)
          {
            *(float *)&uint64_t v17 = (float)v15;
            *a2 = vdiv_f32(*a2, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v17, 0));
          }

          else
          {
            uint64_t v21 = v13 - 1;
            *a2 = (float32x2_t)(&v30)[3 * v21 + 1];
            low_freq_error_logging();
          }
        }
      }

      return 0LL;
    }

    else
    {
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v3, v25, valuePtr, v28, v30, v31, v32);
      return FigSignalErrorAt(4294954513LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    }
  }

  fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
  FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v3, v25, valuePtr, v28, v30, v31, v32);
  return FigSignalErrorAt(4294954513LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

float FigMotionAdjustParallaxShiftForScalingFactor(float result, double a2, float a3, float a4)
{
  if (a3 > 0.0 && vabds_f32(a3, a4) > 0.001) {
    return result * (float)(a4 / a3);
  }
  return result;
}

uint64_t FigMotionAdjustPointForSphereMovement( const __CFDictionary *a1, float64x2_t *a2, float a3, float a4, double a5)
{
  float32x2_t v12 = 0LL;
  if (a1)
  {
    uint64_t v9 = FigMotionComputeAverageSpherePosition(a1, &v12, a5);
    if ((_DWORD)v9)
    {
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v9,  v5,  v11,  *(void *)&v12,  v13,  v14,  v15,  v16);
    }

    else
    {
      *a2 = vaddq_f64(*a2, vcvtq_f64_f32(vmul_n_f32(v12, a3 * a4)));
    }

    return v9;
  }

  else
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v5, v11, *(void *)&v12, v13, v14, v15, v16);
    return FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

uint64_t FigMotionComputeOpticalCenterInBuffer( const __CFDictionary *a1, unint64_t a2, uint64_t a3, int a4, uint64_t a5, float64x2_t *a6, float a7, double a8)
{
  CFTypeRef value = 0LL;
  CGPoint point = CGPointZero;
  if (a1 && a6)
  {
    int v12 = a5;
    int v14 = a3;
    unint64_t v17 = HIDWORD(a2);
    HIDWORD(v25) = 1065353216;
    int v18 = FigMotionComputeLensPositionScalingFactor(a1, a2, a3, a3, a5, (float *)&v25 + 1);
    if (v18)
    {
      int v21 = v18;
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      int v23 = v21;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v23,  v8,  v24,  v25,  LODWORD(point.x),  *(const char **)&point.y,  v27,  LODWORD(v28.f64[0]));
    }

    v28.f64[0] = ((double)(int)a2 + -1.0) * 0.5;
    v28.f64[1] = ((double)(int)v17 + -1.0) * 0.5;
    if (!CFDictionaryGetValueIfPresent(a1, kFigCaptureStreamMetadata_OpticalCenter, (const void **)&value)
      || !CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)value, &point)
      || (v19.n128_u64[0] = *(void *)&point.x,
          uint64_t result = FigMotionMapPointFromRawToBuffer(a1, a2, v14, a4, &v28, v19, point.y, *((float *)&v25 + 1)),
          !(_DWORD)result))
    {
      if (!v12
        || (uint64_t result = FigMotionAdjustPointForSphereMovement(a1, &v28, a7, *((float *)&v25 + 1), a8), !(_DWORD)result))
      {
        uint64_t result = 0LL;
        *a6 = v28;
      }
    }
  }

  else
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    int v22 = 0;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v22,  v8,  v24,  v25,  LODWORD(point.x),  *(const char **)&point.y,  v27,  LODWORD(v28.f64[0]));
    return FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  return result;
}

uint64_t FigMotionMapPointFromRawToBuffer( const __CFDictionary *a1, uint64_t a2, int a3, int a4, float64x2_t *a5, __n128 a6, float64_t a7, float a8)
{
  if (a1 && a5)
  {
    CGSize size = CGRectZero.size;
    CGPoint origin = CGRectZero.origin;
    float64x2_t v41 = (float64x2_t)CGRectZero.origin;
    CGSize v42 = size;
    uint64_t SensorValidCropRect = FigMotionGetSensorValidCropRect(a1, (uint64_t)&v41);
    if ((_DWORD)SensorValidCropRect)
    {
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  SensorValidCropRect,  v8,  *(const char **)&size.width,  *(const char **)&size.height,  LODWORD(origin.x),  *(const char **)&origin.y,  (const char *)a6.n128_u64[0],  a6.n128_u32[2]);
    }

    else
    {
      CGPoint v39 = origin;
      CGSize v40 = size;
      FigCFDictionaryGetCGRectIfPresent(a1, kFigCaptureStreamMetadata_ValidBufferRect, &v39);
      v43.CGPoint origin = v39;
      v43.CGSize size = v40;
      v44.origin.double x = CGRectZero.origin.x;
      v44.origin.y = CGRectZero.origin.y;
      v44.size.width = CGRectZero.size.width;
      v44.size.height = CGRectZero.size.height;
      if (CGRectEqualToRect(v43, v44)) {
        unint64_t v16 = -1LL;
      }
      else {
        unint64_t v16 = 0LL;
      }
      int8x16_t v17 = (int8x16_t)vdupq_n_s64(v16);
      v18.i64[0] = (int)a2;
      v18.i64[1] = SHIDWORD(a2);
      float64x2_t v19 = (float64x2_t)vbslq_s8(v17, (int8x16_t)vcvtq_f64_s64(v18), (int8x16_t)v40);
      __asm { FMOV            V1.2D, #-1.0 }

      v18.i64[0] = a3;
      v18.i64[1] = a4;
      __asm { FMOV            V5.2D, #0.5 }

      float64x2_t v26 = vmlaq_f64((float64x2_t)vbicq_s8((int8x16_t)v39, v17), _Q5, vaddq_f64(v19, _Q1));
      float64x2_t v27 = vmlaq_f64(v41, _Q5, vaddq_f64((float64x2_t)v42, _Q1));
      *(void *)&_Q5.f64[0] = a6.n128_u64[0];
      _Q5.f64[1] = a7;
      *a5 = vmlaq_f64(v26, vcvtq_f64_s64(v18), vmulq_n_f64(vsubq_f64(_Q5, v27), a8));
    }

    return SensorValidCropRect;
  }

  else
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v8, v29, v31, v32, v34, v35, v37);
    return FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

uint64_t FigMotionComputeRawSensorCenterInBuffer( const __CFDictionary *a1, uint64_t a2, int a3, int a4, float64x2_t *a5, float a6)
{
  if (a1 && a5)
  {
    int v20 = 0LL;
    else {
      BOOL v13 = 1;
    }
    if (v13)
    {
      uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "Fig",  "FigCFDictionaryGetIntIfPresent( metadataDict, kFigCaptureStreamMetadata_RawSensorWidth, &sensorRawWidth) && sensorRawWidth > 0",  "bail",  0LL,  "FigMotionProcessingUtilities.c",  3046LL,  0);
    }

    else
    {
      else {
        BOOL v15 = 1;
      }
      if (!v15)
      {
        v14.n128_f64[0] = (double)(HIDWORD(v20) - 1) * 0.5;
        return FigMotionMapPointFromRawToBuffer(a1, a2, a3, a4, a5, v14, (double)((int)v20 - 1) * 0.5, a6);
      }

      uint64_t v18 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v18,  "Fig",  "FigCFDictionaryGetIntIfPresent( metadataDict, kFigCaptureStreamMetadata_RawSensorHeight, &sensorRawHeight) && s ensorRawHeight > 0",  "bail",  0LL,  "FigMotionProcessingUtilities.c",  3047LL,  0);
    }

    return FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v6, v19, v20, v21, v22, v23, v24);
    return FigSignalErrorAt(4294954516LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

uint64_t FigMotionComputeParallaxShift( uint64_t a1, uint64_t a2, float a3, float a4, float a5, uint64_t a6, int a7, uint64_t a8)
{
  *(float *)&int v29 = NAN;
  float v30 = NAN;
  float v28 = NAN;
  if (a2) {
    float v15 = *(float *)(a2 + 520);
  }
  else {
    float v15 = 0.0;
  }
  *(void *)a8 = 0LL;
  int FloatIfPresent = FigCFDictionaryGetFloatIfPresent(a1, kFigCaptureStreamMetadata_EffectiveFocalLength, &v30);
  int v17 = FigCFDictionaryGetFloatIfPresent(a1, kFigCaptureStreamMetadata_PracticalFocalLength, &v29);
  uint64_t result = FigCFDictionaryGetFloatIfPresent(a1, kFigCaptureStreamMetadata_PinholeCameraFocalLength, &v28);
  if (FloatIfPresent) {
    BOOL v19 = v17 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  char v21 = v19 || a7 != 0;
  if (a2 && (v21 & 1) != 0)
  {
    uint64_t v22 = a2 + 4LL * *(unsigned int *)(a2 + 444);
    float v23 = *(float *)(v22 + 480);
    float v30 = *(float *)(v22 + 492);
    float v24 = 1.0;
  }

  else
  {
    float v24 = 1.0;
    float v23 = *(float *)&v29;
  }

  float v25 = v23 + -10.0;
  float v26 = 0.0;
  if (v30 > 0.0 && v25 > v30) {
    float v26 = (float)((float)(v24 * v28) * a5) / fmaxf((float)((float)(v25 * v30) / (float)(v25 - v30)) / 1000.0, v15);
  }
  *(float *)a8 = v26 * a3;
  *(float *)(a8 + 4) = v26 * a4;
  return result;
}

uint64_t FigMotionHardwareAvailable()
{
  __int128 v4 = 0u;
  __int128 v5 = 0u;
  *(_OWORD *)__big = 0u;
  __int128 v3 = 0u;
  size_t v1 = 64LL;
  if ((FigMotionHardwareAvailable_checked & 1) == 0)
  {
    FigMotionHardwareAvailable_available = 1;
    if (!sysctlbyname("hw.model", __big, &v1, 0LL, 0LL) && strnstr(__big, "DEV", 0x40uLL)) {
      FigMotionHardwareAvailable_available = 0;
    }
    FigMotionHardwareAvailable_checked = 1;
  }

  return FigMotionHardwareAvailable_available;
}

id objc_msgSend__compileShader_fragment_pixelFormat_deltaMapPixelFormat_unstyledPixelFormat_constants_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_compileShader:fragment:pixelFormat:deltaMapPixelFormat:unstyledPixelFormat:constants:");
}

id objc_msgSend__getTransformShaderParameters_isLuma_isRGB_isAttachment_pixelRatio_pipelineIndexToUse_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getTransformShaderParameters:isLuma:isRGB:isAttachment:pixelRatio:pipelineIndexToUse:");
}

id objc_msgSend__transformInputPixelBuffer_outputPixelBuffer_ltmLUT_isAttachment_commandBuffer_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_transformInputPixelBuffer:outputPixelBuffer:ltmLUT:isAttachment:commandBuffer:");
}

id objc_msgSend_copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPe rRow:destinationBytesPerImage:");
}

id objc_msgSend_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:");
}

id objc_msgSend_enqueuePixelBufferForRendering_inputValidBufferRect_metadata_ltmLUT_outputPixelBuffer_transformCounts_transforms3x3_transformStrides_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "enqueuePixelBufferForRendering:inputValidBufferRect:metadata:ltmLUT:outputPixelBuffer:transformCounts:transfo rms3x3:transformStrides:");
}

id objc_msgSend_initWithMaxTimescale_minTimescale_transitionTime_analyzer_rampingSettings_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMaxTimescale:minTimescale:transitionTime:analyzer:rampingSettings:");
}

id objc_msgSend_renderWithPixelBuffer_metadata_pixelBufferValidRect_ltmLUT_outputPixelBuffer_isAttachmentRendering_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "renderWithPixelBuffer:metadata:pixelBufferValidRect:ltmLUT:outputPixelBuffer:isAttachmentRendering:");
}

id objc_msgSend_renderWithSampleBuffer_pixelBufferValidRect_ltmLUT_outputPixelBuffer_isAttachmentRendering_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "renderWithSampleBuffer:pixelBufferValidRect:ltmLUT:outputPixelBuffer:isAttachmentRendering:");
}

id objc_msgSend_setTransformsArray_transforms3x3_transformStrides_inputSize_outputSize_pixelBufferValidRect_isQuadraSensor_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "setTransformsArray:transforms3x3:transformStrides:inputSize:outputSize:pixelBufferValidRect:isQuadraSensor:");
}