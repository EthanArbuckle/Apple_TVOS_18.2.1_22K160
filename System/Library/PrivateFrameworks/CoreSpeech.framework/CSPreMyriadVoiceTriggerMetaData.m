@interface CSPreMyriadVoiceTriggerMetaData
- (BOOL)isSecondPassRunning;
- (CSPreMyriadVoiceTriggerMetaData)init;
- (NSString)deviceId;
- (float)firstPassMyriadGoodnessScore;
- (void)setDeviceId:(id)a3;
- (void)setFirstPassMyriadGoodnessScore:(float)a3;
- (void)setIsSecondPassRunning:(BOOL)a3;
@end

@implementation CSPreMyriadVoiceTriggerMetaData

- (CSPreMyriadVoiceTriggerMetaData)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSPreMyriadVoiceTriggerMetaData;
  result = -[CSPreMyriadVoiceTriggerMetaData init](&v3, "init");
  if (result) {
    result->_firstPassMyriadGoodnessScore = -1.0;
  }
  return result;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
}

- (BOOL)isSecondPassRunning
{
  return self->_isSecondPassRunning;
}

- (void)setIsSecondPassRunning:(BOOL)a3
{
  self->_isSecondPassRunning = a3;
}

- (float)firstPassMyriadGoodnessScore
{
  return self->_firstPassMyriadGoodnessScore;
}

- (void)setFirstPassMyriadGoodnessScore:(float)a3
{
  self->_firstPassMyriadGoodnessScore = a3;
}

- (void).cxx_destruct
{
}

@end