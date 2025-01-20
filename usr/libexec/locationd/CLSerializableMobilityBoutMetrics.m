@interface CLSerializableMobilityBoutMetrics
+ (BOOL)supportsSecureCoding;
- (CLSerializableMobilityBoutMetrics)initWithBoutMetrics:(const BoutMetrics *)a3;
- (CLSerializableMobilityBoutMetrics)initWithCoder:(id)a3;
- (id).cxx_construct;
- (void)encodeWithCoder:(id)a3;
- (void)getBoutMetrics:(BoutMetrics *)a3;
@end

@implementation CLSerializableMobilityBoutMetrics

- (CLSerializableMobilityBoutMetrics)initWithBoutMetrics:(const BoutMetrics *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CLSerializableMobilityBoutMetrics;
  result = -[CLSerializableMobilityBoutMetrics init](&v15, "init");
  if (result)
  {
    __int128 v5 = *(_OWORD *)&a3->recordId;
    *(_OWORD *)&result->_metrics.endTime = *(_OWORD *)&a3->endTime;
    *(_OWORD *)&result->_metrics.recordId = v5;
    __int128 v6 = *(_OWORD *)&a3->terminationReason;
    __int128 v7 = *(_OWORD *)&a3->deviceSide;
    __int128 v8 = *(_OWORD *)&a3->stepLengthEntropy;
    *(_OWORD *)&result->_metrics.stepLengthPoincareSD2 = *(_OWORD *)&a3->stepLengthPoincareSD2;
    *(_OWORD *)&result->_metrics.stepLengthEntropy = v8;
    *(_OWORD *)&result->_metrics.deviceSide = v7;
    *(_OWORD *)&result->_metrics.terminationReason = v6;
    __int128 v9 = *(_OWORD *)&a3->cycleTimePoincareSD1;
    __int128 v10 = *(_OWORD *)&a3->walkingSpeed;
    __int128 v11 = *(_OWORD *)&a3->stepLength;
    *(_OWORD *)&result->_metrics.stepIndexOfHarmonicityAP = *(_OWORD *)&a3->stepIndexOfHarmonicityAP;
    *(_OWORD *)&result->_metrics.stepLength = v11;
    *(_OWORD *)&result->_metrics.walkingSpeed = v10;
    *(_OWORD *)&result->_metrics.cycleTimePoincareSD1 = v9;
    __int128 v12 = *(_OWORD *)&a3->swingIndexOfHarmonicityML;
    __int128 v13 = *(_OWORD *)&a3->segmentsRejectedByIsFeasibleWalkingSpeed;
    __int128 v14 = *(_OWORD *)&a3->walkingSpeedRejectionStatus;
    *(_OWORD *)((char *)&result->_metrics.asymmetryPercentageRejectionStatus + 1) = *(_OWORD *)((char *)&a3->asymmetryPercentageRejectionStatus
                                                                                              + 1);
    *(_OWORD *)&result->_metrics.walkingSpeedRejectionStatus = v14;
    *(_OWORD *)&result->_metrics.segmentsRejectedByIsFeasibleWalkingSpeed = v13;
    *(_OWORD *)&result->_metrics.swingIndexOfHarmonicityML = v12;
  }

  return result;
}

- (void)getBoutMetrics:(BoutMetrics *)a3
{
  __int128 v3 = *(_OWORD *)&self->_metrics.endTime;
  *(_OWORD *)&a3->recordId = *(_OWORD *)&self->_metrics.recordId;
  *(_OWORD *)&a3->endTime = v3;
  __int128 v4 = *(_OWORD *)&self->_metrics.terminationReason;
  __int128 v5 = *(_OWORD *)&self->_metrics.deviceSide;
  __int128 v6 = *(_OWORD *)&self->_metrics.stepLengthPoincareSD2;
  *(_OWORD *)&a3->stepLengthEntropy = *(_OWORD *)&self->_metrics.stepLengthEntropy;
  *(_OWORD *)&a3->stepLengthPoincareSD2 = v6;
  *(_OWORD *)&a3->terminationReason = v4;
  *(_OWORD *)&a3->deviceSide = v5;
  __int128 v7 = *(_OWORD *)&self->_metrics.cycleTimePoincareSD1;
  __int128 v8 = *(_OWORD *)&self->_metrics.walkingSpeed;
  __int128 v9 = *(_OWORD *)&self->_metrics.stepIndexOfHarmonicityAP;
  *(_OWORD *)&a3->stepLength = *(_OWORD *)&self->_metrics.stepLength;
  *(_OWORD *)&a3->stepIndexOfHarmonicityAP = v9;
  *(_OWORD *)&a3->cycleTimePoincareSD1 = v7;
  *(_OWORD *)&a3->walkingSpeed = v8;
  __int128 v10 = *(_OWORD *)&self->_metrics.swingIndexOfHarmonicityML;
  __int128 v11 = *(_OWORD *)&self->_metrics.segmentsRejectedByIsFeasibleWalkingSpeed;
  __int128 v12 = *(_OWORD *)&self->_metrics.walkingSpeedRejectionStatus;
  *(_OWORD *)((char *)&a3->asymmetryPercentageRejectionStatus + 1) = *(_OWORD *)((char *)&self->_metrics.asymmetryPercentageRejectionStatus
                                                                               + 1);
  *(_OWORD *)&a3->segmentsRejectedByIsFeasibleWalkingSpeed = v11;
  *(_OWORD *)&a3->walkingSpeedRejectionStatus = v12;
  *(_OWORD *)&a3->swingIndexOfHarmonicityML = v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  *(float *)&double v5 = self->_metrics.stepIndexOfHarmonicityAP;
  [a3 encodeFloat:@"stepIndexOfHarmonicityAP" forKey:v5];
  *(float *)&double v6 = self->_metrics.stepIndexOfHarmonicityML;
  [a3 encodeFloat:@"stepIndexOfHarmonicityML" forKey:v6];
  *(float *)&double v7 = self->_metrics.stepIndexOfHarmonicityVT;
  [a3 encodeFloat:@"stepIndexOfHarmonicityVT" forKey:v7];
  *(float *)&double v8 = self->_metrics.swingIndexOfHarmonicityAP;
  [a3 encodeFloat:@"swingIndexOfHarmonicityAP" forKey:v8];
  *(float *)&double v9 = self->_metrics.swingIndexOfHarmonicityML;
  [a3 encodeFloat:@"swingIndexOfHarmonicityML" forKey:v9];
  *(float *)&double v10 = self->_metrics.swingIndexOfHarmonicityVT;
  [a3 encodeFloat:@"swingIndexOfHarmonicityVT" forKey:v10];
  [a3 encodeInt:self->_metrics.segmentsRejectedByIsSwingStanceCycle forKey:@"segmentsRejectedByIsSwingStanceCycle"];
  [a3 encodeInt:self->_metrics.segmentsRejectedByIsNotRunning forKey:@"segmentsRejectedByIsNotRunning"];
  [a3 encodeInt:self->_metrics.segmentsRejectedByIsFeasibleWalkingSpeed forKey:@"segmentsRejectedByIsFeasibleWalkingSpeed"];
  [a3 encodeInt:self->_metrics.segmentsRejectedByIsPendular forKey:@"segmentsRejectedByIsPendular"];
  [a3 encodeInt:self->_metrics.segmentsRejectedByIsSufficientVerticalTwist forKey:@"segmentsRejectedByIsSufficientVerticalTwist"];
  [a3 encodeInt:self->_metrics.segmentsRejectedByIsCadenceConcordant forKey:@"segmentsRejectedByIsCadenceConcordant"];
  [a3 encodeInt:self->_metrics.walkingSpeedRejectionStatus forKey:@"walkingSpeedRejectionStatus"];
  [a3 encodeInt:self->_metrics.doubleSupportPercentageRejectionStatus forKey:@"doubleSupportPercentageRejectionStatus"];
  [a3 encodeInt:self->_metrics.stepLengthRejectionStatus forKey:@"stepLengthRejectionStatus"];
  [a3 encodeInt:self->_metrics.asymmetryPercentageRejectionStatus forKey:@"asymmetryPercentageRejectionStatus"];
}

- (CLSerializableMobilityBoutMetrics)initWithCoder:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___CLSerializableMobilityBoutMetrics;
  __int128 v4 = -[CLSerializableMobilityBoutMetrics init](&v26, "init");
  if (v4)
  {
    v4->_metrics.recordId = [a3 decodeIntForKey:@"recordId"];
    [a3 decodeDoubleForKey:@"startTime"];
    v4->_metrics.startTime = v5;
    [a3 decodeDoubleForKey:@"endTime"];
    v4->_metrics.endTime = v6;
    v4->_metrics.stepCount = [a3 decodeIntForKey:@"stepCount"];
    v4->_metrics.workoutType = [a3 decodeIntForKey:@"workoutType"];
    v4->_metrics.terminationReason = [a3 decodeIntForKey:@"terminationReason"];
    v4->_metrics.numGaitMetrics = [a3 decodeIntForKey:@"numGaitMetrics"];
    [a3 decodeDoubleForKey:@"invalidGradePercentage"];
    v4->_metrics.invalidGradePercentage = v7;
    v4->_metrics.deviceSide = [a3 decodeIntForKey:@"deviceSide"];
    v4->_metrics.boundaryType = [a3 decodeIntForKey:@"boundaryType"];
    [a3 decodeDoubleForKey:@"cycleTimeMean"];
    v4->_metrics.cycleTimeMean = v8;
    [a3 decodeDoubleForKey:@"stepLengthEntropy"];
    v4->_metrics.stepLengthEntropy = v9;
    [a3 decodeDoubleForKey:@"stepLengthPoincareSD1"];
    v4->_metrics.stepLengthPoincareSD1 = v10;
    [a3 decodeDoubleForKey:@"stepLengthPoincareSD2"];
    v4->_metrics.stepLengthPoincareSD2 = v11;
    [a3 decodeDoubleForKey:@"cycleTimeEntropy"];
    v4->_metrics.cycleTimeEntropy = v12;
    [a3 decodeDoubleForKey:@"cycleTimePoincareSD1"];
    v4->_metrics.cycleTimePoincareSD1 = v13;
    [a3 decodeDoubleForKey:@"cycleTimePoincareSD2"];
    v4->_metrics.cycleTimePoincareSD2 = v14;
    [a3 decodeDoubleForKey:@"walkingSpeed"];
    v4->_metrics.walkingSpeed = v15;
    [a3 decodeDoubleForKey:@"doubleSupportPercentage"];
    v4->_metrics.doubleSupportPercentage = v16;
    [a3 decodeDoubleForKey:@"stepLength"];
    v4->_metrics.stepLength = v17;
    [a3 decodeDoubleForKey:@"asymmetryPercentage"];
    v4->_metrics.asymmetryPercentage = v18;
    [a3 decodeFloatForKey:@"stepIndexOfHarmonicityAP"];
    v4->_metrics.stepIndexOfHarmonicityAP = v19;
    [a3 decodeFloatForKey:@"stepIndexOfHarmonicityML"];
    v4->_metrics.stepIndexOfHarmonicityML = v20;
    [a3 decodeFloatForKey:@"stepIndexOfHarmonicityVT"];
    v4->_metrics.stepIndexOfHarmonicityVT = v21;
    [a3 decodeFloatForKey:@"swingIndexOfHarmonicityAP"];
    v4->_metrics.swingIndexOfHarmonicityAP = v22;
    [a3 decodeFloatForKey:@"swingIndexOfHarmonicityML"];
    v4->_metrics.swingIndexOfHarmonicityML = v23;
    [a3 decodeFloatForKey:@"swingIndexOfHarmonicityVT"];
    v4->_metrics.swingIndexOfHarmonicityVT = v24;
    v4->_metrics.segmentsRejectedByIsSwingStanceCycle = [a3 decodeIntForKey:@"segmentsRejectedByIsSwingStanceCycle"];
    v4->_metrics.segmentsRejectedByIsNotRunning = [a3 decodeIntForKey:@"segmentsRejectedByIsNotRunning"];
    v4->_metrics.segmentsRejectedByIsFeasibleWalkingSpeed = [a3 decodeIntForKey:@"segmentsRejectedByIsFeasibleWalkingSpeed"];
    v4->_metrics.segmentsRejectedByIsPendular = [a3 decodeIntForKey:@"segmentsRejectedByIsPendular"];
    v4->_metrics.segmentsRejectedByIsSufficientVerticalTwist = [a3 decodeIntForKey:@"segmentsRejectedByIsSufficientVerticalTwist"];
    v4->_metrics.segmentsRejectedByIsCadenceConcordant = [a3 decodeIntForKey:@"segmentsRejectedByIsCadenceConcordant"];
    v4->_metrics.walkingSpeedRejectionStatus = [a3 decodeIntForKey:@"walkingSpeedRejectionStatus"];
    v4->_metrics.doubleSupportPercentageRejectionStatus = [a3 decodeIntForKey:@"doubleSupportPercentageRejectionStatus"];
    v4->_metrics.stepLengthRejectionStatus = [a3 decodeIntForKey:@"stepLengthRejectionStatus"];
    v4->_metrics.asymmetryPercentageRejectionStatus = [a3 decodeIntForKey:@"asymmetryPercentageRejectionStatus"];
  }

  return v4;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((_DWORD *)self + 15) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  int64x2_t v2 = vdupq_n_s64(0xFFF0000000000000LL);
  *(_OWORD *)((char *)self + 41) = 0u;
  *((_OWORD *)self + 4) = xmmword_101338660;
  *((int64x2_t *)self + 5) = v2;
  *((int64x2_t *)self + 6) = v2;
  *((void *)self + 14) = 0xFFF0000000000000LL;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *((_DWORD *)self + 54) = 1071225242;
  *((_BYTE *)self + 220) = 0;
  *((_DWORD *)self + 56) = 1116213084;
  *((_BYTE *)self + 228) = 0;
  return self;
}

@end