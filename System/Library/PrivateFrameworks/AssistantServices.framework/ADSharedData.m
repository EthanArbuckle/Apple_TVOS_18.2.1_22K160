@interface ADSharedData
- (AFVoiceInfo)outputVoice;
- (AFVoiceInfo)previousOutputVoice;
- (BOOL)cloudSyncEnabled;
- (BOOL)dictationEnabled;
- (BOOL)isLocationSharingDevice;
- (BOOL)isRemotePlaybackDevice;
- (BOOL)shouldCensorSpeech;
- (BOOL)siriEnabled;
- (NSArray)notificationPreviewRestrictedApps;
- (NSDictionary)utsRequiredRequestKeyValuePairs;
- (NSString)airplayRouteId;
- (NSString)assistantId;
- (NSString)dataSharingOptInStatus;
- (NSString)ekToken;
- (NSString)hostname;
- (NSString)languageCode;
- (NSString)loggingAssistantId;
- (NSString)loggingSharedUserId;
- (NSString)previousLanguageCode;
- (NSString)sharedUserId;
- (NSString)speechId;
- (NSString)storeFrontId;
- (NSString)temperatureUnit;
- (NSString)userAgent;
- (NSString)userAssignedName;
- (NSString)userToken;
- (id)description;
- (void)setAirplayRouteId:(id)a3;
- (void)setAssistantId:(id)a3;
- (void)setCloudSyncEnabled:(BOOL)a3;
- (void)setDataSharingOptInStatus:(id)a3;
- (void)setDictationEnabled:(BOOL)a3;
- (void)setEkToken:(id)a3;
- (void)setHostname:(id)a3;
- (void)setIsLocationSharingDevice:(BOOL)a3;
- (void)setIsRemotePlaybackDevice:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLoggingAssistantId:(id)a3;
- (void)setLoggingSharedUserId:(id)a3;
- (void)setNotificationPreviewRestrictedApps:(id)a3;
- (void)setOutputVoice:(id)a3;
- (void)setPreviousLanguageCode:(id)a3;
- (void)setPreviousOutputVoice:(id)a3;
- (void)setSharedUserId:(id)a3;
- (void)setShouldCensorSpeech:(BOOL)a3;
- (void)setSiriEnabled:(BOOL)a3;
- (void)setSpeechId:(id)a3;
- (void)setStoreFrontId:(id)a3;
- (void)setTemperatureUnit:(id)a3;
- (void)setUserAgent:(id)a3;
- (void)setUserAssignedName:(id)a3;
- (void)setUserToken:(id)a3;
- (void)setUtsRequiredRequestKeyValuePairs:(id)a3;
@end

@implementation ADSharedData

- (id)description
{
  v28 = objc_alloc(&OBJC_CLASS___NSString);
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___ADSharedData;
  id v3 = -[ADSharedData description](&v36, "description");
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  userAssignedName = self->_userAssignedName;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_siriEnabled));
  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_dictationEnabled));
  loggingAssistantId = self->_loggingAssistantId;
  assistantId = self->_assistantId;
  speechId = self->_speechId;
  loggingSharedUserId = self->_loggingSharedUserId;
  sharedUserId = self->_sharedUserId;
  previousLanguageCode = self->_previousLanguageCode;
  languageCode = self->_languageCode;
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[AFVoiceInfo languageCode](self->_outputVoice, "languageCode"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo name](self->_outputVoice, "name"));
  v27 = v34;
  if (!v34) {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo genderString](self->_outputVoice, "genderString"));
  }
  v29 = (void *)v7;
  v30 = (void *)v6;
  v31 = (void *)v5;
  v32 = (void *)v4;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo languageCode](self->_previousOutputVoice, "languageCode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo name](self->_previousOutputVoice, "name"));
  v33 = v8;
  if (!v8) {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[AFVoiceInfo genderString](self->_previousOutputVoice, "genderString"));
  }
  hostname = self->_hostname;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_cloudSyncEnabled));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_shouldCensorSpeech));
  userAgent = self->_userAgent;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isLocationSharingDevice));
  notificationPreviewRestrictedApps = self->_notificationPreviewRestrictedApps;
  temperatureUnit = self->_temperatureUnit;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isRemotePlaybackDevice));
  v17 = -[NSString initWithFormat:]( v28,  "initWithFormat:",  @"%@ name: %@ enabled: %@ dictation: %@ assistant id: %@ logging assistant id: %@ speech id: %@ sharedUserId: %@ logging sharedUserId: %@ language: %@ prev language: %@ outputVoice: %@ %@ prev: outputVoice: %@ %@ hostname: %@ cloud sync enabled: %@ should censor speech: %@ user agent: %@ is location sharing device: %@ notification restricted apps: %@ temperature unit: %@ remote playback device: %@",  v32,  userAssignedName,  v31,  v30,  assistantId,  loggingAssistantId,  speechId,  sharedUserId,  loggingSharedUserId,  languageCode,  previousLanguageCode,  v29,  v34,  v35,  v33,  hostname,  v10,  v11,  userAgent,  v13,  notificationPreviewRestrictedApps,  temperatureUnit,  v16);

  if (!v8) {
  if (!v27)
  }

  return v17;
}

- (BOOL)siriEnabled
{
  return self->_siriEnabled;
}

- (void)setSiriEnabled:(BOOL)a3
{
  self->_siriEnabled = a3;
}

- (BOOL)dictationEnabled
{
  return self->_dictationEnabled;
}

- (void)setDictationEnabled:(BOOL)a3
{
  self->_dictationEnabled = a3;
}

- (NSString)assistantId
{
  return self->_assistantId;
}

- (void)setAssistantId:(id)a3
{
}

- (NSString)loggingAssistantId
{
  return self->_loggingAssistantId;
}

- (void)setLoggingAssistantId:(id)a3
{
}

- (NSString)speechId
{
  return self->_speechId;
}

- (void)setSpeechId:(id)a3
{
}

- (NSString)sharedUserId
{
  return self->_sharedUserId;
}

- (void)setSharedUserId:(id)a3
{
}

- (NSString)loggingSharedUserId
{
  return self->_loggingSharedUserId;
}

- (void)setLoggingSharedUserId:(id)a3
{
}

- (NSString)previousLanguageCode
{
  return self->_previousLanguageCode;
}

- (void)setPreviousLanguageCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (AFVoiceInfo)previousOutputVoice
{
  return self->_previousOutputVoice;
}

- (void)setPreviousOutputVoice:(id)a3
{
}

- (AFVoiceInfo)outputVoice
{
  return self->_outputVoice;
}

- (void)setOutputVoice:(id)a3
{
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
}

- (BOOL)cloudSyncEnabled
{
  return self->_cloudSyncEnabled;
}

- (void)setCloudSyncEnabled:(BOOL)a3
{
  self->_cloudSyncEnabled = a3;
}

- (BOOL)shouldCensorSpeech
{
  return self->_shouldCensorSpeech;
}

- (void)setShouldCensorSpeech:(BOOL)a3
{
  self->_shouldCensorSpeech = a3;
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (BOOL)isLocationSharingDevice
{
  return self->_isLocationSharingDevice;
}

- (void)setIsLocationSharingDevice:(BOOL)a3
{
  self->_isLocationSharingDevice = a3;
}

- (NSArray)notificationPreviewRestrictedApps
{
  return self->_notificationPreviewRestrictedApps;
}

- (void)setNotificationPreviewRestrictedApps:(id)a3
{
}

- (NSString)temperatureUnit
{
  return self->_temperatureUnit;
}

- (void)setTemperatureUnit:(id)a3
{
}

- (NSString)airplayRouteId
{
  return self->_airplayRouteId;
}

- (void)setAirplayRouteId:(id)a3
{
}

- (NSString)storeFrontId
{
  return self->_storeFrontId;
}

- (void)setStoreFrontId:(id)a3
{
}

- (NSString)ekToken
{
  return self->_ekToken;
}

- (void)setEkToken:(id)a3
{
}

- (NSString)userToken
{
  return self->_userToken;
}

- (void)setUserToken:(id)a3
{
}

- (BOOL)isRemotePlaybackDevice
{
  return self->_isRemotePlaybackDevice;
}

- (void)setIsRemotePlaybackDevice:(BOOL)a3
{
  self->_isRemotePlaybackDevice = a3;
}

- (NSString)userAssignedName
{
  return self->_userAssignedName;
}

- (void)setUserAssignedName:(id)a3
{
}

- (NSDictionary)utsRequiredRequestKeyValuePairs
{
  return self->_utsRequiredRequestKeyValuePairs;
}

- (void)setUtsRequiredRequestKeyValuePairs:(id)a3
{
}

- (NSString)dataSharingOptInStatus
{
  return self->_dataSharingOptInStatus;
}

- (void)setDataSharingOptInStatus:(id)a3
{
}

- (void).cxx_destruct
{
}

@end