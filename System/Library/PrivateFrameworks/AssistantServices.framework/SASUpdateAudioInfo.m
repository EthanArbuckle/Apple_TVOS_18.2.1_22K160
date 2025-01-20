@interface SASUpdateAudioInfo
- (BOOL)ad_isDifferentFromStartSpeech:(id)a3;
- (id)ad_deferredMetricsContext;
- (void)ad_updateWithRecordingInfo:(id)a3 speechRequestOptions:(id)a4 clientConfiguration:(id)a5;
@end

@implementation SASUpdateAudioInfo

- (BOOL)ad_isDifferentFromStartSpeech:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[SASUpdateAudioInfo codec](self, "codec");
  if (v5 != [v4 codec]
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[SASUpdateAudioInfo vendorId](self, "vendorId")),
        v6,
        v6)
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[SASUpdateAudioInfo productId](self, "productId")),
        v7,
        v7))
  {
    BOOL v8 = 1;
  }

  else
  {
    unint64_t v10 = 0LL;
    v16 = "audioSource";
    v17 = "deviceIdentifier";
    v18 = "deviceModel";
    v19 = "dspStatus";
    v20 = "headsetAddress";
    v21 = "headsetId";
    BOOL v8 = 1;
    v22 = "headsetName";
    do
    {
      v11 = (&v16)[v10];
      v12 = (void *)objc_claimAutoreleasedReturnValue( -[SASUpdateAudioInfo performSelector:]( self,  "performSelector:",  v11,  v16,  v17,  v18,  v19,  v20,  v21,  v22));
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v4 performSelector:v11]);
      if (v12 == (void *)v13)
      {
      }

      else
      {
        v14 = (void *)v13;
        unsigned int v15 = [v12 isEqualToString:v13];

        if (!v15) {
          break;
        }
      }

      BOOL v8 = v10++ < 6;
    }

    while (v10 != 7);
  }

  return v8;
}

- (void)ad_updateWithRecordingInfo:(id)a3 speechRequestOptions:(id)a4 clientConfiguration:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v8 source]);
  v12 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v67 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
    __int16 v68 = 2112;
    uint64_t v69 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s audioSource = %@", buf, 0x16u);
  }

  -[SASUpdateAudioInfo setAudioSource:](self, "setAudioSource:", v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 destination]);
  v14 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v67 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
    __int16 v68 = 2112;
    uint64_t v69 = (uint64_t)v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s audioDestination = %@", buf, 0x16u);
  }

  -[SASUpdateAudioInfo setAudioDestination:](self, "setAudioDestination:", v13);
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v8 codec]);
  -[SASUpdateAudioInfo setCodec:](self, "setCodec:", SASCodecForString());

  v16 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceIdentifier]);
  -[SASUpdateAudioInfo setDeviceIdentifier:](self, "setDeviceIdentifier:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v8 modelName]);
  -[SASUpdateAudioInfo setDeviceModel:](self, "setDeviceModel:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue([v8 dspStatus]);
  -[SASUpdateAudioInfo setDspStatus:](self, "setDspStatus:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue([v8 headsetAddress]);
  -[SASUpdateAudioInfo setHeadsetAddress:](self, "setHeadsetAddress:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue([v8 headsetName]);
  -[SASUpdateAudioInfo setHeadsetName:](self, "setHeadsetName:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue([v8 productId]);
  -[SASUpdateAudioInfo setProductId:](self, "setProductId:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue([v8 vendorId]);
  -[SASUpdateAudioInfo setVendorId:](self, "setVendorId:", v22);

  -[SASUpdateAudioInfo setTriggeredTwoShotBorealis:]( self,  "setTriggeredTwoShotBorealis:",  [v8 triggeredTwoShotBorealis]);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SASUpdateAudioInfo recordingInfo](self, "recordingInfo"));
  id v24 = [v23 copy];

  if (!v24) {
    id v24 = objc_alloc_init(&OBJC_CLASS___SASRecordingInfo);
  }
  id v25 = v9;
  uint64_t v62 = v11;
  id v64 = v10;
  id v26 = [v10 deviceRingerSwitchState];
  v27 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    v28 = v27;
    uint64_t Name = AFDeviceRingerSwitchStateGetName(v26);
    v30 = (void *)objc_claimAutoreleasedReturnValue(Name);
    *(_DWORD *)buf = 136315394;
    v67 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
    __int16 v68 = 2112;
    uint64_t v69 = (uint64_t)v30;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%s deviceRingerSwitchState = %@", buf, 0x16u);

    id v9 = v25;
  }

  if (v26)
  {
    v31 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v67 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
      __int16 v68 = 1024;
      LODWORD(v69) = v26 != (id)1;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "%s SASRecordingInfo.ringerSwitchOff = %d",  buf,  0x12u);
    }

    [v24 setRingerSwitchOff:v26 != (id)1];
    char v32 = 1;
  }

  else
  {
LABEL_14:
    char v32 = 0;
  }

  id v33 = objc_msgSend(v8, "audioAlertStyle", v62, v64);
  if (!v33) {
    goto LABEL_32;
  }
  v34 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v67 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
    __int16 v68 = 2048;
    uint64_t v69 = (uint64_t)v33;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "%s audioAlertStyle = %ld", buf, 0x16u);
  }

  if (v33 == (id)1)
  {
    v35 = (id *)&SASRecordingInfoAlertTypeNoneValue;
  }

  else if (v33 == (id)3)
  {
    int v36 = AFHasHapticEngine();
    v35 = (id *)&SASRecordingInfoAlertTypeVibrationValue;
    if (v36) {
      v35 = (id *)&SASRecordingInfoAlertTypeHapticValue;
    }
  }

  else
  {
    if (v33 != (id)2)
    {
      id v37 = 0LL;
      goto LABEL_27;
    }

    v35 = (id *)&SASRecordingInfoAlertTypeBeepValue;
  }

  id v37 = *v35;
LABEL_27:
  v38 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v67 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
    __int16 v68 = 2112;
    uint64_t v69 = (uint64_t)v37;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s SASRecordingInfo.alertType = %@", buf, 0x16u);
  }

  if (v37)
  {
    [v24 setAlertType:v37];
    char v32 = 1;
  }

  id v9 = v25;
LABEL_32:
  [v8 firstBufferTimestamp];
  if (v39 <= 0.0) {
    goto LABEL_58;
  }
  double v40 = v39;
  v41 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v67 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
    __int16 v68 = 2048;
    uint64_t v69 = *(void *)&v40;
    _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_INFO,  "%s firstBufferTimestamp (baseline) = %f",  buf,  0x16u);
  }

  if ([v9 activationEvent] == (id)1)
  {
    [v9 homeButtonDownEventTime];
    double v43 = v42;
    v44 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v67 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
      __int16 v68 = 2048;
      uint64_t v69 = *(void *)&v43;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "%s homeButtonDownTimestamp = %f", buf, 0x16u);
    }

    if (v43 > 0.0)
    {
      v45 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v67 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
        __int16 v68 = 2048;
        uint64_t v69 = (uint64_t)((v43 - v40) * 1000.0);
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_INFO,  "%s SASRecordingInfo.buttonDowntime = %llu",  buf,  0x16u);
      }

      v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  (uint64_t)((v43 - v40) * 1000.0)));
      [v24 setButtonDowntime:v46];

      char v32 = 1;
      id v9 = v25;
    }
  }

  [v8 startRecordingTimestamp];
  double v48 = v47;
  v49 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v67 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
    __int16 v68 = 2048;
    uint64_t v69 = *(void *)&v48;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "%s startRecordingTimestamp = %f", buf, 0x16u);
  }

  if (v48 > 0.0)
  {
    v50 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v67 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
      __int16 v68 = 2048;
      uint64_t v69 = (uint64_t)((v48 - v40) * 1000.0);
      _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_INFO,  "%s SASRecordingInfo.activationTime = %llu",  buf,  0x16u);
    }

    v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  (uint64_t)((v48 - v40) * 1000.0)));
    [v24 setActivationTime:v51];

    v52 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v67 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
      __int16 v68 = 1024;
      LODWORD(v69) = v40 < v48;
      _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_INFO,  "%s SASRecordingInfo.zeroLatencyLaunch = %d",  buf,  0x12u);
    }

    [v24 setZeroLatencyLaunch:v40 < v48];
    char v32 = 1;
    id v9 = v25;
  }

  [v8 activationAlertStartTimestamp];
  double v54 = v53;
  v55 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v67 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
    __int16 v68 = 2048;
    uint64_t v69 = *(void *)&v54;
    _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_INFO,  "%s activationAlertStartTimestamp = %f",  buf,  0x16u);
  }

  if (v54 <= 0.0) {
    goto LABEL_58;
  }
  uint64_t v56 = (uint64_t)((v54 - v40) * 1000.0);
  if (v33 == (id)3)
  {
    v61 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v67 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
      __int16 v68 = 2048;
      uint64_t v69 = (uint64_t)((v54 - v40) * 1000.0);
      _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_INFO,  "%s SASRecordingInfo.activationHapticAlertStartTime = %llu",  buf,  0x16u);
    }

    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v56));
    [v24 setActivationHapticAlertStartTime:v58];
    goto LABEL_63;
  }

  if (v33 != (id)2)
  {
LABEL_58:
    v60 = v63;
    v59 = v65;
    if ((v32 & 1) == 0) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }

  v57 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v67 = "-[SASUpdateAudioInfo(ADSAExtensions) ad_updateWithRecordingInfo:speechRequestOptions:clientConfiguration:]";
    __int16 v68 = 2048;
    uint64_t v69 = (uint64_t)((v54 - v40) * 1000.0);
    _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_INFO,  "%s SASRecordingInfo.activationAudioAlertStartTime = %llu",  buf,  0x16u);
  }

  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v56));
  [v24 setActivationAudioAlertStartTime:v58];
LABEL_63:

  v60 = v63;
  v59 = v65;
LABEL_64:
  -[SASUpdateAudioInfo setRecordingInfo:](self, "setRecordingInfo:", v24);
LABEL_65:
}

- (id)ad_deferredMetricsContext
{
  v13.receiver = self;
  v13.super_class = &OBJC_CLASS___SASUpdateAudioInfo;
  id v3 = -[SASUpdateAudioInfo ad_deferredMetricsContext](&v13, "ad_deferredMetricsContext");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SASUpdateAudioInfo audioSource](self, "audioSource"));
  if (v5) {
    [v4 setObject:v5 forKey:SASUpdateAudioInfoAudioSourcePListKey];
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SASUpdateAudioInfo origin](self, "origin"));
  if (v6) {
    [v4 setObject:v6 forKey:SASUpdateAudioInfoOriginPListKey];
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SASUpdateAudioInfo headsetAddress](self, "headsetAddress"));
  if (v7) {
    [v4 setObject:v7 forKey:SASUpdateAudioInfoHeadsetAddressPListKey];
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SASUpdateAudioInfo headsetId](self, "headsetId"));
  if (v8) {
    [v4 setObject:v8 forKey:SASUpdateAudioInfoHeadsetIdPListKey];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SASUpdateAudioInfo headsetName](self, "headsetName"));
  if (v9) {
    [v4 setObject:v9 forKey:SASUpdateAudioInfoHeadsetNamePListKey];
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SASUpdateAudioInfo vendorId](self, "vendorId"));
  if (v10) {
    [v4 setObject:v10 forKey:SASUpdateAudioInfoVendorIdPListKey];
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SASUpdateAudioInfo productId](self, "productId"));
  if (v11) {
    [v4 setObject:v11 forKey:SASUpdateAudioInfoProductIdPListKey];
  }

  return v4;
}

@end