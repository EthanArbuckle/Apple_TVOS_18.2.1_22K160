@interface CLFallModelSelector
- (BOOL)fillFallThresholds:(FallThresholds *)a3;
- (BOOL)fillOtherFallModel:(FallModel *)a3;
- (BOOL)fillSlipFallModel:(FallModel *)a3;
- (BOOL)fillTripFallModel:(FallModel *)a3;
- (BOOL)selectModels;
- (BOOL)setSelectionFeatureValue:(id)a3 value:(id)a4;
- (CLFallModelSelector)init;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation CLFallModelSelector

- (CLFallModelSelector)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CLFallModelSelector;
  -[CLFallModelSelector init](&v4, "init");
  if (self) {
    self->fSelectionFeatures = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLFallModelSelector;
  -[CLFallModelSelector dealloc](&v3, "dealloc");
}

- (BOOL)setSelectionFeatureValue:(id)a3 value:(id)a4
{
  return 1;
}

- (BOOL)selectModels
{
  *(_OWORD *)self->fTripFallModel.fRatioMaxAbsX = xmmword_101991C10;
  LODWORD(self->fTripFallModel.fRatioMaxAbsX[16]) = dword_101991C50;
  __int128 v3 = xmmword_101991C40;
  __int128 v4 = xmmword_101991C20;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsX[8] = unk_101991C30;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsX[12] = v3;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsX[4] = v4;
  LODWORD(self->fTripFallModel.fRatioMaxAbsY[16]) = dword_101991C94;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsY[12] = unk_101991C84;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsY[8] = unk_101991C74;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsY[4] = unk_101991C64;
  *(_OWORD *)self->fTripFallModel.fRatioMaxAbsY = *(_OWORD *)algn_101991C54;
  *(_OWORD *)self->fTripFallModel.fRatioMaxAbsZ = unk_101991C98;
  __int128 v5 = unk_101991CA8;
  __int128 v6 = unk_101991CB8;
  __int128 v7 = unk_101991CC8;
  LODWORD(self->fTripFallModel.fRatioMaxAbsZ[16]) = dword_101991CD8;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsZ[12] = v7;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsZ[8] = v6;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsZ[4] = v5;
  memcpy(self->fTripFallModel.fRatioMaxJerkVM, &unk_101991CDC, sizeof(self->fTripFallModel.fRatioMaxJerkVM));
  __int128 v8 = unk_101991DF8;
  *(_OWORD *)self->fTripFallModel.fRatioMinInertialZ = xmmword_101991DE8;
  *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[4] = v8;
  LODWORD(self->fTripFallModel.fRatioMinInertialZ[20]) = dword_101991E38;
  __int128 v9 = xmmword_101991E28;
  __int128 v10 = xmmword_101991E08;
  *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[12] = unk_101991E18;
  *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[16] = v9;
  *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[8] = v10;
  uint64_t v11 = qword_101991E5C;
  __int128 v12 = unk_101991E4C;
  *(_OWORD *)self->fTripFallModel.fRatioAccelPathLength = xmmword_101991E3C;
  *(_OWORD *)&self->fTripFallModel.fRatioAccelPathLength[4] = v12;
  *(void *)&self->fTripFallModel.fRatioAccelPathLength[8] = v11;
  __int128 v13 = xmmword_101991E64;
  __int128 v14 = *(_OWORD *)algn_101991E74;
  __int128 v15 = unk_101991E94;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePreimpact[8] = xmmword_101991E84;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePreimpact[12] = v15;
  *(_OWORD *)self->fTripFallModel.fRatioMaxAngleChangePreimpact = v13;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePreimpact[4] = v14;
  __int128 v16 = xmmword_101991EA4;
  __int128 v17 = *(_OWORD *)algn_101991EB4;
  __int128 v18 = unk_101991ED4;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePostimpact[8] = xmmword_101991EC4;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePostimpact[12] = v18;
  *(_OWORD *)self->fTripFallModel.fRatioMaxAngleChangePostimpact = v16;
  *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePostimpact[4] = v17;
  *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[0].double firstBinEdge = xmmword_101991EE4;
  __int128 v19 = xmmword_101991EF4;
  __int128 v20 = unk_101991F04;
  __int128 v21 = xmmword_101991F14;
  *(void *)&self->fTripFallModel.fLikelihoodRatioInfo[5].float binSize = qword_101991F24;
  *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[2].binNum = v20;
  *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[4].double firstBinEdge = v21;
  *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[1].float binSize = v19;
  __int128 v22 = xmmword_101991F2C;
  __int128 v23 = unk_101991F3C;
  __int128 v24 = xmmword_101991F4C;
  __int128 v25 = unk_101991F5C;
  LODWORD(self->fSlipFallModel.fRatioMaxAbsX[10]) = dword_101991F6C;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[2] = v24;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[6] = v25;
  *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[6].double firstBinEdge = v22;
  *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[7].float binSize = v23;
  __int128 v26 = unk_101991F70;
  __int128 v27 = unk_101991F80;
  __int128 v28 = unk_101991F90;
  __int128 v29 = unk_101991FA0;
  LODWORD(self->fSlipFallModel.fRatioMaxAbsY[10]) = dword_101991FB0;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[2] = v28;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[6] = v29;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[11] = v26;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[15] = v27;
  __int128 v30 = *(_OWORD *)algn_101991FB4;
  __int128 v31 = unk_101991FC4;
  __int128 v32 = unk_101991FD4;
  __int128 v33 = unk_101991FE4;
  LODWORD(self->fSlipFallModel.fRatioMaxAbsZ[10]) = dword_101991FF4;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsZ[2] = v32;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsZ[6] = v33;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[11] = v30;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[15] = v31;
  memcpy(&self->fSlipFallModel.fRatioMaxAbsZ[11], &unk_101991FF8, 0x10CuLL);
  __int128 v34 = unk_101992134;
  *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[2] = xmmword_101992124;
  *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[6] = v34;
  *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[10] = xmmword_101992144;
  LODWORD(self->fSlipFallModel.fRatioMinInertialZ[14]) = dword_101992154;
  __int128 v35 = unk_101992114;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxJerkVM[61] = xmmword_101992104;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxJerkVM[65] = v35;
  __int128 v36 = unk_101992168;
  *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[15] = xmmword_101992158;
  *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[19] = v36;
  *(void *)&self->fSlipFallModel.fRatioAccelPathLength[2] = qword_101992178;
  __int128 v37 = xmmword_1019921A0;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[6] = unk_1019921B0;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[2] = v37;
  __int128 v38 = xmmword_101992180;
  *(_OWORD *)&self->fSlipFallModel.fRatioAccelPathLength[8] = *(_OWORD *)algn_101992190;
  *(_OWORD *)&self->fSlipFallModel.fRatioAccelPathLength[4] = v38;
  __int128 v39 = xmmword_1019921E0;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[6] = unk_1019921F0;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[2] = v39;
  __int128 v40 = xmmword_1019921C0;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[14] = *(_OWORD *)algn_1019921D0;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[10] = v40;
  __int128 v41 = unk_101992210;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[10] = xmmword_101992200;
  __int128 v42 = xmmword_101992220;
  __int128 v43 = unk_101992230;
  *(void *)&self->fSlipFallModel.fLikelihoodRatioInfo[3].float binSize = qword_101992240;
  *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[2].double firstBinEdge = v43;
  *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[0].binNum = v42;
  *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[14] = v41;
  __int128 v44 = xmmword_101992248;
  __int128 v45 = unk_101992258;
  __int128 v46 = xmmword_101992268;
  __int128 v47 = unk_101992278;
  LODWORD(self->fOtherFallModel.fRatioMaxAbsX[4]) = dword_101992288;
  *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[6].binNum = v46;
  *(_OWORD *)self->fOtherFallModel.fRatioMaxAbsX = v47;
  *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[4].double firstBinEdge = v44;
  *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[5].float binSize = v45;
  __int128 v48 = unk_10199228C;
  __int128 v49 = unk_10199229C;
  __int128 v50 = unk_1019922AC;
  __int128 v51 = unk_1019922BC;
  LODWORD(self->fOtherFallModel.fRatioMaxAbsY[4]) = dword_1019922CC;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsX[13] = v50;
  *(_OWORD *)self->fOtherFallModel.fRatioMaxAbsY = v51;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsX[5] = v48;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsX[9] = v49;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsY[5] = unk_1019922D0;
  __int128 v52 = unk_1019922E0;
  __int128 v53 = unk_1019922F0;
  __int128 v54 = unk_101992300;
  LODWORD(self->fOtherFallModel.fRatioMaxAbsZ[4]) = dword_101992310;
  *(_OWORD *)self->fOtherFallModel.fRatioMaxAbsZ = v54;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsY[13] = v53;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsY[9] = v52;
  memcpy(&self->fOtherFallModel.fRatioMaxAbsZ[5], &unk_101992314, 0x10CuLL);
  __int128 v55 = unk_101992450;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxJerkVM[63] = xmmword_101992440;
  *(_OWORD *)self->fOtherFallModel.fRatioMinInertialZ = v55;
  *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[4] = xmmword_101992460;
  LODWORD(self->fOtherFallModel.fRatioMinInertialZ[8]) = dword_101992470;
  __int128 v56 = unk_101992430;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxJerkVM[55] = xmmword_101992420;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxJerkVM[59] = v56;
  __int128 v57 = unk_101992484;
  *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[9] = xmmword_101992474;
  *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[13] = v57;
  *(void *)&self->fOtherFallModel.fRatioMinInertialZ[17] = qword_101992494;
  __int128 v58 = unk_1019924CC;
  *(_OWORD *)&self->fOtherFallModel.fRatioAccelPathLength[6] = xmmword_1019924BC;
  *(_OWORD *)self->fOtherFallModel.fRatioMaxAngleChangePreimpact = v58;
  __int128 v59 = *(_OWORD *)algn_1019924AC;
  *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[19] = xmmword_10199249C;
  *(_OWORD *)&self->fOtherFallModel.fRatioAccelPathLength[2] = v59;
  __int128 v60 = unk_10199250C;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePreimpact[12] = xmmword_1019924FC;
  *(_OWORD *)self->fOtherFallModel.fRatioMaxAngleChangePostimpact = v60;
  __int128 v61 = *(_OWORD *)algn_1019924EC;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePreimpact[4] = xmmword_1019924DC;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePreimpact[8] = v61;
  __int128 v62 = xmmword_10199251C;
  __int128 v63 = unk_10199252C;
  __int128 v64 = xmmword_10199253C;
  __int128 v65 = unk_10199254C;
  *(void *)&self->fOtherFallModel.fLikelihoodRatioInfo[1].float binSize = qword_10199255C;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePostimpact[12] = v64;
  *(_OWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[0].double firstBinEdge = v65;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePostimpact[4] = v62;
  *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePostimpact[8] = v63;
  id v66 = -[NSMutableDictionary objectForKey:](self->fSelectionFeatures, "objectForKey:", @"Age");
  id v67 = -[NSMutableDictionary objectForKey:](self->fSelectionFeatures, "objectForKey:", @"Gender");
  id v68 = -[NSMutableDictionary objectForKey:](self->fSelectionFeatures, "objectForKey:", @"Height");
  id v69 = -[NSMutableDictionary objectForKey:](self->fSelectionFeatures, "objectForKey:", @"Weight");
  id v70 = -[NSMutableDictionary objectForKey:](self->fSelectionFeatures, "objectForKey:", @"Pal");
  id v71 = -[NSMutableDictionary objectForKey:](self->fSelectionFeatures, "objectForKey:", @"Vo2max");
  id v72 = -[NSMutableDictionary objectForKey:](self->fSelectionFeatures, "objectForKey:", @"MetMinPercentile");
  id v185 = -[NSMutableDictionary objectForKey:](self->fSelectionFeatures, "objectForKey:", @"MetMinCount");
  id v73 = -[NSMutableDictionary objectForKey:](self->fSelectionFeatures, "objectForKey:", @"Workout");
  id v74 = -[NSMutableDictionary objectForKey:](self->fSelectionFeatures, "objectForKey:", @"HKWorkout");
  id v186 = -[NSMutableDictionary objectForKey:]( self->fSelectionFeatures,  "objectForKey:",  @"BackgroundAWDLoggingEnabled");
  if (v66) {
    [v66 floatValue];
  }
  else {
    *(float *)&int v75 = NAN;
  }
  float v198 = *(float *)&v75;
  unsigned int v197 = [v67 intValue];
  if (v68) {
    [v68 floatValue];
  }
  else {
    *(float *)&int v76 = NAN;
  }
  float v196 = *(float *)&v76;
  if (v69) {
    [v69 floatValue];
  }
  else {
    *(float *)&int v77 = NAN;
  }
  float v195 = *(float *)&v77;
  if (v70) {
    [v70 floatValue];
  }
  else {
    *(float *)&int v78 = NAN;
  }
  float v194 = *(float *)&v78;
  if (v71) {
    [v71 floatValue];
  }
  else {
    *(float *)&int v79 = NAN;
  }
  float v193 = *(float *)&v79;
  if (v72) {
    [v72 doubleValue];
  }
  else {
    *(double *)&uint64_t v80 = NAN;
  }
  double v192 = *(double *)&v80;
  if (v185) {
    id v81 = [v72 integerValue];
  }
  else {
    id v81 = 0LL;
  }
  unint64_t v191 = (unint64_t)v81;
  if (v73) {
    id v82 = [v73 integerValue];
  }
  else {
    id v82 = 0LL;
  }
  id v190 = v82;
  if (v74) {
    id v83 = [v74 integerValue];
  }
  else {
    id v83 = 0LL;
  }
  id v189 = v83;
  if (v186) {
    unsigned int v84 = [v186 BOOLValue];
  }
  else {
    unsigned int v84 = 0;
  }
  sub_1002C2EAC("BehaviorOverrideAge", &v198);
  sub_1002C302C("BehaviorOverrideGender", (int *)&v197);
  sub_1002C2EAC("BehaviorOverrideHeight", &v196);
  sub_1002C2EAC("BehaviorOverrideWeight", &v195);
  sub_1002C2EAC("BehaviorOverridePal", &v194);
  sub_1002C2EAC("BehaviorOverrideVO2Max", &v193);
  sub_1002F0B04(buf);
  int v85 = sub_1002A82BC(*(uint64_t *)buf, "BehaviorOverrideMetMinPercentile", &v192);
  v86 = *(std::__shared_weak_count **)v200;
  if (*(void *)v200)
  {
    v87 = (unint64_t *)(*(void *)v200 + 8LL);
    do
      unint64_t v88 = __ldaxr(v87);
    while (__stlxr(v88 - 1, v87));
    if (!v88)
    {
      ((void (*)(std::__shared_weak_count *))v86->__on_zero_shared)(v86);
      std::__shared_weak_count::__release_weak(v86);
    }
  }

  if (v85)
  {
    if (qword_1019345D0 != -1) {
      dispatch_once(&qword_1019345D0, &stru_10182F840);
    }
    v89 = (os_log_s *)qword_1019345D8;
    if (os_log_type_enabled((os_log_t)qword_1019345D8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289538;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v200 = 2082;
      *(void *)&v200[2] = "";
      __int16 v201 = 2082;
      double v202 = COERCE_DOUBLE("BehaviorOverrideMetMinPercentile");
      __int16 v203 = 1026;
      *(_DWORD *)v204 = (int)v192;
      _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_INFO,  "{msg%{public}.0s:Overriding behavior feature, key:%{public, location:escape_only}s, value:%{public}d}",  buf,  0x22u);
    }
  }

  sub_1002C31A8("BehaviorOverrideMetMinCount", (uint64_t *)&v191);
  sub_1002C31A8("BehaviorOverrideWorkout", (uint64_t *)&v190);
  sub_1002C31A8("BehaviorOverrideHKWorkout", (uint64_t *)&v189);
  if (qword_1019345D0 != -1) {
    dispatch_once(&qword_1019345D0, &stru_10182F840);
  }
  v90 = (os_log_s *)qword_1019345D8;
  if (os_log_type_enabled((os_log_t)qword_1019345D8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68291587;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v200 = 2082;
    *(void *)&v200[2] = "";
    __int16 v201 = 2049;
    double v202 = v198;
    __int16 v203 = 1025;
    *(_DWORD *)v204 = v197;
    *(_WORD *)&v204[4] = 2049;
    *(double *)&v204[6] = v196;
    *(_WORD *)&v204[14] = 2049;
    *(double *)&v204[16] = v195;
    *(_WORD *)&v204[24] = 2049;
    *(double *)&v204[26] = v194;
    *(_WORD *)&v204[34] = 2049;
    *(double *)&v204[36] = v193;
    *(_WORD *)&v204[44] = 2049;
    *(double *)&v204[46] = v192;
    *(_WORD *)&v204[54] = 2049;
    *(void *)&v204[56] = v191;
    *(_WORD *)v205 = 2049;
    *(void *)&v205[2] = v190;
    *(_WORD *)v206 = 2049;
    *(void *)&v206[2] = v189;
    _os_log_impl( (void *)&_mh_execute_header,  v90,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:Selecting models, age:%{private}f, gender:%{private}d, height:%{private }f, weight:%{private}f, pal:%{private}f, vo2max:%{private}f, metminpercentile:%{pr ivate}f, metminCount:%{private}ld, workout:%{private}ld, hkWorkout:%{private}ld}",  buf,  0x72u);
  }

  v91 = &self->fOtherFallModel.fLikelihoodRatioInfo[2];
  *(void *)&self->fOtherFallModel.fLikelihoodRatioInfo[4].float binSize = 0x41A0000041033333LL;
  self->fOtherFallModel.fLikelihoodRatioInfo[5].double firstBinEdge = 8.0;
  float v92 = v198;
  if ((LODWORD(v198) & 0x7FFFFFFFu) > 0x7F7FFFFF || v198 < 65.0)
  {
    *(_OWORD *)&v91->double firstBinEdge = xmmword_1012E52C0;
    *(void *)&self->fOtherFallModel.fLikelihoodRatioInfo[3].float binSize = 0x420A666640900000LL;
    self->fOtherFallModel.fLikelihoodRatioInfo[4].double firstBinEdge = 4.3;
    *(void *)&self->fOtherFallModel.fLikelihoodRatioInfo[5].float binSize = 0xA00000023LL;
    self->fOtherFallModel.fLikelihoodRatioInfo[6].double firstBinEdge = 0.05;
    self->fOtherFallModel.fLikelihoodRatioInfo[7].double firstBinEdge = 7.0;
    *(void *)&self->fThresholds.float fImpactMaxAccelNormAlertThreshold = 0x1400000014LL;
    LODWORD(self->fThresholds.fImpactMaxAccelNormLoggingHeartRateThreshold) = 30;
    LOWORD(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold) = 257;
    BYTE2(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold) = 1;
    if (qword_1019345D0 != -1) {
      dispatch_once(&qword_1019345D0, &stru_10182F840);
    }
    v96 = (os_log_s *)qword_1019345D8;
    if (os_log_type_enabled((os_log_t)qword_1019345D8, OS_LOG_TYPE_DEBUG))
    {
      double firstBinEdge = self->fOtherFallModel.fLikelihoodRatioInfo[2].firstBinEdge;
      float binSize = self->fOtherFallModel.fLikelihoodRatioInfo[5].binSize;
      int v99 = *(_DWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[5].binNum;
      double v100 = self->fOtherFallModel.fLikelihoodRatioInfo[6].firstBinEdge;
      double v101 = self->fOtherFallModel.fLikelihoodRatioInfo[7].firstBinEdge;
      float fImpactMaxAccelNormAlertThreshold = self->fThresholds.fImpactMaxAccelNormAlertThreshold;
      float fImpactMaxAccelNormLoggingStatsThreshold = self->fThresholds.fImpactMaxAccelNormLoggingStatsThreshold;
      float fImpactMaxAccelNormLoggingHeartRateThreshold = self->fThresholds.fImpactMaxAccelNormLoggingHeartRateThreshold;
      int fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold_low = LOBYTE(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      int v106 = BYTE1(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      int v107 = BYTE2(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      *(_DWORD *)buf = 68292355;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v200 = 2082;
      *(void *)&v200[2] = "";
      __int16 v201 = 2050;
      double v202 = firstBinEdge;
      __int16 v203 = 2049;
      *(double *)v204 = v198;
      *(_WORD *)&v204[8] = 1025;
      *(float *)&v204[10] = binSize;
      *(_WORD *)&v204[14] = 1025;
      *(_DWORD *)&v204[16] = v99;
      *(_WORD *)&v204[20] = 2049;
      *(double *)&v204[22] = v192;
      *(_WORD *)&v204[30] = 2049;
      *(double *)&v204[32] = v100;
      *(_WORD *)&v204[40] = 2049;
      *(double *)&v204[42] = v101;
      *(_WORD *)&v204[50] = 1025;
      *(float *)&v204[52] = fImpactMaxAccelNormAlertThreshold;
      *(_WORD *)&v204[56] = 1025;
      *(float *)&v204[58] = fImpactMaxAccelNormLoggingStatsThreshold;
      *(_WORD *)&v204[62] = 1025;
      *(float *)v205 = fImpactMaxAccelNormLoggingHeartRateThreshold;
      *(_WORD *)&v205[4] = 1025;
      *(_DWORD *)&v205[6] = fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold_low;
      *(_WORD *)v206 = 1025;
      *(_DWORD *)&v206[2] = v106;
      *(_WORD *)&v206[6] = 1025;
      *(_DWORD *)&v206[8] = v107;
      _os_log_impl( (void *)&_mh_execute_header,  v96,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:Model Selector - Picked thresholds based on features, impactMaxAccelNormAlertThreshol d:%{public}f, age:%{private}f, totalLongLieThreshold:%{private}d, consecutiveLongLieThreshol d:%{private}d, metminpercentile:%{private}f, alertGatingMotionThreshold:%{private}f, cycling ImpactMaxAbsYThreshold:%{private}f, otherWorkoutQuiescenceThresholdLow:%{private}d, otherWorkoutQuie scenceThresholdHigh:%{private}d, otherWorkoutConsecutiveLongLieThreshold:%{private}d, otherWorkoutShould CancelAlertOnStepsThreshold:%{private}hhd, otherWorkoutShouldCancelAlertOnStandThreshold:%{private}hhd,  otherWorkoutShouldCancelAlertOnActiveThreshold:%{private}hhd}",  buf,  0x74u);
    }

    if (v84)
    {
      *(_DWORD *)buf = -1;
      uint64_t v108 = sub_1002F8DDC();
      sub_1002A7D20(v108, (uint64_t)@"FallRandomBucket", buf);
      uint32_t v109 = *(_DWORD *)buf;
      if (*(_DWORD *)buf >= 6u)
      {
        uint32_t v109 = arc4random_uniform(6u);
        *(_DWORD *)buf = v109;
        uint64_t v110 = sub_1002F8DDC();
        sub_1002AC288(v110, @"FallRandomBucket", buf);
        uint64_t v111 = sub_1002F8DDC();
        (*(void (**)(uint64_t))(*(void *)v111 + 944LL))(v111);
      }

      LODWORD(v91->firstBinEdge) = dword_10134F09C[v109];
      if (qword_1019345D0 != -1) {
        dispatch_once(&qword_1019345D0, &stru_10182F840);
      }
      v112 = (os_log_s *)qword_1019345D8;
      if (os_log_type_enabled((os_log_t)qword_1019345D8, OS_LOG_TYPE_DEBUG))
      {
        double v113 = v91->firstBinEdge;
        *(_DWORD *)buf = 68289795;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)v200 = 2082;
        *(void *)&v200[2] = "";
        __int16 v201 = 2050;
        double v202 = v113;
        __int16 v203 = 2049;
        *(double *)v204 = v198;
        *(_WORD *)&v204[8] = 2049;
        *(double *)&v204[10] = v192;
        _os_log_impl( (void *)&_mh_execute_header,  v112,  OS_LOG_TYPE_DEBUG,  "{msg%{public}.0s:Model Selector - Revised thresholds based on background analytics requirements, imp actMaxAccelNormAlertThreshold:%{public}f, age:%{private}f, metminpercentile:%{private}f}",  buf,  0x30u);
      }
    }
  }

  else
  {
    *(_OWORD *)&v91->double firstBinEdge = xmmword_1012E52D0;
    *(void *)&self->fOtherFallModel.fLikelihoodRatioInfo[3].float binSize = 0x420A666640900000LL;
    self->fOtherFallModel.fLikelihoodRatioInfo[4].double firstBinEdge = 4.3;
    *(void *)&self->fOtherFallModel.fLikelihoodRatioInfo[5].float binSize = 0xA00000018LL;
    self->fOtherFallModel.fLikelihoodRatioInfo[6].double firstBinEdge = 0.05;
    self->fOtherFallModel.fLikelihoodRatioInfo[7].double firstBinEdge = 10.0;
    uint64_t v93 = 0x600000006LL;
    if ((((_DWORD)v189 - 3) > 0x3E || ((1LL << (v189 - 3)) & 0x402931C2835080BFLL) == 0)
      && (_DWORD)v189 != 1)
    {
      uint64_t v93 = 0x300000002LL;
    }

    *(void *)&self->fThresholds.float fImpactMaxAccelNormAlertThreshold = v93;
    LODWORD(self->fThresholds.fImpactMaxAccelNormLoggingHeartRateThreshold) = 10;
    LOWORD(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold) = 0;
    BYTE2(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold) = 0;
    if ((*(void *)&v192 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
    {
      int v95 = -1;
    }

    else
    {
      float v94 = v192;
      if (v94 >= 2.4)
      {
        if (v94 <= 5.1)
        {
          uint64_t v156 = 0LL;
          int v95 = -1;
          float v157 = NAN;
          do
          {
            float v158 = vabds_f32(v94, dword_10134E7DC[v156]);
            if (v158 < v157 || (LODWORD(v157) & 0x7FFFFFFFu) > 0x7F7FFFFF)
            {
              int v95 = v156;
              float v157 = v158;
            }

            ++v156;
          }

          while (v156 != 28);
        }

        else
        {
          int v95 = 27;
        }
      }

      else
      {
        int v95 = 0;
      }
    }

    if (v92 < 68.0)
    {
      unsigned int v114 = 0;
      goto LABEL_81;
    }

    if (v92 > 86.0)
    {
      unsigned int v114 = 18;
      goto LABEL_81;
    }

    uint64_t v115 = 0LL;
    unsigned int v114 = -1;
    float v116 = NAN;
    do
    {
      float v117 = vabds_f32(v92, dword_10134E790[v115]);
      if (v117 < v116 || (LODWORD(v116) & 0x7FFFFFFFu) > 0x7F7FFFFF)
      {
        unsigned int v114 = v115;
        float v116 = v117;
      }

      ++v115;
    }

    while (v115 != 19);
    if ((v114 & 0x80000000) == 0)
    {
LABEL_81:
      float v120 = *((float *)&unk_10134E84C + v114 + 266);
      if (v95 < 0)
      {
        v91->double firstBinEdge = v120;
        if (qword_1019345D0 != -1) {
          dispatch_once(&qword_1019345D0, &stru_10182F840);
        }
        uint64_t v125 = qword_1019345D8;
        if (!os_log_type_enabled((os_log_t)qword_1019345D8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_96;
        }
        double v127 = self->fOtherFallModel.fLikelihoodRatioInfo[2].firstBinEdge;
        float v128 = self->fOtherFallModel.fLikelihoodRatioInfo[5].binSize;
        int v129 = *(_DWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[5].binNum;
        double v130 = self->fOtherFallModel.fLikelihoodRatioInfo[6].firstBinEdge;
        double v131 = self->fOtherFallModel.fLikelihoodRatioInfo[7].firstBinEdge;
        float v132 = self->fThresholds.fImpactMaxAccelNormAlertThreshold;
        float v133 = self->fThresholds.fImpactMaxAccelNormLoggingStatsThreshold;
        float v134 = self->fThresholds.fImpactMaxAccelNormLoggingHeartRateThreshold;
        int v135 = LOBYTE(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
        int v136 = BYTE1(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
        int v137 = BYTE2(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
        *(_DWORD *)buf = 68292355;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)v200 = 2082;
        *(void *)&v200[2] = "";
        __int16 v201 = 2050;
        double v202 = v127;
        __int16 v203 = 1025;
        *(float *)v204 = v128;
        *(_WORD *)&v204[4] = 1025;
        *(_DWORD *)&v204[6] = v129;
        *(_WORD *)&v204[10] = 2049;
        *(double *)&v204[12] = v198;
        *(_WORD *)&v204[20] = 2049;
        *(double *)&v204[22] = v192;
        *(_WORD *)&v204[30] = 2049;
        *(double *)&v204[32] = v130;
        *(_WORD *)&v204[40] = 2049;
        *(double *)&v204[42] = v131;
        *(_WORD *)&v204[50] = 1025;
        *(float *)&v204[52] = v132;
        *(_WORD *)&v204[56] = 1025;
        *(float *)&v204[58] = v133;
        *(_WORD *)&v204[62] = 1025;
        *(float *)v205 = v134;
        *(_WORD *)&v205[4] = 1025;
        *(_DWORD *)&v205[6] = v135;
        *(_WORD *)v206 = 1025;
        *(_DWORD *)&v206[2] = v136;
        *(_WORD *)&v206[6] = 1025;
        *(_DWORD *)&v206[8] = v137;
        v138 = "{msg%{public}.0s:Model Selector - Picked thresholds based on age only, impactMaxAccelNormAlertT"
               "hreshold:%{public}f, totalLongLieThreshold:%{private}d, consecutiveLongLieThreshold:%{priva"
               "te}d, age:%{private}f, metminpercentile:%{private}f, alertGatingMotionThreshold:%{p"
               "rivate}f, cyclingImpactMaxAbsYThreshold:%{private}f, otherWorkoutQuiescenceThresholdLow:%{p"
               "rivate}d, \"otherWorkoutQuiescenceThresholdHigh\":%{private}d, \"otherWorkoutConsecutiveLongLieThreshold\""
               ":%{private}d, otherWorkoutShouldCancelAlertOnStepsThreshold:%{private}hhd, otherWorkoutShouldCancel"
               "AlertOnStandThreshold:%{private}hhd, otherWorkoutShouldCancelAlertOnActiveThreshold:%{private}hhd}";
        v139 = (os_log_s *)v125;
        uint32_t v140 = 116;
      }

      else
      {
        int v187 = 14;
        int v188 = 7;
        sub_1002C302C("BehaviorOverrideThresholdConvergenceMinimumDayCount", &v188);
        sub_1002C302C("BehaviorOverrideThresholdConvergenceMaximumDayCount", &v187);
        int v121 = 48 * v188;
        int v122 = 48 * v187;
        float v123 = (float)(uint64_t)(v191 - 48LL * v188) / (float)(48 * v187 - 48 * v188);
        if (v123 >= 0.0)
        {
          float v141 = *((float *)&unk_10134E84C + 19 * v95 + v114);
          if (v123 >= 1.0)
          {
            v91->double firstBinEdge = v141;
            double v124 = 1.0;
          }

          else
          {
            v91->double firstBinEdge = (float)(v120 * (float)(1.0 - v123)) + (float)(v123 * v141);
            double v124 = v123;
          }
        }

        else
        {
          v91->double firstBinEdge = v120;
          double v124 = 0.0;
        }

        if (qword_1019345D0 != -1) {
          dispatch_once(&qword_1019345D0, &stru_10182F840);
        }
        uint64_t v142 = qword_1019345D8;
        if (!os_log_type_enabled((os_log_t)qword_1019345D8, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_96;
        }
        double v143 = self->fOtherFallModel.fLikelihoodRatioInfo[2].firstBinEdge;
        float v144 = self->fOtherFallModel.fLikelihoodRatioInfo[5].binSize;
        int v145 = *(_DWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[5].binNum;
        double v146 = self->fOtherFallModel.fLikelihoodRatioInfo[6].firstBinEdge;
        double v147 = self->fOtherFallModel.fLikelihoodRatioInfo[7].firstBinEdge;
        float v148 = self->fThresholds.fImpactMaxAccelNormAlertThreshold;
        float v149 = self->fThresholds.fImpactMaxAccelNormLoggingStatsThreshold;
        float v150 = self->fThresholds.fImpactMaxAccelNormLoggingHeartRateThreshold;
        int v151 = LOBYTE(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
        int v152 = BYTE1(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
        int v153 = BYTE2(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
        *(_DWORD *)buf = 68293379;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)v200 = 2082;
        *(void *)&v200[2] = "";
        __int16 v201 = 2050;
        double v202 = v143;
        __int16 v203 = 1025;
        *(float *)v204 = v144;
        *(_WORD *)&v204[4] = 1025;
        *(_DWORD *)&v204[6] = v145;
        *(_WORD *)&v204[10] = 1026;
        *(_DWORD *)&v204[12] = v121;
        *(_WORD *)&v204[16] = 1026;
        *(_DWORD *)&v204[18] = v122;
        *(_WORD *)&v204[22] = 2050;
        *(void *)&v204[24] = v191;
        *(_WORD *)&v204[32] = 2050;
        *(double *)&v204[34] = v124;
        *(_WORD *)&v204[42] = 2049;
        *(double *)&v204[44] = v198;
        *(_WORD *)&v204[52] = 2049;
        *(double *)&v204[54] = v192;
        *(_WORD *)&v204[62] = 2049;
        *(double *)v205 = v146;
        *(_WORD *)&v205[8] = 2049;
        *(double *)v206 = v147;
        *(_WORD *)&v206[8] = 1025;
        *(float *)&v206[10] = v148;
        __int16 v207 = 1025;
        float v208 = v149;
        __int16 v209 = 1025;
        float v210 = v150;
        __int16 v211 = 1025;
        int v212 = v151;
        __int16 v213 = 1025;
        int v214 = v152;
        __int16 v215 = 1025;
        int v216 = v153;
        v138 = "{msg%{public}.0s:Model Selector - Picked thresholds based on features, impactMaxAccelNormAlertT"
               "hreshold:%{public}f, totalLongLieThreshold:%{private}d, consecutiveLongLieThreshold:%{priva"
               "te}d, \"minMetminCount\":%{public}d, \"maxMetminCount\":%{public}d, \"metminCount\":%{public}ld, \"alpha\""
               ":%{public}f, age:%{private}f, metminpercentile:%{private}f, alertGatingMotionThresh"
               "old:%{private}f, cyclingImpactMaxAbsYThreshold:%{private}f, otherWorkoutQuiescenceThresho"
               "ldLow:%{private}d, otherWorkoutQuiescenceThresholdHigh:%{private}d, otherWorkoutConsecutiveLongLi"
               "eThreshold:%{private}d, otherWorkoutShouldCancelAlertOnStepsThreshold:%{private}hhd, otherWorkout"
               "ShouldCancelAlertOnStandThreshold:%{private}hhd, otherWorkoutShouldCancelAlertOnActiveThreshold:%{private}hhd}";
        v139 = (os_log_s *)v142;
        uint32_t v140 = 148;
      }

      _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, v138, buf, v140);
LABEL_96:
      v126.i32[0] = LODWORD(self->fOtherFallModel.fLikelihoodRatioInfo[2].firstBinEdge);
      float32x2_t v154 = (float32x2_t)vdup_lane_s32(v126, 0);
      *(int8x8_t *)&self->fOtherFallModel.fLikelihoodRatioInfo[2].float binSize = vbsl_s8( (int8x8_t)vcgt_f32( v154,  *(float32x2_t *)&self->fOtherFallModel.fLikelihoodRatioInfo[2].binSize),  *(int8x8_t *)&self->fOtherFallModel.fLikelihoodRatioInfo[2].binSize,  (int8x8_t)v154);
      LODWORD(self->fOtherFallModel.fLikelihoodRatioInfo[3].firstBinEdge) = v126.i32[0];
      return 1;
    }

    if (qword_1019345D0 != -1) {
      dispatch_once(&qword_1019345D0, &stru_10182F840);
    }
    v161 = (os_log_s *)qword_1019345D8;
    if (os_log_type_enabled((os_log_t)qword_1019345D8, OS_LOG_TYPE_FAULT))
    {
      double v162 = self->fOtherFallModel.fLikelihoodRatioInfo[2].firstBinEdge;
      float v163 = self->fOtherFallModel.fLikelihoodRatioInfo[5].binSize;
      int v164 = *(_DWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[5].binNum;
      double v165 = self->fOtherFallModel.fLikelihoodRatioInfo[6].firstBinEdge;
      double v166 = self->fOtherFallModel.fLikelihoodRatioInfo[7].firstBinEdge;
      float v167 = self->fThresholds.fImpactMaxAccelNormAlertThreshold;
      float v168 = self->fThresholds.fImpactMaxAccelNormLoggingStatsThreshold;
      float v169 = self->fThresholds.fImpactMaxAccelNormLoggingHeartRateThreshold;
      int v170 = LOBYTE(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      int v171 = BYTE1(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      int v172 = BYTE2(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      *(_DWORD *)buf = 68292355;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v200 = 2082;
      *(void *)&v200[2] = "";
      __int16 v201 = 2050;
      double v202 = v162;
      __int16 v203 = 1025;
      *(float *)v204 = v163;
      *(_WORD *)&v204[4] = 1025;
      *(_DWORD *)&v204[6] = v164;
      *(_WORD *)&v204[10] = 2049;
      *(double *)&v204[12] = v198;
      *(_WORD *)&v204[20] = 2049;
      *(double *)&v204[22] = v192;
      *(_WORD *)&v204[30] = 2049;
      *(double *)&v204[32] = v165;
      *(_WORD *)&v204[40] = 2049;
      *(double *)&v204[42] = v166;
      *(_WORD *)&v204[50] = 1025;
      *(float *)&v204[52] = v167;
      *(_WORD *)&v204[56] = 1025;
      *(float *)&v204[58] = v168;
      *(_WORD *)&v204[62] = 1025;
      *(float *)v205 = v169;
      *(_WORD *)&v205[4] = 1025;
      *(_DWORD *)&v205[6] = v170;
      *(_WORD *)v206 = 1025;
      *(_DWORD *)&v206[2] = v171;
      *(_WORD *)&v206[6] = 1025;
      *(_DWORD *)&v206[8] = v172;
      _os_log_impl( (void *)&_mh_execute_header,  v161,  OS_LOG_TYPE_FAULT,  "{msg%{public}.0s:Model Selector - Could not pick thresholds based on available features - Falling back to defaults, impactMaxAccelNormAlertThreshold:%{public}f, totalLongLieThreshold:%{private}d, consec utiveLongLieThreshold:%{private}d, age:%{private}f, metminpercentile:%{private}f, alertGatin gMotionThreshold:%{private}f, cyclingImpactMaxAbsYThreshold:%{private}f, otherWorkoutQuiescenceT hresholdLow:%{private}d, otherWorkoutQuiescenceThresholdHigh:%{private}d, otherWorkoutConsecutiveLongLie Threshold:%{private}d, otherWorkoutShouldCancelAlertOnStepsThreshold:%{private}hhd, otherWorkoutShouldCa ncelAlertOnStandThreshold:%{private}hhd, otherWorkoutShouldCancelAlertOnActiveThreshold:%{private}hhd}",  buf,  0x74u);
      if (qword_1019345D0 != -1) {
        dispatch_once(&qword_1019345D0, &stru_10182F840);
      }
    }

    v173 = (os_log_s *)qword_1019345D8;
    if (os_signpost_enabled((os_log_t)qword_1019345D8))
    {
      double v174 = self->fOtherFallModel.fLikelihoodRatioInfo[2].firstBinEdge;
      float v175 = self->fOtherFallModel.fLikelihoodRatioInfo[5].binSize;
      int v176 = *(_DWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[5].binNum;
      double v177 = self->fOtherFallModel.fLikelihoodRatioInfo[6].firstBinEdge;
      double v178 = self->fOtherFallModel.fLikelihoodRatioInfo[7].firstBinEdge;
      float v179 = self->fThresholds.fImpactMaxAccelNormAlertThreshold;
      float v180 = self->fThresholds.fImpactMaxAccelNormLoggingStatsThreshold;
      float v181 = self->fThresholds.fImpactMaxAccelNormLoggingHeartRateThreshold;
      int v182 = LOBYTE(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      int v183 = BYTE1(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      int v184 = BYTE2(self->fThresholds.fImpactMaxAccelNormLoggingHighResolutionSensorDataThreshold);
      *(_DWORD *)buf = 68292355;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v200 = 2082;
      *(void *)&v200[2] = "";
      __int16 v201 = 2050;
      double v202 = v174;
      __int16 v203 = 1025;
      *(float *)v204 = v175;
      *(_WORD *)&v204[4] = 1025;
      *(_DWORD *)&v204[6] = v176;
      *(_WORD *)&v204[10] = 2049;
      *(double *)&v204[12] = v198;
      *(_WORD *)&v204[20] = 2049;
      *(double *)&v204[22] = v192;
      *(_WORD *)&v204[30] = 2049;
      *(double *)&v204[32] = v177;
      *(_WORD *)&v204[40] = 2049;
      *(double *)&v204[42] = v178;
      *(_WORD *)&v204[50] = 1025;
      *(float *)&v204[52] = v179;
      *(_WORD *)&v204[56] = 1025;
      *(float *)&v204[58] = v180;
      *(_WORD *)&v204[62] = 1025;
      *(float *)v205 = v181;
      *(_WORD *)&v205[4] = 1025;
      *(_DWORD *)&v205[6] = v182;
      *(_WORD *)v206 = 1025;
      *(_DWORD *)&v206[2] = v183;
      *(_WORD *)&v206[6] = 1025;
      *(_DWORD *)&v206[8] = v184;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v173,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "Model Selector - Could not pick thresholds based on available features - Falling back to defaults",  "{msg%{public}.0s:Model Selector - Could not pick thresholds based on available features - Falling back to defaults, impactMaxAccelNormAlertThreshold:%{public}f, totalLongLieThreshold:%{private}d, consec utiveLongLieThreshold:%{private}d, age:%{private}f, metminpercentile:%{private}f, alertGatin gMotionThreshold:%{private}f, cyclingImpactMaxAbsYThreshold:%{private}f, otherWorkoutQuiescenceT hresholdLow:%{private}d, otherWorkoutQuiescenceThresholdHigh:%{private}d, otherWorkoutConsecutiveLongLie Threshold:%{private}d, otherWorkoutShouldCancelAlertOnStepsThreshold:%{private}hhd, otherWorkoutShouldCa ncelAlertOnStandThreshold:%{private}hhd, otherWorkoutShouldCancelAlertOnActiveThreshold:%{private}hhd}",  buf,  0x74u);
    }
  }

  return 1;
}

- (BOOL)fillTripFallModel:(FallModel *)a3
{
  if (a3)
  {
    *(_OWORD *)a3->fRatioMaxAbsX = *(_OWORD *)self->fTripFallModel.fRatioMaxAbsX;
    __int128 v5 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsX[4];
    __int128 v6 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsX[8];
    __int128 v7 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsX[12];
    a3->fRatioMaxAbsX[16] = self->fTripFallModel.fRatioMaxAbsX[16];
    *(_OWORD *)&a3->fRatioMaxAbsX[8] = v6;
    *(_OWORD *)&a3->fRatioMaxAbsX[12] = v7;
    *(_OWORD *)&a3->fRatioMaxAbsX[4] = v5;
    __int128 v8 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsY[8];
    __int128 v9 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsY[12];
    float v10 = self->fTripFallModel.fRatioMaxAbsY[16];
    *(_OWORD *)&a3->fRatioMaxAbsY[4] = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsY[4];
    a3->fRatioMaxAbsY[16] = v10;
    *(_OWORD *)&a3->fRatioMaxAbsY[12] = v9;
    *(_OWORD *)&a3->fRatioMaxAbsY[8] = v8;
    *(_OWORD *)a3->fRatioMaxAbsY = *(_OWORD *)self->fTripFallModel.fRatioMaxAbsY;
    __int128 v11 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsZ[8];
    __int128 v12 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsZ[12];
    float v13 = self->fTripFallModel.fRatioMaxAbsZ[16];
    *(_OWORD *)&a3->fRatioMaxAbsZ[4] = *(_OWORD *)&self->fTripFallModel.fRatioMaxAbsZ[4];
    a3->fRatioMaxAbsZ[16] = v13;
    *(_OWORD *)&a3->fRatioMaxAbsZ[12] = v12;
    *(_OWORD *)&a3->fRatioMaxAbsZ[8] = v11;
    *(_OWORD *)a3->fRatioMaxAbsZ = *(_OWORD *)self->fTripFallModel.fRatioMaxAbsZ;
    memcpy(a3->fRatioMaxJerkVM, self->fTripFallModel.fRatioMaxJerkVM, sizeof(a3->fRatioMaxJerkVM));
    __int128 v14 = *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[4];
    *(_OWORD *)a3->fRatioMinInertialZ = *(_OWORD *)self->fTripFallModel.fRatioMinInertialZ;
    *(_OWORD *)&a3->fRatioMinInertialZ[4] = v14;
    __int128 v16 = *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[12];
    __int128 v15 = *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[16];
    __int128 v17 = *(_OWORD *)&self->fTripFallModel.fRatioMinInertialZ[8];
    a3->fRatioMinInertialZ[20] = self->fTripFallModel.fRatioMinInertialZ[20];
    *(_OWORD *)&a3->fRatioMinInertialZ[12] = v16;
    *(_OWORD *)&a3->fRatioMinInertialZ[16] = v15;
    *(_OWORD *)&a3->fRatioMinInertialZ[8] = v17;
    __int128 v18 = *(_OWORD *)self->fTripFallModel.fRatioAccelPathLength;
    __int128 v19 = *(_OWORD *)&self->fTripFallModel.fRatioAccelPathLength[4];
    *(void *)&a3->fRatioAccelPathLength[8] = *(void *)&self->fTripFallModel.fRatioAccelPathLength[8];
    *(_OWORD *)a3->fRatioAccelPathLength = v18;
    *(_OWORD *)&a3->fRatioAccelPathLength[4] = v19;
    __int128 v20 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePreimpact[4];
    __int128 v21 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePreimpact[8];
    __int128 v22 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePreimpact[12];
    *(_OWORD *)a3->fRatioMaxAngleChangePreimpact = *(_OWORD *)self->fTripFallModel.fRatioMaxAngleChangePreimpact;
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[4] = v20;
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[8] = v21;
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[12] = v22;
    __int128 v24 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePostimpact[8];
    __int128 v23 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePostimpact[12];
    __int128 v25 = *(_OWORD *)&self->fTripFallModel.fRatioMaxAngleChangePostimpact[4];
    *(_OWORD *)a3->fRatioMaxAngleChangePostimpact = *(_OWORD *)self->fTripFallModel.fRatioMaxAngleChangePostimpact;
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[4] = v25;
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[8] = v24;
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[12] = v23;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[0].double firstBinEdge = *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[0].firstBinEdge;
    __int128 v27 = *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[2].binNum;
    __int128 v26 = *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[4].firstBinEdge;
    __int128 v28 = *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[1].binSize;
    *(void *)&a3->fLikelihoodRatioInfo[5].float binSize = *(void *)&self->fTripFallModel.fLikelihoodRatioInfo[5].binSize;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[2].binNum = v27;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[4].double firstBinEdge = v26;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[1].float binSize = v28;
  }

  return a3 != 0LL;
}

- (BOOL)fillSlipFallModel:(FallModel *)a3
{
  if (a3)
  {
    *(_OWORD *)a3->fRatioMaxAbsX = *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[6].firstBinEdge;
    __int128 v5 = *(_OWORD *)&self->fTripFallModel.fLikelihoodRatioInfo[7].binSize;
    __int128 v6 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[2];
    __int128 v7 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[6];
    a3->fRatioMaxAbsX[16] = self->fSlipFallModel.fRatioMaxAbsX[10];
    *(_OWORD *)&a3->fRatioMaxAbsX[8] = v6;
    *(_OWORD *)&a3->fRatioMaxAbsX[12] = v7;
    *(_OWORD *)&a3->fRatioMaxAbsX[4] = v5;
    __int128 v9 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[2];
    __int128 v8 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[6];
    float v10 = self->fSlipFallModel.fRatioMaxAbsY[10];
    *(_OWORD *)&a3->fRatioMaxAbsY[4] = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[15];
    a3->fRatioMaxAbsY[16] = v10;
    *(_OWORD *)&a3->fRatioMaxAbsY[12] = v8;
    *(_OWORD *)&a3->fRatioMaxAbsY[8] = v9;
    *(_OWORD *)a3->fRatioMaxAbsY = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsX[11];
    __int128 v12 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsZ[2];
    __int128 v11 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsZ[6];
    float v13 = self->fSlipFallModel.fRatioMaxAbsZ[10];
    *(_OWORD *)&a3->fRatioMaxAbsZ[4] = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[15];
    a3->fRatioMaxAbsZ[16] = v13;
    *(_OWORD *)&a3->fRatioMaxAbsZ[12] = v11;
    *(_OWORD *)&a3->fRatioMaxAbsZ[8] = v12;
    *(_OWORD *)a3->fRatioMaxAbsZ = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAbsY[11];
    memcpy(a3->fRatioMaxJerkVM, &self->fSlipFallModel.fRatioMaxAbsZ[11], sizeof(a3->fRatioMaxJerkVM));
    __int128 v14 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxJerkVM[65];
    *(_OWORD *)a3->fRatioMinInertialZ = *(_OWORD *)&self->fSlipFallModel.fRatioMaxJerkVM[61];
    *(_OWORD *)&a3->fRatioMinInertialZ[4] = v14;
    __int128 v16 = *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[6];
    __int128 v15 = *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[10];
    __int128 v17 = *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[2];
    a3->fRatioMinInertialZ[20] = self->fSlipFallModel.fRatioMinInertialZ[14];
    *(_OWORD *)&a3->fRatioMinInertialZ[12] = v16;
    *(_OWORD *)&a3->fRatioMinInertialZ[16] = v15;
    *(_OWORD *)&a3->fRatioMinInertialZ[8] = v17;
    __int128 v18 = *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[15];
    __int128 v19 = *(_OWORD *)&self->fSlipFallModel.fRatioMinInertialZ[19];
    *(void *)&a3->fRatioAccelPathLength[8] = *(void *)&self->fSlipFallModel.fRatioAccelPathLength[2];
    *(_OWORD *)a3->fRatioAccelPathLength = v18;
    *(_OWORD *)&a3->fRatioAccelPathLength[4] = v19;
    __int128 v20 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[2];
    __int128 v21 = *(_OWORD *)&self->fSlipFallModel.fRatioAccelPathLength[8];
    __int128 v22 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[6];
    *(_OWORD *)a3->fRatioMaxAngleChangePreimpact = *(_OWORD *)&self->fSlipFallModel.fRatioAccelPathLength[4];
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[4] = v21;
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[8] = v20;
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[12] = v22;
    __int128 v23 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[6];
    __int128 v24 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[2];
    __int128 v25 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[14];
    *(_OWORD *)a3->fRatioMaxAngleChangePostimpact = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePreimpact[10];
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[4] = v25;
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[8] = v24;
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[12] = v23;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[0].double firstBinEdge = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[10];
    __int128 v26 = *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[0].binNum;
    __int128 v27 = *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[2].firstBinEdge;
    __int128 v28 = *(_OWORD *)&self->fSlipFallModel.fRatioMaxAngleChangePostimpact[14];
    *(void *)&a3->fLikelihoodRatioInfo[5].float binSize = *(void *)&self->fSlipFallModel.fLikelihoodRatioInfo[3].binSize;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[2].binNum = v26;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[4].double firstBinEdge = v27;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[1].float binSize = v28;
  }

  return a3 != 0LL;
}

- (BOOL)fillOtherFallModel:(FallModel *)a3
{
  if (a3)
  {
    *(_OWORD *)a3->fRatioMaxAbsX = *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[4].firstBinEdge;
    __int128 v5 = *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[5].binSize;
    __int128 v6 = *(_OWORD *)&self->fSlipFallModel.fLikelihoodRatioInfo[6].binNum;
    __int128 v7 = *(_OWORD *)self->fOtherFallModel.fRatioMaxAbsX;
    a3->fRatioMaxAbsX[16] = self->fOtherFallModel.fRatioMaxAbsX[4];
    *(_OWORD *)&a3->fRatioMaxAbsX[8] = v6;
    *(_OWORD *)&a3->fRatioMaxAbsX[12] = v7;
    *(_OWORD *)&a3->fRatioMaxAbsX[4] = v5;
    __int128 v9 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsX[13];
    __int128 v8 = *(_OWORD *)self->fOtherFallModel.fRatioMaxAbsY;
    float v10 = self->fOtherFallModel.fRatioMaxAbsY[4];
    *(_OWORD *)&a3->fRatioMaxAbsY[4] = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsX[9];
    a3->fRatioMaxAbsY[16] = v10;
    *(_OWORD *)&a3->fRatioMaxAbsY[12] = v8;
    *(_OWORD *)&a3->fRatioMaxAbsY[8] = v9;
    *(_OWORD *)a3->fRatioMaxAbsY = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsX[5];
    __int128 v11 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsY[13];
    __int128 v12 = *(_OWORD *)self->fOtherFallModel.fRatioMaxAbsZ;
    float v13 = self->fOtherFallModel.fRatioMaxAbsZ[4];
    *(_OWORD *)&a3->fRatioMaxAbsZ[4] = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsY[9];
    a3->fRatioMaxAbsZ[16] = v13;
    *(_OWORD *)&a3->fRatioMaxAbsZ[12] = v12;
    *(_OWORD *)&a3->fRatioMaxAbsZ[8] = v11;
    *(_OWORD *)a3->fRatioMaxAbsZ = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAbsY[5];
    memcpy(a3->fRatioMaxJerkVM, &self->fOtherFallModel.fRatioMaxAbsZ[5], sizeof(a3->fRatioMaxJerkVM));
    __int128 v14 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxJerkVM[59];
    *(_OWORD *)a3->fRatioMinInertialZ = *(_OWORD *)&self->fOtherFallModel.fRatioMaxJerkVM[55];
    *(_OWORD *)&a3->fRatioMinInertialZ[4] = v14;
    __int128 v15 = *(_OWORD *)self->fOtherFallModel.fRatioMinInertialZ;
    __int128 v16 = *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[4];
    __int128 v17 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxJerkVM[63];
    a3->fRatioMinInertialZ[20] = self->fOtherFallModel.fRatioMinInertialZ[8];
    *(_OWORD *)&a3->fRatioMinInertialZ[12] = v15;
    *(_OWORD *)&a3->fRatioMinInertialZ[16] = v16;
    *(_OWORD *)&a3->fRatioMinInertialZ[8] = v17;
    __int128 v18 = *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[9];
    __int128 v19 = *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[13];
    *(void *)&a3->fRatioAccelPathLength[8] = *(void *)&self->fOtherFallModel.fRatioMinInertialZ[17];
    *(_OWORD *)a3->fRatioAccelPathLength = v18;
    *(_OWORD *)&a3->fRatioAccelPathLength[4] = v19;
    __int128 v20 = *(_OWORD *)&self->fOtherFallModel.fRatioAccelPathLength[2];
    __int128 v21 = *(_OWORD *)&self->fOtherFallModel.fRatioAccelPathLength[6];
    __int128 v22 = *(_OWORD *)self->fOtherFallModel.fRatioMaxAngleChangePreimpact;
    *(_OWORD *)a3->fRatioMaxAngleChangePreimpact = *(_OWORD *)&self->fOtherFallModel.fRatioMinInertialZ[19];
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[4] = v20;
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[8] = v21;
    *(_OWORD *)&a3->fRatioMaxAngleChangePreimpact[12] = v22;
    __int128 v24 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePreimpact[12];
    __int128 v23 = *(_OWORD *)self->fOtherFallModel.fRatioMaxAngleChangePostimpact;
    __int128 v25 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePreimpact[8];
    *(_OWORD *)a3->fRatioMaxAngleChangePostimpact = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePreimpact[4];
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[4] = v25;
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[8] = v24;
    *(_OWORD *)&a3->fRatioMaxAngleChangePostimpact[12] = v23;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[0].double firstBinEdge = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePostimpact[4];
    __int128 v27 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePostimpact[12];
    __int128 v26 = *(_OWORD *)&self->fOtherFallModel.fLikelihoodRatioInfo[0].firstBinEdge;
    __int128 v28 = *(_OWORD *)&self->fOtherFallModel.fRatioMaxAngleChangePostimpact[8];
    *(void *)&a3->fLikelihoodRatioInfo[5].float binSize = *(void *)&self->fOtherFallModel.fLikelihoodRatioInfo[1].binSize;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[2].binNum = v27;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[4].double firstBinEdge = v26;
    *(_OWORD *)&a3->fLikelihoodRatioInfo[1].float binSize = v28;
  }

  return a3 != 0LL;
}

- (BOOL)fillFallThresholds:(FallThresholds *)a3
{
  if (a3) {
    sub_1002C3734((uint64_t)a3, (uint64_t)&self->fOtherFallModel.fLikelihoodRatioInfo[2]);
  }
  return a3 != 0LL;
}

- (id).cxx_construct
{
  return self;
}

@end