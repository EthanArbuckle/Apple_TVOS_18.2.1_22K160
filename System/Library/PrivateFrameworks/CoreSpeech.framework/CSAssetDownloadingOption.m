@interface CSAssetDownloadingOption
- (BOOL)allowAdBlockerAssetDownloading;
- (BOOL)allowEndpointAssetDownloading;
- (BOOL)allowGibraltarVoiceTriggerAssetDownloading;
- (BOOL)allowLanguageDetectorAssetDownloading;
- (BOOL)allowSpeakerRecognitionAssetDownloading;
- (BOOL)allowVoiceTriggerAccessoryAssetDownloading;
- (BOOL)allowVoiceTriggerAssetDownloading;
- (CSAssetDownloadingOption)init;
- (id)description;
- (void)setAllowAdBlockerAssetDownloading:(BOOL)a3;
- (void)setAllowEndpointAssetDownloading:(BOOL)a3;
- (void)setAllowGibraltarVoiceTriggerAssetDownloading:(BOOL)a3;
- (void)setAllowLanguageDetectorAssetDownloading:(BOOL)a3;
- (void)setAllowSpeakerRecognitionAssetDownloading:(BOOL)a3;
- (void)setAllowVoiceTriggerAccessoryAssetDownloading:(BOOL)a3;
- (void)setAllowVoiceTriggerAssetDownloading:(BOOL)a3;
@end

@implementation CSAssetDownloadingOption

- (CSAssetDownloadingOption)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSAssetDownloadingOption;
  result = -[CSAssetDownloadingOption init](&v3, "init");
  if (result)
  {
    result->_allowGibraltarVoiceTriggerAssetDownloading = 0;
    *(_DWORD *)&result->_allowVoiceTriggerAssetDownloading = 0;
    result->_allowSpeakerRecognitionAssetDownloading = 0;
  }

  return result;
}

- (id)description
{
  v2 = @"YES";
  if (self->_allowVoiceTriggerAssetDownloading) {
    objc_super v3 = @"YES";
  }
  else {
    objc_super v3 = @"NO";
  }
  else {
    v4 = @"NO";
  }
  if (self->_allowLanguageDetectorAssetDownloading) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  if (self->_allowAdBlockerAssetDownloading) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  if (self->_allowSpeakerRecognitionAssetDownloading) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  if (!self->_allowGibraltarVoiceTriggerAssetDownloading) {
    v2 = @"NO";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"set option : allowVoiceTriggerAssetsDownload ? %@;           allowEndpointAssetDownload ? %@;           allowLanguageDetectorAssetDownload ? %@;           allowAdBlockerAssetDownload ? %@;           allowSpeakerRecognitionAssetDownload ? %@;           allowGibraltarVoiceTriggerAssetDownloading ? %@",
           v3,
           v4,
           v5,
           v6,
           v7,
           v2);
}

- (BOOL)allowVoiceTriggerAssetDownloading
{
  return self->_allowVoiceTriggerAssetDownloading;
}

- (void)setAllowVoiceTriggerAssetDownloading:(BOOL)a3
{
  self->_allowVoiceTriggerAssetDownloading = a3;
}

- (BOOL)allowEndpointAssetDownloading
{
  return self->_allowEndpointAssetDownloading;
}

- (void)setAllowEndpointAssetDownloading:(BOOL)a3
{
  self->_allowEndpointAssetDownloading = a3;
}

- (BOOL)allowLanguageDetectorAssetDownloading
{
  return self->_allowLanguageDetectorAssetDownloading;
}

- (void)setAllowLanguageDetectorAssetDownloading:(BOOL)a3
{
  self->_allowLanguageDetectorAssetDownloading = a3;
}

- (BOOL)allowAdBlockerAssetDownloading
{
  return self->_allowAdBlockerAssetDownloading;
}

- (void)setAllowAdBlockerAssetDownloading:(BOOL)a3
{
  self->_allowAdBlockerAssetDownloading = a3;
}

- (BOOL)allowSpeakerRecognitionAssetDownloading
{
  return self->_allowSpeakerRecognitionAssetDownloading;
}

- (void)setAllowSpeakerRecognitionAssetDownloading:(BOOL)a3
{
  self->_allowSpeakerRecognitionAssetDownloading = a3;
}

- (BOOL)allowVoiceTriggerAccessoryAssetDownloading
{
  return self->_allowVoiceTriggerAccessoryAssetDownloading;
}

- (void)setAllowVoiceTriggerAccessoryAssetDownloading:(BOOL)a3
{
  self->_allowVoiceTriggerAccessoryAssetDownloading = a3;
}

- (BOOL)allowGibraltarVoiceTriggerAssetDownloading
{
  return self->_allowGibraltarVoiceTriggerAssetDownloading;
}

- (void)setAllowGibraltarVoiceTriggerAssetDownloading:(BOOL)a3
{
  self->_allowGibraltarVoiceTriggerAssetDownloading = a3;
}

@end