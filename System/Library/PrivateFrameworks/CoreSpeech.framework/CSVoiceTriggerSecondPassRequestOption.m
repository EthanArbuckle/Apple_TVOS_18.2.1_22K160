@interface CSVoiceTriggerSecondPassRequestOption
- (BOOL)isSecondChanceRun;
- (CSVoiceTriggerFirstPassMetrics)firstpassMetrics;
- (CSVoiceTriggerRTModelRequestOptions)rtModelRequestOptions;
- (CSVoiceTriggerSecondPassRequestOption)initWithFirstPassSource:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 rejectionMHUUID:(id)a7 isSecondChanceRun:(BOOL)a8 firstpassMetrics:(id)a9 rtModelRequestOptions:(id)a10;
- (NSDictionary)firstPassTriggerInfo;
- (NSString)audioProviderUUID;
- (NSString)deviceId;
- (NSUUID)rejectionMHUUID;
- (unint64_t)firstPassSource;
@end

@implementation CSVoiceTriggerSecondPassRequestOption

- (CSVoiceTriggerSecondPassRequestOption)initWithFirstPassSource:(unint64_t)a3 deviceId:(id)a4 audioProviderUUID:(id)a5 firstPassInfo:(id)a6 rejectionMHUUID:(id)a7 isSecondChanceRun:(BOOL)a8 firstpassMetrics:(id)a9 rtModelRequestOptions:(id)a10
{
  id v29 = a4;
  id v28 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  id v19 = a10;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___CSVoiceTriggerSecondPassRequestOption;
  v20 = -[CSVoiceTriggerSecondPassRequestOption init](&v30, "init");
  v21 = v20;
  if (v20)
  {
    v20->_firstPassSource = a3;
    objc_storeStrong((id *)&v20->_deviceId, a4);
    objc_storeStrong((id *)&v21->_audioProviderUUID, a5);
    v22 = (NSDictionary *)[v16 copy];
    firstPassTriggerInfo = v21->_firstPassTriggerInfo;
    v21->_firstPassTriggerInfo = v22;

    v24 = (NSUUID *)[v17 copy];
    rejectionMHUUID = v21->_rejectionMHUUID;
    v21->_rejectionMHUUID = v24;

    v21->_isSecondChanceRun = a8;
    objc_storeStrong((id *)&v21->_firstpassMetrics, a9);
    objc_storeStrong((id *)&v21->_rtModelRequestOptions, a10);
  }

  return v21;
}

- (unint64_t)firstPassSource
{
  return self->_firstPassSource;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (NSString)audioProviderUUID
{
  return self->_audioProviderUUID;
}

- (NSDictionary)firstPassTriggerInfo
{
  return self->_firstPassTriggerInfo;
}

- (NSUUID)rejectionMHUUID
{
  return self->_rejectionMHUUID;
}

- (BOOL)isSecondChanceRun
{
  return self->_isSecondChanceRun;
}

- (CSVoiceTriggerFirstPassMetrics)firstpassMetrics
{
  return self->_firstpassMetrics;
}

- (CSVoiceTriggerRTModelRequestOptions)rtModelRequestOptions
{
  return self->_rtModelRequestOptions;
}

- (void).cxx_destruct
{
}

@end