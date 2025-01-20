@interface _ADPBDeviceSetDataRequest
+ (Class)notificationPreviewRestrictedAppsType;
+ (unsigned)_ADPBDeviceRequestType;
- (ADSharedData)_ad_data;
- (BOOL)activityContinuationAllowed;
- (BOOL)cloudSyncEnabled;
- (BOOL)dictationEnabled;
- (BOOL)hasActivityContinuationAllowed;
- (BOOL)hasAirplayRouteId;
- (BOOL)hasAssistantId;
- (BOOL)hasCloudSyncEnabled;
- (BOOL)hasDataSharingOptInStatus;
- (BOOL)hasDictationEnabled;
- (BOOL)hasEkToken;
- (BOOL)hasHostname;
- (BOOL)hasIsLocationSharingDevice;
- (BOOL)hasIsRemotePlaybackDevice;
- (BOOL)hasLanguageCode;
- (BOOL)hasLoggingAssistantId;
- (BOOL)hasLoggingSharedId;
- (BOOL)hasOutputVoice;
- (BOOL)hasPreviousLangaugeCode;
- (BOOL)hasPreviousOutputVoice;
- (BOOL)hasSharedId;
- (BOOL)hasShouldCensorSpeech;
- (BOOL)hasSiriEnabled;
- (BOOL)hasSpeechId;
- (BOOL)hasStoreFrontId;
- (BOOL)hasTemperatureUnit;
- (BOOL)hasUserAgent;
- (BOOL)hasUserAssignedName;
- (BOOL)hasUserToken;
- (BOOL)hasUtsRequiredRequestData;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocationSharingDevice;
- (BOOL)isRemotePlaybackDevice;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldCensorSpeech;
- (BOOL)siriEnabled;
- (NSMutableArray)notificationPreviewRestrictedApps;
- (NSString)airplayRouteId;
- (NSString)assistantId;
- (NSString)dataSharingOptInStatus;
- (NSString)ekToken;
- (NSString)hostname;
- (NSString)languageCode;
- (NSString)loggingAssistantId;
- (NSString)loggingSharedId;
- (NSString)previousLangaugeCode;
- (NSString)sharedId;
- (NSString)speechId;
- (NSString)storeFrontId;
- (NSString)temperatureUnit;
- (NSString)userAgent;
- (NSString)userAssignedName;
- (NSString)userToken;
- (_ADPBDeviceOutputVoiceInfo)outputVoice;
- (_ADPBDeviceOutputVoiceInfo)previousOutputVoice;
- (_ADPBDeviceStringKeyValueDictionary)utsRequiredRequestData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)notificationPreviewRestrictedAppsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)notificationPreviewRestrictedAppsCount;
- (void)_ad_performWithCloudService:(id)a3 fromPeer:(id)a4 completion:(id)a5;
- (void)_ad_performWithSharedDataRemote:(id)a3 completion:(id)a4;
- (void)_ad_setData:(id)a3;
- (void)addNotificationPreviewRestrictedApps:(id)a3;
- (void)clearNotificationPreviewRestrictedApps;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityContinuationAllowed:(BOOL)a3;
- (void)setAirplayRouteId:(id)a3;
- (void)setAssistantId:(id)a3;
- (void)setCloudSyncEnabled:(BOOL)a3;
- (void)setDataSharingOptInStatus:(id)a3;
- (void)setDictationEnabled:(BOOL)a3;
- (void)setEkToken:(id)a3;
- (void)setHasActivityContinuationAllowed:(BOOL)a3;
- (void)setHasCloudSyncEnabled:(BOOL)a3;
- (void)setHasDictationEnabled:(BOOL)a3;
- (void)setHasIsLocationSharingDevice:(BOOL)a3;
- (void)setHasIsRemotePlaybackDevice:(BOOL)a3;
- (void)setHasShouldCensorSpeech:(BOOL)a3;
- (void)setHasSiriEnabled:(BOOL)a3;
- (void)setHostname:(id)a3;
- (void)setIsLocationSharingDevice:(BOOL)a3;
- (void)setIsRemotePlaybackDevice:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLoggingAssistantId:(id)a3;
- (void)setLoggingSharedId:(id)a3;
- (void)setNotificationPreviewRestrictedApps:(id)a3;
- (void)setOutputVoice:(id)a3;
- (void)setPreviousLangaugeCode:(id)a3;
- (void)setPreviousOutputVoice:(id)a3;
- (void)setSharedId:(id)a3;
- (void)setShouldCensorSpeech:(BOOL)a3;
- (void)setSiriEnabled:(BOOL)a3;
- (void)setSpeechId:(id)a3;
- (void)setStoreFrontId:(id)a3;
- (void)setTemperatureUnit:(id)a3;
- (void)setUserAgent:(id)a3;
- (void)setUserAssignedName:(id)a3;
- (void)setUserToken:(id)a3;
- (void)setUtsRequiredRequestData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _ADPBDeviceSetDataRequest

+ (unsigned)_ADPBDeviceRequestType
{
  return 2;
}

- (void)_ad_performWithSharedDataRemote:(id)a3 completion:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest _ad_data](self, "_ad_data"));
  [v6 _dataDidUpdate:v7];

  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
    v8 = v9;
  }
}

- (void)setSiriEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_siriEnabled = a3;
}

- (void)setHasSiriEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (BOOL)hasSiriEnabled
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (BOOL)hasSpeechId
{
  return self->_speechId != 0LL;
}

- (BOOL)hasLanguageCode
{
  return self->_languageCode != 0LL;
}

- (BOOL)hasAssistantId
{
  return self->_assistantId != 0LL;
}

- (BOOL)hasHostname
{
  return self->_hostname != 0LL;
}

- (void)setActivityContinuationAllowed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_activityContinuationAllowed = a3;
}

- (void)setHasActivityContinuationAllowed:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActivityContinuationAllowed
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setDictationEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_dictationEnabled = a3;
}

- (void)setHasDictationEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDictationEnabled
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasSharedId
{
  return self->_sharedId != 0LL;
}

- (BOOL)hasPreviousLangaugeCode
{
  return self->_previousLangaugeCode != 0LL;
}

- (BOOL)hasPreviousOutputVoice
{
  return self->_previousOutputVoice != 0LL;
}

- (BOOL)hasOutputVoice
{
  return self->_outputVoice != 0LL;
}

- (void)setCloudSyncEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cloudSyncEnabled = a3;
}

- (void)setHasCloudSyncEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCloudSyncEnabled
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setShouldCensorSpeech:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_shouldCensorSpeech = a3;
}

- (void)setHasShouldCensorSpeech:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasShouldCensorSpeech
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (BOOL)hasUserAgent
{
  return self->_userAgent != 0LL;
}

- (void)setIsLocationSharingDevice:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isLocationSharingDevice = a3;
}

- (void)setHasIsLocationSharingDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsLocationSharingDevice
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearNotificationPreviewRestrictedApps
{
}

- (void)addNotificationPreviewRestrictedApps:(id)a3
{
  id v4 = a3;
  notificationPreviewRestrictedApps = self->_notificationPreviewRestrictedApps;
  id v8 = v4;
  if (!notificationPreviewRestrictedApps)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v7 = self->_notificationPreviewRestrictedApps;
    self->_notificationPreviewRestrictedApps = v6;

    id v4 = v8;
    notificationPreviewRestrictedApps = self->_notificationPreviewRestrictedApps;
  }

  -[NSMutableArray addObject:](notificationPreviewRestrictedApps, "addObject:", v4);
}

- (unint64_t)notificationPreviewRestrictedAppsCount
{
  return (unint64_t)-[NSMutableArray count](self->_notificationPreviewRestrictedApps, "count");
}

- (id)notificationPreviewRestrictedAppsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_notificationPreviewRestrictedApps, "objectAtIndex:", a3);
}

- (BOOL)hasTemperatureUnit
{
  return self->_temperatureUnit != 0LL;
}

- (BOOL)hasLoggingAssistantId
{
  return self->_loggingAssistantId != 0LL;
}

- (BOOL)hasLoggingSharedId
{
  return self->_loggingSharedId != 0LL;
}

- (BOOL)hasStoreFrontId
{
  return self->_storeFrontId != 0LL;
}

- (BOOL)hasAirplayRouteId
{
  return self->_airplayRouteId != 0LL;
}

- (BOOL)hasEkToken
{
  return self->_ekToken != 0LL;
}

- (BOOL)hasUserToken
{
  return self->_userToken != 0LL;
}

- (void)setIsRemotePlaybackDevice:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isRemotePlaybackDevice = a3;
}

- (void)setHasIsRemotePlaybackDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsRemotePlaybackDevice
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasUserAssignedName
{
  return self->_userAssignedName != 0LL;
}

- (BOOL)hasUtsRequiredRequestData
{
  return self->_utsRequiredRequestData != 0LL;
}

- (BOOL)hasDataSharingOptInStatus
{
  return self->_dataSharingOptInStatus != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____ADPBDeviceSetDataRequest;
  id v3 = -[_ADPBDeviceSetDataRequest description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_siriEnabled));
    [v3 setObject:v4 forKey:@"siri_enabled"];
  }

  speechId = self->_speechId;
  if (speechId) {
    [v3 setObject:speechId forKey:@"speech_id"];
  }
  languageCode = self->_languageCode;
  if (languageCode) {
    [v3 setObject:languageCode forKey:@"language_code"];
  }
  assistantId = self->_assistantId;
  if (assistantId) {
    [v3 setObject:assistantId forKey:@"assistant_id"];
  }
  hostname = self->_hostname;
  if (hostname) {
    [v3 setObject:hostname forKey:@"hostname"];
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_activityContinuationAllowed));
    [v3 setObject:v10 forKey:@"activity_continuation_allowed"];

    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_dictationEnabled));
    [v3 setObject:v11 forKey:@"dictation_enabled"];
  }

  sharedId = self->_sharedId;
  if (sharedId) {
    [v3 setObject:sharedId forKey:@"shared_id"];
  }
  previousLangaugeCode = self->_previousLangaugeCode;
  if (previousLangaugeCode) {
    [v3 setObject:previousLangaugeCode forKey:@"previous_langauge_code"];
  }
  previousOutputVoice = self->_previousOutputVoice;
  if (previousOutputVoice)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( -[_ADPBDeviceOutputVoiceInfo dictionaryRepresentation]( previousOutputVoice,  "dictionaryRepresentation"));
    [v3 setObject:v15 forKey:@"previous_output_voice"];
  }

  outputVoice = self->_outputVoice;
  if (outputVoice)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceOutputVoiceInfo dictionaryRepresentation](outputVoice, "dictionaryRepresentation"));
    [v3 setObject:v17 forKey:@"output_voice"];
  }

  char v18 = (char)self->_has;
  if ((v18 & 2) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_cloudSyncEnabled));
    [v3 setObject:v19 forKey:@"cloud_sync_enabled"];

    char v18 = (char)self->_has;
  }

  if ((v18 & 0x20) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_shouldCensorSpeech));
    [v3 setObject:v20 forKey:@"should_censor_speech"];
  }

  userAgent = self->_userAgent;
  if (userAgent) {
    [v3 setObject:userAgent forKey:@"user_agent"];
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_isLocationSharingDevice));
    [v3 setObject:v22 forKey:@"is_location_sharing_device"];
  }

  notificationPreviewRestrictedApps = self->_notificationPreviewRestrictedApps;
  if (notificationPreviewRestrictedApps) {
    [v3 setObject:notificationPreviewRestrictedApps forKey:@"notification_preview_restricted_apps"];
  }
  temperatureUnit = self->_temperatureUnit;
  if (temperatureUnit) {
    [v3 setObject:temperatureUnit forKey:@"temperature_unit"];
  }
  loggingAssistantId = self->_loggingAssistantId;
  if (loggingAssistantId) {
    [v3 setObject:loggingAssistantId forKey:@"logging_assistant_id"];
  }
  loggingSharedId = self->_loggingSharedId;
  if (loggingSharedId) {
    [v3 setObject:loggingSharedId forKey:@"logging_shared_id"];
  }
  storeFrontId = self->_storeFrontId;
  if (storeFrontId) {
    [v3 setObject:storeFrontId forKey:@"store_front_id"];
  }
  airplayRouteId = self->_airplayRouteId;
  if (airplayRouteId) {
    [v3 setObject:airplayRouteId forKey:@"airplay_route_id"];
  }
  ekToken = self->_ekToken;
  if (ekToken) {
    [v3 setObject:ekToken forKey:@"ek_token"];
  }
  userToken = self->_userToken;
  if (userToken) {
    [v3 setObject:userToken forKey:@"user_token"];
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  self->_isRemotePlaybackDevice));
    [v3 setObject:v31 forKey:@"is_remote_playback_device"];
  }

  userAssignedName = self->_userAssignedName;
  if (userAssignedName) {
    [v3 setObject:userAssignedName forKey:@"user_assigned_name"];
  }
  utsRequiredRequestData = self->_utsRequiredRequestData;
  if (utsRequiredRequestData)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue( -[_ADPBDeviceStringKeyValueDictionary dictionaryRepresentation]( utsRequiredRequestData,  "dictionaryRepresentation"));
    [v3 setObject:v34 forKey:@"uts_required_request_data"];
  }

  dataSharingOptInStatus = self->_dataSharingOptInStatus;
  if (dataSharingOptInStatus) {
    [v3 setObject:dataSharingOptInStatus forKey:@"data_sharing_opt_in_status"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (!*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
    {
      char v5 = 0;
      unsigned int v6 = 0;
      unint64_t v7 = 0LL;
      while (1)
      {
        unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        char v9 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
        v7 |= (unint64_t)(v9 & 0x7F) << v5;
        if ((v9 & 0x80) == 0) {
          goto LABEL_11;
        }
        v5 += 7;
        BOOL v10 = v6++ >= 9;
        if (v10)
        {
          unint64_t v7 = 0LL;
          int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }

      *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v7 = 0LL;
      }
LABEL_13:
      if (v11 || (v7 & 7) == 4) {
        break;
      }
      switch((v7 >> 3))
      {
        case 1u:
          char v13 = 0;
          unsigned int v14 = 0;
          uint64_t v15 = 0LL;
          *(_BYTE *)&self->_has |= 0x40u;
          while (1)
          {
            unint64_t v16 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            char v17 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v16);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
            v15 |= (unint64_t)(v17 & 0x7F) << v13;
            if ((v17 & 0x80) == 0) {
              goto LABEL_98;
            }
            v13 += 7;
            BOOL v10 = v14++ >= 9;
            if (v10)
            {
              uint64_t v15 = 0LL;
              goto LABEL_100;
            }
          }

          *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_98:
          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v15 = 0LL;
          }
LABEL_100:
          BOOL v71 = v15 != 0;
          uint64_t v72 = 174LL;
          goto LABEL_125;
        case 4u:
          uint64_t String = PBReaderReadString(a3);
          uint64_t v20 = objc_claimAutoreleasedReturnValue(String);
          uint64_t v21 = 112LL;
          goto LABEL_96;
        case 5u:
          uint64_t v22 = PBReaderReadString(a3);
          uint64_t v20 = objc_claimAutoreleasedReturnValue(v22);
          uint64_t v21 = 48LL;
          goto LABEL_96;
        case 6u:
          uint64_t v23 = PBReaderReadString(a3);
          uint64_t v20 = objc_claimAutoreleasedReturnValue(v23);
          uint64_t v21 = 16LL;
          goto LABEL_96;
        case 7u:
          uint64_t v24 = PBReaderReadString(a3);
          uint64_t v20 = objc_claimAutoreleasedReturnValue(v24);
          uint64_t v21 = 40LL;
          goto LABEL_96;
        case 8u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v27 = 0LL;
          *(_BYTE *)&self->_has |= 1u;
          while (2)
          {
            unint64_t v28 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v28 == -1LL || v28 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v29 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v28);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v28 + 1;
              v27 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                BOOL v10 = v26++ >= 9;
                if (v10)
                {
                  uint64_t v27 = 0LL;
                  goto LABEL_104;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v27 = 0LL;
          }
LABEL_104:
          BOOL v71 = v27 != 0;
          uint64_t v72 = 168LL;
          goto LABEL_125;
        case 9u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v32 = 0LL;
          *(_BYTE *)&self->_has |= 4u;
          while (2)
          {
            unint64_t v33 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v33 == -1LL || v33 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v34 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v33);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v33 + 1;
              v32 |= (unint64_t)(v34 & 0x7F) << v30;
              if (v34 < 0)
              {
                v30 += 7;
                BOOL v10 = v31++ >= 9;
                if (v10)
                {
                  uint64_t v32 = 0LL;
                  goto LABEL_108;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v32 = 0LL;
          }
LABEL_108:
          BOOL v71 = v32 != 0;
          uint64_t v72 = 170LL;
          goto LABEL_125;
        case 0xAu:
          uint64_t v35 = PBReaderReadString(a3);
          uint64_t v20 = objc_claimAutoreleasedReturnValue(v35);
          uint64_t v21 = 104LL;
          goto LABEL_96;
        case 0xBu:
          uint64_t v36 = PBReaderReadString(a3);
          uint64_t v20 = objc_claimAutoreleasedReturnValue(v36);
          uint64_t v21 = 88LL;
          goto LABEL_96;
        case 0xCu:
          v37 = objc_alloc_init(&OBJC_CLASS____ADPBDeviceOutputVoiceInfo);
          uint64_t v38 = 96LL;
          goto LABEL_49;
        case 0xDu:
          v37 = objc_alloc_init(&OBJC_CLASS____ADPBDeviceOutputVoiceInfo);
          uint64_t v38 = 80LL;
LABEL_49:
          objc_storeStrong((id *)&self->PBRequest_opaque[v38], v37);
          goto LABEL_93;
        case 0xEu:
          char v39 = 0;
          unsigned int v40 = 0;
          uint64_t v41 = 0LL;
          *(_BYTE *)&self->_has |= 2u;
          while (2)
          {
            unint64_t v42 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v42 == -1LL || v42 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v43 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v42);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v42 + 1;
              v41 |= (unint64_t)(v43 & 0x7F) << v39;
              if (v43 < 0)
              {
                v39 += 7;
                BOOL v10 = v40++ >= 9;
                if (v10)
                {
                  uint64_t v41 = 0LL;
                  goto LABEL_112;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v41 = 0LL;
          }
LABEL_112:
          BOOL v71 = v41 != 0;
          uint64_t v72 = 169LL;
          goto LABEL_125;
        case 0xFu:
          char v44 = 0;
          unsigned int v45 = 0;
          uint64_t v46 = 0LL;
          *(_BYTE *)&self->_has |= 0x20u;
          while (2)
          {
            unint64_t v47 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v47 == -1LL || v47 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v48 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v47);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v47 + 1;
              v46 |= (unint64_t)(v48 & 0x7F) << v44;
              if (v48 < 0)
              {
                v44 += 7;
                BOOL v10 = v45++ >= 9;
                if (v10)
                {
                  uint64_t v46 = 0LL;
                  goto LABEL_116;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v46 = 0LL;
          }
LABEL_116:
          BOOL v71 = v46 != 0;
          uint64_t v72 = 173LL;
          goto LABEL_125;
        case 0x10u:
          uint64_t v49 = PBReaderReadString(a3);
          uint64_t v20 = objc_claimAutoreleasedReturnValue(v49);
          uint64_t v21 = 136LL;
          goto LABEL_96;
        case 0x11u:
          char v50 = 0;
          unsigned int v51 = 0;
          uint64_t v52 = 0LL;
          *(_BYTE *)&self->_has |= 8u;
          while (2)
          {
            unint64_t v53 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v53 == -1LL || v53 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v54 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v53);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v53 + 1;
              v52 |= (unint64_t)(v54 & 0x7F) << v50;
              if (v54 < 0)
              {
                v50 += 7;
                BOOL v10 = v51++ >= 9;
                if (v10)
                {
                  uint64_t v52 = 0LL;
                  goto LABEL_120;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v52 = 0LL;
          }
LABEL_120:
          BOOL v71 = v52 != 0;
          uint64_t v72 = 171LL;
          goto LABEL_125;
        case 0x12u:
          uint64_t v55 = PBReaderReadString(a3);
          v37 = (_ADPBDeviceOutputVoiceInfo *)objc_claimAutoreleasedReturnValue(v55);
          if (v37) {
            -[_ADPBDeviceSetDataRequest addNotificationPreviewRestrictedApps:]( self,  "addNotificationPreviewRestrictedApps:",  v37);
          }
          goto LABEL_94;
        case 0x13u:
          uint64_t v56 = PBReaderReadString(a3);
          uint64_t v20 = objc_claimAutoreleasedReturnValue(v56);
          uint64_t v21 = 128LL;
          goto LABEL_96;
        case 0x14u:
          uint64_t v57 = PBReaderReadString(a3);
          uint64_t v20 = objc_claimAutoreleasedReturnValue(v57);
          uint64_t v21 = 56LL;
          goto LABEL_96;
        case 0x15u:
          uint64_t v58 = PBReaderReadString(a3);
          uint64_t v20 = objc_claimAutoreleasedReturnValue(v58);
          uint64_t v21 = 64LL;
          goto LABEL_96;
        case 0x16u:
          uint64_t v59 = PBReaderReadString(a3);
          uint64_t v20 = objc_claimAutoreleasedReturnValue(v59);
          uint64_t v21 = 120LL;
          goto LABEL_96;
        case 0x17u:
          uint64_t v60 = PBReaderReadString(a3);
          uint64_t v20 = objc_claimAutoreleasedReturnValue(v60);
          uint64_t v21 = 8LL;
          goto LABEL_96;
        case 0x18u:
          uint64_t v61 = PBReaderReadString(a3);
          uint64_t v20 = objc_claimAutoreleasedReturnValue(v61);
          uint64_t v21 = 32LL;
          goto LABEL_96;
        case 0x19u:
          uint64_t v62 = PBReaderReadString(a3);
          uint64_t v20 = objc_claimAutoreleasedReturnValue(v62);
          uint64_t v21 = 152LL;
          goto LABEL_96;
        case 0x1Au:
          char v63 = 0;
          unsigned int v64 = 0;
          uint64_t v65 = 0LL;
          *(_BYTE *)&self->_has |= 0x10u;
          while (2)
          {
            unint64_t v66 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v66 == -1LL || v66 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }

            else
            {
              char v67 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v66);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v66 + 1;
              v65 |= (unint64_t)(v67 & 0x7F) << v63;
              if (v67 < 0)
              {
                v63 += 7;
                BOOL v10 = v64++ >= 9;
                if (v10)
                {
                  uint64_t v65 = 0LL;
                  goto LABEL_124;
                }

                continue;
              }
            }

            break;
          }

          if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v65 = 0LL;
          }
LABEL_124:
          BOOL v71 = v65 != 0;
          uint64_t v72 = 172LL;
LABEL_125:
          self->PBRequest_opaque[v72] = v71;
          goto LABEL_126;
        case 0x1Bu:
          uint64_t v68 = PBReaderReadString(a3);
          uint64_t v20 = objc_claimAutoreleasedReturnValue(v68);
          uint64_t v21 = 144LL;
          goto LABEL_96;
        case 0x1Cu:
          v37 = objc_alloc_init(&OBJC_CLASS____ADPBDeviceStringKeyValueDictionary);
          objc_storeStrong((id *)&self->_utsRequiredRequestData, v37);
          if (!PBReaderPlaceMark(a3, v74) || (sub_10033727C(v37, (uint64_t)a3) & 1) == 0)
          {
LABEL_128:

            LOBYTE(v18) = 0;
            return v18;
          }

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if ((*(_BYTE *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteBOOLField(v4, self->_siriEnabled, 1LL);
  }
  speechId = self->_speechId;
  if (speechId) {
    PBDataWriterWriteStringField(v5, speechId, 4LL);
  }
  languageCode = self->_languageCode;
  if (languageCode) {
    PBDataWriterWriteStringField(v5, languageCode, 5LL);
  }
  assistantId = self->_assistantId;
  if (assistantId) {
    PBDataWriterWriteStringField(v5, assistantId, 6LL);
  }
  hostname = self->_hostname;
  if (hostname) {
    PBDataWriterWriteStringField(v5, hostname, 7LL);
  }
  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteBOOLField(v5, self->_activityContinuationAllowed, 8LL);
    char has = (char)self->_has;
  }

  if ((has & 4) != 0) {
    PBDataWriterWriteBOOLField(v5, self->_dictationEnabled, 9LL);
  }
  sharedId = self->_sharedId;
  if (sharedId) {
    PBDataWriterWriteStringField(v5, sharedId, 10LL);
  }
  previousLangaugeCode = self->_previousLangaugeCode;
  if (previousLangaugeCode) {
    PBDataWriterWriteStringField(v5, previousLangaugeCode, 11LL);
  }
  previousOutputVoice = self->_previousOutputVoice;
  if (previousOutputVoice) {
    PBDataWriterWriteSubmessage(v5, previousOutputVoice, 12LL);
  }
  outputVoice = self->_outputVoice;
  if (outputVoice) {
    PBDataWriterWriteSubmessage(v5, outputVoice, 13LL);
  }
  char v15 = (char)self->_has;
  if ((v15 & 2) != 0)
  {
    PBDataWriterWriteBOOLField(v5, self->_cloudSyncEnabled, 14LL);
    char v15 = (char)self->_has;
  }

  if ((v15 & 0x20) != 0) {
    PBDataWriterWriteBOOLField(v5, self->_shouldCensorSpeech, 15LL);
  }
  userAgent = self->_userAgent;
  if (userAgent) {
    PBDataWriterWriteStringField(v5, userAgent, 16LL);
  }
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField(v5, self->_isLocationSharingDevice, 17LL);
  }
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  char v17 = self->_notificationPreviewRestrictedApps;
  id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v32,  v36,  16LL);
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v33;
    do
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteStringField(v5, *(void *)(*((void *)&v32 + 1) + 8LL * (void)i), 18LL);
      }

      id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v32,  v36,  16LL);
    }

    while (v19);
  }

  temperatureUnit = self->_temperatureUnit;
  if (temperatureUnit) {
    PBDataWriterWriteStringField(v5, temperatureUnit, 19LL);
  }
  loggingAssistantId = self->_loggingAssistantId;
  if (loggingAssistantId) {
    PBDataWriterWriteStringField(v5, loggingAssistantId, 20LL);
  }
  loggingSharedId = self->_loggingSharedId;
  if (loggingSharedId) {
    PBDataWriterWriteStringField(v5, loggingSharedId, 21LL);
  }
  storeFrontId = self->_storeFrontId;
  if (storeFrontId) {
    PBDataWriterWriteStringField(v5, storeFrontId, 22LL);
  }
  airplayRouteId = self->_airplayRouteId;
  if (airplayRouteId) {
    PBDataWriterWriteStringField(v5, airplayRouteId, 23LL);
  }
  ekToken = self->_ekToken;
  if (ekToken) {
    PBDataWriterWriteStringField(v5, ekToken, 24LL);
  }
  userToken = self->_userToken;
  if (userToken) {
    PBDataWriterWriteStringField(v5, userToken, 25LL);
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteBOOLField(v5, self->_isRemotePlaybackDevice, 26LL);
  }
  userAssignedName = self->_userAssignedName;
  if (userAssignedName) {
    PBDataWriterWriteStringField(v5, userAssignedName, 27LL);
  }
  utsRequiredRequestData = self->_utsRequiredRequestData;
  if (utsRequiredRequestData) {
    PBDataWriterWriteSubmessage(v5, utsRequiredRequestData, 28LL);
  }
  dataSharingOptInStatus = self->_dataSharingOptInStatus;
  if (dataSharingOptInStatus) {
    PBDataWriterWriteStringField(v5, dataSharingOptInStatus, 29LL);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    v4[174] = self->_siriEnabled;
    v4[176] |= 0x40u;
  }

  v12 = v4;
  if (self->_speechId)
  {
    objc_msgSend(v4, "setSpeechId:");
    id v4 = v12;
  }

  if (self->_languageCode)
  {
    objc_msgSend(v12, "setLanguageCode:");
    id v4 = v12;
  }

  if (self->_assistantId)
  {
    objc_msgSend(v12, "setAssistantId:");
    id v4 = v12;
  }

  if (self->_hostname)
  {
    objc_msgSend(v12, "setHostname:");
    id v4 = v12;
  }

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[168] = self->_activityContinuationAllowed;
    v4[176] |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    v4[170] = self->_dictationEnabled;
    v4[176] |= 4u;
  }

  if (self->_sharedId)
  {
    objc_msgSend(v12, "setSharedId:");
    id v4 = v12;
  }

  if (self->_previousLangaugeCode)
  {
    objc_msgSend(v12, "setPreviousLangaugeCode:");
    id v4 = v12;
  }

  if (self->_previousOutputVoice)
  {
    objc_msgSend(v12, "setPreviousOutputVoice:");
    id v4 = v12;
  }

  if (self->_outputVoice)
  {
    objc_msgSend(v12, "setOutputVoice:");
    id v4 = v12;
  }

  char v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    v4[169] = self->_cloudSyncEnabled;
    v4[176] |= 2u;
    char v6 = (char)self->_has;
  }

  if ((v6 & 0x20) != 0)
  {
    v4[173] = self->_shouldCensorSpeech;
    v4[176] |= 0x20u;
  }

  if (self->_userAgent)
  {
    objc_msgSend(v12, "setUserAgent:");
    id v4 = v12;
  }

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v4[171] = self->_isLocationSharingDevice;
    v4[176] |= 8u;
  }

  if (-[_ADPBDeviceSetDataRequest notificationPreviewRestrictedAppsCount]( self,  "notificationPreviewRestrictedAppsCount"))
  {
    [v12 clearNotificationPreviewRestrictedApps];
    unint64_t v7 = -[_ADPBDeviceSetDataRequest notificationPreviewRestrictedAppsCount]( self,  "notificationPreviewRestrictedAppsCount");
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( -[_ADPBDeviceSetDataRequest notificationPreviewRestrictedAppsAtIndex:]( self,  "notificationPreviewRestrictedAppsAtIndex:",  i));
        [v12 addNotificationPreviewRestrictedApps:v10];
      }
    }
  }

  if (self->_temperatureUnit) {
    objc_msgSend(v12, "setTemperatureUnit:");
  }
  int v11 = v12;
  if (self->_loggingAssistantId)
  {
    objc_msgSend(v12, "setLoggingAssistantId:");
    int v11 = v12;
  }

  if (self->_loggingSharedId)
  {
    objc_msgSend(v12, "setLoggingSharedId:");
    int v11 = v12;
  }

  if (self->_storeFrontId)
  {
    objc_msgSend(v12, "setStoreFrontId:");
    int v11 = v12;
  }

  if (self->_airplayRouteId)
  {
    objc_msgSend(v12, "setAirplayRouteId:");
    int v11 = v12;
  }

  if (self->_ekToken)
  {
    objc_msgSend(v12, "setEkToken:");
    int v11 = v12;
  }

  if (self->_userToken)
  {
    objc_msgSend(v12, "setUserToken:");
    int v11 = v12;
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v11[172] = self->_isRemotePlaybackDevice;
    v11[176] |= 0x10u;
  }

  if (self->_userAssignedName)
  {
    objc_msgSend(v12, "setUserAssignedName:");
    int v11 = v12;
  }

  if (self->_utsRequiredRequestData)
  {
    objc_msgSend(v12, "setUtsRequiredRequestData:");
    int v11 = v12;
  }

  if (self->_dataSharingOptInStatus)
  {
    objc_msgSend(v12, "setDataSharingOptInStatus:");
    int v11 = v12;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  char v6 = v5;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    v5[174] = self->_siriEnabled;
    v5[176] |= 0x40u;
  }

  id v7 = -[NSString copyWithZone:](self->_speechId, "copyWithZone:", a3);
  unint64_t v8 = (void *)v6[14];
  v6[14] = v7;

  id v9 = -[NSString copyWithZone:](self->_languageCode, "copyWithZone:", a3);
  BOOL v10 = (void *)v6[6];
  v6[6] = v9;

  id v11 = -[NSString copyWithZone:](self->_assistantId, "copyWithZone:", a3);
  v12 = (void *)v6[2];
  v6[2] = v11;

  id v13 = -[NSString copyWithZone:](self->_hostname, "copyWithZone:", a3);
  unsigned int v14 = (void *)v6[5];
  v6[5] = v13;

  char has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_BYTE *)v6 + 168) = self->_activityContinuationAllowed;
    *((_BYTE *)v6 + 176) |= 1u;
    char has = (char)self->_has;
  }

  if ((has & 4) != 0)
  {
    *((_BYTE *)v6 + 170) = self->_dictationEnabled;
    *((_BYTE *)v6 + 176) |= 4u;
  }

  id v16 = -[NSString copyWithZone:](self->_sharedId, "copyWithZone:", a3);
  char v17 = (void *)v6[13];
  v6[13] = v16;

  id v18 = -[NSString copyWithZone:](self->_previousLangaugeCode, "copyWithZone:", a3);
  id v19 = (void *)v6[11];
  v6[11] = v18;

  id v20 = -[_ADPBDeviceOutputVoiceInfo copyWithZone:](self->_previousOutputVoice, "copyWithZone:", a3);
  uint64_t v21 = (void *)v6[12];
  v6[12] = v20;

  id v22 = -[_ADPBDeviceOutputVoiceInfo copyWithZone:](self->_outputVoice, "copyWithZone:", a3);
  uint64_t v23 = (void *)v6[10];
  v6[10] = v22;

  char v24 = (char)self->_has;
  if ((v24 & 2) != 0)
  {
    *((_BYTE *)v6 + 169) = self->_cloudSyncEnabled;
    *((_BYTE *)v6 + 176) |= 2u;
    char v24 = (char)self->_has;
  }

  if ((v24 & 0x20) != 0)
  {
    *((_BYTE *)v6 + 173) = self->_shouldCensorSpeech;
    *((_BYTE *)v6 + 176) |= 0x20u;
  }

  id v25 = -[NSString copyWithZone:](self->_userAgent, "copyWithZone:", a3);
  unsigned int v26 = (void *)v6[17];
  v6[17] = v25;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *((_BYTE *)v6 + 171) = self->_isLocationSharingDevice;
    *((_BYTE *)v6 + 176) |= 8u;
  }

  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  uint64_t v27 = self->_notificationPreviewRestrictedApps;
  id v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v54,  v58,  16LL);
  if (v28)
  {
    id v29 = v28;
    uint64_t v30 = *(void *)v55;
    do
    {
      for (uint64_t i = 0LL; i != v29; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v55 != v30) {
          objc_enumerationMutation(v27);
        }
        id v32 = objc_msgSend(*(id *)(*((void *)&v54 + 1) + 8 * (void)i), "copyWithZone:", a3, (void)v54);
        [v6 addNotificationPreviewRestrictedApps:v32];
      }

      id v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v27,  "countByEnumeratingWithState:objects:count:",  &v54,  v58,  16LL);
    }

    while (v29);
  }

  id v33 = -[NSString copyWithZone:](self->_temperatureUnit, "copyWithZone:", a3);
  __int128 v34 = (void *)v6[16];
  v6[16] = v33;

  id v35 = -[NSString copyWithZone:](self->_loggingAssistantId, "copyWithZone:", a3);
  uint64_t v36 = (void *)v6[7];
  v6[7] = v35;

  id v37 = -[NSString copyWithZone:](self->_loggingSharedId, "copyWithZone:", a3);
  uint64_t v38 = (void *)v6[8];
  v6[8] = v37;

  id v39 = -[NSString copyWithZone:](self->_storeFrontId, "copyWithZone:", a3);
  unsigned int v40 = (void *)v6[15];
  v6[15] = v39;

  id v41 = -[NSString copyWithZone:](self->_airplayRouteId, "copyWithZone:", a3);
  unint64_t v42 = (void *)v6[1];
  v6[1] = v41;

  id v43 = -[NSString copyWithZone:](self->_ekToken, "copyWithZone:", a3);
  char v44 = (void *)v6[4];
  v6[4] = v43;

  id v45 = -[NSString copyWithZone:](self->_userToken, "copyWithZone:", a3);
  uint64_t v46 = (void *)v6[19];
  v6[19] = v45;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *((_BYTE *)v6 + 172) = self->_isRemotePlaybackDevice;
    *((_BYTE *)v6 + 176) |= 0x10u;
  }

  id v47 = -[NSString copyWithZone:](self->_userAssignedName, "copyWithZone:", a3, (void)v54);
  char v48 = (void *)v6[18];
  v6[18] = v47;

  id v49 = -[_ADPBDeviceStringKeyValueDictionary copyWithZone:](self->_utsRequiredRequestData, "copyWithZone:", a3);
  char v50 = (void *)v6[20];
  v6[20] = v49;

  id v51 = -[NSString copyWithZone:](self->_dataSharingOptInStatus, "copyWithZone:", a3);
  uint64_t v52 = (void *)v6[3];
  v6[3] = v51;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
  {
    if ((*((_BYTE *)v4 + 176) & 0x40) == 0) {
      goto LABEL_99;
    }
    if (self->_siriEnabled)
    {
      if (!*((_BYTE *)v4 + 174)) {
        goto LABEL_99;
      }
    }

    else if (*((_BYTE *)v4 + 174))
    {
      goto LABEL_99;
    }
  }

  else if ((*((_BYTE *)v4 + 176) & 0x40) != 0)
  {
    goto LABEL_99;
  }

  speechId = self->_speechId;
  languageCode = self->_languageCode;
  if ((unint64_t)languageCode | *((void *)v4 + 6))
  {
  }

  assistantId = self->_assistantId;
  if ((unint64_t)assistantId | *((void *)v4 + 2))
  {
  }

  hostname = self->_hostname;
  if ((unint64_t)hostname | *((void *)v4 + 5))
  {
  }

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 176) & 1) == 0) {
      goto LABEL_99;
    }
    if (self->_activityContinuationAllowed)
    {
      if (!*((_BYTE *)v4 + 168)) {
        goto LABEL_99;
      }
    }

    else if (*((_BYTE *)v4 + 168))
    {
      goto LABEL_99;
    }
  }

  else if ((*((_BYTE *)v4 + 176) & 1) != 0)
  {
    goto LABEL_99;
  }

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 176) & 4) == 0) {
      goto LABEL_99;
    }
    if (self->_dictationEnabled)
    {
      if (!*((_BYTE *)v4 + 170)) {
        goto LABEL_99;
      }
    }

    else if (*((_BYTE *)v4 + 170))
    {
      goto LABEL_99;
    }
  }

  else if ((*((_BYTE *)v4 + 176) & 4) != 0)
  {
    goto LABEL_99;
  }

  sharedId = self->_sharedId;
  previousLangaugeCode = self->_previousLangaugeCode;
  if ((unint64_t)previousLangaugeCode | *((void *)v4 + 11))
  {
  }

  previousOutputVoice = self->_previousOutputVoice;
  if ((unint64_t)previousOutputVoice | *((void *)v4 + 12))
  {
    if (!-[_ADPBDeviceOutputVoiceInfo isEqual:](previousOutputVoice, "isEqual:")) {
      goto LABEL_99;
    }
  }

  outputVoice = self->_outputVoice;
  if ((unint64_t)outputVoice | *((void *)v4 + 10))
  {
    if (!-[_ADPBDeviceOutputVoiceInfo isEqual:](outputVoice, "isEqual:")) {
      goto LABEL_99;
    }
  }

  char has = (char)self->_has;
  char v14 = *((_BYTE *)v4 + 176);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 176) & 2) == 0) {
      goto LABEL_99;
    }
    if (self->_cloudSyncEnabled)
    {
      if (!*((_BYTE *)v4 + 169)) {
        goto LABEL_99;
      }
    }

    else if (*((_BYTE *)v4 + 169))
    {
      goto LABEL_99;
    }
  }

  else if ((*((_BYTE *)v4 + 176) & 2) != 0)
  {
    goto LABEL_99;
  }

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 176) & 0x20) == 0) {
      goto LABEL_99;
    }
    if (self->_shouldCensorSpeech)
    {
      if (!*((_BYTE *)v4 + 173)) {
        goto LABEL_99;
      }
    }

    else if (*((_BYTE *)v4 + 173))
    {
      goto LABEL_99;
    }
  }

  else if ((*((_BYTE *)v4 + 176) & 0x20) != 0)
  {
    goto LABEL_99;
  }

  userAgent = self->_userAgent;
  if ((unint64_t)userAgent | *((void *)v4 + 17))
  {
    char has = (char)self->_has;
    char v14 = *((_BYTE *)v4 + 176);
  }

  if ((has & 8) != 0)
  {
    if ((v14 & 8) == 0) {
      goto LABEL_99;
    }
    if (self->_isLocationSharingDevice)
    {
      if (!*((_BYTE *)v4 + 171)) {
        goto LABEL_99;
      }
    }

    else if (*((_BYTE *)v4 + 171))
    {
      goto LABEL_99;
    }
  }

  else if ((v14 & 8) != 0)
  {
    goto LABEL_99;
  }

  notificationPreviewRestrictedApps = self->_notificationPreviewRestrictedApps;
  if ((unint64_t)notificationPreviewRestrictedApps | *((void *)v4 + 9)
    && !-[NSMutableArray isEqual:](notificationPreviewRestrictedApps, "isEqual:"))
  {
    goto LABEL_99;
  }

  temperatureUnit = self->_temperatureUnit;
  if ((unint64_t)temperatureUnit | *((void *)v4 + 16))
  {
  }

  loggingAssistantId = self->_loggingAssistantId;
  if ((unint64_t)loggingAssistantId | *((void *)v4 + 7))
  {
  }

  loggingSharedId = self->_loggingSharedId;
  if ((unint64_t)loggingSharedId | *((void *)v4 + 8))
  {
  }

  storeFrontId = self->_storeFrontId;
  if ((unint64_t)storeFrontId | *((void *)v4 + 15))
  {
  }

  airplayRouteId = self->_airplayRouteId;
  if ((unint64_t)airplayRouteId | *((void *)v4 + 1))
  {
  }

  ekToken = self->_ekToken;
  if ((unint64_t)ekToken | *((void *)v4 + 4))
  {
  }

  userToken = self->_userToken;
  if ((unint64_t)userToken | *((void *)v4 + 19))
  {
  }

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 176) & 0x10) != 0)
    {
      if (self->_isRemotePlaybackDevice)
      {
        if (!*((_BYTE *)v4 + 172)) {
          goto LABEL_99;
        }
        goto LABEL_93;
      }

      if (!*((_BYTE *)v4 + 172)) {
        goto LABEL_93;
      }
    }

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 0x40) != 0) {
    uint64_t v31 = 2654435761LL * self->_siriEnabled;
  }
  else {
    uint64_t v31 = 0LL;
  }
  NSUInteger v30 = -[NSString hash](self->_speechId, "hash");
  NSUInteger v29 = -[NSString hash](self->_languageCode, "hash");
  NSUInteger v28 = -[NSString hash](self->_assistantId, "hash");
  NSUInteger v27 = -[NSString hash](self->_hostname, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t v26 = 2654435761LL * self->_activityContinuationAllowed;
    if ((*(_BYTE *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v26 = 0LL;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_6:
      uint64_t v25 = 2654435761LL * self->_dictationEnabled;
      goto LABEL_9;
    }
  }

  uint64_t v25 = 0LL;
LABEL_9:
  NSUInteger v24 = -[NSString hash](self->_sharedId, "hash");
  NSUInteger v23 = -[NSString hash](self->_previousLangaugeCode, "hash");
  unint64_t v22 = -[_ADPBDeviceOutputVoiceInfo hash](self->_previousOutputVoice, "hash");
  unint64_t v21 = -[_ADPBDeviceOutputVoiceInfo hash](self->_outputVoice, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    uint64_t v20 = 2654435761LL * self->_cloudSyncEnabled;
    if ((*(_BYTE *)&self->_has & 0x20) != 0) {
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v20 = 0LL;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
    {
LABEL_11:
      uint64_t v19 = 2654435761LL * self->_shouldCensorSpeech;
      goto LABEL_14;
    }
  }

  uint64_t v19 = 0LL;
LABEL_14:
  NSUInteger v17 = -[NSString hash](self->_userAgent, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0) {
    uint64_t v3 = 2654435761LL * self->_isLocationSharingDevice;
  }
  else {
    uint64_t v3 = 0LL;
  }
  unint64_t v4 = (unint64_t)-[NSMutableArray hash](self->_notificationPreviewRestrictedApps, "hash", v17);
  NSUInteger v5 = -[NSString hash](self->_temperatureUnit, "hash");
  NSUInteger v6 = -[NSString hash](self->_loggingAssistantId, "hash");
  NSUInteger v7 = -[NSString hash](self->_loggingSharedId, "hash");
  NSUInteger v8 = -[NSString hash](self->_storeFrontId, "hash");
  NSUInteger v9 = -[NSString hash](self->_airplayRouteId, "hash");
  NSUInteger v10 = -[NSString hash](self->_ekToken, "hash");
  NSUInteger v11 = -[NSString hash](self->_userToken, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0) {
    uint64_t v12 = 2654435761LL * self->_isRemotePlaybackDevice;
  }
  else {
    uint64_t v12 = 0LL;
  }
  NSUInteger v13 = v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  unint64_t v14 = v12 ^ -[NSString hash](self->_userAssignedName, "hash");
  unint64_t v15 = v14 ^ -[_ADPBDeviceStringKeyValueDictionary hash](self->_utsRequiredRequestData, "hash");
  return v13 ^ v15 ^ -[NSString hash](self->_dataSharingOptInStatus, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v5 = v4;
  if ((v4[176] & 0x40) != 0)
  {
    self->_siriEnabled = v4[174];
    *(_BYTE *)&self->_has |= 0x40u;
  }

  if (*((void *)v4 + 14)) {
    -[_ADPBDeviceSetDataRequest setSpeechId:](self, "setSpeechId:");
  }
  if (*((void *)v5 + 6)) {
    -[_ADPBDeviceSetDataRequest setLanguageCode:](self, "setLanguageCode:");
  }
  if (*((void *)v5 + 2)) {
    -[_ADPBDeviceSetDataRequest setAssistantId:](self, "setAssistantId:");
  }
  if (*((void *)v5 + 5)) {
    -[_ADPBDeviceSetDataRequest setHostname:](self, "setHostname:");
  }
  char v6 = *((_BYTE *)v5 + 176);
  if ((v6 & 1) != 0)
  {
    self->_activityContinuationAllowed = *((_BYTE *)v5 + 168);
    *(_BYTE *)&self->_has |= 1u;
    char v6 = *((_BYTE *)v5 + 176);
  }

  if ((v6 & 4) != 0)
  {
    self->_dictationEnabled = *((_BYTE *)v5 + 170);
    *(_BYTE *)&self->_has |= 4u;
  }

  if (*((void *)v5 + 13)) {
    -[_ADPBDeviceSetDataRequest setSharedId:](self, "setSharedId:");
  }
  if (*((void *)v5 + 11)) {
    -[_ADPBDeviceSetDataRequest setPreviousLangaugeCode:](self, "setPreviousLangaugeCode:");
  }
  previousOutputVoice = self->_previousOutputVoice;
  uint64_t v8 = *((void *)v5 + 12);
  if (previousOutputVoice)
  {
    if (v8) {
      -[_ADPBDeviceOutputVoiceInfo mergeFrom:](previousOutputVoice, "mergeFrom:");
    }
  }

  else if (v8)
  {
    -[_ADPBDeviceSetDataRequest setPreviousOutputVoice:](self, "setPreviousOutputVoice:");
  }

  outputVoice = self->_outputVoice;
  uint64_t v10 = *((void *)v5 + 10);
  if (outputVoice)
  {
    if (v10) {
      -[_ADPBDeviceOutputVoiceInfo mergeFrom:](outputVoice, "mergeFrom:");
    }
  }

  else if (v10)
  {
    -[_ADPBDeviceSetDataRequest setOutputVoice:](self, "setOutputVoice:");
  }

  char v11 = *((_BYTE *)v5 + 176);
  if ((v11 & 2) != 0)
  {
    self->_cloudSyncEnabled = *((_BYTE *)v5 + 169);
    *(_BYTE *)&self->_has |= 2u;
    char v11 = *((_BYTE *)v5 + 176);
  }

  if ((v11 & 0x20) != 0)
  {
    self->_shouldCensorSpeech = *((_BYTE *)v5 + 173);
    *(_BYTE *)&self->_has |= 0x20u;
  }

  if (*((void *)v5 + 17)) {
    -[_ADPBDeviceSetDataRequest setUserAgent:](self, "setUserAgent:");
  }
  if ((*((_BYTE *)v5 + 176) & 8) != 0)
  {
    self->_isLocationSharingDevice = *((_BYTE *)v5 + 171);
    *(_BYTE *)&self->_has |= 8u;
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v12 = *((id *)v5 + 9);
  id v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0LL; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        -[_ADPBDeviceSetDataRequest addNotificationPreviewRestrictedApps:]( self,  "addNotificationPreviewRestrictedApps:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)i),  (void)v19);
      }

      id v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v14);
  }

  if (*((void *)v5 + 16)) {
    -[_ADPBDeviceSetDataRequest setTemperatureUnit:](self, "setTemperatureUnit:");
  }
  if (*((void *)v5 + 7)) {
    -[_ADPBDeviceSetDataRequest setLoggingAssistantId:](self, "setLoggingAssistantId:");
  }
  if (*((void *)v5 + 8)) {
    -[_ADPBDeviceSetDataRequest setLoggingSharedId:](self, "setLoggingSharedId:");
  }
  if (*((void *)v5 + 15)) {
    -[_ADPBDeviceSetDataRequest setStoreFrontId:](self, "setStoreFrontId:");
  }
  if (*((void *)v5 + 1)) {
    -[_ADPBDeviceSetDataRequest setAirplayRouteId:](self, "setAirplayRouteId:");
  }
  if (*((void *)v5 + 4)) {
    -[_ADPBDeviceSetDataRequest setEkToken:](self, "setEkToken:");
  }
  if (*((void *)v5 + 19)) {
    -[_ADPBDeviceSetDataRequest setUserToken:](self, "setUserToken:");
  }
  if ((*((_BYTE *)v5 + 176) & 0x10) != 0)
  {
    self->_isRemotePlaybackDevice = *((_BYTE *)v5 + 172);
    *(_BYTE *)&self->_has |= 0x10u;
  }

  if (*((void *)v5 + 18)) {
    -[_ADPBDeviceSetDataRequest setUserAssignedName:](self, "setUserAssignedName:");
  }
  utsRequiredRequestData = self->_utsRequiredRequestData;
  uint64_t v18 = *((void *)v5 + 20);
  if (utsRequiredRequestData)
  {
    if (v18) {
      -[_ADPBDeviceStringKeyValueDictionary mergeFrom:](utsRequiredRequestData, "mergeFrom:");
    }
  }

  else if (v18)
  {
    -[_ADPBDeviceSetDataRequest setUtsRequiredRequestData:](self, "setUtsRequiredRequestData:");
  }

  if (*((void *)v5 + 3)) {
    -[_ADPBDeviceSetDataRequest setDataSharingOptInStatus:](self, "setDataSharingOptInStatus:");
  }
}

- (BOOL)siriEnabled
{
  return self->_siriEnabled;
}

- (NSString)speechId
{
  return self->_speechId;
}

- (void)setSpeechId:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)assistantId
{
  return self->_assistantId;
}

- (void)setAssistantId:(id)a3
{
}

- (NSString)hostname
{
  return self->_hostname;
}

- (void)setHostname:(id)a3
{
}

- (BOOL)activityContinuationAllowed
{
  return self->_activityContinuationAllowed;
}

- (BOOL)dictationEnabled
{
  return self->_dictationEnabled;
}

- (NSString)sharedId
{
  return self->_sharedId;
}

- (void)setSharedId:(id)a3
{
}

- (NSString)previousLangaugeCode
{
  return self->_previousLangaugeCode;
}

- (void)setPreviousLangaugeCode:(id)a3
{
}

- (_ADPBDeviceOutputVoiceInfo)previousOutputVoice
{
  return self->_previousOutputVoice;
}

- (void)setPreviousOutputVoice:(id)a3
{
}

- (_ADPBDeviceOutputVoiceInfo)outputVoice
{
  return self->_outputVoice;
}

- (void)setOutputVoice:(id)a3
{
}

- (BOOL)cloudSyncEnabled
{
  return self->_cloudSyncEnabled;
}

- (BOOL)shouldCensorSpeech
{
  return self->_shouldCensorSpeech;
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

- (NSMutableArray)notificationPreviewRestrictedApps
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

- (NSString)loggingAssistantId
{
  return self->_loggingAssistantId;
}

- (void)setLoggingAssistantId:(id)a3
{
}

- (NSString)loggingSharedId
{
  return self->_loggingSharedId;
}

- (void)setLoggingSharedId:(id)a3
{
}

- (NSString)storeFrontId
{
  return self->_storeFrontId;
}

- (void)setStoreFrontId:(id)a3
{
}

- (NSString)airplayRouteId
{
  return self->_airplayRouteId;
}

- (void)setAirplayRouteId:(id)a3
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

- (NSString)userAssignedName
{
  return self->_userAssignedName;
}

- (void)setUserAssignedName:(id)a3
{
}

- (_ADPBDeviceStringKeyValueDictionary)utsRequiredRequestData
{
  return self->_utsRequiredRequestData;
}

- (void)setUtsRequiredRequestData:(id)a3
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

+ (Class)notificationPreviewRestrictedAppsType
{
  return (Class)objc_opt_class(&OBJC_CLASS___NSString);
}

- (void)_ad_performWithCloudService:(id)a3 fromPeer:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = (os_log_s *)AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    id v14 = "-[_ADPBDeviceSetDataRequest(ADPeerCloudService) _ad_performWithCloudService:fromPeer:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v13, 0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest _ad_data](self, "_ad_data"));
  [v8 _notifyObserversOfSharedData:v12 fromPeer:v9];

  (*((void (**)(id, void, uint64_t, void))v10 + 2))(v10, 0LL, 0xFFFFLL, 0LL);
}

- (ADSharedData)_ad_data
{
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___ADSharedData);
  -[ADSharedData setSiriEnabled:](v3, "setSiriEnabled:", -[_ADPBDeviceSetDataRequest siriEnabled](self, "siriEnabled"));
  -[ADSharedData setDictationEnabled:]( v3,  "setDictationEnabled:",  -[_ADPBDeviceSetDataRequest dictationEnabled](self, "dictationEnabled"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest assistantId](self, "assistantId"));
  -[ADSharedData setAssistantId:](v3, "setAssistantId:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest loggingAssistantId](self, "loggingAssistantId"));
  -[ADSharedData setLoggingAssistantId:](v3, "setLoggingAssistantId:", v5);

  char v6 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest speechId](self, "speechId"));
  -[ADSharedData setSpeechId:](v3, "setSpeechId:", v6);

  NSUInteger v7 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest sharedId](self, "sharedId"));
  -[ADSharedData setSharedUserId:](v3, "setSharedUserId:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest loggingSharedId](self, "loggingSharedId"));
  -[ADSharedData setLoggingSharedUserId:](v3, "setLoggingSharedUserId:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest languageCode](self, "languageCode"));
  -[ADSharedData setLanguageCode:](v3, "setLanguageCode:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest previousLangaugeCode](self, "previousLangaugeCode"));
  -[ADSharedData setPreviousLanguageCode:](v3, "setPreviousLanguageCode:", v10);

  char v11 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest outputVoice](self, "outputVoice"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_ad_voiceInfo"));
  -[ADSharedData setOutputVoice:](v3, "setOutputVoice:", v12);

  int v13 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest previousOutputVoice](self, "previousOutputVoice"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_ad_voiceInfo"));
  -[ADSharedData setPreviousOutputVoice:](v3, "setPreviousOutputVoice:", v14);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest hostname](self, "hostname"));
  -[ADSharedData setHostname:](v3, "setHostname:", v15);

  -[ADSharedData setCloudSyncEnabled:]( v3,  "setCloudSyncEnabled:",  -[_ADPBDeviceSetDataRequest cloudSyncEnabled](self, "cloudSyncEnabled"));
  -[ADSharedData setShouldCensorSpeech:]( v3,  "setShouldCensorSpeech:",  -[_ADPBDeviceSetDataRequest shouldCensorSpeech](self, "shouldCensorSpeech"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest userAgent](self, "userAgent"));
  -[ADSharedData setUserAgent:](v3, "setUserAgent:", v16);

  -[ADSharedData setIsLocationSharingDevice:]( v3,  "setIsLocationSharingDevice:",  -[_ADPBDeviceSetDataRequest isLocationSharingDevice](self, "isLocationSharingDevice"));
  NSUInteger v17 = (void *)objc_claimAutoreleasedReturnValue( -[_ADPBDeviceSetDataRequest notificationPreviewRestrictedApps]( self,  "notificationPreviewRestrictedApps"));
  -[ADSharedData setNotificationPreviewRestrictedApps:](v3, "setNotificationPreviewRestrictedApps:", v17);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest temperatureUnit](self, "temperatureUnit"));
  -[ADSharedData setTemperatureUnit:](v3, "setTemperatureUnit:", v18);

  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest airplayRouteId](self, "airplayRouteId"));
  -[ADSharedData setAirplayRouteId:](v3, "setAirplayRouteId:", v19);

  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest storeFrontId](self, "storeFrontId"));
  -[ADSharedData setStoreFrontId:](v3, "setStoreFrontId:", v20);

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest ekToken](self, "ekToken"));
  -[ADSharedData setEkToken:](v3, "setEkToken:", v21);

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest userToken](self, "userToken"));
  -[ADSharedData setUserToken:](v3, "setUserToken:", v22);

  -[ADSharedData setIsRemotePlaybackDevice:]( v3,  "setIsRemotePlaybackDevice:",  -[_ADPBDeviceSetDataRequest isRemotePlaybackDevice](self, "isRemotePlaybackDevice"));
  NSUInteger v23 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest userAssignedName](self, "userAssignedName"));
  -[ADSharedData setUserAssignedName:](v3, "setUserAssignedName:", v23);

  NSUInteger v24 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest utsRequiredRequestData](self, "utsRequiredRequestData"));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_ad_dictionaryRepresentation"));
  -[ADSharedData setUtsRequiredRequestKeyValuePairs:](v3, "setUtsRequiredRequestKeyValuePairs:", v25);

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBDeviceSetDataRequest dataSharingOptInStatus](self, "dataSharingOptInStatus"));
  -[ADSharedData setDataSharingOptInStatus:](v3, "setDataSharingOptInStatus:", v26);

  return v3;
}

- (void)_ad_setData:(id)a3
{
  id v4 = a3;
  -[_ADPBDeviceSetDataRequest setSiriEnabled:](self, "setSiriEnabled:", [v4 siriEnabled]);
  -[_ADPBDeviceSetDataRequest setDictationEnabled:](self, "setDictationEnabled:", [v4 dictationEnabled]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 assistantId]);
  -[_ADPBDeviceSetDataRequest setAssistantId:](self, "setAssistantId:", v5);

  char v6 = (void *)objc_claimAutoreleasedReturnValue([v4 loggingAssistantId]);
  -[_ADPBDeviceSetDataRequest setLoggingAssistantId:](self, "setLoggingAssistantId:", v6);

  NSUInteger v7 = (void *)objc_claimAutoreleasedReturnValue([v4 speechId]);
  -[_ADPBDeviceSetDataRequest setSpeechId:](self, "setSpeechId:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 sharedUserId]);
  -[_ADPBDeviceSetDataRequest setSharedId:](self, "setSharedId:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 loggingSharedUserId]);
  -[_ADPBDeviceSetDataRequest setLoggingSharedId:](self, "setLoggingSharedId:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 languageCode]);
  -[_ADPBDeviceSetDataRequest setLanguageCode:](self, "setLanguageCode:", v10);

  char v11 = (void *)objc_claimAutoreleasedReturnValue([v4 previousLanguageCode]);
  -[_ADPBDeviceSetDataRequest setPreviousLangaugeCode:](self, "setPreviousLangaugeCode:", v11);

  id v12 = objc_alloc_init(&OBJC_CLASS____ADPBDeviceOutputVoiceInfo);
  int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 outputVoice]);
  -[_ADPBDeviceOutputVoiceInfo _ad_setVoiceInfo:](v12, "_ad_setVoiceInfo:", v13);

  -[_ADPBDeviceSetDataRequest setOutputVoice:](self, "setOutputVoice:", v12);
  id v14 = objc_alloc_init(&OBJC_CLASS____ADPBDeviceOutputVoiceInfo);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 previousOutputVoice]);
  -[_ADPBDeviceOutputVoiceInfo _ad_setVoiceInfo:](v14, "_ad_setVoiceInfo:", v15);

  -[_ADPBDeviceSetDataRequest setPreviousOutputVoice:](self, "setPreviousOutputVoice:", v14);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v4 hostname]);
  -[_ADPBDeviceSetDataRequest setHostname:](self, "setHostname:", v16);

  -[_ADPBDeviceSetDataRequest setCloudSyncEnabled:](self, "setCloudSyncEnabled:", [v4 cloudSyncEnabled]);
  -[_ADPBDeviceSetDataRequest setShouldCensorSpeech:]( self,  "setShouldCensorSpeech:",  [v4 shouldCensorSpeech]);
  NSUInteger v17 = (void *)objc_claimAutoreleasedReturnValue([v4 userAgent]);
  -[_ADPBDeviceSetDataRequest setUserAgent:](self, "setUserAgent:", v17);

  -[_ADPBDeviceSetDataRequest setIsLocationSharingDevice:]( self,  "setIsLocationSharingDevice:",  [v4 isLocationSharingDevice]);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "notificationPreviewRestrictedApps", 0));
  id v19 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v33;
    do
    {
      __int128 v22 = 0LL;
      do
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v18);
        }
        -[_ADPBDeviceSetDataRequest addNotificationPreviewRestrictedApps:]( self,  "addNotificationPreviewRestrictedApps:",  *(void *)(*((void *)&v32 + 1) + 8LL * (void)v22));
        __int128 v22 = (char *)v22 + 1;
      }

      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v20);
  }

  NSUInteger v23 = (void *)objc_claimAutoreleasedReturnValue([v4 temperatureUnit]);
  -[_ADPBDeviceSetDataRequest setTemperatureUnit:](self, "setTemperatureUnit:", v23);

  NSUInteger v24 = (void *)objc_claimAutoreleasedReturnValue([v4 airplayRouteId]);
  -[_ADPBDeviceSetDataRequest setAirplayRouteId:](self, "setAirplayRouteId:", v24);

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v4 storeFrontId]);
  -[_ADPBDeviceSetDataRequest setStoreFrontId:](self, "setStoreFrontId:", v25);

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v4 ekToken]);
  -[_ADPBDeviceSetDataRequest setEkToken:](self, "setEkToken:", v26);

  NSUInteger v27 = (void *)objc_claimAutoreleasedReturnValue([v4 userToken]);
  -[_ADPBDeviceSetDataRequest setUserToken:](self, "setUserToken:", v27);

  -[_ADPBDeviceSetDataRequest setIsRemotePlaybackDevice:]( self,  "setIsRemotePlaybackDevice:",  [v4 isRemotePlaybackDevice]);
  NSUInteger v28 = (void *)objc_claimAutoreleasedReturnValue([v4 userAssignedName]);
  -[_ADPBDeviceSetDataRequest setUserAssignedName:](self, "setUserAssignedName:", v28);

  NSUInteger v29 = (void *)objc_claimAutoreleasedReturnValue([v4 utsRequiredRequestKeyValuePairs]);
  NSUInteger v30 = (void *)objc_claimAutoreleasedReturnValue( +[_ADPBDeviceStringKeyValueDictionary _ad_keyValueDictionaryWithDictionary:]( &OBJC_CLASS____ADPBDeviceStringKeyValueDictionary,  "_ad_keyValueDictionaryWithDictionary:",  v29));
  -[_ADPBDeviceSetDataRequest setUtsRequiredRequestData:](self, "setUtsRequiredRequestData:", v30);

  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v4 dataSharingOptInStatus]);
  -[_ADPBDeviceSetDataRequest setDataSharingOptInStatus:](self, "setDataSharingOptInStatus:", v31);
}

@end