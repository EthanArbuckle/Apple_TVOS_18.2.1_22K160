@interface CSAsset
+ (BOOL)supportsMultiPhraseVoiceTriggerForEngineVersion:(id)a3 engineMinorVersion:(id)a4 accessoryRTModelType:(id)a5;
+ (unint64_t)getSSVDeviceType;
+ (unsigned)SSVDefaultDistanceChannelCount;
+ (unsigned)SSVDefaultLKFSChannelCount;
+ (unsigned)SSVDefaultNoiseChannelCount;
- (BOOL)_allowMultiPhrase:(id)a3 forceSkipEngineVersionCheck:(BOOL)a4;
- (BOOL)containsMultiUserThresholds;
- (BOOL)containsSpeakerRecognitionCategory;
- (BOOL)satImplicitTrainingEnabled;
- (BOOL)useSpeakerRecognitionAsset;
- (BOOL)useTDTIEnrollment;
- (NSDictionary)SSVParameterDirectionary;
- (NSString)keywordDetectorConfigPathRecognizer;
- (NSString)keywordDetectorNDAPIConfigFilePath;
- (NSString)keywordDetectorQuasarConfigFilePath;
- (NSString)voiceProfilePruningCookie;
- (double)SSVCADistanceModelConfidenceThreshold;
- (float)SSVCADBToTTSMaximumOutput;
- (float)SSVCADBToTTSMinimumOutput;
- (float)SSVCADBToTTSPostTransitionDC;
- (float)SSVCADBToTTSPostTransitionMultiplier;
- (float)SSVCADBToTTSPostTransitionOffset;
- (float)SSVCADBToTTSPreTransitionMultiplier;
- (float)SSVCADBToTTSPreTransitionOffset;
- (float)SSVCADBToTTSTransitionPoint;
- (float)SSVCADecibelToLinearLogBase;
- (float)SSVCADefaultMusicStrength;
- (float)SSVCADefaultOutputTTSVolume;
- (float)SSVCADefaultSpeechStrength;
- (float)SSVCADefaultZeroFloatingPointValue;
- (float)SSVCADeviceDefaultASVOffMinTTSVolume;
- (float)SSVCADeviceDefaultMaxTTSVolume;
- (float)SSVCADeviceDefaultMicSensitivityOffset;
- (float)SSVCADeviceDefaultMinTTSVolume;
- (float)SSVCADeviceSimpleASVOffMinTTSVolume;
- (float)SSVCADeviceSimpleDBToSystemVolSlope;
- (float)SSVCADeviceSimpleMaxTTSVolume;
- (float)SSVCADeviceSimpleMaxTargetDB;
- (float)SSVCADeviceSimpleMicSensitivityOffset;
- (float)SSVCADeviceSimpleMinTTSVolume;
- (float)SSVCADeviceSimpleMinTargetDB;
- (float)SSVCADeviceSimpleOutputMaxTargetDB;
- (float)SSVCADeviceSimpleOutputMinTargetDB;
- (float)SSVCADeviceSimpleOutputSlope;
- (float)SSVCADropInCallAnnouncementMinTTSVolume;
- (float)SSVCAExponentialDistanceHistoryDegradationFactor;
- (float)SSVCALinearToDecibelConstantMultiplier;
- (float)SSVCAListenPollingIntervalAtStartInSeconds;
- (float)SSVCAMaxTTSSystemVolume;
- (float)SSVCAMaximumCompensatedSpeechLevelNearField;
- (float)SSVCAMaximumLinearSoundLevel;
- (float)SSVCAMinTTSSystemVolume;
- (float)SSVCAMinimumDistanceUpdateWaitPeriodSeconds;
- (float)SSVCAMinimumLinearSoundLevel;
- (float)SSVCAMusicHistoricalSamplesInSeconds;
- (float)SSVCANoiseActivityThreshold;
- (float)SSVCASignalToSigmoidMusicDilationFactorDeviceDefault;
- (float)SSVCASignalToSigmoidMusicDilationFactorDeviceSimple;
- (float)SSVCASignalToSigmoidMusicHOffsetDeviceDefault;
- (float)SSVCASignalToSigmoidMusicHOffsetDeviceSimple;
- (float)SSVCASignalToSigmoidMusicSteepnessDeviceDefault;
- (float)SSVCASignalToSigmoidMusicSteepnessDeviceSimple;
- (float)SSVCASignalToSigmoidMusicVOffsetDeviceDefault;
- (float)SSVCASignalToSigmoidMusicVOffsetDeviceSimple;
- (float)SSVCASignalToSigmoidMusicVSpreadDeviceDefault;
- (float)SSVCASignalToSigmoidMusicVSpreadDeviceSimple;
- (float)SSVCASignalToSigmoidNoiseDilationFactor;
- (float)SSVCASignalToSigmoidNoiseHOffset;
- (float)SSVCASignalToSigmoidNoiseSteepness;
- (float)SSVCASignalToSigmoidNoiseVOffset;
- (float)SSVCASignalToSigmoidNoiseVSpread;
- (float)SSVCASignalToSigmoidSpeechDilationFactor;
- (float)SSVCASignalToSigmoidSpeechHOffset;
- (float)SSVCASignalToSigmoidSpeechSteepness;
- (float)SSVCASignalToSigmoidSpeechVOffset;
- (float)SSVCASignalToSigmoidSpeechVSpread;
- (float)SSVCASpeakerDistanceFarBoostFactor;
- (float)SSVCASpeakerDistanceMidBoostFactor;
- (float)SSVCASpeakerDistanceNearBoostFactor;
- (float)SSVCAUserIntentPermanentOffsetFactorDelta;
- (float)SSVCAUserIntentPermanentOffsetFactorLowerBound;
- (float)SSVCAUserIntentPermanentOffsetFactorUpperBound;
- (float)SSVCAUserIntentVolumeDecreaseFactor;
- (float)SSVCAUserIntentVolumeIncreaseFactor;
- (float)SSVCAVoiceTriggerBasedTTSValidForSeconds;
- (float)SSVCAVoiceTriggerInitialSilenceDurationSeconds;
- (float)SSVCAVolumeHalfLifeSeconds;
- (float)SSVLKFSMicSensitivityOffset;
- (float)SSVLKFSTTSMappingInputRangeHigh;
- (float)SSVLKFSTTSMappingInputRangeLow;
- (float)SSVLKFSTTSMappingOutputRangeHigh;
- (float)SSVLKFSTTSMappingOutputRangeLow;
- (float)SSVLKFSTimeConstant;
- (float)SSVNoiseMicSensitivityOffset;
- (float)SSVNoiseMicSensitivityOffsetDeviceSimple;
- (float)SSVNoiseTTSMappingInputRangeHigh;
- (float)SSVNoiseTTSMappingInputRangeLow;
- (float)SSVNoiseTTSMappingOutputRangeHigh;
- (float)SSVNoiseTTSMappingOutputRangeLow;
- (float)SSVNoiseTimeConstant;
- (float)SSVNoiseWeight;
- (float)SSVTTSVolumeLowerLimitDB;
- (float)SSVTTSVolumeUpperLimitDB;
- (float)SSVUserOffsetInputRangeHigh;
- (float)SSVUserOffsetInputRangeLow;
- (float)SSVUserOffsetOutputRangeHigh;
- (float)SSVUserOffsetOutputRangeLow;
- (float)keywordDetectorThreshold;
- (float)keywordDetectorWaitTimeSinceVT;
- (float)pruningExplicitUttThresholdPSR;
- (float)pruningExplicitUttThresholdSAT;
- (float)pruningThresholdPSR;
- (float)pruningThresholdSAT;
- (float)psrCombinationWeight;
- (float)satImplicitProfileDeltaThreshold;
- (float)satImplicitProfileThreshold;
- (float)satScoreThreshold;
- (float)satScoreThresholdForPhId:(unint64_t)a3;
- (float)satVTImplicitThreshold;
- (id)RTModelWithFallbackLanguage:(id)a3;
- (id)_adaptiveSiriVolumeDictionary;
- (id)_buildRTModelWithBlobConfig:(id)a3 requestOptions:(id)a4;
- (id)_getFilteredAccessoryRTBlobListForRequestOptions:(id)a3 accessoryBlobs:(id)a4 forceSkipEngineVersionCheck:(BOOL)a5;
- (id)_getNumberFromASVDictionaryForKey:(id)a3 category:(id)a4 default:(id)a5;
- (id)_rtModelWithRequestOptions:(id)a3 accessoryBlobs:(id)a4;
- (id)_sha1:(id)a3;
- (id)_sha256:(id)a3;
- (id)_splitBlobsByPhraseType:(id)a3;
- (id)_userSelectedPhraseTypeToRTModelPhraseType:(id)a3;
- (id)createRTModelWithLocale:(id)a3;
- (id)getPhraseConfig:(unint64_t)a3;
- (id)hearstRTModelLocaleMap;
- (id)hearstRTModelWithRequestOptions:(id)a3;
- (id)jarvisRTModelLocaleMap;
- (id)latestHearstRTModelWithRequestOptions:(id)a3;
- (id)localeMapWithName:(id)a3;
- (id)remoraRTModelLocaleMap;
- (id)rtModelLocaleMapWithModelType:(int64_t)a3;
- (id)rtModelWithRequestOptions:(id)a3;
- (int)SSVCADistanceInputBufferDurationSeconds;
- (int)SSVCANoiseActivityCountThreshold;
- (int)SSVCASmartSiriVolumeSyncedMetricLogsToRetain;
- (int)SSVCASmartSiriVolumeUnsyncedMetricLogsToRetain;
- (int64_t)multiUserConfidentScoreThreshold;
- (int64_t)multiUserConfidentScoreThresholdForPhId:(unint64_t)a3;
- (int64_t)multiUserDeltaScoreThreshold;
- (int64_t)multiUserDeltaScoreThresholdForPhId:(unint64_t)a3;
- (int64_t)multiUserHighScoreThreshold;
- (int64_t)multiUserHighScoreThresholdForPhId:(unint64_t)a3;
- (int64_t)multiUserLowScoreThreshold;
- (int64_t)multiUserLowScoreThresholdForPhId:(unint64_t)a3;
- (unint64_t)SSVCADeviceSimplePreTriggerSilenceSampleCount;
- (unint64_t)SSVCADistanceResultSampleCountTolerance;
- (unint64_t)SSVCADistanceResultsBufferSize;
- (unint64_t)SSVCADspCoefsCount;
- (unint64_t)SSVCADspNumStages;
- (unint64_t)SSVCAHistoricalVolumeBufferSize;
- (unint64_t)SSVCAMusicResultsBufferSize;
- (unint64_t)SSVCANoiseActivityHistoricalSampleCount;
- (unint64_t)SSVCANoiseResultsBufferSize;
- (unint64_t)SSVCAUserIntentValidForSeconds;
- (unint64_t)SSVDistanceChannelBitset;
- (unint64_t)SSVLKFSChannelBitset;
- (unint64_t)SSVNoiseLevelChannelBitset;
- (unint64_t)maxAllowedEnrollmentUtterances;
- (unint64_t)pruningNumRetentionUtterance;
- (unsigned)SSVCAAnnouncementStatusFetchTimeoutMs;
- (unsigned)SSVCAMaxFrameSize;
- (unsigned)SSVEnergyBufferSize;
- (unsigned)SSVLKFSLowerPercentile;
- (unsigned)SSVLKFSUpperPercentile;
- (unsigned)SSVNoiseLowerPercentile;
- (unsigned)SSVNoiseUpperPercentile;
@end

@implementation CSAsset

- (id)_adaptiveSiriVolumeDictionary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"siriVolume.json"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSAsset decodeJson:](&OBJC_CLASS___CSAsset, "decodeJson:", v3));

  return v4;
}

- (unsigned)SSVEnergyBufferSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"energyBufferSize",  @"smartSiriVolume",  &off_100238448));
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (unsigned)SSVNoiseLowerPercentile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"noiseLowerPercentile",  @"smartSiriVolume",  &off_100238460));
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (unsigned)SSVNoiseUpperPercentile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"noiseUpperPercentile",  @"smartSiriVolume",  &off_100238478));
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (unsigned)SSVLKFSLowerPercentile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"LKFSLowerPercentile",  @"smartSiriVolume",  &off_100238460));
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (unsigned)SSVLKFSUpperPercentile
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"LKFSUpperPercentile",  @"smartSiriVolume",  &off_100238478));
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (float)SSVNoiseTimeConstant
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"noiseTimeConstant",  @"smartSiriVolume",  &off_100239480));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVNoiseMicSensitivityOffset
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"noiseMicSensitivityOffset",  @"smartSiriVolume",  &off_100239490));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVNoiseMicSensitivityOffsetDeviceSimple
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"noiseMicSensitivityOffsetDeviceSimple",  @"smartSiriVolume",  &off_1002394A0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVLKFSTimeConstant
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"LKFSTimeConstant",  @"smartSiriVolume",  &off_1002394B0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVLKFSMicSensitivityOffset
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"LKFSMicSensitivityOffset",  @"smartSiriVolume",  &off_1002394C0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVNoiseTTSMappingInputRangeLow
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"noiseTTSMappingInputRangeLow",  @"smartSiriVolume",  &off_1002394D0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVNoiseTTSMappingInputRangeHigh
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"noiseTTSMappingInputRangeHigh",  @"smartSiriVolume",  &off_1002394E0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVNoiseTTSMappingOutputRangeLow
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"noiseTTSMappingOutputRangeLow",  @"smartSiriVolume",  &off_1002394F0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVNoiseTTSMappingOutputRangeHigh
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"noiseTTSMappingOutputRangeHigh",  @"smartSiriVolume",  &off_100239500));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVLKFSTTSMappingInputRangeLow
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"LKFSTTSMappingInputRangeLow",  @"smartSiriVolume",  &off_100239510));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVLKFSTTSMappingInputRangeHigh
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"LKFSTTSMappingInputRangeHigh",  @"smartSiriVolume",  &off_100239520));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVLKFSTTSMappingOutputRangeLow
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"LKFSTTSMappingOutputRangeLow",  @"smartSiriVolume",  &off_100239530));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVLKFSTTSMappingOutputRangeHigh
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"LKFSTTSMappingOutputRangeHigh",  @"smartSiriVolume",  &off_100239540));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVUserOffsetInputRangeLow
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"userOffsetInputRangeLow",  @"smartSiriVolume",  &off_100239550));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVUserOffsetInputRangeHigh
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"userOffsetInputRangeHigh",  @"smartSiriVolume",  &off_1002394C0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVUserOffsetOutputRangeLow
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"userOffsetOutputRangeLow",  @"smartSiriVolume",  &off_100239560));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVUserOffsetOutputRangeHigh
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"userOffsetOutputRangeHigh",  @"smartSiriVolume",  &off_100239570));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVTTSVolumeLowerLimitDB
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"TTSVolumeLowerLimitDB",  @"smartSiriVolume",  &off_100239580));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVTTSVolumeUpperLimitDB
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"TTSVolumeUpperLimitDB",  @"smartSiriVolume",  &off_100239570));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVNoiseWeight
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"noiseWeight",  @"smartSiriVolume",  &off_100239590));
  [v2 floatValue];
  float v4 = v3;

  float result = fminf(v4, 1.0);
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (unint64_t)SSVNoiseLevelChannelBitset
{
  float v3 = &off_1002384C0;
  if (CSIsHorseman(self, a2))
  {
    id v4 = +[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType");
    v5 = &off_1002384A8;
    if (v4 != (id)3) {
      v5 = &off_1002384C0;
    }
    if (v4 == (id)2) {
      float v3 = &off_100238490;
    }
    else {
      float v3 = v5;
    }
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"noiseLevelChannelBitset",  @"smartSiriVolume",  v3));
  id v7 = [v6 unsignedLongLongValue];

  return (unint64_t)v7;
}

- (unint64_t)SSVLKFSChannelBitset
{
  float v3 = &off_1002384D8;
  if (CSIsHorseman(self, a2)
    && +[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType") == (id)3)
  {
    float v3 = &off_1002384F0;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"LKFSChannelBitset",  @"smartSiriVolume",  v3));
  id v5 = [v4 unsignedLongLongValue];

  return (unint64_t)v5;
}

- (unint64_t)SSVDistanceChannelBitset
{
  float v3 = &off_1002384C0;
  if (CSIsHorseman(self, a2))
  {
    id v4 = +[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType");
    id v5 = &off_1002384A8;
    if (v4 != (id)3) {
      id v5 = &off_1002384C0;
    }
    if (v4 == (id)2) {
      float v3 = &off_100238508;
    }
    else {
      float v3 = v5;
    }
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"DistanceChannelBitset",  @"smartSiriVolume",  v3));
  id v7 = [v6 unsignedLongLongValue];

  return (unint64_t)v7;
}

- (unsigned)SSVCAMaxFrameSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAMaxFrameSize",  @"smartSiriVolume",  &off_100238520));
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (float)SSVCAVoiceTriggerBasedTTSValidForSeconds
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAVoiceTriggerBasedTTSValidForSeconds",  @"smartSiriVolume",  &off_1002395A0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (int)SSVCASmartSiriVolumeUnsyncedMetricLogsToRetain
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCASmartSiriVolumeUnsyncedMetricLogsToRetain",  @"smartSiriVolume",  &off_100238538));
  int v3 = [v2 intValue];

  return v3;
}

- (int)SSVCASmartSiriVolumeSyncedMetricLogsToRetain
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCASmartSiriVolumeSyncedMetricLogsToRetain",  @"smartSiriVolume",  &off_100238538));
  int v3 = [v2 intValue];

  return v3;
}

- (float)SSVCAVoiceTriggerInitialSilenceDurationSeconds
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAVoiceTriggerInitialSilenceDurationSeconds",  @"smartSiriVolume",  &off_100239590));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (int)SSVCADistanceInputBufferDurationSeconds
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADistanceInputBufferDurationSeconds",  @"smartSiriVolume",  &off_100238550));
  int v3 = [v2 intValue];

  return v3;
}

- (float)SSVCAListenPollingIntervalAtStartInSeconds
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAListenPollingIntervalAtStartInSeconds",  @"smartSiriVolume",  &off_1002395B0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADefaultZeroFloatingPointValue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADefaultZeroFloatingPointValue",  @"smartSiriVolume",  &off_1002394C0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (unsigned)SSVCAAnnouncementStatusFetchTimeoutMs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAAnnouncementStatusFetchTimeoutMs",  @"smartSiriVolume",  &off_100238568));
  unsigned int v3 = [v2 unsignedIntValue];

  return v3;
}

- (float)SSVCADefaultOutputTTSVolume
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADefaultOutputTTSVolume",  @"smartSiriVolume",  &off_1002395C0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (int)SSVCANoiseActivityCountThreshold
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCANoiseActivityCountThreshold",  @"smartSiriVolume",  &off_100238580));
  int v3 = [v2 intValue];

  return v3;
}

- (float)SSVCASpeakerDistanceFarBoostFactor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCASpeakerDistanceFarBoostFactor",  @"smartSiriVolume",  &off_1002395D0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASpeakerDistanceMidBoostFactor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCASpeakerDistanceMidBoostFactor",  @"smartSiriVolume",  &off_1002395E0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASpeakerDistanceNearBoostFactor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCASpeakerDistanceNearBoostFactor",  @"smartSiriVolume",  &off_1002395F0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (double)SSVCADistanceModelConfidenceThreshold
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADistanceModelConfidenceThreshold",  @"smartSiriVolume",  &off_1002382A0));
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (float)SSVCAMinimumLinearSoundLevel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAMinimumLinearSoundLevel",  @"smartSiriVolume",  &off_100239600));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCAMaximumLinearSoundLevel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAMaximumLinearSoundLevel",  @"smartSiriVolume",  &off_100239610));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCALinearToDecibelConstantMultiplier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCALinearToDecibelConstantMultiplier",  @"smartSiriVolume",  &off_100239620));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADecibelToLinearLogBase
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADecibelToLinearLogBase",  @"smartSiriVolume",  &off_100239630));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidNoiseDilationFactor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCASignalToSigmoidNoiseDilationFactor",  @"smartSiriVolume",  &off_100239640));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidMusicDilationFactorDeviceDefault
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCASignalToSigmoidMusicDilationFactorDeviceDefault",  @"smartSiriVolume",  &off_100239650));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidMusicDilationFactorDeviceSimple
{
  id v3 = +[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType");
  if (v3 == (id)2)
  {
    v6 = @"SSVCASignalToSigmoidMusicDilationFactorDeviceSimple";
    id v7 = &off_100239660;
LABEL_8:
    v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  v6,  @"smartSiriVolume",  v7));
    [v8 floatValue];
    float v10 = v9;

    return v10;
  }

  if (v3 != (id)1)
  {
    v6 = @"SSVCASignalToSigmoidMusicDilationFactorDeviceSimple2";
    id v7 = &off_100239650;
    goto LABEL_8;
  }

  float v4 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
  {
    int v11 = 136315138;
    v12 = "-[CSAsset(SmartSiriVolume) SSVCASignalToSigmoidMusicDilationFactorDeviceSimple]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s Dilation factor requested for device default!",  (uint8_t *)&v11,  0xCu);
  }

  return 4.2;
}

- (float)SSVCASignalToSigmoidSpeechDilationFactor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCASignalToSigmoidSpeechDilationFactor",  @"smartSiriVolume",  &off_100239540));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidNoiseVSpread
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCASignalToSigmoidNoiseVSpread",  @"smartSiriVolume",  &off_100239670));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidMusicVSpreadDeviceDefault
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCASignalToSigmoidMusicVSpreadDeviceDefault",  @"smartSiriVolume",  &off_100239620));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidMusicVSpreadDeviceSimple
{
  id v3 = +[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType");
  if (v3 == (id)2)
  {
    v6 = @"SSVCASignalToSigmoidMusicVSpreadDeviceSimple";
LABEL_8:
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  v6,  @"smartSiriVolume",  &off_100239620));
    [v7 floatValue];
    float v9 = v8;

    return v9;
  }

  if (v3 != (id)1)
  {
    v6 = @"SSVCASignalToSigmoidMusicVSpreadDeviceSimple2";
    goto LABEL_8;
  }

  float v4 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
  {
    int v10 = 136315138;
    int v11 = "-[CSAsset(SmartSiriVolume) SSVCASignalToSigmoidMusicVSpreadDeviceSimple]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s V Spread requested for device default!",  (uint8_t *)&v10,  0xCu);
  }

  return 20.0;
}

- (float)SSVCASignalToSigmoidSpeechVSpread
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCASignalToSigmoidSpeechVSpread",  @"smartSiriVolume",  &off_100239680));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidNoiseVOffset
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCASignalToSigmoidNoiseVOffset",  @"smartSiriVolume",  &off_100239690));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidMusicVOffsetDeviceDefault
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCASignalToSigmoidMusicVOffsetDeviceDefault",  @"smartSiriVolume",  &off_1002394F0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidMusicVOffsetDeviceSimple
{
  id v3 = +[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType");
  if (v3 == (id)2)
  {
    v6 = @"SSVCASignalToSigmoidMusicVOffsetDeviceSimple";
LABEL_8:
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  v6,  @"smartSiriVolume",  &off_1002394F0));
    [v7 floatValue];
    float v9 = v8;

    return v9;
  }

  if (v3 != (id)1)
  {
    v6 = @"SSVCASignalToSigmoidMusicVOffsetDeviceSimple2";
    goto LABEL_8;
  }

  float v4 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
  {
    int v10 = 136315138;
    int v11 = "-[CSAsset(SmartSiriVolume) SSVCASignalToSigmoidMusicVOffsetDeviceSimple]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s V Offset requested for device default!",  (uint8_t *)&v10,  0xCu);
  }

  return -30.0;
}

- (float)SSVCASignalToSigmoidSpeechVOffset
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCASignalToSigmoidSpeechVOffset",  @"smartSiriVolume",  &off_100239690));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidNoiseHOffset
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCASignalToSigmoidNoiseHOffset",  @"smartSiriVolume",  &off_1002396A0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidMusicHOffsetDeviceDefault
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCASignalToSigmoidMusicHOffsetDeviceDefault",  @"smartSiriVolume",  &off_1002396B0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidMusicHOffsetDeviceSimple
{
  id v3 = +[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType");
  if (v3 == (id)2)
  {
    v6 = @"SSVCASignalToSigmoidMusicHOffsetDeviceSimple";
    id v7 = &off_1002396C0;
LABEL_8:
    float v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  v6,  @"smartSiriVolume",  v7));
    [v8 floatValue];
    float v10 = v9;

    return v10;
  }

  if (v3 != (id)1)
  {
    v6 = @"SSVCASignalToSigmoidMusicHOffsetDeviceSimple2";
    id v7 = &off_1002396B0;
    goto LABEL_8;
  }

  float v4 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
  {
    int v11 = 136315138;
    v12 = "-[CSAsset(SmartSiriVolume) SSVCASignalToSigmoidMusicHOffsetDeviceSimple]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s H Offset requested for device default!",  (uint8_t *)&v11,  0xCu);
  }

  return -28.0;
}

- (float)SSVCASignalToSigmoidSpeechHOffset
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCASignalToSigmoidSpeechHOffset",  @"smartSiriVolume",  &off_1002396D0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidMusicSteepnessDeviceDefault
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCASignalToSigmoidMusicSteepnessDeviceDefault",  @"smartSiriVolume",  &off_1002396E0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidMusicSteepnessDeviceSimple
{
  id v3 = +[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType");
  if (v3 == (id)2)
  {
    v6 = @"SSVCASignalToSigmoidMusicSteepnessDeviceSimple";
LABEL_8:
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  v6,  @"smartSiriVolume",  &off_1002396E0));
    [v7 floatValue];
    float v9 = v8;

    return v9;
  }

  if (v3 != (id)1)
  {
    v6 = @"SSVCASignalToSigmoidMusicSteepnessDeviceSimple2";
    goto LABEL_8;
  }

  float v4 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
  {
    int v10 = 136315138;
    int v11 = "-[CSAsset(SmartSiriVolume) SSVCASignalToSigmoidMusicSteepnessDeviceSimple]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s Music steepness requested for device default!",  (uint8_t *)&v10,  0xCu);
  }

  return 0.1;
}

- (float)SSVCASignalToSigmoidNoiseSteepness
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCASignalToSigmoidNoiseSteepness",  @"smartSiriVolume",  &off_1002396F0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCASignalToSigmoidSpeechSteepness
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCASignalToSigmoidSpeechSteepness",  @"smartSiriVolume",  &off_100239700));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADBToTTSMinimumOutput
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADBToTTSMinimumOutput",  @"smartSiriVolume",  &off_100239710));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADBToTTSMaximumOutput
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADBToTTSMaximumOutput",  @"smartSiriVolume",  &off_100239720));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADBToTTSTransitionPoint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADBToTTSTransitionPoint",  @"smartSiriVolume",  &off_1002394F0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADBToTTSPreTransitionOffset
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADBToTTSPreTransitionOffset",  @"smartSiriVolume",  &off_100239730));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADBToTTSPreTransitionMultiplier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADBToTTSPreTransitionMultiplier",  @"smartSiriVolume",  &off_100239740));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADBToTTSPostTransitionOffset
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADBToTTSPostTransitionOffset",  @"smartSiriVolume",  &off_100239750));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADBToTTSPostTransitionDC
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADBToTTSPostTransitionDC",  @"smartSiriVolume",  &off_1002395C0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADBToTTSPostTransitionMultiplier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADBToTTSPostTransitionMultiplier",  @"smartSiriVolume",  &off_100239760));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCAMinimumDistanceUpdateWaitPeriodSeconds
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAMinimumDistanceUpdateWaitPeriodSeconds",  @"smartSiriVolume",  &off_1002395B0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCANoiseActivityThreshold
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCANoiseActivityThreshold",  @"smartSiriVolume",  &off_100239770));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (unint64_t)SSVCANoiseResultsBufferSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCANoiseResultsBufferSize",  @"smartSiriVolume",  &off_100238598));
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (unint64_t)SSVCAMusicResultsBufferSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAMusicResultsBufferSize",  @"smartSiriVolume",  &off_100238598));
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (float)SSVCADefaultSpeechStrength
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADefaultSpeechStrength",  @"smartSiriVolume",  &off_100239780));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADefaultMusicStrength
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADefaultMusicStrength",  @"smartSiriVolume",  &off_1002394C0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (unint64_t)SSVCANoiseActivityHistoricalSampleCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCANoiseActivityHistoricalSampleCount",  @"smartSiriVolume",  &off_1002385B0));
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (unint64_t)SSVCADspCoefsCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADspCoefsCount",  @"smartSiriVolume",  &off_1002385C8));
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (unint64_t)SSVCADspNumStages
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADspNumStages",  @"smartSiriVolume",  &off_1002385E0));
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (unint64_t)SSVCADistanceResultsBufferSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADistanceResultsBufferSize",  @"smartSiriVolume",  &off_1002385F8));
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (float)SSVCAExponentialDistanceHistoryDegradationFactor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAExponentialDistanceHistoryDegradationFactor",  @"smartSiriVolume",  &off_100239790));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (unint64_t)SSVCADistanceResultSampleCountTolerance
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADistanceResultSampleCountTolerance",  @"smartSiriVolume",  &off_100238610));
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (float)SSVCAMusicHistoricalSamplesInSeconds
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAMusicHistoricalSamplesInSeconds",  @"smartSiriVolume",  &off_1002395A0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADeviceSimpleOutputMinTargetDB
{
  if (+[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType") == (id)2)
  {
    float v3 = @"SSVCADeviceSimpleOutputMinTargetDB";
    float v4 = &off_1002397A0;
  }

  else
  {
    float v3 = @"SSVCADeviceSimple2OutputMinTargetDB";
    float v4 = &off_1002397B0;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  v3,  @"smartSiriVolume",  v4));
  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (float)SSVCADeviceSimpleOutputMaxTargetDB
{
  if (+[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType") == (id)2) {
    float v3 = @"SSVCADeviceSimpleOutputMaxTargetDB";
  }
  else {
    float v3 = @"SSVCADeviceSimple2OutputMaxTargetDB";
  }
  float v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  v3,  @"smartSiriVolume",  &off_1002394C0));
  [v4 floatValue];
  float v6 = v5;

  return v6;
}

- (float)SSVCADeviceSimpleOutputSlope
{
  if (+[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType") == (id)2)
  {
    float v3 = @"SSVCADeviceSimpleOutputSlope";
    float v4 = &off_1002397C0;
  }

  else
  {
    float v3 = @"SSVCADeviceSimple2OutputSlope";
    float v4 = &off_1002397D0;
  }

  float v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  v3,  @"smartSiriVolume",  v4));
  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (float)SSVCADeviceSimpleMinTargetDB
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADeviceSimpleMinTargetDB",  @"smartSiriVolume",  &off_100239550));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADeviceSimpleMaxTargetDB
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADeviceSimpleMaxTargetDB",  @"smartSiriVolume",  &off_1002394C0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADeviceSimpleDBToSystemVolSlope
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADeviceSimpleDBToSystemVolSlope",  @"smartSiriVolume",  &off_1002397E0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADeviceSimpleMicSensitivityOffset
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADeviceSimpleMicSensitivityOffset",  @"smartSiriVolume",  &off_100239480));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (unint64_t)SSVCADeviceSimplePreTriggerSilenceSampleCount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADeviceSimplePreTriggerSilenceSampleCount",  @"smartSiriVolume",  &off_100238628));
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (float)SSVCAMinTTSSystemVolume
{
  if (+[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType") == (id)2)
  {
    unint64_t v3 = @"SSVCAMinTTSSystemVolume";
    float v4 = &off_1002394C0;
  }

  else
  {
    unint64_t v3 = @"SSVCAMinTTSSystemVolumeSimple2";
    float v4 = &off_100239700;
  }

  float v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  v3,  @"smartSiriVolume",  v4));
  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (float)SSVCAMaxTTSSystemVolume
{
  if (+[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType") == (id)2)
  {
    unint64_t v3 = @"SSVCAMaxTTSSystemVolume";
    float v4 = &off_1002395B0;
  }

  else
  {
    unint64_t v3 = @"SSVCAMaxTTSSystemVolumeSimple2";
    float v4 = &off_1002397F0;
  }

  float v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  v3,  @"smartSiriVolume",  v4));
  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (unint64_t)SSVCAUserIntentValidForSeconds
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAUserIntentValidForSeconds",  @"smartSiriVolume",  &off_100238640));
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (float)SSVCAUserIntentVolumeIncreaseFactor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAUserIntentVolumeIncreaseFactor",  @"smartSiriVolume",  &off_100239800));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCAUserIntentVolumeDecreaseFactor
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAUserIntentVolumeDecreaseFactor",  @"smartSiriVolume",  &off_100239810));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCAUserIntentPermanentOffsetFactorDelta
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAUserIntentPermanentOffsetFactorDelta",  @"smartSiriVolume",  &off_100239820));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCAUserIntentPermanentOffsetFactorLowerBound
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAUserIntentPermanentOffsetFactorLowerBound",  @"smartSiriVolume",  &off_100239830));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCAUserIntentPermanentOffsetFactorUpperBound
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAUserIntentPermanentOffsetFactorUpperBound",  @"smartSiriVolume",  &off_1002395F0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADeviceSimpleMinTTSVolume
{
  if (+[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType") == (id)2)
  {
    float v3 = @"SSVCADeviceSimpleMinTTSVolume";
    float v4 = &off_100239840;
  }

  else
  {
    float v3 = @"SSVCAMinTTSSystemVolumeSimple2";
    float v4 = &off_100239700;
  }

  float v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  v3,  @"smartSiriVolume",  v4));
  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (float)SSVCADeviceSimpleMaxTTSVolume
{
  if (+[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType") == (id)2)
  {
    float v3 = @"SSVCADeviceSimpleMaxTTSVolume";
    float v4 = &off_100239850;
  }

  else
  {
    float v3 = @"SSVCAMaxTTSSystemVolumeSimple2";
    float v4 = &off_1002397F0;
  }

  float v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  v3,  @"smartSiriVolume",  v4));
  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (float)SSVCADeviceDefaultMinTTSVolume
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAMinTTSSystemVolumeSimple2",  @"smartSiriVolume",  &off_100239700));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADeviceDefaultMaxTTSVolume
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAMaxTTSSystemVolumeSimple2",  @"smartSiriVolume",  &off_1002397F0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADeviceDefaultASVOffMinTTSVolume
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADeviceDefaultASVOffMinTTSVolume",  @"smartSiriVolume",  &off_100239860));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADeviceSimpleASVOffMinTTSVolume
{
  id v3 = +[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType");
  if (v3 == (id)2)
  {
    float v6 = @"SSVCADeviceSimpleASVOffMinTTSVolume";
    float v7 = &off_100239870;
LABEL_8:
    float v8 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  v6,  @"smartSiriVolume",  v7));
    [v8 floatValue];
    float v10 = v9;

    return v10;
  }

  if (v3 != (id)1)
  {
    float v6 = @"SSVCADeviceSimple2ASVOffMinTTSVolume";
    float v7 = &off_100239880;
    goto LABEL_8;
  }

  float v4 = (os_log_s *)CSLogCategoryASV;
  if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_ERROR))
  {
    int v11 = 136315138;
    v12 = "-[CSAsset(SmartSiriVolume) SSVCADeviceSimpleASVOffMinTTSVolume]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s Minimum TTS volume for ASV disabled case requested for device default!",  (uint8_t *)&v11,  0xCu);
  }

  return 0.15;
}

- (float)SSVCADeviceDefaultMicSensitivityOffset
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCADeviceDefaultMicSensitivityOffset",  @"smartSiriVolume",  &off_1002394C0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCAVolumeHalfLifeSeconds
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAVolumeHalfLifeSeconds",  @"smartSiriVolume",  &off_100239890));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (unint64_t)SSVCAHistoricalVolumeBufferSize
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAHistoricalVolumeBufferSize",  @"smartSiriVolume",  &off_100238658));
  unint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (float)SSVCAMaximumCompensatedSpeechLevelNearField
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  @"SSVCAMaximumCompensatedSpeechLevelNearField",  @"smartSiriVolume",  &off_1002398A0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)SSVCADropInCallAnnouncementMinTTSVolume
{
  id v3 = +[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType");
  if (v3 == (id)2)
  {
    float v4 = @"SSVCADeviceSimpleDropInCallAnnouncementMinTTSVolume";
    float v5 = &off_1002398B0;
  }

  else
  {
    if (v3 == (id)1) {
      float v4 = @"SSVCADeviceDefaultDropInCallAnnouncementMinTTSVolume";
    }
    else {
      float v4 = @"SSVCADeviceSimple2DropInCallAnnouncementMinTTSVolume";
    }
    float v5 = &off_100239840;
  }

  float v6 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getNumberFromASVDictionaryForKey:category:default:]( self,  "_getNumberFromASVDictionaryForKey:category:default:",  v4,  @"smartSiriVolume",  v5));
  [v6 floatValue];
  float v8 = v7;

  return v8;
}

- (id)_getNumberFromASVDictionaryForKey:(id)a3 category:(id)a4 default:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset _adaptiveSiriVolumeDictionary](self, "_adaptiveSiriVolumeDictionary"));
  v12 = v11;
  if (v11
    && (uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v9])) != 0
    && (v14 = (void *)v13,
        v15 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v9]),
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v8]),
        v16,
        v15,
        v14,
        v16))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v9]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v8]);
  }

  else
  {
    v19 = (os_log_s *)CSLogCategoryASV;
    v18 = v10;
    if (os_log_type_enabled(CSLogCategoryASV, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315906;
      v22 = "-[CSAsset(SmartSiriVolume) _getNumberFromASVDictionaryForKey:category:default:]";
      __int16 v23 = 2114;
      id v24 = v9;
      __int16 v25 = 2114;
      id v26 = v8;
      __int16 v27 = 2114;
      id v28 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s Cannot access to %{public}@ %{public}@ using default value=%{public}@",  (uint8_t *)&v21,  0x2Au);
      v18 = v10;
    }
  }

  return v18;
}

- (NSDictionary)SSVParameterDirectionary
{
  v32[0] = @"noiseLevelChannelBitset";
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[CSAsset SSVNoiseLevelChannelBitset](self, "SSVNoiseLevelChannelBitset")));
  v33[0] = v31;
  v32[1] = @"LKFSChannelBitset";
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[CSAsset SSVLKFSChannelBitset](self, "SSVLKFSChannelBitset")));
  v33[1] = v30;
  v32[2] = @"energyBufferSize";
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[CSAsset SSVEnergyBufferSize](self, "SSVEnergyBufferSize")));
  v33[2] = v29;
  v32[3] = @"noiseLowerPercentile";
  id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[CSAsset SSVNoiseLowerPercentile](self, "SSVNoiseLowerPercentile")));
  v33[3] = v28;
  v32[4] = @"noiseUpperPercentile";
  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[CSAsset SSVNoiseUpperPercentile](self, "SSVNoiseUpperPercentile")));
  v33[4] = v27;
  v32[5] = @"LKFSLowerPercentile";
  id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[CSAsset SSVLKFSLowerPercentile](self, "SSVLKFSLowerPercentile")));
  v33[5] = v26;
  v32[6] = @"LKFSUpperPercentile";
  __int16 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[CSAsset SSVLKFSUpperPercentile](self, "SSVLKFSUpperPercentile")));
  v33[6] = v25;
  v32[7] = @"noiseTimeConstant";
  -[CSAsset SSVNoiseTimeConstant](self, "SSVNoiseTimeConstant");
  id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v33[7] = v24;
  v32[8] = @"noiseMicSensitivityOffset";
  -[CSAsset SSVNoiseMicSensitivityOffset](self, "SSVNoiseMicSensitivityOffset");
  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v33[8] = v23;
  v32[9] = @"LKFSTimeConstant";
  -[CSAsset SSVLKFSTimeConstant](self, "SSVLKFSTimeConstant");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v33[9] = v22;
  v32[10] = @"LKFSMicSensitivityOffset";
  -[CSAsset SSVLKFSMicSensitivityOffset](self, "SSVLKFSMicSensitivityOffset");
  int v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v33[10] = v21;
  v32[11] = @"noiseTTSMappingInputRangeLow";
  -[CSAsset SSVNoiseTTSMappingInputRangeLow](self, "SSVNoiseTTSMappingInputRangeLow");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v33[11] = v20;
  v32[12] = @"noiseTTSMappingInputRangeHigh";
  -[CSAsset SSVNoiseTTSMappingInputRangeHigh](self, "SSVNoiseTTSMappingInputRangeHigh");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v33[12] = v19;
  v32[13] = @"noiseTTSMappingOutputRangeLow";
  -[CSAsset SSVNoiseTTSMappingOutputRangeLow](self, "SSVNoiseTTSMappingOutputRangeLow");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v33[13] = v18;
  v32[14] = @"noiseTTSMappingOutputRangeHigh";
  -[CSAsset SSVNoiseTTSMappingOutputRangeHigh](self, "SSVNoiseTTSMappingOutputRangeHigh");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v33[14] = v17;
  v32[15] = @"LKFSTTSMappingInputRangeLow";
  -[CSAsset SSVLKFSTTSMappingInputRangeLow](self, "SSVLKFSTTSMappingInputRangeLow");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v33[15] = v16;
  v32[16] = @"LKFSTTSMappingInputRangeHigh";
  -[CSAsset SSVLKFSTTSMappingInputRangeHigh](self, "SSVLKFSTTSMappingInputRangeHigh");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v33[16] = v15;
  v32[17] = @"LKFSTTSMappingOutputRangeLow";
  -[CSAsset SSVLKFSTTSMappingOutputRangeLow](self, "SSVLKFSTTSMappingOutputRangeLow");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v33[17] = v14;
  v32[18] = @"LKFSTTSMappingOutputRangeHigh";
  -[CSAsset SSVLKFSTTSMappingOutputRangeHigh](self, "SSVLKFSTTSMappingOutputRangeHigh");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v33[18] = v3;
  v32[19] = @"userOffsetInputRangeLow";
  -[CSAsset SSVUserOffsetInputRangeLow](self, "SSVUserOffsetInputRangeLow");
  float v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v33[19] = v4;
  v32[20] = @"userOffsetInputRangeHigh";
  -[CSAsset SSVUserOffsetInputRangeHigh](self, "SSVUserOffsetInputRangeHigh");
  float v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v33[20] = v5;
  v32[21] = @"userOffsetOutputRangeLow";
  -[CSAsset SSVUserOffsetOutputRangeLow](self, "SSVUserOffsetOutputRangeLow");
  float v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v33[21] = v6;
  v32[22] = @"userOffsetOutputRangeHigh";
  -[CSAsset SSVUserOffsetOutputRangeHigh](self, "SSVUserOffsetOutputRangeHigh");
  float v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v33[22] = v7;
  v32[23] = @"TTSVolumeLowerLimitDB";
  -[CSAsset SSVTTSVolumeLowerLimitDB](self, "SSVTTSVolumeLowerLimitDB");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v33[23] = v8;
  v32[24] = @"TTSVolumeUpperLimitDB";
  -[CSAsset SSVTTSVolumeUpperLimitDB](self, "SSVTTSVolumeUpperLimitDB");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v33[24] = v9;
  v32[25] = @"noiseWeight";
  -[CSAsset SSVNoiseWeight](self, "SSVNoiseWeight");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v33[25] = v10;
  v32[26] = @"DistanceChannelBitset";
  int v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[CSAsset SSVDistanceChannelBitset](self, "SSVDistanceChannelBitset")));
  v33[26] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v33,  v32,  27LL));

  return (NSDictionary *)v12;
}

+ (unsigned)SSVDefaultNoiseChannelCount
{
  if (CSIsHorseman(a1, a2))
  {
    id v2 = +[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType");
    uint64_t v3 = 16128LL;
    if (v2 == (id)3) {
      uint64_t v3 = 3840LL;
    }
    if (v2 == (id)2) {
      uint64_t v4 = 960LL;
    }
    else {
      uint64_t v4 = v3;
    }
  }

  else
  {
    uint64_t v4 = 16128LL;
  }

  return +[CSUtils getNumElementInBitset:](&OBJC_CLASS___CSUtils, "getNumElementInBitset:", v4);
}

+ (unsigned)SSVDefaultLKFSChannelCount
{
  if (CSIsHorseman(a1, a2))
  {
    if (+[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType") == (id)3) {
      uint64_t v2 = 0x100000LL;
    }
    else {
      uint64_t v2 = 16LL;
    }
  }

  else
  {
    uint64_t v2 = 16LL;
  }

  return +[CSUtils getNumElementInBitset:](&OBJC_CLASS___CSUtils, "getNumElementInBitset:", v2);
}

+ (unsigned)SSVDefaultDistanceChannelCount
{
  if (CSIsHorseman(a1, a2))
  {
    id v2 = +[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType");
    uint64_t v3 = 16128LL;
    if (v2 == (id)3) {
      uint64_t v3 = 3840LL;
    }
    if (v2 == (id)2) {
      uint64_t v4 = 896LL;
    }
    else {
      uint64_t v4 = v3;
    }
  }

  else
  {
    uint64_t v4 = 16128LL;
  }

  return +[CSUtils getNumElementInBitset:](&OBJC_CLASS___CSUtils, "getNumElementInBitset:", v4);
}

+ (unint64_t)getSSVDeviceType
{
  else {
    return 1LL;
  }
}

- (id)createRTModelWithLocale:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath"));
  float v6 = &AFBTProductIDSupportsAnnounce_ptr;
  if (v5
    && (float v7 = (void *)v5,
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset path](self, "path")),
        v8,
        v7,
        v8))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath"));
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:@"config_rtv2.txt"]);

    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 stringByAppendingPathComponent:@"config_rt.txt"]);

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 stringByAppendingPathComponent:@"config.txt"]);

    int v15 = CSHasAOP();
    v16 = v14;
    if (v15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      unsigned __int8 v18 = [v17 fileExistsAtPath:v10 isDirectory:0];

      v16 = v10;
      if ((v18 & 1) == 0)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
        unsigned __int8 v20 = [v19 fileExistsAtPath:v12 isDirectory:0];

        v16 = v12;
        if ((v20 & 1) == 0)
        {
          int v21 = (os_log_s *)CSLogContextFacilityCoreSpeech;
          BOOL v22 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
          v16 = v14;
          if (v22)
          {
            int v38 = 136315650;
            v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
            __int16 v40 = 2114;
            v41 = 0LL;
            __int16 v42 = 2114;
            v43 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s RT specific configuration %{public}@ does not exist, defaulting to unified configuration %{public}@",  (uint8_t *)&v38,  0x20u);
            v16 = v14;
          }
        }
      }
    }

    __int16 v23 = v16;
    id v24 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 136315394;
      v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
      __int16 v40 = 2114;
      v41 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s Creating RT blob using: %{public}@",  (uint8_t *)&v38,  0x16u);
    }

    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue( +[VTBlobBuilder getBlobWithConfigFilename:rootDirectory:]( &OBJC_CLASS___VTBlobBuilder,  "getBlobWithConfigFilename:rootDirectory:",  v23,  v25));

    __int16 v27 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (v26)
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v38 = 136315394;
        v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
        __int16 v40 = 2114;
        v41 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%s CorealisRT model creation done successfully : %{public}@",  (uint8_t *)&v38,  0x16u);
      }

      id v28 = (__CFString *)objc_claimAutoreleasedReturnValue(-[CSAsset assetHashInResourcePath:](self, "assetHashInResourcePath:", v23));
    }

    else
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        int v38 = 136315138;
        v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
        _os_log_error_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_ERROR,  "%s Failed to create CorealisRT model",  (uint8_t *)&v38,  0xCu);
      }

      id v28 = 0LL;
    }

    float v6 = &AFBTProductIDSupportsAnnounce_ptr;

    if (v26)
    {
      uint64_t v35 = objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath"));
      if (v35)
      {
        v36 = (void *)v35;
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset path](self, "path"));

        if (v37) {
          goto LABEL_21;
        }
      }
    }
  }

  else
  {
    id v28 = 0LL;
    id v26 = 0LL;
  }

  v29 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v38 = 136315138;
    v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%s Defaulting to en_US CorealisRT model",  (uint8_t *)&v38,  0xCu);
  }

  uint64_t v30 = objc_claimAutoreleasedReturnValue([v6[469] getDefaultBlob]);

  v31 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (v30)
  {
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 136315138;
      v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%s Default CorealisRT model creation done successfully",  (uint8_t *)&v38,  0xCu);
    }

    id v28 = @"nohash";
    id v26 = (void *)v30;
LABEL_21:
    v32 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 136315650;
      v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
      __int16 v40 = 2114;
      v41 = v4;
      __int16 v42 = 2114;
      v43 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "%s RT Model queried - %{public}@ %{public}@",  (uint8_t *)&v38,  0x20u);
    }

    v33 = -[CSVoiceTriggerRTModel initWithData:hash:locale:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerRTModel),  "initWithData:hash:locale:",  v26,  v28,  v4);

    goto LABEL_27;
  }

  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v38 = 136315138;
    v39 = "-[CSAsset(RTModel) createRTModelWithLocale:]";
    _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%s Failed to create default CorealisRT model",  (uint8_t *)&v38,  0xCu);
  }

  v33 = 0LL;
LABEL_27:

  return v33;
}

- (id)RTModelWithFallbackLanguage:(id)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSUtils getSiriLanguageWithFallback:](&OBJC_CLASS___CSUtils, "getSiriLanguageWithFallback:", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset createRTModelWithLocale:](self, "createRTModelWithLocale:", v4));

  return v5;
}

- (id)latestHearstRTModelWithRequestOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[CSAsset dictionary](self, "dictionary"));
  if (!v5
    || (float v6 = (void *)v5,
        float v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset dictionary](self, "dictionary")),
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"rtblobs"]),
        v8,
        v7,
        v6,
        !v8))
  {
    __int16 v25 = 0LL;
    goto LABEL_23;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset dictionary](self, "dictionary"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"rtblobs"]);
  v29 = self;
  id v30 = v4;
  int v11 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:]( self,  "_getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:",  v4,  v10,  1LL));

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (!v12)
  {
    unint64_t v14 = 0LL;
    unint64_t v32 = 0LL;
    int v15 = 0LL;
    goto LABEL_20;
  }

  id v13 = v12;
  unint64_t v14 = 0LL;
  unint64_t v32 = 0LL;
  int v15 = 0LL;
  uint64_t v16 = *(void *)v35;
  do
  {
    for (i = 0LL; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v35 != v16) {
        objc_enumerationMutation(obj);
      }
      unsigned __int8 v18 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"majorVersion"]);
      unint64_t v20 = [v19 unsignedIntValue];

      int v21 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"minorVersion"]);
      unint64_t v22 = [v21 unsignedIntValue];

      if (v14 < v20)
      {
        unint64_t v14 = v20;
LABEL_14:
        id v24 = v18;

        unint64_t v32 = v22;
        int v15 = v24;
        continue;
      }

      if (v14 == v20 && v32 < v22) {
        goto LABEL_14;
      }
    }

    id v13 = [obj countByEnumeratingWithState:&v34 objects:v46 count:16];
  }

  while (v13);
LABEL_20:

  id v26 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315907;
    v39 = "-[CSAsset(RTModel) latestHearstRTModelWithRequestOptions:]";
    __int16 v40 = 1024;
    int v41 = v14;
    __int16 v42 = 1024;
    int v43 = v32;
    __int16 v44 = 2113;
    v45 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%s latestMajorVersion = %d, LatestMinorVersion = %d rtBlob = %{private}@",  buf,  0x22u);
  }

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100066B24;
  v33[3] = &unk_10022B640;
  v33[4] = v14;
  v33[5] = v32;
  id v4 = v30;
  __int16 v27 = -[CSVoiceTriggerRTModelRequestOptions initWithCSRTModelRequestOptions:builder:]( objc_alloc(&OBJC_CLASS___CSVoiceTriggerRTModelRequestOptions),  "initWithCSRTModelRequestOptions:builder:",  v30,  v33);
  __int16 v25 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _buildRTModelWithBlobConfig:requestOptions:]( v29,  "_buildRTModelWithBlobConfig:requestOptions:",  v15,  v27));

LABEL_23:
  return v25;
}

- (id)rtModelWithRequestOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accessoryModelType]);
  id v6 = [v5 integerValue];

  if (v6) {
    float v7 = @"adkblobs";
  }
  else {
    float v7 = @"rtblobs";
  }
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[CSAsset dictionary](self, "dictionary"));
  if (v8
    && (id v9 = (void *)v8,
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset dictionary](self, "dictionary")),
        int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v7]),
        v11,
        v10,
        v9,
        v11))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset dictionary](self, "dictionary"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v7]);

    unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _rtModelWithRequestOptions:accessoryBlobs:]( self,  "_rtModelWithRequestOptions:accessoryBlobs:",  v4,  v13));
  }

  else
  {
    int v15 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      unsigned __int8 v18 = "-[CSAsset(RTModel) rtModelWithRequestOptions:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s corespeech.json doesn't contains rtblobs",  (uint8_t *)&v17,  0xCu);
    }

    unint64_t v14 = 0LL;
  }

  return v14;
}

- (id)hearstRTModelWithRequestOptions:(id)a3
{
  return -[CSAsset rtModelWithRequestOptions:](self, "rtModelWithRequestOptions:", a3);
}

- (id)hearstRTModelLocaleMap
{
  return -[CSAsset localeMapWithName:](self, "localeMapWithName:", @"rtlocalemap");
}

- (id)jarvisRTModelLocaleMap
{
  return -[CSAsset localeMapWithName:](self, "localeMapWithName:", @"jarvislocalemap");
}

- (id)remoraRTModelLocaleMap
{
  return -[CSAsset localeMapWithName:](self, "localeMapWithName:", @"adklocalemap");
}

- (id)rtModelLocaleMapWithModelType:(int64_t)a3
{
  if (a3 == 1) {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset remoraRTModelLocaleMap](self, "remoraRTModelLocaleMap"));
  }
  else {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset hearstRTModelLocaleMap](self, "hearstRTModelLocaleMap"));
  }
  return v3;
}

- (id)localeMapWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[CSAsset dictionary](self, "dictionary"));
  if (v5)
  {
    id v6 = (void *)v5;
    float v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset dictionary](self, "dictionary"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v4]);
    if (v8)
    {
      id v9 = (void *)v8;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset dictionary](self, "dictionary"));
      int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v4]);
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary, v12);
      char isKindOfClass = objc_opt_isKindOfClass(v11, v13);

      if ((isKindOfClass & 1) != 0)
      {
        int v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset dictionary](self, "dictionary"));
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v4]);

        goto LABEL_9;
      }
    }

    else
    {
    }
  }

  int v17 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v19 = 136315394;
    unint64_t v20 = "-[CSAsset(RTModel) localeMapWithName:]";
    __int16 v21 = 2114;
    id v22 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s Locale map for %{public}@ is not available on asset",  (uint8_t *)&v19,  0x16u);
  }

  uint64_t v16 = 0LL;
LABEL_9:

  return v16;
}

- (id)_sha1:(id)a3
{
  id v3 = a3;
  CC_SHA1([v3 bytes], (CC_LONG)objc_msgSend(v3, "length"), md);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 40LL));
  for (uint64_t i = 0LL; i != 20; ++i)
    objc_msgSend(v4, "appendFormat:", @"%02x", md[i]);

  return v4;
}

- (id)_sha256:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", 32LL));
  id v5 = v3;
  id v6 = [v5 bytes];
  CC_LONG v7 = [v5 length];

  id v8 = v4;
  CC_SHA256(v6, v7, (unsigned __int8 *)[v8 mutableBytes]);
  return v8;
}

- (id)_buildRTModelWithBlobConfig:(id)a3 requestOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"blob"]);
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:v8]);

    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v12 = [v11 fileExistsAtPath:v10];

    uint64_t v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if ((v12 & 1) != 0)
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v41 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
        __int16 v42 = 2114;
        int v43 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Reading blob from : %{public}@",  buf,  0x16u);
      }

      unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v10));
      if (v14)
      {
        int v15 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset _sha1:](self, "_sha1:", v14));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringWithRange:", 0, 20));

        int v38 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset _sha256:](self, "_sha256:", v14));
        uint64_t v16 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"signature"]);
        __int128 v37 = (void *)v16;
        if (v16)
        {
          uint64_t v17 = v16;
          unsigned __int8 v18 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath"));
          int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingPathComponent:v17]);

          unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          unsigned int v21 = [v20 fileExistsAtPath:v19];

          if (v21) {
            __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v19));
          }
          else {
            __int128 v36 = 0LL;
          }
        }

        else
        {
          __int128 v36 = 0LL;
        }

        uint64_t v25 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"cert"]);
        __int128 v35 = (void *)v25;
        if (v25)
        {
          uint64_t v26 = v25;
          __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath", v25));
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 stringByAppendingPathComponent:v26]);

          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          unsigned int v30 = [v29 fileExistsAtPath:v28];

          if (v30) {
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v28));
          }
          else {
            v31 = 0LL;
          }
        }

        else
        {
          v31 = 0LL;
        }

        unint64_t v32 = objc_alloc(&OBJC_CLASS___CSVoiceTriggerRTModel);
        v33 = (void *)objc_claimAutoreleasedReturnValue([v7 siriLocale]);
        __int16 v23 = -[CSVoiceTriggerRTModel initWithData:hash:locale:digest:signature:certificate:]( v32,  "initWithData:hash:locale:digest:signature:certificate:",  v14,  v39,  v33,  v38,  v36,  v31);
      }

      else
      {
        id v24 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          int v41 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
          __int16 v42 = 2114;
          int v43 = v10;
          _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s Blob is nil : %{public}@",  buf,  0x16u);
        }

        __int16 v23 = 0LL;
      }
    }

    else
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v41 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
        __int16 v42 = 2114;
        int v43 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%s blob file is not exists at %{public}@",  buf,  0x16u);
      }

      __int16 v23 = 0LL;
    }
  }

  else
  {
    id v22 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      int v41 = "-[CSAsset(RTModel) _buildRTModelWithBlobConfig:requestOptions:]";
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s blob file name is not exists",  buf,  0xCu);
    }

    __int16 v23 = 0LL;
  }

  return v23;
}

- (id)_splitBlobsByPhraseType:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"phraseType"]);
        unsigned __int8 v12 = (void *)v11;
        if (v11) {
          uint64_t v13 = (__CFString *)v11;
        }
        else {
          uint64_t v13 = @"HSOnly";
        }
        unint64_t v14 = v13;

        int v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", v14));
        if (!v15)
        {
          int v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v15, v14);
        }

        -[NSMutableArray addObject:](v15, "addObject:", v10);
      }

      id v7 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }

    while (v7);
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v4, "allKeys"));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)j);
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v21));
        id v23 = [v22 sortedArrayUsingComparator:&stru_10022B680];

        if (v23) {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v23, v21);
        }
      }

      id v18 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }

    while (v18);
  }

  return v4;
}

- (id)_getFilteredAccessoryRTBlobListForRequestOptions:(id)a3 accessoryBlobs:(id)a4 forceSkipEngineVersionCheck:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset _splitBlobsByPhraseType:](self, "_splitBlobsByPhraseType:", a4));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 userSelectedPhraseType]);
  uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue( -[CSAsset _userSelectedPhraseTypeToRTModelPhraseType:]( self,  "_userSelectedPhraseTypeToRTModelPhraseType:",  v10));

  if (-[CSAsset _allowMultiPhrase:forceSkipEngineVersionCheck:]( self,  "_allowMultiPhrase:forceSkipEngineVersionCheck:",  v8,  v5))
  {
    if (!v11)
    {
      unsigned __int8 v12 = 0LL;
      goto LABEL_8;
    }
  }

  else
  {
    uint64_t v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315650;
      id v17 = "-[CSAsset(RTModel) _getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:]";
      __int16 v18 = 1024;
      *(_DWORD *)uint64_t v19 = 0;
      *(_WORD *)&v19[4] = 2112;
      *(void *)&v19[6] = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Falling back to HSOnly phrase - Multi-phrase allowed: %d, request options: %@",  (uint8_t *)&v16,  0x1Cu);
    }

    uint64_t v11 = @"HSOnly";
  }

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v11]);
LABEL_8:
  unint64_t v14 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315651;
    id v17 = "-[CSAsset(RTModel) _getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:]";
    __int16 v18 = 2113;
    *(void *)uint64_t v19 = v11;
    *(_WORD *)&v19[8] = 2113;
    *(void *)&v19[10] = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "%s Selected phrase type: %{private}@ accessory RTBlobs: %{private}@",  (uint8_t *)&v16,  0x20u);
  }

  return v12;
}

- (id)_rtModelWithRequestOptions:(id)a3 accessoryBlobs:(id)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:]( self,  "_getFilteredAccessoryRTBlobListForRequestOptions:accessoryBlobs:forceSkipEngineVersionCheck:",  v6,  a4,  0LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 engineMajorVersion]);
  unsigned int v9 = [v8 unsignedIntValue];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 engineMinorVersion]);
  unsigned int v11 = [v10 unsignedIntValue];

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v7;
  id v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    id v13 = v12;
    id v24 = self;
    id v25 = v6;
    uint64_t v14 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0LL; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(obj);
        }
        int v16 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"majorVersion"]);
        unsigned int v18 = [v17 unsignedIntValue];

        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:@"minorVersion"]);
        unsigned int v20 = [v19 unsignedIntValue];

        if (v18 == v9 && v11 >= v20)
        {
          id v6 = v25;
          id v22 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset _buildRTModelWithBlobConfig:requestOptions:]( v24,  "_buildRTModelWithBlobConfig:requestOptions:",  v16,  v25));
          goto LABEL_15;
        }
      }

      id v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v13) {
        continue;
      }
      break;
    }

    id v22 = 0LL;
    id v6 = v25;
  }

  else
  {
    id v22 = 0LL;
  }

- (BOOL)_allowMultiPhrase:(id)a3 forceSkipEngineVersionCheck:(BOOL)a4
{
  if (!a3) {
    return 0;
  }
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accessoryInfo]);
  unsigned int v7 = [v6 supportsJustSiri];

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 engineMajorVersion]);
  unsigned int v9 = [v8 unsignedIntValue];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 engineMinorVersion]);
  unsigned int v11 = [v10 unsignedIntValue];

  if (v9) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = !v12;
  if (a4) {
    int v14 = 1;
  }
  else {
    int v14 = v13;
  }
  unsigned int v15 = [v5 allowMph];

  char v16 = v7 & v14 & v15;
  id v17 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136316162;
    unsigned int v20 = "-[CSAsset(RTModel) _allowMultiPhrase:forceSkipEngineVersionCheck:]";
    __int16 v21 = 1024;
    int v22 = v7 & v14 & v15;
    __int16 v23 = 1024;
    unsigned int v24 = v7;
    __int16 v25 = 1024;
    int v26 = v14;
    __int16 v27 = 1024;
    unsigned int v28 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s Multi-phrase keyword detection (%d): Accessory supports multi-phrase: %d, engine support multi-phrase: %d, devi ce allows multi-phrase: %d",  (uint8_t *)&v19,  0x24u);
  }

  return v16;
}

- (id)_userSelectedPhraseTypeToRTModelPhraseType:(id)a3
{
  if ([a3 unsignedIntegerValue] == (id)1) {
    return @"HSJS";
  }
  else {
    return @"HSOnly";
  }
}

+ (BOOL)supportsMultiPhraseVoiceTriggerForEngineVersion:(id)a3 engineMinorVersion:(id)a4 accessoryRTModelType:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 unsignedIntegerValue];
  id v11 = [v8 unsignedIntegerValue];
  id v12 = [v9 unsignedIntegerValue];

  int v13 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315650;
    int v19 = "+[CSAsset(RTModel) supportsMultiPhraseVoiceTriggerForEngineVersion:engineMinorVersion:accessoryRTModelType:]";
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Incoming Major version:%@, Incoming Minor version:%@",  (uint8_t *)&v18,  0x20u);
  }

  if (v10) {
    BOOL v14 = v11 == 0LL;
  }
  else {
    BOOL v14 = 1;
  }
  char v15 = !v14;
  else {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)containsSpeakerRecognitionCategory
{
  return -[CSAsset containsCategory:](self, "containsCategory:", @"speakerRecognition");
}

- (id)getPhraseConfig:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getValueForKey:category:]( self,  "getValueForKey:category:",  @"phrase",  @"speakerRecognition"));
  id v5 = v4;
  if (v4 && (unint64_t)[v4 count] <= a3)
  {
    id v7 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      id v10 = "-[CSAsset(SpeakerRecognition) getPhraseConfig:]";
      __int16 v11 = 1024;
      int v12 = a3;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Config for ph: %d doesn't exist, use default",  (uint8_t *)&v9,  0x12u);
    }

    id v6 = 0LL;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndex:a3]);
  }

  return v6;
}

- (float)satScoreThresholdForPhId:(unint64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset getPhraseConfig:](self, "getPhraseConfig:", a3));
  id v5 = v4;
  if (v4
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"satThreshold"]),
        v6,
        v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"satThreshold"]);
    [v7 floatValue];
    float v9 = v8;
  }

  else
  {
    -[CSAsset satScoreThreshold](self, "satScoreThreshold");
    float v9 = v10;
  }

  return v9;
}

- (float)satScoreThreshold
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"satThreshold",  @"speakerRecognition",  &off_1002398C0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (int64_t)multiUserLowScoreThresholdForPhId:(unint64_t)a3
{
  float v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset getPhraseConfig:](self, "getPhraseConfig:", a3));
  id v5 = v4;
  if (v4
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"multiUserLowScoreThreshold"]),
        v6,
        v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"multiUserLowScoreThreshold"]);
    [v7 floatValue];
    int64_t v9 = (unint64_t)v8;
  }

  else
  {
    int64_t v9 = -[CSAsset multiUserLowScoreThreshold](self, "multiUserLowScoreThreshold");
  }

  return v9;
}

- (int64_t)multiUserLowScoreThreshold
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"multiUserLowScoreThreshold",  @"speakerRecognition",  &off_1002389B8));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (int64_t)multiUserHighScoreThresholdForPhId:(unint64_t)a3
{
  float v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset getPhraseConfig:](self, "getPhraseConfig:", a3));
  id v5 = v4;
  if (v4
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"multiUserHighScoreThreshold"]),
        v6,
        v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"multiUserHighScoreThreshold"]);
    [v7 floatValue];
    int64_t v9 = (unint64_t)v8;
  }

  else
  {
    int64_t v9 = -[CSAsset multiUserHighScoreThreshold](self, "multiUserHighScoreThreshold");
  }

  return v9;
}

- (int64_t)multiUserHighScoreThreshold
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"multiUserHighScoreThreshold",  @"speakerRecognition",  &off_1002389D0));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (int64_t)multiUserConfidentScoreThresholdForPhId:(unint64_t)a3
{
  float v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset getPhraseConfig:](self, "getPhraseConfig:", a3));
  id v5 = v4;
  if (v4
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"multiUserConfidentScoreThreshold"]),
        v6,
        v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"multiUserConfidentScoreThreshold"]);
    [v7 floatValue];
    int64_t v9 = (unint64_t)v8;
  }

  else
  {
    int64_t v9 = -[CSAsset multiUserConfidentScoreThreshold](self, "multiUserConfidentScoreThreshold");
  }

  return v9;
}

- (int64_t)multiUserConfidentScoreThreshold
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"multiUserConfidentScoreThreshold",  @"speakerRecognition",  &off_1002389E8));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (int64_t)multiUserDeltaScoreThresholdForPhId:(unint64_t)a3
{
  float v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset getPhraseConfig:](self, "getPhraseConfig:", a3));
  id v5 = v4;
  if (v4
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"multiUserDeltaScoreThreshold"]),
        v6,
        v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"multiUserDeltaScoreThreshold"]);
    [v7 floatValue];
    int64_t v9 = (unint64_t)v8;
  }

  else
  {
    int64_t v9 = -[CSAsset multiUserDeltaScoreThreshold](self, "multiUserDeltaScoreThreshold");
  }

  return v9;
}

- (int64_t)multiUserDeltaScoreThreshold
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"multiUserDeltaScoreThreshold",  @"speakerRecognition",  &off_100238A00));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (float)psrCombinationWeight
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"combinationWeight",  @"speakerRecognition",  &off_1002382E0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)satImplicitProfileThreshold
{
  float v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  float v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"implicitProfileThreshold",  @"speakerRecognition",  v3));
  [v4 floatValue];
  float v6 = v5;

  return v6;
}

- (float)satImplicitProfileDeltaThreshold
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"implicitProfileDeltaThreshold",  @"speakerRecognition",  &off_1002382F0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)satVTImplicitThreshold
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"implicitVTThreshold",  @"speakerRecognition",  &off_1002398D0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)pruningExplicitUttThresholdSAT
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"pruningExplicitSATThreshold",  @"speakerRecognition",  &off_1002398D0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)pruningExplicitUttThresholdPSR
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"pruningExplicitPSRThreshold",  @"speakerRecognition",  &off_1002398D0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)pruningThresholdSAT
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"pruningSATThreshold",  @"speakerRecognition",  &off_1002398D0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (float)pruningThresholdPSR
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"pruningPSRThreshold",  @"speakerRecognition",  &off_1002398D0));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (unint64_t)pruningNumRetentionUtterance
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"numPruningRetentionUtt",  @"speakerRecognition",  &off_100238A18));
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (unint64_t)maxAllowedEnrollmentUtterances
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"maxEnrollmentUtterances",  @"speakerRecognition",  &off_100238A30));
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (NSString)voiceProfilePruningCookie
{
  return (NSString *)-[CSAsset getStringForKey:category:default:]( self,  "getStringForKey:category:default:",  @"pruningCookie",  @"speakerRecognition",  0LL);
}

- (NSString)keywordDetectorQuasarConfigFilePath
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath"));
  if (+[CSUtils horsemanDeviceType](&OBJC_CLASS___CSUtils, "horsemanDeviceType") != (id)1
    || (float v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerSecondPassConfigDecoder getDefaultRecognizerForB238]( &OBJC_CLASS___CSVoiceTriggerSecondPassConfigDecoder,  "getDefaultRecognizerForB238")),  v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getStringForKey:category:default:]( self,  "getStringForKey:category:default:",  v4,  @"voiceTriggerSecondPass",  0LL)),  v4,  !v5))
  {
    float v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getStringForKey:category:default:]( self,  "getStringForKey:category:default:",  @"configFileRecognizer",  @"voiceTriggerSecondPassAOP",  @"recognizer.json"));
  }

  float v6 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:v5]);

  return (NSString *)v6;
}

- (NSString)keywordDetectorNDAPIConfigFilePath
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath"));
  float v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getStringForKey:category:default:]( self,  "getStringForKey:category:default:",  @"configFileNDAPI",  @"voiceTriggerSecondPassAOP",  @"config.txt"));
  float v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:v4]);

  return (NSString *)v5;
}

- (BOOL)satImplicitTrainingEnabled
{
  BOOL v3 = (CSIsIOS(self, a2) & 1) != 0 || CSIsMac();
  return -[CSAsset getBoolForKey:category:default:]( self,  "getBoolForKey:category:default:",  @"implicit_training_enabled",  @"speakerRecognition",  v3);
}

- (BOOL)containsMultiUserThresholds
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset path](self, "path"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v4 = [v3 fileExistsAtPath:v2];

  if ((v4 & 1) != 0)
  {
    float v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v2));
    if (!v5)
    {
      __int16 v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      BOOL v9 = 0;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        int v18 = "-[CSAsset(SpeakerRecognition) containsMultiUserThresholds]";
        __int16 v19 = 2114;
        __int16 v20 = v2;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Could not read: %{public}@", buf, 0x16u);
        BOOL v9 = 0;
      }

      goto LABEL_17;
    }

    id v16 = 0LL;
    float v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v5,  0LL,  &v16));
    id v7 = v16;
    if (v7)
    {
      float v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      BOOL v9 = 0;
      if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }

      *(_DWORD *)buf = 136315650;
      int v18 = "-[CSAsset(SpeakerRecognition) containsMultiUserThresholds]";
      __int16 v19 = 2114;
      __int16 v20 = v2;
      __int16 v21 = 2114;
      id v22 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s Could not decode contents of: %{public}@: err: %{public}@",  buf,  0x20u);
    }

    else if (v6)
    {
      int v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"speakerRecognition"]);
      if (v12)
      {
        int v13 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"speakerRecognition"]);
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"multiUserConfidentScoreThreshold"]);
        BOOL v9 = v14 != 0LL;
      }

      else
      {
        BOOL v9 = 0;
      }

      goto LABEL_16;
    }

    BOOL v9 = 0;
    goto LABEL_16;
  }

  float v10 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  BOOL v9 = 0;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v18 = "-[CSAsset(SpeakerRecognition) containsMultiUserThresholds]";
    __int16 v19 = 2114;
    __int16 v20 = v2;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s %{public}@ doesnt exist", buf, 0x16u);
    BOOL v9 = 0;
  }

- (BOOL)useSpeakerRecognitionAsset
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"useSpeakerRecognitionAsset",  @"speakerRecognition",  0LL));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)useTDTIEnrollment
{
  return -[CSAsset getBoolForKey:category:default:]( self,  "getBoolForKey:category:default:",  @"useTDTIEnrollment",  @"speakerRecognition",  0LL);
}

- (float)keywordDetectorThreshold
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"threshold",  @"keywordDetector",  &off_100239900));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

- (NSString)keywordDetectorConfigPathRecognizer
{
  float v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSAsset resourcePath](self, "resourcePath"));
  float v4 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getStringForKey:category:default:]( self,  "getStringForKey:category:default:",  @"configFileRecognizer",  @"keywordDetector",  @"keyword_detector.json"));
  float v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:v4]);

  return (NSString *)v5;
}

- (float)keywordDetectorWaitTimeSinceVT
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( -[CSAsset getNumberForKey:category:default:]( self,  "getNumberForKey:category:default:",  @"waitTimeSinceVT",  @"keywordDetector",  &off_100239910));
  [v2 floatValue];
  float v4 = v3;

  return v4;
}

@end