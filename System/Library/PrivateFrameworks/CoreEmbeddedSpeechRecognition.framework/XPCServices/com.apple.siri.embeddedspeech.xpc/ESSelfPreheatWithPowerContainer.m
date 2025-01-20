@interface ESSelfPreheatWithPowerContainer
- (ASRSchemaASRPreheatContext)preheatContext;
- (ESSelfPreheatWithPowerContainer)initWithPreheatContext:(id)a3 powerSnapshot:(id)a4 powerEventContext:(id)a5;
- (SPIEventContext)powerEventContext;
- (SPIPowerLoggerSnapshot)powerSnapshot;
@end

@implementation ESSelfPreheatWithPowerContainer

- (ESSelfPreheatWithPowerContainer)initWithPreheatContext:(id)a3 powerSnapshot:(id)a4 powerEventContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ESSelfPreheatWithPowerContainer;
  v12 = -[ESSelfPreheatWithPowerContainer init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_preheatContext, a3);
    objc_storeStrong((id *)&v13->_powerSnapshot, a4);
    objc_storeStrong((id *)&v13->_powerEventContext, a5);
  }

  return v13;
}

- (ASRSchemaASRPreheatContext)preheatContext
{
  return self->_preheatContext;
}

- (SPIPowerLoggerSnapshot)powerSnapshot
{
  return self->_powerSnapshot;
}

- (SPIEventContext)powerEventContext
{
  return self->_powerEventContext;
}

- (void).cxx_destruct
{
}

@end