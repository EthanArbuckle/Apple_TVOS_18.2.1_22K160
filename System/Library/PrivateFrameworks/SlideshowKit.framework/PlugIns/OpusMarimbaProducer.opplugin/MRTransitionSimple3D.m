@interface MRTransitionSimple3D
- (BOOL)supportsDirectionOverride;
- (MRTransitionSimple3D)initWithTransitionID:(id)a3;
- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAttributes:(id)a3;
@end

@implementation MRTransitionSimple3D

- (MRTransitionSimple3D)initWithTransitionID:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRTransitionSimple3D;
  result = -[MRTransition initWithTransitionID:](&v4, "initWithTransitionID:", a3);
  if (result) {
    result->mSubtype = 0;
  }
  return result;
}

- (BOOL)supportsDirectionOverride
{
  return 1;
}

- (void)setAttributes:(id)a3
{
  if (!a3 || self->super.mAttributes != a3)
  {
    v4.receiver = self;
    v4.super_class = (Class)&OBJC_CLASS___MRTransitionSimple3D;
    -[MRTransition setAttributes:](&v4, "setAttributes:");
    self->mSubtype = objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"subtype"),  "intValue");
    self->super._direction = *((_BYTE *)&unk_1F5F90
                             + objc_msgSend( -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"direction"),  "unsignedIntegerValue"));
  }

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  float v8 = a3;
  float v9 = sinf((float)(v8 + -0.5) * 3.1416);
  [a4 localAspectRatio];
  float v11 = v10;
  float v12 = 1.0;
  float v13 = 1.0 / v10;
  unsigned int v14 = -[MRLayer isNative3D](self->super.mSourceLayer, "isNative3D");
  unsigned int v213 = -[MRLayer isNative3D](self->super.mTargetLayer, "isNative3D");
  unsigned int v211 = -[MRLayer isOpaque](self->super.mSourceLayer, "isOpaque");
  unsigned int v210 = -[MRLayer isOpaque](self->super.mTargetLayer, "isOpaque");
  unsigned int v202 = -[MRLayer isAlphaFriendly](self->super.mSourceLayer, "isAlphaFriendly");
  unsigned int v188 = -[MRLayer isAlphaFriendly](self->super.mTargetLayer, "isAlphaFriendly");
  v15 = (float *)[a4 foreColor];
  int v23 = 0;
  int v24 = v15[3] < 1.0;
  BOOL v25 = v8 < 1.0;
  BOOL v26 = v8 > 0.0;
  float v220 = -v13;
  int v27 = 1;
  float v199 = -1.0;
  unsigned int v214 = v14;
  if (v8 <= 0.0 || v8 >= 1.0)
  {
    float v215 = 0.0;
    float v206 = 1.0;
    LODWORD(v20) = 0;
    LODWORD(v22) = 0;
    float v193 = v13;
    float v194 = 1.0;
    float v195 = 1.0;
    unint64_t v190 = __PAIR64__(1.0, -1.0);
    float v191 = -1.0;
    float v192 = -v13;
    float v184 = 0.0;
    float v185 = 0.0;
    float v207 = 0.0;
    float v208 = 0.0;
    float v209 = 0.0;
    float v36 = 0.0;
    float v203 = 1.0;
    float v204 = 1.0;
    float v201 = 0.0;
    float v33 = 0.0;
    float v181 = v13;
    float v182 = -1.0;
    float v198 = 1.0;
    float v180 = -v13;
    float v178 = 1.0;
    float v179 = -1.0;
    float v176 = -1.0;
    float v177 = 1.0;
    int v200 = v15[3] < 1.0;
    float v212 = 0.0;
    int v197 = 0;
    int v37 = 1;
    float v34 = 0.0;
    int v219 = 0;
    float v186 = 0.0;
    int v35 = 0;
    BOOL v187 = 0;
LABEL_10:
    float v196 = 0.0;
  }

  else
  {
    float v198 = 1.0;
    int v23 = 0;
    unsigned int mSubtype = self->mSubtype;
    BOOL v26 = 1;
    float v222 = v11;
    double v31 = 0.5;
    double v32 = (v9 + 1.0) * 0.5;
    float v29 = v32;
    float v30 = v13 + v13;
    LODWORD(v31) = 0;
    LODWORD(v22) = 0;
    LODWORD(v18) = 0;
    LODWORD(v16) = 0;
    LODWORD(v19) = 0;
    LODWORD(v17) = 0;
    LODWORD(v32) = 0;
    float v33 = 0.0;
    LODWORD(v21) = 0;
    float v34 = 0.0;
    float v11 = 0.0;
    LODWORD(v20) = 0;
    BOOL v25 = 1;
    int v35 = 0;
    switch(mSubtype)
    {
      case 0u:
        float v186 = 0.0;
        int v23 = 0;
        int v197 = 0;
        int v219 = 0;
        int v35 = 0;
        BOOL v187 = 0;
        float v215 = 0.0;
        float v206 = 1.0;
        LODWORD(v20) = 0;
        BOOL v25 = v8 < 0.5;
        LODWORD(v22) = 0;
        BOOL v26 = v8 >= 0.5;
        float v193 = v13;
        float v194 = 1.0;
        float v195 = 1.0;
        unint64_t v190 = __PAIR64__(1.0, -1.0);
        float v191 = -1.0;
        float v192 = -v13;
        float v184 = 0.0;
        float v185 = 0.0;
        float v207 = 0.0;
        float v208 = 0.0;
        float v209 = 0.0;
        float v36 = 0.0;
        float v203 = 1.0;
        float v204 = 1.0;
        float v201 = 0.0;
        float v181 = v13;
        float v182 = -1.0;
        float v179 = -1.0;
        float v180 = -v13;
        float v177 = 1.0;
        float v178 = 1.0;
        float v176 = -1.0;
        float v212 = 0.0;
        int v200 = v15[3] < 1.0;
        int v37 = 1;
        goto LABEL_105;
      case 1u:
        float v217 = v29;
        if (-[NSString isEqualToString:]( self->super.mPresetID,  "isEqualToString:",  @"FadeInIntro",  v32,  v31,  v16,  v17,  v18,  v19,  v20,  v21))
        {
          float v186 = 0.0;
          int v200 = 0;
          int v197 = 0;
          BOOL v25 = 0;
          int v219 = 0;
          int v35 = 0;
          float v215 = 0.0;
          float v206 = 1.0;
          LODWORD(v20) = 0;
          LODWORD(v22) = 0;
          float v193 = v13;
          float v194 = 1.0;
          BOOL v26 = 1;
          float v195 = 1.0;
          unint64_t v190 = __PAIR64__(1.0, -1.0);
          float v191 = -1.0;
          float v192 = -v13;
          float v184 = 0.0;
          float v185 = 0.0;
          float v207 = 0.0;
          float v208 = 0.0;
          float v209 = 0.0;
          float v36 = 0.0;
          float v203 = v217;
          float v204 = 1.0;
          float v201 = 0.0;
          float v181 = v13;
          float v182 = -1.0;
          float v179 = -1.0;
          float v180 = -v13;
          float v177 = 1.0;
          float v178 = 1.0;
          float v176 = -1.0;
          int v23 = 1;
          float v212 = 0.0;
          int v37 = 1;
          BOOL v187 = 1;
          unsigned int v188 = 1;
LABEL_105:
          float v196 = 0.0;
LABEL_106:
          float v11 = v222;
          break;
        }

        float v11 = v222;
        if (-[NSString isEqualToString:](self->super.mPresetID, "isEqualToString:", @"FadeOutOutro"))
        {
          float v186 = 0.0;
          BOOL v26 = 0;
          int v23 = 0;
          int v219 = 0;
          int v35 = 0;
          float v206 = 1.0;
          float v12 = 1.0 - v217;
          float v215 = 0.0;
          LODWORD(v20) = 0;
          LODWORD(v22) = 0;
          int v197 = 1;
          float v193 = v13;
          float v194 = 1.0;
          unint64_t v190 = __PAIR64__(1.0, -1.0);
          float v195 = 1.0;
          float v191 = -1.0;
          float v192 = -v13;
          float v184 = 0.0;
          float v185 = 0.0;
          float v207 = 0.0;
          float v208 = 0.0;
          float v209 = 0.0;
          float v36 = 0.0;
          float v203 = 1.0;
          float v204 = 1.0;
          float v201 = 0.0;
          float v181 = v13;
          float v182 = -1.0;
          float v198 = 1.0;
          float v179 = -1.0;
          float v180 = -v13;
          float v177 = 1.0;
          float v178 = 1.0;
          int v200 = v24;
          float v176 = -1.0;
          int v24 = 1;
          float v212 = 0.0;
          int v37 = 1;
          BOOL v187 = 1;
          unsigned int v202 = 1;
          goto LABEL_10;
        }

        float v186 = 0.0;
        if (v8 >= 0.5)
        {
          int v197 = 0;
          BOOL v25 = 0;
          int v219 = 0;
          int v35 = 0;
          unsigned int v188 = 0;
          float v199 = -1.0;
          float v203 = (float)(v217 * 2.0) + -1.0;
          float v215 = 0.0;
          float v206 = 1.0;
          int v200 = v210 ^ 1;
          LODWORD(v20) = 0;
          BOOL v26 = 1;
          LODWORD(v22) = 0;
          float v193 = v13;
          float v194 = 1.0;
          float v195 = 1.0;
          unint64_t v190 = __PAIR64__(1.0, -1.0);
          float v191 = -1.0;
          float v192 = -v13;
          float v184 = 0.0;
          float v185 = 0.0;
          float v207 = 0.0;
          float v208 = 0.0;
          float v209 = 0.0;
          float v36 = 0.0;
          float v204 = 1.0;
          float v201 = 0.0;
          float v181 = v13;
          float v182 = -1.0;
          float v179 = -1.0;
          float v180 = -v13;
          float v177 = 1.0;
          float v178 = 1.0;
          float v176 = -1.0;
          int v23 = 1;
        }

        else
        {
          BOOL v26 = 0;
          int v23 = 0;
          int v219 = 0;
          int v35 = 0;
          unsigned int v202 = 0;
          float v206 = 1.0;
          float v12 = (float)(v217 * -2.0) + 1.0;
          float v215 = 0.0;
          LODWORD(v20) = 0;
          LODWORD(v22) = 0;
          int v200 = v24;
          int v24 = v211 ^ 1;
          int v197 = 1;
          float v194 = 1.0;
          float v195 = 1.0;
          unint64_t v190 = __PAIR64__(1.0, -1.0);
          float v192 = -v13;
          float v193 = v13;
          float v191 = -1.0;
          float v184 = 0.0;
          float v185 = 0.0;
          float v207 = 0.0;
          float v208 = 0.0;
          float v209 = 0.0;
          float v36 = 0.0;
          float v203 = 1.0;
          float v204 = 1.0;
          float v201 = 0.0;
          float v181 = v13;
          float v182 = -1.0;
          float v198 = 1.0;
          float v179 = -1.0;
          float v180 = -v13;
          float v177 = 1.0;
          float v178 = 1.0;
          float v176 = -1.0;
        }

        float v212 = 0.0;
        int v37 = 1;
        goto LABEL_101;
      case 2u:
      case 8u:
        float v186 = 0.0;
        float v11 = v222;
        if (!v210) {
          goto LABEL_7;
        }
        int v24 = 0;
        int v200 = 1;
        float v206 = 1.0;
        if (((v188 | v211 ^ 1) & 1) != 0)
        {
          float v204 = v8;
          int v219 = 0;
        }

        else
        {
          float v204 = v8;
          int v219 = 0;
          if (((v202 ^ 1) & 1) == 0)
          {
LABEL_7:
            if ((v211 & v202) == 1)
            {
              int v200 = 0;
              float v204 = 1.0;
              float v206 = 1.0 - v8;
              int v24 = 1;
              int v219 = 1;
            }

            else
            {
              int v219 = 0;
              float v206 = 1.0 - v8;
              int v200 = 1;
              float v204 = v8;
              int v24 = 1;
              if (mSubtype == 2)
              {
                float v215 = 0.0;
                LODWORD(v20) = 0;
                LODWORD(v22) = 0;
                float v193 = v13;
                float v194 = 1.0;
                float v195 = 1.0;
                unint64_t v190 = __PAIR64__(1.0, -1.0);
                float v191 = -1.0;
                float v192 = -v13;
                float v184 = 0.0;
                float v185 = 0.0;
                float v207 = 0.0;
                float v208 = 0.0;
                float v209 = 0.0;
                float v36 = 0.0;
                float v203 = 1.0;
                float v204 = v8;
                float v201 = 0.0;
                float v181 = v13;
                float v182 = -1.0;
                float v198 = 1.0;
                float v180 = -v13;
                int v23 = 1;
                float v178 = 1.0;
                float v179 = -1.0;
                int v197 = 1;
                float v176 = -1.0;
                float v177 = 1.0;
                int v35 = 0;
                int v27 = 0;
                float v212 = 0.0;
                int v37 = 0;
LABEL_101:
                BOOL v187 = 1;
                goto LABEL_10;
              }
            }
          }
        }

        BOOL v187 = mSubtype == 2;
        int v197 = v24;
        int v27 = 0;
        int v35 = 0;
        if (mSubtype != 8)
        {
          float v215 = 0.0;
          LODWORD(v20) = 0;
          LODWORD(v22) = 0;
          float v193 = v13;
          float v194 = 1.0;
          float v195 = 1.0;
          unint64_t v190 = __PAIR64__(1.0, -1.0);
          float v191 = -1.0;
          float v192 = -v13;
          float v184 = 0.0;
          float v185 = 0.0;
          float v207 = 0.0;
          float v208 = 0.0;
          float v209 = 0.0;
          float v36 = 0.0;
          float v203 = 1.0;
          float v201 = 0.0;
          float v181 = v13;
          float v182 = -1.0;
          float v179 = -1.0;
          float v180 = -v13;
          float v177 = 1.0;
          float v178 = 1.0;
          float v176 = -1.0;
          int v23 = v200;
          float v212 = 0.0;
          goto LABEL_78;
        }

        float v36 = v29 * -720.0;
        float v91 = 1.0 - v8;
        float v92 = (float)(1.0 - v8) * (float)((float)(1.0 - v8) * -16.0);
        float v93 = (float)(v8 * -16.0) * v8;
        if (v8 > 0.5)
        {
          float v93 = 1.0 - v8;
        }

        else
        {
          float v92 = v8;
          float v91 = v8;
        }

        float v34 = (float)((float)(v93 * v92) + (float)((float)(v91 * 12.0) * v91)) * -7.0;
        float v215 = 0.0;
        LODWORD(v20) = 0;
        LODWORD(v22) = 0;
        float v193 = v13;
        float v194 = 1.0;
        float v195 = 1.0;
        unint64_t v190 = __PAIR64__(1.0, -1.0);
        float v191 = -1.0;
        float v192 = -v13;
        float v184 = 0.0;
        float v185 = 0.0;
        float v208 = 0.0;
        float v209 = 0.0;
        float v203 = 1.0;
        float v201 = 0.0;
        float v181 = v13;
        float v182 = -1.0;
        float v198 = 1.0;
        float v179 = -1.0;
        float v180 = -v13;
        float v177 = 1.0;
        float v178 = 1.0;
        float v176 = -1.0;
        float v212 = 0.0;
        float v207 = v34;
        float v196 = 0.0;
        int v23 = v200;
        int v37 = 1;
        break;
      case 3u:
      case 0xAu:
        *(float *)&__int32 v216 = v29;
        id v38 = -[NSDictionary objectForKey:]( self->super.mFlattenedAttributes,  "objectForKey:",  @"amountFactor",  v32,  v31,  v16,  v17,  v18,  v19,  v20,  v21);
        if (v38)
        {
          [v38 floatValue];
          _D1 = v39;
          float v195 = 1.0;
          float v11 = v222;
          if (v39 > 1.0)
          {
            double v20 = 0.0;
            unint64_t v190 = __PAIR64__(1.0, -1.0);
            float v198 = 1.0;
            float v199 = -1.0;
            float v193 = v13;
            float v194 = 1.0;
            float v191 = -1.0;
            float v41 = -1.0;
            float v192 = -v13;
            float v42 = v13;
            float v43 = -v13;
            float v44 = -1.0;
            float v45 = 1.0;
            float v46 = 1.0;
            float v47 = -1.0;
            *(void *)&__int128 v22 = 0LL;
            switch(self->super._direction)
            {
              case 1:
                v48.i32[0] = v216;
                float v49 = 1.0 - (float)(v48.f32[0] + v48.f32[0]) * _D1;
                float v41 = (1.0 - (1.0 - *(float *)&v216) * _D1) * -2.0 + 1.0;
                float v198 = v41 + 2.0;
                float v199 = v49 + -2.0;
                float v194 = v49;
                float v195 = 1.0;
                v48.f32[1] = 1.0 - *(float *)&v216;
                double v20 = COERCE_DOUBLE(vmul_n_f32(vmul_f32(v48, (float32x2_t)0x40000000C0000000LL), v39));
                goto LABEL_92;
              case 2:
                v97.i32[0] = v216;
                float v98 = (1.0 - (1.0 - *(float *)&v216) * _D1) * 2.0 + -1.0;
                float v198 = v98;
                float v41 = v98 + -2.0;
                LODWORD(v190) = -1.0;
                v97.f32[1] = *(float *)&v216 + -1.0;
                float32x2_t v99 = vadd_f32(v97, v97);
                float v100 = v99.f32[0] * _D1 + -1.0;
                float v199 = v100;
                float v194 = v100 + 2.0;
                double v20 = COERCE_DOUBLE(vmul_n_f32(v99, v39));
LABEL_92:
                float v192 = -v13;
                float v193 = v13;
                HIDWORD(v190) = 1.0;
                float v191 = -1.0;
                float v42 = v13;
                float v43 = -v13;
                float v44 = -1.0;
                goto LABEL_93;
              case 3:
              case 5:
              case 6:
              case 7:
                goto LABEL_110;
              case 4:
                v101.i32[0] = v216;
                float v102 = -(v13 - (float)(v30 * *(float *)&v216) * _D1);
                float v192 = v102;
                float v193 = v30 + v102;
                float v42 = -(v13 - v30 * (1.0 - (1.0 - *(float *)&v216) * _D1));
                float v43 = v42 - v30;
                float v44 = -1.0;
                v101.f32[1] = *(float *)&v216 + -1.0;
                *(float32x2_t *)&__int128 v22 = vmul_n_f32(vadd_f32(v101, v101), v39);
                float v194 = 1.0;
                unint64_t v190 = __PAIR64__(1.0, -1.0);
                float v191 = -1.0;
                float v41 = -1.0;
                float v198 = 1.0;
                float v199 = -1.0;
                goto LABEL_98;
              case 8:
                v103.i32[0] = v216;
                float v104 = v13 - (float)(v30 * *(float *)&v216) * _D1;
                float v193 = v104;
                float v192 = v104 - v30;
                float v43 = v13 - v30 * (1.0 - (1.0 - *(float *)&v216) * _D1);
                float v42 = v30 + v43;
                float v194 = 1.0;
                v103.f32[1] = 1.0 - *(float *)&v216;
                *(float32x2_t *)&__int128 v22 = vmul_n_f32(vmul_f32(v103, (float32x2_t)0x40000000C0000000LL), v39);
                float v195 = 1.0;
                HIDWORD(v190) = 1.0;
                float v191 = -1.0;
                float v41 = -1.0;
                float v198 = 1.0;
                float v199 = -1.0;
                goto LABEL_97;
              default:
                float v193 = v13;
                float v194 = 1.0;
                HIDWORD(v190) = 1.0;
                float v191 = -1.0;
                float v192 = -v13;
                float v41 = -1.0;
                float v198 = 1.0;
                float v199 = -1.0;
                float v42 = v13;
                float v43 = -v13;
                goto LABEL_108;
            }
          }
        }

        else
        {
          _D1 = 1.0;
          float v11 = v222;
        }

        double v20 = 0.0;
        float v194 = 1.0;
        float v199 = -1.0;
        unint64_t v190 = __PAIR64__(1.0, -1.0);
        float v195 = 1.0;
        float v191 = -1.0;
        float v41 = -1.0;
        float v192 = -v13;
        float v193 = v13;
        float v198 = 1.0;
        float v42 = v13;
        float v43 = -v13;
        float v44 = -1.0;
        float v45 = 1.0;
        float v46 = 1.0;
        float v47 = -1.0;
        *(void *)&__int128 v22 = 0LL;
        switch(self->super._direction)
        {
          case 1:
            v65.i32[0] = v216;
            float v66 = 1.0 - (float)(v65.f32[0] + v65.f32[0]) * _D1;
            float v199 = -1.0;
            float v45 = (float)(*(float *)&v216 * 2.0) + -1.0;
            float v41 = (1.0 - (1.0 - *(float *)&v216) * _D1) * -2.0 + 1.0;
            float v194 = v66;
            float v195 = 1.0;
            v65.f32[1] = 1.0 - *(float *)&v216;
            double v20 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(vmul_f32(v65, (float32x2_t)0x40000000C0000000LL)), _D1)));
            float v192 = -v13;
            float v193 = v13;
            HIDWORD(v190) = 1.0;
            float v191 = -1.0;
            float v198 = 1.0;
            float v42 = v13;
            float v43 = -v13;
            float v44 = -1.0;
            *(float *)&unint64_t v190 = v45;
            goto LABEL_94;
          case 2:
            float v194 = 1.0;
            v76.i32[0] = v216;
            float v77 = (1.0 - (1.0 - *(float *)&v216) * _D1) * 2.0 + -1.0;
            unint64_t v190 = __PAIR64__(1.0, -1.0);
            v76.f32[1] = *(float *)&v216 + -1.0;
            float64x2_t v78 = vcvtq_f64_f32(vadd_f32(v76, v76));
            float v79 = vmlad_n_f64(-1.0, _D1, v78.f64[0]);
            float v198 = v77;
            float v199 = v79;
            double v20 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_n_f64(v78, _D1)));
            float v192 = -v13;
            float v193 = v13;
            float v191 = -1.0;
            float v42 = v13;
            float v43 = -v13;
            float v195 = (float)(*(float *)&v216 * -2.0) + 1.0;
            float v44 = v195;
LABEL_93:
            float v45 = 1.0;
LABEL_94:
            float v46 = 1.0;
            goto LABEL_109;
          case 3:
          case 5:
          case 6:
          case 7:
            goto LABEL_110;
          case 4:
            v80.i32[0] = v216;
            float v81 = -(v13 - (float)(v30 * *(float *)&v216) * _D1);
            float v192 = v81;
            float v42 = -(v13 - v30 * (1.0 - (1.0 - *(float *)&v216) * _D1));
            float v193 = v13;
            float v194 = 1.0;
            float v47 = (float)(*(float *)&v216 * -2.0) + 1.0;
            v80.f32[1] = *(float *)&v216 + -1.0;
            _Q0 = vcvtq_f64_f32(vadd_f32(v80, v80));
            __asm { FMLS            D4, D1, V0.D[0] }

            *(float *)&unsigned int v88 = _D4;
            *(float32x2_t *)&__int128 v22 = vcvt_f32_f64(vmulq_n_f64(_Q0, _D1));
            unint64_t v190 = __PAIR64__(v88, -1.0);
            float v195 = 1.0;
            float v191 = -1.0;
            float v198 = 1.0;
            float v199 = -1.0;
            float v43 = -v13;
LABEL_97:
            float v44 = -1.0;
LABEL_98:
            float v45 = 1.0;
            float v46 = 1.0;
            goto LABEL_110;
          case 8:
            v89.i32[0] = v216;
            float v90 = v13 - (float)(v30 * *(float *)&v216) * _D1;
            float v193 = v90;
            float v199 = -1.0;
            float v46 = (float)(*(float *)&v216 * 2.0) + -1.0;
            float v194 = 1.0;
            v89.f32[1] = 1.0 - *(float *)&v216;
            float v43 = v13 - v30 * (1.0 - (1.0 - *(float *)&v216) * _D1);
            *(float32x2_t *)&__int128 v22 = vcvt_f32_f64(vmulq_n_f64(vcvtq_f64_f32(vmul_f32(v89, (float32x2_t)0x40000000C0000000LL)), _D1));
            float v191 = v46;
            float v192 = -v13;
            float v195 = 1.0;
            unint64_t v190 = __PAIR64__(1.0, -1.0);
            float v41 = -1.0;
            float v198 = 1.0;
            float v42 = v13;
            float v44 = -1.0;
            float v45 = 1.0;
            goto LABEL_110;
          default:
            *(float *)&unint64_t v190 = -v13;
            float v195 = 1.0;
            float v192 = -v13;
            float v193 = v13;
            HIDWORD(v190) = 1.0;
            float v191 = -1.0;
            float v41 = -1.0;
            float v198 = 1.0;
            float v42 = v13;
            float v43 = -v13;
            float v44 = -1.0;
LABEL_108:
            float v45 = 1.0;
            float v46 = 1.0;
            float v47 = -1.0;
LABEL_109:
            *(void *)&__int128 v22 = 0LL;
LABEL_110:
            float v176 = v47;
            float v177 = v46;
            float v178 = v45;
            float v179 = v44;
            float v180 = v43;
            float v181 = v42;
            float v182 = v41;
            float v186 = 0.0;
            float v33 = *((float *)&v22 + 1);
            float v201 = *((float *)&v20 + 1);
            if (self->mSubtype == 10)
            {
              __int128 v173 = v22;
              int v174 = LODWORD(v20);
              float v105 = cosf((float)(v8 + v8) * 3.1416);
              __int128 v22 = v173;
              LODWORD(v20) = v174;
              int v219 = 0;
              int v35 = 0;
              BOOL v187 = 0;
              float v12 = (float)(v105 * 0.35) + 0.65;
              float v215 = 0.0;
              float v184 = 0.0;
              float v185 = 0.0;
              BOOL v26 = 1;
              float v206 = 1.0;
              float v207 = 0.0;
              float v208 = 0.0;
              float v209 = 0.0;
              float v36 = 0.0;
              float v203 = v12;
              float v204 = 1.0;
              float v212 = 0.0;
              int v200 = v24;
              int v23 = 1;
              float v196 = 0.0;
              int v197 = 1;
              int v37 = 1;
              goto LABEL_114;
            }

            int v23 = 0;
            int v197 = 0;
            int v219 = 0;
            int v35 = 0;
            BOOL v187 = 0;
            float v215 = 0.0;
            float v184 = 0.0;
            float v185 = 0.0;
            BOOL v26 = 1;
            float v206 = 1.0;
            float v207 = 0.0;
            float v208 = 0.0;
            float v209 = 0.0;
            float v36 = 0.0;
            float v203 = 1.0;
            float v204 = 1.0;
            int v200 = v24;
            float v212 = 0.0;
            int v37 = 1;
            break;
        }

        goto LABEL_113;
      case 4u:
        int direction = self->super._direction;
        unsigned int v51 = direction - 1;
        if (v8 >= 0.5)
        {
          float v186 = 0.0;
          float v67 = 1.0 - v29;
          float v11 = v222;
          if (v51 > 2)
          {
            float v34 = v67 * flt_1FA0D0[direction == 4];
            float v95 = v13 * sinf(v34);
            float v96 = -v95;
            if (direction == 8) {
              float v96 = v95;
            }
            float v207 = v96;
            float v68 = 0.0;
          }

          else
          {
            float v68 = v67 * flt_1FA0D8[direction == 2];
            float v69 = sinf(v68);
            if (direction != 2) {
              float v69 = -v69;
            }
            float v207 = v69;
          }

          int v23 = 0;
          int v197 = 0;
          BOOL v25 = 0;
          int v219 = 0;
          int v35 = 0;
          BOOL v187 = 0;
          float v208 = v68 * 57.296;
          float v209 = v34 * 57.296;
          float v12 = 1.0;
          float v215 = 0.0;
          float v206 = 1.0;
          LODWORD(v20) = 0;
          LODWORD(v22) = 0;
          BOOL v26 = 1;
          float v194 = 1.0;
          float v195 = 1.0;
          unint64_t v190 = __PAIR64__(1.0, -1.0);
          float v192 = -v13;
          float v193 = v13;
          float v191 = -1.0;
          float v184 = 0.0;
          float v185 = 0.0;
          float v36 = 0.0;
          float v203 = 1.0;
          float v204 = 1.0;
          float v201 = 0.0;
          float v181 = v13;
          float v182 = -1.0;
          float v198 = 1.0;
          float v179 = -1.0;
          float v180 = -v13;
          float v177 = 1.0;
          float v178 = 1.0;
          float v176 = -1.0;
          float v212 = 0.0;
          int v200 = v24;
          float v34 = 0.0;
LABEL_78:
          int v37 = 1;
        }

        else
        {
          float v186 = 0.0;
          float v11 = v222;
          if (v51 > 2)
          {
            float v53 = flt_1FA0D8[direction == 4] * v29;
            float v94 = v13 * sinf(v53);
            if (direction == 8) {
              float v34 = -v94;
            }
            else {
              float v34 = v94;
            }
          }

          else
          {
            float v33 = flt_1FA0D0[direction == 2] * v29;
            float v52 = sinf(v33);
            if (direction == 2) {
              float v34 = -v52;
            }
            else {
              float v34 = v52;
            }
            float v53 = 0.0;
          }

          BOOL v26 = 0;
          int v23 = 0;
          int v197 = 0;
          int v219 = 0;
          int v35 = 0;
          BOOL v187 = 0;
          float v212 = v53 * 57.296;
          float v215 = v33 * 57.296;
          float v12 = 1.0;
          float v206 = 1.0;
          LODWORD(v20) = 0;
          LODWORD(v22) = 0;
          float v194 = 1.0;
          float v195 = 1.0;
          unint64_t v190 = __PAIR64__(1.0, -1.0);
          float v191 = -1.0;
          float v192 = -v13;
          float v193 = v13;
          float v184 = 0.0;
          float v185 = 0.0;
          float v207 = 0.0;
          float v208 = 0.0;
          float v209 = 0.0;
          float v36 = 0.0;
          float v203 = 1.0;
          float v204 = 1.0;
          float v201 = 0.0;
          float v33 = 0.0;
          float v181 = v13;
          float v182 = -1.0;
          float v179 = -1.0;
          float v180 = -v13;
          float v177 = 1.0;
          float v178 = 1.0;
          int v200 = v24;
          float v176 = -1.0;
          int v37 = 1;
        }

        goto LABEL_10;
      case 5u:
        float v186 = 0.0;
        int v23 = 0;
        float v215 = 0.0;
        float v206 = 1.0;
        LODWORD(v20) = 0;
        LODWORD(v22) = 0;
        float v193 = v13;
        float v194 = 1.0;
        float v195 = 1.0;
        unint64_t v190 = __PAIR64__(1.0, -1.0);
        float v191 = -1.0;
        float v192 = -v13;
        float v184 = 0.0;
        float v185 = 0.0;
        float v207 = 0.0;
        float v208 = 0.0;
        float v209 = 0.0;
        float v36 = 0.0;
        float v203 = 1.0;
        float v204 = 1.0;
        float v201 = 0.0;
        float v181 = v13;
        float v182 = -1.0;
        float v179 = -1.0;
        float v180 = -v13;
        int v200 = v15[3] < 1.0;
        float v177 = 1.0;
        float v178 = 1.0;
        int v197 = 0;
        float v176 = -1.0;
        int v37 = 1;
        float v212 = 0.0;
        int v219 = 0;
        int v35 = 0;
        BOOL v187 = 0;
        float v196 = 0.0;
        float v11 = v222;
        switch(self->super._direction)
        {
          case 1:
            int v23 = 0;
            int v197 = 0;
            int v219 = 0;
            int v35 = 0;
            BOOL v187 = 0;
            float v199 = -1.0;
            float v178 = (float)(v29 * 2.0) + -1.0;
            float v201 = (float)(1.0 - v29) + (float)(1.0 - v29);
            float v215 = 0.0;
            LODWORD(v20) = 0;
            LODWORD(v22) = 0;
            float v192 = -v13;
            float v193 = v13;
            unint64_t v190 = __PAIR64__(1.0, -1.0);
            float v194 = (float)(v29 * -2.0) + 1.0;
            float v195 = v194;
            float v191 = -1.0;
            float v184 = 0.0;
            float v185 = 0.0;
            float v206 = 1.0;
            float v207 = 0.0;
            float v208 = 0.0;
            float v209 = 0.0;
            float v203 = 1.0;
            float v204 = 1.0;
            float v181 = v13;
            float v182 = v194;
            float v198 = 1.0;
            float v179 = -1.0;
            float v180 = -v13;
            float v54 = 1.0;
            goto LABEL_80;
          case 2:
            int v23 = 0;
            int v197 = 0;
            int v219 = 0;
            int v35 = 0;
            BOOL v187 = 0;
            float v179 = (float)(v29 * -2.0) + 1.0;
            float v201 = (float)(v29 + -1.0) + (float)(v29 + -1.0);
            float v215 = 0.0;
            float v206 = 1.0;
            LODWORD(v20) = 0;
            LODWORD(v22) = 0;
            float v193 = v13;
            float v194 = 1.0;
            float v191 = -1.0;
            float v192 = -v13;
            float v195 = 1.0;
            *(float *)&unint64_t v190 = (float)(v29 * 2.0) + -1.0;
            HIDWORD(v190) = 1.0;
            float v184 = 0.0;
            float v185 = 0.0;
            float v207 = 0.0;
            float v208 = 0.0;
            float v209 = 0.0;
            float v203 = 1.0;
            float v204 = 1.0;
            float v181 = v13;
            float v182 = -1.0;
            float v198 = *(float *)&v190;
            float v199 = *(float *)&v190;
            float v180 = -v13;
            float v54 = 1.0;
            float v178 = 1.0;
LABEL_80:
            float v177 = v54;
            float v176 = -1.0;
            float v212 = 0.0;
            int v200 = v15[3] < 1.0;
            goto LABEL_10;
          case 3:
          case 5:
          case 6:
          case 7:
            goto LABEL_114;
          case 4:
            int v23 = 0;
            int v197 = 0;
            int v219 = 0;
            int v35 = 0;
            BOOL v187 = 0;
            float v176 = (float)(v29 * -2.0) + 1.0;
            float v199 = -1.0;
            float v33 = (float)(v29 + -1.0) + (float)(v29 + -1.0);
            float v215 = 0.0;
            float v206 = 1.0;
            LODWORD(v20) = 0;
            LODWORD(v22) = 0;
            float v193 = v13;
            float v194 = 1.0;
            unint64_t v190 = __PAIR64__(1.0, -1.0);
            float v195 = 1.0;
            float v191 = (float)(v29 * 2.0) + -1.0;
            float v184 = 0.0;
            float v185 = 0.0;
            float v207 = 0.0;
            float v208 = 0.0;
            float v209 = 0.0;
            float v203 = 1.0;
            float v204 = 1.0;
            float v201 = 0.0;
            float v181 = (float)(v30 * v29) - v13;
            float v182 = -1.0;
            float v198 = 1.0;
            float v192 = v181;
            float v179 = -1.0;
            float v180 = -v13;
            float v177 = 1.0;
            float v178 = 1.0;
            goto LABEL_83;
          case 8:
            int v23 = 0;
            int v197 = 0;
            int v219 = 0;
            int v35 = 0;
            BOOL v187 = 0;
            float v199 = -1.0;
            float v177 = (float)(v29 * 2.0) + -1.0;
            float v33 = (float)(1.0 - v29) + (float)(1.0 - v29);
            float v215 = 0.0;
            float v206 = 1.0;
            LODWORD(v20) = 0;
            LODWORD(v22) = 0;
            LODWORD(v190) = -1.0;
            *((float *)&v190 + 1) = (float)(v29 * -2.0) + 1.0;
            float v194 = 1.0;
            float v195 = 1.0;
            float v191 = -1.0;
            float v192 = -v13;
            float v184 = 0.0;
            float v185 = 0.0;
            float v207 = 0.0;
            float v208 = 0.0;
            float v209 = 0.0;
            float v203 = 1.0;
            float v204 = 1.0;
            float v201 = 0.0;
            float v181 = v13;
            float v182 = -1.0;
            float v198 = 1.0;
            float v193 = v13 - (float)(v30 * v29);
            float v179 = -1.0;
            float v180 = v193;
            float v178 = 1.0;
            float v176 = -1.0;
LABEL_83:
            int v200 = v15[3] < 1.0;
            float v212 = 0.0;
            break;
          default:
            float v215 = 0.0;
            float v206 = 1.0;
            LODWORD(v20) = 0;
            LODWORD(v22) = 0;
            float v193 = v13;
            float v194 = 1.0;
            float v195 = 1.0;
            unint64_t v190 = __PAIR64__(1.0, -1.0);
            float v191 = -1.0;
            float v192 = -v13;
            float v184 = 0.0;
            float v185 = 0.0;
            float v207 = 0.0;
            float v208 = 0.0;
            float v209 = 0.0;
            float v36 = 0.0;
            float v203 = 1.0;
            float v204 = 1.0;
            float v201 = 0.0;
            float v181 = v13;
            float v182 = -1.0;
            float v179 = -1.0;
            float v180 = -v13;
            int v200 = v15[3] < 1.0;
            float v177 = 1.0;
            float v178 = 1.0;
            int v197 = 0;
            float v176 = -1.0;
            int v37 = 1;
            float v212 = 0.0;
            int v219 = 0;
            goto LABEL_104;
        }

        goto LABEL_10;
      case 6u:
        float v186 = 0.0;
        int v23 = 0;
        float v215 = 0.0;
        float v206 = 1.0;
        LODWORD(v20) = 0;
        LODWORD(v22) = 0;
        float v193 = v13;
        float v194 = 1.0;
        float v195 = 1.0;
        unint64_t v190 = __PAIR64__(1.0, -1.0);
        float v191 = -1.0;
        float v192 = -v13;
        float v184 = 0.0;
        float v185 = 0.0;
        float v207 = 0.0;
        float v208 = 0.0;
        float v209 = 0.0;
        float v36 = 0.0;
        float v203 = 1.0;
        float v204 = 1.0;
        float v201 = 0.0;
        float v181 = v13;
        float v182 = -1.0;
        float v179 = -1.0;
        float v180 = -v13;
        int v200 = v15[3] < 1.0;
        float v177 = 1.0;
        float v178 = 1.0;
        int v197 = 0;
        float v176 = -1.0;
        int v37 = 1;
        float v212 = 0.0;
        int v219 = 1;
        int v35 = 0;
        BOOL v187 = 0;
        float v196 = 0.0;
        float v11 = v222;
        switch(self->super._direction)
        {
          case 1:
            int v23 = 0;
            int v197 = 0;
            int v35 = 0;
            BOOL v187 = 0;
            float v199 = -1.0;
            *(float *)&double v20 = v29 * -2.0;
            float v215 = 0.0;
            LODWORD(v22) = 0;
            float v192 = -v13;
            float v193 = v13;
            float v194 = (float)(v29 * -2.0) + 1.0;
            float v195 = 1.0;
            *(float *)&unint64_t v190 = (float)(v29 * 2.0) + -1.0;
            HIDWORD(v190) = 1.0;
            float v191 = -1.0;
            float v184 = 0.0;
            float v185 = 0.0;
            float v206 = 1.0;
            float v207 = 0.0;
            float v208 = 0.0;
            float v209 = 0.0;
            float v203 = 1.0;
            float v204 = 1.0;
            float v201 = 0.0;
            float v181 = v13;
            float v182 = v194;
            float v198 = 1.0;
            float v179 = v194;
            float v180 = -v13;
            float v55 = 1.0;
            float v178 = 1.0;
            goto LABEL_85;
          case 2:
            int v23 = 0;
            int v197 = 0;
            int v35 = 0;
            BOOL v187 = 0;
            unint64_t v190 = __PAIR64__(1.0, -1.0);
            *(float *)&double v20 = v29 + v29;
            float v215 = 0.0;
            float v206 = 1.0;
            LODWORD(v22) = 0;
            float v194 = 1.0;
            float v195 = (float)(v29 * -2.0) + 1.0;
            float v192 = -v13;
            float v193 = v13;
            float v191 = -1.0;
            float v184 = 0.0;
            float v185 = 0.0;
            float v207 = 0.0;
            float v208 = 0.0;
            float v209 = 0.0;
            float v203 = 1.0;
            float v204 = 1.0;
            float v201 = 0.0;
            float v181 = v13;
            float v182 = -1.0;
            float v198 = (float)(v29 * 2.0) + -1.0;
            float v199 = v198;
            float v179 = -1.0;
            float v180 = -v13;
            float v178 = v198;
            float v55 = 1.0;
LABEL_85:
            float v177 = v55;
            float v176 = -1.0;
            float v212 = 0.0;
            int v200 = v15[3] < 1.0;
            goto LABEL_89;
          case 3:
          case 5:
          case 6:
          case 7:
            goto LABEL_114;
          case 4:
            int v23 = 0;
            int v197 = 0;
            int v35 = 0;
            BOOL v187 = 0;
            *(float *)&__int128 v22 = v29 + v29;
            float v199 = -1.0;
            float v177 = (float)(v29 * 2.0) + -1.0;
            float v215 = 0.0;
            float v206 = 1.0;
            LODWORD(v20) = 0;
            float v193 = v13;
            float v194 = 1.0;
            LODWORD(v190) = -1.0;
            *((float *)&v190 + 1) = (float)(v29 * -2.0) + 1.0;
            float v195 = 1.0;
            float v191 = -1.0;
            float v192 = (float)(v30 * v29) - v13;
            float v184 = 0.0;
            float v185 = 0.0;
            float v207 = 0.0;
            float v208 = 0.0;
            float v209 = 0.0;
            float v203 = 1.0;
            float v204 = 1.0;
            float v201 = 0.0;
            float v181 = v192;
            float v182 = -1.0;
            float v198 = 1.0;
            float v179 = -1.0;
            float v180 = -v13;
            float v178 = 1.0;
            float v176 = -1.0;
            goto LABEL_88;
          case 8:
            int v23 = 0;
            int v197 = 0;
            int v35 = 0;
            BOOL v187 = 0;
            float v199 = -1.0;
            *(float *)&__int128 v22 = v29 * -2.0;
            float v176 = (float)(v29 * -2.0) + 1.0;
            float v215 = 0.0;
            float v206 = 1.0;
            LODWORD(v20) = 0;
            float v191 = (float)(v29 * 2.0) + -1.0;
            float v192 = -v13;
            float v194 = 1.0;
            float v195 = 1.0;
            unint64_t v190 = __PAIR64__(1.0, -1.0);
            float v184 = 0.0;
            float v185 = 0.0;
            float v207 = 0.0;
            float v208 = 0.0;
            float v209 = 0.0;
            float v203 = 1.0;
            float v204 = 1.0;
            float v201 = 0.0;
            float v181 = v13;
            float v182 = -1.0;
            float v198 = 1.0;
            float v193 = v13 - (float)(v30 * v29);
            float v179 = -1.0;
            float v180 = v193;
            float v177 = 1.0;
            float v178 = 1.0;
LABEL_88:
            int v200 = v15[3] < 1.0;
            float v212 = 0.0;
LABEL_89:
            int v219 = 1;
            break;
          default:
            float v215 = 0.0;
            float v206 = 1.0;
            LODWORD(v20) = 0;
            LODWORD(v22) = 0;
            float v193 = v13;
            float v194 = 1.0;
            float v195 = 1.0;
            unint64_t v190 = __PAIR64__(1.0, -1.0);
            float v191 = -1.0;
            float v192 = -v13;
            float v184 = 0.0;
            float v185 = 0.0;
            float v207 = 0.0;
            float v208 = 0.0;
            float v209 = 0.0;
            float v36 = 0.0;
            float v203 = 1.0;
            float v204 = 1.0;
            float v201 = 0.0;
            float v181 = v13;
            float v182 = -1.0;
            float v179 = -1.0;
            float v180 = -v13;
            int v200 = v15[3] < 1.0;
            float v177 = 1.0;
            float v178 = 1.0;
            int v197 = 0;
            float v176 = -1.0;
            int v37 = 1;
            float v212 = 0.0;
            int v219 = 1;
LABEL_104:
            int v35 = 0;
            BOOL v187 = 0;
            goto LABEL_105;
        }

        goto LABEL_10;
      case 7u:
        int v56 = self->super._direction;
        if ((v56 - 1) > 2)
        {
          float v70 = 1.5708;
          if (v56 == 4) {
            float v70 = -1.5708;
          }
          float v64 = v70 * v29;
          __float2 v71 = __sincosf_stret(v70 * v29);
          float v11 = v71.__sinval * v220;
          *(float *)&__int128 v72 = v222 * (float)(v71.__sinval * v220);
          __int128 v173 = v72;
          float v34 = v13 * (float)(v71.__cosval + -1.0);
          float v73 = 1.5708;
          if (v56 == 8) {
            float v73 = -1.5708;
          }
          float v74 = v73 + v64;
          __float2 v75 = __sincosf_stret(v73 + v64);
          float v63 = v74;
          __int128 v22 = v173;
          *(float *)&double v18 = v75.__sinval * v220;
          float v33 = v222 * (float)(v75.__sinval * v220);
          *(float *)&double v16 = v13 * (float)(v75.__cosval + -1.0);
          float v58 = 0.0;
          float v61 = 0.0;
          LODWORD(v32) = 0;
          LODWORD(v20) = 0;
        }

        else
        {
          if (v56 == 2) {
            float v57 = 1.5708;
          }
          else {
            float v57 = -1.5708;
          }
          float v58 = v57 * v29;
          if (v56 == 2) {
            float v59 = -1.5708;
          }
          else {
            float v59 = 1.5708;
          }
          __float2 v60 = __sincosf_stret(v57 * v29);
          float v34 = v60.__cosval + -1.0;
          float v61 = v59 + v58;
          __float2 v62 = __sincosf_stret(v59 + v58);
          *(float *)&double v32 = v62.__sinval;
          *(float *)&double v20 = v60.__sinval;
          *(float *)&double v16 = v62.__cosval + -1.0;
          LODWORD(v22) = 0;
          LODWORD(v18) = 0;
          float v63 = 0.0;
          float v33 = 0.0;
          float v64 = 0.0;
        }

        *(float *)&double v21 = v64 * 57.296;
        *(float *)&double v31 = v58 * 57.296;
        *(float *)&double v19 = v63 * 57.296;
        *(float *)&double v17 = v61 * 57.296;
        BOOL v26 = 1;
        int v23 = v24;
        int v35 = 1;
        goto LABEL_57;
      case 9u:
        goto LABEL_57;
      case 0xBu:
        int v23 = 0;
        int v35 = 0;
        BOOL v26 = v8 == 1.0;
        LODWORD(v22) = 0;
        LODWORD(v32) = 0;
        goto LABEL_39;
      case 0xCu:
        int v23 = 0;
        int v35 = 0;
        LODWORD(v22) = 0;
        BOOL v25 = v8 == 0.0;
LABEL_39:
        LODWORD(v20) = 0;
LABEL_57:
        float v212 = *(float *)&v21;
        float v208 = *(float *)&v17;
        float v209 = *(float *)&v19;
        float v184 = *(float *)&v18;
        float v207 = *(float *)&v16;
        float v215 = *(float *)&v31;
        int v197 = 0;
        int v219 = 0;
        BOOL v187 = 0;
        float v12 = 1.0;
        float v206 = 1.0;
        float v193 = v13;
        float v194 = 1.0;
        int v24 = v23;
        float v195 = 1.0;
        float v196 = *(float *)&v20;
        unint64_t v190 = __PAIR64__(1.0, -1.0);
        float v191 = -1.0;
        float v192 = -v13;
        float v36 = 0.0;
        float v203 = 1.0;
        float v204 = 1.0;
        float v185 = *(float *)&v32;
        float v186 = v11;
        float v201 = *(float *)&v32;
        float v181 = v13;
        float v182 = -1.0;
        float v179 = -1.0;
        float v180 = -v13;
        float v177 = 1.0;
        float v178 = 1.0;
        int v200 = v23;
        int v37 = 1;
        float v176 = -1.0;
        int v23 = 0;
        goto LABEL_106;
      default:
        float v186 = 0.0;
        float v215 = 0.0;
        float v206 = 1.0;
        LODWORD(v20) = 0;
        LODWORD(v22) = 0;
        float v193 = v13;
        float v194 = 1.0;
        float v195 = 1.0;
        unint64_t v190 = __PAIR64__(1.0, -1.0);
        float v191 = -1.0;
        float v192 = -v13;
        float v184 = 0.0;
        float v185 = 0.0;
        float v207 = 0.0;
        float v208 = 0.0;
        float v209 = 0.0;
        float v36 = 0.0;
        float v203 = 1.0;
        float v204 = 1.0;
        float v201 = 0.0;
        float v33 = 0.0;
        float v181 = v13;
        float v182 = -1.0;
        float v179 = -1.0;
        float v180 = -v13;
        int v200 = v15[3] < 1.0;
        float v177 = 1.0;
        float v178 = 1.0;
        int v197 = 0;
        BOOL v25 = 1;
        float v176 = -1.0;
        int v37 = 1;
        float v212 = 0.0;
        int v219 = 0;
        float v34 = 0.0;
        int v35 = 0;
        BOOL v187 = 0;
LABEL_113:
        float v196 = 0.0;
        break;
    }
  }

- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  return 0LL;
}

@end