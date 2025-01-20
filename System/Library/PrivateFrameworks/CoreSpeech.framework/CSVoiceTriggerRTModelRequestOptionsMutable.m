@interface CSVoiceTriggerRTModelRequestOptionsMutable
- (BOOL)mAllowMph;
- (CSCoreSpeechServicesAccessoryInfo)mAccessoryInfo;
- (NSNumber)mAccessoryModelType;
- (NSNumber)mEngineMajorVersion;
- (NSNumber)mEngineMinorVersion;
- (NSNumber)mUserSelectedPhrasetype;
- (NSString)mFallbackPhraseType;
- (NSString)mSiriLocale;
- (NSUUID)mEndpointId;
- (void)setAccessoryModelType:(id)a3;
- (void)setAllowMph:(BOOL)a3;
- (void)setCSCoreSpeechServicesAccessoryInfo:(id)a3;
- (void)setEndpointId:(id)a3;
- (void)setEngineMajorVersion:(id)a3;
- (void)setEngineMinorVersion:(id)a3;
- (void)setMAccessoryInfo:(id)a3;
- (void)setMAllowMph:(BOOL)a3;
- (void)setMFallbackPhraseType:(id)a3;
- (void)setMSiriLocale:(id)a3;
- (void)setMUserSelectedPhrasetype:(id)a3;
- (void)setSiriLocale:(id)a3;
- (void)setUserSelectedPhraseType:(id)a3;
@end

@implementation CSVoiceTriggerRTModelRequestOptionsMutable

- (void)setAllowMph:(BOOL)a3
{
  self->_mAllowMph = a3;
}

- (void)setEndpointId:(id)a3
{
}

- (void)setEngineMajorVersion:(id)a3
{
}

- (void)setEngineMinorVersion:(id)a3
{
}

- (void)setAccessoryModelType:(id)a3
{
}

- (void)setSiriLocale:(id)a3
{
}

- (void)setCSCoreSpeechServicesAccessoryInfo:(id)a3
{
  v4 = (CSCoreSpeechServicesAccessoryInfo *)[a3 copy];
  mAccessoryInfo = self->_mAccessoryInfo;
  self->_mAccessoryInfo = v4;
}

- (void)setUserSelectedPhraseType:(id)a3
{
}

- (BOOL)mAllowMph
{
  return self->_mAllowMph;
}

- (void)setMAllowMph:(BOOL)a3
{
  self->_mAllowMph = a3;
}

- (NSNumber)mUserSelectedPhrasetype
{
  return self->_mUserSelectedPhrasetype;
}

- (void)setMUserSelectedPhrasetype:(id)a3
{
}

- (NSString)mFallbackPhraseType
{
  return self->_mFallbackPhraseType;
}

- (void)setMFallbackPhraseType:(id)a3
{
}

- (NSUUID)mEndpointId
{
  return self->_mEndpointId;
}

- (NSNumber)mEngineMajorVersion
{
  return self->_mEngineMajorVersion;
}

- (NSNumber)mEngineMinorVersion
{
  return self->_mEngineMinorVersion;
}

- (NSNumber)mAccessoryModelType
{
  return self->_mAccessoryModelType;
}

- (NSString)mSiriLocale
{
  return self->_mSiriLocale;
}

- (void)setMSiriLocale:(id)a3
{
}

- (CSCoreSpeechServicesAccessoryInfo)mAccessoryInfo
{
  return self->_mAccessoryInfo;
}

- (void)setMAccessoryInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end