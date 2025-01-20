@interface CSAttSiriTCUCachedObject
- (CSAttSiriTCUCachedObject)initWithTCUPackage:(id)a3 firstTRPId:(id)a4 lastTRPId:(id)a5;
- (NSString)TCUID;
- (NSString)firstTRPId;
- (NSString)lastTRPId;
- (SMTTCUPackage)TCUPackage;
- (id)description;
- (void)setFirstTRPId:(id)a3;
- (void)setLastTRPId:(id)a3;
- (void)setTCUID:(id)a3;
- (void)setTCUPackage:(id)a3;
@end

@implementation CSAttSiriTCUCachedObject

- (CSAttSiriTCUCachedObject)initWithTCUPackage:(id)a3 firstTRPId:(id)a4 lastTRPId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (os_log_s *)CSLogCategoryRequest;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[CSAttSiriTCUCachedObject initWithTCUPackage:firstTRPId:lastTRPId:]";
    __int16 v22 = 2112;
    id v23 = v10;
    __int16 v24 = 2112;
    id v25 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s lastTRPId:%@ TCUPackage:%@", buf, 0x20u);
  }

  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CSAttSiriTCUCachedObject;
  v12 = -[CSAttSiriTCUCachedObject init](&v19, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_firstTRPId, a4);
    objc_storeStrong((id *)&v13->_lastTRPId, a5);
    v14 = (SMTTCUPackage *)[v8 copy];
    TCUPackage = v13->_TCUPackage;
    v13->_TCUPackage = v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v8 tcuId]);
    TCUID = v13->_TCUID;
    v13->_TCUID = (NSString *)v16;
  }

  return v13;
}

- (id)description
{
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"{tcuId = %@, firstTRPId = %@, lastTRPId = %@,tcuPackager = %@}",  self->_TCUID,  self->_firstTRPId,  self->_lastTRPId,  self->_TCUPackage);
}

- (NSString)TCUID
{
  return self->_TCUID;
}

- (void)setTCUID:(id)a3
{
}

- (NSString)firstTRPId
{
  return self->_firstTRPId;
}

- (void)setFirstTRPId:(id)a3
{
}

- (NSString)lastTRPId
{
  return self->_lastTRPId;
}

- (void)setLastTRPId:(id)a3
{
}

- (SMTTCUPackage)TCUPackage
{
  return self->_TCUPackage;
}

- (void)setTCUPackage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end