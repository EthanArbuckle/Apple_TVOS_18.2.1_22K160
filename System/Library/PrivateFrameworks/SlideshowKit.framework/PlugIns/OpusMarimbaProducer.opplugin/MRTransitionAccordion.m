@interface MRTransitionAccordion
- (BOOL)controlsLayersTime;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (BOOL)supportsDirectionOverride;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
@end

@implementation MRTransitionAccordion

- (BOOL)controlsLayersTime
{
  return 1;
}

- (BOOL)supportsDirectionOverride
{
  return 1;
}

- (void)setAttributes:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRTransitionAccordion;
  -[MRTransition setAttributes:](&v4, "setAttributes:", a3);
  self->super._direction = 0;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MRTransitionAccordion;
  return -[MRTransition prerenderForTime:inContext:withArguments:]( &v6,  "prerenderForTime:inContext:withArguments:",  a4,  a5,  a3);
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  float v10 = 1.0 / v9;
  if ((float)(1.0 / v9) > 0.0)
  {
    double v11 = a3 * a3 * (a3 * -2.0 + 3.0);
    uint64_t v12 = self->super._direction - 1LL;
    else {
      LOBYTE(v13) = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"direction"),  "unsignedIntegerValue");
    }
    LODWORD(v14) = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"numberOfFoldingsIn"),  "unsignedCharValue");
    unsigned int v15 = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"numberOfFoldingsOut"),  "unsignedCharValue");
    mSourceLayer = self->super.mSourceLayer;
    -[MRLayerClock externalTime](-[MRLayer clock](mSourceLayer, "clock"), "externalTime");
    id v17 = -[MRLayer patchworkAtTime:inContext:withArguments:]( mSourceLayer,  "patchworkAtTime:inContext:withArguments:",  a4,  a5);
    mTargetLayer = self->super.mTargetLayer;
    -[MRLayerClock externalTime](-[MRLayer clock](mTargetLayer, "clock"), "externalTime");
    id v19 = -[MRLayer patchworkAtTime:inContext:withArguments:]( mTargetLayer,  "patchworkAtTime:inContext:withArguments:",  a4,  a5);
    if ((v13 & 0xFA) != 0) {
      char v20 = v13;
    }
    else {
      char v20 = v13 + 2;
    }
    if ((v13 & 0xFA) != 0) {
      unsigned int v21 = v15;
    }
    else {
      unsigned int v21 = v14;
    }
    if ((v13 & 0xFA) != 0) {
      uint64_t v14 = v14;
    }
    else {
      uint64_t v14 = v15;
    }
    double v22 = 1.0 - v11;
    if ((v13 & 0xFA) != 0) {
      double v22 = v11;
    }
    float v23 = v22;
    if ((v13 & 0xFA) != 0) {
      v24 = v19;
    }
    else {
      v24 = v17;
    }
    if ((v13 & 0xFA) != 0) {
      v25 = v17;
    }
    else {
      v25 = v19;
    }
    int v26 = v20 & 0xFC;
    int v27 = v20 & 1;
    if ((v20 & 1) != 0) {
      uint64_t v28 = 1LL;
    }
    else {
      uint64_t v28 = 2LL;
    }
    [a4 cull:v28];
    float v29 = 1.0;
    float v30 = 1.0 - v23;
    LODWORD(v31) = (2 * v21) | 1;
    if (v26)
    {
      if (v27) {
        float v32 = 1.0;
      }
      else {
        float v32 = v10;
      }
      if (v21) {
        uint64_t v31 = v31;
      }
      else {
        uint64_t v31 = 2LL;
      }
      LOWORD(v101) = 2 * v31;
      BYTE2(v101) = v27;
      float v33 = v32 + v32;
      float v34 = (float)(int)(4 * v21);
      if (!v21) {
        float v34 = 2.0;
      }
      float v35 = v33 / v34;
      float v36 = -v32;
      float v37 = 0.0;
      if (v21) {
        float v37 = sqrt((float)(1.0 - (float)(v30 * v30))) * v36 / (float)((float)v21 + (float)v21);
      }
      uint64_t v38 = 0LL;
      float v39 = (float)(v23 + -1.0) * v32;
      float v40 = v30 * v35;
      unsigned int v41 = 2 * v31 - 1;
      v42 = (float *)&v101 + 2;
      do
      {
        float v43 = v36 + (float)((float)v38 * v35);
        if (v38) {
          float v44 = 0.0;
        }
        else {
          float v44 = v39;
        }
        if (v38) {
          float v45 = v23;
        }
        else {
          float v45 = 1.0;
        }
        if (!v21) {
          float v43 = v44;
        }
        *(v42 - 1) = v43;
        v46 = (float *)(&v101 + v41);
        v46[1] = -v43;
        float v47 = v36 + (float)(v40 * (float)v38);
        if (!v21) {
          float v47 = v45 * v36;
        }
        float *v42 = v47;
        float v48 = -v47;
        if ((v38 & 1) != 0) {
          float v49 = v37;
        }
        else {
          float v49 = 0.0;
        }
        v46[2] = v48;
        v46[3] = v49;
        v42[1] = v49;
        *((_BYTE *)v42 + 8) = (_DWORD)v31 - 1 == v38;
        *((_BYTE *)v46 + 16) = 0;
        ++v38;
        --v41;
        v42 += 4;
      }

      while (v31 != v38);
      uint64_t v50 = 0LL;
      unsigned int v51 = 0;
      LOWORD(v90) = (2 * v14) | 1;
      unsigned int v52 = 2 * v14;
      float v53 = v33 / (float)(2 * v14);
      BYTE2(v90) = v27;
      float v54 = sqrt((float)(1.0 - (float)(v23 * v23))) * v36 / (double)v14;
      do
      {
        float v55 = v36 + (float)((float)v51 * v53);
        v56 = (float *)((char *)&v90 + v50);
        v56[1] = v55;
        v57 = (float *)(&v90 + v52);
        v57[1] = -v55;
        float v58 = (float)-(float)(v23 * v53) * (float)v14;
        v56[2] = v58;
        float v59 = -v58;
        if ((v51 & 1) != 0) {
          float v60 = v54;
        }
        else {
          float v60 = 0.0;
        }
        v57[2] = v59;
        v57[3] = v60;
        v56[3] = v60;
        --v14;
        *((_BYTE *)v57 + 16) = 0;
        *((_BYTE *)v56 + 16) = 0;
        ++v51;
        --v52;
        v50 += 16LL;
      }

      while (v14 != -1);
      __int128 v87 = v109;
      __int128 v88 = v110;
      LODWORD(v89) = v111;
      __int128 v83 = v105;
      __int128 v84 = v106;
      __int128 v85 = v107;
      __int128 v86 = v108;
      __int128 v79 = v101;
      __int128 v80 = v102;
      __int128 v81 = v103;
      __int128 v82 = v104;
      RenderPatchworkWithMesh(v25, (unsigned __int16 *)&v79, a4);
      __int128 v87 = v98;
      __int128 v88 = v99;
      LODWORD(v89) = v100;
      __int128 v83 = v94;
      __int128 v84 = v95;
      __int128 v85 = v96;
      __int128 v86 = v97;
      __int128 v79 = v90;
      __int128 v80 = v91;
      __int128 v81 = v92;
      __int128 v82 = v93;
      v61 = v24;
    }

    else
    {
      if (v21) {
        uint64_t v31 = v31;
      }
      else {
        uint64_t v31 = 2LL;
      }
      LOWORD(v101) = v31;
      BYTE2(v101) = v27;
      if (!v27) {
        float v29 = v10;
      }
      float v62 = v29 + v29;
      float v63 = (float)(v29 + v29) / (float)(v31 - 1);
      float v64 = -v29;
      float v65 = 0.0;
      if (v21) {
        float v65 = sqrt((float)(1.0 - (float)(v30 * v30))) * v64 / (double)v21;
      }
      uint64_t v66 = 0LL;
      float v67 = v30 * v63;
      v68 = (float *)&v101 + 2;
      do
      {
        if (v21)
        {
          *(v68 - 1) = (float)((float)v66 * v63) - v29;
          float v69 = (float)(v67 * (float)v66) - v29;
        }

        else if (v66)
        {
          *(v68 - 1) = v29;
          float v69 = (float)((float)(v23 * -2.0) + 1.0) * v29;
        }

        else
        {
          *((float *)&v101 + 1) = (float)((float)(v23 * 2.0) + -1.0) * v29;
          float v69 = -v29;
        }

        if ((v66 & 1) != 0) {
          float v70 = v65;
        }
        else {
          float v70 = 0.0;
        }
        float *v68 = v69;
        v68[1] = v70;
        *((_BYTE *)v68 + 8) = 0;
        ++v66;
        v68 += 4;
      }

      while (v31 != v66);
      LODWORD(v71) = (2 * v14) | 1;
      if ((_DWORD)v14) {
        uint64_t v71 = v71;
      }
      else {
        uint64_t v71 = 2LL;
      }
      LOWORD(v90) = v71;
      BYTE2(v90) = v27;
      float v72 = 0.0;
      if ((_DWORD)v14) {
        float v72 = sqrt((float)(1.0 - (float)(v23 * v23))) * v64 / (double)v14;
      }
      uint64_t v73 = 0LL;
      float v74 = -v62;
      v75 = (float *)&v90 + 2;
      float v76 = v62 / (float)(v71 - 1);
      do
      {
        if ((_DWORD)v14)
        {
          *(v75 - 1) = (float)((float)v73 * v76) - v29;
          float v77 = v29 + (float)(v23 * (float)(v74 + (float)(v76 * (float)v73)));
        }

        else if (v73)
        {
          *(v75 - 1) = (float)((float)(v23 * 2.0) + -1.0) * v29;
          float v77 = v29;
        }

        else
        {
          *((float *)&v90 + 1) = -v29;
          float v77 = (float)((float)(v23 * -2.0) + 1.0) * v29;
        }

        if ((v73 & 1) != 0) {
          float v78 = v72;
        }
        else {
          float v78 = 0.0;
        }
        float *v75 = v77;
        v75[1] = v78;
        *((_BYTE *)v75 + 8) = 0;
        ++v73;
        v75 += 4;
      }

      while (v71 != v73);
      if (v23 >= 0.5)
      {
        __int128 v87 = v109;
        __int128 v88 = v110;
        LODWORD(v89) = v111;
        __int128 v83 = v105;
        __int128 v84 = v106;
        __int128 v85 = v107;
        __int128 v86 = v108;
        __int128 v79 = v101;
        __int128 v80 = v102;
        __int128 v81 = v103;
        __int128 v82 = v104;
        RenderPatchworkWithMesh(v25, (unsigned __int16 *)&v79, a4);
      }

      __int128 v87 = v98;
      __int128 v88 = v99;
      LODWORD(v89) = v100;
      __int128 v83 = v94;
      __int128 v84 = v95;
      __int128 v85 = v96;
      __int128 v86 = v97;
      __int128 v79 = v90;
      __int128 v80 = v91;
      __int128 v81 = v92;
      __int128 v82 = v93;
      if ((_DWORD)v14 == 2) {
        RenderPatchworkWithMeshInverted(v24, (unsigned __int16 *)&v79, a4);
      }
      else {
        RenderPatchworkWithMesh(v24, (unsigned __int16 *)&v79, a4);
      }
      if (v23 >= 0.5) {
        goto LABEL_98;
      }
      __int128 v87 = v109;
      __int128 v88 = v110;
      LODWORD(v89) = v111;
      __int128 v83 = v105;
      __int128 v84 = v106;
      __int128 v85 = v107;
      __int128 v86 = v108;
      __int128 v79 = v101;
      __int128 v80 = v102;
      __int128 v81 = v103;
      __int128 v82 = v104;
      v61 = v25;
    }

    RenderPatchworkWithMesh(v61, (unsigned __int16 *)&v79, a4);
LABEL_98:
    objc_msgSend(a4, "cull:", 0, v79, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89);
    [v25 removeImages];
    [v24 removeImages];
  }

@end